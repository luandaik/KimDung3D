-- client side ZhenfaShenyanLayer.lua
--[[
 * @Description: 阵法深研界面
 ]]
-- script writer luoconghai
-- creation time 2017.06.06

local ZhenfaShenyanLayer = class("ZhenfaShenyanLayer", BaseLayer)
ZhenfaShenyanLayer.ShenYanMaxLevel = 160

function ZhenfaShenyanLayer:ctor(gmId)
	self.super.ctor(self, data)
    self.gmId = gmId
	self:init("lua.uiconfig_mango_new.zhenfa.ZhenFaShenYan")
end

function ZhenfaShenyanLayer:initUI( ui )
	self.super.initUI(self,ui)
    self.ui = ui
    
    self.img_zhenyan    = TFDirector:getChildByPath(ui, 'img_currzhenyan')

    -------------------------------
    self.Panel_nextSub = TFDirector:getChildByPath(ui, "Panel_nextSub")
    self.txt_tips2 = TFDirector:getChildByPath(self.Panel_nextSub, "txt_next_1")
    self.txt_tips3 = TFDirector:getChildByPath(self.Panel_nextSub, "txt_nextHurtDerate")
    self.txt_tips1 = TFDirector:getChildByPath(self.Panel_nextSub, "txt_dac")
    self.txt_level      = TFDirector:getChildByPath(ui, 'txt_qianghua1')
    self.txt_maxLevel      = TFDirector:getChildByPath(self.txt_level, 'txt_qianghua2')
    self.btn_shenyan     = TFDirector:getChildByPath(ui, 'btn_tuiyan')

    self.Panel_nextSub2 = TFDirector:getChildByPath(ui, "Panel_nextSub2")
    self.txt_next_2 = TFDirector:getChildByPath(self.Panel_nextSub2, "txt_next_2")
    self.txt_nextHurtDerate2 = TFDirector:getChildByPath(self.Panel_nextSub2, "txt_nextHurtDerate")
    self.txt_dac2 = TFDirector:getChildByPath(self.Panel_nextSub2, "txt_sx")


    --消耗道具
    self.btn_tool      = TFDirector:getChildByPath(ui, "btn_tool1")
    -- self.img_toolKuang = TFDirector:getChildByPath(ui, "img_toolKuang")
    self.img_tool      = TFDirector:getChildByPath(ui, "img_tool1")
    self.txt_toolNum   = TFDirector:getChildByPath(ui, "txt_num1")
    self.btn_tool.logic  = self
    self.img_effect_di   = TFDirector:getChildByPath(ui, "img_effect_di")
    self.img_effect_di:setVisible(true)
    -----------------------------------
    self.panel_zhenyan = TFDirector:getChildByPath(ui, "panel_zhenyan")
    self.zheWeiList = {}
    for i = 1, 3 do
        local bg            = TFDirector:getChildByPath(ui, "bg_"..i)
        local panel_sx      = TFDirector:getChildByPath(bg, "panel_sx")
        local panel_2sx      = TFDirector:getChildByPath(bg, "panel_2sx")
        bg.panel_sx=panel_sx
        bg.panel_2sx=panel_2sx
        bg.txt_level        = TFDirector:getChildByPath(bg, "txt_battletime")
        bg.img_to           = TFDirector:getChildByPath(panel_sx, "img_to_1")

        bg.txt_attrName     = TFDirector:getChildByPath(panel_sx, "lbl_base")
        bg.txt_currValue    = TFDirector:getChildByPath(panel_sx, "txt_base_current")
        bg.txt_nextValue    = TFDirector:getChildByPath(panel_sx, "txt_base_new")

        -------------新增有两个属性的显示内容（白虎阵法）---------
        local panel_sx1      = TFDirector:getChildByPath(panel_2sx, "panel_sx1")
        bg.img_to1           = TFDirector:getChildByPath(panel_sx1, "img_to_1")
        bg.txt_attrName_new_1     = TFDirector:getChildByPath(panel_sx1, "lbl_base")
        bg.txt_currValue_new_1    = TFDirector:getChildByPath(panel_sx1, "txt_base_current")
        bg.txt_nextValue_new_1    = TFDirector:getChildByPath(panel_sx1, "txt_base_new")

        local panel_sx2      = TFDirector:getChildByPath(panel_2sx, "panel_sx2")
        bg.img_to2           = TFDirector:getChildByPath(panel_sx2, "img_to_1")
        bg.txt_attrName_new_2     = TFDirector:getChildByPath(panel_sx2, "lbl_base")
        bg.txt_currValue_new_2    = TFDirector:getChildByPath(panel_sx2, "txt_base_current")
        bg.txt_nextValue_new_2    = TFDirector:getChildByPath(panel_sx2, "txt_base_new")
        
        bg.img_xz           = TFDirector:getChildByPath(bg, "img_xz")
        bg.img_zhenyan      = TFDirector:getChildByPath(bg, "img_zhenyan")
        bg.img_xz:setVisible(false)
        bg.index            = i
        self.zheWeiList[i]  = bg
    end
    ---------------------------------------中心阵位---------------------
    self.img_di = TFDirector:getChildByPath(ui, "img_di")
    self.btn_hole = {}
    for i = 1, 9 do
        self.btn_hole[i] = TFDirector:getChildByPath(self.img_di, "btn_zy" .. i)
        self.btn_hole[i]:setVisible(false)

    end

    self.oldZhenWeiIndex    = 1
    self.currLevel          = 1
    self.shenYanInfo         = {}
end

function ZhenfaShenyanLayer:refreshUI()
    self.item = StrategyCardManager:getStrategyCardByGmid(self.gmId)
    self.cardInfo = StrategyCardManager:getStrategyCardByGmid(self.gmId)
    --print("阵法card信息",self.cardInfo)
    self:initShenYanInfo()

    for i,v in ipairs(self.zheWeiList) do
        self:refreshZheWeiUIAttr(i)
    end
    self:refreshZheWeiUIAttr(self.oldZhenWeiIndex)
    self:refreshAttr()
    
    self:selectZheWei(self.oldZhenWeiIndex)
end

--深研信息
function ZhenfaShenyanLayer:initShenYanInfo(index, isNew)
    if (index == nil) then
        local info = StrategyCardManager:getStrategyCardByGmid(self.gmId)
        for i=1, #info.researchInfo do
            if (self.item) then
                local levelInfo = self.item:getShenYanInfo(i)
                --2星解锁深研,最大等级初始100级,每升1星加20级
                self.maxLevel       = 100 + (info.starLevel - 2) * 20 or 0
                self.currLevel      = levelInfo.level or 0
            else
                self.currLevel      = 0
                self.maxLevel       = 0
            end
            self.shenYanInfo[i] = {}
            self.shenYanInfo[i].maxLevel    = self.maxLevel
            self.shenYanInfo[i].currLevel   = self.currLevel
            self.shenYanInfo[i].oldLevel    = self.currLevel

        end
    elseif (isNew ~= true and self.shenYanInfo[index]) then
        self.maxLevel       = self.shenYanInfo[index].maxLevel
        self.currLevel      = self.shenYanInfo[index].currLevel
    else
        if (self.item) then
            local info = StrategyCardManager:getStrategyCardByGmid(self.gmId)
            local levelInfo = self.item:getShenYanInfo(index)
            self.maxLevel       = 100 + (info.starLevel - 2) * 20 or 0
            self.currLevel      = levelInfo.level or 0
        else
            self.currLevel      = 0
            self.maxLevel       = 0
        end
        self.shenYanInfo[index] = self.shenYanInfo[index] or {}
        self.shenYanInfo[index].maxLevel    = self.maxLevel
        self.shenYanInfo[index].currLevel   = self.currLevel
        if (isNew) then
            if (self.shenYanInfo[index].oldLevel < self.currLevel) then
                self:refreshAttr()
            end
        end
        self.shenYanInfo[index].oldLevel    = self.currLevel
    end
end

--阵位
function ZhenfaShenyanLayer:refreshZhenwei()
    for i,v in ipairs(self.btn_hole) do
        v:setVisible(false)
    end
 
    local strategyPos   = self.item:getSrategyPos()
    local posNumber     = self.item:getOpenPositionNumber()
    for k, v in pairs(strategyPos) do
        if v <= posNumber then
            self.btn_hole[k]:setVisible(true) 
            self.btn_hole[k]:setTextureNormal("ui_new/zhenfa/img_" .. v .. ".png")
            self.btn_hole[k]:setTexturePressed("ui_new/zhenfa/img_" .. (tonumber(v) + 3) .. ".png")
            self.btn_hole[k]:setTouchEnabled(true)
            self.btn_hole[k].logic = self
            self.btn_hole[k].index = v
            self.btn_hole[k]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZhwWeiClickHandle), 1)
       end
    end
end
--阵位点击回调
function ZhenfaShenyanLayer.onZhwWeiClickHandle( btn )
    local self = btn.logic
    self:selectZheWei(btn.index)
    
end

--选择阵法位按钮回调
function ZhenfaShenyanLayer:selectZheWei(index)
    index = tonumber(index)
    local bg =  self.zheWeiList[index]
    local img = "ui_new/zhenfa/img_"--4.png"
    if (self.oldZhenWeiIndex ~= index) then
        local oldBg =  self.zheWeiList[self.oldZhenWeiIndex]
        if (oldBg) then
            oldBg.img_zhenyan:setTexture(img..(self.oldZhenWeiIndex)..".png")
            oldBg.img_xz:setVisible(false)
            oldBg:setTouchEnabled(true)
        end
    end
    self.oldZhenWeiIndex = index

    if (bg) then
        bg.img_xz:setVisible(true)
        bg:setTouchEnabled(false)
        
        self:initShenYanInfo(index)
        self:refreshZheWeiUIAttr(index)


        self.img_zhenyan:setTexture(img..(index + 3)..".png")
        bg.img_zhenyan:setTexture(img..(index + 3)..".png")
    end
    self:zheWeiMaxLevel()
end

--单条到达上限
function ZhenfaShenyanLayer:zheWeiMaxLevel()
    self.btn_shenyan:setGrayEnabled(false)
    self.btn_shenyan:setTouchEnabled(true)
    self.btn_tool:setVisible(true)
    -- 单条到达上限
    if (self.shenYanInfo[self.oldZhenWeiIndex].currLevel >= self.ShenYanMaxLevel) then
        self.btn_shenyan:setGrayEnabled(true)
        self.btn_shenyan:setTouchEnabled(false)
        self.btn_tool:setVisible(false)
    end
end

-- 等级加成信息(等表)
function ZhenfaShenyanLayer:refreshZheWeiUIAttr(index)
    
    index = index or self.oldZhenWeiIndex

    local attrList = BattleArrayStarData:getDeduceInfo(self.item.id, self.item:getStarLevel())
    local posNumber     = self.item:getOpenPositionNumber()
    local bg =  self.zheWeiList[index]
    if (bg) then
        if (index <= posNumber) then

            local levelInfo = self.item:getShenYanInfo(index)
            self.currLevel = levelInfo.level
            bg:setVisible(true)
            bg.txt_level:setText(stringUtils.format(localizable.ZheFa_TuiYan_Lv, levelInfo.level))
            -- 强化等级和上限
            self.txt_level:setText("Lv."..levelInfo.level)
            self.txt_maxLevel:setText("/"..self.maxLevel)   

            local addStr = stringUtils.format("+{p1}%",levelInfo.add)
            local nextAddStr = stringUtils.format("+{p1}%",levelInfo.nextAdd)
            local attr = attrList[index]
            if #attr<=1 then 
                local attrTbl = stringToNumberTable(attr[1],"_")
                bg.panel_sx:setVisible(true)
                bg.panel_2sx:setVisible(false)

                bg.txt_currValue:setText(addStr)
                bg.txt_attrName:setText(AttributeTypeStr[attrTbl[1]])
                bg.txt_nextValue:setText(nextAddStr)
                if (levelInfo.level >= self.ShenYanMaxLevel) then
                    bg.txt_nextValue:setVisible(false)
                    bg.img_to:setVisible(false)
                end
            else
                bg.panel_sx:setVisible(false)
                bg.panel_2sx:setVisible(true)

                local attrTbl = stringToNumberTable(attr[1],"_")
                bg.txt_currValue_new_1:setText(addStr)
                bg.txt_attrName_new_1:setText(AttributeTypeStr[ attrTbl[1]])
                bg.txt_nextValue_new_1:setText(nextAddStr)

                attrTbl = stringToNumberTable(attr[2],"_")
                bg.txt_currValue_new_2:setText(addStr)
                bg.txt_attrName_new_2:setText(AttributeTypeStr[ attrTbl[1]])
                bg.txt_nextValue_new_2:setText(nextAddStr)
                if (levelInfo.level >= self.ShenYanMaxLevel) then
                    bg.txt_nextValue_new_1:setVisible(false)
                    bg.txt_nextValue_new_2:setVisible(false)
                    bg.img_to1:setVisible(false)
                    bg.img_to2:setVisible(false)
                end
            end
            -- bg.txt_currValue:setText("+"..levelInfo.add.."%")
            -- bg.txt_attrName:setText(AttributeTypeStr[tonumber(attr[1])])

            -- bg.txt_nextValue:setText("+"..levelInfo.nextAdd.."%")


        else
            bg:setVisible(false)
        end
    end 

    for i,v in ipairs(self.btn_hole) do
        v:setVisible(false)
    end
    local strategyPos   = self.item:getSrategyPos()
    
    for k, v in pairs(strategyPos) do
        if v <= posNumber then
            self.btn_hole[k]:setVisible(true) 
            if (index == v) then
                self.btn_hole[k]:setTextureNormal("ui_new/zhenfa/img_" .. (tonumber(v) + 3) .. ".png")
            else
                self.btn_hole[k]:setTextureNormal("ui_new/zhenfa/img_" .. v .. ".png")
            end
            
            self.btn_hole[k]:setTexturePressed("ui_new/zhenfa/img_" .. (tonumber(v) + 3) .. ".png")
            self.btn_hole[k]:setTouchEnabled(true)
            self.btn_hole[k].logic = self
            self.btn_hole[k].index = v
            self.btn_hole[k]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZhwWeiClickHandle), 1)
       end
    end

    --深研消耗道具
    local myQuality = self.cardInfo:getQuality()
    local field = math.ceil(self.currLevel / 20)
    if (self.currLevel % 20 == 0 and self.currLevel ~= 0 and self.currLevel ~= 160) then
        field = field + 1
    end
    if (field == 0) then field = 1 end
    self.commonReward = BattleArrayResearchData:getShenYanGoodsInfo(myQuality,field) 
    local goodsInfo = BaseDataManager:getReward(self.commonReward)
    self.btn_tool:setTextureNormal(GetColorIconByQuality_118(myQuality))
    self.img_tool:setTexture(goodsInfo.path)
    local costGoods = BagManager:getItemById( goodsInfo.itemid )
    local costNum = 0
    if (costGoods) then
        costNum = costGoods.num
    end
    self.txt_toolNum:setText(costNum.."/"..self.commonReward.number)

end

-- 显示相关信息和总特效信息
function ZhenfaShenyanLayer:refreshAttr()
    self.txt_next_2:setVisible(true)
    
    --相关等级信息

    self.txt_tips1:setText(stringUtils.format(localizable.ZheFa_ShenYan_tip1, self.maxLevel - 100))
    local zhanFaStar = StrategyCardManager:getStrategyCardByGmid(self.gmId).starLevel
    if (zhanFaStar == 5) then
        self.txt_tips2:setText(localizable.ZheFa_ShenYan_tip7)
        self.txt_tips3:setVisible(false)
        self.img_effect_di:setVisible(false)
    elseif (zhanFaStar < 5 and zhanFaStar >= 2) then
        -- 2星解锁深研,所以基础从2开始,每升1星最大深研提升20级
        local nextMaxLevel = 100 + (zhanFaStar - 1) * 20
        self.txt_tips2:setText(stringUtils.format(localizable.ZheFa_ShenYan_tip2, zhanFaStar + 1))
        self.txt_tips3:setText(stringUtils.format(localizable.ZheFa_ShenYan_tip3, nextMaxLevel))
    end

    local cardInfo = BattleArrayStarData:getItemInfo(self.cardInfo.id, self.cardInfo.starLevel)
    local levelSum = 0
    for i = 1, #self.shenYanInfo, 1 do 
        levelSum = self.shenYanInfo[i].currLevel + levelSum
    end
    local curEffectSum, curBeEffectSum = BattleArrayResearchExtraData:getShenYanSumEffect(self.cardInfo.id, levelSum)
    
    --等级
    local nextEffectInfo = BattleArrayResearchExtraData:getShenYanEffect(self.cardInfo.id, levelSum) 
    --当前等级效果
    local effectInfo = self.item:getZhenWeiSpecialAdd()  
    local effectAttrStr = StrategyCardManager:zhenWeiSpecialAddStr(nextEffectInfo.desc, effectInfo)
    self.txt_dac2:setText(effectAttrStr)

    -- --已经到达上限
    if (nextEffectInfo.progress_total <= levelSum) then
        self.txt_next_2:setVisible(false)
        self.txt_nextHurtDerate2:setText(localizable.ZheFa_ShenYan_tip5)
        return
    end
    local str = stringUtils.format(localizable.ZheFa_ShenYan_tip6, nextEffectInfo.progress_total, levelSum, nextEffectInfo.progress_total)
    self.txt_next_2:setText(str)

    --下一阶段效果   
    local nextAttStr = ""
    local effectTbl = ""
    if (nextEffectInfo.effect_active ~= "") then 
        effectTbl = string.split(nextEffectInfo.effect_active, '|')       
    elseif (nextEffectInfo.effect_passive ~= "") then
        effectTbl = string.split(nextEffectInfo.effect_passive, '|')
    end

    local nextEffect = clone(effectInfo)
    local index = 1
    for k,v in pairs(effectInfo) do     
        if(effectTbl[index]) then
            local effectArr = string.split(effectTbl[index], '_')
            local idx = tonumber(effectArr[1])
            nextEffect[idx] = tonumber(effectArr[2]) + nextEffect[idx]
        end
        index = index + 1
    end
    nextAttStr = StrategyCardManager:zhenWeiSpecialAddStr(nextEffectInfo.desc, nextEffect)
    self.txt_nextHurtDerate2:setText(nextAttStr)
end

--深研按钮回调
function ZhenfaShenyanLayer.onBtnClickHandle( btn )
    local self = btn.logic

    if (self.item == nil) then
        return
    end
    if (self.shenYanInfo[self.oldZhenWeiIndex] and self.shenYanInfo[self.oldZhenWeiIndex].currLevel >= self.shenYanInfo[self.oldZhenWeiIndex].maxLevel) then
        toastMessage(localizable.ZheFa_ShenYan_tip5)
        return
    end
    local costGoods = BagManager:getItemById( self.commonReward.itemId )
    local costNum = 0
    if(costGoods) then
        costNum = costGoods.num
    end
    if (costNum < self.commonReward.number) then
        toastMessage(localizable.ZheFa_ShenYan_tip8)
        return
    end
    if (self.item and (self.item:getStarLevel() < 2)) then
        toastMessage(stringUtils.format(localizable.ZheFa_ShenYan_Open))
        return
    end

    StrategyCardManager.selectPos = self.oldZhenWeiIndex
    local Msg = {
        self.gmId,
        self.oldZhenWeiIndex
    }
    StrategyCardManager:sendShenYanMsg(Msg)
end

function ZhenfaShenyanLayer.onGoodsBtnClick( btn )
    local self = btn.logic
    Public:ShowItemTipLayer(self.commonReward.itemId, 1)
end

function ZhenfaShenyanLayer:setEquipGmId(gmId)
    self.gmId = gmId
    self:refreshUI()
    self:selectZheWei(1)
end

function ZhenfaShenyanLayer:removeUI()
   	self.super.removeUI(self)  
end

function ZhenfaShenyanLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function ZhenfaShenyanLayer:registerEvents()
	self.super.registerEvents(self)

    self.btn_shenyan.logic   = self
    self.btn_shenyan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClickHandle), 1)
    self.btn_tool:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGoodsBtnClick), 1)

    for i,bg in ipairs(self.zheWeiList) do
        bg:setTouchEnabled(true)
        bg.logic = self
        bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZhwWeiClickHandle), 1)
    end

    local onDeduceCallBack = function(event)
        self:refreshZheWeiUIAttr(self.oldZhenWeiIndex)
        self:initShenYanInfo(self.oldZhenWeiIndex, true)   
        self:refreshAttr()   
        self:playNewLevelEffect()
    end
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, onDeduceCallBack)
end

function ZhenfaShenyanLayer:removeEvents()
	self.super.removeEvents(self)


    TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, onDeduceCallBack)
end


function ZhenfaShenyanLayer:dispose()
    self.super.dispose(self)
end

-- 特效
function ZhenfaShenyanLayer:playNewLevelEffect()

    if (self.zhenWeiEffect) then
        self.zhenWeiEffect:removeFromParent()
        self.zhenWeiEffect = nil
    end
    local bg = self.zheWeiList[self.oldZhenWeiIndex]
    if (bg) then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
        local effect = TFArmature:create("equipIntensify_3_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 0)
        local size = bg:getSize()
        effect:setPosition(ccp(0, -187.5))
        effect:setScaleY(4)
        effect:setScaleX(1.45)
        bg:addChild(effect, 0)
        self.zhenWeiEffect = effect
        effect:addMEListener(TFARMATURE_COMPLETE, function ()
            self.zhenWeiEffect:removeFromParent()
            self.zhenWeiEffect = nil
        end)
    end


    if (self.equipEffect) then
        self.equipEffect:removeFromParent()
        self.equipEffect = nil
    end
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/equiIntensify.xml")
    local effect = TFArmature:create("equiIntensify_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    
    if (self.item == nil) then
        return
    end
    local strategyPos   = self.item:getSrategyPos()
    local img_icon      = nil
    for k, v in pairs(strategyPos) do
        if (self.btn_hole[k].index == self.oldZhenWeiIndex) then
            img_icon = self.btn_hole[k]
            break
        end
    end
    if (img_icon == nil) then
        return
    end
    effect:playByIndex(0, -1, -1, 0)
    effect:setPosition(ccp(223, -67))
    effect:setScale(0.75)
    effect:setZOrder(100)
    img_icon:addChild(effect)
    effect:addMEListener(TFARMATURE_COMPLETE, function ()
        self.equipEffect:removeFromParent()
        self.equipEffect = nil
    end)
    self.equipEffect = effect
    
end

return ZhenfaShenyanLayer