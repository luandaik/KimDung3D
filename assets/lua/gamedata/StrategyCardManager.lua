-- client side StrategyCardManager.lua
--[[
 * @Description: 阵法管理器
 ]]
-- script writer Happy.All
-- creation time 2016-07-22


local StrategyCardManager = class("StrategyCardManager",TFArray)

local CardStrategy = require('lua.gamedata.base.CardStrategy')
local DeduceConsumes  		= require('lua.table.t_s_deduce_consumes')
local DeduceExp  			= require('lua.table.t_s_deduce_exp')
local DeduceCondition  		= require('lua.table.t_s_deduce_condition')
StrategyCardManager.UpdateStrategyCardMessage = "StrategyCardManager.UpdateStrategyCardMessage"
StrategyCardManager.UpdateStrategyMessage = "StrategyCardManager.UpdateStrategyMessage"
StrategyCardManager.SaleStrategyMessage = "StrategyCardManager.SaleStrategyMessage"

StrategyCardManager.BATTLE_ARRAY_EXCHANGE_REPONSE = "StrategyCardManager.BATTLE_ARRAY_EXCHANGE_REPONSE"

StrategyCardManager.handleIntensify = 1 --阵法强化
StrategyCardManager.handleStarUp = 2 --升星
StrategyCardManager.handleChangePos = 3 --易位
StrategyCardManager.handleAdd = 4 --新增
StrategyCardManager.handDeduce = 5 --推演
StrategyCardManager.handleExchange = 6 --置换
StrategyCardManager.handleShenyan = 7 --深研

StrategyCardManager.handleDress = 1
StrategyCardManager.handleUnDress = 2
StrategyCardManager.handleDressChange = 3

StrategyCardManager.sortByIntensify = 1
StrategyCardManager.sortByStarLevel = 2

StrategyCardManager.extAttributeMax = 3 --突破激活最大属性位

local QQQQQ = true

StrategyCardManager.kMaxStarLevel = 5
StrategyCardManager.kMaxIntensifyLevel = 150

local function sortByIntensify( a,b )
	if a.level == b.level then
		if a.starLevel == b.starLevel then
			if a.quality == b.quality then
				return a.id < b.id
			else
				return a.quality > b.quality
			end
		else
			return a.starLevel > b.starLevel
		end
	else
		return a.level > b.level
	end
end

local function sortByStarLevel( a,b )
	if a.starLevel == b.starLevel then
		if a.level == b.level then
			if a.quality == b.quality then
				return a.id < b.id
			else
				return a.quality > b.quality
			end
		else
			return a.level > b.level
		end
	else
		return a.starLevel > b.starLevel
	end
end

function StrategyCardManager:ctor()
	self.super.ctor(self)
	self.map = {}
	self.strategyInfo = {}
	self.selectPos = nil


	--服务器登录时推送所有阵法信息
	TFDirector:addProto(s2c.BATTLE_ARRAY_REPONSE, self, self.onReceiveStrategyCardInfo)
	--单个阵法信息更新
	TFDirector:addProto(s2c.SINGLE_BATTLE_ARRAY_REPONSE, self, self.onUpdateStrategyCardInfo)
	--服务器登录时推送所有阵容装备阵法的信息
	TFDirector:addProto(s2c.BATTLE_ARRAY_DATA_REPONSE, self, self.onReceiveStrategyInfo)
	--单个阵容信息更新
	TFDirector:addProto(s2c.SINGLE_BATTLE_ARRAY_DATA_REPONSE, self, self.onUpdateStrategyInfo)	
	--出售阵法
	TFDirector:addProto(s2c.SALE_BATTLE_ARRAY_REPONSE, self, self.onSaleBattleArrayReponse)	
	--阵法置换
	TFDirector:addProto(s2c.BATTLE_ARRAY_EXCHANGE_REPONSE, self, self.onZhihuanResponse)	

	--c2s.SALE_BATTLE_ARRAY_REQUEST
end

function StrategyCardManager:restart()
	self.map = {}
	self.selectPos = nil

	for v in self:iterator() do
		v:dispose()
	end
	self:clear()
end

function StrategyCardManager:onReceiveStrategyCardInfo( event )
	hideLoading()

	local data = event.data.info or {}

	for _,equip in pairs(data) do
		self:strategyCardAdd(equip)
	end
end

function StrategyCardManager:strategyCardAdd( equip )
	local cardEquip = CardStrategy:new(equip.itemId)
	cardEquip:setLevel(equip.level,equip.exp)
	cardEquip:setStarLevel(equip.star)
	cardEquip:setFreeNum(equip.freeNum)
	cardEquip:setGmId(equip.instanceId)
	cardEquip:setSrategyPos(equip.position)
	cardEquip:setDeduceExp(equip.deduceExp)
	cardEquip:setShenYanInfo(equip.researchLevel,equip.researchRadio,equip.nextRadio)
	--print("阵法信息 = ",equip)
	cardEquip:setShenYanLevelEffect(equip.researchLevel,equip.itemId)
	cardEquip:setZhenWeiSpecialAdd(equip.itemId,equip.star,equip.researchLevel)
	self.super.push(self, cardEquip)
end

--[[
	阵法强化
]]
function StrategyCardManager:sendIntensifyMsg(gmId, tab)
	showLoading();
	local Msg = {
		gmId,
		tab	
	}
	TFDirector:send(c2s.BATTLE_ARRAY_INTENSIFY_REQUEST,Msg)
end

--[[
	阵法升星
]]
function StrategyCardManager:sendStarUpMsg(gmId)
	showLoading();
	local Msg = {		
		gmId,
	}
	TFDirector:send(c2s.BATTLE_ARRAY_STAR_UP_REQUEST,Msg)
end

--[[
	阵法易位
]]
function StrategyCardManager:sendChangePositionMsg(gmId, lockList)
	showLoading();
	lockList = lockList or {}
	local Msg = {		
		gmId,
		lockList
	}
	TFDirector:send(c2s.CHANGE_POSITION_REQUEST,Msg)
end

--[[
	阵法合成
]]
function StrategyCardManager:sendRemixingMsg(pieceId)
	showLoading();
	local Msg = {		
		pieceId,
	}
	TFDirector:send(c2s.COMPOSE_REQUEST,Msg)
end

--[[
	阵法推演
]]
function StrategyCardManager:sendDeduceMsg(instanceId, goodsIds, nums, pos)
--c2s.BATTLE_ARRAY_DEDUCE = 0x6a08
	showLoading();
	local Msg = {		
		instanceId,
		goodsIds,
		nums,
		pos
	}

	TFDirector:send(c2s.BATTLE_ARRAY_DEDUCE,Msg)
end

function StrategyCardManager:onUpdateStrategyCardInfo( event )
	hideLoading()
	local equipData = event.data.info
	local handleType = tonumber(event.data.type) --1 强化 2 升星 3 易位 4 新增 5推演
	--print("单个阵法信息 = ",equipData)
	if handleType == StrategyCardManager.handleAdd then
		self:strategyCardAdd(equipData)
	    local layer = require("lua.logic.bag.BagPieceMergeResult"):new(equipData.itemId)
		AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY)
		AlertManager:show()
	else
		local strategyCard = self:getStrategyCardByGmid(equipData.instanceId)
		if strategyCard == nil then
			print('cannot find the strategyCard = ',equipData)
			return
		end
		if handleType == StrategyCardManager.handleIntensify then
			strategyCard:setLevel(equipData.level,equipData.exp)
		elseif handleType == StrategyCardManager.handleStarUp then
			strategyCard:setStarLevel(equipData.star)
			strategyCard:setSrategyPos(equipData.position)
			strategyCard:setZhenWeiSpecialAdd(equipData.itemId,equipData.star,equipData.researchLevel)
			strategyCard:setShenYanInfo(equipData.researchLevel,equipData.researchRadio,equipData.nextRadio)
		elseif handleType == StrategyCardManager.handleChangePos then
			strategyCard:setSrategyPos(equipData.position)
			strategyCard:setFreeNum(equipData.freeNum)
		elseif handleType == StrategyCardManager.handleExchange then
			strategyCard:setLevel(equipData.level,equipData.exp)
			strategyCard:setStarLevel(equipData.star)
			strategyCard:setSrategyPos(equipData.position)
			strategyCard:setDeduceExp(equipData.deduceExp)
			strategyCard:setShenYanInfo(equipData.researchLevel,equipData.researchRadio,equipData.nextRadio)
			strategyCard:setShenYanLevelEffect(equipData.researchLevel,equipData.itemId)
			strategyCard:setZhenWeiSpecialAdd(equipData.itemId,equipData.star,equipData.researchLevel)
		elseif handleType == StrategyCardManager.handDeduce then
			strategyCard:setDeduceExp(equipData.deduceExp)
		elseif handleType == StrategyCardManager.handleShenyan then
			strategyCard:setStarLevel(equipData.star)
			strategyCard:setShenYanInfo(equipData.researchLevel,equipData.researchRadio,equipData.nextRadio)
			strategyCard:setShenYanLevelEffect(equipData.researchLevel,equipData.itemId)
			strategyCard:setZhenWeiSpecialAdd(equipData.itemId,equipData.star,equipData.researchLevel)
		end
	end	
	
	TFDirector:dispatchGlobalEventWith(StrategyCardManager.UpdateStrategyCardMessage,{handleType, equipData.itemId})
end

function StrategyCardManager:getStrategyCardByGmid(gmId)
	for v in self:iterator() do
		if v.gmId == gmId then
			return v
		end
	end
	return nil
end

function StrategyCardManager:onReceiveStrategyInfo(event)
	hideLoading()
	local dataList = event.data.data or {}

	for k,v in pairs(dataList) do
		local strategyType = tonumber(v.type)
		local gmId = tonumber(v.instanceId)
		local strategyCard = self:getStrategyCardByGmid(gmId)
		if strategyCard then
			self.strategyInfo[strategyType] = gmId
			strategyCard:dressCard(strategyType)
		end
	end
end

function StrategyCardManager:getStrategyCardByStrategyType(strategyType)
	if strategyType == nil then
		return nil
	end
	local gmId = self.strategyInfo[strategyType]
	--print("strategyInfo = ",self.strategyInfo)
	if gmId and gmId ~= 0 then
		local equip = self:getStrategyCardByGmid(gmId)
		return equip
	end
	return nil
end

function StrategyCardManager:sendDressHandleMsg( gmId, type )
	showLoading();
	local Msg = {		
		gmId,
		type
	}
	TFDirector:send(c2s.EQUIP_BATTLE_ARRAY_REQUEST,Msg)
end

function StrategyCardManager:sendUnDressHandleMsg( type )
	showLoading();
	local Msg = {		
		type
	}
	TFDirector:send(c2s.UN_EQUIP_BATTLE_ARRAY_REQUEST,Msg)
end

function StrategyCardManager:sendShenYanMsg( msg )
	showLoading()
	TFDirector:send(c2s.BATTLE_ARRAY_RESEARCH,msg)
end

function StrategyCardManager:onUpdateStrategyInfo( event )
	hideLoading()

	local strategyType = tonumber(event.data.data.type)
	local gmId = tonumber(event.data.data.instanceId)
	local handleType = tonumber(event.data.type) --1 装备 2 卸下 3 交换

	print("event.data = ",event.data)
	-- p.p = 1
	if handleType == StrategyCardManager.handleDress then
		local strategyCard = self:getStrategyCardByGmid(gmId)
		strategyCard:dressCard(strategyType)

		local checkType = nil
		if strategyType == EnumFightStrategyType.StrategyType_DOUBLE_1 then
			checkType = EnumFightStrategyType.StrategyType_DOUBLE_2
		elseif strategyType == EnumFightStrategyType.StrategyType_DOUBLE_2 then
			checkType = EnumFightStrategyType.StrategyType_DOUBLE_1
		end
		if checkType then
			if strategyCard:checkInStrategyByType(checkType) then
				strategyCard:unDressCard(checkType)
				self.strategyInfo[checkType] = 0
			end
		end
	elseif handleType == StrategyCardManager.handleUnDress then
		local strategyCard = self:getStrategyCardByStrategyType(strategyType)
		strategyCard:unDressCard(strategyType)
	elseif handleType == StrategyCardManager.handleDressChange then

		local strategyCardOld = self:getStrategyCardByStrategyType(strategyType)
		if strategyCardOld then
			strategyCardOld:unDressCard(strategyType)
		end
		self.strategyInfo[strategyType] = 0
		local strategyCardNew = self:getStrategyCardByGmid(gmId)
		if strategyCardNew then
			strategyCardNew:dressCard(strategyType)
		end

		local checkType = nil
		if strategyType == EnumFightStrategyType.StrategyType_DOUBLE_1 then
			checkType = EnumFightStrategyType.StrategyType_DOUBLE_2
		elseif strategyType == EnumFightStrategyType.StrategyType_DOUBLE_2 then
			checkType = EnumFightStrategyType.StrategyType_DOUBLE_1
		end
		if checkType then
			if strategyCardNew:checkInStrategyByType(checkType) then
				strategyCardNew:unDressCard(checkType)
				self.strategyInfo[checkType] = 0
			end
		end
	end
	self.strategyInfo[strategyType] = gmId

	TFDirector:dispatchGlobalEventWith(StrategyCardManager.UpdateStrategyMessage,{handleType})
end

function StrategyCardManager:getCardIndexByGmid(gmId)
	local index = 0
	for v in self:iterator() do
		index = index + 1
		if v.gmId == gmId then
			return index
		end
	end
	return 0
end

function StrategyCardManager:getCardByIndex(index)
	local info = self:objectAt(index)
	return info
end

function StrategyCardManager:getCardMaxNumber()
	return self:length()
end

function StrategyCardManager:TestTest()

	for i=1,3 do
		local event = {}
		event.data = {}
		event.data.type = 4
		event.data.info = {}
		event.data.info.instanceId = i
		event.data.info.itemId = 50026+i
		event.data.info.level = i
		event.data.info.exp = i
		event.data.info.start = i
		event.data.info.freeNum = i
		event.data.info.position = {1,2,3}
		self:onUpdateStrategyCardInfo(event)
	end
	 self:openZhenFaMainLayer(1)
	
end

function StrategyCardManager:openZhenFaMainLayer(gmId)
	local layer = require("lua.logic.strategyCard.ZhenFaMainLayer"):new(gmId)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_NONE)
    AlertManager:show()
end

function StrategyCardManager:openEquipOperationLayer(gmId, index)
	local list = self:getAllStrategyCard()
	local layer = require("lua.logic.strategyCard.ZhenFaPanelLayer"):new()
	layer:loadData(gmId, list, index)
    AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_NONE)
    AlertManager:show()
end

function StrategyCardManager:getAllStrategyCard()
	local arr = TFArray:new()
	for v in self:iterator() do
		arr:push(v)
	end
	return arr
end

function StrategyCardManager:checkIsOpen()
	local level = FunctionOpenConfigure:getOpenLevel(2213) or 57
	local currLevel = MainPlayer:getLevel()

	if currLevel >= level then
		return true
	end
	return false
end

function StrategyCardManager:openCardDressLayerByType(type)

	if self:checkIsOpen() then
		local layer = require("lua.logic.strategyCard.EquipZhenFaLayer"):new(type)
	    --sortType 1.强化等级 2.升星等级
		sortType = sortType or 1
		local currCard = self:getStrategyCardByStrategyType(strategyType)
	    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
	    AlertManager:show()
	else
		local openLevel = FunctionOpenConfigure:getOpenLevel(2213) or 57
		toastMessage(stringUtils.format(localizable.common_function_openlevel, openLevel))
	end
end

function StrategyCardManager:getCardList(sortType,strategyType)
	local currGmId = 0
	local currCard = self:getStrategyCardByStrategyType(strategyType)
	if currCard then
		currGmId = currCard.gmId
	end
	
	local cardList = TFArray:new()
	for v in self:iterator() do
		if v.gmId ~= currGmId then
			cardList:push(v)
		end
	end

	--print("sortType = ",sortType)
	if sortType == 1 then
		cardList:sort(sortByIntensify)
	else
		cardList:sort(sortByStarLevel)
	end

	if currCard then
		cardList:pushFront(currCard)
	end
	return cardList;
end


function StrategyCardManager:getListForBag()
	--sortType 1.强化等级 2.升星等级
	
	local pieceList = BagManager:getItemByType(EnumGameItemType.StrategyPiece)

	local cardList = TFArray:new()

	for v in self:iterator() do
		if v:checkInStrategy() == false then
			cardList:push(v)
		end
	end

	local function sortFunc( a,b )
		local qualityA = a:getQuality()
		local qualityB = b:getQuality()
		if qualityA == qualityB then
			if a.starLevel == b.starLevel then
				return a.id < b.id
			else
				return a.starLevel > b.starLevel
			end
		else
			return qualityA > qualityB
		end
	end
	local function sortPieceFunc( a,b )
		local qualityA = a.quality
		local qualityB = b.quality
		if qualityA == qualityB then
			if a.starLevel == b.starLevel then
				return a.id < b.id
			else
				return a.starLevel > b.starLevel
			end
		else
			return qualityA > qualityB
		end
	end
	cardList:sort(sortFunc)
	pieceList:sort(sortFunc)

	for v in pieceList:iterator() do
		v.isStrategyPiece = true
		cardList:push(v)
	end
	return cardList;
end

--[[
	阵法出售
]]
function StrategyCardManager:sendSaleBattleArrayMsg(gmId)
	showLoading();
	local Msg = {
		gmId,
	}
	TFDirector:send(c2s.SALE_BATTLE_ARRAY_REQUEST,Msg)
end

function StrategyCardManager:onSaleBattleArrayReponse( event )
	hideLoading()

	local data = event.data.instanceId

	if data == nil then
		return
	end

	local card = self:getStrategyCardByGmid(data)
	if card == nil then
		return
	end

	self:removeObject(card)

	print("self.length = ",self:length())
	TFDirector:dispatchGlobalEventWith(StrategyCardManager.SaleStrategyMessage,{})
end

--已装备的阵法优先
function StrategyCardManager:getAllCardEquippedFirst(sortType)
	local arr1 = TFArray:new()
	local arr2 = TFArray:new()
	for v in self:iterator() do
		if v.equip and #v.equip > 0 then
			arr1:push(v)
		else
			arr2:push(v)
		end
	end
	local func = sortByIntensify
	if sortType and sortType == 2 then
		func = sortByStarLevel
	end
	arr1:sort(func)
	arr2:sort(func)

	local arr = TFArray:new()
	local arrList = {arr1, arr2}
	for i = 1, #arrList do
		for v in arrList[i]:iterator() do
			arr:push(v)
		end
	end
	return arr
end

--阵法置换
function StrategyCardManager:requestZhihuan(srcId, targetId, needStar)
	showLoading()
	local Msg = 
	{
		srcId,
		targetId,
		needStar
	}
	TFDirector:send(c2s.BATTLE_ARRAY_EXCHANGE_REQUEST, Msg)
end

function StrategyCardManager:onZhihuanResponse( event )
	hideLoading()
	local data = event.data or {}
	local result = data.result or 0
	local info = data.info or {}

	local itemList = {}
	for i, v in ipairs(info) do
		local tblItem = {type = v.type,number = v.number,itemId = v.id}
		table.insert(itemList,tblItem)
	end

	TFDirector:dispatchGlobalEventWith( StrategyCardManager.BATTLE_ARRAY_EXCHANGE_REPONSE, {result, itemList} )
end

function StrategyCardManager:openZhihuanLayer(gmId)
	local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.strategyCard.ZhenfaZhihuanLayer")
	AlertManager:show();
	if gmId then
		layer:setSelectId(gmId)
	end
end

function StrategyCardManager:getDeduceConsumesData()
	local list = {}
	local index = 0
	for info in DeduceConsumes:iterator() do
		index = index + 1
		list[index] = info
	end
	return list
end
--
function StrategyCardManager:getDeduceExp(level, quality)
	local list = {}
	for info in DeduceExp:iterator() do
		if (info.level == level and info.quality == quality) then
			return  info.exp
		end
	end
	return 0
end

function StrategyCardManager:getByQualityDeduceList(quality)
	local list = {}
	for info in DeduceExp:iterator() do
		if (info.quality == quality) then
			list[info.level] = info
		end
	end

	return list
end

function StrategyCardManager:getByExpLevel(exp, quality)
	local maxLevel = 0
	local myLevel = 0
	exp = exp or 0
	for info in DeduceExp:iterator() do
		if (exp >= info.exp and (quality == info.quality) and myLevel < info.level) then
			myLevel = info.level
		end
		if (maxLevel < info.level) then
			maxLevel = info.level
		end
	end
	return {myLevel,maxLevel}
end

function StrategyCardManager:getByPosAddIntensifyLevel(gmId, quality)
	local item = self:getStrategyCardByGmid(gmId)
	local levelList = {}
	if (item) then
		for i=1,StrategyCardManager.extAttributeMax do
			local info 		= self:getByExpLevel(item:getDeduceExp(i), quality)
			levelList[i] 	= tonumber(info[1]) or 0
		end
	end
	local info 		= self:getAddDeduceConditionValue(quality, levelList)
	local addValue 	= tonumber(info[1]) or 0
	return addValue
end
function StrategyCardManager:getAddDeduceConditionValue(quality, levelList)
	--DeduceCondition
	
	local tempInfo = {}
	local deduceInfo = nil
	for info in DeduceCondition:iterator() do
		if (quality == info.quality) then
			local count = 0
			for i,level in ipairs(levelList) do
				if (level >= info.level) then
					count = count + 1
				end
			end

			if (count >= info.count) then
				if (deduceInfo) then
					if (info.value > deduceInfo.value) then
						deduceInfo 	= info
					end
				else
					deduceInfo 	= info
				end
			end
			table.insert(tempInfo, info)
		end
	end
	table.sort(tempInfo, function(a, b)
		return a.level < b.level
	end)
	local index = 1
	for i,v in ipairs(tempInfo) do
		if (deduceInfo and deduceInfo.level == v.level) then
			index = i + 1
			break
		end
	end

	local addValue = 0
	if (deduceInfo) then
		addValue = deduceInfo.value
	end
	local nextInfo = tempInfo[index]
	return {addValue, nextInfo}
end

function StrategyCardManager:zhenWeiSpecialAddStr( effectTips, effectInfo )
	local effectAttrStr = ""
    for k,v in pairs(effectInfo) do
        local addNum = covertToDisplayValue(k,tonumber(v),true)
        if (tonumber(addNum) and addNum > 0) then
            effectAttrStr = effectAttrStr.."+"..addNum
        else 
            effectAttrStr = addNum..effectAttrStr
        end
    end
    effectAttrStr = effectTips..effectAttrStr
    return effectAttrStr
end



return StrategyCardManager:new()