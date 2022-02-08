-- client side IslandMain.lua
--[[
 * @Description: 东瀛岛主界面
 ]]
-- script writer wuqi
-- creation time 2016-12-13

local IslandMain = class("IslandMain", BaseLayer)

local CELL_H = 61
local icon_bg_path = { "ui_new/island/btn_guanka1.png", "ui_new/island/btn_guanka2.png", "ui_new/island/btn_guanka3.png" }

function IslandMain:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.island.IslandMain")
    self.firstIn = true
    --self.selectIdx = JapanIslandManager.passedChap + 1
    self.selectIdx = 1
end

function IslandMain:initUI( ui )
    self.super.initUI(self, ui)

    self.btn_fanhui = TFDirector:getChildByPath(ui, "btn_fanhui")
    self.btn_fanhui.logic = self
    self.btn_guizhe = TFDirector:getChildByPath(ui, "btn_guizhe")
    self.btn_guizhe.logic = self
    self.btn_cgcj = TFDirector:getChildByPath(ui, "btn_cgcj")
    self.btn_cgcj.logic = self
    self.btn_zd = TFDirector:getChildByPath(ui, "btn_zd")
    self.btn_zd.logic = self
    self.txt_sy = TFDirector:getChildByPath(ui, "txt_sy")

    self.img_bg3 = TFDirector:getChildByPath(ui, "img_bg3")
    self.panel_list = TFDirector:getChildByPath(ui, "panel_list")
    self.panel_cell = TFDirector:getChildByPath(self.img_bg3, "btn_gk")
    self.panel_cell:retain()
    self.panel_cell:removeFromParent()
    self.panel_cell:setVisible(false)

    self.panel_reward = TFDirector:getChildByPath(ui, "panel_reward")
    self.reward_cell = TFDirector:getChildByPath(self.panel_reward, "bg_icon")
    self.reward_cell:retain()
    self.reward_cell:removeFromParent()
    self.reward_cell:setVisible(false)
end
                                                                    
function IslandMain:removeUI()
	self.super.removeUI(self)

    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end    
    if self.reward_cell then
        self.reward_cell:release()
        self.reward_cell = nil
    end   
end

function IslandMain:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function IslandMain:refreshUI()
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.JAPAN_ISLAND)
    local times = challengeInfo:getLeftChallengeTimes() or 0
    self.txt_sy:setText( stringUtils.format( localizable.JapanIsland_txt_left_times, times ) )
    self:resortChapInfo()
    self:refreshRewards()
    self:refreshSelectPanel()
    self:refreshRewardPanel()

    local achieveRedState = false
    local passId = JapanIslandManager:getPassedChapId()
    if JapanIslandManager.achievementList[passId] and JapanIslandManager.achievementList[passId] == true and JapanIslandManager.isFirstLoaded == false then
        achieveRedState = true
    end
    CommonManager:setRedPoint(self.btn_cgcj, achieveRedState,"achieveRed",ccp(0, 0))
end

function IslandMain:resortChapInfo()
    local tab1 = {}
    local tab2 = {}
    for v in JapanTeamChapterData:iterator() do
        if v.chapter_id <= JapanIslandManager.passedChap + 1 then
            table.insert(tab1, v.chapter_id)
        else
            table.insert(tab2, v.chapter_id)
        end
    end
    table.sort(tab1, function(v1, v2)
        return v1 > v2
    end)
    for i = 1, #tab2 do
        table.insert(tab1, tab2[i])
    end
    self.idxList = tab1
end

function IslandMain:refreshRewards()
    local newIdx = self.idxList[self.selectIdx] or 1
    local info = JapanTeamChapterData:objectByID(newIdx)
    self.rewardList = JapanIslandManager:getDropItemListByChapInfo(info) or MEArray:new()
end

function IslandMain:refreshSelectPanel()
    if not self.tableView_select then
        local tableView = TFTableView:create()
        tableView:setTableViewSize( CCSize( self.panel_list:getContentSize().width, self.panel_list:getContentSize().height ) )
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.tableView_select = tableView
        self.tableView_select.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable_select)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex_select)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView_select)
        self.panel_list:addChild(self.tableView_select, 1)
    end
    
    if self.firstIn then
        self.firstIn = false

        local idx = self.selectIdx
        if idx <= 0 then
            idx = 1
        end
        -- local offsetMax = CELL_H * JapanIslandManager.maxChapter - self.tableView_select:getContentSize().height
        -- local offset = offsetMax - (idx - 1) * CELL_H
        -- if offset < 0 then
        --     offset = 0
        -- end
        self.tableView_select:reloadData()
        -- self.tableView_select:setContentOffset(ccp(0, -(offset)))
    else
        if self.tableView_select then
            self.tableView_select:reloadData()
        end
    end
end

function IslandMain.numberOfCellsInTableView_select(table)
    --local self = table.logic
    return JapanIslandManager.maxChapter or 0
end

function IslandMain.cellSizeForTable_select(table,idx)
    --local self = table.logic
    if idx == 0 then
        return 158, 173
    elseif idx == JapanIslandManager.maxChapter - 1 then
        return 150, 173
    else
        return 85, 173
    end
end

function IslandMain.tableCellAtIndex_select(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    local size = self.panel_cell:getSize()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local node = self.panel_cell:clone()
        --node:setPosition(ccp(size.width / 2 - 35, size.height / 2 - 10))
        node:setPosition(ccp(size.width / 2, size.height / 2 - 10))
        node:setVisible(true)
        cell.node = node
        cell:addChild(node);

        node:setTouchEnabled(true)
        node.logic = self
        node:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCellClick))
    end
    cell.node.idx = idx + 1

    if JapanIslandManager.maxChapter == cell.node.idx then
        cell.node:setPosition(ccp(size.width / 2, size.height / 2 + 55))
    else
        cell.node:setPosition(ccp(size.width / 2, size.height / 2 - 10))
    end
    self:showNodeSelect(cell.node, idx + 1)
    return cell
end

function IslandMain.onCellClick( sender )
    local self = sender.logic
    local idx = sender.idx
    if self.selectIdx == idx then
      return
    end
    if idx > JapanIslandManager.passedChap + 1 then
        return
    end

    self.selectIdx = idx
    self:refreshUI()
end

function IslandMain:showNodeSelect(widget, idx)
    local txt_name1 = TFDirector:getChildByPath(widget, 'txt_name1')
    local txt_name2 = TFDirector:getChildByPath(widget, 'txt_name2')
    local img_lock = TFDirector:getChildByPath(widget, 'img_lock')

    local newIdx = self.idxList[idx] or 1
    local info = JapanTeamChapterData:objectByID(newIdx)
    txt_name1:setText(info.name)
    txt_name2:setText(info.name)

    if newIdx > JapanIslandManager.passedChap + 1 then
        txt_name1:setVisible(true)
        txt_name2:setVisible(false)
        widget:setTouchEnabled(false)
        widget:setTextureNormal( icon_bg_path[3] )
        img_lock:setVisible(true)
        return
    else
        img_lock:setVisible(false)
        widget:setTouchEnabled(true)
        txt_name1:setVisible(true)
        txt_name2:setVisible(false)


        if idx == self.selectIdx then
            widget:setTextureNormal( icon_bg_path[2] )
            txt_name2:setVisible(true)
            txt_name1:setVisible(false)
        else
            widget:setTextureNormal( icon_bg_path[1] )
        end
    end
end

function IslandMain:refreshRewardPanel()
    if not self.tableView_reward then
        local tableView = TFTableView:create()
        tableView:setTableViewSize(self.panel_reward:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.tableView_reward = tableView
        self.tableView_reward.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable_reward)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex_reward)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView_reward)
        self.panel_reward:addChild(self.tableView_reward, 1)
    end
    self.tableView_reward:reloadData()
end

function IslandMain.numberOfCellsInTableView_reward(table)
    local self = table.logic
    return self.rewardList:length() or 0
end

function IslandMain.cellSizeForTable_reward(table,idx)
    --local self = table.logic
    if idx == 0 then
        return 100, 64
    else
        return 70, 64
    end
end

function IslandMain.tableCellAtIndex_reward(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local node = self.reward_cell:clone()
        local size = self.reward_cell:getSize()
        node:setPosition(ccp(size.width / 2 - 18, size.height / 2 - 60))
        node:setVisible(true)
        cell.node = node
        cell:addChild(node);
    end
    self:showNodeReward(cell.node, idx + 1)
    return cell
end

function IslandMain:showNodeReward(widget, idx)
    local img_icon = TFDirector:getChildByPath(widget, 'img_icon')
    local txt_num = TFDirector:getChildByPath(widget, 'txt_num')
    widget:setTouchEnabled(true)
    local reward = self.rewardList:objectAt(idx)
    txt_num:setText("X" .. reward.number)
    img_icon:setTexture( reward.path )
    Public:addPieceImg(img_icon, reward)
    widget:setTextureNormal( ( GetColorIconByQuality_118( reward.quality ) ) )
    widget:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            Public:ShowItemTipLayer(reward.itemid, reward.type)
        end)
    )
end

function IslandMain:registerEvents()
    self.btn_fanhui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onFanhuiClick))
    self.btn_guizhe:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRuleClick))
    self.btn_cgcj:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAchieveClick))
    self.btn_zd:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCreateTeamClick))

    -- self.receiveAllTeamCallBack = function(event)
    --     local selectChap = self.idxList[self.selectIdx] or 1
    --     JapanIslandManager:openCreateTeamLayer(selectChap)
    -- end
    -- TFDirector:addMEGlobalListener(JapanIslandManager.TEAM_DATA_REPONSE,self.receiveAllTeamCallBack)
end

function IslandMain:removeEvents()
    self.super.removeEvents(self)	 

    -- TFDirector:removeMEGlobalListener(JapanIslandManager.TEAM_DATA_REPONSE,self.receiveAllTeamCallBack)
    -- self.receiveAllTeamCallBack = nil
end

function IslandMain.onFanhuiClick( sender )
    local self = sender.logic
    
    local function callBack()
        AlertManager:close()
    end
    Public:addChangeLayerEffect(callBack)
end

function IslandMain.onRuleClick( sender )
    local self = sender.logic
    JapanIslandManager:openRuleLayer()
end

function IslandMain.onAchieveClick( sender )
    local self = sender.logic
    JapanIslandManager:openAchievementLayer()
end

function IslandMain.onCreateTeamClick( sender )
    local self = sender.logic
    local selectChap = self.idxList[self.selectIdx] or 1
    JapanIslandManager:openCreateTeamLayer(selectChap)
end

return IslandMain