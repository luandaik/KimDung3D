

local TianMingSelect = class("TianMingSelect",BaseLayer)

local columnNumber = 3

function TianMingSelect:ctor()
	self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.role_new.TianMingXiangQian")
end

function TianMingSelect:initUI( ui )
	self.super.initUI(self, ui)
    self.Panel                 = TFDirector:getChildByPath(ui, 'Panel')
	self.panel_cardregional   = TFDirector:getChildByPath(ui, 'panel_content')
    local panel = self.panel_cardregional
	self.panel_huadong = TFDirector:getChildByPath(panel, 'panel_huadong')
	self.txt_zhiyin1 = TFDirector:getChildByPath(panel, 'txt_zhiyin1')
	self.btn_shousuo = TFDirector:getChildByPath(panel, 'btn_shousuo')
    self.btn_xiangqian = TFDirector:getChildByPath(panel, 'btn_xiangqian')


	self.cellModel = createUIByLuaNew("lua.uiconfig_mango_new.role_new.TianMingXiangQianCell")
    self.cellModel:retain()

    self.img_di1 = TFDirector:getChildByPath(panel, "img_guodu")
    self.img_di1:setVisible(false)

    self.btn_shousuo:setZOrder(30)
    self.TianMingidx = 0
    self.pos = 0
    self.list = {}
    self.type = true --一开始选中第一个
    self.kind1 = 0
    self.kind2 = 0
    self.kind3 = 0
end

function TianMingSelect:tableScroll(table)
    local self = table.logic

    local size = self.tableView:getTableViewSize()
    local size2 = self.tableView:getContentSize()
    local pos = self.tableView:getContentOffset()
    if pos.y == size.height - size2.height then
        self.img_di1:setVisible(false)
    else
        self.img_di1:setVisible(true)
    end
end


function TianMingSelect:initDate( role_list, pos,roleId,kind1,kind2,kind3)
	self.TianmingList = role_list
	self.showText = showText
    self.roleId = roleId
    self.kind1 = kind1
    self.kind2 = kind2
    self.kind3 = kind3
    self.pos = pos

    local tUnSelect = {}
    local tCanSelect = {}

    for i,v in ipairs(self.TianmingList.m_list) do
        if v.config.kind == kind1 or v.config.kind == kind2 or v.config.kind == kind3 then
            if (v.config.special_equipment ~= 1) then
                table.insert(tUnSelect, v)
            end
        else
            if (v.config.special_equipment ~= 1) then
                table.insert(tCanSelect, v)
            end
        end
    end

    local sortFunc = function ( a, b )
        if a.quality == b.quality then
            if a.level == b.level then
                return a.exp > b.exp
            else
                return a.level > b.level
            end
        else
            return a.quality > b.quality
        end
    end

    table.sort(tUnSelect, sortFunc)
    table.sort(tCanSelect, sortFunc)

    table.insertTo(tCanSelect, tUnSelect)

    self.TianmingList.m_list = tCanSelect

    if self.tableView == nil then
        self:creatTableView()
    end
end

function TianMingSelect:creatTableView()
    if  self.tableView == nil then 
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_huadong:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(0)
        tableView:setPosition(self.panel_huadong:getPosition())
        self.tableView = tableView
        self.tableView.logic = self
    
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, TianMingSelect.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, TianMingSelect.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, TianMingSelect.numberOfCellsInTableView)
        tableView:addMEListener(TFTABLEVIEW_SCROLL, handler(TianMingSelect.tableScroll,self))
        self.panel_huadong:getParent():addChild(self.tableView,1)
    end
    self.tableView:reloadData()
end


function TianMingSelect.cellSizeForTable(table,cell)
	return 190,600
    --return 193,600
end

function TianMingSelect.tableCellAtIndex(table,idx)
	local self = table.logic
    local cell = table:dequeueCell()
    self.allPanels = self.allPanels or {}

    if cell == nil then
        cell = TFTableViewCell:create()
        local newIndex = #self.allPanels + 1
        self.allPanels[newIndex] = cell

        for i=1,columnNumber do
            local panel = self.cellModel:clone()
            panel:setPosition(ccp(10 + 140 * (i - 1) ,0))
            cell:addChild(panel)
            panel:setTag(i)
        end
    end
    for i=1,columnNumber do
        local panel = cell:getChildByTag(i)
        self:cellInfoSet(panel, idx*columnNumber+i)
    end

    return cell
end



function TianMingSelect:cellInfoSet( panel, idx )
    panel.boundData         = true
    panel.panelEmpty        = TFDirector:getChildByPath(panel, "panel_empty")
    panel.panelInfo         = TFDirector:getChildByPath(panel, "panel_info")
    panel.img_pinzhiditu    = TFDirector:getChildByPath(panel, "img_back")
    panel.img_icon          = TFDirector:getChildByPath(panel, "img_icon")
    panel.img_soul          = TFDirector:getChildByPath(panel, 'img_soul1')
    panel.txt_lv            = TFDirector:getChildByPath(panel, "txt_lv")
    panel.txt_name          = TFDirector:getChildByPath(panel, "txt_name")
    panel.img_quality       = TFDirector:getChildByPath(panel, "img_quality")
    panel.img_selected_fg   = TFDirector:getChildByPath(panel, "img_selected_fg")
    panel.img_xuanzhong     = TFDirector:getChildByPath(panel, "img_xuanzhong")
    panel.img_jingyan       = TFDirector:getChildByPath(panel, "img_jingyan")
    panel.img_black         = TFDirector:getChildByPath(panel, "img_black")
    panel.txt_num           = TFDirector:getChildByPath(panel.img_jingyan, "txt_num")
    panel.panel_star        = TFDirector:getChildByPath(panel, "panel_star")
    panel.txt_starlv        = TFDirector:getChildByPath(panel.panel_star, "txt_starlv")
    panel.panel_star:setVisible(false)
    panel.img_selected_fg:setVisible(false)
    panel.img_black:setVisible(false)
    panel.img_icon.idx = idx
    panel.img_icon:setTouchEnabled(true)
    panel.img_icon:addMEListener(TFWIDGET_CLICK, 
    audioClickfun(function()    
        if panel.kind == self.kind1 or panel.kind == self.kind2 or panel.kind == self.kind3 then
            toastMessage(localizable.TianMing_tips7)
        else
            if self.TianMingidx ~= panel.img_icon.idx then
                if self.TianMingidx ~= 0 then
                    self.list[self.TianMingidx].img_selected_fg:setVisible(false)
                end
                panel.img_selected_fg:setVisible(true)
                self.TianMingidx = panel.img_icon.idx
            end
        end
        end))
    panel.img_icon.logic = self
    if self.type == true and panel.img_icon.idx == 1 then
        self.type = false
        panel.img_selected_fg:setVisible(true)
        self.TianMingidx = panel.img_icon.idx
    end
    if self.type == false and self.TianMingidx == panel.img_icon.idx then
        panel.img_selected_fg:setVisible(true)
    end
    self.list[idx] = panel
    local roleItem = self.TianmingList:objectAt(idx);
    if roleItem then
        panel.panelEmpty:setVisible(true)
        panel.panelInfo:setVisible(true)
        panel.img_soul:setVisible(false)
        if roleItem.level >= 1 then
            panel.img_soul:setVisible(true)
            panel.txt_lv:setText(roleItem.level)
        end
        panel.img_icon:setTexture(roleItem.config:GetPath())
        panel.txt_num:setText("+"..roleItem.config.price + roleItem.exp)
        panel.img_quality:setTexture(GetColorIconByQuality(roleItem.quality))
        panel.kind = roleItem.config.kind 
        panel.txt_name:setText(roleItem.config.name)
        if roleItem.config.kind == self.kind1 or roleItem.config.kind == self.kind2 or roleItem.config.kind == self.kind3 then
            panel.img_black:setVisible(true)
        else
            panel.img_black:setVisible(false)
        end
        if roleItem.starnum > 0 or roleItem.starLevel > 0  then
            panel.panel_star:setVisible(true)
            panel.txt_starlv:setText(roleItem.starnum)
        end
    else
        panel.panelEmpty:setVisible(true)
        panel.panelInfo:setVisible(false)
    end
end

function TianMingSelect.numberOfCellsInTableView(table,cell)
    local self = table.logic
	if self.TianmingList == nil then
		return 0
	end
	return math.ceil(self.TianmingList:length()/columnNumber)
end


function TianMingSelect.cellButtonClick( btn )
    local self = btn.logic
    local Item = self.TianmingList:objectAt(self.TianMingidx)
    if Item then
        self:moveOut()
        TianMingManager:sendEquipDestiny(Item.instanceId,self.pos,self.roleId)   
    else
        toastMessage(localizable.TianMing_SELE_XUANZHONG)
    end
end

function TianMingSelect:removeUI()
	self.super.removeUI(self)

	if self.cellModel then
        self.cellModel:release()
        self.cellModel = nil
    end
end

function TianMingSelect:onShow()
    self.super.onShow(self)
    if TianMingManager.selectLayer == false then
        self:moveIn()
        TianMingManager.selectLayer = true
    end
end

function TianMingSelect.closeBtnClick(btn)
    local self = btn.logic
    -- AlertManager:close()
    -- if TianMingManager.selectLayer == true then
        self:moveOut()

    -- end
end


function TianMingSelect:moveIn()
    self.ui:runAnimation("Action0",1)
end
function TianMingSelect:moveOut()
    self.ui:runAnimation("Action1",1)
    self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
        AlertManager:close()
        end)
    TianMingManager.selectLayer = false
end

function TianMingSelect:registerEvents()
	self.btn_shousuo.logic = self
	self.ui.logic = self
    --self.ui:setTouchEnabled(true)
	self.btn_shousuo:addMEListener(TFWIDGET_CLICK, audioClickfun(self.closeBtnClick))
	--self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.closeBtnClick))
    self.btn_xiangqian.logic = self
    self.btn_xiangqian:addMEListener(TFWIDGET_CLICK, audioClickfun(self.cellButtonClick))
	self.super.registerEvents(self)
end

function TianMingSelect:removeEvents()
	self.isFirst = true
    self.super.removeEvents(self)
end

function TianMingSelect:dispose()
	self.super.dispose(self)
end


return TianMingSelect