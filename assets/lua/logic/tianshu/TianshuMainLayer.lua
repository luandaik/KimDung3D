--[[
    天书主界面
]]
local TianshuMainLayer = class("TianshuMainLayer", BaseLayer)

TianshuMainLayer.kMaxEssentialNum = 9
TianshuMainLayer.kMaxAttrNum = 11
TianshuMainLayer.EnumJingyaoStatus = 
{
    --未装备且精要以及碎片都不够
    STATUS_NOT_ENOUGH = 1,
    --未装备且精要不够但精要碎片够
    STATUS_PIECE_ENOUGH = 2,
    --未装备且精要够
    STATUS_JINGYAO_ENOUGH = 3,
    --已融入
    STATUS_EQUIPPED = 4
}

TianshuMainLayer.TAG_EQUIPPED = 1
TianshuMainLayer.TAG_UNEQUIPPED = 2

TianshuMainLayer.kMinHoleNum = 3
TianshuMainLayer.kMaxHoleNum = 9
TianshuMainLayer.TEXT_TUPO_MAX = localizable.Tianshu_chongzhi_tips8

function TianshuMainLayer:ctor()
    --测试添加天书残页
    --BagManager:testAddBookPiece()
    --测试添加精要
    --BagManager:testAddEssential()

    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.tianshu.TianShuMain")
end

function TianshuMainLayer:loadData(instanceId)
    self.instanceId = instanceId   
    self:refreshUI()
end

function TianshuMainLayer:setTag(tag)
    self.book_type = tag
end

local function sortByQualityAndPower(book1, book2)
    if book1.quality > book2.quality then
        return true
    elseif book1.quality == book2.quality then
        if book1:getpower() > book2:getpower() then
            return true
        end
    end

    return false
end

function TianshuMainLayer:getBookList()
    local arr = nil
    if self.book_type == self.TAG_EQUIPPED then
        arr = SkyBookManager:getEquippedBookList()
    else
        arr = SkyBookManager:getAllUnEquippedBook()
    end
    arr:sort(sortByQualityAndPower)
    return arr
end

function TianshuMainLayer:initUI(ui)
	self.super.initUI(self, ui)    
	--通用头部   
    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.TianShu, {HeadResType.YUELI, HeadResType.COIN, HeadResType.SYCEE})

    self.img_tianshu = TFDirector:getChildByPath(ui, "img_tianshu")

    self.panel_tianshu_list = {}
    for i = self.kMinHoleNum, self.kMaxHoleNum do
        self.panel_tianshu_list[i] = TFDirector:getChildByPath(ui, "panel_kong" .. i)
        self.panel_tianshu_list[i]:setVisible(false)
    end

    --天书名字
    self.txt_name = TFDirector:getChildByPath(ui, "txt_name")
    --天书重数
    self.txt_chong = TFDirector:getChildByPath(ui, "txt_chong")
    self.img_fazhen = TFDirector:getChildByPath(ui, "img_fazhen")
    --星星(突破重数)
    self.img_xing = {}
    for i = 1, 5 do
        local temp = TFDirector:getChildByPath(ui, "img_xing" .. i .. "_2")
        self.img_xing[i] = TFDirector:getChildByPath(ui, "img_xing" .. i .. "_1")
        self.img_xing[i].xing = temp
    end

    --精要
    --[[
    self.panel_jy = {}
    for i = 1, self.kMaxEssentialNum do
        self.panel_jy[i] = TFDirector:getChildByPath(ui, "panel_jy" .. i)
        self.panel_jy[i].img_quality = TFDirector:getChildByPath(self.panel_jy[i], "img_quality")
        self.panel_jy[i].img_jy = TFDirector:getChildByPath(self.panel_jy[i], "img_jy")
        self.panel_jy[i].img_jy:setScale(1.5)
        self.panel_jy[i].img_add = TFDirector:getChildByPath(self.panel_jy[i], "img_add")
    end
    ]]
    --天书残页
    self.panel_canye = TFDirector:getChildByPath(ui, "panel_book")
    --残页品质图片
    self.img_quality = TFDirector:getChildByPath(self.panel_canye, "img_quality")
    self.img_quality.logic = self


    --残页图片
    self.img_equip = TFDirector:getChildByPath(self.panel_canye, "img_equip")

    --残页进度条和数量
    local txt_soul = TFDirector:getChildByPath(ui, "txt_soul")
    self.txt_soul = txt_soul
    self.txt_soul_num = TFDirector:getChildByPath(txt_soul, "txt_soul_num")
    self.bar_soul = TFDirector:getChildByPath(ui, "bar_soul")
    --突破按钮
    self.btn_tupo = TFDirector:getChildByPath(ui, "btn_tupo")
    self.btn_tupo.logic = self

    --属性
    self.panel_jiacheng = TFDirector:getChildByPath(ui, "panel_jiacheng")
    local childrenArr = self.panel_jiacheng:getChildren()
    self.img_attr = {}
    self.img_attr_count = 1
    for i = 0, childrenArr:count()-1 do
        local child = TFDirector:getChildByPath(self.panel_jiacheng, "img_attr" .. self.img_attr_count)
        if (child) then
            child:setVisible(false)
            self.img_attr[self.img_attr_count] = child
            self.img_attr[self.img_attr_count].txt_name = TFDirector:getChildByPath(child, "txt_name")
            self.img_attr[self.img_attr_count].txt_base = TFDirector:getChildByPath(child, "txt_base")
            self.img_attr_count = self.img_attr_count + 1    
        end
    end
    self.panel_jiacheng:setInnerContainerSize(CCSizeMake(self.panel_jiacheng:getSize().width, 250))
    self.panel_jiacheng:setContentOffset(ccp(0,-78))
    self.panel_jiacheng:setTouchEnabled(false)
    --精要按钮
    self.btn_jingyao = TFDirector:getChildByPath(ui, "btn_jingyao")
    self.btn_jingyao.logic = self
    --升重按钮
    self.btn_shengchong = TFDirector:getChildByPath(ui, "btn_shengchong")
    self.btn_shengchong.logic = self
    --注解按钮
    self.btn_zhujie = TFDirector:getChildByPath(ui, "btn_zhujie")
    self.btn_zhujie.logic = self
    --秘要按钮
    self.btn_myk = TFDirector:getChildByPath(ui, "btn_myk")
    self.btn_myk.logic = self

    --升重消耗
    --[[
    self.img_newprice = {}
    for i = 1, 2 do
        self.img_newprice[i] = TFDirector:getChildByPath(self.btn_shengchong, "img_newprice" .. i)
        self.img_newprice[i].txt_price = TFDirector:getChildByPath(self.img_newprice[i], "txt_price")
        self.img_newprice[i]:setVisible(false)
    end 
    ]] 

    --升重所需材料panel
    self.panel_shengchong_need = TFDirector:getChildByPath(ui, "img_qdi")
    self.panel_book1 = TFDirector:getChildByPath(self.panel_shengchong_need, "panel_book1")
    self.txt_suoxu = TFDirector:getChildByPath(self.panel_shengchong_need, "txt_suoxu2")
    self.panel_book1.img_quality = TFDirector:getChildByPath(self.panel_book1, "img_quality")
    self.panel_book1.img_quality.logic = self

    self.panel_book1.img_equip = TFDirector:getChildByPath(self.panel_book1, "img_equip")
    self.panel_book1.txt_num = TFDirector:getChildByPath(self.panel_book1, "txt_num")
    self.panel_book2 = TFDirector:getChildByPath(self.panel_shengchong_need, "panel_book2")
    self.panel_book2.img_quality = TFDirector:getChildByPath(self.panel_book2, "img_quality")
    self.panel_book2.img_quality.logic = self
    self.panel_book2.txt_num1 = TFDirector:getChildByPath(self.panel_book2, "txt_num1")

    self.panel_book2.img_equip = TFDirector:getChildByPath(self.panel_book2, "img_equip")
    self.panel_book2.txt_num = TFDirector:getChildByPath(self.panel_book2, "txt_num")

    --重置按钮
    self.btn_chongzhi = TFDirector:getChildByPath(ui, "btn_chongzhi")
    self.btn_chongzhi.logic = self

    --分解按钮
    self.btn_fenjie = TFDirector:getChildByPath(ui, "btn_fenjie")
    self.btn_fenjie.logic = self
    -- self.btn_fenjie:setVisible(true)
    -- self.btn_fenjie:setTextureNormal("ui_new/tianshu/btn_sfenjie.png")
    --帮助按钮
    self.btn_help = TFDirector:getChildByPath(ui, "btn_bangzu")
    self.btn_help.logic = self

    self.img_diwen1 = TFDirector:getChildByPath(ui, "img_diwen1")
    self.img_diwen2 = TFDirector:getChildByPath(ui, "img_diwen2")

    --左右按钮
    self.btn_pageleft = TFDirector:getChildByPath(ui, "btn_pageleft")
    self.btn_pageright = TFDirector:getChildByPath(ui, "btn_pageright")
    self.btn_pageleft.logic = self
    self.btn_pageright.logic = self

    self.img_equiped = TFDirector:getChildByPath(ui, "img_equiped")
    self.txt_equiped_name = TFDirector:getChildByPath(self.img_equiped, "txt_equiped_name")

    --一键镶嵌
    self.btn_yjxq = TFDirector:getChildByPath(ui, "btn_yjxq")
    self.btn_yjxq.logic =self

    --置换
    self.btn_zhihuan = TFDirector:getChildByPath(ui, "btn_zhihuan")
    self.btn_zhihuan.logic =self
    self.btn_zhihuan:setVisible(false)
    --宝石孔1
    self.btn_bsk = TFDirector:getChildByPath(self.img_fazhen, "btn_bsk")
    self.btn_bsk:setVisible(true)
    self.btn_bsk.logic = self

    self.btn_bsk.img_baoshi = TFDirector:getChildByPath(self.btn_bsk, "img_baoshi")
    self.btn_bsk.img_kxq = TFDirector:getChildByPath(self.btn_bsk, "img_kxq")
    self.btn_bsk.img_suo = TFDirector:getChildByPath(self.btn_bsk, "img_suo")

    --宝石孔2
    self.btn_bsk2 = TFDirector:getChildByPath(self.img_fazhen, "btn_bsk2")
    self.btn_bsk2:setVisible(true)
    self.btn_bsk2.logic = self
  
    self.btn_myk.img_baoshi = TFDirector:getChildByPath(self.btn_myk, "img_baoshi")
    self.btn_myk.img_kxq = TFDirector:getChildByPath(self.btn_myk, "img_kxq")
    self.btn_myk.img_suo = TFDirector:getChildByPath(self.btn_myk, "img_suo")

    self.btn_bsk2.img_baoshi = TFDirector:getChildByPath(self.btn_bsk2, "img_baoshi")
    self.btn_bsk2.img_kxq = TFDirector:getChildByPath(self.btn_bsk2, "img_kxq")
    self.btn_bsk2.img_suo = TFDirector:getChildByPath(self.btn_bsk2, "img_suo")

    self.btn_chongzhu   = TFDirector:getChildByPath(ui, "btn_yanxiu")
    self.btn_canWu      = TFDirector:getChildByPath(ui, "btn_canwu")

    self.img_neiquan    = TFDirector:getChildByPath(ui, "img_neiquan")
    self.img_neiquan2    = TFDirector:getChildByPath(ui, "img_neiquan2")
    self.img_neiquan:setVisible(false)
    self.img_neiquan2:setVisible(false)
    --
    self.btn_zhujie:setVisible(false)

end

function TianshuMainLayer:onShow()
	self.super.onShow(self)
	self.generalHead:onShow()
    self:refreshUI()
end

function TianshuMainLayer:refreshUI()
    self.item = SkyBookManager:getItemByInstanceId(self.instanceId)

    local quality = self.item.quality
    if quality >= 4 then
        self.btn_zhihuan:setVisible(true)
    else
        self.btn_zhihuan:setVisible(false)
    end
    
    local openLevel = FunctionOpenConfigure:getOpenLevel(2218)
    local currLevel = MainPlayer:getLevel()
    if currLevel < openLevel then
        self.btn_canWu:setVisible(false)
    else
        self.btn_canWu:setVisible(quality >= SkyBookManager.CanWuOpenQuality)
    end
    --
    self.selectIndex = self:getBookList():indexOf(self.item)
    self.btn_pageright:setVisible(true)
    self.btn_pageleft:setVisible(true)

    self.btn_tupo:setGrayEnabled(false)
    self.btn_tupo:setTouchEnabled(true)
    self:addTupoEffect(self.btn_tupo, false)

    self.btn_shengchong:setGrayEnabled(false)
    self.btn_shengchong:setTouchEnabled(true)

    local equipId = self.item.equip
    if equipId and equipId ~= 0 then
        self.img_equiped:setVisible(true)
        self.txt_equiped_name:setVisible(true)
        local role = CardRoleManager:getRoleById(equipId)
        self.txt_equiped_name:setText(role.name)
        self.btn_fenjie:setVisible(false)
    else
        self.img_equiped:setVisible(false)
        self.txt_equiped_name:setVisible(false)
    end

    self.txt_soul:setText(localizable.Tianshu_chongzhi_tips9)

    
    if self.selectIndex == 1 then
        self.btn_pageleft:setVisible(false)
    end

    if self.selectIndex == self:getBookList():length() then
        self.btn_pageright:setVisible(false)
    end

    self:refreshJingyaoStatus()

    self.txt_soul:setVisible(true)
    self.txt_soul_num:setVisible(true)

    self.panel_book1:setVisible(true)
    self.panel_book2:setVisible(true)

    for i = self.kMinHoleNum, self.kMaxHoleNum do
        self.panel_tianshu_list[i]:setVisible(false)
    end

    self.panel_tianshu = self.panel_tianshu_list[self.item.maxStoneNum]
    self.panel_tianshu:setVisible(true)

    self.panel_jy = {}
    for i = 1, self.item.maxStoneNum do
        self.panel_jy[i] = TFDirector:getChildByPath(self.panel_tianshu, "btn_jy" .. i)
        --self.panel_jy[i].img_quality = TFDirector:getChildByPath(self.panel_jy[i], "img_quality")
        self.panel_jy[i].img_jy = TFDirector:getChildByPath(self.panel_jy[i], "img_jy")
        --self.panel_jy[i].img_jy:setScale(1.5)
        self.panel_jy[i].img_khc = TFDirector:getChildByPath(self.panel_jy[i], "img_khc")
        self.panel_jy[i].img_kjh = TFDirector:getChildByPath(self.panel_jy[i], "img_kjh")

        self.panel_jy[i].img_jy:setScale(0.62)
    end

    for i = 1, #self.panel_jy do
        self.panel_jy[i].logic = self
        self.panel_jy[i].index = i
        self.panel_jy[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onEssentialClickHandle), 1)
    end

    self.panel_shengchong_need:setVisible(true)
    local costCoin = 0
    local costGoodsId = nil
    local costGoodsNum = 0
    local str = self.item.bibleConfig.comsume
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

    self.panel_book1.img_equip:setTexture(GetCoinIcon())
    self.panel_book1.txt_num:setText(costCoin)
    if MainPlayer:getCoin() < costCoin then
        self.panel_book1.txt_num:setColor(ccc3(255, 0, 0))
    else
        self.panel_book1.txt_num:setColor(ccc3(255, 255, 255))
    end

    if costGoodsId then
        local item = ItemData:objectByID(costGoodsId)
        self.panel_book2.img_quality:setTextureNormal(GetColorIconByQuality_82(item.quality))
        self.panel_book2.img_equip:setTexture(item:GetPath())
        local num = 0
        num = BagManager:getItemNumById(costGoodsId)
        self.panel_book2.txt_num:setText("/" .. costGoodsNum)
        self.panel_book2.txt_num1:setText(num)
        if num < costGoodsNum then
            self.panel_book2.txt_num1:setColor(ccc3(255, 0, 0))
        else
            self.panel_book2.txt_num1:setColor(ccc3(255, 255, 255))
        end
    else
        self.panel_book2:setVisible(false)
    end

    self.costCoin = costCoin
    self.costGoodsId = costGoodsId
    self.costGoodsNum = costGoodsNum

    --升重按钮效果 
    
    if self.btn_shengchong.effect then
        self.btn_shengchong.effect:removeFromParent()
        self.btn_shengchong.effect = nil
    end
    
    if self:isCanShengchong() then
        self:addTupoEffect(self.btn_shengchong, true)
    end

    self.img_tianshu:setTexture(self.item:GetTextrue())
    
    --名字
    self.txt_name:setText(self.item:getConfigName())

    --重数
    --self.txt_chong:setText("第" .. EnumSkyBookLevelType[self.item.level] .. "重")
    self.txt_chong:setText(stringUtils.format(localizable.common_index_chong,EnumSkyBookLevelType[self.item.level] ))

    --星星
    local tupoLevel = self.item.tupoLevel
    for i = 1, 5 do
        self.img_xing[i]:setVisible(true)
        self.img_xing[i].xing:setVisible(false)
    end
    for i = 1, tupoLevel do
        -- self.img_xing[i].xing:setVisible(true)

        local starIdx = i
        local starTextrue = 'ui_new/tianshu/img_xing1.png'
        if i > 5 then
            starTextrue = 'ui_new/tianshu/img_xing3.png'
            starIdx = i - 5
        end
        self.img_xing[starIdx].xing:setTexture(starTextrue)
        self.img_xing[starIdx].xing:setVisible(true)

    end

    --精要孔
    self:refreshJingyaoHole()

    --残页图片
    self.img_quality:setTextureNormal(GetColorIconByQuality_82(self.item.quality))
    local template = SkyBookManager:getBiblePieceTemplateByQuality(self.item.quality)
    self.img_equip:setTexture(template:GetPath())

    --残页进度
    local curPieceNum = SkyBookManager:getBiblePieceNumByQuality(self.item.quality)
    local needPieceNum = SkyBookManager:getTupoNeedPieceNumByInstance(self.item)

    local percent = (curPieceNum / needPieceNum) * 100
    if percent <= 100 then
        self.bar_soul:setPercent(percent)
    else
        self.bar_soul:setPercent(100)
    end
    self.txt_soul_num:setText(curPieceNum .. "/" .. needPieceNum)

    --突破按钮效果
    if percent >= 100 and SkyBookManager:isInTupoMaxLevel(self.item) == false and self:isTupoMaterialEnough() then
        self:addTupoEffect(self.btn_tupo, true)
    else
        self:addTupoEffect(self.btn_tupo, false)
    end

    -- for i = 1, self.kMaxAttrNum do
    --     self.img_attr[i]:setVisible(false)
    -- end
    for i,v in pairs(self.img_attr) do
        v:setVisible(false)
    end
    --属性
    local totalAttr = self.item:getTotalAttr()
    local count = 0
    for i = 1, EnumAttributeType.Max - 1 do  
        if totalAttr[i] and totalAttr[i] ~= 0 and count < self.img_attr_count then
            count = count + 1
            self.img_attr[count]:setVisible(true)
            self.img_attr[count].txt_name:setText(AttributeTypeStr[i])
            self.img_attr[count].txt_base:setText(covertToDisplayValue(i,totalAttr[i],true))
            self.img_attr[count]:setVisible(true)
        end
    end

    local immuneAttr = self.item:getImmuneAttr()
    for k,v in pairs(immuneAttr) do
        if v and v ~= 0 then
            count = count + 1
            if (self.img_attr[count]) then
                self.img_attr[count].txt_name:setText(SkillBuffHurtStr[k])
                self.img_attr[count].txt_base:setText(covertToDisplayValue(k,v,true))
                self.img_attr[count]:setVisible(true)
            end
        end
    end
    local effectExtraAttr = self.item:getEffectExtraAttr()

    for k,v in pairs(effectExtraAttr) do
        if v and v ~= 0 then
            count = count + 1
            if (self.img_attr[count]) then
                self.img_attr[count].txt_name:setText(SkillBuffHurtStr[k])
                self.img_attr[count].txt_base:setText(covertToDisplayValue(k,v,true))
                self.img_attr[count]:setVisible(true)
            end
        end
    end
    local beEffectExtraAttr = self.item:getBeEffectExtraAttr()
    local attrInfo = getBeEffectInfo(beEffectExtraAttr)
    for attrName,info in pairs(attrInfo) do
        count = count + 1
        local attrImg = self.img_attr[count]
        if (attrImg and (info.percentAttr > 0 or info.constAttr > 0)) then
            attrImg.txt_name:setText(attrName)
            local str = ""
            if (info.percentAttr > 0) then
                str = info.percentAttr.."%"
                if (info.constAttr > 0) then
                    str = str.."+"..info.constAttr
                end
            else
                if (info.constAttr > 0) then
                    str = info.constAttr
                end
            end

            attrImg.txt_base:setText(str)
            attrImg:setVisible(true)
        end     
    end
    -- for k,v in pairs(beEffectExtraAttr) do
    --     if v and v ~= 0 then
    --         if (k == 44) then
    --             x = math.abs(covertToDisplayZeroValue(k, v))
    --         elseif (k == 100) then
    --             y = math.abs(v)
    --         else
    --             count = count + 1
    --             self.img_attr[count]:setVisible(true)
    --             self.img_attr[count].txt_name:setText(BeEffectExtraStr[k])
    --             self.img_attr[count].txt_base:setText(covertToDisplayValue(k,v,true))
    --             self.img_attr[count]:setVisible(true)
    --         end
    --     end
    -- end
   
    -- if (tonumber(x) > 0 or y > 10) then
    --     count = count + 1
    --     self.img_attr[count]:setVisible(true)
    --     self.img_attr[count].txt_name:setText(BeEffectExtraStr[44])
    --     self.img_attr[count].txt_base:setText(x.."%+"..y)
    -- end
    self.panel_jiacheng:setInnerContainerSize(CCSizeMake(self.panel_jiacheng:getSize().width, 250))
    self.panel_jiacheng:setContentOffset(ccp(0,-95))
    if count >= self.kMaxAttrNum then
        self.panel_jiacheng:setTouchEnabled(true)
    else
        self.panel_jiacheng:setTouchEnabled(false)
    end
    
    if SkyBookManager:isInTupoMaxLevel(self.item) then
        print("is in tupomax ++++++ ")
        self.btn_tupo:setGrayEnabled(true)
        self.btn_tupo:setTouchEnabled(false)
        self:addTupoEffect(self.btn_tupo, false)

        self.txt_soul:setVisible(true)
        self.txt_soul_num:setVisible(false)
        self.txt_soul:setText(self.TEXT_TUPO_MAX)  
    end

    self.img_diwen1:setTexture(GetBibleNameBgByQuality(quality))
    self.img_diwen2:setTexture(GetBibleNameBgByQuality(quality))

    if self.item.level >= BibleData:getMaxLevel(self.item.id) then
        self:addTupoEffect(self.btn_shengchong, false)
        --[[
        if self.btn_shengchong.effect then
            self.btn_shengchong.effect:removeFromParent()
            self.btn_shengchong.effect = nil
        end
        ]]
        self.btn_shengchong:setGrayEnabled(true)
        self.btn_shengchong:setTouchEnabled(false)
        self.txt_suoxu:setText(localizable.Tianshu_chongzhi_tips7)
        self.panel_book1:setVisible(false)
        self.panel_book2:setVisible(false)
    else
        self.txt_suoxu:setText(localizable.Tianshu_chongzhi_tips6)
    end

    if self:checkCanXiangqian(self.item.instanceId) then
        self.btn_yjxq:setVisible(true)
    else
        self.btn_yjxq:setVisible(false)
    end

    if quality < 4 then
        self.btn_bsk:setVisible(false)
        self.btn_bsk2:setVisible(false)
        self.img_neiquan:setVisible(false)
        self.img_neiquan2:setVisible(true)
    else
        self.btn_bsk:setVisible(true)
        self.btn_bsk2:setVisible(true)
        self.img_neiquan:setVisible(true)
        self.img_neiquan2:setVisible(false)
    end

    self.btn_bsk.img_suo:setVisible(true)
    self.btn_bsk.img_kxq:setVisible(false)
    self.btn_bsk.img_baoshi:setVisible(false)
    self.gemStatus = SkyBookManager:checkGemState(self.item, 1)

    self.btn_bsk2.img_suo:setVisible(true)
    self.btn_bsk2.img_kxq:setVisible(false)
    self.btn_bsk2.img_baoshi:setVisible(false)
    self.gemStatus2 = SkyBookManager:checkGemState(self.item, 2)

    if self.gemStatus == SkyBookManager.EnumGemStatus.STATUS_LOCKED then
    elseif self.gemStatus == SkyBookManager.EnumGemStatus.STATUS_NOT_ENOUGH then
        self.btn_bsk.img_suo:setVisible(false)
    elseif self.gemStatus == SkyBookManager.EnumGemStatus.STATUS_ENOUGH then
        self.btn_bsk.img_suo:setVisible(false)
        self.btn_bsk.img_kxq:setVisible(true)
    elseif self.gemStatus == SkyBookManager.EnumGemStatus.STATUS_EQUIPPED then
        self.btn_bsk.img_suo:setVisible(false)
        self.btn_bsk.img_baoshi:setVisible(true)
        local gemId = self.item:getGemPos(1)
        local gemItem = ItemData:objectByID(gemId)
        if gemItem then
            self.btn_bsk.img_baoshi:setTexture(gemItem:GetPath())
        end
    end

    if self.gemStatus2 == SkyBookManager.EnumGemStatus.STATUS_LOCKED then
    elseif self.gemStatus2 == SkyBookManager.EnumGemStatus.STATUS_NOT_ENOUGH then
        self.btn_bsk2.img_suo:setVisible(false)
    elseif self.gemStatus2 == SkyBookManager.EnumGemStatus.STATUS_ENOUGH then
        self.btn_bsk2.img_suo:setVisible(false)
        self.btn_bsk2.img_kxq:setVisible(true)
    elseif self.gemStatus2 == SkyBookManager.EnumGemStatus.STATUS_EQUIPPED then
        self.btn_bsk2.img_suo:setVisible(false)
        self.btn_bsk2.img_baoshi:setVisible(true)
        local gemId = self.item:getGemPos(2)
        local gemItem = ItemData:objectByID(gemId)
        if gemItem then
            self.btn_bsk2.img_baoshi:setTexture(gemItem:GetPath())
        end
    end

    self.btn_chongzhu:setVisible(false)
    if quality >= 4 then
        self.btn_chongzhu:setVisible(true)
    end

    print("self.gemStatus == > ", self.gemStatus, self.gemStatus2)

    local openLevel = FunctionOpenConfigure:getOpenLevel(2215) or 85
    local currLevel = MainPlayer:getLevel()
    if currLevel < openLevel or quality < 4 then
        self.btn_chongzhu:setVisible(false)
    else
        self.btn_chongzhu:setVisible(true)
    end

    --注解
    local openLevel1 = FunctionOpenConfigure:getOpenLevel(2223)
    if currLevel >= openLevel and quality >= 4 and self.item.tupoLevel >= 3 then
        self.btn_zhujie:setVisible(true)
    else
        self.btn_zhujie:setVisible(false)
    end
    --
    if (quality < 4) then
        self.btn_myk:setVisible(false)
        self.btn_myk.img_suo:setVisible(true)
        self.btn_myk.img_kxq:setVisible(false)
        self.btn_myk.img_baoshi:setVisible(false)
    else
        self.btn_myk.img_baoshi:setVisible(false)
        if self.btn_zhujie:isVisible() then
            self.btn_myk.img_suo:setVisible(false)
            local keyId = self.item.bibleKeyId
            if (keyId and keyId ~= 0) then
                self.btn_myk.img_kxq:setVisible(false)
                local myYaoInfo = SkyBookManager:getMiYaoById(keyId)
                if (myYaoInfo) then
                    local itemData = ItemData:objectByID(myYaoInfo.id)
                    if (itemData) then
                        self.btn_myk.img_baoshi:setTexture(itemData:GetPath())
                        self.btn_myk.img_baoshi:setVisible(true) 
                    end
                end
            else
                self.btn_myk.img_kxq:setVisible(BagManager:getMiYaoList():length() > 0)
            end
        else
            self.btn_myk.img_suo:setVisible(true)
            self.btn_myk.img_kxq:setVisible(false)
        end
        
        self.btn_myk:setVisible(true)
    end
    
end

function TianshuMainLayer:checkCanXiangqian(instanceId)
    local bible = SkyBookManager:getItemByInstanceId(instanceId)
    local idTable = bible:getJingyaoIdTable()

    local tab = {}
    for i = 1, bible.maxStoneNum do
        local status = self:getOneJingyaoStatus(i)
        if status == self.EnumJingyaoStatus.STATUS_JINGYAO_ENOUGH or status == self.EnumJingyaoStatus.STATUS_PIECE_ENOUGH then
            table.insert(tab, i)
        end
    end

    local bCan = false
    for i = 1, #tab do
        local id = tab[i]
        local costCoin, costGoodsNum = SkyBookManager:getMosaicCost(bible, tab[i])
        if MainPlayer:getCoin() >= costCoin and MainPlayer:isEnoughYueLi(costGoodsNum, false) then
            bCan = true
        end
    end

    return bCan
end

function TianshuMainLayer:isTupoMaterialEnough()
    local curPieceNum = SkyBookManager:getBiblePieceNumByQuality(self.item.quality)
    local needPieceNum, tab_tupofu = SkyBookManager:getTupoNeedPieceNumByInstance(self.item)

    if curPieceNum < needPieceNum then
        return false
    end

    if tab_tupofu and tab_tupofu.num then
        local item = ItemData:objectByID(tonumber(tab_tupofu.id))
        local curNum = BagManager:getItemNumById(tonumber(tab_tupofu.id))
        local needNum = tab_tupofu.num

        if curNum < needNum then
            return false
        end        
    end

    return true
end

--刷新精要孔
function TianshuMainLayer:refreshJingyaoHole()
    
    for i = 1, #self.panel_jy do
        self.panel_jy[i]:setVisible(true)
        self.panel_jy[i].img_jy:setVisible(false)
        self.panel_jy[i].img_jy:setOpacity(255)
    end
   
    print("++++++++++++++")
    for i = 1, #self.jingyaoIdList do
        print("id :", self.jingyaoIdList[i], "status :", self.jingyaoStatus[i])
    end
    print("++++++++++++++")


    for i = 1, self.item.maxStoneNum do
        local jingyaoId = self.jingyaoIdList[i]

        local item = ItemData:objectByID(tonumber(jingyaoId)) 
        self.panel_jy[i]:setTextureNormal("ui_new/tianshu/btn_jyk.png")       
        self.panel_jy[i].img_jy:setTexture(item:GetPath())

        if self.jingyaoStatus[i] == self.EnumJingyaoStatus.STATUS_EQUIPPED then
            self.panel_jy[i]:setTextureNormal(GetColorRoadIconByQualitySmall(item.quality))
            self.panel_jy[i].img_kjh:setVisible(false)
            self.panel_jy[i].img_khc:setVisible(false)
            self.panel_jy[i].img_jy:setVisible(true)
            self.panel_jy[i]:setOpacity(255)
            self.panel_jy[i].img_jy:setOpacity(255)
        elseif self.jingyaoStatus[i] == self.EnumJingyaoStatus.STATUS_NOT_ENOUGH then
            self.panel_jy[i].img_kjh:setVisible(false)
            self.panel_jy[i].img_khc:setVisible(false)
            self.panel_jy[i].img_jy:setVisible(true)
            --self.panel_jy[i]:setOpacity(180)
            self.panel_jy[i].img_jy:setOpacity(100)
        elseif self.jingyaoStatus[i] == self.EnumJingyaoStatus.STATUS_JINGYAO_ENOUGH then
            self.panel_jy[i].img_kjh:setVisible(true)
            self.panel_jy[i].img_khc:setVisible(false)
            self.panel_jy[i].img_jy:setVisible(true)
            --self.panel_jy[i]:setOpacity(180)
            self.panel_jy[i].img_jy:setOpacity(100)
        elseif self.jingyaoStatus[i] == self.EnumJingyaoStatus.STATUS_PIECE_ENOUGH then
            self.panel_jy[i].img_kjh:setVisible(false)
            self.panel_jy[i].img_khc:setVisible(true)
            self.panel_jy[i].img_jy:setVisible(true)
            --self.panel_jy[i]:setOpacity(180)
            self.panel_jy[i].img_jy:setOpacity(100)
        end
    end
end

function TianshuMainLayer:isCanShengchong()
    local bCanShengchong = true
    for i = 1, self.item.maxStoneNum do
        if self.jingyaoStatus[i] ~= self.EnumJingyaoStatus.STATUS_EQUIPPED then
            return false
        end
    end

    if MainPlayer:getCoin() < self.costCoin then
        return false
    end

    if self.costGoodsId then
        local goods =  BagManager:getItemById(tonumber(self.costGoodsId))
        local item = ItemData:objectByID(self.costGoodsId)
        if not goods then
            return false
        end
        print("shengchong need goodsId = ", self.costGoodsId)
        print("shengchong need goodsNum = ", self.costGoodsNum)
        if goods.num < tonumber(self.costGoodsNum) then
            return false
        end
    end

    return bCanShengchong
end

--突破按钮特效
function TianshuMainLayer:addTupoEffect(btn, bAdd)
    if bAdd then
        if btn.effect then
            btn.effect:removeFromParent()
            btn.effect = nil
        end

        TFResourceHelper:instance():addArmatureFromJsonFile("effect/btn_common_small.xml")
        local effect = TFArmature:create("btn_common_small_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 1)
        btn:addChild(effect, 100)
        btn.effect = effect
    else
        if btn.effect then
            btn.effect:removeFromParent()
            btn.effect = nil
        end
    end
end

function TianshuMainLayer:setLogic(logic)
	self.logic = logic
end

function TianshuMainLayer:removeUI()
	self.super.removeUI(self)
end

--销毁方法
function TianshuMainLayer:dispose()
	if self.generalHead then
		self.generalHead:dispose()
		self.generalHead = nil
	end

    self.super.dispose(self)
end

function TianshuMainLayer:registerEvents()
	self.super.registerEvents(self)

    self.btn_tupo:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTupoClickHandle), 1)
    self.btn_jingyao:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onJingyaoClickHandle), 1)
    self.btn_shengchong:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShengchongClickHandle), 1)
    self.btn_chongzhi:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onChongzhiClickHandle), 1)
    self.btn_fenjie:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onFenjieClickHandle), 1)
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClickHandle), 1)
    self.img_quality:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCanyeIconHandle), 1) 
    self.btn_zhujie:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZhujieHandle), 1) 
    self.btn_myk:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onMiYaoHandle), 1) 

    self.btn_pageleft:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPageLeftClickHandle), 1)
    self.btn_pageright:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPageRightClickHandle), 1)

    self.panel_book1.img_quality:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCoinClickHandle), 1)
    self.panel_book2.img_quality:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGoodsClickHandle), 1)

    self.btn_yjxq:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onOneKeyXiangqianClick), 1)
    self.btn_zhihuan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZhiHuanClick), 1)

    self.btn_bsk:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBskClickHandle), 1)
    self.btn_bsk2:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBsk2ClickHandle), 1)
    
	self.EquipmentResultCallBack = function(event)
        print("111111111")
        --self:refreshUI()
    end
    TFDirector:addMEGlobalListener(SkyBookManager.ESSENTIAL_UN_MOSAIC_RESULT,self.EquipmentResultCallBack)

    
    self.EssentialMosaicCallBack = function(event)
        local data = event.data[1]
        print("data= ",data)
        local pos = data.pos

        local panel_tianshu = self.panel_tianshu_list[self.item.maxStoneNum]
        local widget = TFDirector:getChildByPath(panel_tianshu, "btn_jy" .. pos)
        if widget then
            --[[
            if self.mosaic_effect then
                self.mosaic_effect:removeFromParent(true)
                self.mosaic_effect = nil
            end
            ]]
            TFResourceHelper:instance():addArmatureFromJsonFile("effect/assistOpen.xml")
            local effect = TFArmature:create("assistOpen_anim")
            if effect == nil then
                self.img_success:removeFromParent(true)
                self.img_success = nil
                return
            end
            effect:setAnimationFps(GameConfig.ANIM_FPS)
            effect:playByIndex(0, -1, -1, 0)
            effect:setPosition(ccp(0,0))
            effect:setScale(0.75)
            effect:setZOrder(1)
            widget:addChild(effect)
            --[[
            self.mosaic_effect = effect
            self.mosaic_effect:addMEListener(TFARMATURE_COMPLETE,function()
                self.mosaic_effect:removeMEListener(TFARMATURE_COMPLETE) 
                self.mosaic_effect = nil
            end)
            ]]
            effect:addMEListener(TFARMATURE_COMPLETE,function()
                effect:removeMEListener(TFARMATURE_COMPLETE) 
                effect = nil
            end)
        end

    end
    TFDirector:addMEGlobalListener(SkyBookManager.ESSENTIAL_MOSAIC_RESULT,self.EssentialMosaicCallBack)
    TFDirector:addMEGlobalListener(BagManager.EQUIP_PIECE_MERGE,self.EquipmentResultCallBack)

    self.ResetResultCallback = function(event)
        if self and self.refreshUI then
            print("000000000000000000")
            self:refreshUI()  
        end 
    end
    self.skyBookLevelUpResultCallBack = function(event)
        if self and self.refreshUI then
            self:refreshUI()
            self:showLevelUpSuccess()
        end 
    end
    TFDirector:addMEGlobalListener(SkyBookManager.BIBLE_RESET_RESULT, self.ResetResultCallback)
    TFDirector:addMEGlobalListener(SkyBookManager.BIBLE_RESOLVE_RESPONSE,self.ResetResultCallback)
    TFDirector:addMEGlobalListener(SkyBookManager.BIBLE_BREACH_RESULT, self.ResetResultCallback)
    TFDirector:addMEGlobalListener(SkyBookManager.BIBLE_LEVEL_UP_RESULT, self.skyBookLevelUpResultCallBack)    

    self.mosaicAllCallBack = function(event)
        if self and self.refreshUI then
            self:refreshUI()
        end  
    end

    TFDirector:addMEGlobalListener(SkyBookManager.ESSENTIAL_MOSAIC_ALL_RESULT, self.mosaicAllCallBack) 

    if self.generalHead then
        self.generalHead:registerEvents()
    end

    self.btn_chongzhu.logic = self
    self.btn_chongzhu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onChongzhuClickHandle), 1)
    self.btn_canWu.logic = self
    self.btn_canWu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCanWuClickHandle), 1)
end

--宝石孔
function TianshuMainLayer.onBskClickHandle(sender)
    local self = sender.logic

    if self.gemStatus == SkyBookManager.EnumGemStatus.STATUS_LOCKED then
        toastMessage(localizable.Tianshu_gem_locked)
        return
    end
    SkyBookManager:openGemLayer(self.item.instanceId, 1)
end

--宝石孔2
function TianshuMainLayer.onBsk2ClickHandle(sender)
    local self = sender.logic

    if self.gemStatus2 == SkyBookManager.EnumGemStatus.STATUS_LOCKED then
        toastMessage(localizable.Tianshu_Chongzhu_Unlock)
        return
    end
    SkyBookManager:openGemLayer(self.item.instanceId, 2)
end

--一键镶嵌精要
function TianshuMainLayer.onOneKeyXiangqianClick(sender)
    local self = sender.logic

    SkyBookManager:requestEssentialAllMosaic(self.item.instanceId)
end

function TianshuMainLayer.onZhiHuanClick(sender)
    local self = sender.logic

    SkyBookManager:openExchange(self.item.instanceId)
end


function TianshuMainLayer.onPageLeftClickHandle(sender)
    local self = sender.logic

    --print(self.selectIndex)
    self.selectIndex = self:getBookList():indexOf(self.item)
    self.selectIndex = self.selectIndex - 1
    local item = self:getBookList():objectAt(self.selectIndex)
    
    self:loadData(item.instanceId)
end

function TianshuMainLayer.onPageRightClickHandle(sender)
    local self = sender.logic

    print(self.selectIndex)
    self.selectIndex = self:getBookList():indexOf(self.item)
    self.selectIndex = self.selectIndex + 1
    local item = self:getBookList():objectAt(self.selectIndex)
    self:loadData(item.instanceId)
end

function TianshuMainLayer:showLevelUpSuccess()
    if self.success_effect then
        self.success_effect:removeFromParent(true)
        self.success_effect  = nil
    end
    -- local img = TFImage:create()

    -- img:setTexture(self.item:GetTextrue())
    -- img:setScale(1.5)
    -- img:setPosition(ccp(0,0))
    -- img:setZOrder(10)
    -- self.img_fazhen:addChild(img)
    -- self.img_success = img

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/skyBook_shengchong_effect.xml")
    local effect = TFArmature:create("skyBook_shengchong_effect_anim")
    if effect == nil then
        return
    end
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)
    effect:setPosition(ccp(190,190))
    effect:setScale(1)
    effect:setZOrder(1)
    self.img_fazhen:addChild(effect)
    self.success_effect = effect
    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeMEListener(TFARMATURE_COMPLETE)
    end)
end

function TianshuMainLayer.onCanyeIconHandle(sender)
    local self = sender.logic
    local item = SkyBookManager:getBiblePieceTemplateByQuality(self.item.quality)
    Public:ShowItemTipLayer(item.id, EnumDropType.GOODS)
end

--注解
function TianshuMainLayer.onZhujieHandle(sender)
    local self = sender.logic
    SkyBookManager:OpenZhuJieLayer(self.item.instanceId)
end
--秘要
function TianshuMainLayer.onMiYaoHandle(sender)
    local self = sender.logic
    local currLevel = MainPlayer:getLevel()
    local openLevel1 = FunctionOpenConfigure:getOpenLevel(2223)
    if currLevel < openLevel1 then
        toastMessage(stringUtils.format(localizable.common_function_openlevel,openLevel1))
        return
    end

    if self.item.tupoLevel < 3 then
        toastMessage(stringUtils.format(localizable.Tianshu_MiYai_Tips4,3))
        return
    end
    local tempAttr      = TFArray:new()
    local selectIndex   = 0
    local num           = 0
    for v in self:getBookList():iterator() do
        if (v:getTupoLevel() >= 3 and v.quality >= 4) then
            tempAttr:push(v)
            num = num + 1
            if (self.item.instanceId == v.instanceId) then
                selectIndex = num
            end
        end
    end
    SkyBookManager:OpenMiYaoLayer(self.item.instanceId, tempAttr, selectIndex)
end

function TianshuMainLayer.onCoinClickHandle(sender)
    local self = sender.logic

    Public:ShowItemTipLayer(nil, EnumDropType.COIN)
end

function TianshuMainLayer.onGoodsClickHandle(sender)
    local self = sender.logic

    if not self.costGoodsId then
        return
    end

    Public:ShowItemTipLayer(self.costGoodsId, EnumDropType.GOODS)
end

function TianshuMainLayer:removeEvents()
    self.super.removeEvents(self)

    if self.generalHead then
        self.generalHead:removeEvents()
    end

    TFDirector:removeMEGlobalListener(SkyBookManager.ESSENTIAL_UN_MOSAIC_RESULT, self.EquipmentResultCallBack )
    --self.EquipmentResultCallBack = nil

    TFDirector:removeMEGlobalListener(SkyBookManager.ESSENTIAL_MOSAIC_RESULT, self.EssentialMosaicCallBack )
    self.EssentialMosaicCallBack = nil
    --self.EquipmentResultCallBack = nil

    TFDirector:removeMEGlobalListener(BagManager.EQUIP_PIECE_MERGE, self.EquipmentResultCallBack)
    self.EquipmentResultCallBack = nil

    TFDirector:removeMEGlobalListener(SkyBookManager.BIBLE_RESET_RESULT, self.ResetResultCallback)
    --self.ResetResultCallback = nil

    TFDirector:removeMEGlobalListener(SkyBookManager.BIBLE_RESOLVE_RESPONSE, self.ResetResultCallback)
    --self.ResetResultCallback = nil
    self.ResetResultCallback = nil

    TFDirector:removeMEGlobalListener(SkyBookManager.BIBLE_LEVEL_UP_RESULT, self.skyBookLevelUpResultCallBack)
    self.skyBookLevelUpResultCallBack = nil
end

function TianshuMainLayer.onEssentialClickHandle(sender)
    local self = sender.logic
    local index = sender.index

    if index > self.item.maxStoneNum then
        --toastMessage("该精要孔未开放")
        toastMessage(localizable.Tianshu_chongzhi_text4)
        return
    end

    local id = self.jingyaoIdList[index]
    --if self.jingyaoStatus[index] == self.EnumJingyaoStatus.STATUS_EQUIPPED or self.jingyaoStatus[index] == self.EnumJingyaoStatus.STATUS_JINGYAO_ENOUGH then
        --print("融入or卸下精要")
        local layer  = require("lua.logic.tianshu.GetJingyao_Rongru"):new()
        layer:setDelegate(self)
        layer:loadData(self.item, index, self.jingyaoStatus[index], id)
        AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY_CLOSE, AlertManager.TWEEN_1)
        AlertManager:show()
    --[[
    else
        print("合成精要碎片")
        local layer  = require("lua.logic.tianshu.GetJingyao_Rongru"):new()
        layer:setDelegate(self)
        layer:loadData(self.item, index, self.jingyaoStatus[index], id, self.EnumSubType.TYPE_HECHENG)
        AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY_CLOSE, AlertManager.TWEEN_1)
        AlertManager:show() 
    end
    ]]
end

function TianshuMainLayer.onHelpClickHandle(sender)
    local self = sender.logic

    --toastMessage("t_s_rule, t_s_rule_info还没配")
    CommonManager:showRuleLyaer("tianshu")
end

function TianshuMainLayer.onTupoClickHandle(sender)
    local self = sender.logic

    local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianshuTupoLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(self.instanceId)
    AlertManager:show()
end

function TianshuMainLayer.onJingyaoClickHandle(sender)
    local self = sender.logic

    local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.tianshu.JingyaoMainLayer")
    layer.selectedTab = nil
    AlertManager:show()
end

function TianshuMainLayer.onShengchongClickHandle(sender)
    local self = sender.logic

    self:requestShengchong()
end

--请求升重
function TianshuMainLayer:requestShengchong()
    --local maxLevel = ConstantData:getValue(" ")
    --常量表暂未配,暂时从SkyBookManager取

    local maxLevel = BibleData:getMaxLevel(self.item.id)
    local bookLevel = self.item.level
    if bookLevel >= maxLevel then
        --toastMessage("该天书已达最大重数")
        toastMessage(localizable.Tianshu_chongzhi_text5)
        return
    end

    for i = 1, self.item.maxStoneNum do
        local status = self.jingyaoStatus[i]

        if status ~= self.EnumJingyaoStatus.STATUS_EQUIPPED then
            --toastMessage("融入全部" .. self.item.maxStoneNum .. "个精要后才可以升重")
            toastMessage(stringUtils.format(localizable.Tianshu_chongzhi_text6,self.item.maxStoneNum ))
            return
        end
    end

    if MainPlayer:getCoin() < self.costCoin then
        --toastMessage("升重所需金币不足!")
        toastMessage(localizable.Tianshu_chongzhi_text7)
        return
    end

    if self.costGoodsId then
        local goodsNum =  BagManager:getItemNumById(tonumber(self.costGoodsId))
        local item = ItemData:objectByID(self.costGoodsId)
        local costNum = tonumber(self.costGoodsNum)
        if costNum > 0 and goodsNum < costNum then
            if ResGetWayManager:openResGetLayer(self.costGoodsId,EnumDropType.GOODS) == true then
                return
            end
            toastMessage(stringUtils.format(localizable.Tianshu_chongzhi_text8,item.name))
            return
        end
    end
    
    SkyBookManager:requestBibleLevelUp(self.item.instanceId)
end

--获得单个精要孔状态
function TianshuMainLayer:getOneJingyaoStatus(index)
    local status = self.EnumJingyaoStatus.STATUS_NOT_ENOUGH
    local idTable = self.item:getJingyaoIdTable()
    --精要id
    local id = idTable[index]
    --已融入
    if self.item:getStonePos(index) and self.item:getStonePos(index) > 0 then
        return self.EnumJingyaoStatus.STATUS_EQUIPPED
    end
    --包里的精要
    local bagItem = BagManager:getItemById(tonumber(id))
    if bagItem and bagItem.num > 0 then
        --包里的精要足够
        return self.EnumJingyaoStatus.STATUS_JINGYAO_ENOUGH
    end

    if SkyBookManager:isJingyaoCanHecheng(tonumber(id)) then
        --包里精要碎片足够
        return self.EnumJingyaoStatus.STATUS_PIECE_ENOUGH
    end
    return status
end

--获得精要状态表
function TianshuMainLayer:refreshJingyaoStatus()
    local jingyaoStatus = {}
    for i = 1, self.item.maxStoneNum do
        local status = self:getOneJingyaoStatus(i)
        jingyaoStatus[i] = status
    end
    self.jingyaoStatus = jingyaoStatus
    self.jingyaoIdList = self.item:getJingyaoIdTable()
    return jingyaoStatus
end

function TianshuMainLayer.onChongzhiClickHandle(sender)
    local self = sender.logic

    local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianshuChongzhiLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(self.instanceId)
    AlertManager:show()

    --SkyBookManager:requestBibleReset(self.item.instanceId)
end

function TianshuMainLayer.onFenjieClickHandle( sender )
    local self = sender.logic  
    local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianShuFenJieLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(self.instanceId)
    AlertManager:show()
    AlertManager:closeLayer(self)
end

function TianshuMainLayer.onChongzhuClickHandle(sender)
    local self = sender.logic

    SkyBookManager:openChongzhuLayer(self.item.instanceId)
end

--天书参悟
function TianshuMainLayer.onCanWuClickHandle(sender)
    local self = sender.logic
    if (self.item.quality >= SkyBookManager.CanWuOpenQuality) then
        SkyBookManager:openCanWuLayer(self.item.instanceId)
    end
end
return TianshuMainLayer