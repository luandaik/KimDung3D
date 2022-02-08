--
-- Author: King
-- Date: 2014-07-21
--

local IllustrationManager = class("IllustrationManager")

IllustrationManager.IllustrationUpdate = "IllustrationUpdate"
IllustrationManager.HeroListForRedPointResult = "HeroListForRedPointResult"
IllustrationManager.UpdateZhuanJiInfo = "UpdateZhuanJiInfo"
IllustrationManager.categoryNum = 5

function IllustrationManager:ctor()
	self:RegisterEvents()

	-- local qualityRoleList = self:FilterRoleList(0)
	-- -- for i=1,4 do
	-- -- 	local SamequalityRoleList = self.qualityRoleList[i]
	-- -- 	print("----------------------------")
	-- -- 	print("quality = ", i)
	-- -- 	for n=1,#SamequalityRoleList do
	-- -- 		local role = SamequalityRoleList[n]
	-- -- 		print("role id = ", role.id)
	-- -- 	end
	-- -- end

	-- -- self.qualityEquipList = self:FilterEquipList(0)
	-- -- for i=1,4 do
	-- -- 	local SamequalityRoleList = self.qualityEquipList[i]
	-- -- 	print("----------------------------")
	-- -- 	print("quality = ", i)
	-- -- 	for n=1,#SamequalityRoleList do
	-- -- 		local role = SamequalityRoleList[n]
	-- -- 		print("equip id = ", role.id)
	-- -- 	end
	-- -- end

	-- local numList = self:CountNumInList(qualityRoleList)

	-- -- for i,v in ipairs(numList) do
	-- -- 	print(i,v)
	-- -- end
end

function IllustrationManager:restart()

	self.RoleList = {}

	self.EquipList = {}

	self.SkyBookList = {}
	self.XinFaList = {}

	self.StrategyCardList = {}
	self.allHeroStarNumList = {}

	self.zhuanjiAttributeTable = nil
	self.ZhuanJiListByType = {}
	self.ZhuanJiListByRoleId = {}
	self.typeList = {}
	self.isInitedHeroPu = false
	self.isGetRedPointInfo = false
	self.isOpenTuJian = false
end

--打开图鉴首页
function IllustrationManager:openIllustrationLayer(defaultIndex)

	self:RequestIllustration()
	--显示
	local layer = require('lua.logic.illustration.IllustrationLayer'):new(defaultIndex)
	AlertManager:addLayer(layer)
	AlertManager:show()

	-- 请求网络消息
end

function IllustrationManager:RegisterEvents()
	TFDirector:addProto(s2c.TUPU, self, self.onReceiveIllustration)
	TFDirector:addProto(s2c.HERO_PU_WATCHS, self, self.onReceiveIllustrationRedPoint)
	TFDirector:addProto(s2c.UPDATE_HERO_PU_WATCHS_SUCESS, self, self.onReceiveSetRedPointResunt)
end

function IllustrationManager:RequestIllustration()
	showLoading()
	TFDirector:send(c2s.QUERY_TUPU_LIST, {})
end

function IllustrationManager:RequestSetRedPoint(heroIdList)
	showLoading()
	local str = ''
	for k,v in pairs(heroIdList) do
		local item = ZhuanJiData:objectByID(v)
		local curStar = self.ZhuanJiListByType[item.type].curStar
		local data = self.ZhuanJiListByType[ item.type ].dataList[ curStar + 1 ]
		if curStar > -1 and data.isActive == true  then
			local id = data.id
			if id == v then
				self.ZhuanJiListByType[item.type].redPoint = false
			end
		end
	end
	self.heroListForRedPoint = {}
	local str = ''
	for k,v in pairs(self.ZhuanJiListByType) do
		local curStar = v.curStar
		local data = v.dataList[curStar + 1]
		if curStar > -1 and data.isActive == true and v.redPoint == false then
			table.insert(self.heroListForRedPoint,data.id)
			if str ~= '' then
				str = str .. ','
			end
			str = str .. data.id
		end
	end
	local msg = {
		str
	}

	TFDirector:send(c2s.UPDATE_HERO_PU_WATCHS, msg)
end

function IllustrationManager:onReceiveSetRedPointResunt(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(IllustrationManager.HeroListForRedPointResult)
end

function IllustrationManager:onReceiveIllustrationRedPoint(event)
	hideLoading()
	local data = event.data.val or ""
	local tbl = stringToNumberTable(data,',')
	self.heroListForRedPoint = tbl or {}
	self.isGetRedPointInfo = true
	if self.isInitedHeroPu == true then
		self:installRedPointInfo()
	end
end

function IllustrationManager:onReceiveIllustration(event)
	hideLoading()

	if self.RoleList == nil then
		self.RoleList = {}
	end
	local data = event.data
	--拥有过的角色id列表
	if data.roleStr and string.len(data.roleStr) > 0 then
		-- print("data.roleStr = ", data.roleStr)
		local RoleList = string.split(data.roleStr, "|")

		for i=1,#RoleList do
			local tbl = stringToNumberTable(RoleList[i],",")
			local id = tonumber(tbl[1])
			local star = tonumber(tbl[2])
			self.RoleList[id] = {id = id,star = star}
		end
	end

	if self.EquipList == nil then
		self.EquipList = {}
	end
	--拥有过的装备ID列表
	if data.equipStr and string.len(data.equipStr) > 0  then
		-- print("data.equipStr = ", data.equipStr)
		local EquipList = string.split(data.equipStr, ",")

		for i=1,#EquipList do
			local id = tonumber(EquipList[i])
			self.EquipList[id] = 1
		end
	end
	if self.SkyBookList == nil then
		self.SkyBookList = {}
	end
	--拥有过的装备ID列表
	if data.bibleStr and string.len(data.bibleStr) > 0  then
		-- print("data.bibleStr = ", data.bibleStr)
		local SkyBookList = string.split(data.bibleStr, ",")

		for i=1,#SkyBookList do
			local id = tonumber(SkyBookList[i])
			self.SkyBookList[id] = 1
		end
	end

	if self.StrategyCardList == nil then
		self.StrategyCardList = {}
	end

	if data.battleArrayStr and string.len(data.battleArrayStr) > 0  then
		local strategyList = string.split(data.battleArrayStr, ",")
		
		for i=1,#strategyList do
			local id = tonumber(strategyList[i])
			self.StrategyCardList[id] = 1
		end
	end
	if self.BibleKeyList == nil then
		self.BibleKeyList = {}
	end
	--天书秘要
	if data.bibleKeyStr and string.len(data.bibleKeyStr) > 0 then
		local strList = string.split(data.bibleKeyStr, ",")
		for i=1,#strList do
			local id = tonumber(strList[i])
			self.BibleKeyList[id] = 1
		end
	end
	if self.XinFaList == nil then
		self.XinFaList = {}
	end
	--拥有过的心法id
	if data.xinfaStr and string.len(data.xinfaStr) > 0 then
		print("data.xinfaStr = ", data.xinfaStr)
		local XinFaList = string.split(data.xinfaStr, ",")

		for i = 1, #XinFaList do
			local id = tonumber(XinFaList[i])
			self.XinFaList[id] = 1
		end
	end
	local verLock = VersionLockData:objectByID(EnumVersionLockType.Zhuanji_Lock)
    if verLock == nil or verLock.open ~= 0 then
        self:initHeroListData()
    end
	-- 消息分发
	TFDirector:dispatchGlobalEventWith(IllustrationManager.IllustrationUpdate)
end

function IllustrationManager:getZhuanJiAttri()
	if self.isInitedHeroPu == false then
		return {}
	end
	local infoList = self:getZhuanJiUnLockedNumByCategory()
	if self.zhuanjiAttributeTable == nil then
		self.zhuanjiAttributeTable = {}
		for k,v in pairs(self.typeList) do
			if v == true and self.ZhuanJiListByType[ k ].curStar > -1 then
				local curStar = self.ZhuanJiListByType[ k ].curStar
				local id = self.ZhuanJiListByType[ k ].dataList[ curStar + 1 ].id
				local item = ZhuanJiData:objectByID(id)
				if infoList[ item.category ].isUnlocked == true then
					local attributeTabel = item:getAttribute()
					for k,v in pairs(attributeTabel) do
						self.zhuanjiAttributeTable[k] = self.zhuanjiAttributeTable[k] or 0
						self.zhuanjiAttributeTable[k] = self.zhuanjiAttributeTable[k] + v
					end
				end
			end
		end
	end
	return self.zhuanjiAttributeTable or {}
end
--群侠传记星数
function IllustrationManager:getByCategoryZhuanJiStarNum(category)

	local infoList = self:getZhuanJiInfoBycategory()
	local starNum = -1
    local data = infoList[category]
    local haveRoleList = {}
    if (data) then
        local isUnlocked = data.isUnlocked
        if (isUnlocked) then
        	starNum = 0
            for k, info in ipairs(data.dataList) do
                local id = nil
                if info.curStar > -1 and info.dataList[info.curStar + 1].isActive == true then
                    id = info.dataList[info.curStar + 1].id
                else
                    id = info.dataList[1].id
                end
                local item      = ZhuanJiData:objectByID(id)
                local roleList  = item:getRoleIdList()

                for _,roleId in ipairs(roleList) do
                    if (haveRoleList[roleId] == nil) then
                        haveRoleList[roleId] = true
                        local star = self:getRoleStarById(roleId)
                        starNum = starNum + (star or 0)
                    end
                end
            end
        end
    end
	return starNum
end
--
function IllustrationManager:getByCategoryStarList(category)
	if (self.zhuanJiStarlist == nil or self.zhuanJiStarlist[category] == nil) then
		self.zhuanJiStarlist = {}
		for item in ZhuanJiData:iterator() do
			if (item.star_type == 2) then
				self.zhuanJiStarlist[item.category] = self.zhuanJiStarlist[item.category] or {}
				table.insert(self.zhuanJiStarlist[item.category], item)
			end
		end
	end
	return self.zhuanJiStarlist[category] or {}
end

--群侠传记星级加成
function IllustrationManager:getByCategoryStarZhuanJiAttri(category)
	local attributeTable = {}
	local starNum = self:getByCategoryZhuanJiStarNum(category)
	if (starNum > 0) then
		local zhuanJiStarlist = self:getByCategoryStarList(category)
		local idList = {}
		for i,v in ipairs(zhuanJiStarlist) do
			if (starNum >= tonumber(v.star)) then
				id = tonumber(v.id)
				table.insert(idList, id)
			end
		end
		for i,id in ipairs(idList) do
			local item = ZhuanJiData:objectByID(id)
			if item then
				local attributeTabel = item:getAttribute()
				for k,v in pairs(attributeTabel) do
					attributeTable[k] = (attributeTable[k] or 0) + (v or 0)
				end
			end
		end
	end
	return attributeTable
end
--群侠传记加的所有属性
function IllustrationManager:getZhuanJiAllAttri()
	if self.isInitedHeroPu == false then
		return {}
	end
	local list = {}
	local zhuanjiAttrList = self:getZhuanJiAttri()
	for k,v in pairs(zhuanjiAttrList) do
		list[k] = v or 0
	end
	for i=1, IllustrationManager.categoryNum do
		local attrList = self:getByCategoryStarZhuanJiAttri(i)
		for k,v in pairs(attrList) do
			list[k] = (list[k] or 0) + (tonumber(v) or 0)
		end
	end
	return list
end
function IllustrationManager:getStarLevelByRoelId(roleId)
	if self.RoleList[roleId] ~= nil then
		return self.RoleList[roleId].star
	end
	return 0
end

function IllustrationManager:updateZhuanJiByRoleId( roleId , starLevel )
	local verLock = VersionLockData:objectByID(EnumVersionLockType.Zhuanji_Lock)
    if verLock and verLock.open == 0 then
    	return
    end
	if roleId == nil then
		return
	end
	if self.RoleList[roleId] == nil then
		self.RoleList[roleId] = {id = roleId,star = starLevel}
	else
		if self.RoleList[roleId].star < starLevel then
			self.RoleList[roleId].star = starLevel
		else
			return
		end
	end
	
	local dataList = self.ZhuanJiListByRoleId[roleId] or {}
	if #dataList <= 0 then
		return
	end
	local unLockedList = {}
	for k,v in pairs(dataList) do
		local item = ZhuanJiData:objectByID(v)
		if starLevel >= item.star and self.ZhuanJiListByType[ item.type ].dataList[ item.star  + 1].isActive ~= true then
			local roleList = item:getRoleIdList()
			local unLocked = true
			for k,v in pairs(roleList) do
				if self.RoleList[v] ~= nil then
					local roleLevel = self.RoleList[v].star
					if roleLevel == nil or roleLevel < item.star then
						unLocked = false
						break
					end
				else
					unLocked = false
					break
				end
			end
			self.ZhuanJiListByType[ item.type ].dataList[ item.star  + 1].isActive = unLocked
			if unLocked == true then
				if self.ZhuanJiListByType[ item.type ].curStar < item.star then
					self.ZhuanJiListByType[ item.type ].curStar = item.star
					self.ZhuanJiListByType[ item.type ].redPoint = true
					self.typeList[ item.type ] = true
					table.insert(unLockedList,item.type)
				end
			end
		end
	end
	local needBrush = false
	local infoList = self:getZhuanJiUnLockedNumByCategory()
	for k,v in pairs(unLockedList) do
		local data = self.ZhuanJiListByType[ v ]
		if infoList[data.category].isUnlocked == true then
			needBrush = true
		end
	end
	if needBrush == true then
		self.zhuanjiAttributeTable = nil
		TFDirector:dispatchGlobalEventWith(IllustrationManager.UpdateZhuanJiInfo,{})
	end
end

function IllustrationManager:getZhuanJiInfoBycategory()
	local infoList = {}
	for k,v in ipairs(self.ZhuanJiListByType) do
		local curStar = v.curStar
		infoList[v.category] = infoList[v.category] or {}
		infoList[v.category].dataList = infoList[v.category].dataList or {}
		infoList[v.category].unLockedNum = infoList[v.category].unLockedNum or 0
		if curStar > -1 and v.dataList[curStar + 1].isActive == true then
			infoList[v.category].unLockedNum = infoList[v.category].unLockedNum + 1
		end

		table.insert(infoList[v.category].dataList,v)
	end

	for i=1,5 do
		local data = ZhuanJiCondData:getDataByCategory(i)
        local isUnlocked = true
        if data.cond_category ~= 0 then
            infoList[data.cond_category] = infoList[data.cond_category] or {}
            infoList[data.cond_category].isUnlocked = infoList[data.cond_category].isUnlocked or false
            infoList[data.cond_category].unLockedNum = infoList[data.cond_category].unLockedNum or 0
            if infoList[data.cond_category].isUnlocked == false or infoList[data.cond_category].unLockedNum < data.num then
                isUnlocked = false
            end
        end
        infoList[i] = infoList[i] or {}
        infoList[i].isUnlocked = isUnlocked
	end
	return infoList
end

function IllustrationManager:getZhuanJiUnLockedNumByCategory()
	local infoList = {}
	for k,v in ipairs(self.ZhuanJiListByType) do
		local curStar = v.curStar
		if infoList[v.category] == nil then
			infoList[v.category] = {}
		end
		infoList[v.category].unLockedNum = infoList[v.category].unLockedNum or 0
		if curStar > -1 and v.dataList[curStar + 1].isActive == true then
			infoList[v.category].unLockedNum = infoList[v.category].unLockedNum + 1
		end
	end
	
	for i=1,5 do
		local data = ZhuanJiCondData:getDataByCategory(i)
        local isUnlocked = true
        if data.cond_category ~= 0 then
            infoList[data.cond_category] = infoList[data.cond_category] or {}
            if infoList[data.cond_category].isUnlocked == false or infoList[data.cond_category].unLockedNum < data.num then
                isUnlocked = false
            end
        end
        infoList[i].isUnlocked = isUnlocked
	end
	return infoList
end

function IllustrationManager:initHeroListData()
	self.zhuanjiAttributeTable = nil
	self.typeList = {}
	self.ZhuanJiListByRoleId = {}
	for item in ZhuanJiData:iterator() do
		if (item.star_type == 1) then
			if  self.ZhuanJiListByType[ item.type ] == nil then
				self.ZhuanJiListByType[ item.type ] = {}
				self.ZhuanJiListByType[ item.type ].dataList = {}
				self.ZhuanJiListByType[ item.type ].maxStar = 0
				self.ZhuanJiListByType[ item.type ].curStar = -1
				self.ZhuanJiListByType[ item.type ].redPoint = false
			end
			self.ZhuanJiListByType[ item.type ].category = item.category
			self.ZhuanJiListByType[ item.type ].type = item.type
			if self.ZhuanJiListByType[ item.type ].maxStar < item.star then
				self.ZhuanJiListByType[ item.type ].maxStar = item.star
			end
			local tbl = self.ZhuanJiListByType[ item.type ].dataList[ item.star + 1 ] or {}
			self.ZhuanJiListByType[ item.type ].dataList[ item.star + 1 ] = tbl
			self.ZhuanJiListByType[ item.type ].dataList[ item.star + 1 ].id = item.id
			self.ZhuanJiListByType[ item.type ].dataList[ item.star + 1 ].star = item.star
			local roleList = item:getRoleIdList()
			local unLocked = true
			for k,v in pairs(roleList) do
				if  self.ZhuanJiListByRoleId[ v ] == nil then
					self.ZhuanJiListByRoleId[ v ] = {}
				end
				table.insert(self.ZhuanJiListByRoleId[ v ],item.id)
				-------------------------------------------------------
				if self.RoleList[v] ~= nil then
					local roleLevel = self.RoleList[v].star
					if roleLevel == nil or roleLevel < item.star then
						unLocked = false
					end
				else
					unLocked = false
				end
			end
			self.ZhuanJiListByType[ item.type ].dataList[ item.star  + 1].isActive = unLocked
			if unLocked == true then
				if self.ZhuanJiListByType[ item.type ].curStar < item.star then
					self.ZhuanJiListByType[ item.type ].curStar = item.star
				end
				self.typeList[item.type] = true
				self.ZhuanJiListByType[ item.type ].redPoint = true
			end
		end
	end
	self.isInitedHeroPu = true
	if self.isGetRedPointInfo == true then
		self:installRedPointInfo()
	end
end

function IllustrationManager:installRedPointInfo()
	for k,v in pairs(self.heroListForRedPoint) do
		local item = ZhuanJiData:objectByID(v)
		if item and self.ZhuanJiListByType[item.type] then
			local curStar = self.ZhuanJiListByType[item.type].curStar
			if curStar > -1 then
				local id = self.ZhuanJiListByType[ item.type ].dataList[ curStar + 1 ].id
				if id == v then
					self.ZhuanJiListByType[item.type].redPoint = false
				end
			end
		end
	end
end

function IllustrationManager:getZhuanJiListByType( type )
	return self.ZhuanJiListByType[ type ]
end

function IllustrationManager:checkRedPoint()
	if self.isGetRedPointInfo == false or self.isInitedHeroPu == false then
		return false
	end
	local infoList = self:getZhuanJiUnLockedNumByCategory()
	for k,v in ipairs(self.ZhuanJiListByType) do
		local curStar = v.curStar
		if infoList[v.category].isUnlocked == true then
			if curStar > -1 and v.dataList[curStar + 1].isActive == true then
				if v.redPoint == true then
					return true
				end
			end
		end
	end
	return false
end

function IllustrationManager:checkRedPointByCategory( categoryId )
	if self.isGetRedPointInfo == false or self.isInitedHeroPu == false then
		return false
	end
	local infoList = self:getZhuanJiUnLockedNumByCategory()
	if infoList[categoryId].isUnlocked == false then
		return false
	end
	for k,v in ipairs(self.ZhuanJiListByType) do
		if categoryId == v.category then
			local curStar = v.curStar
			if curStar > -1 and v.dataList[curStar + 1].isActive == true then
				if v.redPoint == true then
					return true
				end
			end
		end
	end
	return false
end
-- 检查是拥有过
function IllustrationManager:checkRoleIsPossess(roleid)
	if self.RoleList == nil then
		return false
	end

	if self.RoleList[roleid] == nil then
		-- print("roleid=", roleid)
		return false
	end

	return true
end

function IllustrationManager:getRoleStarById( roleid )
	if self.RoleList[roleid] == nil then
		return 0
	end
	return self.RoleList[roleid].star or 0
end

-- 通过角色类型筛选
function IllustrationManager:FilterRoleList(outline)
	local qualityRoleList = {}

	local quality 			= 1
	local key 				= 0
	for v in RoleData:iterator() do

		local curquality = v.quality
		if qualityRoleList[curquality] == nil then
			qualityRoleList[curquality] = {}
		end

		local bHave = false
		-- 检测这个是否拥有过
		if self:checkRoleIsPossess(v.id) then
			-- print("拥有该角色=", v.id)
			bHave = true
		end

		-- if v.on_show == 1 then --, show_way
		-- 	if outline == 0 then
		-- 		table.insert(qualityRoleList[curquality], {id = v.id, quality = v.quality, isOwn = bHave})
		-- 	elseif v.outline == outline then
		-- 		table.insert(qualityRoleList[curquality], {id = v.id, quality = v.quality, isOwn = bHave})
		-- 	end
		-- end

		if v.on_show == 1 then --, show_way
			if self:roleDisplayCondition(v.id) then
				if outline == 0 then
					table.insert(qualityRoleList[curquality], {id = v.id, quality = v.quality, isOwn = bHave ,show_weight = v.show_weight or 0})
				elseif v.outline == outline then
					table.insert(qualityRoleList[curquality], {id = v.id, quality = v.quality, isOwn = bHave ,show_weight = v.show_weight or 0})
				end
			end
		end

    end

    return qualityRoleList
end
-- 天命筛选
function IllustrationManager:FilterTianMingList( kind )
	local tTianMingList = {}

	for v in ItemData:iterator() do

		local curquality = v.quality
		if tTianMingList[curquality] == nil then
			tTianMingList[curquality] = {}
		end

		-- 30763 是特殊测试天命，不予显示
		if kind == 0 and (v.type == 27 or v.type == 28 or v.type == 29) and v.id ~= 30763 then
			table.insert(tTianMingList[curquality], {id = v.id, quality = v.quality})
		elseif v.type == kind and v.id ~= 30763 then
			table.insert(tTianMingList[curquality], {id = v.id, quality = v.quality})
		end
    end

	return tTianMingList
end

-- 检查是拥有过秘要
function IllustrationManager:checkMiYaoIsPossess(miYaoid)
	if self.BibleKeyList == nil then
		return false
	end

	if self.BibleKeyList[miYaoid] == nil then
		return false
	end

	return true
end
-- 通过武器类型筛选
function IllustrationManager:FilterMiYaoList(kind)
	local qualityEquipList = {}

	local quality 			= 1
	local key 				= 0
	for v in ItemData:iterator() do

		local curquality = v.quality
		if qualityEquipList[curquality] == nil then
			qualityEquipList[curquality] = {}
		end

		local bHave = false
		-- 检测这个是否拥有过
		if self:checkMiYaoIsPossess(v.id) then
			bHave = true
			-- print("拥有该武器=", v.id)
		end
		if v.show_weight ~= 0 then
			if kind == 0 and v.type == 25 then
				table.insert(qualityEquipList[curquality], {id = v.id, quality = v.quality, isOwn = bHave , show_weight = v.show_weight or 0})
			elseif v.kind == kind and v.type == 25 then
				table.insert(qualityEquipList[curquality], {id = v.id, quality = v.quality, isOwn = bHave , show_weight = v.show_weight or 0})
			end
		end
    end

    return qualityEquipList
end

-- 检查是拥有过
function IllustrationManager:checkEquipIsPossess(Equipid)
	if self.EquipList == nil then
		return false
	end

	if self.EquipList[Equipid] == nil then
		return false
	end

	return true
end

-- 通过武器类型筛选
function IllustrationManager:FilterEquipList(kind)
	local qualityEquipList = {}

	local quality 			= 1
	local key 				= 0
	for v in ItemData:iterator() do

		local curquality = v.quality
		if qualityEquipList[curquality] == nil then
			qualityEquipList[curquality] = {}
		end

		local bHave = false
		-- 检测这个是否拥有过
		if self:checkEquipIsPossess(v.id) then
			bHave = true
			-- print("拥有该武器=", v.id)
		end

		if v.show_weight ~= 0 then
			if kind == 0 and v.type == 1 then
				table.insert(qualityEquipList[curquality], {id = v.id, quality = v.quality, isOwn = bHave , show_weight = v.show_weight or 0})
			elseif v.kind == kind and v.type == 1 then
				table.insert(qualityEquipList[curquality], {id = v.id, quality = v.quality, isOwn = bHave , show_weight = v.show_weight or 0})
			end
		end
    end

    return qualityEquipList
end

-- 检查是拥有过
function IllustrationManager:checkSkyBookIsPossess(bookId)
	if self.SkyBookList == nil then
		return false
	end

	if self.SkyBookList[bookId] == nil then
		return false
	end

	return true
end
-- 检查是拥有过
function IllustrationManager:checkXinFaIsPossess(bookId)
	if self.XinFaList == nil then
		return false
	end

	if self.XinFaList[bookId] == nil then
		return false
	end

	return true
end
-- 检查是拥有过
function IllustrationManager:checkStrategyCardIsPossess(cardId)
	if self.StrategyCardList == nil then
		return false
	end

	if self.StrategyCardList[cardId] == nil then
		return false
	end

	return true
end

-- 通过武器类型筛选
function IllustrationManager:getSkyBookList()
	local qualitySkyBookList = {}

	for v in ItemData:iterator() do

		if v.type == 12 then
			local curquality = v.quality
			if qualitySkyBookList[curquality] == nil then
				qualitySkyBookList[curquality] = {}
			end

			local bHave = false
			if self:checkSkyBookIsPossess(v.id) then
				bHave = true
			end

			table.insert(qualitySkyBookList[curquality], {id = v.id, quality = v.quality, isOwn = bHave,show_weight = v.show_weight or 0})
		end
    end

    return qualitySkyBookList
end

-- 通过武器类型筛选
function IllustrationManager:getXinFaList()
	local qualityXinFaList = {}

	for v in ItemData:iterator() do

		if v.type == 35 then
			local curquality = v.quality
			if qualityXinFaList[curquality] == nil then
				qualityXinFaList[curquality] = {}
			end

			local bHave = false
			if self:checkXinFaIsPossess(v.id) then
				bHave = true
			end

			table.insert(qualityXinFaList[curquality], {kind = v.kind, usable = v.usable, id = v.id, quality = v.quality, isOwn = bHave,show_weight = v.show_weight or 0})
		end
    end

    return qualityXinFaList
end

function IllustrationManager:getZhenfaList()
	local qualityZhenfaList = {}

	for v in ItemData:iterator() do

		if v.type == EnumGameItemType.StrategyCard then
			local curquality = v.quality
			if qualityZhenfaList[curquality] == nil then
				qualityZhenfaList[curquality] = {}
			end

			local bHave = false
			if self:checkStrategyCardIsPossess(v.id) then
				bHave = true
			end

			local item = BattleArrayData:objectByID(v.id)
			if item and item.on_show == 1 then --, show_way
				table.insert(qualityZhenfaList[curquality], {id = v.id, quality = v.quality, isOwn = bHave,show_weight = v.show_weight or 0})
			end
		end
    end

    return qualityZhenfaList
end
-- 计算每个品质的个数
function IllustrationManager:CountNumInList(list)

	if list == nil then
		return nil
	end

	-- print("list = ", list)
	local qualityRoleNum = {}
	for i=1,(QualityHeroType.Max - 1) do
		if list[i] then
			local SamequalityList = list[i]
			local num = #SamequalityList
			if num > 0 then
				local myOwnNum = 0
				for j=1,num do
					if SamequalityList[j].isOwn == true then
						myOwnNum = myOwnNum + 1
					end
				end
				table.insert(qualityRoleNum, 1, {quality = i, number = num, curNum = myOwnNum})
			end
		end
	end

    return qualityRoleNum
end


--param = {equipId = self.equipid}) or {roleId = self.cardRoleId})
function IllustrationManager:showOutputList(param)
    local layer  = require("lua.logic.illustration.IllustrationOutPutLayer"):new(param)
    AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY)
    AlertManager:show()
end


function IllustrationManager:gotoProductSystem(type, mission)

-- --                       1       2        3          4       5        6          7       8        9          10        11       12        13       14     15      16    17   18       20
-- EnumItemOutPutType = {"关卡", "群豪谱", "无量山", "摩诃崖", "护驾", "龙门镖局", "商店", "酒馆" ,"金宝箱", "银宝箱", "铜宝箱","VIP奖励","VIP礼包","活动","签到","成就","日常" , "雁门关"} 祈愿

    if type == 1 then
        local open    = MissionManager:getMissionIsOpen(mission)
        print("mission = ", mission)
        if open then
            MissionManager:showHomeToMissionLayer(mission)
        else
            -- toastMessage("关卡尚未开启")
            toastMessage(localizable.IllustrationManager_tips[type])
        end

    elseif type == 2 then
        if FunctionOpenConfigure:getOpenLevel(301) <= MainPlayer:getLevel() then
            -- MallManager:openQunHaoShopHome()
            ActivityManager:showLayer(ActivityManager.TAP_Arena)
        else
            -- toastMessage("群豪谱尚未开启")
            toastMessage(localizable.IllustrationManager_tips[type])
        end

    elseif type == 3 then
        if FunctionOpenConfigure:getOpenLevel(401) <= MainPlayer:getLevel() then
            -- ClimbManager:showMountainLayer()
            ActivityManager:showLayer(ActivityManager.TAP_Climb)

        else
            -- toastMessage("无量山尚未开启")
            toastMessage(localizable.IllustrationManager_tips[type])
        end

    elseif type == 4 then
        if FunctionOpenConfigure:getOpenLevel(601) <= MainPlayer:getLevel() then
            -- ClimbManager:showCarbonListLayer()
            ActivityManager:showLayer(ActivityManager.TAP_Carbon)

        else
            -- toastMessage("摩诃崖尚未开启")
            toastMessage(localizable.IllustrationManager_tips[type])
        end

    -- 奇遇
    elseif type == 5 or type == 6 or type == 15 then
        QiyuManager:OpenHomeLayer()


    -- 商店
    elseif type == 7 then
        -- 进入商店
        -- MallManager:openMallLayer()
        MallManager:openMallLayer(1)

    -- 酒馆
    elseif type == 8 then
        MallManager:openRecruitLayer()

    -- vip 奖励
    elseif type == 12 then
        PayManager:showVipLayer()

    -- vip 礼包
    elseif type == 13 then
        -- 进入商店
        -- MallManager:openMallLayer()
        MallManager:openMallLayer(2)

    -- 活动
    elseif type == 14 then
        OperationActivitiesManager:openHomeLayer()

     -- 成就
    elseif type == 16 then
        TaskManager:ShowTaskLayer(1)

    -- 日常
    elseif type == 17 then
        if FunctionOpenConfigure:getOpenLevel(1001) <= MainPlayer:getLevel() then
            -- ClimbManager:showCarbonListLayer()
            TaskManager:ShowTaskLayer(0)

        else
            -- toastMessage("日常尚未开启")

            toastMessage(localizable.IllustrationManager_tips[type])
        end

    elseif type == 18 then
        if FunctionOpenConfigure:getOpenLevel(501) <= MainPlayer:getLevel() then
            ActivityManager:showLayer(ActivityManager.TAP_EverQuest)

        else
            -- toastMessage("雁门关尚未开启")
            toastMessage(localizable.IllustrationManager_tips[type])
        end
    elseif type == 20 then
        if FunctionOpenConfigure:getOpenLevel(2202) <= MainPlayer:getLevel() then
            -- ActivityManager:showLayer(ActivityManager.TAP_EverQuest)
            QiYuanManager:OpenQiYuanLayer()

        else
            --toastMessage("祈愿尚未开启")
            toastMessage(localizable.IllustrationManager_not_open)
        end
    elseif type == 21 then
		local openLevel = FunctionOpenConfigure:getOpenLevel(2203) or 65
    	if openLevel <= MainPlayer:getLevel() then
            MallManager:openMallLayerByType(EnumMallType.AdventureMall,1)
        else
        	toastMessage(stringUtils.format(localizable.IllustrationManager_not_open1,openLevel))
        end
    elseif type == 22 then
		local open = true
		local missionInfo = AdventureMissionManager:getMissionById(mission)
		if missionInfo.starLevel == MissionManager.STARLEVEL0 then
			open = false
		end
		if open then
			local layer = AdventureManager:openMissLayer()
			if layer then
				layer:showMissionById(mission)
			end
		else
			toastMessage(localizable.Tianshu_hecheng_text4)
		end
	elseif type == 23 then
		local open = true

		local needLevel = FunctionOpenConfigure:getOpenLevel(2214)
    
	    if MainPlayer:getLevel() < needLevel then
	    	toastMessage(stringUtils.format(localizable.common_level_unlock,needLevel))
	    else
	    	ChuangzhenManager:openMainLayer(true)
	    end		
	elseif type == 25 then 
		local needLevel = FunctionOpenConfigure:getOpenLevel(2231)
	    if MainPlayer:getLevel() < needLevel then
	    	toastMessage(stringUtils.format(localizable.common_function_openlevel,needLevel))
	    else
			ActivityManager:showLayer(ActivityManager.TAP_ShiXinTai)
		end
	elseif type == 26 then
		MallManager:openMallLayerByType(EnumMallType.JingXinMall,1)
    end
end

function IllustrationManager:roleDisplayCondition(roleid)
	local bShow = true

	-- 252 任我行
	-- 278 东方不败
	if roleid == 252 or roleid == 278 then
		local nowTime   = GetCorrectTime()--MainPlayer:getNowtime()
	    local time1     = GetCorrectTime({year=2016, month=2, day=12, hour=0})

	    if nowTime >= time1 then
	        bShow = true
	    else
			bShow = false
	    end
	-- elseif roleid == 280 then
	-- 	return false
	end

    return bShow
end
function IllustrationManager:openZhuanJi()
	local layer  = require("lua.logic.illustration.IllustrationZhuanJiLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end



return IllustrationManager:new()