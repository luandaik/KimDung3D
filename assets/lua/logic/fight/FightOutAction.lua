--
-- Author: Zippo
-- Date: 2013-12-05 20:02:30
--

local fightRoleMgr  = require("lua.logic.fight.FightRoleManager")
local fightRoundMgr = require("lua.logic.fight.FightRoundManager")
local fightPublic 	= require("lua.logic.fight.FightPublic")

local baseAction = require("lua.logic.fight.BaseFightAction")
local FightOutAction = class("FightOutAction", baseAction)

function FightOutAction:ctor(actionInfo)
	self.super.ctor(self, actionInfo)
	self.bQuick = true
	self.actionInfo = actionInfo
	self.attackerRole = fightRoleMgr:GetRoleByGirdIndex(actionInfo.attackerpos)
	assert(self.attackerRole, "attackerpos" .. actionInfo.attackerpos .. "not find")

	self.bNormalAttack = false
	if actionInfo.skillid.skillId == 0 then -- 普通攻击
		self.bNormalAttack = true
	end
	self.bEnemyAllDie = self:IsEnemyAllDie()
	if self.actionInfo.buffList and #self.actionInfo.buffList > 0 then
		-- for i=1,#self.actionInfo.buffList do
		-- 	local buff = self.actionInfo.buffList[i]
		for i,buff in ipairs(self.actionInfo.buffList) do
			local buffInfo = SkillBufferData:objectByID(buff[6])
			if buff  and buffInfo  and buffInfo.gain_type == 1 then
				local targetRole = fightRoleMgr:GetRoleByGirdIndex(buff[2])
				self:AddBuffToTarget(targetRole,targetRole,buff[6],buff[7],0)
			end
		end
	end
	self.actionInfo.buffList = {}
end

function FightOutAction:dispose()
end

function FightOutAction:ShowSkillNameEff()
	self:BeginAttack()
end

function FightOutAction:AddAttackBuff()
	if self.actionInfo.targetlist == nil then
		return
	end
	-- for i=1,#self.actionInfo.targetlist do
	-- 	local targetInfo = self.actionInfo.targetlist[i]
	for i,targetInfo in ipairs(self.actionInfo.targetlist) do
		local targetRole = self:GetTargetRole(i)
		targetInfo.triggerBufferID = targetInfo.triggerBufferID or 0
		if targetInfo.triggerBufferID > 0 then
			local buffConfig = SkillLevelData:getBuffInfo( targetInfo.triggerBufferID , targetInfo.triggerBufferLevel)
			if buffConfig ~= nil and buffConfig.good_buff == 1 and not fightRoleMgr:IsSameSide({self.attackerRole, targetRole}) then
				if buffConfig.type ~= 56 then
					targetInfo.bHaveAddBuff = true
					if self:AddBuffToTarget(self.attackerRole,self.attackerRole, targetInfo.triggerBufferID,targetInfo.triggerBufferLevel) then
						self:AddBuffInfoToServer(self.attackerRole, self.attackerRole, targetInfo.triggerBufferID, 0)
						-- break
					end
				end
			end
		end
	end
end

--通用中转函数
function FightOutAction:onShowAttackAnim()
	self:ShowAttackAnim()
end

--通用中转函数
function FightOutAction:onShowAttackAnimEnd()
	self:setHelpAttack()
	self:ShowActiveEffectHitEnd()
	self:addAttackNum()
	self:setAttackSkill()
	FightManager:OnActionEnd()
end

function FightOutAction:showHitXuliEff()
	self:ShowAllHit()
end
function FightOutAction:_showHitXuliEff()
	self:ShowAllHit()
end

function FightOutAction:ShowAllHit()
	self:GetHitNumber()
	self:ShowHit(1)
end

function FightOutAction:GetHitCount()
	self.hitCount = 1
end

--被动效果:反弹5 反击6 化解7 复活9 免疫12 受击加血50 表现
function FightOutAction:ShowPassiveEffect(targetInfo)
	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	if targetRole == nil then
		return
	end

	local effect = targetInfo.passiveEffect
	local effectValue = targetInfo.passiveEffectValue
	if (effect) then
		fightPublic:FightPassiveEffect(effect, true, self.attackerRole, targetRole , targetInfo, self)
	end
end

--主动效果:吸怒1 减敌怒2 增己怒3 吸血4 侧击8 净化10 致死11 七伤拳21 表现
function FightOutAction:ShowActiveEffect(targetInfo)
	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	if targetRole == nil then
		return
	end

	local effect = targetInfo.activeEffect
	-- local effectValue = targetInfo.activeEffectValue
	if (effect) then
		fightPublic:FightActionEffect(effect, true, self.attackerRole, targetRole, targetInfo, self.actionInfo)
	end
end

function FightOutAction:OnRoleHitAnimComplete()
	if self.hitAnimCompleteRoleNum == nil then
		return
	end

	local targetNum = #self.actionInfo.targetlist
	self.hitAnimCompleteRoleNum = self.hitAnimCompleteRoleNum + 1
	if self.hitAnimCompleteRoleNum == targetNum then
		self.hitAnimCompleteRoleNum = nil
		FightManager:OnActionEnd()
	end
end

function FightOutAction:ShowHitEff(targetRole, targetIndex)

end

function FightOutAction:_ShowHitEff(targetRole,index,targetIndex )
end

function FightOutAction:ShowHit(hitIndex)
	self.hitAnimCompleteRoleNum = 0

	local bLastHit = true

	if self.bEnemyAllDie and bLastHit then
		TFDirector:currentScene().fightUiLayer:PlayFightEndEffect()
	end

	local needRemoveIndex = 0
	local attackAddEnger = 0
	local hitAddEnger = 0
	local attackRedEnger = 0
	local hit_benemy = not self.attackerRole.logicInfo.bEnemyRole
	local needAddRedAnger = false
	local tempRemoveBuffTag = false
	if (FightManager.log_fileName or AutoTestManager.isAutoTest) then
		local act = "  阵位  "..self.actionInfo.attackerpos.." "..self.attackerRole.logicInfo.name.."-->技能: "..self.actionInfo.skillid.skillId
		local actionCount = FightManager:GetFightCurrActionCount()
		Lua_fightWriteFile(EnumFight_Log.HP, nil, "动作: "..actionCount, act)
		AutoTestManager:addFightLog(EnumFight_Log.HP, "动作: "..actionCount, act)
		self:AddHelpManualAction();
	end
	local nTargetCount = #self.actionInfo.targetlist
	for i=1,nTargetCount do
		local targetInfo = self.actionInfo.targetlist[i]
		local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)

		local bHurtSkill = false
		if targetInfo.effect == 1 or targetInfo.effect == 2 then
			if targetInfo.hurt < 0 then
				bHurtSkill = true
			elseif self.actionInfo.skillid.skillId ~= 0 and targetRole:GetBuffByType(64) then
				bHurtSkill = true
				if bLastHit then
					targetRole:OnBuffTriggerByType(64)
				end
			end
		elseif targetInfo.effect == 4 then
			if targetInfo.hurt < 0 and targetRole:GetBuffByType(81) then
				bHurtSkill = true
				if bLastHit then
					targetRole:OnBuffTriggerByType(81)
				end
			end
		end
		if tempRemoveBuffTag == false and bLastHit and targetInfo.activeEffect == EnumFightActiveEffectType.effect_79 then
			local buffInfo = self.attackerRole:GetBuffByType(EnumFightBufferType.type_519)
			if(buffInfo) then
				self.attackerRole:OnBuffLastTypeTrigger(buffInfo, EnumFightBuffLastType.last_Type_3)
				tempRemoveBuffTag = true
			end
		end
		

		--受击昏睡buff解除
		if bHurtSkill  then
			targetRole:RemoveBuffByType(15)
			targetRole:RemoveBuffByType(EnumFightBufferType.type_520)
		end
		if targetInfo.effect == 1 or targetInfo.effect == 2 or targetInfo.effect == 7 then --普通受击和暴击 7:主动加buff
			needAddRedAnger = true
			if hitIndex == 1 and self.actionInfo.triggerType ~= 5 then
				self:ShowActiveEffect(targetInfo)
			end
			
			fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex ,targetInfo.hurtList[hitIndex])
			if targetInfo.passiveEffect == 25 or targetInfo.passiveEffect == 37 then
				targetRole:ShowFightTextOut( 0, false, true)
			else
				targetRole:ShowFightTextOut(targetInfo.hurtList[hitIndex], false, true)
			end

			targetInfo.triggerBufferID = targetInfo.triggerBufferID or 0
			if targetInfo.triggerBufferID > 0 and targetInfo.bHaveAddBuff ~= true and bLastHit then
				local buffConfig = SkillLevelData:getBuffInfo( targetInfo.triggerBufferID , targetInfo.triggerBufferLevel)
				if buffConfig ~= nil then
					if buffConfig.type ~= 56 then
						--EnumFightBufferType.type_512临时特殊处理一下，
						if targetInfo.passiveEffect and targetInfo.passiveEffect == 27 and buffConfig.type ~= EnumFightBufferType.type_512 then
							if self:AddBuffToTarget( targetRole , self.attackerRole, targetInfo.triggerBufferID, targetInfo.triggerBufferLevel,targetInfo.hurt) then
								self:AddBuffInfoToServerByFanTan( targetRole, self.attackerRole,targetInfo.triggerBufferID, 0)
							end
						else
							if self:AddBuffToTarget(self.attackerRole, targetRole, targetInfo.triggerBufferID, targetInfo.triggerBufferLevel,targetInfo.hurt) then
								self:AddBuffInfoToServer(self.attackerRole, targetRole, targetInfo.triggerBufferID, 0)
							end
						end
					else
						if self:AddBuffToTarget(targetRole, targetRole, targetInfo.triggerBufferID, targetInfo.triggerBufferLevel,targetInfo.hurt) then
							self:AddBuSiBuffInfoToServer(targetRole, targetRole, targetInfo.triggerBufferID, 0)
						end
					end
				end
			end

			local fanzhiBuffType = {28,38,39,65,88}
			if bLastHit and self.actionInfo.triggerType ~= 5 and targetInfo.effect ~= 7 and not self.attackerRole.ispet then
			-- if bLastHit and bHurtSkill then
				for i=1,#fanzhiBuffType do
					local buff_type = fanzhiBuffType[i]
					local canFanzhi = true
					if buff_type == 38 and not self.bNormalAttack then
						canFanzhi = false
					end
					if buff_type == 39 and self.bNormalAttack then
						canFanzhi = false
					end
					if canFanzhi then
						hitBuff = targetRole:GetBuffByType(buff_type)
						if targetRole:IsLive() and hitBuff ~= nil then
							local buff_rate = self:CalculateInBufferTriggerRate(self.attackerRole,targetRole,hitBuff.config)
							local random = math.random(1, 10000)
							print("反制触发buff id== "..hitBuff.config.value.."buff_rate == "..buff_rate..",random == ",random)
							if random <= buff_rate then
								local _trigger = true
								local bufferInfo = SkillBufferData:objectByID(tonumber(hitBuff.config.value))
								if bufferInfo and self.attackerRole:getEffectExtraAttrNum(EnumFightAttributeType.Immune,bufferInfo.type) ~= nil then
									local _random = math.random(1, 10000)
									-- print("_random ".._random.." , self.attackerRole.immuneAttribute[bufferInfo.type] = "..self.attackerRole.immuneAttribute[bufferInfo.type])
									if _random <= self.attackerRole:getEffectExtraAttrNum(EnumFightAttributeType.Immune,bufferInfo.type) then
										_trigger = false
										self.attackerRole:ShowEffectName("mianyi")
									end
								end
								if _trigger == true then
									if self:AddBuffToTarget(targetRole,self.attackerRole, tonumber(hitBuff.config.value),hitBuff.config.buff_level) then
										self:AddBuffInfoToServer(targetRole, self.attackerRole, tonumber(hitBuff.config.value), hitBuff.config.id)
									end
								end
							end
							targetRole:OnBuffTriggerByType(buff_type)
						end
					end
				end
			end

			if bLastHit and self.actionInfo.triggerType ~= 5 and self.actionInfo.triggerType ~= 6 then
				if bHurtSkill then
					hitAddEnger = math.max(hitAddEnger,targetRole:AddOtherAnger(ConstantData:getValue("Fight.HitAnger")))
					targetRole:addRoleAnger(ConstantData:getValue("KillIdea.HitAnger"))
					hit_benemy = targetRole.logicInfo.bEnemyRole
					if self.actionInfo.bBackAttack then
						if targetRole:IsLive() then
							attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.BackAttackAnger"))
						else
							attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.BackAttackAnger"))
							attackAddEnger = attackAddEnger + ConstantData:getValue("Fight.BackAttackDieAnger")
							self.attackerRole:addRoleAnger(ConstantData:getValue("KillIdea.BackAttackDieAnger"))
						end
					else
						if self.bNormalAttack then
							if targetRole:IsLive() then
								attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.AttackAnger"))
							else
								attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.AttackAnger"))
								attackAddEnger = attackAddEnger + ConstantData:getValue("Fight.AttackDieAnger")
								self.attackerRole:addRoleAnger(ConstantData:getValue("KillIdea.AttackDieAnger"))
							end
						else
							if targetRole:IsLive() then
								attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.SkillAttackAnger"))
							else
								attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.SkillAttackAnger"))
								attackAddEnger = attackAddEnger + ConstantData:getValue("Fight.SkillAttackDieAnger")
								self.attackerRole:addRoleAnger(ConstantData:getValue("KillIdea.SkillAttackDieAnger"))
							end
						end
					end
				end
			end

			if bLastHit then
				self:ShowPassiveEffect(targetInfo)
				self:showTriggerSkill(targetInfo)
				if bHurtSkill then
					self:ShowBuffPassiveEffect(targetRole)
				end
			end


			if targetInfo.hurtList[hitIndex] < 0 then
				if not targetRole:IsLive() then
					fightRoleMgr:refreshMaxHp()
				end
			end
			-- self:OnRoleHitAnimComplete()

		elseif targetInfo.effect == 3 then --闪避
				if self.actionInfo.bBackAttack == nil or self.actionInfo.bBackAttack == false then
					self:showTriggerSkill(targetInfo)
				end
				
				if targetRole:GetBuffByType(84) then
					targetRole:OnBuffTriggerByType(84)
				end
				self:ShowPassiveEffect(targetInfo)
				-- self:OnRoleHitAnimComplete()

		elseif targetInfo.effect == 4 then --治疗加血
			needAddRedAnger = true
			-- fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex ,targetInfo.hurtList[hitIndex])
			targetRole:ShowFightTextOut(targetInfo.hurtList[hitIndex])

			self:ShowActiveEffect(targetInfo)

			targetInfo.triggerBufferID = targetInfo.triggerBufferID or 0
			if targetInfo.triggerBufferID > 0 and targetInfo.bHaveAddBuff ~= true then
				local buffConfig = SkillLevelData:getBuffInfo( targetInfo.triggerBufferID , targetInfo.triggerBufferLevel)
				if buffConfig ~= nil then
					if self:AddBuffToTarget(self.attackerRole, targetRole, targetInfo.triggerBufferID, targetInfo.triggerBufferLevel,targetInfo.hurt) then
						self:AddBuffInfoToServer(self.attackerRole, targetRole, targetInfo.triggerBufferID, 0)
					end
				end
			end
			if (i == 1) then
				local skillInfo = targetRole:GetTriggerBySkillHurtType(self.attackerRole.skillID, EnumFightTriggerHurtType.type_18, false)
				if (skillInfo) then
					self.attackerRole:addTriggerSkillCount(self.attackerRole.skillID.skillId, -1)
				end
			end
			self:showTriggerSkill(targetInfo)
			-- self:OnRoleHitAnimComplete()

		elseif targetInfo.effect == 5 then --净化，去除目标所有减益buff
			needAddRedAnger = true
			targetRole:CleanBuff(self.attackerRole)
			self:ShowActiveEffect(targetInfo)

			-- self:OnRoleHitAnimComplete()

		elseif targetInfo.effect == 6 then --乾坤挪移
			-- needAddRedAnger = true
			fightRoundMgr:SetDzxyAttackAction(targetRole, self.attackerRole, targetInfo.hurt)
			targetRole:ShowFightTextOut(0)
			targetRole:OnBuffTriggerByType(27)
			targetInfo.hurt = 0
			-- self:OnRoleHitAnimComplete()

		elseif targetInfo.effect == 8 then --额外的加buff
			needAddRedAnger = true
			targetInfo.triggerBufferID = targetInfo.triggerBufferID or 0
			if targetInfo.triggerBufferID > 0 and targetInfo.bHaveAddBuff ~= true and bLastHit then
				local buffConfig = SkillLevelData:getBuffInfo( targetInfo.triggerBufferID , targetInfo.triggerBufferLevel)
				if buffConfig ~= nil then
					if self:AddBuffToTarget(self.attackerRole, targetRole, targetInfo.triggerBufferID, targetInfo.triggerBufferLevel,targetInfo.hurt) then
						self:AddBuffInfoToServer(self.attackerRole, targetRole, targetInfo.triggerBufferID, 0)
					end
				end
			end
			
		elseif targetInfo.effect == 9 then
			needAddRedAnger = true
			targetRole:OnBuffTrigger(6)
			fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex ,targetInfo.hurt)
			targetRole:ShowFightTextOut( targetInfo.hurt)
			self:ShowPassiveEffect(targetInfo)
			self:showTriggerSkill(targetInfo)
		elseif targetInfo.effect == 10 then 
			targetRole:ShowFightTextOut( targetInfo.hurt)
			self:ShowPassiveEffect(targetInfo)
		elseif targetInfo.effect == 11 then --治疗加血 
			targetRole:fuHuoActionEnd()
			-- targetRole:PlayStandAnim()
			-- targetRole.rolePanel:setVisible(true)
			-- targetRole.armature:setColor(ccc3(255, 255, 255))
			-- targetRole.rolePanel:setOpacity(255)
			fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex ,targetInfo.hurtList[hitIndex])
			targetRole:ShowFightTextOut( math.floor(targetInfo.hurtList[hitIndex]))
			self:ShowActiveEffect(targetInfo)
			if bLastHit then
				targetInfo.triggerBufferID = targetInfo.triggerBufferID or 0
				if targetInfo.triggerBufferID > 0 and targetInfo.bHaveAddBuff ~= true then
					local buffConfig = SkillLevelData:getBuffInfo( targetInfo.triggerBufferID , targetInfo.triggerBufferLevel)
					if buffConfig ~= nil then
						if self:AddBuffToTarget(self.attackerRole, targetRole, targetInfo.triggerBufferID, targetInfo.triggerBufferLevel,targetInfo.hurt) then
							self:AddBuffInfoToServer(self.attackerRole, targetRole, targetInfo.triggerBufferID, 0)
						end
					end
				end
				TFDirector:currentScene().fightUiLayer:OnFightRoleReLive(targetRole)
				self:showTriggerSkill(targetInfo)
			end
		elseif targetInfo.effect == EnumFightHurtEffect.effect_12 then
			needAddRedAnger = true
			if (hitIndex == 1) then
				self:ShowActiveEffect(targetInfo)
				--西施选中角色放技能需要在西施Action之后才能加入
				if (self.actionInfo.attackerpos ~= targetInfo.targetpos) then
					fightRoundMgr:XiShiInitiativeSkill(self.actionInfo.skillid, targetRole)
				end
			end
			self:ShowHitEff(targetRole, i - needRemoveIndex)
			self:OnRoleHitAnimComplete()
		elseif targetInfo.effect == EnumFightHurtEffect.effect_15 then
			if bLastHit then
				targetRole:ShowFightText("", math.floor(targetInfo.hurtList[hitIndex]))
				--
				self:ShowBuffPassiveEffect(targetRole)
				self:OnRoleHitAnimComplete()
			end
		elseif targetInfo.effect == EnumFightHurtEffect.effect_16 then
			--治疗加净化
			targetRole:CleanBuff(self.attackerRole)	
			needAddRedAnger = true
			targetRole:ShowFightTextOut(targetInfo.hurtList[hitIndex])

			self:ShowActiveEffect(targetInfo)
			targetInfo.triggerBufferID = targetInfo.triggerBufferID or 0
			if targetInfo.triggerBufferID > 0 and targetInfo.bHaveAddBuff ~= true then
				local buffConfig = SkillLevelData:getBuffInfo( targetInfo.triggerBufferID , targetInfo.triggerBufferLevel)
				if buffConfig ~= nil then
					if self:AddBuffToTarget(self.attackerRole, targetRole, targetInfo.triggerBufferID, targetInfo.triggerBufferLevel,targetInfo.hurt) then
						self:AddBuffInfoToServer(self.attackerRole, targetRole, targetInfo.triggerBufferID, 0)
					end
				end
			end
			if (i == 1) then
				local skillInfo = targetRole:GetTriggerBySkillHurtType(self.attackerRole.skillID, EnumFightTriggerHurtType.type_18, false)
				if (skillInfo) then
					self.attackerRole:addTriggerSkillCount(self.attackerRole.skillID.skillId, -1)
				end
			end
			self:showTriggerSkill(targetInfo)
		else
			local effect = targetInfo.effect or ""
			toastMessage(stringUtils.format(localizable.Fight_effect_tips_1, effect))
		end
	end
	if bLastHit and needAddRedAnger and self.actionInfo.triggerType ~= 5 and self.actionInfo.triggerType ~= 6 then
		if self.actionInfo.bBackAttack then
			attackRedEnger = math.max(attackRedEnger,ConstantData:getValue("KillIdea.BackAttackAnger"))
		else
			if self.bNormalAttack then
				attackRedEnger = math.max(attackRedEnger,ConstantData:getValue("KillIdea.AttackAnger"))
			else
				local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
				if skillBaseInfo and skillBaseInfo.hidden_skill ~= 3 then
					attackRedEnger = math.max(attackRedEnger,ConstantData:getValue("KillIdea.SkillAttackAnger"))
				end
			end
		end
	end

	if bLastHit and attackAddEnger ~= 0 then
		self.attackerRole:AddCommonAnger(attackAddEnger)
	end
	if bLastHit and attackRedEnger ~= 0 then
		self.attackerRole:addRoleAnger(attackRedEnger)
	end
	if bLastHit and hitAddEnger ~= 0 then
		fightRoleMgr:AddAnger( hit_benemy,hitAddEnger,true)
	end
	-- FightManager:OnActionEnd()
	-- self:OnRoleHitAnimComplete()
end



function FightOutAction:ShowExtraBuffEff(targetRole, targetIndex)

end

function FightOutAction:_ShowExtraEff(targetRole,index )
	
end




function FightOutAction:ShowXiXinDaFaEffect()

	local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
	local skillInfo = SkillLevelData:objectByID(self.actionInfo.skillid)
	if skillBaseInfo == nil or skillInfo == nil then
		return
	end
	if skillBaseInfo.effect ~= 22 then
		return
	end

	local nTargetCount = #self.actionInfo.targetlist
	for i=1,nTargetCount do
		local targetInfo = self.actionInfo.targetlist[i]
		if targetInfo.activeEffect == 22 and targetInfo.triggerBufferID ~= 0 then
			if self:AddBuffToTarget(self.attackerRole,self.attackerRole, tonumber(skillInfo.effect_value),self.actionInfo.skillid.level) then
				self:AddBuffInfoToServer(self.attackerRole, self.attackerRole, tonumber(skillInfo.effect_value), 0)
			end
			return
		end
	end
end

function FightOutAction:ShowQianKunDaNuoYi()
	local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
	local skillInfo = SkillLevelData:objectByID(self.actionInfo.skillid)
	if skillBaseInfo == nil or skillInfo == nil then
		return
	end

	if skillBaseInfo.effect == 20 then
		local liveList = fightRoleMgr:GetAllLiveRole(self.attackerRole.logicInfo.bEnemyRole, nil, true)
		local liveNum = liveList:length()
		for i=1,liveNum do
			local role = liveList:objectAt(i)
			--治疗修正
			-- local fightEffectValue = self.attackerRole:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,EnumFightEffectType.FightEffectType_BonusHealing) +
			-- 	role:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_BonusHealing)
			-- fightEffectValue = fightEffectValue/10000+1
			-- fightEffectValue = math.max(0,fightEffectValue)

			-- local _tempNum = skillInfo.effect_value * fightEffectValue + role:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_BonusHealing_Num)
			-- _tempNum = math.max(0,_tempNum)

			-- fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex,  math.floor(_tempNum))
			-- role:ShowFightTextOut(math.floor(_tempNum))
			role:ShowFightTextOut(skillInfo.effect_value)
		end
	end
end


function FightOutAction:pause()
end

function FightOutAction:resume()
end

function FightOutAction:setHurtAddBloodAction()
	local targetInfo = self.actionInfo.targetlist[1]
	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	-- local hurtAddRole , skillInfo= fightRoundMgr:IsHaveHurtAddHpRole(targetRole)
	local hurtAddRoleList = fightRoundMgr:IsHaveHurtAddHpRole(targetRole)
	if hurtAddRoleList == nil or hurtAddRoleList:length() <= 0 then
		return
	end
	-- fightRoundMgr.hurtAddBloodActionList:clear()
	for v in hurtAddRoleList:iterator() do
		local hurtAddRole = v.role
		local skillInfo = v.skillInfo
		if hurtAddRole == nil or fightRoleMgr:IsSameSide({self.attackerRole,hurtAddRole}) then
		else
			local specialTime = hurtAddRole.specialSkillTime or 0
			if specialTime >= tonumber(skillInfo.special_num) then
			else
				local addRoleList = {}
				local num = #self.actionInfo.targetlist
				for i=1,num do
					local _targetInfo = self.actionInfo.targetlist[i]
					if _targetInfo.effect == 1 or _targetInfo.effect == 2 or _targetInfo.effect == 6 or _targetInfo.effect == 9 then
						local _targetRole = fightRoleMgr:GetRoleByGirdIndex(_targetInfo.targetpos)
						if _targetRole.currHp > 0 and fightRoleMgr:IsSameSide({_targetRole,hurtAddRole}) and  math.floor(_targetRole.currHp/_targetRole.maxhp*10000) < skillInfo.triggerSkill_rate then
							if specialTime < tonumber(skillInfo.special_num) then
								addRoleList[#addRoleList+1] = _targetRole
								specialTime = specialTime + 1
							end
						end
					end
				end
				if #addRoleList > 0 then
					-- {skillId = 0 , level = 0}
					fightRoundMgr:setHurtAddSkill( hurtAddRole ,{skillId = skillInfo.triggerSkill , level = skillInfo.level}, addRoleList )
				end
			end
		end
	end
		-- self:setHurtAddSkill(yuanHuRole, targetInfo)
end


function FightOutAction:AddHelpManualAction()
	local bManualAction = self.actionInfo.bManualAction or self.actionInfo.bAngerManualAction	
	if (bManualAction) then
		local attackRoleList = fightRoleMgr:getHasBuffRole(self.attackerRole.logicInfo.bEnemyRole, EnumFightBufferType.type_517)
		local targetRoleList = fightRoleMgr:getHasBuffRole(not self.attackerRole.logicInfo.bEnemyRole, EnumFightBufferType.type_518)
		for buffTypeId, bEnemyRole in pairs(EnumFightManualActionAttackBuff) do	
			for attackRole in attackRoleList:iterator() do
				if (self.actionInfo.attackerpos ~= attackRole.logicInfo.posindex) then
					local info = {}
					info.attackRole     = attackRole
					info.targetList     = {}
	
					local tempList = {}
					for targetRole in targetRoleList:iterator() do
						if (not tempList[targetRole.logicInfo.posindex] and fightRoleMgr:IsSelfTeam(self.actionInfo.attackerpos, targetRole.logicInfo.posindex) == bEnemyRole) then
							local buffInfo = targetRole:GetBuffByType(buffTypeId)
							if (buffInfo) then
								local skillBaseInfo = BaseDataManager:GetSkillBaseInfo({skillId = tonumber(buffInfo.config.value), level = buffInfo.config.level})
								if (skillBaseInfo) then
									local skillInfo = attackRole:getBuffSkill(skillBaseInfo)
									info.skillid        = {skillId = skillInfo.id, level = buffInfo.config.level}
								else
									info.skillid        = {skillId = tonumber(buffInfo.config.value), level = buffInfo.config.level}
								end
								table.insert( info.targetList, targetRole )
								tempList[targetRole.logicInfo.posindex] = true
							end
						end
					end
					fightRoundMgr:setHelpAttackAction_New( info )
					-- fightRoundMgr:SetBackAttackAction(attackRole, nil, info.skillid, 0, info.targetList)
				end
			end
		end
		--
		local buffInfo = self.attackerRole:GetBuffByType(EnumFightBufferType.type_94)
		if (buffInfo) then
			-- if (self.actionInfo.bManualAction) then
				local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.attackerRole.skillID)
				if (skillBaseInf and skillBaseInfo.replace_skill_id == self.actionInfo.skillid.skillId) then
					self.attackerRole:OnBuffTriggerByTypeInfo(buffInfo)
				end
			-- else
			-- 	self.attackerRole:OnBuffTriggerByTypeInfo(buffInfo)
			-- end		
		end
	end
end
return FightOutAction