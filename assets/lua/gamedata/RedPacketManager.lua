-- client side RedPacketManager.lua
--[[
 * @Description: 天机轮管理类
 ]]
-- script writer chikui
-- creation time 2016-08-05


local RedPacketManager = class("RedPacketManager")


RedPacketManager.RECEIVE_RANK_INFO            = "RedPacketManager.RECEIVE_RANK_INFO"
RedPacketManager.RECEIVE_MY_RED_PACKET_INFO   = "RedPacketManager.RECEIVE_MY_RED_PACKET_INFO"
RedPacketManager.RECEIVE_All_RED_PACKET       = "RedPacketManager.RECEIVE_All_RED_PACKET"
RedPacketManager.RECEIVE_ONE_RED_PACKET       = "RedPacketManager.RECEIVE_ONE_RED_PACKET"
RedPacketManager.RECEIVE_SEND_RED_PACKET_SUCCESS       = "RedPacketManager.RECEIVE_SEND_RED_PACKET_SUCCESS"
RedPacketManager.RECEIVE_SEND_ATTRIBUTE_BRUSH       = "RedPacketManager.RECEIVE_SEND_ATTRIBUTE_BRUSH"
RedPacketManager.RECEIVE_MY_ACTIVITY_RED_PACKET_INFO      = "RedPacketManager.RECEIVE_MY_ACTIVITY_RED_PACKET_INFO"
RedPacketManager.SEND_GUILD_ACTIVE_RED_PACKET = "RedPacketManager.SEND_GUILD_ACTIVE_RED_PACKET"
RedPacketManager.RECEIVE_ACTIVE_REDPACKET_OPEN = "RedPacketManager.RECEIVE_ACTIVE_REDPACKET_OPEN"
RedPacketManager.RECEIVE_ACTIVE_RED_PACKET_OVER = "RedPacketManager.RECEIVE_ACTIVE_RED_PACKET_OVER"

RedPacketManager.RedPacket_1 = 1
RedPacketManager.RedPacket_2 = 2
RedPacketManager.RedPacket_3 = 3
function RedPacketManager:ctor()
    -- 排行榜信息
    TFDirector:addProto(s2c.RED_PACKET_RANKING_REPONSE, self, self.onReceiveRankInfo)
    -- 我的红包信息
    TFDirector:addProto(s2c.MY_RED_PACKET_REPONSE, self, self.onReceiveMyRedPacketInfo)
    -- 所有的红包信息
    TFDirector:addProto(s2c.RED_PACKET_REPONSE, self, self.onReceiveAllRedPacket)
    -- 单个红包信息
    TFDirector:addProto(s2c.SINGLE_RED_PACKET_REPONSE, self, self.onReceiveOneRedPacket)

    TFDirector:addProto(s2c.RED_PACKET_ATTRIBUTE_REPONSE, self, self.onReceiveAttributeInfo)
    --帮派活跃红包信息
    TFDirector:addProto(s2c.GAIN_GUILD_ACTIVE_RED_PACKET_INFO, self, self.onReceiveActivityRedPacketInfo)
    --发放帮派活跃红包
    TFDirector:addProto(s2c.SEND_GUILD_ACTIVE_RED_PACKET, self, self.onReceiveActivePacket)
    --帮派活跃红包红点
    TFDirector:addProto(s2c.SEND_GUILD_ACTIVE_POINT, self, self.onReceiveMenuRedPoint)
    --发放帮派活跃红包之前的判断
    TFDirector:addProto(s2c.BEFORE_SEND_GUILD_ACTIVE_RED_PACKET, self, self.onReceiveOpenSendActivePacket)
    --过零点的信息
    TFDirector:addProto(s2c.UPDATE_GUILD_ACTIVE_RED_PACKET, self, self.onReceiveActivePacketOver)


    self:restart()
end


function RedPacketManager:restart()
    self.myRank = {}
    self.rankList = {}
    self.redPacketList = {}
    self.menuRedPoint = 0
    self.curSendData = {}
    self.SendAttribute = {}
    self.integral = 0
    self.currency = 0
    self.currenzy = 0
    self.achievementAttribute = nil
    self.achievementList = {}
    self.isFirstLoaded = false
end

function RedPacketManager:requestBuyRedPacket(id,isloading)
    if isloading ~= false then
        showLoading()
    end
    local msg = {
        id
    }
    TFDirector:send(c2s.BUY_RED_PACKET_REQUEST, msg)
end

function RedPacketManager:requestSendRedPacket(id,des,num)
    showLoading()
    local msg = {
        id,
        des,
        num
    }
    TFDirector:send(c2s.SEND_RED_PACKET_REQUEST, msg)
end

function RedPacketManager:requestOpenSendActiveRedPacket(idx)
    showLoading()
    local msg = {
        idx
    }
    TFDirector:send(c2s.BEFORE_SEND_GUILD_ACTIVE_RED_PACKET, msg)
end

function RedPacketManager:requestActivitySendRedPacket(id,des,num)
    showLoading()
    local msg = {
        id,
        num,
        des
    }
    TFDirector:send(c2s.SEND_GUILD_ACTIVE_RED_PACKET, msg)
end

function RedPacketManager:requestGetRedPacket(gmId)
    showLoading()
    local msg = {
        gmId
    }
    TFDirector:send(c2s.RECEIVE_RED_PACKET_REQUEST, msg)
end

function RedPacketManager:requestGetRankInfo(num,isShow)
    showLoading()
    local msg = {
        num
    }
    TFDirector:send(c2s.RED_PACKET_RANKING_REQUEST, msg)
    self.isShowRank = isShow
end

function RedPacketManager:requestGetActivityRedPacket()
    showLoading()
    TFDirector:send(c2s.GAIN_GUILD_ACTIVE_RED_PACKET_INFO, {})
end

--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--
function RedPacketManager:onReceiveOpenSendActivePacket(event)
    hideLoading()
    self:openSendLayer(event.data.type,true)
end

function RedPacketManager:onReceiveActivePacketOver(event)
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_ACTIVE_RED_PACKET_OVER, {event})
end

function RedPacketManager:onReceiveActivePacket(event)
    TFDirector:dispatchGlobalEventWith(self.SEND_GUILD_ACTIVE_RED_PACKET, {event})
end

function RedPacketManager:onReceiveMenuRedPoint(event)
    local data = event.data
    print(event.data)
    self.menuRedPoint = data.redPoint
end

function RedPacketManager:onReceiveRankInfo( event )
    hideLoading()
    local data = event.data or {}
    -- print("data-------------------------")
    -- print(data)
    -- print("data-------------------------")
    local info = data.info or {}
    self.rankList = info
    self.myRank.rank = data.ranking
    self.myRank.lessIntegral = data.lessIntegral
    --self.coinInType = 0
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_RANK_INFO, {})
    if self.isShowRank == true then
        self.isShowRank = false
        self:openRankLayer()
    end
end

function RedPacketManager:onReceiveMyRedPacketInfo( event )
    hideLoading()
    local data = event.data or {}
    -- print("data-------------------------")
    -- print(data)
    -- print("data-------------------------")
    local info = data.info or {}
    self.integral = info.integral
    self.currency = info.currency
    self.achievementAttribute = nil
    if self.isFirstLoaded ~= true then
        self:getAcheivAttri()
        self.isFirstLoaded = true
    end
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_MY_RED_PACKET_INFO, {})
end

function RedPacketManager:onReceiveActivityRedPacketInfo(event)
    hideLoading()
    local data = event.data or {}
    self.currenzy = data.secondlyProgress
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_MY_ACTIVITY_RED_PACKET_INFO, {event})
end

function RedPacketManager:onReceiveAllRedPacket( event )
    hideLoading()
    local data = event.data or {}
    -- print("data-------------------------")
    -- print(data)
    -- print("data-------------------------")
    local info = data.info or {}
    
    self.redPacketList = info
    table.sort( self.redPacketList, self.sortRedPacket)
    for k,v in ipairs(self.redPacketList) do
        if v.receiver then
            v.myNum = nil
            -- table.sort( v.receiver, self.sortGetRed )
            for kk,vv in pairs(v.receiver) do
                if vv.playerId == MainPlayer:getPlayerId() then
                    v.myNum = vv.sycee
                    break
                end
            end
        end
        v.luckysorted = false
        -- ChatManager:addRedPacketForGang(v,false)
    end
    ChatManager:addRedPacketListForGang(self.redPacketList)
    -- ChatManager:sortGangMsgByTime()
    -- ChatManager:addRedPacketForGang(nil,true)

    TFDirector:dispatchGlobalEventWith(self.RECEIVE_All_RED_PACKET, {})
end

function RedPacketManager:onReceiveOneRedPacket( event )
    hideLoading()
    local data = event.data or {}
    -- print("data-------------------------")
    -- print(data)
    -- print("data-------------------------")
    local info = data.info
    if info == nil or info.id == nil then
        return
    end
    local idx = 0
    for k,v in pairs(self.redPacketList) do
        if info.id == v.id then
            idx = k
            break
        end
    end
    local newadd = false
    info.myNum = nil
    -- if info.receiver then
    --     -- table.sort( info.receiver, self.sortGetRed )
    -- end
    if idx == 0 then
        idx = #self.redPacketList + 1
        newadd = true
    else
        if info.receiver then
            for k,v in pairs(info.receiver) do
                if v.playerId == MainPlayer:getPlayerId() then
                    info.myNum = v.sycee
                    break
                end
            end
        end
    end
    self.redPacketList[idx] = info
    self.redPacketList[idx].luckysorted = false
    print("newadd",newadd)
    if newadd == true then 
        print("RedPacketManager:onReceiveOneRedPacket",info.sendPlayer.playerId,MainPlayer:getPlayerId())
        if info.sendPlayer and info.sendPlayer.playerId == MainPlayer:getPlayerId() then
            TFDirector:dispatchGlobalEventWith(self.RECEIVE_SEND_RED_PACKET_SUCCESS, {id = info.id})
        end
        ChatManager:addRedPacketForGang(info,true)
    else
        TFDirector:dispatchGlobalEventWith(self.RECEIVE_ONE_RED_PACKET, {})
    end
end

function RedPacketManager:onReceiveAttributeInfo(event)
    self.curSendData = {}
    self.SendAttribute = {}
    local data = event.data
    if data.id == nil then
        return
    end
    self.curSendData = data
    local item = RedPacketData:objectByID(data.id)
    self.SendAttribute = item:getAttribute()
    if item.time > 0 then
        if self.updateTimerID == nil then
            self.updateTimerID = TFDirector:addTimer(1000, -1, nil,
                function()
                    self:refreshSendAttri()
            end)
        end
    else
        if self.updateTimerID then
            TFDirector:removeTimer(self.updateTimerID)
            self.updateTimerID = nil
        end
    end
    TFDirector:dispatchGlobalEventWith(self.RECEIVE_SEND_ATTRIBUTE_BRUSH, {})
end

function RedPacketManager:refreshSendAttri()
    if self.curSendData.id == nil then
        self.SendAttribute = {}
        return
    end
    local item = RedPacketData:objectByID(self.curSendData.id)
    local currtime = MainPlayer:getNowtime()
    if currtime > item.time + self.curSendData.startTime * 0.001 then
        self.SendAttribute = {}
        self.curSendData = {}
        self:requestBuyRedPacket(0,false)
        if self.updateTimerID then
            TFDirector:removeTimer(self.updateTimerID)
            self.updateTimerID = nil
        end
        TFDirector:dispatchGlobalEventWith(self.RECEIVE_SEND_ATTRIBUTE_BRUSH, {})
    end
end
--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--

function RedPacketManager.sortRedPacket(red1,red2)
    return red1.startTime < red2.startTime
end

function RedPacketManager:sortRedPacketLucky( redpacket )
    if redpacket == nil then
        return
    end
    if redpacket.receiver and redpacket.luckysorted ~= true then
        table.sort( redpacket.receiver, self.sortGetRed )
        redpacket.luckysorted = true
    end
end

function RedPacketManager.sortGetRed( person1 , person2 )
    return person1.sycee > person2.sycee
end

function RedPacketManager:getMyRankInfo()
    return self.myRank or {}
end

function RedPacketManager:getRankList()
    return self.rankList
end

function RedPacketManager:getCurrenCy()
    return self.currency or 0
end

function RedPacketManager:getCurrenZy()
    return self.currenzy or 0 
end

function RedPacketManager:getMyIntegral()
    return self.integral
end

function RedPacketManager:getItemIdByType(type)
    local itemId = 0
    if type == self.RedPacket_1 then
        itemId = 30167
    elseif type == self.RedPacket_2 then
        itemId = 30168
    elseif type == self.RedPacket_3 then
        itemId = 30169
    end
    return itemId
end

function RedPacketManager:getRedPacketNumByType(type)
    local itemId = self:getItemIdByType(type)
    if itemId == 0 then
        return 0
    end
    return BagManager:getItemNumById(itemId)
end

function RedPacketManager:getSendAttri()
    return self.SendAttribute or {}
end

function RedPacketManager:IsHaveSendAttri()
    if self.curSendData == nil or self.curSendData.id == nil then
        return false
    end
    local item = RedPacketData:objectByID(self.curSendData.id)
    if item.time > 0 then
        local currtime = MainPlayer:getNowtime()
        if currtime <= item.time + self.curSendData.startTime * 0.001 then
            return true
        else
            self.curSendData = {}
            self.SendAttribute = {}
            self:requestBuyRedPacket(0,false)
            if self.updateTimerID then
                TFDirector:removeTimer(self.updateTimerID)
                self.updateTimerID = nil
            end
            TFDirector:dispatchGlobalEventWith(self.RECEIVE_SEND_ATTRIBUTE_BRUSH, {})
        end
    end
    return false
end

function RedPacketManager:getAcheivAttri()
    if self.achievementAttribute == nil then
        self.achievementAttribute = {}
        self.effectActiveAttribute = {}
        self.effectPassive = {}
        self.subAttriList = {}
        local achievId = 0
        for item in RedPacketAchievementData:iterator() do
            if self.integral and self.integral >= item.integral then
                if achievId < item.id then
                    achievId = item.id
                end
                if self.achievementList[achievId] == nil then
                    self.achievementList[achievId] = self.isFirstLoaded
                end
                self.subAttriList[item.id] = item.power
            end
        end
        if achievId > 0 then
            self.achievementAttribute ,self.effectActiveAttribute,self.effectPassive = RedPacketAchievementData:getAttributeByid(achievId)
        end
    end
    return self.achievementAttribute or {} , self.subAttriList or {} , self.effectActiveAttribute or {}, self.effectPassive or {}
end

function RedPacketManager:getAcheivExtAttri()
    if self.achievementAttribute == nil then
        self:getAcheivAttri()
    end
    return self.effectActiveAttribute or {} , self.effectPassive or {}
end

function RedPacketManager:clearRed()
    for k,v in pairs(self.achievementList) do
        self.achievementList[k] = false
    end
end

function RedPacketManager:getRedPacketByGmId( gmid )
    for k,v in pairs(self.redPacketList) do
        if v.id == gmid then
            return v
        end
    end
    return nil
end

function RedPacketManager:isRedPacketCanReceive( gmid )
    if gmid == nil then
        return false
    end
    local redpacket = self:getRedPacketByGmId(gmid)
    if redpacket == nil then
        print("local redpacket = self:getRedPacketByGmId(gmid) is nil : gmid = ",gmid)
        return
    end
    local receiverList = redpacket.receiver or {}
    if redpacket.myNum and redpacket.myNum > 0 then
        return false
    end
    if redpacket.personNum <= #receiverList or redpacket.surplusSycee <= 0 then
        return false
    end
    local value = ConstantData:objectByID('RedpacketLastTime').value
    if redpacket.type == 1 then
        value = ConstantData:objectByID('ActivityRedpacketLastTime').value
    end
    local time = redpacket.startTime * 0.001 + value
    if time < MainPlayer:getNowtime() then
        return false
    end
    return true
end

function RedPacketManager:isRedPacketCanReceiveByObject( redpacket )
    if redpacket == nil then
        return
    end
    local receiverList = redpacket.receiver or {}
    if redpacket.myNum and redpacket.myNum > 0 then
        return false
    end
    if redpacket.personNum <= #receiverList or redpacket.surplusSycee <= 0 then
        return false
    end
    local value = ConstantData:objectByID('RedpacketLastTime').value
    if redpacket.type == 1 then
        value = ConstantData:objectByID('ActivityRedpacketLastTime').value
    end
    local time = redpacket.startTime * 0.001 + value
    if time < MainPlayer:getNowtime() then
        return false
    end
    return true
end

function RedPacketManager:checkMenuRedPoint()
    print("RedPacketManager:checkMenuRedPoint",self.menuRedPoint)
    if self.menuRedPoint == 0 then
        return false
    elseif self.menuRedPoint == 1 then
        return true
    end
end

function RedPacketManager:checkRedPoint()
    local factionInfo = FactionManager:getFactionInfo()
    if nil == factionInfo then
        return false
    end
    local guildId = factionInfo.guildId
    if nil == guildId then
        return false
    end
    if nil == self.redPacketList or #self.redPacketList <= 0 then
        return false
    end
    for k,v in ipairs(self.redPacketList) do
        local receiverList = v.receiver or {}
        if v.personNum > #receiverList and v.surplusSycee > 0 then
            local value = ConstantData:objectByID('RedpacketLastTime').value
            if v.type == 1 then
                value = ConstantData:objectByID('ActivityRedpacketLastTime').value
            end
            local time = v.startTime * 0.001 + value
            if time > MainPlayer:getNowtime() then
                if nil == v.myNum or v.myNum <= 0 then
                    return true
                end
            end
        end
    end
    return false
end
--=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=--

function RedPacketManager:openMainLayer()

    local layer  = require("lua.logic.redpacket.RedPacketMainLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function RedPacketManager:openHuoYueMainLayer()

    local layer  = require("lua.logic.redpacket.RedPacketHuoyueMainLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function RedPacketManager:openRankLayer()
    local layer  = require("lua.logic.redpacket.RedPacketRankLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function RedPacketManager:openSendLayer(type, isActivity)
    local layer  = require("lua.logic.redpacket.RedPacketSendLayer"):new(type, isActivity)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function RedPacketManager:openSendSuccessLayer(gmid)
    local layer  = require("lua.logic.redpacket.RedPacketSendSuccessLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_NONE)
    layer:setInfo(gmid)
    AlertManager:show()
end

function RedPacketManager:openAchievementLayer()
    local layer  = require("lua.logic.redpacket.RedPacketAcheivLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function RedPacketManager:openLuckRankLayer(gmid)
    local layer  = require("lua.logic.redpacket.RedPacketLuckRankLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:setInfo(gmid)
    AlertManager:show()
end

return RedPacketManager:new();