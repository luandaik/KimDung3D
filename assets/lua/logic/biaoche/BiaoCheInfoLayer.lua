-- client side BiaoCheInfoLayer.lua
--[[
 * @Description: 镖车信息
 ]]
-- script writer chikui


local BiaoCheInfoLayer = class("BiaoCheInfoLayer",BaseLayer)

function BiaoCheInfoLayer:ctor(data)

    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.faction.BiaocheCarInfo")
end

function BiaoCheInfoLayer:initUI( ui )

    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')
    
    self.img_che = TFDirector:getChildByPath(ui, 'img_che')
    self.btn_jihuologo = TFDirector:getChildByPath(ui, 'btn_jihuologo')
    self.btn_jihuo = TFDirector:getChildByPath(ui, 'btn_jihuo')
    self.txt_factionname = TFDirector:getChildByPath(ui, 'txt_factionname')
    self.txt_fwqname = TFDirector:getChildByPath(ui, 'txt_fwqname')
    self.centerPos = self.txt_factionname:getPositionX()

    self.RestTime = ConstantData:objectByID("EscortAgencyComeBackToLife").value

    local titlePath = {
        "ui_new/faction/biaoche/img_name_hujia.png",
        "ui_new/faction/biaoche/img_name_biaoqi.png",
        "ui_new/faction/biaoche/img_name_chelun.png",
        "ui_new/faction/biaoche/img_name_chexiang.png",
    }
    local tNameList = {"Panel_hujia","Panel_biaoqi","Panel_chelun","Panel_chexiang"}
    self.tPart_Node_List = {}
    for i=1,4 do
        local rootNode = TFDirector:getChildByPath(ui, tNameList[i])
        self.tPart_Node_List[i] = rootNode
        self.tPart_Node_List[i].img_title = TFDirector:getChildByPath(rootNode, "title_hujia")
        self.tPart_Node_List[i].img_title:setTexture(titlePath[i])
        self.tPart_Node_List[i].txt_fangnumber = TFDirector:getChildByPath(rootNode, "txt_fangnumber")
        self.tPart_Node_List[i].txt_fangnumber:setText("0")
        self.tPart_Node_List[i].txt_gongnumber = TFDirector:getChildByPath(rootNode, "txt_gongnumber")
        self.tPart_Node_List[i].txt_gongnumber:setText("0")
        self.tPart_Node_List[i].img_roleinfo = TFDirector:getChildByPath(rootNode, "img_roleinfo")
        self.tPart_Node_List[i].img_roleinfo:setVisible(false)
        self.tPart_Node_List[i].img_icon = TFDirector:getChildByPath(rootNode, "img_icon")
        self.tPart_Node_List[i].txt_name = TFDirector:getChildByPath(rootNode, "txt_name")
        self.tPart_Node_List[i].txt_zhanli = TFDirector:getChildByPath(rootNode, "txt_zhanli")
        self.tPart_Node_List[i].txt_wuren = TFDirector:getChildByPath(rootNode, "txt_wuren")
        self.tPart_Node_List[i].txt_wuren:setVisible(true)

        self.tPart_Node_List[i].img_hongbg = TFDirector:getChildByPath(rootNode, "img_hongbg")
        self.tPart_Node_List[i].img_hongbg:setVisible(false)
        self.tPart_Node_List[i].img_sunhui = TFDirector:getChildByPath(rootNode, "img_sunhui")
        self.tPart_Node_List[i].img_sunhui:setVisible(false)

        self.tPart_Node_List[i].btn_jingong = TFDirector:getChildByPath(rootNode, "btn_jingong")
        self.tPart_Node_List[i].btn_jingong:setVisible(false)
        self.tPart_Node_List[i].btn_jingong.logic = self
        self.tPart_Node_List[i].btn_jingong.idx = i
        self.tPart_Node_List[i].btn_jingong:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckClick))

        self.tPart_Node_List[i].btn_chakan = TFDirector:getChildByPath(rootNode, "btn_chakan")
        self.tPart_Node_List[i].btn_chakan:setVisible(false)
        self.tPart_Node_List[i].btn_chakan.logic = self
        self.tPart_Node_List[i].btn_chakan.idx = i
        self.tPart_Node_List[i].btn_chakan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckClick))
        self.tPart_Node_List[i].txt_time = TFDirector:getChildByPath(rootNode, "txt_time")
        self.tPart_Node_List[i].txt_time:setVisible(false)
        self.tPart_Node_List[i].txt_huifu = TFDirector:getChildByPath(rootNode, "txt_huifu")
        self.tPart_Node_List[i].txt_huifu:setVisible(false)
    end
    local funcBrushTime = function()
        self:brushTime()
    end
    self.updateTimerID = TFDirector:addTimer(1000, -1, nil,funcBrushTime)
    self.statusList = {1,1,1,1}
end

function BiaoCheInfoLayer:setInfo( carInfo )
    self.carInfo = carInfo
    self:refreshUI()
    self:brushConverge()
end

function BiaoCheInfoLayer:brushConverge()
    local myGuildId = FactionManager:getPersonalInfo().guildId
    if self.carInfo.guildId and self.carInfo.guildId ~= 0 and self.carInfo.guildId == myGuildId then
        self.btn_jihuo:setVisible(false)
        self.btn_jihuologo:setVisible(false)
        return
    end
    if self.carInfo.guildId and self.carInfo.guildId ~= 0 and self.carInfo.guildId == BiaoCheManager:getConvergeGuildId() then
        self.btn_jihuo:setVisible(false)
        self.btn_jihuologo:setVisible(true)
        if FactionManager:getPostInFaction() < 3 then
            self.btn_jihuo:setTextureNormal("ui_new/faction/biaoche/btn_nojihuo.png")
            self.btn_jihuo.type = 1
            self.btn_jihuo:setVisible(true)
        else
            self.btn_jihuo:setVisible(false)
        end
    else
        self.btn_jihuologo:setVisible(false)
        if FactionManager:getPostInFaction() < 3 then
            self.btn_jihuo:setTextureNormal("ui_new/faction/biaoche/btn_jihuo.png")
            self.btn_jihuo.type = 0
            self.btn_jihuo:setVisible(true)
        else
            self.btn_jihuo:setVisible(false)
        end
    end
end

function BiaoCheInfoLayer:brushTime()
    local timeNow = MainPlayer:getNowtime()
    for i=1,4 do
        local partInfo = self.carInfo.partInfo[i]
        if partInfo and partInfo.type then
            local node = self.tPart_Node_List[partInfo.type]
            if partInfo.status == 1 then
                local resetTime = partInfo.lastResTime + self.RestTime
                resetTime = resetTime - timeNow
                if resetTime < 0 then
                    resetTime = 0
                end
                local hour = math.floor(resetTime/3600)
                resetTime = resetTime - hour * 3600
                local min = math.floor(resetTime/60)
                local sec = resetTime - min * 60
                node.txt_time:setText(string.format("%02d:%02d:%02d",hour,min,sec))
            else
                node.txt_time:setText("00:00:00")
            end
        end
    end
end

function BiaoCheInfoLayer:removeUI()
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self.super.removeUI(self)
end

function BiaoCheInfoLayer:onShow()
    self.super.onShow(self)
end

function BiaoCheInfoLayer:refreshUI()
    if self.carInfo.partInfo == nil then
        self.carInfo.partInfo = {}
    end
    local guildName = ""
    local notAttack = false
    local myGuildId = FactionManager:getPersonalInfo().guildId
    if self.carInfo.guildId and self.carInfo.guildId ~= 0 and self.carInfo.guildId == myGuildId then
        notAttack = true
    end
    local type1Ok = true
    for i=1,10 do
        local partInfo = self.carInfo.partInfo[i]
        if partInfo ~= nil and partInfo.type == 1 and partInfo.status == 1 then
            type1Ok = false
        end
    end
    for i=1,4 do
        local partInfo = self.carInfo.partInfo[i]
        if partInfo ~= nil and partInfo.type ~= nil then
            if partInfo.type ~= 1 then
                self:setPartStatus(partInfo.type,partInfo,notAttack or type1Ok)
            else
                self:setPartStatus(partInfo.type,partInfo,notAttack)
            end
            
            if guildName == "" and partInfo.defensePlayer and partInfo.defensePlayer[1] then
                guildName = partInfo.defensePlayer[1].guildName
            end
        end
    end
    self.txt_factionname:setText(guildName)
    self.txt_fwqname:setText(self.carInfo.serverName)

    local centerPos = self.centerPos
    local width1 = self.txt_factionname:getContentSize().width
    local width2 = self.txt_fwqname:getContentSize().width
    local pos1 = width1 - (width1 + width2) * 0.5 + centerPos
    local pos2 = pos1
    self.txt_factionname:setPositionX(pos1)
    self.txt_fwqname:setPositionX(pos2)
    self.img_che:setTexture("ui_new/faction/biaoche/img_che"..self.carInfo.quality..".png")
end

function BiaoCheInfoLayer:setPartStatus( type,partInfo,notAttack)
    local node = self.tPart_Node_List[type]
    local myGuildId = FactionManager:getPersonalInfo().guildId
    
    local bestInfo = self:getPowerBestPlayerInfo(partInfo.defensePlayer)
    if bestInfo then
        node.img_roleinfo:setVisible(true)
        node.txt_wuren:setVisible(false)
        local roleData =  RoleData:objectByID(bestInfo.useCoin)
        if (roleData == nil) then
            roleData =  RoleData:objectByID(77)
        end
        node.img_icon:setTexture(roleData:getHeadPath())
        node.txt_name:setText(bestInfo.playerName)
        node.txt_zhanli:setText(bestInfo.power)
    else
        node.img_roleinfo:setVisible(false)
        node.txt_wuren:setVisible(true)
    end
    local number = 0
    if partInfo.defensePlayer then
        number = #partInfo.defensePlayer
    end
    node.txt_fangnumber:setText(""..number)
    number = 0
    if partInfo.attackPlayer then
        number = #partInfo.attackPlayer
    end
    node.txt_gongnumber:setText(""..number)

    node.btn_chakan:setVisible(true)

    local timeNow = MainPlayer:getNowtime()

    if partInfo.status == 0 then
        node.txt_huifu:setVisible(false)
        node.txt_time:setVisible(false)
        node.txt_time:getParent():setVisible(false)
        node.img_sunhui:setVisible(false)
        node.img_hongbg:setVisible(false)
        if notAttack == true then
            node.btn_jingong:setVisible(false)
        else
            node.btn_jingong:setVisible(true)
        end
    else
        node.txt_huifu:setVisible(true)
        node.txt_time:setVisible(true)
        node.txt_time:getParent():setVisible(true)
        if self.statusList[type] == 0 then
            self.ui:runAnimation( "Action" .. (type - 1) , 1 );
        else
            node.img_sunhui:setVisible(true)
            node.img_hongbg:setVisible(true)
        end
        node.btn_jingong:setVisible(false)

        local resetTime = partInfo.lastResTime + self.RestTime
        resetTime = resetTime - timeNow
        if resetTime < 0 then
            resetTime = 0
        end
        local hour = math.floor(resetTime/3600)
        resetTime = resetTime - hour * 3600
        local min = math.floor(resetTime/60)
        local sec = resetTime - min * 60
        node.txt_time:setText(string.format("%02d:%02d:%02d",hour,min,sec))
    end
    self.statusList[type] = partInfo.status
end

function BiaoCheInfoLayer:getPowerBestPlayerInfo( playerList )
    if playerList == nil or #playerList <= 0 then
        return nil
    end
    local bestInfo = nil

    for k,v in pairs(playerList) do
        if bestInfo == nil or bestInfo.power < v.power then
            bestInfo = v
        end
    end
    return bestInfo
end

function BiaoCheInfoLayer.onJiHuoClick( sender )
    local self = sender.logic
    BiaoCheManager:requestConverge(self.carInfo.guildId,sender.type)
end

function BiaoCheInfoLayer.onCheckClick( sender )
    local self = sender.logic
    BiaoCheManager:openPartInfoLayer(self.carInfo,sender.idx)
end

function BiaoCheInfoLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close);
    self.btn_jihuo:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onJiHuoClick))
    self.btn_jihuo.logic = self

    self.convergeCallBack = function(event)
       self:brushConverge()
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_CONVERGE_INFO, self.convergeCallBack)

    self.attackCallBack = function(event)
        local carInfo = event.data[1][1]
        if carInfo.guildId == self.carInfo.guildId then
            self:setInfo(carInfo)
        end
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_ATTACK_INFO, self.attackCallBack)

    self.receiveMainInfo = function(event)
        BiaoCheManager:requestCarDetailInfo(self.carInfo.guildId)
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_MAIN_INFO, self.receiveMainInfo)
end

function BiaoCheInfoLayer:removeEvents()
    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_CONVERGE_INFO, self.convergeCallBack)    
    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_ATTACK_INFO, self.attackCallBack)
    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_MAIN_INFO, self.receiveMainInfo)

    self.super.removeEvents(self)
end

return BiaoCheInfoLayer