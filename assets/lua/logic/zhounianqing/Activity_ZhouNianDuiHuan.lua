
-- ///////////////////////////////////////////////////
-- @Author:             yejiawei
-- @Create Date:        2016-12-15 11:43:11
-- @Title:              Type_ZhouNianD
-- @Describe:           周年兑换活动
-- ///////////////////////////////////////////////////

local Type_ZhouNianD = class("Type_ZhouNianD", BaseLayer)

function Type_ZhouNianD:ctor(type)
    self.super.ctor(self)
    self.id     = type
    local activityInfo = AnniversaryManager:getActivityInfo(self.id)
    if activityInfo ~= nil then
        self.type   = activityInfo.type
    end
    
    self:init("lua.uiconfig_mango_new.operatingactivities.011")
end

function Type_ZhouNianD:initUI(ui)
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
    local CarniValList = CarniValShopData:getCarniValShopData()

    for i,v in pairs(CarniValList) do
        local widget = require('lua.logic.zhounianqing.exchangeCarnival'):new(v.id,v.chance)
        widget:setPosition(ccp(position.x,position.y))
        self.panel_content:addChild(widget)
        widget.index = i
        position.y = position.y - 136
        rewardWidgetArray:pushbyid(v.id,widget)
        height = position.y
    end
    for k,data in pairs(rewardList.map) do
        if data.Id == nil then 
            break
        end
        local Id = CarniValShopData:getSingleCarniValById(data.Id).id
        local widget = rewardWidgetArray:objectByID(Id)
        widget:setStatus(data.progress)
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

function Type_ZhouNianD:removeUI()
    self.super.removeUI(self)
end

function Type_ZhouNianD:onShow()
    self.super.onShow(self)
    self:refreshUI()

end

function Type_ZhouNianD:dispose()
    self.super.dispose(self)
end

function Type_ZhouNianD:refreshUI()   
   
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

function Type_ZhouNianD:refreshRightPanel()
    local activity      = AnniversaryManager:getActivityInfo(self.id)
    local rewardList    = activity.activityReward


    for k,data in pairs(rewardList.map) do
        if data.Id == nil then 
            break
        end
        local Id = CarniValShopData:getSingleCarniValById(data.Id).id
        local widget = self.rewardWidgetArray:objectByID(Id)
        widget:setStatus(data.progress)
    end
    -- self:resortReward()
end

function Type_ZhouNianD:registerEvents()
    print("Type_ZhouNianD:registerEvents()------------------")
    self.super.registerEvents(self)
    self.receiveInfo = function (event)
        local CarniValList = CarniValShopData:getCarniValShopData()

        for i,v in pairs(CarniValList) do
            local rewardId = v.id
            local widget = self.rewardWidgetArray:objectByID(rewardId)
            local activityReward = AnniversaryManager:getActivityInfo(self.id).activityReward
            local progress = activityReward:objectByID(rewardId).progress
            widget:setStatus(progress)
        end
        -- local rewardId = event.data[1][1].id
        -- local progress = event.data[1][1].progress
        -- local widget = self.rewardWidgetArray:objectByID(rewardId)
        
        self:resortReward()
    end
    TFDirector:addMEGlobalListener(AnniversaryManager.MSG_EXCHANGE_UPDATE,self.receiveInfo)
    
end

function Type_ZhouNianD:removeEvents()
    print("Type_ZhouNianD:removeEvents()------------------")
    TFDirector:removeMEGlobalListener(AnniversaryManager.MSG_EXCHANGE_UPDATE,self.receiveInfo)
    self.receiveInfo = nil

    self.super.removeEvents(self)
end

function Type_ZhouNianD:resortReward()
    local function cmpFun(widget1, widget2)
        if (widget1.index < widget2.index) then
                return true
            else
                return false
            end
    end
    --完成的放前面
    local function cmpFun1(widget1, widget2)
        if widget1.Receive == true then 
            return true
        else 
            return false
        end
    end

    self.rewardWidgetArray:sort(cmpFun)
    -- self.rewardWidgetArray:sort(cmpFun1)

    --刷新界面
    local rewardCount = self.rewardWidgetArray:length()
    local position = ccp(20,self.img_award:getPosition().y-150)
    for i=1,rewardCount do
        local widget = self.rewardWidgetArray:objectAt(i)
        widget:refreshUI()
        widget:setPosition(ccp(position.x,position.y))
        position.y = position.y - 136
    end
end

return Type_ZhouNianD