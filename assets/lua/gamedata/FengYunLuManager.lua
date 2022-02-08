--[[
******风云录数据管理类*******

	-- 2018/06/05
]]

local FengYunLuManager = class("FengYunLuManager")

FengYunLuManager.SEND_RANKING_LIST = "FengYunLuManager.SEND_RANKING_LIST"
FengYunLuManager.WIND_RECORD_WARSIDE_CONFIG_RESULT = "FengYunLuManager.WIND_RECORD_WARSIDE_CONFIG_RESULT"
FengYunLuManager.BUY_COUNT = "FengYunLuManager.BUY_COUNT"
FengYunLuManager.GAIN_LAST_BEST_INFO = "FengYunLuManager.GAIN_LAST_BEST_INFO"
FengYunLuManager.UPDATE_STATE = "FengYunLuManager.UPDATE_STATE"
FengYunLuManager.BUY_COUNT_ChallengeCount = "FengYunLuManager.BUY_COUNT_ChallengeCount"
FengYunLuManager.OPEN_WIND_CLOUD_RECORD = "FengYunLuManager.OPEN_WIND_CLOUD_RECORD"


function FengYunLuManager:ctor(data)
	self.AllRoleList = {}
	--历史自己的阵容
	self.PastRoleList = {[1] = "0",[2] = "0",[3] = "0"} 
	--自己现在各关卡的信息
	self.MyInfoinpass = {[1] = {},[2] = {},[3] = {}} 
	--排行榜
	self.RankList = {[1] = {},[2] = {},[3] = {},[4] = {}} 
	--主界面显示排行榜
	self.MianRankList = {[1] = {},[2] = {},[3] = {}} 
	--上阵list (id)
	self.MyRoleList = {}
	for i = 1,9 do 
		self.MyRoleList[i] = 0 
	end
	--上阵list (roid)
	self.MyRoleListInRoleid = {}
	for i = 1,9 do 
		self.MyRoleListInRoleid[i] = 0 
	end
	--奖励领取情况
	self.isPass =  {[1] = 0,[2] = 0,[3] = 0} 
	--副本类型
	self.ranktype = 1
	-- 今日开启的副本id
	self.rankid = 1
	--副本天数
	self.day = 0
	--剩余刷新挑战次数
	self.refreshCount = 1
	--剩余挑战次数
	self.challengeCount = 0
	--排行type
	self.Rankingtype = 1  
	--打开属性界面
	self.isOpenFengYunLu = false
	--上阵侠客缘分
	self.FateList = TFArray:new()
	--风云录是否开启
	self.startOrClose = 0
	--风云录排行榜字段是否有
	self.ListType = true

	--获取风云录消息打开主界面
	TFDirector:addProto(s2c.OPEN_WIND_CLOUD_RECORD , self, self.OpenFengYunLuMainLayer)
	--更新排行榜
	TFDirector:addProto(s2c.SEND_RANKING_LIST , self, self.updateRankingList)
	--更新我方阵容
	TFDirector:addProto(s2c.WIND_RECORD_WARSIDE_CONFIG_RESULT , self, self.updateWindMyRoleList)
	--更新英雄池
	TFDirector:addProto(s2c.REFRESH_HERO_POOL , self, self.updateHeroPool)
	--更新体力或者刷新次数
	TFDirector:addProto(s2c.BUY_COUNT , self, self.updateBuycount)
	--获取home界面信息
	TFDirector:addProto(s2c.GAIN_LAST_BEST_INFO , self, self.updateGainLastBestInfo)
	--开启活动
	TFDirector:addProto(s2c.UPDATE_STATE , self, self.startFengYunLu)
	--判断是否能打架
	TFDirector:addProto(s2c.REQUEST_CHALLENGE_COPY , self, self.OpenFengYunLuArmyLayer)


end

function FengYunLuManager:OpenFengYunLuHistoryLayer()
	local layer = AlertManager:addLayerByFile("lua.logic.fengyunlu.FengYunLuHistoryLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    AlertManager:show()
end

function FengYunLuManager:getMissionIdByDay(day)
	if self.dayList then
		for k,v in pairs(self.dayList) do
			if k == day then
				return v
			end
		end
	end
	--默认返回1
	return 1
end
function FengYunLuManager:OpenFengYunLuMainLayer(event)
	hideLoading()
	self:addALLRoleList(event.data.npcList)
	self:updateMyRoleList(event.data.formation)
	self:updatePastRoleList(event.data.rankInfo)
	self:updateMyInfoinpass(event.data.myInfo)
	self:updataMainRankList(event.data.topTen)
	self:updataIsPassInfo(event.data.isPass)
	self.rankid = event.data.copyId or -1
	local stage = event.data.stage
	self.dayList = {}
	if stage and stage ~= "" then
		local _stage = stringToTable(stage, "|")
		for k,v in pairs(_stage) do
			local dayData = stringToNumberTable(v,",")
			self.dayList[dayData[1]] = dayData[2]
		end
	end
	if self.rankid ~= -1 then
		for k,v in pairs(self.dayList) do
			if v == self.rankid then
				self.day = k
				break
			end
		end
		-- self.ranktype,self.day = FYRecordlineUoData:getStageAndDayById(self.rankid)
	end
	self.refreshCount = event.data.refreshCount or 0
	self.challengeCount = event.data.challengeCount or 0
	-- self.ranktype = event.data.stage or self.ranktype
	TFDirector:dispatchGlobalEventWith(FengYunLuManager.OPEN_WIND_CLOUD_RECORD, {})
end

function FengYunLuManager:OpenFengYunLuRewardLayer()
	local layer = AlertManager:addLayerByFile("lua.logic.fengyunlu.FengYunLuRewardLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    AlertManager:show()
end

function FengYunLuManager:OpenFengYunLuListLayer()
	local layer = AlertManager:addLayerByFile("lua.logic.fengyunlu.FengYunLuListLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    AlertManager:show()
end

function FengYunLuManager:OpenFengYunLuArmyLayer(event)
	if event.data.startOrClose == 1 then
		local layer = AlertManager:addLayerByFile("lua.logic.fengyunlu.FengYunLuArmyLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    	AlertManager:show()
    else
    	toastMessage(localizable.WeekRaceManager_huodong_weikaishi)
    end
end
function FengYunLuManager:OpenFengYunLuVSLayer()
	if self.challengeCount < 1 then
		local price = ConstantData:objectByID("fyrecordprice").value or 200
		local num = ConstantData:objectByID("fyrecordfrequency").value or 5
		CommonManager:showOperateSureLayer(function()
			showLoading()
			self.countType = 1
    	   TFDirector:send(c2s.BUY_COUNT,{1,self.day})
    	end,
    	nil,
    	{   
    	    title = localizable.LunJianFeng_txt1,
    	    
    	    msg = stringUtils.format(localizable.FengYunLu_tips4 , price , num)
    	})
	else
		local layer = AlertManager:addLayerByFile("lua.logic.fengyunlu.FengYunLuVSLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE);
    	AlertManager:show()
	end
	
end

function FengYunLuManager:senderFengYunLuInfo()
	showLoading()
	TFDirector:send(c2s.OPEN_WIND_CLOUD_RECORD,{})
	local layer = AlertManager:addLayerByFile("lua.logic.fengyunlu.FengYunLuMainLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    AlertManager:show()
end
function FengYunLuManager:OpenFengYunLuArmy()
	TFDirector:send(c2s.REQUEST_CHALLENGE_COPY,{})
end
function FengYunLuManager:updateRankingList(event)
	hideLoading()
	if self.RankList[self.Rankingtype] and next(self.RankList[self.Rankingtype]) ~= nil then
		if event.data.rankInfo == nil then
			self.ListType = false
		else
			local num =  #self.RankList[self.Rankingtype].rankInfo
			for i = 1,#event.data.rankInfo do
				self.RankList[self.Rankingtype].rankInfo[ i + num] = event.data.rankInfo[i]
			end
			self.ListType = true 
		end
	else
		self.RankList[self.Rankingtype] = event.data
		self.ListType = true
	end
	TFDirector:dispatchGlobalEventWith(FengYunLuManager.SEND_RANKING_LIST, {})
end
function FengYunLuManager:deleteRankList()
	self.RankList = {}
	for i = 1,4 do 
		self.RankList[i] = {} 
	end
end
function FengYunLuManager:sendRankingList(Type,starindex,length)
	showLoading()
	self.Rankingtype = Type or 1
	TFDirector:send(c2s.SEND_RANKING_LIST,{self.Rankingtype,starindex,length})
end
--观看录像
function FengYunLuManager:sendRePlay( id )
	TFDirector:send(c2s.SEND_REPLAY,{ id })
end
--添加英雄池
function FengYunLuManager:addALLRoleList(rolelist)
	self.AllRoleList = {}
	if rolelist == nil then
		return
	end
	if rolelist then
		for i =1 ,#rolelist do
			local role = FYRecordData:getRoleinfoByid(rolelist[i])
			self.AllRoleList[i] = role
		end
	end
	self:sortAllRoleList()
end
--更新英雄池
function FengYunLuManager:updateHeroPool(event)
	hideLoading()
	self.AllRoleList = {}
	self.MyRoleList = {}
	if self.refreshCount > 0 then
		self.refreshCount = self.refreshCount -1
	end
	local rolelist = event.data.templateId
	if rolelist == nil then
		return
	end
	for i =1 ,#rolelist do
		local role = FYRecordData:getRoleinfoByid(rolelist[i])
		self.AllRoleList[i] = role
	end
	self:sortAllRoleList()
	TFDirector:dispatchGlobalEventWith(FengYunLuManager.WIND_RECORD_WARSIDE_CONFIG_RESULT, {})
end
--请求更新英雄池
function FengYunLuManager:sendUpdataHeroPool()
	if self.refreshCount < 1 then
		local num = ConstantData:objectByID("fyrecordshuaxin").value or 50
		CommonManager:showOperateSureLayer(function()
			showLoading()
			self.countType = 2
    	   TFDirector:send(c2s.BUY_COUNT,{2,self.day})
    	end,
    	nil,
    	{   
    	    title = localizable.FengYunLu_tips,
    	    msg =  localizable.FengYunLu_tips7,
    	})
	else
		CommonManager:showOperateSureLayer(function()
			showLoading()
			TFDirector:send(c2s.REFRESH_HERO_POOL,{self.day})
    	end,
    	nil,
    	{   
    	    msg = stringUtils.format(localizable.FengYunLu_tips5)
    	})
	end
end
--更新己方阵容
function FengYunLuManager:updateMyRoleList(rolelist)
	self.MyRoleList = {}
	self.MyRoleListInRoleid = {}
	if rolelist == nil then
		return
	end
	local list = string.split(rolelist, ",")
	print("更新己方阵容",list)
	for i = 1 ,#list do
		self.MyRoleList[i] = tonumber(list[i])
		if self.MyRoleList[i] and self.MyRoleList[i] ~= 0 then
			print("更新己方阵容",list[i],i,FYRecordData:getRoleinfoByid(316))
			local roleid = FYRecordData:getRoleinfoByid(tonumber(list[i])).role_id 
			self.MyRoleListInRoleid[i]  = roleid
		else
			self.MyRoleListInRoleid[i]  = 0
		end
	end 
	self:firstUpdataFate()
end
--更新己方历史最佳阵容
function FengYunLuManager:updatePastRoleList(rankInfo)
	self.PastRoleList = {[1] = "0",[2] = "0",[3] = "0"} 
	if rankInfo == nil then
		return
	end
	for _,k in pairs(rankInfo) do
		self.PastRoleList[k.rankType] = k.bestFormation
	end
end
--更新己方阵容1（协议）
function FengYunLuManager:updateWindMyRoleList(event)
	hideLoading()
	self.MyRoleList = {}
	self.MyRoleListInRoleid = {}

	local rolelist = event.data.formation
	if rolelist == nil then
		return
	end
	local list = string.split(rolelist, ",")
	for i = 1 ,#list do
		self.MyRoleList[i] = tonumber(list[i])
		if self.MyRoleList[i] and self.MyRoleList[i] ~= 0 then
			local roleid = FYRecordData:getRoleinfoByid(tonumber(list[i])).role_id 
			self.MyRoleListInRoleid[i]  = roleid
		else
			self.MyRoleListInRoleid[i]  = 0
		end
	end
	self:updateFate()
	TFDirector:dispatchGlobalEventWith(FengYunLuManager.WIND_RECORD_WARSIDE_CONFIG_RESULT, {})
end
function FengYunLuManager:updateFate()
	local fatelist = TFArray:new()
	for i = 1, 9 do 
		if self.MyRoleListInRoleid[i] ~= 0 then
			local fateArray =  RoleFateData:getRoleFateById(self.MyRoleListInRoleid[i])
			for _,v in ipairs(fateArray.m_list) do
				local targetList = v:gettarget()
				if targetList[1].fateType == 1 then
					for e = 1,9 do
						if self.MyRoleListInRoleid[e] ~= 0 and targetList[1].fateId == self.MyRoleListInRoleid[e] then 
							local isFate = false
							if self.FateList:length() > 0 then
								for _,Fate in ipairs(self.FateList.m_list) do 
									if v.id == Fate then
										isFate = true
										break
									end
								end
								if isFate == false then
									fateMessage(v.title,nil,nil,nil,true,"lua.uiconfig_mango_new.common.FateMessage")
								end
								fatelist:push(v.id)
							else
								fatelist:push(v.id)
								fateMessage(v.title,nil,nil,nil,true,"lua.uiconfig_mango_new.common.FateMessage")
							end
						end
					end
				end
			end
		end
	end
	self.FateList = {}
	self.FateList = fatelist
end
--刚进游戏刷新缘分
function FengYunLuManager:firstUpdataFate()
	self.FateList = TFArray:new()
	for i = 1, 9 do 
		if self.MyRoleListInRoleid[i] ~= 0 then
			local fateArray =  RoleFateData:getRoleFateById(self.MyRoleListInRoleid[i])
			for _,v in ipairs(fateArray.m_list) do
				local targetList = v:gettarget()
				if targetList[1].fateType == 1 then
					for e = 1,9 do
						if self.MyRoleListInRoleid[e] ~= 0 and targetList[1].fateId == self.MyRoleListInRoleid[e] then 
							self.FateList:push(v.id)
						end
					end
				end
			end
		end
	end
end
--更新次数
function FengYunLuManager:updateBuycount(event)
	hideLoading()
	if self.countType == 1 then
		self.challengeCount  = self.challengeCount + 5
		TFDirector:dispatchGlobalEventWith(FengYunLuManager.BUY_COUNT_ChallengeCount, {})
	elseif self.countType == 2 then
		-- self.refreshCount  = self.refreshCount + 1
		TFDirector:dispatchGlobalEventWith(FengYunLuManager.BUY_COUNT, {})
	end
	
end
--请求主界面信息
function FengYunLuManager:sendHomeLayerInfo()
	showLoading()
	TFDirector:send(c2s.GAIN_LAST_BEST_INFO,{})
end

function FengYunLuManager:updateGainLastBestInfo( event )
	hideLoading()
	self.startOrClose = self:updataFengYunLuStartOrClose(event.data.startTime)
	TFDirector:dispatchGlobalEventWith(FengYunLuManager.GAIN_LAST_BEST_INFO, {event.data})
end
--判断是否开启活动
function FengYunLuManager:updataFengYunLuStartOrClose(time)
	if MainPlayer:getLevel() < 50 then
		return 0
	end
	if MainPlayer:getServerSwitchStatue(ServerSwitchType.FengYunLu) ~= true then
		return 0
	end
	local StartMonthNum = os.date("%W",time/1000)
	local MyMonthNum = os.date("%W",MainPlayer:getNowtime())
	--挑战周数和当前周数是否一致
	if StartMonthNum ~= MyMonthNum then
		return 0
	end
	local MyTiame = os.date("*t",MainPlayer:getNowtime())
	--星期2到星期4开启 日期加一
	if MyTiame.wday > 5 or MyTiame.wday < 3 then
		return 0
	end
	if MyTiame.hour < 10 or MyTiame.hour > 21 then
		return 0
	end
	return 1
end
--
function FengYunLuManager:startFengYunLu(event)
	self.startOrClose = event.data.startOrClose or 0
	TFDirector:dispatchGlobalEventWith(FengYunLuManager.UPDATE_STATE, {})
end
function FengYunLuManager:getStartOrClose()
	return self.startOrClose
end
function FengYunLuManager:updateMyInfoinpass(myInfo)
	self.MyInfoinpass = {[1] = {},[2] = {},[3] = {}} 
	if myInfo == nil then
		return
	end
	for _,k in pairs(myInfo) do
		self.MyInfoinpass[k.rankType] = k
	end
end
function FengYunLuManager:updataMainRankList(topTen)
	self.MianRankList = {[1] = {},[2] = {},[3] = {}} 
	if topTen == nil then
		return
	end
	for i,k in pairs(topTen) do
		self.MianRankList[k.rankType] = k.rank
	end
end
function FengYunLuManager:updataIsPassInfo(isPass)
	if isPass == nil then
		return 
	end
	local base = string.split(isPass, '_')
	for i= 1, 3 do
		self.isPass[i] = tonumber(base[i])
	end
end
--上阵
function FengYunLuManager:GoIntoBattle(roid,pos)
	showLoading();
	sendMsg = {self.day , roid , pos}
	TFDirector:send(c2s.GO_INTO_BATTLE,sendMsg)
end
-- 换位置
function FengYunLuManager:ChangePos(oldPos,newPos)
	showLoading();
	sendMsg = {self.day,oldPos,newPos}
	TFDirector:send(c2s.CHANGE_WAR_SIDE,sendMsg)
end
--下阵
function FengYunLuManager:OutBattle(roid)
	showLoading();
	sendMsg = {self.day,roid}
	TFDirector:send(c2s.OFF_WAR_SIDE,sendMsg)
end
--返回上阵人数
function FengYunLuManager:getMyRoleListUpNum()
	local num = 0
	for i = 1,9 do 
		if self.MyRoleList[i] and self.MyRoleList[i] ~= 0 then
			num = num + 1
		end
	end
	return num 
end

--打架啊啊啊啊啊
function FengYunLuManager:ChallengeCopy()
	TFDirector:send(c2s.CHALLENGE_COPY,{self.day})
end
--判断是否上阵
function FengYunLuManager:getisUpByroleid(roleid)
	local id = FYRecordData:getidByRoleId(roleid)
	for i =1, 9 do 
		if self.MyRoleList[i] == id then
			return true
		end
	end
	return false
end

function FengYunLuManager:getMyRoleList()
	return self.MyRoleList
end

function FengYunLuManager:getAllRoleList()
	return self.AllRoleList
end

function FengYunLuManager:GetrefreshCount()
	return self.refreshCount
end

function FengYunLuManager:getRoleByRoleIdinAllList(roleid)
	if roleId then
		for i = 1, #self.AllRoleList do
			if self.AllRoleList[i].role_id == roleId then
				return self.AllRoleList[i]
			end
		end
	end
	return nil
end
function FengYunLuManager:getRoleIndexByRoleidinMyList(roleid)
	if roleid then
		for i = 1, #self.MyRoleList do
			if self.MyRoleList[i] == roleid then
				return i
			end
		end
	end
	return nil
end
function FengYunLuManager:sortAllRoleList()

	if (#self.AllRoleList > 1) then
		table.sort(self.AllRoleList, function ( a, b )
				if (a and b) then
	            	return a.quality > b.quality
	            end
	    end)
	end
end
function FengYunLuManager:updateAttribute(id,roleid,skill,passive_skill,skill2,attr)
	local list = string.split(passive_skill, ",")
	local jineng = {}
	jineng[1] = SkillLevelData:getInfoBySkillAndLevel(skill,150)
	jineng[2] = SkillLevelData:getInfoBySkillAndLevel(tonumber(list[1]),150)
	jineng[3] = SkillLevelData:getInfoBySkillAndLevel(tonumber(list[2]),150)
	jineng[4] = SkillLevelData:getInfoBySkillAndLevel(skill2,150)
	for i =1 , 4 do
		if jineng[i]  then
			if (jineng[i].attr_add) ~= nil then
				for k,v in pairs(jineng[i].attr_add) do
					if k < 18 then
						attr[k] = attr[k] or 0
						if v > 0 then
							attr[k] = attr[k] + v 
						end
					else
						attr[k-17] = attr[k-17] or 0
						if v > 0 then
							attr[k-17] = math.ceil(attr[k-17] *(1 + v/10000))
						end
					end
				end
			end
		end 
	end
	for i =1,9 do
		if self.MyRoleList[i] == id then
			local fateArray =  RoleFateData:getRoleFateById(roleid)
			for _,v in ipairs(fateArray.m_list) do
				local targetList = v:gettarget()
				if targetList[1].fateType == 1 then
					for e =1,9 do 
						if targetList[1].fateId == self.MyRoleListInRoleid[e] then
							local k , v = v:getAttr()
							if k > 17 then
								attr[k-17] = attr[k-17] or 0
	 							attr[k-17] = math.ceil(attr[k-17] *(1 + v/10000))
	 						elseif k == 17 then
	 							--命中
	 							attr[14] = attr[14] or 0
	 							attr[14] = math.ceil(attr[14] *(1 + v/10000))
	 						elseif k == 16 then
	 							--暴击
	 							attr[12] = attr[12] or 0
	 							attr[12] = math.ceil(attr[12] *(1 + v/10000))
	 						end
						end
					end
				end
			end
		end
	end
	return attr
end
return FengYunLuManager:new()