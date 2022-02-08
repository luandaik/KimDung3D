-- client side OtherEquipLayer.lua
--[[
 * @Description: 查看他人装备界面
 ]]
-- script writer wuqi
-- creation time 2016-11-03

local OtherEquipLayer = class("OtherEquipLayer", BaseLayer)
CREATE_PANEL_FUN(OtherEquipLayer)

function OtherEquipLayer:ctor()
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Leaderboard.LeaderboarddressLayer")
    self.isfirst = true
end

function OtherEquipLayer:loadData(equip)
    self.equip = equip
end

function OtherEquipLayer:onShow()
    self.super.onShow(self)
    
    self:refreshBaseUI();
    self:refreshUI();

    if self.isfirst == true then
        self.isfirst = false
        self.ui:runAnimation("Action0", 1)
    end
end

function OtherEquipLayer:refreshBaseUI()

end

function OtherEquipLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.panel_close = TFDirector:getChildByPath(ui, 'panel_close')

    self.panel_chuandaizhuangbei = TFDirector:getChildByPath(ui, 'panel_chuandaizhuangbei');
    self.panel_equip = TFDirector:getChildByPath(ui, "Panel_Equip")
    self.panel_tianshu = TFDirector:getChildByPath(ui, "Panel_tianshu") 
    self.panel_equip:setVisible(true)
    self.panel_tianshu:setVisible(false)
end

function OtherEquipLayer:refreshUI()
    self:initAttr(self.panel_chuandaizhuangbei, self.equip);
end

function OtherEquipLayer:initAttr(pannl_node, equip)
    local img_zhuangbeibeijing_bg = TFDirector:getChildByPath(pannl_node, 'img_zhuangbeibeijing_bg');
    
    local img_icon = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'img_skill_icon');
    img_icon:setTexture(equip:GetTextrue());

    local img_quality = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'btn_equip');
    img_quality:setTextureNormal(GetColorIconByQuality(equip.quality));

    EquipmentManager:BindEffectOnEquip(img_quality, equip)

    local txt_name = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'txt_zhuangbeiming');
    txt_name:setText(equip.name);

    local txt_level = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'txt_qianghualv');
    txt_level:setText("+" .. equip.level);
    local img_arrow = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'img_jiantousheng');
    img_arrow:setVisible(false);
    local img_gem_bg = {}
    local img_gem = {}
    for i=1,EquipmentManager.kGemMergeTargetNum do
        img_gem_bg[i] = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'img_baoshicao'..i);
        img_gem[i] = TFDirector:getChildByPath(img_gem_bg[i], 'img_gem');
    end
    for i=1,EquipmentManager.kGemMergeTargetNum do
        local gemId = equip:getGemPos(i);
        if (gemId == nil) then
            img_gem_bg[i]:setVisible(false);
        else
            img_gem_bg[i]:setVisible(true);
            img_gem[i]:setTexture(ItemData:objectByID(gemId):GetPath())
        end
    end

    local img_zhuangbeibeijing_bg = TFDirector:getChildByPath(pannl_node, 'img_zhuangbeibeijing_bg');
    --附加属性
    local txt_attr_extra     = {}
    local txt_attr_extra_val = {}

    local refineLevel = self.equip.refineLevel or 0
    local recastInfo = self.equip:getRecastInfo() or {}
    local orderLevel = self.equip:getOrderLevel() or 0
    local breachLevel = self.equip:getorderBreachLevel() or 0
    local str = stringUtils.format( localizable.OtherEquipLayer_order_lev, breachLevel, orderLevel % 10 )

    local recastPercent = 0
    if recastInfo then
        for k,v in pairs(recastInfo) do
            recastPercent = recastPercent + v.ratio
        end
    end
    recastPercent = recastPercent / 100
    local attrTab = {refineLevel, recastPercent, str}
    
    for i = 1, 3 do
        txt_attr_extra[i]          = TFDirector:getChildByPath(self.panel_equip, "txt_extraattr_" .. i)
        txt_attr_extra_val[i]      = TFDirector:getChildByPath(txt_attr_extra[i], "txt_extraattr_num_1")
        txt_attr_extra_val[i]:setText(attrTab[i])
    end

    --宝石
    local img_gem_bg = {}
    local img_gem = {}
    local txt_attr_gem = {}
    local txt_attr_gem_val = {}
    for i=1,EquipmentManager.kGemMergeTargetNum do
        img_gem_bg[i]                     = TFDirector:getChildByPath(pannl_node, "img_baoshicao"..i)
        img_gem[i]                        = TFDirector:getChildByPath(img_gem_bg[i], "img_baoshi")
        txt_attr_gem[i]                   = TFDirector:getChildByPath(img_gem_bg[i], "txt_baoshishuxing")
        txt_attr_gem_val[i]               = TFDirector:getChildByPath(img_gem_bg[i], "txt_shuxingzhi")        
    end
    
    local txt_power = TFDirector:getChildByPath(pannl_node, 'txt_zhanlizhi');
    --宝石
    for i=1,EquipmentManager.kGemMergeTargetNum do
        if equip:getGemPos(i) then
            local item = ItemData:objectByID(equip:getGemPos(i))
            if item then
                img_gem_bg[i]:setVisible(true);
                local gem = GemData:objectByID(equip:getGemPos(i))
                if gem then
                    -- txt_gem_name:setText(item.name)
                    img_gem[i]:setTexture(item:GetPath())

                    if gem.attribute and gem.attribute ~= "" then 
                        local attributekind , attributenum = gem:getAttribute()
                        txt_attr_gem[i]:setText(AttributeTypeStr[attributekind])
                        txt_attr_gem_val[i]:setText("+ " .. covertToDisplayValue(attributekind,attributenum,true))
                    elseif gem.immune and gem.immune ~= "" then
                        local attr_index,attr_num = gem:getExtraAttribute(gem.immune)
                        txt_attr_gem_val[i]:setString("+ " .. covertToDisplayValue(attr_index,attr_num,true))
                        txt_attr_gem[i]:setString(SkillBuffHurtStr[attr_index])
                    elseif gem.effect_extra and gem.effect_extra ~= "" then
                        local attr_index,attr_num = gem:getExtraAttribute(gem.effect_extra)
                        txt_attr_gem_val[i]:setString("+ " .. covertToDisplayValue(attr_index,attr_num,true))
                        txt_attr_gem[i]:setString(SkillBuffHurtStr[attr_index])
                    elseif gem.be_effect_extra and gem.be_effect_extra ~= "" then
                        local attr_index,attr_num = gem:getExtraAttribute(gem.be_effect_extra)
                        txt_attr_gem_val[i]:setString("+ " .. covertToDisplayValue(attr_index,attr_num,true))
                        txt_attr_gem[i]:setString(BeEffectExtraStr[attr_index])       
                    end
                    
                end
            else
                img_gem_bg[i]:setVisible(false);
            end
        else
            img_gem_bg[i]:setVisible(false);
        end
    end
    txt_power:setText(equip:getpower());

    Public:addStarImg(img_icon, equip.star or 0)
end

function OtherEquipLayer:removeUI()
	self.super.removeUI(self)
end

function OtherEquipLayer:registerEvents(ui)
    self.super.registerEvents(self);
end

function OtherEquipLayer.onCloseClickHandle(sender) 
    local self = sender.logic;
    self:getParent():removeLayer(self, not self.isCache);

    self.ui:runAnimation("Action1", 1)
end

function OtherEquipLayer:removeEvents()
	self.super.removeEvents(self)
    self.isfirst = true
end

return OtherEquipLayer