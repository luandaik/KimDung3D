-- client side ZhenFaStrongLayer.lua
--[[
 * @Description: 阵法强化界面
 ]]
-- script writer wuqi
-- creation time 2016-08-05

local ZhenFaStrongLayer = class("ZhenFaStrongLayer", BaseLayer)

function ZhenFaStrongLayer:ctor(gmId)
    self.super.ctor(self, data)
    self.gmId = gmId
    self:init("lua.uiconfig_mango_new.zhenfa.ZhenFaStrong")
end

function ZhenFaStrongLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.img_fz = TFDirector:getChildByPath(ui, "img_fz")

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

    self.panel_sx = TFDirector:getChildByPath(ui, "panel_sx")
    self.img_intensify_lv_right = TFDirector:getChildByPath(self.panel_sx, "img_intensify_lv")
    self.img_intensify_lv_right.txt_current_lv = TFDirector:getChildByPath(self.panel_sx, "txt_current_lv")
    self.img_intensify_lv_right.txt_next_lv = TFDirector:getChildByPath(self.panel_sx, "txt_next_lv")
    self.img_intensify_lv_right.txt_numLv_effect = TFDirector:getChildByPath(self.img_intensify_lv_right, "txt_numLv_effect")
    self.img_intensify_lv_right.txt_numLv_effect:setVisible(false)

    self.attr_tab = {}
    local temp = { "img_qdqx", "img_qdwl", "img_qdfy", "img_qdnl", "img_qdsf" }
    for i = EnumAttributeType.Blood, EnumAttributeType.Agility do
        self.attr_tab[i] = TFDirector:getChildByPath(self.panel_sx, temp[i])
        self.attr_tab[i].txt_current_lv = TFDirector:getChildByPath(self.attr_tab[i], "txt_current_lv")
        self.attr_tab[i].txt_next_lv = TFDirector:getChildByPath(self.attr_tab[i], "txt_next_lv")
        self.attr_tab[i].txt_numLv_effect = TFDirector:getChildByPath(self.attr_tab[i], "txt_numLv_effect")
        self.attr_tab[i].txt_numLv_effect:setVisible(false)
    end

    --一键强化按钮
    self.btn_onekey = TFDirector:getChildByPath(ui, "btn_tupo")
    self.btn_onekey:setTouchEnabled(true)
    self.btn_onekey.logic = self

    --道具按钮
    self.btnToolList = {}
    self.panel_cailiao = TFDirector:getChildByPath(ui, "Panel_cailiao")
    for i = 1, 3 do
        self.btnToolList[i] = TFDirector:getChildByPath(self.panel_cailiao, "btn_tool"..i)
        self.btnToolList[i].btnImg = TFDirector:getChildByPath(self.panel_cailiao, "img_tool"..i)
        self.btnToolList[i].txtNum = TFDirector:getChildByPath(self.panel_cailiao, "txt_num"..i)
        self.btnToolList[i].txtTipsExp = TFDirector:getChildByPath(self.panel_cailiao, "txt_number"..i)
    end

    self.panel_qianghua = TFDirector:getChildByPath(ui, "panel_qianghua")
    self.bar_jindu = TFDirector:getChildByPath(self.panel_qianghua, 'bar_jindu')
    self.bar_jindu:setDirection(TFLOADINGBAR_LEFT)
    self.txt_shuzi = TFDirector:getChildByPath(self.panel_qianghua, 'txt_shuzhi')
    self.txt_qianghua1 = TFDirector:getChildByPath(self.panel_qianghua, "txt_qianghua1")
    self.txt_qianghua2 = TFDirector:getChildByPath(self.panel_qianghua, "txt_qianghua2")
    self.img_max = TFDirector:getChildByPath(self.panel_qianghua, "img_max")
    self.img_max:setVisible(false)

    self.txt_tips = TFDirector:getChildByPath(ui, "txt_tips2")
    self.deduceOpenLevel = tonumber(ConstantData:objectByID("DeduceFunctionOpen").value) or 0
end

function ZhenFaStrongLayer:onShow()
	self.super.onShow(self)
    self:refreshUI()
end

function ZhenFaStrongLayer:dispose()
	self.super.dispose(self)
end

function ZhenFaStrongLayer:refreshUI(isUp)
    self.item = StrategyCardManager:getStrategyCardByGmid(self.gmId)
    --test by wuqi
    --self.item.equip = {1}
    --self.item.id = 50026
    if not self.item then
        return
    end
    self.addIntensifyLevel = StrategyCardManager:getByPosAddIntensifyLevel(self.gmId, self.item.quality) or 0

    local maxLv = MainPlayer:getBattleArrayMaxLevel()
    local level = math.min( self.item:getLevel() + 1, maxLv )
    local levelItem = BattleArrayLevelData:getItemByLevelAndQuality(level, self.item:getQuality())
    self.needExp = levelItem:getNeedExp() or 0
    self.exp = self.item.currExp or 0
    self.oldLevel = math.min( self.item:getLevel(), maxLv )

    self.toolList = levelItem:getConsumeTab()

    self:refreshLeft()
    self:refreshRight()
    self:refreshBottom()
    if (isUp) then
        if (self.oldLevel == self.deduceOpenLevel) then
            toastMessage(localizable.ZheFa_TuiYan_tips6)
        end
    end
end

--左边阵法icon信息
function ZhenFaStrongLayer:refreshLeft()
    self.img_quality:setTexture(GetColorIconByQuality_118(self.item:getQuality()))
    self.img_icon:setTexture(self.item:getPath())
    self.txt_intensify_lv:setText("+" .. self.item:getLevel())
    self.txt_name:setText(self.item:getName())

    --阵法所装备阵容
    if self.item and self.item:checkInStrategy() then
        self.img_equiped:setVisible(true)
        self.img_equiped:setTexture( "ui_new/zhenfa/img_yzp.png" )
        self.txt_equiped_name:setVisible(false)
        --self.img_equiped:setVisible(true)
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

--右边阵法属性
function ZhenFaStrongLayer:refreshRight()
    local curLev = self.item:getLevel()
    self.img_intensify_lv_right.txt_current_lv:setText(curLev)
    --test 
    --local templateItem = BattleArrayStarData:getItemInfo(self.item.id, self.item.starLevel)
    local templateItem = BattleArrayStarData:getItemInfo(self.item.id, 5)
    local limitIntensifyLevel = templateItem.intensify_level + self.addIntensifyLevel
    self.img_intensify_lv_right.txt_next_lv:setVisible(true)
    if curLev + 1 <= limitIntensifyLevel then
        self.img_intensify_lv_right.txt_next_lv:setText(curLev + 1)
    else
        self.img_intensify_lv_right.txt_next_lv:setVisible(false)
    end

    local totalAttr = self.item:getTotalAttr()
    local zhenfaTemplate = BattleArrayData:objectByID(self.item.id)
    local growTab = zhenfaTemplate:getGrowAttrTable()
    for k, v in pairs(totalAttr) do
        if tonumber(k) >= EnumAttributeType.Blood and tonumber(k) <= EnumAttributeType.Agility then
            local attrNum = covertToDisplayValue(k, v)
            self.attr_tab[tonumber(k)].txt_current_lv:setText("+" .. attrNum)

            local growNum = growTab[tonumber(k)] or 0
            local nextNum = tonumber(v) + tonumber(growNum)
            self.attr_tab[tonumber(k)].txt_next_lv:setVisible(true)
            if curLev + 1 <= limitIntensifyLevel then
                self.attr_tab[tonumber(k)].txt_next_lv:setText(nextNum)
            else
                self.attr_tab[tonumber(k)].txt_next_lv:setVisible(false)
            end
        end
    end
end

--下面阵法强化面板
function ZhenFaStrongLayer:refreshBottom()
    self:refreshJindu()
    for i = 1, 3 do
        if self.toolList[i] then
            self.btnToolList[i]:setVisible(true)
            self.btnToolList[i].txtTipsExp:setVisible(true)
            
            local goodsId = tonumber(self.toolList[i])
            local itemData = ItemData:objectByID(goodsId)   
            local bagNumber = BagManager:getItemNumById( goodsId )

            self.btnToolList[i].goodId = goodsId
            self.btnToolList[i].goodNum = bagNumber
            self.btnToolList[i].goodExp = itemData.provide_exp
            local str = stringUtils.format(localizable.StrategyCard_tool_tips, itemData.provide_exp)
            self.btnToolList[i].txtTipsExp:setText(str)

            self.btnToolList[i]:setTextureNormal(GetColorIconByQuality(itemData.quality))
            self.btnToolList[i].btnImg:setTexture(itemData:GetPath())
            self.btnToolList[i].txtNum:setText(bagNumber)
        else
            self.btnToolList[i]:setVisible(false)
            self.btnToolList[i].txtTipsExp:setVisible(false)
        end
    end
end

function ZhenFaStrongLayer:refreshJindu(exp)
    local curLevel = self.item:getLevel() or 0
    local star = self.item:getStarLevel() or 0
    local item = BattleArrayStarData:getItemInfo(self.item.id, star)
    local maxLevel = item.intensify_level + self.addIntensifyLevel
    self.txt_qianghua1:setText("LV" .. curLevel)
    self.txt_qianghua2:setText("/" .. maxLevel)

    local currExp = exp or self.exp
    local per = 0
    if self.needExp and self.needExp ~= 0 then
        per = currExp / self.needExp * 100
    end
    self.txt_shuzi:setText(currExp .. "/" .. self.needExp)
    self.bar_jindu:setPercent(per)

    if curLevel >= StrategyCardManager.kMaxIntensifyLevel and per >= 100 then
        self.txt_shuzi:setVisible(false)
        self.img_max:setVisible(true)
        self.btn_onekey:setTouchEnabled(false)
        self.btn_onekey:setGrayEnabled(true)
    else
        self.txt_shuzi:setVisible(true)
        self.img_max:setVisible(false)
        self.btn_onekey:setTouchEnabled(true)
        self.btn_onekey:setGrayEnabled(false)
    end

    self.txt_tips:setVisible(false)
    local maxLv = MainPlayer:getBattleArrayMaxLevel()
    if curLevel >= maxLevel then
        self.txt_tips:setVisible(true)
        if maxLevel >= maxLv then
            self.txt_tips:setText(localizable.StrategyCard_txt_tupo_max)
        else
            self.txt_tips:setText( stringUtils.format(localizable.StrategyCard_txt_need_tupo_star, star + 1) )
        end
    end
end

function ZhenFaStrongLayer:setEquipGmId(gmId)
    self.gmId = gmId
    self:refreshUI()
end

function ZhenFaStrongLayer:removeUI()
	self.super.removeUI(self)
end


function ZhenFaStrongLayer:intensifyEquipEffect()
	if self.equipEffect == nil then
		TFResourceHelper:instance():addArmatureFromJsonFile("effect/equiIntensify.xml")
		local effect = TFArmature:create("equiIntensify_anim")
		effect:setAnimationFps(GameConfig.ANIM_FPS)

		local img_icon = self.img_fz
		effect:setPosition(ccp(430, 70))
        effect:setZOrder(100)
		img_icon:addChild(effect)
		self.equipEffect = effect
	end
	self.equipEffect:playByIndex(0, -1, -1, 0)

    if not self.shuaguang_effect_lv then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
        local effect = TFArmature:create("equipIntensify_3_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)

        local img_intensify_lv = self.img_intensify_lv_right
        effect:setPosition(ccp(130, -47))
        img_intensify_lv:addChild(effect)
        self.shuaguang_effect_lv = effect
    end
    self.shuaguang_effect_lv:playByIndex(0, -1, -1, 0)

    self.shuaguang_effect = self.shuaguang_effect or {}
    for i = 1, #self.attr_tab do
        if not self.shuaguang_effect[i] then
            TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
            local effect = TFArmature:create("equipIntensify_3_anim")
            effect:setAnimationFps(GameConfig.ANIM_FPS)

            local img_intensify_lv = self.attr_tab[i]
            effect:setPosition(ccp(130, -47))
            img_intensify_lv:addChild(effect)
            self.shuaguang_effect[i] = effect
        end
        self.shuaguang_effect[i]:playByIndex(0, -1, -1, 0)
    end
end

function ZhenFaStrongLayer:intensifyNumEffect(widget , text)
	
	widget:setText("+"..text);
	TFDirector:killAllTween(widget)
	widget:setVisible(true)
	widget:setScale(0.1)
	local tween = {
		target = widget,
			{
				duration = 0.1,
				scale = 1,
			},
			{
				duration = 0.1,
				scale = 0.8,
			},
			{
				duration = 0.1,
				scale = 1,
			},
			{
				duration = 0,
				delay = 1,
				onComplete = function ()
					widget:setVisible(false)
				end,
			},
	}
	TFDirector:toTween(tween)

end


function ZhenFaStrongLayer.onekeyQianghuaClickHandle(btn)
    local self = btn.logic
    --[[
    if self.equipLevelUpEffect then
        self.equipLevelUpEffect:removeMEListener(TFARMATURE_COMPLETE)
        self.equipLevelUpEffect:removeFromParent()
    end
    if self.equipLevelUpEffect then
        self.equipLevelUpEffect = nil
        self:setEquipGmId(self.gmId)
    end
    ]]
    local level = self.item:getLevel()
    local quality = self.item:getQuality()
    local currExp = self.item.currExp or 0
    local maxExp = self.needExp
    local toolList = self.toolList
    local needExp = maxExp - currExp
    local msg = nil
    for i = 1, 3 do
        if toolList[i] then
            local goodsId = tonumber(toolList[i])
            local bagNumber = BagManager:getItemNumById( goodsId )
            local itemData = ItemData:objectByID(goodsId)   
            local needNumber = math.ceil(needExp/itemData.provide_exp)
            if bagNumber > 0 then
                msg = msg or {}
                if needNumber > bagNumber then
                    needExp = needExp - itemData.provide_exp*bagNumber
                    msg[goodsId] = bagNumber
                else
                    msg[goodsId] = needNumber
                    break
                end     
            end 
        end
    end
    if msg then
        local tab = {}
        local temp = {}
        for k, v in pairs(msg) do
            temp[1] = tonumber(k)
            temp[2] = tonumber(v)
            table.insert(tab, temp)
        end
        local equip = StrategyCardManager:getStrategyCardByGmid(self.gmId)
        StrategyCardManager:sendIntensifyMsg(self.item.gmId, tab)
    else
        local itemList = {}
        for k, v in pairs(self.toolList) do
            table.insert(itemList,{tonumber(v),EnumDropType.GOODS})
        end
        if ResGetWayManager:openResGetLayerByList(itemList) == true then
            return false
        end
        toastMessage(localizable.StrategyCard_tool_not_enough)
    end
end

function ZhenFaStrongLayer:registerEvents()
	self.super.registerEvents(self)
    self.btn_onekey:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onekeyQianghuaClickHandle), 1)
    
    function onTouchBegin(widget, pos, offset)
        local card = StrategyCardManager:getStrategyCardByGmid(self.gmId)
        if card == nil then
            return
        end

        local currLevel = card:getLevel()
        local starInfo = BattleArrayStarData:getItemInfo(card.id,card.starLevel) or {}
        local currMaxLevel = (starInfo.intensify_level or 0) + self.addIntensifyLevel
        if currLevel >= currMaxLevel then
            toastMessage(localizable.StrategyCard_level_limit)
            return
        end
        local curr_num = BagManager:getItemNumById( widget.goodId ) or 0
        if curr_num < 1 then
            self.isSendDataToServer = true
            local itemList = {}
            table.insert(itemList,{widget.goodId,EnumDropType.GOODS})
            if ResGetWayManager:openResGetLayerByList(itemList) == true then
                return false
            end
            toastMessage(localizable.StrategyCard_tool_not_enough)
        else
            self.touchLongToolNum = 1
            self.touchLongToolId = widget.goodId
            self.touchLongBtnIndex = widget.showIndex
            self.isSendDataToServer = false
            self:createLongTouch(widget.showIndex)
        end
    end

    function onTouchEnd(widget, pos)
        self:deleteTouch()
    end 

    for i = 1, 3 do      
        self.btnToolList[i]:addMEListener(TFWIDGET_TOUCHBEGAN, onTouchBegin)
        self.btnToolList[i]:addMEListener(TFWIDGET_TOUCHENDED, onTouchEnd)              
        self.btnToolList[i].logic = self
        self.btnToolList[i].showIndex = i
    end
    
	self.CoinChangeCallback = function(event)
		self:refreshUI()
	end
	TFDirector:addMEGlobalListener(MainPlayer.CoinChange,self.CoinChangeCallback)

    self.onStrongCallBack = function(event)
        local type = event.data[1][1]
        if type == StrategyCardManager.handleIntensify then
            local equip = StrategyCardManager:getStrategyCardByGmid(self.item.gmId)
            local maxLv =MainPlayer:getBattleArrayMaxLevel()
            local level = math.min( equip:getLevel(), maxLv )
            local oldLevel = self.oldLevel
            print(">>>>>>>>>>", oldLevel, level)
            if oldLevel < level then
                local data = {change_attr = {}}

                local zhenfaTemplate = BattleArrayData:objectByID(self.item.id)
                data.change_attr = zhenfaTemplate:getGrowAttrTable()

                self:playIntensifyEffect(data)
            end
            self:refreshUI(true)
        end
    end
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onStrongCallBack)
end
    
function ZhenFaStrongLayer:playIntensifyEffect(data)
    self:intensifyEquipEffect()
    local txt_numLv_effect = self.img_intensify_lv_right.txt_numLv_effect
    self:intensifyNumEffect(txt_numLv_effect, 1)

    for i = 1, #self.attr_tab do
        local txt_numattr_effect = self.attr_tab[i].txt_numLv_effect
        if data.change_attr[i] and data.change_attr[i] ~= 0 then
            self:intensifyNumEffect(txt_numattr_effect , data.change_attr[i])
        end
    end

    if not self.barLevelUpEffect then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
        local effect = TFArmature:create("equipIntensify_3_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        local width = self.bar_jindu:getContentSize().width
        effect:setPosition(ccp(-width/2,-60))
        effect:setScaleX(1.25)
        self.bar_jindu:addChild(effect,100)
        self.barLevelUpEffect = effect

        effect:addMEListener(TFARMATURE_COMPLETE,function()
            effect:removeMEListener(TFARMATURE_COMPLETE) 
            effect:removeFromParentAndCleanup(true)
            self.barLevelUpEffect = nil
        end)
    end

    self.barLevelUpEffect:playByIndex(0, -1, -1, 0)
end

function ZhenFaStrongLayer:createLongTouch(btnIndex)
    if self.delayLongTouchTimer then
        TFDirector:removeTimer(self.delayLongTouchTimer)
        self.delayLongTouchTimer = nil
    end
    if self.touchLongTimer then
        TFDirector:removeTimer(self.touchLongTimer)
        self.touchLongTimer = nil
    end
    self.delayLongTouchTimer = TFDirector:addTimer(300, -1, nil,
        function ()
            if self.delayLongTouchTimer then
                TFDirector:removeTimer(self.delayLongTouchTimer)
                self.delayLongTouchTimer = nil
            end
            self.touchLongTimer = TFDirector:addTimer(66, -1, nil,
                function ()
                    local btn = self.btnToolList[btnIndex] 
                    local showNum = btn.goodNum - self.touchLongToolNum        
                    local maxExp = self.needExp
                    local currExp = self.exp + (self.touchLongToolNum*btn.goodExp) 
                    self:refreshJindu(currExp)
                    if showNum > 0 and currExp < maxExp then
                        self.touchLongToolNum = self.touchLongToolNum + 1
                        showNum = showNum - 1
                        btn.txtNum:setText(showNum)
                        local function flyMoveCallBack()                            
                        end                     
                        self:showFlyBegin(self.touchLongBtnIndex, flyMoveCallBack)
                    else
                        self:deleteTouch()
                    end
                end)
        end)    
end

function ZhenFaStrongLayer:deleteTouch()
    if self.delayLongTouchTimer then
        TFDirector:removeTimer(self.delayLongTouchTimer)
        self.delayLongTouchTimer = nil
    end
    if self.touchLongTimer then
        TFDirector:removeTimer(self.touchLongTimer)
        self.touchLongTimer = nil
    end

    if self.isSendDataToServer == false then
        local curr_num = BagManager:getItemNumById( self.touchLongToolId )
        if curr_num >= self.touchLongToolNum then
            local function flyMoveCallBack()
            end
            local msg = {}
            --msg[self.touchLongToolId] = self.touchLongToolNum
            local tab = {self.touchLongToolId, self.touchLongToolNum}
            table.insert(msg, tab)

            StrategyCardManager:sendIntensifyMsg(self.item.gmId, msg)
            self:showFlyBegin(self.touchLongBtnIndex, flyMoveCallBack)
        else
            toastMessage(localizable.StrategyCard_tool_not_enough)
        end
    end
    self.isSendDataToServer = true
end

function ZhenFaStrongLayer:showFlyBegin(pos,flyMoveCallBack)
    play_chuangonghunpoyidong()

    local topos = self.btnToolList[pos]:convertToWorldSpace(ccp(0,0))

    local resPath = "effect/role_transfer_begin.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local flyPic = TFArmature:create("role_transfer_begin_anim")

    flyPic:setAnimationFps(GameConfig.ANIM_FPS)
    flyPic:setPosition(ccp(topos.x-70 , topos.y-90))
    -- flyPic:setPosition(ccp(topos.x + 35, topos.y-90))
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
            self:showFlyMove(pos,flyMoveCallBack)
        end
    end)

    flyPic:playByIndex(0, -1, -1, 0)
end

function ZhenFaStrongLayer:showFlyMove(pos, flyMoveCallBack)
    play_chuangonghunpoyidong()

    local topos = self.btnToolList[pos]:convertToWorldSpace(ccp(0,0))

    local resPath = "effect/role_transfer_move.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local moveEffect = TFArmature:create("role_transfer_move_anim")

    moveEffect:setAnimationFps(GameConfig.ANIM_FPS)
    moveEffect:setPosition(ccp(topos.x - 110, topos.y))
    -- moveEffect:setPosition(ccp(topos.x, topos.y))

    self:addChild(moveEffect,100)

    moveEffect:playByIndex(0, -1, -1, 1)

    local toPos = self.bar_jindu:convertToWorldSpace(ccp(0,0))
    local tween = 
    {
        target = moveEffect,
        {
            ease = {type=TFEaseType.EASE_IN_OUT, rate=9},
            duration = 0.2,
            x = toPos.x-370,
            -- x = toPos.x-280,
            y = toPos.y,
            onComplete = function ()

                if self.endEffect == nil then
                    local resPath = "effect/role_transfer_end.xml"
                    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
                    local endEffect = TFArmature:create("role_transfer_end_anim")

                    endEffect:setAnimationFps(GameConfig.ANIM_FPS)
                    endEffect:setPosition(ccp(100, 275))
                    self.bar_jindu:addChild(endEffect,100)
                    -- endEffect:setScaleX(1.6)
                    
                    endEffect:addMEListener(TFARMATURE_COMPLETE,function()
                        endEffect:removeMEListener(TFARMATURE_COMPLETE) 
                        endEffect:removeFromParentAndCleanup(true)
                        self.endEffect = nil
                    end)
                    endEffect:playByIndex(0, -1, -1, 0)
                    self.endEffect = endEffect
                end

                moveEffect:removeFromParentAndCleanup(true)
                flyMoveCallBack()
            end,
        },
    }
    TFDirector:toTween(tween)
end

function ZhenFaStrongLayer:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(MainPlayer.CoinChange, self.CoinChangeCallback)
    self.CoinChangeCallback = nil

    TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onStrongCallBack)
    self.onStrongCallBack = nil
end

return ZhenFaStrongLayer
