-- 运营活动
-- Author: king
-- Date: 2015-11-15
--

local GameActivitiesManager = class('GameActivitiesManager')


GameActivitiesManager.MSG_SYCEE_EXPEND 	  			= "GameActivitiesManager.MSG_SYCEE_EXPEND"	-- 元宝消耗
GameActivitiesManager.MSG_SYCEE_SUPPLY 	  			= "GameActivitiesManager.MSG_SYCEE_SUPPLY"	-- 元宝充值
GameActivitiesManager.MSG_ACTIVITY_UPDATE 	  		= "GameActivitiesManager.MSG_ACTIVITY_UPDATE"	-- 
GameActivitiesManager.MSG_ACTIVITY_PROGRESS_UPDATE 	= "GameActivitiesManager.MSG_ACTIVITY_PROGRESS_UPDATE"	-- 
GameActivitiesManager.MSG_ACTIVITY_GET_REWARD 		= "GameActivitiesManager.MSG_ACTIVITY_GET_REWARD"	-- 
GameActivitiesManager.MSG_ACTIVITY_FUND_DATA_UPDATE 		= "GameActivitiesManager.MSG_ACTIVITY_FUND_DATA_UPDATE"	-- 
GameActivitiesManager.MSG_LIMIT_HOT_UPDATE = "GameActivitiesManager.MSG_LIMIT_HOT_UPDATE"	-- 
GameActivitiesManager.MSG_FULL_CUT_UPDATE = "GameActivitiesManager.MSG_FULL_CUT_UPDATE"	-- 
GameActivitiesManager.MSG_GROUP_ON_UPDATE = "GameActivitiesManager.MSG_GROUP_ON_UPDATE"	-- 
GameActivitiesManager.UPDATERERECHARGECONSUME		= "GameActivitiesManager.UPDATERERECHARGECONSUME" -- 刷新充值消费活动保底奖励领取状态
GameActivitiesManager.SAVE_MYTRAIN_SCENE 	= "GameActivitiesManager.SAVE_MYTRAIN_SCENE"	-- 
-- <option value="1">登录</option>
-- <option value="2">连续登录</option>
-- <option value="3">在线奖励</option>
-- <option value="4">VIP等级</option>
-- <option value="5">团队等级</option>
-- <option value="6">累计充值金额</option>
-- <option value="7">单笔充值金额</option>
-- <option value="8">累计消耗</option>
-- <option value="9">银钩赌坊</option>
-- <option value="10">兑换</option>
-- <option value="11">十连抽</option>
-- <option value="12">充值普天同庆抢红包</option>
-- <option value="13">充值返红包</option>
GameActivitiesManager.Type_Normal_Login 		= 1
GameActivitiesManager.Type_Continue_Login 		= 2
GameActivitiesManager.Type_Online 				= 3
GameActivitiesManager.Type_VIP 					= 4
GameActivitiesManager.Type_Team_Level 			= 5
GameActivitiesManager.Type_Total_Recharge 		= 6
GameActivitiesManager.Type_Single_Recharge 		= 7
GameActivitiesManager.Type_Total_Consume 		= 8
GameActivitiesManager.Type_Casino 				= 9
GameActivitiesManager.Type_Exchange 	    	= 10
GameActivitiesManager.Type_Ten_Card 	    	= 11
GameActivitiesManager.Type_More_RedBag 			= 12
GameActivitiesManager.Type_Pay_Back_RedBag  	= 13
GameActivitiesManager.Type_Score_Exchange   	= 14  --十连抽送积分
GameActivitiesManager.Type_Hit_Egg  			= 15  --砸蛋活动
GameActivitiesManager.Type_Score_Egg   			= 16  --砸蛋积分
GameActivitiesManager.Type_Money_Shop   		= 17  --钱庄， 立明说的用MoneyShop命名
GameActivitiesManager.Type_Continue_Recharge 	= 18  --连续充值，以天为单位
GameActivitiesManager.Type_Shop_Employ 			= 19  --酒馆招募活动，每个条目分为三个类型 (1普通 2高级 3十连抽)
GameActivitiesManager.Type_Active_XunBao 		= 20  --寻宝活动
GameActivitiesManager.Type_Score_XunBao 		= 21  --寻宝积分
GameActivitiesManager.Type_Total_YuanBao 		= 22  --充值元宝活动
GameActivitiesManager.Type_Ten_Orange	 		= 23  --十连抽出橙卡整卡
GameActivitiesManager.Type_JiangHuSheLi 		= 24  --江湖射利
GameActivitiesManager.Type_LongMenPo 			= 25  --龙门破活动
GameActivitiesManager.Type_jianghumoney 		= 26  --江湖基金
GameActivitiesManager.Type_New_Continue_Recharge 		= 27  --新连续充值，以天为单位
GameActivitiesManager.Type_Day_Recharge 		= 28  --每日首次额外
GameActivitiesManager.Type_Tian_Ji_Lun 		= 29  --天机轮
GameActivitiesManager.Type_Tian_Ji_Lun_SCORE 	= 30  --天机轮jifen
GameActivitiesManager.Type_Continue_Server_Login 	= 31
GameActivitiesManager.Type_Continue_Collect_Role 	= 32


GameActivitiesManager.Type_Sevenday_Rank = 35
GameActivitiesManager.Type_Limit_Shop 			= 36  --限时抢购
GameActivitiesManager.Type_Full_Cut 			= 37  --满减返现
GameActivitiesManager.Type_Group_On 			= 38  --团购


GameActivitiesManager.Type_Xia_Ke_Xing 			= 39  --侠客行(木人桩)活动
GameActivitiesManager.Type_Xia_Ke_Xing_SCORE 	= 40  --侠客行(木人桩)积分
GameActivitiesManager.Type_GoldenCard			= 50  --至尊金卡
GameActivitiesManager.Type_NianShou				= 51  --年兽
GameActivitiesManager.Type_DaNianShou			= 52  --打年兽
GameActivitiesManager.Type_JiangHuJuHui			= 54  --江湖聚惠
GameActivitiesManager.Type_ChongzhiRank			= 55  --充值排行
GameActivitiesManager.Type_XiaofeiRank			= 56  --消费排行

GameActivitiesManager.Type_VIP_GIFT 			= 100  --团购
GameActivitiesManager.Type_FanLiZhuanPan 		= 101  --返利转盘
GameActivitiesManager.Type_LangHuan				= 103  --琅嬛福地

function GameActivitiesManager:ctor()
    -- 更新活动列表
    TFDirector:addProto(s2c.ACTIVITY_INFO_LIST, self, self.updateActivityListEvent)

    -- 更新单个的活动
    TFDirector:addProto(s2c.ACTIVITY_INFO, self, self.updateSingleActivityEvent)

    -- 更新活动状态
    TFDirector:addProto(s2c.ACTIVITY_PROGRESS_LIST, self, self.updateActivityListProgressEvent)

    -- 更新单个活动状态
    TFDirector:addProto(s2c.ACTIVITY_PROGRESS, self, self.updateSingleActivityProgressEvent)

    -- 参加／兑换活动结果回调
    TFDirector:addProto(s2c.GOT_ACTIVITY_REWARD_RESULT, self, self.recvActivityRewardResultEvent)

    --成长基金
    TFDirector:addProto(s2c.FUND_DATA, self, self.fundDataEvent)
    --购买成长基金
    TFDirector:addProto(s2c.BUY_FUND_RESPONSE, self, self.buyFundDataEvent)
    --领取成长基金
    TFDirector:addProto(s2c.REWARD_FUND_RESPONSE, self, self.rewardFundDataEvent)

    --限时抢购信息
    TFDirector:addProto(s2c.LIMIT_HOT_INFO_RESPONSE, self, self.limitHotInfoResponseEvent)
    --限时抢购信息更新
    TFDirector:addProto(s2c.LIMIT_HOT_BUY_REPONSE, self, self.limitHotInfoBuyUpdateEvent)
    --满减返现信息
    TFDirector:addProto(s2c.BUY_BACK_INFO_RESPONSE, self, self.fullCutInfoEvent)
    --满减返现购买成功
    TFDirector:addProto(s2c.BUY_BACK_BUY_REPONSE, self, self.fullCutBuyEvent)
    --团购信息
    TFDirector:addProto(s2c.GROUPON_INFO_REPONSE, self, self.grouponInfoEvent)
    --团购购买成功
    TFDirector:addProto(s2c.GROUPON_BUY_REPONSE, self, self.grouponBuyEvent)
    --团购购买成功
    TFDirector:addProto(s2c.GROUPON_SETTLE_REPONSE, self, self.grouponSettleEvent)
    -- 充值消费活动保底奖励信息
    TFDirector:addProto(s2c.LOGIN_SEND_INFO, self, self.rechargeConsumeEvent)

  
    -- 记录活动列表（活动的相关信息 id 名字 type ）
    self.ActivityInfoList 	= TFMapArray:new()


    -- 在线奖励
  	self.OnlineRewardData = {}  
  	self.OnlineRewardData.bOnlineRewardOnTime 			= false  		-- 倒计时奖励是否可领取
  	self.OnlineRewardData.timeCount 					= 0 					-- 倒计时
  	self.OnlineRewardData.onlineRewardRemainingTimes 	= 0 	-- 倒计时
  	self.OnlineRewardData.onlineRewardCount          	= 0    -- 已领奖的次数

    -- 倒计时奖励是否可领取
    self.bOnlineRewardOnTime = false

    self.onlineActivityId = 0

	-- event 
	self.GET_ACITIVTY_REWARD_SUCCESS 	= 1
	self.ACITIVTY_REWARD_RECORD 		= 2

end

-- 重新清除数据
function GameActivitiesManager:restart()

	print("------------GameActivitiesManager:restart ----")

    -- 倒计时奖励是否可领取
    self.bOnlineRewardOnTime = false

	-- 新倒计时
	self:stopTimerAndRemoveListener()

	   -- 在线奖励
  	self.OnlineRewardData = {}  
  	self.OnlineRewardData.bOnlineRewardOnTime = false  		-- 倒计时奖励是否可领取
  	self.OnlineRewardData.timeCount = 0 					-- 倒计时
  	self.OnlineRewardData.onlineRewardRemainingTimes = 0 	-- 倒计时
  	self.OnlineRewardData.onlineRewardCount          = 0    -- 已领奖的次数


	-- 重置活动
	-- self.ActivityList = nil
	-- self.activityData = {}

	self.ActivityInfoList:clear()
end

function GameActivitiesManager:reset()

end

function GameActivitiesManager:updateSingleActivityEvent(event)
	if event.data then

		print("---- updateSingleActivityEvent =", event.data)

		self:updateSingleActivityData(event.data)
		-- if event.data.type == GameActivitiesManager.Type_Continue_Collect_Role then
		-- 	TFDirector:dispatchGlobalEventWith(self.MSG_ACTIVITY_GET_REWARD, {})
		-- 	return
		-- end
		self:activityInfoListSort()

		TFDirector:dispatchGlobalEventWith(self.MSG_ACTIVITY_UPDATE, {})
	end
end

function GameActivitiesManager:updateActivityListEvent(event)

	if event.data == nil or event.data.info == nil then
		return
	end


	self.ActivityInfoList:clear()

	for i,v in pairs(event.data.info) do
		-- print("v = ", v)
		-- 针对每个活动单独解析
		self:updateSingleActivityData(v)
	end
	self:activityInfoListSort()

	TFDirector:dispatchGlobalEventWith(self.MSG_ACTIVITY_UPDATE, {})
end

function GameActivitiesManager:activityInfoListSort()
	print("GameActivitiesManager:activityInfoListSort")
	local function sortlist( v1,v2 )
		if v1.show_weight > v2.show_weight then
			return true
		elseif v1.show_weight == v2.show_weight then
			if v1.id < v2.id then
				return true
			end
		end
		return false
	end

	self.ActivityInfoList:sort(sortlist)
end

function GameActivitiesManager:updateSingleActivityData(data)

	local sinleActivityInfo = nil

	local activityId = data.id

	local bNewActivity = false
	sinleActivityInfo = self.ActivityInfoList:objectByID(activityId)
	if sinleActivityInfo == nil then
		sinleActivityInfo = {}
		bNewActivity = true
	end
	--print("data.crossServer",data.crossServer)

	sinleActivityInfo.id			= data.id
	sinleActivityInfo.type			= data.type
	sinleActivityInfo.name			= data.name
	sinleActivityInfo.title			= data.title
	sinleActivityInfo.details		= data.details
	sinleActivityInfo.reward		= data.reward
	sinleActivityInfo.status		= data.status
	sinleActivityInfo.multiSever	= data.crossServer or false
	if data.limitStore then
		sinleActivityInfo.import_show	= 2
	elseif data.type == GameActivitiesManager.Type_Exchange then
	 	sinleActivityInfo.import_show	= 3
	elseif data.show then
		sinleActivityInfo.import_show	= 1
	else
		sinleActivityInfo.import_show	= 0
	end

	-- -- 默认和开始时间一致，注：用于支持提前显示预热
	-- sinleActivityInfo.show_begin 	= data.show_begin
	-- sinleActivityInfo.show_end 		= data.show_end

	sinleActivityInfo.sendDataFlag = false
	
	-- 活动开启时间startTimez
	sinleActivityInfo.beginTime 	= data.beginTime
	
	sinleActivityInfo.endTime 		= data.endTime

	sinleActivityInfo.resetCron 	= data.resetCron

	if sinleActivityInfo.beginTime == "" then
		sinleActivityInfo.beginTime = nil
	else
		sinleActivityInfo.beginTime = getTimeByDate(sinleActivityInfo.beginTime)
	end

	if sinleActivityInfo.endTime == "" then
		sinleActivityInfo.endTime = nil
	else
		sinleActivityInfo.endTime = getTimeByDate(sinleActivityInfo.endTime)
	end
	-- if sinleActivityInfo.type == GameActivitiesManager.Type_Full_Cut or sinleActivityInfo.type == GameActivitiesManager.Type_Limit_Shop then
	-- 	sinleActivityInfo.beginTime = MainPlayer:getNowtime() + 20

	-- end
	sinleActivityInfo.startTime = sinleActivityInfo.beginTime
	-- 更新奖励数据
	sinleActivityInfo.show_weight = data.showWeight or 1
	print("sinleActivityInfo.show_weight = ",sinleActivityInfo.show_weight)

	if bNewActivity then
		sinleActivityInfo.value 		= 0
		self.ActivityInfoList:pushbyid(sinleActivityInfo.id, sinleActivityInfo)
	end
	self:updateActivityRewardData(sinleActivityInfo)
end

 -- 初始化其中一个运营活动项
function GameActivitiesManager:updateActivityRewardData(activityInfo)
	-- print("os,time ->",os.time())
	print("activityInfo =============>",activityInfo)
		
	 -- ├┄┄icon="",
	 -- ├┄┄id=1,
	 -- ├┄┄status=2,
	 -- ├┄┄history=false,
	 -- ├┄┄endTime="",
	 -- ├┄┄resetType=0,
	 -- ├┄┄title="登录奖励",
	 -- ├┄┄beginTime="",
	 -- ├┄┄type=1,
	 -- ├┄┄details="登录奖励活动",
	 -- ├┄┄name="登录奖励",
	 -- ├┄┄reward="1|1,1,100&1,2,100&1,3,100|1;2|1,3,100&1,3,100&1,3,100|1;3|1,3,100&1,3,100|1;4|1,3,100&1,3,100|1;5|1,3,100&1,3,100|1"


	local activityId 		= activityInfo.id
	local activityType 		= activityInfo.type

	-- local reward_details = "200|1,1,100&1,2,100&1,3,100|1;400|1,3,100&1,3,100&1,3,100|3;700|1,3,100&1,3,100|0;1000|1,3,100&1,3,100|0;15000|1,3,100&1,3,100|0"
	local reward_details 	= activityInfo.reward

	-- 1、登录；2、连续登录；3、在线奖励，持续在线时长；4、VIP等级；
	-- 5、团队等级；6、累计充值金额；7、单笔充值金额；8、累计消耗，针对元宝', 
	-- print("解析活动 activityType = ", activityType)

	local singleActivityReward = activityInfo.activityReward
	if singleActivityReward == nil then
		singleActivityReward = MEMapArray:new()
	else
		singleActivityReward:clear()
	end
	activityInfo.activityReward = singleActivityReward
	-- 记录下在线奖励
	if activityType == GameActivitiesManager.Type_Online then
		self.onlineActivityId = activityId
	end

	-- if reward_details ~= nil and reward_details ~= ""

	-- end

	-- 赌场
	if activityType == GameActivitiesManager.Type_Casino then

		local activityList = MEArray:new()
		local temptbl = string.split(reward_details,';')
		for k,v in pairs(temptbl) do
			local activity 		= string.split(v,'|')
			local inputNum 		= tonumber(activity[1])
			local inputType 	= tonumber(activity[3])


			local activityRewardData = {
				Num 	 = inputNum,
				resType  = inputType
			}

			singleActivityReward:pushbyid(inputNum,activityRewardData)
		end
	
	-- 兑换EXCHANGE
	elseif activityType == GameActivitiesManager.Type_Exchange then
		-- print("11111111111reward_details = ", reward_details)
		-- 2,2,1&3,0,200000|1,2000,30&3,0,100000|10|1
		-- 2,2,1 & 3,0,200000#1,2,500& 3,0,200000| --兑换的东西 & 隔开 可多换N  #分隔集合物品与固定值
		-- 1,2000,30&3,0,100000| 。。。。
		-- 10  兑换的次数
		-- |1  折扣 （0不打折 1-八折 2--）
		local infos = string.split(reward_details,'_')
		if infos[2] and infos[2] ~= "" then
			activityInfo.discountTypeList = stringToNumberTable(infos[2],",")
		end
		local temptbl = string.split(infos[1],';')
		local count = 1
		for k,v in pairs(temptbl) do
			local goodsInfo 		= string.split(v,'|')
			local allGoodsList 		= goodsInfo[1]
			local itemListInfo 		= string.split(allGoodsList,'#')
			local inputGoodsList 	= itemListInfo[1]
			local costList 			= itemListInfo[2] or ""

			local outGoodsList    	= goodsInfo[2]
			local totalChangeTime 	= tonumber(goodsInfo[3])
			local discount_ 	 	= tonumber(goodsInfo[4])

			local exchangeData =
			{
				id 			= count,
				status 		= totalChangeTime,
				input   	= inputGoodsList,
				out     	= outGoodsList,
				discount    = discount_,
				cost   		= costList,
				changeTime 	= 0;
			}
			singleActivityReward:pushbyid(count, exchangeData)
			count = count + 1
		end
	-- 角色收集
	elseif activityType == GameActivitiesManager.Type_Continue_Collect_Role then
		-- print("11111111111reward_details = ", reward_details)
		-- 2,2,1&3,0,200000|1,2000,30&3,0,100000|10|1
		-- 2,2,1 & 3,0,200000| --兑换的东西 & 隔开 可多换N
		-- 1,2000,30&3,0,100000| 。。。。
		-- 10  兑换的次数
		-- |1  折扣 （0不打折 1-八折 2--）
		local infos = string.split(reward_details,'_')
		if infos[2] and infos[2] ~= "" then
			activityInfo.discountTypeList = stringToNumberTable(infos[2],",")
		end
		local temptbl = string.split(infos[1],';')
		local count = 1
		for k,v in pairs(temptbl) do
			local goodsInfo 		= string.split(v,'|')
			local inputGoodsList 	= goodsInfo[1]
			local outGoodsList    	= goodsInfo[2]
			local totalChangeTime 	= tonumber(goodsInfo[3])
			local discount_ 	 	= tonumber(goodsInfo[4])

			local exchangeData =
			{
				id 			= count,
				status 		= totalChangeTime,
				input   	= inputGoodsList,
				out     	= outGoodsList,
				discount    = discount_,
				changeTime 	= 0;
			}
			singleActivityReward:pushbyid(count, exchangeData)
			count = count + 1
		end

	-- 单笔充值
	elseif activityType == GameActivitiesManager.Type_Single_Recharge then
		local activityList = MEArray:new()
		print('reward_details = ', reward_details)
		local temptbl = string.split(reward_details,';')
		for k,v in pairs(temptbl) do
			local activity 		= string.split(v,'|')
			local rewardid 		= tonumber(activity[1])
			local rewardStatus 	= tonumber(activity[3])
			local tempRewardtbl = string.split(activity[2],'&')
			-- 单笔充值 状态默认为0
			local maxTimeRange = rewardStatus
			rewardStatus = 0

			local rewardList = MEArray:new()
			for k2,v2 in pairs(tempRewardtbl) do

				local reward = string.split(v2,',')

				-- print("reward =", reward)
				if reward then
					local commonReward = {}
					commonReward.type 	= tonumber(reward[1])
					commonReward.itemId = tonumber(reward[2])
					commonReward.number = tonumber(reward[3])
					rewardList:push(BaseDataManager:getReward(commonReward))
				end
			end

			local activityRewardData = {
				id 			= rewardid,
				status 		= rewardStatus,
				reward  	= rewardList,
				maxtime		= maxTimeRange, --限制最大的领取次数
				gottime		= 0, 			--当前领取的次数
				nowPayTimes = 0 			--当前档次的充值记录 只用于单笔充值
			}

			singleActivityReward:pushbyid(rewardid,activityRewardData)
		end
		

	-- 累计充值 和消费
	-- GameActivitiesManager.Type_Total_Recharge 	= 6
	-- GameActivitiesManager.Type_Total_Consume 	= 8
	-- elseif activityType == GameActivitiesManager.Type_Total_Recharge or activityType == GameActivitiesManager.Type_Total_Consume then
	-- GameActivitiesManager.Type_Ten_Card
	elseif activityType == GameActivitiesManager.Type_Ten_Card or activityType == GameActivitiesManager.Type_JiangHuSheLi then
		--1_1_10;1_2_10
		-- print("reward_details ====>",reward_details)
		local temptbl = string.split(reward_details,';')
		for k,v in pairs(temptbl) do
			local reward 		= string.split(v,'_')
			local commonReward = {}
			commonReward.type 	= tonumber(reward[1])
			commonReward.itemId = tonumber(reward[2])
			commonReward.number = tonumber(reward[3])
			singleActivityReward:push(BaseDataManager:getReward(commonReward))
		end

	elseif activityType == GameActivitiesManager.Type_Score_Exchange or 
			activityType == GameActivitiesManager.Type_Score_Egg or 
			activityType == GameActivitiesManager.Type_Score_XunBao or 
			activityType == GameActivitiesManager.Type_Tian_Ji_Lun_SCORE or 
			activityType == GameActivitiesManager.Type_Total_YuanBao or 
			activityType == GameActivitiesManager.Type_Xia_Ke_Xing_SCORE then

		-- 1-1|3,0,100000&1,30010,5&1,30005,5;2-10|3,0,100000&1,30010,10&1,30008,5
		local rewardCount = 0
		local activityList = MEArray:new()
		-- print("reward_details = ", reward_details)
		if (not reward_details) or reward_details == "" then
			return
		end
		local temptbl = string.split(reward_details,';')
		for k,v in pairs(temptbl) do
			rewardCount = rewardCount + 1

			local activity 		= string.split(v,'|')

			local rewardid 		= rewardCount

			local levelLimit    = string.split(activity[1],'-')

			-- local rewardStatus 	= tonumber(activity[3])
			local tempRewardtbl = string.split(activity[2],'&')
			local maxTimeRange 	= 0



			local rewardList = MEArray:new()
			-- local extra_rewardList = MEArray:new()
			for k2,v2 in pairs(tempRewardtbl) do

				local reward = string.split(v2,',')
				if reward then
					local commonReward = {}
					commonReward.type 	= tonumber(reward[1])
					commonReward.itemId = tonumber(reward[2])
					commonReward.number = tonumber(reward[3])
					rewardList:push(BaseDataManager:getReward(commonReward))
					-- extra_rewardList:push(BaseDataManager:getReward(commonReward))
				end
			end

			local extraStatus 	= 0
			if activity[3] then
				extraStatus = tonumber(activity[3])
			end
			local extra_rewardList = MEArray:new()
			if activity[4] then
				local _tempRewardtbl = string.split(activity[4],'&')
				for _k,_v in pairs(_tempRewardtbl) do
					local reward = string.split(_v,',')
					if reward then
						local commonReward = {}
						commonReward.type 	= tonumber(reward[1])
						commonReward.itemId = tonumber(reward[2])
						commonReward.number = tonumber(reward[3])
						extra_rewardList:push(BaseDataManager:getReward(commonReward))
					end
				end
			end 

			local minLevel1 = levelLimit[1] or 0
			local maxLevel2 = levelLimit[2] or 0

			local activityRewardData = {
				id 			= rewardid,
				minlevel 	= minLevel1,
				maxlevel 	= maxLevel2,
				status 		= rewardStatus,
				reward  	= rewardList,
				maxtime		= maxTimeRange, --限制最大的领取次数
				gottime		= 0, 			--当前领取的次数	 只用于单笔充值
				nowPayTimes = 0, 			--当前档次的充值记录 只用于单笔充值
				extraStatus = extraStatus,
				extraReward = extra_rewardList,
			}

			singleActivityReward:pushbyid(rewardid,activityRewardData)
		end
	elseif activityType == GameActivitiesManager.Type_ChongzhiRank or
			activityType == GameActivitiesManager.Type_XiaofeiRank then
			-- 1-1|3,0,100000&1,30010,5&1,30005,5|3000|4,0,100;
        -- * 第X名区间|奖励列表|第X名需要的额外积分|額外奖励列表
		local rewardCount = 0
		local activityList = MEArray:new()
		if (not reward_details) or reward_details == "" then
			return
		end

		local temptbl = string.split(reward_details,';')
		for k,v in pairs(temptbl) do
			rewardCount = rewardCount + 1

			local activity 		= string.split(v,'|')
			local rewardid 		= rewardCount
			local levelLimit    = string.split(activity[1],'-')
			local tempRewardtbl = string.split(activity[2],'&')
			local maxTimeRange 	= 0

			local rewardList = MEArray:new()
			for k2,v2 in pairs(tempRewardtbl) do

				local reward = string.split(v2,',')
				if reward then
					local commonReward = {}
					commonReward.type 	= tonumber(reward[1])
					commonReward.itemId = tonumber(reward[2])
					commonReward.number = tonumber(reward[3])
					rewardList:push(BaseDataManager:getReward(commonReward))
				end
			end

			local extra_rewardList = MEArray:new()
			if activity[3] then
				local _tempRewardtbl = string.split(activity[3],'&')
				for _k,_v in pairs(_tempRewardtbl) do
					local reward = string.split(_v,',')
					if reward then
						local commonReward = {}
						commonReward.type 	= tonumber(reward[1])
						commonReward.itemId = tonumber(reward[2])
						commonReward.number = tonumber(reward[3])
						extra_rewardList:push(BaseDataManager:getReward(commonReward))
					end
				end
			end 

			local minLevel1 = levelLimit[1] or 0
			local maxLevel2 = levelLimit[2] or 0

			local activityRewardData = {
				id           = rewardid,
				minlevel     = minLevel1,
				maxlevel     = maxLevel2,
				status       = rewardStatus,
				reward       = rewardList,
				maxtime      = maxTimeRange, --限制最大的领取次数
				gottime      = 0, 			--当前领取的次数	 只用于单笔充值
				nowPayTimes  = 0, 			--当前档次的充值记录 只用于单笔充值
				extraReward  = extra_rewardList,
			}

			singleActivityReward:pushbyid(rewardid,activityRewardData)
		end


	elseif activityType == GameActivitiesManager.Type_Money_Shop then
		--  1 通宝类型_元宝_目标|资源类型,id,数量&资源类型,id,数量_目标|资源类型,id,数量&资源类型,id,数量;
		--  2 通宝类型_元宝_目标|资源类型,id,数量&资源类型,id,数量_目标|资源类型,id,数量&资源类型,id,数量
		--  3 通宝类型_元宝_ 目标|资源类型,id,数量&资源类型,id,数量#目标|资源类型,id,数量&资源类型,id,数量
		-- 通宝类型_元宝_ ()
		-- 1_1888_1|1,30010,5&1,30005,5#2|1,30010,10&1,30008,5#3|1,67,1&1,30004,5#4|1,1033,5&1,2004,30#5|1,30009,5&1,1182,5#6|1,30021,5&1,30009,10#7|1,1048,5&1,30021,10#8|1,30008,10&1,30022,10#9|1,2013,15&1,30006,5#10|1,30006,10&1,30005,10;
		-- 2_2888_1|1,3002,20&1,30033,2#2|1,30033,2&1,30022,30#3|1,30022,30&1,30027,10#4|1,30027,10&1,3002,10#5|1,3002,10&1,30035,50#6|1,30035,50&1,30010,1#7|1,30010,1&1,76,1#8|1,76,1&1,1019,1#9|1,1019,1&1,2000,30#10|1,2000,30&1,3002,1;
		-- 3_3888_1|1,2000,30&1,30010,5&1,30004,5#2|1,2000,30&1,30005,5&1,1033,5#3|1,2000,30&1,30010,10&1,2004,30#4|1,2000,30&1,30008,5&1,30009,5#5|1,2000,30&1,67,1&1,1182,5

		local rewardData = {}
		-- print("reward_details = ", reward_details)
		local temptbl = string.split(reward_details,';')
		for k,v in pairs(temptbl) do
			local oneMoneyShop = string.split(v,'_')
			local shopType = tonumber(oneMoneyShop[1])
			local shopCost = tonumber(oneMoneyShop[2])
			local targetString = oneMoneyShop[3] --tonumber(v[3])


			rewardData[shopType] = {}
			rewardData[shopType].shopType 	= shopType
			rewardData[shopType].shopCost 	= shopCost

			-- print("11111 shopCost = ", shopCost)
			-- print("11111 v = ", v)
			rewardData[shopType].rewardData = MEMapArray:new()

			
			local targettbl = string.split(targetString,'#')
			-- print("targetString = ", targetString)
			for k,target in pairs(targettbl) do
				local rewardList = MEArray:new()
				local targetData 		= string.split(target,'|')
				local targetId 		    = tonumber(targetData[1])
				local tempRewardtbl = string.split(targetData[2],'&')
				for k2,v2 in pairs(tempRewardtbl) do
					local reward = string.split(v2,',')
					if reward then
						local commonReward = {}
						commonReward.type 	= tonumber(reward[1])
						commonReward.itemId = tonumber(reward[2])
						commonReward.number = tonumber(reward[3])
						rewardList:push(BaseDataManager:getReward(commonReward))
					end
				end

				-- print('rewardList len = ', rewardList:length())
				local activityRewardData = {
					id 			= targetId,
					status 		= 1,
					reward  	= rewardList,
				}
				rewardData[shopType].rewardData:pushbyid(targetId,activityRewardData)
			end
		end

		-- print("11111 rewardData = ", rewardData)
		-- print("11111 num of rewardData = ", #rewardData)
		-- m = n + 1
		activityInfo.AllMoneyShopData = rewardData
		activityInfo.shopType 	  = 0 -- 0为还没有买一个商店类型  1.2.3 为对应的相关类型

	elseif activityType == GameActivitiesManager.Type_Shop_Employ then
		-- 1,1|1,30005,5&1,30010,5|1
		-- 招募类型|招募目标次数|奖励。。。|是否已领奖
		--1,2&2,1|1,30005,5&1,30010,5|1 
		-- 招募类型,招募目标次数&招募类型,招募目标次数|奖励。。。|是否已领奖

		activityInfo.employStatus = {}

		local temptbl = string.split(reward_details,';')
		local CountReward = 0
		for k,v in pairs(temptbl) do
			local activity 			= string.split(v,'|')
			local employConditionstr 	= string.split(activity[1],'&')
			local tempRewardtbl = string.split(activity[2],'&')
			local rewardStatus 	= tonumber(activity[3])

			CountReward = CountReward + 1


			local employConditionList = MEArray:new()
			for k3,v3 in pairs(employConditionstr) do
				local employCondition = string.split(v3,',')
				if employCondition then
					local employConditionNode = {}
					employConditionNode.employType 	= tonumber(employCondition[1])
					employConditionNode.employNum 	= tonumber(employCondition[2])
					employConditionList:push(employConditionNode)
				end
			end

			local rewardList = MEArray:new()
			for k2,v2 in pairs(tempRewardtbl) do

				local reward = string.split(v2,',')
				if reward then
					local commonReward = {}
					commonReward.type 	= tonumber(reward[1])
					commonReward.itemId = tonumber(reward[2])
					commonReward.number = tonumber(reward[3])
					rewardList:push(BaseDataManager:getReward(commonReward))
				end
			end

			local activityRewardData = {
				id 			= CountReward,
				status 		= rewardStatus,
				reward  	= rewardList,
				condition  	= employConditionList,
			}

			singleActivityReward:pushbyid(CountReward,activityRewardData)
		end
	elseif activityType == GameActivitiesManager.Type_New_Continue_Recharge then
		-- 第几天|奖励表达式;第几天|奖励表达式;。。。。。。。；一共需要连续几天|奖励表达式|一共需要累积多少元宝
		local activityList = MEArray:new()
		print("Type_New_Continue_Recharge---reward_details = ", reward_details)
		-- if activityInfo.progress == nil then
		-- 	activityInfo.progress = 0
		-- end
		local index = 1
		local temptbl = string.split(reward_details,';')
		for k,v in pairs(temptbl) do
			local activity		= string.split(v,'|')
			local rewardid		= tonumber(activity[1])
			local tempRewardtbl = string.split(activity[2],'&')
			local minRecharge	= 0
			if activity[3] then
				minRecharge = tonumber(activity[3])
			end
			local maxTimeRange = 0


			local rewardList = MEArray:new()
			for k2,v2 in pairs(tempRewardtbl) do

				local reward = string.split(v2,',')
				if reward then
					local commonReward = {}
					commonReward.type 	= tonumber(reward[1])
					commonReward.itemId = tonumber(reward[2])
					commonReward.number = tonumber(reward[3])
					rewardList:push(BaseDataManager:getReward(commonReward))
				end
			end

			local activityRewardData = {
				index   = index,
				id 			= rewardid,
				status 		= 1,
				reward  	= rewardList,
				minRecharge = minRecharge,
			}

			singleActivityReward:pushbyid(index,activityRewardData)
			index = index + 1
		end
	elseif activityType == GameActivitiesManager.Type_Limit_Shop then
		--限时抢购
		activityInfo.sendDataFlag = true
		if self:checkTimeIsExpired(activityInfo.startTime, activityInfo.endTime) == false then
			activityInfo.sendDataFlag = nil
			TFDirector:send(c2s.LIMIT_HOT_INFO_REQUEST, {})
		end
	elseif activityType == GameActivitiesManager.Type_Full_Cut then
		--满减返现
		activityInfo.sendDataFlag = true
		if self:checkTimeIsExpired(activityInfo.startTime, activityInfo.endTime) == false then
			activityInfo.sendDataFlag = nil
			TFDirector:send(c2s.BUY_BACK_INFO_REQUEST, {})
		end		
	elseif activityType == GameActivitiesManager.Type_Group_On then
		--限时团购
		activityInfo.sendDataFlag = true
		if self:checkTimeIsExpired(activityInfo.startTime, activityInfo.endTime) == false then
			activityInfo.sendDataFlag = nil
			TFDirector:send(c2s.GROUPON_INFO_REQUEST, {})
		end
	elseif activityType == GameActivitiesManager.Type_JiangHuJuHui then
		-- 江湖聚惠
		print("江湖聚惠：", reward_details)
		local tGoods = string.split(reward_details, ";")
		for i,v in ipairs(tGoods) do
			local tGoodInfo = string.split(string.split(v, "&")[2], "|")
			local tItemInfo = string.split(tGoodInfo[2], ",")

			local tActivityGoods = {
				nPrice    = tonumber(tGoodInfo[1]),
				nCount    = tonumber(tGoodInfo[3]),
				nDiscount = tonumber(tGoodInfo[4]),
				type      = tonumber(tItemInfo[1]),
				itemId    = tonumber(tItemInfo[2]),
				number    = tonumber(tItemInfo[3]),
				status    = 1,
				index     = i,
			}

			singleActivityReward:pushbyid(i, tActivityGoods)
		end
	elseif activityType == GameActivitiesManager.Type_VIP_GIFT then
		--" id|vip|cost|itemtype_itemId_itemNum&itemtype_itemId_itemNum;  "
		local temptbl = string.split(reward_details,';')
		for k,v in pairs(temptbl) do
			if v == "" then
				return
			end
			local activity 		= string.split(v,'|')
			local rewardid 		= tonumber(activity[1])
			local vip 			= tonumber(activity[2])
			local costStr 		= string.split(activity[3],',')
			local tempRewardtbl = string.split(activity[4],'&')

			local cost = 0
			if costStr and tonumber(costStr[1]) ~= 0 then
				cost = 1
			end

			local rewardList = MEArray:new()
			for k2,v2 in pairs(tempRewardtbl) do

				local reward = string.split(v2,',')
				if reward then
					local commonReward = {}
					commonReward.type 	= tonumber(reward[1])
					commonReward.itemId = tonumber(reward[2])
					commonReward.number = tonumber(reward[3])
					rewardList:push(BaseDataManager:getReward(commonReward))
				end
			end

			local activityRewardData = {
				id 			= rewardid,
				-- status 		= rewardStatus,
				reward  	= rewardList,
				maxtime		= 1,			 --限制最大的领取次数
				gottime		= 0, 			--当前领取的次数
				vip 		= vip ,			--当前档次的vip
				cost  		= cost ,			--当前档次的消耗
				price  		= costStr 			--当前档次的消耗
			}

			singleActivityReward:pushbyid(rewardid,activityRewardData)
		end

	elseif reward_details ~= nil and reward_details ~= "" then
		local activityList = MEArray:new()
		-- print("reward_details = ", reward_details)
		local temptbl = string.split(reward_details,';')
		for k,v in pairs(temptbl) do
			local activity 		= string.split(v,'|')
			local rewardid 		= tonumber(activity[1])
			local rewardStatus 	= tonumber(activity[3])
			local tempRewardtbl = string.split(activity[2],'&')
			local maxTimeRange 	= 0


			local rewardList = MEArray:new()
			for k2,v2 in pairs(tempRewardtbl) do

				local reward = string.split(v2,',')
				if reward then
					local commonReward = {}
					commonReward.type 	= tonumber(reward[1])
					commonReward.itemId = tonumber(reward[2])
					commonReward.number = tonumber(reward[3])
					rewardList:push(BaseDataManager:getReward(commonReward))
				end
			end

			local activityRewardData = {
				id 			= rewardid,
				status 		= rewardStatus,
				reward  	= rewardList,
				maxtime		= maxTimeRange, --限制最大的领取次数
				gottime		= 0, 			--当前领取的次数	 只用于单笔充值
				nowPayTimes = 0 			--当前档次的充值记录 只用于单笔充值
			}

			singleActivityReward:pushbyid(rewardid,activityRewardData)
		end
	end
end


-- 获取活动的相关信息
function GameActivitiesManager:getActivityInfo(ActivityId)
	-- print("self.ActivityInfoList = ",self.ActivityInfoList)
	-- print("ActivityId = ", ActivityId)
	return self.ActivityInfoList:objectByID(ActivityId)
end

function GameActivitiesManager:getActivityData(ActivityId)
	return self:getActivityInfo(ActivityId)
end

-- 获取活动里面的奖品列表
function GameActivitiesManager:getActivityRewardList(ActivityId)
	local activity = self:getActivityInfo(ActivityId)
	if activity then
		return activity.activityReward
	end
	
	return  MEArray:new()
end


-- 获取获取活动中， 指定一个奖项的奖品
function GameActivitiesManager:getActivityRewardData(ActivityId, rewardId)
	local activity = self:getActivityInfo(ActivityId)
	if activity then
		return activity.activityReward:objectByID(rewardId) --.reward
	end

	
	return  MEArray:new()
end

-- 具体每个奖项对应的值 ，如累计充值的铜币，消耗的总铜币等
function GameActivitiesManager:getActivityVaule(ActivityId)
	local activity = self:getActivityInfo(ActivityId)
	if activity  and activity.value then
		return activity.value --.reward
	end

	return 0
end


-- 获取奖项的达到条件
function GameActivitiesManager:getRewardCondition(activityInfo, rewardId)
	if activityInfo.value == nil then
		activityInfo.value = 0
	end

	-- if activityInfo.id == 35 then
	-- 	print("rewardId 			= ", rewardId)

	-- 	print("activityInfo.value 	= ", activityInfo.value)
	-- end

	if rewardId <= activityInfo.value then
		return true
	end

	return false
end

--[[
计算奖励状态
@return 0、可以领取；1、未开始；2、进行中；3、活动已经结束；4、今日已经领取完毕；5、已经领取过；6、尚未能够领取；7、找不到配置数据;8、尚未达到领取条件
]]
function GameActivitiesManager:getActivityRewardStatus(ActivityId, rewardId)

	-- if 1 then
	-- 	return 0

	-- end

	local activity = self:getActivityData(ActivityId)
-- GameActivitiesManager.Type_Normal_Login 	= 1
-- GameActivitiesManager.Type_Continue_Login 	= 2
-- GameActivitiesManager.Type_Online 			= 3
-- GameActivitiesManager.Type_VIP 				= 4
-- GameActivitiesManager.Type_Team_Level 		= 5
-- GameActivitiesManager.Type_Total_Recharge 	= 6
-- GameActivitiesManager.Type_Single_Recharge 	= 7
-- GameActivitiesManager.Type_Total_Consume 	= 8
-- GameActivitiesManager.Type_Casino 			= 9
-- GameActivitiesManager.Type_Exchange 	    = 10
-- GameActivitiesManager.Type_Ten_Card 	    = 11
-- GameActivitiesManager.Type_More_RedBag 		= 12
-- GameActivitiesManager.Type_Pay_Back_RedBag  = 13
	if activity and rewardId then
		local activityType 	 = activity.type
		local activityReward = activity.activityReward

		if activityType == GameActivitiesManager.Type_Online then
			if self.OnlineRewardData.onlineRewardCount >= self:getOnlineRewardCount() then
				return 4
			end

			local rewardInfo = activityReward:objectByID(rewardId)
			if rewardInfo == nil then
				return 7
			end

			local index = activityReward:indexOf(rewardInfo) - 1 
			if self.OnlineRewardData.onlineRewardCount < index then
				return 8
			end
			if self.OnlineRewardData.onlineRewardCount > index then
				return 5
			end
			if self.OnlineRewardData.onlineRewardRemainingTimes ~= 0 then
				return 6
			end

			return 0
		end

		local nowTime = MainPlayer:getNowtime()

		if activity.startTime and nowTime < activity.startTime then
			return 1

		-- 过期了
		elseif activity.endTime and nowTime > activity.endTime then
			-- print("2222")
			-- 活动虽结束 但是领取了
			local rewardStatus = activityReward:objectByID(rewardId).status 
			if  rewardStatus == 0 then
				if activityType == GameActivitiesManager.Type_Single_Recharge then
					return 8
				else
					return 5
				end
			end

			return 3
		end

		local rewardStatus = activityReward:objectByID(rewardId).status 

		-- 单笔充值
		if activityType == GameActivitiesManager.Type_Single_Recharge then
			-- 判断是否到达最大的次数
			local danbiData = activityReward:objectByID(rewardId)
			if danbiData ~= nil then
				if  danbiData.gottime >= danbiData.maxtime then
					return 8
				end
			end

			if  rewardStatus == 0 then
				return 8
			else 
				return 0
			end
		end

		-- 连续充值
		if activityType == GameActivitiesManager.Type_New_Continue_Recharge then

			-- activityInfo.progress
			local data = activityReward:objectByID(rewardId)
			-- print("data = ", data)
			-- print(" activity.progress = ",  activity.progress)
			-- print(" data.minRecharge = ",  data.minRecharge)
			-- print(" activity.value = ",  activity.value)
			if rewardStatus == 8 and ( data.id <= activity.progress and data.minRecharge <= activity.value) then
				return 0
			end
			return rewardStatus
		end
				-- 连续充值
		if activityType == GameActivitiesManager.Type_Continue_Recharge then

			-- activityInfo.progress
			local data = activityReward:objectByID(rewardId)
			-- print("data.inde = ", data.index)
			-- print(" activity.progress = ",  activity.progress)
			if rewardStatus == 8 and rewardId <= activity.value  and data.index <= activity.progress then
				return 0
			end

			return rewardStatus
		end
		
		if activityType == GameActivitiesManager.Type_Shop_Employ then
            return rewardStatus
        end

		-- 领奖次数为0
		if  rewardStatus == 0 then
			return 5
		end




		-- 领奖次数>0   然后判断其他条件
		local canBeGot = self:getRewardCondition(activity, rewardId)
		if canBeGot then
			return 0
		else
			return 8
		end
	end


	return 8
end

function GameActivitiesManager:updateSingleActivityProgressEvent(event)
	if event.data == nil then
		return
	end
	print("---------- GameActivitiesManager:updateSingleActivityProgressEvent-------")
	print("---------- event.data -------", event.data)

	self:updateSingleActivityProgess(event.data)

	TFDirector:dispatchGlobalEventWith(self.MSG_ACTIVITY_PROGRESS_UPDATE, {})
end


function GameActivitiesManager:recvActivityRewardResultEvent(event)
	AlertManager:closeLayerByName("lua.logic.gameactivity.exchangeSelectItemLayer")
	local data = event.data

	hideLoading()

	local index = data.index			--奖励索引，从1开始，第几个奖励
	
	local activityId 	= data.id

	local activityInfo  = self:getActivityInfo(activityId)
	if activityInfo == nil then
		print("recvActivityRewardResultEvent, can't find activityid = ", activityId)
		return
	end

	local activityType 		= activityInfo.type
	local activityReward 	= activityInfo.activityReward

		--银钩坊（小宝赌场）不计算元宝消耗逻辑添加
	if activityType == GameActivitiesManager.Type_Casino then
		self.skipSyceeExpendMark = false
	end


	print("---recvActivityRewardResultEvent activityType = ", activityType)
	print("---recvActivityRewardResultEvent activityId   = ", activityId)

	if activityType == GameActivitiesManager.Type_Online then
		local onlineRewardIndex = self.OnlineRewardData.onlineRewardCount + 1
		self.OnlineRewardData.onlineRewardCount          = onlineRewardIndex
		local length = activityReward:length()
		-- for i=onlineRewardIndex + 1,length do
		local reward 	= activityReward:getObjectAt(onlineRewardIndex + 1)


		if reward then
			if self.newOnlineRewardList and self.newOnlineRewardList[onlineRewardIndex + 1] then
				self.OnlineRewardData.timeCount 				 = self.newOnlineRewardList[onlineRewardIndex + 1].timeCount
				self.OnlineRewardData.onlineRewardRemainingTimes = self.newOnlineRewardList[onlineRewardIndex + 1].onlineRewardRemainingTimes
			else
				local onlineRewardRemainingTimes = reward.id
				self.OnlineRewardData.timeCount 				 = onlineRewardRemainingTimes or 0 		-- 倒计时
				self.OnlineRewardData.onlineRewardRemainingTimes = onlineRewardRemainingTimes or 0  	-- 倒计时
			end
			-- self.newOnlineRewardList = self.newOnlineRewardList or {}
			-- self.newOnlineRewardList[i] = self.newOnlineRewardList[i] or {}
			-- self.newOnlineRewardList[i].timeCount 				 = onlineRewardRemainingTimes or 0 		-- 倒计时
			-- self.newOnlineRewardList[i].onlineRewardRemainingTimes = onlineRewardRemainingTimes or 0  	-- 倒计时
		end
		-- end

	elseif activityType == GameActivitiesManager.Type_Casino then
		local rewardIndex = activityInfo.value or 0
		activityInfo.value = rewardIndex + 1

	elseif activityType == GameActivitiesManager.Type_Exchange then
		local reward = activityReward:getObjectAt(index) --.reward

		
		reward.changeTime 	= reward.changeTime + 1
	elseif activityType == GameActivitiesManager.Type_Continue_Collect_Role then
		local reward = activityReward:getObjectAt(index) --.reward

		
		reward.changeTime 	= reward.changeTime + 1
	elseif activityType == GameActivitiesManager.Type_VIP_GIFT then
		for reward in activityReward:iterator() do
			if reward.id == index then
				reward.gottime 	= reward.gottime + 1
				TFDirector:dispatchGlobalEventWith(self.MSG_ACTIVITY_GET_REWARD, {})
				return
			end
		end

		
		-- reward.gottime 	= reward.gottime + 1	
	elseif activityType == GameActivitiesManager.Type_Single_Recharge then
		local reward = activityReward:getObjectAt(index) 
		
		reward.gottime = reward.gottime + 1
		if reward.status > 0 then
			reward.status 	= reward.status - 1
		end
	elseif activityType == GameActivitiesManager.Type_Money_Shop then
		local shopType 		= activityInfo.shopType
		local shopReward 	= activityInfo.AllMoneyShopData[shopType].rewardData
		local rewardId 		= index
		local reward 		= shopReward:objectByID(rewardId)
		print("-----index = ", index)
		print("-----shopType = ", shopType)
		print("-----reward.status1 = ", reward.status)
		if reward.status > 0 then
			reward.status 	= reward.status - 1
		end
		print("-----reward.status2 = ", reward.status)

	elseif activityType == GameActivitiesManager.Type_Continue_Recharge then
		local reward = activityReward:getObjectAt(index)
		-- 这个状态同按钮状态
		reward.status = 5

	elseif activityType == GameActivitiesManager.Type_Shop_Employ then
		local reward = activityReward:getObjectAt(index)
		-- 这个状态同按钮状态
		reward.status = 5

	else
		self:UpdateActityReward(activityInfo, index)
	end

	TFDirector:dispatchGlobalEventWith(self.MSG_ACTIVITY_GET_REWARD, {})
end

function GameActivitiesManager:sendMsgToGetActivityReward(activityid, rewardIndex, skipSyceeExpend,discount_id, targetSrc, nCount)
	showLoading()
	if skipSyceeExpend then
		self.skipSyceeExpendMark = true
	end
	discount_id = discount_id or 0
	targetSrc = targetSrc or ""
	nCount = nCount or 0
	TFDirector:send(c2s.GOT_ACTIVITY_REWARD, {activityid, rewardIndex, discount_id, targetSrc, nCount})
end

function GameActivitiesManager:updateActivityListProgressEvent(event)

	if event.data == nil or event.data.progress == nil then
		return
	end


	-- print("---------- GameActivitiesManager:getActivityProgressList-------")
	-- print("---------- event.data.progress -------", event.data.progress)

	for i,v in pairs(event.data.progress) do
		self:updateSingleActivityProgess(v)
	end

	TFDirector:dispatchGlobalEventWith(self.MSG_ACTIVITY_PROGRESS_UPDATE, {})
end


function GameActivitiesManager:updateSingleActivityProgess(v)
	-- required int32 id = 1;				//活动ID
	-- required int32 progress = 2;		//进度
	-- required string extend = 3;			//进度扩展字段，单笔充值等复杂的进度记录
	-- required string got =4 ;			//已经领取的奖励表达式,与reward对应。如：1,0,1,2,0
	-- required string lastUpdate = 5;		//最后更新时间
	-- optional int32 resetRemaining = 6;	//下次重置剩余时间，如果活动信息中resetCron为null或者空字符串则忽略此字段

	if v == nil then
		return
	end

	local activityId 	= v.id
	local progress 		= v.progress
	local extend 		= v.extend
	local got 			= v.got

	local activityInfo  = self:getActivityInfo(activityId)
	if activityInfo == nil then
		print("update activity process, can't find activityid = ", activityId)
		return
	end

	local activityType 		= activityInfo.type
	local activityReward 	= activityInfo.activityReward 

	if activityReward == nil then
		return
	end

		-- print("activityId = ", activityId)
		-- print("activityType = ", activityType)

	local rewardNum = 0
	local gottbl 	= string.split(got,',')
	local gotList 	= {}

	for k1, v1 in pairs(gottbl) do
		rewardNum = rewardNum + 1
		gotList[rewardNum] = tonumber(v1) or 0
	end

	activityInfo.value = v.progress
	if activityType == GameActivitiesManager.Type_Online then

		local extendtbl 		= string.split(extend, ',')
		local onlineRewardIndex = tonumber(extendtbl[1]) or 0 --领到了第几个
		-- 记录当前领取次数
		self.OnlineRewardData.onlineRewardCount = onlineRewardIndex or 0 

		local length = activityReward:length()
		for i=onlineRewardIndex + 1,length do
			local reward 	= activityReward:getObjectAt(i)
			if reward then
				local onlineRewardRemainingTimes = reward.id - activityInfo.value

				if onlineRewardRemainingTimes < 0 then
					onlineRewardRemainingTimes = 0
				end
				if i == onlineRewardIndex + 1 then
					self.OnlineRewardData.timeCount 				 = onlineRewardRemainingTimes or 0 		-- 倒计时
					self.OnlineRewardData.onlineRewardRemainingTimes = onlineRewardRemainingTimes or 0  	-- 倒计时
					self.OnlineRewardData.onlineRewardCount          = onlineRewardIndex or 0    			-- 已领奖的次数
				end

			  	self.newOnlineRewardList = self.newOnlineRewardList or {}
				self.newOnlineRewardList[i] = self.newOnlineRewardList[i] or {}
				self.newOnlineRewardList[i].timeCount 				 = onlineRewardRemainingTimes or 0 		-- 倒计时
				self.newOnlineRewardList[i].onlineRewardRemainingTimes = onlineRewardRemainingTimes or 0  	-- 倒计时
				self.newOnlineRewardList[i].onlineRewardCount          = onlineRewardIndex or 0    			-- 已领奖的次数
			end
		end

	-- 单笔充值
	elseif activityType == GameActivitiesManager.Type_Single_Recharge then
		local extendtbl = string.split(extend,'|')
		
		-- extend="30,1|60,2"
		-- 转换成剩余的
		local index = 0
		for k2, v2 in pairs(extendtbl) do

			local chargeInfo = string.split(v2,',')

			local id 	= tonumber(chargeInfo[1]) or 0
			local num 	= tonumber(chargeInfo[2]) or 0

			-- index = index + 1

			local reward 	= activityReward:objectByID(id) 
			-- local sycee     = reward.id
			if reward then

				if num > reward.maxtime then
					num = reward.maxtime
				end

				index = activityReward:indexOf(reward)
				gotList[index] = gotList[index] or 0
				reward.status  = num - gotList[index]

				reward.gottime 		= gotList[index] --当前领取的次数
				reward.nowPayTimes  = num --当前档次充值的次数
			end
		end

	elseif activityType == GameActivitiesManager.Type_Casino then
		local extendtbl = string.split(extend, ',')
		local index = tonumber(extendtbl[1]) or 0 --领到了第几个
		activityInfo.value = index

	elseif activityType == GameActivitiesManager.Type_Exchange then
		for i=1, rewardNum do

			gotList[i] = gotList[i] or 0

			local reward 	= activityReward:getObjectAt(i)
			if reward then 
				reward.changeTime  = gotList[i]
			end
		end

	elseif activityType == GameActivitiesManager.Type_Score_Exchange or 
			activityType == GameActivitiesManager.Type_Score_Egg or 
			activityType == GameActivitiesManager.Type_Score_XunBao or 
			activityType == GameActivitiesManager.Type_Tian_Ji_Lun_SCORE or 
			activityType == GameActivitiesManager.Type_Total_YuanBao or 
			activityType == GameActivitiesManager.Type_Xia_Ke_Xing_SCORE then

		-- extend   = "rank|score_name,score,score,score,score
		-- progress = 当前积分
		if (not extend) or extend == "" then
			return
		end
		local extendtbl = string.split(extend,'|')
		-- print("extendtbl=================================>",extend)
		local myRank   = tonumber(extendtbl[1]) or 0
		local scorelist = string.split(extendtbl[2],',')
		-- extend="30,1|60,2"
		-- 转换成剩余的
		local id = 0
		for k2, v2 in pairs(scorelist) do
			id = id + 1
			local reward = activityReward:objectByID(id)
			if reward then
				local scoreAndName = string.split(v2,'_')
				local tScoreRange = string.split(scoreAndName[1], "-")
				if #tScoreRange == 1 then
					reward.status  = tonumber(scoreAndName[1]) or 0
				else
					-- 十连抽活动支持分数区间
					reward.maxScore = tonumber(tScoreRange[2])
					reward.minScore = tonumber(tScoreRange[1])
				end
				-- 增加一个name
				reward.userName = scoreAndName[2]
				reward.serverName = scoreAndName[3] or ""

			end

		end

		activityInfo.rank = myRank

	elseif activityType == GameActivitiesManager.Type_ChongzhiRank or
			activityType == GameActivitiesManager.Type_XiaofeiRank then

		if (not extend) or extend == "" then
			return
		end

		local tExtend = string.split( extend, "|" )
		local tMyRankInfo = string.split( tExtend[1], "_" )
		local nMyRank = tMyRankInfo[1]
		local nMyScore = tMyRankInfo[2]

		local tRankInfo = string.split( tExtend[2], ";" )

		for i,v in ipairs(tRankInfo) do
			local tRewardInfo = activityReward:objectByID( i )
			local tPlayerInfo = string.split(v, "_")
			if i <= 3 then
				-- 前三名格式不同
				tRewardInfo.curScore = tPlayerInfo[1]
				tRewardInfo.userName = tPlayerInfo[2]
				tRewardInfo.nHeadId = tPlayerInfo[3]
			else
				tRewardInfo.userName = tPlayerInfo[2]
				tRewardInfo.firstScore = tPlayerInfo[1]
				tRewardInfo.secondScore = tPlayerInfo[4]
			end
		end

		activityInfo.nMyRank = nMyRank
		activityInfo.nMyScore = nMyScore

	elseif activityType == GameActivitiesManager.Type_Money_Shop then
		-- extend
		-- activityInfo.shopType
		-- print("extend = ", extend)
		local shopType = 0
		if extend == nil or extend == "" then
			activityInfo.shopType = 0
			return
		else
			shopType = tonumber(extend) or 0
		end

		activityInfo.shopType = shopType 
		local activityReward = activityInfo.AllMoneyShopData[shopType].rewardData

		for i=1, rewardNum do
			gotList[i] = gotList[i] or 0

			local reward 	= activityReward:getObjectAt(i)
			if reward then 
				-- got == 1 表示已经被领取过
				if gotList[i] >= 1 then
					reward.status = 0
				else
					reward.status = 1
				end
			end
		end
	
	elseif activityType == GameActivitiesManager.Type_New_Continue_Recharge then
		print("Type_New_Continue_Recharge--------------->>>",v)
		activityInfo.progress 	= progress -- 进度 当前进行到第几天了
		activityInfo.extend = tonumber(extend) or 0 -- 储存每天每天对应已充值的金额

		activityInfo.value = activityInfo.extend

		if activityInfo.extend == 0 then
			activityInfo.progress = 0
		end

		print("dayIndex = ", dayIndex)

		for i=1, rewardNum do
			gotList[i]		= gotList[i] or 0
			local reward	= activityReward:getObjectAt(i)
			if reward then
				if gotList[i] >= 1 then
					reward.status = 5 --已领取
				elseif gotList[i] == 0 then
					-- if reward.id < progress then
					-- 	reward.status = 0 --可领取
					-- else
						reward.status = 8
					-- end
				end

				reward.index = i
			end
			print("reward.status = ", reward.status)
		end

		-- print("progress = ", progress)
		-- print("activityInfo.value = ", activityInfo.value)
		-- adasd  = m + 1
	elseif activityType == GameActivitiesManager.Type_Continue_Recharge then
		activityInfo.progress 	= progress -- 进度 当前进行到第几天了
		activityInfo.extend = tonumber(extend) or 0 -- 储存每天每天对应已充值的金额

		local extendtbl = string.split(extend, ',')
		-- local dayIndex  = extendtbl[progress]
		-- -- progress 当前进行到第几天
		-- dayIndex = tonumber(dayIndex) or 0
		activityInfo.value = tonumber(extendtbl[progress]) or 0

		print("dayIndex = ", dayIndex)

		for i=1, rewardNum do
			gotList[i] 		= gotList[i] or 0
			local reward 	= activityReward:getObjectAt(i)
			if reward then 
				if gotList[i] >= 1 then
					reward.status = 5 --已领取
				elseif gotList[i] == 0 then
					if i < progress then
						reward.status = 0 --可领取
					else
						reward.status = 8
					end
				end

				reward.index = i
			end
			print("reward.status = ", reward.status)
		end

		-- print("progress = ", progress)
		-- print("activityInfo.value = ", activityInfo.value)
		-- adasd  = m + 1

	elseif activityType == GameActivitiesManager.Type_Shop_Employ then
		activityInfo.progress 	= progress -- 

		local extendtbl = string.split(extend, '|') -- 当前招募的状态

		activityInfo.employStatus = {}
		for i, v in pairs(extendtbl) do
			local tmp = string.split(v, ',')
			local employTpye 	= tonumber(tmp[1]) or 0
			local employCount 	= tonumber(tmp[2]) or 0
			activityInfo.employStatus[employTpye] = employCount
		end


		for i=1, rewardNum do
			gotList[i] 		= gotList[i] or 0
			local reward 	= activityReward:getObjectAt(i)
			if reward then 
				if gotList[i] >= 1 then
					reward.status = 5 --已领取
				elseif gotList[i] == 0 then
					reward.status = 0 --可领取

					local condition = reward.condition
				  	if condition then
				  		for v in condition:iterator() do
				  			print('v =',v)
				  			local employTpye 	= v.employType
							local employCount 	= v.employNum

							local nowEmployCount = activityInfo.employStatus[employTpye] or 0

							print("----------nowEmployCount = ", nowEmployCount)
							if employCount > nowEmployCount then
								reward.status = 8 --不可领取
							end
				  		end
				  		print("reward.status = ", reward.status)
				  	end
					-- reward.
					-- if i < progress then
					-- 	reward.status = 0 --可领取
					-- else
					-- 	reward.status = 8
					-- end
				end

			end
		end
	elseif activityType == GameActivitiesManager.Type_Continue_Collect_Role then
		if extend and extend ~= "" then
			local goodsInfo 		= string.split(extend,'|')
			local inputGoodsList 	= goodsInfo[1]
			local outGoodsList    	= goodsInfo[2]
			local totalChangeTime 	= tonumber(goodsInfo[3])
			local index 	 		= tonumber(goodsInfo[4])+1

			local reward 	= activityReward:getObjectAt(index)
			if reward then
				reward.status 	= totalChangeTime
				reward.input	= inputGoodsList
				reward.out		= outGoodsList
				reward.changeTime 	= 0;
			end
		end
		for i=1, rewardNum do
			gotList[i] = gotList[i] or 0

			local reward 	= activityReward:getObjectAt(i)
			if reward then 
				reward.changeTime  = gotList[i]
			end
		end
	elseif activityType == GameActivitiesManager.Type_VIP_GIFT then
		for i=1, rewardNum do
			gotList[i] = gotList[i] or 0
			local reward 	= activityReward:getObjectAt(i)
			if reward then 
				reward.gottime = gotList[i]
			end
		end
	elseif activityType == GameActivitiesManager.Type_JiangHuJuHui then
		-- 江湖聚惠
		local tProgress = string.split(extend, ",")

		for i,v in ipairs(tProgress) do
			tProgress[i] = tonumber( v )
		end

		activityInfo.progress = tProgress
	else

		for i=1, rewardNum do

			gotList[i] = gotList[i] or 0

			local reward 	= activityReward:getObjectAt(i)
			if reward then 
				if gotList[i] >= 1 then
					reward.status = 0
				else
					reward.status = 1
				end
			end
		end
	end

end

function GameActivitiesManager:isActivityShowWithInfo(ActivityInfo)
	if ActivityInfo == nil then
		return false
	end

	-- 0、活动强制无效，不显示该活动；1、长期显示该活动 2、自动检测，过期则不显示',
	local status = ActivityInfo.status or 2

	if status == 0 then
		return false

	elseif status == 1 then
		return true
	end

	-- print("--isActivityShow ActivityId = ", ActivityInfo.id)
	-- print("--isActivityShow status = ", status)
	-- print("--isActivityShow ActivityInfo.beginTime = ", ActivityInfo.beginTime)
	-- print("--isActivityShow ActivityInfo.endTime   = ", ActivityInfo.endTime)
	if self:checkTimeIsExpired(ActivityInfo.beginTime, ActivityInfo.endTime) == false then
		if ActivityInfo.type == GameActivitiesManager.Type_Full_Cut and ActivityInfo.sendDataFlag then
			ActivityInfo.sendDataFlag = nil
			TFDirector:send(c2s.BUY_BACK_INFO_REQUEST, {})
		end
		if ActivityInfo.type == GameActivitiesManager.Type_Limit_Shop and ActivityInfo.sendDataFlag then
			ActivityInfo.sendDataFlag = nil
			TFDirector:send(c2s.LIMIT_HOT_INFO_REQUEST, {})
		end
		if ActivityInfo.type == GameActivitiesManager.Type_Group_On and ActivityInfo.sendDataFlag then
			ActivityInfo.sendDataFlag = nil
			TFDirector:send(c2s.GROUPON_INFO_REQUEST, {})
		end
		return true
	else
		return false
	end
end

-- 活动是否显示 true显示 false不显示
function GameActivitiesManager:isActivityShow(ActivityId)
	local ActivityInfo = self:getActivityInfo(ActivityId)

	if ActivityInfo == nil then
		print("check activity show status, can't find activity with id = ", ActivityId)
		return false
	end

	return self:isActivityShowWithInfo(ActivityInfo)

	-- -- 0、活动强制无效，不显示该活动；1、长期显示该活动 2、自动检测，过期则不显示',
	-- local status = ActivityInfo.status or 2

	-- if status == 0 then
	-- 	return false

	-- elseif status == 1 then
	-- 	return true
	-- end

	-- print("--isActivityShow ActivityId = ", ActivityId)
	-- print("--isActivityShow status = ", status)
	-- print("--isActivityShow ActivityInfo.beginTime = ", ActivityInfo.beginTime)
	-- print("--isActivityShow ActivityInfo.endTime   = ", ActivityInfo.endTime)
	-- return not self:checkTimeIsExpired(ActivityInfo.beginTime, ActivityInfo.endTime)
end

-- -- 活动是否显示 true开启 false为未开启
-- function GameActivitiesManager:isActivityOpen(ActivityId)
-- 	local ActivityInfo = self:getActivityInfo(ActivityId)

-- 	if ActivityInfo == nil then
-- 		print("check activity show status, can't find activity with id = ", ActivityId)
-- 		return false
-- 	end
-- end

-- 时间是否过期 false 为没有过期
function GameActivitiesManager:checkTimeIsExpired(startTime, endTime)


	local isExpired = false

	local nowTime = MainPlayer:getNowtime()

	if startTime and nowTime < startTime then
		isExpired = true

	elseif endTime and nowTime > endTime then
		isExpired = true
	end

	return isExpired
end

-- 充值元宝
function GameActivitiesManager:SysceeSupply(rechargeId, rechargeItem)

	print("--------------一笔新充值，充值id = "..rechargeId)
	local sycee = rechargeItem.sycee

	if sycee == 0 then
		sycee = rechargeItem.price * 10
	end

	print("--------- 元宝数 = " .. sycee .. "-----------------")
	for v in self.ActivityInfoList:iterator() do
		if v.type == GameActivitiesManager.Type_Single_Recharge then
			self:UpdateActityDanbiChongzhiRewaerd(v, sycee)
		
		elseif v.type == GameActivitiesManager.Type_Total_Recharge or v.type == GameActivitiesManager.Type_Continue_Recharge then
			-- v.value = v.value + sycee

			if v.type == GameActivitiesManager.Type_Continue_Recharge then
				local activity = v
				local activityReward = activity.activityReward
				local progress = activity.progress or 0 -- 进度 当前进行到第几天了
				print("Debug   activity,",activity)
				print("Debug   activityReward length = ",activityReward:length())
				v.value  = v.value  or 0
				if progress <= activityReward:length() then
					v.value = v.value + sycee
				else
					v.value = 0
					activity.progress = activityReward:length()
				end
				
			else
				v.value = v.value + sycee
			end

		end
	end
end


-- 消耗了多少元宝
function GameActivitiesManager:SysceeExpend(num)
	print("-------------消耗了"..num.."元宝------------")
	--如果某个操作跳过元宝消耗累计
	if self.skipSyceeExpendMark then
		return
	end

	for v in self.ActivityInfoList:iterator() do
		-- 元宝消耗
		if v.type == GameActivitiesManager.Type_Total_Consume then
			v.value = v.value + num
		end
	end
end

--更新一个奖励项
function GameActivitiesManager:UpdateActityDanbiChongzhiRewaerd(activity, sycee)
	if activity == nil then
		return
	end

	if activity.type ~= GameActivitiesManager.Type_Single_Recharge then
		return
	end

	local singleActivityReward = activity.activityReward
	if singleActivityReward == nil then
		return
	end

	local reward = singleActivityReward:objectByID(sycee) --.reward
	if reward then
		if reward.nowPayTimes >= reward.maxtime then
			print("================"..sycee.."档单笔充值已达到最大限制:"..reward.maxtime)
			return
		end

		reward.nowPayTimes = reward.nowPayTimes + 1
		reward.status = reward.status or 0
		reward.status = reward.status + 1
	end
end

function GameActivitiesManager:levelChanged(level)
	for v in self.ActivityInfoList:iterator() do
		-- 元宝消耗
		if v.type == GameActivitiesManager.Type_Team_Level then
			if self:isActivityShow(v.id) then
				v.value = level
			end
		end
	end
	for i=1,3 do
		self:resetFundDataRedPointInVisible(i)
	end
end

function GameActivitiesManager:vipChanged(vip)
	for v in self.ActivityInfoList:iterator() do
		-- 元宝消耗
		if v.type == GameActivitiesManager.Type_VIP then
			if self:isActivityShow(v.id) then
				v.value = vip
			end
		end
	end
end

--更新一个奖励项
function GameActivitiesManager:UpdateActityReward(activity, index)
	local activityType 			= activity.type
	local activityid 			= activity.id
	local singleActivityReward  = activity.activityReward
	if singleActivityReward == nil then
		return
	end

	print("====领取奖励----更新")
	print("activityid 	= ", activityid)
	print("activityType = ", activityType)
	print("====end")

	local reward = singleActivityReward:getObjectAt(index) --.reward

	if reward.status > 0 then
		reward.status 	= reward.status - 1
		print("----更新成功")
	end

end

-- 所有的奖励都被领完了
function  GameActivitiesManager:AllOnlineRewardIsReceived()
	local AllOnlineRewardNum = self:getOnlineRewardCount()

	-- print("AllOnlineRewardNum = ", AllOnlineRewardNum)
	-- print("self.OnlineRewardData.onlineRewardCount = ", self.OnlineRewardData.onlineRewardCount)
	if self.OnlineRewardData.onlineRewardCount >= AllOnlineRewardNum then
		return true
	end

	return false
end

-- 领取在线奖励
function  GameActivitiesManager:requestReceiveOnlineReward()
	if self.OnlineRewardData.onlineRewardCount >= self:getOnlineRewardCount() then
		-- toastMessage("今日在线奖励已领完")
		toastMessage(localizable.GameActivitiesManager_online_yiwan)
		return
	

	elseif not self.OnlineRewardData.timeCount or self.OnlineRewardData.timeCount > 0 then
		-- toastMessage("倒计时未到") --..self.OnlineRewardData.timeCount
		toastMessage(localizable.GameActivitiesManager_online_shijianweidao)
		return
	end

	local OnlineRewardId = self.OnlineRewardData.onlineRewardCount + 1
	
	self:sendMsgToGetActivityReward(self.onlineActivityId, OnlineRewardId)
end


-- 设置在线奖励回调
function GameActivitiesManager:addOnlineRewardListener(logic, id, callback)

	-- if 1 then
	-- 	return
	-- end
	-- 在线奖励功能关闭
	-- local ActivityIsOpen = self:ActivitgIsOpen(EnumActivitiesType.ONLINE_REWARD_NEW)
	if self.ActivityInfoList then
		print("self.ActivityInfoList is not nil")
	end
	print("self.onlineActivityId = ", self.onlineActivityId)
	if self.onlineActivityId == nil then
		return
	end

	local ActivityIsOpen = self:isActivityShow(self.onlineActivityId)
	if ActivityIsOpen == false then
		print("在线奖励功能关闭")
		self:stopTimerAndRemoveListener()
		return
	end

	-- print("self.OnlineRewardData.onlineRewardCount = ", self.OnlineRewardData.onlineRewardCount)
	-- print("self:getOnlineRewardCount() = ", self:getOnlineRewardCount())
	if self.OnlineRewardData.onlineRewardCount >= self:getOnlineRewardCount() then
		-- toastMessage("今日在线奖励已领完")
		self:stopTimerAndRemoveListener()
		return
	end

	if self.onlineRewardPrizeListener == nil then
		self.onlineRewardPrizeListener = TFMapArray:new()
		self.onlineRewardPrizeListener:clear()
	end

	if  self.OnlineRewardData.onlineRewardTimer == nil then
		
		self.OnlineRewardData.onlineRewardTimer = TFDirector:addTimer(1000, -1, nil, 
			function() 
				self:onlineRewardTimerUpdate()
			end)
	end

	local obj = self.onlineRewardPrizeListener:objectByID(id)
	
	if obj then
		obj.handler 			= callback
		obj.logic				= logic
		-- self.onlineRewardPrizeListener:push(obj)
		print("---- 1 addOnlineRewardListener add = ".."id = "..id)
	else
		local timer = {}

		timer.id 				= id
		timer.logic 			= logic
		timer.handler 			= callback
		self.onlineRewardPrizeListener:push(timer)
		print("---- 2 addOnlineRewardListener modify = ".."id = "..id)
	end
end

-- 停止在线奖励定时器
function GameActivitiesManager:removeOnlineRewardTimer(id)
	if self.onlineRewardPrizeListener == nil then
		return
	end

	local obj = self.onlineRewardPrizeListener:objectByID(id)
	if obj then
		self.onlineRewardPrizeListener:removeInMapList(obj)
	end

	if self.onlineRewardPrizeListener:length() <= 0 and self.OnlineRewardData.onlineRewardTimer then

		self:stopTimerAndRemoveListener()
	end
end

-- 
function GameActivitiesManager:onlineRewardTimerUpdate()

	-- print("---------GameActivitiesManager:onlineRewardTimerUpdate-------------")
	if self.onlineRewardPrizeListener == nil or self.OnlineRewardData == nil then
		return
	end

	self.OnlineRewardData.timeCount = self.OnlineRewardData.timeCount - 1
	if self.OnlineRewardData.timeCount < 0 then
		self.OnlineRewardData.timeCount = 0
	end

	if self.newOnlineRewardList then
		for k,v in pairs(self.newOnlineRewardList) do
			v.timeCount = v.timeCount - 1
			if v.timeCount < 0 then
				v.timeCount = 0
			end
		end
	end

	local timedesc = self:TimeConvertString(self.OnlineRewardData.timeCount)

	-- 倒计时奖励可领
	if self.OnlineRewardData.timeCount <= 0 then
		self.bOnlineRewardOnTime = true
		self.OnlineRewardData.onlineRewardRemainingTimes = 0
	end

	--今日奖励已领完
	if self.OnlineRewardData.onlineRewardCount >= self:getOnlineRewardCount() then
		self.bOnlineRewardOnTime = false
		-- 停掉在线奖励定时器
		self:stopTimerAndRemoveListener()
	end

	for v in self.onlineRewardPrizeListener:iterator() do
		-- print("---v = ", v)
		local index = v.id - 3000
		if self.newOnlineRewardList and self.newOnlineRewardList[index] then
			v.timeCount	= self.newOnlineRewardList[index].timeCount
			v.bPrize	= self.bOnlineRewardOnTime  --当前的在线奖励是否可领
			if self.newOnlineRewardList[index-1] then
				v.timeCount	= self.newOnlineRewardList[index].timeCount - self.newOnlineRewardList[index-1].timeCount
			end
			v.desc 		= self:TimeConvertString(v.timeCount)
			if self.bOnlineRewardOnTime then
				if self.OnlineRewardData.onlineRewardCount > index then
					v.bPrize = false
				end
			end
			if v.handler then
				v.handler(v)
			end
		else
			v.desc 		= timedesc
			v.timeCount	= self.OnlineRewardData.timeCount
			v.bPrize	= self.bOnlineRewardOnTime  --当前的在线奖励是否可领
			if v.handler then
				v.handler(v)
			end
		end
	end
end

-- 停掉在线奖励
function GameActivitiesManager:stopTimerAndRemoveListener()
	if self.OnlineRewardData.onlineRewardTimer then
		TFDirector:removeTimer(self.OnlineRewardData.onlineRewardTimer)
		self.OnlineRewardData.onlineRewardTimer = nil
	end

	-- 清空倒计时奖励
	if self.onlineRewardPrizeListener then
		self.onlineRewardPrizeListener:clear()
	end
	
end

-- 在线奖励相关
function GameActivitiesManager:getOnlineRewardCount()
	-- self.onlineActivityId
	if self.onlineActivityId == nil then
		return 0
	end

	local activityInfo  = self:getActivityInfo(self.onlineActivityId)
	if activityInfo == nil then
		print("getOnlineRewardCount, can't find activityid = ", self.onlineActivityId)
		return 0
	end

	local activityType 		= activityInfo.type
	local activityReward 	= activityInfo.activityReward 
	if activityReward == nil then
		print("activityInfo = ", activityInfo)
		print("can't find online reward")
		return 0
	end

	return activityReward:length()
end

function GameActivitiesManager:ActivityOnlineIsOpen()
	if self.onlineActivityId == nil then
		return false
	end

	local activityInfo  = self:getActivityInfo(self.onlineActivityId)
	if activityInfo == nil then
		print("ActivityOnlineIsOpen, can't find activityid = ", self.onlineActivityId)
		return false
	end

	local bIsOnlineOpen = self:isActivityShow(self.onlineActivityId)
	-- print("---GameActivitiesManager:ActivityOnlineIsOpen = ", bIsOnlineOpen)
	return bIsOnlineOpen
end

function GameActivitiesManager:ActivitgIsOpen(activityId)
	return false
end

function GameActivitiesManager:ActivityTypeIsOpen(activityType)
	for v in self.ActivityInfoList:iterator() do
		if v.type == activityType then
			if self:isActivityShowWithInfo(v) == true then
				return true
			end
		end
	end

	return false
end


function GameActivitiesManager:isHaveRewardCanGet(_type)
	if _type == nil then
		_type = 0
	end
	for v in self.ActivityInfoList:iterator() do
		if v.import_show == _type and self:isHaveRewardCanGetByActivity(v) == true then
			print(v.name.."红点")
			return true
		end
	end

	return false
end

function GameActivitiesManager:isHaveRewardCanGetByActivity(activity)
	if activity == nil then
		return false
	end
	
	if activity.type == GameActivitiesManager.Type_jianghumoney then
		if self:getFundDataRedPointForMenuLayer() then
			return true
		else
			return false
		end
	end

	-- 没有表达式 不用显示红点
	if activity.reward and activity.reward == "" then
        return false
    end
	
	-- 活动未开启 
	local bOpen = self:isActivityShowWithInfo(activity)
	if bOpen == false then
		return false
	end

	if activity.activityReward == nil then
		return false
	end

	-- 积分兑换 不做红点
	if activity.type == GameActivitiesManager.Type_Score_Exchange or activity.type == GameActivitiesManager.Type_Score_Egg or
	 activity.type == GameActivitiesManager.Type_Score_XunBao or activity.type == GameActivitiesManager.Type_Tian_Ji_Lun_SCORE or
	 activity.type == GameActivitiesManager.Type_Total_YuanBao or activity.type == GameActivitiesManager.Type_Xia_Ke_Xing_SCORE then
		return false
	end

	-- 钱庄的红点
	if activity.type == GameActivitiesManager.Type_Money_Shop then

		local shopType = activity.shopType or 0
		-- 还没有购买一个钱庄
		if shopType == 0 then
			return false
		end

		local activityReward = activity.AllMoneyShopData[shopType].rewardData
		local rewardNum 	 = activityReward:length()

		for i=1, rewardNum do
			local reward 	= activityReward:getObjectAt(i)
			if reward then 
				local value         = activity.value
			    local status        = reward.status
			    local targetid      = reward.id
				if targetid <= value and status > 0 then
        			return true
        		end
			end
		end

		return false
	end


	
	if activity.type == GameActivitiesManager.Type_New_Continue_Recharge then

		local rewardList    = activity.activityReward
		local rewardCount 	= rewardList:length()

	    for i=1,rewardCount do
	    	local rewardData = rewardList:objectAt(i)

	        local status = self:getActivityRewardStatus(activity.id, rewardData.index )

	        if status ~= nil and status == 0 then
	        	print("activity.id = "..activity.id.."  红点开启")
	        	return true
	        end
	    end
	end

	if activity.type == GameActivitiesManager.Type_ChongzhiRank or
		activity.type == GameActivitiesManager.Type_XiaofeiRank then

		return activity.guaranteeAwardState == 1

	end
	if activity.type == GameActivitiesManager.Type_VIP_GIFT then
		-- print("--------------------->>activity--->>",activity)
		local viplevel = MainPlayer:getVipLevel()
		for reward in activity.activityReward:iterator() do
			if reward.vip == viplevel and reward.cost == 0 then
				return reward.gottime == 0
			end
		end

		return false
	end 

	if activity.type == GameActivitiesManager.Type_Casino then
		return self:isCanCasino(activity.id)
	end

	if activity.type == GameActivitiesManager.Type_Continue_Collect_Role then
		local rewardList    = activity.activityReward
		local rewardCount 	= rewardList:length()
		for i=1,rewardCount do
			local canget = true
	    	local rewardData = rewardList:objectAt(i)
			local exchangeCount = rewardData.status - rewardData.changeTime
			if exchangeCount ~= 0 then
				local temptbl = string.split(rewardData.input,'&')
				for k,v in pairs(temptbl) do
					local reward = string.split(v,',')
					local roleId = tonumber(reward[2])
					local star = tonumber(reward[3])
					local cardRole = CardRoleManager:getRoleById(roleId)
			        if cardRole == nil or cardRole.starlevel < star then
			        	canget = false
			        end
				end
				if canget then
					return true
				end
			end
	    end
		return false
	end
--
	local rewardList    = activity.activityReward
	local rewardCount 	= rewardList:length()

    for i=1,rewardCount do
    	local rewardData = rewardList:objectAt(i)

        local status = self:getActivityRewardStatus(activity.id, rewardData.id )

        if status ~= nil and status == 0 then
        	print("activity.id = "..activity.id.."  红点开启")
        	return true
        end
    end

	return false
end

function GameActivitiesManager:isCanCasino(activityid)
	local activityType = GameActivitiesManager.Type_Casino
	local rewardList  = self:getActivityRewardList(activityid)

	local tolalTimes = rewardList:length()
	local usedTimes  = self:getActivityVaule(activityid)

	local index = usedTimes + 1
	if tolalTimes < index then
		return false
	end

	local ActivityData = self:getActivityData(activityid)
	if ActivityData == nil then
		return false
	end

	local startTime = ActivityData.startTime
	local endTime   = ActivityData.endTime
	local nowTime   = MainPlayer:getNowtime()

	if startTime == nil or endTime == nil then
		return false
	end

	if nowTime < startTime or nowTime > endTime then
		return false
	end


	local rewardData = rewardList:objectAt(index)
	if rewardData == nil then
		return false
	end

	local costNum 	 = rewardData.Num
	if costNum > MainPlayer:getSycee() then
		return false
	end

	return true
end

function GameActivitiesManager:isHaveRewardCanGetByActivityId(activityId)
	local activityInfo  = self:getActivityInfo(activityId)
	if activityInfo == nil then
		return false
	end
	
	local bHaveRedPoint = self:isHaveRewardCanGetByActivity(activityInfo)

	-- print("isHaveRewardCanGetByActivityId activityId 	= ", activityId)
	-- print("isHaveRewardCanGetByActivityId bHaveRedPoint = ", bHaveRedPoint)
	-- print('activityInfo = ',activityInfo)

	return bHaveRedPoint
end

function GameActivitiesManager:openHomeLayer(show_type)
	TFDirector:send(c2s.REQUEST_ACTIVITY_PROGRESS_LIST, {})
	if self.ActivityInfoList == nil then
		-- toastMessage("还没有开启的活动")
		toastMessage(localizable.GameActivitiesManager_no_acitivty)
		return
	end

	if self.ActivityInfoList:length() < 1 then
		-- toastMessage("还没有开启的活动")
		toastMessage(localizable.GameActivitiesManager_no_acitivty)
		return
	end
	if show_type == nil then
		show_type = 0
	end
	-- local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.gameactivity.OpenServiceHomeLayer", AlertManager.BLOCK_AND_GRAY)
	local layer = require("lua.logic.gameactivity.OpenServiceHomeLayer"):new(show_type)
	AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY)
    layer:select(1)
    AlertManager:show()
end

-- 时间转换
function GameActivitiesManager:TimeConvertString(time)
	if time <= 0 then
		return "00:00:00"
	end

	local hour = math.floor(time/3600)
	local min  = math.floor((time-hour * 3600)/60)
	local sec  = math.mod(time, 60)
	return string.format("%02d:%02d:%02d", hour, min, sec)
end

function GameActivitiesManager:getOpenActivityList()
	local activityList = {}
	local num = 0
	for v in self.ActivityInfoList:iterator() do
		if self:isActivityShowWithInfo(v) then
			num = num + 1
			activityList[num] = v.id
		end
	end

	return activityList, num
end
function GameActivitiesManager:getOpenAndShowActivityList(isshow)
	local activityList = {}
	local num = 0
	for v in self.ActivityInfoList:iterator() do
		if self:isActivityShowWithInfo(v) and v.type ~= GameActivitiesManager.Type_Ten_Orange and v.type ~= GameActivitiesManager.Type_JiangHuJuHui then
			local show = v.import_show or 0
			if isshow == show then
				num = num + 1
				activityList[num] = v.id
			end
		end
	end

	return activityList, num
end

function GameActivitiesManager:getRewardItemDesc(activityType)
	local desc1 = ""
	local desc2 = ""
	local path  = ""

	-- 累冲好礼
	if activityType == GameActivitiesManager.Type_Total_Recharge then
    	desc1  = localizable.GameActivitiesManager_leijichongzhi --"累计充值"
    	desc2  = localizable.GameActivitiesManager_yuanbao -- "元宝"
    	path   = path .. "lchl.png"

    -- 充值回馈
    elseif activityType == GameActivitiesManager.Type_Single_Recharge then
    	desc1  = localizable.GameActivitiesManager_danbichongzhi -- "单笔充值"
    	desc2  = localizable.GameActivitiesManager_yuanbao -- "元宝"
    	path   = path .. "czfk.png"

	-- LEIJIXIAOFEI				= ,			--累计消费
    -- 消费返礼
   	elseif activityType == GameActivitiesManager.Type_Total_Consume then
    	desc1  = localizable.GameActivitiesManager_leijixiaofei --"累计消费"
    	desc2  = localizable.GameActivitiesManager_yuanbao -- "元宝"
    	path   = path .. "xffl.png"

	-- LIANXUDENGLU				= ,			--连续登陆
    -- 连续登陆
   	elseif activityType == GameActivitiesManager.Type_Continue_Login then
    	desc1  = localizable.GameActivitiesManager_tianshu --"连续天数"
    	desc2  = ""
    	path   = path .. "lxdl.png"
   	elseif activityType == GameActivitiesManager.Type_Continue_Server_Login then
    	desc1  = localizable.GameActivitiesManager_tianshu --"连续天数"
    	desc2  = ""
    	path   = path .. "lxdl.png"

    elseif activityType == GameActivitiesManager.Type_Normal_Login then
    	desc1  = localizable.GameActivitiesManager_denglu --"登录第"
    	desc2  = localizable.GameActivitiesManager_day --"天"
    	path   = "ui_new/operatingactivities/yy_0011.png"

    elseif activityType == GameActivitiesManager.Type_Team_Level then
    	desc1  = localizable.GameActivitiesManager_dengji --"等级达到"
    	desc2  = ""
    	path   = "ui_new/operatingactivities/yy_0061.png"

    elseif activityType == GameActivitiesManager.Type_New_Continue_Recharge then
    	desc1  = localizable.GameActivitiesManager_direnyichong --"第%d天累充"
    	desc2  = ""--localizable.GameActivitiesManager_yuanbao -- "元宝"
    	path   = ""
    elseif activityType == GameActivitiesManager.Type_Continue_Recharge then
    	desc1  = localizable.GameActivitiesManager_dijitianleichong --"第%d天累充"
    	desc2  = localizable.GameActivitiesManager_yuanbao -- "元宝"
    	path   = ""

   elseif activityType == GameActivitiesManager.Type_Shop_Employ then
    	--desc1  = "第%d天..."
    	desc1 = localizable.GameActivitiesManager_dijitian
    	desc2  = "11元宝"
    	path   = ""

    end

	return desc1, desc2, path
end

function GameActivitiesManager:autoReset()
	for v in self.ActivityInfoList:iterator() do
		-- local .resetCron
		print("resetCron =  ", v.resetCron)
	end
end


function GameActivitiesManager:sendMsgToGetActivityUpdate(activityid)
	TFDirector:send(c2s.REQUEST_ACTIVITY_PROGRESS, {activityid})
end

function GameActivitiesManager:sendMsgToBuyMoneyShop(activityid, type)
	-- showLoading()
	TFDirector:send(c2s.REQUEST_BUY_MONEY_SHOP, {type, activityid})
end


function GameActivitiesManager:ActivityWithType(activityType,isActive)
	local curTime = 0
	if isActive == true then
		curTime = MainPlayer:getNowtime()
	end
	for v in self.ActivityInfoList:iterator() do
		if v.type == activityType then
			-- if self:isActivityShowWithInfo(v) == true then
			-- 	return v
			-- end
			if isActive == true then
				if curTime < v.endTime then
					return v
				end
			else
				return v
			end
		end
	end

	return nil
end

-- 获取活动里面的奖品列表
function GameActivitiesManager:getActivityMoneyShopData(ActivityId)
	local activity = self:getActivityInfo(ActivityId)
	if activity and activity.type == GameActivitiesManager.Type_Money_Shop then
		return activity.monyShopData
	end
	
	return  {}
end


function GameActivitiesManager:bShowGoldEgg()
	for ActivityInfo in self.ActivityInfoList:iterator() do
		if ActivityInfo.type == self.Type_Hit_Egg then
			if ActivityInfo.beginTime and ActivityInfo.endTime and ActivityInfo.beginTime < ActivityInfo.endTime then
			    -- 即将开启 不显示
				if MainPlayer:getNowtime() < ActivityInfo.beginTime then
					return true
				end
			end

			return false
		end
	end

	return false
end

function GameActivitiesManager:getDateString(time1, time2, status)

    local function getTimeText(timestamp)
		if not timestamp then
	        return
	    end

	    local date   = GetCorrectDate("*t", timestamp)

	    --return date.month.."月"..date.day.."日"..date.hour.."时"..date.min.."分"
	    return stringUtils.format(localizable.common_time_4, date.month, date.day, date.hour, date.min)
    end

    local timeDesc  = ""

    local startTime = ""
    local endTime   = ""

    -- 0、活动强制无效，不显示该活动；1、长期显示该活动 2、自动检测，过期则不显示',
    local status = status or 1

    if status == 1 then
        --timeDesc = "永久有效"
        timeDesc = localizable.common_time_longlong
    else
        if time1 then
            startTime = getTimeText(time1)
        end
        if time2 then
            endTime   = getTimeText(time2)
        end

        timeDesc = startTime .. " - " .. endTime
    end

    return timeDesc
end

function GameActivitiesManager:fundDataEvent(event)
	local fundDataTbl = event.data.fundInfo or {}
	local baseData = {}

	for _,v in pairs(fundDataTbl) do
		baseData[v.fundId] = v.status
	end

	local currLevel = MainPlayer:getLevel()
	local limitLevel = ConstantData:objectByID("FundBuyLevel").value or 40

	self.fundDataRedPoint = {false,false,false}
	local isHaveRed = false
	for data in FundData:iterator() do
		data.status = baseData[data.id]
		if (data.status == 1 and currLevel >= data.return_level) then
			self.fundDataRedPoint[tonumber(data.type)] = true			
		end
		if data.status ~= 0 then
			isHaveRed = true
		end
    end

    --如果没有购买通宝 则最后一个显示红点
    if isHaveRed == false then
    	self.fundDataRedPoint[3] = true
    end
end

function GameActivitiesManager:getfundDataByType(type)
	local data = {}
	for item in FundData:iterator() do
		if item.type == type then
			table.insert(data, item)
		end
    end

    -- print('1111111111111111111data = ',data)
    local function cmp( v1, v2 )
    	if v1.status == v2.status then
    		return v1.id < v2.id
    	elseif v1.status == 2 then
    		return false
    	else
    		return true
		end
    end

    table.sort(data, cmp)
    return data
end

function GameActivitiesManager:requestBuyFundDataEvent( type )
	showLoading()
	self.BuyFundDataEventType = type
	TFDirector:send(c2s.BUY_FUND_REQUEST,{type})
end

function GameActivitiesManager:buyFundDataEvent( event )
	hideLoading()

	for data in FundData:iterator() do
		if data.type == self.BuyFundDataEventType then
			data.status = 1
		end
    end
    self.BuyFundDataEventType = nil
    toastMessage(localizable.Activity_jianghumoney_Buy_Success)

    for i=1,3 do
	    self:resetFundDataRedPointInVisible(i)
	end

	TFDirector:dispatchGlobalEventWith(GameActivitiesManager.MSG_ACTIVITY_FUND_DATA_UPDATE, {})
end

function GameActivitiesManager:requestRewardFundDataEvent( id )
	showLoading()
	self.BuyFundDataEventID = id
	print("requestRewardFundDataEvent = ",id)
	TFDirector:send(c2s.REWARD_FUND_REQUEST,{id})
end

function GameActivitiesManager:rewardFundDataEvent( event )
	hideLoading()
	for data in FundData:iterator() do
		if data.id == self.BuyFundDataEventID then
			data.status = 2
		end
    end
    self.BuyFundDataEventID = nil

    for i=1,3 do
	    self:resetFundDataRedPointInVisible(i)
	end

	TFDirector:dispatchGlobalEventWith(GameActivitiesManager.MSG_ACTIVITY_FUND_DATA_UPDATE, {})

end

function GameActivitiesManager:getFundDataRedPointForMenuLayer()
	
	for i=1,3 do
		if self:getFundDataRedPointByType(i) then
			return true
		end
	end
	return false
end

function GameActivitiesManager:getFundDataRedPointByType( type )

	-- print('self.fundDataRedPoint[type] = ',type)
	-- print('self.fundDataRedPoint[type] = ',self.fundDataRedPoint)
	if self.fundDataRedPoint[type] then
		return true
	end
    return false
end

function GameActivitiesManager:resetFundDataRedPointInVisible(type)

	print('self.fundDataRedPoint = ',self.fundDataRedPoint)
	self.fundDataRedPoint[type] = false

	local currLevel = MainPlayer:getLevel()
	local limitLevel = ConstantData:objectByID("FundBuyLevel").value or 40

	for data in FundData:iterator() do
		if data.type == type and (data.status == 1 and currLevel >= data.return_level) then
			self.fundDataRedPoint[type] = true
			break;
		end
    end
   
    TFDirector:dispatchGlobalEventWith(GameActivitiesManager.MSG_ACTIVITY_FUND_DATA_UPDATE, {})
    -- TFDirector:dispatchGlobalEventWith(self.MSG_ACTIVITY_UPDATE, {})
end

function GameActivitiesManager:isBuyOtherFundData(index)
	for data in FundData:iterator() do
		if data.type ~= index and data.status == 1 then
			return true
		end
    end 
    return false
end

--获取激活的按钮
function GameActivitiesManager:getFundDataActivityIndex()
	for data in FundData:iterator() do
		if data.status == 1 then
			return data.type
		end
    end
    return 1
end

function GameActivitiesManager:getActivityInfoByType( Type )
	for v in self.ActivityInfoList:iterator() do
		if v.type == Type then
			return v
		end
	end
end

function GameActivitiesManager:limitHotInfoResponseEvent( event )
	print("event.data = ",event.data)

	local activityInfo = self:getActivityInfoByType(GameActivitiesManager.Type_Limit_Shop)
	if activityInfo == nil then
		return
	end
	local template = event.data.config or {}
	local dataInfo = event.data.dataInfo or {}
	-- print("template = ",template)
	-- print("now = ",MainPlayer:getNowtime())
	-- p.p = 1
	local singleActivityReward = activityInfo.activityReward
	if singleActivityReward then
		singleActivityReward:clear()
	end

	local function gethotDataInfoById( id )
		for k,v in pairs(dataInfo) do
			if v.id == id then
				return v
			end
		end
		return nil
	end

	for k,v in pairs(template) do		
		local rewardid 		= v.id
		local price 		= v.price
		local nowPrice		= v.currentPrice
		local serverNumMax	= v.goodsLimit
		local selfNumMax	= v.customerLimit
		local serverBuyNum  = 0
		local selfBuyNum    = 0
		local discount 		= v.discount
		local beginTime = v.beginTime
		local endTime = v.endTime		

		local rewardList = MEArray:new()
		local tempRewardtbl = string.split(v.goods,'|')
		for k2,v2 in pairs(tempRewardtbl) do
			local reward = string.split(v2,',')
			if reward then
				local commonReward = {}
				commonReward.type 	= tonumber(reward[1])
				commonReward.itemId = tonumber(reward[2])
				commonReward.number = tonumber(reward[3])
				rewardList:push(BaseDataManager:getReward(commonReward))
			end
		end

		local _dataInfo = gethotDataInfoById(v.id)
		if _dataInfo then
			serverBuyNum = _dataInfo.serverCurrent
			selfBuyNum = _dataInfo.current
		end

		local activityRewardData = {
			id 			= rewardid,
			price 		= price,		--原价
			nowPrice  	= nowPrice,		--现价
			serverNumMax= serverNumMax, --服务器上限
			selfNumMax  = selfNumMax,   --个人购买上限
			serverBuyNum= serverBuyNum,	--服务器已购买数量
			selfBuyNum  = selfBuyNum,	--个人已购买数量
			rewardItems	= rewardList,   --当前出售物品	
			discount    = discount, 	--折扣	
			beginTime = beginTime,
			endTime = endTime,		
		}
		singleActivityReward:pushbyid(rewardid,activityRewardData)
	end
	TFDirector:dispatchGlobalEventWith(GameActivitiesManager.MSG_LIMIT_HOT_UPDATE,{})
end

function GameActivitiesManager:limitHotInfoBuyUpdateEvent( event )
	local dataInfo = event.data.dataInfo or {}
	local activityInfo = self:getActivityInfoByType(GameActivitiesManager.Type_Limit_Shop)
	if activityInfo == nil then
		return
	end
	local activityReward = activityInfo.activityReward:objectByID(dataInfo.id)
	if activityReward == nil then
		return
	end
	activityReward.serverBuyNum = dataInfo.serverCurrent
	activityReward.selfBuyNum = dataInfo.current

	TFDirector:dispatchGlobalEventWith(GameActivitiesManager.MSG_LIMIT_HOT_UPDATE,{})
end

function GameActivitiesManager:sendLimitHotInfoBuyMsg( goodsId,num )
	self.closeLimitHotShopLayerFlag = true
	TFDirector:send(c2s.LIMIT_HOT_BUY_REQUEST, {goodsId,num})
end

function GameActivitiesManager:checkNeedCloseLimitHotShopLayer()
	if self.closeLimitHotShopLayerFlag then
		self.closeLimitHotShopLayerFlag = nil
		return true
	end
	return false
end

function GameActivitiesManager:fullCutInfoEvent( event )
	local activityInfo = self:getActivityInfoByType(GameActivitiesManager.Type_Full_Cut)
	if activityInfo == nil then
		return
	end
	local config = event.data.config or {}
	local rewardConfig = event.data.rewardConfig or {}
	local historyInfo = event.data.historyInfo or {}
	local consumeNum = event.data.consumeNum or 0
	local rewardId = event.data.rewardId or 0
	local buyBack = event.data.buyBack or "1_1"
	local buyBackData = event.data.buyBackData or {}
		
	--买几反几
	buyBackTbl = stringToNumberTable(buyBack, "_")
	activityInfo.buyNumber = buyBackTbl[1]
	activityInfo.backNumber = buyBackTbl[2]

	local singleActivityReward = activityInfo.activityReward
	if singleActivityReward then
		singleActivityReward:clear()
	end
	--消费的元宝数量
	activityInfo.consumeNum = consumeNum

	--返现元宝配置
	if activityInfo.moneyBackList == nil then
		activityInfo.moneyBackList = MEMapArray:new()
	end
	activityInfo.moneyBackList:clear()
	for k,v in pairs(rewardConfig) do
		print("v = ",v)
		local data = {}
		data.id = v.id
        data.title = stringUtils.format(localizable.activity_BuyBack,v.consumeNum,v.rewardNum)
        data.currNum = consumeNum
        data.totalNum = v.consumeNum
        if data.currNum >= data.totalNum then
            data.state = 1
        else
            data.state = 0
        end
        activityInfo.moneyBackList:push(data)
	end
	local function sortF(a,b)
        if a.state == b.state then
            return a.id < b.id
        else
            return a.state < b.state
        end
    end
    activityInfo.moneyBackList:sort(sortF)

    local function getCurrentBuyNumber( id )
    	for _,v in pairs(buyBackData) do
    		if v.id == id then
    			return v.current
    		end
    	end
    	return 0
    end
	--商品配置信息
	for k,v in pairs(config) do		
		local rewardid 		= v.id
		local price 		= v.price
		local nowPrice		= v.currentPrice
		local discount 		= v.discount
		local customerLimit = v.customerLimit
		local currentNum    = getCurrentBuyNumber(rewardid)
		local beginTime = v.beginTime
		local endTime = v.endTime

		local rewardList = MEArray:new()
		local tempRewardtbl = string.split(v.goods,'|')
		for k2,v2 in pairs(tempRewardtbl) do
			local reward = string.split(v2,',')
			if reward then
				local commonReward = {}
				commonReward.type 	= tonumber(reward[1])
				commonReward.itemId = tonumber(reward[2])
				commonReward.number = tonumber(reward[3])
				rewardList:push(BaseDataManager:getReward(commonReward))
			end
		end	

		local activityRewardData = {
			id 			= rewardid,
			price 		= price,		--原价
			nowPrice  	= nowPrice,		--现价
			rewardItems	= rewardList,   --当前出售物品	
			discount 	= discount,		--折扣			
			customerLimit 	= customerLimit,		--个人限购			
			currentNum 	= currentNum,		--个人购买次数	
			beginTime = beginTime,
			endTime	= endTime,
		}
		singleActivityReward:pushbyid(rewardid,activityRewardData)
	end

	--历史记录
	if activityInfo.buyList == nil then
		activityInfo.buyList = MEMapArray:new()
	end
	activityInfo.buyList:clear()
	if activityInfo.buyBackList == nil then
		activityInfo.buyBackList = MEMapArray:new()
	end
	activityInfo.buyBackList:clear()
	-- print("historyInfo = ",historyInfo)

	for k,v in pairs(historyInfo) do
		local data = {}
		local goods = singleActivityReward:objectByID(v.id)
		-- print("goods = ",goods)
		if goods and goods.rewardItems then
			local item = goods.rewardItems:objectAt(1)
			-- print("item = ",item)
			data.item = item
			data.time = v.time
			if v.type == 0 then
				--购买历史
				activityInfo.buyList:push(data)		
			else
				--获赠历史
				activityInfo.buyBackList:push(data)
			end
		end
	end
	-- print("activityInfo.buyList = ",activityInfo.buyList)
	-- print("activityInfo.buyBackList = ",activityInfo.buyBackList)
	-- p.p =1
    activityInfo.buyList:sort(function(a,b) return a.time > b.time end)
    activityInfo.buyBackList:sort(function(a,b) return a.time > b.time end)

    TFDirector:dispatchGlobalEventWith(GameActivitiesManager.MSG_FULL_CUT_UPDATE,{})
end

function GameActivitiesManager:fullCutBuyEvent( event )
	hideLoading()
	local activityInfo = self:getActivityInfoByType(GameActivitiesManager.Type_Full_Cut)
	if activityInfo == nil then
		return
	end
	print("event.data = ",event.data)
	local singleActivityReward = activityInfo.activityReward
	local historyInfo = event.data.historyInfo or {}
	local buyBackData = event.data.buyBackData or {}

	for k,v in pairs(historyInfo) do
		local data = {}
		local goods = singleActivityReward:objectByID(v.id)
		if goods and goods.rewardItems then
			local item = goods.rewardItems:objectAt(1)
			data.item = item
			data.time = v.time
			if v.type == 0 then
				--购买历史
				activityInfo.buyList:pushFront(data)		
			else
				--获赠历史
				activityInfo.buyBackList:pushFront(data)
			end
		end
	end
	if activityInfo.consumeNum == event.data.consumeNum then
		return 
	end
	activityInfo.consumeNum = event.data.consumeNum
	if activityInfo.moneyBackList then
		for v in activityInfo.moneyBackList:iterator() do
	        v.currNum = activityInfo.consumeNum
	        if v.currNum >= v.totalNum then
	            v.state = 1
	        else
	            v.state = 0
	        end
		end
		local function sortF(a,b)
	        if a.state == b.state then
	            return a.id < b.id
	        else
	            return a.state < b.state
	        end
	    end
	    activityInfo.moneyBackList:sort(sortF)
	end

	local goods = singleActivityReward:objectByID(buyBackData.id)
	if goods then
		goods.currentNum = buyBackData.current
	end
	TFDirector:dispatchGlobalEventWith(GameActivitiesManager.MSG_FULL_CUT_UPDATE,{})
end

function GameActivitiesManager:requestFullCutBuyMsg( id,num )
	showLoading()
	TFDirector:send(c2s.BUY_BACK_BUY_REQUEST, {id,num})
end

function GameActivitiesManager:moneyBackReset_24()
	local activityInfo = self:getActivityInfoByType(GameActivitiesManager.Type_Full_Cut)
	if activityInfo == nil then
		return
	end
	activityInfo.consumeNum = 0
	for v in activityInfo.moneyBackList:iterator() do
        v.currNum = activityInfo.consumeNum
        if v.currNum >= v.totalNum then
            v.state = 1
        else
            v.state = 0
        end
	end
	local function sortF(a,b)
        if a.state == b.state then
            return a.id < b.id
        else
            return a.state < b.state
        end
    end
    activityInfo.moneyBackList:sort(sortF)
end

--团购活动
function GameActivitiesManager:grouponInfoEvent( event )
	local activityInfo = self:getActivityInfoByType(GameActivitiesManager.Type_Group_On)
	if activityInfo == nil then
		return
	end
	local config = event.data.config or {}
	local grouponInfo = event.data.grouponInfo or {}

	local singleActivityReward = activityInfo.activityReward
	if singleActivityReward then
		singleActivityReward:clear()
	end

    local function getBuyInfo( id )
    	for _,v in pairs(grouponInfo) do
    		if v.id == id then
    			return v
    		end
    	end
    	return nil
    end
	--商品配置信息
	for k,v in pairs(config) do		
		local rewardid 		= v.id
		local price 		= v.price
		local discount 		= v.discount
		local selfBuyLimitNum = v.customerLimit
		local serverBuyLimitNum = v.count
		local beginTime = v.beginTime
		local endTime = v.endTime

		local _nowPrice = string.split(v.grouponPrice,';')
		local priceTbl = {}
		for k2,v2 in pairs(_nowPrice) do
			local itemData = stringToNumberTable(v2,"_")
			priceTbl[#priceTbl+1] = {num = itemData[1], price = itemData[2]}
		end

		local rewardList = MEArray:new()
		local tempRewardtbl = string.split(v.goods,'|')
		for k2,v2 in pairs(tempRewardtbl) do
			local reward = string.split(v2,',')
			if reward then
				local commonReward = {}
				commonReward.type 	= tonumber(reward[1])
				commonReward.itemId = tonumber(reward[2])
				commonReward.number = tonumber(reward[3])
				rewardList:push(BaseDataManager:getReward(commonReward))
			end
		end	

		--记录
		local goodsBuyInfo  = getBuyInfo(rewardid)
		local selfBuyCurrentNum = 0
		local serverBuyCurrentNum = 0
		local isEnd = false
		local playerList = {}
		if goodsBuyInfo then
			if goodsBuyInfo.myInfo then
				selfBuyCurrentNum = goodsBuyInfo.myInfo.num
			end
			serverBuyCurrentNum = goodsBuyInfo.totalCount
			isEnd = goodsBuyInfo.isEnd
			playerList = goodsBuyInfo.playerInfo
		end

		local activityRewardData = {
			id 			= rewardid,
			price 		= price,		--原价
			priceTbl	= priceTbl,
			rewardItems	= rewardList,   --当前出售物品	
			discount 	= discount,		--折扣			
			selfBuyLimitNum 	= selfBuyLimitNum,		--个人限购			
			selfBuyCurrentNum 	= selfBuyCurrentNum,		--个人购买次数			
			serverBuyLimitNum 	= serverBuyLimitNum,		--整轮团购数量上限			
			serverBuyCurrentNum 	= serverBuyCurrentNum,		--服务器购买数量	
			isEnd 	= isEnd,		--整轮团购数量上限			
			playerList 	= playerList,		--整轮团购购买历史记录
			beginTime = beginTime,
			endTime = endTime,
		}
		singleActivityReward:pushbyid(rewardid,activityRewardData)
	end

    TFDirector:dispatchGlobalEventWith(GameActivitiesManager.MSG_GROUP_ON_UPDATE,{})
end

function GameActivitiesManager:requestGrouponBuy( id, num )
	self.closeGrouponShopLayerFlag = true
	-- print("id = ",id)
	-- print("num = ",num)
	TFDirector:send(c2s.GROUPON_BUY_REQUEST, {id,num})
end

function GameActivitiesManager:rechargeConsumeEvent( event )
	local activityInfo = event.data.activityInfo or {}
	for i,v in ipairs(activityInfo) do
		local activityInfo = self:getActivityInfo(v.activityId)
		activityInfo.guaranteeAwardState = v.status  --保底奖励状态   0是不可领，1是可领但未领，2是已领取
	end

	TFDirector:dispatchGlobalEventWith(GameActivitiesManager.UPDATERERECHARGECONSUME)
end
function GameActivitiesManager:grouponBuyEvent( event )
	hideLoading()
	local activityInfo = self:getActivityInfoByType(GameActivitiesManager.Type_Group_On)
	if activityInfo == nil then
		return
	end
	-- print("grouponBuyEvent = ",event.data)
	local grouponInfo = event.data.grouponInfo or {}
	local singleActivityReward = activityInfo.activityReward
	
	for k,v in pairs(grouponInfo) do
		if v.isSettle then
			local goods = singleActivityReward:objectByID(v.id)
			if goods then
				goods.isEnd = v.isEnd
				goods.playerList = {}
				goods.serverBuyCurrentNum = 0
				goods.selfBuyCurrentNum = 0
			end
		else
			local goods = singleActivityReward:objectByID(v.id)
			if goods then
				goods.serverBuyCurrentNum = v.totalCount			
				goods.isEnd = v.isEnd
				goods.playerList = goods.playerList or {}
				local playerData = v.playerInfo[1]
				local needPushData = true
				for k,v1 in pairs(goods.playerList) do
					if v1.playerId == playerData.playerId then
						v1.name = playerData.name
						v1.guildName = playerData.guildName
						v1.num = playerData.num
						needPushData = false
						if v1.playerId == MainPlayer:getPlayerId() then
							goods.selfBuyCurrentNum = playerData.num
						end
						break
					end
				end
				if needPushData then
					table.insert(goods.playerList, playerData)
					if playerData.playerId == MainPlayer:getPlayerId() then
						goods.selfBuyCurrentNum = playerData.num
					end
				end
			end
		end
	end
	TFDirector:dispatchGlobalEventWith(GameActivitiesManager.MSG_GROUP_ON_UPDATE,{})
end

function GameActivitiesManager:getMyGrouponList()
	local groupList = MEArray:new()
	local activityInfo = self:getActivityInfoByType(GameActivitiesManager.Type_Group_On)
	if activityInfo then
		local singleActivityReward = activityInfo.activityReward
		for v in singleActivityReward:iterator() do
			if v.selfBuyCurrentNum and v.selfBuyCurrentNum > 0 then
				groupList:push(v)
			end
		end
	end
	return groupList	
end

function GameActivitiesManager:getGrouponHistoryList(id)
	local dataList = {}
	local activityInfo = self:getActivityInfoByType(GameActivitiesManager.Type_Group_On)
	if activityInfo then
		local singleActivityReward = activityInfo.activityReward
		for v in singleActivityReward:iterator() do
			if v.id == id then
				dataList = v.playerList or {}
				break
			end
		end
	end
	return dataList	
end

function GameActivitiesManager:checkNeedCloseGrouponShopLayer()
	if self.closeGrouponShopLayerFlag then
		self.closeGrouponShopLayerFlag = nil
		return true
	end
	return false
end

function GameActivitiesManager:getRewardItemByActivityType( activityType )
	local list = MEMapArray:new()
	local info = self:getActivityInfo(activityType) or {}
	local rewardList = info.activityReward
	if rewardList == nil then
		return list
	end
	local nowTime = MainPlayer:getNowtime()
	local function checkItemIsActivity( item )
		print("item.beginTime = ",item.beginTime)
		print("item.endTime = ",item.endTime)
		print("item.nowTime = ",nowTime)
		if item.beginTime == nil or item.endTime == nil then
			return true
		end
		if nowTime >= item.beginTime and nowTime < item.endTime then
			return true
		end
		return false
	end	
	for v in rewardList:iterator() do
		if checkItemIsActivity(v) then
			list:push(v)
		end
	end

	return list
end

function GameActivitiesManager:getActivityOnLineTime(activityType)
	local rechargeCardTime = 0
	for v in self.ActivityInfoList:iterator() do
		if v.type == activityType then
			if self:isActivityShowWithInfo(v) == true then
				rechargeCardTime = (v.endTime)
				return rechargeCardTime
			end
		end
	end
	
	return rechargeCardTime	
end
return GameActivitiesManager:new()