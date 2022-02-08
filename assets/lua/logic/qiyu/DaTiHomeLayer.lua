
local DaTiHomeLayer = class("DaTiHomeLayer", BaseLayer)

function DaTiHomeLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.qiyu.JiangHuYaJiLayer")
    -- QiyuManager:SengQueryEatPigMsg()
end

function DaTiHomeLayer:onShow()
    print("DaTiHomeLayer onShow")
    self.super.onShow(self)
end

function DaTiHomeLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.btn_go = TFDirector:getChildByPath(ui, 'btn_go')
    self.btn_help = TFDirector:getChildByPath(ui, 'btn_help')
    self.btn_help:setVisible(false)
end

function DaTiHomeLayer:registerEvents(ui)
    self.super.registerEvents(self)
    self.btn_go:addMEListener(TFWIDGET_CLICK, audioClickfun(self.goBtnClickHandle),1)
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.helpBtnClickHandle),1)
end

function DaTiHomeLayer:removeEvents()
    self.super.removeEvents(self)
end

function DaTiHomeLayer.goBtnClickHandle(sender)
    DaTiManager:openDaTiMainLayer()
end

function DaTiHomeLayer.helpBtnClickHandle(sender)
    -- CommonManager:showRuleLyaer("dushi")
end

return DaTiHomeLayer