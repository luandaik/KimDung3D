-- client side EudemonPanelLayer.lua
--[[
 * @Description: 宠物驯驭界面
 ]]

local EudemonXunyuLayer = class("EudemonXunyuLayer", BaseLayer)
EudemonXunyuLayer.skillnum = 4

function EudemonXunyuLayer:ctor()
	self.super.ctor(self)
	self:init("lua.uiconfig_mango_new.pet.PetXunYu")
end
function EudemonXunyuLayer:setEudemonData(eudemonId, fightType)
    self.eudemonId = eudemonId
    self.fightType = fightType
    self.eudemonInfo = EudemonManager:getEudemonById(eudemonId)
    self.oldarr = {}
    for i = 1,4 do
        self.oldarr[i] = math.ceil(self.eudemonInfo:getXunYuAttribute().attribute[i + 11] or 0)
    end
end
function EudemonXunyuLayer:initUI( ui )
    self.super.initUI(self, ui)

	self.img_pet              = TFDirector:getChildByPath(ui,"img_pet")
    self.img_fight             = TFDirector:getChildByPath(ui, "img_zhan")
    self.txt_eudemonName       = TFDirector:getChildByPath(ui, "txt_eudemonName")
    self.icon_level            = TFDirector:getChildByPath(ui, "icon_level")
    self.btn_help              = TFDirector:getChildByPath(ui, "btn_bangzu")

    self.img_pet:setVisible(false)
    self.img_fight:setVisible(false)
    self.txt_eudemonName:setVisible(false)

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
 
    --材料按钮
    self.costLayer = {}
    for i=1, 3 do
        local btn_tool      = TFDirector:getChildByPath(ui, "btn_tool"..i)
        btn_tool.txt_num1   = TFDirector:getChildByPath(btn_tool, "txt_num1")
        btn_tool.txt_num2   = TFDirector:getChildByPath(btn_tool, "txt_num2")
        btn_tool.img_tool   = TFDirector:getChildByPath(btn_tool, "img_tool")
        btn_tool:setVisible(false)
        btn_tool.index = i
        btn_tool.logic = self
        self.costLayer[i] = btn_tool
    end
    self.bqPath     = {"ui_new/pet/img_xq1.png", "ui_new/pet/img_xq2.png", "ui_new/pet/img_xq3.png", "ui_new/pet/img_xq4.png"}
    self.SkillPath  = {"ui_new/pet/img_skill1.png", "ui_new/pet/img_skill2.png", "ui_new/pet/img_skill3.png", "ui_new/pet/img_skill4.png"}

    self.Studyskill = {}
    self.panel_skill = TFDirector:getChildByPath(ui, "panel_skill")
    -- self.panel_skill:setVisible(false)
     -- 可学习的技能
    for i = 1, EudemonXunyuLayer.skillnum do
        local skill             = TFDirector:getChildByPath(self.panel_skill, "panel_skill"..i)
        skill.img_xuanzhong     = TFDirector:getChildByPath(skill, "img_xuanzhong")
        skill.img_skill         = TFDirector:getChildByPath(skill, "img_skill")
        skill.img_skill:setTexture(self.SkillPath[i])
        skill.txt_name          = TFDirector:getChildByPath(skill, "txt_name")
        skill.txt_name:setText(localizable.Eudemon_XunYu[i])
        skill:setTouchEnabled(true)
        skill.index = i
        --skilltype == 属性类型 - 11
        if i == 1 then
            skill.skilltype = 3
        elseif i == 2 then
            skill.skilltype = 4
        elseif i == 3 then
            skill.skilltype = 1
        elseif i == 4 then
            skill.skilltype = 2
        end 
        skill.logic = self
        self.Studyskill[i] = skill
    end
    --最上面的选择的孔位
    self.kong = {}
    self.panel_kong = TFDirector:getChildByPath(ui, "panel_kong")
    for i = 1, EudemonXunyuLayer.skillnum do
        local kong             = TFDirector:getChildByPath(self.panel_kong, "btn_kong"..i)
        kong.btn_jia           = TFDirector:getChildByPath(kong, "btn_jia")
        kong.img_skill         = TFDirector:getChildByPath(kong, "img_skill")
        kong.img_skill:setVisible(false)
        kong.index = i
        kong.btn_jia.logic = self
        kong.btn_jia.index = i
        kong.logic = self
        self.kong[i] = kong
    end
    --选择后跳出的选择框
    
    self.panel_xuanze = TFDirector:getChildByPath(ui, "panel_xuanze")
    self.img_xuanze1 = TFDirector:getChildByPath(ui, "img_xuanze1")
    self.xuanzeskill = {}
    for i = 1, EudemonXunyuLayer.skillnum do
        local skill                     = TFDirector:getChildByPath(self.img_xuanze1, "panel_skill"..i)
        skill.btn_skill1                = TFDirector:getChildByPath(skill, "btn_skill1")
        skill.btn_skill1:setVisible(true)
        skill.img_skill                 = TFDirector:getChildByPath(skill, "img_skill")
        skill.txt_name                  = TFDirector:getChildByPath(skill, "txt_name")
        skill.txt_name_Copy1            = TFDirector:getChildByPath(skill, "txt_name-Copy1")
        if i == 1 then
            skill.btn_skill1.skilltype = 14
        elseif i == 2 then
            skill.btn_skill1.skilltype = 15
        elseif i == 3 then
            skill.btn_skill1.skilltype = 12
        elseif i == 4 then
            skill.btn_skill1.skilltype = 13
        end
        skill.btn_skill1.index = i
        skill.btn_skill1.logic = self
        self.xuanzeskill[i] = skill
    end
    self.panel_xuanze:setVisible(false)
    --等级属性显示
    self.img_intensify_lv                       = TFDirector:getChildByPath(ui, "img_intensify_lv")
    self.img_intensify_lv.img_to                = TFDirector:getChildByPath(self.img_intensify_lv, "img_to")
    self.img_intensify_lv.txt_current_lv        = TFDirector:getChildByPath(self.img_intensify_lv, "txt_current_lv")
    self.img_intensify_lv.txt_next_lv           = TFDirector:getChildByPath(self.img_intensify_lv, "txt_next_lv")
    self.img_intensify_lv.txt_numLv_effect      = TFDirector:getChildByPath(self.img_intensify_lv, "txt_numLv_effect")
    self.img_intensify_lv.txt_level             = TFDirector:getChildByPath(self.img_intensify_lv, "txt_level")
    self.img_intensify_lv.txt_name              = TFDirector:getChildByPath(self.img_intensify_lv, "txt_name")

    --左边属性显示
    self.img_shuxing = {}
    for i = 1,4 do
        local shuxing                     = TFDirector:getChildByPath(ui, "img_shuxingbg"..i)
        shuxing.txt_number                = TFDirector:getChildByPath(shuxing, "txt_number")
        self.img_shuxing[i] = shuxing
    end
    self.btn_xunhua = TFDirector:getChildByPath(ui, "btn_xunhua")
    self.btn_xunhua.logic = self
    --选择技能选中哪一个
    self.index = 1
    self.xuanzetype = false
    --特效类型
    self.studyskilleffect = false
    self.equipskilleffect = false
    
    -- 学习技能选中哪一个
    self.xuanzeindex= self.Studyskill[1].skilltype
    self.xuanzeskillType = 1
end

function EudemonXunyuLayer.onHoleClickHandle(sender)
    local self = sender.logic
    for i = 1,EudemonXunyuLayer.skillnum do
        local level = self.eudemonInfo:getXunYuLevelValue(self.xuanzeskill[i].btn_skill1.skilltype - 11)
        self.xuanzeskill[i].img_skill:setTexture(self.SkillPath[i])
        self.xuanzeskill[i].txt_name_Copy1:setText("Lv"..level)
    end
    if self.index ~= sender.index then
        self.panel_xuanze:setVisible(true)
        self.img_xuanze1:setTexture(self.bqPath[sender.index])
        self.xuanzetype = true
        self.index = sender.index
        return
    end

    if self.xuanzetype == false then
        self.panel_xuanze:setVisible(true)
        self.img_xuanze1:setTexture(self.bqPath[sender.index])
        self.xuanzetype = true
        return
    end  
    self.xuanzetype = false 
    self.panel_xuanze:setVisible(false)
end
function EudemonXunyuLayer.onSkillHoleClickHandle(sender)
    local self = sender.logic
    for i = 1, EudemonXunyuLayer.skillnum do
         self.Studyskill[i].img_xuanzhong:setVisible(false)
    end
    self.xuanzeindex = sender.skilltype
    self.xuanzeskillType = sender.index
    sender.img_xuanzhong:setVisible(true)
    self:refreshShuxing()
    self:refreshConsume()

end
function EudemonXunyuLayer.sendEquipmentskillClickHandle(sender)
    local self = sender.logic
    self.xuanzetype = false 
    self.panel_xuanze:setVisible(false)
    self.equipskilleffect = true
    EudemonManager:sendEquipmentEudemonskill(self.eudemonInfo.instanceId,self.index,sender.skilltype)
    
end
function EudemonXunyuLayer.sendupgradeskillClickHandle(sender)
    local self = sender.logic
    self.studyskilleffect = true
    EudemonManager:sendupgradeskill(self.eudemonInfo.instanceId,self.xuanzeindex + 11)
    
end

function EudemonXunyuLayer:refreshShuxing()
    local level = self.eudemonInfo:getXunYuLevelValue(self.xuanzeindex)
    local attr = BattlePetTameData:GetPetXunYuAttributebyIdxAndLevel(self.xuanzeindex,level)

    self.img_intensify_lv.txt_current_lv:setText(math.ceil(attr[self.xuanzeindex + 11]))
    self.img_intensify_lv.txt_name:setText(localizable.AttributeTypeStr[self.xuanzeindex + 11]) 
    self.img_intensify_lv.txt_level:setText("Lv"..level)
    attr = BattlePetTameData:GetPetXunYuAttributebyIdxAndLevel(self.xuanzeindex,level + 1)
    self.img_intensify_lv.txt_next_lv:setVisible(false)
    self.img_intensify_lv.img_to:setVisible(false)

    if attr ~= nil then
        self.img_intensify_lv.txt_next_lv:setText(math.ceil(attr[self.xuanzeindex + 11]))
        self.img_intensify_lv.img_to:setVisible(true)
        self.img_intensify_lv.txt_next_lv:setVisible(true)
    end
   
    self.img_intensify_lv.txt_numLv_effect:setVisible(false)
end
function EudemonXunyuLayer:refreshConsume()
    local level = self.eudemonInfo:getXunYuLevelValue(self.xuanzeindex)
    local Consumelist = BattlePetTameData:GetPetXunYuConsumeByIndexAndLevel(self.xuanzeindex,level)
    local maxLevel = ConstantData:objectByID("BattlepettameLV").value or 60
    print("xunyu =================",level , maxLevel)
    if (level < maxLevel) then
        self.btn_xunhua:setGrayEnabled(false)
        self.btn_xunhua:setTouchEnabled(true)
    else
        self.btn_xunhua:setGrayEnabled(true)
        self.btn_xunhua:setTouchEnabled(false)
    end
    
    for i = 1,3 do 
        self.costLayer[i]:setVisible(false)
        local btn           = self.costLayer[i]
        if Consumelist.m_list[i] and next(Consumelist.m_list[i]) ~= nil then
            btn:setVisible(true)
            btn.itemId          = Consumelist.m_list[i].itemId
            btn.itemTypeId      = Consumelist.m_list[i].type
            btn:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
            if Consumelist.m_list[i].type == EnumDropType.GOODS then 
                local item = ItemData:objectByID(Consumelist.m_list[i].itemId)
                if (item) then
                    local iconStr = item:GetPath()
                    btn.img_tool:setTexture(iconStr)
                    btn:setTextureNormal(GetColorIconByQuality(item.quality))
                end
                
                local num = BagManager:getItemNumById(Consumelist.m_list[i].itemId)
                btn.txt_num1:setText(num.."/")
                btn.txt_num2:setText(Consumelist.m_list[i].number)
            end
            
        end
    end
end
function EudemonXunyuLayer:refreshEudemonSkill()
    for i = 1, EudemonXunyuLayer.skillnum do
        self.kong[i].img_skill:setVisible(false)
        local num = tonumber(self.eudemonInfo.XunyuOrder[i])
        if num and num ~= 0 then
            self.kong[i].img_skill:setVisible(true)
            num  = num - 11
            -- 1 == 14 2==15 3==12 4==13
            if num == 1 then
                self.kong[i].img_skill:setTexture(self.SkillPath[3])
            elseif num == 2 then
                self.kong[i].img_skill:setTexture(self.SkillPath[4])
            elseif num == 3 then
                self.kong[i].img_skill:setTexture(self.SkillPath[1])
            elseif num == 4 then
                self.kong[i].img_skill:setTexture(self.SkillPath[2])
            end
            
        end 
    end
end
function EudemonXunyuLayer:refreshLeftShuxing()

    for i = 1, 4 do
        if i == 1 then
            self.img_shuxing[i].txt_number:setText(localizable.AttributeTypeStr[14]..":  "..math.ceil((self.eudemonInfo:getXunYuAttribute().attribute[14] or 0)))
        elseif i == 2 then
            self.img_shuxing[i].txt_number:setText(localizable.AttributeTypeStr[15]..":  "..math.ceil((self.eudemonInfo:getXunYuAttribute().attribute[15] or 0)))
        elseif i == 3 then
            self.img_shuxing[i].txt_number:setText(localizable.AttributeTypeStr[12]..":  "..math.ceil((self.eudemonInfo:getXunYuAttribute().attribute[12] or 0)))
        elseif i == 4 then
            self.img_shuxing[i].txt_number:setText(localizable.AttributeTypeStr[13]..":  "..math.ceil((self.eudemonInfo:getXunYuAttribute().attribute[13] or 0)))
        end
    end
end

--帮助面板
function EudemonXunyuLayer:OnRuleClick( sender )
    CommonManager:showRuleLyaer('zhanchongxunyu')
end
function EudemonXunyuLayer:removeUI()
	self.super.removeUI(self)
end

function EudemonXunyuLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function EudemonXunyuLayer:refreshUI()
	if (self.eudemonInfo == nil) then
    	print("**ERROR***************EudemonXunyuLayer:refreshUI()**********************")
    	return
    end
    self:refreshLeftEudemonInfo()
    self:refreshShuxing()
    self:refreshConsume()
    self:refreshEudemonSkill()
    self:refreshLeftShuxing()

end
function EudemonXunyuLayer:refreshLeftEudemonInfo()
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

    self.img_pet:setVisible(true)
    self.txt_eudemonName:setVisible(true)
    self.img_fight:setVisible(self.eudemonInfo:isHelpFight())  
    self.img_levelbg:setTexture("ui_new/role/bg-n"..self.eudemonInfo:getQuality()..".png")

end

function EudemonXunyuLayer:registerEvents()
	self.super.registerEvents(self)
    --帮助按钮
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.OnRuleClick,self)))
    
    self.btn_xunhua:addMEListener(TFWIDGET_CLICK, audioClickfun(self.sendupgradeskillClickHandle),1)
    --孔位按钮事件
    for i=1,4 do
        self.kong[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHoleClickHandle),1)
        self.kong[i].btn_jia:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHoleClickHandle),1)
    end
    for i=1,4 do
        self.Studyskill[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onSkillHoleClickHandle),1)
    end
    for i=1,4 do
        self.xuanzeskill[i].btn_skill1:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.sendEquipmentskillClickHandle),1)
    end
    self.updateEudemonXunYu = function(event)
        self.eudemonInfo = EudemonManager:getEudemonById(self.eudemonId)
        self:refreshUI()
        if self.studyskilleffect == true then
            self.studyskilleffect = false
            self:PlayStudyskillEffect(self.xuanzeskillType)
            self:ShuXingEffect()
        end
        if self.equipskilleffect == true then
            self.equipskilleffect = false
            self:PlayKongPosEffect(self.index)
            self:arrChange(self.oldarr)
        end
    end
    TFDirector:addMEGlobalListener(EudemonManager.EudemonXunYu, self.updateEudemonXunYu)


end
function EudemonXunyuLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(EudemonManager.EudemonXunYu, self.updateEudemonXunYu)
    self.updateEudemonXunYu = nil

    if self.toastLabelList then
        for k,v in pairs(self.toastLabelList) do
            v:removeFromParent()
            v = nil
        end
        self.toastLabelList = nil
    end

    if self.toastTimeId ~= nil then
        TFDirector:removeTimer(self.toastTimeId);
        self.toastTimeId = nil
    end
end
function EudemonXunyuLayer.onShowItemClickHandle(sender)
    local self = sender.logic;
    if sender.itemId == nil then
        Public:ShowItemTipLayer(nil, sender.itemTypeId)
    else
        Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId,XinFaManager:getIdenticalXinFaStuffNum(sender.itemId,self.gmId))
    end
end
function EudemonXunyuLayer:ShuXingEffect()
    if not self.shuaguang_effect_lv then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
        local effect = TFArmature:create("equipIntensify_3_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)

        local img_intensify_lv = self.img_intensify_lv
        effect:setPosition(ccp(75, -60))
        img_intensify_lv:addChild(effect)
        self.shuaguang_effect_lv = effect
    end
    self.shuaguang_effect_lv:playByIndex(0, -1, -1, 0)
end
function EudemonXunyuLayer:PlayKongPosEffect(pos)
    self.kongeffect = self.kongeffect or nil
    if not self.kongeffect then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/assistOpen.xml")
        local effect = TFArmature:create("assistOpen_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:setScale(0.7)
        self.kongeffect = effect
        local img_intensify_lv = self.kong[1]
        img_intensify_lv:addChild(self.kongeffect)
    end
    local pos = self.kong[pos]:getPosition()

    self.kongeffect:setPosition(ccp(pos.x - 100 , pos.y-55))
    self.kongeffect:playByIndex(0, -1, -1, 0)
end
function EudemonXunyuLayer:PlayStudyskillEffect(pos)
    self.skilleffect = self.skilleffect or nil
    if not self.skilleffect then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/equiIntensify.xml")
        local effect = TFArmature:create("equiIntensify_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:setZOrder(1)
        self.skilleffect = effect
        local img_intensify_lv = self.Studyskill[4]
        img_intensify_lv:addChild(self.skilleffect)
    end
    local pos1 = self.Studyskill[pos]:getPosition()
    self.skilleffect:setPosition(ccp(pos1.x-85 , pos1.y-10))
    self.skilleffect:playByIndex(0, -1, -1, 0)
end
function EudemonXunyuLayer:arrChange(oldarr)
    local newarr = {}
    for i = 1,4 do
         newarr[i] = math.ceil(self.eudemonInfo:getXunYuAttribute().attribute[i + 11])
    end
    local changeArrTemp = {}
    local changeLength = 0;
    for i=1,4 do
        -- print(">>>>>>>>>>>>>>>",newarr[i], oldarr[i])
        local offset = newarr[i] - oldarr[i];
        if offset ~= 0 then
            changeLength = changeLength + 1;
            changeArrTemp[changeLength] = {i,offset};

        end
    end

    local changeArr = {}

    local index = 0;
    for i=1,#changeArrTemp do
        local offsetTb = changeArrTemp[i];
        if offsetTb[2] > 0 then
            index = index + 1;
            changeArr[index] = offsetTb;
        end
    end

    for i=1,#changeArrTemp do
        local offsetTb = changeArrTemp[i];
        if offsetTb[2] < 0 then
            index = index + 1;
            changeArr[index] = offsetTb;
        end
    end


    local index = 1;
    function addToast()
        if #changeArr < 1 then
            return;
        end

        local offsetTb = changeArr[index];

        -- print("offset:",AttributeTypeStr[offsetTb[1]],offsetTb[2])


        local label = TFLabelBMFont:create();
        label:setPosition(ccp(150,100));
        self:addChild(label,10);

        self.toastLabelList = self.toastLabelList or {}
        self.toastLabelList[offsetTb[1]] = label
        if offsetTb[2] > 0 then
            label:setFntFile("font/num_100.fnt")
            -- label:setColor(ccc3(  0, 255,   0));
            label:setText(AttributeTypeStr[offsetTb[1]+11] .. "+" .. covertToDisplayValue(offsetTb[1],offsetTb[2]));
        end

        if offsetTb[2] < 0 then
            label:setFntFile("font/num_99.fnt")
            -- label:setColor(ccc3(255,   0,   0));
            label:setText(AttributeTypeStr[offsetTb[1]+11] .. covertToDisplayValue(offsetTb[1],offsetTb[2]));
        end
        -- local toY = label:getPosition().y + (changeLength - index + 2) * 40;
        local toY = label:getPosition().y + 167;
        local toX = label:getPosition().x;
        
        label:setScale(0.5)
        label:setOpacity(0.1);
        local toastTween = {
              target = label,
              {
                duration = 7/24,
                x = toX,
                y = toY,
                scale = 1,
                alpha = 1,
              },
              {
                duration = 17/24,
                x = toX,
                y = toY+114,
                alpha = 0,
                onComplete = function() 
                    if self.toastLabelList then
                        self.toastLabelList[offsetTb[1]] = nil
                    end
                    label:removeFromParent();
               end
              }
            }
 
        TFDirector:toTween(toastTween);
        index = index + 1;
    end

    function addToastCom()
        TFDirector:removeTimer(self.toastTimeId);
        self.toastTimeId = nil;
    end

    addToast();

    if self.toastTimeId ~= nil then
        TFDirector:removeTimer(self.toastTimeId);
        self.toastTimeId = nil
    end
    if  changeLength > 1 then
        self.toastTimeId = TFDirector:addTimer(334, changeLength -1, addToastCom, addToast);
    end
    self.oldarr = newarr
end
return EudemonXunyuLayer