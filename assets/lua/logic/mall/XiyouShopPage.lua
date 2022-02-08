--[[
******背包滑动道具cell*******

	-- by Stephen.tao
	-- 2013/12/5
]]

local XiyouShopPage = class("XiyouShopPage", BaseLayer)
local columnNumber = 4

local function getTimeStrForNum(num)
    if num < 10 then
        return "0" .. tostring(num);
    end
    return tostring(num);
end

function XiyouShopPage:ctor(data)
    self.super.ctor(self,data)
    if data then
        self.type = data
    else
        self.type = RandomStoreType.Xiyou
    end
    self.costType = EnumDropType.SYCEE
    self:init("lua.uiconfig_mango_new.shop.XiyouShopPage")
end

function XiyouShopPage:initUI(ui)
	self.super.initUI(self,ui)

    --根节点
	self.panel_content          = TFDirector:getChildByPath(ui, 'panel_content')

	--刷新按钮
	self.btn_refresh 		= TFDirector:getChildByPath(ui, 'btn_refresh')
    self.btn_refresh.logic  = self
    --刷新文字
    self.lbl_refresh_title  = TFDirector:getChildByPath(ui, 'lbl_refresh_time_title')
    self.txt_refresh_time   = TFDirector:getChildByPath(ui, 'txt_refresh_time')


    self.img_close_word  = TFDirector:getChildByPath(ui, 'img_close_word')
    self.end_time   = TFDirector:getChildByPath(ui, 'end_time')

	--右侧tableView
	self.panel_list       = TFDirector:getChildByPath(ui, 'panel_list')

    --构建tableView
	self:initTableView()
    self:refreshOpenState()
    self.mall_refresh_tip = CCUserDefault:sharedUserDefault():getBoolForKey("mall_refresh_tip");
    

end

function XiyouShopPage:removeUI()
	self.super.removeUI(self)



	self.panel_content = nil
	self.btn_refresh = nil
	self.tableView = nil
	self.panel_list = nil
    self.lbl_refresh_title = nil
    self.txt_refresh_time = nil
	self.createNewHoldGoodsCallback = nil
    self.holdGoodsNumberChangedCallback = nil
    self.deleteHoldGoodsCallback = nil
end

--初始化TableView
function XiyouShopPage:initTableView()
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
function XiyouShopPage:refreshCallback()
    --print("XiyouShopPage:refreshCallback()")
    self:refreshUI()
end

--显示充值提示框
function XiyouShopPage:showRechargeDialog()
    CommonManager:showOperateSureLayer(
        function()
            PayManager:showPayLayer()
        end,
        nil,
        {
            msg = localizable.common_pay_tips_1,
            showtype = AlertManager.BLOCK_AND_GRAY
        }
    )
end

--刷新按钮点击事件处理方法
function XiyouShopPage.refreshButtonClickHandle(sender)
    local self = sender.logic

    if not VipRuleManager:showUsedGoldTimeLayer( MainPlayer:getVipRuleTimesByCode( 8400+self.type ) ,8400+self.type, localizable.RandomStore_RefreshText1) then
        return
    end

    if MallManager:isEnoughRefrshTool(
            function()
                MallManager:requestRefreshRandomStoreByType(self.type)
            end
        , 3) == true then
        return
    end
    
    local enough = MainPlayer:isEnough(self.costType,self.store:getRefreshCost())
    if not enough then
        --self:showRechargeDialog()
        return
    end
    if self.mall_refresh_tip then
        MallManager:requestRefreshRandomStoreByType(self.type)
        return
    end
    local layer = CommonManager:showOperateSureTipLayer(
        function(data, widget)
            MallManager:requestRefreshRandomStoreByType(self.type)
            self:getHasTip(widget)
        end,
        function(data, widget)
            AlertManager:close()
            self:getHasTip(widget)
        end,
        {
            --title="扣费提示",
            --msg="您已经手动刷新过【" .. self.store:getManualRefreshCount() .. "】次，此次手动刷新需要消耗【" .. self.store:getRefreshCost() .. "】" .. GetResourceName(self.costType) .."，是否确认刷新？",
            title=localizable.common_pay_tips_2,
            msg= stringUtils.format(localizable.common_pay_tips_3,self.store:getManualRefreshCount() , self.store:getRefreshCost() , GetResourceName(self.costType) ),
            showtype = AlertManager.BLOCK_AND_GRAY
        }
    )

    local vipInfo = VipData:getVipItemByTypeAndVip(8400+self.type,MainPlayer:getVipLevel())
    if vipInfo then
        local maxBuyTime = vipInfo.benefit_value - MainPlayer:getVipRuleTimesByCode( 8400+self.type )
        layer:showFreshTip(stringUtils.format(localizable.RandomStore_RefreshText , maxBuyTime))
    end

end

function XiyouShopPage:getHasTip( widget )
    local state = widget:getSelectedState();
    print("state == ",state)
    if state == true then
        self.mall_refresh_tip = true
        CCUserDefault:sharedUserDefault():setBoolForKey("mall_refresh_tip",self.mall_refresh_tip);
        CCUserDefault:sharedUserDefault():flush();
        return
    end
end

function XiyouShopPage:registerEvents()
    self.super.registerEvents(self)

    --按钮事件
    self.btn_refresh:addMEListener(TFWIDGET_CLICK, audioClickfun(self.refreshButtonClickHandle),1)

    --table view 事件
    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, XiyouShopPage.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, XiyouShopPage.tableCellAtIndex)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, XiyouShopPage.numberOfCellsInTableView)

    --单个随机商店刷新通知
    self.refreshSingleCallback = function (event)
        local data = event.data[1]
        if data.type ~= self.type then
            return
        end

        self:refreshCallback()
     end

     --所有随机商店刷新通知
     self.refreshAllCallback = function (event)
         local data = event.data[1]
         self:refreshCallback()
     end

     --购买成功通知
     self.buySuccessCallback = function (event)
         self:refreshCallback()
     end

    --逻辑事件
    TFDirector:addMEGlobalListener(MallManager.RefreshSingleRandomStore, self.refreshSingleCallback)
    TFDirector:addMEGlobalListener(MallManager.RefreshAllRandomStore, self.refreshAllCallback)
    TFDirector:addMEGlobalListener(MallManager.BuySuccessFromRandomStore, self.buySuccessCallback)

    self.tableView:reloadData()
    self:addTimer()
end

function XiyouShopPage:removeEvents()
    --TableView事件
    self.tableView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.tableView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.tableView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    --按钮事件
    self.btn_refresh:removeMEListener(TFWIDGET_CLICK)

    --逻辑事件
    TFDirector:removeMEGlobalListener(MallManager.RefreshSingleRandomStore, self.refreshSingleCallback)
    TFDirector:removeMEGlobalListener(MallManager.RefreshAllRandomStore, self.refreshAllCallback)
    TFDirector:removeMEGlobalListener(MallManager.BuySuccessFromRandomStore, self.buySuccessCallback)
    
    self.super.removeEvents(self)
    if self.nEndTimerId then
        TFDirector:removeTimer(self.nEndTimerId)
        self.nEndTimerId = nil
    end
    TFDirector:removeTimer(self.nTimerId);
    self.nTimerId = nil;
end

function XiyouShopPage:addTimer()
    self.txt_refresh_time:setText(self.store:getAutoRefreshTimeAsString())
    self.onUpdated = function(event)
        self.txt_refresh_time:setText(self.store:getAutoRefreshTimeAsString())
    end

    if not self.nTimerId then
         self.nTimerId = TFDirector:addTimer(1000, -1, nil, self.onUpdated); 
    end
end

--销毁方法
function XiyouShopPage:dispose()
    self:disposeAllPanels()
    self.super.dispose(self)
end

--销毁所有TableView的Cell中的Panel
function XiyouShopPage:disposeAllPanels()
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
function XiyouShopPage:updateTableSource()
    self.store = MallManager:getRandomStoreByType(self.type)
    if self.store == nil then
        print("找不到随机商店信息 : ",self.type)
    end

    self.itemlist = self.store:getCommodityList()
end

function XiyouShopPage:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function XiyouShopPage:refreshUI()
    self:refreshTableView()
end

function XiyouShopPage:refreshTableView()
    self:updateTableSource()
    
    if self.tableView then
        --local currentOffset = self.tableView:getContentOffset()
        self.tableView:reloadData()
        --self.tableView:setContentOffset(currentOffset)
    end
end

function XiyouShopPage.cellSizeForTable(table,idx)
    return 200,620
end

function XiyouShopPage.tableCellAtIndex(table, idx)
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
    	    local bagItem_panel = require('lua.logic.mall.ShopItemCell'):new()
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
        if (idx * columnNumber + i) <= #self.itemlist then
            local _item = self.itemlist[idx * columnNumber + i]
            cell.bagItem_panel[i]:setVisible(true)
            cell.bagItem_panel[i]:setData(_item)
        else
            cell.bagItem_panel[i]:setVisible(false)
        end
    end

    return cell
end

function XiyouShopPage.numberOfCellsInTableView(table)
    local self = table.logic
    local num = math.ceil(#self.itemlist/columnNumber)
    return num
end

--table cell 被选中时在对应的Cell中触发此回调函数
function XiyouShopPage:tableCellClick(cell)

end

function XiyouShopPage:setType(type)
    self.type = type
    self:refreshTableView()
end

function XiyouShopPage:setCostType(costType)
    self.costType = costType
end

--[[
设置刷新按钮是否点击
]]
function XiyouShopPage:setRefreshButtonEnabled(enabled)
    self.btn_refresh:setTouchEnabled(enabled)
    self.btn_refresh:setGrayEnabled(not enabled)
end

--[[
设置刷新按钮是否可见
]]
function XiyouShopPage:setRefreshButtonVisiable(visiable)
    self.btn_refresh:setVisible(visiable)
end

function XiyouShopPage:refreshOpenState()
   -- self.store = MallManager:getRandomStoreByType(self.type)
    if self.store == nil then
        print("找不到随机商店信息 : ",self.type)
        return
    end
    if MainPlayer:getVipLevel() >= self.store.configure.openVip then
        self.img_close_word:setVisible(false)
        return
    end
    self.img_close_word:setVisible(true)
    local second = self.store.opentime + self.store.configure.showTime - GetGameTime()*1000
    self:endTimeShow(second/1000)
    self.nEndTimerId = TFDirector:addTimer(1000, -1, nil,function()
            self:updateTime()
        end)
end

function XiyouShopPage:updateTime()
    local second = self.store.opentime + self.store.configure.showTime - GetGameTime()*1000
    if second <= 0 then
        if self.nEndTimerId then
            TFDirector:removeTimer(self.nEndTimerId)
            self.nEndTimerId = nil
        end
    end
    self:endTimeShow(second/1000)
end

function XiyouShopPage:endTimeShow( second )
    if second < 0 then
        second = 0
    end
    local minute =  math.floor(second / 60);
    second =  math.floor(second % 60);

    local str = getTimeStrForNum(minute) ..":".. getTimeStrForNum(second)
    self.end_time:setText(str)
end
return XiyouShopPage
