-- client side XilingHomeLayer.lua
--[[
 * @Description: 西岭进入界面
 ]]
-- script writer wuqi
-- creation time 2016-06-27

local XilingHomeLayer = class("XilingHomeLayer", BaseLayer);

CREATE_SCENE_FUN(XilingHomeLayer);
CREATE_PANEL_FUN(XilingHomeLayer);

function XilingHomeLayer:ctor(data)
    self.super.ctor(self, data);   
    self:init("lua.uiconfig_mango_new.climb.XilingHomeLayer");
end

function XilingHomeLayer:loadHomeData(data)
    self.homeInfo = data;
    self:refreshUI();
end

function XilingHomeLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function XilingHomeLayer:refreshBaseUI()

end

function XilingHomeLayer:refreshUI()
    
end

function XilingHomeLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.btn_go = TFDirector:getChildByPath(ui, 'btn_go');
    self.btn_help       = TFDirector:getChildByPath(ui, 'btn_help');
end

--填充主页信息
function XilingHomeLayer:loadHomeInfo()

end

function XilingHomeLayer.onGoClickHandle(sender)
   local self = sender.logic;

   if WestClimbManager:getActivityStatus() == 1 then
        toastMessage(localizable.Xiling_server_closed)
        return
    end

    WestClimbManager:requestSeasonInfo()
end

function XilingHomeLayer:removeUI()
    self.super.removeUI(self);

end

function XilingHomeLayer:registerEvents()
    self.super.registerEvents(self);

    self.btn_go.logic    = self;   
    self.btn_go:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onGoClickHandle),1);
    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRuleClick))

    self.onReceiveSerdangSeasonInfo = function(event)
        local data = event.data[1]        
        if data then
            if (not data.champions) then
                toastMessage(localizable.Xiling_txt_enough2)
                return
            end
            if (not data.isPassCave) then
                toastMessage(stringUtils.format(localizable.Xiling_txt_enough1, WestClimbManager.LEVEL_NORTH))
                return
            end
            if not WestClimbManager:getCutDownTime() then
                return
            end
        end 

        local function callBack()
            WestClimbManager:requestSerdangInfo()
        end
        Public:addChangeLayerEffect(callBack)
    end;
    TFDirector:addMEGlobalListener(WestClimbManager.SERDANG_SEASON_INFO_REPONSE ,self.onReceiveSerdangSeasonInfo)
end

function XilingHomeLayer:removeEvents()
    TFDirector:removeMEGlobalListener(WestClimbManager.SERDANG_SEASON_INFO_REPONSE, self.onReceiveSerdangSeasonInfo);
    self.onReceiveSerdangSeasonInfo = nil
    self.super.removeEvents(self);
end

function XilingHomeLayer.onRuleClick( sender )
    CommonManager:showRuleLyaer('wuliangshanemeng')
end
return XilingHomeLayer;
