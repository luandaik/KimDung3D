-- client side CrossGuildBattleManager.lua
--[[
 * @Description: 跨服帮派争锋
 ]]
-- script writer Stephen.tao
-- creation time 2016-05-20


local CrossGuildBattleManager = class("CrossGuildBattleManager")

CrossGuildBattleManager.ActivityState_0 = 0--活动未开启
CrossGuildBattleManager.ActivityState_1 = 1--预选阶段
CrossGuildBattleManager.ActivityState_2 = 2--报名阶段
CrossGuildBattleManager.ActivityState_3 = 3--战斗阶段
CrossGuildBattleManager.ActivityState_4 = 4--展示阶段
-- CrossGuildBattleManager.ActivityState_5 = 5--展示阶段

CrossGuildBattleManager.CityBattleSimpleInfoNotice = "CrossGuildBattleManager.CityBattleSimpleInfoNotice"
CrossGuildBattleManager.GuildBattleCurrentStateNotice = "CrossGuildBattleManager.GuildBattleCurrentStateNotice"
CrossGuildBattleManager.PreviousCrossInfoNotice = "CrossGuildBattleManager.PreviousCrossInfoNotice"
CrossGuildBattleManager.guildMemberUpdate = "CrossGuildBattleManager.guildMemberUpdate"


function CrossGuildBattleManager:ctor(data)
	--当前状态
    TFDirector:addProto(s2c.GUILD_BATTLE_CURRENT_STATE, self, self.onReciveGuildBattleCurrentState)
	--城市对战简单信息
    TFDirector:addProto(s2c.CITY_BATTLE_SIMPLE_INFO, self, self.onReciveCityBattleSimpleInfo)
    --公会录像信息
    TFDirector:addProto(s2c.CROSS_GUILD_BATTLE_REPLAY_INFOS, self, self.onReciveCrossGuildBattleReplayInfos)
    --城市对战信息
    TFDirector:addProto(s2c.CITY_BATTLE_INFOS, self, self.onReciveCityBattleInfos)
    --城市信息
    TFDirector:addProto(s2c.CITY_INFO, self, self.onReciveCityInfo)
    --资格赛信息
    TFDirector:addProto(s2c.QUALIFYING_INFO_LIST, self, self.onReciveQualifyingInfoList)
    --地图报名简单信息
    TFDirector:addProto(s2c.APPLY_SIMPLE_INFO, self, self.onReciveApplySimpleInfo)
    --获得上一次冠军
    TFDirector:addProto(s2c.LAST_RANK_INFO, self, self.onReciveLastRankInfoMsg)
    --取消申请
    TFDirector:addProto(s2c.UNAPPLY_CROSS_SUCESS, self, self.onReciveUnapplyCrossSucess)
    --申请成功
    TFDirector:addProto(s2c.APPLY_CROSS_SUCESS, self, self.onReciveApplyCrossSucess)
    --公会的成员信息
    TFDirector:addProto(s2c.CROSS_GUILD_BATTLE_MEMBER_INFO, self, self.onReciveCrossGuildBattleMemberInfo)
	--修改精英
    TFDirector:addProto(s2c.UPDATE_CROSS_ELITE_SUCESS, self, self.onReciveUpdateCrossEliteSucess)
    --修改城市成功
    TFDirector:addProto(s2c.UPDATE_CITY_SUCESS, self, self.onReciveUpdateCitySucess)
    --所有公会排名
    TFDirector:addProto(s2c.ALL_CITY_INFO, self, self.onReciveAllCityInfo)
    --公会战战斗信息
    TFDirector:addProto(s2c.CROSS_GUILD_BATTLE_WAR_INFOS, self, self.onReciveGuildBattleWarInfosMsg)



    self:restart()


    self.switchLayerTime = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_2").value
end

function CrossGuildBattleManager:restart()
    self.cityBattleSimpleInfo = {} --城市对战简单信息
    self.cityBattleInfos = {}       --城市对战信息
    self.cityInfo = {}              --城市信息
    self.qualifyingInfoList = nil    --资格赛信息

    self.previousCrossInfo = {}     --上次跨服战信息
    self.fightDetailInfo = {} -- 对战详细信息
    self.atkMemberInfo = {} --对战攻击方成员信息
    self.defMemberInfo = {} --对战防守方成员信息
    self.applySimpleInfo = {} --地图报名简单信息


    self.atkGuildInfo = {} --攻击方帮派信息
    self.defGuildInfo = {} --防守方帮派信息

    self.guildMemberList = {} --公会战报名的成员信息
    self.guildLeaderList = {} --公会战精英信息

    self.state = 0
    self.index = 0
end

--当前状态
function CrossGuildBattleManager:onReciveGuildBattleCurrentState( event )
    local data = event.data
    -- print("onReciveGuildBattleCurrentState data=",data)
    self.state = data.state
    TFDirector:dispatchGlobalEventWith(CrossGuildBattleManager.GuildBattleCurrentStateNotice)
end

function CrossGuildBattleManager:getActivityState()
    return self.state
end

function CrossGuildBattleManager:gainCityBattleSimpleInfo()
    showLoading()
    TFDirector:send(c2s.GAIN_CITY_BATTLE_SIMPLE_INFO,{})
end

--城市对战简单信息
function CrossGuildBattleManager:onReciveCityBattleSimpleInfo( event )
    hideLoading()
    local data = event.data
    -- print("onReciveCityBattleSimpleInfo data=",data)
    self.cityBattleSimpleInfo = data

    -- if data.simpleInfos == nil then
    --     return
    -- end
    -- for i=1,#data.simpleInfos do
    --     local simpleInfos = data.simpleInfos[i]
    --     local cityInfoList = TFArray:new()
    --     if simpleInfos.infos then
    --         for j=1,#simpleInfos.infos do
    --             --[[
    --             message CrossGuildInfo{
    --                 required int32 guildId = 1; //公会编号
    --                 required string guildName = 2;//公会名称
    --                 required string bannerId = 3;//公会旗帜
    --                 required string serverName = 4;//服务器名称
    --                 required int32 score=5;//积分
    --                 required int32 winCount=6;//胜场
    --                 required int32 lostCount=7;//负场
    --                 required int32 cityId = 8;
    --             }
    --             ]]
    --             local infos = clone(simpleInfos.infos[j])
    --             if infos.cityId == simpleInfos.cityId then
    --                 cityInfoList:pushBack(infos)
    --             end
    --         end
    --     end
    --     self.cityBattleSimpleInfo[simpleInfos.cityId] = cityInfoList
    -- end
    -- TFDirector:dispatchGlobalEventWith(CrossGuildBattleManager.CityBattleSimpleInfoNotice)
    local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightMapLayer")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightMapLayer")
        layer:showCrossFightInfo()
        AlertManager:show()
        if self.cityBattleSimpleInfo.cityId then
            self:gainCityBattleInfos(self.cityBattleSimpleInfo.cityId)
        end
        return
    end
    layer:showCrossFightInfo()
end

function CrossGuildBattleManager:getCityBattleSimpleInfoByCityId(cityId)
    -- print("===========getCityBattleSimpleInfoByCityId=====>>",cityId,self.cityBattleSimpleInfo)
    if self.cityBattleSimpleInfo and self.cityBattleSimpleInfo.simpleInfos then
        for i=1,#self.cityBattleSimpleInfo.simpleInfos do
            local fightInfo = self.cityBattleSimpleInfo.simpleInfos[i]
            if fightInfo.cityId == cityId then
                return fightInfo
            end
        end
    end
    return nil
end

-- 公会录像信息
-- c2s.GAIN_CROSS_GUILD_BATTLE_REPLAY_INFOS
function CrossGuildBattleManager:sendGainCrossGuildBattleReplayInfos(warId)
    if self.guildBattleWarInfos == nil or self.guildBattleWarInfos.all == nil then
        return
    end
    for i=1,#self.guildBattleWarInfos.all do
        local warInfo = self.guildBattleWarInfos.all[i]
        if warInfo.warId == warId then
            local atkInfo = self:getGuildInfoInCityBattleInfoById( warInfo.atkGuildId )
            self.atkGuildInfo = {}
            if atkInfo then
                self.atkGuildInfo.bannerId = atkInfo.bannerId
                self.atkGuildInfo.name = atkInfo.guildName
                self.atkGuildInfo.peakAddition = warInfo.atkPeakAddition
            end
            local defInfo = self:getGuildInfoInCityBattleInfoById( warInfo.defGuildId )
            self.defGuildInfo = {}
            if defInfo then
                self.defGuildInfo.bannerId = defInfo.bannerId
                self.defGuildInfo.name = defInfo.guildName
                self.defGuildInfo.peakAddition = warInfo.defPeakAddition
            end
            showLoading()
            TFDirector:send(c2s.GAIN_CROSS_GUILD_BATTLE_REPLAY_INFOS, { warId })
        end
    end

end
--公会录像信息

function CrossGuildBattleManager:onReciveCrossGuildBattleReplayInfos( event )
    hideLoading()
    -- print("onReciveCrossGuildBattleReplayInfos==>>>>>>",event.data)
    self.replayInfos = event.data
    self:resetFightRecordInfo(event.data)

    local layer = require("lua.logic.crossGuildBattle.CrossFightRecordNew"):new()
    layer:setFightRound(1)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end


function CrossGuildBattleManager:setGuildDataInfo(atkInfo, defInfo)
    self.atkGuildInfo = atkInfo
    self.defGuildInfo = defInfo
end

function CrossGuildBattleManager:getGuildDataInfo()
    --[[
        atkGuildInfo
        --bannerId
        --name
    ]]
    return self.atkGuildInfo,self.defGuildInfo
end

function CrossGuildBattleManager:resetFightRecordInfo(eventData)

    print('eventDataeventDataeventData = ',eventData)
    
    local memberInfo = eventData.atkGuildTeamInfos or {}
    self.atkMemberInfo = {}
    self.defMemberInfo = {}
    for i=1,6 do
        local data = memberInfo[i] or {}
        local member = data.battleInfo or {}
        if i <= 3 then
            self.atkMemberInfo[i] = {}
        else
            self.defMemberInfo[i-3] = {}
        end

        for k,v in pairs(member) do
            if v.playerId ~= 0 then
                local details = {}
                details = clone(v)
                details.isLeader = false
                if (data.eliteId and data.eliteId ~= 0) and (data.eliteId == v.playerId) then
                    details.isLeader = true
                end

                if i <= 3 then
                    -- if details.isLeader then
                        -- table.insert(self.atkMemberInfo[i], 1, details)
                    -- else    
                        table.insert(self.atkMemberInfo[i], details)
                    -- end
                else
                    -- if details.isLeader then
                    --     table.insert(self.defMemberInfo[i-3], 1, details)
                    -- else    
                        table.insert(self.defMemberInfo[i-3], details)
                    -- end
                end
            end
        end
    end

    local fightInfo = eventData.replays or {}
    self.fightDetailInfo = {}
    for i=1,3 do
        self.fightDetailInfo[i] = {}
    end
    for k,v in pairs(fightInfo) do
        local teamIndex = v.team + 1
        -- print('teamIndex = ',teamIndex)
        local addIndex = #self.fightDetailInfo[teamIndex] + 1
        self.fightDetailInfo[teamIndex][addIndex] = {}
        self.fightDetailInfo[teamIndex][addIndex] = clone(v)
    end
    local function sortBySence(v1,v2)
        return v1.index < v2.index
    end
    for i=1,3 do
        table.sort(self.fightDetailInfo[i], sortBySence)
    end
end

function CrossGuildBattleManager:getStateByTeamIndex(teamIndex)

    -- 根据teamIndex判断这个小队的战斗状态
    
    local isEnd = true

    local currFightIndex = #self.fightDetailInfo[teamIndex]  

    return isEnd,currFightIndex
end

function CrossGuildBattleManager:getTeamInfoByIndex( teamIndex )
    return self.fightDetailInfo[teamIndex]
end

function CrossGuildBattleManager:getDefMemberInfo(teamIndex)
    return self.defMemberInfo[teamIndex]
end

function CrossGuildBattleManager:getAtkMemberInfo(teamIndex)
    return self.atkMemberInfo[teamIndex]
end

--城市对战信息
function CrossGuildBattleManager:gainCityBattleInfos(cityId)
    showLoading()
    self.getCityInfoId = cityId
    TFDirector:send(c2s.GAIN_CITY_BATTLE_INFOS,{cityId})
end

--城市对战信息
function CrossGuildBattleManager:onReciveCityBattleInfos( event )
    hideLoading()
    local data = event.data
    -- print("onReciveCityBattleInfos self.getCityInfoId=",self.getCityInfoId)
    -- print("onReciveCityBattleInfos data=",data)
    self.cityBattleInfos = {}
    self.cityBattleInfos.guildList = {}
    local rankInfosList = TFArray:new()
    if data.rankInfos then
        for i=1,#data.rankInfos do
            local rankInfos = data.rankInfos[i]
            if rankInfos.cityId == self.getCityInfoId then
                rankInfosList:pushBack(clone(rankInfos))
            end
            self.cityBattleInfos.guildList[rankInfos.guildId] = rankInfos
        end
    end
    local function sortByScore( v1,v2 )
        if v1.score > v2.score then
            return true
        elseif v1.score == v2.score then
            if v1.guildId < v2.guildId then
                return  true
            end
        else
            return false
        end
        return false
    end
    rankInfosList:sort(sortByScore)
    self.cityBattleInfos.rankInfos = rankInfosList
    self.cityBattleInfos.battleQueue = data.battleQueue or {}
    self.cityBattleInfos.updateCount = data.updateCount or 1

    -- print("self.cityBattleInfos = ",self.cityBattleInfos)
    local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightMessage")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightMessage")
        layer:setCityId(self.getCityInfoId)
        AlertManager:show()
        return
    end
    layer:setCityId(self.getCityInfoId)
end

function CrossGuildBattleManager:getGuildInfoInCityBattleInfoById( guildId )
    if self.cityBattleInfos and self.cityBattleInfos.guildList then
        return self.cityBattleInfos.guildList[guildId]
    end
    return nil
end

--城市信息
function CrossGuildBattleManager:gainCityInfo(cityId)
    showLoading()
    self.getCityInfoId = cityId
    TFDirector:send(c2s.GAIN_CITY_INFO,{cityId})
end

--城市信息
function CrossGuildBattleManager:onReciveCityInfo( event )    
    hideLoading()
    local data = event.data
    -- print("onReciveCityInfo data=",data)
    self.cityInfo = {}
    self.cityInfo = data
    -- if data.infos then
    -- end
    local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightGuildSignUp")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightGuildSignUp")
        layer:setCityId(self.getCityInfoId)
        AlertManager:show()
        return
    end
    layer:setCityId(self.getCityInfoId)
end

--获得资格赛信息
function CrossGuildBattleManager:gainQualifyingInfoList()
    showLoading()
    TFDirector:send(c2s.GAIN_QUALIFYING_INFO_LIST,{})
end

function CrossGuildBattleManager:onReciveQualifyingInfoList( event )
    hideLoading()
    local data = event.data
    -- print("onReciveQualifyingInfoList data=",data)
    self.qualifyingInfoList = {}
    if data.infos then
        self.qualifyingInfoList = data.infos
    end

    if self.state ~= CrossGuildBattleManager.ActivityState_1 then
        return
    end
    local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightMainLayer")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightMainLayer")
        layer:showCrossFightInfo()
        AlertManager:show()
        return
    end
    layer:showCrossFightInfo()
end

function CrossGuildBattleManager:getApplySimpleInfoByCityId( cityId )
    if self.applySimpleInfo and self.applySimpleInfo.infos then
        for i=1,#self.applySimpleInfo.infos do
            local applyInfo = self.applySimpleInfo.infos[i]
            if applyInfo and applyInfo.infos then
                if applyInfo.infos.cityId == cityId then
                    return applyInfo
                end
            end
        end
    end
    return nil
end

--申请地图报名简单信息
function CrossGuildBattleManager:gainApplySimpleInfo()
    showLoading()
    TFDirector:send(c2s.GAIN_APPLY_SIMPLE_INFO,{})
end
--地图报名简单信息
function CrossGuildBattleManager:onReciveApplySimpleInfo( event )
    hideLoading()
    -- print("ApplySimpleInfo ===",event.data)
    self.applySimpleInfo = {}
    self.applySimpleInfo = event.data

    local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightMapLayer")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightMapLayer")
        layer:showCrossFightInfo()
        AlertManager:show()
        return
    end
    layer:showCrossFightInfo()
end

function CrossGuildBattleManager:isCanApply()
    if self.state == CrossGuildBattleManager.ActivityState_3 then
        return true
    end
    if self.qualifyingInfoList then
        for i=1,#self.qualifyingInfoList do
            if self.qualifyingInfoList[i].guildInfo.guildId == FactionManager.personalInfo.guildId then
                return true
            end
        end
    end
    return false
end
function CrossGuildBattleManager:isCanApplyInState3()
    if self.qualifyingInfoList then
        for i=1,#self.qualifyingInfoList do
            if self.qualifyingInfoList[i].guildInfo.guildId == FactionManager.personalInfo.guildId then
                return true
            end
        end
        return false
    end
    return true
end

--获得上一次冠军
function CrossGuildBattleManager:gainLastRankInfo(isShow)
    showLoading()
    self.showPreviousCrossInfo = isShow
    TFDirector:send(c2s.GAIN_LAST_RANK_INFO,{})
end

function CrossGuildBattleManager:onReciveLastRankInfoMsg( event )
    hideLoading()
    local data = event.data
    --print("onReciveLastRankInfoMsg",data)
    self.previousCrossInfo = data
    if self.showPreviousCrossInfo == true then
        local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightMainLayer")
        if layer == nil then
            layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightMainLayer")
            layer:showCrossFightInfo()
            AlertManager:show()
            return
        else
            layer:showCrossFightInfo()
        end
        
    else
        TFDirector:dispatchGlobalEventWith(CrossGuildBattleManager.PreviousCrossInfoNotice)
    end
end

function CrossGuildBattleManager:getPreviousCrossInfo()
    return self.previousCrossInfo
end

--打开主界面
function CrossGuildBattleManager:openCurrLayer(isclose)
    if FactionManager:isJoinFaction() == false then
        toastMessage(localizable.FactionFightManager_join_before)
        return
    end

    if isclose then
        layerClose = AlertManager:getLayerByName("lua.logic.activity.WulinLayer")
        if layerClose then
            AlertManager:closeAllBeforLayer(layerClose)
        end
    end
    if self.state == CrossGuildBattleManager.ActivityState_1 then
        self:openYuXuanLayer()
    elseif self.state == CrossGuildBattleManager.ActivityState_2 then
        self:openApplyLayer()
    elseif self.state == CrossGuildBattleManager.ActivityState_3 then
        self:openFightLayer()
    elseif self.state == CrossGuildBattleManager.ActivityState_4 then
        self:openShowWinerLayer()
    end
end

function CrossGuildBattleManager:openYuXuanLayer()
    if self.qualifyingInfoList == nil then
        self:gainQualifyingInfoList()
        return
    end
    local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightMainLayer")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightMainLayer")
        layer:showCrossFightInfo()
        AlertManager:show()
        return
    end
    layer:showCrossFightInfo()
end



function CrossGuildBattleManager:openApplyLayer()
    if self.qualifyingInfoList == nil then
        self:gainQualifyingInfoList()
        -- return
    end
    self:gainApplySimpleInfo()
end
function CrossGuildBattleManager:openFightLayer()
    if self.qualifyingInfoList == nil then
        self:gainQualifyingInfoList()
    end
    self:gainCityBattleSimpleInfo()
end

function CrossGuildBattleManager:openShowWinerLayer()
    if self.previousCrossInfo == nil then
        self:gainLastRankInfo(true)
        return
    end
    local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightMainLayer")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightMainLayer")
        layer:showCrossFightInfo()
        AlertManager:show()
        return
    end
    layer:showCrossFightInfo()
end

function CrossGuildBattleManager:btnArmyClick()
    ZhengbaManager:openArmyLayer(EnumFightStrategyType.StrategyType_CHAMPIONS_DEF)
end

function CrossGuildBattleManager:openRuleLayer()
    CommonManager:showRuleLyaer('kuafubangpaizhenfeng')
end
function CrossGuildBattleManager:openRewardLayer()
    local layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightRewardLayer")
    layer:setReward(6)
    AlertManager:show()
end


function CrossGuildBattleManager:getCurrSecond()
    local date = GetCorrectDate("*t", MainPlayer:getNowtime())
    if date.wday == 1 then
        date.wday = 8
    end
    local wday = date.wday - 2
    local nowTime = wday*(24*60*60) + (date.hour*60 + date.min)*60 + date.sec
    return nowTime
end
function CrossGuildBattleManager:getSwitchLayerTime()
    return self.switchLayerTime
end


--apply 
function CrossGuildBattleManager:applyCrossGuildBattle(index)
    if self.state ~= CrossGuildBattleManager.ActivityState_2 then
        toastMessage(localizable.CrossFightBattle_Not_Apply_Time)
    else
        if self.guildMemberList and self.guildMemberList[index+1] and #self.guildMemberList[index+1] < 10 then
            showLoading()
            TFDirector:send(c2s.APPLY_CROSS_GUILD_BATTLE,{index})
        else
            toastMessage(localizable.Guild_War_No_Position)
        end
    end
end
--apply success
function CrossGuildBattleManager:onReciveApplyCrossSucess( event )
    hideLoading()
    self:queryCrossGuildBattleMemberInfo()
end


--cancel apply
function CrossGuildBattleManager:unapplyCrossGuildBattle()

    if self.state ~= CrossGuildBattleManager.ActivityState_2 then
        toastMessage(localizable.CrossFightBattle_Not_Apply_Time)
    else
       showLoading()
        TFDirector:send(c2s.UNAPPLY_CROSS_GUILD_BATTLE,{}) 
    end
end
--取消申请
function CrossGuildBattleManager:onReciveUnapplyCrossSucess( event )
    hideLoading()
    self:queryCrossGuildBattleMemberInfo()
end



function CrossGuildBattleManager:getLeaderDataByIndex(index)
    
    return self.guildLeaderList[index]
end

function CrossGuildBattleManager:getMemberDataByIndex(index)
    return self.guildMemberList[index]
end



--[[
    获取本帮派的成员报名信息
]]
function CrossGuildBattleManager:queryCrossGuildBattleMemberInfo()
    showLoading()
    TFDirector:send(c2s.QUERY_CROSS_GUILD_BATTLE_MEMBER_INFO,{})
end

function CrossGuildBattleManager:onReciveCrossGuildBattleMemberInfo( event )
    for i=1,3 do
        self.guildMemberList[i] = {}
        self.guildLeaderList[i] = {}
        local info = event.data.infos[i] or {}
        local memberInfo = info.battleInfo or {}
        for k,v in pairs(memberInfo) do
            if v.playerId ~= 0 then
                local data = {}
                data.playerId = v.playerId
                data.profession = v.profession
                data.playerName = v.name
                data.power = v.power
                data.headPicFrame = v.headPicFrame
                table.insert(self.guildMemberList[i], data)
                if v.playerId == info.eliteId then
                    self.guildLeaderList[i].playerId = v.playerId
                    self.guildLeaderList[i].profession = v.profession
                    self.guildLeaderList[i].playerName = v.name
                    self.guildLeaderList[i].power = v.power
                    self.guildLeaderList[i].headPicFrame = v.headPicFrame
                end
            end
        end
    end

    TFDirector:dispatchGlobalEventWith(CrossGuildBattleManager.guildMemberUpdate)
    hideLoading()
end

function CrossGuildBattleManager:isApplyTime()
    local time_3 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_Wait").value
    local currTime = CrossGuildBattleManager:getCurrSecond()
    if self.state == CrossGuildBattleManager.ActivityState_3 then
        local time_1 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_1").value
        local time_2 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_2").value
        if (currTime >= time_1 and currTime <= time_3) or currTime >=time_2 then
            return false
        end
        return true
    end
    local time_1 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_2").value
    local time_2 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Apply_End_1").value

    local time_4 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Apply_End_2").value
    if (currTime >= time_1 and currTime <= time_2) or (currTime >= time_3 and currTime <= time_4) then
        return true
    end
    return false
end

--修改城市
function CrossGuildBattleManager:updateCity( cityId )
    if self:isCanApply() == false then
        toastMessage(localizable.faction_no_levelup)
        return
    end
    if self:isApplyTime() == false then
        toastMessage(localizable.CrossFightBattle_ApplyOutTime)
        return
    end
    if self.applySimpleInfo and self.applySimpleInfo.cityId then
        if self.applySimpleInfo.cityId == cityId then
            toastMessage(localizable.CrossFightBattle_HasApply)
            return
        end
    end

    if self.state == CrossGuildBattleManager.ActivityState_3 then
        local guildId = FactionManager.personalInfo.guildId
        local guildInfo = self:getGuildInfoInCityBattleInfoById(guildId)
        if guildInfo and guildInfo.cityId == cityId  then
            toastMessage(localizable.CrossFightBattle_HasApply)
            return
        end
    end
    if FactionManager:getPostInFaction() == 3 then
        toastMessage(localizable.common_no_power)
        return
    end

    showLoading()
    self.tempCityId = cityId
    TFDirector:send(c2s.UPDATE_CITY,{cityId})
end

function CrossGuildBattleManager:onReciveUpdateCitySucess( event )
    hideLoading()
    if self.tempCityId then
        local cityInfo = CrossGuildBattleCityData:objectByID(self.tempCityId)
        toastMessage(stringUtils.format(localizable.CrossFightBattle_ApplySuccess,cityInfo.name))
        if self.state == CrossGuildBattleManager.ActivityState_2 then
            self:gainCityInfo(self.tempCityId)
            self:gainApplySimpleInfo()
        elseif self.state == CrossGuildBattleManager.ActivityState_3 then
            self:gainCityBattleInfos(self.tempCityId)
            self.tempCityId = nil
            return
        end
    end
    if self.applySimpleInfo and self.tempCityId then
        self.applySimpleInfo.cityId = self.tempCityId
        self.tempCityId = nil
    end
end

--[[
    修改精英成员
]]
function CrossGuildBattleManager:updateEliteCrossGuildBattle(index, playerId)
    if self.state ~= CrossGuildBattleManager.ActivityState_2 then
        toastMessage(localizable.CrossFightBattle_Not_Apply_Time)
    else
        showLoading()
        TFDirector:send(c2s.UPDATE_ELITE_CROSS_GUILD_BATTLE,{index, playerId})
    end
end

function CrossGuildBattleManager:onReciveUpdateCrossEliteSucess( event )
    if event.data.sucess then
        --修改精英成功
    else
        --修改精英失败
        if self.state ~= CrossGuildBattleManager.ActivityState_2 then
            toastMessage(localizable.CrossFightBattle_Not_Apply_Time)
        else
            toastMessage(TFLanguageManager:getString(ErrorCodeData.Guild_War_No_Elite))
        end
    end
    hideLoading()
    self:queryCrossGuildBattleMemberInfo()
end

--未报名帮派成员列表
function CrossGuildBattleManager:getUnSignupMemberData()
    local allTemp = {}
    local allMembers = FactionManager:getMemberInfo()

    for i = 1, #allMembers do
        allTemp[i] = allMembers[i].playerId
    end

    local function deleteInTab(playerId)
        for i = #allTemp, 1, -1 do
            if playerId == allTemp[i] then
                table.remove(allTemp, i)
            end
        end
    end

    local leaderData = {}
    for i = 1, 3 do
        local temp = self:getLeaderDataByIndex(i) or {}
        table.insert(leaderData, temp)
    end
    local memberData = {}
    for i = 1, 3 do
        local temp = self:getMemberDataByIndex(i) or {}
        table.insert(memberData, temp)
    end

    local newMembers = {}
    for i = 1, #leaderData do
        for j = 1, #leaderData[i] do
            local data = leaderData[i][j]
            local playerId = data.playerId
            deleteInTab(playerId)
        end
    end

    for i = 1, #memberData do
        for j = 1, #memberData[i] do
            local data = memberData[i][j]
            local playerId = data.playerId
            deleteInTab(playerId)
        end
    end

    local function getFromTab(playerId)
        for i = 1, #allMembers do
            if allMembers[i].playerId == playerId then
                return allMembers[i]
            end
        end

        return nil
    end

    for i = 1, #allTemp do
        local playerId = allTemp[i]
        local temp = {}
        local tab = getFromTab(playerId)
        if tab then
            temp.playerId = tab.playerId
            temp.power = tab.power
            temp.headPicFrame = tab.headPicFrame
            temp.profession = tab.profession
            temp.playerName = tab.name
            table.insert(newMembers, temp)
        end
    end

    return newMembers
end
--排名信息
function CrossGuildBattleManager:gainAllCityInfo()
    showLoading()
    TFDirector:send(c2s.GAIN_ALL_CITY_INFO,{})    
end

function CrossGuildBattleManager:onReciveAllCityInfo( event )
    hideLoading()
    local data = event.data
    self.allCityInfo = {}
    -- local guildList = TFArray:new()
    -- if data.infos then
    --     for i=1,#data.infos do
    --         local guildInfo = data.infos[i]
    --         if guildInfo.guildId == FactionManager.personalInfo.guildId then
    --             self.allCityInfo.myGuildInfo = guildInfo
    --         end
    --         guildList:pushBack(guildInfo)
    --     end
    -- end

    local function sortByScore(v1,v2)
        if v1.score > v2.score then
            return true
        elseif v1.score == v2.score then
            if v1.guildId < v2.guildId then
                return  true
            end
        else
            return false
        end
        return false
    end

    self.allCityInfo.guildList = data.infos
    table.sort( self.allCityInfo.guildList, sortByScore )
    self.allCityInfo.myRank = 0
    for i=1,#self.allCityInfo.guildList do
        if self.allCityInfo.guildList[i].guildId == FactionManager.personalInfo.guildId then
            self.allCityInfo.myRank = i
            break
        end
    end

    local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightList")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightList")
        AlertManager:show()
        return
    end
    layer:freshUI()
end
--排名信息
function CrossGuildBattleManager:gainGuildBattleWarInfos(cityId)
    showLoading()
    TFDirector:send(c2s.GAIN_GUILD_BATTLE_WAR_INFOS,{cityId})    
end

function CrossGuildBattleManager:onReciveGuildBattleWarInfosMsg( event )
    hideLoading()
    local data = event.data
    -- print("onReciveGuildBattleWarInfosMsg = ",data)
    self.guildBattleWarInfos = {}
    self.guildBattleWarInfos.all = {}--data.battleInfos or {}
    self.guildBattleWarInfos.own = {}
    local nowTime = MainPlayer:getNowtime()
    if data.battleInfos then
        local myGuildId = FactionManager.personalInfo.guildId
        for i=1,#data.battleInfos do
            local battleInfo = data.battleInfos[i]
            if nowTime - math.floor(battleInfo.createTime/1000) > 60 then
                self.guildBattleWarInfos.all[#self.guildBattleWarInfos.all +1] = battleInfo
                if battleInfo.atkGuildId == myGuildId or battleInfo.defGuildId == myGuildId then
                    self.guildBattleWarInfos.own[#self.guildBattleWarInfos.own +1] = clone(battleInfo)
                end
            end
        end
    end

    local layer = AlertManager:getLayerByName("lua.logic.crossGuildBattle.CrossFightRecords")
    if layer == nil then
        layer = AlertManager:addLayerByFile("lua.logic.crossGuildBattle.CrossFightRecords")
        AlertManager:show()
        return
    end
    layer:freshUI()
end
return CrossGuildBattleManager:new()