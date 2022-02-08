--[[
******琅环福地主界面*******

	-- by shenjingjie
	-- 2017/7/19	
]]
local LangHuanMainLayer = class("LangHuanMainLayer", BaseLayer)

LangHuanMainLayer.UNIT_ANGLE = 360 / 8


function LangHuanMainLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.langhuanfudi.LangHuanMain")
end

function LangHuanMainLayer:initUI(ui)
	self.super.initUI(self,ui);

	self.prayRewardData = {}
	self.treasuresPoolInfo = {}
	self.boutiquePoolInfo = {}
	self.selectRewardData = {}
    self.rewardData = {}
    self.costGoods = 0
    self.bTurning = false
    self.bResultShowed = false


	self.img_zhuanpan_bg = TFDirector:getChildByPath(ui, "img_di2")

	self.btn_qifu1 = TFDirector:getChildByPath(ui, "btn_qifu1")
	self.btn_qifu1.logic = self

	self.btn_qifu2 = TFDirector:getChildByPath(ui, "btn_qifu2")
	self.btn_qifu2.logic = self

    self.txt_num1 = TFDirector:getChildByPath(self.btn_qifu1, "txt_num")
    self.txt_num10 = TFDirector:getChildByPath(self.btn_qifu2, "txt_num")
    self.txt_numb1 = TFDirector:getChildByPath(self.btn_qifu2, "txt_numb1")
    self.txt_cs    = TFDirector:getChildByPath(self.btn_qifu2, "txt_cs")
    self.txt_cs:setText("10")
	self.btn_close = TFDirector:getChildByPath(ui, "btn_fanhui")
    self.btn_close.logic = self

    self.btn_jiangChi = TFDirector:getChildByPath(ui, "btn_jc")
    self.btn_jiangChi.logic = self

    self.txt_time = TFDirector:getChildByPath(ui, "txt_time")
    self.btn_history = TFDirector:getChildByPath(ui,'btn_qfls')
    self.btn_help = TFDirector:getChildByPath(ui, "btn_help")

    self.panel_jipin = TFDirector:getChildByPath(ui, "panel_jipin")
    self.panel_jipin:setPositionY(self.panel_jipin:getPositionY() - 10)
    self.panel_jingpin = TFDirector:getChildByPath(ui, "panel_jingpin")
    self.panel_jingpin:setPositionY(self.panel_jingpin:getPositionY() + 10)
    self.panel_zhuanpan = TFDirector:getChildByPath(ui, "img_di2")
    self.list_jipin = {}
    self.list_jingpin = {}

    self.panel_cell_model = TFDirector:getChildByPath(self.panel_jipin, 'panel_jiangli1' )
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()

    --转盘
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
        self.panel_daoju[i].btn_roleicon.index = i
        self.panel_daoju[i].btn_roleicon.logic = self
    end


    self.rewardId = 0
    self.endTime = OperationActivitiesManager:getActivityInfoByType(OperationActivitiesManager.Type_LangHuan).endTime

end

function LangHuanMainLayer:removeUI()
	if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    self.super.removeUI(self)
end

function LangHuanMainLayer:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function LangHuanMainLayer:registerEvents()
	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

	self.btn_jiangChi:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSelectRewardBtnClick), 1)
    self.btn_history:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHistoryClick))
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClick))

	self.btn_qifu1:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPrayReward))
	self.btn_qifu1.type = 1
	self.btn_qifu2:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPrayReward))
	self.btn_qifu2.type = 2

	self.attackCallBack = function(event)
        self:loadTreasuresPool()
		self:loadBoutiquePool()
		self:loadSelectPool()
        self:refreshUI()
    end
	TFDirector:addMEGlobalListener(LangHuanManager.LangBlessedConfigResponse, self.attackCallBack)

    self.selectCallBack = function(event)
        self:loadSelectPool()
    end
    TFDirector:addMEGlobalListener(LangHuanManager.LangBlesseSelectResponse, self.selectCallBack)

    self.onPrayCallBack = function(event)
        self:startTurning()
        self.rewardId = event.data[1].result[1].index
        self.rewardData = event.data[1].result
        local data = event.data[1]
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(LangHuanManager.LangBlessedPrayResponse, self.onPrayCallBack)

    self.updateEndTime = TFDirector:addTimer(60, -1, nil,
        function()
            self:refreshTimeUI()
    end)
end

function LangHuanMainLayer:removeEvents()
	self.super.removeEvents(self)
	if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    
    if self.updateEndTime then
        TFDirector:removeTimer(self.updateEndTime)
        self.updateEndTime = nil
    end

    TFDirector:removeMEGlobalListener(LangHuanManager.LangBlessedConfigResponse, self.attackCallBack)
    TFDirector:removeMEGlobalListener(LangHuanManager.LangBlesseSelectResponse, self.selectCallBack)
    TFDirector:removeMEGlobalListener(LangHuanManager.LangBlessedPrayResponse, self.onPrayCallBack)

end

function LangHuanMainLayer:refreshUI()

    self.costGoods = BagManager:getItemNumById(30300)
    self.txt_num1:setText(self.costGoods)
    self.txt_num10:setText(self.costGoods)
    if self.costGoods<10 and self.costGoods>1 then
        self.txt_numb1:setText(self.costGoods)
        self.txt_cs:setText(self.costGoods)
    elseif self.costGoods >= 10 or self.costGoods <= 1 then
        self.txt_numb1:setText(10)
        self.txt_cs:setText(10)
    end
    local isFull = true
    for i = 1, LangHuanManager.zhuanPanNum, 1 do
        if (self.selectRewardData[i] == nil or self.selectRewardData[i].id == nil) then
            isFull = false
            break;
        end
    end

    if (isFull) then
        self.btn_qifu1:setTextureNormal("ui_new/langhuanfudi/btn_qf1.png")
        self.btn_qifu2:setTextureNormal("ui_new/langhuanfudi/btn_qf2.png")
        self.btn_jiangChi:setTextureNormal("ui_new/langhuanfudi/btn_ghjc.png")
        self.txt_cs:setColor(ccc3(255,255,255))
    else
        self.btn_qifu1:setTextureNormal("ui_new/langhuanfudi/btn_qf1_1.png")
        self.btn_qifu2:setTextureNormal("ui_new/langhuanfudi/btn_qf2_1.png")
        self.btn_jiangChi:setTextureNormal("ui_new/langhuanfudi/btn_tcjc.png")
        self.txt_cs:setColor(ccc3(128,128,128))
    end
end

--刷新极品奖池
function LangHuanMainLayer:loadTreasuresPool()

    self.list_jipin = {}

    self.treasuresPoolInfo = LangHuanManager:getRewardPool(LangHuanManager.PoolType_Treasures) or {}
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
            itemCell:setPosition(ccp((index_x - 1) * 100 + 20 , (row - index_y) * 75));

            local iconQuality = TFDirector:getChildByPath(itemCell, 'bg_icon')
            local iconGoods = TFDirector:getChildByPath(itemCell, 'img_icon')
            local txtNum = TFDirector:getChildByPath(itemCell, 'txt_num')
            local img_jipin = TFDirector:getChildByPath(itemCell, 'img_jipin')
            local img_jingpin = TFDirector:getChildByPath(itemCell, 'img_jingpin')
            local img_suipian = TFDirector:getChildByPath(itemCell, 'img_suipian')

            img_jipin:setVisible(true)
            img_jingpin:setVisible(false)
            txtNum:setText(tonumber(reward.num))
            iconGoods:setTexture(rewardInfo.path)
            local goodsData = ItemData:objectByID(rewardInfo.itemid)
            iconQuality:setTextureNormal(GetColorIconByQuality(rewardInfo.quality))

            
            if ( goodsData.type ~= EnumGameItemType.Equipment and goodsData:isFragment() == true) then
                img_suipian:setVisible(true)
                img_suipian:setTexture("ui_new/common/icon_bg/s"..rewardInfo.quality..".png")
            else
                img_suipian:setVisible(false)
            end

            self.list_jipin[index] = itemCell
            self.panel_jipin:addChild(itemCell)

            local function onClick(sender)
                Public:ShowItemTipLayer(rewardInfo.itemid, rewardInfo.type)
            end
            iconQuality:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick))
        end

        index = index + 1
    end
    -- self.list_jipin:setInnerContainerSize(CCSizeMake(self.list_jipin:getSize().width , 200))
    -- -- self.list_jipin:setInnerContainerSizeForHeight(row * 75 )

end
--刷新精品奖池
function LangHuanMainLayer:loadBoutiquePool()
	self.list_jingpin = {}
	local row = math.ceil(LangHuanManager.MaxBoutiquePoolNum / LangHuanManager.PoolCol);

	self.boutiquePoolInfo = LangHuanManager:getRewardPool(LangHuanManager.PoolType_Boutique) or {}
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
            itemCell:setPosition(ccp((index_x - 1) * 100 + 20, (row - index_y) * 75 - 20));

            local iconQuality = TFDirector:getChildByPath(itemCell, 'bg_icon')
            local iconGoods = TFDirector:getChildByPath(itemCell, 'img_icon')
            local txtNum = TFDirector:getChildByPath(itemCell, 'txt_num')
            local img_jipin = TFDirector:getChildByPath(itemCell, 'img_jipin')
            local img_jingpin = TFDirector:getChildByPath(itemCell, 'img_jingpin')
            local img_suipian = TFDirector:getChildByPath(itemCell, 'img_suipian')

            img_jipin:setVisible(false)
            img_jingpin:setVisible(true)
            txtNum:setText(tonumber(reward.num))
            iconGoods:setTexture(rewardInfo.path)
            local goodsData = ItemData:objectByID(rewardInfo.itemid)
            iconQuality:setTextureNormal(GetColorIconByQuality(rewardInfo.quality))

            if ( goodsData.type ~= EnumGameItemType.Equipment and goodsData:isFragment() == true) then
                img_suipian:setVisible(true)
                img_suipian:setTexture("ui_new/common/icon_bg/s"..rewardInfo.quality..".png")
            else
                img_suipian:setVisible(false)
            end
            

            self.list_jingpin[index] = itemCell
            self.panel_jingpin:addChild(itemCell)

            local function onClick(sender)
                Public:ShowItemTipLayer(rewardInfo.itemid, rewardInfo.type)
            end
            iconQuality:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick))
        end

        index = index + 1
    end
end

function LangHuanMainLayer:loadSelectPool()
	self.selectRewardData = LangHuanManager:getSelectInfo() or {}
	for i = 1, LangHuanManager.zhuanPanNum, 1 do
		self.panel_daoju[i].img_empty:setVisible(false)
        self.panel_daoju[i].btn_roleicon:setVisible(false)
        self.panel_daoju[i].img_icon:setVisible(false)
        self.panel_daoju[i].txt_number:setVisible(false)
        self.panel_daoju[i].img_jipin:setVisible(false)
        self.panel_daoju[i].img_jingpin:setVisible(false)
        self.panel_daoju[i].img_suipian:setVisible(false)


		if (self.selectRewardData[i] ~= nil and self.selectRewardData[i].id ~= nil) then
			self.panel_daoju[i].btn_roleicon:setVisible(true)
        	self.panel_daoju[i].img_icon:setVisible(true)
        	self.panel_daoju[i].txt_number:setVisible(true)
			--print("右边",self.selectRewardData[i])
			local itemData = nil
			if (self.selectRewardData[i].kind == LangHuanManager.PoolType_Treasures) then
				itemData = self.treasuresPoolInfo[self.selectRewardData[i].id]
				self.panel_daoju[i].img_jipin:setVisible(true)
			else

				itemData = self.boutiquePoolInfo[self.selectRewardData[i].id]
				self.panel_daoju[i].img_jingpin:setVisible(true)
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
            

            local function onClick(sender)
	            Public:ShowItemTipLayer(rewardInfo.itemid, rewardInfo.type)
	        end
            self.panel_daoju[i].btn_roleicon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick))

		else
			self.panel_daoju[i].img_empty:setVisible(true)
		end
	end
end

--历史记录信息回调
function LangHuanMainLayer.onHistoryClick(sender)
    -- self = sender.logic.gameactivity
    LangHuanManager:requestPrayRecord(1)
    LangHuanManager:openLangHuanRecodeLayer()
end

function LangHuanMainLayer:onHelpClick()
    LangHuanManager:showRuleLayer()
end
--祈福按钮回调
function LangHuanMainLayer.onPrayReward( btn )
	local self = btn.logic

    local prayType = btn.type 
    if self.bTurning ~= false then --只有执行完一轮动画 才能下一次点击
        --toastMessage(localizable.treasureMain_text1)
        if self.updateTimerID then
            TFDirector:removeTimer(self.updateTimerID)
            self.updateTimerID = nil

            self:StopAc()
            self:showReward()
        end
        return
    end
    local needNum = 0
    if (prayType == 1) then
        needNum = 1
    elseif (prayType == 2) then
        if self.costGoods < 10 and self.costGoods > 1 then
            needNum = self.costGoods
        else
            needNum = 10
        end
    end
    for i = 1, LangHuanManager.zhuanPanNum, 1 do
     if (self.selectRewardData[i] and self.selectRewardData[i].id == nil) then
            toastMessage(localizable.activity_langhuan_tip2)
            return
        end
    end

    if (self.costGoods == nil or self.costGoods < needNum) then
        toastMessage(localizable.smithy_EquipmentRefining_pro)
        return
    end
   
    LangHuanManager:requestPray(needNum)

end

function LangHuanMainLayer.onSelectRewardBtnClick( btn )
	local self = btn.logic
	LangHuanManager:openLangHuanChooseLayer()
end

function LangHuanMainLayer:StopAc()
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self.img_zhuanpan_bg:stopAllActions()
    local currRotate = self.img_zhuanpan_bg:getRotation()
    local destRotate = self:getDestAngle(currRotate, self.rewardId)
    self:endTurning(destRotate)

    self.bTurning = false
end

--刷新时间
function LangHuanMainLayer:refreshTimeUI()
    local nowTime = MainPlayer:getNowtime()
    local endDate = math.floor(self.endTime - nowTime)

    local day = math.floor(endDate / (60 * 60 * 24))
    local hour = math.floor(endDate / (60 * 60 )% 24)
    local min = math.floor(endDate / 60 % 60)
    self.txt_time:setText(stringUtils.format(localizable.common_time_3, day, hour, min))

    if ((self.endTime - nowTime) * 0.001 <= 0) then
        --提示活动已结束
        self.txt_time:setText(localizable.treasureMain_tiemout)
        if self.updateEndTime then
            TFDirector:removeTimer(self.updateEndTime)
            self.updateEndTime = nil
        end
    end
end

--开始转转盘
function LangHuanMainLayer:startTurning()
    self.bTurning = true
    self.bResultShowed = false
    self.btn_jiangChi:setTouchEnabled(false)

    if self.updateTimerID then
                TFDirector:removeTimer(self.updateTimerID)
                self.updateTimerID = nil
    end
    self.round = 1 * 40
    self.speed = 2
    self.slowAngle = nil
    self.isSlowed = false
    self.isOver = false
    self.slowChacheAngle = 18+2+9
    self.updateTimerID = TFDirector:addTimer(30, -1, nil,
        function()
            self:rotateLunPan()
    end)
end


function LangHuanMainLayer:rotateLunPan()
    if self.isOver == true then
        self:StopAc()
        return
    end
    local speedHigh = 18
    local speedLow = 2
    local speedLowest = 0
    local currRotate = self.img_zhuanpan_bg:getRotation()
    local state = 0
    if self.round > 0 then
        -- start and speed up to high
        self.speed = speedHigh
        local speed = math.floor(self.speed)
        currRotate = currRotate + speed
        self.round = self.round - speed
        currRotate = math.floor(currRotate * 8)
        currRotate = math.mod(currRotate,3600)
        currRotate = currRotate * 0.1
        self.img_zhuanpan_bg:setRotation(currRotate)
    else
        if self.slowAngle == nil then
            local angle = ( 10 - self.rewardId ) * self.UNIT_ANGLE
            angle = math.mod(angle,360)
            currRotate = math.floor(currRotate * 8)
            currRotate = math.mod(currRotate,3600)
            currRotate = currRotate * 0.1
            angle = angle - currRotate + 360
            angle = math.mod(angle,360)
            if angle < 180 then
                angle = angle + 360
            end

            self.slowAngle = angle + 360 + 180
            local v0 = speedLow
            local v = speedHigh 
            local a = (v * v - v0 * v0) / (2* self.slowAngle)
            self.a = a
            self.speed = v
            self.slowAngle = self.slowAngle + 180
        end
        if self.slowAngle and self.slowAngle > 0 then
            -- speed down to low 
            local s = self.speed  - 0.5 * self.a
            self.speed = self.speed - self.a
            if self.isSlowed == false and self.speed < speedLow then
                -- [a] slow down
                self.speed = self.speed + self.a
                local a = self.speed - speedLow
                s = self.speed  - 0.5 * a

                self.isSlowed = true
                local v = speedLow 
                local v0 = speedLowest
                a = (v * v - v0 * v0) / (2* self.slowAngle)
                self.a = a
                self.speed = speedLow
            end
            if self.speed < speedLowest + self.a then
                self.slowAngle = 0
                self.speed = self.speed + self.a
                local a = self.speed - speedLowest
                s = self.speed  - 0.5 * a
                self.speed = speedLowest
                currRotate = currRotate + s
            else
                self.slowAngle = self.slowAngle - s
                currRotate = currRotate + s
            end
            self.img_zhuanpan_bg:setRotation(currRotate)
        else
            -- back to end
            self.slowChacheAngle = 0
            if self.slowChacheAngle and self.slowChacheAngle > 0 then
                self.slowChacheAngle = self.slowChacheAngle - self.speed
                currRotate = currRotate - self.speed
            else
                local angle = ( 10 - self.rewardId ) * self.UNIT_ANGLE
                currRotate = angle
                self.isOver = true
            end
            self.img_zhuanpan_bg:setRotation(currRotate)
        end
    end
end

function LangHuanMainLayer:endTurning(destRotate)
    local base = destRotate % 360
    self.img_zhuanpan_bg:setRotation(destRotate)
    self.btn_jiangChi:setTouchEnabled(true)
    self:showReward()
end

function LangHuanMainLayer:showReward()
    self.bResultShowed = true
    local rewardNum = #self.rewardData
    local rewardList = TFArray:new()
    for i = 1, rewardNum, 1 do 
        local itemInfo = nil
        local rewardItemData = self.rewardData[i]
        if (rewardItemData.kind == LangHuanManager.PoolType_Treasures) then
            itemInfo = self.treasuresPoolInfo[rewardItemData.id]
        else
            itemInfo = self.boutiquePoolInfo[rewardItemData.id]
        end
        itemInfo.number = itemInfo.num
        --print("showReward",itemInfo)
        rewardList:push(BaseDataManager:getReward(itemInfo))
    end
    
    -- local rewardItem = FamilyTurnTemplate:objectByID(index)
    -- local rewardStr = rewardItem.item
    -- local tab = string.split(rewardStr, ",")
    -- local rewardList = TFArray:new()
    -- for i = 1, #tab do
    --     local tempTab = tab[i]
    --     local newTab = string.split(tempTab, "_")
    --     local reward_list1 = {}
    --     reward_list1.itemId = tonumber(newTab[2])
    --     reward_list1.number = tonumber(newTab[3])
    --     reward_list1.type   = tonumber(newTab[1])

    --     rewardList:push(BaseDataManager:getReward(reward_list1))
    -- end
    RewardManager:showRewardListLayer( rewardList )
end


function LangHuanMainLayer:getDestAngle(angle, index)
    -- print("cur_angle >>> ", angle)
    -- local base2 = math.floor(angle / 360)
    -- local delta = 360 * 2 + index * self.UNIT_ANGLE
    -- print("JiayuanLunpanLayer:getDestAngle >>>> ", delta + base2 * 360)
    local angle = ( 10 - self.rewardId ) * self.UNIT_ANGLE
    angle = math.mod(angle,360)
    return angle
end






return LangHuanMainLayer