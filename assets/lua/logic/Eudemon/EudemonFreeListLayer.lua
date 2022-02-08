--[[
******宠物列表放生界面*******

	-- by fei
	-- 2017/3/15
]]

local EudemonFreeListLayer = class("EudemonFreeListLayer", BaseLayer)

function EudemonFreeListLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.pet.PetSellLayer")
end

function EudemonFreeListLayer:initUI(ui)
	self.super.initUI(self,ui)

	--通用头部
    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.Eudemon,{HeadResType.COIN,HeadResType.SYCEE})

	local btn_listType 	= TFDirector:getChildByPath(ui, 'btn_listType')
	btn_listType:setVisible(false)
	--
    self.btn_free 	= TFDirector:getChildByPath(ui, 'btn_sell')
    self.btn_free.logic 	= self
    --
    self.eudemonList = TFArray:new()
    self.eudemonId = 0
    self.eudemonIdList = {}
    --
    local panel_list 	= TFDirector:getChildByPath(ui, 'panel_list')
	self:initTableView(panel_list)
    self.isFirst = true
end

function EudemonFreeListLayer:onShow()
	self.super.onShow(self)
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

function EudemonFreeListLayer:refreshUI()
	self.tableView:reloadData()
end

function EudemonFreeListLayer:moveIn()
    self.ui:runAnimation("Action0",1)
end

function EudemonFreeListLayer:removeUI()
	self.super.removeUI(self)
end

function EudemonFreeListLayer.cellSizeForTable(table,idx)
    return 160,725
end


function EudemonFreeListLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    local startOffset = 10
    local columnSpace = 10
    if nil == cell then
        cell = TFTableViewCell:create()
        for i=1,5 do
            local m_node = createUIByLuaNew("lua.uiconfig_mango_new.pet.PetCell");
            m_node.panel_empty = TFDirector:getChildByPath(m_node, 'panel_empty');
            m_node.panel_info = TFDirector:getChildByPath(m_node, 'panel_info');
            m_node:setName("m_equip" .. i);
            m_node:setPosition(ccp(150 * (i -1) + 10,0));
            cell:addChild(m_node)
            cell.m_node = m_node; 
        end
    end
    for i=1,5 do
        local index = idx*5 + i;

        local m_node = TFDirector:getChildByPath(cell, 'm_equip' .. i);
        local eudemonInfo = self.eudemonList:objectAt(index);
        if  eudemonInfo then
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
function EudemonFreeListLayer:setCellData(item_node, eudemonInfo,index)
	local eudemonId = eudemonInfo:getId()
    local starLevel = eudemonInfo:getStarLevel()
    --
    local img_xuanzhong = TFDirector:getChildByPath(item_node, "img_xuanzhong")
    local panel_select = TFDirector:getChildByPath(item_node, "panel_select")
    img_xuanzhong:setVisible(eudemonId == self.selectEudemonId)
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
    if ((self.selectEudemonInfo) and eudemonId == self.selectEudemonInfo.eudemonId) then
        self.selectEudemonInfo = {}
        self.selectEudemonInfo.img_xuanzhong    = img_xuanzhong
        self.selectEudemonInfo.eudemonId        = eudemonId
        img_xuanzhong:setVisible(true)
        panel_select:setVisible(true)
    else
        img_xuanzhong:setVisible(false)
        panel_select:setVisible(false)
    end
    img_xuanzhong:setVisible(false)
    panel_select:setVisible(false)
    local isSelect = false
    for i,v in ipairs(self.eudemonIdList) do
        if (eudemonId == v) then
            img_xuanzhong:setVisible(true)
            panel_select:setVisible(true)
            isSelect = true
            break
        end
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
    btn_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCellClickHandle), 1);
	-- if (self.eudemonId == 0) then
	-- 	self.eudemonId = eudemonId
 --        table.insert(self.eudemonIdList, eudemonId)
	-- end
end

function EudemonFreeListLayer.onCellClickHandle(sender) 
    local self = sender.logic;

    local eudemonId     = sender.eudemonId;
    local eudemonInfo   = EudemonManager:getEudemonById(eudemonId)
    if not eudemonInfo then
        return
    end
    -- if not eudemonInfo or eudemonId == self.selectEudemonInfo.eudemonId then
    --     return
    -- end
    -- if self.selectEudemonInfo and self.selectEudemonInfo.img_xuanzhong and not tolua.isnull(self.selectEudemonInfo.img_xuanzhong) then
    --     self.selectEudemonInfo.img_xuanzhong:setVisible(false);
    -- end

    local img_xuanzhong = TFDirector:getChildByPath(sender, 'img_xuanzhong');
    local panel_select = TFDirector:getChildByPath(sender, 'panel_select');

    self.eudemonInfo = eudemonInfo;
    self.selectEudemonInfo                  = {}
    self.selectEudemonInfo.img_xuanzhong    = img_xuanzhong
    self.selectEudemonInfo.eudemonId        = eudemonId
    self.eudemonId = eudemonId
    local isAdd = true
    for i,v in ipairs(self.eudemonIdList) do
        if (v == eudemonId) then
            table.remove(self.eudemonIdList, i)
            img_xuanzhong:setVisible(false)
            panel_select:setVisible(false)
            isAdd = false
            break
        end
    end
    if (isAdd) then
        img_xuanzhong:setVisible(true)
        panel_select:setVisible(true)
        table.insert(self.eudemonIdList, eudemonId)
    end
end

function EudemonFreeListLayer.numberOfCellsInTableView(table)
	local self = table.logic
	if self.eudemonList and self.eudemonList:length() > 0 then
		local num = math.ceil(self.eudemonList:length()/5)
		if num < 2 then
			return 2
		else
			return num
		end
    end
    return 2
end

--初始化TableView
function EudemonFreeListLayer:initTableView(panel_list)
	local  tableView =  TFTableView:create()
    local size = panel_list:getContentSize()
	tableView:setTableViewSize(CCSizeMake(size.width + 20, size.height))
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    self.tableView = tableView
    self.tableView.logic = self
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, EudemonFreeListLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, EudemonFreeListLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, EudemonFreeListLayer.numberOfCellsInTableView)

	panel_list:addChild(tableView)
end


function EudemonFreeListLayer:registerEvents()
	self.super.registerEvents(self)
	self.btn_free:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onFreeClickHandle), 1);
	self.receiveInfo = function(event)
        self.eudemonIdList = {}
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(EudemonManager.EudemonFree, self.receiveInfo)
    if self.generalHead then
        self.generalHead:registerEvents()
    end
end
--放生
function EudemonFreeListLayer.onFreeClickHandle(sender)
    local self = sender.logic
    if (#self.eudemonIdList <= 0) then
        toastMessage(localizable.Eudemon_tips_10)
    	return
    end
    local arr                   = TFArray:new()
    local list = {}
    local constantData = ConstantData:objectByID("BattlePet.Free.MoneyReturn")
    if (constantData) then
        if (constantData.value > 0) then
            local typeId = constantData.res_type
            local itemId = constantData.res_id
            list[typeId]              = list[typeId] or {}
            list[typeId][itemId] = list[typeId][itemId] or {}
            list[typeId][itemId].itemId = itemId
            list[typeId][itemId].number = list[typeId][itemId].number or 0
            list[typeId][itemId].number = list[typeId][itemId].number + constantData.value * (#self.eudemonIdList)
            --
            local reawardConfig = {
                    itemId  = itemId,
                    type    = typeId,
                    number  = constantData.value
                }
            local itemInfo = BaseDataManager:getReward(reawardConfig)
            if (itemInfo) then
                list[typeId][itemId].quality = itemInfo.quality
                list[typeId][itemId].path    = itemInfo.path
                list[typeId][itemId].name    = itemInfo.name
            end 
            
        end
    end
    
    for i,eudemonId in ipairs(self.eudemonIdList) do
        local eudemonInfo           = EudemonManager:getEudemonById(eudemonId)
        local calculateRewardList   = EudemonManager:getEudemonFreeAward(eudemonInfo:getEudemonTypeId(), eudemonInfo:getQuality(), eudemonInfo:getStarLevel())
        for type,typeList in pairs(calculateRewardList) do
            for _,item in pairs(typeList) do
                for itemid,number in pairs(item) do
                    local typeId = type
                    local itemId = tonumber(itemid)
                
                    list[type]              = list[type] or {}
                    list[type][itemId]      = list[type][itemId] or {}
                    list[type][itemId].itemId = itemId
                    list[type][itemId].number = list[type][itemId].number or 0
                    list[type][itemId].number = list[type][itemId].number + number
                    local itemInfo = ItemData:objectByID(itemId)
                    if (itemInfo) then
                        list[type][itemId].quality = itemInfo.quality
                        list[type][itemId].path    = itemInfo:GetPath()
                        list[type][itemId].name    = itemInfo.name
                    end
                end
            end
        end
    end
    for type,typeList in pairs(list) do
        for _,item in pairs(typeList) do
            local info  = {}
            info.type   = type
            info.itemid = item.itemId
            info.number = item.number
            info.name = item.name
            info.path = item.path
            info.quality = item.quality
            arr:push(info)
        end
    end
    
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.hermit.HermitSure",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    layer:setTitle(localizable.Eudemon_free)
    layer:loadData(arr);
    layer:setBtnHandle(function ()
        --table.insert(self.eudemonIdList, eudemonId)
        EudemonManager:sendEudemonBattleFree(self.eudemonIdList)
    end);
    AlertManager:show();
end
--驯养
function EudemonFreeListLayer.onYanClickHandle(sender)
    local self = sender.logic
    EudemonManager:OpemEudemonMainLayer(self.eudemonId)
end
function EudemonFreeListLayer:removeEvents()
    self.super.removeEvents(self)
    if self.generalHead then
        self.generalHead:removeEvents()
    end
	TFDirector:removeMEGlobalListener(EudemonManager.EudemonFree, self.receiveInfo)
    self.receiveInfo = nil
end

return EudemonFreeListLayer;
