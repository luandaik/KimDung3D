-- client side ZhenFaDetailsLayer.lua
--[[
 * @Description: 阵法背包详情
 ]]
-- script writer Happy.All
-- creation time 2016-08-05

local ZhenFaDetailsLayer = class("ZhenFaDetailsLayer", BaseLayer)

function ZhenFaDetailsLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.bag.ZhenFaDetails")
end

function ZhenFaDetailsLayer:initUI(ui)
	self.super.initUI(self,ui)

	self.panel_root          = TFDirector:getChildByPath(ui, 'panel_root')
    self.panel_details       = TFDirector:getChildByPath(ui, 'panel_details')

	--左侧详情
	self.btn_icon	 		= TFDirector:getChildByPath(ui, 'btn_node')
	self.img_icon	 		= TFDirector:getChildByPath(ui, 'img_icon')
    self.txt_Name           = TFDirector:getChildByPath(ui, 'txt_name')
    local txt_description   = TFDirector:getChildByPath(ui, 'txt_description')
    self.txt_qianghualv     = TFDirector:getChildByPath(ui, 'txt_qianghualv')

	self.txt_Num			= TFDirector:getChildByPath(ui, 'txt_number')	
    self.txt_Num:setVisible(false)
    self.lbl_tips           = TFDirector:getChildByPath(ui, 'lbl_tips')
    self.lbl_tips:setVisible(false)
    self.txt_own_word = TFDirector:getChildByPath(ui, "txt_own_word")
    self.txt_own_word:setVisible(false)
    self.img_baoshicao = TFDirector:getChildByPath(ui, "img_baoshicao1")
    self.img_baoshicao:setVisible(false)

    self.btn_yanxi = TFDirector:getChildByPath(ui, 'btn_yanxi')
    self.btn_yanxi:setVisible(true)
    self.btn_sale  = TFDirector:getChildByPath(ui, "btn_sale")
    self.btn_sale:setVisible(true)
    self.btn_hecheng  = TFDirector:getChildByPath(ui, "btn_hecheng")
    self.btn_hecheng:setVisible(true)

    self.richtextHB         = Public:createRichtextHB(txt_description)
end

function ZhenFaDetailsLayer:setHomeLayer(homeLayer)
    self.homeLayer = homeLayer
end

function ZhenFaDetailsLayer:removeUI()
	self.super.removeUI(self)

	self.panel_root = nil
	self.btn_icon = nil
	self.img_icon = nil
	self.txt_Num = nil
	self.txt_Name = nil
	self.img_quality = nil
	self.btn_yanxi = nil
    self.panel_details = nil
    self.panel_elements = nil
    self.lbl_tips = nil
end

function ZhenFaDetailsLayer:refreshUI()

    if self.isStrategyPiece then
        local data = ItemData:objectByID(self.instanceId)
        if data == nil then
            print('cannot find the card by id = ',self.instanceId)
            return
        end
        self.txt_Name:setText(data.name)
        self.img_icon:setTexture(data:GetPath())
        self.btn_icon:setTextureNormal(GetColorIconByQuality(data.quality))

        local rewardItem = {itemid = data.id}
        Public:addPieceImg(self.img_icon,rewardItem,true)
        Public:addStarImg(self.img_icon, 0)

        self.richtextHB:setText(stringUtils.richText(data.details))
        self.txt_qianghualv:setVisible(false)
        self.btn_yanxi:setVisible(false)
        self.btn_sale:setVisible(false)
        self.btn_hecheng:setVisible(true)

        local num = BattleArrayData:getComposeNumByPieceId( self.instanceId )
        local numInBag = BagManager:getItemNumById(self.instanceId)
        if num <= numInBag then
            self.btn_hecheng:setTouchEnabled(true)
            self.btn_hecheng:setGrayEnabled(false)
        else
            self.btn_hecheng:setTouchEnabled(false)
            self.btn_hecheng:setGrayEnabled(true)
        end
    else
        local data = StrategyCardManager:getStrategyCardByGmid(self.instanceId)
        if not data then
            return
        end

        self.txt_Name:setText(data:getName())
        self.img_icon:setTexture(data:getPath())
        self.btn_icon:setTextureNormal(GetColorIconByQuality(data:getQuality()))
        self.richtextHB:setText(stringUtils.richText(data:getConfigDetails()))
        Public:addPieceImg(self.img_icon,rewardItem,false)
        if data.level == 0 then
            self.txt_qianghualv:setVisible(false)
        else
            self.txt_qianghualv:setText("+"..data:getLevel())
            self.txt_qianghualv:setVisible(true)
        end

        Public:addStarImg(self.img_icon, data.starLevel)

        self.btn_yanxi:setVisible(true)
        self.btn_sale:setVisible(true)
        self.btn_hecheng:setVisible(false)
    end
end

--设置物品数据
function ZhenFaDetailsLayer:setData(item)

    local instanceId = nil
    self.isStrategyPiece = false
    if item.itemdata then
        --碎片
        self.isStrategyPiece = true
        instanceId = item.itemdata.id
    else
        self.isStrategyPiece = false
        instanceId = item.gmId
    end
	self.instanceId = instanceId
	self:refreshUI()
end

--使用按钮点击事件处理方法
function ZhenFaDetailsLayer.yanxiButtonClickHandle(sender)
    local self = sender.logic
    StrategyCardManager:openZhenFaMainLayer(self.instanceId)
end

function ZhenFaDetailsLayer.btnSaleClick( btn )
    local self = btn.logic

    local calculateRewardList = self:calculateReward()
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.hermit.HermitSure",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    layer:setTitle(localizable.smithy_EquipSell_sell)
    layer:loadData(calculateRewardList);
    layer:setBtnHandle(function ()
        StrategyCardManager:sendSaleBattleArrayMsg(self.instanceId)
    end);
    AlertManager:show();
end

function ZhenFaDetailsLayer.btnHechengClick( btn )
    local self = btn.logic
    StrategyCardManager:sendRemixingMsg(self.instanceId)
end

function ZhenFaDetailsLayer:registerEvents()
    self.super.registerEvents(self)

    --按钮事件
    self.btn_yanxi:addMEListener(TFWIDGET_CLICK, audioClickfun(self.yanxiButtonClickHandle),1)
    self.btn_yanxi.logic = self   
    self.btn_sale:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnSaleClick),1)
    self.btn_sale.logic = self   
    self.btn_hecheng:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnHechengClick),1)
    self.btn_hecheng.logic = self   

end

--销毁方法
function ZhenFaDetailsLayer:dispose()
    self.super.dispose(self)
end

function ZhenFaDetailsLayer:removeEvents()
    self.btn_yanxi:removeMEListener(TFWIDGET_CLICK)
    self.btn_sale:removeMEListener(TFWIDGET_CLICK)
 
    self.super.removeEvents(self)
end

function ZhenFaDetailsLayer:calculateReward()

    local calculateRewardList = TFArray:new();

    local card = StrategyCardManager:getStrategyCardByGmid(self.instanceId)
    if card == nil then
        return nil
    end
    
    local cardLevel = card:getLevel()
    local cardQuality = card:getQuality()
    local cardStar = card:getStarLevel()

    --强化材料
    local totalExp = BattleArrayLevelData:getTotalExpByLevelAndQuality(cardLevel, cardQuality)
    totalExp = totalExp + card.currExp
    local expItemId = ConstantData:objectByID("BattleArrayPayBackGooderID").value or 30161
    local expItem = ItemData:objectByID(expItemId)
    local expPercent = ConstantData:objectByID("BattleArrayPayBackGooderScale").value or 6000
    expPercent = expPercent/10000
    local expItemNum = math.floor(totalExp*expPercent/expItem.provide_exp) or 0
    if expItemNum ~= 0 then
        local rewardInfo = {}
        rewardInfo.type = EnumDropType.GOODS
        rewardInfo.itemId = expItemId
        rewardInfo.number = expItemNum
        local _rewardInfo = BaseDataManager:getReward(rewardInfo)
        calculateRewardList:push(_rewardInfo);
    end

    --升星材料
    local starItemPercent = ConstantData:objectByID("BattleArrayPayBackBreakScale").value or 6000
    starItemPercent = starItemPercent/10000
    local starItemTbl = BattleArrayStarData:getTotalConsume(card.id,cardStar)
    local baseItem = nil
    for v in BattleArrayData:iterator() do
        if v.id == card.id then
            baseItem = v
            break
        end
    end
    if baseItem then
        local attrInfo = string.split(baseItem.compose,"_")
        starItemTbl[tonumber(attrInfo[2])] = starItemTbl[tonumber(attrInfo[2])] or 0
        starItemTbl[tonumber(attrInfo[2])] = starItemTbl[tonumber(attrInfo[2])] + tonumber(attrInfo[3])
    end

    for k,v in pairs(starItemTbl) do
        local rewardInfo = {}
        rewardInfo.type = EnumDropType.GOODS
        rewardInfo.itemId = k
        rewardInfo.number = math.floor(v*starItemPercent)
        local _rewardInfo = BaseDataManager:getReward(rewardInfo)

        calculateRewardList:push(_rewardInfo);
    end
    return calculateRewardList
end

return ZhenFaDetailsLayer
