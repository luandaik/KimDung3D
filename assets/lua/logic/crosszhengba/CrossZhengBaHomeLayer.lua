-- client side CrossZhengBaHomeLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-03-04

local CrossZhengBaHomeLayer = class("CrossZhengBaHomeLayer", BaseLayer);

CREATE_SCENE_FUN(CrossZhengBaHomeLayer);
CREATE_PANEL_FUN(CrossZhengBaHomeLayer);

function CrossZhengBaHomeLayer:ctor(data)
    self.super.ctor(self, data);   
    self:init("lua.uiconfig_mango_new.crosszhenba.CrossZhengBaHomeLayer");
end

function CrossZhengBaHomeLayer:loadHomeData(data)
    self.homeInfo = data;
    self:refreshUI();
end

function CrossZhengBaHomeLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function CrossZhengBaHomeLayer:refreshBaseUI()

end

function CrossZhengBaHomeLayer:refreshUI()
    
end

function CrossZhengBaHomeLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.btn_go = TFDirector:getChildByPath(ui, 'btn_go');
    self.btn_help = TFDirector:getChildByPath(ui, 'btn_help');
end

--填充主页信息
function CrossZhengBaHomeLayer:loadHomeInfo()

end

function CrossZhengBaHomeLayer.onGoClickHandle(sender)
    local self = sender.logic;
    if MainPlayer:getServerSwitchStatue(ServerSwitchType.CrossZhengBa ) ~= true then
        toastMessage(localizable.commom_no_open2)
        return
    end
    if CommonManager:IsOpenServerGroup() == false then
        toastMessage(localizable.commom_no_open2)
        return
    end
    local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2227)
    if teamLev < openLev then
        toastMessage(stringUtils.format(localizable.common_function_openlevel,openLev))
        return
    end

    CrossZhengBaManager:openMainLayer()
end

function CrossZhengBaHomeLayer:removeUI()
    self.super.removeUI(self);

end

function CrossZhengBaHomeLayer:registerEvents()
    self.super.registerEvents(self);

    self.btn_go.logic    = self;   
    self.btn_go:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onGoClickHandle),1);
    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRuleClick))

end

function CrossZhengBaHomeLayer:removeEvents()
    self.super.removeEvents(self);
end
function CrossZhengBaHomeLayer.onRuleClick( sender )
    CommonManager:showRuleLyaer('tianjiezhengba')
end
return CrossZhengBaHomeLayer;
