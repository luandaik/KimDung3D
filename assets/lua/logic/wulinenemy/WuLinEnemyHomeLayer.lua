-- client side WuLinEnemyHomeLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-12-22

local WuLinEnemyHomeLayer = class("WuLinEnemyHomeLayer", BaseLayer);

CREATE_SCENE_FUN(WuLinEnemyHomeLayer);
CREATE_PANEL_FUN(WuLinEnemyHomeLayer);

function WuLinEnemyHomeLayer:ctor(data)
    self.super.ctor(self,data);
    
    self:init("lua.uiconfig_mango_new.demond.WuLinGongDiHome");
end

function WuLinEnemyHomeLayer:loadHomeData(data)
    self.homeInfo = data;
    self:refreshUI();
end

function WuLinEnemyHomeLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function WuLinEnemyHomeLayer:refreshBaseUI()

end

function WuLinEnemyHomeLayer:refreshUI()
    if not self.isShow then
        return;
    end

end

function WuLinEnemyHomeLayer:initUI(ui)
    self.super.initUI(self,ui);
    -- self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');

    self.btn_go         = TFDirector:getChildByPath(ui, 'btn_go');
    self.btn_help       = TFDirector:getChildByPath(ui, 'btn_help');
end

--填充主页信息
function WuLinEnemyHomeLayer:loadHomeInfo()

end


function WuLinEnemyHomeLayer.onGoClickHandle(sender)
    local self = sender.logic;
    local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2229)
   
    if teamLev < openLev or MultiServerFightManager:getActivityState() == 0 or MultiServerFightManager:getActivityState() == nil then
        toastMessage(localizable.WuLinEnemy_Not_Open)
        return
    end

    local activityState = WuLinEnemyManager:getActivityState()
    if activityState ~= WuLinEnemyManager.ActivityState_1 then
        toastMessage(localizable.WuLinEnemy_Open)
        return
    end 

    WuLinEnemyManager:openMainLayer()
end

function WuLinEnemyHomeLayer:removeUI()
    self.super.removeUI(self);

end

function WuLinEnemyHomeLayer:registerEvents()
    self.super.registerEvents(self);

    self.btn_go.logic    = self;   
    self.btn_go:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onGoClickHandle),1);
    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRuleClick))

end

function WuLinEnemyHomeLayer:removeEvents()
    self.super.removeEvents(self);
    -- TFDirector:removeMEGlobalListener(ClimbManager.updateHomeInfo ,self.updateHomeInfoCallBack);
end


function WuLinEnemyHomeLayer.onRuleClick( sender )
    CommonManager:showRuleLyaer('wulingongdi')
end
return WuLinEnemyHomeLayer;
