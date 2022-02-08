-- client side CardStrategy.lua
--[[
 * @Description: 阵法装备
 ]]
-- script writer Happy.All
-- creation time 2016-07-22

local GameObject = require('lua.gamedata.base.GameObject')
local CardStrategy = class("CardStrategy",GameObject)
local EffectExtraData = clone(EffectExtraDataModel)
 
local GameAttributeData = require('lua.gamedata.base.GameAttributeData')

function CardStrategy:ctor( Data )
	self.super.ctor(self)
	self:init(Data)
end


function CardStrategy:init( Data )
	self.instenifyAttr		= GameAttributeData:new()	--阵法强化属性
	self.deduceAttr			= {}						--阵法推演属性
	self.shenYanAttr		= {}						--阵法深研属性
	self.positonAttr		= {}						--阵位总属性
	self.zhenWeiSpeciaAttr	= {}						--阵位特殊加成
	self.shenYanPassive		= EffectExtraData:new()		--深研被动属性
	self.shenYanPassive:clear()
	self.shenYanActivity	= EffectExtraData:new()		--深研主动属性
	self.shenYanActivity:clear()
	self.baseStrategyAttr   = {}						--阵法的基础属性,深研用

	self.starAttribute = {}
	for i=1,StrategyCardManager.extAttributeMax do
		self.starAttribute[i] 	= GameAttributeData:new()
		self.positonAttr[i] 	= GameAttributeData:new()
		self.deduceAttr[i] 		= GameAttributeData:new()
		self.shenYanAttr[i] 		= GameAttributeData:new()
	end

	self.currPositionNumber = 0 --当前升星开放属性加成位置数量
	self.starLevel 			= 0 --升星等级
	self.strategyPos		= {} --在阵上的位置
	self.level				= 0	--强化等级
	self.currExp			= 0	--当前的强化经验
	self.equip 				= {} -- 装备在那些阵容上 可能存在多个
	self.freeNum			= 0 --免费易位次数
	self.researchInfo		= {} --阵法深研数据
	self.id = Data


	self.gmId 				= 0
	self.config 			= ItemData:objectByID(self.id)
	self.quality = self.config.quality

end
--更新所有阵位总和
function CardStrategy:updatePositonAttr()
	for i,v in ipairs(self.positonAttr) do
		v:clear()
		--突破属性加成
		for attrId,value in pairs(self.starAttribute[i].attribute) do
			v:addAttr(attrId, value)
		end
		-- --推演属性加成
		for attrId,value in pairs(self.deduceAttr[i].attribute) do
			v:addAttr(attrId, value)
		end
		self.baseStrategyAttr[i] = clone(self.positonAttr[i])
		--深研属性加成
		for attrId,value in pairs(self.shenYanAttr[i].attribute) do
			v:addAttr(attrId, value)
		end
	end
end

--获得总属性table表
function CardStrategy:getTotalAttr()
	return self.instenifyAttr:getAttribute()
end
--获得总属性
function CardStrategy:getTotalAttrArray()
	return self.instenifyAttr
end
function CardStrategy:dispose()
	self.super.dispose(self)

	self.starLevel 			= nil
	self.strategyPos		= nil
	self.level				= nil
	self.currExp			= nil
	self.equip 				= nil
	self.gmId 				= nil
	self.config 			= nil
	self.power				= nil

	TFDirector:unRequire('lua.gamedata.base.GameObject')
	TFDirector:unRequire('lua.gamedata.base.GameAttributeData')
end

function CardStrategy:setGmId( gmId )
	self.gmId = gmId
end

--[[
	设置装备强化等级
]]
function CardStrategy:setLevel( level, exp )
	level = level or 0
	exp = exp or 0
	self.level = level
	self.currExp = exp

	self.instenifyAttr:clear()
	local item = BattleArrayData:objectByID(self.id)
	if item == nil then
		print("cannot find the item by id = ",self.id)
		return
	end

	local attrTbl = item:getAttrByLevel(level)
	for k,v in pairs(attrTbl) do
		self.instenifyAttr:addAttr(k,v)
	end
end
--[[
	获取装备强化等级
]]
function CardStrategy:getLevel()
	return self.level
end

--[[
	设置当前激活的属性加成位置
]]
function CardStrategy:setSrategyPos( tbl )
	self.strategyPos = {}
	for k,v in pairs(tbl) do
		self.strategyPos[tonumber(v)+1] = k
	end
end
--[[
	获取当前激活的属性加成位置
]]
function CardStrategy:getSrategyPos()
	return self.strategyPos
end
--[[
	设置装备的突破星级
]]
function CardStrategy:setStarLevel( starLevel )
	starLevel = starLevel or 0
	self.starLevel = tonumber(starLevel)


	local item = BattleArrayStarData:getItemInfo(self.id, starLevel)
	if item == nil then
		print("cannot find the item by id = ",self.id)
		print("cannot find the item by starLevel = ",self.starLevel)
		return
	end

	for k,v in pairs(self.starAttribute) do
		v:clear()
		local attrTbl = item:getAttributeByPos(k)

		for attrIndex,attrValue in pairs(attrTbl) do

			v:addAttr(attrIndex,attrValue)
		end
	end
	self:updatePositonAttr()
	self.currPositionNumber = item.num or 0
end
--[[
	获取装备的突破星级
]]
function CardStrategy:getStarLevel()
	return self.starLevel
end
--[[
	获取装备的突破星级属性
	pos为侠客在阵容上的位置
]]
function CardStrategy:getStarAttributeByStarPos( starPos )
	return self.starAttribute[starPos]
end

--[[
	获取装备的突破星级属性
	pos为侠客在阵容上的位置
]]
function CardStrategy:getStarAttributeByRolePos( rolePos )
	local index = self.strategyPos[rolePos]
	if index then
		return self.starAttribute[index]
	end
end

--总阵位信息
function CardStrategy:getPositonAttributeByRolePos( rolePos )
	local index = self.strategyPos[rolePos]
	if index then
		return self.positonAttr[index]
	end
end
function CardStrategy:getPositonAttributeByPos( rolePos )
	return self.positonAttr[rolePos]
end

function CardStrategy:getOpenPositionNumber()
	return self.currPositionNumber
end
--[[
	设置免费易位次数
]]
function CardStrategy:setFreeNum( freeNum )
	freeNum = freeNum or 0
	self.freeNum = freeNum
end
--[[
	获取免费易位次数
]]
function CardStrategy:getFreeNum()
	return self.freeNum
end

function CardStrategy:getSkillDesAndPower(pos)
	for k, _ in pairs(self.strategyPos) do
		if (k == pos) then
			local item = BattleArrayStarData:getItemInfo(self.id, self.starLevel)
			if item == nil then
				print("cannot find the item by id = ",self.id)
				print("cannot find the item by starLevel = ",self.starLevel)
				return "", 0
			end
			return item.desc2,item.power
		end
	end
	return "", 0
end

function CardStrategy:dressCard( type )
	self.equip[type] = true
end

function CardStrategy:unDressCard( type )
	self.equip[type] = false
end

function CardStrategy:checkInStrategy()
	print("self.config.name = ",self.config.name)
	print("self.equip = ",self.equip)
	for _,v in pairs(self.equip) do
		if v == true then
			return true
		end
	end
	return false
end

function CardStrategy:checkInStrategyByType(LineUpType)
	
	if self.equip[LineUpType] == true then
		return true
	end
	return false
end

function CardStrategy:getQuality()
	return self.config.quality
end

function CardStrategy:getPath()
	return self.config:GetPath()
end

function CardStrategy:getName()
	return self.config.name
end

function CardStrategy:getConfigDetails()
	return self.config.details
end
function CardStrategy:getConfigType()
	return self.config.type
end
function CardStrategy:getConfigKind()
	return self.config.kind
end

function CardStrategy:canStarUp()
	if self.starLevel >= StrategyCardManager.kMaxStarLevel then
		return false
	end
	local nextItem = BattleArrayStarData:getItemInfo(self.id,self.starLevel+1)
	if nextItem then
		local sq = string.split(nextItem.consume, "|")
		for k,item in pairs(sq) do
			local itemTbl = string.split(item, "_")
			local id = tonumber(itemTbl[2])
			local num = tonumber(itemTbl[3])
			local numInBag = BagManager:getItemNumById(id)
			if numInBag < num then
				return false
			end
		end
	else
		return false
	end
	return true
end

function CardStrategy:canInstenify()

	local currItem = BattleArrayStarData:getItemInfo(self.id,self.starLevel)
	if currItem == nil then
		return false
	end
	if self.level >= currItem.intensify_level then
		return false
	end

	local consumes = BattleArrayLevelData:getItemByLevelAndQuality(self.level+1, self.quality)
	if consumes == nil then
		return false
	end

	local consumesTbl = string.split(consumes.consumes, ",")
	
	for _,id in pairs(consumesTbl) do
		local numInBag = BagManager:getItemNumById(tonumber(id))
		if numInBag > 0 then
			return true
		end
	end
	return false
end

function CardStrategy:canTuiYan()
    local isUp = false
    for i=1, StrategyCardManager.extAttributeMax do
        local deduceInfo = StrategyCardManager:getByExpLevel(self:getDeduceExp(i), self:getQuality())
        local currTuiYanLevel =  (deduceInfo[1] or 0)
        local maxTuiYanLevel  =  (deduceInfo[2] or 0)
        if (maxTuiYanLevel > 0) then
        	if (currTuiYanLevel < maxTuiYanLevel) then
        		isUp = true
        		break
        	end
        end
    end
    if (not isUp) then
    	return false
    end
	--
	local costItemList = StrategyCardManager:getDeduceConsumesData()
	for i,v in ipairs(costItemList) do
		local itemId  = tonumber(costItemList[i].goods_id)
		local bagInfo = BagManager:getItemById(itemId)
        local itemNum = 0
        if (bagInfo) then
            itemNum = bagInfo.num
            if (itemNum > 0) then
            	return true
            end
        end
	end
	return false
end
function CardStrategy:getTotalExtAttr( pos )
	local immuneRateTbl = {}
	local effectActiveTbl = {}
	local effectPassiveTbl = {}

	for v in BattleArrayStarData:iterator() do
		if v.item == self.id and v.star == self.starLevel then
			if v.immune_rate ~= "" then
				local data = string.split(v.immune_rate, '|')
				for k,v in pairs(data) do
					local details = string.split(v, '_')
					local attrIdx = tonumber(details[1])
					local value = tonumber(details[2])
					immuneRateTbl[attrIdx] = immuneRateTbl[attrIdx] or 0
					immuneRateTbl[attrIdx] = immuneRateTbl[attrIdx] + value
				end
			end

			if v.effect_active ~= "" then
				local data = string.split(v.effect_active, '|')
				for k,v in pairs(data) do
					local details = string.split(v, '_')
					local attrIdx = tonumber(details[1])
					local value = tonumber(details[2])
					effectActiveTbl[attrIdx] = effectActiveTbl[attrIdx] or 0
					effectActiveTbl[attrIdx] = effectActiveTbl[attrIdx] + value
				end
			end
			if v.effect_passive ~= "" then
				local data = string.split(v.effect_passive, '|')
				for k,v in pairs(data) do
					local details = string.split(v, '_')
					local attrIdx = tonumber(details[1])
					local value = tonumber(details[2])
					effectPassiveTbl[attrIdx] = effectPassiveTbl[attrIdx] or 0
					effectPassiveTbl[attrIdx] = effectPassiveTbl[attrIdx] + value
				end
			end
		-- else
		-- 	return immuneRateTbl,effectActiveTbl,effectPassiveTbl
		end
	end
	for k, v in pairs(self.strategyPos) do 
		if (pos == k) then
			return true, immuneRateTbl,effectActiveTbl,effectPassiveTbl
		end
	end
	return false, immuneRateTbl
end

--获得剩余升星次数
function CardStrategy:getCanStarUpTimes()
	local times = 0
	local starLevel = self.starLevel
	local bStop = false
	for i = 1, 5 do
		if starLevel >= StrategyCardManager.kMaxStarLevel then
			break
		end
		local tab = {}
		for j = self.starLevel + 1, starLevel + 1 do
			local nextItem = BattleArrayStarData:getItemInfo(self.id, j)
			if nextItem then
				local sq = string.split(nextItem.consume, "|")
				for k,item in pairs(sq) do
					local itemTbl = string.split(item, "_")
					local id = tonumber(itemTbl[2])
					local num = tonumber(itemTbl[3])
					tab[id] = tab[id] or 0
					tab[id] = tab[id] + num
				end
			end
		end

		for k, v in pairs(tab) do
			local numInBag = BagManager:getItemNumById(k)
			if numInBag < v then
				bStop = true
			end
		end
		if bStop then
			break
		end
		starLevel = starLevel + 1
		times = times + 1
	end
	return times
end

--[[
	--阵法推演经验
]]
function CardStrategy:setDeduceExp( expList )
	self.deduceExp = {}
	for i,v in ipairs(self.deduceAttr) do
		v:clear()
	end
	for i,exp in ipairs(expList) do
		if (self.deduceAttr[i]) then
        	self.deduceAttr[i]:clear()
        end
		self.deduceExp[i] = exp or 0
		local info 		= StrategyCardManager:getByExpLevel(exp, self.quality)
        local currLevel = info[1] or 0
        if (currLevel > 0) then
	        local attrList 	= BattleArrayStarData:getDeduceInfo(self.id, self:getStarLevel())
	        local attr 		= attrList[i]
	        for _i,attrStr in ipairs(attr) do
	        	local attrTbl = stringToNumberTable(attrStr,"_")
	        	local attrIndex = attrTbl[1]
		        local attrValue = attrTbl[2]
		        
		        if(attrValue ~= nil and tonumber(attrValue) > 0) then
					local num = attrValue * currLevel
					self.deduceAttr[i]:addAttr(attrIndex,(num))
				end
	        end
		end
	end
	self:updatePositonAttr()
end
--[[
	获取阵法推演经验
]]
function CardStrategy:getDeduceExp(index)
	if (self.deduceExp) then
		return self.deduceExp[index]
	end
	return 0
end

--阵法信息  add是百分比 data = {level,add,nextAdd}
function CardStrategy:setShenYanInfo( researchLevel, researchRadio, nextRadio )
	local shenYanLevel = researchLevel or {}
	local add = researchRadio or {}
	local nextAdd = nextRadio or {}
	self.researchInfo = {}

	for i,v in ipairs(self.shenYanAttr) do
		v:clear()
	end

	--for i = 1, #self.strategyPos, 1 do
	for k , v in pairs(self.strategyPos) do 

		if (shenYanLevel[v] ~= nil) then
			local tmpInfo = {}
			tmpInfo.level = shenYanLevel[v]
			tmpInfo.add = add[v] * 0.01
			tmpInfo.nextAdd = nextAdd[v] * 0.01
	      	self.researchInfo[v] = tmpInfo

		    local item = self:getPositonAttributeByPos(v)
		    local attrTbl = item:getAttribute()
		    for attrIndex,value in pairs(attrTbl) do	    	
		    	local addAttr = 0
		    	if (StrategyCardManager.selectPos) then
					local oldAtt = self.baseStrategyAttr[v].attribute[attrIndex] or 0
					addAttr = math.ceil(oldAtt * tonumber(tmpInfo.add * 0.01))
		    	else
		    		self.baseStrategyAttr = clone(self.positonAttr)
		    		local oldAtt = self.baseStrategyAttr[v].attribute[attrIndex] or 0
		    		addAttr = math.ceil(oldAtt * tonumber(tmpInfo.add * 0.01))
		    	end
		    	self.shenYanAttr[v]:addAttr(attrIndex, addAttr)
			end
		end
	end

	self:updatePositonAttr()
end

function CardStrategy:getShenYanInfo(idx)

	return self.researchInfo[idx]
end

--阵法深研特殊属性
function CardStrategy:setShenYanLevelEffect( researchLevel, id ) 
	self.shenYanActivity:clear()
	self.shenYanPassive:clear()
	local shenYanLevel = researchLevel or {}
	local levelSum = 0
    for i = 1, #shenYanLevel, 1 do 
        levelSum = tonumber(shenYanLevel[i]) + levelSum
    end

    local effectActivity,effectPassive = BattleArrayResearchExtraData:getShenYanSumEffect(id, levelSum) 
    if (effectActivity ~= nil ) then
    	self.shenYanActivity:add(effectActivity)
    elseif (effectPassive ~= nil ) then
    	self.shenYanPassive:add(effectPassive)
    end
end

function CardStrategy:getShenYanEffectAttr( pos )
	for k, _ in pairs(self.strategyPos) do 
		if (pos == k and (self.shenYanActivity ~= nil or self.shenYanPassive ~= nil)) then
			return true, self.shenYanActivity.attribute, self.shenYanPassive.attribute
		end
	end
	return false
end

--获取深研战力
function CardStrategy:getShenYanPower(pos)
	for k, _ in pairs(self.strategyPos) do
		if (k == pos) then
			local levelSum = 0
			for k,v in pairs(self.researchInfo) do 
				levelSum = v.level + levelSum
			end
			local power = BattleArrayResearchExtraData:getPower( self.id, levelSum )
			return power
		end
	end
	return 0
end

--设置深研特殊属性加成
function CardStrategy:setZhenWeiSpecialAdd( cardId, star, shanYanLevel )
	local cardInfoBattle = BattleArrayStarData:getItemInfo(cardId, star)
	shanYanLevel = shanYanLevel or {}
    local levelSum = 0
    for i = 1, #shanYanLevel, 1 do 
        levelSum = tonumber(shanYanLevel[i]) + levelSum
    end
	local curEffectSum, curBeEffectSum = BattleArrayResearchExtraData:getShenYanSumEffect(cardId, levelSum)
	local effectTips = BattleArrayResearchExtraData:getShenYanEffect(cardId, levelSum).desc
	local baseAtt ,curAddAttrSum = nil, nil
	if (cardInfoBattle.effect_active ~= "") then
		baseAtt = cardInfoBattle.effect_active
		curAddAttrSum = curEffectSum or {}
	elseif (cardInfoBattle.effect_passive ~= "" ) then
		baseAtt = cardInfoBattle.effect_passive
		curAddAttrSum = curBeEffectSum or {}
	end
	
	local baseData = string.split(baseAtt, '|')
	self.zhenWeiSpeciaAttr = {} 
	for i=1,#baseData do
		local dataTbl = stringToNumberTable(baseData[i], '_')
		local idx = dataTbl[1]
		self.zhenWeiSpeciaAttr[idx] = curAddAttrSum[idx] or 0
		self.zhenWeiSpeciaAttr[idx] = dataTbl[2] + self.zhenWeiSpeciaAttr[idx]
	end
end

function CardStrategy:getZhenWeiSpecialAdd()
	return self.zhenWeiSpeciaAttr
end

return CardStrategy