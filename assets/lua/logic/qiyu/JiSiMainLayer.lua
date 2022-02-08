
local JiSiMainLayer = class("JiSiMainLayer", BaseLayer)
local column = 8
local MaxNum = 60
function JiSiMainLayer:ctor()
    self.super.ctor(self)
    self.getItemNum  = 0
    self:init("lua.uiconfig_mango_new.qiyu.JisiLayer")
    -- QiyuManager:SengQueryEatPigMsg()
end

function JiSiMainLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();
end

function JiSiMainLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.jiSi,{HeadResType.SPECIAL_QI,HeadResType.SYCEE})

    self.Panel_baoshi = TFDirector:getChildByPath(ui, 'Panel_baoshi')
    self.btn_yjjs = TFDirector:getChildByPath(ui, 'btn_yjjs')
    self.btn_yjts = TFDirector:getChildByPath(ui, 'btn_yjts')
    self.btn_qbsq = TFDirector:getChildByPath(ui, 'btn_qbsq')
    self.btn_zhenxuan = TFDirector:getChildByPath(ui, 'btn_zhenxuan')
    self.btn_help = TFDirector:getChildByPath(ui, 'btn_help')
    self.btn_mrlq = TFDirector:getChildByPath(ui, 'btn_mrlq')
    self.btn_tmbb = TFDirector:getChildByPath(ui, 'btn_tmbb')
    self.btn_JiSi = {}
    self.txt_cost = {}
    self.img_res_icon = {}
    self.img_sl = {}
    self.img_js = {}
    for i=1,JiSiManager.JiSiMaxLevel do
        self.btn_JiSi[i] = TFDirector:getChildByPath(ui, 'btn_'..i)
        local img_res_bg = TFDirector:getChildByPath(ui, 'img_res_bg'..i)
        self.txt_cost[i] = TFDirector:getChildByPath(img_res_bg, 'txt_price')
        self.img_res_icon[i] = TFDirector:getChildByPath(img_res_bg, 'img_res_icon')
        self.img_js[i] = TFDirector:getChildByPath(img_res_bg, 'img_js')
        self.img_sl[i] = TFDirector:getChildByPath(img_res_bg, 'img_sl')
        if self.img_js[i] then
            self.img_js[i]:setVisible(false)
        end
    end

    self.bagItem_panel = createUIByLuaNew("lua.uiconfig_mango_new.qiyu.JisiIcon")
    self.bagItem_panel:retain() 
    self.btnVisible = false
    self:refreshBagView()
    self:refreshButtoState()
    self.btn_check = TFDirector:getChildByPath(ui, 'btn_check')
    self.type = false
    self.againtype =  false
end
function JiSiMainLayer:registerEvents(ui)
    self.super.registerEvents(self)

    for i=1,JiSiManager.JiSiMaxLevel do
        self.btn_JiSi[i].tag = i
        self.btn_JiSi[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.JiSiBtnClickHandle),1)
    end
    self.btn_zhenxuan.logic =self
    self.btn_yjjs.logic = self
    self.btn_zhenxuan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.zhenxuanBtnClickHandle),1)
    self.btn_yjjs:addMEListener(TFWIDGET_CLICK, audioClickfun(self.yjjsBtnClickHandle),1)
    self.btn_yjts:addMEListener(TFWIDGET_CLICK, audioClickfun(self.yjtsBtnClickHandle),1)
    self.btn_qbsq:addMEListener(TFWIDGET_CLICK, audioClickfun(self.qbsqBtnClickHandle),1)
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.helpBtnClickHandle),1)
    self.btn_check.logic = self 
    self.btn_check:addMEListener(TFWIDGET_CLICK, audioClickfun(self.checkBtnClickHandle),1)

    self.btn_mrlq:addMEListener(TFWIDGET_CLICK, audioClickfun(self.everyDayBtnClickHandle),1)
    self.btn_tmbb.logic    = self;
    self.btn_tmbb:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onTianMingBagClickHandle),1)

    self.itemChangeCallback = function(event)
        local data = event.data[1]
        self.getItemNum = data[1]
        self:refreshBagView()
        self:addAllEffect()
    end
    TFDirector:addMEGlobalListener(JiSiManager.ItemChange,self.itemChangeCallback)
    self.stateChangeCallback = function(event)
        self:refreshButtoState()
        -- self.generalHead:refreshUI()
    end
    TFDirector:addMEGlobalListener(JiSiManager.StateChangeMessage,self.stateChangeCallback)

    self.PickUpCallback = function(event)
        self:showRewardList(event.data[1][1])
    end

    TFDirector:addMEGlobalListener(JiSiManager.PickUp,self.PickUpCallback); 

    self.TunShiCallback = function(event)
        local data = event.data[1]
        self.getItemNum = data[1]
        self:playeEatEffect()
    end
    TFDirector:addMEGlobalListener(JiSiManager.TunShiMessage,self.TunShiCallback)
    if self.generalHead then
        self.generalHead:registerEvents()
    end
end

function JiSiMainLayer:removeEvents()
    if self.generalHead then
        self.generalHead:removeEvents()
    end

    TFDirector:removeMEGlobalListener(JiSiManager.ItemChange,self.itemChangeCallback)
    TFDirector:removeMEGlobalListener(JiSiManager.StateChangeMessage,self.stateChangeCallback)
    TFDirector:removeMEGlobalListener(JiSiManager.PickUp,self.PickUpCallback); 
    TFDirector:removeMEGlobalListener(JiSiManager.TunShiMessage,self.TunShiCallback)
    self.super.removeEvents(self)
end
function JiSiMainLayer:removeUI()
    self.super.removeUI(self)
    if self.bagItem_panel then
        self.bagItem_panel:release()
        self.bagItem_panel = nil
    end    
end

function JiSiMainLayer.JiSiBtnClickHandle(sender)
    local index = sender.tag
    if JiSiManager:getBagNum() >= MaxNum then
        toastMessage("没有多余的空位了")
        return
    end
    if JiSiManager:getStateByIndex(index ) then

        local JiSiInfo = JiSiTypeData:objectByID(2^(index-1))
        if JiSiInfo then
            local token = JiSiInfo:getToken()
            local isNeedShowConsumes = true
            if token then
                if token.type == EnumDropType.GOODS then
                    local resValue = BagManager:getItemNumById(token.id)
                    if resValue >= token.value then
                        local tokenInfo = ItemData:objectByID(token.id)
                        isNeedShowConsumes = false
                        if JiSiManager.JiSi_cost_token_tip[index] == false then
                            local layer = CommonManager:showOperateCostSureTipLayer(
                                function(data, widget)
                                    JiSiManager:requestBetByType(index)
                                    JiSiManager.JiSi_cost_token_tip[index] = widget:getSelectedState() or false;
                                end,
                                function(data, widget)
                                    AlertManager:close()
                                    JiSiManager.JiSi_cost_token_tip[index] = widget:getSelectedState() or false;
                                end,
                                {
                                    --title="操作确认",
                                    title=localizable.TreasureMain_tips1,
                                    --msg = JiSiInfo.title.."需要花费"..consumes.value..GetResourceName(consumes.type).."，是否确认",
                                    msg = stringUtils.format(localizable.GambleMainLayer_text2,JiSiInfo.title,token.value,tokenInfo.name ),
                                    showtype = AlertManager.BLOCK_AND_GRAY,
                                    costValue = token.value,
                                    costType = "ui_new/qiyu/dushi/img_sl.png",
                                    btnPic = "ui_new/common/btn_ok.png",
                                }
                            )

                            if index >= 4 then
                                local vipInfo = VipData:getVipItemByTypeAndVip(8101+index-4,MainPlayer:getVipLevel())
                                if vipInfo then
                                    local maxBuyTime = vipInfo.benefit_value - MainPlayer:getVipRuleTimesByCode( 8101+index-4 )
                                    layer:showSureTip(stringUtils.format(localizable.GambleMainLayer_text4 ,JiSiInfo.title, maxBuyTime))
                                end
                            end
                            return
                        end
                    else
                        isNeedShowConsumes = true
                    end
                end
            end
            if isNeedShowConsumes then
                local consumes  = JiSiInfo:getConsumes()
                local resValue = getResValueByTypeForGH(consumes.type)

                if consumes.value > resValue then
                    --toastMessage("您的"..GetResourceName(consumes.type) .. "不足")
                    toastMessage(stringUtils.format(localizable.GambleMainLayer_text1, GetResourceName(consumes.type)))
                    return
                end
                if consumes.type == EnumDropType.SYCEE then
                    if JiSiManager.JiSi_cost_tip[index] == false then
                        local layer = CommonManager:showOperateSureTipLayer(
                            function(data, widget)
                                JiSiManager:requestBetByType(index)
                                JiSiManager.JiSi_cost_tip[index] = widget:getSelectedState() or false;
                            end,
                            function(data, widget)
                                AlertManager:close()
                                JiSiManager.JiSi_cost_tip[index] = widget:getSelectedState() or false;
                            end,
                            {
                                --title="操作确认",
                                title=localizable.TreasureMain_tips1,
                                --msg = JiSiInfo.title.."需要花费"..consumes.value..GetResourceName(consumes.type).."，是否确认",
                                msg = stringUtils.format(localizable.GambleMainLayer_text2,JiSiInfo.title,consumes.value,GetResourceName(consumes.type) ),
                                showtype = AlertManager.BLOCK_AND_GRAY
                            }
                        )

                        -- if index >= 4 then
                        --     local vipInfo = VipData:getVipItemByTypeAndVip(8101+index-4,MainPlayer:getVipLevel())
                        --     if vipInfo then
                        --         local maxBuyTime = vipInfo.benefit_value - MainPlayer:getVipRuleTimesByCode( 8101+index-4 )
                        --         layer:showFreshTip(stringUtils.format(localizable.GambleMainLayer_text4,JiSiInfo.title , maxBuyTime))
                        --     end
                        -- end
                        return

                    end
                end
            end
        end

        JiSiManager:requestBetByType(index)
    end
end
function JiSiMainLayer.zhenxuanBtnClickHandle(sender)
    local self = sender.logic

    local zhenxuanInfo = JiSiZxData:objectByID(1)
    if zhenxuanInfo == nil then
        print("檀香炉数据有错误")
        return
    end
    local token = zhenxuanInfo:getToken()
    if token then
        if token.type == EnumDropType.GOODS then
            local resValue = BagManager:getItemNumById(token.id)
            if resValue >= token.value then
                local tokenInfo = ItemData:objectByID(token.id)
                if JiSiManager.zhenxuan_cost_token_tip == false then
                    CommonManager:showOperateCostSureTipLayer(
                        function(data, widget)
                            JiSiManager:requestPick()
                            JiSiManager.zhenxuan_cost_token_tip = widget:getSelectedState() or false;
                        end,
                        function(data, widget)
                            AlertManager:close()
                            JiSiManager.zhenxuan_cost_token_tip = widget:getSelectedState() or false;
                        end,
                        {
                            --title="操作确认",
                            title=localizable.TreasureMain_tips1,
                            --msg = JiSiInfo.title.."需要花费"..consumes.value..GetResourceName(consumes.type).."，是否确认",
                            msg = stringUtils.format(localizable.JiSiMainLayer_text3,token.value,tokenInfo.name ),
                            showtype = AlertManager.BLOCK_AND_GRAY,
                            costValue = token.value,
                            costType = "ui_new/qiyu/dushi/img_js.png",
                            btnPic = "ui_new/qiyu/dushi/btn_zhenxuan.png",
                        }
                    )
                    return
                end
            end
        end
    end

    local consumes  = zhenxuanInfo:getConsumes()
    local resValue = getResValueByTypeForGH(consumes.type)

    if JiSiManager.zhenxuan_cost_tip then
        if resValue < consumes.value then
            --toastMessage("您的元宝不足")
            toastMessage(localizable.common_your_yuanbao)
            return
        end
        JiSiManager:requestPick()
        return
    end

    CommonManager:showOperateSureTipLayer(
        function(data, widget)
            if resValue < consumes.value then
               --toastMessage("您的元宝不足")
               toastMessage(localizable.common_your_yuanbao)
            else
                JiSiManager:requestPick()
            end
            JiSiManager.zhenxuan_cost_tip = widget:getSelectedState() or false;
        end,
        function(data, widget)
            AlertManager:close()
            JiSiManager.zhenxuan_cost_tip = widget:getSelectedState() or false;
        end,
        {
            --title="操作确认",
            title=localizable.TreasureMain_tips1,
            --msg="甄选需要花费"..consumes.value..GetResourceName(consumes.type).."，是否确认",
            msg=stringUtils.format(localizable.JiSiMainLayer_text3,consumes.value,GetResourceName(consumes.type) ),
            showtype = AlertManager.BLOCK_AND_GRAY
        }
    )
end


--一键祭祀
function JiSiMainLayer.yjjsBtnClickHandle(sender)
    local self = sender.logic
    if self.type == true and self.againtype == false then
        CommonManager:showOperateSureTipLayer(function(state,widget)
            self.againtype = widget:getSelectedState()
            local yjjsNum = 20
            if MaxNum > JiSiManager:getBagNum() then
                if yjjsNum + JiSiManager:getBagNum() <= MaxNum then
                    JiSiManager:requestBatchBetAuto(20,self.type)
                else
                    JiSiManager:requestBatchBetAuto(MaxNum - JiSiManager:getBagNum(),self.type)
                end
            else
                toastMessage("没有多余的空位了")
            end
        end,
        nil,
        {
            msg = localizable.JiSiMainLayer_text5
        })
    else
        local yjjsNum = 20
            if MaxNum > JiSiManager:getBagNum() then
                if yjjsNum + JiSiManager:getBagNum() <= MaxNum then
                    JiSiManager:requestBatchBetAuto(20,self.type)
                else
                    JiSiManager:requestBatchBetAuto(MaxNum - JiSiManager:getBagNum(),self.type)
                end
            else
                toastMessage("没有多余的空位了")
        end
    end
end

--一键吞噬
function JiSiMainLayer.yjtsBtnClickHandle(sender)
    JiSiManager:requestMergAuto()
end

--一键拾取
function JiSiMainLayer.qbsqBtnClickHandle(sender)
    JiSiManager:requestPickup(0)
end

function JiSiMainLayer.everyDayBtnClickHandle(sender)
    JiSiManager:requestEveryDayQi()
end

function JiSiMainLayer.helpBtnClickHandle(sender)
    CommonManager:showRuleLyaer("tianmingjisi")
end
function JiSiMainLayer.checkBtnClickHandle(sender)
    local self = sender.logic
    if self.type == false then
        self.type = true
    else
        self.type = false
    end
end

function JiSiMainLayer.onTianMingBagClickHandle(sender)
    local self = sender.logic;
    TianMingManager:openTianMingBagLayer()
end

function JiSiMainLayer:refreshBagView()
    if self.playeffect == true then
        return
    end
    if self.allPanels then
        for i,v in pairs(self.allPanels) do
            if v.tween then
                TFDirector:killTween(v.tween)
                v.tween = nil
            end
        end
    end
    if self.tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.Panel_baoshi:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)


        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, JiSiMainLayer.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, JiSiMainLayer.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, JiSiMainLayer.numberOfCellsInTableView)
        self.tableView = tableView
        self.tableView.logic = self
        self.Panel_baoshi:addChild(tableView)
    end
    self.tableView:reloadData()
    self.tableView:setScrollToEnd(false)
    if JiSiManager:getBagNum() > 0 then
        self.btn_yjts:setVisible(true)
        self.btn_qbsq:setVisible(true)
    else
        self.btn_yjts:setVisible(false)
        self.btn_qbsq:setVisible(false)
    end
end

function JiSiMainLayer:refreshButtoState()
    for i=1,JiSiManager.JiSiMaxLevel do
        if JiSiManager:getStateByIndex(i) then
            self.btn_JiSi[i]:setGrayEnabled(false)
            self.btn_JiSi[i]:setTouchEnabled(true)
        else
            self.btn_JiSi[i]:setGrayEnabled(true)
            self.btn_JiSi[i]:setTouchEnabled(false)
        end
        local JiSiInfo = JiSiTypeData:objectByID(2^(i-1))
        if JiSiInfo then
            -- local token = JiSiInfo:getToken()
            local isNeedShowConsumes = true
            if token then
                if token.type == EnumDropType.GOODS then
                    local resValue = BagManager:getItemNumById(token.id)
                    if resValue >= token.value then
                        isNeedShowConsumes = false
                        self.txt_cost[i]:setText(token.value)
                        self.img_res_icon[i]:setVisible(false)
                        if self.img_sl[i] then
                            self.img_sl[i]:setVisible(true)
                        end
                    else
                        self.img_res_icon[i]:setVisible(true)
                        if self.img_sl[i] then
                            self.img_sl[i]:setVisible(false)
                        end
                        isNeedShowConsumes = true
                    end
                end
            end
            if isNeedShowConsumes then
                local consumes  = JiSiInfo:getConsumes()
                local resValue = getResValueByTypeForGH(consumes.type)
                self.txt_cost[i]:setText(consumes.value)
                self.img_res_icon[i]:setTexture(GetResourceIcon(consumes.type))

                if consumes.value <= resValue then
                    self.txt_cost[i]:setColor(ccc3(255,255,255))
                else
                    self.txt_cost[i]:setColor(ccc3(255,0,0))
                end
            end
        end
    end
    if JiSiManager:getStateByIndex(4) then
        self.btn_zhenxuan:setGrayEnabled(true)
        self.btn_zhenxuan:setTouchEnabled(false)
    else
        self.btn_zhenxuan:setGrayEnabled(false)
        self.btn_zhenxuan:setTouchEnabled(true)
    end

    CommonManager:updateRedPoint(self.btn_mrlq, QiyuManager:isFeteHaveRedPoint() ,ccp(10,10))
    if (QiyuManager:isFeteHaveRedPoint()) then
        self.btn_mrlq:setTouchEnabled(true)
        self.btn_mrlq:setGrayEnabled(false)
    else
        self.btn_mrlq:setTouchEnabled(false)
        self.btn_mrlq:setGrayEnabled(true)
    end
end


function JiSiMainLayer.cellSizeForTable(table,idx)
    return 110,940
end


function JiSiMainLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    self.allPanels = self.allPanels or {}
    if nil == cell then
        cell = TFTableViewCell:create()
        for i=1,column do
            local bagItem_panel = self.bagItem_panel:clone()
            bagItem_panel:setScale(0.8)
            local width = bagItem_panel:getSize().width*0.8
            local x = width*(i-1) + 15
            bagItem_panel:setPosition(ccp(x,0))

            cell:addChild(bagItem_panel)
            cell.bagItem_panel = cell.bagItem_panel or {}
            cell.bagItem_panel[i] = bagItem_panel
            local newIndex = #self.allPanels + 1
            self.allPanels[newIndex] = bagItem_panel
        end
    end
    for i=1,column do
        local tmpIndex = idx * column + i
        if tmpIndex <= JiSiManager:getBagNum() then
            local _item = JiSiManager.itemArray:objectAt(tmpIndex)
            if _item then
                cell.bagItem_panel[i].stone_index = tmpIndex
                cell.bagItem_panel[i]:setVisible(true)
                local rewardItem = BaseDataManager:getReward({itemId = _item.resId,type = _item.resType,number =_item.resNum})
                self:loadIconNode(cell.bagItem_panel[i],rewardItem,_item)
                local width = cell.bagItem_panel[i]:getSize().width*0.8
                local x = width*(i-1) + 15
                cell.bagItem_panel[i]:setPosition(ccp(x,0))
            else
                cell.bagItem_panel[i]:setVisible(false)
                cell.bagItem_panel[i].stone_index = 0
            end
        else
            cell.bagItem_panel[i].stone_index = 0
            cell.bagItem_panel[i]:setVisible(false)
        end
        if cell.bagItem_panel[i].effect then
            cell.bagItem_panel[i].effect:removeFromParent(true)
            cell.bagItem_panel[i].effect = nil
        end
    end
    return cell
end


function JiSiMainLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    self.super.dispose(self)
end

function JiSiMainLayer:addAllEffect()
    if self.allPanels and #self.allPanels then
        local length = #self.allPanels
        for i=1,length do
            local panel = self.allPanels[i]
            local index = panel.stone_index
            if index ~= 0 and index + self.getItemNum > JiSiManager:getBagNum() and index <= JiSiManager:getBagNum() then
                -- print("index = ",index)
                -- print("self.getItemNum = ",self.getItemNum)
                -- print("JiSiManager:getBagNum() = ",JiSiManager:getBagNum())
                local parent = panel:getParent()
                panel:setVisible(false)
                self:addGetEffect(parent,panel)
            end
        end
        self.getItemNum  = 0
    end
end

function JiSiMainLayer:addGetEffect(cell,node)
    local filePath = "effect/ui/gamble_stone.xml"
    if node.effect then
        node.effect:removeFromParent()
        node.effect = nil
    end
    TFResourceHelper:instance():addArmatureFromJsonFile(filePath)
    local effect = TFArmature:create("gamble_stone_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)
    local posX = node:getPositionX()
    effect:setPosition(ccp(posX+55,55))
    effect:setZOrder(10)
    cell:addChild(effect)
    node.effect = effect
    local step = 1
    effect:addMEListener(TFARMATURE_UPDATE,function()
        step = step + 1
        if step == 14 then 
            node:setVisible(true)
            effect:removeMEListener(TFARMATURE_UPDATE)
            
        end
        end)
end

function JiSiMainLayer:loadIconNode(node,rewardItem,itemInfo)
    node:setVisible(true)
    node:setScale(0.8)
    local img_icon  = TFDirector:getChildByPath(node, 'img_icon');
    local txt_price   = TFDirector:getChildByPath(node, 'txt_price');
    local levelLabel = TFDirector:getChildByPath(node, 'levelLabel')
    local panel_dengji = TFDirector:getChildByPath(node, 'panel_dengji')
    local expBarBg = TFDirector:getChildByPath(node, 'expBarBg')
    local img_bg1 = TFDirector:getChildByPath(node, 'img_bg1')
    local expBar = TFDirector:getChildByPath(node, "expBar")
    local Image_DushiIcon_1 = TFDirector:getChildByPath(node, 'Image_DushiIcon_1')
    panel_dengji:setVisible(true)
    -- local txt_name  = TFDirector:getChildByPath(node, 'txt_name');
    local bg_icon   = TFDirector:getChildByPath(node, 'bg_icon');

    if bg_icon then
        bg_icon:setTextureNormal(GetColorIconByQuality_118(rewardItem.quality));
        function onClick( sender )
          Public:ShowItemTipLayer(rewardItem.itemid, rewardItem.type);
        end
        bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
    end
    -- if txt_name then
    --     txt_name:setText(rewardItem.name);
    -- end
    if img_icon then
        img_icon:setTexture(rewardItem.path);
        -- self:addPieceImg(img_icon,rewardItem);
    end
    if itemInfo.resType == EnumDropType.GOODS then
        local item = ItemData:objectByID(itemInfo.resId)
        if item and item.type == EnumGameItemType.TMRubbish then
            txt_price:setVisible(true)
            txt_price:setText(item.price)
            Image_DushiIcon_1:setTexture(GetResourceIcon(EnumDropType.SPECIAL_QI))
        else
            txt_price:setVisible(false)
        end
    end
    if itemInfo.exp and itemInfo.exp ~= 0 then
        panel_dengji:setVisible(true)
        levelLabel:setText(itemInfo.level)
    else
        panel_dengji:setVisible(false)
    end

    expBar:setDirection(TFLOADINGBAR_LEFT)
    expBar:setPercent(0)
    expBar:setVisible(true)  

    if itemInfo.level ~= 0 or itemInfo.exp ~= 0 then
        expBarBg:setVisible(true)
        img_bg1:setVisible(true)
    else
        expBarBg:setVisible(false)
        img_bg1:setVisible(false)
    end

    local quality = ItemData:objectByID(itemInfo.resId).quality
    node.quality = quality
    node.level = itemInfo.level
    node.exp = itemInfo.exp
    if itemInfo.exp and quality then
        local totalExp = DesTinyExpData:getExpBylevelandQuality(itemInfo.level + 1,quality)
        if totalExp then
            expBar:setPercent(math.floor(itemInfo.exp*100/totalExp))
        else
            expBar:setPercent(0)
        end
    end
    node.img_icon = img_icon
    return node;
end

function JiSiMainLayer:playeEatEffect()
    -- print("JiSiMainLayer:playeEatEffect()")
    self.playeffect = true
    self.tableView:setScrollToBegin()
    local index = 1 
    for i,v in pairs(self.allPanels) do
        if v.tween then
            TFDirector:killTween(v.tween)
            v.tween = nil
        end
        if v.exp ~= 0 or v.level ~= 0 then
            index = i
        end
    end
    if self.Panel_baoshi.effect ~= nil then
        self.Panel_baoshi.effect:removeFromParent()
        self.Panel_baoshi.effect = nil
    end
    local haveEffect = false
    self.btn_yjjs:setTouchEnabled(false)
    for i,v in ipairs(self.allPanels) do
        if v.stone_index ~= 1 and v.quality and v.quality > 1 and v.quality < 4 then 
            if v.stone_index < 24 then
                haveEffect = true
            elseif haveEffect == false then
                break
            end
            local tween = {
                target = v,
                {
                    scale = 0.5,
                    duration = 0.3,
                    x = (((v:getSize().width*0.2*((v.stone_index - 1) / 8))) + 40 ) / 2,
                    y = (math.floor((v.stone_index - 1)/8) * 110 + 40)/2,
                }
                ,
                {
                    x = 40,
                    y = math.floor((v.stone_index - 1)/8) * 110 + 40,
                    scale = 0.2,
                    duration = 0.2,
                    onComplete = function()
                        self.playeffect = false
                        self.btn_yjjs:setTouchEnabled(true)
                        TFResourceHelper:instance():addArmatureFromJsonFile("effect/eat_JiSi.xml")
                        local effect = TFArmature:create("eat_JiSi_anim")
                        effect:setAnimationFps(GameConfig.ANIM_FPS)
                        effect:setPosition(ccp(70,270))
                        effect:playByIndex(0, -1, -1, 0)
                        effect:setScale(1.25)
                        if self.Panel_baoshi.effect == nil then
                            self.Panel_baoshi:addChild(effect)
                            self.Panel_baoshi.effect = effect
                        else
                            -- print("effect error")
                        end
                        self:refreshBagView()
                    end
                }
            }
            v.tween = tween
            TFDirector:toTween(tween)
        end 
    end
    if haveEffect == false then
        for i,v in ipairs(self.allPanels) do
        if v.tween then
            TFDirector:killTween(v.tween)
            v.tween = nil
        end
    end
        self.playeffect = false
        self:refreshBagView()
        self.btn_yjjs:setTouchEnabled(true)
    end

    
end

function JiSiMainLayer.numberOfCellsInTableView(table)
    local num = math.ceil(JiSiManager:getBagNum()/column)
    return num
end

function JiSiMainLayer:showRewardList(RewardList)
    -- local layer = AlertManager:addLayerByFile("lua.logic.common.RewardListMessageJiSi")
    local layer = AlertManager:addLayerByFile("lua.logic.common.RewardListMessageJiSi",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_0);
    if layer then
        layer:loadData(RewardList.item,stringUtils.format(localizable.JiSiMainLayer_OneKeyTxt,length,JiSiManager.batchBetAutoCount ))
        -- layer:setTextSHow(stringUtils.format(localizable.JiSiMainLayer_OneKeyTxt,length,JiSiManager.batchBetAutoCount ))
    end
    AlertManager:show()
end

return JiSiMainLayer