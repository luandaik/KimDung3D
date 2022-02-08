-- client side KingWarCrossArenaList.lua
--[[
 * @Description: 历届擂主
 ]]
-- script writer fei
-- creation time 2016-11-9 21:00

local KingWarCrossArenaList = class("KingWarCrossArenaList", BaseLayer)

function KingWarCrossArenaList:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossarena.CrossArenaList")
    
end

function KingWarCrossArenaList:initUI(ui)
	self.super.initUI(self, ui)
    --
    self.btnClose         = TFDirector:getChildByPath(ui, "btn_close")
    self.Panel_table      = TFDirector:getChildByPath(ui, "Panel_table")

    self.tableView = TFTableView:create()
    self.tableView:setTableViewSize(self.Panel_table:getContentSize())
    self.tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    self.tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLBOTTOMUP)
    self.Panel_table:addChild(self.tableView)
    self.tableView.logic = self
    self.bg      = TFDirector:getChildByPath(ui, "bg_1")
     
    self.bg:setVisible(false)
end

function KingWarCrossArenaList:onShow()
    self.super.onShow(self)
end

function KingWarCrossArenaList:refreshUI()
    
end

function KingWarCrossArenaList:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btnClose)

    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, KingWarCrossArenaList.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, KingWarCrossArenaList.tableCellAtIndex)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, KingWarCrossArenaList.numberOfCellsInTableView)

    self.onUpdateList = function(event)

        local listInfo = KingOfWarManager:getAllChampionTeamInfo() or {}
        self.allTeamInfoList = listInfo.leizhu or {}

        for i, teamInfo in ipairs(self.allTeamInfoList) do
            for j, info in ipairs(teamInfo.member) do
                info.textLeader = i
                if ((teamInfo.leaderId == info.playerId)) then
                    info.textLeader = #self.allTeamInfoList + 1
                end
            end
            --队长排第一位
            table.sort(teamInfo.member, function(a, b) return a.textLeader > b.textLeader end)
        end
        self.tableView:reloadData()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateAllLastHistoryMsg, self.onUpdateList)

    KingOfWarManager:requestAllContestHistory()
end

function KingWarCrossArenaList.tableCellAtIndex(table, idx)
        
    local cell = table:dequeueCell()
    local self = table.logic
    local idTeam = idx + 1
    if nil == cell then

        cell = TFTableViewCell:create()
        local bg = self.bg:clone()
        bg:setVisible(true)
        bg:setAnchorPoint(ccp(0,0))
        bg:setPosition(ccp(0,0))
        cell.bg = bg
        cell:addChild(bg)

    end
    local bg = cell.bg
    self:setCallInfo(bg, idTeam)
    return cell
end

function KingWarCrossArenaList.cellSizeForTable(table,idx)
   return 161,641
end

function KingWarCrossArenaList.numberOfCellsInTableView(tableV)
    local self = tableV.logic
    return #self.allTeamInfoList
end

function KingWarCrossArenaList:setCallInfo(bg, idx)

    local teamInfo = self.allTeamInfoList[idx]
    if (teamInfo == nil) then return end
    local txt_team = TFDirector:getChildByPath(bg, "txt_team")
    txt_team:setText(teamInfo.name)
    local txt_jie = TFDirector:getChildByPath(bg, "txt_jie")
    txt_jie:setText(teamInfo.number)

    for i=1,#teamInfo.member do
        local info          = teamInfo.member[i]
        local panel_bg      = TFDirector:getChildByPath(bg, "panel_role"..i)
        local img_touxiang  = TFDirector:getChildByPath(panel_bg, "img_touxiang")
        local txt_roleName  = TFDirector:getChildByPath(panel_bg, "txt_name")
        local img_dz        = TFDirector:getChildByPath(panel_bg, "img_dz")
        txt_roleName:setText(info.name)
        local roleIcon = RoleData:objectByID(info.useIcon)
        img_touxiang:setTexture(roleIcon:getIconPath())
        img_dz:setVisible((teamInfo.leaderId == info.playerId))

        Public:addFrameImg(img_touxiang,info.frameId) 

        Public:addInfoListen(img_touxiang, true, 6, info.playerId, teamInfo.serverId)
    end
end

function KingWarCrossArenaList:removeEvents()

    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateAllLastHistoryMsg, self.onUpdateList)
    self.onUpdateList = nil 
end

function KingWarCrossArenaList:removeUI()
    self.super.removeUI(self)
end

function KingWarCrossArenaList:dispose()
	self.super.dispose(self)
end

return KingWarCrossArenaList