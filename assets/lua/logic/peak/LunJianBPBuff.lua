-- client side LunJianBPBuff.lua
--[[
 * @Description: 论剑峰帮派增益
 ]]
-- script writer wuqi
-- creation time 2016-06-23

local LunJianBPBuff = class("LunJianBPBuff", BaseLayer)

function LunJianBPBuff:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianBPBuff")
end

function LunJianBPBuff:initUI(ui)
    self.super.initUI(self, ui)

    self.txt_nownumber = TFDirector:getChildByPath(ui, "txt_nownumber")
    self.panel_bp = TFDirector:getChildByPath(ui, "panel_bp")
    self.panel_huadong = TFDirector:getChildByPath(ui, "panel_huadong")
    self.panelSize = self.panel_huadong:getSize()
    self.img_txtbg = TFDirector:getChildByPath(ui, "img_txtbg")
    self.img_txtbg:setVisible(false)
    self.img_txtbg:retain()
    self.img_txtbg:removeFromParent()
end

function LunJianBPBuff:refreshUI()
    self.idTab = PeakManager:getBuffItemIds()

    self:refreshTotalNum()
    self:refreshTabView()
end

function LunJianBPBuff:refreshTotalNum()
    local myRankInfo = PeakManager:getMyRankInfo()
    self.guildIntegral = 0
    if myRankInfo and myRankInfo.guildIntegral then
        self.guildIntegral = myRankInfo.guildIntegral
    end
    self.txt_nownumber:setText(self.guildIntegral .. "")
end

function LunJianBPBuff:refreshTabView()
    if self.tabView then
        self.tabView:reloadData()
        return
    end
    local tabView = TFTableView:create()
    tabView:setTableViewSize(CCSize(self.panelSize.width, self.panelSize.height - 10))
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_huadong:addChild(tabView)
    tabView:setPosition(ccp(20, 10))
    self.tabView = tabView

    self.tabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tabView:reloadData()
end

function LunJianBPBuff.cellSizeForTable(table, idx)
    return 30, 470
end

function LunJianBPBuff.numberOfCellsInTableView(table)
    local self = table.logic    
    local num = PeakManager:getGuildAttriLength()
    return num
end

function LunJianBPBuff.tableCellAtIndex(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.img_txtbg:clone()
        panel:setPosition(ccp(50, 18))
        panel:setVisible(true)
        panel:setTag(100)
        cell:addChild(panel)
    end
    idx = idx + 1
    self:refreshCell(cell, idx)    
    return cell
end

function LunJianBPBuff:refreshCell(cell, idx)
    local panel = cell:getChildByTag(100)
    local index = idx
    local item = PeakManager:getGuildAttri(idx)
    local per = item.attribute / 100
    
    local txt_layer = TFDirector:getChildByPath(panel, "Label_LunJianBPBuff_1")
    local txt_num = TFDirector:getChildByPath(panel, "txt_zhefu2")
    local txt_1 = TFDirector:getChildByPath(panel, "txt_zhefu1")
    local txt_2 = TFDirector:getChildByPath(panel, "txt_zhefu3")
    txt_1:setText(localizable.LunJianFeng_peak_hhhp1)
    local size = txt_1:getContentSize()
    txt_layer:setText(stringUtils.format(localizable.LunJianFeng_txt_bpbuff_layer0, idx))
    txt_num:setText(per .. "%")

    txt_num:setPositionX(txt_1:getPositionX() + size.width)
    size = txt_num:getContentSize()
    
    txt_2:setText(localizable.LunJianFeng_peak_hhhp2)
    txt_2:setPositionX(txt_num:getPositionX() + size.width)
end

function LunJianBPBuff:removeUI()
    self.super.removeUI(self)
    self.img_txtbg:release()
end

function LunJianBPBuff:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function LunJianBPBuff:registerEvents()
    self.super.registerEvents(self)
    self.onActivityStatusHandler = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)

    self.onActivityStatusHandler_0 = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
end

function LunJianBPBuff:removeEvents()
    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    self.super.removeEvents(self)
end

return LunJianBPBuff