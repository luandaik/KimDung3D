--[[
    更换天书,已穿戴
]]

local EquipreplaceTianshuLayer = class("EquipreplaceTianshuLayer", BaseLayer)

EquipreplaceTianshuLayer.MAX_ATTR_SIZE = 11

function EquipreplaceTianshuLayer:ctor()
    self.super.ctor(self, data)

    self:init("lua.uiconfig_mango_new.role.EquipReplaceTianShu")

end

function EquipreplaceTianshuLayer:loadData(roleGmId,equipGmId)
    self.roleGmId   = roleGmId;
    self.equipGmId  = equipGmId;
end

function EquipreplaceTianshuLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function EquipreplaceTianshuLayer:initUI(ui)
    self.super.initUI(self, ui)
    
    self.btn_genghuan        = TFDirector:getChildByPath(ui, 'btn_genghuan')
    self.panel_close        = TFDirector:getChildByPath(ui, 'panel_close')

    self.panel_chuandaizhuangbei        = TFDirector:getChildByPath(ui, 'panel_chuandaizhuangbei');
    self.panel_dangqianzhuangbei        = TFDirector:getChildByPath(ui, 'panel_dangqianzhuangbei');
end

function EquipreplaceTianshuLayer:refreshUI()
    self.cardRole = CardRoleManager:getRoleByGmid(self.roleGmId);

    local equip = SkyBookManager:getItemByInstanceId(self.equipGmId);
    self:initAttr(self.panel_chuandaizhuangbei, equip);

    local cur_equip = self.cardRole:getSkyBook()
    self:initAttr(self.panel_dangqianzhuangbei, cur_equip);
end


function EquipreplaceTianshuLayer:initAttr(panel_node,equip)
    local img_zhuangbeibeijing_bg = TFDirector:getChildByPath(panel_node, 'img_zhuangbeibeijing_bg');
    
    local img_quality = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'btn_equip');
    local _quality = SkyBookManager:GetUpQuality(equip.quality, equip.tupoLevel)
    img_quality:setTextureNormal(GetColorIconByQuality(_quality));
    SkyBookManager:BindEffectOnEquip(img_quality, equip)

    local img_icon = TFDirector:getChildByPath(img_quality, 'img_tianshu_icon');
    img_icon:setTexture(equip:GetTextrue());

    local txt_name = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'txt_zhuangbeiming');
    txt_name:setText(equip:getConfigName());
    --txt_name:setColor(GetColorByQuality(equip.quality));

    local txt_qianghualv = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'txt_qianghualv');
    if equip.level == 0 then
        txt_qianghualv:setVisible(false)
    else
        --txt_qianghualv:setText(EnumSkyBookLevelType[equip.level] .. "重")
        txt_qianghualv:setText(stringUtils.format(localizable.common_chong,EnumSkyBookLevelType[equip.level] ))
        txt_qianghualv:setVisible(true)
    end

    local img_arrow = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'img_jiantousheng');
    
    local equipInfo = self.cardRole:getSkyBook()

    if (equipInfo ~= nil and  equipInfo.instanceId == equip.instanceId) then
        img_arrow:setVisible(false);
    elseif equipInfo == nil or equip:getpower() > equipInfo:getpower() then
        img_arrow:setVisible(true);
        img_arrow:setTexture("ui_new/roleequip/js_jts_icon.png");
    else
        img_arrow:setVisible(true);
        img_arrow:setTexture("ui_new/roleequip/js_jtx_icon.png");
    end

    --战力值
    local txt_power = TFDirector:getChildByPath(panel_node, 'txt_zhanlizhi')

    --总属性
    local txt_attr = {}
    local txt_attr_num = {}
    local panel_move = TFDirector:getChildByPath(panel_node, "panel_move")
    --for i=1,self.MAX_ATTR_SIZE do
    local count = 1
    local childrenArr = panel_move:getChildren()
    for i=0,childrenArr:count()-1 do
        local child = TFDirector:getChildByPath(panel_move,'txt_attr'..count)
        if (child) then
            print(count, "  ",child)
            txt_attr[count] = child
            txt_attr_num[count] = TFDirector:getChildByPath(panel_move, "txt_attr" .. count .. "_num")
            child:setVisible(false)
            txt_attr_num[count]:setVisible(false)
            count = count + 1
        end
    end
    
    local totalAttr = equip:getTotalAttr()
    count = 0
    for i = 1, EnumAttributeType.Max - 1 do
        if totalAttr[i] and totalAttr[i] ~= 0 and count < self.MAX_ATTR_SIZE then
            count = count + 1
            txt_attr[count]:setText(AttributeTypeStr[i])
            txt_attr_num[count]:setText("+" .. totalAttr[i])
            txt_attr[count]:setVisible(true)
            txt_attr_num[count]:setVisible(true)
        end
    end
    local immuneAttr = equip:getImmuneAttr()
    for k,v in pairs(immuneAttr) do
        if v and v ~= 0 then
            count = count + 1
            txt_attr[count]:setText(SkillBuffHurtStr[k])
            txt_attr_num[count]:setText("+" .. covertToDisplayValue(k,v,true))
            txt_attr[count]:setVisible(true)
            txt_attr_num[count]:setVisible(true)
        end
    end
    local effectExtraAttr = equip:getEffectExtraAttr()
    for k,v in pairs(effectExtraAttr) do
        if v and v ~= 0 then
            count = count + 1
            txt_attr[count]:setText(SkillBuffHurtStr[k])
            txt_attr_num[count]:setText("+" .. covertToDisplayValue(k,v,true))
            txt_attr[count]:setVisible(true)
            txt_attr_num[count]:setVisible(true)
        end
    end
    local beEffectExtraAttr = equip:getBeEffectExtraAttr()
    local attrInfo = getBeEffectInfo(beEffectExtraAttr)
    for attrName,info in pairs(attrInfo) do
        for i=1,2 do
            local str = ""
            local isShow = false
            if (i == 1) then
                if (info.percentAttr > 0) then
                    count = count + 1
                    str = "+"..info.percentAttr.."%"
                    isShow = true
                end
            elseif(i == 2) then
                if (info.constAttr > 0) then
                    count = count + 1
                    str = "+"..info.constAttr
                    isShow = true
                end
            end
            if (isShow) then
                local txt_name = txt_attr[count]
                local txt_base = txt_attr_num[count]
                if (txt_name) then
                    txt_name:setText(attrName)
                    txt_base:setText(str)
                    txt_name:setVisible(true)
                    txt_base:setVisible(true)
                end
            end
            
        end
    end
    -- for k,v in pairs(beEffectExtraAttr) do
    --     if v and v ~= 0 then
    --         count = count + 1
    --         if (txt_attr[count]) then
    --             local attrName = BeEffectExtraStr[k]
    --             if (k == 45 or k == 102) then
    --                 --受疗
    --                 attrName = localizable.Sky_book_tips_2
    --             end
    --             txt_attr[count]:setText(attrName)
    --             txt_attr_num[count]:setText("+" .. covertToDisplayValue(k,v,true))
    --             txt_attr[count]:setVisible(true)
    --             txt_attr_num[count]:setVisible(true)
    --         end
    --     end
    -- end

    -- self:SetMove(panel_move,count)
    txt_power:setText(equip:getpower())

    Public:addStarImg(img_icon, equip.tupoLevel)
	
	local img_baoshicao1 = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, "img_baoshicao1")
	local img_gem1 = TFDirector:getChildByPath(img_baoshicao1, "img_gem1")

    local img_baoshicao2 = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, "img_baoshicao2")
    local img_gem2 = TFDirector:getChildByPath(img_baoshicao2, "img_gem1")

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
end

function EquipreplaceTianshuLayer:removeUI()
    self.super.removeUI(self)
end

function EquipreplaceTianshuLayer:registerEvents(ui)
    self.super.registerEvents(self);

    self.btn_genghuan.logic = self;
    self.btn_genghuan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGenghuanClickHandle),1);
end

function EquipreplaceTianshuLayer.onGenghuanClickHandle(sender) 
    local self = sender.logic;
    TFAudio.playEffect("sound/effect/btn_wear.mp3", false)

    local item = SkyBookManager:getItemByInstanceId(self.equipGmId)

    local data = 
    {
        roleId = self.roleGmId,
        bibleId = self.equipGmId,
        itemId = item.id
    }
    TFDirector:dispatchGlobalEventWith("SkyBookChangeBegin", {})
    SkyBookManager:requestBibleEquip(data)
    self:getParent():removeLayer(self, not self.isCache)
end


function EquipreplaceTianshuLayer:removeEvents()
    self.super.removeEvents(self)
end

function EquipreplaceTianshuLayer:SetMove(node,index)
    if node == nil then
        return nil
    end
    if node.moveTween then
        TFDirector:killTween(node.moveTween)
        node.moveTween = nil
        node:setPositionY(node.initPosY)
    end

    if node.initPosY == nil then
        node.initPosY = node:getPositionY()
    end
    local limitAttrNum = 9
    if index > limitAttrNum then    
        local moveDy = (index - limitAttrNum)*30
        local posY = node.initPosY
        local moveTween = 
        {
            target = node,
            repeated = -1,
            {
                duration = 2,
                delay = 1,
                y = posY + moveDy,
                      
            },
            { -- 此节实现节与节之间的延时
                duration = 1,
                delay = 1, 
                onComplete = function()
                    node:setPositionY(posY)
                end    
            },
        }
        TFDirector:toTween(moveTween)
        node.moveTween = moveTween
    end
end

return EquipreplaceTianshuLayer