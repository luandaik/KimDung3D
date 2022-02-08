-- client side LongMenPoLongMenPoShoppingLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-06-07


local LongMenPoShoppingLayer = class("LongMenPoShoppingLayer", BaseLayer)

CREATE_PANEL_FUN(LongMenPoShoppingLayer)


function LongMenPoShoppingLayer:ctor(id)
    self.super.ctor(self,id)
    self.id = id
    self.consume_number = LongMenPoManager:getItemBuyConsumeById(id)
    self:init("lua.uiconfig_mango_new.shop.ShoppingLayer")
end

function LongMenPoShoppingLayer:initUI(ui)
	self.super.initUI(self,ui)

	--操作按钮
	self.btn_close				= TFDirector:getChildByPath(ui, 'btn_close')
	self.btn_add				= TFDirector:getChildByPath(ui, 'btn_add')
	self.btn_reduce				= TFDirector:getChildByPath(ui, 'btn_reduce')
	self.txt_num 				= TFDirector:getChildByPath(ui, 'txt_numnow')
	self.btn_buy 				= TFDirector:getChildByPath(ui, 'btn_buy')

	--动态信息控件
	self.txt_name				= TFDirector:getChildByPath(ui, 'txt_name')
	self.img_quality			= TFDirector:getChildByPath(ui, 'img_quality_bg')
	self.img_icon				= TFDirector:getChildByPath(ui, 'img_icon')
	
	self.txt_desc				= TFDirector:getChildByPath(ui, 'txt_desc')
	self.panel_gift				= TFDirector:getChildByPath(ui, 'panel_giftDesc')

	self.old_price_bg 			= TFDirector:getChildByPath(ui, 'img_price_bg')
	self.hengxian 				= TFDirector:getChildByPath(self.old_price_bg, 'hengxian')
	self.old_img_res_icon 			= TFDirector:getChildByPath(self.old_price_bg, 'img_res_icon')
	self.old_txt_price				= TFDirector:getChildByPath(self.old_price_bg, 'txt_price')

	self.now_price_bg 			= TFDirector:getChildByPath(ui, 'img_newprice_bg')
	self.now_img_res_icon 			= TFDirector:getChildByPath(self.now_price_bg, 'img_res_icon')
	self.now_txt_price				= TFDirector:getChildByPath(self.now_price_bg, 'txt_price')


	self.txt_numnow				= TFDirector:getChildByPath(self.ui, 'txt_num')
	self.slider_shop				= TFDirector:getChildByPath(self.ui, 'slider_shop')
	self.bg_jindushuzhi				= TFDirector:getChildByPath(self.ui, 'bg_jindushuzhi')
	self.txt_own_num				= TFDirector:getChildByPath(self.ui, 'txt_own_num')



	self.txt_buy_limit_tips 	= TFDirector:getChildByPath(ui, 'txt_buy_limit_tips')
	self.txt_buy_limit_tips:setVisible(false)

	--剩余购买个数信息
	self.lbl_remaining_title 	= TFDirector:getChildByPath(ui, 'lbl_remaining_title')
	self.txt_remaining_num 		= TFDirector:getChildByPath(ui, 'txt_remaining_num')
	

	self.img_zhekou 		= TFDirector:getChildByPath(ui, 'img_zhekou')
	self.bg_time 			= TFDirector:getChildByPath(ui, 'bg_time')
	self.txt_time 			= TFDirector:getChildByPath(ui, 'LabelBMFont_ShopItemCell_1')

	self.img_zhekou:setVisible(false)
	self.bg_time:setVisible(false)

	--为按钮绑定处理逻辑属性，指向self
	self.btn_close.logic = self
	self.btn_add.logic = self
	self.btn_reduce.logic = self
	self.slider_shop.logic = self
	self.btn_buy.logic = self
	self.txt_num:setText(1)
	self.max_num = 99
	self.bg_jindushuzhi:setVisible(false)

end

function LongMenPoShoppingLayer:removeUI()
	--操作按钮
	self.btn_close				= nil
	self.old_img_res_icon 		= nil
	self.now_img_res_icon 		= nil
	self.btn_add				= nil
	self.btn_reduce				= nil
	self.txt_num 				= nil
	self.old_txt_price 			= nil
	self.now_txt_price 			= nil
	self.btn_buy 				= nil

	--动态信息控件
	self.txt_name				= nil
	self.img_quality			= nil
	self.img_icon				= nil
	
	self.txt_desc				= nil

	self.txt_buy_limit_tips 	= nil

	--剩余购买个数信息
	self.lbl_remaining_title 	= nil
	self.txt_remaining_num 		= nil

	self.img_zhekou		= nil
	self.bg_time		= nil
	self.txt_time		= nil

	--调用父类方法
	self.super.removeUI(self)
end


function LongMenPoShoppingLayer:onShow()
	self.super.onShow(self)
    self:refreshBaseUI()
    self:refreshUI()
end

function LongMenPoShoppingLayer:refreshBaseUI()
end

function LongMenPoShoppingLayer:setOldPrice( id , num )
	return
	-- local shop = ShopData:objectByID(id)
	-- if shop == nil  then
	-- 	print("商城无此数据 id == " , id)
	-- 	return
	-- end
	-- if not shop.old_price or shop.old_price <= 0 then
	-- 	return
	-- end
	-- self.old_txt_price:setText(MallManager:getTotalOldPrice(id,num ))
	-- self.img_zhekou:setVisible(true)
end

function LongMenPoShoppingLayer:refreshUI()
 --    local shop = ShopData:objectByID(self.id)
	-- if shop == nil  then
	-- 	print("商城无此数据 id == " , self.id)
	-- 	return
	-- end
	-- if shop.old_price and shop.old_price > 0 then
	-- 	self.now_price_bg:setVisible(true)
	-- 	self.hengxian:setVisible(true)
	-- else
		self.hengxian:setVisible(false)
		self.now_price_bg:setVisible(false)
	-- end

	local item = ItemData:objectByID(self.id)
	if item == nil  then
		print("道具表无此数据 id == " , self.id)
		return
	end

	self.txt_name:setText(item.name)
	self.txt_desc:setText(item.details)
	self.img_quality:setTexture(GetBackgroundForGoods(item))
	self.img_icon:setTexture(item:GetPath())
	self.old_img_res_icon:setTexture(GetResourceIcon(EnumDropType.SYCEE))
	self.now_img_res_icon:setTexture(GetResourceIcon(EnumDropType.SYCEE))

	Public:addPieceImg(self.img_icon,{type = EnumDropType.GOODS,itemid = self.id});

	local  item_num = BagManager:getItemNumById( item.id )
	self.txt_own_num:setVisible(true)		
	if item.type == 7 then
		local roleData = RoleData:objectByID(item.usable)
		if roleData then
			self.txt_own_num:setText(item_num.."/"..roleData.merge_card_num)
		end
	elseif item.type == 8 then
		if item.kind < 6 then
			local equipmentTemplate = EquipmentTemplateData:findByPieceId(item.id)
			if equipmentTemplate ~= nil then
				local needNumber = equipmentTemplate.merge_num
				self.txt_own_num:setText(item_num.."/"..needNumber)
			end
		elseif item.kind == 10 then
			local martialTemplate,num = MartialData:findByMaterial(item.id)
			if martialTemplate ~= nil then
				local needNumber = num
				self.txt_own_num:setText(item_num.."/"..needNumber)
			end
		end
	elseif item.type == 1 then
		self.txt_own_num:setVisible(true)		
		self.txt_own_num:setText(EquipmentManager:getEquipNumberByID(item.id))
	else
		self.txt_own_num:setText(item_num)
	end


	-- if shop:isLimited() then
	-- 	self.txt_remaining_num:setVisible(true)
	-- 	self.lbl_remaining_title:setVisible(true)
	-- 	local max_num = shop:getMaxNum(MainPlayer:getVipLevel())
	-- 	local now_count = max_num - MallManager:getPurchasedCount(shop.id)
	-- 	self.max_num = math.min(now_count,99)
	-- 	if now_count <= 0 then
	-- 		now_count = 0
	-- 		self.txt_remaining_num:setColor(ccc3(255, 0, 0))
	-- 		self.lbl_remaining_title:setColor(ccc3(255, 0, 0))
	-- 	else
	-- 		self.txt_remaining_num:setColor(ccc3(0, 0, 0))
	-- 		self.lbl_remaining_title:setColor(ccc3(0, 0, 0))
	-- 	end
	-- 	self.txt_remaining_num:setText(now_count)
	-- 	self.now_txt_price:setText(MallManager:getNowPrice( self.id ))
	-- 	self.old_txt_price:setText(MallManager:getNowPrice( self.id ))
	-- else
		self.txt_remaining_num:setVisible(false)
		self.lbl_remaining_title:setVisible(false)
		self.now_txt_price:setText(self.consume_number)
		self.old_txt_price:setText(self.consume_number)
	-- end

	-- self:setOldPrice( self.id , 1 )

	local percent = math.ceil(1/self.max_num*100)
	local currentNumText = self.txt_num:getText()
	if currentNumText and currentNumText:len() > 0 then
		local currentNum = tonumber(currentNumText)
		if currentNum < 1 then
			self:setShopNum(1)
		else
			self:setShopNum(currentNum)
			percent = math.ceil(currentNum/self.max_num*100)
		end
	else
		self:setShopNum(1)
	end

	self.slider_shop:setPercent(percent)

	-- print("shop = ", shop)
	-- print("item = ", item)
	self.txt_desc:setVisible(true)
	-- -- 判断是非为礼包
	-- if item.type == EnumGameItemType.Box then
	-- 	-- 判断是非为礼包
	-- 	self.txt_desc:setVisible(false)
	-- 	local giftPackData = GiftPackData:objectByID(item.id)
	-- 	if giftPackData == nil  then
	-- 		print("无此数据 id == " , item.id)
	-- 		return
	-- 	end
		
	-- 	self.giftGoodsList = split(giftPackData.goods, "|")
	-- 	print("礼包里面的物品数量 = ", #self.giftGoodsList)
	-- 	print("礼包 = ", self.giftGoodsList)
	-- 	self:drawGiftItemList()
	-- end
end


function LongMenPoShoppingLayer:setShopid( id )
	self.id = id
	self.consume_number = LongMenPoManager:getItemBuyConsumeById(id)
	self:refreshUI()
end

function LongMenPoShoppingLayer.reduceButtonClickHandle(sender)
	local count = tonumber(sender.logic.txt_num:getText())
	count = count - 1
	if count > 0 then
		sender.logic:setShopNum(count)
	end

	local percent = math.ceil(count/sender.logic.max_num*100)
	sender.logic.slider_shop:setPercent(percent)
end

function LongMenPoShoppingLayer.addButtonClickHandle(sender)
	local count = tonumber(sender.logic.txt_num:getText())
	count = count + 1
	sender.logic:setShopNum(count)

	local percent = math.ceil(count/sender.logic.max_num*100)
	sender.logic.slider_shop:setPercent(percent)
end


function LongMenPoShoppingLayer.sliderTouchBeginHandle(sender)
	local self = sender.logic
	self.bg_jindushuzhi:setVisible(true)
	self:freshSliderNum()
end

function LongMenPoShoppingLayer.sliderTouchMoveHandle(sender)
	local self = sender.logic
	self:freshSliderNum()
end

function LongMenPoShoppingLayer.sliderTouchEndHandle(sender)
	local self = sender.logic
	self.bg_jindushuzhi:setVisible(false)


	local count = tonumber(sender.logic.txt_num:getText())
	local percent = math.ceil(count/sender.logic.max_num*100)
	sender.logic.slider_shop:setPercent(percent)
end


function LongMenPoShoppingLayer:freshSliderNum()
	local percent = self.slider_shop:getPercent()/100
	local num = math.ceil(percent*self.max_num)
	num = math.max(num,1)
	self:setShopNum(num)
	local width = self.slider_shop:getSize().width
	local temp = math.ceil(width*percent)
	self.bg_jindushuzhi:setPositionX(temp - width/2)
end

--设置按钮状态
function LongMenPoShoppingLayer:setButtonState(addEnabled,reduceEnabled,buyEnabled)
	self.btn_buy:setTouchEnabled(buyEnabled)
	self.btn_buy:setGrayEnabled(not buyEnabled)

	if buyEnabled then
		Public:addBtnWaterEffect(self.btn_buy, true,1)
	else
		Public:addBtnWaterEffect(self.btn_buy, false)
	end

	self.btn_reduce:setTouchEnabled(reduceEnabled)
	self.btn_reduce:setGrayEnabled(not reduceEnabled)


	self.btn_add:setTouchEnabled(addEnabled)
	self.btn_add:setGrayEnabled(not addEnabled)

end

function LongMenPoShoppingLayer:toCanNotBuy()
	self:setButtonState(false,false,false)
	self.txt_num:setText(0)
	self.txt_numnow:setText(0)
	self.now_txt_price:setText(0)
	self.old_txt_price:setText(0)
	self.now_txt_price:setColor(ccc3(255, 0, 0))
	self.old_txt_price:setColor(ccc3(255, 0, 0))
end

function LongMenPoShoppingLayer:setShopNum( num )

	local canAdd = true
	local canReduce = true
	local canBuy = true

	local remainging = self.max_num
	if remainging < 1 then
		num = 0
		self:toCanNotBuy()
		return
	else
		if num > remainging then
			num = remainging
		end
	end
	if num == remainging then
		canAdd = false
	end
	-- else
	-- 	if num < 1 then
	-- 		num = 1
	-- 	end
	-- end

	if num < 2 then
		canReduce = false
	end



	self:setButtonState(canAdd,canReduce,canBuy)

	self.txt_num:setText(num)
	self.txt_numnow:setText(num)
	local currentResValue = MainPlayer:getResValueByType(EnumDropType.SYCEE)
	local totalPrice = num * self.consume_number
	self.now_txt_price:setText(totalPrice)
	self.old_txt_price:setText(totalPrice)
	self:setOldPrice( self.id , num )
	if totalPrice <= currentResValue then
		self.now_txt_price:setColor(ccc3(255, 255, 255))
		self.old_price_bg:setColor(ccc3(255, 255, 255))
	else
		self.old_price_bg:setColor(ccc3(255, 0, 0))
		self.now_txt_price:setColor(ccc3(255, 0, 0))
	end
end

--显示充值提示框
-- function LongMenPoShoppingLayer:showRechargeDialog()
-- 	CommonManager:showOperateSureLayer(
--             function()
--                 PayManager:showPayLayer()
--             end,
--             nil,
--             {
--             --msg = "您没有足够的元宝购买物品，是否进入充值界面？"
--             msg = localizable.common_pay_tips_1,
--             }
--     )
-- end

function LongMenPoShoppingLayer.buyButtonClickHandle(sender)
	local self = sender.logic
	local num =  tonumber(self.txt_num:getText())

	local totalPrice = num * self.consume_number
	local enough = MainPlayer:isEnough(EnumDropType.SYCEE,totalPrice)
	--print("buy : ",totalPrice,enough,shop.consume_type)
	if enough then
		showLoading()
		if self.buyClickCallFunc then
			self.buyClickCallFunc()
		end
		MallManager:buyLongMenPo(self.id,num)
		--AlertManager:close()
	end
end

--刷新回调
function LongMenPoShoppingLayer:refreshCallback()
    self:refreshUI()
end

function LongMenPoShoppingLayer.onExitClick( sender )
	local self = sender.logic
	AlertManager:close();
	if self.closeCallFunc then
		self.closeCallFunc()
	end
end

function LongMenPoShoppingLayer:registerEvents()
	self.super.registerEvents(self)

	--ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
	self.btn_close.logic = self
	self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onExitClick),1)
	self.btn_close:setClickAreaLength(100);

	self.btn_add:addMEListener(TFWIDGET_CLICK, audioClickfun(self.addButtonClickHandle),1)
	self.btn_reduce:addMEListener(TFWIDGET_CLICK, audioClickfun(self.reduceButtonClickHandle),1)
	self.btn_buy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.buyButtonClickHandle),1)



	--购买成功通知
     self.buySuccessCallback = function (event)
         --self:refreshCallback()
         hideLoading()
         AlertManager:close()
     end

	--逻辑事件
    TFDirector:addMEGlobalListener(MallManager.ReceiveBuyLongMenPoResult, self.buySuccessCallback)

	self.slider_shop:addMEListener(TFWIDGET_TOUCHBEGAN, audioClickfun(self.sliderTouchBeginHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHMOVED, audioClickfun(self.sliderTouchMoveHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHENDED, audioClickfun(self.sliderTouchEndHandle),1)

end

function LongMenPoShoppingLayer:removeEvents()
    self.btn_add:removeMEListener(TFWIDGET_CLICK)
	self.btn_reduce:removeMEListener(TFWIDGET_CLICK)
	self.btn_buy:removeMEListener(TFWIDGET_CLICK)

	self.slider_shop:removeMEListener(TFWIDGET_TOUCHBEGAN)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHMOVED)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHENDED)

	--逻辑事件
    TFDirector:removeMEGlobalListener(MallManager.ReceiveBuyLongMenPoResult, self.buySuccessCallback)
    self.super.removeEvents(self)
end

function LongMenPoShoppingLayer:setBuyClickCallFunc(func,closefunc)
	self.buyClickCallFunc = func
	self.closeCallFunc = closefunc
end

return LongMenPoShoppingLayer;
