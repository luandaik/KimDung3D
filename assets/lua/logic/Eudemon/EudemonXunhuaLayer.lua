-- client side EudemonPanelLayer.lua
--[[
 * @Description: 宠物驯化界面
 ]]
-- script writer ye
-- creation time 2017-03-02
local EudemonXunhuaLayer = class("EudemonXunhuaLayer", BaseLayer)

function EudemonXunhuaLayer:ctor()
	self.super.ctor(self)
	self:init("lua.uiconfig_mango_new.pet.PetXunHua")
end
function EudemonXunhuaLayer:setEudemonData(eudemonId, fightType)
    self.eudemonId = eudemonId
    self.fightType = fightType
    print("fightType  ", fightType)
    self.eudemonInfo = EudemonManager:getEudemonById(eudemonId)
end
function EudemonXunhuaLayer:initUI( ui )
    self.super.initUI(self, ui)

	self.img_pet              = TFDirector:getChildByPath(ui,"img_pet")
    self.img_fight             = TFDirector:getChildByPath(ui, "img_zhan")
    self.txt_eudemonName       = TFDirector:getChildByPath(ui, "txt_eudemonName")
    self.icon_level            = TFDirector:getChildByPath(ui, "icon_level")
    self.btn_help              = TFDirector:getChildByPath(ui, "btn_bangzu")

    self.img_pet:setVisible(false)
    self.img_fight:setVisible(false)
    self.txt_eudemonName:setVisible(false)
    --
    self.img_levelbg        = TFDirector:getChildByPath(ui, "img_levelbg")
    --战宠属性
    self.img_leftbg = TFDirector:getChildByPath(ui, "img_leftbg")
    self.starList = {}
    for i=1,5 do
        local starbg    = TFDirector:getChildByPath(ui, "img_starbg" .. i)
        local img_star  = TFDirector:getChildByPath(starbg, "img_star")
        img_star:setVisible(false)
        self.starList[i] = {}
        self.starList[i].starbg   = starbg
        self.starList[i].img_star = img_star
    end
    --团队加成
    self.Panel_xunhua   = TFDirector:getChildByPath(ui, "Panel_xunhua")
    self.team_attr = {}
    for i = 1, 5 do
        local child = TFDirector:getChildByPath(ui, "txt_attri_" .. i)
        if (child) then
            --child:setVisible(false)
            self.team_attr[i] = {}  
            self.team_attr[i].txt           = child
            self.team_attr[i].txt_team      = TFDirector:getChildByPath(child, "txt_number")
        --self.team_attr[i].txt_curr:setText("1")
        end
    end
    --战宠加成
    self.eudemon_attr = {}
    for i = 1, 4 do
        local child = TFDirector:getChildByPath(ui, "txt_attri_" .. i+1 .."-Copy1")
        if (child) then
            child:setVisible(false)
            self.eudemon_attr[i] = {}
            self.eudemon_attr[i].txt        = child
            self.eudemon_attr[i].txt_eudemon = TFDirector:getChildByPath(child, "txt_number")
        end
    end
    --孔位信息
    self.jiacheng_attr = {}
    for i = 1, 4 do 
        local child = TFDirector:getChildByPath(ui, "txt_jiacheng"..i)
        if(child) then
            child:setVisible(false)
            self.jiacheng_attr[i] = {}
            self.jiacheng_attr[i].txt = child
            self.jiacheng_attr[i].txt_jiacheng = TFDirector:getChildByPath(ui, "txt_"..i)
            if i >= 3 then
                self.jiacheng_attr[i].txt_jiacheng:setVisible(false)
            end
        end
    end

    --材料按钮
    self.costLayer = {}
    for i=1, 2 do
        local btn_tool      = TFDirector:getChildByPath(ui, "btn_tool"..i)
        btn_tool.txt_num1   = TFDirector:getChildByPath(btn_tool, "txt_num1")
        btn_tool.txt_num2   = TFDirector:getChildByPath(btn_tool, "txt_num2")
        btn_tool.img_tool   = TFDirector:getChildByPath(btn_tool, "img_tool")
        btn_tool:setVisible(false)
        btn_tool.index = i
        btn_tool.logic = self
        self.costLayer[i] = btn_tool
    end
    
    --self.btn_tool:setVisible(false)
    --等级
    self.img_Holebg    = TFDirector:getChildByPath(ui, "img_bg2")
    self.text_lv        = TFDirector:getChildByPath(self.img_Holebg, "txt_lv")
    self.text_lv:setVisible(false)
    --当前孔位图片
    self.img_Hole    = TFDirector:getChildByPath(ui, "img_icon")
    self.img_Hole:setVisible(false)
    self.img_Hole.index = 1
    --5个孔位的按钮
    self.HoldText = {"qixue","wuli","fangyu","neili","shenfa"}
    self.bgPos = {{x=170},{x=215},{x=200},{x=230},{x=185}}
    self.img_Holebg:setPosition(ccp(self.bgPos[1].x,311))
    self.btn_Hole = {}
    for i=1,5 do
    local btn_hole      = TFDirector:getChildByPath(ui,"btn_"..self.HoldText[i])
    btn_hole.logic      = self
    btn_hole.index      = i
    self.btn_Hole[i]    = btn_hole
    end
    --驯化按钮
    self.btn_xunhua     = TFDirector:getChildByPath(ui, "btn_xunhua")
    self.isUpHole       = false
    self.img_choiceLine = {}
    for i=1,5 do
        local img_Line  = TFDirector:getChildByPath(ui,"img_"..i)
        img_Line:setVisible(false)
        self.img_choiceLine[i] = img_Line
    end
end

function EudemonXunhuaLayer.onHoleClickHandle(sender)
    local self = sender.logic
    self.img_Hole.index = sender.index
    self.img_Holebg:setPosition(ccp(self.bgPos[sender.index].x,311))
    self:refreshHoleText(self.img_Hole.index)
    self:refreshCost()
    self:refreshJiaChengEudemonInfo()
    --self.text_lv:setText(sender.index.."Lv"..level)
    --EudemonManager:sendEudemonGetHole(self.eudemonInfo:getId())
end


function EudemonXunhuaLayer.onUpHoleClickHandle(sender)
    local self = sender.logic
    local HoleMaxLevel = ConstantData:objectByID("PetTrainingMaxLevel").value or 100
    local HoleInfo = self.eudemonInfo:getHoleLevelValue(self.img_Hole.index)
    if HoleInfo == nil then
        return
    end
    local costList = self.eudemonInfo:getXunhuaConsume(HoleInfo.acupoint, HoleInfo.level+1)
    if HoleInfo.level >= HoleMaxLevel then
        toastMessage(localizable.Eudemon_maxLevel)
        return
    end
    for i,data in ipairs(costList) do
        local info      = string.split(data, "_")
        if (data ~= "") then
            local itemId    = tonumber(info[2])
            local itemNum   = tonumber(info[3]) or 0
            --
            local bagInfo = BagManager:getItemById(itemId)
            local haveNum = 0
            if (bagInfo) then
                haveNum = bagInfo.num
            end
            if (itemNum > haveNum) then
                local item = ItemData:objectByID(itemId)
                if (item) then
                    toastMessage(localizable.Eudemon_item)
                    return
                end
                print("**ERROR************EudemonTupoLayer.onTupoClickHandle************  ",sender.upType," ,",itemId )
                break
            end
        end
    end
    self.isUpHole   = true
    EudemonManager:sendEudemonUpHole(self.eudemonInfo:getId(), self.img_Hole.index)
end

function EudemonXunhuaLayer.onShowItemClickHandle(sender)
    local self = sender.logic;
    Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId)
end
--帮助面板
function EudemonXunhuaLayer:OnRuleClick( sender )
    CommonManager:showRuleLyaer('pettraining')
end
function EudemonXunhuaLayer:removeUI()
	self.super.removeUI(self)
end

function EudemonXunhuaLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function EudemonXunhuaLayer:refreshUI()
	if (self.eudemonInfo == nil) then
    	print("**ERROR***************EudemonXunhuaLayer:refreshUI()**********************")
    	return
    end
    self:refreshLeftEudemonInfo()
    self:refreshJiaChengEudemonInfo()
    self:refreshCost()
    self:refreshHoleText(self.img_Hole.index)
end
function EudemonXunhuaLayer:refreshLeftEudemonInfo()
    self.img_pet:setTexture(self.eudemonInfo:getBigImagePath())
    self.txt_eudemonName:setText(self.eudemonInfo:getName())
    self.icon_level:setTexture(EudemonManager.img_quality[self.eudemonInfo:getQuality()])
    --
    local starLevel = self.eudemonInfo:getStarLevel()
    for i=1,5 do
        local star = self.starList[i]
        if (star.img_star) then
            star.img_star:setVisible(i <= starLevel)
        end
    end

    self.fight_attr = {}
    local count = 0
    for i,v in pairs(EudemonAttributeTypeList) do
        count = count + 1    
        local child = TFDirector:getChildByPath(self.img_leftbg, "img_shuxingbg" .. count)
        if (child) then
            child:setVisible(false)
            self.fight_attr[count] = child
            self.fight_attr[count].txt_number   = TFDirector:getChildByPath(child, "txt_number")
        end
    end
    --
   
    --
    self.img_pet:setVisible(true)
    self.txt_eudemonName:setVisible(true)
    self.img_fight:setVisible(self.eudemonInfo:isHelpFight())  
    self.img_levelbg:setTexture("ui_new/role/bg-n"..self.eudemonInfo:getQuality()..".png")
    --
    self:refreshFightAttrText()
end

function EudemonXunhuaLayer:refreshJiaChengEudemonInfo()
    local totalAttr = self.eudemonInfo:getXunYan()
    local count = 0
    for i=1,5 do
        self.team_attr[i].txt_team:setText("+"..0)
    end
    for attrId,attrValue in pairs(totalAttr.attribute) do

        if attrValue ~= 0 then
            count = count + 1
            local attr = self.team_attr[count]
            
            if (attr) then
                attr.txt:setText(localizable.Eudemon_add_attr..AttributeTypeStr[attrId])
                attr.txt_team:setText("+"..covertToDisplayValue(attrId, attrValue, true))
                attr.txt:setVisible(true)      
            else
                print("*ERROR*********EudemonTupoLayer:refreshjiachengEudemonInfo***************attrId*",attrId, " attrValue ",attrValue)
            end
        end
        
    end
end

function EudemonXunhuaLayer:refreshFightAttrText()
    local totalAttr = self.eudemonInfo:getFightAttribute(self.fightType)
    --print(self.fightType, ",", self.eudemonInfo:getName(), " -----,", totalAttr.attribute)
    local count = 0
    for i,attrId in pairs(EudemonAttributeTypeList) do
        local attrValue = totalAttr.attribute[attrId] or 0
        count = count + 1
        local attr = self.fight_attr[count]
        if (attr) then
            attr.txt_number:setText(AttributeTypeStr[attrId].." : "..covertToDisplayValue(attrId, attrValue, true))
            attr:setVisible(true)
        else
            print("*ERROR*********EudemonTupoLayer:refreshFightAttrText()****************",attrId)
        end
    end
end
--孔位信息
function EudemonXunhuaLayer:refreshHoleText(index)
    for i=1,5 do
        self.img_choiceLine[i]:setVisible(false)
    end
    for k,v in pairs(self.btn_Hole) do    
        local HoleInfo = self.eudemonInfo:getHoleLevelValue(k)
        if nil == v.effect then
            v.effect = self:getPointEffectByQuality(HoleInfo.quality or 0)
            if v.effect then
                v:addChild(v.effect)
                v.effect:playByIndex(0, -1, -1, 1)
            end
        else
            if v.effect.quality ~= HoleInfo.quality then
                v.effect:removeFromParent()
                v.effect = self:getPointEffectByQuality(HoleInfo.quality or 0)
                if v.effect then
                    v:addChild(v.effect)
                    v.effect:playByIndex(0, -1, -1, 1)
                end
            end
        end
    end
    self.img_choiceLine[index]:setVisible(true)
    self.img_Hole:setTexture("ui_new/rolerisingstar/btn_"..self.HoldText[index].."_u.png")
    self.img_Hole:setVisible(true)
    local HoleInfo = self.eudemonInfo:getHoleLevelValue(index)
    if HoleInfo == nil then
        return
    end
    if HoleInfo.quality > 0 then
        self.text_lv:setText(localizable.EudemonHoleTypeList[HoleInfo.quality].."Lv"..HoleInfo.level)
    else
        self.text_lv:setText("Lv"..HoleInfo.level)
    end
    self.text_lv:setVisible(true)
        --每次进来之前需要清空之前留下的信息
    for i = 1, 2 do
        self.jiacheng_attr[i].txt:setVisible(true)
        self.jiacheng_attr[i].txt:setText(localizable.Eudemon_add_attr..AttributeTypeStr[index])
    end
    self.jiacheng_attr[1].txt_jiacheng:setText("+".."0")
    self.jiacheng_attr[2].txt_jiacheng:setText("+".."0%")
    local xunyanAttr = self.eudemonInfo:getXunYanSingleAttributeByIndex(index)
    local count = 0
    for attrId,attrValue in pairs(xunyanAttr.attribute) do
        if attrValue ~= 0 then
            if attrId >= 1 and attrId <= 5 then
                count = 1
            elseif attrId >= 18 and attrId <= 22 then
                count = 2
            end
            local attr = self.jiacheng_attr[count]
            if (attr) then
                attr.txt:setVisible(true)
                attr.txt:setText(localizable.Eudemon_add_attr..AttributeTypeStr[attrId])
                attr.txt_jiacheng:setVisible(true)
                attr.txt_jiacheng:setText("+"..covertToDisplayValue(attrId, attrValue, true))
            else
                print("*ERROR*********EudemonTupoLayer:refreshXunhua***************attrId*",attrId, " attrValue ",attrValue)
            end
        end
    end
    for i=1,2 do
        self.eudemon_attr[i].txt:setVisible(true)
        self.eudemon_attr[i].txt_eudemon:setText("+".."0%")
    end
    self.eudemon_attr[1].txt:setText(localizable.Eudemon_add_pet..AttributeTypeStr[2])
    self.eudemon_attr[2].txt:setText(localizable.Eudemon_add_pet..AttributeTypeStr[4])
    local petAttr = self.eudemonInfo:getPetExtAttribute()
    local count = 0
    for attrId,attrValue in pairs(petAttr.attribute) do
        count = count + 1
        local attr = self.eudemon_attr[count]
        if (attr) then
            attr.txt:setVisible(true)
            attr.txt:setText(localizable.Eudemon_add_pet..AttributeTypeStr[attrId])
            attr.txt_eudemon:setText("+"..covertToDisplayValue(attrId, attrValue, true))
        else
            print("*ERROR*********EudemonTupoLayer:refreshzhanchongjiacheng***************attrId*",attrId, " attrValue ",attrValue)
        end
    end
end
--
function EudemonXunhuaLayer:refreshCost()
    local HoleMaxLevel = ConstantData:objectByID("PetTrainingMaxLevel").value or 100
    for k,v in ipairs(self.costLayer) do
        v:setVisible(false)
    end
    self.btn_xunhua:setGrayEnabled(true)
    self.btn_xunhua:setTouchEnabled(false)
    --self.btn_xunhua:setVisible(false)
    local HoleInfo = self.eudemonInfo:getHoleLevelValue(self.img_Hole.index)
    if HoleInfo == nil then
        return
    end
    if HoleInfo.level >= HoleMaxLevel then
        --toastMessage(localizable.Eudemon_maxLevel)
        return
    end
    local costList = self.eudemonInfo:getXunhuaConsume(HoleInfo.acupoint, HoleInfo.level+1)
    self.btn_xunhua:setGrayEnabled(false)
    self.btn_xunhua:setTouchEnabled(true)
    --self.btn_xunhua:setVisible(true)
    for i,data in ipairs(costList) do
        if (data and data ~= "") then
            local info          = string.split(data, "_")
            local itemTypeId    = tonumber(info[1])
            local itemId        = tonumber(info[2])
            local itemNum       = tonumber(info[3])
            local btn           = self.costLayer[i]
            if (btn) then
                btn:setVisible(true)
                btn.itemId          = itemId
                btn.itemTypeId      = itemTypeId
                btn:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
                local item = ItemData:objectByID(itemId)
                if (item) then
                    local iconStr = item:GetPath()
                    btn.img_tool:setTexture(iconStr)
                    btn:setTextureNormal(GetColorIconByQuality(item.quality))
                end
                local num = BagManager:getItemNumById(itemId)
                btn.txt_num1:setText(num)
                btn.txt_num2:setText("/"..itemNum)
                if (num >= itemNum) then
                    btn.txt_num1:setColor(ccc3(255,255,255))
                else
                    btn.txt_num1:setColor(ccc3(255,0,0))
                end

            end
        end
    end
end
--
function EudemonXunhuaLayer:registerEvents()
	self.super.registerEvents(self)
    --帮助按钮
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.OnRuleClick,self)))
    --孔位按钮事件
    for i=1,5 do
    self.btn_Hole[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHoleClickHandle),1)
    end
    --驯化按钮事件
    self.btn_xunhua.logic = self
    self.btn_xunhua:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onUpHoleClickHandle),1)
    --孔位接收事件
    self.receiveInfo = function(event)     
        self:refreshLeftEudemonInfo()
        self:refreshJiaChengEudemonInfo()
        self:refreshHoleText(self.img_Hole.index)
        self:refreshCost()
        if self.isUpHole then
            self:addResultEffect()
            self:addSuccessEffect(self.btn_Hole[self.img_Hole.index])
            self.isUpHole = false
        end
    end
    --升级完成事件
    TFDirector:addMEGlobalListener(EudemonManager.EudemonHole, self.receiveInfo)
    -- self.receiveInfo1 = function(event)
    --     self:refreshLeftEudemonInfo()
    --     self:refreshCost()
    --     self:refreshHoleText(self.img_hole.index)
    --     self.eudemonInfo:updateAttr(true)
    --     self:addResultEffect()
    --     self:addSuccessEffect(self.btn_Hole[self.img_Hole.index])
    -- end
    -- TFDirector:addMEGlobalListener(EudemonManager.EudemonUpHole, self.receiveInfo1)
end

function EudemonXunhuaLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(EudemonManager.EudemonHole, self.receiveInfo)
    --TFDirector:removeMEGlobalListener(EudemonManager.EudemonUpHole, self.receiveInfo1)
    self.receiveInfo = nil

end
--添加左边驯化成功特效
function EudemonXunhuaLayer:addResultEffect() 

    if self.rightEffect then
        self.rightEffect:removeMEListener(TFARMATURE_COMPLETE)
        self.rightEffect:removeFromParent()
        self.rightEffect = nil
    end
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equipment_refining.xml")
    local effect = TFArmature:create("equipment_refining_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    self.img_leftbg:addChild(effect)
    effect:setPosition(ccp(135,150))
    effect:setScaleX(0.8)
    effect:setZOrder(100)
    self.rightEffect = effect
    self.rightEffect:playByIndex(0, -1, -1, 0)

    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeFromParent()
        self.rightEffect = nil
    end)
end
--添加孔位升级特效
function EudemonXunhuaLayer:addSuccessEffect( widget )
    if self.successEffect then
        self.successEffect:removeMEListener(TFARMATURE_COMPLETE)
        self.successEffect:removeFromParent()
        self.successEffect = nil
    end
    
    local resPath = "effect/role_train.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("role_train_anim")

    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(0,0))
    effect:setZOrder(100)
    self.successEffect = effect    
    self.successEffect:playByIndex(0, -1, -1, 0)
    widget:addChild(effect)

    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeFromParent()
        self.successEffect = nil
    end)
end
--
function EudemonXunhuaLayer:getPointEffectByQuality(quality)
    if quality <= 0 then 
        return nil 
    end
    TFResourceHelper:instance():addArmatureFromJsonFile('effect/lianti'..quality..'.xml')
    local effect = TFArmature:create('lianti'..quality..'_anim')
    effect.quality = quality
    return effect
end
return EudemonXunhuaLayer