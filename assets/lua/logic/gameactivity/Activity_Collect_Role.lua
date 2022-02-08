local Activity_Collect_Role = class("Activity_Collect_Role", BaseLayer)

function Activity_Collect_Role:ctor(type)
    self.super.ctor(self)
    self.id   = type
    self.type =OperationActivitiesManager.Type_Exchange
    self:init("lua.uiconfig_mango_new.operatingactivities.011")
end

function Activity_Collect_Role:initUI(ui)
    self.super.initUI(self,ui)
    self.img_award 				= TFDirector:getChildByPath(ui, 'img_award')

    self.scroll_view 			= TFDirector:getChildByPath(ui, 'scroll_view')
    self.panel_content 			= TFDirector:getChildByPath(ui, 'panel_content')
    self.txt_time               = TFDirector:getChildByPath(ui, 'txt_time')
    self.txt_content            = TFDirector:getChildByPath(ui, 'txt_content')
    self.img_yichongzhi         = TFDirector:getChildByPath(ui, 'img_yichongzhi')
    self.img_yixiaofei          = TFDirector:getChildByPath(ui, 'img_yixiaofei')
    self.img_denglu             = TFDirector:getChildByPath(ui, 'img_denglu')
    self.img_content             = TFDirector:getChildByPath(ui, 'img_content')

    self.img_reward             = TFDirector:getChildByPath(ui, 'img_reward')

    self.img_reward:setVisible(false)
    self.img_yichongzhi:setVisible(false)
    self.img_yixiaofei:setVisible(false)
    self.img_denglu:setVisible(false)
    
    -- self.bIsRecruitIntegralActivity = false

    local height = 0

    local rewardList    = OperationActivitiesManager:getActivityRewardList(self.id)
    local desc1, desc2  = OperationActivitiesManager:getRewardItemDesc(self.id)

    --init reward information
    local rewardWidgetArray = TFArray:new()
    local rewardCount = rewardList:length()
    local position = ccp(0,self.img_reward:getPosition().y-150)
    for i=1,rewardCount do
    	local rewardData = rewardList:objectAt(i)

    	local widget = require('lua.logic.gameactivity.CollectRoleCell'):new(self.id, rewardData.id)
    	widget:setPosition(ccp(position.x,position.y))
    	self.panel_content:addChild(widget)
        widget.index = i
        widget.rewardData_id = rewardData.id
        widget.status = OperationActivitiesManager:getActivityRewardStatus(self.id, rewardData.id)
    	position.y = position.y - 180
    	rewardWidgetArray:push(widget)


        height = position.y - 180

        -- print("self.bIsRecruitIntegral = ", widget.bIsRecruitIntegral)
    end

    -- 动态调整高度
    height = 0 - height
    local scrollViewContentsize = self.scroll_view:getContentSize().height
    if height < scrollViewContentsize then
        height = scrollViewContentsize
    end

    self.rewardList = rewardList
    self.rewardWidgetArray = rewardWidgetArray
    self:refreshUI()

    local size = self.scroll_view:getInnerContainerSize()

    -- print("size1 = ", size)
    -- print("height = ", height)
    self.scroll_view:setInnerContainerSize(CCSizeMake(size.width, height))
    size = self.scroll_view:getInnerContainerSize()
    -- print("size2 = ", size)

    -- 重设高度
    self.panel_content:setPosition(ccp(0, height))


    -- -- 
    -- self.img_yichongzhi:setVisible(false)
    -- self.img_yixiaofei:setVisible(false)
    -- self.img_denglu:setVisible(false)


    -- if EnumActivitiesType.ZHAOBUG == self.id or EnumActivitiesType.YAOHAOYOU == self.id then
    --     self.img_reward:setVisible(false)
    -- end

end

function Activity_Collect_Role:isStatusComplete( status )
    if status == 4 or status == 5 then
        return true
    end

    return false
end

function Activity_Collect_Role:resortReward()
    -- local rewardList =  OperationActivitiesManager:getActivityRewardList(11)
    -- local rewardCount = self.rewardList:length()

    -- print("rewardCount = ", rewardCount)
    
    -- for i=1,rewardCount do
    --     local widget = self.rewardWidgetArray:objectAt(i)
    --     print("i = ", i)
    --     widget.status =  OperationActivitiesManager:getActivityRewardStatus(self.id, widget.rewardData_id)
    -- end
    -- local function cmpFun(widget1, widget2)
    --     if self:isStatusComplete(widget1.status) and self:isStatusComplete(widget2.status) == false then
    --         return false;
    --     elseif self:isStatusComplete(widget1.status) ==false and self:isStatusComplete(widget2.status) == true then
    --         return true;
    --     else
    --         if widget1.index < widget2.index then
    --             return true;
    --         else
    --             return false;
    --         end
    --     end
    -- end

    -- self.rewardWidgetArray:sort(cmpFun)
end
function Activity_Collect_Role:removeUI()
    self.super.removeUI(self)
end

function Activity_Collect_Role:onShow()
    self.super.onShow(self)
 --    local rewardCount = self.rewardWidgetArray:length()
	-- for i=1,rewardCount do
	-- 	local widget = self.rewardWidgetArray:objectAt(i)
	-- 	widget:onShow()
	-- end
    self:refreshUI()
end

function Activity_Collect_Role:dispose()
    self.super.dispose(self)
end

function Activity_Collect_Role:refreshUI()   
    print("当前活动类型 = ", self.id)

    local activity = OperationActivitiesManager:getActivityData(self.id)

    if not activity then
        self.txt_time:setText("")
        self.txt_content:setText("")

    else
        -- GetCorrectDate("%x", GetCorrectTime()) <== 返回自定义格式化时间字符串（完整的格式化参数），这里是"11/28/08"
        local startTime = ""
        local endTime   = ""

        -- 0、活动强制无效，不显示该活动；1、长期显示该活动 2、自动检测，过期则不显示',
        local status = activity.status or 1

        if status == 1 then
            --self.txt_time:setText("永久有效")
            self.txt_time:setText(localizable.common_time_longlong)
            
        else
            if activity.startTime then
                startTime = self:getDateString(activity.startTime)
            end
            if activity.endTime then
                endTime   = self:getDateString(activity.endTime)
            end

            self.txt_time:setText(startTime .. " - " .. endTime)
        end


        self.txt_content:setText(activity.details)
    end


 --    self:resortReward();
    local rewardCount = self.rewardWidgetArray:length()
    local position = ccp(20,self.img_award:getPosition().y-150)
    for i=1,rewardCount do
        local widget = self.rewardWidgetArray:objectAt(i)
        widget:refreshUI()
        -- widget:setPosition(ccp(position.x,position.y))
        -- position.y = position.y - 180
    end


end


function Activity_Collect_Role:setLogic(logic)
    self.logic = logic
end

function Activity_Collect_Role:registerEvents()
    self.super.registerEvents(self)

    self.updateRewardCallback = function(event)
        self:refreshUI()
    end;

    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_PROGRESS_UPDATE,self.updateRewardCallback)
    -- TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD,self.updateRewardCallback)
end

function Activity_Collect_Role:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_PROGRESS_UPDATE,self.updateRewardCallback)
    -- TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD,self.updateRewardCallback)
    self.updateRewardCallback = nil
end

function Activity_Collect_Role:getDateString(timestamp)

    if not timestamp then
        return
    end

    local date   = GetCorrectDate("*t", timestamp)

    --return date.month.."月"..date.day.."日"..date.hour.."时"..date.min.."分"
    return stringUtils.format(localizable.common_time_4, date.month,date.day,date.hour,date.min)
end

return Activity_Collect_Role