
-- ///////////////////////////////////////////////////
-- @Author: 			Happy All
-- @Create Date:		2016-12-15 14:29:19
-- @Last Modified time: 2016-12-15 17:34:10
-- @Title: 				TuangouShoppingLayer
-- @Describe:			团购购买界面
-- ///////////////////////////////////////////////////


local TuangouShoppingLayer = class("TuangouShoppingLayer", BaseLayer)

-- CREATE_PANEL_FUN(TuangouShoppingLayer)


function TuangouShoppingLayer:ctor(data)
	self.super.ctor(self,data)
	self.panelPriceTbl = {}
	self.activeType = data[1]
	self.goodsId = data[2]
	self:initData(self.activeType, self.goodsId)
	self:init("lua.uiconfig_mango_new.operatingactivities.TuanGouBuy")
end

function TuangouShoppingLayer:initUI(ui)
	self.super.initUI(self,ui)

	--操作按钮
	self.btn_close				= TFDirector:getChildByPath(ui, 'btn_close')
	self.btn_add				= TFDirector:getChildByPath(ui, 'btn_add')
	self.btn_reduce				= TFDirector:getChildByPath(ui, 'btn_reduce')
	self.txt_num 				= TFDirector:getChildByPath(ui, 'txt_numnow')
	self.btn_buy 				= TFDirector:getChildByPath(ui, 'btn_buy')

	--物品信息控件
	self.txt_name				= TFDirector:getChildByPath(ui, 'txt_name')
	self.img_quality			= TFDirector:getChildByPath(ui, 'img_quality_bg')
	self.img_icon				= TFDirector:getChildByPath(ui, 'img_icon')

	--进度条相关
	self.txt_numnow			= TFDirector:getChildByPath(self.ui, 'txt_num')
	self.slider_shop				= TFDirector:getChildByPath(self.ui, 'slider_shop')
	self.bg_jindushuzhi			= TFDirector:getChildByPath(self.ui, 'bg_jindushuzhi')
	self.txt_buy_limit_tips			= TFDirector:getChildByPath(ui, 'txt_buy_limit_tips')
	self.txt_buy_limit_tips:setVisible(false)
	self.bg_jindushuzhi:setVisible(false)

	--消耗元宝
	self.now_price_bg 			= TFDirector:getChildByPath(ui, 'img_newprice_bg')
	self.img_res_icon 			= TFDirector:getChildByPath(self.now_price_bg, 'img_res_icon')
	self.txt_price				= TFDirector:getChildByPath(self.now_price_bg, 'txt_price')
	local img_fanyuanbao		= TFDirector:getChildByPath(ui, 'img_fanyuanbao')
	self.txtBackSycee				= TFDirector:getChildByPath(img_fanyuanbao, 'txt_price')

	--团购信息	
	local img_desc_bg 			= TFDirector:getChildByPath(ui, "img_desc_bg")
	self.Panel_tips 				= TFDirector:getChildByPath(img_desc_bg, "Panel_tips")
	self.Panel_tips:setVisible(false)
	self.progressBar 			= TFDirector:getChildByPath(img_desc_bg, "bar_jindu")
	self.txtProgressNum 			= TFDirector:getChildByPath(img_desc_bg, "txt_number")

	self.lbl_remaining_title 			= TFDirector:getChildByPath(ui, "lbl_remaining_title")
end

function TuangouShoppingLayer:removeUI()
	self.super.removeUI(self)
end


function TuangouShoppingLayer:onShow()
	self.super.onShow(self)
	self:refreshBaseUI();
	self:refreshUI();
end

function TuangouShoppingLayer:refreshBaseUI()
end

function TuangouShoppingLayer:refreshUI()
	local goodsData = ItemData:objectByID(self.commodityData.itemid)
	if goodsData == nil  then
		print("道具表无此数据 id == " .. self.commodityData.itemid)
		return
	end

	local maxNum = self:getRemainingNumber()

	--物品信息
	self.txt_name:setText(goodsData.name)
	self.img_quality:setTexture(GetBackgroundForGoods(goodsData))
	self.img_icon:setTexture(goodsData:GetPath())

	--滚动条信息
	self:setShopNum(self.num or 1)
	self.slider_shop:setPercent(math.ceil(self.num/maxNum*100))


	--团购信息
	local nowBuyNum = self.num or 0
	nowBuyNum = self.commodityData.serverBuyCurrentNum + nowBuyNum
	local percent = math.floor(nowBuyNum*100/self.commodityData.serverBuyLimitNum)
	self.progressBar:setPercent(percent)
	self.txtProgressNum:setText(nowBuyNum .. "/" .. self.commodityData.serverBuyLimitNum)

	local priceTbl = self.commodityData.priceTbl or {}
	local panelWidth = self.progressBar:getContentSize().width
	local progressIndex = 0
	local oldPrice = self.commodityData.nowPrice
	local nowPrice = oldPrice
	for i=1,3 do
		local data = priceTbl[i]
		if data then
			local panel
			if self.panelPriceTbl[i] == nil then
				panel = self.Panel_tips:clone()
				self.Panel_tips:getParent():addChild(panel)
				self.panelPriceTbl[i] = panel
			else
				panel = self.panelPriceTbl[i]
			end
			panel:setVisible(true)
			local txtPrice = TFDirector:getChildByPath(panel, "txt_price")
			txtPrice:setText(data.price)
			local txtNumber = TFDirector:getChildByPath(panel, "txt_goumai")
			txtNumber:setText(stringUtils.format(localizable.activity_TuanGouDesTips, data.num))
			
			local numPercent = math.floor(data.num*100/self.commodityData.serverBuyLimitNum)
			if numPercent > 100 then
				numPercent = 100
			end
			local posX = math.floor(panelWidth*numPercent/100)
			posX = posX - panelWidth/2 -- panel:getContentSize().width/2
			local offSetX = 0
            if i ~= 1 then
                local lastPos = self.panelPriceTbl[i-1]:getPositionX()
                local imgTipsSize = panel:getContentSize()
                local dx = posX - lastPos
                if dx < imgTipsSize.width then
                    offSetX =  imgTipsSize.width - dx
                end
            end
            panel:setPositionX(posX + offSetX)

			local imgHengXian = TFDirector:getChildByPath(panel, "img_hengxian")
			imgHengXian:setVisible(false)
			local imgTips = TFDirector:getChildByPath(panel, "img_tips")
			if data.num <= (nowBuyNum) then
				nowPrice = data.price
				progressIndex = progressIndex + 1
				imgTips:setTexture("ui_new/operatingactivities/img_biaoji.png")
			else
				imgTips:setTexture("ui_new/operatingactivities/img_nobiaoji.png")
			end
			imgTips:setPositionX(-offSetX)
		elseif self.panelPriceTbl[i] then
			self.panelPriceTbl[i]:setVisible(false)
		end
	end	

	--重置进度条上标签的位置
	self:resetTipsPanelPosition()


	if priceTbl[progressIndex+1] then
		local nextNum = priceTbl[progressIndex+1].num
		nextNum = nextNum - nowBuyNum
		self.lbl_remaining_title:setVisible(true)
		self.lbl_remaining_title:setText(stringUtils.format(localizable.activity_TuanGouTips, nextNum))
	else
		self.lbl_remaining_title:setVisible(false)
	end
	self.txtBackSycee:setText((oldPrice-nowPrice)*(self.num+self.commodityData.selfBuyCurrentNum))
end

function TuangouShoppingLayer:resetTipsPanelPosition()

	local lastTipsPanel = nil
	for i=1,3 do
		if self.panelPriceTbl[i] and self.panelPriceTbl[i]:isVisible() then
			lastTipsPanel = self.panelPriceTbl[i]
		end
	end

	if lastTipsPanel == nil then
		return
	end

	local currPos = lastTipsPanel:getPositionX()
	local barSize = self.progressBar:getContentSize()
	currPos = currPos + 20
	local offSetX = 0
	if currPos >= barSize.width/2 then
		offSetX = currPos - barSize.width/2
	end

	for i=2,3 do
		if self.panelPriceTbl[i] and self.panelPriceTbl[i]:isVisible() then
			self.panelPriceTbl[i]:setPositionX(self.panelPriceTbl[i]:getPositionX() - offSetX)
			local imgTips = TFDirector:getChildByPath(self.panelPriceTbl[i], "img_tips")
			imgTips:setPositionX(imgTips:getPositionX()+offSetX)
		end
	end
end

function TuangouShoppingLayer.reduceButtonClickHandle(sender)
local self = sender.logic
	local count = tonumber(sender.logic.txt_num:getText())
	count = count - 1
	if count > 0 then
		sender.logic:setShopNum(count)
	end

	local percent = math.ceil(count/sender.logic:getRemainingNumber()*100)
	sender.logic.slider_shop:setPercent(percent)
	self:refreshUI();
end

function TuangouShoppingLayer.addButtonClickHandle(sender)
	local self = sender.logic
	local count = tonumber(sender.logic.txt_num:getText())
	count = count + 1
	sender.logic:setShopNum(count)

	local percent = math.ceil(count/sender.logic:getRemainingNumber()*100)
	sender.logic.slider_shop:setPercent(percent)
	self:refreshUI();
end

--设置按钮状态
function TuangouShoppingLayer:setButtonState(addEnabled,reduceEnabled,buyEnabled)
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

function TuangouShoppingLayer:getRemainingNumber()
	return self.commodityData.stockNum
end

function TuangouShoppingLayer:setShopNum( num )
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

function TuangouShoppingLayer.buyButtonClickHandle(sender)
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
	OperationActivitiesManager:requestGrouponBuy(self.commodityData.id,num)
end

function TuangouShoppingLayer.sliderTouchBeginHandle(sender)
	local self = sender.logic
	self.bg_jindushuzhi:setVisible(true)
	self:freshSliderNum()
end

function TuangouShoppingLayer.sliderTouchMoveHandle(sender)
	local self = sender.logic
	self:freshSliderNum()
end

function TuangouShoppingLayer.sliderTouchEndHandle(sender)
	local self = sender.logic
	if self:getRemainingNumber() <= 0 then 
		return 
	end
	local percent = math.ceil(self.num/self:getRemainingNumber()*100)
	self.slider_shop:setPercent(percent)
	self.bg_jindushuzhi:setVisible(false)
end


function TuangouShoppingLayer:freshSliderNum()
	local percent = self.slider_shop:getPercent()/100
	local num = math.ceil(percent*self:getRemainingNumber())
	num = math.max(num,1)
	self:setShopNum(num)
	local width = self.slider_shop:getSize().width
	local temp = math.ceil(width*percent)
	self.bg_jindushuzhi:setPositionX(temp - width/2)
	self:refreshUI();
end

--刷新回调
function TuangouShoppingLayer:refreshCallback()
    self:refreshUI()
end

function TuangouShoppingLayer:registerEvents()
    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
	self.btn_close:setClickAreaLength(100);

	self.btn_add:addMEListener(TFWIDGET_CLICK, audioClickfun(self.addButtonClickHandle),1)
	self.btn_add.logic = self
	self.btn_reduce:addMEListener(TFWIDGET_CLICK, audioClickfun(self.reduceButtonClickHandle),1)
	self.btn_reduce.logic = self
	self.btn_buy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.buyButtonClickHandle),1)
	self.btn_buy.logic = self

	--购买成功通知
	self.buySuccessCallback = function (event)
		if OperationActivitiesManager:checkNeedCloseGrouponShopLayer() then
			AlertManager:close()
		else
		    self:initData(self.activeType, self.goodsId)
		    self:refreshUI()
		end
	end
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_GROUP_ON_UPDATE, self.buySuccessCallback)

	self.slider_shop:addMEListener(TFWIDGET_TOUCHBEGAN, audioClickfun(self.sliderTouchBeginHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHMOVED, audioClickfun(self.sliderTouchMoveHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHENDED, audioClickfun(self.sliderTouchEndHandle),1)
	self.slider_shop.logic = self

	self.registerEventCallFlag = true
end

function TuangouShoppingLayer:removeEvents()

	self.super.removeEvents(self)
	
    self.btn_add:removeMEListener(TFWIDGET_CLICK)
	self.btn_reduce:removeMEListener(TFWIDGET_CLICK)
	self.btn_buy:removeMEListener(TFWIDGET_CLICK)

	if self.buySuccessCallback then
	    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_GROUP_ON_UPDATE, self.buySuccessCallback)
	    self.buySuccessCallback = nil
	end
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHBEGAN)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHMOVED)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHENDED)    

	self.registerEventCallFlag = nil
end

function TuangouShoppingLayer:initData( Type, id )
	local activeData = OperationActivitiesManager:getActivityInfo(Type)
    if activeData == nil then
        return
    end
    local rewardList = activeData.activityReward

    local dataInfo
    for v in rewardList:iterator() do
    	if v.id == id then 
	    	dataInfo = v
	    	break
	    end
    end
    if dataInfo == nil then
    	return
    end	
    local item = dataInfo.rewardItems:objectAt(1)

    local data = {}
    data.id = dataInfo.id
    data.itemid = item.itemid
    local selfCanBuyNum = dataInfo.selfBuyLimitNum - dataInfo.selfBuyCurrentNum
    if selfCanBuyNum <= 0 then
    	selfCanBuyNum = 0
    end
    data.stockNum = math.min(selfCanBuyNum, 99)
    data.nowPrice = dataInfo.price
    data.priceTbl = dataInfo.priceTbl
    data.serverBuyLimitNum = dataInfo.serverBuyLimitNum
    data.serverBuyCurrentNum = dataInfo.serverBuyCurrentNum
    data.selfBuyCurrentNum = dataInfo.selfBuyCurrentNum

    self.commodityData = data
end
return TuangouShoppingLayer;
