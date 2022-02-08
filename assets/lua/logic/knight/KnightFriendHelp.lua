--[[
******浪人武士协助面板*******
    -- create by fei
    -- 2016/12/14
]]

local KnightFriendHelp = class("KnightFriendHelp", BaseLayer)
local knightImg = {"ui_new/langren/txt_nakelulubang.png", "ui_new/langren/txt_bawangwanbang.png"}
function KnightFriendHelp:ctor()
    self.super.ctor(self)
    self.tableViewNum   = 0
    self:init("lua.uiconfig_mango_new.LangRenWuShi.langrenxiezhu")
end

function KnightFriendHelp:initUI(ui)
    self.super.initUI(self,ui)

    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');
    self.img_tableCell  = TFDirector:getChildByPath(ui, 'img_paimingbg')
    self.txt_fightCount = TFDirector:getChildByPath(ui, 'txt_fightCount')
    self.img_tableCell:setVisible(false)
    self.img_tableCell:retain()
    self.img_tableCell:removeFromParent(false)

    self.txt_fightCount:setVisible(false)
    local Panel_paihang = TFDirector:getChildByPath(ui, 'Panel_paihang');
    self:initTableView(Panel_paihang)
    KnightManager:clearRedPointInfo()
end

function KnightFriendHelp:onShow()
    self.super.onShow(self)
    self:refreshUI()
    self:registerTableView()
end

function KnightFriendHelp:initTableView(Panel_paihang)
    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(Panel_paihang:getSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setPosition(Panel_paihang:getPosition())
    Panel_paihang:getParent():addChild(tableView, 99)
    
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableView:addMEListener(TFTABLEVIEW_TOUCHED, KnightFriendHelp.tableCellTouched)
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, KnightFriendHelp.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, KnightFriendHelp.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, KnightFriendHelp.numberOfCellsInTableView)
    self.tableView = tableView
    self.tableView.logic = self
end

function KnightFriendHelp:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
    --
    self.knightShareCallBack = function(event)
        self:refreshUI()
        self:registerTableView()
    end
    TFDirector:addMEGlobalListener(KnightManager.KnightShareList, self.knightShareCallBack)
    TFDirector:addMEGlobalListener(KnightManager.KnightShareInfo, self.knightShareCallBack)

    print("分享界面  ",KnightManager:getKnghtShareList())
    self:registerTableView()
end
function KnightFriendHelp:refreshUI()
    self.txt_fightCount:setVisible(true)
    self.txt_fightCount:setText(KnightManager:getKnightFriednHelpCount())
end

function KnightFriendHelp:registerTableView()
    local oldNum        = self.tableViewNum
    local shareList     = KnightManager:getKnghtShareList()
    self.tableViewNum   = #shareList or 0
    if (self.tableViewNum <= 0) then
        AlertManager:close()
        return
    end
    KnightManager:updateKnightShareOnLineTime({})
    self.tableView:reloadData()
end

function KnightFriendHelp.tableCellTouched(table,cell)

end

function KnightFriendHelp.cellSizeForTable(table,idx)
    local self = table.logic
    local size = self.img_tableCell:getSize()
    return size.height,size.width
end

function KnightFriendHelp.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()

    if nil == cell then
        cell = self:CreateTableCell(cell)
    end
    cell.index = idx + 1

    self:setTableCellData(cell)
    return cell
end

function KnightFriendHelp.numberOfCellsInTableView(table)
    local self = table.logic
    return self.tableViewNum
end

function KnightFriendHelp:CreateTableCell(cell)
    if nil == cell then
        cell = TFTableViewCell:create()
        local tableCell = self.img_tableCell:clone()
        tableCell:setVisible(true)
        local cellSize = tableCell:getContentSize()
        tableCell:setPosition(ccp(cellSize.width / 2 + (self.tableView:getSize().width - cellSize.width) / 2, cellSize.height / 2))
        cell.tableCell = tableCell
        cell:addChild(tableCell, 999)
    end
    return cell
end

function KnightFriendHelp:setTableCellData(cell)
    local index             = cell.index
    local tableCell         = cell.tableCell
  --  local btn_boss          = TFDirector:getChildByPath(tableCell, "btn_base")
    local img_boss          = TFDirector:getChildByPath(btn_boss, "img_boss")
    local txt_bossLevel     = TFDirector:getChildByPath(tableCell, "txt_level")
    local bar_bossHpBar     = TFDirector:getChildByPath(tableCell, "bar_xueliang")
    local txt_timeBg        = TFDirector:getChildByPath(tableCell, "txt_timeBg")
    local txt_onlinetime    = TFDirector:getChildByPath(txt_timeBg, "txt_leavetime")
    local txt_shareName     = TFDirector:getChildByPath(tableCell, "txt_shareName")
    local btn_fight         = TFDirector:getChildByPath(tableCell, "btn_tiaozhan")
    local btn_fightEnd      = TFDirector:getChildByPath(tableCell, "btn_yitiaozhan")
    local bg_finghting      = TFDirector:getChildByPath(tableCell, "bg_finghting")
    local img_head_bawangwan      = TFDirector:getChildByPath(tableCell, "img_head_bawangwan")
    local img_head_nakelulu      = TFDirector:getChildByPath(tableCell, "img_head_nakelulu")
    
    local shareInfo        = KnightManager:getByIndexKnghtShareInfo(tonumber(index))
    local sharePlayerId    = shareInfo.sharePlayerId
    local shareKnightInfo  = shareInfo.knightInfo
    local knightLevel      = shareKnightInfo.level
    local knightType       = shareKnightInfo.type
    img_head_bawangwan:setVisible(knightType ~= 1)
    img_head_nakelulu:setVisible(knightType == 1)
   -- btn_boss:setTouchEnabled(false)
    txt_bossLevel:setText(stringUtils.format(localizable.Knight_Level, knightLevel))
    bar_bossHpBar:setPercent((shareInfo.leaveHp / shareInfo.maxHp) * 100)

    local data          = {}
    data.txt            = txt_onlinetime
    data.index          = index
    data.funcCall       = function() self:registerTableView() end
    --
    if (sharePlayerId == MainPlayer:getPlayerId()) then
        txt_shareName:setText(MainPlayer:getPlayerName())
        KnightManager:updateKnightShareOnLineTime(data)
    else
     
        txt_shareName:setText(shareInfo.sharePlayerName)
        KnightManager:updateKnightShareOnLineTime(data)

    end
    
    bg_finghting:setVisible(false)
    btn_fightEnd:setTouchEnabled(false)

    --武士状态 0 可挑战 1 挑战中 2 已挑战
    if (shareInfo.knightState == 0) then
        btn_fightEnd:setVisible(false)
        btn_fight:setVisible(true)
        btn_fight:addMEListener(TFWIDGET_CLICK, audioClickfun(function()
                                                                    KnightManager:openKnightVSLayer(shareInfo)
                                                                 end))
    elseif (shareInfo.knightState == 1) then
        bg_finghting:setVisible(true)
        btn_fight:setVisible(false)
        btn_fightEnd:setVisible(false)
        local img_touxiang  = TFDirector:getChildByPath(bg_finghting, "img_touxiang")
        local txt_name      = TFDirector:getChildByPath(bg_finghting, "txt_fnightName")
        local finghtInfo    = shareInfo.info
        if (finghtInfo) then
            local role = RoleData:objectByID(finghtInfo.icon)
            if role then
                img_touxiang:setTexture(role:getHeadPath())
            end
            txt_name:setText(finghtInfo.name)
        end 
    else
        btn_fightEnd:setVisible(true)
        btn_fight:setVisible(false)
        --txt_timeBg:setVisible(false)
    end
    local knightInfo       = KnightManager:getKnightData(shareInfo.knightInfo.type, shareInfo.knightInfo.level, true)
    if (knightInfo.assistAwardIds) then

        local ScrollView      = TFDirector:getChildByPath(tableCell, 'ScrollView')
        local btn_icon_mode   = TFDirector:getChildByPath(tableCell, 'btn_icon')
        btn_icon_mode:setVisible(false)
        ScrollView:removeAllChildren()
        local itemLen = 0
        for i,v in ipairs(knightInfo.assistAwardIds.itemTypeId) do
            local btn_icon        = btn_icon_mode:clone()
            if (btn_icon) then
                btn_icon:setVisible(true)
                btn_icon:setAnchorPoint(ccp(0, 0))
                btn_icon:setPosition(ccp(btn_icon:getSize().width * (i - 1) - (i - 1) * 50, 0))
                ScrollView:addChild(btn_icon)
                --
                local img_icon        = TFDirector:getChildByPath(btn_icon, 'img_icon')
                local txt_number      = TFDirector:getChildByPath(btn_icon, 'txt_number')
                local itemId          = tonumber(knightInfo.assistAwardIds.itemId[i])
                local itemTypeId      = tonumber(knightInfo.assistAwardIds.itemTypeId[i])
                if (itemTypeId == EnumDropType.COIN or itemTypeId == EnumDropType.SYCEE) then
                    img_icon:setTexture(GetResourceIcon(itemTypeId))
                elseif (itemTypeId == EnumDropType.GOODS) then
                    local item      = ItemData:objectByID( itemId );
                    btn_icon:setTextureNormal(GetColorIconByQuality(item.quality))
                    img_icon:setTexture(item:GetPath())
                end
                txt_number:setText(knightInfo.assistAwardIds.itemNum[i])
                btn_icon:setTouchEnabled(true)
                btn_icon:addMEListener(TFWIDGET_CLICK,
                                                        audioClickfun(function()
                                                            Public:ShowItemTipLayer(itemId, itemTypeId)
                                                        end))
                itemLen = itemLen + 1
            end
        end
        ScrollView:setTouchEnabled(true)
        ScrollView:setDirection(SCROLLVIEW_DIR_HORIZONTAL)
        ScrollView:setInnerContainerSize(CCSizeMake(btn_icon_mode:getSize().width * itemLen - (itemLen) * 50, ScrollView:getSize().height))
    end
end

function KnightFriendHelp:removeUI()
    ChatManager:setOpenKnightShareLayer(false)
    self.img_tableCell:release();
    self.super.removeUI(self)
end

function KnightFriendHelp:removeEvents()

    TFDirector:removeMEGlobalListener(KnightManager.KnightShareList, self.knightShareCallBack)
    TFDirector:removeMEGlobalListener(KnightManager.KnightShareInfo, self.knightShareCallBack)
    self.knightShareCallBack = nil
    KnightManager:updateKnightShareOnLineTime({})
    self.super.removeEvents(self)
end

function KnightFriendHelp:dispose()

    self.super.dispose(self)
end          
return KnightFriendHelp