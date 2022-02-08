-- client side XiakexingBaoxiang.lua
--[[
 * @Description: 木人桩活动宝箱展示
 ]]
-- script writer wuqi
-- creation time 2016-11-21
local XiakexingBaoxiang = class("XiakexingBaoxiang", BaseLayer);

CREATE_SCENE_FUN(XiakexingBaoxiang);
CREATE_PANEL_FUN(XiakexingBaoxiang);

local ShowMaxNum = 8

function XiakexingBaoxiang:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.xiakexing.XiakexingBaoxiang");
end

function XiakexingBaoxiang:initUI(ui)
    self.super.initUI(self, ui);

    self.txt_title = TFDirector:getChildByPath(ui, "txt_title")
    self.panel_icon = TFDirector:getChildByPath(ui, "panel_icon")
    self.panel_reward_item = TFDirector:getChildByPath(ui, 'bg_icon')
    self.panel_reward_item:retain()
    self.panel_reward_item:removeFromParent(true)
    self.panel_reward_item:setVisible(false)
end

function XiakexingBaoxiang:loadData(data, count)
    self.count = count or 5
    self.boxReward = data.boxReward or {}

    self:refreshUI();
end

function XiakexingBaoxiang:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function XiakexingBaoxiang:refreshBaseUI()

end

function XiakexingBaoxiang:refreshUI()
    self.txt_title:setText( stringUtils.format( localizable.WoodActivityLayer_tips6, self.count ) )
    local panel = self.panel_icon
    if not self.tableView then
        local tableView =  TFTableView:create()
        tableView:setTableViewSize(panel:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLHORIZONTAL)
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.box_cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.box_tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.box_numberOfCellsInTableView)
        tableView = tableView
        tableView.logic = self
        tableView:setPosition(ccp(0, 0))
        self.tableView = tableView
        panel:addChild(tableView)
    end
    self.tableView:reloadData()
end

function XiakexingBaoxiang.box_cellSizeForTable(table, idx)
    return 112, 112
end

function XiakexingBaoxiang.box_numberOfCellsInTableView(table)
    local self = table.logic
    local index = table.index
    local data = self.boxReward or {}
    if data then
        return #data
    end
    return 0
end

function XiakexingBaoxiang.box_tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    if nil == cell then
        cell = TFTableViewCell:create()
        local panel_item = self.panel_reward_item:clone()
        panel_item:setVisible(true)
        panel_item:setPosition(ccp(3, 8))
        cell:addChild(panel_item)
        cell.panel_item = panel_item
    end
    local rewardInfo = nil
    local index = table.index
    local data = self.boxReward or {}
    if data then
        rewardInfo = data[idx+1]
    end
    
    if rewardInfo then
        self:loadBoxCellInfo( cell.panel_item , rewardInfo )
    else
        cell.panel_item:setVisible(false)
    end
    return cell
end

function XiakexingBaoxiang:loadBoxCellInfo(panel_item, info)
    local reward = info or {}
    local commonReward ={}
    commonReward.type   = reward.resType
    commonReward.itemId = reward.resId
    commonReward.number = reward.number
    local rewardItem =  BaseDataManager:getReward(commonReward) 
    local img_icon  = TFDirector:getChildByPath(panel_item, 'img_icon');
    local txt_num   = TFDirector:getChildByPath(panel_item, 'txt_num');
    local txt_name  = TFDirector:getChildByPath(panel_item, 'txt_name');

    function onClick( sender )
      Public:ShowItemTipLayer(rewardItem.itemid, rewardItem.type);
    end
    panel_item:setTexture(GetColorIconByQuality_118(rewardItem.quality));
    panel_item:setTouchEnabled(true)
    panel_item:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
    
    if img_icon then
        img_icon:setTexture(rewardItem.path);
        Public:addPieceImg(img_icon,rewardItem,nil,1);
    end
    if txt_num then
        txt_num:setText("" .. rewardItem.number);
        if rewardItem.number < 2 and isShowOne == false then
            txt_num:setVisible(false);
        else
            txt_num:setVisible(true);
        end
    end
end

function XiakexingBaoxiang:removeUI()
   self.super.removeUI(self);
end

--注册事件
function XiakexingBaoxiang:registerEvents()
    self.super.registerEvents(self);
    self.ui:setTouchEnabled(true)
    self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBgClickHandle))
end

function XiakexingBaoxiang.onBgClickHandle(sender)
    AlertManager:close()
end

function XiakexingBaoxiang:removeEvents()
    self.super.removeEvents(self)
end

return XiakexingBaoxiang;