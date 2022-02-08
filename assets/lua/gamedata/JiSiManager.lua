--[[
******祭祀数据管理类*******
]]

local JiSiManager = class("JiSiManager")

local GameItem = require('lua.gamedata.base.GameItem')

local itemArray = TFArray:new()
JiSiManager.itemArray = itemArray

JiSiManager.ItemChange = "JiSiManager.ItemChange"
JiSiManager.StateChangeMessage = "JiSiManager.StateChangeMessage"
JiSiManager.TunShiMessage = "JiSiManager.TunShiMessage"
JiSiManager.PickUp = "JiSiManager.PickUp"

JiSiManager.JiSiMaxLevel = 5
JiSiManager.bagMaxNum = 60
function JiSiManager:ctor( Data )
    self.levelState = 0

    TFDirector:addProto(s2c.SACRIFICE_BY_TYPE_SUCCESS_NOTIFY, self, self.betByTypeSuccessNotify)
    TFDirector:addProto(s2c.BATCH_SACRIFICE_AUTO_SUCCESS_NOTIFY, self, self.batchBetAutoSuccessNotify)
    TFDirector:addProto(s2c.SACRIFICE_PICK_SUCCESS_NOTIFY, self, self.pickSuccessNotify)
    TFDirector:addProto(s2c.SACRIFICE_PICKUP_SUCCESS_NOTIFY, self, self.pickupSuccessNotify)
    TFDirector:addProto(s2c.SACRIFICE_MERGE_AUTO_SUCCESS_NOTIFY, self, self.mergeAutoSuccessNotify)
    TFDirector:addProto(s2c.SACRIFICE_ITEM_DETAILS, self, self.gamblingItemDetails)
    TFDirector:addProto(s2c.SACRIFICE_ITEM_CACHE_LIST, self, self.gamblingItemCacheList)
    TFDirector:addProto(s2c.SACRIFICE_STATE_DETAILS, self, self.gamblingStateDetails)
    TFDirector:addProto(s2c.RESPONSE_LING_QI_TIME, self, self.everydayQiData)
    TFDirector:addProto(s2c.RESPONSE_REWARD_LIST, self, self.pickUpAllGamble)
    

    self.zhenxuan_cost_tip = false
    self.zhenxuan_cost_token_tip = false
    self.JiSi_cost_tip = {}
    self.JiSi_cost_token_tip = {}
    for i=1,JiSiManager.JiSiMaxLevel do
        self.JiSi_cost_tip[i] = false
        self.JiSi_cost_token_tip[i] = false
    end
    self.batchBetAuto = false
    self.batchBetAutoCount = 0
end

--背包清零
function JiSiManager:restart()
    JiSiManager.itemArray:clear()


    self.zhenxuan_cost_tip = false
    self.zhenxuan_cost_token_tip = false
    self.JiSi_cost_tip = {}
    self.JiSi_cost_token_tip = {}
    for i=1,JiSiManager.JiSiMaxLevel do
        self.JiSi_cost_tip[i] = false
        self.JiSi_cost_token_tip[i] = false
    end
    self.batchBetAuto = false
    self.levelState = 0
    self.batchBetAutoCount = 0
end



function JiSiManager:getStateByIndex(index )
    local flag = bit_and(self.levelState,2^(index-1))
    if flag == 0 then
        return false
    end
    return true
end

--背包销毁
function JiSiManager:dispose()

    JiSiManager.itemArray = nil
end


--获取背包道具的数量
function JiSiManager:getBagNum()
    return JiSiManager.itemArray:length()
end

--通过当前顺序index获得道具
function JiSiManager:getItemByIndex( index )
    return itemArray:getObjectAt(index)
end

function JiSiManager:getItemNumById( id )
    local item = self:getItemById(id);
    if not item then
        return 0;
    end
    return item.num
end

--[[
    --增加道具
]]
function JiSiManager:addItem( item )
    if item==nil then
        return
    end
    for v in itemArray:iterator() do
        if v.id == item then
            v.num = v.num + item.num
            return
        end
    end
    itemArray:pushBack(item)
end

--[[
    --通过id获得背包道具信息
    --@返回道具
]]
function JiSiManager:getItemById( id )
    --print("getItem by : ",id)
    for v in itemArray:iterator() do
        if v.id == id then
            return v
        end
    end
end
--[[
    --通过id及个数删除背包物品
]]
function JiSiManager:changeItemById( id , num)
    for v in itemArray:iterator() do
        if v.id == id then
            if v.num + num  > 0 then
                v.num = v.num + num
            else
                itemArray:removeObject(v)
                return
            end
        end
    end
end

--[[
    --通过id及个数删除背包物品
]]
function JiSiManager:delItemByid( id)
    for v in itemArray:iterator() do
        if v.id == id then
            itemArray:removeObject(v)
            return
        end
    end   
end

function JiSiManager:isBagFull()
    return JiSiManager.itemArray:length() >= JiSiManager.bagMaxNum
end


--请求祭祀
function JiSiManager:requestBetByType(type)
    showLoading()
    -- if type >= 4 then
    --  MainPlayer:addVipRuleTimeByCode( 8101+type-4 , 1 )
    -- end
    TFDirector:send(c2s.REQUEST_SACRIFICE_BY_TYPE ,{2^(type-1)})
end

--一键祭祀
function JiSiManager:requestBatchBetAuto(count,bool)
    showLoading()
    if count == nil then
        count = 0
    end
    TFDirector:send(c2s.REQUEST_BATCH_SACRIFICE_AUTO ,{count,bool})
end

--一键吞噬
function JiSiManager:requestMergAuto()
    -- showLoading()
    TFDirector:send(c2s.REQUEST_SACRIFICE_MERGE_AUTO ,{})
end

--檀香炉
function JiSiManager:requestPick()
    showLoading()
    TFDirector:send(c2s.REQUEST_SACRIFICE_PICK ,{})
end

--拾取
function JiSiManager:requestPickup(index)
    showLoading()
    if index == nil then
        index = 0
    end
    TFDirector:send(c2s.REQUEST_SACRIFICE_PICKUP ,{index})
end

--一键拾取
function JiSiManager:pickUpAllGamble(event)
    hideLoading()
    local data = event.data
    TFDirector:dispatchGlobalEventWith(JiSiManager.PickUp,{data}); 
end

--一键合成
function JiSiManager:requestMergeAuto()
    showLoading()
    TFDirector:send(c2s.REQUEST_SACRIFICE_MERGE_AUTO ,{})
end

--祭祀操作成功通知
function JiSiManager:betByTypeSuccessNotify(event)
    hideLoading()
    local data = event.data
    TFDirector:dispatchGlobalEventWith(JiSiManager.StateChangeMessage,{}); 
end
--一键祭祀操作成功通知
function JiSiManager:batchBetAutoSuccessNotify(event)
    hideLoading()
    local data = event.data
    self.batchBetAutoCount = data.count  --自动祭祀次数。0表示服务器控制
end

--甄选操作成功通知
function JiSiManager:pickSuccessNotify(event)
    hideLoading()
end

--拾取操作成功通知
function JiSiManager:pickupSuccessNotify(event)
    print("JiSiManager:PICKUP_SUCCESS_NOTIFY--->")
    hideLoading()
    local data = event.data
    local index = data.index
    if index == 0 then
        itemArray:clear()
    else
        itemArray:removeObjectAt(index)
    end
    if not self.batchBetAuto then
        TFDirector:dispatchGlobalEventWith(JiSiManager.ItemChange,{0})
    end
end
--一键合成操作成功通知
function JiSiManager:mergeAutoSuccessNotify(event)
    hideLoading()
    TFDirector:dispatchGlobalEventWith(JiSiManager.TunShiMessage,{})
end



--[[
//祭祀结果条目详情，单独发送为新增条目
// code = 0x5805
message GamblingItemDetails
{
    required int32 index = 1;           //索引，1~N
    required int32 resType = 2;         //资源类型
    required int32 resId = 3;           //资源ID
    required int32 resNum = 4;          //资源数量
    required int64 createTime = 5;      //创建时间，单位/秒
    required int64 lastUpdate = 6;      //最后更新时间,单位/秒
}
]]
--祭祀结果条目详情，单独发送为新增条目
function JiSiManager:gamblingItemDetails(event)
    hideLoading()
    local data = event.data
    local index = data.index
    local info = itemArray:getObjectAt(index)
    print(data)
    if info == nil then
        itemArray:push(data)
    else
        info = data
    end
    TFDirector:dispatchGlobalEventWith(JiSiManager.ItemChange,{1})
end

--祭祀结果条目详情，单独发送为新增条目
function JiSiManager:gamblingItemCacheList(event)
    print("JiSiManager:gamblingItemCacheList--->")
    hideLoading()
    local data = event.data
    local num = itemArray:length()
    itemArray:clear()
    if data.item then
        for i=1,#data.item do
            local info = data.item[i]
            itemArray:push(info)
        end
    end
    num = itemArray:length() - num
    num = math.max(0,num)
    TFDirector:dispatchGlobalEventWith(JiSiManager.ItemChange,{num})
end

--祭祀状态详情
function JiSiManager:gamblingStateDetails(event)
    hideLoading()
    local data = event.data
    self.levelState = data.enableType
    self.betToday = data.betToday
    self.betTotal = data.betTotal
    self.lastUpdate = data.lastUpdate
    TFDirector:dispatchGlobalEventWith(JiSiManager.StateChangeMessage,{}); 
end

--每日灵气领取时间
function JiSiManager:everydayQiData(event)
    hideLoading()
    -- local beginTimeData = GetCorrectDate("*t", event.data.lastGetTime * 0.001)
    self.everyDayGetTime = event.data.lastGetTime
    TFDirector:dispatchGlobalEventWith(JiSiManager.StateChangeMessage,{})
end

--祭祀状态详情
function JiSiManager:openJiSiMainLayer()
    local openLevel = FunctionOpenConfigure:getOpenLevel(909)
    if MainPlayer:getLevel() < openLevel then
        toastMessage(stringUtils.format(localizable.common_function_openlevel,openLevel))
        return
    end

    AlertManager:addLayerByFile("lua.logic.qiyu.JiSiMainLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_0);
    AlertManager:show();
end

--每日灵气领取
function JiSiManager:requestEveryDayQi()
    showLoading()
    TFDirector:send(c2s.REQUEST_GET_LING_QI,{})
end

return JiSiManager:new()
