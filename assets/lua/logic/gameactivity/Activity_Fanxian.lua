
-- ///////////////////////////////////////////////////
-- @Author:             Happy All
-- @Create Date:        2016-12-15 10:59:09
-- @Last Modified time: 2016-12-15 11:42:23
-- @Title:              Activity_Fanxian
-- @Describe:           满减返现
-- ///////////////////////////////////////////////////

local Activity_Fanxian = class("Activity_Fanxian", BaseLayer)

function Activity_Fanxian:ctor(data)
    self.super.ctor(self)

    self.activityId = data
    self.activeData = clone(OperationActivitiesManager:getActivityInfo(data))
    self.rewardList = clone(OperationActivitiesManager:getRewardItemByActivityType(data))

    self:init("lua.uiconfig_mango_new.operatingactivities.FanLiMain")
end

function Activity_Fanxian:initUI(ui)
    self.super.initUI(self,ui)

    local img_upimg = TFDirector:getChildByPath(ui, "img_upimg")
    self.txtBuyNumber = TFDirector:getChildByPath(img_upimg, "txt_number1")
    self.txtBackNumber = TFDirector:getChildByPath(img_upimg, "txt_number2")

    self.TabViewUI = TFDirector:getChildByPath(ui, "Panel_cell")
    self.cellModel = TFDirector:getChildByPath(ui, "img_allbg")
    self.cellModel:setVisible(false)

    self.TabView =  TFTableView:create()
    self.TabView:setTableViewSize(self.TabViewUI:getContentSize())
    self.TabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    self.TabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    self.TabView.logic = self
    self.TabViewUI:addChild(self.TabView)
    self.TabView:setPosition(ccp(0,0))

    self.cutDownTime = TFDirector:getChildByPath(ui, "txt_shengyunumber")
    self.btnHistory = TFDirector:getChildByPath(ui, "btn_buyhistory")
    self.btnMoneyBack = TFDirector:getChildByPath(ui, "btn_moneyback")
    self.btn_help = TFDirector:getChildByPath(ui, "btn_help")

    local buyNumber = 5
    local backNumber = 1
    if self.activeData then
        buyNumber = self.activeData.buyNumber or 5
        backNumber = self.activeData.backNumber or 1
    end
    self.txtBuyNumber:setText(numberToChinese(buyNumber))
    self.txtBackNumber:setText(numberToChinese(backNumber))    
end

function Activity_Fanxian:removeUI()
    self.super.removeUI(self)
end

function Activity_Fanxian:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function Activity_Fanxian:dispose()
    self.super.dispose(self)
end

function Activity_Fanxian:refreshUI()
    
end

function Activity_Fanxian:registerEvents()

    if self.registerEventCallFlag then
        return
    end
    self.super.registerEvents(self)
    
    self.TabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.TabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.TabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)        
    self.TabView:reloadData()
    self.TabView:setScrollToBegin()
    self.registerEventCallFlag = true

    self.btnHistory:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnHistoryClick),1)
    self.btnHistory.logic = self
    self.btnMoneyBack:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnMoneyBackClick),1)
    self.btnMoneyBack.logic = self
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnRuleClick),1)

    self:refreshCutDownTimer()

    self.limitHotUpdateCallback = function (event)
        self.activeData = clone(OperationActivitiesManager:getActivityInfo(self.activityId))
        self.rewardList = clone(OperationActivitiesManager:getRewardItemByActivityType(self.activityId))
        if self.TabView then
            self.TabView:reloadData()
        end
        local buyNumber = 5
        local backNumber = 1
        if self.activeData then
            buyNumber = self.activeData.buyNumber or 5
            backNumber = self.activeData.backNumber or 1
        end
        self.txtBuyNumber:setText(numberToChinese(buyNumber))
        self.txtBackNumber:setText(numberToChinese(backNumber))    
    end
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_FULL_CUT_UPDATE, self.limitHotUpdateCallback)
end

function Activity_Fanxian:removeEvents()
        
    self.super.removeEvents(self)

    self.TabView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    if self.timerHandle then
        TFDirector:removeTimer(self.timerHandle)
        self.timerHandle = nil
    end
    if self.limitHotUpdateCallback then
        TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_FULL_CUT_UPDATE, self.limitHotUpdateCallback)
        self.limitHotUpdateCallback = nil
    end
    self.registerEventCallFlag = nil
end

function Activity_Fanxian.cellSizeForTable(table,idx)
    local self = table.logic
    return 103,563
end

function Activity_Fanxian.numberOfCellsInTableView(table)
    local self = table.logic    
    return self.rewardList:length()
end

function Activity_Fanxian.tableCellAtIndex(table, idx)

    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel:clone()
        local size = panel:getContentSize()
        panel:setPosition(ccp(size.width/2,size.height/2))
        cell:addChild(panel)
        cell.panelNode = panel        
    else
        panel = cell.panelNode
    end
    panel:setVisible(true)
    idx = idx + 1

    self:refreshDataDetails(panel, idx)

    return cell
end

function Activity_Fanxian:refreshDataDetails( panel, idx )
    local dataInfo = self.rewardList:objectAt(idx)
    if dataInfo == nil then
        return
    end
    local imgIconBg = TFDirector:getChildByPath(panel, "img_bg_1")
    local imgIcon = TFDirector:getChildByPath(panel, "img_icon_1")
    local txtNum = TFDirector:getChildByPath(panel, "txt_number_1")
    local txtIconName = TFDirector:getChildByPath(panel, "txt_iconname")
    local txtPriceNum = TFDirector:getChildByPath(panel, "txt_price_num")
    local txtNowPriceNum = TFDirector:getChildByPath(panel, "txt_now_price_num")
    local btnBuy = TFDirector:getChildByPath(panel, "Button_LimitShop_1")
    local imgTips = TFDirector:getChildByPath(panel, "img_tips")
    local txt_shengyubuy = TFDirector:getChildByPath(panel, "txt_shengyubuy")
    local txtSelfBuyCount = TFDirector:getChildByPath(txt_shengyubuy, "txt_number")

    local item = dataInfo.rewardItems:objectAt(1)
    if item == nil then
        return
    end
    if dataInfo.discount then
        imgTips:setTexture("ui_new/operatingactivities/z".. dataInfo.discount ..".png")
    end

    local currentNum = dataInfo.customerLimit - dataInfo.currentNum
    if currentNum <= 0 then
        currentNum = 0
    end    
    txtSelfBuyCount:setText(currentNum)
    if currentNum <= 0 then
        btnBuy:setTouchEnabled(false)
        btnBuy:setGrayEnabled(true)
    else
        btnBuy:setTouchEnabled(true)
        btnBuy:setGrayEnabled(false)
    end
    
    print("item = ",item)
    imgIconBg:setTexture(GetColorIconByQuality(item.quality)) 
    function onClick( sender )
        Public:ShowItemTipLayer(item.itemid, item.type);
    end
    imgIconBg:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));      
    imgIcon:setTexture(item.path)    
    if item.number > 1 then
        txtNum:setVisible(true)
        txtNum:setText("X" .. item.number)
    else
        txtNum:setVisible(false)
    end
    if item.type == EnumDropType.GOODS then
        local rewardItem = {itemid = item.itemid}
        local itemData   = ItemData:objectByID(item.itemid)
        Public:addPieceImg(imgIcon,rewardItem,nil,1.0)
    else
        Public:addPieceImg(imgIcon,nil,false)
    end
    txtIconName:setText(item.name)
    txtPriceNum:setText(dataInfo.price)
    txtNowPriceNum:setText(dataInfo.nowPrice)

    btnBuy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnBuyClickHandle),1)
    btnBuy.logic = self
    btnBuy.index = idx
end

function Activity_Fanxian.btnBuyClickHandle( btn )
    local self = btn.logic
    local idx = btn.index

    local dataInfo = self.rewardList:objectAt(idx)
    if dataInfo == nil then
        return
    end
    local item = dataInfo.rewardItems:objectAt(1)
    CommonManager:showOperateSureLayer(
        function()
            OperationActivitiesManager:requestFullCutBuyMsg(dataInfo.id, 1)
        end,
        nil,
        {
            msg = stringUtils.format(localizable.PubRecuitScoreTips8, 
                dataInfo.nowPrice,item.name)
        }
    )    
end

function Activity_Fanxian:refreshCutDownTimer()
    if self.timerHandle then
        TFDirector:removeTimer(self.timerHandle)
        self.timerHandle = nil
    end
    local timeCount = self.activeData.endTime
    timeCount = timeCount - MainPlayer:getNowtime()
    if timeCount <= 0 then
        timeCount = 0
        self.cutDownTime:setText(FactionManager:getTimeString(timeCount))  
        AlertManager:closeAll()
        toastMessage(localizable.treasureMain_tiemout)
        return
    end
    self.cutDownTime:setText(FactionManager:getTimeString(timeCount))
    self.timerHandle = TFDirector:addTimer(1000, -1, nil, 
        function ()
            timeCount = timeCount - 1
            if timeCount <= 0 then
                self:refreshCutDownTimer()
            else
                self.cutDownTime:setText(FactionManager:getTimeString(timeCount))    
            end
        end)
end

function Activity_Fanxian.btnHistoryClick(btn)
    local self = btn.logic    
    local layer = require('lua.logic.gameactivity.Activity_FanxianHistory'):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function Activity_Fanxian.btnMoneyBackClick(btn)
    local self = btn.logic    
    local activeData = clone(OperationActivitiesManager:getActivityInfo(self.activityId))
    local layer = require('lua.logic.gameactivity.Activity_MoneyBack'):new(activeData.moneyBackList)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function Activity_Fanxian.btnRuleClick( btn )
    CommonManager:showRuleLyaer("cashback")
end
return Activity_Fanxian