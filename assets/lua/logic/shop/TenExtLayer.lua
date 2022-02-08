
local TenExtLayer = class("TenExtLayer", BaseLayer)

local numOfCol = 5

function TenExtLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.shop.10chougailv")
end

function TenExtLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.layer_list = TFDirector:getChildByPath(self, 'Panel_icon')

    self.txtTips = TFDirector:getChildByPath(self, 'txt_next1-Copy1')
    self.txt_number = TFDirector:getChildByPath(self, 'txt_number')

    self.panel_1 = TFDirector:getChildByPath(self, 'Panel_1stbuy')
    self.panel_1:setVisible(false)
    self.panel_2 = TFDirector:getChildByPath(self, 'Panel_10thbuy')
    self.panel_2:setVisible(false)
end

function TenExtLayer:setRewardList(rewardList)
    self.rewardList = rewardList

    self.totalItem = rewardList:length()
    local count = GetCardManager.tenCardcount or 0
    self.txt_number:setText(count.."/10")
    self.pageNum = math.ceil(self.totalItem / numOfCol)
    local str = GetCardManager:getTenInfo()
    self.txtTips:setText(str)
    if GetCardManager.tenCardcount >= 10 then
        self.panel_2:setVisible(true)
    else
        self.panel_1:setVisible(true)
    end
end

function TenExtLayer:registerEvents()
    self.super.registerEvents(self)
end

function TenExtLayer:removeEvents()

    self.super.removeEvents(self)
end


function TenExtLayer:removeUI()
    self.super.removeUI(self)
end

function TenExtLayer:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function TenExtLayer:dispose()
    self.super.dispose(self)
end

function TenExtLayer:refreshUI()

   
    self:drawEggRewardList()

end


function TenExtLayer:drawEggRewardList()
    if self.tableView ~= nil then
        self.tableView:reloadData()
        return
    end

    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.layer_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableView:setPosition(self.layer_list:getPosition())
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


    if self.pageNum > 2 then
         self.tableView:setContentOffset(ccp(0, -60));
    end
end

function TenExtLayer.cellSizeForTable(table,idx)
    return 125,650
end

function TenExtLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic

    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
    end

    --绘制每个节点
    for i=1,numOfCol do
        local node = cell:getChildByTag(100+i)
        
        local index = idx * numOfCol + i

        if index > self.totalItem then
            node:setVisible(false)
        else
            local rewardItem = self.rewardList:objectAt(index)
            if node == nil then
                node = Public:createIconNumNode(rewardItem)
                node:setVisible(true)
                node:setPosition(ccp((i-1)*120 + 30, 0))
                cell:addChild(node,10);
                node:setTag(100+i)
                node:setScale(0.8)
            else
                node:setVisible(true)
                Public:loadIconNode(node,rewardItem)
            end
        end
    end

    return cell
end

return TenExtLayer