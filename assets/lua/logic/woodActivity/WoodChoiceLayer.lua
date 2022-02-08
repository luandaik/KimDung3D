
local WoodChoiceLayer = class("WoodChoiceLayer", BaseLayer);

CREATE_SCENE_FUN(WoodChoiceLayer);
CREATE_PANEL_FUN(WoodChoiceLayer);

WoodChoiceLayer.LIST_ITEM_HEIGHT = 90; 

function WoodChoiceLayer:ctor(data)
    self.super.ctor(self, data);
    self.selectId = 1
    self:init("lua.uiconfig_mango_new.bag.BagGiftChoose");
end

local pathTitle = {"ui_new/xiakexing/img_jiangliyulan.png", "ui_new/common/img_xuanze.png"}

function WoodChoiceLayer:initUI(ui)
    self.super.initUI(self, ui);

    self.btn_close  = TFDirector:getChildByPath(self, 'btn_close');
    self.btn_get    = TFDirector:getChildByPath(self, 'btn_get');
    self.layer_list = TFDirector:getChildByPath(self, 'Panel_Gift');
    self.img_wenben = TFDirector:getChildByPath(self, 'img_wenben');

    self.nodeList = {}
    self.cellNode = createUIByLuaNew("lua.uiconfig_mango_new.bag.BagGiftChooseCell");
    self.cellNode:retain()
end

function WoodChoiceLayer:setData(data, status)
    self.data = data or {}
    self.status = status or 1

    self:drawBoxItemList()
    if #self.data > 8 then
        self.tableView:setTouchEnabled(true)
    else
        self.tableView:setTouchEnabled(false)
    end

    if self.status == 1 then
        self.btn_get:setVisible(true)
        self.img_wenben:setTexture(pathTitle[2])
    else
        self.btn_get:setVisible(false)
        self.img_wenben:setTexture(pathTitle[1])
    end
end

function WoodChoiceLayer:onShow()
    self.super.onShow(self)
end


function WoodChoiceLayer:removeUI()
    self.super.removeUI(self);
    if self.cellNode then
        self.cellNode:release()
        self.cellNode = nil
    end   
end


--注册事件
function WoodChoiceLayer:registerEvents()
    self.super.registerEvents(self);
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close);

    self.btn_get.logic = self
    self.btn_get:addMEListener(TFWIDGET_CLICK, audioClickfun(self.getBtnClickHandle))

    self.onBoxResult = function(event)
        AlertManager:closeLayer(self)
    end
    TFDirector:addMEGlobalListener(WoodActivityManager.WOOD_MAN_SPECIAL_REWARD_RESULT, self.onBoxResult)
end


function WoodChoiceLayer:drawBoxItemList()
    if self.tableView ~= nil then
        self.tableView:reloadData()
        -- self.tableView:setScrollToBegin(false)
        return
    end

    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.layer_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableView:setPosition(ccp(0,0))
    self.tableView = tableView
    self.tableView.logic = self

    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, WoodChoiceLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, WoodChoiceLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, WoodChoiceLayer.numberOfCellsInWoodChoiceLayer)
    tableView:reloadData()

    self.layer_list:addChild(self.tableView,1)
end

function WoodChoiceLayer.cellSizeForTable(table, idx)
    local self = table.logic
    return 175,660
end

function WoodChoiceLayer.tableCellAtIndex(table, idx)
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

function WoodChoiceLayer.numberOfCellsInWoodChoiceLayer(table)
    local self = table.logic
    return math.ceil(#self.data / 4)
  
end

function WoodChoiceLayer:drawNode(node,index)
    for i =1, 4 do
        self:drawGift(node.nodeList[i], 4*index+i)
    end
end


function WoodChoiceLayer:removeEvents()
    TFDirector:removeMEGlobalListener(WoodActivityManager.WOOD_MAN_SPECIAL_REWARD_RESULT, self.onBoxResult)
    self.onBoxResult = nil
end

-- function WoodChoiceLayer:isChoice( index )
--     for k,v in pairs(self.choiceList) do
--         if v == index then
--             return true
--         end
--     end
--     return false
-- end

-- function WoodChoiceLayer:getChoiceIndex( index )
--     for k,v in pairs(self.choiceList) do
--         if v == index then
--             return k
--         end
--     end
--     return 0
-- end

function WoodChoiceLayer:drawGift(node, index)
    -- local btn_node      =  TFDirector:getChildByPath(node, 'btn_node')
    local btn_icon      =  TFDirector:getChildByPath(node, 'btn_icon')
    local img_icon      =  TFDirector:getChildByPath(node, 'img_icon')
    local txt_number    =  TFDirector:getChildByPath(node, 'txt_number')
    local txt_name      =  TFDirector:getChildByPath(node, 'txt_name')
    local img_xuanzhong =  TFDirector:getChildByPath(node, 'img_xuanzhong')
    -- local panel_bs = TFDirector:getChildByPath(node, "panel_bs")
    -- panel_bs:setVisible(false)

    
    if index > #self.data then
        node:setVisible(false)
        return
    end
    node:setVisible(true)
    if (self.status == 1) then
        if self.selectId == index then
            img_xuanzhong:setVisible(true)
        else
            img_xuanzhong:setVisible(false)
        end
    else
        img_xuanzhong:setVisible(false)   
    end

    --print("self.data==>> ", self.data)
    local giftData    = self.data[index]
    if not giftData then
        return
    end
    local specialReward = giftData.specialReward or {}
    local award = specialReward[1]
    if not award then
        return
    end
    --print("award ==>> ", award)
    local itemType    = tonumber(award.resType)
    local itemId_     = tonumber(award.resId)
    local itemNum     = tonumber(award.number)
    local item = {type = itemType, number = itemNum, itemId = itemId_}
    local reward = BaseDataManager:getReward(item)

    txt_number:setText(reward.number)
    txt_name:setText(reward.name)
    img_icon:setTexture(reward.path)
    btn_icon:setTextureNormal(GetColorIconByQuality(reward.quality))
    Public:addPieceImg(img_icon,reward,nil,1.0)
    if (self.status ~= 1) then
        node:setTouchEnabled(false)
        btn_icon:setTouchEnabled(true)
        btn_icon:addMEListener(TFWIDGET_CLICK,
                    audioClickfun(function()
                        Public:ShowItemTipLayer(itemId_, itemType)
                    end)
                )
    end
    node.choiceId = index
end

function WoodChoiceLayer.btn_nodeClickHandle(sender)
    local self = sender.logic
    local btn_node = sender
    local choiceId = sender.choiceId
    if self.selectId == choiceId then
        return
    end
    self:choiceBtn(sender)
end

function WoodChoiceLayer:choiceBtn(btn)
    if self.selectId == btn.choiceId then
        return
    end
    self.selectId = btn.choiceId
    --local img_xuanzhong =  TFDirector:getChildByPath(btn, 'img_xuanzhong')
    --img_xuanzhong:setVisible(true)
    self:drawBoxItemList()
end


function WoodChoiceLayer.getBtnClickHandle(sender)
    local self = sender.logic
    local data = self.data[self.selectId]

    WoodActivityManager:requestGetSpecialReward(data.index, data.length)
end

  
return WoodChoiceLayer;