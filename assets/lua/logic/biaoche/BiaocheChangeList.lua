local BiaocheChangeList = class("BiaocheChangeList", BaseLayer)

local MaxQueueNum = 4

function BiaocheChangeList:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.BiaocheChangeList")
end

function BiaocheChangeList:initUI( ui )
	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")

    self.panel_cell = TFDirector:getChildByPath(ui, "panel_role_cell")
    self.panel_cell:setVisible(false)
    self.panel_cell:retain()
    self.panel_cell:removeFromParent()

    self.panel_zhenlie = {}
    self.tabViewList = {}
    self.txt_number = {}
    self.panel_list = {}
    for i = 1, MaxQueueNum do
        self.panel_zhenlie[i] = TFDirector:getChildByPath(ui, "panel_zhenlie" .. i)
        self.panel_list[i] = TFDirector:getChildByPath( self.panel_zhenlie[i], "Panel_role" )

        self.txt_number[i] = TFDirector:getChildByPath( self.panel_zhenlie[i], "txt_number" )

        local tabView = TFTableView:create()
        tabView:setTableViewSize(self.panel_list[i]:getContentSize())
        tabView:setDirection(TFTableView.TFSCROLLVERTICAL)    
        tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        tabView.logic = self
        self.panel_list[i]:addChild(tabView)
        tabView:setPosition(ccp(0, 0))
        self.tabViewList[i] = tabView
    end
end

function BiaocheChangeList:removeUI()
	self.super.removeUI(self)
    self:removeLongTouchTimer()
    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
end

function BiaocheChangeList:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function BiaocheChangeList:refreshData()
    self.data = BiaoCheManager:getSignUpInfo()
    local constName = {"EscortAgencyFillUpArmor","EscortAgencyFillUpFlag","EscortAgencyFillUpWheel","EscortAgencyFillUpCarriage"}
    for i = 1, MaxQueueNum do
        self.data[i] = self.data[i] or {}
        local curNum = #(self.data[i])
        local maxNum = ConstantData:objectByID(constName[i]).value
        print("i = ",i)
        print("#self.txt_number",#self.txt_number)
        self.txt_number[i]:setText(curNum .. "/" .. maxNum)
    end
end

function BiaocheChangeList:refreshUI()
    self:refreshData()
    self:refreshTabViews()
end

function BiaocheChangeList:refreshTabViews()
    for i = 1, MaxQueueNum do
        if self.tabViewList[i] then
            self.tabViewList[i]:reloadData()
        end
    end
end

function BiaocheChangeList:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    self.signUpChangeCallBack = function(event)
       self:refreshUI()
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_CHANGE_SIGN_UP_INFO, self.signUpChangeCallBack)

    for k, v in pairs(self.tabViewList) do
        self.tabViewList[k]:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
        self.tabViewList[k]:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
        self.tabViewList[k]:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
        self.tabViewList[k].logic = self
        self.tabViewList[k].idx = k        
    end
end

function BiaocheChangeList:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_CHANGE_SIGN_UP_INFO, self.signUpChangeCallBack)    
    self.signUpChangeCallBack = nil

    for k,v in pairs(self.tabViewList) do
        self.tabViewList[k]:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
        self.tabViewList[k]:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
        self.tabViewList[k]:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)
    end
end

function BiaocheChangeList:dispose()
	self.super.dispose(self)
end

function BiaocheChangeList.cellSizeForTable(table,idx)
    return 80, 230
end

function BiaocheChangeList.numberOfCellsInTableView(table)
    local self = table.logic;
    local idx = table.idx
    return #self.data[idx]
end

function BiaocheChangeList.tableCellAtIndex(table, idx)
    local self = table.logic;
    local index = table.idx
    local cell = table:dequeueCell()
    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.panel_cell:clone()
        panel:setPosition(ccp(0,0))
        cell:addChild(panel)
        panel:setTag(10086)
        panel:setVisible(true)
        if self.panel_list[index] then
            if self.panel_list[index].cellList == nil then
                self.panel_list[index].cellList = {}
            end
            local length = #(self.panel_list[index].cellList)
            self.panel_list[index].cellList[length + 1] = panel
        end
    else
        panel = cell:getChildByTag(10086)
    end
    panel.idx = idx
    idx = idx + 1
    self:setCellInfo(panel, index, idx)

    return cell
end

function BiaocheChangeList:setCellInfo(panel, index, idx)
    local img_putongdi = TFDirector:getChildByPath(panel, 'img_putongdi')
    local img_putong = TFDirector:getChildByPath(panel, 'img_putong')
    local img_tou = TFDirector:getChildByPath(panel, 'img_tou')
    local img_touxiang = TFDirector:getChildByPath(panel, 'img_touxiang')
    local txt_name = TFDirector:getChildByPath(panel, 'txt_name')
    local txt_num = TFDirector:getChildByPath(panel, 'txt_num')

    local itemData = self.data[index][idx]
    if itemData then
        img_putongdi:setVisible(false)
        img_putong:setVisible(true)

        -- local RoleIcon = RoleData:objectByID(itemData.profession)
        local RoleIcon = RoleData:objectByID(itemData.useCoin or 1)
        if RoleIcon == nil then
            RoleIcon = RoleData:objectByID(77)
        end
        if RoleIcon then
            img_touxiang:setTexture(RoleIcon:getIconPath())
            -- Public:addFrameImg(img_touxiang, itemData.headPicFrame)
            Public:addFrameImg(img_touxiang, itemData.frameId or 1)
            Public:addInfoListen(img_touxiang, true, 3, itemData.playerId)
            txt_name:setText(itemData.playerName)
            txt_num:setText(itemData.power)

            img_putong.playerId = itemData.playerId
            img_putong:setTouchEnabled(true)
            img_putong.logic = self
            img_putong:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle);
            img_putong:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
            img_putong:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
            img_putong:addMEListener(TFWIDGET_TOUCHCANCELLED, self.cellTouchCancelledHandle);
        else
            img_putong:removeMEListener(TFWIDGET_TOUCHBEGAN);
            img_putong:removeMEListener(TFWIDGET_TOUCHMOVED);
            img_putong:removeMEListener(TFWIDGET_TOUCHENDED);

            img_putongdi:setVisible(true)
            img_putong:setVisible(false)
        end
    else
        img_putongdi:setVisible(true)
        img_putong:setVisible(false)
    end
end

function BiaocheChangeList.cellTouchBeganHandle(cell)
    local self = cell.logic
    --print("cell.playerId = ", cell.playerId)
    if cell.playerId == 0 then
        return;
    end
    cell.isClick = true
    cell.isDrag = false
    self.isMove = false

    self.onLongTouch = function(event)
        if self.isMove == false then
            return;
        end

        local pos = cell:getTouchMovePos();
          
        local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());
      
        if (math.abs(v.x) < 100 or math.abs(v.y) < 60 )  then            

        else 
            self:removeLongTouchTimer();    
            if (v.x - v.y > -10) then
                cell.isDrag  = true;
            else
                cell.isDrag  = false;
            end
        end 
    end

    self:removeLongTouchTimer();
    self.longTouchTimerId = TFDirector:addTimer(0.001, -1, nil, self.onLongTouch); 
end

function BiaocheChangeList.cellTouchMovedHandle(cell)
    if cell.playerId == 0 then
        return;
    end    
    --print("cell.playerId = ", cell.playerId)
    local self = cell.logic;
    self.isMove = true;
    
    local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());

    local pos = cell:getTouchMovePos();

    if self.selectCussor == nil then
        self:createSelectCussor(cell, pos);
    end

    if cell.isClick == true then
        return;
    end

    self:moveSelectCussor(cell, pos);
end

function BiaocheChangeList.cellTouchCancelledHandle( cell )
    print("cellTouchCancelledHandle")
    if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end
    self:removeLongTouchTimer();
end

function BiaocheChangeList.cellTouchEndedHandle(cell)
    print("cellTouchEndedHandle")
    if cell.playerId == 0 then
        if self.selectCussor then
            self.selectCussor:removeFromParentAndCleanup(true);
            self.selectCussor = nil;
        end
        self:removeLongTouchTimer();
        return;
    end
    local self = cell.logic;
    if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end
    self:removeLongTouchTimer();

    local pos = cell:getTouchEndPos();
    self:releaseSelectCussor(cell, pos);
end

function BiaocheChangeList:releaseSelectCussor(cell, pos)
    print("releaseSelectCussor pos===>> ", pos)
    local constName = {"EscortAgencyFillUpArmor","EscortAgencyFillUpFlag","EscortAgencyFillUpWheel","EscortAgencyFillUpCarriage"}

    for i = 1, MaxQueueNum do
        local widget = self.panel_list[i]
        local size = widget:getSize()
        local pp = widget:getParent():convertToWorldSpaceAR(widget:getPosition())
        if pos.x >= pp.x and pos.x <= pp.x + size.width and pos.y >= pp.y and pos.y <= pp.y + size.height then
            print("change to index ===>>> ", i)
            local targetCell = nil
            if self.panel_list[i].cellList == nil then
                self.panel_list[i].cellList = {}
            end
            for i,v in ipairs(self.panel_list[i].cellList) do
                local tessss = v:hitTest(pos)
                print("tesssstesssstesssstessss = ",tessss)
                if tessss == true then
                    targetCell = v
                    break
                end
            end
            local changeIndex = #(self.data[i])
            if targetCell ~= nil then
                changeIndex = targetCell.idx
            end
            local maxNum = ConstantData:objectByID(constName[i]).value
            if changeIndex >= maxNum - 1 then
                changeIndex = maxNum - 1
            end
            BiaoCheManager:requestChangeSignUp(cell.playerId, i, changeIndex)
            break
        end
    end
    print("not pos to insert")
end

function BiaocheChangeList:createSelectCussor(cell, pos)
    play_press()
    cell.isClick = false
    self.lastPoint = pos

    self.selectCussor = cell:clone()
    self.selectCussor:setAnchorPoint(ccp(0.5, 0.5))
    self.selectCussor:setPosition(pos);
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);
end

function BiaocheChangeList:moveSelectCussor(cell, pos)
    local v = ccpSub(pos, self.lastPoint);
    self.lastPoint = pos;
    local scp = ccpAdd(self.selectCussor:getPosition(), v);
    self.selectCussor:setPosition(scp);
    self.selectCussor:setVisible(true);
end

function BiaocheChangeList:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId);
        self.longTouchTimerId = nil;
    end
end

return BiaocheChangeList