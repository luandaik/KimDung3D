--[[
******充值 充值列表*******

    -- by haidong.gan
    -- 2013/11/27
]]
local PayLayer = class("PayLayer", BaseLayer);

CREATE_SCENE_FUN(PayLayer);
CREATE_PANEL_FUN(PayLayer);

PayLayer.LIST_ITEM_WIDTH = 275; 
PayLayer.LIST_ITEM_HEIGHT = 160; 
PayLayer.LIST_REWARD_ITEM_WIDTH = 380; 

function PayLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.pay.PayLayer");
end

function PayLayer:initUI(ui)
    self.super.initUI(self,ui);


    self.scroll_view = TFDirector:getChildByPath(ui, 'panel_scrollview');
    self.panel_recharge   = TFDirector:getChildByPath(ui, 'panel_recharge');

    -- local scrollView = TFScrollView:create()
    -- scrollView:setPosition(ccp(0,0))
    -- scrollView:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
    -- scrollView:setDirection(SCROLLVIEW_DIR_VERTICAL);
    -- scrollView:setBounceEnabled(true);
    -- scrollView:setSize(self.panel_recharge:getSize());
    -- scrollView:setInnerContainerSize(CCSizeMake(600,450));
    -- scrollView:scrollToTop()

    -- self.panel_recharge:addChild(scrollView)
    -- self.list_recharge = scrollView;

    -- Public:bindScrollFun(self.list_recharge);

    self.btn_close 		  = TFDirector:getChildByPath(ui, 'btn_close');
    self.btn_vip        = TFDirector:getChildByPath(ui, 'btn_tq');
    self.btn_shop       = TFDirector:getChildByPath(ui, 'btn_sc');
    self.btn_shop:setVisible(PayManager:isOpenVIPShop())
  


    self.node_vip       = TFDirector:getChildByPath(ui, 'node_vip');
    self.node_notVip    = TFDirector:getChildByPath(ui, 'node_notVip');
    self.node_topVip    = TFDirector:getChildByPath(ui, 'node_topVip');

    self.img_fisrtPay   = TFDirector:getChildByPath(ui, 'img_fisrtPay');
    self.btn_qiandao = TFDirector:getChildByPath(ui, "btn_qiandao")
    self.btn_zengquanbag = TFDirector:getChildByPath(ui, "btn_zengquanbag")

    --self.btn_zengquanbag:setVisible(false)
end

function PayLayer:loadRecordListata(data)
    self.recordList = data.recordList or {};
    self:refreshUI();
end

function PayLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();

end

function PayLayer:refreshBaseUI()

end


function PayLayer:refreshUI()
    -- if not self.isShow then
    --     return;
    -- end

    self:loadRechargeList();

    self.img_fisrtPay:setVisible(false);
    self.node_vip:setVisible(false);
    self.node_notVip:setVisible(false);
    self.node_topVip:setVisible(false);

    --首充
    if MainPlayer:getTotalRecharge() == 0 then
       self.img_fisrtPay:setVisible(true);
    end

    
    local nextVip = PayManager:getNextVip();
    local needMoney = PayManager:getNextNeedMoney();
    local nxtVipNeedMoney = PayManager:getNextVipNeedMoney();

    -- --非vip
    -- if MainPlayer:getVipLevel() == 0 then
    --     self.node_notVip:setVisible(true);
    --     local txt_nextVip      = TFDirector:getChildByPath(self.node_notVip, 'txt_nextVip');
    --     local txt_needMoney    = TFDirector:getChildByPath(self.node_notVip, 'txt_needMoney');
    --     local lb2              = TFDirector:getChildByPath(self.node_notVip, 'lb2');


    --     txt_nextVip:setText("o"  .. nextVip);
    --     txt_needMoney:setText(needMoney);

    --     lb2:setPosition(ccp(txt_needMoney:getPosition().x + txt_needMoney:getSize().width + 5, lb2:getPosition().y));
    --     txt_nextVip:setPosition(ccp(lb2:getPosition().x + lb2:getSize().width + 5 , txt_nextVip:getPosition().y));

    -- else
    print("++++++++ nextvip : ", nextVip)
    if nextVip == -1 then --顶级vip
        self.node_topVip:setVisible(true);
        local txt_value    = TFDirector:getChildByPath(self.node_topVip, 'txt_jindu');
        local bar_value    = TFDirector:getChildByPath(self.node_topVip, 'LoadingBar_vip');

        --added by wuqi
        local img_vip = TFDirector:getChildByPath(self.node_topVip, "img_vip")
        local txt_vip = TFDirector:getChildByPath(self.node_topVip, "txt_curVip")

        txt_vip:setVisible(false)
        img_vip:setVisible(true)

        self:addVipEffect(img_vip, MainPlayer:getVipLevel())
        
        txt_value:setText(PayManager:getNeedMoneyVip(MainPlayer:getVipLevel()) .. "/" .. PayManager:getNeedMoneyVip(MainPlayer:getVipLevel())); 
        bar_value:setPercent(100)
    else
        self.node_vip:setVisible(true);
        local txt_curVip      = TFDirector:getChildByPath(self.node_vip, 'txt_curVip');
        local txt_nextVip      = TFDirector:getChildByPath(self.node_vip, 'txt_nextVip');
        local txt_needMoney    = TFDirector:getChildByPath(self.node_vip, 'txt_needMoney');
        local txt_value    = TFDirector:getChildByPath(self.node_vip, 'txt_value');
        local bar_value    = TFDirector:getChildByPath(self.node_vip, 'bar_value');

        local lb2              = TFDirector:getChildByPath(self.node_vip, 'lb2');

        --added by wuqi
        local img_vip1 = TFDirector:getChildByPath(self.node_vip, "img_curVip")
        local img_vip2 = TFDirector:getChildByPath(self.node_vip, "img_nextVip")
        txt_curVip:setVisible(true)
        txt_nextVip:setVisible(true)
        img_vip1:setVisible(false)
        img_vip2:setVisible(false)

        txt_curVip:setText("o"  .. MainPlayer:getVipLevel());
        txt_nextVip:setText("o"  .. nextVip);
        txt_needMoney:setText(needMoney); 
        txt_value:setText(nxtVipNeedMoney - needMoney .. "/" .. nxtVipNeedMoney); 

        --bar_value:setPercent((nxtVipNeedMoney - needMoney)/nxtVipNeedMoney*100)

        if self.scoreMoveTimerID then
            TFDirector:removeTimer(self.scoreMoveTimerID)
            self.scoreMoveTimerID = nil
        end

        --vip签到时进度条动画
        if self.bScoreMove then
            local oldNum = self.oldScoreNum
            local newNum = nxtVipNeedMoney - needMoney
            local newTotal = nxtVipNeedMoney

            local deltaNum = 1
            local function doJinduAction()
                oldNum = oldNum + deltaNum
                oldPer = oldNum / nxtVipNeedMoney * 100
                if oldNum == newNum then
                    if self.scoreMoveTimerID then
                        TFDirector:removeTimer(self.scoreMoveTimerID)
                        self.scoreMoveTimerID = nil
                    end
                end
                
                bar_value:setPercent(oldPer)
            end
            self.scoreMoveTimerID = TFDirector:addTimer(1, -1, nil,
                function()
                    doJinduAction()
                end
            )
            self.bScoreMove = false
        else
            --vip积分条
            bar_value:setPercent((nxtVipNeedMoney - needMoney)/nxtVipNeedMoney*100)
        end

        self.oldScoreNum = nxtVipNeedMoney - needMoney

        lb2:setPosition(ccp(txt_needMoney:getPosition().x + txt_needMoney:getSize().width + 5 , lb2:getPosition().y));
        txt_nextVip:setPosition(ccp(lb2:getPosition().x + lb2:getSize().width + 5 , txt_nextVip:getPosition().y));

        if MainPlayer:getVipLevel() > 15 then
            self:addVipEffect(img_vip1, MainPlayer:getVipLevel())
            txt_curVip:setVisible(false)
            img_vip1:setVisible(true)
        end

        if nextVip > 15 then
            self:addVipEffect(img_vip2, nextVip)
            txt_nextVip:setVisible(false)
            img_vip2:setVisible(true)
            img_vip2:setPosition(ccp(lb2:getPosition().x + lb2:getSize().width + 70 , txt_nextVip:getPosition().y - 5))
        end
    end

    self.oldVipLevel = nextVip

    self.btn_qiandao:setTouchEnabled(true)
    self.btn_qiandao:setGrayEnabled(false)
    if not MainPlayer:getVipScoreRed() then
        self.btn_qiandao:setTouchEnabled(false)
        self.btn_qiandao:setGrayEnabled(true)
    end
    CommonManager:setRedPoint(self.btn_qiandao, MainPlayer:getVipScoreRed(), "vipScore", ccp(0, 0))
    CommonManager:setRedPoint(self.btn_zengquanbag, RechargeTicketManager:haveTodayUse(), "RechargeTicket", ccp(10, 5))
end

--added by wuqi
function PayLayer:addVipEffect(btn, vipLevel)
    if btn.effect then
        btn.effect:removeFromParent()
        btn.effect = nil
    end

    if vipLevel <= 15 or vipLevel > 18 then
        return
    end
    local resPath = "effect/ui/vip_" .. vipLevel .. ".xml"
    if not TFFileUtil:existFile(resPath) then
        return
    end
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("vip_" .. vipLevel .. "_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(btn:getContentSize().width / 2, btn:getContentSize().height / 2))
    effect:setVisible(true)
    --effect:setScale(0.9)
    effect:playByIndex(0, -1, -1, 1)
    btn:addChild(effect, 200)
    btn.effect = effect
end

function PayLayer:loadRechargeList()
    --清除、重置列表
    -- self.list_recharge:getInnerContainer():stopAllActions();
    if self.panel_recharge_pos then
        self.panel_recharge_pos = self.scroll_view:getContentOffset()
    end
    self.panel_recharge:removeAllChildren();
    self.panel_recharge.cell = {}
    -- if MainPlayer:getTotalRecharge() == 0 then
    --     self:addRewardNode()
    -- end

    AutoTestManager:addAutoTestName(self.scroll_view, "scroll_viewLen_"..PayManager.rechargeNum)
    local itemNum = 0
    for recharge in PayManager.rechargeList:iterator()  do
        if recharge.is_show == 1 then
            itemNum = itemNum + 1
            self:addRechargeNode(recharge.id, itemNum);
            AutoTestManager:addAutoTestName(recharge, "scroll_view_"..recharge.id)
        end
    end

    local row = math.ceil(itemNum/3)
    local height = PayLayer.LIST_ITEM_HEIGHT * row + 15
    local size = self.scroll_view:getInnerContainerSize()

    local scrollViewContentsize = self.scroll_view:getContentSize().height
    if height > scrollViewContentsize then
        scrollViewContentsize = height
        self.panel_recharge:setPosition(0,0)
    else
        self.panel_recharge:setPosition(0,scrollViewContentsize-height)
    end
    self.scroll_view:setInnerContainerSize(CCSizeMake(size.width, scrollViewContentsize))
    size = self.scroll_view:getInnerContainerSize()

    if self.panel_recharge_pos then
        self.scroll_view:setContentOffset(self.panel_recharge_pos)
    else
        self.scroll_view:setContentOffset(ccp(0,self.scroll_view:getContentSize().height-height))
        self.panel_recharge_pos = self.scroll_view:getContentOffset()
    end

    -- self.list_recharge:setInnerContainerSize(CCSizeMake(self.list_recharge:getSize().width , 50 +  math.ceil(PayManager.rechargeList:length()/3) * 110));
    -- if MainPlayer:getTotalRecharge() == 0 then
    --     self.list_recharge:setInnerContainerSize(CCSizeMake(self.list_recharge:getSize().height , self.list_recharge:getSize().height));
    -- else
    --     self.list_recharge:setInnerContainerSize(CCSizeMake(100 + PayLayer.LIST_ITEM_WIDTH * PayManager.rechargeList:length() , self.list_recharge:getSize().height));
    -- end
end

-- --添加奖励节点
-- function PayLayer:addRewardNode()
--     local reward_node = createUIByLuaNew("lua.uiconfig_mango_new.pay.FirstRewardNode");
--     local rewardList = PayManager:getRewardListForFirstPay();

--     for reward in rewardList:iterator() do
--         local index = rewardList:indexOf(reward);

--         local reward_item = Public:createIconNameNumNode(reward);
--         reward_item:setScale(0.7);
--         if index < 3 then
--             reward_item:setPosition(ccp(80 + (index - 1)*140,220));
--         else
--             reward_item:setPosition(ccp(80 + (index - 3)*140,80));
--         end


--         reward_node:addChild(reward_item);
--     end

--     reward_node:setPosition(ccp(0, 0));
--     self.list_recharge:addChild(reward_node);
-- end


--添加充值节点
function PayLayer:addRechargeNode(rechargeId, index)
    local recharge = PayManager.rechargeList:objectByID(rechargeId);
    -- local index = PayManager.rechargeList:indexOf(recharge);

    local recharge_node = createUIByLuaNew("lua.uiconfig_mango_new.pay.RechargeItem");

    local btn_recharge  =  TFDirector:getChildByPath(recharge_node, 'bg');
    recharge_node.btn_recharge = btn_recharge
    btn_recharge.logic = self;
    btn_recharge:setTag(recharge.id);
    btn_recharge.index = index;
    btn_recharge:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRechargeClickHandle));

    local img_fisrtPay  = TFDirector:getChildByPath(recharge_node, 'img_fisrtPay');
    local txt_num       = TFDirector:getChildByPath(recharge_node, 'txt_num');
    local Img_shouci       = TFDirector:getChildByPath(recharge_node, 'Img_shouci');
    local img_zengquan = TFDirector:getChildByPath(recharge_node, "img_keyongzengquan")

    img_zengquan:setVisible(false)
    local ticket = RechargeTicketManager:getTicketByIndex(index)
    if ticket then
        img_zengquan:setVisible(true)
        local recharge_id = ticket.config.recharge_id
        local str = "ui_new/pay/icon_zengquan" .. recharge_id .. ".png"
        img_zengquan:setTexture(str)
    end

    local multiple_sycee = 0
    local multiple = PayManager.doubleRechargeInfo[recharge.id]
    if multiple and multiple ~= 0 then
        multiple_sycee = math.ceil(multiple*recharge.sycee)
    end

    if PayManager:isHavePay(recharge.id) then
        Img_shouci:setVisible(false);
        img_fisrtPay:setVisible(false);
        if recharge.extra_sycee > 0 or multiple_sycee > 0 then
            img_fisrtPay:setVisible(true)
            if multiple_sycee ~= 0 then
                img_fisrtPay:setTexture("ui_new/pay/bg_zengsong.png")
                txt_num:setText(multiple_sycee + recharge.extra_sycee)
            else
                img_fisrtPay:setTexture("ui_new/pay/vip60.png")
                txt_num:setText(recharge.extra_sycee)
            end
            -- if multiple_sycee > recharge.extra_sycee then
            --     img_fisrtPay:setTexture("ui_new/pay/bg_zengsong.png")
            --     txt_num:setText(multiple_sycee)
            -- else
            --     img_fisrtPay:setTexture("ui_new/pay/vip60.png")
            --     txt_num:setText(recharge.extra_sycee)
            -- end
        end
    else
        Img_shouci:setVisible(true);
        img_fisrtPay:setVisible(true);
        -- img_fisrtPay:setTexture("ui_new/pay/vip".. recharge.sycee .. ".png")
        if multiple_sycee ~= 0 then
            img_fisrtPay:setTexture("ui_new/pay/bg_zengsong.png")
            txt_num:setText(multiple_sycee + recharge.sycee * ConstantData:getValue("Recharge.First.Multiple"))
        else
            img_fisrtPay:setTexture("ui_new/pay/vip60.png")
            txt_num:setText(recharge.sycee* ConstantData:getValue("Recharge.First.Multiple"))
        end
    end

    if img_fisrtPay:isVisible() then
        self:AddButtonEffect(img_fisrtPay, 215, 238)
    end

    local img_icon  =  TFDirector:getChildByPath(recharge_node, 'img_icon');
    img_icon:setTexture("ui_new/pay/VIP_yb"..index..".png");

    local txt_sycee  =  TFDirector:getChildByPath(recharge_node, 'txt_sycee');
    -- txt_sycee:setText(recharge.sycee .. "元宝");
    txt_sycee:setText(recharge.sycee .. "");

    -- local txt_extra_sycee  =  TFDirector:getChildByPath(recharge_node, 'txt_extra_sycee');
    -- txt_extra_sycee:setText(recharge.extra_sycee );

    local txt_price  =  TFDirector:getChildByPath(recharge_node, 'txt_price');
    txt_price:setText(recharge.price);

    -- local lb_extra_sycee1    = TFDirector:getChildByPath(recharge_node, 'lb_extra_sycee1');
    -- local lb_extra_sycee2    = TFDirector:getChildByPath(recharge_node, 'lb_extra_sycee2');

    -- lb_extra_sycee1:setPosition(ccp(txt_extra_sycee:getPosition().x - txt_extra_sycee:getSize().width/2 - 2 , lb_extra_sycee1:getPosition().y));
    -- lb_extra_sycee2:setPosition(ccp(txt_extra_sycee:getPosition().x + txt_extra_sycee:getSize().width/2 + 2 , lb_extra_sycee2:getPosition().y));

    -- if MainPlayer:getTotalRecharge() == 0 then
    --     recharge_node:setPosition(ccp(10 + PayLayer.LIST_REWARD_ITEM_WIDTH + (index - 1) * PayLayer.LIST_ITEM_WIDTH, 40));
    -- else
    --     recharge_node:setPosition(ccp(10 + (index - 1) * PayLayer.LIST_ITEM_WIDTH, 40));
    -- end
    local indexX = index%3;
    if indexX == 0 then
        indexX = 3;
    end
    local nLen = PayManager.rechargeNum
    recharge_node:setPosition(ccp(15 + (indexX - 1) * PayLayer.LIST_ITEM_WIDTH,  (math.ceil(nLen/3) - math.ceil(index/3 )) * PayLayer.LIST_ITEM_HEIGHT));
    self.panel_recharge:addChild(recharge_node);

    self.panel_recharge.cell = self.panel_recharge.cell or {}
    self.panel_recharge.cell[index] = recharge_node
    -- local row = math.ceil(index/3)
    -- local height = btn_recharge:getContentSize().height * row
    -- local size = self.scroll_view:getInnerContainerSize()
    
    -- local scrollViewContentsize = self.scroll_view:getContentSize().height
    -- if height < scrollViewContentsize then
    --     height = scrollViewContentsize
    -- end

    -- -- print("row = ", row)
    -- -- print("height1 = ", btn_recharge:getContentSize().height)
    -- -- print("height = ", height)
    -- -- print("size = ", size)
    -- self.scroll_view:setInnerContainerSize(CCSizeMake(size.width, height))
    -- size = self.scroll_view:getInnerContainerSize()
    -- print("size2 = ", size)

    -- 重设高度
    -- self.panel_recharge:setSize(CCSizeMake(size.width, height))
    -- self.panel_recharge:setPosition(ccp(0, height - self.scroll_view:getContentSize().height ))
end

function PayLayer:AddButtonEffect(node, posX, posY)
    local resPath = "effect/pay_item_effect.xml"
    if not TFFileUtil:existFile(resPath) then
        return
    end

    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("pay_item_effect_anim")
    if effect == nil then
        return
    end

    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 1)
    effect:setPosition(ccp(posX, posY))
    effect:setRotation(-12.5)
    effect:setScale(1.2)
    node:addChild(effect)
end

function PayLayer:removeUI()
    PayManager:setPaySource(0)
    self:tryExecuteCloseCallback()

    if self.scoreMoveTimerID then
        TFDirector:removeTimer(self.scoreMoveTimerID)
        self.scoreMoveTimerID = nil
    end

    self.super.removeUI(self);
end

function PayLayer.onRechargeClickHandle(sender)
    
    local self = sender.logic;
    local index = sender.index
    local rechargeId = sender:getTag();
    local userInfo = SaveManager:getUserInfo()
    if PayManager:isHavePay(rechargeId) and userInfo.currentServer == '10' and not TFSdk:getSdkName()  then
        toastMessage("杨老板说，测试期间，每笔只能充一次哦");
        return;
    end

    -- if TFSdk:getSdkName() == "changyou" then
    -- -- if true then
    --     toastMessage("充值活动已关闭");
    --     return;
    -- end

    PayManager:pay(rechargeId,index);
end

function PayLayer.onVipClickHandle(sender)
   local self = sender.logic;
   PayManager:showVipLayer(AlertManager.NONE);
   AlertManager:closeLayer(self); 
end

function PayLayer.onVipShopClickHandle(sender)
   local self = sender.logic;
   PayManager:showVipShopLayer(AlertManager.NONE);
   AlertManager:closeLayer(self); 
end

--注册事件
function PayLayer:registerEvents()
    self.super.registerEvents(self);
 
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);
   --function clickCloseHandle()
   --     AlertManager:close(AlertManager.TWEEN_1);
   --     self:tryExecuteCloseCallback()
   --end
   --self.btn_close:addMEListener(TFWIDGET_CLICK,  audioClickfun(clickCloseHandle),1);
    self.btn_close:setClickAreaLength(100);


    self.btn_vip.logic=self;
    self.btn_vip:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onVipClickHandle),1);

    self.btn_shop.logic=self;
    self.btn_shop:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onVipShopClickHandle),1);

    self.payCompeleteCallBack = function(event)
        self:refreshUI();
    end;

    TFDirector:addMEGlobalListener(PayManager.EVENT_PAY_COMPLETE ,self.payCompeleteCallBack ) ;

    self.updateRecordListCallBack = function(event)
        self:loadRecordListata(event.data[1]);
    end;
    TFDirector:addMEGlobalListener(PayManager.updateRecordList ,self.updateRecordListCallBack ) ;

    self.btn_qiandao.logic = self
    self.btn_qiandao:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onQiandaoClickHandle),1);
    
    self.btn_zengquanbag.logic = self
    self.btn_zengquanbag:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZengquanClickHandle),1);

    self.vipScoreCallBack = function(event)
        --self:refreshUI()
        local bSuc = not event.data[1][1]
        if bSuc then
            local num = ConstantData:objectByID("VIPDailyExp").value or 100
            toastMessage( stringUtils.format(localizable.VipScore_success, num) )

            self.bScoreMove = true
        end
        self:refreshUI()
        self.bScoreMove = false
    end;
    TFDirector:addMEGlobalListener(MainPlayer.VIP_RULE_INFO_RESPONSE, self.vipScoreCallBack ) ;
    
    self.onResetCallBack = function()
       self:refreshUI()
   end
   TFDirector:addMEGlobalListener(MainPlayer.GAME_RESET, self.onResetCallBack)

   self.onTicketChangeCallBack = function()
        self:refreshUI()
    end
   TFDirector:addMEGlobalListener(RechargeTicketManager.RECHARGE_TICKET_CHANGE_RESPONSE, self.onTicketChangeCallBack)
end

function PayLayer:removeEvents()
    TFDirector:removeMEGlobalListener(PayManager.EVENT_PAY_COMPLETE ,self.payCompeleteCallBack);
    TFDirector:removeMEGlobalListener(PayManager.updateRecordList ,self.updateRecordListCallBack);
    TFDirector:removeMEGlobalListener(MainPlayer.VIP_RULE_INFO_RESPONSE ,self.vipScoreCallBack);
	TFDirector:removeMEGlobalListener(MainPlayer.GAME_RESET, self.onResetCallBack)
    self.onResetCallBack = nil
    TFDirector:removeMEGlobalListener(RechargeTicketManager.RECHARGE_TICKET_CHANGE_RESPONSE, self.onTicketChangeCallBack)
    self.onTicketChangeCallBack = nil

    if self.scoreMoveTimerID then
        TFDirector:removeTimer(self.scoreMoveTimerID)
        self.scoreMoveTimerID = nil
    end
end

--[[
add by david.dai
设置关闭时界面时的回调函数，在提示打开充值界面的时候，有些时候需要在关闭充值界面的时候显示某些界面或者做一些特殊处理
]]
function PayLayer:setCloseCallback(callbackFunc)
    self.closeCallback = callbackFunc
end

--尝试调用关闭回调函数
function PayLayer:tryExecuteCloseCallback()
    if self.closeCallback then
        self.closeCallback()
        self.closeCallback = nil
    end
end

function PayLayer.onQiandaoClickHandle(sender)
    print("onQiandaoClickHandle >>>>>> ")
    local self = sender.logic

    local function callback()
        TFDirector:send(c2s.DRAW_VIPSCORE, {})
        --showLoading()
    end

    self:showJinduChangeEffect(callback)
end

function PayLayer.onZengquanClickHandle(sender)
   local self = sender.logic

   RechargeTicketManager:openTicketLayer()
end

function PayLayer:showJinduChangeEffect(callback)
    local pos = self.btn_qiandao:convertToWorldSpace(ccp(0, 0))
    self:showFlyBegin(pos, callback)
end

function PayLayer:showFlyBegin(pos, flyMoveCallBack)
    play_chuangonghunpoyidong()

    local bar_value = TFDirector:getChildByPath(self.node_vip, 'bar_value');
    local topos = bar_value:convertToWorldSpace(ccp(0, 0))
    local resPath = "effect/role_transfer_begin.xml"
    if not TFFileUtil:existFile(resPath) then
        return
    end
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local flyPic = TFArmature:create("role_transfer_begin_anim")

    flyPic:setAnimationFps(GameConfig.ANIM_FPS)
    flyPic:setPosition(ccp(topos.x + 80 , topos.y - 55))
    flyPic:setScale(0.8)

    self:addChild(flyPic,100)
    self.isMoved = false
    self.isShowStart = true
    self.isShowing = false
    flyPic:addMEListener(TFARMATURE_COMPLETE,function()
        flyPic:removeFromParentAndCleanup(true)
        flyPic:removeMEListener(TFARMATURE_COMPLETE) 
    end)
    local temp = 0
    flyPic:addMEListener(TFARMATURE_UPDATE,function()
        temp = temp + 1
        if temp == 2 then
            self:showFlyMove(pos, flyMoveCallBack)
        end
    end)

    flyPic:playByIndex(0, -1, -1, 0)
end

function PayLayer:showFlyMove(pos, flyMoveCallBack)
    play_chuangonghunpoyidong()

    local bar_value = TFDirector:getChildByPath(self.node_vip, 'bar_value');
    local topos = bar_value:convertToWorldSpace(ccp(0, 0))

    local resPath = "effect/role_transfer_move.xml"
    if not TFFileUtil:existFile(resPath) then
        return
    end
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local moveEffect = TFArmature:create("role_transfer_move_anim")

    moveEffect:setAnimationFps(GameConfig.ANIM_FPS)
    moveEffect:setPosition(ccp(topos.x + 80, topos.y))

    self:addChild(moveEffect,100)

    moveEffect:playByIndex(0, -1, -1, 1)

    local toPos = topos
    local tween = 
    {
        target = moveEffect,
        {
            ease = {type=TFEaseType.EASE_IN_OUT, rate=9},
            duration = 0.2,
            x = toPos.x - 150,
            y = toPos.y,
            onComplete = function ()
                self.isMoved = true
                self:showFlyEnd(flyMoveCallBack)
                moveEffect:removeFromParentAndCleanup(true)
            end,
        },
    }
    TFDirector:toTween(tween)
end

function PayLayer:showFlyEnd(cbFunc)
    self.isMoved = false
    self.isShowing = false
    self.isShowStart = false

    local bar_value = TFDirector:getChildByPath(self.node_vip, 'bar_value');
    if self.endEffect == nil then
        local resPath = "effect/role_transfer_end.xml"
        if not TFFileUtil:existFile(resPath) then
            return
        end
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        local endEffect = TFArmature:create("role_transfer_end_anim")

        endEffect:setAnimationFps(GameConfig.ANIM_FPS)
        endEffect:setPosition(ccp(230, 275))
        bar_value:addChild(endEffect,100)
        
        endEffect:addMEListener(TFARMATURE_COMPLETE,function()
            endEffect:removeMEListener(TFARMATURE_COMPLETE) 
            endEffect:removeFromParentAndCleanup(true)
            self.endEffect = nil
        end)
        endEffect:playByIndex(0, -1, -1, 0)
        self.endEffect = endEffect
        local callFuncN = CCCallFuncN:create( function()
            cbFunc()
        end)
        local acArr = TFVector:create()
        local delayAc = CCDelayTime:create(0.2)
        acArr:addObject(delayAc)
        acArr:addObject(callFuncN)
        self.endEffect:runAction(CCSequence:create(acArr))
    end
end

return PayLayer;
