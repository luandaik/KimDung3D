-- client side IslandMyTeamLayer.lua
--[[
 * @Description: 东瀛岛我的队伍界面
 
 ]]
-- script writer wuqi
-- creation time 2016-12-15

local IslandMyTeamLayer = class("IslandMyTeamLayer", BaseLayer)

function IslandMyTeamLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.island.MyTeam")
    self.firstShow = true
    JapanIslandManager.isEnterTeam = true
end

function IslandMyTeamLayer:initUI( ui )
    self.super.initUI(self, ui)
    self.btn_fanhui = TFDirector:getChildByPath(ui, "btn_fanhui")
    self.btnSignOut = TFDirector:getChildByPath(ui, "btn_tuichu")
    self.btnSignUp = TFDirector:getChildByPath(ui, "btn_baoming")
    self.btn_jianghu = TFDirector:getChildByPath(ui, "btn_jianghu")
    self.btnChat = TFDirector:getChildByPath(ui, "btn_teamchat")
    
    local panelMyteam = TFDirector:getChildByPath(ui, "panel_myteam")
    local teanNameNode = TFDirector:getChildByPath(panelMyteam, "img_di")    
    self.txtTeamName = TFDirector:getChildByPath(panelMyteam, "txt_teamname")

    self.teamMemberNode = {}
    for i = 1, 3 do
        local teamNode = TFDirector:getChildByPath(panelMyteam, "panel_role" .. i)
        local info = {}
        info.playerNode = TFDirector:getChildByPath(teamNode, "bg_1")
        info.txtName = TFDirector:getChildByPath(info.playerNode, "txt_name")
        info.txtServerName = TFDirector:getChildByPath(info.playerNode, "txt_serverName")
        info.txtPower = TFDirector:getChildByPath(info.playerNode, "txt_zhanli2")
        info.imgCaptain = TFDirector:getChildByPath(info.playerNode, "img_dz")
        info.imgBigRole = TFDirector:getChildByPath(info.playerNode, "img_role")
        info.img_hui = TFDirector:getChildByPath(info.playerNode, "img_hui")
        info.img_prepare = TFDirector:getChildByPath(info.playerNode, "img_prepare")
        info.img_prepare:setVisible(false)

        info.txtLoginTime = TFDirector:getChildByPath(info.playerNode, 'txt_time')
        info.emptyNode = TFDirector:getChildByPath(teamNode, "bg_empty")
        info.btnInvitation = TFDirector:getChildByPath(info.emptyNode, "btn_jiahao")
        info.txtTips = TFDirector:getChildByPath(info.emptyNode, "txt_miaoshu") 
        info.img_pipei = TFDirector:getChildByPath(info.emptyNode, "img_pipei")
        info.img_pipei:setVisible(false)

        table.insert(self.teamMemberNode, info)
    end
    self.root = TFDirector:getChildByPath(ui, "Panel")
    self.bg = TFDirector:getChildByPath(ui, "bg")

    self.txt_tips = TFDirector:getChildByPath(ui, "txt_tips")
end

function IslandMyTeamLayer:removeUI()
	self.super.removeUI(self)
    JapanIslandManager.isEnterTeam = false
end

function IslandMyTeamLayer:onShow()
    self.super.onShow(self)
    CommonManager:setRedPoint(self.btnChat, JapanIslandManager:getTeamChatRedState(), "btnChat", ccp(0,0))
    self:showMyTeamInfo()
end

function IslandMyTeamLayer:registerEvents()
	self.super.registerEvents(self)

    self.btn_fanhui.logic = self
    self.btn_fanhui.index = 1
    self.btn_fanhui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignOutClick))
    self.btnSignOut.logic = self
    self.btnSignOut.index = 2
    self.btnSignOut:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignOutClick))
    self.btnSignUp.logic = self
    self.btnSignUp:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignUpClick))
    self.btn_jianghu.logic = self
    self.btn_jianghu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onJianghuClick))

    self.btnChat.logic = self
    self.btnChat:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onChatClick))

    self.UpdateTeamInfoMsgCallBack = function(event)

        if JapanIslandManager:getTeamStatus() == JapanIslandManager.EnumTeamStatus.PREPARE then
            self:showMyTeamInfo()
        end

        local status = JapanIslandManager:getTeamStatus()
        if status then
            if (status == 3 or status == 4) then
                AlertManager:closeLayer(self)
                return
            end
        end
        if (JapanIslandManager:isTeamLegal() == false) then
            JapanIslandManager:requestOperateTeam(1, JapanIslandManager:getMyTeamId(), MainPlayer:getPlayerId())
            AlertManager:closeLayer(self)
        end
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.MY_TEAM_REPONSE, self.UpdateTeamInfoMsgCallBack)

    self.chapStatusCallBack = function(event)
        if not JapanIslandManager.isEnterFightMain then 
            JapanIslandManager:openFightMainLayer()
        end
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.CHAPTER_STATUS_DATA_RESPONSE, self.chapStatusCallBack)
    

    self.updateRedPoint = function ( event )
        CommonManager:setRedPoint(self.btnChat, JapanIslandManager:getTeamChatRedState(),"btnChat",ccp(0,0))
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.UpdateInvitationMsg, self.updateRedPoint)
    TFDirector:addMEGlobalListener(JapanIslandManager.UpdateNewChatMsg, self.updateRedPoint)
    --队伍解散
    self.teamDissolve = function ( event )
        AlertManager:closeLayer(self)
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.TEAM_DISSOLVE, self.teamDissolve)
end

function IslandMyTeamLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(JapanIslandManager.MY_TEAM_REPONSE, self.UpdateTeamInfoMsgCallBack)
    self.UpdateTeamInfoMsgCallBack = nil

    TFDirector:removeMEGlobalListener(JapanIslandManager.CHAPTER_STATUS_DATA_RESPONSE, self.chapStatusCallBack)
    self.chapStatusCallBack = nil

    TFDirector:removeMEGlobalListener(JapanIslandManager.UpdateNewChatMsg, self.updateRedPoint)
    TFDirector:removeMEGlobalListener(JapanIslandManager.UpdateInvitationMsg, self.updateRedPoint)
    self.updateRedPoint = nil 
    TFDirector:removeMEGlobalListener(JapanIslandManager.TEAM_DISSOLVE, self.teamDissolve)
    self.teamDissolve = nil 
end

function IslandMyTeamLayer:dispose()
	self.super.dispose(self)
end

function IslandMyTeamLayer:showMyTeamInfo()
    local myTeam = JapanIslandManager:getTeamInfo() or {}
    self.myTeamClone = clone(myTeam)
    if not myTeam then
        return
    end
    local state = JapanIslandManager:getTeamStatus()
    if state == JapanIslandManager.EnumTeamStatus.NONE then
        AlertManager:close()
        return
    end

    self.myTeamId = myTeam.teamId
    self.leaderId = myTeam.leader
    self.memberInfo = myTeam.member

    self.teamMemberInfo = {}
    self.isReady = false
    if myTeam.member then
        for _, v in ipairs(myTeam.member) do
            table.insert( self.teamMemberInfo, v )  
            if v.playerId == MainPlayer:getPlayerId() and v.ready == 1 then
                self.isReady = true
            end 
        end
    end

    if MainPlayer:getPlayerId() == self.leaderId then
        self.isLeader = true
        self.btn_jianghu:setVisible(true)
    else
        self.isLeader = false
        self.btn_jianghu:setVisible(false)
    end

    self.chapterId = myTeam.chapterId or 1
    local chapData = JapanTeamChapterData:objectByID(self.chapterId)
    self.myTeamData = JapanIslandManager:getMyTeamData() or {}

    self.txtTeamName:setText( chapData.name )
    --self.btnSignOut:setVisible(false)
    self.btnSignUp:setVisible(true)
    self.btnSignUp:setTextureNormal("ui_new/island/btn_zb.png")

    if self.isLeader then
        self.btnSignUp:setTextureNormal("ui_new/island/btn_kszd.png")  
        self.btnSignUp:setGrayEnabled(false)
        self.btnSignUp:setTouchEnabled(true)
    else
        if self.isReady then
            self.btnSignUp:setTextureNormal("ui_new/island/btn_qxzb.png")
            self.btnSignUp:setGrayEnabled(false)
            self.btnSignUp:setTouchEnabled(true)
        end
    end

    local state = JapanIslandManager:getTeamStatus()
    

    for k, v in pairs(self.teamMemberNode) do
        local memberInfo = self.teamMemberInfo[tonumber(k)]
        if memberInfo then
            v.playerNode:setVisible(true)
            v.emptyNode:setVisible(false)
            v.txtName:setText(memberInfo.name)
            --
            if (memberInfo.serverId ~= nil and memberInfo.serverId ~= 0) then
                v.txtServerName:setVisible(true)
                -- local currServerInfo = SaveManager:getServerInfo(tonumber(memberInfo.serverId))
                -- if (currServerInfo) then
                --     v.txtServerName:setText(currServerInfo.name)
                -- end
                v.txtServerName:setText("S"..(tonumber(memberInfo.serverId) % 1000))
            else
                v.txtServerName:setVisible(false)
            end
            
            if memberInfo.useIcon and memberInfo.useIcon == 0 then
                memberInfo.useIcon = 4
            end
            local RoleIcon = RoleData:objectByID(memberInfo.useIcon)
            v.imgBigRole:setTexture(RoleIcon:getBigImagePath())
            v.imgBigRole:setVisible(true)
            --Public:addInfoListen(v.imgBigRole,true,6,memberInfo.playerId,memberInfo.serverId)
            local currTime = MainPlayer:getNowtime() - memberInfo.loginTime/1000
            v.txtLoginTime:setText(FriendManager:formatTimeToStringWithOut(currTime))
            v.txtPower:setText(stringUtils.format(localizable.common_CE, memberInfo.power))
            if memberInfo.playerId == self.leaderId then
                v.imgCaptain:setVisible(true)
            else
                v.imgCaptain:setVisible(false)
                --助战
                if (memberInfo.isAssist == 1) then
                    v.imgCaptain:setVisible(true)
                    v.imgCaptain:setTexture("ui_new/island/img_zhuzhan.png")
                end
            end           
            v.img_hui:setVisible(true)

            if memberInfo.ready == 1 and memberInfo.playerId ~= self.leaderId then
                v.img_prepare:setVisible(true)
            else
                v.img_prepare:setVisible(false)
            end

            Public:addInfoListen(v.playerNode, true, 1, memberInfo.playerId, nil, true)
        else
            --没有玩家
            v.img_hui:setVisible(false)
            v.playerNode:setVisible(false)
            v.emptyNode:setVisible(true)
            v.btnInvitation:setVisible(false)
            v.txtTips:setVisible(false)               
            v.btnInvitation:setVisible(true)
            v.btnInvitation:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onInvitationClick))
            v.btnInvitation.logic = self
            v.txtTips:setVisible(true)
        end
    end

    self.root:setVisible(true)
    self.bg:setVisible(true)

    if self.firstShow then
        self.firstShow = false
        CommonManager:setRedPoint(self.btnChat, false,"btnChat",ccp(0,0))

        self.ui:runAnimation("Action0", 1);
    end

    local str = stringUtils.format( localizable.JapanIsland_lev_range, self.myTeamData.minLevel or 0, self.myTeamData.maxLevel or 0 )
    self.txt_tips:setText(str)
    if (JapanIslandManager:isTeamLegal() == false) then
        JapanIslandManager:requestOperateTeam(1, JapanIslandManager:getMyTeamId(), MainPlayer:getPlayerId())
        AlertManager:closeLayer(self)
    end
end

function IslandMyTeamLayer.onInvitationClick( btn )
    JapanIslandManager:openInvitationLayer()
end

function IslandMyTeamLayer.onSignOutClick( btn )
    local desc = localizable.JapanIsland_txt_quit_team
    if btn.index and btn.index == 2 then
        desc = localizable.JapanIsland_txt_quit_team2
    end

    CommonManager:showOperateSureLayer(
        function()
            JapanIslandManager:requestOperateTeam(1, JapanIslandManager:getMyTeamId(), MainPlayer:getPlayerId())
        end,
        function()
            AlertManager:close()
        end,
        {
            title = localizable.common_tips,
            msg = desc,
            showtype = AlertManager.BLOCK_AND_GRAY,
        }
    )
end

function IslandMyTeamLayer.onChatClick( btn )
    local self = btn.logic
    JapanIslandManager:setTeamChatRedState(false)
    CommonManager:setRedPoint(self.btnChat, JapanIslandManager:getTeamChatRedState(),"btnChat",ccp(0,0))
    --self:onShow()
    JapanIslandManager:openChatLayer()
end

function IslandMyTeamLayer.onSignUpClick( btn )
    local self = btn.logic
    if self.isLeader then
        local memInfo = JapanIslandManager:getTeamMemInfo() or {}
        if #memInfo < 3 then
            CommonManager:showOperateSureTipLayer(
                function(data, widget)
                    JapanIslandManager:requestStartBattle(0)
                end,
                function(data, widget)
                    AlertManager:close()
                end,
                {
                    title = localizable.common_tips,
                    msg = localizable.JapanIsland_start_fight_sure,
                    showtype = AlertManager.BLOCK_AND_GRAY
                }
            )
        else
            JapanIslandManager:requestStartBattle(0)
        end 
    else
        JapanIslandManager:requestOperateTeam(3, JapanIslandManager:getMyTeamId(), MainPlayer:getPlayerId())
    end
end

function IslandMyTeamLayer.onJianghuClick(btn)
    local self = btn.logic
    if self.isLeader then
        JapanIslandManager:requestOperateTeam(5, JapanIslandManager:getMyTeamId(), MainPlayer:getPlayerId())
    end
end

return IslandMyTeamLayer