--region *.lua
--Date
--选择传承装备
local SmritiSelect = class("SmritiSelect",BaseLayer)

local listTypeName = {
    "ui_new/equipment/tjp_quanbu1_icon.png",
    "ui_new/equipment/tjp_wuqi1_icon.png",
    "ui_new/equipment/tjp_yifu1_icon.png",
    "ui_new/equipment/tjp_jiezhi1_icon.png",
    "ui_new/equipment/tjp_yaodai1_icon.png",
    "ui_new/equipment/tjp_xiezi1_icon.png",
    }
local btnChoiceName = {
    "ui_new/equipment/tjp_quanbu_icon.png",
    "ui_new/equipment/tjp_wuqi_icon.png",
    "ui_new/equipment/tjp_yifu_icon.png",
    "ui_new/equipment/tjp_jiezhi_icon.png",
    "ui_new/equipment/tjp_yaodai_icon.png",
    "ui_new/equipment/tjp_xiezi_icon.png",
}


function SmritiSelect:ctor(data)
	self.super.ctor(self, data)
    self.equipType = 0
	self:init("lua.uiconfig_mango_new.smithy.SmritiSelect")
    self.selectGmId = 0 
end

function SmritiSelect:initUI( ui )
	self.super.initUI(self,ui)
    self.ui = ui
	self.btn_close =  TFDirector:getChildByPath(ui, 'btn_shousuo')
	self.panel_list = TFDirector:getChildByPath(ui, 'panel_cardregional')
    self.img_di1 = TFDirector:getChildByPath(ui, 'img_di')
    self.img_di2 = TFDirector:getChildByPath(ui, 'img_di2')

    self.panel_choice   = TFDirector:getChildByPath(ui, 'panel_choice')
    self.panel_choice:setVisible(false)
    self.panel_choice.logic = self

    self.btn_choice = {}
    for i=1,5 do
        local str = "btn_choice_" .. i
        self.btn_choice[i] = TFDirector:getChildByPath(ui, str)
        self.btn_choice[i].tag = i
        self.btn_choice[i].logic = self
    end
    self.btn_listType = TFDirector:getChildByPath(ui, 'btn_listType')
    self.btn_listType.logic = self
    self.img_listType = TFDirector:getChildByPath(ui, 'img_listType')
    self.btn_listType:setVisible(true)
end

function SmritiSelect:initTableview()
    if self.tableView then
        self.tableView:reloadData()
        self.tableView:setScrollToBegin()
    else
    	local  tableView =  TFTableView:create()
    	tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(0)
        self.tableView = tableView
        self.tableView.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, SmritiSelect.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, SmritiSelect.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, SmritiSelect.numberOfCellsInTableView)
        tableView:addMEListener(TFTABLEVIEW_SCROLL, SmritiSelect.tableScroll)
    	self.panel_list:addChild(tableView)

        self.tableView:reloadData()
    end
end

function SmritiSelect.cellSizeForTable(table,idx)
    return 216,725
end
function SmritiSelect.tableCellAtIndex(table, idx)
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
            local equip_panel = require('lua.logic.smithy.SmithyEquipIcon'):new()
            local size = equip_panel:getSize()
	    	local x = size.width*(i-1)
	    	if i > 1 then
	    	    x = x + (i-1)*columnSpace
	    	end
            x = x + startOffset
            equip_panel:setPosition(ccp(x,20))
            equip_panel:setSmritiLogic(self)
            cell:addChild(equip_panel)
            cell.equip_panel = cell.equip_panel or {}
            cell.equip_panel[i] = equip_panel
            local newIndex = #self.allPanels + 1
            self.allPanels[newIndex] = equip_panel
        end
    end
    for i=1,4 do
        local count = self.equipList:length()
    	if (idx * 4 + i) <= self.equipList:length() then
	    	local equip = self.equipList:objectAt(idx * 4 + i)
    		cell.equip_panel[i]:setEquipGmId(equip.gmId)
    	else
    		cell.equip_panel[i]:setEquipGmId(nil)
    	end
    end
    return cell
end

function SmritiSelect.numberOfCellsInTableView(table)
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

function SmritiSelect.tableScroll(table)
    local self = table.logic
    local size = self.tableView:getTableViewSize()
    local size2 = self.tableView:getContentSize()
    local pos = self.tableView:getContentOffset()
    if pos.y == size.height - size2.height then
        self.img_di2:setVisible(false)
    else
        self.img_di2:setVisible(true)
    end
    if pos.y == 0 then
        self.img_di1:setVisible(false)
    else
        self.img_di1:setVisible(true)
    end
end

function SmritiSelect:setParent(parent)
	self.parent = parent
end

function SmritiSelect:setSelectId(selectGmId) 
	--self.parent:setSelectId(selectGmId)
    self.selectGmId = selectGmId
	self.onBtnClose(self.btn_close)
end

function SmritiSelect:setGmId(gmId)
    gmId = gmId or 0
    self.gmId = gmId
    self.old_equipList = EquipmentManager:GetAllEquipInWarSideFirst(0)
    local equip = EquipmentManager:getEquipByGmid(gmId)
    self.equipList1 = TFArray:new()
    if gmId ~= 0 then
        -- for v in self.old_equipList:iterator() do
        --     if v.equipType == equip.equipType and v.quality == equip.quality and v.quality>= 4 and equip.gmId ~= v.gmId then
        --         self.equipList1:push(v)
        --     end    
        -- end
        if equip.quality <= 4 then
            for v in self.old_equipList:iterator() do
                if v.equipType == equip.equipType and v.quality == equip.quality and equip.gmId ~= v.gmId then
                    self.equipList1:push(v)
                end    
            end
        else
            for v in self.old_equipList:iterator() do
                if v.equipType == equip.equipType and v.quality<=6 and v.quality >= 5 and equip.gmId ~= v.gmId then
                    self.equipList1:push(v)
                end    
            end
        end
    else
        for v in self.old_equipList:iterator() do
            if v.quality >= 4  then
                self.equipList1:push(v)
            end    
        end
    end

    self.equipList = TFArray:new()
    if self.equipType and self.equipType == 0 then
        self.equipList = self.equipList1
    else
        for v in self.equipList1:iterator() do
            if self.equipType and self.equipType > 0 and self.equipType == v.equipType then
                self.equipList:push(v)
            end
        end
    end    
     
    self:initTableview()    
end


function SmritiSelect.onBtnClose(sender)
    local self = sender.logic
    self.ui:runAnimation("Action1",1)
    self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
        self.parent:setSelectId(self.selectGmId)
        AlertManager:close()
        end)

end

function SmritiSelect:removeUI()
   	self.super.removeUI(self)  
end

function SmritiSelect:onShow()
    self.super.onShow(self)
    self.ui:runAnimation("Action0",1)
end

function SmritiSelect:registerEvents()
	self.super.registerEvents(self)
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClose))   
    self.btn_close.logic = self 

    self.ui.logic = self
    self.ui:setTouchEnabled(true)
    --self.btn_shousuo:addMEListener(TFWIDGET_CLICK, audioClickfun(self.closeBtnClick))
    self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClose))

    self.btn_listType:addMEListener(TFWIDGET_CLICK, audioClickfun(self.listTypeClickHandle))
    for i = 1, #self.btn_choice do
        self.btn_choice[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnChoiceClickHandle))
    end
end

function SmritiSelect.listTypeClickHandle(sender)
    local self = sender.logic
    if self.panel_choice:isVisible() then
        self.panel_choice:setVisible(false)
    else
        self.panel_choice:setVisible(true)
    end
end

function SmritiSelect.btnChoiceClickHandle(sender)
    local self = sender.logic
    self.equipType = sender.tag

    if self.equipType == 0 then
        self.img_listType:setTexture(listTypeName[1])
    else
        self.img_listType:setTexture(listTypeName[self.equipType + 1])
    end
    local temp = 1
    for i=0,5 do
        if i ~= self.equipType then
            self.btn_choice[temp].tag = i
            if i == 0 then
                self.btn_choice[temp]:setTextureNormal(btnChoiceName[1])
            else
                self.btn_choice[temp]:setTextureNormal(btnChoiceName[i+1])
            end
            temp = temp + 1
        end
    end

    self:setGmId(self.gmId)

    self.panel_choice:setVisible(false)
end

function SmritiSelect:removeEvents()
	self.super.removeEvents(self)
end


function SmritiSelect:dispose()
    self.super.dispose(self)
end

return SmritiSelect


--endregion
