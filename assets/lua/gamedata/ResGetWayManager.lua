--[[
******跨服个人战数据管理器*******

	-- by quanhuan
	-- 2016/4/12
	
]]

local ResGetWayData = require('lua.table.t_s_resway')
local ResGetWayInfoData = require('lua.table.t_s_resway_info')

local ResGetWayManager = class("ResGetWayManager")

function ResGetWayManager:ctor(data)
    self:restart()
end

function ResGetWayManager:restart()
end

function ResGetWayManager:openResGetLayerByList(itemList,extList)
    --itemData = {res_type = ,res_id = }
    if itemList == nil or #itemList <= 0 then
        return false
    end
    local tList = extList or {}
    local tItemList = {}
    local function tableIndex( tl,it )
        for k,v in pairs(tl) do
            if v == it then
                return true
            end
        end
        return false
    end
    for i,v in ipairs(itemList) do
        local item = self:getGetWayInfo(v)
        if item ~= nil then
            table.insert(tItemList,{res_id = item.res_id,res_type = item.res_type})
            local infoIdList = stringToNumberTable(item.way,'_')
            
            for k,v in pairs(infoIdList) do
                if tableIndex(tList,v) == false then
                    local info = ResGetWayInfoData:objectByID(v)
                    local isLock = self:judgeGetWayIsLock(info,item)
                    if isLock == true then
                        table.insert(tList,v)
                    end
                end
            end
        end
    end
    local function sortIdList( id1,id2 )
        return id1 < id2
    end
    table.sort(tList,sortIdList)
    print("tList = ",tList)
    return self:openListShow(tList,tItemList)
end

function ResGetWayManager:openResGetLayer(res_id,res_type,extList)
    --itemData = {res_type = ,res_id = }
    print("itemData = ",itemData)
    local item = self:getGetWayInfo({res_id,res_type})
    if item == nil and (extList == nil or #extList == 0) then
        return false
    end
    local infoIdList = {}
    if item then
        infoIdList = stringToNumberTable(item.way,'_')
    end
    local tList = extList or {}
    for k,v in pairs(infoIdList) do
        local info = ResGetWayInfoData:objectByID(v)
        local isLock = self:judgeGetWayIsLock(info,item)
        if isLock == true then
            table.insert(tList,v)
        end
    end
    
    local function sortIdList( id1,id2 )
        return id1 < id2
    end
    table.sort(tList,sortIdList)
    print("tList = ",tList)
    return self:openListShow(tList,{{res_id = res_id,res_type = res_type}})
end

function ResGetWayManager:openListShow(infoIdList,wayDataList)
    if #infoIdList <= 0 then
        return false
    end

    if wayDataList and #wayDataList == 1 and #infoIdList == 1 then
        local wayInfo = ResGetWayInfoData:objectByID(infoIdList[1])
        if wayInfo.type == EnumResGetWayType.SHOP then
            local isOpen,shopInfo = self:judgeShopGetWay(wayInfo,wayDataList[1])
            if isOpen == true and shopInfo then
                if wayInfo.kind == EnumResGetShopType.Gift then
                    MallManager:openShoppingLayer(shopInfo.id)
                    return true
                elseif shopInfo:getNumber() > 0 then
                    MallManager:openRandomStoreShoppingLayer(wayInfo.kind,shopInfo)
                    return true
                end
                return false
            else
                return false
            end
        end
    end

    local layer  = AlertManager:addLayerByFile("lua.logic.common.ResGetWayLayer",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:setWayList(infoIdList)
    AlertManager:show()
    return true
end

function ResGetWayManager:getGetWayInfo( itemData )
    for v in ResGetWayData:iterator() do
        if v.res_type == itemData[2] and v.res_id == itemData[1] then
            return v
        end
    end
end

function ResGetWayManager:getInfoDataById( infoId )
    local info = ResGetWayInfoData:objectByID(infoId)
    return info
end

--------------------------------------------------------judge---------------------------------------
function ResGetWayManager:judgeShopGetWay(wayInfo,wayData)
    local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(106)
    if teamLev < openLev then
        return false,nil
    end
    if wayInfo.kind < 50 then
        return self:judgeRandomShopGetWay(wayInfo,wayData)
    else
        return self:judgeGiftShopGetWay(wayInfo,wayData)
    end 
end

function ResGetWayManager:judgeGiftShopGetWay( wayInfo,wayData )
    local shopInfo = MallManager:getShopByData(wayData,2)
    if shopInfo then
        return true,shopInfo
    end
end

function ResGetWayManager:judgeRandomShopGetWay( wayInfo,wayData )
    local teamLev = MainPlayer:getLevel()

    local randomStore = MallManager:getrandomStoreTable()
    if randomStore[wayInfo.kind]:isOpen() == false then
        return false,nil
    end

    if wayInfo.kind == EnumResGetShopType.QunHao then

        local openLev = FunctionOpenConfigure:getOpenLevel(301)
        if teamLev < openLev then
            return false,nil
        end

    elseif wayInfo.kind == RandomStoreType.Role then

        local openLev = FunctionOpenConfigure:getOpenLevel(2201)
        if teamLev < openLev then
            return false,nil
        end

    elseif wayInfo.kind == RandomStoreType.Gang_Normal or
            wayInfo.kind == RandomStoreType.Gang_2 or
            wayInfo.kind == RandomStoreType.Gang_3 then

        local openLevel = FactionManager:getShopOpenLevel()
        if openLevel == 0 then
            return false,nil
        elseif FactionManager.factionInfo == nil or FactionManager.factionInfo.level == nil or FactionManager.factionInfo.level < openLevel then
            return false,nil
        end

    elseif wayInfo.kind == RandomStoreType.Honor or
            wayInfo.kind == RandomStoreType.Honor_2 then

        if MultiServerFightManager:getActivityState() == 0 or MultiServerFightManager:getActivityState() == nil then
            return false,nil
        end

    elseif wayInfo.kind == RandomStoreType.Xiling1 or
            wayInfo.kind == RandomStoreType.Xiling2 then

        if WestClimbManager:getIsOpen() == false then
            return false,nil
        end
    end
    local itemlist = randomStore[wayInfo.kind]:getCommodityList()
    if wayData.res_id ~= 0 then
        for k,v in pairs(itemlist) do
            local goods_id = v:getShopEntry().goods_id
            if goods_id == wayData.res_id then
                return true, v
            end
        end
    end
    return false,nil
end

function ResGetWayManager:judgeMissionGetWay( wayInfo )
    
    return MissionManager:getMissionIsOpen(wayInfo.kind)

end

--------------mf
function ResGetWayManager:judgeGetWayIsLock( wayInfo, wayData )
    if wayInfo.type == EnumResGetWayType.SHOP then

        return self:judgeShopGetWay(wayInfo,wayData)

    elseif wayInfo.type == EnumResGetWayType.PVE then

        return self:judgeMissionGetWay(wayInfo)

    elseif wayInfo.type == EnumResGetWayType.MOHEYA then

        local teamLev = MainPlayer:getLevel()
        local openLev = FunctionOpenConfigure:getOpenLevel(601)
        if teamLev < openLev then
            return false
        else
            return true
        end

    elseif wayInfo.type == EnumResGetWayType.MINE then

        local teamLev = MainPlayer:getLevel()
        local openLev = FunctionOpenConfigure:getOpenLevel(2101)
        if teamLev < openLev then
            return false
        else
            return true
        end

    elseif wayInfo.type == EnumResGetWayType.ADVENTURE then

        local openLevel = FunctionOpenConfigure:getOpenLevel(2203)
        local currLevel = MainPlayer:getLevel()
        if currLevel < openLevel then
            return false
        else
            return true
        end

    elseif wayInfo.type == EnumResGetWayType.CLIMB then

        local openLevel = FunctionOpenConfigure:getOpenLevel(401)
        local currLevel = MainPlayer:getLevel()
        if currLevel < openLevel then
            return false
        else
            return true
        end

    elseif wayInfo.type == EnumResGetWayType.CLIMB_NORTH then

        local openLevel = FunctionOpenConfigure:getOpenLevel(401)
        local currLevel = MainPlayer:getLevel()
        if currLevel < openLevel then
            return false
        end
        local needLevelIndex = ConstantData:getValue("North.Cave.Open.Floor");
        if ClimbManager:getClimbFloorNum() < needLevelIndex then
            return false
        else
            return true
        end

    elseif wayInfo.type == EnumResGetWayType.CROSS_ARRAY then

        local openLevel = FunctionOpenConfigure:getOpenLevel(2214)
        local currLevel = MainPlayer:getLevel()
        if currLevel < openLevel then
            return false
        else
            return true
        end

    elseif wayInfo.type == EnumResGetWayType.RECRUIT then

        return true

    end
    return false
end
----------------------------------------------------jump-------------------------------------------------------------

function ResGetWayManager:openGetWay( id )
    local wayInfo = self:getInfoDataById(id)

    if wayInfo.type == EnumResGetWayType.SHOP then

        self:jumpToShop(wayInfo)

    elseif wayInfo.type == EnumResGetWayType.PVE then

        MissionManager:showHomeToMissionLayer(wayInfo.kind)

    elseif wayInfo.type == EnumResGetWayType.MOHEYA then

        ClimbManager:showCarbonListLayer()

    elseif wayInfo.type == EnumResGetWayType.MINE then

        MiningManager:requestMiningInfo()

    elseif wayInfo.type == EnumResGetWayType.ADVENTURE then

        AdventureManager:openHomeLayer()

    elseif wayInfo.type == EnumResGetWayType.CLIMB then

        ClimbManager:showMountainLayer();

    elseif wayInfo.type == EnumResGetWayType.CLIMB_NORTH then

        NorthClimbManager:showNorthMountainLayer();

    elseif wayInfo.type == EnumResGetWayType.CROSS_ARRAY then

        ChuangzhenManager:openMainLayer(true)

    elseif wayInfo.type == EnumResGetWayType.RECRUIT then

        MallManager:openRecruitLayer()

    end
end

function ResGetWayManager:jumpToShop( wayInfo )

    if wayInfo.kind == EnumResGetShopType.Normal then

        MallManager:openMallLayerByType(EnumMallType.NormalMall,3)

    elseif wayInfo.kind == EnumResGetShopType.QunHao then

        MallManager:openMallLayerByType(EnumMallType.QunHaoMall,1)

    elseif wayInfo.kind == EnumResGetShopType.Xiyou then

        MallManager:openMallLayerByType(EnumMallType.NormalMall,4)

    elseif wayInfo.kind == EnumResGetShopType.Zhenbao then

        MallManager:openMallLayerByType(EnumMallType.NormalMall,5)

    elseif wayInfo.kind == EnumResGetShopType.Role then

        MallManager:openMallLayerByType(EnumMallType.CardRoleMall,1)

    elseif wayInfo.kind == EnumResGetShopType.Gang_Normal then

        MallManager:openMallLayerByType(EnumMallType.FactionMall,1)

    elseif wayInfo.kind == EnumResGetShopType.Gang_2 then

        MallManager:openMallLayerByType(EnumMallType.FactionMall,2)

    elseif wayInfo.kind == EnumResGetShopType.Gang_3 then

        MallManager:openMallLayerByType(EnumMallType.FactionMall,3)

    elseif wayInfo.kind == EnumResGetShopType.Honor then

        MallManager:openMallLayerByType(EnumMallType.HonorMall,1)

    elseif wayInfo.kind == EnumResGetShopType.Honor_2 then
        
        MallManager:openMallLayerByType(EnumMallType.HonorMall,2)

    elseif wayInfo.kind == EnumResGetShopType.Xiling1 then

        MallManager:openMallLayerByType(EnumMallType.XilingMall,1)
        
    elseif wayInfo.kind == EnumResGetShopType.Xiling2 then
        
        MallManager:openMallLayerByType(EnumMallType.XilingMall,2)

    elseif wayInfo.kind == EnumResGetShopType.Gift then
        
        MallManager:openMallLayerByType(EnumMallType.NormalMall,2)

    end
end

return ResGetWayManager:new()