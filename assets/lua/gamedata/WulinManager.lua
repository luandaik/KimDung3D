--[[
******活动管理*******

	-- by Stephen.tao
	-- 2011/1/14
]]


local WulinManager = class("WulinManager")
local WulinConfig = require('lua.table.wulin_config')

function WulinManager:ctor(data)
	self.list = TFArray:new()
end
--活动管理器清空
function WulinManager:restart()
	self.list:clear()
end
--按照id排序
local function sortlist( v1,v2 )
	if v1.id < v2.id then
		return true
	end
	return false
end

--按照等级增加活动至列表
function WulinManager:AddNormalActivity()
	self.list:clear()
	for v in WulinConfig:iterator() do
		if self:getActivityLocked(v) == false and v.level <= MainPlayer:getLevel() then
			local state = true
			if (v.serverSwitch and v.serverSwitch ~= 0) then
				state = MainPlayer:getServerSwitchStatue(v.serverSwitch)
			end
			if (state == true and self.list:indexOf(v) == -1) then
				self.list:push(v)
			end
		end
	end
	self.list:sort(sortlist)
end

function WulinManager:getActivityLocked(v)
	local locklist = {
		[1] = EnumVersionLockType.Zhengba_Lock,
		[2] = EnumVersionLockType.FactionFight_Lock,
		[3] = EnumVersionLockType.MultiServerFight_Lock,
		[4] = EnumVersionLockType.CrossFight_Lock,
		[5] = EnumVersionLockType.Peak_Lock
	}
	local lockId = locklist[v.id]
	if lockId then
		local verLock = VersionLockData:objectByID(lockId)
	    if verLock and verLock.open == 0 then
	        return true
	    end
	end
	return false
end

--获取活动列表
function WulinManager:getlist()
	return self.list
end
--通过id获得当前所在的index
function WulinManager:getIndexById(id)
	local data = WulinConfig:objectByID(id)
	if data == nil then
		print("功能未开放 ，id == "..id)
		return nil
	end
	local index = WulinConfig:indexOf(data)
	return index
end


WulinManager.TAP_ZhengBaSai     = 1;
WulinManager.TAP_Peak     		= 5;
WulinManager.TAP_Hero     		= 8;
--显示某个活动界面
function WulinManager:showLayer(index)
	local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.activity.WulinLayer");
    layer:loadData(index)
    AlertManager:show()
end

return WulinManager:new()