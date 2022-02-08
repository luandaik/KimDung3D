-- client side CustomBloodChoseLayer.lua
--[[
 * @Description: 选择血量百分比
 ]]
-- script writer Happy.All
-- creation time 2016-06-22


local CustomBloodChoseLayer = class("CustomBloodChoseLayer", BaseLayer)

CREATE_PANEL_FUN(CustomBloodChoseLayer)


function CustomBloodChoseLayer:ctor(id)
    self.super.ctor(self,id)
    self:init("lua.uiconfig_mango_new.SkillStrategy.SkillStrategyNumber")
end

function CustomBloodChoseLayer:initUI(ui)
	self.super.initUI(self,ui)

	--操作按钮
	self.Btn_buy			= TFDirector:getChildByPath(ui, 'btn_buy')
	self.btn_close			= TFDirector:getChildByPath(ui, 'btn_close')


	self.slider_shop	= TFDirector:getChildByPath(ui, 'slider_shop')
	self.bg_jindushuzhi		= TFDirector:getChildByPath(ui, 'bg_jindushuzhi')
	self.txt_num			= TFDirector:getChildByPath(ui, 'txt_num')
	self.btn_jia			= TFDirector:getChildByPath(ui, 'btn_add')
	self.btn_jian			= TFDirector:getChildByPath(ui, 'btn_reduce')


	self.txt_numnow			= TFDirector:getChildByPath(ui, 'txt_numnow')


	--为按钮绑定处理逻辑属性，指向self
	self.Btn_buy.logic = self
	self.btn_jia.logic = self
	self.btn_jian.logic = self
	self.slider_shop.logic = self
	self.slider_shop:setZOrder(10)

	self.choiceNum = 0
	self.maxNum = 100	
end

function CustomBloodChoseLayer:removeUI()
	

	self.Btn_buy			= nil
	self.btn_close			= nil
	self.slider_shop	= nil
	self.bg_jindushuzhi		= nil
	self.txt_num			= nil
	self.btn_jia			= nil
	self.btn_jian			= nil

	self.txt_numnow			= nil

	--调用父类方法
	self.super.removeUI(self)
end


function CustomBloodChoseLayer:onShow()
	self.super.onShow(self)


    self:refreshUI()
end

function CustomBloodChoseLayer:setNum( num )
	self.txt_num:setText(num)
	self.txt_numnow:setText(self.txtTitle..num.."%")

	local percent = math.ceil(num/self.maxNum*100)
	self.slider_shop:setPercent(percent)
end


function CustomBloodChoseLayer:refreshUI()
	self:setNum(self.choiceNum)
	self.bg_jindushuzhi:setVisible(false)

	self:freshButtonState()
end

function CustomBloodChoseLayer.reduceButtonClickHandle(sender)
	local self = sender.logic
	self.choiceNum = self.choiceNum - 5
	if self.choiceNum <= 0 then
		self.choiceNum = 0
	end
	sender.logic:setNum(self.choiceNum)
	self:freshButtonState()
end

function CustomBloodChoseLayer.addButtonClickHandle(sender)
	local self = sender.logic
	self.choiceNum = self.choiceNum + 5
	if self.choiceNum > self.maxNum then
		self.choiceNum = self.maxNum 
	end
	sender.logic:setNum(self.choiceNum)
	self:freshButtonState()
end

function CustomBloodChoseLayer.useButtonClickHandle(sender)
	local self = sender.logic	
	local number = self.choiceNum
	TFFunction.call(self.callback,number)
	AlertManager:close()
end

function CustomBloodChoseLayer.sliderTouchBeginHandle(sender)
	local self = sender.logic
	self.bg_jindushuzhi:setVisible(true)
	self:freshSliderNum()
end

function CustomBloodChoseLayer.sliderTouchMoveHandle(sender)
	local self = sender.logic
	self:freshSliderNum()
end

function CustomBloodChoseLayer.sliderTouchEndHandle(sender)
	local self = sender.logic

	local percent = math.ceil(self.choiceNum /self.maxNum*100)
	self.slider_shop:setPercent(percent)

	self.bg_jindushuzhi:setVisible(false)
	self:freshButtonState()
end

function CustomBloodChoseLayer:freshSliderNum()
	local percent = self.slider_shop:getPercent()/100
	local num = math.ceil(percent*self.maxNum)
	self.choiceNum = num--math.max(num,100)
	self.txt_num:setText(self.choiceNum)
	self.txt_numnow:setText(self.txtTitle..self.choiceNum.."%")

	local width = self.slider_shop:getSize().width
	local temp = math.ceil(width*percent)
	self.bg_jindushuzhi:setPositionX(temp - width/2)
end

--设置按钮状态
function CustomBloodChoseLayer:freshButtonState()
	if self.choiceNum >= self.maxNum then
		self.btn_jia:setTouchEnabled(false)
		self.btn_jia:setGrayEnabled(true)
	else
		self.btn_jia:setTouchEnabled(true)
		self.btn_jia:setGrayEnabled(false)
	end

	if self.choiceNum > 0 then
		self.btn_jian:setTouchEnabled(true)
		self.btn_jian:setGrayEnabled(false)
	else
		self.btn_jian:setTouchEnabled(false)
		self.btn_jian:setGrayEnabled(true)
	end
end

--刷新回调
function CustomBloodChoseLayer:refreshCallback()
    self:refreshUI()
end

function CustomBloodChoseLayer:registerEvents()
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
	self.btn_close:setClickAreaLength(100);

	self.Btn_buy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.useButtonClickHandle),1)
	self.btn_jia:addMEListener(TFWIDGET_CLICK, audioClickfun(self.addButtonClickHandle),1)
	self.btn_jian:addMEListener(TFWIDGET_CLICK, audioClickfun(self.reduceButtonClickHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHBEGAN, audioClickfun(self.sliderTouchBeginHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHMOVED, audioClickfun(self.sliderTouchMoveHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHENDED, audioClickfun(self.sliderTouchEndHandle),1)
end

function CustomBloodChoseLayer:removeEvents()
    self.btn_jia:removeMEListener(TFWIDGET_CLICK)
	self.btn_jian:removeMEListener(TFWIDGET_CLICK)
	self.Btn_buy:removeMEListener(TFWIDGET_CLICK)

	self.slider_shop:removeMEListener(TFWIDGET_TOUCHBEGAN)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHMOVED)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHENDED)

    self.super.removeEvents(self)
end

function CustomBloodChoseLayer:setData( txtTitle, number, callback )
	self.callback = callback
	self.choiceNum = number
	self.txtTitle = txtTitle
	self.txt_numnow:setText(self.txtTitle..number.."%")
end

return CustomBloodChoseLayer;
