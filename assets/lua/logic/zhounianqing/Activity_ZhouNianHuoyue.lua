
-- ///////////////////////////////////////////////////
-- @Author:             yejiawei
-- @Create Date:        2016-12-15 11:43:11
-- @Title:              Type_ZhouNianH
-- @Describe:           周年活跃和狂欢活动
-- ///////////////////////////////////////////////////

local Type_ZhouNianH = class("Type_ZhouNianH", BaseLayer)

function Type_ZhouNianH:ctor(type)
    self.super.ctor(self)
    self.id = type
    local activityInfo = OperationActivitiesManager:getActivityInfo(self.id)
    if activityInfo ~= nil then
        self.type   = activityInfo.type
    end
    
    self:init("lua.uiconfig_mango_new.operatingactivities.011")
end

function Type_ZhouNianH:initUI(ui)
    self.super.initUI(self,ui)
    self.img_award              = TFDirector:getChildByPath(ui, 'img_award')

    self.scroll_view            = TFDirector:getChildByPath(ui, 'scroll_view')
    self.panel_content          = TFDirector:getChildByPath(ui, 'panel_content')
    self.txt_time               = TFDirector:getChildByPath(ui, 'txt_time')
    self.txt_content            = TFDirector:getChildByPath(ui, 'txt_content')
    self.img_yichongzhi         = TFDirector:getChildByPath(ui, 'img_yichongzhi')
    self.img_yixiaofei          = TFDirector:getChildByPath(ui, 'img_yixiaofei')
    self.img_denglu             = TFDirector:getChildByPath(ui, 'img_denglu')

    self.img_reward             = TFDirector:getChildByPath(ui, 'img_reward')

    local pos = self.img_reward:getPosition()

    local height = 0

    local activity      = AnniversaryManager:getActivityInfo(self.id)
    local rewardList    = activity.activityReward

    --init reward information
    local rewardWidgetArray = TFMapArray:new()
    local rewardCount = rewardList:length()
    local position = ccp(20, self.img_reward:getPosition().y-160)
    local CarniValList = CarniValData:getCarniValDataByType(self.id)

    for i,v in pairs(CarniValList) do
        v.progress = 0
        v.status = 0
        if v.missionType ~= 4 then
            local widget = require('lua.logic.zhounianqing.RewardItemCarnival'):new(v.id, v.progress,v.status)
            widget:setPosition(ccp(position.x,position.y))
            self.panel_content:addChild(widget)
            widget.index = i
            widget.progress = 0
            widget.status = 0
            widget.Id = v.id
            position.y = position.y - 136
            rewardWidgetArray:pushbyid(v.id,widget)
            --height = position.y - 136
        end
    end
    height = position.y
    for k,data in pairs(rewardList.map) do
        if data.Id == nil then 
            break
        end
       -- if data.Id ~= 4 then
            local Id = CarniValData:getSingleCarniValByTypeKind(self.id,data.missionType).id
            local widget = rewardWidgetArray:objectByID(Id)
            widget:setStatus(data.progress,data.status)
            widget.progress = data.progress
            widget.status = data.status
        --end
    end
    -- 动态调整高度
    height = 0 - height
    local scrollViewContentsize = self.scroll_view:getContentSize().height
    if height < scrollViewContentsize then
        height = scrollViewContentsize
    end

    self.rewardList = rewardList
    self.rewardWidgetArray = rewardWidgetArray

    self:resortReward()
    self:refreshUI()

    local size = self.scroll_view:getInnerContainerSize()

    -- print("size1 = ", size)
    -- print("height = ", height)
    self.scroll_view:setInnerContainerSize(CCSizeMake(size.width, height))
    size = self.scroll_view:getInnerContainerSize()
    -- print("size2 = ", size)

    -- 重设高度
    self.panel_content:setPosition(ccp(0, height))


    -- 
    self.img_yichongzhi:setVisible(false)
    self.img_yixiaofei:setVisible(false)
    self.img_denglu:setVisible(false)
end

function Type_ZhouNianH:isprogressComplete( progress, Id )
    local Data = CarniValData:objectByID(Id)
    if progress >= Data.target then
        return true
    end

    return false
end

function Type_ZhouNianH:resortReward()

    local function cmpFun(widget1, widget2)
        if (widget1.index < widget2.index) then
            return true
        end
    end
    local function cmpFun1(widget1, widget2)
        -- 
        if (widget1.status == 1) then 
            return true
        end
    end
    
    local function cmpFun2(widget1, widget2)
        if (widget1.status == 2) then
            return false
        end
        return true
    end
    

    self.rewardWidgetArray:sort(cmpFun)    
    self.rewardWidgetArray:sort(cmpFun1)
    self.rewardWidgetArray:sort(cmpFun2)
    local rewardCount = self.rewardWidgetArray:length()
    local position = ccp(20,self.img_award:getPosition().y-150)
    for i=1,rewardCount do
        local widget = self.rewardWidgetArray:objectAt(i)
        widget:refreshUI()
        widget:setPosition(ccp(position.x,position.y))
        position.y = position.y - 136
    end
end

function Type_ZhouNianH:refreshRightPanel()
    local activity      = AnniversaryManager:getActivityInfo(self.id)
    local rewardList    = activity.activityReward
    for k,data in pairs(rewardList.map) do
        if data.Id == nil then 
            break
        end
        --if data.Id ~= 4 then
            local Id = CarniValData:getSingleCarniValByTypeKind(self.id,data.missionType).id
            local widget = self.rewardWidgetArray:objectByID(Id)
            widget:setStatus(data.progress,data.status)
            widget.progress = data.progress
            widget.status = data.status
        --end
    end
    self:resortReward()
    
end
function Type_ZhouNianH:removeUI()
    self.super.removeUI(self)
end

function Type_ZhouNianH:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function Type_ZhouNianH:dispose()
    self.super.dispose(self)
end

function Type_ZhouNianH:refreshUI()   
   

   local activity = AnniversaryManager:getActivityInfo(self.id)

    if not activity then
        self.txt_time:setText("")
        self.txt_content:setText("")

    else
        self.txt_time:setText(localizable.Anniversary_Time[self.id])

        self.txt_content:setText(activity.details)
    end
    self:refreshRightPanel()
end

function Type_ZhouNianH:registerEvents()
    print("Type_ZhouNianH:registerEvents()------------------")
    self.super.registerEvents(self)
    -- self.receiveInfo = function(event)
    --     print("huoyuejianglihuoqu",event.data,self.id)
    --     local id = CarniValData:objectByID(event.data[1][1].rewardId)
    --     if id.activityType == self.id then 
    --         local widget = self.rewardWidgetArray:objectByID(event.data[1][1].rewardId)
    --         widget:setStatus1(1)
    --     end     
    --     self:refreshRightPanel()
    -- end
    -- TFDirector:addMEGlobalListener(OperationActivitiesManager.GET_REWARD,self.receiveInfo)
    --更新进度
    self.receiveInfo1 = function(event)  
        self:refreshRightPanel()
    end
    TFDirector:addMEGlobalListener(AnniversaryManager.MSG_ACTIVITY_UPDATE,self.receiveInfo1)
end

function Type_ZhouNianH:removeEvents()
    print("Type_ZhouNianH:removeEvents()------------------")

    -- TFDirector:removeMEGlobalListener(OperationActivitiesManager.GET_REWARD,self.receiveInfo)
    TFDirector:removeMEGlobalListener(AnniversaryManager.MSG_ACTIVITY_UPDATE,self.receiveInfo1)
    -- self.receiveInfo    = nil
    self.receiveInfo1   = nil
    self.super.removeEvents(self)
end

return Type_ZhouNianH