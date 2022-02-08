-- client side ChuangzhenManager.lua
--[[
 * @Description: 闯阵管理器
 ]]
-- script writer Stephen.tao
-- creation time 2016-08-08


local ChuangzhenManager = class("ChuangzhenManager")

ChuangzhenManager.GridStateClosed = 0 	-- 未探索
ChuangzhenManager.GridStateOpen = 1 	-- 已探索
ChuangzhenManager.GridStateGet = 2 		-- 已获取

ChuangzhenManager.ElementNone 	= 0  	--什么都没有
ChuangzhenManager.ElementBox 	= 1  	--宝箱
ChuangzhenManager.ElementGuard 	= 2  	--阵卫
ChuangzhenManager.ElementBoss 	= 3  	--护法
ChuangzhenManager.ElementBuff 	= 4  	--机关
-- ChuangzhenManager.ElementStart	= 5  	--起点

ChuangzhenManager.CanTouch = 1
ChuangzhenManager.DisTouch = 2

ChuangzhenManager.ReceiveGridElement = "ChuangzhenManager.ReceiveGridElement"
ChuangzhenManager.ReceiveBuffElement = "ChuangzhenManager.ReceiveBuffElement"
ChuangzhenManager.ReceiveSuccess 	 = "ChuangzhenManager.ReceiveSuccess"
ChuangzhenManager.ReceiveGiveUpSuccess 	 = "ChuangzhenManager.ReceiveGiveUpSuccess"
ChuangzhenManager.ReceiveCloudBrush 	 = "ChuangzhenManager.ReceiveCloudBrush"

local CrossArrayRushZoneData = require("lua.table.t_s_rush_zone")
local CrossArrayRushCheckpointData = require("lua.table.t_s_rush_checkpoint")
local CrossArrayElementData = require("lua.table.t_s_rush_checkpoint_element")
local CrossArrayOrganData = require("lua.table.t_s_rush_organ")
local CrossArrayNpcData = require("lua.table.t_s_rush_npc")

function ChuangzhenManager:ctor()
	self.type = 0
	self.level = 0
	self.maxType = 0
	self.challengeTime = 0
	self.mapData = {}
	self.mapState = {}
	self.mapItemId = {}
	self.choiceState = {}
	self.attribute	= {}
	self.roleList	= {}
	self.buffList = {}

	self.crossArrayRushZoneData = MEMapArray:new()
	self.allMapGridInfo = {}
	self:initStaticData()

--副本信息
    TFDirector:addProto(s2c.RUSH_ZONE_INFOS, self, self.onReceiveRushZoneInfos)
    --关卡信息
    TFDirector:addProto(s2c.RUSH_CHECK_POINT_INFO, self, self.onReceiveRushCheckPointInfo)
    --格子元素
    TFDirector:addProto(s2c.GRID_ELEMENT, self, self.onReceiveGridElement)
    TFDirector:addProto(s2c.PASS_BOSS, self, self.onReceivePassBoss)
    TFDirector:addProto(s2c.GIVE_UP_RUSH_SUCESS, self, self.onReceiveGiveUpRushSucess)
    TFDirector:addProto(s2c.RUSH_SWEEP_ITEMS, self, self.onReceiveRushSweepItems)
end

function ChuangzhenManager:restart()
	self.type = 0
	self.level = 0
	self.maxType = 0
	self.challengeTime = 0
	self.mapData = {}
	self.mapState = {}
	self.mapItemId = {}
	self.choiceState = {}
	self.attribute	= {}
	self.roleList	= {}

end

function ChuangzhenManager:setMapData( type , level )
	print("type,level",type,level)
	self.mapData = self.allMapGridInfo[type][level]
end

function ChuangzhenManager:initStaticData()
	for v in CrossArrayRushZoneData:iterator() do
		local tbl = clone(v)
		tbl.id = v.zone_id
		self.crossArrayRushZoneData:push(tbl)
	end
	for v in CrossArrayRushCheckpointData:iterator() do
		self.allMapGridInfo[v.zone_id] = self.allMapGridInfo[v.zone_id] or {}
		self.allMapGridInfo[v.zone_id][v.checkpoint_id] = v
	end
end

function ChuangzhenManager:getZoneInfo( zoneId )
	return self.crossArrayRushZoneData:objectByID(zoneId)
end

function ChuangzhenManager:getMapGridInfo( type , level )
	if self.allMapGridInfo[type] == nil then
		return nil
	end
	return self.allMapGridInfo[type][level]
end

function ChuangzhenManager:getNpcInfoById( npcid )
	return CrossArrayNpcData:objectByID(npcid)
end

function ChuangzhenManager:getRoundGrid(index)
	local high = math.ceil(index/self.mapData.width)
	local width = index - (high - 1) * self.mapData.width
	local array = TFArray:new()
	for i=1,3 do
		local _high = high + i - 2
		if _high > 0 and _high <= self.mapData.high then
			for j=1,3 do
				local _width = width + j - 2
				if _width > 0 and _width <= self.mapData.width then 
					local num = (_high - 1) * self.mapData.width + _width
					array:push(num)
				end
			end
		end
	end
	return array
end

function ChuangzhenManager:setRoundTouchStateByIndex( index ,notice)
	if notice == nil then
		notice = false
	end
	if self.mapItemId[index] and self.mapItemId[index].type == ChuangzhenManager.ElementGuard then
		local roundGrid = self:getRoundGrid(index)
		for v in roundGrid:iterator() do
			if self.mapState[v] == ChuangzhenManager.GridStateClosed then
				self.choiceState[v] = ChuangzhenManager.DisTouch
				if notice then
					TFDirector:dispatchGlobalEventWith(ChuangzhenManager.ReceiveGridElement,{v,nil,notice});
				end
			end
		end
	end
end

function ChuangzhenManager:setTouchState()
	self.choiceState = {}
	local length = self.mapData.width * self.mapData.high
	for i=1,length do
		self.choiceState[i] = ChuangzhenManager.CanTouch
	end
	for i=1,length do
		self:setRoundTouchStateByIndex(i)
	end
end


function ChuangzhenManager:freshTouchStateByIndex(index )
	local roundGrid = self:getRoundGrid(index)
	if self.mapState[index] ~= ChuangzhenManager.GridStateClosed then
		self.choiceState[index] = ChuangzhenManager.CanTouch
		return self.choiceState[index]
	end
	for v in roundGrid:iterator() do
		if self.mapItemId[v] and self.mapItemId[v].type == ChuangzhenManager.ElementGuard then
			self.choiceState[index] = ChuangzhenManager.DisTouch
			return self.choiceState[index]
		end
	end
	self.choiceState[index] = ChuangzhenManager.CanTouch
	return self.choiceState[index]
end

function ChuangzhenManager:onReceiveRushZoneInfos( event )
	hideLoading()
	local data = event.data
	print("onReceiveRushZoneInfos -->",data)
	self.type = 0
	self.maxType = 0
	if data.infos then
		for i=1,#data.infos do
			local info = data.infos[i]
			if info.pass then
				self.maxType = math.max(self.maxType,info.zoneId)
			end
			if info.use then
				self.type = info.zoneId 
			end
		end
	end
	self:openCrossArrayChooseLayer(false)

end

function ChuangzhenManager:onReceiveRushCheckPointInfo( event )
	hideLoading()
	local data = event.data
	self.mapItemId = {}
	print("onReceiveRushCheckPointInfo -->",data)
	if data.checkpointId ~= 0 then

		self.type = self.startZoneid or self.type
		self.level = data.checkpointId
		self:setMapData( self.type , self.level )
		self:setGirdState(data.openPoints)
		if data.elements then
			for i=1,#data.elements do
				self:setGirdElements(data.elements[i])
			end
		end
		self:setTouchState()
		-- self.attribute = GetAttrByString(data.organ)
		self:setOrganBuff(data.organ)
		self:freshRoleState(data.roleState)
	
		self:openCrossArrayMainLayer()
	else
		self.type = 0
		self.level = 0
		self.mapData = {}
		self.mapState = {}
		self.mapItemId = {}
		self.choiceState = {}
		self.attribute	= {}
		self.roleList	= {}
		self.buffList = {}
	end
end

function ChuangzhenManager:freshRoleState(roleState)
	self.roleList = {}
	local temptbl = string.split(roleState,'|')			--分解"|"
	for k,v in pairs(temptbl) do
		local temp = string.split(v,'_')				--分解'_',集合为 key，vaule 2个元素
		if temp[1] and temp[2] then
			self.roleList[tonumber(temp[1])] = tonumber(temp[2])
		end		
	end
end
function ChuangzhenManager:getRoleStateById( instanceId )
	return self.roleList[instanceId] or 1
end
function ChuangzhenManager:getOrganBuffByType( type )
	return self.buffList[type] or {}
end

function ChuangzhenManager:setOrganBuff( strorgan )
	self.buffList = {}
	if strorgan == "" then
		return
	end
	local idtbl = stringToNumberTable(strorgan, ',')
	for k,v in pairs(idtbl) do
		local organItem = CrossArrayOrganData:objectByID(v)
		if organItem ~= nil then
			self.buffList[organItem.type] = self.buffList[organItem.type] or {}
			local value = self.buffList[organItem.type].value or 0
			value = value + organItem.num
			self.buffList[organItem.type].value = value
			--self.buffList[organItem.type].describe = organItem.describe
		end
	end
end

function ChuangzhenManager:setGirdState(openPoints )
	local length = self.mapData.width * self.mapData.high
	for i=1,length do
		self.mapState[i] = ChuangzhenManager.GridStateClosed
	end
	local points = string.split(openPoints, '|')
	for k,v in pairs(points) do
		local point = string.split(v, '_')
		self.mapState[tonumber(point[1])] = tonumber(point[2])
	end
end

function ChuangzhenManager:setGirdElements( element )
	self.mapItemId[element.point] = {}
	local elementId = element.elementId
	local elementInfo = CrossArrayElementData:objectByID(elementId)
	if elementInfo then
		self.mapItemId[element.point].type = elementInfo.type
		self.mapItemId[element.point].assId = elementInfo.ass_id
		if elementInfo.type == ChuangzhenManager.ElementGuard then
			self:setRoundTouchStateByIndex( index)
		end  
	end
end
function ChuangzhenManager:onReceiveGridElement( event )
	hideLoading()
	local data = event.data
	print("onReceiveGridElement ==>>",data)
	local stateChanged = false
	if self.mapState[data.point] ~= data.state then
		print("old type -->>>>self.mapState[data.point] = ",self.mapState[data.point])
		self.mapState[data.point] = data.state
		stateChanged = true
	end
	local buffType = 0
	if data.type and data.assId then
		self.mapItemId[data.point] = {}
		self.mapItemId[data.point].type = data.type
		self.mapItemId[data.point].assId = data.assId
		if data.state == ChuangzhenManager.GridStateGet and data.type == ChuangzhenManager.ElementBuff then
			local organItem = CrossArrayOrganData:objectByID(data.assId)
			if organItem ~= nil then
				self.buffList[organItem.type] = self.buffList[organItem.type] or {}
				local value = self.buffList[organItem.type].value or 0
				value = value + organItem.num
				self.buffList[organItem.type].value = value
				--self.buffList[organItem.type].describe = organItem.describe
				if organItem.num > 0 then
					buffType = 1
				else
					buffType = 2
				end
				TFDirector:dispatchGlobalEventWith(ChuangzhenManager.ReceiveBuffElement,{data.assId}); 
			end
		end

		if data.state == ChuangzhenManager.GridStateOpen and data.type  == ChuangzhenManager.ElementGuard then
            self:setRoundTouchStateByIndex( data.point,true)
        end
	end
	if data.state == ChuangzhenManager.GridStateOpen or data.state == ChuangzhenManager.GridStateGet then
    	self:setRoundTouchOpen(data.point)
	end
	local msg = {data.point,buffType,stateChanged}
	print("msg = ",msg)
	TFDirector:dispatchGlobalEventWith(ChuangzhenManager.ReceiveGridElement,msg); 
end
function ChuangzhenManager:onReceivePassBoss( event )
	hideLoading()
	local data = event.data or {}
	print("ChuangzhenManager:onReceivePassBoss = ",data)
	local islast = data.lastBoss or 0
	local itemlist = data.items or {}
	if islast == 1 or islast == true then
		self:GainRushZoneInfo()
	end
	TFDirector:dispatchGlobalEventWith(ChuangzhenManager.ReceiveSuccess,{itemlist,islast}); 
end

function ChuangzhenManager:onReceiveRushSweepItems( event )
	hideLoading()
	local data = event.data
	print("onReceiveRushSweepItems ====>",data)
	if data.checkpointItems == nil then
		return
	end
	local ccdata = {}
    for i=1,#data.checkpointItems do
        ccdata[i] = {}
        ccdata[i].currLev = 0
        ccdata[i].addCoin = 0
        ccdata[i].addExp = 0
        ccdata[i].oldLev = 0
        ccdata[i].itemlist = data.checkpointItems[i].items
    end


	local layer = AlertManager:addLayerByFile("lua.logic.chaungzhen.CrossArrayQuickPassLayer",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);
    layer:loadData(ccdata)
    
    AlertManager:show();	
end


function ChuangzhenManager:onReceiveGiveUpRushSucess( event )
	hideLoading()

	self.type = 0
	self.level = 0
	self.mapData = {}
	self.mapState = {}
	self.mapItemId = {}
	self.choiceState = {}
	self.attribute	= {}
	self.roleList	= {}
	self.buffList = {}
	TFDirector:dispatchGlobalEventWith(ChuangzhenManager.ReceiveGiveUpSuccess ,{})
end

function ChuangzhenManager:canTouchOpen( index )
	local high = math.ceil(index/self.mapData.width)
	local width = index - (high - 1) * self.mapData.width
	local tbl = {-1,1}
	for i=1,2 do
		local _high = high + tbl[i]
		if _high > 0 and _high <= self.mapData.high then
			local num = (_high - 1) * self.mapData.width + width
			if self.mapState[num] ~= ChuangzhenManager.GridStateClosed then
				return true
			end
		end
		local _width = width + tbl[i]
		if _width > 0 and _width <= self.mapData.width then
			local num = (high - 1) * self.mapData.width + _width
			if self.mapState[num] ~= ChuangzhenManager.GridStateClosed then
				return true
			end
		end
	end
	return false
end

function ChuangzhenManager:setRoundTouchOpen( index )
	local high = math.ceil(index/self.mapData.width)
	local width = index - (high - 1) * self.mapData.width
	local tbl = {-1,1}
	for i=1,2 do
		local _high = high + tbl[i]
		if _high > 0 and _high <= self.mapData.high then
			local num = (_high - 1) * self.mapData.width + width
			if self.mapState[num] == ChuangzhenManager.GridStateClosed then
				TFDirector:dispatchGlobalEventWith( ChuangzhenManager.ReceiveCloudBrush ,{num})
			end
		end
		local _width = width + tbl[i]
		if _width > 0 and _width <= self.mapData.width then
			local num = (high - 1) * self.mapData.width + _width
			if self.mapState[num] == ChuangzhenManager.GridStateClosed then
				TFDirector:dispatchGlobalEventWith( ChuangzhenManager.ReceiveCloudBrush ,{num})
			end
		end
	end
end

function ChuangzhenManager:getPositionByIndex( index )
	local x = 178
	local y = 532
	local _width = 120
	local _high = 110
	local high = math.ceil(index/self.mapData.width)
	local width = index - (high - 1) * self.mapData.width
	local _x = (width-1)*_width + x
	local _y = - (high-1)*_high + y
	return ccp(_x,_y)
end


function ChuangzhenManager:GainRushZoneInfo()
	showLoading()
    TFDirector:send(c2s.GAIN_RUSH_ZONE_INFO, {})
end

function ChuangzhenManager:GainRushCheckPoint()
	showLoading()
    TFDirector:send(c2s.GAIN_RUSH_CHECK_POINT, {})
end

function ChuangzhenManager:StartRush(zoneId)
	showLoading()
	self.startZoneid = zoneId
    TFDirector:send(c2s.START_RUSH, {zoneId})
end

function ChuangzhenManager:GiveUpRush()
	showLoading()
    TFDirector:send(c2s.GIVE_UP_RUSH, {})
end

function ChuangzhenManager:RushSweeping(zoneId)
	showLoading()
    TFDirector:send(c2s.RUSH_SWEEPING, {zoneId})
end

function ChuangzhenManager:OpenPoint( point )
	local msg = {point}
	if self.mapState[point] == ChuangzhenManager.GridStateOpen  and (self.mapItemId[point] == nil or self.mapItemId[point].type == ChuangzhenManager.ElementNone) then
		return
	end
	if self.mapState[point] == ChuangzhenManager.GridStateOpen  and self.mapItemId[point] then
		if self.mapItemId[point].type == ChuangzhenManager.ElementBoss or self.mapItemId[point].type == ChuangzhenManager.ElementGuard then
			local list = ZhengbaManager:getFightList(EnumFightStrategyType.StrategyType_CHUANGZHEN)
			for k,v in pairs(list) do
				if v ~= 0 then
					local state = self:getRoleStateById(v)--CardRoleManager:getRoleByGmid(v)
					if state > 0 then
						showLoading()
					    TFDirector:send(c2s.OPEN_POINT, msg)
					    return
					end
				end
			end
			toastMessage(localizable.CrossArray_tip_gofight)
			return
		end
	end

	showLoading()
    TFDirector:send(c2s.OPEN_POINT, msg)
end

function ChuangzhenManager:openMainLayer( isShowTip )
	local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2214)
    if teamLev < openLev then
        if isShowTip == true then
        	toastMessage(stringUtils.format(localizable.common_function_openlevel,openLev))
        end
        return
    end
    self:openCrossArrayChooseLayer( true)
end

function ChuangzhenManager:openCrossArrayChooseLayer(isSend)
	if self.type == 0 and self.maxType == 0 and isSend then
		self:GainRushZoneInfo()
		return
	end
	local layer = AlertManager:getLayerByName("lua.logic.chaungzhen.CrossArrayChooseLayer")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.chaungzhen.CrossArrayChooseLayer")
        AlertManager:show()
        return
    end
    layer:refreshUI()
end
function ChuangzhenManager:openCrossArrayMainLayer()
	local layer = AlertManager:getLayerByName("lua.logic.chaungzhen.CrossArrayMainLayer")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.chaungzhen.CrossArrayMainLayer")
        AlertManager:show()
    end
    layer:initMap()
end

function ChuangzhenManager:openCrossArrayChooseDetailLayer(type)
    local layer = AlertManager:addLayerByFile("lua.logic.chaungzhen.CrossArrayChooseDetailLayer")
    layer:setType(type)
    AlertManager:show()
end

function ChuangzhenManager:openCrossArrayOrganLayer(id)
	local organItem = CrossArrayOrganData:objectByID(id)
	if organItem == nil then
		print("cann't find organ data . id = ",id)
		return
	end
    local layer = AlertManager:addLayerByFile("lua.logic.chaungzhen.CrossArrayOrganLayer",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:setInfo(organItem.num,organItem.describe)
    AlertManager:show()
end

function ChuangzhenManager:openCrossArrayArmyVsLayer(npcId,gridIndex)
	local layer = AlertManager:addLayerByFile("lua.logic.chaungzhen.CrossArrayArmyVSLayer",AlertManager.BLOCK_AND_GRAY);
	layer:setBossData(CrossArrayNpcData:objectByID(npcId),gridIndex)
    AlertManager:show()
end

function ChuangzhenManager:getMaxNum()
	return 7
end


function ChuangzhenManager:openRoleList(gridIndex)
	local layer =  AlertManager:addLayerByFile("lua.logic.chaungzhen.CrossArrayArmyLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
 	layer.gridIndex = gridIndex
 	AlertManager:show()
end

function ChuangzhenManager:openCrossArraySuccessLayer(itemList,islast)
	local layer = AlertManager:addLayerByFile("lua.logic.chaungzhen.CrossArraySuccessLayer",AlertManager.BLOCK_AND_GRAY_CLOSE);
	layer:loadData(itemList,islast)
    AlertManager:show()
end

return ChuangzhenManager:new()