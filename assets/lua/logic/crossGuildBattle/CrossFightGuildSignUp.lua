-- client side CrossFightGuildSignUp.lua
--[[
 * @Description: 跨服争锋战报名
 ]]
-- script writer Stephen.tao
-- creation time 2016-05-24

local CrossFightGuildSignUp = class("CrossFightGuildSignUp",BaseLayer)

function CrossFightGuildSignUp:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossfight.CrossFightSignUp")
    self.isfirst = true
end

function CrossFightGuildSignUp:initUI( ui )

	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_return")
    self.btn_juezhu = TFDirector:getChildByPath(ui, "btn_juezhu")
    self.panel_list = TFDirector:getChildByPath(ui, "panel_bp")
    self.img_lineshang = TFDirector:getChildByPath(ui, "img_lineshang")
    self.img_linedi = TFDirector:getChildByPath(ui, "img_linedi")
    self.img_lineshang:setVisible(false)

    self.panel_bpmingzi = TFDirector:getChildByPath(ui, "panel_bpmingzi1")
    self.panel_bpmingzi:retain()
    self.panel_bpmingzi:removeFromParent(true)
    self.panel_bpmingzi:setVisible(false)

    self:createTableView()
end


function CrossFightGuildSignUp:setCityId( cityId )
    self.cityId = cityId
    local cityInfo = CrossGuildBattleCityData:objectByID(cityId)
    if cityInfo == nil then
        print("cityInfo ===== nil  cityId = ",cityId)
        return
    end
    local txt_sl = TFDirector:getChildByPath(self.ui, "txt_sl")
    local img_di = TFDirector:getChildByPath(self.ui, "img_di")
    local txt_miaoshu = TFDirector:getChildByPath(self.ui, "txt_miaoshu")
    txt_sl:setText(cityInfo.score)
    txt_miaoshu:setText(cityInfo.describe)
    if cityInfo.icon then
        -- print("cityInfo.icon = ",cityInfo.icon)
        img_di:setTexture(cityInfo.icon)
    end
    self.tableView:reloadData()

    local txt_suoxu2 = TFDirector:getChildByPath(self.btn_juezhu, "txt_suoxu2")
    if self.applyTimer then
        TFDirector:removeTimer(self.applyTimer)
        self.applyTimer = nil
        self.lastApplyTime = 0
    end
    txt_suoxu2:setVisible(false)

    if CrossGuildBattleManager.cityInfo and CrossGuildBattleManager.cityInfo.lastUpdateTime then
        local applyInterval = 60*ConstantData:objectByID("CrossGuildBattleManager.applyInterval").value
        local interval = MainPlayer:getNowtime() - math.floor(CrossGuildBattleManager.cityInfo.lastUpdateTime/1000)
        -- print("MainPlayer:getNowtime()",MainPlayer:getNowtime())
        -- print("CrossGuildBattleManager.cityInfo.lastUpdateTime",math.floor(CrossGuildBattleManager.cityInfo.lastUpdateTime/1000))
        -- print("interval",interval)
        if interval >= applyInterval then
            return
        else
            self.lastApplyTime = applyInterval - interval
            self.applyTimer = TFDirector:addTimer(1000,-1,nil,function ()
                self.lastApplyTime = self.lastApplyTime - 1
                if self.lastApplyTime <= 0 then
                    txt_suoxu2:setVisible(false)
                    TFDirector:removeTimer(self.applyTimer)
                    self.applyTimer = nil
                    return
                end
                txt_suoxu2:setText(self:getApplyIntervalTimeDes(self.lastApplyTime))
            end)
            txt_suoxu2:setVisible(true)
            txt_suoxu2:setText(self:getApplyIntervalTimeDes(self.lastApplyTime))
        end
    end
end

function CrossFightGuildSignUp:getApplyIntervalTimeDes( times )
    local min = math.floor(times/60)
    local sec = times - min*60
    local time_str =  "00:"..string.format("%02d",min)..":"..string.format("%02d",sec)
    return stringUtils.format(localizable.CrossFightBattle_ApplyInterVal_Txt,time_str)
end

function CrossFightGuildSignUp:removeUI()
	self.super.removeUI(self)
    if self.panel_bpmingzi then
        self.panel_bpmingzi:release()
        self.panel_bpmingzi = nil
    end
end

function CrossFightGuildSignUp:onShow()
    self.super.onShow(self)
    if self.isfirst then
        self.isfirst = false
        self.ui:runAnimation("Action0",1)
    end
end

function CrossFightGuildSignUp:createTableView()
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
end

function CrossFightGuildSignUp:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    self.btn_juezhu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnGuildApplyClickHandle))
    self.btn_juezhu.logic = self
end

function CrossFightGuildSignUp:removeEvents()

    self.super.removeEvents(self)
    if self.applyTimer then
        TFDirector:removeTimer(self.applyTimer)
        self.applyTimer = nil
        self.lastApplyTime = 0
    end

    self.isfirst = true
end

function CrossFightGuildSignUp:dispose()
	self.super.dispose(self)
end

function CrossFightGuildSignUp.btnGuildApplyClickHandle(btn)
    local self = btn.logic
    if self.lastApplyTime and self.lastApplyTime > 0 then
        toastMessage(self:getApplyIntervalTimeDes(self.lastApplyTime))
        return
    end
    CrossGuildBattleManager:updateCity( self.cityId )
end

function CrossFightGuildSignUp.cellSizeForTable(table,idx)
    return 70,450
end

function CrossFightGuildSignUp.numberOfCellsInTableView(table)
    local num = 0
    if CrossGuildBattleManager.cityInfo and CrossGuildBattleManager.cityInfo.infos then
        num = #CrossGuildBattleManager.cityInfo.infos
    end
    return math.ceil(num/2)
end

function CrossFightGuildSignUp.tableCellAtIndex(table, idx)

    local self = table.logic;
    
    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        for i=1,2 do
            local panel = self.panel_bpmingzi:clone()
            panel:setPosition(ccp(((i-1)*220 + 14),0))
            panel:setVisible(true)
            cell:addChild(panel)
            cell.panel = cell.panel or {}
            cell.panel[i] = panel
        end
    end
    for i=1,2 do
        local panel = cell.panel[i]
        local index = idx*2+i
        if index <= #CrossGuildBattleManager.cityInfo.infos then
            local guildInfo = CrossGuildBattleManager.cityInfo.infos[index]
            panel:setVisible(true)
            self:setPanelGuildInfo(panel,guildInfo)
        else
            panel:setVisible(false)
        end
    end
    return cell
end

function CrossFightGuildSignUp:setPanelGuildInfo( panel , guildInfo )
    local lbGuildName = TFDirector:getChildByPath(panel,"txt_bm")
    lbGuildName:setText(guildInfo.guildName)
    local lbServerName = TFDirector:getChildByPath(panel,"txt_fwq")
    lbServerName:setText(guildInfo.serverName)
    local img_qizhi = TFDirector:getChildByPath(panel,"img_qizhi")
    img_qizhi:setTexture(FactionManager:getGuildBannerBgPath(guildInfo.bannerId))
    local img_biaozhi = TFDirector:getChildByPath(panel,"img_biaozhi")
    img_biaozhi:setTexture(FactionManager:getGuildBannerIconPath(guildInfo.bannerId))
end

function CrossFightGuildSignUp.tableScroll(table)
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
return CrossFightGuildSignUp