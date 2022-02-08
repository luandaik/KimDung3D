-- client side BiaoCheSignUpLayer.lua
--[[
 * @Description: 镖车信息
 ]]
-- script writer chikui


local BiaoCheSignUpLayer = class("BiaoCheSignUpLayer",BaseLayer)

function BiaoCheSignUpLayer:ctor(data)

    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.faction.BiaocheBaoMing")
end

function BiaoCheSignUpLayer:initUI( ui )

    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')
    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.BiaoChe,{HeadResType.SYCEE})

    self.img_biaoche = TFDirector:getChildByPath(ui, 'img_biaoche')
    self.img_level = TFDirector:getChildByPath(ui, 'img_level')
    self.btn_guizhe = TFDirector:getChildByPath(ui, 'btn_guizhe')
    self.btn_jiangli = TFDirector:getChildByPath(ui, 'btn_jiangli')
    self.btn_bcsj = TFDirector:getChildByPath(ui, 'btn_bcsj')
    self.btn_fszr = TFDirector:getChildByPath(ui, 'btn_fszr')
    self.btn_baoming = TFDirector:getChildByPath(ui, 'btn_baoming')
    self.txt_time = TFDirector:getChildByPath(ui, 'txt_time')
    self.EndDesTime = ConstantData:objectByID("EscortAgencyStartBattle").value
    
    local funcBrushTime = function()
        self:brushTime()
    end
    self.updateTimerID = TFDirector:addTimer(1000, -1, nil,funcBrushTime)
    self:brushTime()
end

function BiaoCheSignUpLayer:setInfo( carInfo )
    self.carInfo = carInfo
    self:refreshUI()
    self:brushConverge()
end


function BiaoCheSignUpLayer:brushTime()
    local date = GetCorrectDate("*t", MainPlayer:getNowtime())
    if date.wday == 1 then
        date.wday = 8
    end
    local wday = date.wday - 2

    local nowTime = wday*(24*60*60) + (date.hour*60 + date.min)*60 + date.sec

    local leftTime = self.EndDesTime - nowTime
    if leftTime < 0 then
        leftTime = 0
    end
    local hour = math.floor(leftTime/3600)
    leftTime = leftTime - hour * 3600
    local min = math.floor(leftTime/60)
    local sec = leftTime - min * 60
    self.txt_time:setText(string.format("%02d:%02d:%02d",hour,min,sec))
end

function BiaoCheSignUpLayer:removeUI()
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self.super.removeUI(self)
end

function BiaoCheSignUpLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();
    self:refreshUI()
end

function BiaoCheSignUpLayer:refreshUI()
    local quality = BiaoCheManager:getMyCarQuality()
    self.img_biaoche:setTexture('ui_new/faction/biaoche/img_biaoche'..quality..'.png')
    local pathList = {
        'ui_new/faction/biaoche/img_normalbc.png',
        'ui_new/faction/biaoche/img_kuaisubc.png',
        'ui_new/faction/biaoche/img_jisubc.png',
        'ui_new/faction/biaoche/img_shensubc.png'
    }
    self.img_level:setTexture(pathList[quality])
    if quality <= 1 then
        self.btn_bcsj:setVisible(true)
    else
        self.btn_bcsj:setVisible(false)
    end
end

function BiaoCheSignUpLayer.onRuleClick( sender )
    CommonManager:showRuleLyaer('biaoxingtianxia1')
end

function BiaoCheSignUpLayer.onRewardClick( sender )
    BiaoCheManager:openRewardLayer()
end

function BiaoCheSignUpLayer.onUpgradeCarClick( sender )
    BiaoCheManager:openShengjiLayer()
end

function BiaoCheSignUpLayer.onDefenceArmyClick( sender )
    ZhengbaManager:openArmyLayer(EnumFightStrategyType.StrategyType_AREAN)
end

function BiaoCheSignUpLayer.onSignUpClick( sender )
    BiaoCheManager:requestSignUpInfo()
end

function BiaoCheSignUpLayer:registerEvents()
    self.super.registerEvents(self)

    self.btn_guizhe:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRewardClick))
    self.btn_jiangli:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRuleClick))
    self.btn_bcsj:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onUpgradeCarClick))
    self.btn_fszr:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onDefenceArmyClick))
    self.btn_baoming:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignUpClick))

    if self.generalHead then
        self.generalHead:registerEvents()
    end
end

function BiaoCheSignUpLayer:removeEvents()
    if self.generalHead then
        self.generalHead:removeEvents()
    end
    self.super.removeEvents(self)
end

return BiaoCheSignUpLayer