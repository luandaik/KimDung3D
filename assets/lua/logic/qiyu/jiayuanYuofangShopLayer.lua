--[[
******家园游方商店界面*******

	-- by luoconghai
	-- 2017/4/18
]]

local jiayuanYuofangShopLayer = class("jiayuanYuofangShopLayer", BaseLayer)

function jiayuanYuofangShopLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.qiyu.FamilyYoufangshop")
end

function jiayuanYuofangShopLayer:initUI(ui)
	self.super.initUI(self, ui)

	self.img_icon 			= TFDirector:getChildByPath(ui, 'img_icon')
	self.img_iconbg 		= TFDirector:getChildByPath(ui, 'img_iconbg')
	self.img_iconbg2 		= TFDirector:getChildByPath(ui, 'img_iconbg2')
	self.txt_iconname 		= TFDirector:getChildByPath(ui, 'txt_iconname')
	self.txt_price 			= TFDirector:getChildByPath(ui, 'txt_price')
	self.btn_buy 			= TFDirector:getChildByPath(ui, 'btn_buy')
	self.txt_leavetime 		= TFDirector:getChildByPath(ui, 'txt_leavetime')
	self.img_yuanbao 		= TFDirector:getChildByPath(ui, 'img_yuanbao')
	self.txt_number 		= TFDirector:getChildByPath(ui, 'txt_number')
	self.btn_close 			= TFDirector:getChildByPath(ui, 'btn_close')
	self.Panel_old 			= TFDirector:getChildByPath(ui, 'Panel_old')
	self.Panel_new 			= TFDirector:getChildByPath(ui, 'Panel_new')
	self.txt_price_old 		= TFDirector:getChildByPath(self.Panel_old, 'txt_price_old')
	self.img_yuanbao_old 	= TFDirector:getChildByPath(self.Panel_old, 'img_yuanbao_old')
	self.txt_tips 			= TFDirector:getChildByPath(ui, 'txt_tips')
	self.txt_tips:setVisible(false)
end

function jiayuanYuofangShopLayer:registerEvents()
	self.super.registerEvents(self)

	self.buyCallback = function (event)
		local eventId = event.data[1][1]
        if eventId == nil then
            return
        end
		if eventId == 4 then
			self:close()
		end 
	end
	TFDirector:addMEGlobalListener(QiyuManager.OPEN_HOME_EVENT_SCUESS, self.buyCallback)

	self.btn_buy.logic = self
	self.btn_buy:addMEListener(TFWIDGET_CLICK, audioClickfun(jiayuanYuofangShopLayer.OnBuyClick), 1)

	self.btn_close:setClickAreaLength(100)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

end

function jiayuanYuofangShopLayer:loadData( uIinfo ,friendInfo)
	self.info=uIinfo
	self.friendInfo=friendInfo
	-- print("self.friendInfo",friendInfo)
	self:refreshUI()
end

function jiayuanYuofangShopLayer:refreshUI()

	if not self.info then
		return
	end

	local uiData=FamilyYouFangShopData:objectByID(tonumber(self.info.args))

	local rewardll = {}    
    local rewardStr = stringToTable(uiData.goods,"|")
    for i,v in ipairs(rewardStr) do
        local tbl = stringToNumberTable(v,"_")
        rewardll[i] = {type = tbl[1],itemId = tbl[2],number = tbl[3]}
    end


	local itemData = ItemData:objectByID(rewardll[1].itemId)

	if itemData == nil then
		print("道具表无此数据 id == " , rewardll[1].itemId)
		return 
	end

	self.Panel_old:setVisible(true )
	self.Panel_new:setPositionY(self.Panel_new:getPositionY() - 20)
	self.txt_price_old:setText(uiData.price1)

	
	self.txt_iconname:setText(itemData.name)
	self.img_icon:setTexture(itemData:GetPath())
	self.img_iconbg2:setTexture(GetBackgroundForGoods(itemData))
	self.txt_price:setText(uiData.price2)
	self.txt_number:setText(rewardll[1].number)

	if self.info.time then
		self.leftTime = self.info.time/1000+86400-MainPlayer:getNowtime()
	end

	if not self.leftTime then
		print("剩余时间为空")
		return
	end
	print("jiayuanYuofangShopLayer:refreshUI() :",self.leftTime)
	self.timerId = TFDirector:addTimer(1000, -1, nil, 
			function() 
				self:refreshTime()
			end)
	self:refreshTime()
end

function jiayuanYuofangShopLayer:refreshTime()
	self.leftTime = self.leftTime - 1
	if self.leftTime <= 0 then
		self:close()
		return
	end


	local timeStr = self:TimeConvertString(self.leftTime)
	self.txt_leavetime:setText(timeStr)
end

-- 时间转换
function jiayuanYuofangShopLayer:TimeConvertString(time)
	if time <= 0 then
		return "00:00:00"
	end

	local hour = math.floor(time/3600)
	local min  = math.floor((time-hour * 3600)/60)
	local sec  = math.mod(time, 60)
	return string.format("%02d:%02d:%02d", hour, min, sec)
end


function jiayuanYuofangShopLayer.OnBuyClick(sender)
	local self = sender.logic
	local playerId=MainPlayer:getPlayerId()
	if self.friendInfo then
		playerId=self.friendInfo.playerId
	end
	local eventId=self.info.eventId
	QiyuManager:RequestDealJiaYuanEvent( playerId, eventId)
end

function jiayuanYuofangShopLayer:close()
	if self.timerId ~= nil then 
		TFDirector:removeTimer(self.timerId)
		self.timerId = nil
	end

	AlertManager:closeLayerByName("lua.logic.qiyu.jiayuanYuofangShopLayer")
end


function jiayuanYuofangShopLayer:removeUI()
	print("jiayuanYuofangShopLayer:removeUI")
	self.super.removeUI(self)

end

function jiayuanYuofangShopLayer:removeEvents()
	if self.timerId ~= nil then 
		TFDirector:removeTimer(self.timerId)
		self.timerId = nil
	end
    TFDirector:removeMEGlobalListener(QiyuManager.OPEN_HOME_EVENT_SCUESS, self.buyCallback)
    self.buyCallback = nil
    self.super.removeEvents(self)
end

return jiayuanYuofangShopLayer