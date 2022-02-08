--[[
 * @Date: 2018-01-25 
 * @Description: 打年兽数据管理
 ]]

local DaNianShouManager = class("DaNianShouManager") 

DaNianShouManager.UpdateRedPoint = "DaNianShouManager.UpdateRedPoint"
DaNianShouManager.AddMoneyData = "DaNianShouManager.AddMoneyData"
DaNianShouManager.RemoveMoneyData = "DaNianShouManager.RemoveMoneyData"
DaNianShouManager.RemovBeastData = "DaNianShouManager.RemovBeastData"
DaNianShouManager.refreshBeastData = "DaNianShouManager.refreshBeastData"
DaNianShouManager.AttackReceive = "DaNianShouManager.AttackReceive"
DaNianShouManager.receiverefresh = "DaNianShouManager.receiverefresh"
DaNianShouManager.receivePick = "DaNianShouManager.receivePick"
DaNianShouManager.receiveLayer = "DaNianShouManager.receiveLayer"

-- 年兽逃跑弹窗状态
DaNianShouManager.BeastStage_1 = 1    -- 年兽赶到别人底盘上去了，第一时间通知自己的弹窗
DaNianShouManager.BeastStage_2 = 2    -- 年兽赶到别人底盘上去了，自己点击赶走年兽列表的弹窗
DaNianShouManager.BeastStage_3 = 3    -- 年兽逃跑了

DaNianShouManager.layerBuffer = {
    "lua.logic.nianshou.NianShouMainLayer",
    "lua.logic.nianshou.NianShouTanChuLayer"
}

function DaNianShouManager:ctor( ... )
    -- 打开年兽主界面
    TFDirector:addProto(s2c.OPEN_WORLD_BEAST, self, self.receiveopenNianShouMainLayer)
    -- 打年兽
    TFDirector:addProto(s2c.DRIVE_WORLD_BEAST, self, self.receivedaNianShou)
    --刷新排行
    TFDirector:addProto(s2c.SEND_WORLD_BEAST_RANK, self, self.receiverefresh)
    -- 点箱子
    TFDirector:addProto(s2c.DRAW_DROP_GOODS, self,self.receivePick)
    -- 刷新年兽数据
    TFDirector:addProto(s2c.REFRESH_WORLD_BEAST, self, self.receiveLayer)
    -- 历史记录
    TFDirector:addProto(s2c.SEND_HISTORY, self, self.receiveHistory)
    
    self.beastRedPoint = false
    self.WorldBeastInfo = {}
    self.blood = 0
    self.lastRefreshTime = 0
end

function DaNianShouManager:receiverefresh(event)
    hideLoading()
    local data = event.data
    print("DaNianShouManager:receiverefresh",data)
    self.myRank = data.myRank
    self.myScore = data.myScore
    self.PaiMingInfo = event.data.infos
    -- table.insert(self.dropMoneyList,data.index,data)
    TFDirector:dispatchGlobalEventWith(DaNianShouManager.receiverefresh, data)
end
        
function DaNianShouManager:getPaiMingInfo()
    return self.PaiMingInfo or {}
end

function DaNianShouManager:getMyRank()
    return self.myRank
end

function DaNianShouManager:getMyScore()
    return self.myScore
end

-- 请求打开年兽主界面
function DaNianShouManager:requestOpenDaNianShouMainLayer()
    if self:activityOpenBool() == false then
        toastMessage(localizable.Nainshou_NotOpen)
        return 
    end
    showLoading()
    
    TFDirector:send(c2s.OPEN_WORLD_BEAST,{})

end

function DaNianShouManager:requestRefreshDaNianShouMainLayer()

    showLoading()
    
    TFDirector:send(c2s.REFRESH_WORLD_BEAST,{})

end

-- 请求打年兽
function DaNianShouManager:requestDaNianShou(BeastId)
    showLoading()
    local msg ={BeastId}
    TFDirector:send(c2s.DRIVE_BEAST, msg)
end

-- 请求刷新新的年兽
function DaNianShouManager:requestRefreshBeast()
    showLoading()
    local msg ={}
    TFDirector:send(c2s.REFRESH_NEXT_BEAST, msg)
end

-- 请求点元宝
function DaNianShouManager:requestPick(index)
    showLoading()
    local msg = {index}
    -- self.selectMoneyIndex = index
    print(msg)
    TFDirector:send(c2s.DRAW_DROP_GOODS, msg)
end

-- 打开年兽主界面
function DaNianShouManager:receiveopenNianShouMainLayer(event)
    hideLoading()
    self.WorldBeastInfo = event.data
    self.alldropGoods = event.data.dropGoods
    -- self:refreshBeastData(data)
    self:openNianShouMainLayer()
end

function DaNianShouManager:requireRankRefresh()
    showLoading()
    print("打年兽6109")
    TFDirector:send(c2s.SEND_WORLD_BEAST_RANK,{})
end

function DaNianShouManager:checkHistory()
    showLoading()
    TFDirector:send(c2s.SEND_HISTORY,{})
end

function DaNianShouManager:receiveHistory(event)
    hideLoading()    
    print("历史记录",event.data)
    self.hsitoryList = event.data.records
    self:openHistoryLayer()
end

function DaNianShouManager:getHistoryList()
    return self.hsitoryList or {}
end

function DaNianShouManager:getlastRefreshTime()
    return self.WorldBeastInfo.lastRefreshTime or 0
end

function DaNianShouManager:getblood()
    return self.WorldBeastInfo.blood or 0
end

function DaNianShouManager:getDropItem()
    return self.WorldBeastInfo.dropGoods
end

function DaNianShouManager:getAllDropItem()
    return self.alldropGoods
end

-- 打年兽反馈（添加元宝图标）
function DaNianShouManager:receivedaNianShou(event)
    hideLoading()
    local data = event.data
    print("返",data)
    self.WorldBeastInfo.blood = data.blood
    if data.dropGoods then
        self.WorldBeastInfo.dropGoods = data.dropGoods
    else
        self.WorldBeastInfo.dropGoods = {}
    end
    self.WorldBeastInfo.lastRefreshTime = data.lastRefreshTime or 0
    -- table.insert(self.dropMoneyList,data.index,data)
    TFDirector:dispatchGlobalEventWith(DaNianShouManager.AttackReceive, data)
end

-- 点元宝反馈
function DaNianShouManager:receivePick(event)
    hideLoading()
    -- if event.data then
        TFDirector:dispatchGlobalEventWith(DaNianShouManager.receivePick, {})
    -- end
end

-- 打开年兽赶走界面
function DaNianShouManager:receiveLayer(event)
    hideLoading()
    print("倒计时刷新",event.data)
    self.WorldBeastInfo.blood = event.data.blood
    self.WorldBeastInfo.lastRefreshTime = event.data.lastRefreshTime

    TFDirector:dispatchGlobalEventWith(DaNianShouManager.receiveLayer, {})
end

-- 打开年兽主界面
function DaNianShouManager:openNianShouMainLayer(data)   

    local layer = AlertManager:addLayerByFile("lua.logic.nianshou.DaNianShouMainLayer")
    -- layer:setInfo(data)
    AlertManager:show()
end

function DaNianShouManager:openHistoryLayer(data)
    
    local layer = AlertManager:addLayerByFile("lua.logic.nianshou.DaNianShouHistoryLayer")
    -- layer:setInfo(data)
    AlertManager:show()
end


-- 打开年兽赶走界面
function DaNianShouManager:openNianShouTanChuLayer(flag,index)
    local data
    if flag == DaNianShouManager.BeastStage_1 then
        data = self.drivingBeastData
        data.showName = data.toName
    elseif flag == DaNianShouManager.BeastStage_2 then
        data = self.waitBeastList[index];
        data.showName = data.toName
    elseif flag == DaNianShouManager.BeastStage_3 then
        data = self.escapeBeastData
    end
    data.flag = flag;

    local layer = require("lua.logic.nianshou.NianShouTanChuLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:setInfo(data)
    AlertManager:show()
end

-- 强制退出年兽所有界面，结束年兽活动
function DaNianShouManager:clossAllLayer()
    for k,v in pairs(self.layerBuffer) do
        layerExsit = AlertManager:getLayerByName(v)
        if layerExsit then
            AlertManager:closeAllToLayer(layerExsit)
        end
    end
end

--  刷新活动时间
function DaNianShouManager:refreshTime()
    self.activityInfo = OperationActivitiesManager:getActivityInfoByType(OperationActivitiesManager.Type_DaNianShou)
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
function DaNianShouManager:getActivityBeginTime()
    return self.activityBeginTime
end

-- 获得活动结束时间
function DaNianShouManager:getActivityEndTime()
    return self.activityEndTime
end

-- 年兽活动开启时间
function DaNianShouManager:activityOpenBool()
    self:refreshTime()
    -- print("--------------activityOpenBool:111111111111------------------",self.activityInfo)
    --活动数据不存在，活动不开启或者或数据不对，活动也不开启
    if self.activityInfo == nil or self.activityBeginTime == nil or self.activityEndTime == nil then
        return false
    end
    -- print("-------------activityOpenBool:22222222222222222222-------------------")
    --不在活动时间，活动不开启
    local nowTime = MainPlayer:getNowtime()
    if nowTime > self.activityBeginTime and nowTime < self.activityEndTime then
        local nowTimeData = GetCorrectDate("*t", nowTime)
        print("时间判断",nowTimeData.hour,self.everyDayBeginTime,self.everyDayEndTime)
        if nowTimeData.hour >= self.everyDayBeginTime and nowTimeData.hour < self.everyDayEndTime then
            return true
        end
    end
    -- print("----------activityOpenBool:3333333333333----------------------")
    return false
end

-- 获得掉落的金钱
function DaNianShouManager:getdropMoneyList()
    return self.dropMoneyList
end

-- 获得年兽红点状态
function DaNianShouManager:getBeastRedPoint()
    local info = {30432,30433}
    local num = 0
    for i=1,#info do
        num = num + BagManager:getItemNumById(info[i])
    end
    if self:activityOpenBool() == true then
        if num > 0 then
            return true
        end
    end
    return false
end

return DaNianShouManager:new() 