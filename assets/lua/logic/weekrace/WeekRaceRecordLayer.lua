--[[
******周赛-战报*******

	-- by quanhuan
	-- 2015/12/5
	
]]

local WeekRaceRecordLayer = class("WeekRaceRecordLayer",BaseLayer)

-- local recordTitleFont = {
-- 	{
-- 		'八进四第一场',
-- 		'八进四第二场',
-- 		'八进四第三场',
-- 		'八进四第四场'
-- 	},
-- 	{
-- 		'半决赛第一场',
-- 		'半决赛第二场'
-- 	},
-- 	{
-- 		'总决赛'
-- 	}
-- }

local recordTitleFont = localizable.weekrace_recordTitleFont

function WeekRaceRecordLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.zhenbashai.ZhenbashaiBattlefield2")
end

function WeekRaceRecordLayer:initUI( ui )

	self.super.initUI(self, ui)

	self.closeBtn = TFDirector:getChildByPath(ui, "btn_close")
	ADD_ALERT_CLOSE_LISTENER(self, self.closeBtn);
	--创建TabView
    self.TabViewUI = TFDirector:getChildByPath(ui, "panel_zhenba")
    self.TabView =  TFTableView:create()
    self.TabView:setTableViewSize(self.TabViewUI:getContentSize())
    self.TabView:setDirection(TFTableView.TFSCROLLVERTICAL)    
    self.TabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    self.TabView.logic = self
    self.TabViewUI:addChild(self.TabView)
    self.TabView:setPosition(ccp(0,0))

    self.cellModel  = createUIByLuaNew("lua.uiconfig_mango_new.zhenbashai.ZhenbashaiCell4")
    self.cellModel:retain()

    self.cellMax = 0 
end

function WeekRaceRecordLayer:removeUI()
   	self.super.removeUI(self)
   	if self.cellModel then
	   	self.cellModel:release()
	   	self.cellModel = nil
	end
end

function WeekRaceRecordLayer:onShow()
    self.super.onShow(self)

    self:refreshWindow()
end

function WeekRaceRecordLayer:registerEvents()

	if self.registerEventCallFlag then
		return
	end

	self.super.registerEvents(self)

    --注册TabView事件
    self.TabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.TabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.TabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)

    self.registerEventCallFlag = true
end

function WeekRaceRecordLayer:removeEvents()

    self.TabView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    self.super.removeEvents(self)

    self.registerEventCallFlag = nil
    
end

function WeekRaceRecordLayer:dispose()
    self.super.dispose(self)
end


function WeekRaceRecordLayer.cellSizeForTable(table,idx)
    return 160,770
end

function WeekRaceRecordLayer.numberOfCellsInTableView(table)
	local self = table.logic
    return self.cellMax
end

function WeekRaceRecordLayer.tableCellAtIndex(table, idx)

	local self = table.logic
	local cell = table:dequeueCell()

	local panel = nil
	if cell == nil then
	    cell = TFTableViewCell:create()
		panel = self.cellModel:clone()
		panel:setPosition(ccp(0,0))
		cell:addChild(panel)
		panel:setTag(10086)		
	else
		panel = cell:getChildByTag(10086)
	end

	-- idx = idx + 1
	idx = self.cellMax - idx
	self:cellInfoSet(cell,panel,idx)

    return cell
end

function WeekRaceRecordLayer:cellInfoSet( cell, panel, idx )

	if cell.boundData == nil then
		cell.boundData = true

		local winNode = TFDirector:getChildByPath(panel, "bg_name1")
		cell.winPlayer = winNode
		cell.winName = TFDirector:getChildByPath(winNode, "txt_name")
		cell.winHead = TFDirector:getChildByPath(winNode, "img_head")
		cell.winFrame = TFDirector:getChildByPath(winNode, "img_tou")
		cell.winPanel_Buff = TFDirector:getChildByPath(winNode, "panel_buff")
		cell.winPanel_Buff:setVisible(false)
		cell.winBtn_Buff = TFDirector:getChildByPath(winNode, "btn_buff")
		cell.winBtn_Buff:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnBuffClick))
		cell.winTxt_Buff = TFDirector:getChildByPath(winNode, "txt_num")
		cell.winBtn_Buff:setVisible(false)
		cell.winTxt_Buff:setVisible(false)
		local failNode = TFDirector:getChildByPath(panel, "bg_name2")
		cell.failPlayer = failNode
		cell.failName = TFDirector:getChildByPath(failNode, "txt_name")
		cell.failHead = TFDirector:getChildByPath(failNode, "img_head")
		cell.failFrame = TFDirector:getChildByPath(failNode, "img_tou")
		cell.failPanel_Buff = TFDirector:getChildByPath(failNode, "panel_buff")
		cell.failPanel_Buff:setVisible(false)
		cell.failBtn_Buff = TFDirector:getChildByPath(failNode, "btn_buff")
		cell.failBtn_Buff:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btnBuffClick))
		cell.failTxt_Buff = TFDirector:getChildByPath(failNode, "txt_num")
		cell.failBtn_Buff:setVisible(false)
		cell.failTxt_Buff:setVisible(false)
		cell.recordBtn = TFDirector:getChildByPath(panel, "btn_guanzhan")
		cell.recordTitle = TFDirector:getChildByPath(panel, "txt_battletitle")
		cell.recordTime = TFDirector:getChildByPath(panel, 'txt_battletime')
		cell.recordTime:setVisible(false)

		cell.recordBtn:addMEListener(TFWIDGET_CLICK, audioClickfun(self.recordBtnClick))
		cell.recordBtn.logic = self
	end
	cell.recordBtn.idx = idx	
	
	local cellItem = self.recordTable[idx]
	if cellItem == nil then
		panel:setVisible(false)
		return
	end
	panel:setVisible(true)

	cell.recordBtn:setVisible(true)
	cell.winPlayer:setVisible(false)
	cell.failPlayer:setVisible(false)
	if nil == cellItem.atkIcon or cellItem.atkIcon <= 0 then      	--pck change head icon and head icon frame
		cellItem.atkIcon = cellItem.atkProfession
	end
	if nil == cellItem.defIcon or cellItem.defIcon <= 0 then         
		cellItem.defIcon = cellItem.defProfession					--end
	end
	if cellItem.winPlayerId and cellItem.winPlayerId ~= 0 then
		if cellItem.atkPlayerId == cellItem.winPlayerId then
			cell.winPlayer:setVisible(true)
			cell.winPlayer:setTexture('ui_new/Zhenbashai/img_shengzuo.png')
			cell.winName:setText(cellItem.atkPlayerName)
			local RoleIcon = RoleData:objectByID(cellItem.atkIcon)
            cell.winHead:setTexture(RoleIcon:getIconPath())									--pck change head icon and head icon frame
            Public:addFrameImg(cell.winHead,cellItem.atkHeadPicFrame)    					--end
            Public:addInfoListen(cell.winHead,true,1,cellItem.atkPlayerId)

   --          if cellItem.atkPeakAddition and cellItem.atkPeakAddition > 0 then
   --          	cell.winPanel_Buff:setVisible(true)
   --          	cell.winBtn_Buff.addNum = cellItem.atkPeakAddition
   --          	cell.winTxt_Buff:setText(cellItem.atkPeakAddition * 0.01 ..'%')
			-- else
			-- 	cell.winPanel_Buff:setVisible(false)
   --          end

            if cellItem.defPlayerId then
            	cell.failPlayer:setVisible(true)
				cell.failName:setText(cellItem.defPlayerName)
				RoleIcon = RoleData:objectByID(cellItem.defIcon)
	            cell.failHead:setTexture(RoleIcon:getIconPath())
	            Public:addFrameImg(cell.failHead,cellItem.defHeadPicFrame)    				--end
	            Public:addInfoListen(cell.failHead,true,1,cellItem.defPlayerId)
	            cell.failPlayer:setTexture('ui_new/Zhenbashai/img_fuyou.png')

	   --          if cellItem.defPeakAddition and cellItem.defPeakAddition > 0 then
	   --          	cell.failPanel_Buff:setVisible(true)
	   --          	cell.failBtn_Buff.addNum = cellItem.defPeakAddition
	   --          	cell.failTxt_Buff:setText(cellItem.defPeakAddition * 0.01 ..'%')
				-- else
				-- 	cell.failPanel_Buff:setVisible(false)
	   --          end

	        else
	        	cell.recordBtn:setVisible(false)
            end 
		elseif cellItem.defPlayerId == cellItem.winPlayerId then

			cell.winPlayer:setVisible(true)
			cell.winPlayer:setTexture('ui_new/Zhenbashai/img_fuzuo.png')
			cell.winName:setText(cellItem.atkPlayerName)
			local RoleIcon = RoleData:objectByID(cellItem.atkIcon)
            cell.winHead:setTexture(RoleIcon:getIconPath())
            Public:addFrameImg(cell.winHead,cellItem.atkHeadPicFrame)    					--end
            Public:addInfoListen(cell.winHead,true,1,cellItem.atkPlayerId)

   --          if cellItem.atkPeakAddition and cellItem.atkPeakAddition > 0 then
   --          	cell.winPanel_Buff:setVisible(true)
   --          	cell.winBtn_Buff.addNum = cellItem.atkPeakAddition
   --          	cell.winTxt_Buff:setText(cellItem.atkPeakAddition * 0.01 ..'%')
			-- else
			-- 	cell.winPanel_Buff:setVisible(false)
   --          end

            if cellItem.defPlayerId then
            	cell.failPlayer:setVisible(true)
				cell.failName:setText(cellItem.defPlayerName)
				RoleIcon = RoleData:objectByID(cellItem.defIcon)
	            cell.failHead:setTexture(RoleIcon:getIconPath())
	            Public:addFrameImg(cell.failHead,cellItem.defHeadPicFrame)    				--end
	            Public:addInfoListen(cell.failHead,true,1,cellItem.defPlayerId)
	            cell.failPlayer:setTexture('ui_new/Zhenbashai/img_shengyou.png')

	   --          if cellItem.defPeakAddition and cellItem.defPeakAddition > 0 then
	   --          	cell.failPanel_Buff:setVisible(true)
	   --          	cell.failBtn_Buff.addNum = cellItem.defPeakAddition
	   --          	cell.failTxt_Buff:setText(cellItem.defPeakAddition * 0.01 ..'%')
				-- else
				-- 	cell.failPanel_Buff:setVisible(false)
	   --          end

	        else
	        	cell.recordBtn:setVisible(false)
            end 

			-- cell.winPlayer:setVisible(true)
			-- cell.winName:setText(cellItem.defPlayerName)
			-- local RoleIcon = RoleData:objectByID(cellItem.defProfession)
   --          cell.winHead:setTexture(RoleIcon:getHeadPath())   

   --          if cellItem.atkPlayerId then
   --          	cell.failPlayer:setVisible(true)
			-- 	cell.failName:setText(cellItem.atkPlayerName)
			-- 	local RoleIcon = RoleData:objectByID(cellItem.atkProfession)
	  --           cell.failHead:setTexture(RoleIcon:getHeadPath())  
	  --       else
	  --       	cell.recordBtn:setVisible(false)
	  --       end
		end
		--print(recordTitleFont[cellItem.round][cellItem.index])
		cell.recordTitle:setText(recordTitleFont[cellItem.round][cellItem.index])
	else
		cell.recordBtn:setVisible(false)
	end
end

function WeekRaceRecordLayer:refreshWindow()

	self.recordTable = WeekRaceManager:getRecordList()
	self.cellMax = #self.recordTable

	self.TabView:reloadData()
	self.TabView:setScrollToBegin()
end
function WeekRaceRecordLayer:refreshWindowAndClose()
	
end

function WeekRaceRecordLayer.btnBuffClick( btn )
    local num = btn.addNum or 0
    PeakManager:openBuffLayer0(num)
end

function WeekRaceRecordLayer.recordBtnClick( btn )
	local self = btn.logic
	local info = self.recordTable[btn.idx]
	if info then
		print("replay id = ",info.replayId)
		WeekRaceManager:requestPlayVideo( info.replayId )
	end
end
return WeekRaceRecordLayer