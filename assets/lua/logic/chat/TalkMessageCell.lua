--[[
******聊天消息cell*******

	-- by david.dai
	-- 2014/06/23
]]

local TalkMessageCell = class("TalkMessageCell", BaseLayer)

function TalkMessageCell:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.chat.GMMessageCell")
end

function TalkMessageCell:initUI(ui)
	self.super.initUI(self,ui)

	--消息背景
	self.panel_bg	 		= TFDirector:getChildByPath(ui, 'panel_bg')
	self.img_msg_bg	 		= TFDirector:getChildByPath(ui, 'img_msg_bg')
	self.img_spilt	 		= TFDirector:getChildByPath(ui, 'img_spilt')


	self.panel_msg	 		= TFDirector:getChildByPath(ui, 'panel_msg')
	self.img_head 			= TFDirector:getChildByPath(ui, 'img_head')
	self.img_icon			= TFDirector:getChildByPath(ui, 'img_icon')
	self.lbl_level 			= TFDirector:getChildByPath(ui, 'lbl_level')
	self.txt_level 			= TFDirector:getChildByPath(ui, 'txt_level')
	--o表示vip文字。如：o15
	self.txt_vip 			= TFDirector:getChildByPath(ui, 'txt_vip')

	self.txt_name 			= TFDirector:getChildByPath(ui, 'txt_name')
	self.txt_msg 			= TFDirector:getChildByPath(ui, 'txt_msg')
	self.txt_timestamp 		= TFDirector:getChildByPath(ui, 'txt_time')

	self.txt_position 		= TFDirector:getChildByPath(ui, 'txt_position')

	self.img_title			= TFDirector:getChildByPath(ui, "img_title")
	self.img_title:setVisible(false)

	self.img_title:setVisible(false)

	self.img_head.logic 	= self

	self.txt_msg:setVisible(false)

	self.namePosition = self.txt_name:getPosition()

	--added by wuqi
	self.path_new_vip = {"ui_new/chat/img_vip_16.png", "ui_new/chat/img_vip_17.png", "ui_new/chat/img_vip_18.png"}
	self.img_vip = TFDirector:getChildByPath(ui, "img_vip")
	self.img_vip:setScale(0.6)

	self.pos_txt_name1 = self.txt_name:getPosition()
	self.pos_txt_position1 = self.txt_position:getPosition()
	self.pos_img_title1 = self.img_title:getPosition()

	self.pos_txt_name2 = ccp(self.txt_name:getPosition().x - 60, self.txt_name:getPosition().y)
	self.pos_txt_position2 = ccp(self.txt_position:getPosition().x - 60, self.txt_position:getPosition().y)
	self.pos_img_title2 = ccp(self.img_title:getPosition().x - 60, self.img_title:getPosition().y)

	self.panel_yuyin1 = TFDirector:getChildByPath(ui, "panel_yuyin1")
	self.panel_yuyin1:setVisible(false)

	self.panel_yuyin2 = TFDirector:getChildByPath(ui, "panel_yuyin2")
	self.panel_yuyin2:setVisible(false)
	self.maxLength = 20
	self.img_msg_bg:setVisible(false)
	self.starHeroEffect = nil
end

function TalkMessageCell:removeUI()
	self.super.removeUI(self)
end

function TalkMessageCell:setMessage(message)
	self.message = message
	self:refreshUI()
end

function TalkMessageCell:setLogic(logiclayer)
	self.logic = logiclayer
end

--added by wuqi
function TalkMessageCell:addVipEffect(btn, vipLevel)
	if btn.effect then
		btn.effect:removeFromParent()
		btn.effect = nil
	end

	vipLevel = tonumber(vipLevel)
	if vipLevel <= 15 or vipLevel > 18 then
		return
	end
	local resPath = "effect/ui/vip_" .. vipLevel .. ".xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("vip_" .. vipLevel .. "_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(btn:getContentSize().width / 2, btn:getContentSize().height / 2))
    effect:setVisible(true)
    effect:setScale(0.85)
    effect:setContentSize(CCSize(57, 14))
    effect:playByIndex(0, -1, -1, 1)
    btn:addChild(effect, 200)
    btn.effect = effect
end

function TalkMessageCell:checkContent(str)
	local stringIndex = 1
	local prevStr = ""
	local currStr = ""
	local fontNum = 0
	local strLength = string.len(str)
	if strLength <= self.maxLength then
		return true
	end
	
	for i=1,strLength do			
		if stringIndex > strLength then
			return true
		end
		local c = string.sub(str,stringIndex,stringIndex)
		local b = string.byte(c)
		if b >= 240 then
        	stringIndex = stringIndex + 4
		elseif b >= 224 then
        	stringIndex = stringIndex + 3
		elseif b >= 192 then
            stringIndex = stringIndex + 2
        else
            stringIndex = stringIndex + 1
        end
        fontNum = fontNum + 1
        if fontNum > self.maxLength then
        	return false
        end
	end  
	return true
end

function TalkMessageCell:refreshUI()
	local message = self.message
	local roleData =  RoleData:objectByID(message.icon)

	print("++++vip++++", message.vipLevel)
	--added by wuqi
	self.txt_vip:setVisible(true)
	self.img_vip:setVisible(false)

	self.txt_name:setPosition(self.pos_txt_name1)
	self.txt_position:setPosition(self.pos_txt_position1)
	self.img_title:setPosition(self.pos_img_title1)

	print("roleData = ", roleData)
	print("message = ", message)
	if roleData == nil then

		roleData =  RoleData:objectByID(1)
		self.img_icon:setTexture(roleData:getIconPath())		
		Public:addFrameImg(self.img_icon,message.headPicFrame)               --pck change head icon and head icon frame

		self.txt_name:setText(message.name)
		self.txt_vip:setText("1")
		self.txt_level:setText("1")
		self.img_vip:setVisible(false)
	else
		self.img_icon:setTexture(roleData:getIconPath())
		Public:addFrameImg(self.img_icon,message.headPicFrame)               --pck change head icon and head icon frame
		self.txt_name:setText(message.name)
		self.txt_vip:setText("o".. message.vipLevel)
		self.txt_level:setText(message.level)
		--added by wuqi
		if tonumber(message.vipLevel) > 15 and tonumber(message.vipLevel) <= 18 then
			self.txt_vip:setVisible(false)
			self.img_vip:setVisible(true)
			self:addVipEffect(self.img_vip, message.vipLevel)
		end

		--added by wuqi
		if SettingManager.TAG_VIP_YINCANG == tonumber(message.vipLevel) then
			self.txt_vip:setVisible(false)
			self.img_vip:setVisible(false)

			self.txt_name:setPosition(self.pos_txt_name2)
			self.txt_position:setPosition(self.pos_txt_position2)
			self.img_title:setPosition(self.pos_img_title2)
		end
	end

	-- print("message.content = ",message.content)
	self:SetContentMsg(message.content)
	self.txt_timestamp:setText(self:getTimeFormatString())

	-- GM .....
	if message.roleId == 0 then
		self.txt_vip:setVisible(false)
		self.txt_level:setVisible(false)
		self.lbl_level:setVisible(false)
		self.img_vip:setVisible(false)
		self.txt_name:setPosition(ccp(self.txt_vip:getPosition().x - 30, self.txt_vip:getPosition().y))
		self.img_icon:setTexture("icon/roleicon/11000.png")
	else
		self.txt_vip:setVisible(true)
		self.txt_level:setVisible(true)
		self.lbl_level:setVisible(true)
		self.txt_name:setPosition(self.namePosition)
		if tonumber(message.vipLevel) > 15 and tonumber(message.vipLevel) <= 18 then
			self.txt_vip:setVisible(false)
			self.img_vip:setVisible(true)
			self:addVipEffect(self.img_vip, message.vipLevel)
		end
		--added by wuqi
		if SettingManager.TAG_VIP_YINCANG == tonumber(message.vipLevel) then
			self.txt_vip:setVisible(false)
			self.img_vip:setVisible(false)

			self.txt_name:setPosition(self.pos_txt_name2)
			self.txt_position:setPosition(self.pos_txt_position2)
			self.img_title:setPosition(self.pos_img_title2)
		end
	end

	Public:addInfoListen(self.img_icon,false)
	self.img_icon:setFlipX(true)
	if message.chatType == EnumChatType.Public then
		if message.guildId and message.guildId > 0 then
			self.txt_position:setVisible(true)
			self.txt_position:setText("（" .. message.guildName .. "）")
			self.txt_position:setPositionX(self.txt_name:getPositionX() + self.txt_name:getSize().width)
		else
			self.txt_position:setVisible(false)
		end
		Public:addInfoListen(self.img_icon,true,4,message.playerId)
	elseif message.chatType == EnumChatType.PrivateChat then
		self.txt_position:setVisible(false)
		Public:addInfoListen(self.img_icon,true,1,message.playerId)
	elseif message.chatType == EnumChatType.Gang then
		self.txt_position:setVisible(true)
		-- 如果是系统消息
		if message.systemMsg then
			-- 显示公会名还是职位
			if message.showGuidNameOrPosition == 1 then
				self.txt_position:setText("（" .. message.guildName .. "）")
			elseif message.showGuidNameOrPosition == 2 then
				if message.competence == 1 then
					--self.txt_position:setText("（帮主）")
					self.txt_position:setText(localizable.common_faction_no_1)
				elseif message.competence == 2 then
					--self.txt_position:setText("（副帮主）")
					self.txt_position:setText(localizable.common_faction_no_2)
				else
					--self.txt_position:setText("（帮众）")
					self.txt_position:setText(localizable.common_faction_no_3)
				end
				Public:addInfoListen(self.img_icon,true,3,message.playerId)
			end
		else
			if message.competence == 1 then
				--self.txt_position:setText("（帮主）")
				self.txt_position:setText(localizable.common_faction_no_1)
			elseif message.competence == 2 then
				--self.txt_position:setText("（副帮主）")
				self.txt_position:setText(localizable.common_faction_no_2)
			else
				--self.txt_position:setText("（帮众）")
				self.txt_position:setText(localizable.common_faction_no_3)
			end
			Public:addInfoListen(self.img_icon,true,3,message.playerId)
		end
		self.txt_position:setPositionX(self.txt_name:getPositionX() + self.txt_name:getSize().width)
	elseif message.chatType == EnumChatType.FactionNotice then
		self.txt_position:setVisible(false)
		self.txt_name:setPositionX(self.txt_msg:getPositionX())
		self.txt_vip:setVisible(false)
		self.txt_level:setText(message.level)
		self.img_vip:setVisible(false)
		local iconPath = FactionManager:getMyBannerIconPath()
		self.img_icon:setTexture(iconPath)	
		self.img_icon:setFlipX(false)
	elseif message.chatType == EnumChatType.Server then
		self.txt_position:setVisible(true)
		local id = message.serverId or 0
		local serverName = message.serverName or ""
		self.txt_position:setText("（" ..serverName .. "）")
		self.txt_position:setPositionX(self.txt_name:getPositionX() + self.txt_name:getSize().width)
		Public:addInfoListen(self.img_icon,true,5,message.playerId,message.serverId)
	else
		self.txt_position:setVisible(false)
	end
	--增加称号
	self.img_title:setVisible(false)
	if message.titleType then
		-- if message.titleType > 0 and message.titleType < 11 then
			if self.txt_position:isVisible() then
				local currX = self.txt_position:getPositionX()
				local currX = currX + self.txt_position:getSize().width + 10
				self.img_title:setVisible(true)
				self.img_title:setPositionX(currX)
				self.img_title:setTexture(RankManager:getTitlePic(message.titleType))
			else
				local currX = self.txt_name:getPositionX()
				local currX = currX + self.txt_name:getSize().width + 10
				self.img_title:setVisible(true)
				self.img_title:setPositionX(currX)
				self.img_title:setTexture(RankManager:getTitlePic(message.titleType))
			end
		-- end
	else
		--周年庆
		if (MainPlayer:isOneYearBirth()) then
			local currX = self.txt_name:getPositionX()
			local currX = currX + self.txt_name:getSize().width + 10
			self.img_title:setVisible(true)
			self.img_title:setPositionX(currX)
			self.img_title:setTexture(RankManager:getTitlePic(11))
		end
	end
	--增加指导员标签
	print("message.guideType = ",message.guideType)
	if StarHeroManager:getServerSwitchStatue() == true and message.starHeroRanking and message.starHeroRanking > 0 then
		if self.starHeroEffect ~= nil then
			self.starHeroEffect:removeFromParent(true)
			self.starHeroEffect = nil
		end
		self.starHeroEffect = Public:getStarHeroEffect()
		self.starHeroEffect:playByIndex(0,-1,-1,1)
		self.starHeroEffect:setScale(0.75)
		local posY = self.txt_name:getPositionY()
		self.starHeroEffect:setPositionY(posY)
		self.panel_msg:addChild(self.starHeroEffect,100)
		self.starHeroEffect:setVisible(true)
		if self.img_title:isVisible() then
			local currX = self.img_title:getPositionX()
			currX = currX + self.img_title:getSize().width + 10 + 40
			self.starHeroEffect:setPositionX(currX)
		else
			if self.txt_position:isVisible() then
				local currX = self.txt_position:getPositionX()
				currX = currX + self.txt_position:getSize().width + 10 + 40
				self.starHeroEffect:setPositionX(currX)
			else
				local currX = self.txt_name:getPositionX()
				currX = currX + self.txt_name:getSize().width + 10 + 40
				self.starHeroEffect:setPositionX(currX)
			end
		end
	else
		if self.starHeroEffect then
			self.starHeroEffect:setVisible(false)
		end
	end
	-- if message.guideType then
	-- 	local flag = bit_and(message.guideType,1)
	-- 	if flag ~= 0 then
	-- 		self.img_zdy:setVisible(true)
	-- 	else
	-- 		self.img_zdy:setVisible(false)
	-- 	end
	-- else
	-- 	self.img_zdy:setVisible(false)
	-- end
end

function TalkMessageCell.onPlayTalkClick(sender)
	local self = sender.logic
	local audioId = self.message.audioId
	local audioPath = self.message.audioPath
	local path,play = ChatManager:playTalk(audioId,audioPath)
	if play == true then
		self:playEffect()
	end
	self.message.audioPath = path
	print("onPlayTalkClick path = ",path)
end

function TalkMessageCell:SetContentMsg(content)
	local showWord = self:checkContent(content)
	print("self:checkContent(content) = ",showWord)
	self.panel_yuyin1:setVisible(false)
	self.panel_yuyin2:setVisible(false)
	local panel = self.panel_yuyin1
	if showWord == true then
		panel = self.panel_yuyin2
	end
	panel:setVisible(true)
	local txt_duihua = TFDirector:getChildByPath(panel, "txt_duihua")
	local img_di = TFDirector:getChildByPath(panel, "img_di")
	img_di:setTouchEnabled(true)
	img_di:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPlayTalkClick))
	img_di.logic = self
	local img_duihua = TFDirector:getChildByPath(panel, "img_duihua")
	if self.message.playerId == MainPlayer:getPlayerId() then
		img_duihua:setTexture("ui_new/chat/img_yuyin2.png")
	else
		img_duihua:setTexture("ui_new/chat/img_yuyin1.png")
	end
	local txt_time = TFDirector:getChildByPath(img_duihua, "txt_time")
	txt_time:setText(self.message.audioTime .. localizable.time_second_txt) -- time {p1}秒
	if txt_duihua then

		txt_duihua:setText(content)
		local txtsize = txt_duihua:getContentSize()
		width0 = txtsize.width + 40
		width1 = txtsize.width - 20
		if width1 < 70 then
			width1 = 70
			width0 = 130
		-- elseif width1 > 500 then
		-- 	width1 = 500
		-- max img_di width 560
		end
		local size0 = img_di:getContentSize()
		size0.width = width0
		img_di:setContentSize(size0)
		size0 = img_duihua:getContentSize()
		size0.width = width1
		img_duihua:setContentSize(size0)
		print("img_duihua:setContentSize(size0) ",size0)
		txt_time:setPositionX(width1*0.5)
	end
	if self.soundEffect ~= nil then
		self.soundEffect:removeFromParent()
		self.soundEffect = nil
	end
		local resPath = "effect/chat_sound_effect.xml"
	    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
	    local effect = TFArmature:create("chat_sound_effect_anim")
	    if effect == nil then
	    	return
	    end
	    effect:setAnimationFps(GameConfig.ANIM_FPS)
	    local size = img_duihua:getContentSize()
	    local pos = img_duihua:getPosition()
	    pos.x = pos.x + size.width + 30
	    effect:setPosition(pos)
	    self:addChild(effect,100)

	    self.soundEffect = effect

	self:stopAllActions()
	self.soundEffect:gotoFrame(20)
end

function TalkMessageCell:playEffect()
	if self.soundEffect == nil then
		return
	end
	self.soundEffect:playByIndex(0,-1,-1,1)
	local callFuncN = CCCallFuncN:create( function()
            self.soundEffect:stop()
			self.soundEffect:gotoFrame(20)
        end
    )
    local acArr = TFVector:create()
    local delayAc = CCDelayTime:create(self.message.audioTime)
    acArr:addObject(delayAc)
    acArr:addObject(callFuncN)
	self:runAction(CCSequence:create(acArr))
end

function TalkMessageCell:getTimeFormatString()
	local seconds = self.message.timestamp / 1000
	return GetCorrectDate("%X", seconds)
end

function TalkMessageCell.iconBtnClickHandle(sender)
	print(sender.logic.message)

	if sender.logic.message.chatType == EnumChatType.Public or sender.logic.message.chatType == EnumChatType.Gang then
		if sender.logic.message.playerId ~= MainPlayer:getPlayerId() and sender.logic.message.roleId ~= 0 then
    		local layer = AlertManager:addLayerToQueueAndCacheByFile(
        		"lua.logic.chat.ChatOperatePanel", AlertManager.BLOCK_AND_GRAY_CLOSE)

			local bg = TFDirector:getChildByPath(layer, "bg")

    		local pos = sender:getParent():convertToWorldSpaceAR(sender:getPosition())
			pos = layer:convertToNodeSpace(pos);

			local size = sender:getSize()
			pos.x = pos.x + (size.width / 2 * sender:getScaleX())
			pos.y = pos.y + (size.height / 2 * sender:getScaleY())
	
			bg:setPosition(pos)

			layer:setModelType(MainPlayer:getPlayerProperties(), sender.logic.message.playerId, sender.logic.message.name)

			-- 帮派频道不能邀请
			if sender.logic.message.chatType == EnumChatType.Gang then
				layer:setFriendID(sender.logic.message.playerId,sender.logic.message.level)
				layer:setCanInvite(false)

    			AlertManager:show()
    			return
			end

			local canInvite = true

			-- 自己没有帮派
			if not FactionManager:isJoinFaction() then
				canInvite = false
			end

			-- 对方有帮派
			if sender.logic.message.guildId and sender.logic.message.guildId > 0 then
				canInvite = false
				layer:setIsHasFaction(true)
			else
				layer:setIsHasFaction(false)
			end

			-- 已被自己的帮派邀请过
			if canInvite then
				local myGuildID = FactionManager:getPersonalInfo().guildId
				if sender.logic.message.invitationGuilds then
					for _,v in pairs(sender.logic.message.invitationGuilds) do
						if v == myGuildID then
							canInvite = false
							break
						end
					end
				end
			end

			layer:setFriendID(sender.logic.message.playerId,sender.logic.message.level)
			layer:setCanInvite(canInvite)

    		AlertManager:show()
    	end
    end
end

function TalkMessageCell.onGetkRedPacket( sender )
	local gmid = sender.redPacketGmId
	RedPacketManager:requestGetRedPacket(gmid)
end

function TalkMessageCell:registerEvents()
	self.super.registerEvents(self)
	self.playTalkSuccessHandle = function(event)
		if self.message and event.data[1][1] == self.message.audioId then
        	self:playEffect()
        end
    end

	TFDirector:addMEGlobalListener(ChatManager.PlayTalkSuccess  ,self.playTalkSuccessHandle)
end

function TalkMessageCell:removeEvents()
    self.img_head:removeMEListener(TFWIDGET_CLICK)
    TFDirector:removeMEGlobalListener(ChatManager.PlayTalkSuccess  ,self.playTalkSuccessHandle)
    self.super.removeEvents(self)
end

function TalkMessageCell:getSize()
	return self.ui:getSize()
end

return TalkMessageCell
