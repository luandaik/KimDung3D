--[[
******挖宝历史界面*******
	-- by Catcher
	-- 2017/9/11
]]

local WaBaoRecordLayer = class("WaBaoRecordLayer", BaseLayer)

function WaBaoRecordLayer:ctor(data)
    self.super.ctor(self,data)
    
    self:init("lua.uiconfig_mango_new.youli.WaBaoRecord")
end

function WaBaoRecordLayer:initUI(ui)
	self.super.initUI(self,ui)
    self.myDigBoxList = {}
	self.img_tittle_1		= TFDirector:getChildByPath(ui, 'img_tittle_1');
	self.btn_close			= TFDirector:getChildByPath(ui, 'btn_close');
	self.panel_list			= TFDirector:getChildByPath(ui, 'panel_list');

	self.boxList			= TFDirector:getChildByPath(self.panel_list, 'bg');
	self.boxList:setVisible(false)
    self.boxList:removeFromParent(true)
    self.boxList:retain()
	-- self:RefreshUI();
    self.leftTime = {}
    self.myDigBoxList = {}
end

-- 加载挖宝历史数据
function WaBaoRecordLayer:setInfo(data)
    -- print("this is data------------",data)
    local myDigBoxList = data.digHistory
    if myDigBoxList then
        for i = 1,#myDigBoxList do
            local myDigBox = myDigBoxList[i]
            myDigBox.updataFlag = false
            self.myDigBoxList[i] = myDigBox
        end
    end
    self:table_sort(self.myDigBoxList)
    self:RefreshUI();
end

function WaBaoRecordLayer:table_sort(list)
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
function WaBaoRecordLayer:RefreshUI(ui)
	if self.boxTableView == nil then
        self.boxTableView = TFTableView:create()
        self.boxTableView.logic = self
        self.boxTableView:setTableViewSize(self.panel_list:getSize())
        self.boxTableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.boxTableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.boxTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, WaBaoRecordLayer.cellSizeForTable)
        self.boxTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, WaBaoRecordLayer.tableCellAtIndex)
        self.boxTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, WaBaoRecordLayer.numberOfCellsInTableView)

        self.panel_list:addChild(self.boxTableView)
    end
    self.boxTableView:setVisible(true)
    self.boxTableView:reloadData()
	self.boxTableView:setInertiaScrollEnabled(true)
end
-- 设置TableView控件中cell的大小
function WaBaoRecordLayer.cellSizeForTable(table,idx)
    return 130,675
end
-- 设置TableView控件中cell的详细信息
function WaBaoRecordLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local TboxSprite = {}
        local boxSprite = table.logic.boxList:clone()
        boxSprite:setVisible(true)
		boxSprite:setPosition(ccp(40,0))
        TboxSprite.btn_xiang = TFDirector:getChildByPath(boxSprite,"btn_xiang")
        TboxSprite.btn_xiang:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            AdventureTreasureManager:requestBoxRecord(boxSprite.index);
        end),1)
		
        TboxSprite.boxSprite = boxSprite
        TboxSprite.img_box = TFDirector:getChildByPath(boxSprite,"img_box");
        local img_wuliang = TFImage:create("ui_new/youli/wabao/img_wl.png")
        TboxSprite.img_box:addChild(img_wuliang)
        TboxSprite.img_wuliang = img_wuliang
        TboxSprite.txt_name = TFDirector:getChildByPath(boxSprite,"txt_name");
        TboxSprite.img_item = TFDirector:getChildByPath(boxSprite,"img_item");
        TboxSprite.txt_num = TFDirector:getChildByPath(boxSprite,"txt_num");
        TboxSprite.txt_time = TFDirector:getChildByPath(boxSprite,"txt_time");
        TboxSprite.txt_ren = TFDirector:getChildByPath(boxSprite,"txt_ren");

        cell:addChild(boxSprite)
        cell.TboxSprite = TboxSprite
    end
    table.logic:SetBoxCell(cell.TboxSprite, idx+1)
    return cell
end
-- 设置宝箱相关信息
function WaBaoRecordLayer:SetBoxCell(TboxSprite, cellIndex)
    local digBox = self.myDigBoxList[cellIndex];
    TboxSprite.boxSprite.index = digBox.mapId
    
    -- 宝箱图片
    local itemId = digBox.treasureId - 30400
    local path = "ui_new/youli/wabao/img_box"..itemId..".png"
    TboxSprite.img_box:setTexture(path);

    -- 宝箱名字
    local nameStr;
    if digBox.playerName and digBox.isHiddenName == 0 then
        nameStr = stringUtils.format(localizable.youli_wabao_tips1, digBox.playerName)
    else
        nameStr = localizable.youli_wabao_tips2
    end 
    TboxSprite.txt_name:setText(nameStr)

    -- 玩家领取的宝物
    local itemList = string.split(digBox.dropItem,',');
    local item = BaseDataManager:getReward({itemId = tonumber(itemList[2]),type = tonumber(itemList[1]),number = tonumber(itemList[3])})
    TboxSprite.img_item:setTexture(item.path)
    TboxSprite.txt_num:setText("x"..item.number)

    -- 宝箱剩余时间
    local lifeHours = ConstantData:getValue("AdventureTreasureLifeHours")
    local leftTime = lifeHours*60*60 -(MainPlayer:getNowtime() - digBox.buriedTime/1000);
    local hour,min,sec = 0,0,0
    self.leftTime[cellIndex] = leftTime
    if leftTime >= 0 then
        hour,min = math.modf(leftTime/(60*60))
        min,sec = math.modf(min*60)
        sec = math.floor(sec*60)
        digBox.updataFlag = true
    end
    TboxSprite.txt_time:setText(string.format("%02d:%02d:%02d",hour,min,sec))
    TboxSprite.txt_time.index = cellIndex
    digBox.txt_time = TboxSprite.txt_time
    if not self.addItemTimer then
        self.addItemTimer = TFDirector:addTimer(1000, -1, nil, 
		function() 
			self:leftTimeUpdata()
		end)
    end
    
    -- 宝箱剩余领取人数
    TboxSprite.txt_ren:setText((30-digBox.leftTimes).."/"..30);

    -- 宝箱是否是无量宝箱
    TboxSprite.img_wuliang:setVisible((digBox.specialBox == 1))
end

-- 设置TableView控件中cell的数量
function WaBaoRecordLayer.numberOfCellsInTableView(table)
    if table.logic.myDigBoxList then
        return #table.logic.myDigBoxList;
    else
        return 0;
    end
end

-- 刷新我的宝箱时间
function WaBaoRecordLayer:leftTimeUpdata()
    for i = 1,#self.myDigBoxList do
        local myDigBox = self.myDigBoxList[i]
        if myDigBox.updataFlag then
            local txt_time = myDigBox.txt_time
            if txt_time.index == i then
                local index = i
                if not self.leftTime[index] then
                    self.leftTime[index] = 0
                end
    
                self.leftTime[index] = self.leftTime[index] - 1
                if self.leftTime[index] <= 0 then
                    myDigBox.updataFlag = false
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
function WaBaoRecordLayer:registerEvents()
	self.super.registerEvents(self);
 
	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);
	self.btn_close:setClickAreaLength(100);
end

-- 注销时间
function WaBaoRecordLayer:removeEvents()
    self.super.removeEvents(self)

    if self.addItemTimer then
        TFDirector:removeTimer(self.addItemTimer)
	    self.addItemTimer = nil
    end

end

function WaBaoRecordLayer:removeUI()
    self.super.removeUI(self)

    if self.boxList then
        self.boxList:release()
        self.boxList = nil
    end
end

return WaBaoRecordLayer