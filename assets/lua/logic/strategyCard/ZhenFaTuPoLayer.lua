-- client side ZhenFaTuPoLayer.lua
--[[
 * @Description: 阵法突破界面
 ]]
-- script writer wuqi
-- creation time 2016-08-05

local ZhenFaTuPoLayer = class("ZhenFaTuPoLayer", BaseLayer)

ZhenFaTuPoLayer.kMaxHoleNum = 3

function ZhenFaTuPoLayer:ctor(gmId)
    self.super.ctor(self,gmId)
    self.gmId = gmId
    self:init("lua.uiconfig_mango_new.zhenfa.ZhenFaTuPo")
end

function ZhenFaTuPoLayer:initUI(ui)
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

    self.TabViewUI = TFDirector:getChildByPath(ui, "panel_huadong")

    self.panel_tupo = TFDirector:getChildByPath(ui, "panel_tupo")
    self.btn_tool = {}
    for i = 1, 2 do
        self.btn_tool[i] = TFDirector:getChildByPath(self.panel_tupo, "btn_tool" .. i)
        self.btn_tool[i].img_tool = TFDirector:getChildByPath(self.panel_tupo, "img_tool" .. i)
        self.btn_tool[i].txt_num1 = TFDirector:getChildByPath(self.panel_tupo, "txt_num" .. i .. "_1")
        self.btn_tool[i].txt_num2 = TFDirector:getChildByPath(self.panel_tupo, "txt_num" .. i .. "_2")
    end
    self.btn_tupo = TFDirector:getChildByPath(ui, "btn_tupo")
    self.btn_tupo.logic = self
    self.panel_cailiao = TFDirector:getChildByPath(ui, "Panel_cailiao")

    self.cellModel = TFDirector:getChildByPath(self.TabViewUI, "img_wjh")
    self.cellModel:retain()
    self.cellModel:setVisible(false)
    self.cellModel:removeFromParent(true)

    --右边属性面板
    self.panel_sx = TFDirector:getChildByPath(ui, "panel_sx")
    self.panel_current = TFDirector:getChildByPath(self.panel_sx, "panel_current")
    self.panel_star_current = TFDirector:getChildByPath(self.panel_current, "panel_star_current")
    self.panel_new_val = TFDirector:getChildByPath(self.panel_sx, "panel_new_val")
    self.img_star_old = {}
    self.img_star_new = {}
    for i = 1, 5 do
        self.img_star_old[i] = TFDirector:getChildByPath(self.panel_current, "img_star_" .. i)
        self.img_star_new[i] = TFDirector:getChildByPath(self.panel_new_val, "img_star_" .. i)
    end
    self.img_to_shuxing = TFDirector:getChildByPath(self.panel_new_val, "img_to_1")

    self.img_di = {}
    --升星效果
    for i = 1, 3 do
        self.img_di[i] = TFDirector:getChildByPath(self.panel_sx, "img_di" .. i)
        self.img_di[i]:setVisible(false)

        self.img_di[i].lbl_base = TFDirector:getChildByPath(self.img_di[i], "lbl_base")
        self.img_di[i].lbl_growth = TFDirector:getChildByPath(self.img_di[i], "lbl_growth")
        self.img_di[i].txt_base_current = TFDirector:getChildByPath(self.img_di[i], "txt_base_current")
        self.img_di[i].txt_growth_current = TFDirector:getChildByPath(self.img_di[i], "txt_growth_current")
        self.img_di[i].img_to1 = TFDirector:getChildByPath(self.img_di[i], "img_to_1")
        self.img_di[i].img_to = TFDirector:getChildByPath(self.img_di[i], "img_to_2")
        self.img_di[i].txt_base_new = TFDirector:getChildByPath(self.img_di[i], "txt_base_new")
        self.img_di[i].txt_growth_new = TFDirector:getChildByPath(self.img_di[i], "txt_growth_new")
        self.img_di[i].img_to:setVisible(false)
    end

    self.img_fz_copy = TFDirector:getChildByPath(ui, "img_fz_copy")
    self.iconModel = clone(self.img_fz_copy)
    self.iconModel:retain()
    self.iconModel:removeFromParent()
    self.iconModel:setVisible(false)
end

function ZhenFaTuPoLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function ZhenFaTuPoLayer:refreshUI()
    self.item = StrategyCardManager:getStrategyCardByGmid(self.gmId)

    if self.tableViewEffect then
        self.tableViewEffect:removeMEListener(TFARMATURE_COMPLETE) 
        self.tableViewEffect:removeFromParent()             
        self.tableViewEffect = nil
    end
        
    --self.item.equip = {1}
    --self.item.id = 50026
    if not self.item then
        return
    end
    self.oldStar = self.item:getStarLevel() or 0

    self:refreshLeft()
    self:refreshRight()
end

function ZhenFaTuPoLayer:refreshLeft()
    self:refreshIcon()
    self:refreshIconModel()
    self:refreshJihuo()
end

function ZhenFaTuPoLayer:refreshRight()
    self:refreshShuxing()
    self:refreshTool()
end

function ZhenFaTuPoLayer:refreshIcon()
    self.img_quality:setTexture(GetColorIconByQuality_118(self.item:getQuality()))
    self.img_icon:setTexture(self.item:getPath())
    self.txt_intensify_lv:setText("+" .. self.item:getLevel())
    self.txt_name:setText(self.item:getName())

    --阵法所装备阵容
    if self.item and self.item:checkInStrategy() then
        self.img_equiped:setVisible(true)
        self.img_equiped:setTexture( "ui_new/zhenfa/img_yzp.png" )
        self.txt_equiped_name:setVisible(false)
        
        --local temp = self.item.equip[1] or 0
        --local strategyName = getFightStrategyNameByType(temp)
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

function ZhenFaTuPoLayer:refreshIconModel()
    local img_quality = TFDirector:getChildByPath(self.iconModel, "img_quality")
    local img_icon = TFDirector:getChildByPath(self.iconModel, "img_icon")
    local txt_intensify_lv = TFDirector:getChildByPath(self.iconModel, "txt_intensify_lv")
    local txt_name = TFDirector:getChildByPath(self.iconModel, "txt_name")
    local img_equiped = TFDirector:getChildByPath(self.iconModel, "img_equiped")
    local txt_equiped_name = TFDirector:getChildByPath(self.iconModel, "txt_equiped_name")
    local panel_star = TFDirector:getChildByPath(self.iconModel, "panel_star")
    local img_star = {}
    for i = 1, 5 do
        img_star[i] = TFDirector:getChildByPath(self.iconModel, "img_star_".. i)
    end

    img_quality:setTexture(GetColorIconByQuality_118(self.item:getQuality()))
    img_icon:setTexture(self.item:getPath())
    txt_intensify_lv:setText("+" .. self.item:getLevel())
    txt_name:setText(self.item:getName())


    --阵法所装备阵容
    if self.item.equip and #self.item.equip > 0 then
        --img_equiped:setVisible(true)
        --local temp = self.item.equip[1] or 0
        --local strategyName = getFightStrategyNameByType(temp)
        --local str = toVerticalString(strategyName)
        --txt_equiped_name:setText(str)

        img_equiped:setVisible(true)
        img_equiped:setTexture( "ui_new/zhenfa/img_yzp.png" )
        txt_equiped_name:setVisible(false)
    else
        img_equiped:setVisible(false)
    end
    
    --星级(兼容10星)
    local star = self.item:getStarLevel()
    local texture1 = "ui_new/equipment/tjp_xingxing_icon.png"
    local texture2 = "ui_new/equipment/tjp_xingxing2_icon.png"
    if star <= 5 then
        for i = 1, 5 do
            if i <= star then
                img_star[i]:setTexture(texture1)
                img_star[i]:setVisible(true)
            else
                img_star[i]:setVisible(false)
            end
        end
    else
        local delta = star - 5
        for i = 1, 5 do
            img_star[i]:setVisible(true)
            if i <= delta then
                img_star[i]:setTexture(texture2)
            else
                img_star[i]:setTexture(texture1)
            end
        end
    end
end

function ZhenFaTuPoLayer:refreshJihuo()

    local function changeOffset()
        local panelHight = self.TabViewUI:getContentSize().height
        local star = self.item:getStarLevel()
        local offsetIndex = star
        
        local viewHeight = (5 - offsetIndex + 1) * 75 - panelHight
        if viewHeight < 0 then
            viewHeight = 0
        end
        self.TabView:setContentOffset(ccp(0, -viewHeight - 15))
    end

    if self.TabView then
        self.TabView:reloadData()
        changeOffset()
        return
    end
    self.TabView = TFTableView:create()
    self.TabView:setTableViewSize(self.TabViewUI:getContentSize())
    self.TabView:setDirection(TFTableView.TFSCROLLVERTICAL)    
    self.TabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    self.TabView.logic = self    
    self.TabView:setPosition(ccp(0, 0))

    self.TabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.TabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.TabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.TabView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
    self.TabViewUI:addChild(self.TabView)
    self.TabView:reloadData()
    changeOffset()
end

function ZhenFaTuPoLayer.cellSizeForTable(table,idx)
    local cellH = 75
    if idx == StrategyCardManager.kMaxStarLevel then
        cellH = 105
    end
    return cellH, 305
end

function ZhenFaTuPoLayer.numberOfCellsInTableView(table)
    local self = table.logic
    return StrategyCardManager.kMaxStarLevel + 1
end

function ZhenFaTuPoLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()

        panel = self.cellModel:clone()
        panel:setVisible(true)
        local offset_x = self.TabViewUI:getContentSize().width - panel:getContentSize().width
        panel:setPosition(ccp(180, 20))
        cell:addChild(panel)
        cell.panelNode = panel
    else
        panel = cell.panelNode
    end

    if idx ~= StrategyCardManager.kMaxStarLevel then
        panel:setPosition(ccp(180, 20))
    else
        panel:setPosition(ccp(180, 50))
    end

    idx = idx + 1
    self:cellInfoSet(cell, panel, idx)

    return cell
end

function ZhenFaTuPoLayer:cellInfoSet(cell, panel, idx)
    local bgOff = panel
    local titleOff = TFDirector:getChildByPath(bgOff, 'txt_sx')
    local shuomingOff = TFDirector:getChildByPath(bgOff, 'txt_tips')
    local panel_star = TFDirector:getChildByPath(bgOff, "panel_star")
    local curStar = self.item:getStarLevel()

    local img_star = {}
    local img_star1 = {}

    local bgOn = TFDirector:getChildByPath(panel, 'img_jh')
    local titleOn = TFDirector:getChildByPath(bgOn, 'txt_sx')
    local shuomingOn = TFDirector:getChildByPath(bgOn, 'txt_tips')
    local panel_star1 = TFDirector:getChildByPath(bgOn, "panel_star")

    local nowIndex = idx - 1
    local id = self.item.id
    local starItem = BattleArrayStarData:getItemInfo(id, nowIndex)
    local str = starItem.desc

    for i = 1, 5 do
        img_star[i] = TFDirector:getChildByPath(panel_star, "img_star_" .. i)
        img_star1[i] = TFDirector:getChildByPath(panel_star1, "img_star_" .. i)
    end

    local texture1 = "ui_new/equipment/tjp_xingxing_icon.png"
    local texture_empty = "ui_new/smithy/star_empty.png"
    
    if nowIndex <= 5 then
        for i = 1, 5 do
            if i <= nowIndex then
                img_star[i]:setTexture(texture1)
                img_star1[i]:setTexture(texture1)
            else
                img_star[i]:setTexture(texture_empty)
                img_star1[i]:setTexture(texture_empty)
            end
        end
    end

    titleOff:setText( str )
    titleOn:setText( str )

    shuomingOff:setVisible(true)
    shuomingOn:setVisible(true)
    shuomingOff:setText( stringUtils.format(localizable.StrategyCard_txt_star_jihuo, nowIndex) )
    shuomingOn:setText( stringUtils.format(localizable.StrategyCard_txt_star_jihuo, nowIndex) )

    if nowIndex <= curStar then
        bgOn:setVisible(true)
        shuomingOff:setVisible(false)
        shuomingOn:setVisible(false)
    else
        bgOn:setVisible(false)
    end

    if self.needShowEffectIndex and self.needShowEffectIndex == nowIndex then
        if self.tableViewEffect then
            self.tableViewEffect:removeMEListener(TFARMATURE_COMPLETE) 
            self.tableViewEffect:removeFromParent()             
            self.tableViewEffect = nil
        end
        bgOn:setVisible(false)

        local filePath = "effect/mainrole/cellRefresh.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(filePath)
        local effect = TFArmature:create("cellRefresh_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)

        effect:setPosition(ccp(155,38))
        effect:setScaleY(0.8)
        panel:addChild(effect,800)
        self.needShowEffectIndex = nil
        local temp = 0
        effect:addMEListener(TFARMATURE_UPDATE, function()
            temp = temp + 1
            if temp == 25 then
                bgOn:setVisible(true)
            end
        end)
        effect:addMEListener(TFARMATURE_COMPLETE,function()
            print('TFARMATURE_COMPLETE = TFARMATURE_COMPLETE')
            effect:removeMEListener(TFARMATURE_COMPLETE) 
            effect:removeFromParent()        
            effect = nil   
            self.tableViewEffect = nil
        end)
        self.tableViewEffect = effect
        effect:playByIndex(0, -1, -1, 0)
    end
end

function ZhenFaTuPoLayer.tableScroll(table)
  
end

function ZhenFaTuPoLayer:refreshShuxing()
    local id = self.item.id
    local starLevel = self.item:getStarLevel()
    local starItem = BattleArrayStarData:getItemInfo(id, starLevel)

    self.img_to_shuxing:setVisible(true)
    for i = 1, 3 do
        self.img_di[i].img_to:setVisible(true)
        self.img_di[i].txt_base_new:setVisible(true)
        self.img_di[i].txt_growth_new:setVisible(true)
    end
    --self.img_to_shuxing:setVisible(true)
    
    local texture1 = "ui_new/equipment/tjp_xingxing_icon.png"
    local texture_empty = "ui_new/smithy/star_empty.png"
    local nextStarLev = math.min(starLevel + 1, StrategyCardManager.kMaxStarLevel)
    if starLevel <= 5 then
        for i = 1, 5 do
            if i <= starLevel then
                self.img_star_old[i]:setTexture(texture1)
            else
                self.img_star_old[i]:setTexture(texture_empty)
            end

            if i <= nextStarLev then
                self.img_star_new[i]:setTexture(texture1)
            else
                self.img_star_new[i]:setTexture(texture_empty)
            end
        end
    end

    --[[
    --当前星级阵位孔总属性
    self.holeTotalTabCur = {}
    for i = 1, starLevel + 1 do
        local star = i - 1
        local item = BattleArrayStarData:getItemInfo(id, star)
        for j = 1, item.num do
            local tab = item:getAttributeByPos(j)
            for k, v in pairs(tab) do
                local index = tonumber(k)
                self.holeTotalTabCur[index] = self.holeTotalTabCur[index] or 0
                self.holeTotalTabCur[index] = self.holeTotalTabCur[index] + tonumber(v)
            end
        end
    end
    --下一星级阵位孔总属性
    self.holeTotalTabNext = clone(self.holeTotalTabCur)
    if starLevel < StrategyCardManager.kMaxStarLevel then
        local star = starLevel + 1
        local item = BattleArrayStarData:getItemInfo(id, star)
        for i = 1, item.num do
            local tab = item:getAttributeByPos(i)
            for k, v in pairs(tab) do
                local index = tonumber(k)
                self.holeTotalTabNext[index] = self.holeTotalTabNext[index] or 0
                self.holeTotalTabNext[index] = self.holeTotalTabNext[index] + tonumber(v)
            end
        end
    end

    local newStarItem = BattleArrayStarData:getItemInfo(id, nextStarLev)
    for i = 1, self.kMaxHoleNum do
        if i <= starItem.num then
            self.img_di[i]:setVisible(true)
            local tab = starItem:getAttributeByPos(i)
            local newTab = newStarItem:getAttributeByPos(i)
            for k, v in pairs(tab) do
                self.img_di[i].lbl_base:setText(AttributeTypeStr[tonumber(k)])
                self.img_di[i].lbl_growth:setText(AttributeTypeStr[tonumber(k)])
                self.img_di[i].txt_growth_current:setText(tonumber(v))
                self.img_di[i].txt_base_current:setText( self.holeTotalTabCur[tonumber(k)] )

                self.img_di[i].txt_growth_new:setText(newTab[tonumber(k)])
                self.img_di[i].txt_base_new:setText( self.holeTotalTabNext[tonumber(k)] )
            end
        else
            self.img_di[i]:setVisible(false)
        end
    end
    ]]

    local newStarItem = BattleArrayStarData:getItemInfo(id, nextStarLev)
    for i = 1, self.kMaxHoleNum do
        if i <= starItem.num then
            self.img_di[i]:setVisible(true)
            local tab = starItem:getAttributeByPos(i)
            local newTab = newStarItem:getAttributeByPos(i)
            local num = 1

            self.img_di[i].lbl_growth:setVisible(false)
            self.img_di[i].txt_growth_current:setVisible(false)
            self.img_di[i].txt_growth_new:setVisible(false)
            self.img_di[i].img_to:setVisible(false)
            for k, v in pairs(tab) do
                if num == 1 then
                    self.img_di[i].lbl_base:setText(AttributeTypeStr[tonumber(k)])
                    local str = "+"..v
                    local newStr = newTab[tonumber(k)]
                    if (isPercentAttr(tonumber(k))) then
                        str = "+"..(tonumber(v) / 100).."%"
                        newStr  = (tonumber(newStr) / 100).."%"
                    end
                    self.img_di[i].txt_base_current:setText( str )
                    self.img_di[i].txt_base_new:setText( newStr )
                elseif num == 2 then
                    self.img_di[i].img_to:setVisible(true)
                    self.img_di[i].lbl_growth:setVisible(true)
                    self.img_di[i].txt_growth_current:setVisible(true)
                    self.img_di[i].txt_growth_new:setVisible(true)
                    self.img_di[i].lbl_growth:setText(AttributeTypeStr[tonumber(k)])
                    local str = "+"..v
                    local newStr = newTab[tonumber(k)]
                    if (isPercentAttr(tonumber(k))) then
                        str     = "+"..(tonumber(v) / 100).."%"
                        newStr  = (tonumber(newStr) / 100).."%"
                    end
                    self.img_di[i].txt_growth_current:setText( str )
                    
                    self.img_di[i].txt_growth_new:setText( newStr )
                end
                num = num + 1
            end
        else
            self.img_di[i]:setVisible(false)
        end
    end
    if starLevel >= StrategyCardManager.kMaxStarLevel then
        self.img_to_shuxing:setVisible(false)

        for i = 1, 3 do
            self.img_di[i].img_to1:setVisible(false)
            self.img_di[i].img_to:setVisible(false)
            self.img_di[i].txt_base_new:setVisible(false)
            self.img_di[i].txt_growth_new:setVisible(false)
            
        end
        
        self.panel_new_val:setVisible(false)

        self.btn_tupo:setTouchEnabled(false)
        self.btn_tupo:setGrayEnabled(true)
    else
        self.btn_tupo:setTouchEnabled(true)
        self.btn_tupo:setGrayEnabled(false)

    end
    
end

function ZhenFaTuPoLayer:refreshTool()
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

    --[[
    local initPosX = -50
    local initPosY = -60
    for reward in self.consumeTab:iterator() do
        local reward_item = Public:createRewardNode(reward)
        reward_item:setScale(0.6)
        reward_item:setPosition(ccp(initPosX, initPosY))
        self.panel_cailiao:addChild(reward_item)
        initPosX = initPosX + 100
        count = count + 1
    end
    ]]

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

function ZhenFaTuPoLayer:dispose()
    self.super.dispose(self)
end

function ZhenFaTuPoLayer:removeUI()
    self.super.removeUI(self)
end

function ZhenFaTuPoLayer:setEquipGmId(gmId)
    self.bStarPlaying = false
    self.gmId = gmId
    self:refreshUI()
end

function ZhenFaTuPoLayer:registerEvents()
	self.super.registerEvents(self)

    self.btn_tupo:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTupoClickHandle), 1)

    self.onTupoCallBack = function(event)
        local type = event.data[1][1]
        self.oldStar = self.oldStar or 0
        if type == StrategyCardManager.handleStarUp then
            self.bStarPlaying = true
            local equip = StrategyCardManager:getStrategyCardByGmid(self.item.gmId)
            local newStar = equip:getStarLevel() or 0
            if newStar > self.oldStar then
                play_qianghuabaoji_shengxingchenggong()
                --self:refreshUI()
                self.needShowEffectIndex = newStar
                self:playSuccessEffect(true)
            else
                toastMessage(localizable.StrategyCard_shengxing_fail)
            end
        end
    end
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onTupoCallBack)
end


function ZhenFaTuPoLayer:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onTupoCallBack)
    self.onTupoCallBack = nil
end

function ZhenFaTuPoLayer.onTupoClickHandle(sender)
    local self = sender.logic

    --test
    --self.needShowEffectIndex = 1
    --self:refreshUI()

    if self.bStarPlaying then
        return
    end
    if self.item:getStarLevel() >= StrategyCardManager.kMaxStarLevel then
        toastMessage(localizable.StrategyCard_tupo_max)
        return
    end

    local bCan = true
    for v in self.consumeTab:iterator() do
        if v.type == EnumDropType.COIN then 
            if not MainPlayer:isEnoughCoin(v.number, true) then
                bCan = false
                toastMessage(localizable.StrategyCard_tupo_not_enough)
                return
            end
        elseif v.type == EnumDropType.SYCEE then
            if not MainPlayer:isEnoughSycee(v.number, true) then
                bCan = false
                toastMessage(localizable.StrategyCard_tupo_not_enough)
                return
            end
        elseif v.type == EnumDropType.GOODS then
            local curNum = BagManager:getItemNumById(v.itemid)
            if curNum < v.number then
                bCan = false
                toastMessage(localizable.StrategyCard_tupo_not_enough)
                return
            end
        end
    end
    if bCan then
        StrategyCardManager:sendStarUpMsg(self.item.gmId)        
    end
end

--显示升星成功对话框
function ZhenFaTuPoLayer:showSuccessDialog()
    if self.layer_result == nil then
        self.layer_result = TFImage:create("ui_new/smithy/shengxing_word.png")
        self.layer_result:setAnchorPoint(ccp(0.5,0.5))
        self.layer_result:setPosition(ccp(self.ui:getContentSize().width/2,self.ui:getContentSize().height/2))
        self.ui:addChild(self.layer_result)
    end

    TFDirector:killAllTween(self.layer_result)
    self.layer_result:setVisible(true)
    self.layer_result:setZOrder(100)
    self.layer_result:setScale(0.1)
    local tween = {
        target = self.layer_result,
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
                    self.layer_result:setVisible(false)
                    self.bStarPlaying = false
                end,
            },
    }
    TFDirector:toTween(tween)
end

function ZhenFaTuPoLayer:playSuccessEffect(success)
    local size = self.ui:getSize()
    local center = ccp(size.width/2,size.height/2+100)

    --local equip_panel = require('lua.logic.smithy.SmithyEquipIcon'):new()
    local equip_panel = clone(self.iconModel)
    equip_panel:setVisible(true)
    equip_panel:setZOrder(999)
    equip_panel:setAnchorPoint(ccp(0.5,0.5))
    equip_panel:setPosition(center)
    equip_panel:setScale(1.8)
    equip_panel:setTouchEnabled(false)
    --equip_panel:removeEvents()

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equip_star_lv_up_1.xml")
    local effect = TFArmature:create("equip_star_lv_up_1_anim")
    if effect == nil then
        return
    end

    effect:setZOrder(999)
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)

    effect:setPosition(center)

    self.equip_panel = equip_panel
    self.successEffect = effect
    self.ui:addChild(equip_panel)
    self.ui:addChild(effect)

    effect:addMEListener(TFARMATURE_COMPLETE,
    function()
        self.ui:removeChild(equip_panel)
        self.ui:removeChild(effect)
        self.equip_panel = nil
        self.successEffect = nil
        self:playStarEffect()
        self:playIconEffect() 
        self:showSuccessDialog()      
    end)
end

function ZhenFaTuPoLayer:playStarEffect()
    local equip = StrategyCardManager:getStrategyCardByGmid(self.item.gmId)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equip_star_lv_up_3.xml")
    local effect = TFArmature:create("equip_star_lv_up_3_anim")
    if effect == nil then
        return
    end

    effect:setZOrder(100)
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)

    local newStar = self.img_star_old[equip:getStarLevel()]
    
    local parent = self.panel_star_current
    if newStar == nil then
        return
    end
    local pos = newStar:getPosition()
    effect:setPosition(ccp(pos.x,pos.y))

    parent:addChild(effect)
    effect:addMEListener(TFARMATURE_COMPLETE,
    function()
        parent:removeChild(effect)
        self:refreshUI()
    end)
end

function ZhenFaTuPoLayer:playIconEffect()
    local equip = StrategyCardManager:getStrategyCardByGmid(self.item.gmId)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equip_star_lv_up_2.xml")
    local effect = TFArmature:create("equip_star_lv_up_2_anim")
    if effect == nil then
        return
    end

    effect:setZOrder(100)
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)

    local _parent1 = self.img_fz:getParent()
    --local _parent1 = self.img_fz
    local position = _parent1:convertToWorldSpaceAR(self.img_fz:getPosition())

    local _parent = self.ui:getParent()
    local rootPos = _parent:convertToWorldSpaceAR(self.ui:getPosition())
    position.x = position.x - rootPos.x
    position.y = position.y - rootPos.y
    effect:setPosition(position)

    self.ui:addChild(effect)
    effect:addMEListener(TFARMATURE_COMPLETE,
    function()
        self.ui:removeChild(effect)
    end)
end


return ZhenFaTuPoLayer
