--[[
    This module is developed by Eason
    2015/10/27
]]

local FriendInfoLayer = class("FriendInfoLayer", BaseLayer)

local localVars = {
    buttonNames = {
        "Button_chat",
        "Button_pk",
        "Button_view",
        "Button_del",
        "Button_add",
        "Button_report",
        "Button_invite"
    },

    closeBtn = nil,
    buttons = {},
}

function FriendInfoLayer:ctor(data)
    self.super.ctor(self, data)

    self.info = nil
    self.buttonEvents = {
        self.onChat,
        self.onPK,
        self.onView,
        self.onDel,
        self.onAdd,
        self.onJbwj,
        self.btnInviteClickHandle
    }
    self.isFromFaction = data
    -- init
    self:init("lua.uiconfig_mango_new.friends.Info")
end

function FriendInfoLayer:initUI(ui)
    self.super.initUI(self, ui)

    for i, v in ipairs(localVars.buttonNames) do
        localVars.buttons[i] = TFDirector:getChildByPath(ui, v)
        assert(localVars.buttons[i])

        localVars.buttons[i].parent = self
    end

    self.panel_bg = TFDirector:getChildByPath(ui, "bg")
    assert(self.panel_bg)

    self.bg_name = TFDirector:getChildByPath(ui, "bg_name")
    assert(self.bg_name)

    self.img_Frame = TFDirector:getChildByPath(ui, "bg_head")
    assert(self.img_Frame)

    self.headIcon = TFDirector:getChildByPath(ui, "Img_icon")
    assert(self.headIcon)
    self.headIcon:setFlipX(true)

    self.levelText = TFDirector:getChildByPath(ui, "txt_level")
    assert(self.levelText)

    self.nameText = TFDirector:getChildByPath(ui, "txt_name")
    assert(self.nameText)

    self.vipText = TFDirector:getChildByPath(ui, "txt_vip")
    assert(self.vipText)

    self.battleScoreText = TFDirector:getChildByPath(ui, "txt_zdl")
    assert(self.battleScoreText)

    self.loginTime = TFDirector:getChildByPath(ui, "txt_dl")
    assert(self.loginTime)

    localVars.closeBtn = TFDirector:getChildByPath(ui, "Btn_Close")
    assert(localVars.closeBtn)

    self.btnInvite = TFDirector:getChildByPath(ui,'Button_invite')
    self.txt_bangpai = TFDirector:getChildByPath(ui,'txt_bangpai')

    self.img_vip = TFDirector:getChildByPath(ui, "img_vip")
end

--added by wuqi
function FriendInfoLayer:addVipEffect(btn, vipLevel)
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

function FriendInfoLayer:showStarHeroEffect( isStarHero ,vipLevel )
    if StarHeroManager:getServerSwitchStatue() == true and isStarHero and isStarHero > 0 then
        local bgSize = self.bg_name:getSize()
        local pos = self.img_Frame:getPosition()
        if self.starHeroEffect == nil then
            self.starHeroEffect = Public:getStarHeroEffect()
            self.starHeroEffect:playByIndex(0,-1,-1,1)
            self.starHeroEffect:setScale(0.7)
            self.bg_name:addChild(self.starHeroEffect,100)
            local posY = self.nameText:getPositionY() + bgSize.height * 0.5
            self.starHeroEffect:setPositionY(posY)
        end
        self.starHeroEffect:setVisible(true)
        local posX = self.vipText:getPositionX() + bgSize.width * 0.5
        if vipLevel == nil or SettingManager.TAG_VIP_YINCANG == tonumber(vipLevel)then
            self.starHeroEffect:setPositionX(posX + 47)
        else
            self.starHeroEffect:setPositionX(posX + 120)
        end
    else
        if self.starHeroEffect then
            self.starHeroEffect:setVisible(false)
        end
    end
end

function FriendInfoLayer:onShow()
    self.super.onShow(self)
end

function FriendInfoLayer:registerAllButtonEvents()
    for i,v in ipairs(localVars.buttons) do
        v:addMEListener(TFWIDGET_CLICK, audioClickfun(self.buttonEvents[i]))
    end
end

function FriendInfoLayer:registerEvents()
    self.super.registerEvents(self)
    self:registerAllButtonEvents()
    ADD_ALERT_CLOSE_LISTENER(self, localVars.closeBtn);

    self.onOverView = function(event)
        local userData   = event.data[1]
        local cardRoleId = userData[1].warside[1].id

        OtherPlayerManager:openRoleInfo(userData[1], cardRoleId)
    end
    TFDirector:addMEGlobalListener(OtherPlayerManager.OVERVIEW, self.onOverView)

    self.friendFight = function(event)
        local userData   = event.data[1]
        
        local layer = AlertManager:addLayerByFile("lua.logic.friends.FriendFightVSLayer", AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_1)
        layer:setUserData(userData[1])
        AlertManager:show()

    end
    TFDirector:addMEGlobalListener(OtherPlayerManager.FriendFight, self.friendFight)
end

function FriendInfoLayer:removeEvents()
    for _,v in pairs(localVars.buttons) do
        v:removeMEListener(TFWIDGET_CLICK)
    end

    TFDirector:removeMEGlobalListener(OtherPlayerManager.OVERVIEW, self.onOverView)
    self.onOverView = nil


    TFDirector:removeMEGlobalListener(OtherPlayerManager.FriendFight, self.friendFight)
    self.friendFight = nil
    
    self.btnInvite:removeMEListener(TFWIDGET_CLICK)
    self.super.removeEvents(self)
end

function FriendInfoLayer:dispose()
    self.super.dispose(self)
end

function FriendInfoLayer:setInfoByType(info,showType)
    self:setInfo(info)
    if showType == nil then
        return
    end
    for _,v in pairs(localVars.buttons) do
        v:setVisible(false)
    end
    local pos = localVars.buttons[1]:getPosition()
    self.btnInvite:setPosition(pos)

    local vis_btn_7 = true
    local posList1 = {ccp(108,-50),ccp(-112,-130),ccp(108,-130),ccp(-112,-50)}
    local posList2 = {ccp(108,-50),ccp(-112,-50)}
    local posList3 = {ccp(108,-50),ccp(-112,-130),ccp(108,-130),ccp(162,46),ccp(-112,-50)}
    local verLock = VersionLockData:objectByID(EnumVersionLockType.Faction_Lock)
    if verLock and verLock.open == 0 then
        vis_btn_7 = false
        posList1 = {ccp(-112,-50),ccp(108,-50),ccp(-112,-130),ccp(108,-130)}
        posList2 = {ccp(-112,-50),ccp(108,-50)}
        posList3 = {ccp(-112,-50),ccp(108,-50),ccp(-112,-130),ccp(162,46),ccp(108,-130)}
    end

    local posList = {}
    if showType == 1 then                   --入帮 阵容 切磋 好友
        localVars.buttons[7]:setVisible(vis_btn_7)
        localVars.buttons[3]:setVisible(true)
        localVars.buttons[2]:setVisible(true)
        if FriendManager:isInFriendList(info.playerId) then
            localVars.buttons[4]:setVisible(true)
            localVars.buttons[5]:setVisible(false)
        else
            localVars.buttons[4]:setVisible(false)
            localVars.buttons[5]:setVisible(true)
        end
        posList = posList1
    elseif showType == 2 then               --入帮 好友
        localVars.buttons[7]:setVisible(vis_btn_7)
        if FriendManager:isInFriendList(info.playerId) then
            localVars.buttons[4]:setVisible(true)
            localVars.buttons[5]:setVisible(false)
        else
            localVars.buttons[4]:setVisible(false)
            localVars.buttons[5]:setVisible(true)
        end
        posList = posList2
    elseif showType == 3 then               --聊天 阵容 切磋 好友
        localVars.buttons[1]:setVisible(true)
        localVars.buttons[3]:setVisible(true)
        localVars.buttons[2]:setVisible(true)
        if FriendManager:isInFriendList(info.playerId) then
            localVars.buttons[4]:setVisible(true)
            localVars.buttons[5]:setVisible(false)
        else
            localVars.buttons[4]:setVisible(false)
            localVars.buttons[5]:setVisible(true)
        end
        posList = {ccp(-112,-50),ccp(108,-50),ccp(-112,-130),ccp(108,-130)}
    elseif showType == 4 then               --入帮 举报 阵容 切磋 好友
        localVars.buttons[7]:setVisible(vis_btn_7)
        localVars.buttons[6]:setVisible(true)
        localVars.buttons[3]:setVisible(true)
        localVars.buttons[2]:setVisible(true)
        if FriendManager:isInFriendList(info.playerId) then
            localVars.buttons[4]:setVisible(true)
            localVars.buttons[5]:setVisible(false)
        else
            localVars.buttons[4]:setVisible(false)
            localVars.buttons[5]:setVisible(true)
        end
        posList = posList3
    elseif showType == 5 then               --阵容 切磋 举报
        localVars.buttons[3]:setVisible(true)
        localVars.buttons[2]:setVisible(true)
        localVars.buttons[6]:setVisible(true)
        posList = {ccp(108,-50),ccp(-112,-50),ccp(162,46)}
    elseif showType == 6 then               --切磋
        localVars.buttons[3]:setVisible(true)
        -- localVars.buttons[2]:setVisible(true)
        -- localVars.buttons[6]:setVisible(true)
        -- posList = {ccp(108,-50)}--,ccp(-112,-50),ccp(162,46)}
        posList = {ccp(-112,-50)}--,ccp(-112,-50),ccp(162,46)}
    end
    local index = 1
    for i,v in ipairs(localVars.buttons) do
        if v:isVisible() == true then
            v:setPosition(posList[index])
            index = index + 1
        end
    end
end

function FriendInfoLayer:setInfo(info)
    --print(" FriendInfoLayer info = ",info)
    self.info = info

    local role = RoleData:objectByID(info.icon)                                     --pck change head icon and head icon frame
    if role then
        self.headIcon:setTexture(role:getIconPath())
    end
    Public:addFrameImg(self.headIcon,info.headPicFrame)                            --end

    self.levelText:setText(info.level .. "d")
    self.nameText:setText(info.name)
    self.vipText:setVisible(true)
    self.vipText:setText("o" .. info.vip)
    --self.battleScoreText:setText("战斗力：" .. info.power)
    self.battleScoreText:setText(stringUtils.format(localizable.common_CE,info.power))

    self.vipText:setVisible(true)
    self.img_vip:setVisible(false)

    --added by wuqi
    if tonumber(info.vip) > 15 and tonumber(info.vip) <= 18 then
        self.vipText:setVisible(false)
        self.img_vip:setVisible(true)
        --self.img_vip:setTexture(self.path_new_vip[vipLevel - 15])
        self:addVipEffect(self.img_vip, info.vip)
    end
    self:showStarHeroEffect(info.starHeroRanking,info.vip)
    if info.online then
        --self.loginTime:setText('玩家在线')
        self.loginTime:setText(localizable.factionInfo_play_online)
    else
        local passTime = MainPlayer:getNowtime() - info.lastLoginTime / 1000
        self.loginTime:setText(FriendManager:formatTimeToString(passTime))
    end
    --quanhuan add
    if FriendManager:isInFriendList(info.playerId) then
        localVars.buttons[4]:setVisible(true)
        localVars.buttons[5]:setVisible(false)
    else
        localVars.buttons[4]:setVisible(false)
        localVars.buttons[5]:setVisible(true)
    end

    localVars.buttons[7]:setVisible(false)
    self.txt_bangpai:setVisible(false)
    if self.isFromFaction == nil then
        local post = FactionManager:getPostInFaction()
        if info.guildId then
            self.txt_bangpai:setVisible(true)
            --self.txt_bangpai:setText('帮派:'..info.guildName)
            self.txt_bangpai:setText(stringUtils.format(localizable.friendInfoLayer_faction,info.guildName))
        elseif (post == 1) or (post == 2) then
            localVars.buttons[7]:setVisible(true)
        end
   end

   --added by wuqi
    if SettingManager.TAG_VIP_YINCANG == tonumber(info.vip) then
       self.vipText:setVisible(false)
       self.img_vip:setVisible(false)
    end
end

function FriendInfoLayer.onChat(sender)
    print("FriendInfoLayer.onChat(sender)")
    if FriendManager:isInFriendList(sender.parent.info.playerId) then
        AlertManager:close()
        AlertManager:close()
        local chatlayer = ChatManager:showChatLayer()
        chatlayer:changeGroupChoice(EnumChatType.PrivateChat)
        FriendManager:moveFriendInfoToFront(sender.parent.info.playerId)
        chatlayer.friendTableView:refreshUI()
        chatlayer.friendTableView:selectCell(sender.parent.info.playerId)
    else
        --toastMessage("请先添加好友！")
        toastMessage(localizable.friendInfoLayer_add_friend)
    end
end

function FriendInfoLayer.onPK(sender)
    OtherPlayerManager:showOtherPlayerdetails(sender.parent.info.playerId, "friendsFight")
end

function FriendInfoLayer.onView(sender)
    OtherPlayerManager:showOtherPlayerdetails(sender.parent.info.playerId, "overview")
end

function FriendInfoLayer.onDel(sender)
    CommonManager:showOperateSureLayer(
        function()
            FriendManager:deleteFriend(sender.parent.info.playerId)
        end,
        nil,
        {
        --title = "提示",
        --msg = "是否删除该好友？"
        title =localizable.common_tips,
        msg = localizable.friendInfoLayer_dele_friend
        }
    )
end
function FriendInfoLayer.onAdd(sender)

    FriendManager:requestFriend(sender.parent.info.playerId)
    --OtherPlayerManager:showOtherPlayerdetails(sender.parent.info.playerId, "overview")
end

function FriendInfoLayer.onJbwj(sender)
    -- AlertManager:close()
    local self = sender.parent
    if self.info == nil then
        return
    end
    local layer = AlertManager:addLayerByFile("lua.logic.chat.ChatReport",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
    layer:setData(self.info.playerId) 
    AlertManager:show()
end

function FriendInfoLayer.btnInviteClickHandle( sender )    
    local self = sender.parent
    local post = FactionManager:getPostInFaction()
  --  print("post = ",post)
    if (post == 1) or (post == 2) then
        if FunctionOpenConfigure:getOpenLevel(1201) <= self.info.level then
            FactionManager:sendGuildInvitation(self.info.playerId)
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

function FriendInfoLayer:setInfoByServerType(userData,id,showType)
-- print("setInfoByServerType---------------?>>>>>")
    self:_setInfoByServerType(userData)
    for _,v in pairs(localVars.buttons) do
        v:setVisible(false)
        v:setTouchEnabled(true)
        v:setGrayEnabled(false)
    end
    -- local pos = localVars.buttons[1]:getPosition()
    -- self.btnInvite:setPosition(pos)
    -- type 7
    local posList = {}
    localVars.buttons[1]:setVisible(false)
    localVars.buttons[7]:setVisible(true)
    localVars.buttons[7]:setTouchEnabled(false)
    localVars.buttons[7]:setGrayEnabled(true)
    localVars.buttons[2]:setVisible(true)
    localVars.buttons[2]:setTouchEnabled(false)
    localVars.buttons[2]:setGrayEnabled(true)
    localVars.buttons[6]:setVisible(true)
    localVars.buttons[6]:setTouchEnabled(false)
    localVars.buttons[6]:setGrayEnabled(true)
    localVars.buttons[5]:setVisible(true)
    localVars.buttons[5]:setTouchEnabled(false)
    localVars.buttons[5]:setGrayEnabled(true)
    localVars.buttons[4]:setVisible(false)
    localVars.buttons[3]:setVisible(true)
    posList = {ccp(108,-50),ccp(-112,-130),ccp(108,-130),ccp(162,46),ccp(-112,-50)}
    local index = 1
    for i,v in ipairs(localVars.buttons) do
        if v:isVisible() == true then
            v:setPosition(posList[index])
            index = index + 1
        end
    end
    -- type 8
    if showType == 8 then
        localVars.buttons[2]:setTouchEnabled(true)
        localVars.buttons[2]:setGrayEnabled(false)
        localVars.buttons[2]:addMEListener(TFWIDGET_CLICK, function ()
            local layer = AlertManager:addLayerByFile("lua.logic.friends.FriendFightVSLayer", AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_1)
            layer:setUserData(userData)
            AlertManager:show()
        end)
    end
    localVars.buttons[3]:addMEListener(TFWIDGET_CLICK, function ()
        OtherPlayerManager:openRoleInfo(userData,id)
    end)
end

function FriendInfoLayer:_setInfoByServerType(info)
   -- print(" FriendInfoLayer info = ",info)
    self.info = info

    local role = RoleData:objectByID(info.icon)                                     --pck change head icon and head icon frame
    if role then
        self.headIcon:setTexture(role:getIconPath())
    end
    Public:addFrameImg(self.headIcon,info.headPicFrame)                            --end

    self.levelText:setText(info.level .. "d")
    self.nameText:setText(info.name)
    self.vipText:setVisible(true)
    self.vipText:setText("o" .. info.vipLevel)
    --self.battleScoreText:setText("战斗力：" .. info.power)
    -- local power = 0
    -- if info.warside then
    --     for i=1,#info.warside  do
    --         power = power + info.warside[i].power
    --     end
    -- end
    self.battleScoreText:setText(stringUtils.format(localizable.common_CE,info.power))
    -- self.battleScoreText:setVisible(false)

    self.vipText:setVisible(true)
    self.img_vip:setVisible(false)

    --added by wuqi
    if tonumber(info.vipLevel) > 15 and tonumber(info.vipLevel) <= 18 then
        self.vipText:setVisible(false)
        self.img_vip:setVisible(true)
        --self.img_vip:setTexture(self.path_new_vip[vipLevel - 15])
        self:addVipEffect(self.img_vip, info.vipLevel)
    end
    self:showStarHeroEffect(info.starHeroRanking,info.vipLevel)
    self.loginTime:setVisible(false)

    self.txt_bangpai:setVisible(false)

   --added by wuqi
    if SettingManager.TAG_VIP_YINCANG == tonumber(info.vipLevel) then
       self.vipText:setVisible(false)
       self.img_vip:setVisible(false)
    end
end


return FriendInfoLayer