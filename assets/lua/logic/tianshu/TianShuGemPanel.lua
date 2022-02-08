-- client side TianShuGemPanel.lua
--[[
 * @Description: 天书宝石界面
 ]]
-- script writer wuqi
-- creation time 2016-07-02

local TianShuGemPanel = class("TianShuGemPanel", BaseLayer)

function TianShuGemPanel:ctor(index)
    self.super.ctor(self)
    self.selectPos = index or 1
    self:init("lua.uiconfig_mango_new.tianshu.TianShuGemPanel")
end

function TianShuGemPanel:initUI(ui)
    self.super.initUI(self,ui)

    --装备图标信息区
    self.img_quality        = TFDirector:getChildByPath(ui, 'img_quality')
    self.img_icon           = TFDirector:getChildByPath(ui, 'img_icon')
    self.txt_name           = TFDirector:getChildByPath(ui, 'txt_name')
    self.lbl_power          = TFDirector:getChildByPath(ui, 'lbl_power')
    self.txt_power          = TFDirector:getChildByPath(ui, 'txt_power')

    self.txt_chong = TFDirector:getChildByPath(ui, "txt_chong")

    self.bg                 = TFDirector:getChildByPath(ui, 'bg')
    
    --提示性控件
    self.img_improve        = TFDirector:getChildByPath(ui, 'img_improve')
    self.img_equiped        = TFDirector:getChildByPath(ui, 'img_equiped')
    self.txt_equiped_name   = TFDirector:getChildByPath(ui, 'txt_equiped_name')
    
    --星级，目前设定为屏蔽不显示
    self.panel_star         = TFDirector:getChildByPath(ui, 'panel_star')
    --self.panel_star:setVisible(false)
    self.img_star = {}
    for i=1,SkyBookManager.kMaxStarLevel do
        local str           = "img_star_"..i
       self.img_star[i]     = TFDirector:getChildByPath(ui, str)
    end

    --装备属性详情
    self.panel_details      = TFDirector:getChildByPath(ui, "panel_details")

    --宝石
    self.img_gem = {}
    self.img_gemLock = {}
    self.txt_gem_name = {}
    self.txt_attr_gem = {}
    self.imgGemNode = {}
    self.txt_attr_gem_val = {}
    self.icon_xuanzhong = {}
    for i=1,SkyBookManager.kGemMergeTargetNum do
        local imgGemNode = TFDirector:getChildByPath(ui, 'img_background'..i)
        self.imgGemNode[i] = TFDirector:getChildByPath(ui, 'img_background'..i)
        self.img_gem[i]            = TFDirector:getChildByPath(imgGemNode, 'img_gem')
        self.img_gemLock[i]          = TFDirector:getChildByPath(imgGemNode, 'icon_suo')
        local gemNameNode = TFDirector:getChildByPath(ui, "txt_gem_name"..i)      
        self.txt_gem_name[i]       = TFDirector:getChildByPath(ui, "txt_gem_name"..i)        
        self.txt_attr_gem[i]                   = TFDirector:getChildByPath(gemNameNode, "txt_attr_gem"..i)
        self.txt_attr_gem_val[i]               = TFDirector:getChildByPath(gemNameNode, "txt_attr_gem_val"..i)

        self.imgGemNode[i].logic      = self
        self.imgGemNode[i]:setTouchEnabled(true)

        self.icon_xuanzhong[i] = TFDirector:getChildByPath(imgGemNode, "icon_xuanzhong")
    end
    --总战斗力
    self.txt_power_details = TFDirector:getChildByPath(ui, "txt_power_details")

    self.txt_tips = TFDirector:getChildByPath(ui, "txt_tips")
    self.txt_bible_name = TFDirector:getChildByPath(self.panel_details, "txt_name")
end

function TianShuGemPanel:removeUI()
    self.super.removeUI(self)
end

function TianShuGemPanel:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function TianShuGemPanel:setLogic( layer )
    self.logic = layer
end

function TianShuGemPanel:setEquipGmId(gmId)
    self.gmId   = gmId  
    local equip = SkyBookManager:getItemByInstanceId(self.gmId)
    if equip and equip:getTotalGemNum() <= 1 then
        self.selectPos = 1
    end  
    self:refreshUI()
end

function TianShuGemPanel:dispose()
    self.super.dispose(self)
end
    
--刷新显示方法
function TianShuGemPanel:refreshUI()
    self:refreshIcon()
    self:refreshDetails()
end

--刷新图标区信息
function TianShuGemPanel:refreshIcon()
    local equip = SkyBookManager:getItemByInstanceId(self.gmId)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end

    self.img_icon:setTexture(equip:GetTextrue())
    self.img_quality:setTexture(GetColorIconByQuality(equip.quality))
    self.txt_name:setText(equip.name)

    --字符D为图片+
    self.txt_power:setText("D"..equip:getpower())

    --self.txt_intensify_lv:setText("+"..equip.level)
    self.txt_chong:setText(stringUtils.format(localizable.common_index_chong,EnumSkyBookLevelType[equip.level] ))

    --装备于谁
    if equip.equip ~= nil and equip.equip ~= 0 then 
        local role = CardRoleManager:getRoleById(equip.equip)
        if role then
            self.txt_equiped_name:setVisible(true)
            self.img_equiped:setVisible(true)
            -- self.txt_equiped_name:setText(role.name)
            if role.isMainPlayer then
                self.txt_equiped_name:setText(MainPlayer.verticalName)
            else
                self.txt_equiped_name:setText(role.name)
            end
        else
            self.img_equiped:setVisible(false)
        end
    else
        self.img_equiped:setVisible(false)
    end

    if equip.level < MainPlayer:getLevel() * 3 then
        self.img_improve:setVisible(false)
    else
        self.img_improve:setVisible(false)
    end

    local star = equip:getTupoLevel()
    local texture1 = "ui_new/equipment/tjp_xingxing_icon.png"
	local texture2 = "ui_new/equipment/tjp_xingxing2_icon.png"
	if star <= 5 then
		for i = 1, 5 do
			if i <= star then
				self.img_star[i]:setTexture(texture1)
				self.img_star[i]:setVisible(true)
			else
				self.img_star[i]:setVisible(false)
			end
		end
	else
		local delta = star - 5
		for i = 1, 5 do
			self.img_star[i]:setVisible(true)
			if i <= delta then
				self.img_star[i]:setTexture(texture2)
			else
				self.img_star[i]:setTexture(texture1)
			end
		end
	end

    for i=1,SkyBookManager.kGemMergeTargetNum do
        local item = ItemData:objectByID(equip:getGemPos(i))
        if item then
            self.img_gem[i]:setTexture(item:GetPath())
            self.img_gem[i]:setVisible(true)
        else
            self.img_gem[i]:setVisible(false)
        end
    end
    self.img_gemLock[1]:setVisible(true)
    self.img_gemLock[2]:setVisible(true)
    if equip:isGemOpen() then
        self.img_gemLock[1]:setVisible(false)
    end
    if equip:getSecondGemOpen() then
        self.img_gemLock[2]:setVisible(false)
    end

    for i=1,SkyBookManager.kGemMergeTargetNum do
        if self.selectPos == i then
            self.icon_xuanzhong[i]:setVisible(true)
        else
            self.icon_xuanzhong[i]:setVisible(false)
        end
    end

    local item = BibleGemData:getItemByStarAndQuality(equip.tupoLevel, equip.quality)
    self.txt_tips:setText(item:getNextDesc())
    local temp = ItemData:objectByID(equip.id)
    self.txt_bible_name:setText(temp.name)
    self:refreshGemDescShow()
end

function TianShuGemPanel:refreshGemDescShow()
    if self.selectPos and self.selectPos == 2 then
        self.txt_tips:setVisible(false)
    else
        self.txt_tips:setVisible(true)
    end
end

--刷新详细信息
function TianShuGemPanel:refreshDetails()
    local equip = SkyBookManager:getItemByInstanceId(self.gmId)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end

    for i=1,SkyBookManager.kGemMergeTargetNum do
        local item = ItemData:objectByID(equip:getGemPos(i))
        if item then
            self.txt_gem_name[i]:setVisible(true)           
            local gem = GemData:objectByID(equip:getGemPos(i))
            if gem then
                self.txt_gem_name[i]:setText(item.name)
               if gem.attribute and gem.attribute ~= "" then 
                    local attributekind , attributenum = gem:getAttribute()
                    self.txt_attr_gem[i]:setText(AttributeTypeStr[attributekind])
                    self.txt_attr_gem_val[i]:setText("+ " .. covertToDisplayValue(attributekind,attributenum,true))
                elseif gem.immune and gem.immune ~= "" then
                    local attr_index,attr_num = gem:getExtraAttribute(gem.immune)
                    self.txt_attr_gem_val[i]:setString("+ " .. covertToDisplayValue(attr_index,attr_num,true))
                    self.txt_attr_gem[i]:setString(SkillBuffHurtStr[attr_index])  
                elseif gem.effect_extra and gem.effect_extra ~= "" then
                    local attr_index,attr_num = gem:getExtraAttribute(gem.effect_extra)
                    self.txt_attr_gem_val[i]:setString("+ " .. covertToDisplayValue(attr_index,attr_num,true))
                    self.txt_attr_gem[i]:setString(SkillBuffHurtStr[attr_index])   
                elseif gem.be_effect_extra and gem.be_effect_extra ~= "" then
                    local attr_index,attr_num = gem:getExtraAttribute(gem.be_effect_extra)
                    self.txt_attr_gem_val[i]:setString("+ " .. covertToDisplayValue(attr_index,attr_num,true))
                    self.txt_attr_gem[i]:setString(BeEffectExtraStr[attr_index])       
                end
            else
                self.txt_gem_name[i]:setVisible(false)                
            end
        else
            self.txt_gem_name[i]:setVisible(false)            
        end
    end

    --总战斗力
    self.txt_power_details:setText(equip:getpower())
end

function TianShuGemPanel.unGemMosaicBtnClickHandle(btn)
    local self = btn.logic
    local idx = btn.idx    
    print('unGemMosaicBtnClickHandle = ',idx)

    local equip = SkyBookManager:getItemByInstanceId(self.gmId)
    if equip then
        if idx == 1 then
            if not equip:isGemOpen() then
                toastMessage(localizable.Tianshu_gem_locked)
                return
            end
        end
        if idx == 2 then
            if not equip:getSecondGemOpen() then
                toastMessage(localizable.Tianshu_Chongzhu_Unlock)
                return
            end
        end
    end
    self.selectPos = idx
    for i=1,SkyBookManager.kGemMergeTargetNum do
        if self.selectPos == i then
            self.icon_xuanzhong[i]:setVisible(true)
        else
            self.icon_xuanzhong[i]:setVisible(false)
        end
    end
    self:refreshGemDescShow()
    TFDirector:dispatchGlobalEventWith(SkyBookManager.SELECT_GEM_POS, {self.selectPos})
end

function TianShuGemPanel:registerEvents()
    self.super.registerEvents(self)

    for i = 1, SkyBookManager.kGemMergeTargetNum do
        self.imgGemNode[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.unGemMosaicBtnClickHandle),1)
        self.imgGemNode[i].idx = i
    end
end

function TianShuGemPanel:removeEvents()
    for i=1,SkyBookManager.kGemMergeTargetNum do
        self.imgGemNode[i]:removeMEListener(TFWIDGET_CLICK)
    end
    self.super.removeEvents(self)
end

function TianShuGemPanel:getSelectPos()
    return self.selectPos
end

function TianShuGemPanel:getGemPositionByPos(pos)
    --return self.selectPos
end

return TianShuGemPanel