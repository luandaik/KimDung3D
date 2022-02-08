
-- ///////////////////////////////////////////////////
-- @Author:             Happy All
-- @Create Date:        2016-12-15 11:43:11
-- @Title:              Activity_TuanGou
-- @Describe:           限时团购
-- ///////////////////////////////////////////////////

local Activity_TuanGou = class("Activity_TuanGou", BaseLayer)

function Activity_TuanGou:ctor(data)
    self.super.ctor(self)

    self.activityId = data
    self.activeData = clone(OperationActivitiesManager:getActivityInfo(data))
    self.rewardList = clone(OperationActivitiesManager:getRewardItemByActivityType(data))

    self:init("lua.uiconfig_mango_new.operatingactivities.TuanGou")
end

function Activity_TuanGou:initUI(ui)
    self.super.initUI(self,ui)

    self.btn_mytuangou = TFDirector:getChildByPath(ui, "btn_mytuangou")
    self.btn_help = TFDirector:getChildByPath(ui, "btn_help")

    --物品列表
    self.TabViewGoodsUI = TFDirector:getChildByPath(ui, "Panel_cell")
    self.cellGoods = TFDirector:getChildByPath(ui, "img_allbg")
    self.cellGoods:setVisible(false)
    self.TabViewGoods =  TFTableView:create()
    self.TabViewGoods:setTableViewSize(self.TabViewGoodsUI:getContentSize())
    self.TabViewGoods:setDirection(TFTableView.TFSCROLLVERTICAL)
    self.TabViewGoods:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    self.TabViewGoods.logic = self
    self.TabViewGoodsUI:addChild(self.TabViewGoods)
    self.TabViewGoods:setPosition(ccp(0,0))

    self.cutDownTime = TFDirector:getChildByPath(ui, "txt_shengyunumber")
end

function Activity_TuanGou:removeUI()
    self.super.removeUI(self)
end

function Activity_TuanGou:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function Activity_TuanGou:dispose()
    self.super.dispose(self)
end

function Activity_TuanGou:refreshUI()
    
end

function Activity_TuanGou:registerEvents()

    if self.registerEventCallFlag then
        return
    end
    self.registerEventCallFlag = true

    self.super.registerEvents(self)

    
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnRuleClick),1)
    self.btn_mytuangou:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnMyTuanGouClick),1)
    self.btn_mytuangou.logic = self
    
    self.TabViewGoods:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTableGoods)
    self.TabViewGoods:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableGoods)
    self.TabViewGoods:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndexGoods)        
    self.TabViewGoods:reloadData()
    self.TabViewGoods:setScrollToBegin()

    self:refreshCutDownTimer()
    self.tuanGouUpdateCallback = function (event)
        self.activeData = clone(OperationActivitiesManager:getActivityInfo(self.activityId))
        self.rewardList = clone(OperationActivitiesManager:getRewardItemByActivityType(self.activityId))
        if self.TabViewGoods then
            self.TabViewGoods:reloadData()
        end
    end
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_GROUP_ON_UPDATE, self.tuanGouUpdateCallback)
end

function Activity_TuanGou:removeEvents()
    
    self.registerEventCallFlag = nil
    self.super.removeEvents(self)

    self.TabViewGoods:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.TabViewGoods:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.TabViewGoods:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    if self.tuanGouUpdateCallback then
       TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_GROUP_ON_UPDATE, self.tuanGouUpdateCallback)
       self.tuanGouUpdateCallback = nil
    end  
    if self.timerHandle then
        TFDirector:removeTimer(self.timerHandle)
        self.timerHandle = nil
    end      
end

function Activity_TuanGou.cellSizeForTableGoods(table,idx)
    local self = table.logic
    return 175,565
end

function Activity_TuanGou.numberOfCellsInTableGoods(table)
    local self = table.logic    
    return self.rewardList:length()
end

function Activity_TuanGou.tableCellAtIndexGoods(table, idx)

    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellGoods:clone()
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

function Activity_TuanGou:refreshDataDetails( panel, idx )
    local dataInfo = self.rewardList:objectAt(idx)
    if dataInfo == nil then
        return
    end
    local imgIconBg = TFDirector:getChildByPath(panel, "btn_icon")
    local imgIcon = TFDirector:getChildByPath(panel, "img_icon_1")
    local txtNum = TFDirector:getChildByPath(panel, "txt_number_1")
    local txtIconName = TFDirector:getChildByPath(panel, "txt_iconname")
    local btnBuy = TFDirector:getChildByPath(panel, "btn_buy")
    local imgTips = TFDirector:getChildByPath(panel, "img_tips")
    local txt_shengyubuy = TFDirector:getChildByPath(panel, "txt_shengyubuy")
    local txtSelfBuyCount = TFDirector:getChildByPath(txt_shengyubuy, "txt_number")
    local txtProgressNum = TFDirector:getChildByPath(panel, "txt_iconnameCopy")
    local Panel_cellx = TFDirector:getChildByPath(panel, "panel_cell_price")
    Panel_cellx:setVisible(false)
    panel.cellModel = Panel_cellx

    local item = dataInfo.rewardItems:objectAt(1)
    if item == nil then
        return
    end
    if dataInfo.discount then
        imgTips:setTexture("ui_new/operatingactivities/z".. dataInfo.discount ..".png")
    end

    local currentNum = dataInfo.selfBuyLimitNum - dataInfo.selfBuyCurrentNum
    if currentNum <= 0 then
        currentNum = 0
    end    
    txt_shengyubuy:setVisible(true)
    txtSelfBuyCount:setText(currentNum)
    if currentNum <= 0 then
        btnBuy:setTouchEnabled(false)
        btnBuy:setGrayEnabled(true)
    else
        btnBuy:setTouchEnabled(true)
        btnBuy:setGrayEnabled(false)
    end

    if dataInfo.isEnd then
        btnBuy:setTouchEnabled(false)
        btnBuy:setGrayEnabled(true)
        txt_shengyubuy:setVisible(false)
    end


    if dataInfo.selfBuyCurrentNum > 0 then
        btnBuy:setTextureNormal("ui_new/operatingactivities/btn_bugou.png")
    else
        btnBuy:setTextureNormal("ui_new/operatingactivities/btn_tuangou.png")
    end
    
    imgIconBg:setTextureNormal(GetColorIconByQuality(item.quality)) 
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

    btnBuy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnBuyClickHandle),1)
    btnBuy.logic = self
    btnBuy.goodsId = dataInfo.id

    txtProgressNum:setText(dataInfo.serverBuyCurrentNum .. "/" .. dataInfo.serverBuyLimitNum)
    local initY = panel.cellModel:getPositionY()
    panel.cellTbl = panel.cellTbl or {}
    for i=1,4 do
        local pricePanel = nil
        if panel.cellTbl[i] == nil then
            pricePanel = panel.cellModel:clone()
            panel.cellModel:getParent():addChild(pricePanel)
            panel.cellTbl[i] = pricePanel
        else
            pricePanel = panel.cellTbl[i]
        end

        pricePanel:setPositionY(initY - (i - 1)*30)
        self:showPriceTbl(pricePanel, i, dataInfo, dataInfo.serverBuyCurrentNum)
    end
end

function Activity_TuanGou:showPriceTbl( pricePanel, idx, dataInfo, progressNum)

    local stringTips
    local price
    local progressMax
    local progressMin
    if idx > #dataInfo.priceTbl+1 then
        pricePanel:setVisible(false)
        return
    end
    print("dataInfo.priceTbl =",dataInfo.priceTbl)
    print("idx = ",idx)
    if idx == 1 then
        stringTips = localizable.activity_TuanGou1
        price = dataInfo.price
        progressMax = dataInfo.priceTbl[1].num
        progressMin = 0
    elseif idx == #dataInfo.priceTbl + 1 then
        stringTips = stringUtils.format(localizable.activity_TuanGou, dataInfo.priceTbl[idx-1].num)
        price = dataInfo.priceTbl[idx-1].price
        progressMax = dataInfo.serverBuyLimitNum
        progressMin = dataInfo.priceTbl[idx-1].num
    else
        stringTips = stringUtils.format(localizable.activity_TuanGou, dataInfo.priceTbl[idx-1].num)
        price = dataInfo.priceTbl[idx-1].price
        progressMax = dataInfo.priceTbl[idx].num
        progressMin = dataInfo.priceTbl[idx-1].num
    end

    local panel
    pricePanel:setVisible(true)
    if progressNum < progressMin then
        --未开始
        local panel1 = TFDirector:getChildByPath(pricePanel, "img_yidacheng")
        panel1:setVisible(false)
        local panel2 = TFDirector:getChildByPath(pricePanel, "img_dangqian")
        panel2:setVisible(false)
        panel = TFDirector:getChildByPath(pricePanel, "img_weidacheng")
        panel:setVisible(true)
    elseif progressNum >= progressMax then
        --已完成
        local panel1 = TFDirector:getChildByPath(pricePanel, "img_weidacheng")
        panel1:setVisible(false)
        local panel2 = TFDirector:getChildByPath(pricePanel, "img_dangqian")
        panel2:setVisible(false)
        panel = TFDirector:getChildByPath(pricePanel, "img_yidacheng")
        panel:setVisible(true)
    else
        --正在进行
        local panel1 = TFDirector:getChildByPath(pricePanel, "img_yidacheng")
        panel1:setVisible(false)
        local panel2 = TFDirector:getChildByPath(pricePanel, "img_weidacheng")
        panel2:setVisible(false)
        panel = TFDirector:getChildByPath(pricePanel, "img_dangqian")
        panel:setVisible(true)
    end

    local txt_now_price = TFDirector:getChildByPath(panel, "txt_now_price")
    txt_now_price:setText(stringTips)
    local txt_now_price_num = TFDirector:getChildByPath(panel, "txt_now_price_num")
    txt_now_price_num:setText(price)
end

function Activity_TuanGou.btnBuyClickHandle( btn )
    local self = btn.logic
    local goodsId = btn.goodsId

    local data = {self.activityId, goodsId}
    local layer = require('lua.logic.gameactivity.TuangouShoppingLayer'):new(data)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function Activity_TuanGou:refreshCutDownTimer()
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

function Activity_TuanGou.btnRuleClick( btn )
    CommonManager:showRuleLyaer("shoppingingroup")
end

function Activity_TuanGou.btnMyTuanGouClick( btn )
    local self = btn.logic
    local layer = require('lua.logic.gameactivity.MyTuanGouLayer'):new(self.activityId)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end
return Activity_TuanGou