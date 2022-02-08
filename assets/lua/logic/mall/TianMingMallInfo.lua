--[[
******精魄商城信息处理*******

	-- 2017/11/02
]]

local TianMingMallInfo = class("TianMingMallInfo")

function TianMingMallInfo:ctor()
end

function TianMingMallInfo:initUI(ui,layer)
    self.logic = layer

    self.img_shensuo        = TFDirector:getChildByPath(ui, 'img_shensuo')
    self.panel_list = TFDirector:getChildByPath(ui, 'panel_list')
    self.btnNormalImg = {
        'ui_new/faction/btn_shop_putong1.png'
    }
    self.btnHoldImg = {
        'ui_new/faction/btn_shop_putong2.png'
    }
    self.PageList = {}
end

function TianMingMallInfo:isOpen()
    if FunctionOpenConfigure:getOpenLevel(2233) > MainPlayer:getLevel() then 
        return false
    else
        return true
    end
end

function TianMingMallInfo:show(index)
    self:registerEvents()
    self.panel_list:removeAllChildrenWithCleanup(true)
    self.logic.generalHead.buyButtonEventBound = nil
    self.logic.generalHead:setData(ModuleType.JinPoShop,{HeadResType.JINGPO,HeadResType.SYCEE})
    for k,v in ipairs(self.logic.btnList) do
        if self.btnHoldImg[k] then
            v:setTextureNormal(self.btnNormalImg[k])
            v:setTexturePressed(self.btnHoldImg[k])
            v:setVisible(true)
            --CommonManager:updateRedPoint(v,false)
        else
            v:setVisible(false)
        end
    end
    self.currentLayer = nil
    self.img_shensuo:setTexture('ui_new/shop/sc_shenzi.png')
    self.logic.btnList[1]:setPositionY(513)
    self:refreshButton()
    self:select(index)
end

function TianMingMallInfo:close()
    self:removeEvents()
    self:dispose()
end

function TianMingMallInfo:btnSelect(index)
    self:select(index)
end

function TianMingMallInfo:brushBtnState()
    for k,v in ipairs(self.logic.btnList) do
        if self.btnHoldImg[k] then
            if self.selectedIndex == k then
                v:setTextureNormal(self.btnHoldImg[k])
            else
                v:setTextureNormal(self.btnNormalImg[k])
            end
            
            v:setTexturePressed(self.btnHoldImg[k])
        end
    end
end

function TianMingMallInfo:refreshButton()
    local randomStore = MallManager:getrandomStoreTable()
    if randomStore[RandomStoreType.JINGPO]:isOpen() == false then
        self.logic.btnList[1]:setVisible(false)
    end
    local temp = 0
    local pos_y = self.logic.btnList[1]:getPositionY()
    for k,v in ipairs(self.logic.btnList) do
        if v:isVisible() then
            v:setPositionY( pos_y - (k-1)*110 )
            temp = temp + 1
        end
    end
    self.img_shensuo:setPositionY(pos_y + 22 - temp*110)
end

function TianMingMallInfo:registerEvents()
    print("HeroMallInfo:registerEvents() ........")
end

function TianMingMallInfo:removeEvents()
    print("HeroMallInfo:removeEvents() ........")
end

function TianMingMallInfo:select(index)
    self.selectedIndex = index
    if index then
        self:selectNormalShop(index)
    else
        self.selectedIndex = 1
        self:selectNormalShop(1)
    end
    self:brushBtnState()
end

function TianMingMallInfo:handleClose()
    AlertManager:close(AlertManager.TWEEN_1);
end

function TianMingMallInfo:hideCurrentLayer()
    if self.currentLayer then
        self.currentLayer:setVisible(false)
    end
end

function TianMingMallInfo:showCurrentLayer()
    if self.currentLayer then
        self.currentLayer:setVisible(true)
        self.currentLayer:show()
    end
end

function TianMingMallInfo:selectNormalShop(index)
    self:hideCurrentLayer()
    local typeList = {RandomStoreType.JINGPO}
    if typeList[index] == nil then
        index = 1
    end
    if self.PageList[index] == nil then
        self.PageList[index] = require('lua.logic.mall.NormalShopPage'):new(typeList[index])
        self.panel_list:addChild(self.PageList[index])
    end
    
    self.currentLayer = self.PageList[index]
    self:showCurrentLayer()
end

-----断线重连支持方法
function TianMingMallInfo:onShow()
end

function TianMingMallInfo:dispose()
    for k,v in pairs(self.PageList) do
        v:dispose()
    end
    self.PageList = {}
    self.currentLayer = nil
end

return TianMingMallInfo