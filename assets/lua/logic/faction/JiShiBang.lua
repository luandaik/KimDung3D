--[[
******帮派济世堂排行*******

	-- by shenjingjie
	-- 2017/05/10
	
]]
local JiShiBang = class("JiShiBang",BaseLayer)

function JiShiBang:ctor()
	self.super.ctor(self)
	self:init("lua.uiconfig_mango_new.faction.JiShiBang")
end

function JiShiBang:initUI( ui )

	self.super.initUI(self, ui)

	self.btn_close              = TFDirector:getChildByPath(ui, 'btn_close')
	self.panel_list             = TFDirector:getChildByPath(ui, 'Panel_paiming')

	self.img_mypaiming  		= TFDirector:getChildByPath(ui, 'img_mypaiming')
	self.txt_myrank				= TFDirector:getChildByPath(self.img_mypaiming, 'txt_rank')
	self.txt_weirubang			= TFDirector:getChildByPath(self.img_mypaiming, 'txt_weirubang')
	self.img_numberbg			= TFDirector:getChildByPath(ui, 'img_numberbg')
	self.txt_myxiayi			= TFDirector:getChildByPath(self.img_numberbg, 'txt_shuliang')

	self.img_lineUp				= TFDirector:getChildByPath(ui, 'img_fengeup')
	self.img_lineDowm			= TFDirector:getChildByPath(ui, 'img_fengedown')

	self.panel_cell_model = TFDirector:getChildByPath(ui, 'img_paimingbg' )
    self.panel_cell_model:removeFromParent(false)
    self.panel_cell_model:retain()

end

function JiShiBang:registerEvents()
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
	local onRefreshUI = function()
		self:refreshUI()
	end
	TFDirector:addMEGlobalListener(FactionJiShiTangManager.REFRESH_JISHIBANG_INFO, onRefreshUI)
end

function JiShiBang:removeEvents()
	TFDirector:removeMEGlobalListener(FactionJiShiTangManager.REFRESH_JISHIBANG_INFO)

	self.super.removeEvents(self)
end

function JiShiBang:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    self.super.removeUI(self)
end

function JiShiBang:onShow()
	self.super.onShow(self)
	self:refreshUI()
end

function JiShiBang:refreshUI()
	self:refreshTableView()
	local myRankInfo = FactionJiShiTangManager:getMyRankInfo()
	if myRankInfo ~= nil and myRankInfo.myRanking ~= nil then
		if myRankInfo.myRanking <= 0 then
			self.txt_myrank:setVisible(false)
		else
			self.txt_weirubang:setVisible(false)
			self.txt_myrank:setText(myRankInfo.myRanking)
		end
		self.txt_myxiayi:setText(myRankInfo.myErrantry)
	end
	local btn_more = TFDirector:getChildByPath(self.panel_list, 'btn_more')
	btn_more:setVisible(false)
end

function JiShiBang:refreshTableView()
	if self.tableView == nil then
		local tableView = TFTableView:create()

		self.tableView = tableView
		tableView:setTableViewSize(self.panel_list:getContentSize())
		tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
		tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

		self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable, self))
		self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex, self))
		self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView, self))
		self.tableView:addMEListener(TFTABLEVIEW_SCROLL, handler(self.tableScroll, self))
		self.panel_list:addChild(tableView)
	end
	self.tableView:reloadData()
end

function JiShiBang:cellSizeForTable(table, idx)
	return 80,630
end

function JiShiBang:tableCellAtIndex(table, idx)
	idx = idx + 1
	local cell = table:dequeueCell()
	if nil == cell then
		cell = TFTableViewCell:create()
		local node = self.panel_cell_model:clone() 
		node:setPositionY(40)
		node:setVisible(true)
		cell:addChild(node, 1)
		cell.panel = node
	end
	self:setCell(cell, idx)
	return cell
end

function JiShiBang:numberOfCellsInTableView(table)
	local rankInfo = FactionJiShiTangManager:getFactionRankInfo()
	local num = 0
	if rankInfo ~= nil then
		num = #rankInfo
	end
	return num
end

function JiShiBang:tableScroll(table)
	local size = self.tableView:getTableViewSize()
    local size2 = self.tableView:getContentSize()
    local pos = self.tableView:getContentOffset()

    if pos.y >= 0 then
        self.img_lineDowm:setVisible(false)
    else
        self.img_lineDowm:setVisible(true)
    end

end

function JiShiBang:setCell(cell, idx)
	local panel = cell.panel

	local rankInfo = FactionJiShiTangManager:getFactionRankInfoByIdx( idx )
	if rankInfo == nil then 
		return
	end
	local txt_name = TFDirector:getChildByPath(panel, 'txt_playername')
	local txt_paiming = TFDirector:getChildByPath(panel, 'txt_paiming')
	local img_mingci = TFDirector:getChildByPath(panel, 'img_mingci')
	local txt_bangpai = TFDirector:getChildByPath(panel, 'txt_bangpai')
	local txt_jine = TFDirector:getChildByPath(panel, 'txt_jine')
	local bg_touxiang = TFDirector:getChildByPath(panel, 'bg_touxiang')
	local img_head = TFDirector:getChildByPath(panel, 'img_head')

	-- 排名前3为显示排名icon,之后为数字名次
	if rankInfo.rank > 3 then
		img_mingci:setVisible(false)
		txt_paiming:setText(rankInfo.rank)
		txt_paiming:setVisible(true)
	else
		txt_paiming:setVisible(false)
		img_mingci:setVisible(true)
		img_mingci:setTexture("ui_new/leaderboard/no"..rankInfo.rank..".png")
	end

	txt_jine:setText(rankInfo.errantry)
	txt_bangpai:setText(rankInfo.guildName)
	txt_name:setText(rankInfo.playerName)

	--设置人物头像
	local RoleIcon = RoleData:objectByID(rankInfo.useCoin) 
	img_head:setTexture(RoleIcon:getIconPath())
	Public:addInfoListen(img_head, true, 3, rankInfo.playerId)
	Public:addFrameImg(bg_touxiang,rankInfo.frameId)
end


return JiShiBang