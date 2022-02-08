-- client side CrossFightEntrance.lua
--[[
 * @Description: 跨服帮派战入口
 ]]
-- script writer Stephen.tao
-- creation time 2016-05-23


local CrossFightEntrance = class("CrossFightEntrance",BaseLayer)

function CrossFightEntrance:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossfight.CrossFightEntrance")
	local state = CrossGuildBattleManager:getActivityState()
	if state ~= CrossGuildBattleManager.ActivityState_0 then
		CrossGuildBattleManager:gainLastRankInfo(false)
	end
end

function CrossFightEntrance:initUI( ui )
	self.super.initUI(self, ui)

	self.panel_no_open = TFDirector:getChildByPath(ui,"panel_weikaiqi") --还没有记录战  虚席以待
	self.panel_open = TFDirector:getChildByPath(ui,"panel_kaiqi") --上一届获胜队伍
	self.panel_open_condition = TFDirector:getChildByPath(ui,"img_kaiqi")
	self.btn_apply = TFDirector:getChildByPath(ui,"btn_baoming")
	self.btn_help = TFDirector:getChildByPath(ui, 'btn_help');
	self.icon_battletime = {}

	for i=1,2 do
		self.icon_battletime[i] = TFDirector:getChildByPath(ui,"icon_battletime"..i)
		self.icon_battletime[i]:setVisible(false)
	end
	self:showDetailsInfo()
end


function CrossFightEntrance:removeUI()
	self.super.removeUI(self)
end

function CrossFightEntrance:onShow()
    self.super.onShow(self)

	local endTimeList = {}
    endTimeList[1] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_Begin_1").value
    endTimeList[2] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_1").value
    endTimeList[3] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_Begin_2").value
    endTimeList[4] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_2").value
    local currTime = CrossGuildBattleManager:getCurrSecond()
    for i=1,2 do
		if currTime >= endTimeList[2*i-1] and  currTime <= endTimeList[2*i] then
			self.icon_battletime[i]:setVisible(true)
		else
			self.icon_battletime[i]:setVisible(false)
		end
    end
end

function CrossFightEntrance:registerEvents()
	self.super.registerEvents(self)
    
    self.btn_apply:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onBtnApply))
    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRuleClick))

    self.updatePreviousCrossInfoCallBack = function (event)
        self:showDetailsInfo()
    end
    TFDirector:addMEGlobalListener(CrossGuildBattleManager.PreviousCrossInfoNotice, self.updatePreviousCrossInfoCallBack)
end

function CrossFightEntrance:removeEvents()

    self.btn_apply:removeMEListener(TFWIDGET_CLICK)

    if self.updatePreviousCrossInfoCallBack then
        TFDirector:removeMEGlobalListener(CrossGuildBattleManager.PreviousCrossInfoNotice, self.updatePreviousCrossInfoCallBack)    
        self.updatePreviousCrossInfoCallBack = nil
    end

    self.super.removeEvents(self)
end

function CrossFightEntrance:dispose()
    self.super.dispose(self)
end


function CrossFightEntrance.onBtnApply()
    CrossGuildBattleManager:openCurrLayer(false)
end

function CrossFightEntrance:showDetailsInfo()
	local state = CrossGuildBattleManager:getActivityState()
	local winner = CrossGuildBattleManager:getPreviousCrossInfo()
	print('-------------帮派争锋战状态----------------------',state)

	if state == CrossGuildBattleManager.ActivityState_0 or (state == CrossGuildBattleManager.ActivityState_4 and winner.infos == nil) then
		self.panel_no_open:setVisible(true)
		self.panel_open:setVisible(false)
		self.btn_apply:setVisible(false)
	elseif winner.infos == nil then
		self.panel_no_open:setVisible(true)
		self.panel_open:setVisible(false)
		self.btn_apply:setVisible(true)
	else
		self.panel_no_open:setVisible(false)
		self.panel_open:setVisible(true)
		self.btn_apply:setVisible(true)
		local panel_gj = TFDirector:getChildByPath(self.panel_open,"panel_gj")
		local lbGuildName = TFDirector:getChildByPath(panel_gj,"txt_name")
		lbGuildName:setText(winner.infos[1].guildName)
		local lbServerName = TFDirector:getChildByPath(panel_gj,"txt_fwq")
		lbServerName:setText(winner.infos[1].serverName)
		local img_qizhi = TFDirector:getChildByPath(panel_gj,"img_qizhi")
		img_qizhi:setTexture(FactionManager:getGuildBannerBgPath(winner.infos[1].bannerId))
		local img_biaozhi = TFDirector:getChildByPath(panel_gj,"img_biaozhi")
		img_biaozhi:setTexture(FactionManager:getGuildBannerIconPath(winner.infos[1].bannerId))
		for i=1,3 do
			local widget = TFDirector:getChildByPath(self.panel_open,"role"..i.."_bg")
			if winner.members and winner.members[i] then
				widget:setVisible(true)
				local lbRoleName = TFDirector:getChildByPath(widget,"txt_servername")
				lbRoleName:setText(winner.members[i].playerName)
				-- local img_frameId = TFDirector:getChildByPath(widget,"img_di")
				-- local frameRes  = "ui_new/team/img_frame"..winner.members[i].frameId..".png";
				-- img_frameId:setTexture(frameRes)
				local img_useCoin = TFDirector:getChildByPath(widget,"icon_head")
				local role = RoleData:objectByID(winner.members[i].useCoin)
				if role then
					img_useCoin:setTexture(role:getIconPath())
					Public:addFrameImg(img_useCoin,winner.members[i].frameId,true)
				end
			else
				widget:setVisible(false)
			end
		end
		local panel_bf = TFDirector:getChildByPath(self.panel_open,"panel_bf")
		if winner.serverInfo then
			panel_bf:setVisible(true)
			local lbGuildName = TFDirector:getChildByPath(panel_bf,"txt_name")
			lbGuildName:setText(winner.serverInfo.guildName)
			local lbServerRank = TFDirector:getChildByPath(panel_bf,"txt_paiming")
			if winner.serverRank and winner.serverRank ~= 0 then
				lbServerRank:setText(stringUtils.format(localizable.multiFight_myRank, winner.serverRank))
			else
				lbServerRank:setText(localizable.common_not_rank)
			end
			local img_qizhi = TFDirector:getChildByPath(panel_bf,"img_qizhi")
			img_qizhi:setTexture(FactionManager:getGuildBannerBgPath(winner.serverInfo.bannerId))
			local img_biaozhi = TFDirector:getChildByPath(panel_bf,"img_biaozhi")
			img_biaozhi:setTexture(FactionManager:getGuildBannerIconPath(winner.serverInfo.bannerId))
		else
			panel_bf:setVisible(false)
		end
	end
end

function CrossFightEntrance.onRuleClick( sender )
    CommonManager:showRuleLyaer('kuafubangpaizhenfeng')
end
return CrossFightEntrance