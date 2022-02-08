--
-- Author: Zippo
-- Date: 2014-7-17 
--

local fightRoleMgr = require("lua.logic.fight.FightRoleManager")
local fightRoundMgr = require("lua.logic.fight.FightRoundManager")

local FightAI = {}

function FightAI:Start()
	if self.updateTimerID ~= nil then
		return
	end
	
	if FightManager.isReplayFight then
		return
	end
	if not FightManager.isTiaoGuo then
		local updateTime = 1000
		self.updateTimerID = TFDirector:addTimer(updateTime, -1, nil, 
		function() 
			self:Update(updateTime)
		end)
	end
	
	self.roleList = {1,2}
	self.roleList[1] = TFArray:new()
	self.roleList[2] = TFArray:new()
end

function FightAI:dispose()
	if self.updateTimerID ~= nil then
		TFDirector:removeTimer(self.updateTimerID)
		self.updateTimerID = nil
	end
end

function FightAI:Update(updateTime)
	if FightManager.battleCustomSkill and FightManager.battleCustomSkill.defInfo then
		self:UpdateByRoleAI(true, FightManager.battleCustomSkill.defInfo)
	else
		self:UpdateAI(true, updateTime)
	end
	self:UpdateSelfAngerAI(true)

	if FightManager.isAutoFight or FightManager.isTiaoGuo then
		self:UpdateSelfAngerAI(false)
		if FightManager.battleCustomSkill and FightManager.battleCustomSkill.atkInfo then
			self:UpdateByRoleAI(false, FightManager.battleCustomSkill.atkInfo)
		else
			self:UpdateAI(false, updateTime)
		end
		-- self:UpdateAI(false, updateTime)
	end
	-- if not FightManager.isTiaoGuo then
	-- 	fightRoleMgr:isAbnormal()
	-- end
	self:UpdateEnemySkillCD(updateTime)

	if FightManager.isTiaoGuo then
		self:updateSelfSkillCD(updateTime)
	end
end

function FightAI:updateSelfSkillCD(updateTime)
	local liveList = fightRoleMgr:GetAllLiveRole(false)
	local liveNum = liveList:length()
	-- for i=1,liveNum do
	-- 	local role = liveList:objectAt(i)
	for role in liveList:iterator() do
		if role.skillCD > 0 then
			if not FightManager.isTiaoGuo then
				role.skillCD = role.skillCD - updateTime * FightManager.fightSpeed
			else
				role.skillCD = role.skillCD - updateTime
			end
			if role.skillCD < 0 then
				role.skillCD = 0
			end
		end
		if role.angerSkillCD > 0 then
			if not FightManager.isTiaoGuo then
				role.angerSkillCD = role.angerSkillCD - updateTime * FightManager.fightSpeed
			else
				role.angerSkillCD = role.angerSkillCD - updateTime
			end
			if role.angerSkillCD < 0 then
				role.angerSkillCD = 0
			end
		end
	end
end
function FightAI:UpdateEnemySkillCD(updateTime)
	local liveList = fightRoleMgr:GetAllLiveRole(true)
	local liveNum = liveList:length()
	-- for i=1,liveNum do
	-- 	local role = liveList:objectAt(i)
	for role in liveList:iterator() do
		if role.skillCD > 0 then
			if not FightManager.isTiaoGuo then
				role.skillCD = role.skillCD - updateTime * FightManager.fightSpeed
			else
				role.skillCD = role.skillCD - updateTime
			end
			if role.skillCD < 0 then
				role.skillCD = 0
			end
		end
		if role.angerSkillCD > 0 then
			if not FightManager.isTiaoGuo then
				role.angerSkillCD = role.angerSkillCD - updateTime * FightManager.fightSpeed
			else
				role.angerSkillCD = role.angerSkillCD - updateTime
			end
			if role.angerSkillCD < 0 then
				role.angerSkillCD = 0
			end
		end
	end
end

function FightAI:getRoleList( bEnemy )
	if bEnemy == true then
		return self.roleList[2]
	else
		return self.roleList[1]
	end
end

function FightAI:GetTriggerAnger(bEnemy)
	local maxAnger = 0
	local liveList = fightRoleMgr:GetAllLiveRole(bEnemy)
	local liveNum = liveList:length()
	for i=1,liveNum do
		local role = liveList:objectAt(i)
		local roleSkillAnger = role:GetSkillAnger()
		if role.skillID.skillId > 0 and role.skillCD <= 0 and role:HaveForbidManualSkillBuff() == false and roleSkillAnger > maxAnger then
			maxAnger = roleSkillAnger
		end
	end

	return maxAnger
end

local priority_tbl = {5,2,1,3}
function cmpRoleListFunc(role1, role2)
	local priority_1 = FightAI.getPrioritySpecial(role1)
	local priority_2 = FightAI.getPrioritySpecial(role2)
	-- print('cmpRoleListFunc  ', role1.logicInfo.bEnemy)
	
	-- print(priority_1,"  role1  ",role1.logicInfo.name)
	-- print(priority_2, "  role2  ",role2.logicInfo.name)
    if priority_1 == priority_2 then
		return role1:GetAttrNum(EnumAttributeType.Agility) > role2:GetAttrNum(EnumAttributeType.Agility)
    end
	return priority_1 < priority_2
end

function FightAI.getPriorityFangyu( role )
	local priority = priority_tbl[role.profession]
	-- local skillId = role.skillID
	-- local skillInfo = BaseDataManager:GetSkillBaseInfo(skillId)
	if role:GetActiveSkillType() == 8 then
		return priority
	end
	local manualActionNum = role.manualActionNum or 0
	if manualActionNum%2 == 0 then
		return priority
	else
		return 6
	end
end
function FightAI.getPrioritySpecial( role )
	local priority = priority_tbl[role.profession]
	if role.profession == 2 then
		return FightAI.getPriorityFangyu(role)
	end
	if role.profession ~= 3 then
		return priority
	end
	local skillId = role.skillID
	local skillInfo = BaseDataManager:GetSkillBaseInfo(skillId)
	if skillInfo == nil then
		return priority
	end
	if skillInfo.type == 2 then
		return priority
	else
		return 4
	end
end

function FightAI:addToRoleList( bEnemy )
	--local roleList = self:getRoleList(bEnemy)
	local roleList = fightRoleMgr:GetAllLiveRole(bEnemy)
	roleList:sort(cmpRoleListFunc)
	if bEnemy == true then
		self.roleList[2] = roleList
	else
		self.roleList[1] = roleList
	end
end

function FightAI:addToRoleListByRoleAi( bEnemy ,aiList)
	print("FightAI:addToRoleListByRoleAi",aiList)
	for i=1,#aiList do
		if bEnemy == true then
			self.roleList[2]:push(aiList[i])
		else
			self.roleList[1]:push(aiList[i])
		end
	end
end

--[[
message SpecialOrderInfo{
	required int32 roleId=1;//角色ID
	required bool isCheckBox=2;//是否勾选
	required int32 specialOrderType=3;
	optional int32 percentNum=4;//百分比数字
}
]]
function FightAI:checkRoleHpPercent(bEnemy,percentNum)
	local roleList = fightRoleMgr:GetAllLiveRole(bEnemy)
	for v in roleList:iterator() do
		if v.currHp / v.maxhp * 100 <= percentNum then
			return true
		end
	end
	return false
end

function FightAI:checkUseSpecialOrder(bEnemy,aiInfo)
	local role = fightRoleMgr:GetRoleById(bEnemy,aiInfo.roleId)
	if role == nil or not role:IsAlive() then
		return false
	end
	if role.skillID.skillId > 0 and role.skillCD > 0 then
		print("技能cd中 跳过")
		return false
	end
	if role:HaveForbidManualSkillBuff() then
		print("角色不可攻击跳过")
		return false
	end
	local skillInfo = SkillLevelData:objectByID(role.skillID)
	local buff_id = skillInfo.buff_id
	if buff_id ~= 0 then
		if skillInfo.target_type == 11 and role:isCanNotTriggerBeiDong()  then
			return false
		end
	end

	if aiInfo.isCheckBox then
		if buff_id ~= 0 then
			-- if skillInfo.target_type == 11 and role:isCanNotTriggerBeiDong()  then
			-- 	return false
			-- end
			local buffInfo = SkillBufferData:objectByID( buff_id)
			if buffInfo and buffInfo.good_buff == 1 then
				local roleList = fightRoleMgr:GetAllLiveRole(bEnemy)
				for v in roleList:iterator() do
					if v:HaveBuff(buff_id) then
						print("已经拥有buff  buff_id ==",buff_id)
						return false
					end
				end
			end
		end
	end
	if aiInfo.specialOrderType == 1 then
		if not self:checkRoleHpPercent(not bEnemy, aiInfo.percentNum) then
			return false
		end
	elseif aiInfo.specialOrderType == 3 then
		if not self:checkRoleHpPercent(bEnemy, aiInfo.percentNum) then
			return false
		end
	end

	local currAnger = fightRoleMgr:GetAnger(bEnemy)
	local roleSkillAnger = role:GetSkillAnger()
	if currAnger < roleSkillAnger then
		print("怒气不足，返回")
		return true
	end

	print(role.logicInfo.name.."加入技能队列")
	fightRoundMgr:AddManualAction(role)

	return true
end

function FightAI:UpdateByRoleAI(bEnemy, aiInfo)
	-- print("FightAI:UpdateByRoleAI",aiInfo)
	local roleList = self:getRoleList(bEnemy)
	if roleList:length() == 0 and aiInfo.baseOrder then
		self:addToRoleListByRoleAi(bEnemy,aiInfo.baseOrder)
		roleList = self:getRoleList(bEnemy)
	end
	if aiInfo.specialOrder then
		for i=1,#aiInfo.specialOrder do
			if self:checkUseSpecialOrder(bEnemy,aiInfo.specialOrder[i]) then
				local role_id = roleList:front()
				if role_id and role_id== aiInfo.specialOrder[i].roleId then
					roleList:popFront()
				end
				return
			end
		end
	end
	if roleList:length() > 0 then
		self:UpdateRoleAI(bEnemy)
	end
end


function FightAI:UpdateRoleAI(bEnemy)
	-- print("FightAI:UpdateRoleAI----------->>>>>>")
	local roleList = self:getRoleList(bEnemy)

	local role_id = roleList:front()
	if role_id == nil then
		roleList:popFront()
		print("role_id ==nil---<<<>>>>")
		return
	end
	local role = fightRoleMgr:GetRoleById(bEnemy,role_id)
	if role == nil then
		print("role ==nil---<<<>>>>")
		roleList:popFront()
		return
	end
	if role:IsAlive() == false then
		print("role:IsAlive() == false  ==nil---<<<>>>>")
		roleList:popFront()
		return
	end

	local currAnger = fightRoleMgr:GetAnger(bEnemy)
	local roleSkillAnger = role:GetSkillAnger()
	if currAnger < roleSkillAnger then
		print("怒气不足，返回")
		return
	end
	roleList:popFront()
	if role:HaveForbidManualSkillBuff() then
		print("角色不可攻击跳过")
		return
	end
	if role.skillID.skillId > 0 and role.skillCD > 0 then
		print("技能cd中 跳过")
		return
	end
	if not self:_ReleaseGoodBufSkill(role) then
		return
	end
	print(role.logicInfo.name.."加入技能队列")
	fightRoundMgr:AddManualAction(role)
end



function FightAI:_ReleaseGoodBufSkill(role)
	if role.skillID.skillId == 0 then
		return false
	end
	local skillInfo = SkillLevelData:objectByID(role.skillID)
	local buff_id = skillInfo.buff_id
	if buff_id ~= 0 and skillInfo.target_type == 11 and role:isCanNotTriggerBeiDong() then
		return false
	end
	return true
end


function FightAI:UpdateAI(bEnemy, updateTime)
	local roleList = self:getRoleList(bEnemy)
	if roleList:length() == 0 then
		self:addToRoleList(bEnemy)
		roleList = self:getRoleList(bEnemy)
	end

	local role = roleList:front()
	if role == nil then
		roleList:popFront()
		return
	end
	--召唤物
	if (role:GetSummoned() ~= 0) then
		roleList:popFront()
		return
	end
	--
	if role:IsAlive() == false then
		roleList:popFront()
		return
	end
	print(role.logicInfo.name.."开始技能AI")
	if role:GetActiveSkillType() == 2 then
		if self:ReleaseCureSkill(bEnemy) == false then
			print("全角色血量高于70%")
			roleList:popFront()
			return
		end
	end
	if role.profession == EnumProfessionType.CONTROL then
		if self:NeedReleaseBadBuffSkill(role) ==false then
			print("对面控制超过一半")
			roleList:popFront()
			return
		end
	end

	local currAnger = fightRoleMgr:GetAnger(bEnemy)
	local roleSkillAnger = role:GetSkillAnger()
	if currAnger < roleSkillAnger then
		print("怒气不足，返回")
		return
	end
	-- print("roleList  length = ",roleList:length())
	roleList:popFront()
	-- print("roleList  length = ",roleList:length())

	if role:GetActiveSkillType() == 8 then
		if self:ReleaseGoodBufSkill(role) == false then
			return
		end
	end

	if role:HaveForbidManualSkillBuff() then
		print("角色不可攻击跳过")
		return
	end

	if role.skillID.skillId > 0 and role.skillCD > 0 then
		print("技能cd中 跳过")
		return
	end

	print(role.logicInfo.name.."加入技能队列")
	fightRoundMgr:AddManualAction(role)
end

function FightAI:UpdateSelfAngerAI(bEnemy)
	local roleList = fightRoleMgr:GetAllLiveRole(bEnemy, false, true)
	for role in roleList:iterator() do
	-- for k,role in pairs(fightRoleMgr.map) do
		local bValidRole = true
		if role:HaveFrozenBuff(true) or role.angerSkillCD > 0 then
			bValidRole = false
		end

		if bValidRole and role:IsLive() then
			local skillInfo = role:getUseSelfAngerSkill()
		--	if skillInfo then
		--		print("UpdateSelfAngerAI----->" ,skillInfo.trigger_anger)
		--		print("role.role_anger----->" ,role.role_anger)
		--	end
			if skillInfo and skillInfo.trigger_anger ~= -1 and role.role_anger >= skillInfo.trigger_anger then
				if role:HaveForbidManualSkillBuff() == false then
					fightRoundMgr:AddAngerManualAction(role)
				end
			end
		end
	end
end


function FightAI:ReleaseCureSkill(bEnemy)
	local liveList = fightRoleMgr:GetAllLiveRole(bEnemy)
	local liveNum = liveList:length()
	for i=1,liveNum do
		local role = liveList:objectAt(i)
		if role.currHp/role.maxhp < 0.7 then
			print(role.logicInfo.name.."角色血量低于70%")
			return true
		end
	end
	return false
end

function FightAI:ReleaseGoodBufSkill(role)
	if role.skillID.skillId == 0 then
		return false
	end
	local skillInfo = SkillLevelData:objectByID(role.skillID)
	local buff_id = skillInfo.buff_id
	if role:HaveBuff(buff_id) then
		print("已经拥有buff  buff_id ==",buff_id)
		return false
	end
	if skillInfo.target_type == 11 and role:isCanNotTriggerBeiDong() then
		return false
	end
	return true
end

function FightAI:NeedReleaseBadBuffSkill( role )
	if role.profession ~= 4 then
		return true
	end
	local skillInfo = SkillLevelData:objectByID(role.skillID)
	local buff_id = skillInfo.buff_id or 0
	if buff_id == 0 then
		return true
	end
	local buffInfo =SkillLevelData:getBuffInfo( buff_id , role.skillID.level)
	local isEnmey = role.logicInfo.bEnemyRole
	local totalnum ,hasBuffNum = fightRoleMgr:getHasBuffNum(not isEnmey,buffInfo.type)
	if hasBuffNum > totalnum/2 then --50%以上的敌方 有本技能 buff 则AI不会释放
		return false
	end
	return true
end

function FightAI:pause()
	if self.updateTimerID then
		TFDirector:stopTimer(self.updateTimerID)
	end	
end
return FightAI