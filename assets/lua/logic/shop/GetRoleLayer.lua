
local GetRoleLayer = class("GetRoleLayer", BaseLayer)

-- local yuanBaoCost = {ConstantData:getValue("Recruit.Consume.Sycee.Hundred"), ConstantData:getValue("Recruit.Consume.Sycee.Million"), 
-- 					 ConstantData:getValue("Recruit.Consume.Sycee.Million.Batch")}

-- local RecruitRateData = require('lua.table.t_s_recruit_rate')

function GetRoleLayer:ctor(data)
    self.super.ctor(self,data)
    self.time =0
    self:init("lua.uiconfig_mango_new.shop.GetRolelayer")
    self:RefreshUI()
    self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
	function() 
		self:UpdateCDTime()
	end)
end

function GetRoleLayer:initUI(ui)
	self.super.initUI(self,ui)

	self.rolePanel = {}
	for i=1,3 do
		self.rolePanel[i] = TFDirector:getChildByPath(ui, "rolePanel"..i)
		local yuanbaoLabel = TFDirector:getChildByPath(self.rolePanel[i], "yuanbaoLabel")
		local todayTimes = 0
		if GetCardManager.cardStateInfo and GetCardManager.cardStateInfo[i] and GetCardManager.cardStateInfo[i].todayTimes then
			todayTimes = GetCardManager.cardStateInfo[i].todayTimes
		end
		yuanbaoLabel:setText(GetRolePriceData:getNowPrice( i , todayTimes + 1 ))
		-- yuanbaoLabel:setText(yuanBaoCost[i])

		local timeLabel = TFDirector:getChildByPath(self.rolePanel[i], "timeLabel")
		if timeLabel ~= nil then
			timeLabel:setText("")
		end

		local getRoleBtn = TFDirector:getChildByPath(self.rolePanel[i], "getRoleBtn")
		getRoleBtn:setTouchEnabled(false)

		if i == 3 then
			local effect = Public:addBtnWaterEffect(getRoleBtn, true,0)
			effect:setPosition(ccp(0,12))
		end
		self.rolePanel[i]:setScale(0)

		local firstGetImg = TFDirector:getChildByPath(self.rolePanel[i], "firstGetImg")
		if firstGetImg ~= nil then
			firstGetImg:setVisible(false)
		end

		local img_tool = TFDirector:getChildByPath(self.rolePanel[i], "zhaomutool")
		img_tool:setVisible(false)
	end

	self.img_tehui = TFDirector:getChildByPath(ui, "Image_GetRolelayer_1")
	self.img_tehui:setVisible(false)

	self:PlayStartEffect()
	self:ShowButton()
end

function GetRoleLayer:onShow()
	self.super.onShow(self)
    for i=1,2 do
        CommonManager:setRedPoint(TFDirector:getChildByPath(self.rolePanel[i], "getRoleBtn"), GetCardManager:isGetCardFree(i),"isGetCardFree",ccp(10,10))
    end
    self:RefreshUI()
end

function GetRoleLayer:refreshBaseUI()

end

function GetRoleLayer:dispose()
	TFDirector:removeTimer(self.updateTimerID)
end

function GetRoleLayer:registerEvents(ui)
	self.super.registerEvents(self)

	for i=1,3 do
		local getRoleBtn = TFDirector:getChildByPath(self.rolePanel[i], "getRoleBtn")
		getRoleBtn:addMEListener(TFWIDGET_CLICK, 
		audioClickfun(function()
			-- if self.costType[i] then
			GetCardManager:SendGetCardMsg(i)
			-- 	return
			-- end
			-- if VipRuleManager:showUsedGoldTimeLayer(GetCardManager:getGetRoleTimes(i),8300+i-1, localizable.getRoleLayer_txt1) then
			-- 	GetCardManager:SendGetCardMsg(i)
			-- end
		end),1)
	end
	local watchBtn = TFDirector:getChildByPath(self.rolePanel[1], "watchBtn")
	watchBtn:addMEListener(TFWIDGET_CLICK,audioClickfun(function()
			self:showHaoXiaoReward()
		end),1)
end

function GetRoleLayer:PlayStartEffect()
	self.ActionData = RecruitTalkManager:getRoleInfo()
	local scaleList = {
			[1] = {ccp(1.00,0.99),ccp(0.99,1.01),ccp(1.01,0.99),ccp(1.00,1.00)},
			[2] = {ccp(1.00,0.98),ccp(0.99,1.02),ccp(1.01,0.99),ccp(1.00,1.00)},
			[3] = {ccp(1.00,0.98),ccp(0.99,1.02),ccp(1.01,0.99),ccp(1.00,1.00)}
		}
	local deltaTime = {
		21, 17, 8
	}
	local scaleDr = {3,3,3,3}
	for i=1,3 do
		local acData = self.ActionData[i]
		local roleConfig = RoleData:objectByID(acData.roleId)
		local role = CCSprite:create(roleConfig:getBigImagePath())
		role:setAnchorPoint(ccp(0.5,0))
		role:setVisible(false)
		role:setScale(acData.scale)
		role:setFlipX(acData.flipX)
		role:setPosition(acData.x,580)
		local actionList = {}
		actionList[1] = CCDelayTime:create(acData.delay/GameConfig.ANIM_FPS)
		actionList[2] = CCShow:create()
		actionList[3] = CCMoveTo:create(5/GameConfig.ANIM_FPS,ccp(acData.x,acData.y))
		local action = CCSequence:createWithTwoActions(actionList[1],actionList[2])
		action = CCSequence:createWithTwoActions(action,actionList[3])
		for k,v in ipairs(scaleList[i]) do
			local scaleTo = CCScaleTo:create(scaleDr[k]/GameConfig.ANIM_FPS,v.x*acData.scale,v.y*acData.scale)
			action = CCSequence:createWithTwoActions(action,scaleTo)
		end

		local factor = acData.scale
		local totalTime = 1.2
	    local maxScaleY = 1.03
	    local maxScaleX = 1.01
	    local tweenScale = {
	          target = role,
	          repeated = -1,
	          {
	            duration = 0,
	            scaleY = 1 * factor,
	            scaleX = 1 * factor,
	          },
	          {
	            duration = totalTime / 6 * 1.5,
	            scaleY = 1.01 * factor,
	            scaleX = 1.003 * factor,
	          },
	          {
	            duration = totalTime / 6 * 1.5,
	            scaleY = 1.02 * factor,
	            scaleX = 1.006 * factor,
	          },
	          {
	            duration = totalTime / 6 * 3,
	            scaleY = maxScaleY * factor,
	            scaleX = maxScaleX * factor,
	          },
	          { 
	            duration = totalTime / 6 * 3,
	            scaleY = 1.02 * factor,
	            scaleX = 1.006 * factor,
	          },
	          {
	             duration = totalTime / 6 * 1.5,
	             scaleY = 1.01 * factor,
	             scaleX = 1.003 * factor,
	          },
	          {
	            duration = totalTime / 6 * 1.5,
	            scaleY = 1 * factor,
	          },
	    }

	    local function callFunc()
	    	TFDirector:toTween(tweenScale)
	    end
	    
	    action = CCSequence:createWithTwoActions(action, CCDelayTime:create(deltaTime[i]/GameConfig.ANIM_FPS))
	    action = CCSequence:createWithTwoActions(action, CCCallFunc:create(callFunc))

		role:runAction(action)
		self.ui:addChild(role)
	end

	TFResourceHelper:instance():addArmatureFromJsonFile("effect/zmeff1.xml")
	local effect = TFArmature:create("zmeff1_anim")
	if effect == nil then
		return
	end

	effect:setAnimationFps(GameConfig.ANIM_FPS)
	effect:playByIndex(0, -1, -1, 0)
	local uiSize = self.ui:getSize()
	effect:setPosition(ccp(uiSize.width/2-100,  uiSize.height/2))
	self.ui:addChild(effect)

	effect:addMEListener(TFARMATURE_COMPLETE,
	function()
		self:ShowStarEffect()
		self:BeganTalk()
	end)

	self:showHaoXiaoEffect()
	self:showChuangShuoEffect()
	self:showZongShiEffect()
end

function GetRoleLayer:BeganTalk()
	--self.TalkPoint = {ccp(181,240),ccp(469,240),ccp(750,240)}
	self.TalkPoint = {ccp(151,240),ccp(439,240),ccp(720,240)}
	self.talkDelay = 5
	self.TalkInfo = RecruitTalkManager:getTalkList()
	self.topicIndex = 0
	self:talk()
end

function GetRoleLayer:checkIndex()
	self.topicIndex = self.topicIndex+1
	if self.TalkInfo[self.topicIndex] == nil then
		self.topicIndex = 1
		return
	end
end

function GetRoleLayer:talk()
	self:checkIndex()
	local talkData = self.TalkInfo[self.topicIndex]
	if talkData == nil then return end
	local scaleDr = {2,2,3,3}
	local scaleInfo = {ccp(1.00,0.99),ccp(0.99,1.01),ccp(1.01,0.99),ccp(1.00,1.00)}
	local actionList = {}
	actionList[1] = CCDelayTime:create(talkData.delayF/1000)
	actionList[2] = CCShow:create()
	actionList[3] = CCScaleTo:create(2/GameConfig.ANIM_FPS,1,1)
	actionList[4] = CCDelayTime:create(talkData.delayB/1000)
	local action = CCSequence:createWithTwoActions(actionList[1],actionList[2])
	action = CCSequence:createWithTwoActions(action,actionList[3])
	for k,v in ipairs(scaleInfo) do
		local scaleTo = CCScaleTo:create(scaleDr[k]/GameConfig.ANIM_FPS,v.x,v.y)
		action = CCSequence:createWithTwoActions(action,scaleTo)
	end
	action = CCSequence:createWithTwoActions(action,actionList[4])

	local taklNode = self:getTalkNode(self.TalkPoint[talkData.id],talkData.txt)
	self.ui:addChild(taklNode,100)

	local callFunc = function()
		self:talk()
		local acfun = CCCallFunc:create(function( ... )
			taklNode:removeFromParent()
		end)
		taklNode:runAction(CCSequence:createWithTwoActions(CCScaleTo:create(5/GameConfig.ANIM_FPS,0),acfun))
	end
	local funcAction = CCCallFunc:create(callFunc)
	action = CCSequence:createWithTwoActions(action,funcAction)
	taklNode:runAction(action)
end

function GetRoleLayer:getTalkNode(pos,txt)
	local talkNode = CCNode:create()
	talkNode:setPosition(pos)
	local bgNode = TFImage:create("ui_new/shop/img_dhk.png")
	local bgwidth = 206
	local bgheight = 108
	bgNode:setScale9Enabled(true)
    bgNode:setImageSizeType(1)
    bgNode:setCapInsets(CCRectMake(23,24,160,70))
    bgNode:setAnchorPoint(ccp(75/bgwidth,1))
    bgNode:setPosition(ccp(0,0))
    talkNode:addChild(bgNode)
	local talkLabel = TFLabel:create()
    talkLabel:setAnchorPoint(ccp(0, 1))
    talkLabel:setPosition(ccp(-75 + 15,-25))
    talkLabel:setText(txt)
    talkLabel:setFontSize(20)
    talkLabel:setColor(ccc3(0, 0, 0))
    talkLabel:setTextAreaSize(CCSizeMake(bgwidth - 30,0))
    talkNode:addChild(talkLabel)
    talkNode:setPosition(pos)

    local size = talkLabel:getContentSize()
    size.width = bgwidth
    size.height = 20 + size.height + 20
    if size.height < 58 then
    	size.height = 58
    end
    bgNode:setContentSize(size)

    talkNode:setScale(0)
    return talkNode
end

function GetRoleLayer:ShowStarEffect()
	TFResourceHelper:instance():addArmatureFromJsonFile("effect/zmeff2.xml")
	local effect = TFArmature:create("zmeff2_anim")
	if effect == nil then
		return
	end

	effect:setAnimationFps(GameConfig.ANIM_FPS)
	effect:playByIndex(0, -1, -1, 1)
	local uiSize = self.ui:getSize()
	effect:setPosition(ccp(uiSize.width/2-50, uiSize.height/2))
	self:addChild(effect)
end

function GetRoleLayer:ShowButton()
	for i=1,3 do
		local panelTween = 
		{
			target = self.rolePanel[i],
			{ 
				duration = 0.2,
				scale = 1,
			},

			onComplete = function ()
				local getRoleBtn = TFDirector:getChildByPath(self.rolePanel[i], "getRoleBtn")
				getRoleBtn:setTouchEnabled(true)
			end,
		}
		TFDirector:toTween(panelTween)
	end
end

function timeFormat(totalSecond)
	local hour = math.floor(totalSecond/3600)
	local min = math.floor((totalSecond - hour*3600)/60)
    local sec = totalSecond - hour*3600 - min*60

    if hour < 10 then
    	hour = "0"..hour
    else
    	hour = tostring(hour)
    end

    if min < 10 then
    	min = "0"..min
    else
    	min = tostring(min)
    end

    if sec < 10 then
    	sec = "0"..sec
    else
    	sec = tostring(sec)
    end

    return hour..":"..min..":"..sec
end

function GetRoleLayer:UpdateCDTime()
	if #GetCardManager.cardStateInfo < 2 then
		return
	end

	for i=1,2 do
		if GetCardManager.cardStateInfo[i].cdTime > 0 then
			GetCardManager.cardStateInfo[i].cdTime = GetCardManager.cardStateInfo[i].cdTime - 1
		end
	end

	self:RefreshUI()
end

function GetRoleLayer:SetYuanBaoVisible(index, bVisible)
	local yuanbaoLabel = TFDirector:getChildByPath(self.rolePanel[index], "yuanbaoLabel")
	yuanbaoLabel:setVisible(bVisible)

	local yuanbaoImg = TFDirector:getChildByPath(self.rolePanel[index], "yuanbaoImg")
	yuanbaoImg:setVisible(bVisible)
end

-- 30036 30037 30038
function GetRoleLayer:RefreshUI()
	if #GetCardManager.cardStateInfo < 3 then
		return
	end
	
	-- 
	self.costType = {}

	local timeLabel1 = TFDirector:getChildByPath(self.rolePanel[1], "timeLabel")
	local cdTime1 = GetCardManager.cardStateInfo[1].cdTime
	local freeTimes1 = GetCardManager.cardStateInfo[1].freeTimes

	if freeTimes1 > 0 then
		if cdTime1 <= 0 then
			--timeLabel1:setText("可免费抽取")
			timeLabel1:setText(localizable.getRoleLayer_free)
			self:SetYuanBaoVisible(1, false)

			self.costType[1] = true
		else
			local timeStr = timeFormat(cdTime1)
			--timeStr = timeStr.."后免费"
			timeStr = stringUtils.format(localizable.getRoleLayer_time_free,timeStr)
			timeLabel1:setText(timeStr)
			self:SetYuanBaoVisible(1, true)

			self.costType[1] = false
		end
	else

		timeLabel1:setText("")
		self:SetYuanBaoVisible(1, true)

		self.costType[1] = false
	end

	local firstGetImg1 =  TFDirector:getChildByPath(self.rolePanel[1], "firstGetImg")
	if GetCardManager.cardStateInfo[1].firstGet then
		firstGetImg1:setVisible(true)
	else
		firstGetImg1:setVisible(false)
	end

	local timeLabel2 = TFDirector:getChildByPath(self.rolePanel[2], "timeLabel")
	local cdTime2 = GetCardManager.cardStateInfo[2].cdTime
	local freeTimes2 = GetCardManager.cardStateInfo[2].freeTimes

	-- if freeTimes2 > 0 then
		if cdTime2 <= 0 then
			--timeLabel2:setText("可免费抽取")
			timeLabel2:setText(localizable.getRoleLayer_free)
			self:SetYuanBaoVisible(2, false)

			self.costType[2] = true
		else
			local timeStr = timeFormat(cdTime2)
			--timeStr = timeStr.."后免费"
			timeStr = stringUtils.format(localizable.getRoleLayer_time_free,timeStr)
			
			timeLabel2:setText(timeStr)
			self:SetYuanBaoVisible(2, true)

			self.costType[2] = false
		end
	-- else
	-- 	timeLabel2:setText("")
	-- 	self:SetYuanBaoVisible(2, true)

	-- 	self.costType[2] = false
	-- end

	local firstGetImg2 =  TFDirector:getChildByPath(self.rolePanel[2], "firstGetImg")
	if GetCardManager.cardStateInfo[2].firstGet then
		firstGetImg2:setVisible(true)
	else
		firstGetImg2:setVisible(false)
	end

	self.costType[3] = false

	self:refreshWithTool()

	self:refreshJiangHuSheli()
	self:refreshTenOrange()

	for i=1,3 do
		local getRoleTime = TFDirector:getChildByPath(self.rolePanel[i], "numbLabel")	
		local vipInfo = VipData:getVipItemByTypeAndVip(8300+i-1,MainPlayer:getVipLevel())
		if vipInfo then
			getRoleTime:setVisible(true)
			local maxBuyTime = vipInfo.benefit_value - GetCardManager:getGetRoleTimes(i)
			getRoleTime:setText(stringUtils.format(localizable.getRoleLayer_time , maxBuyTime))
		else
			getRoleTime:setVisible(false)
		end
	end
end

function GetRoleLayer:showHaoXiaoEffect()
	if self.haoxiaEffect == nil then
		TFResourceHelper:instance():addArmatureFromJsonFile("effect/zmeffect_haoxia.xml")
		local effect = TFArmature:create("zmeffect_haoxia_anim")
		if effect == nil then
			return
		end

		effect:setAnimationFps(GameConfig.ANIM_FPS)
		-- effect:playByIndex(0, -1, -1, 0)
		local uiSize = self.ui:getSize()
		effect:setPosition(ccp(uiSize.width/2-100,  uiSize.height/2))
		self.ui:addChild(effect)
		self.haoxiaEffect = effect
	end
	local bOpenJiangHuSheli = OperationActivitiesManager:ActivityTypeIsOpen(OperationActivitiesManager.Type_JiangHuSheLi)
	if self.haoxiaEffectIndex == nil or self.haoxiaEffectIndex ~= bOpenJiangHuSheli then
		if bOpenJiangHuSheli then
			self.haoxiaEffect:playByIndex(1, -1, -1, 0)
		else
			self.haoxiaEffect:playByIndex(0, -1, -1, 0)
		end
		self.haoxiaEffectIndex = bOpenJiangHuSheli
	end
end

function GetRoleLayer:showChuangShuoEffect()
	if self.chuanshuoEffect == nil then
		TFResourceHelper:instance():addArmatureFromJsonFile("effect/zmeffect_chuanshuo.xml")
		local effect = TFArmature:create("zmeffect_chuanshuo_anim")
		if effect == nil then
			return
		end

		effect:setAnimationFps(GameConfig.ANIM_FPS)
		-- effect:playByIndex(0, -1, -1, 0)
		local uiSize = self.ui:getSize()
		effect:setPosition(ccp(uiSize.width/2-100,  uiSize.height/2))
		self.ui:addChild(effect)
		self.chuanshuoEffect = effect
	end
	if self.txt_time == nil then
		local timeLabel = TFLabel:create()

		timeLabel:setAnchorPoint(ccp(0.5, 0.5))
		local uiSize = self.ui:getSize()
		timeLabel:setPosition(ccp(uiSize.width/2+234,  uiSize.height/2+240))
		-- timeLabel:setText("fuck dwk")
		timeLabel:setFontSize(20)
		timeLabel:setColor(ccc3(255, 255, 255))
		timeLabel:setZOrder(100)
		self.ui:addChild(timeLabel)
		self.txt_time = timeLabel
	end
	local bOpenTenOrange = OperationActivitiesManager:ActivityTypeIsOpen(OperationActivitiesManager.Type_Ten_Orange)
	if self.chuanshuoEffectIndex == nil or self.chuanshuoEffectIndex ~= bOpenTenOrange then
		if bOpenTenOrange then
			self.txt_time:setVisible(true)
    		local activity = OperationActivitiesManager:ActivityWithType(OperationActivitiesManager.Type_Ten_Orange)
			self.time = activity.endTime - MainPlayer:getNowtime()
			self.chuanshuoEffect:playByIndex(1, -1, -1, 0)
			if  self.end_timerID == nil then
				self.end_timerID = TFDirector:addTimer(1000, -1, nil, 
					function()
					if self.end_timerID ~= nil then
						self:showNextTimer()
					end
				end)
			end
		else
			self.txt_time:setVisible(false)
			self.chuanshuoEffect:playByIndex(0, -1, -1, 0)
			self.time = 0
			if self.end_timerID then
				TFDirector:removeTimer(self.end_timerID)
				self.end_timerID = nil
			end
		end
		self.chuanshuoEffectIndex = bOpenTenOrange
	end
end


function GetRoleLayer:showNextTimer()
	if self.txt_time == nil then
		return
	end
    self.time = self.time - 1
    if self.time <=  0 then
        if self.end_timerID then
            TFDirector:removeTimer(self.end_timerID)
            self.end_timerID = nil
        end
        return
        -- toastMessage(localizable.treasureMain_tiemout)
        -- AlertManager:close()
    end    
    local timeCount = self.time
    local secInOneDay  = 24 * 3600
    local day = math.floor(timeCount/secInOneDay)
    local sec   = timeCount - secInOneDay * day
    local time1 = math.floor(sec/3600)
    local time2 = math.floor((sec-time1 * 3600)/60)
    local time3 = math.fmod(sec, 60)
    local timedesc1 = stringUtils.format(localizable.common_time_5, day, time1, time2, time3)
    -- self.txt_time:setText(timedesc1)
    -- self.txt_time:setText(stringUtils.format(localizable.common_activity_time2,timedesc1))
    self.txt_time:setText(timedesc1)
end

function GetRoleLayer:showZongShiEffect()
	TFResourceHelper:instance():addArmatureFromJsonFile("effect/zmeffect_zongshi.xml")
	local effect = TFArmature:create("zmeffect_zongshi_anim")
	if effect == nil then
		return
	end

	effect:setAnimationFps(GameConfig.ANIM_FPS)
	effect:playByIndex(0, -1, -1, 0)
	local uiSize = self.ui:getSize()
	effect:setPosition(ccp(uiSize.width/2-100,  uiSize.height/2))
	self.ui:addChild(effect)
end

function GetRoleLayer:refreshJiangHuSheli()
	local getRoleBtn = TFDirector:getChildByPath(self.rolePanel[1], "getRoleBtn")
	local watchBtn = TFDirector:getChildByPath(self.rolePanel[1], "watchBtn")
	local bOpenJiangHuSheli = OperationActivitiesManager:ActivityTypeIsOpen(OperationActivitiesManager.Type_JiangHuSheLi)
	if bOpenJiangHuSheli then
		watchBtn:setVisible(true)
		getRoleBtn:setTextureNormal("ui_new/shop/btn_jhsl.png")
	else
		watchBtn:setVisible(false)
		getRoleBtn:setTextureNormal("ui_new/shop/zmyi.png")
	end
	self:showHaoXiaoEffect()
end
function GetRoleLayer:refreshTenOrange()
	self:showChuangShuoEffect()
end

-- 30036 30037 30038
function GetRoleLayer:refreshWithTool()

	for i=1, 3 do
		if self.costType and self.costType[i] == false then
			local RecruitData = RecruitRateData:objectByID(i)
		    if RecruitData then
		        local goodId 	= RecruitData.consume_goods_id
		        local costTool 	= RecruitData.consume_goods_num
		        local tool 		= BagManager:getItemById(goodId)

		        local yuanbaoLabel 	= TFDirector:getChildByPath(self.rolePanel[i], "yuanbaoLabel")
		        local img_tool 		= TFDirector:getChildByPath(self.rolePanel[i], "zhaomutool")
		        local timeLabel1 	= TFDirector:getChildByPath(self.rolePanel[i], "timeLabel")
		        local yuanbaoImg 	= TFDirector:getChildByPath(self.rolePanel[i], "yuanbaoImg")
		        -- print("---- i ---", i)
		        -- print("---- tool.num ---", tool.num)
		        if tool and tool.num >= costTool then
		        	img_tool:setVisible(true)
		        	-- yuanbaoLabel:setText(tool.num)
		        	yuanbaoLabel:setText(1)
		        	-- if timeLabel1 then
		        	-- 	timeLabel1:setVisible(false)
		        	-- end
		        	yuanbaoImg:setVisible(false)
		        else
		        	img_tool:setVisible(false)
		        	yuanbaoImg:setVisible(true)
		        	-- yuanbaoLabel:setText(yuanBaoCost[i])
					local todayTimes = GetCardManager.cardStateInfo[i].todayTimes or 0
					yuanbaoLabel:setText(GetRolePriceData:getNowPrice( i , todayTimes + 1 ))
		        end
		    end
			
		end
	end
	local todayTimes = GetCardManager.cardStateInfo[3].todayTimes or 0
	if todayTimes < 3 then
		self.img_tehui:setVisible(true)
	else
		self.img_tehui:setVisible(false)
	end
end
function GetRoleLayer:showHaoXiaoReward()
	local bOpenJiangHuSheli = OperationActivitiesManager:ActivityTypeIsOpen(OperationActivitiesManager.Type_JiangHuSheLi)
	if bOpenJiangHuSheli == false then
		toastMessage("活动没有开放")
		return
	end
	local activity      = OperationActivitiesManager:ActivityWithType(OperationActivitiesManager.Type_JiangHuSheLi)
    local rewardList    = activity.activityReward
	local layer  = require("lua.logic.gameactivity.GoldEgg.GoldEggCheckRewardLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:setRewardList(rewardList)
    AlertManager:show()
end
return GetRoleLayer
