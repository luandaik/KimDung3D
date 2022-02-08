local BiaocheReword = class("BiaocheReword", BaseLayer)

function BiaocheReword:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.faction.BiaocheReword")
end

function BiaocheReword:initUI( ui )
    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')

    self.panel_list = TFDirector:getChildByPath(ui, "panel_list")
    self.panelSize = self.panel_list:getSize()
    self.panel_cell = TFDirector:getChildByPath(self.panel_list, "bg")
    self.panel_cell:setAnchorPoint(ccp(0, 0))
    self.panel_cell:setVisible(false)
    self.panel_cell:retain()
    self.panel_cell:removeFromParent()
    self.tTitilePath = {
        "ui_new/crossarena/img_rank2.png",
        "ui_new/crossarena/img_rank3.png",
        "ui_new/crossarena/img_3.png",
        "ui_new/crossarena/img_4_8.png",
        "ui_new/crossarena/img_rank6.png",
        "ui_new/crossarena/img_rank7.png",
        "ui_new/crossarena/img_rank8.png",
        "ui_new/crossarena/img_rank11.png"
    }

    self.pathBig = {[3] = "ui_new/common/qhp_tb_icon.png",[21] = "ui_new/wulin/icon_ryl2.png",[22] = "ui_new/wulin/icon_ryl.png"}
    self.pathSmall = {[3] = "ui_new/common/icon_coin.png",[21] = "ui_new/wulin/icon_ryl4.png",[22] = "ui_new/wulin/icon_ryl3.png"}
end

function BiaocheReword:refreshData()
    self.data = ChampionsAwardData:getAllRewardDataByType(17) or {}
end

function BiaocheReword:refreshTabView()
    if self.tabView then
        self.tabView:reloadData()
        return
    end
    local tabView = TFTableView:create()
    tabView:setTableViewSize(CCSize(self.panelSize.width, self.panelSize.height))
    tabView:setDirection(TFTableView.TFSCROLLHORIZONTAL)
    tabView.logic = self
    self.panel_list:addChild(tabView)
    tabView:setPosition(ccp(0, 0))
    self.tabView = tabView

    self.tabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tabView:reloadData()
end

function BiaocheReword.cellSizeForTable(table, idx)
    return 400, 140
end

function BiaocheReword.numberOfCellsInTableView(table)
    local self = table.logic    
    local num = #self.data
    return num
end

function BiaocheReword.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell:clone()
        panel:setPosition(ccp(10, 5))
        panel:setVisible(true)
        panel:setTag(100)
        cell.panel = panel
        cell:addChild(panel)
    end
    idx = idx + 1
    self:refreshCell(cell.panel, idx)    
    return cell
end

function BiaocheReword:refreshCell(panel, index)
    local rewardInfo = self.data[index]
    print("排名奖励",rewardInfo)
    if rewardInfo == nil then
        panel:setVisible(false)
        return
    end
    -- local posX = 69
    -- if index == 1 then
    --     posX = 90
    -- end
    local posX = 10
    panel:setPositionX(posX)
    local rankPath = self.tTitilePath[index]
    -- if index >= 8 then
    --     rankPath = "ui_new/crossarena/img_rank11.png"
    -- else
    --     rankPath = "ui_new/crossarena/" .. "img_rank" .. index + 1 .. ".png"
    -- end
    local img_rank = TFDirector:getChildByPath(panel, 'img_diyi')
    img_rank:setTexture(rankPath)
    local rewardll = {}
    local rewardStr = stringToTable(rewardInfo.award,"|")
    for i,v in ipairs(rewardStr) do
        local tbl = stringToNumberTable(v,"_")
        rewardll[i] = {type = tbl[1],itemId = tbl[2],number = tbl[3]}
    end
    local txt1 = TFDirector:getChildByPath(panel, 'txt1')
    txt1:setText("x" .. rewardll[1].number)
    local path = self.pathBig[rewardll[1].type]
    if path == nil then
        local rewardtt = BaseDataManager:getReward(rewardll[1])
        path = rewardtt.path
    end

    local img_reward1 = TFDirector:getChildByPath(panel, 'img_yb1')
    img_reward1:setTexture(path)

    local txt2 = TFDirector:getChildByPath(panel, 'txt2')
    txt2:setText("x" .. rewardll[2].number)

    path = self.pathSmall[rewardll[2].type]
    if path == nil then
        local rewardtt = BaseDataManager:getReward(rewardll[2])
        path = rewardtt.path
    end

    local img_reward2 = TFDirector:getChildByPath(panel, 'img_tongbi')
    img_reward2:setTexture(path)

    local fanrongNum = ConstantData:objectByID("EscortAgencyProsperityDegreeReward"..index).value
    local txt_number = TFDirector:getChildByPath(panel, 'txt_number')
    txt_number:setText(fanrongNum)
end

function BiaocheReword:refreshUI()
    self:refreshData()
    self:refreshTabView()
end

function BiaocheReword:removeUI()
    self.super.removeUI(self)

    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
end

function BiaocheReword:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function BiaocheReword:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function BiaocheReword:removeEvents()
    self.super.removeEvents(self)
end

return BiaocheReword