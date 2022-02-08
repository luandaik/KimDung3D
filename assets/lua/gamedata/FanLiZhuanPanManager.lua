--[[
******返利转盘活动管理类*******

	-- by shenjingjie
	-- 2017-11-10 
]]
local FanLiZhuanPanManager	= class("FanLiZhuanPanManager")

FanLiZhuanPanManager.UpdateRedPoint = "FanLiZhuanPanManager.UpdateRedPoint"
FanLiZhuanPanManager.RebateTurntableRecord = "FanLiZhuanPanManager.RebateTurntableRecord"

function FanLiZhuanPanManager:ctor(data)
	--推送返利抽奖数据 0x7d01
	TFDirector:addProto(s2c.GET_REBATE_TURNTABLE_RECORD_RESPONSE, self, self.onReceiveRebateTurntableInfo)
	--获取返利抽奖界面数据 0x7d02
	TFDirector:addProto(s2c.GET_REBATE_TURNTABLE_RESPONSE, self, self.onReceiveMainLayerInfo)
	--转盘抽奖 0x7d03
	TFDirector:addProto(s2c.REBATE_TURNTABLE_RESPONSE, self, self.onReceiveRewardInfo)
	--转盘免费次数
	TFDirector:addProto(s2c.UPDATE_REBATE_TURNTABLE, self, self.onReceiveCurrTime)
end


function FanLiZhuanPanManager:restart()
	print("-------FanLiZhuanPanManager:restart---------")
	self.lastTimeData = nil
	self.RecordInfo = {}
	self.RewardPoolData = {}
	self.startTime = 0
	self.endTime = 0
	self.desType = 0
	self.curTime = 0    -- 剩余抽奖次数
	self.desSycee = 0 		-- 单次抽奖所需元宝
	self.needSycee = 0 	-- 目标所需元宝
end

--------------发送请求协议-----------------
--请求抽奖奖励
function FanLiZhuanPanManager:requireZhuanPanReward()
	--c2s.REBATE_TURNTABLE_REQUEST = 0x7d03
	TFDirector:send(c2s.REBATE_TURNTABLE_REQUEST, {})
	showLoading();
end

--请求获取界面数据
function FanLiZhuanPanManager:requireZhuanPanInfo()
	-- c2s.GET_REBATE_TURNTABLE_REQUEST = 0x7d02
	TFDirector:send(c2s.GET_REBATE_TURNTABLE_REQUEST, {})
	showLoading();
end

-- --请求记录
-- function FanLiZhuanPanManager:requireZhuanPanRecord()
-- 	-- c2s.GET_REBATE_TURNTABLE_RECORD_REQUEST = 0x7d01
-- 	TFDirector:send(c2s.GET_REBATE_TURNTABLE_RECORD_REQUEST, {})
-- 	showLoading();
-- end

------------------------收到协议返回-----------------
--推送返利抽奖数据
function FanLiZhuanPanManager:onReceiveRebateTurntableInfo( event )
	--s2c.GET_REBATE_TURNTABLE_RECORD_RESPONSE = 0x7d01
	print("s2c.GET_REBATE_TURNTABLE_RECORD_RESPONSE = 0x7d01",event.data)
	-- hideLoading();
	if (event.data.records and #event.data.records > 0) then
		if (event.data.cover) then
			self:setRecordDataByServer(event.data.records)
		else
			self:setRecordDataBySelf(event.data.records[1])
		end
	end
	-- self:openZhuanPanRecodeLayer()
end

--获取返利抽奖界面数据
function FanLiZhuanPanManager:onReceiveMainLayerInfo( event )
	--s2c.GET_REBATE_TURNTABLE_RESPONSE = 0x7d02
	hideLoading();
	local data = event.data
	if (event.data.items and #data.items > 0) then
		self:setRewardPoolData(data.items)
	end
	self.desType = data.type
	self.desSycee = data.value
	self.needSycee = self.desSycee - (data.sycee % self.desSycee)
	self:openZhuanPanMainLayer()
	
end

--转盘抽奖
function FanLiZhuanPanManager:onReceiveRewardInfo( event )
	--s2c.REBATE_TURNTABLE_RESPONSE = 0x7d03
	print("onReceiveRewardInfo",event.data)
	hideLoading();
	-- self:setRecordDataBySelf(event.data)
	if (self.curTime > 0) then
		self.curTime = self.curTime - 1
		if (self.curTime == 0) then
			TFDirector:dispatchGlobalEventWith(self.UpdateRedPoint, {})
		end
	end
	
	TFDirector:dispatchGlobalEventWith(self.RebateTurntableRecord, event.data)
	
end

--转盘抽奖
function FanLiZhuanPanManager:onReceiveCurrTime( event )
	--s2c.UPDATE_REBATE_TURNTABLE = 0x7d04
	self.curTime = event.data.number
	if (self.curTime == 1) then
		TFDirector:dispatchGlobalEventWith(self.UpdateRedPoint, {})
	end
	
end
--------------------------存储信息-------------------
--从服务器获取的转盘记录,只在登录时由服务器推送一次
function FanLiZhuanPanManager:setRecordDataByServer(event)
	--
	-- hideLoading();
	self.RecordInfo	= {}
	local info = event
	if (info and info[1].itemId ~= nil) then
		table.sort(info,function(a,b)	return a.gainTime>b.gainTime end)
		self.lastTimeData = GetCorrectDate("*t", info[1].gainTime * 0.001)
		local timeStr = self.lastTimeData.year..'-'..self.lastTimeData.month..'-'..self.lastTimeData.day
		self.RecordInfo[1] = {spilt = true,time = timeStr}
		for i = 1, #info , 1 do 
			info[i].gainTime = math.floor(info[i].gainTime * 0.001)
			local timeData = GetCorrectDate("*t",info[i].gainTime)
			if (timeData.yday ~= self.lastTimeData.yday or timeData.year ~= self.lastTimeData.year) then
				local timeStr = timeData.year..'-'..timeData.month..'-'..timeData.day
				self.lastTimeData = timeData
				table.insert(self.RecordInfo,{spilt = true,time = timeStr})
			end
			table.insert(self.RecordInfo,info[i])
		end
	end
end

--单条记录存储
function FanLiZhuanPanManager:setRecordDataBySelf(data)

	if (data ~= nil) then
		local timeData = GetCorrectDate("*t",MainPlayer:getNowtime())
		-- local info = self.RewardPoolData[data.index]
		-- info.gainTime = MainPlayer:getNowtime()
		-- print("记录时间",timeData,MainPlayer:getNowtime())
		if (self.RecordInfo == nil or #self.RecordInfo <= 0) then
			self.RecordInfo	= {}
			self.lastTimeData = timeData
			local timeStr = self.lastTimeData.year..'-'..self.lastTimeData.month..'-'..self.lastTimeData.day
			self.RecordInfo[1] = {spilt = true,time = timeStr}
		end
		data.gainTime = math.floor(data.gainTime * 0.001)
		if (timeData.yday ~= self.lastTimeData.yday or timeData.year ~= self.lastTimeData.year) then
			local timeStr = timeData.year..'-'..timeData.month..'-'..timeData.day
			self.lastTimeData = timeData
			table.insert(self.RecordInfo, 1, {spilt = true,time = timeStr})
		end

		--因为第一条永远都是时间,内容都加在第二条
		table.insert(self.RecordInfo, 2, data)
	end

end

--奖励池数据
function FanLiZhuanPanManager:setRewardPoolData( data )

	self.RewardPoolData = {}
	if (data and #data > 0) then
		for _, reward in pairs(data) do
			local rewardInfo = {}
			rewardInfo.itemId = reward.itemId
			rewardInfo.type = EnumDropType.GOODS
			rewardInfo.index = reward.index
			rewardInfo.kind = reward.kind
			rewardInfo.number = reward.number
			self.RewardPoolData[rewardInfo.index] = rewardInfo
		end
	
	end
end

------------------------获取信息---------------------
--返回转盘获奖记录
function FanLiZhuanPanManager:getRecord()
	return self.RecordInfo
end
--返回奖励池数据
function FanLiZhuanPanManager:getRewardPoolData()
	return self.RewardPoolData
end
--返回目标类型:消费or充值
function FanLiZhuanPanManager:getDesType()
	return self.desType
end
--返回目标金额
function FanLiZhuanPanManager:getDesCost()
	return self.desSycee
end
--返回还需要多少金额
function FanLiZhuanPanManager:getNeedCost()
	return self.needSycee
end
--返回剩余抽奖次数
function FanLiZhuanPanManager:getCurTime()
	return self.curTime
end
--返回活动结束时间
function FanLiZhuanPanManager:getEndTime()
	return self.endTime
end

--打开抽奖界面
function FanLiZhuanPanManager:openZhuanPanMainLayer()
	AlertManager:addLayerByFile("lua.logic.gameactivity.Activity_FanLiZhuanPan",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
	AlertManager:show()
end

--打开历史记录界面
function FanLiZhuanPanManager:openZhuanPanRecodeLayer()
	AlertManager:addLayerByFile("lua.logic.gameactivity.Activity_FanLiZhuanPanRecode",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
	AlertManager:show()
end

--是否在游戏住界面显示
function FanLiZhuanPanManager:isShowInMenuLayer()
	local nowTime = MainPlayer:getNowtime()
	local isOpen = MainPlayer:getServerSwitchStatue(ServerSwitchType.FanLiZhuanPan)

	local actStatue = OperationActivitiesManager:getActivityInfoByType(OperationActivitiesManager.Type_FanLiZhuanPan)
	if (actStatue) then
		self.startTime = actStatue.beginTime
		self.endTime = actStatue.endTime
	end

	if (actStatue and self.startTime <= nowTime and nowTime <= self.endTime and isOpen == true) then
		return true
	end
	return false
end

--是否显示红点
function FanLiZhuanPanManager:isRedPoint()
	if (self.curTime and self.curTime > 0) then
		return true
	end
	return false
end
return FanLiZhuanPanManager:new() 