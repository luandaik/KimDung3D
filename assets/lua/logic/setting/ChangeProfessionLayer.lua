--[[
******转换层*******

    -- by yao
    -- 2016/2/26
]]
local ChangeProfessionLayer = class("ChangeProfessionLayer", BaseLayer);

function ChangeProfessionLayer:ctor(data)
    self.super.ctor(self,data);
    self.ui = nil
    self.checkRoleIndex   = 0 --选择转换的人
    self.xingji           = 0 --星级
    self.roleBtn          = {}--人去切换按钮
    self.detailBtn        = {}
    self:init("lua.uiconfig_mango_new.main.Zhuanhuan");
end

function ChangeProfessionLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.ui = ui

    self.btn_close      = TFDirector:getChildByPath(ui,'btn_close')
    self.btn_zhuanhuan  = TFDirector:getChildByPath(ui,'btn_zhuanhuan')
    self.icon           = TFDirector:getChildByPath(ui,'icon')
    self.txt_coss       = TFDirector:getChildByPath(ui,'txt_coss')
    self.icon_jiantou   = TFDirector:getChildByPath(ui,'icon_jiantou')
    self.img_pinzhi     = TFDirector:getChildByPath(ui,'img_pinzhi')
    self.btn_help       = TFDirector:getChildByPath(ui,'btn_help')
    self.item_num       = TFDirector:getChildByPath(ui,'TextArea_Zhuanhuan_1')

    local roelBtntype = {"btn_gongj","btn_zhiliao","btn_kongzhi","btn_fangyu"}
    for i=1,4 do
        self.roleBtn[i] = TFDirector:getChildByPath(ui,roelBtntype[i])
        self.roleBtn[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckRoleCallBack))
        self.roleBtn[i].logic = self
        self.roleBtn[i].tag   = i

        self.detailBtn[i] = TFDirector:getChildByPath(ui,"btn_detail_" .. i)
        self.detailBtn[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onDetailClickCallBack))
        self.detailBtn[i].logic = self
        self.detailBtn[i].tag   = i
    end

    self.btn_zhuanhuan.logic = self
    
    -- self.txt_tips:setText("主角侠魂、武学、经脉等所有成长将无损转换给新主角")

    --self.rolename = {"剑魔传人","圣教教主","峨眉掌门","丐帮帮主"}
    self.rolename = localizable.changetProfession_text1
    self.roleid = {77,78,79,80}
    self.imageid = {10077,10078,10079,10080}
    self:checkRoleInit()
    self:refresh()
end

function ChangeProfessionLayer:onShow()
    self.super.onShow(self)
    if self.changeSuccessState then
        self:openRoleInfo()
    end
    local num = BagManager:getItemNumById(30079) or 0
    --self.item_num:setText("（拥有："..num.."）")
    if self.item_num then
        self.item_num:setText(stringUtils.format(localizable.changetProLayer_have,num))
    end
end

function ChangeProfessionLayer:removeUI()
    self.super.removeUI(self);
end

--注册事件
function ChangeProfessionLayer:registerEvents()
    self.super.registerEvents(self);

    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCloseCallBack))
    self.btn_zhuanhuan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZhuanHuanCallBack))
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpCallBack))

    --转职成功
    self.changeSuccess = function(event)
        self:checkRoleInit()
        self:refresh()
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/role_change.xml")
        local effect = TFArmature:create("role_change_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        --effect:setPosition(ccp(500,200))
        local img_role        = TFDirector:getChildByPath(self.ui,"img_role1")
        local pos = img_role:getPosition()
        effect:setPosition( ccp(pos.x + 300, pos.y + 10) )
        img_role:getParent():addChild(effect, 1)
        --img_role:addChild(effect,1)
        effect:playByIndex(0, -1, -1, 0)

        local img_role_2        = TFDirector:getChildByPath(self.ui,"img_role2")
        img_role_2:setVisible(false)
        RewardManager:setStopShow(true)
        effect:addMEListener(TFARMATURE_COMPLETE, function()
            if RewardManager:setStopShow(false) ==false then
                self:openRoleInfo()
            else
                self.changeSuccessState = true
            end
            -- AlertManager:show()
        end)

        -- toastMessage("转换成功")
    end
    TFDirector:addMEGlobalListener(SettingManager.changeProfessionSuccess ,self.changeSuccess)    
end
function ChangeProfessionLayer:openRoleInfo( )
    AlertManager:close()
    AlertManager:close()
    CardRoleManager:openRoleInfo( CardRoleManager:getRoleById(MainPlayer:getProfession()).gmId)
end

function ChangeProfessionLayer:removeEvents()
    RewardManager:setStopShow(false)
    TFDirector:removeMEGlobalListener(SettingManager.changeProfessionSuccess ,self.changeSuccess)
    self.changeSuccess = nil
    self.super.removeEvents(self)
end

--四个选中人物按钮
function ChangeProfessionLayer.onCheckRoleCallBack(sender)
    local self  = sender.logic
    local tag   = sender.tag
    self.checkRoleIndex = tag
    self:refresh()
end

function ChangeProfessionLayer.onDetailClickCallBack(sender)
    local self  = sender.logic
    local tag   = sender.tag
    
    local CardRole      = require('lua.gamedata.base.CardRole')
    local cardRole = CardRole:new(self.roleid[tag])
    cardRole.name = MainPlayer:getPlayerName()
    cardRole.quality = QualityHeroType.Zongshi
    cardRole:setLevel(1)
    cardRole.attribute = {}
    local baseAttr = cardRole.totalAttribute.attribute
    
    local attribute = baseAttr

    for i=1,(EnumAttributeType.Max-1) do
        cardRole.totalAttribute[i] = attribute[i] or 0
    end

    local roleList = TFArray:new()
    roleList:clear()
    roleList:push(cardRole)


   local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.RoleInfoLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
   local selectIndex = roleList:indexOf(cardRole)
   layer:loadOtherData(selectIndex, roleList)
   layer.bShowTuPu = true
   AlertManager:show()
    
end
--关闭按钮
function ChangeProfessionLayer.onCloseCallBack(sender)
    AlertManager:close()
end
--关闭按钮
function ChangeProfessionLayer.onHelpCallBack(sender)
    CommonManager:showRuleLyaer( "zhujuezhuanhuan" )
end

--转换按钮
function ChangeProfessionLayer.onZhuanHuanCallBack(sender)
    local self      = sender.logic
    local roleId    = self.roleid[self.checkRoleIndex]
    local num = BagManager:getItemNumById(30079) or 0
    if num == 0 then
        -- toastMessage("转换丹不足")
        if MallManager:checkShopOneKey( 30079 ) == false then
            toastMessage(localizable.ChangeProfessionLayer_zhuanhuandanbuzu)
        end        
        return
    end
    
    CommonManager:showOperateSureLayer(function()
        SettingManager:requestChangeProfession(roleId)
        end,
        nil,
        {
        --"是否确认转换主角？",
        msg = localizable.ChangeProfessionLayer_zhuanhuantishi, 
    })

end

--刷新界面
function ChangeProfessionLayer:refresh()
    self:changeBtnState()
    local roleprofession = MainPlayer:getProfession()
    print("roleprofession = ",roleprofession)
    local role = CardRoleManager:getRoleById(roleprofession) --RoleData:objectByID(roleprofession)
    self.xingji = role.starlevel

    local panel_jiemianbiaoti = {"panel_jiemianbiaoti2","panel_jiemianbiaoti"}
    for i=1,2 do
      local jiemianbiaoti   = TFDirector:getChildByPath(self.ui,panel_jiemianbiaoti[i])
      local txt_name        = TFDirector:getChildByPath(jiemianbiaoti,"txt_name")
      local img_namebg      = TFDirector:getChildByPath(jiemianbiaoti,"img_namebg")
      local img_role        = TFDirector:getChildByPath(self.ui,"img_role" .. i)
      local star            = TFDirector:getChildByPath(self.ui,"panel_xiulian" .. i)

      if i==1 then
          -- print("role.name",role.name)
          txt_name:setText(role.name)
          img_role:setTexture(role:getBigImagePath())
      else
          txt_name:setText(role.name)
          img_role:setTexture("icon/rolebig/" .. self.imageid[self.checkRoleIndex] .. ".png")
      end

      img_namebg:setTexture(GetRoleNameBgByQuality(role.quality))
      self:starLevel(star)
    end

    self.txt_coss:setText(1)
    self.img_pinzhi:setTexture(GetFontByQuality(role.quality))
    local num = BagManager:getItemNumById(30079) or 0
    --self.item_num:setText("（拥有："..num.."）")
    self.item_num:setText(stringUtils.format(localizable.changetProLayer_have,num))
end

--星级
function ChangeProfessionLayer:starLevel(panel) 
    for i=1,5 do
        local img_star_light  = TFDirector:getChildByPath(panel,"img_star_light_" .. i)
        img_star_light:setVisible(false)
    end
    for i=1,self.xingji do
        local starIdx = i
        local starTextrue = 'ui_new/common/xl_dadian22_icon.png'
        if i > 5 then
            starTextrue = 'ui_new/common/xl_dadian23_icon.png'
            starIdx = i - 5
        end
        local img_star        = TFDirector:getChildByPath(panel,"img_star_light_" .. starIdx)
        img_star:setTexture(starTextrue)
        img_star:setVisible(true)
    end

end

--刷新按钮状态
function ChangeProfessionLayer:changeBtnState()
    local roleprofession = MainPlayer:getProfession()
    for k,v in pairs(self.roleid) do
      if roleprofession == v then
          self.roleBtn[k]:setTouchEnabled(false)
          self.roleBtn[k]:setGrayEnabled(true)
      else
          self.roleBtn[k]:setTouchEnabled(true)
          self.roleBtn[k]:setGrayEnabled(false)
      end

      if self.checkRoleIndex == k then
          self:setBtnTexture(k,true)
      else
          self:setBtnTexture(k,false)
      end
    end
end

--设置按钮图片
--[[
  index:第几个人物按钮
  selcted:状态 1：选中 2：未选中
]]
function ChangeProfessionLayer:setBtnTexture(index,selcted)
    local roleSelectedTextures = {'ui_new/createplayer/g1.png','ui_new/createplayer/g3.png','ui_new/createplayer/g4.png','ui_new/createplayer/g2.png'}
    local roleNormalTextures = {'ui_new/createplayer/g1b.png','ui_new/createplayer/g3b.png','ui_new/createplayer/g4b.png','ui_new/createplayer/g2b.png'}
    local path = roleSelectedTextures[index]
    if selcted == false then
        path = roleNormalTextures[index]
    end
    self.roleBtn[index]:setTextureNormal(path)
end

--默认选中人物
function ChangeProfessionLayer:checkRoleInit()
    local roleprofession = MainPlayer:getProfession()
    if roleprofession == self.roleid[1] then
        self.checkRoleIndex = 2
    else
        self.checkRoleIndex = 1
    end
end

return ChangeProfessionLayer
