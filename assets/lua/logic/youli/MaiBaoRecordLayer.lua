--[[
******埋宝记录界面*******
	-- by Catcher
	-- 2017/9/11
]]

local MaiBaoRecordLayer = class("MaiBaoRecordLayer", BaseLayer)

function MaiBaoRecordLayer:ctor(data)
    self.super.ctor(self,data)
    self.myBuryBoxList = {}
    self:init("lua.uiconfig_mango_new.youli.MaiBaoRecord")
end

function MaiBaoRecordLayer:initUI(ui)
	self.super.initUI(self,ui)
	
	self.img_tittle_1		= TFDirector:getChildByPath(ui, 'img_tittle_1');
	self.btn_close			= TFDirector:getChildByPath(ui, 'btn_close');
	self.panel_list			= TFDirector:getChildByPath(ui, 'panel_list');

	self.boxList			= TFDirector:getChildByPath(self.panel_list, 'bg');
	self.boxList:setVisible(false)
    self.boxList:removeFromParent(true)
    self.boxList:retain()
	-- self:RefreshUI();
    self.leftTime = {}
    self.myBuryBoxList = {}
end
-- 加载埋宝记录数据
function MaiBaoRecordLayer:setInfo(data)
    -- print("this is data------------",data)
    local myBuryBoxList = data.buriedHistory
    if myBuryBoxList then
        for i = 1,#myBuryBoxList do
            local buryBox = myBuryBoxList[i]
            buryBox.updataFlag = false
            self.myBuryBoxList[i] = buryBox
        end
    end
    self:table_sort(self.myBuryBoxList)
    self:RefreshUI();
end

function MaiBaoRecordLayer:table_sort(list)
    local i,j,temp
    local length = #list
    for j= 1, length  do
        for i = 1, length - j  do
            if list[i].buriedTime < list[i + 1].buriedTime then
                temp = list[i]
                list[i] = list[i + 1]
                list[i + 1] = temp;
            end
        end
    end
end
-- 设置TableView控件
function MaiBaoRecordLayer:RefreshUI(ui)
	if self.boxTableView == nil then
        self.boxTableView = TFTableView:create()
        self.boxTableView.logic = self
        self.boxTableView:setTableViewSize(self.panel_list:getSize())
        self.boxTableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.boxTableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.boxTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, MaiBaoRecordLayer.cellSizeForTable)
        self.boxTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, MaiBaoRecordLayer.tableCellAtIndex)
        self.boxTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, MaiBaoRecordLayer.numberOfCellsInTableView)

        self.panel_list:addChild(self.boxTableView)
    end
    self.boxTableView:setVisible(true)
    self.boxTableView:reloadData()
	self.boxTableView:setInertiaScrollEnabled(true)
end
-- 设置TableView控件中cell的大小
function MaiBaoRecordLayer.cellSizeForTable(table,idx)
    return 110,675
end
-- 设置TableView控件中cell的详细信息
function MaiBaoRecordLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local TboxSprite = {}
        local boxSprite = table.logic.boxList:clone()
        TboxSprite.btn_xiang = TFDirector:getChildByPath(boxSprite,"btn_xiang")
        TboxSprite.btn_xiang:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            AdventureTreasureManager:requestBoxRecord(boxSprite.index);
        end),1)
		boxSprite:setVisible(true)
		boxSprite:setPosition(ccp(74,0))

        TboxSprite.boxSprite = boxSprite
        TboxSprite.img_box = TFDirector:getChildByPath(boxSprite,"img_box");
        local img_wuliang = TFImage:create("ui_new/youli/wabao/img_wl.png")
        TboxSprite.img_box:addChild(img_wuliang)
        TboxSprite.img_wuliang = img_wuliang
        TboxSprite.txt_time = TFDirector:getChildByPath(boxSprite,"txt_time");
        TboxSprite.txt_ren = TFDirector:getChildByPath(boxSprite,"txt_ren");
        cell:addChild(boxSprite)
        cell.TboxSprite = TboxSprite        
    end
    table.logic:SetBoxCell(cell.TboxSprite,idx+1)
    return cell
end
-- 设置宝箱相关信息
function MaiBaoRecordLayer:SetBoxCell(TboxSprite,cellIndex)
    local buryBox = self.myBuryBoxList[cellIndex];
    TboxSprite.boxSprite.index = buryBox.mapId
	
    local itemId = buryBox.treasureId -30400
    local path = "ui_new/youli/wabao/img_box"..itemId..".png"
    
    local lifeHours = ConstantData:getValue("AdventureTreasureLifeHours")
    local leftTime = lifeHours*60*60 -(MainPlayer:getNowtime() - buryBox.buriedTime/1000);
    local hour,min,sec = 0,0,0;
    self.leftTime[cellIndex] = leftTime
    if leftTime > 0 then
        hour,min = math.modf(leftTime/(60*60))
        min,sec = math.modf(min*60)
        sec = math.floor(sec*60)
        buryBox.updataFlag = true
    end
    TboxSprite.txt_time.index = cellIndex
    buryBox.txt_time = TboxSprite.txt_time
    if not self.addItemTimer then
        self.addItemTimer = TFDirector:addTimer(1000, -1, nil, 
		function() 
			self:leftTimeUpdata()
		end)
    end

    TboxSprite.img_box:setTexture(path);
    TboxSprite.txt_time:setText(string.format("%02d:%02d:%02d",hour,min,sec))
    TboxSprite.txt_ren:setText((30-buryBox.leftTimes).."/"..30);

    -- 宝箱是否是无量宝箱
    TboxSprite.img_wuliang:setVisible((buryBox.specialBox == 1))
end
-- 设置TableView控件中cell的数量
function MaiBaoRecordLayer.numberOfCellsInTableView(table)
    if table.logic.myBuryBoxList then
        return #table.logic.myBuryBoxList;
    else
        return 0;
    end
end

-- 刷新我的宝箱时间
function MaiBaoRecordLayer:leftTimeUpdata()
    for i = 1,#self.myBuryBoxList do
        local buryBox = self.myBuryBoxList[i]
        if buryBox.updataFlag then
            local txt_time = buryBox.txt_time
            if txt_time.index == i then
                local index = i
                if not self.leftTime[index] then
                    self.leftTime[index] = 0
                end
                self.leftTime[index] = self.leftTime[index] - 1
    
                if self.leftTime[index] <= 0 then
                    buryBox.updataFlag = false
                end
    
                local hour,min,sec = 0,0,0
                if self.leftTime[index] > 0 then
                    hour,min = math.modf(self.leftTime[index]/(60*60))
                    min,sec = math.modf(min*60)
                    sec = math.floor(sec*60)
                end
                txt_time:setText(string.format("%02d:%02d:%02d",hour,min,sec))
            end
        end
    end
end

--注册事件
function MaiBaoRecordLayer:registerEvents()
	self.super.registerEvents(self);
 
	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);
	self.btn_close:setClickAreaLength(100);
end
-- 注销时间
function MaiBaoRecordLayer:removeEvents()
    self.super.removeEvents(self)

    if self.addItemTimer then
        TFDirector:removeTimer(self.addItemTimer)
	    self.addItemTimer = nil
    end
end

function MaiBaoRecordLayer:removeUI()
    self.super.removeUI(self)

    if self.boxList then
        self.boxList:release()
        self.boxList = nil
    end
end

return MaiBaoRecordLayer