--[[
******英雄大会-记录*******

    -- by jiawei.miao
    -- 2018/1/5
]]
local HeroRecordLayer = class("HeroRecordLayer", BaseLayer);

CREATE_SCENE_FUN(HeroRecordLayer);
CREATE_PANEL_FUN(HeroRecordLayer);

function HeroRecordLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.hero.HeroRecord");
end

function HeroRecordLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function HeroRecordLayer:refreshUI()

end

function HeroRecordLayer:initUI(ui)
    self.super.initUI(self,ui);

    self.mygruop = HeroMeetingManager:GetMyGroup()
    self.MasterIndex = self.mygruop
    print("init",self.MasterIndex,self.mygruop)

    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close')

    self.panel_gaoshou  = TFDirector:getChildByPath(ui, 'panel_gaoshou')
    local panel_geren   = TFDirector:getChildByPath(ui, 'panel_geren')

    self.panel_list2    = TFDirector:getChildByPath(panel_geren, 'panel_list')
    self.panel_list     = TFDirector:getChildByPath(self.panel_gaoshou, 'panel_list')

    self.tab            = {}
    for i = 1, 2 do
        local tab       = TFDirector:getChildByPath(ui, 'tab'..i)
        self.tab[i]     = tab 
    end
    self.tab2           = {}
    for i = 1, 4 do
        local tab       = TFDirector:getChildByPath(self.panel_gaoshou, 'tab_'..i)
        self.tab2[i]    = tab 
        self.tab2[i].img_sz     = TFDirector:getChildByPath(self.tab2[i], 'img_sz')
        self.tab2[i].img_sz:setVisible(false)
    end

    self.GroupRecord = {}
    self.MyRecord = {}
    self.MyRecord.reports = {}
    self.myLength = 0
    self.MyRecord.GetRecord = false
    for i = 1, 4 do
        self.GroupRecord[i] = {}
        self.GroupRecord[i].reports = {}
        self.GroupRecord[i].GetRecord = false
    end

    self.masterLength = 0

    self.bg = createUIByLuaNew("lua.uiconfig_mango_new.hero.HeroRecordCell1")
    self.bg2 = createUIByLuaNew("lua.uiconfig_mango_new.hero.HeroRecordCell2")
    self.bg:retain()
    self.bg:removeFromParent()
    self.bg:setVisible(false)
    self.bg2:retain()
    self.bg2:removeFromParent()
    self.bg2:setVisible(false)
    self:refreshList()
    self.tab2[self.mygruop].img_sz:setVisible(true)

    self:selectMasterTab(self.mygruop)
    self:selectTab(1)
end

function HeroRecordLayer:removeUI()
    if self.bg then
        self.bg:release()
        self.bg = nil
    end
    if self.bg2 then
        self.bg2:release()
        self.bg2 = nil
    end
    self.super.removeUI(self);
end

function HeroRecordLayer:ResetTab()
    for i = 1, 2 do
        self.tab[i]:setTextureNormal("ui_new/spectrum/tab_tab"..i..".png")
        self.tab[i]:setTouchEnabled(true)
    end
end

function HeroRecordLayer:ResetMasterTab()
    for i = 1, 4 do
        self.tab2[i]:setTextureNormal("ui_new/hero/tab_"..i..".png")
        self.tab2[i]:setTouchEnabled(true)
    end
end

function HeroRecordLayer:refreshList()
    if self.RecordList ~= nil then
        self.RecordList:removeFromParent()
        self.RecordList = nil
    end
    self.RecordList = TFTableView:create()
    self.RecordList.logic = self
    local Size = self.panel_list:getSize()
    self.RecordList:setTableViewSize(CCSizeMake(Size.width, Size.height))
    self.RecordList:setDirection(TFTableView.TFSCROLLVERTICAL)
    self.RecordList:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

    self.RecordList:addMEListener(TFTABLEVIEW_SIZEFORINDEX, HeroRecordLayer.cellSizeForTable)
    self.RecordList:addMEListener(TFTABLEVIEW_SIZEATINDEX, HeroRecordLayer.tableCellAtIndex)
    self.RecordList:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, HeroRecordLayer.numberOfCellsInTableView)
    self.panel_list:addChild(self.RecordList)
    self.RecordList:reloadData()
    if self.RecordList2 ~= nil then
        self.RecordList2:removeFromParent()
        self.RecordList2 = nil 
    end
    self.RecordList2 = TFTableView:create()
    self.RecordList2.logic = self

    local Size = self.panel_list2:getSize()
    self.RecordList2:setTableViewSize(CCSizeMake(Size.width, Size.height))
    self.RecordList2:setDirection(TFTableView.TFSCROLLVERTICAL)
    self.RecordList2:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

    self.RecordList2:addMEListener(TFTABLEVIEW_SIZEFORINDEX, HeroRecordLayer.cellSizeForTable2)
    self.RecordList2:addMEListener(TFTABLEVIEW_SIZEATINDEX, HeroRecordLayer.tableCellAtIndex2)
    self.RecordList2:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, HeroRecordLayer.numberOfCellsInTableView2)
    self.panel_list2:addChild(self.RecordList2)
    self.RecordList2:reloadData()
end

function HeroRecordLayer.cellSizeForTable(table,idx)
    return 140,754
end
function HeroRecordLayer.numberOfCellsInTableView(table,idx)
    local self = table.logic
    -- print("#self.GroupRecord[self.MasterIndex].reports",#self.GroupRecord[self.MasterIndex].reports)
    return self.masterLength
end

function HeroRecordLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.bg:clone()
        panel:setVisible(true)
        cell.panel = panel
        cell:addChild(panel)
    end

    cell.panel:setPosition(ccp(-20,0))
    self:setCellData(cell.panel,idx + 1)
    return cell
end

function HeroRecordLayer:setCellData(panel,index)
    local info = self.GroupRecord[self.MasterIndex].reports[self.masterLength - index + 1]
    if info == nil then
        panel:setVisible(false)
        return
    else
        panel:setVisible(true)
    end

    local Isf = false

    if info.targetRole.playerGroup == self.MasterIndex then
        Isf = true
    else
        Isf = false
    end

    for i = 1, 2 do
        local roleinfo
        if Isf == false then
            if i == 1 then
                roleinfo = info.fromRole
            else
                roleinfo = info.targetRole
            end 
        else
            if i == 2 then
                roleinfo = info.fromRole
            else
                roleinfo = info.targetRole
            end 
        end
        local bg_name   = TFDirector:getChildByPath(panel, "bg_name"..i)
        local txt_name  = TFDirector:getChildByPath(bg_name, 'txt_name')
        local txt_zhandouli     = TFDirector:getChildByPath(bg_name, 'txt_zhandouli')
        local txt_jifen         = TFDirector:getChildByPath(bg_name, 'txt_jifen')
        local txt_paiming       = TFDirector:getChildByPath(bg_name, 'txt_paiming')
        local icon_up           = TFDirector:getChildByPath(bg_name, 'icon_up')
        local txt_wsb           = TFDirector:getChildByPath(bg_name, 'txt_wsb')
        local img_biaoqian      = TFDirector:getChildByPath(bg_name, 'img_biaoqian')
        if i == 2 then
            img_biaoqian:setTexture("ui_new/hero/img_bq"..(roleinfo.playerGroup + 4)..".png")
        end
        local bpname =self:StringToTable(roleinfo.serverName)
        txt_name:setText(bpname..roleinfo.playerName)
        txt_zhandouli:setText(roleinfo.playerPower)
        txt_jifen:setText(roleinfo.playerScore)
        txt_paiming:setText(roleinfo.playerRank)

        if roleinfo.playerRank == 0 then
            txt_paiming:setText("")
            txt_wsb:setVisible(true)
        else
            txt_wsb:setVisible(false)
        end
        if roleinfo.playerOldRank == roleinfo.playerRank then
            icon_up:setVisible(false)
            txt_paiming:setColor(ccc3(255,255,255))       
        elseif roleinfo.playerOldRank > roleinfo.playerRank or roleinfo.playerOldRank == 0 then
            icon_up:setVisible(true)
            icon_up:setTexture("ui_new/roleequip/js_jts_icon.png")
            txt_paiming:setColor(ccc3(127,255,0))
        else
            icon_up:setVisible(true)
            icon_up:setTexture("ui_new/roleequip/js_jtx_icon.png")
            txt_paiming:setColor(ccc3(220,20,60))                    
        end
    end

    local img_tzshengli = TFDirector:getChildByPath(panel, 'img_tzshengli')
    if Isf == false then
        if info.win == true then
            img_tzshengli:setTexture("ui_new/spectrum/img_tzshengli.png")
        else
            img_tzshengli:setTexture("ui_new/spectrum/img_tzshibai.png")
        end
    else
        if info.win == true then
            img_tzshengli:setTexture("ui_new/spectrum/img_fssb.png")
        else
            img_tzshengli:setTexture("ui_new/spectrum/img_fssl.png")
        end
    end

    local btn_guanzhan  = TFDirector:getChildByPath(panel, 'btn_guanzhan')

    btn_guanzhan:addMEListener(TFWIDGET_CLICK,
    audioClickfun(function()
        showLoading()
        TFDirector:send(c2s.GET_HERO_DUEL_VIDEO_REQUEST, {info.reportId})
    end))
    local txt_battletime = TFDirector:getChildByPath(panel, 'txt_battletime')
    local time = info.time
    time = math.ceil(time/1000)
    time = MainPlayer:getNowtime() - time
    txt_battletime:setText(getTimeString(time))
end

function HeroRecordLayer.cellSizeForTable2(table,idx)
    return 148,754
end
function HeroRecordLayer.numberOfCellsInTableView2(table,idx)
    local self = table.logic
    return self.myLength
end

function HeroRecordLayer.tableCellAtIndex2(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.bg2:clone()
        panel:setVisible(true)
        cell.panel = panel
        cell:addChild(panel)
    end

    cell.panel:setPosition(ccp(-20,-20))

    self:setCellData2(cell.panel,idx + 1)

    return cell
end

function HeroRecordLayer:setCellData2(panel,index)
    local info = self.MyRecord.reports[self.myLength-index+1]
    if info == nil then
        panel:setVisible(false)
        return
    else
        panel:setVisible(true)
    end
    local txt_name  = TFDirector:getChildByPath(panel, 'txt_name')
    local txt_bp_name       = TFDirector:getChildByPath(panel, 'txt_bp_name')
    local txt_zhandouli     = TFDirector:getChildByPath(panel, 'txt_zhandouli')
    local img_win           = TFDirector:getChildByPath(panel, 'img_win')
    local txt_paiming       = TFDirector:getChildByPath(panel, 'txt_paiming')
    local icon_up           = TFDirector:getChildByPath(panel, 'icon_up')
    local img_biaoqian           = TFDirector:getChildByPath(panel, 'img_biaoqian')
    local bpname =self:StringToTable(info.serverName)
    txt_name:setText(bpname..info.targetName)
    txt_zhandouli:setText(info.targetPower)
    if info.targetGuildName ~= "" then
        txt_bp_name:setText(info.targetGuildName)
    else
        txt_bp_name:setText(localizable.common_no)
    end
    if info.win == true then
        img_win:setTexture("ui_new/hero/img_sheng.png")
    else
        img_win:setTexture("ui_new/hero/img_fu.png")
    end
    img_biaoqian:setTexture("ui_new/hero/img_bq"..(info.targetGroup + 4)..".png")

    if info.fromRank == info.oldRank then
        icon_up:setVisible(false)
        txt_paiming:setColor(ccc3(61,61,61))
        txt_paiming:setText(localizable.HERO_RANK_INVARIANT)
    elseif info.fromRank < info.oldRank or info.oldRank == 0 then
        txt_paiming:setColor(ccc3(14,110,0))
        icon_up:setVisible(true)
        icon_up:setTexture("ui_new/roleequip/js_jts_icon.png")
        txt_paiming:setText(stringUtils.format(localizable.HERO_RANK_UP,info.oldRank,info.fromRank))
        if info.oldRank == 0 then
            txt_paiming:setText(stringUtils.format(localizable.HERO_RANK_UP,localizable.houshanRank_rank,info.fromRank))
        end
    else
        icon_up:setVisible(true)
        icon_up:setTexture("ui_new/roleequip/js_jtx_icon.png")
        txt_paiming:setColor(ccc3(220,20,60))
        txt_paiming:setText(stringUtils.format(localizable.HERO_RANK_DOWN,info.oldRank,info.fromRank))
        if info.fromRank == 0 then
            txt_paiming:setText(stringUtils.format(localizable.HERO_RANK_UP,localizable.houshanRank_rank,localizable.houshanRank_rank))
        end
    end

    local btn_guanzhan  = TFDirector:getChildByPath(panel, 'btn_guanzhan')

    btn_guanzhan:addMEListener(TFWIDGET_CLICK,
    audioClickfun(function()
        showLoading()
        TFDirector:send(c2s.GET_HERO_DUEL_VIDEO_REQUEST, {info.reportId})
    end))

    local btn_fanji     = TFDirector:getChildByPath(panel, 'btn_fanji')

    --btn_fanji:setGrayEnabled(not info.back)
    if info.back == false then 
        btn_fanji:setTextureNormal("ui_new/hero/btn_fjhuise.png")
    else
        btn_fanji:setTextureNormal("ui_new/hero/btn_fj.png")
    end
    btn_fanji:setTouchEnabled(info.back)
    btn_fanji:addMEListener(TFWIDGET_CLICK,
    audioClickfun(function()
        if not MainPlayer:isEnoughTimes(EnumRecoverableResType.HERO,1, true) then
            return ;
        end
        if info.back == true then
            --info.back = false
            -- btn_fanji:setTextureNormal("ui_new/hero/btn_fjhuise.png")
            -- btn_fanji:setTouchEnabled(info.back)
            HeroMeetingManager:showDetail(info.targetId)
            HeroMeetingManager.reportId = info.reportId
            --HeroMeetingManager:challengePlayer(info.targetId, info.reportId)
        end
    end))

    local txt_battletime = TFDirector:getChildByPath(panel, 'txt_battletime')
    local time = info.time
    time = math.ceil(time/1000)
    time = MainPlayer:getNowtime() - time
    txt_battletime:setText(getTimeString(time))
end

--选择标签
function HeroRecordLayer:selectTab(index)
    self:ResetTab()
    self.tab[index]:setTextureNormal("ui_new/spectrum/tab_tab"..index.."h.png")
    self.tab[index]:setTouchEnabled(false)
    if index == 1 then
        self.panel_gaoshou:setVisible(true)
        self.panel_list2:setVisible(false)
        self.RecordList:setVisible(true)
        self.RecordList2:setVisible(false)
    elseif index == 2 then
        self.panel_gaoshou:setVisible(false)
        self.panel_list2:setVisible(true)
        self.RecordList:setVisible(false)
        self.RecordList2:setVisible(true)
        if self.MyRecord.GetRecord == false then
            HeroMeetingManager:GetHeroDuelMyReportRequest()
        end
    end
end

--选择高手对决所在组标签
function HeroRecordLayer:selectMasterTab(index)
    self:ResetMasterTab()
    self.MasterIndex = index
    self.tab2[index]:setTextureNormal("ui_new/hero/tab_"..index.."h.png")
    self.tab2[index]:setTouchEnabled(false)

    if self.GroupRecord[index].GetRecord == false then
        HeroMeetingManager:GetHeroDuelReportRequest(index)
    end
    self.masterLength = #self.GroupRecord[self.MasterIndex].reports
    self:refreshList()
end

function HeroRecordLayer:registerEvents()
    self.super.registerEvents(self);

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    for i = 1,2 do
        self.tab[i].logic = self
    end

    self.tab[1]:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.MasterClickHandle,self)))
    self.tab[2]:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.PersonalClickHandle,self)))

    for i = 1,4 do
        self.tab2[i].logic = self
        self.tab2[i].index = i
        self.tab2[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.MasterTabClickHandle),self)
    end

    self.receiveInfo = function(event)   
        print("!!!!!!!!!!!!!!!!!!!!!",event.data)  
        self.MyRecord.reports = event.data[1][1] or {}
        self.myLength = #self.MyRecord.reports
        self.MyRecord.GetRecord = true
        self:refreshList()
    end
    --我的战报
    TFDirector:addMEGlobalListener(HeroMeetingManager.MyReport, self.receiveInfo)

    self.receiveInfo1 = function(event)  
        print("HeroMeetingManager.MasterReport",event)
        self.GroupRecord[self.MasterIndex].reports = event.data[1][1] or {}
        self.masterLength = #self.GroupRecord[self.MasterIndex].reports
        self.GroupRecord[self.MasterIndex].GetRecord = true
        self:refreshList()
    end
    --高手战报
    TFDirector:addMEGlobalListener(HeroMeetingManager.MasterReport, self.receiveInfo1)
    
end

function HeroRecordLayer.MasterTabClickHandle(sender)
    local self = sender.logic
    self:selectMasterTab(sender.index)
    self:refreshList()
end

function HeroRecordLayer.MasterClickHandle(sender)
    local self = sender.logic
    self:selectTab(1)
end

function HeroRecordLayer.PersonalClickHandle(sender)
    local self = sender.logic
    self:selectTab(2)
end

function HeroRecordLayer:removeEvents()
    TFDirector:removeMEGlobalListener(HeroMeetingManager.MyReport, self.receiveInfo)
    self.receiveInfo = nil

    TFDirector:removeMEGlobalListener(HeroMeetingManager.MasterReport, self.receiveInfo1)
    self.receiveInfo1 = nil

    self.super.removeEvents(self);
end

function HeroRecordLayer:StringToTable(s)  
    local index ,_ ,str = string.find(s,"(%w+)")
    if index and index <= 1 then
        return str
    else
        return ""
    end
    
end
return HeroRecordLayer;
