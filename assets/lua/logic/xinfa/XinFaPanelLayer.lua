-- client side XinFaPanelLayer.lua
--[[
 * @Description: 宠物背景界面
 ]]
-- script writer fei
-- creation time 2017-03-02

local XinFaPanelLayer = class("XinFaPanelLayer", BaseLayer)

--Tab页个数
XinFaPanelLayer.kTabNumber = 6

--[[
	Tab按钮按下的图片地址
]]
local tabPressedPaths = 
{
	"ui_new/xinfa/tab_xlh.png",
	"ui_new/xinfa/tab_tph.png",
	"ui_new/xinfa/tab_mxh.png",
	"ui_new/xinfa/tab_nlh.png",
	"ui_new/xinfa/tab_xqh.png",
	"ui_new/xinfa/tab_hch.png",
}

--[[
	Tab按钮未按下的图片地址
]]
local tabNormalPaths = 
{
	"ui_new/xinfa/tab_xl.png",
	"ui_new/xinfa/tab_tp.png",
	"ui_new/xinfa/tab_mx.png",
	"ui_new/xinfa/tab_nl.png",
	"ui_new/xinfa/tab_xq.png",
	"ui_new/xinfa/tab_hc.png",
}
--
local layerDeclear = {
	"lua.logic.xinfa.XinFaXiuLianLayer",
	"lua.logic.xinfa.XinFaTupoLayer",
	"lua.logic.xinfa.XinFaMingXinLayer",
	"lua.logic.xinfa.XinFaNingLianLayer",
	"lua.logic.xinfa.XinFaXiangQianLayer",
	"lua.logic.xinfa.XinFaHeCheng",
}

function XinFaPanelLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.xinfa.XinFaPanel")
    self.selectedIndex = XinFaManager.select_type_xiulian
    self.oldTabIndex = 0
end

function XinFaPanelLayer:loadData(gmId, index,type)
    self.selectedIndex 	= index
    self.gmId = gmId
    self.type = type
    if self.type == XinFaManager.BagPanelLayer then 
		self.XinFaList = XinFaManager:getAllUnEquippedXinFa()
	else
	    self.XinFaList = XinFaManager:getAllEquippedXinFa()
	end
end

function XinFaPanelLayer:initUI(ui)
	self.super.initUI(self,ui)
	--通用头部
    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.xinfa, {HeadResType.ZHUXIN,HeadResType.HUIXIN})

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
	self.PanelPositionX = {}
	for i = 1,6 do 
		self.PanelPositionX[i] = self.btn_tab[i]:getPosition().x
	end

	--内容图层
	self.panel_content  	= TFDirector:getChildByPath(ui, 'panel_content')
	self.panel_touch_event 	= TFDirector:getChildByPath(ui, 'panel_touch_event')
	self.panel_touch_event:setVisible(true)
	--设置为事件穿透
	self.panel_touch_event:setSwallowTouch(false)
	
	--切换界面按钮
	self.btn_left 		= TFDirector:getChildByPath(ui, 'btn_left')
	self.btn_left.logic = self
	self.btn_left:setVisible(true)
	self.btn_right 		= TFDirector:getChildByPath(ui, 'btn_right')
	self.btn_right.logic = self
	self.btn_right:setVisible(true)

	self.btn_left:setClickScaleEnabled(true)
	self.btn_right:setClickScaleEnabled(true)

	--层容器
	self.operationLayer = {}
end

function XinFaPanelLayer:onShow()
	self.super.onShow(self)
	if (self.generalHead) then
		self.generalHead:onShow()
	end
	self:selectedTabType(self.selectedIndex, true)

    -- if self.selectedIndex and self.operationLayer[self.selectedIndex] then
    -- 	self.operationLayer[self.selectedIndex]:onShow()
    -- false
    -- 	print("***********XinFaPanelLayer:onShow()************",self.selectedIndex)
    -- end
end
function XinFaPanelLayer:refreshUI()
	local index = self:getXinFaIndexByGmid(self.gmId)
    local maxNum = self:getIdenticalXinFaMAxNum()
    self.btn_left:setVisible(true)
    if index <= 1 then
        self.btn_left:setVisible(false)
    end
    self.btn_right:setVisible(true)
    if index >= maxNum then
        self.btn_right:setVisible(false)
    end
    if self.selectedIndex == XinFaManager.select_type_hecheng then 
    	self.btn_left:setVisible(false)
    	self.btn_right:setVisible(false)
    end

    index = index + 1
    local info = self:getXinFaByIndex(index,true)
    if info ~= nil then
    	if self.selectedIndex == XinFaManager.select_type_ninglian or self.selectedIndex == XinFaManager.select_type_xiangqian or self.selectedIndex == XinFaManager.select_type_mingxin then
			if info.config.quality < 4 then
				self.btn_right:setVisible(false)
			else
				self.btn_right:setVisible(true)
			end
		end
	end
    if XinFaManager:IsNingLianOpen(self.gmId) == false then
		self.btn_tab[XinFaManager.select_type_ninglian]:setVisible(false)
		self.btn_tab[XinFaManager.select_type_xiangqian]:setVisible(false)
		self.btn_tab[XinFaManager.select_type_mingxin]:setVisible(false)
		self.btn_tab[XinFaManager.select_type_hecheng]:setPositionX(self.btn_tab[XinFaManager.select_type_mingxin]:getPosition().x)
	elseif XinFaManager:IsNingLianOpen(self.gmId) == true and XinFaManager:IsMingXinOpen(self.gmId) == false then
		self.btn_tab[XinFaManager.select_type_mingxin]:setVisible(false)
		self.btn_tab[XinFaManager.select_type_ninglian]:setVisible(true)
		self.btn_tab[XinFaManager.select_type_xiangqian]:setVisible(true)
		for i = 4,6 do
			self.btn_tab[i]:setPositionX(self.PanelPositionX[i-1])
		end
	else
		self.btn_tab[XinFaManager.select_type_ninglian]:setVisible(true)
		self.btn_tab[XinFaManager.select_type_xiangqian]:setVisible(true)
		self.btn_tab[XinFaManager.select_type_mingxin]:setVisible(true)
		self.btn_tab[XinFaManager.select_type_hecheng]:setPositionX(self.PanelPositionX[XinFaManager.select_type_hecheng])
		self.btn_tab[XinFaManager.select_type_xiangqian]:setPositionX(self.PanelPositionX[XinFaManager.select_type_xiangqian])
		self.btn_tab[XinFaManager.select_type_ninglian]:setPositionX(self.PanelPositionX[XinFaManager.select_type_ninglian])
	end
end

function XinFaPanelLayer:selectedTabType(selectedIndex, isUpdata)
	self.selectedIndex = selectedIndex
	--还原之前选中的按钮
	self:refreshBtnTab()
	self:refreshUI()

	local layer = self.operationLayer[selectedIndex] 
	if (layer)  then
		layer:setVisible(true)
		layer:setXinFaData(self.gmId)
		layer:onShow()
	else
		local layerName = layerDeclear[selectedIndex]
		if (layerName == nil) then
			print("**ERROR********XinFaPanelLayer:selectedTabType************",selectedIndex)
			return
		end
		local newLayer = require(layerName):new()
		newLayer:setPosition(ccp(newLayer:getPositionX() - 5, newLayer:getPositionY() - 20))
		self.operationLayer[selectedIndex] = newLayer
		self.panel_content:addChild(newLayer)
		newLayer:setXinFaData(self.gmId)
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
function XinFaPanelLayer:refreshBtnTab()
	if (self.oldTabIndex == self.selectedIndex) then
		return
	end
	
	local btn_tab = self.btn_tab[self.selectedIndex]

	if (btn_tab) then
		btn_tab:setTextureNormal(tabPressedPaths[self.selectedIndex])
		btn_tab:setTouchEnabled(false)
	end

	local old_btn_tab = self.btn_tab[self.oldTabIndex]
	if (old_btn_tab) then
		old_btn_tab:setTextureNormal(tabNormalPaths[self.oldTabIndex])
		old_btn_tab:setTouchEnabled(true)
	end

	local XinFaInfo = XinFaManager:getXinFaByGmId(self.gmId)
	if XinFaInfo and XinFaInfo.config.type == 36 then 
		for k,btn in pairs(self.btn_tab) do
			if k < XinFaManager.select_type_hecheng then 
	    		btn:setGrayEnabled(true)
        		btn:setTouchEnabled(false)
        	end
		end
	end
end
function XinFaPanelLayer:removeUI()
	self.btn_left:removeMEListener(TFWIDGET_CLICK)
	self.btn_right:removeMEListener(TFWIDGET_CLICK)
	self.super.removeUI(self)
end

--销毁方法
function XinFaPanelLayer:dispose()
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
function XinFaPanelLayer.tabButtonClickHandle(sender)
	local self = sender.logic
	self:selectedTabType(sender.index)
end

function XinFaPanelLayer:registerEvents()
	self.super.registerEvents(self)
	for k,btn in pairs(self.btn_tab) do
	    btn:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.tabButtonClickHandle),1)
	end
	self.btn_left:addMEListener(TFWIDGET_CLICK, audioClickfun(self.leftButtonClickHandle),1)
	
	self.btn_right:addMEListener(TFWIDGET_CLICK, audioClickfun(self.rightButtonClickHandle),1)
	function onTouchBegin(widget,pos,offset)
		if self.selectedIndex == XinFaManager.select_type_xiangqian then
    		self.touchInTableView = self.operationLayer[self.selectedIndex]:isTouchInTableView(pos)
    		if self.touchInTableView then
    			return
    		end
    	end
		
		self.touchBeginPos = pos
    end

    function onTouchMove(widget,pos,offset)
    end

    function onTouchEnd(widget,pos)
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

    self.ServerSwitchChange = function()
		if MainPlayer:getServerSwitchStatue(ServerSwitchType.XinFaNingLian) == false then
			self.btn_tab[XinFaManager.select_type_ninglian]:setVisible(false)
			self.btn_tab[XinFaManager.select_type_xiangqian]:setVisible(false)
			self.btn_tab[XinFaManager.select_type_mingxin]:setVisible(false)
			self.btn_tab[XinFaManager.select_type_hecheng]:setPositionX(self.btn_tab[XinFaManager.select_type_mingxin]:getPosition().x)
		elseif MainPlayer:getServerSwitchStatue(ServerSwitchType.XinFaNingLian) == true and MainPlayer:getServerSwitchStatue(ServerSwitchType.XinFaMingXin) == false then
			self.btn_tab[XinFaManager.select_type_ninglian]:setVisible(true)
			self.btn_tab[XinFaManager.select_type_xiangqian]:setVisible(true)
			self.btn_tab[XinFaManager.select_type_mingxin]:setVisible(false)
			for i = 4,6 do
				self.btn_tab[i]:setPositionX(self.PanelPositionX[i-1])
			end
		else
			self.btn_tab[XinFaManager.select_type_ninglian]:setVisible(true)
			self.btn_tab[XinFaManager.select_type_xiangqian]:setVisible(true)
			self.btn_tab[XinFaManager.select_type_mingxin]:setVisible(true)
			self.btn_tab[XinFaManager.select_type_hecheng]:setPositionX(self.PanelPositionX[XinFaManager.select_type_hecheng])
			self.btn_tab[XinFaManager.select_type_xiangqian]:setPositionX(self.PanelPositionX[XinFaManager.select_type_xiangqian])
			self.btn_tab[XinFaManager.select_type_ninglian]:setPositionX(self.PanelPositionX[XinFaManager.select_type_ninglian])
		end
    end
  
    TFDirector:addMEGlobalListener(XinFaManager.ServerSwitchChange, self.ServerSwitchChange)
	

    self.deleteUpdata = function()
    	if self.type == XinFaManager.BagPanelLayer then 
			self.XinFaList = XinFaManager:getAllUnEquippedXinFa()
		else
	    	self.XinFaList = XinFaManager:getAllEquippedXinFa()
		end
	end
	TFDirector:addMEGlobalListener(XinFaManager.HEART_METHOD_CHANGE ,self.deleteUpdata)
end
--
--向左按钮点击，实际上是切换到上一个装备
function XinFaPanelLayer.leftButtonClickHandle(sender)
	local self = sender.logic
	
	if self.selectedIndex == XinFaManager.select_type_hecheng then
    	return
    end

    local index = self:getXinFaIndexByGmid(self.gmId)
    index = index - 1
    
    local info = self:getXinFaByIndex(index,false)
    if info == nil then
        return 
    end
    self.gmId = info.instanceId
    self.operationLayer[self.selectedIndex]:setXinFaData(self.gmId)
    self:refreshUI()
end

--向右按钮点击，实际上是切换到下一个装备
function XinFaPanelLayer.rightButtonClickHandle(sender)
    local self = sender.logic

    if self.selectedIndex == XinFaManager.select_type_hecheng then
    	return
    end

    local index = self:getXinFaIndexByGmid(self.gmId)
    index = index + 1
    
    local info = self:getXinFaByIndex(index,true)
    if info == nil then
        return 
    end


    if self.selectedIndex == XinFaManager.select_type_ninglian or self.selectedIndex == XinFaManager.select_type_xiangqian or self.selectedIndex == XinFaManager.select_type_mingxin then
		if info.config.quality < 4 then
			return
		end
	end
    self.gmId = info.instanceId
    self.operationLayer[self.selectedIndex]:setXinFaData(self.gmId)
    self:refreshUI()
end
function XinFaPanelLayer:removeEvents()
	self.super.removeEvents(self)

	TFDirector:removeMEGlobalListener(XinFaManager.ServerSwitchChange, self.ServerSwitchChange)
	self.ServerSwitchChange = nil

	TFDirector:removeMEGlobalListener(XinFaManager.HEART_METHOD_CHANGE ,self.deleteUpdata)
	self.deleteUpdata = nil 
end

function XinFaPanelLayer:getXinFaIndexByGmid(gmId)
	local num = 0
	for info in self.XinFaList:iterator() do
		num = num + 1
		if info.instanceId == gmId then
			return num
		end
	end
	return 0
end

function XinFaPanelLayer:getXinFaByIndex(index,bool)
	local info = nil
	for i = 1 , #self.XinFaList.m_list do 
		if index > #self.XinFaList.m_list then 
			return nil
		end
		info = self.XinFaList:objectAt(index)
		if info and info.config and info.config.type == 35 and info.config.kind == 1 then
			return info
		end 

		if bool == true then  
			index = index + 1
		else
			index = index - 1
		end
	end
	return info
end

function XinFaPanelLayer:getIdenticalXinFaMaxNumById(id)
	local num = 0
	for info in self.XinFaList:iterator() do
		if info.config.id == id then
			num = num + 1
		end
	end
	return num
end

function XinFaPanelLayer:getIdenticalXinFaMAxNum()
	local num = 0
	for info in self.XinFaList:iterator() do
		if info.config.type == 35 then
			num = num + 1
		end
	end
	return num
end

return XinFaPanelLayer;