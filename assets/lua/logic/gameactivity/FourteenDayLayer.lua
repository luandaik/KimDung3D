-- client side FourteenDayLayer.lua
--[[
 * @Description: 14日开服大礼
 ]]
-- script writer shenjingjie
-- creation time 2016-08-10

local FourteenDayLayer = class("FourteenDayLayer", BaseLayer);

FourteenDayLayer.TotleDays = 14
FourteenDayLayer.JiangLiMuBiao = 6

FourteenDayLayer.oneDay = 1
FourteenDayLayer.sumDay = 2

function FourteenDayLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.sevendays.FourteenDays");
end

function FourteenDayLayer:initUI( ui )
	self.super.initUI(self, ui)
	self.load_bar = TFDirector:getChildByPath(ui, "load_bar")
	self.load_bar:setDirection(TFLOADINGBAR_LEFT)
    self.load_bar:setPercent(0)
    self.load_bar:setVisible(true)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")

    self.btnList = {}
    for i = 1, self.JiangLiMuBiao do
    	self.btnList[i] = TFDirector:getChildByPath(ui, "panel_item"..i)
    	self.btnList[i].bg_icon = TFDirector:getChildByPath(self.btnList[i], "bg_icon")
    	self.btnList[i].img_icon = TFDirector:getChildByPath(self.btnList[i], "img_icon")
    	self.btnList[i].txt_num = TFDirector:getChildByPath(self.btnList[i], "txt_num")
    	self.btnList[i].img_hei = TFDirector:getChildByPath(self.btnList[i], "img_hei")
    end

    self.txt_day = TFDirector:getChildByPath(ui, "txt_num")

    self.panel_cell_model = TFDirector:getChildByPath(ui, "img_zc")
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()

    self.panel_jiangli = TFDirector:getChildByPath(ui, "panel_jiangli")

    self.tableView = nil
    self.currDay = 0
    self.loginLeiJIInfo = {}
    self.fourteenDayInfo = {}
end


function FourteenDayLayer:removeUI()

    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end

    self.super.removeUI(self)
end

function FourteenDayLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()

end

--注册事件
function FourteenDayLayer:registerEvents()
    self.super.registerEvents(self)

    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickCloseHandle))

    for i = 1, self.JiangLiMuBiao do
        self.btnList[i].bg_icon.logic = self
        self.btnList[i].bg_icon.index = i
        self.btnList[i].bg_icon.dayType = FourteenDayLayer.sumDay
        self.btnList[i].bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.DayBtnClickHandle),1)
    end

    self.updateData = function(event)
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(SevenDaysManager.UPDATETASK ,self.updateData);
end

function FourteenDayLayer:removeEvents()

    self.super.removeEvents(self)
    self.btn_close:removeMEListener(TFWIDGET_CLICK)
    TFDirector:removeMEGlobalListener(SevenDaysManager.UPDATETASK ,self.updateData)
    self.updateData = nil
end

function FourteenDayLayer:refreshUI()
    self.currDay, self.loginLeiJIInfo = SevenDaysManager:get14DaysLeiJiInfo()
    self.fourteenDayInfo = SevenDaysManager:get14DaysJiangliInfo()

    self.load_bar:setPercent(self.currDay / self.TotleDays * 100)
    self.txt_day:setText(self.currDay)

    self:refreshTableView()
    self:refreshLeiJiNode()
end

function FourteenDayLayer:refreshTableView()
    if self.tableView == nil then
        local tableView = TFTableView:create()

        self.tableView = tableView
        tableView:setTableViewSize(self.panel_jiangli:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLHORIZONTAL)
        --tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable, self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex, self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView, self))
        self.panel_jiangli:addChild(tableView)

        self:setCellIndex()
    end


    self.tableView:reloadData()
end

function FourteenDayLayer:cellSizeForTable(table, idx)
    return 286,184--self.panel_cell_model:getContentSize().height, self.panel_cell_model:getContentSize().widht
end

function FourteenDayLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_cell_model:clone()
        node:setVisible(true)
        cell:addChild(node, 1)
        cell.panel = node
    end
    self:setCell(cell, idx)
    return cell
end

function FourteenDayLayer:numberOfCellsInTableView(table)
    return FourteenDayLayer.TotleDays
end

function FourteenDayLayer:setCell(cell, idx)
    -- 设置每个cell
    local panel = cell.panel

    local dayInfo = self.fourteenDayInfo[idx]
    if (dayInfo == nil) then
        return
    end

    local bg_icon = TFDirector:getChildByPath(panel, "bg_icon")
    local img_icon = TFDirector:getChildByPath(bg_icon, "img_icon")
    local txt_num = TFDirector:getChildByPath(bg_icon, "txt_num")
    local txt_day = TFDirector:getChildByPath(panel, "txt_day")
    local img_hui = TFDirector:getChildByPath(panel, "img_hui")
    local btn_lingqu = TFDirector:getChildByPath(panel, "btn_lingqu")
    local img_ylq = TFDirector:getChildByPath(panel, "img_ylq")
    local btn_get = TFDirector:getChildByPath(panel, "btn_get")
    
    panel:setTexture("ui_new/sevendays/img_di1.png")
    if (SevenDaysManager.currOpenServerDayS == idx) then
        panel:setTexture("ui_new/sevendays/img_di2.png")
    end

    -- bg_icon:setVisible(false)
    -- img_icon:setVisible(false)
    -- txt_num:setVisible(false)
    -- txt_day:setVisible(false)
    img_hui:setVisible(false)
    btn_lingqu:setVisible(false)
    img_ylq:setVisible(false)
    btn_get:setVisible(false)
    btn_get:setTouchEnabled(false)

    -- 领取状态 0：未完成 1:已完成但未领取奖励  2:已完成并领取过奖励
    if (dayInfo.state == 0) then
        img_hui:setVisible(true)
        btn_get:setVisible(true)
    elseif (dayInfo.state == 1) then
        btn_lingqu:setVisible(true)
        btn_lingqu.logic = self
        btn_lingqu.index = idx
        btn_lingqu.dayType = FourteenDayLayer.oneDay
        btn_lingqu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.DayBtnClickHandle),1)
    elseif (dayInfo.state == 2) then
        img_ylq:setVisible(true)
    end
    -- "登录第x天"
    txt_day:setText(dayInfo.title)
    -- 奖励道具信息
    bg_icon:setTextureNormal(GetColorIconByQuality(dayInfo.itemInfo.quality))
    img_icon:setTexture(dayInfo.itemInfo.path)
    txt_num:setText(dayInfo.itemInfo.number)
    Public:addPieceImg(img_icon,dayInfo.itemInfo,nil)
    bg_icon.logic = self
    bg_icon.index = idx
    bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.iconBtnClickHandle),1)

end

-- 刷新下方的累计登录奖励
function FourteenDayLayer:refreshLeiJiNode()
    for i = 1, self.JiangLiMuBiao do
        local sameDayInfo = self.loginLeiJIInfo[i]
        Public:addPieceImg(self.btnList[i].img_icon,sameDayInfo.itemInfo,nil)
        self.btnList[i].bg_icon:setTextureNormal(GetColorIconByQuality(sameDayInfo.itemInfo.quality))
        self.btnList[i].img_icon:setTexture(sameDayInfo.itemInfo.path)
        self.btnList[i].txt_num:setText(sameDayInfo.itemInfo.number)
        if (sameDayInfo.state == 2) then
            self.btnList[i].img_hei:setVisible(true)
        else
            self.btnList[i].img_hei:setVisible(false)
        end   
    end
end

-- 累计登录领奖按钮回调
function FourteenDayLayer.DayBtnClickHandle( btn )
    local self = btn.logic
    local index = btn.index

    local sameDayInfo = {}
    if (btn.dayType == FourteenDayLayer.sumDay) then
        sameDayInfo = self.loginLeiJIInfo[index]
    else
        sameDayInfo = self.fourteenDayInfo[index]
    end
    

    if (sameDayInfo.state == 0) then
        toastMessage(localizable.CollectRoleCell_Condition_Fail)
        return
    elseif (sameDayInfo.state == 2) then
        toastMessage(localizable.common_get_award)
        return
    end
    
    --发送协议
    SevenDaysManager:getSevenDaysReward(sameDayInfo.id)
end

--显示道具详情
function FourteenDayLayer.iconBtnClickHandle( btn )
    local self = btn.logic
    local index = btn.index
    local dayInfo = self.fourteenDayInfo[index]
    Public:ShowItemTipLayer(dayInfo.itemInfo.itemid, dayInfo.itemInfo.type)
end

--初始cell位置
function FourteenDayLayer:setCellIndex()
    local index = SevenDaysManager.currOpenServerDayS - 1
    local posX = self.panel_cell_model:getContentSize().width * index
    local maxX = self.panel_cell_model:getContentSize().width * 10 + 85
    if (posX > maxX) then
        posX = maxX
    end
    self.tableView:setContentOffset(ccp(-posX, 0),0.1);
end
--关闭按钮回调
function FourteenDayLayer.onClickCloseHandle( btn )
    TFDirector:dispatchGlobalEventWith(SevenDaysManager.UpdateRedPoint, {})
    AlertManager:close()
end

return FourteenDayLayer
