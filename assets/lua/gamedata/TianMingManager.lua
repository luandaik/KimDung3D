-- client side TianMingManager.lua
--[[
 * @Description: 天命管理器
 ]]


local CardTianMing      = require('lua.gamedata.base.CardTianMing');
local TianMingManager = class("TianMingManager")

TianMingManager.RefreshTianMingList                = "TianMingManager.RefreshTianMingList"
TianMingManager.RefreshTianMingPos                 = "TianMingManager.RefreshTianMingPos"
TianMingManager.REPONSE_BREACH_DESTINY                 = "TianMingManager.REPONSE_BREACH_DESTINY"
TianMingManager.REPONSE_STAR_LEVEL_DESTINY         = "TianMingManager.REPONSE_STAR_LEVEL_DESTINY" 

TianMingManager.select_type_1                   = 1 --天命升级
TianMingManager.select_type_2                   = 2 --天命升星

function TianMingManager:ctor(data)
    TFDirector:addProto(s2c.DESTINY_ALL_DATA_INFO, self, self.updateTianMingList)
    TFDirector:addProto(s2c.DESTINY_DATA_INFO, self, self.updateSingleTianMingList)
    TFDirector:addProto(s2c.REPONSE_EQUIP_DESTINY, self, self.updateTianMingPos)
    TFDirector:addProto(s2c.REPONSE_BREACH_DESTINY, self, self.updateTianMingBreach)
    TFDirector:addProto(s2c.REPONSE_STAR_LEVEL_DESTINY, self, self.updateStarLevelDestiny)
    TFDirector:addProto(s2c.REPONSE_COUMSE_DESTINY, self, self.updateDeleteTianMingList)

    --天命分解
    --TFDirector:addProto(s2c.REPONSE_EX_LOAD_DESTINY, self, self.ReponseExLoadDestiny)
--     TFDirector:addProto(s2c.POTENTIAL_PRACTICE_EXCHANGE_RESPONSE, self, self.onReceiveHuanGong)
    self.TianMingList           = TFArray:new()     --全部天命
    self.EmptyTianMingList      = TFArray:new()     --未穿戴的天命
    self.SquareTianMingNum      = 0                 --方形天命数量
    self.TriangleTianMingNum    = 0                 --三角形形天命数量
    self.CircularTianMingNum    = 0                 --园形天命数量
    self.pos                    = 0                 --用于镶嵌界面的判断，如果相同则为0
    self.selectLayer            = false
end

function TianMingManager:restart()
    self.TianMingList:clear()
end

function TianMingManager:updateTianMingList(event)
    hideLoading()
    self.TianMingList = TFArray:new()
    self.EmptyTianMingList = TFArray:new()
    self.SquareTianMingNum      = 0
    self.TriangleTianMingNum    = 0
    self.CircularTianMingNum    = 0

    for _,cardRole in pairs(CardRoleManager.cardRoleDataList) do
        if cardRole.quality >= 4 then
             cardRole:delTianMing()
        end
    end
    local info = event.data.info
    if (info == nil) then
        TFDirector:dispatchGlobalEventWith(TianMingManager.RefreshTianMingList, {})
        return
    end 
    for i,v in ipairs(info) do
        self:addCardTianMing(v)
    end

    table.sort(self.TianMingList.m_list, function ( a, b )
        if a.config.special_equipment == b.config.special_equipment then
            if a.config.special_equipment == 1 then
                return a.quality < b.quality
            end
            if a.quality == b.quality then
                if a.level == b.level then
                    return a.exp > b.exp
                else
                    return a.level > b.level
                end
            else
                return a.quality > b.quality
            end
        end
        return a.config.special_equipment > b.config.special_equipment  
    end)
    table.sort(self.EmptyTianMingList.m_list, function ( a, b )
        if a.config.special_equipment == b.config.special_equipment then
            if a.config.special_equipment == 1 then
                return a.quality < b.quality
            end
            if a.quality == b.quality then
                if a.level == b.level then
                    return a.exp > b.exp
                else
                    return a.level > b.level
                end
            else
                return a.quality > b.quality
            end
        end
       return a.config.special_equipment > b.config.special_equipment  
    end)
    TFDirector:dispatchGlobalEventWith(TianMingManager.RefreshTianMingList, {})
    

end
--单个
function TianMingManager:updateSingleTianMingList(event)
    hideLoading()
    local info = event.data
    if (info == nil) then
        return
    end
    self:addCardTianMing(info)
end

function TianMingManager:addCardTianMing(info)
    local gmId   = info.instanceId
    local cardTianMing = self:getTianMingByGmId(gmId)
    if cardTianMing ~= nil then
        cardTianMing:setData(info) 
    else
        cardTianMing = CardTianMing:new(gmId);
        cardTianMing:setData(info)   
        self.TianMingList:push(cardTianMing)
        if info.roleId == 0 then
            self.EmptyTianMingList:push(cardTianMing)
        end
        if cardTianMing.config.type == 27 and cardTianMing.equip == 0 then
            self.SquareTianMingNum = self.SquareTianMingNum + 1
        elseif cardTianMing.config.type == 28 and cardTianMing.equip == 0 then
            self.TriangleTianMingNum = self.TriangleTianMingNum + 1
        elseif cardTianMing.config.type == 29 and cardTianMing.equip == 0 then
            self.CircularTianMingNum = self.CircularTianMingNum + 1
        end
        if info.roleId ~= 0 then 
            local role = CardRoleManager:getRoleByGmid(info.roleId)
            if role then
                role:setTianMing(cardTianMing)
                role:updateTianMingAttr()
            end
        end
    end
end
function TianMingManager:getTianMingByGmId(gmId)
    local TianMingInfo = nil
    for _,info in ipairs(self.TianMingList.m_list) do
        if (info.instanceId == gmId) then
            TianMingInfo = info    
            return TianMingInfo
        end
    end
    return TianMingInfo
end

function TianMingManager:getTianMingList()
    return self.TianMingList
end
function TianMingManager:getEmptyTianMingList()
    return self.EmptyTianMingList
end

function TianMingManager:openTianMingListSelectLayer(Type,pos,roleId,king1,king2,kind3)
    local layer1 = AlertManager:getLayerByName("lua.logic.role_new.TianMingSelect");
    if layer1 then
        if self.pos ~= pos then
            self.pos = pos
            AlertManager:closeLayer(layer1);
            local layer =  AlertManager:addLayerByFile("lua.logic.role_new.TianMingSelect",AlertManager.BLOCK);
            local TianMingList   = self.TianMingList
            local selectList    = TFArray:new()
            for _,info in ipairs(self.TianMingList.m_list) do
                if info.config.type == Type and info.equip == 0 then
                    selectList:push(info)
                end
            end
            layer:initDate(selectList,pos,roleId,king1,king2,kind3)
            AlertManager:show();
            layer.blockUI:setTouchEnabled(false);
        else
            self.pos = 0
            layer1:moveOut()
        end
    else
        self.pos = pos
        local layer =  AlertManager:addLayerByFile("lua.logic.role_new.TianMingSelect",AlertManager.BLOCK);
        local TianMingList   = self.TianMingList
        local selectList    = TFArray:new()
        local i = 0
        for _,info in ipairs(self.TianMingList.m_list) do
            if info.config.type == Type and info.equip == 0 then
                selectList:push(info)
                i = i+1
            end
        end
        layer:initDate(selectList,pos,roleId,king1,king2,kind3)
        AlertManager:show();
        layer.blockUI:setTouchEnabled(false);
    end
end
function TianMingManager:openTianMingLayer( cardRoleGmid, cardRoleList,fightType)
    local layer =  AlertManager:addLayerByFile("lua.logic.role_new.RoleTianMingLayer")
    layer:setRoleList(cardRoleList)
    layer:loadData(cardRoleGmid,fightType)
    layer:setTouchEnabled(false)
    AlertManager:show()

end
function TianMingManager:openTianMingBagLayer()
    local layer =  AlertManager:addLayerByFile("lua.logic.role_new.TianMingBag",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    AlertManager:show()
end
function TianMingManager:openTianMingShengJiLayer(instanceId)
    local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.TianMingPanelLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE);
    layer:loadData(instanceId,self.select_type_1)
    AlertManager:show()
end
function TianMingManager:openTianMingXiangXing(instanceId)
    local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.TianMingPanelLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE);
    layer:loadData(instanceId,self.select_type_2)
    AlertManager:show()
end
function TianMingManager:openTianMingChengJiu(List)
    local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.TianMingAchievementLayer",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_NONE);
    layer:loadData(List)
    AlertManager:show()
end
function TianMingManager:openTianMingFenJie()
    local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.TianMingFenJieLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE);
    AlertManager:show()
end
function TianMingManager:openTianMingJiaChengLayer(roleId)
    local layer =  AlertManager:addLayerByFile("lua.logic.role_new.TianMingShuXingLayer",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);
    layer:loadData(roleId)
    AlertManager:show()
end
--镶星开关
function TianMingManager:isOpenTianMingStar()
    local isOpen = MainPlayer:getServerSwitchStatue(ServerSwitchType.TianMingStar)
    if isOpen == false then 
        return false;
    end
    local openLevel = FunctionOpenConfigure:getOpenLevel(2237) or 60
    if MainPlayer:getLevel() >= openLevel then  
        return true
    end
    return false
end
function TianMingManager:getTianmingNumByKindandQuality(gmId,kind,quality)
    local num = 0
    for _, info in ipairs(self.TianMingList.m_list) do
        if info.config.kind == kind and info.quality == quality and info.instanceId ~= gmId and info.equip and info.equip == 0 and info.starnum == 0 and info.starLevel == 0 and info.level == 0 then
            num = num + 1
        end
    end
    return num
end
function TianMingManager:getTianmingByKindandQuality(kind,quality)
    for _, info in ipairs(self.TianMingList.m_list) do
        if info.config.kind == kind and info.quality == quality then
           return info
        end
    end
    return nil
end
--天命分解
function TianMingManager:sendExLoadDestiny(tianminglist)
    showLoading()
    TFDirector:send(c2s.EX_LOAD_DESTINY ,{tianminglist})
end
--拆除天命
function TianMingManager:sendUpEquipDestiny(gmId,pos,roleId)
    showLoading()
    TFDirector:send(c2s.UP_EQUIP_DESTINY ,{gmId,pos,roleId})
end
--吞噬天命
function TianMingManager:sendBreachDestiny(gmId,tianminglist)
    showLoading()
    TFDirector:send(c2s.BREACH_DESTINY ,{gmId,tianminglist})
end
function TianMingManager:updateTianMingBreach(event)
    TFDirector:dispatchGlobalEventWith(TianMingManager.REPONSE_BREACH_DESTINY,{})
end
--天命镶星
function TianMingManager:updateStarLevelDestiny(event)
    hideLoading()
    local tianming = self:getTianMingByGmId(event.data.instanceId)
    tianming:setTianMingstarLevel(event.data.starLevel)
    tianming:setTianMingstarNum(event.data.star)
    tianming:updateAttr()
    if tianming.equip ~= 0 then 
        local role = CardRoleManager:getModleRoleById(tianming.equip)
        if role then
            role:setTianMing(tianming)
            role:updateTianMingAttr()
        end
    end
    TFDirector:dispatchGlobalEventWith(TianMingManager.REPONSE_STAR_LEVEL_DESTINY,{})
end
--天命删除
function TianMingManager:updateDeleteTianMingList(event)
    hideLoading()
    for k,v in pairs(event.data.instanceList) do
        local info  = self:getTianMingByGmId(v)
        if info then
            if info.config.type == 27 and info.equip == 0 then
                self.SquareTianMingNum = self.SquareTianMingNum - 1
            elseif info.config.type == 28 and info.equip == 0 then
                self.TriangleTianMingNum = self.TriangleTianMingNum - 1
            elseif info.config.type == 29 and info.equip == 0 then
                self.CircularTianMingNum = self.CircularTianMingNum - 1
            end
            self.TianMingList:removeObject(info)
        end
        self.EmptyTianMingList:removeObject(info)
    end
end
--天命一键升级
function TianMingManager:sendBreachAllDestiny(gmId,bool)
    showLoading()
    TFDirector:send(c2s.BREACH_ALL_DESTINY ,{gmId,bool})
end
--天命镶嵌
function TianMingManager:sendEquipDestiny(tianmingid,pos,roleid)
    showLoading()
    TFDirector:send(c2s.EQUIP_DESTINY ,{tianmingid , pos , roleid})
end
--天命镶星
function TianMingManager:sendStarLevelDetiny(tianmingid)
    showLoading()
    TFDirector:send(c2s.STAR_LEVEL_DESTINY ,{tianmingid})
end
function TianMingManager:updateTianMingPos(event)
    TFDirector:dispatchGlobalEventWith(TianMingManager.RefreshTianMingPos, event.data)
end

--判断天命是否可以镶星
function TianMingManager:JudgeTianMingUpgrade(tianmingId)
    for _,info in ipairs(self.TianMingList.m_list) do
        if info.instanceId == tianmingId and info.config.quality > 4 then
            local level = info.starLevel
            local star = info.starnum
            if level  < 10 then
                level = level + 1
            elseif level == 10 then
                star = star + 1
                level = 0
            end
            local cost1,cost2 =  DesTinyStarData:getConsumeByLevelandStarQuality(info.quality,level,star)
            if next(cost2) == nil and next(cost1) == nil then
                return false
            end
            if next(cost2) ~= nil then
                for i =1 ,#cost2 do
                    if cost2[i].atrrType == EnumDropType.GOODS then
                        local num = BagManager:getItemNumById(cost2[i].atrrId)
                        if num < cost2[i].atrrNum then
                            return false
                        end
                    elseif cost2[i].atrrType == EnumDropType.JINGPO then
                        local num =MainPlayer:getResValueByType(EnumDropType.JINGPO)
                        if num < cost2[i].atrrNum then
                            return false
                        end
                    end
                end
            end
            if next(cost1) ~= nil then
                local num = self:getTianmingNumByKindandQuality(info.instanceId,info.config.kind,cost1.quality)
                --天命id的获取
                local id = 30623 --废弃天命
                id  = id + (cost1.quality - 2)*27 + info.config.kind
                
                if id < 30623 then
                    id = 30624
                elseif id > 30762 then
                    id = 30762
                end
        
                local TianMing1 = ItemData:objectByID(id)
                if TianMing1 then
                    if num < cost1.num then
                        return false
                    end
                else
                    return false
                end
            end 
            return true
        end
    end
    return false
end

local function sortlistByPower(v1,v2)
    if v1.equip and v2.equip == nil then
        return true
    elseif v2.equip and v1.equip == nil then 
        return false
    end
    if v1.quality > v2.quality then
        return true;
    elseif v1.quality == v2.quality then
        if v1.level > v2.level then
            return true;
        elseif v1.level == v2.level then
            if v1.exp > v2.exp then
                return true
            end
        end
    end
end 
return TianMingManager:new()