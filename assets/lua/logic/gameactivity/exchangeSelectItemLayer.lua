-- 兑换活动
-- Author: fei
-- Date: 2017-02-13
local exchangeSelectItemLayer = class("exchangeSelectItemLayer", BaseLayer);

CREATE_SCENE_FUN(exchangeSelectItemLayer);
CREATE_PANEL_FUN(exchangeSelectItemLayer);

function exchangeSelectItemLayer:ctor()
    self.super.ctor(self);
    self:init("lua.uiconfig_mango_new.operatingactivities.BagGiftChoose");
end

function exchangeSelectItemLayer:initUI(ui)
    self.super.initUI(self, ui);

    self.btn_close      = TFDirector:getChildByPath(self, 'btn_close');
    self.btn_get        = TFDirector:getChildByPath(self, 'btn_get');
    self.layer_list     = TFDirector:getChildByPath(self, 'Panel_Gift');
    self.txt_restnumber = TFDirector:getChildByPath(self, 'txt_restnumber');
    local img_guodu = TFDirector:getChildByPath(self, 'img_guodu');
    img_guodu:setPositionY(self.layer_list:getPositionY() - img_guodu:getSize().height / 2)
    self.btn_get:setZOrder(2)
    local img_wenben = TFDirector:getChildByPath(self, 'img_wenben');
    img_wenben:setTexture("ui_new/operatingactivities/img_xuanzeduihuan.png")
    self.btn_get:setTextureNormal("ui_new/operatingactivities/btn_duihuan.png")
    self.nodeList = {}
    self.cellNode = createUIByLuaNew("lua.uiconfig_mango_new.bag.BagGiftChooseCell");
    self.cellNode:retain()
end

function exchangeSelectItemLayer:setData(data)
    self.data           = data.needGoodsList
    self.exchangeInfo   = data or nil
    self.selectId       = 1
    self:drawBoxItemList()
    if self.data:length() > 8 then
        self.tableView:setTouchEnabled(true)
    else
        self.tableView:setTouchEnabled(false)
    end
    self:refreshUI()
end

function exchangeSelectItemLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function exchangeSelectItemLayer:refreshUI()
    local count = 0
    if (self.exchangeInfo) then
        count = self.exchangeInfo.exchangeCount
    end
    --"剩余兑换次数：{p1}"
    self.txt_restnumber:setText(stringUtils.format(localizable.exchangeCell_count, count))
end

function exchangeSelectItemLayer:removeUI()
    self.super.removeUI(self);
    if self.cellNode then
        self.cellNode:release()
        self.cellNode = nil
    end   
end

function exchangeSelectItemLayer:registerEvents()
    self.super.registerEvents(self);
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close);

    self.btn_get.logic = self
    self.btn_get:addMEListener(TFWIDGET_CLICK, audioClickfun(self.getBtnClickHandle))
end


function exchangeSelectItemLayer:drawBoxItemList()
    if self.tableView ~= nil then
        self.tableView:reloadData()
        return
    end

    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.layer_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableView:setPosition(ccp(0,0))
    self.tableView = tableView
    self.tableView.logic = self

    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, exchangeSelectItemLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, exchangeSelectItemLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, exchangeSelectItemLayer.numberOfCellsInexchangeSelectItemLayer)
    tableView:reloadData()

    self.layer_list:addChild(self.tableView,1)
end

function exchangeSelectItemLayer.cellSizeForTable(table, idx)
    local self = table.logic
    return 175,660
end

function exchangeSelectItemLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    local node = nil
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        
        for i = 1, 4 do
            local node = self.cellNode:clone()
            node:setPosition(ccp(((i-1)*150+30), -10))
            cell:addChild(node);
            cell.nodeList = cell.nodeList or {}
            local btn_node      =  TFDirector:getChildByPath(node, 'btn_node')
            cell.nodeList[i] = btn_node
            self.nodeList[#self.nodeList+1] = btn_node
            btn_node.logic = self
            btn_node:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btn_nodeClickHandle),1)
        end

    end
    self:drawNode(cell,idx)
    return cell
end

function exchangeSelectItemLayer.numberOfCellsInexchangeSelectItemLayer(table)
    local self = table.logic
    return math.ceil(self.data:length() / 4)
  
end

function exchangeSelectItemLayer:drawNode(node,index)
    for i =1, 4 do
        self:drawGift(node.nodeList[i], 4*index+i)
    end
end


function exchangeSelectItemLayer:removeEvents()
    
end

function exchangeSelectItemLayer:drawGift(node, index)
    local btn_icon      = TFDirector:getChildByPath(node, 'btn_icon')
    local img_icon      = TFDirector:getChildByPath(node, 'img_icon')
    local txt_number    = TFDirector:getChildByPath(node, 'txt_number')
    local txt_name      = TFDirector:getChildByPath(node, 'txt_name')
    local img_xuanzhong = TFDirector:getChildByPath(node, 'img_xuanzhong')
    local panel_bs      = TFDirector:getChildByPath(node, "panel_bs")
    if (panel_bs) then
        panel_bs:setVisible(false)
    end
    
    if index > self.data:length() then
        node:setVisible(false)
        return
    end
    node:setVisible(true)
    
    if self.selectId == index then
        img_xuanzhong:setVisible(true)
    else
        img_xuanzhong:setVisible(false)
    end

    local giftData    = self.data:objectAt(index)
    local itemType    = tonumber(giftData.type)
    local itemId_     = tonumber(giftData.itemid)
    local itemNum     = tonumber(giftData.number)
    local item        = {type = itemType, number = itemNum, itemId = itemId_}
    local reward      = BaseDataManager:getReward(item)
    local num_bag     = BagManager:getItemNumById(itemId_).."/"
    -- local item = ItemData:objectByID(itemId_)
    -- if item and item.type == 1 then
    --     local count = 0
    --     count, num_bag = EquipmentManager:GetEquipByIdToCount(itemId_)
    -- end
    if itemType ~= EnumDropType.GOODS then
        num_bag     = ""
    end
    txt_number:setText(num_bag..itemNum)
    txt_name:setText(reward.name)
    img_icon:setTexture(reward.path)
    Public:addPieceImg(img_icon,reward);
    btn_icon:setTextureNormal(GetColorIconByQuality(reward.quality))
    
    node.choiceId = index
end

function exchangeSelectItemLayer.btn_nodeClickHandle(sender)
    local self = sender.logic
    local btn_node = sender
    local choiceId = sender.choiceId
    if self.selectId == choiceId then
        return
    end
    self:choiceBtn(sender)
end

function exchangeSelectItemLayer:choiceBtn(btn)
    if self.selectId == btn.choiceId then
        return
    end
    self.selectId = btn.choiceId
    self:drawBoxItemList()
end


function exchangeSelectItemLayer.getBtnClickHandle(sender)
    ------------
    local self  = sender.logic
    local data = self.exchangeInfo
    if data.exchangeCount ==  0 then
        --toastMessage("兑换次数已用完")
        toastMessage(localizable.exchangeCell_times_over)
        return
    end
    if data.haveDiscount == true then
        local layer  = require("lua.logic.activity.ActivityDiscountReplyLayer"):new()
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
        local tempArr = TFArray:new()
        tempArr:push(data.needGoodsList:objectAt(self.selectId))
        layer:setInfo(tempArr,data.gotGoodsList,data.discountTypeList, data.index, data.activityId)
        AlertManager:show()
        return
    end
    local inputStr = ""
    local itemData = data.needGoodsList:objectAt(self.selectId)
    if MainPlayer:getGoodsIsEnough(itemData) == false then
        -- local item = ItemData:objectByID(itemData.itemid)
        -- local num_bag = 0
        -- if item and item.type == 1 then
        --     local count = 0
        --     count, num_bag = EquipmentManager:GetEquipByIdToCount(itemData.itemid)
        -- end
        -- if (num_bag <= 0) then
            --toastMessage("您的{p1}不够")
            toastMessage(stringUtils.format(localizable.exchangeCell_not_enough, itemData.name))
            print("shit  = ", itemData)
            return
        --end
    end
    inputStr = inputStr .. itemData.name.."X"..itemData.number
    for i,v in ipairs(data.costList) do
        if MainPlayer:getGoodsIsEnough(v) == false then
            --toastMessage("您的{p1}不够")
            toastMessage(stringUtils.format(localizable.exchangeCell_not_enough, v.name))
            return
        end
        inputStr = inputStr .. ","..v.name.."X"..v.number
    end

    local  outStr = ""
    local count = 0
    for v in data.gotGoodsList:iterator() do
        if count > 0 then
            outStr = outStr .. ","
        end
        count = count + 1
        outStr = outStr .. v.name.."X"..v.number
    end

    local warningMsg    = stringUtils.format(localizable.exchangeCell_exchange_tips,inputStr,outStr)
    local targetSrc     = itemData.type..","..itemData.itemid..","..itemData.number
    CommonManager:showOperateSureLayer(
            function()
                OperationActivitiesManager:sendMsgToGetActivityReward(data.activityId, data.index,nil,0, targetSrc)
            end,
            nil,
            {
                msg = warningMsg
            }
    )
end

  
return exchangeSelectItemLayer;