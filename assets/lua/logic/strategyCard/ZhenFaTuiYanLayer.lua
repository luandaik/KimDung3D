-- client side ZhenFaTuiYanLayer.lua
--[[
 * @Description: 阵法推演界面
 ]]
-- script writer fei
-- creation time 2017-01-07

local ZhenFaTuiYanLayer = class("ZhenFaTuiYanLayer", BaseLayer)
ZhenWei_Img = {"ui_new/zhenfa/img_4.png", "ui_new/zhenfa/img_5.png", "ui_new/zhenfa/img_6.png"}
function ZhenFaTuiYanLayer:ctor(gmId)
    self.super.ctor(self, data)
    self.gmId = gmId
    self:init("lua.uiconfig_mango_new.zhenfa.ZhenFaTuiYan")
end

function ZhenFaTuiYanLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.costList = {}
    self.img_zhenyan    = TFDirector:getChildByPath(ui, 'img_currzhenyan')
    self.txt_level      = TFDirector:getChildByPath(ui, 'txt_qianghua1')
    self.txt_exp        = TFDirector:getChildByPath(ui, 'txt_shuzhi')
    self.txt_maxLevel   = TFDirector:getChildByPath(self.txt_level, 'txt_qianghua2')
    self.bar_exp        = TFDirector:getChildByPath(ui, 'bar_jindu')
    self.btn_tuiyan     = TFDirector:getChildByPath(ui, 'btn_tuiyan')
    self.txt_tips3      = TFDirector:getChildByPath(ui, 'txt_nextHurtDerate')
    self.txt_tips1      = TFDirector:getChildByPath(ui, 'txt_dac')
    local txt_tips2     = TFDirector:getChildByPath(ui, 'txt_next_1')
    self.txt_tips2 = self:creatRichTextHB(txt_tips2)
    txt_tips2:setVisible(false)
    for i = 1, 3 do
        local btn_tool      = TFDirector:getChildByPath(ui, "btn_tool"..i)
        btn_tool.img_tool   = TFDirector:getChildByPath(btn_tool, "img_tool"..i)
        btn_tool.txt_num    = TFDirector:getChildByPath(btn_tool, "txt_num"..i)
        btn_tool.txt_exp    = TFDirector:getChildByPath(ui, "txt_number"..i)
        self.costList[i]    = btn_tool
    end

    self.zheWeiList = {}
    for i = 1, 3 do
        local bg            = TFDirector:getChildByPath(ui, "bg_"..i)
        local panel_sx      = TFDirector:getChildByPath(bg, "panel_sx")
        local panel_2sx      = TFDirector:getChildByPath(bg, "panel_2sx")
        bg.panel_sx=panel_sx
        bg.panel_2sx=panel_2sx
        bg.txt_level        = TFDirector:getChildByPath(bg, "txt_battletime")

        bg.txt_attrName     = TFDirector:getChildByPath(panel_sx, "lbl_base")
        bg.txt_currValue    = TFDirector:getChildByPath(panel_sx, "txt_base_current")
        bg.txt_nextValue    = TFDirector:getChildByPath(panel_sx, "txt_base_new")

        -------------新增有两个属性的显示内容（白虎阵法）---------
        local panel_sx1      = TFDirector:getChildByPath(panel_2sx, "panel_sx1")
        bg.txt_attrName_new_1     = TFDirector:getChildByPath(panel_sx1, "lbl_base")
        bg.txt_currValue_new_1    = TFDirector:getChildByPath(panel_sx1, "txt_base_current")
        bg.txt_nextValue_new_1    = TFDirector:getChildByPath(panel_sx1, "txt_base_new")

        local panel_sx2      = TFDirector:getChildByPath(panel_2sx, "panel_sx2")
        bg.txt_attrName_new_2     = TFDirector:getChildByPath(panel_sx2, "lbl_base")
        bg.txt_currValue_new_2    = TFDirector:getChildByPath(panel_sx2, "txt_base_current")
        bg.txt_nextValue_new_2    = TFDirector:getChildByPath(panel_sx2, "txt_base_new")
        
        bg.img_xz           = TFDirector:getChildByPath(bg, "img_xz")
        bg.img_zhenyan      = TFDirector:getChildByPath(bg, "img_zhenyan")
        bg.img_xz:setVisible(false)
        bg.index            = i
        self.zheWeiList[i]  = bg
    end

    --中心阵位
    self.img_di = TFDirector:getChildByPath(ui, "img_di")
    self.btn_hole = {}
    for i = 1, 9 do
        self.btn_hole[i] = TFDirector:getChildByPath(self.img_di, "btn_zy" .. i)
        self.btn_hole[i]:setVisible(false)

    end
    self.oldZhenWeiIndex    = 1
    self.currLevel          = 1
    self.costItemNum        = 0
    self.deduceInfo         = {}
    self.deduceOpenLevel    = tonumber(ConstantData:objectByID("DeduceFunctionOpen").value) or 0
end

function ZhenFaTuiYanLayer:onShow()
	self.super.onShow(self)
    self:refreshUI()
end

function ZhenFaTuiYanLayer:refreshUI()
    print("-----------ZhenFaTuiYanLayer:refreshUI()--------------", self.gmId)
    self.item = StrategyCardManager:getStrategyCardByGmid(self.gmId)
    self:initDeduceInfo()
    self:refreshCostListUI()

    for i,v in ipairs(self.zheWeiList) do
        self:refreshZheWeiUIAttr(i)
    end

    self:refreshZheWeiUIAttr(self.oldZhenWeiIndex)
    self:refreshExpUI()
    self:refreshAttr()
    self:selectZheWei(self.oldZhenWeiIndex)
end
function ZhenFaTuiYanLayer:setEquipGmId(gmId)
    self.gmId = gmId
    self:refreshUI()
    self:selectZheWei(1)
end
function ZhenFaTuiYanLayer:initDeduceInfo(index, isNew)
    if (index == nil) then
        for i=1, StrategyCardManager.extAttributeMax do
            if (self.item) then
                local info = StrategyCardManager:getByExpLevel((self.item:getDeduceExp(i) or 0), self.item.quality)
                self.maxLevel       = info[2] or 0
                self.currLevel      = info[1] or 0
            else
                self.currLevel      = 0
                self.maxLevel       = 0
            end
            self.deduceInfo[i] = {}
            self.deduceInfo[i].maxLevel    = self.maxLevel
            self.deduceInfo[i].currLevel   = self.currLevel
            self.deduceInfo[i].oldLevel    = self.currLevel
        end
    elseif (isNew ~= true and self.deduceInfo[index]) then
        self.maxLevel       = self.deduceInfo[index].maxLevel
        self.currLevel      = self.deduceInfo[index].currLevel
    else
        if (self.item) then
            local info = StrategyCardManager:getByExpLevel((self.item:getDeduceExp(self.oldZhenWeiIndex) or 0), self.item.quality)
            self.maxLevel       = info[2] or 0
            self.currLevel      = info[1] or 0
        else
            self.currLevel      = 0
            self.maxLevel       = 0
        end
        self.deduceInfo[index] = self.deduceInfo[index] or {}
        self.deduceInfo[index].maxLevel    = self.maxLevel
        self.deduceInfo[index].currLevel   = self.currLevel
        if (isNew) then
            if (self.deduceInfo[index].oldLevel < self.currLevel) then
                self:playNewLevelEffect()
            end
        end
        self.deduceInfo[index].oldLevel    = self.currLevel
    end
end
function ZhenFaTuiYanLayer:refreshZheWeiUIAttr(index)
    index = index or self.oldZhenWeiIndex
    local attrList = BattleArrayStarData:getDeduceInfo(self.item.id, self.item:getStarLevel())
    local posNumber     = self.item:getOpenPositionNumber()
    local bg =  self.zheWeiList[index]
    if (bg) then
        if (index <= posNumber) then
            bg:setVisible(true)
            local currLevel = self.deduceInfo[index].currLevel
            bg.txt_level:setText(stringUtils.format(localizable.ZheFa_TuiYan_Lv, currLevel))
            local attr = attrList[index]
            if #attr<=1 then 
                local attrTbl = stringToNumberTable(attr[1],"_")
                bg.panel_sx:setVisible(true)
                bg.panel_2sx:setVisible(false)
                local attrValue = attrTbl[2]
                local num = attrValue * currLevel
                bg.txt_currValue:setText("+"..(num))
                bg.txt_attrName:setText(AttributeTypeStr[attrTbl[1]])
                --
                --bg.txt_nextValue:setVisible(currLevel < self.deduceInfo[index].maxLevel)
                bg.txt_nextValue:setText("+"..(attrValue * (currLevel + 1)))
            else
                bg.panel_sx:setVisible(false)
                bg.panel_2sx:setVisible(true)

                local attrTbl = stringToNumberTable(attr[1],"_")
                bg.txt_currValue_new_1:setText("+"..( attrTbl[2] * currLevel ))
                bg.txt_attrName_new_1:setText(AttributeTypeStr[ attrTbl[1] ])
                bg.txt_nextValue_new_1:setText("+"..( attrTbl[2] * (currLevel + 1) ))

                attrTbl = stringToNumberTable(attr[2],"_")
                bg.txt_currValue_new_2:setText("+"..( attrTbl[2] * currLevel ))
                bg.txt_attrName_new_2:setText(AttributeTypeStr[ attrTbl[1] ])
                bg.txt_nextValue_new_2:setText("+"..( attrTbl[2] * (currLevel + 1) ))
            end
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
end

function ZhenFaTuiYanLayer:refreshCostListUI()
    local costItemList = StrategyCardManager:getDeduceConsumesData()
    for i,btn_tool in ipairs(self.costList) do
        local itemId    = tonumber(costItemList[i].goods_id)
        local itemInfo  = ItemData:objectByID(itemId)
        if (itemInfo) then
            btn_tool:setTextureNormal(GetColorIconByQuality(itemInfo.quality))
            btn_tool.img_tool:setTexture(itemInfo:GetPath())
        end
        local bagInfo = BagManager:getItemById(itemId)
        local itemNum = 0
        if (bagInfo) then
            itemNum = bagInfo.num
        end
        btn_tool.txt_num:setText(itemNum)
        btn_tool.txt_exp:setText(stringUtils.format(localizable.ZheFa_TuiYan_Add_Exp, costItemList[i].exp))
        btn_tool.itemId = itemId
        btn_tool.exp    = costItemList[i].exp
    end
end

function ZhenFaTuiYanLayer:refreshExpUI(exp)
    self.txt_level:setText("Lv"..self.currLevel)
    self.txt_maxLevel:setText("/"..self.maxLevel)
    local currExp   = self.item:getDeduceExp(self.oldZhenWeiIndex) or 0
    if (exp) then
        currExp = currExp + exp
    end
    local levelExp  = StrategyCardManager:getDeduceExp(self.currLevel, self.item.quality)
    local diffExp   = (currExp - levelExp)
  
    local nextExp = 0
    if (self.currLevel < self.maxLevel) then
        nextExp = StrategyCardManager:getDeduceExp(self.currLevel + 1, self.item.quality)
    end
    local exp_2 = nextExp - levelExp
    self.txt_exp:setText(diffExp.."/"..exp_2)
    self.bar_exp:setPercent( diffExp / exp_2 * 100)
    self.bar_exp.diffExp = (exp_2 - diffExp)
    self.currExp    = currExp
    self.nextExp    = nextExp
end

function ZhenFaTuiYanLayer:refreshZhenwei()
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
function ZhenFaTuiYanLayer:refreshAttr()
    local levelList = {}
    for i,v in ipairs(self.deduceInfo) do
        levelList[i] = v.currLevel
    end
    local info = StrategyCardManager:getAddDeduceConditionValue(self.item.quality, levelList)
    local addValue = info[1]
    local nextInfo = info[2]
    self.txt_tips1:setText(stringUtils.format(localizable.ZheFa_TuiYan_tips1, addValue))
    if (nextInfo) then
        self.txt_tips2:setVisible(true)
        self.txt_tips3:setVisible(true)
        local count = 0
        for i,level in ipairs(levelList) do
            if (level >= nextInfo.level) then
                count = count + 1
            end
        end
        --self.txt_tips2:setText(stringUtils.format(localizable.ZheFa_TuiYan_tips2, nextInfo.count, nextInfo.level, count, nextInfo.count))
        self.txt_tips3:setText(stringUtils.format(localizable.ZheFa_TuiYan_tips3, nextInfo.value))
        local str1  = stringUtils.format(localizable.ZheFa_TuiYan_tips2, nextInfo.count, nextInfo.level)
        local str2  = [[<font color="#FF0000" fontSize = "16">]]
        str2 = str2 .. count .. [[</font>]]
        local str3  = "/"..nextInfo.count..")"
        self.txt_tips2:setText(self:getRichText(str1, str2, str3))
    else
        self.txt_tips2:setVisible(false)
        self.txt_tips3:setVisible(false)
    end
    
end
function ZhenFaTuiYanLayer:removeUI()
	self.super.removeUI(self)
end

function ZhenFaTuiYanLayer:registerEvents()
	self.super.registerEvents(self)
    for i,btn_tool in ipairs(self.costList) do
        btn_tool.logic = self
        btn_tool:addMEListener(TFWIDGET_TOUCHBEGAN, audioClickfun(self.onTouchBegin))
        btn_tool:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onDeduceClickHandle), 1)
    end
    for i,bg in ipairs(self.zheWeiList) do
        bg:setTouchEnabled(true)
        bg.logic = self
        bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZhwWeiClickHandle), 1)
    end
   
    self.btn_tuiyan.logic   = self
    self.btn_tuiyan.oneKey  = true
    self.btn_tuiyan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onDeduceClickHandle), 1)
    
    self.onDeduceCallBack = function(event)
        self:initDeduceInfo(self.oldZhenWeiIndex, true)
        self:refreshZheWeiUIAttr(self.oldZhenWeiIndex)
        self:refreshExpUI()
        self:refreshCostListUI()
        self:refreshAttr()
    end
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onDeduceCallBack)
    
end

function ZhenFaTuiYanLayer.onTouchBegin( btn )
    local self = btn.logic
    
    if (self.item == nil) then
        return
    end
    if (self.deduceInfo[self.oldZhenWeiIndex] and self.deduceInfo[self.oldZhenWeiIndex].currLevel >= self.deduceInfo[self.oldZhenWeiIndex].maxLevel) then
        toastMessage(localizable.ZheFa_TuiYan_tips5)
        return
    end
    if (self.item and (self.item:getLevel() < self.deduceOpenLevel)) then
        btn.isTips = true
        toastMessage(stringUtils.format(localizable.ZheFa_TuiYan_Open, self.deduceOpenLevel))
        return
    end
    btn.isTips = false
    btn.costItemNum = 1
    local itemNum = 0
    local bagInfo = BagManager:getItemById(btn.itemId)
    if (bagInfo) then
        itemNum = bagInfo.num
    end
    if (itemNum <= 0) then
        toastMessage(localizable.ZheFa_TuiYan_tips4)
        btn.isSend = true
        return
    end
    btn.isSend = false
    self:showFlyBegin(btn)
    self.delayLongTouchTimer = TFDirector:addTimer(300, -1, nil,
        function ()
            if self.delayLongTouchTimer then
                TFDirector:removeTimer(self.delayLongTouchTimer)
                self.delayLongTouchTimer = nil
            end
            self.touchLongTimer = TFDirector:addTimer(66, -1, nil,
                function ()
                    
                    local addExp = btn.costItemNum * btn.exp
                    self:refreshExpUI(addExp)
                    if ((self.currExp >= self.nextExp)) then
                        self:deleteTouch()
                        self.onDeduceClickHandle( btn )
                        return
                    else
                        self:showFlyBegin(btn)
                    end
                    --
                    btn.costItemNum = btn.costItemNum + 1
                    if (btn.costItemNum > itemNum) then
                        btn.costItemNum = btn.costItemNum - 1
                        self:deleteTouch()
                        self.onDeduceClickHandle( btn )
                    end
                end)
        end)    
    
end

function ZhenFaTuiYanLayer:deleteTouch()
    if self.delayLongTouchTimer then
        TFDirector:removeTimer(self.delayLongTouchTimer)
        self.delayLongTouchTimer = nil
    end
    if self.touchLongTimer then
        TFDirector:removeTimer(self.touchLongTimer)
        self.touchLongTimer = nil
    end
end
function ZhenFaTuiYanLayer.onDeduceClickHandle( btn )
    local self = btn.logic
   
    local costItemNum   = tonumber(btn.costItemNum) or 0
    local itemId        = tonumber(btn.itemId)
    self:deleteTouch()
    print("  消耗物品ID  ", itemId, "   ", costItemNum)
    if (self.item == nil) then
        return
    end
    if (self.deduceInfo[self.oldZhenWeiIndex] and self.deduceInfo[self.oldZhenWeiIndex].currLevel >= self.deduceInfo[self.oldZhenWeiIndex].maxLevel) then
            toastMessage(localizable.ZheFa_TuiYan_tips5)
            return
        end
    if (self.item and (self.item:getLevel() < self.deduceOpenLevel)) then
        if (btn.isTips ~= true) then
            toastMessage(stringUtils.format(localizable.ZheFa_TuiYan_Open, self.deduceOpenLevel))
        end
        btn.isTips = false
        return
    end
    local itemIds   = {}
    local itemNums  = {}
    if (btn.oneKey) then
        local diffExp       = self.bar_exp.diffExp
        local costItemList  = StrategyCardManager:getDeduceConsumesData()
        local addExp = self.currExp or 0
        for i,v in ipairs(costItemList) do
            local id        = tonumber(v.goods_id)
            local bagInfo   = BagManager:getItemById(id)
            if (bagInfo) then
                local isUp = false
                local itemNum = bagInfo.num
                if (itemNum >= 0) then
                    local addNum = 0
                    for i=1,itemNum do
                        addExp = addExp + v.exp
                        addNum = addNum + 1
                        if (addExp >= self.nextExp) then
                            isUp = true
                            break
                        end
                    end
                    table.insert(itemIds, id)
                    table.insert(itemNums, addNum)
                    if (isUp) then
                        break
                    end
                end
            end
        end
    else
        if (btn.isSend) then
            return
        end
        btn.isSend = true
        local bagInfo = BagManager:getItemById(itemId)
        if (bagInfo) then
            if (bagInfo.num < costItemNum) then
                toastMessage(localizable.ZheFa_TuiYan_tips4)
                return
            end
        else
            toastMessage(localizable.ZheFa_TuiYan_tips4)
            return
        end
        itemIds     = {itemId}
        itemNums    = {costItemNum}
    end

    local sendItemIdList = {}
    local sendItemNumList = {}
    for i,id in ipairs(itemIds) do
        local bagInfo = BagManager:getItemById(id)
        local itemNum = tonumber(itemNums[i])
        if (bagInfo and bagInfo.num > 0 and itemNum >= 0 and (bagInfo.num >= itemNum)) then
            table.insert(sendItemIdList, id)
            table.insert(sendItemNumList, itemNum)
        end
    end
    if (sendItemIdList[1] == nil or sendItemNumList[1] == nil) then
        toastMessage(localizable.ZheFa_TuiYan_tips4)
        return
    end
    StrategyCardManager:sendDeduceMsg(self.gmId, sendItemIdList, sendItemNumList, self.oldZhenWeiIndex)
end

--阵位
function ZhenFaTuiYanLayer.onZhwWeiClickHandle( btn )
    local self = btn.logic
    self:selectZheWei(btn.index)
    
end

function ZhenFaTuiYanLayer:selectZheWei(index)
   -- print(self.oldZhenWeiIndex,"index  ",index)
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
        
        self:initDeduceInfo(index)
        self:refreshExpUI()
        self:refreshZheWeiUIAttr(index)

        self.img_zhenyan:setTexture(img..(index + 3)..".png")
        bg.img_zhenyan:setTexture(img..(index + 3)..".png")
    end
    
end

function ZhenFaTuiYanLayer:playNewLevelEffect()

    if not self.barLevelUpEffect then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
        local effect = TFArmature:create("equipIntensify_3_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 0)
        local size = self.bar_exp:getSize()
        effect:setPosition(ccp(-size.width / 2, -60))
        effect:setScaleX(1.25)
        self.bar_exp:addChild(effect,100)
        self.barLevelUpEffect = effect
        effect:addMEListener(TFARMATURE_COMPLETE, function ()
            self.barLevelUpEffect:removeFromParent()
            self.barLevelUpEffect = nil
        end)
    end

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

function ZhenFaTuiYanLayer:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onDeduceCallBack)
    self.onDeduceCallBack = nil
end
function ZhenFaTuiYanLayer:creatRichTextHB(_txt, fontSize)
    fontSize = fontSize or 16
    local text  = TFRichText:create(CCSizeMake(500, 20));
    text:setFontSize(fontSize)
    text:setPosition(_txt:getPosition())
    text:setAnchorPoint(_txt:getAnchorPoint())
    _txt:getParent():addChild(text, _txt:getZOrder())
    return text
end
function ZhenFaTuiYanLayer:getRichText(str_1, str_2, str_3)
    local des =  [[<p style="text-align:left">]];
    des = des .. [[<font color="#3D3D3D">]]
    des = des .. str_1
    des = des .. [[</font>]]
    des = des .. str_2
    des = des .. [[<font color="#3D3D3D">]]
    des = des .. str_3
    des = des .. [[</font>]]
    des = des .. [[</p>]]
    return des
end
function ZhenFaTuiYanLayer:showFlyBegin(btn,flyMoveCallBack)
    play_chuangonghunpoyidong()

    local topos = btn:convertToWorldSpace(ccp(0,0))

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/role_transfer_begin.xml")
    local flyPic = TFArmature:create("role_transfer_begin_anim")

    flyPic:setAnimationFps(GameConfig.ANIM_FPS)
    flyPic:setPosition(ccp(topos.x-70 , topos.y-90))
    flyPic:setScale(0.8)
    self:addChild(flyPic,100)
    
    flyPic:addMEListener(TFARMATURE_COMPLETE,function()
        flyPic:removeFromParentAndCleanup(true)
        flyPic:removeMEListener(TFARMATURE_COMPLETE) 
    end)
    local temp = 0
    flyPic:addMEListener(TFARMATURE_UPDATE,function()
        temp = temp + 1
        if temp == 2 then
            self:showFlyMove(btn)
            flyPic:removeMEListener(TFARMATURE_UPDATE) 
        end
    end)

    flyPic:playByIndex(0, -1, -1, 0)
end
function ZhenFaTuiYanLayer:showFlyMove(btn)
    play_chuangonghunpoyidong()

    local topos = btn:convertToWorldSpace(ccp(0,0))

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/role_transfer_move.xml")
    local moveEffect = TFArmature:create("role_transfer_move_anim")

    moveEffect:setAnimationFps(GameConfig.ANIM_FPS)
    moveEffect:setPosition(ccp(topos.x - 110, topos.y))

    self:addChild(moveEffect,100)

    moveEffect:playByIndex(0, -1, -1, 1)

    local toPos = self.bar_exp:convertToWorldSpace(ccp(0,0))
    local tween = 
    {
        target = moveEffect,
        {
            ease = {type=TFEaseType.EASE_IN_OUT, rate=9},
            duration = 0.2,
            x = toPos.x-370,
            y = toPos.y,
            onComplete = function ()

                if self.endEffect == nil then
                    TFResourceHelper:instance():addArmatureFromJsonFile("effect/role_transfer_end.xml")
                    local endEffect = TFArmature:create("role_transfer_end_anim")

                    endEffect:setAnimationFps(GameConfig.ANIM_FPS)
                    endEffect:setPosition(ccp(100, 275))
                    self.bar_exp:addChild(endEffect,100)
                    
                    endEffect:addMEListener(TFARMATURE_COMPLETE,function()
                        endEffect:removeMEListener(TFARMATURE_COMPLETE) 
                        endEffect:removeFromParentAndCleanup(true)
                        self.endEffect = nil
                    end)
                    endEffect:playByIndex(0, -1, -1, 0)
                    self.endEffect = endEffect
                end

                moveEffect:removeFromParentAndCleanup(true)
            end,
        },
    }
    TFDirector:toTween(tween)
end
return ZhenFaTuiYanLayer
