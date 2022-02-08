-- client side LunJianRecord.lua
--[[
 * @Description: 论剑峰战斗记录
 ]]
-- script writer wuqi
-- creation time 2016-06-23

local LunJianRecord = class("LunJianRecord", BaseLayer)

LunJianRecord.textureTag = {
    [1] = "ui_new/lunjian/img_zhanlingsuccess.png",
    [2] = "ui_new/lunjian/img_zhanlingfail.png",
    [3] = "ui_new/lunjian/img_fangshousuccess.png",   
    [4] = "ui_new/lunjian/img_fangshoufail.png"
}

LunJianRecord.strMiaoshu = {
    [1] = localizable.LunJianFeng_txt_battlelog_win1,
    [2] = localizable.LunJianFeng_txt_battlelog_lose1,
    [3] = localizable.LunJianFeng_txt_battlelog_win2,
    [4] = localizable.LunJianFeng_txt_battlelog_lose2,
}

function LunJianRecord:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianRecord")
end

function LunJianRecord:initUI(ui)
    self.super.initUI(self, ui)
    self.panel_list = TFDirector:getChildByPath(ui, "panel_list")
    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.btn_close.logic = self
    self.img_lineshang = TFDirector:getChildByPath(ui, "img_jianbian1")
    self.img_linedi = TFDirector:getChildByPath(ui, "img_jianbian2")
    self.img_lineshang:setVisible(false)
end

function LunJianRecord:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function LunJianRecord:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
    self.onActivityStatusHandler = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)

    self.onActivityStatusHandler_0 = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
end

function LunJianRecord:refreshUI()
    if self.tabView then
        self.tabView:reloadData()
        return
    end

    self:createTabView()
end

function LunJianRecord:createTabView()
    local tabView =  TFTableView:create()
    tabView:setTableViewSize(self.panel_list:getContentSize())
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_list:addChild(tabView)
    tabView:setPosition(ccp(0, 0))
    self.tabView = tabView

    self.tabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tabView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
    Public:bindScrollFun(self.tabView)
    self.tabView:reloadData()
end

function LunJianRecord.cellSizeForTable(table, idx)
    return 145, 750
end

function LunJianRecord.numberOfCellsInTableView(table)
    local num = 0

    if PeakManager.battleLog then
        num = #PeakManager.battleLog
    end
    return num
end

function LunJianRecord.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = createUIByLuaNew("lua.uiconfig_mango_new.Lunjianfeng.LunJianRecordcell")
        panel:setPosition(ccp(0, 0))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end
      
    self:setCellInfo(cell.panel, idx + 1)
    return cell
end

function LunJianRecord.tableScroll(table)
    local self = table.logic
    local currPosY = self.tabView:getContentOffset().y
    local sizeHeight = self.tabView:getContentSize().height
    local size = self.tabView:getSize().height

    if currPosY >= 0 then
        self.img_linedi:setVisible(false)
    else
        self.img_linedi:setVisible(true)
    end

    if size - currPosY >= sizeHeight then
        self.img_lineshang:setVisible(false)
    else
        self.img_lineshang:setVisible(true)
    end
end

function LunJianRecord:removeEvents()
    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    self.super.removeEvents(self)
end

function LunJianRecord:dispose()
    self.super.dispose(self)
end

function LunJianRecord:setCellInfo(panel, idx)
    local info = PeakManager.battleLog[idx]   
    if not info then
        panel:setVisible(false)
        return
    end
    panel:setVisible(true)
    local headIcon = TFDirector:getChildByPath(panel, "img_head")
    local txt_miaoshu = TFDirector:getChildByPath(panel, "txt_miaoshu")
    local img_tag = TFDirector:getChildByPath(panel, "img_hukuang")
    local img_frame = TFDirector:getChildByPath(panel, "img_di")
    local btn_baochou = TFDirector:getChildByPath(panel, "btn_baochou")
    btn_baochou.logic = self
    btn_baochou.idx = idx
    local txt_time = TFDirector:getChildByPath(panel, "txt_name3")
    local btn_huifang = TFDirector:getChildByPath(panel, "btn_huifang")
    btn_huifang.logic = self
    btn_huifang.idx = idx
    btn_huifang.recordId = info.recordId

    local panel_xinxi = TFDirector:getChildByPath(panel, "panel_xinxi")
    local txt_name = TFDirector:getChildByPath(panel_xinxi, "txt_name")
    local txt_server = TFDirector:getChildByPath(panel_xinxi, "txt_fwq")
    local txt_zhenyan = TFDirector:getChildByPath(panel_xinxi, "txt_zhenyan")
    local txt_power = TFDirector:getChildByPath(panel_xinxi, "Label_LunJianRecordcell_1")

    btn_baochou:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBaochouClick))
    btn_huifang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHuifangClick))

    local role = RoleData:objectByID(info.useIcon)
    if role then
        headIcon:setTexture(role:getIconPath())
    end
    Public:addFrameImg(headIcon, info.headPicFrame)
    local serverId = 0
    local userInfo = SaveManager:getUserInfo()
    if userInfo and userInfo.currentServer then
        serverId = tonumber(userInfo.currentServer)
    end
    if serverId == 0 or serverId == info.serverId then
        Public:addInfoListen(headIcon, true, 2, info.playerId)
    else
        Public:addInfoListen(headIcon, true, 2, info.playerId,info.serverId)
    end
    txt_name:setText(info.name)

    local type = info.type + 1
    local texture = self.textureTag[type]
    img_tag:setTexture(texture)
    txt_miaoshu:setText(stringUtils.format(self.strMiaoshu[type], info.oldLayer))
    local time = (MainPlayer:getNowtime() - info.battleTime/1000)/60
    local timeType = localizable.time_minute_txt..localizable.shalurecord_txt2
    if time < 0 then time = 1 end
    if time > 60 then 
        timeType = localizable.time_hour_txt..localizable.shalurecord_txt2
        time = time / 60
        if time > 24 then
            timeType = localizable.time_day_txt..localizable.shalurecord_txt2
            time = time / 24
        end
    end    
    txt_time:setText(math.floor(time)..timeType)
    txt_power:setText(info.power)

    btn_baochou:setVisible(false)
    txt_zhenyan:setVisible(false)
    if info.type == 3 then
        btn_baochou:setVisible(true)
        if info.layer and info.layer > 0 and info.pos and info.pos > 0 then
            txt_zhenyan:setText(stringUtils.format(localizable.LunJianFeng_txt_battlelog_zhenyan2, info.layer))            
            btn_baochou:setTouchEnabled(true)
            btn_baochou:setGrayEnabled(false)
        else
            txt_zhenyan:setText(localizable.LunJianFeng_txt_battlelog_zhenyan1)
            btn_baochou:setTouchEnabled(false)
            btn_baochou:setGrayEnabled(true)
        end
    end
    btn_huifang:setVisible(false)
    -- local serverInfo = SaveManager:getServerInfo(info.serverId)
    -- local serverName = ""
    -- if serverInfo then
    --     serverName = serverInfo.name
    -- end

    txt_server:setText(stringUtils.format(localizable.LunJianFeng_txt_battlelog_server, info.serverName))
end

function LunJianRecord.onBaochouClick(sender)
    local self = sender.logic
    local idx = sender.idx
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.PEAK)
    times = challengeInfo:getLeftChallengeTimes()
    if times <= 0 then
        toastMessage(localizable.LunJianFeng_peak_error)
        return
    end
    local info = PeakManager.battleLog[idx]
    PeakManager:requestRevengeInfo(info.layer, info.pos, info.playerId)
end

function LunJianRecord.onHuifangClick(sender)
    local self = sender.logic
    local idx = sender.idx
    local recordId = sender.recordId

    showLoading()
    TFDirector:send(c2s.PLAY_ARENA_TOP_BATTLE_REPORT, {recordId})
end

return LunJianRecord