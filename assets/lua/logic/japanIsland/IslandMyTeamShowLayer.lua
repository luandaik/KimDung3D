-- client side IslandMyTeamShowLayer.lua
--[[
 * @Description: 东瀛岛我的队伍界面(just show)
 ]]
-- script writer wuqi
-- creation time 2016-12-15

local IslandMyTeamShowLayer = class("IslandMyTeamShowLayer", BaseLayer)

function IslandMyTeamShowLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.island.MyTeam")
end

function IslandMyTeamShowLayer:initUI( ui )
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
        info.txtPower = TFDirector:getChildByPath(info.playerNode, "txt_zhanli2")
        info.imgCaptain = TFDirector:getChildByPath(info.playerNode, "img_dz")
        info.imgBigRole = TFDirector:getChildByPath(info.playerNode, "img_role")
        info.txtServerName = TFDirector:getChildByPath(info.playerNode, "txt_serverName")
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

function IslandMyTeamShowLayer:removeUI()
	self.super.removeUI(self)
end

function IslandMyTeamShowLayer:onShow()
    self.super.onShow(self)
    --CommonManager:setRedPoint(self.btnChat, JapanIslandManager:getTeamChatRedState(), "btnChat", ccp(0,0))
    self:showMyTeamInfo()
end

function IslandMyTeamShowLayer:registerEvents()
	self.super.registerEvents(self)

    self.btn_fanhui.logic = self
    self.btn_fanhui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignOutClick))
    self.btnSignOut.logic = self
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
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.MY_TEAM_REPONSE, self.UpdateTeamInfoMsgCallBack)
end

function IslandMyTeamShowLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(JapanIslandManager.MY_TEAM_REPONSE, self.UpdateTeamInfoMsgCallBack)
    self.UpdateTeamInfoMsgCallBack = nil
end

function IslandMyTeamShowLayer:dispose()
	self.super.dispose(self)
end

function IslandMyTeamShowLayer:showMyTeamInfo()
    local myTeam = JapanIslandManager:getTeamInfo() or {}
    self.myTeamClone = clone(myTeam)
    if not myTeam then
        return
    end
    local state = JapanIslandManager:getTeamStatus()
    -- if state == JapanIslandManager.EnumTeamStatus.NONE then
    --     AlertManager:close()
    --     return
    -- end

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
    else
        self.isLeader = false
    end

    self.chapterId = myTeam.chapterId or 1
    local chapData = JapanTeamChapterData:objectByID(self.chapterId)

    self.myTeamData = JapanIslandManager:getMyTeamData() or {}
    self.txtTeamName:setText( chapData.name )
    self.btnSignOut:setVisible(false)
    self.btnSignUp:setVisible(false)
    self.btnChat:setVisible(false)
    self.btn_jianghu:setVisible(false)
    local state = JapanIslandManager:getTeamStatus()
    

    for k, v in pairs(self.teamMemberNode) do
        local memberInfo = self.teamMemberInfo[tonumber(k)]
        if memberInfo then
            v.playerNode:setVisible(true)
            v.emptyNode:setVisible(false)
            v.txtName:setText(memberInfo.name)
             --
            if (memberInfo.serverId ~= 0) then
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
            --Public:addInfoListen(v.imgBigRole,true,6,memberInfo.playerId,memberInfo.serverId)
            local currTime = MainPlayer:getNowtime() - memberInfo.loginTime/1000
            v.txtLoginTime:setText(FriendManager:formatTimeToStringWithOut(currTime))
            v.txtPower:setText(stringUtils.format(localizable.common_CE, memberInfo.power))
            if memberInfo.playerId == self.leaderId then
                v.imgCaptain:setVisible(true)
            else
                v.imgCaptain:setVisible(false)
            end           
            v.img_hui:setVisible(true)

            Public:addInfoListen(v.playerNode, true, 1, memberInfo.playerId, nil, true)

            -- if memberInfo.ready == 1 then
            --     v.img_prepare:setVisible(true)
            -- else
            --     v.img_prepare:setVisible(false)
            -- end
        else
            --没有玩家
            v.img_hui:setVisible(false)
            v.playerNode:setVisible(false)
            v.emptyNode:setVisible(true)
            v.btnInvitation:setVisible(false)
            v.txtTips:setVisible(false)               
            v.btnInvitation.logic = self
            v.txtTips:setVisible(false)
        end
        v.img_prepare:setVisible(false)
    end

    self.root:setVisible(true)
    self.bg:setVisible(true)

    local str = stringUtils.format( localizable.JapanIsland_lev_range, self.myTeamData.minLevel or 0, self.myTeamData.maxLevel or 0 )
    self.txt_tips:setText(str)
end

function IslandMyTeamShowLayer.onInvitationClick( btn )
    JapanIslandManager:openInvitationLayer()
end

function IslandMyTeamShowLayer.onSignOutClick( btn )
    AlertManager:close()
end

function IslandMyTeamShowLayer.onChatClick( btn )
    local self = btn.logic
    --JapanIslandManager:setTeamChatRedState(false)
    --CommonManager:setRedPoint(self.btnChat, JapanIslandManager:getTeamChatRedState(),"btnChat",ccp(0,0))
    JapanIslandManager:openChatLayer()
end

function IslandMyTeamShowLayer.onSignUpClick( btn )
    local self = btn.logic
    if self.isReady and self.isLeader then
        JapanIslandManager:requestStartBattle(0)
    else
        JapanIslandManager:requestOperateTeam(3, JapanIslandManager:getMyTeamId(), MainPlayer:getPlayerId())
    end
end

function IslandMyTeamShowLayer.onJianghuClick(btn)
    local self = btn.logic
    if self.isLeader then
        JapanIslandManager:requestOperateTeam(5, JapanIslandManager:getMyTeamId(), MainPlayer:getPlayerId())
    end
end

return IslandMyTeamShowLayer