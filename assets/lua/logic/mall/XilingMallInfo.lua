--[[
******侠客商城信息处理*******

	-- by Chikui Peng
	-- 2016/4/13
]]

local XilingMallInfo = class("XilingMallInfo")

function XilingMallInfo:ctor()
end

function XilingMallInfo:initUI(ui,layer)
    self.logic = layer

    self.img_shensuo        = TFDirector:getChildByPath(ui, 'img_shensuo')
    self.panel_list = TFDirector:getChildByPath(ui, 'panel_list')
    self.btnNormalImg = {
        'ui_new/faction/btn_shop_putong1.png',
        'ui_new/faction/btn_shop_jingpin1.png'
    }
    self.btnHoldImg = {
        'ui_new/faction/btn_shop_putong2.png',
        'ui_new/faction/btn_shop_jingpin2.png'
    }
    self.PageList = {}
end

function XilingMallInfo:isOpen()
    return WestClimbManager:getIsOpen()
end

function XilingMallInfo:show(index)
    self:registerEvents()
    self.panel_list:removeAllChildrenWithCleanup(true)
    self.logic.generalHead.buyButtonEventBound = nil
    self.logic.generalHead:setData(ModuleType.XiLing,{HeadResType.TIANXIANG, HeadResType.TIANJI, HeadResType.SYCEE})
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

function XilingMallInfo:close()
    self:removeEvents()
    self:dispose()
end

function XilingMallInfo:btnSelect(index)
    self:select(index)
end

function XilingMallInfo:brushBtnState()
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

function XilingMallInfo:refreshButton()
    local randomStore = MallManager:getrandomStoreTable()
    if randomStore[RandomStoreType.Xiling1]:isOpen() == false then
        self.logic.btnList[1]:setVisible(false)
    end
    if randomStore[RandomStoreType.Xiling2]:isOpen() == false then
        self.logic.btnList[2]:setVisible(false)
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

function XilingMallInfo:registerEvents()
    print("XilingMallInfo:registerEvents() ........")
end

function XilingMallInfo:removeEvents()
    print("XilingMallInfo:removeEvents() ........")
end

function XilingMallInfo:select(index)
    self.selectedIndex = index
    if index then
        self:selectNormalShop(index)
    else
        self.selectedIndex = 1
        self:selectNormalShop(1)
    end
    self:brushBtnState()
end

function XilingMallInfo:handleClose()
    AlertManager:close(AlertManager.TWEEN_1);
end

function XilingMallInfo:hideCurrentLayer()
    if self.currentLayer then
        self.currentLayer:setVisible(false)
    end
end

function XilingMallInfo:showCurrentLayer()
    if self.currentLayer then
        self.currentLayer:setVisible(true)
        self.currentLayer:show()
    end
end

function XilingMallInfo:selectNormalShop(index)
    self:hideCurrentLayer()
    local typeList = {RandomStoreType.Xiling1,RandomStoreType.Xiling2}
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
function XilingMallInfo:onShow()
end

function XilingMallInfo:dispose()
    for k,v in pairs(self.PageList) do
        v:dispose()
    end
    self.PageList = {}
    self.currentLayer = nil
end

return XilingMallInfo