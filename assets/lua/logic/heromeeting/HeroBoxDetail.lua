--[[
******英雄大会-欢迎界面*******

    -- by jiawei.miao
    -- 2018/1/5
]]
local HeroBoxDetail = class("HeroBoxDetail", BaseLayer);

CREATE_SCENE_FUN(HeroBoxDetail);
CREATE_PANEL_FUN(HeroBoxDetail);

local ShowMaxNum = 8

function HeroBoxDetail:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.xiakexing.XiakexingBaoxiang");
end

function HeroBoxDetail:initUI(ui)
    self.super.initUI(self, ui);

    self.txt_title = TFDirector:getChildByPath(ui, "txt_title")
    self.panel_icon = TFDirector:getChildByPath(ui, "panel_icon")
    self.panel_reward_item = TFDirector:getChildByPath(ui, 'bg_icon')
    self.panel_reward_item:retain()
    self.panel_reward_item:removeFromParent(true)
    self.panel_reward_item:setVisible(false)
end

function HeroBoxDetail:loadData(data, count)
    self.count = count or 5
    self.boxReward = data or {}

    self:refreshUI();
end

function HeroBoxDetail:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function HeroBoxDetail:refreshBaseUI()

end

function HeroBoxDetail:refreshUI()
    self.txt_title:setText( stringUtils.format( localizable.HERO_BOX_TATIL, self.count ) )
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

function HeroBoxDetail.box_cellSizeForTable(table, idx)
    return 112, 112
end

function HeroBoxDetail.box_numberOfCellsInTableView(table)
    local self = table.logic
    local index = table.index
    local data = self.boxReward or {}
    if data then
        return #data
    end
    return 0
end

function HeroBoxDetail.box_tableCellAtIndex(table, idx)
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

function HeroBoxDetail:loadBoxCellInfo(panel_item, info)
    local reward = info or {}
    local commonReward ={}
    commonReward.type   = reward.resType
    commonReward.itemId = reward.resId
    commonReward.number = reward.number
    print("HeroBoxDetail:loadBoxCellInfo",info)
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
        img_icon:setPosition(ccp(60,60))
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

function HeroBoxDetail:removeUI()
   self.super.removeUI(self);
end

--注册事件
function HeroBoxDetail:registerEvents()
    self.super.registerEvents(self);
    self.ui:setTouchEnabled(true)
    self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBgClickHandle))
end

function HeroBoxDetail.onBgClickHandle(sender)
    AlertManager:close()
end

function HeroBoxDetail:removeEvents()
    self.super.removeEvents(self)
end

return HeroBoxDetail;