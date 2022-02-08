
-- client side KingWarRedPackLayer.lua
--[[
 * @Description: 王者争霸-红包
 ]]
-- script writer Happy.All
-- creation time 2016-11-2 12:07:18
local KingWarRedPackLayer = class("KingWarRedPackLayer",BaseLayer)


function KingWarRedPackLayer:ctor(data)
	self.super.ctor(self, data)
    self.data = data
	self:init("lua.uiconfig_mango_new.crossarena.KingWarRedPack")    

end

function KingWarRedPackLayer:initUI( ui )
	self.super.initUI(self, ui)
    local panel_red = TFDirector:getChildByPath(ui, "panel_red")

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/KingWarRedPacket.xml")
    local effect = TFArmature:create("KingWarRedPacket_anim")
    effect:setPosition(ccp(0,40))
    panel_red:addChild(effect,120)
    effect:playByIndex(0,-1,-1,0)
    effect:setVisible(true)
    self.enableTouch = false
    effect:addMEListener(TFARMATURE_COMPLETE,function()
        self.enableTouch = true
        effect:removeMEListener(TFARMATURE_COMPLETE)
        effect:playByIndex(1,-1,-1,1)
    end)
    
    -- local serverInfo = SaveManager:getServerInfo(self.data.serverId) or {}
    local serverName = ""
    if self.data.serverId then
        local serverId =  self.data.serverId%1000
        serverName = "S"..serverId
    end
    
    local nameStr = localizable.KingWarRedPackTips .. serverName .. self.data.name
    local playerName = TFDirector:getChildByPath(ui, "txt_name")
    playerName:setText(nameStr)
    local imgbg = TFDirector:getChildByPath(ui, "imgbg")
    imgbg:setPositionY(-80)
end

function KingWarRedPackLayer:removeUI()
	self.super.removeUI(self)
end

function KingWarRedPackLayer:onShow()
    self.super.onShow(self)
end

function KingWarRedPackLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)

    self.ui.logic = self
    self.ui:setTouchEnabled(true)
    self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRedPacketClick))

    self.registerEventCallFlag = true 
end

function KingWarRedPackLayer:removeEvents()

    self.super.removeEvents(self)
    self.registerEventCallFlag = nil  
end

function KingWarRedPackLayer:dispose()
	self.super.dispose(self)

end

function KingWarRedPackLayer.onRedPacketClick( btn )
    local self = btn.logic
    if self.enableTouch then
        KingOfWarManager:requestRedPacket()
        AlertManager:close()
    end
end
return KingWarRedPackLayer