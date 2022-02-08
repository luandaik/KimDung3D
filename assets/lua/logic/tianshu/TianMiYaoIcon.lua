
--              script writer fei
--              creation time time$
--              Description:
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

local TianMiYaoIcon = class("TianMiYaoIcon", BaseLayer)

function TianMiYaoIcon:ctor(type)
    self.super.ctor(self)
    self.type = type
    self:init("lua.uiconfig_mango_new.smithy.SmithySetgemIcon")
end

function TianMiYaoIcon:initUI(ui)
	self.super.initUI(self,ui)

    self.img_bg    = TFDirector:getChildByPath(ui, 'img_bg')
    self.img_quality    = TFDirector:getChildByPath(ui, 'img_quality')
	self.txt_name   	= TFDirector:getChildByPath(ui, 'txt_name')
	self.img_icon 	    = TFDirector:getChildByPath(ui, 'img_icon')
    self.txt_num        = TFDirector:getChildByPath(ui, 'txt_gem_num')
    self.txt_attr       = TFDirector:getChildByPath(ui, 'txt_attr')
    self.txt_attr_val   = TFDirector:getChildByPath(ui, 'txt_num')

    self.img_selected_fg   = TFDirector:getChildByPath(ui, 'img_selected_fg')

    self.img_bg.logic = self

    --显示空白网格逻辑添加
    self.panel_empty            = TFDirector:getChildByPath(ui, 'panel_empty')
    self.panel_info             = TFDirector:getChildByPath(ui, 'panel_info')
    self.img_black = TFDirector:getChildByPath(ui, "img_black")
end

function TianMiYaoIcon:removeUI()
    self.super.removeUI(self)
end

function TianMiYaoIcon:setLogic( layer )
    self.logic = layer
end

function TianMiYaoIcon:setGemid( id, bShowBlack )
    self.id = id
    self.bShowBlack = bShowBlack
    self:refreshUI()
end

function TianMiYaoIcon:refreshUI()
    self.img_black:setVisible(false)
    if not self.id then
        self.panel_empty:setVisible(true)
        self.panel_info:setVisible(false)
        if self.type and self.type == 1 then
            CommonManager:removeRedPoint(self)
        end
        return false
    end

    if self.bShowBlack then
        self.img_black:setVisible(true)
    end

    -- local gem = BagManager:getItemById(self.id)
    local gem = SkyBookManager:getMiYaoById(self.id)
    if gem == nil  then
        print("gem not found : ",self.id)
        self.panel_empty:setVisible(true)
        self.panel_info:setVisible(false)
        if self.type and self.type == 1 then
            CommonManager:removeRedPoint(self)
        end
        return false
    end

    self.panel_empty:setVisible(false)
    self.panel_info:setVisible(true)

    self.txt_name:setText(gem.itemdata.name)
    -- self.txt_num:setText(gem.num)
    self.txt_num:setVisible(false)
    self.img_icon:setTexture(gem.itemdata:GetPath())
    self.img_quality:setTexture(GetColorIconByQuality(gem.itemdata.quality))
    -- local gemAttr = GemData:objectByID(gem.id)

    self.txt_attr_val:setVisible(false)
    self.txt_attr:setText(stringUtils.format(localizable.Tianshu_MiYai_Tips1, numberToChinese(gem.level)))
    self.txt_attr:setPositionX(0)
    self.txt_attr:setAnchorPoint(ccp(0.5, 0))
    if self.logic and self.logic.selectId and self.logic.selectId == self.id then
        self:setSelected(true)
    else
        self:setSelected(false)
    end

    if self.type and self.type == 1 then
        local visiable = EquipmentManager:isGemEnough(self.id)
        CommonManager:updateWidgetState(self,EquipmentManager.Function_Gem_Merge, visiable,ccp(self:getSize().width/2,self:getSize().height/2))
    end
    --self.img_bg:addMEListener(TFWIDGET_CLICK, self.iconClickHandle)

end

--[[
    设置是否显示选中图片
]]
function TianMiYaoIcon:setSelected(selected)
    self.img_selected_fg:setVisible(selected)
end

function TianMiYaoIcon.iconClickHandle(sender)
    print("TianMiYaoIcon.iconClickHandle : ")
	local self = sender.logic
	self.logic:iconBtnClick(self)
end

function TianMiYaoIcon:registerEvents()
    print("TianMiYaoIcon.registerEvents : ")
	self.super.registerEvents(self)

    self.img_bg:addMEListener(TFWIDGET_CLICK, TianMiYaoIcon.iconClickHandle)

    self.itemUpdateCallBack = function (event)
       if event.data[1] ==  self.id then
            local gem = BagManager:getItemById(self.id)
            self.txt_num:setText(gem.num)
        end
    end
    TFDirector:addMEGlobalListener(BagManager.ItemChange,self.itemUpdateCallBack)
end

function TianMiYaoIcon:removeEvents()
    print("TianMiYaoIcon.removeEvents : ")
    TFDirector:removeMEGlobalListener(BagManager.ItemChange,self.itemUpdateCallBack)
    --self.img_bg:removeMEListener(TFWIDGET_CLICK)
    self.super.removeEvents(self)
end

function TianMiYaoIcon:getEffectPosition()
    local _parent = self.img_icon:getParent()
    local position = _parent:convertToWorldSpaceAR(self.img_icon:getPosition())
    return position
end
return TianMiYaoIcon
