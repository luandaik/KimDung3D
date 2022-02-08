-- client side OtherSkyBookInfoLayer.lua
--[[
 * @Description: 查看他人天书右侧信息界面
 ]]
-- script writer wuqi
-- creation time 2016-11-07

local RoleSkyBookInfoLayer = class("RoleSkyBookInfoLayer", BaseLayer)

RoleSkyBookInfoLayer.MAX_ATTR_SIZE = 11

function RoleSkyBookInfoLayer:ctor(gmId)
    self.super.ctor(self, data);

    self.isfirst = true
    self:init("lua.uiconfig_mango_new.Leaderboard.LeaderboardListLayer");
end

function RoleSkyBookInfoLayer:loadData(equip, type)
    self.equip = equip;
    self.type = type;
end

function RoleSkyBookInfoLayer:onShow()
    self.super.onShow(self)
    
    self:refreshBaseUI();
    self:refreshUI();
    if self.isfirst then
        self.isfirst = false
        self.ui:runAnimation("Action0", 1)
    end
end

function RoleSkyBookInfoLayer:refreshBaseUI()

end

function RoleSkyBookInfoLayer:refreshUI()
    if not self.equip then
        return
    end

    local totalAttr = self.equip:getTotalAttr()
    local count = 0
    for i = 1, EnumAttributeType.Max - 1 do
        if totalAttr[i] and totalAttr[i] ~= 0 and count < self.MAX_ATTR_SIZE then
            count = count + 1
            self.txt_attr[count]:setText(AttributeTypeStr[i])
            self.txt_attr_num[count]:setText("+ " .. covertToDisplayValue(i, totalAttr[i], true))
            self.txt_attr[count]:setVisible(true)
            self.txt_attr_num[count]:setVisible(true)
        end
    end

    local immuneAttr = self.equip:getImmuneAttr()
    for k, v in pairs(immuneAttr) do
        if v and v ~= 0 then
            count = count + 1
            self.txt_attr[count]:setText(SkillBuffHurtStr[k])
            self.txt_attr_num[count]:setText("+ " .. covertToDisplayValue(k,v,true))
            self.txt_attr[count]:setVisible(true)
            self.txt_attr_num[count]:setVisible(true)
        end
    end
    local effectExtraAttr = self.equip:getEffectExtraAttr()
    for k,v in pairs(effectExtraAttr) do
        if v and v ~= 0 then
            count = count + 1
            self.txt_attr[count]:setText(SkillBuffHurtStr[k])
            self.txt_attr_num[count]:setText("+ " .. covertToDisplayValue(k,v,true))
            self.txt_attr[count]:setVisible(true)
            self.txt_attr_num[count]:setVisible(true)
        end
    end
    local beEffectExtraAttr = self.equip:getBeEffectExtraAttr()

    local attrInfo = getBeEffectInfo(beEffectExtraAttr)
    for attrName,info in pairs(attrInfo) do
        count = count + 1
        local txt_name = self.txt_attr[count]
        local txt_base = self.txt_attr_num[count]
        if (txt_name and (info.percentAttr > 0 or info.constAttr > 0)) then
            txt_name:setText(attrName)
            local str = "+ "
            if (info.percentAttr > 0) then
                str = str..info.percentAttr.."%"
                if (info.constAttr > 0) then
                    str = str.."+"..info.constAttr
                end
            else
                if (info.constAttr > 0) then
                    str = str..info.constAttr
                end
            end
            txt_base:setText(str)
            txt_name:setVisible(true)
            txt_base:setVisible(true)
        end     
    end
    self:openEquipDetail()
end

function RoleSkyBookInfoLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close');

    self.panel_move_zhuangbei = TFDirector:getChildByPath(ui, "panel_move_zhuangbei")
    self.panel_move_tianshu = TFDirector:getChildByPath(ui, "panel_move_tianshu")
    self.panel_move_zhuangbei:setVisible(false)
    self.panel_move_tianshu:setVisible(true)
    local panel_node = self.panel_move_tianshu

    self.txt_attr = {}
    self.txt_attr_num = {}
    -- for i = 1, self.MAX_ATTR_SIZE do
    --     self.txt_attr[i] = TFDirector:getChildByPath(panel_node, "txt_attr" .. tostring(i))
    --     self.txt_attr_num[i] = TFDirector:getChildByPath(self.txt_attr[i], "txt_attr" .. tostring(i) .. "_num")
    --     self.txt_attr[i]:setVisible(false)
    --     self.txt_attr_num[i]:setVisible(false)
    -- end 
    local count = 1
    local childrenArr = panel_node:getChildren()
    for i=0,childrenArr:count()-1 do
        local child = TFDirector:getChildByPath(panel_node,'txt_attr'..count)
        if (child) then
            self.txt_attr[count] = child
            self.txt_attr_num[count] = TFDirector:getChildByPath(child, "txt_attr" .. count .. "_num")
            child:setVisible(false)
            self.txt_attr_num[count]:setVisible(false)
            count = count + 1
        end
    end
end

function RoleSkyBookInfoLayer:openEquipDetail() 
    if self.curLayer then
        self.curLayer:getParent():removeLayer(self.curLayer, not self.curLayer.isCache);
    end
    local layer = AlertManager:getLayerFromCacheByName("lua.logic.role.OtherSkyBookLayer")
    if not layer then
        layer = require("lua.logic.role.OtherSkyBookLayer"):new();
    end
    layer.isfirst = self.isfirst
    layer:loadData(self.equip);
    layer:onShow();
    layer:setZOrder(0);
    self:addLayer(layer);
    self.curLayer = layer;
end

function RoleSkyBookInfoLayer:registerEvents(ui)
    self.super.registerEvents(self);
end

function RoleSkyBookInfoLayer:removeEvents()
    self.super.removeEvents(self);
    self.isfirst = true
end

return RoleSkyBookInfoLayer