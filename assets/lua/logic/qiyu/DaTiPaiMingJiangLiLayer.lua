-- client side DaTiPaiMingJiangLiLayer
--[[
 * @Description: 奖励预览
 ]]
-- script writer sjj
-- creation time 2018-08-6

local DaTiPaiMingJiangLiLayer = class("DaTiPaiMingJiangLiLayer", BaseLayer)

function DaTiPaiMingJiangLiLayer:ctor()
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.nianshou.DaNianShouCheck")
end

function DaTiPaiMingJiangLiLayer:initUI(ui)
	self.super.initUI(self,ui)
    
    self.panel_neirong = TFDirector:getChildByPath(ui, 'panel_neirong')

    self.panel_item = TFDirector:getChildByPath(ui, 'panel_item')
    self.panel_item:removeFromParent()
    self.panel_item:retain()

    -- local drop_id = ConstantData:getValue('MonsterNian.DropGroup.Fireworks')
    -- print("drop_id",drop_id)
    -- local dropItem = DropGroupData:objectByID(drop_id)
    -- local rewardList = dropItem:GetDropItemList()
    -- self.rewardList = rewardList.m_list

    local bg_icon = TFDirector:getChildByPath(self.panel_item, 'bg_icon')
    self.Itemsize = bg_icon:getContentSize()
    -- self:refreshUI()
    -- self:setIcon()
    
end

function DaTiPaiMingJiangLiLayer:setRewardList(list) 
	self.rewardList = list
	self:refreshUI()
end

function DaTiPaiMingJiangLiLayer:setIcon()
    -- local Itemsize = self.panel_item:getContentSize()
    
  --   print("num",num)
  --   -- local x=0
  --   for i=0,#self.rewardList -1 do
  --       local node = self.panel_item:clone()
  --       node:setVisible(true)
  --       -- if math.floor(i/num) > x then
  --       --     x = math.floor(i/num)
  --       -- end
		-- node:setPosition(ccp((i%num)*(self.Itemsize.width - 20) + 25,self.PanelsizePanelsize.height- 110 - (math.floor(i/num))*(self.Itemsize.height)))
		-- self.panel_neirong:addChild(node,1)
  --       self:setCellInfo(node,i+1)
  --   end
end

function DaTiPaiMingJiangLiLayer:refreshUI()    
    self:refreshTableView()
end

function DaTiPaiMingJiangLiLayer:refreshTableView()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()

        self.tableView = tableView
        tableView:setTableViewSize(self.panel_neirong:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView,self))
        --self.tableView:addMEListener(TFTABLEVIEW_SCROLL, handler(self.tableScroll,self))
        self.panel_neirong:addChild(tableView)
    end
    self.tableView:reloadData()
end

function DaTiPaiMingJiangLiLayer:cellSizeForTable(table,idx)
    return 110,140 * 6
end

function DaTiPaiMingJiangLiLayer:tableCellAtIndex(table, idx)
	idx = idx + 1
	local i = idx
	local cell = table:dequeueCell()
	if nil == cell then
		cell = TFTableViewCell:create()
		
		-- local node = self.panel_item:clone()
  --       node:setZOrder(100)
		-- node:setVisible(true)
		
		-- node:setPosition(ccp(0,0))
		-- cell:addChild(node,1)

		
		cell.panel = node	
	end
	cell:removeAllChildren()
	cell:setTag(idx)
	self:setCellInfo(cell,idx)
	
	return cell
end

function DaTiPaiMingJiangLiLayer:numberOfCellsInTableView(table)
    if self.rewardList then
        -- return #self.rewardList
        return math.ceil(#self.rewardList/6)
    end
    -- return 0
end

function DaTiPaiMingJiangLiLayer:setCellInfo(cell,idx)
	-- local panel = cell.panel
    
    for i=1,6 do
    	local helpID = (idx - 1) * 6 + i
		local panel = cell:getChildByTag(helpID)

		local listInfo = self.rewardList[helpID]
		if (listInfo) then
			if (panel == nil) then
				panel = self.panel_item:clone() 
				
				panel:setAnchorPoint(ccp(0,0))
				panel:setPosition(ccp((i - 1) * 110 + 27,0))				
			    cell:addChild(panel,1,helpID)
			end

			local bg_icon = TFDirector:getChildByPath(panel, "bg_icon")
		    local img_icon = TFDirector:getChildByPath(panel, "img_icon")
		    local txt_num = TFDirector:getChildByPath(panel, "txt_num")
		    local img_jp = TFDirector:getChildByPath(panel, "img_jp")
		    bg_icon:setTextureNormal(GetColorIconByQuality(listInfo.quality))
		    img_icon:setTexture(listInfo.path)
		    txt_num:setText(listInfo.number)
		    img_jp:setVisible(false)

		    bg_icon:addMEListener(TFWIDGET_CLICK, 
		    audioClickfun(function()
		        Public:ShowItemTipLayer(listInfo.itemid, listInfo.type, listInfo.number)
		    end))
			    

		end
	end
    
end

function DaTiPaiMingJiangLiLayer.returnButtonClick()
    print("11111111")
end

function DaTiPaiMingJiangLiLayer:registerEvents()
    self.super.registerEvents(self)
end

function DaTiPaiMingJiangLiLayer:removeEvents()
    self.super.removeEvents(self)	

end

return DaTiPaiMingJiangLiLayer