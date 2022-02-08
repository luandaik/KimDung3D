--[[
  天书分解确认2
]]

local TianShuFenJieQueRen2Layer = class("TianShuFenJieQueRen2Layer", BaseLayer)

function TianShuFenJieQueRen2Layer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.tianshu.FenJieTianShuQueRen2")
end

function TianShuFenJieQueRen2Layer:loadData(data)
    self.instanceId = data
end

function TianShuFenJieQueRen2Layer:initUI(ui)
    self.super.initUI(self, ui)
    self.btn_ok = TFDirector:getChildByPath(ui, "btn_ok")
    self.btn_cancel = TFDirector:getChildByPath(ui, "btn_cancel")
    self.txt_message = TFDirector:getChildByPath(ui, "txt_message")
    self.btn_ok.logic = self
    self.btn_cancel.logic = self
end


function TianShuFenJieQueRen2Layer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function TianShuFenJieQueRen2Layer:refreshUI()
    self.txt_message:setText(localizable.SkyBookManager_text9)    
end

function TianShuFenJieQueRen2Layer.onFenjieHandle(sender)
    local self = sender.logic
    SkyBookManager:requestBibleFenJie(self.instanceId)
    AlertManager:closeLayer(self)    
end

function TianShuFenJieQueRen2Layer.onQvxiaoHandle(sender)
    local self = sender.logic
    local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianshuMainLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(self.instanceId)
    AlertManager:show()
    AlertManager:closeLayer(self)
end

function TianShuFenJieQueRen2Layer:registerEvents()
   self.super.registerEvents(self)
   self.btn_ok:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onQvxiaoHandle), 1)
   self.btn_cancel:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onFenjieHandle), 1)
end

return TianShuFenJieQueRen2Layer