-- client side OtherEquipInfoLayer.lua
--[[
 * @Description: 查看他人装备右侧信息界面
 ]]
-- script writer wuqi
-- creation time 2016-11-07

local OtherEquipInfoLayer = class("OtherEquipInfoLayer", BaseLayer)

function OtherEquipInfoLayer:ctor(gmId)
    self.super.ctor(self, data);

    self.isfirst = true
    self:init("lua.uiconfig_mango_new.Leaderboard.LeaderboardListLayer");
end

function OtherEquipInfoLayer:loadData(equip, type)
    self.equip = equip;
    self.type = type;
end

function OtherEquipInfoLayer:onShow()
    self.super.onShow(self)
    
    self:refreshBaseUI();
    self:refreshUI();
    if self.isfirst then
        self.isfirst = false
        self.ui:runAnimation("Action0", 1)
    end
end

function OtherEquipInfoLayer:refreshBaseUI()

end

function OtherEquipInfoLayer:refreshUI()
    if not self.equip then
        return
    end
    local baseAttr = self.equip:getBaseAttributeWithRecast():getAttribute()
    for i = 1, EnumAttributeType.Max - 1 do
        if baseAttr[i] then
            self.txt_attr_base:setText(AttributeTypeStr[i])
            self.txt_attr_base_val:setText("+ " .. covertToDisplayValue(i, baseAttr[i]))
        end
    end
    --附加属性
    local extraAttr, indexTable = self.equip:getExtraAttributeWithRecast():getAttribute()
    local notEmptyIndex = 1
    for k, i in pairs(indexTable) do
        if extraAttr[i] then
            self.txt_attr_extra[notEmptyIndex]:setVisible(true)
            self.txt_attr_extra_val[notEmptyIndex]:setVisible(true)
            self.txt_attr_extra[notEmptyIndex]:setText(AttributeTypeStr[i])
            self.txt_attr_extra_val[notEmptyIndex]:setText("+ " .. covertToDisplayValue(i, extraAttr[i]))
            notEmptyIndex = notEmptyIndex + 1
        end
    end
    for i = notEmptyIndex, EquipmentManager.kMaxExtraAttributeSize do
        self.txt_attr_extra[i]:setVisible(false)
        self.txt_attr_extra_val[i]:setVisible(false)  
    end

    local offsetOrderPanelY = 0
    if notEmptyIndex == 1 then
        offsetOrderPanelY = self.txt_attr_extra[1]:getPositionY()
    else
        offsetOrderPanelY = self.txt_attr_extra[notEmptyIndex-1]:getPositionY() - 30
    end
    self.panel_order:setPositionY(offsetOrderPanelY)

    local currBreachLevel = self.equip:getorderBreachLevel()
    local CurrSpecialInfo = EquipmentSpecialAttribData:getDetailsByQualityLevel(self.equip.equipType, self.equip.quality, currBreachLevel)

    notEmptyIndex = 1
    --添加装备升阶获得的属性
    local extraAttr = self.equip:getOrderLevelAttribute():getAttribute()
    for k,v in pairs(extraAttr) do
        self.txt_order_attr[notEmptyIndex]:setVisible(true)
        self.txt_order_attr_val[notEmptyIndex]:setVisible(true)
    
        self.txt_order_attr[notEmptyIndex]:setText(AttributeTypeStr[k])
        self.txt_order_attr_val[notEmptyIndex]:setText("+ " .. covertToDisplayValue(k,v))
        notEmptyIndex = notEmptyIndex + 1
    end

    if CurrSpecialInfo and self.txt_order_attr[notEmptyIndex] then
        local posY = self.txt_order_attr[notEmptyIndex]:getPositionY() + 10
        self.txt_xiajiexiaoguo:setVisible(true)
        self.txt_xiajiexiaoguo:setPositionY(posY)
        self.txt_xiajiexiaoguo:setText(CurrSpecialInfo.des)
    end
    self:openEquipDetail()
end

function OtherEquipInfoLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close');

    self.panel_move_zhuangbei = TFDirector:getChildByPath(ui, "panel_move_zhuangbei")
    self.panel_move_tianshu = TFDirector:getChildByPath(ui, "panel_move_tianshu")
    self.panel_move_zhuangbei:setVisible(true)
    self.panel_move_tianshu:setVisible(false)
    local pannl_node = self.panel_move_zhuangbei
    --基础属性
    self.txt_attr_base      = TFDirector:getChildByPath(pannl_node, "txt_baseattr_index")
    self.txt_attr_base_val  = TFDirector:getChildByPath(pannl_node, "txt_baseattr_num")

    --附加属性
    self.txt_attr_extra     = {}
    self.txt_attr_extra_val = {}
    
    for i = 1, EquipmentManager.kMaxExtraAttributeSize do
        self.txt_attr_extra[i]          = TFDirector:getChildByPath(pannl_node, "txt_extraattr_" .. i)
        self.txt_attr_extra_val[i]      = TFDirector:getChildByPath(pannl_node, "txt_extraattr_num_" .. i)
    end

    self.panel_order = TFDirector:getChildByPath(pannl_node, "panel_order")
    --升阶属性
    self.txt_order_attr = {}
    self.txt_order_attr_val = {}
    for i = 1, EquipmentManager.orderAddAttrNum do
        self.txt_order_attr[i]          = TFDirector:getChildByPath(pannl_node, "txt_order_" .. i)
        self.txt_order_attr_val[i]      = TFDirector:getChildByPath(pannl_node, "txt_order_num_" .. i)
        self.txt_order_attr[i]:setVisible(false)
    end
    self.txt_xiajiexiaoguo = TFDirector:getChildByPath(pannl_node, "txt_xiajiexiaoguo")
    self.txt_xiajiexiaoguo:setVisible(false)
end

function OtherEquipInfoLayer:openEquipDetail() 
    if self.curLayer then
        self.curLayer:getParent():removeLayer(self.curLayer, not self.curLayer.isCache);
    end
    local layer = AlertManager:getLayerFromCacheByName("lua.logic.role.OtherEquipLayer")
    if not layer then
        layer = require("lua.logic.role.OtherEquipLayer"):new();
    end
    layer.isfirst = self.isfirst
    layer:loadData(self.equip);
    layer:onShow();
    layer:setZOrder(0);
    self:addLayer(layer);
    self.curLayer = layer;
end

function OtherEquipInfoLayer:registerEvents(ui)
    self.super.registerEvents(self);
end

function OtherEquipInfoLayer:removeEvents()
    self.super.removeEvents(self);
    self.isfirst = true
end

return OtherEquipInfoLayer