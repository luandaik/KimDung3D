-- client side ZhenFaStrongLayer.lua
--[[
 * @Description: 阵法易位界面
 ]]
-- script writer wuqi
-- creation time 2016-08-05

local ZhenFaYiWeiLayer = class("ZhenFaYiWeiLayer", BaseLayer)

ZhenFaYiWeiLayer.COST_ID = 30166
ZhenFaYiWeiLayer.COST_NUM = 1

function ZhenFaYiWeiLayer:ctor(gmId)
    self.super.ctor(self,data)
    self.gmId = gmId
    self.lockList = {}
    self:init("lua.uiconfig_mango_new.zhenfa.ZhenFaYiWei")
end

function ZhenFaYiWeiLayer:initUI(ui)
	self.super.initUI(self, ui)
    self.img_fz = TFDirector:getChildByPath(ui, "img_fz")
    self.panel_view = TFDirector:getChildByPath(ui, "panel_view")

    self.img_quality = TFDirector:getChildByPath(self.img_fz, "img_quality")
    self.img_icon = TFDirector:getChildByPath(self.img_fz, "img_icon")
    self.txt_intensify_lv = TFDirector:getChildByPath(self.img_fz, "txt_intensify_lv")
    self.txt_name = TFDirector:getChildByPath(self.img_fz, "txt_name")
    self.img_equiped = TFDirector:getChildByPath(self.img_fz, "img_equiped")
    self.txt_equiped_name = TFDirector:getChildByPath(self.img_fz, "txt_equiped_name")
    self.panel_star = TFDirector:getChildByPath(self.img_fz, "panel_star")
    self.img_star = {}
    for i = 1, 5 do
        self.img_star[i] = TFDirector:getChildByPath(self.img_fz, "img_star_"..i)
    end

    self.panel_zhenwei = {}
    for i = 1, 3 do
        self.panel_zhenwei[i] = TFDirector:getChildByPath(ui, "panel_zhenwei" .. i)
        self.panel_zhenwei[i].txt_attr1 = TFDirector:getChildByPath(self.panel_zhenwei[i], "txt_attr1")
        self.panel_zhenwei[i].txt_attr1_num = TFDirector:getChildByPath(self.panel_zhenwei[i], "txt_attr1_num")
        self.panel_zhenwei[i].txt_attr2 = TFDirector:getChildByPath(self.panel_zhenwei[i], "txt_attr2")
        self.panel_zhenwei[i].txt_attr2_num = TFDirector:getChildByPath(self.panel_zhenwei[i], "txt_attr2_num")
    end

    self.panel_yiwei = TFDirector:getChildByPath(ui, "panel_yiwei")
    self.btn_yiwei = TFDirector:getChildByPath(ui, "btn_yiwei")
    self.btn_yiwei.logic = self

    self.txt_cost = TFDirector:getChildByPath(self.panel_yiwei, "txt_wenben1")
    self.txt_yongyou = TFDirector:getChildByPath(self.panel_yiwei, "txt_yongyou")

    --左边阵位属性
    self.panel_zhenwei = {}
    for i = 1, 3 do
        self.panel_zhenwei[i] = TFDirector:getChildByPath(ui, "panel_zhenwei" .. i)
        self.panel_zhenwei[i].txt_attr = {}
        self.panel_zhenwei[i].txt_attr_num = {}
        for j = 1, 2 do
            self.panel_zhenwei[i].txt_attr[j] = TFDirector:getChildByPath(self.panel_zhenwei[i], "txt_attr" .. j)
            self.panel_zhenwei[i].txt_attr_num[j] = TFDirector:getChildByPath(self.panel_zhenwei[i], "txt_attr" .. j .. "_num")
        end
    end

    --锁定panel
    self.panel_check = {}
    for i = 1, 3 do
        self.panel_check[i] = TFDirector:getChildByPath(ui, "panel_zy" .. i)
        self.panel_check[i].check_attr = TFDirector:getChildByPath(self.panel_check[i], "check_attr")
        self.panel_check[i].txt_cost = TFDirector:getChildByPath(self.panel_check[i], "txt_cost")
        self.panel_check[i].tag = i
        self.panel_check[i].logic = self
    end

    --中心阵位
    self.img_di = TFDirector:getChildByPath(ui, "img_di")
    self.img_hole = {}
    for i = 1, 9 do
        self.img_hole[i] = TFDirector:getChildByPath(self.img_di, "img_zy" .. i)
        self.img_hole[i]:setVisible(false)
    end

    self.refine_icon = TFDirector:getChildByPath(ui, "refine_icon")
end

function ZhenFaYiWeiLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function ZhenFaYiWeiLayer:dispose()
    self.super.dispose(self)
end

function ZhenFaYiWeiLayer:refreshUI()
    self.item = StrategyCardManager:getStrategyCardByGmid(self.gmId)

    --self.item.equip = {1}
    --self.item.id = 50026
    if not self.item then
        return
    end
    self:refreshIcon()
    self:refreshAttr()
    self:refreshCost()
    self:refreshCheck()
    self:refreshZhenwei()
end

function ZhenFaYiWeiLayer:refreshIcon()
    self.img_quality:setTexture(GetColorIconByQuality_118(self.item:getQuality()))
    self.img_icon:setTexture(self.item:getPath())
    self.txt_intensify_lv:setText("+" .. self.item:getLevel())
    self.txt_name:setText(self.item:getName())

    --阵法所装备阵容
    if self.item and self.item:checkInStrategy() then
        self.img_equiped:setVisible(true)
        self.img_equiped:setTexture( "ui_new/zhenfa/img_yzp.png" )
        self.txt_equiped_name:setVisible(false)
        --local strategyName = getFightStrategyNameByType(self.item.equip[1])
        --local str = toVerticalString(strategyName)
        --self.txt_equiped_name:setText(str)
    else
        self.img_equiped:setVisible(false)
    end
    
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

function ZhenFaYiWeiLayer:refreshAttr()
    local starLevel = self.item:getStarLevel()
    local starItem = BattleArrayStarData:getItemInfo(self.item.id, starLevel)
    local cardInfo = StrategyCardManager:getStrategyCardByGmid(self.gmId)
    for i = 1, 3 do
        self.panel_zhenwei[i]:setVisible(true)
        if i <= starItem.num then
            self.panel_zhenwei[i]:setVisible(true)
            local tab = cardInfo:getPositonAttributeByPos(i)--starItem:getAttributeByPos(i)
            local num = 1
            self.panel_zhenwei[i].txt_attr[2]:setVisible(false)
            self.panel_zhenwei[i].txt_attr_num[2]:setVisible(false)
            local attrTbl = tab:getAttribute()
            for k, v in pairs(attrTbl) do
                if num == 1 then
                    self.panel_zhenwei[i].txt_attr[1]:setText(AttributeTypeStr[tonumber(k)])
                    local str = "+" .. v
                    if (isPercentAttr(tonumber(k))) then
                        str = "+"..(tonumber(v) / 100).."%"
                    end
                    self.panel_zhenwei[i].txt_attr_num[1]:setText( str )
                elseif num == 2 then
                    self.panel_zhenwei[i].txt_attr[2]:setVisible(true)
                    self.panel_zhenwei[i].txt_attr_num[2]:setVisible(true)
                    self.panel_zhenwei[i].txt_attr[2]:setText(AttributeTypeStr[tonumber(k)])
                    local str = "+" .. v
                    if (isPercentAttr(tonumber(k))) then
                        str = "+"..(tonumber(v) / 100).."%"
                    end
                    self.panel_zhenwei[i].txt_attr_num[2]:setText( str )
                end
                num = num + 1
            end
        else
            self.panel_zhenwei[i]:setVisible(false)
        end
    end
end

function ZhenFaYiWeiLayer:refreshCost()
    self.txt_yongyou:setColor(ccc3(0, 0, 0))
    self.txt_cost:setText(self.COST_NUM)
    local num = BagManager:getItemNumById( self.COST_ID )
    local freeNum = self.item:getFreeNum() or 0
    if freeNum ~= 0 then
        self.refine_icon:setVisible(false)
        self.txt_cost:setText(localizable.StrategyCard_free_yiwei)
        self.txt_yongyou:setVisible(false)
    else
        self.refine_icon:setVisible(true)
        self.txt_yongyou:setVisible(true)
        self.txt_cost:setText(1)
        self.txt_yongyou:setText( stringUtils.format(localizable.StrategyCard_txt_yongyou, num) )
    end
end

function ZhenFaYiWeiLayer:refreshCheck()
    local starLevel = self.item:getStarLevel()
    local starItem = BattleArrayStarData:getItemInfo(self.item.id, starLevel)
    local holeNum = starItem.num

    for i = 1, 3 do
        self.panel_check[i]:setVisible(false)
    end

    for i = 1, holeNum do
        self.panel_check[i]:setVisible(true)
        if self.lockList and self.lockList[i] then
            self.panel_check[i].check_attr:setSelectedState(true)
        else
            self.panel_check[i].check_attr:setSelectedState(false)
        end
        local cost = ConstantData:objectByID("BattleArrayChangeLockMoney").value or 200
        self.panel_check[i].txt_cost:setText(cost)
    end
end

function ZhenFaYiWeiLayer:refreshZhenwei()
    for i = 1, 9 do
        self.img_hole[i]:setVisible(false)
    end
    local strategyPos = self.item:getSrategyPos()
    local posNumber = self.item:getOpenPositionNumber()
    for k, v in pairs(strategyPos) do
        if v <= posNumber then
           self.img_hole[k]:setVisible(true) 
           self.img_hole[k]:setTexture("ui_new/zhenfa/img_" .. v .. ".png")
       end
    end
end

function ZhenFaYiWeiLayer:removeUI()
    self.super.removeUI(self)
end

function ZhenFaYiWeiLayer:setEquipGmId(gmId)
    if (gmId ~= self.gmId) then
        self.lockList = {}
    end
    self.gmId = gmId
    self:refreshUI()
end

function ZhenFaYiWeiLayer.CheckClickHandle(sender)
	local self = sender.logic
    local tag = sender.tag

    --检验是否有足够的元宝来进行锁定属性，不足时提示冲值
    local lockConsume = ConstantData:objectByID("BattleArrayChangeLockMoney").value or 200    
    local totalConsume = 0
    for k, v in pairs(self.lockList) do
        totalConsume = totalConsume + lockConsume
    end
    totalConsume = totalConsume + lockConsume

    local needResType = EnumDropType.SYCEE
    local num = totalConsume

    if needResType == EnumDropType.SYCEE then 
        if MainPlayer:isEnoughSycee(num, true) then
            self.lockList[tag] = true
            play_linglianshangsuo()
        end
    end
end

function ZhenFaYiWeiLayer.UnCheckClickHandle(sender)
    local self = sender.logic
    local tag = sender.tag

    if self.lockList[sender.tag] then
        self.lockList[sender.tag] = nil
    end
    play_linglianshangsuo()
end


function ZhenFaYiWeiLayer:registerEvents()
	self.super.registerEvents(self)

    self.btn_yiwei:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onYiweiClickHandle), 1)

    for i = 1, 3 do
        self.panel_check[i].check_attr.tag = i
        self.panel_check[i].check_attr.logic = self
        self.panel_check[i].check_attr:addMEListener(TFWIDGET_CHECKBOXSELECT, self.CheckClickHandle)
        self.panel_check[i].check_attr:addMEListener(TFWIDGET_CHECKBOXUNSELECT, self.UnCheckClickHandle)
    end

     self.onYiweiCallBack = function(event)
        local type = event.data[1][1]
        if type == StrategyCardManager.handleChangePos then
            play_jinglian()
            self:refreshUI()
            self:playYiweiEffect()
        end
    end
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onYiweiCallBack)
end

function ZhenFaYiWeiLayer:playYiweiEffect()
    if self.equipEffect == nil then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equipment_refining.xml")
        local effect = TFArmature:create("equipment_refining_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        --self.img_di:addChild(effect)
        --effect:setPosition( ccp( self.img_di:getContentSize().width / 2 - 20, self.img_di:getContentSize().height / 2 - 90 ) )
        local pos = self.img_di:getPosition()
        effect:setPosition( ccp(pos.x + 450, pos.y + 183) )
        effect:setZOrder(999)
        self.panel_view:addChild(effect)
        self.equipEffect = effect
    end
    self.equipEffect:playByIndex(0, -1, -1, 0)
end

function ZhenFaYiWeiLayer:removeEvents()
    TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onYiweiCallBack)
    self.onYiweiCallBack = nil
    self.super.removeEvents(self)
end

function ZhenFaYiWeiLayer.onYiweiClickHandle(sender)
    local self = sender.logic
    local freeNum = self.item:getFreeNum()
    local num = BagManager:getItemNumById( self.COST_ID )
    if freeNum <= 0 and num < self.COST_NUM then
        if not MallManager:checkShopOneKey( self.COST_ID ) then
            toastMessage(localizable.StrategyCard_yiweidanbuzu)
        end
        return
    end   

    local tab = {}
    local lockNum = 0
    for i = 1, 3 do
        if self.lockList[i] then
            lockNum = lockNum + 1
            table.insert(tab, i-1)
        end
    end

    local starLevel = self.item:getStarLevel()
    local starItem = BattleArrayStarData:getItemInfo(self.item.id, starLevel)
    if lockNum >= starItem.num then
        toastMessage(localizable.StrategyCard_all_locked)
        return
    end

    local lockConsume = ConstantData:objectByID("BattleArrayChangeLockMoney").value or 200   

    if lockNum > 0 then
        local cost = lockNum * lockConsume
        local warningMsg = stringUtils.format(localizable.StrategyCard_lock_tips, cost)
        CommonManager:showOperateSureLayer(
                function()
                    StrategyCardManager:sendChangePositionMsg(self.item.gmId, tab)
                end,
                nil,
                {
                    msg = warningMsg
                }
        )
    else
        local warningMsg = localizable.StrategyCard_yiwei_sure
        CommonManager:showOperateSureLayer(
            function()
                StrategyCardManager:sendChangePositionMsg(self.item.gmId, tab)
            end,
            nil,
            {
                msg = warningMsg
            }
        )
    end
end


return ZhenFaYiWeiLayer
