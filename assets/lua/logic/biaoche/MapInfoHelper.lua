-- client side MapInfoHelper
--[[
 * @Description: 地图helper
 ]]
-- script writer chikui
-- creation time 2017-01-09

local MapInfoHelper = class("MapInfoHelper")

MapInfoHelper.CarType_1 = 1     

MapInfoHelper.CarState_1 = 0    -- normal
MapInfoHelper.CarState_2 = 1    -- broken

MapInfoHelper.CarPart_1 = 1     -- 1:护甲
MapInfoHelper.CarPart_2 = 2     -- 2:镖旗
MapInfoHelper.CarPart_3 = 3     -- 3:轮子
MapInfoHelper.CarPart_4 = 4     -- 4:车厢

-- 

MapInfoHelper.SpeedDown = 0.01 * ConstantData:objectByID("EscortAgencyWheel").value
MapInfoHelper.CarSpeed = {10,13,16,20}

local item_mt = {} 

item_mt.__index = item_mt
function item_mt:getPart(id)
	return self.part[id]
end

function item_mt:getPartState(id)
	if self.part == nil or self.part[id] == nil then
		return 0
	end
	return self.part[id].status
end

function item_mt:isDestroyed()
	local part_4_state = self:getPartState(MapInfoHelper.CarPart_4)
	if part_4_state == 1 then
		return true
	end
	return false
end

function item_mt:isSpeedDown()
	local part_3_state = self:getPartState(MapInfoHelper.CarPart_3)
	if part_3_state == 1 then
		return true
	end
	return false
end

function item_mt:getSpeed()
	if self:isDestroyed() == true then
		return 0
	end
	local baseSpeed = MapInfoHelper.CarSpeed[self.quality]
	if self:isSpeedDown() == true then
		return baseSpeed * MapInfoHelper.SpeedDown
	end
	return baseSpeed
end

function item_mt:getScore(tempTime)
	if tempTime == nil then
		tempTime = 0
	end
	return self.score + tempTime * self:getSpeed()
end

function MapInfoHelper:ctor( data )

	--[[
	local node = {
		guildId = 0,
		score = 0,
		part = {
			{
				type = 
				status = 0,
				defensePlayer = {
					{
						int32 playerId = 1;//玩家id
						string playerName = 2;//玩家名称
						string guildName = 3;//帮会名称
						int32 serverName = 4;//服务器名称
						int32 power = 5;		//战力
						string formationBlood = 6;	//侠客id_当前血量_最大血量;侠客id_当前血量_最大血量
					}
				}
				attackPlayer = {}
				diePlayer = {}
			},
			...
		},
		quality = 1,

	}
	]]--
	self:restart()
end

function MapInfoHelper:restart()
	self.m_node_list = {}
	self.nLastBrushTime = 0
	self.nBrushTime = 20
	self.baseSpeed = 1
	self:setMyInfoNode(nil)
end

function MapInfoHelper:test()
	local testlst = {
		{
			guildId = 111,
			score = 0,
			quality = 1
		},
		{
			guildId =  FactionManager:getPersonalInfo().guildId,
			score = 0,
			quality = 2,
			partInfo = {
				--{type = 4,status = 1},
			}
		},
		{
			guildId = 112,
			score = 0,
			quality = 3
		}
	}
	for i,v in ipairs(testlst) do
		self:pushInfoNodeByData(v)
	end
end

function MapInfoHelper:setMyInfoNode( node )
	self.myInfoNode = node
end

function MapInfoHelper:getMyInfoNode()
	return self.myInfoNode or {}
end

function MapInfoHelper:pushInfoNode( node )
	self.m_node_list[node.guildId] = node
	node.__index = item_mt
	setmetatable(node, item_mt)
end

function MapInfoHelper:pushInfoNodeByData( data )
	local infoNode = {}
	infoNode.guildId = data.guildId
	infoNode.score = data.score
	infoNode.quality = data.quality
	infoNode.part = {}
	local partInfoList = data.partInfo or {}
	for k,v in pairs(partInfoList) do
		if v.type then
			infoNode.part[v.type] = v
		end
	end
	self:pushInfoNode(infoNode)
	local myGuildId = FactionManager:getPersonalInfo().guildId
	if infoNode.guildId == myGuildId then
		self:setMyInfoNode(infoNode)
	end
end

function MapInfoHelper:popInfoNode( guildId )
	self.m_node_list[guildId] = nil
end

function MapInfoHelper:clearInfoNode()
	self.m_node_list = {}
	self.myInfoNode = nil
end

function MapInfoHelper:getInfoNodeList()
	return self.m_node_list or {}
end

function MapInfoHelper:getInfoNode( guildId )
	return self.m_node_list[guildId]
end

function MapInfoHelper:getInfoNodeSpeed( guildId )
	local infoNode = self.m_node_list[guildId]
	if infoNode == nil then
		return -1
	end
	return infoNode:getSpeed()
end

function MapInfoHelper:setUpdateTime( time )
	self.nLastBrushTime = time
end

function MapInfoHelper:getLastUpdateTime()
	return self.nLastBrushTime
end

function MapInfoHelper:updateTempTime()
	local curTime = MainPlayer:getNowtime()
	self.tempTime = curTime - self.nLastBrushTime
	if self.tempTime > self.nBrushTime then
		self.tempTime = self.nBrushTime
	end
	return self.tempTime
end

function MapInfoHelper:getTempTime()
	return self.tempTime
end

return MapInfoHelper