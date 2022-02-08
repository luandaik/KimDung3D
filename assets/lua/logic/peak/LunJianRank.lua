-- client side LunJianRank.lua
--[[
 * @Description: 论剑峰排行榜
 ]]
-- script writer wuqi
-- creation time 2016-06-22

local LunJianRank = class("LunJianRank",BaseLayer)

local cell_height = 60

function LunJianRank:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianRank")
end

function LunJianRank:initUI( ui )
	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.panel_list = TFDirector:getChildByPath(ui, "panel_paiming")    
    
    self.txt_myrank = TFDirector:getChildByPath(ui, "txt_listnum")
    self.txt_myscore = TFDirector:getChildByPath(ui, "txt_jifennum")
    self.txt_needscore = TFDirector:getChildByPath(ui, "txt_jiangli")
    
    self.panel_cell = TFDirector:getChildByPath(ui, "bg_1")
    self.panel_cell:retain()
    self.panel_cell:removeFromParent()
    self.panel_cell:setVisible(false)

    self.img_lineshang = TFDirector:getChildByPath(ui, "img_lineshang")
    self.img_linedi = TFDirector:getChildByPath(ui, "img_linedi")
    self.img_lineshang:setVisible(false)

    self.btn_reward = TFDirector:getChildByPath(ui, "btn_pmjl")
    self.btn_reward.logic = self
    self.panel_jiangli = TFDirector:getChildByPath(ui, "panel_jiangli")

    self:createTableView()
end

function LunJianRank:removeUI()
	self.super.removeUI(self)    
end

function LunJianRank:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function LunJianRank:refreshUI()   
    self.tableView:reloadData()
    if self.oldNum then
        local deltaY = cell_height * (#PeakManager.rankInfo - self.oldNum)
        self.tableView:setContentOffset(ccp(0, -deltaY))
    end
    
    local myRank = PeakManager.myRankInfo.myRanking or 0
    if myRank > 0 then
        self.txt_myrank:setText(myRank)
    else
        self.txt_myrank:setText(localizable.shalu_info_txt1)
    end
    local myScore = PeakManager.myRankInfo.myIntegral or 0
    local bestIntegral = PeakManager.myRankInfo.bestIntegral or 0
    self.txt_myscore:setText(myScore)
    local needScore = (bestIntegral - myScore)
    if needScore <= 0 then
        self.txt_needscore:setText('')
    else
        self.txt_needscore:setText(stringUtils.format(localizable.LunjianFeng_txt_rank1, needScore))
    end
    
    self:refreshRewardPanel()
end

function LunJianRank:refreshRewardPanel()
    self.panel_jiangli:removeAllChildrenWithCleanup(true)
    local reward = PeakManager:getCurReward()
    local baseX = 0
    local deltaX = 75

    if reward then
        for i = 1, #reward do
            local reward_item = Public:createIconNumNode(BaseDataManager:getReward(reward[i]))
            reward_item:setScale(0.5)
            reward_item:setPosition(ccp(baseX + deltaX * (i - 1), 5))
            self.panel_jiangli:addChild(reward_item)
        end
    end
end

function LunJianRank:createTableView()
    local tabView =  TFTableView:create()
    tabView:setTableViewSize(self.panel_list:getContentSize())
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_list:addChild(tabView)
    tabView:setPosition(ccp(0, 0))
    self.tableView = tabView

    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tableView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
    Public:bindScrollFun(self.tableView)
end

function LunJianRank:registerEvents()
	self.super.registerEvents(self)
    self.btn_reward:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnRewardHandle), 1)

    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

    self.onActivityStatusHandler = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(MainPlayer.ServerSwitchChange,self.onActivityStatusHandler)

    self.onActivityStatusHandler_0 = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
end

function LunJianRank:removeEvents()
    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    self.super.removeEvents(self)
end

function LunJianRank:dispose()
	self.super.dispose(self)
end

function LunJianRank.btnRewardHandle(sender)
    local self = sender.logic
    PeakManager:openRewardLayer()
end

function LunJianRank.cellSizeForTable(table,idx)
    local num = LunJianRank.numberOfCellsInTableView()
    if idx == num - 1 then
        return 67,710
    end
    return 57, 710
end

function LunJianRank.numberOfCellsInTableView(table)
    local num = 0

    if PeakManager.rankInfo then
        num = #PeakManager.rankInfo
        if not PeakManager.bRankFull then
            num = num + 1
        end
    end
    return num
end

function LunJianRank.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell:clone()
        panel:setPosition(ccp(0,0))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end

    local rankInfo = PeakManager.rankInfo[idx + 1]
    local btn = TFDirector:getChildByPath(cell.panel, "bg_more")
    cell.panel:setVisible(true) 
    local num = LunJianRank.numberOfCellsInTableView()
    if idx == num - 1 then
        cell.panel:setPositionY(10)
    else
        cell.panel:setPositionY(0)
    end
    if idx + 1 > #PeakManager.rankInfo then
        btn:setVisible(true)
        btn.logic = self
        btn.index = idx + 1
        btn:setTouchEnabled(true)
        btn:addMEListener(TFWIDGET_CLICK, audioClickfun(self.ongBtnMoreHanle))
    else
        btn:setVisible(false)
        self:setPanelRankInfo(cell.panel, rankInfo, idx + 1)
    end
    return cell
end

function LunJianRank.ongBtnMoreHanle(sender)
    local self = sender.logic
    local index = sender.index

    self.oldNum = #PeakManager.rankInfo

    PeakManager:requestRankingInfo(index)
end

function LunJianRank:setPanelRankInfo(panel, rankInfo, rank)
    local playerName = TFDirector:getChildByPath(panel, "txt_name")
    local guildName = TFDirector:getChildByPath(panel, "txt_qufu")
    local lbServerName = TFDirector:getChildByPath(panel, "txt_qufu-Copy1")
    local lbScore = TFDirector:getChildByPath(panel, "txt2")
    if rankInfo ~= nil then
        -- local serverId = tonumber(string.split(rankInfo.serverName,"_")[2])
        -- local serverInfo = SaveManager:getServerInfo(serverId)
        -- local serverName = ""
        -- if serverInfo then
        --     serverName = serverInfo.name
        -- end

        playerName:setText(rankInfo.name)
        guildName:setText(rankInfo.guildName)
        lbServerName:setText(rankInfo.serverName)
        lbScore:setText(rankInfo.integral)
    else
        playerName:setText('')
        guildName:setText('')
        lbServerName:setText('')
        lbScore:setText('')
    end

    local img_rank = TFDirector:getChildByPath(panel, "img_shunxu")
    local txt_rank = TFDirector:getChildByPath(panel, "txt_shunxu")
    if rank <= 3 then
        img_rank:setVisible(true)
        txt_rank:setVisible(false)
        img_rank:setTexture("ui_new/leaderboard/no"..rank..".png")
    else
        img_rank:setVisible(false)
        txt_rank:setVisible(true)
        txt_rank:setText(rank)
    end
end

function LunJianRank.tableScroll(table)
    local self = table.logic
    local currPosY = self.tableView:getContentOffset().y
    local sizeHeight = self.tableView:getContentSize().height
    local size = self.tableView:getSize().height

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

return LunJianRank