--[[
    穿天书，目前未穿戴
]]

local EquipdressTianshuLayer = class("EquipdressTianshuLayer", BaseLayer)

EquipdressTianshuLayer.MAX_ATTR_SIZE = 11

function EquipdressTianshuLayer:ctor()
    self.super.ctor(self,data)
    
    self.isfirst = true
    self:init("lua.uiconfig_mango_new.role.EquipdressTianShu")
end

function EquipdressTianshuLayer:loadData(roleGmId, equipGmId)
    self.roleGmId   = roleGmId;
    self.equipGmId  = equipGmId;
end

function EquipdressTianshuLayer:onShow()
    self.super.onShow(self)

    self:refreshUI();
    if self.isfirst == true then
        self.isfirst = false
        self.ui:runAnimation("Action0", 1)
    end
end

function EquipdressTianshuLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.btn_dress        = TFDirector:getChildByPath(ui, 'btn_zhuangpei')
    self.panel_close        = TFDirector:getChildByPath(ui, 'panel_close')
    self.panel_chuandaizhuangbei        = TFDirector:getChildByPath(ui, 'panel_chuandaizhuangbei');
end

function EquipdressTianshuLayer:refreshUI()
    self.cardRole = CardRoleManager:getRoleByGmid(self.roleGmId);
    
    local equip = SkyBookManager:getItemByInstanceId(self.equipGmId)
    self:initAttr(self.panel_chuandaizhuangbei, equip);
end

function EquipdressTianshuLayer:initAttr(panel_node,equip)
    local img_zhuangbeibeijing_bg = TFDirector:getChildByPath(panel_node, 'img_zhuangbeibeijing_bg');
    
    local img_icon = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'img_tianshu_icon');
    img_icon:setTexture(equip:GetTextrue());

    local img_quality = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'btn_equip');
    img_quality:setTextureNormal(GetColorIconByQuality(equip.quality));
    SkyBookManager:BindEffectOnEquip(img_quality, equip)

    local txt_name = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'txt_zhuangbeiming');
    txt_name:setText(equip:getConfigName());
    --txt_name:setColor(GetColorByQuality(equip.quality));

    local txt_qianghualv = TFDirector:getChildByPath(img_zhuangbeibeijing_bg, 'txt_qianghualv');
    if equip.level == 0 then
        txt_qianghualv:setVisible(false)
    else
        --txt_qianghualv:setText(EnumSkyBookLevelType[equip.level] .. "重")  common_chong
        txt_qianghualv:setText( stringUtils.format(localizable.common_chong, EnumSkyBookLevelType[equip.level] ))
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
            txt_attr_num[count]:setText("+ " .. covertToDisplayValue(i,totalAttr[i],true))
            txt_attr[count]:setVisible(true)
            txt_attr_num[count]:setVisible(true)
        end
    end

    local immuneAttr = equip:getImmuneAttr()
    for k,v in pairs(immuneAttr) do
        if v and v ~= 0 then
            count = count + 1
            txt_attr[count]:setText(SkillBuffHurtStr[k])
            txt_attr_num[count]:setText("+ " .. covertToDisplayValue(k,v,true))
            txt_attr[count]:setVisible(true)
            txt_attr_num[count]:setVisible(true)
        end
    end
    local effectExtraAttr = equip:getEffectExtraAttr()
    for k,v in pairs(effectExtraAttr) do
        if v and v ~= 0 then
            count = count + 1
            txt_attr[count]:setText(SkillBuffHurtStr[k])
            txt_attr_num[count]:setText("+ " .. covertToDisplayValue(k,v,true))
            txt_attr[count]:setVisible(true)
            txt_attr_num[count]:setVisible(true)
        end
    end

    local beEffectExtraAttr = equip:getBeEffectExtraAttr()

    local attrInfo = getBeEffectInfo(beEffectExtraAttr)
    for attrName,info in pairs(attrInfo) do
        count = count + 1
        local txt_name = txt_attr[count]
        local txt_base = txt_attr_num[count]
        if (txt_name and (info.percentAttr > 0 or info.constAttr > 0)) then
            txt_name:setText(attrName)
            local str = " "
            if (info.percentAttr > 0) then
                str = " +"..info.percentAttr.."%"
            end
            
            if (info.constAttr > 0) then
                str = str.."+"..info.constAttr
            end
            txt_base:setText(str)
            txt_name:setVisible(true)
            txt_base:setVisible(true)
            
        end     
    end
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

function EquipdressTianshuLayer:removeUI()
	self.super.removeUI(self)
end

function EquipdressTianshuLayer:registerEvents(ui)
    self.super.registerEvents(self);

    self.btn_dress.logic     = self;
    self.btn_dress:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onDressClickHandle), 1);
end

function EquipdressTianshuLayer.onDressClickHandle(sender) 
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


function EquipdressTianshuLayer:removeEvents()
	self.super.removeEvents(self)
    self.isfirst = true
end

function EquipdressTianshuLayer:SetMove(node,index)
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

return EquipdressTianshuLayer

