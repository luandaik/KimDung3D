--[[
******vip商城道具cell*******

	-- by sjj
    -- 2018/2/1
]]

local VipGoodsCell = class("VipGoodsCell", BaseLayer)

function VipGoodsCell:ctor(type,data)
    self.super.ctor(self,data)
    self.type = type
    self:init("lua.uiconfig_mango_new.shop.ShopItemCell")
end

function VipGoodsCell:initUI(ui)
	self.super.initUI(self,ui)

	self.btn_node	 		= TFDirector:getChildByPath(ui, 'btn_node')
	self.btn_icon	 		= TFDirector:getChildByPath(ui, 'btn_icon')
	self.img_icon	 		= TFDirector:getChildByPath(ui, 'img_icon')
	self.txt_name 			= TFDirector:getChildByPath(ui, 'txt_name')
	self.txt_number			= TFDirector:getChildByPath(ui, 'txt_number')
	self.img_sold_out 		= TFDirector:getChildByPath(ui, 'img_sold_out')

	--价格
	self.img_res_icon 		= TFDirector:getChildByPath(ui, 'img_res_icon')
	self.txt_price 			= TFDirector:getChildByPath(ui, 'txt_price')


	self.img_zhekou 		= TFDirector:getChildByPath(ui, 'img_zhekou')
	self.bg_time 			= TFDirector:getChildByPath(ui, 'bg_time')
	self.txt_time 			= TFDirector:getChildByPath(ui, 'LabelBMFont_ShopItemCell_1')

	self.btn_node.logic = self

	self.img_zhekou:setVisible(false)
	self.bg_time:setVisible(false)
	self.img_sold_out:setVisible(false)
	self.txt_number:setText(1)
end


function VipGoodsCell:setData(index)
	self.goodsData = PayManager:getVipShopData(index)
	local rewardInfo = {type = self.goodsData.type, itemId = self.goodsData.itemId}
	local itemInfo = BaseDataManager:getReward(self.goodsData)

	-- 折扣 10为原价
	if (self.goodsData.discount and self.goodsData.discount ~= 10) then
		self.img_zhekou:setVisible(true)
		self.img_zhekou:setTexture("ui_new/operatingactivities/z"..self.goodsData.discount..".png")
	end

	self.txt_name:setText(itemInfo.name)
	self.img_icon:setTexture(itemInfo.path)
	self.txt_number:setText(self.goodsData.number)
	self.btn_icon:setTextureNormal(GetColorIconByQuality(itemInfo.quality))
	self.img_res_icon:setTexture(GetResourceIcon(HeadResType.VIPJF))
	--此单价为折扣后的价格
	self.txt_price:setText(self.goodsData.cost)

	Public:addPieceImg(self.img_icon, rewardInfo);

	local currentResValue = PayManager:getVipIntegral()
	if self.goodsData.cost > currentResValue then
		self.txt_price:setColor(ccc3(255, 0, 0))
	else
		self.txt_price:setColor(ccc3(255, 255, 255))
	end

	if (self.goodsData.purchaseNum > 0) then
		self.img_sold_out:setVisible(true)
		self.btn_node:setTouchEnabled(false)
		self.btn_icon:setGrayEnabled(true)
	else	
		self.img_sold_out:setVisible(false)
		self.btn_node:setTouchEnabled(true)
		self.btn_icon:setGrayEnabled(false)
	end
	
	self.btn_node:addMEListener(TFWIDGET_CLICK, audioClickfun(self.iconBtnClickHandle))
end

function VipGoodsCell:removeUI()
	self.super.removeUI(self)

	self.txt_name 			= nil
	self.txt_number			= nil
	self.btn_icon	 		= nil
	self.img_icon  			= nil
	self.img_res_icon  		= nil
	self.btn_node 			= nil
	self.id 				= nil
	self.txt_price 			= nil
	self.img_sold_out 		= nil

	self.img_zhekou			= nil
	self.bg_time			= nil
	self.txt_time			= nil
	self.end_time			= nil
end



function VipGoodsCell:setLogic(logiclayer)
	self.logic = logiclayer
end

function VipGoodsCell.iconBtnClickHandle(sender)
	local self = sender.logic
	-- if self.logic then
	-- 	self.logic:tableCellClick(self)
	-- end
	
	-- MallManager:openRandomStoreShoppingLayer( self.logic.type,self.commodityData)
	-- self.goodsData.res_id = self.goodsData.itemId
	-- self.goodsData.consume_number = self.goodsData.cost
	-- local layer = require('lua.logic.mall.AdventureShoppingLayer'):new(self.goodsData,HeadResType.VIPJF)
	-- AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
	-- AlertManager:show()


	local cost = self.goodsData.cost * self.goodsData.number
	local rewardInfo = {type = self.goodsData.type, itemId = self.goodsData.itemId}
	local itemInfo = BaseDataManager:getReward(self.goodsData)

	local msg = stringUtils.format(localizable.VipShop_Sure_tips2, cost, itemInfo.name, self.goodsData.number);
	CommonManager:showOperateSureLayer(
        function()
            PayManager:sendVipShoppingData(self.goodsData.id,self.goodsData.number)
        end,
        nil,
        {
        msg = msg,
        --uiconfig = "lua.uiconfig_mango_new.common.NeedTpPayLayer"
        }
    )
end

function VipGoodsCell:getSize()
	return self.ui:getSize()
end
return VipGoodsCell