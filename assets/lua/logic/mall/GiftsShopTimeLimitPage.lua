--[[
******背包滑动道具cell*******

	-- by Stephen.tao
	-- 2013/12/5
]]

local GiftsShopTimeLimitPage = class("GiftsShopTimeLimitPage", BaseLayer)
local columnNumber = 4
function GiftsShopTimeLimitPage:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.shop.GiftsShopPage")
end

function GiftsShopTimeLimitPage:initUI(ui)
	self.super.initUI(self,ui)

    --根节点
	self.panel_content          = TFDirector:getChildByPath(ui, 'panel_content')

    --刷新文字
    self.lbl_refresh_title  = TFDirector:getChildByPath(ui, 'lbl_refresh_time_title')
    self.txt_refresh_time   = TFDirector:getChildByPath(ui, 'txt_refresh_time')

	--右侧tableView
	self.panel_list       = TFDirector:getChildByPath(ui, 'panel_list')

    --构建tableView
	self:initTableView()

end

function GiftsShopTimeLimitPage:removeUI()
	self.super.removeUI(self)

	self.panel_content = nil
	self.tableView = nil
	self.panel_list = nil
	self.createNewHoldGoodsCallback = nil
    self.holdGoodsNumberChangedCallback = nil
    self.deleteHoldGoodsCallback = nil
end

--初始化TableView
function GiftsShopTimeLimitPage:initTableView()
    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.panel_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    --tableView:setPosition(self.panel_list:getPosition())

    self.tableView = tableView
    self.tableView.logic = self

    self:updateTableSource()
    self.panel_list:addChild(tableView)

end

--刷新回调
function GiftsShopTimeLimitPage:refreshCallback()
    self:refreshUI()
end

function GiftsShopTimeLimitPage:registerEvents()
    self.super.registerEvents(self)

    --table view 事件
    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, GiftsShopTimeLimitPage.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, GiftsShopTimeLimitPage.tableCellAtIndex)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, GiftsShopTimeLimitPage.numberOfCellsInTableView)

    --购买成功通知
     self.buySuccessCallback = function (event)
         self:refreshCallback()
     end

    --逻辑事件
    TFDirector:addMEGlobalListener(MallManager.BuySuccessFromFixedStore, self.buySuccessCallback)

    self.tableView:reloadData()

    self.nTimerId = TFDirector:addTimer(60000, -1, nil,
        function()
            self:updateTime()
        end)
end

function GiftsShopTimeLimitPage:removeEvents()
    if self.nTimerId then
        TFDirector:removeTimer(self.nTimerId)
        self.nTimerId = nil
    end
    --TableView事件
    self.tableView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.tableView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.tableView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    --逻辑事件
    TFDirector:removeMEGlobalListener(MallManager.BuySuccessFromFixedStore, self.buySuccessCallback)
    self.super.removeEvents(self)
end

--销毁方法
function GiftsShopTimeLimitPage:dispose()
    self:disposeAllPanels()
    self.super.dispose(self)
end

--销毁所有TableView的Cell中的Panel
function GiftsShopTimeLimitPage:disposeAllPanels()
    if self.allPanels == nil then
        return
    end

    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        if panel then
            panel:dispose()
        end
    end
end

--[[
    更新TableView显示的内容
]]
function GiftsShopTimeLimitPage:updateTableSource()
    self.commodityList = MallManager:getFixedStoreCommodityList(1)
    if self.commodityList == nil then
        print("找不到固定商店信息")
    end

end

function GiftsShopTimeLimitPage:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function GiftsShopTimeLimitPage:refreshUI()
    self:refreshTableView()
end

function GiftsShopTimeLimitPage:refreshTableView()
    self:updateTableSource()
    local currentOffset = self.tableView:getContentOffset()
    self.tableView:reloadData()
    local currentSize = self.tableView:getContentSize()
    local tabSize = self.tableView:getSize()
    currentOffset.y = math.max(currentOffset.y , tabSize.height - currentSize.height)
    self.tableView:setContentOffset(currentOffset)
end

function GiftsShopTimeLimitPage.cellSizeForTable(table,idx)
    return 200,620
end

function GiftsShopTimeLimitPage.tableCellAtIndex(table, idx)
    -- print('GiftsShopTimeLimitPage --------------')
    local cell = table:dequeueCell()
    local self = table.logic
    local startOffset = 10
    local columnSpace = 20
    self.allPanels = self.allPanels or {}
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        for i=1,columnNumber do
            local bagItem_panel = require('lua.logic.mall.GiftsItemCell'):new()
            local size = bagItem_panel:getSize()
            local x = size.width*(i-1)
            if i > 1 then
                x = x + (i-1)*columnSpace
            end
            x = x + startOffset
            bagItem_panel:setPosition(ccp(x,0))
            bagItem_panel:setLogic(self)
            cell:addChild(bagItem_panel)

            cell.bagItem_panel = cell.bagItem_panel or {}
            cell.bagItem_panel[i] = bagItem_panel
            local newIndex = #self.allPanels + 1
            self.allPanels[newIndex] = bagItem_panel
        end

    end
    for i=1,columnNumber do
        if (idx * columnNumber + i) <= self.commodityList:length() then
            local _item = self.commodityList:objectAt(idx * columnNumber + i)
            -- print('_item = ',_item)
            cell.bagItem_panel[i]:setVisible(true)
            cell.bagItem_panel[i]:setData(_item)


            local now_time = GetGameTime()
            cell.bagItem_panel[i]:updateTime(now_time)

        else
            cell.bagItem_panel[i]:setVisible(false)
        end
    end

    return cell
end

function GiftsShopTimeLimitPage.numberOfCellsInTableView(table)
    local self = table.logic
    local num = math.ceil(self.commodityList:length()/columnNumber)
    return num
end

--table cell 被选中时在对应的Cell中触发此回调函数
function GiftsShopTimeLimitPage:tableCellClick(cell)
    
end

function GiftsShopTimeLimitPage:updateTime()

    print("GiftsShopTimeLimitPage:updateTime = ")
    if self.allPanels == nil then
        return
    end
    local mark = -1
    local now_time = GetGameTime()
    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        if panel then
            mark = math.max(panel:updateTime(now_time) ,mark)
        end
    end
    if mark == 0 then       --有到期的
        self:refreshUI()
    elseif mark == -1 then  --不需要定时器
        print("stop timer")
        if self.nTimerId then
            TFDirector:removeTimer(self.nTimerId)
            self.nTimerId = nil
        end
    end
end

return GiftsShopTimeLimitPage
