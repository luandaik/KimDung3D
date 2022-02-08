
local exchangeCell = class("exchangeCell", BaseLayer)

function exchangeCell:ctor(type, rewardId)
	-- 
    self.super.ctor(self)

    self.activityId 	= type
    self.activityType	= id

    self.rewardId  		= rewardId
    self.index  		= rewardId

    self:loadRewardConfigure()

    self:init("lua.uiconfig_mango_new.operatingactivities.Exchange")
end

function exchangeCell:initUI(ui)
    self.super.initUI(self,ui)
    self.btn_exchange 	= TFDirector:getChildByPath(ui, 'Button_Exchange_1')
    self.txt_times 		= TFDirector:getChildByPath(ui, 'txt_times')
    self.img_disCount 	= TFDirector:getChildByPath(ui, 'Image_Exchange_1')

    self.goodsList = {}
    for i=1,3 do
	    self.goodsList[i] = {}
	    self.goodsList[i].img_bg 	= TFDirector:getChildByPath(ui, 'img_bg_'..i)
	    self.goodsList[i].img_bg:setVisible(false)
    end
    self.img_equal 	= TFDirector:getChildByPath(ui, 'img_equal')
    self.img_equal:setVisible(false)

    local panel_view = TFDirector:getChildByPath(ui, 'Panel_Wuping')
	local scrollView = TFScrollView:create()
	scrollView:setPosition(ccp(0,0))
	scrollView:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
	scrollView:setDirection(SCROLLVIEW_DIR_HORIZONTAL)

	scrollView:setSize(panel_view:getSize())
	local height = panel_view:getSize().height

	panel_view:addChild(scrollView)
	scrollView:setBounceEnabled(true)
	scrollView:setTag(617)

	self.scrollView = scrollView
	self.panel_view = panel_view

	self.needGoodsList = TFArray:new()
	self.gotGoodsList = TFArray:new()
    self.costList = {}
	self.bIsRecruitIntegral = false

	self:drawGoodsList()
	-- scrollView:scrollToTop()
end

function exchangeCell:removeUI()
    self.super.removeUI(self)
end

function exchangeCell:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function exchangeCell:dispose()
    self.super.dispose(self)
end

--[[
刷新界面
]]
function exchangeCell:refreshUI()

	-- self.txt_times
	self.rewardData = OperationActivitiesManager:getActivityRewardData(self.activityId, self.rewardId)

	-- print("self.rewardData = ", self.rewardData)

-- 	self.rewardData =    <<table>>{
-- ├┄┄input="1,2009,1",
-- ├┄┄out="1,2000,30&3,0,100000",
-- ├┄┄status=9,
-- ├┄┄changeTime=0,
-- ├┄┄id=2
-- }
	print()
	self.exchangeCount = self.rewardData.status - self.rewardData.changeTime

	-- self.txt_times:setText(self.rewardData.changeTime .."/"..self.rewardData.status)
	
	self.txt_times:setText(self.exchangeCount)

	self.img_disCount:setVisible(false)
	if self.rewardData.discount > 0 then
		self.img_disCount:setVisible(true)
		local path  = "ui_new/operatingactivities/z"..self.rewardData.discount..".png"
		self.img_disCount:setTexture(path)
	end

    for v in self.needGoodsList:iterator() do
        local node = v.node
        if (node) then
            if v.type == EnumDropType.GOODS then
                Public:loadIconBagNode(node,v)
            else
                Public:loadIconNode(node,v,true)
            end
        end
    end
    for i,v in ipairs(self.costList) do
        local node = v.node
        if (node) then
            if v.type == EnumDropType.GOODS then
                Public:loadIconBagNode(node,v)
            else
                Public:loadIconNode(node,v,true)
            end
        end
    end
end

function exchangeCell:drawGoodsList()

	self.needGoodsList:clear()

	self.rewardData = OperationActivitiesManager:getActivityRewardData(self.activityId, self.rewardId)
	local temptbl = string.split(self.rewardData.input,'&')
	local count = 0
	local widthPerNode = 0
	local posx = 0
	local posy = 0
	self.costList = {}
    local itemMaxQuality = 1
    --物品集合
	for k,v in pairs(temptbl) do
		local reward = string.split(v,',')
		count = count + 1
		local commonReward = {}
		commonReward.type 	= tonumber(reward[1])
		commonReward.itemId = tonumber(reward[2])
		commonReward.number = tonumber(reward[3])
		local rewarddata = BaseDataManager:getReward(commonReward)
		if (#temptbl == 1) then
			local node = Public:createIconNumAndBagNode(rewarddata)
			node:setScale(0.7)
			node:setPosition(ccp(posx, posy))

			self.scrollView:addChild(node)
			widthPerNode = node:getSize().width
			posx = posx + widthPerNode/2 + 30
			rewarddata.node = node
		end
        if (itemMaxQuality < rewarddata.quality) then
            itemMaxQuality = rewarddata.quality
        end
		self.needGoodsList:push(rewarddata)
        if rewarddata.type == EnumDropType.RECRUITINTEGRAL then
            self.bIsRecruitIntegral = true 
        end
        
	end
	if (count > 1) then
		local selectNode = Public:createBgQualityNode("ui_new/operatingactivities/img_suijibaoshi.png", itemMaxQuality)--TFImage:create("ui_new/operatingactivities/img_suijibaoshi.png");
		selectNode:setTouchEnabled(false);
        selectNode:setScale(0.7)
		selectNode:setAnchorPoint(ccp(0, 0))
		posx = posx + selectNode:getSize().width / 2 + 30
		
        local bg_icon   = TFDirector:getChildByPath(selectNode, 'bg_icon');
        bg_icon.logic    = self
    	bg_icon:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onExSelectItemClickHandle),1)
        self.scrollView:addChild(selectNode)
        --
        self.btn_exchange:setTextureNormal("ui_new/operatingactivities/btn_choosetochange.png")
	else
		self.btn_exchange:setTextureNormal("ui_new/operatingactivities/btn_duihuan.png")
		self.btn_exchange.isBuy = true
	end
	--固定
    if (self.rewardData.cost ~= "") then
        local costtbl = string.split(self.rewardData.cost,'&')
        for k,v in pairs(costtbl) do
            local reward = string.split(v,',')
            local commonReward = {}
            commonReward.type   = tonumber(reward[1])
            commonReward.itemId = tonumber(reward[2])
            commonReward.number = tonumber(reward[3])
            
            local rewarddata = BaseDataManager:getReward(commonReward)
            local node = Public:createIconNumAndBagNode(rewarddata)
            node:setScale(0.7)
            node:setPosition(ccp(posx, posy))
            rewarddata.node = node
            self.scrollView:addChild(node)
            table.insert(self.costList, rewarddata)
            widthPerNode = node:getSize().width
            posx = posx + widthPerNode/2 + 30
        end
    end
	-- 绘制  = 
	local img_equal = TFImage:create("ui_new/operatingactivities/img_denghao.png")
	img_equal:setPosition(ccp(posx+30, 50))
	self.scrollView:addChild(img_equal)

	widthPerNode = img_equal:getSize().width
	posx = posx + widthPerNode/2 + 30

	self.gotGoodsList:clear()
	local temptbl = string.split(self.rewardData.out,'&')
	for k,v in pairs(temptbl) do
		local reward = string.split(v,',')
		local commonReward = {}
		commonReward.type 	= tonumber(reward[1])
		commonReward.itemId = tonumber(reward[2])
		commonReward.number = tonumber(reward[3])
        local rewarddata = BaseDataManager:getReward(commonReward)
        if (rewarddata) then
            -- /self.scrollView

            local node = Public:createIconNumNode(rewarddata)
            node:setScale(0.7)
            node:setPosition(ccp(posx, posy))

            self.scrollView:addChild(node)

            widthPerNode = node:getSize().width
            rewarddata.node = node
            posx = posx + widthPerNode/2 + 30
            self.gotGoodsList:push(rewarddata)
        else
            print("****************not rewarddata  ",commonReward)
        end
	end

	self.scrollView:setInnerContainerSize(CCSizeMake(posx, self.panel_view:getSize().height))
end

--[[
刷新按钮状态
]]
function exchangeCell:refreshButtonState()

end


function exchangeCell:loadRewardConfigure()
	self.rewardData = OperationActivitiesManager:getActivityRewardData(self.activityId, self.rewardId)

	-- print("self.rewardData = ", self.rewardData)
end

function exchangeCell:setLogic(logic)
    self.logic = logic
end


function exchangeCell.onClick(sender)
    local index = sender.index
    local self  = sender.logic

    local rewardItems = self.rewardItems

	local item = rewardItems:objectAt(index)
	Public:ShowItemTipLayer(item.itemid, item.type);
     
end


function exchangeCell.onExchangeClickHandle(sender)
    local self  = sender.logic

    if self.exchangeCount ==  0 then
    	--toastMessage("兑换次数已用完")
    	toastMessage(localizable.exchangeCell_times_over)
    	return
    end
    if self:haveDiscount() == true and #self.costList <= 0 then
        -- 集合物品一定会存在，固定物品不一定，折扣券只能在消耗品唯一的情况下合用（同：折扣券只能应用于集合里面的物品）
    	local layer  = require("lua.logic.activity.ActivityDiscountReplyLayer"):new()
	    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
        local nLen = self.needGoodsList:length()
        if (nLen == 1) then
	       layer:setInfo(self.needGoodsList,self.gotGoodsList,self.discountTypeList, self.index,self.activityId)
        elseif (nLen >= 1) then
            layer:setInfo(self.needGoodsList:objectAt(1),self.gotGoodsList,self.discountTypeList, self.index,self.activityId)
        end
	    AlertManager:show()
    	return
    end
    -- self.needGoodsList
    local inputStr = ""
    local count = 0
    --集合物品只有一个才会走到这时
    local needItemInfo = self.needGoodsList:objectAt(1)
    --for v in self.needGoodsList:iterator() do
    --    if (count >= 1) then
    --        break
     --   end
    if MainPlayer:getGoodsIsEnough(needItemInfo) == false then
    	--toastMessage("您的"..v.name.."不够")
    	toastMessage(stringUtils.format(localizable.exchangeCell_not_enough, needItemInfo.name))
    	return
    end
    count = count + 1
    inputStr = inputStr .. needItemInfo.name.."X"..needItemInfo.number
   -- end
    for i,v in ipairs(self.costList) do
        if MainPlayer:getGoodsIsEnough(v) == false then
            --toastMessage("您的{p1}不够")
            toastMessage(stringUtils.format(localizable.exchangeCell_not_enough, v.name))
            return
        end
        inputStr = inputStr .. ","..v.name.."X"..v.number
    end
    print("inputStr = ", inputStr)

    local  outStr = ""
    count = 0
    for v in self.gotGoodsList:iterator() do
    	if count > 0 then
        	outStr = outStr .. ","
        end
        count = count + 1
        outStr = outStr .. v.name.."X"..v.number
    end
    print("outStr = ", outStr)

    -- OperationActivitiesManager:sendMsgToGetActivityReward(self.type, self.index)
    --local warningMsg = "大侠，是否使用 ["..inputStr.."] 兑换 ["..outStr.."] ?"
    local warningMsg = stringUtils.format(localizable.exchangeCell_exchange_tips,inputStr,outStr)
    local targetSrc     = needItemInfo.type..","..needItemInfo.itemid..","..needItemInfo.number
    
    CommonManager:showOperateSureLayer(
            function()
                OperationActivitiesManager:sendMsgToGetActivityReward(self.activityId, self.index,nil,0, targetSrc)
            end,
            nil,
            {
            	msg = warningMsg
            	-- msg =  "大侠，是否开始兑换？"
            }
    )
end
function exchangeCell.onExSelectItemClickHandle(sender)
    local self  = sender.logic
    if (sender.isBuy) then
		self.onExchangeClickHandle(sender)
		return
	end
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.gameactivity.exchangeSelectItemLayer",AlertManager.BLOCK_AND_GRAY,tween);
    local data = {}
    data.exchangeCount 		= self.exchangeCount
    data.needGoodsList      = self.needGoodsList
    data.costList 		    = self.costList
    data.gotGoodsList 		= self.gotGoodsList
    data.haveDiscount       = self:haveDiscount() and (#self.costList <= 0)
    data.discountTypeList 	= self.discountTypeList
    data.index 				= self.index
    data.activityId 		= self.activityId
    layer:setData(data)
    AlertManager:show();
end
function exchangeCell:haveDiscount()
    local activityInfo = OperationActivitiesManager:getActivityInfo(self.activityId)
    self.discountTypeList = {}
    local havediscount = false
    if activityInfo.discountTypeList then
    	for i=1,#activityInfo.discountTypeList do
    		local id = activityInfo.discountTypeList[i]
    		local item = {}
    		item.itemId = id
    		item.type = EnumDropType.GOODS
    		item.number = BagManager:getItemNumById(id)
    		if item.number > 0 then
    			havediscount = true
    			local index = #self.discountTypeList + 1
    			self.discountTypeList[index] = BaseDataManager:getReward(item)
    		end
    	end
    end
    return havediscount
end

function exchangeCell:registerEvents()
    self.super.registerEvents(self)

    self.btn_exchange.logic    = self   
    --self.btn_exchange:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onExchangeClickHandle),1)
    --self.select_item.logic    = self   
    --self.select_item:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onExSelectItemClickHandle),1)
    self.btn_exchange:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onExSelectItemClickHandle),1)
end


function exchangeCell:removeEvents()
    self.super.removeEvents(self)
end

return exchangeCell