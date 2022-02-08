--[[
 * @Author: crb 
 * @Date: 2017-09-07 11:19:43 
 * @Description: 游历挖宝数据管理
 ]]

local AdventureTreasureManager = class("AdventureTreasureManager") 

AdventureTreasureManager.Event_UpdateAllTreasure = "AdventureTreasureManager.Event_UpdateAllTreasure"
AdventureTreasureManager.Event_DigTreasureData = "AdventureTreasureManager.Event_DigTreasureData"
AdventureTreasureManager.Event_BuryTreasureData = "AdventureTreasureManager.Event_BuryTreasureData"


function AdventureTreasureManager:ctor( ... )
    -- 挖宝
    TFDirector:addProto(s2c.DIG_TREASURE, self, self.onDigTreasureData)
    --挖宝历史
    TFDirector:addProto(s2c.DIG_HISTORY, self, self.onGetDigRecord)
    -- 挖过的宝箱数据
    TFDirector:addProto(s2c.REFRESH_DIG_HISTORY, self, self.onGetDigBoxData)   

    -- 背包中宝箱的数据
    TFDirector:addProto(s2c.TREASURE_BAG, self, self.onGetMyBoxList)
    -- 我埋的宝箱数据
    TFDirector:addProto(s2c.HAS_BURIED, self, self.onUpdateAllMyBoxInfo)
    -- 埋宝
    TFDirector:addProto(s2c.BURIED_TREASURE, self, self.getBurySuccess)
    --埋宝记录
    TFDirector:addProto(s2c.BURIED_HISTORY, self, self.onGetBuryRecord)

    --历史或者记录里的宝箱详细数据
    TFDirector:addProto(s2c.TREASURE_DETAILS, self, self.onGetBoxRecord)
    -- 地图宝藏数据刷新
    TFDirector:addProto(s2c.ALL_TREASURE_INFO, self, self.onUpdateAllTreasureInfo)
    -- 挖宝埋宝红点的显示
    TFDirector:addProto(s2c.SEND_RED_POINT, self, self.onGetDigAndBuryRedPoint)

    self.TreasureState = 0
    self.addDataCnt = nil;
    self.digTreasure = false 
    self.buriedTreasure = false
end
function AdventureTreasureManager:restart()
    -- self.TreasureState = 0
    -- self.addDataCnt = nil;
    -- self.digTreasure = false 
    -- self.buriedTreasure = false
end

-- 切换界面协议处理
function AdventureTreasureManager:changeToBuryLayerOrDigLayer( flag ,MapIndex)
    self.TreasureState = flag 
    local tHeadOnMapIndex = MapIndex 
    if self.TreasureState == 1 then
        self.addDataCnt = 0;
        -- 请求挖宝初始化数据
        self:requestDigStartTreasure( tHeadOnMapIndex )
        -- 请求我埋的宝箱数据
        self:requestMyBoxTreasure()
        -- 请求我的挖过的宝箱数据
        self:requestDigBoxDate()
    elseif self.TreasureState == 2 then
        self.addDataCnt = 0;
        -- 请求我背包的宝箱数据
        self:requestMyBoxListTreasure()
        -- 请求我埋的宝箱数据
        self:requestMyBoxTreasure()
    end
end
-- 切换界面等待数据处理
function AdventureTreasureManager:waitForData()
    if self.addDataCnt then
        if self.addDataCnt == 0 then
            self.addDataCnt = 1
        elseif self.addDataCnt >= 1 then
            
            if self.TreasureState == 1 then
                if self.addDataCnt >= 2 then
                    self.addDataCnt = nil;
                    local layer = AlertManager:getLayerByName("lua.logic.youli.AdventureHomeLayer")
                    if layer then
	                    layer:waitForDataOnDigUI(self.digStartData);
                    end
                else
                    self.addDataCnt = 2
                end
            elseif self.TreasureState == 2 then
                self.addDataCnt = nil;
                local layer = AlertManager:getLayerByName("lua.logic.youli.AdventureHomeLayer")
                if layer then
	                layer:waitForDataOnBuryUI();
                end
                
            end
        end
    end
end

function AdventureTreasureManager:getMyBagBoxList(  )
    return self.myBagBoxList
end

function AdventureTreasureManager:onUpdateAllTreasureInfo( event )
    hideLoading()
    self.digStartData = event.data
    self:waitForData()
    -- TFDirector:dispatchGlobalEventWith(AdventureTreasureManager.Event_UpdateAllTreasure)
end

function AdventureTreasureManager:onDigTreasureData( event )
    hideLoading()
    -- print("---------onDigTreasureData:event.data----------------",event.data)
    local layer = AlertManager:getLayerByName("lua.logic.youli.AdventureHomeLayer")
	layer:digAnimation(event.data);

    -- TFDirector:dispatchGlobalEventWith(AdventureTreasureManager.Event_DigTreasureData)
end

-- 请求背包中宝箱的数据
function AdventureTreasureManager:requestMyBoxListTreasure()
    showLoading()
    TFDirector:send(c2s.TREASURE_BAG, {})
end

-- 获取背包中宝箱的数据
function AdventureTreasureManager:onGetMyBoxList( event )
    hideLoading()
    -- print("AdventureTreasureManager:onGetMyBoxList( event )",event.data)
    self.myBagBoxList = event.data.holdTreasure
    self:waitForData()
end


-- 请求我埋的宝箱数据
function AdventureTreasureManager:requestMyBoxTreasure()
    showLoading()
    TFDirector:send(c2s.HAS_BURIED, {})
end

-- 我埋的宝箱列表回复处理
function AdventureTreasureManager:onUpdateAllMyBoxInfo(event)
    hideLoading()
    -- print("-----------------onUpdateAllMyBoxInfo:event.data------------------------",event.data)
    self.myBuryBoxList = event.data.info;
    self:waitForData()    
end

-- 获取我埋的宝箱接口
function AdventureTreasureManager:getMyBuryBoxList()
    return self.myBuryBoxList;
end

-- 请求埋宝
function AdventureTreasureManager:requestBuryTreasure( tPos, showFlag, itemId )
    showLoading()
    TFDirector:send(c2s.BURIED_TREASURE, {tPos.y, tPos.x,showFlag ,itemId})
end

-- 埋宝回复处理
function AdventureTreasureManager:getBurySuccess( event )
    hideLoading()
    local layer = AlertManager:getLayerByName("lua.logic.youli.AdventureHomeLayer")
	layer:burySuccess();
end

-- 请求初始化挖宝界面
function AdventureTreasureManager:requestDigStartTreasure( tPos )
    showLoading()
    TFDirector:send(c2s.ALL_TREASURE_INFO, {tPos.y, tPos.x}) 
    -- self:onDigTreasureData()
end

-- 请求挖宝
function AdventureTreasureManager:requestDigTreasure( tPos )
    showLoading()
    -- print("AdventureTreasureManager:requestDigTreasure:", tPos)
    
    TFDirector:send(c2s.DIG_TREASURE, {tPos.y, tPos.x}) 
    -- self:onDigTreasureData()
end

-- 请求获得挖过的宝箱数据
function AdventureTreasureManager:requestDigBoxDate()
    showLoading()
    TFDirector:send(c2s.REFRESH_DIG_HISTORY, {})
    -- self.onGetDigRecord()
end

-- 获得挖过的宝箱数据
function AdventureTreasureManager:onGetDigBoxData(event)
    hideLoading()
    -- print("-----------------onGetDigBoxData:event.data--------------------",event.data)
    self.myDigBoxList = event.data.digHistory
    self:waitForData() 
end

-- 获取我埋的宝箱接口
function AdventureTreasureManager:getMyDigBoxList()
    return self.myDigBoxList;
end

-- 请求获得挖宝历史
function AdventureTreasureManager:requestDigRecord()
    showLoading()
    TFDirector:send(c2s.DIG_HISTORY, {})
    -- self.onGetDigRecord()
end

-- 获得挖宝历史，打开挖宝历史界面
function AdventureTreasureManager:onGetDigRecord(event)
    hideLoading()
    -- print("------AdventureTreasureManager:onGetDigRecord(event):event.data-----------",event.data)
    local layer = require("lua.logic.youli.WaBaoRecordLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:setInfo(event.data)
    AlertManager:show()
end


-- 请求获得埋宝记录
function AdventureTreasureManager:requestBuryRecord()
    showLoading()
    TFDirector:send(c2s.BURIED_HISTORY, {})
end

-- 获得埋宝记录，打开埋宝记录界面
function AdventureTreasureManager:onGetBuryRecord(event)
    hideLoading()
    -- print("------AdventureTreasureManager:onGetBuryRecord(event):event.data-----------",event.data)
    local layer = require("lua.logic.youli.MaiBaoRecordLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:setInfo(event.data)
    AlertManager:show()
end

-- 请求获得埋宝或挖宝的宝箱详情记录
function AdventureTreasureManager:requestBoxRecord(Index)
    showLoading()
    TFDirector:send(c2s.TREASURE_DETAILS, {Index})
    -- self.onGetBoxRecord()
end

-- 获得埋宝记录，打开埋宝记录界面
function AdventureTreasureManager:onGetBoxRecord(event)
    hideLoading()
    -- print("------AdventureTreasureManager:onGetBoxRecord(event):event.data-----------",event.data)
    local layer = require("lua.logic.youli.WaBaoRecordXiangLayer"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
    layer:setInfo(event.data)
    AlertManager:show()
end

-- 挖宝和埋宝的红点显示
function AdventureTreasureManager:onGetDigAndBuryRedPoint(event)
    hideLoading()
    local data = event.data
    -- print("---------------onGetDigAndBuryRedPoint:data---------------",data)
    if data.digTreasure == 1 then
        self.digTreasure = true
    end
    if data.buriedTreasure == 1 then
        self.buriedTreasure = true
    end
end

-- 获得挖宝红点状态
function AdventureTreasureManager:GetDigRedPoint()
    return self.digTreasure
end

-- 设置挖宝红点状态
function AdventureTreasureManager:setDigRedPoint(flag)
    if flag then
        self.digTreasure = true 
    else   
        self.digTreasure = false 
    end
end

-- 获得埋宝红点状态
function AdventureTreasureManager:GetBuryRedPoint()
    return self.buriedTreasure
end

-- 设置埋宝红点状态
function AdventureTreasureManager:setBuryRedPoint(flag)
    if flag then
        self.buriedTreasure = true
    else
        self.buriedTreasure = false
    end
end

return AdventureTreasureManager:new()
