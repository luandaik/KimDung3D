-- @Title: 商店购买弹出界面
-- @Author: Happy All
-- @Date:   2016-12-05 14:33:40
-- @Last Modified by:   Happy All
-- @Last Modified time: 2016-12-08 10:32:38


local CommShoppingLayer = class("CommShoppingLayer", BaseLayer)

-- CREATE_PANEL_FUN(CommShoppingLayer)


function CommShoppingLayer:ctor(data)
    self.super.ctor(self,data)

    self.activeType = data[1]
    self.activeGoodsId = data[2]
    self:initData(self.activeType, self.activeGoodsId)
    self:init("lua.uiconfig_mango_new.shop.ShoppingLayer")
end

function CommShoppingLayer:initUI(ui)
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


	self.old_price_bg 			= TFDirector:getChildByPath(ui, 'img_price_bg')
	self.old_img_res_icon 			= TFDirector:getChildByPath(self.old_price_bg, 'img_res_icon')
	self.old_txt_price				= TFDirector:getChildByPath(self.old_price_bg, 'txt_price')
	self.old_price_bg:setVisible(false)

	self.txt_numnow				= TFDirector:getChildByPath(self.ui, 'txt_num')
	self.slider_shop				= TFDirector:getChildByPath(self.ui, 'slider_shop')
	self.bg_jindushuzhi				= TFDirector:getChildByPath(self.ui, 'bg_jindushuzhi')
	self.txt_buy_limit_tips 	= TFDirector:getChildByPath(ui, 'txt_buy_limit_tips')
	self.txt_buy_limit_tips:setVisible(false)


	self.now_price_bg 			= TFDirector:getChildByPath(ui, 'img_newprice_bg')
	self.img_res_icon 			= TFDirector:getChildByPath(self.now_price_bg, 'img_res_icon')
	self.txt_price				= TFDirector:getChildByPath(self.now_price_bg, 'txt_price')

	--剩余购买个数信息
	self.lbl_remaining_title 	= TFDirector:getChildByPath(ui, 'lbl_remaining_title')
	self.txt_remaining_num 		= TFDirector:getChildByPath(ui, 'txt_remaining_num')
	

	self.img_zhekou 		= TFDirector:getChildByPath(ui, 'img_zhekou')
	self.bg_time 			= TFDirector:getChildByPath(ui, 'bg_time')
	self.txt_time 			= TFDirector:getChildByPath(ui, 'LabelBMFont_ShopItemCell_1')


	self.txt_own_num				= TFDirector:getChildByPath(self.ui, 'txt_own_num')
	self.lbl_own_title				= TFDirector:getChildByPath(self.ui, 'lbl_own_title')
	
	self.img_zhekou:setVisible(false)
	self.bg_time:setVisible(false)

	--为按钮绑定处理逻辑属性，指向self
	self.btn_close.logic = self
	self.btn_add.logic = self
	self.btn_reduce.logic = self
	self.slider_shop.logic = self
	self.btn_buy.logic = self
	-- self.txt_num:setText(1)
	self.bg_jindushuzhi:setVisible(false)

end

function CommShoppingLayer:removeUI()
	--操作按钮
	-- self.btn_close				= nil
	-- self.img_res_icon 			= nil
	-- self.btn_add				= nil
	-- self.btn_reduce				= nil
	-- self.txt_num 				= nil
	-- self.btn_buy 				= nil

	-- --动态信息控件
	-- self.txt_name				= nil
	-- self.img_quality			= nil
	-- self.img_icon				= nil
	
	-- self.txt_desc				= nil

	-- self.txt_price				= nil
	-- self.txt_buy_limit_tips 	= nil

	-- --剩余购买个数信息
	-- self.lbl_remaining_title 	= nil
	-- self.txt_remaining_num 		= nil

	-- self.img_zhekou		= nil
	-- self.bg_time		= nil
	-- self.txt_time		= nil
	--调用父类方法
	self.super.removeUI(self)
end


function CommShoppingLayer:onShow()
	self.super.onShow(self)
    self:refreshBaseUI();
    self:refreshUI();
end

function CommShoppingLayer:refreshBaseUI()
end

function CommShoppingLayer:refreshUI()
	local goodsData = ItemData:objectByID(self.commodityData.itemid)
	if goodsData == nil  then
		print("道具表无此数据 id == " .. self.commodityData.itemid)
		return
	end

	local maxNum = self:getRemainingNumber()

	self.txt_name:setText(goodsData.name)
	self.txt_desc:setText(goodsData.details)
	self.img_quality:setTexture(GetBackgroundForGoods(goodsData))
	self.img_icon:setTexture(goodsData:GetPath())

	-- if self.commodityData.consume_id == 30204 then
	-- 	self.img_res_icon:setTexture("ui_new/youli/icon_cyznq.png")
	-- else
	-- 	self.img_res_icon:setTexture(GetResourceIconForGeneralHead(self.type))
	-- end
	-- self.img_res_icon:setTexture(GetResourceIconForGeneralHead(self.type))

	self.txt_remaining_num:setText(maxNum)
	self.lbl_remaining_title:setText(localizable.activity_limitShop)
	self:setShopNum(self.num or 1)

	self.slider_shop:setPercent(math.ceil(self.num/maxNum*100))

	self.txt_own_num:setVisible(false)
	self.lbl_own_title:setVisible(false)
end

function CommShoppingLayer.reduceButtonClickHandle(sender)
	local count = tonumber(sender.logic.txt_num:getText())
	count = count - 1
	if count > 0 then
		sender.logic:setShopNum(count)
	end

	local percent = math.ceil(count/sender.logic:getRemainingNumber()*100)
	sender.logic.slider_shop:setPercent(percent)
end

function CommShoppingLayer.addButtonClickHandle(sender)
	local count = tonumber(sender.logic.txt_num:getText())
	count = count + 1
	sender.logic:setShopNum(count)

	local percent = math.ceil(count/sender.logic:getRemainingNumber()*100)
	sender.logic.slider_shop:setPercent(percent)
end



--设置按钮状态
function CommShoppingLayer:setButtonState(addEnabled,reduceEnabled,buyEnabled)
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

function CommShoppingLayer:getRemainingNumber()
	return self.commodityData.stockNum
end

function CommShoppingLayer:setShopNum( num )
	local remainingNumber = self:getRemainingNumber()
	if remainingNumber <= 0 then
		self.txt_num:setText(0)
		self.txt_numnow:setText(0)
		self.txt_price:setText(0)
		self:setButtonState(false,false,false)
		self.txt_price:setColor(ccc3(255, 0, 0))
		return 
	end

	if num < 1 then
		num = 1
	end

	if num > remainingNumber then
		num = remainingNumber
	end

	self.num = num

	local singlePrice = self.commodityData.nowPrice
	local totalPrice = singlePrice * num
	self.txt_num:setText(num)
	self.txt_numnow:setText(num)
	self.txt_price:setText(totalPrice)

	if MainPlayer:getSycee() < totalPrice then
		self.txt_price:setColor(ccc3(255, 0, 0))
	else
		self.txt_price:setColor(ccc3(255, 255, 255))
	end
	local canAdd = remainingNumber > num
	local canReduce = remainingNumber > 1 and num > 1
	self:setButtonState(canAdd,canReduce,true)
end

function CommShoppingLayer.buyButtonClickHandle(sender)
	local self = sender.logic
	local num =  tonumber(self.txt_num:getText())

	if num < 1 then
		--toastMessage("购买个数不可小于1")
		toastMessage(localizable.AdventureShop_text1)
		return
	end
	local totalPrice = self.commodityData.nowPrice*num
	if MainPlayer:getSycee() < totalPrice then
		toastMessage(localizable.factionMail_noSycee)
		return
	end
	showLoading()
	OperationActivitiesManager:sendLimitHotInfoBuyMsg(self.commodityData.id,num)
end

function CommShoppingLayer.sliderTouchBeginHandle(sender)
	local self = sender.logic
	self.bg_jindushuzhi:setVisible(true)
	self:freshSliderNum()
end

function CommShoppingLayer.sliderTouchMoveHandle(sender)
	local self = sender.logic
	self:freshSliderNum()
end

function CommShoppingLayer.sliderTouchEndHandle(sender)
	local self = sender.logic
	if self:getRemainingNumber() <= 0 then 
		return 
	end
	local percent = math.ceil(self.num/self:getRemainingNumber()*100)
	self.slider_shop:setPercent(percent)
	self.bg_jindushuzhi:setVisible(false)
end


function CommShoppingLayer:freshSliderNum()
	local percent = self.slider_shop:getPercent()/100
	local num = math.ceil(percent*self:getRemainingNumber())
	num = math.max(num,1)
	self:setShopNum(num)
	local width = self.slider_shop:getSize().width
	local temp = math.ceil(width*percent)
	self.bg_jindushuzhi:setPositionX(temp - width/2)
end

--刷新回调
function CommShoppingLayer:refreshCallback()
    self:refreshUI()
end

function CommShoppingLayer:registerEvents()
    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
	self.btn_close:setClickAreaLength(100);

	self.btn_add:addMEListener(TFWIDGET_CLICK, audioClickfun(self.addButtonClickHandle),1)
	self.btn_reduce:addMEListener(TFWIDGET_CLICK, audioClickfun(self.reduceButtonClickHandle),1)
	self.btn_buy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.buyButtonClickHandle),1)

	--购买成功通知
	self.buySuccessCallback = function (event)
		if OperationActivitiesManager:checkNeedCloseLimitHotShopLayer() then
			hideLoading()
			AlertManager:close()
			-- toastMessage(localizable.common_buy_suc)
		else
		    self:initData(self.activeType, self.activeGoodsId)
		    self:refreshUI()
		end
	end
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_LIMIT_HOT_UPDATE, self.buySuccessCallback)

	self.slider_shop:addMEListener(TFWIDGET_TOUCHBEGAN, audioClickfun(self.sliderTouchBeginHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHMOVED, audioClickfun(self.sliderTouchMoveHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHENDED, audioClickfun(self.sliderTouchEndHandle),1)

	self.registerEventCallFlag = true
end

function CommShoppingLayer:removeEvents()

	self.super.removeEvents(self)
	
    self.btn_add:removeMEListener(TFWIDGET_CLICK)
	self.btn_reduce:removeMEListener(TFWIDGET_CLICK)
	self.btn_buy:removeMEListener(TFWIDGET_CLICK)

    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_LIMIT_HOT_UPDATE, self.buySuccessCallback)
    self.buySuccessCallback = nil

	self.slider_shop:removeMEListener(TFWIDGET_TOUCHBEGAN)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHMOVED)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHENDED)

    

	self.registerEventCallFlag = nil
end

function CommShoppingLayer:initData( Type, goodsId )
	print("Type = ",Type)
	print("goodsId = ",idx)
	local activeData = OperationActivitiesManager:getActivityInfo(Type)
    if activeData == nil then
        return
    end
    local rewardList = activeData.activityReward

    local dataInfo
    for v in rewardList:iterator() do
    	if v.id == goodsId then
    		dataInfo = v
    		break;
    	end
    end
    if dataInfo == nil then
    	return
    end
    local item = dataInfo.rewardItems:objectAt(1)

    local data = {}
    data.id = dataInfo.id
    data.itemid = item.itemid
    local stockNum = dataInfo.serverNumMax - dataInfo.serverBuyNum
    local selfCanBuyNum = dataInfo.selfNumMax - dataInfo.selfBuyNum

    if stockNum > selfCanBuyNum then
        data.stockNum = selfCanBuyNum
    else
        data.stockNum = stockNum
    end
    data.nowPrice = dataInfo.nowPrice

    print("data = ",data)
    self.commodityData = data
end
return CommShoppingLayer;
