-- client side Activity_jianghumoney.lua
--[[
 * @Description: 江湖基金
 ]]
-- script writer Happy.All
-- creation time 2016-06-12


local Activity_jianghumoney = class("Activity_jianghumoney", BaseLayer)

function Activity_jianghumoney:ctor(data)
    self.super.ctor(self)
    self.activityId = data
    self:init("lua.uiconfig_mango_new.operatingactivities.jianghumoney")
end

function Activity_jianghumoney:initUI(ui)
    self.super.initUI(self,ui)

    self.tabBtn = {}
    local imgTable = {"ui_new/operatingactivities/tab_lptb.png","ui_new/operatingactivities/tab_lptbh.png",
                        "ui_new/operatingactivities/tab_jptb.png","ui_new/operatingactivities/tab_jptbh.png",
                        "ui_new/operatingactivities/tab_jiptb.png","ui_new/operatingactivities/tab_jiptbh.png"}
    for i=1,3 do
        self.tabBtn[i] = TFDirector:getChildByPath(ui, 'btn_type'..i)
        self.tabBtn[i].imgNormal = imgTable[(i-1)*2+1]
        self.tabBtn[i].imgSelect = imgTable[(i-1)*2+2]

        CommonManager:setRedPoint(self.tabBtn[i], OperationActivitiesManager:getFundDataRedPointByType(i),"fundDataRedPoint",ccp(0,0))
    end

    self.FundBuyLevel = ConstantData:objectByID("FundBuyLevel").value or 40

    --购买按钮
    self.btn_buy = TFDirector:getChildByPath(ui, "btn_buy")
    self.btn_buy.logic = self
    self.txt_numb = TFDirector:getChildByPath(ui, "txt_numb")
    self.img_buy = TFDirector:getChildByPath(ui, "img_buy")

    --购买条件
    self.txt_tips = TFDirector:getChildByPath(ui, "txt_tips")
    self.txt_tips:setVisible(true)
    self.txt_tips:setText(localizable.Activity_jianghumoney_des)
    self.txt_tips1 = TFDirector:getChildByPath(ui, "txt_tips1")
    self.txt_vip = TFDirector:getChildByPath(ui, "txt_vip")

    --收益
    self.txt_num = TFDirector:getChildByPath(ui, "txt_num")
    self.img_bfb = TFDirector:getChildByPath(ui, "img_bfb")

    --活动有效期
    self.txt_time = TFDirector:getChildByPath(ui, "txt_time")
    self.txt_time:setText(localizable.Activity_jianghumoney_ExpiryDate)

    --活动内容
    self.txt_content = TFDirector:getChildByPath(ui, "txt_content")
    self.txt_content:setText(stringUtils.format(localizable.Activity_jianghumoney_Content,self.FundBuyLevel))

    self.TabViewUI = TFDirector:getChildByPath(ui, "panel_list")

    self.cellModel = createUIByLuaNew("lua.uiconfig_mango_new.operatingactivities.RewardItem")
    self.cellModel:retain()

    
    self:drawSelectTabBtn(OperationActivitiesManager:getFundDataActivityIndex())
end

function Activity_jianghumoney:removeUI()
    self.super.removeUI(self)
    if self.cellModel then
        self.cellModel:release()
        self.cellModel = nil
    end    
end

function Activity_jianghumoney:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function Activity_jianghumoney:dispose()
    self.super.dispose(self)
end

function Activity_jianghumoney:refreshUI()
    
end

function Activity_jianghumoney:registerEvents()
    self.super.registerEvents(self)
    for i=1,3 do
        self.tabBtn[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.tabBtnClick))
        self.tabBtn[i].logic = self
        self.tabBtn[i].idx = i
    end

    self.btn_buy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.buyBtnClick))

    self.activityUpdateCallBack = function(event)

        self.tabViewDataList = OperationActivitiesManager:getfundDataByType(self.currTabBtnIndex)

        self:drawTitleDetail(self.currTabBtnIndex)

        self.TabView:reloadData()
        self.TabView:setScrollToBegin()

        for i=1,3 do
            CommonManager:setRedPoint(self.tabBtn[i], OperationActivitiesManager:getFundDataRedPointByType(i),"fundDataRedPoint",ccp(0,0))
        end
    end

    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_FUND_DATA_UPDATE, self.activityUpdateCallBack)
end

function Activity_jianghumoney:removeEvents()
        
    self.super.removeEvents(self)

    self.TabView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_FUND_DATA_UPDATE, self.activityUpdateCallBack)
    self.activityUpdateCallBack = nil
end

function Activity_jianghumoney.cellSizeForTable(table,idx)
    local self = table.logic

    return 131,416
end

function Activity_jianghumoney.numberOfCellsInTableView(table)
    local self = table.logic
    
    return #self.tabViewDataList
end

function Activity_jianghumoney.tableCellAtIndex(table, idx)

    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel:clone()
        panel:setPosition(ccp(0,131))
        cell:addChild(panel)
        cell.panelNode = panel        
    else
        panel = cell.panelNode
    end

    idx = idx + 1

    local itemData = self.tabViewDataList[idx]

    local txt_desc1 = TFDirector:getChildByPath(panel, "txt_desc1")
    txt_desc1:setText(localizable.GameActivitiesManager_dengji)

    local txt_desc2 = TFDirector:getChildByPath(panel, "txt_desc2")
    txt_desc2:setVisible(false)

    local txt_maxwarning = TFDirector:getChildByPath(panel, "txt_maxwarning")
    txt_maxwarning:setVisible(false)

    local txt_title = TFDirector:getChildByPath(panel, "txt_title")
    txt_title:setText(itemData.return_level)

    local img_ylq = TFDirector:getChildByPath(panel, "img_ylq")
    local btn_get = TFDirector:getChildByPath(panel, "btn_get")
    btn_get:addMEListener(TFWIDGET_CLICK, audioClickfun(self.moreButtonClick))
    btn_get.logic = self
    btn_get.idx = idx
    if itemData.status == 0 then
        img_ylq:setVisible(false)
        btn_get:setVisible(true)
        btn_get:setGrayEnabled(true)
        btn_get:setTouchEnabled(false)
    elseif itemData.status == 1 then
        if MainPlayer:getLevel() >= itemData.return_level then
            img_ylq:setVisible(false)
            btn_get:setVisible(true)
            btn_get:setGrayEnabled(false)
            btn_get:setTouchEnabled(true)
        else
            img_ylq:setVisible(false)
            btn_get:setVisible(true)
            btn_get:setGrayEnabled(true)
            btn_get:setTouchEnabled(false)
        end
    else
        img_ylq:setVisible(true)
        btn_get:setVisible(false)
    end

    local rewardList = itemData:getReward()
    local length = rewardList:length()
    for i = 1, 3 do
        local img_quality   = TFDirector:getChildByPath(panel, 'img_bg_'..i)
        local img_icon      = TFDirector:getChildByPath(panel, 'img_icon_'..i)
        local txt_number    = TFDirector:getChildByPath(panel, 'txt_number_'..i)

        if i <= length then
            img_quality:setVisible(true)
            img_icon:setVisible(true)
            txt_number:setVisible(true)

            local item = rewardList:objectAt(i)
            if item.type == EnumDropType.GOODS then
                local goodsData = ItemData:objectByID(item.itemid)
                img_quality:setTexture(GetBackgroundForGoods(goodsData))
            else
                img_quality:setTexture(GetColorIconByQuality(item.quality))
            end

            img_icon:setTexture(item.path)

            if item.number > 1 then
                txt_number:setVisible(true)
                if item.number < 10000 then
                    txt_number:setText("X" .. item.number)
                else
                    local floatValue = string.format("%.0f", math.ceil(item.number/10000))
                    txt_number:setText("X" ..  stringUtils.format(localizable.rewardItemcommmon_wan, floatValue))
                end
            else
                txt_number:setVisible(false)
            end

            if item.type == EnumDropType.GOODS then
                local rewardItem = {itemid = item.itemid}
                local itemData   = ItemData:objectByID(item.itemid)
                if itemData.type == EnumGameItemType.Piece or itemData.type == EnumGameItemType.Soul then
                    Public:addPieceImg(img_icon,rewardItem,true)
                else
                    Public:addPieceImg(img_icon,rewardItem,false)
                end
            end
            img_quality.logic = self
            img_quality.reward_id = item.itemid
            img_quality.reward_type = item.type
            img_quality:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickItem))            
        else
            img_quality:setVisible(false)
            img_icon:setVisible(false)
            txt_number:setVisible(false)
        end        
    end
    return cell
end

function Activity_jianghumoney:drawTitleDetail(index)
    local item = self.tabViewDataList[1]

    --购买按钮
    if item.status ~= 0 then
        self.img_buy:setVisible(true)
        self.btn_buy:setVisible(false)
        self.btn_buy:setGrayEnabled(false)
        self.btn_buy:setTouchEnabled(true)
    elseif OperationActivitiesManager:isBuyOtherFundData(index) then
        self.img_buy:setVisible(false)
        self.btn_buy:setVisible(true)
        self.btn_buy:setGrayEnabled(true)
        self.btn_buy:setTouchEnabled(false)
    else
        self.img_buy:setVisible(false)
        self.btn_buy:setVisible(true)
        self.btn_buy:setGrayEnabled(false)
        self.btn_buy:setTouchEnabled(true)
    end
    self.txt_numb:setText(item.price)
    self.txt_tips1:setText(localizable.Activity_jianghumoney_vip_des[index])
    self.txt_vip:setText(stringUtils.format(localizable.Activity_jianghumoney_vip_num,item.vip_level))
    self.txt_tips1:setPositionX(self.txt_vip:getPositionX() + self.txt_vip:getContentSize().width)
    self.txt_num:setText(item.reward_multiple)
    self.img_bfb:setPositionX(self.txt_num:getPositionX() + self.txt_num:getContentSize().width)
end

function Activity_jianghumoney:drawSelectTabBtn( index )
    if self.currTabBtnIndex == index then
        return
    end

    for i=1,3 do
        if i == index then
            self.currTabBtnIndex = index
            self.tabBtn[i]:setTextureNormal(self.tabBtn[i].imgSelect)
        else
            self.tabBtn[i]:setTextureNormal(self.tabBtn[i].imgNormal)
        end
    end
    --重置红点
    local redType = self.currTabBtnIndex or 1
    OperationActivitiesManager:resetFundDataRedPointInVisible(redType)
    CommonManager:setRedPoint(self.tabBtn[redType], OperationActivitiesManager:getFundDataRedPointByType(redType),"fundDataRedPoint",ccp(0,0))

    if self.TabView == nil then
        --创建TabView        
        self.TabView =  TFTableView:create()
        self.TabView:setTableViewSize(self.TabViewUI:getContentSize())
        self.TabView:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.TabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.TabView.logic = self
        self.TabViewUI:addChild(self.TabView)
        self.TabView:setPosition(ccp(0,0))

        self.TabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
        self.TabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
        self.TabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)        
    end
    self.tabViewDataList = OperationActivitiesManager:getfundDataByType(self.currTabBtnIndex)

    self:drawTitleDetail(index)

    self.TabView:reloadData()
    self.TabView:setScrollToBegin()


end

function Activity_jianghumoney.tabBtnClick( btn )
    local self = btn.logic
    local idx = btn.idx
    self:drawSelectTabBtn(idx)
end

function Activity_jianghumoney.onClickItem(sender)
    local self = sender.logic

    Public:ShowItemTipLayer(sender.reward_id, sender.reward_type)
end

function Activity_jianghumoney.buyBtnClick( sender )
    local self = sender.logic
    local item = self.tabViewDataList[1]

    --等级限制
    local limitLevel = self.FundBuyLevel
    if MainPlayer:getLevel() > limitLevel then
        local str = stringUtils.format(localizable.Activity_jianghumoney_Limit, limitLevel)
        toastMessage(str)
        return
    end

    local taskid = sender.taskid
    local halfPrize = item.price or 0
    local target_value = item.vip_level or 0

    local tipStr = stringUtils.format(localizable.Activity_jianghumoney_Tips[item.type], halfPrize)

    if target_value > MainPlayer:getVipLevel() then
        local msg = stringUtils.format(localizable.common_todo_vip, target_value)
        CommonManager:showOperateSureLayer(
                function()
                    PayManager:showPayLayer();
                end,
                nil,
                {
                title = localizable.youli_text2,
                msg = msg,
                uiconfig = "lua.uiconfig_mango_new.common.NeedTpPayLayer"
                }
        )
        return
    end

    if MainPlayer:isEnoughSycee(halfPrize, true) then
        CommonManager:showOperateSureLayer(
            function()
                OperationActivitiesManager:requestBuyFundDataEvent( item.type )
            end,
            function()
                AlertManager:close()
            end,
            {
            title = localizable.common_tips ,
            msg = tipStr,
            --uiconfig = "lua.uiconfig_mango_new.common.NeedTpPayLayer"
            }
        )        
    end
end

function Activity_jianghumoney.moreButtonClick( sender )
    local self = sender.logic
    local item = self.tabViewDataList[sender.idx]

    OperationActivitiesManager:requestRewardFundDataEvent( item.id )
end
return Activity_jianghumoney