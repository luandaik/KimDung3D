-- client side IslandTeam.lua
--[[
 * @Description: 东瀛岛组队信息界面
 ]]
-- script writer wuqi
-- creation time 2016-12-13
      
local IslandTeam = class("IslandTeam", BaseLayer)

local CELL_H = 61
local icon_bg_path = { "ui_new/island/btn_guanka1.png", "ui_new/island/btn_guanka2.png", "ui_new/island/btn_guanka3.png" }
                
function IslandTeam:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.island.IslandTeam")
  self.firstIn = true
  self.selectIdx = 1
end
      
function IslandTeam:loadData(selectChap)
    self.selectChap = selectChap or 1
end

function IslandTeam:initUI( ui )
  self.super.initUI(self, ui)

  self.btn_sx = TFDirector:getChildByPath(ui, "btn_sx")
  self.btn_sx.logic = self
  self.btn_cjdw = TFDirector:getChildByPath(ui, "btn_cjdw")
  self.btn_cjdw.logic = self

  self.panel_list = TFDirector:getChildByPath(ui, "panel_button")
  self.panel_cell = TFDirector:getChildByPath(self.panel_list, "btn_gk")
  self.panel_cell:retain()
  self.panel_cell:removeFromParent()
  self.panel_cell:setVisible(false)

  self.panel_rank = TFDirector:getChildByPath(ui, "panel_paiming")
  self.rank_cell = TFDirector:getChildByPath(self.panel_rank, "bg_1")
  self.rank_cell:retain()
  self.rank_cell:removeFromParent()
  self.rank_cell:setVisible(false)

  self.panel_reward = TFDirector:getChildByPath(ui, "panel_reward")
  self.reward_cell = TFDirector:getChildByPath(self.panel_reward, "bg_icon")
  self.reward_cell:retain()
  self.reward_cell:removeFromParent()
  self.reward_cell:setVisible(false)

  self.txt_sy = TFDirector:getChildByPath(ui, "txt_sy")
  self.btn_close = TFDirector:getChildByPath(ui, "btn_close")

  self.panel_empty = TFDirector:getChildByPath(ui, "panel_empty")
  self.panel_empty:setVisible(false)
end
  
function IslandTeam:removeUI()
  self.super.removeUI(self)

  if self.panel_cell then
    self.panel_cell:release()
    self.panel_cell = nil
  end  
  if self.rank_cell then
    self.rank_cell:release()
    self.rank_cell = nil
  end
  if self.reward_cell then
    self.reward_cell:release()
    self.reward_cell = nil
  end   
end

function IslandTeam:onShow()
    self.super.onShow(self)
    self:refreshUI()
    local sendIdx = self.idxList[self.selectIdx] or 0
    JapanIslandManager:requestTeamData(sendIdx)
end
    
function IslandTeam:refreshUI()
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.JAPAN_ISLAND)
    local times = challengeInfo:getLeftChallengeTimes() or 0
    self.txt_sy:setText( stringUtils.format( localizable.JapanIsland_txt_left_times, times ) )
    self:refreshIdxList()
    self:refreshRewardList()
    self:refreshTeamList()
    self:refreshSelectPanel()
    self:refreshRankPanel()
    self:refreshRewardPanel()

    if self.teamList and #self.teamList == 0 then
      self.panel_empty:setVisible(true)
    else
      self.panel_empty:setVisible(false)
    end
end

function IslandTeam:refreshIdxList()
    local tab1 = {}
    local tab2 = {}
    for v in JapanTeamChapterData:iterator() do
        if v.chapter_id <= JapanIslandManager.passedChap + 1 then
            table.insert(tab1, v.chapter_id)
        else
            table.insert(tab2, v.chapter_id)
        end
    end
    table.sort(tab1, function(v1, v2)
        return v1 > v2
    end)
    for i = 1, #tab2 do
        table.insert(tab1, tab2[i])
    end
    table.insert(tab1, 1, 0)
    self.idxList = tab1

    if self.firstIn then
      self.firstIn = false
      for i = 1, #self.idxList do
        if self.selectChap == self.idxList[i] then
          self.selectIdx = i
        end
      end
    end
end

function IslandTeam:refreshRewardList()
    local newIdx = self.idxList[self.selectIdx] or 1
    if newIdx == 0 then
      newIdx = self.idxList[2]
    end
    local info = JapanTeamChapterData:objectByID(newIdx)
    self.rewardList = JapanIslandManager:getDropItemListByChapInfo(info) or MEArray:new()
end

function IslandTeam:refreshTeamList()
    local teamData = JapanIslandManager.allTeamData or {}
    -- print("ttdata === >> ", teamData)
    if self.selectIdx == 1 then
      self.teamList = teamData
      return
    end

    local newIdx = self.idxList[self.selectIdx]
    self.teamList = {}
    for _, v in ipairs(teamData) do
      if v.chapterId == newIdx then
        table.insert(self.teamList, v)
      end
    end
end

function IslandTeam:refreshSelectPanel()
    if not self.tableView_select then
        local tableView = TFTableView:create()
        tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.tableView_select = tableView
        self.tableView_select.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable_select)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex_select)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView_select)
        self.panel_list:addChild(self.tableView_select, 1)
    end
    self.tableView_select:reloadData()
end

function IslandTeam.numberOfCellsInTableView_select(table)
    return JapanIslandManager.maxChapter + 1 or 0
end

function IslandTeam.cellSizeForTable_select(table,idx)
    if idx == 0 then
      return 90, 173
    else
      return 77, 173
    end
end

function IslandTeam.tableCellAtIndex_select(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local node = self.panel_cell:clone()
        local size = self.panel_cell:getSize()
        -- node:setPosition(ccp(size.width / 2 - 35, size.height / 2 - 10))
        node:setPosition(ccp(size.width / 2 - 6, size.height / 2 - 10))
        node:setVisible(true)
        cell.node = node
        cell:addChild(node);

        node:setTouchEnabled(true)
        node.logic = self
        node:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCellClick))
    end
    cell.node.idx = idx + 1
    self:showNodeSelect(cell.node, idx + 1)
    return cell
end

function IslandTeam.onCellClick( sender )
    local self = sender.logic
    local idx = sender.idx

    if self.selectIdx == idx then
      return
    end

    self.selectIdx = idx
    --JapanIslandManager:requestTeamData(idx - 1)
    JapanIslandManager:requestTeamData(0)
    self:refreshUI()
end

function IslandTeam:showNodeSelect(widget, idx)
    local txt_name1 = TFDirector:getChildByPath(widget, 'txt_name1')
    local txt_name2 = TFDirector:getChildByPath(widget, 'txt_name2')
    local img_lock = TFDirector:getChildByPath(widget, 'img_lock')
    local newIdx = self.idxList[idx] or 0
    if newIdx == 0 then
      txt_name1:setText(localizable.JapanIsland_all)
      txt_name2:setText(localizable.JapanIsland_all)
      widget:setTouchEnabled(true)
      img_lock:setVisible(false)
      -- print("self.selectIdx == idx ==>> ", self.selectIdx, idx)
      if self.selectIdx == idx then
        widget:setTextureNormal( icon_bg_path[2] )
        txt_name2:setVisible(true)
        txt_name1:setVisible(false)
      else
        widget:setTextureNormal( icon_bg_path[1] )
        txt_name2:setVisible(false)
        txt_name1:setVisible(true)
      end
    else
      local info = JapanTeamChapterData:objectByID(newIdx)
      txt_name1:setText(info.name)
      txt_name2:setText(info.name)
      if newIdx > JapanIslandManager.passedChap + 1 then
          txt_name1:setVisible(true)
          txt_name2:setVisible(false)
          widget:setTouchEnabled(false)
          widget:setTextureNormal( icon_bg_path[3] )
          img_lock:setVisible(true)
          return
      else
          img_lock:setVisible(false)
          widget:setTouchEnabled(true)
          txt_name1:setVisible(true)
          txt_name2:setVisible(false)

          if idx == self.selectIdx then
              txt_name2:setVisible(true)
              txt_name1:setVisible(false)
              widget:setTextureNormal( icon_bg_path[2] )
          else
             widget:setTextureNormal( icon_bg_path[1] )
          end
      end
    end
end

function IslandTeam:refreshRankPanel()
    if not self.tableView_rank then
        local tableView = TFTableView:create()
        tableView:setTableViewSize(self.panel_rank:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.tableView_rank = tableView
        self.tableView_rank.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable_rank)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex_rank)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView_rank)
        self.panel_rank:addChild(self.tableView_rank, 1)
    end
    self.tableView_rank:reloadData()
end

function IslandTeam.numberOfCellsInTableView_rank(table)
    local self = table.logic
    return #self.teamList or 0
end

function IslandTeam.cellSizeForTable_rank(table, idx)
  if idx == 0 then
    return 150, 660
  else
    return 134, 660
  end
end

function IslandTeam.tableCellAtIndex_rank(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local node = self.rank_cell:clone()
        local size = self.rank_cell:getSize()
        --node:setPosition(ccp(size.width / 2, size.height / 2))
        node:setPosition(ccp(7, 0))
        node:setVisible(true)
        cell.node = node
        cell:addChild(node);

        local btn_jr = TFDirector:getChildByPath(node, "btn_jr")
        btn_jr.helpType = 0
        btn_jr.logic = self
        btn_jr:setTouchEnabled(true)
        btn_jr.idx = idx + 1
        btn_jr.teamId = self.teamList[ idx + 1 ].teamId
        btn_jr:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onEnterTeamClick))
        --
        local btn_zz    = TFDirector:getChildByPath(node, "btn_zz")
        btn_zz.helpType = 1
        btn_zz.logic    = self
        btn_zz:setTouchEnabled(true)
        btn_zz.idx = idx + 1
        btn_zz.teamId = self.teamList[ idx + 1 ].teamId
        btn_zz:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onEnterTeamClick))
    end
    local btn_jr    = TFDirector:getChildByPath(cell.node, "btn_jr")
    btn_jr.idx      = idx + 1
    btn_jr.teamId   = self.teamList[ idx + 1 ].teamId
    local btn_zz    = TFDirector:getChildByPath(cell.node, "btn_zz")
    btn_zz.idx      = idx + 1
    btn_zz.teamId   = self.teamList[ idx + 1 ].teamId

    self:showNodeRank(cell.node, idx + 1)
    return cell
end

function IslandTeam:showNodeRank(widget, idx)
    local txt_name = TFDirector:getChildByPath(widget, 'txt_name')
    local txt_lv = TFDirector:getChildByPath(widget, 'txt_lv')
    local panel_role = TFDirector:getChildByPath(widget, "panel_role")
    local iconTab = {}
    for i = 1, 3 do
      iconTab[i] = TFDirector:getChildByPath(panel_role, "panel_role" .. i)
      iconTab[i].txt_name = TFDirector:getChildByPath(iconTab[i], "txt_name")
      iconTab[i].img_dz = TFDirector:getChildByPath(iconTab[i], "img_dz")
      iconTab[i].img_tou = TFDirector:getChildByPath(iconTab[i], "img_tou")
      iconTab[i].img_touxiang = TFDirector:getChildByPath(iconTab[i], "img_touxiang")
    end

    local data = self.teamList[idx]
    if not data then
      return
    end
    local chapData = JapanTeamChapterData:objectByID(data.chapterId)
    txt_name:setText(chapData.name)
    txt_lv:setText( stringUtils.format( localizable.JapanIsland_lev_range, data.minLevel, data.maxLevel ) )

    local memInfo = data.member or {}
    for i = 1, 3 do
      if memInfo[i] then
        if memInfo[i].playerId == data.leader then
          iconTab[i].img_dz:setVisible(true)
        else
          iconTab[i].img_dz:setVisible(false)
        end
        iconTab[i].txt_name:setVisible(true)
        iconTab[i].txt_name:setText(memInfo[i].name)
        iconTab[i].img_touxiang:setVisible(true)
        if memInfo[i].useIcon == 0 then
            memInfo[i].useIcon = 4
        end
        local roleData = RoleData:objectByID( memInfo[i].useIcon )
        if roleData then
            iconTab[i].img_touxiang:setTouchEnabled(true)
            iconTab[i].img_touxiang:setTexture( roleData:getIconPath() )
            --iconTab[i].img_touxiang:setFlipX(true)
            Public:addFrameImg(iconTab[i].img_touxiang, memInfo[i].frameId)
            iconTab[i].img_tou:setVisible(true)
            iconTab[i].img_tou:setTexture( GetColorIconByQuality_118( roleData.quality ) )
            --Public:addInfoListen(iconTab[i].img_touxiang, true, 1, memInfo[i].playerId)
        end
      else
        iconTab[i].img_touxiang:setTouchEnabled(false)
        iconTab[i].txt_name:setVisible(false)
        iconTab[i].img_touxiang:setVisible(false)
        iconTab[i].img_tou:setVisible(true)
        iconTab[i].img_tou:setTexture("ui_new/friend/bg_head.png")
        iconTab[i].img_dz:setVisible(false)
      end
    end
end

function IslandTeam.onEnterTeamClick(sender)
  local self = sender.logic
  local idx = sender.idx
  local teamId = sender.teamId

  JapanIslandManager:requestOperateTeam(0, teamId, MainPlayer:getPlayerId(), false, sender.helpType)
end

function IslandTeam:refreshRewardPanel()
    if not self.tableView_reward then
        local tableView = TFTableView:create()
        tableView:setTableViewSize(self.panel_reward:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLHORIZONTAL) 
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.tableView_reward = tableView
        self.tableView_reward.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable_reward)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex_reward)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView_reward)
        self.panel_reward:addChild(self.tableView_reward, 1)
    end
    self.tableView_reward:reloadData()
end

function IslandTeam.numberOfCellsInTableView_reward(table)
    local self = table.logic
    return self.rewardList:length() or 0
end

function IslandTeam.cellSizeForTable_reward(table,idx)
    return 64, 70
end

function IslandTeam.tableCellAtIndex_reward(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local node = self.reward_cell:clone()
        local size = self.reward_cell:getSize()
        node:setPosition(ccp(30, -30))
        node:setVisible(true)
        cell.node = node
        cell:addChild(node);
    end
    self:showNodeReward(cell.node, idx + 1)
    return cell
end

function IslandTeam:showNodeReward(widget, idx)
    local img_icon = TFDirector:getChildByPath(widget, 'img_icon')
    local txt_num = TFDirector:getChildByPath(widget, 'txt_num')
    widget:setTouchEnabled(true)
    local reward = self.rewardList:objectAt(idx)
    txt_num:setText("X" .. reward.number)
    img_icon:setTexture( reward.path )
    Public:addPieceImg(img_icon, reward)
    widget:setTextureNormal( ( GetColorIconByQuality_118( reward.quality ) ) )
    widget:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            Public:ShowItemTipLayer(reward.itemid, reward.type)
        end)
    )
end

function IslandTeam:registerEvents()
    self.btn_sx:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRefreshClick))
    self.btn_cjdw:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCreateClick))
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCloseClick))

    self.teamDataCallBack = function(event)
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.TEAM_DATA_REPONSE, self.teamDataCallBack)    
end

function IslandTeam:removeEvents()
    self.super.removeEvents(self)	

    TFDirector:removeMEGlobalListener(JapanIslandManager.TEAM_DATA_REPONSE, self.teamDataCallBack)    
    self.teamDataCallBack = nil
end

function IslandTeam.onRefreshClick( sender )
    local self = sender.logic
    local sendIdx = self.idxList[self.selectIdx] or 0
    JapanIslandManager:requestTeamData(sendIdx)
end

function IslandTeam.onCreateClick( sender )
    local self = sender.logic
    JapanIslandManager:openCreateEditLayer()
end

function IslandTeam.onCloseClick( sender )
  AlertManager:close()
end

return IslandTeam