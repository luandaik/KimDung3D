-- client side TianMingAchievementLayer.lua
--[[
 * @Description: 天命成就
 ]]

local TianMingAchievementLayer = class("TianMingAchievementLayer", BaseLayer)
local path = {"ui_new/rolerisingstar/bg_ql1.png","ui_new/rolerisingstar/bg_ql2.png"}
function TianMingAchievementLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.role_new.TianMingChengJiu")

end

function TianMingAchievementLayer:initUI(ui)
	self.super.initUI(self,ui)
    self.list_Achievement      = TFDirector:getChildByPath(ui, 'panel_gundong');
    self.cell = TFDirector:getChildByPath(ui, 'panel_2');
    self.cell1 = TFDirector:getChildByPath(ui, 'panel_1');
    self.cell1:setVisible(false)
    self.cell:setVisible(false)
    self.cell:retain()
    self.cell:removeFromParent()
    self.AllList = DesTinyAchievementData:getAllListInfo()
end

function TianMingAchievementLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function TianMingAchievementLayer:loadData(List)
    self.AchievementList = List
end
function TianMingAchievementLayer:refreshUI()
    if self.tableView == nil then
        local tabView =  TFTableView:create()
        tabView.logic = self
        tabView:setTableViewSize(self.list_Achievement:getContentSize())
        tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        
        self.list_Achievement:addChild(tabView)
        -- tabView:setPosition(ccp(0, 0))
        self.tableView = tabView

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW,handler(self.numberOfCellsInTableView,self))
    end
    self.tableView:reloadData()
end

function TianMingAchievementLayer:cellSizeForTable(table,idx)
    return 100,429
end

function TianMingAchievementLayer:tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()

    idx = idx + 1
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.cell:clone()
        panel:setVisible(true)
        cell.panel = panel
        panel:setZOrder(100)
        cell:addChild(panel)
        panel:setPosition(ccp(10,0))
    end
    self:setCellInfo(cell,idx)
    return cell
end
function TianMingAchievementLayer:numberOfCellsInTableView(table)
    local self = table.logic
    return #self.AllList or 0
end

function TianMingAchievementLayer:setCellInfo(cell,idx)
    local panel = cell.panel
    local txt_yuanfen_word = TFDirector:getChildByPath(panel, 'txt_yuanfen_word');
    txt_yuanfen_word:setText(self.AllList[idx].desc)
    local img_bg = TFDirector:getChildByPath(panel, 'img_bg');
    local img_yijihuo = TFDirector:getChildByPath(img_bg, 'img_yijihuo');
    img_yijihuo:setVisible(false)
    local type = 1 
    for _,k in ipairs(self.AchievementList) do
        if k == idx then
            type = 2 
            img_yijihuo:setVisible(true)
            break
        end
    end
    img_bg:setTexture(path[type])
end
function TianMingAchievementLayer:removeUI()
    self.super.removeUI(self)
end

function TianMingAchievementLayer:dispose()
    self.super.dispose(self)
end
-----断线重连支持方法
function TianMingAchievementLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end
return TianMingAchievementLayer