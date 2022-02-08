-- client side WoodRecordLayer.lua
--[[
 * @Description: 木人桩历史
 ]]
-- script writer wuqi
-- creation time 2016-11-23

local WoodRecordLayer = class("WoodRecordLayer", BaseLayer)

function WoodRecordLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.treasure.TreasureHistory")
end

function WoodRecordLayer:initUI(ui)
	self.super.initUI(self,ui)

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
    self.btnIndex = 1

    self.bFistDraw = true

    -- 对应按钮的索引
    self.curBtnIndex  = 0
end



function WoodRecordLayer:registerEvents()
    self.super.registerEvents(self)


    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)


    self.btn_myRecord:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickTpye),1)
    self.btn_otherRecord:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickTpye),1)


    self.receiveRecordResult = function(event)
        local newCount = event.data[1].newcount
        local recordLists = WoodActivityManager.recordList       
        if self.curBtnIndex == 2 then --玩家历史            
            self.recordList = {}      
            self.recordList = recordLists[2] or {}        
                                
        elseif self.curBtnIndex == 1  and self.bFistDraw == false  then
            --local newCount = #recordLists[1] - #self.recordList 
            if newCount and newCount < 1 then
                 toastMessage(localizable.WoodActivityLayer_tips7)
            else
                self.recordList = {}
                self.recordList = recordLists[1] or  {}     
            end
        elseif self.curBtnIndex == 1  then --个人历史
            self.recordList = {}
            self.recordList = recordLists[1] or {}     
        end         
        --print("size-------------------"..#self.recordList) 
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(WoodActivityManager.WOOD_MAN_HISTORY_RESULT, self.receiveRecordResult)

    self:drawDefault(self.btnIndex)
end

function WoodRecordLayer:removeEvents()

    TFDirector:removeMEGlobalListener(WoodActivityManager.WOOD_MAN_HISTORY_RESULT, self.receiveRecordResult)
    self.receiveRecordResult = nil


    self.super.removeEvents(self)
end


function WoodRecordLayer:removeUI()
    self.super.removeUI(self)
end

function WoodRecordLayer:onShow()
    self.super.onShow(self)

    -- self:refreshUI()
end

function WoodRecordLayer:dispose()
    self.super.dispose(self)
end

function WoodRecordLayer:refreshUI()

    self:drawMyResultLayer()
end

function WoodRecordLayer.OnclikMyHistory(sender)
    local self = sender.logic

end

function WoodRecordLayer.OnclikOtherHistory(sender)
    local self = sender.logic

end


function WoodRecordLayer:drawDefault(index)
    if self.curBtnIndex == index then
        return
    end

    local btn = nil
    -- 绘制上面的按钮
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

function WoodRecordLayer:onClickDay(index)
    --local desc = {"个人历史", "玩家历史"}

    self.bFistDraw = true
    WoodActivityManager.recordList[index] = {}
    WoodActivityManager:requestWoodHistory(0, 2, index)
end

function WoodRecordLayer.onClickTpye(sender)
    local self  = sender.logic
    local index = sender.index

    if self.curBtnIndex == index then
        local offsetPos = self.myResultTableView:getContentOffset()
        print("offsetPos = ", offsetPos)
        return
    end

    self:drawDefault(index)
end


function WoodRecordLayer:drawMyResultLayer()
    --print("drawMyResultLayer>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    if self.myResultTableView ~= nil then
        local offsetSize1 = self.myResultTableView:getContentSize()
        --print("offsetSize1 = ", offsetSize1)
        self.myResultTableView:reloadData()
        if self.bFistDraw == false then
            -- self.myResultTableView:setScrollToEnd(false)

            local offsetSize2 = self.myResultTableView:getContentSize()
            --print("offsetSize2 = ", offsetSize2)
            if #self.recordList > 1 then 
                self.myResultTableView:setContentOffset(ccp(0, offsetSize1.height - offsetSize2.height))
            end

        else
            self.myResultTableView:setScrollToBegin(false)
            self.bFistDraw = false
        end
        return
    end

    local  myResultTableView =  TFTableView:create()
    myResultTableView:setTableViewSize(self.panel_list:getContentSize())
    myResultTableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    myResultTableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    myResultTableView:setPosition(self.panel_list:getPosition())
    self.myResultTableView = myResultTableView
    self.myResultTableView.logic = self

    myResultTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    myResultTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    myResultTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    myResultTableView:reloadData()

    self.panel_list:getParent():addChild(self.myResultTableView,1)
    self.bFistDraw = false
end

function WoodRecordLayer.numberOfCellsInTableView(table)
    local self = table.logic

    return #self.recordList + 1
end

function WoodRecordLayer.cellSizeForTable(table,idx)
    local self = table.logic
    local height , width =   137, 718
    local index = idx + 1

    local totalCount = #self.recordList

    if index  == (totalCount + 1) then
        width  = 730
        height = 100

    else
        local rewardData = self.recordList[index]
        local countOfReward = #rewardData.rewardList
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

function WoodRecordLayer.tableCellAtIndex(table, idx)
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

function WoodRecordLayer:createCellNode(cell, index)
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

function WoodRecordLayer:drawResultNode(cell, index)
    local node = nil
    local rootNode = cell:getChildByTag(100)
    local nodeList = {}
    for i=1,3 do
        nodeList[i] = TFDirector:getChildByPath(rootNode, 'panel_cell'..i)
        nodeList[i]:setVisible(false)
    end

    local totalCount = #self.recordList

    if index  == (totalCount + 1) then
        nodeList[2]:setVisible(true)

        local btn_more = TFDirector:getChildByPath(nodeList[2], 'btn_more')

        btn_more:addMEListener(TFWIDGET_CLICK, audioClickfun(
            function ( )
                self:loadMore()
            end
        ),1)

        if btn_more then
            if self.curBtnIndex == 1 then
                btn_more:setTextureNormal("ui_new/zadan/btn_ckgd.png")
            else
                btn_more:setTextureNormal("ui_new/zadan/btn_ckzx.png")
            end
        end
        return
    end

    local rewardData = self.recordList[index]

    local countOfReward = #rewardData.rewardList
    local row =  math.ceil( countOfReward / 5 )
    local rowHeight = 140
    print("countOfReward = ", countOfReward)
    
    ------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> node for rewardTime
    node = nodeList[1]
    node:setPositionY(row*rowHeight)
    node:setVisible(true)

    local txt_time = TFDirector:getChildByPath(node, 'txt_time')
    local txt_name = TFDirector:getChildByPath(node, 'txt_name')
    local txt_date = TFDirector:getChildByPath(node, 'txt_date')
    local bg_icon  = TFDirector:getChildByPath(node, 'bg_icon')
    -- bg_icon:setVisible(false)
    txt_name:setText(rewardData.playerName)

    local timestamp = math.floor(rewardData.createTime/1000)

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
        self:ShowRoleIcon(node, i, rewardData.rewardList)
    end

    -- txt_name:setVisible(true)
    -- if self.curBtnIndex == 1 then
    --     txt_name:setVisible(false)
    -- end
end

function WoodRecordLayer:ShowRoleIcon(node, itemIndex, rewardList)

    self.itemIndex = itemIndex

    local Gapx = -100
    local Gapy = 140
    local row =  math.ceil( self.itemIndex / 5 )
    local rowTotal = math.ceil( #rewardList / 5 )
    local posX = Gapx + math.mod(itemIndex-1,5) * 140
    local posY = Gapy* (rowTotal - row) + 20
    local item = rewardList[itemIndex]
    local roleTypeId = item.resId
    local newCardRoleData = nil
    local path = nil
    if item.resType == EnumDropType.ROLE then
        newCardRoleData = RoleData:objectByID(roleTypeId)
        if newCardRoleData == nil then
            print('roleTypeId = ', roleTypeId)
        end
        path = newCardRoleData:getIconPath()
    else
        local data = {}
        data.type   = item.resType
        data.itemId = item.resId
        data.number = item.number

        newCardRoleData = BaseDataManager:getReward(data)
        path = newCardRoleData.path
    end

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
            Public:ShowItemTipLayer(roleTypeId, item.resType)
        end))


        if item.resType == EnumDropType.GOODS then

            local rewardItem = {itemid = roleTypeId}
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

        if item.mulriple and item.mulriple > 1 then
            self:addTag(roleQualityImg,item.mulriple)
        end
    end
end

function WoodRecordLayer:addTag(node,num)
    local img_tag = TFImage:create()
    node:addChild(img_tag)
    img_tag:setTexture('ui_new/treasure/img_jiaobiao.png')
    img_tag:setPosition(ccp(-32, 37))
    local txt_num = TFLabelBMFont:create()
    txt_num:setFntFile("font/num_227.fnt")

    txt_num:setAnchorPoint(ccp(1, 0.5))
    txt_num:setRotation(-40)
    txt_num:setPosition(ccp(-29, 50))
    txt_num:setText(num)
    if num > 9 then
        txt_num:setScale(0.7)
    end
    node:addChild(txt_num)
end

function WoodRecordLayer:loadMore()
    local nowCount = #self.recordList
    print("nowCount--------------"..nowCount)
    --1个人历史2玩家历史
    if self.curBtnIndex == 2 then
        self.recordList ={}    
        self.bFistDraw = true
    end  
    WoodActivityManager:requestWoodHistory(nowCount, 2, self.curBtnIndex)
end

return WoodRecordLayer