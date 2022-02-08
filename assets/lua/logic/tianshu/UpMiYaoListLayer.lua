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

local UpMiYaoListLayer = class("UpMiYaoListLayer", BaseLayer)

local columnNumber = 4

function UpMiYaoListLayer:ctor(bibleId)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.tianshu.MiYaoShengJie2")
end

function UpMiYaoListLayer:initUI(ui)
	self.super.initUI(self,ui)

    -- --左侧详情
    self.scroll_left            = TFDirector:getChildByPath(ui, 'scroll_left')
    self.panel_xiaohao          = TFDirector:getChildByPath(ui, 'panel_xiaohao')
    self.panel_list             = TFDirector:getChildByPath(ui, 'panel_table')
    self.btn_shengjie           = TFDirector:getChildByPath(ui, 'btn_shengjie')
    self.txt_xiaohao            = TFDirector:getChildByPath(ui, 'txt_xiaohao')
    
    self.insetMiYaoLayer = createUIByLuaNew("lua.uiconfig_mango_new.tianshu.MiYaoShengJie")
    self.scroll_left:addChild(self.insetMiYaoLayer)

    self.miYaoId = 0
    self:initTableview()
end

function UpMiYaoListLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function UpMiYaoListLayer:refreshUI(isSetId)
    self:updateTableSource()
    if (self.tableView) then
        self.tableView:reloadData()
        if (isSetId == nil) then
            self:selectDefault()
        end
    end
    self:refreshLeftUI()
end

--消耗品 gmInfo nil 没有消耗数据
function UpMiYaoListLayer:refreshCostUI(gmInfo)
    self.costInfo = nil
    self.panel_xiaohao:setVisible(false)
    self.txt_xiaohao:setVisible(false)
    self.panel_xiaohao:removeAllChildren()
    if (gmInfo == nil) then
        return
    end
    local bibiData = BibleKeyQualityData:GetKeyInfoById(gmInfo.id, gmInfo.level)
    if (bibiData) then
        self.panel_xiaohao:setVisible(true)
        self.txt_xiaohao:setVisible(true)
        local str               = string.split(bibiData.consume, "_")
        local rewardData = {}
        rewardData.type            = tonumber(str[1])
        rewardData.itemid          = tonumber(str[2])
        rewardData.number          = tonumber(str[3])

        local icon = require('lua.logic.role_new.RoleStarUpPreviewNumCell'):new()
        icon:setPosition(ccp(9, 0))
        local curr_num = 0
        if rewardData.type == 1 then
            curr_num = BagManager:getItemNumById( rewardData.itemid )
        else
            curr_num = MainPlayer:getResValueByType(rewardData.type)
        end

        icon:setData(rewardData.itemid,curr_num,rewardData.number,rewardData.type)
        self.panel_xiaohao:addChild(icon)
        local rewardInfo        = BaseDataManager:getReward(rewardData)
        if (rewardInfo) then
            self.costInfo           = {}
            self.costInfo.type      = rewardInfo.type
            self.costInfo.itemid    = rewardInfo.itemid
            self.costInfo.number    = rewardInfo.number
            self.costInfo.name      = rewardInfo.name
            self.costInfo.haveNum   = curr_num
        end
    end
    
end

--左边显示
function UpMiYaoListLayer:refreshLeftUI()
    local gmInfo        = SkyBookManager:getMiYaoById(self.selectId)
    local img_gem       = TFDirector:getChildByPath(self.insetMiYaoLayer, 'img_gem')
    local panel_total   = TFDirector:getChildByPath(self.insetMiYaoLayer, 'panel_total')
    local panel_details = TFDirector:getChildByPath(self.insetMiYaoLayer, 'panel_details')
    local txt_name      = TFDirector:getChildByPath(self.insetMiYaoLayer, 'txt_name')
    panel_total:setVisible(false)
    if (gmInfo == nil or (gmInfo and gmInfo.itemdata == nil)) then
        img_gem:setVisible(false)
        -- panel_total:setVisible(false)
        panel_details:setVisible(false)
        txt_name:setVisible(false)
        self:refreshCostUI(gmInfo)
        return
    end
    img_gem:setVisible(true)
    -- panel_total:setVisible(true)
    panel_details:setVisible(true)
    txt_name:setVisible(true)
    local itemData = ItemData:objectByID(gmInfo.itemdata.id)
    if (itemData) then
        img_gem:setTexture(itemData:GetPath())
        img_gem:setVisible(true)
    else
        img_gem:setVisible(false)
    end
    --
    local txt_jie1          = TFDirector:getChildByPath(self.insetMiYaoLayer, 'txt_jie1')
    local txt_jie2          = TFDirector:getChildByPath(self.insetMiYaoLayer, 'txt_jie2')
    local txt_attr_miyao1   = TFDirector:getChildByPath(txt_jie1, 'txt_attr_miyao')
    local Img_to            = TFDirector:getChildByPath(self.insetMiYaoLayer, 'Img_to')
    txt_jie1:setText(stringUtils.format(localizable.Tianshu_MiYai_Tips1, numberToChinese(gmInfo.level)))
    self:skillText(gmInfo.id, gmInfo.level, txt_attr_miyao1)
    txt_name:setText(gmInfo.itemdata.name)
    if (gmInfo.level + 1 > SkyBookManager.MaxMiYaoLevel) then
        txt_jie2:setVisible(false)
        Img_to:setVisible(false)
        self.btn_shengjie:setVisible(false)
        self:refreshCostUI(nil)
        return
    else
        self.btn_shengjie:setVisible(true)
        local txt_attr_miyao2   = TFDirector:getChildByPath(txt_jie2, 'txt_attr_miyao')
        Img_to:setVisible(true)
        txt_jie2:setVisible(true)
        txt_jie2:setText(stringUtils.format(localizable.Tianshu_MiYai_Tips1, numberToChinese(gmInfo.level + 1)))
        self:skillText(gmInfo.id, gmInfo.level + 1, txt_attr_miyao2)
    end
    
    self:refreshCostUI(gmInfo)
end

function UpMiYaoListLayer:skillText(bibleId, level, txt)
    local bibiData = BibleKeyQualityData:GetKeyInfoById(bibleId, level)
    if (bibiData) then
        local skillInfo = SkillBaseData:objectByID(bibiData.spell_id)
        if (skillInfo) then
            local spellLevelInfo    = skillInfo:GetLevelItem(0)
            local richText_1        = TFRichText:create(txt:getSize())
            richText_1:setPositionY(55)
            richText_1:setAnchorPoint(txt:getAnchorPoint())
            txt:removeAllChildren()
            txt:addChild(richText_1)
            txt:setText("")
            local str = skillInfo:getTichTextDes(spellLevelInfo, spellLevelInfo.skill_add,true)
            richText_1:setText(str)
        end
    end
end
--
function UpMiYaoListLayer:setBibleGmId(bibleId)
    -- self.bibleId   = bibleId
    self:refreshUI()
end

--
function UpMiYaoListLayer:setMiYaoGmId(miYaoId)
    self.selectId   = miYaoId
    self:refreshUI()
end

function UpMiYaoListLayer:dispose()

end

function UpMiYaoListLayer:removeUI()
	self.super.removeUI(self)
end


--销毁所有TableView的Cell中的Panel
function UpMiYaoListLayer:disposeAllPanels()
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
function UpMiYaoListLayer:updateTableSource()
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
    if (self.selectId == nil) then
        if self.gemlist and self.gemlist:length() > 0 then
            self:select(self.gemlist:objectAt(1).instanceId)
        end
    end
end

--[[
    全部cell都重置为未选中
]]
function UpMiYaoListLayer:unselectedAllCellPanels()
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

function UpMiYaoListLayer:updateSelectCell()
    if self.allPanels == nil then
        return
    end

    for r=1,#self.allPanels do
        local panel = self.allPanels[r]
        panel:refreshUI()
    end
end

function UpMiYaoListLayer:selectDefault()
    if self.allPanels == nil then
        self.selectId = nil
        return
    end

    if self.gemlist and self.gemlist:length() > 0 then
        self:select(self.gemlist:objectAt(1).instanceId)
    else
        self.selectId = nil
    end
end

--[[
    选中
]]
function UpMiYaoListLayer:select(id)
    --选中的Cell如果重复选中则不处理
    if self.selectId then
        if self.selectId == id then
            self:refreshLeftUI()
            return
        end
    end
    
    self.selectId = id
    self:updateSelectCell()

    self:refreshLeftUI()
    -- self:setData(item)
end

function UpMiYaoListLayer.cellSizeForTable(table,idx)    
    return 200,540
end

function UpMiYaoListLayer.tableCellAtIndex(table, idx)
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

function UpMiYaoListLayer:showOneKeyEffect( level )
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

function UpMiYaoListLayer.numberOfCellsInTableView(table)
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

function UpMiYaoListLayer:initTableview()
    self:updateTableSource()
    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.panel_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    self.tableView = tableView
    self.tableView:setZOrder(10)
    self.tableView.logic = self
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, UpMiYaoListLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, UpMiYaoListLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, UpMiYaoListLayer.numberOfCellsInTableView)

    self.panel_list:addChild(tableView)
end

function UpMiYaoListLayer.gemBuildBtnClickHandle(btn)
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

function UpMiYaoListLayer:iconBtnClick(cell)
    
	play_xuanze();

    self:select(cell.id)
    -- self.actionpaly = true
    -- self:choiceGemAction(cell)
    -- self:refreshBtnCost()
    -- self:refreshButtonState()
end

function UpMiYaoListLayer:registerEvents()
	self.super.registerEvents(self)

    -- self.btn_Inset.logic     = self
    self.btn_shengjie.logic    = self
    self.btn_shengjie:addMEListener(TFWIDGET_CLICK, audioClickfun(self.upClick))
    -- self.btn_unload:addMEListener(TFWIDGET_CLICK, audioClickfun(self.insetClick))
    self.upCallBack = function(event)
        self:refreshUI(true)
        self:addResultEffect()
    end

    TFDirector:addMEGlobalListener(SkyBookManager.UpdateUpMsg, self.upCallBack) 
end


function UpMiYaoListLayer.upClick(sender)
    local self = sender.logic
    if (self.selectId and self.selectId ~= 0) then
        if (self.costInfo) then
            if (self.costInfo.haveNum >= self.costInfo.number) then
                SkyBookManager:requestBibleUpMiYao(self.selectId)
            else
                toastMessage(stringUtils.format(localizable.Guild_Dedication_Tool_Not, self.costInfo.name))
            end
        end
    else
        toastMessage(localizable.Tianshu_MiYai_Tips3)
    end
end


function UpMiYaoListLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(SkyBookManager.UpdateUpMsg,self.upCallBack)
    self.upCallBack = nil
end

--
function UpMiYaoListLayer:addResultEffect() 
    if self.rightEffect then
        self.rightEffect:removeMEListener(TFARMATURE_COMPLETE)
        self.rightEffect:removeFromParent()
        self.rightEffect = nil
    end
    --
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equipment_refining.xml")
    local effect = TFArmature:create("equipment_refining_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    self.insetMiYaoLayer:addChild(effect)
    effect:setPosition(ccp(160,130))
    effect:setScaleX(0.8)
    effect:setScaleY(1.4)
    effect:setZOrder(100)
    self.rightEffect = effect
    self.rightEffect:playByIndex(0, -1, -1, 0)

    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeFromParent()
        self.rightEffect = nil
    end)  
end

return UpMiYaoListLayer;
