-- client side GuildBossChooseStageLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-04-14


local GuildBossChooseStageLayer = class("GuildBossChooseStageLayer", BaseLayer)
function GuildBossChooseStageLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.faction.YanWuChooseLevel")
end

function GuildBossChooseStageLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.btn_close          = TFDirector:getChildByPath(ui, 'btn_close')
    self.panel_list         = TFDirector:getChildByPath(ui, 'panel_huadong')
    self.img_guodu          = TFDirector:getChildByPath(ui, 'img_guodu')
    self.btn_ok             = TFDirector:getChildByPath(ui, 'btn_ok')

    local panel = TFPanel:create()
    local node = TFDirector:getChildByPath(ui, 'bg_wxz' )
    node:removeFromParent(false)
    panel:addChild(node,1,100)
    node:setPositionY(0)

    node = TFDirector:getChildByPath(ui, 'bg_xz' )
    node:removeFromParent(false)
    panel:addChild(node,1,101)
    node:setPositionY(0)

    self.panel_cell_model = panel
    self.panel_cell_model:retain()
    local mainInfo = GuildBossManager:getMianInfo()
    self.curSelectStage = mainInfo.passStage
    if self.curSelectStage == 0 then
        self.curSelectStage = 1
    end
    self.firstLoad = true
end

function GuildBossChooseStageLayer:registerEvents()
    self.super.registerEvents(self)
    self.btn_ok:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnSureClick),1)
    self.btn_ok.logic = self
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function GuildBossChooseStageLayer:removeEvents()
    self.super.removeEvents(self)
end


function GuildBossChooseStageLayer:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    self.super.removeUI(self)
end

function GuildBossChooseStageLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function GuildBossChooseStageLayer:dispose()
    self.super.dispose(self)
end

function GuildBossChooseStageLayer:refreshUI()
    self:refreshTableView()
end

function GuildBossChooseStageLayer:refreshTableView()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()

        self.tableView = tableView
        tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView,self))
        self.tableView:addMEListener(TFTABLEVIEW_SCROLL, handler(self.tableScroll,self))
        self.panel_list:addChild(tableView)
    end
    self.tableView:reloadData()
    if self.firstLoad == true then
        self.firstLoad = false
        local size = GuildBossManager:getStageSize()
        local height = 66 * (size - self.curSelectStage + 1)
        local offSet = self.panel_list:getContentSize().height - height
        if offSet > 0 then offSet = 0 end
        self.tableView:setContentOffset(ccp(0,offSet))
    end
end


function GuildBossChooseStageLayer:cellSizeForTable(table,idx)
    return 66,465
end

function GuildBossChooseStageLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_cell_model:clone()
        node:setVisible(true)
        node:setPositionY(33)
        cell:addChild(node,1)
        cell.panel = node
    end
    self:setCellInfo(cell,idx)
    return cell
end

function GuildBossChooseStageLayer:numberOfCellsInTableView(table)
    local num = GuildBossManager:getStageSize()
    if num < 0 then num = 0 end
    return num
end

function GuildBossChooseStageLayer:tableScroll(table)
    local pos = self.tableView:getContentOffset()
    if pos.y >= 0 then
        self.img_guodu:setVisible(false)
    else
        self.img_guodu:setVisible(true)
    end
end

function GuildBossChooseStageLayer:setCellInfo(cell,idx)
    local node1 = TFDirector:getChildByPath(cell.panel, 'bg_wxz')
    local node2 = TFDirector:getChildByPath(cell.panel, 'bg_xz')
    local node = node1
    if self.curSelectStage == idx then
        node = node2
        node1:setVisible(false)
    else
        node2:setVisible(false)
    end
    node:setVisible(true)
    local stageInfo = GuildBossManager:getStageData(idx)
    local txt_jie = TFDirector:getChildByPath(node, 'txt_jie')
    local img_suo = TFDirector:getChildByPath(node, 'img_suo')
    local txt_zl = TFDirector:getChildByPath(node, 'txt_zl')
    local btn_xz = TFDirector:getChildByPath(node, 'btn_xz')
    if img_suo then
        img_suo:setVisible(false)
    end
    local mainInfo = GuildBossManager:getMianInfo()
    if idx > mainInfo.passStage + 1 then
        btn_xz:setVisible(false)
        if img_suo then
            img_suo:setVisible(true)
        end
    else
        btn_xz:setVisible(true)
        if self.curSelectStage == idx then
            btn_xz:setTextureNormal("ui_new/common/check_yes.png")
        else
            btn_xz:setTextureNormal("ui_new/common/check_no.png")
        end
        btn_xz:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnXZClick),1);
        btn_xz.logic = self
        btn_xz.idx = idx
    end
    txt_jie:setText(stringUtils.format(localizable.EquipGradeUpCount,idx))
    txt_zl:setText(stageInfo.power)
end

function GuildBossChooseStageLayer.OnXZClick( sender )
    local self = sender.logic
    if sender.idx == self.curSelectStage then
        return
    end
    self.curSelectStage = sender.idx
    self:refreshTableView()
end

function GuildBossChooseStageLayer.OnSureClick( sender )
    local self = sender.logic
    if self.curSelectStage <= 0 then
        self.curSelectStage = 1
    end
    GuildBossManager:requestChooseStage(self.curSelectStage)
    AlertManager:closeLayer(self)
end
return GuildBossChooseStageLayer