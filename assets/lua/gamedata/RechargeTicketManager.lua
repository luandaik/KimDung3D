-- client side RechargeTicketManager.lua
--[[
 * @Description: 充值赠券
 ]]
-- script writer wuqi
-- creation time 2016-08-17

local RechargeTicketManager = class("RechargeTicketManager", TFArray)

local RechargeTicket = require('lua.gamedata.base.RechargeTicket')
local RechargeData = require("lua.table.t_s_recharge")

RechargeTicketManager.RECHARGE_TICKET_INFO_RESPONSE = "RechargeTicketManager.RECHARGE_TICKET_INFO_RESPONSE"
RechargeTicketManager.RECHARGE_TICKET_CHANGE_RESPONSE = "RechargeTicketManager.RECHARGE_TICKET_CHANGE_RESPONSE"

RechargeTicketManager.EnumChangeType = 
{
    ADD = 1,
    DELETE = 2
}

RechargeTicketManager.EnumUseType = 
{
    UN_USABLE = 0,
    TODAY = 1,
    TOMORROW = 2
}

function RechargeTicketManager:ctor()
    self.map = {}
    self.super.ctor(self)
    --登陆获得充值赠券
    TFDirector:addProto(s2c.RECHARGE_TICKET_INFO_RESPONSE, self, self.onRechargeTicketGet)
    --添加或删除充值赠券
    TFDirector:addProto(s2c.RECHARGE_TICKET_CHANGE_RESPONSE, self, self.onRechargeTicketChange)   
end 

function RechargeTicketManager:restart()
    self.map = {}

    for v in self:iterator() do
        v:dispose()
    end
    self:clear()
end

function RechargeTicketManager:onRechargeTicketGet(event)
    local data = event.data or {}
    print("RechargeTicketManager:onRechargeTicketGet >>> ", data)

    self:restart()
    local ticketList = data.rechargeTicketInfo or {}

    for k, v in pairs(ticketList) do
        self:addTicket(v)
    end
end

function RechargeTicketManager:onRechargeTicketChange(event)
    local data = event.data or {}
    print("RechargeTicketManager:onRechargeTicketChange >>> ", data)

    local type = data.type or 0
    local ticketList = data.rechargeTicketInfo or {}
    if type == self.EnumChangeType.ADD then
        for k, v in pairs(ticketList) do
            self:addTicket(v)
        end
    elseif type == self.EnumChangeType.DELETE then
        for k, v in pairs(ticketList) do
            local gmId = v.instanceId or -1
            self:deleteTicketByGmId(gmId)
        end
    end
    TFDirector:dispatchGlobalEventWith(self.RECHARGE_TICKET_CHANGE_RESPONSE, data)
end

function RechargeTicketManager:addTicket(data)
    if not data then
        return
    end
    local ticket = RechargeTicket:new(data.templateId)
    ticket:setGmId(data.instanceId)
    ticket:setCreateTime(data.createTime)
    ticket:setEndTime(data.endTime)
    self.super.push(self, ticket)
end
   
function RechargeTicketManager:deleteTicketByGmId(gmId)
    for v in self:iterator() do
        if v.gmId == gmId then
            self:removeObject(v)
            v:dispose()
            v = nil
        end
    end
    self:refreshList()
end

--刷新赠券状态
function RechargeTicketManager:refreshList()
    local toDeleteList = {}
    for v in self:iterator() do
        local tickType = v:getUseType()
        v:setUseType(tickType)
        if tickType == self.EnumUseType.UN_USABLE then
            table.insert(toDeleteList, v)
        end
    end
    for k, v in pairs(toDeleteList) do
        self:deleteTicketByGmId( v.gmId )
    end
end

function RechargeTicketManager:resetAnotherDay()
    --[[
    for v in self:iterator() do
        v.useType = math.max(v.useType - 1, 0)
    end
    ]]
    self:refreshList()
end

--每一档可获得的券
function RechargeTicketManager:getTicketByIndex(index)
    if index >= 7 then
        index = index + 1
    end
    local data = RechargeData:objectByID(index)
    local needSycee = data.sycee
    local tab = {}
    for v in self:iterator() do
        if v.useType == self.EnumUseType.TODAY and v.sycee == needSycee then
            table.insert(tab, v)
        end
    end
    table.sort(tab, function(a, b)
        return a.sycee > b.sycee
    end)
    return tab[1]
end

function RechargeTicketManager:getListByType(selectType)
    self:refreshList()
    selectType = selectType or 0
    local arr = TFArray:new()
    for v in self:iterator() do
        if selectType == v.useType then
            arr:push(v)
        end
    end

    return arr
end

function RechargeTicketManager:getBagLayerNeedData(arr, index)
    local tab = {}
    local count = 0
    for v in arr:iterator() do
        if v.config and v.config.recharge_id == index then
            count = count + 1
        end
    end
    tab.num = count
    return tab
end

function RechargeTicketManager:openTicketLayer()
    local layer = require("lua.logic.pay.TicketBagLayer"):new()
    AlertManager:addLayer(layer)
    AlertManager:show()
end

function RechargeTicketManager:haveTodayUse()
    local arr = self:getListByType(self.EnumUseType.TODAY)
    if arr:length() > 0 then
        return true
    end
    return false
end

return RechargeTicketManager:new()