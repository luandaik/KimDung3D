-- client side WuLinEnemyRewardLayer.lua
--[[
 * @Description: 武林公敌奖励
 ]]
-- script writer chikui
-- creation time 2016-12-22


local WuLinEnemyRewardLayer = class("WuLinEnemyRewardLayer",BaseLayer)

function WuLinEnemyRewardLayer:ctor(data)

    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.demond.WuLinGongDiReward")
end

function WuLinEnemyRewardLayer:initUI( ui )

    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')

    self.txtList_Reward = {}

    self.panel_list = TFDirector:getChildByPath(ui, 'panel_list')

    self.panel_reward_model = TFDirector:getChildByPath(ui, 'bg_1')
    self.panel_reward_model:retain()
    self.panel_reward_model:removeFromParent(true)
    self.panel_reward_model:setVisible(false)
    self.pathBig = {[3] = "ui_new/common/qhp_tb_icon.png",[21] = "ui_new/wulin/icon_ryl2.png",[22] = "ui_new/wulin/icon_ryl.png"}
    self.pathSmall = {[3] = "ui_new/common/icon_coin.png",[21] = "ui_new/wulin/icon_ryl4.png",[22] = "ui_new/wulin/icon_ryl3.png"}
    self:setReward()
end

function WuLinEnemyRewardLayer:setReward()
    self.rewardList = ChampionsAwardData:getAllRewardDataByType(21)
    self:refreshRewardInfo()
end

function WuLinEnemyRewardLayer:refreshRewardInfo()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLHORIZONTAL)
        --tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView = tableView
        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable,self)
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex,self)
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView,self)
        --self.tableView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll,self)
        tableView.logic = self
        self.panel_list:addChild(tableView)
    end
    self.tableView:reloadData()
end

function WuLinEnemyRewardLayer.numberOfCellsInTableView(table)
    local self = table.logic
    return #(self.rewardList)
end

function WuLinEnemyRewardLayer.cellSizeForTable(table,idx)
    local self = table.logic
    local length = #(self.rewardList)
    if idx == 0 or idx == length - 1 then
        return 400,138 + 2 + 21
    end
    return 400 , 138 + 2
end

function WuLinEnemyRewardLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_reward_model:clone()
        node:setVisible(true)
        cell:addChild(node)
        cell.panel = node
    end

    cell.index = idx + 1

    self:drawRewardNode(cell, idx + 1)
    return cell
end

function WuLinEnemyRewardLayer:drawRewardNode(cell, index)
    local panel = cell.panel
    if panel == nil then
        return
    end
    local rewardInfo = self.rewardList[index]
    if rewardInfo == nil then
        panel:setVisible(false)
        return
    end
    local posX = 69
    if index == 1 then
        posX = 90
    end
    panel:setPositionX(posX)
    local rankPath = "ui_new/crossarena/"
    if index + 1 >= 10 then
        rankPath = "ui_new/demond/"
    end
    rankPath = rankPath .. "img_rank" .. index + 1 .. ".png"
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

    local txt_number = TFDirector:getChildByPath(panel, 'txt_number')
    txt_number:setText("X" .. rewardll[3].number)

    local img_jipobg = TFDirector:getChildByPath(panel, 'img_jipobg')
    img_jipobg:setTouchEnabled(true)
    local tipFunc = function()
        Public:ShowItemTipLayer(rewardll[3].itemId, rewardll[3].type);
    end
    img_jipobg:addMEListener(TFWIDGET_CLICK, audioClickfun(tipFunc),1)

    local img_icon = TFDirector:getChildByPath(panel, 'img_icon')
    local rewardt3 = BaseDataManager:getReward(rewardll[3])
    if rewardt3 and rewardt3.path then
        img_icon:setTexture(rewardt3.path)
    end
end

function WuLinEnemyRewardLayer:removeUI()
    if self.panel_reward_model then
        self.panel_reward_model:release()
        self.panel_reward_mode = nil
    end
    self.super.removeUI(self)
end

function WuLinEnemyRewardLayer:onShow()
    self.super.onShow(self)
end

function WuLinEnemyRewardLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
end

function WuLinEnemyRewardLayer:removeEvents()
    self.super.removeEvents(self)
end

return WuLinEnemyRewardLayer