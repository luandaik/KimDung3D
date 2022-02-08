--[[
******天命图鉴层*******

]]

local IllustrationTianMingLayer = class("IllustrationTianMingLayer", BaseLayer)

function IllustrationTianMingLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.handbook.HandbookEquipLayer")
  
    -- self:removeUnuseTexEnabled(true);

    -- self:initRoleListData(0)
    -- self:drawRoleList()
end

function IllustrationTianMingLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.layer_list			= TFDirector:getChildByPath(ui, 'panel_list')
    self.btn_all       		= TFDirector:getChildByPath(ui, 'btn_all')
    self.btn_weapon       	= TFDirector:getChildByPath(ui, 'btn_weapon')
    self.btn_clothes       	= TFDirector:getChildByPath(ui, 'btn_clothes')
    self.btn_ring       	= TFDirector:getChildByPath(ui, 'btn_ring')
    self.btn_sash       	= TFDirector:getChildByPath(ui, 'btn_sash')
    self.btn_shoes       	= TFDirector:getChildByPath(ui, 'btn_shoes')

    self.btn_all.index 		= 1
    self.btn_weapon.index 	= 2
    self.btn_clothes.index 	= 3
    self.btn_ring.index 	= 4
    self.btn_sash.index 	= 5
    self.btn_shoes.index 	= 6

    self.btn_all.logic 		= self
    self.btn_weapon.logic   = self
    self.btn_clothes.logic  = self
    self.btn_ring.logic     = self
    -- self.btn_sash.logic     = self
    -- self.btn_shoes.logic    = self

    self.btn_sash:setVisible(false)
    self.btn_shoes:setVisible(false)

    -- 对应按钮的索引
    self.btnCurIndex 			= 0

    self.BtnSetting = {}
    self.BtnSetting[1] = {}
    self.BtnSetting[1].btn 		= self.btn_all
    self.BtnSetting[1].normal 	= "ui_new/handbook/tj_quanbu.png"
    self.BtnSetting[1].select 	= "ui_new/handbook/tj_quanbu1.png"

    self.BtnSetting[2] = {}
    self.BtnSetting[2].btn 		= self.btn_weapon
    self.BtnSetting[2].normal 	= "ui_new/handbook/tj_tm_fx.png"
    self.BtnSetting[2].select 	= "ui_new/handbook/tj_tm_fx1.png"
    self.btn_weapon:setTextureNormal("ui_new/handbook/tj_tm_fx.png")
    self.btn_weapon:setTexturePressed("ui_new/handbook/tj_tm_fx1.png")

    self.BtnSetting[3] = {}
    self.BtnSetting[3].btn 		= self.btn_clothes
    self.BtnSetting[3].normal 	= "ui_new/handbook/tj_tm_sj.png"
    self.BtnSetting[3].select 	= "ui_new/handbook/tj_tm_sj1.png"
    self.btn_clothes:setTextureNormal("ui_new/handbook/tj_tm_sj.png")
    self.btn_clothes:setTexturePressed("ui_new/handbook/tj_tm_sj1.png")

    self.BtnSetting[4] = {}
    self.BtnSetting[4].btn 		= self.btn_ring
    self.BtnSetting[4].normal 	= "ui_new/handbook/tj_tm_yx.png"
    self.BtnSetting[4].select 	= "ui_new/handbook/tj_tm_yx1.png"
    self.btn_ring:setTextureNormal("ui_new/handbook/tj_tm_yx.png")
    self.btn_ring:setTexturePressed("ui_new/handbook/tj_tm_yx1.png")

    -- self.BtnSetting[5] = {}
    -- self.BtnSetting[5].btn 		= self.btn_sash
    -- self.BtnSetting[5].normal 	= "ui_new/handbook/tj_yaodai.png"
    -- self.BtnSetting[5].select 	= "ui_new/handbook/tj_yaodai1.png"

    -- self.BtnSetting[6] = {}
    -- self.BtnSetting[6].btn 		= self.btn_shoes
    -- self.BtnSetting[6].normal 	= "ui_new/handbook/tj_xiezi.png"
    -- self.BtnSetting[6].select 	= "ui_new/handbook/tj_xiezi1.png"

    self.QualityRes = {}
    self.QualityRes[6] = "ui_new/handbook/zb_6.png"
    self.QualityRes[5] = "ui_new/handbook/zb_5.png"
    self.QualityRes[4] = "ui_new/handbook/zb_4.png"
    self.QualityRes[3] = "ui_new/handbook/zb_3.png"
    self.QualityRes[2] = "ui_new/handbook/zb_2.png"

    self.cellSize = {}
    self.cellSize.width 	= 140--136
    self.cellSize.height 	= 170--162

    self:drawDefault(1)
end

function IllustrationTianMingLayer:removeUI()
    self.super.removeUI(self)
end

function IllustrationTianMingLayer:registerEvents()
    self.super.registerEvents(self)

    self.btn_all:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle))
    self.btn_weapon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle))
    self.btn_clothes:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle))
    self.btn_ring:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle))
    -- self.btn_sash:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle))
    -- self.btn_shoes:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BtnClickHandle))

    -- TFDirector:addMEGlobalListener(IllustrationManager.IllustrationUpdate, function() self:drawRoleList() end)
end

function IllustrationTianMingLayer:removeEvents()
    --按钮事件

    self.super.removeEvents(self)
end
--按照id排序
local function sortlist( v1,v2 )
    if v1.show_weight > v2.show_weight then
        return true
    elseif v1.show_weight == v2.show_weight then
        if v1.id < v2.id then
            return true
        end
    end
    return false
end
-- index 对应职业 0为全部
function IllustrationTianMingLayer:FilterRoleListData(kind)
	self.qualitySkyBookList = {}

    local tType = { [0] = 0, [1] = 27, [2] = 28, [3] = 29 }

	self.qualitySkyBookList = IllustrationManager:FilterTianMingList( tType[kind] )
	self.qualityNumList  = IllustrationManager:CountNumInList(self.qualitySkyBookList)

	self.QualityNum 	= #self.qualityNumList


    -- for i=1,(QualityHeroType.Max - 1) do
    --     if self.qualitySkyBookList[i] then
    --         table.sort(self.qualitySkyBookList[i],sortlist)
    --     end
    -- end

    self.cellList = {}
    local index     = 1
    local cellNum = 0
    for i=1,self.QualityNum do
        local quality      = self.qualityNumList[i].quality
        local num          = self.qualityNumList[i].number
        local rowTotal     = math.ceil(num/5)
        -- title
        self.cellList[index] = {}
        self.cellList[index].quality        = quality
        self.cellList[index].qualityindex   = i
        self.cellList[index].num            = num
        self.cellList[index].index          = 0
        index = index + 1
        
        local rowTotal = math.ceil(num/5)
        for n=1,rowTotal do
            -- local info = self.qualityRoleList[quality][n]
            -- local id            = info.id

            self.cellList[index] = {}
            self.cellList[index].quality        = quality
            self.cellList[index].qualityindex   = i
            self.cellList[index].num            = 0
            self.cellList[index].index          = n
            index = index + 1
        end

    end

    self.TableCellNum = #self.cellList

	-- print("num1 = ", #self.qualitySkyBookList[1])
	-- print("num2 = ", #self.qualitySkyBookList[2])
	-- print("num3 = ", #self.qualitySkyBookList[3])
	-- print("num4 = ", #self.qualitySkyBookList[4])
end


function IllustrationTianMingLayer:drawCellTitle(cell, QualityIndex, curNum, totalNum)
    local title_node = cell:getChildByTag(100)

    if title_node == nil then
        title_node = createUIByLuaNew("lua.uiconfig_mango_new.handbook.HandbookCell")
        title_node:setPosition(ccp(0,0))
        cell:addChild(title_node)
        title_node:setTag(100)
    end
    title_node:setVisible(true)

    local quality 	   	= self.qualityNumList[QualityIndex].quality
    local img_quality   = TFDirector:getChildByPath(title_node, 'img_quality')
    local bg_bar   	= TFDirector:getChildByPath(title_node, 'bg_bar')
    local txt_wanchengdu 	= TFDirector:getChildByPath(title_node, 'txt_wanchengdu')

    bg_bar:setVisible(false)
    txt_wanchengdu:setVisible(false)
    img_quality:setTexture(self.QualityRes[quality])
end

function IllustrationTianMingLayer:drawRole(node, quality, index)
	if node == nil or self.qualitySkyBookList == nil then
		return
	end
	--空间

    
	local img_pinzhiditu= TFDirector:getChildByPath(node, 'img_pinzhiditu')
    local img_touxiang  = TFDirector:getChildByPath(node, 'img_touxiang')
    local txt_name 		= TFDirector:getChildByPath(node, 'txt_name')
    local btn_head      = TFDirector:getChildByPath(node, 'btn_pingzhianniu')
    local img_cover     = TFDirector:getChildByPath(node, 'img_cover')
    local img_shengpinicon     = TFDirector:getChildByPath(node, 'img_shengpinicon')
    img_shengpinicon:setVisible(false)

	local info 			= self.qualitySkyBookList[quality][index]
	local id 			= info.id
	local bHave 		= info.isOwn
	
	local equipMentData = ItemData:objectByID(id)
    local headIcon  	= equipMentData:GetPath()
    local qualityIcon 	= GetColorIconByQuality(quality)
    img_pinzhiditu:setTexture(qualityIcon)    
    img_touxiang:setTexture(headIcon)
    img_touxiang:setFlipX(false)
    txt_name:setText(equipMentData.name)
    txt_name:setFontSize(20)

    -- if bHave == false then
    --     img_touxiang:setShaderProgram("GrayShader", true)
    -- else
    --     img_touxiang:setShaderProgram("HighLight", true)
    -- end
    img_cover:setVisible(false)
    
    btn_head.quality = quality
    btn_head.index   = index
    btn_head.logic   = self
    btn_head:addMEListener(TFWIDGET_CLICK, audioClickfun(self.touchRoleNode))

end

function IllustrationTianMingLayer:drawCellDetail(cell, quality, index, num)
	-- 绘制背景
    local rowTotal = math.ceil(num/5)
    local height = self.cellSize.height*rowTotal
    local width  = self.cellSize.width*5

    local row = index
    for col=1,5 do
        count = (row-1)*5 + col
        local x = (col - 1) * self.cellSize.width -- + gapx
        local y = 0 --height - row * self.cellSize.height
        if count <= num then
            local node = cell:getChildByTag(100 + col)

            if node == nil then
                node = createUIByLuaNew("lua.uiconfig_mango_new.handbook.HandbookRoleCell")
                cell:addChild(node)
                node:setTag(100 + col)
            end
            node:setVisible(true)

            node:setPosition(ccp(x,y))
            self:drawRole(node, quality, count)
        end
    end

end

function IllustrationTianMingLayer:drawCellWithIndex(cell, cellIndex)
    -- 对cellindex区域
    local cellInfo = self.cellList[cellIndex]

    if cellInfo == nil then
        return
    end
    
    local quality      = self.cellList[cellIndex].quality
    local index        = self.cellList[cellIndex].index 
    local QualityIndex = self.cellList[cellIndex].qualityindex 
    local num          = self.qualityNumList[QualityIndex].number

    for i=1,6 do
        local title_node = cell:getChildByTag(100 + i - 1)

        if title_node then
            title_node:setVisible(false)
        end
    end

    -- 绘制标题
    if index == 0 then
        local curNum   = self.qualityNumList[QualityIndex].curNum
        self:drawCellTitle(cell, QualityIndex, curNum, num)
    -- 绘制角色
    else
        self:drawCellDetail(cell, quality, index, num)
    end
end

function IllustrationTianMingLayer:drawRoleList()
    if self.tableView ~= nil then
    	self.tableView:reloadData()
        self.tableView:setScrollToBegin(false)
        return
    end

    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.layer_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tableView:setPosition(ccp(0,0))
    -- tableView:setPosition(self.layer_list:getPosition())
    self.tableView = tableView
    self.tableView.logic = self



    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, IllustrationTianMingLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, IllustrationTianMingLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, IllustrationTianMingLayer.numberOfCellsInTableView)
    tableView:reloadData()

    -- self:addChild(self.tableView,1)
    self.layer_list:addChild(self.tableView,1)
end

function IllustrationTianMingLayer.numberOfCellsInTableView(table)
	local self = table.logic
    return self.TableCellNum
end

function IllustrationTianMingLayer.cellSizeForTable(table,idx)
    local self = table.logic

    local index        = self.cellList[idx+1].index

    -- 绘制标题
    if index == 0 then
        return 50,self.cellSize.width*5
    -- 绘制角色
    else
        return self.cellSize.height*1,self.cellSize.width*5
    end
end

function IllustrationTianMingLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic

    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
    end

    -- cell:removeAllChildrenWithCleanup(true)
    self:drawCellWithIndex(cell, idx + 1)
    return cell
end

function IllustrationTianMingLayer:drawDefault(index)
	if self.btnCurIndex == index then
		return
	end

	-- 绘制上面的按钮
	if self.btnLastIndex ~= nil then
		local btnInfo = self.BtnSetting[self.btnLastIndex]
		btnInfo.btn:setTextureNormal(btnInfo.normal)
        btnInfo.btn:setZOrder(1)
	end

	self.btnLastIndex = index
	self.btnCurIndex  = index

	local curBtnInfo = self.BtnSetting[self.btnCurIndex]
	curBtnInfo.btn:setTextureNormal(curBtnInfo.select)
    curBtnInfo.btn:setZOrder(3)

	self:FilterRoleListData(self.btnCurIndex-1)
	self:drawRoleList()
	
end

function IllustrationTianMingLayer.BtnClickHandle(sender)
	local self 	= sender.logic
	local index = sender.index

	if self.btnCurIndex == index then
		return
	end

	self:drawDefault(index)
end

function IllustrationTianMingLayer.touchRoleNode(sender)
    local self      = sender.logic
    local index     = sender.index
    local quality   = sender.quality

    local info          = self.qualitySkyBookList[quality][index]
    local id            = info.id
    -- local equipMentData = ItemData:objectByID(id)
    -- --detail
    -- print("我点击了- --", equipMentData.name)


    local layer  = require("lua.logic.illustration.IllustrationTianMingDetailLayer"):new(id)
    AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY_CLOSE)
    -- AlertManager:addLayer(layer, AlertManager.BLOCK)
    local winSize =  GameConfig.WS
    -- layer:setPosition(ccp(winSize.width/2, winSize.height/2))
   	-- layer:setZOrder(1)
    AlertManager:show()
    
end


-- -----断线重连支持方法
-- function IllustrationTianMingLayer:onShow()
    
-- end

-- function IllustrationTianMingLayer:dispose()

-- end

return IllustrationTianMingLayer