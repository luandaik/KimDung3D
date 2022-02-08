-- client side ZhenfaAccept.lua
--[[
 * @Description: 阵法置换界面
 ]]
-- script writer wuqi
-- creation time 2016-10-15

local ZhenfaAccept = class("ZhenfaAccept", BaseLayer)

function ZhenfaAccept:ctor(data)
	self.super.ctor(self, data)
    self.accoptGmId = 0
	self:init("lua.uiconfig_mango_new.smithy.SmritiAccept")
end

function ZhenfaAccept:initUI( ui )
	self.super.initUI(self,ui)
    self.ui = ui
    self.btn_close =  TFDirector:getChildByPath(ui, 'btn_shousuo')	
    self.panel_list = TFDirector:getChildByPath(ui, 'panel_cardregional')
end

function ZhenfaAccept:setGmId(gmId)
    self.old_equipList = StrategyCardManager:getAllCardEquippedFirst(1)
    local equip = StrategyCardManager:getStrategyCardByGmid(gmId)
    self.equipList = TFArray:new()
    if gmId ~= 0 then
        for v in self.old_equipList:iterator() do
            if v.quality == equip.quality and v.quality >= 4 and equip.gmId ~= v.gmId then
                self.equipList:push(v)
            end    
        end
    else
        for v in self.old_equipList:iterator() do
            if v.quality >= 4 then
                self.equipList:push(v)
            end    
        end
    end 
    self:initTableview()    
end

function ZhenfaAccept:initTableview()
	local  tableView =  TFTableView:create()
	tableView:setTableViewSize(self.panel_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    self.tableView = tableView
    self.tableView.logic = self
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, ZhenfaAccept.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, ZhenfaAccept.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, ZhenfaAccept.numberOfCellsInTableView)
	self.panel_list:addChild(tableView)

    self.tableView:reloadData()
end

function ZhenfaAccept.cellSizeForTable(table,idx)
    return 200,725
end
function ZhenfaAccept.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    self.allPanels = self.allPanels or {}
    local startOffset = 10
    local columnSpace = 10
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        for i=1,4 do
            local equip_panel = require('lua.logic.strategyCard.StrategyCardIcon'):new()
            local size = equip_panel:getSize()
	    	local x = size.width*(i-1)
	    	if i > 1 then
	    	    x = x + (i-1)*columnSpace
	    	end
            x = x + startOffset
            equip_panel:setPosition(ccp(x,-5))
            equip_panel:setLogic(self)
            cell:addChild(equip_panel)
            cell.equip_panel = cell.equip_panel or {}
            cell.equip_panel[i] = equip_panel
            local newIndex = #self.allPanels + 1
            self.allPanels[newIndex] = equip_panel
        end
    end
    for i=1,4 do
    	if (idx * 4 + i) <= self.equipList:length() then
	    	local equip = self.equipList:objectAt(idx * 4 + i)
    		cell.equip_panel[i]:setEquipGmId(equip.gmId)
    	else
    		cell.equip_panel[i]:setEquipGmId(nil)
    	end
    end
    return cell
end

function ZhenfaAccept.numberOfCellsInTableView(table)
	local self = table.logic
	if self.equipList and self.equipList:length() > 0 then
		local num = math.ceil(self.equipList:length()/4)
		if num < 2 then
			return 2
		else
			return num
		end
    end
    return 2
end

function ZhenfaAccept:setParent(parent)
	self.parent = parent
end

function ZhenfaAccept:setSelectId(accoptGmId)
	--self.parent:setAcceptId(accoptGmId)
    self.accoptGmId = accoptGmId
	self.onBtnClose(self.btn_close)
end


function ZhenfaAccept.onBtnClose(sender)
    local self = sender.logic
	self.ui:runAnimation("Action1",1)
    self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
        self.parent:setAcceptId(self.accoptGmId)
        AlertManager:close()
        end)
end


function ZhenfaAccept:removeUI()
   	self.super.removeUI(self)  
end

function ZhenfaAccept:onShow()
    self.super.onShow(self)
    self.ui:runAnimation("Action0",1)
end

function ZhenfaAccept:registerEvents()
	self.super.registerEvents(self)
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClose))
    self.btn_close.logic = self

    self.ui.logic = self
    self.ui:setTouchEnabled(true)
    --self.btn_shousuo:addMEListener(TFWIDGET_CLICK, audioClickfun(self.closeBtnClick))
    self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClose))
end

function ZhenfaAccept:removeEvents()
	self.super.removeEvents(self)
end


function ZhenfaAccept:dispose()
    self.super.dispose(self)
end

return ZhenfaAccept