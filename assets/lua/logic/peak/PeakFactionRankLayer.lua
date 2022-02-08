-- client side PeakFactionRankLayer.lua
--[[
 * @Description: 论剑峰帮派排行
 ]]
-- script writer chikui
-- creation time 2017-02-13

local PeakFactionRankLayer = class("PeakFactionRankLayer", BaseLayer)

function PeakFactionRankLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianBPRank")
end

function PeakFactionRankLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')

    self.txt_zengyinum = TFDirector:getChildByPath(ui, 'txt_zengyinum')
    self.txt_jifennum = TFDirector:getChildByPath(ui, 'txt_jifennum')
    self.txt_listnum = TFDirector:getChildByPath(ui, 'txt_listnum')

    self.img_di1 = TFDirector:getChildByPath(ui, 'img_linedi')
    self.img_di2 = TFDirector:getChildByPath(ui, 'img_lineshang')

    self.panel_list = TFDirector:getChildByPath(ui, 'panel_paiming')
    self.panel_cell_model = TFDirector:getChildByPath(ui, "bg_1")
    self.panel_cell_model:setVisible(false)
    self.panel_cell_model:retain()
    self.panel_cell_model:removeFromParent()
end

function PeakFactionRankLayer:refreshTabView()
    if self.tabView then
        self.tabView:reloadData()
        return
    end
    self.dataList = PeakManager:getFactionRank()
    local tabView = TFTableView:create()
    tabView:setTableViewSize(self.panel_list:getContentSize())
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_list:addChild(tabView)
    self.tabView = tabView

    self.tabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tabView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
    self.tabView:reloadData()
end

function PeakFactionRankLayer.tableScroll(table)
    local self = table.logic
    local size = self.tabView:getTableViewSize()
    local size2 = self.tabView:getContentSize()
    local pos = self.tabView:getContentOffset()
    if pos.y <= size.height - size2.height then
        self.img_di2:setVisible(false)
    else
        self.img_di2:setVisible(true)
    end
    if pos.y >= 0 then
        self.img_di1:setVisible(false)
    else
        self.img_di1:setVisible(true)
    end
end

function PeakFactionRankLayer.cellSizeForTable(table, idx)
    return 65, 771
end

function PeakFactionRankLayer.numberOfCellsInTableView(table)
    local self = table.logic    
    local num = #self.dataList + 1
    return num
end

function PeakFactionRankLayer.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell_model:clone()
        panel:setPositionY(0)
        panel:setVisible(true)
        cell.panel = panel
        cell:addChild(panel)
    end
    local btn = TFDirector:getChildByPath(cell.panel, "bg_more")
    cell.panel:setVisible(true)
    if idx + 1 > #self.dataList then
        btn:setVisible(true)
        btn.logic = self
        btn.index = idx + 1
        btn:setTouchEnabled(true)
        btn:addMEListener(TFWIDGET_CLICK, audioClickfun(self.ongBtnMoreHanle))
        self:setPanelRankInfo(cell.panel,nil,idx + 1)
    else
    	local rankInfo = self.dataList[idx + 1]
        btn:setVisible(false)
        self:setPanelRankInfo(cell.panel, rankInfo, idx + 1)
    end
    return cell
end

function PeakFactionRankLayer.ongBtnMoreHanle(sender)
    local self = sender.logic
    local index = sender.index
    index = math.floor(index/10)
    index = index * 10 + 1
    self.oldNum = #self.dataList
    PeakManager:requestFactionRank(index)
end

function PeakFactionRankLayer:setPanelRankInfo(panel, rankInfo, rank)
    local guildName = TFDirector:getChildByPath(panel, "txt_bp")
    local lbServerName = TFDirector:getChildByPath(panel, "txt_qufu")
    local img_rank = TFDirector:getChildByPath(panel, "img_shunxu")
    local txt_rank = TFDirector:getChildByPath(panel, "txt_shunxu")
    local lbScore = TFDirector:getChildByPath(panel, "txt2")
    if rankInfo ~= nil then
        guildName:setText(rankInfo.guildName)
        lbServerName:setText(rankInfo.serverName)
        lbScore:setText(rankInfo.integra)
    else
        guildName:setText('')
        lbServerName:setText('')
        lbScore:setText('')
        img_rank:setVisible(false)
        txt_rank:setVisible(false)
        return
    end

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

function PeakFactionRankLayer:removeUI()
    self.super.removeUI(self)
end

function PeakFactionRankLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function PeakFactionRankLayer:refreshUI()
    self:refreshTabView()
    local rank = PeakManager:getMyFactionRank()
    print("myrank = ",rank)
    if rank == 0 then
        self.txt_listnum:setText(localizable.shalu_info_txt1)
        self.txt_zengyinum:setText("0%")
    else
        self.txt_listnum:setText(rank .. '')
        local per = 0
        local item = PeakManager:getGuildAttri(rank)
        if item then
            per = item.attribute
        end
        self.txt_zengyinum:setText(per / 100 .. "%")
    end
	local integral = PeakManager:getMyFactionIntegral()
	self.txt_jifennum:setText(integral)
end

function PeakFactionRankLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
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

    self.onRankMoreHandler = function(event)
        self.dataList = PeakManager:getFactionRank()
        self:refreshUI()
        if self.oldNum then
            local deltaY = 65 * (#self.dataList - self.oldNum)
            self.tabView:setContentOffset(ccp(0, -deltaY))
        end
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_FACTION_RANK ,self.onRankMoreHandler)
end

function PeakFactionRankLayer:removeEvents()
	TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_FACTION_RANK ,self.onRankMoreHandler)
    self.super.removeEvents(self)
end

return PeakFactionRankLayer