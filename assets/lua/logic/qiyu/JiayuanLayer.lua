-- client side JiayuanLayer.lua
--[[
 * @Description: 家园主界面背景
 ]]
-- script writer wuqi
-- creation time 2016-07-15

local JiayuanLayer = class("JiayuanLayer", BaseLayer)

JiayuanLayer.initPic = {"img_wujian_q01", "img_wujian_q"}

function JiayuanLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.qiyu.FamilyBg")
    self:addEffect()
    self.firstShow = true
    self.oldLevel = 0
end

function JiayuanLayer:initUI(ui)
    self.super.initUI(self, ui)

    self.friendlevel = nil

    self.contentLayer = require("lua.logic.qiyu.JiayuanBaseLayer"):new()
    self.ui:addChild(self.contentLayer, 100)
    self.contentLayer.logic = self
    self.panel_event = TFDirector:getChildByPath(self.ui, "panel_js")
    self.btn_js = TFDirector:getChildByPath(self.panel_event, "btn_js")
    self.panel_youfang = TFDirector:getChildByPath(self.panel_event, "panel_youfang")
    self.panel_youfang:setTouchEnabled(true)
    self.panel_jiangwu = TFDirector:getChildByPath(self.panel_event, "panel_jiangwu")
    self.panel_jiangwu:setTouchEnabled(true)
    self.panel_content = TFDirector:getChildByPath(self.ui, "panel_content")
    self.myPower = AssistFightManager:getStrategyPower(EnumFightStrategyType.StrategyType_PVE)
    local id = QiyuManager:getJiayuanLevel()
    if id >= 1 then
        self.showList = FamilyData:getShowListTableByLevel(id)
    else
        self.showList = JiayuanLayer.initPic
    end  
    self:brushEventExtShow("img_wujian_18",3)
    for i = 1, #self.showList do
        if self.showList[i] and self.showList[i] ~= "" then
            local widget = TFDirector:getChildByPath(self.ui, self.showList[i])
            widget:setVisible(true)
            self:brushEventExtShow(self.showList[i],1)
            local panel_click = TFDirector:getChildByPath(widget, "panel_click")
            if panel_click then
                panel_click:setTouchEnabled(true)
                panel_click.logic = self
                panel_click:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCrushFireClick), 1)
            end
        end
    end
    self.isDealEvent3 = 0
    self:refreshYoufangTime()
end

function JiayuanLayer:brushEventExtShow( itemName , type)
    if itemName == "img_wujian_18" then
        local widget = TFDirector:getChildByPath(self.panel_event, itemName)
        if type == 1 then
            widget:setVisible(true)
        elseif type == 2 then
            widget:setVisible(true)
            widget:runAction(CCFadeIn:create(0.8))
        elseif type == 3 then
            widget:setVisible(false)
        end
    end
end

function JiayuanLayer:showHurtEffect()
    local power = self.myPower
    local fightTextLabel = self:CreateDamageNumFont()
    fightTextLabel:setText(power)
    fightTextLabel:setPosition(ccp(312,320))
    self.panel_event:addChild(fightTextLabel,90)
    local textTween = {
        target = fightTextLabel,
        {
            ease = {type=TFEaseType.EASE_IN_OUT, rate=2},
            duration = 0.8 / FightManager.fightSpeed,
            bezier = 
            {
                {   x = 312 + 50,
                    y = 320 + 90,
                },
                {
                    x = 312 + 50,
                    y = 280 + 70,
                },
                {
                    x = 312 + 2*50,
                    y = 320 - 100,
                },
            },
            alpha = 0.6,
            onComplete = function ()
                self.panel_event:removeChild(fightTextLabel)
            end
        }
    }
    TFDirector:toTween(textTween)
end

function JiayuanLayer:CreateDamageNumFont()
    local damageFont = TFLabelBMFont:create()
    damageFont:setAnchorPoint(ccp(0.5, 0.5))
    damageFont:setFntFile("font/damage.fnt")   
    return damageFont
end

function JiayuanLayer.onWaterTreeClick( sender )
    local self = sender.logic
    local playerId = MainPlayer:getPlayerId()
    if self.friendInfo then
        playerId = self.friendInfo.playerId
    end
    local eventInfo = self:getEventInfo(1)
    if eventInfo == nil then
        return
    end
    QiyuManager:RequestDealJiaYuanEvent(playerId,eventInfo.eventId)
end

function JiayuanLayer.onCrushFireClick( sender )
    local self = sender.logic
    local playerId = MainPlayer:getPlayerId()
    local myPlayerId = MainPlayer:getPlayerId()
    if self.friendInfo then
        playerId = self.friendInfo.playerId
    end
    local eventInfo = self:getEventInfo(2)
    if eventInfo == nil then
        print("eventInfo nil")
        return
    end
    if eventInfo.players then
        for i,v in ipairs(eventInfo.players) do
            if myPlayerId == v then
                toastMessage(localizable.Jiayuan_home_event_fire)
                return
            end
        end
    end
    
    QiyuManager:RequestDealJiaYuanEvent(playerId,eventInfo.eventId)
end

function JiayuanLayer:getEventInfo(eventId)
    local eventMsg = QiyuManager:getJiayuanEventMsg()
    if self.friendInfo then
        eventMsg = self.friendInfo.events or {}
    end
    local eventInfo = nil
    for i,v in ipairs(eventMsg) do
        if v.eventId == eventId then
            if v.state == 0 then
                eventInfo = v
            end
            break
        end
    end
    return eventInfo
end

function JiayuanLayer:_getEventInfo(eventId)
    local eventMsg = QiyuManager:getJiayuanEventMsg()
    if self.friendInfo then
        eventMsg = self.friendInfo.events or {}
    end
    local eventInfo = nil
    for i,v in ipairs(eventMsg) do
        if v.eventId == eventId then
            eventInfo = v
            break
        end
    end
    return eventInfo
end

function JiayuanLayer.onJiangWuClick( sender )
    local self = sender.logic
    local playerId = MainPlayer:getPlayerId()
    local myPlayerId = MainPlayer:getPlayerId()
    if self.friendInfo then
        playerId = self.friendInfo.playerId
    end
    local eventInfo = self:getEventInfo(3)
    if eventInfo == nil then
        return
    end
    if eventInfo.players then
        for i,v in ipairs(eventInfo.players) do
            if myPlayerId == v then
                toastMessage(localizable.Jiayuan_home_event_jiangwu)
                return
            end
        end
    end
    QiyuManager:RequestDealJiaYuanEvent(playerId,eventInfo.eventId)
end

function JiayuanLayer.onYoufangWuClick( sender )
    local self = sender.logic
    local eventInfo = self:getEventInfo(4)
    local layer = AlertManager:addLayerByFile("lua.logic.qiyu.jiayuanYuofangShopLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(eventInfo,self.friendInfo)
    AlertManager:show()
end

function JiayuanLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()

    if self.contentLayer then
        self.contentLayer:onShow()
    end
    if self.friendLayer and self.friendLayer:isVisible() then
        self.friendLayer:onShow()
    end
end

function JiayuanLayer:showReward( eventId )
    local eventData = FamilyEventData:objectByID(eventId)
    local dropItem = DropGroupData:objectByID(eventData.drop_group_id)
    local itemList = nil 

    if eventId == 3 then
        if self.myPower == nil then
            return
        end
        local rewardArray = nil
        local tbls = stringToTable(eventData.args,"|")
        for i,v in ipairs(tbls) do
            local tbl = stringToTable(v,"_")
            if tbl[1] == self.dealJiangWuId then
                rewardArray = DropGroupData:GetDropItemListByIdsStr(tbl[2])
                break
            end
        end
        if rewardArray == nil then
            return
        end
        -- print("rewardArray = ",rewardArray)
        local per = self.dealJiangWuPer
        print("per = ",per)
        if per > 1 then
            per = 1
        end
        itemList = TFArray:new();
        for v in rewardArray:iterator() do
            v.number = math.floor(v.number * per)
            if v.number > 0 then
                itemList:push(v)
            end
        end
    else
        if dropItem then
            itemList = dropItem:GetDropItemList()
        end
    end
    if itemList and itemList:length() > 0 then
        RewardManager:showRewardListLayer(itemList)
    end
end

function JiayuanLayer:dealEventSuccess( eventId )
    if eventId == 1 then
        self:_dealEvent_1_Success()
    elseif eventId == 2 then
        self:_dealEvent_2_Success()
    elseif eventId == 3 then
        self:_dealEvent_3_Success()
    elseif eventId == 4 then
        self:_dealEvent_4_Success()
    end
end

function JiayuanLayer:_dealEvent_1_Success()
    if self.waterEffect == nil then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/jiayuan_event_effect_2.xml")
        local effect = TFArmature:create("jiayuan_event_effect_2_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        local pos = self.btn_js:getPosition()
        pos.y = pos.y - 5
        pos.x = pos.x - 20
        effect:setPosition(pos)
        effect:setZOrder(90)
        self.panel_event:addChild(effect)
        self.waterEffect = effect
        self.waterEffect:addMEListener(TFARMATURE_COMPLETE,function()
            self.waterEffect:setVisible(false)
            toastMessage(localizable.Jiayuan_home_event_water)
            local callFuncN = CCCallFuncN:create( function()
                self:showReward(1)
            end )
            local acArr = TFVector:create()
            local delayAc = CCDelayTime:create(1)
            acArr:addObject(delayAc)
            acArr:addObject(callFuncN)
            self:runAction(CCSequence:create(acArr))
        end)
    end
    self.waterEffect:setVisible(true)
    self.waterEffect:playByIndex(0, -1, -1, 0)
end

function JiayuanLayer:_dealEvent_2_Success()
    local eventInfo = self:getEventInfo(2)
    if eventInfo == nil then
        print("event nil")
        return
    end
    local index = eventInfo.count + 1
    if self.event_2_Effect[ index ] == nil then
        print("effect nil count =",eventInfo.count)
        return
    end
    self.event_2_Effect[ index ]:setVisible(false)
    local effect = self.event_2_Effect[ index ]:clone()
    effect:setVisible(true)
    effect:playByIndex(1, -1, -1, 0)
    self.panel_event:addChild(effect,90)
    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeFromParent()
        toastMessage(localizable.Jiayuan_home_event_fire1)
    end)
end

function JiayuanLayer:_dealEvent_3_Success()
    local eventInfo = self:getEventInfo(3)
    if eventInfo == nil then
        return
    end
    if self.friendInfo ~= nil then
        self.isDealEvent3 = 2
    else
        self.isDealEvent3 = 1
    end
    self.dealJiangWuId = eventInfo.args
    local curCount = eventInfo.totleCount - eventInfo.count
    if curCount > self.myPower then
        curCount = self.myPower
    end
    self.dealJiangWuPer = curCount / eventInfo.totleCount
    local img_role = TFDirector:getChildByPath(self.panel_jiangwu, "img_role")
    self:tweenColor(img_role)
    if self.hurtEffect == nil then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/jiayuan_event_effect_3.xml")
        local effect = TFArmature:create("jiayuan_event_effect_3_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:setPosition(ccp(312,244))
        effect:setZOrder(90)
        self.hurtEffect = effect
        effect:addMEListener(TFARMATURE_COMPLETE,function()
            effect:setVisible(false)
            
        end)
        self.panel_event:addChild(effect)
    end
    self.hurtEffect:setVisible(true)
    self.hurtEffect:playByIndex(0, -1, -1, 0)

    local callFuncN = CCCallFuncN:create( function()
        toastMessage(localizable.Jiayuan_home_event_jiangwu1)
    end )
    
    local callFuncN0 = CCCallFuncN:create( function()
        self:showReward(3)
    end )

    local callFuncN1 = CCCallFuncN:create( function()
        self:showHurtEffect()
    end )

    local acArr = TFVector:create()
    local delayAc = CCDelayTime:create(0.5)
    local delayAc0 = CCDelayTime:create(1)
    local delayAc1 = CCDelayTime:create(0.5)
    acArr:addObject(delayAc1)
    acArr:addObject(callFuncN1)
    acArr:addObject(delayAc)
    acArr:addObject(callFuncN)
    acArr:addObject(delayAc0)
    acArr:addObject(callFuncN0)
    self:runAction(CCSequence:create(acArr))
    
end

function JiayuanLayer:_dealEvent_4_Success()
    -- print("JiayuanLayer:removeEvent6666666666666666666666666s")
    if self.friendInfo then--如果是好友的，把好友的这个时间数据删掉
        local playerId=QiyuManager:getDealPlayerId()
        for firendInfo in QiyuManager.homeFriendPraiseRanks:iterator() do
            if firendInfo.playerId == playerId then
                for k,v in pairs(firendInfo.events) do
                    if v.eventId == 4 then
                        v=nil
                        break
                    end
                end
            end
        end
    else   
        self.panel_youfangShopBuy=true
    end
    self.panel_youfang:setVisible(false)
end


function JiayuanLayer:registerEvents()
    self.super.registerEvents(self)
    self.panel_jiangwu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onJiangWuClick), 1)
    self.panel_jiangwu.logic = self
    self.panel_youfang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onYoufangWuClick), 1)
    self.panel_youfang.logic = self
    self.btn_js:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onWaterTreeClick), 1)
    self.btn_js.logic = self
    -- if self.contentLayer then
    --     self.contentLayer:registerEvents()
    -- end
    self.onReceiveEventScuess = function (event)
        local eventId = event.data[1][1]
        if eventId == nil then
            return
        end
        self:dealEventSuccess(eventId)
    end
    TFDirector:addMEGlobalListener(QiyuManager.OPEN_HOME_EVENT_SCUESS, self.onReceiveEventScuess)

    self.onReceiveHomeLevel = function (event)
        self.myPower = AssistFightManager:getStrategyPower(EnumFightStrategyType.StrategyType_PVE)
    end
    TFDirector:addMEGlobalListener(QiyuManager.HOME_LEVEL_REPONSE, self.onReceiveHomeLevel)

end

function JiayuanLayer:removeUI()
    -- print("JiayuanLayer:removeUI")
    self.super.removeUI(self)
    if self.contentLayer then
        self.contentLayer:removeUI()
    end
    if self.friendLayer then
        self.friendLayer:removeUI()
        self.friendLayer = nil
    end
end

function JiayuanLayer:removeEvents()
    -- print("JiayuanLayer:removeEvents")
    self.super.removeEvents(self)
    if self.timerId ~= nil then
        TFDirector:removeTimer(self.timerId)
        self.timerId = nil
    end

    TFDirector:removeMEGlobalListener(QiyuManager.OPEN_HOME_EVENT_SCUESS, self.onReceiveEventScuess)
    TFDirector:removeMEGlobalListener(QiyuManager.HOME_LEVEL_REPONSE, self.onReceiveHomeLevel)
    if self.contentLayer then
        self.contentLayer:removeEvents()
    end
    if self.friendLayer then
        self.friendLayer:removeEvents()
    end
end

function JiayuanLayer:refreshUI(isChangeLvl)
	--[[
    local jiayuanData = QiyuManager:getJiayuanData()
    local id = jiayuanData.level
    if id < 1 then
        self.showList = {}
    else
        self.showList = FamilyData:getShowListTableByLevel(id)
    end    
    
    if id > 1 then
        local prevList = FamilyData:getShowListTableByLevel(id - 1)

        for i = 1, #prevList do   
            if prevList[i] and prevList[i] ~= "" then         
                local widget = TFDirector:getChildByPath(self.ui, prevList[i])
                widget:setVisible(false)
            end
        end


    end

    for i = 1, #self.showList do
        print(">>>>> ", id, self.showList[i])
        if self.showList[i] and self.showList[i] ~= "" then
            local widget = TFDirector:getChildByPath(self.ui, self.showList[i])
            widget:setVisible(true)
            widget:runAction(CCFadeIn:create(0.5))
        end
    end

    ]]
    self:refreshItems()
    self.contentLayer:refreshUI(isChangeLvl)
    if self.friendlevel ~= nil then
        self.oldLevel = self.friendlevel
    else
        self.oldLevel = QiyuManager:getJiayuanLevel()
    end
    self:refreshEventMsg()
end

function JiayuanLayer:refreshItems()
    if self.firstShow == true then
        self.firstShow = false
        return
    end

    --local jiayuanData = QiyuManager:getJiayuanData()
    local id = QiyuManager:getJiayuanLevel()
    if self.friendlevel then
        id = self.friendlevel
    end

    if id < 1 then
        self.showList = self.initPic
        -- self.prevList = self.initPic
    -- elseif id == 1 then
    --     self.showList = FamilyData:getShowListTableByLevel(id)
        -- self.prevList = self.initPic
    else
        self.showList = FamilyData:getShowListTableByLevel(id)
        -- if self.oldLevel == 0 then
            -- self.prevList = self.initPic
        -- else
            -- self.prevList = FamilyData:getShowListTableByLevel(self.oldLevel)
        -- end
    end 
    if self.oldLevel == 0 then
        self.prevList = self.initPic
    else
        self.prevList = FamilyData:getShowListTableByLevel(self.oldLevel)
    end
    print("showLevel = ",id)
    print("oldLevel = ",self.oldLevel)
    local tabOut = {}
    local tabIn = {}

    local function isInTab(item, tab)
        for i = 1, #tab do
            if tab[i] == item then
                return true
            end
        end
        return false
    end
    for i = 1, #self.showList do
        if isInTab(self.showList[i], self.prevList) == false then
            table.insert(tabIn, self.showList[i])
        end
    end

    for i = 1, #self.prevList do
        if isInTab(self.prevList[i], self.showList) == false then
            table.insert(tabOut, self.prevList[i])
        end
    end
    self:brushEventExtShow("img_wujian_18",3)
    for i = 1, #tabOut do
        if tabOut[i] and tabOut[i] ~= "" then
            local widget = TFDirector:getChildByPath(self.ui, tabOut[i])
            widget:setVisible(false)
            widget:runAction(CCFadeOut:create(0.8))
            self:brushEventExtShow(tabIn[i],3)
        end
    end
    for i = 1, #tabIn do
        if tabIn[i] and tabIn[i] ~= "" then
            local widget = TFDirector:getChildByPath(self.ui, tabIn[i])
            widget:setVisible(true)
            widget:runAction(CCFadeIn:create(0.8))
            self:brushEventExtShow(tabIn[i],2)
            local panel_click = TFDirector:getChildByPath(widget, "panel_click")
            if panel_click then
                panel_click:setTouchEnabled(true)
                panel_click.logic = self
                panel_click:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCrushFireClick), 1)
            end
        end
    end
end

function JiayuanLayer:refreshEventMsg()
    local eventMsg = QiyuManager:getJiayuanEventMsg()
    if self.friendInfo then
        eventMsg = self.friendInfo.events or {}
    end
    self.btn_js:setVisible(false)
    print("self.panel_jiangwu:setVisible(false)")
    self.panel_jiangwu:setVisible(false)
    self.panel_youfang:setVisible(false)
    if self.event_2_Effect == nil then
        self.event_2_Effect = {}
    end
    for i=1,3 do
        if self.event_2_Effect[i] then
            self.event_2_Effect[i]:setVisible(false)
        end
    end
    print("eventMsg = ",eventMsg)
    for k,v in pairs(eventMsg) do
        if v.eventId == 1 then
            self:_showEventMsg_1(v)
        elseif v.eventId == 2 then
            self:_showEventMsg_2(v)
        elseif v.eventId == 4 then
            self:_showEventMsg_4(v)
        end
    end
    self:_showEventMsg_3()
end

function JiayuanLayer:_showEventMsg_1( eventMsg )
    if eventMsg.state ~= 0 then
        return
    end
    self.btn_js:setVisible(true)
end

function JiayuanLayer:_showEventMsg_2( eventMsg )
    if eventMsg.state ~= 0 then
        return
    end
    local id = QiyuManager:getJiayuanLevel()
    if self.friendlevel then
        id = self.friendlevel
    end
    local pos = {ccp(580,200),ccp(800,200),ccp(720,300)}
    local itemData = FamilyData:getItemByLevel(id)
    if itemData then
        local tbl = stringToTable(itemData.fire_pos,"|")
        for i,v in ipairs(tbl) do
            local tblss = stringToNumberTable(v,",")
            local _pos = ccp(tblss[1],tblss[2])
            pos[i] = _pos
        end
    end
    for i=1,3 do
        if i > eventMsg.count then
            if self.event_2_Effect[i] then
                self.event_2_Effect[i]:setVisible(true)
                self.event_2_Effect[i]:setPosition(pos[i])
            else
                TFResourceHelper:instance():addArmatureFromJsonFile("effect/jiayuan_event_effect_1.xml")
                local effect = TFArmature:create("jiayuan_event_effect_1_anim")
                effect:setAnimationFps(GameConfig.ANIM_FPS)
                effect:playByIndex(0, -1, -1, 1)
                effect:setPosition(pos[i])
                effect:setZOrder(90)
                self.event_2_Effect[i] = effect
                self.panel_event:addChild(effect)
            end
        else
            if self.event_2_Effect[i] then
                self.event_2_Effect[i]:setVisible(false)
            end
        end
    end
end

function JiayuanLayer:_showEventMsg_3()
    local eventInfo = self:_getEventInfo(3)
    if ( eventInfo and eventInfo.state == 0 ) or self.isDealEvent3 > 0 then
        self.isDealEvent3 = self.isDealEvent3 - 1
        print("self.panel_jiangwu:setVisible(true)")
        self.panel_jiangwu:setVisible(true)
        local img_role = TFDirector:getChildByPath(self.panel_jiangwu, "img_role")
        local img_zhiye = TFDirector:getChildByPath(self.panel_jiangwu, "img_zhiye")
        local blood_bar = TFDirector:getChildByPath(self.panel_jiangwu, "bar_xuetiao5")

        if eventInfo then
            local roleId = tonumber(eventInfo.args or "77")
            local roleConfig = RoleData:objectByID(roleId)
            if roleConfig == nil then
                roleConfig = RoleData:objectByID(77)
            end
            img_role:setTexture(roleConfig:getBigImagePath())
            img_zhiye:setTexture("ui_new/fight/zhiye_".. roleConfig.outline ..".png")
        else
            eventInfo = {}
            eventInfo.totleCount = 1
            eventInfo.count = 1
        end
        local per = 0
        local curBlood = eventInfo.totleCount - eventInfo.count
        if curBlood < 0 then
            curBlood = 0
        end 
        if eventInfo.totleCount > 0 then
            per = curBlood / eventInfo.totleCount
        end
        blood_bar:setPercent(per * 100)
    end

end

function JiayuanLayer:_showEventMsg_4( eventMsg )
    if not self.friendInfo and self.panel_youfangShopBuy ~= nil then
        return
    end

    self.panel_youfang:setVisible(true)
    local img_role = TFDirector:getChildByPath(self.panel_youfang, "img_role-Copy1")
    img_role:setTexture("ui_new/qiyu/family/img_ys.png")
end

function JiayuanLayer:refreshTime()
    self.YoufangTime = self.YoufangTime - 1
    if self.YoufangTime <= 0 then
        self.panel_youfang:setVisible(false)
        if self.timerId ~= nil then 
            TFDirector:removeTimer(self.timerId)
            self.timerId = nil
        end
        return
    end
end

function JiayuanLayer:refreshYoufangTime()
    if self.timerId ~= nil then 
        TFDirector:removeTimer(self.timerId)
        self.timerId = nil
    end
    if not self.friendInfo then
        self.YoufangTime = QiyuManager:getJiayuanYoufangTime()-MainPlayer:getNowtime()
    else
        local eventInfo = self:getEventInfo(4)
        if eventInfo then
            self.YoufangTime=eventInfo.time/1000+86400-MainPlayer:getNowtime()
        end
    end

    if not self.YoufangTime or self.YoufangTime<=0 then
        print("剩余时间为空")
        return
    end

    self.timerId = TFDirector:addTimer(1000, -1, nil, 
            function() 
                self:refreshTime()
            end)
    self:refreshTime()
end


function JiayuanLayer:returnMylayer()
    self.friendlevel = nil
    self.friendInfo = nil
    self.isDealEvent3 = 0
    self.contentLayer:setVisible(true)
    self.friendLayer:setVisible(false)
    self:refreshItems()
    self.oldLevel = QiyuManager:getJiayuanLevel()
    self:refreshEventMsg()
    self:refreshYoufangTime()
end

function JiayuanLayer:showFriendLayer(friendInfo)
    if self.contentLayer then
        self.contentLayer:setVisible(false)
    end
    if self.friendLayer == nil then 
        self.friendLayer = require("lua.logic.qiyu.JiayuanFriendLayer"):new()
        self.ui:addChild(self.friendLayer, 101)
        self.friendLayer.logic = self
    else
        self.friendLayer:setVisible(true)
    end
    self.friendLayer:refreshInfo(friendInfo)
    self.friendlevel = friendInfo.homeLevel
    self.friendInfo = friendInfo
    self:refreshItems()
    self.oldLevel = self.friendlevel
    self:refreshEventMsg()
    self:refreshYoufangTime()
end

function JiayuanLayer:addEffect()
    --if not self.effect1 then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/jiayuan_base.xml")
        local effect = TFArmature:create("jiayuan_base_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 1)
        local uiSize = self.panel_content:getSize()
        effect:setPosition(ccp(uiSize.width / 2 - 400, uiSize.height / 2 - 20))
        effect:setZOrder(90)
        self.effect1 = effect
        self.panel_content:addChild(effect)
    --end
end

function JiayuanLayer:_refreshItems()
    if self.firstShow == true then
        self.firstShow = false
        return
    end

    --local jiayuanData = QiyuManager:getJiayuanData()
    local id = QiyuManager:getJiayuanLevel()
    if self.friendlevel then
        id = self.friendlevel
    end

    if id < 1 then
        self.showList = self.initPic
        self.prevList = self.initPic
    elseif id == 1 then
        self.showList = FamilyData:getShowListTableByLevel(id)
        self.prevList = self.initPic
    else
        self.showList = FamilyData:getShowListTableByLevel(id)
        if self.oldLevel == 0 then
            self.prevList = self.initPic
        else
            self.prevList = FamilyData:getShowListTableByLevel(self.oldLevel)
        end
    end  

    local tabOut = {}
    local tabIn = {}

    local function isInTab(item, tab)
        for i = 1, #tab do
            if tab[i] == item then
                return true
            end
        end
        return false
    end
    for i = 1, #self.showList do
        if isInTab(self.showList[i], self.prevList) == false then
            table.insert(tabIn, self.showList[i])
        end
    end
    for i = 1, #self.prevList do
        if isInTab(self.prevList[i], self.showList) == false then
            table.insert(tabOut, self.prevList[i])
        end
    end

    for i = 1, #tabOut do
        if tabOut[i] and tabOut[i] ~= "" then
            local widget = TFDirector:getChildByPath(self.ui, tabOut[i])
            widget:setVisible(false)
            widget:runAction(CCFadeOut:create(0.8))
        end
    end
    for i = 1, #tabIn do
        if tabIn[i] and tabIn[i] ~= "" then
            local widget = TFDirector:getChildByPath(self.ui, tabIn[i])
            widget:setVisible(true)
            widget:runAction(CCFadeIn:create(0.8))
            local panel_click = TFDirector:getChildByPath(widget, "panel_click")
            if panel_click then
                panel_click:setTouchEnabled(true)
                panel_click.logic = self
                panel_click:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCrushFireClick), 1)
            end
        end
    end
end

function JiayuanLayer:tweenColor(node)
    local tween = {
        target = node,
        repeated = 3,
        {
            duration = 0.1,
            color = 0xFF6669
        },
        {
            duration = 0.1,
            color = 0xFFFFFF
        }
    }
    TFDirector:toTween(tween)
end

return JiayuanLayer