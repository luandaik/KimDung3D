-- client side GuildBossRankLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-04-14



local GuildBossRankLayer = class("GuildBossRankLayer", BaseLayer)
function GuildBossRankLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.faction.YanWuRank")
end

function GuildBossRankLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.btn_close              = TFDirector:getChildByPath(ui, 'btn_close')
    self.panel_list             = TFDirector:getChildByPath(ui, 'panel_paiming')
    self.img_lineshang          = TFDirector:getChildByPath(ui, 'img_lineshang')
    self.img_linedi             = TFDirector:getChildByPath(ui, 'img_linedi')
    self.btn_jdsp               = TFDirector:getChildByPath(ui, 'btn_jdsp')

    self.panel_wbpm               = TFDirector:getChildByPath(ui, 'panel_wbpm')
    self.txt_wbpm               = TFDirector:getChildByPath(self.panel_wbpm, 'txt_listnum')
    self.panel_wbjp               = TFDirector:getChildByPath(ui, 'panel_wbjp')
    self.txt_wbjp               = TFDirector:getChildByPath(self.panel_wbjp, 'txt_listnum')

    self.panel_cell_model = TFDirector:getChildByPath(ui, 'bg_1' )
    self.panel_cell_model:removeFromParent(false)
    self.panel_cell_model:retain()
end

function GuildBossRankLayer:registerEvents()
    self.super.registerEvents(self)
    self.btn_jdsp:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnSSRankClick),1)
    self.btn_jdsp.logic = self
    
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function GuildBossRankLayer:removeEvents()
    self.super.removeEvents(self)
end


function GuildBossRankLayer:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    self.super.removeUI(self)
end

function GuildBossRankLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function GuildBossRankLayer:dispose()
    self.super.dispose(self)
end

function GuildBossRankLayer:refreshUI()
    self:refreshTableView()
    local rankList = GuildBossManager:getRankInfo(GuildBossManager.RankType_1)
    if rankList == nil then
        self.panel_wbpm:setVisible(false)
        self.panel_wbjp:setVisible(false)
        return
    end
    self.panel_wbpm:setVisible(true)
    self.panel_wbjp:setVisible(true)

    if rankList.myRanking <= 0 then
        self.txt_wbpm:setText(localizable.shalu_info_txt1)
    else
        self.txt_wbpm:setText(rankList.myRanking)
    end
    
    if rankList.myStage <= 0 then
        self.txt_wbjp:setText(localizable.common_not_record)
    else
        self.txt_wbjp:setText(rankList.myStage)
    end
end

function GuildBossRankLayer:refreshTableView()
    if self.tableView == nil then
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


function GuildBossRankLayer:cellSizeForTable(table,idx)
    return 56,771
end

function GuildBossRankLayer:tableCellAtIndex(table, idx)
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

function GuildBossRankLayer:numberOfCellsInTableView(table)
    local num = GuildBossManager:getRankSize(GuildBossManager.RankType_1)
    if num < 0 then num = 0 end
    return num
end

function GuildBossRankLayer:tableScroll(table)
    local size = self.tableView:getTableViewSize()
    local size2 = self.tableView:getContentSize()
    local pos = self.tableView:getContentOffset()
    if pos.y <= size.height - size2.height then
        self.img_lineshang:setVisible(false)
    else
        self.img_lineshang:setVisible(true)
    end
    if pos.y >= 0 then
        self.img_linedi:setVisible(false)
    else
        self.img_linedi:setVisible(true)
    end
end

function GuildBossRankLayer:setCellInfo(cell,idx)
    local panel = cell.panel
    
    local rankList = GuildBossManager:getRankInfo(GuildBossManager.RankType_1)
    if rankList == nil or rankList.guildBossRank == nil or rankList.guildBossRank[idx] == nil then
        panel:setVisible(false)
        return
    end
    local rankInfo = rankList.guildBossRank[idx]

    local txt_name = TFDirector:getChildByPath(panel, 'txt_name')
    local img_rank = TFDirector:getChildByPath(panel, 'img_shunxu')
    local txt_rank = TFDirector:getChildByPath(panel, 'txt_shunxu')
    local txt_qufu = TFDirector:getChildByPath(panel, 'txt_qufu')
    local txt_time = TFDirector:getChildByPath(panel, 'txt2')
    local txt_grade = TFDirector:getChildByPath(panel, 'txt_jd')
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

    if rankInfo.rank <= 3 then
        img_rank:setVisible(true)
        txt_rank:setVisible(false)
        img_rank:setTexture("ui_new/leaderboard/no"..rankInfo.rank..".png")
    else
        img_rank:setVisible(false)
        txt_rank:setVisible(true)
        txt_rank:setText(rankInfo.rank)
    end
end

function GuildBossRankLayer.OnSSRankClick( sender )
    local self = sender.logic
    GuildBossManager:requestRank(GuildBossManager.RankType_2)
end

return GuildBossRankLayer