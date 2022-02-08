--[[
  天书分解确认
]]

local TianShuFenJieQueRenLayer = class("TianShuFenJieQueRenLayer", BaseLayer)

function TianShuFenJieQueRenLayer:ctor(data)
    self.super.ctor(self,data)
    
    self:init("lua.uiconfig_mango_new.tianshu.FenJieTianShuQueRen")
end

function TianShuFenJieQueRenLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.btn_ok = TFDirector:getChildByPath(ui, "btn_ok")
    self.btn_cancel = TFDirector:getChildByPath(ui, "btn_cancel")
    self.txt_message = TFDirector:getChildByPath(ui, "txt_message")
    self.btn_ok.logic = self
    self.btn_cancel.logic = self
end

function TianShuFenJieQueRenLayer:loadData(data)
    self.instanceId = data
end

function TianShuFenJieQueRenLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function TianShuFenJieQueRenLayer:refreshUI()
    self.txt_message:setText(localizable.SkyBookManager_text10)    
end

function TianShuFenJieQueRenLayer.onQueRenHandle(sender)
    local self = sender.logic
    if (self:Panduanqianghua( )>0) then        
        --获得分解物品
        SkyBookManager:requestBibleFenJie(self.instanceId)
        AlertManager:closeLayer(self)         
    else        
        local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianShuFenJieQueRen2Layer", AlertManager.BLOCK_AND_GRAY)
        layer:loadData(self.instanceId)
        AlertManager:show()
        AlertManager:closeLayer(self)
    end
end

function TianShuFenJieQueRenLayer:Panduanqianghua( )
    self.item = SkyBookManager:getItemByInstanceId(self.instanceId)
    local status = 0
    local quality = self.item.config.quality
    if quality > 3 then
        self.nowItemAttr   = SkyBookManager:getByIdCanWuInfo(self.instanceId)        
        if (self.nowItemAttr == nil) then
        --打开天书时没有参悟初始化参悟数据
            SkyBookManager:addCanWuInfo( self.instanceId, quality)
            self.nowItemAttr   = SkyBookManager:getByIdCanWuInfo(self.instanceId)
        end
        --天书研修
        self.bibleInfo  = SkyBookManager:getItemByInstanceId( self.instanceId ) 
        self.chapterId  = self.bibleInfo.chapterId
        self.entryId    = self.bibleInfo.entryId
        if (self.chapterId == 1 and self.entryId > 0) or (self.chapterId > 1)then
            status = 1
        end    
        --天书注解
        for i = 1 ,5 do
            if(self.item.chongzhuData[i].level ~= 0)then
                status = 1
            end
        end
        if self.nowItemAttr.useCount ~= 0  then
            status = 1
        end
    end
    if status == 0  then
        return 1        
    else 
        return -1
    end
end

function TianShuFenJieQueRenLayer.onQvxiaoHandle(sender)
    local self = sender.logic
    local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianshuMainLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(self.instanceId)
    AlertManager:show()
    AlertManager:closeLayer(self)
end

function TianShuFenJieQueRenLayer:registerEvents()
   self.super.registerEvents(self)
   self.btn_ok:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onQvxiaoHandle), 1)
   self.btn_cancel:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onQueRenHandle), 1)
end

return TianShuFenJieQueRenLayer

