-- client side PeakZZCCBuffLayer.lua
--[[
 * @Description: 论剑峰众志成城增益
 ]]
-- script writer wuqi
-- creation time 2016-06-23

local PeakZZCCBuffLayer = class("PeakZZCCBuffLayer", BaseLayer)

function PeakZZCCBuffLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianZZCCBuff")
end

function PeakZZCCBuffLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.txt_yjh = TFDirector:getChildByPath(ui, "txt_yjh")
    self.txt_wjh = TFDirector:getChildByPath(ui, "txt_wjh")
    self.txt_pingwen1   = TFDirector:getChildByPath(ui, "txt_pingwen1")
    self.txt_chixu      = TFDirector:getChildByPath(ui, "txt_chixu")
    self.txt_time       = TFDirector:getChildByPath(ui, "txt_time")
end

function PeakZZCCBuffLayer:setInfo( floorId )
    self.floorId = floorId
    self:refreshUI()
end

function PeakZZCCBuffLayer:refreshUI()
    local myInfo = PeakManager:getMyInfo()
    if      myInfo.layer and myInfo.layer > 0 and self.floorId == myInfo.layer and
            myInfo.pos and myInfo.pos > 0 and 
            myInfo.unitedTime and myInfo.unitedTime > 0 and
            myInfo.startTime and myInfo.unitedTime >= myInfo.startTime then
        self.txt_yjh:setVisible(true)
        self.txt_wjh:setVisible(false)
        self.txt_chixu:setVisible(true)
        self:updateTimeInfo()
        self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
        function()
            if self.isShow == true then
                self:updateTimeInfo()
            end
        end)
    else
        self.txt_yjh:setVisible(false)
        self.txt_wjh:setVisible(true)
        self.txt_chixu:setVisible(false)
    end
    local floorInfo = PeakData:objectByID(self.floorId)
    local str = stringUtils.format(localizable.LunJianFeng_txt_info_zzcc,floorInfo.united_integral * 60)
    self.txt_pingwen1:setText(str)
end

function PeakZZCCBuffLayer:removeUI()
    if self.updateTimerID ~= nil then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self.super.removeUI(self)
end

function PeakZZCCBuffLayer:onShow()
    self.super.onShow(self)
    --self:refreshUI()
end

function PeakZZCCBuffLayer:registerEvents()
    self.super.registerEvents(self)
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

function PeakZZCCBuffLayer:removeEvents()
    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    self.super.removeEvents(self)
end

function PeakZZCCBuffLayer:updateTimeInfo()
    local myInfo = PeakManager:getMyInfo()
    local timeNow = MainPlayer:getNowtime()
    local timeBegan = myInfo.unitedTime or 0
    local timeStart = myInfo.startTime
    if myInfo.layer == nil or  myInfo.layer <= 0 or self.floorId ~= myInfo.layer or
            myInfo.pos == nil or myInfo.pos <= 0 or  timeBegan == 0 or timeBegan < timeStart then
        self.txt_yjh:setVisible(false)
        self.txt_wjh:setVisible(true)
        self.txt_chixu:setVisible(false)
        return
    end
    local timeLeft = timeNow - timeBegan
    if timeLeft < 0 then
        timeLeft = 0
    end
    local hour = math.floor(timeLeft / 3600)
    timeLeft = timeLeft - hour * 3600
    local min = math.floor(timeLeft / 60)
    local sec = timeLeft - min * 60
    local strTime = ''
    if hour > 0 then
        strTime = strTime .. hour .. localizable.time_hour_txt
    end
    if hour > 0 or min > 0 then
        local strTemp = string.format("%02d",min)
        strTime = strTime .. strTemp .. localizable.time_minute_txt0
    end
    local strTemp = string.format("%02d",sec)
    strTime = strTime .. strTemp .. localizable.time_second_txt
    self.txt_time:setText(strTime)
end

return PeakZZCCBuffLayer