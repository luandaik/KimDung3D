--[[
******返利转盘记录*******

	-- by shenjingjie
	-- 2017/11/9
	
]]

local Activity_FanLiZhuanPanRecode = class("Activity_FanLiZhuanPanRecode",BaseLayer)

function Activity_FanLiZhuanPanRecode:ctor()
	self.super.ctor(self)
	self:init("lua.uiconfig_mango_new.operatingactivities.FanLiChouRecord")
end

function Activity_FanLiZhuanPanRecode:initUI( ui )
	self.super.initUI(self, ui)

	self.btn_close              = TFDirector:getChildByPath(ui, 'btn_close')
	self.panel_list             = TFDirector:getChildByPath(ui, 'panel_huadong')

	self.panel_cell_model = TFDirector:getChildByPath(ui, 'panel_cell' )
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()

    self.cellMax = 0
    self.recordList = nil
end

function Activity_FanLiZhuanPanRecode:registerEvents()
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
	
end

function Activity_FanLiZhuanPanRecode:removeEvents()
	self.super.removeEvents(self)
end

function Activity_FanLiZhuanPanRecode:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    self.super.removeUI(self)
end

function Activity_FanLiZhuanPanRecode:onShow()
	self.super.onShow(self)
	self:refreshUI()
end

function Activity_FanLiZhuanPanRecode:refreshUI()
	self.recordList = FanLiZhuanPanManager:getRecord()
	if (self.recordList) then
		self.cellMax = #self.recordList
	end
	self:refreshTableView()
end

function Activity_FanLiZhuanPanRecode:refreshTableView()
	if self.tableView == nil then
		local tableView = TFTableView:create()
		tableView:setTableViewSize(self.panel_list:getContentSize())
		tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
		tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

		self.tableView = tableView

		self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable, self))
		self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex, self))
		self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView, self))

		self.panel_list:addChild(tableView)
	end
	self.tableView:reloadData()
end

function Activity_FanLiZhuanPanRecode:cellSizeForTable( table, idx )
	return 45,700
end

function Activity_FanLiZhuanPanRecode:tableCellAtIndex( table, idx )
	idx = idx + 1
	local cell = table:dequeueCell()
	if nil == cell then
		cell = TFTableViewCell:create()
		local node = self.panel_cell_model:clone()
		node:setVisible(true)

		node:setPosition(ccp(0,-20))
		--node:setAnchorPoint(ccp(0, 0))
		cell:addChild(node,1)
		cell.panel = node
		cell.isRichText = false
		
	end
	self:setCellInfo(cell,idx)
	return cell
end

function Activity_FanLiZhuanPanRecode:numberOfCellsInTableView( table )
	return self.cellMax
end

function Activity_FanLiZhuanPanRecode:setCellInfo( cell, idx )

	local panel = cell.panel

	local txt_day = TFDirector:getChildByPath(panel, 'txt_date')
	local txt_account = TFDirector:getChildByPath(panel, 'txt_time')
	local img_x1 = TFDirector:getChildByPath(panel, 'img_x1')
	local img_x2 = TFDirector:getChildByPath(panel, 'img_x2')
	--这个不需要显示
	TFDirector:getChildByPath(panel, 'txt_wenzi'):setVisible(false)
	
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
	else  	--显示记录
		--	道具信息
		local commonReward = {}
	    commonReward.type   = EnumDropType.GOODS
	    commonReward.itemId = tonumber(recordInfo.itemId)
	    commonReward.number = tonumber(recordInfo.number)
	    local itemInfo = BaseDataManager:getReward(commonReward)
		local goodsColor = GetColorStringByQuality(itemInfo.quality)
		
		--拼接字符串
		local timeStr = os.date("%X",recordInfo.gainTime)
		local strFormat = localizable.activity_fanli_Recode
		local accountStr = stringUtils.format(strFormat, timeStr, goodsColor, itemInfo.name, recordInfo.number)

		--富文本记录
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



return Activity_FanLiZhuanPanRecode