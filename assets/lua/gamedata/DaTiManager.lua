--[[
******答题玩法数据管理类*******

	-- by quanhuan
	-- 2016/3/14
	
]]

local DaTiManager = class("DaTiManager")

DaTiManager.rinkListData = "DaTiManager.rinkListData"
DaTiManager.startDaTi = "DaTiManager.startDaTi"
DaTiManager.daTiCompleteInfo = "DaTiManager.daTiCompleteInfo"
DaTiManager.daTiTrueAnswer = "DaTiManager.daTiTrueAnswer"


function DaTiManager:ctor(data)
	-- 答题排行榜
    TFDirector:addProto(s2c.DATI_RANK_INFO_RESPONSE, self, self.onDaTiRankInfoReceive)
    -- 开始答题
    TFDirector:addProto(s2c.DATI_START_RESPONSE, self, self.onStartDaTiInfoReceive) 
    -- 正确结果
    TFDirector:addProto(s2c.DATI_ANSWER_RESPONSE, self, self.onTrueResultReceive)
    -- 最后结果
    TFDirector:addProto(s2c.DATI_END_RESPONSE, self, self.onCompleteInfoReceive)
    -- 答题状态
    TFDirector:addProto(s2c.DATI_INFO_RESPONSE, self, self.onDaTiStateReceive)

    self.tiMuInfo = {} -- 当前题目信息
    self.tiJi = {} -- 题集
    self.starState = 0 -- 答题状态（0：未开始答题  1：开始   2:已完成）
end

------------------------------------请求信息------------------------------------
function DaTiManager:sendDaTiRink()
	showLoading()
	-- c2s.DATI_RANK_INFO_REQUEST  3b00  请求答题排行榜
	TFDirector:send(c2s.DATI_RANK_INFO_REQUEST,{})
end
function DaTiManager:sendStarDaTi()
	showLoading()
	-- c2s.DATI_START_REQUEST  3b01  开始答题
	TFDirector:send(c2s.DATI_START_REQUEST,{})
end
function DaTiManager:sendDaTiAnswerInfo(id, answerId)
	showLoading()
	-- c2s.DATI_ANSWER_REQUEST  3b02  答题
	local msg = {
            tonumber(id),
            tonumber(answerId)
        }
	TFDirector:send(c2s.DATI_ANSWER_REQUEST,msg)
end
function DaTiManager:sendDaTiInfo()
	showLoading()
	-- c2s.DATI_INFO_REQUEST  3b04  答题状态
	TFDirector:send(c2s.DATI_INFO_REQUEST,{})
end
function DaTiManager:sendEndDaTi()
	showLoading()
	-- c2s.DATI_END_REQUEST  3b03  超时
	TFDirector:send(c2s.DATI_END_REQUEST,{})
end

-------------------------------------接受信息------------------------------------------
function DaTiManager:onDaTiRankInfoReceive(event)
	-- s2c.DATI_RANK_INFO_RESPONSE  3b00  答题排行榜
	hideLoading()
	self.daTiRankList = event.data.rankInfo
	self.myRinkInfo = {
		takeTime = event.data.myTakeTime,
		trueNum = event.data.myTrueCount,
		rank = tonumber(event.data.myRank), -- 服务器下标从0开始
		totalNum = event.data.myDatiTotalCount
	}

	TFDirector:dispatchGlobalEventWith(self.rinkListData)    
end
function DaTiManager:onStartDaTiInfoReceive(event)
	-- s2c.DATI_START_RESPONSE  3b01  开始答题
	hideLoading()
	self.tiMuInfo.startTime = event.data.startTime -- 秒级

	self.tiMuInfo.currNum = 1
	self.tiMuInfo.currTrueNum = 0
	self.tiJi = {}
	self.starState = 1
	for i = 1, #event.data.datiIds do 
		local id = event.data.datiIds[i]
		table.insert(self.tiJi, id)
	end
	TFDirector:dispatchGlobalEventWith(self.startDaTi)
end
function DaTiManager:onTrueResultReceive(event)
	-- s2c.DATI_ANSWER_RESPONSE  3b02  正确结果
	hideLoading()

	TFDirector:dispatchGlobalEventWith(self.daTiTrueAnswer,{event.data.trueResult})
end
function DaTiManager:onCompleteInfoReceive(event)
	-- s2c.DATI_END_RESPONSE  3b03  最后结果
	hideLoading()
	self.endTakeTime = event.data.takeTime
	self.trueNum = event.data.trueCount
	self.starState = 2
	-- TFDirector:dispatchGlobalEventWith(self.daTiCompleteInfo)
end
function DaTiManager:onDaTiStateReceive(event)
	-- s2c.DATI_INFO_RESPONSE  3b04  答题状态
	print("s2c.DATI_INFO_RESPONSE  3b04  答题状态",event.data)
	hideLoading()
	self.starState = event.data.status	-- 状态（0：未开始答题  1：开始   2:已答完）
	if (self.starState == 1) then
		self.tiJi = {}
		for i = 1, #event.data.datiIds do 
			local id = event.data.datiIds[i]
			table.insert(self.tiJi, id)
		end
		self.tiMuInfo.currNum = 1 
		if (event.data.id) then
			self.tiMuInfo.currNum = #event.data.id + 1 
		end
		
		self.tiMuInfo.startTime = event.data.startTime -- 秒级
		self.tiMuInfo.currTrueNum = event.data.trueCount

		TFDirector:dispatchGlobalEventWith(self.startDaTi)
	elseif (self.starState == 2) then
		TFDirector:dispatchGlobalEventWith(self.daTiCompleteInfo)
	end
end

-------------------------------------数据处理------------------------------------------
--通过下标获取题目信息
function DaTiManager:getCurrSubjectByIdx( idx )
	local currId = self.tiJi[idx]
	local currSub = DaTiData:getSubjectById(currId)
	return currSub
end

function DaTiManager:openDaTiMainLayer()
	AlertManager:addLayerByFile("lua.logic.qiyu.DaTiMainLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_0);
	AlertManager:show();
end
-- 主界面开启快捷按钮状态
function DaTiManager:getStartOrClose()
	local timeData = os.date("*t",MainPlayer:getNowtime())

	local isServerOpen = MainPlayer:getServerSwitchStatue(ServerSwitchType.DaTi)
	local isTimeOpen = false

	if (timeData.wday == 1 and timeData.hour >= 0 and timeData.hour < 21) then
		isTimeOpen = true
	end
	return isServerOpen and isTimeOpen 
end

function DaTiManager:getDaTiState()	
	return self.starState
end
function DaTiManager:getMyDaTiData()	
	return self.tiMuInfo
end

function DaTiManager:getRankInfo()
	return self.daTiRankList
end

function DaTiManager:getMyRank()
	return self.myRinkInfo
end
return DaTiManager:new()