-- client side RechargeTicket.lua
--[[
 * @Description: 充值赠券
 ]]
-- script writer wuqi
-- creation time 2016-08-17

local GameObject = require('lua.gamedata.base.GameObject')
local RechargeTicket = class("RechargeTicket", GameObject)
local RechargeData = require("lua.table.t_s_recharge")

function RechargeTicket:ctor( Data )
    self.super.ctor(self)
    self:init(Data)
end

function RechargeTicket:init( Data )
    self.id = Data
    self.gmId = 0
    self.config = RechargeTicketData:objectByID(self.id) or {}
    self.rechargeConfig = RechargeData:objectByID(self.config.recharge_id) or {}
    self.sycee = self.rechargeConfig.sycee
    self.vipScore = self.sycee
    self.needRecharge = self.sycee
    self.createTime = 0
    self.endTime = 0
    self.useType = self.config.type
end

function RechargeTicket:dispose()
    self.super.dispose(self)

    self.gmId = nil
    self.config = nil
    self.rechargeConfig = nil
    self.sycee = nil
    self.vipScore = nil
    self.needRecharge = nil
    self.createTime = nil
    self.endTime = nil
    self.useType = nil

    TFDirector:unRequire('lua.gamedata.base.GameObject')
end

function RechargeTicket:setGmId(gmId)
    self.gmId = gmId
end

function RechargeTicket:setCreateTime(createTime)
    self.createTime = createTime
end

function RechargeTicket:getCreateTime()
    return self.createTime or 0
end

function RechargeTicket:setEndTime(endTime)
    self.endTime = endTime
    self:setUseType(self:getUseType())   
end

function RechargeTicket:getEndTime()
    return self.endTime or 0
end

function RechargeTicket:setUseType(type)
    self.useType = type
end

function RechargeTicket:getUseType()
    local nowTime = MainPlayer:getNowtime()
    local deltaTime = self:getEndTime() - nowTime
    local oneDaySec = 24 * 60 * 60
    if deltaTime <= oneDaySec then
        if deltaTime > 0 then
            return RechargeTicketManager.EnumUseType.TODAY
        else
            return RechargeTicketManager.EnumUseType.UN_USABLE
        end
    else
        return RechargeTicketManager.EnumUseType.TOMORROW
    end
end

return RechargeTicket