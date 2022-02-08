
-- ///////////////////////////////////////////////////
-- @Author: 			Happy All
-- @Create Date:		2016-12-20 18:03:00
-- @Title: 				TuanGouHistoryLayer
-- @Describe:		             团购历史
-- ///////////////////////////////////////////////////


local TuanGouHistoryLayer = class("TuanGouHistoryLayer", BaseLayer)

function TuanGouHistoryLayer:ctor(data)
    self.super.ctor(self)
    self.activityId = data[1]
    self.goodsId = data[2]
    self:init("lua.uiconfig_mango_new.operatingactivities.TuanGouPaiHang")
end

function TuanGouHistoryLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.playerList = clone(OperationActivitiesManager:getGrouponHistoryList(self.goodsId))

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")

    self.TabViewUI = TFDirector:getChildByPath(ui, "Panel_paihang")
    self.cellModel = TFDirector:getChildByPath(ui, "img_paihangliebiao")
    self.cellModel:setVisible(false)

    self.TabView =  TFTableView:create()
    self.TabView:setTableViewSize(self.TabViewUI:getContentSize())
    self.TabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    self.TabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    self.TabView.logic = self
    self.TabViewUI:addChild(self.TabView)
    self.TabView:setPosition(ccp(0,0))

    self.cellSize = self.cellModel:getContentSize()
end

function TuanGouHistoryLayer:removeUI()
    self.super.removeUI(self)
end

function TuanGouHistoryLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function TuanGouHistoryLayer:dispose()
    self.super.dispose(self)
end

function TuanGouHistoryLayer:refreshUI()
    
end

function TuanGouHistoryLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
    self.registerEventCallFlag = true

    self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
    
    self.TabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.TabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.TabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)        
    self.TabView:reloadData()
    self.TabView:setScrollToBegin()
end

function TuanGouHistoryLayer:removeEvents()
    
    self.registerEventCallFlag = nil
    self.super.removeEvents(self)

    self.TabView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)
end

function TuanGouHistoryLayer.cellSizeForTable(table,idx)
    local self = table.logic
    return self.cellSize.height,self.cellSize.width
end

function TuanGouHistoryLayer.numberOfCellsInTableView(table)
    local self = table.logic    
    return #self.playerList
end

function TuanGouHistoryLayer.tableCellAtIndex(table, idx)

    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel:clone()
        panel:setPosition(ccp(self.cellSize.width/2,self.cellSize.height/2))
        cell:addChild(panel)
        cell.panelNode = panel        
    else
        panel = cell.panelNode
    end
    panel:setVisible(true)
    idx = idx + 1    


    local itemData = self.playerList[idx]
    if itemData then
        local txt_playername = TFDirector:getChildByPath(panel, "txt_playername")
        txt_playername:setText(itemData.name)
        local txt_factionname = TFDirector:getChildByPath(panel, "txt_factionname")
        txt_factionname:setText(itemData.guildName)
        local txt_buynumber = TFDirector:getChildByPath(panel, "txt_buynumber")   
        txt_buynumber:setText(itemData.num) 
    else
        panel:setVisible(false)
    end
    return cell
end

return TuanGouHistoryLayer