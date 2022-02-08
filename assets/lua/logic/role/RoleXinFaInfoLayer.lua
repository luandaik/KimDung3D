--[[
    穿戴心法
]]

local RoleXinFaInfoLayer = class("RoleXinFaInfoLayer", BaseLayer)

RoleXinFaInfoLayer.LIST_ITEM_HEIGHT = 150
--RoleXinFaInfoLayer.TXT_WENBEN = "快给你的侠客使用最合适的心法吧!"
RoleXinFaInfoLayer.TXT_WENBEN = localizable.RoleXinFa_text1

function RoleXinFaInfoLayer:ctor(gmId)
    self.super.ctor(self, data)
    self.isfirst = true
    self:init("lua.uiconfig_mango_new.role.EquipListLayer")
end

function RoleXinFaInfoLayer:loadData(roleGmId, type)
    self.roleGmId   = roleGmId
    self.type     = type
    self.selectEquipGmId = nil
end

function RoleXinFaInfoLayer:onShow()
    self.super.onShow(self)
    
    self:refreshBaseUI();
    self:refreshUI();
    if self.isfirst == true then
        self.isfirst = false
        self.ui:runAnimation("Action0", 1)
    end
end

function RoleXinFaInfoLayer:refreshBaseUI()

end

function RoleXinFaInfoLayer:refreshUI()
    self.cardRole = CardRoleManager:getRoleByGmid(self.roleGmId)
    self.equipList = nil
    self:refreshTable()    
end

function RoleXinFaInfoLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.sortType = "power"

    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');
    self.bg_table      = TFDirector:getChildByPath(ui, 'panel_zhuangbeihuadong');
    self.txt_wenben = TFDirector:getChildByPath(ui, "txt_wenben_word2")
    self.txt_wenben:setText(self.TXT_WENBEN)

    local tableView   =  TFTableView:create();
    self.table_select  = tableView;

    tableView.logic    = self;
    tableView:setTableViewSize(self.bg_table:getContentSize());
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL);
    tableView:setVerticalFillOrder(0);

    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable);
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex);
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView);
    self.bg_table:addChild(tableView, 2);
    Public:bindScrollFun(tableView);

    self.btn_sort            = TFDirector:getChildByPath(ui, 'btn_xiala');
    self.btn_sort_pos        = TFDirector:getChildByPath(ui, 'btn_zhuangbei');
    self.btn_sort_power      = TFDirector:getChildByPath(ui, 'btn_zhanli');
    self.btn_sort_quality    = TFDirector:getChildByPath(ui, 'btn_pinzhi');
    self.img_select          = TFDirector:getChildByPath(ui, 'img_select');
    
    self.bg_sort             = TFDirector:getChildByPath(ui, 'panel_bg');
    self.node_menu           = TFDirector:getChildByPath(ui, 'panel_menu');
    self.groupButtonManager  = GroupButtonManager:new( {[1] = self.btn_sort_power, [2] = self.btn_sort_quality});
    
    self.img_select:setTexture("ui_new/array/js_zhanli_press_btn.png");

    self.node_menu:setVisible(false);
    self.btn_sort:setVisible(true);
end

function RoleXinFaInfoLayer.onShowSortMenuClickHandle(sender)
    local self = sender.logic;
    self.node_menu:setVisible(true);
end

function RoleXinFaInfoLayer.onSortSelectClickHandle(sender)
    local self = sender.logic;

    self.node_menu:setVisible(false);

    if (self.groupButtonManager:getSelectButton() == sender) then
       return;
    end

   if sender == self.btn_sort_power then
        self.img_select:setTexture("ui_new/array/js_zhanli_press_btn.png");
        self.sortType = "power"
   elseif sender == self.btn_sort_quality then
        self.img_select:setTexture("ui_new/array/js_pinzhi_press_btn.png");
        self.sortType = "quality"
   end

   self.groupButtonManager:selectBtn(sender);
   self:refreshTable();
end

function RoleXinFaInfoLayer.onSortCancelClickHandle(sender)
    local self = sender.logic;
    self.node_menu:setVisible(false);
    self.btn_sort:setVisible(true);
end

function RoleXinFaInfoLayer.cellSizeForTable(tableView,idx)
    return RoleXinFaInfoLayer.LIST_ITEM_HEIGHT, 960
end

function RoleXinFaInfoLayer.tableCellAtIndex(tableView, idx)
    local self = tableView.logic;
    local cell = tableView:dequeueCell()
    if nil == cell then
        tableView.cells = tableView.cells or {}
        cell = TFTableViewCell:create()
        tableView.cells[cell] = true

        local item_node = TFPanel:create();
        cell:addChild(item_node);
        cell.item_node = item_node;

        for i=1,3 do
            local m_node = createUIByLuaNew("lua.uiconfig_mango_new.role.EquipItemXinFa");
            m_node.panel_empty = TFDirector:getChildByPath(m_node, 'panel_empty');
            m_node.panel_info = TFDirector:getChildByPath(m_node, 'panel_info');

            m_node:setName("m_equip" .. i);
            m_node:setPosition(ccp( 30 + 145 * (i -1) ,-5));

            item_node:addChild(m_node);
            item_node.m_node = m_node; 
        end
    end

    for i=1,3 do
        local index = idx*3 + i;

        local m_node = TFDirector:getChildByPath(cell.item_node, 'm_equip' .. i);
        local equipItem = self.equipList:objectAt(index);
        if  equipItem then
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(true);
            self:loadItemNode(m_node,equipItem,index);
        else
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(false);
        end
    end

    return cell
end

function RoleXinFaInfoLayer.numberOfCellsInTableView(tableView)
    local self = tableView.logic;
    return math.max(math.ceil(self.equipList:length()/3) +1 ,5);
end

--添加心法节点
function RoleXinFaInfoLayer:loadItemNode(item_node,equipItem,index)

    local btn_icon = TFDirector:getChildByPath(item_node, 'btn_node');
    btn_icon.logic = self;
    btn_icon.instanceId = equipItem.instanceId;

    btn_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCellClickHandle,play_xuanze));

    local img_xuanzhong = TFDirector:getChildByPath(btn_icon, 'img_xuanzhong');
    local panel_star    = TFDirector:getChildByPath(btn_icon, 'panel_star')
    if self.selectEquipItem and self.selectEquipItem.instanceId == equipItem.instanceId then
        img_xuanzhong:setVisible(true);
        self.selectEquipItem.img_xuanzhong = img_xuanzhong; 
        self.selectEquipGmId = equipItem.instanceId;
        self:openEquipDetail(equipItem);
    else
        img_xuanzhong:setVisible(false);
    end
    local curEquip = self.cardRole:getXinFa()
    local img_icon      = TFDirector:getChildByPath(item_node, 'img_skill_icon');
    img_icon:setTexture(equipItem.config:GetPath());

    local img_quality   = TFDirector:getChildByPath(item_node, 'btn_equip');
    img_quality:setTextureNormal(GetColorIconByQuality(equipItem.config.quality));
    XinFaManager:BindEffectOnEquip(img_quality, equipItem)

    local txt_starlv    = TFDirector:getChildByPath(panel_star, 'txt_starlv')
    txt_starlv:setText(equipItem.star)
    if equipItem.star == 0 then
        panel_star:setVisible(false)
    else
        panel_star:setVisible(true)
    end
    --XinFaManager:BindEffectOnEquip(img_quality, equipItem)

    -- local txt_name = TFDirector:getChildByPath(item_node, 'txt_zhuangbeiming');
    -- txt_name:setText(equipItem:getConfigName());

    local txt_qianghualv = TFDirector:getChildByPath(item_node, 'txt_qianghualv')
    if equipItem.level == 1 then
        txt_qianghualv:setVisible(false)
    else
        txt_qianghualv:setVisible(true)
    end
    txt_qianghualv:setText('+'..equipItem.level)
    
    local img_arrow = TFDirector:getChildByPath(item_node, 'img_jiantousheng');
    local img_hasEquip = TFDirector:getChildByPath(item_node, 'img_equiped');
    local txt_equiped_name = TFDirector:getChildByPath(item_node, 'txt_equiped_name');

    img_arrow:setVisible(true);
    img_hasEquip:setVisible(false);

    if (curEquip == nil or equipItem:getpower() > curEquip:getpower()) then
        img_arrow:setTexture("ui_new/roleequip/js_jts_icon.png");
    else
        img_arrow:setTexture("ui_new/roleequip/js_jtx_icon.png");
    end

    if (curEquip ~= nil and  curEquip.instanceId == equipItem.instanceId) then
        img_arrow:setVisible(false);
        img_hasEquip:setVisible(true);
        local role = CardRoleManager:getRoleById(equipItem.equip)
        if role.isMainPlayer then
            txt_equiped_name:setText(MainPlayer.verticalName)
        else
            txt_equiped_name:setText(role.name)
        end
    end

    if (equipItem.equip and equipItem.equip ~= 0) then
        img_arrow:setTexture("ui_new/roleequip/js_chuan_icon.png");
        img_arrow:setVisible(false);
        img_hasEquip:setVisible(true);

        local role = CardRoleManager:getRoleById(equipItem.equip)
        if role.isMainPlayer then
            txt_equiped_name:setText(MainPlayer.verticalName)
        else
            txt_equiped_name:setText(role.name)
        end
    end

    --Public:addStarImg(img_icon, equipItem.star)
	
	local img_baoshicao1 = TFDirector:getChildByPath(item_node, "img_baoshicao1")
	local img_gem1 = TFDirector:getChildByPath(img_baoshicao1, "img_gem1")

    local img_baoshicao2 = TFDirector:getChildByPath(item_node, "img_baoshicao2")
    local img_gem2 = TFDirector:getChildByPath(img_baoshicao2, "img_gem1")

    img_baoshicao1:setVisible(false)
    img_baoshicao2:setVisible(false)
    img_gem1:setVisible(true)
    img_gem2:setVisible(true)

end

function RoleXinFaInfoLayer.onCellClickHandle(sender) 
    local self = sender.logic;

    local equipGmId = sender.instanceId;
    local equipItem = XinFaManager:getXinFaByGmId(equipGmId);  

    if not equipItem --[[or self.selectEquipItem == equipItem]] then
        return
    end

    if self.selectEquipItem and self.selectEquipItem.img_xuanzhong then
        self.selectEquipItem.img_xuanzhong:setVisible(false);
    end

    local img_xuanzhong = TFDirector:getChildByPath(sender, 'img_xuanzhong');
    img_xuanzhong:setVisible(true);
    self.selectEquipItem = equipItem;
    self.selectEquipItem.img_xuanzhong = img_xuanzhong;

    self.selectEquipGmId = equipItem.instanceId;
    self:openEquipDetail(equipItem); 
    print("RoleXinFaInfoLayer.onCellClickHandle(sender) ")
end

function RoleXinFaInfoLayer:openEquipDetail(equipItem) 

    if self.curLayer and self.curLayer:getParent() then
        self.curLayer:getParent():removeLayer(self.curLayer, not self.curLayer.isCache);
    end
    local curEquip = self.cardRole:getXinFa()

    local layer = nil;

    if (equipItem == curEquip) then
        layer = AlertManager:getLayerFromCacheByName("lua.logic.role.EquipuninstallXinFaLayer ")
    elseif (curEquip == nil) then
        layer = AlertManager:getLayerFromCacheByName("lua.logic.role.EquipdressXinFaLayer")
    else
        layer = AlertManager:getLayerFromCacheByName("lua.logic.role.EquipreplaceXinFaLayer")
    end

    if not layer then
        if (equipItem == curEquip) then
            layer = require("lua.logic.role.EquipuninstallXinFaLayer "):new();
        elseif (curEquip == nil) then
            layer = require("lua.logic.role.EquipdressXinFaLayer"):new();
        else
            layer = require("lua.logic.role.EquipreplaceXinFaLayer"):new();
        end
    end
    layer.isfirst = self.isfirst
    -- print("+++++instanceId++++", equipItem.instanceId)
    layer:loadData(self.cardRole.gmId, equipItem.instanceId);
    layer:onShow();
    layer:setZOrder(0);
    self:addLayer(layer);
    self.curLayer = layer;
end

function RoleXinFaInfoLayer:refreshTable()
    --[[
    if self.curLayer then
        self.curLayer:getParent():removeLayer(self.curLayer, not self.curLayer.isCache);
        self.curLayer = nil;
    end
    ]]
    local function cmpFunPower(equip1, equip2)
        if equip1.equip and equip2.equip == nil then
            return true
        elseif equip2.equip and equip1.equip == nil then 
            return false
        end
        if equip1:getpower() > equip2:getpower() then
            return true;
        elseif equip1:getpower() == equip2:getpower() then
            if equip1.config.quality > equip2.config.quality then
                return true;
            elseif equip1.config.quality == equip2.config.quality then
                if equip1.instanceId > equip2.instanceId then
                    return true;
                end
            end 
        end
        return false;
    end

    local function cmpFunQuality(equip1, equip2)
        if equip1.equip and equip2.equip == nil then
            return true
        elseif equip2.equip and equip1.equip == nil then 
            return false
        end
        if equip1.config.quality > equip2.config.quality then
            return true;
        elseif equip1.config.quality == equip2.config.quality then
            if equip1:getpower() > equip2:getpower() then
                return true;
            elseif equip1:getpower() == equip2:getpower() then
                if equip1.instanceId > equip2.instanceId then
                    return true;
                end
            end 
        end
        return false;
    end

    local equipItem = self.cardRole:getXinFa()
    if (self.equipList == nil) then
        self.equipList = XinFaManager:getAllXinFa()
        if self.sortType == "power" then
            self.equipList:sort(cmpFunPower);
        else
            self.equipList:sort(cmpFunQuality);
        end
        if self.selectEquipGmId then
            self.selectEquipItem = XinFaManager:getXinFaByGmId(self.selectEquipGmId);
        else
            if equipItem then
                self.selectEquipItem = equipItem;
                self.equipList:removeObject(equipItem);
                self.equipList:pushFront(equipItem);
            else
                for item in self.equipList:iterator() do
                    if item.equip == nil or item.equip == 0 then
                        self.selectEquipItem = item;
                        self.selectEquipGmId = item.instanceId;
                        self:openEquipDetail(item);
                        break;
                    end
                end
            end
        end
        self.table_select:reloadData();
        self.table_select:scrollToYTop(0);
    else
        self.equipList = XinFaManager:getAllXinFa()
        if self.sortType == "power" then
            self.equipList:sort(cmpFunPower);
        else
            self.equipList:sort(cmpFunQuality);
        end

        if self.selectEquipGmId then
            self.selectEquipItem = XinFaManager:getXinFaByGmId(self.selectEquipGmId);
        else
            if equipItem then
                self.selectEquipItem = equipItem;
                self.equipList:removeObject(equipItem);
                self.equipList:pushFront(equipItem);
            else
                for item in self.equipList:iterator() do
                    if item.equip == nil or item.equip == 0 then
                        self.selectEquipItem = item;
                        break;
                    end
                end
            end
        end

        local tb_pos = self.table_select:getContentOffset();
        self.table_select:reloadData();
        self.table_select:setContentOffset(tb_pos);
    end

    self:showOutLayerWhenIsNotEnough()
end   

function RoleXinFaInfoLayer:registerEvents(ui)
    self.super.registerEvents(self);

    self.btn_sort.logic = self;
    -- self.btn_sort_pos.logic = self;
    self.btn_sort_power.logic = self;
    self.btn_sort_quality.logic = self;
    self.bg_sort.logic = self;

    self.btn_sort:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShowSortMenuClickHandle));
    -- self.btn_sort_pos:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSortSelectClickHandle));
    self.btn_sort_power:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSortSelectClickHandle),1);
    self.btn_sort_quality:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSortSelectClickHandle),1);
    self.bg_sort:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSortCancelClickHandle));

    self.EquipUpdateCallBack = function(event)
        self.selectEquipItem = nil;
        self.curLayer = nil;
        
        self:refreshUI();
        self:refreshTable();
    end

    TFDirector:addMEGlobalListener(XinFaManager.EQUIP_OPERATION,  self.EquipUpdateCallBack)
    TFDirector:addMEGlobalListener(XinFaManager.UNEQUIP_OPERATION ,  self.EquipUpdateCallBack)
end

function RoleXinFaInfoLayer:removeEvents()
    self.super.removeEvents(self)
    self.logic:runAnimationBack()
    self.isfirst = true
    TFDirector:removeMEGlobalListener(XinFaManager.EQUIP_OPERATION, self.EquipUpdateCallBack)
    TFDirector:removeMEGlobalListener(XinFaManager.UNEQUIP_OPERATION, self.EquipUpdateCallBack)
    self.EquipUpdateCallBack = nil
end

function RoleXinFaInfoLayer:showOutLayerWhenIsNotEnough()
    local equipItem = self.cardRole:getXinFa()
    -- print("RoleXinFaInfoLayer:showOutLayerWhenIsNotEnough",equipItem)
    if not equipItem then
        local equipTotalNum = self.equipList:length()
        local equipNum = 0
        for index = 1, equipTotalNum do
            equipItem = self.equipList:objectAt(index)
            if equipItem.equip == nil or equipItem.equip == 0 then
                equipNum = equipNum + 1
                return
            end
        end

        if equipNum < 1 then
            print("没有足够该类型的装备")
            self:showOutLayer()
        end
    end
end

function RoleXinFaInfoLayer:showOutLayer()
    if self.curLayer then
        self.curLayer:getParent():removeLayer(self.curLayer, not self.curLayer.isCache)
    end
    local curEquip = self.cardRole:getXinFa()

    local layer = nil
    layer = AlertManager:getLayerFromCacheByName("lua.logic.role.EquipOutXinFaLayer")

    if not layer then
        layer = require("lua.logic.role.EquipOutXinFaLayer"):new()
    end
    layer.isfirst = self.isfirst
    layer:loadData(self.type);
    layer:onShow();
    layer:setZOrder(0);
    self:addLayer(layer);
    self.curLayer = layer;
end

return RoleXinFaInfoLayer
