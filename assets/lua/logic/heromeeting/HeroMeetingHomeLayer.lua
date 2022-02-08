local HeroMeetingHomeLayer = class("HeroMeetingHomeLayer", BaseLayer);

CREATE_SCENE_FUN(HeroMeetingHomeLayer);
CREATE_PANEL_FUN(HeroMeetingHomeLayer);

--[[
******英雄大会-欢迎界面*******

    -- by jiawei.miao
    -- 2018/1/5
]]

function HeroMeetingHomeLayer:ctor(data)
    self.super.ctor(self,data);
    HeroMeetingManager:sendHeroDuelLastResponse()
    self:init("lua.uiconfig_mango_new.hero.HeroEntrance");
end

function HeroMeetingHomeLayer:loadHomeData(data)
    self.homeInfo = data
    self:refreshUI()
end

function HeroMeetingHomeLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI()
    self:refreshUI()
end

function HeroMeetingHomeLayer:refreshBaseUI()

end

function HeroMeetingHomeLayer:refreshUI()

end

function HeroMeetingHomeLayer:initUI(ui)
    self.super.initUI(self,ui);
    -- self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');

    self.btn_baoming         = TFDirector:getChildByPath(ui, 'btn_baoming');

    self.icon_battletime1      = TFDirector:getChildByPath(ui, 'icon_battletime1');
    self.icon_battletime2      = TFDirector:getChildByPath(ui, 'icon_battletime2');
    self.panel_weikaiqi         = TFDirector:getChildByPath(ui, 'panel_weikaiqi');
    self.icon_battletime2:setVisible(false)
    
    self.txt_name      = TFDirector:getChildByPath(ui, 'txt_name');
    -- self.txt_name:setText("虚席以待")
    self.txt_name:setText(localizable.common_wait)

    self.posRole = {}
    for i=1,5 do
        self.posRole[i] = TFDirector:getChildByPath(ui, 'role'..i)
    end
    self.Img_nobody = TFDirector:getChildByPath(ui, 'Img_nobody')
    self.Img_nobody:setVisible(true)

    self.panel_bf   = TFDirector:getChildByPath(ui, 'panel_bf')
    self.icon_head  = TFDirector:getChildByPath(self.panel_bf, 'icon_head')
    self.bf_name    = TFDirector:getChildByPath(self.panel_bf, 'txt_name')
    self.txt_paiming    = TFDirector:getChildByPath(self.panel_bf, 'txt_paiming')
    self.txt_zhandouli  = TFDirector:getChildByPath(self.panel_bf, 'txt_zhandouli')

    self.panel_bp       = TFDirector:getChildByPath(ui, 'panel_bp')
    self.img_qizhi      = TFDirector:getChildByPath(self.panel_bp, 'img_qizhi')
    self.img_biaozhi    = TFDirector:getChildByPath(self.panel_bp, 'img_biaozhi')
    self.bp_name        = TFDirector:getChildByPath(self.panel_bp, 'txt_name')


    self.panel_gj       = TFDirector:getChildByPath(ui, 'panel_gj')
    self.gj_name        = TFDirector:getChildByPath(self.panel_gj, 'txt_name')

    self.open           = false
    self.icon_battletime1:setVisible(false)
    self.icon_battletime2:setVisible(false)
    
end

--填充主页信息
function HeroMeetingHomeLayer:loadHomeInfo()

end


function HeroMeetingHomeLayer.onGoClickHandle(sender)
   local self = sender.logic
   if FunctionOpenConfigure:getOpenLevel(2232) > MainPlayer:getLevel() then 
        toastMessage(localizable.common_level_buzu)
        return
   end
    if HeroMeetingManager.HeroActivityType == 0 then
         --活动未开始
         toastMessage(localizable.WeekRaceManager_huodong_weikaishi)
     elseif HeroMeetingManager.HeroActivityType == 1 then
           if self.open == nil or self.open == false then
                toastMessage(localizable.HERO_TIME)
                return
            else
                HeroMeetingManager:showHeroMeetingLayer()
            end
    elseif HeroMeetingManager.HeroActivityType == 2 then
         --活动已结束
         toastMessage(localizable.treasureMain_tiemout)
    end 
end

function HeroMeetingHomeLayer:removeUI()
    self.super.removeUI(self);

end

function HeroMeetingHomeLayer:registerEvents()
    self.super.registerEvents(self);
    -- ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
    -- self.btn_close:setClickAreaLength(100);
    
    self.btn_baoming.logic    = self
    self.btn_baoming:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onGoClickHandle),1)


    self.lastHeroChampionMsg = function(event)
        self:refreshEntrance(event.data[1][1])
    end
    TFDirector:addMEGlobalListener(HeroMeetingManager.lastChampionMsg ,self.lastHeroChampionMsg)

end

function HeroMeetingHomeLayer:removeEvents()
    -- TFDirector:removeMEGlobalListener(ClimbManager.updateHomeInfo ,self.updateHomeInfoCallBack);

    -- TFDirector:removeMEGlobalListener(ZhengbaManager.GAINCHAMPIONSINFO ,self.gainChampionsInfo)        
    -- self.gainChampionsInfo = nil

    -- TFDirector:removeMEGlobalListener(WeekRaceManager.lastChampionMsg ,self.lastChampionMsg)      
    -- self.lastChampionMsg = nil

    TFDirector:removeMEGlobalListener(HeroMeetingManager.lastChampionMsg ,self.lastHeroChampionMsg)
    self.lastHeroChampionMsg = nil

    if self.roleAnimId then
        for k,v in pairs(self.roleAnimId) do
            GameResourceManager:deleRoleAniById(v)
        end
        self.roleAnimId = nil
    end

    self.super.removeEvents(self);
end

function HeroMeetingHomeLayer:refreshEntrance( data )
    if data.currentChampion then
        self.panel_bf:setVisible(true)
        self.icon_head:setTexture("icon/roleicon/"..data.currentChampion.useIcon..".png")
        self.bf_name:setText(data.currentChampion.name)
        self.txt_paiming:setText(stringUtils.format(localizable.multiFight_myRank, data.currentChampion.rank))
        self.txt_zhandouli:setText(data.currentChampion.power)
    else
        self.panel_bf:setVisible(false)
    end
    if data.guildChampion then
        self.panel_bp:setVisible(true)
        local bannerInfo = stringToNumberTable(data.guildChampion.bannerId, '_')
        self.img_qizhi:setTexture(FactionManager:getBannerBgPath(bannerInfo[1],bannerInfo[2]))
        self.img_biaozhi:setTexture(FactionManager:getBannerIconPath(bannerInfo[3],bannerInfo[4])) 
        self.bp_name:setText(data.guildChampion.serverName.."  "..data.guildChampion.guildName)
    else
        self.panel_bp:setVisible(false)
    end
    if data.personalChampion then
        self.gj_name:setText(data.personalChampion.serverName.."  "..data.personalChampion.name)
        self.panel_weikaiqi:setVisible(false)
        self:showHeroList(data.personalChampion.role)
        self.panel_gj:setVisible(true)
    else
        self.panel_gj:setVisible(false)
        self.panel_weikaiqi:setVisible(true)
    end
    self.open  = data.open
    if data.number == 0 then
        self.icon_battletime1:setVisible(false)
        self.icon_battletime2:setVisible(false)
    elseif data.number == 1 then
        self.icon_battletime1:setVisible(true)
        self.icon_battletime2:setVisible(false)
    elseif data.number == 2 then
        self.icon_battletime1:setVisible(false)
        self.icon_battletime2:setVisible(true)

    end
end

function HeroMeetingHomeLayer:showHeroList( data )
    self.roleAnimId = {}
    if data then      
        for i = 1,#data do
            if data[i].roleId ~= 0 then
                self.Img_nobody:setVisible(false)
                local idx = #self.roleAnimId + 1
                local roleAnim = GameResourceManager:getRoleAniById(data[i].roleId)
                roleAnim:setScale(0.8)
                roleAnim:setPosition(ccp(25,0))
                roleAnim:play("stand", -1, -1, 1)
                self.posRole[idx]:setZOrder(20-idx)
                self.posRole[idx]:addChild(roleAnim)
                
                self.roleAnimId[idx] = data[i].roleId
                --加阴影
                TFResourceHelper:instance():addArmatureFromJsonFile("effect/main_role2.xml")
                local effect2 = TFArmature:create("main_role2_anim")
                if effect2 ~= nil then
                    effect2:setAnimationFps(GameConfig.ANIM_FPS)
                    effect2:playByIndex(0, -1, -1, 1)
                    effect2:setZOrder(-1)
                    effect2:setPosition(ccp(0, -10))
                    roleAnim:addChild(effect2)
                end
                --加套装特效
                if  data[i].suitNum ~= nil then 
                    Public:OtherPlayEffectOnRole(roleAnim,data[i].suitNum)
                end
            end
        end
    end
end

return HeroMeetingHomeLayer;
