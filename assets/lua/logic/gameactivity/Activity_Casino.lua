
local Activity_Casino = class("Activity_Casino", BaseLayer)

function Activity_Casino:ctor(data)
    self.super.ctor(self)
    -- self.type = EnumActivitiesType.DUCHANG
    self.id   = data
    self.type =OperationActivitiesManager.Type_Casino
    self:init("lua.uiconfig_mango_new.operatingactivities.duchang")
end

function Activity_Casino:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function Activity_Casino:initUI(ui)
    self.super.initUI(self,ui)

    -- 剩余时间
    self.txt_remaintime = TFDirector:getChildByPath(ui, 'txt_remaintime')

    -- 元宝
    self.txt_cost = TFDirector:getChildByPath(ui, 'txt_cost')

    -- 剩余次数
    self.txt_times = TFDirector:getChildByPath(ui, 'txt_times')

    self.btn_duqian = TFDirector:getChildByPath(ui, 'btn_duqian')
    self.btn_duqian.logic = self
end

function Activity_Casino:setLogic(logic)
    self.logic = logic
end

function Activity_Casino:registerEvents()
    self.super.registerEvents(self)


	self.btn_duqian:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClick))

	if self.Timer == nil then
		self.Timer = TFDirector:addTimer(1000, -1, nil, 
				function() 
					self:timeUpdate()
				end)
	end

	print("------------------Activity_Casino:registerEvents-----------")
	self.activityUpdateCallBack = function(event)
		self.callRefresh = false
        self:refreshUI()
        if self.callRefresh == false and self.logic then
        	self.logic:reloadTableView()
        end
    end

    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD, self.activityUpdateCallBack)

end

function Activity_Casino:removeEvents()
    self.super.removeEvents(self)

	if self.Timer then
		TFDirector:removeTimer(self.Timer)
		self.Timer = nil
	end

	print("------------------Activity_Casino:removeEvents-----------")
	TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD, self.activityUpdateCallBack)
    self.activityUpdateCallBack = nil
end

function Activity_Casino:refreshUI()

	print("---------Activity_Casino:refreshUI----------")
	local rewardList  = OperationActivitiesManager:getActivityRewardList(self.id)

	local tolalTimes = rewardList:length()
	local usedTimes  = OperationActivitiesManager:getActivityVaule(self.id)

	self.txt_times:setText(tolalTimes-usedTimes)

	local index = usedTimes + 1
	if index > tolalTimes then
		index = tolalTimes
	end
	self.index = index
	self.tolalTimes = tolalTimes
	self.usedTimes  = usedTimes

	local rewardData = rewardList:objectAt(index)
	if rewardData == nil then
		CommonManager:setRedPoint(self.btn_duqian, false,"Activity_Casino",ccp(0,0))
		return
	end

	local Num 	 = rewardData.Num
	self.txt_cost:setText(Num)

	self.costNum = Num

	self:timeUpdate()
end

function Activity_Casino:timeUpdate()
	-- print("Activity_Casino:timeUpdate")
	local ActivityData = OperationActivitiesManager:getActivityData(self.id)
	if ActivityData == nil then
		CommonManager:setRedPoint(self.btn_duqian, false,"Activity_Casino",ccp(0,0))
		return
	end
	
	local startTime = ActivityData.startTime
	local endTime   = ActivityData.endTime
	local nowTime   = MainPlayer:getNowtime()

	-- print("startTime= ", startTime)
	-- print("endTime  = ", endTime)
	if startTime == nil or endTime == nil then
		CommonManager:setRedPoint(self.btn_duqian, false,"Activity_Casino",ccp(0,0))
		return
	end
	local redPoint = self.tolalTimes > self.usedTimes
	redPoint = redPoint and (self.costNum <= MainPlayer:getSycee())
	if nowTime >= startTime and nowTime <= endTime then
		self.btn_duqian:setTouchEnabled(true)
		self.btn_duqian:setGrayEnabled(false)
		local time = endTime-nowTime
		-- print("time = ", time)
		if time > 0 then
			local timeDesc = OperationActivitiesManager:TimeConvertString(time)
			self.txt_remaintime:setText(timeDesc)
			redPoint = redPoint and true
		else
			redPoint = false
			self.txt_remaintime:setText("00:00:00")
			if self.logic then
				self.logic:activityUpdate()
				self.callRefresh = true
			end

			if self.Timer then
				TFDirector:removeTimer(self.Timer)
				self.Timer = nil
			end
		end
	else
		self.txt_remaintime:setText("00:00:00")
		self.btn_duqian:setTouchEnabled(false)
		self.btn_duqian:setGrayEnabled(true)
		redPoint = false
	end
	CommonManager:setRedPoint(self.btn_duqian, redPoint,"Activity_Casino",ccp(0,0))
end

function Activity_Casino.onClick(sender)
	local self = sender.logic

    if self.costNum > MainPlayer:getSycee() then
    	--toastMessage("您的元宝不足")
    	toastMessage(localizable.common_your_yuanbao)
    	return
    end
    if self.tolalTimes == self.usedTimes then
    	--toastMessage("您的次数已用完")
    	toastMessage(localizable.common_your_times)
    	return
    end

   	OperationActivitiesManager:sendMsgToGetActivityReward(self.id, self.index, true)
end


return Activity_Casino