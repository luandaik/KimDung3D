--[[
******游戏数据装备牌类*******

	-- by Stephen.tao
	-- 2013/11/25
]]

local GameObject = require('lua.gamedata.base.GameObject')
local CardSkyBook = class("CardSkyBook",GameObject)

local EffectExtraData = clone(EffectExtraDataModel)
--local ItemData = require('lua.table.ItemData')
local GameAttributeData = require('lua.gamedata.base.GameAttributeData')

function CardSkyBook:ctor( Data )
	self.super.ctor(self)
	self:init(Data)
end

function CardSkyBook:init( Data )
	self.baseAttribute				= GameAttributeData:new()	--最终基本属性
	self.stoneAttribute				= GameAttributeData:new()	--镶嵌的精要属性
	self.totalAttribute				= GameAttributeData:new()	--总属性
	self.canWuAttribute				= GameAttributeData:new()	--参悟属性
	self.canWuExtraAttribute		= EffectExtraData:new()	    --参悟减伤属性
	self.zhuJieExtraAttribute		= GameAttributeData:new()	--天书注解属性
	self.gemPower = 0
	self.immuneGemAttribute 		= EffectExtraData:new()
	self.immuneGemAttribute:clear()
	self.effectExtraGemAttribute 	= EffectExtraData:new()
	self.effectExtraGemAttribute:clear()
	self.beEffectExtraGemAttribute 	= EffectExtraData:new()
	self.beEffectExtraGemAttribute:clear()

	self.chongzhuExtraAttribute = GameAttributeData:new()	--重铸孔达到条件时附加属性
	self.chongzhuPercent = 0	--重铸孔达到5个紫色之后每升一级所加全属性百分比
	self.chongzhuBaseAttribute 	= GameAttributeData:new()	--重铸所加基本属性


	self.totalAttrWithOutGem 	= GameAttributeData:new()	--除开宝石的总属性
	self.gemAttribute = GameAttributeData:new()		--宝石的总属性
	self.maxGem = 0
	self.gemId = {}

	self.id 				= Data
	self.level				= 0							--重数
	self.tupoLevel			= 0							--突破重数
	self.sbStoneId			= {}						--精要的id


	self.equip 				= 0									--装备于某人
	self.equipType			= 0									--装备类型

	self.instanceId 		= 0


	self.config 			= ItemData:objectByID(self.id)
	self.quality			= self.config.quality
	self.canWuMaxLevel		= 1									    --参悟最高等级
	self.reachId			= 0									    --参悟减伤ID  查看玩家信息时必须初始化
	self.useCountReachIds	= {0}									--消耗参悟丹ID  查看玩家信息时必须初始化
	self.power				= 0										--战力
	self.maxStoneNum		= 0										--最多可镶嵌精要数
	self.chapterId			= 1										--注解章节
	self.entryId			= 0												--章节进度
	self.bibleKeyId			= 0												--纹章

	--重铸孔
	self.chongzhuData = {
		{pos = 1,level = 0,quality = 0},
		{pos = 2,level = 0,quality = 0},
		{pos = 3,level = 0,quality = 0},
		{pos = 4,level = 0,quality = 0},
		{pos = 5,level = 0,quality = 0}
	}

	self:setTupoLevel(0)
	self:setLevel(1)
	self:setMaxGem(2)
	self:setReachId(0)
	self:setUseCountReachIdList({})
end

--获得总属性table表
function CardSkyBook:getTotalAttr()
	return self.totalAttribute:getAttribute()
end

function CardSkyBook:getImmuneAttr()
	return self.immuneGemAttribute:getAttribute()
end

function CardSkyBook:getEffectExtraAttr()
	return self.effectExtraGemAttribute:getAttribute()
end

function CardSkyBook:getBeEffectExtraAttr()
	local info = {}
	for i,v in pairs(self.beEffectExtraGemAttribute:getAttribute()) do
		info[i] = v
	end
	for k,v in pairs(self.canWuExtraAttribute:getAttribute()) do
		local sum = (info[k] or 0) + v
		info[k] = sum
	end

	return info
	--return self.beEffectExtraGemAttribute:getAttribute()
end

--参悟属性
function CardSkyBook:getCanWuAttr()
	return self.canWuAttribute:getAttribute()
end

function CardSkyBook:getCanWuBeEffectExtraAttr()
	return self.canWuExtraAttribute:getAttribute()
end

--获得总属性
function CardSkyBook:getTotalAttrArray()
	return self.totalAttribute
end

--获得天书类型
function CardSkyBook:getConfigType()
	if self.config then
		return self.config.type
	end
	return nil
end

function CardSkyBook:getConfigKind()
	if self.config then
		return self.config.kind or 1
	end
	return 1
end

function CardSkyBook:getConfigName()
	if self.config then
		return self.config.name
	end
	return ""
end

function CardSkyBook:getConfigOutline()
	if self.config then
		return self.config.outline
	end
	return ""
end

function CardSkyBook:getConfigDetails()
	if self.config then
		return self.config.details
	end
	return ""
end

--设置等级，改变总属性
function CardSkyBook:setLevel( level )
	self.level = level
	self.bibleConfig = BibleData:getBibleInfoByIdAndLevel( self.id ,level )

	--天书可镶嵌精要数
	self.maxStoneNum = self.bibleConfig.essential_num
	self.baseAttribute:clear()
	self.baseAttribute:init(self.bibleConfig.bible_att)
	self:updatePower()
end

function CardSkyBook:dispose()
	self.super.dispose(self)
	-- self.attribute			= nil
	self.id					= nil
	self.level				= nil
	self.sbStoneId			= nil
	self.equip				= nil
	self.equipType			= nil
	self.instanceId			= nil
	self.config				= nil
	self.name				= nil
	self.power				= nil
	self.maxStoneNum		= nil
	-- self.bibleConfig				= nil
	-- self.breachConfig				= nil
	self.gemPower 			= nil
	self.immuneGemAttribute:clear()
	self.effectExtraGemAttribute:clear()
	self.beEffectExtraGemAttribute:clear()
	self.immuneGemAttribute = nil 
	self.effectExtraGemAttribute = nil 
	self.beEffectExtraGemAttribute = nil 


	self.maxGem = nil
	self.totalAttrWithOutGem = nil
	self.gemAttribute = nil

	self.chongzhuExtraAttribute = nil
	self.chongzhuPercent 		= nil
	self.chongzhuBaseAttribute 	= nil
	self.canWuAttribute 		= nil
	self.canWuExtraAttribute	= nil
	self.zhuJieExtraAttribute 	= nil

	TFDirector:unRequire('lua.gamedata.base.GameObject')
	TFDirector:unRequire('lua.gamedata.base.GameAttributeData')
end

--[[
	--获取图片路径
]]
function CardSkyBook:GetTextrue()
	return self.config:GetPath()
end

--更新战斗力
function CardSkyBook:updatePower()
	self:updateAttr()
end

--更新所有属性总和
function CardSkyBook:updateAttr()
	self.totalAttribute:clear()
	self.zhuJieExtraAttribute:clear()
	self.totalAttrWithOutGem:clear()
	self.gemAttribute:clear()

	self.chongzhuExtraAttribute:clear()
	self.chongzhuBaseAttribute:clear()

	self.totalAttribute:clone(self.baseAttribute)
	self.totalAttrWithOutGem:clone(self.baseAttribute)
	for i=1,self.maxStoneNum do
		if self.sbStoneId[i] and self.sbStoneId[i] > 0 then
			local attr = self.bibleConfig:getHoleAttr(i)
			self.totalAttribute:addAttr(attr.key, attr.value)
			self.totalAttrWithOutGem:addAttr(attr.key, attr.value)
		end
	end


	self.totalAttribute:setFactor(self.breachConfig.factor)
	self.totalAttrWithOutGem:setFactor(self.breachConfig.factor)

	--参悟属性加成
	for attrId,value in pairs(self.canWuAttribute.attribute) do
		self.totalAttribute:addAttr(attrId, value)
		self.totalAttrWithOutGem:addAttr(attrId, value)
	end

	--注释属性加成
	local currAtrr = BibleNoteData:GetSkyBookZhuJieAllAttr( self.chapterId, self.entryId, self.quality )
	self.zhuJieExtraAttribute:add(currAtrr)
	for attrId,value in pairs(self.zhuJieExtraAttribute.attribute) do
		self.totalAttribute:addAttr(attrId, value)
		self.totalAttrWithOutGem:addAttr(attrId, value)
	end
	--重铸基本属性加成
	for k, v in pairs(self.chongzhuData) do
		local attrTab = BiblePracticeData:getTotalBaseAttribute(self.quality, v.pos, v.level) or {}
		for i, j in pairs(attrTab) do
			self.totalAttribute:addAttr(i, j)
			self.totalAttrWithOutGem:addAttr(i, j)
			self.chongzhuBaseAttribute:addAttr(i, j)
		end
	end

	--重铸总属性百分比:chongzhuPercent
	for k, v in pairs(self.totalAttribute.attribute) do
		self.totalAttribute:addAttr(k, math.floor(v * self.chongzhuPercent / 10000))
		self.totalAttrWithOutGem:addAttr(k, math.floor(v * self.chongzhuPercent / 10000))
	end

	--重铸额外属性
	local extraTab = self:getChongzhuExtraAttr() or {}
	local extraList = clone( extraTab.attr2 )
	if extraList then
		for k, v in pairs(extraTab.attr1) do
			extraList[k] = extraList[k] or 0
			extraList[k] = extraList[k] + v
		end
	end
	for k, v in pairs(extraList) do
		self.chongzhuExtraAttribute:addAttr(k, v)
		self.totalAttribute:addAttr(k, v)
		self.totalAttrWithOutGem:addAttr(k, v)
	end


	self.totalAttribute:refreshBypercent()
	self.totalAttrWithOutGem:refreshBypercent()

	self.immuneGemAttribute:clear()
	self.effectExtraGemAttribute:clear()
	self.beEffectExtraGemAttribute:clear()

	self.gemPower = 0
	for i = 1, self.maxGem do
		if self:getGemPos(i) then
			local gem = GemData:objectByID(self:getGemPos(i))
			if gem then
				if gem.attribute and gem.attribute ~= "" then 
			        local attr_index,attr_num = gem:getAttribute()
			        self.totalAttribute:addAttr(attr_index, attr_num)
					self.gemAttribute:addAttr(attr_index, attr_num)
			    elseif gem.immune and gem.immune ~= "" then
			        self.immuneGemAttribute:add(GetAttrByString(gem.immune))
			    elseif gem.effect_extra and gem.effect_extra ~= "" then
			        self.effectExtraGemAttribute:add(GetAttrByString(gem.effect_extra))
			    elseif gem.be_effect_extra and gem.be_effect_extra ~= "" then     
			        self.beEffectExtraGemAttribute:add(GetAttrByString(gem.be_effect_extra))
			    end
			    local _gemPower = gem.power or 0
			    self.gemPower = self.gemPower + _gemPower
			end
		end
	end
	-- --参悟额外属性加成
	self.canWuBeExtraPower = 0
	local reachId = self.reachId
	if (reachId <= 0) then
		--防止有人初始化天书没有初始化reachId值
		local canWuInfo 	= SkyBookManager:getByIdCanWuInfo(self.instanceId)
		if (canWuInfo and canWuInfo.reachId > 0) then
			reachId = canWuInfo.reachId or 0
		end
	end
	--
	local subHurtInfo 	= SkyBookManager:getByIdSpecialAddition(reachId)
	if (subHurtInfo) then
		self.canWuBeExtraPower = subHurtInfo.power or 0
	end
	--
	local useCountReachIds = self.useCountReachIds or {0}
	if next(useCountReachIds) == nil then
		--防止有人初始化天书没有初始化useCountReachIds值
		local canWuInfo 	= SkyBookManager:getByIdCanWuInfo(self.instanceId)
		if (canWuInfo) then
			useCountReachIds = canWuInfo.useCountReachId
		end
	end

	
	for i,id in pairs(useCountReachIds) do
		local info = SkyBookManager:getByIdUsecount(id)
		if (info) then
	        self.canWuBeExtraPower = self.canWuBeExtraPower + info.power 
	    end
	end

	self.totalAttribute:updatePower()
	self.power = self.totalAttribute:getPower() + self.gemPower + self.canWuBeExtraPower

	if self.equip and self.equip ~= 0 then
		local role = CardRoleManager:getRoleById(self.equip)
		if role then
			role:updateSkyBookAttr()
		end
	end
end

function CardSkyBook:setMaxGem(num)
	self.maxGem = num
end
function CardSkyBook:setUseCountReachIdList(useCountReachIds)
	self.useCountReachIds = useCountReachIds
end
function CardSkyBook:setReachId(reachId)
	self.reachId = reachId
end
function CardSkyBook:getMaxGem()
	return self.maxGem
end

--设置宝石
function CardSkyBook:setGemPos( pos , id )
	if pos > self.maxGem then
		return
	end

	self.gemId[pos] = id
end

--查找宝石
function CardSkyBook:getGemPos( pos )
	if pos > self.maxGem then
		return nil
	end
	return self.gemId[pos]
end

function CardSkyBook:getAttrWithOutGem()
	return self.totalAttrWithOutGem
end

function CardSkyBook:getGemAttr()
	return self.gemAttribute
end

function CardSkyBook:isGemOpen(idx)
	idx = idx or 1
	if idx > self.maxGem then
		return false
	end
	local bOpen = false
	local item = BibleGemData:getItemByStarAndQuality(self.tupoLevel, self.quality)
	if item and item:getGemMaxLevel() > 0 then
		if idx == 2 then
			if self:getSecondGemOpen() then
				bOpen = true
			end
		else
			bOpen = true
		end
	end
	return bOpen
end

function CardSkyBook:isGemEquipped(pos)
	if self:getGemPos(pos) and self:getGemPos(pos) ~= 0 then
		return true
	end
	return false
end

--[[
	--获取物品战力
]]
function CardSkyBook:getpower()
	return self.power
end

--获得当前基本属性
function CardSkyBook:getBaseAttribute()	
	--参悟属性加成
	local info = {}
	for i,v in pairs(self.baseAttribute:getAttribute()) do
		info[i] = v
	end
	for k,v in pairs(self.canWuAttribute.getAttribute()) do
		local sum = (info[k] or 0) + v
		info[k] = sum
	end
	return info
	--return self.baseAttribute
end

--设置精要
function CardSkyBook:setStonePos( pos , id )
	if pos > self.maxStoneNum then
		return
	end
	self.sbStoneId[pos] = id
end

--查找宝石
function CardSkyBook:getStonePos(pos)
	if pos > self.maxStoneNum then
		return nil
	end
	return self.sbStoneId[pos]
end

function CardSkyBook:resetStone()
	self.sbStoneId = {}
end

--设置星级值
function CardSkyBook:setTupoLevel( tupoLevel )
	local maxLevel = BibleBreachData:getMaxTupoLevel(self.quality)
	if tupoLevel > maxLevel then
		print("skybook tupolevel error")
		tupoLevel = maxLevel
	end
	self.tupoLevel = tupoLevel
	self.breachConfig = BibleBreachData:getBreachInfo(self.quality, tupoLevel)
end

--获取星级
function CardSkyBook:getTupoLevel()
	return self.tupoLevel
end

--设置品质
function CardSkyBook:setQuality( quality )
	self.quality = quality
	self.breachConfig = BibleBreachData:getBreachInfo( self.quality ,self.tupoLevel)
end

function CardSkyBook:getTotalGemNum()
	return self.maxStoneNum or 0
end

--获得精要id表
function CardSkyBook:getJingyaoIdTable()
	local ids = self.bibleConfig.essential_id
	local tab = string.split(ids, ",")
	return tab
end

function CardSkyBook:setChongzhuInfo(pos, level)
	if (not pos) or (not level) or pos > 5 then
		return
	end
	self.chongzhuData[pos] = self.chongzhuData[pos] or {}
	self.chongzhuData[pos].level = level
	local item = BiblePracticeData:getItem(self.quality, pos, level)
	local holeQuality = 0
	if item then
		holeQuality = item:getQuality()
	end
	self.chongzhuData[pos].quality = holeQuality

	self:updatePower()
end

function CardSkyBook:getHoleNumByQuality(quality)
	local count = 0
	for k, v in pairs(self.chongzhuData) do
		if v.quality >= quality then
			count = count + 1
		end
	end
	return count
end

function CardSkyBook:getChongzhuExtraAttr()
	if self.quality < 4 then
		return { attr1 = {}, attr2 = {} }
	end
	local itemList = BiblePracticeExtraData:getExtraItems(self.id) or {}

	self.isDouble = false
	if string.find( itemList[1].attribute, '|' ) then
		self.isDouble = true
	end

	table.sort(itemList, function (item1, item2)
		return item1.id > item2.id
	end)
	local attrTab = {}
	local attrList1 = {}
	local attrList2 = {}
	for i = 1, #itemList do
		local item = itemList[i] or {}
		local quality = item.quality or 10
		local count = self:getHoleNumByQuality(quality)
		if count >= item.number then
			local str1 = item.attribute or ""
			local str2 = item.base_attribute or ""
			table.insert(attrList1, str1)
			table.insert(attrList2, str2)
		end
	end

	local tab = { attr1 = {}, attr2 = {} }

	local tt = {}
	local maxIndex = 1
	local tempValue = 0
	for i = 1, #attrList1 do
		local tab1 = string.split( attrList1[i], '|' )
		local tab2 = stringToNumberTable( tab1[1], '_' )
		if tab2[2] > tempValue then
			tempValue = tab2[2]
			maxIndex = i
		end
	end

	local str = attrList1[maxIndex]
	if str then
		local newTab1 = string.split( str, '|' )
		for i = 1, #newTab1 do
			local tab1 = stringToNumberTable(newTab1[i], '_')
			local kk = tab1[1]
			local vv = tab1[2]
			tab.attr1[kk] = vv
		end
	end

	local temp2 = {}
	for i = 1, #attrList2 do
		if attrList2[i] and attrList2[i] ~= "0" then
			local temp = string.split(attrList2[i], "|")
			local newTab = stringToNumberTable(temp[1], "_")
			local tt = { index = i, value = newTab[2] }
			table.insert(temp2, tt)
		end
	end
	table.sort(temp2, function(a, b)
		return a.value > b.value
	end)
	local resultStr = nil
	if temp2[1] then
		local index = temp2[1].index
		resultStr = attrList2[index]
	end

	if resultStr then
		local resultTab = string.split(resultStr, "|")
		for k, v in pairs(resultTab) do
			local temp = stringToNumberTable(v, "_")
			local kk = temp[1]
			local vv = temp[2]
			tab.attr2[kk] = tab.attr2[kk] or 0
			tab.attr2[kk] = tab.attr2[kk] + vv
		end
	end

	return tab
end

function CardSkyBook:getChongzhuPercent()
	return self.chongzhuPercent or 0
end

function CardSkyBook:setChongzhuPercent(per)
	self.chongzhuPercent = per
	self:updatePower()
end

function CardSkyBook:getChongzhuData()
	return self.chongzhuData
end

function CardSkyBook:getChongzhuDataByIdx(idx)
	idx = idx or 1
	return self.chongzhuData[idx]
end

function CardSkyBook:getSecondGemOpen()
	local bibleId = self.id
	local items = BiblePracticeExtraData:getExtraItems(bibleId)
	table.sort(items, function(a, b)
		return a.id < b.id
	end)

	local bOpen = false
	for i = 1, #items do
		local item = items[i] or {}
		local quality = item.quality or 10
		local curNum = self:getHoleNumByQuality(quality)
		if curNum >= items[i].number and items[i].gem_open > 0 then
			bOpen = true
			break
		end
	end
	return bOpen
end

function CardSkyBook:isSpecialBook()
	if self:getConfigKind() >= 100 then
		return true
	else
		return false
	end
end
--清除参悟信息
function CardSkyBook:clearCanWuAttr()
	self.canWuAttribute:clear()
end
--增加参悟信息
function CardSkyBook:addSkyBookAttr(attrId, value)
	self.canWuAttribute:addAttr(attrId, value)
end

--清除参悟信息
function CardSkyBook:clearCanWuExtraAttr()
	self.canWuExtraAttribute:clear()
end
function CardSkyBook:addSkyBookExtraAttr(attrId, value)
	--self.canWuExtraAttribute.attribute[attrId] = value
	self.canWuExtraAttribute:addAttr(attrId, value)
end

function CardSkyBook:updateCanWuUseCountInfo()
	for i,useCountId in pairs(self.useCountReachIds) do
		local info 		= SkyBookManager:getByIdUsecount(useCountId)
		if (info) then
			local attribute = string.split(info.attribute, "|")
		    for k,v in pairs(attribute) do
	            local valueInfo     = string.split(v, "_")
	            local attrId        = tonumber(valueInfo[1])
	            local value         = tonumber(valueInfo[2])

	            if (info.power > 0) then
	                self:addSkyBookExtraAttr(attrId, value)
	            else
	                self:addSkyBookAttr(attrId, value)
	            end
	        end
	    end
	end
end
return CardSkyBook