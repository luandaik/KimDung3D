--[[
******帮派主界面*******

	-- by quanhuan
	-- 2015/10/23
	
]]

local FactionHomeLayer = class("FactionHomeLayer",BaseLayer)

function FactionHomeLayer:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.FactionHomeLayer")
end

function FactionHomeLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.Faction,{HeadResType.FACTION_GX,HeadResType.COIN,HeadResType.SYCEE}, true) 

    self.Panel_List = TFDirector:getChildByPath(ui, "Panel_List")    
    -- self.Bg = TFDirector:getChildByPath(ui, "Bg")
    self.Bg = TFDirector:getChildByPath(ui, "Panel_title")    
    self.Bg:setTouchEnabled(true)
    self.Bg:setSwallowTouch(false)
    self.panelMinX = self.Panel_List:getPositionX() - (2114-88-self.ui:getContentSize().width)
    self.panelMaxX = self.Panel_List:getPositionX()

    self.btn_redpacket = TFDirector:getChildByPath(ui, "btn_hongbao")
    self.btn_redpacketH = TFDirector:getChildByPath(ui, 'btn_hyhb')
    self.btn_rpget = TFDirector:getChildByPath(ui, "btn_linghongbao")
    self.btn_zyt = TFDirector:getChildByPath(ui, "btn_zyt")
    self.point_zyt = TFDirector:getChildByPath(self.btn_zyt, "img_biaoti")

    self.btn_jyt = TFDirector:getChildByPath(ui, "btn_jyt")
    self.point_jyt = TFDirector:getChildByPath(self.btn_jyt, "img_biaoti")    

    self.btn_zbg = TFDirector:getChildByPath(ui, "btn_zbg")
    self.point_zbg = TFDirector:getChildByPath(self.btn_zbg, "img_biaoti")    

    self.btn_xlc = TFDirector:getChildByPath(ui, "btn_xlc")
    self.point_xlc = TFDirector:getChildByPath(self.btn_xlc, "img_biaoti")  

    self.btn_df = TFDirector:getChildByPath(ui, "btn_df")
    self.point_df = TFDirector:getChildByPath(self.btn_df, "img_biaoti")
    self.btn_df:setVisible(FactionManager:isShowDanFang())

    local verLock = VersionLockData:objectByID(EnumVersionLockType.Practice_Lock)
    if verLock and verLock.open == 0 then
        self.btn_xlc:setVisible(false)
    end

    self.btn_hs = TFDirector:getChildByPath(ui, "btn_hs")
    self.point_hs = TFDirector:getChildByPath(self.btn_hs, "img_biaoti")  
    local verLock = VersionLockData:objectByID(EnumVersionLockType.FactionHouShan_Lock)
    if verLock and verLock.open == 0 then
        self.btn_hs:setVisible(false)
    end

    self.btn_bangpaizhan = TFDirector:getChildByPath(ui, "btn_bangpaizhan")
    self.point_bangpaizhan = TFDirector:getChildByPath(self.btn_bangpaizhan, "img_biaoti")  
    local verLock = VersionLockData:objectByID(EnumVersionLockType.FactionFight_Lock)
    if verLock and verLock.open == 0 then
        self.btn_bangpaizhan:setVisible(false)
    end
    self.btn_jst = TFDirector:getChildByPath(ui, "btn_jst")
    -- self.btn_jst_img_biaoti         = TFDirector:getChildByPath(self.btn_jst, "img_biaot")
    self.point_btn_jst= TFDirector:getChildByPath(self.btn_jst, "img_biaoti")  

    self.Btn_jhp = TFDirector:getChildByPath(ui, "Btn_jhp")
    self.Btn_gonggao = TFDirector:getChildByPath(ui, "Btn_gonggao")
    self.panelMsg = TFDirector:getChildByPath(ui, "panel_msg")

    self.txtName = TFDirector:getChildByPath(ui, "txt_name")
    self.level = TFDirector:getChildByPath(ui, "txt_level")
    self.txt_exp = TFDirector:getChildByPath(ui, "txt_exp")
    self.expBar = TFDirector:getChildByPath(ui, "bar_exp")
    self.fanrong = TFDirector:getChildByPath(ui, "txt_fangrong")
    self.gongxian = TFDirector:getChildByPath(ui, "txt_gongxian")
    self.gonggao = TFDirector:getChildByPath(ui, "Label_FactionHomeLayer_1")
    self.btn_ywc = TFDirector:getChildByPath(ui, "btn_ywc")
    if GuildBossManager:getServerSwitch() == true then
        self.btn_ywc:setVisible(true)
    else
        self.btn_ywc:setVisible(false)
    end
    --策划说写死二级就好
    if MainPlayer:getServerSwitchStatue(ServerSwitchType.ActiveRedPacket) == true then
        self.btn_redpacketH:setVisible(true)
    else
        self.btn_redpacketH:setVisible(false)
    end
    -- local panelArrowNode = TFDirector:getChildByPath(ui, 'panel_arrow')
    self.imgArrow = TFDirector:getChildByPath(ui, "img_jiantou")
    self.btn_buff3 = TFDirector:getChildByPath(ui, "btn_buff3")
    self.txt_buff3 = TFDirector:getChildByPath(self.btn_buff3, "txt_num")
    self.btn_buff3:setVisible(false)


    self.expBar:setDirection(TFLOADINGBAR_LEFT)
    self.expBar:setPercent(0)
    self.expBar:setVisible(true)  

    self.fontPosition = self.gonggao:getPosition()

    self:showArrowAnim(self.imgArrow, self.imgArrow:getPosition())

    FactionManager:initGonggaoView()

    local acArr = TFVector:create()
    local delayAc = CCDelayTime:create(0.4)
    acArr:addObject(delayAc)
    local scaleAc = CCScaleTo:create(0.1,1.3)
    acArr:addObject(scaleAc)
    scaleAc = CCScaleTo:create(0.1,1)
    acArr:addObject(scaleAc)
   
    local seq = CCSequence:create(acArr)
    self.btn_rpget:runAction(CCRepeatForever:create(seq))
    self.btn_buff3:setVisible(false)
    self.txt_buff3:setVisible(false)

    
end


function FactionHomeLayer:removeUI()
	self.super.removeUI(self)
end

function FactionHomeLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()

    if FactionManager:isNeedPopNotice() then
        local content = FactionManager:getNoticeContent()
        FactionManager:newNoticeShow()
        local layer  = require("lua.logic.faction.FactionNoticeLayer"):new()
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
        layer:setContentText(content)
        AlertManager:show()
    end
    self:refreshWindow()
    self.btn_rpget:setVisible(RedPacketManager:checkRedPoint())
end

function FactionHomeLayer:registerEvents()

	self.super.registerEvents(self)
    self.isFirstIn = true

    if self.generalHead then
        self.generalHead:registerEvents()
    end
    self.btn_buff3:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnBuffClick))
    self.btn_buff3.logic = self
    self.btn_redpacket:addMEListener(TFWIDGET_CLICK, audioClickfun(self.rpButtonClick))
    self.btn_redpacketH:addMEListener(TFWIDGET_CLICK, audioClickfun(self.rpButtonClick1))
    self.btn_rpget:addMEListener(TFWIDGET_CLICK, audioClickfun(self.rpgetButtonClick))
    self.btn_zyt:addMEListener(TFWIDGET_CLICK, audioClickfun(self.zytButtonClick))
    self.btn_jyt:addMEListener(TFWIDGET_CLICK, audioClickfun(self.jytButtonClick))
    self.btn_df:addMEListener(TFWIDGET_CLICK, audioClickfun(self.dfButtonClick))
    self.btn_zbg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.zbgButtonClick))
    self.btn_xlc:addMEListener(TFWIDGET_CLICK, audioClickfun(self.xlcButtonClick))
    self.btn_hs:addMEListener(TFWIDGET_CLICK, audioClickfun(self.hsButtonClick))
    self.btn_bangpaizhan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.fightButtonClick))
    self.Btn_jhp:addMEListener(TFWIDGET_CLICK, audioClickfun(self.jhpButtonClick))
    self.btn_jst:addMEListener(TFWIDGET_CLICK, audioClickfun(self.jishitangClick))
    self.Btn_gonggao:addMEListener(TFWIDGET_CLICK, audioClickfun(self.gonggaoButtonClick))
    self.Btn_gonggao.logic = self  
    self.btn_ywc:addMEListener(TFWIDGET_CLICK, audioClickfun(self.ywcButtonClick))
    self.btn_ywc.logic = self  

    FactionManager:addLayerInFaction()

    -- FactionManager:requestMemberInfo()
    -- local post = FactionManager:getPostInFaction()
    -- if post == 1 or post == 2 then
    --     FactionManager:requestOtherMemberList()
    -- end

    self.updateRedPointCallBack = function (event)
        self:refreshWindow()
    end
    TFDirector:addMEGlobalListener(FactionManager.updateRedPoint, self.updateRedPointCallBack)  

    self.brushAttriBuff = function (event)
        self:refreshBuffShow()
    end
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_FACTION_RANK, self.brushAttriBuff)  

    self.guildNotExistCallBack = function (event)
        if FactionManager.layerCount then
            AlertManager:closeAll()
            FactionManager:initPersonalInfo(0, 3)
            FactionManager:exitAndClearData()            
        end
    end
    TFDirector:addMEGlobalListener(FactionManager.guildNotExist, self.guildNotExistCallBack)  

    --
    --滑动事件监听，切换装备
    function onTouchBegin(widget,pos,offset)        
        self.touchBeginPos = pos
        -- print('onTouchBegin = ',pos)
    end

    function onTouchMove(widget,pos,offset)
        local Dx = pos.x - self.touchBeginPos.x
        local currX = self.Panel_List:getPositionX() + Dx
        if currX < self.panelMinX then
            currX = self.panelMinX
        elseif currX > self.panelMaxX then
            currX = self.panelMaxX
        end
        self.Panel_List:setPositionX(currX)
        self.touchBeginPos = pos

        if (self.panelMaxX - currX) < 200 then
            self.imgArrow:setVisible(true)
        else
            self.imgArrow:setVisible(false)
        end
    end

    function onTouchEnd(widget,pos)

    end

    self.Bg:addMEListener(TFWIDGET_TOUCHBEGAN, onTouchBegin)
    self.Bg:addMEListener(TFWIDGET_TOUCHMOVED, onTouchMove)
    self.Bg:addMEListener(TFWIDGET_TOUCHENDED, onTouchEnd)
end

function FactionHomeLayer:removeEvents()

	if self.generalHead then
        self.generalHead:removeEvents()
    end
 	
 	self.btn_zyt:removeMEListener(TFWIDGET_CLICK)
    self.btn_jyt:removeMEListener(TFWIDGET_CLICK)
    self.btn_df:removeMEListener(TFWIDGET_CLICK)
    self.btn_zbg:removeMEListener(TFWIDGET_CLICK)
    self.btn_xlc:removeMEListener(TFWIDGET_CLICK)
    self.btn_hs:removeMEListener(TFWIDGET_CLICK)
    self.Btn_jhp:removeMEListener(TFWIDGET_CLICK)
    self.Btn_gonggao:removeMEListener(TFWIDGET_CLICK)
    self.btn_jst:removeMEListener(TFWIDGET_CLICK)

    if self.fontDelayTime then
        TFDirector:removeTimer(self.fontDelayTime)
        self.fontDelayTime = nil
    end
    if self.fontMoveTime then
        TFDirector:removeTimer(self.fontMoveTime)
        self.fontMoveTime = nil
    end    

    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(FactionManager.updateRedPoint, self.updateRedPointCallBack)  
    self.updateRedPointCallBack = nil
    TFDirector:removeMEGlobalListener(FactionManager.guildNotExist, self.guildNotExistCallBack) 
    self.guildNotExistCallBack = nil
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_FACTION_RANK, self.brushAttriBuff)

    FactionManager:deleteLayerInFaction()    
end

function FactionHomeLayer:dispose()
	self.super.dispose(self)
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
end
function FactionHomeLayer:refreshWindow()
    local personalInfo = FactionManager:getPersonalInfo() or {}
    if personalInfo.guildId == nil or personalInfo.guildId == 0 then
        return
    end

    if FactionManager:getGonggaoView() then
        self.panelMsg:setVisible(true)
        self:moveFont()
    else
        if self.fontDelayTime then
            TFDirector:removeTimer(self.fontDelayTime)
            self.fontDelayTime = nil
        end
        if self.fontMoveTime then
            TFDirector:removeTimer(self.fontMoveTime)
            self.fontMoveTime = nil
        end
        self.panelMsg:setVisible(false)     
    end

    local factionInfo = FactionManager:getFactionInfo()
    if factionInfo then
        self.txtName:setText(factionInfo.name)
        print("factionInfo = ",factionInfo)
        self.level:setText(factionInfo.level..'d')
        local currExp = factionInfo.exp
        local totalExp = FactionManager:getFactionLevelUpExp(factionInfo.level+1)    --需要读表
        self.txt_exp:setText(currExp.."/"..totalExp)
        self.expBar:setPercent(math.floor(currExp*100/totalExp))
        self.fanrong:setText(factionInfo.boom)
        self.gonggao:setText(factionInfo.notice)

        
        CommonManager:setRedPoint(self.Btn_gonggao, FactionManager.noticeRed ,"isHaveCanZhaomu",ccp(0,0)) 
    end
    -- local personalInfo = FactionManager:getPersonalInfo()
    if personalInfo then
        self.gongxian:setText(MainPlayer:getDedication())
    end

    CommonManager:setRedPoint(self.point_jyt, FactionManager:canViewRedPointInHomeLayer() ,"isHaveCanZhaomu",ccp(0,0))  
    CommonManager:setRedPoint(self.point_zyt, FactionManager:canRedPointWorShip(),"isHaveCanZhaomu",ccp(0,0))   
    CommonManager:setRedPoint(self.point_hs, FactionManager:canRedPointHouShan(),"isRedHouShan",ccp(0,0))  
    CommonManager:setRedPoint(self.point_xlc, FactionPracticeManager:canRedPointPractice(),"isRedPractice",ccp(0,0))
    CommonManager:setRedPoint(self.btn_jst, FactionJiShiTangManager:getRedPiontStatus(),"isRedJishitang",ccp(-120,15))
    CommonManager:setRedPoint(self.btn_ywc, GuildBossManager:checkRedPoint(),"isRedYWC",ccp(-225,0))
    CommonManager:setRedPoint(self.btn_redpacketH, RedPacketManager:checkMenuRedPoint(),ccp(0, 0))
    CommonManager:setRedPoint(self.point_df, FactionDanFangManager:getRedPointInfo(),"isHaveCanZhaomu",ccp(0,0))   

end

function FactionHomeLayer:moveFont()

    if self.fontDelayTime then
        TFDirector:removeTimer(self.fontDelayTime)
        self.fontDelayTime = nil
    end
    if self.fontMoveTime then
        TFDirector:removeTimer(self.fontMoveTime)
        self.fontMoveTime = nil
    end


    local factionInfo = FactionManager:getFactionInfo()
    local prevTxt = self.gonggao:getText()

    if string.len(prevTxt) ~= string.len(factionInfo.notice) then
        self.gonggao:setPosition(self.fontPosition)
    end
    self.gonggao:setText(factionInfo.notice)
    
    
    local clipSize = self.panelMsg:getContentSize().width
    local fontSize = self.gonggao:getContentSize().width + math.ceil(clipSize/2 + self.gonggao:getPositionX())

    if clipSize < fontSize then
        local moveX = 10
        local times = math.ceil((fontSize - clipSize)/10)

        local function fontMove()
            if self.fontDelayTime then
                TFDirector:removeTimer(self.fontDelayTime)
                self.fontDelayTime = nil
            end
            self.gonggao:setPosition(self.fontPosition)
            self.fontDelayTime = TFDirector:addTimer(1000, 1, function ()  
                if self.fontDelayTime then
                    TFDirector:removeTimer(self.fontDelayTime)
                    self.fontDelayTime = nil
                end              
                self.fontMoveTime = TFDirector:addTimer(300, times, 
                function()
                    --移动结束开始延迟
                    if self.fontMoveTime then
                        TFDirector:removeTimer(self.fontMoveTime)
                        self.fontMoveTime = nil
                    end
                    self.fontDelayTime = TFDirector:addTimer(1000, 1, fontMove,nil)
                end,
                function()
                    --每次进来
                    local currX = self.gonggao:getPositionX()
                    currX = currX - 10
                    self.gonggao:setPositionX(currX)
                end)
            end,nil)
        end
        fontMove()
    end
end
function FactionHomeLayer.zytButtonClick( btn )
    -- toastMessage("即将开放，敬请期待！")
    FactionManager:openZhongYiLayer()
end

function FactionHomeLayer.jytButtonClick( btn )
	FactionManager:openFactinoBaseLayer()
end

function FactionHomeLayer.dfButtonClick( btn )
    FactionDanFangManager:sendDanFangInfo()
end
function FactionHomeLayer.zbgButtonClick( btn )
    local openLevel = FactionManager:getShopOpenLevel()
    if openLevel == 0 then
        --toastMessage("即将开放，敬请期待！")
        toastMessage(localizable.common_open_tips1)
        return
    elseif FactionManager.factionInfo.level < openLevel then
        --toastMessage("珍宝阁需要帮派等级"..openLevel.."级")
        toastMessage(stringUtils.format(localizable.factionHomeLayer_openlevel,openLevel))
        return
    end
    MallManager:openFactionMallLayer()
end
function FactionHomeLayer.xlcButtonClick( btn )
    -- toastMessage("即将开放，敬请期待！")
    FactionPracticeManager:enterXiulianCLayer()
end
function FactionHomeLayer.hsButtonClick( btn )
    -- toastMessage("即将开放，敬请期待！")
    FactionManager:enterHoushanLayer()
end
function FactionHomeLayer.fightButtonClick( btn )
    FactionFightManager:openCurrLayer()
end
function FactionHomeLayer.jhpButtonClick( btn )
    FactionManager:openFactionRankLayer()
end

function FactionHomeLayer.jishitangClick( btn )
    FactionJiShiTangManager:openJiShiTameMainLayer()
end
function FactionHomeLayer.rpButtonClick1( btn )
    if FactionManager:getFactionInfo().level < 2 then
        toastMessage(localizable.RedPacket_dengji)
        return
    end
    if MainPlayer:getServerSwitchStatue(ServerSwitchType.ActiveRedPacket) == false then
        return
    end
    RedPacketManager:requestGetActivityRedPacket()
    RedPacketManager:openHuoYueMainLayer()
end

function FactionHomeLayer.rpButtonClick( btn )
    RedPacketManager:openMainLayer()
end

function FactionHomeLayer.rpgetButtonClick( btn )
    ChatManager:openMainLayer(2)
end

function FactionHomeLayer.ywcButtonClick( btn )
    if GuildBossManager:getServerSwitch() == false then
        return
    end
    local openLevel = ConstantData:objectByID("GuildBoss.OpenLevel").value
    local factionInfo = FactionManager:getFactionInfo()
    if factionInfo.level < openLevel then
        toastMessage(localizable.GuildBoss_open_level_tip)
        return
    end
    GuildBossManager:openMainLayer()
end

function FactionHomeLayer.gonggaoButtonClick( btn )

    local self = btn.logic

    if FactionManager:getGonggaoView() then
        FactionManager:setGonggaoView(false)
        self.panelMsg:setVisible(false)
        if self.fontDelayTime then
            TFDirector:removeTimer(self.fontDelayTime)
            self.fontDelayTime = nil
        end
        if self.fontMoveTime then
            TFDirector:removeTimer(self.fontMoveTime)
            self.fontMoveTime = nil
        end
    else
        -- FactionManager:requestFactionInfo()
        self.gonggao:setPosition(self.fontPosition)
        FactionManager.noticeRed = false
        CommonManager:setRedPoint(self.Btn_gonggao, false ,"isHaveCanZhaomu",ccp(0,0)) 
        FactionManager:setGonggaoView(true)
        self.panelMsg:setVisible(true)     
        self:moveFont()
    end
end

function FactionHomeLayer:showArrowAnim(sender,pos)

    local btnTween = 
    {
        target = sender,
        repeated = -1,
        {
            duration = 1,
            x = pos.x + 10,
            y = pos.y,            
        },
        {
            duration = 1,
            x = pos.x - 10,
            y = pos.y,            
        },
    }
    TFDirector:toTween(btnTween)
end

function FactionHomeLayer:refreshBuffShow()
    local rank = PeakManager:getMyFactionRank()
    local per = 0
    local item = PeakManager:getGuildAttri(rank)
    if item then
        per = item.attribute
    end
    if per <= 0 then
        self.btn_buff3:setVisible(false)
    else
        self.btn_buff3:setVisible(true)
        local num = per * 0.01
        self.txt_buff3:setText(num .. "%")
        self.btn_buff3.addNum = per
    end
    self.btn_buff3:setVisible(false)
    self.txt_buff3:setVisible(false)
end

function FactionHomeLayer.btnBuffClick( btn )
    local num = btn.addNum or 0
    PeakManager:openBuffLayer0(num)
end
return FactionHomeLayer