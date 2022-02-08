-- client side XinFaSellLayer.lua
--[[
 * @Description: 心法分解
 ]]
-- creation time 2018-08-08

local XinFaSellLayer = class("XinFaSellLayer", BaseLayer)
local columnNumber = 5

local listTypeName = {
	"ui_new/bag/img_qb2.png",
	"ui_new/bag/img_cpyx2.png",
	"ui_new/bag/img_qbsp2.png",
	"ui_new/bag/img_yqyxsp2.png",
	"ui_new/bag/img_syzb2.png",
	"ui_new/bag/img_sysp2.png",
	}
local btnChoiceName = {
	"ui_new/bag/img_qb.png",
	"ui_new/bag/img_cpyx.png",
	"ui_new/bag/img_qbsp.png",
	"ui_new/bag/img_yqyxsp.png",
	"ui_new/bag/img_syzb.png",
	"ui_new/bag/img_sysp.png",
}
local txt_NamePosY = 23
function XinFaSellLayer:ctor(data)
	self.choiceType = 0
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.bag.XinFaSell")
    -- 将未装备的心法分类
    -- XinFaManager:setXinFaSellListByType()
end

function XinFaSellLayer:initUI(ui)
	self.super.initUI(self,ui)

	self.panel_list = TFDirector:getChildByPath(ui, 'panel_list')
	self.btn_qdfj = TFDirector:getChildByPath(ui, 'btn_qdfj')

	--右上角类别选择Select
	self.panel_choice 	= TFDirector:getChildByPath(ui, 'panel_choice')
	self.panel_choice:setVisible(false)
	self.panel_choice.logic = self

	self.btn_choice = {}
	for i=1,5 do
		local str = "btn_choice_" .. i
		self.btn_choice[i] = TFDirector:getChildByPath(ui, str)
		self.btn_choice[i].tag = i
	end

	self.btn_listType 	= TFDirector:getChildByPath(ui, 'btn_listType')
	self.img_listType 	= TFDirector:getChildByPath(ui, 'img_listType')

	self.check_cheng = TFDirector:getChildByPath(ui, 'check_cheng')
	self.check_cheng.isTrue = false
	self.cellModel = createUIByLuaNew("lua.uiconfig_mango_new.role_new.TianMingXiangQianCell")
    self.cellModel:retain()
                   
    -- self:refreshList(XinFaManager.sell_type_35)
    self:btnChoiceClickHandle(self.btn_choice[4])
end

function XinFaSellLayer:registerEvents()
	self.super.registerEvents(self)

	self.btn_listType:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self,self.listTypeClickHandle))
	for i=1,#self.btn_choice do
		self.btn_choice[i]:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self,self.btnChoiceClickHandle))
	end
	self.btn_qdfj:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self,self.btnFengJieClickHandle))
	self.check_cheng:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self,self.checkTianMing))

	self.upDataRefreshList = function(event)
		self.check_cheng:setSelectedState(false)
		self.check_cheng.isTrue = false
		self:refreshList(self.choiceType + 1)
	end

	TFDirector:addMEGlobalListener(XinFaManager.XinFaSell, self.upDataRefreshList)
end
function XinFaSellLayer:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(XinFaManager.XinFaSell, self.upDataRefreshList)
    self.upDataRefreshList = nil
end


function XinFaSellLayer:refreshList(sellType)
	self.xinFaSellList = XinFaManager:getXInFaSellListByType(sellType) 
	self.List = {}  --用于盘点需要分解的天命
    for i = 1,#self.xinFaSellList do
        self.List[i] = false
    end
	self:refreshUI()
end

function XinFaSellLayer:refreshUI()
    if self.table_select == nil then
        local tableView   =  TFTableView:create();
        self.table_select  = tableView;
    
        self.table_select.logic    = self;
        self.table_select:setTableViewSize(self.panel_list:getContentSize());
        self.table_select:setDirection(TFTableView.TFSCROLLVERTICAL);
        self.table_select:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN);
    
        self.table_select:addMEListener(TFTABLEVIEW_SIZEFORINDEX, XinFaSellLayer.cellSizeForTable);
        self.table_select:addMEListener(TFTABLEVIEW_SIZEATINDEX, XinFaSellLayer.tableCellAtIndex);
        self.table_select:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, XinFaSellLayer.numberOfCellsInTableView);
        self.panel_list:addChild(self.table_select);
    end
    self.table_select:reloadData()
end

function XinFaSellLayer.cellSizeForTable(table,cell)
    return 185,600
end

function XinFaSellLayer.tableCellAtIndex(table,idx)
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

function XinFaSellLayer:cellInfoSet( panel, idx )
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
    panel.txt_attr         = TFDirector:getChildByPath(panel, "txt_attr")
    panel.panel_star:setVisible(false)
    panel.img_black:setVisible(false)
    panel.img_selected_fg:setVisible(false)
    panel.img_jingyan:setVisible(false)
    panel.img_icon.idx = idx
    panel.txt_attr:setText(localizable.ResourceName[38])
    if self.List[idx] then
        panel.img_xuanzhong:setVisible(self.List[idx])
    else
        self.List[idx] = false
        panel.img_xuanzhong:setVisible(false) 
    end
    panel.img_icon:setTouchEnabled(true)
    panel.img_icon:addMEListener(TFWIDGET_CLICK, 
    audioClickfun(function()    
        if self.List[idx] == false then
            panel.img_xuanzhong:setVisible(true)
            self.List[idx]  = true
        elseif self.List[idx] == true then
            panel.img_xuanzhong:setVisible(false)
            self.List[idx]  = false
            if (self.check_cheng.isTrue) then
            	self.check_cheng.isTrue = false
            	self.check_cheng:setSelectedState(false)
            end
         end
        end))
    local roleItem = self.xinFaSellList[idx]
    if roleItem then
        panel.panelEmpty:setVisible(true)
        panel.panelInfo:setVisible(true)
        panel.img_soul:setVisible(false)
        if roleItem.level >= 1 then
            panel.img_soul:setVisible(true)
            panel.txt_lv:setText(roleItem.level)
        end
        panel.img_icon:setTexture(roleItem.config:GetPath())
        -- panel.txt_num:setText("+"..roleItem.config.price + roleItem.exp)
        panel.img_quality:setTexture(GetColorIconByQuality(roleItem.quality))
        panel.kind = roleItem.config.kind 

        panel.txt_name:setPositionY(txt_NamePosY)
        local nameStr = string.gsub(roleItem.config.name, "-", "\n")
        panel.txt_name:setText(nameStr)
        -- if roleItem.starnum > 0 or roleItem.starLevel > 0  then
        --     panel.panel_star:setVisible(true)
        --     panel.txt_starlv:setText(roleItem.starnum)
        -- end
        
    else
        panel.panelEmpty:setVisible(true)
        panel.panelInfo:setVisible(false)
    end
end

function XinFaSellLayer.numberOfCellsInTableView(table,cell)
	local self = table.logic
    if self.xinFaSellList == nil then
        return 0
    end
    return math.ceil(#self.xinFaSellList/columnNumber)
end

-- 下拉按钮
function XinFaSellLayer:listTypeClickHandle(sender)
	if self.panel_choice:isVisible() then
		self.panel_choice:setVisible(false)
	else
		self.panel_choice:setVisible(true)
	end
end

--类别过滤按钮点击事件
function XinFaSellLayer:btnChoiceClickHandle(sender)
	self.choiceType = sender.tag

	if self.choiceType == 0 then
		self.img_listType:setTexture(listTypeName[1])
	else
		self.img_listType:setTexture(listTypeName[self.choiceType + 1])
	end
	local temp = 1
	for i=0,5 do
		if i ~= self.choiceType then
			self.btn_choice[temp].tag = i
			if i == 0 then
				self.btn_choice[temp]:setTextureNormal(btnChoiceName[1])
			else
				self.btn_choice[temp]:setTextureNormal(btnChoiceName[i+1])
			end
			temp = temp + 1
		end
	end
	self.check_cheng:setSelectedState(false)
	self.check_cheng.isTrue = false
	self:refreshList(self.choiceType + 1)

	self.panel_choice:setVisible(false)

end

--分解按钮
function XinFaSellLayer:btnFengJieClickHandle()
	local xinFaList = {}
    for i = 1,#self.List do 
        if self.List[i] == true then
            local roleItem = self.xinFaSellList[i];
            local gmid = roleItem.instanceId
            table.insert(xinFaList,gmid)
        end
    end
    if #xinFaList > 0 then
        XinFaManager:sendXinFaSell(xinFaList)
    end
end


-- 全选按钮回调
function XinFaSellLayer:checkTianMing()
	self.check_cheng.isTrue = not self.check_cheng.isTrue
	for i = 1,#self.xinFaSellList do
		self.List[i] = self.check_cheng.isTrue
	end
	self.table_select:reloadData()
end













return XinFaSellLayer