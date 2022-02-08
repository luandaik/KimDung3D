-- client side PeakInfoLayer.lua
--[[
 * @Description: 自己的阵眼信息层
 ]]
-- script writer chikui
-- creation time 2016-06-25


local PeakInfoLayer = class("PeakInfoLayer", BaseLayer)

function PeakInfoLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianMyZhenYan")
end

function PeakInfoLayer:initUI(ui)
    self.super.initUI(self, ui)
    local img_none = TFDirector:getChildByPath(ui, "img_none")
    img_none:setVisible(false)
    self.headIcon   = TFDirector:getChildByPath(ui, "Img_icon")
    self.txt_name   = TFDirector:getChildByPath(ui, "txt_name")
    self.txt_time   = TFDirector:getChildByPath(ui, "txt_tl1")
    self.txt_counted    = TFDirector:getChildByPath(ui, "txt_zhanli") 
    self.txt_sudu = TFDirector:getChildByPath(ui, "txt_sudu")
    self.txt_speed  = TFDirector:getChildByPath(ui, "txt_suducount")
    self.txt_jifen = TFDirector:getChildByPath(ui, "txt_jifen")
    self.txt_score  = TFDirector:getChildByPath(ui, "txt_jifencount")

    self.info = PeakManager:getMyInfo()
    self.btn_fight   = TFDirector:getChildByPath(ui, "btn_fight")
    self:refreshUI()
end

function PeakInfoLayer:onShow()
    self.super.onShow(self)
end

function PeakInfoLayer:registerEvents()
    self.super.registerEvents(self)
    self.btn_fight.logic = self
    self.btn_fight:addMEListener(TFWIDGET_CLICK, audioClickfun(PeakInfoLayer.OnAbandonClick))

    self.onPeakFallHandler = function(event)
        self.isFall = true
        AlertManager:close(AlertManager.TWEEN_NONE)
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_PEAK_FALL ,self.onPeakFallHandler)

    self.onPeakAbandonHandler = function(event)
        AlertManager:close(AlertManager.TWEEN_NONE)
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ABANDON_PEAK ,self.onPeakAbandonHandler)

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

function PeakInfoLayer.OnAbandonClick( sender )
    local self = sender.logic
    CommonManager:showOperateSureLayer(
        function()
            self.isAbandon = true
            PeakManager:requestAbandonPeak()
        end,
        nil,
        {
            msg = localizable.LunJianFeng_peak_info_abandon
        }
    )
    
end

function PeakInfoLayer:removeEvents()
    self.super.removeEvents(self)
    
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_PEAK_FALL ,self.onPeakFallHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ABANDON_PEAK ,self.onPeakAbandonHandler)
    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
end

function PeakInfoLayer:removeUI()
    if self.updateTimerID ~= nil then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self.super.removeUI(self)
end

function PeakInfoLayer:dispose()
    self.super.dispose(self)
end

function PeakInfoLayer:refreshUI()

    self.headIcon:setTexture(MainPlayer:getIconPath())
    Public:addFrameImg(self.headIcon,MainPlayer:getHeadPicFrameId())
    self.txt_sudu:setText(localizable.LunJianFeng_txt_info_tip)
    self.txt_name:setText(MainPlayer:getPlayerName())
    
    self:showMyInfo()
    self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
    function()
        self:showMyInfo()
    end)
end

function PeakInfoLayer:showMyInfo()

    local curTime = MainPlayer:getNowtime()
    local floorInfo = PeakData:objectByID(self.info.layer)
    local timeData = PeakManager:getTimeDataByTime(curTime,self.info.layer)
    local integral = floorInfo.integral
    local timeBegan = self.info.startTime or 0
    local united_integral = floorInfo.united_integral
    if self.info.unitedTime and self.info.unitedTime > 0 and self.info.unitedTime >= timeBegan then
        integral = integral + united_integral
    end
    self.txt_speed:setText(integral*60*timeData.percent .. '')
    local size = self.txt_speed:getContentSize()
    self.txt_sudu:setPositionX(size.width + self.txt_speed:getPositionX())
    local maxTimeLen = ConstantData:objectByID("PeakTakeDownTime").value * 60
    local timeMax = timeBegan + maxTimeLen
    local timeNow = MainPlayer:getNowtime()
    if timeNow < timeMax then
        timeMax = timeNow
    end
    local timeLeft = timeMax - timeBegan
    if timeLeft < 0 then
        timeLeft = 0
    end
    local isNeedBrush = false
    if timeLeft >= maxTimeLen then
        isNeedBrush = true
    end
    timeLeft = math.floor(timeLeft)
    if timeLeft % 60 == 0 or self.updateTimerID == nil then
        local integralList = PeakManager:getMyIntegral()
        local strCounted = stringUtils.format(localizable.LunJianFeng_txt_info_counted,integralList[2])
        if integralList[2] <= 0 then
            strCounted = ''
        end
        self.txt_counted:setText(strCounted)
        self.txt_score:setText(integralList[1])
        size = self.txt_score:getContentSize()
        self.txt_jifen:setPositionX(size.width + self.txt_score:getPositionX())
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
    if isNeedBrush == true and self.isClosing ~= true and self.isAbandon ~= true and self.isFall ~= true then
        self.isClosing = true
        local delay = CCDelayTime:create(0.1)
        local callFuncN = CCCallFuncN:create( function()
            print("**************callFuncN**************")
            AlertManager:close(AlertManager.TWEEN_NONE)
        end)
        self.btn_fight:runAction(CCSequence:createWithTwoActions(delay,callFuncN))
    end
end

return PeakInfoLayer