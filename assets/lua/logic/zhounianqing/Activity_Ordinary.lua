local Activity_Ordinary = class("Activity_Ordinary", BaseLayer)

function Activity_Ordinary:ctor(type)

    self.super.ctor(self)
    self.id     = type

    self:init("lua.uiconfig_mango_new.operatingactivities.011")
end

function Activity_Ordinary:initUI(ui)
    self.super.initUI(self,ui)
    self.img_reward              = TFDirector:getChildByPath(ui, 'img_reward')

    self.txt_time               = TFDirector:getChildByPath(ui, 'txt_time')
    self.txt_content            = TFDirector:getChildByPath(ui, 'txt_content')
    self.img_yichongzhi         = TFDirector:getChildByPath(ui, 'img_yichongzhi')
    self.img_yixiaofei          = TFDirector:getChildByPath(ui, 'img_yixiaofei')
    self.img_denglu             = TFDirector:getChildByPath(ui, 'img_denglu')
    

    self.img_yichongzhi:setVisible(false)
    self.img_yixiaofei:setVisible(false)
    self.img_denglu:setVisible(false)
    self.img_reward:setVisible(false)
end

function Activity_Ordinary:removeUI()
    self.super.removeUI(self)
end

function Activity_Ordinary:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function Activity_Ordinary:dispose()
    self.super.dispose(self)
end

function Activity_Ordinary:refreshUI()   
    print("当前活动类型 = ", self.id)

    local activity = AnniversaryManager:getActivityInfo(self.id)

    if activity.startTime then
        startTime = self:getDateString(activity.startTime)
    end
    if activity.endTime then
        endTime   = self:getDateString(activity.endTime)
    end

    self.txt_time:setText(startTime .. " - " .. endTime)
    
    self.txt_content:setText(activity.details)

end

function Activity_Ordinary:registerEvents()
    self.super.registerEvents(self)
end

function Activity_Ordinary:removeEvents()
    self.super.removeEvents(self)
end

-- ├┄┄sec=0,
-- ├┄┄min=0,
-- ├┄┄day=28,
-- ├┄┄isdst=false,
-- ├┄┄wday=3,
-- ├┄┄yday=209,
-- ├┄┄year=2015,
-- ├┄┄month=7,
-- ├┄┄hour=0
function Activity_Ordinary:getDateString(timestamp)

    if not timestamp then
        return
    end

    local date   = GetCorrectDate("*t", timestamp)

    -- return date.year.."年"..date.month.."月"..date.day.."日"..date.hour.."时"

    --return date.month.."月"..date.day.."日"..date.hour.."时"..date.min.."分"
    return stringUtils.format(localizable.common_time_4, date.month,date.day,date.hour,date.min)
end

return Activity_Ordinary