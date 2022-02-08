-- client side YanWuRewardLayer.lua
--[[
 * @Description: 武林公敌奖励
 ]]
-- script writer chikui
-- creation time 2016-12-22


local YanWuRewardLayer = class("YanWuRewardLayer",BaseLayer)

function YanWuRewardLayer:ctor(data)

    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.faction.YanWuReward")
end

function YanWuRewardLayer:initUI( ui )

    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')

    self.panel_reward = TFDirector:getChildByPath(ui, 'panel_reward')
    self.img_di3 = TFDirector:getChildByPath(ui, 'img_di3')
    self.img_di3:setVisible(false)
    self.tab_jpjl = TFDirector:getChildByPath(ui, 'tab_jpjl')
    self.tab_jpjl.index = 1
    self.tab_jpjl.logic = self
    self.tab_shjl = TFDirector:getChildByPath(ui, 'tab_shjl')
    self.tab_shjl.index = 2
    self.tab_shjl.logic = self
    -- self.tab_shjl:setTextureNormal("")

    --击败奖励
    self.panel_reward_model = TFDirector:getChildByPath(ui, 'bg')
    self.panel_reward_model:retain()
    self.panel_reward_model:removeFromParent(true)
    self.panel_reward_model:setVisible(false)
    --伤害排名奖励
    self.panel_reward_model2 = TFDirector:getChildByPath(ui, 'bg_sh')
    self.panel_reward_model2:retain()
    self.panel_reward_model2:removeFromParent(true)
    self.panel_reward_model2:setVisible(false)
    self:setReward()
    self.index =  1
    self:refreshRewardInfo()
    self:refreshUI()
end

function YanWuRewardLayer:setReward()
    self:refreshUI()
    self.rewardList = ChampionsAwardData:getAllRewardDataByType(19)
    self.rewardList2 = ChampionsAwardData:getAllRewardDataByType(34)
end
function YanWuRewardLayer:refreshUI()
    self:selectTab() 
end

--刷新按钮为普通状态
function YanWuRewardLayer:reSetTab()
    self.tab_jpjl:setTextureNormal("ui_new/faction/yanwu/tab_jl1.png")
    self.tab_shjl:setTextureNormal("ui_new/faction/yanwu/tab_jl3.png")
    self.tab_jpjl:setTouchEnabled(true)
    self.tab_shjl:setTouchEnabled(true)
end

function YanWuRewardLayer:selectTab()
    self:reSetTab()
    if self.index == 1 then
        self.tab_jpjl:setTextureNormal("ui_new/faction/yanwu/tab_jl1h.png")
        self.tab_jpjl:setTouchEnabled(false)
        if self.tableView then
            self.tableView:setVisible(true)
            self.tableView2:setVisible(false) 
        end
    elseif self.index == 2 then
        self.tab_shjl:setTextureNormal("ui_new/faction/yanwu/tab_jl3h.png")
        self.tab_shjl:setTouchEnabled(false)
        if self.tableView then
            self.tableView:setVisible(false)
            self.tableView2:setVisible(true)           
        end
    end
end

function YanWuRewardLayer:refreshRewardInfo()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_reward:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView = tableView
        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable,self)
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex,self)
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView,self)
        --self.tableView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll,self)
        tableView.logic = self
        self.panel_reward:addChild(tableView)
    end
    self.tableView:reloadData()

    if self.tableView2 == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_reward:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView2 = tableView
        self.tableView2:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable,self)
        self.tableView2:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex2,self)
        self.tableView2:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView2,self)
        --self.tableView2:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll,self)
        tableView.logic = self
        self.panel_reward:addChild(tableView)
    end
    self.tableView2:reloadData()
end

function YanWuRewardLayer.tableScroll(table)
    local self = table.logic
    local pos = self.tableView:getContentOffset()
    if pos.y >= 0 then
        self.img_di3:setVisible(false)
    else
        self.img_di3:setVisible(true)
    end
end

function YanWuRewardLayer.numberOfCellsInTableView(table)
    local self = table.logic
    return #(self.rewardList)
end

function YanWuRewardLayer.cellSizeForTable(table,idx)
    return 120 , 540
end

function YanWuRewardLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_reward_model:clone()
        node:setVisible(true)
        node:setPosition(ccp(45,0))
        cell:addChild(node)
        cell.panel = node
    end

    cell.index = idx + 1

    self:drawRewardNode(cell, idx + 1)
    return cell
end

function YanWuRewardLayer:drawRewardNode(cell, index)
    local panel = cell.panel
    if panel == nil then
        return
    end
    local info=self.rewardList[index]
    local rewardll = {}    
    local rewardStr = stringToTable(info.award,"|")
    for i,v in ipairs(rewardStr) do
        local tbl = stringToNumberTable(v,"_")
        rewardll[i] = {type = tbl[1],itemId = tbl[2],number = tbl[3]}
    end
    local txt_cyj = TFDirector:getChildByPath(panel, 'txt_cyj')
    local txt_num = TFDirector:getChildByPath(panel, 'txt_num')
    local txt_jp = TFDirector:getChildByPath(panel, 'txt_jp')
    if info.min_rank <= 0 then
        txt_cyj:setVisible(true)
        txt_num:setVisible(false)
        txt_jp:setVisible(false)
    else
        txt_num:setString(stringUtils.format(localizable.YanwuRewardRank,index))
        txt_num:setVisible(true)
        txt_jp:setVisible(true)
        txt_cyj:setVisible(false)
    end 
    local panel_jiangli=TFDirector:getChildByPath(panel, 'panel_jiangli')
    for k,v in ipairs(rewardll) do
        local reward_item =  Public:createIconNumNode(BaseDataManager:getReward(v));
        reward_item:setScale(0.7)
        reward_item:setAnchorPoint(ccp(0,0))
        reward_item:setPosition(ccp(92*(k-1),12))
        panel_jiangli:addChild(reward_item,1)
    end
end
function YanWuRewardLayer.numberOfCellsInTableView2(table)
    local self = table.logic
    return #(self.rewardList2)
end
function YanWuRewardLayer.tableCellAtIndex2(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_reward_model2:clone()
        node:setVisible(true)
        node:setPosition(ccp(45,0))
        cell:addChild(node)
        cell.panel = node
    end

    cell.index = idx + 1

    self:drawRewardNode2(cell, idx + 1)
    return cell
end

function YanWuRewardLayer:drawRewardNode2(cell, index)
    local panel = cell.panel
    if panel == nil then
        return
    end
    local info=self.rewardList2[index]
    local rewardll = {}    
    local rewardStr = stringToTable(info.award,"|")
    for i,v in ipairs(rewardStr) do
        local tbl = stringToNumberTable(v,"_")
        rewardll[i] = {type = tbl[1],itemId = tbl[2],number = tbl[3]}
    end
    local img_shunxu = TFDirector:getChildByPath(panel, 'img_shunxu')
    local txt_num = TFDirector:getChildByPath(panel, 'txt_num')
    local txt_cyj = TFDirector:getChildByPath(panel, 'txt_cyj')
    txt_cyj:setVisible(false)
    if info.min_rank <= 3 then
        img_shunxu:setTexture("ui_new/leaderboard/no"..info.min_rank..".png")
        img_shunxu:setPositionX(90)
        img_shunxu:setVisible(true)
        txt_num:setVisible(false)
    else
        txt_num:setText(stringUtils.format(localizable.arenarewardlayer_list,info.min_rank,info.max_rank))
        txt_num:setScale(0.8)
        txt_num:setPositionX(90)
        txt_num:setVisible(true)
        img_shunxu:setVisible(false)
    end 
    local panel_jiangli=TFDirector:getChildByPath(panel, 'panel_jiangli')
    for k,v in ipairs(rewardll) do
        local reward_item =  Public:createIconNumNode(BaseDataManager:getReward(v));
        reward_item:setScale(0.7)
        reward_item:setAnchorPoint(ccp(0,0))
        reward_item:setPosition(ccp(92*(k-1)+70,12))
        panel_jiangli:addChild(reward_item,1)
    end
end

function YanWuRewardLayer:removeUI()
    if self.panel_reward_model then
        self.panel_reward_model:release()
        self.panel_reward_model = nil
    end
    if self.panel_reward_model2 then
        self.panel_reward_model2:release()
        self.panel_reward_model2 = nil
    end
    self.super.removeUI(self)
end

function YanWuRewardLayer:onShow()
    self.super.onShow(self)
end

function YanWuRewardLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    self.tab_jpjl:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.refreshTab,self)))
    self.tab_shjl:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.refreshTab,self)))
end
function YanWuRewardLayer:refreshTab(sender)
    local self = sender.logic
    self.index  = sender.index
    self:refreshUI()
end
function YanWuRewardLayer:removeEvents()
    self.super.removeEvents(self)
end

return YanWuRewardLayer