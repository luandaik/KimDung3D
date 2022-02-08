
local RechargeRewardLayer = class("RechargeRewardLayer", BaseLayer)

local numOfCol = 5
function RechargeRewardLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.zadan.ZaDanCheck")
end

function RechargeRewardLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.layer_list = TFDirector:getChildByPath(self, 'panel_neirong')
    self.layer_list:setPositionY(self.layer_list:getPositionY() + 8)
    local size = self.layer_list:getSize()
    self.layer_list:setSize(CCSize(size.width , size.height + 15))
    local txtTips = TFDirector:getChildByPath(self, 'txt')
    txtTips:setText(localizable.payArawd_tipsTools)

    local node = TFDirector:getChildByPath(self, 'panel_item')
    self.panel_daoju = TFDirector:getChildByPath(node, 'bg_icon')
    self.panel_daoju:setVisible(false)

    self.diffX = (self.layer_list:getContentSize().width - (self.panel_daoju:getContentSize().width * numOfCol)) / (numOfCol + 1) - 6 

    self.panel_daoju:removeFromParentAndCleanup(false)
    self.panel_daoju:retain()
end

--cardType 类型：0：普通 1：豪华
function RechargeRewardLayer:loadData(cardType)
    self.rewardList = PayManager:getRechargeCardConfigItemList(cardType)
    print("self.rewardList  ",self.rewardList)
    self.totalItem = table.getn(self.rewardList)

    self.pageNum = math.ceil(self.totalItem / numOfCol)
end

function RechargeRewardLayer:registerEvents()
    self.super.registerEvents(self)

end

function RechargeRewardLayer:removeEvents()
    self.super.removeEvents(self)
end


function RechargeRewardLayer:removeUI()
    self.panel_daoju:release()
    self.super.removeUI(self)
end

function RechargeRewardLayer:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function RechargeRewardLayer:dispose()
    self.super.dispose(self)
end

function RechargeRewardLayer:refreshUI()
    self:drawEggRewardList()
end


function RechargeRewardLayer:drawEggRewardList()
    if self.tableView ~= nil then
        self.tableView:reloadData()
        return
    end

    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.layer_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableView:setPosition(self.layer_list:getPosition())
    tableView:setTouchEnabled(false)
    self.tableView = tableView
    self.tableView.logic = self

    local function numberOfCellsInTableView(table)
        return self.pageNum
    end

    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, numberOfCellsInTableView)
    tableView:reloadData()

    self.layer_list:getParent():addChild(self.tableView,1)
end

function RechargeRewardLayer.cellSizeForTable(table,idx)
    return 125,716
end

function RechargeRewardLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic

    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        for i=1,numOfCol do
            local node = self.panel_daoju:clone()
            node:setVisible(true)
            node:setPosition(ccp(self.diffX * i + (node:getContentSize().width * (i - 1)) + 30, 0))
            cell:addChild(node,10);
            node:setTag(100+i)
            node:setScale(0.8)
        end
    end


    --绘制每个节点
    for i=1,numOfCol do
        local node = cell:getChildByTag(100+i)
        local index = idx * numOfCol + i
        node:setVisible(true)
        if index > self.totalItem then
            node:setVisible(false)
        else
            self:drawReward(node, index)
        end
    end

    return cell
end

function RechargeRewardLayer:drawReward(node, index)
    local itemInfo  = self.rewardList[index]
    local rewardConfig = {
        itemId = itemInfo.itemId,
        type = itemInfo.itemType,
        number = itemInfo.itemNum
    }
    local img_icon  = TFDirector:getChildByPath(node, 'img_icon');
    local txt_num   = TFDirector:getChildByPath(node, 'txt_num');
    local bg_icon   = TFDirector:getChildByPath(node, 'bg_icon');

    local rewardItem = BaseDataManager:getReward(rewardConfig)
    if bg_icon then
        bg_icon:setTextureNormal(GetColorIconByQuality(rewardItem.quality));
        function onClick( sender )
            Public:ShowItemTipLayer(rewardItem.itemid, rewardItem.type);
        end
        bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
    end

    img_icon:setTexture(rewardItem.path)

    Public:addPieceImg(img_icon,{type = itemInfo.itemType, itemId = itemInfo.itemId}, nil, 1);
   
    txt_num:setVisible(true);
    
    local txt_name = TFDirector:getChildByPath(node, 'txt_name')
    txt_name:setVisible(true);
    txt_name:setColor(ccc3(0,0,0))
    txt_name:setText(rewardItem.name)

    txt_num:setText(itemInfo.itemNum)
    if (itemInfo.maxMark == 1) then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/cardMaxEffect.xml")
        local effect = TFArmature:create("cardMaxEffect_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 1)
        effect:setPosition(ccp(bg_icon:getSize().width / 2, bg_icon:getSize().height / 2))
        bg_icon:addChild(effect,100)
    end

end

return RechargeRewardLayer