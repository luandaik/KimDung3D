
-- @tile: 限时抢购活动
-- @Author: Happy All
-- @Date:   2016-12-02 15:06:53
-- @Last Modified by:   Happy All
-- @Last Modified time: 2016-12-09 16:29:25

local Activity_limitshop = class("Activity_limitshop", BaseLayer)

function Activity_limitshop:ctor(data)
    self.super.ctor(self)

    self.activityId = data
    self.activeData = clone(OperationActivitiesManager:getActivityInfo(data))
    self.rewardList = clone(OperationActivitiesManager:getRewardItemByActivityType(data))

    self:init("lua.uiconfig_mango_new.operatingactivities.LimitShop")
end

function Activity_limitshop:initUI(ui)
    self.super.initUI(self,ui)

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
end

function Activity_limitshop:removeUI()
    self.super.removeUI(self)
end

function Activity_limitshop:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function Activity_limitshop:dispose()
    self.super.dispose(self)
end

function Activity_limitshop:refreshUI()
    
end

function Activity_limitshop:registerEvents()

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

    self:refreshCutDownTimer()
    self.limitHotUpdateCallback = function (event)
        self.activeData = clone(OperationActivitiesManager:getActivityInfo(self.activityId))
        self.rewardList = clone(OperationActivitiesManager:getRewardItemByActivityType(self.activityId))
        if self.TabView then
            self.TabView:reloadData()
        end
    end
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_LIMIT_HOT_UPDATE, self.limitHotUpdateCallback)
end

function Activity_limitshop:removeEvents()
        
    self.super.removeEvents(self)

    self.TabView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    if self.timerHandle then
        TFDirector:removeTimer(self.timerHandle)
        self.timerHandle = nil
    end

    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_LIMIT_HOT_UPDATE, self.limitHotUpdateCallback)

    self.registerEventCallFlag = nil
end

function Activity_limitshop.cellSizeForTable(table,idx)
    local self = table.logic
    return 103,563
end

function Activity_limitshop.numberOfCellsInTableView(table)
    local self = table.logic    
    return self.rewardList:length()
end

function Activity_limitshop.tableCellAtIndex(table, idx)

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

function Activity_limitshop:refreshDataDetails( panel, idx )
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
    local txtStockNum = TFDirector:getChildByPath(panel, "txt_number")
    local btnBuy = TFDirector:getChildByPath(panel, "Button_LimitShop_1")
    local shengyuNode = TFDirector:getChildByPath(panel, "txt_shengyubuy")
    local txtSelfBuyCount = TFDirector:getChildByPath(shengyuNode, "txt_number")
    local imgTips = TFDirector:getChildByPath(panel, "img_tips")

    local item = dataInfo.rewardItems:objectAt(1)
    if item == nil then
        return
    end

    if dataInfo.discount then
        imgTips:setTexture("ui_new/operatingactivities/z".. dataInfo.discount ..".png")
    end
    
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
    local stockNum = dataInfo.serverNumMax - dataInfo.serverBuyNum
    local selfCanBuyNum = dataInfo.selfNumMax - dataInfo.selfBuyNum
    txtIconName:setText(item.name)
    txtPriceNum:setText(dataInfo.price)
    txtNowPriceNum:setText(dataInfo.nowPrice)
    txtStockNum:setText(stockNum)
    txtSelfBuyCount:setText(selfCanBuyNum)

    btnBuy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnBuyClickHandle),1)
    btnBuy.logic = self
    btnBuy.goodsId = dataInfo.id

    btnBuy:setTextureNormal("ui_new/operatingactivities/btn_qiang.png")
    if stockNum <= 0 then
        btnBuy:setTextureNormal("ui_new/operatingactivities/btn_over.png")
        btnBuy:setTouchEnabled(false)
        btnBuy:setGrayEnabled(false)
    elseif selfCanBuyNum <= 0 then
        btnBuy:setTouchEnabled(false)
        btnBuy:setGrayEnabled(true)
    else
        btnBuy:setTouchEnabled(true)
        btnBuy:setGrayEnabled(false)
    end
end

function Activity_limitshop.btnBuyClickHandle( btn )
    local self = btn.logic
    local id = btn.goodsId

    -- local dataInfo = self.rewardList:objectAt(idx)
    -- local item = dataInfo.rewardItems:objectAt(1)

    -- local data = {}
    -- data.id = dataInfo.id
    -- data.itemid = item.itemid
    -- local stockNum = dataInfo.serverNumMax - dataInfo.serverBuyNum
    -- local selfCanBuyNum = dataInfo.selfNumMax - dataInfo.selfBuyNum

    -- if stockNum > selfCanBuyNum then
    --     data.stockNum = selfCanBuyNum
    -- else
    --     data.stockNum = stockNum
    -- end
    -- data.nowPrice = dataInfo.nowPrice

    -- print("data = ",item)
    local data = {self.activityId, id}
    local layer = require('lua.logic.gameactivity.CommShoppingLayer'):new(data)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function Activity_limitshop:refreshCutDownTimer()
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
return Activity_limitshop