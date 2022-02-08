--[[
******王者争霸-数据管理*******
	-- by happy
	-- 2016-10-31 14:45:19
]]

local KingOfWarManager = class("KingOfWarManager")

KingOfWarManager.ActivityState_unOpen = 0 --活动未开启
KingOfWarManager.ActivityState_SignUp = 1 --活动报名阶段
KingOfWarManager.ActivityState_Score  = 2 --活动战斗阶段(积分赛)
KingOfWarManager.ActivityState_Betting= 3 --活动押注
KingOfWarManager.ActivityState_Final  = 4 --活动战斗阶段(总决赛)
KingOfWarManager.ActivityState_Result = 5 --活动结束展示阶段
KingOfWarManager.ActivityState_End = 6 --活动结束

KingOfWarManager.NeedSwitchLayerMsg = "KingOfWarManager.NeedSwitchLayerMsg"
KingOfWarManager.UpdateTeamInfoMsg = "KingOfWarManager.UpdateTeamInfoMsg"
KingOfWarManager.UpdateSignUpMsg = "KingOfWarManager.UpdateSignUpMsg"
KingOfWarManager.UpdateScoreRankMsg = "KingOfWarManager.UpdateScoreRankMsg"
KingOfWarManager.UpdateFinalFightMsg = "KingOfWarManager.UpdateFinalFightMsg"
KingOfWarManager.UpdateBetMsg = "KingOfWarManager.UpdateBetMsg"
KingOfWarManager.UpdateLastHistoryMsg = "KingOfWarManager.UpdateLastHistoryMsg"
KingOfWarManager.UpdateAllLastHistoryMsg = "KingOfWarManager.UpdateAllLastHistoryMsg"
KingOfWarManager.UpdateInvitationMsg = "KingOfWarManager.UpdateInvitationMsg"
KingOfWarManager.UpdateNewChatMsg = "KingOfWarManager.UpdateNewChatMsg"
KingOfWarManager.UpdateActivityState = "KingOfWarManager.UpdateActivityState"
KingOfWarManager.UpdateRedPacketMsg = "KingOfWarManager.UpdateRedPacketMsg"
KingOfWarManager.UpdateResultMsg = "KingOfWarManager.UpdateResultMsg"
KingOfWarManager.OtherContestTeamMsg = "KingOfWarManager.OtherContestTeamMsg"
KingOfWarManager.BETRATE = "KingOfWarManager.betrate"
KingOfWarManager.REPONSE_WIN_COUNT  ="KingOfWarManager.REPONSE_WIN_COUNT"

function KingOfWarManager:ctor(data)
    self.personGrandList = TFArray:new()
    self.publicGrandList = TFArray:new()


    self.invitationHistory = TFArray:new()
    self.teamChatList = TFArray:new()
    self.redPacketList = TFArray:new()

    self.teamRedState = false
    --当前活动状态 服务器推送
    TFDirector:addProto(s2c.CONTEST_STATUS_RESPONSE, self, self.onActivityUpdate)
    --我的队伍信息 服务器推送
    TFDirector:addProto(s2c.MY_CONTEST_TEAM_RESPONSE, self, self.onContestTeamUpdate) 
    --积分赛信息请求
    TFDirector:addProto(s2c.CONTEST_TEAM_RANKING_RESPONSE, self, self.onContestScoreRankInfo)
    --擂主赛信息
    TFDirector:addProto(s2c.CONTEST_FINALS_RESPONSE, self, self.onContestFinalsInfo)
    --押注反馈
    TFDirector:addProto(s2c.CONTEST_BET_RESPONSE, self, self.onContestBetMsg)
    --邀请好友
    TFDirector:addProto(s2c.CONTEST_TEAM_INVITE_RESPONSE, self, self.onTeamInviteMsg) 
    --查看上一届擂主信息   
    TFDirector:addProto(s2c.CONTEST_HISTORY_LEI_ZHU_RESPONSE, self, self.onContestHistoryMsg)
    --查看历届擂主信息   
    TFDirector:addProto(s2c.CONTEST_HISTORY_ALL_LEI_ZHU_RESPONSE, self, self.onAllContestHistoryMsg)
    --队伍聊天信息   
    TFDirector:addProto(s2c.CONTEST_TEAM_CHAT_RESPONSE, self, self.onContestTeamChatMsg)
    --被邀请的私聊消息   
    TFDirector:addProto(s2c.CONTEST_INVITATION_INFO_RESULT, self, self.onContestInvitationMsg)
    --拒绝邀请的消息   
    TFDirector:addProto(s2c.REFUSE_SUCCESS_RESPONSE, self, self.onRefuseSuccessMsg)
    --战报 服务器推送   
    TFDirector:addProto(s2c.CONTEST_TEAM_GRAND_RESPONSE, self, self.grand)
    --红包 服务器推送   
    TFDirector:addProto(s2c.CONTEST_RED_PACKET_RESPONSE, self, self.onRedPacketMsg)
    --查看其它队伍详细
    TFDirector:addProto(s2c.OTHER_CONTEST_TEAM_RESPONSE, self, self.onOtherContestTeamResponse)
    --押注比率
    TFDirector:addProto(s2c.RESPONSE_BET_INFO, self, self.updataBetRate)
    --获取宝箱信息
    TFDirector:addProto(s2c.REPONSE_WIN_COUNT, self, self.requestWinCount)


    self:restart()
end

function KingOfWarManager:restart()

    self.personGrandList:clear()
    self.publicGrandList:clear()


    self.invitationHistory:clear()
    self.teamChatList:clear()
    self.redPacketList:clear()

    self.activityState = 0

    self.scoreRankInfo = nil
    self.myTeamInfo = nil
    self.teamRedState = false

    self.replayIdHistory = {}
    self.fightVideoList = {}    
    self.winCount = 0
    self.winStreak = 0
    self.boxes = 0
end

function KingOfWarManager:onActivityUpdate( event )
    local state = event.data.status 
    if state == self.ActivityState_Score or state == self.ActivityState_Final then
        NotifyManager:clearMsgByType(32)
    end
    self:setActivityState(state)
end
function KingOfWarManager:setActivityState(state)    
    if self.activityState == state then
        if state == KingOfWarManager.ActivityState_Final then
            TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateActivityState,{})
        end
        return
    end
    self.activityState = state
    TFDirector:dispatchGlobalEventWith(KingOfWarManager.NeedSwitchLayerMsg,{})
end
function KingOfWarManager:getActivityState()
    return self.activityState
end


--Remark:打开指定的界面
function KingOfWarManager:openMainLayer()
    if (MainPlayer:getServerSwitchStatue(ServerSwitchType.KingOfWar) ~= true) then
        toastMessage(localizable.KingWarInspireTips2)
        return 
    end
    --打开主界面
    local state = self:getActivityState()
    if state == KingOfWarManager.ActivityState_unOpen then
        --toastMessage("活动未开启")
        return
    end
    local openLevel = FunctionOpenConfigure:getOpenLevel(2217)
    local currLevel = MainPlayer:getLevel()
    if currLevel < openLevel then
        toastMessage(stringUtils.format(localizable.common_function_openlevel, openLevel))
        return
    end

    local layer = AlertManager:addLayerByFile("lua.logic.kingofwar.KingWarMainLayer")
    AlertManager:show()
end
function KingOfWarManager:openChatLayer()

    if self:checkIsInTeam() then
        local layer = require("lua.logic.chat.ChatMainLayer"):new()
        layer:changeGroupChoice( 6 )
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
        AlertManager:show()    
    else
        toastMessage(localizable.KingWarNoTeamJoin)
    end

end
function KingOfWarManager:openMyTeamLayer()
    if self:checkIsInTeam() then
        local layer = require("lua.logic.kingofwar.KingWarMyTeamLayer"):new()
        layer:showMyTeamInfo()
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
        AlertManager:show()
    else
        toastMessage(localizable.KingWarNoTeamJoin)
    end
end
function KingOfWarManager:openRuleLayer()
    CommonManager:showRuleLyaer("wangzheleitai")
end
function KingOfWarManager:openRewardLayer()
    local layer = require("lua.logic.kingofwar.KingWarRewardLayer"):new(11)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
    AlertManager:show()
end
function KingOfWarManager:openInvitationLayer()
    AlertManager:addLayerByFile("lua.logic.friends.FriendTeam",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    AlertManager:show();
end
function KingOfWarManager:openCrossArenaResultLayer()
    AlertManager:addLayerToQueueAndCacheByFile("lua.logic.kingOfwar.KingWarCrossArenaResult",AlertManager.BLOCK_AND_GRAY,tween);
    AlertManager:show();
end
function KingOfWarManager:openAtkArmyLayer()
    MultiServerFightManager:btnAtkClick()
end
function KingOfWarManager:openDefArmyLayer()
    MultiServerFightManager:btnDefClick()
end
function KingOfWarManager:openOtherTeamLayer(teamType)
    local data
    local finalInfo = self.contestFinalsInfo or {}
   
    local info = finalInfo.info
    if info == nil then
        print("cannot find the fight info")
        return
    end
    if teamType == "atk" then
        data = info[1].atkTeam
    elseif teamType == "def" then
        data = info[1].defTeam
    end
    if data then
        local layer = require("lua.logic.kingofwar.KingWarOtherTeamLayer"):new(data)
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_NONE)
        AlertManager:show()
    end
end

--Remark:积分赛战报信息
function KingOfWarManager:grand(event)
    --获取积分赛战报信息 服务器推送
    local data = event.data
    -- print("grand data , ==",data)
    local message = {}
    if data.type == 1 then
        message = self:getYouBeatGrand( data.msg )
        if self.personGrandList:length() >= 20 then
            self.personGrandList:popFront()
        end
        self.personGrandList:pushBack(message)
    elseif data.type == 2 then
        message = self:getYouFailGrand( data.msg )
        if self.personGrandList:length() >= 20 then
            self.personGrandList:popFront()
        end
        self.personGrandList:pushBack(message)
    elseif data.type == 3 then
        message = self:getBeatYouGrand( data.msg )
        if self.personGrandList:length() >= 20 then
            self.personGrandList:popFront()
        end
        self.personGrandList:pushBack(message)
    elseif data.type == 4 then
        message = self:getFailYouGrand( data.msg )
        if self.personGrandList:length() >= 20 then
            self.personGrandList:popFront()
        end
        self.personGrandList:pushBack(message)
    elseif data.type == 5 then
        local strState = localizable.NotifyManager_wulin_broadcast_state
        local strEnd = strState[5]
        local strFormat = localizable.NotifyManager_wulin_broadcast_attack
        local msg = data.msg or data.message
        local msgTab = string.split(msg, ',')
        local name = msgTab[1] or ""
        local count = msgTab[2] or 5
        count = tonumber(count)
        if count > 9 then
            strEnd = strState[9]
        elseif count >= 5 then
            strEnd = strState[count]
        end
        local _state = self:getActivityState()
        if _state == self.ActivityState_Score or _state == self.ActivityState_Final then
            local str = stringUtils.format( strFormat, msgTab[1], msgTab[2], strEnd)
            NotifyManager:addMessage(str, 1, 2,32)
        end

        message = self:getAttWinStreakGrand( data.msg )
        if self.publicGrandList:length() >= 20 then
            self.publicGrandList:popFront()
        end
        self.publicGrandList:pushBack(message)
    elseif data.type == 6 then
        local strFormat = localizable.NotifyManager_wulin_broadcast_defend
        local msg = data.msg or data.message
        local msgTab = string.split(msg, ',')
        local name = msgTab[1] or ""
        local count = msgTab[2] or 5
        count = tonumber(count)
		local _state = self:getActivityState()
        if _state == self.ActivityState_Score or _state == self.ActivityState_Final then
            local str = stringUtils.format( strFormat, msgTab[1], msgTab[2])
            NotifyManager:addMessage(str, 1, 2,32)
        end
        
        message = self:getDefWinStreakGrand( data.msg )
        if self.publicGrandList:length() >= 20 then
            self.publicGrandList:popFront()
        end
        self.publicGrandList:pushBack(message)
    end
end
function KingOfWarManager:getYouBeatGrand( _message )
    local info = stringToTable(_message,",")
    local message = {}
    message.message = stringUtils.format(localizable.KingWarManager_jibai_xxx, info[1]) --"你击败了"..info[1].."，"
    message.score = stringUtils.format(localizable.KingWarFightScoreAdd, info[3]) --"积分+"..info[3]
    return message
end
function KingOfWarManager:getYouFailGrand( _message )
    local info = stringToTable(_message,",")
    local message = {}
    message.message = stringUtils.format(localizable.KingWarManager_tiaozhanshibai, info[1]) --"你挑战"..info[1].."失败"
    message.rbg = ccc3(255,0,0)
    return message
end
function KingOfWarManager:getBeatYouGrand( _message )
    local info = stringToTable(_message,",")
    local message = {}
    message.message = stringUtils.format(localizable.KingWarManager_xxx_jibai, info[1])  --info[1].."击败了你"
    message.rbg = ccc3(255,0,0)
    return message
end
function KingOfWarManager:getFailYouGrand( _message )
    local info = stringToTable(_message,",")
    local message = {}
    message.message =  stringUtils.format(localizable.KingWarManager_xxx_tiaozhan, info[1]) --info[1].."挑战你失败，"
    message.score = stringUtils.format(localizable.KingWarFightScoreAdd, info[2]) -- "积分+"..info[2]
    return message
end
function KingOfWarManager:getAttWinStreakGrand( _message )
    local info = stringToTable(_message,",")
    local message = {}
    local times = tonumber(info[2])
    local descIndex = times
    if times >= 9 then
        descIndex = 9
    end
    message.message = stringUtils.format(localizable.ZhengbaManager_fight_desc[descIndex], info[1], times)

    if times >= 10 then
        message.showEffect = true
    end
    return message
end
function KingOfWarManager:getDefWinStreakGrand( _message )
    local info = stringToTable(_message,",")
    local message = {}
    -- message.message = info[1].."取得了防守"..info[2].."连胜，已经无人能破！"
    message.message = stringUtils.format(localizable.ZhengbaManager_fight_desc2, info[1], info[2])
    if tonumber(info[2]) >= 10 then
        message.showEffect = true
    end
    return message
end
function KingOfWarManager:getReport( message_type )
    --获取战报信息 message_type：1个人战报 2大会战报
    if message_type == 1 then
        return self.personGrandList
    else
        return self.publicGrandList
    end
end


--Remark:我的队伍信息
function KingOfWarManager:checkIsInRace()
    if self.myTeamInfo and self.myTeamInfo.signUp == 1 then
        return true
    end
    return false
end
function KingOfWarManager:checkIsInTeam()
    if self.myTeamInfo and self.myTeamInfo.team then
        return true
    end
    return false
end
function KingOfWarManager:onContestTeamUpdate(event)
    --队伍信息更新 服务器推送
    -- print('event = ',event.data)
    -- p.p = 1
    hideLoading()
    if self.myTeamInfo == nil then
        self.myTeamInfo = {}
    end
    local data = event.data
    local dispatchMsg = KingOfWarManager.UpdateTeamInfoMsg
    if (self.myTeamInfo.team and data.team == nil) then
        --离开成功
        dispatchMsg = KingOfWarManager.NeedSwitchLayerMsg
        self.teamRedState = false
    elseif (self.myTeamInfo.team == nil and data.team) then
        if data.team then
            local teamId = data.team.id
            self:deleteInvitationMsg(teamId)
            if self.openMainLayerFlag then
                self.openMainLayerFlag = nil
                self:openMainLayer()
            end
        end        
    end

    self.myTeamInfo = event.data or {}
    if self.myTeamInfo.atkFormation then
        local tbl = stringToNumberTable(self.myTeamInfo.atkFormation,',')
        ZhengbaManager:qunHaoDefFormationSet(EnumFightStrategyType.StrategyType_CHAMPIONS_ATK, tbl)
    end
    if self.myTeamInfo.defFromation then
        local tbl = stringToNumberTable(self.myTeamInfo.defFromation,',')
        ZhengbaManager:qunHaoDefFormationSet(EnumFightStrategyType.StrategyType_CHAMPIONS_DEF, tbl)
    end

    TFDirector:dispatchGlobalEventWith(dispatchMsg, {})
end
function KingOfWarManager:getSignUpState()
    if self.myTeamInfo and self.myTeamInfo.signUp and self.myTeamInfo.signUp == 1 then
        return 1
    end
    return 0
end
function KingOfWarManager:enableOpenMainLayerSet(flag)
    self.openMainLayerFlag = flag
end
function KingOfWarManager:requestJoinTeam(joinType, teamName)
    showLoading()
    teamName = teamName or "王者争霸"
    local msg = {
        joinType,
        teamName,
    }

    TFDirector:send(c2s.CONTEST_TEAM_REQUEST,msg)   
end
function KingOfWarManager:getTeamInfo()
    return self.myTeamInfo
end
function KingOfWarManager:requestSignUp()
    local state = self:getActivityState()
    if state == KingOfWarManager.ActivityState_Score or state == KingOfWarManager.ActivityState_SignUp then
        showLoading()
        TFDirector:send(c2s.CONTEST_TEAM_SIGN_UP_REQUEST, {0})  
    else
        toastMessage(localizable.CrossFightBattle_ApplyOutTime)
    end
end

--Remark:积分赛信息
function KingOfWarManager:requestScoreRankInfo()
    --请求积分排行榜信息
    showLoading()
    TFDirector:send(c2s.CONTEST_TEAM_RANKING_REQUEST,{})
end
function KingOfWarManager:onContestScoreRankInfo(event)
    hideLoading()
    self.scoreRankInfo = event.data
    if self.scoreRankInfo.atkFormation then
        local tbl = stringToNumberTable(self.scoreRankInfo.atkFormation,',')
        ZhengbaManager:qunHaoDefFormationSet(EnumFightStrategyType.StrategyType_CHAMPIONS_ATK, tbl)
    end
    if self.scoreRankInfo.defFromation then
        local tbl = stringToNumberTable(self.scoreRankInfo.defFromation,',')
        ZhengbaManager:qunHaoDefFormationSet(EnumFightStrategyType.StrategyType_CHAMPIONS_DEF, tbl)
    end
    TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateScoreRankMsg, {})
end
function KingOfWarManager:getScoreRankInfo()
    return self.scoreRankInfo
end
function KingOfWarManager:checkIsLastChampion(lastChampionId)
    --检测是否为上一届擂主
    if lastChampionId == nil then
        return false
    end
    if self.myTeamInfo and self.myTeamInfo.team then
        if self.myTeamInfo.team.id == lastChampionId then
            return true
        end
    end
    return false
end
function KingOfWarManager:getMyTeamLeaderInfo()
    --检测是否为上一届擂主
    local teamName = ""
    local teamIcon = 1
    if self.myTeamInfo and self.myTeamInfo.team then
        local member = self.myTeamInfo.team.member
        local leaderId = self.myTeamInfo.team.leader
        teamName = self.myTeamInfo.team.name
        for k,v in pairs(member) do
            if v.playerId == leaderId then
                teamIcon = v.useIcon
                break
            end
        end
    end
    return teamName,teamIcon
end
function KingOfWarManager:getCurrSecond()
    local date = GetCorrectDate("*t", MainPlayer:getNowtime())
    if date.wday == 1 then
        date.wday = 8
    end
    local wday = date.wday - 2        
    local nowTime = wday*(24*60*60) + (date.hour*60 + date.min)*60 + date.sec
    return nowTime
end
function KingOfWarManager:getScoreRankStartCutDownTime()
    local currSec = ConstantData:objectByID("MasterContestManager.ScoreBattleStart").value or 0
    local noewTime = self:getCurrSecond()
    currSec = currSec - noewTime
    if currSec < 0 then
        currSec = 0
    end
    return currSec
end
function KingOfWarManager:getScoreRankCutDownTime()
    local currSec = ConstantData:objectByID("MasterContestManager.ScoreBattleEnd").value or 0
    local noewTime = self:getCurrSecond()
    currSec = currSec - noewTime
    if currSec < 0 then
        currSec = 0
    end
    return currSec
end
function KingOfWarManager:transformProgramData(data)
    local retData = {}   
    local function getLeaderInfo( data )
        local leaderId = data.leader
        for _,v in pairs(data.member) do
            if leaderId == v.playerId then
                return v
            end
        end        
    end
    local function isAtkWin( data )
        local winNum = 0
        for _,v in pairs(data) do
            if v == 0 then
                winNum = winNum + 1
            end
        end
        if winNum >= 2 then
            return true
        end
        return false
    end
    local atkLeaderInfo = getLeaderInfo(data.atkTeam)
    local defLeaderInfo = getLeaderInfo(data.defTeam)
    retData.atkName = data.atkTeam.name
    retData.defNam = data.defTeam.name
    retData.atkWin = isAtkWin(data.result)
    retData.createTime = data.createTime
    retData.atkUseIcon = atkLeaderInfo.useIcon
    retData.atkFrameId = atkLeaderInfo.frameId
    retData.defUseIcon = defLeaderInfo.useIcon
    retData.defFrameId = defLeaderInfo.frameId
    return retData
end
function KingOfWarManager:onBtnReportClick( replayId )
    showLoading()
    TFDirector:send(c2s.WATCH_CROSS_SERVER_BATTLE_REPLAY,{replayId})
end
function KingOfWarManager:getStateByTeamIndex(senceIndex)
    local isEnd = false
    local cutTime = 0
    local currFightIndex = 0
    if senceIndex == 0 then
        --积分赛
        isEnd = true
        currFightIndex = 4
    else
        local sec1 = ConstantData:objectByID("MasterContestManager.LastBattleBattleTime").value
        local sec2 = ConstantData:objectByID("MasterContestManager.LastBattleShowTime").value
        local oneRoundTime = sec1*3+sec2

        local startSec = ConstantData:objectByID("MasterContestManager.LastBattleStart").value
        startSec = startSec + (senceIndex - 1)*oneRoundTime

        local currSecond = self:getCurrSecond() - startSec
        if currSecond < 0 then
            currFightIndex = 0
        elseif currSecond >= sec1*3 then
            --展示时间
            isEnd = true
            currFightIndex = 4
        else
            local fightIndex = math.ceil(currSecond/sec1)
            cutTime = fightIndex*sec1 - currSecond
            currFightIndex = fightIndex
        end
    end
    return isEnd,currFightIndex,cutTime
end
function KingOfWarManager:transformProgramMemberData(data)
    local retData = {}
    for i=1,3 do
        local atkMember = data.atkTeam.member[i]
        local defMember = data.defTeam.member[i]
        local replayId = (data.replayId and data.replayId[i])
        local result = (data.result and data.result[i])

        local member = {}
        member.atkPlayerId = atkMember.playerId
        member.atkName = atkMember.name
        member.atkPower = atkMember.power
        member.atkUseIcon = atkMember.useIcon
        member.atkFrameId = atkMember.frameId
        member.atkVipLevel = atkMember.vipLevel
        member.atkLevel = atkMember.level
        member.atkInspireNum = atkMember.inspireNum or 0
        member.atkSeverId = data.atkTeam.serverId
        member.atkTeamName = data.atkTeam.name
        member.atkTeamId = data.atkTeam.id
        member.atkTeamLeader = data.atkTeam.leader
        
        member.defPlayerId = defMember.playerId
        member.defName = defMember.name
        member.defPower = defMember.power
        member.defUseIcon = defMember.useIcon
        member.defFrameId = defMember.frameId
        member.defVipLevel = defMember.vipLevel
        member.defLevel = defMember.level
        member.defInspireNum = defMember.inspireNum or 0
        member.defSeverId = data.defTeam.serverId
        member.defTeamName = data.defTeam.name
        member.defTeamId = data.defTeam.id
        member.defTeamLeader = data.defTeam.leader

        member.result = result
        member.replayId = replayId

        table.insert(retData, member)
    end
    return retData
end
function KingOfWarManager:openScoreFightDetailLayer(createTime)
    local fightData = self.scoreRankInfo.replays or {}
    local currFight = nil
    for _,v in pairs(fightData) do
        if v.createTime == createTime then
            currFight = v
            break;
        end
    end
    
    if currFight then
        local retData = self:transformProgramMemberData(currFight)        
        local layer = require("lua.logic.kingofwar.KingWarFightDetailsLayer"):new()
        layer:setFightRound(retData)
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
        AlertManager:show()
    else
        print(" cannot find the fight record!!!!!")
    end
end
function KingOfWarManager:getFinalFightDataByIndex(index)
    
    if index == nil or self.finalFightDetails == nil then
        return nil,nil
    end
    for i=1,3 do
        if self.finalFightDetails[index] then
            return self.finalFightDetails[index],index
        else
            index = index - 1
        end
    end
    return nil,nil    
end

function KingOfWarManager:getFinalFightRankInfo()
    return self.finalFightRank or {}
end
function KingOfWarManager:getFinalFightMyRank()
    return self.finalFightMyRank or 0
end
function KingOfWarManager:getFinalFightMyScore()
    return self.finalFightMyScore or 0
end
function KingOfWarManager:getFinalFightLeizhuCount()
    return self.finalFightLeizhuCount or 0
end
function KingOfWarManager:getCurrFightRound()

    local sec1 = ConstantData:objectByID("MasterContestManager.LastBattleBattleTime").value
    local sec2 = ConstantData:objectByID("MasterContestManager.LastBattleShowTime").value
    local oneRoundTime = sec1*3+sec2
    local startSec = ConstantData:objectByID("MasterContestManager.LastBattleStart").value
    local currSecond = self:getCurrSecond() - startSec
    if currSecond <= 0 then
        return nil
    end
    local fightRound = math.ceil(currSecond/oneRoundTime)
    if fightRound > 3 then
        fightRound = 3
    end
    local retData,round = self:getFinalFightDataByIndex(fightRound)
    if retData then
        return round
    end
    return nil
end
function KingOfWarManager:openFinalFightDetailLayer(index)
    totalFightRound = self:getCurrFightRound() or 0
    local isEnd,currFightIndex,cutTime = self:getStateByTeamIndex(totalFightRound)
    local selectTeamIndex
    if isEnd and (cutTime <= 0) then
        selectTeamIndex = 1 
    else
        selectTeamIndex = totalFightRound
    end
    local data = self:getFinalFightDataByIndex(selectTeamIndex)
    if data then

        local layer = require("lua.logic.kingofwar.KingWarFightDetailsLayer"):new()
        layer:setFightRound()
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
        AlertManager:show()
    end
end
function KingOfWarManager:onContestFinalsInfo( event )
    hideLoading()
    self.contestFinalsInfo = event.data
    self:setContestFinalFightInfo(event.data)
    TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateFinalFightMsg, {})
end
function KingOfWarManager:setContestFinalFightInfo(data)
    data = data or {}
    self.finalFightRank = data.rank or {}
    self.finalFightMyScore = data.integral or 0
    self.finalFightMyRank = data.ranking or 0
    self.finalFightFirst = data.first or 1 -- 是否为第一届 1:是 其它：不是
    self.finalFightLeizhuCount = data.leizhuCount or 0
    local fightInfo = data.info or {}
    self.finalFightDetails = {}
    for k,v in pairs(fightInfo) do
        local fight = self:transformProgramMemberData(v)
        table.insert(self.finalFightDetails, fight)
    end    
end
function KingOfWarManager:checkIsFirst()
    if self.finalFightFirst and self.finalFightFirst == 1 then
        return true
    end
    return false
end
function KingOfWarManager:requestFinalFightInfo()
    showLoading()
    TFDirector:send(c2s.CONTEST_FINALS_REQUEST, {})
end

-- 请求押注比率
function KingOfWarManager:BetRateInfo(roundId)
    showLoading()
    local betMsg = {
        roundId
    }
    TFDirector:send(c2s.REQUEST_BET_INFO, betMsg)
end
--押注比率
function KingOfWarManager:updataBetRate(event)
    hideLoading()
    TFDirector:dispatchGlobalEventWith(KingOfWarManager.BETRATE,event.data)
end
function KingOfWarManager:checkIsInFinalFight() 
    if self.myTeamInfo == nil or self.myTeamInfo.team == nil then
        return false
    end
    local myTeamId = self.myTeamInfo.team.id

    local finalFightInfo = self.finalFightDetails or {}
    if finalFightInfo[1] == nil then
        return false
    end
    local fightInfo = finalFightInfo[1] or {}
    if fightInfo[1] == nil then
        return false
    end
    local atkTeamId = fightInfo[1].atkTeamId
    local defTeamId = fightInfo[1].defTeamId
    if atkTeamId == myTeamId or defTeamId == myTeamId then
        return true
    end
    return false
end
function KingOfWarManager:getBetCutDownTime()
    local sec1 = ConstantData:objectByID("MasterContestManager.ShowAndGambleEnd").value
    local currSecond = self:getCurrSecond()

    currSecond = sec1 - currSecond
    if currSecond < 0 then
        currSecond = 0
    end
    return currSecond
end
function KingOfWarManager:getFinalFightEndCutDownTime()
    local singlSec = ConstantData:objectByID("MasterContestManager.LastBattleBattleTime").value
    singlSec = singlSec*3*3
    local singlView = ConstantData:objectByID("MasterContestManager.LastBattleShowTime").value
    singlView = singlView*2

    local endTime = singlSec + singlView
    local currSecond = self:getCurrSecond()

    currSecond = endTime - currSecond
    if currSecond < 0 then
        currSecond = 0
    end
    return currSecond
end

function KingOfWarManager:getFinalFightRoundCutDownTime(round)
    round = round or 1
    local sec1 = ConstantData:objectByID("MasterContestManager.LastBattleBattleTime").value
    local sec2 = ConstantData:objectByID("MasterContestManager.LastBattleShowTime").value
    local oneRoundTime = sec1*3+sec2
    local startSec = ConstantData:objectByID("MasterContestManager.LastBattleStart").value
    startSec = startSec + (round)*oneRoundTime
    local currSecond = self:getCurrSecond()
    currSecond = startSec - currSecond

    if currSecond > oneRoundTime then
        currSecond = currSecond - oneRoundTime
        round = round - 1
    end
    if currSecond < 0 then
        currSecond = 0
    end
    return currSecond,round
end

function KingOfWarManager:getFinalViewEndCutDownTime()
    local singlSec = 24*60*60    
    local currSecond = self:getCurrSecond()

    currSecond = singlSec - currSecond
    if currSecond < 0 then
        currSecond = 0
    end
    return currSecond
end
function KingOfWarManager:getFinalFightPlayerInfo()
    local fightInfo = self.finalFightDetails
    if fightInfo == nil then
        return nil
    end
    local retData = {}
    local currRound = nil
    local atkInspireNum = nil
    local defInspireNum = nil
    local atkLeaderId = nil
    local defLeaderId = nil
    
    for round,currFight in pairs(fightInfo) do
        local data = {}
        local isEnd,currFightIndex = self:getStateByTeamIndex(round)  
        local atkResult = 0
        for k,v in pairs(currFight) do
            local isPlayed = self:checkFightVideoPlayed(v.replayId)
            if k == currFightIndex and isPlayed then
                currFightIndex = currFightIndex + 1
            end
            if v.result ~= nil and v.result == 0 then
                atkResult = atkResult + 1
            end            
        end
        if isEnd or currFightIndex > 3 then
            if atkResult >= 2 then
                data.fightResult = 0
            else
                data.fightResult = 1
            end
        end
        

        data.atkTeamName = currFight[1].atkTeamName
        data.defTeamName = currFight[1].defTeamName

        data.atkIsMe = false
        if currFight[1].atkTeamId == self:getMyTeamId() then
            data.atkIsMe = true
        end
        data.defIsMe = false
        if currFight[1].defTeamId == self:getMyTeamId() then
            data.defIsMe = true
        end

        if atkLeaderId == nil then
            atkLeaderId = currFight[1].atkTeamLeader
        end
        if defLeaderId == nil then
            defLeaderId = currFight[1].defTeamLeader
        end

        data.LeizhuCount = self:getFinalFightLeizhuCount()

        if atkInspireNum == nil then
            for idx,member in pairs(currFight) do
                atkInspireNum = atkInspireNum or 0
                atkInspireNum = atkInspireNum + member.atkInspireNum
                if member.atkPlayerId == atkLeaderId then
                    data.atkUseIcon = member.atkUseIcon
                end
            end
        end
        if defInspireNum == nil then
            for idx,member in pairs(currFight) do
                defInspireNum = defInspireNum or 0
                defInspireNum = defInspireNum + member.defInspireNum
                if member.defPlayerId == defLeaderId then
                    data.defUseIcon = member.defUseIcon
                end
            end
        end

        data.atkInspireNum = atkInspireNum or 0
        data.defInspireNum = defInspireNum or 0

        if self.myTeamInfo and self.myTeamInfo.bet then
            data.betWho = self.myTeamInfo.bet
        end
        table.insert(retData, data)
    end

    return retData
end
function KingOfWarManager:requestBet(coin,sycee,type)
    local msg = {
        coin,
        sycee,
        type
    }
    -- print("msg = ",msg)
    showLoading()
    self.msgBet = msg
    TFDirector:send(c2s.CONTEST_BET_REQUEST, msg)
end
function KingOfWarManager:onContestBetMsg( event )
    hideLoading()
    self.myTeamInfo = self.myTeamInfo or {}
    local result = event.data.result
    if result == 0 then
        --0成功
        self.myTeamInfo.bet = self.msgBet[3]
        toastMessage(localizable.KingWarBetsSuccess)
        TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateBetMsg, {})
    end
end


--Remark:队伍编辑
function KingOfWarManager:requestRemoveMember( teamId, playerId )
    --请求踢出队伍成员
    if (not self:checkIsInTeam()) then return end
    teamId = self:getMyTeamId()
    self.teamChatList:clear()
    showLoading()
    local msg = {
        teamId,
        playerId
    }
    TFDirector:send(c2s.CONTEST_TEAM_REMOVE_MEMBER_REQUEST, msg)
end
function KingOfWarManager:requestChangeTeamPos(msg)
    showLoading()
    TFDirector:send(c2s.CHANGE_CONTEST_TEAM_POSITION_REQUEST,msg)
end
function KingOfWarManager:getMyTeamId()
    if self.myTeamInfo and self.myTeamInfo.team then
        return self.myTeamInfo.team.id
    end
    return nil
end


--Remark:邀请好友组队
function KingOfWarManager:requestInvitationFriend(playerId)    
    local teamId = self:getMyTeamId()
    if teamId == nil then
        print("team not exist!!!!!")
        return
    end
    local msg = {
        teamId,            
        playerId           
    }
    showLoading()
    -- print("msg = ",msg)
    TFDirector:send(c2s.CONTEST_TEAM_INVITE_REQUEST,msg)   
end
function KingOfWarManager:onTeamInviteMsg( event )
    hideLoading()
    print("event.data = ",event.data)
    if event.data.playerId == nil then
        toastMessage(localizable.KingWarInviteJoinFalse)
        return
    end
    local data = event.data.playerId or {}
    self.myTeamInfo = self.myTeamInfo or {}
    self.myTeamInfo.playerId = self.myTeamInfo.playerId or {}
    for k,v in pairs(data) do
        table.insert(self.myTeamInfo.playerId, v)
    end
    TFDirector:dispatchGlobalEventWith(FriendManager.UpdateList, {})
end
function KingOfWarManager:checkInvitationFriendTable(playerId)
    --检测playerId好友是否已经被邀请了
    if self.myTeamInfo == nil or self.myTeamInfo.playerId == nil then
        return false
    end
    for k, v in pairs(self.myTeamInfo.playerId) do
        if v == playerId then
            return true
        end
    end
    return false
end


--Remark:查看上一届的擂主
function KingOfWarManager:requestContestHistory()
    --向服务器请求上一届擂主信息
    showLoading()
    TFDirector:send(c2s.CONTEST_HISTORY_LEI_ZHU_REQUEST, {})    
end
function KingOfWarManager:onContestHistoryMsg( event )
    hideLoading()
    self.lastHistoryInfo = event.data
    TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateLastHistoryMsg, {})
end
function KingOfWarManager:getLastHistoryInfo()
    return self.lastHistoryInfo
end


--Remark:历届擂主
function KingOfWarManager:requestAllContestHistory()
    --请求历届擂主信息
    showLoading()
    TFDirector:send(c2s.CONTEST_HISTORY_ALL_LEI_ZHU_REQUEST, {})
end
function KingOfWarManager:onAllContestHistoryMsg( event )
    hideLoading()
    self.allLastHistoryInfo = event.data
    TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateAllLastHistoryMsg, {})
end
function KingOfWarManager:getAllChampionTeamInfo()
    --获取历届擂主队伍信息    
    return self.allLastHistoryInfo
end
function KingOfWarManager:getMyTeamRank()
    --获取我的队伍的最后排名
    if (self.lastHistoryInfo) then
        return self.lastHistoryInfo.myRank or 0
    end
    return 0
end

--Remark: 队伍邀请
function KingOfWarManager:onContestInvitationMsg( event )
    --获取邀请信息记录 将其显示到队伍聊天 服务器推送
    local infos = event.data.infos or {}
    print("infos = ",infos)
    for k,v in pairs(infos) do
        --跟聊天信息统一
        v.chatType          = EnumChatType.Team_KingOfWar
        v.content           = ""
        v.roleId            = v.icon
        v.vipLevel          = v.vip
        v.timestamp         = v.createTime
        v.invitationGuilds  = {}
        self.invitationHistory:pushBack(v)
    end
    if self:checkIsInTeam() == false then
        self.teamRedState = true
        TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateInvitationMsg, {})
    end
end
function KingOfWarManager:deleteInvitationMsg(teamId)
    --根据teamId删除邀请相应的组队记录
    for v in self.invitationHistory:iterator() do
        if v.teamId == teamId then
            self.invitationHistory:removeObject(v)
            break
        end
    end
end
function KingOfWarManager:requestJoinTeamByInvitation(teamId, joinType)
    --对邀请记录操作请求服务器 joinType:0接受 1拒绝
    showLoading()
    local msg = {
        teamId,
        joinType
    }
    -- print("msg = ",msg)
    self:enableOpenMainLayerSet(true)
    self.requestJoinTeamByInvitationMsg = msg
    TFDirector:send(c2s.CONTEST_TEAM_JOIN_REQUEST, msg)
end
function KingOfWarManager:onRefuseSuccessMsg(event)
    --服务器反馈拒绝邀请成功
    hideLoading()
    local teamId = self.requestJoinTeamByInvitationMsg[1]
    self:deleteInvitationMsg(teamId)
    self.requestJoinTeamByInvitationMsg = nil
    TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateInvitationMsg, {})
end
function KingOfWarManager:getRefuseSuccessMsg()
    --获取邀请信息列表
    return self.invitationHistory
end
function KingOfWarManager:getTeamChatMsg()
    --获取队伍聊天信息列表
    return self.teamChatList
end
function KingOfWarManager:checkNeedViewTeamBtn()
    if self:checkIsInTeam() then
        return true
    end
    local list = self:getRefuseSuccessMsg()
    if list:length() >= 1 then
        return true
    end
    return false
end


--Remark: 队伍聊天
function KingOfWarManager:onContestTeamChatMsg(event)
    --队伍聊天信息 服务器推送
    --self.invitationHistory:clear()
    hideLoading()
    local chat = event.data.chat or {}
    local newChat = nil
    for k,v in pairs(chat) do
        --跟聊天信息统一
        v.chatType          = EnumChatType.Team_KingOfWar
        v.content           = v.content
        v.roleId            = v.useIcon
        v.competence        = 0
        v.invitationGuilds  = 0
        v.icon              = v.useIcon
        v.quality           = 0
        v.timestamp         = v.chatTime
        v.headPicFrame      = v.frameId
        newChat = v
        self.teamChatList:pushBack(v)
    end
    if newChat.playerId ~= MainPlayer:getPlayerId() and self:checkIsInTeam() then
        self.teamRedState = true
    end       

    TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateNewChatMsg, {})
end
function KingOfWarManager:sendTeamChatMsg(teamId, message)
    --发送队伍聊天信息
    showLoading()
    local msg = {
        teamId,
        message
    }
    -- print("msg = ",msg)
    TFDirector:send(c2s.CONTEST_TEAM_CHAT_REQUEST, msg)
end
function KingOfWarManager:getTeamChatList()
    return self.teamChatList
end


--Remark:鼓舞
function KingOfWarManager:requestInspireTeam(teamId, playerId, sycee)
    showLoading()
    local msg = {
        teamId,
        playerId,
        sycee
    }
    TFDirector:send(c2s.CONTEST_TEAM_INSPIRE_REQUEST,msg)
end

--队伍聊天红点
function KingOfWarManager:getTeamChatRedState()
    return self.teamRedState
end

function KingOfWarManager:setTeamChatRedState(isRed)
    self.teamRedState = isRed
end

function KingOfWarManager:showTime( timer )
    local str = ""
    local hour = math.floor(timer/3600)
    timer = timer - 3600*hour
    local min = math.floor(timer/60)
    timer = timer - 60*min
    local sec = timer
        
    hour = string.format("%02d",hour)
    min = string.format("%02d",min)
    sec = string.format("%02d",sec)
    
    str = hour .. ":" .. min .. ":" .. sec
    return str
end

function KingOfWarManager:showTimeWithOutHour( timer )
    local str = ""
    local min = math.floor(timer/60)
    timer = timer - 60*min
    local sec = timer
        
    min = string.format("%02d",min)
    sec = string.format("%02d",sec)
    
    str = min .. ":" .. sec
    return str
end

function KingOfWarManager:setFightVideoPlayed(videoId)
    self.fightVideoList[videoId] = true
end

function KingOfWarManager:checkFightVideoPlayed(videoId)
    if videoId == nil then
        return false
    end
    if self.fightVideoList[videoId] then
        return true
    else
        return false
    end
end


function KingOfWarManager:setFightReplayHistory(replayId)
    self.replayIdHistory[replayId] = true
end

function KingOfWarManager:getFightReplayHistoryState(replayId)
    print("replayId = ",replayId)
    print("self.replayIdHistory[replayId] = ",self.replayIdHistory[replayId])
    return self.replayIdHistory[replayId]
end

function KingOfWarManager:checkNeedShowSkip()
    return self.showSkipInFight
end

function KingOfWarManager:setNeedShowSkip(flag)
    self.showSkipInFight = flag
end

function KingOfWarManager:onRedPacketMsg(event)
    local data = event.data
    if data then
        self.redPacketList:pushBack(data)
        TFDirector:dispatchGlobalEventWith(KingOfWarManager.UpdateRedPacketMsg,{})
    end
end

function KingOfWarManager:requestRedPacket()
    local data = self.redPacketList:popBack()
    if data then
        showLoading()
        TFDirector:send(c2s.CONTEST_RED_PACKET_REQUEST, {data.id})
    end
end

function KingOfWarManager:checkRedPacketState(layer)
    if self.redPacketList:length() <= 0 then
        return
    end
    local topLayer = PlayerGuideManager:getTopLayer()
    if topLayer == layer then
        local data = self.redPacketList:back()
        local redlayer = require("lua.logic.kingofwar.KingWarRedPackLayer"):new(data)
        AlertManager:addLayer(redlayer,AlertManager.BLOCK,AlertManager.TWEEN_NONE)
        AlertManager:show()  
    end
end

function KingOfWarManager:checkIsInMyTeamByPlayerID(playerId)
    if self.myTeamInfo and self.myTeamInfo.team then
        local member = self.myTeamInfo.team.member or {}
        for k,v in pairs(member) do
            if v.playerId == playerId then
                return true
            end
        end
    end
    return false
end

function KingOfWarManager:getLastleiZhuTeamId()
    if self.myTeamInfo and self.myTeamInfo.leiZhuTeamId then
        return self.myTeamInfo.leiZhuTeamId
    end
    return nil
end

function KingOfWarManager:requestOtherContestTeam( teamId, serverId )
    showLoading()
    TFDirector:send(c2s.OTHER_CONTEST_TEAM_REQUEST, {teamId, serverId})
end

function KingOfWarManager:onOtherContestTeamResponse( event )
    hideLoading()
    self.otherTeamInfo = event.data
    TFDirector:dispatchGlobalEventWith(KingOfWarManager.OtherContestTeamMsg, {event.data.team})
end

--请求宝箱消息
function KingOfWarManager:sendrequestBetRate()
    showLoading()
    TFDirector:send(c2s.REQUEST_WIN_COUNT,{})
end
function KingOfWarManager:requestWinCount(event)
    print(">>>>>>>>>>>>>>>>>",event)
    hideLoading()
    self.winCount = event.data.winCount
    self.winStreak = event.data.winStreak
    self.boxes = event.data.boxes
    TFDirector:dispatchGlobalEventWith(KingOfWarManager.REPONSE_WIN_COUNT, {})
end

function KingOfWarManager:openBox(index)
    local box_id = self.boxes[index-4] or 0
    local boxInfo = ChampionsBoxData:objectByID(index*1000 + box_id)
    if boxInfo == nil then
        -- toastMessage("你已领取所有宝箱")
        toastMessage(localizable.ZhengbaManager_get_all_box)
        return
    end
    if index == 5 then
        if  self.winCount < boxInfo.value then
            self:openBoxInfo(boxInfo, stringUtils.format(localizable.KIngOfWarManager_shengli_ing, boxInfo.value))
            return
        end
    elseif index == 6 then
        if  self.winStreak < boxInfo.value then
            self:openBoxInfo(boxInfo, stringUtils.format(localizable.KIngOfWarManager_liansheng_ing, boxInfo.value))
            return
        end
    end
    ZhengbaManager.tempBoxIndex = index
    showLoading()
    TFDirector:send(c2s.OPEN_BOX, {index})
    --self:sendrequestBetRate()
end

function KingOfWarManager:openBoxInfo( boxInfo ,message)
    local calculateRewardList = self:calculateReward(boxInfo.drop_id)
    if calculateRewardList == nil then
        return
    end
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.zhengba.ZhengbasaiBox",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);
    layer:loadData(calculateRewardList, message);
    AlertManager:show();
end
function KingOfWarManager:calculateReward(rewardid)

    local calculateRewardList = TFArray:new();
    local rewardConfigure = RewardConfigureData:objectByID(rewardid)
    if rewardConfigure == nil then
        print("找不到奖励配置 id == ",rewardid)
        return nil
    end
    local rewardItems = rewardConfigure:getReward()


    for k,v in pairs(rewardItems.m_list) do
        local rewardInfo = {}
        rewardInfo.type = v.type
        rewardInfo.itemId = v.itemid
        rewardInfo.number = v.number
        local _rewardInfo = BaseDataManager:getReward(rewardInfo)
        calculateRewardList:push(_rewardInfo);
    end

    return calculateRewardList
end

return KingOfWarManager:new()