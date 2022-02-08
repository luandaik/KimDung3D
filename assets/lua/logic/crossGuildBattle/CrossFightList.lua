-- client side CrossFightList.lua
--[[
 * @Description: 跨服争锋战排名
 ]]
-- script writer Stephen.tao
-- creation time 2016-05-24

local CrossFightList = class("CrossFightList",BaseLayer)

function CrossFightList:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossfight.CrossFightList")
end

function CrossFightList:initUI( ui )

	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.panel_list = TFDirector:getChildByPath(ui, "panel_paiming")
    self.txt_benbang = TFDirector:getChildByPath(ui, "txt_benbang")
    self.txt_slz = TFDirector:getChildByPath(ui, "txt_slz")

    self.panel_cell = TFDirector:getChildByPath(ui, "bg_1")
    self.panel_cell:retain()
    self.panel_cell:removeFromParent(true)
    self.panel_cell:setVisible(false)



    self.img_lineshang = TFDirector:getChildByPath(ui, "img_lineshang")
    self.img_linedi = TFDirector:getChildByPath(ui, "img_linedi")
    self.img_lineshang:setVisible(false)

    self:createTableView()
end


function CrossFightList:removeUI()
	self.super.removeUI(self)
    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
end

function CrossFightList:onShow()
    self.super.onShow(self)
    self:freshUI()
end

function CrossFightList:freshUI()
    self.tableView:reloadData()
    local txt_rank_num = TFDirector:getChildByPath(self.txt_benbang , "txt_num")
    local txt_wsb = TFDirector:getChildByPath(self.txt_benbang , "txt_wsb")
    local txt_score_num = TFDirector:getChildByPath(self.txt_slz , "txt_num")
    local score = 0
    if CrossGuildBattleManager.allCityInfo then
        if CrossGuildBattleManager.allCityInfo.myRank and CrossGuildBattleManager.allCityInfo.myRank > 0 then
            txt_wsb:setVisible(false)
            txt_rank_num:setVisible(true)
            txt_rank_num:setText(CrossGuildBattleManager.allCityInfo.myRank)
            local guildInfo = CrossGuildBattleManager.allCityInfo.guildList[CrossGuildBattleManager.allCityInfo.myRank]
            if guildInfo then
                score = guildInfo.score
            end
        else
            txt_wsb:setVisible(true)
            txt_rank_num:setVisible(false)
        end
    end
    txt_score_num:setText(score)
end

function CrossFightList:createTableView()
    local tabView =  TFTableView:create()
    tabView:setTableViewSize(self.panel_list:getContentSize())
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_list:addChild(tabView)
    tabView:setPosition(ccp(18,0))
    self.tableView = tabView


    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tableView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
end

function CrossFightList:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
end

function CrossFightList:removeEvents()
    self.super.removeEvents(self)
end

function CrossFightList:dispose()
	self.super.dispose(self)
end

function CrossFightList.cellSizeForTable(table,idx)
    return 60,710
end

function CrossFightList.numberOfCellsInTableView(table)
    local num = 0
    if CrossGuildBattleManager.allCityInfo and CrossGuildBattleManager.allCityInfo.guildList then
        num = #CrossGuildBattleManager.allCityInfo.guildList
    end
    return num
end

function CrossFightList.tableCellAtIndex(table, idx)

    local self = table.logic;

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell:clone()
        panel:setPosition(ccp(0,0))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end

    local guildInfo = CrossGuildBattleManager.allCityInfo.guildList[idx+1]
    if guildInfo then
        cell.panel:setVisible(true)
        self:setPanelGuildInfo(cell.panel , guildInfo,idx+1)
    else
        cell.panel:setVisible(false)
    end
    return cell
end

function CrossFightList:setPanelGuildInfo( panel , guildInfo ,rank)
    local lbGuildName = TFDirector:getChildByPath(panel,"txt_name")
    lbGuildName:setText(guildInfo.guildName)
    local lbScore = TFDirector:getChildByPath(panel,"txt2")
    lbScore:setText(guildInfo.score)
    local lbServerName = TFDirector:getChildByPath(panel,"txt_qufu")
    lbServerName:setText(guildInfo.serverName)
    local img_rank = TFDirector:getChildByPath(panel,"img_shunxu")
    local txt_rank = TFDirector:getChildByPath(panel,"txt_shunxu")
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


function CrossFightList.tableScroll(table)
    local self = table.logic
    local currPosY = self.tableView:getContentOffset().y
    local sizeHeight = self.tableView:getContentSize().height
    local size = self.tableView:getSize().height
    -- local initY = sizeHeight - 60*5 + 2
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
return CrossFightList