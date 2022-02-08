-- client side EudemonPanelLayer.lua
--[[
 * @Description: 宠物突破界面
 ]]
-- script writer fei
-- creation time 2017-03-02     

local EudemonTupoLayer = class("EudemonTupoLayer", BaseLayer)

function EudemonTupoLayer:ctor()
	self.super.ctor(self)
	self:init("lua.uiconfig_mango_new.pet.PetTupo")
end

function EudemonTupoLayer:setEudemonData(eudemonId, fightType)
    self.eudemonId = eudemonId
    self.fightType = fightType
    print("fightType  ", fightType)
    self.eudemonInfo = EudemonManager:getEudemonById(eudemonId)
end
function EudemonTupoLayer:initUI( ui )
	self.super.initUI(self, ui)

	self.img_pet 		       = TFDirector:getChildByPath(ui,"img_pet")
	self.img_fight             = TFDirector:getChildByPath(ui, "img_zhan")
	self.txt_eudemonName       = TFDirector:getChildByPath(ui, "txt_eudemonName")
	self.icon_level            = TFDirector:getChildByPath(ui, "icon_level")
	self.img_pet:setVisible(false)
	self.img_fight:setVisible(false)
	self.txt_eudemonName:setVisible(false)
	--
    self.img_levelbg        = TFDirector:getChildByPath(ui, "img_levelbg")
	local img_growbg = TFDirector:getChildByPath(ui, "img_growbg")
	self.txt_growbefore = TFDirector:getChildByPath(img_growbg, "txt_growbefore")
    self.txt_growafter  = TFDirector:getChildByPath(img_growbg, "txt_growafter")
    self.img_jiantou    = TFDirector:getChildByPath(img_growbg, "img_jiantou")
    self.txt_cost 	    = TFDirector:getChildByPath(ui, "txt_growbefore")
	--
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
	--
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
    self.Panel_tupobg = TFDirector:getChildByPath(ui, "Panel_tupobg")
    self.currStarList = {}
    self.nextStarList = {}
    self.Panel_star = TFDirector:getChildByPath(self.Panel_tupobg, "Panel_star")
    for i=1,5 do
        local starbg    = TFDirector:getChildByPath(self.Panel_star, "img_starbg" .. i)
        local img_star  = TFDirector:getChildByPath(starbg, "img_star")
        img_star:setVisible(false)
        self.currStarList[i] = {}
        self.currStarList[i].starbg   = starbg
        self.currStarList[i].img_star = img_star
        --
        local starbg1    = TFDirector:getChildByPath(self.Panel_star, "img_starbg" .. (i + 5))
        local img_star1  = TFDirector:getChildByPath(starbg1, "img_star")
        img_star:setVisible(false)
        self.nextStarList[i] = {}
        self.nextStarList[i].starbg   = starbg1
        self.nextStarList[i].img_star = img_star1
    end
    --
    local img_growbg = TFDirector:getChildByPath(self.Panel_tupobg, "img_growbg")
    self.img_attr = TFDirector:getChildByPath(self.Panel_tupobg, "img_attr")
   
    --
    self.team_attr = {}
    for i = 1, 5 do
        local child = TFDirector:getChildByPath(self.img_attr, "txt_" .. i)
        if (child) then
            child:setVisible(false)
			self.team_attr[i] = {}	
            self.team_attr[i].txt 			= child
            self.team_attr[i].txt_curr 		= TFDirector:getChildByPath(child, "txt_number")
            local  img_jiantou = TFDirector:getChildByPath(self.img_attr, "img_jiantou"..i) 
            self.team_attr[i].img_jiantou 	= img_jiantou
            self.team_attr[i].txt_next      = TFDirector:getChildByPath(img_jiantou, "txt_next") 
        end
    end
    self.btn_tupo = TFDirector:getChildByPath(self.Panel_tupobg, "btn_tupo")
    self.Panel_tupobg:setVisible(true)
    --
    self.Panel_shengpinbg = TFDirector:getChildByPath(ui, "Panel_shengpinbg")
    self.currQuality = TFDirector:getChildByPath(self.Panel_shengpinbg, "icon_left")
    self.nextQuality = TFDirector:getChildByPath(self.Panel_shengpinbg, "icon_right")
    self.btn_shengpin = TFDirector:getChildByPath(self.Panel_shengpinbg, "btn_shengpin")
    --
    self.skillList = {}
    for i=1,3 do
    	local btn_skill_ 		= TFDirector:getChildByPath(self.Panel_shengpinbg, "btn_skill_"..i)
        btn_skill_.icon_skill   = TFDirector:getChildByPath(btn_skill_, "icon_skill")
    	btn_skill_.img_newskill = TFDirector:getChildByPath(btn_skill_, "img_newskill")
    	self.skillList[i] 		= btn_skill_
    end
    self.txt_skillDec = TFDirector:getChildByPath(self.Panel_shengpinbg, "txt_jnsm")
    --
    -- self.btn_newSkill               = TFDirector:getChildByPath(self.Panel_shengpinbg, "btn_skill_3")
    -- self.btn_newSkill.icon_skill    = TFDirector:getChildByPath(btn_newSkill, "icon_skill")

    self.Panel_shengpinbg:setVisible(true)
    --
    self.Panel_cailiao = TFDirector:getChildByPath(ui, "Panel_cailiao")
    self.costLayer = {}
    for i=1,3 do
    	local btn_tool 		= TFDirector:getChildByPath(self.Panel_cailiao, "btn_tool"..i)
    	btn_tool.txt_num1 	= TFDirector:getChildByPath(btn_tool, "txt_num1")
    	btn_tool.txt_num2 	= TFDirector:getChildByPath(btn_tool, "txt_num2")
    	btn_tool.img_tool 	= TFDirector:getChildByPath(btn_tool, "img_tool")
    	btn_tool:setVisible(false)
    	btn_tool.index = i
    	btn_tool.logic = self
    	self.costLayer[i] = btn_tool
    end
end

function EudemonTupoLayer:removeUI()
	self.super.removeUI(self)
end

function EudemonTupoLayer:crearBlockUI()
    local blockUI = TFPanel:create();
    blockUI:setSize(GameConfig.WS);
    blockUI:setTouchEnabled(true);
    Public:currentScene():addChild(blockUI, 999)
    return blockUI
end

function EudemonTupoLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function EudemonTupoLayer:refreshUI()
	if (self.eudemonInfo == nil) then
    	print("**ERROR***************EudemonTupoLayer:refreshUI()**********************")
    	return
    end
   
	self:refreshLeftEudemonInfo()
	--
    local currdata = EudemonManager:getBattlePetQualityData(self.eudemonInfo:getQuality(), self.eudemonInfo:getEudemonTypeId(), self.eudemonInfo:getStarLevel())
    local nextdata = nil
    local numList = string.split(currdata.base_growth, ",")
    local fightNum_1 = tonumber(numList[1])
	local fightNum_2 = tonumber(numList[2]) or 1
    local starLevel = self.eudemonInfo:getStarLevel()
    local quality   = self.eudemonInfo:getQuality()
    self.Panel_cailiao:setVisible(true)
    self.txt_growafter:setVisible(true)
    self.img_jiantou:setVisible(true)
    self.txt_cost:setVisible(true)
    if (starLevel == EudemonManager.MAX_STAR_LEVEL and quality == EudemonManager.MAX_QUALITY) then
        self.Panel_cailiao:setVisible(false)
        self.btn_tupo:setVisible(true)
        self.txt_growafter:setVisible(false)
        self.img_jiantou:setVisible(false)
        self.Panel_shengpinbg:setVisible(false)
        self.txt_cost:setVisible(false)
        self.btn_tupo:setVisible(false)
        self.Panel_tupobg:setVisible(true)
        self:refreshRightTupoEudemonInfo()
    elseif (self.eudemonInfo:getStarLevel() == EudemonManager.MAX_STAR_LEVEL) then
    	self.Panel_tupobg:setVisible(false)
    	self.Panel_shengpinbg:setVisible(true)
    	self:refreshRightQualityEudemonInfo()
        self:refreshCost(2)
        nextdata = EudemonManager:getBattlePetQualityData(self.eudemonInfo:getQuality() + 1, self.eudemonInfo:getEudemonTypeId(), 0)
    else
        self.btn_tupo:setVisible(true)
    	self.Panel_tupobg:setVisible(true)
    	self.Panel_shengpinbg:setVisible(false)
    	self:refreshRightTupoEudemonInfo()
        self:refreshCost(1)
        nextdata = EudemonManager:getBattlePetQualityData(self.eudemonInfo:getQuality(), self.eudemonInfo:getEudemonTypeId(), self.eudemonInfo:getStarLevel() + 1)
    end
    local fightNum_3 = 1
    local fightNum_4 = 1
    if (nextdata) then
        local numList2 = string.split(nextdata.base_growth, ",")
        fightNum_3 = tonumber(numList2[1])
        fightNum_4 = tonumber(numList2[2]) or 1
        self.txt_skillDec:setText(nextdata.skillDec)
    else

    end
    fightNum_1 = (fightNum_1 - 1) * 100
    fightNum_2 = (fightNum_2 - 1) * 100
    fightNum_3 = (fightNum_3 - 1) * 100
    fightNum_4 = (fightNum_4 - 1) * 100
    local str1 = localizable.Eudemon_attr1
    local str2 = localizable.Eudemon_attr1
    if (fightNum_2 <= 0) then
        str1 = localizable.Eudemon_attr2
    end
    if (fightNum_4 <= 0) then
        str2 = localizable.Eudemon_attr2
    end
    self.txt_growbefore:setText(stringUtils.format(str1, fightNum_1, fightNum_2))
    self.txt_growafter:setText(stringUtils.format(str2, fightNum_3, fightNum_4))
    self.img_levelbg:setTexture("ui_new/role/bg-n"..self.eudemonInfo:getQuality()..".png")
end
--
function EudemonTupoLayer:refreshCost(upType)
    local quality_1   = self.eudemonInfo:getQuality()
    local starLevel_1 = self.eudemonInfo:getStarLevel()
    if (starLevel_1 == EudemonManager.MAX_STAR_LEVEL) then
        starLevel_1   = 0
        quality_1     = quality_1 + 1
    end
    local costData  = EudemonManager:getBattlePetQualityData(quality_1, self.eudemonInfo:getEudemonTypeId(), starLevel_1)
    local str       = costData.star_consumes
    if (upType == 2) then
        str = costData.quality_consumes
    end
    local costList = string.split(str, "|")
    local count = 0
    for i,data in ipairs(costList) do
        if (data and data ~= "") then
            local info          = string.split(data, "_")
            local itemTypeId    = tonumber(info[1])
            local itemId        = tonumber(info[2])
            local itemNum       = tonumber(info[3])
            local btn           = self.costLayer[i]
            if (btn) then
                count = count + 1
                btn:setVisible(true)
                btn.itemId          = itemId
                btn.itemTypeId      = itemTypeId
                btn:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
                local item = ItemData:objectByID(itemId)
                if (item) then
                    btn.img_tool:setTexture(item:GetPath())
                    btn:setTextureNormal(GetColorIconByQuality(item.quality))
                end
                local num = BagManager:getItemNumById( itemId )
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
    count = count + 1
    for i=count,#self.costLayer do
        local btn           = self.costLayer[i]
        if (btn) then
            btn:setVisible(false)
        end
    end
end
--
function EudemonTupoLayer:refreshFightAttrText()
    local totalAttr = self.eudemonInfo:getFightAttribute(self.fightType)
    print(self.fightType, ",", self.eudemonInfo:getName(), " -----,", totalAttr.attribute)
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
--左边
function EudemonTupoLayer:refreshLeftEudemonInfo()
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
    --
 	self.img_pet:setVisible(true)
 	self.txt_eudemonName:setVisible(true)
 	self.img_fight:setVisible(self.eudemonInfo:isHelpFight())
    --
    self:refreshFightAttrText()
end

--升品
function EudemonTupoLayer:refreshRightQualityEudemonInfo()
 	--
 	local quality = self.eudemonInfo:getQuality()
    self.currQuality:setTexture(EudemonManager.img_quality[quality])
    if (EudemonManager.img_quality[quality + 1]) then
        self.nextQuality:setTexture(EudemonManager.img_quality[quality + 1])
    end
    --self.skillList
    local skillList = self.eudemonInfo:getSkillList()
    local battleData = EudemonManager:getBattlePetQualityData(quality + 1, self.eudemonInfo:getEudemonTypeId(), self.eudemonInfo:getStarLevel())
    local newSkillList = {}
    local count = 0
    local oldSkileNum = #skillList
    local newSkileNum = 0
    if (battleData) then
        newSkillList = string.split(battleData.effect_id, ",")
        newSkileNum = #newSkillList
        for i,skillId in ipairs(newSkillList) do
            skillId = tonumber(skillId)
            local btn_skill = self.skillList[i]
            if (btn_skill) then
                count = count + 1
                btn_skill:setVisible(true)
                btn_skill.skillId   = skillId
                btn_skill.logic     = self
                btn_skill:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowSkillClickHandle),1)
                local isNew = false
                if (newSkileNum > oldSkileNum) then
                    --当下一品质的技能数量大于当前品质且当前没有下一级其中的一个技能时才为新技能
                    for k=1,oldSkileNum do
                        if (skillId == tonumber(skillList[k])) then
                            break
                        elseif (k == oldSkileNum) then
                            isNew = true
                        end
                    end
                end
                btn_skill.img_newskill:setVisible(isNew)
                local skillInfo = SkillBaseData:objectByID(skillId)
                if (skillInfo) then
                    btn_skill.icon_skill:setTexture(skillInfo:GetPath())
                end
            end
        end
    end
    count = count + 1
    for i=count,#self.skillList do
        local btn_skill = self.skillList[i]
        if (btn_skill) then
            btn_skill:setVisible(false)
        end
    end
end

--突破
function EudemonTupoLayer:refreshRightTupoEudemonInfo()
 	--
    local starLevel   = self.eudemonInfo:getStarLevel()
 	local quality     = self.eudemonInfo:getQuality()
    for i=1,5 do 
        local star = self.currStarList[i]
        if (star.img_star) then
            star.img_star:setVisible(i <= starLevel)
        end
        local nextStar = self.nextStarList[i]
        if (nextStar.img_star) then
            nextStar.img_star:setVisible(i <= (starLevel + 1))
        end
    end
    --
 	local totalAttr = self.eudemonInfo:getTeamAttribute()
    local count = 0
    local attrList  = EudemonManager:getEudemonTeamAttr(quality, self.eudemonInfo:getEudemonTypeId(), starLevel + 1)
    local XunhuatotalAttr = self.eudemonInfo:getXunYanAttribute()
    for attrId,attrValue in pairs(XunhuatotalAttr.attribute) do
        if attrList[attrId] then
            attrList[attrId] = attrList[attrId] + attrValue
        end
        if attrId > 17 then
            attrList[attrId - 17] = attrList[attrId - 17] or 0
            attrList[attrId - 17] = attrList[attrId - 17] *(1 + attrValue/10000)
        end
    end
    for attrId,attrValue in pairs(totalAttr.attribute) do
        count = count + 1
        local attr = self.team_attr[count]
        if (attr) then
            attr.txt:setText(localizable.Eudemon_add_attr..AttributeTypeStr[attrId])
            attr.txt_curr:setText(covertToDisplayValue(attrId, attrValue, true))
            attr.txt:setVisible(true)
            if (starLevel == EudemonManager.MAX_STAR_LEVEL and quality == EudemonManager.MAX_QUALITY) then
                attr.txt_next:setVisible(false)
                attr.img_jiantou:setVisible(false)
            else
                if (attrList[attrId]) then
                    attr.txt_next:setText(math.ceil(covertToDisplayValue(attrId, attrList[attrId], true)))
                    attr.txt_next:setVisible(true)
                    attr.img_jiantou:setVisible(true)
                end
            end
            
        else
            print("*ERROR*********EudemonTupoLayer:refreshRightTupoEudemonInfo***************attrId*",attrId, " attrValue ",attrValue)
        end
    end
end

--
function EudemonTupoLayer.onShowSkillClickHandle(sender)
    local self = sender.logic;
    EudemonManager:openSkillInfo(sender.skillId)
end

--
function EudemonTupoLayer.onShowItemClickHandle(sender)
    local self = sender.logic;
    Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId)
end

function EudemonTupoLayer:registerEvents()
	self.super.registerEvents(self)
	self.btn_tupo.logic         = self
	self.btn_shengpin.logic     = self
    self.btn_tupo.upType        = 2
    self.btn_shengpin.upType    = 1
   	self.btn_tupo:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTupoClickHandle), 1)
   	self.btn_shengpin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTupoClickHandle), 1)
    --
    self.receiveInfo1 = function(event)
        local eudemonId = self.eudemonId--self.eudemonInfo:getId()
        self.eudemonInfo = EudemonManager:getEudemonById(eudemonId)
        --self:refreshUI()
        local blockUI = self:crearBlockUI()
        if (event.data[1][1] == 1) then
            self:playtTopoEffct(blockUI)
        else
            self:playtQualityUpEffct3(blockUI)
        end
        
    end
    TFDirector:addMEGlobalListener(EudemonManager.upStarTupo, self.receiveInfo1)
end

function EudemonTupoLayer.onTupoClickHandle( sender )
    local self = sender.logic;

    local quality_1   = self.eudemonInfo:getQuality()
    local starLevel_1 = self.eudemonInfo:getStarLevel()
    if (starLevel_1 == EudemonManager.MAX_STAR_LEVEL) then
        starLevel_1   = 0
        quality_1     = quality_1 + 1
    end
    local costData = EudemonManager:getBattlePetQualityData(quality_1, self.eudemonInfo:getEudemonTypeId(), starLevel_1)
    local str = costData.star_consumes
    if (sender.upType == 1) then
        str = costData.quality_consumes
    end
    local costList = string.split(str, "|")
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
                    if ResGetWayManager:openResGetLayer(itemId,EnumDropType.GOODS) == true then
                        return
                    end
                    toastMessage(localizable.Eudemon_item)
                    return
                end
                print("**ERROR************EudemonTupoLayer.onTupoClickHandle************  ",sender.upType," ,",itemId )
                break
            end
        end
    end

    EudemonManager:sendEudemonUpStar(sender.upType, self.eudemonInfo:getId())
end
--
function EudemonTupoLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(EudemonManager.upStarTupo, self.receiveInfo1)
    self.receiveInfo1 = nil

end


function EudemonTupoLayer:playtTopoEffct(blockUI)
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/pet_star_lv_up_3.xml")
    local effect = TFArmature:create("pet_star_lv_up_3_anim")
    if effect == nil then
        return
    end
    effect:setZOrder(100)
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)
    local starLevel = self.eudemonInfo:getStarLevel()
    if (starLevel <= 0) then
       return
    end
    
    if (self.currStarList[starLevel]) then
        local starbg     = self.currStarList[starLevel].starbg
        local img_star   = self.currStarList[starLevel].img_star
        local pos       = img_star:getPosition()
        local size      = img_star:getSize()
        effect:setPosition(ccp(pos.x + size.width / 2,pos.y + size.height / 2))
        starbg:addChild(effect)
        effect:addMEListener(TFARMATURE_COMPLETE,
        function()
            if (effect) then
                effect:removeFromParent()
                effect = nil
                self:refreshUI()
                self:playEffectEudemonUpStar(self.img_leftbg)
                self:playtTopoTeamEffct2(blockUI)
            end
        end)
    end
end
--
function EudemonTupoLayer:playtTopoTeamEffct2(blockUI)

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equipment_refining.xml")
    local effect = TFArmature:create("equipment_refining_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    self.img_attr:addChild(effect)
    local size      = self.img_attr:getSize()
    effect:setPosition(ccp(size.width / 2 - 50,size.height / 2))
    effect:setZOrder(10)
    effect:playByIndex(0, -1, -1, 0)
    effect:addMEListener(TFARMATURE_COMPLETE,
        function()
            if (effect) then
                effect:removeFromParent()
                effect = nil
                if (blockUI) then
                    blockUI:removeFromParent()
                    blockUI = nil
                end
            end
        end)
end
--ÉýÆ·
function EudemonTupoLayer:playtQualityUpEffct3(blockUI)
    local size = blockUI:getSize()
    blockUI:setTouchEnabled(true)
    blockUI:setBackGroundColorType(TF_LAYOUT_COLOR_SOLID);
    blockUI:setBackGroundColorOpacity(200);
    blockUI:setBackGroundColor(ccc3(  0,   0,   0));
    --
    local BattleData        = BattlePetData:objectByID(self.eudemonInfo:getEudemonTypeId())
    local eudemonQuality    = self.eudemonInfo:getQuality() - 1
    local itemIdList        = string.split(BattleData.icon, ",")
    local reward            = ItemData:objectByID(tonumber(itemIdList[eudemonQuality]))
    local itemData          = {quality = reward.quality, itemid = reward.id, type = reward.type,name = reward.name,path = reward:GetPath(), number = 0}
    local reward_item       = Public:createIconNumNode(itemData);
    local bg_icon           = TFDirector:getChildByPath(reward_item, 'bg_icon');
    bg_icon:setTouchEnabled(false)
    reward_item:setPosition(ccp(size.width / 2, size.height / 2))
    reward_item:setAnchorPoint(ccp(0.5, 0.5))
    blockUI:addChild(reward_item, 98)
    --
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/eudemon_up_quality.xml")
    local effect = TFArmature:create("eudemon_up_quality_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(size.width / 2, size.height / 2))
    blockUI:addChild(effect, 99)
    effect:playByIndex(0, -1, -1, 0)
    effect:addMEListener(TFARMATURE_COMPLETE,
        function()
            if (effect) then
                TFDirector:addTimer(700, 1, nil, function() 
                                                        self:effectComplete(blockUI, effect, reward_item)
                                                    end)
            end
        end)
    local temp = 0
    effect:addMEListener(TFARMATURE_UPDATE,function()
        temp = temp + 1
        if temp == 32 then
            itemData.quality = itemData.quality + 1
            local reward = ItemData:objectByID(tonumber(itemIdList[itemData.quality]))
            if (reward) then
                itemData.path = reward:GetPath()
            end
            Public:loadIconNode(reward_item, itemData)
            --
            local buttom_effect = self:addEffect(blockUI, "qualityUp_icon_buttom",97)
            local up_effect = self:addEffect(blockUI, "qualityUp_icon_up",87)
            buttom_effect:playByIndex(0, -1, -1, 1)
            up_effect:playByIndex(0, -1, -1, 1)
        end
    end)
end
function EudemonTupoLayer:effectComplete(blockUI, effect, reward_item)
    blockUI:addMEListener(TFWIDGET_CLICK, audioClickfun(
        function()
            blockUI:removeMEListener(TFWIDGET_CLICK)
           
            effect:removeFromParent()
            effect = nil
            if (reward_item) then
                reward_item:removeFromParent()
                reward_item = nil
            end
            toastMessage(localizable.Eudemon_tips_3)
            self:refreshUI()
            if (blockUI) then
                blockUI:removeFromParent()
                blockUI = nil
            end
        end))
end
function EudemonTupoLayer:addEffect(node, effect_name ,zorder)
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/"..effect_name..".xml")
    local effect = TFArmature:create(effect_name.."_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setZOrder(zorder)
    local size = node:getSize()
    effect:setPosition(ccp(size.width / 2, size.height / 2))
    node:addChild(effect )
    return effect
end
function EudemonTupoLayer:playEffectEudemonUpStar(node)
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/role_transfe_level_up.xml")
    local effect = TFArmature:create("role_transfe_level_up_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    local size = node:getSize()
    effect:setPosition(ccp(size.width / 2, size.height / 2 + 100))
    node:addChild(effect, 99)
    effect:playByIndex(0, -1, -1, 0)
   -- return effect
end
return EudemonTupoLayer