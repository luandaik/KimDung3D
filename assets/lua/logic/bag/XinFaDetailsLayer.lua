-- client side ZhenFaDetailsLayer.lua
--[[
 * @Description: 心法背包详情
 ]]
-- script writer Happy.All
-- creation time 2017-10-16

local XinFaDetailsLayer = class("XinFaDetailsLayer", BaseLayer)

function XinFaDetailsLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.bag.XinFaDetails")
end

function XinFaDetailsLayer:initUI(ui)
	self.super.initUI(self,ui)

	self.panel_root          = TFDirector:getChildByPath(ui, 'panel_root')
    self.panel_details       = TFDirector:getChildByPath(ui, 'panel_details')

	--左侧详情
	self.btn_icon	 		= TFDirector:getChildByPath(ui, 'btn_node')
	self.img_icon	 		= TFDirector:getChildByPath(ui, 'img_icon')
    self.txt_Name           = TFDirector:getChildByPath(ui, 'txt_name')
    self.txt_description    = TFDirector:getChildByPath(ui, 'txt_description')
    self.txt_qianghualv     = TFDirector:getChildByPath(ui, 'txt_qianghualv')
    self.txt_starlv         = TFDirector:getChildByPath(ui, 'txt_starlv')
    self.img_star           = TFDirector:getChildByPath(ui, 'img_star')

	self.txt_Num			= TFDirector:getChildByPath(ui, 'txt_number')	
    self.txt_Num:setVisible(false)
    self.lbl_tips           = TFDirector:getChildByPath(ui, 'lbl_tips')
    self.lbl_tips:setVisible(false)
    self.txt_own_word = TFDirector:getChildByPath(ui, "txt_own_word")
    self.txt_own_word:setVisible(false)
    self.img_baoshicao = TFDirector:getChildByPath(ui, "img_baoshicao1")
    self.img_baoshicao:setVisible(false)

    self.btn_yanxi = TFDirector:getChildByPath(ui, 'btn_yanxi')
    self.btn_sale  = TFDirector:getChildByPath(ui, "btn_sale")
    self.btn_hecheng  = TFDirector:getChildByPath(ui, "btn_hecheng")
end

function XinFaDetailsLayer:setHomeLayer(homeLayer)
    self.homeLayer = homeLayer
end

function XinFaDetailsLayer:removeUI()
	self.super.removeUI(self)

	self.panel_root = nil
	self.btn_icon = nil
	self.img_icon = nil
	self.txt_Num = nil
	self.txt_Name = nil
	self.img_quality = nil
	self.txt_description = nil
	self.btn_yanxi = nil
    self.panel_details = nil
    self.panel_elements = nil
    self.lbl_tips = nil
end

function XinFaDetailsLayer:refreshUI()
    if self.isStrategyPiece then
        local data = XinFaManager:getXinFaByGmId(self.instanceId)
        if data == nil then
            print('cannot find the card by id = ',self.instanceId)
            return
        end
        self.txt_Name:setText(data:getConfigName())
        self.img_icon:setTexture(data:getPath())
        self.btn_icon:setTextureNormal(GetColorIconByQuality(data:getConfigQuality()))

        -- local rewardItem = {itemid = data.config.id}
        -- Public:addPieceImg(self.img_icon,rewardItem,true)
        Public:addStarImg(self.img_icon, 0)

        self.txt_description:setText(data.config.details)

        self.txt_qianghualv:setVisible(false)
        self.btn_yanxi:setVisible(false)
        self.btn_sale:setVisible(false)
        self.btn_hecheng:setVisible(true)
        self.txt_starlv:setVisible(false)
        self.img_star:setVisible(false)

    else
        local data = XinFaManager:getXinFaByGmId(self.instanceId)
        if not data then
            return
        end
        self.txt_Name:setText(data:getConfigName())
        self.img_icon:setTexture(data:getPath())
        self.btn_icon:setTextureNormal(GetColorIconByQuality(data:getConfigQuality()))
        self.txt_description:setText(data.config.details)
        
        self.img_star:setVisible(true)
        self.txt_starlv:setText(data:getStar())
        if data.star == 0 then 
            self.txt_starlv:setVisible(false)
            self.img_star:setVisible(false)
        else
            self.txt_starlv:setText(data:getStar())
            self.txt_starlv:setVisible(true)
        end 
        --Public:addPieceImg(self.img_icon,rewardItem,false)
        if data.level <= 1 then
            self.txt_qianghualv:setVisible(false)
        else
            self.txt_qianghualv:setText("+"..data:getLevel())
            self.txt_qianghualv:setVisible(true)
        end

        if data.config.kind == 1 then 
            self.btn_yanxi:setVisible(true)
            self.btn_sale:setVisible(true)
            self.btn_hecheng:setVisible(false)
        else
            self.btn_yanxi:setVisible(false)
            self.btn_sale:setVisible(true)
            self.btn_hecheng:setVisible(false)
        end
    end
end

--设置物品数据
function XinFaDetailsLayer:setData(item)
    local instanceId = nil
    self.isStrategyPiece = false
    if item.config.type == 36 then
        --碎片
        self.isStrategyPiece = true
         instanceId = item.instanceId
    elseif item.config.type == 35 then
        self.isStrategyPiece = false
        instanceId = item.instanceId
    end
	self.instanceId = instanceId
	self:refreshUI()
end

--使用按钮点击事件处理方法
function XinFaDetailsLayer.yanxiButtonClickHandle(sender)
    local self = sender.logic
    XinFaManager:openXinFaMainLayer(self.instanceId,XinFaManager.BagPanelLayer)
end

function XinFaDetailsLayer.btnSaleClick( sender )
    local self = sender.logic
    local data = XinFaManager:getXinFaByGmId(self.instanceId)
    XinFaManager:getXinFaSellList(data)
end

function XinFaDetailsLayer.btnHechengClick( sender )
    local self = sender.logic
    XinFaManager:openEquipOperationLayer(self.instanceId, XinFaManager.select_type_hecheng,XinFaManager.BagPanelLayer)
end

function XinFaDetailsLayer:registerEvents()
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
function XinFaDetailsLayer:dispose()
    self.super.dispose(self)
end

function XinFaDetailsLayer:removeEvents()
    self.btn_yanxi:removeMEListener(TFWIDGET_CLICK)
    self.btn_sale:removeMEListener(TFWIDGET_CLICK)
 
    self.super.removeEvents(self)
end

function XinFaDetailsLayer:calculateReward()

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

return XinFaDetailsLayer
