local Activity_VIP_Gift = class("Activity_VIP_Gift", BaseLayer)

function Activity_VIP_Gift:ctor(type)
    self.super.ctor(self)
    self.id   = type
    self.type = OperationActivitiesManager.Type_VIP_GIFT
    self:init("lua.uiconfig_mango_new.operatingactivities.VipShop")
end

function Activity_VIP_Gift:initUI(ui)
    self.super.initUI(self,ui)
    self.cell_model 				= TFDirector:getChildByPath(ui, 'img_di')

    self.cell_model:removeFromParent(false)
    self.cell_model:retain()

    self.panel_list            = TFDirector:getChildByPath(ui, 'Panel_cell')
    self.title_time            = TFDirector:getChildByPath(ui, 'title_time')
    self.txt_time            = TFDirector:getChildByPath(self.title_time, 'txt_time')
    self.txt_time:setFontSize(16)
    -- self.btn_type2            = TFDirector:getChildByPath(ui, 'btn_type2')
    -- self.btn_type1 			  = TFDirector:getChildByPath(ui, 'btn_type1')

    self.tab = {
        TFDirector:getChildByPath(ui, 'btn_type1'),
        TFDirector:getChildByPath(ui, 'btn_type2'),
    }

    self.normalTextures = {
        "ui_new/operatingactivities/tab_vipmr.png",
        "ui_new/operatingactivities/tab_vipcz.png"
    }
    self.selectedTextures = {
        "ui_new/operatingactivities/tab_vipmrh.png",
        "ui_new/operatingactivities/tab_vipczh.png"
    }

    self.tab[1]:setTextureNormal(self.selectedTextures[1])
    self.tab[2]:setTextureNormal(self.normalTextures[2])
    self.title_time:setVisible(false)
    self.costType = 1
    local rewardList    = OperationActivitiesManager:getActivityRewardList(self.id)
    self.rewardList = {}
    self.rewardList[1] = self.rewardList[1] or TFArray:new()
    self.rewardList[2] = self.rewardList[2] or TFArray:new()
    self.rewardList[1]:clear();
    self.rewardList[2]:clear();
    local vipLevel = MainPlayer:getVipLevel()
    for reward in rewardList:iterator() do
        -- print("reward -->",reward)
        if reward.vip >= vipLevel then
            if reward.cost == 0 then
                self.rewardList[1]:pushBack(reward)
            else
                self.rewardList[2]:pushBack(reward)
                -- table.insert(self.rewardList[2] , reward)
            end
        end
    end

    self:refreshTableView()
end


function Activity_VIP_Gift:refreshTableView()
    local function sortList( reward1, reward2 )
        if reward1.gottime < reward2.gottime then
            return true
        elseif reward1.gottime > reward2.gottime then
            return false
        elseif reward1.gottime == reward2.gottime then
            if reward1.vip > reward2.vip then
                return false
            else
                return true
            end
        end
    end
    -- for i,v in ipairs(self.rewardList[self.costType]) do
    --     print(i,v.vip)
    -- end
    if self.rewardList[self.costType]:length() >= 2 then
        self.rewardList[self.costType]:sort(sortList)
        -- table.sort(self.rewardList[self.costType], sortList)
    end
    -- for i,v in ipairs(self.rewardList[self.costType]) do
    --     print(i,v.vip)
    -- end
    if self.tableView == nil then
        local tabView =  TFTableView:create()
        tabView:setTableViewSize(self.panel_list:getContentSize())
        tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        tabView.logic = self
        self.panel_list:addChild(tabView)
        tabView:setPosition(ccp(0, 0))
        self.tableView = tabView

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
        self.tableView:reloadData()
    else
        self.tableView:reloadData()
    end
end



function Activity_VIP_Gift.cellSizeForTable(table,idx)
    return 131,553
end

function Activity_VIP_Gift.numberOfCellsInTableView(table)
    local self = table.logic
    if self.rewardList[self.costType] then
        local num = self.rewardList[self.costType]:length()
        return num
    else
        return 0
    end
end

function Activity_VIP_Gift.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.cell_model:clone()
        panel:setPosition(ccp(297,65))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end
    cell.panel:setVisible(true) 
    local info = self.rewardList[self.costType]:objectAt(idx + 1)
    if info then
        self:setPanelInfo(cell.panel, info)
    else
        cell.panel:setVisible(false) 
    end
    return cell
end


function Activity_VIP_Gift:setPanelInfo(panel, rewardInfo)
    if panel.txt_title == nil then
        local txt_title = TFDirector:getChildByPath(panel,"txt_title")
        panel.txt_title = txt_title
        local panel_rewardnum = TFDirector:getChildByPath(panel,"panel_rewardnum")
        panel.panel_rewardnum = panel_rewardnum
        local txt_desc2 = TFDirector:getChildByPath(panel,"txt_desc2")
        panel.txt_desc2 = txt_desc2
        local btn_get = TFDirector:getChildByPath(panel,"btn_get")
        panel.btn_get = btn_get
        local img_ylq = TFDirector:getChildByPath(panel,"img_ylq")
        panel.img_ylq = img_ylq
        local btn_ts = TFDirector:getChildByPath(panel,"btn_ts")
        panel.btn_ts = btn_ts

        local btn_buy = TFDirector:getChildByPath(panel,"btn_buy")
        panel.btn_buy = btn_buy
        local img_ygm = TFDirector:getChildByPath(panel,"img_ygm")
        panel.img_ygm = img_ygm
        -- local itemIconList = {}
        for i=1,3 do
            local itemIconList = TFDirector:getChildByPath(panel,"img_bg_"..i)
            itemIconList:setVisible(false)
        end
        local panel_view = TFDirector:getChildByPath(panel, 'panel_huadong')
        panel.panel_view = panel_view
    end
    panel.txt_title:setText(rewardInfo.vip)
    panel.panel_rewardnum:setVisible(false)

    if panel.scrollView == nil then
        local scrollView = TFScrollView:create()
        scrollView:setAnchorPoint(ccp(0, 0))
        scrollView:setPosition(ccp(0,0))
        scrollView:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
        scrollView:setDirection(SCROLLVIEW_DIR_HORIZONTAL)

        scrollView:setSize(panel.panel_view:getSize())
        -- local height = panel.panel_view:getSize().height
        panel.panel_view:addChild(scrollView)
        scrollView:setTag(617)
        panel.scrollView = scrollView
    end

    panel.scrollView:removeAllChildrenWithCleanup(true)
    panel.scrollView:setBounceEnabled(true)
    -- panel.scrollView:setContentOffset(ccp(0, 0), 0);
    local widthPerNode = 0
    local posx = 0
    local posy = 0
    for reward in rewardInfo.reward:iterator() do
        local node = Public:createIconNumNode(reward)
        -- local node = Public:createIconNumAndBagNode(rewarddata)
        node:setScale(0.6)
        node:setPosition(ccp(posx, posy))
        panel.scrollView:addChild(node)
        widthPerNode = node:getSize().width
        posx = posx + widthPerNode/2 + 30
    end
    -- posx = posx - widthPerNode/2 - 30
    panel.scrollView:setInnerContainerSize(CCSizeMake(posx, panel.panel_view:getSize().height))
    panel.scrollView:jumpToLeft();
    -- if posx > panel.panel_view:getSize().width then
    --     panel.scrollView:setIsInnerMoveEnabled(true)
    -- else
    --     panel.scrollView:setIsInnerMoveEnabled(false)
    -- end
    local function getRewardBtnClick( sender )
        OperationActivitiesManager:sendMsgToGetActivityReward(self.id , rewardInfo.id,nil,0)
    end

    local function buyRewardBtnClick( sender )
        CommonManager:showOperateSureLayer(
                        function()
                            OperationActivitiesManager:sendMsgToGetActivityReward(self.id , rewardInfo.id,nil,0);
                        end,
                        nil,
                        {
                        msg = stringUtils.format(localizable.GameActivitiesManager_VIPGiftText3,tonumber(rewardInfo.price[3]))
                        }
                )
        
    end

    local function openPayLayer( sender )
        PayManager:showPayLayer()
    end

    panel.btn_get:setVisible(false)
    panel.img_ylq:setVisible(false)
    panel.btn_ts:setVisible(false)
    panel.btn_buy:setVisible(false)
    panel.img_ygm:setVisible(false) 


    local roleVip = MainPlayer:getVipLevel()
    if roleVip ~= rewardInfo.vip then
        panel.btn_ts:setVisible(true)
        panel.btn_ts:addMEListener(TFWIDGET_CLICK,  audioClickfun(openPayLayer),1);
    else
        if self.costType == 1 then
            if rewardInfo.gottime >= 1 then
                panel.img_ylq:setVisible(true)
            else
                panel.btn_get:setVisible(true)
                panel.btn_get:addMEListener(TFWIDGET_CLICK,  audioClickfun(getRewardBtnClick),1);
            end
        else
            if rewardInfo.gottime >= 1 then
                panel.img_ygm:setVisible(true)
            else
                panel.btn_buy:setVisible(true)
                local img_res_icon = TFDirector:getChildByPath(panel.btn_buy,"img_res_icon")
                local txt_numb = TFDirector:getChildByPath(panel.btn_buy,"txt_numb")
                local textureIcon = GetResourceIconForGeneralHead(tonumber(rewardInfo.price[1]))
                img_res_icon:setTexture(textureIcon)
                txt_numb:setText(tonumber(rewardInfo.price[3]))
                panel.btn_buy:addMEListener(TFWIDGET_CLICK,  audioClickfun(buyRewardBtnClick),1);
            end
            
        end 
    end

    if self.costType == 1 then
        panel.txt_desc2:setText(localizable.GameActivitiesManager_VIPGiftText1)
    else
        panel.txt_desc2:setText(localizable.GameActivitiesManager_VIPGiftText2)
    end
end

function Activity_VIP_Gift:removeUI()
    self.super.removeUI(self)
    if self.cell_model then
        self.cell_model:release()
        self.cell_model = nil
    end
end

function Activity_VIP_Gift:onShow()
    self.super.onShow(self)
 --    local rewardCount = self.rewardWidgetArray:length()
	-- for i=1,rewardCount do
	-- 	local widget = self.rewardWidgetArray:objectAt(i)
	-- 	widget:onShow()
	-- end
    self:refreshUI()
end

function Activity_VIP_Gift:dispose()
    self.super.dispose(self)
end

function Activity_VIP_Gift:refreshUI()   
    print("当前活动类型 = ", self.id)
    self:calculationSurplusTime()
end


function Activity_VIP_Gift:setLogic(logic)
    self.logic = logic
end

function Activity_VIP_Gift:registerEvents()
    self.super.registerEvents(self)

    self.updateRewardCallback = function(event)
        self:refreshTableView()
    end;
    self.vipChangeCallback = function(event)
        local rewardList    = OperationActivitiesManager:getActivityRewardList(self.id)
        self.rewardList = self.rewardList or {}
        self.rewardList[1] = self.rewardList[1] or TFArray:new()
        self.rewardList[2] = self.rewardList[2] or TFArray:new()
        self.rewardList[1]:clear();
        self.rewardList[2]:clear();
        local vipLevel = MainPlayer:getVipLevel()
        for reward in rewardList:iterator() do
            if reward.vip >= vipLevel then
                if reward.cost == 0 then
                    self.rewardList[1]:pushBack(reward)
                else
                    self.rewardList[2]:pushBack(reward)
                    -- table.insert(self.rewardList[2] , reward)
                end
            end
        end

        self:refreshTableView()
    end;

    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD,self.updateRewardCallback)
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_PROGRESS_UPDATE,self.vipChangeCallback)
    TFDirector:addMEGlobalListener(MainPlayer.VipLevelChange,self.vipChangeCallback)

    for i=1,2 do
        self.tab[i].logic = self;
        self.tab[i].index = i;
        self.tab[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.typeChoiceHandle),1);
    end
    self:calculationSurplusTime()
    self.updateTimer = TFDirector:addTimer(1000,-1,nil,function ()
        self:updateTime();
    end)
    -- TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD,self.updateRewardCallback)
end

function Activity_VIP_Gift:calculationSurplusTime()
    self.surplusTime = 0
    local activity = OperationActivitiesManager:getActivityData(self.id)
    if activity == nil then
        return
    end
    local temp_time = MainPlayer:getNowtime() - activity.beginTime
    if temp_time < 0 then
        return
    end
    local clyce = 7*24*3600
    while(temp_time > clyce) do
        temp_time = temp_time - clyce
    end
    self.surplusTime = clyce - temp_time
    self:showTime(self.surplusTime)
end

function Activity_VIP_Gift:updateTime()
    self.surplusTime = self.surplusTime - 1
    if self.surplusTime <= 0 then
        self.surplusTime = 7*24*3600
    end
    self:showTime(self.surplusTime)
end
function Activity_VIP_Gift:showTime(second)
    local day = math.floor(second/(24*60*60))
    second = second - 24*60*60*day
    local hour = math.floor(second/(60*60))
    second = second - 60*60*hour
    local min = math.floor(second/(60))
    -- second = second - 60*min
    -- local str = string.format('%02d:%02d:%02d', day, hour, min)
    local str = stringUtils.format(localizable.common_time_3, day, hour, min)
    -- return str
    self.txt_time:setText(str)
end


function Activity_VIP_Gift.typeChoiceHandle( sender )
    local self = sender.logic
    local index = sender.index
    self.costType = index
    for i=1,2 do
        if i == index then
            self.tab[i]:setTextureNormal(self.selectedTextures[i])
        else
            self.tab[i]:setTextureNormal(self.normalTextures[i])
        end
    end
    if index == 1 then
        self.title_time:setVisible(false)
    else
        self.title_time:setVisible(true)
    end
    self:refreshTableView()
end

function Activity_VIP_Gift:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD,self.updateRewardCallback)
    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_PROGRESS_UPDATE,self.vipChangeCallback)
    TFDirector:removeMEGlobalListener(MainPlayer.VipLevelChange,self.vipChangeCallback)
    self.updateRewardCallback  = nil
    self.vipChangeCallback  = nil
    -- TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD,self.updateRewardCallback)
    self.updateRewardCallback = nil
    if self.updateTimer then
        TFDirector:removeTimer(self.updateTimer)
        self.updateTimer = nil
    end
end

return Activity_VIP_Gift