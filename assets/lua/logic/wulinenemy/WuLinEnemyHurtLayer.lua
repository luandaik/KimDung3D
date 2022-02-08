-- client side WuLinEnemyHurtLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-12-27

local WuLinEnemyHurtLayer = class("WuLinEnemyHurtLayer", BaseLayer)

function WuLinEnemyHurtLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.demond.WuLinGongDiBossHurt")
end

function WuLinEnemyHurtLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.panel_specialhurt = TFDirector:getChildByPath(ui, 'Panel_specialhurt')
    self.panel_normalhurt = TFDirector:getChildByPath(ui, 'Panel_normalhurt')
    self.panel_myhurt = TFDirector:getChildByPath(ui, 'Panel_myhurt')
    self.panel_myhurt:setVisible(false)

end

function WuLinEnemyHurtLayer:setInfo(challengeInfo,isHeavy)
    local panel_hurt = nil
    local actionName = "Action0"
    if isHeavy == true then
        panel_hurt = self.panel_specialhurt
        self.panel_specialhurt:setVisible(true)
        self.panel_normalhurt:setVisible(false)
        actionName = "Action1"
    else
        panel_hurt = self.panel_normalhurt
        self.panel_specialhurt:setVisible(false)
        self.panel_normalhurt:setVisible(true)
    end

    local txt_name = TFDirector:getChildByPath(panel_hurt, 'txt_name')
    local txt_damage = TFDirector:getChildByPath(panel_hurt, 'txt_damage')
    if challengeInfo.playerId == MainPlayer:getPlayerId() then
        txt_name:setText(localizable.WuLinEnemy_my_hurt)
        --txt_name:setColor(ccc3(82,228,48))
    else
        txt_name:setText(challengeInfo.name)
        --txt_name:setColor(ccc3(255,255,255))
    end
    txt_damage:setText(challengeInfo.hurt)
    self.ui:setAnimationCallBack(actionName, TFANIMATION_END, function()
        self:removeFromParent()
        end)
    self.ui:runAnimation(actionName,1)
end

function WuLinEnemyHurtLayer:onShow()
    self.super.onShow(self)
end

function WuLinEnemyHurtLayer:refreshUI()

end


--注册事件
function WuLinEnemyHurtLayer:registerEvents()
    self.super.registerEvents(self)
end

function WuLinEnemyHurtLayer:removeEvents()
    self.super.removeEvents(self)
end

return WuLinEnemyHurtLayer
