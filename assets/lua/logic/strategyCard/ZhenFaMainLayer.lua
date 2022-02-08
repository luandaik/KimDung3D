-- client side ZhenFaMainLayer.lua
--[[
 * @Description: 阵法信息预览
 ]]
-- script writer Happy.All
-- creation time 2016-08-01


local ZhenFaMainLayer = class("ZhenFaMainLayer", BaseLayer);

function ZhenFaMainLayer:ctor(data)
    self.super.ctor(self,data);
    self.gmId = data
    self:init("lua.uiconfig_mango_new.zhenfa.ZhenFaMain");
end

function ZhenFaMainLayer:initUI(ui)
    self.super.initUI(self,ui);

    local bgNode = TFDirector:getChildByPath(ui, "bg")
    bgNode:setTouchEnabled(true)

    self.Panel_content = TFDirector:getChildByPath(ui, "bg")--TFDirector:getChildByPath(ui, "Panel_content")
    self.Panel_content:setTouchEnabled(true)
    self.Panel_content:setSwallowTouch(false)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.btn_help = TFDirector:getChildByPath(ui, "btn_help")
    self.btnLeft = TFDirector:getChildByPath(ui, "btn_pageleft")
    self.btnRight = TFDirector:getChildByPath(ui, "btn_pageright")
    self.btn_tupo = TFDirector:getChildByPath(ui, "btn_tupo")
    self.btn_yiwei = TFDirector:getChildByPath(ui, "btn_yiwei")
    self.btn_qianghua   = TFDirector:getChildByPath(ui, "btn_qianghua")
    self.btn_tuiYan     = TFDirector:getChildByPath(ui, "btn_tuiyan")
    self.btn_shenyan     = TFDirector:getChildByPath(ui, "btn_shenyan")
    

    --阵法基本信息
    local baseNode = TFDirector:getChildByPath(ui, "panel_info")
    self.baseQuality = TFDirector:getChildByPath(baseNode, "img_quality")
    self.baseIcon = TFDirector:getChildByPath(baseNode, "img_icon")
    self.baseLevel = TFDirector:getChildByPath(baseNode, "txt_intensify_lv")
    self.baseName = TFDirector:getChildByPath(baseNode, "txt_name")
    --阵法强化信息
    local intensifyNode = TFDirector:getChildByPath(ui, "panel_sx")
    self.intensifyAttr = {}
    for i=1,5 do
        local attrNode = TFDirector:getChildByPath(intensifyNode, "img_attr"..i)
        self.intensifyAttr[i] = TFDirector:getChildByPath(intensifyNode, "img_attr"..i)
        self.intensifyAttr[i].attrName = TFDirector:getChildByPath(attrNode, "txt_name")
        self.intensifyAttr[i].attrNum = TFDirector:getChildByPath(attrNode, "txt_base")
    end
    --阵法升星信息
    local starPositionNode = TFDirector:getChildByPath(ui, "img_position")
    self.texturePos = {}
    for i=1,9 do
        self.texturePos[i] = TFDirector:getChildByPath(starPositionNode, "img_zy"..i)
    end
    local panel_zwsx = TFDirector:getChildByPath(ui, "panel_zwsx")
    self.starAttr = {}
    for i=1,3 do
        self.starAttr[i] = TFDirector:getChildByPath(panel_zwsx, "panel_zhenwei"..i)
        self.starAttr[i].attr = {}
        self.starAttr[i].txt_lv = TFDirector:getChildByPath(self.starAttr[i], "txt_lv")
        local starAttr = {}
        starAttr.attrNode = TFDirector:getChildByPath(self.starAttr[i], "img_neili")
        starAttr.attrName = TFDirector:getChildByPath(starAttr.attrNode, "txt_name")
        starAttr.attrNum = TFDirector:getChildByPath(starAttr.attrNode, "txt_base")
        table.insert(self.starAttr[i].attr, starAttr)
        local starAttr2 = {}
        starAttr2.attrNode = TFDirector:getChildByPath(self.starAttr[i], "img_shenfa")
        starAttr2.attrName = TFDirector:getChildByPath(starAttr2.attrNode, "txt_name")
        starAttr2.attrNum = TFDirector:getChildByPath(starAttr2.attrNode, "txt_base")
        table.insert(self.starAttr[i].attr, starAttr2)        
    end
    local starPanel = TFDirector:getChildByPath(ui, "panel_star")
    self.starImg = {}
    for i=1,5 do
        local img_stardi = TFDirector:getChildByPath(starPanel, "img_stardi"..i)
        self.starImg[i] = TFDirector:getChildByPath(img_stardi, "img_star")
    end    
    local specialEffectNode = TFDirector:getChildByPath(ui, "txt_zhenwei")
    self.specialEffect = TFDirector:getChildByPath(specialEffectNode, "txt_num")
    --阵法突破信息
    local chipNode = TFDirector:getChildByPath(ui, "panel_book")
    self.chipQuality = TFDirector:getChildByPath(chipNode, "img_quality")
    self.chipIcon = TFDirector:getChildByPath(chipNode, "img_equip")
    self.chipLoadingBar = TFDirector:getChildByPath(chipNode, "bar_soul")
    self.chipLoadingBar:setDirection(TFLOADINGBAR_LEFT)
    self.chipTxtTitle = TFDirector:getChildByPath(chipNode, "txt_soul")
    self.chipTxtNum = TFDirector:getChildByPath(chipNode, "txt_soul_num")    
    --置换
    self.btn_zhihuan = TFDirector:getChildByPath(ui, "btn_zhihuan")
    self.btn_zhihuan.logic = self
    self.deduceOpenLevel = tonumber(ConstantData:objectByID("DeduceFunctionOpen").value) or 0
end

function ZhenFaMainLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function ZhenFaMainLayer:refreshUI()
    --阵法基本信息
    local cardInfo = StrategyCardManager:getStrategyCardByGmid(self.gmId)
    if cardInfo == nil then
        print('cannot find the card gmId = ',self.gmId)
        return
    end
    local cardlevel = cardInfo:getLevel()
    self.baseQuality:setTexture(GetColorIconByQuality_118(cardInfo:getQuality()))
    self.baseIcon:setTexture(cardInfo:getPath())
    self.baseLevel:setText("+"..cardlevel)
    self.baseName:setText(cardInfo:getName())
    --阵法强化信息
    local extraAttr = cardInfo:getTotalAttr()
    local notEmptyIndex = 1
    
    for k,v in pairs(extraAttr) do
        self.intensifyAttr[notEmptyIndex]:setVisible(true)
        self.intensifyAttr[notEmptyIndex].attrName:setText(AttributeTypeStr[k])
        self.intensifyAttr[notEmptyIndex].attrNum:setText("+ " .. covertToDisplayValue(k,v))
        notEmptyIndex = notEmptyIndex + 1
    end
    for i=notEmptyIndex,5 do
        self.intensifyAttr[i]:setVisible(false)
    end
    --阵法升星信息
    local posNumber = cardInfo:getOpenPositionNumber()
    for i=1,9 do
        self.texturePos[i]:setVisible(false)
    end
    local strategyPos = cardInfo:getSrategyPos()
    for k,v in pairs(strategyPos) do
        if v <= posNumber then
           self.texturePos[k]:setVisible(true) 
           self.texturePos[k]:setTexture("ui_new/zhenfa/img_"..v..".png")
       end
    end

    for i=1,3 do
        local attribute = cardInfo:getPositonAttributeByPos(i)
        if i <= posNumber then
            local attrTbl = attribute:getAttribute()
            self.starAttr[i]:setVisible(true)
            local deduceInfo = StrategyCardManager:getByExpLevel(cardInfo:getDeduceExp(i), cardInfo.quality)
            local currLevel = tonumber(deduceInfo[1]) or 0
            if (currLevel > 0 and( cardInfo:getLevel() >= self.deduceOpenLevel)) then
                self.starAttr[i].txt_lv:setVisible(true)
                self.starAttr[i].txt_lv:setText("Lv"..currLevel)
            else
                self.starAttr[i].txt_lv:setVisible(false)
            end
                        
            local attrIndex = 1
            for k,v in pairs(attrTbl) do
                self.starAttr[i].attr[attrIndex].attrNode:setVisible(true)
                self.starAttr[i].attr[attrIndex].attrName:setText(AttributeTypeStr[k])
                self.starAttr[i].attr[attrIndex].attrNum:setText("+ " .. covertToDisplayValue(k,v))
                attrIndex = attrIndex + 1
            end
            for j=attrIndex,2 do
                self.starAttr[i].attr[j].attrNode:setVisible(false)
            end
        else
            self.starAttr[i]:setVisible(false)
        end
    end
    self.currStar = cardInfo:getStarLevel()
    -- print("currStar = ",cardInfo)
    for i=1,5 do
        if i <= self.currStar then
            self.starImg[i]:setVisible(true)
        else
            self.starImg[i]:setVisible(false)
        end
    end    
    
    local effectAttrInfo = cardInfo:getZhenWeiSpecialAdd()
    local nextEffectInfo = BattleArrayResearchExtraData:getShenYanEffect(cardInfo.id, 0) 
    local effectDes = StrategyCardManager:zhenWeiSpecialAddStr( nextEffectInfo.desc, effectAttrInfo)
    self.specialEffect:setText(effectDes)

    --阵法突破信息
    local chipId = BattleArrayData:objectByID(cardInfo.id).fragment_id
    local chipInfo = ItemData:objectByID(chipId)
    local chipNumInBag = BagManager:getItemNumById(chipId)
    self.chipQuality:setTextureNormal(GetColorIconByQuality(chipInfo.quality))
    self.chipIcon:setTexture(chipInfo:GetPath())
    local rewardItem = {itemid = chipId}
    --Public:addPieceImg(self.chipQuality,rewardItem,true)
    Public:addPieceImg(self.chipIcon,rewardItem,true)
    
    local starLevel = cardInfo:getStarLevel()+1
    if starLevel > StrategyCardManager.kMaxStarLevel then
        self.btn_tupo:setGrayEnabled(true)
        self.btn_tupo:setTouchEnabled(false)
        self.chipLoadingBar:setPercent(100)

        self.chipTxtNum:setVisible(false)
        self.chipTxtTitle:setText(localizable.roleInfoLayer_py_max)
    else
        local starInfo = BattleArrayStarData:getItemInfo(cardInfo.id,starLevel)
        local combInfo = starInfo:getBreachChipInfo()
        local percent = math.floor(chipNumInBag*100/combInfo.num)
        if percent > 100 then
            percent = 100
        end
        self.chipLoadingBar:setPercent(percent)
        self.chipTxtNum:setText(chipNumInBag.."/"..combInfo.num)
        self.chipTxtNum:setVisible(true)
        self.chipTxtTitle:setText(localizable.StrategyCard_chip_num)
        self.btn_tupo:setGrayEnabled(false)
        self.btn_tupo:setTouchEnabled(true)
    end

    CommonManager:updateRedPoint(self.btn_tupo,cardInfo:canStarUp(),ccp(0,0))
    CommonManager:updateRedPoint(self.btn_qianghua,cardInfo:canInstenify(),ccp(0,0))        

    local index = StrategyCardManager:getCardIndexByGmid(self.gmId)
    local maxNum = StrategyCardManager:getCardMaxNumber()
    self.btnLeft:setVisible(true)
    if index <= 1 then
        self.btnLeft:setVisible(false)
    end
    self.btnRight:setVisible(true)
    if index >= maxNum then
        self.btnRight:setVisible(false)
    end

    local openLevel = self.deduceOpenLevel
    
    local isOpen    = (cardlevel >= openLevel)

    self.btn_tuiYan:setGrayEnabled(isOpen == false)
    self.btn_tuiYan.isOpen       = isOpen
    --推演屏蔽
    -- self.btn_tuiYan:setVisible(false)
    
    if (MainPlayer:getServerSwitchStatue(ServerSwitchType.ShenYan) == false) then
        self.btn_shenyan:setVisible(false)
    else
        self.btn_shenyan:setGrayEnabled(self.currStar < 2)
    end
end

function ZhenFaMainLayer.onLeftClickHandle(sender)
    local self = sender.logic;
    local index = StrategyCardManager:getCardIndexByGmid(self.gmId)
    index = index - 1
    
    local info = StrategyCardManager:getCardByIndex(index)
    if info == nil then
        return 
    end
    self.gmId = info.gmId
    self:refreshUI()    
end

function ZhenFaMainLayer.onRightClickHandle(sender)
    local self = sender.logic;
    local index = StrategyCardManager:getCardIndexByGmid(self.gmId)
    index = index + 1
    local maxNum = StrategyCardManager:getCardMaxNumber()
    
    local info = StrategyCardManager:getCardByIndex(index)
    if info == nil then
        return 
    end
    self.gmId = info.gmId
    self:refreshUI()    
end

function ZhenFaMainLayer:removeUI()
    self.super.removeUI(self);
    if self.modelNode then
        self.modelNode:release()
        self.modelNode = nil
    end
end

--注册事件
function ZhenFaMainLayer:registerEvents()
    self.super.registerEvents(self);

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);
    
    self.btnLeft:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onLeftClickHandle),1)
    self.btnLeft.logic = self
    
    self.btnRight:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRightClickHandle),1)
    self.btnRight.logic = self

    self.btn_tupo:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onOperationClickHandle),1)
    self.btn_tupo.logic = self
    self.btn_tupo.index = StrategyCardManager.handleStarUp

    self.btn_yiwei:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onOperationClickHandle),1)
    self.btn_yiwei.logic = self
    self.btn_yiwei.index = StrategyCardManager.handleChangePos

    self.btn_qianghua:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onOperationClickHandle),1)
    self.btn_qianghua.logic = self
    self.btn_qianghua.index = StrategyCardManager.handleIntensify

    self.btn_tuiYan:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onOpenDeduceClickHandle),1)
    self.btn_tuiYan.logic = self
    self.btn_tuiYan.index = StrategyCardManager.handDeduce

    self.btn_shenyan:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onOpenShenyanClickHandle),1)
    self.btn_shenyan.logic = self
    self.btn_shenyan.index = StrategyCardManager.handleShenyan

    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHelpClickHandle),1)
    self.btn_help.logic = self

       --滑动事件监听，切换装备
    function onTouchBegin(widget,pos,offset)        
        self.touchBeginPos = pos
        print('onTouchBegin = ',pos)
    end

    function onTouchMove(widget,pos,offset)

    end

    function onTouchEnd(widget,pos)
        local offsetX = pos.x - self.touchBeginPos.x
        if offsetX < -80 then
            self.onRightClickHandle(self.btnRight)
        elseif offsetX > 80 then
            self.onLeftClickHandle(self.btnLeft)
        end
    end

    self.Panel_content:addMEListener(TFWIDGET_TOUCHBEGAN, onTouchBegin)
    self.Panel_content:addMEListener(TFWIDGET_TOUCHMOVED, onTouchMove)
    self.Panel_content:addMEListener(TFWIDGET_TOUCHENDED, onTouchEnd)

    self.btn_zhihuan:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onZhihuanClickHandle),1)
end

function ZhenFaMainLayer:removeEvents()
    self.super.removeEvents(self)
end

function ZhenFaMainLayer.onOperationClickHandle( btn )
    local self = btn.logic
    StrategyCardManager:openEquipOperationLayer(self.gmId, btn.index)
end
--推演
function ZhenFaMainLayer.onOpenDeduceClickHandle( btn )
    local self = btn.logic
    if (btn.isOpen ~= true) then
        self.btn_tuiYan:setGrayEnabled(true)
        toastMessage(stringUtils.format(localizable.ZheFa_TuiYan_Open, self.deduceOpenLevel))
        return
    end
    StrategyCardManager:openEquipOperationLayer(self.gmId, btn.index)
end

function ZhenFaMainLayer.onOpenShenyanClickHandle( btn )
    local self = btn.logic
    if (self.currStar < 2) then
        toastMessage(stringUtils.format(localizable.ZheFa_ShenYan_Open))
        self.btn_shenyan:setGrayEnabled(true)       
        return
    end
    StrategyCardManager:openEquipOperationLayer(self.gmId, btn.index)
end

function ZhenFaMainLayer.onHelpClickHandle( btn )
    CommonManager:showRuleLyaer("zhenfa")
end

--置换
function ZhenFaMainLayer.onZhihuanClickHandle( btn )
    local self = btn.logic
    StrategyCardManager:openZhihuanLayer(self.gmId)
end

return ZhenFaMainLayer
