-- client side LunJianJiangli.lua
--[[
 * @Description: 论剑峰奖励列表
 ]]
-- script writer wuqi
-- creation time 2016-06-22

local LunJianJiangli = class("LunJianJiangli", BaseLayer)

function LunJianJiangli:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianJiangli")
end

function LunJianJiangli:initUI( ui )
    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')
    self.panel_reward = TFDirector:getChildByPath(ui, "panel_reward")

    self.img_lineshang = TFDirector:getChildByPath(ui, "img_di2")
    self.img_linedi = TFDirector:getChildByPath(ui, "img_line")
    self.img_lineshang:setVisible(false)

    self.bg_rank = TFDirector:getChildByPath(ui, "bgMyPaiming")
    self.txt_rank = TFDirector:getChildByPath(ui, "paiming")
    self.panel_jiangli = TFDirector:getChildByPath(ui, "panel_jiangli")
end

function LunJianJiangli:refreshUI()
    self.rewardList1 = ChampionsAwardData:getAllRewardDataByType(7)
    self.rewardList2 = ChampionsAwardData:getAllRewardDataByType(8)

    table.sort(self.rewardList1, function(a, b)
        return a.min_rank < b.min_rank
    end)
    table.sort(self.rewardList2, function(a, b)
        return a.min_rank > b.min_rank
    end)

    self.txt_rank:setText(PeakManager.myRankInfo.myRanking)
    self:refreshRewardPanel()

    self:refreshTabView()
end

function LunJianJiangli:refreshRewardPanel()
    self.panel_jiangli:removeAllChildrenWithCleanup(true)
    local reward = PeakManager:getCurReward() or {}
    local baseX = 0
    local deltaX = 80
    for i = 1, #reward do
        local reward_item = Public:createIconNumNode(BaseDataManager:getReward(reward[i]))
        reward_item:setScale(0.6)
        reward_item:setPosition(ccp(baseX + deltaX * (i - 1), -5))
        self.panel_jiangli:addChild(reward_item)
    end
end

function LunJianJiangli:refreshTabView()
    if self.tabView then
        self.tabView:reloadData()
        return
    end
    local tabView = TFTableView:create()
    local size = self.panel_reward:getContentSize()
    local deltaX = 23
    tabView:setTableViewSize(CCSize(size.width - deltaX * 2, size.height))
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_reward:addChild(tabView)
    tabView:setPosition(ccp(deltaX, 0))
    self.tabView = tabView

    self.tabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    --self.tabView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
    self.tabView:reloadData()
end

function LunJianJiangli.cellSizeForTable(table, idx)
    return 110, 560
end

function LunJianJiangli.numberOfCellsInTableView(table)
    local self = table.logic    
    local num = #self.rewardList1 + #self.rewardList2
    return num
end

function LunJianJiangli.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = createUIByLuaNew("lua.uiconfig_mango_new.Lunjianfeng.LunJianJiangLicell")
        panel:setPosition(ccp(-22, 0))
        panel:setVisible(true)
        panel:setTag(100)
        cell:addChild(panel)
    end
    idx = idx + 1
    self:refreshCell(cell,idx)    
    return cell
end

function LunJianJiangli:refreshCell(cell, idx)
    local panel = cell:getChildByTag(100)
    local index = idx
    local img_rank = TFDirector:getChildByPath(panel, "img_shunxu")
    local panel_jiangli = TFDirector:getChildByPath(panel, "panel_jiangli")
    local txt_num = TFDirector:getChildByPath(panel, "txt_num66")
    local txt_num1 = TFDirector:getChildByPath(panel, "txt_num1")
    local txt_num2 = TFDirector:getChildByPath(panel, "txt_num2")
    txt_num:setVisible(true)
    txt_num1:setVisible(true)
    local num1 = #(self.rewardList1)
    local num2 = #(self.rewardList2)
    local item = self.rewardList1[index] or self.rewardList2[index - num1]

    local type = 1
    if index > num1 then
        type = 2
    end

    if index <= 3 then
        img_rank:setVisible(true)
        img_rank:setTexture("ui_new/leaderboard/no" .. index .. ".png") 
        txt_num:setText("")  
        txt_num1:setVisible(false) 
    else
        img_rank:setVisible(false)
        if type == 1 then
            txt_num:setText(item.min_rank .. "-" .. item.max_rank)
            --txt_num:setVisible(true)
            txt_num1:setVisible(false)
        elseif type == 2 then
            txt_num:setText("")  
            txt_num1:setVisible(true)
            txt_num2:setText(item.min_rank)
        end        
    end
    local function refreshReward(item)
        panel_jiangli:removeAllChildrenWithCleanup(true)
        local reward = item:getReward()
        local baseX = 0
        local deltaX = 80
        for i = 1, #reward do
            local reward_item = Public:createIconNumNode(BaseDataManager:getReward(reward[i]))
            reward_item:setScale(0.6)
            reward_item:setPosition(ccp(baseX + deltaX * (i - 1), 5))
            panel_jiangli:addChild(reward_item)
        end
    end
    refreshReward(item)
end

function LunJianJiangli.tableScroll(table)
    local self = table.logic
    local currPosY = self.tabView:getContentOffset().y
    local sizeHeight = self.tabView:getContentSize().height
    local size = self.tabView:getSize().height

    if currPosY >= 0 then
        self.img_linedi:setVisible(false)
    else
        self.img_linedi:setVisible(true)
    end

    if size - currPosY >= sizeHeight then
        self.img_lineshang:setVisible(false)
    else
        self.img_lineshang:setVisible(true)
    end
end

function LunJianJiangli:removeUI()
    self.super.removeUI(self)
end

function LunJianJiangli:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function LunJianJiangli:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

    self.onActivityStatusHandler = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)

    self.onActivityStatusHandler_0 = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
end

function LunJianJiangli:removeEvents()
    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    self.super.removeEvents(self)
end

return LunJianJiangli