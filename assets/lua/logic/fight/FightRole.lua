 --
-- Author: Zippo
-- Date: 2013-12-05 17:34:00
--

local mapLayer  = require("lua.logic.fight.MapLayer")
local fightRoleMgr  = require("lua.logic.fight.FightRoleManager")
local fightRoundMgr  = require("lua.logic.fight.FightRoundManager")

local FightRole = class("FightRole")

local EFFECT_ZORDER = 100
local FIGHT_TEXT_ZORDER = 300
	
function FightRole:ctor(roleInfo)
	print("///////////////Begin/////////////////////")
	self.extAnger = 0 			--策划要求额外怒气
	self.triggerPassiveSkillData = {} --被动技能触发次数 按需求加入
	local nPosIndex = roleInfo.posindex
	local bEnemyRole = false
	if nPosIndex >= 9 and nPosIndex < 18 then
		bEnemyRole = true
	elseif nPosIndex == 18 then
		bEnemyRole = false
		self.ispet = true
	elseif nPosIndex == 19 then
		bEnemyRole = true
		self.ispet = true
	end
	self.manualActionNum = 0
	self.attackNum = 0
	self.beHurtNum = 0
	local bNpc = false
	if roleInfo.typeid == 2 then
		bNpc = true
	end
	self.haveXianTianGong = 0
	local roleTableData = nil
	self.soundRoleId = roleInfo.roleId

	self.role_angerMax = 100
	if self.ispet then
		roleTableData = BattlePetData:objectByID(roleInfo.roleId)
		self.role_angerMax = 0
	else
		if bNpc then
			--40 风云录
			if FightManager.fightBeginInfo.fighttype == EnumFightType.FYRecord then
				roleTableData = FYRecordData:objectByID(roleInfo.roleId)
			else
				roleTableData = NPCData:objectByID(roleInfo.roleId)
			end
			
			self.soundRoleId         = roleTableData.role_id
			self.role_angerMax       = roleTableData.maxAnger or 100
			self.normalAttackSkillID = roleTableData.normal_attack or 0
			if self.normalAttackSkillID == 0 then
				local _roleTableData = RoleData:objectByID(roleTableData.role_id)
				if _roleTableData then
					self.normalAttackSkillID = _roleTableData.normal_attack or 0
				end
			end
		else
			roleTableData = RoleData:objectByID(roleInfo.roleId)
			self.role_angerMax = roleTableData.maxAnger or 100
			self.normalAttackSkillID = roleTableData.normal_attack or 0
		end
	end

	if roleTableData == nil then
		print("role configure not found : ",roleInfo.typeid,roleInfo.roleId)
	end

	self.directional_sensitivity = false
	if roleTableData.directional_sensitivity and roleTableData.directional_sensitivity == 1 then
		self.directional_sensitivity = true
	end

	local armatureID = 10040
	if self.ispet then
		self.quality = roleInfo.maxhp
		armatureID = roleTableData:getIcon(self.quality)
	else
		armatureID = roleTableData.image
		self.quality             = roleTableData.quality
	end

	local resPath = "armature/"..armatureID..".xml"
	if TFFileUtil:existFile(resPath) then
		TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
	else
		print(resPath.."not find")
		if bEnemyRole then
			armatureID = 10040
		else
			armatureID = 10006
		end
		TFResourceHelper:instance():addArmatureFromJsonFile("armature/"..armatureID..".xml")
	end

	-- print("load armature : armature/"..armatureID..".xml")

	local armature = TFArmature:create(armatureID.."_anim")
	if armature == nil then
		assert(false, "armature"..armatureID.."create error")
		return
	end

	if bEnemyRole then
		GameResourceManager:addEnemy( roleInfo.roleId , armature )
	else
		GameResourceManager:addRole( roleInfo.roleId , armature )
	end

	self.armatureID = armatureID
	self.old_armature = armature
	self.armature = armature
	self.armature:setPosition(ccp(0,0))

	self.rolePanel = TFPanel:create()
	self.rolePanel:setSize(self.armature:getContentSize())
	self.rolePanel:addChild(self.armature)

	self.originPos = mapLayer.GetPosByIndex(nPosIndex,roleInfo.roleId)

	self:setPosition(self.originPos)
	self.animSpeed = FightManager.fightSpeed
	armature:setAnimationFps(FightManager.fightSpeed * GameConfig.ANIM_FPS)

	-- self.armatureTime = os.clock()
	-- self.badTime = 0
	-- self.m_nCurFrame = 0
	-- self.isAbnormal = false  -- 是否cd有异常 
	-- armature:addMEListener(TFARMATURE_UPDATE, function(test1,test2,frame)
	-- 		local temp = frame - self.m_nCurFrame
	-- 		if self.m_nCurFrame ~= 0 and temp > 0 then
	-- 			local temp_time = os.clock() - self.armatureTime
	-- 			-- temp_time = temp_time * 10
	-- 			-- print("temp_time = ",temp_time)
	-- 			if temp_time > temp*1/(self.animSpeed*GameConfig.ANIM_FPS/2) then
	-- 				self.badTime = self.badTime + 1
	-- 			else
	-- 				self.badTime = 0
	-- 			end
	-- 			if self.badTime >= 3 then
	-- 				self.isAbnormal = true;
	-- 				-- CommonManager:showFightPluginErrorLayer()
	-- 				-- TFDirector:pause()
	-- 				-- toastMessage("使用非法外挂")
	-- 				-- AlertManager:changeSceneForce(SceneType.LOGIN)
	-- 			end
	-- 		end
	-- 		self.m_nCurFrame = frame
	-- 		self.armatureTime = os.clock()
	-- 	end)
	if bEnemyRole then
		armature:setRotationY(180)
	end

	self.role_anger = roleInfo.anger or 0
	

	self.logicInfo = roleInfo
	self.logicInfo.bEnemyRole = bEnemyRole
	self.currHp = roleInfo.maxhp
	roleInfo.beginHp = roleInfo.maxhp
	self.maxhp = self.logicInfo.attr[1]

	print("------阵位  "..nPosIndex)
	self.immuneAttribute = {}
	if self.logicInfo.immune ~= nil then
		self.immuneAttribute = GetAttrByString(self.logicInfo.immune)
		print("------immune: ",self.logicInfo.immune)
	end
	self.effectExtraAttribute = {}
	if self.logicInfo.effectActive ~= nil then
		self.effectExtraAttribute = GetAttrByString(self.logicInfo.effectActive)
		print("------effectActive: ",self.logicInfo.effectActive)
	end
	self.beEffectExtraAttribute = {}
	if self.logicInfo.effectPassive ~= nil then
		self.beEffectExtraAttribute = GetAttrByString(self.logicInfo.effectPassive)
		print("------effectPassive: ",self.logicInfo.effectPassive)
	end

	if self.ispet then
		self.iconPath = roleTableData:getIconPath(self.quality)
		self.headPath = "icon/head/"..roleTableData:getIcon(self.quality)..".png"
	else
		self.headPath = "icon/head/"..roleTableData.image..".png"
	end
	self.skillID = roleInfo.spellId
	self.skillCD = 0

	self.passiveSkill = roleInfo.passiveskill or {}
	self.angerSkillCD = 0
	self.angerSkillMaxCD = 0
	print("------passiveSkill end =",self.passiveSkill )
	self.haveAttack = false
	self.buffList = TFArray:new()
	self.bodyEffectList = {}
	self.bufferIconList = {}
	self.specialSkillAnger = -1
	self.nConsumptionSkillRelease = 0
	self.immuneAttr = {}
	self.bossEffectList 	= {}
	if self.role_angerMax and self.role_angerMax > 0 then 
		local specialSkill = self:getUseSelfAngerSkill()
		-- print("specialSkill == >",specialSkill)
		if specialSkill  then
			self.specialSkillAnger = specialSkill.trigger_anger
			self.angerSkillMaxCD = specialSkill.cool_time
		else
			self.role_angerMax = 0
		end
	end
	-- self.normalAttackSkillID = roleTableData.normal_attack or 0
	if self.logicInfo.name == nil then
		self.logicInfo.name = roleTableData.name or ""
		if (self.ispet) then
			self.logicInfo.name = roleTableData.describ or ""
		end
	end
	print(self.logicInfo.name .."属性: ",displayAttributeString(self.logicInfo.attr))

	self.profession = 1
	self.sex = 1
	if not self.ispet then
		if bNpc then
			local npcInfo = RoleData:objectByID(roleTableData.role_id)
			if npcInfo ~= nil then
				self.sex = npcInfo.sex
				self.profession = npcInfo.outline
			end
		else
			self.sex = roleTableData.sex
			self.profession = roleTableData.outline
		end
	end

	self:UpdateZOrder()
	self:PlayStandAnim()

	self:CreateHpLabel()
	self:CreateShadowImg()
	self:CreateHalo()
	if roleInfo.isboss and roleInfo.isboss == true then
		self:AddBossEffect("fight_boss")
	end

	self:initExtAnger()

	self.removeList = TFArray:new()

	if self.ispet then
		self.rolePanel:setVisible(false)
	end
	self.lastHurtHp				= 0	--上次所受伤害
	---
	if (self.angerSkillMaxCD > 0) then
		local addTime = self:getEffectExtraAttrNum(EnumFightAttributeType.Xinfa_effect, EnumXinFaSpecialType.XinFaSpecialType_SillCD)
		addTime = self.angerSkillMaxCD - math.floor(self.angerSkillMaxCD * addTime / 10000)
		if (addTime > 0) then
			self.angerSkillMaxCD = addTime
		end
	end
	print("///////////////END/////////////////////")
end

--不等于0时为召唤物
function FightRole:GetSummoned()
	return self.summoned or 0
end
function FightRole:IsSummoned()
	return (self:GetSummoned() ~= 0)
end

function FightRole:addManualActionNum()
	self.manualActionNum = self.manualActionNum + 1
end

function FightRole:addAttackNum()
	self.attackNum = self.attackNum + 1
end

function FightRole:addBeHurtNum()
	self.beHurtNum = self.beHurtNum + 1
end
function FightRole:initExtAnger()
	if FightManager.fightBeginInfo.fighttype == 16 and self.logicInfo.bEnemyRole == false then
		local climbOptionList = NorthClimbManager:getNowFloorOption()
		for i=1,#climbOptionList do
			local battleInfo = BattleLimitedData:objectByID(climbOptionList[i])
			if battleInfo.type == 4 then
				self.extAnger = self.extAnger + battleInfo.value
			end
		end
	end
	
	if self.logicInfo.bEnemyRole == false and FightManager.fightBeginInfo.fighttype == 31 or FightManager.fightBeginInfo.fighttype == 32 then
		--浪人武士
		local knightLimitIds = {}
		if (FightManager.fightBeginInfo.fighttype == 32) then
			local info = KnightManager:getFightKnightInfo()
			knightLimitIds = KnightManager:getKnightLimitIds(info.knightType, info.level)
		else
			knightLimitIds = KnightManager:getKnightLimitIds()
		end
		for i,limitId in pairs(knightLimitIds) do
			local battleInfo = BattleLimitedData:objectByID(tonumber(limitId))
 			if battleInfo and battleInfo.type == 4 then
				self.extAnger = self.extAnger + battleInfo.value
			end
		end
	end
end
function FightRole:dispose()
	TFDirector:killAllTween(self.rolePanel)
end


function FightRole:setScale( scale )
	self.rolePanel:setScale(scale)
end
function FightRole:CreateShadowImg()
	local shadowImg = TFImage:create("ui_new/fight/shadow.png")
	shadowImg:setZOrder(-1001)
	shadowImg:setAnchorPoint(ccp(0.5, 0.5))
	self.shadowImg = shadowImg
	self.rolePanel:addChild(shadowImg)
end

--
function FightRole:changeHpLabel()
	local hp = 4
	if (self.currHp > self.maxhp) then
		local a     = self.currHp / self.maxhp * 100
		local hp    = math.ceil( a / 34 ) 
		if (hp < 4) then
			hp = 4
		elseif(hp > 8) then
			hp = 8
		end
		if self.logicInfo.bEnemyRole then
			self.hpLabel:setTexture("ui_new/fight/enemyblood_"..hp..".png")
		else
			self.hpLabel:setTexture("ui_new/fight/blood_"..hp..".png")
		end
	else
		if self.logicInfo.bEnemyRole then
			self.hpLabel:setTexture("ui_new/fight/enemyblood.png")
		else
			self.hpLabel:setTexture("ui_new/fight/blood.png")
		end
	end
end	

--
function FightRole:SetRoleVisible(isVisible)
	if (self.hpBackground) then
		self.hpBackground:setVisible(isVisible)
	end
	if (self.armature) then
		self.armature:setVisible(isVisible)
	end
end

--
function FightRole:CreateHpLabel()
	if FightManager.fightBeginInfo.bSkillShowFight or self.ispet then
		return
	end

	local hpLabel = TFLoadingBar:create()
	if self.logicInfo.bEnemyRole then
		if self.logicInfo.isboss and self.logicInfo.isboss == true then
			hpLabel:setTexture("ui_new/fight/enemybloodboss.png")
		else
			hpLabel:setTexture("ui_new/fight/enemyblood.png")
		end
	else
		hpLabel:setTexture("ui_new/fight/blood.png")
	end
	hpLabel:setPosition(ccp(0, 0))
	hpLabel:setPercent(self.currHp/self.maxhp*100)
	self.hpLabel = hpLabel

	local hpBackground = TFImage:create()
	if self.logicInfo.isboss and self.logicInfo.isboss == true then
		hpBackground:setTexture("ui_new/fight/bloodboss_bg.png")
	else
		hpBackground:setTexture("ui_new/fight/blood_bg.png")
	end
	hpBackground:setZOrder(100)
	hpBackground:addChild(hpLabel)
	self.hpBackground = hpBackground

	hpBackground:setPosition(ccp(0,180))

	if self.role_angerMax ~= 0 then
		local angerLabel = TFLoadingBar:create()
		angerLabel:setTexture("ui_new/fight/bar_shayitiao.png")
		angerLabel:setPosition(ccp(7, 0))
		angerLabel:setPercent(self.role_anger/self.role_angerMax*100)
		self.angerLabel = angerLabel
		local angerBackground = TFImage:create()
		angerBackground:setTexture("ui_new/fight/bg_shayitiao.png")
		angerBackground:setZOrder(100)
		angerBackground:addChild(angerLabel)
		self.angerBackground = angerBackground
		angerBackground:setPosition(ccp(-10,172))
		self.rolePanel:addChild(angerBackground)
	end

	local professionImg = TFImage:create("ui_new/fight/zhiye_"..self.profession..".png")
	if professionImg ~= nil then
		professionImg:setPosition(ccp(-55, 7))
		hpBackground:addChild(professionImg)
	end

	self.rolePanel:addChild(hpBackground)
	if self.ispet then
		hpBackground:setVisible(false)
	end
end

function FightRole:SetHpBarVisible(bVisible)
	if self.ispet and bVisible then
		return
	end
	if self.hpBackground ~= nil then
		self.hpBackground:setVisible(bVisible)
	end
	if self.angerBackground ~= nil then
		self.angerBackground:setVisible(bVisible)
	end

	self.shadowImg:setVisible(bVisible)
end

function FightRole:CreateHalo()
	-- self.haloAttr = {}
	self.haloImmuneAttr        = {}
	self.haloEffectExtraAttr   = {}
	self.haloBeEffectExtraAttr = {}
	self.haloTypeList          = {}
	self.haloSkillEffectList   = {}
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		-- local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil then
			local skillType = skillInfo.type
			if skillType == 5 or skillType == 6 then
				self:AddBodyEffect(50, true, true)
				local haloAttr = self.haloTypeList[skillType] or {}
				
				-- self.haloType = skillBaseInfo.type
				-- local attrAdd = GetAttrByString(skillInfo.attr_add)
				for i=1,17 do
					haloAttr[i] = haloAttr[i] or 0
					if skillInfo.attr_add[i+17] ~= nil and i <= EnumAttributeType.PoisonResistance then
						haloAttr[i+17] = haloAttr[i+17] or 0
						haloAttr[i+17] =  skillInfo.attr_add[i+17] + haloAttr[i+17]
					end

					if skillInfo.attr_add[i] ~= nil then
						haloAttr[i] = haloAttr[i] + skillInfo.attr_add[i]
					end
				end
				self.haloTypeList[skillType] = haloAttr
				for k,v in pairs(skillInfo.immune) do
					self.haloImmuneAttr[k] = self.haloImmuneAttr[k] or 0
					self.haloImmuneAttr[k] = self.haloImmuneAttr[k] + v
				end
				for k,v in pairs(skillInfo.effect_extra) do
					self.haloEffectExtraAttr[k] = self.haloEffectExtraAttr[k] or 0
					self.haloEffectExtraAttr[k] = self.haloEffectExtraAttr[k] + v
				end
				for k,v in pairs(skillInfo.be_effect_extra) do
					self.haloBeEffectExtraAttr[k] = self.haloBeEffectExtraAttr[k] or 0
					self.haloBeEffectExtraAttr[k] = self.haloBeEffectExtraAttr[k] + v
				end
				local effect = skillInfo.effect
				if (effect == EnumFightSpellEffect.effect_66) then
					--开场减对面恕气
					fightRoleMgr:AddAnger(not self.logicInfo.bEnemyRole, -skillInfo.effect_value)
				end
				if (EnumFightHaloEffect[effect]) then
					self.haloSkillEffectList[effect] = self.passiveSkill[i]
				end
			else
				for k,v in pairs(skillInfo.immune) do
					self.immuneAttr[k] = self.immuneAttr[k] or 0
					self.immuneAttr[k] = self.immuneAttr[k] + v
				end
			end
			if (skillInfo.effect == EnumFightSpellEffect.effect_69) then
				fightRoleMgr.addHpPercentRole[self.logicInfo.bEnemyRole] = fightRoleMgr.addHpPercentRole[self.logicInfo.bEnemyRole] + (skillInfo.effect_value / 100)
			end
		end
	end

	print("self.haloTypeList = " .."属性: ",self.haloTypeList)
	print("self.immuneAttr = " .."属性: ",displayAttributeString(self.immuneAttr))
	print("self.haloImmuneAttr = " .."属性: ",displayAttributeString(self.haloImmuneAttr))
	print("self.haloEffectExtraAttr = " .."属性: ",displayAttributeString(self.haloEffectExtraAttr))
	print("self.haloBeEffectExtraAttr = " .."属性: ",displayAttributeString(self.haloBeEffectExtraAttr))
end

--[[
验证状态是否为异常状态
]]
function FightRole:CalculateBufferTriggerRate(targetRole,levelInfo,baseInfo)
	if levelInfo == nil then
		return
	end
	if not baseInfo then
		baseInfo = FightManager:GetCacheSkillBaseInfo( levelInfo.id)
	end
	local bufferInfo = SkillBufferData:objectByID(levelInfo.buff_id)
	local bufRateSuppress = 0
	if bufferInfo and bufferInfo.good_buff == 0 then
		if FightManager.fightBeginInfo.fighttype == 5 then
			bufRateSuppress = ClimbManager:getBufRateSuppress( self.logicInfo.bEnemyRole,targetRole.logicInfo.bEnemyRole )*100
			-- print("无量山战力压制 buff增加几率 = ",bufRateSuppress)
		elseif FightManager.fightBeginInfo.fighttype == 16 then
			bufRateSuppress = NorthClimbManager:getBufRateSuppress( self.logicInfo.bEnemyRole,targetRole.logicInfo.bEnemyRole )*100
			-- print("无量山战力压制 buff增加几率 = ",bufRateSuppress)
		end
	end

	if baseInfo.buff_rate_addition and baseInfo.buff_rate_addition ~= "" then
		local addition_list = stringToNumberTable(baseInfo.buff_rate_addition,"_")
		if targetRole:GetBuffByType(addition_list[1]) then
			bufRateSuppress = addition_list[2] + bufRateSuppress
			-- print("针对特殊buff加成  = ",bufRateSuppress)
		end
	end

	local formula = baseInfo.buff_formula
	if formula == nil or formula == 0 then
		local result = levelInfo.buff_rate + bufRateSuppress
			-- print(" buff几率 = ",result)
		return result
	else
		--[[
		角色技能：封印技能添加受技能等级影响的命中率计算规则。
		封印技能命中率 = （1-（目标等级- 技能等级）* 0.1） * 基础命中率（表格配置） 
		其中：7≥(目标等级 - 技能等级）≥-20
		命中率：从 30%-100% 之间波动
		]]
		local tmp = (targetRole.logicInfo.level - levelInfo.level)
		tmp = math.min(7,tmp)
		tmp = math.max(-20,tmp)
		local result =(1 -  tmp * 0.1) * levelInfo.buff_rate + bufRateSuppress
			-- print(" buff几率 = ",result)
		return result
	end
end

--[[
验证状态是否为异常状态
]]
function FightRole:CalculateExtraBufferTriggerRate(targetRole,levelInfo,baseInfo)
	if levelInfo == nil then
		return
	end
	if not baseInfo then
		baseInfo = FightManager:GetCacheSkillBaseInfo( levelInfo.id)
	end
	local bufferInfo = SkillBufferData:objectByID(levelInfo.extra_buffid)
	
	local bufRateSuppress = 0
	if bufferInfo and bufferInfo.good_buff == 0 then
		if FightManager.fightBeginInfo.fighttype == 5 then
			bufRateSuppress = ClimbManager:getBufRateSuppress( self.logicInfo.bEnemyRole,targetRole.logicInfo.bEnemyRole )*100
			-- print("无量山战力压制 buff增加几率 = ",bufRateSuppress)
		elseif FightManager.fightBeginInfo.fighttype == 16 then
			bufRateSuppress = NorthClimbManager:getBufRateSuppress( self.logicInfo.bEnemyRole,targetRole.logicInfo.bEnemyRole )*100
			-- print("无量山战力压制 buff增加几率 = ",bufRateSuppress)
		end
	end

	-- if baseInfo.buff_rate_addition and baseInfo.buff_rate_addition ~= "" then
	-- 	local addition_list = stringToNumberTable(baseInfo.buff_rate_addition,"_")
	-- 	if targetRole:GetBuffByType(addition_list[1]) then
	-- 		bufRateSuppress = addition_list[2] + bufRateSuppress
			-- print("针对特殊buff加成  = ",bufRateSuppress)
	-- 	end
	-- end

	local formula = baseInfo.extra_buff_formula
	if formula == nil or formula == 0 then
		local result = levelInfo.extra_buff_rate + bufRateSuppress
			-- print(" buff几率 = ",result)
		return result
	else
		--[[
		角色技能：封印技能添加受技能等级影响的命中率计算规则。
		封印技能命中率 = （1-（目标等级- 技能等级）* 0.1） * 基础命中率（表格配置） 
		其中：7≥(目标等级 - 技能等级）≥-20
		命中率：从 30%-100% 之间波动
		]]
		local tmp = (targetRole.logicInfo.level - levelInfo.level)
		tmp = math.min(7,tmp)
		tmp = math.max(-20,tmp)
		local result =(1 -  tmp * 0.1) * levelInfo.extra_buff_rate + bufRateSuppress
			-- print(" buff几率 = ",result)
		return result
	end
end


function FightRole:GetTriggerExtraBufferID(skillID, targetRole)
	if self:GetBuffByType(10) ~= nil then
		return 0,0
	end
	attackImmune = self:getEffectExtraAttrNum(EnumFightAttributeType.Immune,EnumFightEffectType.FightEffectType_NoMianYi) or 0
	-- if FightManager.fightBeginInfo.bSkillShowFight then
	-- 	return 0 ,0
	-- end
	if skillID.skillId <= 0 then
		return 0,0
	end

	local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillID)
	if skillBaseInfo ~= nil and skillBaseInfo.target_sex == 1 then
		if self.sex == targetRole.sex then
			return 0 ,0
		end
	end

	local skillInfo = SkillLevelData:objectByID(skillID)
	local random = math.random(1, 10000)

	local rate = self:CalculateExtraBufferTriggerRate(targetRole,skillInfo,skillBaseInfo)

	-- print("-----------------------触发额外buff ,random = "..random.." rate = "..rate)
	if skillInfo ~= nil and skillInfo.extra_buffid > 0 and random <= rate then
		-- if targetRole.immuneAttribute then
		local bufferInfo = SkillBufferData:objectByID(skillInfo.extra_buffid)
		local immune = targetRole:getEffectExtraAttrNum(EnumFightAttributeType.Immune,bufferInfo.type) + attackImmune
		if immune ~= nil and immune > 0 then
			local _random = math.random(1, 10000)
			if _random <= immune then
				targetRole:ShowEffectName("mianyi")
				return 0 ,0
			end
		end
		-- end
		return skillInfo.extra_buffid , skillInfo.level
	else
		return 0 ,0
	end
end

function FightRole:getskillInfoByDzxy(buff_id)
	local skillInfo = BaseDataManager:GetSkillBaseInfo(self.skillID)
	if skillInfo ~= nil then
		if skillInfo.buff_id == buff_id then
			return self.skillID
		end
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		if self.passiveSkill[i].skillId ~= 0 then
			local _skillInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
			if _skillInfo.buff_id == buff_id then
				return self.passiveSkill[i]
			end
		end
	end
	return {skillId = 0 , level = 0}
end

function FightRole:GetTriggerBufferID(skillID, targetRole)
	if self:GetBuffByType(10) ~= nil then
		return 0,0
	end
	attackImmune = self:getEffectExtraAttrNum(EnumFightAttributeType.Immune,EnumFightEffectType.FightEffectType_NoMianYi) or 0
	if skillID.skillId > 0 then
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillID)
		if skillBaseInfo ~= nil and skillBaseInfo.target_sex == 1 then
			if self.sex == targetRole.sex then
				return 0 ,0
			end
		end

		local skillInfo = SkillLevelData:objectByID(skillID)
		local random = math.random(1, 10000)
		if FightManager.fightBeginInfo and FightManager.fightBeginInfo.bSkillShowFight then
			random = 0
		end

		local rate = self:CalculateBufferTriggerRate(targetRole,skillInfo,skillBaseInfo)

		if skillInfo ~= nil and skillInfo.buff_id > 0 and random <= rate then
			-- if targetRole.immuneAttribute then
			local bufferInfo = SkillBufferData:objectByID(skillInfo.buff_id)
			local immune = targetRole:getEffectExtraAttrNum(EnumFightAttributeType.Immune,bufferInfo.type) + attackImmune
			if bufferInfo.good_buff == 0 and bufferInfo.no_rebound ~= 3 and immune ~= nil and immune > 0 then
				local _random = math.random(1, 10000)
				if _random <= immune then
					targetRole:ShowEffectName("mianyi")
					return 0 ,0
				end
			end
			-- end
			return skillInfo.buff_id , skillInfo.level
		else
			return 0 ,0
		end
	else
		if self:isCanNotTriggerBeiDong() then  --不触发被动buff
			return 0,0
		end
		local passiveSkillNum = #self.passiveSkill
		for i=1,passiveSkillNum do
			if self.passiveSkill[i].skillId ~= 0 then
				local bValidTarget = true
				local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
				if skillBaseInfo.hidden_skill == 1 or skillBaseInfo.hidden_skill == 2 or skillBaseInfo.hidden_skill == 3 then
					bValidTarget = false
				end
				if skillBaseInfo.effect == 23 then
					bValidTarget = false
				end
				if skillBaseInfo.effect == 25 then
					bValidTarget = false
				end
				if skillBaseInfo ~= nil and skillBaseInfo.target_sex == 1 then
					if self.sex == targetRole.sex then
						bValidTarget = false
					end
				end

				if bValidTarget then
					local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
					local random = math.random(1, 10000)
					local rate = self:CalculateBufferTriggerRate(targetRole,skillInfo,skillBaseInfo)
					-- print("使用技能 "..skillBaseInfo.name.."触发buff  id == "..skillInfo.buff_id)
					-- print("random ==  "..random.." ,rate == "..rate)
					if skillInfo ~= nil and skillInfo.buff_id > 0 and random <= rate then
						-- if targetRole.immuneAttribute then
						local bufferInfo = SkillBufferData:objectByID(skillInfo.buff_id)
						local immune = targetRole:getEffectExtraAttrNum(EnumFightAttributeType.Immune,bufferInfo.type) + attackImmune
						-- print("targetRole.immuneAttribute[bufferInfo.type] = ",bufferInfo.type,immune)
						if bufferInfo.good_buff == 0 and immune ~= nil and immune > 0 then
							local _random = math.random(1, 10000)
							if _random <= immune then
								targetRole:ShowEffectName("mianyi")
								return 0 ,0
							end
						end
						-- end
						return skillInfo.buff_id ,skillInfo.level
					end
				end
			end
		end
		return 0 ,0
	end
end

--是否触发被动效果：反弹5 反击6 化解7 复活9 免疫12 移魂13
function FightRole:TriggerPassiveEffect(passiveEffect, effectValue , immune)
	immune = immune or 0
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end
	if passiveEffect == 5 then
		local fantanBuff = self:GetBuffByType(19)
		if fantanBuff ~= nil then
			effectValue.value = fantanBuff.config.value
			return true
		end
	
	elseif passiveEffect == 6 then
		-- if self:GetBuffByType(10) ~= nil then
		-- 	return false
		-- end
		if FightManager:GetCurrAction() ~= nil and FightManager:GetCurrAction().actionInfo.bBackAttack then
			return false
		end
	end

	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		if skillInfo ~= nil and skillInfo.type == 7 and skillInfo.effect == passiveEffect then
			local random = math.random(1, 10000)

			if (passiveEffect == EnumFightSpellEffect.effect_85) then
				local triggerHp = math.floor(self.maxhp * skillInfo.effect_rate / 10000)
				if (self.currHp >= triggerHp) then
					if effectValue ~= nil then
						effectValue.value = math.floor(self.maxhp * skillInfo.effect_value / 100)
					end
					return true
				end
			elseif random <= skillInfo.effect_rate + immune then
				if effectValue ~= nil then
					effectValue.value = skillInfo.effect_value
				end

				local bTrigger = true
				if skillInfo.trigger_hp > 0 and self.currHp/self.maxhp > skillInfo.trigger_hp/100 then
					bTrigger = false
				else
					if passiveEffect == 13 then
						effectValue.value = skillInfo.attr_add
					end
				end

				if bTrigger then
					return true
				end
			end
		end
	end

	return false
end


--是否触发被动效果：反弹5 反击6 化解7 复活9 免疫12 移魂13
function FightRole:TriggerBeHitPassiveEffect(passiveEffect, effectValue)
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end

	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 and skillBaseInfo.effect == passiveEffect then
			local random = self.beHurtNum
			if random >= skillInfo.effect_rate then
				if effectValue ~= nil then
					effectValue.value = skillInfo.effect_value
					effectValue.skillId = self.passiveSkill[i]
				end
				-- self.beHurtNum = 0
				return true
			end
		end
	end

	return false
end

function FightRole:TrigerHurtMianyiEffect( passiveEffect, effectValue )
	if (EnumFightSpellEffect.effect_37 == passiveEffect) then
		if self:isCanNotTriggerBeiDong() then  --不触发被动buff
			return false
		end
	end
	
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil  then
			if  skillBaseInfo.effect == passiveEffect then
				self.specialSkillTime = self.specialSkillTime or 0
				self._specialSkillTime = self._specialSkillTime or 0
				if self.specialSkillTime + self._specialSkillTime >= skillInfo.special_num then
					return false
				end
				-- self.specialSkillTime = self.specialSkillTime + 1
				effectValue.value = self.logicInfo.posindex
				effectValue.buff_id = skillInfo.buff_id
				effectValue.level = skillInfo.level
				return true
			elseif skillInfo.trigger_hurtType == 7 then
				local tempSkill = {skillId = skillInfo.triggerSkill ,level = self.passiveSkill[i].level}
				local _skillInfo = SkillLevelData:objectByID(tempSkill)
				local _skillBaseInfo = BaseDataManager:GetSkillBaseInfo(tempSkill)
				if  _skillInfo and _skillBaseInfo and _skillBaseInfo.effect == passiveEffect then
					self.specialSkillTime = self.specialSkillTime or 0
					self._specialSkillTime = self._specialSkillTime or 0
					if self.specialSkillTime + self._specialSkillTime >= skillInfo.special_num then
						return false
					end
					-- self.specialSkillTime = self.specialSkillTime + 1
					effectValue.value = self.logicInfo.posindex
					effectValue.level = _skillInfo.level
					effectValue.buff_id = _skillInfo.buff_id
					return true
				end
			end
		end
	end
	return false
end

function FightRole:TrigerHurtMianyiSkill( passiveEffect, effectValue )
	if (self:IsSummoned()) then
		return false
	end
	if ((EnumFightPassiveEffectType.effect_37 == passiveEffect or EnumFightPassiveEffectType.effect_82 == passiveEffect)) then
		return false
	end
	
	local liveList = fightRoleMgr:GetAllLiveRole(self.logicInfo.bEnemyRole)
	-- local liveNum = liveList:length()
	local sortfunc = function( role1,role2 )
		return role1:GetAttrNum(EnumAttributeType.Agility) > role2:GetAttrNum(EnumAttributeType.Agility)
	end
	liveList:sort(sortfunc)
	-- for i=1,liveNum do
	-- 	local role = liveList:objectAt(i)
	for role in liveList:iterator() do
		if role and role:IsAlive() and role:TrigerHurtMianyiEffect(passiveEffect , effectValue) then
			effectValue.targetRole = role
			return true
		end
	end
	return false
end

function FightRole:getTrigerHurtMianyiEffectSkillId( passiveEffect )
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil  then
			if  skillBaseInfo.effect == passiveEffect then
				return skillInfo
			elseif skillInfo.trigger_hurtType == 7 then
				local tempSkill = {skillId = skillInfo.triggerSkill ,level = self.passiveSkill[i].level}
				local _skillInfo = SkillLevelData:objectByID(tempSkill)
				local _skillBaseInfo = BaseDataManager:GetSkillBaseInfo(tempSkill)
				if  _skillInfo and _skillBaseInfo and _skillBaseInfo.effect == passiveEffect then
					return _skillInfo
				end
			end
		end
	end
	return nil
end


function FightRole:TrigerXianTianGongSkill(passiveEffect, effectValue)
	if passiveEffect ~= 25 then
		return false
	end
	if self.haveXianTianGong >= 2 then
		return false
	end
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end
	
	if self:GetBuffByType(56) then
		return false
	end
	
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo and skillBaseInfo and skillBaseInfo.effect == 25 then
			local effect_rate = skillInfo.effect_rate
			if self.haveXianTianGong == 0 then
				effect_rate = 10000
			end
			local random = math.random(1,10000)
			if random <= effect_rate then
				if effectValue ~= nil then
					effectValue.value = skillInfo.effect_value
				end
				effectValue.level = skillInfo.level
				return true
			end
		end
	end

	return false
end



--是否触发被动效果：闪避1，被击打2 , 3治疗
function FightRole:TriggerBeHurtUseSkill(hurtType, effectValue)	
	-- print("------------TriggerBeHurtUseSkill------")
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end
	if FightManager:GetCurrAction() ~= nil and FightManager:GetCurrAction().actionInfo.bBackAttack then
		return false
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 and skillBaseInfo.trigger_hurtType == hurtType then
			local random = math.random(1, 10000)
			if random <= skillInfo.triggerSkill_rate then
				effectValue.skillId = skillInfo.triggerSkill
				effectValue.level 	= skillInfo.level
				-- effectValue = {skillId = skillInfo.triggerSkill,level = skillInfo.level}
				-- print("触发 技能 ",effectValue)
				return true
			end
		end
	end
	return false
end
--是否触发被动效果：被击打次数
function FightRole:TriggerBeHitUseSkill(hurtType, effectValue)	
	-- print("------------TriggerBeHurtUseSkill------")
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end
	if FightManager:GetCurrAction() ~= nil and FightManager:GetCurrAction().actionInfo.bBackAttack then
		return false
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 and skillBaseInfo.trigger_hurtType == hurtType then
			local random = self.beHurtNum + 1
			if random >= skillInfo.triggerSkill_rate then
				effectValue.skillId = skillInfo.triggerSkill
				effectValue.level = skillInfo.level
				-- effectValue = {skillId = skillInfo.triggerSkill,level = skillInfo.level}
				print("触发 技能 ",effectValue)
				return true
			end
		end
	end
	return false
end
--是否触发被动效果：攻击次数 10
function FightRole:TriggerTeamAttackSkill(effectValue)	
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 then
			if skillBaseInfo.trigger_hurtType == 10 or skillBaseInfo.trigger_hurtType == 11 then
				self.teamAttackNum = self.teamAttackNum or 0
				local bEnemyRole = self.logicInfo.bEnemyRole
				if skillBaseInfo.trigger_hurtType == 11 then
					bEnemyRole = not self.logicInfo.bEnemyRole
				end
				local attackNum = fightRoleMgr:getTeamAttackNum(bEnemyRole)
				if attackNum >= self.teamAttackNum + skillInfo.triggerSkill_rate then
					effectValue.skillId = skillInfo.triggerSkill
					effectValue.level = skillInfo.level
					self.teamAttackNum = attackNum
					return true
				end
			end
		end
	end
	return false
end

--是否触发被动效果：被攻击次数 N
function FightRole:TriggerTeamAttackSkill(effectValue)	
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 then
			if skillBaseInfo.trigger_hurtType == 10 or skillBaseInfo.trigger_hurtType == 11 then
				self.teamAttackNum = self.teamAttackNum or 0
				local bEnemyRole = self.logicInfo.bEnemyRole
				if skillBaseInfo.trigger_hurtType == 11 then
					bEnemyRole = not self.logicInfo.bEnemyRole
				end
				local attackNum = fightRoleMgr:getTeamAttackNum(bEnemyRole)
				if attackNum >= self.teamAttackNum + skillInfo.triggerSkill_rate then
					effectValue.skillId = skillInfo.triggerSkill
					effectValue.level = skillInfo.level
					self.teamAttackNum = attackNum
					return true
				end
			end
		end
	end
	return false
end

function FightRole:getPetAttackTime()
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 then
			if skillBaseInfo.trigger_hurtType == 10 or skillBaseInfo.trigger_hurtType == 11 then
				self.teamAttackNum = self.teamAttackNum or 0
				local bEnemyRole = self.logicInfo.bEnemyRole
				if skillBaseInfo.trigger_hurtType == 11 then
					bEnemyRole = not self.logicInfo.bEnemyRole
				end
				local attackNum = fightRoleMgr:getTeamAttackNum(bEnemyRole)
				local passTime = attackNum - self.teamAttackNum
				local percent = passTime/skillInfo.triggerSkill_rate *100
				percent = math.min(100,percent)
				return percent
			end
		end
	end
	return 0
end

function FightRole:getSkillByEffect( effect )
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 and skillBaseInfo.effect == effect then
			return self.passiveSkill[i]
		end
	end
	return {skillId = 0,level = 0}
end

--香香公主 援护特效
function FightRole:addYuanHuEffect()
	self:AddBodyEffect("yuanFu_1", false, false, 0, 0, self.logicInfo.bEnemyRole)
	self:AddBodyEffect("yuanFu_2", false, true, 0, 0, self.logicInfo.bEnemyRole)
end

--技能触发
function FightRole:GetTriggerBySkillHurtType(skillID, triggerHurtType, isUse)
	local random = math.random(1, 10000)
	if (not isUse) then
		--只是检测身上有没有此技能
		random = 10000
	end
	local skillInfo 	= SkillLevelData:objectByID(skillID)
	if (skillInfo and skillInfo.trigger_hurtType == triggerHurtType) then
		if random <= skillInfo.triggerSkill_rate then 
			return skillInfo
		end
	end
	return nil
end

function FightRole:getPassiveSkillInfoByEffect( effect )
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.effect == effect then
			return skillInfo
		end
	end
	return nil
end


--是否触发无概率的主动效果：吸怒1 减敌怒2 增己怒3 吸血4 侧击8 净化10 致死11 重击14
function FightRole:TriggerNoRateActiveEffect(skillID, activeEffect, effectValue)
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end
	if self:GetBuffByType(10) ~= nil then
		return false
	end
	if skillID.skillId > 0 then
		local skillInfo = SkillLevelData:objectByID(skillID)
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillID)
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type ~= 9 and skillBaseInfo.effect == activeEffect then
			if effectValue ~= nil then
				effectValue.value = skillInfo.effect_value
			end
			-- print(self.logicInfo.name.."TriggerActiveEffect:"..activeEffect)
			return true
		end
	end
	return false
end
--是否触发主动效果：吸怒1 减敌怒2 增己怒3 吸血4 侧击8 净化10 致死11 重击14
function FightRole:TriggerActiveEffect(skillID, activeEffect, effectValue)

	if self:GetBuffByType(10) ~= nil then
		return false
	end
	if skillID.skillId > 0 then
		local skillInfo = SkillLevelData:objectByID(skillID)
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillID)
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type ~= 9 and skillBaseInfo.effect == activeEffect then
			local random = math.random(1, 10000)
			if random <= skillInfo.effect_rate then
				if effectValue ~= nil then
					effectValue.value = skillInfo.effect_value
					if activeEffect == 31 or activeEffect == EnumFightSpellEffect.effect_65 or activeEffect == EnumFightSpellEffect.effect_77 then
						effectValue.value = tonumber(skillBaseInfo.effect_value)
					end
				end
				-- print(self.logicInfo.name.."TriggerActiveEffect:"..activeEffect)
				return true
			else
				return false
			end
		end
	else
		if self:isCanNotTriggerBeiDong() then  --不触发被动buff
			return false
		end
		local passiveSkillNum = #self.passiveSkill
		for i=1,passiveSkillNum do
			local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
			local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
			if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 and skillBaseInfo.hidden_skill ~= 1 and skillBaseInfo.effect == activeEffect then
				local random = math.random(1, 10000)
				-- print("主动效果 random == "..random.."  ,skillInfo.effect_rate =="..skillInfo.effect_rate )
				if random <= skillInfo.effect_rate then
					if effectValue ~= nil then
						effectValue.value = skillInfo.effect_value
						if activeEffect == 31 or activeEffect == EnumFightSpellEffect.effect_65 or activeEffect == EnumFightSpellEffect.effect_77 then
							effectValue.value = tonumber(skillBaseInfo.effect_value)
						end
					end
					-- print(self.logicInfo.name.."TriggerActiveEffect:"..activeEffect)
					return true
				end
			end
		end
	end
	return false
end

function FightRole:TriggerActiveZhanShaEffect(skillID, effectValue ,random ,immune)
	if self:GetBuffByType(10) ~= nil then
		return 0
	end
	if skillID.skillId > 0 then
		local skillInfo = SkillLevelData:objectByID(skillID)
		-- local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillID)
		if skillInfo ~= nil and skillInfo ~= nil and skillInfo.effect == 26 then
			if effectValue ~= nil then
				effectValue.value = skillInfo.effect_value
			end
			-- local immune = 
			if immune and immune > 0 then
				local _random = math.random(1, 10000)
				if _random <= immune then
					return 21
				end
			end
			if random <= skillInfo.effect_rate then
				return 26
			else
				return 21
			end
		end
	end
	return 0
end


--是否触发主动效果：吸怒1 减敌怒2 增己怒3 吸血4 侧击8 净化10 致死11 重击14
function FightRole:SkillTriggerActiveEffect(skillID, activeEffect, effectValue)
	if self:GetBuffByType(10) ~= nil then
		return false
	end
	if skillID.skillId > 0 then
		local skillInfo = SkillLevelData:objectByID(skillID)
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillID)
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.effect == activeEffect then
			local random = math.random(1, 10000)
			if random <= skillInfo.effect_rate then
				if effectValue ~= nil then
					effectValue.value = skillInfo.effect_value
				end
				return true
			else
				return false
			end
		end
	end
	return false
end

--是否对中buff目标伤害加成
function FightRole:TriggerBuffHurt(targetRole, skillID, effectValue)
	if self:GetBuffByType(10) ~= nil then
		return 0
	end
	if skillID.skillId > 0 then
		local skillInfo = SkillLevelData:objectByID(skillID)
		if skillInfo ~= nil and skillInfo.buff_hurt > 0 then
			if targetRole:GetBuffByType(skillInfo.buff_hurt) ~= nil then
				if effectValue ~= nil then
					effectValue.value = skillInfo.effect_value
				end
				return skillInfo.buff_hurt
			else
				return 0
			end
		end
	else
		local passiveSkillNum = #self.passiveSkill
		for i=1,passiveSkillNum do
			local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
			if skillInfo ~= nil and skillInfo.effect ~= 6 and skillInfo.buff_hurt > 0 then
				if  targetRole:GetBuffByType(skillInfo.buff_hurt) ~= nil then
					if effectValue ~= nil then
						effectValue.value = skillInfo.effect_value
					end
					return skillInfo.buff_hurt
				else
					return 0
				end
			end
		end
	end
	return 0
end

--是否对中buff目标伤害加成
function FightRole:TriggerBuffHurtBackAttack(targetRole, effectValue)
	if self:GetBuffByType(10) ~= nil then
		return 0
	end
	
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		if skillInfo ~= nil and skillInfo.buff_hurt > 0 then
			if  targetRole:GetBuffByType(skillInfo.buff_hurt) ~= nil then
				if effectValue ~= nil then
					effectValue.value = skillInfo.effect_value
				end
				return skillInfo.buff_hurt
			else
				return 0
			end
		end
	end
	return 0
end

function FightRole:GetAttrNum(attrIndex)
	local attrNum = self.logicInfo.attr[attrIndex]
	if attrNum == nil then
		return 0
	end
	if self.ispet then
		return attrNum
	end

	attrNum = attrNum + fightRoleMgr:GetTotalHaloAttrAdd(self.logicInfo.bEnemyRole, attrIndex)
	local attrPercent = 0
	if attrIndex < EnumAttributeType.PoisonResistance then
		attrPercent = fightRoleMgr:GetTotalHaloAttrAdd(self.logicInfo.bEnemyRole, attrIndex+17)
	end
	attrNum = math.max(0, attrNum)

	local percent = attrPercent/100
	-- local bufferNum = self.buffList:length()
	-- for i=1,bufferNum do
	-- 	local buff = self.buffList:objectAt(i)
	for buff in self.buffList:iterator() do
		if buff.bValid and buff.config.attr_change ~= "0" and buff.config.attr_change ~= "" then
			local valueInfo = GetAttrByString(buff.config.attr_change)

			local fightEffectValue = 0
			if buff.config.good_buff == 1 then
				fightEffectValue = buff.fromTarget:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,EnumFightEffectType.FightEffectType_GoodAttr) +
					self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_GoodAttr)
			else
				fightEffectValue = buff.fromTarget:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,EnumFightEffectType.FightEffectType_BadAttr) +
					self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_BadAttr)
			end
			fightEffectValue = fightEffectValue/10000+1
			fightEffectValue = math.max(0,fightEffectValue)

			if valueInfo[17+attrIndex] ~= nil then
				percent = valueInfo[17+attrIndex] *fightEffectValue + percent
			end

			if valueInfo[attrIndex] ~= nil then
				attrNum = attrNum + valueInfo[attrIndex] *fightEffectValue
			end
		end
	end
	-- if percent ~= 0 then
	-- 	print(self.logicInfo.name.."属性"..AttributeTypeStr[attrIndex].."固定值 ="..attrNum..", 百分比*100为.."..percent)
	-- end
	attrNum = attrNum + math.floor(attrNum * percent / 100)

	if self.passiveSkillAttrAdd ~= nil then
		local valueInfo = self.passiveSkillAttrAdd--GetAttrByString(self.passiveSkillAttrAdd)
		if valueInfo[17+attrIndex] ~= nil then
			attrNum = attrNum + math.floor(attrNum * valueInfo[17+attrIndex] / 10000)
		end

		if valueInfo[attrIndex] ~= nil then
			attrNum = attrNum + valueInfo[attrIndex]
		end
	end

	attrNum = math.max(0, attrNum)
	return attrNum
end

--attackRole别瞎传，死循环了解一下
function FightRole:getEffectExtraAttrNum(AttrType, attrIndex, attackRole)
	local attrNum = 0
	if AttrType == EnumFightAttributeType.Immune then
		attrNum = self.immuneAttribute[attrIndex] or 0
		attrNum = attrNum + (self.immuneAttr[attrIndex] or 0)
	elseif AttrType == EnumFightAttributeType.Effect_extra then
		attrNum = self.effectExtraAttribute[attrIndex] or 0
	elseif AttrType == EnumFightAttributeType.Be_effect_extra then
		attrNum = self.beEffectExtraAttribute[attrIndex] or 0
	elseif AttrType == EnumFightAttributeType.Xinfa_effect then
		attrNum = self.effectExtraAttribute[attrIndex] or 0
		return attrNum
	end
	-- print(self.logicInfo.name.."\n--------减伤----  attrIndex: "..attrIndex.."------\n")
	-- print("基础属性:  ",attrNum)
	attrNum = attrNum + fightRoleMgr:GetTotalHaloEffectAttrAdd(AttrType,self.logicInfo.bEnemyRole, attrIndex)
	-- print("光环增加后属性:  ",attrNum)
	-- attrNum = math.max(0, attrNum)

	local percent = 0
	-- local bufferNum = self.buffList:length()
	-- for i=1,bufferNum do
	-- 	local buff = self.buffList:objectAt(i)
	for buff in self.buffList:iterator() do
		if buff.bValid then
			local buff_addEffect = {}
			-- print("buff.config = ",buff.config)
			if AttrType == EnumFightAttributeType.Immune then
				buff_addEffect = buff.config.immune
			elseif AttrType == EnumFightAttributeType.Effect_extra then
				buff_addEffect = buff.config.effect_extra
			elseif AttrType == EnumFightAttributeType.Be_effect_extra then
				buff_addEffect = buff.config.be_effect_extra
			end
			if buff_addEffect[attrIndex] ~= nil then
				attrNum = attrNum + buff_addEffect[attrIndex]
				-- print(buff.config.id.."   BUFF 加成 属性 "..attrIndex.." :  "..attrNum)
			end
		end
	end
	-- print("BUFF加成后属性:  ",attrNum)
	if (attrIndex == EnumFightEffectType.FightEffectType_HurtGain and attackRole) then
		-- if (self ~= attackRole) then
			local attackRoleAttr = attackRole:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra, EnumFightEffectType.FightEffectType_DotNoHurt)
			attrNum = attackRoleAttr + attrNum
			attrNum = math.min(0, attrNum)
			-- print("无视免伤属性: "..attackRoleAttr)
		-- end
	end
	return attrNum
end

function FightRole:GetSkillAnger()
	local skillInfo = BaseDataManager:GetSkillBaseInfo(self.skillID)
	if skillInfo ~= nil then
		if (skillInfo.hidden_skill == 3)then
			if(self:isConsumptionAngerManual()) then 
				return 0
			end
		elseif (self:isConsumptionManual()) then
			return 0
		end

		local buff_add = 0
		-- local buff = self:GetBuffByType(76)
		local buffList = self:GetBuffListByType({EnumFightBufferType.type_76, EnumFightBufferType.type_519})
		if (buffList[EnumFightBufferType.type_76]) then
			buff_add = buffList[EnumFightBufferType.type_76].config.value
		end
		if (buffList[EnumFightBufferType.type_519]) then
			buff_add = buff_add - buffList[EnumFightBufferType.type_519].config.value
		end
		
		return skillInfo.trigger_anger  + self.extAnger + buff_add
	else
		return 0
	end 
end

--主动技能类型：1 攻击 2治疗 3净化
function FightRole:GetActiveSkillType()
	local skillInfo = BaseDataManager:GetSkillBaseInfo(self.skillID)
	if skillInfo ~= nil then
		return skillInfo.type
	else
		return 0
	end 
end

--主动技能目标类型：1 单体 2全屏 3横排贯穿 4竖排穿刺
function FightRole:GetActiveSkillTargetType()
	local skillInfo = BaseDataManager:GetSkillBaseInfo(self.skillID)
	if skillInfo ~= nil then
		return skillInfo.target_type
	else
		return 0
	end 
end

function FightRole:CanReleaseManualSkill()
	if self:IsLive() == false or self.skillID.skillId == 0 then
		return false
	end

	if fightRoundMgr:IsRoleHaveManualAction(self) then
		return false
	end

	if self:HaveForbidManualSkillBuff() then
		return false
	end
	if (self:isConsumptionManual()) then
		return true
	end
	if self.skillCD > 0 then
		return false
	end

	local skillAnger = self:GetSkillAnger()
	local totalAnger = fightRoleMgr:GetAnger(self.logicInfo.bEnemyRole)
	if totalAnger < skillAnger then
		return false
	end

	return true
end

function FightRole:CanReleaseAngerManualSkill()
	if self:IsLive() == false then
		return false
	end

	if self:HaveForbidManualSkillBuff() then
		return false
	end
	local skillInfo = self:getUseSelfAngerSkill()
	if skillInfo == nil then
		return false
	end

	if fightRoundMgr:IsRoleHaveAngerManualAction(self) then
		return false
	end
	if (self:isConsumptionAngerManual()) then
		return true
	end
	if self.role_anger < skillInfo.trigger_anger then
		return false
	end
	if self.angerSkillCD > 0 then
		return false
	end

	return true
end

function FightRole:GetSkillCD()
	local skillInfo = BaseDataManager:GetSkillBaseInfo(self.skillID)
	if skillInfo ~= nil and skillInfo.cool_time ~= nil then
		local addTime = self:getEffectExtraAttrNum(EnumFightAttributeType.Xinfa_effect, EnumXinFaSpecialType.XinFaSpecialType_SillCD)
		if (addTime and addTime > 0) then
			addTime = skillInfo.cool_time - math.floor(skillInfo.cool_time * addTime / 10000)
			if (addTime > 0) then
				return addTime
			end
		end
		return skillInfo.cool_time
	else
		return 10000
	end 
end

function FightRole:GetNormalSkill()
	if self:isCanNotTriggerBeiDong() then
		return {skillId = 0,level = 0}
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillId = self.passiveSkill[i]
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillId)
		if skillBaseInfo ~= nil and skillBaseInfo.hidden_skill == 1 then --暗器类技能
			local random = math.random(1, 10000)
			if random <= skillBaseInfo.trigger_rate then
				return skillId
			end
		end
	end

	return {skillId = 0,level = 0}
end
function FightRole:getPermanentBufSkill()
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillId = self.passiveSkill[i]
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillId)
		if skillBaseInfo ~= nil and skillBaseInfo.hidden_skill == 2 then --开场buf
			return skillBaseInfo
		end
	end

	return nil
end

function FightRole:getUseSelfAngerSkill()
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillId = self.passiveSkill[i]
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillId)
		if skillBaseInfo ~= nil and skillBaseInfo.hidden_skill == 3 then --红色侠客怒气
			local skillInfo = self:getBuffSkill(skillBaseInfo)
			return skillInfo ,skillId.level
		end
	end

	return nil
end

--
function FightRole:getUseSelfSkill()
	local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.skillID)
	if skillBaseInfo ~= nil then
		local skillInfo = self:getBuffSkill(skillBaseInfo)
		return skillInfo ,self.skillID.level
	end
	return nil
end

--风华饮月（风怒）
function FightRole:getBuffSkill(skillBaseInfo, skill, skillId)

	local bufferNum = self.buffList:length()
	local buffTypeList = {EnumFightBufferType.type_94, EnumFightBufferType.type_519}
	local buffList = self:GetBuffListByType(buffTypeList)
	buffInfo = buffList[EnumFightBufferType.type_94] or buffList[EnumFightBufferType.type_519]
	if (buffInfo == nil) then
		return skillBaseInfo
	end
	if (skillBaseInfo) then
		if (skillBaseInfo.replace_skill_id and skillBaseInfo.replace_skill_id ~= 0) then
			local skillInfo = FightManager:GetCacheSkillBaseInfo(skillBaseInfo.replace_skill_id)
			if (skillInfo) then
				print(skillBaseInfo.id,'  转换 ',skillInfo.id, " - ",skillInfo.name)
				return skillInfo
			end 
		end
		return skillBaseInfo
	end
	if (skill) then
		local skillInfo = SkillLevelData:objectByID(skill)
		if (skillInfo) then
			return skillInfo
		end
	end 
	if (skillId) then
		local skillInfo = FightManager:GetCacheSkillBaseInfo(skillId)
		if (skillInfo) then
			return skillInfo
		end
	end
	return skillBaseInfo
end

--神技
function FightRole:getAngerSkill()
	if (self.angerSkill) then
		return self.angerSkill
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local _skillId = self.passiveSkill[i]
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(_skillId)
		if skillBaseInfo ~= nil and skillBaseInfo.hidden_skill == 3 then --红色侠客怒气
			self.angerSkill = {skillId = _skillId.skillId, level = _skillId.level}
			return self.angerSkill
		end
	end

	return nil
end

function FightRole:AddCommonAnger(num)
	if self:GetBuffByType(16) ~= nil then
		fightRoleMgr:AddAnger(self.logicInfo.bEnemyRole, 0)
		return
	end

	if num == nil or num == 0 then
		return
	end
	-- self:addRoleAnger( num )
	fightRoleMgr:AddAnger(self.logicInfo.bEnemyRole, num,true)
end


function FightRole:addRoleAnger( anger )
	if anger >= 0 and self:GetBuffByType(16) ~= nil then
		return
	end
	if anger == nil or anger == 0 or self.role_angerMax == 0 then
		return
	end 
	self.role_anger = self.role_anger + anger
	self.role_anger = math.min(self.role_anger,self.role_angerMax)
--	print(self.logicInfo.name .."self.role_anger = ",self.role_anger,anger)
	if self.angerLabel then
		self.angerLabel:setPercent(self.role_anger/self.role_angerMax*100)
	end
end

function FightRole:AddOtherAnger(num)
	if self:GetBuffByType(16) ~= nil then
		fightRoleMgr:AddAnger(self.logicInfo.bEnemyRole, 0)
		return 0
	end

	if num == nil or num == 0 then
		return 0
	end
	-- self:addRoleAnger( num )
	return num
end

function FightRole:setPosition(pos)
	self.rolePanel:setPosition(pos)
end

function FightRole:getPosition()
	return self.rolePanel:getPosition()
end

function FightRole:IsLive(includePet)
	if self.ispet then
		return includePet or false
	end
	return self.currHp > 0
end

function FightRole:GetRowIndex()
	local posIndex = self.logicInfo.posindex
	if posIndex >= 9 then
		posIndex = posIndex - 9
	end

	return math.floor(posIndex/3)
end

function FightRole:GetColumnIndex()
	local posIndex = self.logicInfo.posindex
	if posIndex >= 9 then
		posIndex = posIndex - 9
	end

	return posIndex%3
end

function FightRole:OnActionStart()
	if self:IsLive() then
		if self.hitBackTween then
			TFDirector:killTween(self.hitBackTween)
			self.hitBackTween = nil
		end

		--目标原地被反击
		if FightManager:GetCurrAction().actionInfo.bBackAttack then
			local targetRole = FightManager:GetCurrAction():GetTargetRole(1)
			if targetRole == self then
				print(self.logicInfo.name.."target role is myself. return....")
				return
			end
		end
		self:setPosition(self.originPos)
		self:UpdateZOrder()

		-- self:permanentBufSkill()
	end
end

function FightRole:OnAddPermanentBuf()
	local permanentBufSkill = self:getPermanentBufSkill()
	if self:IsLive() and permanentBufSkill and permanentBufSkill.buff_id ~= 0 then
		local buff_id = permanentBufSkill.buff_id
		local bufferInfo = SkillLevelData:findBuffInfo( buff_id , permanentBufSkill.level )
		if bufferInfo then
			if self:GetBuffByType(bufferInfo.type) == nil then
				if self:AddBuff(self, buff_id, permanentBufSkill.level, 0) then
					fightRoundMgr:AddPermanentBuf(self, self,{skillid = permanentBufSkill.id, level = permanentBufSkill.level}, buff_id, 0)
				end
			end
		end
	end
	local isFuMoLu = false --伏魔录boss
	if FightManager.fightBeginInfo then
		if FightManager.fightBeginInfo.fighttype == 10 or FightManager.fightBeginInfo.fighttype == 28 then
			isFuMoLu = true
		end
	end
	if self:IsLive() and FightManager.isReplayFight == false and not isFuMoLu then
		local buff_type_list = {33,62,69, EnumFightBufferType.type_508}  --不死不休和周芷若的buff
		for i=1,#buff_type_list do
			local buSiBuXiu = self:GetBuffByType(buff_type_list[i])
			if buSiBuXiu then
				if (buSiBuXiu.config.last_type == 1 and buSiBuXiu.config.last_num >= fightRoundMgr.nCurrRoundIndex) then
					local bufferInfo = SkillBufferData:objectByID(tonumber(buSiBuXiu.config.value))
					fightRoundMgr:hasOrGiveBuff(buSiBuXiu.config.id,bufferInfo ,self )
				end
			end
		end
	end
	--给对方上BUFF
	local buff_type_list = {EnumFightBufferType.type_92, EnumFightBufferType.type_506, EnumFightBufferType.type_517} --92:东方不败BUFF
	for i=1,#buff_type_list do
		local haveBuff = self:GetBuffByType(buff_type_list[i])
		if haveBuff then
			local bufferInfo = SkillBufferData:objectByID(tonumber(haveBuff.config.value))
			fightRoundMgr:hasOrGiveBuff(haveBuff.config.id, bufferInfo, self )
		end
	end
	--给已方上BUFF
	for haveBuffId,buffId in pairs(EnumFightTeammateBuff) do
		local haveBuff = self:GetBuffByType(haveBuffId)
		if (haveBuff) then
			local bufferInfo = SkillBufferData:objectByID(tonumber(haveBuff.config.value))
			fightRoundMgr:hasOrGiveBuff(haveBuff.config.id, bufferInfo, self, true)
		end
	end
end

function FightRole:SetSpeed(speed)
	self.animSpeed = speed
	self.armature:setAnimationFps(speed * GameConfig.ANIM_FPS)

	for k,effect in pairs(self.bodyEffectList) do
		if effect ~= nil then
			effect:setAnimationFps(speed * GameConfig.ANIM_FPS)
		end
	end
end

function FightRole:UpdateZOrder()
	local rolePos = self:getPosition()
	self.rolePanel:setZOrder(-rolePos.y)
end

function FightRole:MoveToRole(targetRole, distance, beforeMoveAnim)
	if not targetRole then
		return
	end

	distance = distance or 30

	local targetPos = targetRole:getPosition()
	local targetBoxWidth = targetRole.armature:boundingBox().size.width
	local targetPosX = nil
	if self.logicInfo.bEnemyRole then
		targetPosX = targetPos.x + math.floor(targetBoxWidth/2+distance)
	else
		targetPosX = targetPos.x - math.floor(targetBoxWidth/2+distance)
	end

	local targetPosY = targetPos.y - 1
	
	if beforeMoveAnim ~= nil and self:HaveAnim(beforeMoveAnim) then
		if self.directional_sensitivity then
			if not bEnemyRole then
				beforeMoveAnim = beforeMoveAnim.."l"
			else
				beforeMoveAnim = beforeMoveAnim.."r"
			end
		end
		self.armature:play(beforeMoveAnim, -1, -1, 0)
		if self.bossEffect then
			self.bossEffect:setVisible(false)
		end
		self.armature:addMEListener(TFARMATURE_COMPLETE, 
		function()
			self.armature:removeMEListener(TFARMATURE_COMPLETE)
			self:MoveToPosition(targetPosX, targetPosY)
		end)
	else
		self:MoveToPosition(targetPosX, targetPosY)
	end
end

function FightRole:MoveToPosition(targetPosX, targetPosY)
	self.attackAnimEnd = true

	local animName = "move"
	if self.directional_sensitivity then
		if not bEnemyRole then
			animName = animName.."l"
		else
			animName = animName.."r"
		end
	end

	self.armature:play(animName)
	if self.bossEffect then
		self.bossEffect:setVisible(false)
	end

	if self.hitBackTween then
		TFDirector:killTween(self.hitBackTween)
		self.hitBackTween = nil
	end

	local moveTween = 
	{
		target = self.rolePanel,
		{
			ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
			duration = 0.5 / FightManager.fightSpeed,
			x = targetPosX,
			y = targetPosY,

			onUpdate = function ()
				self:UpdateZOrder()
			end,
		
			onComplete = function ()
				self:UpdateZOrder()
				self:OnReachTarget()
			end,
		},
	}
	TFDirector:toTween(moveTween)
end

function FightRole:OnReachTarget()
	FightManager:GetCurrAction():ShowAttackAnim()
end

function FightRole:fuHuoActionEnd()
	-- TFDirector:currentScene():ZoomOut()
	if self.armature == nil then
		return
	end
	self:RemoveAllBuff()
	self:PlayStandAnim()
	self.rolePanel:setVisible(true)
	self.armature:setColor(ccc3(255, 255, 255))
	self.rolePanel:setOpacity(255)

	-- self.originPos = mapLayer.GetPosByIndex(self.logicInfo.posIndex)
	self:setPosition(self.originPos)
	self:UpdateZOrder()
end

function FightRole:ReturnBack()
	TFDirector:currentScene():ZoomOut()
	
	if self.armature == nil then
		return
	end

	if not self:IsLive() then
		FightManager:OnActionEnd()
	end

	local currPos = self:getPosition()
	local eq = (self.originPos.x == currPos.x and self.originPos.y == currPos.y)
	if eq or FightManager:HaveBackAttackAction() then
		print(self.logicInfo.name.."return fail")
		self:PlayStandAnim()
		FightManager:OnActionEnd()
		return
	end
	print(self.logicInfo.name.."return true")

	local pathType = 0
	-- local randNum = math.random(0, 100)
	-- if math.abs(currPos.y - self.originPos.y) < 10 and randNum < 30 then
	-- 	pathType = 1
	-- end

	if self.hitBackTween then
		TFDirector:killTween(self.hitBackTween)
		self.hitBackTween = nil
	end

	self.attackAnimEnd = true


	local animName = "back"
	if self.directional_sensitivity then
		if not bEnemyRole then
			animName = animName.."l"
		else
			animName = animName.."r"
		end
	end

	self.armature:play(animName)
	if self.bossEffect then
		self.bossEffect:setVisible(false)
	end

	if pathType == 0 then
		local returnBackLine = 
		{
			target = self.rolePanel,
			{
				ease = {type=TFEaseType.EASE_OUT, rate=2},
				duration = 0.3 / FightManager.fightSpeed,
				x = self.originPos.x,
				y = self.originPos.y,

				onUpdate = function ()
					self:UpdateZOrder()
				end,

				onComplete = function ()
					self:UpdateZOrder()
					self:PlayStandAnim()
					FightManager:OnActionEnd()
				end,
			},
		}
		TFDirector:toTween(returnBackLine)
	else
		local middlePosX = (self:getPosition().x + self.originPos.x)/2
		local dist = math.abs(self:getPosition().x - self.originPos.x)
		local middlePosY = (self:getPosition().y + self.originPos.y)/2 + dist/2

		returnBackBezier = 
		{
			target = self.rolePanel,
			{
				duration = 0.3 / FightManager.fightSpeed,
				bezier =
				{
					{
						x = middlePosX,
						y = middlePosY,
					},
					{
						x = middlePosX,
						y = middlePosY,
					},
					{
						x = self.originPos.x,
						y = self.originPos.y,
					},
				},
				
				onUpdate = function ()
					self:UpdateZOrder()
				end,

				onComplete = function ()
					self.shadowImg:setVisible(true)
					self:PlayStandAnim()
					FightManager:OnActionEnd()
				end,
			},
		}
		self.shadowImg:setVisible(false)
		TFDirector:toTween(returnBackBezier)
	end
end

--在自己身上添加特效
function FightRole:AddBodyEffect(nEffectID, bLoop, bBehindBody, nPosOffsetX, nPosOffsetY,isRotation)
	if self.armature == nil then
		return
	end

	if self.bodyEffectList[nEffectID] ~= nil then
		return
	end

	local resPath = "effect/"..nEffectID..".xml"
	if not TFFileUtil:existFile(resPath) then
		return
	end
	
	TFResourceHelper:instance():addArmatureFromJsonFile(resPath)

	-- if self.logicInfo.bEnemyRole then
	-- 	GameResourceManager:addEnemyEffect( self.logicInfo.roleId , nEffectID , resPath )
	-- else
	-- 	GameResourceManager:addRoleEffect( self.logicInfo.roleId , nEffectID , resPath )
	-- end

	local bodyEffect = TFArmature:create(nEffectID.."_anim")
	if bodyEffect == nil then
		assert(false, "bodyEffect"..nEffectID.."create error")
		return
	end
	isRotation = isRotation or 0
	nPosOffsetX = nPosOffsetX or 0
	nPosOffsetY = nPosOffsetY or 0
	bodyEffect:setPosition(ccp(nPosOffsetX, nPosOffsetY))

	bodyEffect:setAnimationFps(GameConfig.ANIM_FPS)
	-- bodyEffect:setAnimationFps(FightManager.fightSpeed * GameConfig.ANIM_FPS)
	if self.logicInfo.bEnemyRole and isRotation ~= 0 then
		bodyEffect:setRotationY(180)
	end

	if bBehindBody then
		local roleZOrder = self.armature:getZOrder()
		bodyEffect:setZOrder(roleZOrder-1)
	else
		bodyEffect:setZOrder(200)
	end

	self.rolePanel:addChild(bodyEffect)

	local movNames = bodyEffect:getMovementNameStrings()
	local moveList = string.split(movNames, ";")

	if #moveList <= 1 then
		if bLoop then
			bodyEffect:playByIndex(0, -1, -1, 1)
		else
			bodyEffect:playByIndex(0, -1, -1, 0)
			bodyEffect:addMEListener(TFARMATURE_COMPLETE,
			function()
				bodyEffect:removeMEListener(TFARMATURE_COMPLETE) 
				self:RemoveBodyEffect(nEffectID)
			end)
		end
	else
		bodyEffect:playByIndex(0, -1, -1, 0)
		bodyEffect:addMEListener(TFARMATURE_COMPLETE,
			function()
				bodyEffect:removeMEListener(TFARMATURE_COMPLETE) 
				bodyEffect:playByIndex(1, -1, -1, 1)
			end)
	end

	self.bodyEffectList[nEffectID] = bodyEffect
end

function FightRole:RemoveBodyEffect(nEffectID)
	local effect = self.bodyEffectList[nEffectID]
	if effect ~= nil then
		self.rolePanel:removeChild(effect)
		self.bodyEffectList[nEffectID] = nil
	end
end

function FightRole:RemoveAllBodyEffect(nEffectID)
	for k,effect in pairs(self.bodyEffectList) do
		if effect ~= nil then
			self.rolePanel:removeChild(effect)
		end
	end
	self.bodyEffectList = {}
end

function FightRole:PlaySkillEffect(nEffectID, effectType, nPosOffsetX, nPosOffsetY, effectScale,isRotation,targetRole, flyEffRotate)
	if self.armature == nil then
		return
	end

	local resPath = "effect/"..nEffectID..".xml"
	if not TFFileUtil:existFile(resPath) then
		if not bEnemyRole then
			nEffectID = nEffectID.."r"
		else 
			nEffectID = nEffectID.."l"
		end
		resPath = "effect/"..nEffectID..".xml"
		if not TFFileUtil:existFile(resPath) then
			return
		end
	end
	TFResourceHelper:instance():addArmatureFromJsonFile(resPath)

	

	local skillEff = TFArmature:create(nEffectID.."_anim")
	if skillEff == nil then
		return
	end

	if self.logicInfo.bEnemyRole then
		GameResourceManager:addEnemyEffect( self.logicInfo.roleId , nEffectID , skillEff )
	else
		GameResourceManager:addRoleEffect( self.logicInfo.roleId , nEffectID , skillEff )
	end

	nPosOffsetX = nPosOffsetX or 0
	nPosOffsetY = nPosOffsetY or 0
	effectType = effectType or 0
	if isRotation == nil then
		isRotation = true
	end

	local effPosX = 0
	local effPosY = 0
	if effectType == 1 or effectType == 8 then
		effPosX = GameConfig.WS.width/2
		effPosY = GameConfig.WS.height/2
	elseif effectType == 6 or effectType == 9 then
		local pos = 4
		if self.logicInfo.bEnemyRole then
			pos = 13
		end
		local rolePos = mapLayer.GetPosByIndex(pos,self.logicInfo.roleId)
		effPosX = rolePos.x
		effPosY = rolePos.y
	elseif effectType == 7 or effectType == 10 then
		local pos = 13
		if self.logicInfo.bEnemyRole then
			pos = 4
		end
		local rolePos = mapLayer.GetPosByIndex(pos,self.logicInfo.roleId)
		effPosX = rolePos.x
		effPosY = rolePos.y
	elseif effectType > 1 and effectType <= 4 then
		local rolePos = self:getPosition()
		effPosX = rolePos.x
		effPosY = rolePos.y
	elseif effectType == 11 or effectType == 12 then
		local pos = 13
		if self.logicInfo.bEnemyRole then
			pos = 4
		end
		local _rolePos = mapLayer.GetPosByIndex(pos,self.logicInfo.roleId)
		effPosX = _rolePos.x
		local rolePos = self:getPosition()
		effPosY = rolePos.y
	end

	effPosY = effPosY + nPosOffsetY
	if not self.logicInfo.bEnemyRole then
		effPosX = effPosX + nPosOffsetX
	else
		effPosX = effPosX - nPosOffsetX
	end
	
	skillEff:setPosition(ccp(effPosX, effPosY))

	skillEff:setAnimationFps(self.animSpeed * GameConfig.ANIM_FPS)
	if effectScale == nil then
		effectScale = 1
	end
	skillEff:setScale(effectScale)
	if self.logicInfo.bEnemyRole and isRotation then
		skillEff:setRotationY(180)
	end

	if effectType == 0 then
		self.rolePanel:addChild(skillEff)
	elseif effectType == 5 then
		skillEff:setZOrder(-1000)
		self.rolePanel:addChild(skillEff)
	elseif effectType == 6 or effectType == 7 or effectType == 11  then
		skillEff:setZOrder(-1000)
		fightRoleMgr.roleLayer:addChild(skillEff)
	elseif effectType == 8  or effectType == 9 or effectType == 10 or effectType == 12 then
		skillEff:setZOrder(EFFECT_ZORDER)
		fightRoleMgr.roleLayer:addChild(skillEff)
	else
		local roleZOrder = self.armature:getZOrder()
		skillEff:setZOrder(EFFECT_ZORDER + roleZOrder)
		fightRoleMgr.roleLayer:addChild(skillEff)
	end

	if effectType == 0 or effectType == 1 or effectType == 2 or (effectType >= 5 and effectType <= 12) then
		skillEff:playByIndex(0, -1, -1, 0)
		skillEff:addMEListener(TFARMATURE_COMPLETE,
		function()
			skillEff:removeMEListener(TFARMATURE_COMPLETE)
			if effectType == 0 then
				self.rolePanel:removeChild(skillEff)
			else
				fightRoleMgr.roleLayer:removeChild(skillEff)
			end
		end)
	else -- 飞行特效 循环播放
		skillEff:playByIndex(0, -1, -1, 1)
		self:MoveSkillEffect(skillEff, effectType, targetRole, flyEffRotate)
	end
end

function FightRole:showSelfDisplay( )
	if self.tihuan_armature then
		self.armature = self.old_armature
		self.old_armature:setVisible(true)
		self.tihuan_armature:removeFromParent(true)
		self.tihuan_armature = nil
		self:PlayStandAnim()
	end
end
function FightRole:setTiHuanRole( armatureID )
	if self.tihuan_armature then
		self.tihuan_armature:removeFromParent(true)
		self.tihuan_armature = nil
	end
	local resPath = "armature/"..armatureID..".xml"
	TFResourceHelper:instance():addArmatureFromJsonFile(resPath)


	local armature = TFArmature:create(armatureID.."_anim")
	if armature == nil then
		assert(false, "armature"..armatureID.."create error")
		return
	end
	if self.logicInfo.bEnemyRole then
		armature:setRotationY(180)
	end
	self.tihuan_armature = armature
	self.tihuan_armature:setPosition(ccp(0,0))
	self.tihuan_armature:setVisible(true)
	self.old_armature:setVisible(false)
	self.rolePanel:addChild(self.tihuan_armature)
	self.armature = self.tihuan_armature

	armature:setAnimationFps(FightManager.fightSpeed * GameConfig.ANIM_FPS)
	self:PlayStandAnim()
end

function FightRole:PlayTextEffect(text, pos)
	if self.armature == nil then
		return
	end

	local resPath = "effect/"..text..".xml"
	if not TFFileUtil:existFile(resPath) then
		return
	end

	TFResourceHelper:instance():addArmatureFromJsonFile(resPath)

	
	local textEff = TFArmature:create(text.."_anim")
	if textEff == nil then
		assert(false, "effect/"..text..".xml not find")
		return
	end

	if self.logicInfo.bEnemyRole then
		GameResourceManager:addEnemyEffect( self.logicInfo.roleId , text , textEff )
	else
		GameResourceManager:addRoleEffect( self.logicInfo.roleId , text , textEff )
	end


	local roleZOrder = self.armature:getZOrder()
	textEff:setZOrder(FIGHT_TEXT_ZORDER)

	textEff:setPosition(pos)

	textEff:setAnimationFps(FightManager.fightSpeed * GameConfig.ANIM_FPS)

	textEff:playByIndex(0)

	TFDirector:currentScene().fightUiLayer.ui:addChild(textEff)
	textEff:addMEListener(TFARMATURE_COMPLETE,
	function() 
		textEff:removeMEListener(TFARMATURE_COMPLETE)
		TFDirector:currentScene().fightUiLayer.ui:removeChild(textEff)
	end)
end

function FightRole:PlaySkillNameEffect()
	if self.armature == nil then
		return
	end

	TFResourceHelper:instance():addArmatureFromJsonFile("effect/light.xml")

	local lightEff = TFArmature:create("light_anim")
	if lightEff == nil then
		return
	end

	lightEff:setZOrder(EFFECT_ZORDER + 102)

	local rolePos = self:getPosition()
	local effPosX = rolePos.x
	local effPosY = rolePos.y
	lightEff:setPosition(ccp(effPosX, effPosY-50))

	lightEff:setAnimationFps(FightManager.fightSpeed * GameConfig.ANIM_FPS)

	lightEff:playByIndex(0)

	fightRoleMgr.roleLayer:addChild(lightEff)
	lightEff:addMEListener(TFARMATURE_COMPLETE,
	function() 
		lightEff:removeMEListener(TFARMATURE_COMPLETE)
		fightRoleMgr.roleLayer:removeChild(lightEff)
		FightManager:GetCurrAction():BeginAttack()
	end)
end

function FightRole:IsSameRow(targetRole)
	if math.abs(self.originPos.y - targetRole.originPos.y) < 10 then
		return true
	else
		return false
	end
end

function FightRole:MoveSkillEffect(skillEffect, effectType, targetRole, flyEffRotate)
	if targetRole == nil then
		assert(false)
		return
	end

	if self.logicInfo.bEnemyRole then
		skillEffect:setRotationY(180)
	end

	local movePath = 
	{
		target = skillEffect,
		{
			duration = 0.3 / FightManager.fightSpeed,
			x = targetRole.originPos.x,
			y = targetRole.originPos.y,

			onComplete = function ()
				fightRoleMgr.roleLayer:removeChild(skillEffect)
			end,
		},
	}

	TFDirector:toTween(movePath)
end

function FightRole:HaveAnim(animName)
	animName = animName..";"
	local movNames = self.armature:getMovementNameStrings()
	movNames = movNames..";"
	if string.find(movNames, animName) then
		return true
	else
		return false
	end
end

function FightRole:PlayAttackAnim(bNormalAttack, animName)
	if self.armature == nil then
		return
	end

	local currAction = FightManager:GetCurrAction()
	if currAction.skillDisplayInfo.attackAnimMove then
		self:SetHpBarVisible(false)
	end

	if self.logicInfo.bEnemyRole == false and currAction.actionInfo.skillid.skillId > 0 and currAction.skillDisplayInfo.zoomIn == 0 then
		TFDirector:currentScene():ZoomIn(self)
	end

	self.attackAnimEnd = false
	self.needReturnBack = false

	-- local animName = "move"
	if animName ~= nil and self.directional_sensitivity then
		if not bEnemyRole then
			animName = animName.."l"
		else
			animName = animName.."r"
		end
	end

	if animName ~= nil and self:HaveAnim(animName) then
		self.armature:play(animName, -1, -1, 0)
		if self.bossEffect then
			self.bossEffect:setVisible(false)
		end
	else
		local _animName = "attack"
		if bNormalAttack then
			_animName = "attack"
		else
			_animName = "skill"
			-- self.armature:play("skill", -1, -1, 0)
		end
		if self.directional_sensitivity then
			if not bEnemyRole then
				_animName = _animName.."l"
			else
				_animName = _animName.."r"
			end
		end
		self.armature:play(_animName, -1, -1, 0)
		if self.bossEffect then
			self.bossEffect:setVisible(false)
		end
	end

	-- print("self.rolePanel:getPosition",self.rolePanel:getPosition())
	self.armature:addMEListener(TFARMATURE_COMPLETE, function()
		self.armature:removeMEListener(TFARMATURE_COMPLETE)
		if self.ispet then
			self.rolePanel:setVisible(false)
		end
		if not self.attackAnimEnd then
			self.attackAnimEnd = true
			if self.needReturnBack then
				self:ReturnBack()
			else
				self:PlayStandAnim()
			end
			self:SetHpBarVisible(true)
		end
	end)
end

function FightRole:PlayStandAnim()
	if self.armature == nil then
		return
	end

	self.attackAnimEnd = true

	local animName = "stand"
	if self.directional_sensitivity then
		if not bEnemyRole then
			animName = animName.."l"
		else
			animName = animName.."r"
		end
	end

	self.armature:play(animName, -1, -1, 1)

   
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffer = self.buffList:objectAt(i)
		if buffer.bValid and buffer.config.stand_display and buffer.config.stand_display ~= "" then

			local animName = buffer.config.stand_display
			if self.directional_sensitivity then
				if not bEnemyRole then
					animName = animName.."l"
				else
					animName = animName.."r"
				end
			end
			if self:HaveAnim(animName) == false then
				animName = "stand"
			end
			self.armature:play(animName, -1, -1, 1)
		end
	end

	if self.bossEffect then
		self.bossEffect:setVisible(true)
	end

	if self:HaveForbidAttackBuff() then
		self.armature:stop()
	end

	self.armature:removeMEListener(TFARMATURE_COMPLETE)
end

function FightRole:PlayHitAnim(bLastHit)
	if self.armature == nil then
		return
	end 

	self.attackAnimEnd = true


	local animName = "hit"
	if self.directional_sensitivity then
		if not bEnemyRole then
			animName = animName.."l"
		else
			animName = animName.."r"
		end
	end

	self.armature:play(animName, -1, -1, 0)

	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffer = self.buffList:objectAt(i)
		if buffer.bValid and buffer.config.behit_display and buffer.config.behit_display ~= "" then

			local animName = buffer.config.behit_display
			if self.directional_sensitivity then
				if not bEnemyRole then
					animName = animName.."l"
				else
					animName = animName.."r"
				end
			end


			self.armature:play(animName, -1, -1, 0)
		end
	end


	if self.bossEffect then
		self.bossEffect:setVisible(false)
	end

	if bLastHit then
		self:DoHitBackAction()
	end

	self.armature:setColor(ccc3(100, 0, 0))

	self.armature:addMEListener(TFARMATURE_COMPLETE, function() 
		self.armature:removeMEListener(TFARMATURE_COMPLETE)
		if self:IsLive() then
			self:PlayStandAnim()
			self.armature:setColor(ccc3(255, 255, 255))
		else
			if bLastHit then
				self:Die()
			end
		end
		local currAction = FightManager:GetCurrAction()
		if currAction ~= nil and bLastHit then
			currAction:OnRoleHitAnimComplete(self.logicInfo.posindex)
		end
	end)
end

function FightRole:DoHitBackAction()
	if self.armature == nil then
		return
	end

	if self.hitBackTween then
		TFDirector:killTween(self.hitBackTween)
		self.hitBackTween = nil
	end

	local originPos = self:getPosition()
	local movePos = {}
	if self.logicInfo.bEnemyRole then
		movePos.x = originPos.x + 30
	else
		movePos.x = originPos.x - 30
	end

	if self:IsLive() then
		self.hitBackTween = 
		{
			target = self.rolePanel,
			{
				duration = 0.2 / FightManager.fightSpeed,
				x = movePos.x,
				y = movePos.y,
			},
			{
				delay = 0.5 / FightManager.fightSpeed,
				duration = 0.1,
				x = originPos.x,
				y = originPos.y,

				onComplete = function ()
					self.hitBackTween = nil
				end
			},
		}
	else
		self.hitBackTween = 
		{
			target = self.rolePanel,
			{
				duration = 0.2 / FightManager.fightSpeed,
				x = movePos.x,
				y = movePos.y,

				onComplete = function ()
					self.hitBackTween = nil
				end
			},
		}
	end

	TFDirector:toTween(self.hitBackTween)
end

function FightRole:DoAvoidAction()
	if self.armature == nil then
		return
	end

	local originPos = self:getPosition()
	local movePos = {}
	if self.logicInfo.bEnemyRole then
		movePos.x = originPos.x + 70
		movePos.y = originPos.y + 50
	else
		movePos.x = originPos.x - 70
		movePos.y = originPos.y + 50
	end

	local avoid = 
	{
		target = self.rolePanel,
		{
			duration = 0.1 / FightManager.fightSpeed,
			x = movePos.x,
			y = movePos.y,
		},
		{ 
   			duration = 0,
   			delay = 0.7 / FightManager.fightSpeed,

   			onComplete = function ()
				self:setPosition(originPos)
			end	
		},
	}
	TFDirector:toTween(avoid)
end

function FightRole:Die(isBuff)
	if self.armature == nil then
		return
	end
	self.defianceTarget = nil
	fightRoleMgr:refreshMaxHp()
	

	TFDirector:currentScene().fightUiLayer:OnFightRoleDie(self)

	self:RemoveAllBuff()
	fightRoundMgr:RemoveAllManualAction(self.logicInfo.posindex, true, true)
	if not FightManager.isTiaoGuo then
		self:RemoveAllBodyEffect()
		self:RemoveAllBossEffect()
	end
	
	local currAction = FightManager:GetCurrAction()
	if currAction ~= nil and currAction.bEnemyAllDie and self.logicInfo.bEnemyRole then

		if FightManager.isTiaoGuo then
			self.rolePanel:setVisible(false)
			return
		end	
		self:PlayDieBezier()
	else
		-- if self:HaveAnim("die_stand") then
		-- 	self.armature:play("die_stand", -1, -1, 0)
		-- 	if self.bossEffect then
		-- 		self.bossEffect:setVisible(false)
		-- 	end
		-- else
			
			local saveOtherRoleList,firstRoleList = fightRoleMgr:CheckHaveSaveOtherSkillRole(self)
			local saveOtherRole = nil --firstRole or saveOtherRoleList[1]
			if (firstRoleList and firstRoleList[1]) then
				-- if (fightRoleMgr:IsAttackAfter(firstRoleList[1], self.logicInfo.posindex)) then
					saveOtherRole = firstRoleList[1]
				-- end
			else
				saveOtherRole = saveOtherRoleList[1]
			end
			--
			if not isBuff and saveOtherRole and self:GetSummoned() == 0 then
				local skillInfo = saveOtherRole:getTriggerSkillBySkillType(EnumFightSkillType.type_10)
				if (skillInfo == nil) then
					skillInfo = saveOtherRole:getTriggerSkillBySkillType(EnumFightSkillType.type_14)
				end
				if skillInfo then
					fightRoundMgr:SetFuhuoAction(saveOtherRole, skillInfo, self)
				-- else
				-- 	self:playerDieTween()
					return
				end
			-- else
				-- self:playerDieTween()
			end
			if FightManager.isTiaoGuo then
				self.rolePanel:setVisible(false)
				return
			end			
			if self:HaveAnim("die") then
				self.armature:setColor(ccc3(255, 255, 255))
				self.armature:play("die", -1, -1, 0)
				self:setPosition(self.originPos)
				self:UpdateZOrder()
				return
			end
			self:playerDieTween()
		-- end 
	end
end

function FightRole:playerDieTween()
	local dieEffect = 
	{
		target = self.rolePanel,
		{
			duration = 1 / FightManager.fightSpeed,
			alpha = 0,
		
			onComplete = function()
				if not self:IsLive() then
					self.rolePanel:setVisible(false)
				else
					self.rolePanel:setOpacity(255)
				end
			end
		}
	}
	TFDirector:toTween(dieEffect)
end

function FightRole:PlayDieBezier()
	local middlePosX = self:getPosition().x + 200
	local middlePosY = self:getPosition().y + 200
	local endPosX = self:getPosition().x + 400
	local endPosY = self:getPosition().y

	local dieBezier = 
	{
		target = self.rolePanel,
		{
			duration = 1,
			bezier = 
			{
				{
					x = middlePosX,
					y = middlePosY,
				},
				{
					x = middlePosX,
					y = middlePosY,
				},
				{
					x = endPosX,
					y = endPosY,
				},
			},

			rotate = 90,

			onComplete = function ()
				self.rolePanel:setVisible(false)
			end,
		},
	}
	self:SetHpBarVisible()
	TFDirector:toTween(dieBezier)
end

function FightRole:ReLive(reliveHp)
	if self.haveRelive then
		return false
	end
	local act = self.logicInfo.posindex.."  "..self.logicInfo.name.."-ReLive复活: "..reliveHp
	Lua_fightWriteFile(EnumFight_Log.HP, nil, "-----------------阵位", act)
	AutoTestManager:addFightLog(EnumFight_Log.HP, "-----------------阵位", act)
	self:RemoveAllBuff()

	self.haveRelive = true
	self:AddBodyEffect("fuhuo", false)
	self:ShowEffectName("fuhuo")
	self:SetHp(reliveHp)

	TFDirector:currentScene().fightUiLayer:OnFightRoleReLive(self)
	return true
end


function FightRole:_ReLive(reliveHp)
	local act = self.logicInfo.posindex.."  "..self.logicInfo.name.."-_ReLive复活: "..reliveHp
	Lua_fightWriteFile(EnumFight_Log.HP, nil, "-----------------阵位", act)
	AutoTestManager:addFightLog(EnumFight_Log.HP, "-----------------阵位", act)
	self:RemoveAllBuff()

	self:AddBodyEffect("fuhuo", false)
	self:ShowEffectName("fuhuo")
	self:SetHp(reliveHp)

	TFDirector:currentScene().fightUiLayer:OnFightRoleReLive(self)
	return true
end


function FightRole:ReLiveOut(reliveHp)
	if self.haveRelive then
		return false
	end
	local act = self.logicInfo.posindex.."  "..self.logicInfo.name.."-ReLiveOut复活: "..reliveHp
	Lua_fightWriteFile(EnumFight_Log.HP, nil, "-----------------阵位", act)
	AutoTestManager:addFightLog(EnumFight_Log.HP, "-----------------阵位", act)
	self:RemoveAllBuff()

	self.haveRelive = true
	self:SetHp(reliveHp)
	return true
end

function FightRole:CreateDamageNumFont(text, number)
	local damageFont = TFLabelBMFont:create()
	damageFont:setAnchorPoint(ccp(0.5, 0.5))
	damageFont:setZOrder(FIGHT_TEXT_ZORDER + self.logicInfo.posindex)

	if number < 0 then
		if text == "baoji" then --暴击
			damageFont:setFntFile("font/bigDamage.fnt")	
		else
			damageFont:setFntFile("font/damage.fnt")	
		end
	else
		damageFont:setFntFile("font/addHp.fnt")
	end	

	return damageFont
end

function FightRole:CreateAngerNumFont(angerNum)
	local angerNumFont = TFLabelBMFont:create()
	angerNumFont:setAnchorPoint(ccp(0.5, 0.5))
	angerNumFont:setZOrder(FIGHT_TEXT_ZORDER + self.logicInfo.posindex)

	if angerNum > 0 then
		angerNumFont:setFntFile("font/addAnger.fnt")	
	else
		angerNumFont:setFntFile("font/subAnger.fnt")	
	end

	return angerNumFont
end

function FightRole:SetHp(currHp, bTestDie, isBuff)
	if self.currHp > currHp then
		if self.logicInfo.bEnemyRole then
			if fightRoleMgr:IsSelfAllDie() then
				return
			end
		else
			if fightRoleMgr:IsEnemyAllDie() then
				return
			end
		end
	end
	--
	local lastHp 		= currHp - self.currHp 
	local oldHp 		= self.currHp
	self.currHp 		= math.max(currHp, 0)
	local maxHp 		= self.maxhp
	local addHpPercent 	= 1	--最大血量百分比
	if (self:GetSummoned() ~= 0) then
		--召唤物治疗溢出
		local constantInfo = ConstantData:objectByID("SummonedPercentMaxHP")
		if (constantInfo) then
			addHpPercent = addHpPercent + math.floor(constantInfo.value / 100)
		end
	end

	-- addHpPercent = addHpPercent + fightRoleMgr:GetSkillAddMaxHpByRole(self.logicInfo.bEnemyRole)
	addHpPercent = addHpPercent + fightRoleMgr.addHpPercentRole[self.logicInfo.bEnemyRole] or 0
	
	if (addHpPercent > 1) then
		self.saveAddHpPercent = addHpPercent
	else
		if (self.saveAddHpPercent) then
			if (self.currHp > self.maxhp) then
				addHpPercent = self.saveAddHpPercent
				if (self.currHp > oldHp) then
					--香香死后血量不再溢出,已溢出的就不管了
					self.currHp = oldHp
					if (self.currHp < self.maxhp) then
						self.currHp = self.maxhp
					end
				end
			else
				self.saveAddHpPercent = nil
			end
		end
	end
	
	maxHp 			= math.floor(maxHp * addHpPercent)
	local _maxHp = maxHp
	if(self.currHp > maxHp  ) then
		_maxHp = self.currHp
	end
	self.currHp 	= math.min(self.currHp, _maxHp)
	local currHurt = self.currHp - oldHp
	local logNames = " 复活 "
	if (oldHp > 0) then
		--死亡后的伤害不记录
		if (currHurt < 0) then
			self.lastHurtHp = currHurt
			logNames = " 本次伤害 "
		elseif (currHurt > 0) then
			--治疗回血
			logNames = " 本次回血 "
			local haveBuffList = self:getSameBuffByType(EnumFightBufferType.type_516)
			local subNum = 0
			for i,buffInfo in ipairs(haveBuffList) do
				subNum = subNum + tonumber(buffInfo.config.value)
			end
			local subMaxHp = math.floor(self.maxhp - self.maxhp * subNum / 100)
			if (subMaxHp > 0) then
				subMaxHp = math.floor(subMaxHp * (addHpPercent))
				if (oldHp >= subMaxHp) then
					--之前的血量已经超过了限制上限
					self.currHp = oldHp
				elseif(self.currHp >= subMaxHp) then
					--加血后的血超过了限制上限
					self.currHp = subMaxHp
				end
			else
				--限制为不能加血
				self.currHp = oldHp
			end
		end
	end
	local currHurt = self.currHp - oldHp
	local str = "阵位:"..self.logicInfo.posindex.." "..self.logicInfo.name.."  总血量"..maxHp.." 剩余血量 "..self.currHp.."  之前血量  "..oldHp.." 本次伤害 "..currHurt.." 上次伤害"..self.lastHurtHp
	if (isBuff) then
		str = "BUFF-->"..str
	end
	print(str)
	--
	if CC_TARGET_PLATFORM == CC_PLATFORM_WIN32 and VERSION_DEBUG == true then
		if (FightManager.log_fileName) then
			Lua_fightWriteFile(EnumFight_Log.HP, nil, "         "..str)
		end
		AutoTestManager:addFightLog(EnumFight_Log.HP, "         "..str)
	end

	if self.hpLabel ~= nil then
		self.hpLabel:setPercent(self.currHp * 100 / self.maxhp)
		self:changeHpLabel()
	end

	if bTestDie == nil then
		bTestDie = true
	end

	if bTestDie and self.currHp <= 0 then
		self:Die(isBuff)
	end

	self:OnHpChange()
end

function FightRole:OnHpChange()
	if not self:IsLive() then
		return
	end

	local effectValue = {}
	if self.passiveSkillAttrAdd == nil and self:TriggerPassiveEffect(13, effectValue) then
		self.passiveSkillAttrAdd = effectValue.value
		if not FightManager.isTiaoGuo then
			self:ShowEffectName("xihundafa")
			self:AddBodyEffect("yihun", true)
		end
		-- print(self.logicInfo.name.."触发移魂:",self.passiveSkillAttrAdd)
	elseif self.passiveSkillAttrAdd ~= nil and not self:TriggerPassiveEffect(13, effectValue) then
		self.passiveSkillAttrAdd = nil
		if not FightManager.isTiaoGuo then
			self:RemoveBodyEffect("yihun")
		end
		-- print(self.logicInfo.name.."移除移魂")
	end
end


function FightRole:ShowFightText(text, number, bAngerNum, bTestDie, bBezier, isBuff)
	local buff = self:GetBuffByType(78)
	if buff == nil then
		self:_ShowFightText(text, number, bAngerNum, bTestDie, bBezier,isBuff)
	else
		local roleList = fightRoleMgr:getHasBuffRole(self.logicInfo.bEnemyRole,78)
		local num = roleList:length()
		local hurt = math.ceil(number/num)
		for role in roleList:iterator() do
			role:_ShowFightText(text, hurt, bAngerNum, bTestDie, bBezier,isBuff)
		end
	end
end

function FightRole:_ShowFightText(text, number, bAngerNum, bTestDie, bBezier,isBuff)
	if self.armature == nil then
		return
	end

	if FightManager.fightBeginInfo and FightManager.fightBeginInfo.bSkillShowFight then
		return
	end

	local headPosX = self:getPosition().x
	local headPosY = self:getPosition().y + 200

	if text ~= "" then
		local textPosX = headPosX
		if number ~= 0 then
			textPosX = headPosX - 100
		end
		self:PlayTextEffect(text, ccp(textPosX, headPosY))
	end

	if number == 0 then
		return
	end

	-- number = math.max(-1,number)
	local hurt = number
	if hurt < 0 then
		hurt = self:calculateDunHurt(number)
	end
	local currHp = self.currHp + hurt
	if self:GetBuffByType(56) then
		currHp = math.max(currHp,1)
	end
	self:SetHp(currHp, bTestDie,isBuff)

	local fightTextLabel = nil
	if bAngerNum then
		fightTextLabel = self:CreateAngerNumFont(number)
	else
		fightTextLabel = self:CreateDamageNumFont(text, number)
	end

	fightTextLabel:setPosition(ccp(headPosX, headPosY))

	if bAngerNum then
		number = math.abs(number)
		local text = "d".."-"..number
		fightTextLabel:setText(text)
	else
		if number > 0 then
			fightTextLabel:setText("-"..number)
		else
			number = math.abs(number)
			if text == "baoji" then
				fightTextLabel:setText(number.."d")
			else
				fightTextLabel:setText(number)
			end
		end
	end

	local roleLayer = TFDirector:currentScene().roleLayer
	roleLayer:addChild(fightTextLabel)

	local pos = fightTextLabel:getPosition()
	local textTween = nil 
	if not bBezier then
		fightTextLabel:setScale(0)
		fightTextLabel:setAlpha(0.5)
		textTween = 
		{
			target = fightTextLabel,
			{
				ease = {type=TFEaseType.EASE_IN, rate=2},
				duration = 0.2 / FightManager.fightSpeed,
				alpha = 1,
				scale = 1,
				x = headPosX,
				y = headPosY + 40,
			},
			{
				delay = 0.2 / FightManager.fightSpeed,
				duration = 0.4 / FightManager.fightSpeed,
				x = headPosX,
				y = headPosY + 110,
				alpha = 0,

				onComplete = function ()
					roleLayer:removeChild(fightTextLabel)
				end
			},
		}
	else
		local offsetX = -50
		if self.logicInfo.bEnemyRole then
			offsetX = 50
		end
		textTween = 
		{
			target = fightTextLabel,
			{
				ease = {type=TFEaseType.EASE_IN_OUT, rate=2},
				duration = 0.8 / FightManager.fightSpeed,
				bezier = 
				{
					{	x = headPosX + offsetX,
						y = headPosY + 90,
					},
					{
						x = headPosX + offsetX,
						y = headPosY + 70,
					},
					{
						x = headPosX + 2*offsetX,
						y = headPosY - 100,
					},
				},
				alpha = 0.6,

				onComplete = function ()
					roleLayer:removeChild(fightTextLabel)
				end
			},
		}
	end

	TFDirector:toTween(textTween)
end


function FightRole:ShowFightTextOut( number, bAngerNum, bTestDie)
	local buff = self:GetBuffByType(78)
	if buff == nil then
		self:_ShowFightTextOut( number, bAngerNum, bTestDie)
	else
		local roleList = fightRoleMgr:getHasBuffRole(self.logicInfo.bEnemyRole,78)
		local num = roleList:length()
		local hurt = math.ceil(number/num)
		for role in roleList:iterator() do
			role:_ShowFightTextOut( hurt, bAngerNum, bTestDie)
		end
	end
end

function FightRole:_ShowFightTextOut( number, bAngerNum, bTestDie)
	-- print("FightRole:ShowFightTextOut --->>>>")
	if FightManager.fightBeginInfo and FightManager.fightBeginInfo.bSkillShowFight then
		return
	end
	if number == 0 then
		return
	end

	local hurt = number
	if hurt < 0 then
		hurt = self:calculateDunHurt(number)
	end
	local currHp = self.currHp + hurt
	if self:GetBuffByType(56) then
		currHp = math.max(currHp,1)
	end
	self:SetHp(currHp, bTestDie)
end

function FightRole:showFightHurtText(bQuick, number, text, bAngerNum, bTestDie, bBezier, isBuff)
	if (not bQuick) then
		text = text or ""
		self:ShowFightText(text, number, bAngerNum, bTestDie, bBezier, isBuff)
	else
		self:ShowFightTextOut(number, bAngerNum, bTestDie)
	end
end

--状态类型：1中毒 2灼烧 3破绽 4虚弱 5重伤 6迟缓 7失明 8神力 9防守 10混乱 11散功 12点穴 13击晕 14冻结 15昏睡
--			16束手 17回血 18挑衅 19反弹 25赏善 26罚恶 27乾坤挪移 28护体(受击给攻击方加buff) 30 血刀大法
--			32 免伤 

--bValid 拥有的buff，不判断是否生效
function FightRole:GetBuffByType(buffType)
	-- local bufferNum = self.buffList:length()
	-- for i=1,bufferNum do
	-- 	local buffer = self.buffList:objectAt(i)
	-- 	if buffer.bValid and buffer.config.type == buffType then
	-- 		return buffer
	-- 	end
	-- end
	for buffer in self.buffList:iterator() do
		if buffer.bValid and buffer.config.type == buffType then
			return buffer
		end
	end
	return nil
end

--bValid 拥有的buff，不判断是否生效
function FightRole:GetBuffListByType(buffTypeList)
	local haveList = {}
	for buffer in self.buffList:iterator() do
		if buffer.bValid then
			for i,buffType in ipairs(buffTypeList) do
				if (buffer.config.type == buffType) then
					haveList[buffType] = buffer
					break
				end
			end	
		end
	end
	return haveList
end

function FightRole:HaveForbidAttackBuff()
	local forbidAttackBuff = {12, 13, 14, 15, EnumFightBufferType.type_520}
	local buffTypeList = self:GetBuffListByType(forbidAttackBuff)
	for i=1,#forbidAttackBuff do
		if buffTypeList[forbidAttackBuff[i]] ~= nil then
			return true
		end
	end
	return false
end

function FightRole:HaveTriggerType6AttackBuff()
	local forbidAttackBuff = {10,12, 13, 14, 15, EnumFightBufferType.type_520}
	local buffTypeList = self:GetBuffListByType(forbidAttackBuff)
	for i=1,#forbidAttackBuff do
		if buffTypeList[forbidAttackBuff[i]] ~= nil then
			return true
		end
	end
	return false
end

function FightRole:removeForbidAttackBuff()
	local forbidAttackBuff = {12, 13, 14, 15, EnumFightBufferType.type_520}
	local buffTypeList = self:GetBuffListByType(forbidAttackBuff)
	for i=1,#forbidAttackBuff do
		if buffTypeList[forbidAttackBuff[i]] ~= nil then
			self:RemoveBuffByType(forbidAttackBuff[i])
		end
	end
end


function FightRole:HaveForbidBackAttackBuff()
	local forbidAttackBuff = {10,12, 13, 14, EnumFightBufferType.type_520}
	local buffTypeList = self:GetBuffListByType(forbidAttackBuff)
	for i=1,#forbidAttackBuff do
		if buffTypeList[forbidAttackBuff[i]] ~= nil then
			return true
		end
	end
	return false
end

function FightRole:HaveForbidManualSkillBuff()
	local forbidSkillBuff = {10, 11, 12, 13, 14, 15, EnumFightBufferType.type_520}
	local buffTypeList = self:GetBuffListByType(forbidSkillBuff)
	for i=1,#forbidSkillBuff do
		if buffTypeList[forbidSkillBuff[i]] ~= nil then
			return true
		end
	end
	return false
end

function FightRole:IsCanYuaHuBuff()
	local forbidAttackBuff = {10,12, 13, 14,15,18, EnumFightBufferType.type_520}
	local buffTypeList = self:GetBuffListByType(forbidAttackBuff)
	for i=1,#forbidAttackBuff do
		if buffTypeList[forbidAttackBuff[i]] ~= nil then
			return false
		end
	end
	return true
end
function FightRole:TestReleaseManualSkill()
	if self:HaveForbidManualSkillBuff() then
		TFDirector:currentScene().fightUiLayer:ForbidSkill(self, true)
	else
		TFDirector:currentScene().fightUiLayer:ForbidSkill(self, false)
	end
end

function FightRole:TestDieBuff()
	local buffTypeList = self:GetBuffListByType({25, 26, 56})
	if buffTypeList[25] ~= nil and buffTypeList[26] ~= nil then
		self:RemoveBuffByType(25)
		self:RemoveBuffByType(26)
		if buffTypeList[56] then
			self:SetHp(1)
		else
	  		self:SetHp(0,nil,true)
	  	end
	end
end

function FightRole:isDunBuff( buff_type )
	local dunBuff = {57,58,85}
	for i=1,#dunBuff do
		if buff_type == dunBuff[i] then
			return true
		end
	end
	return false
end

function FightRole:hasDunBuff()
	local dunHurt = 0
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffer = self.buffList:objectAt(i)
		if buffer.bValid and self:isDunBuff(buffer.config.type) then
			dunHurt = dunHurt + buffer.hurt
		end
	end
	return dunHurt
end


function FightRole:removeZhanShaBuff()
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid and self:isDunBuff(buffInfo.config.type) then 
			self:RemoveBuffByIndex(i)
		end
	end
end

function FightRole:calculateDunHurt( number )
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffer = self.buffList:objectAt(i)
		if buffer.bValid and self:isDunBuff(buffer.config.type) then
			buffer.hurt = buffer.hurt + number
			-- print(buffer.config.name.." 吸收伤害 "..number.." 剩余吸收量 "..buffer.hurt)
			if buffer.hurt > 0 then
				return 0
			else
				number = buffer.hurt
				--------HD特有------
				self:dunBufTrigger(buffer)
				--------------------
				self:RemoveBuffByInfo(buffer)
			end
		end
	end
	return number
end

function FightRole:calculateDunNum( buff_config ,fromTarget)
	local number = 0
	local valueInfo = GetAttrByString(buff_config.value)

	for i=2,17 do
		if valueInfo[i] then
			-- print( localizable.AttributeTypeStr[i].." = ",fromTarget:GetAttrNum(i) )
			-- print(" 百分比 ",valueInfo[i] )
			number = number + math.floor(fromTarget:GetAttrNum(i) * valueInfo[i] / 100)
		end
	end
	if valueInfo[18] ~= nil then
		number = number + math.floor(fromTarget.maxhp * valueInfo[18] / 100)
	elseif valueInfo[30] ~= nil then
		number = number + math.floor(fromTarget.currHp * valueInfo[30] / 100)
	end

	if valueInfo[1] ~= nil then
		number = number + valueInfo[1]
	end
	return number
end

function FightRole:addBuffDisplay( buffID ,isloop)
	local buffDisplay = BuffFightDisplayData:objectByID(buffID)
	if buffDisplay == nil then
		return false
	end
	local length = #buffDisplay.display_id
	for i=1,length do
		local under_show = buffDisplay.under_show[i] ~= 0
		self:AddBodyEffect(buffDisplay.display_id[i], isloop , under_show,0,0,buffDisplay.rotation[i])
	end
	return true
end

function FightRole:AddBuff(fromTarget, buffID, level, hurt)
	
	local config = SkillLevelData:getBuffInfo(buffID, level)
	if config == nil then
		assert(false, buffID..":buffer not find")
		return false
	end
	--
	local buffTypeId = config.type
	if (EnumFightBufferType.type_94 == buffTypeId or buffTypeId == EnumFightBufferType.type_519) then
		--当前角色身上可添加风恕BUFF
		local isAddBuff = false
		local passiveSkillNum = #self.passiveSkill
		for i,skillid in ipairs(self.passiveSkill) do
			local skillInfo = FightManager:GetCacheSkillBaseInfo(skillid.skillId)
			if (skillInfo.extra_buffid == buffID or skillInfo.buff_id == buffID) then
				isAddBuff = true
				break
			end
		end
		if (not isAddBuff) then
			return false
		end
	end

	if self:isCanNotTriggerBeiDong() and config.good_buff == 1 and config.is_clean == 0 then  --不触发增益buff的buff
		return false
	end
	--替换
	if config.is_replace == 0 then
		local has_buff = self:GetBuffByType(config.type)
		if has_buff ~= nil then
			return false
		end
	elseif config.is_replace == 2 then
		local has_buff = self:GetBuffByType(config.type)
		if has_buff ~= nil then
			has_buff.lastNum = has_buff.lastNum - 1
			has_buff.lastNum = math.max(has_buff.lastNum , 0)
			return true
		end
	elseif (config.upper_limit and config.upper_limit > 0) then
		--BUFF拥有上限
		local buffCount = 0
		for buffInfo in self.buffList:iterator() do
			if buffInfo.bValid then
				if (buffTypeId == buffInfo.config.type) then
					buffCount = buffCount + 1
				end
			end
		end
		if (buffCount >= config.upper_limit) then
			return false
		end
	end
	--重复
	if config.is_repeat == 0 then
		if self:isDunBuff(buffTypeId) then
			for buffInfo in self.buffList:iterator() do
				if buffInfo.bValid and buffInfo.config.type == buffTypeId then 
					self:dunBufTrigger(buffInfo)
				end
			end
		end
		self:RemoveBuffByType(buffTypeId)
	end


	local buffInfo   	= {}
	buffInfo.config  	= config
	buffInfo.lastNum	= 0
	buffInfo.bValid  	= true
	buffInfo.hurt    	= hurt
	buffInfo.fromTarget = fromTarget

	if self:isDunBuff(buffTypeId) then
		buffInfo.hurt = self:calculateDunNum(config,fromTarget)
		-- print(config.name.." 可吸收伤害 "..buffInfo.hurt)
	end
	if CC_TARGET_PLATFORM == CC_PLATFORM_WIN32 then
		local aa = "\n\t\t----ADD-----\n\t\t"
		local act1 = "阵位: "..fromTarget.logicInfo.posindex.." "..fromTarget.logicInfo.name
		local act2 = "     对 -->  阵位: "..self.logicInfo.posindex.." "..self.logicInfo.name.."上  buffId: "..config.id.."  type: "..config.type
		local bb = "\n\t\t----END-----\n"
		local nCurrCount = FightManager:GetFightCurrActionCount()
		Lua_fightWriteFile(EnumFight_Log.BUFF, nil, "动作:"..nCurrCount, aa,act1,act2,bb)
		AutoTestManager:addFightLog(EnumFight_Log.BUFF,"动作:"..fightRoundMgr.actionCount-1, "----ADD-----",act1,act2,"----END-----")
	end

	self.buffList:pushBack(buffInfo)

	self:AddBuffIcon(buffID, config.icon_id)
	if buffTypeId == 77 then
		fightRoleMgr:AddAnger(self.logicInfo.bEnemyRole, 0)
	elseif buffTypeId == EnumFightBufferType.type_83 then
		self.bMrllBack = false
	end

	local under_show = config.under_show ~= 0
	if config.effect_loop == 1 then
		if not self:addBuffDisplay( config.effect_id, true) then
			self:AddBodyEffect(config.effect_id, true , under_show,0,0,config.rotation)
		end
	else
		if not self:addBuffDisplay( config.effect_id, false) then
			self:AddBodyEffect(config.effect_id, false , under_show,0,0,config.rotation)
		end
	end

	if buffTypeId > 2 then
		self:ShowBufferName(buffTypeId, config.id)
		--挑衅buff
		if buffTypeId == 18 then
			self.defianceTarget = FightManager:GetCurrAction().attackerRole
		elseif buffTypeId == 63 or buffTypeId == 86 or config.type == EnumFightBufferType.type_509 then
			self:cleanBuffByGood(true)
		end
	end

	self:TestReleaseManualSkill()
	self:TestDieBuff()
	return true
end

function FightRole:AddBuffIcon(buffId, iconId)
	local iconImg = TFImage:create("icon/buffer/"..iconId..".png")
	if iconImg ~= nil and self.bufferIconList[buffId] == nil and self.hpBackground ~= nil then
		self.hpBackground:addChild(iconImg)
		self.bufferIconList[buffId] = iconImg
		self:SetBuffIconPos()
	end
end

function FightRole:SetBuffIconPos()
	local iconNum = 0
	for k,bufferIcon in pairs(self.bufferIconList) do
		if bufferIcon ~= nil then
			iconNum = iconNum + 1
			bufferIcon:setPosition(ccp(24*iconNum-50, 22))
		end
	end
end

function FightRole:ShowBufferName(buffType, buffId)
	local buffImg = "icon/buffer/name_"..buffType..".png"
	if (EnumFight_Buff_Res[buffId]) then
		buffImg = "icon/buffer/name_"..EnumFight_Buff_Res[buffId]..".png"
	end
	local nameImg = TFImage:create(buffImg)
	if nameImg ~= nil then
		self:MoveNameImage(nameImg)
	end
end

function FightRole:ShowEffectName(name)
	local nameImg = TFImage:create("icon/effect/"..name..".png")
	if nameImg ~= nil then
		self:MoveNameImage(nameImg)
	end
end

function FightRole:MoveNameImage(nameImg)
	if nameImg == nil then
		return
	end
	
	local posX = self:getPosition().x
	local posY = self:getPosition().y + 150
	nameImg:setPosition(ccp(posX, posY))

	local uiLayer = TFDirector:currentScene().fightUiLayer.ui
	uiLayer:addChild(nameImg)

	local pos = nameImg:getPosition()
	local nameImgTween = 
	{
		target = nameImg,
		{
			duration = 0.7 / FightManager.fightSpeed,
			x = pos.x,
			y = pos.y + 70,
			alpha = 0.3,
		
			onComplete = function ()
				nameImgTween = nil
				uiLayer:removeChild(nameImg)
			end
		},
	}

	TFDirector:toTween(nameImgTween)
end

function FightRole:HaveBuff(buffId)
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid and buffInfo.config.id == buffId then 
			return true
		end
	end

	return false
end

--

function FightRole:HaveFrozenBuff( isCanAttack )
	if isCanAttack then
		return self:GetBuffByType(14) ~= nil
	else
		return self:GetBuffByType(14) ~= nil or self:GetBuffByType(79) ~= nil
	end
end

--乾坤挪移buff
function FightRole:HaveDzxyBuff()
	return self:GetBuffByType(27) ~= nil
end
--乾坤挪移buff
function FightRole:canTriggerDzxy()
	if self.ispet then
		return false
	end
	-- print("self.immuneAttribute",self.immuneAttribute)
	if self.immuneAttribute and self.immuneAttribute[27] ~= nil then
		return false
	end
	return true
end

function FightRole:HaveBadBuff()
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid and buffInfo.config.good_buff == 0 then 
			return true
		end
	end

	return false
end

function FightRole:RemoveFrozenBuff()
	self:RemoveBuffByType(79)
	self:RemoveBuffByType(14)
end

function FightRole:RemoveBuffIcon(buffId)
	if self:HaveBuff(buffId) then
		return
	end

	local bufferIcon = self.bufferIconList[buffId]
	if bufferIcon ~= nil then
		bufferIcon:removeFromParent()
		self.bufferIconList[buffId] = nil
		self:SetBuffIconPos()
	end
end

function FightRole:RemoveBuffDisplay( buffID )
	print(self.logicInfo.posindex,"  FightRole:RemoveBuffDisplay -->",buffID)
	local buffDisplay = BuffFightDisplayData:objectByID(buffID)
	if buffDisplay == nil then
		self:RemoveBodyEffect(buffID)
		return false
	end
	local length = #buffDisplay.display_id
	for i=1,length do
		self:RemoveBodyEffect(buffDisplay.display_id[i])
	end
	return true
end

--
function FightRole:RemoveBuffByIndex(buffIndex)
	local buffInfo = self.buffList:objectAt(buffIndex)
	self:RemoveBuffByInfo(buffInfo)
end

--
function FightRole:RemoveBuffByType(bufferType)
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid and buffInfo.config.type == bufferType then 
			self:RemoveBuffByInfo(buffInfo)
		end
	end
end

--
function FightRole:RemoveBuffByInfo(buffInfo)
	if buffInfo.bValid then
		buffInfo.bValid = false

		local needRemoveEffect = true
		local needRemoveIcon = true
		for _buffInfo in self.buffList:iterator() do
			if _buffInfo.bValid and _buffInfo.config.effect_id == buffInfo.config.effect_id then 
				needRemoveEffect = false
			end
			if _buffInfo.bValid and _buffInfo.config.id == buffInfo.config.id then 
				needRemoveIcon = false
			end
		end
		if needRemoveEffect then
			self:RemoveBuffDisplay(buffInfo.config.effect_id)
		end
		if needRemoveIcon then
			self:RemoveBuffIcon(buffInfo.config.id)
		end
		if CC_TARGET_PLATFORM == CC_PLATFORM_WIN32 then	
			local act = "\n\t\t----remove--\n\t\t"
			local act0 = "阵位: "..self.logicInfo.posindex.." "..self.logicInfo.name.."  移除: buffid: "..buffInfo.config.name.."  "..buffInfo.config.id.." type: "..buffInfo.config.type
			local act1 = "  -->来源 阵位: "..buffInfo.fromTarget.logicInfo.posindex.." "..buffInfo.fromTarget.logicInfo.name
			-- print(act0..act1)
			Lua_fightWriteFile(EnumFight_Log.BUFF, nil, "动作: "..FightManager:GetFightCurrActionCount(), act,act0,act1,"\n\t\t----END-----\n")
			AutoTestManager:addFightLog(EnumFight_Log.BUFF,"动作: "..fightRoundMgr.actionCount-1, "----remove--",act0,act1,"----END-----")
		end
	end

	if not self:HaveForbidAttackBuff() then
		self.armature:resume()
	end
	self.removeList:pushBack(buffInfo)

	self:TestReleaseManualSkill()
end

--
function FightRole:RemoveAllBuff()
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid then 
			self:RemoveBuffByIndex(i)
		end
	end
end



function FightRole:CleanBuff(attackerRole)
	self:AddBodyEffect("jinghua", false)
	local cleanGood = true
	if fightRoleMgr:IsSameSide({attackerRole, self}) then
		cleanGood = false
	end

	local buffLevel = 1
	-- local bufferNum = self.buffList:length()
	-- for i=1,bufferNum do
	-- 	local buffInfo = self.buffList:objectAt(i)
	for buffInfo in self.buffList:iterator() do
		if buffInfo.bValid and buffInfo.config.is_clean == 0 then
			buffInfo.config.buffLevel = buffInfo.config.buffLevel or 1
			if cleanGood and buffInfo.config.good_buff == 1 then
				buffLevel = math.max(buffLevel ,buffInfo.config.buffLevel)
			elseif cleanGood == false and buffInfo.config.good_buff == 0 then
				buffLevel = math.max(buffLevel ,buffInfo.config.buffLevel)
			end
		end
	end

	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid and buffInfo.config.is_clean == 0 then
			if cleanGood and buffInfo.config.good_buff == 1 and buffLevel == buffInfo.config.buffLevel then
				self:RemoveBuffByIndex(i)
				if (buffInfo.config.type == EnumFightBufferType.type_83) then
					self.bMrllBack = true
				end
			elseif cleanGood == false and buffInfo.config.good_buff == 0 and buffLevel == buffInfo.config.buffLevel then
				self:RemoveBuffByIndex(i)
			end
		end
	end

	if cleanGood then
		self:ShowEffectName("qusan")
	else
		self:ShowEffectName("jinghua")
	end
end
function FightRole:cleanBuffByGood(cleanGood)
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid and buffInfo.config.is_clean == 0 then
			if cleanGood and buffInfo.config.good_buff == 1 then
				self:RemoveBuffByIndex(i)
			elseif cleanGood == false and buffInfo.config.good_buff == 0 then
				self:RemoveBuffByIndex(i)
			end
		end
	end

	-- if cleanGood then
	-- 	self:ShowEffectName("qusan")
	-- else
	-- 	self:ShowEffectName("jinghua")
	-- end
end

function FightRole:OnRoundChange()
	if self.ispet then
		return
	end
	local hpChange = 0
	if self:IsLive() then
		local addBloodBySelf = self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_AddBloodBySelf)
		if addBloodBySelf then
			hpChange = hpChange + math.floor(self.maxhp * addBloodBySelf / 10000)
		end
		local addBloodBySelf_num = self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_AddBloodBySelf_Num)
		if addBloodBySelf_num then
			hpChange = hpChange + addBloodBySelf_num
		end
		hpChange = math.max(0,hpChange)
	else
		local effectValue = {}
		if self:TriggerPassiveEffect(35, effectValue) then
			self.rolePanel:setVisible(true)
			local addHp = self.maxhp * effectValue.value / 100
			addHp = math.floor(addHp)
			self:fuHuoActionEnd()
			self:_ReLive(addHp)
			fightRoleMgr:refreshMaxHp()
			return
		end
		return
	end
	-- self:ShowFightText("", hpChange, nil, nil, nil,true)
	self:showFightHurtText(FightManager.isTiaoGuo, hpChange, "", nil, nil, nil, true)
	hpChange = 0
	-- local bufferNum = self.buffList:length()
	-- for i=1,bufferNum do
	-- 	local buffInfo = self.buffList:objectAt(i)
	for buffInfo in self.buffList:iterator() do
		if buffInfo.bValid and buffInfo.config.last_type == 1 then
			hpChange = hpChange + self:ShowHpChangeBuff(buffInfo)
			if hpChange ~= 0 then
				hpChange = self:IsBuffHurtReLive(hpChange)
				-- self:ShowFightText("", hpChange, nil, nil, nil,true)
				self:showFightHurtText(FightManager.isTiaoGuo, hpChange, "", nil, nil, nil, true)
				hpChange = 0
			end
			if (not self:IsLive()) then
				break
			end
			buffInfo.lastNum = buffInfo.lastNum + 1
			if FightManager.isReplayFight == false then
				--持续次数触发buff
				if buffInfo.config.buff_formula == 3 then
					if buffInfo.lastNum >= buffInfo.config.buff_rate then
						local new_buff_id = tonumber(buffInfo.config.value)
						local new_buff = SkillBufferData:objectByID(new_buff_id)
						if new_buff then
							if self:AddBuff(buffInfo.fromTarget , new_buff_id,buffInfo.config.level,0) then
								fightRoundMgr:AddPermanentBuf(self,self,{skillid = 0, level = 0},new_buff_id,buffInfo.config.id)
							end
						end
					end
				end
			end
			if buffInfo.lastNum >= buffInfo.config.last_num then
				self:dunBufTrigger(buffInfo)
				-- self:RemoveBuffByIndex(i)
				self:RemoveBuffByInfo(buffInfo)
			end
		end
	end
	-- if hpChange ~= 0 then
	-- 	-- self:ShowFightText("", hpChange)
	-- 	self:ShowFightText("", hpChange, nil, nil, nil,true)

	-- end
	-- self:permanentBufSkill()
end

function FightRole:OnActionEnd()
	if self.ispet then
		-- self.rolePanel:setVisible(false)
		return
	end
	-- local hpChange 		= 0
	local bufferNum 	= self.buffList:length()
	-- local isSelfAttacker = self.logicInfo.posindex == currAction.attackerRole.logicInfo.posindex
	for i=1,bufferNum do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid then
			local last_type = buffInfo.config.last_type
			if (last_type == EnumFightBuffLastType.last_Type_2) then
				local hpChange = self:ShowHpChangeBuff(buffInfo)
				if hpChange ~= 0 then
					hpChange = self:IsBuffHurtReLive(hpChange)
					-- self:ShowFightText("", hpChange, nil, nil, nil,true)
					self:showFightHurtText(FightManager.isTiaoGuo, hpChange, "", nil, nil, nil, true)
				end
				if (not self:IsLive()) then
					break
				end
				buffInfo.lastNum = buffInfo.lastNum + 1
				if FightManager.isReplayFight == false then
					--持续次数触发buff
					if buffInfo.config.buff_formula == 3 then
						if buffInfo.lastNum >= buffInfo.config.buff_rate then
							local new_buff_id = tonumber(buffInfo.config.value)
							local new_buff = SkillBufferData:objectByID(new_buff_id)
							if new_buff then
								if self:AddBuff(buffInfo.fromTarget ,new_buff_id,buffInfo.config.level,0) then
									fightRoundMgr:AddPermanentBuf(self,self,{skillid = 0, level = 0},new_buff_id,buffInfo.config.id)
								end
							end
						end
					end
				end
			elseif (last_type == EnumFightBuffLastType.last_Type_11) then
				--自己施放主动或神技
				local currAction 	= FightManager:GetCurrAction()
				if (currAction and (self.logicInfo.posindex == currAction.attackerRole.logicInfo.posindex) and (currAction.actionInfo.bManualAction or currAction.actionInfo.bAngerManualAction)) then
					local hpChange = self:ShowHpChangeBuff(buffInfo)
					buffInfo.lastNum = buffInfo.lastNum + 1
					if hpChange ~= 0 then
						hpChange = self:IsBuffHurtReLive(hpChange)
						-- self:ShowFightText("", hpChange, nil, nil, nil,true)
						self:showFightHurtText(FightManager.isTiaoGuo, hpChange, "", nil, nil, nil, true)
					end
					if (not self:IsLive()) then
						break
					end
				end
			end
			if buffInfo.lastNum >= buffInfo.config.last_num then
				self:dunBufTrigger(buffInfo)
				-- self:RemoveBuffByIndex(i)
				self:RemoveBuffByInfo(buffInfo)
				if (buffInfo.config.type == EnumFightBufferType.type_94) then
					self:PlayStandAnim()
				end
			end
		end
	end
	
	-- if hpChange ~= 0 then
	-- 	-- self:ShowFightText("",hpChange)
	-- 	self:ShowFightText("", hpChange, nil, nil, nil,true)
	-- end
	-- self:permanentBufSkill()
	local buff_type_list = {33,62,69, EnumFightBufferType.type_92, EnumFightBufferType.type_508, EnumFightBufferType.type_517}--自己
	local buff_type_list1 = {34,63,70, EnumFightBufferType.type_93, EnumFightBufferType.type_509, EnumFightBufferType.type_518}
	--
	local bEnemyRole = self.logicInfo.bEnemyRole
	local buffTypeList = self:GetBuffListByType(buff_type_list1)
	for i=1,#buff_type_list1 do
		local buSiBuXiu_2 = buffTypeList[buff_type_list1[i]]
		if buSiBuXiu_2 and fightRoundMgr:hasBuffByType(buff_type_list[i], bEnemyRole) == false then
			self:RemoveBuffByType(buff_type_list1[i])
		end
	end
	--已方BUFF消失
	local isLive = self:IsLive()
	for haveBuffId,buffId in pairs(EnumFightTeammateBuff) do
		-- local buffTypeList = self:GetBuffListByType({haveBuffId, buffId}, true)
		local haveBuff = self:GetBuffByType(buffId)
		if (haveBuff) then
			if (fightRoundMgr:hasBuffByType(haveBuffId, bEnemyRole, true) == false) then
				-- self:RemoveBuffByType(buffId)
				self:RemoveBuffByInfo(haveBuff)
			end
		end
	end

	self:repeatBufTrigger()
	self:CleanRemove()
end

function FightRole:CleanRemove()
	if self.removeList:length() > 0 then
		for v in self.removeList:iterator() do
			self.buffList:removeObject(v)
		end
		self.removeList:clear()
	end
	-- self.removeList:pushBack(buffInfo)
end

function FightRole:dunBufTrigger(buffInfo)
	if not buffInfo.bValid and not self:isDunBuff(buffInfo.config.type) then
		return false
	end
	--叠加次数触发buff
	if buffInfo.config.buff_formula == 4 then
		local params = tonumber(buffInfo.config.params)
		if buffInfo.fromTarget and buffInfo.fromTarget:IsLive() then
			local skillId = params
			local skillLevel = tonumber(buffInfo.config.level)
			local skillID = {skillId = skillId,level =  skillLevel }
			fightRoundMgr:SetSkillTrgerSkillAction( buffInfo.fromTarget ,skillID )
		end
	end
	return true
end



function FightRole:repeatBufTrigger()
	local bufferNum = self.buffList:length()
	local formula_list = {}
	for i=bufferNum,1,-1 do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid then
			--叠加次数触发buff
			if buffInfo.config.buff_formula == 2 then
				local canTrigger = true
				for k,v in pairs(formula_list) do
					if v == buffInfo.config.type then
						canTrigger = false
					end
				end
				if canTrigger then
					local repeat_time = self:getRepeatBuffTriggerTime( buffInfo )
					formula_list[#formula_list+1] = buffInfo.config.type
					if repeat_time >= buffInfo.config.buff_rate then
						local params = tonumber(buffInfo.config.params)
						if params == 0 then  --触发buff
							local new_buff_id = tonumber(buffInfo.config.value)
							local new_buff = SkillBufferData:objectByID(new_buff_id)
							if new_buff then
								if self:AddBuff(buffInfo.fromTarget,new_buff_id,buffInfo.config.level,0) then
									fightRoundMgr:AddPermanentBuf(self,self,{skillid = 0, level = 0},new_buff_id,buffInfo.config.id)
								end
							end
						elseif params == 1 and buffInfo.fromTarget then --触发伤害
							local tbl = {}
							local temptbl = string.split(str,'|')			--分解"|"
							for k,v in pairs(temptbl) do
								local temp = string.split(v,'_')				--分解'_',集合为 key，vaule 2个元素
								local key = tonumber(temp[1])
								local value = tonumber(temp[2])
								local value_add = tonumber(temp[3] or 0)
								tbl[key] = value + value_add*level
							end
							local hurt = 0
							for k,v in pairs(table_name) do
								hurt = hurt + buffInfo.fromTarget:GetAttrNum(k)*v/100
							end
							-- self:ShowFightText("",hurt)
							self:showFightHurtText(FightManager.isTiaoGuo, hurt, "", nil, nil, nil, false)
						elseif params == 2 and buffInfo.fromTarget then --触发技能 
							local skillId = tonumber(buffInfo.config.value)
							local skillLevel = tonumber(buffInfo.config.level)
							local skillID = {skillId = skillId,level =  skillLevel }
							
							local triggerSkillType = nil
							if buffInfo.config.type == EnumFightBufferType.type_512 then
								triggerSkillType = 100
							end

							fightRoundMgr:SetSkillTrgerSkillAction( buffInfo.fromTarget ,skillID, triggerSkillType )
						end
						self:RemoveBuffByType(buffInfo.config.type)
					end
				end
			end
		end
	end
end


function FightRole:getRepeatBuffTriggerTime( buffInfo )
	local bufferNum = self.buffList:length()
	local repeat_time = 0
	for j=bufferNum,1,-1 do
		local like_buffInfo = self.buffList:objectAt(j)
		if like_buffInfo.bValid and like_buffInfo.config.type == buffInfo.config.type then
			repeat_time = repeat_time + 1
		end
	end
	return repeat_time
end

function FightRole:OnBuffTrigger(_type)
	if _type == nil then
		_type = 3
	end

	for buffInfo in self.buffList:iterator() do
		if buffInfo.bValid and buffInfo.config.last_type == _type then
			buffInfo.lastNum = buffInfo.lastNum + 1
			if buffInfo.lastNum >= buffInfo.config.last_num then
				self:dunBufTrigger(buffInfo)
				-- self:RemoveBuffByIndex(i)
				self:RemoveBuffByInfo(buffInfo)
			end
		end
	end
end

--last_type类型触发
function FightRole:OnBuffLastTypeTrigger(buffInfo, lastType)
	if lastType == nil or buffInfo == nil then
		return 
	end
	if (buffInfo and buffInfo.bValid) then
		if (buffInfo.config.last_type == lastType) then
			buffInfo.lastNum = buffInfo.lastNum + 1
			if buffInfo.lastNum >= buffInfo.config.last_num then
				self:RemoveBuffByInfo(buffInfo)
			end
		end
	end
end
function FightRole:OnBuffTriggerByType(_type)
	-- local bufferNum = self.buffList:length()
	-- for i=1,bufferNum do
	-- 	local buffInfo = self.buffList:objectAt(i)
	for buffInfo in self.buffList:iterator() do
		if buffInfo.bValid and buffInfo.config.type == _type then
			buffInfo.lastNum = buffInfo.lastNum + 1
			if buffInfo.lastNum >= buffInfo.config.last_num then
				self:dunBufTrigger(buffInfo)
				self:RemoveBuffByInfo(buffInfo)
			end
		end
	end
end

function FightRole:OnBuffTriggerByTypeInfo(buffInfo)
	if (buffInfo and buffInfo.bValid) then
		buffInfo.lastNum = buffInfo.lastNum + 1
		if buffInfo.lastNum >= buffInfo.config.last_num then
			self:dunBufTrigger(buffInfo)
			self:RemoveBuffByInfo(buffInfo)
		end
	end
end

function FightRole:OnAttackBuffTrigger()
	-- local bufferNum = self.buffList:length()
	-- for i=1,bufferNum do
	-- 	local buffInfo = self.buffList:objectAt(i)
	for buffInfo in self.buffList:iterator() do
		if buffInfo.bValid and buffInfo.config.last_type == 4 then
			buffInfo.lastNum = buffInfo.lastNum + 1
			if buffInfo.lastNum >= buffInfo.config.last_num then
				self:dunBufTrigger(buffInfo)
				-- self:RemoveBuffByIndex(i)
				self:RemoveBuffByInfo(buffInfo)
			end
		end
	end
end
function FightRole:OnHelpAttackBuffTrigger()
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffInfo = self.buffList:objectAt(i)
		if buffInfo.bValid and buffInfo.config.last_type == 5 then
			buffInfo.lastNum = buffInfo.lastNum + 1
			if buffInfo.lastNum >= buffInfo.config.last_num then
				self:dunBufTrigger(buffInfo)
				-- self:RemoveBuffByIndex(i)
				self:RemoveBuffByInfo(buffInfo)
			end
		end
	end
end

function FightRole:isBuffTypeChangeHp( buff_type )
	local changType = {EnumFightBufferType.type_1, 2,17, EnumFightBufferType.type_513, EnumFightBufferType.type_502}
	for i=1,#changType do
		if changType[i] == buff_type then
			return true
		end
	end
	return false
end

function FightRole:ShowHpChangeBuff(buffInfo)
	if not self:IsLive() then
		return 0
	end
	if not self:isBuffTypeChangeHp(buffInfo.config.type) then
		return 0
	end

	local number = 0
	local valueInfo = GetAttrByString(buffInfo.config.value)
	local add_value = stringToNumberTable(buffInfo.config.params,"_")
	if buffInfo.config.type == EnumFightBufferType.type_513 then 	--流血
		
		local times = buffInfo.lastNum
		for k,v in pairs(valueInfo) do
			valueInfo[k] = v + add_value[1] + add_value[2]*times
		end
	-- elseif buffInfo.config.type == EnumFightBufferType.type_1 then 	--中毒
	elseif buffInfo.config.type == EnumFightBufferType.type_1 then 	--中毒
		if (add_value[1] and add_value[2]) then
			number = number + math.floor(buffInfo.fromTarget:GetAttrNum(add_value[1]) * add_value[2] / 100)
		end
	elseif buffInfo.config.type == EnumFightBufferType.type_502 then 	--蛇毒
		--放主动技能或神技时会损失血量上限10%的气血。此后每次释放主动技能或神技时蛇毒BUFF的扣血量都会递增10%。
		local times 	= buffInfo.lastNum
		local attrIndex = add_value[1]
		local attrValue = add_value[2]
		--
		if (attrIndex and attrValue) then
			valueInfo[attrIndex] = valueInfo[attrIndex] or 0
			valueInfo[attrIndex] = valueInfo[attrIndex] + attrValue * times 
		end
	end
	for i=2,17 do
		if valueInfo[i] then
			number = number + math.floor(self:GetAttrNum(i) * valueInfo[i] / 100)
		end
	end
	-- for i=19,22 do
	-- 	if valueInfo[i] then
	-- 		number = number + math.floor(self:GetAttrNum(i) * valueInfo[i] / 100)
	-- 	end
	-- end

	if valueInfo[18] ~= nil then
		number = number + math.floor(self.maxhp * valueInfo[18] / 100)
	elseif valueInfo[30] ~= nil then
		number = number + math.floor(self.currHp * valueInfo[30] / 100)
	elseif valueInfo[31] ~= nil then
		local hurt = buffInfo.hurt or 0
		number = number + math.floor(hurt * valueInfo[31] / 100)
	end

	if valueInfo[1] ~= nil then
		number = number + valueInfo[1]
	end
	-- print("number ==",number)


	--类型伤害修正
	local fightEffectValue = buffInfo.fromTarget:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,buffInfo.config.type) +
			self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,buffInfo.config.type)



	local fightDotEffectValue = 0
	local fightBonusEffectValue = 0
	if number < 0 then
			--dot伤害修正
		fightDotEffectValue = buffInfo.fromTarget:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,EnumFightEffectType.FightEffectType_DotHurt) +
				self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_DotHurt)

	elseif number > 0 then
		--治疗dot修正
		fightBonusEffectValue = buffInfo.fromTarget:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,EnumFightEffectType.FightEffectType_BonusHealing) +
				self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_BonusHealing)
	end
	fightEffectValue = fightEffectValue + fightDotEffectValue + fightBonusEffectValue
	fightEffectValue = math.max(0,fightEffectValue/10000+1)
	number = number * fightEffectValue
	number = math.floor(number)

	if number < 0 then
		number = number - buffInfo.fromTarget:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,EnumFightEffectType.FightEffectType_DotHurt_Num)
		number = number - self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_DotHurt_Num)
		number = math.min(0,number)
	else
		number = number + buffInfo.fromTarget:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,EnumFightEffectType.FightEffectType_BonusHealing_Num)
		number = number + self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_BonusHealing_Num)
		local endBonusHealing = 0
		endBonusHealing = buffInfo.fromTarget:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,EnumFightEffectType.FightEffectType_EndBonusHealing) +
				self:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_EndBonusHealing)
		endBonusHealing = endBonusHealing / 10000 * number
		number = number + endBonusHealing
		number = math.max(0,number)
	end
	
	if number == 0 then
		return 0
	end
	-- if (number < -1) then
	-- 	if (self:GetBuffByType(EnumFightBufferType.type_98)) then
	-- 		number = -1
	-- 	end
	-- end
	
	-- print("buffInfo.config.type = ",buffInfo.config.type)
	local buffId = buffInfo.config.id
	if buffInfo.config.type == 1 then
		self:ShowBufferName(1, buffId)
		-- print(self.logicInfo.name.."中毒扣血："..number.."当前血量："..self.currHp)
	elseif buffInfo.config.type == 2 then
		self:ShowBufferName(2, buffId)
		-- print(self.logicInfo.name.."灼烧扣血："..number.."当前血量："..self.currHp)
	elseif buffInfo.config.type == EnumFightBufferType.type_513 then
		self:ShowBufferName(buffInfo.config.type, buffId)
		-- print(self.logicInfo.name.."流血扣血："..number.."当前血量："..self.currHp)
	end
	print(self.logicInfo.name.." currHp "..self.currHp.." BUFF: " ..buffInfo.config.id.."  扣血："..number.." lastNum-> "..buffInfo.lastNum)
	
	if CC_TARGET_PLATFORM == CC_PLATFORM_WIN32 and VERSION_DEBUG == true then
		local act = "   Buff "..buffInfo.fromTarget.logicInfo.posindex.."  "..buffInfo.fromTarget.logicInfo.name.." " ..buffInfo.config.id
		if (FightManager.log_fileName) then
			Lua_fightWriteFile(EnumFight_Log.HP, nil, act)
		end
		AutoTestManager:addFightLog(EnumFight_Log.HP, act)
	end
	--是否复活
	if self.currHp + number <= 0 then
		local effectValue = {}
		if self:HaveReliveSkill(effectValue) then
			-- self:ShowFightText("", number, false, false)
			self:showFightHurtText(FightManager.isTiaoGuo, number, "", nil, nil, nil, false)
			effectValue.value = math.min(100, effectValue.value)
			local reliveHp = math.floor(self.maxhp * effectValue.value / 100)
			self:ReLive(reliveHp)
			return 0
		end
	end
	fightRoleMgr:addHurtReport(buffInfo.fromTarget.logicInfo.posindex,  number)
	return number
end


function FightRole:IsBuffHurtReLive(number)
	if self.currHp + number <= 0 then
		local effectValue = {}
		if self:HaveReliveSkill(effectValue) then
			-- self:ShowFightText("", number, false, false)
			self:showFightHurtText(FightManager.isTiaoGuo, number, "", nil, nil, nil, false)
			effectValue.value = math.min(100, effectValue.value)
			local reliveHp = math.floor(self.maxhp * effectValue.value / 100)
			self:ReLive(reliveHp)
			return 0
		end
	end
	return number
end


function FightRole:HaveReliveSkill(effectValue)
	if self.haveRelive then
		return false
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		-- local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillInfo.effect_rate == 10000 and skillInfo.effect == 9 then
			effectValue.value = skillInfo.effect_value
			return true
		end
	end

	return false
end

--在自己身上添加特效
function FightRole:AddBossEffect(nEffectID, nZorder, nDelayTime, bLoop)
	if self.armature == nil then
		return
	end
	if (not nZorder) then
		if self.logicInfo.isboss  ==nil or self.logicInfo.isboss ~= true then
			return
		end

		if self.bossEffect ~= nil then
			return
		end
	end
	if self.bossEffectList[nEffectID] ~= nil then
		return
	end
	local resPath = "effect/"..nEffectID..".xml"
	if not TFFileUtil:existFile(resPath) then
		return
	end

	TFResourceHelper:instance():addArmatureFromJsonFile(resPath)

	local bodyEffect = TFArmature:create(nEffectID.."_anim")
	if bodyEffect == nil then
		assert(false, "bodyEffect"..nEffectID.."create error")
		return
	end

	local nPosOffsetX = 0
	local nPosOffsetY = 0
	bodyEffect:setPosition(ccp(nPosOffsetX, nPosOffsetY))

	bodyEffect:setAnimationFps(FightManager.fightSpeed * GameConfig.ANIM_FPS)
	-- bodyEffect:setScale(2)
	-- if bBehindBody then
	-- 	local roleZOrder = self.armature:getZOrder()
	-- 	bodyEffect:setZOrder(roleZOrder-1)
	-- else
	-- 	bodyEffect:setZOrder(200)
	-- end
	local addZorder = nZorder
	if (addZorder == 1) then
		local roleZOrder = self.armature:getZOrder()
		bodyEffect:setZOrder(roleZOrder-1)
	else
		bodyEffect:setZOrder(200)
	end
	self.rolePanel:addChild(bodyEffect)
	if bLoop then
		bodyEffect:playByIndex(0, -1, -1, 1)
	else
		bodyEffect:playByIndex(0, -1, -1, 0)
	end
	if (not nZorder) then
		self.bossEffect = bodyEffect
	else
		self.bossEffectList[nEffectID] = bodyEffect
		nDelayTime = nDelayTime or 0
		if (nDelayTime > 0) then
			bodyEffect:setVisible(false)
			local delayTimer = -1
			delayTimer= TFDirector:addTimer(nDelayTime, 1, function() 
				TFDirector:removeTimer(delayTimer)
				if (self.bossEffectList[nEffectID]) then
					self.bossEffectList[nEffectID]:setVisible(true)
				end
			end, nil)
		else
			bodyEffect:addMEListener(TFARMATURE_COMPLETE,
			function()
				bodyEffect:removeMEListener(TFARMATURE_COMPLETE) 
				self:RemoveBossEffect(nEffectID)
			end)
		end
	end
	
end
function FightRole:RemoveBossEffect(nEffectID)
	local bodyEffect = self.bossEffectList[nEffectID]
	if bodyEffect then
		bodyEffect:removeFromParent()
		bodyEffect = nil
		self.bossEffectList[nEffectID] = nil
	end
end

function FightRole:RemoveAllBossEffect()
	for k,bodyEffect in pairs(self.bossEffectList) do
		if (bodyEffect) then
			bodyEffect:removeFromParent()
			bodyEffect = nil
		end
	end
	self.bossEffectList = {}
end
--------------add by wk.dai--------------------
--[[
判断当前角色是否还活着
return 如果角色或者返回true
]]
function FightRole:IsAlive(includePet)
	if self.ispet then
		return includePet or false
	end
	return self.currHp > 0
end

--[[
判断角色是否为有效攻击目标
@return 如果角色为可攻击目标返回true，否则返回false
]]
function FightRole:IsValidTarget(includePet)
	if not self:IsAlive(includePet) then
		return false
	end

	if self:HaveFrozenBuff(false) then
		return false
	end

	return true
end

function FightRole:PlayYuanHuAnim( rolePos)
	if self.armature == nil then
		return
	end
	self.isYuanHuAction = true

	local animName = "huanhu"
	if self.directional_sensitivity then
		if not bEnemyRole then
			animName = animName.."l"
		else
			animName = animName.."r"
		end
	end


	self.armature:play(animName, -1, -1, 0)

	if self.bossEffect then
		self.bossEffect:setVisible(false)
	end

	local originPos = self:getPosition()
	local movePos = {}
	local nowPos = clone(originPos)
	if self.logicInfo.bEnemyRole then
		movePos.x = rolePos.x - 30
	else
		movePos.x = rolePos.x + 30
	end
	movePos.y = rolePos.y
	local isUpdate = true
	if (math.abs(rolePos.x - originPos.x) <= 1 and math.abs(rolePos.y - originPos.y) <= 1) then
		movePos = originPos
		isUpdate = false
	end
	-- local m_nCurFrame = 0
	if (isUpdate) then
		self.armature:addMEListener(TFARMATURE_UPDATE, function(test1,test2,frame)
			-- m_nCurFrame = m_nCurFrame + 1
			if frame >= 4 and frame <= 6 then
				self:setPosition(movePos)
				self:UpdateZOrder()
			elseif frame >= 36 then
				self.armature:removeMEListener(TFARMATURE_UPDATE)
				self:setPosition(nowPos)
				self:UpdateZOrder()
			end
		end)
	end

	self.armature:addMEListener(TFARMATURE_COMPLETE, function()
		self.isYuanHuAction = false
		self.armature:removeMEListener(TFARMATURE_COMPLETE)
		if self:IsLive() then
			self:PlayStandAnim()
			self.armature:setColor(ccc3(255, 255, 255))
		else
			self:Die()
		end

		-- local currAction = FightManager:GetCurrAction()
		-- if currAction ~= nil then
		-- 	currAction:OnRoleHitAnimComplete()
		-- end
	end)
end

function FightRole:getCurrHp()
	local dunHurt = self:hasDunBuff()
	local currHp = self.currHp + dunHurt
	return currHp
end

function FightRole:getMaxHp()
	return self.maxhp
end

--是否触发被动效果：闪避1，被击打2 , 3治疗
function FightRole:HasTriggerSkillBySkillType(skillType)
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return nil
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo and skillBaseInfo ~= nil and skillBaseInfo.type == skillType then
			if skillBaseInfo.type == EnumFightSkillType.type_10 then
				local targetNum = skillInfo.special_num
				self.fuhuoSkillTime = self.fuhuoSkillTime or 0
				if self.fuhuoSkillTime >= targetNum then
					return nil
				end
			end
			return skillBaseInfo 
		end
	end
	return nil
end
--是否触发被动效果：闪避1，被击打2 , 3治疗
function FightRole:getTriggerSkillBySkillType(skillType)
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo and  skillBaseInfo ~= nil and skillBaseInfo.type == skillType then
			return skillInfo 
		end
	end
	return nil
end

--是否触发被动效果：闪避1，被击打2 , 3治疗
function FightRole:HasTriggerSkillByType(hurtType)
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.trigger_hurtType == hurtType then
			return true ,skillInfo
		end
	end
	return false
end
--是否触发被动效果：闪避1，被击打2 , 3治疗
function FightRole:HasTriggerSkillBySkill(skillID,hurtType)
	if self:GetBuffByType(10) ~= nil then
		return false
	end
	if skillID.skillId > 0 then
		local skillInfo = SkillLevelData:objectByID(skillID)
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillID)
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.trigger_hurtType == hurtType then
			return true
		end
	else
		if self:isCanNotTriggerBeiDong() then  --不触发被动buff
			return false
		end
		local passiveSkillNum = #self.passiveSkill
		for i=1,passiveSkillNum do
			local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
			local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
			if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.trigger_hurtType == hurtType then
				return true
			end
		end
	end
	return false
end

function FightRole:getBuffByTriggerSkillId( skillId)
	local bufferNum = self.buffList:length()
	for i=1,bufferNum do
		local buffer = self.buffList:objectAt(i)
		if buffer.bValid and tonumber(buffer.config.value) == skillId then
			return buffer
		end
	end
	return nil
end

function FightRole:getChangeAttrSkill(attack , neili )
	local attackAttr = attack
	local neiliAttr = neili
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillBaseInfo ~= nil and skillBaseInfo.type == 9 then
			local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
			if skillInfo ~= nil then
				local efftct_type = skillInfo.effect
				local value = skillInfo.effect_value
				if efftct_type == 1 then
					attackAttr = attackAttr + value * neiliAttr/100
					neiliAttr = 0
				elseif efftct_type == 2 then
					neiliAttr = neiliAttr + value * attackAttr/100
					attackAttr = attackAttr
				elseif efftct_type == 3 then
					attackAttr = attackAttr + value * agilityAttr/100
					agilityAttr = 0
				end
				attackAttr = math.floor(attackAttr)
				neiliAttr = math.floor(neiliAttr)
				break
				-- return math.floor(attackAttr) , math.floor(neiliAttr) 
			end
		end
	end
	for buffer in self.buffList:iterator() do
		if buffer.bValid and tonumber(buffer.config.type) == EnumFightBufferType.type_96 then
			if (buffer.fromTarget:GetBuffByType(EnumFightBufferType.type_95)) then
				attackAttr = attackAttr + math.floor(buffer.fromTarget:GetAttrNum(EnumAttributeType.Magic) * tonumber(buffer.config.value) / 100)	
			end
		end
	end
	return attackAttr , neiliAttr
end


--是否触发被动效果：攻击次数 6
function FightRole:TriggerBeAttackSkill(effectValue)	
	-- print("------------TriggerBeHurtUseSkill------")
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return false
	end
	if self:HaveTriggerType6AttackBuff() then
		return false
	end
	if FightManager:GetCurrAction() ~= nil and FightManager:GetCurrAction().actionInfo.bBackAttack then
		return false
	end
	local passiveSkillNum = #self.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 and skillBaseInfo.trigger_hurtType == 6 then
			local random = self.attackNum
			if random >= skillInfo.triggerSkill_rate then
				effectValue.skillId = skillInfo.triggerSkill
				effectValue.level 	= skillInfo.level
				-- effectValue = {skillId = skillInfo.triggerSkill,level = skillInfo.level}
				-- print("触发 技能 ",effectValue)
				-- self.attackNum = 0
				return true
			end
		end
	end
	return false
end


function FightRole:isCanNotTriggerBeiDong()
	local buffTypeList = self:GetBuffListByType({63, 86, EnumFightBufferType.type_509})
	if buffTypeList[63] then--损心
		return true
	end
	if buffTypeList[86] then --诛心
		return true
	end
	if buffTypeList[EnumFightBufferType.type_509] then --诛心
		return true
	end
	return false
end

function FightRole:isConsumptionAngerManual()
	local mark = 4
	return (mark == bit_and(self.nConsumptionSkillRelease, mark))
end

function FightRole:setConsumptionSkillReleaseState(isAdd , isAnger)
	local mark = 2
	if (isAnger) then
		--怒气技
		mark = 4
	end
	local num = mark
	if (not isAdd) then
		num = -num
	end
	self.nConsumptionSkillRelease = self.nConsumptionSkillRelease + num
	if (self.nConsumptionSkillRelease < 0) then
		self.nConsumptionSkillRelease = 0
	end
end

function FightRole:isConsumptionManual()
	local mark = 2
	return (mark == bit_and(self.nConsumptionSkillRelease, mark))
end

--东邪神技 透骨打穴法 (HD特有)
function FightRole:TriggerDongXie(targetInfo)
	
	-- if self:GetBuffByType(10) ~= nil then
	-- 	return false
	-- end
	if self:isCanNotTriggerBeiDong() then
		return false
	end
	local skillID = self:getAngerSkill()
	if skillID and skillID.skillId > 0 then
		local count = self:getTriggerSkillCountBySkill(skillID.skillId)
		if (count >= 2) then
			return false
		end
		local skillInfo = SkillLevelData:objectByID(skillID)
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillID)
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.trigger_hurtType == EnumFightTriggerHurtType.type_17 then
			local random = math.random(1, 10000)
			if (count <= 0) then
				random = 0
			end
			
			if random <= skillInfo.triggerSkill_rate then
				targetInfo.passiveEffect = 9
				targetInfo.passiveEffectValue = self.maxhp
				--
				
				return true
			else
				return false
			end
		end
	end
end

--触发skillTypeList技能
function FightRole:TriggerSkill(skillTypeList, triggerHurtTypeList, addTriggerSkill, triggerEffectList, addEffectValue)
	
	local isCanNotBeiDong = self:isCanNotTriggerBeiDong()
	if (isCanNotBeiDong) then
		return
	end
	for i,skillType in ipairs(skillTypeList) do
		if (skillType == EnumFightSkillType.type_7) then
			--被动技能
			local passiveSkillNum = #self.passiveSkill
			for i=1,passiveSkillNum do
				local skillInfo 	= SkillLevelData:objectByID(self.passiveSkill[i])
				local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
				if skillInfo ~= nil and skillBaseInfo ~= nil then
					for i,triggerHurtType in ipairs(triggerHurtTypeList) do
						if (triggerHurtType == skillBaseInfo.trigger_hurtType) then
							local random = math.random(1, 10000)
							if random <= skillInfo.triggerSkill_rate then
								local _addTriggerSkill 					= {}
								_addTriggerSkill.skillId 				= skillInfo.triggerSkill
								_addTriggerSkill.level 					= skillInfo.level
								_addTriggerSkill.triggerSkillType 		= triggerHurtType

								table.insert( addTriggerSkill,_addTriggerSkill)
							end
						end
					end			
				end
			end
		else
		end
	end
	--
	if (#addTriggerSkill <= 0) then
		addTriggerSkill = nil
	end
	if (#addEffectValue <= 0) then
		addEffectValue = nil
	end
	return addTriggerSkill,addEffectValue
end
--buff触发时
function FightRole:fuHuoFeated()
	if self:HaveAnim("die") then
		self.armature:setColor(ccc3(255, 255, 255))
		self.armature:play("die", -1, -1, 0)
		self:setPosition(self.originPos)
		self:UpdateZOrder()
		return
	end
	self:playerDieTween()
end

--触发skillTypeList技能
function FightRole:TriggerSkill(skillTypeList, triggerHurtTypeList, addTriggerSkill, triggerEffectList, addEffectValue)
	
	local isCanNotBeiDong = self:isCanNotTriggerBeiDong()
	if (isCanNotBeiDong) then
		return
	end
	for i,skillType in ipairs(skillTypeList) do
		if (skillType == EnumFightSkillType.type_7) then
			--被动技能
			-- local passiveSkillNum = #self.passiveSkill
			-- for i=1,passiveSkillNum do
			for _,skillId in ipairs(self.passiveSkill) do
				local skillInfo 	= SkillLevelData:objectByID(skillId)
				-- local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
				if skillInfo ~= nil then
					for i,triggerHurtType in ipairs(triggerHurtTypeList) do
						if (triggerHurtType == skillInfo.trigger_hurtType) then
							local random = math.random(1, 10000)
							if random <= skillInfo.triggerSkill_rate then
								local _addTriggerSkill 					= {}
								_addTriggerSkill.skillId 				= skillInfo.triggerSkill
								_addTriggerSkill.level 					= skillInfo.level
								_addTriggerSkill.triggerSkillType 		= triggerHurtType

								table.insert( addTriggerSkill,_addTriggerSkill)
							end
						end
					end			
				end
			end
		else
		end
	end
	--
	if (#addTriggerSkill <= 0) then
		addTriggerSkill = nil
	end
	if (#addEffectValue <= 0) then
		addEffectValue = nil
	end
	return addTriggerSkill,addEffectValue
end

--技能触发次数 addCount正数为使用 负数为回复
function FightRole:addTriggerSkillCount(skillID, addCount, initNum)
	addCount = addCount or 1
	local temp = self.triggerPassiveSkillData[skillID] or 0
	temp = temp + addCount
	if (initNum) then
		temp = initNum
	end
	temp = math.max(0, temp)
	self.triggerPassiveSkillData[skillID] = temp
end

function FightRole:getTriggerSkillCountBySkill(skillID)
	return self.triggerPassiveSkillData[skillID] or 0
end
--

--skillID是否触发主动效果
function FightRole:TriggerActiveEffectList(skillID, activityEffectList, effectValue, newEffectValue)
	
	if self:GetBuffByType(10) ~= nil then
		return 0
	end
	local isBeiDong = self:isCanNotTriggerBeiDong()  --不触发被动buff
	
	if skillID.skillId > 0 then
		local skillInfo = SkillLevelData:objectByID(skillID)
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(skillID)
		if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type ~= 9 then
			--
			local _activeEffect = skillBaseInfo.effect
			if (_activeEffect == 23 or _activeEffect == 24 or _activeEffect == EnumFightSpellEffect.effect_70) then
				if (isBeiDong) then
					return 0
				end
			end
			--
			for i,activeEffect in ipairs(activityEffectList) do
				if _activeEffect == activeEffect then
					
					local random = math.random(1, 10000)
					if (skillInfo.trigger_hurtType == EnumFightTriggerHurtType.type_21) then
						newEffectValue 				= {}
						newEffectValue.value 		= skillInfo.triggerSkill_rate
						newEffectValue.activeEffect = skillInfo.triggerSkill
					end
					if activeEffect == EnumFightSpellEffect.effect_78 then
						effectValue.value = tonumber(skillBaseInfo.effect_rate)
						return activeEffect,newEffectValue
					end
					if random <= skillInfo.effect_rate then
						if effectValue ~= nil then
							effectValue.value = skillInfo.effect_value
							if activeEffect == 31 or activeEffect == EnumFightSpellEffect.effect_65 or activeEffect == EnumFightSpellEffect.effect_77 then
								effectValue.value = tonumber(skillBaseInfo.effect_value)
							end
						end
						return activeEffect,newEffectValue
					end
				end
			end
		end
	else
		if isBeiDong then  --不触发被动buff
			return 0
		end
		--
		local passiveSkillNum = #self.passiveSkill
		for i=1,passiveSkillNum do
			local skillInfo = SkillLevelData:objectByID(self.passiveSkill[i])
			local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.passiveSkill[i])
			if skillInfo ~= nil and skillBaseInfo ~= nil and skillBaseInfo.type == 7 and skillBaseInfo.hidden_skill ~= 1 then
				--
				for i,activeEffect in ipairs(activityEffectList) do
					if (skillBaseInfo.effect == activeEffect) then
						--
						local random = math.random(1, 10000)
						if random <= skillInfo.effect_rate then
							if effectValue ~= nil then
								effectValue.value = skillInfo.effect_value
								if activeEffect == 31 or activeEffect == EnumFightSpellEffect.effect_65 or activeEffect == EnumFightSpellEffect.effect_77 then
									effectValue.value = tonumber(skillBaseInfo.effect_value)
								end
							end
							return activeEffect
						end
					end
				end
			end
		end
	end
	return 0
end

--是否触发被动效果：反弹5 反击6 化解7 复活9 免疫12 移魂13
function FightRole:TriggerPassiveEffectList(passiveEffectList, immuneList)
	-- immune = immune or 0
	immuneList = immuneList or {}
	if self:isCanNotTriggerBeiDong() then  --不触发被动buff
		return {}
	end
	local passivetList = {}
	local temp = {}
	for i,passiveEffect in ipairs(passiveEffectList) do
		local effectValue = {}
		if passiveEffect == 5 then
			local fantanBuff = self:GetBuffByType(19)
			if fantanBuff ~= nil then
				effectValue.value = fantanBuff.config.value
				temp[passiveEffect] = true
				passivetList[passiveEffect] = effectValue
			end
		
		elseif passiveEffect == 6 then
			local currAction = FightManager:GetCurrAction()
			if currAction ~= nil and currAction.actionInfo.bBackAttack then
				temp[passiveEffect] = true
				passivetList[passiveEffect] = effectValue
			end
		end
	end

	for i,skillID in ipairs(self.passiveSkill) do
		local skillInfo = SkillLevelData:objectByID(skillID)
		if skillInfo ~= nil and skillInfo.type == 7 then
			local effectValue = {}
			for i,passiveEffect in ipairs(passiveEffectList) do
				if (not temp[passiveEffect]) and skillInfo.effect == passiveEffect then
					local random = math.random(1, 10000)
					local immune = immuneList[passiveEffect] or 0
					if (passiveEffect == EnumFightSpellEffect.effect_85) then
						local triggerHp = math.floor(self.maxhp * skillInfo.effect_rate / 10000)
						if (self.currHp >= triggerHp) then
							if effectValue ~= nil then
								effectValue.value = math.floor(self.maxhp * skillInfo.effect_value / 100)
							end	
							passivetList[passiveEffect] = effectValue
						end
					elseif  random <= skillInfo.effect_rate + immune then
						if effectValue ~= nil then
							effectValue.value = skillInfo.effect_value
						end

						local bTrigger = true
						if skillInfo.trigger_hp > 0 and self.currHp / self.maxhp > skillInfo.trigger_hp / 100 then
							bTrigger = false
						else
							if passiveEffect == 13 then
								effectValue.value = skillInfo.attr_add
							end
						end

						if bTrigger then
							passivetList[passiveEffect] = effectValue
						end
					end
					break
				end
			end
		end
	end
	return passivetList
end

function FightRole:getSameBuffByType(buffType)
	local haveList = {}
	for buffer in self.buffList:iterator() do
		if buffer.bValid then
			if (buffer.config.type == buffType) then
				table.insert( haveList, buffer)
			end
		end
	end
	return haveList
end

return FightRole