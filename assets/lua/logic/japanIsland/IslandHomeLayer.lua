-- client side IslandHomeLayer.lua
--[[
 * @Description: 东瀛岛进入界面
 ]]
-- script writer wuqi
-- creation time 2016-12-13

local IslandHomeLayer = class("IslandHomeLayer", BaseLayer);

CREATE_SCENE_FUN(IslandHomeLayer);
CREATE_PANEL_FUN(IslandHomeLayer);

function IslandHomeLayer:ctor(data)
    self.super.ctor(self, data);   
    self:init("lua.uiconfig_mango_new.island.IslandEntranceLayer");
end

function IslandHomeLayer:loadHomeData(data)
    self.homeInfo = data;
    self:refreshUI();
end

function IslandHomeLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function IslandHomeLayer:refreshBaseUI()

end

function IslandHomeLayer:refreshUI()
    
end

function IslandHomeLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.btn_go = TFDirector:getChildByPath(ui, 'btn_go');
    self.btn_help       = TFDirector:getChildByPath(ui, 'btn_help');
end

--填充主页信息
function IslandHomeLayer:loadHomeInfo()

end

function IslandHomeLayer.onGoClickHandle(sender)
   local self = sender.logic
   
   local function callBack()
        JapanIslandManager:requestTeamData(0)
    end
    Public:addChangeLayerEffect( callBack )
end

function IslandHomeLayer:removeUI()
    self.super.removeUI(self);
end

function IslandHomeLayer:registerEvents()
    self.super.registerEvents(self);

    self.btn_go.logic    = self;   
    self.btn_go:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onGoClickHandle),1);
    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRuleClick))

    self.onReceiveAllTeamInfo = function(event)
        local currentScene = Public:currentScene()
        if currentScene ~= nil and currentScene.getTopLayer and currentScene:getTopLayer() and currentScene:getTopLayer().__cname == "ActivityLayer" then
            JapanIslandManager:openMainIslandLayer()
        end
    end;
    TFDirector:addMEGlobalListener(JapanIslandManager.TEAM_DATA_REPONSE, self.onReceiveAllTeamInfo)
end

function IslandHomeLayer:removeEvents()
    TFDirector:removeMEGlobalListener(JapanIslandManager.TEAM_DATA_REPONSE, self.onReceiveAllTeamInfo)
    self.onReceiveAllTeamInfo = nil
    self.super.removeEvents(self);
end

function IslandHomeLayer.onRuleClick( sender )
    CommonManager:showRuleLyaer('yongchuangdongyingdao')
end
return IslandHomeLayer;
