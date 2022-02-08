--[[
 * @Description: 心法合成界面
 ]]
-- script writer fei
-- creation time 2017-03-02
local XinFaXinFaHeChengLayer = class("XinFaXinFaHeChengLayer", BaseLayer)

function XinFaXinFaHeChengLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.xinfa.XinFaHeCheng")
end

function XinFaXinFaHeChengLayer:initUI( ui )
    self.super.initUI(self, ui)
    self.xinfaList 			= {}
    self.txt_name 			= TFDirector:getChildByPath(ui, 'txt_name')
    self.img_fazhen 		= TFDirector:getChildByPath(ui, 'img_fazhen')
    self.img_icon			= TFDirector:getChildByPath(self.img_fazhen, 'img_icon')
    self.btn_hecheng 		= TFDirector:getChildByPath(ui, 'btn_hecheng')
    self.img_name           = TFDirector:getChildByPath(ui, 'img_name')
    local panel_icon_left 	= TFDirector:getChildByPath(ui, 'panel_icon_left')
    self.panel_kong 		= {}
    for i = 3, XinFaManager.MAX_QUALITY do
    	local panel_kong = TFDirector:getChildByPath(ui, 'panel_kong'..i)
    	panel_kong.btn_jy = {}
    	for j = 1 , i do 
    		panel_kong.btn_jy[j] = TFDirector:getChildByPath(panel_kong, 'btn_jy'..j)
    		panel_kong.btn_jy[j].img_jy = TFDirector:getChildByPath(panel_kong.btn_jy[j], 'img_jy')
    		panel_kong.btn_jy[j].img_qd = TFDirector:getChildByPath(panel_kong.btn_jy[j], 'img_qd')
    		panel_kong.btn_jy[j].txt_num = TFDirector:getChildByPath(panel_kong.btn_jy[j], 'txt_num')
    	end
    	panel_kong:setVisible(false)
    	self.panel_kong[i] = panel_kong
    end
    self.xinfanum 			= 0
    self.xuanzhongIndex		= 1
    self.panel_icon 		= TFDirector:getChildByPath(panel_icon_left, 'panel_icon')
    self.panel_icon:setVisible(false)
    self.tableIndex = {}

    self.TabViewUI 			= TFDirector:getChildByPath(ui,"table_icon")
    self.TabView =  TFTableView:create()
    self.TabView:setTableViewSize(self.TabViewUI:getContentSize())
    self.TabView:setDirection(TFTableView.TFSCROLLVERTICAL)    
    self.TabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    self.TabView.logic = self
    self.TabViewUI:addChild(self.TabView)
    self.TabView:setPosition(ccp(0,0))   
    self.cellModel  		= self.panel_icon
    self.cellModel:retain() 
end

function XinFaXinFaHeChengLayer:setXinFaData(data)
	self.gmId = data
    self.XinFaInfo = XinFaManager:getXinFaByGmId(self.gmId)
	self:refreshUI()
end

function XinFaXinFaHeChengLayer:removeUI()
    self.super.removeUI(self)
    if self.cellModel then
        self.cellModel:release()
        self.cellModel = nil
    end    
end

function XinFaXinFaHeChengLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function XinFaXinFaHeChengLayer:refreshUI()
	-- print('XinFaXinFaHeChengLayer:refreshUI')
	-- print(IllustrationManager:getXinFaList())
	local xinfaListData = IllustrationManager:getXinFaList()
    
	--遍历心法列表
    self.tableIndex = {}
	self.xinfanum = 0
	for i,v in pairs(xinfaListData) do
		self.xinfaList[i] = {}
		for k,j in pairs(v) do
			if self.xinfaList[j.quality][j.usable] == nil then
				self.xinfaList[j.quality][j.usable] = {}
			end
            self.xinfaList[j.quality][j.usable][j.kind] = j
            local needPieceNum = KongfuComData:getXinFaPieceNumByid(j.id)
            if (needPieceNum > 1) then
                self.xinfaList[j.quality][j.usable][j.kind].needPieceNum = KongfuComData:getXinFaPieceNumByid(j.id)
                self.xinfaList[j.quality][j.usable][j.kind].piecenum = 0
                local index = {}
                index.quality 	= j.quality
                index.usable  	= j.usable
                index.kind 		= j.kind
                index.index 	= self.xinfanum
                table.insert(self.tableIndex,index)
                self.xinfanum = self.xinfanum + 1
            end
		end
	end
    -- print(BagManager:getItemByType(EnumGameItemType.XinFaPiece))
    -- local BagPiece = BagManager:getItemByType(EnumGameItemType.XinFaPiece)
    local BagPiece = XinFaManager:getAllXinFaPiece()
    for v in BagPiece:iterator() do
    	self.xinfaList[v.config.quality][v.config.usable][v.config.kind].piecenum = self.xinfaList[v.config.quality][v.config.usable][v.config.kind].piecenum + 1
    end
    -- print(self.xinfaList)
    self:resortReward()
    -- print(self.XinFaInfo.config,self.tableIndex)
    if self.XinFaInfo then
        for i = 1, self.xinfanum do
            if self.XinFaInfo.config.type == 35 then
                break
            end
            if self.XinFaInfo.config.quality == self.tableIndex[i].quality and self.XinFaInfo.config.kind == self.tableIndex[i].kind and self.XinFaInfo.config.usable == self.tableIndex[i].usable then              
                self.xuanzhongIndex = i
            end
        end
    end
    self.TabView:reloadData()
    self:refreshRightPanel()
end

function XinFaXinFaHeChengLayer.cellSizeForTable(table,idx)
    return 100,100
end

function XinFaXinFaHeChengLayer.numberOfCellsInTableView(table)
	local self = table.logic
    return self.xinfanum
end

function XinFaXinFaHeChengLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel:clone()
        cell:addChild(panel)
        cell.panelNode = panel
    else
        panel = cell.panelNode
    end
    idx = idx + 1
    -- print(idx)
    -- print("tableCellAtIndex",self.tableIndex[idx])
    self:drawCell(cell,self.tableIndex[idx],idx)
    -- print("XinFaXinFaHeChengLayer.tableCellAtIndex",self.tableIndex:objectByID(idx))

    return cell
end

function XinFaXinFaHeChengLayer:refreshRightPanel()
	local index = self.tableIndex[self.xuanzhongIndex]
	local itemData = self.xinfaList[index.quality][index.usable][index.kind]
	local itemInfo = ItemData:objectByID(itemData.id)
	for i = 3, XinFaManager.MAX_QUALITY do
		self.panel_kong[i]:setVisible(false)
	end
	-- print("itemData.needPieceNum",itemData.needPieceNum)
	local canRob = false
	if itemData.piecenum ~= 0 then
		canRob = true
	end
    self.btn_hecheng:setOpacity(125)
    self.btn_hecheng:setTouchEnabled(false)
    --是否可合成
	if self:canHecheng(index) == true then
		self.btn_hecheng:setOpacity(255)
    	self.btn_hecheng:setTouchEnabled(true)
    end
    if (not self.panel_kong[itemData.needPieceNum]) then
        toastMessage(localizable.common_data_error)
        return
    end
	self.panel_kong[itemData.needPieceNum]:setVisible(true)
	local costList = KongfuComData:getXinFaPieceByid(itemData.id)
	-- print(costList)
	for i,data in ipairs(costList) do
      	if (data and data ~= "") then
      	    local info          = string.split(data, "_")
      	    local itemTypeId    = tonumber(info[1])
      	    local itemId        = tonumber(info[2])
      	    local itemNum       = tonumber(info[3])
      	    local btn           = self.panel_kong[itemData.needPieceNum].btn_jy[i]
      	    if (btn) then
      	        btn:setVisible(true)
      	        btn.itemId          = itemId
      	        btn.itemTypeId      = itemTypeId
      	        -- print('itemType',itemTypeId,itemId)
      	        if itemTypeId == EnumDropType.GOODS then 
      	        	local item = ItemData:objectByID(itemId)
      	     		
      	        	local num = XinFaManager:getXinFaPieceNumById(itemId)   	        	
      	        	-- print(num,iconStr)
                    if item then
                        local iconStr = item:GetPath()
                        btn.img_jy:setTexture(iconStr)
                    end
      	        	if num ~= 0 then
                        btn.txt_num:setText(num)
                        btn.txt_num:setVisible(true)
      	        		btn.img_jy:setGrayEnabled(false)
      	        		btn.img_jy:setOpacity(225)
      	        		btn.img_qd:setVisible(false)
                        btn:setTextureNormal(GetColorRoadIconByQualitySmall(item.quality))
      	        	else
                        btn.txt_num:setVisible(false)
                        btn.img_jy:setOpacity(100)
      	        		btn.img_qd:setVisible(true)
                        btn:setTextureNormal("ui_new/tianshu/btn_jyk.png")
      	        	end
      	        	btn.logic = self
                    if canRob == false then
                        btn.img_qd:setVisible(false)
                    end
      	        	btn.canRob = canRob
      	        	btn:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
      	    	end
      		end
   		end
   	end
    self.img_icon:setZOrder(999)
	self.img_icon:setTexture("icon/item/"..itemData.id..".png")
    -- self.img_name:setTexture("ui_new/role/bg-n"..itemInfo.quality..".png")
	self.txt_name:setText(itemInfo.name)
end

function XinFaXinFaHeChengLayer:drawCell(cell,index,idx)
	local panel = cell.panelNode
	local itemData = self.xinfaList[index.quality][index.usable][index.kind]
    panel.bg_icon   = TFDirector:getChildByPath(panel, 'bg_icon')
    panel.img_icon  = TFDirector:getChildByPath(panel, 'img_icon')
    panel.txt_num   = TFDirector:getChildByPath(panel, 'txt_num')
    panel.img_xuanzhong = TFDirector:getChildByPath(panel, 'img_xuanzhong')
    panel.img_xuanzhong:setVisible(true)
    panel.logic = self
    panel.bg_icon.logic = self
    panel:setVisible(true)
    panel:setPosition(ccp(10,0))
    panel.bg_icon.Pos = self.cellModel:getPosition() + ccp(53,49 - idx * 126)
    panel.bg_icon.index = idx
    panel.bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnCellClickHandle),1)
	local itemInfo = ItemData:objectByID(itemData.id)
    panel.bg_icon:setTextureNormal(GetColorIconByQuality_118(itemInfo.quality))
	if itemData.piecenum == 0 then
		panel:setGrayEnabled(true)
        panel.bg_icon:setTextureNormal(GetColorIconByQuality_118(1))
    else
        panel:setGrayEnabled(false)
	end
    if self:canHecheng(index) then
        CommonManager:updateRedPoint(panel,true,ccp(65, 65))
    else 
        CommonManager:updateRedPoint(panel,false,ccp(65, 65))
    end
	if self.xuanzhongIndex == idx then
		panel.img_xuanzhong:setVisible(true)
	else
		panel.img_xuanzhong:setVisible(false)
	end
	
	panel.img_icon:setTexture("icon/item/"..itemData.id..".png")
end

function XinFaXinFaHeChengLayer:resortReward()
    --能的放前面
    local function cmpFun(widget1, widget2)
        if  self:canHecheng(widget1) == true and self:canHecheng(widget2) == false then
            return true;
        elseif  self:canHecheng(widget2) == true and self:canHecheng(widget1) == false then
            return false;
        elseif self.xinfaList[widget1.quality][widget1.usable][widget1.kind].piecenum ~= 0 and self.xinfaList[widget2.quality][widget2.usable][widget2.kind].piecenum == 0 then 
            return true
        elseif self.xinfaList[widget1.quality][widget1.usable][widget1.kind].piecenum == 0 and self.xinfaList[widget2.quality][widget2.usable][widget2.kind].piecenum ~= 0 then 
            return false
        elseif widget1.quality == widget2.quality and self.xinfaList[widget1.quality][widget1.usable][widget1.kind].piecenum ~= self.xinfaList[widget2.quality][widget2.usable][widget2.kind].piecenum then
                if self.xinfaList[widget1.quality][widget1.usable][widget1.kind].piecenum > self.xinfaList[widget2.quality][widget2.usable][widget2.kind].piecenum then
                    return true
                elseif self.xinfaList[widget1.quality][widget1.usable][widget1.kind].piecenum < self.xinfaList[widget2.quality][widget2.usable][widget2.kind].piecenum then
                    return false
                end
        else
            if widget1.index > widget2.index then
                return true;
            else
                return false;
            end
        end
    end
    -- print("cmpFun1", tostring(cmpFun1) ,self.tableIndex)
    table.sort(self.tableIndex,cmpFun)
    --table.sort(self.tableIndex,cmpFun1)
    -- print("cmpFun1", self.tableIndex)
end

function XinFaXinFaHeChengLayer:canHecheng(index)
	if self.xinfaList[index.quality][index.usable][index.kind].piecenum >= self.xinfaList[index.quality][index.usable][index.kind].needPieceNum then
        return true
	else
		return false
	end
end

function XinFaXinFaHeChengLayer.onShowItemClickHandle(sender)
    local self = sender.logic;
    print("XinFaXinFaHeChengLayer.onShowItemClickHandle")
    -- Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId)
    local layer = require("lua.logic.xinfa.XinFaGetSuiPian"):new()
    layer:loadData(sender.itemId,sender.itemTypeId,sender.canRob)
    AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY_CLOSE, AlertManager.BLOCK_AND_GRAY_CLOSE)
    AlertManager:show() 
    -- self:addChild(layer)
end

function XinFaXinFaHeChengLayer.onHeChengClickHandle(sender)
    local self = sender.logic
    local index = self.tableIndex[self.xuanzhongIndex]
    local itemData = self.xinfaList[index.quality][index.usable][index.kind]
    XinFaManager:sendHeartMethodMerge(itemData.id)
end

function XinFaXinFaHeChengLayer.OnCellClickHandle(sender)
    local self = sender.logic
    if self.successEffect then
        return
    end
	print("OnCellClickHandle")
    print(sender.index)
	self.xuanzhongIndex = sender.index
	self.TabView:reloadData()
	self:refreshRightPanel()
end

function XinFaXinFaHeChengLayer:registerEvents()
    self.super.registerEvents(self)
    self.btn_hecheng.logic = self
    self.btn_hecheng:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHeChengClickHandle),1)

    self.TabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.TabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.TabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.reciveInfo = function (event)
        if self.refreshUI then
            self:addSuccessEffect(self.img_icon, event.data[1].itemId)
            self:refreshUI()
        end
    end
    TFDirector:addMEGlobalListener(XinFaManager.HeartMethodMerge, self.reciveInfo)
end

-- 设置礼物弹窗
function XinFaXinFaHeChengLayer:setRewardList(data)
    local itemInfo = ItemData:objectByID(data)
    if itemInfo.type ~= EnumDropType.XINFA then
        return 
    end
    local rewardList = TFArray:new();
    local rewardArr = {};
    local rewardItem = {itemId = tonumber(data),type = tonumber(itemInfo.type), number = tonumber(1)};
    rewardArr[1] = rewardItem
    for i=1,#rewardArr do
        local rewardInfo = BaseDataManager:getReward(rewardArr[i])
        rewardList:push(rewardInfo);
    end
    RewardManager:showRewardListLayer(rewardList);
end

function XinFaXinFaHeChengLayer:addSuccessEffect(widget, id)
    if self.successEffect then
        return
    end
    
    local resPath = "effect/kongfuCom.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("kongfuCom_anim")

    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(56,63))
    effect:setZOrder(10000)
    self.successEffect = effect    
    self.successEffect:playByIndex(0, -1, -1, 0)
    widget:addChild(effect)

    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeFromParent()
        self.successEffect = nil
        self:setRewardList(id)
    end)
end

function XinFaXinFaHeChengLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(XinFaManager.HeartMethodMerge, self.reciveInfo)
    self.reciveInfo = nil
end

return XinFaXinFaHeChengLayer