-- client side IslandInfoLayer.lua
--[[
 * @Description: 东瀛岛队友信息界面
 ]]
-- script writer wuqi
-- creation time 2017/02/13

local IslandInfoLayer = class("IslandInfoLayer", BaseLayer)

function IslandInfoLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.island.IslandInfo")
end

function IslandInfoLayer:initUI( ui )
	self.super.initUI(self, ui)

    self.img_Frame = TFDirector:getChildByPath(ui, "bg_head")
    self.headIcon = TFDirector:getChildByPath(ui, "Img_icon")
    self.headIcon:setFlipX(true)
    self.levelText = TFDirector:getChildByPath(ui, "txt_level")
    self.nameText = TFDirector:getChildByPath(ui, "txt_name")
    self.vipText = TFDirector:getChildByPath(ui, "txt_vip")
    self.img_vip = TFDirector:getChildByPath(ui, "img_vip")
    self.txt_bangpai = TFDirector:getChildByPath(ui, "txt_bangpai")

    self.Button_add = TFDirector:getChildByPath(ui, "Button_add")
    self.Button_add.logic = self

    self.Button_invite = TFDirector:getChildByPath(ui, "Button_invite")
    self.Button_invite.logic = self

    self.Btn_Close = TFDirector:getChildByPath(ui, "Btn_Close")
    self.Btn_Close.logic = self

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
        self.button[i].img_death = TFDirector:getChildByPath(self.button[i], "img_death" .. i);
        self.button[i].img_death:setVisible(false)
    end
end

function IslandInfoLayer:removeUI()
	self.super.removeUI(self)    
end

function IslandInfoLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function IslandInfoLayer:refreshUI()  
	self:refreshDesc()
	self:refreshRoles()
end

function IslandInfoLayer:refreshDesc()
    local info = self.data
	local role = RoleData:objectByID(info.icon) 
    if role then
        self.headIcon:setTexture(role:getIconPath())
    end
    Public:addFrameImg(self.headIcon, info.headPicFrame)
    self.levelText:setText(info.level .. "d")
    self.nameText:setText(info.name)
    self.vipText:setVisible(true)
    self.vipText:setText("o" .. info.vip)
    self.img_vip:setVisible(false)

    if tonumber(info.vip) > 15 and tonumber(info.vip) <= 18 then
        self.vipText:setVisible(false)
        self.img_vip:setVisible(true)
        self:addVipEffect(self.img_vip, info.vip)
    end

    self.txt_bangpai:setVisible(false)

    if info.guildId and info.guildId > 0 then
        self.txt_bangpai:setVisible(true)
        --self.txt_bangpai:setText('帮派:'..info.guildName)
        self.txt_bangpai:setText(stringUtils.format(localizable.friendInfoLayer_faction, info.guildName))
    else
        self.txt_bangpai:setVisible(false)
    end

    if SettingManager.TAG_VIP_YINCANG == tonumber(info.vip) then
       self.vipText:setVisible(false)
       self.img_vip:setVisible(false)
    end

    if info.online then
        --self.loginTime:setText('玩家在线')
        self.loginTime:setText(localizable.factionInfo_play_online)
    else
        local passTime = MainPlayer:getNowtime() - info.lastLoginTime / 1000
        self.loginTime:setText(FriendManager:formatTimeToString(passTime))
    end

    self.txt_zhanlizhi_word:setText(self.data.power or 0)
    if (JapanIslandManager:checkIsInMyTeamByServerID(info.playerId) == false) then
        self.Button_add:setTouchEnabled(false)
        self.Button_invite:setTouchEnabled(false)
        self.Button_invite:setGrayEnabled(true)
        self.Button_add:setGrayEnabled(true)
    end
end

function IslandInfoLayer:refreshRoles()
    self.roles = {}
    for _, v in pairs(self.data.mate) do
        self.roles[v.index] = v
    end
	for pos = 1, 9 do
        self:updateIcon(pos)
    end
end

function IslandInfoLayer:updateIcon( index )
    local role = self.roles[index]
    if role then
        local roleData = RoleData:objectByID(role.icon or 1)
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

        local per = 0
        local hp = role.hp or 0
        local maxHp = role.maxHp or 0
        if maxHp <= 0 then
            per = 0
        else
            per = hp / maxHp
        end
        self.button[index].bar_xuetiao:setPercent(per * 100)
        if hp == 0 then
            self.button[index].img_death:setVisible(true)
            self.button[index].icon:setGrayEnabled(true)
        else
            self.button[index].img_death:setVisible(false)
            self.button[index].icon:setGrayEnabled(false)
        end
    else
        self.button[index].icon:setGrayEnabled(false)
        self.button[index].img_zhiye:setVisible(false);
        self.button[index].icon:setVisible(false);
        self.button[index].bg:setVisible(false); 
  
        self.button[index].bg.hasRole = false;   
        -- Public:addLianTiEffect(self.button[index].icon,0,false)
    end
end

function IslandInfoLayer:loadData(data)
	self.data = data
end

function IslandInfoLayer:registerEvents()
	self.super.registerEvents(self)

    self.Button_add:addMEListener(TFWIDGET_CLICK,  self.OnAddClickHandle, 1)
    self.Button_invite:addMEListener(TFWIDGET_CLICK,  self.onInviteClickHandle, 1)
    ADD_ALERT_CLOSE_LISTENER(self, self.Btn_Close)

    for i = 1, 9 do
        self.button[i].bg:addMEListener(TFWIDGET_CLICK,  self.RoleIconClickHandle, 1)
    end
end

function IslandInfoLayer.OnAddClickHandle(sender)
	local self = sender.logic

	FriendManager:requestFriend(self.data.playerId)
end

function IslandInfoLayer.onInviteClickHandle(sender)
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

function IslandInfoLayer.RoleIconClickHandle(sender)
	-- local self = sender.logic
	
end

function IslandInfoLayer:removeEvents()
    self.super.removeEvents(self)
end

function IslandInfoLayer:dispose()
	self.super.dispose(self)
end

function IslandInfoLayer:addVipEffect(btn, vipLevel)
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
    effect:setPosition(ccp(btn:getContentSize().width / 2, btn:getContentSize().height / 2))
    effect:setVisible(true)
    effect:setScale(0.9)
    effect:playByIndex(0, -1, -1, 1)
    btn:addChild(effect, 200)
    btn.effect = effect
end

return IslandInfoLayer