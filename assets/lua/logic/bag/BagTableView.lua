--[[
******背包物品TableView*******

	-- by david.dai
	-- 2014/5/27
]]

local BagTableView = class("BagTableView", BaseLayer)

function BagTableView:ctor(data)
    self.super.ctor(self,data)
    self.id = 0
    self:init("lua.uiconfig_mango_new.bag.BagTableView")
    self.type = 0
end

function BagTableView:initUI(ui)
	self.super.initUI(self,ui)

	self:initTableView()
end

function BagTableView:setHomeLayer(homeLayer)
    self.homeLayer = homeLayer
end

function BagTableView:removeUI()
    self.tableView = nil
    self.createNewHoldGoodsCallback = nil
    self.holdGoodsNumberChangedCallback = nil
    self.deleteHoldGoodsCallback = nil
	self.super.removeUI(self)
end

-----断线重连支持方法
function BagTableView:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function BagTableView:refreshUI()
    self:refreshTableView()
end

--初始化TableView
function BagTableView:initTableView()
    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.ui:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

    self.tableView = tableView
    self.tableView.logic = self
    self.ui:addChild(tableView)
end

--[[
设置要显示在tableview中的物品类型
]]
function BagTableView:setType(type)
    self.type = type
    self.selectId = nil
    self:refreshUI()
    self:selectDefault()
end

--设置物品数据
function BagTableView:onSelectCell(data)
	if data == nil  then
		return false
	end

    if self.type == EnumBagItemType.TianShu or self.type == EnumBagItemType.XinFa then
        self.id = data.instanceId
    elseif self.type == EnumBagItemType.ZhenFa then
        if data.isStrategyPiece then
            --碎片
            self.id = data.id
        else
            --全本
            self.id = data.gmId
        end
    elseif self.type == EnumBagItemType.MiYao then
        --秘钥
        self.id = data.instanceId
    else
	   self.id = data.id
    end
    --这里显示详情图层，并更新图层内容
    TFDirector:dispatchGlobalEventWith(BagTableView_SELECT_CELL,data)
end

--[[
    更新TableView显示的内容
]]
function BagTableView:updateTableSource()

    --简单品质ID排序
    local function sortQuality(src,target)
        if src.itemdata.quality == target.itemdata.quality then
            return src.itemdata.id < target.itemdata.id 
        else
            return src.itemdata.quality > target.itemdata.quality
        end
    end

    --added by wuqi
    local function sortSkyBookByPower(src, target)
        if src:getpower() == target:getpower() then
            if src:getpower() == target:getpower() then
                if src.quality == target.quality then
                    return src.id < target.id
                else
                    return src.quality > target.quality
                end
            else
                return src:getpower() < target:getpower()
            end
        else
            return src:getpower() > target:getpower()
        end
    end

    --道具排序
    local function sortProp(src,target)
        if src.limitTimestamp * target.limitTimestamp == 0 and src.limitTimestamp + target.limitTimestamp ~= 0  then
            return src.limitTimestamp ~= 0
        elseif src.limitTimestamp * target.limitTimestamp ~= 0 then
            return src.limitTimestamp <= target.limitTimestamp
        end
        local srcCanUse = BagManager:isCanPropQuick(src)
        local targetCanUse = BagManager:isCanPropQuick(target)
        if srcCanUse ~= targetCanUse then
            return srcCanUse
        end

        local srcType = src.itemdata.type
        local targetType = target.itemdata.type
        if srcType ~= targetType then
            if srcType == EnumGameItemType.ItemPiece and targetType == EnumGameItemType.ItemPiece then
                return sortQuality(src,target)
            end
            if srcType == EnumGameItemType.ItemPiece then
                return true
            end
            if targetType == EnumGameItemType.ItemPiece then
                return false
            end
            if srcType == EnumGameItemType.Box then
                return true
            end
            if targetType == EnumGameItemType.Box then
                return false
            end
            if srcType == EnumGameItemType.Item then
                return true
            end
            if targetType == EnumGameItemType.Item then
                return false
            end
        end
        return sortQuality(src,target)
    end

    --碎片排序
    local function sortPiece(src,target)
        local mergeSrc = BagManager:isCanMerge(src)
        local mergeTarget = BagManager:isCanMerge(target)
        if mergeSrc == mergeTarget then
            return sortQuality(src,target)
        else
            return mergeSrc
        end
    end

    --显示内容排序方法
    local function sortSoul( src,target )
        local hasSrc = BagManager:isAlreadyHasRole(src)
        local hasTarget = BagManager:isAlreadyHasRole(target)

        local enoughSrc = BagManager:isEnoughToRecruit(src)
        local enoughTarget = BagManager:isEnoughToRecruit(target)

        local srcIsRole = src.itemdata.kind == 4
        local targetIsRole = target.itemdata.kind == 4


        if hasSrc == hasTarget then
            if hasSrc then
                return sortQuality(src,target)
            else
                if enoughSrc == enoughTarget then
                    if srcIsRole ~= targetIsRole then
                        return srcIsRole
                    end
                    return sortQuality(src,target)
                else
                    return enoughSrc
                end
            end
        else
           return hasTarget
        end
    end

    local function sortType(src,target)
        if src.itemdata.type > target.itemdata.type then
            return true
        elseif src.itemdata.type == target.itemdata.type then
            if src.itemdata.kind > target.itemdata.kind then
                return true
            elseif src.itemdata.kind == target.itemdata.kind then
                return sortQuality(src,target)
            end
        end
    end

    --[[
    默认全部排序方法，按照类型，品质排序，同种类型各自特殊排序。
    ]]
    local function sortDefault(src,target)
        local srcType = src.itemdata.type
        local targetType = target.itemdata.type
        if srcType ~= targetType then
            if srcType == EnumGameItemType.Box then
                return true
            end
            if targetType == EnumGameItemType.Box then
                return false
            end
            if srcType == EnumGameItemType.Item then
                return true
            end
            if targetType == EnumGameItemType.Item then
                return false
            end
            if srcType > targetType then
                return true
            end
        else
            if srcType == EnumGameItemType.Item then
                return sortProp(src,target)
            elseif srcType == EnumGameItemType.Box then
                return sortProp(src,target)
            elseif srcType == EnumGameItemType.Piece then
                return sortPiece(src,target)
            elseif srcType == EnumGameItemType.Soul then
                return sortSoul(src,target)
            end
            return sortQuality(src,target)
        end
    end

    --[[
    全部物品排序
    1、优先置顶可使用物品
    2、同种类型各自排序
    3、不同种类型，可使用优先，都可以使用，按照类型排序
    ]]
    local function sortAll(src,target)
        local srcType = src.itemdata.type
        local targetType = target.itemdata.type
        if targetType == srcType then
            if srcType == EnumGameItemType.Item then
                return sortProp(src,target)
            elseif srcType == EnumGameItemType.Box then
                return sortProp(src,target)
            elseif srcType == EnumGameItemType.Piece then
                return sortPiece(src,target)
            elseif srcType == EnumGameItemType.Soul then
                return sortSoul(src,target)
            end
            return sortQuality(src,target)
        end

        --类型不一样
        local srcCanUse,targetCanUse = false,false
        if srcType == EnumGameItemType.Item then
            srcCanUse = BagManager:isCanPropQuick(src)
        elseif srcType == EnumGameItemType.Box then
            srcCanUse = BagManager:isCanPropQuick(src)
        elseif srcType == EnumGameItemType.Piece then
            srcCanUse = BagManager:isCanMerge(src)
        elseif srcType == EnumGameItemType.Soul then
            srcCanUse = BagManager:isEnoughToRecruit(src)
            if srcCanUse then
                srcCanUse = not BagManager:isAlreadyHasRole(src)
            end
        end

        if targetType == EnumGameItemType.Item then
            targetCanUse = BagManager:isCanPropQuick(target)
        elseif targetType == EnumGameItemType.Box then
            targetCanUse = BagManager:isCanPropQuick(target)
        elseif targetType == EnumGameItemType.Piece then
            targetCanUse = BagManager:isCanMerge(target)
        elseif targetType == EnumGameItemType.Soul then
            targetCanUse = BagManager:isEnoughToRecruit(target)
            if targetCanUse then
                targetCanUse = not BagManager:isAlreadyHasRole(target)
            end
        end

        if srcCanUse == targetCanUse then
            if srcType == EnumGameItemType.Box then
                return true
            end
            if targetType == EnumGameItemType.Box then
                return false
            end
            if srcType == EnumGameItemType.Item then
                return true
            end
            if targetType == EnumGameItemType.Item then
                return false
            end
            return sortQuality(src,target)
        else
            return srcCanUse
        end
    end
     --武学及碎片排序
    local function sortBookAndPiece(src,target)
        if (src.sortMake and target.sortMake) then
            local mergeSrc      = BagManager:isCanMerge(src)
            local mergeTarget   = BagManager:isCanMerge(target)
            if mergeSrc == mergeTarget then
                return sortQuality(src,target)
            else
                return mergeSrc
            end
        else
            return true
        end
        
    end
    --秘要及碎片排序
    local function sortMiyaoAndPiece(src,target)
        if (src.type == target.type) then
            if src.type == EnumGameItemType.Piece then
                return sortPiece(src,target)
            else
                return sortQuality(src,target)
            end
        else
            return src.type == EnumGameItemType.MiYao
        end
        
    end
    local sortFunc = sortQuality
    if self.type == EnumBagItemType.DaoJu then --道具
        self.itemlist = BagManager:getDaojuItemList()
        -- self.itemlist = BagManager:getItemByType({EnumGameItemType.Item,EnumGameItemType.Box,EnumGameItemType.Stuff,EnumGameItemType.Token})
        sortFunc = sortProp
    elseif self.type == EnumBagItemType.WuXue then --武学
        self.itemlist = BagManager:getItemByType(EnumGameItemType.Book)
        sortFunc = sortBookAndPiece
    elseif self.type == EnumBagItemType.TianShu then --天书
        self.itemlist = SkyBookManager:getAllUnEquippedBook()
        sortFunc = sortSkyBookByPower
    elseif self.type == EnumBagItemType.XinFa then --心法
        self.itemlist = XinFaManager:getListForBag()
        sortFunc = nil
    elseif self.type == EnumBagItemType.ZhenFa then --阵法
        self.itemlist = StrategyCardManager:getListForBag()
        sortFunc = nil
    elseif self.type == EnumBagItemType.XiaHun then --侠魂
        self.itemlist = BagManager:getBagDisplaySoul()
        sortFunc = sortSoul
    elseif self.type == EnumBagItemType.MiYao then --秘药
        self.itemlist = BagManager:getShowMiYaoList()
        sortFunc = sortMiyaoAndPiece   
    elseif self.type == EnumBagItemType.WQSuiPian then --碎片
        self.itemlist = BagManager:getItemByKind(EnumGameItemType.Piece,{1,2,3,4,5})
        sortFunc = sortPiece
    else                       --全部
        self.itemlist = BagManager:getItemByType(1)
        sortFunc = sortAll
    end
    --[[
    elseif self.type == 4 then --碎片
        self.itemlist = BagManager:getItemByKind(EnumGameItemType.Piece,{1,2,3,4,5})
        sortFunc = sortPiece
    elseif self.type == 5 then --碎片
        self.itemlist = BagManager:getItemByKind(EnumGameItemType.Piece,10)
        sortFunc = sortPiece
    else                       --全部
        self.itemlist = BagManager:getItemByType()
        sortFunc = sortAll
    end
    ]]
    if sortFunc then
        self.itemlist:sort(sortFunc)
    end
end

function BagTableView:registerEvents()
    self.super.registerEvents(self)

    --table view 事件
    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, BagTableView.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, BagTableView.tableCellAtIndex)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, BagTableView.numberOfCellsInTableView)

    self.createNewHoldGoodsCallback = function(event)
        if BagManager.isUseItem == true then
            return
        end
        local holdGoods = event.data[1]
        if not holdGoods then
            return
        end
        -- self:refreshUI()
        if self.homeLayer then
           self.homeLayer:refreshRedPointState()
        end
	end

    self.holdGoodsNumberChangedCallback = function(event)
        if BagManager.isUseItem == true then
            return
        end
        local holdGoods = event.data[1].item
        -- self:refreshUI()
        
        if self.homeLayer then
            self.homeLayer:numberChanged()
            self.homeLayer:refreshRedPointState()
        end

        if holdGoods.itemdata.id == self.selectId then
            if holdGoods then
                self:onSelectCell(holdGoods)
            else
                self.ui:setVisible(false)
            end
        end

        
    end

    self.deleteHoldGoodsCallback = function(event)
        if BagManager.isUseItem == true then
            return
        end
        local holdGoods = event.data[1]
        if not holdGoods then
            return
        end
        -- self:refreshUI()
        if self.homeLayer then
            self.homeLayer:refreshRedPointState()
        end
        if holdGoods.itemdata.id == self.selectId then
            self.selectId = nil
            self:selectDefault()
        end
    end

    --物品使用成功通知。由于顶层会有一层遮罩层，当遮罩层关闭时会自动刷新背包，但是直接增加资源的道具使用没有遮罩层，因此要调用刷新方法
    self.itemUseCallback = function(event)
        self:refreshUI()
        if self.homeLayer then
            self.homeLayer:refreshRedPointState()
        end
        local itemId = event.data[1]
        local item = BagManager:getItemById(itemId)
        if item == nil or item.num == 0 then
            self:selectDefault()
        else
            self:onSelectCell(item)
        end
    end

    --[[
    角色合成成功通知。由于顶层会有一层遮罩层，当遮罩层关闭时会自动刷新背包，因此不需要刷新背包
    ]]
    self.summonPaladinSuccessCallback = function(event)
        -- local unitInstance = event.data[1]
        -- self:refreshUI()
        self:selectDefault()
    end

    --物品合成成功通知。由于顶层会有一层遮罩层，当遮罩层关闭时会自动刷新背包，因此不需要刷新背包
    self.mergeResultCallback = function(event)
        -- self:refreshUI()

        if self.type == EnumBagItemType.TianShu then
            return
        end

        local itemId = event.data[1]
        local item = BagManager:getItemById(itemId)
        if item == nil or item.num == 0 then
            -- if self.selectDefault then
                self:selectDefault()
            -- end
        else
            -- if self.onSelectCell then
                self:onSelectCell(item)
            -- end
        end
    end

    self.bibleAddCallback = function(event)
        print("+++BagLayer bible add callback+++")
        local data = event.data[1]
        if self and self.refreshUI then
            self:refreshUI()
        end
        if self.homeLayer then
            self.homeLayer:refreshRedPointState()
        end
    end

    self.strategyCardAddCallback = function(event)
        local data = event.data[1][2]
        local dataType = event.data[1][1]
        if self and self.refreshUI then
            self:refreshUI()
        end
        if self.homeLayer then
            self.homeLayer:refreshRedPointState()
        end
        local item = ItemData:objectByID(data)
        if dataType == StrategyCardManager.handleAdd then
            toastMessage(item.name.." +1")  
        end
    end

    self.miyaoAddCallback = function(event)
        if self and self.refreshUI then
            self:refreshUI()
        end
        if self.homeLayer then
            self.homeLayer:refreshRedPointState()
        end
    end
    self.xinfaAddCallback = function(event)
        if self and self.refreshUI then
            self:refreshUI()
        end
    end


    --背包物品更改事件
    TFDirector:addMEGlobalListener(BagManager.ItemAdd,self.createNewHoldGoodsCallback)
    TFDirector:addMEGlobalListener(BagManager.ItemChange,self.holdGoodsNumberChangedCallback)
    TFDirector:addMEGlobalListener(BagManager.ItemDel,self.deleteHoldGoodsCallback)
    TFDirector:addMEGlobalListener(BagManager.ITEMBATCH_USED_RESULT,self.itemUseCallback)
    TFDirector:addMEGlobalListener(BagManager.SUMMON_PALADIN,self.summonPaladinSuccessCallback)
    TFDirector:addMEGlobalListener(BagManager.EQUIP_PIECE_MERGE,self.mergeResultCallback)
    TFDirector:addMEGlobalListener(SkyBookManager.BIBLE_ADD_RESULT,self.bibleAddCallback)  
    TFDirector:addMEGlobalListener(SkyBookManager.BIBLE_RESOLVE_RESPONSE,self.bibleAddCallback)
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.strategyCardAddCallback)
    TFDirector:addMEGlobalListener(StrategyCardManager.SaleStrategyMessage, self.bibleAddCallback)
    TFDirector:addMEGlobalListener(SkyBookManager.MIYAOLIST, self.miyaoAddCallback)
    TFDirector:addMEGlobalListener(XinFaManager.XinFaSell, self.xinfaAddCallback)
end

function BagTableView:removeEvents()
    print("BagTableView:removeEvents")
    self.tableView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.tableView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.tableView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    TFDirector:removeMEGlobalListener(BagManager.ItemAdd,self.createNewHoldGoodsCallback)
    TFDirector:removeMEGlobalListener(BagManager.ItemDel,self.deleteHoldGoodsCallback)
    TFDirector:removeMEGlobalListener(BagManager.ItemChange,self.holdGoodsNumberChangedCallback)
    TFDirector:removeMEGlobalListener(BagManager.ITEMBATCH_USED_RESULT,self.itemUseCallback)

    TFDirector:removeMEGlobalListener(BagManager.SUMMON_PALADIN,self.summonPaladinSuccessCallback)
    TFDirector:removeMEGlobalListener(BagManager.EQUIP_PIECE_MERGE,self.mergeResultCallback)
    TFDirector:removeMEGlobalListener(SkyBookManager.BIBLE_ADD_RESULT,self.bibleAddCallback)
    TFDirector:removeMEGlobalListener(SkyBookManager.BIBLE_RESOLVE_RESPONSE, self.bibleAddCallback)
    TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.strategyCardAddCallback)
    TFDirector:removeMEGlobalListener(StrategyCardManager.SaleStrategyMessage, self.bibleAddCallback)
    TFDirector:removeMEGlobalListener(SkyBookManager.MIYAOLIST, self.miyaoAddCallback)
    TFDirector:removeMEGlobalListener(XinFaManager.XinFaSell, self.xinfaAddCallback)

    self.createNewHoldGoodsCallback         = nil
    self.deleteHoldGoodsCallback            = nil
    self.holdGoodsNumberChangedCallback     = nil
    self.summonPaladinSuccessCallback       = nil
    self.mergeResultCallback                = nil
    self.itemUseCallback       = nil
    self.bibleAddCallback = nil
    self.strategyCardAddCallback = nil
    self.miyaoAddCallback = nil
    self.xinfaAddCallback = nil
    self.super.removeEvents(self)
end

--销毁方法
function BagTableView:dispose()
    self:disposeAllPanels()
    self.super.dispose(self)
end

--销毁所有TableView的Cell中的Panel
function BagTableView:disposeAllPanels()
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
    全部cell都重置为未选中
]]
function BagTableView:unselectedAllCellPanels()
    if self.allPanels == nil then
        return
    end

    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        if self.selectId and panel.id == self.selectId then
            panel:setChoice(false)
        end
    end
end

function BagTableView:updateSelectCell()
    if self.allPanels == nil then
        return
    end

    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        panel:refreshUI()
    end
end

function BagTableView:selectDefault()
    if self.itemlist and self.itemlist:length() > 0 then
        if self.type == EnumBagItemType.TianShu then
            self:select(self.itemlist:objectAt(1).instanceId,nil)
        elseif self.type == EnumBagItemType.ZhenFa then
            local data = self.itemlist:objectAt(1)
            if data.isStrategyPiece then
                self:select(data.id,nil)
            else    
                self:select(data.gmId,nil)
            end
        elseif self.type == EnumBagItemType.XinFa then 
            local data = self.itemlist:objectAt(1)
            -- if data.id ~= 0 then
            --     self:select(data.id,nil)
            -- else    
                self:select(data.instanceId,nil)
            -- end
        elseif self.type == EnumBagItemType.MiYao and self.itemlist:objectAt(1).type == EnumGameItemType.MiYao then
            --秘要
            self:select(self.itemlist:objectAt(1).instanceId,self.itemlist:objectAt(1).type)
        else
            self:select(self.itemlist:objectAt(1).id,nil)
        end
    else
        self.selectId = nil
        --这里显示详情图层，并更新图层内容
        TFDirector:dispatchGlobalEventWith(BagTableView_SELECT_CELL,nil)
    end
end

function BagTableView:isItemHas( id )
    if id == nil or self.itemlist == nil or self.itemlist:length() < 1 then
        return false
    end
    for v in self.itemlist:iterator() do
        if self.type == EnumBagItemType.TianShu then
            if v.instanceId == id then
                return true
            end
        elseif self.type == EnumBagItemType.ZhenFa then
            local srcId = 0
            if v.isStrategyPiece then
                srcId = v.id
            else
                srcId = v.gmId
            end
            if srcId == id then
                return true
            end
        else 
            if v.id == id then
                return true
            end
        end
    end
    return false
end

function BagTableView:refreshTableView()
    local bEmpty = true

    self:updateTableSource()
    -- self:updateTableSource()
    -- self:selectDefault()

    if self.itemlist == nil or self.itemlist:length() < 1 then
        self.ui:setVisible(false)
    else
        self.ui:setVisible(true)
        bEmpty = false
    end

    self.tableView:reloadData()
    if self.selectId == nil or self:isItemHas(self.selectId) == false then
        self:selectDefault()
    end
    self:updateSelectCell()
    if self.homeLayer then
        if self.homeLayer.img_empty then
            self.homeLayer.img_empty:setVisible(bEmpty)
        end
    end
end

function BagTableView.cellSizeForTable(table,idx)
    return 110,429
end

local column = 4
local row = 5

function BagTableView.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    local viewType = self.type

    self.allPanels = self.allPanels or {}
    if nil == cell then
        cell = TFTableViewCell:create()
        for i=1,column do
            local bagItem_panel = nil

            -- if viewType == 4 then               
            --     bagItem_panel = require('lua.logic.bag.SkyBookCell'):new()
            -- else
            -- end
            bagItem_panel = require('lua.logic.bag.BagCell'):new()
            local size = bagItem_panel:getSize()
            local x = size.width*(i-1) + 10
            if i > 1 then
                x = x + (i-1)*15
            end

            bagItem_panel:setPosition(ccp(x,0))
            bagItem_panel:setLogic(self)
            cell:addChild(bagItem_panel)
			
            cell.bagItem_panel = cell.bagItem_panel or {}
            cell.bagItem_panel[i] = bagItem_panel
            local newIndex = #self.allPanels + 1
            self.allPanels[newIndex] = bagItem_panel
        end       
    end

    for i=1,column do
        local tmpIndex = idx * column + i
        if self.itemlist and tmpIndex <= self.itemlist:length() then
            local _item = self.itemlist:objectAt(tmpIndex)
            local _itemInfo = ItemData:objectByID(_item.id)
            if self.type == EnumBagItemType.XinFa  and _item.id == 0 then
                _itemInfo = ItemData:objectByID(_item.itemId)
            end
            if _item and _itemInfo then
                if self.type == EnumBagItemType.TianShu then
                    cell.bagItem_panel[i]:setData(_itemInfo.type ,_item.instanceId)
                elseif self.type == EnumBagItemType.ZhenFa then
                    if _item.isStrategyPiece then
                        cell.bagItem_panel[i]:setData(_itemInfo.type ,_item.id)
                    else
                        cell.bagItem_panel[i]:setData(_itemInfo.type ,_item.gmId)
                    end
                elseif self.type == EnumBagItemType.MiYao and _item.type == EnumGameItemType.MiYao then
                    cell.bagItem_panel[i]:setData(_item.itemdata.type ,_item.instanceId)
                elseif self.type == EnumBagItemType.XinFa then 
                    -- if _item.id == 0 then 
                        cell.bagItem_panel[i]:setData(_itemInfo.type ,_item.instanceId)
                    -- else
                    --     cell.bagItem_panel[i]:setData(_itemInfo.type ,_item.id)
                    -- end
                else
                    cell.bagItem_panel[i]:setData(_itemInfo.type ,_item.id)
                end
            else
                cell.bagItem_panel[i]:setData(nil)
            end
        else
            cell.bagItem_panel[i]:setData(nil)
        end
    end
    return cell
end

function BagTableView.numberOfCellsInTableView(table)
    local self = table.logic
    if self.itemlist and self.itemlist:length() > 0 then
        local num = math.ceil(self.itemlist:length()/column)
        if num < row then
            return row
        end

        return num
    end
    return row
end

--[[
    选中
]]
function BagTableView:select(id,itemType)
    --选中的Cell如果重复选中则不处理
    if self.selectId then
        if self.selectId == id then
            return
        end

        self:unselectedAllCellPanels()
    end
    
    self.selectId = id
    self:updateSelectCell()

    --详细信息控件
    --local item = BagManager:getItemById(id)

    --changed by wuqi
    local item = nil
    if self.type == EnumBagItemType.TianShu then
        item = SkyBookManager:getItemByInstanceId(id)
    elseif self.type == EnumBagItemType.ZhenFa then
        item = StrategyCardManager:getStrategyCardByGmid(id)
        if item == nil then
            --是碎片
            item = BagManager:getItemById(id)
        end
    elseif self.type == EnumBagItemType.XinFa then
        item = XinFaManager:getXinFaByGmId(id)
        -- if item == nil then
        --     --是碎片
        --     item = BagManager:getItemById(id)
        -- end
    elseif self.type == EnumBagItemType.MiYao and itemType and itemType == EnumGameItemType.MiYao then
        item = BagManager:getMiYaoByType(nil, id)
    else
        item = BagManager:getItemById(id)
    end

    if item == nil  then
        return false
    end

    self:onSelectCell(item)
end

--table cell 被选中时在对应的Cell中触发此回调函数
function BagTableView:tableCellClick(cell)
    self:select(cell.id,cell.item_type)
end

return BagTableView
