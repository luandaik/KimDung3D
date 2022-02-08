--[[
    穿天书，目前未穿戴
]]

local EquipdressXinFaLayer = class("EquipdressXinFaLayer", BaseLayer)
UINum = 13

function EquipdressXinFaLayer:ctor()
    self.super.ctor(self,data)
    
    self.isfirst = true
    self:init("lua.uiconfig_mango_new.role.EquipdressXinFa")
end

function EquipdressXinFaLayer:loadData(roleGmId, equipGmId)
    self.roleGmId   = roleGmId;
    self.equipGmId  = equipGmId;
    self.equipInfo  = XinFaManager:getXinFaByGmId(self.equipGmId)
    self:refreshUI()
end

function EquipdressXinFaLayer:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function EquipdressXinFaLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.equipInfo                  = nil

    self.img_zhuangbeibeijing_bg    = TFDirector:getChildByPath(ui, 'img_zhuangbeibeijing_bg')
    self.txt_zhuangbeiming          = TFDirector:getChildByPath(self.img_zhuangbeibeijing_bg, 'txt_zhuangbeiming')
    self.btn_equip                  = TFDirector:getChildByPath(self.img_zhuangbeibeijing_bg, 'btn_equip')       
    self.img_tianshu_icon           = TFDirector:getChildByPath(self.btn_equip, 'img_tianshu_icon')    
    self.panel_star                 = TFDirector:getChildByPath(self.img_zhuangbeibeijing_bg, 'panel_star') 
    self.txt_starlv                 = TFDirector:getChildByPath(self.panel_star, 'txt_starlv') 
    self.txt_qianghualv             = TFDirector:getChildByPath(self.img_zhuangbeibeijing_bg, 'txt_qianghualv')
    self.panel_shuxing              = TFDirector:getChildByPath(ui, 'panel_shuxing')
    self.panel_move                 = TFDirector:getChildByPath(self.panel_shuxing, 'panel_move')
    self.txt_zhanlizhi              = TFDirector:getChildByPath(ui, 'txt_zhanlizhi')
    self.btn_zhuangpei              = TFDirector:getChildByPath(ui, 'btn_zhuangpei')
    self.txt_attr = {}
    for i = 1, UINum do
        local txt_attr      = TFDirector:getChildByPath(self.panel_move, 'txt_attr'..i)
        txt_attr.txt_num    = TFDirector:getChildByPath(txt_attr, 'txt_attr'..i..'_num')
        txt_attr:setVisible(false)
        self.txt_attr[i]    = txt_attr
    end

end

function EquipdressXinFaLayer:refreshUI()
    self.cardRole = CardRoleManager:getRoleByGmid(self.roleGmId)
    if self.equipInfo == nil then 
         return
     end
    self.txt_zhuangbeiming:setText(self.equipInfo.config.name)
    self.btn_equip:setTextureNormal(GetColorIconByQuality(self.equipInfo.config.quality))
    XinFaManager:BindEffectOnEquip(self.btn_equip,self.equipInfo)
    self.img_tianshu_icon:setTexture(self.equipInfo.config:GetPath())
    if self.equipInfo.star == 0 then
        self.panel_star:setVisible(false)
    else
        self.panel_star:setVisible(true)
    end
    if self.equipInfo.level == 1 then
        self.txt_qianghualv:setVisible(false)
    else
        self.txt_qianghualv:setVisible(true)
    end
   self.txt_starlv:setText(self.equipInfo.star)
   self.txt_qianghualv:setText('+'..self.equipInfo.level)
   self:refreshAttr()
   self.txt_zhanlizhi:setText(GetPowerByAttribute(self.equipInfo:getTotalAttribute().attribute))
end

function EquipdressXinFaLayer:refreshAttr()
    local attribute = self.equipInfo:getTotalAttribute().attribute
    if # attribute <= 0 then
        return
    end
    for i = 1, UINum do
        self.txt_attr[i]:setVisible(false)
    end
    local count = 1
    for i,v in pairs(attribute) do
        if i < 6 then
            local txt_attr = self.txt_attr[count]
            txt_attr:setText(AttributeTypeStr[i])
            txt_attr:setPosition(ccp(40, 245 - 30 * (count - 1)))
            txt_attr.txt_num:setText('+'..v)
            txt_attr:setColor(ccc3(0,0,0))
            txt_attr:setVisible(true)
            count = count + 1
        elseif i == 32 or i == 33 then
            local txt_attr = self.txt_attr[count]
            txt_attr:setText(localizable.XinFaSpecialbuteTypeDisPlayeStr[i][1]..'+'..v / 100 ..'%')
            txt_attr:setPosition(ccp(40, 245 - 30 * (count - 1)))
            txt_attr.txt_num:setText('')
            txt_attr:setColor(ccc3(0,0,0))
            txt_attr:setVisible(true)
            count = count + 1
        end
    end
    local img_arrow = TFDirector:getChildByPath(self.img_zhuangbeibeijing_bg, 'img_jiantousheng');
    
    local equipInfo = self.cardRole:getEquipment():GetEquipByType(self.equipInfo.equipType)

    if (equipInfo ~= nil and  equipInfo.gmId == equipInfo.gmId) then
        img_arrow:setVisible(false);
    elseif equipInfo == nil or equipInfo:getpower() > equipInfo:getpower() then
        img_arrow:setVisible(true);
        img_arrow:setTexture("ui_new/roleequip/js_jts_icon.png");
    else
        img_arrow:setVisible(true);
        img_arrow:setTexture("ui_new/roleequip/js_jtx_icon.png");
    end
    for i,v in pairs(attribute) do
        if (i > 6 and i < 18) or (i > 23 and i < 31) then
            local txt_attr = self.txt_attr[count]
            txt_attr:setText(localizable.AttributeTypeStr[i]..'+'..covertToPercentNotZero(v/10))
            txt_attr:setPosition(ccp(40, 245 - 30 * (count - 1)))
            txt_attr.txt_num:setText("")
            txt_attr:setColor(ccc3(189,74,48))
            txt_attr:setVisible(true)
            count = count + 1
        end
    end
    for i,v in pairs(attribute) do
        if i > 500 then
            local txt_attr = self.txt_attr[count]
            --策划说要直接判断换行
            txt_attr:setPosition(ccp(40, 245 - 30 * (count - 0.7)))
            txt_attr:setText(localizable.XinFaSpecialbuteTypeDisPlayeStr[i][1]..'\n'..localizable.XinFaSpecialbuteTypeDisPlayeStr[i][2]..'+'..covertToPercentNotZero(v/10))
            txt_attr.txt_num:setText("")
            txt_attr:setColor(ccc3(189,74,48))
            txt_attr:setVisible(true)
            count = count + 1
        end
    end
    self:SetMove(panel_move,count)
end

function EquipdressXinFaLayer.onZhuangpeiClickHandle(sender)
    local self = sender.logic
    TFAudio.playEffect("sound/effect/btn_wear.mp3", false)
    local item = XinFaManager:getXinFaByGmId(self.equipGmId).config

    TFDirector:dispatchGlobalEventWith("XinFaChangeBegin", {})
    XinFaManager:sendEquipHeartMethod(self.roleGmId, self.equipGmId, item.id)
    self:getParent():removeLayer(self, not self.isCache)
end

function EquipdressXinFaLayer:removeUI()
	self.super.removeUI(self)
end

function EquipdressXinFaLayer:registerEvents(ui)
    self.super.registerEvents(self);

    self.btn_zhuangpei.logic = self
    self.btn_zhuangpei:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onZhuangpeiClickHandle),1)
end

function EquipdressXinFaLayer:removeEvents()
	self.super.removeEvents(self)
    self.isfirst = true
end

function EquipdressXinFaLayer:SetMove(node,index)
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

return EquipdressXinFaLayer

