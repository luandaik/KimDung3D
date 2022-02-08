-- client side SevenDaysRankLayer.lua
--[[
 * @Description: HD开服大比拼
 ]]
-- script writer wuqi
-- creation time 2016-11-25

local SevenDaysRankLayer = class("SevenDaysRankLayer", BaseLayer)

CREATE_SCENE_FUN(SevenDaysRankLayer)
CREATE_PANEL_FUN(SevenDaysRankLayer)

SevenDaysRankLayer.ActivityNum = 3

local pathMyInfo = {
    "ui_new/operatingactivities/img_wodedengji.png",
    "ui_new/operatingactivities/img_wodezhanli.png",
    "ui_new/operatingactivities/img_wodechongzhi.png",
}

local path_temp = {
    [1] = "Panel_1stjiangli",
    [2] = "Panel_2edjiangli",
    [3] = "Panel_3rdjiangli"
}

SevenDaysRankLayer.txt_can_lingqu_tab = {
    localizable.SevenDaysRankLayer_txt_can_lingqu1,
    localizable.SevenDaysRankLayer_txt_can_lingqu2,
    localizable.SevenDaysRankLayer_txt_can_lingqu3,
} 

SevenDaysRankLayer.txt_rank_shuoming = {
    localizable.SevenDaysRankLayer_txt_shuoming1,
    localizable.SevenDaysRankLayer_txt_shuoming2,
    localizable.SevenDaysRankLayer_txt_shuoming3,
} 

SevenDaysRankLayer.txt_rank_xiangxi = {
    localizable.SevenDaysRankLayer_txt_xiangxi1,
    localizable.SevenDaysRankLayer_txt_xiangxi2,
    localizable.SevenDaysRankLayer_txt_xiangxi3,
} 

function SevenDaysRankLayer:ctor(data)
    self.super.ctor(self, data)
    self.selectedtype = 1
    self:init("lua.uiconfig_mango_new.KaiFuBiPin.KaiFuMain")
end

function SevenDaysRankLayer:initUI(ui)
    self.super.initUI(self, ui)

    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.SevenDayRank,{HeadResType.COIN,HeadResType.SYCEE})

    self.Panel_leftbtn = TFDirector:getChildByPath(ui, "Panel_leftbtn")

    self.img_xuanchuan = TFDirector:getChildByPath(ui, "img_xuanchuan")

    self.Panel_xuanchuanzuo = TFDirector:getChildByPath(ui, "Panel_xuanchuanzuo")
    self.Panel_xuanchuanyou = TFDirector:getChildByPath(ui, "Panel_xuanchuanyou")

    self.img_dengjibg = TFDirector:getChildByPath(ui, "img_dengjibg")
    self.img_wodedengji = TFDirector:getChildByPath(self.img_dengjibg, "img_wodedengji")
    self.txt_dengji = TFDirector:getChildByPath(self.img_dengjibg, "txt_dengji")
    self.img_paimingbg = TFDirector:getChildByPath(ui, "img_paimingbg")
    self.txt_myRank = TFDirector:getChildByPath(self.img_paimingbg, "txt_dengji")
    
    self.panel_cell = TFDirector:getChildByPath(ui, "img_123jiangli")
    self.panel_cell:retain()
    self.panel_cell:removeFromParent()
    self.panel_cell:setVisible(false)

    self.Panel_bg = TFDirector:getChildByPath(ui, "Panel_cell")

    self.txt_jishi  = TFDirector:getChildByPath(ui, 'txt_jishi')
    self.txt_timecount = TFDirector:getChildByPath(self.txt_jishi, 'txt_time')

    self.panel_good_reward = {}
    for i = 1, 3 do
        self.panel_good_reward[i] = TFDirector:getChildByPath(self.Panel_xuanchuanzuo, path_temp[i]) 
    end

    self.Panel_xuanchuanyou.txt_title = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "txt_title")
    self.Panel_xuanchuanyou.bg_icon = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "bg_icon")
    self.Panel_xuanchuanyou.img_icon = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "img_icon")
    self.Panel_xuanchuanyou.txt_number1 = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "txt_number1")
    self.Panel_xuanchuanyou.txt_number2 = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "txt_number2")
    self.Panel_xuanchuanyou.txt_num = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "txt_num")
    self.btn_lingqu = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "btn_lingqu")
    self.btn_lingqu.logic = self

    self.txt_panel_name = TFDirector:getChildByPath(ui, "txt_panel_name")
end

function SevenDaysRankLayer:initActivitiesButtons()
    if not self.tableView then
        local tableView =  TFTableView:create()
        tableView:setName("btnTableView")
        tableView:setTableViewSize(self.Panel_leftbtn:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(0)
        self.tableView = tableView
         
        self.tableView.logic = self
        tableView:addMEListener(TFTABLEVIEW_TOUCHED, self.tableCellTouched)
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
        self.Panel_leftbtn:addChild(tableView)
        tableView:setPosition(ccp(0, 0))
    end
    self.tableView:reloadData()
end

function SevenDaysRankLayer.tableCellTouched(table, cell)
    local self = table.logic
    local idx = cell:getIdx() + 1
    play_press()
    self:select(idx)
end

function SevenDaysRankLayer:select(index, isFirst)
    if isFirst then
        self.selectedtype = index
        SevenDayRankManager:requestRankList(index)
        return
    end
    if self.selectedtype and index == self.selectedtype then
        return
    end
    self.selectingIdx = index
    SevenDayRankManager:requestRankList(index)
end

function SevenDaysRankLayer.cellSizeForTable(table, idx)
    if idx == 0 then
        return 120, 429
    end
    return 90, 429
end

function SevenDaysRankLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    local self = table.logic
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        local equip_panel = require('lua.logic.sevendays.ActivitiesButtonKaiFu'):new()
        equip_panel:setLogic(self)
        cell:addChild(equip_panel)
        cell.equip_panel = equip_panel
        equip_panel:setPosition(ccp(-33, -10))
    end
    cell.equip_panel:setTitle(SevenDayRankManager.TitleName[idx + 1], idx + 1)
    cell.equip_panel:setMultiServer(false)

    CommonManager:setRedPoint(cell.equip_panel, SevenDayRankManager:checkRedByIndex(idx + 1), "isHaveSevenRankCanGet", ccp(-145,50))

    if idx == 0 then
        cell.equip_panel:setPositionY(-10)
    end
    return cell
end

function SevenDaysRankLayer.numberOfCellsInTableView(table)
    local self = table.logic
    return self.ActivityNum
end

function SevenDaysRankLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();
    self:refreshUI()
end

function SevenDaysRankLayer:refreshUI()
    local status, curDay = SevenDayRankManager:getOpenSatus()
    self.curDay = curDay
    self.status = status

    if SevenDayRankManager.IS_TEST then
        print("status, curDay ==>> ", status, curDay)
    end

    if self.status == SevenDayRankManager.EnumOpenStatus.CLOSE then
        toastMessage(localizable.treasureMain_tiemout)
        AlertManager:close()
        return
    end

    self:initActivitiesButtons()

    self:refreshLeftRewardPanel()
    self:refreshRightRewardPanel()

    self:refreshRankPanel()
end

function SevenDaysRankLayer:refreshIcon1(node, item, data)
    local txt_name = TFDirector:getChildByPath(node, "txt_name")
    local txt_number = TFDirector:getChildByPath(node, "txt_number")
    txt_number:setVisible(true)
    txt_number:setText("X" .. data.number)
    --txt_name:setText(item.name)
    txt_name:setVisible(false)
    node:setTexture(item:GetPath())

    node:setTouchEnabled(true)
    node:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            Public:ShowItemTipLayer(data.itemid, data.type)
        end)
    )
end

function SevenDaysRankLayer:refreshIcon2(node, item)
    local txt_name = TFDirector:getChildByPath(node, "txt_name")
    local img_pinzhiditu = TFDirector:getChildByPath(node, "img_pinzhiditu")
    local img_touxiang = TFDirector:getChildByPath(node, "img_touxiang")
    local txt_number = TFDirector:getChildByPath(node, "txt_number")
    txt_number:setVisible(true)
    txt_number:setText("X" .. item.number)
    --txt_name:setText(item.name)
    txt_name:setVisible(false)
    img_pinzhiditu:setTexture( GetColorKuangByQuality(item.quality) )
    img_touxiang:setTexture(item.path)

    node:setTouchEnabled(true)
    node:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            Public:ShowItemTipLayer(item.itemid, item.type)
        end)
    )
end

function SevenDaysRankLayer:refreshLeftRewardPanel()
    if (not SevenDayRankManager.rewardList) or (not SevenDayRankManager.rewardList[self.selectedtype]) then
        return
    end
    for i = 1, 3 do
        local node = self.panel_good_reward[i]
        local panel_card = TFDirector:getChildByPath(node, "panel_card")
        local img_zhuangbei = TFDirector:getChildByPath(node, "img_zhuangbei")

        local str = SevenDayRankManager.rewardList[self.selectedtype].reward1[i]
        local data = SevenDayRankManager:parseRewardStr(str)
        if data then
            local tType = data.type
            if tType == EnumDropType.GOODS then
                local item = ItemData:objectByID(data.itemid)
                if item.type == 1 then
                    img_zhuangbei:setVisible(true)
                    panel_card:setVisible(false)

                    self:refreshIcon1(img_zhuangbei, item, data)
                else
                    img_zhuangbei:setVisible(false)
                    panel_card:setVisible(true) 

                    self:refreshIcon2(panel_card, data)
                end
            else
                img_zhuangbei:setVisible(false)
                panel_card:setVisible(true)

                self:refreshIcon2(panel_card, data)
            end
        else
            img_zhuangbei:setVisible(false)
            panel_card:setVisible(false)
        end
    end
end

function SevenDaysRankLayer:refreshRightRewardPanel()
    if not SevenDayRankManager.rewardList[self.selectedtype] then
        return
    end
    local str1 = self.txt_can_lingqu_tab[self.selectedtype]
    local strData = SevenDayRankManager.rewardList[self.selectedtype].reward3
    local data = SevenDayRankManager:parseRewardStr(strData)
    local num = SevenDayRankManager.rewardList[self.selectedtype].condition or 0
    local curStep = SevenDayRankManager.curStep[self.selectedtype] or 0
    local state = SevenDayRankManager.rewardList[self.selectedtype].state or 0

    --print("refreshRightRewardPanel===>> ", data)
    if data then
        self.Panel_xuanchuanyou.txt_title:setText( stringUtils.format( str1, num ) )
        self.Panel_xuanchuanyou.bg_icon:setTextureNormal( GetColorIconByQuality_118( data.quality ) )
        self.Panel_xuanchuanyou.txt_num:setText( "X" .. data.number )
        --self.Panel_xuanchuanyou.txt_number:setText( string.format("(%d/%d)", curStep, num) )

        self.Panel_xuanchuanyou.txt_number1:setText(curStep)
        self.Panel_xuanchuanyou.txt_number2:setText('/' .. num)
        if curStep < num then
            self.Panel_xuanchuanyou.txt_number1:setColor( ccc3(255, 0, 0) )
        else
            self.Panel_xuanchuanyou.txt_number1:setColor( ccc3(255, 255, 255) )
        end 

        self.Panel_xuanchuanyou.img_icon:setTexture( data.path )
        Public:addPieceImg(self.Panel_xuanchuanyou.img_icon, data)

        self.Panel_xuanchuanyou.bg_icon:setTouchEnabled(true)
        self.Panel_xuanchuanyou.bg_icon:addMEListener(TFWIDGET_CLICK,
            audioClickfun(function()
                Public:ShowItemTipLayer(data.itemid, data.type)
            end)
        )
        if state == 1 then
            self.btn_lingqu:setGrayEnabled(false)
            self.btn_lingqu:setTouchEnabled(true)
            CommonManager:setRedPoint(self.btn_lingqu, true, "isHaveSevenRankCanGet", ccp(0, 0))
        else
            self.btn_lingqu:setGrayEnabled(true)
            self.btn_lingqu:setTouchEnabled(false)
            CommonManager:setRedPoint(self.btn_lingqu, false, "isHaveSevenRankCanGet", ccp(0, 0))
        end

        self.img_wodedengji:setTexture( pathMyInfo[self.selectedtype] )
        self.txt_dengji:setText(curStep)
    end
end

function SevenDaysRankLayer:removeUI()
    self.super.removeUI(self)
    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
end

function SevenDaysRankLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    self.super.dispose(self)
end

--注册事件
function SevenDaysRankLayer:registerEvents()
    self.super.registerEvents(self)
    if self.generalHead then
        self.generalHead:registerEvents()
    end

    self.btn_lingqu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onLingquClickHandle))

    local function sevenDayTimerEvent(sender)
        if sender == nil then
            return
        end
        local status = sender.status
        if status == SevenDayRankManager.EnumOpenStatus.OPEN then
            self.txt_jishi:setText(localizable.sevendays_activity_over)
        elseif status == SevenDayRankManager.EnumOpenStatus.DELAY then
            self.txt_jishi:setText(localizable.sevendays_getaward_over)
        elseif status == SevenDayRankManager.EnumOpenStatus.CLOSE then
            AlertManager:close()
            return
        end
        if self.txt_timecount then
            self.txt_timecount:setText(sender.desc1)
        end
        self.txt_jishi:setVisible(true)
        self.txt_timecount:setVisible(true)
    end
    SevenDayRankManager:addSevenDaysEvent(self, 2002, sevenDayTimerEvent)

    self.cbRankListLevel = function ( event )
        self.selectedtype = 1
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(SevenDayRankManager.RANKING_LIST_LEVEL, self.cbRankListLevel)
    self.cbRankListPower = function ( event )
        self.selectedtype = 2
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(SevenDayRankManager.RANKING_LIST_E, self.cbRankListPower)
    self.cbRankListRecharge = function ( event )
        self.selectedtype = 3
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(SevenDayRankManager.RANKING_LIST_RECHARGE, self.cbRankListRecharge)
    self.cbGetReward = function ( event )
        SevenDayRankManager:changeAwardGetState( self.selectedtype, 2 ) 
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(SevenDayRankManager.GET_MIN_RESPONSE, self.cbGetReward)

    self.cbStepChange = function ( event )
        local tType = event.data[1].tType
        if self.selectedtype == tType then
            self:refreshRightRewardPanel()
        end
    end
    TFDirector:addMEGlobalListener(SevenDayRankManager.NOTIFY_SEVEN_RANK_TASK_STEP, self.cbStepChange)

    self.cbDailyReset = function ( event )
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(MainPlayer.GAME_RESET, self.cbDailyReset)

    self.cbReset = function ( event )
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(SevenDayRankManager.BIG_COMPET_AWARD_ALL, self.cbReset)

    local index = self.selectedtype or 1
    self:select(index, true)
end

function SevenDaysRankLayer:removeEvents()
    self.super.removeEvents(self)

    if self.generalHead then
        self.generalHead:removeEvents()
    end

    SevenDayRankManager:removeOnlineRewardTimer(2002)

    TFDirector:removeMEGlobalListener(SevenDayRankManager.RANKING_LIST_LEVEL ,self.cbRankListLevel)
    self.cbRankListLevel = nil

    TFDirector:removeMEGlobalListener(SevenDayRankManager.RANKING_LIST_E, self.cbRankListPower)
    self.cbRankListPower = nil

    TFDirector:removeMEGlobalListener(SevenDayRankManager.RANKING_LIST_RECHARGE, self.cbRankListRecharge)
    self.cbRankListRecharge = nil

    TFDirector:removeMEGlobalListener(SevenDayRankManager.GET_MIN_RESPONSE, self.cbGetReward)
    self.cbGetReward = nil

    TFDirector:removeMEGlobalListener(SevenDayRankManager.NOTIFY_SEVEN_RANK_TASK_STEP, self.cbStepChange)
    self.cbStepChange = nil

    TFDirector:removeMEGlobalListener(MainPlayer.GAME_RESET, self.cbDailyReset)
    self.cbDailyReset = nil

    TFDirector:removeMEGlobalListener(SevenDayRankManager.BIG_COMPET_AWARD_ALL, self.cbReset)
    self.cbReset = nil
end

function SevenDaysRankLayer:refreshRankPanel()
    if not SevenDayRankManager.rankDataMap then
        return
    end
    local rankData = SevenDayRankManager.rankDataMap[self.selectedtype] or {}
    self.rankData = rankData.rankInfo or {}
    if not SevenDayRankManager.rankDataMap[self.selectedtype] then
        return
    end
    local rank = SevenDayRankManager.rankDataMap[self.selectedtype].myRanking or 0
    local str = rank
    if rank and rank == 0 then
        str = localizable.shalu_info_txt1
    end
    if rank > 50 then
        str = localizable.shalu_info_txt1
    end
    self.txt_myRank:setText( str )

    if not self.tableView_rank then
        local tableView = TFTableView:create()
        tableView:setTableViewSize(self.Panel_bg:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.tableView_rank = tableView
        self.tableView_rank.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable_rank)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex_rank)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView_rank)
        self.Panel_bg:addChild(self.tableView_rank, 1)
    end
    self.tableView_rank:reloadData()

    if #self.rankData < 1 then
        self.tableView_rank:setVisible(false)
        self.txt_panel_name:setVisible(true)
    else
        self.tableView_rank:setVisible(true)
        self.txt_panel_name:setVisible(false)
    end 
end

function SevenDaysRankLayer.numberOfCellsInTableView_rank(table)
    local self = table.logic
    return #self.rankData or 0
end

function SevenDaysRankLayer.cellSizeForTable_rank(table,idx)
    local self = table.logic
    if idx == #self.rankData - 1 then
        return 86, 600
    end
    return 86, 600
end

function SevenDaysRankLayer.tableCellAtIndex_rank(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local node = self.panel_cell:clone()
        node:setPosition(ccp(300, 43))
        node:setVisible(true)
        cell.node = node
        cell:addChild(node);
    end
    if idx == #self.rankData - 1 then
        cell.node:setPosition(ccp(300, 43))
    else
        cell.node:setPosition(ccp(300, 43))
    end
    self:showNode(cell.node, idx + 1)
    return cell
end

function SevenDaysRankLayer:showNode(widget, idx)
    local rewardInfo = self.rankData[idx]
    local temp1 = SevenDayRankManager.rewardList[self.selectedtype].reward2 or {}
    local temp2 = temp1[idx]
    if not temp2 then
        return
    end
    local strTab = string.split(temp2, "|")
    local rankData = self.rankData[idx]
    local data_reward = {}
    --local list = SevenDayRankManager:parseRewardStr(temp2)
    for i = 1, #strTab do
        if strTab[i] and strTab[i] ~= "" then
            data_reward[i] = SevenDayRankManager:parseRewardStr(strTab[i])
        end
    end
    -- for v in list:iterator() do
    --     table.insert(data_reward, v)
    -- end
    if not rewardInfo then
        widget:setVisible(false)
        return
    end
    widget:setVisible(true)

    local img_tubiao = TFDirector:getChildByPath(widget, 'img_tubiao')
    local txt_fenduan = TFDirector:getChildByPath(widget, 'txt_fenduan')
    local Panel_jiangliicon = TFDirector:getChildByPath(widget, 'Panel_jiangliicon')
    local bg_touxiang = TFDirector:getChildByPath(widget, 'bg_touxiang')
    local img_head = TFDirector:getChildByPath(bg_touxiang, 'img_head')
    local txt_playername = TFDirector:getChildByPath(widget, "txt_playername")
    local txt_mingci = TFDirector:getChildByPath(widget, "txt_mingci")
    local txt_shuoming = TFDirector:getChildByPath(widget, "txt_shuoming")
    local txt_xiangxi = TFDirector:getChildByPath(widget, "txt_xiangxi")

    local icon_tab = {}
    for i = 1, 3 do
        icon_tab[i] = TFDirector:getChildByPath(Panel_jiangliicon, "bg_icon" .. i)
        if i <= #data_reward and data_reward[i] then
            icon_tab[i]:setTextureNormal( ( GetColorIconByQuality_118( data_reward[i].quality ) ) )
            icon_tab[i]:setVisible(true)
            Public:loadIconNode(icon_tab[i], data_reward[i], true, true)
            icon_tab[i]:setTouchEnabled(true)
            icon_tab[i]:addMEListener(TFWIDGET_CLICK,
                audioClickfun(function()
                    Public:ShowItemTipLayer(data_reward[i].itemid, data_reward[i].type)
                end)
            )
        else
            icon_tab[i]:setVisible(false)
        end
    end

    local strPath = "ui_new/leaderboard/no1.png"
    txt_playername:setVisible(true)
    txt_playername:setText(rankData.name)

    if idx <= 3 then
        img_tubiao:setVisible(true)
        txt_fenduan:setVisible(false)
        bg_touxiang:setVisible(true)
        if rankData.icon == 0 then
            rankData.icon = 4
        end
        local roleData = RoleData:objectByID( rankData.icon )
        if roleData then
            img_head:setTexture( roleData:getIconPath() )
            img_head:setFlipX(true)
            Public:addFrameImg(bg_touxiang, rankData.headPicFrame)
        end
        txt_playername:setPositionX(91)
        txt_mingci:setVisible(false)
        txt_shuoming:setVisible(false)
        txt_xiangxi:setVisible(true)
        txt_xiangxi:setText( stringUtils.format(self.txt_rank_xiangxi[self.selectedtype], rankData.curStep))

        Public:addInfoListen(img_head, true, 1, rankData.playerId)
        
        strPath = "ui_new/leaderboard/no" .. idx .. ".png"
        img_tubiao:setTexture(strPath)
    else
        img_tubiao:setVisible(false)
        txt_fenduan:setVisible(true)
        bg_touxiang:setVisible(false)
        txt_fenduan:setText( stringUtils.format( localizable.SevenDaysRankLayer_txt_rank1, SevenDayRankManager.rank_num_tab[idx][1], SevenDayRankManager.rank_num_tab[idx][2] ) )
        txt_playername:setPositionX(80)
        txt_mingci:setVisible(true)
        txt_mingci:setText( stringUtils.format( localizable.SevenDaysRankLayer_txt_rank2, rankData.ranking ) )
        txt_shuoming:setVisible(true)
        txt_shuoming:setText( stringUtils.format( self.txt_rank_shuoming[self.selectedtype], rankData.curStep ) )
        txt_xiangxi:setVisible(false)
    end
end

function SevenDaysRankLayer.onLingquClickHandle(sender)
    local self  = sender.logic
    SevenDayRankManager:requestGetMinReward(self.selectedtype)
end

return SevenDaysRankLayer