-- client side PeakBuffLayer.lua
--[[
 * @Description: 论剑峰时间增益
 ]]
-- script writer wuqi
-- creation time 2016-06-23

local PeakBuffLayer = class("PeakBuffLayer", BaseLayer)

function PeakBuffLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianBPBuff3")
end

function PeakBuffLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.txt_nownumber = TFDirector:getChildByPath(ui, "txt_nownumber")
end

function PeakBuffLayer:setNum( attri )

    self.txt_nownumber:setText(attri*0.01 .. '%')
    local function MakeTimerStr()
    	local timeNow = MainPlayer:getNowtime()
	    local tTime = GetCorrectDate("*t",timeNow)
	    local wday = tTime.wday
	    if wday == 1 then
	    	wday = 8
	    end
	    wday = (1 - (wday - 1)) + 7
	    if wday == 1 and tTime.hour < 22 then
	    	wday = math.mod(wday,7)
	    end
	    totalSec = wday * 24 * 3600 + (22 - tTime.hour) * 3600  + (0 - tTime.min) * 60 + (0 - tTime.sec)

	    local day = math.floor(totalSec/(24*3600))
	    totalSec = totalSec - day * 24 * 3600
	    local hour = math.floor(totalSec/3600)
	    totalSec = totalSec - hour * 3600
	    local min = math.floor(totalSec/60)
	    local sec = totalSec - min * 60
	    local strList = ""
	    if day > 0 then
	        strList = day..localizable.time_day_txt
	    end
	    if hour > 0 then
	        strList = strList..hour..localizable.time_hour_txt
	    end
	    if min > 0 then
	        strList = strList..min..localizable.time_minute_txt
	    end
	    if sec <= 0 then 
	        sec = 0
	    end
	    strList = strList..sec..localizable.time_second_txt
	end

    MakeTimerStr()
    self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
    function()
        MakeTimerStr()
    end)
end

function PeakBuffLayer:removeUI()
	if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self.super.removeUI(self)
end

function PeakBuffLayer:onShow()
    self.super.onShow(self)
end

function PeakBuffLayer:registerEvents()
    self.super.registerEvents(self)
end

function PeakBuffLayer:removeEvents()
    self.super.removeEvents(self)
end

return PeakBuffLayer