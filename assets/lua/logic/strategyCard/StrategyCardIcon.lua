-- client side StrategyCardIcon.lua
--[[
 * @Description: 阵法icon
 ]]
-- script writer wuqi
-- creation time 2016-10-15

local StrategyCardIcon = class("StrategyCardIcon", BaseLayer)

function StrategyCardIcon:ctor(gmId)
    self.super.ctor(self, gmId)
    self.gmId = gmId
    self:init("lua.uiconfig_mango_new.smithy.SmithyEquipIcon")
end

function StrategyCardIcon:initUI(ui)
	self.super.initUI(self,ui)

	self.img_quality 	    = TFDirector:getChildByPath(ui, 'img_quality')
	self.img_icon 	        = TFDirector:getChildByPath(ui, 'img_icon')
    self.txt_name           = TFDirector:getChildByPath(ui, 'txt_name')
    self.lbl_power          = TFDirector:getChildByPath(ui, 'lbl_power')
    self.txt_power          = TFDirector:getChildByPath(ui, 'txt_power')
	self.txt_intensify_lv 	= TFDirector:getChildByPath(ui, 'txt_intensify_lv')
    self.img_gem = {}
    self.img_gembg = {}
    for i=1,EquipmentManager.kGemMergeTargetNum do
        self.img_gem[i]            = TFDirector:getChildByPath(ui, 'img_gem'..i)
        self.img_gembg[i]          = TFDirector:getChildByPath(ui, 'img_gembg'..i)
    end
    self.bg                 = TFDirector:getChildByPath(ui, 'bg')

    --提示性控件
    self.img_improve        = TFDirector:getChildByPath(ui, 'img_improve')
    self.img_equiped        = TFDirector:getChildByPath(ui, 'img_equiped')
    self.txt_equiped_name   = TFDirector:getChildByPath(ui, 'txt_equiped_name')
    self.img_improve:setVisible(false)
    
    --星级，目前设定为屏蔽不显示
    self.panel_star         = TFDirector:getChildByPath(ui, 'panel_star')
    --self.panel_star:setVisible(false)
    self.img_star = {}
    for i=1,EquipmentManager.kMaxStarLevel do
        local str           = "img_star_"..i
	   self.img_star[i]     = TFDirector:getChildByPath(ui, str)
    end

    self.bg.logic = self

    --显示空白网格逻辑添加
    self.panel_empty            = TFDirector:getChildByPath(ui, 'panel_empty')
    self.panel_info             = TFDirector:getChildByPath(ui, 'panel_info')

    --选择标识
    self.panel_select = TFDirector:getChildByPath(ui, 'panel_select')
    self.Image_select = TFDirector:getChildByPath(ui, 'Image_select')

    self.img_zhanli = TFDirector:getChildByPath(ui, "img_zhanli")
    self.img_zhanli:setVisible(false)

    self.img_splash = TFDirector:getChildByPath(ui, "img_splash")
    self.img_splash:setVisible(false)
end

function StrategyCardIcon:removeUI()
    self.super.removeUI(self)
end

function StrategyCardIcon:setLogic( layer )
    self.logic = layer
end

function StrategyCardIcon:setEquipGmId( gmId )
    self.gmId = gmId
    self:refreshUI()
end

function StrategyCardIcon:refreshUI()
    if not self.gmId then
        self.panel_empty:setVisible(true)
        self.panel_info:setVisible(false)
        return
    end

    local equip = StrategyCardManager:getStrategyCardByGmid(self.gmId)
    if equip == nil  then
        self.panel_empty:setVisible(true)
        self.panel_info:setVisible(false)
        return
    end

    self.panel_empty:setVisible(false)
    self.panel_info:setVisible(true)

    self.img_icon:setTexture( equip:getPath() )
    self.img_quality:setTexture(GetColorIconByQuality(equip.quality))

    self.txt_name:setText(equip:getName())

    --字符D为图片+
    self.txt_power:setVisible(false)

    self.txt_intensify_lv:setText("+"..equip.level)

    self.txt_equiped_name:setVisible(false)
    if equip.equip and #equip.equip > 0 then 
        self.img_equiped:setVisible(true)
        self.img_equiped:setTexture( "ui_new/zhenfa/img_yzp.png" )
        self.img_equiped:setScaleY(0.8)
    else
        self.img_equiped:setVisible(false)
    end

    local star = equip:getStarLevel()

    local texture1 = "ui_new/equipment/tjp_xingxing_icon.png"
    local texture2 = "ui_new/equipment/tjp_xingxing2_icon.png"
    if star <= 5 then
        for i = 1, 5 do
            if i <= star then
                self.img_star[i]:setTexture(texture1)
                self.img_star[i]:setVisible(true)
            else
                self.img_star[i]:setVisible(false)
            end
        end
    else
        local delta = star - 5
        for i = 1, 5 do
            self.img_star[i]:setVisible(true)
            if i <= delta then
                self.img_star[i]:setTexture(texture2)
            else
                self.img_star[i]:setTexture(texture1)
            end
        end
    end

    for i = 1, EquipmentManager.kGemMergeTargetNum do
        self.img_gembg[i]:setVisible(false)
    end
    self.bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.iconClickHandle))
end

function StrategyCardIcon.iconClickHandle(sender)
	local self = sender.logic

    if self.logic ~= nil then 
	    self.logic:setSelectId(self.gmId)
    end
end

function StrategyCardIcon:registerEvents()
	self.super.registerEvents(self)
end

function StrategyCardIcon:removeEvents()
    self.bg:removeMEListener(TFWIDGET_CLICK)
    self.super.removeEvents(self)
end

function StrategyCardIcon:setDuigouVisiable( enable )
    if enable then
        self.panel_select:setVisible(true)
        self.Image_select:setVisible(true)
    else
        self.panel_select:setVisible(false)
        self.Image_select:setVisible(false)
    end        
end


function StrategyCardIcon:getDuigouVisiable()
    return self.panel_select:isVisible()
end

function StrategyCardIcon:getEquipGmId()
    return self.gmId
end



return StrategyCardIcon
