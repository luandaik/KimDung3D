local Activity_Continue_Recharge = class("Activity_Continue_Recharge", BaseLayer)

function Activity_Continue_Recharge:ctor(type)
    self.super.ctor(self)
    self.id     = type
    local activityInfo = OperationActivitiesManager:getActivityInfo(self.id)
    if activityInfo ~= nil then
        self.type   = activityInfo.type
    end
    

    self:init("lua.uiconfig_mango_new.operatingactivities.lianxuchongzhi")
end

function Activity_Continue_Recharge:initUI(ui)
    self.super.initUI(self,ui)
    self.img_award 				= TFDirector:getChildByPath(ui, 'img_award')

    self.panel_content 			= TFDirector:getChildByPath(ui, 'panel_content')
    self.txt_time               = TFDirector:getChildByPath(ui, 'txt_time')
    self.txt_now_day               = TFDirector:getChildByPath(ui, 'txt_day')
    self.txt_now_recharge               = TFDirector:getChildByPath(ui, 'txt_number')
    self.txt_day               = TFDirector:getChildByPath(ui, 'txt_paydays')
    self.txt_recharge               = TFDirector:getChildByPath(ui, 'txt_paynumbers')
    self.panel_list               = TFDirector:getChildByPath(ui, 'panel_list')
    self.panel_jiangli               = TFDirector:getChildByPath(ui, 'Panel_jiangli')
    self.btn_lingqu               = TFDirector:getChildByPath(ui, 'btn_lingqu')
    self.img_ylq               = TFDirector:getChildByPath(ui, 'img_ylq')


    local activity      = OperationActivitiesManager:getActivityInfo(self.id)
    self.desc1, self.desc2  = OperationActivitiesManager:getRewardItemDesc(self.type)
    local rewardList    = activity.activityReward

    self.rewardList = TFArray:new()
    self.lastReward = nil

    local rewardCount = rewardList:length()
    for i=1,rewardCount do
        local rewardData = rewardList:objectAt(i)
        if i == rewardCount then
            self.lastReward = rewardData
        else
            -- rewardData.id = i
            -- rewardData.status = OperationActivitiesManager:getActivityRewardStatus(self.id, rewardData.id )
            self.rewardList:pushBack(rewardData)
        end
    end

    print("self.type = ", self.type)
    print("self.desc1 = ", self.desc1)
    print("self.desc2 = ", self.desc2)

    self.cellNode = createUIByLuaNew("lua.uiconfig_mango_new.operatingactivities.RewardItem")
    self.cellNode:retain()
    -- --init reward information
    -- local rewardWidgetArray = TFArray:new()
    -- local rewardCount = rewardList:length()
    -- local position = ccp(20,self.img_award:getPosition().y-150)
    -- for i=1,rewardCount do
    -- 	local rewardData = rewardList:objectAt(i)

    -- 	local widget = require('lua.logic.gameactivity.RewardItemCommon'):new(self.id, self.type, rewardData.id, desc1, desc2, i)
    -- 	widget:setPosition(ccp(position.x,position.y))
    -- 	self.panel_content:addChild(widget)
    --     widget.index = i
    --     widget.rewardData_id = rewardData.id
    --     widget.status = OperationActivitiesManager:getActivityRewardStatus(self.id, rewardData.id )
    -- 	position.y = position.y - 136
    -- 	rewardWidgetArray:push(widget)


    --     height = position.y - 136
    -- end

    -- 

end

function Activity_Continue_Recharge:isStatusComplete( status )
    if status == 4 or status == 5 then
        return true
    end

    return false
end

function Activity_Continue_Recharge:resortReward()

    local function cmpFun(reward1, reward2)
        local status1 = self:isStatusComplete(reward1.status)
        local status2 = self:isStatusComplete(reward2.status)
        if status1 ~= status2 then
            return status2
        else
            if reward1.id < reward2.id then
                return true;
            else
                return false;
            end
        end
    end
    self.rewardList:sort(cmpFun)
end
function Activity_Continue_Recharge:removeUI()
    self.super.removeUI(self)

    if self.cellNode then
        self.cellNode:release()
        self.cellNode = nil
    end
end

function Activity_Continue_Recharge:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function Activity_Continue_Recharge:dispose()
    self.super.dispose(self)
end

function Activity_Continue_Recharge:refreshUI()   
    local activity = OperationActivitiesManager:getActivityInfo(self.id)

    if not activity then
        self.txt_time:setText("")

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
        if activity.progress == nil then
            activity.progress = 0
        end
        self.txt_now_day:setText("("..activity.progress.."/"..self.lastReward.id..")")
        self.txt_now_recharge:setText("("..OperationActivitiesManager:getActivityVaule(self.id).."/"..self.lastReward.minRecharge..")")


        -- print("self.lastReward =========><<<<>>>>>>",self.lastReward)
        -- self.txt_day:setText(self.lastReward.index)
        self.txt_day:setText(stringUtils.format(localizable.GameActivitiesManager_countineRechargeDay,self.lastReward.id))
        self.txt_recharge:setText(stringUtils.format(localizable.GameActivitiesManager_countineRechargeMoney,self.lastReward.minRecharge))

        self.lastRewardWidget = self.lastRewardWidget or {}

        local rewardItems =  self.lastReward.reward
        local itemCount = rewardItems:length()

        for i=1,itemCount do            
            local item = rewardItems:objectAt(i)
            local info = BaseDataManager:getReward(item)
            if self.lastRewardWidget[i] then
                self.lastRewardWidget[i]:setVisible(true)
                Public:loadIconNode(self.lastRewardWidget[i],info)
            else
                self.lastRewardWidget[i] = Public:createIconNumNode(info)
                self.lastRewardWidget[i]:setScale(0.6)
                self.lastRewardWidget[i]:setPosition(ccp((i-1)*80,-10))
                self.panel_jiangli:addChild(self.lastRewardWidget[i])
            end
        end
        for i=itemCount+1,#self.lastRewardWidget do
            self.lastRewardWidget[i]:setVisible(false)
        end

        local status = OperationActivitiesManager:getActivityRewardStatus(self.id, self.lastReward.index)
        
        if status == 0 then
            self.btn_lingqu:setTouchEnabled(true)
            self.btn_lingqu:setGrayEnabled(false)
        else
            self.btn_lingqu:setTouchEnabled(false)
            self.btn_lingqu:setGrayEnabled(true)
        end

        if status == 5 or status == 4 then
            self.img_ylq:setVisible(true)
            self.btn_lingqu:setVisible(false)
        else
            self.img_ylq:setVisible(false)
            self.btn_lingqu:setVisible(true)
        end

        -- local index = activity
        function getButtonClickHandle(widget)
            OperationActivitiesManager:sendMsgToGetActivityReward(self.id, self.lastReward.index)
        end
        self.btn_lingqu:addMEListener(TFWIDGET_CLICK, audioClickfun(getButtonClickHandle),1)
    end

    if not self.tableView then
        self:createTableView()
    end
    self:resortReward()
    self.tableView:reloadData()

end


function Activity_Continue_Recharge.btnClickHandle(sender)

end

function Activity_Continue_Recharge:setLogic(logic)
    self.logic = logic
end

function Activity_Continue_Recharge:registerEvents()
    print("Activity_Continue_Recharge:registerEvents()------------------")
    self.super.registerEvents(self)
    -- self.btn_lingqu:addMEListener(TFWIDGET_CLICK,audioClickfun(self.btnClickHandle))
    self.updateRewardCallback = function(event)
        self:refreshUI()
    end;

    -- TFDirector:addMEGlobalListener(OperationActivitiesManager.ACITIVTY_REWARD_RECORD,self.updateRewardCallback)
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_PROGRESS_UPDATE,self.updateRewardCallback)
end

function Activity_Continue_Recharge:removeEvents()
    print("Activity_Continue_Recharge:removeEvents()------------------")
    self.super.removeEvents(self)
    -- TFDirector:removeMEGlobalListener(OperationActivitiesManager.ACITIVTY_REWARD_RECORD,self.updateRewardCallback)
    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_PROGRESS_UPDATE,self.updateRewardCallback)
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
function Activity_Continue_Recharge:getDateString(timestamp)

    if not timestamp then
        return
    end

    local date   = GetCorrectDate("*t", timestamp)
    return stringUtils.format(localizable.common_time_4, date.month,date.day,date.hour,date.min)
end


function Activity_Continue_Recharge:createTableView()
    local tabView =  TFTableView:create()
    tabView:setTableViewSize(self.panel_list:getContentSize())
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_list:addChild(tabView)
    tabView:setPosition(ccp(0,0))
    self.tableView = tabView


    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
end


function Activity_Continue_Recharge.cellSizeForTable(table,idx)
    return 131,600
end

function Activity_Continue_Recharge.numberOfCellsInTableView(table)
    local self = table.logic
    return self.rewardList:length()
end

function Activity_Continue_Recharge.tableCellAtIndex(table, idx)

    local self = table.logic;
    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.cellNode:clone()
        panel:setPosition(ccp(0,131))
        cell:addChild(panel)
        cell.panel = panel
    end
    self:setRewardInfo( cell.panel , idx+1 )
    return cell
end


function Activity_Continue_Recharge.onClick(sender)
    local index = sender.index
    local rewardItems = sender.rewardItems

    local item = rewardItems:objectAt(index)
    Public:ShowItemTipLayer(item.itemid, item.type);
end



function Activity_Continue_Recharge:setRewardInfo( widget , index )
    local reward = self.rewardList:objectAt(index)
    if reward == nil then
        widget:setVisible(false)
        return
    end
    widget:setVisible(true)

    local txt_desc2 = TFDirector:getChildByPath(widget, 'txt_desc2')
    txt_desc2:setVisible(false)
    local txt_desc1 = TFDirector:getChildByPath(widget, 'txt_desc1')
    local desc1 = stringUtils.format(self.desc1, reward.id)
    txt_desc1:setText(desc1)

    local rewardItems =  reward.reward
    local itemCount = rewardItems:length()
    for i=1,3 do
        local bg = TFDirector:getChildByPath(widget, 'img_bg_' .. i)
        local icon     = TFDirector:getChildByPath(widget, 'img_icon_' .. i)
        local number   = TFDirector:getChildByPath(widget, 'txt_number_' .. i)
        if i <= itemCount then
            bg:setVisible(true)
            local item = rewardItems:objectAt(i)
            local info = BaseDataManager:getReward(item)
            if item.res_type == EnumDropType.GOODS then
                local goodsData = ItemData:objectByID(item.res_id)
                bg:setTexture(GetBackgroundForGoods(goodsData))
            else
                bg:setTexture(GetColorIconByQuality(info.quality))
            end
            icon:setTexture(info.path)
            if item.number > 1 then
                number:setVisible(true)
                number:setText("X" .. item.number)
            else
                number:setVisible(false)
            end

            if item.type == EnumDropType.GOODS then
                local rewardItem = {itemid = item.itemid}

                local itemData   = ItemData:objectByID(item.itemid)

                if itemData.type == EnumGameItemType.Piece or itemData.type == EnumGameItemType.Soul then
                    Public:addPieceImg(icon,rewardItem,true)
                else
                    Public:addPieceImg(icon,rewardItem,false)
                end
            end
            bg.rewardItems = rewardItems
            bg.index = i
            bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClick));


        else
            bg:setVisible(false)
        end
    end


    local img_ylq                  = TFDirector:getChildByPath(widget, 'img_ylq')
    local btn_get                  = TFDirector:getChildByPath(widget, 'btn_get')

    local status = OperationActivitiesManager:getActivityRewardStatus(self.id, reward.index)
    
    if status == 0 then
        btn_get:setTouchEnabled(true)
        btn_get:setGrayEnabled(false)
    else
        btn_get:setTouchEnabled(false)
        btn_get:setGrayEnabled(true)
    end

    if status == 5 or status == 4 then
        img_ylq:setVisible(true)
        btn_get:setVisible(false)
    else
        img_ylq:setVisible(false)
        btn_get:setVisible(true)
    end

    local index = activity
    function getButtonClickHandle(widget)
        OperationActivitiesManager:sendMsgToGetActivityReward(self.id, reward.index)
    end
    btn_get:addMEListener(TFWIDGET_CLICK, audioClickfun(getButtonClickHandle),1)



    local txt_title                  = TFDirector:getChildByPath(widget, 'txt_title')
    txt_title:setVisible(false)

    local panel_rewardnum                  = TFDirector:getChildByPath(widget, 'panel_rewardnum')
    local txt_maxwarning                  = TFDirector:getChildByPath(widget, 'txt_maxwarning')
    if panel_rewardnum then
        panel_rewardnum:setVisible(false)
    end
    if txt_maxwarning then
        txt_maxwarning:setVisible(false)
    end
end

return Activity_Continue_Recharge