
-- client side TrusteeshipLayer.lua
--[[
 * @Description: 一键托管
 ]]
-- script writer Happy.All
-- creation time 2016-08-19


local TrusteeshipLayer = class("TrusteeshipLayer",BaseLayer)

function TrusteeshipLayer:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.mission.OneKey")
end

function TrusteeshipLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.panel_onekey = TFDirector:getChildByPath(ui, "panel_onekey")
    self.img_di = TFDirector:getChildByPath(ui, "img_di")
    self.img_txt = TFDirector:getChildByPath(ui, "img_txt")
    self.img_txt:setVisible(false)

    self.img_di:setTouchEnabled(true)
    self.ui:setTouchEnabled(true)
end


function TrusteeshipLayer:removeUI()
	self.super.removeUI(self)
end

function TrusteeshipLayer:onShow()
    self.super.onShow(self)
end

function TrusteeshipLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)

    self.img_di.logic = self
    self.img_di:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onStopClickHandle))

    self.registerEventCallFlag = true 
end

function TrusteeshipLayer:removeEvents()

    self.super.removeEvents(self)

    if self.handleTimer then
        TFDirector:removeTimer(self.handleTimer)
        self.handleTimer = nil
    end
    self.registerEventCallFlag = nil  
end

function TrusteeshipLayer:dispose()
	self.super.dispose(self)
end

function TrusteeshipLayer:setType( desLayer, needTimer )

    if self.handleTimer then
        TFDirector:removeTimer(self.handleTimer)
        self.handleTimer = nil
    end

    if self.trustOneKeyEffect == nil then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/trustOneKey.xml")
        local effect = TFArmature:create("trustOneKey_anim")
        effect:setVisible(true)
        effect:playByIndex(0, -1, -1, -1)
        local size = self.img_di:getContentSize()
        effect:setPosition(size.width/2, size.height/2)
        self.img_di:addChild(effect) 
        self.trustOneKeyEffect = effect
    end
    self.trustOneKeyEffect:playByIndex(0, -1, -1, -1)
    if needTimer ~= true then
        return
    end

    local clickToNextStep = function ()
        if self.handleTimer then
            TFDirector:removeTimer(self.handleTimer)
            self.handleTimer = nil
        end
        -- if Public:currentScene().__cname  == 'HomeScene' then
        --     AlertManager:close()
        -- end
        MissionManager:closeTrustOnekeyLayer()
        desLayer:onClickHandleForTrustLayer()
    end
    local second = ConstantData:objectByID("YiJianTuoGuanTime").value or 1000
    self.handleTimer = TFDirector:addTimer(second, 1, clickToNextStep)
end

function TrusteeshipLayer.onStopClickHandle( btn )
    local self = btn.logic
    if self.handleTimer then
        TFDirector:removeTimer(self.handleTimer)
        self.handleTimer = nil
    end
    MissionManager:stopTrustOnekey()
end

return TrusteeshipLayer