-- client side BossFightRankLayer.lua
--[[
 * @Description: 伏魔录服务器排行榜
 ]]
-- script writer wuqi
-- creation time 2016-07-28

local BossFightRankLayer = class("BossFightRankLayer", BaseLayer)

local cell_height = 60

function BossFightRankLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.demond.demondjishapaiming")
end

function BossFightRankLayer:initUI( ui )
	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "Btn_close")
    self.btn_close.logic = self
    self.panel_list = TFDirector:getChildByPath(ui, "Panel_paiming")

    self.panel_cell = TFDirector:getChildByPath(ui, "img_paimingcell")
    self.panel_cell:retain()
    self.panel_cell:removeFromParent()
    self.panel_cell:setVisible(false)
    self.txt_server_paiming = TFDirector:getChildByPath(ui, "txt_myfwqpaiming")

    self:createTableView()
end

function BossFightRankLayer:removeUI()
	self.super.removeUI(self)    
    
    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
end

function BossFightRankLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function BossFightRankLayer:refreshUI()   
    self.tableView:reloadData()
    
    local rank = BossFightManager:getMyServerRank()
    local str = localizable.fumo_myserver_no_rank
    if rank and rank ~= 0 then
        str = stringUtils.format( localizable.fumo_myserver_rank, numberToChinese(rank) )
    end
    self.txt_server_paiming:setText( str )
end

function BossFightRankLayer:createTableView()
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
    Public:bindScrollFun(self.tableView)
end

function BossFightRankLayer:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function BossFightRankLayer:removeEvents()
    self.super.removeEvents(self)
end

function BossFightRankLayer:dispose()
	self.super.dispose(self)
end

function BossFightRankLayer.cellSizeForTable(table, idx)
    return 90, 720
end

function BossFightRankLayer.numberOfCellsInTableView(table)
    return #BossFightManager:getServerRankInfo()
end

function BossFightRankLayer.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell:clone()
        panel:setAnchorPoint(ccp(0, 0))
        panel:setPosition(ccp(10, 0))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end

    local temp = BossFightManager:getServerRankInfo()
    local rankInfo = temp[idx + 1]
    cell.panel:setVisible(true) 
    --[[
    local num = BossFightRankLayer.numberOfCellsInTableView()
    if idx == num - 1 then
        cell.panel:setPositionY(10)
    else
        cell.panel:setPositionY(0)
    end
    ]]
    self:setPanelRankInfo(cell.panel, rankInfo, idx + 1)
    
    return cell
end

function BossFightRankLayer:setPanelRankInfo(panel, rankInfo, rank)
    local playerName = TFDirector:getChildByPath(panel, "txt_playername")
    local lbServerName = TFDirector:getChildByPath(panel, "txt_fuwuqiname")
    local txt_jieduanshu = TFDirector:getChildByPath(panel, "txt_jieduanshu")

    playerName:setText(rankInfo.name)
    lbServerName:setText('s' .. math.mod(rankInfo.serverId, 1000))
    local lev = rankInfo.dieCount
    if (not lev) or (lev == 0) then
        lev = 1
    end
    local levStr = stringUtils.format(localizable.fumo_boss_jieduan, numberToChinese( lev ))
    txt_jieduanshu:setText(levStr)

    local img_rank = TFDirector:getChildByPath(panel, "Image_demondjishapaiming_1")
    local txt_rank = TFDirector:getChildByPath(panel, "LabelBMFont_demondjishapaiming_1")
    if rank <= 3 then
        img_rank:setVisible(true)
        txt_rank:setVisible(false)
        img_rank:setTexture("ui_new/leaderboard/no"..rank..".png")
    else
        img_rank:setVisible(false)
        txt_rank:setVisible(true)
        txt_rank:setText(rank)
    end

    local img_playericon = TFDirector:getChildByPath(panel, "img_playericon")
    local roleData = RoleData:objectByID(rankInfo.useCoin)
    img_playericon:setTexture(roleData:getIconPath())

    local btn_playericonbg = TFDirector:getChildByPath(panel, "btn_playericonbg")
    btn_playericonbg:setTextureNormal( GetColorIconByQuality(roleData.quality) )

    Public:addInfoListen(btn_playericonbg,true,5,rankInfo.playerId,rankInfo.serverId)
end

return BossFightRankLayer