--[[
******大小月卡*******

    -- by quanhuan
    -- 2015-10-9 15:19:43
    1.小月卡
    2.大月卡
]]
local MonthCardLayer = class("MonthCardLayer", BaseLayer);

function MonthCardLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.pay.Card");
end

function MonthCardLayer:initUI(ui)
    self.super.initUI(self,ui);

    self.Btn_Close = TFDirector:getChildByPath(ui, 'Btn_Close')

    self.Card1 = TFDirector:getChildByPath(ui, 'Card1')
    self.Img_jihuo1 = TFDirector:getChildByPath(self.Card1, 'Img_jihuo')
    self.txt_day1 = TFDirector:getChildByPath(self.Card1, 'txt_day')
    self.Btn_get1 = TFDirector:getChildByPath(self.Card1, 'Btn_get')
    self.Btn_got1 = TFDirector:getChildByPath(self.Card1, 'Btn_got')
    self.Btn_buy1 = TFDirector:getChildByPath(self.Card1, 'Btn_buy')
    self.Btn_chongzhi1 = TFDirector:getChildByPath(self.Card1, 'Btn_chongzhi')
    self.price_down1 = TFDirector:getChildByPath(self.Card1, 'txt_price')
    self.Img_morepay1 = TFDirector:getChildByPath(self.Card1, 'Img_morepay')
    self.Label_Card_1 = TFDirector:getChildByPath(self.Card1, 'Label_Card_1')
    self.Btn_xufei1   = TFDirector:getChildByPath(self.Card1, 'btn_xufei')
    self.img_sanbei1 = TFDirector:getChildByPath(self.Card1, 'img_sanbei')

    self.Card2 = TFDirector:getChildByPath(ui, 'Card2')
    self.Img_jihuo2 = TFDirector:getChildByPath(self.Card2, 'Img_jihuo')
    self.txt_day2 = TFDirector:getChildByPath(self.Card2, 'txt_day')
    self.Btn_get2 = TFDirector:getChildByPath(self.Card2, 'Btn_get')
    self.Btn_got2 = TFDirector:getChildByPath(self.Card2, 'Btn_got')
    self.Btn_buy2 = TFDirector:getChildByPath(self.Card2, 'Btn_buy')
    self.Btn_chongzhi2 = TFDirector:getChildByPath(self.Card2, 'Btn_chongzhi')
    self.price_down2 = TFDirector:getChildByPath(self.Card2, 'txt_price')
    self.Img_morepay2 = TFDirector:getChildByPath(self.Card2, 'Img_morepay')
    self.Label_Card_2 = TFDirector:getChildByPath(self.Card2, 'Label_Card_1')
    self.Btn_xufei2   = TFDirector:getChildByPath(self.Card2, 'btn_xufei')
    self.img_sanbei2 = TFDirector:getChildByPath(self.Card2, 'img_sanbei')

    self.img_yijihuo   = TFDirector:getChildByPath(ui, 'img_yijihuo')
    self.img_weijihuo   = TFDirector:getChildByPath(ui, 'img_weijihuo')
    self.img_yueka   = TFDirector:getChildByPath(ui, 'img_yueka')
    self.panel_sykd = TFDirector:getChildByPath(ui, 'panel_sykd')
    local bg_icon = TFDirector:getChildByPath(self.panel_sykd, 'bg_icon')
    bg_icon:setTouchEnabled(true)
    function onClick( sender )
      Public:ShowItemTipLayer(40343, EnumDropType.GOODS);
    end
    bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
    self.btn_sykdget = TFDirector:getChildByPath(self.panel_sykd, 'btn_get')

    self.Btn_chongzhi1:setVisible(false)
    self.Btn_chongzhi2:setVisible(false)

    self.Btn_xufei1:setVisible(false)
    self.Btn_xufei2:setVisible(false)

    self.Btn_got1:setTouchEnabled(false)
    self.Btn_got2:setTouchEnabled(false)

    local cardInfo1 = MonthCardManager:getBtnStatus( MonthCardManager.CARD_TYPE_1 ) 
    self.price_down1:setText(cardInfo1.RMB)
    self.YB_1 = cardInfo1.YB
    self.Label_Card_1:setText(cardInfo1.RMB*10)

    local cardInfo2 = MonthCardManager:getBtnStatus( MonthCardManager.CARD_TYPE_2 ) 
    self.price_down2:setText(cardInfo2.RMB)
    self.YB_2 = cardInfo2.YB
    self.Label_Card_2:setText(cardInfo2.RMB*10)

    self.isShow = true

    Public:addBtnWaterEffect(self.Btn_buy1, true,0)
    Public:addBtnWaterEffect(self.Btn_buy2, true,0)

    self.img_weijihuo:setVisible(true)
    self.img_yijihuo:setVisible(false)
    
    self:freshLabelCardInfo()
    -- self.Label_Card_1:setText(cardInfo1.sycee)
    -- self.Label_Card_2:setText(cardInfo2.sycee)
end

function MonthCardLayer:onShow()
    self.super.onShow(self)
    self:refreshUI();
end

function MonthCardLayer:refreshUI()

    if self.isShow then
        self:refreshCard_1()
        self:refreshCard_2()
        self:refreshCard_3() -- 双月卡奖励
        local state = MonthCardManager:isExistMonthCard( MonthCardManager.CARD_TYPE_3 ) 
        if state then
            self.img_yijihuo:setVisible(true)
            self.img_weijihuo:setVisible(false)
        else
            self.img_yijihuo:setVisible(false)
            self.img_weijihuo:setVisible(true)
        end
    end
end

--注册事件
function MonthCardLayer:registerEvents()
    self.super.registerEvents(self);

    self.onCloseClickHandle = function ()
        AlertManager:close()
    end    
    self.Btn_Close:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onCloseClickHandle),1)

    self.onBuyClickHandle_1 = function ()
        MonthCardManager:chongzhi(MonthCardManager.CARD_TYPE_1)
    end
    self.Btn_buy1:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onBuyClickHandle_1),1)

    self.Btn_xufei1:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onBuyClickHandle_1),1)

    self.onBuyClickHandle_2 = function ()
        MonthCardManager:chongzhi(MonthCardManager.CARD_TYPE_2)
    end
    self.Btn_buy2:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onBuyClickHandle_2),1)

    self.Btn_xufei2:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onBuyClickHandle_2),1)

    self.onGetClickHandle_1 = function ()
        MonthCardManager:lingqu(MonthCardManager.CARD_TYPE_1)
    end
    self.Btn_get1:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onGetClickHandle_1),1)

    self.onGetClickHandle_2 = function ()
        MonthCardManager:lingqu(MonthCardManager.CARD_TYPE_2)
    end
    self.Btn_get2:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onGetClickHandle_2),1)

    self.btn_sykdget:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onDoubleBuffRewardGetClick),1)
    self.btn_sykdget.logic = self
    self.onLingquComlete = function( event )
        play_chongzhichenggong()
        local data = event.data[1]
         if data[1] == 1 then
            --toastMessage("已领取"..self.YB_1.."元宝")
            toastMessage(stringUtils.format(localizable.common_get_gold,self.YB_1))
        else
            --toastMessage("已领取"..self.YB_2.."元宝")
            toastMessage(stringUtils.format(localizable.common_get_gold,self.YB_2))
        end
    end
    TFDirector:addMEGlobalListener(MonthCardManager.MONTH_CARD_LINGQU_COMPELTE, self.onLingquComlete)


    self.onWindowUpdate = function ()
        self:onShow()
    end
    TFDirector:addMEGlobalListener(MonthCardManager.MONTH_CARD_INFO_UPDATE, self.onWindowUpdate)
    self.monthCardMarkRefesh = function ()
        self:freshLabelCardInfo()
    end
    TFDirector:addMEGlobalListener(MonthCardManager.MONTH_CardMARK_RefeshAttr, self.monthCardMarkRefesh)

end

function MonthCardLayer:removeEvents()

    self.Btn_Close:removeMEListener(TFWIDGET_CLICK)
    self.Btn_buy1:removeMEListener(TFWIDGET_CLICK)
    self.Btn_buy2:removeMEListener(TFWIDGET_CLICK)
    self.Btn_get1:removeMEListener(TFWIDGET_CLICK)
    self.Btn_get2:removeMEListener(TFWIDGET_CLICK)

    TFDirector:removeMEGlobalListener(MonthCardManager.MONTH_CARD_LINGQU_COMPELTE, self.onLingquComlete)
    TFDirector:removeMEGlobalListener(MonthCardManager.MONTH_CARD_INFO_UPDATE, self.onWindowUpdate)
    TFDirector:removeMEGlobalListener(MonthCardManager.MONTH_CardMARK_RefeshAttr, self.monthCardMarkRefesh)
    self.monthCardMarkRefesh = nil

end

function MonthCardLayer:removeUI()
   self.super.removeUI(self);
end


function MonthCardLayer:refreshCard_1()

    local btnInfo = MonthCardManager:getBtnStatus( MonthCardManager.CARD_TYPE_1 ) 
    local status = btnInfo.btnStatus
    self.Img_morepay1:setVisible(true)
    if status == MonthCardManager.BTN_STATUS_PAY then
        self.txt_day1:setVisible(true)
        --self.txt_day1:setText("持续 30 天")
        self.txt_day1:setText(stringUtils.format(localizable.MonthCardLayer_text1,30))

        self.Btn_get1:setVisible(false)
        self.Btn_got1:setVisible(false)
        self.Btn_buy1:setVisible(true)
        self.Btn_xufei1:setVisible(false)
        self.Img_jihuo1:setVisible(false)
        --
    elseif status == MonthCardManager.BTN_STATUS_GET then
        self.txt_day1:setVisible(true)
        --self.txt_day1:setText("持续 "..btnInfo.day.." 天")
        self.txt_day1:setText(stringUtils.format(localizable.MonthCardLayer_text1,btnInfo.day))

        self.Btn_get1:setVisible(true)
        self.Btn_got1:setVisible(false)
        self.Btn_buy1:setVisible(false)
        self.Btn_xufei1:setVisible(true)
        self.Img_jihuo1:setVisible(true)
        --self.Img_morepay1:setVisible(false)
    else
        self.txt_day1:setVisible(true)
        --self.txt_day1:setText("持续 "..btnInfo.day.." 天")
        self.txt_day1:setText(stringUtils.format(localizable.MonthCardLayer_text1,btnInfo.day))

        self.Btn_get1:setVisible(false)
        self.Btn_got1:setVisible(true)
        self.Btn_buy1:setVisible(false)
        self.Btn_xufei1:setVisible(true)
        self.Img_jihuo1:setVisible(true)
        --self.Img_morepay1:setVisible(false)
    end
end

function MonthCardLayer:refreshCard_2()

    local btnInfo = MonthCardManager:getBtnStatus( MonthCardManager.CARD_TYPE_2 ) 
    local status = btnInfo.btnStatus
    self.Img_morepay2:setVisible(true)
    self.YB_2 = btnInfo.YB
    if status == MonthCardManager.BTN_STATUS_PAY then
        self.txt_day2:setVisible(true)
        --self.txt_day2:setText("持续 30 天")
        self.txt_day2:setText(stringUtils.format(localizable.MonthCardLayer_text1, 30))

        self.Btn_get2:setVisible(false)
        self.Btn_got2:setVisible(false)
        self.Btn_buy2:setVisible(true)
        self.Btn_xufei2:setVisible(false)
        self.Img_jihuo2:setVisible(false)
        
    elseif status == MonthCardManager.BTN_STATUS_GET then
        self.txt_day2:setVisible(true)
        --self.txt_day2:setText("持续 "..btnInfo.day.." 天")
        self.txt_day2:setText(stringUtils.format(localizable.MonthCardLayer_text1,btnInfo.day))
        self.Btn_get2:setVisible(true)
        self.Btn_got2:setVisible(false)
        self.Btn_buy2:setVisible(false)
        self.Btn_xufei2:setVisible(true)
        self.Img_jihuo2:setVisible(true)
        --self.Img_morepay2:setVisible(false)
    else
        self.txt_day2:setVisible(true)
        --self.txt_day2:setText("持续 "..btnInfo.day.." 天")
        self.txt_day2:setText(stringUtils.format(localizable.MonthCardLayer_text1,btnInfo.day))
        self.Btn_get2:setVisible(false)
        self.Btn_got2:setVisible(true)
        self.Btn_buy2:setVisible(false)
        self.Btn_xufei2:setVisible(true)
        self.Img_jihuo2:setVisible(true)
        --self.Img_morepay2:setVisible(false)
    end

    
end

function MonthCardLayer:freshLabelCardInfo()
    local cardInfo1 = MonthCardManager:getBtnStatus( MonthCardManager.CARD_TYPE_1 ) 
    

    if MonthCardManager.cardMark[1] and MonthCardManager.cardMark[1] == 0 then
        -- self.Label_Card_1:setText(cardInfo1.sycee+cardInfo1.extra_sycee)
        self.Label_Card_1:setText(cardInfo1.sycee .. "x3")
        self.Label_Card_1:setFontSize(24)
        self.img_sanbei1:setVisible(true)
    else
        self.Label_Card_1:setText(cardInfo1.sycee)
        self.Label_Card_1:setFontSize(26)
        self.img_sanbei1:setVisible(false)
    end
    local cardInfo2 = MonthCardManager:getBtnStatus( MonthCardManager.CARD_TYPE_2 ) 
    if MonthCardManager.cardMark[2] and MonthCardManager.cardMark[2] == 0 then
        -- self.Label_Card_2:setText(cardInfo2.sycee+cardInfo2.extra_sycee)
        self.Label_Card_2:setText(cardInfo2.sycee .. "x3")
        self.Label_Card_2:setFontSize(24)
        self.Label_Card_2:setScaleX(0.8)
        self.img_sanbei2:setVisible(true)
    else
        self.Label_Card_2:setText(cardInfo2.sycee)
        self.Label_Card_2:setFontSize(26)
        self.Label_Card_2:setScaleX(1)
        self.img_sanbei2:setVisible(false)
    end
end

function MonthCardLayer:refreshCard_3()
    local dataInfo = MonthCardManager:getBtnStatus(3)
    if dataInfo == nil or dataInfo.btnStatus == nil or dataInfo.btnStatus == MonthCardManager.BTN_STATUS_PAY then
        self.btn_sykdget:setTextureNormal("ui_new/pay/btn_lingqu4.png")
        CommonManager:setRedPoint(self.btn_sykdget, false,"btn_sykdget",ccp(0,0))
    elseif dataInfo.btnStatus == MonthCardManager.BTN_STATUS_GET then
        self.btn_sykdget:setTextureNormal("ui_new/pay/btn_lingqu3.png")
        CommonManager:setRedPoint(self.btn_sykdget, true,"btn_sykdget",ccp(0,0))
    elseif dataInfo.btnStatus == MonthCardManager.BTN_STATUS_GOT then
        self.btn_sykdget:setTextureNormal("ui_new/pay/btn_lingqu5.png")
        CommonManager:setRedPoint(self.btn_sykdget, false,"btn_sykdget",ccp(0,0))
    end
end

function MonthCardLayer.onDoubleBuffRewardGetClick( sender )
    local self = sender.logic
    local dataInfo = MonthCardManager:getBtnStatus(3)
    if dataInfo == nil or dataInfo.btnStatus == nil or dataInfo.btnStatus == MonthCardManager.BTN_STATUS_PAY then
        toastMessage(localizable.MonthCardLayer_shuangyueka)
    elseif dataInfo.btnStatus == MonthCardManager.BTN_STATUS_GET then
        MonthCardManager:getDoubleBuffReward()
    elseif dataInfo.btnStatus == MonthCardManager.BTN_STATUS_GOT then
    end
end

return MonthCardLayer;
