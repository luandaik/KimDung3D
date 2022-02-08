--[[
******图鉴层*******

]]

local CultureTianShu = class("CultureTianShu", BaseLayer)

function CultureTianShu:ctor(Page)
    self.RightPage = 1
    print("Page",Page)
    if Page ~= -1 then 
        self.RightPage = Page
    end
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.operatingactivities.CultureTianShu")
end

function CultureTianShu:initUI(ui)
    self.super.initUI(self,ui)

    --信息获取
    self.item = StrategyCardManager:getStrategyCardByGmid(self.gmId)
    self.armylist = ZhengbaManager:getFightList(EnumFightStrategyType.StrategyType_PVE)
    self.roleList = {}
    local count = 1
    local booknum = 0
    for i,Gmid in pairs(self.armylist) do
        if Gmid ~= 0 then
            self.roleList[count] = CardRoleManager:getRoleByGmid(Gmid);
            self.roleList[count].skyBook = self.roleList[count]:getSkyBook()
            --print("book",self.roleList[count].skyBook)
            if self.roleList[count].skyBook then
                booknum = booknum + 1
                count = count + 1
            end
        end
    end
    --右边分页显示
    local panel_2 = TFDirector:getChildByPath(ui, 'panel_2')
    self.btn_role = {}
    for i = 1, 5 do
        self.btn_role[i]    = TFDirector:getChildByPath(panel_2, 'btn_'..i)
        self.btn_role[i].logic = self
        self.btn_role[i].index = i
        self.btn_role[i]:setVisible(i <= booknum)
        self.btn_role[i].img_role       = TFDirector:getChildByPath(self.btn_role[i], 'img_role')
        if self.roleList[i] then
            self.btn_role[i].img_role:setTexture(self.roleList[i]:getIconPath())
        else 
            self.btn_role[i]:setVisible(false)
        end
    end
    --界面初始化
    self.txt_attr_base  = TFDirector:getChildByPath(ui, 'txt_attr_base')
    self.img_wzp            = TFDirector:getChildByPath(ui, 'img_wzp')
    self.img_pj             = TFDirector:getChildByPath(ui, 'img_pj')
    self.img_c              = TFDirector:getChildByPath(ui, 'img_c')
    self.img_cl             = TFDirector:getChildByPath(ui, 'img_cl')
    self.img_cl2            = TFDirector:getChildByPath(ui, 'img_cl2')

    self.starList = {}
    for i = 1, 5 do
        self.starList[i] = TFDirector:getChildByPath(ui, 'img_star_'..i)
        self.starList[i]:setVisible(false)
    end
    --左边的图标
    self.btn_node       = TFDirector:getChildByPath(ui, 'btn_node')
    self.img_skill_icon = TFDirector:getChildByPath(ui, 'img_skill_icon')
    self.btn_equip      = TFDirector:getChildByPath(ui, 'btn_equip')
    self.txt_name       = TFDirector:getChildByPath(ui, 'txt_name')
    self.txt_chong      = TFDirector:getChildByPath(ui, 'txt_chong')
    self.img_background = TFDirector:getChildByPath(ui, 'img_background')
    --材料按钮
    self.costLayer = {}
    for i=1,6 do
        local btn_tool      = TFDirector:getChildByPath(ui, "btn_tool"..i)
        btn_tool.txt_num1   = TFDirector:getChildByPath(btn_tool, "txt_num1")
        btn_tool.txt_num2   = TFDirector:getChildByPath(btn_tool, "txt_num2")
        btn_tool.img_tool   = TFDirector:getChildByPath(btn_tool, "img_tool")
        btn_tool:setVisible(false)
        btn_tool.index = i
        btn_tool.logic = self
        self.costLayer[i] = btn_tool
    end
    --精要框
    self.txt_jy             = TFDirector:getChildByPath(ui, 'txt_jy')
    self.img_jy             = TFDirector:getChildByPath(ui, 'img_jy')
    --满级或者未装配界面
    self.img_manji          = TFDirector:getChildByPath(ui, 'img_manji')
    self.img_manji2         = TFDirector:getChildByPath(ui, 'img_manji2')
    self.img_manji3         = TFDirector:getChildByPath(ui, 'img_manji3')
    self.img_wzp            = TFDirector:getChildByPath(ui, 'img_wzp')
    self.img_fenge          = TFDirector:getChildByPath(ui, 'img_fenge')
    self.img_xian2          = TFDirector:getChildByPath(ui, 'img_xian2')
    self:selectDefaultTab()
end

function CultureTianShu:refreshIcon(index)
    self.img_skill_icon:setTexture(self.roleList[index].skyBook.config:GetHeadPath())
    self.btn_equip:setTextureNormal(GetColorIconByQuality_118(self.roleList[index].skyBook.quality))
    self.txt_name:setText(self.roleList[index].skyBook.config.name)

    local usable = ItemData:objectByID(self.roleList[index].skyBook.id).usable
    usable = string.split(tostring(usable),'0')
    local main_attr = ""
    for i,v in ipairs(usable) do 
        main_attr = main_attr..AttributeTypeStr[tonumber(v)]
        if i ~= #usable then
            main_attr = main_attr..'、'
        end
    end
    self.txt_chong:setText(stringUtils.format(localizable.Tianshu_chong_text,localizable.EnumSkyBookLevelType[self.roleList[index].skyBook.level]))
    self.txt_attr_base:setText(localizable.Tianshu_Main_Attr..main_attr)
    local tupoLevel = self.roleList[index].skyBook:getTupoLevel()

    for i = 1, 5 do
        self.starList[i]:setVisible(false)
    end

    for i = 1, tupoLevel do
        -- self.img_xing[i].xing:setVisible(true)

        local starIdx = i
        local starTextrue = 'ui_new/equipment/tjp_xingxing_icon.png'
        if i > 5 then
            starTextrue = 'ui_new/equipment/tjp_xingxing2_icon.png'
            starIdx = i - 5
        end
        self.starList[starIdx]:setTexture(starTextrue)
        self.starList[starIdx]:setVisible(true)

    end
end

function CultureTianShu:refreshCailiao()
    
    local curPieceNum, curPieceId = SkyBookManager:getBiblePieceNumByQuality(self.roleList[self.selectedTabButton.index].skyBook.quality)
    local needPieceNum, tab_tupofu = SkyBookManager:getTupoNeedPieceNumByInstance(self.roleList[self.selectedTabButton.index].skyBook)
    local template = SkyBookManager:getBiblePieceTemplateByQuality(self.roleList[self.selectedTabButton.index].skyBook.quality)
    local item = ItemData:objectByID(curPieceId)
    --星级
    local maxLevel = BibleBreachData:getMaxTupoLevel(self.roleList[self.selectedTabButton.index].skyBook.quality)
    if self.roleList[self.selectedTabButton.index].skyBook:getTupoLevel() < maxLevel then
        self.img_pj:setVisible(true)
        self.img_cl:setVisible(true)
        self.costLayer[1]:setVisible(true)
        self.costLayer[2]:setVisible(true)
        if (item) then
            self.costLayer[1].img_tool:setTexture(item:GetPath())
            self.costLayer[1]:setTextureNormal(GetColorIconByQuality(item.quality))
            self.costLayer[1].itemId = item.id
            self.costLayer[1].itemTypeId = EnumDropType.GOODS
        end
        local num = BagManager:getItemNumById( curPieceId )
        self.costLayer[1].txt_num1:setText(num)
        self.costLayer[1].txt_num2:setText("/"..needPieceNum)
        if (num >= curPieceNum) then
            self.costLayer[1].txt_num1:setColor(ccc3(255,255,255))
        else
            self.costLayer[1].txt_num1:setColor(ccc3(255,0,0))
        end
        if tab_tupofu and tab_tupofu.num then
            print("11111",tab_tupofu,tab_tupofu.num)
            local item = ItemData:objectByID(tonumber(tab_tupofu.id))
            local curNum = BagManager:getItemNumById(tonumber(tab_tupofu.id))
            local needNum = tab_tupofu.num
            self.costLayer[2]:setTextureNormal(GetColorIconByQuality(item.quality))
            self.costLayer[2].img_tool:setTexture(item:GetPath())
            self.costLayer[2].itemId = item.id
            self.costLayer[2].itemTypeId = EnumDropType.GOODS
            if curNum < needNum then
                self.costLayer[2].txt_num1:setColor(ccc3(255, 0, 0))
            else
                self.costLayer[2].txt_num1:setColor(ccc3(255, 255, 255))
            end
            self.costLayer[2].txt_num1:setText(curNum)
            self.costLayer[2].txt_num2:setText("/" .. needNum)
        else 
            self.costLayer[2]:setVisible(false)
        end
    else 
        self.costLayer[1]:setVisible(false)
        self.costLayer[2]:setVisible(false)
        -- self.img_pj:setVisible(false)
        -- self.img_cl:setVisible(false)
    end
    --重数
    if self.roleList[self.selectedTabButton.index].skyBook.level < BibleData:getMaxLevel(self.roleList[self.selectedTabButton.index].skyBook.id) then
        self.img_c:setVisible(true)
        self.img_cl2:setVisible(true)
        local costCoin = 0
        local costGoodsId = nil
        local costGoodsNum = 0
        local str = self.roleList[self.selectedTabButton.index].skyBook.bibleConfig.comsume
        local tab = string.split(str, ",")
        for i = 1, #tab do
            local tab1 = string.split(tab[i], "_")
            if tonumber(tab1[1]) == EnumDropType.COIN then
                costCoin = costCoin + tonumber(tab1[3])
            elseif tonumber(tab1[1]) == EnumDropType.GOODS then
                costGoodsId = tonumber(tab1[2])
                costGoodsNum = costGoodsNum + tonumber(tab1[3])
            end
        end
        self.costLayer[4]:setVisible(true)
        self.costLayer[4].img_tool:setTexture(GetCoinIcon())
        self.costLayer[4].txt_num2:setText(costCoin)
        self.costLayer[4].txt_num1:setVisible(false)
        if MainPlayer:getCoin() < costCoin then
            self.costLayer[4].txt_num2:setColor(ccc3(255, 0, 0))
        else
            self.costLayer[4].txt_num2:setColor(ccc3(255, 255, 255))
        end
    
        if costGoodsId then
            self.costLayer[5]:setVisible(true)
            local item = ItemData:objectByID(costGoodsId)
            self.costLayer[5]:setTextureNormal(GetColorIconByQuality(item.quality))
            self.costLayer[5].img_tool:setTexture(item:GetPath())
            self.costLayer[5].itemId = costGoodsId
            self.costLayer[5].itemTypeId = EnumDropType.GOODS
            local num = 0
            num = BagManager:getItemNumById(costGoodsId)
            self.costLayer[5].txt_num2:setText("/" .. costGoodsNum)
            self.costLayer[5].txt_num1:setText(num)
            if num < costGoodsNum then
                self.costLayer[5].txt_num1:setColor(ccc3(255, 0, 0))
            else
                self.costLayer[5].txt_num1:setColor(ccc3(255, 255, 255))
            end
        else
            self.costLayer[5]:setVisible(false)
        end
    else
        self.costLayer[4]:setVisible(false)
        self.costLayer[5]:setVisible(false)
        -- self.img_c:setVisible(false)
        -- self.img_cl2:setVisible(false)
    end
    --精要文本
    local stoneTab =  ZhengbaManager:getStoneByType(1,self.roleList[self.selectedTabButton.index])
    if #stoneTab.m_list ~= 0 then
        self.txt_jy:setVisible(true)
        self.img_jy:setVisible(true)
        local strings = ""
        for i,v in pairs(stoneTab.m_list) do
            if i ~= 1 then
                strings = strings..','
            end
            if i%2 == 1 then
                strings = strings..'\n'
            end
            strings = strings..v.name
        end
        self.txt_jy:setText(strings)
    else
        self.txt_jy:setVisible(false)
        self.img_jy:setVisible(false)
    end
    if self.roleList[self.selectedTabButton.index].skyBook:getTupoLevel() >= maxLevel and self.roleList[self.selectedTabButton.index].skyBook.level >= BibleData:getMaxLevel(self.roleList[self.selectedTabButton.index].skyBook.id) then
        --都满级
        -- self.img_pj:setVisible(false)
        -- self.img_cl:setVisible(false)
        -- self.img_c:setVisible(false)
        -- self.img_cl2:setVisible(false)
        self.img_manji:setVisible(false)
        self.img_manji2:setVisible(true)
        self.img_manji3:setVisible(true)
        self.img_wzp:setVisible(false)
    elseif self.roleList[self.selectedTabButton.index].skyBook:getTupoLevel() >= maxLevel then
        --星级满级
        self.img_manji:setVisible(false)
        self.img_manji2:setVisible(false)
        self.img_manji3:setVisible(true)
        self.img_wzp:setVisible(false)
    elseif self.roleList[self.selectedTabButton.index].skyBook.level >= BibleData:getMaxLevel(self.roleList[self.selectedTabButton.index].skyBook.id) then
        --重数满级
        self.img_manji:setVisible(false)
        self.img_manji2:setVisible(true)
        self.img_manji3:setVisible(false)
        self.img_wzp:setVisible(false)
    elseif #self.roleList == 1 and self.roleList[self.selectedTabButton.index].skyBook == nil then
        --未装配
        self.img_manji:setVisible(false)
        self.img_manji2:setVisible(false)
        self.img_manji3:setVisible(false)
        self.img_wzp:setVisible(true)
    else
        --有没满级的
        self.img_manji:setVisible(false)
        self.img_manji2:setVisible(false)
        self.img_manji3:setVisible(false)
        self.img_wzp:setVisible(false)
    end
end

function CultureTianShu.onShowItemClickHandle(sender)
    local self = sender.logic;
    if sender.itemId == nil then
        Public:ShowItemTipLayer(nil, EnumDropType.COIN)
    else
        Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId)
    end
end

function CultureTianShu:onShow()
    self.super.onShow(self)
end

function CultureTianShu:removeUI()
    self.super.removeUI(self)
end

function CultureTianShu:dispose() 
    self.super.dispose(self)
end


function CultureTianShu:registerEvents()
    self.super.registerEvents(self)
end

function CultureTianShu:selectDefaultTab()
    if not self.selectedTab then
        print("right",self.RightPage)
        self.clickRole(self.btn_role[self.RightPage])
    end
end

function CultureTianShu.clickRole(sender)
    local self = sender.logic
    if self.selectedTabButton then
        local index = self.selectedTabButton.index
        self.selectedTabButton:setTextureNormal("ui_new/operatingactivities/culture/tab5.png")
    end
    self.selectedTabButton = sender
    self.selectedTab = sender.index
    TFDirector:dispatchGlobalEventWith(OperationActivitiesManager.SAVE_MYTRAIN_SCENE, {-1,self.selectedTabButton.index})
    sender:setTextureNormal("ui_new/operatingactivities/culture/tab5b.png")
    if self.roleList[1].skyBook ~= nil then
        self.btn_node:setVisible(true)
        self.txt_name:setVisible(true)
        self.txt_attr_base:setVisible(true)
        self.img_background:setVisible(true)
        self.img_xian2:setVisible(true)
        self.img_fenge:setVisible(true)
        self:refreshIcon(sender.index)   
        self:refreshCailiao()
    else
        self.img_pj:setVisible(false)
        self.img_cl:setVisible(false)
        for i,v in pairs(self.costLayer) do 
            v:setVisible(false)
        end
        self.img_c:setVisible(false)
        self.img_cl2:setVisible(false)
        self.btn_node:setVisible(false)
        self.txt_name:setVisible(false)
        self.txt_attr_base:setVisible(false)
        self.img_background:setVisible(false)
        self.txt_jy:setVisible(false)
        self.img_jy:setVisible(false)
        self.img_fenge:setVisible(false)
        self.img_xian2:setVisible(false)
        self.img_wzp:setVisible(true)

    end
end

function CultureTianShu:registerEvents()
    self.super.registerEvents(self)

    for i = 1, 5 do
        self.btn_role[i]:addMEListener(TFWIDGET_CLICK,  self.clickRole);
    end
    for i=1,6 do
        self.costLayer[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShowItemClickHandle), 1)
    end
end

function CultureTianShu:removeEvents()
    --按钮事件
    self.super.removeEvents(self)
end
return CultureTianShu