

local ItemTipLayer = class("ItemTipLayer", BaseLayer)

function ItemTipLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.common.ItemTipLayer")
end

function ItemTipLayer:loadData(data)
    self.itemID = data[1]
    self.itemType = data[2] -- 1物品 2卡牌
    self.itemNum = data[3]

    local itemBgImg     = TFDirector:getChildByPath(self, "itemImg")
    local itemIcon      = TFDirector:getChildByPath(self, "itemIcon")
    local qualityImg    = TFDirector:getChildByPath(self, "qualityImg")
    local nameLabel     = TFDirector:getChildByPath(self, "nameLabel")
    local descLabelTemp = TFDirector:getChildByPath(self, "descLabel")
    local attrLabel     = TFDirector:getChildByPath(self, "attrLabel")
    local btn_info      = TFDirector:getChildByPath(self, "btn_info")
    local size = descLabelTemp:getSize()
    descLabelTemp:setSize(CCSizeMake(size.width,size.height))
    -- descLabel = Public:createRichtextHB(descLabelTemp, "", EnumRichtextType.ItemTip, true)
    descLabel = Public:createRichtextHB(descLabelTemp, "", nil, true)
    self.attrLabel = attrLabel
    --
    if (self.list_reward == nil) then
        local list_reward = TFScrollView:create()
        list_reward:setDirection(SCROLLVIEW_DIR_VERTICAL)
        list_reward:setAnchorPoint(ccp(0, 1))
        local pos = descLabelTemp:getPosition()
        local addWidth = 20
        list_reward:setPosition(ccp(pos.x - addWidth / 2, pos.y + size.height))
        list_reward:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
        list_reward:setSize(CCSizeMake(size.width + addWidth, size.height))
        list_reward:setBounceEnabled(true);
        descLabelTemp:getParent():addChild(list_reward, 99)
        descLabel:setPositionX(0)
        descLabel:setAnchorPoint(ccp(0, 1))
        list_reward:addChild(descLabel)
        self.list_reward = list_reward
    end
    --
    attrLabel:setVisible(false)
    btn_info:setVisible(false)
    if self.itemType == 1 then
        local itemData = ItemData:objectByID(self.itemID)
        if itemData ~= nil then
            itemBgImg:setTexture(GetBackgroundForGoods(itemData))
            itemIcon:setTexture(itemData:GetPath())
            qualityImg:setTexture(GetFontByQuality(itemData.quality))
            nameLabel:setText(itemData.name)

            descLabel:setText(stringUtils.richText(itemData.details))
            local equipData = EquipmentTemplateData:objectByID(self.itemID)
            if equipData ~= nil then
                local baseAttr = equipData:getAttribute()
                for i=1,(EnumAttributeType.Max-1) do
                    if baseAttr[i] ~= nil then
                        local grow = equipData.growth_factor
                        grow = grow/100
                        local str = AttributeTypeStr[i].."+"..math.floor(baseAttr[i]*grow)
                        attrLabel:setVisible(true)
                        attrLabel:setText(str)
                        break
                    end
                end
            elseif itemData.type == EnumGameItemType.XinFa then
                local itemNum = XinFaManager:getIdenticalXinFaMaxNumById(self.itemID)
                local str = localizable.ItemTipLayer_have_txt..itemNum
                attrLabel:setVisible(true)
                attrLabel:setText(str)
            else
                local num = 1
                local Type = false --用于判定在背包里面的物品
                if BagManager:getItemNumById(self.itemID) ~= 0 then
                    num = BagManager:getItemNumById(self.itemID)
                    Type = true
                else
                    num = XinFaManager:getXinFaPieceNumById(self.itemID)
                    Type = true
                end
                local str = ""
                if Type == true then
                    if self.itemNum and num < self.itemNum then
                        str = localizable.ItemTipLayer_have_txt..self.itemNum
                    else
                        str = localizable.ItemTipLayer_have_txt..num
                    end
                end
                attrLabel:setVisible(true)
                attrLabel:setText(str)
            end

            if itemData.type == EnumGameItemType.Soul and itemData.kind == 1  then
                btn_info:setVisible(true)
                btn_info:addMEListener(TFWIDGET_CLICK,audioClickfun(function()  CommonManager:openIllustrationRole(itemData.usable); end))
            elseif itemData.type == EnumGameItemType.Box and itemData.kind == 1 then
                local giftItem = GiftPackData:objectByID(self.itemID)
                if giftItem and giftItem.select_count == 1 then
                    local function openDetails()
                        local rewardList = giftItem:getGiftList()
                        local _rewardList = TFArray:new()
                        for v in rewardList:iterator() do
                            local rewardInfo = BaseDataManager:getReward(v)
                            _rewardList:push(rewardInfo);
                        end
                        local layer  = require("lua.logic.gameactivity.GoldEgg.GoldEggCheckRewardLayer"):new()
                        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
                        layer:setRewardList(_rewardList,localizable.zadan_tipsReward)
                        AlertManager:show()
                    end            
                    btn_info:setVisible(true)
                    btn_info:addMEListener(TFWIDGET_CLICK,audioClickfun(openDetails))
                end
            elseif (itemData.type == EnumGameItemType.Eudemon) then
                --宠物
                -- local str = localizable.ItemTipLayer_have_txt..self.itemNum
                local haveNum = EudemonManager:getByEudemonTypeNum(self.itemID)
                local str = localizable.ItemTipLayer_have_txt..haveNum
                attrLabel:setText(str)
            end
        end
    elseif self.itemType == 2 then
        local cardData = RoleData:objectByID(self.itemID)
        if cardData ~= nil then
            itemBgImg:setTexture(GetColorIconByQuality(cardData.quality))
            itemIcon:setTexture(cardData:getIconPath())
            qualityImg:setTexture(GetFontByQuality(cardData.quality))
            nameLabel:setText(cardData.name)
            descLabel:setText(stringUtils.richText(cardData.description))

            -- if ProtagonistData:IsMainPlayer( self.itemID ) == false then
            --     btn_info:setVisible(true)
            --     btn_info:addMEListener(TFWIDGET_CLICK,audioClickfun(function()  CommonManager:openIllustrationRole(self.itemID); end))
            -- end
        end    
    else
        local data = BaseDataManager:getReward({type = self.itemType, itemId = self.itemID})

        if data ~= nil then
            itemBgImg:setTexture(GetColorIconByQuality(data.quality))
            itemIcon:setTexture(data.path)
            nameLabel:setText(data.name)
            descLabel:setText(stringUtils.richText(data.desc))
            qualityImg:setVisible(false)

            if self.itemNum ~= nil then
                attrLabel:setVisible(true)
                --attrLabel:setText("获得数量:"..self.itemNum)
                attrLabel:setText(stringUtils.format(localizable.common_count, self.itemNum))
            end
        end
    end

    Public:addPieceImg(itemIcon,{type = self.itemType,itemid = self.itemID});
    --
    local size = descLabel:getContentSize()
    local posY = size.height
    if (size.height + 0 < self.list_reward:getSize().height) then
        posY = self.list_reward:getSize().height - 0
    end
    self.list_reward:setContentOffset(ccp(0, 0))
    descLabel:setPositionY(posY)
    self.list_reward:setInnerContainerSize(CCSizeMake(size.width, size.height)) 
end

function ItemTipLayer:setTipText(text)
    self.attrLabel:setVisible(true)
    self.attrLabel:setText(text)
end

function ItemTipLayer:initUI(ui)
	self.super.initUI(self,ui)
    self.ui = ui

end

function ItemTipLayer:registerEvents(ui)
    self.super.registerEvents(self)
    self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(function()  AlertManager:close(AlertManager.TWEEN_1); end))
end
function ItemTipLayer:removeEvents()
    self.super.removeEvents(self)
    self.ui:removeMEListener(TFWIDGET_CLICK)
end


return ItemTipLayer
