--[[
******图鉴层*******

]]

local CulturePet = class("CulturePet", BaseLayer)

function CulturePet:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.operatingactivities.CulturePet")
end

function CulturePet:initUI(ui)
    self.super.initUI(self,ui)

    self.eudemonId 		= EudemonManager:getEudemonByFightId(EnumFightStrategyType.StrategyType_PVE)
    self.eudemonInfo 	= EudemonManager:getEudemonById(self.eudemonId)
    --print("pet",self.eudemonInfo)
    self.txt_attr_base 	= TFDirector:getChildByPath(ui, 'txt_attr_base')
    self.txt_name 		= TFDirector:getChildByPath(ui, 'txt_name')
    self.img_skill_icon = TFDirector:getChildByPath(ui, 'img_skill_icon')
    self.btn_equip 		= TFDirector:getChildByPath(ui, 'btn_equip')
    self.img_pj 		= TFDirector:getChildByPath(ui, 'img_pj')
    self.img_cl 		= TFDirector:getChildByPath(ui, 'img_cl')
    self.img_wzp 		= TFDirector:getChildByPath(ui, 'img_wzp')
    self.img_manji      = TFDirector:getChildByPath(ui, 'img_manji')
    self.btn_node 		= TFDirector:getChildByPath(ui, 'btn_node')
    self.img_xian		= TFDirector:getChildByPath(ui, 'img_xian2')
    self.img_background = TFDirector:getChildByPath(ui, 'img_background')
    self.starList = {}
    for i = 1, 5 do
    	self.starList[i] = TFDirector:getChildByPath(ui, 'img_star_'..i)
    	self.starList[i]:setVisible(false)
    end
    self.costLayer = {}
    for i=1,3 do
    	local btn_tool 		= TFDirector:getChildByPath(ui, "btn_tool"..i)
    	btn_tool.txt_num1 	= TFDirector:getChildByPath(btn_tool, "txt_num1")
    	btn_tool.txt_num2 	= TFDirector:getChildByPath(btn_tool, "txt_num2")
    	btn_tool.img_tool 	= TFDirector:getChildByPath(btn_tool, "img_tool")
    	btn_tool:setVisible(false)
    	btn_tool.index = i
    	btn_tool.logic = self
    	self.costLayer[i] = btn_tool
    end

    if self.eudemonInfo == nil then
   		self.btn_node:setVisible(false)
    	self.img_xian:setVisible(false)
    	self.txt_attr_base:setVisible(false)
    	self.txt_name:setVisible(false)
    	self.img_background:setVisible(false)
    	self.img_pj:setVisible(false)
   		self.img_cl:setVisible(false)
    	self.img_wzp:setVisible(true)
    elseif (self.eudemonInfo:getStarLevel() >= EudemonManager.MAX_STAR_LEVEL and self.eudemonInfo:getQuality() >= EudemonManager.MAX_QUALITY) then
    	-- self.img_pj:setVisible(false)
   		-- self.img_cl:setVisible(false)
   		self.img_wzp:setVisible(false)
        self.img_manji:setVisible(true)
    	self:refreshIcon()
    else
    	self:refreshCailiao()
    	self:refreshIcon()
    end
end

function CulturePet:onShow()
    self.super.onShow(self)
end

function CulturePet:refreshIcon()
	self.img_skill_icon:setTexture(self.eudemonInfo:getIconPath())
	self.btn_equip:setTextureNormal(GetColorIconByQuality_118(self.eudemonInfo:getQuality()))
	self.txt_name:setText(self.eudemonInfo.name)
	self.txt_attr_base:setText(localizable.Tianshu_Main_Attr..AttributeTypeStr[self.eudemonInfo:getFightTypeId()])
	local starLevel = self.eudemonInfo:getStarLevel()
    for i=1,5 do
        local star = self.starList[i]
        if (star) then
            star:setVisible(i <= starLevel)
        end
    end
end

function CulturePet:refreshCailiao()
    local upType = 0
	 if (self.eudemonInfo:getStarLevel() < EudemonManager.MAX_STAR_LEVEL) then
        --该条件下升星
        upType = 1 
        self.img_pj:setTexture("ui_new/operatingactivities/culture/img_xj.png")
    else
        upType = 2
    end
    --材料按钮
    local quality_1   = self.eudemonInfo:getQuality()
    local starLevel_1 = self.eudemonInfo:getStarLevel()
    if (starLevel_1 == EudemonManager.MAX_STAR_LEVEL) then
        starLevel_1   = 0
        quality_1     = quality_1 + 1
    end
    local costData  = EudemonManager:getBattlePetQualityData(quality_1, self.eudemonInfo:getEudemonTypeId(), starLevel_1)
    local str       = costData.star_consumes
    if (upType == 2) then
        str = costData.quality_consumes
    end
    local costList = string.split(str, "|")
    local count = 0
    for i,data in ipairs(costList) do
        if (data and data ~= "") then
            local info          = string.split(data, "_")
            local itemTypeId    = tonumber(info[1])
            local itemId        = tonumber(info[2])
            local itemNum       = tonumber(info[3])
            local btn           = self.costLayer[i]
            if (btn) then
                count = count + 1
                btn:setVisible(true)
                btn.itemId          = itemId
                btn.itemTypeId      = itemTypeId
                btn:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
                local item = ItemData:objectByID(itemId)
                if (item) then
                    btn.img_tool:setTexture(item:GetPath())
                    btn:setTextureNormal(GetColorIconByQuality(item.quality))
                end
                local num = BagManager:getItemNumById( itemId )
                btn.txt_num1:setText(num)
                btn.txt_num2:setText("/"..itemNum)
                if (num >= itemNum) then
                    btn.txt_num1:setColor(ccc3(255,255,255))
                else
                    btn.txt_num1:setColor(ccc3(255,0,0))
                end

            end
        end
    end
    count = count + 1
    for i=count,#self.costLayer do
        local btn           = self.costLayer[i]
        if (btn) then
            btn:setVisible(false)
        end
    end
end

function CulturePet.onShowItemClickHandle(sender)
    local self = sender.logic;
    Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId)
end

function CulturePet:removeUI()
    self.super.removeUI(self)
end

function CulturePet:dispose() 
    self.super.dispose(self)
end

function CulturePet:registerEvents()
    self.super.registerEvents(self)
end

function CulturePet:removeEvents()
    --按钮事件
    self.super.removeEvents(self)
end
return CulturePet