-- client side IllustrationZhuanJiTabsInfoLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-07-05


local IllustrationZhuanJiTabsInfoLayer = class("IllustrationZhuanJiTabsInfoLayer", BaseLayer)
function IllustrationZhuanJiTabsInfoLayer:ctor(equipid)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.handbook.QunXiaTabsInfo")
end

function IllustrationZhuanJiTabsInfoLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.btn_close          = TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_close:setVisible(false)
    self.panel_list         = {}
    for i=1,6 do
        self.panel_list[i]  = TFDirector:getChildByPath(ui, 'img_cellbg' .. i-1)
    end
    self:refreshUI()
end

function IllustrationZhuanJiTabsInfoLayer:registerEvents(ui)
    self.super.registerEvents(self)
    
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function IllustrationZhuanJiTabsInfoLayer:removeEvents()
    self.super.removeEvents(self)

end

function IllustrationZhuanJiTabsInfoLayer:dispose()
    self.super.dispose(self)
end

function IllustrationZhuanJiTabsInfoLayer:removeUI()
end

function IllustrationZhuanJiTabsInfoLayer:onShow()
    self.super.onShow(self)
end

function IllustrationZhuanJiTabsInfoLayer:refreshUI()

end

function IllustrationZhuanJiTabsInfoLayer:setInfo( type )
    self.dataInfo = IllustrationManager:getZhuanJiListByType(type)
    self.dataList = self.dataInfo.dataList
    for i=1,6 do
        local panel = self.panel_list[i]
        if panel == nil then 
            print('panel is nil index = ',i)
        end
        local info = self.dataList[i]
        local starList = {}
        for i=1,5 do
            starList[i] = TFDirector:getChildByPath(panel, 'img_star' .. i)
            if starList[i] then
                starList[i]:setVisible(false)
            end
        end
        for i=1,info.star do
            if starList[i] then
                starList[i]:setVisible(true)
            end
        end
        local txt_jiacheng = TFDirector:getChildByPath(panel, 'txt_jiacheng')
        local itemId = info.id
        local item = ZhuanJiData:objectByID(itemId)
        local attributeTabel = item:getAttribute()
        local attributeIndex = 1
        local attributeNum = 0
        for k,v in pairs(attributeTabel) do
            if v > 0 then
                attributeIndex = k
                attributeNum = v
                break
            end
        end
        txt_jiacheng:setText(localizable.ZhuanJi_txt1 .. AttributeTypeStr[attributeIndex] .. '+' .. attributeNum)
    end
end

function IllustrationZhuanJiTabsInfoLayer.OnXiangQingClick( sender )
    local type = sender.type
end

return IllustrationZhuanJiTabsInfoLayer