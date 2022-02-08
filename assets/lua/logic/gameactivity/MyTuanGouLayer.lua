
-- ///////////////////////////////////////////////////
-- @Author: 			Happy All
-- @Create Date:		2016-12-15 20:14:36
-- @Last Modified time: 2016-12-16 12:47:19
-- @Title: 				MyTuanGouLayer
-- @Describe:			我的团购
-- ///////////////////////////////////////////////////


local MyTuanGouLayer = class("MyTuanGouLayer", BaseLayer)

function MyTuanGouLayer:ctor(data)
        self.super.ctor(self)
        self.activityId = data
        self.rewardList = clone(OperationActivitiesManager:getMyGrouponList())
        print("self.rewardList = ",self.rewardList)
        self:init("lua.uiconfig_mango_new.operatingactivities.TuanGouHistory")
end

function MyTuanGouLayer:initUI(ui)
        self.super.initUI(self,ui)

        self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
        self.imgNoBuy = TFDirector:getChildByPath(ui, "img_Notuangou")

        self.TabViewGoodsUI = TFDirector:getChildByPath(ui, "Panel_MyHistory")
        self.cellGoodsModel = TFDirector:getChildByPath(ui, "img_desc_bg")
        self.cellGoodsModel:setVisible(false)
        self.TabViewGoods =  TFTableView:create()
        self.TabViewGoods:setTableViewSize(self.TabViewGoodsUI:getContentSize())
        self.TabViewGoods:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.TabViewGoods:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.TabViewGoods.logic = self
        self.TabViewGoodsUI:addChild(self.TabViewGoods)
        self.TabViewGoods:setPosition(ccp(0,0))

        self.cellSize = self.cellGoodsModel:getContentSize()
end

function MyTuanGouLayer:removeUI()
    self.super.removeUI(self)
end

function MyTuanGouLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function MyTuanGouLayer:dispose()
    self.super.dispose(self)
end

function MyTuanGouLayer:refreshUI()
    
end

function MyTuanGouLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
    self.registerEventCallFlag = true

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    self.super.registerEvents(self)
    
    self.TabViewGoods:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTableGoods)
    self.TabViewGoods:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableGoods)
    self.TabViewGoods:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndexGoods)        
    self.TabViewGoods:reloadData()
    self.TabViewGoods:setScrollToBegin()

    self.tuanGouUpdateCallback = function (event)
        self.rewardList = clone(OperationActivitiesManager:getMyGrouponList())        
        self.TabViewGoods:reloadData()
    end
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_GROUP_ON_UPDATE, self.tuanGouUpdateCallback)
end

function MyTuanGouLayer:removeEvents()
    
    self.registerEventCallFlag = nil
    self.super.removeEvents(self)

    if self.tuanGouUpdateCallback then
       TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_GROUP_ON_UPDATE, self.tuanGouUpdateCallback)
       self.tuanGouUpdateCallback = nil
    end   
end

function MyTuanGouLayer.cellSizeForTableGoods(table,idx)
    local self = table.logic
    return self.cellSize.height,self.cellSize.width
end

function MyTuanGouLayer.numberOfCellsInTableGoods(table)
    local self = table.logic    
    local size = self.rewardList:length()
    if size == 0 then
        self.imgNoBuy:setVisible(true)
    else
        self.imgNoBuy:setVisible(false)
    end
    return self.rewardList:length()
end

function MyTuanGouLayer.tableCellAtIndexGoods(table, idx)

    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellGoodsModel:clone()
        panel:setPosition(ccp(self.cellSize.width/2,self.cellSize.height/2))
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

function MyTuanGouLayer:refreshDataDetails( panel, idx )
    local dataInfo = self.rewardList:objectAt(idx)
    if dataInfo == nil or dataInfo.rewardItems == nil then
        return
    end
    local item = dataInfo.rewardItems:objectAt(1)
    if item == nil then
        return
    end        

    local currentNum = dataInfo.selfBuyLimitNum - dataInfo.selfBuyCurrentNum
    if currentNum <= 0 then
        currentNum = 0
    end 

    local node_txt_restbuynumber = TFDirector:getChildByPath(panel, "txt_restbuynumber")
    local txtSelfBuyNum = TFDirector:getChildByPath(node_txt_restbuynumber, "txt_number")
    txtSelfBuyNum:setText(currentNum)
    local btn_icon_node = TFDirector:getChildByPath(panel, "btn_icon")
    function onClick( sender )
        Public:ShowItemTipLayer(item.itemid, item.type);
    end
    btn_icon_node:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));      
    local imgEquipQuality = TFDirector:getChildByPath(btn_icon_node, "img_quality_bg")
    imgEquipQuality:setTexture(GetColorIconByQuality(item.quality))
    local imgEquipIcon = TFDirector:getChildByPath(btn_icon_node, "img_icon")
    imgEquipIcon:setTexture(item.path)
     if item.type == EnumDropType.GOODS then
        local rewardItem = {itemid = item.itemid}
        local itemData   = ItemData:objectByID(item.itemid)
        Public:addPieceImg(imgEquipIcon,rewardItem,nil,1.0)
    else
        Public:addPieceImg(imgEquipIcon,nil,false)
    end
    local txtEquipName = TFDirector:getChildByPath(btn_icon_node, "txt_number")
    txtEquipName:setText(item.name)

    local btnBuy = TFDirector:getChildByPath(panel, "btn_buy")
    btnBuy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnBuyClickHandle),1)
    btnBuy.logic = self
    btnBuy.goodsId = dataInfo.id

    if currentNum <= 0 then
        btnBuy:setTouchEnabled(false)
        btnBuy:setGrayEnabled(true)
    else
        btnBuy:setTouchEnabled(true)
        btnBuy:setGrayEnabled(false)
    end
     if dataInfo.selfBuyCurrentNum > 0 then
        btnBuy:setTextureNormal("ui_new/operatingactivities/btn_bugou.png")
    else
        btnBuy:setTextureNormal("ui_new/operatingactivities/btn_tuangou.png")
    end

    local node_panel_giftDesc = TFDirector:getChildByPath(panel, "panel_giftDesc")
    local progressBar = TFDirector:getChildByPath(node_panel_giftDesc, "bar_jindu")
    local txtProgressNum = TFDirector:getChildByPath(node_panel_giftDesc, "txt_number")
    local cellTips = TFDirector:getChildByPath(node_panel_giftDesc, "Panel_tips")
    cellTips:setVisible(false)

    local percent = math.floor(dataInfo.serverBuyCurrentNum*100/dataInfo.serverBuyLimitNum)
    progressBar:setPercent(percent)
    txtProgressNum:setText(dataInfo.serverBuyCurrentNum .. "/" .. dataInfo.serverBuyLimitNum)
    panel.panelPriceTbl = panel.panelPriceTbl or {}
    local panelWidth = progressBar:getContentSize().width
    local progressIndex = 0
    local oldPrice = dataInfo.price
    local nowPrice = oldPrice
    for i=1,3 do
        local data = dataInfo.priceTbl[i]
        if data then
            local panelTips
            if panel.panelPriceTbl[i] == nil then
                panelTips = cellTips:clone()
                cellTips:getParent():addChild(panelTips)
                panel.panelPriceTbl[i] = panelTips
            else
                panelTips = panel.panelPriceTbl[i]
            end
            panelTips:setVisible(true)
            local txtPrice = TFDirector:getChildByPath(panelTips, "txt_price")
            txtPrice:setText(data.price)
            local txtNumber = TFDirector:getChildByPath(panelTips, "txt_goumai")
            txtNumber:setText(stringUtils.format(localizable.activity_TuanGouDesTips, data.num))
            
            local numPercent = math.floor(data.num*100/dataInfo.serverBuyLimitNum)
            if numPercent > 100 then
                numPercent = 100
            end
            local posX = math.floor(panelWidth*numPercent/100)
            posX = posX - panelWidth/2 -- panel:getContentSize().width/2
            local offSetX = 0
            if i ~= 1 then
                local lastPos = panel.panelPriceTbl[i-1]:getPositionX()
                local imgTipsSize = panelTips:getContentSize()
                local dx = posX - lastPos
                if dx < imgTipsSize.width then
                    offSetX =  imgTipsSize.width - dx
                end
            end
            print("offSetX = ",offSetX)
            print("posX = ",posX)
            panelTips:setPositionX(posX + offSetX)
            local imgHengXian = TFDirector:getChildByPath(panelTips, "img_hengxian")
            imgHengXian:setVisible(false)
            local imgTips = TFDirector:getChildByPath(panelTips, "img_tips")
            if data.num <= (dataInfo.serverBuyCurrentNum) then
                nowPrice = data.price
                progressIndex = progressIndex + 1
                imgTips:setTexture("ui_new/operatingactivities/img_biaoji.png")
            else
                imgTips:setTexture("ui_new/operatingactivities/img_nobiaoji.png")
            end
            imgTips:setPositionX(-offSetX)
        elseif panel.panelPriceTbl[i] then
            panel.panelPriceTbl[i]:setVisible(false)
        end
    end

    local node_img_fanyuanbao = TFDirector:getChildByPath(panel, "img_fanyuanbao")
    local txtBackSycee = TFDirector:getChildByPath(node_img_fanyuanbao, "txt_price")
    txtBackSycee:setText((oldPrice-nowPrice)*dataInfo.selfBuyCurrentNum)

    local btnDetails = TFDirector:getChildByPath(panel, "btn_xiangqing")
    btnDetails:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnDetailsClickHandle),1)
    btnDetails.logic = self
    btnDetails.goodsId = dataInfo.id
end

function MyTuanGouLayer.btnBuyClickHandle( btn )
    local self = btn.logic
    local goodsId = btn.goodsId

    local data = {self.activityId, goodsId}
    local layer = require('lua.logic.gameactivity.TuangouShoppingLayer'):new(data)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function MyTuanGouLayer.btnDetailsClickHandle( btn )
    local self = btn.logic
    local goodsId = btn.goodsId

    local data = {self.activityId, goodsId}
    local layer = require('lua.logic.gameactivity.TuangouHistoryLayer'):new(data)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end


return MyTuanGouLayer