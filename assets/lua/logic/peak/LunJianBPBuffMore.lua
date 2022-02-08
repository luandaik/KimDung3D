-- client side LunJianBPBuffMore.lua
--[[
 * @Description: 论剑峰帮派增益2
 ]]
-- script writer wuqi
-- creation time 2016-06-23

local LunJianBPBuffMore = class("LunJianBPBuffMore", BaseLayer)

function LunJianBPBuffMore:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianBPBuff2")
    self.bubbleDelayTime = {}
    self.bubbleMoveTime = {}
    self.bubblePanel = {}
    self.txtBubble = {}
    self.bStop = false
end

function LunJianBPBuffMore:initUI(ui)
    self.super.initUI(self, ui)

    self.txt_nownumber = TFDirector:getChildByPath(ui, "txt_nownumber")
    self.panel_huadong = TFDirector:getChildByPath(ui, "panel_huadong")
    self.panelSize = self.panel_huadong:getSize()
    self.img_bghei = TFDirector:getChildByPath(ui, "img_bghei")
    self.img_txtbg = TFDirector:getChildByPath(ui, "img_txtbg")
    self.img_txtbg:setVisible(false)
    self.img_txtbg:retain()
    self.img_txtbg:removeFromParent()

    self.panel_chengyuan = TFDirector:getChildByPath(ui, "panel_chengyuan")
    self.panelSize2 = self.panel_chengyuan:getSize()
    self.txt_yangsheng = TFDirector:getChildByPath(ui, "txt_yangsheng2")
    self.txt_yangsheng:setVisible(false)
    self.txt_yangsheng:retain()
    self.txt_yangsheng:removeFromParent()
    --self.btn_bppm = TFDirector:getChildByPath(ui, "btn_bppm")
end

function LunJianBPBuffMore:refreshUI()
    self.idTab = PeakManager:getBuffItemIds()
    self.playerTab = PeakManager:getBuffPlayerTab()
    local myRankInfo = PeakManager:getMyRankInfo()
    self.guildIntegral = 0
    if myRankInfo and myRankInfo.guildIntegral then
        self.guildIntegral = myRankInfo.guildIntegral
    end

    self.indexTab = {}
    for i = PeakData:length(), 1 ,-1 do
        if self.playerTab[i] and #self.playerTab[i] > 0 then
            table.insert(self.indexTab, i)
        end
    end

    self:refreshTotalNum()
    self:refreshTabView1()
    self:refreshTabView2()
end

function LunJianBPBuffMore:refreshTotalNum()
    self.txt_nownumber:setText(self.guildIntegral .. "")
end

function LunJianBPBuffMore:refreshTabView1()
    if self.tabView1 then
        self.tabView1:reloadData()
        return
    end
    local tabView = TFTableView:create()
    tabView:setTableViewSize(CCSize(self.panelSize.width, self.panelSize.height))
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_huadong:addChild(tabView)
    tabView:setPosition(ccp(20, 0))
    self.tabView1 = tabView

    self.tabView1:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable1)
    self.tabView1:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView1)
    self.tabView1:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex1)
    self.tabView1:reloadData()
end

function LunJianBPBuffMore.cellSizeForTable1(table, idx)
    local self = table.logic    
    local num = PeakManager:getGuildAttriLength()
    if idx == num - 1 then
        return 40,470
    end
    return 30, 470
end

function LunJianBPBuffMore.numberOfCellsInTableView1(table)
    local self = table.logic    
    local num = PeakManager:getGuildAttriLength()
    return num
end

function LunJianBPBuffMore.tableCellAtIndex1(table, idx)
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
    self:refreshCell1(cell, idx)    
    return cell
end

function LunJianBPBuffMore:refreshCell1(cell, idx)
    local panel = cell:getChildByTag(100)
    if idx == PeakManager:getGuildAttriLength() then
        panel:setPositionY(28)
    else
        panel:setPositionY(18)
    end
    local index = idx
    local item = PeakManager:getGuildAttri(idx)
    local per = item.attribute / 100
    
    local txt_layer = TFDirector:getChildByPath(panel, "txt_14")
    local txt_num = TFDirector:getChildByPath(panel, "txt_zhefu2")   
    local txt_1 = TFDirector:getChildByPath(panel, "txt_zhefu1")
    local txt_2 = TFDirector:getChildByPath(panel, "txt_zhefu3")

    txt_1:setText(localizable.LunJianFeng_peak_hhhp1)
    txt_2:setText(localizable.LunJianFeng_peak_hhhp2)
    txt_layer:setText(stringUtils.format(localizable.LunJianFeng_txt_bpbuff_layer0, idx))
    txt_num:setText(per .. "%")
    local size = txt_1:getContentSize() 
    txt_num:setPositionX(txt_1:getPositionX() + size.width)
    size = txt_num:getContentSize()
    txt_2:setPositionX(txt_num:getPositionX() + size.width)
end

function LunJianBPBuffMore:refreshTabView2()
    if self.tabView2 then
        self.tabView2:reloadData()
        return
    end
    local tabView = TFTableView:create()
    tabView:setTableViewSize(CCSize(self.panelSize2.width, self.panelSize2.height))
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_chengyuan:addChild(tabView)
    --tabView:setPosition(ccp(-10, -20))
    self.tabView2 = tabView

    self.tabView2:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable2)
    self.tabView2:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView2)
    self.tabView2:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex2)
    self.tabView2:reloadData()
end

function LunJianBPBuffMore.cellSizeForTable2(table, idx)
    return 30, 470
end

function LunJianBPBuffMore.numberOfCellsInTableView2(table)
    local self = table.logic    
    local num = #self.indexTab
    return num
end

function LunJianBPBuffMore.tableCellAtIndex2(table, idx)
    local self = table.logic

    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.txt_yangsheng:clone()
        panel:setPosition(ccp(20, 0))
        panel:setVisible(true)
        panel:setTag(100)
        cell:addChild(panel)
    end
    idx = idx + 1
    self:refreshCell2(cell, idx)    
    return cell
end

function LunJianBPBuffMore:refreshCell2(cell, idx)
    local panel = cell:getChildByTag(100)
    local layer = self.indexTab[idx]
    local data = self.playerTab[layer]

    panel:setText(stringUtils.format(localizable.LunJianFeng_txt_bpbuff_layer2, layer))
    --local txt_name = TFDirector:getChildByPath(panel, "txt_name")
    self.bubblePanel[idx] = TFDirector:getChildByPath(panel, "panel_chatclip")
    self.txtBubble[idx] = TFDirector:getChildByPath(panel, "txt_chat")
    local str = ""
    local strAdd = ""
    for i = 1, #data do
        str = str .. strAdd .. data[i].name
        strAdd = "、"
    end
    --txt_name:setText(str) 
    self:showChatBubble(bubblePanel, self.txtBubble[idx], str, idx)
end

function LunJianBPBuffMore:showChatBubble(bubblePanel, txtBubble, str, idx)
    local tempIndex = idx
    if self.bubbleDelayTime and self.bubbleDelayTime[tempIndex] then
        TFDirector:removeTimer(self.bubbleDelayTime[tempIndex])
        self.bubbleDelayTime[tempIndex] = nil
    end
    if self.bubbleMoveTime and self.bubbleMoveTime[tempIndex] then
        TFDirector:removeTimer(self.bubbleMoveTime[tempIndex])
        self.bubbleMoveTime[tempIndex] = nil
    end

    self.txtBubble[idx]:setPosition(ccp(0,0))
    self.txtBubble[idx]:setText(str)

    self.bubbleDelayTime[tempIndex] = TFDirector:addTimer(30000, 1, function () 
            if self.bubbleDelayTime and self.bubbleDelayTime[tempIndex] then
                TFDirector:removeTimer(self.bubbleDelayTime[tempIndex])
                self.bubbleDelayTime[tempIndex] = nil
            end
            if self.bubbleMoveTime and self.bubbleMoveTime[tempIndex] then
                TFDirector:removeTimer(self.bubbleMoveTime[tempIndex])
                self.bubbleMoveTime[tempIndex] = nil
            end
            --self.bubbleNode:setVisible(false)
            print('font move end ----------------------')
        end)

    local clipWidth = self.bubblePanel[idx]:getContentSize().width
    local fontWidth = self.txtBubble[idx]:getContentSize().width

    if clipWidth < fontWidth then
        local moveX = 10
        local times = math.ceil((fontWidth - clipWidth)/10)

        local function fontMove()
            if self.bStop or (not self.txtBubble) then
                return
            end            
            local moveTimes = 0
            self.txtBubble[idx]:setPosition(ccp(0,0))           
            self.bubbleMoveTime[tempIndex] = TFDirector:addTimer(300, times+8, 
                function()
                   fontMove()
                end,
                function()
                    --每次进来
                    moveTimes = moveTimes + 1
                    if moveTimes < 4 then
                        self.txtBubble[idx]:setPosition(ccp(0,0))
                    elseif moveTimes <= (times+4) then 
                        if self.bStop or (not self.txtBubble) then
                            return
                        end
                        local currX = self.txtBubble[idx]:getPositionX()
                        currX = currX - 10
                        self.txtBubble[idx]:setPositionX(currX)
                    end
                end)
        end
        fontMove()
    end
end

function LunJianBPBuffMore:removeUI()
    self.bStop = true
    self.super.removeUI(self)
    self.img_txtbg:release()
    self.txt_yangsheng:release()
    
    for k, v in pairs(self.bubbleDelayTime) do
        if v then
            TFDirector:removeTimer(v)
            v = nil
        end
    end
    for k, v in pairs(self.bubbleMoveTime) do
        if v then
            TFDirector:removeTimer(v)
            v = nil
        end
    end
    self.bubbleDelayTime = {}
    self.bubbleMoveTime = {}
end

function LunJianBPBuffMore:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function LunJianBPBuffMore.OnFactionRankClick(sender)
    PeakManager:openFactionRanklayer()
end

function LunJianBPBuffMore:registerEvents()
    self.super.registerEvents(self)
    --self.btn_bppm:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnFactionRankClick))

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

function LunJianBPBuffMore:removeEvents()
    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    self.super.removeEvents(self)
end

return LunJianBPBuffMore