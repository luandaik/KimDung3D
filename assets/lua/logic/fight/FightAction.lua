--
-- Author: Zippo
-- Date: 2013-12-05 20:02:30
--

local fightRoleMgr  = require("lua.logic.fight.FightRoleManager")
local fightRoundMgr  = require("lua.logic.fight.FightRoundManager")
local mapLayer  = require("lua.logic.fight.MapLayer")

local FightAction = class("FightAction")

function FightAction:ctor(actionInfo)
	self.actionInfo = actionInfo
	self.attackerRole = fightRoleMgr:GetRoleByGirdIndex(actionInfo.attackerpos)
	assert(self.attackerRole, "attackerpos" .. actionInfo.attackerpos .. "not find")

	
	self.bNormalAttack = false
	local skillDisplayID = 0
	if actionInfo.skillid.skillId == 0 then -- 普通攻击
		skillDisplayID = self.attackerRole.normalAttackSkillID
		if self.actionInfo.triggerType == 12 and self.attackerRole.hitRoleDisPlay and self.attackerRole.hitRoleDisPlay ~= 0 then
		-- print("skillDisplayID--->>",skillDisplayID)
			-- print("self.attackerRole.skillDisplayID--->>",self.attackerRole.skillDisplayID)
			skillDisplayID = self.attackerRole.skillDisplayID
		end
		-- print("skillDisplayID--->>",skillDisplayID)
		self.bNormalAttack = true
		local buffDisplayID = self:GetBuffDisplayId()
		if buffDisplayID ~= 0 then
			skillDisplayID = buffDisplayID
		end
	end

	local skillInfo = BaseDataManager:GetSkillBaseInfo(actionInfo.skillid)
	if skillInfo ~= nil and skillInfo.target_type == 3 then -- 横排技能
		self.bRowAttack = true
	else
		self.bRowAttack = false
	end

	if skillInfo ~= nil then
		skillDisplayID = skillInfo.display_id
		if FightManager.isReplayFight and skillInfo.hidden_skill == 3 then
			self.attackerRole:addRoleAnger( - skillInfo.trigger_anger )
			self.actionInfo.bAngerManualAction = true
		end
	end

	self.skillDisplayInfo = SkillDisplayData:objectByID(skillDisplayID)
	-- print("skillDisplayID 0000000000---->>",skillDisplayID)
	if self.skillDisplayInfo == nil then
		-- print("playskill:skillDisplayID----------->"..skillDisplayID.."not find")
		local armatureID = self.attackerRole.armatureID
		if self.bNormalAttack then
			self.skillDisplayInfo = SkillDisplayData:objectByID(armatureID-10000)
		else
			self.skillDisplayInfo = SkillDisplayData:objectByID((armatureID-10000)*100+1)
		end

		if self.skillDisplayInfo == nil then
			self.skillDisplayInfo = SkillDisplayData:objectByID(9999)
		end
	end

	if self.skillDisplayInfo.needMoveSameRow == 1 then
		self.bRowAttack = true
	end

	-- print("playskill:----------->skillid:"..actionInfo.skillid.."---->displayid:"..self.skillDisplayInfo.id)

	self.hitEffTimerIDList = TFArray:new()
	self.showBuffDelayTimerList = TFArray:new()
	self.extraEffTimerIDList = TFArray:new()
	self.bEnemyAllDie = self:IsEnemyAllDie()
	if self.actionInfo.buffList and #self.actionInfo.buffList > 0 then
		for i=1,#self.actionInfo.buffList do
			local buff = self.actionInfo.buffList[i]
			local buffInfo = SkillBufferData:objectByID(buff[6])
			if buff and buffInfo and buffInfo.gain_type == 1 then
				local targetRole = fightRoleMgr:GetRoleByGirdIndex(buff[2])
				if (targetRole) then
					self:AddBuffToTarget(targetRole,targetRole,buff[6],buff[7],0)
				end
			end
		end
	end
	self.actionInfo.buffList = self.actionInfo.buffList or {}
	if not FightManager.isReplayFight then
		self.actionInfo.buffList = {}
	end
end

function FightAction:dispose()
	print("FightAction:dispose-->")
	if self.actionInfo.triggerType == 12 and self.attackerRole then
		self.attackerRole:showSelfDisplay()
	end

	if self.xuliEffTimerID then
		TFDirector:removeTimer(self.xuliEffTimerID)
		self.xuliEffTimerID = nil
	end
	if self.specilTimerID then
		TFDirector:removeTimer(self.specilTimerID)
		self.specilTimerID = nil
	end

	-- if self.attackEffTimerID then
	-- 	TFDirector:removeTimer(self.attackEffTimerID)
	-- 	self.attackEffTimerID = nil
	-- end
	if self.attackEffTimerID then
		for k,v in pairs(self.attackEffTimerID) do
			TFDirector:removeTimer(v)
		end
		self.attackEffTimerID = nil
	end
	if self.hitTimerID then
		TFDirector:removeTimer(self.hitTimerID)
		self.hitTimerID = nil
	end
	if self.hitXuliEffTimerID  then
		TFDirector:removeTimer(self.hitXuliEffTimerID )
		self.hitXuliEffTimerID  = nil
	end
	if self.attackSoundTimerID then
		TFDirector:removeTimer(self.attackSoundTimerID)
		self.attackSoundTimerID = nil
	end
	if self.hitSoundTimerID then
		TFDirector:removeTimer(self.hitSoundTimerID)
		self.hitSoundTimerID = nil
	end


	local buffDelayTimerNum = self.showBuffDelayTimerList:length()
	for i=1,buffDelayTimerNum do
		TFDirector:removeTimer(self.showBuffDelayTimerList:objectAt(i))
	end
	self.showBuffDelayTimerList:clear()

	local hitEffTimerNum = self.hitEffTimerIDList:length()
	for i=1,hitEffTimerNum do
		TFDirector:removeTimer(self.hitEffTimerIDList:objectAt(i))
	end
	self.hitEffTimerIDList:clear()

	local extraEffTimerNum = self.extraEffTimerIDList:length()
	for i=1,extraEffTimerNum do
		TFDirector:removeTimer(self.extraEffTimerIDList:objectAt(i))
	end
	self.extraEffTimerIDList:clear()

	-- self.actionInfo.buffList = {}
end

function FightAction:GetBuffDisplayId()
	if self.actionInfo.targetlist == nil or #self.actionInfo.targetlist == 0 then
		return 0
	end

	local targetInfo = self.actionInfo.targetlist[1]
	targetInfo.triggerBufferID = targetInfo.triggerBufferID or 0
	if targetInfo.triggerBufferID > 0 then
		local buffConfig = SkillLevelData:getBuffInfo( targetInfo.triggerBufferID , targetInfo.triggerBufferLevel)
		if buffConfig ~= nil then
			return buffConfig.skill_display
		end
	end

	return 0
end

function FightAction:IsEnemyAllDie()
	if self.attackerRole.logicInfo.bEnemyRole then
		return false
	end


	local liveEnemyList = fightRoleMgr:GetAllLiveRole(true)
	local liveEnemyNum = liveEnemyList:length()
	if self.actionInfo.targetlist == nil then
		return false
	end
	local dieEnemyNum = 0
	local nTargetCount = #self.actionInfo.targetlist
	for i=1,nTargetCount do
		local targetInfo = self.actionInfo.targetlist[i]
		local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
		if targetRole ~= nil and targetRole:IsLive() and  targetRole.logicInfo.bEnemyRole then
			if targetInfo.effect == 1 or targetInfo.effect == 2 then --普通受击和暴击
				local dunHurt = targetRole:hasDunBuff()
				local currHp = targetRole.currHp + targetInfo.hurt + dunHurt
				if currHp <= 0 and (targetInfo.passiveEffect ~= 9 and targetInfo.passiveEffect ~= 25 and targetInfo.passiveEffect ~= 37 ) and targetRole:GetBuffByType(56) == nil then
					dieEnemyNum = dieEnemyNum + 1
				end
			end
		end
	end

	if dieEnemyNum >= liveEnemyNum then
		return true
	else
		return false
	end
end

function FightAction:Execute()
	if self.attackerRole == nil or self.attackerRole:IsLive(true) == false then
		-- FightManager:OnActionEnd()
		return false
	end
	if self.attackerRole.ispet then
		self.attackerRole.rolePanel:setVisible(true)
	end

	if self.actionInfo.targetlist == nil then
		-- FightManager:OnActionEnd()
		return false
	end

	local nTargetCount = #self.actionInfo.targetlist
	if nTargetCount == 0 then
		-- FightManager:OnActionEnd()
		return false
	end

	local targetRole = fightRoleMgr:GetRoleByGirdIndex(self.actionInfo.targetlist[1].targetpos)
	if targetRole == nil then
		-- FightManager:OnActionEnd()
		return false
	end

	fightRoleMgr:OnActionStart()

	self.attackerRole:OnAttackBuffTrigger()

	if self.actionInfo.triggerType == 5 then
		self.attackerRole:OnHelpAttackBuffTrigger()
	end
	if self.actionInfo.triggerType == 6 then
		self.attackerRole:OnHelpAttackBuffTrigger()
	end
	if self.bNormalAttack or self.attackerRole.ispet  then
		self:BeginAttack()
	else
		self:ShowSkillNameEff()
	end
	return true
end

function FightAction:ShowSkillNameEff()
	if not self.attackerRole.logicInfo.bEnemyRole then
		TFDirector:currentScene().mapLayer:ChangeDark(true)
	end
	
	local skillInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
	if skillInfo ~= nil and skillInfo.name ~= "" then
		TFDirector:currentScene().fightUiLayer:ShowSkillName(skillInfo.name, self.attackerRole.logicInfo.bEnemyRole)
	end
	TFAudio.playEffect("sound/effect/skill_ready.mp3", false)
	if skillInfo ~= nil and skillInfo.sound == 1 then
		RoleSoundData:playFightSoundByIndex(self.attackerRole.soundRoleId)
	end
	self.attackerRole:PlaySkillNameEffect()
end

function FightAction:AddAttackBuff()
	if self.actionInfo.targetlist == nil then
		return
	end

	for i=1,#self.actionInfo.targetlist do
		local targetInfo = self.actionInfo.targetlist[i]
		local targetRole = self:GetTargetRole(i)
		targetInfo.triggerBufferID = targetInfo.triggerBufferID or 0
		if targetInfo.triggerBufferID > 0 then
			local buffConfig = SkillLevelData:getBuffInfo( targetInfo.triggerBufferID , targetInfo.triggerBufferLevel)
			if buffConfig ~= nil and buffConfig.good_buff == 1 and not fightRoleMgr:IsSameSide({self.attackerRole, targetRole}) then
				if buffConfig.type ~= 56 then
					targetInfo.bHaveAddBuff = true
					local skillDisplay = self.skillDisplayInfo
					local showBuffDelayTime = skillDisplay.showBuffDelayTime
					if showBuffDelayTime == nil or showBuffDelayTime == 0 then
						if self:AddBuffToTarget(self.attackerRole,self.attackerRole, targetInfo.triggerBufferID,targetInfo.triggerBufferLevel) then
							self:AddBuffInfoToServer(self.attackerRole, self.attackerRole, targetInfo.triggerBufferID, 0)
						end
						return
					else
							
						local _showBuffDelayTimer = -1
						_showBuffDelayTimer = TFDirector:addTimer(showBuffDelayTime /FightManager.fightSpeed,1,nil,function ()
							if self:AddBuffToTarget(self.attackerRole,self.attackerRole, targetInfo.triggerBufferID,targetInfo.triggerBufferLevel) then
								self:AddBuffInfoToServer(self.attackerRole, self.attackerRole, targetInfo.triggerBufferID, 0)
							end
							if _showBuffDelayTimer then
								TFDirector:removeTimer(_showBuffDelayTimer)
								_showBuffDelayTimer = nil
							end
							return
						end)
						self.showBuffDelayTimerList:push(_showBuffDelayTimer)
					end
				end
			end
		end
	end
end

function FightAction:BeginAttack()
	local targetRole = self:GetTargetRole(1)
	self:AddAttackBuff()

	if self.actionInfo.triggerType == 12 and self.attackerRole.hitRoleDisPlay and self.attackerRole.hitRoleDisPlay ~= 0 then
		self.attackerRole:setTiHuanRole( self.attackerRole.hitRoleDisPlay )
	end

	if self.actionInfo.bBackAttack then
		self:ShowAttackAnim()
	elseif self.skillDisplayInfo.remote == 0 then
		self.attackerRole:MoveToRole(targetRole, self.skillDisplayInfo.moveDistance, self.skillDisplayInfo.beforeMoveAnim)
	elseif self.bRowAttack and self.attackerRole:IsSameRow(targetRole) == false then
		local pos = mapLayer.GetRowAttackPos(targetRole.logicInfo.posindex)
		self.attackerRole:MoveToPosition(pos.x, pos.y)
	elseif self.skillDisplayInfo.needMoveCenter then
		self.attackerRole:MoveToPosition(GameConfig.WS.width/2, GameConfig.WS.height/2-100)
	else
		self:ShowAttackAnim()
	end
end

function FightAction:ShowAttackAnim()
	--print("----------------------ShowAttackAnim->",self.skillDisplayInfo.attackAnim)
	local frozenBuff = self.attackerRole:GetBuffByType(79)
	if frozenBuff ~= nil and self.attackerRole:GetBuffByType(14) == nil then
		self.attackerRole:RemoveFrozenBuff()
	end
	self.attackerRole:PlayAttackAnim(self.bNormalAttack, self.skillDisplayInfo.attackAnim)

	self:skillTrigerAttack()

	self:ShowAttackerText()

	self:ShowXuliEff()

	self:ShowAttackEff()

	self:PlayAttackSound()

	self:ShowQianKunDaNuoYi()
	print("----------------------ShowAttackAnim->1111")
	self:showHitXuliEff()
	-- self:ShowAllHit()
	self:ShowSpecilEffect()
	self:AddRoleHitNumber()

	self:addSkillAngel()
	-- self:setHelpAttack()

end

function FightAction:setHurtAddBloodAction()
	local targetInfo = self.actionInfo.targetlist[1]
	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	-- local hurtAddRoleList hurtAddRole , skillInfo= fightRoundMgr:IsHaveHurtAddHpRole(targetRole)
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

function FightAction:setHelpAttack()
	if fightRoundMgr.helpAttackList and fightRoundMgr.helpAttackList:length() > 0 then
		for v in fightRoundMgr.helpAttackList:iterator() do
			fightRoundMgr:setHelpAttackAction_New( v )
		end
		fightRoundMgr.helpAttackList:clear()
	end
	if fightRoundMgr.backAddAttackList and fightRoundMgr.backAddAttackList:length() > 0 then
		for v in fightRoundMgr.backAddAttackList:iterator() do
			for i,buffId in ipairs(EnumFightEnemyEndAttackBuff) do
				fightRoundMgr:setHelpAttackActionByBuff_New( v ,buffId)
			end
			-- fightRoundMgr:setHelpAttackActionByBuff_New( v ,68)
		end
		fightRoundMgr.backAddAttackList:clear()
	end
end

function FightAction:skillTrigerAttack()
	if FightManager.isReplayFight then
		return
	end
	if not self:isSkillAction() then
		return
	end
	local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
	if skillBaseInfo == nil then
		return
	end
	if skillBaseInfo.effect_triger and skillBaseInfo.effect_triger ~= "" then
		effect_triger = GetAttrByString(skillBaseInfo.effect_triger)
		-- print("effect_triger --------------------->",effect_triger)
		if effect_triger then
			if effect_triger[3] or effect_triger[4] then
				local hasTriggerBuf = false
				local nTargetCount = #self.actionInfo.targetlist
				for i=1,nTargetCount do
					if self.actionInfo.targetlist[i].triggerBufferID ~= 0 then
						hasTriggerBuf = true
					end
				end
				-- fightRoundMgr.bUseBuff83 = (self.actionInfo.triggerType == EnumFightTriggerHurtType.type_12)
				if effect_triger[3] and effect_triger[3] ~= 0 then
					if hasTriggerBuf == true then
						fightRoundMgr:SetSkillTrgerSkillAction(self.attackerRole, {skillId = effect_triger[3],level = self.actionInfo.skillid.level},3)
					end
				end
				if effect_triger[4] and effect_triger[4] ~= 0 then
					if hasTriggerBuf == false then
						fightRoundMgr:SetSkillTrgerSkillAction(self.attackerRole, {skillId = effect_triger[4],level = self.actionInfo.skillid.level},4)
					end
				end
				-- fightRoundMgr.bUseBuff83 = nil
			end
		end
	end
end
function FightAction:isSkillAction()
	return self.actionInfo.skillid.skillId ~= 0
end
function FightAction:ShowAttackerText()
	if self.actionInfo.bBackAttack and not self:isSkillAction() then
		self.attackerRole:ShowFightText("fanji", 0)
	elseif self.actionInfo.targetlist[1].activeEffect == 8 then
		self.attackerRole:ShowFightText("ceji", 0)
	end
end

function FightAction:ShowXuliEff()
	local skillDisplay = self.skillDisplayInfo
	local xuliEffID = skillDisplay.xuliEff
	if xuliEffID == nil or xuliEffID == 0 then
		return
	end

	local effStartTime = skillDisplay.xuliEffTime
	if effStartTime ~= nil and effStartTime > 0 then
		self.xuliEffTimerID = TFDirector:addTimer(effStartTime / FightManager.fightSpeed, 1, nil, 
		function() 
			TFDirector:removeTimer(self.xuliEffTimerID)
			self.xuliEffTimerID = nil
			self.attackerRole:PlaySkillEffect(xuliEffID, 0, skillDisplay.xuliEffOffsetX, skillDisplay.xuliEffOffsetY)
		end)
	else
		self.attackerRole:PlaySkillEffect(xuliEffID, 0, skillDisplay.xuliEffOffsetX, skillDisplay.xuliEffOffsetY)
	end
end

function FightAction:ShowAttackEff()
	local skillDisplay = self.skillDisplayInfo
	local attackList = skillDisplay.attackEff
	if attackList == nil or #attackList == 0 then
		return
	end
	-- for i=1,#attackList do
	for i,v in ipairs(attackList) do
		self:_ShowAttackEff(i)
	end
end

function FightAction:_ShowAttackEff(index)
	local skillDisplay = self.skillDisplayInfo
	local attackEffID = skillDisplay.attackEff[index]
	if attackEffID == 0 then
		return
	end
	local effStartTime = 0
	if skillDisplay.attackEffTime then
		effStartTime = skillDisplay.attackEffTime[index] or skillDisplay.attackEffTime[1]
	end
	if effStartTime ~= nil and effStartTime > 0 then
		self.attackEffTimerID = self.attackEffTimerID or {}
		self.attackEffTimerID[index] = TFDirector:addTimer(effStartTime / FightManager.fightSpeed, 1, nil, 
		function() 
			TFDirector:removeTimer(self.attackEffTimerID[index])
			self.attackEffTimerID[index] = nil
			local nTargetCount = #self.actionInfo.targetlist
			local attackEffType = skillDisplay.attackEffType[index] or skillDisplay.attackEffType[1]
			if attackEffType ~= 4 then
				nTargetCount = 1
			end

			
			local attackEffOffsetX = 0
			if skillDisplay.attackEffOffsetX then
				attackEffOffsetX = skillDisplay.attackEffOffsetX[index] or skillDisplay.attackEffOffsetX[1]
			end

			local attackEffOffsetY = 0
			if skillDisplay.attackEffOffsetY then
				attackEffOffsetY = skillDisplay.attackEffOffsetY[index] or skillDisplay.attackEffOffsetY[1]
			end
			local attackRotation = true
			if skillDisplay.attackRotation then
				attackRotation = skillDisplay.attackRotation[index] or skillDisplay.attackRotation[1]
			end

			local flyEffRotate = skillDisplay.flyEffRotate
		
			for i=1,nTargetCount do
				local targetInfo = self.actionInfo.targetlist[i]
				local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
				self.attackerRole:PlaySkillEffect(attackEffID, attackEffType,attackEffOffsetX, attackEffOffsetY,1,attackRotation,targetRole, flyEffRotate)
			end
		end)
	else
		local nTargetCount = #self.actionInfo.targetlist
		local attackEffType = skillDisplay.attackEffType[index] or skillDisplay.attackEffType[1]
		if attackEffType ~= 4 then
			nTargetCount = 1
		end

		
		local attackEffOffsetX = 0
		if skillDisplay.attackEffOffsetX then
			attackEffOffsetX = skillDisplay.attackEffOffsetX[index] or skillDisplay.attackEffOffsetX[1]
		end

		local attackEffOffsetY = 0
		if skillDisplay.attackEffOffsetY then
			attackEffOffsetY = skillDisplay.attackEffOffsetY[index] or skillDisplay.attackEffOffsetY[1]
		end
		local attackRotation = true
		if skillDisplay.attackRotation then
			attackRotation = skillDisplay.attackRotation[index] or skillDisplay.attackRotation[1]
		end

		local flyEffRotate = skillDisplay.flyEffRotate

		for i=1,nTargetCount do
			local targetInfo = self.actionInfo.targetlist[i]
			local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
			self.attackerRole:PlaySkillEffect(attackEffID, attackEffType,attackEffOffsetX, attackEffOffsetY,1,attackRotation,targetRole, flyEffRotate)
		end
	end
end

function FightAction:PlayAttackSound()
	local skillDisplay = self.skillDisplayInfo
	local attackSoundID = skillDisplay.attackSound
	if attackSoundID == nil or attackSoundID == 0 then
		return
	end

	local soundFile = "sound/skill/"..attackSoundID..".mp3"
	local soundStartTime = skillDisplay.attackSoundTime
	if soundStartTime ~= nil and soundStartTime > 0 then
		self.attackSoundTimerID = TFDirector:addTimer(soundStartTime / FightManager.fightSpeed, 1, nil, 
		function() 
			TFDirector:removeTimer(self.attackSoundTimerID)
			self.attackSoundTimerID = nil
			TFAudio.playEffect(soundFile, false)
		end)
	else
		TFAudio.playEffect(soundFile, false)
	end
end

function FightAction:PlayHitSound(hitIndex)
	local skillDisplay = self.skillDisplayInfo
	local hitSoundID = skillDisplay.hitSound
	if hitSoundID == nil or hitSoundID == 0 then
		return
	end
	local dieSound = nil
	if self.bEnemyAllDie and hitIndex == self.hitCount then
		if hitSoundID >= 11 and hitSoundID <= 15 then
			dieSound = "sound/skill/1_die.mp3"
		elseif hitSoundID >= 21 and hitSoundID <= 23 then
			dieSound = "sound/skill/2_die.mp3"
		elseif hitSoundID >= 31 and hitSoundID <= 33 then
			dieSound = "sound/skill/3_die.mp3"
		elseif hitSoundID >= 41 and hitSoundID <= 43 then
			dieSound = "sound/skill/4_die.mp3"
		end
	end

	local soundFile = "sound/skill/"..hitSoundID..".mp3"
	local soundStartTime = skillDisplay.hitSoundTime
	if soundStartTime ~= nil and soundStartTime > 0 then
		self.hitSoundTimerID = TFDirector:addTimer(soundStartTime / FightManager.fightSpeed, 1, nil, 
		function() 
			TFDirector:removeTimer(self.hitSoundTimerID)
			self.hitSoundTimerID = nil
			TFAudio.playEffect(soundFile, false)
			if dieSound ~= nil then
				TFAudio.playEffect(dieSound, false)
			end
		end)
	else
		TFAudio.playEffect(soundFile, false)
		if dieSound ~= nil then
			TFAudio.playEffect(dieSound, false)
		end
	end
end

function FightAction:showHitXuliEff()
	local skillDisplay = self.skillDisplayInfo
	local hitXuliEffID = skillDisplay.hitXuliEff
	if hitXuliEffID == nil or hitXuliEffID == 0 then
		self:ShowAllHit()
		return
	end

	local effStartTime = skillDisplay.hitXuliEffTimeDelay

	if effStartTime ~= nil and effStartTime > 0 then
		self.hitXuliEffTimerID = TFDirector:addTimer(effStartTime / FightManager.fightSpeed, 1, nil,
		function()
			TFDirector:removeTimer(self.hitXuliEffTimerID )
			self.hitXuliEffTimerID = nil
			self:_showHitXuliEff()
		end)
	else
		self:_showHitXuliEff()
	end
end
function FightAction:_showHitXuliEff()

	local skillDisplay = self.skillDisplayInfo
	local hitXuliEffID = skillDisplay.hitXuliEff

	local hitXuliEffType = skillDisplay.hitXuliEffType or 0 
	local effStartTime = skillDisplay.hitXuliEffTime


	 --0攻击者身上播放 1屏幕中心播放 2打横排 3直线飞行单体 4直线飞行竖排 5攻击者脚下播放 6我方阵容中心播放 7敌方阵容中心播放 8屏幕中心置顶 9我方阵容中心置顶播放 10敌方阵容中心置顶播放 
	 --13被攻击者脚下播放(排除已方)
	if hitXuliEffType == 0 or hitXuliEffType == 5 or hitXuliEffType == 13 then
		-- local nTargetCount = #self.actionInfo.targetlist
		-- for i=1,nTargetCount do
		-- 	local targetInfo = self.actionInfo.targetlist[i]
		for i,targetInfo in ipairs(self.actionInfo.targetlist) do
			if (targetInfo.effect ~= EnumFightHurtEffect.effect_10) then
				local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
				if targetRole ~= nil then
					targetRole:PlaySkillEffect(hitXuliEffID, hitXuliEffType, skillDisplay.hitXuliEffOffsetX, skillDisplay.hitXuliEffOffsetY)
				elseif (CC_TARGET_PLATFORM == CC_PLATFORM_WIN32) then
					assert(false, "targetpos" .. targetInfo.targetpos .. "not find")
				end
			end
		end
	else
		local targetInfo = self.actionInfo.targetlist[1]
		local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
		if targetRole ~= nil then
			targetRole:PlaySkillEffect(hitXuliEffID, hitXuliEffType, skillDisplay.hitXuliEffOffsetX, skillDisplay.hitXuliEffOffsetY)
		else
			assert(false, "targetpos" .. targetInfo.targetpos .. "not find")
		end
	end
	self:ShowAllHit()
end


function FightAction:ShowAllHit()
	self:GetHitNumber()

	-- for i=1, self.hitCount do
	-- 	local hitTime = self.skillDisplayInfo["hitAnimTime"..i]
	-- 	if hitTime ~= nil and hitTime >= 0 then
	-- 		if hitTime > 0 then
	-- 			local hitTimerID = TFDirector:addTimer(hitTime / FightManager.fightSpeed, 1, nil, 
	-- 			function()
	-- 				print("self:ShowHit(i) ====111")
	-- 				TFDirector:removeTimer(hitTimerID)
	-- 				hitTimerID = nil
	-- 				self:ShowHit(i)
	-- 				self:PlayHitSound(i)
	-- 			end)

	-- 			self.hitTimerIDList:push(hitTimerID)
	-- 		else
	-- 			print("self:ShowHit(i) ====222")
	-- 			self:ShowHit(i)
	-- 			self:PlayHitSound(i)
	-- 		end
	-- 	end
	-- end
	self.hitAnimCompleteRoleNum = 0
	local temp_num = 1
	local function showhitDisplay(skillDisplayId)
		if (skillDisplayId ~= self.skillDisplayInfo.id) then
			return
		end
		if temp_num > self.hitCount then
			return
		end
		
		local oldtime = 0
		if temp_num ~= 1 then
			oldtime = self.skillDisplayInfo["hitAnimTime"..(temp_num-1)] or 0
		end
		local hitTime = self.skillDisplayInfo["hitAnimTime"..temp_num] or 0
		local  temp_time = hitTime - oldtime
		if temp_time ~= nil and temp_time >= 0 then
			if temp_time > 0 then
				if (self.hitTimerID) then
					TFDirector:removeTimer(self.hitTimerID)
					self.hitTimerID = nil
				end
				self.hitTimerID = TFDirector:addTimer(temp_time / FightManager.fightSpeed, 1, nil,
				function()
					TFDirector:removeTimer(self.hitTimerID)
					self.hitTimerID = nil
					self:ShowHit(temp_num)
					self:PlayHitSound(temp_num)
					temp_num = temp_num + 1
					showhitDisplay(self.skillDisplayInfo.id)
				end)
			
			else
				self:ShowHit(temp_num)
				self:PlayHitSound(temp_num)
				temp_num = temp_num + 1
				showhitDisplay(self.skillDisplayInfo.id)
			end
		end
	end
	showhitDisplay(self.skillDisplayInfo.id)
	self:showYuanHuDisplay()
end

function FightAction:GetHitCount()
	self.hitCount = 0
	local nMaxHitCount = 10
	for i=1,nMaxHitCount do
		local hitTime = self.skillDisplayInfo["hitAnimTime"..i]
		if hitTime ~= nil and hitTime >= 0 then
			if i > 1 then
				local preTime = self.skillDisplayInfo["hitAnimTime"..i-1]
				if hitTime <= preTime then
					assert(false)
					break
				end
			end

			self.hitCount = self.hitCount + 1
		end
	end
end



function FightAction:AddHelpManualAction()
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
				-- self.attackerRole:OnBuffTriggerByTypeInfo(buffInfo)
			-- end
		end
	end
end

function FightAction:AddRoleHitNumber()

	local nTargetCount = #self.actionInfo.targetlist
	for i=1,nTargetCount do
		local targetInfo = self.actionInfo.targetlist[i]
		local totalHurt = targetInfo.hurt
		if totalHurt < 0 then
			local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
			targetRole:addBeHurtNum()
		end
	end
end

function FightAction:GetHitNumber()
	self:GetHitCount()

	local hurtCount = self.hitCount
	if hurtCount == 0 then
		assert(false)
		return
	end

	local nTargetCount = #self.actionInfo.targetlist
	for i=1,nTargetCount do
		local totalHurt = self.actionInfo.targetlist[i].hurt
		local activeEffect = self.actionInfo.targetlist[i].activeEffect
		if activeEffect then
			if activeEffect == 26 then
				local targetRole = fightRoleMgr:GetRoleByGirdIndex(self.actionInfo.targetlist[i].targetpos)
				if targetRole then
					totalHurt = -targetRole.currHp
				end
			elseif activeEffect == 32 then
				self.actionInfo.targetlist[i].hurt = self.actionInfo.targetlist[i].hurt - self.actionInfo.targetlist[i].activeEffectValue
				totalHurt = self.actionInfo.targetlist[i].hurt
			elseif activeEffect == 33 then
				self.actionInfo.targetlist[i].hurt = self.actionInfo.targetlist[i].hurt - self.actionInfo.targetlist[i].activeEffectValue
				totalHurt = self.actionInfo.targetlist[i].hurt
			end
		end
		local singleHurt = math.floor(totalHurt/hurtCount)
		
		self.actionInfo.targetlist[i].hurtList = {}
		if hurtCount == 1 then
			self.actionInfo.targetlist[i].hurtList[1] = totalHurt
		else
			local nHurtLeft = totalHurt
			for j=1,hurtCount-1 do
				if singleHurt < 0 then
					local _singleHurt = math.abs(singleHurt)
					self.actionInfo.targetlist[i].hurtList[j] = 0-math.floor(math.random(_singleHurt*0.8, _singleHurt))
				else
					self.actionInfo.targetlist[i].hurtList[j] = math.floor(math.random(singleHurt*0.8, singleHurt))
				end
				nHurtLeft = nHurtLeft - self.actionInfo.targetlist[i].hurtList[j]
			end

			if totalHurt < 0 and nHurtLeft > 0 then
				nHurtLeft = 0 
			end

			self.actionInfo.targetlist[i].hurtList[hurtCount] = nHurtLeft
		end
	end
end

function FightAction:ShowHitEff(targetRole, targetIndex)
	if targetRole == nil then
		return
	end
	local hitEffList = self.skillDisplayInfo.hitEff
	if hitEffList == nil or #hitEffList == 0 then
		return
	end
	for i=1,#hitEffList do
		self:_ShowHitEff(targetRole, i ,targetIndex)
	end
end

function FightAction:_ShowHitEff(targetRole,index,targetIndex )
	local skillDisplay = self.skillDisplayInfo
	local hitEffID = skillDisplay.hitEff[index]
	if hitEffID == 0 then
		return
	end
	local effStartTime = 0
	if skillDisplay.hitEffTime then
		effStartTime = skillDisplay.hitEffTime[index] or skillDisplay.hitEffTime[1]
	end

	local hitEffType = 0
	if skillDisplay.hitEffType then
		hitEffType = skillDisplay.hitEffType[index] or skillDisplay.hitEffType[1]
	end
	local hitEffOffsetX = 0
	if skillDisplay.hitEffOffsetX then
		hitEffOffsetX = skillDisplay.hitEffOffsetX[index] or skillDisplay.hitEffOffsetX[1]
	end
	local hitEffOffsetY = 0
	if skillDisplay.hitEffOffsetY then
		hitEffOffsetY = skillDisplay.hitEffOffsetY[index] or skillDisplay.hitEffOffsetY[1]
	end
	local effectScale = 1
	if skillDisplay.effectScale then
		_effectScale = skillDisplay.effectScale[targetIndex] or skillDisplay.effectScale[1]
		if type(_effectScale) == "table" then
			effectScale = _effectScale[index] or _effectScale[1]
		else
			effectScale = tonumber(_effectScale)
		end
	end
	local hitRotation = true
	if skillDisplay.hitRotation then
		hitRotation = skillDisplay.hitRotation[targetIndex] or skillDisplay.hitRotation[1]
	end
	if effStartTime ~= nil and effStartTime > 0 then
		local effTimerID = -1
		effTimerID = TFDirector:addTimer(effStartTime / FightManager.fightSpeed, 1, nil, 
		function() 
			TFDirector:removeTimer(effTimerID)
			effTimerID = nil

			targetRole:PlaySkillEffect(hitEffID, hitEffType, hitEffOffsetX, hitEffOffsetY,effectScale,hitRotation)
		end)
		self.hitEffTimerIDList:push(effTimerID)
	else
		targetRole:PlaySkillEffect(hitEffID, hitEffType, hitEffOffsetX, hitEffOffsetY,effectScale,hitRotation)
	end
end

function FightAction:showYuanHuDisplay()
	local nTargetCount = #self.actionInfo.targetlist
	for i=1,nTargetCount do
		local targetInfo = self.actionInfo.targetlist[i]
		if targetInfo.effect == 9 then
			local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
			-- local _targetInfo = self.actionInfo.targetlist[targetInfo.activeEffect]
			local helpTargetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.activeEffect)
			local movePos = helpTargetRole:getPosition()
			if (targetInfo.activeEffectValue and targetInfo.activeEffectValue == EnumFightActiveEffectType.effect_68) then
				helpTargetRole:addYuanHuEffect()
				movePos = targetRole:getPosition()
			end
			targetRole:PlayYuanHuAnim(movePos)
		end
	end
end
function FightAction:ShowHit(hitIndex)
	-- self.hitAnimCompleteRoleNum = 0

	local bLastHit = (hitIndex == self.hitCount)
	if FightManager.fightBeginInfo and FightManager.fightBeginInfo.bSkillShowFight then
	else
		if self.bEnemyAllDie and bLastHit then
			if self.skillDisplayInfo.zoomIn == 0 then
				TFDirector:currentScene():ZoomIn(self.attackerRole)
			end
			fightRoleMgr:SetAllRoleSpeed(0.5)
			TFDirector:currentScene().fightUiLayer:PlayFightEndEffect()
		end
	end

	local attackAddEnger 	= 0
	local hitAddEnger 		= 0
	local attackRedEnger 	= 0
	local hit_benemy 		= not self.attackerRole.logicInfo.bEnemyRole
	local nTargetCount 		= #self.actionInfo.targetlist
	local needAddRedAnger 	= false
	local needRemoveIndex 	= 0
	local tempRemoveBuffTag = false
	if (hitIndex == 1) then
		if (FightManager.log_fileName or AutoTestManager.isAutoTest) then
			local act = "  阵位: "..self.attackerRole.logicInfo.posindex.." "..self.attackerRole.logicInfo.name.."-->技能: "..self.actionInfo.skillid.skillId
			local actionCount = FightManager:GetFightCurrActionCount()
			Lua_fightWriteFile(EnumFight_Log.HP, nil, "动作: "..actionCount, act)
			AutoTestManager:addFightLog(EnumFight_Log.HP, "动作: "..actionCount, act)
		end
		self:AddHelpManualAction();
	end
	--
	for i=1,nTargetCount do
		local targetInfo = self.actionInfo.targetlist[i - needRemoveIndex]
		local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
		if targetInfo.hurtList[hitIndex] == nil then
			targetInfo.hurtList[hitIndex] = 0
		end
		local bHurtSkill 	= false
		
		if targetInfo.effect == EnumFightHurtEffect.effect_1 or targetInfo.effect == EnumFightHurtEffect.effect_2 then
			if targetInfo.hurt < 0 then
				bHurtSkill = true
			elseif self.actionInfo.skillid.skillId ~= 0 and targetRole:GetBuffByType(64) then
				bHurtSkill = true
				if bLastHit then
					targetRole:OnBuffTriggerByType(64)
				end
			end
		elseif targetInfo.effect == EnumFightHurtEffect.effect_4 then
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
		if hitIndex == 1 then
			if bHurtSkill  then
				targetRole:RemoveBuffByType(15)
				targetRole:RemoveBuffByType(EnumFightBufferType.type_520)
			end
		end

		if targetInfo.effect == 1 or targetInfo.effect == 2 or targetInfo.effect == 7 then --普通受击和暴击 7:主动加buff 
			needAddRedAnger = true
			local fightText = ""
			if targetInfo.effect == 2 then
				fightText = "baoji"
			end

			local bBezier = false
			if bHurtSkill and fightText ~= "baoji" then
				bBezier = true
			end

			if (hitIndex == 1 and self.actionInfo.triggerType ~= 5) then
				self:ShowActiveEffect(targetInfo)
			end
			
			fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex ,targetInfo.hurtList[hitIndex])
			if targetInfo.passiveEffect == 25 or targetInfo.passiveEffect == 37 then
				targetRole:ShowFightText(fightText, 0, false, false, bBezier)
			else
				targetRole:ShowFightText(fightText, targetInfo.hurtList[hitIndex], false, false, bBezier)
			end
			if hitIndex > 1 and self.skillDisplayInfo.hitEffShowOnce then
			else
				self:ShowHitEff(targetRole, i)
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
							if not FightManager.isReplayFight then
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
							else
								if self.actionInfo.buffList and #self.actionInfo.buffList > 0 then
									for i=1,#self.actionInfo.buffList do
										local buff = self.actionInfo.buffList[i]
										if buff[6] == tonumber(hitBuff.config.value) and buff[2] == self.attackerRole.logicInfo.posindex and buff[1] == targetRole.logicInfo.posindex then
											self:AddBuffToTarget(targetRole,self.attackerRole, tonumber(hitBuff.config.value),hitBuff.config.buff_level)
										end
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
					hit_benemy = targetRole.logicInfo.bEnemyRole
					targetRole:addRoleAnger(ConstantData:getValue("KillIdea.HitAnger"))
					if self.actionInfo.bBackAttack then
						if targetRole:IsLive() then
							attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.BackAttackAnger"))
						else
							attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.BackAttackAnger"))
							attackAddEnger = attackAddEnger + ConstantData:getValue("Fight.BackAttackDieAnger")
							self.attackerRole:addRoleAnger( ConstantData:getValue("KillIdea.BackAttackDieAnger"))
						end
					else
						if self.bNormalAttack then
							if targetRole:IsLive() then
								attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.AttackAnger"))
							else
								attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.AttackAnger"))
								attackAddEnger = attackAddEnger + ConstantData:getValue("Fight.AttackDieAnger")
								self.attackerRole:addRoleAnger( ConstantData:getValue("KillIdea.AttackDieAnger"))
							end
						else
							if targetRole:IsLive() then
								attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.SkillAttackAnger"))
							else
								attackAddEnger = math.max(attackAddEnger,ConstantData:getValue("Fight.SkillAttackAnger"))
								attackAddEnger = attackAddEnger + ConstantData:getValue("Fight.SkillAttackDieAnger")
								self.attackerRole:addRoleAnger( ConstantData:getValue("KillIdea.SkillAttackDieAnger"))
							end
						end
					end
				end
			end

			if bLastHit then
				self:ShowPassiveEffect(targetInfo)
				self:showTriggerSkill(targetInfo)
				self:setHitRole(targetRole)
				if bHurtSkill then
					self:ShowBuffPassiveEffect(targetRole)
				end
			end

			if bHurtSkill and not self.bNormalAttack and not self.attackerRole.logicInfo.bEnemyRole then
				if self.skillDisplayInfo.shake ~= nil then
					local shake = self.skillDisplayInfo.shake
					TFDirector:currentScene().mapLayer:Shake(shake,shake)
				else
					if self.skillDisplayInfo.remote == 0 then
						TFDirector:currentScene().mapLayer:Shake(6,6)
					else
						TFDirector:currentScene().mapLayer:Shake(3,3)
					end
				end
			end

			if bHurtSkill then
				if (bLastHit) then
					self.hitAnimCount = self.hitAnimCount or {}
					self.hitAnimCount[targetInfo.targetpos] = self.hitAnimCount[targetInfo.targetpos] or -1
					self.hitAnimCount[targetInfo.targetpos] = self.hitAnimCount[targetInfo.targetpos] + 1
				end
				targetRole:PlayHitAnim(bLastHit)
			else
				if bLastHit then
					self:OnRoleHitAnimComplete()
				end
			end

		elseif targetInfo.effect == 3 then --闪避
			if hitIndex == 1 then
				targetRole:ShowFightText("shanbi", 0)
				if self.actionInfo.bBackAttack == nil or self.actionInfo.bBackAttack == false then
					targetRole:DoAvoidAction()
					self:showTriggerSkill(targetInfo)
				end
				self:setHitRole(targetRole)
			end

			if bLastHit then
				if targetRole:GetBuffByType(84) then
					targetRole:OnBuffTriggerByType(84)
				end
				self:ShowPassiveEffect(targetInfo)
				self:OnRoleHitAnimComplete()
			end

		elseif targetInfo.effect == 4 then --治疗加血 
			needAddRedAnger = true
			if targetInfo.hurtList[hitIndex] and targetRole:getCurrHp() > 0 then
				fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex ,targetInfo.hurtList[hitIndex])
				targetRole:ShowFightText("", math.floor(targetInfo.hurtList[hitIndex]))
			end
			self:ShowHitEff(targetRole, i)

			if hitIndex == 1 then
				self:ShowActiveEffect(targetInfo)
			end

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
				--
				if ((i - needRemoveIndex) == 1) then
					local skillInfo = targetRole:GetTriggerBySkillHurtType(self.attackerRole.skillID, EnumFightTriggerHurtType.type_18, false)
					if (skillInfo) then
						self.attackerRole:addTriggerSkillCount(self.attackerRole.skillID.skillId, -1)
					end
				end
				--
				self:showTriggerSkill(targetInfo)
				self:OnRoleHitAnimComplete()
			end

		elseif targetInfo.effect == 5 then --净化，去除目标所有减益buff 
			needAddRedAnger = true
			self:ShowHitEff(targetRole, i)
			if hitIndex == 1 then
				targetRole:CleanBuff(self.attackerRole)
				self:ShowActiveEffect(targetInfo)
			end

			if bLastHit then
				self:showTriggerSkill(targetInfo)
				self:OnRoleHitAnimComplete()
			end

		elseif targetInfo.effect == 6 then --乾坤挪移 
			-- needAddRedAnger = true
			if hitIndex == 1 then
				fightRoundMgr:SetDzxyAttackAction(targetRole, self.attackerRole, targetInfo.hurt)
				targetRole:ShowFightText("shanbi", 0)
				targetRole:DoAvoidAction()
				targetRole:OnBuffTriggerByType(27)
				targetInfo.hurt = 0
			end

			if bLastHit then
				self:OnRoleHitAnimComplete()
			end
		elseif targetInfo.effect == 8 then --额外的加buff 
			needAddRedAnger = true
			if targetRole:IsLive() then
				if bLastHit then
					self:ShowExtraBuffEff(targetRole, i)
					targetInfo.triggerBufferID = targetInfo.triggerBufferID or 0
					if targetInfo.triggerBufferID > 0 and targetInfo.bHaveAddBuff ~= true and bLastHit then
						local buffConfig = SkillLevelData:getBuffInfo( targetInfo.triggerBufferID , targetInfo.triggerBufferLevel)
						if buffConfig ~= nil then
							if self:AddBuffToTarget(self.attackerRole, targetRole, targetInfo.triggerBufferID, targetInfo.triggerBufferLevel,targetInfo.hurt) then
								self:AddBuffInfoToServer(self.attackerRole, targetRole, targetInfo.triggerBufferID, 0)
							end
						end
					end
					self:OnRoleHitAnimComplete()
				end
			else
				table.remove(self.actionInfo.targetlist , i)
				needRemoveIndex = needRemoveIndex + 1
			end			
		elseif targetInfo.effect == 9 then 
			needAddRedAnger = true
			if hitIndex == 1 then
				local bBezier = false
				targetRole:OnBuffTrigger(6)
				fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex ,targetInfo.hurt)
				if targetRole.isYuanHuAction then
					if (targetRole:GetTriggerBySkillHurtType(targetRole.skillID, EnumFightTriggerHurtType.type_18, false)) then
						targetRole:addTriggerSkillCount(targetRole.skillID.skillId, 1)
						--targetRole:addYuanHuEffect()
					end
					targetRole:ShowFightText("", targetInfo.hurt, false, false, bBezier)
				else
					targetRole:ShowFightText("", targetInfo.hurt, false, true, bBezier)
				end
				self:ShowPassiveEffect(targetInfo)
				self:showTriggerSkill(targetInfo)
			end
			if bLastHit then
				self:OnRoleHitAnimComplete()
			end
		elseif targetInfo.effect == 10 then 
			local bBezier = false
			local isTemp = true
			if (hitIndex == 1) then
				if (targetInfo.tagBuffId) then
					if (not targetRole:IsLive() or not targetRole:GetBuffByType(targetInfo.tagBuffId)) then
						table.remove(self.actionInfo.targetlist , i - needRemoveIndex)
						needRemoveIndex = needRemoveIndex + 1
						isTemp = false
					end
				end
			end
			if (isTemp) then
				targetRole:ShowFightText("", targetInfo.hurtList[hitIndex], false, true, bBezier)
				if bLastHit then
					self:ShowPassiveEffect(targetInfo)
					self:OnRoleHitAnimComplete()
				end
			end
		elseif targetInfo.effect == 11 then --治疗加血 
			if hitIndex == 1 then
				targetRole:fuHuoActionEnd()
			end
			-- fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex ,targetInfo.hurtList[hitIndex])
			targetRole:ShowFightText("", math.floor(targetInfo.hurtList[hitIndex]))
			self:ShowHitEff(targetRole, i)

			if hitIndex == 1 then
				self:ShowActiveEffect(targetInfo)
			end

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
				self:OnRoleHitAnimComplete()
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
			needAddRedAnger = (true and not targetInfo.isExtra)
			if hitIndex == 1 then
				targetRole:CleanBuff(self.attackerRole)	
			end
			if targetInfo.hurtList[hitIndex] and targetRole:getCurrHp() > 0 then
				fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex ,targetInfo.hurtList[hitIndex])
				targetRole:ShowFightText("", math.floor(targetInfo.hurtList[hitIndex]))
			end
			if not targetInfo.isExtra then
				self:ShowHitEff(targetRole, i)
			end

			if hitIndex == 1 then
				targetRole:CleanBuff(self.attackerRole)
				self:ShowActiveEffect(targetInfo)
			end

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
				self:showTriggerSkill(targetInfo)
				self:OnRoleHitAnimComplete()
				--
				if (i == 1) then
					local skillInfo = targetRole:GetTriggerBySkillHurtType(self.attackerRole.skillID, EnumFightTriggerHurtType.type_18, false)
					if (skillInfo) then
						self.attackerRole:addTriggerSkillCount(self.attackerRole.skillID.skillId, -1)
					end
				end
			end
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
		-- fightRoleMgr:AddAnger(self.attackerRole.bEnemyRole,num)
	end
	if bLastHit and attackRedEnger ~= 0 then
		self.attackerRole:addRoleAnger(attackRedEnger)
		-- fightRoleMgr:AddAnger(self.attackerRole.bEnemyRole,num)
	end
	if bLastHit and hitAddEnger ~= 0 then
		fightRoleMgr:AddAnger( hit_benemy,hitAddEnger,true)
	end
end



function FightAction:ShowExtraBuffEff(targetRole, targetIndex)
	if targetRole == nil then
		return
	end
	if self.skillDisplayInfo.extraShowHit then
		self:ShowHitEff(targetRole, targetIndex)
		return
	end

	local extraEffList = self.skillDisplayInfo.extraEff
	if extraEffList == nil or #extraEffList == 0 then
		return
	end
	-- for i=1,#extraEffList do
	for i,v in ipairs(extraEffList) do
		self:_ShowExtraEff(targetRole,i)
	end
end

function FightAction:_ShowExtraEff(targetRole,index )
	local skillDisplay = self.skillDisplayInfo
	local extraEffID = skillDisplay.extraEff[index]
	if extraEffID == 0 then
		return
	end
	local effStartTime = 0
	if skillDisplay.extraEffTime then
		effStartTime = skillDisplay.extraEffTime[index] or skillDisplay.extraEffTime[1]
	end

	local extraEffType = 0
	if skillDisplay.extraEffType then
		extraEffType = skillDisplay.extraEffType[index] or skillDisplay.extraEffType[1]
	end
	local extraEffOffsetX = 0
	if skillDisplay.extraEffOffsetX then
		extraEffOffsetX = skillDisplay.extraEffOffsetX[index] or skillDisplay.extraEffOffsetX[1]
	end
	local extraEffOffsetY = 0
	if skillDisplay.extraEffOffsetY then
		extraEffOffsetY = skillDisplay.extraEffOffsetY[index] or skillDisplay.extraEffOffsetY[1]
	end

	if effStartTime ~= nil and effStartTime > 0 then
		local effTimerID = -1
		effTimerID = TFDirector:addTimer(effStartTime / FightManager.fightSpeed, 1, nil, 
		function() 
			TFDirector:removeTimer(effTimerID)
			effTimerID = nil

			targetRole:PlaySkillEffect(extraEffID, extraEffType, extraEffOffsetX, extraEffOffsetY)
		end)
		self.extraEffTimerIDList:push(effTimerID)
	else
		targetRole:PlaySkillEffect(extraEffID, extraEffType, extraEffOffsetX, extraEffOffsetY)
	end
end



function FightAction:CalculateInBufferTriggerRate(attackerRole,targetRole,config)
	if config == nil or config.value == "" then
		return 0
	end

	local bufferInfo = SkillBufferData:objectByID(tonumber(config.value))
	local bufRateSuppress = 0
	if bufferInfo.good_buff == 0 then
		if FightManager.fightBeginInfo.fighttype == 5 then
			bufRateSuppress = ClimbManager:getBufRateSuppress( attackerRole.logicInfo.bEnemyRole,targetRole.logicInfo.bEnemyRole )*100
			print("无量山战力压制 buff增加几率 = ",bufRateSuppress)
		elseif FightManager.fightBeginInfo.fighttype == 16 then
			bufRateSuppress = NorthClimbManager:getBufRateSuppress( attackerRole.logicInfo.bEnemyRole,targetRole.logicInfo.bEnemyRole )*100
			print("无量山战力压制 buff增加几率 = ",bufRateSuppress)
		end
	end


	local formula = config.buff_formula
	if formula == nil or formula == 0 then
		local result = config.buff_rate + bufRateSuppress
		print(" buff几率 = ",result)
		return result
	elseif formula == 1 then
		--[[
		角色技能：封印技能添加受技能等级影响的命中率计算规则。
		封印技能命中率 = （1-（目标等级- 技能等级）* 0.1） * 基础命中率（表格配置） 
		其中：7≥(目标等级 - 技能等级）≥-20
		命中率：从 30%-100% 之间波动
		]]
		local tmp = (targetRole.logicInfo.level - config.buff_level)
		tmp = math.min(7,tmp)
		tmp = math.max(-20,tmp)
		local result =(1 -  tmp * 0.1) * config.buff_rate + bufRateSuppress
			print(" buff几率 = ",result)
		return result
	end
end
--被动效果:反弹5 反击6 化解7 复活9 免疫12 受击加血50 表现
function FightAction:ShowPassiveEffect(targetInfo)
	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	if targetRole == nil then
		return
	end

	local effect = targetInfo.passiveEffect
	local effectValue = targetInfo.passiveEffectValue
	if effect == 3 then
		fightRoleMgr:AddAnger(targetRole.logicInfo.bEnemyRole, effectValue)
		if not targetRole.logicInfo.bEnemyRole then
			TFDirector:currentScene().fightUiLayer:AddAngerEffect(2)
		end
	elseif effect == 5 then
		fightRoleMgr:addHurtReport(targetInfo.targetpos ,  -effectValue)
		self.attackerRole:ShowFightText("", -effectValue)
		self.attackerRole:ShowEffectName("fantan")
		local Buff = targetRole:GetBuffByType(EnumFightBufferType.type_19)
		if (Buff and Buff.config.last_type == EnumFightBuffLastType.last_Type_3) then
			targetRole:OnBuffTriggerByTypeInfo(Buff)
		end	
	elseif effect == 6 and self.actionInfo.skillid.skillId == 0 then
		fightRoundMgr:SetBackAttackAction(targetRole, self.attackerRole)
	elseif effect == 7 then
		targetRole:ShowEffectName("huajie")
		local msBuff = targetRole:GetBuffByType(32)
		if msBuff then
			targetRole:OnBuffTriggerByType(32)
		end
	elseif effect == 9 then 	
		--这里校验是否真的复活
		--modify by wkdai
		local reallyRelive = false
		if targetRole:IsLive() == false then
			reallyRelive = targetRole:ReLive(effectValue)
		end
		if not reallyRelive then
			targetInfo.passiveEffect = 0;
			targetInfo.passiveEffectValue = 0;
		else
			local skillID = targetRole:getAngerSkill()
			if skillID and skillID.skillId > 0 then
				targetRole:addTriggerSkillCount(skillID.skillId, 1)
				if (targetRole:getTriggerSkillCountBySkill(skillID.skillId) < 2) then
					targetRole.haveRelive = false
				end
			end
		end
	elseif effect == 25 then
		targetInfo.hurt = 0
		targetRole:AddBodyEffect("biqi_up", false)
		targetRole:AddBodyEffect("biqi_buttom", false,true)
	elseif effect == 37 then
		targetInfo.hurt = 0
		targetRole:CleanBuff(targetRole)
		targetRole:AddBodyEffect("miansi_2", false)
		local effectRole = fightRoleMgr:GetRoleByGirdIndex(effectValue)
		if effectRole then
			effectRole:AddBodyEffect("miansi_1", false)
			effectRole._specialSkillTime = effectRole._specialSkillTime or 0
			effectRole.specialSkillTime = effectRole.specialSkillTime or 0
			effectRole._specialSkillTime = effectRole._specialSkillTime - 1
			effectRole.specialSkillTime = effectRole.specialSkillTime + 1
			local  skillInfo = effectRole:getTrigerHurtMianyiEffectSkillId(37)
			if skillInfo and skillInfo.buff_id then
				if self:AddBuffToTarget(effectRole,targetRole, skillInfo.buff_id,skillInfo.level) then
					self:__AddBuffInfoToServer(effectRole, targetRole,skillInfo.id,skillInfo.level ,skillInfo.buff_id, 0)
				end
			end
		end
		
	elseif effect == 36 then
		targetInfo.passiveEffect = 0
		targetRole.beHurtNum = 0
	elseif effect == 12 then
		targetRole:ShowEffectName("mianyi")
	elseif effect == 50 then
		if targetRole:IsLive() then

			fightRoleMgr:addHurtReport(targetInfo.targetpos ,  effectValue)
			targetRole:ShowFightText("", effectValue)
			targetRole:OnBuffTriggerByType(30)

		end
	elseif effect == 38 then
	elseif effect == 39 then
		if targetRole:IsLive() then
			targetRole:ShowFightText("", effectValue)
		end
	end
end

function FightAction:showTriggerSkill(targetInfo)
	self:_showTriggerSkill(targetInfo)
	self:showActiveTriggerSkill(targetInfo)
	self:showActiveTriggerSkill_mrll(targetInfo)
end
function FightAction:_showTriggerSkill(targetInfo)
	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	if targetRole == nil then
		return
	end
	if targetInfo.triggerSkillType ==nil or targetInfo.triggerSkillType == 0 or targetInfo.triggerSkillType == 12 then
		return
	end
	if targetInfo.triggerSkillType == 8 then
		targetRole.beHurtNum = 0
	end
	-- print("targetInfo.triggerSkill = ",targetInfo.triggerSkill)
	local buff = targetRole:getBuffByTriggerSkillId(targetInfo.triggerSkill.skillId)
	-- print("targetInfo.triggerSkill  buff= ",buff)
	if buff then
		targetRole:OnBuffTriggerByType(buff.config.type)
	end
	fightRoundMgr:SetBackAttackAction(targetRole, self.attackerRole,targetInfo.triggerSkill,targetInfo.triggerSkillType)
end

function FightAction:showActiveTriggerSkill(targetInfo)

	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	if targetInfo.activeTriggerSkillType ==nil or targetInfo.activeTriggerSkillType == 0 or targetInfo.activeTriggerSkillType == 12 then
		return
	end
	local buff = self.attackerRole:getBuffByTriggerSkillId(targetInfo.activeTriggerSkill.skillId)
	-- print("targetInfo.activeTriggerSkill  buff= ",buff)
	if buff then
		self.attackerRole:OnBuffTriggerByType(buff.config.type)
	end
	fightRoundMgr:SetBackAttackAction(self.attackerRole, targetRole,targetInfo.activeTriggerSkill,targetInfo.activeTriggerSkillType,true)
	-- fightRoundMgr:SetSkillTrgerSkillAction(self.attackerRole, targetInfo.activeTriggerSkill,targetInfo.activeTriggerSkillType)
	-- fightRoundMgr:SetBackAttackAction(attackerRole, self.attackerRole,targetInfo.activeTriggerSkill,targetInfo.activeTriggerSkillType)
end
--慕容龙城
function FightAction:showActiveTriggerSkill_mrll(targetInfo)

	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	if targetRole == nil then
		return
	end
	if targetInfo.triggerSkillType == nil or targetInfo.triggerSkillType ~= 12 then
		return
	end
	-- local buff = targetRole:GetBuffByType(83)
	-- -- print("targetInfo.activeTriggerSkill  buff= ",buff)
	-- if buff then
	-- 	targetRole:OnBuffTriggerByType(buff.config.type)
	-- end
	fightRoundMgr:SetBackAttackAction(targetRole, self.attackerRole,targetInfo.triggerSkill,targetInfo.triggerSkillType)
end

--主动效果:吸怒1 减敌怒2 增己怒3 吸血4 侧击8 净化10 致死11 七伤拳21 表现
function FightAction:ShowActiveEffect(targetInfo)
	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	if targetRole == nil then
		return
	end

	local effect = targetInfo.activeEffect
	local effectValue = targetInfo.activeEffectValue
	if effect == 1 then
		fightRoleMgr:AddAnger(targetRole.logicInfo.bEnemyRole, -effectValue)
		fightRoleMgr:AddAnger(self.attackerRole.logicInfo.bEnemyRole, effectValue)
		self.attackerRole:ShowEffectName("xinu")
		if not self.attackerRole.logicInfo.bEnemyRole then
			TFDirector:currentScene().fightUiLayer:AddAngerEffect(0)
		else
			TFDirector:currentScene().fightUiLayer:AddAngerEffect(1)
		end
	elseif effect == 2 then
		fightRoleMgr:AddAnger(targetRole.logicInfo.bEnemyRole, -effectValue)
		targetRole:ShowEffectName("jiannu")
		if not self.attackerRole.logicInfo.bEnemyRole then
			TFDirector:currentScene().fightUiLayer:AddAngerEffect(1)
		end
	elseif effect == 3 then
		fightRoleMgr:AddAnger(self.attackerRole.logicInfo.bEnemyRole, effectValue)
		self.attackerRole:ShowEffectName("jianu")
		if not self.attackerRole.logicInfo.bEnemyRole then
			TFDirector:currentScene().fightUiLayer:AddAngerEffect(2)
		end
	elseif effect == 4 then

		fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex,  effectValue)
		self.attackerRole:ShowFightText("", effectValue)
		self.attackerRole:ShowEffectName("xixue")
	elseif effect == 10 then
		targetRole:CleanBuff(self.attackerRole)
	elseif effect == 11 then
		targetRole:ShowEffectName("zhisi")
	elseif effect == 14 then
		targetRole:ShowEffectName("zhongji")
	elseif effect == 21 then
		self.attackerRole:ShowFightText("", effectValue)
	elseif effect == 26 then
		targetRole:ShowEffectName("zhimingyiji")
		self.attackerRole:ShowFightText("", effectValue)
		targetRole:removeZhanShaBuff()
	elseif effect == 28 then
		local liveList = fightRoleMgr:GetAllLiveRole(self.attackerRole.logicInfo.bEnemyRole)
		local length = liveList:length()
		for i=1,length do
			local role = liveList:objectAt(i)
			role.skillCD = 0
		end
		fightRoleMgr:AddAnger( self.attackerRole.logicInfo.bEnemyRole,effectValue)
		if not self.attackerRole.logicInfo.bEnemyRole then
			TFDirector:currentScene().fightUiLayer:AddAngerEffect(0)
		end
	elseif effect == 32 then
		-- targetRole:ShowFightText("", -effectValue)
		fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex,  effectValue)
		self.attackerRole:ShowFightText("", effectValue)
		self.attackerRole:ShowEffectName("xixue")
	elseif effect == 33 then
		-- targetRole:ShowFightText("", -effectValue)
		fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex,  effectValue)
		self.attackerRole:ShowFightText("", effectValue)
		self.attackerRole:ShowEffectName("xixue")
	elseif effect == EnumFightActiveEffectType.effect_58 then
		self.attackerRole:ShowFightText("", effectValue)
		self.attackerRole:ShowEffectName("xixue")
	elseif effect == EnumFightActiveEffectType.effect_75 then
		targetRole:addRoleAnger(-effectValue)
	end
	
	--伤害加深不可以占用主动效果，使用新增的deepHurtType字段判定
	local deepHurtType = targetInfo.deepHurtType
	if deepHurtType then
		if EnumFightDeepHurtEffectMap[deepHurtType] then
			targetRole:ShowEffectName(EnumFightDeepHurtEffectMap[deepHurtType])
		end
	end
end



--主动效果:吸怒1 减敌怒2 增己怒3 吸血4 侧击8 净化10 致死11 七伤拳21 表现
function FightAction:ShowActiveEffectHitEnd()
	local nTargetCount = #self.actionInfo.targetlist
	for i=1,nTargetCount do
		local targetInfo = self.actionInfo.targetlist[i]
		if targetInfo.effect == 1 or targetInfo.effect == 2 or targetInfo.effect == 4 or targetInfo.effect == 5 or targetInfo.effect == 7 then 
			local effect = targetInfo.activeEffect
			local effectValue = targetInfo.activeEffectValue
			if effect == 31 then
				-- p.p = ass
				self.attackerRole.specialSkillTime = self.attackerRole.specialSkillTime or 0
				self.attackerRole.specialSkillTime = self.attackerRole.specialSkillTime - effectValue
				self.attackerRole.specialSkillTime = math.max(self.attackerRole.specialSkillTime ,0)
			end
		end
	end
end

function FightAction:addSkillAngel()
	local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
	local skillInfo = SkillLevelData:objectByID(self.actionInfo.skillid)
	if skillBaseInfo == nil or skillInfo == nil then
		return
	end
	if skillBaseInfo.anger_add and skillBaseInfo.anger_add ~= 0 then
		fightRoleMgr:AddAnger( self.attackerRole.logicInfo.bEnemyRole,skillBaseInfo.anger_add)
		-- if not self.attackerRole.logicInfo.bEnemyRole then
		-- 	TFDirector:currentScene().fightUiLayer:AddAngerEffect(0)
		-- end
	end
end

function FightAction:OnRoleHitAnimComplete(roleIndex)
	if self.hitAnimCompleteRoleNum == nil then
		return
	end
	local targetNum = #self.actionInfo.targetlist
	local addCount = 0
	if (roleIndex and self.hitAnimCount) then
		addCount = self.hitAnimCount[roleIndex] or 0
		self.hitAnimCount[roleIndex] = nil
	end
	self.hitAnimCompleteRoleNum = self.hitAnimCompleteRoleNum + 1 + addCount
	if self.hitAnimCompleteRoleNum == targetNum then
		self.hitAnimCount = nil
		self.hitAnimCompleteRoleNum = nil
		self:ShowActiveEffectHitEnd()
		self:setHelpAttack()
		-- if self.actionInfo.triggerType ~= 5 then
			-- self:setHurtAddBloodAction()
		-- end

		self:addAttackNum()
		self:setAttackSkill()

		if self.actionInfo.bBackAttack and self.actionInfo.triggerType ~= 12 then
			local targetInfo = self.actionInfo.targetlist[1]
			local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
			if targetRole ~= nil then
				if targetRole:IsLive() then
					if self.attackerRole == targetRole then
						if self.attackerRole.attackAnimEnd then
							self.attackerRole:ReturnBack()
						else
							self.attackerRole.needReturnBack = true
						end
					else
							targetRole:ReturnBack()
					end
				else
						FightManager:OnActionEnd()
				end
			end
		else
			if self.attackerRole:IsLive() then
				if self.attackerRole.attackAnimEnd then
					self.attackerRole:ReturnBack()
				else
					self.attackerRole.needReturnBack = true
				end
			else
				FightManager:OnActionEnd()
			end
		end
	end
end

function FightAction:AddBuffToTarget(attackRole,targetRole, bufferID, level, hurt)
	if not targetRole:IsLive() then
		return false
	end

	if bufferID > 0 then
		return targetRole:AddBuff(attackRole,bufferID, level,hurt)
	end
	return false
end

function FightAction:GetTargetRole(index)
	if self.actionInfo.targetlist == nil then
		return nil
	end


	local targetInfo = self.actionInfo.targetlist[index]
	if targetInfo == nil then
		return nil
	end

	local targetRole = fightRoleMgr:GetRoleByGirdIndex(targetInfo.targetpos)
	return targetRole
end

function FightAction:ShowSpecilEffect()
	self:ShowXiXinDaFaEffect()
	self:ShowXiXinDaFa_linghuchong_Effect()
end


function FightAction:addAttackNum()
	if self.actionInfo.bBackAttack then
		return
	end
	if self.actionInfo.triggerType and self.actionInfo.triggerType == 12 then 
		return
	end
	if  self.actionInfo.skillid.skillId ~= 0 then
		local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
		if skillBaseInfo == nil then
			return
		end
		if skillBaseInfo.is_atk_count and skillBaseInfo.is_atk_count == 0 then
			return
		end
	end
	self.attackerRole:addAttackNum()
	fightRoleMgr:addAttackNum(self.attackerRole.logicInfo.bEnemyRole)
end

function FightAction:setAttackSkill( )
-- 	self.attackerRole:OnHelpAttackBuffTrigger()
	local effectValue = {}
	if self.attackerRole:TriggerBeAttackSkill(effectValue) and not fightRoundMgr:isHasRoleAttackSkill(self.attackerRole) then
		self.attackerRole.attackNum = 0
		fightRoundMgr:SetSkillTrgerSkillAction(self.attackerRole, effectValue,4)
	end

end
function FightAction:ShowXiXinDaFaEffect()

	-- local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
	local skillInfo = SkillLevelData:objectByID(self.actionInfo.skillid)
	if skillInfo == nil then
		return
	end
	if skillInfo.effect ~= 22 then
		return
	end

	-- local nTargetCount = #self.actionInfo.targetlist
	-- for i=1,nTargetCount do
	-- 	local targetInfo = self.actionInfo.targetlist[i]
	for i,targetInfo in ipairs(self.actionInfo.targetlist) do
		if targetInfo.activeEffect == 22 and targetInfo.triggerBufferID ~= 0 then
			self.specilTimerID =  TFDirector:addTimer(300 / FightManager.fightSpeed, 1, nil,
				function()
					if self:AddBuffToTarget(self.attackerRole,self.attackerRole, tonumber(skillInfo.effect_value),self.actionInfo.skillid.level) then
						self:AddBuffInfoToServer(self.attackerRole, self.attackerRole, tonumber(skillInfo.effect_value), 0)
					end
					TFDirector:removeTimer(self.specilTimerID)
					self.specilTimerID = nil
				end)
			return
		end
	end
end
function FightAction:ShowXiXinDaFa_linghuchong_Effect()
  
	local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
	local skillInfo = SkillLevelData:objectByID(self.actionInfo.skillid)
	if skillBaseInfo == nil or skillInfo == nil then
		return
	end
	if skillBaseInfo.effect ~= 23 then
		return
	end
	local nTargetCount = #self.actionInfo.targetlist
	for i=1,nTargetCount do
		local targetInfo = self.actionInfo.targetlist[i]
		if targetInfo.activeEffect == 23 and targetInfo.triggerBufferID ~= 0 then
			if self:AddBuffToTarget(self.attackerRole,self.attackerRole, tonumber(skillInfo.effect_value),self.actionInfo.skillid.level) then
				self:AddBuffInfoToServer(self.attackerRole, self.attackerRole, tonumber(skillInfo.effect_value), 0)
			end
			return
		end
	end
end

function FightAction:ShowQianKunDaNuoYi()
	-- local skillBaseInfo = BaseDataManager:GetSkillBaseInfo(self.actionInfo.skillid)
	local skillInfo = SkillLevelData:objectByID(self.actionInfo.skillid)
	if skillInfo == nil then
		return
	end

	if skillInfo.effect == 20 then
		-- self.specilTimerID =  TFDirector:addTimer(3000 / FightManager.fightSpeed, 1, nil,
		-- function()
			local liveList = fightRoleMgr:GetAllLiveRole(self.attackerRole.logicInfo.bEnemyRole, nil, true)
			-- local liveNum = liveList:length()
			-- for i=1,liveNum do
			-- 	local role = liveList:objectAt(i)
			for role in liveList:iterator() do
				-- --治疗修正
				-- local fightEffectValue = self.attackerRole:getEffectExtraAttrNum(EnumFightAttributeType.Effect_extra,EnumFightEffectType.FightEffectType_BonusHealing) +
				-- 	role:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_BonusHealing)
				-- fightEffectValue = fightEffectValue/10000+1
				-- fightEffectValue = math.max(0,fightEffectValue)

				-- local _tempNum = skillInfo.effect_value * fightEffectValue + role:getEffectExtraAttrNum(EnumFightAttributeType.Be_effect_extra,EnumFightEffectType.FightEffectType_BonusHealing_Num)
				-- _tempNum = math.max(0,_tempNum)
				-- fightRoleMgr:addHurtReport(self.attackerRole.logicInfo.posindex,  math.floor(_tempNum))
				-- role:ShowFightText("",math.floor(_tempNum))
				role:ShowFightText("",skillInfo.effect_value)
			end
			-- TFDirector:removeTimer(self.specilTimerID)
			-- self.specilTimerID = nil
		-- end)
	end
end

function FightAction:AddBuffInfoToServerByFanTan(fromRole, targetRole, bufferID, triggerBuffID)
	local buffInfo = {}
	buffInfo[1] = fromRole.logicInfo.posindex
	buffInfo[2] = targetRole.logicInfo.posindex
	buffInfo[3] = triggerBuffID
	buffInfo[4] = self.actionInfo.skillid.skillId
	buffInfo[5] = self.actionInfo.skillid.level
	buffInfo[6] = bufferID
	buffInfo[7] = self.actionInfo.skillid.level

	if self.actionInfo.skillid.skillId == 0 then
		local passiveSkillNum = #targetRole.passiveSkill
		for i=1,passiveSkillNum do
			local skillInfo = SkillLevelData:objectByID(targetRole.passiveSkill[i])
			if skillInfo ~= nil then
				if  skillInfo.buff_id == bufferID then
					buffInfo[4] = skillInfo.id
					buffInfo[5] = skillInfo.level
				else
					if skillInfo.effect == 25 and tonumber(skillInfo.effect_value) == bufferID then
						buffInfo[4] = skillInfo.id
						buffInfo[5] = skillInfo.level
					end
				end
			end
		end
	else
		buffInfo[4] = self.actionInfo.skillid.skillId
		buffInfo[5] = self.actionInfo.skillid.level
	end

	local num = #self.actionInfo.buffList
	self.actionInfo.buffList[num+1] = buffInfo
end
function FightAction:AddBuffInfoToServer(fromRole, targetRole, bufferID, triggerBuffID)
	local buffInfo = {}
	buffInfo[1] = fromRole.logicInfo.posindex
	buffInfo[2] = targetRole.logicInfo.posindex
	buffInfo[3] = triggerBuffID
	buffInfo[4] = self.actionInfo.skillid.skillId
	buffInfo[5] = self.actionInfo.skillid.level
	buffInfo[6] = bufferID
	buffInfo[7] = self.actionInfo.skillid.level

	if self.actionInfo.skillid.skillId == 0 then
		local passiveSkillNum = #fromRole.passiveSkill
		for i=1,passiveSkillNum do
			local skillInfo = SkillLevelData:objectByID(fromRole.passiveSkill[i])
			if skillInfo ~= nil then
				if  skillInfo.buff_id == bufferID then
					buffInfo[4] = skillInfo.id
					buffInfo[5] = skillInfo.level
				else
					if skillInfo.effect == 25 and tonumber(skillInfo.effect_value) == bufferID then
						buffInfo[4] = skillInfo.id
						buffInfo[5] = skillInfo.level
					end
				end
			end
		end
	else
		buffInfo[4] = self.actionInfo.skillid.skillId
		buffInfo[5] = self.actionInfo.skillid.level
	end

	local num = #self.actionInfo.buffList
	self.actionInfo.buffList[num+1] = buffInfo
end

function FightAction:__AddBuffInfoToServer(fromRole, targetRole, skillId,level,bufferID, triggerBuffID)
	local buffInfo = {}
	buffInfo[1] = fromRole.logicInfo.posindex
	buffInfo[2] = targetRole.logicInfo.posindex
	buffInfo[3] = triggerBuffID
	buffInfo[4] = skillId
	buffInfo[5] = level
	buffInfo[6] = bufferID
	buffInfo[7] = level

	local num = #self.actionInfo.buffList
	self.actionInfo.buffList[num+1] = buffInfo
end


function FightAction:AddBuSiBuffInfoToServer(fromRole, targetRole, bufferID, triggerBuffID)
	local buffInfo = {}
	buffInfo[1] = fromRole.logicInfo.posindex
	buffInfo[2] = targetRole.logicInfo.posindex
	buffInfo[3] = triggerBuffID
	buffInfo[4] = 0
	buffInfo[5] = 0
	buffInfo[6] = bufferID
	buffInfo[7] = 0

	local passiveSkillNum = #fromRole.passiveSkill
	for i=1,passiveSkillNum do
		local skillInfo = SkillLevelData:objectByID(fromRole.passiveSkill[i])
		if skillInfo ~= nil then
			if skillInfo.effect == 25 and tonumber(skillInfo.effect_value) == bufferID then
				buffInfo[4] = skillInfo.id
				buffInfo[5] = skillInfo.level
				buffInfo[7] = skillInfo.level
			end
		end
	end

	if buffInfo[4] == 0 then
		return
	end
	local num = #self.actionInfo.buffList
	self.actionInfo.buffList[num+1] = buffInfo
end
function FightAction:AddBuffInBeginToServer(buffInfo)
	-- local buffInfo = {}
	-- buffInfo[1] = fromRole.logicInfo.posindex
	-- buffInfo[2] = targetRole.logicInfo.posindex
	-- buffInfo[3] = triggerBuffID
	-- buffInfo[4] = 0
	-- buffInfo[5] = 0
	-- buffInfo[6] = bufferID
	-- buffInfo[7] = 1

	local num = #self.actionInfo.buffList
	self.actionInfo.buffList[num+1] = buffInfo
end

function FightAction:pause()
	if self.xuliEffTimerID then
		TFDirector:stopTimer(self.xuliEffTimerID)
	end
	if self.attackEffTimerID then
		for k,v in pairs(self.attackEffTimerID) do
			TFDirector:stopTimer(v)
		end
	end
	if self.hitTimerID then
		TFDirector:stopTimer(self.hitTimerID)
	end
	if self.attackSoundTimerID then
		TFDirector:stopTimer(self.attackSoundTimerID)
	end
	if self.hitSoundTimerID then
		TFDirector:stopTimer(self.hitSoundTimerID)
	end
	if self.hitSoundTimerID then
		TFDirector:stopTimer(self.hitSoundTimerID)
	end
	local hitEffTimerNum = self.hitEffTimerIDList:length()
	for i=1,hitEffTimerNum do
		if self.hitEffTimerIDList:objectAt(i) then
			TFDirector:stopTimer(self.hitEffTimerIDList:objectAt(i))
		end
	end
	-- local extraEffTimerNum = self.extraEffTimerIDList:length()
	-- for i=1,extraEffTimerNum do
	for extra in self.extraEffTimerIDList:iterator() do
		if extra then
			TFDirector:stopTimer(extra)
		end
	end
end

function FightAction:setHitRole(targetRole)
	-- if self.actionInfo.bBackAttack then
	-- 	return
	-- end
	-- if self.actionInfo.triggerType
	targetRole.skillDisplayID = self.attackerRole.normalAttackSkillID 
	print(targetRole.logicInfo.name.."targetRole.skillDisplayID-->",targetRole.skillDisplayID)
	targetRole.hitRoleDisPlay = self.attackerRole.armatureID 
end

function FightAction:resume()
	if self.xuliEffTimerID then
		TFDirector:startTimer(self.xuliEffTimerID)
	end
	if self.attackEffTimerID then
		for k,v in pairs(self.attackEffTimerID) do
			TFDirector:startTimer(v)
		end
	end
	if self.hitTimerID then
		TFDirector:startTimer(self.hitTimerID)
	end
	if self.attackSoundTimerID then
		TFDirector:startTimer(self.attackSoundTimerID)
	end
	if self.hitSoundTimerID then
		TFDirector:startTimer(self.hitSoundTimerID)
	end
	-- local hitEffTimerNum = self.hitEffTimerIDList:length()
	-- for i=1,hitEffTimerNum do
	for hitEff in self.hitEffTimerIDList:iterator() do
		if hitEff then
			TFDirector:startTimer(hitEff)
		end
	end
	-- local extraEffTimerNum = self.extraEffTimerIDList:length()
	-- for i=1,extraEffTimerNum do
	for extraEffect in self.extraEffTimerIDList:iterator() do
		if extraEffect then
			TFDirector:startTimer(extraEffect)
		end
	end
end

--99 金蛇游身
function FightAction:ShowBuffPassiveEffect(targetRole)
	if targetRole == nil then
		return false
	end
	local buffInfo = targetRole:GetBuffByType(EnumFightBufferType.type_99)
	if (buffInfo) then
		-- targetRole:OnBuffTriggerByType(EnumFightBufferType.type_99)
		targetRole:OnBuffTriggerByTypeInfo(buffInfo)
		-- fightRoleMgr:AddAnger(not targetRole.logicInfo.bEnemyRole, -buffInfo.config.value)
		if (targetRole.logicInfo.bEnemyRole ~= self.attackerRole.logicInfo.bEnemyRole) then
			fightRoleMgr:AddAnger(not targetRole.logicInfo.bEnemyRole, -buffInfo.config.value)
			self.attackerRole:ShowEffectName("jiannu_1")
		end
		return true
	end
	return false
end

return FightAction