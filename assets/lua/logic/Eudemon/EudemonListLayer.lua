--[[
******宠物列表界面*******

	-- by fei
	-- 2017/3/14
]]

local EudemonListLayer = class("EudemonListLayer", BaseLayer)
function EudemonListLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.pet.PetMainList")
end

function EudemonListLayer:initUI(ui)
	self.super.initUI(self,ui)

	--通用头部
    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.Eudemon,{HeadResType.COIN,HeadResType.SYCEE})
    if (self.generalHead) then
        self.btn_return  = TFDirector:getChildByPath(self.generalHead, 'btn_return')
    end

	local btn_listType 	= TFDirector:getChildByPath(ui, 'btn_listType')
	btn_listType:setVisible(false)
    self.btn_free 	        = TFDirector:getChildByPath(ui, 'btn_sell')
    self.btn_huangong 	    = TFDirector:getChildByPath(ui, 'btn_huangong')
    self.btn_tupu 	    = TFDirector:getChildByPath(ui, 'btn_tupu')
    self.btn_tupu.logic 	= self
    self.btn_free.logic 	= self
    --
    self.eudemonList = TFArray:new()
    self.eudemonId = 0
    --
    local panel_list 	= TFDirector:getChildByPath(ui, 'panel_list')
	self:initTableView(panel_list)
    self.isFirst = true
end

function EudemonListLayer:onShow()
	self.super.onShow(self)
    if (self.generalHead) then
        self.generalHead:onShow()
    end
    if self.isFirst then
        self:moveIn()
        self.isFirst = false
    end
    local eudemonList = EudemonManager:getEudemonList()
    if (self.eudemonList:length() ~= eudemonList:length()) then
        local tempList = TFArray:new()
        self.eudemonList = TFArray:new()
        EudemonManager:sortLevelList(eudemonList)
        for info in eudemonList:iterator() do
            if (info:isHelpFight()) then
                tempList:push(info)
            else
                self.eudemonList:push(info)
            end
        end
        EudemonManager:sortLevelList(tempList, true)
        for info in tempList:iterator() do
            self.eudemonList:pushFront(info)
        end
        tempList:clear()
    end
    
	self:refreshUI()
end

function EudemonListLayer:refreshUI()
	self.tableView:reloadData()
end


function EudemonListLayer:removeUI()
	self.super.removeUI(self)
end
function EudemonListLayer:moveIn()
    self.ui:runAnimation("Action0",1)
end
function EudemonListLayer:moveOut()
    self.ui:runAnimation("Action1",1)
    self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
        AlertManager:close()
        end)
end
function EudemonListLayer.cellSizeForTable(table,idx)
    return 150,725
end


function EudemonListLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    if nil == cell then
    	cell = TFTableViewCell:create()
        for i=1,5 do
            local m_node 		= createUIByLuaNew("lua.uiconfig_mango_new.pet.PetCell");
            m_node.panel_empty 	= TFDirector:getChildByPath(m_node, 'panel_empty');
            m_node.panel_info 	= TFDirector:getChildByPath(m_node, 'panel_info');
            m_node:setName("m_equip" .. i);
            m_node:setPosition(ccp(145 * (i -1) ,0));
            cell:addChild(m_node)
            cell.m_node = m_node;
        end
    end
    for i=1,5 do
        local index = idx*5 + i;

        local m_node 		= TFDirector:getChildByPath(cell, 'm_equip' .. i);
        local eudemonInfo 	= self.eudemonList:objectAt(index);
        if eudemonInfo then
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(true);
            self:setCellData(m_node, eudemonInfo, index);
            EudemonManager:BindEffectOnEquip(m_node.panel_info, eudemonInfo:getId())
        else
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(false);
        end
    end
    return cell
end
--tableview
function EudemonListLayer:setCellData(item_node, eudemonInfo,index)
	local eudemonId = eudemonInfo:getId()
    local starLevel = eudemonInfo:getStarLevel()
    --
    local img_xuanzhong = TFDirector:getChildByPath(item_node, "img_xuanzhong")
    img_xuanzhong:setVisible(false)
    local img_equiped = TFDirector:getChildByPath(item_node, "img_equiped")
    if (eudemonInfo:isHelpFight()) then
        img_equiped:setVisible(true)
        img_equiped:setScale(0.6)
        img_equiped:setAnchorPoint(ccp(0, 0))
        img_equiped:setPosition(ccp(-65, -65))
        img_equiped:setTexture("ui_new/role/icon_shangzhen.png")
    else
        img_equiped:setVisible(false)
    end
    
    --
    for i=1,5 do
        local img_star = TFDirector:getChildByPath(item_node, "img_star_"..i)
        if (img_star) then
            img_star:setVisible(starLevel >= i)
        end
    end

    local btn_equip = TFDirector:getChildByPath(item_node, "btn_equip")
    btn_equip:setTextureNormal(GetColorIconByQuality(eudemonInfo:getQuality()))
    local img_skill_icon = TFDirector:getChildByPath(btn_equip, "img_skill_icon")
    img_skill_icon:setTexture(eudemonInfo:getIconPath())

 	local img_jiantousheng = TFDirector:getChildByPath(item_node, "img_jiantousheng")
    if (img_jiantousheng) then
        img_jiantousheng:setVisible(false)
    end

 	local btn_icon    = TFDirector:getChildByPath(item_node, 'btn_node');
    btn_icon.logic  = self;
    btn_icon.eudemonId  = eudemonId;
    btn_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onYanClickHandle), 1);
    CommonManager:setRedPoint(btn_icon, EudemonManager:isShowEudemonRedPoint(eudemonId),"btn_icon",ccp(0,0))
	if (self.eudemonId == 0) then
		self.eudemonId = eudemonId
	end
end
function EudemonListLayer.numberOfCellsInTableView(table)
	local self = table.logic
	if self.eudemonList and self.eudemonList:length() > 0 then
		local num = math.ceil(self.eudemonList:length()/5)
		if num < 3 then
			return 3
		else
			return num
		end
    end
    return 3
end

--初始化TableView
function EudemonListLayer:initTableView(panel_list)
	local  tableView =  TFTableView:create()
	tableView:setTableViewSize(panel_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    self.tableView = tableView
    self.tableView.logic = self
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, EudemonListLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, EudemonListLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, EudemonListLayer.numberOfCellsInTableView)

	panel_list:addChild(tableView)
end

function EudemonListLayer:registerEvents()
	self.super.registerEvents(self)
	self.btn_free:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onFreeClickHandle), 1);
	self.btn_tupu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTupuHandle), 1);
	self.btn_huangong:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onExchangeClickHandle), 1);
    if (self.generalHead) then
        self.generalHead:registerEvents()
        if (self.btn_return) then
            self.btn_return:addMEListener(TFWIDGET_CLICK,function()
                                                            self.btn_return:setTouchEnabled(false)
                                                            self:moveOut()
                                                        end);
        end
    end
end
--放生
function EudemonListLayer.onTupuHandle(sender)
	IllustrationManager:openIllustrationLayer(7)
end
--放生
function EudemonListLayer.onFreeClickHandle(sender)
	EudemonManager:openEudemonFreeListLayer()
end
--驯养
function EudemonListLayer.onYanClickHandle(sender)
    local self = sender.logic
    EudemonManager:OpemEudemonMainLayer(sender.eudemonId)
end
--换功
function EudemonListLayer.onExchangeClickHandle(sender)
    EudemonManager:openEudemonExchangeLayer()
end
function EudemonListLayer:removeEvents()
    if (self.generalHead) then
        self.generalHead:removeEvents()
    end
	self.super.removeEvents(self)
end

return EudemonListLayer;
