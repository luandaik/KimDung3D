-- client side RedPacketSendLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-08-06


local RedPacketSendLayer = class("RedPacketSendLayer", BaseLayer)

CREATE_PANEL_FUN(RedPacketSendLayer)


function RedPacketSendLayer:ctor(type, IsActivity)
    self.super.ctor(self,data)

    self.type = type
    self.IsActivity = IsActivity
    if self.IsActivity then
    	self.sendType = type
    	self.type = 1
    end
    self:init("lua.uiconfig_mango_new.faction.Factionfahb")
end

function RedPacketSendLayer:initUI(ui)
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

	self.txt_numnow				= TFDirector:getChildByPath(ui, 'txt_num')
	self.slider_shop				= TFDirector:getChildByPath(ui, 'slider_shop')
	self.bg_jindushuzhi				= TFDirector:getChildByPath(ui, 'bg_jindushuzhi')

	self.txt_own_num				= TFDirector:getChildByPath(ui, 'txt_own_num')
	self.lbl_own_title				= TFDirector:getChildByPath(ui, 'lbl_own_title')

	--为按钮绑定处理逻辑属性，指向self
	self.btn_close.logic = self
	self.btn_add.logic = self
	self.btn_reduce.logic = self
	self.slider_shop.logic = self
	self.btn_buy.logic = self
	-- self.txt_num:setText(1)
	self.bg_jindushuzhi:setVisible(false)

	self.img_background = TFDirector:getChildByPath(ui, 'img_background')

	self.txt_contect = TFDirector:getChildByPath(ui, "txt_contect")

    self.playernameInput = TFDirector:getChildByPath(ui, 'playernameInput')
	self.playernameInput:setCursorEnabled(true)
	self.playernameInput:setVisible(true)
	self.playernameInput:setMaxLengthEnabled(true)
	--self.playernameInput:setText("")
	self.txt_contect:setText(localizable.RedPacket_txt1)
	self.maxLength = 20
end

function RedPacketSendLayer:removeUI()
	--操作按钮
	self.btn_close				= nil
	self.btn_add				= nil
	self.btn_reduce				= nil
	self.txt_num 				= nil
	self.btn_buy 				= nil

	--动态信息控件
	self.txt_name				= nil
	self.img_quality			= nil
	self.img_icon				= nil
	
	self.txt_desc				= nil

	--调用父类方法
	self.super.removeUI(self)
end


function RedPacketSendLayer:onShow()
	self.super.onShow(self)
    self:refreshBaseUI();
    self:refreshUI();
end

function RedPacketSendLayer:refreshBaseUI()
end

function RedPacketSendLayer:refreshUI()
	local res_id = RedPacketManager:getItemIdByType(self.type)
	local goodsData = ItemData:objectByID(res_id)
	if goodsData == nil  then
		print("道具表无此数据 id == " .. self.commodityData.res_id)
		return
	end
	if self.IsActivity then
		self.btn_reduce:setVisible(false)
		self.btn_add:setVisible(false)
		self.slider_shop:setTouchEnabled(false)
	end
	self.txt_name:setText(goodsData.name)
	self.txt_desc:setText(goodsData.details)
	self.img_quality:setTexture(GetBackgroundForGoods(goodsData))
	self.img_icon:setTexture(goodsData:GetPath())
	self.minNum = ConstantData:objectByID('RedpacketMinNum').value
	self:setShopNum(self.num or self.minNum)
	
	local remainingNumber = self:getRemainingNumber()
	local percent = math.ceil(self.num/remainingNumber*100)
	self.slider_shop:setPercent(percent)

	self.txt_own_num:setVisible(true)
	self.txt_own_num:setText(remainingNumber .. '')
end

function RedPacketSendLayer.reduceButtonClickHandle(sender)
	local tbl = stringToNumberTable(sender.logic.txt_num:getText(),'/')
	local count =  tbl[1]
	count = count - 1
	if count > 0 then
		sender.logic:setShopNum(count)
	end

	local percent = math.ceil(count/sender.logic:getRemainingNumber()*100)
	sender.logic.slider_shop:setPercent(percent)
end

function RedPacketSendLayer.addButtonClickHandle(sender)
	local tbl = stringToNumberTable(sender.logic.txt_num:getText(),'/')
	local count =  tbl[1]
	count = count + 1
	sender.logic:setShopNum(count)

	local percent = math.ceil(count/sender.logic:getRemainingNumber()*100)
	sender.logic.slider_shop:setPercent(percent)
end



--设置按钮状态
function RedPacketSendLayer:setButtonState(addEnabled,reduceEnabled,buyEnabled)
	-- if buyEnabled then
	-- 	Public:addBtnWaterEffect(self.btn_buy, true,1)
	-- else
	-- 	Public:addBtnWaterEffect(self.btn_buy, false)
	-- end
	
	self.btn_reduce:setTouchEnabled(reduceEnabled)
	self.btn_reduce:setGrayEnabled(not reduceEnabled)


	self.btn_add:setTouchEnabled(addEnabled)
	self.btn_add:setGrayEnabled(not addEnabled)

end

function RedPacketSendLayer:getRemainingNumber()
	local factionInfo = FactionManager:getFactionInfo()
    local maxNum = 0
    if factionInfo then
        maxNum = factionInfo.memberCount
    else
        maxNum = FactionManager:getMemberNum()
    end
	if maxNum <= 0 then
		maxNum = 1
	end
	return maxNum
end

function RedPacketSendLayer:setShopNum( num )
	local remainingNumber = self:getRemainingNumber()
	if self.IsActivity then
		remainingNumber = 30
		num = 30
	end
	if remainingNumber <= 0 then
		self.txt_num:setText(0)
		self.txt_numnow:setText(0)
		self:setButtonState(false,false,false)
		return 
	end

	if num < self.minNum then
		num = self.minNum
	end

	if num > remainingNumber then
		num = remainingNumber
	end

	self.num = num
	if self.isActivity then
		num = 30
		remainingNumber = 30
	end
	self.txt_num:setText(num .. '/' .. remainingNumber)
	self.txt_numnow:setText(num)
	--self.txt_num:setColor(ccc3(0, 255, 0))
	local canAdd = remainingNumber > num
	local canReduce = remainingNumber > 1 and num > 1
	self:setButtonState(canAdd,canReduce,true)
end

function RedPacketSendLayer.buyButtonClickHandle(sender)
	local self = sender.logic
	local tbl = stringToNumberTable(self.txt_num:getText(),'/')
	local num =  tbl[1]
	print('self.txt_num:getText() = ',self.txt_num:getText())
	if num < 1 then
		--toastMessage("购买个数不可小于1")
		--toastMessage(localizable.AdventureShop_text1)
		return
	end
	local text = self.txt_contect:getText()
	if text == '' then
		toastMessage(localizable.factionMail_noContent)
		return
	end
	local competence = FactionManager:getPersonalInfo().competence
	if self.IsActivity then
		if FactionManager:getFactionInfo().level < 2 then
        	toastMessage(localizable.RedPacket_dengji)
        	return
    	end
		if competence == 2 or competence == 1 then
			RedPacketManager:requestActivitySendRedPacket(self.sendType,text,30)
			return
		end	
		toastMessage(localizable.RedPacket_quanxian)
	else
		RedPacketManager:requestSendRedPacket(self.type,text,num)
	end
end

function RedPacketSendLayer.sliderTouchBeginHandle(sender)
	local self = sender.logic
	self.bg_jindushuzhi:setVisible(true)
	self:freshSliderNum()
end

function RedPacketSendLayer.sliderTouchMoveHandle(sender)
	local self = sender.logic
	self:freshSliderNum()
end

function RedPacketSendLayer.sliderTouchEndHandle(sender)
	local self = sender.logic
	if self:getRemainingNumber() <= 0 then 
		return 
	end
	local percent = math.ceil(self.num/self:getRemainingNumber()*100)
	self.slider_shop:setPercent(percent)
	self.bg_jindushuzhi:setVisible(false)
end


function RedPacketSendLayer:freshSliderNum()
	local percent = self.slider_shop:getPercent()/100
	local num = math.ceil(percent*self:getRemainingNumber())
	num = math.max(num,1)
	self:setShopNum(num)
	local width = self.slider_shop:getSize().width
	local temp = math.ceil(width*percent)
	self.bg_jindushuzhi:setPositionX(temp - width/2)
end

--刷新回调
function RedPacketSendLayer:refreshCallback()
    self:refreshUI()
end

function RedPacketSendLayer:registerEvents()
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

	self.btn_add:addMEListener(TFWIDGET_CLICK, audioClickfun(self.addButtonClickHandle),1)
	self.btn_reduce:addMEListener(TFWIDGET_CLICK, audioClickfun(self.reduceButtonClickHandle),1)
	self.btn_buy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.buyButtonClickHandle),1)

     --购买成功通知
	self.buySuccessCallback = function (event)
		AlertManager:close()
		local redPacketId = event.data[1].id
		RedPacketManager:openSendSuccessLayer(redPacketId)
	end

    TFDirector:addMEGlobalListener(RedPacketManager.RECEIVE_SEND_RED_PACKET_SUCCESS, self.buySuccessCallback)

	self.slider_shop:addMEListener(TFWIDGET_TOUCHBEGAN, audioClickfun(self.sliderTouchBeginHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHMOVED, audioClickfun(self.sliderTouchMoveHandle),1)
	self.slider_shop:addMEListener(TFWIDGET_TOUCHENDED, audioClickfun(self.sliderTouchEndHandle),1)

	local function checkStrLength(str)
		local stringIndex = 1
		local prevStr = ""
		local currStr = ""
		local fontNum = 0
		local strLength = string.len(str)
		if strLength <= self.maxLength then
			return str
		end
		
		for i=1,strLength do			
			if stringIndex > strLength then
				return currStr
			end
			local c = string.sub(str,stringIndex,stringIndex)
			local b = string.byte(c)
			print('b = ',b)
			if b >= 240 then
            	currStr = currStr..string.sub(str,stringIndex,stringIndex+3)
            	stringIndex = stringIndex + 4
			elseif b >= 224 then
            	currStr = currStr..string.sub(str,stringIndex,stringIndex+2)
            	stringIndex = stringIndex + 3
			elseif b >= 192 then
                currStr = currStr..string.sub(str,stringIndex,stringIndex+1)
                stringIndex = stringIndex + 2
            else
                currStr = currStr..c
                stringIndex = stringIndex + 1
            end		
            fontNum = fontNum + 1
            if fontNum > (self.maxLength) then
            	return prevStr
            end
            prevStr = currStr
            print("prevStr = ",prevStr)
		end  
		return str     
	end 

	local function onTextFieldAttachHandle(input)
		local text = self.txt_contect:getText()
		text = checkStrLength(text)
		self.playernameInput:setText(text)
		-- if text == '' then
		-- 	text = localizable.RedPacket_txt1
		-- end
		--self.playernameInput:setText(text)
		self.txt_contect:setText(text)
		self.img_background:setPositionY(436)
    end    
    self.playernameInput:addMEListener(TFTEXTFIELD_ATTACH, onTextFieldAttachHandle)
    local function onTextFieldChangedHandle(input)
		local text = self.playernameInput:getText()
		text = checkStrLength(text)
		self.playernameInput:setText(text)
		-- if text == '' then
		-- 	text = localizable.RedPacket_txt1
		-- end
		--self.playernameInput:setText(text)
		self.txt_contect:setText(text)
		self.img_background:setPositionY(436)
    end
    self.playernameInput:addMEListener(TFTEXTFIELD_TEXTCHANGE, onTextFieldChangedHandle)
    local function onTextFieldDetachHandle(input)
        local text = self.playernameInput:getText()
		text = checkStrLength(text)
		text = FactionManager:printByte(text)      
        self.playernameInput:setText(text)
  --       if text == '' then
		-- 	text = localizable.RedPacket_txt1
		-- end
		--self.playernameInput:setText(text)
        self.txt_contect:setText(text)
        self.playernameInput:closeIME()
        self.img_background:setPositionY(236)
    end
    self.playernameInput:addMEListener(TFTEXTFIELD_DETACH, onTextFieldDetachHandle)

    local function spaceAreaClick(sender)
    	self.playernameInput:closeIME()
    	self.img_background:setPositionY(236)
	end
    self.ui:setTouchEnabled(true)
    self.ui:addMEListener(TFWIDGET_CLICK, spaceAreaClick)

    -- self.onMyRedPacketInfoHandler = function(event)
    -- 	AlertManager:close()
    -- end
    self.onMyRedPacketOverHandler = function(event)
    	AlertManager:close()
	end
    TFDirector:addMEGlobalListener(RedPacketManager.RECEIVE_ACTIVE_RED_PACKET_OVER ,self.onMyRedPacketOverHandler)
    -- TFDirector:addMEGlobalListener(RedPacketManager.SEND_GUILD_ACTIVE_RED_PACKET ,self.onMyRedPacketInfoHandler)
end

function RedPacketSendLayer:removeEvents()
    self.btn_add:removeMEListener(TFWIDGET_CLICK)
	self.btn_reduce:removeMEListener(TFWIDGET_CLICK)
	self.btn_buy:removeMEListener(TFWIDGET_CLICK)

    TFDirector:removeMEGlobalListener(RedPacketManager.RECEIVE_SEND_RED_PACKET_SUCCESS, self.buySuccessCallback)
    -- TFDirector:removeMEGlobalListener(RedPacketManager.SEND_GUILD_ACTIVE_RED_PACKET ,self.onMyRedPacketInfoHandler)
    TFDirector:removeMEGlobalListener(RedPacketManager.RECEIVE_ACTIVE_RED_PACKET_OVER ,self.onMyRedPacketOverHandler)
    self.onMyRedPacketOverHandler = nil
    self.onMyRedPacketInfoHandler = nil

	self.slider_shop:removeMEListener(TFWIDGET_TOUCHBEGAN)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHMOVED)
	self.slider_shop:removeMEListener(TFWIDGET_TOUCHENDED)

    self.super.removeEvents(self)
end

return RedPacketSendLayer;
