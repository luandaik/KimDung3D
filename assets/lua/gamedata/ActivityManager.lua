--[[
******活动管理*******

	-- by Stephen.tao
	-- 2011/1/14
]]


local ActivityManager = class("ActivityManager")
local ActivityConfig = require('lua.table.activity_config')


ActivityManager.TAP_Arena     = 1;
ActivityManager.TAP_Climb     = 2;
ActivityManager.TAP_EverQuest = 3;
ActivityManager.TAP_Carbon    = 4;
ActivityManager.TAP_FuMoLu    = 5;
ActivityManager.TAP_ShengNongKuang = 6;
ActivityManager.TAP_WestClimb = 7;
ActivityManager.TAP_JapanIsland = 9;
ActivityManager.TAP_HeroList  = 12;

function ActivityManager:ctor(data)
	self.list = TFArray:new()
end
--活动管理器清空
function ActivityManager:restart()
	self.list:clear()

end

function ActivityManager:initList()
	--11是武林公敌
	local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2229)
    local isActivityOpen = (WuLinEnemyManager:getActivityState() == WuLinEnemyManager.ActivityState_1)
    if teamLev >= openLev and isActivityOpen then
        local item = ActivityConfig:objectByID(11)
		if self.list:indexOf(item) ~= -1 then
	        self.list:removeObject(item)
	        self.list:pushFront(item)
	    end
    end
	--10是天阶争霸
	if CrossZhengBaManager:IsOpenActivity() == true then
		local item = ActivityConfig:objectByID(10)
		if self.list:indexOf(item) ~= -1 then
	        self.list:removeObject(item)
	        self.list:pushFront(item)
	        -- self.list:push(item)
	    end
	end
	--8是闯阵
	local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2214)
    if teamLev >= openLev then
        local item = ActivityConfig:objectByID(8)
		if self.list:indexOf(item) ~= -1 then
	        self.list:removeObject(item)
	        self.list:pushFront(item)
	    end
    end
	--7是无量噩梦
	local item = ActivityConfig:objectByID(7)
	local verLock = VersionLockData:objectByID(EnumVersionLockType.WestClimb_Lock)
    if verLock and verLock.open == 0 then
        if self.list:indexOf(item) ~= -1 then
		    self.list:removeObject(item)
		end
    else
    	if WestClimbManager:getIsOpen() then
			if self.list:indexOf(item) ~= -1 then
	            -- local newItem = clone(item)
	            self.list:removeObject(item)
	            self.list:pushFront(item)
	        end
		end
    end
    ----------------------
    local verLock = VersionLockData:objectByID(EnumVersionLockType.Chuangzhen_Lock)
	if verLock and verLock.open == 0 then
        item = ActivityConfig:objectByID(8)
        if self.list:indexOf(item) ~= -1 then
		    self.list:removeObject(item)
		end
    else
		local teamLev = MainPlayer:getLevel()
	    local openLev = FunctionOpenConfigure:getOpenLevel(2214)
	    if teamLev >= openLev then
	        item = ActivityConfig:objectByID(8)
			if self.list:indexOf(item) ~= -1 then
		        self.list:removeObject(item)
		        self.list:pushFront(item)
		    end
	    end
	end

	----------------------
    local verLock = VersionLockData:objectByID(EnumVersionLockType.Mine_Lock)
	if verLock and verLock.open == 0 then
        item = ActivityConfig:objectByID(6)
        if self.list:indexOf(item) ~= -1 then
		    self.list:removeObject(item)
		end
    end

    local japLock = MainPlayer:getServerSwitchStatue( ServerSwitchType.JapanIsland )
    if not japLock then
        item = ActivityConfig:objectByID(self.TAP_JapanIsland)
        if self.list:indexOf(item) ~= -1 then
            self.list:removeObject(item)
        end
    end
end

--按照id排序
local function sortlist( v1,v2 )
	if v1.id < v2.id then
		return true
	end
	return false
end

--按照等级增加活动至列表
function ActivityManager:AddNormalActivity()
	for v in ActivityConfig:iterator() do
		if v.level <= MainPlayer:getLevel() then
			if self.list:indexOf(v) == -1 then
				self.list:push(v)
			end
		end
	end
	self.list:sort(sortlist)
end

--获取活动列表
function ActivityManager:getlist()
	return self.list
end
--通过id获得当前所在的index
function ActivityManager:getIndexById(id)
	local data = ActivityConfig:objectByID(id)
	if data == nil then
		print("功能未开放 ，id == "..id)
		return nil
	end
	local index = 1
	for v in self.list:iterator() do
		if v.id == id then
			return index
		end
		index = index + 1
	end
	-- local index = ActivityConfig:indexOf(data)
	return 1
end

function ActivityManager:getConfigIndexById(activity)
	local index = ActivityConfig:indexOf(activity)
	return index
end

--显示某个活动界面
function ActivityManager:showLayer(index)
	local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.activity.ActivityLayer");
    layer:loadData(index)
    AlertManager:show()
end

return ActivityManager:new()