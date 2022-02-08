local DownResourceManager = class("DownResourceManager")

DownResourceManager.UpdataButtonState  = "DownResourceManager.UpdataButtonState";
DownResourceManager.UpdataNetWork  = "DownResourceManager.UpdataNetWork";
DownResourceManager.AutoPauseEvent  = "DownResourceManager.AutoPauseEvent";
DownResourceManager.AutoDownEvent  = "DownResourceManager.AutoDownEvent";

function DownResourceManager:ctor()   
    self.downState = {}

    for i=1,3 do
        self.downState[i] = 0
    end
    self.ids ={}  --任务完成的ids
    self.awardStatus ={0,0,0}
    self.awardList ={201,202,203}
    self.awardListConfig = require("lua.table.t_s_download_bonus")
    self.isShowBtn = true
    --wifi自动下载
    self.wifiDown = true
    --
    --下载模式 0未下载 1手动 2自动
    self.downMode ={0,0,0} 

    self.NetType = "NO"


    local awardList = require("lua.table.t_s_download_bonus")
    local awardStatus = self:getAwardStatus()
    self.newConfigList = {}
    for k,v in pairs(self.awardStatus) do
        if v == 0 then
            table.insert(self.newConfigList, awardList:objectAt(k))
        end  
    end

    --领取状态
    TFDirector:addProto(s2c.GOIN_DOWN_LOAD_RESPONSE, self, self.onConfigCallBack)
    --点击领取回调状态
    TFDirector:addProto(s2c.DOWN_STATUS_RESPONSE, self, self.onClickCallBack)
    if TFPlugins.isCompletePack == nil or TFPlugins.isCompletePack == true then
        return
    end
    
    self.testTimer = TFDirector:addTimer(1000, -1, nil,
        function()
            if self.testType == "WIFI" then
                self.testType = "NO"
            else
                self.testType = "WIFI"
            end
        end)

    self.updateNetWork = TFDirector:addTimer(1000, -1, nil,
        function()
            self:updateNetWorkState()
        end)
end

function DownResourceManager:openDownLayer()
    --每次打开界面 都先刷新下进度。
    TFDirector:send(c2s.GOIN_DOWN_LOAD_REQUEST, {} )
    local layer = require("lua.logic.main.ResourceDown"):new()
    self.layer = layer
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()   
end

--[[
resourceType
1.后续界面
2.角色资源
3.技能特效
]]
function DownResourceManager:getDownSize(resourceType)
    local size = 50
    return size
end

function DownResourceManager:getDownProcess(resourceType)

    local process = 50

    return process
end

function DownResourceManager:getDownAward(resourceType)
    
end

function DownResourceManager:getAwardStatus()
    --status  1  已领取
    --        0  未领取
    for i=1,#self.ids do
        local v = self.ids[i]
        self.awardStatus[v] = 1
    end

    return self.awardStatus
end


function DownResourceManager:getIds()
    return self.ids
end


function DownResourceManager:getAward(index)
    --status  1  已领取
    --        0  未领取
    --self.awardStatus[index] = 1

    --showLoading()
    TFDirector:send(c2s.DOWN_STATUS_REQUEST, {index} )
end

function DownResourceManager:getAwardList()

    self.awardStatus[index] = 1
end



function DownResourceManager:DownloadPackage(index,auto)
       --print("downBtnClickHandle")
    local function downloadPackageCallback(name, state)     
        for i = 1, table.getn(PackageManager.packageList) do
            if PackageManager.packageList[i].name == name then
                PackageManager.packageList[i].state = state
                self:updateMainBtn()
                TFDirector:dispatchGlobalEventWith(DownResourceManager.UpdataButtonState) 
            end
        end

        if self.wifiDown then
            self:autoDown()
        end
    end
    local downPackageName = PackageManager.packageList[index].name;
    PackageManager:DownloadPackage(downPackageName, downloadPackageCallback)

    self.downState[index] = 1
    if auto then 
        self.downMode[index] = 2

        -- if self.updateNetWork then
        --     TFDirector:removeTimer(self.updateNetWork)
        --     self.updateNetWork= nil
        -- end 
    else
        self.downMode[index] = 1
    end
end


function DownResourceManager:autoDown()
    local flag = true

    for i=1,#self.newConfigList do
        local task_id = self.newConfigList[i].task_id

        local downState = self.downState[task_id]
        if downState ~= 1 then
            flag = false
        end
    end

    if flag then
        return
    end

    for i=1,#self.newConfigList do
        local task_id = self.newConfigList[i].task_id
        local state = PackageManager.packageList[task_id].state 

        local downState = self.downState[task_id]
        if state ~= 1 and state ~=2  and downState ~= 1 then
            self:DownloadPackage(task_id, true)
            TFDirector:dispatchGlobalEventWith(DownResourceManager.AutoDownEvent, i)
            break
        end
    end
end

function DownResourceManager:autoPause()
    for i=1,#self.newConfigList do
        local task_id = self.newConfigList[i].task_id
        print("richard downMode:", self.downMode[task_id])
        if self.downState[task_id] == 1 then      
            self:PauseDownload(task_id)
            TFDirector:dispatchGlobalEventWith(DownResourceManager.AutoPauseEvent, i)
        end
    end
end

function DownResourceManager:updateNetWorkState()
    if self.wifiDown == true then
        
        local Net =  TFDeviceInfo:getNetWorkType()
        -- local Net = self.testType
        print("richard NetType:", Net)

        if Net ~= self.NetType and Net == "WIFI" then
            self:autoDown()
            TFDirector:dispatchGlobalEventWith(self.UpdataNetWork, "WIFI")
        elseif Net ~= self.NetType and self.NetType == "WIFI" then
            self:autoPause()
            TFDirector:dispatchGlobalEventWith(self.UpdataNetWork, "NOTWIFI")
        end

        self.NetType = Net       
    end
end


function DownResourceManager:PauseDownload(index)
    self.downState[index] = 0
    self.downMode[index] = 0
    PackageManager:PauseDownload(index)
end


function DownResourceManager:onConfigCallBack(event)
    hideLoading()
    --local data = event.data
    if event.data.ids then 
        self.ids =  event.data.ids
    end
    self:updateMainBtn()
    TFDirector:dispatchGlobalEventWith(self.UpdataButtonState, nil);
end

function DownResourceManager:onClickCallBack(event)
    -- body
    hideLoading()
    local data = event.data.dropId
    --self.awardList:objectAt(index)
    for i=1,self.awardListConfig:length() do
        local info = self.awardListConfig:objectAt(i)
        if info.drop_id == data then
            self.awardStatus[i] = 1
        end    
    end
    self:updateMainBtn()
    TFDirector:dispatchGlobalEventWith(self.UpdataButtonState, nil);
end

function DownResourceManager:needShowLayerForce()
    if TFPlugins.isCompletePack then
        return false
    end
    for k,v in pairs(PackageManager.packageList) do
        if v.state ~= 1 and v.state ~= 2 then
            return true
        end
    end
    return false
end

--更新主界面按钮是否显示
function DownResourceManager:updateMainBtn()
    local bShow = true
     --全部下载完成
    local bDown = true
          
    for k,v in pairs(PackageManager.packageList) do
        
        if v.state ~= 1 and v.state ~= 2 then
            bDown = false
        end
    end
    
    --是否领取奖励
    local idsCount = 0
    local awardStatus = self:getAwardStatus()
    for k,v in pairs(awardStatus) do        
        if v == 1 then 
            idsCount = idsCount + 1
        end
    end    
    --self.awardStatus 

    if idsCount >= 3 and bDown then
        bShow = false
    end

    local awardList = require("lua.table.t_s_download_bonus")
    --local awardStatus = self:getAwardStatus()
    self.newConfigList = {}
    -- for k,v in pairs(self.awardStatus) do
    --     local  state = PackageManager.packageList[k].state
    --     if v == 0 or( state~= 1 and state ~= 2) then
    --         table.insert(self.newConfigList, awardList:objectAt(k))
    --     end  
    -- end

    self.isShowBtn = bShow

    --[[
    if self.isShowBtn == false then 
        print("Manage----------------------------------Close")
        AlertManager:closeLayer(self.layer)
        --AlertManager:closeLayerByName("lua.logic.main.ResourceDown")
        -- AlertManager:close()
    end 
    ]]
end


return DownResourceManager:new();