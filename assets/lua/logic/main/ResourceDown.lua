
local ResourceDown = class("ResourceDown", BaseLayer);


function ResourceDown:ctor(data)
    self.super.ctor(self,data);

    self.updatePro = {}
    self.awardStatus = {}
    self.awardList = require("lua.table.t_s_download_bonus")
    self:init("lua.uiconfig_mango_new.main.ResourseDown");
end

function ResourceDown:initUI(ui)
    self.super.initUI(self,ui);
    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_kaiguan = TFDirector:getChildByPath(ui, 'btn_kaiguan')

    self.img_resourebg ={}
    self.btn_iconbg ={}
    self.btn_get ={}
    for i=1,3 do
        self.img_resourebg[i] = {}
        local img_resourebg = TFDirector:getChildByPath(ui, 'img_resourebg'..i)  
        self.img_resourebg[i].img_resourebg = img_resourebg
        self.img_resourebg[i].bar_downing = TFDirector:getChildByPath(img_resourebg, 'bar_downing')  
        
        self.img_resourebg[i].txt_resourename = TFDirector:getChildByPath(img_resourebg, 'txt_resourename')  
        self.img_resourebg[i].txt_resourename:setText("resource"..i)
        self.img_resourebg[i].txt_shuoming = TFDirector:getChildByPath(img_resourebg, 'txt_shuoming')  
        self.img_resourebg[i].btn_down = TFDirector:getChildByPath(img_resourebg, 'btn_down')  
        --下载中
        self.img_resourebg[i].btn_pause = TFDirector:getChildByPath(img_resourebg, 'btn_pause')  
        --下载完成
        self.img_resourebg[i].btn_downed = TFDirector:getChildByPath(img_resourebg, 'btn_downed')  
        --icon
        self.btn_iconbg[i] ={}  
        self.btn_iconbg[i].bg = TFDirector:getChildByPath(ui, 'btn_iconbg'..i)        
        self.btn_iconbg[i].icon = TFDirector:getChildByPath(self.btn_iconbg[i].bg, 'img_icon')        
        --领取按钮
        self.btn_get[i] = TFDirector:getChildByPath(ui, 'btn_get'..i)  
    end
 
end


function ResourceDown:refreshUI()
    -- body
    self.awardStatus = DownResourceManager:getAwardStatus()
    --1
    for i=1,#self.awardStatus do
        print(i)
    end
end


function ResourceDown:onShow()
    self.super.onShow(self)
end


function ResourceDown:removeUI()
   self.super.removeUI(self);
end

--注册事件
function ResourceDown:registerEvents()
    self.super.registerEvents(self);
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClose))

    for k,v in pairs(self.img_resourebg) do
        v.btn_down:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnDown))
        v.btn_down.logic = self
        v.btn_down.index = k      

        v.btn_pause:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnPause))
        v.btn_pause.logic = self
        v.btn_pause.index = k      

    end

    --self.btn_get[i]
    
    for k,v in pairs(self.btn_get) do
        
        v:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnGetAward))
        v.logic = self
        v.index = k      
    end

    for k,v in pairs(self.btn_iconbg) do
        v.bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnShowAward))
        v.bg.logic = self
        v.bg.index = k   
    end

    self.btn_kaiguan.logic=self;
    self.btn_kaiguan:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onBtnKaiGuan),1);
    
    if DownResourceManager.wifiDown ==  false then 
        self.btn_kaiguan:setTextureNormal("ui_new/setting/guan.png")
    else
        self.btn_kaiguan:setTextureNormal("ui_new/setting/kai.png")
        
    end


    self.UpdataButtonState = function()
        self:updateButtonStatus()
    end
    TFDirector:addMEGlobalListener(DownResourceManager.UpdataButtonState,self.UpdataButtonState)

    -- self.updateNetWork = function(event)

    --     print("richard event:", event)
    --     self:updateNetWorkState(event.data[1])
    -- end
    -- TFDirector:addMEGlobalListener(DownResourceManager.UpdataNetWork,self.updateNetWork)



    self.AutoPause = function(event)
        self:pauseAutoDown(event.data[1])
    end
    TFDirector:addMEGlobalListener(DownResourceManager.AutoPauseEvent, self.AutoPause)


    self.AutoDown = function(event)
        self:autoDown(event.data[1])
    end
    TFDirector:addMEGlobalListener(DownResourceManager.AutoDownEvent, self.AutoDown)
end

-- function ResourceDown:updateNetWorkState(state)

--     print("self：", self, "richard ResourceDown:updateNetWorkState:", state)
--     if state == "WIFI" then
--         self:autoDown()
--     else
--         -- self:pauseAutoDown()
--     end

--     -- local Net =  TFDeviceInfo:getNetWorkType() --非WIFI  暂停下载
--     -- if not Net or Net ~= "WIFI" then 
--     --     self:pauseAutoDown()
--     -- elseif Net and  Net == "WIFI" then  --
--     --     self:autoDown()
--     -- end

--  end


 function ResourceDown:pauseAutoDown(index)
    --  for i=1,#DownResourceManager.newConfigList do
    --         local task_id = DownResourceManager.newConfigList[i].task_id
    --         if DownResourceManager.downMode[task_id] == 2 then   
    --             local btn_index = i      
    --             DownResourceManager:PauseDownload(task_id)
    --             if self.updatePro[btn_index] then
    --                 TFDirector:removeTimer(self.updatePro[btn_index])
    --                 self.updatePro[btn_index] = nil
    --             end

    --             self:setDownStatus(btn_index)
    --         end
    -- end 

    print("richard ResourceDown:pauseAutoDown index：", index)
        -- for i=1,#DownResourceManager.newConfigList do
            local task_id = DownResourceManager.newConfigList[index].task_id
           -- if DownResourceManager.downMode[task_id] == 2 then   
                local btn_index = index      
                if self.updatePro[btn_index] then
                    TFDirector:removeTimer(self.updatePro[btn_index])
                    self.updatePro[btn_index] = nil
                end

                self:setDownStatus(index)
            --end
        -- end
    

 end

function ResourceDown:autoDown(index)
    -- for i=1,#DownResourceManager.newConfigList do
        local task_id = DownResourceManager.newConfigList[index].task_id

        local btn_index = index
        local state = PackageManager.packageList[task_id].state 
        local downState = DownResourceManager.downState[task_id]

        -- if state ~= 1 and state ~=2  and downState == 1 then
            self:setPercent(btn_index)
            self.img_resourebg[btn_index].txt_shuoming:setVisible(true)
            self.img_resourebg[btn_index].btn_down:setVisible(false)  
            self.img_resourebg[btn_index].btn_pause:setVisible(true)

            if self.updatePro[btn_index] then
                TFDirector:removeTimer(self.updatePro[btn_index])
                self.updatePro[btn_index] = nil
            end 

            self.updatePro[btn_index] = TFDirector:addTimer(100, -1, nil,
            function()
                print("update Progress")
                self:updateProcess(btn_index)
            end
            )
        -- end
    -- end
end



function ResourceDown:removeEvents()
    self.super.removeEvents(self);
    TFDirector:removeMEGlobalListener(DownResourceManager.UpdataButtonState,self.UpdataButtonState)
    TFDirector:removeMEGlobalListener(DownResourceManager.UpdataNetWork,self.updateNetWork)
    TFDirector:removeMEGlobalListener(DownResourceManager.AutoPauseEvent, self.AutoPause)
    TFDirector:removeMEGlobalListener(DownResourceManager.AutoDownEvent, self.AutoDown)

    for i=1,3 do
        if self.updatePro[i] then
            TFDirector:removeTimer(self.updatePro[i])
            print("removeEvents"..i)
            self.updatePro[i] = nil
        end
    end
    
end


function ResourceDown.onBtnClose()
    AlertManager:close();
end

function ResourceDown.onBtnKaiGuan(sender)
    local self = sender.logic

    if DownResourceManager.wifiDown then  
        DownResourceManager.wifiDown = false
        self.btn_kaiguan:setTextureNormal("ui_new/setting/guan.png") --关闭下载

        DownResourceManager:autoPause()
        -- self:pauseAutoDown()
    else
        DownResourceManager.wifiDown = true
        self.btn_kaiguan:setTextureNormal("ui_new/setting/kai.png")

        local Net = DownResourceManager.NetType
        print("richard net：", Net)
        if Net and Net == "WIFI" then 
            DownResourceManager:autoDown()
        end        
    end
end





function ResourceDown.onBtnDown(sender)
    -- body
    local self = sender.logic   
    local btn_index = sender.index
    local index = DownResourceManager.newConfigList[btn_index].task_id 

    DownResourceManager:DownloadPackage(index,false)

    self:setPercent(btn_index)
    self.img_resourebg[btn_index].txt_shuoming:setVisible(true)
    self.img_resourebg[btn_index].btn_down:setVisible(false)  
    self.img_resourebg[btn_index].btn_pause:setVisible(true)

    if self.updatePro[btn_index] then
        TFDirector:removeTimer(self.updatePro[btn_index])
        self.updatePro[btn_index] = nil
    end 

    self.updatePro[btn_index] = TFDirector:addTimer(100, -1, nil,
    function()
        self:updateProcess(btn_index)
    end
    )
end

function ResourceDown.onBtnPause(sender)
    -- body
    local self = sender.logic   
    local btn_index = sender.index
    local index = DownResourceManager.newConfigList[btn_index].task_id 

    DownResourceManager:PauseDownload(index)

    if self.updatePro[btn_index] then
        TFDirector:removeTimer(self.updatePro[btn_index])
        self.updatePro[btn_index] = nil
    end

    self:setDownStatus(btn_index)
end



function ResourceDown.onBtnGetAward(sender)
    -- body
    local self = sender.logic   
    local btn_index = sender.index
    if btn_index == nil or DownResourceManager.newConfigList[btn_index] == nil then
        return
    end
    local index = DownResourceManager.newConfigList[btn_index].task_id 
    if index == nil then
        return
    end
    DownResourceManager:getAward(index);
end

function ResourceDown.onBtnShowAward(sender)
    local self = sender.logic   
    local btn_index = sender.index
    if btn_index == nil or DownResourceManager.newConfigList[btn_index] == nil then
        return
    end
    local index = DownResourceManager.newConfigList[btn_index].task_id 
    if index == nil then
        return
    end

    local data = self.awardList:objectAt(index)
    RewardManager:showGiftListLayer(data.drop_id, false,   function() end)

end



function ResourceDown:updateProcess(btn_index)
    if btn_index > #DownResourceManager.newConfigList then
        return 
    end
    local index = DownResourceManager.newConfigList[btn_index].task_id 
    if index == nil then
        return
    end
   
    local totalSize = PackageManager.packageList[index].totalSize
    local downloadSize =   TFPackageManager:GetInstance():GetPackageDownloadedSize(index);
    -- print("downloadSize2222--------------------------------",downloadSize, "totalSize:", totalSize)
    PackageManager.packageList[index].downloadedSize = downloadSize
    local state = PackageManager.packageList[index].state

    if state == 1 or state == 2 then
        if self.updatePro[btn_index] then
            TFDirector:removeTimer(self.updatePro[btn_index])
            self.updatePro[btn_index] = nil
        end
        self:setDownedStatus(btn_index)
        self:updateButtonStatus()
    else
        self:setPercent(btn_index)
    end         
end

function ResourceDown:getDesc(index)
    -- body
    local desc =""
    local data = self.awardList:objectAt(index)
    desc = data.desc .. "(%.2f%%)" 
    return desc
end

function ResourceDown:setPercent(btn_index)
    print("richard setPercent:", btn_index)

    local index = DownResourceManager.newConfigList[btn_index].task_id 
    local totalSize = PackageManager.packageList[index].totalSize
    local state = PackageManager.packageList[index].state
    local downloadSize =   TFPackageManager:GetInstance():GetPackageDownloadedSize(index);
    print("richard download:", downloadSize, ", totoal:", totalSize)
    local percent =string.format("%.2f", (downloadSize / totalSize) * 100)
    self.img_resourebg[btn_index].bar_downing:setPercent(tonumber(percent))    
    local desc = self:getDesc(index)
    desc =string.format(desc, (downloadSize / totalSize) * 100)
    self.img_resourebg[btn_index].txt_shuoming:setText(desc) 

    if state == 1 or state == 2 then
        percent =string.format("%.2f", 100)
        self.img_resourebg[btn_index].bar_downing:setPercent(tonumber(percent))    
        desc = self:getDesc(index)
        desc =string.format(desc, 100)
        self.img_resourebg[btn_index].txt_shuoming:setText(desc) 
    end
end



function ResourceDown:setDownStatus(btn_index)  --未下载状态
    if btn_index > #DownResourceManager.newConfigList then
        return 
    end
    local index = DownResourceManager.newConfigList[btn_index].task_id 
    self:setPercent(btn_index)
    self.img_resourebg[btn_index].btn_down:setVisible(true)
    self.img_resourebg[btn_index].btn_pause:setVisible(false)
    self.img_resourebg[btn_index].btn_downed:setVisible(false)
end

function ResourceDown:setDowningStatus(btn_index)  --正在下载
    if btn_index > #DownResourceManager.newConfigList then
        return 
    end
    self.img_resourebg[btn_index].txt_shuoming:setVisible(true)
    self.img_resourebg[btn_index].btn_down:setVisible(false)   
    self.img_resourebg[btn_index].btn_pause:setVisible(true)

    self:setPercent(btn_index)

    if self.updatePro[btn_index] then
        TFDirector:removeTimer(self.updatePro[btn_index])
        self.updatePro[btn_index] = nil
    end 

    self.updatePro[btn_index] = TFDirector:addTimer(100, -1, nil,
        function()
            self:updateProcess(btn_index)
        end
    )
end

function ResourceDown:setDownedStatus(btn_index)  --下载完成
    -- body
     --下载中隐藏
    self:setPercent(btn_index)
    self.img_resourebg[btn_index].btn_pause:setVisible(false)
    --下载隐藏
    self.img_resourebg[btn_index].btn_down:setVisible(false)
    self.img_resourebg[btn_index].bar_downing:setPercent(100)
    self.img_resourebg[btn_index].btn_downed:setVisible(true)
   -- self:updateButtonStatus()
end

function ResourceDown:updateButtonStatus()
    for i=1,#DownResourceManager.newConfigList do
        self.img_resourebg[i].img_resourebg:setVisible(true) 
        self.btn_iconbg[i].bg:setVisible(true)
        self.btn_get[i]:setVisible(true)

        local task_id = DownResourceManager.newConfigList[i].task_id
        local state = PackageManager.packageList[task_id].state
        local totalSize = PackageManager.packageList[task_id].totalSize
        local gets =  DownResourceManager:getAwardStatus()
        local isGet = gets[task_id]

        if self.updatePro[i] then
            TFDirector:removeTimer(self.updatePro[i])
            self.updatePro[i] = nil
        end 

        --下载完成  还需要判断是否领取过奖励
        if ((state == 1 or state == 2) and isGet == 0) or TFPlugins.isCompletePack then 
            self.btn_get[i]:setTouchEnabled(true)
            self.btn_get[i]:setGrayEnabled(false)
        else
            self.btn_get[i]:setTouchEnabled(false)
            self.btn_get[i]:setGrayEnabled(true)
        end 





        if state == 1 or state == 2 then --下载完成或者解压完成
            self:setDownedStatus(i)
        elseif DownResourceManager.downState[task_id] == 1  then --正在下载中
            self:setDowningStatus(i)
        else
            self:setDownStatus(i)
        end 
        local totalKB = totalSize /1024
        local totalMB = totalKB / 1024        --

        self.img_resourebg[i].txt_resourename:setText(stringUtils.format(localizable.ResouceDown_text[task_id],  string.format("%.2f", totalMB))) 
    end

    for i=#DownResourceManager.newConfigList + 1,3 do
        self.img_resourebg[i].img_resourebg:setVisible(false)
        self.btn_iconbg[i].bg:setVisible(false)
        self.btn_get[i]:setVisible(false)
    end
    
    if #DownResourceManager.newConfigList < 1 then
        print("Down----------------------------------------------Close")
        AlertManager:closeLayer(self)
        --AlertManager:close()
    end
    
end



return ResourceDown;