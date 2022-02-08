-- client side IslandCreateTeam.lua
--[[
 * @Description: 东瀛岛创建队伍编辑界面
 ]]
-- script writer wuqi
-- creation time 2016-12-13

local IslandCreateTeam = class("IslandCreateTeam", BaseLayer)

IslandCreateTeam.IS_TEST = true
-- 滑动等待惯性时间(毫秒)
IslandCreateTeam.CHECK_DELAY_TIME = 500

function IslandCreateTeam:ctor(data)
  self.super.ctor(self, data)
  self.selectCheck = 1
  self.chapData = {}
  self.minLevData = {}
  self.maxLevData = {}
  self.maxLev = ConstantData:objectByID("Player.Level.Max").value or 100
  for i = 1, self.maxLev do
    table.insert( self.minLevData, i )
    table.insert( self.maxLevData, i )
  end
  self.selectIdxTab = {1, 1, self.maxLev}
  self:init("lua.uiconfig_mango_new.island.IslandCreateTeam")
end

function IslandCreateTeam:initUI( ui )
    self.super.initUI(self, ui)

    self.btn_check = {}
    for i = 1, 2 do
      self.btn_check[i] = TFDirector:getChildByPath(ui, "btn_dianji" .. i)
      self.btn_check[i].logic = self
      self.btn_check[i].idx = i
    end

    self.btn_ok = TFDirector:getChildByPath(ui, "btn_ok")
    self.btn_ok.logic = self
    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.btn_close.logic = self

    self.scroll_chap = TFDirector:getChildByPath(ui, "ScrollView_guanka") 
    self.scroll_chap.logic = self
    self.scroll_minlev = TFDirector:getChildByPath(ui, "ScrollView_level1") 
    self.scroll_minlev.logic = self
    self.scroll_maxlev = TFDirector:getChildByPath(ui, "ScrollView_level2") 
    self.scroll_maxlev.logic = self
    self.scrollTab = { self.scroll_chap, self.scroll_minlev, self.scroll_maxlev }
    for i = 1, #self.scrollTab do
      Public:bindScrollFun( self.scrollTab[i] )
      self.scrollTab[i]:setBounceEnabled(true)
    end

    self.cell_chap = TFDirector:getChildByPath(self.scroll_chap, "cell_chap")
    self.cell_chap:retain()
    self.cell_chap:removeFromParent()
    self.cell_chap:setVisible(false)

    self.cell_lev1 = TFDirector:getChildByPath(self.scroll_minlev, "cell_lev1")
    self.cell_lev1:retain()
    self.cell_lev1:removeFromParent()
    self.cell_lev1:setVisible(false)

    self.cell_lev2 = TFDirector:getChildByPath(self.scroll_maxlev, "cell_lev2")
    self.cell_lev2:retain()
    self.cell_lev2:removeFromParent()
    self.cell_lev2:setVisible(false)

    self.scrollSizeTab = { self.scroll_chap:getSize(), self.scroll_minlev:getSize(), self.scroll_maxlev:getSize() }
    self.cellSizeTab = { self.cell_chap:getSize(), self.cell_lev1:getSize(), self.cell_lev2:getSize() }
    self.posTab = { self.cell_chap:getPosition(), self.cell_lev1:getPosition(), self.cell_lev2:getPosition() }

    self:refreshUI()
end

function IslandCreateTeam.scrollTouchBegan1(sender)
  local self = sender.logic
  self.innerStartPos1 = self.scrollTab[1]:getInnerContainer():getPositionY()

  if self.scrollTimerID1 then
    TFDirector:removeTimer(self.scrollTimerID1)
    self.scrollTimerID1 = nil
  end
end

function IslandCreateTeam.scrollTouchMoved1(sender)
  
end

function IslandCreateTeam.scrollTouchEnded1(sender)
  --print("333333333000000")
  local self = sender.logic
  self:rectifyScrollPos(1)
end

function IslandCreateTeam.scrollTouchCancelled1(sender)
  --print("4444444440000000")
  local self = sender.logic
  self:rectifyScrollPos(1)
end

function IslandCreateTeam.scrollTouchBegan2(sender)
  --print("111111qqqqq")
  local self = sender.logic

  if self.scrollTimerID2 then
    TFDirector:removeTimer(self.scrollTimerID2)
    self.scrollTimerID2 = nil
  end
end

function IslandCreateTeam.scrollTouchMoved2(sender)
  --print("2222222qqqqqq")
end

function IslandCreateTeam.scrollTouchEnded2(sender)
  --print("333333333qqqqqqqq")
  local self = sender.logic
  self:rectifyScrollPos(2)
end

function IslandCreateTeam.scrollTouchCancelled2(sender)
  --print("444444444qqqqqqqqq")
  local self = sender.logic
  self:rectifyScrollPos(2)
end

function IslandCreateTeam.scrollTouchBegan3(sender)
  --print("111111")
  local self = sender.logic

  if self.scrollTimerID3 then
    TFDirector:removeTimer(self.scrollTimerID3)
    self.scrollTimerID3 = nil
  end
end

function IslandCreateTeam.scrollTouchMoved3(sender)
  --print("2222222")
end

function IslandCreateTeam.scrollTouchEnded3(sender)
  --print("333333333")
  local self = sender.logic
  self:rectifyScrollPos(3)
end

function IslandCreateTeam.scrollTouchCancelled3(sender)
  --print("444444444")
  local self = sender.logic
  self:rectifyScrollPos(3)
end

function IslandCreateTeam:rectifyScrollPos(idx)
  idx = idx or 1

  if idx == 1 then
    local newTime = 0
    if self.scrollTimerID1  == nil then
      self.scrollTimerID1 = TFDirector:addTimer(30, -1, nil, 
      function()
        -- 等待滑动惯性结束
        if newTime < self.CHECK_DELAY_TIME then
          newTime = newTime + 30
          return
        end

        local innerNode = self.scrollTab[idx]:getInnerContainer()
        local curOffsetY = self.scrollTab[idx]:getContentOffset().y
        
        if curOffsetY < self.initOffsetYTab[idx] then
          curOffsetY = self.initOffsetYTab[idx]
        end
        local num1 = math.max( #self.chapData - 1, 0 )
        local maxValue = self.initOffsetYTab[idx] + num1 * self.cellSizeTab[idx].height
        if curOffsetY > maxValue then
          curOffsetY = maxValue
        end

        local delta = curOffsetY - self.initOffsetYTab[idx]
        local count = math.floor( delta / self.cellSizeTab[idx].height )
        local dx = delta - count * self.cellSizeTab[idx].height

        --向上正方向
        local direction = 1
        if curOffsetY - self.innerStartPos1 < 0 then
          ----向下负方向
          direction = 2
        end
        if dx >= self.cellSizeTab[idx].height / 2 then
          count = count + 1
        elseif dx <= -self.cellSizeTab[idx].height / 2 then
          count = count - 1
        end
        self.selectIdxTab[idx] = count + 1
        --print("scrollIdx1 ==>> ", self.selectIdxTab[idx])
        local needY = self.initOffsetYTab[idx] + count * self.cellSizeTab[idx].height
        local curppps = innerNode:getPositionY()
        -- print("needY ==>> ", needY)
        if needY then
          local disY = needY - curppps
          if math.abs(disY * 0.5) >= 1 then
            innerNode:setPositionY(curppps + disY * 0.2)
          else
            innerNode:setPositionY(needY)
          end
        end

      end)
    end
  elseif idx == 2 then
    local newTime = 0
    if self.scrollTimerID2  == nil then
      self.scrollTimerID2 = TFDirector:addTimer(30, -1, nil, 
      function()
        -- 等待滑动惯性结束
        if newTime < self.CHECK_DELAY_TIME then
          newTime = newTime + 30
          return
        end

        local innerNode = self.scrollTab[idx]:getInnerContainer()
        local curOffsetY = self.scrollTab[idx]:getContentOffset().y
        
        if curOffsetY < self.initOffsetYTab[idx] then
          curOffsetY = self.initOffsetYTab[idx]
        end
        local num1 = math.max( #self.minLevData - 1, 0 )
        local maxValue = self.initOffsetYTab[idx] + num1 * self.cellSizeTab[idx].height
        if curOffsetY > maxValue then
          curOffsetY = maxValue
        end

        local delta = curOffsetY - self.initOffsetYTab[idx]
        local count = math.floor( delta / self.cellSizeTab[idx].height )
        local dx = delta - count * self.cellSizeTab[idx].height

        if dx >= self.cellSizeTab[idx].height / 2 then
          count = count + 1
        elseif dx <= -self.cellSizeTab[idx].height / 2 then
          count = count - 1
        end
        self.selectIdxTab[idx] = count + 1
        --print("scrollIdx2 ==>> ", self.selectIdxTab[idx])
        local needY = self.initOffsetYTab[idx] + count * self.cellSizeTab[idx].height
        local curppps = innerNode:getPositionY()
        -- print("needY ==>> ", needY)
        if needY then
          local disY = needY - curppps
          if math.abs(disY * 0.5) >= 1 then
            innerNode:setPositionY(curppps + disY * 0.2)
          else
            innerNode:setPositionY(needY)
          end
        end

      end)
    end
  elseif idx == 3 then
    local newTime = 0
    if self.scrollTimerID3  == nil then
      self.scrollTimerID3 = TFDirector:addTimer(30, -1, nil, 
      function()
        -- 等待滑动惯性结束
        if newTime < self.CHECK_DELAY_TIME then
          newTime = newTime + 30
          return
        end

        local innerNode = self.scrollTab[idx]:getInnerContainer()
        local curOffsetY = self.scrollTab[idx]:getContentOffset().y

        if curOffsetY > self.initOffsetYTab[idx] then
          curOffsetY = self.initOffsetYTab[idx]
        end
        local num1 = math.max( #self.maxLevData - 1, 0 )
        local maxValue = self.initOffsetYTab[idx] - num1 * self.cellSizeTab[idx].height
        if curOffsetY < maxValue then
          curOffsetY = maxValue
        end

        local delta = self.initOffsetYTab[idx] - curOffsetY
        local count = math.floor( delta / self.cellSizeTab[idx].height )
        local dx = delta - count * self.cellSizeTab[idx].height

        if dx >= self.cellSizeTab[idx].height / 2 then
          count = count + 1
        elseif dx <= -self.cellSizeTab[idx].height / 2 then
          count = count - 1
        end
        self.selectIdxTab[idx] = self.maxLevData[#self.maxLevData] - count
        local needY = self.initOffsetYTab[idx] - count * self.cellSizeTab[idx].height
        local curppps = innerNode:getPositionY()
        if needY then
          local disY = needY - curppps
          if math.abs(disY * 0.5) >= 1 then
            innerNode:setPositionY(curppps + disY * 0.2)
          else
            innerNode:setPositionY(needY)
          end
        end
      end)
    end
  end
end

function IslandCreateTeam:removeUI()
	self.super.removeUI(self)

  if self.scrollTimerID1 then
    TFDirector:removeTimer(self.scrollTimerID1)
    self.scrollTimerID1 = nil
  end

  if self.scrollTimerID2 then
    TFDirector:removeTimer(self.scrollTimerID2)
    self.scrollTimerID2 = nil
  end

  if self.scrollTimerID3 then
    TFDirector:removeTimer(self.scrollTimerID3)
    self.scrollTimerID3 = nil
  end

  if self.cell_chap then
    self.cell_chap:release()
    self.cell_chap = nil
  end  
  if self.cell_lev1 then
    self.cell_lev1:release()
    self.cell_lev1 = nil
  end 
  if self.cell_lev2 then
    self.cell_lev2:release()
    self.cell_lev2 = nil
  end 
end

function IslandCreateTeam:onShow()
    self.super.onShow(self)

    if self.scrollTimerID1 then
      TFDirector:removeTimer(self.scrollTimerID1)
      self.scrollTimerID1 = nil
    end
    if self.scrollTimerID2 then
      TFDirector:removeTimer(self.scrollTimerID2)
      self.scrollTimerID2 = nil
    end
    if self.scrollTimerID3 then
      TFDirector:removeTimer(self.scrollTimerID3)
      self.scrollTimerID3 = nil
    end
end

function IslandCreateTeam:refreshUI()
  self:refreshCheck()
  -- scroll里的数据源
  self:refreshDatas()
  self:refreshScrolls()
end

function IslandCreateTeam:refreshDatas()
  self.chapData = {}
  for v in JapanTeamChapterData:iterator() do
    if v.chapter_id <= JapanIslandManager.passedChap + 1 then
      table.insert( self.chapData, v )
    end
  end
  table.sort( self.chapData, function(a, b)
    return a.chapter_id < b.chapter_id
  end)
end

function IslandCreateTeam:refreshScrolls()
  local num1 = math.max(#self.chapData - 1, 0)
  self.scroll_chap:setInnerContainerSize(CCSizeMake(self.scrollSizeTab[1].width, self.scrollSizeTab[1].height + self.cellSizeTab[1].height * num1))
   
  local num2 = math.max(#self.minLevData - 1, 0)
  self.scroll_minlev:setInnerContainerSize(CCSizeMake(self.scrollSizeTab[2].width, self.scrollSizeTab[2].height + self.cellSizeTab[2].height * num2))

  local num3 = math.max(#self.maxLevData - 1, 0)
  self.scroll_maxlev:setInnerContainerSize(CCSizeMake(self.scrollSizeTab[3].width, self.scrollSizeTab[3].height + self.cellSizeTab[3].height * num3))

  local innerNode1 = self.scroll_chap:getInnerContainer()
  if not self.cellChapTab then
    self.cellChapTab = {}
    for i = 1, #self.chapData do
      self.cellChapTab[i] = self.cell_chap:clone()
      self.cellChapTab[i]:setVisible(true)
      local delta = (i - 1) * self.cellSizeTab[1].height
      self.cellChapTab[i]:setPosition(ccp( self.posTab[1].x, self.posTab[1].y + innerNode1:getSize().height - self.scrollSizeTab[1].height - delta ))
      innerNode1:addChild( self.cellChapTab[i] )

      local txt_name = TFDirector:getChildByPath( self.cellChapTab[i], "txt_name_chap" ) 
      txt_name:setText( self.chapData[i].name )
    end
  end

  local innerNode2 = self.scroll_minlev:getInnerContainer()
  if not self.cellMinTab then
    self.cellMinTab = {}
    for i = 1, #self.minLevData do
      self.cellMinTab[i] = self.cell_lev1:clone()
      self.cellMinTab[i]:setVisible(true)
      local delta = (i - 1) * self.cellSizeTab[2].height
      self.cellMinTab[i]:setPosition(ccp( self.posTab[2].x, self.posTab[2].y + innerNode2:getSize().height - self.scrollSizeTab[2].height - delta ))
      innerNode2:addChild( self.cellMinTab[i] )

      local txt_name = TFDirector:getChildByPath( self.cellMinTab[i], "txt_name_lev1" ) 
      txt_name:setText( self.minLevData[i] )
    end
  end

  local innerNode3 = self.scroll_maxlev:getInnerContainer()
  if not self.cellMaxTab then
    self.cellMaxTab = {}
    for i = 1, #self.maxLevData do
      self.cellMaxTab[i] = self.cell_lev2:clone()
      self.cellMaxTab[i]:setVisible(true)
      local delta = (i - 1) * self.cellSizeTab[3].height
      self.cellMaxTab[i]:setPosition(ccp( self.posTab[3].x, self.posTab[3].y + innerNode3:getSize().height - self.scrollSizeTab[3].height - delta ))
      innerNode3:addChild( self.cellMaxTab[i] )

      local txt_name = TFDirector:getChildByPath( self.cellMaxTab[i], "txt_name_lev2" ) 
      txt_name:setText( self.maxLevData[i] )
    end
    self.scroll_maxlev:setContentOffset(-self.scrollSizeTab[3].height, 0)
  end

  self.initOffsetYTab = self.initOffsetYTab or {}
  for i = 1, 3 do
    self.initOffsetYTab[i] = self.scrollTab[i]:getContentOffset().y
  end
end

function IslandCreateTeam:refreshCheck()
  self.selectCheck = self.selectCheck or 1
  for i = 1, 2 do
    if self.selectCheck == i then
      self.btn_check[i]:setTextureNormal("ui_new/common/check_yes.png")
    else
      self.btn_check[i]:setTextureNormal("ui_new/common/check_no.png")
    end
  end
end

function IslandCreateTeam:registerEvents()
    self.btn_ok:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCreateClick))
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCloseClick))

    for i = 1, 2 do
      self.btn_check[i]:setTouchEnabled(true)
      self.btn_check[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckClick))
    end

    self.scroll_chap:addMEListener(TFWIDGET_TOUCHBEGAN, self.scrollTouchBegan1);
    self.scroll_chap:addMEListener(TFWIDGET_TOUCHMOVED, self.scrollTouchMoved1);
    self.scroll_chap:addMEListener(TFWIDGET_TOUCHENDED, self.scrollTouchEnded1);
    self.scroll_chap:addMEListener(TFWIDGET_TOUCHCANCELLED, self.scrollTouchCancelled1);

    self.scroll_minlev:addMEListener(TFWIDGET_TOUCHBEGAN, self.scrollTouchBegan2);
    self.scroll_minlev:addMEListener(TFWIDGET_TOUCHMOVED, self.scrollTouchMoved2);
    self.scroll_minlev:addMEListener(TFWIDGET_TOUCHENDED, self.scrollTouchEnded2);
    self.scroll_minlev:addMEListener(TFWIDGET_TOUCHCANCELLED, self.scrollTouchCancelled2);

    self.scroll_maxlev:addMEListener(TFWIDGET_TOUCHBEGAN, self.scrollTouchBegan3);
    self.scroll_maxlev:addMEListener(TFWIDGET_TOUCHMOVED, self.scrollTouchMoved3);
    self.scroll_maxlev:addMEListener(TFWIDGET_TOUCHENDED, self.scrollTouchEnded3);
    self.scroll_maxlev:addMEListener(TFWIDGET_TOUCHCANCELLED, self.scrollTouchCancelled3);  

    self.UpdateTeamInfoMsgCallBack = function(event)
        --AlertManager:close()
        local status = JapanIslandManager:getTeamStatus()
        if status and status == 3 then
          AlertManager:closeLayer(self)
        end
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.MY_TEAM_REPONSE, self.UpdateTeamInfoMsgCallBack)   
end

function IslandCreateTeam:removeEvents()
    self.super.removeEvents(self)	

    TFDirector:removeMEGlobalListener(JapanIslandManager.MY_TEAM_REPONSE, self.UpdateTeamInfoMsgCallBack)    
    self.UpdateTeamInfoMsgCallBack = nil
end

function IslandCreateTeam.onCreateClick( sender )
    local self = sender.logic

    local minLv = self.selectIdxTab[2] or 1
    local maxLv = self.selectIdxTab[3] or self.maxLev

    if minLv > maxLv then
      local temp = minLv
      minLv = maxLv
      maxLv = temp
    end
    JapanIslandManager:requestCreateTeam(self.selectIdxTab[1], minLv, maxLv, self.selectCheck - 1)  
    AlertManager:close()
end

function IslandCreateTeam.onCloseClick( sender )
    AlertManager:close()
end

function IslandCreateTeam.onCheckClick( sender )
  local self = sender.logic
  local idx = sender.idx
  if idx == self.selectCheck then
    return 
  else
    self.selectCheck = idx
    self:refreshCheck()
  end
end

return IslandCreateTeam