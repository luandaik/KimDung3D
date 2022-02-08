-- client side RoleTianMingLayer.lua
--[[
 * @Description: 天命图层
 ]]
-- script writer chikui
-- creation time 2016-05-26

local RoleTianMingLayer = class("RoleTianMingLayer", BaseLayer)
--天命镶星红点位置
-- local TianmingRedPos = {ccp(-48,-80),ccp(-78,-58),ccp(-82,-23),ccp(-63,6),ccp(-30,20),ccp(3,6),ccp(20,-23),ccp(18,-58),ccp(-12,-80)}
function RoleTianMingLayer:ctor(data)
    self.super.ctor(self,data);
    self.fightType = EnumFightStrategyType.StrategyType_PVE
    self.currSelectStage = 1
    self:init("lua.uiconfig_mango_new.role_new.TianMingMain")
end
function RoleTianMingLayer:initUI(ui)
	self.super.initUI(self,ui)
    ----1=方形，2=三角形，3=圆形
    self.bqPath = {"ui_new/tianming/btn_kong3.png", "ui_new/tianming/btn_kong1.png", "ui_new/tianming/btn_kong2.png"}
    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.TianMing,{HeadResType.JINGPO,HeadResType.COIN,HeadResType.SYCEE})
    self.panel_info     = TFDirector:getChildByPath(ui, 'panel_info')
    self.panel_touch_event     = TFDirector:getChildByPath(ui, 'panel_touch_event')
    self.panel_touch_event:setSwallowTouch(false)

    self.img_zhiye       = TFDirector:getChildByPath(self.panel_info, 'img_zhiye')
    self.img_icon       = TFDirector:getChildByPath(self.panel_info, 'img_icon')
    self.img_quality    = TFDirector:getChildByPath(self.panel_info, 'img_quality')
    
    self.TianMingkongList = {}
    local panel_kong9 = TFDirector:getChildByPath(ui, "panel_kong9")
    for i = 1,9 do
        self.TianMingkongList[i]                = TFDirector:getChildByPath(panel_kong9, "btn_kong"..i)    
        self.TianMingkongList[i].index          = i
        self.TianMingkongList[i].img_tm         = TFDirector:getChildByPath(self.TianMingkongList[i], "img_tm")
        self.TianMingkongList[i].img_pz         = TFDirector:getChildByPath(self.TianMingkongList[i], "img_pz")
        self.TianMingkongList[i].btn_jia        = TFDirector:getChildByPath(self.TianMingkongList[i], "btn_jia")
        self.TianMingkongList[i].img_xz         = TFDirector:getChildByPath(ui, "img_xz"..i)
        self.TianMingkongList[i].img_xz:setVisible(false)
        self.TianMingkongList[i].panel_star     = TFDirector:getChildByPath(self.TianMingkongList[i], "panel_star")
        self.TianMingkongList[i].txt_starlv     = TFDirector:getChildByPath(self.TianMingkongList[i], "txt_starlv")
        self.TianMingkongList[i].txt_dj         = TFDirector:getChildByPath(self.TianMingkongList[i], "txt_dj")
        self.TianMingkongList[i].logic          = self
        self.TianMingkongList[i].btn_jia.logic  = self
        self.TianMingkongList[i].btn_jia.index  = i 
    end
   
    -- 左右按钮
    self.btn_left           = TFDirector:getChildByPath(ui, 'btn_pageleft')
    self.btn_right          = TFDirector:getChildByPath(ui, 'btn_pageright')

    self.btn_tmbb           = TFDirector:getChildByPath(ui, 'btn_tmbb')
    self.btn_jisi           = TFDirector:getChildByPath(ui, 'btn_jisi')
    self.btn_jpsd           = TFDirector:getChildByPath(ui, 'btn_jpsd')
    self.btn_help           = TFDirector:getChildByPath(ui, 'btn_help')
    self.btn_tmzjc          = TFDirector:getChildByPath(ui, 'btn_tmzjc')
    self.btn_xx             = TFDirector:getChildByPath(ui, 'btn_xx')
    self.btn_tmcj           = TFDirector:getChildByPath(ui, 'btn_tmcj')

    -- 总进度
    self.addjindu                   = TFDirector:getChildByPath(ui, 'img_jindu')
    self.addjindu.panel_jindutiao   = TFDirector:getChildByPath(self.addjindu, 'panel_jindutiao')
    self.addjindu.bar_percent       = TFDirector:getChildByPath(self.addjindu.panel_jindutiao, 'bar_percent')
    self.addjindu.txt_exp           = TFDirector:getChildByPath(self.addjindu, 'txt_exp')
    self.addjindu.txt_level         = TFDirector:getChildByPath(self.addjindu, 'txt_level')

    -- 单进度
    self.jindu                   = TFDirector:getChildByPath(ui, 'img_jindutiaobj')
    self.jindu.panel_jindutiao   = TFDirector:getChildByPath(self.jindu, 'panel_jindutiao')
    self.jindu.bar_percent       = TFDirector:getChildByPath(self.jindu.panel_jindutiao, 'bar_percent')
    self.jindu.txt_exp           = TFDirector:getChildByPath(self.jindu, 'txt_exp')
    self.jindu.txt_level         = TFDirector:getChildByPath(self.jindu, 'txt_level')

    self.panel_kong         = TFDirector:getChildByPath(ui, 'panel_kong')
    self.img_kong           = TFDirector:getChildByPath(self.panel_kong, 'img_kong')
    self.img_tm             = TFDirector:getChildByPath(self.img_kong, 'img_tm')
    self.img_tm:setOpacity(255)
    self.img_pz             = TFDirector:getChildByPath(self.img_kong, 'img_pz')
    self.img_pz:setOpacity(255)
    self.panel_star         = TFDirector:getChildByPath(self.panel_kong, 'panel_star')
    self.txt_starlv         = TFDirector:getChildByPath(self.panel_star, 'txt_starlv')

    self.panel_shuxing      = TFDirector:getChildByPath(ui, 'panel_shuxing')
    self.btn_xiexia         = TFDirector:getChildByPath(self.panel_shuxing, 'btn_xiexia')
    self.btn_shengji        = TFDirector:getChildByPath(self.panel_shuxing, 'btn_shengji')
    self.txt_name           = TFDirector:getChildByPath(self.panel_shuxing, 'txt_name1')
    --self.panel_sx           = TFDirector:getChildByPath(self.panel_shuxing, 'panel_sx')
    self.panel_sx = {}
    for i = 1, 6 do
        local panel_sx      = TFDirector:getChildByPath(ui, 'img_attr'..i)
        panel_sx.txt_name   = TFDirector:getChildByPath(panel_sx, 'txt_name')
        panel_sx.txt_base = TFDirector:getChildByPath(panel_sx, 'txt_base')
        panel_sx:setVisible(false)
        self.panel_sx[i] = panel_sx
    end
    self.panel_empty        = TFDirector:getChildByPath(ui, 'panel_empty')
    self.txt_tips           = TFDirector:getChildByPath(self.panel_empty, 'txt_tips')
    self.TianMingList = {}
    self.TianMingAllList = {}
    self.TianMingkinglist = {}
    for i = 1,9 do 
        self.TianMingkinglist[i] = 0
    end
    --防止多次循环,记录天命是否可以镶星
    self.TianMingRedSwitch = {}
    for i = 1, 9 do 
        self.TianMingRedSwitch[i] = false
    end
    self.index  = 1
    self.MaxNumTianMing = ConstantData:objectByID("Destinygrade").value
end
function RoleTianMingLayer:loadData(roleGmId,fightType)
    self.roleGmId  = roleGmId
    self.fightType = fightType
    self.cardRole = CardRoleManager:getRoleByGmid(self.roleGmId);
    self.selectIndex = self.roleList:indexOf(self.cardRole.id)
    if self.selectIndex == 1 then
        self.btn_left:setVisible(false)
    end
    if self.selectIndex == self.roleList:length() then
        self.btn_right:setVisible(false)
    end
end
function RoleTianMingLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
    self:refreshUI()
    
end
function RoleTianMingLayer:setRoleList(roleList)
    self.roleList =  TFArray:new()
    for roleId in roleList:iterator() do
        local role = CardRoleManager:getRoleById(roleId)
        if role and role.quality >= 4 then
            self.roleList:push(roleId)
        end
    end
end

function RoleTianMingLayer:refreshUI()
    self:openTianMingXZ(self.index)
    self.TianMingAllList = TianMingManager.EmptyTianMingList
    self.cardRole = CardRoleManager:getRoleByGmid(self.roleGmId);
    self.selectIndex = self.roleList:indexOf(self.cardRole.id)
    self.roleGmId   = self.cardRole.gmId;
    self.TianMingList  = self.cardRole.TianMing
    local num = math.ceil(self.index / 3)
    self.img_kong:setTexture(self.bqPath[num])
    if self.TianMingList[self.index].id ~= 0 then
        self:drawRole()
        self:openTianMingDownandUpgrade(self.index)
    else
        if next(self.TianMingAllList) == nil or self.TianMingAllList:length() < 1 then
            self:OpenNoTianMingLayer()
        elseif TianMingManager.CircularTianMingNum > 0 or TianMingManager.SquareTianMingNum > 0 or TianMingManager.TriangleTianMingNum > 0 then
            self:OpenAddTianMingLayer()
        end
        self:showInfoForPage()
        --判断是否有未镶嵌的天命 false有 true没有
        local tianmingnum = self:getTianMIngNum()
        if tianmingnum == true then
            if self.index == 0  then
                self.index = 1
            end
            self:openTianMingDownandUpgrade(self.index)
        end 
    end

    self.btn_jisi:setVisible(MainPlayer:getServerSwitchStatue(ServerSwitchType.JiSi ))
end
function RoleTianMingLayer:getTianMIngNum()
    self.TianMingList  = self.cardRole.TianMing
    for i = 1,9 do 
        if self.TianMingList[i].id == 0 then
            return false
        end 
    end
    return true
end
function RoleTianMingLayer:removeUI()
    self.super.removeUI(self)
end

function RoleTianMingLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end

    self.super.dispose(self)
end
function RoleTianMingLayer:registerEvents(ui)
    self.super.registerEvents(self)
    self.btn_left.logic     = self;
    self.btn_left:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onLeftClickHandle),1)
    self.btn_right.logic    = self;
    self.btn_right:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRightClickHandle),1)
    self.btn_tmbb.logic    = self;
    self.btn_tmbb:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onTianMingBagClickHandle),1)
    self.btn_xiexia.logic    = self;
    self.btn_xiexia:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onTianMingXieXiaClickHandle),1)
    self.btn_shengji.logic    = self;
    self.btn_shengji:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onTianMingShengJiClickHandle),1)
    self.btn_tmzjc.logic    = self;
    self.btn_tmzjc:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onTianMingJCClickHandle),1)
    self.btn_jpsd.logic    = self;
    self.btn_jpsd:addMEListener(TFWIDGET_CLICK,audioClickfun(self.OnBtnClickShangcheng),1)
    self.btn_help.logic = self;
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnRuleClick),1)
    self.btn_jisi.logic = self;
    self.btn_jisi:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnJiSiClick),1)
    self.btn_xx.logic = self
    self.btn_xx:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onTianMingXiangXingClickHandle),1)
    self.btn_tmcj.logic = self
    self.btn_tmcj:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onTianMingChengjiuClickHandle),1)
    for i = 1,9 do 
        self.TianMingkongList[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.openTianMingInfoClickHandle),1)
        self.TianMingkongList[i].btn_jia:addMEListener(TFWIDGET_CLICK, audioClickfun(self.openTianMingInfoClickHandle),1)
    end
    self.refreshTianMingList = function(event)
        for i = 1,9 do 
            self.TianMingkinglist[i] = 0
        end
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(TianMingManager.RefreshTianMingList, self.refreshTianMingList)
    self.PlayerPosEffect = function(event)
        self:PlayKongPosEffect(event.data[1].pos)
    end
    TFDirector:addMEGlobalListener(TianMingManager.RefreshTianMingPos, self.PlayerPosEffect)
    --滑动事件监听，切换装备
    function onTouchBegin(widget,pos,offset)
        self.touchBeginPos = pos
    end

    function onTouchMove(widget,pos,offset)
    end
    function onTouchEnd(widget,pos)
        local offsetX = pos.x - self.touchBeginPos.x
        local pageCount = self.roleList:length()
        if offsetX < -80 then
            if self.selectIndex < pageCount and pageCount > 1 then
                self.selectIndex  = self.selectIndex + 1 
                self:DeleteTianMingSelectLayer()
                self:UpadataCardRole()
                self:refreshUI()
                self:showInfoForPage()
            end  
        elseif offsetX > 80 then
            if self.selectIndex > 1 and pageCount > 1 then
                self.selectIndex  = self.selectIndex - 1 
                self:DeleteTianMingSelectLayer()
                self:UpadataCardRole()
                self:refreshUI()
                self:showInfoForPage()
            end
        end
    end

    self.panel_touch_event:addMEListener(TFWIDGET_TOUCHBEGAN, onTouchBegin)
    self.panel_touch_event:addMEListener(TFWIDGET_TOUCHMOVED, onTouchMove)
    self.panel_touch_event:addMEListener(TFWIDGET_TOUCHENDED, onTouchEnd)

    
end
function RoleTianMingLayer.OnRuleClick()
    CommonManager:showRuleLyaer('xiaketianming')
end
function RoleTianMingLayer.OnJiSiClick()
    JiSiManager:openJiSiMainLayer()
end

function RoleTianMingLayer.OnBtnClickShangcheng()
    MallManager:openMallLayerByType(EnumMallType.TianMingMall,1)
end
function RoleTianMingLayer:PlayKongPosEffect(pos)
    self.kongeffect = self.kongeffect or nil
    if not self.kongeffect then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/assistOpen.xml")
        local effect = TFArmature:create("assistOpen_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        self.kongeffect = effect
        local img_intensify_lv = self.TianMingkongList[1]
        img_intensify_lv:addChild(self.kongeffect)
    end
    local pos = self.TianMingkongList[pos]:getPosition()

    self.kongeffect:setPosition(ccp(pos.x - 60 , pos.y - 160))
    self.kongeffect:playByIndex(0, -1, -1, 0)
end
function RoleTianMingLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(TianMingManager.RefreshTianMingList, self.refreshTianMingList)
    self.refreshTianMingList = nil
    TFDirector:removeMEGlobalListener(TianMingManager.RefreshTianMingPos, self.PlayerPosEffect)
    self.PlayerPosEffect = nil
end
function RoleTianMingLayer.onTianMingXieXiaClickHandle(sender)
    local self = sender.logic
    TianMingManager:sendUpEquipDestiny(self.TianMingList[self.index].id,self.index,self.roleGmId)
end
function RoleTianMingLayer.onTianMingShengJiClickHandle(sender)
    local self = sender.logic
    TianMingManager:openTianMingShengJiLayer(self.TianMingList[self.index].id)
end
function RoleTianMingLayer.onTianMingXiangXingClickHandle(sender)
    local self = sender.logic
    TianMingManager:openTianMingXiangXing(self.TianMingList[self.index].id)
end
function RoleTianMingLayer.onTianMingChengjiuClickHandle(sender)
    local self = sender.logic
    TianMingManager:openTianMingChengJiu(self.cardRole.TianMingAchievementIdList)
end
function RoleTianMingLayer.onTianMingJCClickHandle(sender)
    local self = sender.logic
    TianMingManager:openTianMingJiaChengLayer(self.roleGmId)
end

function RoleTianMingLayer.openTianMingInfoClickHandle(sender)
    local self = sender.logic;
    local num = math.ceil(sender.index / 3)
    self.img_kong:setTexture(self.bqPath[num])
    self.index = sender.index
    self:openTianMingXZ(self.index)
    local king1,king2,kind3 = self.TianMingkinglist[3*num-2],self.TianMingkinglist[3*num-1],self.TianMingkinglist[3*num]
    --27=方形，28=三角形，29=圆形
    if num == 1 and TianMingManager.CircularTianMingNum == 0 and self.TianMingList[sender.index].id == 0 then
        self:OpenNoTianMingLayer(num)
    elseif num == 1 and TianMingManager.CircularTianMingNum ~= 0 and self.TianMingList[sender.index].id == 0 then
        TianMingManager:openTianMingListSelectLayer(29,sender.index,self.roleGmId,king1,king2,kind3)
    elseif num == 2 and TianMingManager.SquareTianMingNum == 0 and self.TianMingList[sender.index].id == 0 then
        self:OpenNoTianMingLayer(num)
    elseif num == 2 and TianMingManager.SquareTianMingNum ~= 0 and self.TianMingList[sender.index].id == 0 then
        TianMingManager:openTianMingListSelectLayer(27,sender.index,self.roleGmId,king1,king2,kind3)
    elseif num == 3 and TianMingManager.TriangleTianMingNum == 0 and self.TianMingList[sender.index].id == 0 then 
        self:OpenNoTianMingLayer(num)
    elseif num == 3 and TianMingManager.TriangleTianMingNum ~= 0 and self.TianMingList[sender.index].id == 0 then
        TianMingManager:openTianMingListSelectLayer(28,sender.index,self.roleGmId,king1,king2,kind3)
    else
        self:DeleteTianMingSelectLayer()
        self:openTianMingDownandUpgrade(sender.index)
    end
end
function RoleTianMingLayer:OpenNoTianMingLayer(num)
    self:DeleteTianMingSelectLayer()
    self.panel_shuxing:setVisible(false)
    self.panel_empty:setVisible(true)
    self.img_tm:setVisible(false)
    self.img_pz:setVisible(false)
    self.panel_star:setVisible(false)
    self.txt_tips:setText(localizable.TianMing_NO)
end
function RoleTianMingLayer:OpenAddTianMingLayer(num)
    self.panel_shuxing:setVisible(false)
    self.panel_empty:setVisible(true)
    self.panel_star:setVisible(false)
    self.txt_tips:setText(localizable.TianMing_ADD)
end
function RoleTianMingLayer.onLeftClickHandle(sender)
    local self = sender.logic;
    self:DeleteTianMingSelectLayer()
    self.selectIndex  = self.selectIndex - 1 
    self:UpadataCardRole()
    self:refreshUI()
    self:showInfoForPage()
end

function RoleTianMingLayer.onRightClickHandle(sender)
    local self = sender.logic;
    self:DeleteTianMingSelectLayer()
    self.selectIndex  = self.selectIndex + 1 
    self:UpadataCardRole()
    self:refreshUI()
    self:showInfoForPage()
end
function RoleTianMingLayer:DeleteTianMingSelectLayer()
    local layer = AlertManager:getLayerByName("lua.logic.role_new.TianMingSelect");
    if layer then
       layer:moveOut()
    end
end
function RoleTianMingLayer.onTianMingBagClickHandle(sender)
    local self = sender.logic;
    TianMingManager:openTianMingBagLayer()
end
function RoleTianMingLayer:showInfoForPage()
    local pageCount = self.roleList:length()

    self.btn_left:setVisible(false)
    self.btn_right:setVisible(false)
    if self.selectIndex < pageCount and pageCount > 1 then
        self.btn_right:setVisible(true)
    end 

    if self.selectIndex > 1 and pageCount > 1 then
        self.btn_left:setVisible(true)
    end
    self:drawRole()
end
function RoleTianMingLayer:UpadataCardRole()
    local roleId    = self.roleList:objectAt(self.selectIndex);
    self.cardRole   = CardRoleManager:getRoleById(roleId)
    self.roleGmId   = self.cardRole.gmId
    self.TianMingList  = self.cardRole.TianMing
end
function RoleTianMingLayer:drawRole()
    local cardRole  = self.cardRole
    --左侧角色信息显示
    self.img_zhiye:setTexture("ui_new/fight/zhiye_".. cardRole.outline ..".png")
    self.img_icon:setTexture(cardRole:getHeadPath())
    self.img_quality:setTexture(GetColorRoadIconByQuality(cardRole.quality))
    local expnum = 0
    local levelnum = 0
    
    self.img_tm:setVisible(false)
    self.img_pz:setVisible(false)
    self.img_kong:setVisible(true)
    for i = 1,9 do 
        self.TianMingkongList[i].btn_jia:setVisible(false)
        self.TianMingkongList[i].img_tm:setVisible(false)
        self.TianMingkongList[i].img_pz:setVisible(false)
        self.TianMingkongList[i].panel_star:setVisible(false)
        self.TianMingkongList[i]:setTouchEnabled(true)
        self.TianMingkongList[i].txt_dj:setVisible(false)
        self.TianMingRedSwitch[i] = false
        local num = math.ceil(i / 3)
        if num == 1 and self.TianMingList[i].id == 0 and TianMingManager.CircularTianMingNum ~= 0 then
            self.TianMingkongList[i].btn_jia:setVisible(true)
            self.TianMingkongList[i]:setTouchEnabled(false)
            CommonManager:setRedPoint(self.TianMingkongList[i],false,"isTianMingRed",ccp(-75,-30))
        elseif num == 2 and self.TianMingList[i].id == 0 and TianMingManager.SquareTianMingNum ~= 0 then
            self.TianMingkongList[i].btn_jia:setVisible(true)
            CommonManager:setRedPoint(self.TianMingkongList[i],false,"isTianMingRed",ccp(-75,-30))
        elseif num == 3 and self.TianMingList[i].id == 0 and TianMingManager.TriangleTianMingNum ~= 0 then  
            self.TianMingkongList[i].btn_jia:setVisible(true)
            CommonManager:setRedPoint(self.TianMingkongList[i],false,"isTianMingRed",ccp(-75,-30))
        elseif self.TianMingList[i].id ~= 0 then
            local tianming = TianMingManager:getTianMingByGmId(self.TianMingList[i].id)
            self.TianMingkongList[i].img_tm:setVisible(true)
            self.TianMingkongList[i].img_pz:setVisible(true)
            self.TianMingkinglist[i] = tianming.config.kind
            self.TianMingkongList[i].img_tm:setTexture(tianming.config:GetPath())
            self.TianMingkongList[i].img_pz:setTexture(GetColorRoadIconByQuality(tianming.quality))
            if self.index == i then
                self.img_tm:setVisible(true)
                self.img_pz:setVisible(true)
            end
            expnum = expnum + tianming.config.price

            --镶星
            if tianming.starnum > 0 or tianming.starLevel > 0  then
                self.TianMingkongList[i].panel_star:setVisible(true)
                self.TianMingkongList[i].txt_starlv:setText(tianming.starnum)
            end
            if tianming.level > 0 then
                self.TianMingkongList[i].txt_dj:setVisible(true)
                self.TianMingkongList[i].txt_dj:setText("+"..tianming.level)
            end
            --镶星红点
            local bool = TianMingManager:JudgeTianMingUpgrade(tianming.instanceId) 
            self.TianMingRedSwitch[i] = bool
            CommonManager:setRedPoint(self.TianMingkongList[i],bool,"isTianMingRed",ccp(-75,-30))
        end
        expnum = expnum + self.TianMingList[i].exp  
    end 
    self.addjindu.bar_percent:setScale(1)
    local NextExpNum,level = DesTinyMissionData:getTianMingAchievementAttrNextExp(expnum)

    self.addjindu.txt_exp:removeChildByTag(1000, true)
    if expnum >= NextExpNum then
        -- 满级
        self.addjindu.bar_percent:setPercent( 84 )
        self.addjindu.txt_exp:setText( "" )
        local txtLabel = TFLabel:create()
        txtLabel:setText( localizable.roleBook_enchant_max_level )
        txtLabel:setColor(ccBLACK)
        txtLabel:setPosition(ccp(0, -25))
        txtLabel:setFontSize(50)
        txtLabel:setTag(1000)

        self.addjindu.txt_exp:addChild(txtLabel)
    else
        self.addjindu.bar_percent:setPercent( (expnum / NextExpNum)*84)    
        self.addjindu.txt_exp:setText(expnum.."/"..NextExpNum)
    end

    self.addjindu.txt_level:setText(level.."d") 
end
function RoleTianMingLayer:openTianMingDownandUpgrade(idx)
    self.panel_shuxing:setVisible(true)
    self.panel_empty:setVisible(false)
    self.img_tm:setVisible(true)
    self.img_pz:setVisible(true)
    self.panel_star:setVisible(false)
    self.btn_xx:setVisible(false)
    local gmId = self.TianMingList[idx].id
    local tianming = TianMingManager:getTianMingByGmId(gmId)
    self.txt_name:setText(tianming.config.name)
    self.jindu.txt_level:setText(tianming.level)
    local expnum = 0
    if self.MaxNumTianMing > tianming.level then 
        expnum = DesTinyExpData:getExpBylevelandQuality(tianming.level,tianming.quality)
        self.btn_shengji:setTextureNormal("ui_new/tianming/btn_shengji.png")
        self.btn_shengji:setGrayEnabled(false)
        self.btn_shengji:setTouchEnabled(true) 
    else
        expnum = DesTinyExpData:getExpBylevelandQuality(self.MaxNumTianMing-1,tianming.quality)
        self.btn_shengji:setTextureNormal("ui_new/tianming/btn_ymj.png")
        self.btn_shengji:setGrayEnabled(true)
        self.btn_shengji:setTouchEnabled(false)
    end
    self.jindu.bar_percent:setPercent(tianming.exp/expnum*100)
    self.jindu.txt_exp:setText(tianming.exp.."/"..expnum)
    local num = math.ceil(idx / 3)
    self.img_kong:setTexture(self.bqPath[num])
    self.img_tm:setTexture(tianming.config:GetPath())
    self.img_pz:setTexture(GetColorRoadIconByQuality(tianming.quality))

    if tianming.quality >= 4 and TianMingManager:isOpenTianMingStar() == true then
        self.btn_xx:setVisible(true)
        CommonManager:setRedPoint(self.btn_xx,self.TianMingRedSwitch[idx],"isXXRed",ccp(10,10))
    end
    if tianming.starLevel > 0 or tianming.starnum > 0 then
        self.panel_star:setVisible(true) 
        self.txt_starlv:setText(tianming.starnum)
    end
    local attribute1 = tianming.totalAttribute.attribute
    local attribute = {}
    for k,v in pairs(attribute1) do
        table.insert(attribute,{id = k,value = v})
    end
    table.sort(attribute,function (a,b)
         return a.id < b.id
    end)
    for i=1,6 do
        self.panel_sx[i]:setVisible(false)
    end
    local i = 1
    for k,v in pairs(attribute) do
        if i <= 6 then
            self.panel_sx[i]:setVisible(true)
            if v.id == 44 or v.id == 41 or v.id == 42 or v.id == 40 then 
                if v.value < 0 then
                    self.panel_sx[i].txt_name:setText(localizable.TianMingAttributeTypeStr[v.id]..localizable.TianMing_tips10)
                    self.panel_sx[i].txt_base:setText("+"..math.abs(v.value/100) .."%")
                else
                    self.panel_sx[i].txt_name:setText(localizable.TianMingAttributeTypeStr[v.id]..localizable.TianMing_tips9)
                    self.panel_sx[i].txt_base:setText("+"..v.value/100 .."%")
                end
            else
                self.panel_sx[i].txt_name:setText(localizable.TianMingAttributeTypeStr[v.id])
                if v.id <= 15 then
                    self.panel_sx[i].txt_base:setText("+"..v.value)
                else
                    self.panel_sx[i].txt_base:setText("+"..v.value/100 .."%")
                end
            end
            i = i + 1
        end
    end

end
--选中
function RoleTianMingLayer:openTianMingXZ(idx)
    for i = 1,9 do 
        self.TianMingkongList[i].img_xz:setVisible(false)
    end 
    self.TianMingkongList[self.index].img_xz:setVisible(true)
end
return RoleTianMingLayer