-- script writer fei
-- creation time 2017-06-03
-- Description: 天书秘要
--　　　　　　　　┏┓　　　┏┓+ +
--　　　　　　　┏┛┻━━━┛┻┓ + +
--　　　　　　　┃　　　　　　　┃ 　
--　　　　　　　┃　　　━　　　┃ ++ + + +
--　　　　　　 ████━████ ┃+
--　　　　　　　┃　　　　　　　┃ +
--　　　　　　　┃　　　┻　　　┃
--　　　　　　　┃　　　　　　　┃ + +
--　　　　　　　┗━┓　　　┏━┛
--　　　　　　　　　┃　　　┃　　　　　　
--　　　　　　　　　┃　　　┃ + + + +
--　　　　　　　　　┃　　　┃　　　　　　
--　　　　　　　　　┃　　　┃ + 　　　　神兽保佑,代码无bug　　
--　　　　　　　　　┃　　　┃
--　　　　　　　　　┃　　　┃　　+　　　　　　　　
--　　　　　　　　　┃　 　　┗━━━┓ + +
--　　　　　　　　　┃ 　　　　　　　┣┓
--　　　　　　　　　┃ 　　　　　　　┏┛
--　　　　　　　　　┗┓┓┏━┳┓┏┛ + + + +
--　　　　　　　　　　┃┫┫　┃┫┫
--　　　　　　　　　　┗┻┛　┗┻┛+ + + +
--

local TianMiYaoLayer = class("TianMiYaoLayer", BaseLayer)
TianMiYaoLayer.tab_path =   {
                                {"ui_new/tianshu/tab_xqh.png", "ui_new/tianshu/tab_xq.png"},
                                {"ui_new/tianshu/tab_sjh.png", "ui_new/tianshu/tab_sj.png"}
                            }
TianMiYaoLayer.tab_path1 =   {
                                {"ui_new/tianshu/tab_sjh.png", "ui_new/tianshu/tab_sj.png"}
                            }
TianMiYaoLayer.layerName =  {
                                "lua.logic.tianshu.InsetMiYaoListLayer",
                                "lua.logic.tianshu.UpMiYaoListLayer"
                            }
function TianMiYaoLayer:ctor(bibleId, booList, selectIndex, showMiYaoId)
    self.super.ctor(self)
    self.bibleId         = bibleId
    self.booList         = booList or TFArray:new()
    self.selectIndex     = selectIndex
    self.showMiYaoId     = showMiYaoId
    self:init("lua.uiconfig_mango_new.tianshu.TianShuMiYaoLayer")
end

function TianMiYaoLayer:initUI(ui)
    self.super.initUI(self,ui)
    --
    self.btn_return        = TFDirector:getChildByPath(ui, "btn_return")
    self.btn_left          = TFDirector:getChildByPath(ui, "btn_left")
    self.btn_right         = TFDirector:getChildByPath(ui, "btn_right")
    self.panel_content     = TFDirector:getChildByPath(ui, "panel_content")
    self.panel_touch_event = TFDirector:getChildByPath(ui, "panel_touch_event")
    self.panel_touch_event:setSwallowTouch(false)
    ---
    self.tab_list = {}
    for i=1, 2 do
        local tab           = TFDirector:getChildByPath(ui, "tab_"..i)
        local img_splats    = TFDirector:getChildByPath(tab, "img_splats_"..i)
        tab.img_splats      = img_splats
        tab.inder           = i
        self.tab_list[i]    = tab
        -- table.insert( self.tab_list, tab )
    end
    self.layerList = {}
    if (self.showMiYaoId) then
        self:selectTab(2)
        if(self.tab_list[1]) then
            self.tab_list[1]:setGrayEnabled(true)
            self.tab_list[1]:setTouchEnabled(false)
        end
    else
        self:selectTab(1)
    end
    -- self:selectTab(1)
    self.firstShow = true
end

function TianMiYaoLayer:onShow()
    self.super.onShow(self)
    if self.firstShow == true then
        self.ui:runAnimation("Action0",1);
        self.firstShow = false
    end
    self:refreshUI()
    for i,v in pairs(self.layerList) do
        v:onShow()
    end
end

function TianMiYaoLayer:refreshUI()
    self.bibleInfo  = SkyBookManager:getItemByInstanceId( self.bibleId ) or nil
    if (self.bibleInfo == nil) then
        return
    end
    self:selectTab(self.currTabInder)
end

--
function TianMiYaoLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_return);
    for i,v in ipairs(self.tab_list) do
        v.logic = self
        v:addMEListener(TFWIDGET_CLICK, audioClickfun(self.selectTabClick))
    end
    self.btn_right.logic     = self
    self.btn_left.logic      = self
    self.btn_right.type = 1
    self.btn_right:addMEListener(TFWIDGET_CLICK, audioClickfun(self.selectTianShuClick))
    self.btn_left:addMEListener(TFWIDGET_CLICK, audioClickfun(self.selectTianShuClick))
    -- 
end
  
--
function TianMiYaoLayer.selectTabClick(sender)
    local self = sender.logic
    self:selectTab(sender.inder)
end

--
function TianMiYaoLayer.selectTianShuClick(sender)
    local self = sender.logic
    if (sender.type == 1) then
        self.selectIndex = self.selectIndex + 1
    else
        self.selectIndex = self.selectIndex - 1
    end
    local item = self.booList:objectAt(self.selectIndex)
    if (item) then
        self.bibleId = item.instanceId
    end
    self:refreshUI()
end

--
function TianMiYaoLayer:selectTab(inder)
    if (self.showMiYaoId) then
        --背包进来
        inder = 2
    end
    local posList = {ccp(-35,0),ccp(-35,-22)}
    for i,v in ipairs(self.tab_list) do
        if (v.inder == inder) then
            self.currTabInder = inder
            v:setTextureNormal(TianMiYaoLayer.tab_path[inder][1])
            v:setTouchEnabled(false)
            if (self.layerList[i] == nil) then
                self.layerList[i] = require(TianMiYaoLayer.layerName[i]):new(self.bibleId)
                self.layerList[i]:setPosition(posList[i])
                self.panel_content:addChild(self.layerList[i])
            end
            self.layerList[i]:setVisible(true)
            self.layerList[i]:setBibleGmId(self.bibleId)
            -- self.layerList[i]:setMiYaoGmId(self.showMiYaoId)
            -- self.layerList[i]:onShow()
        else
            if (self.layerList[i]) then
                self.layerList[i]:setVisible(false)
            end
            v:setTouchEnabled(true)
            v:setTextureNormal(TianMiYaoLayer.tab_path[i][2])
        end
    end
    if (inder == 1) then
        self.btn_left:setVisible(true)
        self.btn_right:setVisible(true)
        if self.selectIndex == 1 then
            self.btn_left:setVisible(false)
        end
        if self.selectIndex == self.booList:length() then
            self.btn_right:setVisible(false)
        end
    else
        self.btn_left:setVisible(false)
        self.btn_right:setVisible(false)
    end
    
end
function TianMiYaoLayer:dispose()
    self.super.dispose(self)
end

function TianMiYaoLayer:removeEvents()
    for i,v in pairs(self.layerList) do
        v:removeEvents()
    end
    self.super.removeEvents(self)
end

function TianMiYaoLayer:removeUI()
    for i,v in pairs(self.layerList) do
        v:removeUI()
    end
    self.super.removeUI(self)
end

function TianMiYaoLayer.onHelpClickHandle(sender)
    CommonManager:showRuleLyaer("tianshucanwu")
end
return TianMiYaoLayer
