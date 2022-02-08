
-- client side KingWarSignUpLayer.lua
--[[
 * @Description: 王者争霸-报名界面
 ]]
-- script writer Happy.All
-- creation time 2016-11-2 12:07:18
local KingWarSignUpLayer = class("KingWarSignUpLayer",BaseLayer)


function KingWarSignUpLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossarena.CrossArenaMain")
end

function KingWarSignUpLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.KFKingWar,{HeadResType.SYCEE})

    self.btnRule = TFDirector:getChildByPath(ui, 'btn_guizhe')
    self.btnReward = TFDirector:getChildByPath(ui, 'btn_jiangli')
    self.btnAtkArmy = TFDirector:getChildByPath(ui, 'btn_jinggong')
    self.btnDefArmy = TFDirector:getChildByPath(ui, 'btn_fangshou')

    local img_paiming = TFDirector:getChildByPath(ui, "img_paiming")
    self.cutDownTime = TFDirector:getChildByPath(img_paiming, "txt_num1")
    -- local txt_num1 = TFDirector:getChildByPath(img_paiming, "txt_num1")
    -- txt_num1:setVisible(false)
    --未报名状态
    self.randomNode = TFDirector:getChildByPath(ui, "panel_suiji")
    self.btnCreateTeam = TFDirector:getChildByPath(self.randomNode, "btn_cj")
    self.btnRandomTeam = TFDirector:getChildByPath(self.randomNode, "btn_sjpp")
    local txt_num = TFDirector:getChildByPath(self.randomNode, 'txt_num')
    local needSycee = ConstantData:objectByID("ContestCreatATeamNeed").value or 400
    txt_num:setText(needSycee)
    --已有队伍状态
    self.myTeamNode = TFDirector:getChildByPath(ui, "panel_myteam")
    self.btnSignOut = TFDirector:getChildByPath(self.myTeamNode, "btn_tuichu")
    self.btnSignUp = TFDirector:getChildByPath(self.myTeamNode, "btn_baoming")
    self.btnEditTeam = TFDirector:getChildByPath(self.myTeamNode, "btn_bianji")
    self.btnChat = TFDirector:getChildByPath(self.myTeamNode, "btn_teamchat")
    
    self.txtTeamName = TFDirector:getChildByPath(self.myTeamNode, "txt_teamname")
    self.teamMemberNode = {}
    for i=1,3 do
        local teamNode = TFDirector:getChildByPath(self.myTeamNode, "panel_role"..i)
        local info = {}
        info.playerNode = TFDirector:getChildByPath(teamNode, "bg_1")
        info.txtName = TFDirector:getChildByPath(info.playerNode, "txt_name")
        info.imgIcon = TFDirector:getChildByPath(info.playerNode, "icon_head")
        info.imgFrame = TFDirector:getChildByPath(info.playerNode, "img_role")
        info.txtPower = TFDirector:getChildByPath(info.playerNode, "txt_zhanli")
        info.txtLogin = TFDirector:getChildByPath(info.playerNode, "txt_time")
        info.btnLeave = TFDirector:getChildByPath(info.playerNode, "btn_tichu")
        info.imgCaptain = TFDirector:getChildByPath(info.playerNode, "img_dz")
        

        info.imgBigRole = TFDirector:getChildByPath(info.playerNode, "img_role")
        info.txtLoginTime = TFDirector:getChildByPath(info.playerNode, 'txt_time')        
        info.txt_zuijin = TFDirector:getChildByPath(info.playerNode, 'txt_zuijin')        
        -- info.img_splash = TFDirector:getChildByPath(info.playerNode, 'img_splash')  

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

function KingWarSignUpLayer:removeUI()
	self.super.removeUI(self)
end

function KingWarSignUpLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
    CommonManager:setRedPoint(self.btnChat, KingOfWarManager:getTeamChatRedState(),"btnChat",ccp(0,0))
end

function KingWarSignUpLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)
    
    if self.generalHead then
        self.generalHead:registerEvents()
    end

    -- KingOfWarManager:requestFinalFightInfo()

    self.btnCreateTeam.logic = self
    self.btnCreateTeam:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCreateTeamClick))
    self.btnRandomTeam.logic = self
    self.btnRandomTeam:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRandomTeamClick))
    self.btnRule.logic = self
    self.btnRule:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRuleClick))
    self.btnReward.logic = self
    self.btnReward:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRewardClick))
    self.btnAtkArmy.logic = self
    self.btnAtkArmy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAtkArmyClick))
    self.btnDefArmy.logic = self
    self.btnDefArmy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onDefArmyClick))

    self.btnSignOut.logic = self
    self.btnSignOut:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignOutClick))
    self.btnSignUp.logic = self
    self.btnSignUp:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignUpClick))
    self.btnEditTeam.logic = self
    self.btnEditTeam:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onEditTeamClick))
    self.btnChat.logic = self
    self.btnChat:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onChatClick))

    self.UpdateTeamInfoMsgCallBack = function (event)

        self.lastSignUp = self.isSignUp
        self:showMyTeamInfo()
        self:showCutDownTimer()
        if self.lastSignUp and self.lastSignUp == 0 and self.isSignUp == 1 then
            toastMessage(localizable.KingWarSignUpSuccess)
        end
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.UpdateTeamInfoMsgCallBack)
    self.updateRedPoint = function ( event )
        -- CommonManager:setRedPoint(self.btnChat, KingOfWarManager:getTeamChatRedState(),"btnChat",ccp(0,0))
        self:onShow()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateInvitationMsg, self.updateRedPoint)
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateNewChatMsg, self.updateRedPoint)
    self.registerEventCallFlag = true 
end

function KingWarSignUpLayer:removeEvents()

    self.super.removeEvents(self)
    if self.generalHead then
        self.generalHead:removeEvents()
    end

    if self.UpdateTeamInfoMsgCallBack then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.UpdateTeamInfoMsgCallBack)
        self.UpdateTeamInfoMsgCallBack = nil
    end

    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end

    if self.updateRedPoint then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateInvitationMsg, self.updateRedPoint)
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateNewChatMsg, self.updateRedPoint)
        self.updateRedPoint = nil
    end
    self.registerEventCallFlag = nil  
end

function KingWarSignUpLayer:dispose()
	self.super.dispose(self)

    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end   
end

function KingWarSignUpLayer:setLayerType( layerType )
    --layerType 0:random 1:team
    print("KingWarSignUpLayer:setLayerType( layerType ) = ",layerType)

    self:showMyTeamInfo()   
    
    self:showCutDownTimer()
end

function KingWarSignUpLayer:showCutDownTimer()
    local countDown = KingOfWarManager:getScoreRankStartCutDownTime()
    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end

    self.cutDownTime:setText(KingOfWarManager:showTime( countDown ))
    self.countDownTimer = TFDirector:addTimer(1000, -1, nil, function ()
        if countDown <= 0 then
            if self.countDownTimer then
                TFDirector:removeTimer(self.countDownTimer)
                self.countDownTimer = nil
            end
            self.cutDownTime:setText(KingOfWarManager:showTime( countDown ))
            -- self:showCutDownTimer()
        else
            countDown = countDown - 1
            self.cutDownTime:setText(KingOfWarManager:showTime( countDown ))
        end
    end)
end

function KingWarSignUpLayer:showMyTeamInfo()
    local layerType = 0
    if KingOfWarManager:checkIsInTeam() == true then
        layerType = 1
    end
    if layerType == 0 then
        self.myTeamNode:setVisible(false)
        self.randomNode:setVisible(true)
    else
        self.myTeamNode:setVisible(true)
        self.randomNode:setVisible(false)        
    end
    local myTeam = KingOfWarManager:getTeamInfo()
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
    if (self.myTeamType == 1 and self.isSignUp ~= 1) and self.isLastChampion == false then
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
            -- print("memberInfo = ",memberInfo)
            local RoleIcon = RoleData:objectByID(memberInfo.useIcon)
            v.imgBigRole:setTexture(RoleIcon:getBigImagePath())
            local currTime = MainPlayer:getNowtime() - memberInfo.loginTime/1000
            v.txtLoginTime:setText(FriendManager:formatTimeToStringWithOut(currTime))   
            v.txt_zuijin:setVisible(true)    
            -- v.imgIcon:setTexture(RoleIcon:getIconPath())
            -- Public:addFrameImg(v.imgIcon,memberInfo.frameId) 
            v.txtPower:setText(stringUtils.format(localizable.common_CE, memberInfo.power))
            Public:addInfoListen(v.imgBigRole,true,6,memberInfo.playerId,memberInfo.serverId)
            -- v.imgCaptain
            if memberInfo.playerId == self.leaderId then
                v.imgCaptain:setVisible(true)
            else
                v.imgCaptain:setVisible(false)
            end
            v.btnLeave:setVisible(false)            
            if self.myTeamType == 1 and self.leaderId == MainPlayer:getPlayerId()
                and memberInfo.playerId ~= MainPlayer:getPlayerId() and self.isSignUp ~= 1
                and self.isLastChampion == false then
                v.btnLeave:setVisible(true)
                v.btnLeave:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnLeaveClick))
                v.btnLeave.logic = self
                v.btnLeave.playerId = memberInfo.playerId
            end
        else
            --没有玩家
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

function KingWarSignUpLayer.onInvitationClick( btn )
    KingOfWarManager:openInvitationLayer()
end

function KingWarSignUpLayer.onCreateTeamClick( btn )
    local layer = AlertManager:addLayerByFile("lua.logic.kingofwar.KingWarCreateTeamLayer")
    AlertManager:show()
end

function KingWarSignUpLayer.onRandomTeamClick( btn )
    CommonManager:showOperateSureLayer(
        function()
            KingOfWarManager:requestJoinTeam(0, "")
        end,
        function()
            AlertManager:close()
        end,
        {
            title = localizable.common_tips,
            msg = localizable.KingWarRandomTips,
            showtype = AlertManager.BLOCK_AND_GRAY,
        }
    )
end
function KingWarSignUpLayer.onRuleClick( btn )
    KingOfWarManager:openRuleLayer()
end
function KingWarSignUpLayer.onRewardClick( btn )
    KingOfWarManager:openRewardLayer()
end
function KingWarSignUpLayer.onAtkArmyClick( btn )
    KingOfWarManager:openAtkArmyLayer()
end
function KingWarSignUpLayer.onDefArmyClick( btn )
    KingOfWarManager:openDefArmyLayer()
end
function KingWarSignUpLayer.onSignOutClick( btn )
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
function KingWarSignUpLayer.onBtnLeaveClick( btn )
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

function KingWarSignUpLayer.onSignUpClick( btn )
    KingOfWarManager:requestSignUp()
end
function KingWarSignUpLayer.onChatClick( btn )
    local self = btn.logic
    KingOfWarManager:setTeamChatRedState(false)
    self:onShow()
    -- CommonManager:setRedPoint(self.btnChat, KingOfWarManager:getTeamChatRedState(),"btnChat",ccp(0,0))
    KingOfWarManager:openChatLayer()
end
function KingWarSignUpLayer.onEditTeamClick( btn )
    local layer = AlertManager:addLayerByFile("lua.logic.kingofwar.KingWarTeamEditLayer")
    AlertManager:show()
end
return KingWarSignUpLayer