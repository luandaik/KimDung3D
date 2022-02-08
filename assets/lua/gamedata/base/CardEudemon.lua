--[[
******宠物类*******
	-- by fei
	-- 2017/03/01
]]

local GameObject 		= require('lua.gamedata.base.GameObject')
local GameAttributeData = require('lua.gamedata.base.GameAttributeData')

local CardEudemon 		= class("CardEudemon",GameObject)

function CardEudemon:ctor( Data )
	self.super.ctor(self)
	self:init(Data)
end

function CardEudemon:init( id )
	self.fightAttribute				= GameAttributeData:new()	--出战属性
	self.teamAttribute				= GameAttributeData:new()	--团队属性
	self.tupoAttribute				= GameAttributeData:new()	--突破属性
	self.XunYuAttribute				= GameAttributeData:new()	--驯驭属性
	self.petAttribute				= GameAttributeData:new()	--驯养战宠加成属性(个人)
	self.petExtAttribute			= GameAttributeData:new()	--驯养战宠加成属性(团队)

	self.instanceId 		= id
	self.eudemonTypeId 		= 0
	self.fightType 			= 1
	self.name				= ""						         --姓名
	self.quality			= EudemonManager.MIN_QUALITY 		 --品质
	self.starLevel			= 0							         --突破星级
	self.formationType		= {}						         --出战阵容列表
	self.trainerId 			= 0
	self.skillList			= {}
	self.itemTypeId   		= 0
	self.xunYanInfo			= {}
	self.xunYanAttribute 	= {}						          --战宠驯养属性
	self.extId 				= {}								  --战宠额外属性

	--
	self.bigImage 			= ""
	self.iconImage			= ""
	--装备的技能
	self.XunyuOrder 		= {}
	--技能的等级
	self.XunyuLevel 		= {}

end
function CardEudemon:getHoleLevelValue(index)
	return self.xunYanInfo[index] or nil
end
function CardEudemon:getXunYuLevelValue(index)
	return tonumber(self.XunyuLevel[index]) or 0
end
function CardEudemon:setHoleLevelValue(acupoint, quality, level)
	-- self.xunYanAttribute:clear()
	--因为每次服务器都是传5个孔的信息，这个函数会调用5次，所以在第一次设定的时候清空
	if acupoint == 1 then
		self.xunYanInfo = {}
		self.extId = {}
	end

	
	self.xunYanInfo[acupoint] 			= {}
	self.xunYanAttribute[acupoint] 		= self.xunYanAttribute[acupoint] or GameAttributeData:new()
	self.xunYanAttribute[acupoint]:clear()
	--
	self.xunYanInfo[acupoint].acupoint 	= acupoint
	self.xunYanInfo[acupoint].quality 	= quality
	self.xunYanInfo[acupoint].level 	= level
	local attribute = BattlePetTrainingData:GetPetAttrByHole(acupoint, level)
	if (attribute) then
		for attrId,attrValue in pairs(attribute) do
			self.xunYanAttribute[acupoint]:addAttr(tonumber(attrId), tonumber(attrValue))
		end 
	end
	--
	-- local qualityList = {}
	-- for k,v in pairs(self.xunYanInfo) do
	-- 	local quality = v.quality
	-- 	for i=quality, 1,-1 do
	-- 		qualityList[i] = qualityList[i] or 0
	-- 		qualityList[i] = qualityList[i] + 1
	-- 	end
	-- end

	-- for k,v in pairs(qualityList) do
	-- 	local TrainingPetInfo = TrainingPetData:GetAttrByQulityNumber(k,v)
	-- 	for k,i in pairs(TrainingPetInfo) do
	-- 		if self.extId[i.id%3] == nil then
	-- 			self.extId[i.id%3] = i.id
	-- 		elseif self.extId[i.id%3] < i.id then
	-- 			self.extId[i.id%3] = i.id
	-- 		end
	-- 	end
	-- end
	-- for k,v in pairs(self.extId) do
	-- 	local addtype = TrainingPetData:GetTypeById(v)
	-- 	if addtype == 2 then
	-- 		local attribute = TrainingPetData:GetAttrById(v)
	-- 		for attrId,attrValue in pairs(attribute) do
	-- 			self.petAttribute:addAttr(tonumber(attrId), tonumber(attrValue))
	-- 		end
	-- 	elseif addtype == 1 or addtype == 3 then
	-- 		local attribute = TrainingPetData:GetAttrById(v)
	-- 		for attrId,attrValue in pairs(attribute) do
	-- 			self.petExtAttribute:addAttr(tonumber(attrId), tonumber(attrValue))
	-- 		end
	-- 	end
	-- end
	
	-- self:updateAttr()
end
--获取单孔属性
function CardEudemon:getXunYanSingleAttributeByIndex(index)
	return self.xunYanAttribute[index]
end
function CardEudemon:getXunYanAttribute()
	local temp = GameAttributeData:new()
	for i = 1, 5 do
		if self.xunYanAttribute[i] then
			for attrId,attrValue in pairs(self.xunYanAttribute[i].attribute) do
				temp:addAttr(tonumber(attrId),tonumber(attrValue))
			end
		end
	end

	if self.petAttribute then
		for attrId,attrValue in pairs(self.petAttribute.attribute) do
			temp:addAttr(tonumber(attrId),tonumber(attrValue))
		end
	end
	temp:refreshBypercent()
	if self.petExtAttribute then
		for attrId,attrValue in pairs(self.petExtAttribute.attribute) do
			temp:addAttr(tonumber(attrId),tonumber(attrValue))
		end
	end

	return temp--self.xunYanAttribute
end
function CardEudemon:getXunYan()
	local temp = GameAttributeData:new()
	for i = 1, 5 do
		if self.xunYanAttribute[i] then
			for attrId,attrValue in pairs(self.xunYanAttribute[i].attribute) do
				temp:addAttr(tonumber(attrId),tonumber(attrValue))
			end
		end
	end

	-- temp:refreshBypercent()
	if self.petAttribute then
		for attrId,attrValue in pairs(self.petAttribute.attribute) do
			temp:addAttr(tonumber(attrId),tonumber(attrValue))
		end
	end
	temp:refreshBypercent()
	return temp--self.xunYanAttribute
end
function CardEudemon:setPetAttribute(data)
	-- print("self.setPetAttribute = ",data)
	self.petAttribute:clear()
	self.petExtAttribute:clear()
	local qualityList = {}
	for k,v in pairs(data) do
		local quality = v.quality
		for i=quality, 1,-1 do
			qualityList[i] = qualityList[i] or 0
			qualityList[i] = qualityList[i] + 1
		end
	end
	-- print("qualityList = ",qualityList)

	local attIdList = {}
	for k, v in pairs(qualityList) do
		local TrainingPetId = TrainingPetData:GetAttrByQulityNumber(k,v)
		for _, id in pairs(TrainingPetId) do
			table.insert(attIdList,id)
		end
	end
	-- print("CardEudemon:setPetAttribute:attIdList = ",attIdList)
	for k,v in pairs(attIdList) do
		local addtype = TrainingPetData:GetTypeById(v)
		local attribute = TrainingPetData:GetAttrById(v)
		if addtype == 1 then		
			for attrId,attrValue in pairs(attribute) do
				self.petAttribute:addAttr(tonumber(attrId), tonumber(attrValue))
			end
		elseif addtype == 2 then
			for attrId,attrValue in pairs(attribute) do
				self.petExtAttribute:addAttr(tonumber(attrId), tonumber(attrValue))
			end
		end
	end
end

function CardEudemon:initEudmonData(typeId)
	local data 		= BattlePetData:objectByID(typeId)
	local quality 	= self:getQuality()
	local starLevel = self:getStarLevel()
	if (data) then
		local icon = string.split(data.icon, ",")
		local tempId = tonumber(icon[quality])
		if (tempId) then
			local item = ItemData:objectByID(tempId)
	    	if (item) then
				self:setName(item.name)
			else
				self:setName(data.describ)
			end
			self.itemTypeId = tempId
			self.iconImage 	= "icon/item/".. tempId  .. ".png"
		end
		--
		local pic 	= string.split(data.pic, ",")
		if (pic[quality]) then
			self.bigImage 	= "ui_new/pet/".. pic[quality] .. ".png"
		end
		--
		self.fightType = data.type
	end
	local qualityData = EudemonManager:getBattlePetQualityData(quality, typeId, starLevel)

	if (qualityData) then
		self.skillList = string.split(qualityData.effect_id, ",") or {}
	end
end
function CardEudemon:getId()
	return self.instanceId
end
--
function CardEudemon:getEudemonTypeId()
	return self.eudemonTypeId
end
--
function CardEudemon:getFightTypeId()
	return self.fightType
end

--技能列表
function CardEudemon:getSkillList()
	return self.skillList
end
--是否出战
function CardEudemon:getHelpFightList()
	return self.formationType
end
--
function CardEudemon:isHelpFight(fightType)
	if (fightType == nil) then
		return (#self.formationType > 0)
	end
	-- if (self.formationType[fightType]) then
	for i,v in pairs(self.formationType) do
		if (fightType == v) then
			return true
		end
	end
	return false
end
function CardEudemon:addHelpFight(fightType, isUse, isUpAttr)
	if (isUse) then
		table.insert(self.formationType, fightType)
	else
		for i,v in pairs(self.formationType) do
			if (fightType == v) then
				table.remove(self.formationType, i)
				break
			end
		end
	end
	
	-- self.formationType[fightType] = isUse
	self:updateAttr(isUpAttr)
	if (isUpAttr ~= false) then
		EudemonManager:refreshRoleAttr(fightType)
	end
end

function CardEudemon:setName(name)
	self.name = name
end

function CardEudemon:getName()
	return self.name
end

--设置星级值
function CardEudemon:setStarLevel( starLevel, isUpAttr )
	starLevel = tonumber(starLevel)
	if starLevel >= 0 and EudemonManager.MAX_STAR_LEVEL then
		self.starLevel = starLevel
		self:updateAttr(isUpAttr)
	end
end

function CardEudemon:getStarLevel()
	return self.starLevel
end

function CardEudemon:getQuality()
	return self.quality
end
function CardEudemon:getHoleByIndex(index)
	return self.HoleLevelList[index]
end

function CardEudemon:setQuality(quality, isUpAttr)
	
	if (quality > EudemonManager.MAX_QUALITY) then
		quality = EudemonManager.MAX_QUALITY
	elseif (quality < EudemonManager.MIN_QUALITY) then
		quality = EudemonManager.MIN_QUALITY
	end
	self.quality = quality
	self:updateAttr(isUpAttr)
end

--驯养角色
function CardEudemon:getTrainingRoleId()
	local trainingRoleInfo 	= CardRoleManager:getRoleByGmid(self.trainerId)
	if (trainingRoleInfo == nil) then
		self.trainerId = 0
	end
	return self.trainerId
end
--
function CardEudemon:getXunhuaConsume(acupoint, level)

	return BattlePetTrainingData:GetPetConsumesByHole(acupoint, level)
end
function CardEudemon:setTrainingRoleId(roleid, isUpAttr)
	if (self:isOpenTraining()) then
		self.trainerId = roleid
		self:updateAttr(isUpAttr)
	end
end
--是否开启训养师
function CardEudemon:isOpenTraining()
	return self:getQuality() >= EudemonManager.OPEN_TRAINING_QUALITY
end

--更新所有属性
function CardEudemon:updateAttr(isUpAttr)

	if (isUpAttr == false) then
		return
	end
	-- print(self:getName(), "  宠物更新所有属性")
	self.teamAttribute:clear()
	--
	--突破属性加成
	self:updateTupoAttr()
	for attrId,value in pairs(self.tupoAttribute.attribute) do
		self.teamAttribute:addAttr(attrId, value)
	end
	--驯养属性加成
	local xunYanAttribute = self:getXunYan()
	for attrId,value in pairs(xunYanAttribute.attribute) do
		if value == 0 then 
			break
		end
		self.teamAttribute:addAttr(attrId, value)
	end
	--驯养宠物团队加成
	local xunYanPetAttribute = self:getPetExtAttribute()
	for attrId,value in pairs(xunYanPetAttribute.attribute) do
		if value == 0 then 
			break
		end
		self.teamAttribute:addAttr(attrId, value)
	end
	self.teamAttribute:refreshBypercent()
	--驯驭属性加成
	self:updateXunYuAttr()
	for attrId,value in pairs(self.XunYuAttribute.attribute) do
		if value ~= 0 then
			self.teamAttribute:addAttr(attrId, value)
		end
	end
	local fightList = self:getHelpFightList()
	for i,fightType in pairs(fightList) do
		local tab = ZhengbaManager:getFightList(fightType)
        for k, roleId in pairs(tab) do
            if roleId and roleId ~= 0 then
                local cardRole = CardRoleManager:getRoleByGmid(roleId)
				if (cardRole) then
					cardRole:updateTotalAttr()
				end
            end
        end
	end
end

--更新突破属性
function CardEudemon:updateTupoAttr()
	self.tupoAttribute:clear()
	local quality 	= self:getQuality()
	local attrList 	= EudemonManager:getEudemonTeamAttr(self:getQuality(), self:getEudemonTypeId(), self:getStarLevel())
	for attrId, attrValue in pairs(attrList) do
		self.tupoAttribute:addAttr(attrId, attrValue)
	end
end
--更新驯驭属性
function CardEudemon:updateXunYuAttr()
	self.XunYuAttribute:clear()
	for i = 1,4 do 
		local attr 	= BattlePetTameData:GetPetXunYuAttributebyIdxAndLevel(i,self.XunyuLevel[i])
		if attr then
			for attrId, attrValue in pairs(attr) do
				local percent = 0
				for i = 1,4 do
					if attrId == tonumber(self.XunyuOrder[i]) then
						percent = EudemonManager.XunYupercent[i]
						break;
					end
				end
				self.XunYuAttribute:addAttr(attrId, attrValue * percent)
			end
		end
	end
end
--获得出战属性
function CardEudemon:getFightAttribute(fightType)
	local fightAttribute	= GameAttributeData:new()	--出战属性
	local eudemonData = EudemonManager:getBattlePetQualityData(self:getQuality(), self:getEudemonTypeId(), self:getStarLevel())
	local num = string.split(eudemonData.base_growth, ",")
	local n = (tonumber(num[1]) or 1) - 1
	local m = (tonumber(num[2]) or 1) - 1
    local roleList = ZhengbaManager:getFightList(fightType)
    for _,roleId in pairs(roleList) do
        local cardRole = CardRoleManager:getRoleByGmid(roleId)
        if (cardRole) then
        	for k,attrId in pairs(EudemonAttributeTypeList) do  
	         	local attrValue = cardRole:getTotalAttributeByFightType(fightType, attrId) or 0
	         	attrValue = math.floor(attrValue * n)
	        	if (attrValue > 0) then
	        		fightAttribute:addAttr(attrId, attrValue)
	        	end
	        end
        end
    end
	--驯养侠客的m% 已上阵侠客不加属性
	local trainingRoleID 	= self:getTrainingRoleId()
	if (EudemonManager:isEudemonRoleIdFight(trainingRoleID, fightType) == false) then
		local trainingRoleInfo 	= CardRoleManager:getRoleByGmid(trainingRoleID)
		if (trainingRoleInfo) then
			for k,attrId in pairs(EudemonAttributeTypeList) do
	        	local attrValue = trainingRoleInfo:getTotalAttribute(attrId) or 0
	        	--local attrValue = trainingRoleInfo:getTotalAttributeByFightType(fightType, attrId) or 0
	        	attrValue = math.floor(attrValue * m)
	        	if (attrValue > 0) then
	        		fightAttribute:addAttr(attrId, attrValue)
	        	end
	        end
		end
	end
	local petAttr = self:getPetAttribute()
	if petAttr then
		for attrId,attrValue in pairs(petAttr.attribute) do
			fightAttribute:addAttr(tonumber(attrId),tonumber(attrValue))
		end
	end
	fightAttribute:refreshBypercent()
	return fightAttribute
end

--获得突破属性
function CardEudemon:getTupoAttribute()
	return self.tupoAttribute
end
--获得驯驭属性
function CardEudemon:getXunYuAttribute()
	return self.XunYuAttribute
end

--获得团队属性
function CardEudemon:getTeamAttribute()	
	return self.teamAttribute
end
--获得战宠个人加成属性
function CardEudemon:getPetAttribute()
	return self.petAttribute
end
--
--获得战宠团队加成属性
function CardEudemon:getPetExtAttribute()
	return self.petExtAttribute
end
function CardEudemon:getBigImagePath()
	return self.bigImage
end
--
function CardEudemon:getIconPath()
	return self.iconImage
end
--
function CardEudemon:setData(data)
	if (data.instanceId) then
		self.instanceId = data.instanceId
	end
	if (data.templateId) then
		self.eudemonTypeId = data.templateId
	end
	if (data.quality) then
		self:setQuality(data.quality, false)
	end
	if (data.star) then
		self:setStarLevel(data.star, false)
	end
	if (data.trainerId) then
		self:setTrainingRoleId(data.trainerId, false)
	end
	if (data.formationType) then
		self.formationType = data.formationType
	end
	if (data.holeAttResponse) then
		for i,info in ipairs(data.holeAttResponse) do
			self:setHoleLevelValue(info.type,info.quality,info.level)
		end
		self:setPetAttribute(data.holeAttResponse)
	end
	if (data.tameMessage) then
		self.XunyuLevel = string.split(data.tameMessage, '|')
	end
	if (data.tameHole) then
		self.XunyuOrder = string.split(data.tameHole, '|')
	end

	self:initEudmonData(self:getEudemonTypeId())
	--
	
	self:updateAttr()
end
return CardEudemon