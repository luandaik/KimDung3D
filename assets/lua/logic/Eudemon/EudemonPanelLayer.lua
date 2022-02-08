-- client side EudemonPanelLayer.lua
--[[
 * @Description: 宠物背景界面
 ]]
-- script writer fei
-- creation time 2017-03-02

local EudemonPanelLayer = class("EudemonPanelLayer", BaseLayer)

--Tab页个数
EudemonPanelLayer.kTabNumber = 3

--[[
	Tab按钮按下的图片地址
]]
local tabPressedPaths = 
{
	"ui_new/zhenfa/tab_tupoh.png",
	"ui_new/pet/tab_xunhuah.png",
	"ui_new/pet/tab_xunyuh.png",
}

--[[
	Tab按钮未按下的图片地址
]]
local tabNormalPaths = 
{
	"ui_new/zhenfa/tab_tupo.png",
	"ui_new/pet/tab_xunhua.png",
	"ui_new/pet/tab_xunyu.png",
}
local tabPressedPaths1 = 
{
	"ui_new/zhenfa/tab_tupoh.png",
	"ui_new/pet/tab_xunhuah.png",
	"ui_new/pet/tab_xunyuh.png",
}

--[[
	Tab按钮未按下的图片地址
]]
local tabNormalPaths1 = 
{
	"ui_new/zhenfa/tab_tupo.png",
	"ui_new/pet/tab_xunhua.png",
	"ui_new/pet/tab_xunyu.png",
}
--
local layerDeclear = {
	"lua.logic.Eudemon.EudemonTupoLayer",
	"lua.logic.Eudemon.EudemonXunhuaLayer",
	"lua.logic.Eudemon.EudemonXunyuLayer",
}

function EudemonPanelLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.pet.PetPanel")
    self.selectedIndex = EudemonManager.select_type_1
    self.oldTabIndex = 0
end

function EudemonPanelLayer:loadData(eudemonId, index, fightType)
    self.eudemonList 	= EudemonManager:getEudemonList()
    self.selectedIndex 	= index
    self.pageIndex 		= EudemonManager:getEudemonById(eudemonId, true)
    self.eudemonInfo 	= EudemonManager:getEudemonById(eudemonId)
    self.fightType 		= fightType
    print(eudemonId, " -- ",self.pageIndex, "        loadData   ",fightType)
end

function EudemonPanelLayer:initUI(ui)
	self.super.initUI(self,ui)
	--通用头部
    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.Eudemon, {HeadResType.COIN,HeadResType.SYCEE})

    --Tab按钮
    self.btn_tab = {}
	for i = 1, self.kTabNumber do
		local btn_tab = TFDirector:getChildByPath(ui, "tab_" .. i)
		if (btn_tab) then
			btn_tab.index 		= i
			btn_tab.logic 		= self
			btn_tab.redPoint 	= TFDirector:getChildByPath(btn_tab, "img_splats_" .. i)
			self.btn_tab[i] = btn_tab
		end
	end

	--内容图层
	self.panel_content  	= TFDirector:getChildByPath(ui, 'panel_content')
	self.panel_touch_event 	= TFDirector:getChildByPath(ui, 'panel_touch_event')
	self.panel_touch_event:setVisible(true)
	--设置为事件穿透
	self.panel_touch_event:setSwallowTouch(false)
	
	--切换界面按钮
	self.btn_left 		= TFDirector:getChildByPath(ui, 'btn_left')
	self.btn_right 		= TFDirector:getChildByPath(ui, 'btn_right')
	--层容器
	self.operationLayer = {}
end

function EudemonPanelLayer:onShow()
	self.super.onShow(self)
	if (self.generalHead) then
		self.generalHead:onShow()
	end
	self:selectedTabType(self.selectedIndex, true)

    -- if self.selectedIndex and self.operationLayer[self.selectedIndex] then
    -- 	self.operationLayer[self.selectedIndex]:onShow()
    -- false
    -- 	print("***********EudemonPanelLayer:onShow()************",self.selectedIndex)
    -- end
end

function EudemonPanelLayer:selectedTabType(selectedIndex, isUpdata)
	self.selectedIndex = selectedIndex
	--还原之前选中的按钮
	
	self:refreshBtnTab()
	if (self.eudemonInfo == nil) then
		print("**ERROR*********EudemonPanelLayer:selectedTabType***************")
		return
	end
	if self.btn_tab[EudemonManager.select_type_2] then
		if EudemonManager:isOpenXunhua() == false then 
			self.btn_tab[EudemonManager.select_type_2]:setVisible(false)
		else 
			self.btn_tab[EudemonManager.select_type_2]:setVisible(true)
		end
	end
	if self.btn_tab[EudemonManager.select_type_3] then
		if EudemonManager:isOpenXunYu() == false then 
			self.btn_tab[EudemonManager.select_type_3]:setVisible(false)
		else 
			self.btn_tab[EudemonManager.select_type_3]:setVisible(true)
		end
	end
	self:refreshLeftRightBtn()
	--
	local layer = self.operationLayer[selectedIndex]
	print(selectedIndex,layer)
	if (layer) then
		layer:setVisible(true)
		layer:setEudemonData(self.eudemonInfo:getId(), self.fightType)
		layer:onShow()
	else
		local layerName = layerDeclear[selectedIndex]
		if (layerName == nil) then
			print("**ERROR********EudemonPanelLayer:selectedTabType************",selectedIndex)
			return
		end
		local newLayer = require(layerName):new()
		newLayer:setPosition(ccp(newLayer:getPositionX() - 5, newLayer:getPositionY() - 20))
		self.operationLayer[selectedIndex] = newLayer
		self.panel_content:addChild(newLayer)
		newLayer:setEudemonData(self.eudemonInfo:getId(), self.fightType)
		newLayer:onShow()
	end
	--
	if (self.oldTabIndex == self.selectedIndex) then
		return
	end
	--if (self.oldTabIndex ~= 0 and self.oldTabIndex ~= self.selectedIndex) then
		local oldLayer = self.operationLayer[self.oldTabIndex]
		if (oldLayer) then
			oldLayer:setVisible(false)
		end
	--end
	self.oldTabIndex = self.selectedIndex
end
--
function EudemonPanelLayer:refreshLeftRightBtn()
    local pageCount = self.eudemonList:length()
    local pageIndex =  self.pageIndex
    if (pageCount > 1) then
        self.btn_left:setVisible(pageIndex > 1)
        self.btn_right:setVisible(pageIndex < pageCount)
    else
        self.btn_left:setVisible(false)
        self.btn_right:setVisible(false)
    end
end
function EudemonPanelLayer:refreshBtnTab()
	if (self.oldTabIndex == self.selectedIndex) then
		return
	end
	
	local btn_tab = self.btn_tab[self.selectedIndex]

	local starLevel = self.eudemonInfo:getStarLevel()
	if (btn_tab) then
		if (starLevel == 5) then
			btn_tab:setTextureNormal(tabPressedPaths1[self.selectedIndex])
		else
			btn_tab:setTextureNormal(tabPressedPaths[self.selectedIndex])
		end
		btn_tab:setTouchEnabled(false)
	end

	local old_btn_tab = self.btn_tab[self.oldTabIndex]
	if (old_btn_tab) then
		if (starLevel == 5) then
			old_btn_tab:setTextureNormal(tabNormalPaths1[self.oldTabIndex])
		else
			old_btn_tab:setTextureNormal(tabNormalPaths[self.oldTabIndex])
		end
		old_btn_tab:setTouchEnabled(true)
	end
end
function EudemonPanelLayer:removeUI()
	self.super.removeUI(self)
end

--销毁方法
function EudemonPanelLayer:dispose()
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

--顶部按钮点击事件
function EudemonPanelLayer.tabButtonClickHandle(sender)
	local self = sender.logic

	self:selectedTabType(sender.index)
end

--
function EudemonPanelLayer.moveButtonClickHandle(sender)
	local self = sender.logic
	local eudemonId = self.eudemonId
	if (sender.isRight) then

	else

	end
	local layer = self.operationLayer[self.selectedIndex]
	if (layer == nil) then
		print("**********EudemonPanelLayer.moveButtonClickHandle************",self.selectedIndex)
		return
	end
	layer:refreshUI()
end


function EudemonPanelLayer:registerEvents()
	self.super.registerEvents(self)
	for k,btn in pairs(self.btn_tab) do
	    btn:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.tabButtonClickHandle),1)
	end
	self.btn_left.logic 	= self
	self.btn_right.logic 	= self
	self.btn_right.isRight 	= true
	self.btn_left:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onMoveClickHandle),1)
	self.btn_right:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onMoveClickHandle),1)
	self.receiveInfo1 = function(event)
    	self:refreshBtnTab()
    end
    TFDirector:addMEGlobalListener(EudemonManager.upStarTupo, self.receiveInfo1)
	if self.generalHead then
        self.generalHead:registerEvents()
    end

end
function EudemonPanelLayer.onMoveClickHandle(sender)
    local self = sender.logic;
    local pageIndex = self.pageIndex
    if (pageIndex <= 0 or pageIndex > self.eudemonList:length()) then
        print("**ERROR**************EudemonMainLayer:addPage*********************",pageIndex)
        return
    end
    if (sender.isRight) then
        if (pageIndex < self.eudemonList:length()) then
        	self.pageIndex = self.pageIndex + 1
        	local eudemonId = self.eudemonList:objectAt(self.pageIndex):getId()
        	self:loadData(eudemonId, self.selectedIndex, self.fightType)
        end
    else
        if (pageIndex > 1) then
        	self.pageIndex = self.pageIndex - 1
        	local eudemonId = self.eudemonList:objectAt(self.pageIndex):getId()
        	self:loadData(eudemonId, self.selectedIndex, self.fightType)
        end
    end
    --
    self:refreshLeftRightBtn()
    self:refreshBtnTab()
    if self.selectedIndex and self.operationLayer[self.selectedIndex] then
    	self.operationLayer[self.selectedIndex]:setEudemonData(self.eudemonInfo:getId(), self.fightType)
    	self.operationLayer[self.selectedIndex]:onShow()
	end
end
function EudemonPanelLayer:removeEvents()
	self.super.removeEvents(self)
	TFDirector:removeMEGlobalListener(EudemonManager.upStarTupo, self.receiveInfo1)
    self.receiveInfo1 = nil
 	if self.selectedIndex and self.operationLayer[self.selectedIndex] then
    	self.operationLayer[self.selectedIndex]:removeEvents()
	end
	if self.generalHead then
        self.generalHead:removeEvents()
    end
end

return EudemonPanelLayer;