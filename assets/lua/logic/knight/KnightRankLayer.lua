--[[
******浪人武士-排行*******
    -- create by fei
    -- 2016/12/07
]]

local KnightRankLayer = class("KnightRankLayer", BaseLayer)
local knightImg = {"ui_new/langren/txt_nakelulubang.png", "ui_new/langren/txt_bawangwanbang.png"}
function KnightRankLayer:ctor()
    self.super.ctor(self)
    self.tableViewNum = 0
    self.knightRankInfo = {}
    self.isMoreShow = false
    self:init("lua.uiconfig_mango_new.LangRenWuShi.langrenpaihang")
end

function KnightRankLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.btn_close  = TFDirector:getChildByPath(ui, 'btn_close');
    self.img_paimingbg     = TFDirector:getChildByPath(ui, 'img_paimingbg')
    self.btn_more           = TFDirector:getChildByPath(ui, 'btn_more')
    self.img_title      = TFDirector:getChildByPath(ui, 'img_title')
    self.btn_more:setVisible(false)
    self.img_paimingbg:setVisible(false)

    self.img_title:setTexture(knightImg[KnightManager:getKnightTypeId()])
    local Panel_paihang = TFDirector:getChildByPath(ui, 'Panel_paihang');
    self:initTableView(Panel_paihang)
end

function KnightRankLayer:initTableView(Panel_paihang)
    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(Panel_paihang:getSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setPosition(Panel_paihang:getPosition())
    Panel_paihang:getParent():addChild(tableView, 99)
    
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableView:addMEListener(TFTABLEVIEW_TOUCHED, KnightRankLayer.tableCellTouched)
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, KnightRankLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, KnightRankLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, KnightRankLayer.numberOfCellsInTableView)
    self.tableView = tableView
    self.tableView.logic = self
end

function KnightRankLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
    --
    KnightManager:clearRankInfo()
    local knightType = KnightManager:getKnightTypeId()
    self.knightRankCallBack = function(event)
        self:registerTableView()
    end
    TFDirector:addMEGlobalListener(KnightManager.KnightRank, self.knightRankCallBack)
    KnightManager:requestKnightRank(knightType, 0, KnightManager.newAddRankNum)
end

function KnightRankLayer:registerTableView()

    local oldNum            = self.oldNum or 0
    self.knightRankInfo     = KnightManager:getKnightRankInfo()
    local newNum            = #self.knightRankInfo 
    local addNum            = newNum - oldNum
    self.tableViewNum       = newNum
    self.oldNum             = newNum
 
    if (addNum == KnightManager.newAddRankNum and self.tableViewNum < KnightManager.maxRankNum) then
        self.tableViewNum = self.tableViewNum + 1
        self.isMoreShow = true
    else
        self.isMoreShow = false
    end

    self.tableView:reloadData()
    if (oldNum > 0) then
        local numDx = self.img_paimingbg:getSize().height * (self.oldNum - oldNum)
        self.tableView:setContentOffset(ccp(0, -numDx))
    end
end
function KnightRankLayer.tableCellTouched(table,cell)

end

function KnightRankLayer.cellSizeForTable(table,idx)
    local self = table.logic
    local size = self.img_paimingbg:getSize()
    return size.height,size.width
end

function KnightRankLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        cell = self:CreateTableCell(cell)
    end
    cell.index = idx + 1
    self:setRankCellData(cell)
    return cell
end

function KnightRankLayer.numberOfCellsInTableView(table)
    local self = table.logic
    return self.tableViewNum
end

function KnightRankLayer:CreateTableCell(cell)
    --
    if nil == cell then
        cell = TFTableViewCell:create()
        local rankCell = self.img_paimingbg:clone()--require("lua.logic.knight.KnightRankCall"):new()
        rankCell:setVisible(true)
        rankCell:setPosition(ccp(rankCell:getContentSize().width / 2,rankCell:getContentSize().height / 2))
        cell.rankCell = rankCell
        cell:addChild(rankCell)
    end
    return cell
end

function KnightRankLayer:setRankCellData(cell)
    local rankLen = #self.knightRankInfo
    local rank = cell.index
    if (self.isMoreShow and (rank > rankLen)) then
        if (cell.btn_more == nil) then
            cell.btn_more = self.btn_more:clone()
            cell.btn_more:setPosition(ccp(cell.btn_more:getContentSize().width / 2,cell.btn_more:getContentSize().height / 2))
            cell.btn_more.logic = self
            cell.btn_more:addMEListener(TFWIDGET_CLICK, audioClickfun(self.showMorePlayerRank))
            cell:addChild(cell.btn_more)
        end
        cell.btn_more:setVisible(true)
        cell.rankCell:setVisible(false)
    else
        cell.rankCell:setVisible(true)
        if (cell.btn_more) then
            cell.btn_more:setVisible(false)
        end
        local rankInfo     = KnightManager:getByRankKnightInfo(rank)
        if (rankInfo == nil) then
            print("没有排名  ",rank, "的数据")
            return
        end
        local txt_playername    = TFDirector:getChildByPath(cell.rankCell, "txt_playername")
        local txt_passLevel     = TFDirector:getChildByPath(cell.rankCell, "txt_jine")
        local txt_rank          = TFDirector:getChildByPath(cell.rankCell, "txt_paiming")
        local img_rank          = TFDirector:getChildByPath(cell.rankCell, "img_mingci")
        local bg_touxiang       = TFDirector:getChildByPath(cell.rankCell, "bg_touxiang")
        local img_head          = TFDirector:getChildByPath(bg_touxiang, "img_head")
        if (rank <= 3) then
            txt_rank:setVisible(false)
            img_rank:setVisible(true)
            img_rank:setTexture("ui_new/leaderboard/no"..rank..".png")
        else
            txt_rank:setVisible(true)
            img_rank:setVisible(false)
            txt_rank:setText(rank)
        end
        txt_playername:setText(rankInfo.name)
        txt_passLevel:setText(rankInfo.routLevel)
        local role = RoleData:objectByID(rankInfo.icon)
        if role then
            img_head:setTexture(role:getIconPath())
        end
        Public:addFrameImg(bg_touxiang, rankInfo.headPicFrame)
        Public:addInfoListen(bg_touxiang,true,1,rankInfo.playerId)
    end
end

function KnightRankLayer.showMorePlayerRank(sender)
    local self = sender.logic
    KnightManager:requestKnightRank(KnightManager:getKnightTypeId(), #self.knightRankInfo, KnightManager.newAddRankNum)
end

function KnightRankLayer:removeUI()
  
end

function KnightRankLayer:removeEvents()

    TFDirector:removeMEGlobalListener(KnightManager.KnightRank, self.knightRankCallBack)
    self.knightRankCallBack = nil

    self.super.removeEvents(self)
end

-----断线重连支持方法
function KnightRankLayer:onShow()
    self.super.onShow(self)
   
end

function KnightRankLayer:dispose()

    self.super.dispose(self)
end
-- Public:addFrameImg(self.headIcon,info.headPicFrame)           
return KnightRankLayer