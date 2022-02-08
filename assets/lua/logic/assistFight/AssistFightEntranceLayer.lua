--[[
******助战入口*******

	-- by quanhuan
	-- 2015/11/25
]]

local AssistFightEntranceLayer = class("AssistFightEntranceLayer",BaseLayer)

function AssistFightEntranceLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.ZhuZhan.ZhuzhanRukou")
end

function AssistFightEntranceLayer:initUI( ui )
	self.super.initUI(self, ui)

    -- self.bg = TFDirector:getChildByPath(ui, "bg")
    -- self.bg:setTouchEnabled(true)
    -- self.bgSize = self.bg:getContentSize()
    -- self.bg:setVisible(false)
    -- self.IconTable = {}
    -- self.originalPost = {}
    -- for i=1,6 do
    --     local uiNode = TFDirector:getChildByPath(ui, "rolebg"..i)
    --     self.IconTable[i] = {}
    --     self.IconTable[i].Frame = uiNode
    --     self.IconTable[i].Head = TFDirector:getChildByPath(uiNode, "img_role")
    --     self.IconTable[i].Lock = TFDirector:getChildByPath(ui, "icon_suo"..i)

    --     TFResourceHelper:instance():addArmatureFromJsonFile("effect/assistSmalllock.xml")
    --     local effect = TFArmature:create("assistSmalllock_anim")
    --     effect:setVisible(true)
    --     effect:playByIndex(0, -1, -1, 1)
    --     self.bg:addChild(effect)
    --     effect:setPosition(ccp(0,0)) 
    --     self.IconTable[i].effect = effect

    --     self.originalPost[i] = uiNode:getPosition()
    -- end

    -- self.friendIcon = TFDirector:getChildByPath(ui, 'rolebg7')
    -- self.friendIcon:setVisible(false)

    self.bg_tips = TFDirector:getChildByPath(ui, 'bg_tips')
    self.bg_tips:setVisible(false)
    self.img_diwen = TFDirector:getChildByPath(ui, 'img_diwen')
    

    self.strategyBtn = TFDirector:getChildByPath(ui, "btn_fazhen")
    self.strategyLock = TFDirector:getChildByPath(self.strategyBtn, "img_lock")
    self.strategyQuality = TFDirector:getChildByPath(self.strategyBtn, "img_quality")
    self.strategyIcon = TFDirector:getChildByPath(self.strategyBtn, "img_equip")
    self.strategyAdd = TFDirector:getChildByPath(self.strategyBtn, "img_add")

    self.btn_zhuzhan = TFDirector:getChildByPath(ui, "btn_zhuzhan")

    self.btn_pet        = TFDirector:getChildByPath(ui, "btn_pet")
    self.img_quality    = TFDirector:getChildByPath(self.btn_pet, "img_quality")
    self.img_equip      = TFDirector:getChildByPath(self.btn_pet, "img_equip")
    self.img_lock       = TFDirector:getChildByPath(self.btn_pet, "img_lock")
    self.img_add        = TFDirector:getChildByPath(self.btn_pet, "img_add")
    self.img_quality:setVisible(false)
    self.img_equip:setVisible(false)
    --self.img_lock:setVisible(false)
    self.img_add:setVisible(false)
    --

    self.unLockData = require('lua.table.t_s_assistant_rule')    
end

function AssistFightEntranceLayer:removeUI()
   	self.super.removeUI(self)    
end

function AssistFightEntranceLayer:onShow()
    self.super.onShow(self)    

  --  self:refreshGridInfo()

    self:refreshStrategy()

    self:refreshEudemonInfo()
    Public:addSelectIconForStrategyCard(self.strategyBtn, false)
end

function AssistFightEntranceLayer:registerEvents()

	if self.registerEventCallFlag then
		return
	end
	self.super.registerEvents(self)

    -- self.bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.iconTableBtnClick))
    -- self.bg.logic = self
    --
    self.btn_pet:addMEListener(TFWIDGET_CLICK, audioClickfun(self.eudemonBtnClick))
    self.btn_pet.logic = self
    self.img_quality:addMEListener(TFWIDGET_CLICK, audioClickfun(self.eudemonBtnClick))
    self.img_quality.logic = self
    --  
    self.btn_zhuzhan:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.iconTableBtnClick),1)
    self.btn_zhuzhan.logic = self

    self.strategyBtn:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onStrategyClickHandle))
    self.strategyBtn.logic = self

   	self.registerEventCallFlag = true

    local openLevel = FunctionOpenConfigure:getOpenLevel(1203)
    if MainPlayer:getLevel() >= openLevel then
        -- self.bg:setVisible(true)
        self.bg_tips:setVisible(false)
        self.btn_zhuzhan:setVisible(true)
    else
        self.bg_tips:setVisible(true)
        self.img_diwen:setVisible(false)
        self.btn_zhuzhan:setVisible(false)
        -- self.bg:setVisible(false)
        self.btn_pet:setVisible(false)
        self.btn_zhuzhan:setVisible(false)
        self.strategyBtn:setVisible(false)
    end
    local petOpenLevel = FunctionOpenConfigure:getOpenLevel(2226)
    self.img_lock:setVisible(MainPlayer:getLevel() < petOpenLevel)
    self.cardEquipHandleCallBack = function(event)
        local handleType = event.data[1][1]
        if handleType == StrategyCardManager.handleDress or handleType == StrategyCardManager.handleDressChange then
            self:showEquipEffect(self.strategyBtn)
        end
    end
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyMessage,self.cardEquipHandleCallBack)


    self.eudemonCallBack = function(event)
        local handleType = event.data[1][1]
        if handleType == 1 then
            self:showEquipEffect(self.btn_pet)
        end
        self:refreshEudemonInfo()
    end
    TFDirector:addMEGlobalListener(EudemonManager.EquipTeamEudemon,self.eudemonCallBack)

    self.eudemonCallBack1 = function(event)

        --print("-------event.data[1][1]---------",event)
        local isToMsg = false
        -- if (event and event.data[1] and event.data[1][1]) then
        --     isA = event.data[1][1]
        -- end
        --新上阵侠客是当前阵容宠物训练师时
        local roleList = clone(ZhengbaManager:getFightList(self.LineUpType))
        local eudemonInfo = EudemonManager:getEudemonInfoByFightId(self.LineUpType)
        if (eudemonInfo) then
            local trainingRoleId = eudemonInfo:getTrainingRoleId()
            if (trainingRoleId and trainingRoleId ~= 0) then
                for __,_roleId in pairs(roleList) do
                    if (trainingRoleId == _roleId) then
                        isToMsg = true
                        for _,roleId in pairs(self.roleList) do
                            if (trainingRoleId == roleId) then
                                isToMsg = false
                                break
                            end
                        end
                        break
                    end
                end
            end
        end
        self.roleList = roleList
        self:refreshEudemonInfo(isToMsg)
    end
    TFDirector:addMEGlobalListener(ZhengbaManager.UPDATEFORMATIONSUCESS,self.eudemonCallBack1)
    TFDirector:addMEGlobalListener(StrategyManager.UPDATE_GENERRAL_LIST,self.eudemonCallBack1)
    TFDirector:addMEGlobalListener(BloodFightManager.UPDATE_GENERRAL_LIST,self.eudemonCallBack1)
end

function AssistFightEntranceLayer:removeEvents()

    --self.bg:removeMEListener(TFWIDGET_CLICK)

    self.super.removeEvents(self)
    self.registerEventCallFlag = nil

    if self.equipEffect then
        self.equipEffect:removeMEListener(TFARMATURE_COMPLETE)
        self.equipEffect:removeFromParentAndCleanup(true)
        self.equipEffect = nil
    end
    if self.cardEquipHandleCallBack then
        TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyMessage,self.cardEquipHandleCallBack)
        self.cardEquipHandleCallBack = nil
    end
    if self.eudemonCallBack then
        TFDirector:removeMEGlobalListener(EudemonManager.EquipTeamEudemon,self.eudemonCallBack)
        self.eudemonCallBack = nil
    end
    if self.eudemonCallBack1 then
        TFDirector:removeMEGlobalListener(ZhengbaManager.UPDATEFORMATIONSUCESS,self.eudemonCallBack1)
        TFDirector:removeMEGlobalListener(StrategyManager.UPDATE_GENERRAL_LIST,self.eudemonCallBack1)
        TFDirector:removeMEGlobalListener(BloodFightManager.UPDATE_GENERRAL_LIST,self.eudemonCallBack1)
        self.eudemonCallBack1 = nil
    end
end

function AssistFightEntranceLayer:dispose()
    self.super.dispose(self)
end

function AssistFightEntranceLayer.iconTableBtnClick(btn)
    local self = btn.logic  
    if self.LineUpCallBack then
        self.LineUpCallBack()
        return
    end
    AssistFightManager:openAssistWithType(self.LineUpType) 
end
--
function AssistFightEntranceLayer.eudemonBtnClick(btn)
    local self = btn.logic
    EudemonManager:openRoleEudemonInfoLayer(self.LineUpType)
end
--
function AssistFightEntranceLayer.zhuzaBtnClick(btn)
    local self = btn.logic
    AssistFightManager:openAssistWithType(self.LineUpType)
end
--
function AssistFightEntranceLayer:refreshGridInfo()
    local gridState = AssistFightManager:getGridList() or {}
    local roleList = AssistFightManager:getAssistRoleList( self.LineUpType ) or {}

    print("roleList = ", roleList)
    print("gridState = ", gridState)
    -- gridState = {false,false,false,false,false,false}

    local gridIdx = 1
    for k,v in pairs(gridState) do
        self.IconTable[k].Frame:setVisible(v)
        self.IconTable[k].Head:setVisible(v)
        self.IconTable[k].Lock:setVisible(not v)
        self.IconTable[k].effect:setVisible(false)
        if v then
            self.IconTable[k].Frame:setPosition(self.originalPost[k])
            self.IconTable[k].Lock:setPosition(self.originalPost[k])           
            
            gridIdx = gridIdx + 1


            if roleList[k] and roleList[k] > 0 then
                local cardRole = CardRoleManager:getRoleByGmid( roleList[k] )
                if cardRole then
                    self.IconTable[k].Frame:setTexture(GetColorRoadIconByQuality(cardRole.quality))
                    self.IconTable[k].Head:setTexture(cardRole:getHeadPath())
                else
                    self.IconTable[k].Frame:setVisible(false)
                end
            else
                self.IconTable[k].Frame:setVisible(false)
            end        
        end        
    end  

    for k,v in pairs(gridState) do
        if v == false then            
            self.IconTable[k].Frame:setPosition(self.originalPost[k])
            self.IconTable[k].Lock:setPosition(self.originalPost[k])
            local unLockState = self.unLockData:getObjectAt(k)
            if k == 4 then   
                if ClimbManager:getClimbFloorNum() >= unLockState.val then             
                    self.IconTable[k].effect:setVisible(true)
                    local x = self.originalPost[k].x + self.bgSize.width/2
                    local y = self.originalPost[k].y + self.bgSize.height/2
                    self.IconTable[k].effect:setPosition(ccp(x,y))
                    -- self.IconTable[k].effect:setZOrder(1)                        
                    self.IconTable[k].Lock:setVisible(false)
                end
            elseif k == 5 then
                self.IconTable[k].effect:setVisible(false)
                -- self.IconTable[k].Lock:setVisible(false)
            elseif k == 6 then
                if MainPlayer:getVipLevel() >= unLockState.val then
                    self.IconTable[k].effect:setVisible(true)
                    local x = self.originalPost[k].x + self.bgSize.width/2
                    local y = self.originalPost[k].y + self.bgSize.height/2
                    self.IconTable[k].effect:setPosition(ccp(x,y))                    
                    self.IconTable[k].Lock:setVisible(false)
                end
            else
                if MainPlayer:getLevel() >= unLockState.val then
                    self.IconTable[k].effect:setVisible(true)
                    local x = self.originalPost[k].x + self.bgSize.width/2
                    local y = self.originalPost[k].y + self.bgSize.height/2
                    self.IconTable[k].effect:setPosition(ccp(x,y))                    
                    self.IconTable[k].Lock:setVisible(false)
                end
            end
            gridIdx = gridIdx + 1
        end
    end    

    for i=1,#AssistFightManager.CloseFriendType do
        if self.LineUpType == AssistFightManager.CloseFriendType[i] then
            self.friendIcon:setVisible(false)
            return
        end
    end

    local info = AssistFightManager:getFriendIconInfo()
    local cardRole = RoleData:objectByID(info.friendRoleId)
    if cardRole then
        self.friendIcon:setVisible(true)
        self.friendIcon:setTexture(GetColorRoadIconByQuality(cardRole.quality))
        local head = TFDirector:getChildByPath(self.friendIcon, "img_role")
        head:setTexture(cardRole:getHeadPath())
    else
        self.friendIcon:setVisible(false)
    end
end

function AssistFightEntranceLayer:setLineUpType( Type,callBack )
    self.LineUpType = Type   
    AssistFightManager:refreshAssistRoleList( Type )
    self.LineUpCallBack = callBack

    if self.LineUpType == EnumFightStrategyType.StrategyType_MERCENARY_TEAM or self.LineUpType == EnumFightStrategyType.StrategyType_HIRE_TEAM then
        self.strategyBtn:setVisible(false)
        self.strategyLock:setVisible(false)
        self.strategyQuality:setVisible(false)
        self.strategyIcon:setVisible(false)
        self.strategyAdd:setVisible(false)
        self.btn_pet:setVisible(false)
    end
    self:refreshEudemonInfo()
    if (self.roleList == nil) then
        self.roleList = clone(ZhengbaManager:getFightList(Type))
    end
end
function AssistFightEntranceLayer:refreshEudemonInfo(isToastMessage)
    CommonManager:setRedPoint(self.btn_pet, false,"isEudemonTraining", ccp(0, 0))
    local eudemonId = EudemonManager:getEudemonByFightId(self.LineUpType)
    if (eudemonId ~= 0) then
        self.img_add:setVisible(false)
        
        local eudemonInfo = EudemonManager:getEudemonById(eudemonId)
        if (eudemonInfo) then
            self.img_equip:setTexture(eudemonInfo:getIconPath())
            self.img_equip:setVisible(true)
            self.img_quality:setTextureNormal(GetColorIconByQuality(eudemonInfo:getQuality()))
            EudemonManager:BindEffectOnEquip(self.img_quality, eudemonId)
            self.img_quality:setVisible(true)
            CommonManager:setRedPoint(self.btn_pet, EudemonManager:isShowRedPointOpenTraining(self.LineUpType),"isEudemonTraining", ccp(0, 0))
            local sprite = self.img_equip:getChildByName("sprite_eudemon")
            local roldId = eudemonInfo:getTrainingRoleId()
            if (EudemonManager:isEudemonRoleIdFight(roldId, self.LineUpType)) then
                --驯养师不起作用
                if (sprite == nil) then
                    sprite = TFImage:create("ui_new/SkillStrategy/img_gantanhao.png")
                    self.img_equip:addChild(sprite)
                end
                if (sprite) then
                    sprite:setVisible(true)
                    sprite:setName("sprite_eudemon")
                    sprite:setPosition(ccp(self.img_equip:getContentSize().width / 2, self.img_equip:getContentSize().height / 2));       
                end
                if (isToastMessage) then
                    TFDirector:addTimer( 500, 1, nil ,function () toastMessage(localizable.Eudemon_tips_5) end)
                end
            else
                if (sprite) then
                    sprite:setVisible(false)
                end
            end
        end
    else
        local eudemonList = EudemonManager:getEudemonList()
        self.img_add:setVisible(eudemonList:length() > 0)

        
        self.img_equip:setVisible(false)
        self.img_quality:setVisible(false)
    end
end

function AssistFightEntranceLayer:refreshStrategy()
    self.strategyQuality:setVisible(false)
    self.strategyIcon:setVisible(false)
    self.strategyLock:setVisible(false)
    self.strategyAdd:setVisible(false)

    if StrategyCardManager:checkIsOpen() == false then
        self.strategyLock:setVisible(true)
        return
    end
    local cardInfo = StrategyCardManager:getStrategyCardByStrategyType(self.LineUpType)
    local allCard = StrategyCardManager:getAllStrategyCard():length()
    if cardInfo then
        self.strategyQuality:setVisible(true)
        self.strategyQuality:setTextureNormal(GetColorIconByQuality_118(cardInfo:getQuality()))
        self.strategyQuality:setTouchEnabled(false)
        self.strategyIcon:setVisible(true)
        self.strategyIcon:setTexture(cardInfo:getPath())
    end
    if allCard ~= 0 then
        self.strategyAdd:setVisible(true)
    end    
end

function AssistFightEntranceLayer.onStrategyClickHandle( btn )
    local self = btn.logic

    Public:addSelectIconForStrategyCard(self.strategyBtn, true)
    
    StrategyCardManager:openCardDressLayerByType(self.LineUpType)    
end

function AssistFightEntranceLayer:showEquipEffect(btn)
    if self.equipEffect == nil then
        local resPath = "effect/book_get_effect.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        local effect = TFArmature:create("book_get_effect_anim")
        btn:addChild(effect, 100)
        effect:setPosition(ccp(0, 0))
        self.equipEffect = effect
        effect:addMEListener(TFARMATURE_COMPLETE,function()
            self.equipEffect:removeFromParentAndCleanup(true)
            self.equipEffect = nil
        end)
    end
    self.equipEffect:playByIndex(0, -1, -1, 0)
end

return AssistFightEntranceLayer
