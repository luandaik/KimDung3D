
local GetRoleResultLayer = class("GetRoleResultLayer", BaseLayer)

function GetRoleResultLayer:ctor(data)
	self.cardType = data[1]
	self.roleIndex = data[2]
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.shop.GetRoleResultLayer")
    -- if self.cardType < 3 then
    	self:PlayStartEffect()
    	play_zhaomu_chouquxiake()
    -- else
    -- 	self:PlayShowRoleEffect()
    -- end
end

function GetRoleResultLayer:initUI(ui)
	self.super.initUI(self,ui)
	self.rolebgImg = TFDirector:getChildByPath(ui, "rolebgImg")
	self.rolebgImg:setVisible(false)
	self.ui = ui
end

function GetRoleResultLayer:registerEvents(ui)
	self.super.registerEvents(self)

	self.returnBtn = TFDirector:getChildByPath(ui, 'returnBtn')
    ADD_ALERT_CLOSE_LISTENER(self, self.returnBtn)
    self.returnBtn:setClickAreaLength(100)
    self.returnBtn:setVisible(false)

    self.zhiyePanel = TFDirector:getChildByPath(ui, 'zyImg')
    self.zhiyePanel:setVisible(false)

    self.jieshaoPanel = TFDirector:getChildByPath(ui, 'jsImg')
    self.jieshaoPanel:setVisible(false)

    self.getCardBtn = TFDirector:getChildByPath(ui, "getCardBtn")
    self.getCardBtn:addMEListener(TFWIDGET_CLICK, 
	audioClickfun(function()
		if GetCardManager:SendGetCardMsg(self.cardType) then
			AlertManager:close()
		end
	end),1)
	self.getCardBtn:setVisible(false)

	self.ui:setTouchEnabled(false)
	if self.cardType == 3 then
		-- self.ui:setTouchEnabled(true)
		self.ui:addMEListener(TFWIDGET_CLICK, 
		audioClickfun(function()
			local roleIndex = self.roleIndex
			AlertManager:close()
			local tenLayer = AlertManager:getLayerByName("lua.logic.shop.GetTenRoleResultLayer")
			if tenLayer ~= nil then
				tenLayer:ShowRoleIcon(roleIndex)
			end
		end))
	end
end

function GetRoleResultLayer:PlayStartEffect()
	TFResourceHelper:instance():addArmatureFromJsonFile("effect/zm1.xml")
	local effect = TFArmature:create("zm1_anim")
	if effect == nil then
		return
	end

	effect:setZOrder(-100)
	effect:setAnimationFps(GameConfig.ANIM_FPS)
	effect:playByIndex(0, -1, -1, 0)
	effect:setPosition(ccp(GameConfig.WS.width/2, GameConfig.WS.height/2))

	self.ui:addChild(effect)

	local timerID = TFDirector:addTimer(200, 1, nil,
	function()
		-- self.ui:setTouchEnabled(false)
		-- self.ui:removeMEListener(TFWIDGET_CLICK)
		TFDirector:removeTimer(timerID)
		self:PlayShowRoleEffect()
	end)

	-- self.ui:setTouchEnabled(true)
	-- self.ui:addMEListener(TFWIDGET_CLICK, 
	-- audioClickfun(function()
	-- 	self.ui:setTouchEnabled(false)
	-- 	effect:setAnimationScale(100)
	-- 	TFDirector:removeTimer(timerID)
	-- 	self:PlayShowRoleEffect()
	-- 	self.ui:removeMEListener(TFWIDGET_CLICK)
	-- end),1)
end

function GetRoleResultLayer:PlayShowRoleEffect()
	TFResourceHelper:instance():addArmatureFromJsonFile("effect/zm3.xml")
	local effect = TFArmature:create("zm3_anim")
	if effect == nil then
		return
	end

	effect:setZOrder(-99)
	effect:setAnimationFps(GameConfig.ANIM_FPS)
	effect:playByIndex(0, -1, -1, 1)
	effect:setPosition(ccp(GameConfig.WS.width/2, GameConfig.WS.height/2 + 130))
	self.ui:addChild(effect)

	TFResourceHelper:instance():addArmatureFromJsonFile("effect/zm4.xml")
	local roleBgEffect = TFArmature:create("zm4_anim")
	if roleBgEffect == nil then
		return
	end
	roleBgEffect:setZOrder(10)
	roleBgEffect:setAnimationFps(GameConfig.ANIM_FPS)
	roleBgEffect:playByIndex(0, -1, -1, 0)
	roleBgEffect:setPosition(ccp(GameConfig.WS.width/2, GameConfig.WS.height/2))
	self.ui:addChild(roleBgEffect)

	self:ShowRole()
end

function GetRoleResultLayer:ShowRole()
	local newCardRoleData = RoleData:objectByID(GetCardManager.getCardTypeList[self.roleIndex].resId)
	if newCardRoleData == nil then
		print(GetCardManager.getCardTypeList[self.roleIndex].resId.."role not find")
		assert(false)
		return
	end
	RoleSoundData:playSoundByIndex(GetCardManager.getCardTypeList[self.roleIndex].resId)
	self.rolebgImg:setVisible(true)
	local nameLabel = TFDirector:getChildByPath(self.rolebgImg, "nameLabel")
	local tipLabel = TFDirector:getChildByPath(self.rolebgImg, "tipLabel")
	local gxhdImg = TFDirector:getChildByPath(self.rolebgImg, "gxhdImg")
	local qualityIcon = TFDirector:getChildByPath(self.rolebgImg, "qualityIcon")
	local footImg = TFDirector:getChildByPath(self.rolebgImg, "footImg")
	footImg:setVisible(false)
	nameLabel:setVisible(false)
	tipLabel:setVisible(false)
	gxhdImg:setVisible(false)
	qualityIcon:setVisible(false)

	local roleImg = TFDirector:getChildByPath(self.rolebgImg, "roleImg")
	roleImg:setTexture(newCardRoleData:getBigImagePath())
	roleImg:setScale(2)
	roleImg:setOpacity(80)
	local roleTween = 
	{
		target = roleImg,
		{
			duration = 0.3,
			alpha = 255,
			scale = 0.2,
		},
		{ 
   			duration = 0.2,
   			scale = 0.43,

   			onComplete = function ()
				self:OnRoleShowEnd(newCardRoleData)
				self:ShowRoleDetail(newCardRoleData)
			end	
		},
	}
	TFDirector:toTween(roleTween)
end

function GetRoleResultLayer:DrawAttrPolygon(attribute_level)
 	local attrPolygon = TFDrawNode:create()
    self.zhiyePanel:addChild(attrPolygon)
    attrPolygon:setColor(ccc4(0x5b,0xc4,0xff, 80))
    attrPolygon:setBorderWidth(0)

    local attrLevel = string.split(attribute_level, ",")
    for i=1,#attrLevel do
    	attrLevel[i] = 0.4 + 0.6*attrLevel[i]/10
    	attrLevel[i] = math.min(1, attrLevel[i])
    end

    local tb = 
    {
        ccp(0, 68*attrLevel[1]), 
        ccp(70*attrLevel[4],  15*attrLevel[4]),
        ccp(43*attrLevel[5], -68*attrLevel[5]), 
        ccp(-43*attrLevel[3],-68*attrLevel[3]), 
        ccp(-70*attrLevel[2], 15*attrLevel[2])
    }

    attrPolygon:drawPolygon(tb)
    attrPolygon:setPosition(ccp(0, 26))
end

function GetRoleResultLayer:ShowRoleDetail(newCardRoleData)
	self.zhiyePanel:setVisible(true)

	local zhiyeIcon = TFDirector:getChildByPath(self.zhiyePanel, "zhiyeIcon")
	zhiyeIcon:setTexture("ui_new/common/img_zy"..newCardRoleData.outline..".png")

	local zhiyeLabel = TFDirector:getChildByPath(self.zhiyePanel, "zhiyeLabel")
	zhiyeLabel:setText(newCardRoleData.attr_description)

	local trainItem = RoleTrainData:getRoleTrainByQuality(newCardRoleData.quality, 0,newCardRoleData.qualityOne)
	local attribute = GetAttrByString(newCardRoleData.attribute)
	local attrLevel = string.split(newCardRoleData.attribute_level, ",")

	local temp = attrLevel[4]
	attrLevel[4] = attrLevel[3]
	attrLevel[3] = temp
	local maxAttrIndex = 1
	local maxAttrNum = 0
	for i=1,5 do
		local attrImg = TFDirector:getChildByPath(self.zhiyePanel, "attrImg"..i)
		local numberLabel = TFDirector:getChildByPath(attrImg, "numberLabel")
		local attrNum = math.floor(attribute[i]*trainItem.streng_then)
		numberLabel:setText(attrNum)
		if tonumber(attrLevel[i]) > maxAttrNum then
			maxAttrIndex = i
			maxAttrNum = tonumber(attrLevel[i])
		end
	end

	self:DrawAttrPolygon(newCardRoleData.attribute_level)

	local imgName = {"zm_qixue2", "zm_wuli2", "zm_fangyu2", "zm_neili2", "zm_shenfa2"}
	local maxAttrImg = TFDirector:getChildByPath(self.zhiyePanel, "attrImg"..maxAttrIndex)
	maxAttrImg:setTexture("ui_new/shop/"..imgName[maxAttrIndex]..".png")

	local panelPos = self.zhiyePanel:getPosition()
	self.zhiyePanel:setPosition(ccp(0, panelPos.y))
	local zhiyeMoveTween = 
	{
		target = self.zhiyePanel,
		{
			duration = 0.2,
			x = panelPos.x,
			y = panelPos.y,

			onComplete = function ()
				self.ui:setTouchEnabled(true)
			end
		},
	}
	TFDirector:toTween(zhiyeMoveTween)

	self.jieshaoPanel:setVisible(true)
	local tipLabel = TFDirector:getChildByPath(self.jieshaoPanel, "tipLabel")
	tipLabel:setText(newCardRoleData.description)

	panelPos = self.jieshaoPanel:getPosition()
	self.jieshaoPanel:setPosition(ccp(GameConfig.WS.width, panelPos.y))
	local jieshaoMoveTween = 
	{
		target = self.jieshaoPanel,
		{
			duration = 0.3,
			x = panelPos.x,
			y = panelPos.y,
		},
	}
	TFDirector:toTween(jieshaoMoveTween)
end

function GetRoleResultLayer:OnRoleShowEnd(newCardRoleData)
	local rolebgImg = self.rolebgImg

	local nameLabel = TFDirector:getChildByPath(rolebgImg, "nameLabel")
	nameLabel:setVisible(true)
	nameLabel:setText(newCardRoleData.name)

	local footImg = TFDirector:getChildByPath(rolebgImg, "footImg")
	footImg:setVisible(true)
	footImg:setTexture("ui_new/shop/zm_role"..newCardRoleData.quality..".png")

	local tipLabel = TFDirector:getChildByPath(rolebgImg, "tipLabel")
	local gxhdImg = TFDirector:getChildByPath(rolebgImg, "gxhdImg")
	if GetCardManager.getCardTypeList[self.roleIndex].number == 0 then
		local pos = nameLabel:getPosition()
		tipLabel:setVisible(false)
		gxhdImg:setVisible(false)
	else
		tipLabel:setVisible(true)
		--tipLabel:setText("此侠客自动转换为"..GetCardManager.getCardTypeList[self.roleIndex].number.."张同角色魂卡")
		tipLabel:setText(stringUtils.format(localizable.goldEggRole_zhuanhuan,GetCardManager.getCardTypeList[self.roleIndex].number))
		
		gxhdImg:setVisible(true)
	end

	local qualityIcon = TFDirector:getChildByPath(rolebgImg, "qualityIcon")
	qualityIcon:setTexture(GetFontByQuality(newCardRoleData.quality))
	qualityIcon:setVisible(true)

	local getCardBtnPath = {"ui_new/shop/zmyi.png", "ui_new/shop/zmj.png", "ui_new/shop/zmjs.png"}
	self.getCardBtn:setTextureNormal(getCardBtnPath[self.cardType])

	if self.cardType ~= 3 then
		self.getCardBtn:setVisible(true)
		self.returnBtn:setVisible(true)
	end

	-- local yuanBaoCost = {ConstantData:getValue("Recruit.Consume.Sycee.Hundred"), ConstantData:getValue("Recruit.Consume.Sycee.Million"), 
	-- 				 	 ConstantData:getValue("Recruit.Consume.Sycee.Million.Batch")}
	local yuanbaoLabel = TFDirector:getChildByPath(self.ui, "yuanbaoLabel")
	local todayTimes = GetCardManager.cardStateInfo[self.cardType].todayTimes or 0	
	yuanbaoLabel:setText(GetRolePriceData:getNowPrice( self.cardType , todayTimes + 1 ))

	local yuanbaoImg = TFDirector:getChildByPath(self.ui, "yuanbaoImg")
	yuanbaoImg:setVisible(true)
	yuanbaoLabel:setVisible(true)

	local icon = {"zm_cha_icon.png", "zm_jiu_icon.png" , "zm_nverhong_icon.png"}
	local zhaomutool = TFDirector:getChildByPath(self.ui, "zhaomutool")
	zhaomutool:setVisible(false)
	local RecruitData = RecruitRateData:objectByID(self.cardType)
    if RecruitData then
        local goodId 	= RecruitData.consume_goods_id
        local costTool 	= RecruitData.consume_goods_num
        local tool 		= BagManager:getItemById(goodId)

        if tool and tool.num >= costTool then
			-- yuanbaoLabel:setText(tool.num)
			yuanbaoLabel:setText(1)
			yuanbaoImg:setVisible(false)
			zhaomutool:setVisible(true)
			zhaomutool:setTexture("ui_new/common/"..icon[self.cardType])
        end
    end
end

return GetRoleResultLayer
