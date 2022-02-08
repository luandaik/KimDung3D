
-- @tile: 阶段满返-返还元宝
-- @Author: Happy All
-- @Date:   2016-12-02 15:06:53
-- @Last Modified by:   Happy All
-- @Last Modified time: 2016-12-07 17:33:42

local Activity_MoneyBack = class("Activity_MoneyBack", BaseLayer)

function Activity_MoneyBack:ctor(data)
    self.super.ctor(self)
    
    self.moneyBackList = data or MEMapArray:new()
    self:init("lua.uiconfig_mango_new.operatingactivities.FanLimanfan")
end

function Activity_MoneyBack:initUI(ui)
    self.super.initUI(self,ui)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")

    self.TabViewUI = TFDirector:getChildByPath(ui, "Panel_cell")
    self.cellModel = TFDirector:getChildByPath(ui, "img_cellbg")
    self.cellModel:setVisible(false)

    self.TabView =  TFTableView:create()
    self.TabView:setTableViewSize(self.TabViewUI:getContentSize())
    self.TabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    self.TabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    self.TabView.logic = self
    self.TabViewUI:addChild(self.TabView)
    self.TabView:setPosition(ccp(0,0))
end

function Activity_MoneyBack:removeUI()
    self.super.removeUI(self)
end

function Activity_MoneyBack:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function Activity_MoneyBack:dispose()
    self.super.dispose(self)
end

function Activity_MoneyBack:refreshUI()
    
end

function Activity_MoneyBack:registerEvents()

    if self.registerEventCallFlag then
        return
    end
    self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
    
    self.TabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.TabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.TabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)        
    self.TabView:reloadData()
    self.TabView:setScrollToBegin()
    self.registerEventCallFlag = true
    
end

function Activity_MoneyBack:removeEvents()
        
    self.super.removeEvents(self)

    self.TabView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    self.registerEventCallFlag = nil
end

function Activity_MoneyBack.cellSizeForTable(table,idx)
    local self = table.logic
    return 103,563
end

function Activity_MoneyBack.numberOfCellsInTableView(table)
    local self = table.logic    
    return self.moneyBackList:length()
end

function Activity_MoneyBack.tableCellAtIndex(table, idx)

    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel:clone()
        local size = panel:getContentSize()
        panel:setPosition(ccp(size.width/2+15,size.height/2))
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

function Activity_MoneyBack:refreshDataDetails( panel, idx )
    --[[
        dataInfo:
            -title
            -currNum
            -totalNum
            -state
    ]]
    local dataInfo = self.moneyBackList:objectAt(idx)
    if dataInfo == nil then
        return
    end
    local txtTitle = TFDirector:getChildByPath(panel, "txt_title")
    txtTitle:setText(dataInfo.title)

    local txtBarNum = TFDirector:getChildByPath(panel, "txt_jindunumber")
    local loadingBar = TFDirector:getChildByPath(panel, "bar_jindu")
    local imgGet = TFDirector:getChildByPath(panel, "img_dacheng")

    loadingBar:setDirection(TFLOADINGBAR_LEFT)

    txtBarNum:setText(dataInfo.currNum .. "/" ..dataInfo.totalNum)
    
    if dataInfo.currNum >= dataInfo.totalNum then
        imgGet:setTexture("ui_new/operatingactivities/img_yifafang.png")
        loadingBar:setPercent(100)
    else
        imgGet:setTexture("ui_new/operatingactivities/img_weifafang.png")
        loadingBar:setPercent(math.floor(dataInfo.currNum*100/dataInfo.totalNum))
    end
end

return Activity_MoneyBack