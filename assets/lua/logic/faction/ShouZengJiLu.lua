--[[
******帮派济世堂受赠记录*******

	-- by shenjingjie
	-- 2017/05/11
	
]]

local ShouZengJiLu = class("ShouZengJiLu",BaseLayer)

function ShouZengJiLu:ctor()
	self.super.ctor(self)
	self:init("lua.uiconfig_mango_new.faction.ShouZengJiLu")
end

function ShouZengJiLu:initUI( ui )
	self.super.initUI(self, ui)

	self.btn_close              = TFDirector:getChildByPath(ui, 'btn_close')
	self.panel_list             = TFDirector:getChildByPath(ui, 'panel_list')

	self.panel_cell_model = TFDirector:getChildByPath(self.panel_list, 'Panel' )
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()

    self.cellMax = 0
    self.recordList = nil
end

function ShouZengJiLu:registerEvents()
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

	local onRefreshUI = function()
		self:refreshUI()
	end
	TFDirector:addMEGlobalListener(FactionJiShiTangManager.REFRESH_SHOUZENGJILU_INFO, onRefreshUI)
end

function ShouZengJiLu:removeEvents()
	TFDirector:removeMEGlobalListener(FactionJiShiTangManager.REFRESH_SHOUZENGJILU_INFO)

	self.super.removeEvents(self)
end

function ShouZengJiLu:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    self.super.removeUI(self)
end

function ShouZengJiLu:onShow()
	self.super.onShow(self)
	self:refreshUI()
end

function ShouZengJiLu:refreshUI()
	self.recordList = FactionJiShiTangManager:getFactionGiveRecordInfo()
	if (self.recordList) then
		self.cellMax = #self.recordList
	end
	self:refreshTableView()
end

function ShouZengJiLu:refreshTableView()
	if self.tableView == nil then
		local tableView = TFTableView:create()
		tableView:setTableViewSize(self.panel_list:getContentSize())
		tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
		tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

		self.tableView = tableView

		self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable, self))
		self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex, self))
		self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView, self))
		--self.tableView:setAnchorPoint(ccp(0, 0))
		--self.tableView:setPosition(ccp(0,0))
		self.panel_list:addChild(tableView)
	end
	self.tableView:reloadData()
end

function ShouZengJiLu:cellSizeForTable( table, idx )
	return 50,700
end

function ShouZengJiLu:tableCellAtIndex( table, idx )
	idx = idx + 1
	local cell = table:dequeueCell()
	if nil == cell then
		cell = TFTableViewCell:create()
		local node = self.panel_cell_model:clone()
		node:setVisible(true)

		node:setPosition(ccp(0,0))
		--node:setAnchorPoint(ccp(0, 0))
		cell:addChild(node,1)
		cell.panel = node
		cell.isRichText = false
		
	end
	self:setCellInfo(cell,idx)
	return cell
end

function ShouZengJiLu:numberOfCellsInTableView( table )
	return self.cellMax
end

function ShouZengJiLu:setCellInfo( cell, idx )

	local panel = cell.panel

	local txt_day = TFDirector:getChildByPath(panel, 'txt_day')
	local txt_account = TFDirector:getChildByPath(panel, 'txt_Account')
	local img_x1 = TFDirector:getChildByPath(panel, 'img_x1')
	local img_x2 = TFDirector:getChildByPath(panel, 'img_x2')
	if (cell.isRichText) then
		panel.richText:setVisible(false)
	end
	txt_account:setVisible(false)
	txt_day:setVisible(false)
	img_x1:setVisible(false)
	img_x2:setVisible(false)


	local recordInfo = self.recordList[idx]

	-- 显示日期
	if (recordInfo.spilt) then
		txt_day:setVisible(true)
		img_x1:setVisible(true)
		img_x2:setVisible(true)
		txt_day:setText(recordInfo.time)
	else  	--显示获赠记录
		--	道具信息
		local commonReward = {}
	    commonReward.type   = EnumDropType.GOODS
	    commonReward.itemId = tonumber(recordInfo.templateId)
	    commonReward.number = tonumber(recordInfo.num)
	    local itemInfo = BaseDataManager:getReward(commonReward)
		local goodsColor = GetColorStringByQuality(itemInfo.quality)
		
		--拼接字符串
		local timeStr = os.date("%X",recordInfo.time)
		local strFormat = localizable.factionJiShiTang_ShouZeng
		local accountStr = stringUtils.format(strFormat, timeStr, recordInfo.playerName, goodsColor, itemInfo.name, recordInfo.num)

		--富文本获赠记录
		if (cell.isRichText == false) then
			local richText = TFRichText:create()
		    richText:setTouchEnabled(true)
		    richText:setVisible(true)
		    richText:setPosition(txt_account:getPosition())
		    richText:setAnchorPoint(ccp(0, 0.5))
		    richText:setText(accountStr)
			panel:addChild(richText)
			panel.richText = richText
			cell.isRichText = true
		else
			panel.richText:setText(accountStr)
			panel.richText:setVisible(true)
		end

	end
end



return ShouZengJiLu