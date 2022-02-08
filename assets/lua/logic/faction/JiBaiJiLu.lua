--[[
******帮派忠义堂祭拜记录*******

	-- by shenjingjie
	-- 2017/05/23
	
]]


local JiBaiJiLu = class("JiBaiJiLu",BaseLayer)

function JiBaiJiLu:ctor()
	self.super.ctor(self)
	self:init("lua.uiconfig_mango_new.faction.JiBaiJiLu")
end

function JiBaiJiLu:initUI( ui )
	self.super.initUI(self, ui)

	self.btn_close              = TFDirector:getChildByPath(ui, 'btn_close')
	self.panel_list             = TFDirector:getChildByPath(ui, 'panel_list')

	self.panel_cell_model = TFDirector:getChildByPath(self.panel_list, 'Panel' )
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()

end

function JiBaiJiLu:registerEvents()
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function JiBaiJiLu:removeEvents()
	self.super.removeEvents(self)
end

function JiBaiJiLu:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    self.super.removeUI(self)
end

function JiBaiJiLu:onShow()
	self.super.onShow(self)
	self:refreshUI()
end

function JiBaiJiLu:refreshUI()
	self.recordList = FactionManager:getWorshipRecodeInfo()
	if (self.recordList) then
		self.cellMax = #self.recordList
	end
	self:refreshTableView()
end

function JiBaiJiLu:refreshTableView( ... )
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

function JiBaiJiLu:cellSizeForTable( table, idx )
	return 70,700
end

function JiBaiJiLu:tableCellAtIndex( table, idx )
	idx = idx + 1
	local cell = table:dequeueCell()
	if nil == cell then
		cell = TFTableViewCell:create()
		local node = self.panel_cell_model:clone()
		node:setVisible(true)
		node:setPosition(ccp(0,0))
		cell:addChild(node,1)
		cell.panel = node
		
	end
	self:setCellInfo(cell,idx)
	return cell
end

function JiBaiJiLu:numberOfCellsInTableView( table )
	return self.cellMax
end


function JiBaiJiLu:setCellInfo( cell, idx )
	local panel = cell.panel

	local txt_day = TFDirector:getChildByPath(panel, 'txt_day')
	local txt_account = TFDirector:getChildByPath(panel, 'txt_Account')
	local img_x1 = TFDirector:getChildByPath(panel, 'img_x1')
	local img_x2 = TFDirector:getChildByPath(panel, 'img_x2')
	local txt_time = TFDirector:getChildByPath(panel, 'txt_time')
	if (cell.isRichText) then
		panel.richText:setVisible(false)
	end
	txt_account:setVisible(false)
	txt_day:setVisible(false)
	img_x1:setVisible(false)
	img_x2:setVisible(false)
	txt_time:setVisible(false)

	local recordInfo = self.recordList[idx]

	-- 显示日期
	if (recordInfo.spilt) then
		txt_day:setVisible(true)
		img_x1:setVisible(true)
		img_x2:setVisible(true)
		txt_day:setText(recordInfo.time)
	else 
		txt_account:setVisible(true)
		txt_time:setVisible(true)
		--时间
		local timeStr = os.date("%X",recordInfo.time * 0.001)
		txt_time:setText(stringUtils.format(localizable.FactionManager_jibai_1,timeStr))
		--拼接字符串
		local postStr = localizable.FactionManager_msgPostTemplate[recordInfo.position]	--职位	
		local drinkStr = localizable.FactionManager_msgDrinkTemplate[recordInfo.worshipType]	--祭拜类型
		local costStr = localizable.ResourceName[recordInfo.consumeType]	--花费货币类型 [3]="铜币"   [4]="元宝"

		--(帮主/帮众）XXX花费XX（铜币/元宝）进行了XX祭拜，忠义值+X，帮派繁荣度+X，帮派经验值+X，个人贡献+X。
		local strFormat = localizable.FactionManager_jibai_2
		local accountStr = stringUtils.format(strFormat, postStr, recordInfo.name, recordInfo.consume, costStr, drinkStr, 
											recordInfo.loyaltyNum, recordInfo.boomValue, recordInfo.experience,recordInfo.contribution)
		txt_account:setText(accountStr)
		txt_account:setTextAreaSize(CCSizeMake(600,0))
	end
end

return JiBaiJiLu