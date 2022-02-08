--[[    This module is developed by Eason
    2015/10/22
]]
local FriendCell = class("FriendCell", BaseLayer)

local localVars = {
	type = nil,
	pageIndex = {friendsList = 1, addFriend = 2, applicationList = 3, friendsTeam = 4},
	parentLayer = nil,
}

function FriendCell:ctor(data)
	self.super.ctor(self, data)
	
	self.checkPlayerId = nil
	-- init
	self:init("lua.uiconfig_mango_new.friends.FriendCell")
end

function FriendCell:initUI(ui)
	self.super.initUI(self, ui)
	
	self.playerID = nil
	self.info = nil
	
	-- left area
	self.head = TFDirector:getChildByPath(ui, "bg")
	assert(self.head)
	self.head.parent = self
	self.head:setTouchEnabled(true)
	
	self.img_Frame = TFDirector:getChildByPath(ui, "bg_head")
	assert(self.img_Frame)
	
	self.bg_name = TFDirector:getChildByPath(ui, "bg_name")
	assert(self.bg_name)
	
	self.headIcon = TFDirector:getChildByPath(ui, "Img_icon")
	assert(self.headIcon)
	
	self.bg_head = TFDirector:getChildByPath(ui, "bg_head")
	assert(self.bg_head)
	self.bg_head:setTouchEnabled(false)
	
	
	self.levelText = TFDirector:getChildByPath(ui, "txt_level")
	assert(self.levelText)
	
	self.nameText = TFDirector:getChildByPath(ui, "txt_name")
	assert(self.nameText)
	
	self.vipText = TFDirector:getChildByPath(ui, "txt_vip")
	assert(self.vipText)
	
	self.battleScoreText = TFDirector:getChildByPath(ui, "txt_zdl")
	assert(self.battleScoreText)
	
	self.loginTime = TFDirector:getChildByPath(ui, "txt_dl")
	assert(self.loginTime)
	
	-- right area
	self.buttonGet = TFDirector:getChildByPath(ui, "Btn_get")
	assert(self.buttonGet)
	self.buttonGet.parent = self
	
	--召回按钮
	self.Btn_zhaohui = TFDirector:getChildByPath(ui, "Btn_zhaohui")
	assert(self.Btn_zhaohui)
	self.Btn_zhaohui.parent = self
	
	self.buttonSend = TFDirector:getChildByPath(ui, "Btn_send")
	assert(self.buttonSend)
	self.buttonSend.parent = self
	
	self.imageHasGot = TFDirector:getChildByPath(ui, "Image_hasGot")
	assert(self.imageHasGot)
	
	self.imageHasSent = TFDirector:getChildByPath(ui, "Image_hasSent")
	assert(self.imageHasSent)
	
	self.buttonIngore = TFDirector:getChildByPath(ui, "Btn_ingore")
	assert(self.buttonIngore)
	self.buttonIngore.parent = self
	
	self.buttonAgree = TFDirector:getChildByPath(ui, "Btn_tongyi")
	assert(self.buttonAgree)
	self.buttonAgree.parent = self
	
	self.buttonAdd = TFDirector:getChildByPath(ui, "Btn_add")
	assert(self.buttonAdd)
	self.buttonAdd.parent = self
	
	self.imageHasRequested = TFDirector:getChildByPath(ui, "Image_hasRequested")
	assert(self.imageHasRequested)
	
	self.btn_yq = TFDirector:getChildByPath(ui, "Btn_yq")
	self.btn_yq.logic = self
	
	self.btn_yaoqing = TFDirector:getChildByPath(ui, "btn_yaoqing")
	self.btn_yaoqing.logic = self
	self.btn_yaoqingzz = TFDirector:getChildByPath(ui, "btn_yaoqingzz")
	self.btn_yaoqingzz.logic    = self
    self.btn_yaoqingzz.helpType = 1
    self.btn_yaoqing.helpType   = 1
	assert(self.btn_yq)
	--added by wuqi
	self.path_new_vip = {"ui_new/chat/img_vip_16.png", "ui_new/chat/img_vip_17.png", "ui_new/chat/img_vip_18.png"}
	self.img_vip = TFDirector:getChildByPath(ui, "img_vip")
	self.starHeroEffect = nil
end

function FriendCell:onShow()
	self.super.onShow(self)
end

function FriendCell:registerEvents()
	self.super.registerEvents(self)
	
	self.head:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onFriendInfo))
	self.buttonGet:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGet))
	self.buttonSend:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSend))
	self.buttonAdd:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAddFriend))
	self.buttonIngore:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onIngoreFriend))
	self.buttonAgree:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAgreeFriend))
	self.Btn_zhaohui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZhaohui))
	self.btn_yq:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onInvite))
	self.btn_yaoqingzz:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onInviteJapanIsland))
	self.btn_yaoqing:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onInviteJapanIsland))
end

function FriendCell:removeEvents()
	self.head:removeMEListener(TFWIDGET_CLICK)
	self.buttonGet:removeMEListener(TFWIDGET_CLICK)
	self.buttonSend:removeMEListener(TFWIDGET_CLICK)
	self.buttonAdd:removeMEListener(TFWIDGET_CLICK)
	self.buttonIngore:removeMEListener(TFWIDGET_CLICK)
	self.buttonAgree:removeMEListener(TFWIDGET_CLICK)
	self.Btn_zhaohui:removeMEListener(TFWIDGET_CLICK)
	self.btn_yq:removeMEListener(TFWIDGET_CLICK)
	self.super.removeEvents(self)
end

function FriendCell:dispose()
	self.super.dispose(self)
end

function FriendCell:setParentLayer(layer)
	localVars.parentLayer = layer
end

function FriendCell:hideAllButtons()
	self.buttonGet:setVisible(false)
	self.buttonSend:setVisible(false)
	self.imageHasGot:setVisible(false)
	self.imageHasSent:setVisible(false)
	self.buttonIngore:setVisible(false)
	self.buttonAgree:setVisible(false)
	self.buttonAdd:setVisible(false)
	self.imageHasRequested:setVisible(false)
	self.Btn_zhaohui:setVisible(false)
	self.btn_yq:setVisible(false)
end

--added by wuqi
function FriendCell:addVipEffect(btn, vipLevel)
	if btn.effect then
		btn.effect:removeFromParent()
		btn.effect = nil
	end
	
	if vipLevel <= 15 or vipLevel > 18 then
		return
	end
	local resPath = "effect/ui/vip_" .. vipLevel .. ".xml"
	TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
	local effect = TFArmature:create("vip_" .. vipLevel .. "_anim")
	effect:setAnimationFps(GameConfig.ANIM_FPS)
	effect:setPosition(ccp(btn:getContentSize().width / 2, btn:getContentSize().height / 2))
	effect:setVisible(true)
	effect:setScale(0.82)
	effect:playByIndex(0, - 1, - 1, 1)
	btn:addChild(effect, 200)
	btn.effect = effect
end

function FriendCell:showStarHeroEffect(isStarHero, vipLevel)
	if StarHeroManager:getServerSwitchStatue() == true and isStarHero and isStarHero > 0 then
		if self.starHeroEffect ~= nil then
			self.starHeroEffect:removeFromParent()
			self.starHeroEffect = nil
		end
		local bgSize = self.bg_name:getSize()
		self.starHeroEffect = Public:getStarHeroEffect()
		self.starHeroEffect:setScale(0.85)
		self.starHeroEffect:playByIndex(0, - 1, - 1, 1)
		local posY = self.nameText:getPositionY() + bgSize.height * 0.5
		self.starHeroEffect:setPositionY(posY)
		self.bg_name:addChild(self.starHeroEffect, 100)
		self.starHeroEffect:setVisible(true)
		if vipLevel == nil or SettingManager.TAG_VIP_YINCANG == tonumber(vipLevel) then
			self.starHeroEffect:setPositionX(self.vipText:getPositionX() + bgSize.width * 0.5 + 37)
		else
			self.starHeroEffect:setPositionX(self.vipText:getPositionX() + bgSize.width * 0.5 + 150)
		end
	else
		if self.starHeroEffect then
			self.starHeroEffect:setVisible(false)
		end
	end
end
function FriendCell:setInfo(type, info, isIsland)
	localVars.type = type
	self.info = info
	self.playerID = info.playerId
	
	self.isIsland = isIsland
	
	self.vipText:setVisible(true)
	self.img_vip:setVisible(false)
	
	local role = RoleData:objectByID(info.icon)                                     --pck change head icon and head icon frame
	if role then
		self.headIcon:setTexture(role:getIconPath())
	end
	Public:addFrameImg(self.headIcon, info.headPicFrame)                            --end
	if localVars.type ~= localVars.pageIndex.friendsList then
		Public:addInfoListen(self.headIcon, true, 1, info.playerId)
	else
		Public:addInfoListen(self.headIcon, false)
	end
	self.vipText:setVisible(true)
	self.levelText:setText(info.level .. "d")
	self.nameText:setText(info.name)
	self.vipText:setText("o" .. info.vip)
	-- self.battleScoreText:setText("战斗力：" .. info.power)
	self.battleScoreText:setText(stringUtils.format(localizable.common_CE, info.power))
	
	--added by wuqi
	if info.vip > 15 then
		self.vipText:setVisible(false)
		self.img_vip:setVisible(true)
		--self.img_vip:setTexture(self.path_new_vip[vipLevel - 15])
		self:addVipEffect(self.img_vip, info.vip)
	end
	self:showStarHeroEffect(info.starHeroRanking, info.vip)
	if info.online then
		-- self.loginTime:setText('玩家在线')
		self.loginTime:setText(localizable.factionInfo_play_online)
		
	else
		local passTime = MainPlayer:getNowtime() - info.lastLoginTime / 1000
		self.loginTime:setText(FriendManager:formatTimeToString(passTime))
	end
	
	self:hideAllButtons()
	
	--local iszhaohui = FriendManager:isShowZhaohuiBtn(MainPlayer:getNowtime() - info.lastLoginTime / 1000)
	-- local iszhaohui = PlayBackManager:isShowZhaohuiBtn(self.playerID)
	local iszhaohui = PlayBackManager:playerNeedBeCallBack(self.playerID, info.level, info.lastLoginTime)
	self.Btn_zhaohui:setVisible(false)
	
	self.Btn_zhaohui.playerId = self.playerID
	--print("self.playerID =",self.playerID)
	-- show or hide buttons
	if type == localVars.pageIndex.friendsList then
		self.buttonGet:setVisible(true)
		self.buttonSend:setVisible(true)
		
		-- 是否在已领取列表中
		if FriendManager:isInDrawPlayers(info.playerId) then
			self.buttonGet:setVisible(false)
			self.imageHasGot:setVisible(true)
		else
			if not info.give then
				-- 不可以领取
				self.buttonGet:setVisible(false)
			end
		end
		
		--是否可以召回
		if iszhaohui then
			self.Btn_zhaohui:setVisible(true)
			self.buttonGet:setVisible(false)
			self.imageHasGot:setVisible(false)
		end
		
		-- 是否在已赠送列表中
		if FriendManager:isInGivePlayers(info.playerId) then
			self.buttonSend:setVisible(false)
			self.imageHasSent:setVisible(true)
		end
		
	elseif type == localVars.pageIndex.addFriend then
		-- 不是自己
		if info.playerId ~= MainPlayer:getPlayerId() then
			-- 不在好友列表中
			if not FriendManager:isInFriendList(info.playerId) then
				if info.apply then
					self.imageHasRequested:setVisible(true)
					self.buttonAdd:setVisible(false)
				else
					self.buttonAdd:setVisible(true)
					self.imageHasRequested:setVisible(false)
				end
			end
		end
		
	elseif type == localVars.pageIndex.applicationList then
		self.buttonIngore:setVisible(true)
		self.buttonAgree:setVisible(true)
	elseif type == localVars.pageIndex.friendsTeam then
		
		self.btn_yq.playerId        = info.playerId or 0
		self.btn_yaoqingzz.playerId = info.playerId or 0
		self.btn_yaoqing.playerId   = info.playerId or 0
		if (self.isIsland) then
			--东瀛岛
			self.btn_yaoqingzz:setVisible(true)
		    self.btn_yaoqing:setVisible(true)
			if (not JapanIslandManager:isLeader()) then
				self.btn_yaoqingzz:setGrayEnabled(true)
				self.btn_yaoqingzz:setTouchEnabled(false)
				self.btn_yaoqing:setGrayEnabled(true)
				self.btn_yaoqing:setTouchEnabled(false)
				return
			end

		else
			self.btn_yq:setVisible(true)
			if info.isInvitation then
				self.btn_yq:setTextureNormal("ui_new/friend/btn_yqz.png")
				self.btn_yq:setTouchEnabled(false)
				--self.btn_yq:setGrayEnabled(true)
			else
				self.btn_yq:setTextureNormal("ui_new/friend/btn_yq.png")
				self.btn_yq:setTouchEnabled(true)
				-- self.btn_yq:setGrayEnabled(false)
			end
		end
		-- if self.isIsland and (not JapanIslandManager:isLeader()) then
        --     self.btn_yaoqingzz:setVisible(true)
		--     self.btn_yaoqing:setVisible(true)
		-- 	-- self.btn_yq:setTextureNormal("ui_new/friend/btn_yq.png")
		-- 	-- self.btn_yq:setGrayEnabled(true)
		-- 	-- self.btn_yq:setTouchEnabled(false)
		-- 	self.btn_yaoqingzz:setGrayEnabled(true)
		-- 	self.btn_yaoqingzz:setTouchEnabled(false)
		-- 	self.btn_yaoqing:setGrayEnabled(true)
		-- 	self.btn_yaoqing:setTouchEnabled(false)
		-- 	return
		-- end
        -- self.btn_yq:setVisible(true)
		-- if info.isInvitation then
		-- 	self.btn_yq:setTextureNormal("ui_new/friend/btn_yqz.png")
		-- 	self.btn_yq:setTouchEnabled(false)
		-- 	--self.btn_yq:setGrayEnabled(true)
		-- else
		-- 	self.btn_yq:setTextureNormal("ui_new/friend/btn_yq.png")
		-- 	self.btn_yq:setTouchEnabled(true)
		-- 	-- self.btn_yq:setGrayEnabled(false)
		-- end
	end
end

--队伍信息
function FriendCell:setTeamListInfo(idFriend, teamInfo)
	if localVars.type ~= localVars.pageIndex.friendsTeam then return end
	for i, v in ipairs(teamInfo) do
		if(idFriend == v.playerId) then
			self.btn_yq:setTextureNormal("ui_new/friend/btn_yqz.png")
			self.btn_yq:setTouchEnabled(false)
			-- self.btn_yq:setGrayEnabled(true)
		end
	end
end

function FriendCell.onFriendInfo(sender)
	if localVars.type == localVars.pageIndex.friendsList then
		local layer = AlertManager:addLayerToQueueAndCacheByFile(
		"lua.logic.friends.FriendInfoLayer", AlertManager.BLOCK_AND_GRAY_CLOSE, AlertManager.TWEEN_1)
		layer:setInfo(sender.parent.info)
		AlertManager:show();
	end
end

--邀请
function FriendCell.onInvite(sender)
	local playerId = sender.playerId
	local self = sender.logic
	if not self.isIsland then
		KingOfWarManager:requestInvitationFriend({playerId})
	else
		
		local openLeve = FunctionOpenConfigure:getOpenLevel(2219)
		if(self.info.level < openLeve) then
			toastMessage(localizable.JapanIsland_open)
			return
		end
		sender:setTextureNormal("ui_new/friend/btn_yqz.png")
		sender:setTouchEnabled(false)
		-- sender:setGrayEnabled(true)
		self.info.isInvitation = true
		JapanIslandManager:requestOperateTeam(2, JapanIslandManager:getMyTeamId(), playerId, true, 1)
	end
end

--
function FriendCell.onInviteJapanIsland(sender)
	local playerId = sender.playerId
	local self = sender.logic
	
	local openLeve = FunctionOpenConfigure:getOpenLevel(2219)
	if(self.info.level < openLeve) then
		toastMessage(localizable.JapanIsland_open)
		return
	end
	-- sender:setTextureNormal("ui_new/friend/btn_yqz.png")
	sender:setTouchEnabled(false)
	sender:setGrayEnabled(true)
	self.info.isInvitation = true
	JapanIslandManager:requestOperateTeam(2, JapanIslandManager:getMyTeamId(), playerId, true, sender.helpType)
	
end

function FriendCell.onGet(sender)
	FriendManager:get(sender.parent.playerID)
end

function FriendCell.onSend(sender)
	FriendManager:send(sender.parent.playerID)
end

function FriendCell.onAddFriend(sender)
	FriendManager:requestFriend(sender.parent.playerID)
end

function FriendCell.onIngoreFriend(sender)
	FriendManager:excuteFriendApply(3, sender.parent.playerID)
end

function FriendCell.onAgreeFriend(sender)
	FriendManager:excuteFriendApply(1, sender.parent.playerID)
end

--召回按钮回调
function FriendCell.onZhaohui(sender)
	local playerId = sender.playerId
	--local layer  = require("lua.logic.friends.FriendRecall"):new()
	--AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1) 
	local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.friends.FriendRecall");
	layer:setData(playerId)
	AlertManager:show()
end

return FriendCell 