--[[
******我的培养*******

]]

local MyTrain = class("MyTrain", BaseLayer)

function MyTrain:ctor(leftPage,RightPage)
    self.defaultIndex = 0
    if leftPage ~= -1 then
        self.defaultIndex = leftPage
    end
    self.RightPage = RightPage
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.operatingactivities.Culture")
end

function MyTrain:initUI(ui)
    self.super.initUI(self,ui)
    
    self.panel_content  = TFDirector:getChildByPath(ui, 'panel_content')
    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');
    self.btn_close:setZOrder(50)
    self.openLevel      = {1204,2213,2222,2203}

    self.btn_list = {}
    for i = 1, 4 do 
        local btn = TFDirector:getChildByPath(ui, 'btn_'..i)
        btn.btnIndex = i-1
        btn.logic = self
        self.btn_list[i] = btn

        print(FunctionOpenConfigure:getOpenLevel(self.openLevel[i]),MainPlayer:getLevel())
        self.btn_list[i]:setVisible(FunctionOpenConfigure:getOpenLevel(self.openLevel[i]) <= MainPlayer:getLevel())

    end
    self.btn_path_u = {}
    self.btn_path_d = {}
    for i=1,4 do
        self.btn_path_u[i] = "ui_new/operatingactivities/culture/tab"..i..".png"
        self.btn_path_d[i] = "ui_new/operatingactivities/culture/tab"..i.."b.png"
    end
    self:drawDefault()
end

function MyTrain:onShow()
    self.super.onShow(self)
end

function MyTrain:removeUI()
    self.super.removeUI(self)
end

function MyTrain:hideCurrentLayer()
    if self.currentLayer then
        self.currentLayer:setVisible(false)
    end
end

function MyTrain:showCurrentLayer()
    if self.currentLayer then
        self.currentLayer:setVisible(true)
        self.currentLayer:show()
    end
end

function MyTrain:chooseQiHe()

    self:hideCurrentLayer()
    --创建显示内容图层
    if self.QiHePage == nil then
        self.QiHePage = require("lua.logic.gameactivity.CultureQiHe"):new()
        self.panel_content:addChild(self.QiHePage, 1)
    end
    
    self.currentLayer = self.QiHePage
    self:showCurrentLayer()
end

function MyTrain:choosePet()

    self:hideCurrentLayer()
    --创建显示内容图层
    if self.PetPage == nil then
        self.PetPage = require("lua.logic.gameactivity.CulturePet"):new()
        self.panel_content:addChild(self.PetPage, 1)
    end
    
    self.currentLayer = self.PetPage
    self:showCurrentLayer()
end

function MyTrain:chooseZhenFa()

    self:hideCurrentLayer()
    --创建显示内容图层
    if self.ZhenFaPage == nil then
        self.ZhenFaPage = require("lua.logic.gameactivity.CultureZhenFa"):new()
        self.panel_content:addChild(self.ZhenFaPage, 1)
    end
    
    self.currentLayer = self.ZhenFaPage
    self:showCurrentLayer()
end

function MyTrain:chooseTianShu()

    self:hideCurrentLayer()
    --创建显示内容图层
    if self.TianShuPage == nil then
        self.TianShuPage = require("lua.logic.gameactivity.CultureTianShu"):new(self.RightPage)
        self.panel_content:addChild(self.TianShuPage, 1)
    end
    
    self.currentLayer = self.TianShuPage
    self:showCurrentLayer()
end

function MyTrain:brushBtnState()
    for i,v in ipairs(self.btn_list) do
        local path = self.btn_path_u[i]
        if i == self.defaultIndex + 1 then
            path = self.btn_path_d[i]
        end
        v:setTextureNormal(path)
    end
end

function MyTrain.BtnClickHandle(sender)
    local self  = sender.logic
    local index = sender.btnIndex

    if self.defaultIndex == index then
        return
    else
        self.defaultIndex = index
        self:drawDefault()
    end
end


function MyTrain:drawDefault()
    print("MyTrain:drawDefault = ", self.defaultIndex)
    if self.defaultIndex == 0 then
        self:chooseQiHe()
    elseif self.defaultIndex == 1 then
        self:chooseZhenFa()
    elseif self.defaultIndex == 2 then
        self:choosePet()
    elseif self.defaultIndex == 3 then
        self:chooseTianShu()       
    end
    TFDirector:dispatchGlobalEventWith(OperationActivitiesManager.SAVE_MYTRAIN_SCENE, {self.defaultIndex,-1})
    self:brushBtnState()
end

function MyTrain:dispose()
    if self.QiHePage then
        self.QiHePage:dispose()
        self.QiHePage = nil
    end
    if self.ZhenFaPage then
        self.ZhenFaPage:dispose()
        self.ZhenFaPage = nil
    end
    if self.TianShuPage then
        self.TianShuPage:dispose()
        self.TianShuPage = nil
    end
    if self.PetPage then
        self.PetPage:dispose()
        self.PetPage = nil
    end
    self.super.dispose(self)
end

function MyTrain:registerEvents()
    self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close);

    for i,v in ipairs(self.btn_list) do
        v:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle));
    end
end

function MyTrain:removeEvents()
    --按钮事件
    self.super.removeEvents(self)
end
return MyTrain