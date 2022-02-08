-- client side TianShuBaoShiLayer.lua
--[[
 * @Description: 天书宝石界面
 ]]
-- script writer wuqi
-- creation time 2016-07-01

local TianShuBaoShiLayer = class("TianShuBaoShiLayer", BaseLayer)

--Tab页个数
TianShuBaoShiLayer.kTabNumber = 2
--默认选中的Tab页索引
TianShuBaoShiLayer.kDefaultTabIndex = 1

--[[
	Tab按钮按下的图片地址
]]
local tabPressedPaths = {
	"ui_new/tianshu/tab_xqh.png",
	"ui_new/tianshu/tab_hch.png",
}

--[[
	Tab按钮未按下的图片地址
]]
local tabNormalPaths = {
	"ui_new/tianshu/tab_xq.png",
    "ui_new/tianshu/tab_hc.png",
}

local layerDeclear = {
	"lua.logic.tianshu.TianShuSetgem",
	"lua.logic.tianshu.TianShuGemMerge2",
}

function TianShuBaoShiLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.tianshu.TianShuBaoShiLayer")
    self.firstShow = true
end

function TianShuBaoShiLayer:loadData(gmId, index)
    self.selectedTab = nil
    self.gmId = gmId
    self.selectIndex = index
end

function TianShuBaoShiLayer:initUI(ui)
	self.super.initUI(self,ui)

    --Tab按钮
    self.btn_tab = {}
    self.btn_splats = {}
	for i=1,TianShuBaoShiLayer.kTabNumber do
		self.btn_tab[i] = TFDirector:getChildByPath(ui, "tab_" .. i)
		self.btn_tab[i].tag = i
		self.btn_tab[i].logic = self

		self.btn_splats[i] = TFDirector:getChildByPath(ui, "img_splats_" .. i)
		self.btn_splats[i].tag = i
	end

	--内容图层
	self.panel_content  = TFDirector:getChildByPath(ui, 'panel_content')
	self.panel_touch_event = TFDirector:getChildByPath(ui, 'panel_touch_event')
	self.panel_touch_event:setVisible(false)
	--设置为事件穿透
	--self.panel_touch_event:setSwallowTouch(false)
	
	--切换界面按钮
	self.btn_left 		= TFDirector:getChildByPath(ui, 'btn_left')
	self.btn_left.logic = self
	self.btn_right 		= TFDirector:getChildByPath(ui, 'btn_right')
	self.btn_right.logic= self

	self.btn_left:setVisible(false)
	self.btn_right:setVisible(false)

	self.operationLayer = {}

    self.btn_return = TFDirector:getChildByPath(ui, "btn_return")
    self.btn_return.logic = self
end

function TianShuBaoShiLayer:setEquipGmId(gmId)
	self.gmId = gmId
	self.operationLayer[self.selectedTab]:setVisible(true)
	if self.selectedTab ~= 2 then
		self.operationLayer[self.selectedTab]:setEquipGmId(gmId)
	end
end

function TianShuBaoShiLayer:onShow()
	self.super.onShow(self)
    self:refreshUI()
    if self.selectedTab and self.operationLayer[self.selectedTab] then
    	self.operationLayer[self.selectedTab]:onShow()
    end
    if self.firstShow == true then
    	self.ui:runAnimation("Action0", 1);
    	self.firstShow = false
    end
end

function TianShuBaoShiLayer:refreshUI()
    self:refreshTabButton()
    self:selectDefaultTab()
end

function TianShuBaoShiLayer:setLogic(logic)
	self.logic = logic
end

--[[
	刷新顶部tab栏的按钮
]]
function TianShuBaoShiLayer:refreshTabButton()
	for i = 1,#self.btn_tab do
		--这里处理每一个按钮
	end

    CommonManager:updateWidgetState(self.btn_tab[1],EquipmentManager.Function_Gem_Mount,SkyBookManager:isHaveMosaicGem(self.gmId), visiable,ccp(-30,10))
	CommonManager:updateWidgetState(self.btn_tab[2],EquipmentManager.Function_Gem_Merge,EquipmentManager:isHaveGemEnough(), visiable,ccp(-30,10))
end

function TianShuBaoShiLayer:removeUI()
	self.super.removeUI(self)
end

--销毁方法
function TianShuBaoShiLayer:dispose()
	for i = 1, #layerDeclear do
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
function TianShuBaoShiLayer:selectDefaultTab()
	if not self.selectedTab then
		self.tabButtonClickHandle(self.btn_tab[TianShuBaoShiLayer.kDefaultTabIndex])
	end
end

function TianShuBaoShiLayer.onReturnClickHandle(sender)
    local self = sender.logic
    AlertManager:close()
end

--顶部按钮点击事件
function TianShuBaoShiLayer.tabButtonClickHandle(sender)
	local self = sender.logic
	if self.selectedTabButton then
		local tag = self.selectedTabButton.tag
		self.selectedTabButton:setTextureNormal(tabNormalPaths[tag])
		self.selectedTabButton:setZOrder(1)
	end
	self.selectedTabButton = sender
	self.selectedTab = sender.tag
	self.selectedTabButton:setTextureNormal(tabPressedPaths[sender.tag])
	self.selectedTabButton:setZOrder(2)

	--隐藏所有其他tab对应的图层
	for i = 1, #layerDeclear do
		if self.selectedTab ~= i and self.operationLayer[i] then
			self.operationLayer[i]:setVisible(false)
			if i == 2 then
				self.operationLayer[i]:stopAutoBuild()
			end
		end
	end

	--显示当前tab对应的图层
	if not self.operationLayer[self.selectedTab] then
		local newLayer = require(layerDeclear[self.selectedTab]):new(self.gmId, self.selectIndex)
		self.operationLayer[self.selectedTab] = newLayer
        newLayer:setPosition(ccp(-30, 0))
		self.panel_content:addChild(newLayer)
		newLayer:onShow()
	else
		self.operationLayer[self.selectedTab]:setVisible(true)
		if self.selectedTab ~= 2 then
			self.operationLayer[self.selectedTab]:setEquipGmId(self.gmId)
		else
			self.operationLayer[self.selectedTab]:onShow()
		end
	end	
    --[[
	if self.selectedTab == 1 and EquipmentManager:isHaveNewGem() then
		EquipmentManager:onIntoGemLayer()
		CommonManager:removeRedPoint(self.btn_tab[1])
	end
    ]]
end

function TianShuBaoShiLayer:registerEvents()
	self.super.registerEvents(self)

	--左侧按钮事件监听
	for i = 1,#self.btn_tab do
		self.btn_tab[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.tabButtonClickHandle))
	end

	self.EquipmentResultCallBack = function (event)
        self:refreshTabButton()
    end
    TFDirector:addMEGlobalListener(BagManager.GEM_BULID_RESULT,self.EquipmentResultCallBack)
    TFDirector:addMEGlobalListener(SkyBookManager.GEM_MOSAIC_RESULT, self.EquipmentResultCallBack)
    TFDirector:addMEGlobalListener(SkyBookManager.GEM_UN_MOSAIC_RESULT,self.EquipmentResultCallBack)

    --重登录,因为强化装备列表为输入参数，可能已经不可用要重新设定
    self.relogonCallback = function(event)
		self:refreshUI()
   	end
   	TFDirector:addMEGlobalListener(MainPlayer.RE_CONNECT_COMPLETE,self.relogonCallback)


    if self.generalHead then
        self.generalHead:registerEvents()
    end

    --适配缓存机制，注册所有已经打开过的tab页面的事件
    for i = 1,#layerDeclear do
		if self.operationLayer[i] then
			self.operationLayer[i]:registerEvents()
		end
	end

    self.btn_return:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onReturnClickHandle))
end

function TianShuBaoShiLayer:removeEvents()
    TFDirector:removeMEGlobalListener(BagManager.GEM_BULID_RESULT,self.EquipmentResultCallBack)
    TFDirector:removeMEGlobalListener(SkyBookManager.GEM_MOSAIC_RESULT,self.EquipmentResultCallBack)
    TFDirector:removeMEGlobalListener(SkyBookManager.GEM_UN_MOSAIC_RESULT,self.EquipmentResultCallBack)

    TFDirector:removeMEGlobalListener(BagManager.ItemAdd,self.itemAddCallBack)
    
	for i=1,TianShuBaoShiLayer.kTabNumber do
		self.btn_tab[i]:removeMEListener(TFWIDGET_CLICK)
	end

	TFDirector:removeMEGlobalListener(MainPlayer.RE_CONNECT_COMPLETE,self.relogonCallback)

    self.super.removeEvents(self)

    --适配缓存机制，移除所有已经打开过的tab页面的事件
    for i = 1,#layerDeclear do
		if self.operationLayer[i] then
			self.operationLayer[i]:removeEvents()
		end
	end

	self.firstShow = true
end

return TianShuBaoShiLayer;
