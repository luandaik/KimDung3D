
-- client side KingWarMyTeamLayer.lua
--[[
 * @Description: 王者争霸-我的队伍
 ]]
-- script writer Happy.All
-- creation time 2016-11-2 12:07:18
local KingWarMyTeamLayer = class("KingWarMyTeamLayer",BaseLayer)


function KingWarMyTeamLayer:ctor(data)
	self.super.ctor(self, data)
    self.lastTeamState = KingOfWarManager:checkIsInRace()
	self:init("lua.uiconfig_mango_new.crossarena.MyTeam")
end

function KingWarMyTeamLayer:initUI( ui )

	self.super.initUI(self, ui)
    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.KFKingWarMyTeam,{HeadResType.SYCEE})
    
    local panelMyteam = TFDirector:getChildByPath(ui, "panel_myteam")
    self.btnEditTeam = TFDirector:getChildByPath(panelMyteam, "btn_bianji")
    self.btnChat = TFDirector:getChildByPath(panelMyteam, "btn_teamchat")
    self.btnSignOut = TFDirector:getChildByPath(panelMyteam, "btn_tuichu")
    self.btnSignUp = TFDirector:getChildByPath(panelMyteam, "btn_baoming")
    
    local teanNameNode = TFDirector:getChildByPath(panelMyteam, "img_di")    
    self.txtTeamName = TFDirector:getChildByPath(teanNameNode, "txt_teamname")

    self.teamMemberNode = {}
    for i=1,3 do
        local teamNode = TFDirector:getChildByPath(panelMyteam, "panel_role"..i)
        local info = {}
        info.playerNode = TFDirector:getChildByPath(teamNode, "bg_1")
        info.txtName = TFDirector:getChildByPath(info.playerNode, "txt_name")
        info.txtPower = TFDirector:getChildByPath(info.playerNode, "txt_zhanli2")
        info.txtLogin = TFDirector:getChildByPath(info.playerNode, "txt_time")
        info.btnLeave = TFDirector:getChildByPath(info.playerNode, "btn_tichu")
        info.imgCaptain = TFDirector:getChildByPath(info.playerNode, "img_dz")
        info.imgBigRole = TFDirector:getChildByPath(info.playerNode, "img_role")
        info.img_hui = TFDirector:getChildByPath(info.playerNode, "img_hui")

        info.txtLoginTime = TFDirector:getChildByPath(info.playerNode, 'txt_time')

        info.emptyNode = TFDirector:getChildByPath(teamNode, "bg_empty")
        info.btnInvitation = TFDirector:getChildByPath(info.emptyNode, "btn_jiahao")
        info.txtTips = TFDirector:getChildByPath(info.emptyNode, "txt_miaoshu") 
        info.img_pipei = TFDirector:getChildByPath(info.emptyNode, "img_pipei")
        info.img_pipei:setVisible(false) 

        local parent = info.img_pipei:getParent()
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/kingwarpp.xml")
        local effect = TFArmature:create("kingwarpp_anim")
        effect:setPosition(info.img_pipei:getPosition())
        parent:addChild(effect,100)
        effect:playByIndex(0,-1,-1,1)
        effect:setVisible(false)
        info.ppEffect = effect

        table.insert(self.teamMemberNode, info)
    end
end

function KingWarMyTeamLayer:removeUI()
	self.super.removeUI(self)
end

function KingWarMyTeamLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
    CommonManager:setRedPoint(self.btnChat, KingOfWarManager:getTeamChatRedState(),"btnChat",ccp(0,0))

    local currTeamState = KingOfWarManager:checkIsInRace()
    if self.lastTeamState == false and currTeamState == true then           
        AlertManager:close()
    end
    self.lastTeamState = currTeamState
end

function KingWarMyTeamLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)

    if self.generalHead then
        self.generalHead:registerEvents()
    end

    ADD_ALERT_CLOSE_LISTENER(self,self.btnClose)

    self.btnSignOut.logic = self
    self.btnSignOut:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignOutClick))
    self.btnEditTeam.logic = self
    self.btnEditTeam:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onEditTeamClick))
    self.btnChat.logic = self
    self.btnChat:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onChatClick))
    self.btnSignUp.logic = self
    self.btnSignUp:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignUpClick))

    self.UpdateTeamInfoMsgCallBack = function (event)
   
        self:showMyTeamInfo()
        self:onShow()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.UpdateTeamInfoMsgCallBack)
    self.updateRedPoint = function ( event )
        CommonManager:setRedPoint(self.btnChat, KingOfWarManager:getTeamChatRedState(),"btnChat",ccp(0,0))
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateInvitationMsg, self.updateRedPoint)
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateNewChatMsg, self.updateRedPoint)
    self.registerEventCallFlag = true 
end

function KingWarMyTeamLayer:removeEvents()

    self.super.removeEvents(self)
    if self.generalHead then
        self.generalHead:removeEvents()
    end 
    if self.UpdateTeamInfoMsgCallBack then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.UpdateTeamInfoMsgCallBack)
        self.UpdateTeamInfoMsgCallBack = nil
    end
    if self.updateRedPoint then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateInvitationMsg, self.updateRedPoint)
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateNewChatMsg, self.updateRedPoint)
        self.updateRedPoint = nil
    end
    
    self.registerEventCallFlag = nil  
end

function KingWarMyTeamLayer:dispose()
	self.super.dispose(self)

end

function KingWarMyTeamLayer:showMyTeamInfo()
    local myTeam = KingOfWarManager:getTeamInfo()
    self.myTeamClone = clone(myTeam)
    if myTeam == nil or myTeam.team == nil then
        print("team info not exist!!!")
        return
    end
    self.myTeamType = myTeam.team.type --0随机匹配 1自定义队伍
    self.myTeamId = myTeam.team.id
    self.myTeamName = myTeam.team.name
    self.leaderId = myTeam.team.leader
    self.isSignUp = myTeam.signUp
    self.isLastChampion = false
    if myTeam.leiZhuTeamId == self.myTeamId then
        self.isLastChampion = true
    end

    self.teamMemberInfo = {}
    if myTeam.team.member then
        for _,v in pairs(myTeam.team.member) do   
            local position = tonumber(v.position)
            self.teamMemberInfo[position] = v
        end
    end

    --处理公共信息
    -- self.txtTeamName:setText(self.myTeamName)
    self.txtTeamName:setText(toVerticalString(self.myTeamName))
    self.btnSignOut:setVisible(false)
    self.btnEditTeam:setVisible(false)
    self.btnSignUp:setVisible(false)
    if self.leaderId == MainPlayer:getPlayerId() then
        self.btnEditTeam:setVisible(true)        
    end

    local state = KingOfWarManager:getActivityState()
    if self.myTeamType == 1 and self.isSignUp ~= 1 and self.isLastChampion == false then
        self.btnSignOut:setVisible(true)
        self.btnSignUp:setVisible(true)
        self.btnSignUp:setTouchEnabled(true)
        self.btnSignUp:setTextureNormal("ui_new/crossarena/btn_bm.png")
    end

    if self.isSignUp == 1 or self.isLastChampion then
        self.btnSignUp:setVisible(true)
        self.btnSignUp:setTouchEnabled(false)
        self.btnSignUp:setTextureNormal("ui_new/crossarena/btn_bm2.png")
    end

    for k,v in pairs(self.teamMemberNode) do
        local memberInfo = self.teamMemberInfo[tonumber(k)]
        if memberInfo then
            v.playerNode:setVisible(true)
            v.emptyNode:setVisible(false)
            v.txtName:setText(memberInfo.name)
            local RoleIcon = RoleData:objectByID(memberInfo.useIcon)
            v.imgBigRole:setTexture(RoleIcon:getBigImagePath())
            Public:addInfoListen(v.imgBigRole,true,6,memberInfo.playerId,memberInfo.serverId)
            local currTime = MainPlayer:getNowtime() - memberInfo.loginTime/1000
            v.txtLoginTime:setText(FriendManager:formatTimeToStringWithOut(currTime))
            v.txtPower:setText(stringUtils.format(localizable.common_CE, memberInfo.power))
            if memberInfo.playerId == self.leaderId then
                v.imgCaptain:setVisible(true)
            else
                v.imgCaptain:setVisible(false)
            end
            v.btnLeave:setVisible(false)            
            if self.myTeamType == 1 and self.leaderId == MainPlayer:getPlayerId() and
                memberInfo.playerId ~= MainPlayer:getPlayerId() and self.isSignUp ~= 1
                and self.isLastChampion == false then
                v.btnLeave:setVisible(true)
                v.btnLeave:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnLeaveClick))
                v.btnLeave.logic = self
                v.btnLeave.playerId = memberInfo.playerId
            end
            v.img_hui:setVisible(true)
        else
            --没有玩家
            v.img_hui:setVisible(false)
            v.playerNode:setVisible(false)
            v.emptyNode:setVisible(true)
            v.btnInvitation:setVisible(false)
            v.txtTips:setVisible(false)
            -- v.img_pipei:setVisible(false)
            v.ppEffect:setVisible(false)
            if self.myTeamType == 1 and self.leaderId == MainPlayer:getPlayerId() then                
                v.btnInvitation:setVisible(true)
                v.btnInvitation:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onInvitationClick))
                v.btnInvitation.logic = self
                v.txtTips:setVisible(true)
            end
            if self.myTeamType == 0 then
                -- v.img_pipei:setVisible(true)
                v.ppEffect:setVisible(true)
            end
        end
    end
end

function KingWarMyTeamLayer.onInvitationClick( btn )
    KingOfWarManager:openInvitationLayer()
end

function KingWarMyTeamLayer.onSignOutClick( btn )
    
    CommonManager:showOperateSureLayer(
        function()
            KingOfWarManager:requestRemoveMember( 0, MainPlayer:getPlayerId() )
        end,
        function()
            AlertManager:close()
        end,
        {
            title = localizable.common_tips,
            msg = localizable.KingWarSignOutTeam,
            showtype = AlertManager.BLOCK_AND_GRAY,
        }
    )
end

function KingWarMyTeamLayer.onEditTeamClick( btn )
    local layer = AlertManager:addLayerByFile("lua.logic.kingofwar.KingWarTeamEditLayer")
    AlertManager:show()
end

function KingWarMyTeamLayer.onBtnLeaveClick( btn )
    local playerId = btn.playerId
    local  msg = stringUtils.format(localizable.KingWarLeaveMember)
    CommonManager:showOperateSureLayer(
        function()
            KingOfWarManager:requestRemoveMember( 0, playerId )
        end,
        function()
            AlertManager:close()
        end,
        {
            title = localizable.common_tips,
            msg = msg,
            showtype = AlertManager.BLOCK_AND_GRAY,
        }
    )
end

function KingWarMyTeamLayer.onChatClick( btn )
    local self = btn.logic
    KingOfWarManager:setTeamChatRedState(false)
    -- CommonManager:setRedPoint(self.btnChat, KingOfWarManager:getTeamChatRedState(),"btnChat",ccp(0,0))
    self:onShow()
    KingOfWarManager:openChatLayer()
end

function KingWarMyTeamLayer.onSignUpClick( btn )
    KingOfWarManager:requestSignUp()
end
return KingWarMyTeamLayer