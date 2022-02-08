-- client side XilingJiangli.lua
--[[
 * @Description: 西岭奖励列表
 ]]
-- script writer wuqi
-- creation time 2016-06-29

local XilingJiangli = class("XilingJiangli", BaseLayer)

function XilingJiangli:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.climb.XilingJiangli")
end

function XilingJiangli:initUI( ui )
    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')
    self.panel_reward = TFDirector:getChildByPath(ui, "panel_reward")

    self.img_lineshang = TFDirector:getChildByPath(ui, "img_di2")
    self.img_linedi = TFDirector:getChildByPath(ui, "img_line")
    self.img_lineshang:setVisible(false)

    self.bg_rank = TFDirector:getChildByPath(ui, "bgMyPaiming")
    self.txt_no_rank = TFDirector:getChildByPath(self.bg_rank, "txtrankNo")
    self.txt_rank = TFDirector:getChildByPath(self.bg_rank, "paiming")
    self.panel_jiangli = TFDirector:getChildByPath(ui, "panel_jiangli")

    self.txt_no_rank:setVisible(false)

    self.bgMyceng = TFDirector:getChildByPath(ui, "bgMyceng")
    self.txtrankNo = TFDirector:getChildByPath(self.bgMyceng, "txtrankNo")
end

function XilingJiangli:refreshUI()
    self.rewardList = ChampionsAwardData:getAllRewardDataByType(WestClimbManager.REWARD_LIST_TYPE)

    table.sort(self.rewardList, function(a, b)
        return a.min_rank < b.min_rank
    end)
    if WestClimbManager.myRanking and WestClimbManager.myRanking > 0 then
        self.txt_rank:setText(WestClimbManager.myRanking)
        self.txt_no_rank:setVisible(false)
        self.txt_rank:setVisible(true)
    else
        self.txt_no_rank:setVisible(true)
        self.txt_rank:setVisible(false)
    end
    local serdangInfo = WestClimbManager:getSerdangInfo()
    local num = 0
    if serdangInfo and serdangInfo.floorId then
        num = serdangInfo.floorId
    end
    self.txtrankNo:setText(num)
    self:refreshRewardPanel()
    self:refreshTabView()
end

function XilingJiangli:refreshRewardPanel()
    self.panel_jiangli:removeAllChildrenWithCleanup(true)
    local reward = WestClimbManager:getCurReward() or {}
    local baseX = 0
    local deltaX = 80
    for i = 1, #reward do
        local reward_item = Public:createIconNumNode(BaseDataManager:getReward(reward[i]))
        reward_item:setScale(0.6)
        reward_item:setPosition(ccp(baseX + deltaX * (i - 1), -5))
        self.panel_jiangli:addChild(reward_item)
    end
end

function XilingJiangli:refreshTabView()
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
    self.tabView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
    self.tabView:reloadData()
end

function XilingJiangli.cellSizeForTable(table, idx)
    if idx + 1 <= WestClimbManager:getJiangliShowIndex() then
        return 130, 560
    end
    return 110, 560
end

function XilingJiangli.numberOfCellsInTableView(table)
    local self = table.logic    
    local num = #self.rewardList
    return num
end

function XilingJiangli.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = createUIByLuaNew("lua.uiconfig_mango_new.climb.XilingJiangLicell")
        panel:setPosition(ccp(-22, 0))
        panel:setVisible(true)
        panel:setTag(100)
        cell:addChild(panel)
    end
    idx = idx + 1
    self:refreshCell(cell,idx)    
    return cell
end

function XilingJiangli:refreshCell(cell, idx)
    local panel = cell:getChildByTag(100)
    local index = idx

    local bg1 = TFDirector:getChildByPath(panel, "bg1")
    local bg2 = TFDirector:getChildByPath(panel, "bg2")

    local txt_num1 = TFDirector:getChildByPath(bg1, "txt_num66")
    local panel_jiangli1 = TFDirector:getChildByPath(bg1, "panel_jiangli")

    local img_rank = TFDirector:getChildByPath(bg2, "img_shunxu")
    local txt_name = TFDirector:getChildByPath(bg2, "txt_name")
    local txt_fwq = TFDirector:getChildByPath(bg2, "txt_fwq")
    local txt_num2 = TFDirector:getChildByPath(bg2, "txt_num77")
    local panel_jiangli2 = TFDirector:getChildByPath(bg2, "panel_jiangli")
    local txt_dangqian = TFDirector:getChildByPath(panel, "txt_dangqian")
    local txt_ceng = TFDirector:getChildByPath(panel, "txt_ceng")

    local function setShow(bTrue)
        local wTab = {txt_ceng, txt_dangqian, txt_name, txt_fwq, txt_num2}
        for i = 1, #wTab do
            wTab[i]:setVisible(bTrue)
        end
    end
    setShow(true)
    
    local num = #(self.rewardList)
    local item = self.rewardList[index]
    local rankInfo = WestClimbManager:getRankInfo()

    local function refreshReward(panel_jiangli, item)
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

    if index <= WestClimbManager:getJiangliShowIndex() then
        bg1:setVisible(false)
        bg2:setVisible(true)
        img_rank:setVisible(true)
        img_rank:setTexture("ui_new/leaderboard/no" .. index .. ".png") 

        if rankInfo and rankInfo[index] then            
            local serverId = rankInfo[index].serverId % 1000
            local str = "S" .. serverId
            txt_fwq:setText(str)
            txt_name:setText(rankInfo[index].playerName)
            txt_num2:setText(rankInfo[index].floorId)
        end
        refreshReward(panel_jiangli2, item)

        local tempNum = 0
        if rankInfo then
            tempNum = #rankInfo
        end
        if index > tempNum then
            setShow(false)
        end
    else
        bg1:setVisible(true)
        bg2:setVisible(false)
        txt_num1:setText(item.min_rank .. "-" .. item.max_rank)
        refreshReward(panel_jiangli1, item)       
    end
end

function XilingJiangli.tableScroll(table)
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

function XilingJiangli:removeUI()
    self.super.removeUI(self)
end

function XilingJiangli:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function XilingJiangli:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function XilingJiangli:removeEvents()
    self.super.removeEvents(self)
end

return XilingJiangli