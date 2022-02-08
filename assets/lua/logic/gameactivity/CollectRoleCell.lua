
local CollectRoleCell = class("CollectRoleCell", BaseLayer)

function CollectRoleCell:ctor(type, rewardId)
	-- 
    self.super.ctor(self)

    self.activityId 	= type
    self.activityType	= id

    self.rewardId  		= rewardId
    self.index  		= rewardId

    self:loadRewardConfigure()

    self:init("lua.uiconfig_mango_new.operatingactivities.peiyangjiangli")
end

function CollectRoleCell:initUI(ui)
    self.super.initUI(self,ui)
    self.txt_mubiao 	= TFDirector:getChildByPath(ui, 'txt_mubiao')
    self.img_ylq 	= TFDirector:getChildByPath(ui, 'img_ylq')
    self.btn_get 	= TFDirector:getChildByPath(ui, 'btn_get')


    self.rewardCell 		= TFDirector:getChildByPath(ui, 'img_bg_1')
    self.roleStarCell 		= TFDirector:getChildByPath(ui, 'panel_info')
    self.roleGetCell 		= TFDirector:getChildByPath(ui, 'panel_card')

	self.rewardCell:removeFromParent(true)
	self.rewardCell:retain()
	self.roleStarCell:removeFromParent(true)
	self.roleStarCell:retain()
	self.roleGetCell:removeFromParent(true)
	self.roleGetCell:retain()

    self.img_equal 	= TFDirector:getChildByPath(ui, 'img_equal')
    self.img_equal:setVisible(false)

    local panel_view = TFDirector:getChildByPath(ui, 'Panel_Wuping')
	local scrollView = TFScrollView:create()
	scrollView:setPosition(ccp(0,0))
	scrollView:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
	scrollView:setDirection(SCROLLVIEW_DIR_HORIZONTAL)

	scrollView:setSize(panel_view:getSize())
	local height = panel_view:getSize().height
	-- local height2 =  70 * row + 40
	-- -- if height2 < height then
	-- -- 	height2 = height
	-- -- end

	-- scrollView:setInnerContainerSize(CCSizeMake(panel_view:getSize().width , height2))
	panel_view:addChild(scrollView)
	scrollView:setBounceEnabled(true)
	scrollView:setTag(617)

	self.scrollView = scrollView
	self.panel_view = panel_view

	self.needGoodsList = TFArray:new()
	self.gotGoodsList = TFArray:new()

	self:drawGoodsList()
	-- scrollView:scrollToTop()
end

function CollectRoleCell:removeUI()
    self.super.removeUI(self)
    if self.rewardCell then
        self.rewardCell:release()
        self.rewardCell = nil
    end
    if self.roleStarCell then
        self.roleStarCell:release()
        self.roleStarCell = nil
    end
    if self.roleGetCell then
        self.roleGetCell:release()
        self.roleGetCell = nil
    end
end

function CollectRoleCell:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function CollectRoleCell:dispose()
    self.super.dispose(self)
end

--[[
刷新界面
]]
function CollectRoleCell:refreshUI()

	-- self.txt_times
	self.rewardData = OperationActivitiesManager:getActivityRewardData(self.activityId, self.rewardId)

	self:drawGoodsList()

	self.exchangeCount = self.rewardData.status - self.rewardData.changeTime
	if self.exchangeCount == 0 then
		self.img_ylq:setVisible(true)
		self.btn_get:setVisible(false)
	else
		self.img_ylq:setVisible(false)
		self.btn_get:setVisible(true)

		for v in self.needGoodsList:iterator() do
	        local cardRole = CardRoleManager:getRoleById(v.roleId)
	        if cardRole == nil or cardRole.starlevel < v.star then
	    		self.btn_get:setTouchEnabled(false)
	    		self.btn_get:setGrayEnabled(true)
	        	return
	        end
	    end
		self.btn_get:setTouchEnabled(true)
		self.btn_get:setGrayEnabled(false)
	end
	

	-- for v in self.needGoodsList:iterator() do
	-- 	local node = v.node
	-- 	if v.star == 0 then
	-- 		node =  self.roleGetCell:clone()
	-- 		self:setRoleGetInfo(node , v.roleId )
	-- 	else
	-- 		node =  self.roleStarCell:clone()
	-- 		self:setRoleStarInfo(node , v.roleId,v.star  )
	-- 	end
	-- end
	-- -- 组合物品的数据

	-- for v in self.gotGoodsList:iterator() do
	-- 	local node = v.node
	-- 	local itemData = 
	-- 	if v.type == EnumDropType.GOODS then
	-- 		Public:loadIconNode(node,v)
	-- 	else
	-- 		Public:loadIconNode(node,v,true)
	-- 	end
	-- end
end

function CollectRoleCell:setRoleStarInfo(widget , roleId ,star)
	local cardInfo = RoleData:objectByID(roleId)
	if cardInfo == nil then
		return
	end
	local btn_quality = TFDirector:getChildByPath(widget, 'btn_quality')
	local img_icon = TFDirector:getChildByPath(widget, 'img_icon')
	local img_zhiye = TFDirector:getChildByPath(widget, 'img_zhiye')
	local txt_name = TFDirector:getChildByPath(widget, 'txt_name')
	btn_quality:setTextureNormal(GetColorIconByQuality(cardInfo.quality))
	btn_quality:setTexturePressed(GetColorIconByQuality(cardInfo.quality))
	img_icon:setTexture(cardInfo:getIconPath())
	img_zhiye:setTexture("ui_new/fight/zhiye_".. cardInfo.outline ..".png");
	txt_name:setText(cardInfo.name)
	local starList = {}
	for i=1,5 do
		local bg = TFDirector:getChildByPath(widget, 'img_starbg'..i)
		starList[i] = TFDirector:getChildByPath(bg, 'img_star')
		starList[i]:setVisible(false)
	end
	local roleInfo = CardRoleManager:getRoleById( roleId )
	local starlevel = 0
	if roleInfo then
		starlevel = roleInfo.starlevel
	end

    for i=1,starlevel do
        local starIdx = i
        local starTextrue = 'ui_new/common/xl_dadian22_icon.png'
        if i > 5 then
            starTextrue = 'ui_new/common/xl_dadian23_icon.png'
            starIdx = i - 5
        end
        starList[starIdx]:setTexture(starTextrue)
        starList[starIdx]:setVisible(true)
    end 
end

function CollectRoleCell:setRoleGetInfo(widget , roleId )
	local cardInfo = RoleData:objectByID(roleId)
	if cardInfo == nil then
		return
	end
	local btn_pingzhianniu = TFDirector:getChildByPath(widget, 'btn_pingzhianniu')
	local img_pinzhiditu = TFDirector:getChildByPath(widget, 'img_pinzhiditu')
	local img_touxiang = TFDirector:getChildByPath(widget, 'img_touxiang')
	local txt_name = TFDirector:getChildByPath(widget, 'txt_name')
	local img_cover = TFDirector:getChildByPath(widget, 'img_cover')
	img_pinzhiditu:setTexture(GetColorIconByQuality(cardInfo.quality))
	img_touxiang:setTexture(cardInfo:getIconPath())
	txt_name:setText(cardInfo.name)
	local hasRole = CardRoleManager:getRoleById( roleId )
	if hasRole then
		img_cover:setVisible(false)
	else
		img_cover:setVisible(true)
	end
end


function CollectRoleCell:drawGoodsList()

	self.needGoodsList:clear()
	self.scrollView:removeAllChildrenWithCleanup(true)
	self.rewardData = OperationActivitiesManager:getActivityRewardData(self.activityId, self.rewardId)
	print("self.rewardData ==>",self.rewardData)
	local temptbl = string.split(self.rewardData.input,'&')
	local count = 0
	local widthPerNode = 0
	local posx = 0
	local posy = 0
	for k,v in pairs(temptbl) do
		local reward = string.split(v,',')
		count = count + 1
		local commonReward = {}
		commonReward.type 	= tonumber(reward[1])
		commonReward.roleId = tonumber(reward[2])
		commonReward.star = tonumber(reward[3])

		local node = nil
		if commonReward.star == 0 then
			node =  self.roleGetCell:clone()
			self:setRoleGetInfo(node , commonReward.roleId )
			self.txt_mubiao:setText(localizable.CollectRoleCell_Text_1)
		else
			node =  self.roleStarCell:clone()
			self:setRoleStarInfo(node , commonReward.roleId,commonReward.star  )
			self.txt_mubiao:setText(stringUtils.format(localizable.CollectRoleCell_Text_2,commonReward.star))
		end
		node:setAnchorPoint(ccp(0, 0))
		node:setVisible(true)
		-- node:setScale(0.7)
		node:setPosition(ccp(posx , posy))

		self.scrollView:addChild(node)

		widthPerNode = node:getSize().width

		posx = posx + widthPerNode/2 + 30
		commonReward.node = node
		self.needGoodsList:push(commonReward)
	end

	-- 绘制  = 
	local img_equal = TFImage:create("ui_new/operatingactivities/img_denghao.png")
	img_equal:setPosition(ccp(posx+30, 50))
	self.scrollView:addChild(img_equal)

	widthPerNode = img_equal:getSize().width
	posx = posx + widthPerNode/2 + 30

	self.gotGoodsList:clear()
	-- print("self.rewardData.out==>",self.rewardData.out)
	local temptbl = string.split(self.rewardData.out,'&')
	for k,v in pairs(temptbl) do
		local reward = string.split(v,',')
		count = count + 1
		local commonReward = {}
		local rewarddata = {}
		commonReward.type 	= tonumber(reward[1])
		commonReward.itemId = tonumber(reward[2])
		commonReward.number = tonumber(reward[3])
		local _rewarddata = BaseDataManager:getReward(commonReward)
		-- /self.scrollView

		local node = Public:createIconNumNode(_rewarddata)
		node:setScale(0.8)
		node:setPosition(ccp(posx, posy+10))

		self.scrollView:addChild(node)

		widthPerNode = node:getSize().width
		rewarddata.itemData = commonReward
		rewarddata.node = node
		posx = posx + widthPerNode/2 + 40
		self.gotGoodsList:push(rewarddata)
	end

	self.scrollView:setInnerContainerSize(CCSizeMake(posx, self.panel_view:getSize().height))
end

--[[
刷新按钮状态
]]
function CollectRoleCell:refreshButtonState()

end


function CollectRoleCell:loadRewardConfigure()
	self.rewardData = OperationActivitiesManager:getActivityRewardData(self.activityId, self.rewardId)

	-- print("self.rewardData = ", self.rewardData)
end

function CollectRoleCell:setLogic(logic)
    self.logic = logic
end


function CollectRoleCell.onClick(sender)
    local index = sender.index
    local self  = sender.logic

    local rewardItems = self.rewardItems

	local item = rewardItems:objectAt(index)
	Public:ShowItemTipLayer(item.itemid, item.type);
     
end


function CollectRoleCell.onExchangeClickHandle(sender)
    local self  = sender.logic

    if self.exchangeCount ==  0 then
    	--toastMessage("兑换次数已用完")
    	toastMessage(localizable.CollectRoleCell_times_over)
    	return
    end
    local inputStr = ""
    local count = 0
    for v in self.needGoodsList:iterator() do
        local cardRole = CardRoleManager:getRoleById(v.roleId)
        if cardRole == nil or cardRole.starlevel < v.star then
    		toastMessage(localizable.CollectRoleCell_Condition_Fail)
        	return
        end
    end

   
    OperationActivitiesManager:sendMsgToGetActivityReward(self.activityId, self.index,nil,0)
          
end
function CollectRoleCell:registerEvents()
    self.super.registerEvents(self)

    self.btn_get.logic    = self   
    self.btn_get:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onExchangeClickHandle),1)
end

function CollectRoleCell:removeEvents()
    self.super.removeEvents(self)
end

return CollectRoleCell