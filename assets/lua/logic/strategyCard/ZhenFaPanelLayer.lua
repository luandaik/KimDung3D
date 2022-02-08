-- client side ZhenFaPanelLayer.lua
--[[
 * @Description: 阵法强化背景界面
 ]]
-- script writer wuqi
-- creation time 2016-08-05

local ZhenFaPanelLayer = class("ZhenFaPanelLayer", BaseLayer)

--Tab页个数
ZhenFaPanelLayer.kTabNumber = 5
--默认选中的Tab页索引
ZhenFaPanelLayer.kDefaultTabIndex = 1

--[[
	Tab按钮按下的图片地址
]]
local tabPressedPaths = 
{
	"ui_new/zhenfa/tab_qhh.png",
	"ui_new/zhenfa/tab_tupoh.png",
	"ui_new/zhenfa/tab_yiweih.png",
	"ui_new/zhenfa/tab_tuiyanh.png",
	"ui_new/zhenfa/tab_shenyanh.png"
}

--[[
	Tab按钮未按下的图片地址
]]
local tabNormalPaths = 
{
	"ui_new/zhenfa/tab_qh.png",
    "ui_new/zhenfa/tab_tupo.png",
    "ui_new/zhenfa/tab_yiwei.png",
    "ui_new/zhenfa/tab_tuiyan.png",
    "ui_new/zhenfa/tab_shenyan.png"
}

local layerDeclear = {
	"lua.logic.strategyCard.ZhenFaStrongLayer",
	"lua.logic.strategyCard.ZhenFaTuPoLayer",
	"lua.logic.strategyCard.ZhenFaYiWeiLayer",
	"lua.logic.strategyCard.ZhenFaTuiYanLayer",
	"lua.logic.strategyCard.ZhenfaShenyanLayer"
}

ZhenFaPanelLayer.FuncId = {150, 151, 152}

function ZhenFaPanelLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.zhenfa.ZhenFaPanel")
    self.selectedTab = StrategyCardManager.handleIntensify
    self.firstShow = true
end

function ZhenFaPanelLayer:loadData(gmId, list, index)
    self.gmId = gmId
    self.equipList = list
    self.selectedTab = self:getTabIndex( index )
end

function ZhenFaPanelLayer:initUI(ui)
	self.super.initUI(self,ui)

	--通用头部
    self.generalHead = CommonManager:addGeneralHead( self )

    self.generalHead:setData(ModuleType.ZhenFa, {HeadResType.COIN,HeadResType.SYCEE})

    --Tab按钮
    self.btn_tab = {}
    self.btn_splats = {}
	for i = 1, self.kTabNumber do
		self.btn_tab[i] = TFDirector:getChildByPath(ui, "tab_" .. i)
		self.btn_tab[i].tag = i
		self.btn_tab[i].logic = self
		self.btn_splats[i] = TFDirector:getChildByPath(ui, "img_splats_" .. i)
		self.btn_splats[i].tag = i
	end

	--内容图层
	self.panel_content  = TFDirector:getChildByPath(ui, 'panel_content')
	self.panel_touch_event = TFDirector:getChildByPath(ui, 'panel_touch_event')
	self.panel_touch_event:setVisible(true)
	--设置为事件穿透
	self.panel_touch_event:setSwallowTouch(false)
	
	--切换界面按钮
	self.btn_left 		= TFDirector:getChildByPath(ui, 'btn_left')
	self.btn_left.logic = self
	self.btn_right 		= TFDirector:getChildByPath(ui, 'btn_right')
	self.btn_right.logic= self

	self.btn_left:setClickScaleEnabled(true)
	self.btn_right:setClickScaleEnabled(true)

	self.operationLayer = {}
end

function ZhenFaPanelLayer:setEquipGmId(gmId)
	self.gmId = gmId
	self.operationLayer[self.selectedTab]:setVisible(true)
	self.operationLayer[self.selectedTab]:setEquipGmId(gmId)
    --[[
	if self.selectedTab ~= self.kTabNumber then
		self.operationLayer[self.selectedTab]:setEquipGmId(gmId)
	end
    ]]
end

function ZhenFaPanelLayer:onShow()
	self.super.onShow(self)
	self.generalHead:onShow();
    self:refreshUI()
    if self.selectedTab and self.operationLayer[self.selectedTab] then
    	self.operationLayer[self.selectedTab]:onShow()
    end
    
    if self.firstShow == true then
    	self.ui:runAnimation("Action0",1);
    	self.firstShow = false
    end
end

function ZhenFaPanelLayer:refreshUI()
    self:refreshTabButton()
    self:selectDefaultTab()

    local index = StrategyCardManager:getCardIndexByGmid(self.gmId)
    local maxNum = StrategyCardManager:getCardMaxNumber()
    self.btn_left:setVisible(true)
    if index <= 1 then
        self.btn_left:setVisible(false)
    end
    self.btn_right:setVisible(true)
    if index >= maxNum then
        self.btn_right:setVisible(false)
    end
    if (self.selectedTab == 5) then
	    --推演界面
		self.btn_right:setVisible(false)
		self.btn_left:setVisible(false)
	else
		self.btn_right:setVisible(true)
		self.btn_left:setVisible(true)
	end

	local item = StrategyCardManager:getStrategyCardByGmid(self.gmId)
	if (item.level < 60) then
		self.btn_tab[4]:setGrayEnabled(true)
	end

	if (MainPlayer:getServerSwitchStatue(ServerSwitchType.ShenYan) == false) then
		self.btn_tab[5]:setVisible(false)
	else
		if (item.starLevel < 2) then
			self.btn_tab[5]:setGrayEnabled(true)
		end
	end
end

function ZhenFaPanelLayer:setLogic(logic)
	self.logic = logic
end

--[[
	刷新顶部tab栏的按钮
]]
function ZhenFaPanelLayer:refreshTabButton()
	for i = 1,#self.btn_tab do
		--这里处理每一个按钮
	end

	local item = StrategyCardManager:getStrategyCardByGmid(self.gmId)
	CommonManager:updateWidgetState(self.btn_tab[1], self.FuncId[1], item:canInstenify(), visiable,ccp(-30,10))
	CommonManager:updateWidgetState(self.btn_tab[2], self.FuncId[2], item:canStarUp(), visiable,ccp(-30,10))
	CommonManager:updateWidgetState(self.btn_tab[3], self.FuncId[3], EquipmentManager:isHaveGemEnough(), visiable,ccp(-30,10))
end

function ZhenFaPanelLayer:removeUI()
	self.super.removeUI(self)
end

--销毁方法
function ZhenFaPanelLayer:dispose()
	for i = 1,#layerDeclear do
		if self.operationLayer[i] then
			self.operationLayer[i]:dispose()
		end
	end

	if self.generalHead then
		self.generalHead:dispose()
		self.generalHead = nil
	end

    self.super.dispose(self)
end

--默认选中第一个tab按钮
function ZhenFaPanelLayer:selectDefaultTab()
	--if not self.selectedTab then
		self.tabButtonClickHandle(self.btn_tab[self.selectedTab])
	--end
end

--[[
设置左右切换装备箭头是否显示
]]
function ZhenFaPanelLayer:setLeftRightArrowButtonsVisible(visible)
	self.btn_left:setVisible(visible)
	self.btn_right:setVisible(visible)
	if visible then
		self:autoCheckLeftRightArrowButtonVisiable()
	end
end

--顶部按钮点击事件
function ZhenFaPanelLayer.tabButtonClickHandle(sender)
	local self = sender.logic
	local item = StrategyCardManager:getStrategyCardByGmid(self.gmId)

	if (sender.tag == 4 and item.level < 60) then
		local openLevel = tonumber(ConstantData:objectByID("DeduceFunctionOpen").value) or 0
		toastMessage(stringUtils.format(localizable.ZheFa_TuiYan_Open, openLevel))
		self.btn_tab[4]:setGrayEnabled(true)
		return
	end

	if (sender.tag == 5 and item.starLevel < 2) then
		toastMessage(stringUtils.format(localizable.ZheFa_ShenYan_Open))
		self.btn_tab[5]:setGrayEnabled(true)
		return
	end

	if self.selectedTabButton then
		local tag = self.selectedTabButton.tag
		self.selectedTabButton:setTextureNormal(tabNormalPaths[tag])
		self.selectedTabButton:setZOrder(1)
	end
	self.selectedTabButton = sender
	self.selectedTab = sender.tag
	self.selectedTabButton:setTextureNormal(tabPressedPaths[sender.tag])
	self.selectedTabButton:setZOrder(2)


	if (sender.tag == 5) then
	    --推演界面
		self.btn_right:setVisible(false)
		self.btn_left:setVisible(false)
	else
		self.btn_right:setVisible(true)
		self.btn_left:setVisible(true)
	end
	--隐藏所有其他tab对应的图层
	for i = 1,#layerDeclear do
		if self.selectedTab ~= i and self.operationLayer[i] then
			self.operationLayer[i]:setVisible(false)
		end
	end

	--显示当前tab对应的图层
	if not self.operationLayer[self.selectedTab] then
		local newLayer = require(layerDeclear[self.selectedTab]):new(self.gmId)
		self.operationLayer[self.selectedTab] = newLayer
		self.panel_content:addChild(newLayer)
		newLayer:onShow()
	else
		self.operationLayer[self.selectedTab]:setVisible(true)
		-- 问过策划注释的 --扬正义 2017.01.11
		-- if self.selectedTab ~= ZhenFaPanelLayer.kTabNumber then
		-- 	self.operationLayer[self.selectedTab]:setEquipGmId(self.gmId)
		-- else
		-- 	self.operationLayer[self.selectedTab]:onShow()
		-- end
		self.operationLayer[self.selectedTab]:setEquipGmId(self.gmId)
		self.operationLayer[self.selectedTab]:onShow()
	end

end

--向左按钮点击，实际上是切换到上一个装备
function ZhenFaPanelLayer.leftButtonClickHandle(sender)
	local self = sender.logic

    local index = StrategyCardManager:getCardIndexByGmid(self.gmId)
    index = index - 1
    
    local info = StrategyCardManager:getCardByIndex(index)
    if info == nil then
        return 
    end

	self.gmId = info.gmId
	self:setEquipGmId(self.gmId)
    self:refreshUI()
end

--向右按钮点击，实际上是切换到下一个装备
function ZhenFaPanelLayer.rightButtonClickHandle(sender)
    local self = sender.logic

    local index = StrategyCardManager:getCardIndexByGmid(self.gmId)
    index = index + 1
    local maxNum = StrategyCardManager:getCardMaxNumber()
    
    local info = StrategyCardManager:getCardByIndex(index)
    if info == nil then
        return 
    end

    self.gmId = info.gmId
    self:setEquipGmId(self.gmId)
    self:refreshUI()
end

function ZhenFaPanelLayer:registerEvents()
	self.super.registerEvents(self)

	--左侧按钮事件监听
	for i = 1,#self.btn_tab do
		self.btn_tab[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.tabButtonClickHandle))
	end

	self.btn_left:addMEListener(TFWIDGET_CLICK, audioClickfun(self.leftButtonClickHandle),1)
	
	self.btn_right:addMEListener(TFWIDGET_CLICK, audioClickfun(self.rightButtonClickHandle),1)

    --[[
	self.EquipmentResultCallBack = function (event)
        self:refreshTabButton()
    end
    TFDirector:addMEGlobalListener(EquipmentManager.EQUIPMENT_REFINING_RESULT,self.EquipmentResultCallBack)
    TFDirector:addMEGlobalListener(BagManager.GEM_BULID_RESULT,self.EquipmentResultCallBack)
    TFDirector:addMEGlobalListener(EquipmentManager.GEM_MOSAIC_RESULT,self.EquipmentResultCallBack)
    TFDirector:addMEGlobalListener(EquipmentManager.GEM_UN_MOSAIC_RESULT,self.EquipmentResultCallBack)
    ]]
    --滑动事件监听，切换装备
    function onTouchBegin(widget,pos,offset)
    	local currentPage = self.operationLayer[self.selectedTab]
    	self.touchInTableView = false
    	self.touchBeginPos = pos
    end

    function onTouchMove(widget,pos,offset)
    end

    function onTouchEnd(widget,pos)
    	if (self.selectedTab == 4) then
    		return
    	end
    	if self.touchInTableView then
    		return
    	end

    	local offsetX = pos.x - self.touchBeginPos.x
    	if offsetX < -80 then
    		--local nextEquip,hasPrev,hasNext = self:getNextEquip(self.gmId)
    		--if nextEquip then
    			--self:setEquipGmId(nextEquip.gmId)
    		--end
            self.rightButtonClickHandle(self.btn_right)
    	elseif offsetX > 80 then
    		--local prevEquip,hasPrev,hasNext = self:getPrevEquip(self.gmId)
    		--if prevEquip then
    			--self:setEquipGmId(prevEquip.gmId)
    		--end
            self.leftButtonClickHandle(self.btn_left)
    	end
    end

    self.panel_touch_event:addMEListener(TFWIDGET_TOUCHBEGAN, onTouchBegin)
    self.panel_touch_event:addMEListener(TFWIDGET_TOUCHMOVED, onTouchMove)
    self.panel_touch_event:addMEListener(TFWIDGET_TOUCHENDED, onTouchEnd)

    --重登录,因为强化装备列表为输入参数，可能已经不可用要重新设定
    self.relogonCallback = function(event)
		self:refreshEquipList()
		self:refreshUI()
   	end
   	TFDirector:addMEGlobalListener(MainPlayer.RE_CONNECT_COMPLETE,self.relogonCallback)
    --[[
   	--装备删除监听
	self.EquipmentDelCallBack = function (event)
		self:refreshEquipList()
    end

    TFDirector:addMEGlobalListener(EquipmentManager.DEL_EQUIP,self.EquipmentDelCallBack)

    --新增物品监听
	self.itemAddCallBack = function (event)
		if event.data[1] == EnumGameItemType.Equipment then
			self:refreshEquipList()
		end
    end
    TFDirector:addMEGlobalListener(BagManager.ItemAdd,self.itemAddCallBack)
    ]]

    if self.generalHead then
        self.generalHead:registerEvents()
    end

    --适配缓存机制，注册所有已经打开过的tab页面的事件
    for i = 1,#layerDeclear do
		if self.operationLayer[i] then
				self.operationLayer[i]:registerEvents()
			-- if self.selectedTab == i then
			-- else
			-- 	self.operationLayer[i]:registerEvents()
			-- end
		end
	end

    self.UpdateStrategyCallBack = function(event)
        self:refreshTabButton()
    end
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.UpdateStrategyCallBack)
end

function ZhenFaPanelLayer:refreshEquipList()
	local equip = StrategyCardManager:getStrategyCardByGmid(self.gmId)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end

    self.equipList = StrategyCardManager:getAllStrategyCard()
end


function ZhenFaPanelLayer:removeEvents()
    --[[
    TFDirector:removeMEGlobalListener(EquipmentManager.EQUIPMENT_REFINING_RESULT,self.EquipmentResultCallBack)
    TFDirector:removeMEGlobalListener(BagManager.GEM_BULID_RESULT,self.EquipmentResultCallBack)
    TFDirector:removeMEGlobalListener(EquipmentManager.GEM_MOSAIC_RESULT,self.EquipmentResultCallBack)
    TFDirector:removeMEGlobalListener(EquipmentManager.GEM_UN_MOSAIC_RESULT,self.EquipmentResultCallBack)
    ]]

    TFDirector:removeMEGlobalListener(EquipmentManager.DEL_EQUIP,self.EquipmentDelCallBack)
    TFDirector:removeMEGlobalListener(BagManager.ItemAdd,self.itemAddCallBack)
    
	for i=1,ZhenFaPanelLayer.kTabNumber do
		self.btn_tab[i]:removeMEListener(TFWIDGET_CLICK)
	end

	self.btn_left:removeMEListener(TFWIDGET_CLICK)
	self.btn_right:removeMEListener(TFWIDGET_CLICK)

	TFDirector:removeMEGlobalListener(MainPlayer.RE_CONNECT_COMPLETE,self.relogonCallback)

    self.super.removeEvents(self)

    if self.generalHead then
        self.generalHead:removeEvents()
    end

    --适配缓存机制，移除所有已经打开过的tab页面的事件
    for i = 1,#layerDeclear do
		if self.operationLayer[i] then
				self.operationLayer[i]:removeEvents()
			-- if self.selectedTab == i then
			-- else
			-- 	self.operationLayer[i]:removeEvents()
			-- end
		end
	end
    TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage,self.UpdateStrategyCallBack)
    self.UpdateStrategyCallBack = nil
	self.firstShow = true
end
function ZhenFaPanelLayer:getTabIndex( index )
	if (index == StrategyCardManager.handDeduce) then
		return 4
	elseif (index == StrategyCardManager.handleShenyan)then
		return 5 
	end
	return index
end
return ZhenFaPanelLayer;
