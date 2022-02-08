--
-- Author: Zippo
-- Date: 2013-12-05 17:34:18
--

local mapLayer = require("lua.logic.battle.BattleMapLayer")

local BattleRoleManager = {}

function BattleRoleManager:CreateAllRole(roleList, roleLayer)
	self.roleLayer = roleLayer
	FightManager:initFightLog()
	FightManager:ClearSkillCache()
	self.map = {}
	self.summonedIndex 	= {}
	self.addHpPercentRole = {[true] = 0,[false] = 0}
	local boss_index = FightManager:getBossIndex()
	for k,v in pairs(roleList) do
		print("==============BattleRoleManager:CreateAllRole(================")
		v.isboss = false
		for _,_index in pairs(boss_index) do
			local index = tonumber(_index)+8
			if index >= 9 and index ==  v.posindex then
				v.isboss = true
			end
		end
		if FightManager.fightBeginInfo.fighttype == 10 and v.posindex >= 9 then
			v.isboss = true
		end
		local fightRoleDisplay = require("lua.logic.battle.BattleRoleDisplay"):new(v)
		if fightRoleDisplay ~= nil then
			roleLayer:addChild(fightRoleDisplay.rolePanel)
			self.map[fightRoleDisplay.logicInfo.posindex] = fightRoleDisplay
		end
		if FightManager.fightBeginInfo.fighttype == 10 and v.posindex >= 9 then
			fightRoleDisplay:setScale(1.5)
		end
	end


	self:refreshMaxHp(true)

	self.fullAnger  = ConstantData: getValue("Fight.FullAnger")
	self.enemyAnger = FightManager.fightBeginInfo.angerEnemy
	self.selfAnger  = FightManager.fightBeginInfo.angerSelf
end

function BattleRoleManager:addNewRoleIntoFight( roleInfo )
	roleInfo.isboss = false
	local fightRole = require("lua.logic.battle.BattleRoleDisplay"):new(roleInfo)
	if fightRole ~= nil then
		self.roleLayer:addChild(fightRole.rolePanel)
		self.map[fightRole.logicInfo.posindex] = fightRole
		if (fightRole:GetSummoned() ~= 0) then
			fightRole:SetRoleVisible(false)
			self.summonedIndex[fightRole.logicInfo.bEnemyRole] = fightRole.logicInfo.posindex
		end
	end
	self:refreshMaxHp()
	if (fightRole:GetSummoned() ~= 0) then
	else
		if roleInfo.posindex < 9 then
			fightRole.rolePanel:setPositionX(-100)
		else
			local nViewWidth = GameConfig.WS.width
			fightRole.rolePanel:setPositionX(nViewWidth + 100)
		end
		self.roleLayer:showOneRoleGotoScene(fightRole)
	end
	return fightRole
end

function BattleRoleManager:refreshMaxHp(bInit)
	for k,role in pairs(self.map) do
		role.maxhp = role:GetAttrNum(1)
		-- if (bInit) then
		-- 	local bAdd = true
		-- 	if (fightType == EnumFightType.YanmenGuan or fightType == EnumFightType.FactionFight or fightType == EnumFightType.EnumFightType) then
		-- 		bAdd = false
		-- 	end
		-- 	if (bAdd) then
		-- 		local oldHp = role.currHp
		-- 		role.currHp = role.maxhp
		-- 		print(role.logicInfo.posindex, role.logicInfo.name," refreshMaxHp -->  old Hp: ",oldHp, "   currHp: ",role.currHp)
		-- 	end
		-- end
	end
end
function BattleRoleManager:dispose()
	for k,role in pairs(self.map) do
		role:dispose()
		role = nil
	end
	self.map = nil
	self.roleLayer = nil
end

function BattleRoleManager:OnRoundStart()
	for k,role in pairs(self.map) do
		role.haveAttack = false
		role:OnRoundChange()
	end
end

function BattleRoleManager:OnAddPermanentBuf()
	for k,role in pairs(self.map) do
		role:OnAddPermanentBuf()
	end
end

function BattleRoleManager:OnActionEnd(currAction)
	for k,role in pairs(self.map) do
		role:OnActionEnd(currAction)
	end
end

function BattleRoleManager:OnActionStart()
	for k,role in pairs(self.map) do
		role:OnActionStart()
	end
end

function BattleRoleManager:OnFightSpeedChange()
	for k,role in pairs(self.map) do
		role:SetSpeed(FightManager.fightSpeed)
	end
end

function BattleRoleManager:SetAllRoleSpeed(speed)
	for k,role in pairs(self.map) do
		role:SetSpeed(speed)
	end
end

function BattleRoleManager:GetRoleByGirdIndex(nGirdIndex)
	assert(nGirdIndex >= 0 and nGirdIndex <= 19, "nGirdIndex ："..nGirdIndex)
	local role = self.map[nGirdIndex]
	if (role == nil) then
		print(false, "nGirdIndex ："..nGirdIndex)
	end
	
	return role
end


function BattleRoleManager:GetPetByIndex(nGirdIndex)
	assert(nGirdIndex >= 1 and nGirdIndex < 3)
	return self.map[nGirdIndex+17]
end

function BattleRoleManager:GetNormalAttackRole()
	local attackRole = nil 
	local maxAgility = -1 -- 身法
	for k,role in pairs(self.map) do
		local roleAgility = role:GetAttrNum(5)
		if role:IsLive() and role:HaveForbidAttackBuff() == false and role.haveAttack == false and roleAgility > maxAgility then
			attackRole = role
			maxAgility = roleAgility
		end
	end
	return attackRole
end

function BattleRoleManager:GetSingleTarget(attackRole)
	local attackRolePos = attackRole.logicInfo.posindex
	local attackRoleRow = attackRole:GetRowIndex()

	local targetPosIndex = {}
	if attackRoleRow == 0 then
		targetPosIndex = {0, 1, 2, 3, 4, 5, 6, 7, 8}
	elseif attackRoleRow == 1 then
		targetPosIndex = {3, 4, 5, 0, 1, 2, 6, 7, 8}
	else
		targetPosIndex = {6, 7, 8,3, 4, 5, 0, 1, 2 }
	end

	local targetList = {}
	for i=1,9 do
		local posIndex = targetPosIndex[i]
		if attackRolePos < 9 then
			posIndex = posIndex + 9
		end
		local role = self.map[posIndex]
		if role ~= nil and role:IsLive() and role:HaveFrozenBuff() == false then
			targetList[1] = role
			break
		end
	end

	return targetList
end

--全体目标
function BattleRoleManager:GetScreenTarget(bEnemyRole)
	local liveList = self:GetAllLiveRole(bEnemyRole, false, true)
	local liveNum = liveList:length()
	local targetList = {}
   	for i=1,liveNum do
  		local role = liveList:objectAt(i)
  		local num = #targetList
		targetList[num+1] = role
  	end

	return targetList
end


--全体目标
function BattleRoleManager:GetBuffTarget(buff,bEnemyRole)
	local bufferInfo = SkillBufferData:objectByID(tonumber(buff.config.value))
	if bufferInfo == nil then
		return nil
	end
	local liveList = self:GetAllLiveRole(bEnemyRole, false, false)
	local liveNum = liveList:length()
	local targetList = {}
	for i=1,liveNum do
		local role = liveList:objectAt(i)
		if role:GetBuffByType(bufferInfo.type) then
			local num = #targetList
			targetList[num+1] = role
		end
	end

	return targetList
end


function BattleRoleManager:GetRowTarget(attackRole)
	local attackRolePos = attackRole.logicInfo.posindex
	local attackRoleRow = attackRole:GetRowIndex()

	local targetPosIndex = {}
	if attackRoleRow == 0 then
		targetPosIndex = {0, 1, 2, 3, 4, 5, 6, 7, 8}
	elseif attackRoleRow == 1 then
		targetPosIndex = {3, 4, 5, 0, 1, 2, 6, 7, 8}
	else
		targetPosIndex = {6, 7, 8,3, 4, 5, 0, 1, 2}
	end

	local targetList = {}
	for i=0,2 do
		for j=1,3 do
			local posIndex = targetPosIndex[i*3+j]
			if attackRolePos < 9 then
				posIndex = posIndex + 9
			end
			local role = self.map[posIndex]
			if role ~= nil and role:IsLive() and role:HaveFrozenBuff() == false then
				local num = #targetList
				targetList[num+1] = role
			end
		end

		if #targetList > 0 then
			break
		end
	end

	return targetList
end

function BattleRoleManager:GetColumnTarget(attackRole)
	local targetList = {}

	local attackRolePos = attackRole.logicInfo.posindex
	local singleTarget = self:GetSingleTarget(attackRole)

	local targetRoleColumn = 0
	if #singleTarget > 0 then
		targetRoleColumn = singleTarget[1]:GetColumnIndex()
		targetList[1] = singleTarget[1]
	else
		return targetList
	end

	local targetPosIndex = {0, 3, 6, 1, 4, 7, 2, 5, 8}
	if targetRoleColumn == 0 then
		targetPosIndex = {0, 3, 6, 1, 4, 7, 2, 5, 8}
	elseif targetRoleColumn == 1 then
		targetPosIndex = {1, 4, 7, 0, 3, 6, 2, 5, 8}
	else
		targetPosIndex = {2, 5, 8, 0, 3, 6, 1, 4, 7}
	end

	for i=0,2 do
		for j=1,3 do
			local posIndex = targetPosIndex[i*3+j]
			if attackRolePos < 9 then
				posIndex = posIndex + 9
			end
			local role = self.map[posIndex]
			if role ~= nil and role:IsLive() and role:HaveFrozenBuff() == false and role ~= singleTarget[1] then
				local num = #targetList
				targetList[num+1] = role
			end
		end
		
		if #targetList > 0 then
			break
		end
	end

	return targetList
end

function BattleRoleManager:GetRandomTarget(bEnemy, targetNum)
	local targetList = {}
	local liveList = self:GetAllLiveRole(bEnemy, false, true)
	for i=1,targetNum do
		local liveNum = liveList:length()
		if liveNum > 0 then
			local randomIndex = math.random(1, liveNum)
			local num = #targetList
			targetList[num+1] = liveList:objectAt(randomIndex)
			liveList:removeObjectAt(randomIndex)
		end
	end
	return targetList
end

function BattleRoleManager:IsEnemyAllDie()
	for k,role in pairs(self.map) do
		if role.logicInfo.bEnemyRole and role:IsLive() then
			return false
		end
	end
	return true
end

function BattleRoleManager:IsSelfAllDie()
	for k,role in pairs(self.map) do
		if role.logicInfo.bEnemyRole == false and role:IsLive() then
			return false
		end
	end
	return true
end

function BattleRoleManager:AllRoleBack( targetRole )
	for k,role in pairs(self.map) do
		if role:IsLive() and role ~= targetRole and role:isNeedBack() then
			print(role.logicInfo.name .."赶紧滚回去11")
			role:ReturnBack()
			return true
		end
	end
	return false
end

function BattleRoleManager:GetAllLiveRole(bEnemy, bExcludeFullHp, bExcludeFrozenRole)
	local list = TFArray:new()
	for k,role in pairs(self.map) do
		local bValidRole = true
		if bExcludeFullHp and role.currHp == role.maxhp then
			bValidRole = false
		end

		if bExcludeFrozenRole and role:HaveFrozenBuff() then
			bValidRole = false
		end

		if bValidRole then
			if bEnemy then
				if role.logicInfo.bEnemyRole and role:IsLive() then
					list:pushBack(role)
				end
			else
				if role.logicInfo.bEnemyRole == false and role:IsLive() then
					list:pushBack(role)
				end
			end
		end
	end
	return list
end

-- --血量升序
-- function sortCurrentHpAsc(role1, role2)
-- 	local full_1 = role1.currHp == role1.maxhp
-- 	local full_2 = role2.currHp == role2.maxhp
-- 	if full_1 == full_2 then
-- 		if  (role1.currHp/role1.maxhp) > (role2.currHp/role2.maxhp) then
--     	    return false
--     	else
--     	    return true
--     	end
--     else
--     	if full_2 then
--     		return true
--     	else
--     		return false
--     	end
-- 	end
-- end

-- --当前血量降序
-- function sortCurrentHpDesc(role1, role2)
-- 	local full_1 = role1.currHp == role1.maxhp
-- 	local full_2 = role2.currHp == role2.maxhp
-- 	if full_1 == full_2 then
-- 		if (role1.currHp/role1.maxhp) < (role2.currHp/role2.maxhp) then
--     	    return false
--     	else
--     	    return true
--     	end
--     else
--     	if full_1 then
--     		return true
--     	else
--     		return false
--     	end
-- 	end
-- end

-- --防御降序
-- function sortDefenceDesc(role1, role2)
-- 	if role1:GetAttrNum(3) < role2:GetAttrNum(3) then
--         return false
--     else
--         return true
--     end
-- end

-- --防御升序
-- function sortDefenceAsc(role1, role2)
-- 	if role1:GetAttrNum(3) > role2:GetAttrNum(3) then
--         return false
--     else
--         return true
--     end
-- end

--[[
获得有效的目标
@return 有效的目标列表，返回的是TFArray
]]
function BattleRoleManager:GetValidTargets(bEnemy)
	local list = TFArray:new()
	for k,role in pairs(self.map) do
		if role.logicInfo.bEnemyRole == bEnemy and role:IsValidTarget() then
			list:pushBack(role)
		end
	end
	if list:length() < 1 then
		for k,role in pairs(self.map) do
			if role.logicInfo.bEnemyRole == bEnemy and role:IsLive() then
				list:pushBack(role)
			end
		end
	end
	return list
end

-- --根据某属性获得目标角色
-- function BattleRoleManager:GetTargetByAttr(attrType, bEnemy, bMax, roleNum)
-- 	local validTargets = self:GetValidTargets(bEnemy)
-- 	--如果没有一个有效的目标则返回nil
-- 	if not validTargets or validTargets:length() < 1 then
-- 		return nil
-- 	end

-- 	--属性排序，由变量bMax决定是降序还是升序
-- 	if attrType == 1 then
-- 		if bMax then
-- 			validTargets:sort(sortCurrentHpDesc)
-- 		else
-- 			validTargets:sort(sortCurrentHpAsc)
-- 		end
-- 	elseif attrType == 2 then
-- 		if bMax then
-- 			validTargets:sort(sortDefenceDesc)
-- 		else
-- 			validTargets:sort(sortDefenceAsc)
-- 		end
-- 	end

-- 	local validCount = validTargets:length()
-- 	local maxNum = math.min(roleNum,validCount)

-- 	--转换为table表（sb）
-- 	local tbl = {}
-- 	local index = 0
-- 	for v in validTargets:iterator() do
-- 		index = index + 1
-- 		tbl[index] = v
-- 		if index >= maxNum then
-- 			break
-- 		end
-- 	end

-- 	return tbl


-- 	-- local bExcludeFullHp = false
-- 	-- if attrType == 1 then
-- 	-- 	bExcludeFullHp = true
-- 	-- end

-- 	-- local targetRole = {}
-- 	-- local liveRole = self:GetValidTarget(bEnemy)
-- 	-- local liveRoleNum = liveRole:length()
-- 	-- if liveRoleNum == 0 then
-- 	-- 	if bExcludeFullHp then
-- 	-- 		liveRole = self:GetAllLiveRole(bEnemy, false, true)
-- 	-- 	end
-- 	-- end

-- 	-- --由大到小排序
-- 	-- if attrType == 1 then
-- 	-- 	liveRole:sort(cmpHpFun)
-- 	-- elseif attrType == 2 then
-- 	-- 	liveRole:sort(cmpDefFun)
-- 	-- end

-- 	-- if bExcludeFullHp then
-- 	-- 	local fullHpList = self:GetFullHpRole(bEnemy)
-- 	-- 	for i=1,#fullHpList do
-- 	-- 		liveRole:pushFront(fullHpList[i])
-- 	-- 	end
-- 	-- end

-- 	-- liveRoleNum = liveRole:length()
-- 	-- if liveRoleNum == 0 then
-- 	-- 	return targetRole
-- 	-- end

-- 	-- if bMax then
-- 	-- 	local i = 1
-- 	-- 	local count = #targetRole
-- 	-- 	while i <= liveRoleNum and count < roleNum do
--  --        	targetRole[count+1] = liveRole:objectAt(i)
--  --        	i = i + 1
--  --        	count = #targetRole
--  --    	end
--  --    else
--  --    	local i = liveRoleNum
-- 	-- 	local count = #targetRole
-- 	-- 	while i >= 1 and count < roleNum do
--  --        	targetRole[count+1] = liveRole:objectAt(i)
--  --        	i = i - 1
--  --        	count = #targetRole
--  --    	end
-- 	-- end

-- 	-- return targetRole
-- end

function BattleRoleManager:GetFullHpRole(bEnemy)
	local fullHpList = {}
	for k,role in pairs(self.map) do
		if role.logicInfo.bEnemyRole == bEnemy and role.currHp == role.maxhp then
			fullHpList[#fullHpList+1] = role
		end
	end

	return fullHpList

end

function BattleRoleManager:GetCharmActionTarget(attackRole)
	local target = nil 
	local maxHp = 0
	for k,role in pairs(self.map) do
		if attackRole.logicInfo.bEnemyRole then
			if role.logicInfo.bEnemyRole and role.currHp > maxHp and attackRole ~= role then
				target = role
				maxHp = role.maxhp
			end
		else
			if role.logicInfo.bEnemyRole == false and role.currHp > maxHp and attackRole ~= role then
				target = role
				maxHp = role.maxhp
			end
		end
	end
	return target
end

function BattleRoleManager:GetDefianceTarget(attackRole)
	for k,role in pairs(self.map) do
		if role:IsLive() and attackRole.defianceTarget == role then
			return role
		end
	end
	return nil
end

function BattleRoleManager:IsSameSide(roleList)
	local roleNum = #roleList
	if roleNum == 0 then
		return false
	end

	local side = roleList[1].logicInfo.bEnemyRole
	for i=2,roleNum do
		if roleList[i].logicInfo.bEnemyRole ~= side then
			return false
		end
	end

	return true
end

function BattleRoleManager:GetEnemyMainRole()
	for k,role in pairs(self.map) do
		if role.logicInfo.bEnemyRole then
			role.logicInfo.skill1 = role.logicInfo.skill1 or 0
			role.logicInfo.skill2 = role.logicInfo.skill2 or 0
			if role.logicInfo.skill1 ~= 0 or role.logicInfo.skill2 ~= 0 then
				return role
			end
		end
	end
	return nil
end

function BattleRoleManager:AddAnger(bEnemy, angerNum)
	if bEnemy then
		self.enemyAnger = self.enemyAnger + angerNum
	else
		self.selfAnger = self.selfAnger + angerNum
	end

	self.enemyAnger = math.min(self.enemyAnger, self.fullAnger)
	self.enemyAnger = math.max(self.enemyAnger, 0)

	self.selfAnger = math.min(self.selfAnger, self.fullAnger)
	self.selfAnger = math.max(self.selfAnger, 0)

	if not bEnemy then
		TFDirector:currentScene().fightUiLayer:RefreshAngerBar()
	end
end

function BattleRoleManager:OnExecuteManualAction(actionInfo)
	local attackRole = self:GetRoleByGirdIndex(actionInfo.attackerpos)
	if attackRole == nil then
		return
	end

	attackRole.skillCD = attackRole:GetSkillCD()
	if not attackRole.logicInfo.bEnemyRole then
		TFDirector:currentScene().fightUiLayer:OnExecuteManualAction(actionInfo.attackerpos)
	end

	attackRole:RemoveBodyEffect("skill_yuyue")
end

function BattleRoleManager:OnRemoveManualAction(actionInfo)
	local attackRole = self:GetRoleByGirdIndex(actionInfo.attackerpos)
	if attackRole == nil then
		return
	end

	if not attackRole.logicInfo.bEnemyRole then
		TFDirector:currentScene().fightUiLayer:OnExecuteManualAction(actionInfo.attackerpos)
	end

	attackRole:RemoveBodyEffect("skill_yuyue")
end

function BattleRoleManager:GetTotalHaloAttrAdd(bEnemyRole, attrIndex)
	local selfAttrAdd = 0
	local enemyAttrAdd = 0

	for k,role in pairs(self.map) do
		if role:IsLive() then
			for haloType, haloAttr in pairs(role.haloTypeList) do
				local haloAttrNum 	= haloAttr[attrIndex] or 0
				haloAttrNum 		= math.abs(haloAttrNum)
				if (haloAttrNum > 0) then
					if role.logicInfo.bEnemyRole then
						if haloType == 5 then --增益光环
							enemyAttrAdd = enemyAttrAdd + haloAttrNum
						else
							selfAttrAdd = selfAttrAdd - haloAttrNum
						end
					else
						if haloType == 5 then --增益光环
							selfAttrAdd = selfAttrAdd + haloAttrNum
						else
							enemyAttrAdd = enemyAttrAdd - haloAttrNum
						end
					end
				end
			end
		end
	end
	if bEnemyRole then
		return enemyAttrAdd
	else
		return selfAttrAdd
	end
end

function BattleRoleManager:CleanFrozenBuffRole(bEnemyRole)
	local maxLastNum = -1
	local frozenBuffRole = nil 
	local liveList = self:GetAllLiveRole(bEnemyRole)
	local liveNum = liveList:length()
   	for i=1,liveNum do
  		local role = liveList:objectAt(i)
  		local frozenBuff = role:GetBuffByType(14)
  		if frozenBuff ~= nil and frozenBuff.lastNum > maxLastNum then
  			frozenBuffRole = role
  			maxLastNum = frozenBuff.lastNum
  		end
  	end

  	if frozenBuffRole ~= nil then
  		frozenBuffRole:RemoveFrozenBuff()
  		return true
  	else
  		return false
  	end
end

function BattleRoleManager:HaveBadBuffRole(bEnemyRole)
	local liveList = self:GetAllLiveRole(bEnemyRole)
	local liveNum = liveList:length()
   	for i=1,liveNum do
  		local role = liveList:objectAt(i)
  		if role:HaveBadBuff() then
  			return true
  		end
  	end
  	return false
end

function BattleRoleManager:HaveNeedCureRole(bEnemyRole)
	local liveList = self:GetAllLiveRole(bEnemyRole)
	local liveNum = liveList:length()
   	for i=1,liveNum do
  		local role = liveList:objectAt(i)
  		if role.currHp / role.maxhp < 0.5 then
  			return true
  		end
  	end
  	return false
end

function BattleRoleManager:ClearAllRoleBuff()
	for k,role in pairs(self.map) do
		if role:IsLive() then
			role:RemoveAllBuff()
		end
	end
end

function BattleRoleManager:GetFrontRoleNum(targetRole, targetList)
	local num = 0
	local targetNum = #targetList
	local rowIndex = targetRole:GetRowIndex()
	for i=1,targetNum do
		local role = targetList[i]
		if role.logicInfo.posindex < targetRole.logicInfo.posindex and rowIndex == role:GetRowIndex() then
			num = num + 1
		end
	end
	return num
end

--治疗血量溢出
function BattleRoleManager:GetSkillAddMaxHpByRole(bEnemyRole)
	local selfRoleList 	= self:GetAllLiveRole(bEnemyRole, false, false)
	for role in selfRoleList:iterator() do
		--if (targetIndex ~= role.logicInfo.posindex) then
			local skillInfo = role:getPassiveSkillInfoByEffect(EnumFightSpellEffect.effect_69)
			if (skillInfo) then
				return (skillInfo.effect_value / 100)
			end
		--end
	end
	return 0
end
return BattleRoleManager