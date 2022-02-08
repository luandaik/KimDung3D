-- client side SevenDaysPowerLayer.lua
--[[
 * @Description: 七天战力
 ]]
-- script writer Stephen.tao
-- creation time 2016-06-14

local SevenDaysPowerLayer = class("SevenDaysPowerLayer", BaseLayer)

CREATE_SCENE_FUN(SevenDaysPowerLayer)
CREATE_PANEL_FUN(SevenDaysPowerLayer)



local halfPrizeShopData = SevenDayPowerManager.sevenDaysPowerConfig 

function SevenDaysPowerLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.zhanliactivities.ZhanLiMain")
end

function SevenDaysPowerLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.btn_close   = TFDirector:getChildByPath(ui, 'btn_close')
    self.txt_power   = TFDirector:getChildByPath(ui, 'txt_power')
    self.panel_zhanli   = TFDirector:getChildByPath(ui, 'panel_zhanli')
    self.panel_role   = TFDirector:getChildByPath(ui, 'panel_role')


    self.txt_timedesc  = TFDirector:getChildByPath(ui, 'txt_timedesc')
    self.txt_timecount = TFDirector:getChildByPath(ui, 'txt_timecount')

    self.txt_timedesc:setVisible(false)
    self.txt_timecount:setVisible(false)

    self.img_pinzhiditu  = TFDirector:getChildByPath(ui, 'img_pinzhiditu')
    self.img_pinzhiditu:setVisible(false)
    self.img_pinzhiditu:retain()
    self.img_pinzhiditu:removeFromParent(true)

    self:RefreshUI()
end

function SevenDaysPowerLayer:onShow()
    self.super.onShow(self)
end

function SevenDaysPowerLayer:RefreshUI()
    self.txt_power:setText(SevenDayPowerManager.curPower)
    if self.tableView == nil then
        self:creatTableView()
    end
    SevenDayPowerManager:reSortReward();
    self.tableView:reloadData()
    self:drawRoleLayer()
end
function SevenDaysPowerLayer:creatTableView()
    local  tableView =  TFTableView:create()
    -- tableView:setName("btnTableView")
    tableView:setTableViewSize(self.panel_zhanli:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableView:setPosition(self.panel_zhanli:getPosition())
    self.tableView = tableView
     
    self.tableView.logic = self

    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, SevenDaysPowerLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, SevenDaysPowerLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, SevenDaysPowerLayer.numberOfCellsInTableView)


    self.panel_zhanli:getParent():addChild(self.tableView,1)
end

function SevenDaysPowerLayer:removeUI()
    self.super.removeUI(self)
    if self.img_pinzhiditu then
        self.img_pinzhiditu:release()
        self.img_pinzhiditu = nil
    end
end

--注册事件
function SevenDaysPowerLayer:registerEvents()
    self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    local function sevenDayTimerEvent(sender)
        -- print("sender = ", sender)
        -- v.status    = status
        -- v.desc1     = timedesc1
        -- v.desc2     = timedesc2
        if sender == nil then
            return
        end

        local status = sender.status

        -- print("七日状态 = ", status)
        -- 0 关闭 ； 1 七天内 ； 2 过了七天 3天内
        if status == 1 then
            --self.txt_timedesc:setText("离活动结束:")
            self.txt_timedesc:setText(localizable.sevendays_activity_over)

        elseif status == 2 then
            --self.txt_timedesc:setText("离领奖结束:")
            self.txt_timedesc:setText(localizable.sevendays_getaward_over)
        end

        if self.txt_timecount then
            self.txt_timecount:setText(sender.desc1)
        end
        self.txt_timedesc:setVisible(true)
        self.txt_timecount:setVisible(true)
    end

    SevenDayPowerManager:addSevenDaysEvent(self, 2002, sevenDayTimerEvent)

    self.powerRewardReponseNotice = function ( event )
        self:RefreshUI()
    end

    TFDirector:addMEGlobalListener(SevenDayPowerManager.PowerRewardReponseNotice ,self.powerRewardReponseNotice);
end

function SevenDaysPowerLayer:removeEvents()

    self.super.removeEvents(self)

    SevenDayPowerManager:removeOnlineRewardTimer(2002)
    TFDirector:removeMEGlobalListener(SevenDayPowerManager.PowerRewardReponseNotice ,self.powerRewardReponseNotice)
    self.powerRewardReponseNotice = nil
end


function SevenDaysPowerLayer.DayBtnClickHandle(sender)
    local self  = sender.logic
    local index = sender.index
end


function SevenDaysPowerLayer.numberOfCellsInTableView(table)
    return SevenDayPowerManager.rewardList:length()
end

function SevenDaysPowerLayer.cellSizeForTable(table,idx)
    if idx == SevenDayPowerManager.rewardList:length()-1 then
        return 146, 806
    end
    return 140, 806
end

function SevenDaysPowerLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local node = self.img_pinzhiditu:clone()
        node:setPosition(ccp(395,67))
        node:setVisible(true)
        cell.node = node
        cell:addChild(node);
    end
    if idx == SevenDayPowerManager.rewardList:length()-1 then
        cell.node:setPosition(ccp(395,73))
    else
        cell.node:setPosition(ccp(395,67))
    end
    self:showNode(cell.node,idx+1)
    return cell
end

function SevenDaysPowerLayer:showNode(widget, idx)
    local rewardInfo = SevenDayPowerManager.rewardList:objectAt(idx)
    if rewardInfo == nil then
        widget:setVisible(false)
        return
    end
    widget:setVisible(true)

    local lbl_task  = TFDirector:getChildByPath(widget, 'lbl_task')
    lbl_task:setText(rewardInfo.name)
    local btn_go  = TFDirector:getChildByPath(widget, 'btn_go')
    btn_go:setVisible(false)

    local lbl_progress  = TFDirector:getChildByPath(widget, 'lbl_progress')
    local btn_get  = TFDirector:getChildByPath(widget, 'btn_get')
    local img_lingqu  = TFDirector:getChildByPath(widget, 'img_lingqu')
    img_lingqu:setVisible(false)
    btn_get:setVisible(true)
    if SevenDayPowerManager.curPower >= rewardInfo.power then
        btn_get:setGrayEnabled(false)
        btn_get:setTouchEnabled(true)
        if SevenDayPowerManager.getRewardRecord[rewardInfo.id] then
            img_lingqu:setVisible(true)
            btn_get:setVisible(false)
        end
        lbl_progress:setText(stringUtils.format(localizable.SevenDaysPowerManager_text1,SevenDayPowerManager.curPower,rewardInfo.power))
    else
        btn_get:setGrayEnabled(true)
        btn_get:setTouchEnabled(false)
        lbl_progress:setText(stringUtils.format(localizable.SevenDaysPowerManager_text2,SevenDayPowerManager.curPower,rewardInfo.power))
    end
    local rewardList = RewardConfigureData:GetRewardItemListById(rewardInfo.reward_id)

    function btnGetClick( sender )
        SevenDayPowerManager:receivePowerRewardRequest( rewardInfo.id )
    end
    btn_get:addMEListener(TFWIDGET_CLICK, audioClickfun(btnGetClick));
    for i=1,2 do
        local goodsIcon = TFDirector:getChildByPath(widget, 'img_goods'..i+1)
        if rewardList and rewardList:length() >= i then
            local reward = rewardList:objectAt(i)
            goodsIcon:setVisible(true)

            local commonReward = {}
            commonReward.type = reward.type;
            commonReward.itemId = reward.itemid;
            commonReward.number = reward.number
            local rewardData = BaseDataManager:getReward(commonReward)
            local img_icon = TFDirector:getChildByPath(goodsIcon, 'img_icon')
            local txt_num = TFDirector:getChildByPath(goodsIcon, 'txt_num')
            goodsIcon:setTexture(GetColorIconByQuality(rewardData.quality))
            img_icon:setTexture(rewardData.path)
            txt_num:setText(rewardData.number)

            goodsIcon:setTouchEnabled(true)
            function onClick( sender )
                Public:ShowItemTipLayer(reward.itemid, reward.type);
            end
            goodsIcon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
        else
            goodsIcon:setVisible(false)
        end

    end
end

function SevenDaysPowerLayer:getRewardList(id)
    local rewardConfig = RewardConfigureData:objectByID(id);
    if rewardConfig == nil then
        return nil
    end
    local rewardList = MEArray:new()
    local temptbl = string.split(rewardConfig.reward_conf,',')          --分解"|"
    for k,v in pairs(temptbl) do
        local reward = RewardItemData:objectByID(tonumber(v))
        if reward then
            rewardList:push(reward)
        end
    end
    return rewardList
end

function SevenDaysPowerLayer:drawRoleLayer()
    local isAllUnlock = true
    local isget = 0
    for i=1,3 do
        local rewardInfo = SevenDayPowerManager.specialRewardList:objectAt(i)
        local panel = TFDirector:getChildByPath(self.panel_role, 'panel_role'..i)
        local img_ren  = TFDirector:getChildByPath(panel, 'img_ren1')
        local btn_lingqu  = TFDirector:getChildByPath(panel, 'btn_lingqu1')
        btn_lingqu:setVisible(false)
        local img_yjs  = TFDirector:getChildByPath(panel, 'img_yjs1')
        local img_kjs  = TFDirector:getChildByPath(panel, 'img_kjs1')
        local img_wjs  = TFDirector:getChildByPath(panel, 'img_wjs1')
        local txt_num  = TFDirector:getChildByPath(img_kjs, 'txt_num')
        txt_num:setText(rewardInfo.power)
        local img_ylq  = TFDirector:getChildByPath(panel, 'img_ylq')
        img_ylq:setVisible(false)
        local bg_name  = TFDirector:getChildByPath(panel, 'bg_name')
        local txt_name  = TFDirector:getChildByPath(bg_name, 'txt_name')
        local img_cs  = TFDirector:getChildByPath(bg_name, 'img_cs')

        function btnGetClick( sender )
            CommonManager:showOperateSureLayer(
                function()
                    SevenDayPowerManager:receivePowerRewardRequest( rewardInfo.id )
                end,
                nil,
                {
                    msg = localizable.SevenDaysPowerManager_text3,
                }
            )
        end
        btn_lingqu:addMEListener(TFWIDGET_CLICK, audioClickfun(btnGetClick));

        local rewardList = RewardConfigureData:GetRewardItemListById(rewardInfo.reward_id)
        if rewardList then
            local reward = rewardList:objectAt(1)
            local roleId = reward.itemid
            local role = RoleData:objectByID(roleId)
            if role then
                img_ren:setTexture(role:getBigImagePath())
                txt_name:setText(role.name)
                img_cs:setTexture(GetFontByQuality(role.quality))
            end
        end
        if SevenDayPowerManager.curPower < rewardInfo.power then
            isAllUnlock = false
            img_kjs:setVisible(true)
            img_wjs:setVisible(true)
            img_yjs:setVisible(false)
        else
            img_yjs:setVisible(true)
            img_kjs:setVisible(false)
            img_wjs:setVisible(false)
        end
        if SevenDayPowerManager.getRewardRecord[rewardInfo.id] then
            isget = i
        end
    end
    if isAllUnlock or SevenDayPowerManager:sevenDaysOpenSatus() == 2 then
        for i=1,3 do
            local rewardInfo = SevenDayPowerManager.specialRewardList:objectAt(i)
            local panel = TFDirector:getChildByPath(self.panel_role, 'panel_role'..i)
            local btn_lingqu  = TFDirector:getChildByPath(panel, 'btn_lingqu1')
            local img_yjs  = TFDirector:getChildByPath(panel, 'img_yjs1')
            -- local img_wjs  = TFDirector:getChildByPath(panel, 'img_wjs1')
            local img_ylq  = TFDirector:getChildByPath(panel, 'img_ylq')

            img_yjs:setVisible(false)
            if isget == 0 and SevenDayPowerManager.curPower >= rewardInfo.power then
                btn_lingqu:setVisible(true)
            else
                btn_lingqu:setVisible(false)
            end
            if isget == i then
                img_ylq:setVisible(true)
            else
                img_ylq:setVisible(false)
            end
        end
    end
end


return SevenDaysPowerLayer