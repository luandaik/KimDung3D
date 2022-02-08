-- client side KingWarFightDetailsLayer.lua
--[[
 * @Description: 查看对战详细信息
 ]]
-- script writer Happy.All
-- creation time 2016-11-4 17:49:52
local KingWarFightDetailsLayer = class("KingWarFightDetailsLayer",BaseLayer)

function KingWarFightDetailsLayer:ctor(data)
    self.showFightEnd = false
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.crossarena.CrossArenaRecord")
end

function KingWarFightDetailsLayer:initUI( ui )

    self.super.initUI(self, ui)

    self.btnClose = TFDirector:getChildByPath(ui, "btn_return")

    local panel_team1 = TFDirector:getChildByPath(ui, "panel_team1")
    self.atkNodeInfo = {}
    self.atkNodeInfo.txtName = TFDirector:getChildByPath(panel_team1, "txt_name")
    self.atkNodeInfo.memberNode = {}
    local panel_team2 = TFDirector:getChildByPath(ui, "panel_team2")
    self.defNodeInfo = {}
    self.defNodeInfo.txtName = TFDirector:getChildByPath(panel_team2, "txt_name")
    self.defNodeInfo.memberNode = {}


    local img_huangdi1 = TFDirector:getChildByPath(ui, "img_huangdi1")
    local img_huangdi2 = TFDirector:getChildByPath(ui, "img_huangdi2")
    
    for i=1,3 do
        local atkNode = TFDirector:getChildByPath(img_huangdi1, "panel_role"..i)
        local atkMember = {}
        atkMember.imgIcon = TFDirector:getChildByPath(atkNode, "img_touxiang")
        atkMember.imgFail = TFDirector:getChildByPath(atkNode, "img_sb")
        atkMember.txtName = TFDirector:getChildByPath(atkNode, "txt_jingy")
        atkMember.txtYgw = TFDirector:getChildByPath(atkNode, "txt_ygw")
        table.insert(self.atkNodeInfo.memberNode, atkMember)

        local defNode = TFDirector:getChildByPath(img_huangdi2, "panel_role"..i)
        local defMember = {}
        defMember.imgIcon = TFDirector:getChildByPath(defNode, "img_touxiang")
        defMember.imgFail = TFDirector:getChildByPath(defNode, "img_sb")
        defMember.txtName = TFDirector:getChildByPath(defNode, "txt_jingy")
        defMember.txtYgw = TFDirector:getChildByPath(defNode, "txt_ygw")
        table.insert(self.defNodeInfo.memberNode, defMember)
    end

    self.imgTitleTips = TFDirector:getChildByPath(ui, "img_diyi")
    self.img_line2 = TFDirector:getChildByPath(ui, "img_line2")

    --创建TabView
    local tabViewUI = TFDirector:getChildByPath(ui,"panel_huadong")
    local tabView =  TFTableView:create()
    local tabViewUISize = tabViewUI:getContentSize()
    tabView:setTableViewSize(tabViewUI:getContentSize())
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)    
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    tabViewUI:addChild(tabView)
    tabView:setPosition(ccp(0,0))
    self.tabView = tabView
    self.tabViewUI = tabViewUI

    local viewNode = TFDirector:getChildByPath(ui, "panel_huadong")    
    self.cellModel = TFDirector:getChildByPath(viewNode, 'panel_putong')
    self.cellModel:setVisible(false)

    self.btnLeft = TFDirector:getChildByPath(ui, "btn_left")
    self.btnRight = TFDirector:getChildByPath(ui, "btn_right")
end


function KingWarFightDetailsLayer:removeUI()
    self.super.removeUI(self)
end

function KingWarFightDetailsLayer:onShow()
    self.super.onShow(self)
end

function KingWarFightDetailsLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
    self.super.registerEvents(self)
    
    self.btnClose:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnCloseClick))
    self.btnClose.logic = self

    self.btnLeft:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnLeftClick))
    self.btnLeft.logic = self
    self.btnRight:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnRightClick))
    self.btnRight.logic = self

    self.tabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tabView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
    self.tabView.logic = self

    self.leaveFightCallBack = function(event)
        KingOfWarManager:setFightVideoPlayed(self.msgReplayId)
        -- self.tabView:reloadData()
        self:refreshTeamInfoByIndex()
        -- TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateResultMsg,{})
    end
    TFDirector:addMEGlobalListener(FightManager.LeaveFightForKingWar ,self.leaveFightCallBack )

    self.registerEventCallFlag = true 
end

function KingWarFightDetailsLayer:removeEvents()

    self.super.removeEvents(self)

    self.tabView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.tabView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.tabView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)
    self.tabView:removeMEListener(TFTABLEVIEW_SCROLL)

    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end
    if self.leaveFightCallBack then
        TFDirector:removeMEGlobalListener(FightManager.LeaveFightForKingWar ,self.leaveFightCallBack )
        self.leaveFightCallBack = nil
    end

    self.registerEventCallFlag = nil  
end

function KingWarFightDetailsLayer:dispose()
    self.super.dispose(self)
end

function KingWarFightDetailsLayer.cellSizeForTable(table,idx)
    return 80,760       
end

function KingWarFightDetailsLayer.numberOfCellsInTableView(table)
    local self = table.logic   
    if self.isEnd then 
        return (self.currFightIndex - 1)
    else
        return self.currFightIndex
    end
end

function KingWarFightDetailsLayer.tableCellAtIndex(table, idx)

    local self = table.logic
    
    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        cell.panel = {}
        local panel = self.cellModel:clone()
        panel:setPosition(ccp(0,0))
        cell:addChild(panel)
        panel:setVisible(true)        
        cell.panel = panel
    end

    local panel = cell.panel
    idx = idx + 1

    self:setCellData(panel, idx)

    return cell
end

function KingWarFightDetailsLayer:setCellData(panel,idx, showTime)
    
    local atkNode = TFDirector:getChildByPath(panel, "img_hongdi1")
    local atkplayerName = TFDirector:getChildByPath(atkNode, "txt_name")
    local atkheadFrame = TFDirector:getChildByPath(atkNode, "img_tou2")
    local atkheadIcon = TFDirector:getChildByPath(atkNode, "img_touxiang")
    local atkimgLost = TFDirector:getChildByPath(atkNode, "panel_shibai")
    local atkimgWin = TFDirector:getChildByPath(atkNode, "panel_shengli")
    local atkYgw = TFDirector:getChildByPath(atkNode, "txt_ygw")


    local defNode = TFDirector:getChildByPath(panel, "img_hongdi2")
    local defplayerName = TFDirector:getChildByPath(defNode, "txt_name")
    local defheadFrame = TFDirector:getChildByPath(defNode, "img_tou2")
    local defheadIcon = TFDirector:getChildByPath(defNode, "img_touxiang")
    local defimgLost = TFDirector:getChildByPath(defNode, "panel_shibai")
    local defimgWin = TFDirector:getChildByPath(defNode, "panel_shengli")
    local defYgw = TFDirector:getChildByPath(defNode, "txt_ygw")

    local itemData = self.fightRecordData[idx]

    local btn_huifang = TFDirector:getChildByPath(panel, "btn_huifang")
    btn_huifang:setVisible(false)
    btn_huifang.replayId = itemData.replayId
    btn_huifang.idx = idx
    btn_huifang:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onReplayClick))
    btn_huifang.logic = self
    btn_huifang.isHuifang = true

    local btn_guanzhan = TFDirector:getChildByPath(panel, "btn_guanzhan")
    btn_guanzhan:setVisible(false)
    btn_guanzhan.replayId = itemData.replayId
    btn_guanzhan.idx = idx
    btn_guanzhan:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onReplayClick))
    btn_guanzhan.logic = self
    btn_guanzhan.isHuifang = false

    atkplayerName:setText(itemData.atkName)
    local atkRoleIcon = RoleData:objectByID(itemData.atkUseIcon)
    atkheadIcon:setTexture(atkRoleIcon:getIconPath())
    -- Public:addFrameImg(atkheadIcon,itemData.atkFrameId) 
    Public:addInfoListen(atkheadIcon,true,6,itemData.atkPlayerId,itemData.atkSeverId)
    atkimgLost:setVisible(false)
    atkimgWin:setVisible(false)
    
    defplayerName:setText(itemData.defName)
    local defRoleIcon = RoleData:objectByID(itemData.defUseIcon)
    defheadIcon:setTexture(defRoleIcon:getIconPath())
    -- Public:addFrameImg(defheadIcon,itemData.defFrameId) 
    Public:addInfoListen(defheadIcon,true,6,itemData.defPlayerId,itemData.defSeverId)
    defimgLost:setVisible(false)
    defimgWin:setVisible(false)

    local state = KingOfWarManager:getActivityState()
    -- if state >= KingOfWarManager.ActivityState_Final then
    if (state > KingOfWarManager.ActivityState_Final) or (state == KingOfWarManager.ActivityState_Final and self.showFightEnd ) then
        local inspireDataAtk = ContestInspireConfig:objectByID(itemData.atkInspireNum)
        atkYgw:setVisible(true)
        if inspireDataAtk then
            atkYgw:setText(stringUtils.format(localizable.KingWarInspireAddAttr1,inspireDataAtk:getTotalAddAttr()))
        else
            atkYgw:setText(stringUtils.format(localizable.KingWarInspireAddAttr1,0))
        end
        local inspireDataDef = ContestInspireConfig:objectByID(itemData.defInspireNum)
        defYgw:setVisible(true)
        if inspireDataDef then
            defYgw:setText(stringUtils.format(localizable.KingWarInspireAddAttr1,inspireDataDef:getTotalAddAttr()))
        else
            defYgw:setText(stringUtils.format(localizable.KingWarInspireAddAttr1,0))
        end
    else
        atkYgw:setVisible(false)
        defYgw:setVisible(false)
    end


    --设置特效
    if panel.fightEffect then
        panel.fightEffect:removeFromParent()
        panel.fightEffect = nil
    end
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/weekFight.xml")
    local effect = TFArmature:create("weekFight_anim") 
    effect:setPosition(ccp(380, 40))
    effect:setScale(0.5)
    effect:playByIndex(0, -1, -1, 1)
    effect:setZOrder(100)
    panel:addChild(effect) 
    panel.fightEffect = effect
    effect:setVisible(false)



    --设置是否需要显示时间
    local txt_time = TFDirector:getChildByPath(panel, "txt_time")
    txt_time:setVisible(false)

    if idx < self.currFightIndex then
        --显示结果
        if itemData.result == 0 then
            atkimgWin:setVisible(true)
            defimgLost:setVisible(true)
        else
            atkimgLost:setVisible(true)
            defimgWin:setVisible(true)
        end
        btn_huifang:setVisible(true)    
        if idx == 3 then
            TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateResultMsg, {})
        end    
    elseif idx == self.currFightIndex then
        --正在战斗
        txt_time:setVisible(true)
        self.txtDelayTime = txt_time     
        txt_time:setText(KingOfWarManager:showTimeWithOutHour(self.cutTime))
        if KingOfWarManager:checkFightVideoPlayed(itemData.replayId) then
            if itemData.result == 0 then
                atkimgWin:setVisible(true)
                defimgLost:setVisible(true)
            else
                atkimgLost:setVisible(true)
                defimgWin:setVisible(true)
            end
            btn_huifang:setVisible(true) 
            if idx == 3 then
                TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateResultMsg, {})
            end
        else            
            panel.fightEffect:setVisible(true)   
            panel.fightEffect:playByIndex(0, -1, -1, 1)     
            btn_guanzhan:setVisible(true)
        end
    end
end

function KingWarFightDetailsLayer:setFightRound(data)

    self.selectTeamIndex = 1
    if data == nil then
        self.totalFightRound = KingOfWarManager:getCurrFightRound() or 0
        local isEnd,currFightIndex,cutTime = KingOfWarManager:getStateByTeamIndex(self.totalFightRound)
        if isEnd and (cutTime <= 0) then
            self.selectTeamIndex = 1 
        else
            self.selectTeamIndex = self.totalFightRound
        end
        data = KingOfWarManager:getFinalFightDataByIndex(self.selectTeamIndex)
    end

    self.lastState = KingOfWarManager:getActivityState()
    self.fightRecordData = data
    self.atkName = data[1].atkTeamName
    self.defName = data[1].defTeamName
    self:refreshTeamInfoByIndex()    
end

function KingWarFightDetailsLayer:refreshTeamInfoByIndex()
    
    local state = KingOfWarManager:getActivityState()
    if state ~= self.lastState then
        AlertManager:close()
        return
    end
    self.imgTitleTips:setVisible(false)
    if state == KingOfWarManager.ActivityState_Score then
        self.btnLeft:setVisible(false)
        self.btnRight:setVisible(false)
        self.isEnd = true
        self.currFightIndex = 4
    else
        self.isEnd,self.currFightIndex,self.cutTime = KingOfWarManager:getStateByTeamIndex(self.selectTeamIndex)
        -- print("self.isEnd = ",self.isEnd)
        -- print("self.currFightIndex = ",self.currFightIndex)
        -- print("self.cutTime = ",self.cutTime)
        self.imgTitleTips:setVisible(true)
        self.imgTitleTips:setTexture("ui_new/crossarena/img_d".. self.selectTeamIndex ..".png")

        print("self.totalFightRound = ",self.totalFightRound)
        print("self.selectTeamIndex = ",self.selectTeamIndex)

        if self.totalFightRound == 0 or self.totalFightRound == 1 then
            self.btnLeft:setVisible(false)
            self.btnRight:setVisible(false)
        elseif self.selectTeamIndex >= self.totalFightRound then
            self.btnLeft:setVisible(true)
            self.btnRight:setVisible(false)
        elseif self.selectTeamIndex < self.totalFightRound then
            if self.selectTeamIndex ~= 1 then
                self.btnLeft:setVisible(true)
            else
                self.btnLeft:setVisible(false)
            end            
            self.btnRight:setVisible(true)
        end
        
    end

    if self.currFightIndex <= 3 then
        self.img_line2:setVisible(false)
    else
        self.img_line2:setVisible(true)
    end


    self:refreshMemberHead()

    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end

    if self.isEnd then
        self.tabView:reloadData()
        self.tabView:setScrollToBegin()
    else
        self.tabView:reloadData()
        self.tabView:setScrollToEnd()
        if self.txtDelayTime then
            self.txtDelayTime:setText(KingOfWarManager:showTimeWithOutHour(self.cutTime))
        end
        self.countDownTimer = TFDirector:addTimer(1000, -1, nil, function ()
        if self.txtDelayTime then
            self.txtDelayTime:setText(KingOfWarManager:showTimeWithOutHour(self.cutTime))
        end
            if self.cutTime <= 0 then
                self:refreshTeamInfoByIndex()
            else
                self.cutTime = self.cutTime - 1
                if self.txtDelayTime then
                    self.txtDelayTime:setText(KingOfWarManager:showTimeWithOutHour(self.cutTime))
                end
            end
        end)
    end
end

function KingWarFightDetailsLayer:refreshMemberHead()
    
    self.atkNodeInfo.txtName:setText(self.atkName)
    self.defNodeInfo.txtName:setText(self.defName)
    local state = KingOfWarManager:getActivityState()
    local resultFlg = 0
    for i=1,3 do
        local atkNode = self.atkNodeInfo.memberNode[i]
        local defNode = self.defNodeInfo.memberNode[i]

        memberData = self.fightRecordData[i]

        local atkRoleIcon = RoleData:objectByID(memberData.atkUseIcon)
        atkNode.imgIcon:setTexture(atkRoleIcon:getIconPath())
        -- Public:addFrameImg(atkNode.imgIcon,memberData.atkFrameId) 
        Public:addInfoListen(atkNode.imgIcon,true,6,memberData.atkPlayerId,memberData.atkSeverId)
        atkNode.txtName:setText(memberData.atkName)
        atkNode.imgFail:setVisible(false)

        local defRoleIcon = RoleData:objectByID(memberData.defUseIcon)
        defNode.imgIcon:setTexture(defRoleIcon:getIconPath())
        -- Public:addFrameImg(defNode.imgIcon,memberData.defFrameId) 
        Public:addInfoListen(defNode.imgIcon,true,6,memberData.defPlayerId,memberData.defSeverId)
        defNode.txtName:setText(memberData.defName)
        defNode.imgFail:setVisible(false)

        atkNode.txtYgw:setVisible(false)
        defNode.txtYgw:setVisible(false)
        atkNode.txtYgw:setText(stringUtils.format(localizable.KingWarInspireTips,memberData.atkInspireNum))
        defNode.txtYgw:setText(stringUtils.format(localizable.KingWarInspireTips,memberData.defInspireNum))

        if i < self.currFightIndex or KingOfWarManager:checkFightVideoPlayed(memberData.replayId) then
            --已出结果
            if memberData.result == 0 then
                defNode.imgFail:setVisible(true)
                resultFlg = resultFlg + 1
            else
                atkNode.imgFail:setVisible(true)
            end
        end
    end  
    if resultFlg >= 3 then
        self.showFightEnd = true
    else
        self.showFightEnd = false
    end
    if (state > KingOfWarManager.ActivityState_Final) or (state == KingOfWarManager.ActivityState_Final and self.showFightEnd ) then
        for i=1,3 do
            local atkNode = self.atkNodeInfo.memberNode[i]
            local defNode = self.defNodeInfo.memberNode[i]
            atkNode.txtYgw:setVisible(true)
            defNode.txtYgw:setVisible(true)
        end
    end  
end

function KingWarFightDetailsLayer.onBtnLeftClick( btn )
    local self = btn.logic
    if self.selectTeamIndex == 1 then
        return
    end

    local retData,round = KingOfWarManager:getFinalFightDataByIndex(self.selectTeamIndex - 1)
    if retData == nil then
        toastMessage(localizable.KingWarFightNoStart)
        return
    end
    self.fightRecordData = retData
    self.selectTeamIndex = round
    self:refreshTeamInfoByIndex()
end

function KingWarFightDetailsLayer.onBtnRightClick( btn )
    local self = btn.logic
    if self.selectTeamIndex == 3 then
        return
    end
    local retData,round = KingOfWarManager:getFinalFightDataByIndex(self.selectTeamIndex + 1)
    if retData == nil then
        toastMessage(localizable.KingWarFightNoStart)
        return
    end
    self.fightRecordData = retData
    self.selectTeamIndex = round
    self:refreshTeamInfoByIndex()
end

function KingWarFightDetailsLayer.onReplayClick( btn )
    local replayId = btn.replayId
    local self = btn.logic
    self.msgReplayId = replayId
    if replayId and replayId ~= 0 then
        if btn.isHuifang == false then
            KingOfWarManager:setNeedShowSkip(true)
        end
        TFDirector:send(c2s.CONTEST_WATCH_REPLAY_REQUEST ,{replayId})
        showLoading();
        -- WeekRaceManager:requestPlayVideo( replayId )
    else
        print("replayId is a nil value = ",replayId)
    end
end
function KingWarFightDetailsLayer.onBtnCloseClick( btn )
    local self = btn.logic
    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end
    AlertManager:close()
end

function KingWarFightDetailsLayer.tableScroll(table)
    local self = table.logic
    local currPosY = self.tabView:getContentOffset().y
    local sizeHeight = self.tabViewUI:getContentSize().height
    local initY = sizeHeight - (80*(self.currFightIndex - 1) + 23) + 2

    if currPosY < initY then
        self.img_line2:setVisible(false)
    else
        self.img_line2:setVisible(true)
    end
end

return KingWarFightDetailsLayer