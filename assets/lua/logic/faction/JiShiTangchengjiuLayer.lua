-- client side JiShiTangchengjiuLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-05-15




local JiShiTangchengjiuLayer = class("JiShiTangchengjiuLayer", BaseLayer)
function JiShiTangchengjiuLayer:ctor(equipid)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.faction.JiShiTangchengjiu")
end

function JiShiTangchengjiuLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.btn_close          = TFDirector:getChildByPath(ui, 'btn_close')
    self.panel_list         = TFDirector:getChildByPath(ui, 'panel_list')
    self.txt_xynum          = TFDirector:getChildByPath(ui, 'txt_number')
    self.txt_xynum:setText("0")

    self.panel_cell_model = TFDirector:getChildByPath(ui, 'img_liebiaobg1' )
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()

    self:refreshUI()
end

function JiShiTangchengjiuLayer:registerEvents(ui)
    self.super.registerEvents(self)
    
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

    local onRefreshUI = function()
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(FactionJiShiTangManager.REFRESH_JISHIBANG_INFO, onRefreshUI)
end

function JiShiTangchengjiuLayer:removeEvents()
    TFDirector:removeMEGlobalListener(FactionJiShiTangManager.REFRESH_JISHIBANG_INFO)
    self.super.removeEvents(self)
end

function JiShiTangchengjiuLayer:dispose()
    self.super.dispose(self)
end

function JiShiTangchengjiuLayer:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    FactionJiShiTangManager:updateOldAchieveId()
    self.super.removeUI(self)
end

function JiShiTangchengjiuLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function JiShiTangchengjiuLayer:refreshUI()
    self:refreshTableView()

    -- 自己的侠义值
    local myErrantry = FactionJiShiTangManager:getMyErrantry()
    self.txt_xynum:setText(tostring(myErrantry))
end

function JiShiTangchengjiuLayer:refreshTableView()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()

        self.tableView = tableView
        tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView,self))
        self.panel_list:addChild(tableView)
    end
    self.tableView:reloadData()
end

function JiShiTangchengjiuLayer:cellSizeForTable(table,idx)
    return 112,646
end

function JiShiTangchengjiuLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_cell_model:clone()
        node:setVisible(true)
        node:setPosition(ccp(323,55))
        cell:addChild(node,1)
        cell.panel = node
    end
    self:setCellInfo(cell,idx)
    return cell
end

function JiShiTangchengjiuLayer:numberOfCellsInTableView(table)
    local num = GiveAchievementData:length()
    if num < 0 then num = 0 end
    return num
end

function JiShiTangchengjiuLayer:setCellInfo(cell,idx)
    local info = GiveAchievementData:objectByID(idx)
    local panel = cell.panel
    if info == nil then
        panel:setVisible(false)
        return
    end
    panel:setVisible(true)

    local panel_Icon = TFDirector:getChildByPath(panel, 'img_icon')
    local txt_title = TFDirector:getChildByPath(panel, 'txt_title')
    local txt_shuxing = TFDirector:getChildByPath(panel, 'txt_shuxing')
    local txt_shuoming = TFDirector:getChildByPath(panel, 'txt_shuoming')
    local img_jihuo = TFDirector:getChildByPath(panel, 'img_jihuo')
    local img_hongdian = TFDirector:getChildByPath(panel, 'img_hongdian')
    panel_Icon:setTexture("ui_new/faction/jishitang/img_xiayizhi.png")
    txt_title:setText(info.name)
    txt_shuxing:setText(info.effect_desc)
    txt_shuoming:setText(stringUtils.format(localizable.jishitang_achieve,info.errantry))

    if idx <= FactionJiShiTangManager.giveAchievementIdList then
        img_jihuo:setVisible(true)
    else
        img_jihuo:setVisible(false)
    end
    if idx > FactionJiShiTangManager:getOldAchieveId() and idx <= FactionJiShiTangManager.giveAchievementIdList then
        img_hongdian:setVisible(true)
    else
        img_hongdian:setVisible(false)
    end
end

return JiShiTangchengjiuLayer