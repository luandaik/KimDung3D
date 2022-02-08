-- client side IslandAchieveLayer.lua
--[[
 * @Description: 东瀛岛成就界面
 ]]
-- script writer wuqi
-- creation time 2016-12-15

local IslandAchieveLayer = class("IslandAchieveLayer", BaseLayer)

function IslandAchieveLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.island.IslandChengJiu")
end

function IslandAchieveLayer:initUI( ui )
	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.panel_list = TFDirector:getChildByPath(ui, "panel_list")    
    
    self.txt_number = TFDirector:getChildByPath(ui, "txt_number")
   
    self.panel_cell = TFDirector:getChildByPath(ui, "img_liebiaobg1")
    self.panel_cell:retain()
    self.panel_cell:setAnchorPoint(ccp(0,0))
    self.panel_cell:removeFromParent()
    self.panel_cell:setVisible(false)
    self:createTableView()
end

function IslandAchieveLayer:removeUI()
    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
	self.super.removeUI(self)    
end

function IslandAchieveLayer:onShow()
    self.super.onShow(self)
    JapanIslandManager:getAcheivAttri()
    self:refreshUI()
end

function IslandAchieveLayer:refreshUI()   
    self.tableView:reloadData()
    local num = JapanIslandManager:getPassedChapId()
    self.txt_number:setText(num .. localizable.common_gold)
end

function IslandAchieveLayer:createTableView()
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
end

function IslandAchieveLayer:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function IslandAchieveLayer:removeEvents()
    JapanIslandManager:clearAchieveRed()
    self.super.removeEvents(self)
end

function IslandAchieveLayer:dispose()
	self.super.dispose(self)
end

function IslandAchieveLayer.cellSizeForTable(table,idx)
    return 110, 646
end

function IslandAchieveLayer.numberOfCellsInTableView(table)
    return JapanTeamChapterData:length()
end

function IslandAchieveLayer.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell:clone()
        panel:setPosition(ccp(3, 0))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end

    self:setPanelInfo(cell.panel, idx + 1)
    return cell
end

function IslandAchieveLayer:setPanelInfo(panel, idx)
    local item = JapanTeamChapterData:objectByID(idx)
    local integral = JapanIslandManager:getPassedChapId()
    local txt_title = TFDirector:getChildByPath(panel, "txt_title")
    local img_icon = TFDirector:getChildByPath(panel, "img_icon")
    local txt_shuxing = TFDirector:getChildByPath(panel, "txt_shuxing")
    local txt_shuoming = TFDirector:getChildByPath(panel, "txt_shuoming")
    local img_jihuo = TFDirector:getChildByPath(panel, "img_jihuo")
    local img_hongdian = TFDirector:getChildByPath(panel, "img_hongdian")
    local txt_shuxing = TFDirector:getChildByPath(panel, "txt_shuxing")
    
    txt_title:setText(localizable.JapanIsland_tongguan .. item.name)
    txt_shuxing:setText(item.achievement_name)
    if integral >= item.chapter_id then
        img_jihuo:setVisible(true)
    else
        img_jihuo:setVisible(false)
    end
    img_hongdian:setVisible(false)

    --img_icon:setTexture('icon/task/' .. idx .. '.png')
    img_icon:setTexture('icon/task/14.png')

    if JapanIslandManager.achievementList[idx] and JapanIslandManager.achievementList[idx] == true and JapanIslandManager.isFirstLoaded == false then
    --if JapanIslandManager.achievementList[idx] == true then
        img_hongdian:setVisible(true)
    end
end

return IslandAchieveLayer