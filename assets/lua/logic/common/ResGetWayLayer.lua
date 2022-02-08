-- client side ResGetWayLayer.lua
--[[
 * @Description: 缺物获取路径提示
 ]]
-- script writer chikui
-- creation time 2016-10-31

local ResGetWayLayer = class("ResGetWayLayer", BaseLayer)

function ResGetWayLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.common.Needmore")
end

function ResGetWayLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.btn_close          = TFDirector:getChildByPath(ui, 'btn_close')
    self.panel_list         = TFDirector:getChildByPath(ui, 'Panel_cell')
    self.way_cell_model     = TFDirector:getChildByPath(ui, 'img_cellbg')
    self.way_cell_model:removeFromParent(false)
    self.way_cell_model:retain()
    self.infoList = {} 
end

function ResGetWayLayer:refreshUI()
    self:refreshTableView()
end

function ResGetWayLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function ResGetWayLayer:removeUI()
    self.super.removeUI(self)
    if self.way_cell_model then
        self.way_cell_model:release()
        self.way_cell_model = nil
    end
end

function ResGetWayLayer:setWayList( infoList )
	self.infoList = infoList
    print("infoList = ",infoList)
	-- self:refreshUI()
end

function ResGetWayLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
end

function ResGetWayLayer:removeEvents()
    self.super.removeEvents(self)
end

function ResGetWayLayer.onWayJumpClick(sender)
    local jumpId = sender.idx
    ResGetWayManager:openGetWay(jumpId)
end

function ResGetWayLayer:refreshTableView()
    if self.tableView == nil then
        local tabView =  TFTableView:create()
        tabView:setTableViewSize(self.panel_list:getContentSize())
        tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        tabView.logic = self
        self.panel_list:addChild(tabView)
        tabView:setPosition(ccp(0, 0))
        self.tableView = tabView

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
        self.tableView:reloadData()
    else
        self.tableView:reloadData()
    end
end

function ResGetWayLayer.cellSizeForTable(table,idx)
    local self = table.logic
    local num = #self.infoList
    if idx == num then
        return 82,555
    end
    return 82,555
end

function ResGetWayLayer.numberOfCellsInTableView(table)
    local self = table.logic
    local num = #self.infoList
    return num
end

function ResGetWayLayer.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.way_cell_model:clone()
        panel:setPosition(ccp(293,40))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end
    cell.panel:setVisible(true) 
    local infoId = self.infoList[idx + 1]
    local info = ResGetWayManager:getInfoDataById(infoId)
    if info then
        self:setPanelInfo(cell.panel, info)
    else
        cell.panel:setVisible(false) 
    end
    return cell
end

function ResGetWayLayer:setPanelInfo(panel, wayInfo)

    local img_icon = TFDirector:getChildByPath(panel, "img_icon")
    local txt_shuoming2 = TFDirector:getChildByPath(panel, "txt_shuoming2")
    local btn_jump = TFDirector:getChildByPath(panel, "Button_Needmore_1")

    btn_jump:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onWayJumpClick),1)
    btn_jump.logic = self
    btn_jump.idx = wayInfo.id

    txt_shuoming2:setText(wayInfo.desc)

    img_icon:setTexture("icon/task/" .. wayInfo.icon .. ".png")
end

return ResGetWayLayer