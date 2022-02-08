
local IdentifyBaseLayer = class("IdentifyBaseLayer", BaseLayer)

function IdentifyBaseLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.qiyu.Dushi")
    -- QiyuManager:SengQueryEatPigMsg()
end

function IdentifyBaseLayer:onShow()
    print("IdentifyBaseLayer onShow")
    self.super.onShow(self)
end

function IdentifyBaseLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.btn_go = TFDirector:getChildByPath(ui, 'btn_go')
    self.btn_help = TFDirector:getChildByPath(ui, 'btn_help')
    self.btn_help:setVisible(false)
    self.btn_go:setTextureNormal("ui_new/qiyu/identify/btn_jd.png")
    self.img_bg1 = TFDirector:getChildByPath(ui, "img_bg1")
    self.img_bg1:setTexture("ui_new/qiyu/identify/img_jd.jpg")
    local pos = self.btn_go:getPosition()
    self.btn_go:setPosition(ccp(pos.x + 6, pos.y + 40))
end

function IdentifyBaseLayer:registerEvents(ui)
    self.super.registerEvents(self)
    self.btn_go:addMEListener(TFWIDGET_CLICK, audioClickfun(self.goBtnClickHandle),1)
    -- self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.helpBtnClickHandle),1)
end

function IdentifyBaseLayer:removeEvents()
    self.super.removeEvents(self)
end

function IdentifyBaseLayer.goBtnClickHandle(sender)
    IdentifyMainManager:requestRoleIdentifyMsg()
end


return IdentifyBaseLayer