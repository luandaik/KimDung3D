-- client side TianJiLunLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-07-22


local TianJiLunLayer = class("TianJiLunLayer", BaseLayer)


function TianJiLunLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.tianjilun.TianJiLunMain")

    self.bTurning = false
    self.firstShow = true
end

function TianJiLunLayer:initUI(ui)
    self.super.initUI(self, ui)
    
    self.btn_close = TFDirector:getChildByPath(ui, "btn_fanhui")

    self.btn_begin = TFDirector:getChildByPath(ui, "btn_lagan")
    self.btn_begin:setTouchEnabled(false)
    self.btn_help = TFDirector:getChildByPath(ui, "btn_help")
    ----------------------------------------------------------------------------
    self.panel_daoju = {}
    for i = 1, 3 do
        local panel = TFDirector:getChildByPath(ui, "panel_daoju" .. i)
        self.panel_daoju[i] = {}
        self.panel_daoju[i].panel = panel
        self.panel_daoju[i].ItemList = {}
        for j=1,4 do
            local item = TFDirector:getChildByPath(panel, "item" .. j)
            self.panel_daoju[i].ItemList[j] = item
        end
    end
    self.Dis_Pos = self.panel_daoju[1].ItemList[2]:getPositionY()
    self.PER_SIZE = self.panel_daoju[1].ItemList[2]:getPositionY() - self.panel_daoju[1].ItemList[1]:getPositionY()
    self.Min_Pos = self.panel_daoju[1].ItemList[1]:getPositionY() - self.PER_SIZE

    self.item_model = self.panel_daoju[1].ItemList[4]
    self.item_model:setVisible(false)
    self.item_model:removeFromParent()
    self.item_model:retain()
    -------------------------------------------------------------------------------
    self.Panel_Paihang = TFDirector:getChildByPath(ui, 'Panel_Paihang')
    self.Panel_Paihang:setVisible(true)
    self.img_di = TFDirector:getChildByPath(self.Panel_Paihang, 'img_di')
    self.btn_jifen = TFDirector:getChildByPath(self.Panel_Paihang, 'btn_jifen')
    self.btn_shuaxin = TFDirector:getChildByPath(self.Panel_Paihang, 'btn_shuaxin')
    local panel_rank = TFDirector:getChildByPath(self.Panel_Paihang, 'panel_rank')
    self.panel_rank_model = TFDirector:getChildByPath(self.Panel_Paihang, 'panel_rank_2')
    self.panel_gun = TFDirector:getChildByPath(self.Panel_Paihang, 'panel_gun')

    panel_rank:removeFromParent(true)
    self.panel_rank_model:retain()
    self.panel_rank_model:removeFromParent(true)
    self.panel_rank_model:setVisible(false)
    self.img_di:setPositionX(0)
    self.rankLayer_show = false
    TianJiLunManager:requestRankList()
    --------------------------------------------------------------------------------
    self.img_light1 = TFDirector:getChildByPath(ui, 'img_light1')
    self.img_light2 = TFDirector:getChildByPath(ui, 'img_light2')
    --------------------------------------------------------------------------------
    local img_jiangchi = TFDirector:getChildByPath(ui, 'img_jiangchi')
    self.txt_jackpot = TFDirector:getChildByPath(img_jiangchi, 'txt_num')
    --------------------------------------------------------------------------------
    self.panel_teshu = TFDirector:getChildByPath(ui, 'panel_teshu')
    self.panel_teshu_model_1 = TFDirector:getChildByPath(ui, 'panel_teshu1')
    self.panel_teshu_model_1:setPosition(ccp(44,-15))
    self.panel_teshu_model_1:removeFromParent(true)
    self.panel_teshu_model_1:retain()

    self.panel_teshu_model_2 = TFDirector:getChildByPath(ui, 'panel_teshu2')
    self.panel_teshu_model_2:setPosition(ccp(9,-25))
    self.panel_teshu_model_2:removeFromParent(true)
    self.panel_teshu_model_2:retain()
    --------------------------------------------------------------------------------
    self.panel_gubi1 = TFDirector:getChildByPath(ui, 'panel_gubi1')
    self.panel_gubi2 = TFDirector:getChildByPath(ui, 'panel_gubi2')
    local resPath = "effect/tianjilun.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    self.tCoinNode = {{},{}}
    for i=1,2 do
        local panel = self[ "panel_gubi" .. i ]
        self.tCoinNode[i].panel = panel
        self.tCoinNode[i].btn_gubi = TFDirector:getChildByPath(panel, 'btn_gubi' .. i)
        self.tCoinNode[i].btn_gubi.idx = i
        self.tCoinNode[i].txt_jiangli = TFDirector:getChildByPath(panel, 'txt_jiangli')
        self.tCoinNode[i].txt_num = TFDirector:getChildByPath(panel, 'txt_num')
        self.tCoinNode[i].txt_jifen = TFDirector:getChildByPath(panel, 'txt_jifen')
        self.tCoinNode[i].txt_goumai = TFDirector:getChildByPath(panel, 'txt_goumai')

        self.tCoinNode[i].effect = TFArmature:create("tianjilun_anim")
        local pos = self.tCoinNode[i].btn_gubi:getPosition()
        self.tCoinNode[i].effect:setPosition(pos)
        self.tCoinNode[i].effect:playByIndex(i-1,-1,-1,1)
        panel:addChild(self.tCoinNode[i].effect,10)
    end
    --------------------------------------------------------------------------------
    self.panel_msg = TFDirector:getChildByPath(ui, 'panel_dt')
    self.panel_msg_model = TFDirector:getChildByPath(self.panel_msg, 'panel_cell')
    self.panel_msg_model:setPosition(ccp(0,0))
    self.panel_msg_model:removeFromParent(true)
    self.panel_msg_model:retain()

    self.btn_server_msg = TFDirector:getChildByPath(ui, 'btn_quanfu')
    self.btn_my_msg = TFDirector:getChildByPath(ui, 'btn_wode')
    self:showPushMsg(1)
    --------------------------------------------------------------------------------
    resPath = "effect/tianjilun0.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    self.LaGanEffect = TFArmature:create("tianjilun0_anim")
    local img_wuzi = self.btn_begin:getParent()
    local pos = self.btn_begin:getPosition()
    local size = img_wuzi:getContentSize()
    pos = ccp(pos.x + size.width * 0.5,pos.y + size.height * 0.5)
    self.LaGanEffect:setPosition(pos)
    img_wuzi:addChild(self.LaGanEffect,10)
    self.LaGanEffect:addMEListener(TFARMATURE_COMPLETE,function()
        self.LaGanEffect:setVisible(false)
        self.btn_begin:setVisible(true)
        -- if self.bStoped == false then
            
        -- end
    end)
    self.LaGanEffect:setVisible(false)
    --------------------------------------------------------------------------------
    self.txt_time = TFDirector:getChildByPath(ui, 'txt_time')
    self.bNeedBrush = false
    self.bTurning = false
    self.bStoped = false
    self.isShowBigReward = false
    self.updateTimerID = nil
    self.end_timerID = nil
    self.stayTimerId = nil
    self.msgType = 1
    self.selectType = 0
    self:showCoinState(self.selectType)
    if self.selectType == 0 then
        --self.btn_begin:setTextureNormal('ui_new/tianjilun/img_ganzi3.png')
    end
    self.jackPotUpdateTimerID = TFDirector:addTimer(60000, -1, nil,
        function()
            TianJiLunManager:requestBrushJackPot()
    end)
    self:drawItem()
end

function TianJiLunLayer:onShow()
    self.super.onShow(self)
    if self.bNeedBrush == true then
        self.bNeedBrush = false
        self:drawItem()
    end
end

function TianJiLunLayer:registerEvents(ui)
    self.super.registerEvents(self)
    local function onStopClick( sender )
        if self.bTurning == true then
            self:StopAc()
        end
    end
    self.ui:setTouchEnabled(true)
    self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(onStopClick), 1)
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCloseClick), 1)
    self.btn_close.logic = self
    self.btn_begin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onStartClick), 1)
    self.btn_begin.logic = self
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRuleClick), 1)
    self.btn_help.logic = self
    self.btn_shuaxin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRefreshRankClik),1)
    self.btn_jifen:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onOpenRankClik),1)
    self.btn_jifen.logic = self
    for i=1,2 do
        self.tCoinNode[i].btn_gubi.logic = self
        self.tCoinNode[i].btn_gubi:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSelectTypeClick),1)
    end

    self.btn_server_msg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShowPushMsg),1)
    self.btn_server_msg.idx = 1
    self.btn_server_msg.logic = self
    self.btn_my_msg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShowPushMsg),1)
    self.btn_my_msg.idx = 2
    self.btn_my_msg.logic = self

    -----------------------------------------------------------------------------------------
    self.onTianJiLunInfoHandler = function(event)
        if self.bTurning == true then
            self.bNeedBrush = true
        else
            self:drawItem()
        end
    end;
    TFDirector:addMEGlobalListener(TianJiLunManager.RECEIVE_TIAN_JI_LUN_INFO ,self.onTianJiLunInfoHandler)

    self.onRankInfoHandler = function(event)
        self:refreshRankList()
    end;
    TFDirector:addMEGlobalListener(TianJiLunManager.RECEIVE_RANK_INFO ,self.onRankInfoHandler)

    self.onTianJiLunResultHandler = function(event)
        self.bTurning = true
        self.bStoped = false
        self.LaGanEffect:setVisible(true)
        self.LaGanEffect:playByIndex(0,-1,-1,0)
        self.btn_begin:setVisible(false)
        self:startTurning()
    end;
    TFDirector:addMEGlobalListener(TianJiLunManager.RECEIVE_TIAN_JI_LUN_RESULT ,self.onTianJiLunResultHandler)

    self.onBrushJackPotHandler = function(event)
        self:brushJackPot()
    end;
    TFDirector:addMEGlobalListener(TianJiLunManager.RECEIVE_BRUSH_JACK_POT ,self.onBrushJackPotHandler)

    self.onCoinInHandler = function(event)
        self.selectType = TianJiLunManager:getCoinInType()
        self:showCoinState(self.selectType)
        self:refreshExtraRewardList()
        TianJiLunManager:requestRankList()
    end;
    TFDirector:addMEGlobalListener(TianJiLunManager.RECEIVE_COIN_IN ,self.onCoinInHandler)

    self.onBrush_24Handler = function(event)
        if self.bTurning ~= true then
            self:showCoinState(self.selectType)
        end
    end;
    TFDirector:addMEGlobalListener(TianJiLunManager.RECEIVE_24_BRUSH ,self.onBrush_24Handler)

    self.onPushMsgHandler = function(event)
        if self.msgType == 2 and event.data[1].isMine == false then
            return
        end
        self:refreshPushMsgList()
    end;
    TFDirector:addMEGlobalListener(TianJiLunManager.RECEIVE_PUSH_MSG ,self.onPushMsgHandler)

    self.onBuyItemSuccessHandler = function(event)
        if self.bTurning ~= true then
            self:showCoinState(self.selectType)
        end
    end;
    TFDirector:addMEGlobalListener(MallManager.BuySuccessFromFixedStore ,self.onBuyItemSuccessHandler)
   
    ---------------------------------------------------------------------------------------
    local activity = OperationActivitiesManager:ActivityWithType(OperationActivitiesManager.Type_Tian_Ji_Lun)
    if activity then
        self.time = activity.endTime - MainPlayer:getNowtime()
        if self.time <= 0 then
            self.time = 0
        end
    end

    if  self.end_timerID == nil then
        self.end_timerID = TFDirector:addTimer(1000, -1, nil, 
        function() 
            if self.end_timerID ~= nil then
                self:showNextTimer()
            end
        end)
    end
end

function TianJiLunLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(TianJiLunManager.RECEIVE_TIAN_JI_LUN_INFO ,self.onTianJiLunInfoHandler)
    TFDirector:removeMEGlobalListener(TianJiLunManager.RECEIVE_RANK_INFO ,self.onRankInfoHandler)
    TFDirector:removeMEGlobalListener(TianJiLunManager.RECEIVE_TIAN_JI_LUN_RESULT ,self.onTianJiLunResultHandler)
    TFDirector:removeMEGlobalListener(TianJiLunManager.RECEIVE_BRUSH_JACK_POT ,self.onBrushJackPotHandler)
    TFDirector:removeMEGlobalListener(TianJiLunManager.RECEIVE_COIN_IN ,self.onCoinInHandler)
    TFDirector:removeMEGlobalListener(TianJiLunManager.RECEIVE_24_BRUSH ,self.onBrush_24Handler)
    TFDirector:removeMEGlobalListener(TianJiLunManager.RECEIVE_PUSH_MSG ,self.onPushMsgHandler)
    TFDirector:removeMEGlobalListener(MallManager.BuySuccessFromFixedStore ,self.onBuyItemSuccessHandler)
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end

    if self.end_timerID then
        TFDirector:removeTimer(self.end_timerID)
        self.end_timerID = nil
    end

    if self.jackPotUpdateTimerID then
        TFDirector:removeTimer(self.jackPotUpdateTimerID)
        self.jackPotUpdateTimerID = nil
    end

    if self.item_model then
        self.item_model:release()
        self.item_model = nil
    end

    if self.panel_rank_model then
        self.panel_rank_model:release()
        self.panel_rank_model = nil
    end

    if self.panel_teshu_model_1 then
        self.panel_teshu_model_1:release()
        self.panel_teshu_model_1 = nil
    end

    if self.panel_teshu_model_2 then
        self.panel_teshu_model_2:release()
        self.panel_teshu_model_2 = nil
    end

    if self.panel_msg_model then
        self.panel_msg_model:release()
        self.panel_msg_model = nil
    end
end

function TianJiLunLayer:drawItem()
    local itemList = TianJiLunManager:getItemList()
    self.max_row = #(itemList)
    self.Max_Pos = self.Min_Pos + self.max_row * self.PER_SIZE
    for i = 1, 3 do
        self.panel_daoju[i].panel:removeAllChildren()
        for j=1,self.max_row do
            local item = self.item_model:clone()
            item:setVisible(true)
            if i == 2 then
                item:setPositionY(self.Max_Pos - (j-1) * self.PER_SIZE)
            else
                item:setPositionY(self.Min_Pos + j * self.PER_SIZE)
            end
            local path = itemList[j].path
            item:setTexture(path)
            self.panel_daoju[i].panel:addChild(item)
            self.panel_daoju[i].ItemList[j] = item
        end
    end
    local itemID = {30164,30165}
    for i=1,2 do
        local coinInfo = TianJiLunManager:getCoinInfoByType(i)
        self.tCoinNode[i].txt_jiangli:setText(localizable.TianJiLun_jiangli_txt .. (coinInfo.multiple or 0))
        self.tCoinNode[i].txt_jifen:setText(localizable.TianJiLun_score_txt .. (coinInfo.score or 0))
        local indexStr = {'TianJiLunBuleCoin','TianJiLunPurpleCoin'}
        local number = ConstantData:objectByID(indexStr[i]).value
        local str = number .. ''
        if number > 10000 then
            str = stringUtils.format( localizable.fun_wan_desc, number / 10000 )
        end
        str = stringUtils.format( localizable.TianJiLun_coindes_txt, str )
        self.tCoinNode[i].txt_goumai:setText(str)
    end
    self:brushJackPot()
    self:refreshExtraRewardList()
end

function TianJiLunLayer.onRuleClick( sender )
    CommonManager:showRuleLyaer('tianjilun')
end

function TianJiLunLayer.onRefreshRankClik(sender)
    TianJiLunManager:requestRankList()
end

function TianJiLunLayer.onOpenRankClik(sender)
    local self = sender.logic
    if self.rank_tween ~= nil then
        TFDirector:killTween(self.rank_tween)
    end
    if self.rankLayer_show then
        self.rank_tween = {
            target = self.img_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = 0,
            },
        }
        self.rankLayer_show = false
    else
        self.rank_tween = {
            target = self.img_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = -228,
            },
        }
        self.rankLayer_show = true
    end
    TFDirector:toTween(self.rank_tween)
end

function TianJiLunLayer.onCloseClick(sender)
    local self = sender.logic
    AlertManager:close()
end

function TianJiLunLayer.onStartClick(sender)
    local self = sender.logic
    if self.bTurning == true then
        self:StopAc()
        return
    end
    if self.selectType and self.selectType <= 0 then
        toastMessage(localizable.TianJiLun_tip_suercoinin)
        return
    end
    local haveFree = {true,false}
    local itemID = {30164,30165}
    if self.selectType == 2 then
        local haveNum = BagManager:getItemNumById(itemID[2])
        if haveNum <= 0 then
            local shopInfo = MallManager:getShopByResId( itemID[2] )
            if shopInfo then
                MallManager:openShoppingLayer(shopInfo.id)
                return
            end
        end
    end
    if TianJiLunManager.break_start_cost_tip == true then
        TianJiLunManager:requestCoinIn(self.selectType)
        return
    end

    local indexStr = {'TianJiLunBuleCoin','TianJiLunPurpleCoin'}
    local number = ConstantData:objectByID(indexStr[self.selectType]).value
    local itemData = ItemData:objectByID(itemID[self.selectType])
        
    CommonManager:showOperateSureTipLayer(
        function(data, widget)
            TianJiLunManager:requestCoinIn(self.selectType)
            TianJiLunManager.break_start_cost_tip = widget:getSelectedState() or false;
        end,
        function(data, widget)
            AlertManager:close()
            TianJiLunManager.break_start_cost_tip = widget:getSelectedState() or false;
        end,
        {
            title=localizable.TreasureMain_tips1,
            msg=stringUtils.format(localizable.TianJiLun_tip_suerremain,itemData.name,number),
            showtype = AlertManager.BLOCK_AND_GRAY
        }
    )
    
    --TianJiLunManager:requestTianJiLunStart()
end

function TianJiLunLayer.onShowPushMsg( sender )
    local self = sender.logic
    local idx = sender.idx
    if self.msgType == idx then
        return
    end
    self:showPushMsg(idx)
end

function TianJiLunLayer.onSelectTypeClick( sender )
    local self = sender.logic
    local idx = sender.idx
    if self.bTurning == true then
        self:StopAc()
        return
    end
    local haveFree = {true,false}
    local itemID = {30164,30165}
    local freeNum = TianJiLunManager:getFreeTimes()
    local haveNum = BagManager:getItemNumById(itemID[idx])

    if haveNum <= 0 then
        if idx == 2 then
            local shopInfo = MallManager:getShopByResId( itemID[2] )
            if shopInfo then
                MallManager:openShoppingLayer(shopInfo.id)
                return
            end
        end
        if haveFree[idx] == false or freeNum <= 0 then
            local itemData = ItemData:objectByID(itemID[idx])
            toastMessage(stringUtils.format(localizable.smithyIntensify_not,itemData.name))
            return
        end
    end

    if TianJiLunManager.break_start_cost_tip == true then
        TianJiLunManager:requestCoinIn(idx)
        return
    end
    local itemID = {30164,30165}
    local indexStr = {'TianJiLunBuleCoin','TianJiLunPurpleCoin'}
    local number = ConstantData:objectByID(indexStr[idx]).value
    local itemData = ItemData:objectByID(itemID[idx])
        
    CommonManager:showOperateSureTipLayer(
        function(data, widget)
            TianJiLunManager:requestCoinIn(idx)
            TianJiLunManager.break_start_cost_tip = widget:getSelectedState() or false;
        end,
        function(data, widget)
            AlertManager:close()
            TianJiLunManager.break_start_cost_tip = widget:getSelectedState() or false;
        end,
        {
            title=localizable.TreasureMain_tips1,
            msg=stringUtils.format(localizable.TianJiLun_tip_suerremain,itemData.name,number),
            showtype = AlertManager.BLOCK_AND_GRAY
        }
    )
end

function TianJiLunLayer:showCoinState(idx)
    self.selectType = idx
    if idx == 0 then
        for i=1,2 do
            self.tCoinNode[ i ].effect:setVisible(true)
            self.tCoinNode[ i ].btn_gubi:setColor(ccc3(255,255,255))
            --self.tCoinNode[ i ].btn_gubi:setTouchEnabled(true)
        end
    else
        self.tCoinNode[idx].effect:setVisible(true)
        local idx0 = math.mod(idx,2) + 1
        self.tCoinNode[ idx0 ].effect:setVisible(false)
        self.tCoinNode[ idx0 ].btn_gubi:setColor(ccc3(128,128,128))
        --self.tCoinNode[ idx0 ].btn_gubi:setTouchEnabled(false)
        self.tCoinNode[ idx ].effect:setVisible(false)
        self.tCoinNode[ idx ].btn_gubi:setColor(ccc3(255,255,255))
        --self.tCoinNode[ idx ].btn_gubi:setTouchEnabled(true)
    end
    --self.btn_begin:setTextureNormal('ui_new/tianjilun/img_ganzi1.png')
    local haveFree = {true,false}
    local itemID = {30164,30165}
    for i=1,2 do
        local freeNum = TianJiLunManager:getFreeTimes()
        if haveFree[i] == true and freeNum > 0 then
            self.tCoinNode[i].txt_num:setText(localizable.TianJiLun_free_num_txt .. freeNum)
        else
            local haveNum = BagManager:getItemNumById(itemID[i])
            self.tCoinNode[i].txt_num:setText(stringUtils.format(localizable.TianJiLun_have_num_txt,haveNum))
        end
    end
    CommonManager:updateRedPoint(self.tCoinNode[ 1 ].effect, TianJiLunManager:checkRedPoint(),ccp(-10,-20))
end


function TianJiLunLayer:refreshUI()
    
end

function TianJiLunLayer:brushJackPot()
    self.txt_jackpot:setText(TianJiLunManager:getJackPot() .. '')
end

----------------------------------------------------------------

function TianJiLunLayer:refreshRankList()
    if self.rank_tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_gun:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)


        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, TianJiLunLayer.rank_cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, TianJiLunLayer.rank_tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, TianJiLunLayer.rank_numberOfCellsInTableView)
        self.rank_tableView = tableView
        self.rank_tableView.logic = self
        self.panel_gun:addChild(tableView)
    end
    self.rank_tableView:reloadData()

    local txt_paiming = TFDirector:getChildByPath(self.img_di, 'txt_paiming')
    local rank_txt = TFDirector:getChildByPath(txt_paiming, 'txt_num')
    local txt_jifen = TFDirector:getChildByPath(self.img_di, 'txt_jifen')
    local txt_score = TFDirector:getChildByPath(txt_jifen, 'txt_num')
    local myRank = TianJiLunManager:getMyRankInfo()
    if myRank.rank > 0 and myRank.rank <= 50 then
        rank_txt:setText(myRank.rank .. '')
    else
        rank_txt:setText(localizable.shalu_info_txt1)
    end
    txt_score:setText(myRank.score)
end

function TianJiLunLayer.rank_cellSizeForTable(table,idx)
    local self = table.logic
    return 60,190
end

function TianJiLunLayer.rank_numberOfCellsInTableView(table)
    return TianJiLunManager.rankList:length()
end

function TianJiLunLayer.rank_tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    if nil == cell then
        cell = TFTableViewCell:create()
        local panel_rank = nil
        panel_rank = self.panel_rank_model:clone()
        panel_rank:setVisible(true)
        panel_rank:setPosition(ccp(0,0))
        cell:addChild(panel_rank)
        cell.panel_rank = panel_rank
    end
    local rankInfo = TianJiLunManager.rankList:getObjectAt(idx+1)
    if rankInfo then
        self:loadRankInfo( rankInfo , cell.panel_rank )
    else
        cell.panel_rank:setVisible(false)
    end
    return cell
end

function TianJiLunLayer:loadRankInfo( rankInfo , panel )
    panel:setVisible(true)
    local txt_name = TFDirector:getChildByPath(panel, 'txt_name')
    local txt_num = TFDirector:getChildByPath(panel, 'txt_num')
    local txt_xuhao = TFDirector:getChildByPath(panel, 'txt_xuhao')
    txt_name:setText(rankInfo.name)
    txt_num:setText(rankInfo.score)
    txt_xuhao:setText(rankInfo.rank)
end

----------------------------------------------------------------

function TianJiLunLayer:refreshExtraRewardList()
    if self.extra_tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_teshu:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)


        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, TianJiLunLayer.extra_cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, TianJiLunLayer.extra_tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, TianJiLunLayer.extra_numberOfCellsInTableView)
        self.extra_tableView = tableView
        self.extra_tableView.logic = self
        self.panel_teshu:addChild(tableView)
    end
    self.extra_tableView:reloadData()
end

function TianJiLunLayer.extra_cellSizeForTable(table,idx)
    local self = table.logic
    local extraInfo = TianJiLunManager:getExtraRewardInfoByIdx(idx+1)
    if extraInfo.type == TianJiLunManager.Reward_Type_t then
        return 84,300
    else
        return 68,300
    end
end

function TianJiLunLayer.extra_numberOfCellsInTableView(table)
    return TianJiLunManager:getExtraRewardSize()
end

function TianJiLunLayer.extra_tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    if nil == cell then
        cell = TFTableViewCell:create()
    end
    local extraInfo = TianJiLunManager:getExtraRewardInfoByIdx(idx+1)
    if extraInfo then
        self:loadExtraRewardInfo( extraInfo , cell ,idx + 1 )
    else
        if cell.panel_item_1 then
            cell.panel_item_1:setVisible(false)
        end
        if cell.panel_item_2 then
            cell.panel_item_2:setVisible(false)
        end
    end
    return cell
end

function TianJiLunLayer:loadExtraRewardInfo( extraInfo , cell , idx )
    local panel_item = nil
    if extraInfo.type == TianJiLunManager.Reward_Type_t then
        panel_item = cell.panel_item_1
        if panel_item == nil then
            panel_item = self.panel_teshu_model_1:clone()
            cell:addChild(panel_item)
            cell.panel_item_1 = panel_item
        end
        if cell.panel_item_2 then
            cell.panel_item_2:setVisible(false)
        end
        extraInfo.reward.number = TianJiLunManager:getJackPot()
    else
        panel_item = cell.panel_item_2
        if panel_item == nil then
            panel_item = self.panel_teshu_model_2:clone()
            cell:addChild(panel_item)
            cell.panel_item_2 = panel_item
        end
        if cell.panel_item_1 then
            cell.panel_item_1:setVisible(false)
        end
    end
    panel_item:setVisible(true)
    local img_item = {}
    img_item[1] = TFDirector:getChildByPath(panel_item, 'img_item1')
    img_item[2] = TFDirector:getChildByPath(panel_item, 'img_item2')
    img_item[3] = TFDirector:getChildByPath(panel_item, 'img_item3')
    local panel_list = TFDirector:getChildByPath(panel_item, 'panel_list')
    local img_x = TFDirector:getChildByPath(panel_item, 'img_x')
    local panel_icon = TFDirector:getChildByPath(panel_item, 'panel_icon')
    --img_x:setVisible(false)
    if idx == 1 or self.selectType <= 0 then
        img_x:setVisible(false)
    else
        img_x:setVisible(true)
        local coinInfo = TianJiLunManager:getCoinInfoByType(self.selectType)
        local txt_num_x = TFDirector:getChildByPath(img_x, 'txt_num')
        txt_num_x:setText(coinInfo.multiple)
    end
    local size = #(extraInfo.result)
    for i=1,3 - size do
        img_item[i]:setVisible(false)
    end
    for i= 1,size do
        local idx = 3 - size + i
        img_item[ idx ]:setVisible(true)
        local path = extraInfo.result[i].path
        img_item[ idx ]:setTexture(path)
    end
    if extraInfo.reward.type ~= EnumDropType.GOODS and
       extraInfo.reward.type ~= EnumDropType.ROLE and
       extraInfo.reward.type ~= EnumDropType.BIBLE then
        panel_list:setVisible(false)
        panel_icon:setVisible(true)
        local img_icon = TFDirector:getChildByPath(panel_icon, 'img_icon')
        img_icon:setTouchEnabled(true)
        function onClick( sender )
          Public:ShowItemTipLayer(extraInfo.reward.itemid, extraInfo.reward.type);
        end
        img_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
        local txt_num = TFDirector:getChildByPath(panel_icon, 'txt_num')
        img_icon:setTexture(extraInfo.reward.path)
        txt_num:setText('X' .. extraInfo.reward.number)
    else
        panel_list:setVisible(true)
        panel_icon:setVisible(false)
        local bg_icon = TFDirector:getChildByPath(panel_list, 'bg_icon')
        local img_icon = TFDirector:getChildByPath(bg_icon, 'img_icon')
        local txt_num = TFDirector:getChildByPath(bg_icon, 'txt_num')
        img_icon:setTexture(extraInfo.reward.path)
        Public:addPieceImg(img_icon,extraInfo.reward,nil,1)
        txt_num:setText(extraInfo.reward.number .. '')
        bg_icon:setTexture(GetColorIconByQuality(extraInfo.reward.quality))

        bg_icon:setTouchEnabled(true)
        function onClick( sender )
          Public:ShowItemTipLayer(extraInfo.reward.itemid, extraInfo.reward.type);
        end
        bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
    end
end

----------------------------------------------------------------
function TianJiLunLayer:showPushMsg( msgType )
    if msgType == self.msgType then
        return
    end
    self.msgType = msgType
    local serverPath = {'ui_new/tianjilun/tab_quanfu_h.png','ui_new/tianjilun/tab_quanfu.png'}
    local myPath = {'ui_new/tianjilun/tab_wode_h.png','ui_new/tianjilun/tab_wode.png'}
    if msgType == 1 then
        self.btn_server_msg:setTextureNormal(serverPath[1])
        self.btn_my_msg:setTextureNormal(myPath[2])
    elseif msgType == 2 then
        self.btn_server_msg:setTextureNormal(serverPath[2])
        self.btn_my_msg:setTextureNormal(myPath[1])
    end
    self:refreshPushMsgList()
end

function TianJiLunLayer:refreshPushMsgList()
    if self.msg_tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_msg:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)


        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, TianJiLunLayer.msg_cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, TianJiLunLayer.msg_tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, TianJiLunLayer.msg_numberOfCellsInTableView)
        self.msg_tableView = tableView
        self.msg_tableView.logic = self
        self.panel_msg:addChild(tableView)
    end
    self.msg_tableView:reloadData()
end

function TianJiLunLayer.msg_cellSizeForTable(table,idx)
    return 28,500
end

function TianJiLunLayer.msg_numberOfCellsInTableView(table)
    local self = table.logic
    return TianJiLunManager:getMsgSizeByType(self.msgType)
end

function TianJiLunLayer.msg_tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    if nil == cell then
        cell = TFTableViewCell:create()
        local panel_cell = nil
        panel_cell = self.panel_msg_model:clone()
        panel_cell:setVisible(true)
        cell:addChild(panel_cell)
        cell.panel_cell = panel_cell
    end
    local msgList = TianJiLunManager:getMsgByType(self.msgType)

    if self.msgType == 1 then
        self:loadServerMsgInfo( msgList[idx + 1] , cell.panel_cell ,idx + 1 )
    else
        self:loadMyMsgInfo( msgList[idx + 1] , cell.panel_cell ,idx + 1 )
    end
    return cell
end

function TianJiLunLayer:loadMyMsgInfo(msgInfo,panel_cell,idx )
    local txt_dt = TFDirector:getChildByPath(panel_cell, 'txt_dt')
    local txt_reward = TFDirector:getChildByPath(panel_cell, 'txt_reward')
    local txt_name = TFDirector:getChildByPath(panel_cell, 'txt_name')
    txt_name:setText("")

    local rewardItem = BaseDataManager:getReward(msgInfo.reward)
    if msgInfo.rewardType ~= 3 then
        txt_dt:setText(localizable.TianJiLun_msg_txt1)
        txt_dt:setPositionX(0)
        local str = rewardItem.name .. "x"
        if rewardItem.number >= 100000 then
            str = str .. stringUtils.format(localizable.fun_wan_desc,math.floor(rewardItem.number/10000))
        else
            str = str .. rewardItem.number
        end
        txt_reward:setText(str)
        local posX = txt_dt:getContentSize().width
        txt_reward:setPositionX(posX)
        txt_reward:setColor(GetColorByQuality(rewardItem.quality))
    else
        txt_dt:setText("")
        local str = stringUtils.format(localizable.TianJiLun_msg_txt4,rewardItem.number)
        txt_reward:setText(str)
        txt_reward:setPositionX(0)
        txt_reward:setColor(GetColorByQuality(rewardItem.quality))
    end
end

function TianJiLunLayer:loadServerMsgInfo(msgInfo,panel_cell,idx )
    local txt_dt = TFDirector:getChildByPath(panel_cell, 'txt_dt')
    local txt_reward = TFDirector:getChildByPath(panel_cell, 'txt_reward')
    local txt_name = TFDirector:getChildByPath(panel_cell, 'txt_name')
    local serverId = math.mod(msgInfo.serverId,1000)
    if serverId == 0 then
        txt_name:setText(msgInfo.playerName)
    else
        txt_name:setText("S" .. serverId .. "." .. msgInfo.playerName)
    end
    local rewardItem = BaseDataManager:getReward(msgInfo.reward)
    if msgInfo.rewardType ~= 3 then
        txt_dt:setText(localizable.TianJiLun_msg_txt2)

        local str = rewardItem.name .. "x"
        if rewardItem.number >= 100000 then
            str = str .. stringUtils.format(localizable.fun_wan_desc,math.floor(rewardItem.number/10000))
        else
            str = str .. rewardItem.number
        end
        txt_reward:setText(str)
        local posX = txt_name:getContentSize().width
        txt_dt:setPositionX(posX)
        posX = posX + txt_dt:getContentSize().width
        txt_reward:setPositionX(posX)
        txt_reward:setColor(GetColorByQuality(rewardItem.quality))
    else
        txt_dt:setText("")
        local str = stringUtils.format(localizable.TianJiLun_msg_txt3,rewardItem.number)
        txt_reward:setText(str)
        local posX = txt_name:getContentSize().width
        txt_reward:setPositionX(posX)
        txt_reward:setColor(GetColorByQuality(rewardItem.quality))
    end
end

----------------------------------------------------------------

function TianJiLunLayer:showNextTimer()
    self.time = self.time - 1
    if self.time <=  0 then
        if self.end_timerID then
            TFDirector:removeTimer(self.end_timerID)
            self.end_timerID = nil
        end
        toastMessage(localizable.treasureMain_tiemout)
        AlertManager:close()
    end    
    local timeCount = self.time
    local secInOneDay  = 24 * 3600
    local day = math.floor(timeCount/secInOneDay)
    local sec   = timeCount - secInOneDay * day
    local time1 = math.floor(sec/3600)
    local time2 = math.floor((sec-time1 * 3600)/60)
    local time3 = math.fmod(sec, 60)
    local timedesc1 = stringUtils.format(localizable.common_time_5, day, time1, time2, time3)
    self.txt_time:setText(timedesc1)
end

----------------------------------------------------------------

function TianJiLunLayer:stayAc()
    if self.updateTimerID or self.stayTimerId then
        return
    end
    self.stayTimerId = TFDirector:addTimer(30, -1, nil,
        function()
            for i=1,3 do
                self:doStayAc(i)
            end
    end)
end

function TianJiLunLayer:doStayAc( idx )
    -- body
end

function TianJiLunLayer:StopAc()
    if self.isShowBigReward == true then
        return
    end

    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    if self.bTurning == false then
        return
    end
    self.ui:stopAnimation("Action0")
    self:endTurning()
    self.selectType = 0
    self:showCoinState(self.selectType)
    self:refreshExtraRewardList()
    self.bTurning = false
    self.bStoped = true
    self.img_light1:setVisible(false)
    self.img_light2:setVisible(false)
end

--开始转转盘
function TianJiLunLayer:startTurning()
    self.isOver = false
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self:reSetAcPanelState()
    self.updateTimerID = TFDirector:addTimer(30, -1, nil,
        function()
            if self.delayAc > 0 then
                self.delayAc = self.delayAc - 30
                return
            end
            for i=1,3 do
                self:doAction(i)
            end
            
    end)
end

function TianJiLunLayer:reSetAcPanelState()
    self.rewardIdx = TianJiLunManager:getResultIndex()
    print('self.rewardIdx = ',self.rewardIdx)
    for i=1,3 do
        self.panel_daoju[i].suDistance = 100         -- 加速冲刺距离
        self.panel_daoju[i].speed = 0
        self.panel_daoju[i].slowDistance = nil
        self.panel_daoju[i].slowDistance0 = 0
        self.panel_daoju[i].isOver = false
        self.panel_daoju[i].speedLow = 11

        self.panel_daoju[i].speedHigh = 28 -- - ( 3 - i) * 10 
        for j=1,self.max_row do
            local posY = self.panel_daoju[i].ItemList[j]:getPositionY()
            self.panel_daoju[i].ItemList[j].pos = posY
        end
    end
    self.delayAc = 300
    self.bSpeedSlow = false
end

function TianJiLunLayer:doAction(idx)
    local allover = true
    for i=1,3 do
        if self.panel_daoju[i].isOver == false then
            allover = false
            break
        end
    end
    if allover == true then
        if TianJiLunManager:getResultType() == TianJiLunManager.Reward_Type_t then
            if self.updateTimerID then
                TFDirector:removeTimer(self.updateTimerID)
                self.updateTimerID = nil
            end
            self.isShowBigReward = true
            self.ui:setAnimationCallBack("Action0", TFANIMATION_END, function()
                self.isShowBigReward = false
                self:StopAc()
            end)
            self.ui:runAnimation("Action0", 1);
            return
        end
        self:StopAc()
        return
    end

    local panel_item = self.panel_daoju[idx]
    
    if panel_item.isOver == true then
        return
    end
    local s = 0
    if self.bSpeedSlow == true then
        panel_item.suDistance = 0
    end
    if panel_item.suDistance > 0 then
        -- start and speed up to high
        panel_item.speed = panel_item.speedHigh
        s = panel_item.speed
        panel_item.suDistance = panel_item.suDistance - panel_item.speed
    else
        self.bSpeedSlow = true
        if panel_item.slowDistance == nil then
            local disIdx = self.rewardIdx[idx]
            local curPos = panel_item.ItemList[disIdx].pos

            panel_item.slowDistance = curPos - self.Dis_Pos  + (0 + idx)  * self.max_row * self.PER_SIZE + 44

            panel_item.slowDistance0 = 44
        end
        if panel_item.slowDistance and panel_item.slowDistance > 0 then
            -- speed down to low 
            panel_item.speed = panel_item.speedHigh
            s = panel_item.speed

            panel_item.slowDistance = panel_item.slowDistance - s
            if panel_item.slowDistance <= 0 then
                s = panel_item.slowDistance + s
                panel_item.slowDistance = 0
            end
        else
            panel_item.speed = - panel_item.speedLow
            if panel_item.slowDistance0 and panel_item.slowDistance0 > 0 then
                s = panel_item.speed
                panel_item.slowDistance0 = panel_item.slowDistance0 - (-s)
                if panel_item.slowDistance0 <= 0 then
                    s = (panel_item.slowDistance0 + (-s)) * -1
                    panel_item.slowDistance0 = 0
                end

            else
                panel_item.isOver = true
            end
        end

    end

    for i=1,self.max_row do
        panel_item.ItemList[i].pos = panel_item.ItemList[i].pos - s
        if panel_item.ItemList[i].pos < self.Min_Pos then
            panel_item.ItemList[i].pos = self.Max_Pos + panel_item.ItemList[i].pos - self.Min_Pos
        end
        panel_item.ItemList[i]:setPositionY(panel_item.ItemList[i].pos)
    end
    if panel_item.isOver == true then
        local disIdx = self.rewardIdx[idx]
        for i=1,self.max_row do
            local distance = disIdx - 2
            if idx == 2 then
                distance = disIdx - (self.max_row - 2 + 1)
            end
            local idx0 = math.mod(i - distance + self.max_row,self.max_row)
            if idx0 == 0 then
                idx0 = self.max_row
            end
            if idx == 2 then
                idx0 = self.max_row - idx0 + 1
            end
            local pos =  idx0  *  self.PER_SIZE + self.Min_Pos
            panel_item.ItemList[i]:setPositionY(pos)
        end
    end
end

function TianJiLunLayer:endTurning()
    
    for i=1,3 do
        local disIdx = self.rewardIdx[i]
        for j=1,self.max_row do
            local distance = disIdx - 2
            if i == 2 then
                distance = disIdx - (self.max_row - 2 + 1)
            end
            local idx0 = math.mod(j - distance + self.max_row,self.max_row)
            if idx0 == 0 then
                idx0 = self.max_row
            end
            if i == 2 then
                idx0 = self.max_row - idx0 + 1
            end
            local pos =  idx0  *  self.PER_SIZE + self.Min_Pos
            self.panel_daoju[i].ItemList[j]:setPositionY(pos)
        end
    end
    self:showReward()
end

function TianJiLunLayer:showReward()
    local tReward = TianJiLunManager:getReward() or {}
    local rewardList = TFArray:new()
    for i = 1, #tReward do
        local item = BaseDataManager:getReward(tReward[i])
        item.multiple = tReward[i].multiple
        rewardList:push(item)
    end
    RewardManager:showRewardListLayer( rewardList )
end

return TianJiLunLayer