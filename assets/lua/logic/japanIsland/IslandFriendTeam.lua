

local IslandFriendTeam = class("IslandFriendTeam", BaseLayer)
local friendInfoList = {}

local BtnResNormalList = {}
BtnResNormalList[1] = "ui_new/friend/tab1b.png"
BtnResNormalList[2] = "ui_new/faction/tab_bpcy2.png"

local BtnResHighLightList = {}
BtnResHighLightList[1] = "ui_new/friend/tab1.png"
BtnResHighLightList[2] = "ui_new/faction/tab_bpcy.png"

function IslandFriendTeam:ctor(data)
    self.super.ctor(self,data)
    self.selectIdx = 1
    self.isRequestMember = false
    self:init("lua.uiconfig_mango_new.friends.FriendTeam")
    self.name = "IslandFriendTeam"
end

function IslandFriendTeam:initUI(ui)
	self.super.initUI(self,ui)
    --
    self.generalHead = CommonManager:addGeneralHead(self, 10)
    self.generalHead:setData(ModuleType.Friend, {HeadResType.COIN, HeadResType.SYCEE})
    --
    --self.txt_friendLen  = TFDirector:getChildByPath(ui, "txt_sl")

    local panel_content     = TFDirector:getChildByPath(ui, "panel_content")

    self.txt_friendLen      = TFDirector:getChildByPath(ui, "txt_hysl")
    local txt_sl = TFDirector:getChildByPath(ui, "txt_sl")
    self.txt_tips = TFDirector:getChildByPath(ui, "txt_tips")
    self.txt_tips:setVisible(true)
    txt_sl:setVisible(false)

    -- table view
    local tableViewPanel = TFDirector:getChildByPath(ui, "Panel_List")
    self.tableViewPanel = tableViewPanel

    local tableView = TFTableView:create()
    tableView:setTableViewSize(tableViewPanel:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableViewPanel:addChild(tableView)
    self.tableView = tableView

    self.btn_friends = TFDirector:getChildByPath(ui, "btn_friends")

    self.btn_bpcy = TFDirector:getChildByPath(ui, "btn_bpcy")
    self.btn_bpcy:setVisible(true)

    self.tab_button = {}
    self.tab_button[1] = self.btn_friends
    self.tab_button[2] = self.btn_bpcy
end

function IslandFriendTeam:onShow()
    self.super.onShow(self)
    if self.generalHead then
        self.generalHead:onShow()
    end
    -- self:refreshUI()
end

function IslandFriendTeam:registerEvents()
    self.super.registerEvents(self);
    if self.generalHead then
        self.generalHead:registerEvents()
    end
    FriendManager:requestFriendList()
    -- FactionManager:requestMemberInfo()

    for i = 1, 2 do
        self.tab_button[i].index = i
        self.tab_button[i].logic = self
        self.tab_button[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnTabButtonClick),1)
    end

    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, IslandFriendTeam.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, IslandFriendTeam.tableCellAtIndex)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, IslandFriendTeam.numberOfCellsInTableView)

    self.onUpdateList = function(event)
        self.selectIdx = 1
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(FriendManager.UpdateList, self.onUpdateList)
   
    self.onUpdateTeamInfo = function(event)
        local status = JapanIslandManager:getTeamStatus()
        if status ~= JapanIslandManager.EnumTeamStatus.PREPARE then
            AlertManager:closeLayer(self)
        end
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.MY_TEAM_REPONSE, self.onUpdateTeamInfo)
end

function IslandFriendTeam.OnTabButtonClick(sender)
    local self = sender.logic
    local index = sender.index

    if self.selectIdx == index then
        return
    else
        self.selectIdx = index
        if (index == 2 and (not self.isRequestMember)) then
            self.isRequestMember = true
            FactionManager:requestMemberInfo()
        end
        self:refreshUI()
    end
end

function IslandFriendTeam:refreshUI()
    self:refreshData()

    for i = 1, 2 do
        if i == self.selectIdx then
            self.tab_button[i]:setTextureNormal( BtnResHighLightList[i] )
        else
            self.tab_button[i]:setTextureNormal( BtnResNormalList[i] )
        end
    end
    if self.selectIdx == 1 then
        self.txt_friendLen:setText(localizable.JapanIsland_can_invite_num .. self.friendLen or 0)
    else
        self.txt_friendLen:setText(localizable.JapanIsland_can_invite_num2 .. self.friendLen or 0)
    end
    self.tableView:reloadData()
end

function IslandFriendTeam.tableCellAtIndex(table, idx)
        
    local cell = table:dequeueCell()
    local self = table.logic
    local messagePanel = nil
    local idChat = idx + 1
    if nil == cell then

        cell = TFTableViewCell:create()
        local friendCell = require("lua.logic.friends.FriendCell"):new()
        cell.friendCell = friendCell
        cell:addChild(friendCell)

    end
    cell.friendCell:setInfo(4, friendInfoList[idChat], true)
    -- cell.friendCell:setTeamListInfo(friendInfoList[idChat].isInvitation)
    return cell
end

function IslandFriendTeam.cellSizeForTable(table,idx)
   return 148,731
end

function IslandFriendTeam.numberOfCellsInTableView(tableV)
   -- local self = tableV.logic
    return #friendInfoList
end

function IslandFriendTeam:createChatInfo(idx)
    local messagePanel = require('lua.logic.chat.PublicMessageCell'):new()
    messagePanel:setPosition(ccp(0,0))
    messagePanel:setLogic(self)
    messagePanel.txt_msg:setVisible(true)
   return messagePanel
end

function IslandFriendTeam:refreshChatInfo(messagePanel, idx)
    messagePanel.txt_msg:setText(self.charList[idx])
    messagePanel.txt_vip:setText("o"..MainPlayer:getVipLevel())
    messagePanel.txt_name:setText(MainPlayer:getPlayerName())
    messagePanel.txt_level:setText(MainPlayer:getLevel())

    local role = RoleData:objectByID(MainPlayer:getHeadIconId()) 
    if role then
        messagePanel.img_icon:setTexture(role:getIconPath())
    end

    messagePanel.txt_position:setVisible(false)
end

function IslandFriendTeam:tableCellClick(cell)

end

function IslandFriendTeam:removeEvents()
    if self.generalHead then
        self.generalHead:removeEvents()
    end
    TFDirector:removeMEGlobalListener(FriendManager.UpdateList, self.onUpdateList)
    self.onUpdateList = nil
   TFDirector:removeMEGlobalListener(JapanIslandManager.MY_TEAM_REPONSE, self.onUpdateTeamInfo)
   self.onUpdateTeamInfo = nil
    self.super.removeEvents(self)
end

function IslandFriendTeam:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    self.super.dispose(self)
end

function IslandFriendTeam:onHide()
   
end

function IslandFriendTeam:removeUI()
    self.ui = nil;
end

function IslandFriendTeam.closeBtnClickHandle(sender)
    AlertManager:close(AlertManager.TWEEN_1);
end

function IslandFriendTeam:refreshData()
    local player = nil
    local chooseType = self.selectIdx
    friendInfoList = {}
    self.friendLen = 0

    print("chooseType ===>>> ", chooseType)
    local tempList = {}
    -- 1 好友  2 帮派
    if chooseType == 1 then
        tempList = FriendManager:getFriendInfoList()
    else
        tempList = FactionManager:getMemberInfo()
    end

    for i, v in ipairs(tempList) do
        local id = 0
        if chooseType == 1 then
            id = v.info.playerId
        else
            id = v.playerId
        end
        if JapanIslandManager:checkIsInMyTeamByPlayerID(id) == false then
            local fInfo = {}
            if chooseType == 1 then
                fInfo = v.info
            else
                fInfo = v
            end               
            if not fInfo.isInvitation then
                self.friendLen = self.friendLen + 1
            end
            table.insert(friendInfoList, fInfo)
        end
    end
    if (#friendInfoList > 1) then
        table.sort(friendInfoList, function(a, b)
                                        return a.lastLoginTime > b.lastLoginTime
                                    end)
    end
    -- print("self.data ===>>> ", friendInfoList)
end

return IslandFriendTeam