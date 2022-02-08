-- client side LangHuanRecodeLayer.lua
--[[
 * @Description: 祈福历史
 * 	-- by shenjingjie
	-- 2017/7/19
 ]]
local LangHuanRecodeLayer = class("LangHuanRecodeLayer", BaseLayer)

function LangHuanRecodeLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.treasure.TreasureHistory")
end

function LangHuanRecodeLayer:initUI(ui)
	self.super.initUI(self,ui)

	self.recordInfo	= {}

    self.btn_close          = TFDirector:getChildByPath(self, 'btn_close')
    self.btn_myRecord       = TFDirector:getChildByPath(self, 'tab1')
    self.btn_otherRecord    = TFDirector:getChildByPath(self, 'tab2')    
    self.btn_myRecord.logic         = self
    self.btn_otherRecord.logic      = self


    self.panel_cell1    = TFDirector:getChildByPath(self, 'panel_cell1')
    self.panel_cell2    = TFDirector:getChildByPath(self, 'panel_cell2')
    self.panel_list     = TFDirector:getChildByPath(self, 'panel_player')

    self.panel_celllist = {}
    self.panel_celllist[1] = self.panel_cell1
    self.panel_celllist[2] = self.panel_cell2

    for i=1,2 do
        if self.panel_celllist[i] then
            self.panel_celllist[i]:setVisible(false)
            self.panel_celllist[i].type = i
        end
    end
 
    self.typeButton = {}
    for i=1,2 do
        self.typeButton[i]       = TFDirector:getChildByPath(ui, 'tab'..i)
        self.typeButton[i].index = i
    end
    self.typeButton[1]:setTextureNormal("ui_new/zadan/tab_1h.png")
    self.recordInfo = LangHuanManager:getRecordInfo()

    self.curBtnIndex  = 0
    self:refreshTableView()
end
function LangHuanRecodeLayer:registerEvents()
    self.super.registerEvents(self)

    self.btn_myRecord:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickTpye),1)
    self.btn_otherRecord:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickTpye),1)

    self.receiveRecordResult = function(event)
        self.recordInfo = LangHuanManager:getRecordInfo() 
        self.myResultTableView:reloadData()
        local offsetSize1 = self.myResultTableView:getContentSize()
        if #self.recordInfo > 1 then 
            self.myResultTableView:setContentOffset(ccp(0,-offsetSize1.height + 536))
        end
        self:refreshTableView()
    end


    TFDirector:addMEGlobalListener(LangHuanManager.LangBlessedRecord, self.receiveRecordResult)

    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

end
function LangHuanRecodeLayer:removeEvents()
    TFDirector:removeMEGlobalListener(LangHuanManager.LangBlessedRecord, self.receiveRecordResult)
    self.receiveRecordResult = nil
    self.super.removeEvents(self)
end
function LangHuanRecodeLayer:removeUI()
    self.super.removeUI(self)
end

function LangHuanRecodeLayer:onShow()
    self.super.onShow(self)

    self:refreshUI()
end

function LangHuanRecodeLayer:dispose()
    self.super.dispose(self)
end

function LangHuanRecodeLayer:refreshUI()
    self:refreshTableView()
end


function LangHuanRecodeLayer:refreshTableView()
	if (self.myResultTableView == nil) then
		local  myResultTableView =  TFTableView:create()
	    myResultTableView:setTableViewSize(self.panel_list:getContentSize())
	    myResultTableView:setDirection(TFTableView.TFSCROLLVERTICAL)
	    myResultTableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
	    myResultTableView:setPosition(0,0)
	    self.myResultTableView = myResultTableView
	    self.myResultTableView.logic = self

	    myResultTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
	    myResultTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
	    myResultTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
	    

	    self.panel_list:addChild(self.myResultTableView,1)
	end
	self.myResultTableView:reloadData()
end

function LangHuanRecodeLayer.numberOfCellsInTableView(table)
    local self = table.logic

    return #self.recordInfo + 1
end

function LangHuanRecodeLayer.cellSizeForTable(table,idx)
    local self = table.logic
    local height , width =   137, 718
    local index = idx + 1

    local totalCount = #self.recordInfo

    if index  == (totalCount + 1) then
        width  = 730
        height = 100

    else
        local rewardData = self.recordInfo[index]
        local countOfReward = #rewardData
        local row =  math.ceil( countOfReward / 5 )
        if countOfReward > 0 then
            width  = 730
            height = 80 + 140 * row
        else
            width  = 730
            height = 100
        end
    end

    return height , width
end

function LangHuanRecodeLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    local node = nil
    if nil == cell then
        cell = TFTableViewCell:create()
        node = createUIByLuaNew("lua.uiconfig_mango_new.treasure.historyCell1")
        node:setPosition(ccp(20-4, 0))
        cell:addChild(node)
        node:setTag(100)
    end

    cell.index = idx + 1

    self:drawResultNode(cell, idx + 1)
    return cell
end

function LangHuanRecodeLayer:createCellNode(cell, index)
    local node = nil
    if index == 3 then
        node = CCNode:create()
    else
        node = self.panel_celllist[index]:clone()
    end
    node:setPosition(ccp(20-4, 0))
    cell:addChild(node)
    node:setTag(100 + index)
    node.logic = self
end

function LangHuanRecodeLayer:drawResultNode(cell, index)
    local node = nil
    local rootNode = cell:getChildByTag(100)
    local nodeList = {}
    for i=1,3 do
        nodeList[i] = TFDirector:getChildByPath(rootNode, 'panel_cell'..i)
        nodeList[i]:setVisible(false)
    end

    local totalCount = #self.recordInfo

    if index  == (totalCount + 1) then
        nodeList[2]:setVisible(true)

        local btn_more = TFDirector:getChildByPath(nodeList[2], 'btn_more')

        btn_more:addMEListener(TFWIDGET_CLICK, audioClickfun(
            function ( )
                toastMessage(localizable.common_not_more_record)
            end
        ),1)

        return
    end

    local rewardData = self.recordInfo[index]
    local countOfReward = #rewardData
    local row =  math.ceil( countOfReward / 5 )
    local rowHeight = 140
    
    ------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> node for rewardTime
    node = nodeList[1]
    node:setPositionY(row*rowHeight)
    node:setVisible(true)

    local txt_time = TFDirector:getChildByPath(node, 'txt_time')
    local txt_name = TFDirector:getChildByPath(node, 'txt_name')
    txt_name:setVisible(false)
    local txt_date = TFDirector:getChildByPath(node, 'txt_date')
    local bg_icon  = TFDirector:getChildByPath(node, 'bg_icon')
    txt_name:setText(rewardData.playerName)
    if rewardData.playerName ~= nil then
        txt_name:setVisible(true)
    end
    local timestamp = math.floor(rewardData.time * 0.001)

    local date   = GetCorrectDate("*t", timestamp)

    local timeDesc = date.year.."-"..date.month.."-"..date.day

    local timeDesc = string.format("%s", timeDesc)

    txt_date:setText(timeDesc)

    local timeDesc2 = GetCorrectDate("%X", timestamp)
    txt_time:setText(timeDesc2)
    ------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> node for rewardData
    node = nodeList[3]
    node:setVisible(true)
    node:removeAllChildrenWithCleanup(true)

    for i=1,countOfReward do
        self:ShowRoleIcon(node, i, rewardData)
    end
end

function LangHuanRecodeLayer:ShowRoleIcon(node, itemIndex, rewardList)

    self.itemIndex = itemIndex

    local Gapx = -100
    local Gapy = 140
    local row =  math.ceil( self.itemIndex / 5 )
    local rowTotal = math.ceil( #rewardList / 5 )
    local posX = Gapx + math.mod(itemIndex-1,5) * 140
    local posY = Gapy* (rowTotal - row) + 20
    local item = rewardList[itemIndex]
    local newCardRoleData = BaseDataManager:getReward(item)
    local path = newCardRoleData.path
    -- end

    if newCardRoleData ~= nil then
        local roleQualityImg = TFImage:create()
        roleQualityImg:setTexture(GetColorIconByQuality(newCardRoleData.quality))
        roleQualityImg:setPosition(ccp(posX, posY))
        roleQualityImg:setScale(1.0)
        roleQualityImg:setOpacity(255)
        roleQualityImg:setTag(200 + itemIndex)
        node:addChild(roleQualityImg,100)

        local roleIcon = TFImage:create()
        roleQualityImg:addChild(roleIcon)
        roleIcon:setTexture(path)
        roleIcon:setTouchEnabled(true)
        roleIcon:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            Public:ShowItemTipLayer(item.itemId, item.type)
        end))


        if item.type == EnumDropType.GOODS then
            local rewardItem = {itemid = item.itemId}
            Public:addPieceImg(roleIcon,rewardItem,nil,1.0)
        end

        -- local txt_num = TFLabel:create()
        local txt_num = TFLabelBMFont:create()
        txt_num:setFntFile("font/num_212.fnt")

        txt_num:setAnchorPoint(ccp(1, 0))
        txt_num:setPosition(ccp(52, -60))
        txt_num:setText(item.number)
        -- txt_num:setFontSize(20)
        roleQualityImg:addChild(txt_num)

    end
end

function LangHuanRecodeLayer.onClickTpye(sender)
    local self  = sender.logic
    local index = sender.index

    if self.curBtnIndex == index then
        local offsetPos = self.myResultTableView:getContentOffset()
        print("offsetPos = ", offsetPos)
        return
    end
    self:drawDefault(index)
end

function LangHuanRecodeLayer:drawDefault(index)
    if self.curBtnIndex == index then
        return
    end
    -- 绘制上面的按钮
    for k,btn in pairs(self.typeButton) do
        btn:setTextureNormal("ui_new/zadan/tab_"..k..".png")
    end

    local btn = nil
    if self.btnLastIndex ~= nil then
        btn = self.typeButton[self.btnLastIndex]
        btn:setTextureNormal("ui_new/zadan/tab_"..self.btnLastIndex..".png")
    end

    self.btnLastIndex = index
    self.curBtnIndex  = index

    btn = self.typeButton[self.curBtnIndex]
    btn:setTextureNormal("ui_new/zadan/tab_"..self.btnLastIndex.."h.png")


    self:onClickDay(index)

end

function LangHuanRecodeLayer:onClickDay(index)
    local desc = {"个人历史", "玩家历史"}
    local desc = localizable.goldEggRecord_player_history
    print("点击了 ---- ", desc[index])
    LangHuanManager:requestPrayRecord(index)
    --self.EggRecordList:clear()
    --local nowCount = self.EggRecordList:length()
    --GoldEggManager:RequestGoldEggRecord(nowCount, 2, index)


end

return LangHuanRecodeLayer