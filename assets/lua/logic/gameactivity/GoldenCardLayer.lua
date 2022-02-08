--[[
******至尊金卡主界面*******

	-- by shenjingjie
	-- 2017/12/15	
]]
local GoldenCardLayer = class("GoldenCardLayer", BaseLayer)

GoldenCardLayer.qunHaoLevel = 31
GoldenCardLayer.maxType = 3
function GoldenCardLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.operatingactivities.ZhiZunJinKa")

    self.GoldenCardInfo = nil
    
    self.QHPRank = self.qunHaoLevel 
end

function GoldenCardLayer:initUI(ui)
	self.super.initUI(self,ui);

	self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.btn_close.logic = self

    self.img_yuanBaoYiGou = TFDirector:getChildByPath(ui, "img_huise")
    self.myVipLevel = TFDirector:getChildByPath(ui, "txt_dq")
	self.btn_help = TFDirector:getChildByPath(ui, "btn_xiang")
	self.txt_yb = TFDirector:getChildByPath(ui, "txt_yb")

	self.btn_buy = TFDirector:getChildByPath(ui, "btn_goumai")
	self.txt_rmb = TFDirector:getChildByPath(self.btn_buy, "txt_price")
	self.txt_overplusTime = TFDirector:getChildByPath(self.btn_buy, "txt_num")

	self.btn_lingQu = TFDirector:getChildByPath(ui, "btn_lingqu")
	self.txt_overplusDay = TFDirector:getChildByPath(self.btn_lingQu, "txt_dq")
	self.txt_item = TFDirector:getChildByPath(self.btn_lingQu, "txt_item_name")
	self.txt_item:setVisible(false)

	self.txt_klq = TFDirector:getChildByPath(self.btn_lingQu, "txt_klq")
	self.txt_klq:setVisible(false)
	-- self.rewardInfo = 
	-- self.iconQuality = TFDirector:getChildByPath(ui, 'btn_tool1')
 --    self.iconGoods = TFDirector:getChildByPath(ui, 'img_tool')
 --    self.goodsNum = TFDirector:getChildByPath(ui, 'txt_num2')
 	self.rewardItem = {}
 	for i = 1, self.maxType do 
 		-- 道具icon
 		self.rewardItem[i] = {}
 		self.rewardItem[i].iconQuality = TFDirector:getChildByPath(ui, 'btn_tool'..i)
 		self.rewardItem[i].iconGoods = TFDirector:getChildByPath(self.rewardItem[i].iconQuality, 'img_tool')
		self.rewardItem[i].goodsNum = TFDirector:getChildByPath(self.rewardItem[i].iconQuality, 'txt_num2')
 		
 		-- 描述
 		local txt_Type = TFDirector:getChildByPath(ui, 'txt_tiaojian'..i)
 		self.rewardItem[i].txt_radio = TFDirector:getChildByPath(txt_Type, 'txt_num'..i)

 	end
end

function GoldenCardLayer:removeUI()
    self.super.removeUI(self)
end

function GoldenCardLayer:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function GoldenCardLayer:refreshUI()
	self.GoldenCardInfo = GoldenCardManager:getGoldenCardInfo()
	-- local reward = BaseDataManager:getReward(self.GoldenCardInfo.rewardInfo[1])
	local RechargeData = require("lua.table.t_s_recharge")
	local rechargeInfo = RechargeData:objectByID(self.GoldenCardInfo.commodityId)

	-- 奖励类型
	-- local desNum = 0
	-- for i=1,#self.ActivityType do 
	-- 	if (i == self.GoldenCardInfo.desType) then
	-- 		self.ActivityType[i]:setVisible(true)
	-- 		--群豪谱要计算排名
	-- 		if (self.GoldenCardInfo.desType == GoldenCardManager.activityType.Type_QHP) then
	-- 			--请求群豪谱排名
	-- 			ArenaManager:updateHomeInfo()
	-- 		end
	-- 	else
	-- 		self.ActivityType[i]:setVisible(false)
	-- 	end
	-- 	if (self.GoldenCardInfo.desType == GoldenCardManager.activityType.Type_VIP) then
	-- 		desNum = MainPlayer:getVipLevel()
	-- 	elseif (self.GoldenCardInfo.desType == GoldenCardManager.activityType.Type_Team) then 
	-- 		desNum = MainPlayer:getLevel()
	-- 	end
	-- end

	-- 描述信息
	-- local myStr = stringUtils.format(localizable.GoldenCard_tip[self.GoldenCardInfo.desType], desNum)
	-- self.myVipLevel:setText(myStr)

    --请求群豪谱排名
	ArenaManager:updateHomeInfo()
	if (self.GoldenCardInfo.endTime == nil or self.GoldenCardInfo.endTime == 0) then
		self.btn_buy:setVisible(true)
		self.btn_lingQu:setVisible(false)
		self.img_yuanBaoYiGou:setVisible(false)
		self.txt_overplusTime:setVisible(true)
		-- 显示价格
		self.txt_rmb:setText(tonumber(rechargeInfo.price))
		-- 显示购买期限,添加倒计时
		if (self.updateEndTime) then
			TFDirector:removeTimer(self.updateEndTime)
        	self.updateEndTime = nil
		end
		self.updateEndTime = TFDirector:addTimer(1000, -1, nil,
	        function()
	            self:refreshTimeUI()
    	end)

	else
		self.btn_buy:setVisible(false)
		self.btn_lingQu:setVisible(true)
		self.img_yuanBaoYiGou:setVisible(true)

		--如果有倒计时就关掉
		if (self.updateEndTime) then
			TFDirector:removeTimer(self.updateEndTime)
        	self.updateEndTime = nil
		end
		self.txt_overplusTime:setVisible(false)

		-- 剩余领取天数,初始时间为1,所以要减去1
		local date = self.GoldenCardInfo.endTime * 0.001 - MainPlayer:getNowtime()
		local yDay = math.ceil(date / (24 *60*60))
		--领取图标
		if (GoldenCardManager:isRedPoint()) then
			self.btn_lingQu:setTouchEnabled(true)
			self.btn_lingQu:setTextureNormal("ui_new/qiyu/yk_lingqu.png")
		else
			self.btn_lingQu:setTouchEnabled(false)
			self.btn_lingQu:setTextureNormal("ui_new/pay/btn_lingqu2.png")
			--如果已领取,还要再减-1
			yDay = yDay - 1
		end
		local dayStr = stringUtils.format(localizable.GoldenCard_tip4, yDay)
		self.txt_overplusDay:setText(dayStr)
		--道具
		-- self.txt_item:setColor(GetColorByQuality(reward.quality))
		-- self.txt_item:setText(reward.name.."X"..reward.number * desNum)
	end

	--显示获取的元宝
	self.txt_yb:setText(stringUtils.format(localizable.GoldenCard_tip5, rechargeInfo.sycee))
	--添加道具信息
	-- self.goodsNum:setText(tonumber(reward.number))
	-- self.iconGoods:setTexture(reward.path)
	-- self.iconQuality:setTextureNormal(GetColorIconByQuality(reward.quality))
	for i = 1, self.maxType, 1 do 
		-- 道具信息
		local itemInfo = self.GoldenCardInfo.rewardInfo[i].item[1]
		local reward = BaseDataManager:getReward(itemInfo)
		self.rewardItem[i].iconQuality:setTextureNormal(GetColorIconByQuality(reward.quality))
		self.rewardItem[i].iconGoods:setTexture(reward.path)
		self.rewardItem[i].goodsNum:setText(tonumber(reward.number))
		Public:addPieceImg(self.rewardItem[i].iconGoods, itemInfo, nil)
		-- 系数
		self.rewardItem[i].txt_radio:setText("X"..self.GoldenCardInfo.rewardInfo[i].radio)
	end
	
end

function GoldenCardLayer:registerEvents()
	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
	self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClick))
	self.btn_buy.logic = self
	self.btn_buy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBuyClick))
	self.btn_lingQu.logic = self
	self.btn_lingQu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onLingQuClick),1)
	for i = 1, self.maxType do  
		self.rewardItem[i].iconQuality.logic = self
		self.rewardItem[i].iconQuality.idx = i
		self.rewardItem[i].iconQuality:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShowItemClick))
	end

	self.onCallBack = function(event)
        self:refreshUI()
    end
	TFDirector:addMEGlobalListener(GoldenCardManager.RefreshLayer, self.onCallBack)

	self.updateQHPInfoCallBack = function(event)
        self.QHPRank = ArenaManager:getMyRank()
        if (self.QHPRank == nil) then
			self.QHPRank = self.qunHaoLevel
        end
        --因为服务器发第一名为0
	    self.QHPRank = self.QHPRank + 1
	    print("因为服务器发第一名为0",self.QHPRank)
    end

	TFDirector:addMEGlobalListener(ArenaManager.updateHomeInfo ,self.updateQHPInfoCallBack)

	-- self.super.removeEvents(self)
end
function GoldenCardLayer:removeEvents()
	
    
    TFDirector:removeMEGlobalListener(GoldenCardManager.RefreshLayer, self.onCallBack)
    self.onCallBack = nil
    TFDirector:removeMEGlobalListener(ArenaManager.updateHomeInfo ,self.updateQHPInfoCallBack)
    self.updateQHPInfoCallBack = nil

    if (self.updateEndTime) then
        TFDirector:removeTimer(self.updateEndTime)
        self.updateEndTime = nil
    end
    self.super.removeEvents(self)
end
function GoldenCardLayer:onHelpClick()
    GoldenCardManager:showRuleLayer()
end
function GoldenCardLayer.onBuyClick(sender)
	local self = sender.logic
    PayManager:pay(self.GoldenCardInfo.commodityId, 0)
end
function GoldenCardLayer.onLingQuClick(sender)
	local self = sender.logic
    -- GoldenCardManager:requestGoldenCardReward()
    local itemStr = ""
    for i = 1, self.maxType do 
    	local itemInfo = self.GoldenCardInfo.rewardInfo[i]
		local reward = BaseDataManager:getReward(itemInfo.item[1])
		local typeNum = 0
		--获取自己的vip等级,团队等级,群豪谱排名
		if (itemInfo.type == GoldenCardManager.activityType.Type_VIP) then
			typeNum = MainPlayer:getVipLevel()
		elseif (itemInfo.type == GoldenCardManager.activityType.Type_Team) then
			typeNum = MainPlayer:getLevel()
		elseif (itemInfo.type == GoldenCardManager.activityType.Type_QHP) then
			typeNum = self.qunHaoLevel - self.QHPRank
			if (typeNum <= 0) then
				typeNum = 1
			end
		end
		--最终 数量
		local itemNum = math.ceil(reward.number * itemInfo.radio * typeNum)
		if reward.quality == 2 then
			nameRGBValue = '#008000'
		elseif reward.quality == 3 then
			nameRGBValue = '#0000FF'
		elseif reward.quality == 4 then
			nameRGBValue = '#800080'
		elseif reward.quality == 5 then
			nameRGBValue = '#ff9c00'
		elseif reward.quality == 6 then
			nameRGBValue = '#ff0000'
		end
		-- 拼接富文本
		if (i >= 2) then
			itemStr = itemStr .. ", "
		end
		local addStr = stringUtils.format([[<font color="{p1}" fontSize="26">{p2}</font>]],nameRGBValue,reward.name.."x"..itemNum)
		itemStr = itemStr .. addStr
    end

    local msg = stringUtils.format(localizable.GoldenCard_richtip, itemStr)--"\n此次可领取【{p1}】?\n每天只可领取一次奖励,是否确认领取"
	CommonManager:showOperateSureLayer(function()
		GoldenCardManager:requestGoldenCardReward()
    end,
    nil,
    {
		msg = msg,
		isRich = true
    })
    return true
end
function GoldenCardLayer.onShowItemClick(sender)
	local self = sender.logic
	local idx = sender.idx
	local rewardInfo = self.GoldenCardInfo.rewardInfo[idx].item[1]
	rewardInfo.itemid = rewardInfo.itemId
	Public:ShowItemTipLayer(rewardInfo.itemid, rewardInfo.type)
end
--刷新时间
function GoldenCardLayer:refreshTimeUI()

    local activityEndTime = OperationActivitiesManager:getActivityInfoByType(OperationActivitiesManager.Type_GoldenCard).endTime
	local nowTime = MainPlayer:getNowtime()
	local endDate = math.floor(activityEndTime - nowTime)

	local day = math.floor(endDate / (60 * 60 * 24))
    local hour = math.floor(endDate / (60 * 60 )% 24)
    local min = math.floor(endDate / 60 % 60)
    local sec = math.floor(endDate / 60 / 60 % 60)
    self.txt_overplusTime:setText(stringUtils.format(localizable.common_time_5, day, hour, min, sec))
    if ((activityEndTime - nowTime) <= 0) then
        --提示活动已结束
        self.txt_overplusTime:setText(localizable.treasureMain_tiemout)
        if self.updateEndTime then
            TFDirector:removeTimer(self.updateEndTime)
            self.updateEndTime = nil
        end
    end
end

function ArenaManager:getMyRank()
    return self.MyRank
end

return GoldenCardLayer