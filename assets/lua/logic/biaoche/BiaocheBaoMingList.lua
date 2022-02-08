local BiaocheBaoMingList = class("BiaocheBaoMingList", BaseLayer)

local MaxQueueNum = 4

function BiaocheBaoMingList:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.BiaocheBaoMingList")
end

function BiaocheBaoMingList:initUI( ui )
	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.btn_bianji = TFDirector:getChildByPath(ui, "btn_bianji")
    self.btn_bianji.logic = self

    self.panel_cell = TFDirector:getChildByPath(ui, "panel_role_cell")
    self.panel_cell:setVisible(false)
    self.panel_cell:retain()
    self.panel_cell:removeFromParent()

    self.btn_baoming = {}
    self.panel_zhenlie = {}
    self.tabViewList = {}
    self.txt_number = {}
    self.panel_list = {}
    for i = 1, MaxQueueNum do
        self.panel_zhenlie[i] = TFDirector:getChildByPath(ui, "panel_zhenlie" .. i)
        self.panel_list[i] = TFDirector:getChildByPath( self.panel_zhenlie[i], "Panel_role" )
        self.btn_baoming[i] = TFDirector:getChildByPath( self.panel_zhenlie[i], "btn_liji" )
        self.btn_baoming[i].logic = self
        self.btn_baoming[i].idx = i

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

function BiaocheBaoMingList:removeUI()
	self.super.removeUI(self)

    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
end

function BiaocheBaoMingList:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function BiaocheBaoMingList:refreshData()
    self.data = BiaoCheManager:getSignUpInfo()

    local constName = {"EscortAgencyFillUpArmor","EscortAgencyFillUpFlag","EscortAgencyFillUpWheel","EscortAgencyFillUpCarriage"}
    for i = 1, MaxQueueNum do
        self.data[i] = self.data[i] or {}
        local curNum = #(self.data[i])
        local maxNum = ConstantData:objectByID(constName[i]).value
        self.txt_number[i]:setText(curNum .. "/" .. maxNum)
    end
end

function BiaocheBaoMingList:refreshUI()
    self:refreshData()
    self:refreshBtns()
    self:refreshTabViews()
end

function BiaocheBaoMingList:refreshBtns()
    for i = 1, MaxQueueNum do
        local bGray = false
        if self:isSelfInTeam(i) then
            bGray = true
        end
        if bGray == true then
            self.btn_baoming[i]:setGrayEnabled(true)
            self.btn_baoming[i]:setTouchEnabled(false)
        else
            self.btn_baoming[i]:setGrayEnabled(false)
            self.btn_baoming[i]:setTouchEnabled(true)
        end
    end
    if FactionManager:getPostInFaction() ~= 1 then
        self.btn_bianji:setVisible(false)
    else
        self.btn_bianji:setVisible(true)
    end
end

function BiaocheBaoMingList:refreshTabViews()
    for i = 1, MaxQueueNum do
        if self.tabViewList[i] then
            self.tabViewList[i]:reloadData()
        end
    end
end

function BiaocheBaoMingList:isSelfInTeam(index)
    local data = self.data[index] or {}
    for _, v in pairs(data) do
        if v.playerId == MainPlayer:getPlayerId() then
            return true
        end
    end
    return false
end

function BiaocheBaoMingList:registerEvents()
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    self.signUpCallBack = function(event)
       self:refreshUI()
       toastMessage(localizable.KingWarSignUpSuccess)
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_SIGN_UP_INFO, self.signUpCallBack)

    for k, v in pairs(self.tabViewList) do
        self.tabViewList[k]:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
        self.tabViewList[k]:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
        self.tabViewList[k]:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
        self.tabViewList[k].logic = self
        self.tabViewList[k].idx = k        
    end

    for k, v in pairs(self.btn_baoming) do
        self.btn_baoming[k]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnSignUpClick))
    end

    self.btn_bianji:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnBianjiClickHandle))
end

function BiaocheBaoMingList:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_SIGN_UP_INFO, self.signUpCallBack)    
    self.signUpCallBack = nil

    for k,v in pairs(self.tabViewList) do
        self.tabViewList[k]:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
        self.tabViewList[k]:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
        self.tabViewList[k]:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)
    end
end

function BiaocheBaoMingList:dispose()
	self.super.dispose(self)
end

function BiaocheBaoMingList.btnBianjiClickHandle(btn)
    local self = btn.logic

    if FactionManager:getPostInFaction() ~= 1 then
        --toastMessage("权限不够")
        toastMessage(localizable.common_no_power)
        return
    end

    BiaoCheManager:openEditChangeLayer()
end

function BiaocheBaoMingList.btnSignUpClick( btn )
    --报名
    local self = btn.logic
    local teamIndex = btn.idx
    local curNum = #(self.data[teamIndex])
    local constName = {"EscortAgencyFillUpArmor","EscortAgencyFillUpFlag","EscortAgencyFillUpWheel","EscortAgencyFillUpCarriage"}

    local maxNum = ConstantData:objectByID(constName[teamIndex]).value
    if curNum >= maxNum then
        toastMessage(localizable.BiaoCheBaoMing_txt)
        return
    end
    local myGuildId = FactionManager:getPersonalInfo().guildId
    if myGuildId == nil or myGuildId == 0 then
        toastMessage(localizable.BiaoCheBaoSignUp_txt)
	return
    end
    -- if self:isSelfInTeam(teamIndex) then
    --     --取消报名
    --     -- BiaoCheManager:requestSignUp(teamIndex)
    -- else
    --     BiaoCheManager:requestSignUp(teamIndex)
    -- end
    BiaoCheManager:requestSignUp(teamIndex)
end

function BiaocheBaoMingList.cellSizeForTable(table,idx)
    return 80, 230
end

function BiaocheBaoMingList.numberOfCellsInTableView(table)
    local self = table.logic;
    local idx = table.idx
    return #self.data[idx]
end

function BiaocheBaoMingList.tableCellAtIndex(table, idx)
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
    else
        panel = cell:getChildByTag(10086)
    end
    idx = idx + 1
    self:setCellInfo(panel, index, idx)

    return cell
end

function BiaocheBaoMingList:setCellInfo(panel, index, idx)
    local img_putongdi = TFDirector:getChildByPath(panel, 'img_putongdi')
    local img_putong = TFDirector:getChildByPath(panel, 'img_putong')
    local img_tou = TFDirector:getChildByPath(panel, 'img_tou')
    local img_touxiang = TFDirector:getChildByPath(panel, 'img_touxiang')
    local txt_name = TFDirector:getChildByPath(panel, 'txt_name')
    local txt_num = TFDirector:getChildByPath(panel, 'txt_num')

    local itemData = self.data[index][idx]
    print("itemData  = ",itemData)
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
        else
            img_putongdi:setVisible(true)
            img_putong:setVisible(false)
        end
    else
        img_putongdi:setVisible(true)
        img_putong:setVisible(false)
    end
end

return BiaocheBaoMingList