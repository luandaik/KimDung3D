-- client side CustomSkillAiManage.lua
--[[
 * @Description: 自定义技能管理器
 ]]
-- script writer Happy.All
-- creation time 2016-06-22


local CustomSkillAiManage = class("CustomSkillAiManage")

CustomSkillAiManage.updateSkillInfoSuccess = "CustomSkillAiManage.updateSkillInfoSuccess"

function CustomSkillAiManage:ctor(data)
    
    self:restart()

    TFDirector:addProto(s2c.CUSTOM_SKILL_STRATEGY_INFO, self, self.onCustomSkillMessage)
    TFDirector:addProto(s2c.UPDATE_CUSTOM_SKILL_SUCESS, self, self.onSaveDataSuccess)
end

function CustomSkillAiManage:restart()
	self.customSkillData = {}

end

function CustomSkillAiManage:openBloodChoseLayer( txtTitle, number, callback )
	local layer = AlertManager:addLayerByFile("lua.logic.customSkillAi.CustomBloodChoseLayer")
	layer:setData(txtTitle, number, callback)
    AlertManager:show()
end

function CustomSkillAiManage:openCustomSkillAiLayer( strategyType )

	local openLev = FunctionOpenConfigure:getOpenLevel(2209) or 35
	if MainPlayer:getLevel() < openLev then
		local string = stringUtils.format(localizable.CustomSkillOpenLevel, openLev)
		toastMessage(string)
		return
	end	

	strategyType = strategyType or EnumFightStrategyType.StrategyType_PVE
	local skillData = self:getCustomSkillInfoByType( strategyType )

	local layer = AlertManager:addLayerByFile("lua.logic.customSkillAi.CustomSkillAiLayer")
	layer:setData(strategyType,skillData)
    AlertManager:show()
end

function CustomSkillAiManage:openRoleSelectLayer( RoleList, moveType, callback)
	local layer = require("lua.logic.customSkillAi.CustomRoleSelect"):new(moveType)
	AlertManager:addLayer(layer,AlertManager.BLOCK,AlertManager.TWEEN_NONE)
	layer:initDate(RoleList, localizable.practiceChooseLayer_check_hero, callback)
    AlertManager:show()
end

function CustomSkillAiManage:openCustomSkillConditionLayer( callback )
	local layer = require("lua.logic.customSkillAi.CustomSkillCondition"):new()
	AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
	layer:setData(callback)
    AlertManager:show()
end

function CustomSkillAiManage:onCustomSkillMessage( event )
	local data = event.data.infos or {}
	self.customSkillData = {}
	for k,v in pairs(data) do
		self.customSkillData[v.strategyType] = clone(v)
	end
end

function CustomSkillAiManage:getCustomSkillInfoByType( type )
	if self.customSkillData[type] then
		return self.customSkillData[type]
	end
	return nil
end

--检测自定义技能是否有效
function CustomSkillAiManage:checkShowTipsIcon( strategyType )
	local roleID = {}
	local roleList = ZhengbaManager:getFightList( strategyType ) or {}
	for k,v in pairs(roleList) do
		local role = CardRoleManager:getRoleByGmid(v)
		if role then
			roleID[role.id] = true
		end
	end
	local skillInfo = self:getCustomSkillInfoByType(strategyType)
	if skillInfo == nil then
		return false
	end
	if skillInfo.isUse == nil or skillInfo.isUse == false then
		return false
	end

	local baseOrder = skillInfo.baseOrder or {}
	for k,v in pairs(baseOrder) do
		if roleID[v] == nil then
			return true
		end
	end
	local specialOrder = skillInfo.specialOrder or {}
	for k,v in pairs(specialOrder) do
		if roleID[v.roleId] == nil then
			return true
		end
	end
	return false
end

function CustomSkillAiManage:sendDataToServer( data )
	
	showLoading()

	print("data = ",data)

	local msgData = {}

	msgData.strategyType = data.strategyType
	msgData.isUse = data.isUse
	msgData.baseOrder = {}
	for i=1,9 do
		if data.baseOrder[i] and data.baseOrder[i] ~= 0 then
			table.insert(msgData.baseOrder, data.baseOrder[i])
		end
	end
	msgData.specialOrder = {}
	for i=1,7 do
		if data.specialOrder[i] and (data.specialOrder[i].roleId and data.specialOrder[i].roleId ~= 0) then
			if data.specialOrder[i].specialOrderType and
			 (data.specialOrder[i].specialOrderType > 0 and data.specialOrder[i].specialOrderType < 4) then				
				table.insert(msgData.specialOrder, data.specialOrder[i])
			end
		end
	end	
	self.msgData = msgData
	local msg = {
		msgData.strategyType,
		msgData.isUse,
		msgData.baseOrder,
	}
	local specialOrder = {}
	local idx = 1
	for k,v in pairs(msgData.specialOrder) do
		specialOrder[idx] = {}

		specialOrder[idx][1] = v.roleId
		specialOrder[idx][2] = v.isCheckBox
		specialOrder[idx][3] = v.specialOrderType
		specialOrder[idx][4] = v.percentNum
		idx = idx + 1
	end
	msg[4] = specialOrder

	print('msg = ',msg)
	TFDirector:send(c2s.CUSTOM_SKILL_INFO_CLIENT,msg)

	-- self:onSaveDataSuccess()
end

function CustomSkillAiManage:onSaveDataSuccess( event )

	hideLoading()

	self.customSkillData[self.msgData.strategyType] = nil
	self.customSkillData[self.msgData.strategyType] = clone(self.msgData)

	-- TFDirector:dispatchGlobalEventWith(CustomSkillAiManage.updateSkillInfoSuccess, {})
end

function CustomSkillAiManage:checkIsOpen()
	local skillAILock = VersionLockData:objectByID(EnumVersionLockType.SkillAI_Lock)
    if skillAILock and skillAILock.open == 0 then
        return false
    end
	local openLev = FunctionOpenConfigure:getOpenLevel(2209) or 35
	if MainPlayer:getLevel() < openLev then
		return false
	end
	return true
end

return CustomSkillAiManage:new()