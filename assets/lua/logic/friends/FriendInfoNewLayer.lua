-- client side FriendInfoNewLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-03-03


local FriendInfoNewLayer = class("FriendInfoNewLayer", BaseLayer)

function FriendInfoNewLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.friends.InfoNew")

end

function FriendInfoNewLayer:initUI( ui )
	self.super.initUI(self, ui)

    self.img_Frame = TFDirector:getChildByPath(ui, "bg_head")
    self.headIcon = TFDirector:getChildByPath(ui, "Img_icon")
    self.headIcon:setFlipX(true)
    self.levelText = TFDirector:getChildByPath(ui, "txt_level")
    self.nameText = TFDirector:getChildByPath(ui, "txt_name")
    self.vipText = TFDirector:getChildByPath(ui, "txt_vip")
    self.vipText:setScale(0.7)
    self.img_vip = TFDirector:getChildByPath(ui, "img_vip")
    self.bg_name = TFDirector:getChildByPath(ui, "bg_name")
    self.txt_bangpai = TFDirector:getChildByPath(ui, "txt_bangpai")

    self.Button_add = TFDirector:getChildByPath(ui, "Button_add")
    self.Button_add.logic = self

    self.Button_invite = TFDirector:getChildByPath(ui, "Button_invite")
    self.Button_invite.logic = self

    self.Btn_Close = TFDirector:getChildByPath(ui, "Btn_Close")
    self.Btn_Close.logic = self
    self.Btn_Close:setVisible(false)

    self.txt_zhanlizhi_word = TFDirector:getChildByPath(ui, "txt_zhanlizhi_word")
    self.loginTime = TFDirector:getChildByPath(ui, "txt_dl")

	self.button = {}
    for i = 1, 9 do
        local btnName = "panel_item" .. i;
        self.button[i] = TFDirector:getChildByPath(ui, btnName);

        btnName = "btn_icon" .. i;
        self.button[i].bg = TFDirector:getChildByPath(ui, btnName);
        self.button[i].bg:setVisible(false);

        self.button[i].icon = TFDirector:getChildByPath(self.button[i].bg ,"img_touxiang");
        self.button[i].icon:setVisible(false);
        -- self.button[i].icon:setFlipX(true);

        self.button[i].quality  = TFDirector:getChildByPath(ui, btnName);
        self.button[i].img_zhiye = TFDirector:getChildByPath(self.button[i], "img_zhiye");
        self.button[i].img_zhiye:setVisible(false);

        self.button[i].img_select = TFDirector:getChildByPath(self.button[i], "img_zf" .. i)
        self.button[i].img_select:setVisible(false)

        self.button[i].bg.logic = self;
        self.button[i].bg.posIndex = i;
        self.button[i].bg.hasRole = false;

        self.button[i].logic = self;
        self.button[i].posIndex = i;
        self.button[i].bar_xuetiao = TFDirector:getChildByPath(self.button[i], "bar_xuetiao" .. i);
        self.button[i].img_xuetiao = TFDirector:getChildByPath(self.button[i], "img_xuetiao" .. i);
        self.button[i].img_xuetiao:setVisible(false)
        self.button[i].img_death = TFDirector:getChildByPath(self.button[i], "img_death" .. i);
        self.button[i].img_death:setVisible(false)
    end
end

function FriendInfoNewLayer:removeUI()
	self.super.removeUI(self)    
end

function FriendInfoNewLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function FriendInfoNewLayer:refreshUI()  
	self:refreshDesc()
	self:refreshRoles()
end

function FriendInfoNewLayer:refreshDesc()
    local info = self.data
	local role = RoleData:objectByID(info.icon) 
    if role then
        self.headIcon:setTexture(role:getIconPath())
    end
    Public:addFrameImg(self.headIcon, info.headPicFrame)
    self.levelText:setText(info.level .. "d")
    self.nameText:setText(info.name)
    self.vipText:setVisible(true)
    self.vipText:setText("o" .. info.vipLevel)
    self.img_vip:setVisible(false)

    if tonumber(info.vipLevel) > 15 and tonumber(info.vipLevel) <= 18 then
        self.vipText:setVisible(false)
        self.img_vip:setVisible(true)
        self:addVipEffect(self.img_vip, info.vipLevel)
    end

    self.txt_bangpai:setVisible(false)

    if SettingManager.TAG_VIP_YINCANG == tonumber(info.vipLevel) then
       self.vipText:setVisible(false)
       self.img_vip:setVisible(false)
    end

    self:showStarHeroEffect(info.starHeroRanking,info.vipLevel)
    self:showCrossZhengBaEffect(info.ladderGrade,info.vipLevel)

    self.txt_zhanlizhi_word:setText(self.data.power or 0)

    local playerId = info.playerId
    local serverId = math.floor(playerId)
    serverId = math.floor(serverId/131072)
    local myServerId = nil
    local serverInfo = SaveManager:getServerInfo()
    if serverInfo then
        myServerId = serverInfo.serverId
    end
    self.isMyServer = false
    if serverId == myServerId then
        self.isMyServer = true
    end
    if (self.isMyServer == true) then
        self.Button_add:setTouchEnabled(true)
        self.Button_invite:setTouchEnabled(true)
        self.Button_invite:setGrayEnabled(false)
        self.Button_add:setGrayEnabled(false)
    else
        self.Button_add:setTouchEnabled(false)
        self.Button_invite:setTouchEnabled(false)
        self.Button_invite:setGrayEnabled(true)
        self.Button_add:setGrayEnabled(true)
    end
end

function FriendInfoNewLayer:refreshRoles()
    self.roles = {}
    for _, v in pairs(self.data.warside) do
        self.roles[v.warIndex + 1] = v
    end
	for pos = 1, 9 do
        self:updateIcon(pos)
    end
end

function FriendInfoNewLayer:updateIcon( index )
    local role = self.roles[index]
    if role then
        local roleData = RoleData:objectByID(role.id or 1)
    	self.button[index].bg.role = roleData
        self.button[index].icon:setVisible(true);
        self.button[index].icon:setTexture(roleData:getHeadPath());

        self.button[index].bg:setVisible(true);
        self.button[index].quality:setTextureNormal(GetColorRoadIconByQuality(roleData.quality));
        -- self.button[index].quality:setTextureNormal(GetRoleBgByWuXueLevel_circle(role.martialLevel))

        self.button[index].img_zhiye:setVisible(true);
        self.button[index].img_zhiye:setTexture("ui_new/fight/zhiye_".. roleData.outline ..".png");


        self.button[index].bg.hasRole = true;
        -- self.button[index].bg.gmId  = role.gmId;
        -- Public:addLianTiEffect(self.button[index].icon,role:getMaxLianTiQua(),true)

    else
        self.button[index].icon:setGrayEnabled(false)
        self.button[index].img_zhiye:setVisible(false);
        self.button[index].icon:setVisible(false);
        self.button[index].bg:setVisible(false); 
  
        self.button[index].bg.hasRole = false;   
        -- Public:addLianTiEffect(self.button[index].icon,0,false)
    end
end

function FriendInfoNewLayer:loadData(data)
	self.data = data
end

function FriendInfoNewLayer:registerEvents()
	self.super.registerEvents(self)

    self.Button_add:addMEListener(TFWIDGET_CLICK,  self.OnAddClickHandle, 1)
    self.Button_invite:addMEListener(TFWIDGET_CLICK,  self.onInviteClickHandle, 1)
    ADD_ALERT_CLOSE_LISTENER(self, self.Btn_Close)

    for i = 1, 9 do
        self.button[i].bg:addMEListener(TFWIDGET_CLICK,  self.RoleIconClickHandle, 1)
    end
end

function FriendInfoNewLayer.OnAddClickHandle(sender)
	local self = sender.logic

	FriendManager:requestFriend(self.data.playerId)
end

function FriendInfoNewLayer.onInviteClickHandle(sender)
    local self = sender.logic

    local post = FactionManager:getPostInFaction()
    print("post = ", post)
    if (post == 1) or (post == 2) then
        if FunctionOpenConfigure:getOpenLevel(1201) <= self.data.level then
            FactionManager:sendGuildInvitation(self.data.playerId)
            AlertManager:close()
        else
            --toastMessage("该玩家等级过低")
            toastMessage(localizable.common_play_level_low)
        end
    else
        --toastMessage("没有权限邀请入帮")   
        toastMessage(localizable.common_power_faction_low)
    end
end

function FriendInfoNewLayer.RoleIconClickHandle(sender)
	-- local self = sender.logic
	
end

function FriendInfoNewLayer:removeEvents()
    self.super.removeEvents(self)
end

function FriendInfoNewLayer:dispose()
	self.super.dispose(self)
end

function FriendInfoNewLayer:addVipEffect(btn, vipLevel)
    if btn.effect then
        btn.effect:removeFromParent()
        btn.effect = nil
    end

    vipLevel = tonumber(vipLevel)
    if vipLevel <= 15 or vipLevel > 18 then
        return
    end
    local resPath = "effect/ui/vip_" .. vipLevel .. ".xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("vip_" .. vipLevel .. "_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(btn:getContentSize().width / 2 - 10, btn:getContentSize().height / 2))
    effect:setVisible(true)
    effect:setScale(0.8)
    effect:playByIndex(0, -1, -1, 1)
    btn:addChild(effect, 200)
    btn.effect = effect
end

function FriendInfoNewLayer:showStarHeroEffect( isStarHero ,vipLevel )
    if  StarHeroManager:getServerSwitchStatue() == true and isStarHero and isStarHero > 0 then
        local pos = self.img_Frame:getPosition()
        if self.starHeroEffect == nil then
            self.starHeroEffect = Public:getStarHeroEffect()
            self.bg_name:addChild(self.starHeroEffect,100)
            local pos = self.nameText:getPosition()
            self.starHeroEffect:setPosition(ccp(pos.x + 30, pos.y + 15))
            self.starHeroEffect:setScale(0.8)
        end
        self.starHeroEffect:setVisible(true)
        local posX = self.vipText:getPositionX()
        if vipLevel == nil or SettingManager.TAG_VIP_YINCANG == tonumber(vipLevel)then
            self.starHeroEffect:setPositionX(posX + 37)
        else
            self.starHeroEffect:setPositionX(posX + 120)
        end
    else
        if self.starHeroEffect then
            self.starHeroEffect:setVisible(false)
        end
    end
end

function FriendInfoNewLayer:showCrossZhengBaEffect( level,vipLevel )
    if CrossZhengBaManager:getServerSwitchStatue() == true and level and level > 0 then
        local effect = Public:getCrossZhengBaEffect(level)
        if effect then
            if self.crosszhengbaEffect ~= nil then
                self.crosszhengbaEffect:removeFromParent()
                self.crosszhengbaEffect = nil
            end
            self.crosszhengbaEffect = effect
            self.bg_name:addChild(self.crosszhengbaEffect,100)
            if self.starHeroEffect and self.starHeroEffect:isVisible() == true then
                local pos = self.starHeroEffect:getPosition()
                pos.x = pos.x + 34
                self.crosszhengbaEffect:setPosition(pos)
            else
                local posY = self.nameText:getPositionY()
                self.crosszhengbaEffect:setPositionY(posY)
                local posX = self.vipText:getPositionX()
                if vipLevel == nil or SettingManager.TAG_VIP_YINCANG == tonumber(vipLevel)then
                    self.crosszhengbaEffect:setPositionX(posX + 17)
                else
                    self.crosszhengbaEffect:setPositionX(posX + 100)
                end
            end
            return
        end
    end
    if self.crosszhengbaEffect then
        self.crosszhengbaEffect:setVisible(false)
    end
end
return FriendInfoNewLayer