-- client side ResYesterdayManager.lua
--[[
 * @Description: 回购
 ]]
-- script writer Stephen.tao
-- creation time 2016-08-25

local ResYesterdayManager = class("ResYesterdayManager")

local ResYesterdayData = require("lua.table.t_s_resource_yesterday.lua")

function ResYesterdayManager:ctor()
	self:RegisterEvents()
	self.buyResList = TFArray:new()
	self:restart()
end

function ResYesterdayManager:restart()
	self.buyResList:clear()
	-- for i=1,5 do
	-- 	local tab = {id = i ,value = math.ceil(100/i) , isBuy = 0}
	-- 	self.buyResList:pushBack(tab)
	-- end
end



function ResYesterdayManager:RegisterEvents()
	TFDirector:addProto(s2c.SINGLE_RES_REPONSE, self, self.SingleResReponseHandle)
	TFDirector:addProto(s2c.ALL_RES_REPONSE, self, self.AllResReponseHandle)
end

function ResYesterdayManager:openBuyResLayer()
	local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.task.DailyTaskLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
	layer:loadData(1)
	layer.name = "lua.logic.task.DailyTaskLayer"
	AlertManager:show()
end


function ResYesterdayManager:SingleResReponseHandle(event)
	hideAllLoading()
	local data = event.data
	local singleRes = data.data
	for v in self.buyResList:iterator() do
		if v and v.id == singleRes.id then
			v.value = singleRes.value
			v.isBuy = singleRes.isBuy
			if singleRes.isBuy == 1 or singleRes.value == 0 then
				self.buyResList:removeObject(v)
				local resInfo = ResYesterdayData:objectByID(singleRes.id)
				if resInfo and resInfo.type == 100 then
					NorthClimbManager.needGetInfo = true
				end
			end
			self:RefreshTaskLayer()
			return
		end
	end
end

 function ResYesterdayManager:AllResReponseHandle(event)
 	self.buyResList:clear()
	local data = event.data
	-- print("AllResReponseHandle===->>>",data)
	if data.data == nil then
		return
	end
	for i=1,#data.data do
		local singleRes = data.data[i]
		if  singleRes.isBuy == 0 and singleRes.value ~= 0 then
			local resInfo = ResYesterdayData:objectByID(singleRes.id)
			if resInfo and resInfo.is_show == 1 then
				self.buyResList:pushBack(singleRes)
			end
		end
	end
 end

function ResYesterdayManager:RemoveRes(resID)
	for v in self.buyResList:iterator() do
		if v and v.id == resID then
			self.buyResList:removeObject(v)
			return
		end
	end
end

function ResYesterdayManager:GetTaskNum()
	return self.buyResList:length()
end

function ResYesterdayManager:getResInfoById(id)
	return ResYesterdayData:objectByID(id)
end
function ResYesterdayManager:RefreshTaskLayer()
	local taskLayer = AlertManager:getLayerByName("lua.logic.task.DailyTaskLayer")
	if taskLayer ~= nil then
		taskLayer:RefreshUI()
	end
end

function ResYesterdayManager:buyResRequest(index)
	local singleRes = self.buyResList:getObjectAt(index)
	if singleRes then
		showLoading()
		TFDirector:send(c2s.BUY_RES_REQUEST ,{singleRes.id})
	end
end
--红点判断逻辑
--是否该任务已完成
function ResYesterdayManager:isCanGetReward(id)
	for v in self.buyResList:iterator() do
		if v and v.id == id then
			return v.isBuy == 1
		end
	end
	return false
end

return ResYesterdayManager:new()