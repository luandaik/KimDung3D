-- client side JiayuanLunpanLayer.lua
--[[
 * @Description: 家园转盘界面
 ]]
-- script writer wuqi
-- creation time 2016-07-15

local JiayuanLunpanLayer = class("JiayuanLunpanLayer", BaseLayer)

JiayuanLunpanLayer.kDaojuNum = 10

JiayuanLunpanLayer.UNIT_ANGLE = 180 / 5
JiayuanLunpanLayer.ID_FENGSHUI = 30153

function JiayuanLunpanLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.qiyu.FamilyLunPan")

    self.bTurning = false
    self.bResultShowed = false
    self.firstShow = true
end

function JiayuanLunpanLayer:initUI(ui)
    self.super.initUI(self, ui)
    
    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.btn_close.logic = self

    self.btn_yqm = TFDirector:getChildByPath(ui, "btn_yqm")
    self.btn_yqm.logic = self
    self.btn_yqm:setVisible(false)

    self.btn_kscj = TFDirector:getChildByPath(ui, "btn_kscj")
    self.btn_kscj.logic = self

    self.img_zhuanpan_bg = TFDirector:getChildByPath(ui, "img_di2")

    self.panel_daoju = {}
    for i = 1, self.kDaojuNum do
        self.panel_daoju[i] = TFDirector:getChildByPath(self.img_zhuanpan_bg, "panel_daoju" .. i)
        self.panel_daoju[i].txt_number = TFDirector:getChildByPath(self.panel_daoju[i], "txt_number")
        self.panel_daoju[i].btn_roleicon = TFDirector:getChildByPath(self.panel_daoju[i], "btn_roleicon")
        self.panel_daoju[i].img_icon = TFDirector:getChildByPath(self.panel_daoju[i], "img_icon")

        self.panel_daoju[i].btn_roleicon:setTouchEnabled(true)
        self.panel_daoju[i].btn_roleicon.index = i
        self.panel_daoju[i].btn_roleicon.logic = self
    end

    self.img_di = TFDirector:getChildByPath(ui, "panel_cj")
    self.img_di.logic = self
    self.img_di:setTouchEnabled(true)

    -- self.txt_share_times1 = TFDirector:getChildByPath(ui, "txt_meiri")
    -- self.txt_share_times = TFDirector:getChildByPath(self.txt_share_times1, "txt_meiri_num") 

    -- self.txt_cs = TFDirector:getChildByPath(ui, "txt_cs")
    -- self.txt_get = TFDirector:getChildByPath(self.txt_cs, "txt_num")

    self.panel_yongyou = TFDirector:getChildByPath(ui, "panel_yongyou")
    self.fengshui_num = TFDirector:getChildByPath(self.panel_yongyou, "txt_num")
    self.fengshui_num:setText(1)
    self.fengshui_get_num = TFDirector:getChildByPath(self.panel_yongyou, "txt_yongyou")

    self.txt_sy = TFDirector:getChildByPath(ui, "txt_sy")
    self.txt_zhuanpan_num = TFDirector:getChildByPath(self.txt_sy, "txt_num")

    self.btn_fenxiang = TFDirector:getChildByPath(ui, "btn_fenxiang")
    self.btn_fenxiang.logic = self
end

function JiayuanLunpanLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()

    if self.firstShow == true then
        self.ui:runAnimation("Action0", 1);
        self.firstShow = false
    end
end

function JiayuanLunpanLayer:registerEvents(ui)
    self.super.registerEvents(self)

    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCloseClickHandle), 1)   
    -- self.btn_yqm:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onYaoqingClickHandle), 1) 
    self.btn_kscj:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBeginClickHandle), 1)

    self.img_di:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBgClickHandle), 1)

    self.btn_fenxiang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShareClickHandle), 1)

    self.onGetRewardResult = function(event)
        local data = event.data[1]
        print("destId == >>>>>>>> ", data.id)
        self.rewardId = data.id
        -- if self.refreshUI then
            
        -- end
        self:refreshUI()
        self:startTurning()
        -- if self.setRewardIndex then
        --     local function callFunc()
        --         if not self.bResultShowed then
        --             self:setRewardIndex(data.id)
        --         end
        --     end
        --     local delay = CCDelayTime:create(1.2)
        --     local func = CCCallFunc:create(callFunc)
        --     local action = CCSequence:createWithTwoActions(delay, func)
        --     self:runAction(action)
        -- end
    end
    self.itemUseResult = function(event)
        if self.refreshUI then
            self:refreshUI()
        end
    end
    TFDirector:addMEGlobalListener(QiyuManager.HOME_TURNTABLE_REPONSE, self.onGetRewardResult)
    TFDirector:addMEGlobalListener(BagManager.ITEMBATCH_USED_RESULT, self.itemUseResult)
end

function JiayuanLunpanLayer:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(QiyuManager.HOME_TURNTABLE_REPONSE, self.onGetRewardResult)
    TFDirector:removeMEGlobalListener(BagManager.ITEMBATCH_USED_RESULT, self.itemUseResult)

    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
end

function JiayuanLunpanLayer.onBgClickHandle(sender)
    local self = sender.logic
    if self.isClosing == true then
        return
    end
    if not self.bTurning then
        return
    end
    self:StopAc()
end

function JiayuanLunpanLayer:StopAc()
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

function JiayuanLunpanLayer:getDestAngle(angle, index)
    -- print("cur_angle >>> ", angle)
    -- local base2 = math.floor(angle / 360)
    -- local delta = 360 * 2 + index * self.UNIT_ANGLE
    -- print("JiayuanLunpanLayer:getDestAngle >>>> ", delta + base2 * 360)
    local angle = ( 10 - self.rewardId + 1 ) * self.UNIT_ANGLE
    angle = math.mod(angle,360)
    return angle
end


function JiayuanLunpanLayer:setRewardIndex(index) 
    self.img_zhuanpan_bg:stopAllActions()

    local currRotate = self.img_zhuanpan_bg:getRotation()

    local destRotate = self:getDestAngle(currRotate, index)

    local function callFunc()
        self:endTurning(destRotate)
        self.bTurning = false
    end
    local rotateMid = CCRotateTo:create(3, destRotate)
    local callback = CCCallFunc:create(callFunc)
    local seq = CCSequence:createWithTwoActions(rotateMid, callback)
    self.img_zhuanpan_bg:runAction(seq)
end

function JiayuanLunpanLayer:refreshUI()
    for i = 1, #self.panel_daoju do
        local item = FamilyTurnTemplate:objectByID(i)
        local rewardStr = item.item
        local tab = string.split(rewardStr, "_")

        local commonReward = {}
        commonReward.type   = tonumber(tab[1])
        commonReward.itemId = tonumber(tab[2])
        commonReward.number = tonumber(tab[3])
        local rewardItem =  BaseDataManager:getReward(commonReward) 

        local function onClick(sender)
            Public:ShowItemTipLayer(rewardItem.itemid, rewardItem.type)
        end
        self.panel_daoju[i].btn_roleicon:setTextureNormal(GetColorIconByQuality_118(rewardItem.quality))
        self.panel_daoju[i].btn_roleicon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick))

        self.panel_daoju[i].img_icon:setTexture(rewardItem.path)
        Public:addPieceImg(self.panel_daoju[i].img_icon, rewardItem, nil, 1)

        self.panel_daoju[i].txt_number:setText("" .. rewardItem.number)
        self.panel_daoju[i].txt_number:setVisible(true)
        if rewardItem.number < 2 then
            self.panel_daoju[i].txt_number:setVisible(false)
        end
    end

    local bagNum = BagManager:getItemNumById(self.ID_FENGSHUI)
    self.fengshui_get_num:setText(stringUtils.format(localizable.Jiayuan_fengshui_have, bagNum))

    local timesInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.JIAYUAN_ZHUANPAN)
    local timesNum = timesInfo:getLeftChallengeTimes() or 0
    self.txt_zhuanpan_num:setText(timesNum)

    -- local timesInfo_invite = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.JIAYUAN_INVITE)
    -- local timesNum_invite = timesInfo_invite:getLeftChallengeTimes() or 0
    -- local maxInvite = timesInfo_invite.maxValue
    -- timesNum_invite = math.max( maxInvite - timesNum_invite, 0 )
    -- self.txt_share_times:setText(" (" .. timesNum_invite .. "/" .. maxInvite .. ") ")
    
    local timesInfo_share = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.JIAYUAN_SHARE)
    local timesNum_share = timesInfo_share:getLeftChallengeTimes() or 0
    local maxShare = timesInfo_share.maxValue
    --[[
    if timesNum_share >= maxShare then
        -- self.txt_get:setText(localizable.Jiayuan_times_not_get)
    else
        -- self.txt_get:setText(localizable.Jiayuan_times_get)
    end
    ]]
    -- if timesNum_share <= 0 then
        -- self.txt_get:setText(localizable.Jiayuan_times_get)
    -- else
        -- self.txt_get:setText(localizable.Jiayuan_times_not_get)
    -- end

    -- CommonManager:setRedPoint(self.btn_yqm, QiyuManager:checkBeInviteRedPoint(), "jiayuan_invite", ccp(5, 2))
end

function JiayuanLunpanLayer.onCloseClickHandle(sender)
    local self = sender.logic
    if self.bTurning == true then
        self:StopAc()
        return
    end
    self.isClosing = true
    self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
        AlertManager:close()
    end)
    self.ui:runAnimation("Action1", 1); 
end

function JiayuanLunpanLayer.onYaoqingClickHandle(sender)
    local self = sender.logic
    if self.isClosing == true then
        return
    end
    if self.bTurning == true then
        self:StopAc()
        return
    end
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.qiyu.JiayuanInviteLayer", AlertManager.BLOCK_AND_GRAY)
    AlertManager:show()
end

function JiayuanLunpanLayer.onBeginClickHandle(sender)
    local self = sender.logic
    if self.isClosing == true then
        return
    end
    if self.bTurning == true then
        self:StopAc()
        return
    end
    local daibi = BagManager:getItemNumById(30153)
    if daibi == 0 and not MainPlayer:isEnoughTimes(EnumRecoverableResType.JIAYUAN_ZHUANPAN, 1, true) then
        return
    end
    QiyuManager:requestJiayuanLunpan()
end

function JiayuanLunpanLayer.onShareClickHandle(sender)
    local self = sender.logic
    if self.isClosing == true then
        return
    end
    if self.bTurning == true then
        self:StopAc()
        return
    end
    if self.logiclayer then
        self.logiclayer:openFriendPanel()
    end
    self.isClosing = true
    self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
        AlertManager:close()
    end)
    self.ui:runAnimation("Action1", 1); 
end

--开始转转盘
function JiayuanLunpanLayer:startTurning()
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

function JiayuanLunpanLayer:rotateLunPan()
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
        currRotate = math.floor(currRotate * 10)
        currRotate = math.mod(currRotate,3600)
        currRotate = currRotate * 0.1
        self.img_zhuanpan_bg:setRotation(currRotate)
    else
        if self.slowAngle == nil then
            local angle = ( 10 - self.rewardId + 1 ) * self.UNIT_ANGLE
            angle = math.mod(angle,360)
            currRotate = math.floor(currRotate * 10)
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
                local angle = ( 10 - self.rewardId + 1 ) * self.UNIT_ANGLE
                currRotate = angle
                self.isOver = true
            end
            self.img_zhuanpan_bg:setRotation(currRotate)
        end
    end
end

function JiayuanLunpanLayer:endTurning(destRotate)
    local base = destRotate % 360
    self.img_zhuanpan_bg:setRotation(destRotate)
    self:showReward()
end

function JiayuanLunpanLayer:showReward()
    self.bResultShowed = true
    local index = self.rewardId

    local rewardItem = FamilyTurnTemplate:objectByID(index)
    local rewardStr = rewardItem.item
    local tab = string.split(rewardStr, ",")
    local rewardList = TFArray:new()
    for i = 1, #tab do
        local tempTab = tab[i]
        local newTab = string.split(tempTab, "_")
        local reward_list1 = {}
        reward_list1.itemId = tonumber(newTab[2])
        reward_list1.number = tonumber(newTab[3])
        reward_list1.type   = tonumber(newTab[1])

        rewardList:push(BaseDataManager:getReward(reward_list1))
    end
    RewardManager:showRewardListLayer( rewardList )
end

return JiayuanLunpanLayer



--        if self.slowAngle == nil then
--             local angle = ( 10 - self.rewardId + 1 ) * self.UNIT_ANGLE
--             angle = math.mod(angle,360)
--             currRotate = math.floor(currRotate * 10)
--             currRotate = math.mod(currRotate,3600)
--             currRotate = currRotate * 0.1
--             angle = angle - currRotate + 360
--             angle = math.mod(angle,360)
--             if angle < 180 then
--                 angle = angle + 360
--             end

--             self.slowAngle = angle + 360 + 180
--             local v0 = speedLow
--             local v = speedHigh 
--             local a = (v * v - v0 * v0) / (2* self.slowAngle)
--             self.a = a
--             self.speed = v
--             self.slowAngle = self.slowAngle + 180 + 9 + 18
--         end
--         if self.slowAngle and self.slowAngle > 0 then
--             -- speed down to low 
--             local s = self.speed  - 0.5 * self.a
--             self.speed = self.speed - self.a
--             if self.isSlowed == false and self.speed < speedLow then
--                 -- [a] slow down
--                 self.speed = self.speed + self.a
--                 local a = self.speed - speedLow
--                 s = self.speed  - 0.5 * a

--                 self.isSlowed = true
--                 local v = speedLow 
--                 local v0 = speedLowest
--                 a = (v * v - v0 * v0) / (2* self.slowAngle)
--                 self.a = a
--                 self.speed = speedLow
--             end
--             if self.speed < speedLowest + self.a then
--                 self.slowAngle = 0
--                 self.speed = self.speed + self.a
--                 local a = self.speed - speedLowest
--                 s = self.speed  - 0.5 * a
--                 self.speed = speedLowest
--                 currRotate = currRotate + s
--             else
--                 self.slowAngle = self.slowAngle - s
--                 currRotate = currRotate + s
--             end
--             self.img_zhuanpan_bg:setRotation(currRotate)
--         else
--             -- back to end
--             if self.slowChacheAngle and self.slowChacheAngle > 0 then
--                 self.slowChacheAngle = self.slowChacheAngle - self.speed
--                 currRotate = currRotate - self.speed
--             else
--                 local angle = ( 10 - self.rewardId + 1 ) * self.UNIT_ANGLE
--                 currRotate = angle
--                 self.isOver = true
--             end
--             self.img_zhuanpan_bg:setRotation(currRotate)
--         end