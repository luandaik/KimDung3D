--[[
	镖行天下入口
	by chikui
	2017/2/8
]]

local BiaoCheEntranceLayer = class("BiaoCheEntranceLayer",BaseLayer)

function BiaoCheEntranceLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.BiaocheEntrance")
	if MainPlayer:getServerSwitchStatue(ServerSwitchType.BiaoCheSwitch ) == true then
		BiaoCheManager:requestHistoryRank()
		return
	end
	
end

function BiaoCheEntranceLayer:initUI( ui )
	self.super.initUI(self, ui)

	self.panel_weikaiqi = TFDirector:getChildByPath(ui,"panel_weikaiqi") --还没有记录战  虚席以待
	self.panel_weikaiqi:setVisible(true)
	self.panel_kaiqi = TFDirector:getChildByPath(ui,"panel_kaiqi") --上一届获胜队伍
	self.panel_kaiqi:setVisible(false)
	self.img_kaiqi = TFDirector:getChildByPath(ui,"img_kaiqi")
	self.txt_jingqingqidai = TFDirector:getChildByPath(ui,"txt_jingqingqidai")
	self.txt_jingqingqidai:setVisible(false)
	self.btn_apply = TFDirector:getChildByPath(ui,"btn_baoming")

	self.icon_battletime = {}

	for i=1,2 do
		self.icon_battletime[i] = TFDirector:getChildByPath(ui,"icon_battletime"..i)
		self.icon_battletime[i]:setVisible(false)
	end
end

function BiaoCheEntranceLayer:createTestData()
end

function BiaoCheEntranceLayer:removeUI()
   	self.super.removeUI(self)
   
end

function BiaoCheEntranceLayer:onShow()
    self.super.onShow(self)

    local state = BiaoCheManager:getActivityState()
    self.icon_battletime[1]:setVisible(false)
	self.icon_battletime[2]:setVisible(false)
    if state == BiaoCheManager.ActivityState_1 then
    	self.icon_battletime[1]:setVisible(true)
    elseif state == BiaoCheManager.ActivityState_2 then
    	self.icon_battletime[2]:setVisible(true)
    end
end

function BiaoCheEntranceLayer:registerEvents()
	self.super.registerEvents(self)
    
    self.btn_apply:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onBtnApply))

    self.updatePreviousCrossInfoCallBack = function (event)
        self:showDetailsInfo() 
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_HISTORY_RANK_INFO, self.updatePreviousCrossInfoCallBack)
end

function BiaoCheEntranceLayer:removeEvents()

    self.btn_apply:removeMEListener(TFWIDGET_CLICK)

    if self.updatePreviousCrossInfoCallBack then
        TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_HISTORY_RANK_INFO, self.updatePreviousCrossInfoCallBack)    
        self.updatePreviousCrossInfoCallBack = nil
    end 
    self.super.removeEvents(self)
end

function BiaoCheEntranceLayer:dispose()
    self.super.dispose(self)
end

function BiaoCheEntranceLayer.onBtnApply()
	local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2220)
    if teamLev < openLev then
    	toastMessage(stringUtils.format(localizable.BiaoCheBaoOpen_txt,openLev))
    	return
    end

	if MainPlayer:getServerSwitchStatue(ServerSwitchType.BiaoCheSwitch ) ==false then
		toastMessage(localizable.WuLinEnemy_Not_Open)
		return
	end
	if BiaoCheManager:getActivityState() == BiaoCheManager.ActivityState_0 then
		--toastMessage(localizable.WeekRaceManager_huodong_weikaishi)
		--return
	end
    BiaoCheManager:openMainLayer()
end

function BiaoCheEntranceLayer:showDetailsInfo()
	local state = MultiServerFightManager:getActivityState()

	-- if state == MultiServerFightManager.ActivityState_0 then
	-- 	self.panel_weikaiqi:setVisible(true)
	-- 	self.panel_kaiqi:setVisible(false)		
	-- 	self.btn_apply:setVisible(false)
	-- else
		self.panel_weikaiqi:setVisible(false)
		self.panel_kaiqi:setVisible(true)
		self.btn_apply:setVisible(true)

		--跨服冠军
		local panel_gj = TFDirector:getChildByPath(self.panel_kaiqi,"panel_gj")
		local panel_bf = TFDirector:getChildByPath(self.panel_kaiqi,"panel_bf")

		local img_qizhi_gj = TFDirector:getChildByPath(panel_gj,"img_qizhi")
		local img_biaozhi_gj = TFDirector:getChildByPath(panel_gj,"img_biaozhi")
		local txt_name_gj = TFDirector:getChildByPath(panel_gj,"txt_name")
		local txt_fwq_gj = TFDirector:getChildByPath(panel_gj,"txt_fwq")
		local img_che_gj = TFDirector:getChildByPath(panel_gj,"img_che")

		local img_qizhi_bf = TFDirector:getChildByPath(panel_bf,"img_qizhi")
		local img_biaozhi_bf = TFDirector:getChildByPath(panel_bf,"img_biaozhi")
		local txt_paiming_bf = TFDirector:getChildByPath(panel_bf,"txt_paiming")
		local txt_name_bf = TFDirector:getChildByPath(panel_bf,"txt_name")


		local rankList = BiaoCheManager:getHistoryRankInfo(BiaoCheManager.RankType_1)
		local rankInfo = rankList[1]
		if rankInfo then
			txt_name_gj:setText(rankInfo.guildName)
	        txt_fwq_gj:setText(rankInfo.serverName)
	        local strBannerInfo = rankInfo.cardInfo.bannerId
	        img_qizhi_gj:setTexture(FactionManager:getGuildBannerBgPath(strBannerInfo))
	        img_biaozhi_gj:setTexture(FactionManager:getGuildBannerIconPath(strBannerInfo))

	        local quality = rankInfo.cardInfo.quality
	        img_che_gj:setTexture("ui_new/faction/biaoche/img_bc" .. quality .. ".png")
	    else
	    	img_che_gj:setTexture("ui_new/faction/biaoche/img_bc" .. 1 .. ".png")
	    	txt_fwq_gj:setText("")
	    	txt_name_gj:setText(localizable.common_wait)
	    	img_qizhi_gj:setTexture(FactionManager:getGuildBannerBgPath(nil))
        	img_biaozhi_gj:setTexture(FactionManager:getGuildBannerIconPath(nil))
	    end
	    rankInfo = BiaoCheManager:getServerBestRankInfo(BiaoCheManager.RankType_1)
	    if rankInfo == nil or rankInfo.rank <= 0 then
	    	txt_paiming_bf:setText("")
        	txt_name_bf:setText(localizable.shalu_info_txt1)
        	img_qizhi_bf:setTexture(FactionManager:getGuildBannerBgPath(nil))
        	img_biaozhi_bf:setTexture(FactionManager:getGuildBannerIconPath(nil))
	    else
			txt_name_bf:setText(rankInfo.guildName)
	    	txt_paiming_bf:setText(stringUtils.format(localizable.multiFight_myRank,rankInfo.rank))
	    	local strBannerInfo = rankInfo.bannerId
        	img_qizhi_bf:setTexture(FactionManager:getGuildBannerBgPath(strBannerInfo))
        	img_biaozhi_bf:setTexture(FactionManager:getGuildBannerIconPath(strBannerInfo))
	    end
	-- end
end

return BiaoCheEntranceLayer