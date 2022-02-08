-- client side PeakSJBuffLayer.lua
--[[
 * @Description: 论剑峰时间增益
 ]]
-- script writer wuqi
-- creation time 2016-06-23

local PeakSJBuffLayer = class("PeakSJBuffLayer", BaseLayer)

function PeakSJBuffLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianSJBuff")
end

function PeakSJBuffLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.txt_nownumber = TFDirector:getChildByPath(ui, "txt_nownumber")
    self.txt_high = TFDirector:getChildByPath(ui, "txt_zhanli")
    -- self.txt_low = TFDirector:getChildByPath(ui, "txt_zhefu2")
    self.txt_normal = TFDirector:getChildByPath(ui, "txt_pingwen3")
    local txt_pingwen1 = TFDirector:getChildByPath(ui, "txt_pingwen1")
    local posX = txt_pingwen1:getPositionX() + txt_pingwen1:getContentSize().width
    self.txt_normal:setPositionX(posX)

    -- local txt_zhefu1 = TFDirector:getChildByPath(ui, "txt_zhefu1")
    -- posX = txt_zhefu1:getPositionX() + txt_zhefu1:getContentSize().width
    -- self.txt_low:setPositionX(posX)

    local txt_yangsheng2 = TFDirector:getChildByPath(ui, "txt_yangsheng2")
    posX = txt_yangsheng2:getPositionX() + txt_yangsheng2:getContentSize().width
    self.txt_high:setPositionX(posX)
end

function PeakSJBuffLayer:setInfo( floorId )
    self.floorId = floorId
    self:refreshUI()
end

function PeakSJBuffLayer:refreshUI()
    local floorInfo = PeakData:objectByID(self.floorId)
    local curTime = MainPlayer:getNowtime()
    local timeData = PeakManager:getTimeDataByTime(curTime,self.floorId)
    self.txt_nownumber:setText(timeData.percent*100 .. '%')
    local tData = floorInfo:getData()
    for k,v in pairs(tData) do
        -- if v.type == 0 then
        --     self.txt_low:setText(v.percent*100 .. '%')
        -- else
        if v.type == 2 then
            self.txt_high:setText(v.percent*100 .. '%')
            break
        end
    end
end

function PeakSJBuffLayer:removeUI()
    self.super.removeUI(self)
end

function PeakSJBuffLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function PeakSJBuffLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.ui)
    self.onActivityStatusHandler = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)

    self.onActivityStatusHandler_0 = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
end

function PeakSJBuffLayer:removeEvents()
    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    self.super.removeEvents(self)
end

return PeakSJBuffLayer