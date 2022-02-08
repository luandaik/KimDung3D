--[[
    宠物换功界面
    -- by fei
    -- 2017/04/12
]]

local EudemonExchangeLayer = class("EudemonExchangeLayer", BaseLayer)

function EudemonExchangeLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.pet.PetChange")
end
function EudemonExchangeLayer:initEudemonUi(eudemonUi, num)
    eudemonUi.Panel_shuxinginfo    = TFDirector:getChildByPath(self.ui, "Panel_shuxinginfo_"..num)
    eudemonUi.panel_sx = TFDirector:getChildByPath(eudemonUi.Panel_shuxinginfo, "panel_sx")
    eudemonUi.txt_attr = {}
    for i = 1, 10 do
        local child = TFDirector:getChildByPath(eudemonUi.Panel_shuxinginfo, "img_info_" .. i)
        if (child) then
            child:setVisible(false)
            local pos = i
            eudemonUi.txt_attr[pos]           = child
            eudemonUi.txt_attr[pos].txt_info  = TFDirector:getChildByPath(child, "txt_info")
        end
    end
    eudemonUi.img_pinzhi            = TFDirector:getChildByPath(self.ui, "img_pinzhi"..num)
    eudemonUi.panel_jiemianbiaoti   = TFDirector:getChildByPath(self.ui, "panel_jiemianbiaoti"..num)
    eudemonUi.txt_name              = TFDirector:getChildByPath(eudemonUi.panel_jiemianbiaoti, "txt_name")
    eudemonUi.img_namebg            = TFDirector:getChildByPath(eudemonUi.panel_jiemianbiaoti, "img_namebg")
    eudemonUi.starList = {}
    local panel_xiulian = TFDirector:getChildByPath(self.ui, "panel_xiulian"..num)
    eudemonUi.panel_xiulian = panel_xiulian
    for i = 1, 5 do
        local star = TFDirector:getChildByPath(panel_xiulian, "img_starbg" .. i)
        if (star) then
            local img_star = TFDirector:getChildByPath(star, "img_star")
            img_star:setVisible(false)
            star.img_star           = img_star
            eudemonUi.starList[i]   = star
        end
    end
    --
    eudemonUi.img_rolehei           = TFDirector:getChildByPath(self.ui, "img_rolehei"..num)
    eudemonUi.img_role              = TFDirector:getChildByPath(self.ui, "img_role"..num)
    eudemonUi.panel_rolelist        = TFDirector:getChildByPath(self.ui, "panel_rolelist"..num)
    eudemonUi.btn_jiahao            = TFDirector:getChildByPath(eudemonUi.img_rolehei, "btn_jiahao")
    eudemonUi.panel_rolelist:setTouchEnabled(false)
    eudemonUi.btn_jiahao:setTouchEnabled(false)
    eudemonUi.img_role:setTouchEnabled(true)
    eudemonUi.img_rolehei:setTouchEnabled(true)
end
function EudemonExchangeLayer:initUI(ui)
    --
	self.super.initUI(self, ui)
    self.ui = ui
	--通用头部   
    self.generalHead        = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.EudemonExchange, {HeadResType.COIN, HeadResType.SYCEE})
    self.btn_zhuanhuan      = TFDirector:getChildByPath(ui, "btn_zhuanhuan")
    self.btn_help           = TFDirector:getChildByPath(ui, "btn_help")
    self.Panel_price        = TFDirector:getChildByPath(ui, "Panel_price")
    self.Panel_price:setVisible(false)
    self.eudemonUi_1 = {}
    self.eudemonUi_2 = {}
  
    self:initEudemonUi(self.eudemonUi_1, 1)
    self:initEudemonUi(self.eudemonUi_2, 2)
    ---------------
    self.leftEudemonId  = 0
    self.rightEudemonId = 0
end
function EudemonExchangeLayer:onShow()
    self.super.onShow(self)
    if (self.generalHead) then
        self.generalHead:onShow()
    end

    self:refreshUI()
end

function EudemonExchangeLayer:refreshUI()
    self:refreshEudemonUi(false)
    self:refreshEudemonUi(true)
    self:refreshCostItemUI()
end

--消耗品
function EudemonExchangeLayer:refreshCostItemUI()
    local costItem = EudemonManager:getEudemonExchareItemInfo(self.leftEudemonId, self.rightEudemonId)
    if (costItem) then
        self.Panel_price:setVisible(true)
        local img_iconbg    = TFDirector:getChildByPath(self.Panel_price, "img_iconbg")
        local img_pethead   = TFDirector:getChildByPath(img_iconbg, "img_pethead")
        local txt_number    = TFDirector:getChildByPath(self.Panel_price, "txt_number")
        --
        local data = {self.leftEudemonId, self.rightEudemonId}
        local haveNum = EudemonManager:getByEudemonTypeIdNum(data, costItem.eudemonTypeId)
        txt_number:setText(haveNum.."/"..costItem.num)
        img_iconbg:setTexture(GetColorIconByQuality_118(1))
        --
        local itemId = 0
        local battlePetData = BattlePetData:objectByID(costItem.eudemonTypeId)
        if (battlePetData) then
            itemId = battlePetData:getIcon(1)
        end
        local itemData = ItemData:objectByID(tonumber(itemId))
        if (itemData) then
            img_pethead:setTexture(itemData:GetPath())
            function onClick( sender )
                Public:ShowItemTipLayer(itemData.id, 1, haveNum);
            end
            img_iconbg:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
            img_iconbg:setTouchEnabled(true)
        else
            img_iconbg:setTouchEnabled(false)
        end
    else
        self.Panel_price:setVisible(false)
    end
end

--宠物信息
function EudemonExchangeLayer:refreshEudemonUi(isRight)
    local eudemonId = self.leftEudemonId
    local eudemonUi = self.eudemonUi_1
    if (isRight) then
        eudemonUi                       = self.eudemonUi_2
        eudemonId                       = self.rightEudemonId
        eudemonUi.img_rolehei.isRight   = true
        eudemonUi.img_role.isRight      = true  
    end
    local eudemonInfo = EudemonManager:getEudemonById(eudemonId)
    if (eudemonInfo) then
        eudemonUi.img_pinzhi:setVisible(true)
        eudemonUi.panel_jiemianbiaoti:setVisible(true)
        eudemonUi.panel_xiulian:setVisible(true)
        eudemonUi.Panel_shuxinginfo:setVisible(true)
        eudemonUi.img_role:setVisible(true)
        eudemonUi.img_rolehei:setVisible(false)
        --
        
        eudemonUi.btn_jiahao:setVisible(false)
        eudemonUi.img_role:setTexture(eudemonInfo:getBigImagePath())
        eudemonUi.img_role.logic        = self
        eudemonUi.img_role:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.addExchangEudemon),1)
        local starLevel = eudemonInfo:getStarLevel()
        for i, starBg in ipairs(eudemonUi.starList) do
            starBg.img_star:setVisible(i <= starLevel)
        end
        --
        eudemonUi.img_pinzhi:setTexture(EudemonManager.img_quality[eudemonInfo:getQuality()])
        eudemonUi.txt_name:setText(eudemonInfo:getName())
        eudemonUi.img_namebg:setTexture("ui_new/role/bg-n"..eudemonInfo:getQuality()..".png")
        --
        local totalAttr = eudemonInfo:getTeamAttribute()
        local count = 0
        for attrId,attrValue in pairs(totalAttr.attribute) do
            count = count + 1
            local attr = eudemonUi.txt_attr[count]
            if (attr) then
                local str = AttributeTypeStr[attrId].."    +"..covertToDisplayValue(attrId, attrValue, true)
                attr.txt_info:setText(str)
                attr:setVisible(true)
            else
                print(eudemonId,"*ERROR******refreshEudemonUi()********attrId*",attrId, " attrValue ",attrValue)
            end
        end
        count = count + 1
        for i=count,10 do
            local attr = eudemonUi.txt_attr[i]
            if (attr) then
                attr:setVisible(false)
            end
        end
        self:SetMove(eudemonUi.panel_sx,count)
        return 1
    else
        eudemonUi.img_pinzhi:setVisible(false)
        eudemonUi.panel_jiemianbiaoti:setVisible(false)
        eudemonUi.panel_xiulian:setVisible(false)
        eudemonUi.Panel_shuxinginfo:setVisible(false)
        eudemonUi.img_role:setVisible(false)
        
        --
        eudemonUi.btn_jiahao:setVisible(true)
        eudemonUi.img_rolehei:setVisible(true)
        --
        eudemonUi.img_rolehei.logic     = self
        eudemonUi.img_rolehei:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.addExchangEudemon),1)
        return 0
    end
end

function EudemonExchangeLayer:removeUI()
	self.super.removeUI(self)
end

--销毁方法
function EudemonExchangeLayer:dispose()
	if self.generalHead then
		self.generalHead:dispose()
		self.generalHead = nil
	end

    self.super.dispose(self)
end

function EudemonExchangeLayer:registerEvents()
	self.super.registerEvents(self)
    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHelpClickHandle),1)
    --
    self.btn_zhuanhuan.logic     = self
    self.btn_zhuanhuan:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onExchangeClickHandle),1)
    --
    self.receiveInfo = function(event)
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/xiakehuangong.xml")
        local effect = TFArmature:create("xiakehuangong_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:setPosition(ccp(self.ui:getContentSize().width / 2, self.ui:getContentSize().height / 2))
        self.ui:addChild(effect, 1)
        effect:playByIndex(0, -1, -1, 0)
        --
        effect:addMEListener(TFARMATURE_COMPLETE, function()
            toastMessage(localizable.xiakezhuanhuan_success)
            if effect then
                effect:removeFromParent()
                effect = nil
            end
        end)                
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(EudemonManager.EudemonExchange, self.receiveInfo)
    if self.generalHead then
        self.generalHead:registerEvents()
    end
end

function EudemonExchangeLayer:removeEvents()
    self.super.removeEvents(self)

    if self.generalHead then
        self.generalHead:removeEvents()
    end
    TFDirector:removeMEGlobalListener(EudemonManager.EudemonExchange, self.receiveInfo)
    self.receiveInfo = nil
end
--添加换功宠物
function EudemonExchangeLayer.addExchangEudemon(sender)
    local self = sender.logic
	if (sender.isRight) then
        EudemonManager:openEudemonListExchangeLayer(self.leftEudemonId, 2, function(eudemonId)
                                                                               self.rightEudemonId = eudemonId
                                                                            end)  
    else
        EudemonManager:openEudemonListExchangeLayer(self.rightEudemonId, nil, function(eudemonId)
                                                                               self.leftEudemonId = eudemonId
                                                                            end)   
    end
end

--=======================================
function EudemonExchangeLayer.onExchangeClickHandle(sender)
    local self = sender.logic
    if (self.leftEudemonId == 0 or self.rightEudemonId == 0) then
        toastMessage(localizable.Eudemon_tips_9)
        return
    end
    local costItem = EudemonManager:getEudemonExchareItemInfo(self.leftEudemonId, self.rightEudemonId)
    if (costItem == nil) then
        print("**ERROR***********bigenExchange****************", self.leftEudemonId, ",",self.rightEudemonId)
        return
    end
    -- local haveNum = EudemonManager:getByEudemonTypeIdNum({costItem.eudemonId}, costItem.eudemonTypeId)
    local haveNum = EudemonManager:getByEudemonTypeIdNum({self.leftEudemonId, self.rightEudemonId}, costItem.eudemonTypeId)
    if (haveNum < costItem.num) then
        local itemId = 0
        local battlePetData = BattlePetData:objectByID(costItem.eudemonTypeId)
        if (battlePetData) then
            itemId = tonumber(battlePetData:getIcon(1))
        end
        -- if MallManager:checkShopOneKey( tonumber(itemId) ) == false then
        if ResGetWayManager:openResGetLayer(itemId, EnumDropType.GOODS) == false then
            toastMessage(localizable.Eudemon_item)
        end    
        -- local itemData = ItemData:objectByID(tonumber(itemId))
        -- if (itemData) then
        --     IllustrationManager:showOutputList({output = itemData.show_way})
        -- end
        return
    end
    local layer = CommonManager:showOperateSureLayer(
        function(data, widget)
            EudemonManager:sendEudemonBattleExchange(self.leftEudemonId, self.rightEudemonId)
        end,
        function(data, widget)
            AlertManager:close()
        end,
        {
           -- msg="是否确认战宠换功?",
            --title       = localizable.common_pay_tips_2,            
            msg         = localizable.Eudemon_tips_8,
            showtype    = AlertManager.BLOCK_AND_GRAY
        }
    )
end

--开始宠物换功
function EudemonExchangeLayer:bigenExchange()
    
    
end

--
function EudemonExchangeLayer.onHelpClickHandle(sender)
    CommonManager:showRuleLyaer("petexchange")
end
function EudemonExchangeLayer:SetMove(node,index)
    if node == nil then
        return nil
    end
    if node.moveTween then
        TFDirector:killTween(node.moveTween)
        node.moveTween = nil
        node:setPositionY(node.initPosY)
    end

    if node.initPosY == nil then
        node.initPosY = node:getPositionY()
    end  
    local limitAttrNum = 6
    if index > limitAttrNum then 
        local moveDy = (index - limitAttrNum)*20
        local posY = node.initPosY
        local moveTween = 
        {
            target = node,
            repeated = -1,
            {
                duration = 2,
                delay = 1,
                y = posY + moveDy+10,
                      
            },
            { -- 此节实现节与节之间的延时
                duration = 1,
                delay = 1, 
                onComplete = function()
                    node:setPositionY(posY)
                end    
            },
        }
        TFDirector:toTween(moveTween)
        node.moveTween = moveTween
    end
end
return EudemonExchangeLayer