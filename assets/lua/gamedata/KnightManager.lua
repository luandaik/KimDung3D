-- KnightManager
-- Author: fei
-- Date: 2016/12/07
--
local KnightData  		= require('lua.table.t_s_knight')
local KnightManager 	= class("KnightManager")
KnightManager.maxRankNum 				= 50
KnightManager.newAddRankNum 			= 10
KnightManager.KnightShowUp 				= "KnightManager.KnightShowUp"			 --武士出现
KnightManager.KnightRank 				= "KnightManager.KnightRank"			 --查看排行榜
KnightManager.KnightShareList 			= "KnightManager.KnightShareList"		 --武士分享列表信息
KnightManager.KnightShareInfo 			= "KnightManager.KnightShareInfo"		 --武士分享信息
KnightManager.KnightShareSucceed 		= "KnightManager.KnightShareSucceed"		 --武士分享成功通知
function KnightManager:ctor()
	TFDirector:addProto(s2c.KNIGHT_INFO, self, self.onKnightShowUp)
	TFDirector:addProto(s2c.KNIGHT_RANK_LIST, self, self.onKnightRank)
	TFDirector:addProto(s2c.KNIGHT_SHARE_INFO, self, self.onKnightShareListInfo)
	TFDirector:addProto(s2c.KNIGHT_SHARE_SINGLE_INFO, self, self.onKnightShareInfo)
	TFDirector:addProto(s2c.SHARE_KNIGHT, self, self.onKnightShareSucceed)
	--

	self:restart()
end
function KnightManager:restart()
	self.isNewDay 					= false
	self.knightOnLineTime 			= 0
	self.isAutoShowLayer 			= false
	self.txtKnightOnLineTimeList 	= {}
	self.knightInfo					= {}
	self.knightRankInfo				= {}

	self.isShareKnightState			= false
	self.knightShareList			= {}
	self.knightHelpFriendCount 		= 0
	self.fightKnightInfo 			= {}
	self.showRedPointList 			= {}
	self:stopShareTime()
	self:stopUpTime()
end

function KnightManager:clearKngithShareInfo()
	self:stopShareTime()
	self.isShareKnightState			= false
	self.knightShareList			= {}
	self.knightHelpFriendCount 		= 0
	self.fightKnightInfo 			= {}
	self.showRedPointList 			= {}
end

function KnightManager:clearKnightInfo()
	self.knightOnLineTime 			= 0
	self.isAutoShowLayer 			= false
	self.txtKnightOnLineTimeList 	= {}
	self.knightInfo					= {}

	self:clearRankInfo()

	self:stopUpTime()
end

function KnightManager:clearRankInfo()
	self.knightRankInfo				= {}
end

function KnightManager:clearRedPointInfo()
	self.showRedPointList.isShow = true
end
-- 武士出现
function KnightManager:onKnightShowUp(event)
	--s2c.KNIGHT_INFO 0x7a01
	hideLoading()
	self:clearKnightInfo()
	local info = event.data
	print("武士出现   ", info)
	
	self.knightOnLineTime 	= math.floor(info.timeLeft / 1000) + MainPlayer:getNowtime()

	self.knightInfo 		= info
	self.isAutoShowLayer 	= true
	self:setAutoShowKnight(self:getKnightOnLineTime() > 0)
	self:setShareKnightState(false)
	
	if (self.isNewDay) then
		self.isNewDay 			= false
		self.isAutoShowLayer 	= false
	end
	self:updateKnightOnLineTime()
	TFDirector:dispatchGlobalEventWith(KnightManager.KnightShowUp)
end

-- 查看排行榜
function KnightManager:onKnightRank(event)
	--s2c.KNIGHT_RANK_LIST 0x7a02
	hideLoading()
	print("查看武士排行榜   ", event.data)
	local info = event.data.info
	if (info) then
		for i,v in ipairs(info) do
			if (#self.knightRankInfo >= KnightManager.maxRankNum) then
				print("#self.knightRankInfo   ", #self.knightRankInfo)
				break
			end
			table.insert(self.knightRankInfo, v)
		end
	end
	
	TFDirector:dispatchGlobalEventWith(KnightManager.KnightRank)
end

-- 24点请求武士信息
function KnightManager:requestKnightAllInfo_24()
	--c2s.GET_KNIGHT_INFO 0x7a08
	print("24点请求武士信息 ")
	self.isNewDay = true
	TFDirector:send(c2s.GET_KNIGHT_INFO, {})
end

-- 请求排行榜 
function KnightManager:requestKnightRank(knightType, startIndex, num)
	--0x7a02
	showLoading()
	local Msg = 
	{
		knightType,
		startIndex,
		num
	}
	print("请求排行榜 ", Msg)
	TFDirector:send(c2s.KNIGHT_RANK_LIST, Msg)
end

-- 浪人武士战斗 code = 0x7a03  
function KnightManager:requestKnightBeginFight()
	--0x7a03
	if (self:getKnightOnLineTime() <= 0 )then
		--Knight_time_tips = "浪人武士挑战的时间已过"
		toastMessage(localizable.Knight_time_tips)
		return
	end
	showLoading()
	print("浪人武士战斗 ")
	TFDirector:send(c2s.KNIGHT_BATTLE_START, {})
end
--分享武士  c2s.SHARE_KNIGHT = 0x7a07
function KnightManager:requestShareKnight(knightType)
	self:setShareKnightState(false)
	knightType 	= knightType or self:getKnightTypeId()

	local Msg = 
	{ 
		knightType,
	}
	print("分享武士 ")
	TFDirector:send(c2s.SHARE_KNIGHT, Msg)
end

-- 武士分享信息
function KnightManager:onKnightShareListInfo(event)
	hideLoading()
	print("武士列表信息   ", event.data)
	self:clearKngithShareInfo()
	self.knightHelpFriendCount = event.data.leaveTime
	local info = event.data.knightShareInfo
	--self.knightShareList = {}
	
	if (info) then
		for i,v in ipairs(info) do
			if (v.leaveHp > 0) then
				v.knightInfo.timeLeft = math.floor(v.knightInfo.timeLeft) / 1000 + MainPlayer:getNowtime()
				table.insert(self.knightShareList, v)
				if (v.knightState ~= 2) then
					--可挑战
					if (MainPlayer:getPlayerId() ~= v.sharePlayerId) then
						local count = self.showRedPointList[v.sharePlayerId] or 0
						self.showRedPointList[v.sharePlayerId] = count + 1
					end
				elseif (self.showRedPointList[v.sharePlayerId] == nil) then
					--已挑战
					self.showRedPointList[v.sharePlayerId] = 0
				end
				if (v.chatInfo) then
					self.showRedPointList.isShow = false
					v.chatInfo.instanceId 		= v.instanceId
					v.chatInfo.sharePlayerId 	= v.sharePlayerId
					self:addKnightChatShare(v.chatInfo)
				end
			end
		end
		self:sortKnightList()
	end
	self:updateKnightShareOnLineTime()
	TFDirector:dispatchGlobalEventWith(KnightManager.KnightShareList)
end
function KnightManager:onKnightShareSucceed(event)
	--s2c.SHARE_KNIGHT = 0x7a07
	toastMessage(localizable.Knight_share_succeed)
end
-- 单个武士分享信息
function KnightManager:onKnightShareInfo(event)
	--s2c.KNIGHT_SHARE_SINGLE_INFO = 0x7a05
	hideLoading()
	print("单个武士分享---", event.data)
	local info = event.data
	
	if (info) then
		info.knightInfo.timeLeft = math.floor(info.knightInfo.timeLeft / 1000) + MainPlayer:getNowtime()
		local isAdd = false
		for i,v in ipairs(self.knightShareList) do
			if (v.instanceId == info.instanceId) then
				if (info.leaveHp <= 0) then
					local count = self.showRedPointList[info.sharePlayerId] or 0
					self.showRedPointList[info.sharePlayerId] = count - 1
					ChatManager:deleteFriendKnightShareCache(info.sharePlayerId, info.instanceId)
					table.remove(self.knightShareList, i)
				else
					self.knightShareList[i] = info
				end
				isAdd = true
				break
			end
		end
		if (info.knightState ~= 2) then
			if (MainPlayer:getPlayerId() ~= info.sharePlayerId) then
				self.showRedPointList.isShow = false
				local count = self.showRedPointList[info.sharePlayerId] or 0
				self.showRedPointList[info.sharePlayerId] = count + 1
			end
		elseif (info.leaveHp > 0) then
			local count = self.showRedPointList[info.sharePlayerId] or 0
			self.showRedPointList[info.sharePlayerId] = count - 1
		end

		if (isAdd == false and (info.leaveHp > 0)) then
			table.insert(self.knightShareList, info)
			if (info.chatInfo) then
				info.chatInfo.instanceId 		= info.instanceId
				info.chatInfo.sharePlayerId 	= info.sharePlayerId
				self:addKnightChatShare(info.chatInfo, true)
			end
		end
	 	self:sortKnightList(info.sharePlayerId)
	end
	self:updateKnightShareOnLineTime()
	TFDirector:dispatchGlobalEventWith(KnightManager.KnightShareInfo)
end
-- 帮助好友浪人武士战斗 c2s.KNIGHT_FRIEND_BATTLE_START = 0x7a06
--function KnightManager:requestFriendKnightBeginFight(instanceId, sharePlayerId, index, info)
function KnightManager:requestFriendKnightBeginFight(info)
	if (self.knightHelpFriendCount <= 0) then
		toastMessage(localizable.Knight_fight_count)
		return
	end

	if (info and info.knightInfo and (info.knightInfo.timeLeft - MainPlayer:getNowtime()) <= 0) then
		toastMessage(localizable.Knight_time_tips)
		return
	end
	self:addFightKnightInfo(info.knightInfo.type, info.knightInfo.level)
	showLoading()
	local Msg = 
	{
		info.instanceId,
		info.sharePlayerId
	}
	print("帮助好友浪人武士战斗 ",Msg)
	TFDirector:send(c2s.KNIGHT_FRIEND_BATTLE_START, Msg)
end

--是否主动弹出
function KnightManager:getAutoShowKnight()
	return (self.isAutoShowLayer and (self:getKnightOnLineTime() > 0))
end
function KnightManager:setAutoShowKnight(show)
	self.isAutoShowLayer = show
end
function KnightManager:getKnightRankInfo()
	return self.knightRankInfo
end

--是否分享武士
function KnightManager:setShareKnightState(isShare)
	self.isShareKnightState = isShare
end
function KnightManager:getShareKnightState()
	return self.isShareKnightState
end
function KnightManager:getByinstanceIdInfo(instanceId)
	for i,v in ipairs(self.knightShareList) do
		if (v.instanceId == instanceId) then
			return v
		end
	end
	
	return nil
end
function KnightManager:getByRankKnightInfo(rank)
	local info = self.knightRankInfo[rank]
	if (info) then
		return info
	end
	return nil
end

function KnightManager:getKnightInfo()
	return self.knightInfo
end

--武士类型ID
function KnightManager:getKnightTypeId()
	return self.knightInfo.type
end

--武士ID
function KnightManager:getKnightById()
	local info = self:getKnightData()
	return info.id
end

function KnightManager:getKnightLimitIds(knightType, level, isInitInfo)
	local knightInfo = self:getKnightData(knightType, level, isInitInfo)
	if (knightInfo) then
		return (string.split(knightInfo.limit_ids, ","))
	end
	print("ERROR---->knightType",knightType,"  level : ", level, " isInitInfo:  ",isInitInfo, " self.knightInfo: ",self.knightInfo)
	return {}
end

function KnightManager:addFightKnightInfo(knightType, level)
	self.fightKnightInfo = {}
	if (knightType == nil) then
		return
	end
	local info = self:getKnightData(knightType, level)
	self.fightKnightInfo.knightType = knightType
	self.fightKnightInfo.level 		= level
	self.fightKnightInfo.id 		= info.id
	print("addFightKnightInfo    ", self.fightKnightInfo)
end

function KnightManager:getFightKnightInfo()
	return self.fightKnightInfo
end

function KnightManager:getKnightLevel()
	return self.knightInfo.level 
end

function KnightManager:getKnightFriednHelpCount()
	return self.knightHelpFriendCount
end
function KnightManager:subKnightFriednHelpCount()
	self.knightHelpFriendCount = self.knightHelpFriendCount - 1
end
--
function KnightManager:getKnightData(knightType, level, isInitInfo)
	--KnightData
	knightType 	= knightType or self:getKnightTypeId()
	level 		= level or self:getKnightLevel()

	local info = nil
	for knightInfo in KnightData:iterator() do
		if (knightInfo.type == knightType and level == knightInfo.level) then
			if (isInitInfo == nil) then
				return knightInfo
			end
			info = knightInfo
			break
		end
	end
	if (info) then
		info.awardIds = {}
		info.awardIds.itemTypeId 	= {}
		info.awardIds.itemId 		= {}
		info.awardIds.itemNum 		= {}
		local config = RewardConfigureData:objectByID(tonumber(info.award_ids))
   		if config then
   			local lists = string.split(config.reward_conf, ",")
   			for i,id in ipairs(lists) do
   				local reward = RewardItemData:objectByID(tonumber(id))
            	if reward then
            		info.awardIds.itemTypeId[i] 	= tonumber(reward.type)
					info.awardIds.itemId[i] 		= tonumber(reward.item_id)
					info.awardIds.itemNum[i] 		= tonumber(reward.number)
            	end
   			end
   		end

   		info.assistAwardIds = {}
		info.assistAwardIds.itemTypeId 	= {}
		info.assistAwardIds.itemId 		= {}
		info.assistAwardIds.itemNum 	= {}
   		local config = RewardConfigureData:objectByID(tonumber(info.assist_awards))
   		if config then
   			local lists = string.split(config.reward_conf, ",")
   			for i,id in ipairs(lists) do
   				local reward = RewardItemData:objectByID(tonumber(id))
            	if reward then
            		info.assistAwardIds.itemTypeId[i] 	= tonumber(reward.type)
					info.assistAwardIds.itemId[i] 		= tonumber(reward.item_id)
					info.assistAwardIds.itemNum[i] 		= tonumber(reward.number)
            	end
   			end
   		end
	end
	return info
end

function KnightManager:getKnightFightData(shareInfo)
	--KnightData
	local knightInfo 	= nil
	if (shareInfo) then
		knightInfo 	= self:getKnightData(shareInfo.knightInfo.type, shareInfo.knightInfo.level)
	else
		knightInfo 	= self:getKnightData()
	end
	if (knightInfo == nil) then
		return nil
	end
	local fightIdInfo   = string.split(knightInfo.limit_ids, ",")
	local fightInfo 	= nil
	for i,limitId in ipairs(fightIdInfo) do
		local battleInfo = BattleLimitedData:objectByID(tonumber(limitId))
		if battleInfo then
			fightInfo = fightInfo or {}
			table.insert(fightInfo, battleInfo)
		end
	end
	return fightInfo
end

function KnightManager:getKnghtShareList()
	return self.knightShareList
end

function KnightManager:isShowShareButton(idPlayer)
	local isShow = false
	if (idPlayer) then
		isShow = ((self.showRedPointList[idPlayer] or 0) > 0)
	else
		if (self.showRedPointList.isShow) then
			return false
		end
		for i,v in pairs(self.showRedPointList) do
			if (type(v) == "number") then
				if (v > 0) then
					return true
				end
			end	
		end
	end
	return isShow
end

function KnightManager:getByIndexKnghtShareInfo(idx)
	 return self.knightShareList[idx] or nil
end
function KnightManager:updateKnightShareOnLineTime(timeData)
	if (#self.knightShareList <= 0) then
		self:stopShareTime()
		return
	end
	if (timeData) then
		self.txtShareTimeData = self.txtShareTimeData or {}
		
		if (timeData.txt == nil) then
			self.txtShareTimeData = nil
		else
			local isAdd = true
			for i,v in ipairs(self.txtShareTimeData) do
				if (timeData.txt == v.txt) then
					self.txtShareTimeData[i] = timeData
					isAdd = false
				end
			end
			if (isAdd) then
				table.insert(self.txtShareTimeData, timeData)
			end
		end
	end

	if (self.subShareTimer == nil) then
	    self.subShareTimer = TFDirector:addTimer(500, -1, nil, 
	        function()
	        	local nowTime = MainPlayer:getNowtime()
	         	local shareListLen = #self.knightShareList
	        	while shareListLen >= 1 do
		        	local info = self.knightShareList[shareListLen]
		        	if (info and info.knightInfo) then
		        		--info.knightInfo.timeLeft = info.knightInfo.timeLeft - 1
		        		local time = info.knightInfo.timeLeft - nowTime
	            		if (time <= 0) then
	            			--self.showRedPointList[info.sharePlayerId] = false
	            			local count = self.showRedPointList[info.sharePlayerId] or 0
							self.showRedPointList[info.sharePlayerId] = count - 1
	            			self.knightShareList[shareListLen] = nil
	            			ChatManager:deleteFriendKnightShareCache(info.sharePlayerId, info.instanceId)
	            			table.remove(self.knightShareList, shareListLen)
	            			if (self.txtShareTimeData) then
	            				self.txtShareTimeData[1].funcCall()
	            				break
	            			end
	            		end
	        	 	end
	        	 	shareListLen = shareListLen - 1
	        	end
	        	if (self.txtShareTimeData) then
	        		
	        		for i,v in ipairs(self.txtShareTimeData) do
	        			local txt = v.txt
	        			local info = self.knightShareList[v.index]
	        			if (info and info.knightInfo) then
	        				--
	        				local time = info.knightInfo.timeLeft - nowTime
	        				txt:setText(self:getTimeText(time))
	        			end
	        		end
	        	end
	        	if (#self.knightShareList <= 0) then
	        		self:stopShareTime()
	        	end
	        end)
	end
end

function KnightManager:updateKnightOnLineTime(data)
	if (self:getKnightOnLineTime() <= 0) then
		self:stopUpTime()
		return
	end

	if (data) then
		local isAdd = false
		for k,info in ipairs(self.txtKnightOnLineTimeList) do
	        if (info.name == data.name) then
	        	isAdd = true
	        	break
	        end
        end
        if (isAdd == false) then
			table.insert(self.txtKnightOnLineTimeList, data)
		end
	end
	
	if (self.subTimer == nil) then
	    self.subTimer = TFDirector:addTimer(1000, -1, nil, 
	        function()
	            local knightOnLineTime = self:getKnightOnLineTime()
	            --local nowTime = MainPlayer:getNowtime()
	            if (knightOnLineTime <= 0) then
	            	self:stopUpTime()
	            end
            	for k,data in ipairs(self.txtKnightOnLineTimeList) do
            		if (data.txt) then
            			--local time = self.knightOnLineTime - nowTime
            			data.txt:setText(self:getTimeText(knightOnLineTime))
            		end
            		if (knightOnLineTime <= 0) then
        				data.funcCall()
        			end
            	end
	        end)
	end
end

function KnightManager:deleteKnightOnLineTime(layerName)
	for k,data in ipairs(self.txtKnightOnLineTimeList) do
        if (data.name == layerName) then
        	table.remove(self.txtKnightOnLineTimeList, k)
        	break
        end
    end
end

function KnightManager:getTimeText(time)
	local hour 	= math.floor(time / 3600)
	local min 	= math.floor((time - (hour * 3600)) / 60)
	local sec   = math.floor((time - (min * 60)) % 60)
	if (hour < 10) then
		hour = "0"..hour
	end
	if (sec < 10) then
		sec = "0"..sec
	end
	if (min < 10) then
		min = "0"..min
	end
	local txt  	= hour..":"..min..":"..sec
	return txt
end

function KnightManager:stopShareTime()
	if (self.subShareTimer) then
		TFDirector:removeTimer(self.subShareTimer)
		self.subShareTimer 		= nil
	end
	self.txtShareTimeData = nil
end

function KnightManager:stopUpTime()
	if (self.subTimer) then
		TFDirector:removeTimer(self.subTimer)
		self.subTimer 	= nil
	end
	self.txtKnightOnLineTimeList 	= {}
end

function KnightManager:getKnightOnLineTime()
	return (self.knightOnLineTime - MainPlayer:getNowtime())
end

function KnightManager:isShowKnight()
	return (self:getKnightOnLineTime() > 0)
end
function KnightManager:showShare()
   if (self:getShareKnightState()) then
        local MSG = stringUtils.format(localizable.Knight_lost_tiops)    
        CommonManager:showOperateSureLayer(
                function(data, widget)
                    --AlertManager:close()
                    self:requestShareKnight()
                end,
                function(data, widget)
                    self:setShareKnightState(false)
                    AlertManager:close()
                end,
                {
                    msg = MSG,
                    showtype = AlertManager.BLOCK_AND_GRAY
                }
        )
    end
end
function KnightManager:openKnightLayer(shakeLayer)
	----BLOCK_AND_GRAY BLOCK_AND_GRAY_CLOSE
	local currentScene = Public:currentScene()
	if (currentScene.__cname ~= "HomeScene") then
		return
	end
	if (self:getAutoShowKnight()) then
		
		TFResourceHelper:instance():addArmatureFromJsonFile("effect/knightShow.xml")
	    local effect = TFArmature:create("knightShow_anim")
	    effect:setAnimationFps(GameConfig.ANIM_FPS)
	    effect:playByIndex(0, -1, -1, 0)
	    
	    --
	    local touchlayer = TFPanel:create()
	    touchlayer:setSize(GameConfig.WS);
		touchlayer:setTouchEnabled(true);
		currentScene:addChild(touchlayer, 99);
		--
	    effect:setPosition(ccp(currentScene:getSize().width / 2, currentScene:getSize().height / 2))
	    currentScene:addChild(effect, 99)
	    self.touchlayer = touchlayer
	    effect:addMEListener(TFARMATURE_COMPLETE, function ()
	    	if (self.touchlayer) then
	    		self.touchlayer:setTouchEnabled(false);
	    		self.touchlayer:removeFromParent()
	        	self.touchlayer = nil
	        end
	    	effect:removeFromParent()
	        effect = nil
	    end)
	    local step = 0
	    effect:addMEListener(TFARMATURE_UPDATE,function()
	        step = step + 1
	        if step == 8 then
	        	self:Shake(currentScene, 16, 16)
	        elseif step == 29 then 
	        	local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.knight.KnightShowLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
				layer.name = "KnightShowLayer"
				layer:loadData(newMissionId);
			    AlertManager:show();
			    if (self.touchlayer) then
			    	self.touchlayer:setTouchEnabled(false);
		    		self.touchlayer:removeFromParent()
		        	self.touchlayer = nil
		        end
	            effect:removeMEListener(TFARMATURE_UPDATE)
	        end
        end)
	    self:setAutoShowKnight(false)
	    return
	end
	
	local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.knight.KnightShowLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
	layer.name = "KnightShowLayer"
	layer:loadData(newMissionId);
    AlertManager:show();
end

function KnightManager:openKnightFriendHelpLayer(sharePlayerId)
	local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.knight.KnightFriendHelp",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
	self:sortKnightList(sharePlayerId)
    AlertManager:show();
end

function KnightManager:openKnightVSLayer(shareInfo)
	local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.knight.KnightVSLayer",AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_1);
	layer:addKnightInfo(shareInfo)
  	AlertManager:show();
end

function KnightManager:sortKnightList(sharePlayerId)

	--??ʱ??
	local tempInfo = {}
	local function sorList(a,b)
        if (a.knightState == 2 and b.knightState == 2) then
        	--????ս
			return a.knightInfo.timeLeft < b.knightInfo.timeLeft
		elseif (a.knightState ~= 2 and b.knightState ~= 2) then
			--??δ?ս
			return a.knightInfo.timeLeft < b.knightInfo.timeLeft
		elseif (a.knightState == 2 and b.knightState ~= 2) then
			--a ??ս  b δ?ս
			return false
		elseif (a.knightState ~= 2 and b.knightState == 2) then
			--a δ?ս  b ??ս
			return true
		end
		return false
    end
	if (sharePlayerId) then
		local len = #self.knightShareList
		while(len >= 1) do
			local list = self.knightShareList[len]
			if (list and list.sharePlayerId == sharePlayerId) then
				local b = clone(list)
				table.insert(tempInfo, b)
				table.remove(self.knightShareList, len)
			end
			len = len - 1
		end
		if (#tempInfo > 1) then
			table.sort(tempInfo, sorList)
		end
	end
	table.sort(self.knightShareList, sorList)
	
	if (#tempInfo > 0) then
		for i,v in ipairs(tempInfo) do
			table.insert(self.knightShareList, i, v)
		end
	end
end
function KnightManager:showTip(isFightWin, fightType)
	-- type 		= 21.浪人武士；战斗结束后胜利
	-- type 		= 22.浪人武士；战斗结束后失败
	-- fightType 	= 31 自己打武士 32 帮好友打武士
	local nType = 22
	local knightId = 0
	if (fightType == 31) then
		knightId = self:getKnightById()
	    if (isFightWin) then
	    	nType = 21
	    	self:clearKnightInfo()
	    else
	    	self.knightOnLineTime = 0
	    	self:setShareKnightState(true)
	    end
	-- elseif (fightType == 32 and isFightWin == false) then
	else
		self:subKnightFriednHelpCount()
		knightId = self.fightKnightInfo.id
		self.fightKnightInfo 			= {}
		if (isFightWin) then
	    	nType = 21
	    end
	end
    local tipList = MissionManager:getTipListByMissionId(knightId, nType);
    local tipData = {};

    tipData.tiplist      = tipList; 
    tipData.stageType    = nType;
    local tipLayer = require("lua.logic.mission.MissionTipLayer"):new(tipData);
    local currentScene = Public:currentScene();
    currentScene:addLayer(tipLayer);
end

function KnightManager:Shake(layer, swingX, swingY)
	if (layer == nil) then
		return
	end
	local postion = layer:getPosition()
	local shakeTime = 0.03
	layer.shakeTween = 
	{
		target = layer,
		{
			duration = shakeTime,
			x = postion.x+swingX,
			y = postion.y+swingY,
		},
		{
			duration = 2*shakeTime,
			x = postion.x-swingX,
			y = postion.y-swingY,
		},
		{
			duration = shakeTime,
			x = postion.x,
			y = postion.y,
		},
		{
			duration = shakeTime,
			x = postion.x-swingX,
			y = postion.y+swingY,
		},
		{
			duration = 2*shakeTime,
			x = postion.x+swingX,
			y = postion.y-swingY,
		},
		{
			duration = shakeTime,
			x = postion.x,
			y = postion.y,
		},
		onComplete = function ()
			TFDirector:killTween(layer.shakeTween)
		end,
	}
	TFDirector:toTween(layer.shakeTween)
end
function KnightManager:setKnightRedPoint(widget,isShow, offset)
    if not widget then
        return
    end

    local redPoint = widget:getChildByName("KnightRedPoint")
    if redPoint then
    	if (isShow) then
        	redPoint:setVisible(true)
        else
        	redPoint:setVisible(false)
        end
    elseif (isShow) then
        redPoint = TFImage:create("ui_new/home/img_huangdian.png")
        redPoint:setName("KnightRedPoint")
        local widgetSize 	= widget:getSize()
        local pointSize 	= redPoint:getSize()
        offset = offset or ccp(0,0)
        local pos = ccp(-pointSize.width + offset.x, -pointSize.height + offset.y)
        redPoint:setAnchorPoint(ccp(0, 0))
        redPoint:setPosition(pos)
        widget:addChild(redPoint,100)
    end
end
-- 
function KnightManager:addKnightChatShare( data )
	if nil ~= data then
		local msg = data
		msg.content 			= localizable.Knight_share_tips1
		msg.isKnightShare 		= true
		ChatManager:addFriend( msg )
	end
	TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, msg)
	TFDirector:dispatchGlobalEventWith(ChatManager.ShowBubbleMsg, {2})
end
return KnightManager:new()