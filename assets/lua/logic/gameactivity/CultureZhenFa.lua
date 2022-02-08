--[[
******图鉴层*******

]]

local CultureZhenFa = class("CultureZhenFa", BaseLayer)

function CultureZhenFa:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.operatingactivities.CultureZhenFa")
end

function CultureZhenFa:initUI(ui)
    self.super.initUI(self,ui)

    self.item 			    = StrategyCardManager:getStrategyCardByStrategyType(EnumFightStrategyType.StrategyType_PVE)
    self.btn_node			= TFDirector:getChildByPath(ui, 'btn_node')
    self.btn_equip 			= TFDirector:getChildByPath(ui, 'btn_equip')
    self.img_icon			= TFDirector:getChildByPath(ui, 'img_skill_icon') 
    self.txt_intensify_lv	= TFDirector:getChildByPath(ui, 'txt_intensify_lv')
    self.txt_name 			= TFDirector:getChildByPath(ui, 'txt_name')
    local panel_zhenfa      = TFDirector:getChildByPath(ui, 'panel_zhenfa') 
    self.img_wzp            = TFDirector:getChildByPath(panel_zhenfa, 'img_wzp')
    self.img_manji          = TFDirector:getChildByPath(panel_zhenfa, 'img_manji')
    self.img_pj             = TFDirector:getChildByPath(panel_zhenfa, 'img_pj')
    self.img_cl             = TFDirector:getChildByPath(panel_zhenfa, 'img_cl')
    self.txt_attr_base      = TFDirector:getChildByPath(panel_zhenfa, 'txt_attr_base')
    self.img_background     = TFDirector:getChildByPath(panel_zhenfa, 'img_background')
    self.img_xian2          = TFDirector:getChildByPath(panel_zhenfa, 'img_xian2')
    self.txt_attr_base:setVisible(false)
    self.img_background:setVisible(false)
    self.img_xian2:setVisible(false)
    self.btn_tool = {}
    for i = 1, 2 do
        self.btn_tool[i] = TFDirector:getChildByPath(ui, "btn_tool" .. i)
        self.btn_tool[i]:setVisible(false)
        self.btn_tool[i].img_tool = TFDirector:getChildByPath(self.btn_tool[i], "img_tool")
        self.btn_tool[i].txt_num1 = TFDirector:getChildByPath(self.btn_tool[i], "txt_num1")
        self.btn_tool[i].txt_num2 = TFDirector:getChildByPath(self.btn_tool[i], "txt_num2")
    end
    self.img_star = {}
    for i = 1, 5 do
    	self.img_star[i] = TFDirector:getChildByPath(ui, 'img_star_'..i)
    end  
    if self.item == nil then
    	self.txt_name:setVisible(false)
   		self.btn_node:setVisible(false)
   		for i = 1, 2 do
        	self.btn_tool[i]:setVisible(false)
    	end
    	for i = 1, 5 do
    		self.img_star[i] = TFDirector:getChildByPath(ui, 'img_star_'..i)
    	end
    	self.img_pj:setVisible(false)
    	self.img_cl:setVisible(false)
    	self.img_wzp:setVisible(true)
    elseif self.item:getStarLevel() < StrategyCardManager.kMaxStarLevel then
    	self:refreshTool()
    	self:refreshIcon()
    else
        -- self.img_pj:setVisible(false)
        -- self.img_cl:setVisible(false)
        self.img_wzp:setVisible(false)
        self.img_manji:setVisible(true)
        self:refreshIcon()
    end
end

function CultureZhenFa:onShow()
    self.super.onShow(self)
end

function CultureZhenFa:removeUI()
    self.super.removeUI(self)
end

function CultureZhenFa:refreshTool()
    for i = 1, 2 do
        self.btn_tool[i]:setVisible(false)
    end

    local id = self.item.id
    local starLevel = self.item:getStarLevel()
    local item = BattleArrayStarData:getItemInfo(id, starLevel+1)
    if item == nil then
        print("cannot find the info by star level = ",starLevel+1)
        return
    end
    local temp = string.split(item.consume, "|") or {}
    if self.consumeTab == nil then
        self.consumeTab = TFArray:new()
    else
        self.consumeTab:clear()
    end
    for _,v in pairs(temp) do
        local tab2 = string.split(v, "_")
        local rewardInfo = {}
        rewardInfo.type = tonumber(tab2[1])
        rewardInfo.itemId = tonumber(tab2[2])
        rewardInfo.number = tonumber(tab2[3])
        local _rewardInfo = BaseDataManager:getReward(rewardInfo)
        self.consumeTab:push(_rewardInfo)
    end
    
    for i = 1, 2 do
        self.btn_tool[i]:setVisible(false)
    end

    if self.item:getStarLevel() >= StrategyCardManager.kMaxStarLevel then
        for i = 1, 2 do
            self.btn_tool[i]:setVisible(false)
        end
        return
    end

    local count = 1
    for reward in self.consumeTab:iterator() do
        if count <= 2 then
            self.btn_tool[count]:setVisible(true)
            self.btn_tool[count]:setTextureNormal(GetColorIconByQuality_118(reward.quality))
            function onClick( sender )
              Public:ShowItemTipLayer(reward.itemid, reward.type)
            end
            self.btn_tool[count]:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick))

            self.btn_tool[count].img_tool:setTexture(reward.path)
            Public:addPieceImg(self.btn_tool[count].img_tool, reward)

            local curNum = MainPlayer:getGoodsNum(reward) or 0
            local needNum = reward.number or 0
            self.btn_tool[count].txt_num1:setText(curNum)
            self.btn_tool[count].txt_num2:setText("/" .. needNum)
            self.btn_tool[count].txt_num1:setColor(ccc3(255, 255, 255))
            if curNum < needNum then
                self.btn_tool[count].txt_num1:setColor(ccc3(255, 0, 0))
            end
            count = count + 1
        end
    end
end

function CultureZhenFa:refreshIcon()
    self.btn_equip:setTextureNormal(GetColorIconByQuality_118(self.item:getQuality()))
    self.img_icon:setTexture(self.item:getPath())
    self.txt_intensify_lv:setText("+" .. self.item:getLevel())
    self.txt_name:setText(self.item:getName())
    self.txt_attr_base:setText(BattleArrayData:objectByID(self.item.id).describ)
    self.txt_attr_base:setVisible(true)
    self.img_background:setVisible(true)
    self.img_xian2:setVisible(true)
    --星级(兼容10星)
    local star = self.item:getStarLevel()
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
end

function CultureZhenFa:dispose() 
    self.super.dispose(self)
end

function CultureZhenFa:registerEvents()
    self.super.registerEvents(self)
end

function CultureZhenFa:removeEvents()
    --按钮事件
    self.super.removeEvents(self)
end
return CultureZhenFa