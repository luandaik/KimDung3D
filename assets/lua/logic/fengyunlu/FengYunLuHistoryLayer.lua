local FengYunLuHistoryLayer = class("FengYunLuHistoryLayer", BaseLayer);

CREATE_SCENE_FUN(FengYunLuHistoryLayer);
CREATE_PANEL_FUN(FengYunLuHistoryLayer);

--[[
风云录历史阵容
]]
local path  = {"ui_new/fengyunlu/tab_gk1.png","ui_new/fengyunlu/tab_gk2.png","ui_new/fengyunlu/tab_gk3.png"}
local path1 = {"ui_new/fengyunlu/tab_gk1_h.png","ui_new/fengyunlu/tab_gk2_h.png","ui_new/fengyunlu/tab_gk3_h.png"}
function FengYunLuHistoryLayer:ctor(data)
    self.super.ctor(self,data);
    
    self:init("lua.uiconfig_mango_new.fengyunlu.FengYunLuHistory");
end


function FengYunLuHistoryLayer:onShow()
    self.super.onShow(self)
    self:refreshUI();
end


function FengYunLuHistoryLayer:initUI(ui)
    self.super.initUI(self,ui);
    --关卡选择

    self.guankabtn                 = {}  
    for i =1,4 do
        local btn = TFDirector:getChildByPath(ui, "tab_gk"..i)
        btn.index = i
        btn.logic = self
        self.guankabtn[i] = btn
    end
    self.btn_close  =  TFDirector:getChildByPath(ui, "btn_close")
    self.rolelist   = {}
    for i = 1,9 do 
        local role          = TFDirector:getChildByPath(ui, "panel_item"..i)
        role.img_zhenming   = TFDirector:getChildByPath(role, "img_zhenming")
        role.img_zf1        = TFDirector:getChildByPath(role, "img_zf"..i)
        role.img_zf1:setVisible(false)
        role.btn_icon       = TFDirector:getChildByPath(role, "btn_icon"..i)
        role.img_zhiye      = TFDirector:getChildByPath(role.btn_icon, "img_zhiye")
        role.img_touxiang   = TFDirector:getChildByPath(role.btn_icon, "img_touxiang")
        role.btn_icon:setVisible(false)
        self.rolelist[i] = role
    end


    self.PastRoleList = FengYunLuManager.PastRoleList
    self.index = 1
end

function FengYunLuHistoryLayer:refreshUI()
    self:refreshStartLabel()
    for i = 1,9 do
        self.rolelist[i].btn_icon:setVisible(false)
    end
    if self.PastRoleList[self.index] and self.PastRoleList[self.index] ~= "0" then
        local base = string.split(self.PastRoleList[self.index],',')
        for v,k in pairs(base) do
            v = tonumber(v)
            k = tonumber(k)
            if v > 9 then
                break
            end
            -- self.rolelist[v].btn_icon:setVisible(false)
            if k and k ~= 0 then
                self.rolelist[v].btn_icon:setVisible(true)
                local role = FYRecordData:getRoleinfoByid(k)
                self.rolelist[v].img_touxiang:setTexture(role:getHeadPath())
                self.rolelist[v].btn_icon:setTextureNormal(GetColorRoadIconByQuality(role.quality))
                self.rolelist[v].img_zhiye:setTexture("ui_new/fight/zhiye_".. role.outline ..".png")
            end
        end
    end
end
function FengYunLuHistoryLayer:refreshStartLabel()
    for i =1 ,4 do
        self.guankabtn[i]:setTextureNormal(path[i])
    end
    self.guankabtn[self.index]:setTextureNormal(path1[self.index])
end

function FengYunLuHistoryLayer:removeUI()
    self.super.removeUI(self);
end

function FengYunLuHistoryLayer:registerEvents()
    self.super.registerEvents(self);
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
    for i = 1, 4 do
        self.guankabtn[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickHandle),1)
    end
    -- self.btn_lszr:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAttackClickHandle),1)
    -- self.btn_phjl:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnbutStrengthClickHandle),1)
    -- self.btn_fyb:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnHelp),1)
    -- self.btn_tz:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnHelp),1)

    -- self.refreshlist = function(event)
    --     self:refreshUI()
    -- end

    -- TFDirector:addMEGlobalListener(HeroListManager.OPEN_HERO_AMBITION, self.refreshlist)
end

function FengYunLuHistoryLayer.onClickHandle(sender)
    local self = sender.logic
    self.index = sender.index
    self:refreshUI()
end

function FengYunLuHistoryLayer:removeEvents()
    self.super.removeEvents(self);

    -- TFDirector:removeMEGlobalListener(HeroListManager.OPEN_HERO_AMBITION, self.refreshlist)
    -- self.refreshlist = nil

    
end
function FengYunLuHistoryLayer:dispose()
    self.super.dispose(self)
end

return FengYunLuHistoryLayer
