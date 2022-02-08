--[[
******ÀËÈËÎäÊ¿²é¿´*******
    -- create by fei
    -- 2016/12/06
]]
local KnightShowLayer = class("KnightShowLayer", BaseLayer)

function KnightShowLayer:ctor(data)
    self.super.ctor(self,data)
    self:setName("KnightShowLayer")
    self.name = "KnightShowLayer"
    self:init("lua.uiconfig_mango_new.LangRenWuShi.langrenMain")
end

function KnightShowLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.ui = ui
    self.btn_tiaozhanbang  = TFDirector:getChildByPath(ui, 'btn_tiaozhanbang')
    self.btn_close         = TFDirector:getChildByPath(ui, 'btn_close')
    self.txt_time          = TFDirector:getChildByPath(ui, 'txt_time')
    self.btn_change        = TFDirector:getChildByPath(ui, 'btn_change')
    self.txt_taici         = TFDirector:getChildByPath(ui, 'txt_taici')
    self.txt_huode1        = TFDirector:getChildByPath(ui, 'txt_huode1')
    self.txt_huode2        = TFDirector:getChildByPath(ui, 'txt_huode2')
    self.txt_level         = TFDirector:getChildByPath(ui, 'txt_level')
    self.img_bawangwan     = TFDirector:getChildByPath(ui, 'img_bawangwan')
    self.img_nakelulu      = TFDirector:getChildByPath(ui, 'img_nakelulu')
    self.img_nkllname      = TFDirector:getChildByPath(ui, 'img_nkllname')
    self.img_bwwname       = TFDirector:getChildByPath(ui, 'img_bwwname')
    self.txt_count         = TFDirector:getChildByPath(ui, 'txt_count')

    self.img_bawangwan:setVisible(false)
    self.img_nakelulu:setVisible(false)
    self.txt_huode1:setVisible(false)
    self.txt_huode2:setVisible(false)
    self.btn_icon         = TFDirector:getChildByPath(ui, 'btn_icon1')
    self.ScrollView         = TFDirector:getChildByPath(ui, 'ScrollView')
    local data    = {}
    data.name     = "KnightShowLayer"
    data.txt      = self.txt_time
    data.funcCall = function() AlertManager:close() end
    KnightManager:updateKnightOnLineTime(data)
    KnightManager:setAutoShowKnight(false)
end
function KnightShowLayer:onShow()
    self.super.onShow(self)
    if (KnightManager:isShowKnight() == false) then
        AlertManager:close()
        return
    end
    self:refreshUI()
   -- MissionManager:checkTrustOnekeyLayer(self,true)
end
function KnightShowLayer:refreshUI()
    local fightInfo = KnightManager:getKnightFightData()
    if (fightInfo) then
        for i,v in ipairs(fightInfo) do
            local txt_huode = TFDirector:getChildByPath(self.ui, 'txt_huode'..i)
            local battleInfo = BattleLimitedData:objectByID(tonumber(v.id))
            if battleInfo and txt_huode then
                txt_huode:setVisible(true)
                txt_huode:setText(battleInfo:getDescribe());
            end
        end
    end
    local str = numberToChinese(KnightManager:getKnightLevel())
    self.txt_level:setText(stringUtils.format(localizable.Knight_Level, str))
    local knightInfo = KnightManager:getKnightInfo()
    self.txt_count:setText((knightInfo.leaveTime or 0))
    local idKnight = KnightManager:getKnightTypeId()
    local isShow = idKnight == 1
    self.img_bawangwan:setVisible(isShow ~= true)
    self.img_nakelulu:setVisible(isShow)
    self.img_nkllname:setVisible(isShow)
    self.img_bwwname:setVisible(isShow ~= true)
    
    self:setAwardInfo(self.ui)
    local knightTypeId = KnightManager:getKnightTypeId()
    self.txt_taici:setText(localizable.Knight_Tips[knightTypeId][math.ceil( math.random() * (#(localizable.Knight_Tips[knightTypeId]) ))])
end

function KnightShowLayer:loadData(missionId)
    self.missionId = missionId
end

function KnightShowLayer:onClickHandleForTrustLayer()
    -- local missionId = self.missionId
    -- AlertManager:closeLayerByName("KnightShowLayer")
    -- MissionManager:showDetailLayer(missionId);
end
function KnightShowLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    self.btn_tiaozhanbang.logic = self
    self.btn_tiaozhanbang:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onOpenRankHandle),1)
    self.btn_change.logic       = self
    self.btn_change:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onOpenVSHandle),1)
end
function KnightShowLayer:drawItem(btn_icon, itemInfo)
    if (btn_icon) then
        btn_icon:setVisible(true)
        local img_icon      = TFDirector:getChildByPath(btn_icon, 'img_icon')
        local txt_number    = TFDirector:getChildByPath(btn_icon, 'txt_number')
        local itemId        = tonumber(itemInfo.itemId)
        local itemTypeId    = tonumber(itemInfo.itemType)
        if (itemTypeId == EnumDropType.COIN or itemTypeId == EnumDropType.SYCEE) then
            img_icon:setTexture(GetResourceIcon(itemTypeId))
        elseif (itemTypeId == EnumDropType.GOODS) then
            local item      = ItemData:objectByID( itemId );
            btn_icon:setTextureNormal(GetColorIconByQuality(item.quality))
            img_icon:setTexture(item:GetPath())
        end

        txt_number:setText(itemInfo.itemNum)
        btn_icon:setTouchEnabled(true)
        btn_icon:addMEListener(TFWIDGET_CLICK,
                                                audioClickfun(function()
                                                   Public:ShowItemTipLayer(itemId, itemTypeId)
                                                end))
    end
end
function KnightShowLayer:setAwardInfo(ui)
    local knightInfo       = KnightManager:getKnightData(nil, nil, true)
    if (knightInfo) then
        local arawLen = table.getn(knightInfo.awardIds.itemTypeId)
        if (arawLen == 1) then
            local info = {
                            itemType    = knightInfo.awardIds.itemTypeId[1], 
                            itemId      = knightInfo.awardIds.itemId[1], 
                            itemNum     = knightInfo.awardIds.itemNum[1]
                         }
            self:drawItem(self.btn_icon, info)
            self.ScrollView:setVisible(false)
        else
            self.ScrollView:setVisible(true)
            self.ScrollView:setTouchEnabled(true)
            self.ScrollView:setInnerContainerSize(CCSizeMake(self.btn_icon:getSize().width * arawLen - (arawLen - 1) * 20, self.ScrollView:getSize().height))

            for i,info in ipairs(knightInfo.awardIds.itemTypeId) do
                local info = {
                            itemType    = knightInfo.awardIds.itemTypeId[i],
                            itemId      = knightInfo.awardIds.itemId[i],
                            itemNum     = knightInfo.awardIds.itemNum[i]
                         }
                self.btn_icon:setVisible(false)
                local btn_icon = self.btn_icon:clone()
                btn_icon:setAnchorPoint(ccp(0, 0))
                btn_icon:setPosition(ccp(btn_icon:getSize().width * (i - 1) - (i - 1) * 15, 0))
                self.ScrollView:addChild(btn_icon)
                self:drawItem(btn_icon, info)
            end
        end
    end
end

function KnightShowLayer.onOpenVSHandle(sender)
    KnightManager:openKnightVSLayer()
end

function KnightShowLayer.onOpenRankHandle(sender)
    local self      = sender.logic
    AlertManager:addLayerByFile("lua.logic.knight.KnightRankLayer");
    AlertManager:show();
end
function KnightShowLayer:removeEvents()
    self.super.removeEvents(self)
    KnightManager:showShare()
end

function KnightShowLayer:removeUI()
    KnightManager:deleteKnightOnLineTime("KnightShowLayer")
    self.txt_time = nil
    self.super.removeUI(self)
end
return KnightShowLayer