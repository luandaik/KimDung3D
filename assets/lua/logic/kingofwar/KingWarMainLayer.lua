
-- client side KingWarMainLayer.lua
--[[
 * @Description: 王者争霸-主界面
 ]]
-- script writer Happy.All
-- creation time 2016-11-2 12:07:18
local KingWarMainLayer = class("KingWarMainLayer",BaseLayer)


function KingWarMainLayer:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossarena.KingWarMain")
end

function KingWarMainLayer:initUI( ui )

	self.super.initUI(self, ui)

   self:initLayerList()
   self:switchLayer()  
end

function KingWarMainLayer:initLayerList()

    local layerFileName = {
        "lua.logic.kingofwar.KingWarSignUpLayer",
        "lua.logic.kingofwar.KingWarScoreFightLayer",
        "lua.logic.kingofwar.KingWarFinalFightLayer",
        "lua.logic.kingofwar.KingWarCrossArenaResult",
    }
    self.layerList = {}
    for _,fileName in pairs(layerFileName) do
        local layer = {}
        layer.name = fileName
        layer.layerNode = nil
        table.insert(self.layerList, layer)
    end

    self.currLayer = nil
end

function KingWarMainLayer:switchLayer()
    
    AlertManager:closeAllBeforLayer(self)
    local state = KingOfWarManager:getActivityState()
    print("state ============== ",state)
    print("state ============== ",state)
    print("state ============== ",state)    
    if self.currLayer and self.currLayer.layerNode then
        self.currLayer.layerNode:removeEvents()
        self.currLayer.layerNode:setVisible(false)
    end
    --请求宝箱信息
    KingOfWarManager:sendrequestBetRate()
    if state == KingOfWarManager.ActivityState_SignUp then
        local layerType = 0
        if KingOfWarManager:checkIsInTeam() == true then
            layerType = 1
        end
        local layer = self.layerList[1]
        if layer.layerNode == nil then
            layer.layerNode = require(layer.name):new()
            self.ui:addChild(layer.layerNode)
        end
        layer.layerNode:registerEvents()
        layer.layerNode:setVisible(true)
        layer.layerNode:setLayerType(layerType)
        self.currLayer = layer
    elseif state == KingOfWarManager.ActivityState_Score then
        local layer = self.layerList[2]
        if layer.layerNode == nil then
            layer.layerNode = require(layer.name):new()
            self.ui:addChild(layer.layerNode)
        end
        layer.layerNode:registerEvents()
        layer.layerNode:setVisible(true)
        layer.layerNode:setData()
        self.currLayer = layer
    elseif state == KingOfWarManager.ActivityState_Betting or state == KingOfWarManager.ActivityState_Final or state == KingOfWarManager.ActivityState_Result then
        local layer = self.layerList[3]
        if layer.layerNode == nil then
            layer.layerNode = require(layer.name):new()
            self.ui:addChild(layer.layerNode)
        end
        layer.layerNode:registerEvents()
        layer.layerNode:setVisible(true)
        layer.layerNode:setData()
        self.currLayer = layer
    elseif state == KingOfWarManager.ActivityState_End then
        local layer = self.layerList[4]
        if layer.layerNode == nil then
            layer.layerNode = require(layer.name):new()
            self.ui:addChild(layer.layerNode)
        end
        layer.layerNode:registerEvents()
        layer.layerNode:setVisible(true)
        -- layer.layerNode:setData()
        self.currLayer = layer
    end
end

function KingWarMainLayer:removeUI()
	self.super.removeUI(self)
end

function KingWarMainLayer:onShow()
    self.super.onShow(self)
    if self.currLayer and self.currLayer.layerNode then
        self.currLayer.layerNode:onShow()
    end
end

function KingWarMainLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)

    self.NeedSwitchLayerMsgCallBack = function (event)
        self:switchLayer()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.NeedSwitchLayerMsg, self.NeedSwitchLayerMsgCallBack)


    self.registerEventCallFlag = true 
end

function KingWarMainLayer:removeEvents()

    self.super.removeEvents(self)	

    if self.NeedSwitchLayerMsgCallBack then
        TFDirector:removeMEGlobalListener(KingOfWarManager.NeedSwitchLayerMsg, self.NeedSwitchLayerMsgCallBack)
        self.NeedSwitchLayerMsgCallBack = nil
    end
    for k,v in pairs(self.layerList) do
        if v and v.layerNode then
            v.layerNode:removeEvents()
        end
    end

    self.registerEventCallFlag = nil  
end

return KingWarMainLayer