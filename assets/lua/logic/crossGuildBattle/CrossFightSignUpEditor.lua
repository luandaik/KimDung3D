-- client side CrossFightSignUpEditor.lua
--[[
 * @Description: 帮主编辑报名界面
 ]]
-- script writer Stephen.tao
-- creation time 2016-05-24

local CrossFightSignUpEditor = class("CrossFightSignUpEditor", BaseLayer)

CrossFightSignUpEditor.ZHENLIE_COUNT = 3
CrossFightSignUpEditor.ZHENLIE_ROLE_COUNT = 10
CrossFightSignUpEditor.FENGE_COUNT = 12

CrossFightSignUpEditor.leaderData = {}
CrossFightSignUpEditor.memberData = {}
CrossFightSignUpEditor.memberData1 = {}

local POS_X = 624
local POS_X_MIDDLE = 314
local POS_DEST_X = 312
local POS_DEST_Y = 0
local INDEX_DELTA = 20

function CrossFightSignUpEditor:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.FactionSignUpEditor")

    self.cur_zhenlie_index = 1
    self.insert_index = nil
    self.firstShow = true
end

function CrossFightSignUpEditor:initUI(ui)
	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.btn_close.logic = self

    self.panel_content = TFDirector:getChildByPath(ui, "Panel_Content")
    self.img_di = TFDirector:getChildByPath(ui, "img_di")   

    --阵列底纹
    self.img_diwen = TFDirector:getChildByPath(self.img_di, "img_di1")

    --阵列图片
    self.img_zhenlie = TFDirector:getChildByPath(self.img_di, "img_di2")

    --左边背景panel
    self.panel_table1 = TFDirector:getChildByPath(self.img_di, "panel_table")

    --左边已报名cell
    self.panel_zhenlie = {}
    self.btn_delete = {}
    for i = 1, self.ZHENLIE_ROLE_COUNT do
        self.panel_zhenlie[i] = TFDirector:getChildByPath(self.img_di, "panel_zhenlie" .. i)
        self.btn_delete[i] = TFDirector:getChildByPath(self.panel_zhenlie[i], "btn_xuanze")
        self.btn_delete[i].logic = self
        self.btn_delete[i].index = i

        self.panel_zhenlie[i].img_jingying1 = TFDirector:getChildByPath(self.panel_zhenlie[i], "img_jingying1")
        self.panel_zhenlie[i].img_jingying1:setTouchEnabled(true)
        self.panel_zhenlie[i].img_jingying1.logic = self
        self.panel_zhenlie[i].img_jingying1:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle);
        self.panel_zhenlie[i].img_jingying1:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
        self.panel_zhenlie[i].img_jingying1:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
        self.panel_zhenlie[i].img_jingying1.posIndex = i

        self.panel_zhenlie[i].img_jingying1di = TFDirector:getChildByPath(self.panel_zhenlie[i], "img_jingying1di")
        self.panel_zhenlie[i].img_jingying1di:setVisible(true)

        self.panel_zhenlie[i].img_touxiang = TFDirector:getChildByPath(self.panel_zhenlie[i], "img_touxiang")
        self.panel_zhenlie[i].txt_name = TFDirector:getChildByPath(self.panel_zhenlie[i], 'txt_name')
        self.panel_zhenlie[i].txt_num = TFDirector:getChildByPath(self.panel_zhenlie[i], 'txt_num')
    end

    self.btn_ok = TFDirector:getChildByPath(self.img_di, "btn_ok")
    self.btn_ok.logic = self

    self.img_di2 = TFDirector:getChildByPath(ui, "img_di22")

    self.img_di:setZOrder(10)
    self.img_di2:setZOrder(5)

    --创建TabView
    local tabViewUI = TFDirector:getChildByPath(self.img_di2, "panel_table")
    local tabView = TFTableView:create()
    tabView:setTableViewSize(tabViewUI:getContentSize())
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)    
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    tabViewUI:addChild(tabView)
    self.tabViewUI = tabViewUI
    tabView:setPosition(ccp(0, 0))
    self.tabView = tabView

    self.cellModel2 = TFDirector:getChildByPath(self.img_di2, "panel_zhenlie1")
    self.cellModel2:setVisible(false)

    self.btn_pageleft = TFDirector:getChildByPath(ui, "btn_pageleft")
    self.btn_pageright = TFDirector:getChildByPath(ui, "btn_pageright")

    self.btn_pageleft:setZOrder(66)
    self.btn_pageright:setZOrder(66)

    self.btn_pageleft.logic = self
    self.btn_pageright.logic = self

    self.zhenlie_path = 
    {
        [1] = "ui_new/faction/fight/img_zhenlie1_1.png",
        [2] = "ui_new/faction/fight/img_zhenlie2_1.png",
        [3] = "ui_new/faction/fight/img_zhenlie3_1.png"
    }

    self.fenge = {}
    for i = 1, self.FENGE_COUNT do
        self.fenge[i] = TFDirector:getChildByPath(ui, "img_fenge" .. tostring(i))
        self.fenge[i]:setVisible(false)
    end

    self.img_lines = TFDirector:getChildByPath(ui, "img_lines")
    self.img_linexia = TFDirector:getChildByPath(ui, "img_linexia")
end

function CrossFightSignUpEditor:tableScroll(table)
    local size = self.tabView:getTableViewSize()
    local size2 = self.tabView:getContentSize()
    local pos = self.tabView:getContentOffset()
    if pos.y == size.height - size2.height then
        self.img_lines:setVisible(false)
    else
        self.img_lines:setVisible(true)
    end
    if pos.y == 0 then
        self.img_linexia:setVisible(false)
    else
        self.img_linexia:setVisible(true)
    end
end


function CrossFightSignUpEditor:removeUI()
	self.super.removeUI(self)
end

function CrossFightSignUpEditor:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function CrossFightSignUpEditor:refreshUI()
    table.sort(self.memberData1, function(a, b)
        return a.power > b.power
    end)
    self:refreshLeft()
    self:refreshUp()
    self.tabView:reloadData()
    self.tabView:scrollToYTop(0)
end

function CrossFightSignUpEditor:refreshLeft()
    for i = 1, self.ZHENLIE_ROLE_COUNT do
        self.panel_zhenlie[i].img_jingying1:setVisible(false)
        self.panel_zhenlie[i].img_jingying1di:setVisible(true)
    end

    for i = 1, #self.memberData[self.cur_zhenlie_index] do
        local data = self.memberData[self.cur_zhenlie_index][i]
        self.panel_zhenlie[i].img_jingying1:setVisible(true)
        local RoleIcon = RoleData:objectByID(data.profession)

        self.panel_zhenlie[i].img_touxiang:setTexture(RoleIcon:getIconPath())
        Public:addFrameImg(self.panel_zhenlie[i].img_touxiang, data.headPicFrame)
        Public:addInfoListen(self.panel_zhenlie[i].img_touxiang, true, 3, data.playerId)
        self.panel_zhenlie[i].txt_name:setText(data.playerName)
        self.panel_zhenlie[i].txt_num:setText(data.power)
    end  
end

function CrossFightSignUpEditor:refreshUp()
    self.img_zhenlie:setTexture(self.zhenlie_path[self.cur_zhenlie_index])
end

function CrossFightSignUpEditor:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    for i = 1, #self.btn_delete do
        self.btn_delete[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onDeleteClickHandle))
    end

    self.btn_ok:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onOKClickHandle))
    self.btn_pageleft:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPageLeftClickHandle))
    self.btn_pageright:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPageRightClickHandle))

    self.tabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tabView:addMEListener(TFTABLEVIEW_SCROLL, handler(CrossFightSignUpEditor.tableScroll,self))
    Public:bindScrollFun(self.tabView)
    self.tabView.logic = self
    self.tabView:reloadData()

    self.guildMemberUpdateCallBack = function(event)
        if self.firstShow == true then
            self:dataReady()            
        else
            AlertManager:close()
            toastMessage(localizable.FactionFightManager_edit_success)
        end
    end
    TFDirector:addMEGlobalListener(CrossGuildBattleManager.guildMemberUpdate ,self.guildMemberUpdateCallBack )
end

function CrossFightSignUpEditor.onDeleteClickHandle(sender)
    local self = sender.logic
    local index = sender.index

    self:runZhenlieAction(index)
end

function CrossFightSignUpEditor:runZhenlieAction(index)
    local temp_zhenlie = self.panel_zhenlie[index].img_jingying1:clone()
    local src_pos = self.panel_zhenlie[index]:getPosition()
    temp_zhenlie:setPosition(src_pos)
    self.panel_zhenlie[index]:getParent():addChild(temp_zhenlie)
    self.panel_zhenlie[index].img_jingying1:setVisible(false)

    temp_zhenlie:setVisible(true)
    temp_zhenlie:setZOrder(100)
    local act1 = CCMoveTo:create(0.3, ccp(POS_DEST_X, POS_DEST_Y))

    local function callFunc()
        temp_zhenlie:removeFromParentAndCleanup(true)
        temp_zhenlie = nil
        self.panel_zhenlie[index].img_jingying1:setVisible(true)
        local toInsert = clone( self.memberData[self.cur_zhenlie_index][index] )
        self:deleteFromLeft(index)
        self:insertToRight(toInsert)
        self:refreshUI()
    end
    local seq = CCSequence:createWithTwoActions(act1, CCCallFunc:create(callFunc))
    temp_zhenlie:runAction(seq)
end

function CrossFightSignUpEditor:insertToRight(toInsert)
    table.insert(self.memberData1, toInsert)
end

function CrossFightSignUpEditor.onOKClickHandle(sender)
    local self = sender.logic
    showLoading()
    local tab = {}

    for i = 1, 3 do
        local data = self.memberData[i] or {}
        tab[i] = {}
        local members = {}
        for j = 1, #data do
            table.insert(members, data[j].playerId)
        end
        tab[i][1] = members
        tab[i][2] = 0
    end

    local Msg = 
    {
        tab,
    }

    print("Msg = ", Msg)

    self.firstShow = false

    TFDirector:send(c2s.UPDATE_CROSS_APPLY, Msg)
end

function CrossFightSignUpEditor.onPageLeftClickHandle(sender)
    local self = sender.logic

    local cur_index = self.cur_zhenlie_index
    cur_index = cur_index - 1
    if cur_index < 1 then
        cur_index = 3
    end
    self.cur_zhenlie_index = cur_index

    self:refreshUI()
end

function CrossFightSignUpEditor.onPageRightClickHandle(sender)
    local self = sender.logic

    local cur_index = self.cur_zhenlie_index
    cur_index = cur_index + 1
    if cur_index > 3 then
        cur_index = 1
    end
    self.cur_zhenlie_index = cur_index

    self:refreshUI()
end

function CrossFightSignUpEditor.cellSizeForTable(table,idx)
    return 80, 230
end

function CrossFightSignUpEditor.numberOfCellsInTableView(table)
    local self = table.logic

    return #self.memberData1
end

function CrossFightSignUpEditor.tableCellAtIndex(table, idx)
    local self = table.logic;
    local tableIdx = table.idx
    
    local cell = table:dequeueCell()
    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel2:clone()
        panel:setPosition(ccp(0,0))
        cell:addChild(panel)
        panel:setTag(10086)
        panel:setVisible(true)
    else
        panel = cell:getChildByTag(10086)
        panel:setVisible(true)
    end

    idx = idx + 1
    panel:setOpacity(255)
    cell.posIndex = INDEX_DELTA + idx

    local img_touxiang = TFDirector:getChildByPath(panel, 'img_touxiang')
    local txt_name = TFDirector:getChildByPath(panel, 'txt_name')
    local txt_num = TFDirector:getChildByPath(panel, 'txt_num')
    local img_putong = TFDirector:getChildByPath(panel, "img_jingying1")

    cell.logic = self

    local itemData = self.memberData1[idx]
    if itemData then
        local RoleIcon = RoleData:objectByID(itemData.profession)
        if RoleIcon then
            img_touxiang:setTexture(RoleIcon:getIconPath())
            Public:addFrameImg(img_touxiang,itemData.headPicFrame)
            --Public:addInfoListen(img_touxiang,true,3,itemData.playerId)
            txt_name:setText(itemData.playerName)
            txt_num:setText(itemData.power)
        end
    end
 
    img_putong.logic = self
    img_putong.posIndex = INDEX_DELTA + idx
    img_putong:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle);
    img_putong:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
    img_putong:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
    --img_putong:addMEListener(TFWIDGET_CLICK, self.cellClickHandle);
    
    return cell
end

function CrossFightSignUpEditor.cellTouchBeganHandle(cell)
    local self = cell.logic
    
    cell.isClick = true
    cell.isDrag = false
    self.isMove = false

    self.offest = self.tabView:getContentOffset()

    self.onLongTouch = function(event)
        if self.isMove == false then
            return;
        end

        local pos = cell:getTouchMovePos();
          
        local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());
      
        if (math.abs(v.x) < 60 or math.abs(v.y) < 100 )  then            

        else 
            self:removeLongTouchTimer();    
            if (v.x - v.y > -10) then
                cell.isDrag  = true;
                self.tabView:setTouchEnabled(false);
            else
                cell.isDrag  = false;
                self.tabView:setTouchEnabled(true);
            end
        end
        
    end;

    self:removeLongTouchTimer();
    self.longTouchTimerId = TFDirector:addTimer(0.001, -1, nil, self.onLongTouch); 
end

function CrossFightSignUpEditor.cellTouchMovedHandle(cell)
    local self = cell.logic;
    self.isMove = true;
    
    local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());

    local pos = cell:getTouchMovePos();

    if self.selectCussor == nil then
        if cell.posIndex >= 20 then
            if math.abs(v.x) < 60 or math.abs(v.y) > 100 then
                return
            end
        end

        self:createSelectCussor(cell,pos);
    end

    if cell.isClick == true then
        return;
    end

    self:moveSelectCussor(cell,pos);
end

function CrossFightSignUpEditor.cellTouchEndedHandle(cell)
    local self = cell.logic;
    if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end
    self:removeLongTouchTimer();

    local pos = cell:getTouchEndPos();

    self:releaseSelectCussor(cell, pos);

    if self.insert_index then
        self:insertToZhenlie(self.insert_index)
    elseif (self.curIndex and self.curIndex <= 10) then 
        local temp = clone( self.memberData[self.cur_zhenlie_index][self.curIndex] )
        self:deleteFromLeft(self.curIndex)
        self:insertToRight(temp)
        self:refreshUI()   
    end

    self:hideFenge()
end

function CrossFightSignUpEditor:insertToZhenlie(index)
    local temp = nil
    local toInsert = {}
    if self.curIndex <= 10 then
        temp = self.curIndex
        toInsert = clone(self.memberData[self.cur_zhenlie_index][self.curIndex])
        self:deleteFromLeft(temp)
    elseif self.curIndex > 20 then
        temp = self.curIndex - 20
        toInsert = clone(self.memberData1[temp])
        self:deleteFromRight(temp)     
    end

    local tab = self.memberData[self.cur_zhenlie_index]
    print("******* insert_index ********", self.insert_index)
    print("tab = ", tab)
    if not self.insert_index then
        return
    end

    if self.insert_index <= 6 then   
        if self.insert_index == 2 and self.curIndex == 1 then
            self.insert_index = 1
        end 

        if self.curIndex <= 10 and (self.insert_index > self.curIndex + 1) then
            self.insert_index = self.insert_index - 1           
        end

        if self.insert_index > #tab + 1 then
            self.insert_index = #tab + 1
        end 

        table.insert(tab, self.insert_index, toInsert)
    elseif self.insert_index <= 12 then
        if self.insert_index == 8 and self.curIndex == 6 then
            self.insert_index = 7
        end  

        if self.curIndex <= 10 and (self.insert_index > self.curIndex + 1) then
            self.insert_index = self.insert_index - 1           
        end

        if self.insert_index > #tab + 2 then
            self.insert_index = #tab + 2
        end 

        table.insert(tab, self.insert_index - 1, toInsert)
    end

    

    if tab and #tab > self.ZHENLIE_ROLE_COUNT then
        local toInsert = clone( tab[#tab] )
        table.remove(tab, #tab)
        self:insertToRight(toInsert)
    end

    self:refreshUI()
end

function CrossFightSignUpEditor:deleteFromRight(index)
    table.remove(self.memberData1, index)
end

function CrossFightSignUpEditor:deleteFromLeft(index)
    table.remove(self.memberData[self.cur_zhenlie_index], index)
end

function CrossFightSignUpEditor:createSelectCussor(cell, pos)
    play_press();

    cell.isClick = false;

    self.lastPoint = pos;

    self.selectCussor = cell:clone()
    self.selectCussor:setAnchorPoint(ccp(0.5, 0.5))
    self.selectCussor:setPosition(pos);
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);
   
    self.curIndex = cell.posIndex;   

    print("******** curIndex =  **********", self.curIndex) 
end

function CrossFightSignUpEditor:moveSelectCussor(cell, pos)
    local v = ccpSub(pos, self.lastPoint);
    self.lastPoint = pos;
    local scp = ccpAdd(self.selectCussor:getPosition(), v);
    self.selectCussor:setPosition(scp);
    self.selectCussor:setVisible(true);

    if scp.x >= POS_X then
        self:hideFenge()
    else
        local index = self:getClosestFenge(scp)
        self:showFenge(index)
    end
end

function CrossFightSignUpEditor:hideFenge()
    for i = 1, self.FENGE_COUNT do
        self.fenge[i]:setVisible(false)
    end
    self.insert_index = nil
end

function CrossFightSignUpEditor:showFenge(index)
    self:hideFenge()

    local num = #self.memberData[self.cur_zhenlie_index]

    if num <= 5 then
        if index > num then
            index = num + 1
        end
    elseif num <= 10 then
        if index > num + 1 then
            index = num + 2
        end
    else
        index = 12
    end

    self.insert_index = index
    self.fenge[index]:setVisible(true)
end

function CrossFightSignUpEditor:getClosestFenge(pos)
    local ins_list = {}
    for i = 1, self.FENGE_COUNT do
        local pos1 = self.fenge[i]:getParent():convertToWorldSpaceAR(self.fenge[i]:getPosition())
        local pos_dis = ccpSub(pos, pos1)
        local dis = math.sqrt( pos_dis.x * pos_dis.x + pos_dis.y * pos_dis.y )

        ins_list[i] = {k = i, v = dis}  
    end

    table.sort(ins_list, function(a, b)
        return a.v < b.v
    end)

    return ins_list[1].k
end

function CrossFightSignUpEditor:releaseSelectCussor(cell,pos)
    
end

function CrossFightSignUpEditor:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId);
        self.longTouchTimerId = nil;
    end
end

function CrossFightSignUpEditor:updateMemberInfo()
    self.leaderData = {}
    self.memberData = {}
    --未报名帮派成员
    self.memberData1 = {}
    for i = 1, self.ZHENLIE_COUNT do        
        self.leaderData[i] = {}
        self.memberData[i] = {}
    end
    --self.tabView:reloadData()
    CrossGuildBattleManager:queryCrossGuildBattleMemberInfo()
end

function CrossFightSignUpEditor:dataReady()
    for i = 1, self.ZHENLIE_COUNT do        
        self.leaderData[i] = clone( CrossGuildBattleManager:getLeaderDataByIndex(i) )
        self.memberData[i] = clone( CrossGuildBattleManager:getMemberDataByIndex(i) )
    end
    self.memberData1 = CrossGuildBattleManager:getUnSignupMemberData()
    self.tabView:reloadData()

    self:refreshLeft()
end

function CrossFightSignUpEditor:removeEvents()

    self.super.removeEvents(self)
    
    self.tabView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.tabView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.tabView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)
    self.tabView:removeMEListener(TFTABLEVIEW_SCROLL)
    
    if self.guildMemberUpdateCallBack then
        TFDirector:removeMEGlobalListener(CrossGuildBattleManager.guildMemberUpdate,self.guildMemberUpdateCallBack)    
        self.guildMemberUpdateCallBack = nil
    end
end

function CrossFightSignUpEditor:dispose()
	self.super.dispose(self)
end

return CrossFightSignUpEditor