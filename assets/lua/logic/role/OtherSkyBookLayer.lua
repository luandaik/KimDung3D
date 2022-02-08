-- client side OtherSkyBookLayer.lua
--[[
 * @Description: 查看他人天书界面
 ]]
-- script writer wuqi
-- creation time 2016-11-03

local OtherSkyBookLayer = class("OtherSkyBookLayer", BaseLayer)

function OtherSkyBookLayer:ctor()
    self.super.ctor(self,data)
    
    self.isfirst = true
    self:init("lua.uiconfig_mango_new.Leaderboard.LeaderboarddressLayer")
end

function OtherSkyBookLayer:loadData(bible)
    self.bible = bible;
end

function OtherSkyBookLayer:onShow()
    self.super.onShow(self)

    self:refreshUI();
    if self.isfirst == true then
        self.isfirst = false
        self.ui:runAnimation("Action0", 1)
    end
end

function OtherSkyBookLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.panel_close = TFDirector:getChildByPath(ui, 'panel_close')
    self.panel_chuandaizhuangbei = TFDirector:getChildByPath(ui, 'panel_chuandaizhuangbei');
    self.panel_equip = TFDirector:getChildByPath(ui, "Panel_Equip")
    self.panel_tianshu = TFDirector:getChildByPath(ui, "Panel_tianshu") 
    self.panel_equip:setVisible(false)
    self.panel_tianshu:setVisible(true)
end

function OtherSkyBookLayer:refreshUI()
    self:initAttr(self.panel_chuandaizhuangbei, self.bible);
end

function OtherSkyBookLayer:initAttr(panel_node, equip)
    local img_zhuangbeibeijing_bg = TFDirector:getChildByPath(panel_node, 'img_zhuangbeibeijing_bg');
    local img_icon = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'img_skill_icon');
    img_icon:setTexture(equip:GetTextrue());
    local img_quality = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'btn_equip');
    img_quality:setTextureNormal(GetColorIconByQuality(equip.quality));
    SkyBookManager:BindEffectOnEquip(img_quality, equip)

    local txt_name = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'txt_zhuangbeiming');
    txt_name:setText(equip:getConfigName());
    local txt_qianghualv = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'txt_qianghualv');
    if equip.level == 0 then
        txt_qianghualv:setVisible(false)
    else
        --txt_qianghualv:setText(EnumSkyBookLevelType[equip.level] .. "重")  common_chong
        txt_qianghualv:setText( stringUtils.format(localizable.common_chong, EnumSkyBookLevelType[equip.level] ))
        txt_qianghualv:setVisible(true)
    end

    local img_arrow = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'img_jiantousheng');
    img_arrow:setVisible(false);
   
    --战力值
    local txt_power = TFDirector:getChildByPath(panel_node, 'txt_zhanlizhi')

    txt_power:setText(equip:getpower())

    Public:addStarImg(img_icon, equip.tupoLevel)
	
	local img_baoshicao1 = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, "img_baoshicao1")
	local img_gem1 = TFDirector:getChildByPath(img_baoshicao1, "img_gem")
    local img_baoshicao2 = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, "img_baoshicao2")
    local img_gem2 = TFDirector:getChildByPath(img_baoshicao2, "img_gem")

    img_baoshicao1:setVisible(false)
    img_baoshicao2:setVisible(false)
    img_gem1:setVisible(true)
    img_gem2:setVisible(true)

	if equip:getGemPos(1) and equip:getGemPos(1) ~= 0 then
		local gemId = equip:getGemPos(1)
		img_baoshicao1:setVisible(true)
		local item = ItemData:objectByID(gemId)
		img_gem1:setTexture(item:GetPath())
	end

    if equip:getGemPos(2) and equip:getGemPos(2) ~= 0 then
        local gemId = equip:getGemPos(2)
        img_baoshicao2:setVisible(true)
        local item = ItemData:objectByID(gemId)
        img_gem2:setTexture(item:GetPath())
    end

    local img_gem_bg = {}
    local img_gem = {}
    local txt_attr_gem = {}
    local txt_attr_gem_val = {}
    for i=1,EquipmentManager.kGemMergeTargetNum do
        img_gem_bg[i]                     = TFDirector:getChildByPath(panel_node, "img_baoshicao"..i)
        img_gem[i]                        = TFDirector:getChildByPath(img_gem_bg[i], "img_baoshi")
        txt_attr_gem[i]                   = TFDirector:getChildByPath(img_gem_bg[i], "txt_baoshishuxing")
        txt_attr_gem_val[i]               = TFDirector:getChildByPath(img_gem_bg[i], "txt_shuxingzhi")        
    end
    
    local txt_power = TFDirector:getChildByPath(panel_node, 'txt_zhanlizhi');
    --宝石
    for i = 1, SkyBookManager.kGemMergeTargetNum do
        if equip:getGemPos(i) then
            local item = ItemData:objectByID(equip:getGemPos(i))
            if item then
                img_gem_bg[i]:setVisible(true);
                local gem = GemData:objectByID(equip:getGemPos(i))
                if gem then
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
    --
    local txt_yanxiu = TFDirector:getChildByPath(self.panel_tianshu, "txt_extraattr_1") 
    local txt_yanxiu_num = TFDirector:getChildByPath(self.panel_tianshu, "txt_extraattr_num_1")
    local chongzhuData = equip:getChongzhuData() or {}
    local lev = 0
    for k, v in pairs(chongzhuData) do
        lev = lev + v.level
    end
    txt_yanxiu_num:setText(lev)
    --天书参悟
    local txt_can_level = TFDirector:getChildByPath(self.panel_tianshu, "txt_extraattr_num_2")
    local canWuLevel    = equip.canWuMaxLevel or 1
    txt_can_level:setText(localizable.Sky_book_rank_des[canWuLevel])

end

function OtherSkyBookLayer:removeUI()
	self.super.removeUI(self)
end

function OtherSkyBookLayer:registerEvents(ui)
    self.super.registerEvents(self);
end

function OtherSkyBookLayer:removeEvents()
	self.super.removeEvents(self)
    self.isfirst = true
end

return OtherSkyBookLayer