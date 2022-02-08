
-- client side KingWarBattlefieldLayer.lua
--[[
 * @Description: 积分赛战报
 ]]
-- script writer Happy.All
-- creation time 2016-11-4 17:49:52
local KingWarBattlefieldLayer = class("KingWarBattlefieldLayer", BaseLayer)

function KingWarBattlefieldLayer:ctor()
    self.super.ctor(self)
    
    self.personGrandList = TFArray:new()
    self.personGrandList:clear()
    
    self:init("lua.uiconfig_mango_new.zhenbashai.ZhenbashaiBattlefield")
    self.selectedIndex = 1
    
end

function KingWarBattlefieldLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.closeBtn       = TFDirector:getChildByPath(ui, 'btn_close')
    self.reportLayer = {}
    self.reportLayer[1]     = TFDirector:getChildByPath(ui, 'panel_person')
    self.reportLayer[2]     = TFDirector:getChildByPath(ui, 'panel_public')

    local txtTips = TFDirector:getChildByPath(self.reportLayer[1], "txt")
    txtTips:setText(localizable.KingWarMyTeamReport)
        
    self:initButtonGroup(ui)
end

function KingWarBattlefieldLayer:registerEvents(ui)
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.closeBtn);

end

function KingWarBattlefieldLayer:removeEvents()
    self.super.removeEvents(self)

end


function KingWarBattlefieldLayer:refreshReportLayer(index)
    self.tableViewList =  self.tableViewList or {}
    if self.tableViewList[index] == nil then
        local panel_scroll = TFDirector:getChildByPath(self.reportLayer[index], "panel_scroll")
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(panel_scroll:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)


        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, KingWarBattlefieldLayer.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, KingWarBattlefieldLayer.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, KingWarBattlefieldLayer.numberOfCellsInTableView)

        self.tableViewList[index] = tableView
        self.tableViewList[index].logic = self

        panel_scroll:addChild(tableView)
    end
    self.tableViewList[index]:reloadData()
    self.tableViewList[index]:setScrollToEnd()
end

function KingWarBattlefieldLayer.cellSizeForTable(table,idx)
    return 30,630
end

function KingWarBattlefieldLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    self.allPanels = self.allPanels or {}

    if nil == cell then
        cell = TFTableViewCell:create()
        local zhenbashaiCell = require('lua.logic.zhengba.ZhenbashaiCell'):new()
        cell.panel = zhenbashaiCell
        cell:addChild(zhenbashaiCell)
    end
    cell.panel:setData(self.personGrandList:objectAt(idx + 1))
    return cell
end

function KingWarBattlefieldLayer.numberOfCellsInTableView(table)
    local self = table.logic
    return self.personGrandList:length()
end
function KingWarBattlefieldLayer:selectSideButton(index)
    self.selectedIndex = index
    local text_name = {"ui_new/crossarena/tab_bdzb.png" , "ui_new/spectrum/tab_dhzb.png"}
    local text_nameh = {"ui_new/crossarena/tab_bdzbh.png" , "ui_new/spectrum/tab_dhzbh.png"}
    for i = 1, #self.sideButtons do
        if i ~= index then
            self.sideButtons[i]:setTextureNormal(text_name[i])
            self.reportLayer[i]:setVisible(false)
        end
    end

    self.personGrandList:clear()
    local dataRecord = KingOfWarManager:getReport( self.selectedIndex )
    for i=1,dataRecord:length() do
        local item = dataRecord:objectAt(i)
        self.personGrandList:pushBack(item)
    end
      
    self.sideButtons[index]:setTextureNormal(text_nameh[index])
    self.reportLayer[index]:setVisible(true)
    self:refreshReportLayer(index)
end

--初始化buttongroup
function KingWarBattlefieldLayer:initButtonGroup(ui)
   
    --频道按钮点击事件处理方法
    local function onSelectChangeHandle(target)
        if target.tag == self.selectedIndex then
            return
        end
        self:selectSideButton(target.tag)
    end

    local channelGroup = TFButtonGroup:create()
    self.channelGroup = channelGroup
    self.sideButtons = {}
    for i = 1,2 do
        local channelButton = TFDirector:getChildByPath(self.ui, "tab" .. i)
        channelButton:addMEListener(TFWIDGET_CLICK, audioClickfun(onSelectChangeHandle))
        channelButton.tag = i
        self.sideButtons[i] = channelButton
    end
    self:selectSideButton(1)
end

--获取当前选中的频道
function KingWarBattlefieldLayer:getSelectedChannelIndex()
    return self.selectedIndex
end

--选中某个分类，一般在其他地方调用。如：打开界面时默认选中某个界面的时候
function KingWarBattlefieldLayer:changeGroupChoice( index )
    if self.selectedIndex == index then
        return
    end

    self:selectSideButton(index)
end
return KingWarBattlefieldLayer