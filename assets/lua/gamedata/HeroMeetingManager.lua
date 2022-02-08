--[[
******英雄大会管理类*******

    -- by jiawei.miao
    -- 2018/1/5
]]


local HeroMeetingManager = class("HeroMeetingManager")

HeroMeetingManager.HeroBoxReward = 1
HeroMeetingManager.HeroEveryRankingReward = 2
HeroMeetingManager.HeroJieSuanReward = 3
HeroMeetingManager.HeroPersonalRankingReward = 4
HeroMeetingManager.HeroFactionRankingReward = 5

HeroMeetingManager.lastChampionMsg 						 = "HeroMeetingManager.lastChampionMsg"
HeroMeetingManager.HeroDuelInfo 						 = "HeroMeetingManager.HeroDuelInfo"
HeroMeetingManager.REFRESH_HERO_DUEL_PLAYERS_RESPONSE 	 = "HeroMeetingManager.REFRESH_HERO_DUEL_PLAYERS_RESPONSE"
HeroMeetingManager.MyReport 							 = "HeroMeetingManager.MyReport"
HeroMeetingManager.MasterReport 						 = "HeroMeetingManager.MasterReport"
HeroMeetingManager.GET_HERO_DUEL_RANK_RESPONSE 			 = "HeroMeetingManager.GET_HERO_DUEL_RANK_RESPONSE"
HeroMeetingManager.GET_HERO_DUEL_GUILD_RANK_RESPONSE	 = "HeroMeetingManager.GET_HERO_DUEL_GUILD_RANK_RESPONSE"
HeroMeetingManager.GET_HERO_REWARD_INFO 				 = "HeroMeetingManager.GET_HERO_REWARD_INFO"
HeroMeetingManager.OpenBox 								 = "HeroMeetingManager.OpenBox"
HeroMeetingManager.REBATE_CONVERT_REWARD_RESPONSE		 = "HeroMeetingManager.REBATE_CONVERT_REWARD_RESPONSE"
HeroMeetingManager.GET_REBATE_CONVERT_INFO_RESPONSE		 = "HeroMeetingManager.GET_REBATE_CONVERT_INFO_RESPONSE"
HeroMeetingManager.RECEIVE_REWARD 						 = "HeroMeetingManager.RECEIVE_REWARD"
HeroMeetingManager.HERO_DUEL_POWER_UPDATE				 = "HeroMeetingManager.HERO_DUEL_POWER_UPDATE"

function HeroMeetingManager:ctor()
	TFDirector:addProto(s2c.NOTIVE_HERO_DUEL_STATUS , self, self.refreshHeroActivityType)
    TFDirector:addProto(s2c.GET_HERO_DUEL_LAST_RESPONSE , self, self.GetHeroDuelLastResponse)
    TFDirector:addProto(s2c.GET_HERO_DUEL_INFO_RESPONSE , self, self.GetHeroDuelInfoResponse)
    TFDirector:addProto(s2c.REFRESH_HERO_DUEL_PLAYERS_RESPONSE , self, self.refreshHeroPlayer)
    TFDirector:addProto(s2c.GET_HERO_DUEL_RANK_RESPONSE , self, self.refreshHeroPersonalRanking)
    TFDirector:addProto(s2c.GET_HERODUEL_DETAILS_RESPONSE , self, self.showHeroArmyVSLayer)
    TFDirector:addProto(s2c.RECEIVE_BOX_REWARD_RESPONSE , self, self.refreshBox)
    TFDirector:addProto(s2c.GET_HERO_DUEL_MY_REPORT_RESPONSE , self, self.HeroDuelMyBattleReport)
    TFDirector:addProto(s2c.GET_HERO_DUEL_REPORT_RESPONSE , self, self.HeroDuelMasterBattleReport)
	TFDirector:addProto(s2c.GET_HERO_DUEL_GUILD_RANK_RESPONSE , self, self.refreshFactionRanking)
	TFDirector:addProto(s2c.GET_SETTLEMENT_REWARD_INFO_RESPONSE , self, self.GetSettlementRewardInfoResponse)
	TFDirector:addProto(s2c.REBATE_CONVERT_REWARD_RESPONSE , self, self.heroDuelDuiHuan)
	TFDirector:addProto(s2c.GET_REBATE_CONVERT_INFO_RESPONSE , self, self.refreshHeroDuihuanInformation)
	TFDirector:addProto(s2c.RECEIVE_SETTLEMENT_REWARD_RESPONSE , self, self.ReceiveSettlementRewardResponse)
	TFDirector:addProto(s2c.HERO_DUEL_POWER_UPDATE, self, self.refreshHeroDuelPower)


	
    self.myGroup = 0
    self.myRank = 0
    self.myScore = 1000
    self.endTime = 0
    self.serverTime = 0
    self.HeroActivityType = 0
    self.reportId	= ""
    self.boxreward = false
    self.settlement = false

end

function HeroMeetingManager:restart()
    self.myGroup = 0
    self.myRank = 0
    self.myScore = 1000
    self.endTime = 0
    self.reportId	= ""

end


function HeroMeetingManager:GetHeroDuelInfoRequest()
	TFDirector:send(c2s.GET_HERO_DUEL_INFO_REQUEST, {})
end

function HeroMeetingManager:GetHeroDuelInfoResponse(event)
    TFDirector:dispatchGlobalEventWith(HeroMeetingManager.HeroDuelInfo,{event.data})
    self.myGroup 	= event.data.myGroup
    self.myRank 	= event.data.myRank
    self.myScore 	= event.data.myScore
    self.endTime    = event.data.endTime / 1000
    TFDirector:dispatchGlobalEventWith(HeroMeetingManager.REFRESH_HERO_DUEL_PLAYERS_RESPONSE,{event.data})
end
--活动状态
function HeroMeetingManager:refreshHeroActivityType(event)
	self.HeroActivityType = event.data.status
	if event.data.box then 
		 self.boxreward = event.data.box
	end
	if event.data.settlement then 
		 self.settlement = event.data.settlement
	end
end
--红点
function HeroMeetingManager:getRedPointState()
	local num = getResValueExpressionByTypeForGH(HeadResType.HERO)
	local date = GetCorrectDate("*t", MainPlayer:getNowtime())
	if self.HeroActivityType == 1 and date.hour > 9 and date.hour < 22 then
		if self.boxreward == true or self.settlement == true or num > 0 then
			return true
		end
	end
	return false
end
--请求上届信息
function HeroMeetingManager:sendHeroDuelLastResponse()
	TFDirector:send(c2s.GET_HERO_DUEL_LAST_REQUEST,{})  
end
function HeroMeetingManager:GetHeroDuelLastResponse(event)
    TFDirector:dispatchGlobalEventWith(HeroMeetingManager.lastChampionMsg,{event.data})
end
--更新目标玩家战力
function HeroMeetingManager:refreshHeroDuelPower(event)
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.HERO_DUEL_POWER_UPDATE,{event.data})
end


function HeroMeetingManager:showHeroMeetingLayer()

    local layer = AlertManager:addLayerByFile("lua.logic.heromeeting.HeroMainLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE);
    AlertManager:show()
    self:GetHeroDuelInfoRequest()
end
function HeroMeetingManager:showHeroArmyVSLayer(event)
	hideLoading()
	local layer = AlertManager:addLayerByFile("lua.logic.heromeeting.HeroArmyVSLayer",AlertManager.BLOCK);
    layer:loadData(event.data);
    AlertManager:show()
end
--请求更新玩家信息
function HeroMeetingManager:sendHeroPlayer()
	showLoading()
	TFDirector:send(c2s.REFRESH_HERO_DUEL_PLAYERS_REQUEST,{})   
end
--接受大会挑战玩家
function HeroMeetingManager:refreshHeroPlayer(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.REFRESH_HERO_DUEL_PLAYERS_RESPONSE,{event.data})
end
--请求个人排行信息
function HeroMeetingManager:sendPersonalRanking(idx)
	showLoading()
	TFDirector:send(c2s.GET_HERO_DUEL_RANK_REQUEST,{idx})  
end
function HeroMeetingManager:refreshHeroPersonalRanking(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.GET_HERO_DUEL_RANK_RESPONSE,{event.data})
end
function HeroMeetingManager:OpenHeroListLayer()
	local layer = AlertManager:addLayerByFile("lua.logic.heromeeting.HeroListLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
	layer:loadData();
    AlertManager:show()
end
--请求奖励信息
function HeroMeetingManager:GetSettlementRewardInfoRequest()
	showLoading()
	TFDirector:send(c2s.GET_SETTLEMENT_REWARD_INFO_REQUEST,{})  
end
--接受奖励信息
function HeroMeetingManager:GetSettlementRewardInfoResponse(event)
	hideLoading()
	self.myRank = event.data.currentRank
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.GET_HERO_REWARD_INFO,{event.data})
end
--收到奖励信息
function HeroMeetingManager:ReceiveSettlementRewardResponse(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.RECEIVE_REWARD,{event.data})
end
--请求帮派排行信息
function HeroMeetingManager:sendFactionRanking()
	showLoading()
	TFDirector:send(c2s.GET_HERO_DUEL_GUILD_RANK_REQUEST,{})  
end
function HeroMeetingManager:refreshFactionRanking(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.GET_HERO_DUEL_GUILD_RANK_RESPONSE,{event.data})
end
--请求兑换
function HeroMeetingManager:sendHeroDuihuan(id)
	showLoading()
	TFDirector:send(c2s.REBATE_CONVERT_REWARD_REQUEST,{id})  
end
function HeroMeetingManager:heroDuelDuiHuan(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.REBATE_CONVERT_REWARD_RESPONSE,{event.data})
end
--获取折扣兑换信息
function HeroMeetingManager:sendHeroDuihuanInformation()
	showLoading()
	TFDirector:send(c2s.GET_REBATE_CONVERT_INFO_REQUEST,{})  
end
function HeroMeetingManager:refreshHeroDuihuanInformation(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.GET_REBATE_CONVERT_INFO_RESPONSE,{event.data})
end
--请求个人战报
function HeroMeetingManager:GetHeroDuelMyReportRequest()
	showLoading()
	TFDirector:send(c2s.GET_HERO_DUEL_MY_REPORT_REQUEST,{})  
end
--请求高手战报
function HeroMeetingManager:GetHeroDuelReportRequest(gruop)
	showLoading()
	TFDirector:send(c2s.GET_HERO_DUEL_REPORT_REQUEST,{gruop})  
end
--接收个人战报
function HeroMeetingManager:HeroDuelMyBattleReport(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.MyReport,{event.data.reports})
end
--接收高手战报
function HeroMeetingManager:HeroDuelMasterBattleReport(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.MasterReport,{event.data.reports})
end
function HeroMeetingManager:GetMyGroup()
	return self.myGroup
end

function HeroMeetingManager:GetMyRank()
	return self.myRank
end

function HeroMeetingManager:GetMyScore()
	return self.myScore
end
--请求玩家阵位
function HeroMeetingManager:showDetail(id)
	showLoading()
	TFDirector:send(c2s.GET_HERO_DUEL_DETAILS_REQUEST,{id})
end
function HeroMeetingManager:challengePlayer(id, Isback)
    showLoading()
	TFDirector:send(c2s.CHALLENGE_HERO_DUEL_REQUEST,{id,self.reportId})
end
--请求宝箱领取
function HeroMeetingManager:sendOpenBox(id)
	showLoading()
	TFDirector:send(c2s.RECEIVE_BOX_REWARD_REQUEST,{id})
end
function HeroMeetingManager:refreshBox(event)
	hideLoading()
	TFDirector:dispatchGlobalEventWith(HeroMeetingManager.OpenBox,{event.data})
end

return HeroMeetingManager:new()