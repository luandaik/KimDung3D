-- ///////////////////////////////////////////////////
-- @Author:             sjj
-- @Create Date:        2017-11-08 16:41:09
-- @Title:              Activity_FanLiZhuanPan
-- @Describe:           返利转盘
-- ///////////////////////////////////////////////////
local Activity_FanLiZhuanPan = class("Activity_FanLiZhuanPan", BaseLayer)

Activity_FanLiZhuanPan.UNIT_ANGLE = 360 / 8
Activity_FanLiZhuanPan.zhuanPanNum = 8

function Activity_FanLiZhuanPan:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.operatingactivities.FanLiZhuanPan")
end

function Activity_FanLiZhuanPan:initUI(ui)
	self.super.initUI(self,ui)

	self.bTurning = false
    self.bResultShowed = false 
    self.rewardId = 0

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
	self.img_zhuanpan_bg = TFDirector:getChildByPath(ui, "img_di2")
	self.txt_time = TFDirector:getChildByPath(ui, "txt_time")
    self.btn_history = TFDirector:getChildByPath(ui,'btn_cjls')
    self.btn_help = TFDirector:getChildByPath(ui, "btn_help")
    self.btn_help:setVisible(false)
    self.txt_yongyou = TFDirector:getChildByPath(ui, "txt_yongyou")
    self.txt_num = TFDirector:getChildByPath(TFDirector:getChildByPath(ui, "txt_sy"), "txt_num")
    self.btn_ChouJiang = TFDirector:getChildByPath(ui, "btn_kscj")
    self.btn_ChouJiang.logic = self
    
    --文本
    self.txtList = {}
    local panel_txt1 = TFDirector:getChildByPath(ui, "panel_txt1")
    local panel_txt2 = TFDirector:getChildByPath(ui, "panel_txt2")
	self.txtList[1] = TFDirector:getChildByPath(panel_txt1, "txt_2")	-- 消费/充值
	self.txtList[2] = TFDirector:getChildByPath(panel_txt2, "txt_1")	-- 获得下一次抽奖机会还需消费/充值:
	self.txtList[3] = TFDirector:getChildByPath(panel_txt1, "txt_4")	-- 2000元宝
	self.txtList[4] = TFDirector:getChildByPath(panel_txt2, "txt_2")	-- 200元宝

	--转盘
    self.panel_daoju = {}
    for i = 1, self.zhuanPanNum,1 do
        self.panel_daoju[i] = TFDirector:getChildByPath(ui, "panel_daoju" .. i)
        self.panel_daoju[i].btn_roleicon = TFDirector:getChildByPath(self.panel_daoju[i], "btn_roleicon")
        self.panel_daoju[i].img_icon = TFDirector:getChildByPath(self.panel_daoju[i], "img_icon")
        self.panel_daoju[i].img_jipin = TFDirector:getChildByPath(self.panel_daoju[i], "img_jp")
        self.panel_daoju[i].txt_number = TFDirector:getChildByPath(self.panel_daoju[i], "txt_number")

        self.panel_daoju[i].btn_roleicon:setTouchEnabled(true)
        self.panel_daoju[i].btn_roleicon.index = i
        self.panel_daoju[i].btn_roleicon.logic = self
    end

    self.endTime = OperationActivitiesManager:getActivityInfoByType(OperationActivitiesManager.Type_FanLiZhuanPan).endTime
end
function Activity_FanLiZhuanPan:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function Activity_FanLiZhuanPan:removeUI()
    self.super.removeUI(self)
end
function Activity_FanLiZhuanPan:registerEvents()
	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
	self.btn_history:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHistoryClick))
    -- self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClick))
    self.btn_ChouJiang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onChouJiangClick))

    self.onGetReward = function(event)
        self:startTurning()
        self.rewardId = event.data[1].index
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(FanLiZhuanPanManager.RebateTurntableRecord, self.onGetReward)

    self.updateEndTime = TFDirector:addTimer(60, -1, nil,
        function()
            self:refreshTimeUI()
    end)

end
function Activity_FanLiZhuanPan:removeEvents()
	self.super.removeEvents(self)
	if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    
    if self.updateEndTime then
        TFDirector:removeTimer(self.updateEndTime)
        self.updateEndTime = nil
    end

    TFDirector:removeMEGlobalListener(FanLiZhuanPanManager.RebateTurntableRecord, self.onGetReward)

end

function Activity_FanLiZhuanPan:refreshUI()
    --拿数据
    self.costGoods = BagManager:getItemNumById(30905)
    self.curTime = FanLiZhuanPanManager:getCurTime()    
    local desType = FanLiZhuanPanManager:getDesType()
    local desCost = FanLiZhuanPanManager:getDesCost()
    local needCost = FanLiZhuanPanManager:getNeedCost()
    --文本
    local txtType = localizable.activity_fanli_des[desType]
    self.txtList[1]:setText(txtType)
    self.txtList[2]:setText(stringUtils.format(localizable.activity_fanli_need,txtType))
    self.txtList[3]:setText(stringUtils.format(localizable.activity_fanli_yuanbao,desCost))
    self.txtList[4]:setText(stringUtils.format(localizable.activity_fanli_yuanbao,needCost))
    self.txt_yongyou:setText(stringUtils.format(localizable.StrategyCard_txt_yongyou, self.costGoods))
    self.txt_num:setText(self.curTime)

    self:loadRewardPool()
end

--奖励池
function Activity_FanLiZhuanPan:loadRewardPool()
    self.RewardPoolData = FanLiZhuanPanManager:getRewardPoolData()
    for i = 1, self.zhuanPanNum, 1 do

        if (self.RewardPoolData[i] ~= nil and self.RewardPoolData[i].itemId ~= nil) then
            -- self.panel_daoju[i].btn_roleicon:setVisible(true)
            -- self.panel_daoju[i].img_icon:setVisible(true)
            -- self.panel_daoju[i].txt_number:setVisible(true)
            local itemData = self.RewardPoolData[i]
            --极品角标
            if (itemData.kind == 0) then
                self.panel_daoju[i].img_jipin:setVisible(false)
            else
                self.panel_daoju[i].img_jipin:setVisible(true)
            end
            local rewardInfo = BaseDataManager:getReward(itemData)
            self.panel_daoju[i].txt_number:setText(tonumber(itemData.number))
            self.panel_daoju[i].img_icon:setTexture(rewardInfo.path)
            self.panel_daoju[i].btn_roleicon:setTextureNormal(GetColorIconByQuality(rewardInfo.quality))
            --添加碎片框
            Public:addPieceImg(self.panel_daoju[i].img_icon, rewardInfo, nil)

            local function onClick(sender)
                Public:ShowItemTipLayer(rewardInfo.itemid, rewardInfo.type)
            end
            self.panel_daoju[i].btn_roleicon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick))
        end
    end
end
--历史记录信息回调
function Activity_FanLiZhuanPan.onHistoryClick(sender)
    FanLiZhuanPanManager:openZhuanPanRecodeLayer()
end

-- function Activity_FanLiZhuanPan:onHelpClick()
--     
-- end

--抽奖按钮回调
function Activity_FanLiZhuanPan.onChouJiangClick( btn )
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

    if ((self.curTime <= 0  and self.costGoods <= 0) or self.costGoods == nil ) then
        toastMessage(localizable.smithy_EquipmentRefining_pro)
        return
    end
   	--请求
    FanLiZhuanPanManager:requireZhuanPanReward()

end

function Activity_FanLiZhuanPan:StopAc()
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
function Activity_FanLiZhuanPan:refreshTimeUI()
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
function Activity_FanLiZhuanPan:startTurning()
    self.bTurning = true
    self.bResultShowed = false

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


function Activity_FanLiZhuanPan:rotateLunPan()
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
            local angle = ( 9 - self.rewardId ) * self.UNIT_ANGLE
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
                local angle = ( 9 - self.rewardId ) * self.UNIT_ANGLE
                currRotate = angle
                self.isOver = true
            end
            self.img_zhuanpan_bg:setRotation(currRotate)
        end
    end
end

function Activity_FanLiZhuanPan:endTurning(destRotate)
    local base = destRotate % 360
    self.img_zhuanpan_bg:setRotation(destRotate)
    self:showReward()
end

function Activity_FanLiZhuanPan:showReward()
    self.bResultShowed = true
    local itemInfo =  self.RewardPoolData[self.rewardId]
    local rewardList = TFArray:new()

    rewardList:push(BaseDataManager:getReward(itemInfo))

    RewardManager:showRewardListLayer( rewardList )
end


function Activity_FanLiZhuanPan:getDestAngle(angle, index)
    local angle = ( 9 - self.rewardId ) * self.UNIT_ANGLE
    angle = math.mod(angle,360)
    return angle
end
return Activity_FanLiZhuanPan