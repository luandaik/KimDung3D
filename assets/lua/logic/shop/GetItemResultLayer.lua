
local GetItemResultLayer = class("GetItemResultLayer", BaseLayer)

function GetItemResultLayer:ctor(data)
	self.cardType = data[1]
	self.roleIndex = data[2]
	self.goodsInfo = GetCardManager.getCardTypeList[self.roleIndex]
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.shop.GetItemResultLayer")
    play_zhaomu_chouquxiahun()
end

function GetItemResultLayer:initUI(ui)
	self.super.initUI(self,ui)


	self.panel_effect 	= TFDirector:getChildByPath(ui, "panel_effect")
	self.img_quality 	= TFDirector:getChildByPath(ui, "img_quality_bg")
	self.img_icon 		= TFDirector:getChildByPath(ui, "img_icon")
	self.txt_num 		= TFDirector:getChildByPath(ui, "txt_num")
	self.returnBtn = TFDirector:getChildByPath(ui, 'returnBtn')
    self.getCardBtn = TFDirector:getChildByPath(ui, "getCardBtn")



	self.quality_pos = clone(self.img_quality:getPosition())
	self.img_quality:setVisible(false)
	self:PlayStartEffect()
end

function GetItemResultLayer:removeUI()

end

function GetItemResultLayer:registerEvents()
    ADD_ALERT_CLOSE_LISTENER(self, self.returnBtn)
    self.returnBtn:setClickAreaLength(100)
    self.returnBtn:setVisible(false)

    self.getCardBtn:addMEListener(TFWIDGET_CLICK, 
	audioClickfun(function()
		if GetCardManager:SendGetCardMsg(self.cardType) then
			AlertManager:close()
		end
	end),1)
	self.getCardBtn:setVisible(false)

	if self.cardType == 3 then
		self.panel_effect:addMEListener(TFWIDGET_CLICK, 
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

function GetItemResultLayer:removeEvents()

end



function GetItemResultLayer:PlayStartEffect()
	TFResourceHelper:instance():addArmatureFromJsonFile("effect/NewCardEffect.xml")
	local effect = TFArmature:create("NewCardEffect_anim")
	if effect == nil then
		return
	end

	-- local pos = self.img_quality:getPosition()
	-- pos = ccp(pos.x, pos.y)
	self.img_quality:setPosition(ccp(self.quality_pos.x,self.quality_pos.y-50))
	effect:setZOrder(-100)
	effect:setAnimationFps(GameConfig.ANIM_FPS)
	effect:playByIndex(1, -1, -1, 0)
	-- effect:setPosition(ccp(GameConfig.WS.width/2 - 80, GameConfig.WS.height/2 + 100))
	-- effect:setPosition(ccp(480 - 80, 320 + 100))
	effect:setPosition(self.quality_pos)

	self:addChild(effect)

	effect:addMEListener(TFARMATURE_COMPLETE,function()
        -- effect:removeFromParentAndCleanup(true)
        -- effect:setVisible(false)
        -- self:PlayResultEffect()
    end)
	self.startEffect = effect
    local temp = 0
	effect:addMEListener(TFARMATURE_UPDATE,function()
        temp = temp + 1
        if temp == 18 then
        	self.startEffect:removeFromParentAndCleanup(true)
        	self.startEffect = nil
        	-- self.startEffect:setVisible(false)
            self:PlayResultEffect()
        end
    end)
end

function GetItemResultLayer:PlayResultEffect()

	-- local equip = ItemData:objectByID(self.goodsInfo.resId)
	local equip = BaseDataManager:getReward({itemId = self.goodsInfo.resId,type = self.goodsInfo.resType,number = self.goodsInfo.number})
	if equip == nil then
		return
	end

	local pos = self.img_quality:getPosition()

	pos = ccp(pos.x, pos.y + 100)

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/NewCardEffect2.xml")
	local effect = TFArmature:create("NewCardEffect2_anim")
	if effect == nil then
		return
	end

	effect:setZOrder(-100)
	effect:setAnimationFps(GameConfig.ANIM_FPS)
	effect:playByIndex(0, -1, -1, 1)
	effect:setPosition(pos)
	-- effect:setPosition(ccp(480 - 80, 320 + 100))

	self:addChild(effect)

	local img_quality 	= self.img_quality
	local img_icon  	= self.img_icon

	-- self:addChild(img_quality)
	-- img_quality:setPosition(ccp(480 + 80, 320 + 40))

	-- img_quality:setPosition(ccp(GameConfig.WS.width/2, GameConfig.WS.height/2 + 100))
	-- img_quality:setPosition(ccp(480, 320 + 100))

	img_quality:setPosition(pos)
	img_quality:setVisible(true)
    img_icon:setTexture(equip.path)
    img_quality:setTexture(GetColorIconByQuality(equip.quality))
    self.txt_num:setVisible(true)
    self.txt_num:setText(self.goodsInfo.number)

		Public:addPieceImg(img_icon,equip,false)
    
    if self.goodsInfo.resType == EnumDropType.GOODS then
		local itemData   = ItemData:objectByID(self.goodsInfo.resId)
		local rewardItem = {itemid = self.goodsInfo.resId}
	    if itemData.type == EnumGameItemType.Soul and itemData.kind ~= 3 then
			Public:addPieceImg(img_icon,rewardItem,true)
	    elseif itemData.type == EnumGameItemType.Piece then
			Public:addPieceImg(img_icon,rewardItem,true)
		end
    end

    local item_name = TFLabel:create()
	item_name:setAnchorPoint(ccp(0.5, 0))
	item_name:setPosition(ccp(0, -100))
	item_name:setText(equip.name)
	item_name:setFontSize(24)
	img_quality:addChild(item_name)


	if self.cardType ~= 3 then
		self.getCardBtn:setVisible(true)
		self.returnBtn:setVisible(true)
	end

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

return GetItemResultLayer