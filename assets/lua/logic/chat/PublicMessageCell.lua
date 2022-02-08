--[[
******聊天消息cell*******

	-- by david.dai
	-- 2014/06/23
]]

local PublicMessageCell = class("PublicMessageCell", BaseLayer)

function PublicMessageCell:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.chat.PublicMessageCell")
end

function PublicMessageCell:initUI(ui)
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

	self.img_hbbg			= TFDirector:getChildByPath(ui, 'img_hbbg')
	self.img_hbbg:setVisible(false)

	self.txt_hbmsg			= TFDirector:getChildByPath(ui, 'txt_hbmsg')
	self.txt_hbmsg:setText("")

	self.img_title			= TFDirector:getChildByPath(ui, "img_title")
	self.img_title:setVisible(false)

	self.img_zdy			= TFDirector:getChildByPath(ui, "img_zdy")
	self.img_title:setVisible(false)

	self.img_head.logic 	= self
	self:creatRichText()
	self:creatRichTextHB()
	self.txt_msg:setVisible(false)

	self.btn_accept = TFDirector:getChildByPath(ui, 'btn_accept')
	self.btn_ignore = TFDirector:getChildByPath(ui, 'btn_ignore')
	self.btn_accept.logic = self
	self.btn_ignore.logic = self
	self.btn_accept:setVisible(false)
	self.btn_ignore:setVisible(false)

	self.btn_jujue 			= TFDirector:getChildByPath(ui, "btn_jujue")
	self.btn_jieshou		= TFDirector:getChildByPath(ui, "btn_jieshou")
	self.img_ygq			= TFDirector:getChildByPath(ui, "img_ygq")
	self.btn_jujue.logic = self
	self.btn_jieshou.logic = self
	self.img_ygq:setVisible(false)
	self.btn_jujue:setVisible(false)
	self.btn_jieshou:setVisible(false)
	self.btn_chakan 		= TFDirector:getChildByPath(ui, "btn_chakan")
	self.btn_wolaiyige		= TFDirector:getChildByPath(ui, "btn_wolaiyige")
	self.btn_lingqu			= TFDirector:getChildByPath(ui, "btn_lingqu")
	self.btn_chakan:setVisible(false)
	self.btn_chakan.logic = self
	self.btn_wolaiyige:setVisible(false)
	self.btn_wolaiyige.logic = self
	self.btn_lingqu:setVisible(false)
	self.btn_lingqu.logic = self

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
	self.starHeroEffect = nil
end

function PublicMessageCell:creatRichTextHB()
	if self.richtextHB then
		return
	end
	self.richtextHB  = TFRichText:create(self.txt_hbmsg:getSize())
	self.richtextHB:setFontSize(20)
	self.richtextHB:setPosition(self.txt_hbmsg:getPosition())
	self.richtextHB:setAnchorPoint(self.txt_hbmsg:getAnchorPoint())
	self.txt_hbmsg:getParent():addChild(self.richtextHB)
end

function PublicMessageCell:creatRichText()
	if self.richtext then
		return
	end
	self.richtext  = TFRichText:create(self.txt_msg:getSize())
	self.richtext:setFontSize(20)
	self.richtext:setPosition(self.txt_msg:getPosition())
	self.richtext:setAnchorPoint(self.txt_msg:getAnchorPoint())
	self.txt_msg:getParent():addChild(self.richtext)
end

function PublicMessageCell:removeUI()
	self.super.removeUI(self)
end

function PublicMessageCell:setMessage(message)
	self.message = message
	self:refreshUI()
end

function PublicMessageCell:setLogic(logiclayer)
	self.logic = logiclayer
end

--added by wuqi
function PublicMessageCell:addVipEffect(btn, vipLevel)
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

function PublicMessageCell:refreshUI()
	local message = self.message
	local roleData =  RoleData:objectByID(message.icon)

	-- -- 修改字体大小
	-- if message.chatType == EnumChatType.Gang then
	-- 	if message.systemMsg then
	-- 		self.richtext:setFontSize(20)
	-- 	else
	-- 		self.richtext:setFontSize(30)
	-- 	end
	-- end

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
		--assert("designer is bad guy.role data not found : ",message.roleId)
		--game master role data fix
		-- roleData =  RoleData:objectByID(1)
		-- self.img_icon:setTexture(roleData:getIconPath())
		-- self.img_head:setTexture(GetColorIconByQuality(message.quality))

		roleData =  RoleData:objectByID(1)
		self.img_icon:setTexture(roleData:getIconPath())		
		--self.img_head:setTexture(GetColorIconByQuality(message.quality))
		Public:addFrameImg(self.img_icon,message.headPicFrame)               --pck change head icon and head icon frame

		self.txt_name:setText(message.name)
		self.txt_vip:setText("1")
		self.txt_level:setText("1")		
		-- self.txt_msg:setText(message.content)
		-- self.txt_timestamp:setText(self:getTimeFormatString())

		--added by wuqi
		self.img_vip:setVisible(false)
	else
		self.img_icon:setTexture(roleData:getIconPath())
		--self.img_head:setTexture(GetColorIconByQuality(message.quality))
		Public:addFrameImg(self.img_icon,message.headPicFrame)               --pck change head icon and head icon frame
		self.txt_name:setText(message.name)
		self.txt_vip:setText("o".. message.vipLevel)
		self.txt_level:setText(message.level)
		-- self.txt_msg:setText(message.content)
		-- self.txt_timestamp:setText(self:getTimeFormatString())

		--added by wuqi
		if tonumber(message.vipLevel) > 15 and tonumber(message.vipLevel) <= 18 then
			self.txt_vip:setVisible(false)
			self.img_vip:setVisible(true)
			--self.img_vip:setTexture(self.path_new_vip[vipLevel - 15])
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

	--self.img_icon:setTexture(roleData:getIconPath())
	--self.img_head:setTexture(GetColorIconByQuality(message.quality))
	--self.txt_name:setText(message.name)
	--self.txt_vip:setText("o".. message.vipLevel)
	--self.txt_level:setText(message.level)
	--self.txt_msg:setText(message.content)
	--self.txt_timestamp:setText(self:getTimeFormatString())

	-- self.txt_msg:setText(message.content)
	local tSmileConfig = ChatManager:getSmileConfig()
    local szMSG = ChatManager:getPublicStr()
    -- local szInput = message.content
    local szInput = string.gsub(message.content, "([\\uE000-\\uF8FF]|\\uD83C[\\uDF00-\\uDFFF]|\\uD83D[\\uDC00-\\uDDFF])", "")

    -- 非系统信息则 需要处理html字符
    if message.roleId ~= 0 then
    	szInput = szInput:gsub( "<", '&lt;')
    	szInput = szInput:gsub( ">", '&gt;')
   	end

	print("message.content = ",message.content)
    for k, v in pairs(tSmileConfig) do
        szInput = string.gsub(szInput, k, v)
    end

    local szSendMSG = string.format(szMSG, szInput)
	self.richtext:setText(szSendMSG)
	self.richtextHB:setText("")
	self.txt_timestamp:setText(self:getTimeFormatString())

	-- GM .....
	if message.roleId == 0 then
		self.txt_vip:setVisible(false)
		self.txt_level:setVisible(false)
		self.lbl_level:setVisible(false)
		self.img_vip:setVisible(false)

		-- self.txt_name:setPosition(self.txt_vip:getPosition())
		self.txt_name:setPosition(ccp(self.txt_vip:getPosition().x - 30, self.txt_vip:getPosition().y))
		self.img_icon:setTexture("icon/roleicon/11000.png")
		--self.img_head:setTexture(GetColorIconByQuality(5))	
	else
		self.txt_vip:setVisible(true)
		self.txt_level:setVisible(true)
		self.lbl_level:setVisible(true)

		self.txt_name:setPosition(self.namePosition)

		--added by wuqi
		--local vipLevel = MainPlayer:getVipLevel()
		if tonumber(message.vipLevel) > 15 and tonumber(message.vipLevel) <= 18 then
			self.txt_vip:setVisible(false)
			self.img_vip:setVisible(true)
			--self.img_vip:setTexture(self.path_new_vip[vipLevel - 15])
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

	-- 隐藏按钮
	self.btn_accept:setVisible(false)
	self.btn_ignore:setVisible(false)
	self.btn_chakan:setVisible(false)
	self.btn_wolaiyige:setVisible(false)
	self.btn_lingqu:setVisible(false)
	self.img_hbbg:setVisible(false)
	self.btn_jujue:setVisible(false)
	self.btn_jieshou:setVisible(false)
	self.txt_hbmsg:setText("")
	Public:addInfoListen(self.img_icon,false)
	self.img_icon:setFlipX(true)
	if message.chatType == EnumChatType.Public then
		-- 系统消息 guildId 为 nil
		if message.guildId and message.guildId > 0 then
			self.txt_position:setVisible(true)
			self.txt_position:setText("（" .. message.guildName .. "）")

			self.txt_position:setPositionX(self.txt_name:getPositionX() + self.txt_name:getSize().width)
			--if 
			--local titlePic = RankManager:getTitlePic( index )
		else
			self.txt_position:setVisible(false)
		end
		Public:addInfoListen(self.img_icon,true,4,message.playerId)
	elseif (message.chatType == EnumChatType.PrivateChat) then
		
		if (message.isKnightShare) then
			self.btn_chakan:setVisible(true)
			self.btn_chakan.isShowKnight 	= true
			self.btn_chakan.instanceId 		= message.instanceId
			self.btn_chakan.sharePlayerId 	= message.sharePlayerId
		end
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

			-- 是否显示邀请按钮
			local messageTime = MainPlayer:getNowtime() - math.floor(message.timestamp/1000)
			local viewFlag = true
			if messageTime >= (24*60*60) then
				viewFlag = false
			end
			if viewFlag and message.showInviteBtns then
				self.btn_accept:setVisible(true)
				self.btn_ignore:setVisible(true)
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
		if message.redPacketGmId and message.redPacketGmId > 0 then
			local redPacket = RedPacketManager:getRedPacketByGmId(message.redPacketGmId)
			
			if redPacket then
				self.btn_chakan:setVisible(true)
				self.btn_chakan.redPacketGmId = message.redPacketGmId
				self.btn_lingqu.redPacketGmId = message.redPacketGmId
				if RedPacketManager:isRedPacketCanReceiveByObject(redPacket) == false then
					self.btn_wolaiyige:setVisible(true)
				else
					self.btn_lingqu:setVisible(true)
				end
				self.img_hbbg:setVisible(true)
				local rppath = "ui_new/chat/img_bphb.png"
				local pathList = {	"ui_new/chat/img_bphb.png",
									"ui_new/chat/img_5000hb.png",
									"ui_new/chat/img_1whb.png"}
				rppath = pathList[message.redPacketId] or rppath
			    local des =  [[<p style="text-align:left">]];
			    des = des .. [[<img src="]] .. rppath .. [["></img>]]
			    des = des .. [[<font color="#000000" fontSize = "20">]]
			    des = des .. message.content
			    des = des .. [[</font>]]
			    des = des .. [[</p>]]
				self.richtextHB:setText(des)
				self.richtext:setText("")
			end
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
		self.txt_position:setPositionX(self.txt_name:getPositionX() + self.txt_name:getSize().width)
		if message.redPacketGmId and message.redPacketGmId > 0 then
			local redPacket = RedPacketManager:getRedPacketByGmId(message.redPacketGmId)
			
			if redPacket then
				self.btn_chakan:setVisible(true)
				self.btn_chakan.redPacketGmId = message.redPacketGmId
				self.btn_lingqu.redPacketGmId = message.redPacketGmId
				if RedPacketManager:isRedPacketCanReceiveByObject(redPacket) == false then
					self.btn_wolaiyige:setVisible(true)
				else
					self.btn_lingqu:setVisible(true)
				end
				self.img_hbbg:setVisible(true)
				local rppath = "ui_new/chat/img_bphb.png"
				local pathList = {	"ui_new/chat/img_bphb.png",
									"ui_new/chat/img_5000hb.png",
									"ui_new/chat/img_1whb.png"}
				rppath = pathList[message.redPacketId] or rppath
			    local des =  [[<p style="text-align:left">]];
			    des = des .. [[<img src="]] .. rppath .. [["></img>]]
			    des = des .. [[<font color="#000000" fontSize = "20">]]
			    des = des .. message.content
			    des = des .. [[</font>]]
			    des = des .. [[</p>]]
				self.richtextHB:setText(des)
				self.richtext:setText("")
				self.txt_position:setPositionX(self.txt_name:getPositionX())
			end
		end
		if message.level == 10086 then
			self.lbl_level:setVisible(false)
			self.txt_level:setVisible(false)
		end
		
	elseif message.chatType == EnumChatType.Server then
		self.txt_position:setVisible(true)
		local id = message.serverId or 0
		local serverName = message.serverName or ""
		self.txt_position:setText("（" ..serverName .. "）")

		self.txt_position:setPositionX(self.txt_name:getPositionX() + self.txt_name:getSize().width)
		--self.img_head:setTexture(GetColorIconByQuality(message.quality))	
		Public:addInfoListen(self.img_icon,true,5,message.playerId,message.serverId)
	elseif (message.chatType == EnumChatType.Team) then
		-- print("mmmm ==>> ", message)
		if (JapanIslandManager:checkIsInTeam() == false) then
			
			local text1 = localizable.JapanIslandrMyTeam
			local text2 = localizable.JapanIslandInviteJoin
			if (message.isAssist and tonumber(message.isAssist) == 1) then
				--好友助战
				text1 = localizable.JapanIsland_invite1
				text2 = localizable.JapanIsland_invite2
				self.btn_jieshou.helpType = 1
			else
				if message.showType and message.showType == 1 then
					text1 = localizable.JapanIslandrMyTeamFriend
					text2 = localizable.JapanIslandInviteJoinFriend
				end
			end
			
			
		    local des =  [[<p style="text-align:left">]];
		    des = des .. [[<font color="#000000" fontSize = "20">]]
		    des = des .. stringUtils.format(text1)
		    des = des .. [[</font>]]
		    des = des .. [[<font color="#FF0000" fontSize = "20">]]
		    message.chapterId = message.chapterId or 1
		    local chapData = JapanTeamChapterData:objectByID(message.chapterId)
		    des = des .. chapData.name
		    des = des .. [[</font>]]
		    des = des .. [[<font color="#000000" fontSize = "20">]]
		    des = des .. stringUtils.format(text2)
		    des = des .. [[</font>]]
		    des = des .. [[</p>]]

			self.richtextHB:setText(des)
			self.richtext:setText("")
			self.btn_jujue:setVisible(true)
			self.btn_jujue.idTeam = message.teamId
			self.btn_jujue:setTouchEnabled(true)
			self.btn_jieshou.idTeam = message.teamId
			self.btn_jujue.chatType = message.chatType
			self.btn_jieshou.chatType = message.chatType
			self.btn_jieshou:setVisible(true)		
			self.btn_jieshou:setTouchEnabled(true)
		else
			self.btn_jujue:setVisible(false)
			self.btn_jieshou:setVisible(false)
		end
		local showType = 3
		local isIsland = false
		if (message.serverId ~= nil and message.serverId ~= 0) then
			showType = 5
		end

		Public:addInfoListen(self.img_icon,true, showType,message.playerId, message.serverId)
		self.txt_position:setVisible(false)
	elseif (message.chatType == EnumChatType.Team_KingOfWar) then
		if (KingOfWarManager:checkIsInTeam() == false) then
		    local des =  [[<p style="text-align:left">]];
		    des = des .. [[<font color="#000000" fontSize = "20">]]
		    des = des .. stringUtils.format(localizable.KingWarMyTeam)
		    des = des .. [[</font>]]
		    des = des .. [[<font color="#FF0000" fontSize = "20">]]
		    des = des .. message.teamName
		    des = des .. [[</font>]]
		    des = des .. [[<font color="#000000" fontSize = "20">]]
		    des = des .. stringUtils.format(localizable.KingWarInviteJoin)
		    des = des .. [[</font>]]
		    des = des .. [[</p>]]

			self.richtextHB:setText(des)
			self.richtext:setText("")
			self.btn_jujue:setVisible(true)
			self.btn_jujue.idTeam = message.teamId
			self.btn_jujue:setTouchEnabled(true)
			self.btn_jieshou.idTeam = message.teamId
			self.btn_jujue.chatType = message.chatType
			self.btn_jieshou.chatType = message.chatType
			self.btn_jieshou:setVisible(true)		
			self.btn_jieshou:setTouchEnabled(true)
		else
			self.btn_jujue:setVisible(false)
			self.btn_jieshou:setVisible(false)
		end
		Public:addInfoListen(self.img_icon,true,3,message.playerId)
		self.txt_position:setVisible(false)
	else
		self.txt_position:setVisible(false)
	end
	--增加称号
	self.img_title:setVisible(false)
	if message.headPicFrame == 19 then
		message.titleType = 11
	end
	if message.titleType then
		-- if message.titleType > 0 and message.titleType <= 11 then
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
			local currX = self.txt_position:getPositionX()
			local currX = currX + self.txt_name:getSize().width + 10
			self.img_title:setVisible(true)
			self.img_title:setPositionX(currX)
			self.img_title:setTexture(RankManager:getTitlePic(11))
		end
	end
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
	
	self:showCrossZhengBaEffect(message)
	--增加指导员标签
	print("message.guideType = ",message.guideType)

	if message.guideType then
		local flag = bit_and(message.guideType,1)
		if flag ~= 0 then
			self.img_zdy:setVisible(true)
		else
			self.img_zdy:setVisible(false)
		end
	else
		self.img_zdy:setVisible(false)
	end
end

function PublicMessageCell:showCrossZhengBaEffect( message )
	if CrossZhengBaManager:getServerSwitchStatue() == true and message.ladderGrade and message.ladderGrade > 0 then
        local effect = Public:getCrossZhengBaEffect(message.ladderGrade)
        if effect then
            if self.crosszhengbaEffect ~= nil then
                self.crosszhengbaEffect:removeFromParent()
                self.crosszhengbaEffect = nil
            end
            self.crosszhengbaEffect = effect
            self.crosszhengbaEffect:setAnchorPoint(ccp(0,0.5))
			
            self.panel_msg:addChild(self.crosszhengbaEffect,100)
            if self.starHeroEffect and self.starHeroEffect:isVisible() == true then
                local pos = self.starHeroEffect:getPosition()
                pos.x = pos.x + 34
                self.crosszhengbaEffect:setPosition(pos)
            else
            	local posY = self.txt_name:getPositionY()
				self.crosszhengbaEffect:setPositionY(posY)
                if self.img_title:isVisible() then
					local currX = self.img_title:getPositionX()
					currX = currX + self.img_title:getSize().width + 10 - 5 
					self.crosszhengbaEffect:setPositionX(currX)
				else
					if self.txt_position:isVisible() then
						local currX = self.txt_position:getPositionX()
						currX = currX + self.txt_position:getSize().width + 10 - 5
						self.crosszhengbaEffect:setPositionX(currX)
					else
						local currX = self.txt_name:getPositionX()
						currX = currX + self.txt_name:getSize().width + 10 - 5
						self.crosszhengbaEffect:setPositionX(currX)
					end
				end
            end
            return
        end
    end
    if self.crosszhengbaEffect then
        self.crosszhengbaEffect:setVisible(false)
    end
end
--
function PublicMessageCell:getTimeFormatString()
	local seconds = self.message.timestamp / 1000
	return GetCorrectDate("%X", seconds)
end

function PublicMessageCell.iconBtnClickHandle(sender)
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

function PublicMessageCell.onAccept(sender)
	local messageTime = MainPlayer:getNowtime() - math.floor(sender.logic.message.timestamp/1000)
	print("CCCCC = ",messageTime)
	print(sender.logic.message)
	if messageTime >= (24*60*60) then
		--toastMessage("邀请已过期")
		toastMessage(localizable.publicMessageCell_time_out)
		sender.logic.btn_accept:setVisible(false)
		sender.logic.btn_ignore:setVisible(false)		
		return
	end
	FactionManager:operateInvitation(1, sender.logic.message.guildId)
end

function PublicMessageCell.onIgnore(sender)
	local messageTime = MainPlayer:getNowtime() - math.floor(sender.logic.message.timestamp/1000)
	if messageTime >= (24*60*60) then
		--toastMessage("邀请已过期")
		toastMessage(localizable.publicMessageCell_time_out)
		sender.logic.btn_accept:setVisible(false)
		sender.logic.btn_ignore:setVisible(false)		
		return
	end
	FactionManager:operateInvitation(2, sender.logic.message.guildId)
end

function PublicMessageCell.onCheckRedPacket( sender )
	if (sender.isShowKnight) then
		ChatManager:setOpenKnightShareLayer(true)
		local shareList     = KnightManager:getKnghtShareList()
	    if (#shareList <= 0) then
	    	toastMessage(localizable.Knight_share_tips2)
	    	TFDirector:dispatchGlobalEventWith(ChatManager.NewMessage, {})
		else
			KnightManager:openKnightFriendHelpLayer(sender.sharePlayerId)
		end
		return
	end
	local gmid = sender.redPacketGmId
	RedPacketManager:openLuckRankLayer(gmid)
end

function PublicMessageCell.onSendRedPacket( sender )
	RedPacketManager:openMainLayer()
end

function PublicMessageCell.onGetkRedPacket( sender )
	local gmid = sender.redPacketGmId
	RedPacketManager:requestGetRedPacket(gmid)
end

function PublicMessageCell.onJoinRepulseTeam( sender )
	local self = sender.logic
	 sender:setTouchEnabled(false)
	if sender.chatType == EnumChatType.Team then
		local tType = 0
		if sender.joinType == 1 then
			tType = 4
		end
		JapanIslandManager:deleteInvitationMsg(sender.idTeam)
		if (sender.helpType == 1) then
			PublicMessageCell:japanIslandTips(tType, sender.idTeam, MainPlayer:getPlayerId(), true, sender.helpType)
		else
			JapanIslandManager:requestOperateTeam(tType, sender.idTeam, MainPlayer:getPlayerId(), true, sender.helpType)
		end
		
		if self.logic then
			self.logic:refreshTableView()
		end
	elseif sender.chatType == EnumChatType.Team_KingOfWar then
		-- 0接受 1拒绝
		KingOfWarManager:requestJoinTeamByInvitation(sender.idTeam, sender.joinType)
	end
end

function PublicMessageCell:registerEvents()
	self.super.registerEvents(self)

	-- self.btn_accept:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAccept))
	-- self.btn_ignore:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onIgnore))
	-- self.btn_chakan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckRedPacket))
	-- self.btn_wolaiyige:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSendRedPacket))
	-- self.btn_lingqu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGetkRedPacket))

	self.btn_jujue:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onJoinRepulseTeam))
	self.btn_jieshou:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onJoinRepulseTeam))
	self.btn_jujue.joinType 	= 1
	self.btn_jieshou.joinType 	= 0
	self.btn_chakan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckRedPacket))
	self.btn_wolaiyige:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSendRedPacket))
	self.btn_lingqu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGetkRedPacket))
	self.btn_accept:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAccept))
	self.btn_ignore:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onIgnore))
end

function PublicMessageCell:removeEvents()
    self.img_head:removeMEListener(TFWIDGET_CLICK)
    self.super.removeEvents(self)
end

function PublicMessageCell:getSize()
	return self.ui:getSize()
end

--
function PublicMessageCell:japanIslandTips(tType, idTeam, playerId, boolValue, helpType)
    --"助战该玩家不会消耗挑战半数次数，但也不会获得奖励，是否确认？"
	CommonManager:showOperateSureLayer(
		function(data, widget)
			JapanIslandManager:requestOperateTeam(tType, idTeam, playerId, boolValue, helpType)
		end,
		function(data, widget)
			AlertManager:close()
		end,
		{
			msg = localizable.JapanIsland_invite3
		}
	)
end

return PublicMessageCell
