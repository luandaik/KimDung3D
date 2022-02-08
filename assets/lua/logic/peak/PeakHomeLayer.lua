local PeakHomeLayer = class("PeakHomeLayer", BaseLayer);

CREATE_SCENE_FUN(PeakHomeLayer);
CREATE_PANEL_FUN(PeakHomeLayer);

--[[
    
******论剑峰-欢迎界面*******

]]

function PeakHomeLayer:ctor(data)
    self.super.ctor(self,data);
    
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianEntrance");

    PeakManager:requestLastChampion()
end

function PeakHomeLayer:loadHomeData(data)
    self.homeInfo = data;
    
    self:refreshUI();
end

function PeakHomeLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function PeakHomeLayer:refreshBaseUI()
    self:UpdateInfo()
end

function PeakHomeLayer:refreshUI()
    -- if not self.isShow then
    --     return;
    -- end
end

function PeakHomeLayer:initUI(ui)
    self.super.initUI(self,ui);
    -- self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');
    self.btn_star           = TFDirector:getChildByPath(ui, 'btn_baoming');
    self.icon_battletime1   = TFDirector:getChildByPath(ui, 'icon_battletime1');
    self.icon_battletime2   = TFDirector:getChildByPath(ui, 'icon_battletime2');
    self.panel_weikaiqi     = TFDirector:getChildByPath(ui, 'panel_weikaiqi');
    self.txt_jingqingqidai  = TFDirector:getChildByPath(ui, 'txt_jingqingqidai');
    self.panel_kaiqi        = TFDirector:getChildByPath(ui, 'panel_kaiqi');
    self.btn_bppm           = TFDirector:getChildByPath(ui, 'btn_bppm');
    self.btn_help       = TFDirector:getChildByPath(ui, 'btn_help');
    self.img_kaiqi           = TFDirector:getChildByPath(ui, 'img_kaiqi');
    -- self.img_kaiqi:setVisible(false)
    -- self.img_kaiqi:setTexture("ui_new/lunjian/qqqqqq.png")
    if PeakManager:getActivityStatus() == 1 then
        self.icon_battletime1:setVisible(false)
        self.icon_battletime2:setVisible(false)
    else
        self:UpdateInfo()
        -- self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
        -- function()
        --     self:UpdateInfo()
        -- end)
    end
    self.panel_kaiqi:setVisible(false)
    self.panel_weikaiqi:setVisible(true)
    self.txt_name      = TFDirector:getChildByPath(ui, 'txt_name');
    -- self.txt_name:setText("虚席以待")
    self.txt_name:setText(localizable.common_wait)

    self.posRole = {}
    for i=1,5 do
        self.posRole[i] = TFDirector:getChildByPath(self.panel_kaiqi, 'role'..i)
    end
    -- self.Img_nobody = TFDirector:getChildByPath(ui, 'Img_nobody')
    -- self.Img_nobody:setVisible(true)
    self.showTip = false
end

function PeakHomeLayer:UpdateInfo()
    local curTime = MainPlayer:getNowtime()
    local timeData = PeakManager:getTimeDataByTime(curTime,1)
    self.icon_battletime2:setVisible(false)
    if PeakManager:getActivityStatus() == 1 then
        self.icon_battletime1:setVisible(false)
    else
        self.icon_battletime1:setVisible(true)
        if timeData.type > 1 then
            self.icon_battletime2:setVisible(true)
        end
    end
end

function PeakHomeLayer.onGoClickHandle(sender)
    if PeakManager:getActivityStatus() == 1 then
        -- toastMessage("活动未开始")
        toastMessage(localizable.LunJianFeng_txt_open)
        return
    end
    local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2210)
    if teamLev < openLev then
        toastMessage(stringUtils.format(localizable.common_team_unlock,openLev))
        return
    end
    PeakManager:openMainLayer()
end

function PeakHomeLayer.onFactionRankClick(sender)
    local self = sender.logic
    if self.showTip == true then
        toastMessage(localizable.LunJianFeng_peak_rank)
        return
    end
    PeakManager:openFactionRanklayer()
end

function PeakHomeLayer:removeUI()
    self.super.removeUI(self)
end

function PeakHomeLayer:registerEvents()
    self.super.registerEvents(self)

    self.btn_star.logic    = self
    self.btn_star:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onGoClickHandle),1)
    self.btn_bppm.logic    = self
    self.btn_bppm:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onFactionRankClick),1)
    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRuleClick))

    self.lastChampionMsg = function(event)
        self:showHeroList(event.data[1])
    end
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_LAST_CHAMPION_MSG ,self.lastChampionMsg)
end

function PeakHomeLayer:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_LAST_CHAMPION_MSG ,self.lastChampionMsg)      
    self.lastChampionMsg = nil

    if self.roleAnimId then
        for k,v in pairs(self.roleAnimId) do
            GameResourceManager:deleRoleAniById(v)
        end
        self.roleAnimId = nil
    end
    -- if self.updateTimerID ~= nil then
    --     TFDirector:removeTimer(self.updateTimerID)
    --     self.updateTimerID = nil
    -- end
end

function PeakHomeLayer:showHeroList( data )

    self.roleAnimId = {}
    if data.serverBest == nil then
        self.panel_kaiqi:setVisible(false)
        self.panel_weikaiqi:setVisible(true)
        self.showTip = true
    else
        self.panel_kaiqi:setVisible(true)
        self.panel_weikaiqi:setVisible(false)
        local idBuff =stringToNumberTable(data.serverBest.formation,',')
        if idBuff then 
            for k,v in pairs(idBuff) do
                if v ~= 0 then
                    --self.Img_nobody:setVisible(false)
                    local idx = #self.roleAnimId + 1
                    local roleAnim = GameResourceManager:getRoleAniById(v)
                    roleAnim:setPosition(ccp(0,0))
                    roleAnim:play("stand", -1, -1, 1)

                    self.posRole[idx]:setZOrder(20-idx)
                    self.posRole[idx]:addChild(roleAnim)
                    
                    self.roleAnimId[idx] = v
                    --加阴影
                    TFResourceHelper:instance():addArmatureFromJsonFile("effect/main_role2.xml")
                    local effect2 = TFArmature:create("main_role2_anim")
                    if effect2 ~= nil then
                        effect2:setAnimationFps(GameConfig.ANIM_FPS)
                        effect2:playByIndex(0, -1, -1, 1)
                        effect2:setZOrder(-1)
                        effect2:setPosition(ccp(0, -10))
                        roleAnim:addChild(effect2)
                    end                    
                end
            end
        end
        local panel_gj = TFDirector:getChildByPath(self.panel_kaiqi, 'panel_gj');
        local panel_bf = TFDirector:getChildByPath(self.panel_kaiqi, 'panel_bf');

        local txt_server_name_gj = TFDirector:getChildByPath(panel_gj, 'txt_name');
        local txt_name_gj       = TFDirector:getChildByPath(panel_gj, 'txt_servername');
        local bg_zhanli_gj      = TFDirector:getChildByPath(panel_gj, 'bg_zhanli');
        local txt_zhandouli_gj  = TFDirector:getChildByPath(panel_gj, 'txt_zhandouli');
        local icon_head_gj      = TFDirector:getChildByPath(panel_gj, 'icon_head');

        -- local serverId = tonumber(string.split(data.serverBest.serverName,"_")[2])
        -- local serverInfo = SaveManager:getServerInfo(serverId)
        -- local serverName = ""
        -- if serverInfo then
        --     serverName = serverInfo.name
        -- end
        txt_server_name_gj:setText(data.serverBest.serverName)
        txt_name_gj:setText(data.serverBest.name)
        txt_zhandouli_gj:setText(data.serverBest.power)

        local roleConfig = RoleData:objectByID(data.serverBest.icon)
        if roleConfig == nil then
            roleConfig = RoleData:objectByID(77)
        end
        icon_head_gj:setTexture(roleConfig:getIconPath())
        Public:addFrameImg(icon_head_gj,data.serverBest.headPicFrame)
        

        local txt_name_bf       = TFDirector:getChildByPath(panel_bf, 'txt_name');
        local bg_zhanli_bf      = TFDirector:getChildByPath(panel_bf, 'bg_zhanli');
        local txt_zhandouli_bf  = TFDirector:getChildByPath(panel_bf, 'txt_zhandouli');
        local icon_head_bf      = TFDirector:getChildByPath(panel_bf, 'icon_head');

        local txt_paiming_bf    = TFDirector:getChildByPath(panel_bf, 'txt_paiming');

        if data.best == nil then
            txt_name_bf:setText(localizable.common_wait)
            bg_zhanli_bf:setVisible(false)
            icon_head_bf:setVisible(false)
            txt_paiming_bf:setText("")
        else
            bg_zhanli_bf:setVisible(true)
            icon_head_bf:setVisible(true)
            txt_name_bf:setText(data.best.name)
            txt_zhandouli_bf:setText(data.best.power)
            roleConfig = RoleData:objectByID(data.best.icon)
            if roleConfig == nil then
                roleConfig = RoleData:objectByID(77)
            end
            icon_head_bf:setTexture(roleConfig:getIconPath())
            Public:addFrameImg(icon_head_bf,data.best.headPicFrame)
            txt_paiming_bf:setText(stringUtils.format(localizable.multiFight_myRank,data.best.ranking))
        end
    end
end

function PeakHomeLayer.onRuleClick( sender )
    CommonManager:showRuleLyaer('lunjianzhengfeng')
end
return PeakHomeLayer;
