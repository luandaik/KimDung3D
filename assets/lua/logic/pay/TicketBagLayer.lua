-- client side TicketBagLayer.lua
--[[
 * @Description: 充值赠券背包
 ]]
-- script writer wuqi
-- creation time 2016-08-18

local TicketBagLayer = class("TicketBagLayer", BaseLayer);
TicketBagLayer.kMaxTicketNum = 6
TicketBagLayer.StrBtnImg = 
{
    [1] = {Normal = "ui_new/pay/btn_jinri2.png", Selected = "ui_new/pay/btn_jinri.png"},
    [2] = {Normal = "ui_new/pay/btn_mingri2.png", Selected = "ui_new/pay/btn_mingri1.png"}
}

function TicketBagLayer:ctor(data)
    self.super.ctor(self, data);
    self:init("lua.uiconfig_mango_new.pay.Zengquanbag")
    self.selectIndex = 1
end

function TicketBagLayer:initUI(ui)
    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_close.logic = self
    
    self.img_quan = {}
    for i = 1, self.kMaxTicketNum do
        self.img_quan[i] = TFDirector:getChildByPath(ui, "img_quan" .. i)
    end
    self.btn_tab = {}
    self.btn_tab[1] = TFDirector:getChildByPath(ui, "btn_today")
    self.btn_tab[2] = TFDirector:getChildByPath(ui, "btn_tomorrow")
    for i = 1, 2 do
        self.btn_tab[i].logic = self
        self.btn_tab[i].index = i
    end

    self.btn_help = TFDirector:getChildByPath(ui, "btn_help")
    self.btn_help.logic = self

    self.txt_shuoming = TFDirector:getChildByPath(ui, "txt-shuoming")
end

function TicketBagLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI()
    self:refreshUI()
end

function TicketBagLayer:refreshBaseUI()

end

function TicketBagLayer:refreshUI()
    self:refreshTabTexture()
    self:refreshList()
    self:refreshContent()
    self:refreshShuoming()
end

function TicketBagLayer:refreshContent()
    for i = 1, self.kMaxTicketNum do
        self:refreshCell(self.img_quan[i], i)
    end
end

function TicketBagLayer:refreshShuoming()
    if self.selectIndex == 1 then
        self.txt_shuoming:setText(localizable.RechargeTicket_shuoming_today)
    else
        self.txt_shuoming:setText(localizable.RechargeTicket_shuoming_tomorrow)
    end
end

function TicketBagLayer:refreshCell(panel, index)
    local img_iconbg = TFDirector:getChildByPath(panel, "img_iconbg")
    local img_icon = TFDirector:getChildByPath(panel, "img_icon")
    local txt_shuliang = TFDirector:getChildByPath(panel, "txt_shuliang")
    local txt_number1 = TFDirector:getChildByPath(panel, "txt_number1")
    local txt_number2 = TFDirector:getChildByPath(panel, "txt_number2")

    img_icon:setTexture("ui_new/pay/ticket_icon" .. index .. ".png")

    local data = RechargeTicketManager:getBagLayerNeedData(self.ticketList, index)
    --[[
    if data.num == 0 then
        txt_shuliang:setVisible(false)
    else
        txt_shuliang:setVisible(true)
        txt_shuliang:setText(data.num)
    end
    ]]
    CommonManager:setRedPoint( img_iconbg, (data.num > 0) and ( self.selectIndex == 1 ), "RechargeTicket" .. index, ccp(10, 5))
    txt_shuliang:setText(data.num)
end

function TicketBagLayer:removeUI()
    self.super.removeUI(self);
end

function TicketBagLayer:registerEvents()
   self.super.registerEvents(self)

   ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
   for i = 1, 2 do
        self.btn_tab[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTabClickHandle), 1)
   end 
   self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClickHandle), 1)
   self.onResetCallBack = function()
       self:refreshUI()
   end
   TFDirector:addMEGlobalListener(MainPlayer.GAME_RESET, self.onResetCallBack)

   self.onTicketChangeCallBack = function()
        self:refreshUI()
    end
   TFDirector:addMEGlobalListener(RechargeTicketManager.RECHARGE_TICKET_CHANGE_RESPONSE, self.onTicketChangeCallBack)
end

function TicketBagLayer.onTabClickHandle(sender)
    local self = sender.logic
    local index = sender.index
    self:select(index)
end

function TicketBagLayer.onHelpClickHandle(sender)
    CommonManager:showRuleLyaer('bonusticket')
end

function TicketBagLayer:select(index)
    if self.selectIndex == index then
        return
    end
    self.selectIndex = index
    self:refreshUI()
end

function TicketBagLayer:refreshTabTexture()
    local index = self.selectIndex
    for i = 1, 2 do
        if i == index then
            self.btn_tab[index]:setTextureNormal(self.StrBtnImg[index].Selected)
        else
            self.btn_tab[i]:setTextureNormal(self.StrBtnImg[i].Normal)
        end
    end
end

function TicketBagLayer:refreshList()
    self.ticketList = RechargeTicketManager:getListByType(self.selectIndex) 
end

function TicketBagLayer:removeEvents()
    TFDirector:removeMEGlobalListener(MainPlayer.GAME_RESET, self.onResetCallBack)
    self.onResetCallBack = nil

    TFDirector:removeMEGlobalListener(RechargeTicketManager.RECHARGE_TICKET_CHANGE_RESPONSE, self.onTicketChangeCallBack)
    self.onTicketChangeCallBack = nil
end

return TicketBagLayer;
