-- client side YanWuEditor.lua
--[[
 * @Description: Description
 ]]
-- script writer luoconghai
-- creation time 2017-4-12


local YanWuEditor = class("YanWuEditor", BaseLayer)
function YanWuEditor:ctor(equipid)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.faction.YanWuEditor")

end

function YanWuEditor:initUI(ui)
    self.super.initUI(self,ui)

    self.img_di                            = TFDirector:getChildByPath(ui, 'img_di')--右边的已拉取列表 
    self.img_di2                           = TFDirector:getChildByPath(self.img_di, 'img_di2')--右边的已拉取列表 
    
    self.panel_table_right                  = TFDirector:getChildByPath(self.img_di, 'panel_table')
    self.right_panel_zhenlie1              = TFDirector:getChildByPath(self.img_di, 'panel_zhenlie1')
    self.right_panel_zhenlie1:removeFromParent()
    self.right_panel_zhenlie1:retain()

    self.btn_close                         = TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_ok                            = TFDirector:getChildByPath(ui, 'btn_ok')

    self.txt_jipo                          = TFDirector:getChildByPath(ui, 'txt_jipo')

    self.img_linexia                          = TFDirector:getChildByPath(ui, 'img_linexia')
    self.img_lines                            = TFDirector:getChildByPath(ui, 'img_lines')


    self.img_di_left                         = TFDirector:getChildByPath(ui, 'img_di_left')--左边的可拉取列表
    self.panel_table_left                = TFDirector:getChildByPath(self.img_di_left, 'panel_table')
    self.left_panel_zhenlie1             = TFDirector:getChildByPath(self.img_di_left, 'panel_zhenlie1')
    self.left_panel_zhenlie1:removeFromParent()
    self.left_panel_zhenlie1:retain()

    self.btn_pageleft                    = TFDirector:getChildByPath(ui, 'btn_pageleft')
    self.btn_pageleft.logic=self
    self.btn_pageright                   = TFDirector:getChildByPath(ui, 'btn_pageright')
    self.btn_pageright.logic=self
end

function YanWuEditor:registerEvents(ui)
    self.super.registerEvents(self)
    self.btn_pageleft:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btn_pageleftClickHandle),1);
    self.btn_pageright:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btn_pagerightClickHandle),1);
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_ok)

    self.recriveAddOrCutBossHelp=function(event)
        self:refreshData()
        self.tableViewLeft:reloadData()
        self.tableViewRight:reloadData()
    end
    TFDirector:addMEGlobalListener(GuildBossManager.RECEIVE_BOSS_HELP_ADD_OR_CUT ,self.recriveAddOrCutBossHelp)
end

function YanWuEditor:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(GuildBossManager.RECEIVE_BOSS_HELP_ADD_OR_CUT ,self.recriveAddOrCutBossHelp)
end

function YanWuEditor:dispose()
    self.super.dispose(self)
end

function YanWuEditor:removeUI()
    if self.right_panel_zhenlie1 then
        self.right_panel_zhenlie1:release()
        self.right_panel_zhenlie1 = nil
    end
    if self.left_panel_zhenlie1 then
        self.left_panel_zhenlie1:release()
        self.left_panel_zhenlie1 = nil
    end
end

function YanWuEditor:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function YanWuEditor:refreshUI()
    if self.TypeIndex == 1 then
        self.txt_jipo:setText("")
        return
    end
    local bossInfo = GuildBossManager:getBossInfoByType(self.TypeIndex)
    local buffData = GuildBossManager:getBuffDataByid(bossInfo.bossBuff)
    if buffData then
        self.txt_jipo:setText(buffData.desc)
    else
        self.txt_jipo:setText("")
    end
end

function YanWuEditor:isAddToBossHelp(playerId)
    for i,v in ipairs(self.info) do
        for _i,_v in ipairs(v) do
            if  _v.playerId==playerId then
                return true
            end
        end
    end
    return false
end

function YanWuEditor:refreshData()--获取可拉取的帮会成员列表
    self.info = GuildBossManager:getBossHelpInfo() or {}
    local nowTime = MainPlayer:getNowtime()
    local MemberInfo = FactionManager:getMemberInfo()
    self.CanAddFactionInfo = {}
    for k,v in pairs(MemberInfo) do
        local currTime = nowTime - math.floor(v.lastLoginTime/1000)
        if currTime > 259200 then--三天以内上线的
            if not self:isAddToBossHelp(v.playerId) then
                local len = #(self.CanAddFactionInfo)
                self.CanAddFactionInfo[len + 1] = v
            end
        end   
    end
end

function YanWuEditor.btn_pageleftClickHandle(sender)
	local self =sender.logic
	self.TypeIndex=self.TypeIndex-1
    if self.TypeIndex < 1 then
        self.TypeIndex = 4
    end
	self:refleshPageBtn()
	self:initRightTableView()
end

function YanWuEditor.btn_pagerightClickHandle(sender)
	local self =sender.logic
	self.TypeIndex=self.TypeIndex+1
    if self.TypeIndex > 4 then
        self.TypeIndex = 1
    end
	self:refleshPageBtn()
	self:initRightTableView()
end

function YanWuEditor:refleshPageBtn()
    local pathList = {
        "ui_new/faction/yanwu/img_xl4_1.png",
        "ui_new/faction/yanwu/img_xl1_1.png",
        "ui_new/faction/yanwu/img_xl2_1.png",
        "ui_new/faction/yanwu/img_xl3_1.png"
    }
	self.img_di2:setTexture(pathList[ self.TypeIndex ])
    self:refreshUI()
end

function YanWuEditor:setTypeIndex(tableViewIndex)
	self.TypeIndex=tableViewIndex
	self:refreshData()
	self:refleshPageBtn()
	self:initLeftTableView()
	self:initRightTableView()
end


function YanWuEditor:initLeftTableView()
    if self.tableViewLeft == nil then
        local  tableView =  TFTableView:create()

        self.tableViewLeft = tableView
        tableView:setTableViewSize(self.panel_table_left:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableViewLeft:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTableLeft,self))
        self.tableViewLeft:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndexLeft,self))
        self.tableViewLeft:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableViewLeft,self))
        self.tableViewLeft:addMEListener(TFTABLEVIEW_SCROLL, handler(self.tableScroll,self))
        self.panel_table_left:addChild(tableView)
    end
    self.tableViewLeft:reloadData()
end

function YanWuEditor:tableScroll(table)
    local size = self.tableViewLeft:getTableViewSize()
    local size2 = self.tableViewLeft:getContentSize()
    local pos = self.tableViewLeft:getContentOffset()
    if pos.y <= size.height - size2.height then
        self.img_lines:setVisible(false)
    else
        self.img_lines:setVisible(true)
    end
    if pos.y >= 0 then
        self.img_linexia:setVisible(false)
    else
        self.img_linexia:setVisible(true)
    end
end


function YanWuEditor:cellSizeForTableLeft(table,idx)
    return 78,215
end

function YanWuEditor:tableCellAtIndexLeft(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.left_panel_zhenlie1:clone()
        node:setVisible(true)
        node:setPositionY(0)
        cell:addChild(node,1)
        cell.panel = node
    end
    self:setLeftCellInfo(cell,idx)
    return cell
end

function YanWuEditor:numberOfCellsInTableViewLeft(table)
    if self.CanAddFactionInfo == nil then
        return 0
    end
    local num =  #(self.CanAddFactionInfo)
    if num < 0 then num = 0 end
    return num
end

function YanWuEditor:setLeftCellInfo(cell,idx)
    local panel = cell.panel
    if self.CanAddFactionInfo == nil or self.CanAddFactionInfo[idx] == nil then
        panel:setVisible(false)
        return
    end
    panel:setVisible(true)
    local infoData = self.CanAddFactionInfo[idx]
    local img_jingying1=TFDirector:getChildByPath(panel, 'img_jingying1')

    local btn_jia=TFDirector:getChildByPath(panel, 'btn_jia')
    btn_jia.playerId=infoData.playerId
    btn_jia.logic=self
    btn_jia:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onbtn_jiaClickHandle),1);

	img_jingying1:setVisible(true)
	local img_touxiang=TFDirector:getChildByPath(img_jingying1, 'img_touxiang')
	local RoleIcon = RoleData:objectByID(infoData.icon)
    if RoleIcon == nil then
        RoleIcon = RoleData:objectByID(77) 
    end
	img_touxiang:setTexture(RoleIcon:getIconPath())
    Public:addFrameImg(img_touxiang,infoData.headPicFrame)    

	TFDirector:getChildByPath(img_jingying1, 'txt_name'):setString(infoData.name)
	TFDirector:getChildByPath(img_jingying1, 'txt_num'):setString(infoData.power)
end

-------------------------------------右边已选择的tableview       
function YanWuEditor:initRightTableView()
    if self.tableViewRight == nil then
        local  tableView =  TFTableView:create()

        self.tableViewRight = tableView
        tableView:setTableViewSize(self.panel_table_right:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableViewRight:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTableRight,self))
        self.tableViewRight:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndexRight,self))
        self.tableViewRight:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableViewRight,self))
        self.panel_table_right:addChild(tableView)
    end
    self.tableViewRight:reloadData()
end


function YanWuEditor:cellSizeForTableRight(table,idx)
    return 78,550
end

function YanWuEditor:tableCellAtIndexRight(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
    end
    self:setRightCellInfo(cell,idx)
    return cell
end

function YanWuEditor:numberOfCellsInTableViewRight(table)
    if self.info[self.TypeIndex]==nil then
        self.info[self.TypeIndex]={}
    end
    local num = math.ceil(#(self.info[self.TypeIndex])/2) 
    if num < 0 then num = 0 end
    return num
end

function YanWuEditor:setRightCellInfo(cell,idx)
    local info=self.info[self.TypeIndex]
    local width = self.right_panel_zhenlie1:getContentSize().width
    for i=1,2 do
        local node = cell:getChildByTag(100 + i)
        local infoData = info[ (idx - 1) * 2 + i ]
        if infoData then
            if node == nil then
                local posX= (i - 1) * width + 22
                node = self.right_panel_zhenlie1:clone()
                node:setVisible(true)
                node:setPosition(ccp(posX,0))
                cell:addChild(node,1,100 + i)
            end
            node:setVisible(true)
            local img_jingying1=TFDirector:getChildByPath(node, 'img_jingying1')
            local btn_xuanze=TFDirector:getChildByPath(img_jingying1, 'btn_xuanze')
            btn_xuanze.playerId = infoData.playerId
            btn_xuanze.logic=self
            btn_xuanze:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onbtn_xuanzeClickHandle),1);

            img_jingying1:setVisible(true)
            local img_touxiang=TFDirector:getChildByPath(img_jingying1, 'img_touxiang')
            local RoleIcon = RoleData:objectByID(infoData.useCoin) 
            if RoleIcon == nil then
                RoleIcon = RoleData:objectByID(77) 
            end
            img_touxiang:setTexture(RoleIcon:getIconPath())
            Public:addFrameImg(img_touxiang,infoData.frameId)

            TFDirector:getChildByPath(img_jingying1, 'txt_name'):setString(infoData.playerName)
            TFDirector:getChildByPath(img_jingying1, 'txt_num'):setString(infoData.power)
        else
            if node then
                node:setVisible(false)
            end
        end
    end
end

function YanWuEditor.onbtn_jiaClickHandle(sender)
    local self=sender.logic
    local info={}
    info[1]=sender.playerId
    info[2]=GuildBossManager:getBossNpcIdByType( self.TypeIndex )
    info[3]=1
    GuildBossManager:addOrCutBossHelp(info)
end

function YanWuEditor.onbtn_xuanzeClickHandle(sender)
    -- print("英雄下阵")
    local self=sender.logic
    local info={}
    info[1]=sender.playerId
    info[2]=GuildBossManager:getBossNpcIdByType( self.TypeIndex )
    info[3]=2
    GuildBossManager:addOrCutBossHelp(info)
end

return YanWuEditor