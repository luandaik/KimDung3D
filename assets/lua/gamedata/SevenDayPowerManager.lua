-- client side SevenDayPowerManager.lua
--[[
 * @Description: 七天战力活动
 ]]
-- script writer Stephen.tao
-- creation time 2016-06-14



local SevenDayPowerManager = class("SevenDayPowerManager")


local sevenDaysPowerConfig = require("lua.table.t_s_power_activity")

SevenDayPowerManager.PowerRewardReponseNotice = "SevenDayPowerManager.PowerRewardReponseNotice"
function SevenDayPowerManager:ctor()
    self:initList()

    TFDirector:addProto(s2c.RECEIVE_POWER_REWARD_REPONSE, self,    self.onReceivePowerRewardReponse)
    TFDirector:addProto(s2c.UPDATE_POWER_REPONSE, self,    self.onReceiveUpdatePowerReponse)
    TFDirector:addProto(s2c.COMPLETED_ACTIVITY, self,    self.onReceiveCompletedActivity)


	self.openDay = 7--ConstantData:objectByID("CrossGuildBattleManager.ActivityState_2").value
	self.getDay = 3--ConstantData:objectByID("CrossGuildBattleManager.ActivityState_2").value
	self.redPoint = false
    self.curPower = 0
    self.getRewardRecord = {}
end

function SevenDayPowerManager:restart()
    self.curPower = 0
    self.getRewardRecord = {}

	self.redPoint = false
	self.temp_activityId = nil
    self:stopSevenDaysTimer()
end

function SevenDayPowerManager:receivePowerRewardRequest( activityId )
	showLoading()
	self.temp_activityId = activityId
	TFDirector:send(c2s.RECEIVE_POWER_REWARD_REQUEST,{activityId})
end

function SevenDayPowerManager:onReceivePowerRewardReponse(event)
	hideLoading()
	if self.temp_activityId and event.data.result == 0 then
		self.getRewardRecord[self.temp_activityId] = true
		self.temp_activityId = nil
		if not self.redPoint then
			self:freshRedPoint()
		end
	end
	TFDirector:dispatchGlobalEventWith(self.PowerRewardReponseNotice ,{})
end
function SevenDayPowerManager:onReceiveUpdatePowerReponse(event)
	self.curPower = event.data.power
	if not self.redPoint then
		self:freshRedPoint()
	end
end

function SevenDayPowerManager:getRedPoint()
	return self.redPoint or false
end

function SevenDayPowerManager:freshRedPoint()
	for v in self.rewardList:iterator() do
		if v.power <= self.curPower and not self.getRewardRecord[v.id] then
			self.redPoint = true
			CommonManager:setRedPointStateByKey( "sevenDayPower", true )
			return
		end
	end
	local unlock = true
	local hasClick = false
	for v in self.specialRewardList:iterator() do
		if v.power > self.curPower or self.getRewardRecord[v.id] then
			unlock = false
		end
		if v.power <= self.curPower and not self.getRewardRecord[v.id]  then
			hasClick = true
		end
	end
	self.redPoint = hasClick and unlock
	CommonManager:setRedPointStateByKey( "sevenDayPower", self.redPoint )
end
function SevenDayPowerManager:onReceiveCompletedActivity(event)
	local data = event.data
	if data.activityId then
		for i=1,#data.activityId do
			self.getRewardRecord[data.activityId[i]] = true
		end
	end
end

function SevenDayPowerManager:initList()
	self.rewardList = self.rewardList or TFArray:new()
	self.specialRewardList = self.specialRewardList or TFArray:new()
	self.rewardList:clear()
	self.specialRewardList:clear()
	for v in sevenDaysPowerConfig:iterator() do
		if v.type == 5050 then
			self.specialRewardList:pushBack(v)
		else
			self.rewardList:pushBack(v)
		end
	end
end

function SevenDayPowerManager:reSortReward()
	local function cmp(reward1,reward2)
		local isget1 = self.getRewardRecord[reward1.id] or false
		local isget2 = self.getRewardRecord[reward2.id] or false
		if not isget1 and isget2 then
			return true
		elseif isget1 == isget2 then
			if reward1.id < reward2.id then
				return true
			end
		end
		return false
	end
	self.rewardList:sort(cmp)
end

function SevenDayPowerManager:openSevenDaysPowerLayer()
	AlertManager:addLayerByFile("lua.logic.sevendays.SevenDaysPowerLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_0);
    AlertManager:show();
end


-- 七天之内是开启的 0 关闭 ； 1 七天内 ； 2 过了七天 3天内
function SevenDayPowerManager:sevenDaysOpenSatus()
    -- local RegisterTime = MainPlayer:getRegisterTime()
    if self.curPower == 0 then
        return 0
    end
    local RegisterTime = MainPlayer:getRegisterTime()
    local nowTime      = MainPlayer:getNowtime()

    local secInOneDay  = 24 * 3600

    if RegisterTime == nil then
        return 0
    end

    if nowTime > (RegisterTime + (self.openDay  + self.getDay) * secInOneDay) then
        return 0
    end

    if nowTime <= (RegisterTime + self.openDay  * secInOneDay) then
        return 1
    end

    return 2
end


-- 设置在线奖励回调
function SevenDayPowerManager:addSevenDaysEvent(logic, id, callback)

    local status = self:sevenDaysOpenSatus()

    -- 判断在线奖励是否过期
    if status == 0 then
        print("过期")
        self:stopSevenDaysTimer()
        return
    end

    if self.SevenDaysTimerEvents == nil then
        self.SevenDaysTimerEvents = TFMapArray:new()
        self.SevenDaysTimerEvents:clear()
    end

    if  self.SevenDaysTimer == nil then
        
        self.SevenDaysTimer = TFDirector:addTimer(1000, -1, nil, 
            function() 
                self:updateSevenDaysTimer()
            end)
    end

    local obj = self.SevenDaysTimerEvents:objectByID(id)
    
    if obj then
        obj.handler             = callback
        obj.logic               = logic
        -- self.SevenDaysTimerEvents:push(obj)
        print("---- 1 addSevenDaysEvent add = ".."id = "..id)
    else
        local timer = {}

        timer.id                = id
        timer.logic             = logic
        timer.handler           = callback
        self.SevenDaysTimerEvents:push(timer)
        print("---- 2 addSevenDaysEvent modify = ".."id = "..id)
    end
end

-- 停止在线奖励定时器
function SevenDayPowerManager:removeOnlineRewardTimer(id)
    if self.SevenDaysTimerEvents == nil then
        return
    end

    local obj = self.SevenDaysTimerEvents:objectByID(id)
    if obj then
        self.SevenDaysTimerEvents:removeInMapList(obj)
    end

    if self.SevenDaysTimerEvents:length() <= 0 and self.SevenDaysTimer then
        self:stopSevenDaysTimer()
    end
end

function SevenDayPowerManager:stopSevenDaysTimer()
    if self.SevenDaysTimer then
        TFDirector:removeTimer(self.SevenDaysTimer)
        self.SevenDaysTimer = nil
    end

    -- 清空倒计时奖励
    if self.SevenDaysTimerEvents then
        self.SevenDaysTimerEvents:clear()
    end
end

function SevenDayPowerManager:updateSevenDaysTimer()

    local status = self:sevenDaysOpenSatus()

    -- 判断在线奖励是否过期
    if status == 0 then
        self:stopSevenDaysTimer()
        return
    end

    -- local RegisterTime = MainPlayer:getRegisterTime()
    local RegisterTime = MainPlayer:getRegisterTime()
    local nowTime      = MainPlayer:getNowtime()

    if status == 1 then
        RegisterTime = RegisterTime + 3600 * 24 * self.openDay
    else
        RegisterTime = RegisterTime + 3600 * 24 * (self.openDay + self.getDay)
    end

    local timeCount = RegisterTime - nowTime

    local secInOneDay  = 24 * 3600

    local day = math.floor(timeCount/secInOneDay)

    local sec   = timeCount - secInOneDay * day
    local time1 = math.floor(sec/3600)
    local time2 = math.floor((sec-time1 * 3600)/60)
    local time3 = math.fmod(sec, 60)

    -- local timedesc1 = string.format("%02d天%02d小时%02d分%02d秒", day, time1, time2, time3)
    day = string.format("%02d", day)
    time1 = string.format("%02d", time1)
    time2 = string.format("%02d", time2)
    time3 = string.format("%02d", time3)
    local timedesc1 = stringUtils.format(localizable.common_time_5, day, time1, time2, time3)

    sec   = timeCount
    time1 = math.floor(sec/3600)
    time2 = math.floor((sec-time1 * 3600)/60)
    time3 = math.fmod(sec, 60)
    local timedesc2 = string.format("%02d:%02d:%02d", time1, time2, time3)

    for v in self.SevenDaysTimerEvents:iterator() do
        v.status    = status
        v.desc1     = timedesc1
        v.desc2     = timedesc2

        if v.handler then
            v.handler(v)
        end
    end
end
return SevenDayPowerManager:new()