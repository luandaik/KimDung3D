-- client side TicketSuccessLayer.lua
--[[
 * @Description: 充值赠券使用成功
 ]]
-- script writer wuqi
-- creation time 2016-08-18

local TicketSuccessLayer = class("TicketSuccessLayer", BaseLayer);

function TicketSuccessLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.pay.Zengquansuccess");
    self.firstShow = true
end

function TicketSuccessLayer:initUI(ui)
    self.super.initUI(self,ui);

    self.txt_result1       = TFDirector:getChildByPath(ui, 'txt_result1')
    self.txt_result2       = TFDirector:getChildByPath(ui, 'txt_result2')
    self.img_rz_icon       = TFDirector:getChildByPath(ui, 'img_rz_icon')
end

function TicketSuccessLayer:setValue(baseValue)
    self.baseValue  = baseValue or 0
end

function TicketSuccessLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI()
    self:refreshUI()

    if self.firstShow == true then
        self.ui:runAnimation("Action0", 10);
        self.firstShow = false
    end
end

function TicketSuccessLayer:setIcon(rechargeId)
    print("---rechargeId---", rechargeId)
    self.img_rz_icon:setTexture("ui_new/pay/VIP_yb"..rechargeId..".png");
end

function TicketSuccessLayer:refreshBaseUI()

end

function TicketSuccessLayer:refreshUI()
    self.txt_result1:setText(self.baseValue)
    self.txt_result2:setText(math.floor(self.baseValue))
end

function TicketSuccessLayer:removeUI()
    self.super.removeUI(self);
end

--注册事件
function TicketSuccessLayer:registerEvents()
   self.super.registerEvents(self)

   ADD_ALERT_CLOSE_LISTENER(self, self.ui)
end

function TicketSuccessLayer:removeEvents()
    self.firstShow = true
end


return TicketSuccessLayer