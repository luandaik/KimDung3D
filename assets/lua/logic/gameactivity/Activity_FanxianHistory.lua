
-- @Title: 满减返现历史
-- @Author: Happy All
-- @Date:   2016-12-06 11:39:14
-- @Last Modified by:   Happy All
-- @Last Modified time: 2016-12-07 18:20:38


local Activity_FanxianHistory = class("Activity_FanxianHistory", BaseLayer)

function Activity_FanxianHistory:ctor(data)
    self.super.ctor(self)
    self.dataHistoryList = {}
    self:init("lua.uiconfig_mango_new.treasure.TreasureHistory")
end


function Activity_FanxianHistory:initUI(ui)
	self.super.initUI(self,ui)

    self.btn_close          = TFDirector:getChildByPath(self, 'btn_close')

    self.TabViewUI = TFDirector:getChildByPath(ui, "panel_player")
    local panel_cell2 = TFDirector:getChildByPath(ui, "panel_cell2")
    panel_cell2:setVisible(false)
    self.cellModel = TFDirector:getChildByPath(ui, "panel_cell1")
    self.cellModel:setVisible(false)

    self.TabView = {}
    for i=1,2 do
        self.TabView[i] =  TFTableView:create()
        self.TabView[i]:setTableViewSize(self.TabViewUI:getContentSize())
        self.TabView[i]:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.TabView[i]:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.TabView[i].logic = self
        self.TabViewUI:addChild(self.TabView[i])
        self.TabView[i]:setPosition(ccp(0,0))
    end

    self.typeButton = {}
    local normalTexture = {"ui_new/operatingactivities/tip_buyhistory_u.png","ui_new/operatingactivities/tip_givehistory_u.png"}
    local selectTexture = {"ui_new/operatingactivities/tip_buyhistory_d.png","ui_new/operatingactivities/tip_givehistory_d.png"}
    for i=1,2 do
        self.typeButton[i]       = TFDirector:getChildByPath(ui, 'tab'..i)
        self.typeButton[i].normalTexture       = normalTexture[i]
        self.typeButton[i].selectTexture       = selectTexture[i]
        self.typeButton[i].index = i
        self.typeButton[i].logic = self
        self.typeButton[i]:setTexturePressed(selectTexture[i])
    end
end

function Activity_FanxianHistory:initDataByBtnIndex(btnIndex)
    self.btnIndex = btnIndex
    if self.dataHistoryList[btnIndex] == nil then
        self.dataHistoryList[btnIndex] = MEMapArray:new()
        local activityInfo = OperationActivitiesManager:getActivityInfoByType(OperationActivitiesManager.Type_Full_Cut)
        local dataList
        if btnIndex == 1 then
            dataList = activityInfo.buyList
        else
            dataList = activityInfo.buyBackList
        end   
        local lastKey = nil
        local dataBuff = {}        
        for v in dataList:iterator() do
            local dateDate = GetCorrectDate("*t", v.time/1000)
            local key = dateDate.year .. dateDate.month .. dateDate.day
            if lastKey == nil then
                lastKey = key
            end
            if key ~= lastKey then
                self.dataHistoryList[btnIndex]:push(dataBuff)
                dataBuff = {}
            end
            table.insert(dataBuff, v)
            lastKey = key
        end
        if #dataBuff > 0 then
            self.dataHistoryList[btnIndex]:push(dataBuff)
        end
    end

    if self.TabView[btnIndex] then
        self.TabView[btnIndex]:reloadData()
        self.TabView[btnIndex]:setScrollToBegin()
    end

    for i=1,2 do
        if i == btnIndex then
            self.typeButton[i]:setTextureNormal(self.typeButton[i].selectTexture)
            self.TabView[i]:setVisible(true)
        else
            self.typeButton[i]:setTextureNormal(self.typeButton[i].normalTexture)
            self.TabView[i]:setVisible(false)
        end
    end
end


function Activity_FanxianHistory:registerEvents()
    if self.registerEventCallFlag then
        return
    end
    self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

    for i=1,2 do
        self.typeButton[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnTabClick),1)
        self.TabView[i]:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
        self.TabView[i]:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
        self.TabView[i]:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex) 
    end


    self:initDataByBtnIndex(1)

    self.registerEventCallFlag = true
end

function Activity_FanxianHistory:removeEvents()

    self.super.removeEvents(self)
    for i=1,2 do
        self.TabView[i]:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
        self.TabView[i]:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
        self.TabView[i]:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)
    end
    self.registerEventCallFlag = nil
end


function Activity_FanxianHistory:removeUI()
    self.super.removeUI(self)
end

function Activity_FanxianHistory:onShow()
    self.super.onShow(self)
end

function Activity_FanxianHistory:dispose()
    self.super.dispose(self)
end

function Activity_FanxianHistory:refreshUI()
end

function Activity_FanxianHistory.onBtnTabClick(sender)
    local self = sender.logic
    if sender.index == self.btnIndex then
        return
    end
    self:initDataByBtnIndex(sender.index)
end

function Activity_FanxianHistory.numberOfCellsInTableView(table)
    local self = table.logic

    return self.dataHistoryList[self.btnIndex]:length()
end

function Activity_FanxianHistory.cellSizeForTable(table,idx)
    local self = table.logic
    local height , width =   80, 730
    idx = idx + 1
    
    local dataList = self.dataHistoryList[self.btnIndex]

    local itemList = dataList:objectAt(idx)
    local itemNum = math.ceil(#itemList/5)
    height = itemNum * 130 + height

    return height , width
end

function Activity_FanxianHistory.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel:clone()
        panel:setPosition(ccp(0,0))
        cell:addChild(panel)
        cell.panelNode = panel        
    else
        panel = cell.panelNode
    end
    panel:setVisible(true)

    self:drawResultNode(panel, idx + 1)
    return cell
end

function Activity_FanxianHistory:drawResultNode(panel, index)

    local dataList = self.dataHistoryList[self.btnIndex]
    -- print("dataList -",dataList)
    local itemList = dataList:objectAt(index)
    local itemCount = #itemList

    if panel.iconNode then
        for k,v in pairs(panel.iconNode) do
            v:removeFromParent()
        end
        panel.iconNode = nil
    end

    panel.iconNode = panel.iconNode or {}

    -- print("itemList = ",itemList)
    local bg_title2 = TFDirector:getChildByPath(panel, "bg_title2")
    bg_title2:setVisible(false)
    local txt_date = TFDirector:getChildByPath(panel, "txt_date")
    local timestamp = math.floor(itemList[1].time/1000)
    local date   = os.date("*t", timestamp)
    local timeDesc = date.year.."-"..date.month.."-"..date.day
    txt_date:setText(timeDesc)

    for i=1,itemCount do
        local itemNode = Public:createIconNumNode(itemList[i].item)
        panel:addChild(itemNode)
        local x = 48+((i-1)%5)*136
        local y = -math.floor((i-1)/5)*130 - 130 + 20
        itemNode:setPosition(ccp(x,y))
        panel.iconNode[i] = itemNode
    end
    local y = math.ceil((itemCount)/5)*130
    panel:setPositionY(y)
end

return Activity_FanxianHistory