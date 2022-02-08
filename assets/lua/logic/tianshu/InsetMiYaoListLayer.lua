
--              script writer fei
--              creation time 20170605
--              Description:
--　　　　　　　　┏┓　　　┏┓+ +
--　　　　　　　┏┛┻━━━┛┻┓ + +
--　　　　　　　┃　　　　　　　┃ 　
--　　　　　　　┃　　　━　　　┃ ++ + + +
--　　　　　　 ████━████ ┃+
--　　　　　　　┃　　　　　　　┃ +
--　　　　　　　┃　　　┻　　　┃
--　　　　　　　┃　　　　　　　┃ + +
--　　　　　　　┗━┓　　　┏━┛
--　　　　　　　　　┃　　　┃　　　　　　
--　　　　　　　　　┃　　　┃ + + + +
--　　　　　　　　　┃　　　┃　　　　　　
--　　　　　　　　　┃　　　┃ + 　　　　神兽保佑,代码无bug　　
--　　　　　　　　　┃　　　┃
--　　　　　　　　　┃　　　┃　　+　　　　　　　　
--　　　　　　　　　┃　 　　┗━━━┓ + +
--　　　　　　　　　┃ 　　　　　　　┣┓
--　　　　　　　　　┃ 　　　　　　　┏┛
--　　　　　　　　　┗┓┓┏━┳┓┏┛ + + + +
--　　　　　　　　　　┃┫┫　┃┫┫
--　　　　　　　　　　┗┻┛　┗┻┛+ + + +
--
local InsetMiYaoListLayer = class("InsetMiYaoListLayer", BaseLayer)

local columnNumber = 4

function InsetMiYaoListLayer:ctor(bibleId)
    self.super.ctor(self)
    self.bibleId = bibleId
    self:init("lua.uiconfig_mango_new.tianshu.SetMiYao")
end

function InsetMiYaoListLayer:initUI(ui)
	self.super.initUI(self,ui)

    -- --左侧详情
    self.scroll_left            = TFDirector:getChildByPath(ui, 'scroll_left')


    -- --右侧详情
    self.panel_list     = TFDirector:getChildByPath(ui, 'gem_table')
    self.btn_Inset      = TFDirector:getChildByPath(ui, 'btn_mosaic')
    self.btn_unload     = TFDirector:getChildByPath(ui, 'btn_xiexia')
   
    self.insetMiYaoLayer = require("lua.logic.tianshu.InsetMiYaoLayer"):new(self.bibleId)
    self.insetMiYaoLayer:setBibleGmId(self.bibleId)
    self.scroll_left:addChild(self.insetMiYaoLayer)
    self:initTableview()
end

function InsetMiYaoListLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
    if (self.insetMiYaoLayer) then
        self.insetMiYaoLayer:onShow()
    end
end

function InsetMiYaoListLayer:refreshUI()
    self:updateTableSource()
    if (self.tableView) then
        -- self.tableView:reloadData()
        self.tableView:reloadData()
        self:selectDefault()
    end
    if (self.insetMiYaoLayer) then
        self.insetMiYaoLayer:refreshUI()
    end
    local bibleInfo = SkyBookManager:getItemByInstanceId( self.bibleId )
    if (bibleInfo and bibleInfo.bibleKeyId and bibleInfo.bibleKeyId ~= 0) then
        self.btn_unload:setVisible(true)
    else
        self.btn_unload:setVisible(false)
    end
end
function InsetMiYaoListLayer:setBibleGmId(bibleId)
    self.bibleId   = bibleId
    if (self.insetMiYaoLayer) then
        self.insetMiYaoLayer:setBibleGmId(self.bibleId)
    end
    self:refreshUI()
end
function InsetMiYaoListLayer:dispose()
    
end

function InsetMiYaoListLayer:removeUI()
	self.super.removeUI(self)
    if (self.insetMiYaoLayer) then
        self.insetMiYaoLayer:removeUI()
    end
end


--销毁所有TableView的Cell中的Panel
function InsetMiYaoListLayer:disposeAllPanels()
    if self.allPanels == nil then
        return
    end

    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        if panel then
            panel:dispose()
        end
    end
end

--[[
    更新TableView显示的内容
]]
function InsetMiYaoListLayer:updateTableSource()
    -- self.gemlist = BagManager:getItemByType(EnumGameItemType.MiYao)
    self.gemlist = BagManager:getMiYaoList()

    -- --当其他提交都相等时使用的最简单的比较方法
    local function sortlist(src,target)
        if src.itemdata.quality == target.itemdata.quality then
            if src.level > target.level then
                return true
            else
                return false--src.instanceId > target.instanceId
            end
        else
            return src.itemdata.quality > target.itemdata.quality
        end
    end

    self.gemlist:sort(sortlist)
end

--[[
    全部cell都重置为未选中
]]
function InsetMiYaoListLayer:unselectedAllCellPanels()
    if self.allPanels == nil then
        return
    end

    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        if self.selectId and panel.id == self.selectId then
            --panel:setSelected(false)
            panel:refreshUI()
        end
    end
end

function InsetMiYaoListLayer:updateSelectCell()
    if self.allPanels == nil then
        return
    end

    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        panel:refreshUI()
    end
end

function InsetMiYaoListLayer:selectDefault()
    if self.allPanels == nil then
        self.selectId = nil
        return
    end

    if self.gemlist and self.gemlist:length() > 0 and self.gemlist:objectAt(1).instanceId then
        -- self:iconBtnClick(self.allPanels[1])
    else
        self.selectId = nil
    end
end

--[[
    选中
]]
function InsetMiYaoListLayer:select(id)
    --选中的Cell如果重复选中则不处理
    if self.selectId then
        if self.selectId == id then
            return
        end
        --self:unselectedAllCellPanels()
    end
    self.selectId = id
    print('self.selectId  ', self.selectId)
    
    self:updateSelectCell()
    if self.gemPos == nil then
        for r=1,#self.allPanels do
            local panel = self.allPanels[r]
            if panel:isSelected() then
                self.gemPos = cell:getEffectPosition()
                _parent = self.ui:getParent()
                local rootPos = _parent:convertToWorldSpaceAR(self.ui:getPosition())
                self.gemPos.x = self.gemPos.x - rootPos.x
                self.gemPos.y = self.gemPos.y - rootPos.y
                break
            end
        end
    end
    --详细信息控件
    local item = BagManager:getItemById(id)
    if item == nil  then
        return
    end
    -- self:setData(item)
end

function InsetMiYaoListLayer.cellSizeForTable(table,idx)    
    return 200,540
end

function InsetMiYaoListLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    self.allPanels = self.allPanels or {}
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        for i=1,columnNumber do
            local gem_panel = require('lua.logic.tianshu.TianMiYaoIcon'):new(1)
            gem_panel:setPosition(ccp(10+137*(i-1),15))
            gem_panel:setLogic(self)
            cell:addChild(gem_panel)
            cell.gem_panel = cell.gem_panel or {}
            cell.gem_panel[i] = gem_panel

            local newIndex = #self.allPanels + 1
            self.allPanels[newIndex] = gem_panel
        end
    end
    for i=1,columnNumber do
        local atIndex = idx * columnNumber + i
        if atIndex <= self.gemlist:length() then
            local gem = self.gemlist:objectAt(atIndex)
            cell.gem_panel[i]:setGemid(gem.instanceId)
        else
            cell.gem_panel[i]:setGemid(nil)
        end
    end
    return cell
end

function InsetMiYaoListLayer:mosaicAction(id,pos)
    local bibleKeyInfo = SkyBookManager:getMiYaoById(id)
    if bibleKeyInfo == nil then
        return
    end
    local gem = ItemData:objectByID(bibleKeyInfo.id)
    if gem == nil  then
        return
    end
    local pic = TFImage:create()
    pic:setTexture(gem:GetPath())
    pic:setZOrder(100)
    pic:setPosition(pos)
    self.ui:addChild(pic)
    local _parent = self.insetMiYaoLayer.img_gem:getParent()
    local worldPos = _parent:convertToWorldSpaceAR(self.insetMiYaoLayer.img_gem:getPosition())
    _parent = self.ui:getParent()
    local rootPos = _parent:convertToWorldSpaceAR(self.ui:getPosition())
    worldPos.x = worldPos.x - rootPos.x
    worldPos.y = worldPos.y - rootPos.y
    local tween = {
        target = pic,
            {
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                duration = 0.6,
                x = worldPos.x,
                y = worldPos.y,
                onComplete = function ()
                    pic:removeFromParentAndCleanup(true)
                    pic = nil
                    self:playEffect(worldPos.x,worldPos.y)
                    self:refreshUI()
                    self.insertType = 0
                    self:showSuccessDialog()
                end,
            },
    }

    self:playEffect(pos.x,pos.y)
    TFDirector:toTween(tween)
end

--显示升星成功对话框
function InsetMiYaoListLayer:showSuccessDialog()
    if self.layer_result == nil then
        self.layer_result = TFImage:create("ui_new/smithy/xiangqian_word.png")
        self.layer_result:setAnchorPoint(ccp(0.5,0.5))
        self.layer_result:setPosition(ccp(self.ui:getContentSize().width/2,self.ui:getContentSize().height/2))
        self.ui:addChild(self.layer_result)
    end

    TFDirector:killAllTween(self.layer_result)
    self.layer_result:setVisible(true)
    self.layer_result:setZOrder(100)
    self.layer_result:setScale(0.1)
    local tween = {
        target = self.layer_result,
            {
                duration = 0.1,
                scale = 1,
            },
            {
                duration = 0.1,
                scale = 0.8,
            },
            {
                duration = 0.1,
                scale = 1,
            },
            {
                duration = 0,
                delay = 1,
                onComplete = function ()
                    self.layer_result:setVisible(false)
                end,
            },
    }
    TFDirector:toTween(tween)
end

function InsetMiYaoListLayer:unMosaicAction(id)
    local bibleKeyInfo = SkyBookManager:getMiYaoById(id)
    if bibleKeyInfo == nil then
        return
    end
    local gem = ItemData:objectByID(bibleKeyInfo.id)
    if gem == nil  then
        return
    end
    local _parent = self.insetMiYaoLayer.img_gem:getParent()
    local pos = self.insetMiYaoLayer.img_gem:getPosition()
    pos = _parent:convertToWorldSpaceAR(pos)
    _parent = self.ui:getParent()
    local rootPos = _parent:convertToWorldSpaceAR(self.ui:getPosition())
    pos.x = pos.x - rootPos.x
    pos.y = pos.y - rootPos.y
    self:playEffect(pos.x,pos.y)

    local pic = TFImage:create()
    pic:setTexture(gem:GetPath())
    pic:setZOrder(100)
    pic:setPosition(pos)
    self.ui:addChild(pic)

    _parent = self.panel_list:getParent()
    local targetPos = self.panel_list:getPosition()
    targetPos = _parent:convertToWorldSpace(targetPos)
    targetPos.x = targetPos.x + self.panel_list:getSize().width/2
    targetPos.y = targetPos.y + self.panel_list:getSize().height/2
    local tween = {
        target = pic,
            {
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                duration = 0.6,
                x = targetPos.x,
                y = targetPos.y,
                onComplete = function ()
                    pic:removeFromParentAndCleanup(true)
                    pic = nil              
                end,
            },
    }
    TFDirector:toTween(tween)
end

function InsetMiYaoListLayer:showOneKeyEffect( level )
    local effectList = TFArray:new()
    local temp = 1
    for v in self.gemlist:iterator() do
        local itemInfo = ItemData:objectByID(v.id)
        if itemInfo and itemInfo.level < level and temp <= 8 then
            effectList:pushBack(v.id)
            temp = temp + 1
        end
    end
    if effectList:length() > 0 then
        self:_choiceGemAction(effectList)
    end
end

function InsetMiYaoListLayer.numberOfCellsInTableView(table)
    local self = table.logic
    if self.gemlist and self.gemlist:length() > 0 then
        local num = math.ceil(self.gemlist:length()/columnNumber)
        if num < 2 then
            return 2
        else
            return num
        end
    end
    return 2
end

function InsetMiYaoListLayer:initTableview()
    self:updateTableSource()
    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.panel_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    self.tableView = tableView
    self.tableView:setZOrder(10)
    self.tableView.logic = self
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, InsetMiYaoListLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, InsetMiYaoListLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, InsetMiYaoListLayer.numberOfCellsInTableView)

    self.panel_list:addChild(tableView)
end

function InsetMiYaoListLayer.gemBuildBtnClickHandle(btn)
	local self = btn.logic

    local coin = tonumber(self.txt_cost:getText())
    local enough = MainPlayer:isEnoughCoin(coin,true)
    if not enough then
        return
    end

    if self and self.actionpaly == false then
        self.isauto = false
        self:gemBuild()
    end
end

function InsetMiYaoListLayer:iconBtnClick(cell)

	play_xuanze();

    self.gemPos = cell:getEffectPosition()
    _parent = self.ui:getParent()
    local rootPos = _parent:convertToWorldSpaceAR(self.ui:getPosition())
    self.gemPos.x = self.gemPos.x - rootPos.x
    self.gemPos.y = self.gemPos.y - rootPos.y
    self:updateSelectCell()

    self:select(cell.id)
end

function InsetMiYaoListLayer:choiceGemActionPlay(pic,path,pos,index)
    play_hechengbaoshiqianru()
    pic:setPosition(pos)
    local newPos = self.info_panel.gem_table[index]:getParent():convertToWorldSpaceAR(self.info_panel.gem_table[index]:getPosition())
    local _parent = self.ui:getParent()
    local rootPos = _parent:convertToWorldSpaceAR(self.ui:getPosition())
    --print("new world pos : ",newPos,index,self.ui:getPosition())
    newPos.x = newPos.x - rootPos.x
    newPos.y = newPos.y - rootPos.y
    local tween = {
        target = pic,
            {
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                duration = 0.3,
                x = newPos.x,
                y = newPos.y,
                onComplete = function ()
                    self:playEffect(newPos.x,newPos.y)
                    self.info_panel.gem_table[index]:setVisible(true)
                    self.info_panel.gem_table[index]:setTexture(path)
                    local bagitem = BagManager:getItemById(self.selectId)
                    if bagitem then
                        -- self.txt_gemnum[index]:setVisible(true)
                        -- self.txt_gemnum[index]:setText(bagitem.num)
                    end
                    if index == 4 or bagitem == nil or bagitem.num == index then
                        self:refreshTargetGem()
                        pic:removeFromParentAndCleanup(true)
                        pic = nil         
                        self.actionpaly = false
                    else
                        self:choiceGemActionPlay(pic,path,pos,(index+1))
                    end     
                end,
            },
    }
    TFDirector:toTween(tween)
end

function InsetMiYaoListLayer:playEffect(x,y)
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/gem_click.xml")
    local effect = TFArmature:create("gem_click_anim")
    if effect == nil then
        return
    end

    effect:setZOrder(100)
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)

    effect:setPosition(ccp(x, y))

    self.ui:addChild(effect)
    effect:addMEListener(TFARMATURE_COMPLETE,
    function()
        self.ui:removeChild(effect)
    end)
end

function InsetMiYaoListLayer:registerEvents()
	self.super.registerEvents(self)

    self.btn_Inset.logic     = self
    self.btn_unload.logic    = self
    self.btn_unload.type     = 1
    self.btn_Inset:addMEListener(TFWIDGET_CLICK, audioClickfun(self.insetClick))
    self.btn_unload:addMEListener(TFWIDGET_CLICK, audioClickfun(self.insetClick))
    self.insetCallBack = function(event)
        if self.insertType ~= 0 and self.insertType ~= event.data[1].insertType then
            return
        end
        if event.data[1].insertType == 1 then
            play_xiangqian()
            self:mosaicAction(self.selectId,self.gemPos)
        elseif event.data[1].insertType == 2 then
            local bibleKeyId = event.data[1].bibleKeyId
            self:unMosaicAction(bibleKeyId)
            self:refreshUI()
            self.insertType = 0
        end
    end

    TFDirector:addMEGlobalListener(SkyBookManager.UpdateInsetMsg, self.insetCallBack) 
end


function InsetMiYaoListLayer.insetClick(sender)
    local self = sender.logic
    if self.insertType ~= 0 then
        self:refreshUI()
        self.insertType = 0
        --return
    end
    if (sender.type == 1) then
        self.insertType = 2
        SkyBookManager:requestBibleUnloadMiYao(self.bibleId)
    else
        -- local bagitem = BagManager:getItemById(self.selectId)
        local itemInfo = BagManager:getMiYaoByType(nil, self.selectId)
        if (itemInfo) then
            self.insertType = 1
            print(self.selectId,' ---',itemInfo.instanceId)
            
            SkyBookManager:requestBibleInsetMiYao(self.bibleId, itemInfo.instanceId)
        else
            toastMessage(localizable.Tianshu_MiYai_Tips2)
        end
    end
    
    -- TFDirector:removeMEGlobalListener(BagManager.ItemChange,self.itemNumberChangedCallBack)
end


function InsetMiYaoListLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(SkyBookManager.UpdateInsetMsg,self.insetCallBack)
    self.insetCallBack = nil
    if (self.insetMiYaoLayer) then
        self.insetMiYaoLayer:removeEvents()
    end
end


return InsetMiYaoListLayer;
