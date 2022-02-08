--[[
    宠物预览界面
-- script writer fei
-- creation time 2017-03-08
]]
local EudemonPreviewLayer = class("EudemonPreviewLayer", BaseLayer)

function EudemonPreviewLayer:ctor(eudemonTypeId, quality)
    self.super.ctor(self)
    self.eudemonTypeId = eudemonTypeId
    self.quality = quality
    self:init("lua.uiconfig_mango_new.pet.PetYuLan")
end

function EudemonPreviewLayer:initUI(ui)
	self.super.initUI(self, ui)
    self.btn_close      = TFDirector:getChildByPath(ui, "btn_close")
    self.panel_neirong  = TFDirector:getChildByPath(ui, "panel_neirong")
    self.petdata        = BattlePetData:objectByID(self.eudemonTypeId)
    if (self.petdata == nil) then
        AlertManager:close()
        return
    end
    local pic   = string.split(self.petdata.pic, ",")
    local icon  = string.split(self.petdata.icon, ",")
    for i=1,EudemonManager.MAX_QUALITY do
        local Panel_lv     = TFDirector:getChildByPath(ui, "Panel_lv_"..i)
        self:refreshQualityUI(Panel_lv, i, pic[i], tonumber(icon[i]))
    end

    local moveX = -(self.quality - 1) * 380
    self.panel_neirong:setContentOffset(ccp(moveX, 0))
end

function EudemonPreviewLayer:onShow()
    self.super.onShow(self)

end

function EudemonPreviewLayer:refreshUI()
   
end

function EudemonPreviewLayer:refreshQualityUI(node, quality, pic, id)

    local qualitydata  = EudemonManager:getBattlePetQualityData(quality, self.eudemonTypeId, 0)
    local base_growth = string.split(qualitydata.base_growth, ",")

    local img_pet        = TFDirector:getChildByPath(node, "img_pet") 
    local txt_shuxing    = TFDirector:getChildByPath(node, "txt_shuxing") 
    local btn_skill1     = TFDirector:getChildByPath(node, "btn_skill1") 
    local btn_skill2     = TFDirector:getChildByPath(node, "btn_skill2") 
    local btn_skill3     = TFDirector:getChildByPath(node, "btn_skill3") 
    local txt_name       = TFDirector:getChildByPath(node, "txt_name")
    local img_nowlv       = TFDirector:getChildByPath(node, "img_nowlv")
    img_nowlv:setVisible(quality == self.quality)
    --
    if (pic) then
        img_pet:setTexture("ui_new/pet/".. pic .. ".png")
    end
    local item = ItemData:objectByID(id)
    if (item) then
        txt_name:setText(item.name)
    end
    local num1 = (tonumber(base_growth[1]) - 1) * 100
    local num2 = (tonumber(base_growth[2]) - 1) * 100
    local str = localizable.Eudemon_attr11
    if (num2 == 0) then
        str = localizable.Eudemon_attr22
    end
    txt_shuxing:setText(localizable.Eudemon_attr3..stringUtils.format(str, num1, num2))
   --
    local skillList = string.split(qualitydata.effect_id, ",") or {}
    local skillInfo1 = SkillBaseData:objectByID(tonumber(skillList[1]))
    local icon_skill = TFDirector:getChildByPath(btn_skill1, "icon_skill")
    btn_skill1:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowSkillClickHandle),1)
    btn_skill1.skillId = tonumber(skillList[1]) or 0
    if(skillInfo1) then
        icon_skill:setTexture(skillInfo1:GetPath())
    end
    if (#skillList == 2) then
        local icon_skill2 = TFDirector:getChildByPath(btn_skill2, "icon_skill")
        local skillInfo2 = SkillBaseData:objectByID(tonumber(skillList[2]))
        if(skillInfo2) then
            icon_skill2:setTexture(skillInfo2:GetPath())
        end
        btn_skill1:setPositionX(-50)
        btn_skill2:setVisible(true)
        btn_skill2.skillId = tonumber(skillList[2]) or 0
        btn_skill2:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowSkillClickHandle),1)
    elseif (#skillList == 3) then
        local icon_skill2 = TFDirector:getChildByPath(btn_skill2, "icon_skill")
        local skillInfo2 = SkillBaseData:objectByID(tonumber(skillList[2]))
        if(skillInfo2) then
            icon_skill2:setTexture(skillInfo2:GetPath())
        end
        btn_skill2.skillId = tonumber(skillList[2]) or 0
        btn_skill2:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowSkillClickHandle),1)

        local icon_skill3 = TFDirector:getChildByPath(btn_skill3, "icon_skill")
        local skillInfo3 = SkillBaseData:objectByID(tonumber(skillList[3]))
        if(skillInfo3) then
            icon_skill3:setTexture(skillInfo3:GetPath())
        end
        btn_skill3.skillId = tonumber(skillList[3]) or 0
        btn_skill3:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowSkillClickHandle),1)
    end

    local count = 0
    local attrList  = EudemonManager:getEudemonTeamAttr(quality, self.eudemonTypeId, 0)
    for attrId, attrValue in pairs(attrList) do
        count = count + 1
        local txt           = TFDirector:getChildByPath(node, "txt_"..count)
        local txt_number    = TFDirector:getChildByPath(txt, "txt_number")
        txt:setVisible(true)
        txt:setText(localizable.Eudemon_add_attr..AttributeTypeStr[attrId])
        txt_number:setText(covertToDisplayValue(attrId, attrValue, true))
    end
    count = count + 1
    for i=count,5 do
       local txt           = TFDirector:getChildByPath(node, "txt_"..i)
       txt:setVisible(false)
    end
end

--查看技能
function EudemonPreviewLayer.onShowSkillClickHandle(sender)
    local self = sender.logic;
    local skillId = sender.skillId
    EudemonManager:openSkillInfo(skillId)
end

function EudemonPreviewLayer:removeUI()
	self.super.removeUI(self)
end

function EudemonPreviewLayer:dispose()
    self.super.dispose(self)
end

function EudemonPreviewLayer:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function EudemonPreviewLayer:removeEvents()
    self.super.removeEvents(self)
end

return EudemonPreviewLayer
