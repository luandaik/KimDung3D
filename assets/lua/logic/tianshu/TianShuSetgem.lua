-- client side TianShuBaoShiLayer.lua
--[[
 * @Description: 天书宝石界面
 ]]
-- script writer wuqi
-- creation time 2016-07-02

local TianShuSetgem = class("TianShuSetgem", BaseLayer)

local columnNumber = 4

function TianShuSetgem:ctor(gmId, index)
    self.super.ctor(self, gmId)
    self.gmId = gmId
    self.selectId = nil
    self.gemPos = nil
    self.selectIndex = index
    self:init("lua.uiconfig_mango_new.tianshu.TianShuSetgem")
end

function TianShuSetgem:initUI(ui)
    self.super.initUI(self,ui)

    --左侧详情
    self.scroll_left = TFDirector:getChildByPath(ui, 'scroll_left')
    self.info_panel = require('lua.logic.tianshu.TianShuGemPanel'):new(self.selectIndex)
    self.scroll_left:addChild(self.info_panel)

    --右侧详情
    self.btn_mosaic = TFDirector:getChildByPath(ui, 'btn_mosaic')
    self.btn_mosaic.logic = self

        --右侧详情
    self.btn_xiexia = TFDirector:getChildByPath(ui, 'btn_xiexia')
    self.btn_xiexia.logic = self

    self.panel_list = TFDirector:getChildByPath(ui, 'gem_table')
    self.panel_content = TFDirector:getChildByPath(ui, "panel_content")
    self.txt_tips = TFDirector:getChildByPath(self.panel_content, "txt_tipss")
    self:initTableview()
    self:refreshGemTipsShow(self.selectIndex)
end

function TianShuSetgem:onShow()
    self.super.onShow(self)
    self:refreshUI()
    self.info_panel:onShow()
end

function TianShuSetgem:refreshUI()
    local bible = SkyBookManager:getItemByInstanceId(self.gmId)
    local item = BibleGemData:getItemByStarAndQuality(bible.tupoLevel, bible.quality)
    self.txt_tips:setText(item:getDesc())

    self:updateTableSource()
    self.info_panel:setEquipGmId(self.gmId)
    self.tableView:reloadData()
    self:updateButtonMosaicEnabled()
    self:updateUnMosaicButtonEnabled()
end

function TianShuSetgem:refreshGemTipsShow(index)
    if index and index == 2 then
        self.txt_tips:setVisible(false)
    else
        self.txt_tips:setVisible(true)
    end
end

function TianShuSetgem:dispose()
    self.info_panel:dispose()
    self:disposeAllPanels()
    self.super.dispose(self)
end

function TianShuSetgem:removeUI()
    self.super.removeUI(self)
end

--销毁所有TableView的Cell中的Panel
function TianShuSetgem:disposeAllPanels()
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

function TianShuSetgem:setEquipGmId(gmId)
    self.gmId = gmId
    self.selectId = nil
    self.gemPos = nil
    self:refreshUI()
end

function TianShuSetgem:updateInfo()
    self.info_panel:setEquipGmId(self.gmId)
end

function TianShuSetgem.cellSizeForTable(table,idx)
    return 200, 540
end

function TianShuSetgem.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    self.allPanels = self.allPanels or {}
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        for i = 1, columnNumber do
            local gem_panel = require('lua.logic.smithy.SmithyGemIcon'):new(2)
            gem_panel:setPosition(ccp(10+137*(i-1), 15))
            gem_panel:setLogic( self )
            cell:addChild(gem_panel)
            cell.gem_panel = cell.gem_panel or {}
            cell.gem_panel[i] = gem_panel
            local newIndex = #self.allPanels + 1
            self.allPanels[newIndex] = gem_panel
        end
    end
    for i=1,columnNumber do
        if (idx * columnNumber + i) <= self.gemlist:length() then
            local gem = self.gemlist:objectAt(idx * columnNumber + i)
            local valid = self:checkGemValid(gem.level)
            local bShowBlack = not valid
            if self.selectIndex and self.selectIndex == 2 then
                bShowBlack = false
            end
            cell.gem_panel[i]:setGemid(gem.id, bShowBlack)           
        else
            cell.gem_panel[i]:setGemid(nil)
        end
    end
    return cell
end

function TianShuSetgem:checkGemValid(gemLevel)
    local bible = SkyBookManager:getItemByInstanceId(self.gmId)
    local item = BibleGemData:getItemByStarAndQuality(bible.tupoLevel, bible.quality)
    local level = item:getGemMaxLevel()

    if gemLevel <= level then
        return true
    end
    return false
end

function TianShuSetgem.numberOfCellsInTableView(table)
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

function TianShuSetgem:initTableview()
    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.panel_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    self.tableView = tableView
    self.tableView:setZOrder(10)
    self.tableView.logic = self
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, TianShuSetgem.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, TianShuSetgem.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, TianShuSetgem.numberOfCellsInTableView)

    --self:updateTableSource()
    self.panel_list:addChild(tableView)
end

--[[
播放镶嵌宝石动画
]]
function TianShuSetgem:playEffect(x,y)
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

--[[
    镶嵌宝石
]]
function TianShuSetgem:mosaicAction(id,pos)
    local gem = ItemData:objectByID(id)
    if gem == nil  then
        return
    end
    local pic = TFImage:create()
    pic:setTexture(gem:GetPath())
    pic:setZOrder(100)
    pic:setPosition(pos)
    self.ui:addChild(pic)
    local GemPos = self.info_panel:getSelectPos()
    local _parent = self.info_panel.img_gem[GemPos]:getParent()
    local worldPos = _parent:convertToWorldSpaceAR(self.info_panel.img_gem[GemPos]:getPosition())
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
                    self:updateInfo()
                    self:showSuccessDialog()
                end,
            },
    }

    self:playEffect(pos.x,pos.y)
    TFDirector:toTween(tween)
end

--[[
    移除已经镶嵌的宝石
]]
function TianShuSetgem:unMosaicAction(id)
    local gem = ItemData:objectByID(id)
    if gem == nil  then
        return
    end
    local GemPos = self.info_panel:getSelectPos()
    local _parent = self.info_panel.img_gem[GemPos]:getParent()
    local pos = self.info_panel.img_gem[GemPos]:getPosition()
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

function TianShuSetgem.unGemMosaicBtnClickHandle(btn)
    local self = btn.logic

    local equip = SkyBookManager:getItemByInstanceId(self.gmId)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end

    if self then
        local pos = self.info_panel:getSelectPos()
        if equip:getGemPos(pos) then
            SkyBookManager:unmosaicGem(self.gmId, pos)
        else
            toastMessage(localizable.smithy_EquipGem_not_gem)
        end
    end
end

function TianShuSetgem.buttonMosaicClickHandle(btn)
    local self = btn.logic

    local equip = SkyBookManager:getItemByInstanceId(self.gmId)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end
    local gemId = self.selectId
    local stone = ItemData:objectByID(gemId)
    if stone == nil then
        return
    end
    local pos = self.info_panel:getSelectPos()
    print('pos = ',pos)
    if self.selectIndex and self.selectIndex == 1 then
        if SkyBookManager:isCanMosaicGem(equip, gemId) then
            SkyBookManager:mosaicGem(self.gmId, gemId, pos)
        else
            toastMessage(stringUtils.format(localizable.Tianshu_gem_not_ok))
        end
    else
        SkyBookManager:mosaicGem(self.gmId, gemId, pos)
    end
end

--[[
    更新TableView显示的内容
]]
function TianShuSetgem:updateTableSource()

    local gemlist = BagManager:getItemByType(EnumGameItemType.Gem)

    local bible = SkyBookManager:getItemByInstanceId(self.gmId)
    local function sortlist(src,target)
        if src.itemdata.level < target.itemdata.level then
            return false
        elseif src.itemdata.level == target.itemdata.level and src.itemdata.id < target.itemdata.id then
            return false
        else
            return true
        end
    end
    if self.selectIndex and self.selectIndex == 2 then
        self.gemlist = TFArray:new()
        for v in gemlist:iterator() do
            self.gemlist:push(v)
        end
        self.gemlist:sort(sortlist)
    else
        local item = BibleGemData:getItemByStarAndQuality(bible.tupoLevel, bible.quality)
        local level = item:getGemMaxLevel()

        self.gemlist = TFArray:new()
        local newList = TFArray:new()
        for v in gemlist:iterator() do
            if v.level <= level then
                self.gemlist:push(v)
            else
                newList:push(v)
            end
        end

        --当其他提交都相等时使用的最简单的比较方法
        

        self.gemlist:sort(sortlist)
        newList:sort(sortlist)

        for v in newList:iterator() do
            self.gemlist:push(v)
        end
    end

    if self.selectId ==nil and self.gemlist:length() > 0 then
        self.selectId = self.gemlist:objectAt(1).id
        print("self.selectId == ",self.selectId)
    end
end

--[[
    全部cell都重置为未选中
]]
function TianShuSetgem:unselectedAllCellPanels()
    if self.allPanels == nil then
        return
    end

    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        if self.selectId and panel.id == self.selectId then
            panel:setChoice(false)
        end
    end
end

function TianShuSetgem:updateSelectCell()
    if self.allPanels == nil then
        return
    end

    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        panel:refreshUI()
    end
end

function TianShuSetgem:updateUnMosaicButtonEnabled()
    local equip = SkyBookManager:getItemByInstanceId(self.gmId)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return
    end

    local pos = self.info_panel:getSelectPos()
    local existGemId = equip:getGemPos(pos)

    --卸除按钮是否可点击判定
    if existGemId and existGemId > 0 then
        self.btn_xiexia:setGrayEnabled(false)
        self.btn_xiexia:setTouchEnabled(true)
    else
        self.btn_xiexia:setGrayEnabled(true)
        self.btn_xiexia:setTouchEnabled(false)
    end
end

--[[
    更新镶嵌按钮状态
]]
function TianShuSetgem:updateButtonMosaicEnabled()
    self:refreshGemList()
    local equip = SkyBookManager:getItemByInstanceId(self.gmId)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end

    if self.selectId == nil then
        self.btn_mosaic:setTouchEnabled(false)
        self.btn_mosaic:setGrayEnabled(true)
        return
    end
    if self.gemPos == nil then
        self:iconBtnClick(self.allPanels[1])
    end
    local pos = self.info_panel:getSelectPos()
    local existGemId = equip:getGemPos(pos)
    if existGemId then
        if existGemId == self.selectId then
            self.btn_mosaic:setTouchEnabled(false)
            self.btn_mosaic:setGrayEnabled(true)
            return
        end
    end

    self.btn_mosaic:setTouchEnabled(true)
    self.btn_mosaic:setGrayEnabled(false)
end


function TianShuSetgem:iconBtnClick(cell)
    print("--------------iconBtnClick------------")
    play_xuanze();
    self.selectId  = cell.id
    self.gemPos = cell:getEffectPosition()
    _parent = self.ui:getParent()
    local rootPos = _parent:convertToWorldSpaceAR(self.ui:getPosition())
    self.gemPos.x = self.gemPos.x - rootPos.x
    self.gemPos.y = self.gemPos.y - rootPos.y
    self:updateSelectCell()
    --更新镶嵌按钮状态
    self:updateButtonMosaicEnabled()
    --PlayerGuideManager:showNextGuideStep()
end

function TianShuSetgem:registerEvents()
    self.super.registerEvents(self)

    self.btn_xiexia:addMEListener(TFWIDGET_CLICK, audioClickfun(self.unGemMosaicBtnClickHandle),1)
    
    self.btn_mosaic:addMEListener(TFWIDGET_CLICK, audioClickfun(self.buttonMosaicClickHandle),1)
    
    self.gemMosaicResuleCallBack = function(event)
        play_xiangqian()
        self:mosaicAction(self.selectId,self.gemPos)
        self:updateButtonMosaicEnabled()
        self:updateUnMosaicButtonEnabled()
    end
    TFDirector:addMEGlobalListener(SkyBookManager.GEM_MOSAIC_RESULT,self.gemMosaicResuleCallBack)

    
    self.gemUnMosaicResuleCallBack = function(event)
        local data = event.data[1]
        self:updateInfo()
        self:unMosaicAction(data.gemid)
        --toastMessage("宝石成功拆卸")
        self:updateButtonMosaicEnabled()
        self:updateUnMosaicButtonEnabled()
    end
    TFDirector:addMEGlobalListener(SkyBookManager.GEM_UN_MOSAIC_RESULT,self.gemUnMosaicResuleCallBack)
    

    self.itemAddCallBack = function (event)
        local holdGoods = event.data[1]
        if not holdGoods then
            return
        end
        if holdGoods.itemdata.type ==  EnumGameItemType.Gem then
            self:updateTableSource()
            self.tableView:reloadData()
        end
    end

    self.itemDeleteCallBack = function (event)
        local holdGoods = event.data[1]
        if not holdGoods then
            return
        end
        if holdGoods.itemdata.type ==  EnumGameItemType.Gem then
            self:updateTableSource()
            self.tableView:reloadData()
        end
    end
    TFDirector:addMEGlobalListener(BagManager.ItemAdd,self.itemAddCallBack)
    TFDirector:addMEGlobalListener(BagManager.ItemDel,self.itemDeleteCallBack)

    self.itemNumberChangedCallBack = function (event)
        local holdGoods = event.data[1].item
        if holdGoods.itemdata.type ~=  EnumGameItemType.Gem then
            return
        end
        self:updateTableSource()
        self.tableView:reloadData()
    end

    TFDirector:addMEGlobalListener(BagManager.ItemChange,self.itemNumberChangedCallBack)
 
    self.selectGemPosCallBack = function (event)
        local data = event.data[1][1] or 1
        self.selectIndex = data
        self:refreshGemTipsShow(data)

        self.selectId = nil
        self.gemPos = nil
        self:updateButtonMosaicEnabled()
        self:updateUnMosaicButtonEnabled()
        self:updateTableSource()
        if self.tableView then
            self.tableView:reloadData()
        end
    end
    TFDirector:addMEGlobalListener(SkyBookManager.SELECT_GEM_POS, self.selectGemPosCallBack)
end


function TianShuSetgem:removeEvents()
    self.super.removeEvents(self)
    
    TFDirector:removeMEGlobalListener(SkyBookManager.GEM_MOSAIC_RESULT,self.gemMosaicResuleCallBack)
    TFDirector:removeMEGlobalListener(SkyBookManager.GEM_UN_MOSAIC_RESULT,self.gemUnMosaicResuleCallBack)
    TFDirector:removeMEGlobalListener(BagManager.ItemAdd,self.itemAddCallBack)
    TFDirector:removeMEGlobalListener(BagManager.ItemDel,self.itemDeleteCallBack)
    TFDirector:removeMEGlobalListener(BagManager.ItemChange,self.itemNumberChangedCallBack)
    TFDirector:removeMEGlobalListener(SkyBookManager.SELECT_GEM_POS, self.selectGemPosCallBack)
    self.selectGemPosCallBack = nil

    self.btn_mosaic:removeMEListener(TFWIDGET_CLICK)
end

--显示升星成功对话框
function TianShuSetgem:showSuccessDialog()
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

--[[
验证点是否在TableView内部
]]
function TianShuSetgem:isTouchInTableView(position)
    local _parent = self.tableView:getParent()
    local rootPos = _parent:convertToWorldSpaceAR(self.tableView:getPosition())
    local size = self.tableView:getTableViewSize()
    if position.x > rootPos.x and position.x < rootPos.x+size.width 
        and position.y <rootPos.y + size.height and position.y > rootPos.y then
        return true
    end
    return false
end

function TianShuSetgem:refreshGemList( )
    self:updateTableSource()
    self.tableView:reloadData()
end

return TianShuSetgem