-- client side BiaoChePartInfoLayer.lua
--[[
 * @Description: 镖车信息
 ]]
-- script writer chikui


local BiaoChePartInfoLayer = class("BiaoChePartInfoLayer",BaseLayer)
local AttackResetTime = ConstantData:objectByID("EscortAgencyRestInTime").value
local DefenseResetTime = ConstantData:objectByID("EscortAgencyComeBackToLife").value
function BiaoChePartInfoLayer:ctor(data)

    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.faction.BiaocheCarFight")
end

function BiaoChePartInfoLayer:initUI( ui )

    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_back')
    
    self.btn_attack = TFDirector:getChildByPath(ui, 'Button_attack')
    self.panel_list = TFDirector:getChildByPath(ui, 'Panel_fightlist')
    self.img_title = TFDirector:getChildByPath(ui, 'img_title')
    self.txt_factionname = TFDirector:getChildByPath(ui, 'txt_factionname')
    self.txt_fwqname = TFDirector:getChildByPath(ui, 'txt_fuwuqiname')
    self.centerPos = self.txt_factionname:getPositionX()
    
    self.panel_cell_model = TFDirector:getChildByPath(ui, 'Panel_landr' )
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()
    self.needBrush = false
    self.panel_cell_list = {}
    local funcBrushTime = function()
        self:brushTime()
    end
    self.updateTimerID = TFDirector:addTimer(1000, -1, nil,funcBrushTime)
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/weekFight.xml")
    self.effect_model = TFArmature:create("weekFight_anim")
    self.effect_model:retain()
    self.effect_model:setVisible(false)
    self.status = 1
end

local function isHpZero( strData )
    if strData == "" then
        return false
    end
    local tbl = stringToTable(strData,";")
    for i,v in ipairs(tbl) do
        if v ~= "" then
            local tTemp = stringToNumberTable(v,"_")
            if tTemp[2] ~= 0 then
                return false
            end
        end
    end
    return true
end

local function getHpPer( strData )
    if strData == "" then
        return 100
    end
    local tbl = stringToTable(strData,";")
    print("strData = ",strData)
    local maxHp = 0
    local curHp = 0
    for i,v in ipairs(tbl) do
        if v ~= "" then
            local tTemp = stringToNumberTable(v,"_")
            curHp = curHp + tTemp[2]
            maxHp = maxHp + tTemp[3]
        end
    end
    if maxHp == 0 then
        return 0
    end
    return (curHp * 100 / maxHp)
end

function BiaoChePartInfoLayer:setInfo( carInfo,partType )
    self.carInfo = carInfo
    self.partType = partType
    if self.carInfo.partInfo == nil then
        self.carInfo.partInfo = {}
    end
    self.partInfo = {}
    for k,v in pairs(self.carInfo.partInfo) do
        if v.type == partType then
            self.partInfo = v or {}
        end
    end
    if self.status == 0 and self.partInfo.status == 1 then
        AlertManager:closeLayer(self)
        return
    end
    self.status = self.partInfo.status
    print("self.partInfo = ",self.partInfo)
    local titlePath = {
        "ui_new/faction/biaoche/img_name_hujia.png",
        "ui_new/faction/biaoche/img_name_biaoqi.png",
        "ui_new/faction/biaoche/img_name_chelun.png",
        "ui_new/faction/biaoche/img_name_chexiang.png",
    }
    self.img_title:setTexture(titlePath[self.partType])
    self:refreshUI()
    self:brushInfoList()
    self:refreshTableView()
end

--[[
    infolist   type  1 2 3:
    1: alive
    2: die
    3: die history
]]

function BiaoChePartInfoLayer:brushInfoList()
    self.infoListRight = {}
    self.infoListLeft = {}
    local list1 = {}
    local list2 = {}
    local attackList = self.partInfo.attackPlayer or {}
    local timeNow = MainPlayer:getNowtime()
    for i,v in ipairs(attackList) do
        if isHpZero(v.formationBlood) == true then
            table.insert(list2,v)
        else
            table.insert(list1,v)
        end
    end
    for i,v in ipairs(list1) do
        table.insert(self.infoListRight,{type = 1,playerData = v})
    end
    for i,v in ipairs(list2) do
        --table.insert(self.infoListRight,{type = 2,playerData = v})
    end
    local dieList = self.partInfo.diePlayer or {}
    for i,v in ipairs(dieList) do
        table.insert(self.infoListRight,{type = 3,playerData = v})
    end

    list1 = {}
    list2 = {}
    local defenseList = self.partInfo.defensePlayer or {}
    for i,v in ipairs(defenseList) do
        if v.dieTime + DefenseResetTime > timeNow and isHpZero(v.formationBlood) == true then
            table.insert(list2,v)
        else
            table.insert(list1,v)
        end
    end
    for i,v in ipairs(list1) do
        table.insert(self.infoListLeft,{type = 1,playerData = v})
    end
    for i,v in ipairs(list2) do
        table.insert(self.infoListLeft,{type = 2,playerData = v})
    end
    
end

function BiaoChePartInfoLayer:brushTime()
    if self.panel_cell_list == nil then
        self.panel_cell_list = {}
    end
    local updatetime = 20 - BiaoCheManager:getTempTime()
    if updatetime <= 0 then
        updatetime = 0
    end
    for k,v in pairs(self.panel_cell_list) do
        if v.data[1] and v.data[1].type == 2 and v.timeLeft then
            self:freshTime(v.data[1].playerData,v.timeLeft,DefenseResetTime)
        end

        if v.data[2] and v.data[2].type == 2 and v.timeRight then
            --self:freshTime(v.data[2].playerData,v.timeRight,AttackResetTime)
        end

        if v.timerCountDown then
            v.timerCountDown:setText(string.format(localizable.BiaoCheBaoPartTime_txt,updatetime))
        end
    end
    if self.needBrush == true then
        self.needBrush = false
        self:brushInfoList()
        self:refreshTableView()
    end
end

function BiaoChePartInfoLayer:freshTime( playerData,txt_node ,resetTime)
    local timeNow = MainPlayer:getNowtime()

    local leftTime = playerData.dieTime + resetTime - timeNow
    if leftTime < 0 then
        leftTime = 0
        self.needBrush = true
    end

    local hour = math.floor(leftTime / 3600)
    leftTime = leftTime - hour * 3600
    local min = math.floor(leftTime / 60)
    local sec = leftTime - min * 60

    txt_node:setText(string.format("%02d:%02d:%02d",hour,min,sec))
end

function BiaoChePartInfoLayer:removeUI()
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
    if self.effect_model then
        self.effect_model:release()
        self.effect_model = nil
    end
    self.super.removeUI(self)
end

function BiaoChePartInfoLayer:onShow()
    self.super.onShow(self)
end

function BiaoChePartInfoLayer:refreshTableView()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()

        self.tableView = tableView
        tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView,self))
        --self.tableView:addMEListener(TFTABLEVIEW_SCROLL, handler(self.tableScroll,self))
        self.panel_list:addChild(tableView)
    end
    self.tableView:reloadData()
end


function BiaoChePartInfoLayer:cellSizeForTable(table,idx)
    return 110,895
end

function BiaoChePartInfoLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if self.panel_cell_list == nil then
        self.panel_cell_list = {}
    end
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_cell_model:clone()
        node:setVisible(true)
        node:setPositionY(0)
        cell:addChild(node,1)
        cell.panel = node
        local size = #(self.panel_cell_list)
        self.panel_cell_list[size + 1] = node
    end
    self:setCellInfo(cell,idx)
    return cell
end

function BiaoChePartInfoLayer:numberOfCellsInTableView(table)
    local num = math.max(#(self.infoListRight),#(self.infoListLeft))
    if num < 0 then num = 0 end
    return num
end

function BiaoChePartInfoLayer:setCellInfo(cell,idx)
    local infoLeft = self.infoListLeft[idx]
    local infoRight = self.infoListRight[idx]
    local panel = cell.panel
    if infoLeft == nil and infoRight == nil then
        panel:setVisible(false)
        return
    end
    panel.data = {infoLeft,infoRight}
    local bFight = (infoLeft and infoLeft.type == 1 and infoRight and infoRight.type == 1)
    panel:setVisible(true)
    local img_fightingbg_zuo = TFDirector:getChildByPath(panel, 'img_fightingbg_zuo' )
    local img_idlebg_zuo = TFDirector:getChildByPath(panel, 'img_idlebg_zuo' )
    local img_fightingbg_you = TFDirector:getChildByPath(panel, 'img_fightingbg_you' )
    local img_idlebg_you = TFDirector:getChildByPath(panel, 'img_idlebg_you' )
    local img_jiesuanbg = TFDirector:getChildByPath(panel, 'img_jiesuanbg' )
    local txt_jiesuanshijian = TFDirector:getChildByPath(panel, 'txt_jiesuanshijian' )
    local img_vs = TFDirector:getChildByPath(panel, 'img_vs' )
    img_vs:setVisible(false)

    panel.timeLeft = nil
    panel.timeRight = nil
    panel.timerCountDown = nil
    if panel.effect then
        panel.effect:removeFromParent()
        panel.effect = nil
    end
    local nodeLeft = img_fightingbg_zuo
    local nodeRight = img_fightingbg_you
    if bFight == true then
        img_fightingbg_zuo:setVisible(true)
        img_idlebg_zuo:setVisible(false)
        img_fightingbg_you:setVisible(true)
        img_idlebg_you:setVisible(false)
        img_vs:setVisible(true)
    else
        img_fightingbg_zuo:setVisible(false)
        img_idlebg_zuo:setVisible(true)
        img_fightingbg_you:setVisible(false)
        img_idlebg_you:setVisible(true)
        nodeLeft = img_idlebg_zuo
        nodeRight = img_idlebg_you
    end
    if infoLeft then
        if infoLeft.type == 1 then
            self:drawAliveNode(nodeLeft,infoLeft)
        else
            local txt_time = self:drawDieNode(nodeLeft,infoLeft,DefenseResetTime,false)
            panel.timeLeft = txt_time
        end
    else
        img_fightingbg_zuo:setVisible(false)
        img_idlebg_zuo:setVisible(false)
    end
    img_jiesuanbg:setVisible(false)
    if infoRight then
        if infoRight.type == 1 then
            self:drawAliveNode(nodeRight,infoRight)
            if self.partInfo.status == 0 and (idx == 1 or bFight == true) then
                local effect = self.effect_model:clone()
                effect:setPosition(ccp(418,56))
                effect:setScale(0.5)
                effect:playByIndex(0, -1, -1, 1)
                effect:setZOrder(100)
                panel:addChild(effect) 
                panel.effect = effect
                effect:setVisible(true)
                img_jiesuanbg:setVisible(true)
                panel.timerCountDown = txt_jiesuanshijian
                local updatetime = 20 - BiaoCheManager:getTempTime()
                if updatetime <= 0 then
                    updatetime = 0
                end
                txt_jiesuanshijian:setText(string.format(localizable.BiaoCheBaoPartTime_txt,updatetime))
            end
        else
            local txt_time = self:drawDieNode(nodeRight,infoRight,AttackResetTime,true)
            panel.timeRight = txt_time
        end
    else
        img_fightingbg_you:setVisible(false)
        img_idlebg_you:setVisible(false)
    end
end

function BiaoChePartInfoLayer:drawDieNode( node,data,resetTime,isAttack )
    local playerData = data.playerData
    local img_head = TFDirector:getChildByPath(node, 'img_touxiang' )
    local img_die_bg = TFDirector:getChildByPath(node, 'img_dead' )
    local txt_name = TFDirector:getChildByPath(node, 'txt_name' )
    local txt_faction = TFDirector:getChildByPath(node, 'txt_faction' )
    local txt_zhanli = TFDirector:getChildByPath(node, 'txt_zhanli' )
    local bar_blood = TFDirector:getChildByPath(node, 'bar_blood' )
    local txt_fuhuotime = TFDirector:getChildByPath(node, 'txt_fuhuotime' )
    local img_fuhuoshijian = TFDirector:getChildByPath(node, 'img_fuhuoshijian' )
    local Panel_tu = TFDirector:getChildByPath(node, 'Panel_tu' )

    local roleData =  RoleData:objectByID(playerData.useCoin)
    if (roleData == nil) then
        roleData =  RoleData:objectByID(77)
    end
    img_head:setTexture(roleData:getIconPath())
    Public:addFrameImg(img_head,playerData.frameId,true)
    img_die_bg:setVisible(true)
    txt_name:setText(playerData.playerName)
    txt_faction:setText(stringUtils.format(localizable.friendInfoLayer_faction,playerData.guildName))
    txt_zhanli:setText(localizable.common_power .. playerData.power)
    bar_blood:setPercent(0)
    if Panel_tu then
        Panel_tu:setShaderProgram("GrayShader", true)
    end

    if data.type == 3 or isAttack == true then
        txt_fuhuotime:setText("")
        img_fuhuoshijian:setVisible(false)
        return nil
    end

    img_fuhuoshijian:setVisible(true)
    
    self:freshTime(playerData,txt_fuhuotime,resetTime)
    return txt_fuhuotime
end

function BiaoChePartInfoLayer:drawAliveNode( node,data )
    local playerData = data.playerData
    local img_head = TFDirector:getChildByPath(node, 'img_touxiang' )
    local img_die_bg = TFDirector:getChildByPath(node, 'img_dead' )
    local txt_name = TFDirector:getChildByPath(node, 'txt_name' )
    local txt_faction = TFDirector:getChildByPath(node, 'txt_faction' )
    local txt_zhanli = TFDirector:getChildByPath(node, 'txt_zhanli' )
    local bar_blood = TFDirector:getChildByPath(node, 'bar_blood' )
    local txt_fuhuotime = TFDirector:getChildByPath(node, 'txt_fuhuotime' )
    local img_fuhuoshijian = TFDirector:getChildByPath(node, 'img_fuhuoshijian' )
    local Panel_tu = TFDirector:getChildByPath(node, 'Panel_tu' )
    local roleData =  RoleData:objectByID(playerData.useCoin)
    if (roleData == nil) then
        roleData =  RoleData:objectByID(77)
    end
    img_head:setTexture(roleData:getIconPath())
    Public:addFrameImg(img_head,playerData.frameId,true)
    txt_name:setText(playerData.playerName)
    txt_faction:setText(stringUtils.format(localizable.friendInfoLayer_faction,playerData.guildName))
    txt_zhanli:setText(localizable.common_power .. playerData.power)

    local per = getHpPer(playerData.formationBlood)
    if per <= 0 then
        per = 100
    end
    bar_blood:setPercent(per)
    if txt_fuhuotime then
        txt_fuhuotime:setText("")
    end
    if img_fuhuoshijian then
        img_fuhuoshijian:setVisible(false)
    end
    if img_die_bg then
        img_die_bg:setVisible(false)
    end
    if Panel_tu then
        Panel_tu:setShaderProgramDefault(true)
    end
end

function BiaoChePartInfoLayer:refreshUI()
    if self.carInfo.partInfo == nil then
        self.carInfo.partInfo = {}
    end
    local guildName = ""
    local myGuildId = FactionManager:getPersonalInfo().guildId

    local isContentMe = (self.carInfo.guildId == myGuildId)
    for i=1,4 do
        local partInfo = self.carInfo.partInfo[i]
        if partInfo ~= nil and partInfo.type ~= nil then
            if guildName == "" and partInfo.defensePlayer and partInfo.defensePlayer[1] then
                guildName = partInfo.defensePlayer[1].guildName
                -- if isContentMe == false then
                --     for k,v in pairs(partInfo.defensePlayer) do
                --         if v.playerId == MainPlayer:getPlayerId() then
                --             isContentMe = true
                --             break
                --         end
                --     end
                -- end
            end
            if self.partType == partInfo.type and partInfo.attackPlayer and partInfo.attackPlayer[1] then
                if isContentMe == false then
                    for k,v in pairs(partInfo.attackPlayer) do
                        if v.playerId == MainPlayer:getPlayerId() then
                            isContentMe = true
                            break
                        end
                    end
                end
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
    if isContentMe == true then
        self.btn_attack:setVisible(false)
    else
        self.btn_attack:setVisible(true)
    end

end

function BiaoChePartInfoLayer.onAttackClick( sender )
    local self = sender.logic
    BiaoCheManager:requestAttack(self.carInfo.guildId,self.partType)
end

function BiaoChePartInfoLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close);

    self.attackCallBack = function(event)
        local carInfo = event.data[1][1]
        if carInfo.guildId == self.carInfo.guildId then
            self:setInfo(carInfo,self.partType)
        end
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_ATTACK_INFO, self.attackCallBack)
    self.btn_attack:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAttackClick))
    self.btn_attack.logic = self
end

function BiaoChePartInfoLayer:removeEvents()
    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_ATTACK_INFO, self.attackCallBack)
    self.super.removeEvents(self)
end

return BiaoChePartInfoLayer