-- client side GuildBossManager.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-04-12


local GuildBossManager = class("GuildBossManager")


GuildBossManager.RECEIVE_MAIN_INFO          = "GuildBossManager.RECEIVE_MAIN_INFO"

GuildBossManager.RECEIVE_CHOOSE_STAGE       = "GuildBossManager.RECEIVE_CHOOSE_STAGE"
GuildBossManager.RECEIVE_CHALLENGE_INFO     = "GuildBossManager.RECEIVE_CHALLENGE_INFO"
GuildBossManager.RECEIVE_RANK_INFO          = "GuildBossManager.RECEIVE_RANK_INFO"
GuildBossManager.RECEIVE_HURT_PUSH          = "GuildBossManager.RECEIVE_HURT_PUSH"
GuildBossManager.RECEIVE_BOSS_HELP_LIST     = "GuildBossManager.RECEIVE_BOSS_HELP_LIST"
GuildBossManager.RECEIVE_BOSS_HELP_ADD_OR_CUT    = "GuildBossManager.RECEIVE_BOSS_HELP_ADD_OR_CUT"
GuildBossManager.RECEIVE_BOSS_HURT_RANK    = "GuildBossManager.RECEIVE_BOSS_HURT_RANK"
GuildBossManager.RECEIVE_BOSS_ATTNUM_RANK    = "GuildBossManager.RECEIVE_BOSS_ATTNUM_RANK"
GuildBossManager.RECEIVE_ACTIVITY_STATE    = "GuildBossManager.RECEIVE_ACTIVITY_STATE"


GuildBossManager.ActivityState_0           = 0     --未开启
GuildBossManager.ActivityState_1           = 1     --展示阶段
GuildBossManager.ActivityState_2           = 2     --触发了boss未开启
GuildBossManager.ActivityState_3           = 3     --已开启

GuildBossManager.BossType_1                = 1     --首领
GuildBossManager.BossType_2                = 2     --左翼
GuildBossManager.BossType_3                = 3     --右翼
GuildBossManager.BossType_4                = 4     --中军

GuildBossManager.RankType_1                = 1     --排行榜
GuildBossManager.RankType_2                = 2     --首杀榜

local GuildBossData = require('lua.table.t_s_guild_boss')
local GuildBossBuffData = require('lua.table.t_s_guild_boss_buff')
local GuildBossStageData = require('lua.table.t_s_guild_boss_stage')
function GuildBossManager:ctor()

    TFDirector:addProto(s2c.GUILD_BOSS_RESPONSE, self, self.onReceiveMainInfo)

    TFDirector:addProto(s2c.GUILD_BOSS_STAGE_RESPONSE, self, self.onReceiveChooseStage)

    TFDirector:addProto(s2c.GUILD_BOSS_RANK_RESPONSE, self, self.onReceiveRankInfo)

    TFDirector:addProto(s2c.GUILD_BOSS_HELP_LIST_RESPONSE, self, self.onReceiveBossHelpList)

    TFDirector:addProto(s2c.GUILD_BOSS_HELP_RESPONSE, self, self.onReceiveaddOrCutBossHelp)

    TFDirector:addProto(s2c.GUILD_BOSS_PUSH_RESPONSE, self, self.onReceiveHurtPush)

    TFDirector:addProto(s2c.GUILD_BOSS_DAMAGE_RANK_RESPONSE, self, self.onReceiveHurtRank)  

    --攻击次数
    TFDirector:addProto(s2c.GUILD_BOSS_ATTACK_RANK_RESPONSE, self, self.onReceiveAttNumRank)  

    TFDirector:addProto(s2c.GUILD_BOSS_STATUS, self, self.onReceiveActivityState)  

    self:restart()
end


function GuildBossManager:restart()
    self.myRank = {}
    self.rankList = {}
    self.activityState = 0
    self.lastChallengeTime = 0
    self.BossHelpList={}
    self.hurtRank={}
    self.isRedShow = true
    for i=1,4 do
        self.BossHelpList[i]={} 
    end
end

function GuildBossManager:requestMainInfo(isShow)
    showLoading()
    self.isShow = isShow
    local msg = {
    }
    TFDirector:send(c2s.GUILD_BOSS_REQUEST, msg)
end

function GuildBossManager:requestChooseStage(stage)
    showLoading()
    TFDirector:send(c2s.GUILD_BOSS_STAGE_REQUEST,{stage})
end

function GuildBossManager:requestRank(_type)
    showLoading()
    TFDirector:send(c2s.GUILD_BOSS_RANK_REQUEST,{_type})
end

function GuildBossManager:requestHurtRank()
    showLoading()
    TFDirector:send(c2s.GUILD_BOSS_DAMAGE_RANK_REQUEST,{})
end
--请求攻击次数
function GuildBossManager:requestAttNumRank()
    showLoading()
    TFDirector:send(c2s.GUILD_BOSS_ATTACK_RANK_REQUEST,{})
end
function GuildBossManager:requestRank(_type)
    showLoading()
    local msg = {
        _type
    }
    TFDirector:send(c2s.GUILD_BOSS_RANK_REQUEST,msg)
end

function GuildBossManager:requireHelpAttack()
    showLoading()
    TFDirector:send(c2s.GUILD_BOSS_HELP_BATTLE_REQUEST,{})
end

function GuildBossManager:requireAttackBoss(npcid)
    showLoading()
    local msg = {
        npcid
    }
    TFDirector:send(c2s.GUILD_BOSS_CHALLENGE_REQUEST,msg)
end

function GuildBossManager:requireBossHelpList()
    showLoading()
    TFDirector:send(c2s.GUILD_BOSS_HELP_LIST_REQUEST,{})
end

function GuildBossManager:addOrCutBossHelp(info)
    showLoading()
    for _item in GuildBossData:iterator() do
        if _item.npc_id==info[2] then
            self.addOrCutBossHelpType=_item.type
        end
    end
    TFDirector:send(c2s.GUILD_BOSS_HELP_REQUEST,info)
end
--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--
function GuildBossManager:onReceiveMainInfo( event )
    hideLoading()
    local data = event.data or {}
    self:setActivityState(data.guildBossinfo.status)
    self.mainInfo = data.guildBossinfo
    self.mainInfo.battleTime = data.battleTime
    self.bossInfo = data.npcInfo
    self:parseBossBloodInfo()
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_MAIN_INFO, {})
    if self.isShow == true then
        self.isShow = nil
        self:showMainLayer()
    end
end

function GuildBossManager:parseBossBloodInfo()
    bossInfo = self.bossInfo
    if bossInfo == nil then
        return
    end
    local stage = self.mainInfo.stage
    local stageInfo = self:getStageData(stage)
    for i,v in ipairs(bossInfo) do
        local tbl = stringToTable(v.currentBlood,",")
        v.maxHp = 0
        v.curHp = 0
        for _i,_v in ipairs(tbl) do
            if _v and _v ~= "" then
                local tbls = stringToNumberTable(_v,"_")
                local npc = NPCData:objectByID(tbls[1])
                if npc then
                    local attri = npc.attribute
                    local attriList = stringToTable(attri,"|")
                    if attriList[1] then
                        local tblss = stringToNumberTable(attriList[1],"_")
                        v.curHp = v.curHp + tbls[2]
                        v.maxHp = v.maxHp + tblss[2]
                    end
                end
            end
        end
        if v and v.maxHp then
            v.maxHp = v.maxHp * ( stageInfo.main_coefficient * 0.001 )
        end
    end
end

function GuildBossManager:onReceiveChallengeInfo( event )
    hideLoading()
    local challengeInfo = event.data or {}
    self.bossHp = self:getBossHp()
    self.bossHp = self.bossHp - challengeInfo.hurt
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_CHALLENGE_INFO, {challengeInfo})
end

function GuildBossManager:onReceiveChooseStage( event )
    hideLoading()
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_CHOOSE_STAGE, {})
end

function GuildBossManager:onReceiveRankInfo( event )
    hideLoading()
    local _type = event.data.type
    self.rankList[_type] = event.data.rankInfo
    self:openRankLayer(_type)
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_RANK_INFO, {})
end

function GuildBossManager:onReceiveHurtPush( event )
    hideLoading()
    local hurtInfo = event.data
    
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_HURT_PUSH, {hurtInfo})
end

function GuildBossManager:onReceiveBossHelpList( event )
    hideLoading()
    print("onReceiveBossHelpList",event.data)
    for i=1,4 do
        self.BossHelpList[i]={} 
    end
    if event.data.player then
        for k,v in pairs(event.data.player) do
            local _item = self:getBossDataByNpcid(v.npcId)
            local size = #(self.BossHelpList[_item.type])
            self.BossHelpList[_item.type][size + 1] = v
        end
    end
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_BOSS_HELP_LIST, {})
end

function GuildBossManager:onReceiveaddOrCutBossHelp( event )
    hideLoading()
    self.BossHelpList[self.addOrCutBossHelpType]={}
    if event.data.player then
        for k,v in ipairs(event.data.player) do
            local bossData = self:getBossDataByNpcid(v.npcId)
            local size = #(self.BossHelpList[bossData.type])
            self.BossHelpList[bossData.type][size + 1] = v
        end
    end
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_BOSS_HELP_ADD_OR_CUT, {})
end


function GuildBossManager:onReceiveHurtRank( event )
    hideLoading()
    print('onReceiveHurtRank',event.data)
    self.hurtRank=event.data
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_BOSS_HURT_RANK, {})
    if self.requireHurtRankType and self.requireHurtRankType=="shuaxin" then
        toastMessage(localizable.GuildBoss_rank_shuaxin_tip)
        self.requireHurtRankType=nil
    end
end

function GuildBossManager:onReceiveAttNumRank( event )
    hideLoading()
    print('onReceiveAttNumRank',event.data)
    self.attNumRank=event.data
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_BOSS_ATTNUM_RANK, {})
    if self.requireHurtRankType and self.requireHurtRankType=="shuaxin" then
        toastMessage(localizable.GuildBoss_rank_shuaxin_tip)
        self.requireHurtRankType=nil
    end
end

function GuildBossManager:onReceiveActivityState( event )
    hideLoading()
    local state = event.data.status
    self:setActivityState(state)
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_ACTIVITY_STATE, {})
end


--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--

function GuildBossManager:getBossDataByNpcid( npcid )
    for _item in GuildBossData:iterator() do
        if _item.npc_id == npcid then
            return _item
        end
    end
    return nil
end

function GuildBossManager:getBuffDataByid( id )
    return GuildBossBuffData:objectByID(id)
end

function GuildBossManager:getHurtRank(  )
    return self.hurtRank
end
function GuildBossManager:getAttNumRank(  )
    return self.attNumRank
end
function GuildBossManager:getBossNpcIdByType( _type )
    for _item in GuildBossData:iterator() do
        if _item.type == _type then
            return _item.npc_id
        end
    end
end

function GuildBossManager:getBossInfoByType( _type )
    for i,v in ipairs(self.bossInfo) do
        local bossData = self:getBossDataByNpcid(v.npcId)
        if bossData.type == _type then
            return v
        end
    end
    return nil
end

function GuildBossManager:getStageData( stageId )
    return GuildBossStageData:objectByID(stageId)
end

function GuildBossManager:getStageSize()
    local num = GuildBossStageData:length()
    if (num > 15) then num = 15 end
    return num
end

function GuildBossManager:getMianInfo()
    return self.mainInfo
end

function GuildBossManager:getBossInfo()
    return self.bossInfo
end

function GuildBossManager:getRankInfo(_type)
    return self.rankList[_type]
end

function GuildBossManager:getRankSize(_type)
    if self.rankList == nil or self.rankList[_type] == nil or self.rankList[_type].guildBossRank == nil then
        return 0
    end
    return #(self.rankList[_type].guildBossRank)
end

function GuildBossManager:getActivityState()
    return self.activityState
end

function GuildBossManager:setActivityState(status)
    self.activityState = status
end

function GuildBossManager:setHurtRankType(type)
    self.requireHurtRankType=type
end

function GuildBossManager:getBossHelpList()
    return self.BossHelpList or {}
end

function GuildBossManager:getBossHelpInfo()
    return self.BossHelpList or {}
end

function GuildBossManager:getServerSwitch()
    if MainPlayer:getServerSwitchStatue(ServerSwitchType.GuildBoss) == true then
        return true
    end
    return false
end
--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--
function GuildBossManager:openMainLayer()
    self:requestMainInfo(true)
end

function GuildBossManager:showMainLayer()
    if (self:checkRedPoint()) then
        self.isRedShow = false
    end
    --
    local layer = AlertManager:addLayerByFile('lua.logic.guildBoss.GuildBossMainLayer',AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function GuildBossManager:openChooseStageLayer()
    local layer = AlertManager:addLayerByFile('lua.logic.guildBoss.GuildBossChooseStageLayer',AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    AlertManager:show()
end

function GuildBossManager:openRewardLayer()
    local layer = AlertManager:addLayerByFile('lua.logic.guildBoss.YanWuRewardLayer',AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function GuildBossManager:openRankLayer(_type)
    if _type == self.RankType_1 then
        local layer = AlertManager:addLayerByFile('lua.logic.guildBoss.GuildBossRankLayer',AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    else
        local layer = AlertManager:addLayerByFile('lua.logic.guildBoss.GuildBossFirstKillRankLayer',AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    end
    AlertManager:show()
end

function GuildBossManager:openVSLayer(type)
    local layer = AlertManager:addLayerByFile("lua.logic.guildBoss.GuildBossVSLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    layer:setBossType(type)
    AlertManager:show()
end

function GuildBossManager:openYanWuZhaoJiLayer()

    if next(FactionManager:getMemberInfo())==nil then
        FactionManager:requestMemberInfo()
    end

    -- local layer  = require("lua.logic.guildBoss.YanWuZhaoJi"):new()
    local layer=AlertManager:addLayerByFile("lua.logic.guildBoss.YanWuZhaoJiLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    if self.BossHelpList == nil or next(self.BossHelpList)==nil or next(self.BossHelpList[1])==nil then
        self:requireBossHelpList()
    else
        layer:loadData()
    end
    AlertManager:show()
end

function GuildBossManager:openYanWuEditorLayer(tableViewIndex)
    -- local layer  = require("lua.logic.guildBoss.YanWuEditor"):new()
    local layer=AlertManager:addLayerByFile("lua.logic.guildBoss.YanWuEditorLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    layer:setTypeIndex(tableViewIndex)
    AlertManager:show()
end

function GuildBossManager:checkRedPoint()
    if FactionManager:getPostInFaction() == 1 or FactionManager:getPostInFaction() == 2 then
        local state = self:getActivityState()
        if state == self.ActivityState_2 and self.isRedShow then
            return true
        end
    end
    return false
end

return GuildBossManager:new();