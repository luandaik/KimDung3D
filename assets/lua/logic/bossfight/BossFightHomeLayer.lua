local BossFightHomeLayer = class("BossFightHomeLayer", BaseLayer);

CREATE_SCENE_FUN(BossFightHomeLayer);
CREATE_PANEL_FUN(BossFightHomeLayer);

--[[
血战
]]

function BossFightHomeLayer:ctor(data)
    self.super.ctor(self,data);
    
    self:init("lua.uiconfig_mango_new.demond.DemondHomeLayer2");
end

function BossFightHomeLayer:loadHomeData(data)
    self.homeInfo = data;
    self:refreshUI();
end

function BossFightHomeLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function BossFightHomeLayer:refreshBaseUI()

end

function BossFightHomeLayer:refreshUI()
    if not self.isShow then
        return;
    end

end

function BossFightHomeLayer:initUI(ui)
    self.super.initUI(self,ui);
    -- self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');

    self.btn_go         = TFDirector:getChildByPath(ui, 'btn_go');
    self.btn_help         = TFDirector:getChildByPath(ui, 'btn_help');

    local dayIndex = {2,1,4}
    local flipx = {true , true , false}
    for i=1,3 do
        local img_boss = TFDirector:getChildByPath(ui, 'boss_' .. i);

        local bossData = BossFightManager:findBossWithDayIndex(dayIndex[i])
        if bossData then
            img_boss:setTexture('ui_new/demond/' .. bossData.fightresult)
            if bossData.id == 3 then
                img_boss:setFlipX( not flipx[i])
            else
                img_boss:setFlipX( flipx[i] )
            end
        end
    end
end

--填充主页信息
function BossFightHomeLayer:loadHomeInfo()

end


function BossFightHomeLayer.onGoClickHandle(sender)
    local self = sender.logic;

    -- -- local openLevel = 13
    -- -- local guideInfo = PlayerGuideData:objectByID(1601)
    -- -- if guideInfo then
    -- --     openLevel = guideInfo.open_lev
    -- -- end

    -- -- local openLevel = PlayerGuideManager:GetBloodFightOpenLevel()
    -- local openLevel = FunctionOpenConfigure:getOpenLevel(501)
    -- if MainPlayer:getLevel() < openLevel then
    --     toastMessage("血战将在"..openLevel.."级开放")
    --     return
    -- end

    -- toastMessage("11111111111")
    -- BloodFightManager:EnterBlood()
    local tTime = GetCorrectDate("*t",MainPlayer:getNowtime())
    if tTime.wday == 2 and (tTime.hour == 0 or tTime.hour == 24) and tTime.min < 1 then
        toastMessage(localizable.bossFightMainLayer_close)
        return
    end
    local bossData = BossFightManager:getBossFightInfo()
    BossFightManager:requestJieduanRank(bossData.id)
    BossFightManager:requestBossFight()
end

function BossFightHomeLayer:removeUI()
    self.super.removeUI(self);

end

function BossFightHomeLayer:registerEvents()
    self.super.registerEvents(self);

    self.btn_go.logic    = self;   
    self.btn_go:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onGoClickHandle),1);
    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRuleClick))
end

function BossFightHomeLayer:removeEvents()
    self.super.removeEvents(self);
    -- TFDirector:removeMEGlobalListener(ClimbManager.updateHomeInfo ,self.updateHomeInfoCallBack);
end

function BossFightHomeLayer:onRuleClick( sender )
    CommonManager:showRuleLyaer('fumolu')
end
return BossFightHomeLayer;
