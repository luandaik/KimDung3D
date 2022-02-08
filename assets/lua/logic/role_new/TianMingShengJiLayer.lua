-- client side TianMingShengJiLayer.lua
--[[
 * @Description: 天命升级界面
 ]]
-- script writer chikui
-- creation time 2016-05-26
local GameAttributeData = require('lua.gamedata.base.GameAttributeData')
local TianMingShengJiLayer = class("TianMingShengJiLayer", BaseLayer)
local EffectExtraData = clone(EffectExtraDataModel)
local columnNumber = 4
function TianMingShengJiLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.role_new.TianMingShengJi")
end

function TianMingShengJiLayer:initUI(ui)
	self.super.initUI(self,ui)
    self.btn_sj                     = TFDirector:getChildByPath(ui, 'btn_sj')
    self.btn_yjsj                   = TFDirector:getChildByPath(ui, 'btn_yjsj')
    self.panel_kong                 = TFDirector:getChildByPath(ui, 'panel_kong')
    self.txt_name                   = TFDirector:getChildByPath(self.panel_kong, 'txt_name')
    self.img_kong                   = TFDirector:getChildByPath(self.panel_kong, 'img_kong')
    self.img_pz                     = TFDirector:getChildByPath(self.img_kong, 'img_pz')
    self.img_tm                     = TFDirector:getChildByPath(self.img_kong, 'img_tm')
    --镶星
    self.panel_star                 = TFDirector:getChildByPath(self.panel_kong, 'panel_star')
    self.panel_star:setVisible(false)
    self.txt_starlv                 = TFDirector:getChildByPath(self.panel_star, 'txt_starlv')

    self.img_dengji                 = TFDirector:getChildByPath(ui, 'img_dengji')
    self.img_dengji.img_to          = TFDirector:getChildByPath(self.img_dengji, 'img_to')
    self.img_dengji.txt_current_lv  = TFDirector:getChildByPath(self.img_dengji, 'txt_current_lv')
    self.img_dengji.txt_next_lv     = TFDirector:getChildByPath(self.img_dengji, 'txt_next_lv')

    self.bar_percent        = TFDirector:getChildByPath(ui, 'bar_percent')
    self.bar_percent2       = TFDirector:getChildByPath(ui, 'bar_percent2')
    self.bar_percent2:setPercent(0)
    self.txt_exp            = TFDirector:getChildByPath(ui, 'txt_exp')
    self.sxLayer = {}
    local panel_sx          = TFDirector:getChildByPath(ui, 'panel_kongsx')
    for i = 1,6 do
        local img_sx         = TFDirector:getChildByPath(panel_sx, 'img_sx'..i)
        img_sx.img_to       = TFDirector:getChildByPath(img_sx, 'img_to')
        img_sx.txt_curlv    = TFDirector:getChildByPath(img_sx, 'txt_current_lv')
        img_sx.txt_nextlv   = TFDirector:getChildByPath(img_sx, 'txt_next_lv')
        img_sx.txt_name     = TFDirector:getChildByPath(img_sx, 'txt_name')
        img_sx.txt_numLv_effect = TFDirector:getChildByPath(img_sx, 'txt_numLv_effect')
        img_sx.txt_numLv_effect:setVisible(false)
        self.sxLayer[i]     = img_sx
        self.sxLayer[i]:setVisible(false) 
    end 
    self.cellModel = createUIByLuaNew("lua.uiconfig_mango_new.role_new.TianMingXiangQianCell")
    self.cellModel:setScale(0.85)
    self.cellModel:retain()

    self.panel_huadong = TFDirector:getChildByPath(ui, 'panel_huadong')
    self.closetianminglist = {}
    self.TianmingList = TFArray:new() 
    self.Explist = {}
    self.MaxTianmingnum = ConstantData:objectByID("Destinygrade").value
    self.expnum = 0
    self.oldlevel = -1
    self.level  = 0
    self.playeffect = false
    self.quality = 2
end
function TianMingShengJiLayer:setTianMingData(gmId)
    self.instanceId = gmId
end
function TianMingShengJiLayer:loadData(instanceId)
    self.instanceId = instanceId
end
function TianMingShengJiLayer:onShow()
    self.super.onShow(self)
    self:getTianMingList()
    self:refreshUI() 
end

function TianMingShengJiLayer:dispose()
    self.super.dispose(self)
end

function TianMingShengJiLayer:getTianMingList()
    local list = TianMingManager.TianMingList
    local i = 1
    self.Explist = {}
    self.TianmingList = TFArray:new()
    for info in list:iterator() do
        if info.instanceId ~= self.instanceId and info.equip == 0 then
           self.TianmingList:push(info)
           local list1 = {}
           list1.type = false
           list1.gmId = 0
           list1.quality = 0
           list1.price = 0
           list1.exp = 0
           self.Explist[i] = list1
           i = i + 1 
        end
    end
    table.sort(self.TianmingList.m_list,function (a,b)
        if a.config.special_equipment == b.config.special_equipment then
            return a.quality < b.quality
        end
        return a.config.special_equipment > b.config.special_equipment  
    end)
end
function TianMingShengJiLayer:refreshUI()
    local tianming = TianMingManager:getTianMingByGmId(self.instanceId)
    if tianming then
        self.txt_name:setText(tianming.config.name)
        self.img_pz:setTexture(GetColorRoadIconByQuality(tianming.quality))
        self.img_dengji.txt_current_lv:setText(tianming.level)
        self.img_dengji.img_to:setVisible(false)
        self.img_dengji.txt_next_lv:setVisible(false)
        self.panel_star:setVisible(false) 
        self.quality = tianming.quality
        if tianming.level < self.MaxTianmingnum then
            self.img_dengji.txt_next_lv:setText(tianming.level + 1)
            self.img_dengji.img_to:setVisible(true)
            self.img_dengji.txt_next_lv:setVisible(true)
        end 
        self.img_tm:setTexture(tianming.config:GetPath())

        --镶星
        if tianming.starLevel > 0 or tianming.starnum > 0 then
            self.panel_star:setVisible(true)
            self.txt_starlv:setText(tianming.starnum)
        end

        if self.MaxTianmingnum > tianming.level then 
            self.expNextnum = DesTinyExpData:getExpBylevelandQuality(tianming.level,tianming.quality)
        else
            self.expNextnum = DesTinyExpData:getExpBylevelandQuality(self.MaxTianmingnum-1,tianming.quality)
        end 
        self.expnum = tianming.exp
        self.level = tianming.level
        if self.oldlevel == -1 then 
            self.oldlevel = tianming.level
        end
        self.bar_percent:setPercent(self.expnum/self.expNextnum*100)
        self.txt_exp:setText(tianming.exp.."/"..self.expNextnum)
        local nextotalAttribute = EffectExtraData:new()
        local ir_tbl0,ea_tbl0,ep_tbl0,power = DesTinyData:getTianMingAttrByTypeAndQualityLevel(tianming.config.kind,tianming.quality,tianming.level+1)
        nextotalAttribute:add(ir_tbl0)
        nextotalAttribute:add(ea_tbl0)
        nextotalAttribute:add(ep_tbl0)
        local attribute1 = tianming.totalAttribute.attribute
        local nextattribute1 = nextotalAttribute.attribute
        for i=1,6 do
            self.sxLayer[i]:setVisible(false)
        end
        local attribute = {}
        local nextattribute = {}
        for k,v in pairs(attribute1) do
            table.insert(attribute,{id = k,vaule = v})
        end
        for k,v in pairs(nextattribute1) do
            table.insert(nextattribute,{id = k,vaule = v})
        end
        table.sort(attribute,function (a,b)
             return a.id < b.id
        end)
        table.sort(nextattribute,function (a,b)
             return a.id < b.id
        end)
        local i = 1
        for k,v in pairs(attribute) do
            if i <= 6 then
                self.sxLayer[i]:setVisible(true)
                if v.id == 44 or v.id == 41 or v.id == 42 or v.id == 40 then 
                    if v.vaule < 0 then
                        self.sxLayer[i].txt_name:setText(localizable.TianMingAttributeTypeStr[v.id]..localizable.TianMing_tips10)
                        self.sxLayer[i].txt_curlv:setText("+"..math.abs(v.vaule/100) .."%")
                    else
                        self.sxLayer[i].txt_name:setText(localizable.TianMingAttributeTypeStr[v.id]..localizable.TianMing_tips9)
                        self.sxLayer[i].txt_curlv:setText("+"..v.vaule/100 .."%")
                    end
                else
                    self.sxLayer[i].txt_name:setText(localizable.TianMingAttributeTypeStr[v.id])
                    if v.id <= 15 then
                        self.sxLayer[i].txt_curlv:setText("+"..v.vaule)
                    else
                        self.sxLayer[i].txt_curlv:setText("+"..v.vaule/100 .."%")
                    end
                end
                i = i + 1    
            end
        end
        i = 1
        if next(nextattribute) ~= nil then
            for k,v in pairs(nextattribute) do
                if i <= 6 then
                    self.sxLayer[i].txt_nextlv:setVisible(false)
                    self.sxLayer[i].img_to:setVisible(false)
                    if tianming.level < self.MaxTianmingnum then
                        self.sxLayer[i].img_to:setVisible(true)
                        self.sxLayer[i].txt_nextlv:setVisible(true)
                        if v.id <= 15 then
                            self.sxLayer[i].txt_nextlv:setText("+"..math.ceil(v.vaule*(1 + tianming.starPercent/10000)))
                        else
                            self.sxLayer[i].txt_nextlv:setText("+"..math.abs(math.ceil(v.vaule*(1 + tianming.starPercent/10000)/100)) .."%")
                        end
                    end
                    i = i + 1
                end
            end
        else
            for i =1 ,6 do
                self.sxLayer[i].txt_nextlv:setVisible(false)
                self.sxLayer[i].img_to:setVisible(false)
            end
        end
        if self.playeffect == true then
            self.playeffect = false
            self:PlayerEffect()
        end
    end
    self:initTableView()
end
function TianMingShengJiLayer:refreshPercent2()
    local nextExpnum = self.expnum
    self.bar_percent2:setVisible(true)
    for i=1, #self.Explist do
        if self.Explist[i].type == true and self.Explist[i].gmId ~= 0 then
            nextExpnum = self.Explist[i].price + self.Explist[i].exp + nextExpnum
        end
    end
    local nextlevel = DesTinyExpData:getLevelByExpandQuality(nextExpnum,self.quality)
    if nextlevel < self.level then
        nextlevel = self.level 
    end
    self.img_dengji.txt_next_lv:setText(nextlevel)
    self.txt_exp:setText(nextExpnum.."/"..self.expNextnum)
    self.bar_percent2:setPercent(nextExpnum/self.expNextnum*100)
end

function TianMingShengJiLayer:PlayerEffect()
    if self.oldlevel ~= self.level then
        if not self.img_dengji_effect then
            TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
            local effect = TFArmature:create("equipIntensify_3_anim")
            effect:setAnimationFps(GameConfig.ANIM_FPS)
            local img_intensify_lv = self.img_dengji
            effect:setPosition(ccp(148, -56))
            img_intensify_lv:addChild(effect)
            self.img_dengji_effect = effect
        end 
        self.img_dengji_effect:playByIndex(0, -1, -1, 0) 
        self.shuaguang_effect = self.shuaguang_effect or {}
        for i = 1, #self.sxLayer do
            if not self.shuaguang_effect[i] then
                TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
                local effect = TFArmature:create("equipIntensify_3_anim")
                effect:setAnimationFps(GameConfig.ANIM_FPS)
               
                local img_intensify_lv = self.sxLayer[i]
                effect:setPosition(ccp(70, -60))
                img_intensify_lv:addChild(effect)
                self.shuaguang_effect[i] = effect
            end  
            self.shuaguang_effect[i]:playByIndex(0, -1, -1, 0)
        end
        if self.equipEffect == nil then
          TFResourceHelper:instance():addArmatureFromJsonFile("effect/equiIntensify.xml")
          local effect = TFArmature:create("equiIntensify_anim")
          effect:setAnimationFps(GameConfig.ANIM_FPS)
          effect:setScale(1.3)
          local img_icon = self.img_tm
          effect:setPosition(ccp(440,-48))
          effect:setZOrder(100)
          img_icon:addChild(effect)
          self.equipEffect = effect
        end
        self.equipEffect:playByIndex(0, -1, -1, 0)
        self.oldlevel = self.level
    end
    if not self.bar_percent_effect then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
        local effect = TFArmature:create("equipIntensify_3_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)

        local img_intensify_lv = self.bar_percent
        effect:setPosition(ccp(-190, -56))
        img_intensify_lv:addChild(effect)
        self.bar_percent_effect = effect
        
    end
    self.bar_percent_effect:playByIndex(0, -1, -1, 0)     
end
--初始化TableView
function TianMingShengJiLayer:initTableView()
    if  self.tableView == nil then 
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_huadong:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(0)
        tableView:setPosition(self.panel_huadong:getPosition())
        self.tableView = tableView
        self.tableView.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, TianMingShengJiLayer.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, TianMingShengJiLayer.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, TianMingShengJiLayer.numberOfCellsInTableView)
        self.panel_huadong:getParent():addChild(self.tableView,1)
    end
    self.tableView:reloadData()
end
function TianMingShengJiLayer.cellSizeForTable(table,cell)
    return 160,450
end

function TianMingShengJiLayer.tableCellAtIndex(table,idx)
    local self = table.logic
    local cell = table:dequeueCell()
    self.allPanels = self.allPanels or {}

    if cell == nil then
        cell = TFTableViewCell:create()
        local newIndex = #self.allPanels + 1
        self.allPanels[newIndex] = cell

        for i=1,columnNumber do
            local panel = self.cellModel:clone()
            panel:setPosition(ccp(20 + 120 * (i - 1) ,10))
            cell:addChild(panel)
            panel:setTag(i)
        end
    end
    for i=1,columnNumber do
        local panel = cell:getChildByTag(i)
        self:cellInfoSet(panel, idx*columnNumber+i)
    end

    return cell
end
function TianMingShengJiLayer:cellInfoSet( panel, idx )
    panel.boundData         = false
    panel.panelEmpty        = TFDirector:getChildByPath(panel, "panel_empty")
    panel.panelInfo         = TFDirector:getChildByPath(panel, "panel_info")
    panel.img_pinzhiditu    = TFDirector:getChildByPath(panel, "img_back")
    panel.img_icon          = TFDirector:getChildByPath(panel, "img_icon")
    panel.img_soul1         = TFDirector:getChildByPath(panel, "img_soul1")
    panel.txt_lv            = TFDirector:getChildByPath(panel, "txt_lv")
    panel.txt_name          = TFDirector:getChildByPath(panel, "txt_name")
    panel.img_quality       = TFDirector:getChildByPath(panel, "img_quality")
    panel.img_selected_fg   = TFDirector:getChildByPath(panel, "img_selected_fg")
    panel.img_black         = TFDirector:getChildByPath(panel, "img_black")
    panel.img_xuanzhong     = TFDirector:getChildByPath(panel, "img_xuanzhong")
    panel.img_jingyan       = TFDirector:getChildByPath(panel, "img_jingyan")
    panel.txt_num           = TFDirector:getChildByPath(panel.img_jingyan, "txt_num")
    panel.panel_star        = TFDirector:getChildByPath(panel, "panel_star")
    panel.txt_starlv        = TFDirector:getChildByPath(panel.panel_star, "txt_starlv")
    panel.panel_star:setVisible(false)
    panel.img_selected_fg:setVisible(false)
    panel.img_xuanzhong:setVisible(false)
    panel.img_black:setVisible(false)
    panel.img_icon.idx = idx
    panel.img_icon:setTouchEnabled(true)
    panel.img_icon:addMEListener(TFWIDGET_CLICK, 
    audioClickfun(function()   
        if self.level < self.MaxTianmingnum then
            if panel.boundData == true then
                panel.boundData = false
                panel.img_xuanzhong:setVisible(false)
                self.Explist[idx].type = false
                self:refreshPercent2()
            elseif panel.boundData == false then
                panel.boundData = true
                panel.img_xuanzhong:setVisible(true)
                self.Explist[idx].type = true
                self:refreshPercent2()
            end
        else
            toastMessage(localizable.TianMing_tips2)
        end
        end))
    panel.img_icon.logic = self

    if self.Explist[idx] and self.Explist[idx].type and self.Explist[idx].type == true then
        panel.img_xuanzhong:setVisible(true)
    end
    local roleItem = self.TianmingList:objectAt(idx);
    if roleItem then
        panel.panelEmpty:setVisible(true)
        panel.panelInfo:setVisible(true)
        if roleItem.level < 1 then
            panel.img_soul1:setVisible(false)
        else
            panel.img_soul1:setVisible(true)
        end
        panel.txt_lv:setText(roleItem.level)
        panel.img_icon:setTexture(roleItem.config:GetPath())
        panel.txt_num:setText("+"..roleItem.config.price + roleItem.exp)
        panel.img_quality:setTexture(GetColorIconByQuality(roleItem.quality))
        self.Explist[idx].gmId    = roleItem.instanceId
        self.Explist[idx].quality = roleItem.quality
        self.Explist[idx].price = roleItem.config.price
        self.Explist[idx].exp = roleItem.exp
        panel.txt_name:setText(roleItem.config.name)

        if roleItem.starnum > 0 or roleItem.starLevel > 0  then
            panel.panel_star:setVisible(true)
            panel.txt_starlv:setText(roleItem.starnum)
        end
    
    else
        panel.panelEmpty:setVisible(true)
        panel.panelInfo:setVisible(false)
    end
end
function TianMingShengJiLayer.numberOfCellsInTableView(table,cell)
    local self = table.logic
    if self.TianmingList == nil then
        return 0
    end
    return math.ceil(self.TianmingList:length()/columnNumber)
end
function TianMingShengJiLayer:registerEvents()
    self.super.registerEvents(self)
    self.btn_sj.logic = self
    self.btn_sj:addMEListener(TFWIDGET_CLICK, audioClickfun(self.ShengjiButtonClick))
    self.btn_yjsj.logic = self
    self.btn_yjsj:addMEListener(TFWIDGET_CLICK, audioClickfun(self.YiJiangShengjiButtonClick))
    self.updataTianMingList = function(event)
        self:getTianMingList()
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(TianMingManager.RefreshTianMingList, self.updataTianMingList)

    self.refreshPlayEffect = function(event)
        self.playeffect = true
        self.bar_percent2:setVisible(false)
    end
    TFDirector:addMEGlobalListener(TianMingManager.REPONSE_BREACH_DESTINY,self.refreshPlayEffect)
end
function TianMingShengJiLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(TianMingManager.RefreshTianMingList, self.updataTianMingList)
    self.refreshTianMingList = nil
    TFDirector:removeMEGlobalListener(TianMingManager.REPONSE_BREACH_DESTINY,self.refreshPlayEffect)
    self.refreshPlayEffect = nil
end
function TianMingShengJiLayer:dispose()
    self.super.dispose(self)
    TFDirector:unRequire('lua.gamedata.base.GameAttributeData')
end
function TianMingShengJiLayer.ShengjiButtonClick(sender)
    local self = sender.logic 
    local list = {}
    local open = false
    for i=1, #self.Explist do
        if self.Explist[i].type == true and self.Explist[i].gmId ~= 0 then
            table.insert(list,self.Explist[i].gmId)
            if self.Explist[i].quality > 3 then
                open = true
            end
        end
    end
    if next(list) == nil then
        toastMessage(localizable.TianMing_tips3)
        return
    end
    if open == true then
        local msg = localizable.TianMing_tips1--"所选天命中包含紫色及以上品质，是否确认吞噬？"
        CommonManager:showOperateSureLayer(function()
            TianMingManager:sendBreachDestiny(self.instanceId,list)
        end,
        nil,
        {
            msg = msg,
        })
        return true
    else
        TianMingManager:sendBreachDestiny(self.instanceId,list)
    end
end
function TianMingShengJiLayer.YiJiangShengjiButtonClick(sender)
    local self = sender.logic
    CommonManager:showOperateSureTipRefreshLayer(
      function(data,widget)
          TianMingManager:sendBreachAllDestiny(self.instanceId,self:getHasTip(widget)) 
      end,
      function()
          AlertManager:close()
      end,
      {
          msg = localizable.TianMing_tips8,
          msg2 = localizable.TianMing_tips12,
          choicetips = localizable.TianMing_tips13
      }
    )
end
function TianMingShengJiLayer:getHasTip( widget )
    local state = widget:getSelectedState();
    if state == true then
        return true
    else
        return false
    end
end
return TianMingShengJiLayer