--[[
******挖宝历史界面*******
	-- by Catcher
	-- 2017/9/11
]]

local WaBaoRecordXiangLayer = class("WaBaoRecordXiangLayer", BaseLayer)

function WaBaoRecordXiangLayer:ctor(data)
    self.super.ctor(self,data)
    
    self:init("lua.uiconfig_mango_new.youli.WaBaoRecordXiang")
end

function WaBaoRecordXiangLayer:initUI(ui)
	self.super.initUI(self,ui)
    self.myBoxList = {}
    self.bg                 = TFDirector:getChildByPath(ui, 'bg');
	self.Panel		        = TFDirector:getChildByPath(self.bg, 'Panel');
    self.Panel:setVisible(false)
    self.Panel:removeFromParent(true)
    self.Panel:retain()
	self.btn_close			= TFDirector:getChildByPath(self.bg, 'btn_close');
	self.panel_list			= TFDirector:getChildByPath(self.bg, 'panel_list');

	-- self:RefreshUI();
    self.myBoxList = {}
end

-- 加载挖宝历史数据
function WaBaoRecordXiangLayer:setInfo(data)
    local myBoxList = data.treasureDetails
    self:table_sort(myBoxList)
    local lastYear,lastMonth,lastDay
    local addCnt = 0
    for i = 1,#myBoxList do
        local myBox = myBoxList[i]
        local data = GetCorrectDate("*t", myBox.buriedTime/1000)
        if lastYear ~= data.year or lastMonth ~= data.month or lastDay ~= data.day then
            table.insert(self.myBoxList,clone(myBox))
            self.myBoxList[i + addCnt].timeflag = true
            lastYear = data.year
            lastMonth = data.month
            lastDay = data.day
            addCnt = addCnt + 1
        end
        table.insert(self.myBoxList,clone(myBox))
        self.myBoxList[i + addCnt].timeflag = false
    end
    self:RefreshUI();
end

function WaBaoRecordXiangLayer:table_sort(list)
    local i,j,temp
    local length = #list
    for j= 1, length  do
        for i = 1, length - j  do
            if list[i].buriedTime > list[i + 1].buriedTime then
                temp = list[i]
                list[i] = list[i + 1]
                list[i + 1] = temp;
            end
        end
    end
end

function WaBaoRecordXiangLayer:RefreshUI(ui)
	if self.boxTableView == nil then
        self.boxTableView = TFTableView:create()
        self.boxTableView.logic = self
        self.boxTableView:setTableViewSize(self.panel_list:getSize())
        self.boxTableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.boxTableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        
        self.boxTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, WaBaoRecordXiangLayer.tableCellAtIndex)
        self.boxTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, WaBaoRecordXiangLayer.cellSizeForTable)
        self.boxTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, WaBaoRecordXiangLayer.numberOfCellsInTableView)

        self.panel_list:addChild(self.boxTableView)
    end
    self.boxTableView:setVisible(true)
    self.boxTableView:reloadData()
	self.boxTableView:setInertiaScrollEnabled(true)
end

function WaBaoRecordXiangLayer.cellSizeForTable(table,idx)
    if table.logic.flag2 then
        return 55,650
    else 
        return 50,650
    end
end

function WaBaoRecordXiangLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local TboxSprite = {}
        local boxSprite = table.logic.Panel:clone()
        boxSprite:setVisible(true)

        TboxSprite.boxSprite = boxSprite
        TboxSprite.txt_day = TFDirector:getChildByPath(boxSprite,"txt_day");
        TboxSprite.img_x1 = TFDirector:getChildByPath(boxSprite,"img_x1");
        TboxSprite.img_x2 = TFDirector:getChildByPath(boxSprite,"img_x2");
        TboxSprite.txt_Account = TFDirector:getChildByPath(boxSprite,"txt_Account");
        TboxSprite.txt_Account:setTextAreaSize(CCSizeMake(580,0))

        cell:addChild(boxSprite)
        cell.TboxSprite = TboxSprite
    end
    cell.TboxSprite.txt_day:setVisible(false);
    cell.TboxSprite.img_x1:setVisible(false); 
    cell.TboxSprite.img_x2:setVisible(false);
    cell.TboxSprite.txt_Account:setVisible(false)
    table.logic:SetBoxCell(cell.TboxSprite, idx + 1)
    return cell
end

function WaBaoRecordXiangLayer:SetBoxCell(TboxSprite, cellIndex)
    local myBox = self.myBoxList[cellIndex]
    local timeflag = myBox.timeflag
    local data = GetCorrectDate("*t", myBox.buriedTime*0.001)
    if timeflag then
        TboxSprite.txt_day:setVisible(true);
        TboxSprite.txt_day:setText(string.format("%02d-%02d-%02d",data.year,data.month,data.day));
        TboxSprite.img_x1:setVisible(true);
        TboxSprite.img_x2:setVisible(true);
        TboxSprite.boxSprite:setPosition(ccp(-50,0)) 
        local richtextHB = Public:createRichtextHB(TboxSprite.txt_Account)
        richtextHB:setVisible(false)
        self.flag2 = true; 
    else
        local time = string.format("%02d:%02d:%02d",data.hour,data.min,data.sec)
        local serverName = myBox.serverName
        local digName = myBox.digName
        if myBox.playerName and myBox.isHiddenName == 0 then 
            boxName = myBox.playerName
        else
            boxName = localizable.youli_shenmiren_tips
        end
        
        local itemList = string.split(myBox.dropItem,',');
        local item = BaseDataManager:getReward({itemId = tonumber(itemList[2]),type = tonumber(itemList[1]),number = tonumber(itemList[3])})
        local colorSize = item.quality + 8
        local itemStr = stringUtils.format(localizable.youli_fuwenben_tips,10,item.name,item.number);
        local AccountStr = stringUtils.format(localizable.youli_wobaoXiang_tips,time,serverName,digName,boxName,itemStr);
        
        local richtextHB = Public:createRichtextHB(TboxSprite.txt_Account)
        richtextHB:setText(stringUtils.richText2(AccountStr))
        richtextHB:setVisible(true)
        TboxSprite.boxSprite:setPosition(ccp(0,0))
        self.flag2 = false;
    end
end

function WaBaoRecordXiangLayer.numberOfCellsInTableView(table)
    if table.logic.myBoxList then
        return #table.logic.myBoxList;
    else
        return 0;
    end
end


--注册事件
function WaBaoRecordXiangLayer:registerEvents()
	self.super.registerEvents(self);
    
	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);
	self.btn_close:setClickAreaLength(100);
end

function WaBaoRecordXiangLayer:removeUI()
    self.super.removeUI(self)

    if self.Panel then
        self.Panel:release()
        self.Panel = nil
    end
end
return WaBaoRecordXiangLayer