-- client side CrossFightRecords.lua
--[[
 * @Description: 战报
 ]]
-- script writer Stephen.tao
-- creation time 2016-05-25

local CrossFightRecords = class("CrossFightRecords", BaseLayer)

function CrossFightRecords:ctor()
    self.super.ctor(self)

    self.selectId = 1
    self:init("lua.uiconfig_mango_new.crossfight.CrossFightRecords")
end

function CrossFightRecords:initUI(ui)
    self.super.initUI(self,ui)

    -- 1 战斗 2 系统
    self.infoBtnList = {}
    self.infoBtnList[1] = TFDirector:getChildByPath(ui, 'tab1')
    self.infoBtnList[2] = TFDirector:getChildByPath(ui, 'tab2')


    self.normalList = {"ui_new/crossfight/tab_syzb.png","ui_new/crossfight/tab_bbzb.png"}
    self.choiceList = {"ui_new/crossfight/tab_syzbh.png","ui_new/crossfight/tab_bbzbh.png"}
    self.infoBtnList[self.selectId]:setTextureNormal(self.choiceList[self.selectId])

    self.panel_list = TFDirector:getChildByPath(ui, 'panel_zhanbao')
    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')



    self.img_lineshang = TFDirector:getChildByPath(ui, "img_lineshang")
    self.img_linedi = TFDirector:getChildByPath(ui, "img_linedi")
    self.img_lineshang:setVisible(false)

    
    self.panel_cell = TFDirector:getChildByPath(ui, 'img_zhanbao')
    self.panel_cell:retain()
    self.panel_cell:removeFromParent(true)
    self.panel_cell:setVisible(false)


    self:createTableView()
end

function CrossFightRecords:onShow()
    self.super.onShow(self)
end
function CrossFightRecords:freshUI()
    self.tableView:reloadData()
end

function CrossFightRecords:registerEvents(ui)
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
    for i=1,2 do
        self.infoBtnList[i]:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onInfoBtnClick))
        self.infoBtnList[i].logic = self
        self.infoBtnList[i].index = i
    end

end


function CrossFightRecords:removeEvents()
    self.super.removeEvents(self)
end
function CrossFightRecords:removeUI()
    self.super.removeUI(self)
    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
end

function CrossFightRecords:dispose()
    self.super.dispose(self)
end

function CrossFightRecords.onInfoBtnClick( sender )
    local self = sender.logic
    local index = sender.index
    if self.selectId == index then
        return
    end
    self.infoBtnList[self.selectId]:setTextureNormal(self.normalList[self.selectId])
    self.infoBtnList[index]:setTextureNormal(self.choiceList[index])
    self.selectId = index

    self.tableView:reloadData()
end


function CrossFightRecords:createTableView()
    local tabView =  TFTableView:create()
    tabView:setTableViewSize(self.panel_list:getContentSize())
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_list:addChild(tabView)
    tabView:setPosition(ccp(0,0))
    self.tableView = tabView


    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tableView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)

    self.tableView:reloadData()
end

function CrossFightRecords.cellSizeForTable(table,idx)
    return 160,773
end

function CrossFightRecords.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()

    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell:clone()
        local btn_guanzhan = TFDirector:getChildByPath(panel,"btn_guanzhan")
        btn_guanzhan:addMEListener(TFWIDGET_CLICK,audioClickfun(self.watchReplayClick))
        panel:setPosition(ccp(30,0))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end

    local fightInfo = nil
    if self.selectId == 1 then
        if CrossGuildBattleManager.guildBattleWarInfos and CrossGuildBattleManager.guildBattleWarInfos.all then
            local length  = #CrossGuildBattleManager.guildBattleWarInfos.all
            fightInfo = CrossGuildBattleManager.guildBattleWarInfos.all[length-idx]
        end
    elseif self.selectId == 2 then
        if CrossGuildBattleManager.guildBattleWarInfos and CrossGuildBattleManager.guildBattleWarInfos.own then
            local length  = #CrossGuildBattleManager.guildBattleWarInfos.own
            fightInfo = CrossGuildBattleManager.guildBattleWarInfos.own[length-idx]
        end
    end
    if fightInfo then
        cell.panel:setVisible(true)
        self:setPanelFightInfo(cell.panel , fightInfo)
    else
        cell.panel:setVisible(false)
    end
    return cell
end


function CrossFightRecords.watchReplayClick(sender)
    if sender.warId then
        CrossGuildBattleManager:sendGainCrossGuildBattleReplayInfos(sender.warId)
    end
end


function CrossFightRecords:setPanelFightInfo( panel , fightInfo )
    local panel_def = TFDirector:getChildByPath(panel,"bg_name1")
    local panel_atk = TFDirector:getChildByPath(panel,"bg_name2")
    local btn_guanzhan = TFDirector:getChildByPath(panel,"btn_guanzhan")
    local txt_battletime = TFDirector:getChildByPath(panel,"txt_battletime")
    btn_guanzhan.warId = fightInfo.warId
    self:setGuildInfo( panel_def ,fightInfo.atkGuildId ,fightInfo.atkPeakAddition )
    self:setGuildInfo( panel_atk ,fightInfo.defGuildId ,fightInfo.defPeakAddition )
    if fightInfo.atkGuildId == fightInfo.winGuildId then
        panel_def:setTexture("ui_new/Zhenbashai/img_shengzuo.png")
        panel_atk:setTexture("ui_new/Zhenbashai/img_fuyou.png")
    else
        panel_def:setTexture("ui_new/Zhenbashai/img_fuzuo.png")
        panel_atk:setTexture("ui_new/Zhenbashai/img_shengyou.png")
    end
    local interval = MainPlayer:getNowtime() - fightInfo.createTime/1000
    local min = interval/60
    txt_battletime:setText(stringUtils.format(localizable.common_min_befor,math.floor(min)))
end

function CrossFightRecords:setGuildInfo( panel ,guildId ,peakAddition )
    local guildInfo = CrossGuildBattleManager:getGuildInfoInCityBattleInfoById( guildId )
    if guildInfo == nil then
        panel:setVisible(false)
        return
    end
    panel:setVisible(true)
    local txt_name = TFDirector:getChildByPath(panel,"txt_bpm")
    txt_name:setText(guildInfo.guildName)
    local txt_fwq = TFDirector:getChildByPath(panel,"txt_fwq")
    txt_fwq:setText(guildInfo.serverName)
    local img_qizhi = TFDirector:getChildByPath(panel,"img_qizhi")
    img_qizhi:setTexture(FactionManager:getGuildBannerBgPath(guildInfo.bannerId))
    local img_biaozhi = TFDirector:getChildByPath(panel,"img_biaozhi")
    img_biaozhi:setTexture(FactionManager:getGuildBannerIconPath(guildInfo.bannerId))

    local panel_buff = TFDirector:getChildByPath(panel,"panel_buff")
    if peakAddition == nil or peakAddition <= 0 then
        panel_buff:setVisible(false)
        return
    end
    panel_buff:setVisible(false) -- pck tag 2017.2.15
    local btn_buff = TFDirector:getChildByPath(panel,"btn_buff")
    local txt_buff = TFDirector:getChildByPath(panel,"txt_num")
    btn_buff.addNum = peakAddition
    btn_buff:addMEListener(TFWIDGET_CLICK,audioClickfun(self.btnBuffClick))
    txt_buff:setText(peakAddition * 0.01 .. '%')
    btn_buff:setVisible(false)
    txt_buff:setVisible(false)
end

function CrossFightRecords.numberOfCellsInTableView(table)
    local self = table.logic
    local num = 0
    if self.selectId == 1 then
        if CrossGuildBattleManager.guildBattleWarInfos and CrossGuildBattleManager.guildBattleWarInfos.all then
            num = #CrossGuildBattleManager.guildBattleWarInfos.all
        end
    elseif self.selectId == 2 then
        if CrossGuildBattleManager.guildBattleWarInfos and CrossGuildBattleManager.guildBattleWarInfos.own then
            num = #CrossGuildBattleManager.guildBattleWarInfos.own
        end
    end
    return num
end

function CrossFightRecords.tableScroll(table)
    local self = table.logic
    local currPosY = self.tableView:getContentOffset().y
    local sizeHeight = self.tableView:getContentSize().height
    local size = self.tableView:getSize().height
    -- local initY = sizeHeight - 60*5 + 2
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

function CrossFightRecords.btnBuffClick( btn )
    local num = btn.addNum or 0
    PeakManager:openBuffLayer0(num)
end

return CrossFightRecords