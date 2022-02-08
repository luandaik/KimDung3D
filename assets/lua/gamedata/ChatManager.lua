-- ChatManager
-- Author: Stephen
-- Date: 2014-03-20 10:34:43
--

local ChatManager = class("ChatManager")

ChatManager.MessageMax = 50
--ChatManager.AddPublicMsg = "ChatManager.AddPublicMsg"
--ChatManager.AddFriendMsg = "ChatManager.AddFriendMsg"
--ChatManager.AddGangMsg = "ChatManager.AddGangMsg"
--ChatManager.AddMyMsg = "ChatManager.AddMyMsg"

ChatManager.NewMessage = "ChatManager.NewMessage"
ChatManager.kSpeakerGoodsIdKey = "Chat.Broadcast.GoodsId"
ChatManager.kServerSpeakerGoodsIdKey = "Chat.ServerBroadcast.GoodsId"
ChatManager.NewMarkChange = "ChatManager.NewMarkChange"
ChatManager.PrivateChatListUpdated = "ChatManager.PrivateChatListUpdated"
ChatManager.PrivateChatRedPoint = "ChatManager.PrivateChatRedPoint"
ChatManager.GangChatRedPoint = "ChatManager.GangChatRedPoint"
ChatManager.PublicChatRedPoint = "ChatManager.PublicChatRedPoint"
ChatManager.ShowBubbleMsg = "ChatManager.ShowBubbleMsg"
ChatManager.PlayTalkSuccess = "ChatManager.PlayTalkSuccess"
ChatManager.PlayTalkFinish = "ChatManager.PlayTalkFinish"
ChatManager.RefreshChatProp = "ChatManager.RefreshChatProp"
function ChatManager:ctor( Data )
	--self.allMessage = TFArray:new()
	self.public = TFArray:new()
	self.server = TFArray:new()
	self.friend = TFArray:new()
	self.gang = TFArray:new()
	self.gm = TFArray:new()
	self.personChat = {}
	TFDirector:addProto(s2c.CHAT_RECEIVE,self,self.chatReceive)
	TFDirector:addProto(s2c.CHAT_MSG_RESULT,self,self.chatMsgResult)
	self:initSmileArr()
	self:initSmileConfig()
	self.newMark = {}

	self.privateChatList = TFArray:new()
	TFDirector:addProto(s2c.PRIVATE_CHAT_LIST, self, self.onPrivateChatList)
	TFDirector:addProto(s2c.SWAP_CHAT_PLAYER, self, self.onSwapChatPlayer)
	TFDirector:addProto(s2c.NEW_PRIVATE_CHAT_MESSAGE, self, self.onNewPrivateChatMessage)

	--禁言玩家
	TFDirector:addProto(s2c.GAG_PLAYER_RESULT, self, self.onGagPlayerResult)
	TFDirector:addProto(s2c.REPORT_PLAYER_RESULT, self, self.onReportPlayerResult)
	TFDirector:addProto(s2c.GAG_PLAYER, self, self.onGagPlayerInSystem)

	TFDirector:addProto(s2c.GAIN_CHAT_INFO_RESP, self, self.recvHistoryChat)
	TFDirector:addProto(s2c.NET_CHAT_PROPS, self, self.recvChatProp)

	self.isRequestPrivateChatList = false
	self.friendMessageCache = {}
	self.chatFriendInfo = nil

	self.newMessageList = {}

	self.chatHistoryStatus = {}

	self.chatDataFromServer = 1
	self.talkHandle = nil
	self.myTalkMsg = {}
	self.isOpenKnightShare = false
end

function ChatManager:judgeChatRule( channel )
	if channel== EnumChatType.Public then
		return self:judgePublic()
	elseif channel == EnumChatType.Server then
		return self:judgeServerPublic()
	elseif channel == EnumChatType.PrivateChat then
		return self:judgeFriend()
	end
	return true
end

function ChatManager:judgePublic()
	local teamLevel = MainPlayer:getLevel()
    local vipLevel = MainPlayer:getVipLevel()
    local openLevle = ConstantData:objectByID("Chat.Public.Level").value
    local openVipLevle = ConstantData:objectByID("Chat.Public.VipLevel").value
    if teamLevel < openLevle and vipLevel < openVipLevle then
		-- toastMessage(openLevle.."级才能使用世界聊天")
		toastMessage(stringUtils.format(localizable.chatMainLayer_condition,openVipLevle,openLevle))
		--toastMessage(stringUtils.format(localizable.ChatManager_level_limit, openLevle))
		return false
    end
	local speakerNumber = self:getSpeakerNumber() or 0
	if speakerNumber < 1 and MainPlayer:getChatFreeTimes() < 0 then
		-- toastMessage("没有小喇叭")
		toastMessage(localizable.ChatManager_no_tool)
		return false
	end
	--判断指导员和管理员
	local properties = MainPlayer:getPlayerProperties() or 0
	local gmFlag = bit_and(properties,2)
	local zdyFlag = bit_and(properties,1)
	if gmFlag == 0 and zdyFlag == 0 then
		self.publicSendTime = self.publicSendTime or 0
		local nowTime = GetCorrectTime()
		local temp = nowTime - self.publicSendTime
		if temp < 30 then
			-- toastMessage("发言还剩"..(30-temp).."秒")
			toastMessage(stringUtils.format(localizable.ChatManager_cd_msg, (30-temp)))
			return false
		end
	end
	return true
end

function ChatManager:sendPublic(chat )
	-- local speakerNumber = self:getSpeakerNumber() 
	-- if speakerNumber == nil or speakerNumber < 1 then

	if chat == nil or chat == "" then
		-- toastMessage("聊天消息不能为空")
		toastMessage(localizable.ChatManager_empty_msg)
		
		return false
	end

	self.publicSendMessage = self.publicSendMessage or ""
	if self.publicSendMessage == chat then
		-- toastMessage("请短时间内不要重复发送相同信息")
		toastMessage(localizable.ChatManager_same_msg)

		return false
	end
	if self:judgePublic() == false then
		return false
	end
	-- self.publicSendMessage = chat
	local Msg = {
		EnumChatType.Public,
		chat,
		NULL,
		0,
	}
	print("sendPublic",Msg)
	self:send(Msg)
	local nowTime = GetCorrectTime()
	self.publicSendTime = nowTime

	self.publicSendMessage = chat
	return true
end

function ChatManager:judgeServerPublic()
	if MainPlayer:getServerSwitchStatue(ServerSwitchType.ServerChat ) ==false then
		toastMessage(localizable.chat_serverChat_closed)
		return false
	end
	local teamLevel = MainPlayer:getLevel()
    local vipLevel = MainPlayer:getVipLevel()
    local openLevle = ConstantData:objectByID("Chat.Server.Level").value or 0
    local openVipLevle = ConstantData:objectByID("Chat.Server.VipLevel").value or 0
    if teamLevel < openLevle and vipLevel < openVipLevle then
		--toastMessage(openLevle.."级才能使用跨服聊天")
		--toastMessage(stringUtils.format(localizable.ChatManager_level_limit2, openLevle))
		toastMessage(stringUtils.format(localizable.chatMainLayer_condition,openVipLevle,openLevle))
		return false
    end
    
	local speakerNumber = self:getServerSpeakerNumber() or 0
	if speakerNumber < 1 and MainPlayer:getServerChatFreeTimes() <= 0 then
		-- toastMessage("没有小喇叭")
		local speakerConstant = ConstantData:objectByID(ChatManager.kServerSpeakerGoodsIdKey)
		MallManager:checkShopOneKey(speakerConstant.res_id)
		return false
	end
	--判断指导员和管理员
	local properties = MainPlayer:getPlayerProperties() or 0
	local gmFlag = bit_and(properties,2)
	local zdyFlag = bit_and(properties,1)
	if gmFlag == 0 and zdyFlag == 0 then
		self.serverPublicSendTime = self.serverPublicSendTime or 0
		local nowTime = GetCorrectTime()
		local temp = nowTime - self.serverPublicSendTime
		if temp < 30 then
			--toastMessage("发言还剩"..(30-temp).."秒")
			toastMessage(stringUtils.format(localizable.ChatManager_cd_msg, 30-temp))
			return false
		end
	end
	return true
end

function ChatManager:sendServerPublic(chat )

	if chat == nil or chat == "" then
		--toastMessage("聊天消息不能为空")
		toastMessage(localizable.ChatManager_empty_msg)
		return false
	end
	self.serverPublicSendMessage = self.serverPublicSendMessage or ""
	if self.serverPublicSendMessage == chat then
		--toastMessage("请短时间内不要重复发送相同信息")
		toastMessage(localizable.ChatManager_same_msg)
		return false
	end
	if self:judgeServerPublic() == false then
		return false
	end

	local Msg = {
		EnumChatType.Server,
		chat,
		NULL,
		0,
	}
	print("sendServerPublic",Msg)
	self:send(Msg)
	local nowTime = GetCorrectTime()
	self.serverPublicSendTime = nowTime
	self.serverPublicSendMessage = chat
	return true
end

function ChatManager:judgeFriend()
	if self.chatFriendInfo and self.chatFriendInfo.playerId then
		return FriendManager:isInFriendList(self.chatFriendInfo.playerId)
	end
	return false
end

function ChatManager:sendFriend(chat, friend)
	print("ChatManager:sendFriend(chat, friend)")
	if chat == nil or chat == "" then
		-- toastMessage("聊天消息不能为空")
		toastMessage(localizable.ChatManager_empty_msg)
		return
	end

	-- 在好友列表中
	if FriendManager:isInFriendList(self.chatFriendInfo.playerId) then
		local msg = {
			EnumChatType.PrivateChat,
			chat,
			self.chatFriendInfo.name,
			self.chatFriendInfo.playerId,
			}

		print(msg)

		self:send(msg)
	else
		-- toastMessage("对方已不是你的好友")
		toastMessage(localizable.ChatManager_no_friend)
	end
end

function ChatManager:sendGang(chat )
	if chat == nil or chat == "" then
		-- toastMessage("聊天消息不能为空")
		toastMessage(localizable.ChatManager_empty_msg)
		return
	end
	local Msg = {
		EnumChatType.Gang,
		chat,
		NULL,
		0,
	}
	self:send(Msg)
end

function ChatManager:sendGM(chat )
	if chat == nil or chat == "" then
		-- toastMessage("聊天消息不能为空")
		toastMessage(localizable.ChatManager_empty_msg)
		return
	end
	local Msg = {
		EnumChatType.GM,
		chat,
		NULL,
		0,
	}
	self:send(Msg)
end

function ChatManager:fillMyMsg(chatType, content)
	self.myMsg = {}

	local roleID = MainPlayer:getHeadIconId()
	local roleInfo = RoleData:objectByID(roleID)
	self.myMsg.quality   = roleInfo.quality
	if ProtagonistData:IsMainPlayer(roleId) == true then
        local cardrole = CardRoleManager:getRoleById(MainPlayer:getProfession())
        self.myMsg.quality = cardrole.quality
   	end
	self.myMsg.chatType  = chatType
	self.myMsg.content   = content
	self.myMsg.playerId  = MainPlayer:getPlayerId()
	self.myMsg.roleId    = roleID
	self.myMsg.name      = MainPlayer:getPlayerName()
	self.myMsg.vipLevel  = MainPlayer:getVipLevel()
	if not SettingManager:isVipShow() then
		self.myMsg.vipLevel = 127
	end

	self.myMsg.level     = MainPlayer:getLevel()
	self.myMsg.timestamp = MainPlayer:getNowtime() * 1000
	self.myMsg.icon 	 = MainPlayer:getHeadIconId()
	self.myMsg.headPicFrame = MainPlayer:getHeadPicFrameId()
	self.myMsg.titleType = RankManager:isInTen(MainPlayer:getPlayerId())
end

function ChatManager:getAudioPath()
	local path = ""
    if CC_TARGET_PLATFORM == CC_PLATFORM_IOS then
        path = CCFileUtils:sharedFileUtils():getWritablePath()
        path = path .. '../Library/'
        path = path .. "TFDebug/"
        path = path .. "/talkAudio/"

    elseif CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID then
        sdPath      = TFDeviceInfo.getSDPath()  
        sPackName   = TFDeviceInfo.getPackageName()
        path  = sdPath .."playmore/" .. sPackName .. "/talkAudio/"
    else
    	path = path .. "../Library/talkAudio/"
    end
    if not ErrorCodeManager:createDirIfNotExist(path) then
		return ""
	end
	return path
end

function ChatManager:BegainTalk(chatChannel)
	self.talkPath = ""
    if TFIMManager then
        local path = self:getAudioPath()
		if path ~= "" then
			local time = GetCorrectTime()
			path = path .. "audio" .. time
			if TFIMManager:StartRecording(path) == 0 then
				self.talkPath = path
				self.isTalking = true
			end
		end
    end
end

function ChatManager:EndTalk(chatChannel)
	if TFIMManager then
		if self.isTalking == true then
			self.isTalking = false
			if self.talkPath and self.talkPath ~= "" and TFIMManager:StopRecording() == 0 then	
				self.myTalkMsg.chatType = chatChannel
				TFIMManager:UploadRecordedFile(self.talkPath)
			end
		end
    end
end

function ChatManager:CancleTalk()
	if TFIMManager then
		if self.isTalking == true then
			self.isTalking = false
	        TFIMManager:StopRecording()
	    end
    end
end

function ChatManager:fillTalkMyMsg(content,audioPath,audioId)
	if audioPath then
		self.myTalkMsg.audioPath = audioPath
		self.myTalkMsg.audioTime = TFIMManager:GetAudioTimes(audioPath)
	end
	if content then
		self.myTalkMsg.content = content
	end
	if audioId then
		self.myTalkMsg.audioId = audioId
	end
end

function ChatManager:sendChatMessage(type,chat)
	print("ChatManager:send(type,chat) -> ",type,chat)
	self.isTalkMsg = false
	local value = true
	self.needCloneMyMsg = false
	self:fillMyMsg(type, chat)
	if type== EnumChatType.Public then
		value = self:sendPublic(chat)
	elseif type == EnumChatType.Gang then
		self:sendGang(chat)
	elseif type == EnumChatType.GM then
		self:sendGM(chat)
	elseif type == EnumChatType.Server then
		value = self:sendServerPublic(chat)
	elseif type == EnumChatType.PrivateChat then
		self:sendFriend(chat)
		self.needCloneMyMsg = true
	elseif type == EnumChatType.Team then
		JapanIslandManager:requestTeamChat(chat)
	elseif type == EnumChatType.Team_KingOfWar then
		KingOfWarManager:sendTeamChatMsg(KingOfWarManager:getMyTeamId(), chat)
	end
	return value
end

function ChatManager:sendTalkMessage(chat,fileID)
	if fileID ~= self.myTalkMsg.audioId then
		return
	end
	self.isTalkMsg = true
	local value = true
	self.needCloneMyMsg = false
	self:fillMyMsg(self.myTalkMsg.chatType, chat)
	self.myMsg.audioPath = self.myTalkMsg.audioPath
	self.myMsg.audioTime = self.myTalkMsg.audioTime
	self.myMsg.audioId = self.myTalkMsg.audioId
	local type = self.myTalkMsg.chatType
	if type== EnumChatType.Public then
		value = self:sendPublic(chat)
	elseif type == EnumChatType.Gang then
		self:sendGang(chat)
	elseif type == EnumChatType.GM then
		self:sendGM(chat)
	elseif type == EnumChatType.Server then
		value = self:sendServerPublic(chat)
	elseif type == EnumChatType.PrivateChat then
		self:sendFriend(chat)
		self.needCloneMyMsg = true
	elseif type == EnumChatType.Team then
		JapanIslandManager:requestTeamChat(chat)
	end
	return value
end

function ChatManager:send(msg)
	if self.isTalkMsg == true then
		msg[5] = self.myTalkMsg.audioTime
		msg[6] = self.myTalkMsg.audioId
	else
		msg[5] = 0
		msg[6] = ""
	end
	TFDirector:send(c2s.CHAT,msg)
end

--获取小喇叭个数
function ChatManager:getSpeakerNumber()
	local speakerConstant = ConstantData:objectByID(ChatManager.kSpeakerGoodsIdKey)
	local item = BagManager:getItemById(speakerConstant.res_id)
	if item == nil then
		return 0
	end
	return item.num
end
--获取跨服小喇叭个数
function ChatManager:getServerSpeakerNumber()
	local speakerConstant = ConstantData:objectByID(ChatManager.kServerSpeakerGoodsIdKey)
	local item = BagManager:getItemById(speakerConstant.res_id)
	if item == nil then
		return 0
	end
	return item.num
end

--获取小喇叭的物品实例
function ChatManager:getSpeaker()
	local speakerConstant = ConstantData:objectByID(ChatManager.kSpeakerGoodsIdKey)
	return BagManager:getItemById(speakerConstant.res_id)
end

--获取小喇叭的物品实例
function ChatManager:getServerSpeaker()
	local speakerConstant = ConstantData:objectByID(ChatManager.kServerSpeakerGoodsIdKey)
	return BagManager:getItemById(speakerConstant.res_id)
end

--发送聊天消息回调
function ChatManager:chatMsgResult( events )
	-- print("ChatManager:chatMsgResult( events )",events.data)
	local data = events.data
	if data.playerId then
		-- self.personChat.playerId = data.playerId
		--self:addPerson(self.personChat)

		-- 添加自己的消息在面板上
		if self.needCloneMyMsg then
			self.needCloneMyMsg = false
			self:addReceive(clone(self.myMsg))
		end
	end
end

--聊天消息监听
function ChatManager:chatReceive( events )
--[[
message ChatInfo
{
	required int32 chatType = 1;	// 聊天类型；1、公共，2、私聊；3、帮派； 
	required string message = 2;	//消息;
	required int32 playerId = 3;	//说话人的id 
	required string name = 4;		//说话人的名字 
}
]]
	print("ChatManager:chatReceive( events ) = ", events.data)

	local data = events.data
	-- print("chatReceive",data)
	-- pp.pp = 1
	if data.chat then
		for _,v in pairs(data.chat) do
			print("++++, ", v)
			self:addReceive(v)
		end
	end
	if self.skipMark then
		self.skipMark = false
	end
end

--消息接收增加
function ChatManager:addReceive( msg ,ishistory )
	print("ChatManager:addReceive( msg )")
	print(msg.chatType)
	if ishistory == nil then
		ishistory = false
	end
	self.latestMsg = msg
	if msg.chatType == EnumChatType.Public then
		self:addPublic(msg)		
	elseif msg.chatType == EnumChatType.Gang then
		self:addGang(msg)		
	elseif msg.chatType == EnumChatType.GM then
		self:addGM(msg)
	elseif msg.chatType == EnumChatType.PrivateChat then
		self:addFriend(msg)
	elseif msg.chatType == EnumChatType.Server then
		self:addServerPublic(msg,ishistory)
	elseif msg.chatType == EnumChatType.VipDeclaration then
		print("++++vip decla +++++++++")
		self:addVipDelaration(msg, ishistory)
	end

	TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, msg)
	TFDirector:dispatchGlobalEventWith(ChatManager.ShowBubbleMsg, {2})
end

--增加公聊消息
function ChatManager:addPublic( msg )
	self:pushMsg(self.public,msg)
	if self.skipMark then
		return
	end
	if not self.chatLayer then 
		self.newMark[1] = true
	else
		if self.chatLayer:getSelectedChannelIndex() ~= 1 then
			self.newMark[1] = true
			TFDirector:dispatchGlobalEventWith(ChatManager.PublicChatRedPoint, nil)
		end
	end
end

--增加公聊消息
function ChatManager:addServerPublic( msg ,ishistory)
	self:pushMsg(self.server,msg)
	if ishistory == nil or ishistory == false then
		NotifyManager:addServerChatNotify(msg.name , msg.content, msg.vipLevel)
	end
	-- if self.skipMark then
	-- 	return
	-- end
	-- if not self.chatLayer then 
	-- 	self.newMark[1] = true
	-- else
	-- 	if self.chatLayer:getSelectedChannelIndex() ~= 1 then
	-- 		self.newMark[1] = true
	-- 		TFDirector:dispatchGlobalEventWith(ChatManager.PublicChatRedPoint, nil)
	-- 	end
	-- end
end

function ChatManager:addVipDelaration(msg, isHistory)
	if not isHistory then
		NotifyManager:addTuhaoChat(msg.content, 1, msg.name, msg.vipLevel)
	end
end

--增加好友消息
function ChatManager:addFriend(msg)
	--print("ChatManager:addFriend", msg)
	if (msg.isKnightShare) then
		if (KnightManager:getByinstanceIdInfo(msg.instanceId) == nil) then
			return
		end
	else
		self:pushMsg(self.friend, msg)
	end
	self:addFriendMsgToCache(msg)
end

--增加个人发出消息
-- function ChatManager:addPerson(msg)
-- 	self:pushMsg(self.friend, msg)
-- end

--增加帮派消息
function ChatManager:addGang( msg )

	self:pushMsg(self.gang,msg)
	-- print("self.skipMark = ",self.skipMark)
	-- print("self.newMark[2] = ",self.newMark[2])
	-- print("+++++++++++++++++++++++++++++++++++++++++++")
	if self.skipMark then
		return
	end
	if not self.chatLayer then 
		self.newMark[2] = true
	else
		if self.chatLayer:getSelectedChannelIndex() ~= 2 then
			self.newMark[2] = true
			TFDirector:dispatchGlobalEventWith(data, nil)
		else
			TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, nil)
		end
	end
end

function ChatManager:getRedPacketByIndex( data )
	if nil == data then
		return nil
	end
	local msg = {}
	msg.chatType = EnumChatType.Gang
	msg.content = data.desc
	msg.playerId = data.sendPlayer.playerId
	msg.roleId = data.sendPlayer.icon
	msg.quality = 4
	msg.name = data.sendPlayer.name
	msg.vipLevel = data.sendPlayer.vipLevel
	msg.level = data.sendPlayer.level
	msg.timestamp = data.startTime
	msg.guildId = data.guildId
	msg.guildName = data.guildName
	msg.competence = data.sendPlayer.competence
	msg.icon = data.sendPlayer.icon
	msg.headPicFrame = data.sendPlayer.frame
	msg.redPacketGmId = data.id
	msg.redPacketId = data.redPacketId
	if data.type == 1 then
		msg.name = localizable.common_sys_notice
		msg.level = 10086
		msg.vipLevel = 6
		msg.headPicFrame = nil
		msg.chatType = EnumChatType.FactionNotice
	end
-- 	print(" ChatManager:getRedPacketByIndex",data, msg)
	print(" ChatManager:getRedPacketByIndex")
	return msg
end

function ChatManager:addRedPacketListForGang( msgList)
	if msgList == nil or #msgList <= 0 then
		return
	end
	local newArry = TFArray:new()
	local red_index = 1
	local gang_index = 1
	while red_index <= #msgList or gang_index <= self.gang:length() do
		local redPacket = nil
		if red_index <= #msgList then
			redPacket = self:getRedPacketByIndex(msgList[red_index])
		end
		local gang_Info = nil
		if gang_index <= self.gang:length() then
			gang_Info = self.gang:objectAt(gang_index)
		end
		if redPacket == nil and gang_Info == nil then
			break
		end
		if red_index > #msgList or redPacket == nil then
			newArry:pushBack(gang_Info)
			gang_index = gang_index + 1
		elseif gang_index > self.gang:length() or gang_Info == nil then
			newArry:pushBack(redPacket)
			red_index = red_index + 1
		elseif redPacket.timestamp > gang_Info.timestamp then
			newArry:pushBack(gang_Info)
			gang_index = gang_index + 1
		else
			newArry:pushBack(redPacket)
			red_index = red_index + 1
		end
	end
	self.gang = newArry

	TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, msg)
	TFDirector:dispatchGlobalEventWith(ChatManager.ShowBubbleMsg, {2})
end

--增加帮派红包消息
function ChatManager:addRedPacketForGang( data , brush)
	if nil ~= data then
		local msg = {}
		
		-- if data.type == 0 then
		-- 	msg.chatType = EnumChatType.Gang
		-- elseif data.type == 1 then
		-- 	msg.chatType = EnumChatType.FactionNotice
		-- else
		-- 	msg.chatType = EnumChatType.Gang
		-- end
		msg.chatType = EnumChatType.Gang
		msg.chatType = EnumChatType.Gang
		msg.content = data.desc
		msg.playerId = data.sendPlayer.playerId
		msg.roleId = data.sendPlayer.icon
		msg.quality = 4
		msg.name = data.sendPlayer.name
		msg.vipLevel = data.sendPlayer.vipLevel
		msg.level = data.sendPlayer.level
		msg.timestamp = data.startTime
		msg.guildId = data.guildId
		msg.guildName = data.guildName
		msg.competence = data.sendPlayer.competence
		msg.icon = data.sendPlayer.icon
		msg.headPicFrame = data.sendPlayer.frame
		msg.redPacketGmId = data.id
		msg.redPacketId = data.redPacketId
		if data.type == 1 then
			msg.name = localizable.common_sys_notice
			msg.level = 10086
			msg.vipLevel = 6
			msg.headPicFrame = nil
			msg.chatType = EnumChatType.FactionNotice
		end
		self:addGang( msg )
	end
	if brush == true then
		TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, msg)
		TFDirector:dispatchGlobalEventWith(ChatManager.ShowBubbleMsg, {2})
	end
end

-- function ChatManager:sortGangMsgByTime()
-- 	if self.gang:length() <= 1 then
-- 		return
-- 	end
-- 	local _len = 0
-- 	local sortFuncssssss = function ( msg1,msg2 )
-- 		_len= _len+1
-- 		if msg1 == nil or msg2 == nil then
-- 			return true
-- 		end
-- 		print("_len",_len)
-- 		return msg1.timestamp < msg2.timestamp
-- 	end
-- 	print('self.gang:length() = ',self.gang:length())
-- 	local len = 0
-- 	for item in self.gang:iterator() do
-- 		len = len + 1
-- 		if item == nil then
-- 			print('====>>>>>>>>>>>>>>>====121312eqweq21')
-- 			print(item)
-- 		end
-- 		print('len = ',len)
-- 	end
-- 	self.gang:sort(sortFuncssssss)
-- end
--增加GM信息
function ChatManager:addGM( msg )
	self:pushMsg(self.gm,msg)
	if self.skipMark then
		return
	end
	if not self.chatLayer then 
		-- self.newMark[3] = true
	else
		if self.chatLayer:getSelectedChannelIndex() ~= 3 then
			-- self.newMark[3] = true
		end
	end
end

--消息入栈，栈最大长度ChatManager.MessageMax
function ChatManager:pushMsg(array,msg)
	if array:length() >= ChatManager.MessageMax then
		array:pop()
	end

	local newTime = GetCorrectDate("*t", msg.timestamp/1000)
	local last = array:back()
	if last ~= nil and not last.spilt then
		local temp = GetCorrectDate("*t", last.timestamp/1000)
		--两个消息日期不一样，需要插入时间分割标记
		if temp.yday ~= newTime.yday then
			local yyyymmdd = GetCorrectDate("%Y-%m-%d",last.timestamp/1000)
			array:pushBack({spilt = true ,timestamp = last.timestamp,expression = yyyymmdd})
		end
	end
	array:pushBack(msg)
end

--初始化表情配置
function ChatManager:initSmileConfig()
	local tSmileConfig={}
	-- local tSmileConfig = {
 --        ['#24'] = '<mc src="ui_new/chat/smile/face_jingya.mp" play="auto" anim="default" />'
 --    }
--    local smileArr = self:getSmileArr()
    local szMcMsg = [[<mc src="%s" play="auto" anim="default" />]]
    local szImgMsg = [[<img src="%s" />]]
    for v in self.smileArr:iterator() do
		if v.smile_type == 1 then
			local smile = string.format(szMcMsg, v.path)
			tSmileConfig[v.name] = smile
		elseif v.smile_type == 2 then
			local smile = string.format(szImgMsg, v.path)
			tSmileConfig[v.name] = smile
		end
    end
    self.tSmileConfig = tSmileConfig
end

--获取表情配置
function ChatManager:getSmileConfig()
    return self.tSmileConfig
end

--初始化表情对应的动画
function ChatManager:initSmileArr()
	-- local smileArr = TFArray:new()
 --    smileArr:push({name="#20", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#21", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#22", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#23", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#24", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#25", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#26", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#27", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#28", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#29", path="ui_new/chat/smile/face_jingya.mp"})
 --    smileArr:push({name="#30", path="ui_new/chat/smile/face_jingya.mp"})
    self.smileArr = require('lua.table.t_s_smile.lua')
end



--获取表情动画array
function ChatManager:getSmileArr()
	return self.smileArr
end

--获取所有消息列表
--function ChatManager:getAllList()
--	return self.allMessage
--end

--获得公聊消息列表
function ChatManager:getPublicList()
	return self.public
end

--获得公聊消息列表
function ChatManager:getServerPublicList()
	return self.server
end

--获得好友消息列表
function ChatManager:getFriendList()
	return self.friend
end

--获得帮派消息列表
function ChatManager:getGangList()
	return self.gang
end

--获取GM消息列表
function ChatManager:getGMList()
	return self.gm
end

--根据频道类型获取聊天消息列表
function ChatManager:getMessageListByType(channelType)
	if channelType == nil then
		return self:getPublicList()
	elseif channelType == 0 then
		return self:getPublicList()
	elseif channelType == EnumChatType.Public then
		return self:getPublicList()
	elseif channelType == EnumChatType.Gang then
		return self:getGangList()
	elseif channelType == EnumChatType.GM then
		return self:getGMList()
	elseif channelType == EnumChatType.PrivateChat then
		return self:getFriendList()
	elseif channelType == EnumChatType.Server then
		return self:getServerPublicList()
	elseif channelType == EnumChatType.Team then
		if (JapanIslandManager:checkIsInTeam()) then
			--队伍聊天
			return JapanIslandManager:getTeamChatMsg()
		else
			--队伍邀请
			return JapanIslandManager:getRefuseSuccessMsg()
		end
	elseif channelType == EnumChatType.Team_KingOfWar then
		if (KingOfWarManager:checkIsInTeam()) then
			--队伍聊天
			return KingOfWarManager:getTeamChatMsg()
		else
			--队伍邀请
			return KingOfWarManager:getRefuseSuccessMsg()
		end
	end
end

--获取公聊消息格式
function ChatManager:getPublicStr()
    local szMSG = [[<p style="text-align:left margin:5px"><font face="simhei" color="#000000" >%s</font></p>]]
	return szMSG
end
-- --获取公聊消息格式
-- function ChatManager:getPublicStr()
--     local szMSG = [[<p style="text-align:left margin:5px"><font color="#000000">[公共]</font><a id="1000" name="rolename" href="reload"><font color="#FFFFFF">%s:</font></a><font color="#FFFFFF">%s</font></p>]]
-- 	return szMSG
-- end

--获取好友消息格式
function ChatManager:getFriendStr()
    local szMSG = [[<p style="text-align:left margin:5px"><font color="#000000">[私聊]</font><a id="1000" name="rolename" href="reload"><font color="#FF0000">%s</font></a><font color="#000000">对你说:</font><font color="#FFFFFF">%s</font></p>]]
	return szMSG
end

--获取我自己的消息格式
function ChatManager:getMyChatStr()
	local szMSG = [[<p style="text-align:left margin:5px"><font color="#000000">[私聊]</font><font color="#000000">你对</font><a id="1000" name="rolename" href="reload"><font color="#FF0000">%s</font></a><font color="#000000">说:</font><font color="#FFFFFF">%s</font></p>]]
	return szMSG
end

--获取帮派消息格式
function ChatManager:getGangStr()
	local szMSG = [[<p style="text-align:left margin:5px"><font color="#000000">[帮派]</font><a id="1000" name="rolename" href="reload"><font color="#FFFF00">%s:</font></a><font color="#FFFFFF">%s</font></p>]]
	return szMSG
end

function ChatManager:getGMStr()
	local szMSG = [[<p style="text-align:left margin:5px"><font color="#000000">[帮派]</font><a id="1000" name="rolename" href="reload"><font color="#FFFF00">%s:</font></a><font color="#FFFFFF">%s</font></p>]]
	return szMSG
end

function ChatManager:getRickTextExpressionByType(type)
	if type == nil then
		return self:getPublicStr()
	elseif type == 0 then
		return self:getPublicStr()
	elseif type == EnumChatType.Public then
		return self:getPublicStr()
	elseif type == EnumChatType.Gang then
		return self:getGangStr()
	elseif type == EnumChatType.GM then
		return self.getGMStr()
	end
end

--打开于某人的私聊
function ChatManager:openPersonChat( playername )
	--测试代码，目前没有私聊设定
	if true then
		assert("目前没有私聊设定")
		return
	end

	local layer = AlertManager:getLayerByName("ChatMainLayer")
	if layer == nil then
		layer = require("lua.logic.chat.ChatMainLayer"):new()
		AlertManager:addLayer(layer)
		AlertManager:show()
	else
		AlertManager:showLayerByName("ChatMainLayer")
	end
	layer:changeGroupChoice(4)
	layer:setFriendName(playername )
end

function ChatManager:openMainLayer( index )
	local layer = AlertManager:getLayerByName("ChatMainLayer")
	if layer == nil then
		layer = require("lua.logic.chat.ChatMainLayer"):new()
		AlertManager:addLayer(layer)
		AlertManager:show()
	else
		AlertManager:showLayerByName("ChatMainLayer")
	end
	layer:changeGroupChoice(index)
end

--重置
function ChatManager:restart()
	-- self.allMessage:clear()
	self.public:clear()
	self.server:clear()
	self.friend:clear()
	self.gang:clear()
	self.gm:clear()
	--self.newMark = {}
	self.skipMark = true

	self.isRequestPrivateChatList = false

	self.newMessageList = {}

	self.chatHistoryStatus = {}
	self.chatDataFromServer = 1
	self.isOpenKnightShare = false
	self.latestMsg = nil
end

--析构
function ChatManager:dispose()
	--self.allMessage:clear()
	--self.allMessage = nil
	self.public:clear()
	self.public = nil
	self.server:clear()
	self.server = nil
	self.friend:clear()
	self.friend = nil
	self.gang:clear()
	self.gang = nil
	self.gm:clear()
	self.gm = nil

	self.tSmileConfig:clear()
	self.tSmileConfig = nil
	self.smileArr:clear()
	self.smileArr= nil

	self.privateChatList:clear()
	self.privateChatList = nil

	self.friendMessageCache = nil
	self.isOpenKnightShare = false
end
function ChatManager:isOpenKnightShareLayer()
	return self.isOpenKnightShare
end
function ChatManager:setOpenKnightShareLayer(isShow)
	self.isOpenKnightShare = isShow
end
--显示聊天界面
function ChatManager:showChatLayer()
	-- local layer  = require("lua.logic.chat.ChatMainLayer"):new()
    local layer = AlertManager:addLayerByFile("lua.logic.chat.ChatMainLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
    return layer
end

--红点判断逻辑
--是否有新的消息
function ChatManager:isHaveNewChat()
	if RedPacketManager:checkRedPoint() == true then
		return true
	end
	if not self.newMark then
		return false
	end

	for _k,_v in pairs(self.newMark) do
		if _v then
			return true
		end
	end
	return false
end

--是否有特定类型的新的消息
--index:1\2\3 江湖、帮派、GM频道
function ChatManager:isHaveNewChatForIndex(index)
	if self.newMark and self.newMark[index] then
		return self.newMark[index]
	end
	return false;
end

--进入相应聊天界面，红点消失
--index:1\2\3 江湖、帮派、GM频道
function ChatManager:onIntoChatLayer(index)
	--服务端记录，并推送前端
	if self.newMark and self.newMark[index] then
		self.newMark[index] = false
		TFDirector:dispatchGlobalEventWith(ChatManager.NewMarkChange , 0)
	end
end

-- 请求私聊列表
function ChatManager:requestPrivateChatList()
	print("ChatManager:requestPrivateChatList()")

	if not self.isRequestPrivateChatList then
		TFDirector:send(c2s.GAIN_PRIVATE_CHAT_LIST_REQUSTER, {})
	else
		-- 请求更新私聊列表
		TFDirector:dispatchGlobalEventWith(ChatManager.PrivateChatListUpdated)
	end
end

-- 私聊列表回调
function ChatManager:onPrivateChatList(events)
	print("ChatManager:onPrivateChatList(events)")

	self.isRequestPrivateChatList = true

	local data = events.data
	if data.playerId then
		print(data.playerId)

		-- 私聊列表数据
		self.privateChatList:clear()
		for _, v in pairs(data.playerId) do
			self.privateChatList:pushBack(v)
		end

		-- 存入新消息列表中用于做cell的小红点
		self.newMessageList = data.playerId

		self:showPrivateChatRedPoint()
	end

	-- 请求更新私聊列表
	TFDirector:dispatchGlobalEventWith(ChatManager.PrivateChatListUpdated)
end

-- 获取私聊列表
function ChatManager:getPrivateChatList()
	print("ChatManager:getPrivateChatList()")
	return self.privateChatList
end

-- 切换聊天对象
function ChatManager:swapCurrentChatPlayer(playerID)
	print("ChatManager:swapCurrentChatPlayer(playerID)", playerID)
	TFDirector:send(c2s.SWAP_CURRENT_CHAT_PLAYER, {playerID})
end

-- 切换聊天对象回调
function ChatManager:onSwapChatPlayer(events)
	print("ChatManager:onSwapChatPlayer(events)")
	local data = events.data
	if data.chat then
		print(data.chat)
		for _, v in pairs(data.chat) do
			v.sourceID = v.playerId
			self:addReceive(v)
		end
	end
end

-- 新私聊消息回调
function ChatManager:onNewPrivateChatMessage(events)
	print("ChatManager:onNewPrivateChatMessage(events)", events.data)
	local data = events.data
	if data.playerId then
		-- 删除已经在聊天列表中的playerID
		for i = 1, self.privateChatList:length() do
			if self.privateChatList:objectAt(i) == data.playerId then
				self.privateChatList:removeObjectAt(i)
				break
			end
		end
		
		-- 把新消息的playerID放在列表的最前面
		self.privateChatList:pushFront(data.playerId)

		-- 存入新消息列表中用于做cell的小红点
		table.insert(self.newMessageList, data.playerId)

		-- 在私聊界面才会刷新
		if self.chatLayer and self.chatLayer:getSelectedChannelIndex() == EnumChatType.PrivateChat then
			-- 请求更新私聊列表
			TFDirector:dispatchGlobalEventWith(ChatManager.PrivateChatListUpdated)
		else
			local chatFriendInfo = {}
			chatFriendInfo.playerId = data.playerId
			self:setChatFriendInfo(chatFriendInfo)
			self:swapCurrentChatPlayer(data.playerId)
			TFDirector:dispatchGlobalEventWith(ChatManager.ShowBubbleMsg, {4})
		end

		self:showPrivateChatRedPoint()		
	end
end

-- 添加和好友聊天的消息到缓存中
function ChatManager:addFriendMsgToCache(msg)
	print("ChatManager:addFriendMsgToCache(msg)")
	--print(msg)
	print("self.chatFriendInfo ", self.chatFriendInfo)

	if self.chatFriendInfo then
		if (msg.isKnightShare) then
			local playerId = msg.playerId
			self.friendMessageCache[playerId] = self.friendMessageCache[playerId] or {}
	 	    for k,v in pairs(self.friendMessageCache[playerId]) do
	 	    	if (v.instanceId and v.instanceId == msg.instanceId) then
	 	    		return
	 	    	end
	 	    end
	 	    print("武士2  ", playerId)
	 		table.insert(self.friendMessageCache[playerId], msg)
		else
			self.friendMessageCache[self.chatFriendInfo.playerId] = self.friendMessageCache[self.chatFriendInfo.playerId] or {}
			
			table.insert(self.friendMessageCache[self.chatFriendInfo.playerId], msg)
		end
	elseif (msg.isKnightShare) then
		local playerId = msg.playerId
	 	self.friendMessageCache[playerId] = self.friendMessageCache[playerId] or {}
 	    for k,v in pairs(self.friendMessageCache[playerId]) do
 	    	if (v.instanceId and v.instanceId == msg.instanceId) then
 	    		return
 	    	end
 	    end
 	    print("武士1  ", playerId)
 		table.insert(self.friendMessageCache[playerId], msg)
	end
end

function ChatManager:deleteFriendKnightShareCache(sharePlayerId, instanceId)
	self.friendMessageCache[sharePlayerId] = self.friendMessageCache[sharePlayerId] or {}
	for k,v in pairs(self.friendMessageCache[sharePlayerId]) do
    	if (v.instanceId and v.instanceId == instanceId) then 
    		table.remove(self.friendMessageCache[sharePlayerId], k)
    		self:switchFriendMessagesByID(sharePlayerId, true)
    		TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, {})
    		break
    	end
    end
end

function ChatManager:setChatFriendInfo(chatFriendInfo)
	print("ChatManager:setChatFriendInfo(chatFriendInfo)")
	print(chatFriendInfo)
	self.chatFriendInfo = chatFriendInfo
end

function ChatManager:clearFriendChat()
	print("ChatManager:clearFriendChat()")
	self.friend:clear()

	TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, nil)
end

function ChatManager:switchFriendMessagesByID(friendID, isDelKnight)
	print("----------ChatManager:switchFriendMessagesByID(friendID)")
	local playerId = nil
	if (self.chatFriendInfo and isDelKnight ~= true) then
		playerId = self.chatFriendInfo.playerId
	elseif (isDelKnight) then
		playerId = friendID
	end
	local msg = self.friendMessageCache[playerId]
	-- print("1111 switchFriendMessagesByID",msg)
	-- print("2222 switchFriendMessagesByID",self.friend)
	self.friend:clear()
	if msg then
		for i = 1, #msg do
			self:pushMsg(self.friend, msg[i])
			TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, msg)
		end
	end
end

function ChatManager:showPrivateChatRedPoint()
	print("ChatManager:showPrivateChatRedPoint()")
	if self.skipMark then
		return
	end

	if not self.chatLayer then
		self.newMark[3] = true
	else
		if self.chatLayer:getSelectedChannelIndex() ~= EnumChatType.PrivateChat then
			self.newMark[3] = true
		end
	end

	if self.newMark[3] then
		TFDirector:dispatchGlobalEventWith(ChatManager.PrivateChatRedPoint, nil)
	end
end

function ChatManager:hidePrivateChatRedPoint()
	self.newMark[3] = false
end

function ChatManager:getNewMessageList()
	return self.newMessageList
end

function ChatManager:removeNewMessageByID(playerId)
	for i = 1, #self.newMessageList do
		if self.newMessageList[i] == playerId then
			table.remove(self.newMessageList, i)
			break
		end
	end
end

function ChatManager:addInviteFactionData(playerId)
	print("ChatManager:addInviteFactionData(playerId)", playerId)

	for i = 1, self.public:length() do
		local msg = self.public:objectAt(i)
		if msg.playerId == playerId then
			msg.invitationGuilds = msg.invitationGuilds or {}
			table.insert(msg.invitationGuilds, FactionManager:getPersonalInfo().guildId)
		end
	end
end

function ChatManager:clearGangChat()
	print("ChatManager:clearGangChat()")
	self.gang:clear()
	TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, nil)
end

function ChatManager:hideGuildInviteButtons(guildId)
	
	if guildId == 0 then
		for i = 1, self.gang:length() do
			local msg = self.gang:objectAt(i)
			if msg.showInviteBtns ~= nil then
				msg.showInviteBtns = false
			end
		end
	else
		for i = 1, self.gang:length() do
			local msg = self.gang:objectAt(i)
			
			if msg.guildId == guildId then
				if msg.showInviteBtns ~= nil then
					msg.showInviteBtns = false
				end
			end
		end
	end

	TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, nil)
end

function ChatManager:onGagPlayerResult( event )
	-- toastMessage("禁言成功")
	toastMessage(localizable.ChatManager_forb_chat)
	hideLoading();
	AlertManager:close()
end

function ChatManager:onReportPlayerResult( event )
	-- toastMessage("举报成功")
	toastMessage(localizable.ChatManager_jubao)
	hideLoading();
	AlertManager:close()
end

function ChatManager:onGagPlayerInSystem(event)

	print("onGagPlayerInSystem = ",event.data)
	local data = event.data

	local sec = data.time + 1
	local hour = math.floor(sec/3600)
	local day = math.floor(hour/24)
	local msgStr = nil
	if day > 0 then
		-- msgStr = data.name.." 因发送内容不当,禁言 "..day.." 天"
		msgStr = stringUtils.format(localizable.ChatManager_jubao_1, day)
	else
		-- msgStr = data.name.." 因发送内容不当,禁言 "..hour.." 小时"
		msgStr = stringUtils.format(localizable.ChatManager_jubao_2, day)
	end

	local msg = {}
	msg.content = msgStr
	msg.level = 1
	msg.playerId = 0
	msg.quality = 0
	msg.chatType = 1
	msg.roleId = 0
	msg.timestamp = MainPlayer:getNowtime()*1000
	msg.name = localizable.common_sys_notice --"系统公告"
	self:addReceive(msg)
end

function ChatManager:requestSubChatProp(channel)
	showLoading()
	TFDirector:send(c2s.NET_CHAT_PROPS, {channel})
end

function ChatManager:requestHistoryChat(channel)

	if self.chatHistoryStatus[channel] ~= nil then 
		return
	end
	self.chatHistoryStatus[channel] = true

	showLoading()
	-- 类型 1世界、2公会
	TFDirector:send(c2s.GAIN_CHAT_INFO, {channel})
end

function ChatManager:recvHistoryChat(event)

	hideLoading()
	if  event.data == nil then
		return
	end

	-- 安卓 不显示历史记录
	if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID then
		return
	end

	local chatList = event.data.infos
	-- print('ChatManagerrecvHistoryChat = ', event.data)
	if chatList then
		for _,v in pairs(chatList) do
			self:addReceive(v,true)
		end
	end

end

function ChatManager:recvChatProp(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(ChatManager.RefreshChatProp, nil)
end
-- s2c.GAIN_CHAT_INFO_RESP

function ChatManager:getLatestMsg()
	return self.latestMsg
end

function ChatManager:checkInChatLayer()
	if self.chatLayer then
		return true
	end
	return false
end

function ChatManager:playTalk(id,path)
	print("ChatManager:playTalk==id==>>",id )
	print("ChatManager:playTalk==path==>>",path )

	if id == nil or id == "" then
		return path,false
	end
	--print("")
	if path == nil then
		if CC_TARGET_PLATFORM == CC_PLATFORM_IOS then
	        path = CCFileUtils:sharedFileUtils():getWritablePath()
	        path = path .. '../Library/'
	        path = path .. "TFDebug/"
	        path = path .. "/talkAudio/"

	    elseif CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID then
	        sdPath      = TFDeviceInfo.getSDPath()  
	        sPackName   = TFDeviceInfo.getPackageName()
	        path  = sdPath .."playmore/" .. sPackName .. "/talkAudio/"
	    else
	    	path = path .. "../Library/talkAudio/"
	    end
	    if not ErrorCodeManager:createDirIfNotExist(path) then
			return nil ,false
		end

	    path = path .. id
	end
	if TFFileUtil:existFile(path) then
		TFIMManager:PlayRecordedFile(path)
		TFDirector:dispatchGlobalEventWith(ChatManager.PlayTalkSuccess, {id})
		return path,true
	end

	self.curDowUrlId = id
	if TFIMManager then
		local strId = id .. ""
		if TFIMManager:DownloadRecordedFile(strId,path) ~= 0 then
			self.curDowUrlId = nil
		end
	end
	return path,false
end

function ChatManager:talkFinish( path )
	TFDirector:dispatchGlobalEventWith(ChatManager.PlayTalkFinish, {path})
end

function ChatManager:checkFileExist(szFullPath)
	if not szFullPath then return true end

	if szFullPath[#szFullPath] == "/" then
		return TFFileUtil:existFile(szFullPath)
	else
		local fileHandle = io.open(szFullPath,'r')
		if not fileHandle then
			return false
		else
			fileHandle:close()
		end

		return true
	end
end


function ChatManager:createDirIfNotExist(szPath)
	-- body
	local dir = string.match(szPath,".*/")
	if not dir then
		self.szErr = szPath .. " format error"
		return false
	end

	if not self:checkFileExist(dir) then
		bCreateDir = TFFileUtil:createDir(dir)
		if not bCreateDir then
			self.szErr             = "wirte file " .. szPath .."error"
			return false
		end
	end

	return true
end

return ChatManager:new()