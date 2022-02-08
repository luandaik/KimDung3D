-- client side GuildBossFirstKillRankLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-04-14


local GuildBossFirstKillRankLayer = class("GuildBossFirstKillRankLayer", BaseLayer)
function GuildBossFirstKillRankLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.faction.YanWuShouPo")
end

function GuildBossFirstKillRankLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.btn_close              = TFDirector:getChildByPath(ui, 'btn_close')
    self.panel_list             = TFDirector:getChildByPath(ui, 'panel_paiming')
    self.img_lineshang          = TFDirector:getChildByPath(ui, 'img_lineshang')

    self.panel_cell_model = TFDirector:getChildByPath(ui, 'bg_1' )
    self.panel_cell_model:removeFromParent(false)
    self.panel_cell_model:retain()
end

function GuildBossFirstKillRankLayer:registerEvents()
    self.super.registerEvents(self)
    
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function GuildBossFirstKillRankLayer:removeEvents()
    self.super.removeEvents(self)
end


function GuildBossFirstKillRankLayer:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    self.super.removeUI(self)
end

function GuildBossFirstKillRankLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function GuildBossFirstKillRankLayer:dispose()
    self.super.dispose(self)
end

function GuildBossFirstKillRankLayer:refreshUI()
    self:refreshTableView()
end

function GuildBossFirstKillRankLayer:refreshTableView()
    if self.tableView == nil then
        self:restoreData()
        local  tableView =  TFTableView:create()

        self.tableView = tableView
        tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView,self))
        self.tableView:addMEListener(TFTABLEVIEW_SCROLL, handler(self.tableScroll,self))
        self.panel_list:addChild(tableView)
    end
    self.tableView:reloadData()
end

function GuildBossFirstKillRankLayer:restoreData()
    local rankList = GuildBossManager:getRankInfo(GuildBossManager.RankType_2) or {}
    self.dataList = rankList.guildBossRank or {}
    local sorFunc = function( rankInfo1,rankInfo2 )
        return rankInfo1.stage > rankInfo2.stage
    end
    table.sort( self.dataList, sorFunc )
end

function GuildBossFirstKillRankLayer:cellSizeForTable(table,idx)
    return 64,771
end

function GuildBossFirstKillRankLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_cell_model:clone()
        node:setVisible(true)
        node:setPositionY(0)
        cell:addChild(node,1)
        cell.panel = node
    end
    self:setCellInfo(cell,idx)
    return cell
end

function GuildBossFirstKillRankLayer:numberOfCellsInTableView(table)
    local num = GuildBossManager:getRankSize(GuildBossManager.RankType_2)
    if num < 0 then num = 0 end
    return num
end

function GuildBossFirstKillRankLayer:tableScroll(table)
    local size = self.tableView:getTableViewSize()
    local size2 = self.tableView:getContentSize()
    local pos = self.tableView:getContentOffset()
    if pos.y <= size.height - size2.height then
        self.img_lineshang:setVisible(false)
    else
        self.img_lineshang:setVisible(true)
    end
end

function GuildBossFirstKillRankLayer:setCellInfo(cell,idx)
    local panel = cell.panel
    
    local rankInfo = self.dataList[ idx ]
    if rankInfo == nil then
        panel:setVisible(false)
        return
    end

    local txt_name = TFDirector:getChildByPath(panel, 'txt_bp')
    local txt_qufu = TFDirector:getChildByPath(panel, 'txt_qufu')
    local txt_time = TFDirector:getChildByPath(panel, 'txt2')
    local txt_grade = TFDirector:getChildByPath(panel, 'txt_shunxu')
    local bg_more = TFDirector:getChildByPath(panel, 'bg_more')
    bg_more:setVisible(false)

    txt_grade:setText(stringUtils.format(localizable.EquipGradeUpCount,rankInfo.stage))
    txt_name:setText(rankInfo.guildName)
    txt_qufu:setText(rankInfo.serverName)

    local totalSec = rankInfo.time
    local hour = math.floor(totalSec/3600)
    totalSec = totalSec - hour * 3600
    local min = math.floor(totalSec/60)
    local sec = math.floor(totalSec - min * 60)
    local strList = ""
    if hour > 0 then
        strList = strList .. hour .. localizable.time_hour_txt0
    end
    if min > 0 then
        strList = strList .. min .. localizable.time_minute_txt0
    end
    if sec <= 0 then 
        sec = 0
    end
    strList = strList..sec..localizable.time_second_txt
    txt_time:setText(strList)
end

function GuildBossFirstKillRankLayer.OnSSRankClick( sender )
    local self = sender.logic
    GuildBossManager:requestRank(GuildBossManager.RankType_2)
end

return GuildBossFirstKillRankLayer