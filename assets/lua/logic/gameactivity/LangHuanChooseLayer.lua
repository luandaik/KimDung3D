--[[
******?Ż?????????******

	-- by shenjingjie
	-- 2017/7/19	
]]

local LangHuanChooseLayer = class("LangHuanChooseLayer", BaseLayer)


function LangHuanChooseLayer:ctor(data)
    self.super.ctor(self)


    self:init("lua.uiconfig_mango_new.langhuanfudi.LangHuanChoose")
end

function LangHuanChooseLayer:initUI(ui)
	self.super.initUI(self,ui);

	self.treasuresPoolInfo = {}
	self.boutiquePoolInfo = {}
	self.selectRewardData = {}
	self.isOffAdd = false

	self.curSelectIndex = 1
	self.curSelectTreasuresNum = 1
	self.curSelectBoutiqueNum = 3

	self.btn_qd = TFDirector:getChildByPath(ui, "btn_qd")
	self.btn_qd.logic = self

	self.panel_jipin = TFDirector:getChildByPath(ui, "panel_jipin")
    self.panel_jingpin = TFDirector:getChildByPath(ui, "panel_jingpin")
    self.panel_zhuanpan = TFDirector:getChildByPath(ui, "img_di2")
    self.list_jipin = {}
    self.list_jingpin = {}

    self.panel_cell_model = TFDirector:getChildByPath(self.panel_jipin, 'panel_jiangli1' )
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()

    self.txt_jipin = TFDirector:getChildByPath(TFDirector:getChildByPath(ui, "txt_jiangli"), "txt_num")
    self.txt_jingpin = TFDirector:getChildByPath(TFDirector:getChildByPath(ui, "txt_jp"), "txt_num")

    self.panel_daoju = {}
    for i = 1, LangHuanManager.zhuanPanNum,1 do
        self.panel_daoju[i] = TFDirector:getChildByPath(self.panel_zhuanpan, "panel_daoju" .. i)
        self.panel_daoju[i].img_empty = TFDirector:getChildByPath(self.panel_daoju[i], "btn_empty")
        self.panel_daoju[i].btn_roleicon = TFDirector:getChildByPath(self.panel_daoju[i], "btn_roleicon")
        self.panel_daoju[i].img_icon = TFDirector:getChildByPath(self.panel_daoju[i], "img_icon")
        self.panel_daoju[i].txt_number = TFDirector:getChildByPath(self.panel_daoju[i], "txt_number")
        self.panel_daoju[i].img_jipin = TFDirector:getChildByPath(self.panel_daoju[i], "img_jipin")
        self.panel_daoju[i].img_jingpin = TFDirector:getChildByPath(self.panel_daoju[i], "img_jingpin")
        self.panel_daoju[i].img_suipian = TFDirector:getChildByPath(self.panel_daoju[i], 'img_suipian')

        self.panel_daoju[i].btn_roleicon:setTouchEnabled(true)

    end
end

function LangHuanChooseLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function LangHuanChooseLayer:registerEvents()

	self.btn_qd:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTrueBtnClick), 1)
	for i = 1, LangHuanManager.zhuanPanNum,1 do
		local function onIconClick(sender)
        	sender.index = i
            self:onGoodsOffClick(sender)
        end
    	self.panel_daoju[i].btn_roleicon:addMEListener(TFWIDGET_CLICK, audioClickfun(onIconClick),1)
	end
end

function LangHuanChooseLayer:removeEvents()
    self.super.removeEvents(self)

end

function LangHuanChooseLayer:removeUI()
	if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    self.super.removeUI(self)
end

function LangHuanChooseLayer:refreshUI()

	-- self.treasuresPoolInfo = LangHuanManager:getRewardPool(LangHuanManager.PoolType_Treasures)
	-- self.boutiquePoolInfo = LangHuanManager:getRewardPool(LangHuanManager.PoolType_Boutique)
	-- self.selectRewardData = LangHuanManager:getSelectInfo() or {}

	self:loadTreasuresPool()
	self:loadBoutiquePool()
	self:loadSelectPool()
end


--ˢ???Ʒ????
function LangHuanChooseLayer:loadTreasuresPool()
    self.list_jipin = {}
    self.treasuresPoolInfo = LangHuanManager:getRewardPool(LangHuanManager.PoolType_Treasures)

    local row = math.ceil(LangHuanManager.MaxTreasuresPoolNum / LangHuanManager.PoolCol);

    local index = 1
    for k, reward in pairs(self.treasuresPoolInfo) do
    	local index_x = index % LangHuanManager.PoolCol;
    	if index_x == 0 then
            index_x = LangHuanManager.PoolCol ;
        end
        local index_y = math.ceil(index / LangHuanManager.PoolCol);
        
        if (reward) then
        	local rewardInfo = BaseDataManager:getReward(reward)
            local itemCell = self.panel_cell_model:clone()
            itemCell:setPosition(ccp((index_x - 1) * 90, (row - index_y) * 75));
            itemCell.iconQuality = TFDirector:getChildByPath(itemCell, 'bg_icon')
            local iconGoods = TFDirector:getChildByPath(itemCell, 'img_icon')
            local txtNum = TFDirector:getChildByPath(itemCell, 'txt_num')
            local img_jipin = TFDirector:getChildByPath(itemCell, 'img_jipin')
            local img_jingpin = TFDirector:getChildByPath(itemCell, 'img_jingpin')
            itemCell.img_xuanzhong = TFDirector:getChildByPath(itemCell, 'img_xuanzhong')
            local isSelectNull = LangHuanManager:isGoodsInSelect( reward.id )
            local img_suipian = TFDirector:getChildByPath(itemCell, 'img_suipian')

            if (isSelectNull == false) then
            	itemCell.img_xuanzhong:setVisible(false)
            else
            	itemCell.img_xuanzhong:setVisible(true)
            	itemCell.iconQuality:setTouchEnabled(false)
            end

            img_jipin:setVisible(true)
            img_jingpin:setVisible(false)
            txtNum:setText(tonumber(reward.num))
            iconGoods:setTexture(rewardInfo.path)
            itemCell.iconQuality:setTextureNormal(GetColorIconByQuality(rewardInfo.quality))

            local goodsData = ItemData:objectByID(rewardInfo.itemid)
            if ( goodsData.type ~= EnumGameItemType.Equipment and goodsData:isFragment() == true) then
                img_suipian:setVisible(true)
                img_suipian:setTexture("ui_new/common/icon_bg/s"..rewardInfo.quality..".png")
            else
                img_suipian:setVisible(false)
            end

            local function onClick(sender)
            	sender.id = reward.id
            	sender.kind = reward.kind
	            self:onGoodsBtnClick(sender)
	        end
            itemCell.iconQuality:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick))

            itemCell:setTag(reward.id)
            self.panel_jipin:addChild(itemCell)
        end

        index = index + 1
    end

end
--刷新精品奖励池
function LangHuanChooseLayer:loadBoutiquePool()
	self.list_jingpin = {}

	local row = math.ceil(LangHuanManager.MaxBoutiquePoolNum / LangHuanManager.PoolCol);
	self.boutiquePoolInfo = LangHuanManager:getRewardPool(LangHuanManager.PoolType_Boutique)
    local index = 1
    for k, reward in pairs(self.boutiquePoolInfo) do
    	local index_x = index % LangHuanManager.PoolCol;
    	if index_x == 0 then
            index_x = LangHuanManager.PoolCol ;
        end
        local index_y = math.ceil(index / LangHuanManager.PoolCol);

        if (reward) then
        	local rewardInfo = BaseDataManager:getReward(reward)
            local itemCell = self.panel_cell_model:clone()
            itemCell:setPosition(ccp((index_x - 1) * 90, (row - index_y) * 75 - 20));
            itemCell.iconQuality = TFDirector:getChildByPath(itemCell, 'bg_icon')
            local iconGoods = TFDirector:getChildByPath(itemCell, 'img_icon')
            local txtNum = TFDirector:getChildByPath(itemCell, 'txt_num')
            local img_jipin = TFDirector:getChildByPath(itemCell, 'img_jipin')
            local img_jingpin = TFDirector:getChildByPath(itemCell, 'img_jingpin')
            itemCell.img_xuanzhong = TFDirector:getChildByPath(itemCell, 'img_xuanzhong')
            local img_suipian = TFDirector:getChildByPath(itemCell, 'img_suipian')

            local isSelectNull = LangHuanManager:isGoodsInSelect( reward.id )
            if (isSelectNull == false) then
            	itemCell.img_xuanzhong:setVisible(false)
            else
            	itemCell.img_xuanzhong:setVisible(true)
            	itemCell.iconQuality:setTouchEnabled(false)
            end
            img_jipin:setVisible(false)
            img_jingpin:setVisible(true)
            txtNum:setText(tonumber(reward.num))
            iconGoods:setTexture(rewardInfo.path)
            itemCell.iconQuality:setTextureNormal(GetColorIconByQuality(rewardInfo.quality))

            local goodsData = ItemData:objectByID(rewardInfo.itemid)
            if ( goodsData.type ~= EnumGameItemType.Equipment and goodsData:isFragment() == true) then
                img_suipian:setVisible(true)
                img_suipian:setTexture("ui_new/common/icon_bg/s"..rewardInfo.quality..".png")
            else
                img_suipian:setVisible(false)
            end

            local function onClick(sender)
            	sender.id = reward.id
            	sender.kind = reward.kind
	            self:onGoodsBtnClick(sender)
	        end
            itemCell.iconQuality:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick))

			-- self.list_jingpin[reward.id] = itemCell
			itemCell:setTag(reward.id)
            self.panel_jingpin:addChild(itemCell)

        end

        index = index + 1
    end
end

function LangHuanChooseLayer:loadSelectPool()
	self.curSelectTreasuresNum = 0
	self.curSelectBoutiqueNum = 0
	self.selectRewardData = LangHuanManager:getSelectInfo() or {}

	for i = 1, LangHuanManager.zhuanPanNum, 1 do

		self.panel_daoju[i].img_empty:setVisible(false)
        self.panel_daoju[i].btn_roleicon:setVisible(false)
        self.panel_daoju[i].img_icon:setVisible(false)
        self.panel_daoju[i].txt_number:setVisible(false)
        self.panel_daoju[i].img_jipin:setVisible(false)
        self.panel_daoju[i].img_jingpin:setVisible(false)
        self.panel_daoju[i].img_suipian:setVisible(false)

        --print("LangHuanChooseLayer:loadSelectPool",self.selectRewardData[i])
		if (self.selectRewardData[i] ~= nil and self.selectRewardData[i].id ~= nil) then
			self.panel_daoju[i].btn_roleicon:setVisible(true)
        	self.panel_daoju[i].img_icon:setVisible(true)
        	self.panel_daoju[i].txt_number:setVisible(true)

			local itemData = nil
			if (self.selectRewardData[i].kind == LangHuanManager.PoolType_Treasures) then
				itemData = self.treasuresPoolInfo[self.selectRewardData[i].id]
				self.panel_daoju[i].img_jipin:setVisible(true)
				self.curSelectTreasuresNum = self.curSelectTreasuresNum + 1
			else
				itemData = self.boutiquePoolInfo[self.selectRewardData[i].id]
				self.panel_daoju[i].img_jingpin:setVisible(true)
				self.curSelectBoutiqueNum = self.curSelectBoutiqueNum + 1
			end

			local rewardInfo = BaseDataManager:getReward(itemData)
			self.panel_daoju[i].txt_number:setText(tonumber(itemData.num))
            self.panel_daoju[i].img_icon:setTexture(rewardInfo.path)
            self.panel_daoju[i].btn_roleicon:setTextureNormal(GetColorIconByQuality(rewardInfo.quality))

            local goodsData = ItemData:objectByID(rewardInfo.itemid)
            if ( goodsData.type ~= EnumGameItemType.Equipment and goodsData:isFragment() == true) then
                self.panel_daoju[i].img_suipian:setVisible(true)
                self.panel_daoju[i].img_suipian:setTexture("ui_new/common/icon_bg/s"..rewardInfo.quality..".png")
            end

		else
			self.panel_daoju[i].img_empty:setVisible(true)
			local tmpInfo = {
				id = nil,
				index = i,
				kind = nil
			}
			self.selectRewardData[i] = tmpInfo
		end
		
	end
	self:setSelectStr()
end

function LangHuanChooseLayer.onTrueBtnClick( btn )
	local self = btn.logic

	-- for i = 1, LangHuanManager.zhuanPanNum, 1 do
	-- 	if (self.selectRewardData[i].id == nil) then
	--         toastMessage(localizable.activity_langhuan_tip2)
	--         return
	--     end
	-- end
	-- local items = {}
	-- for i = 1, LangHuanManager.zhuanPanNum, 1 do
	-- 	if (self.selectRewardData[i].id ~= nil) then
	-- 		local data = self.selectRewardData[i]
	-- 		items[i] = {data.id,data.index,data.kind}
	-- 	end

	-- end
	LangHuanManager:requestSeletPool(self.selectRewardData)
	AlertManager:close();
end

function LangHuanChooseLayer:onGoodsOffClick( sender )
	local index = sender.index
	local kindID = self.selectRewardData[index].kind
	local id = self.selectRewardData[index].id
	if (kindID == LangHuanManager.PoolType_Treasures) then
		itemCell = self.panel_jipin:getChildByTag(id)
		self.curSelectTreasuresNum = self.curSelectTreasuresNum - 1
	else
		itemCell = self.panel_jingpin:getChildByTag(id)
		self.curSelectBoutiqueNum = self.curSelectBoutiqueNum - 1
	end
	itemCell.img_xuanzhong:setVisible(false)
	self.curSelectIndex = index
	itemCell.iconQuality:setTouchEnabled(true)
	--print("index",self.curSelectIndex)
	self.selectRewardData[index].id = nil
	self.selectRewardData[index].kind = nil
	self:setZhuanPanItem()
	self:setSelectStr()
end


function LangHuanChooseLayer:onGoodsBtnClick( sender )
	

	local selectId = sender.id
	local kindID = sender.kind
	
	local itemCell = nil
	local goodsInfo = nil
	
	if (kindID == LangHuanManager.PoolType_Treasures) then
		itemCell = self.panel_jipin:getChildByTag(selectId)
		goodsInfo = self.treasuresPoolInfo[selectId]

		for i = 1, LangHuanManager.MaxTreasuresNum,1 do
			if(self.selectRewardData[i].id == nil) then
				self.curSelectIndex = i
				break;
			end
		end
		--判断是否超过上线
		if (self.curSelectTreasuresNum < LangHuanManager.MaxTreasuresNum) then
			--self.curSelectIndex = self.curSelectTreasuresNum
			self.curSelectTreasuresNum = self.curSelectTreasuresNum + 1

		else
			toastMessage(localizable.activity_langhuan_tip1)
			return
		end
	elseif (kindID == LangHuanManager.PoolType_Boutique) then
		itemCell = self.panel_jingpin:getChildByTag(selectId)
		goodsInfo = self.boutiquePoolInfo[selectId]
		for i = 4, LangHuanManager.zhuanPanNum,1 do
			if(self.selectRewardData[i].id == nil) then
				print("self.curSelectIndex",self.curSelectIndex)
				self.curSelectIndex = i
				break;
			end
		end
		--判断是否超过上线
		if (self.curSelectBoutiqueNum < LangHuanManager.MaxBoutiqueNum) then			
			self.curSelectBoutiqueNum = self.curSelectBoutiqueNum + 1
			--self.curSelectIndex = self.curSelectJingPinIndex

		else
			toastMessage(localizable.activity_langhuan_tip1)
			return
		end
	end

	--print("self.curSelectIndex",self.curSelectIndex)
	self.selectRewardData[self.curSelectIndex].id = goodsInfo.id
	self.selectRewardData[self.curSelectIndex].kind = goodsInfo.kind
	
	itemCell.iconQuality:setTouchEnabled(false)
	itemCell.img_xuanzhong:setVisible(true)
	
	self:setZhuanPanItem(selectId, goodsInfo.kind)
	self:setSelectStr()
end

function LangHuanChooseLayer:setZhuanPanItem( itemId, kind )
	-- local goodsInfo = nil
	-- if (kindID == LangHuanManager.PoolType_Treasures) then
	-- 	goodsInfo = self.treasuresPoolInfo[itemId]

	-- else
	-- 	goodsInfo = self.boutiquePoolInfo[itemId]
	-- end

	local goodsItem = self.panel_daoju[self.curSelectIndex]
	goodsItem.img_empty:setVisible(false)
    goodsItem.btn_roleicon:setVisible(false)
    goodsItem.img_icon:setVisible(false)
    goodsItem.txt_number:setVisible(false)
    goodsItem.img_jipin:setVisible(false)
    goodsItem.img_jingpin:setVisible(false)
    goodsItem.img_suipian:setVisible(false)

    local selectInfo = self.selectRewardData[self.curSelectIndex]
	if (selectInfo.id == nil) then
		--显示问号
		goodsItem.img_empty:setVisible(true)
	else
		--显示道具信息
		goodsItem.btn_roleicon:setVisible(true)
	    goodsItem.img_icon:setVisible(true)
	    goodsItem.txt_number:setVisible(true)
	    local itemData = nil
	    if (kind == LangHuanManager.PoolType_Treasures) then
			itemData = self.treasuresPoolInfo[itemId]
			goodsItem.img_jipin:setVisible(true)
		else
			itemData = self.boutiquePoolInfo[itemId]
			goodsItem.img_jingpin:setVisible(true)
		end
		local rewardInfo = BaseDataManager:getReward(itemData)
		goodsItem.txt_number:setText(tonumber(itemData.num))
        goodsItem.img_icon:setTexture(rewardInfo.path)
        goodsItem.btn_roleicon:setTextureNormal(GetColorIconByQuality(rewardInfo.quality))

        local goodsData = ItemData:objectByID(rewardInfo.itemid)
        if ( goodsData.type ~= EnumGameItemType.Equipment and goodsData:isFragment() == true) then
            goodsItem.img_suipian:setVisible(true)
            goodsItem.img_suipian:setTexture("ui_new/common/icon_bg/s"..rewardInfo.quality..".png")
        end
	end

end 

function LangHuanChooseLayer:setSelectStr()
	self.txt_jipin:setText(self.curSelectTreasuresNum.."/"..LangHuanManager.MaxTreasuresNum)
	self.txt_jingpin:setText(self.curSelectBoutiqueNum.."/"..LangHuanManager.MaxBoutiqueNum)

end

return LangHuanChooseLayer
