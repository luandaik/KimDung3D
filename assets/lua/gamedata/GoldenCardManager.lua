--[[
******至尊金卡管理类*******

	-- by shenjingjie
	-- 2017-12-14
]]


local GoldenCardManager = class("GoldenCardManager")

GoldenCardManager.activityType = {
	Type_VIP 	= 1,        -- 1.VIP等级相关
	Type_Team 	= 2, 		-- 2.团队等级相关
	Type_QHP 	= 3,		-- 3.群豪谱排名相关
}

GoldenCardManager.RefreshLayer = "GoldenCardManager.RefreshLayer"

function GoldenCardManager:ctor()
	-- s2c.GOLDEN_CARD_INFO = 0x7c01 玩家金卡信息
	TFDirector:addProto(s2c.GOLDEN_CARD_INFO, self, self.onReceiveCardInfo);
	-- s2c.RESPONSE_GOLDEN_REWARD = 0x7c03 当次活动配置
	TFDirector:addProto(s2c.RESPONSE_GOLDEN_REWARD, self, self.onReceiveCardReward);

	self.GoldenCardInfo = nil
end

----------------------------协议相关---------------------------------
function GoldenCardManager:onReceiveCardInfo( event )
	-- s2c.GOLDEN_CARD_INFO = 0x7c01 玩家金卡信息
	hideLoading()
	print("s2c.GOLDEN_CARD_INFO = 0x7c01 玩家金卡信息",event.data)
	if(event.data == nil) then
		return
	end
	local data = event.data.info
	self.GoldenCardInfo = {}
	self.GoldenCardInfo.commodityId = data.id
	-- self.GoldenCardInfo.desType = data.type
	self.GoldenCardInfo.endTime = data.endTime or 0
	self.GoldenCardInfo.lastTime = data.lastGotRewardTime or 0
	self.GoldenCardInfo.rewardInfo = data.rewardInfo
	for i=1, #data.rewardInfo do 
		self.GoldenCardInfo.rewardInfo[i].radio = data.rewardInfo[i].radio / 10000
	end
	-- 
	self:isRedPoint()
	TFDirector:dispatchGlobalEventWith(self.RefreshLayer,{})
end
function GoldenCardManager:onReceiveCardReward( event )
	-- s2c.RESPONSE_GOLDEN_REWARD = 0x7c03 当次活动配置
	hideLoading()
	print("s2c.RESPONSE_GOLDEN_REWARD = 0x7c03 当次活动配置",event.data)
	if(event.data == nil) then
		return
	end
	local data = event.data
	self.GoldenCardInfo = {}
	self.GoldenCardInfo.commodityId = data.id
	-- self.GoldenCardInfo.desType = data.type
	self.GoldenCardInfo.rewardInfo = data.rewardInfo or {}
	for i=1, #data.rewardInfo do 
		self.GoldenCardInfo.rewardInfo[i].radio = data.rewardInfo[i].radio / 10000
	end

end
-- 请求玩家金卡信息
-- function GoldenCardManager:requestGoldenCardInfo()
-- 	-- c2s.QUERY_GOLDEN_CARD = 0x7c01
-- 	showLoading()
--     TFDirector:send(c2s.REQUEST_RESET_WAIT_TIME,{})
-- end
-- 领取金卡每日奖励
function GoldenCardManager:requestGoldenCardReward()
	-- c2s.GET_GOLDEN_CARD_DAILY_REWARD = 0x7c02
	showLoading()
    TFDirector:send(c2s.GET_GOLDEN_CARD_DAILY_REWARD,{})
end


function GoldenCardManager:restart()

end
-------------------------------------------------------------------
--获取金卡信息
function GoldenCardManager:getGoldenCardInfo()
	return self.GoldenCardInfo
end

--打开主界面
function GoldenCardManager:openMainLayer()
    AlertManager:addLayerByFile("lua.logic.gameactivity.GoldenCardLayer");
    AlertManager:show();

end

--是否显示图标
function GoldenCardManager:isShowGoldenCard()
	local activity = OperationActivitiesManager:getActivityInfoByType(OperationActivitiesManager.Type_GoldenCard)
	local nowTime = MainPlayer:getNowtime()
	if (activity == nil) then
		-- 判断领取时间
		if (self.GoldenCardInfo and self.GoldenCardInfo.endTime) then
			local goldenCardEndTime = self.GoldenCardInfo.endTime * 0.001
			if (goldenCardEndTime > nowTime) then
				return true
			end
		end
	else
		local activityEndTime = activity.endTime	
		-- 判断活动时间
		if (activityEndTime) then
			activityEndTime = activityEndTime
			if (activityEndTime > nowTime) then

				return true
			end
		end
	end
	return false
end

--是否显示红点
function GoldenCardManager:isRedPoint()
	if (self.GoldenCardInfo and self.GoldenCardInfo.lastTime) then
		local nowTime = os.date("*t",MainPlayer:getNowtime())
		local lastTime = os.date("*t",self.GoldenCardInfo.lastTime * 0.001)
		if (lastTime.yday ~= nowTime.yday) then
			return true
		end
	end
	local currTime = MainPlayer:getNowtime()
	if CommonManager:checkRedPointByKey("goldenCard",currTime) then
		CommonManager:setRedPointStateByKey( "goldenCard", false )
	end
	return false
end

--显示规则
function GoldenCardManager:showRuleLayer()
    CommonManager:showRuleLyaer( 'mastercard' )
end

return GoldenCardManager:new()