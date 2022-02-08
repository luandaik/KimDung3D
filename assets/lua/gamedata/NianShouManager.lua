--[[
 * @Author: Catcher 
 * @Date: 2018-01-15 
 * @Description: 年兽数据管理
 ]]

local NianShouManager = class("NianShouManager") 

NianShouManager.UpdateRedPoint = "NianShouManager.UpdateRedPoint"
NianShouManager.AddMoneyData = "NianShouManager.AddMoneyData"
NianShouManager.RemoveMoneyData = "NianShouManager.RemoveMoneyData"
NianShouManager.RemovBeastData = "NianShouManager.RemovBeastData"
NianShouManager.refreshBeastListData = "NianShouManager.refreshBeastListData"

-- 年兽逃跑弹窗状态
NianShouManager.BeastStage_1 = 1    -- 年兽赶到别人底盘上去了，第一时间通知自己的弹窗
NianShouManager.BeastStage_2 = 2    -- 年兽赶到别人底盘上去了，自己点击赶走年兽列表的弹窗
NianShouManager.BeastStage_3 = 3    -- 年兽逃跑了

NianShouManager.layerBuffer = {
    "lua.logic.nianshou.NianShouMainLayer",
    "lua.logic.nianshou.NianShouTanChuLayer"
}

function NianShouManager:ctor( ... )
    -- 打开年兽主界面
    TFDirector:addProto(s2c.OPEN_DRIVE_BEAST_INFO, self, self.receiveopenNianShouMainLayer)
    -- 打年兽
    TFDirector:addProto(s2c.DRIVE_BEAST, self, self.receivedaNianShou)
    -- 点元宝
    TFDirector:addProto(s2c.DRAW_BEAST_MONEY, self,self.receiveMoney)
    -- 刷新年兽数据
    TFDirector:addProto(s2c.RERESH_DRIVE_BEAST_INFO, self, self.receiveBeastData)
    -- 赶年兽红点
    TFDirector:addProto(s2c.SEND_BEAST_RED_POINT, self, self.receiveRedPoint)
    
    self.beastRedPoint = false
end

-- 请求打开年兽主界面
function NianShouManager:requestOpenNianShouMainLayer()
    -- 活动是否开启
    if self:activityOpenBool() == false then
        toastMessage(localizable.Nainshou_NotOpen)
        return 
    end
    showLoading()
    TFDirector:send(c2s.OPEN_DRIVE_BEAST_INFO,{})
end

-- 请求打年兽
function NianShouManager:requestDaNianShou(BeastId)
    showLoading()
    local msg ={BeastId}
    TFDirector:send(c2s.DRIVE_BEAST, msg)
end

-- 请求刷新新的年兽
function NianShouManager:requestRefreshBeast()
    showLoading()
    local msg ={}
    TFDirector:send(c2s.REFRESH_NEXT_BEAST, msg)
end

-- 请求点元宝
function NianShouManager:requestMoney(index)
    showLoading()
    local msg = {index}
    TFDirector:send(c2s.DRAW_BEAST_MONEY, msg)
end

-- 打开年兽主界面
function NianShouManager:receiveopenNianShouMainLayer(event)
    hideLoading()
    local data = event.data
    self:refreshBeastData(data)
    self:openNianShouMainLayer(data)
end

-- 打年兽反馈（添加元宝图标）
function NianShouManager:receivedaNianShou(event)
    hideLoading()
    local data = event.data
    local length = #self.dropMoneyList
    table.insert(self.dropMoneyList,length+1,data)
    TFDirector:dispatchGlobalEventWith(NianShouManager.AddMoneyData, data)
end

-- 点元宝反馈
function NianShouManager:receiveMoney(event)
    hideLoading()
    if event.data then
        TFDirector:dispatchGlobalEventWith(NianShouManager.RemoveMoneyData, {})
    end
end

-- 打开年兽赶走界面
function NianShouManager:receiveBeastData(event)
    hideLoading()
    local data = event.data
    self:refreshBeastData(data)
    if self.drivingBeastData then
        data.remveType = 1
    elseif self.escapeBeastData then
        data.remveType = 3
    end
    self.refreshData = data
    if data.remveType then
        TFDirector:dispatchGlobalEventWith(NianShouManager.RemovBeastData,data)
    else
        TFDirector:dispatchGlobalEventWith(NianShouManager.refreshBeastListData,data)
    end
end

-- 刷新年兽数据界面
function NianShouManager:refreshNianShouMainLayer()
    local data = self.refreshData
    TFDirector:dispatchGlobalEventWith(NianShouManager.refreshBeastListData,data)
end


-- 获得赶年兽红点
function NianShouManager:receiveRedPoint(event)
    hideLoading()
    local data = event.data
    if data.have == 1 then
        self.beastRedPoint = true
    else
        self.beastRedPoint = false
    end
    TFDirector:dispatchGlobalEventWith(NianShouManager.UpdateRedPoint, {})
end


-- 打开年兽主界面
function NianShouManager:openNianShouMainLayer(data)
    local layer = AlertManager:addLayerByFile("lua.logic.nianshou.NianShouMainLayer")
    layer:setInfo(data)
    AlertManager:show()
end

-- 打开年兽赶走界面
function NianShouManager:openNianShouTanChuLayer(flag,index)
    local data
    if flag == NianShouManager.BeastStage_1 then
        data = self.drivingBeastData
        if data.round == 2 then 
            data.showName = data.toName
            data.showIcon = data.toIcon
        elseif data.round == 3 then
            data.showName = data.name
            data.showIcon = data.icon
        end
    elseif flag == NianShouManager.BeastStage_2 then
        data = self.waitBeastList[index];
        if data.round == 2 then 
            data.showName = data.toName
            data.showIcon = data.toIcon
        elseif data.round == 3 then
            data.showName = data.name
            data.showIcon = data.icon
        end
    elseif flag == NianShouManager.BeastStage_3 then
        data = self.escapeBeastData
    end
    data.flag = flag;

    local layer = require("lua.logic.nianshou.NianShouTanChuLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:setInfo(data)
    AlertManager:show()
end

-- 强制退出年兽所有界面，结束年兽活动
function NianShouManager:clossAllLayer()
    for k,v in pairs(self.layerBuffer) do
        layerExsit = AlertManager:getLayerByName(v)
        if layerExsit then
            AlertManager:closeAllToLayer(layerExsit)
        end
    end
end

--  刷新活动时间
function NianShouManager:refreshTime()
    self.activityInfo = OperationActivitiesManager:getActivityInfoByType(OperationActivitiesManager.Type_NianShou)
    if self.activityInfo then
        self.activityBeginTime = self.activityInfo.beginTime 
        self.activityEndTime = self.activityInfo.endTime
        local activityBeginTime = GetCorrectDate("*t", self.activityBeginTime)
        local activityEndTime = GetCorrectDate("*t", self.activityEndTime)
        self.everyDayBeginTime = activityBeginTime.hour
        self.everyDayEndTime = activityEndTime.hour
    end
end

-- 获得活动开启时间
function NianShouManager:getActivityBeginTime()
    return self.activityBeginTime
end

-- 获得活动结束时间
function NianShouManager:getActivityEndTime()
    return self.activityEndTime
end

-- 年兽活动开启时间
function NianShouManager:activityOpenBool(flag)
    self:refreshTime()
    --活动数据不存在，活动不开启或者或数据不对，活动也不开启
    if self.activityInfo == nil or self.activityBeginTime == nil or self.activityEndTime == nil then
        return false
    end
    --不在活动时间，活动不开启
    local nowTime = MainPlayer:getNowtime()
    if nowTime > self.activityBeginTime and nowTime < self.activityEndTime then
        if flag then
            return true
        end
        local nowTimeData = GetCorrectDate("*t", nowTime)
        if nowTimeData.hour >= self.everyDayBeginTime and nowTimeData.hour < self.everyDayEndTime then
            return true
        end
    end
    return false
end

-- 刷新年兽界面相关信息
--[[
    年兽数据判断说明：
    前提说明：1.年兽信息与两个玩家有关（在有帮派的情况下），一个是生成年兽的玩家A，一个是年兽被驱赶到的玩家B，
            2.由于年兽赶走或者逃跑，年兽信息是会同时推给A和B，
    具体判断情况，一般情况下，玩家获得的年兽(Beast)信息列表中的Beast.isEscape = 0,
    这种情况下，年兽分为可驱赶的年兽列表（playBeastList）和已驱赶走的年兽列表（waitBeastList）。
    <1>第一次赶走年兽的情况下：在玩家A将自己的年兽（Beast），驱赶到玩家B的地盘时，
    玩家A与玩家B同时会获得年兽（Beast）刷新信息，其中年兽信息为：
    Beast.isEscape = 1,
    Beast.player = A.playId
    Beast.toPlayer = B.playId
    Beast.round = 2
    此时该年兽对于A而言，数据从playBeastList移到waitBeastList，
    对于B而言，数据添加到playBeastList。
    <2>第二次赶走年兽的情况下：在玩家B将年兽（Beast），驱赶回玩家A的地盘时，
    玩家A与玩家B同时会获得年兽（Beast）刷新信息，其中年兽信息为：
    Beast.isEscape = 1,
    Beast.player = A.playId
    Beast.toPlayer = B.playId
    Beast.round = 3
    此时该年兽对于A而言，数据从waitBeastList移到playBeastList，
    对于B而言，数据从playBeastList移到waitBeastList。
    <3>第三次赶走年兽的情况下：在玩家A将年兽（Beast）赶跑了
    玩家A与玩家B同时会获得年兽（Beast）刷新信息，其中年兽信息为：
    Beast.isEscape = 2,
    Beast.player = A.playId
    Beast.toPlayer = B.playId
    Beast.round = 3
    此时该年兽对于A而言，数据从playBeastList移除，
    对于B而言，数据从waitBeastList移除。
]]
function NianShouManager:refreshBeastData(data)
    local playBeastList = {}
    local waitBeastList = {}
    self.playBeastList = {}
    self.waitBeastList = {}
    self.dropMoneyList = {}
    self.drivingBeastData = nil
    self.escapeBeastData = nil
    self.BeastDataList = data.infos
    local playerId = MainPlayer:getPlayerId()
    if data.infos and next(data.infos) ~= nil then
        for i, v in pairs(data.infos) do
            local playId = MainPlayer:getPlayerId()
            if v.isEscape == 1 and playId == v.player and v.round == 2 then
                self.drivingBeastData = v
                table.insert(waitBeastList, v)
            elseif v.isEscape == 1 and playId == v.toPlayer and v.round == 2 then
                table.insert(playBeastList, v)
            elseif v.isEscape == 1 and playId == v.player and v.round == 3 then
                table.insert(playBeastList, v)
            elseif v.isEscape == 1 and playId == v.toPlayer and v.round == 3 then
                self.drivingBeastData = v
                table.insert(waitBeastList, v)
            elseif v.isEscape == 2 and playId == v.player and v.round == 3 then
                self.escapeBeastData = v
            elseif v.isEscape == 2 and playId == v.toPlayer and v.round == 3 then
                -- table.insert(waitBeastList, v)
            elseif v.isEscape == 2 and v.toPlayer == 0 and v.round == 2 then
                -- table.insert(waitBeastList, v)
                self.escapeBeastData = v
            else
                if (v.toPlayer ~= playerId and v.round == 2) or (v.toPlayer == playerId and v.round == 3) then
                    table.insert(waitBeastList, v)
                else
                    table.insert(playBeastList, v)
                end
            end
        end
    end
    self:refreshWaitBeastData(waitBeastList)
    self:refreshPlayBeastData(playBeastList)
    if data.dropMoney and next(data.dropMoney) then
        for i, v in pairs(data.dropMoney) do
            table.insert(self.dropMoneyList,i, v)
        end
    end
end

-- 刷新赶走年兽的数据
function NianShouManager:refreshWaitBeastData(data)
    local data = data or self.waitBeastList
    self.waitBeastList = {}
    if data or next(data) ~= nil then
        local index = 1 
        for i,v in pairs(data) do
            local otherRefreshTimer = ConstantData:getValue('MonsterNian.Others.TimeLimitation')
            local leftTime = v.refreshTime/1000 + otherRefreshTimer - MainPlayer:getNowtime()
            if leftTime > 0 then
                v.leftTime = leftTime
                if v.round == 2 then 
                    v.showIcon = v.toIcon
                elseif v.round == 3 then
                    v.showIcon = v.icon
                end
                local role = RoleData:objectByID(v.showIcon)
                local path
                if role then
                    path = role:getIconPath()
                end
                v.path = path
                v.index = index 
                table.insert(self.waitBeastList, index,v)
                index = index + 1
            end
        end
    end

    local function sortByTime(v1, v2)
		return v1.leftTime < v2.leftTime
	end
    table.sort(self.waitBeastList,sortByTime)

    local cnt = 1 
    for i, v in pairs(self.waitBeastList) do
        v.index = cnt
        cnt = cnt + 1
    end
end

-- 刷新可赶年兽的数据
function NianShouManager:refreshPlayBeastData(data)
    local data = data or self.playBeastList
    self.playBeastList = {}
    
    if data or next(data) ~= nil then
        local index = 1 
        for i,v in pairs(data) do
            if v.round == 1 then
                table.insert(self.playBeastList, index,v)
                index = index + 1
            else 
                local otherRefreshTimer = ConstantData:getValue('MonsterNian.Others.TimeLimitation')
                local leftTime = v.refreshTime/1000 + otherRefreshTimer - MainPlayer:getNowtime()
                if leftTime > 0 then
                    v.leftTime = leftTime
                    v.index = index 
                    table.insert(self.playBeastList, index,v)
                    index = index + 1
                end
            end
        end
    end

    local function sortByTime(v1, v2)
		return v1.refreshTime < v2.refreshTime
	end
    table.sort(self.playBeastList,sortByTime)
end

-- 获得可打的年兽
function NianShouManager:getplayBeastList()
    return self.playBeastList
end

-- 获得赶走的年兽
function NianShouManager:getwaitBeastList()
    return self.waitBeastList
end

-- 获得掉落的金钱
function NianShouManager:getdropMoneyList()
    return self.dropMoneyList
end

-- 获得年兽红点状态
function NianShouManager:getBeastRedPoint()
    return self.beastRedPoint
end

return NianShouManager:new() 