
local GoldEggCheckColorRewardLayer = class("GoldEggCheckColorRewardLayer", BaseLayer)

local numOfCol = 6

function GoldEggCheckColorRewardLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.zadan.ZaDanCheck2")
end

function GoldEggCheckColorRewardLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.layer_list = TFDirector:getChildByPath(self, 'panel_neirong')
    local node = TFDirector:getChildByPath(self, 'panel_item')
    self.panel_daoju = TFDirector:getChildByPath(node, 'bg_icon')
    self.panel_daoju:setVisible(false)

    self.txtTips = TFDirector:getChildByPath(self, 'txt')

    node = TFDirector:getChildByPath(self, 'panel_tdj')
    self.panel_tdj = TFDirector:getChildByPath(node, 'bg_icon')
    self.btn_brush = TFDirector:getChildByPath(node, 'btn_sx')
    self.isPlayEffect = false
    self.panel_daoju:removeFromParentAndCleanup(false)
    self.panel_daoju:retain()
    self.eggInfo = GoldEggManager:getEggInfo(3)
    self:setRewardList()
end

function GoldEggCheckColorRewardLayer:setRewardList()
    self.rewardList = self.eggInfo.rewardList

    self.totalItem = self.rewardList:length()


    self.pageNum = math.ceil(self.totalItem / numOfCol)

    self.txtTips:setText(localizable.zadan_tipsTools)
    self:drawTDJ()
end

function GoldEggCheckColorRewardLayer:registerEvents()
    self.super.registerEvents(self)
    self.btn_brush:addMEListener(TFWIDGET_CLICK, audioClickfun(self.brushReward))
    self.btn_brush.logic = self

    self.onBrushTDJHandler = function(event)
        if event.data[1].isBrush == 1 then
            self:drawEggRewardList()
        end
        self:drawTDJ()
    end;
    TFDirector:addMEGlobalListener(GoldEggManager.FRESH_COLOR_EGG_TDJ ,self.onBrushTDJHandler)
end

function GoldEggCheckColorRewardLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(GoldEggManager.FRESH_COLOR_EGG_TDJ ,self.onBrushTDJHandler)
end

function GoldEggCheckColorRewardLayer.brushReward(sender)
    local self = sender.logic
    local costValue = self.eggInfo.brushCost
    local resValue = MainPlayer:getResValueByType(EnumDropType.SYCEE)

    if GoldEggManager.break_start_cost_tip == true or costValue <= 0 then
        if resValue < costValue then
            toastMessage(localizable.common_your_yuanbao)
        else
            self.isPlayEffect = true
            GoldEggManager:RequestBrushTDJ()
        end
        return
    end
    
    local str = stringUtils.format(localizable.goldEggMain_brush_tdj,costValue)
    CommonManager:showOperateSureTipLayer(
        function(data, widget)
            if resValue < costValue then
               toastMessage(localizable.common_your_yuanbao)
            else
                self.isPlayEffect = true
                GoldEggManager:RequestBrushTDJ()
            end
            GoldEggManager.break_start_cost_tip = widget:getSelectedState() or false;
        end,
        function(data, widget)
            AlertManager:close()
            GoldEggManager.break_start_cost_tip = widget:getSelectedState() or false;
        end,
        {
            title = localizable.common_tips,
            msg = str,
        }
    )
    
end

function GoldEggCheckColorRewardLayer:addEffect(node)
    if self.isPlayEffect ~= true then
        return
    end
    local filePath = "effect/ui/gamble_stone.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(filePath)
    local effect = TFArmature:create("gamble_stone_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)
    local contentSize = node:getContentSize()
    effect:setPosition(ccp(contentSize.width * 0.5,contentSize.height * 0.5))
    effect:setZOrder(10)
    node:addChild(effect)

    effect:addMEListener(TFARMATURE_COMPLETE, function ()
        effect:removeFromParent()
        effect = nil
    end)
end

function GoldEggCheckColorRewardLayer:removeUI()
    self.panel_daoju:release()
    self.super.removeUI(self)

end

function GoldEggCheckColorRewardLayer:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function GoldEggCheckColorRewardLayer:dispose()
    self.super.dispose(self)
end

function GoldEggCheckColorRewardLayer:refreshUI()
    self:drawEggRewardList()
end


function GoldEggCheckColorRewardLayer:drawEggRewardList()
    if self.tableView ~= nil then
        self.tableView:reloadData()
        return
    end

    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.layer_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableView:setPosition(self.layer_list:getPosition())
    self.tableView = tableView
    self.tableView.logic = self

    local function numberOfCellsInTableView(table)
        return self.pageNum
    end

    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, numberOfCellsInTableView)
    tableView:reloadData()

    self.layer_list:getParent():addChild(self.tableView,1)


    -- if self.pageNum > 2 then
    --      self.tableView:setContentOffset(ccp(0, -60));
    -- end
end

function GoldEggCheckColorRewardLayer.cellSizeForTable(table,idx)
    return 125,716
end

function GoldEggCheckColorRewardLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic

    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        for i=1,numOfCol do
            local node = self.panel_daoju:clone()
            node:setVisible(true)
            node:setPosition(ccp((i-1)*120 + 3, 0))
            cell:addChild(node,10);
            node:setTag(100+i)
            node:setScale(0.8)
        end
    end


    --绘制每个节点
    for i=1,numOfCol do
        local node = cell:getChildByTag(100+i)

        local index = idx * numOfCol + i

        node:setVisible(true)
        if index > self.totalItem then
            node:setVisible(false)
        else
            self:drawReward(node, index)
        end
    end

    return cell
end

function GoldEggCheckColorRewardLayer:drawReward(node, index)
    local rewardItem = self.rewardList:objectAt(index)

    local img_icon  = TFDirector:getChildByPath(node, 'img_icon');
    local txt_num   = TFDirector:getChildByPath(node, 'txt_num');
    local bg_icon   = TFDirector:getChildByPath(node, 'bg_icon');

    if bg_icon then
        bg_icon:setTextureNormal(GetColorIconByQuality(rewardItem.quality));
        function onClick( sender )
            Public:ShowItemTipLayer(rewardItem.itemid, rewardItem.type);
        end
        bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
    end
    if img_icon then
        img_icon:setTexture(rewardItem.path);
        Public:addPieceImg(img_icon,rewardItem,nil,1.0);
    end
    if txt_num then
        txt_num:setText(rewardItem.number);
        if rewardItem.number < 2 then
            txt_num:setVisible(false);
        else
            txt_num:setVisible(true);
        end
    end

    local img_yhd = TFDirector:getChildByPath(node, 'img_yhd')
    --print("rewardItem = ",rewardItem)
    if GoldEggManager:IsRewardGot(rewardItem) == true then
        img_yhd:setVisible(true)
    else
        img_yhd:setVisible(false)
    end
end

function GoldEggCheckColorRewardLayer:drawTDJ()
    local rewardItem = self.eggInfo.rewardSpecial
    local img_icon  = TFDirector:getChildByPath(self.panel_tdj, 'img_icon');
    local txt_num   = TFDirector:getChildByPath(self.panel_tdj, 'txt_num');
    local bg_icon   = TFDirector:getChildByPath(self.panel_tdj, 'bg_icon');
    self:addEffect(bg_icon)
    if bg_icon then
        bg_icon:setTextureNormal(GetColorIconByQuality(rewardItem.quality));
        function onClick( sender )
            Public:ShowItemTipLayer(rewardItem.itemid, rewardItem.type);
        end
        bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
    end
    if img_icon then
        img_icon:setTexture(rewardItem.path);
        Public:addPieceImg(img_icon,rewardItem,nil,1.0);
    end
    if txt_num then
        txt_num:setText(rewardItem.number);
        if rewardItem.number < 2 then
            txt_num:setVisible(false);
        else
            txt_num:setVisible(true);
        end
    end
end 

return GoldEggCheckColorRewardLayer