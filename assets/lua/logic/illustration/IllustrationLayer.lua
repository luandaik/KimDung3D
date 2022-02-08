--[[
******图鉴层*******

]]

local IllustrationLayer = class("IllustrationLayer", BaseLayer)

IllustrationLayer.ROLE      = 0
IllustrationLayer.EQUIPMENT = 1
IllustrationLayer.TIANSHU   = 2
IllustrationLayer.XINFA     = 3
IllustrationLayer.ZHENFA    = 4
IllustrationLayer.TIANMING   = 5
IllustrationLayer.MIYAO     = 6
IllustrationLayer.Pet     = 7
function IllustrationLayer:ctor(defaultIndex)
    self.super.ctor(self)
    self.defaultIndex = defaultIndex
   
    if self.defaultIndex == nil then
        self.defaultIndex = 0
        print("self.defaultIndex is nil")
    end 

    self:init("lua.uiconfig_mango_new.handbook.HandbookMainLayer")
end

function IllustrationLayer:initUI(ui)
    self.super.initUI(self,ui)
    
    self.generalHead = CommonManager:addGeneralHead( self )

    self.generalHead:setData(ModuleType.HandBook,{HeadResType.COIN,HeadResType.SYCEE})


    self.ui             = TFDirector:getChildByPath(ui, 'panel_content')
    self.btn_role       = TFDirector:getChildByPath(ui, 'btn_role')
    self.btn_equipment  = TFDirector:getChildByPath(ui, 'btn_equipment')
    self.btn_tianshu    = TFDirector:getChildByPath(ui, 'btn_tianshu')
    self.btn_xinfa      = TFDirector:getChildByPath(ui, 'btn_xinfa')
    self.btn_zhenfa     = TFDirector:getChildByPath(ui, 'btn_zhenfa')
    self.btn_zhuanji    = TFDirector:getChildByPath(ui, 'btn_xklz')
    self.btn_tianming    = TFDirector:getChildByPath(ui, 'btn_tianming') --战宠按钮改为天命
    self.btn_miyao      = TFDirector:getChildByPath(ui, 'btn_miyao')
    self.btn_zhanchong      = TFDirector:getChildByPath(ui, 'btn_zhanchong')
    self.ScrollView      = TFDirector:getChildByPath(ui, 'panel_gundong')
    self.btn_list = {}
    self.btn_role.btnIndex          = self.ROLE
    self.btn_role.logic             = self
    self.btn_list[self.ROLE + 1]    = self.btn_role
    self.btn_equipment.btnIndex     = self.EQUIPMENT
    self.btn_equipment.logic        = self
    self.btn_list[self.EQUIPMENT + 1] = self.btn_equipment
    self.btn_tianshu.btnIndex       = self.TIANSHU
    self.btn_tianshu.logic          = self
    self.btn_list[self.TIANSHU + 1] = self.btn_tianshu
    self.btn_xinfa.btnIndex         = self.XINFA
    self.btn_xinfa.logic            = self
    self.btn_list[self.XINFA + 1]   = self.btn_xinfa
    self.btn_zhenfa.btnIndex        = self.ZHENFA
    self.btn_zhenfa.logic           = self
    self.btn_list[self.ZHENFA + 1]  = self.btn_zhenfa
    self.btn_tianming.btnIndex       = self.TIANMING
    self.btn_tianming.logic          = self
    self.btn_list[self.TIANMING + 1] = self.btn_tianming
    self.btn_miyao.btnIndex         = self.MIYAO
    self.btn_miyao.logic            = self
    self.btn_list[self.MIYAO + 1]   = self.btn_miyao
    self.btn_zhanchong.btnIndex         = self.Pet
    self.btn_zhanchong.logic            = self
    self.btn_list[self.Pet + 1]   = self.btn_zhanchong
    self.btn_path_u = {
        "ui_new/handbook/tj_xiake11.png",
        "ui_new/handbook/tj_zhuangbei11.png",
        "ui_new/handbook/tj_tianshu11.png",
        "ui_new/handbook/tj_xf11.png",
        "ui_new/handbook/tj_zf1.png",
        "ui_new/handbook/tj_tm11.png",
        "ui_new/handbook/tj_my11.png",
        "ui_new/handbook/tj_zhanchong11.png"
    }
    self.btn_path_d = {
        "ui_new/handbook/tj_xiake1.png",
        "ui_new/handbook/tj_zhuangbei1.png",
        "ui_new/handbook/tj_tianshu1.png",
        "ui_new/handbook/tj_xf1.png",
        "ui_new/handbook/tj_zf11.png",
        "ui_new/handbook/tj_tm1.png",
        "ui_new/handbook/tj_my1.png",
        "ui_new/handbook/tj_zhanchong1.png"  
    }
    -- self:chooseRole()
    self:drawDefault()
    -- local size = self.ScrollView:getSize()
    --local len = #self.btn_path_u
    -- self.ScrollView:setSize(CCSizeMake(167,600))
    -- self.ScrollView:setInnerContainerSize(CCSizeMake(167, 600))
    -- self.ScrollView:setContentOffset(ccp(0,0))
    -- self.ScrollView:setAnchorPoint(ccp(1,1))
    -- self.ScrollView:setPositionY(-467)
end

function IllustrationLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();
    CommonManager:setRedPoint(self.btn_zhuanji, IllustrationManager:checkRedPoint(), "btn_zhuanji",   ccp(0,0))
    self.btn_tianming:setVisible(MainPlayer:getServerSwitchStatue(ServerSwitchType.TianMing))
end

function IllustrationLayer:removeUI()
    self.super.removeUI(self)
end

function IllustrationLayer:dispose()
    if self.RolePage then
        self.RolePage:dispose()
        self.RolePage = nil
    end

    if self.EquipPage then
        self.EquipPage:dispose()
        self.EquipPage = nil
    end
    if self.SkyBookPage then
        self.SkyBookPage:dispose()
        self.SkyBookPage = nil
    end
    if self.XinFaPage then
        self.XinFaPage:dispose()
        self.XinFaPage = nil
    end
    if self.ZhenfaPage then
        self.ZhenfaPage:dispose()
        self.ZhenfaPage = nil
    end 
    if self.EudemonPage then
        self.EudemonPage:dispose()
        self.EudemonPage = nil
    end 
    if self.MiYaoPage then
        self.MiYaoPage:dispose()
        self.MiYaoPage = nil
    end

    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end

    self.super.dispose(self)
end

function IllustrationLayer:registerEvents()
    self.super.registerEvents(self)

    self.btn_role:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle));
    self.btn_equipment:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle));
    self.btn_tianshu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle));
    self.btn_zhenfa:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle));
    self.btn_zhuanji:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnZhuanJiClick));
    self.btn_tianming:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle));
    self.btn_miyao:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle));
    self.btn_xinfa:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle));
    self.btn_zhanchong:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle));
    if self.generalHead then
        self.generalHead:registerEvents()
    end
end

function IllustrationLayer:removeEvents()
    --按钮事件

    print("IllustrationLayer:removeEvents")
    self.super.removeEvents(self)
    if self.generalHead then
        self.generalHead:removeEvents()
    end
end

function IllustrationLayer:hideCurrentLayer()
    if self.currentLayer then
        self.currentLayer:setVisible(false)
    end
end

function IllustrationLayer:showCurrentLayer()
    if self.currentLayer then
        self.currentLayer:setVisible(true)
        self.currentLayer:show()
    end
end


function IllustrationLayer:chooseRoleList()

    self:hideCurrentLayer()
    --创建显示内容图层
    if self.RolePage == nil then
        self.RolePage = require("lua.logic.illustration.IllustrationRoleLayer"):new()
        self.ui:addChild(self.RolePage, 1)
    end
    
    self.currentLayer = self.RolePage
    self:showCurrentLayer()
end

function IllustrationLayer:chooseEquipList()
    self:hideCurrentLayer()
    --创建显示内容图层
    if self.EquipPage == nil then
        self.EquipPage = require("lua.logic.illustration.IllustrationEquipLayer"):new()
        self.ui:addChild(self.EquipPage, 1)
    end
    
    self.currentLayer = self.EquipPage
    self:showCurrentLayer()
end

function IllustrationLayer:chooseSkyBookList()
    self:hideCurrentLayer()
    --创建显示内容图层
    if self.SkyBookPage == nil then
        self.SkyBookPage = require("lua.logic.illustration.IllustrationSkyBookLayer"):new()
        self.ui:addChild(self.SkyBookPage, 1)
    end
    
    self.currentLayer = self.SkyBookPage
    self:showCurrentLayer()
end

function IllustrationLayer:chooseXinFaList()
    self:hideCurrentLayer()
    --创建显示内容图层
    if self.XinFaPage == nil then
        self.XinFaPage = require("lua.logic.illustration.IllustrationXinFaLayer"):new()
        self.ui:addChild(self.XinFaPage, 1)
    end
    
    self.currentLayer = self.XinFaPage
    self:showCurrentLayer()
end


function IllustrationLayer:chooseZhenfaList()
    self:hideCurrentLayer()
    --创建显示内容图层
    if self.ZhenfaPage == nil then
        self.ZhenfaPage = require("lua.logic.illustration.IllustrationZhenfaLayer"):new()
        self.ui:addChild(self.ZhenfaPage, 1)
    end
    
    self.currentLayer = self.ZhenfaPage
    self:showCurrentLayer()
end

function IllustrationLayer:chooseEudemonList()
    self:hideCurrentLayer()
    --创建显示内容图层
    if self.EudemonPage == nil then
        self.EudemonPage = require("lua.logic.illustration.IllustrationEudemonLayer"):new()
        self.ui:addChild(self.EudemonPage, 1)
    end
    
    self.currentLayer = self.EudemonPage
    self:showCurrentLayer()
end

function IllustrationLayer:chooseTianMingList(  )
    self:hideCurrentLayer()
    --创建显示内容图层
    if self.TianMingPage == nil then
        self.TianMingPage = require("lua.logic.illustration.IllustrationTianMingLayer"):new()
        self.ui:addChild(self.TianMingPage, 1)
    end

    self.currentLayer = self.TianMingPage
    self:showCurrentLayer()
end

function IllustrationLayer:chooseMiYaoList()
    self:hideCurrentLayer()
    --创建显示内容图层
    if self.MiYaoPage == nil then
        self.MiYaoPage = require("lua.logic.illustration.IllustrationMiYaoLayer"):new()
        self.ui:addChild(self.MiYaoPage, 1)
    end
    
    self.currentLayer = self.MiYaoPage
    self:showCurrentLayer()
end

function IllustrationLayer:brushBtnState()
    for i,v in ipairs(self.btn_list) do
        local path = self.btn_path_u[i]
        if i == self.defaultIndex + 1 then
            path = self.btn_path_d[i]
        end
        v:setTextureNormal(path)
    end
end

function IllustrationLayer:drawDefault()
    print("IllustrationLayer:drawDefault = ", self.defaultIndex)
    if self.defaultIndex == self.ROLE then
        self:chooseRoleList()
    elseif self.defaultIndex == self.EQUIPMENT then
        self:chooseEquipList()
    elseif self.defaultIndex == self.TIANSHU then
        self:chooseSkyBookList()
    elseif self.defaultIndex == self.ZHENFA then
        self:chooseZhenfaList()
    elseif self.defaultIndex == self.TIANMING then
        self:chooseTianMingList()
    elseif self.defaultIndex == self.MIYAO then
        self:chooseMiYaoList()
    elseif self.defaultIndex == self.XINFA then
        self:chooseXinFaList()
    elseif self.defaultIndex == self.Pet then
        self:chooseEudemonList()
    end
    self:brushBtnState()
end

function IllustrationLayer.BtnClickHandle(sender)
    local self  = sender.logic
    local index = sender.btnIndex

    if self.defaultIndex == index then
        return
    else
        self.defaultIndex = index
        self:drawDefault()
    end
end

function IllustrationLayer.OnZhuanJiClick( sender )
    local layer  = require("lua.logic.illustration.IllustrationZhuanJiLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

return IllustrationLayer