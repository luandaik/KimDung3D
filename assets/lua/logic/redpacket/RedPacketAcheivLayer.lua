-- client side RedPacketAcheivLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-08-06

local RedPacketAcheivLayer = class("RedPacketAcheivLayer",BaseLayer)

function RedPacketAcheivLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.Factionhbchengjiu")
end

function RedPacketAcheivLayer:initUI( ui )
	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.panel_list = TFDirector:getChildByPath(ui, "panel_list")    
    
    self.txt_number = TFDirector:getChildByPath(ui, "txt_number")
   
    self.panel_cell = TFDirector:getChildByPath(ui, "img_liebiaobg1")
    self.panel_cell:retain()
    self.panel_cell:setAnchorPoint(ccp(0,0))
    self.panel_cell:removeFromParent()
    self.panel_cell:setVisible(false)
    self.pathList = {
        'ui_new/faction/hongbao/img_hongbao1.png',
        'ui_new/faction/hongbao/img_hongbao2.png',
        'ui_new/faction/hongbao/img_hongbao3.png'
    }
    self:createTableView()
end

function RedPacketAcheivLayer:removeUI()
    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
	self.super.removeUI(self)    
end

function RedPacketAcheivLayer:onShow()
    self.super.onShow(self)
    RedPacketManager:getAcheivAttri()
    self:refreshUI()
end

function RedPacketAcheivLayer:refreshUI()   
    self.tableView:reloadData()
    local num = RedPacketManager:getMyIntegral()
    self.txt_number:setText(num .. localizable.common_gold)
end

function RedPacketAcheivLayer:createTableView()
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

function RedPacketAcheivLayer:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function RedPacketAcheivLayer:removeEvents()
    RedPacketManager:clearRed()
    self.super.removeEvents(self)
end

function RedPacketAcheivLayer:dispose()
	self.super.dispose(self)
end

function RedPacketAcheivLayer.cellSizeForTable(table,idx)
    return 120, 646
end

function RedPacketAcheivLayer.numberOfCellsInTableView(table)
    return RedPacketAchievementData:length()
end

function RedPacketAcheivLayer.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell:clone()
        panel:setPosition(ccp(0,0))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end

    self:setPanelInfo(cell.panel, idx + 1)
    return cell
end

function RedPacketAcheivLayer:setPanelInfo(panel, idx)
    local item = RedPacketAchievementData:objectByID(idx)
    local integral = RedPacketManager:getMyIntegral()
    local txt_title = TFDirector:getChildByPath(panel, "txt_title")
    local img_icon = TFDirector:getChildByPath(panel, "img_icon")
    local txt_shuxing = TFDirector:getChildByPath(panel, "txt_shuxing")
    local txt_shuoming = TFDirector:getChildByPath(panel, "txt_shuoming")
    local img_jihuo = TFDirector:getChildByPath(panel, "img_jihuo")
    local img_hongdian = TFDirector:getChildByPath(panel, "img_hongdian")
    
    txt_title:setText(item.name)
    local attri = item:getAttribute()
    txt_shuxing:setText(item.effect_desc)
    txt_shuoming:setText(item.desc)
    if integral >= item.integral then
        img_jihuo:setVisible(true)
    else
        img_jihuo:setVisible(false)
    end
    img_hongdian:setVisible(false)

    img_icon:setTexture('ui_new/faction/hongbao/img_hongbao_' .. idx .. '.png')
    if RedPacketManager.achievementList[idx] and RedPacketManager.achievementList[idx] == true then
        img_hongdian:setVisible(true)
    end
end

return RedPacketAcheivLayer