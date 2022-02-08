--[[
 * @Description: 心法凝练界面
 ]]
-- script writer fei
-- creation time 2017-10-20
local XinFaNingLianLayer = class("XinFaNingLianLayer", BaseLayer)

function XinFaNingLianLayer:ctor(gmId)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.xinfa.XinFaNingLian")
    self.gmId = gmId
end

function XinFaNingLianLayer:initUI( ui )
    self.super.initUI(self, ui)

    self.img_fz                 = TFDirector:getChildByPath(ui, "img_fz")
    self.img_quality            = TFDirector:getChildByPath(self.img_fz, "img_quality")
    self.img_icon               = TFDirector:getChildByPath(self.img_fz, "img_icon")
    self.txt_intensify_lv       = TFDirector:getChildByPath(self.img_fz, "txt_intensify_lv")
    self.txt_name               = TFDirector:getChildByPath(self.img_fz, "txt_name")
    self.img_equiped            = TFDirector:getChildByPath(self.img_fz, "img_equiped")
    self.txt_equiped_name       = TFDirector:getChildByPath(self.img_fz, "txt_equiped_name")
    self.panel_star             = TFDirector:getChildByPath(ui, "img_star")
    self.txt_starlv             = TFDirector:getChildByPath(ui, "txt_starlv")
    self.panel_star1            = TFDirector:getChildByPath(self.img_quality, 'panel_star')
    self.btn_left               = TFDirector:getChildByPath(self.ui, 'btn_left')
    self.btn_right              = TFDirector:getChildByPath(self.ui, 'btn_right')
    self.btn_left:setVisible(false)
    self.btn_right:setVisible(false)
    self.img_xiangfu            = TFDirector:getChildByPath(ui, 'img_xiangfu')
    self.img_xiangsheng         = TFDirector:getChildByPath(ui, 'img_xiangsheng')
    self.btn_help               = TFDirector:getChildByPath(ui, 'btn_help')

    self.panel_bs               = {}
    for i = 1, 5 do
        local panel_bs              = TFDirector:getChildByPath(ui, 'panel_bs'..i)
        panel_bs.btn_icon           = TFDirector:getChildByPath(panel_bs, 'btn_icon')
        panel_bs.btn_icon.index     = i
        panel_bs.img_icon           = TFDirector:getChildByPath(panel_bs, 'img_icon')
        panel_bs.img_jiahao         = TFDirector:getChildByPath(panel_bs, 'img_jiahao')
        panel_bs.txt_level          = TFDirector:getChildByPath(panel_bs, 'txt_level')
        panel_bs.img_suo            = TFDirector:getChildByPath(panel_bs, 'img_suo')
        panel_bs.img_tips           = TFDirector:getChildByPath(panel_bs, 'img_tips')
        panel_bs.icon_xuanzhong     = TFDirector:getChildByPath(panel_bs, 'icon_xuanzhong')
        self.panel_bs[i]            = panel_bs
    end

    self.panel_sx               = TFDirector:getChildByPath(ui, 'panel_sx')
    self.xuanguan_name               = TFDirector:getChildByPath(self.panel_sx, 'xuanguan_name')
    self.img_sx                 = {}
    for i = 1, 6 do
        local img_sx            = TFDirector:getChildByPath(self.panel_sx, 'img_sx'..i)
        img_sx.txt_current_lv   = TFDirector:getChildByPath(img_sx, 'txt_current_lv')
        img_sx.txt_name         = TFDirector:getChildByPath(img_sx, 'txt_name')
        img_sx.img_to           = TFDirector:getChildByPath(img_sx, 'img_to')
        img_sx.txt_next_lv      = TFDirector:getChildByPath(img_sx, 'txt_next_lv')
        img_sx.txt_numLv_effect = TFDirector:getChildByPath(img_sx, 'txt_numLv_effect')
        self.img_sx[i]  = img_sx
    end

    self.holebgtxt              = {"qx","wl","fy","nl","sf"}
    self.img_Bigicon            = TFDirector:getChildByPath(ui, 'img_Bigicon')

    self.panel_xiangqian        = TFDirector:getChildByPath(ui, 'panel_xiangqian')
    self.img_yxq                = TFDirector:getChildByPath(self.panel_xiangqian, 'img_yxq')
    self.img_wxq                = TFDirector:getChildByPath(self.panel_xiangqian, 'img_wxq')
    self.txt_wxq                = TFDirector:getChildByPath(self.panel_xiangqian, 'txt_wxq')

    self.GemIcon                = TFDirector:getChildByPath(self.panel_xiangqian, 'img_icon')
    self.txt_name_icon          = TFDirector:getChildByPath(self.panel_xiangqian, 'txt_name_icon')
    self.txt_num                = TFDirector:getChildByPath(self.panel_xiangqian, 'txt_num')

    self.btn_tool1              = TFDirector:getChildByPath(ui, 'btn_tool1')
    self.btn_tool1.img_tool     = TFDirector:getChildByPath(ui, 'img_tool1')
    self.btn_tool1.txt_num1     = TFDirector:getChildByPath(ui, 'txt_num1_1')
    self.btn_tool1.txt_num2     = TFDirector:getChildByPath(ui, 'txt_num1_2')
    self.txt_qhs                = TFDirector:getChildByPath(ui, 'txt_qhs')

    self.btn_tupo               = TFDirector:getChildByPath(ui, 'btn_tupo')

    self.txt_next_1             = TFDirector:getChildByPath(ui, 'txt_next_1')
    self.img_effect_di1         = TFDirector:getChildByPath(ui, 'img_effect_di1')
    self.txt_nextHurtDerate     = TFDirector:getChildByPath(ui, 'txt_nextHurtDerate')
    self.txt_ts                 = TFDirector:getChildByPath(ui, 'txt_ts')

    self.panel_xlzjc            = TFDirector:getChildByPath(ui, 'panel_xlzjc')
    self.txt_jc                 = TFDirector:getChildByPath(ui, 'txt_jc1')
    self.txt_jc:setVisible(false)

    self.selectHoleIndex        = 1
    
end
function XinFaNingLianLayer:setXinFaData(data)
    local tmp = self.gmId
    self.gmId = data
    self.XinFainfo = XinFaManager:getXinFaByGmId(self.gmId)
    if tmp ~= data then
        self:selectHole(1)
    end
    self:refreshUI()
end

function XinFaNingLianLayer:removeUI()
    self.super.removeUI(self)
end

function XinFaNingLianLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function XinFaNingLianLayer:refreshUI()
    if self.XinFainfo == nil then
        print('cannot find the card gmId = ',self.gmId)
        return
    end
    self.img_quality:setTexture(GetColorIconByQuality_118(self.XinFainfo.config.quality))
      XinFaManager:BindEffectOnEquip(self.img_quality,self.XinFainfo)
    self.img_icon:setTexture("icon/item/"..self.XinFainfo.config.display..".png")
    if self.XinFainfo.star == 0 then
        self.panel_star1:setVisible(false)
    else 
        self.panel_star1:setVisible(true)
        self.txt_starlv:setText(self.XinFainfo:getStar())
    end
    if self.XinFainfo.level == 1 then
        self.txt_intensify_lv:setVisible(false)
    else
        self.txt_intensify_lv:setVisible(true)
    end
    self.txt_intensify_lv:setText("+"..self.XinFainfo.level)
    self.txt_name:setText(self.XinFainfo.config.name)
    if self.XinFainfo.equip then
        self.txt_equiped_name:setText(CardRoleManager:getRoleById(self.XinFainfo.equip).name)
        self.img_equiped:setVisible(true)
    else
        self.img_equiped:setVisible(false)
    end
    for i = 1, 5 do
        local holeLevel = self.XinFainfo:getGemPosLevel(i)
        local gemId = self.XinFainfo:getGemPos(i)
        if gemId ~= nil then
            self.panel_bs[i].img_icon:setTexture("icon/item/"..gemId..".png")
            self.panel_bs[i].img_icon:setVisible(true)
        else
            self.panel_bs[i].img_icon:setVisible(false)
        end
        if i ~= 1 then
            if self.XinFainfo:IsGemPosOpen(i) == true then
                self.panel_bs[i].img_suo:setVisible(false)
                self.panel_bs[i].img_tips:setVisible(false)
                self.panel_bs[i].isOpen = true
            else
                self.panel_bs[i].img_suo:setVisible(true)
                self.panel_bs[i].img_tips:setVisible(true)
                self.panel_bs[i].isOpen = false
            end
        end
        if holeLevel == 0 then
            self.panel_bs[i].txt_level:setVisible(false)
        else
            self.panel_bs[i].txt_level:setVisible(true)
        end
        self.panel_bs[i].txt_level:setText(holeLevel..'d')
    end
    self:refreshGemInfo(self.selectHoleIndex)

    self:refreshCost(self.selectHoleIndex)
    self:refreshTableview()
end

function XinFaNingLianLayer:refreshTableview()
    self.TotalNingLianAttr = self.XinFainfo:getTotalNingLianAttribute()
    self.TotalTab   = {}
    for k,v in pairs(self.TotalNingLianAttr.attribute) do
        table.insert(self.TotalTab, {kind = k,value = v})
    end
    -- print(self.TotalTab)

    if self.tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_xlzjc:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(0)
        self.tableView = tableView
        self.tableView:setZOrder(10)
        self.tableView.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, XinFaNingLianLayer.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, XinFaNingLianLayer.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, XinFaNingLianLayer.numberOfCellsInTableView)
    
        self.panel_xlzjc:addChild(tableView)
    end
    self.tableView:reloadData()
end

function XinFaNingLianLayer.cellSizeForTable(table,idx)
    return 25,20
end
function XinFaNingLianLayer.numberOfCellsInTableView(table,idx)
    return #table.logic.TotalTab / 2 + 1
end

function XinFaNingLianLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        for i = 1, 2 do
            local content = self.txt_jc:clone()
            content.txt_num = TFDirector:getChildByPath(content, 'txt_num')
            content:setVisible(true)
            content:setPosition(ccp(10+137*(i-1), 5))
            content.logic = self
            cell:addChild(content)
            cell.content = cell.content or {}
            cell.content[i] = content
        end
    end
    for i = 1, 2 do
        local content = cell.content[i]
        if self.TotalTab[idx * 2 + i] then
            if self.TotalTab[idx * 2 + i].value ~= 0 then
                if self.TotalTab[idx * 2 + i].kind < 18 then
                    content:setText(AttributeTypeStr[self.TotalTab[idx * 2 + i].kind]..'+'..self.TotalTab[idx * 2 + i].value)
                else
                    content:setText(AttributeTypeStr[self.TotalTab[idx * 2 + i].kind]..'+'..self.TotalTab[idx * 2 + i].value / 100 ..'%')
                end
                content.txt_num:setText("")
                content:setPosition(ccp(20*(i)+137*(i-1), 5))
                content:setVisible(true)
            else
                content:setVisible(false)
            end
        else
            content:setVisible(false)
        end
    end
    return cell
end

function XinFaNingLianLayer:refreshGemInfo(pos)
    print("XinFaNingLianLayer:refreshGemInfo")
    self.img_Bigicon:setTexture("ui_new/xinfa/nl/btn_"..self.holebgtxt[pos].."1.png")
    local maxLevel = self.XinFainfo:getGemPosMaxLevel(pos)
    
    if maxLevel <= self.XinFainfo:getGemPosLevel(pos) then
        self.btn_tupo:setGrayEnabled(true)
        self.btn_tupo:setTouchEnabled(false)
        self.btn_tupo:setTextureNormal("ui_new/rolerisingstar/btn_lianti_h.png")
        self.txt_qhs:setVisible(false)
    else
        self.txt_qhs:setVisible(true)
        self.btn_tupo:setGrayEnabled(false)
        self.btn_tupo:setTouchEnabled(true)
        self.btn_tupo:setTextureNormal("ui_new/xinfa/btn_nl_big.png")
    end
    for i = 1, 4 do
        self.img_sx[i]:setVisible(true)
        if maxLevel <= self.XinFainfo:getGemPosLevel(pos) then
            self.img_sx[i].img_to:setVisible(false)
            self.img_sx[i].txt_next_lv:setVisible(false)
        else
            self.img_sx[i].img_to:setVisible(true)
            self.img_sx[i].txt_next_lv:setVisible(true)
            if i == 1 then
                self.img_sx[i].txt_next_lv:setText(self.XinFainfo:getGemPosLevel(pos) + 1)
                self.img_sx[i].txt_numLv_effect:setText('+'..1)
            end
        end
    end


    local gemId = self.XinFainfo:getGemPos(pos)
    if gemId ~= nil then
        local stone = ItemData:objectByID(gemId)
        self.GemIcon:setTexture("icon/item/"..gemId..".png")
        self.txt_name_icon:setText(stone.name)
        local gemAttr = GemData:objectByID(gemId)
        if gemAttr.attribute and gemAttr.attribute ~= "" then 
            local attributekind , attributenum = gemAttr:getAttribute()
            self.txt_num:setText("+" .. attributenum)
        end
        self.GemIcon:setVisible(true)
        self.txt_name_icon:setVisible(true)
        self.txt_num:setVisible(true)
        self.img_yxq:setVisible(true)
        self.img_wxq:setVisible(false)
        self.txt_wxq:setVisible(false)
    else
        self.GemIcon:setVisible(false)
        self.txt_name_icon:setVisible(false)
        self.txt_num:setVisible(false)
        self.img_yxq:setVisible(false)
        self.img_wxq:setVisible(true)
        self.txt_wxq:setVisible(true)
    end
    self.xuanguan_name:setText(localizable.XuanGuan..'-'..localizable.AttributeTypeStr[pos])

    local GemAttribute = self.XinFainfo:getNingLianAttribute(pos)
    local NextattrList = KongfuGemData:GetHoleAttrByLvAndQualityAndPos(self.XinFainfo:getGemPosLevel(pos) + 1,self.XinFainfo.config.quality,pos)
    local txt_current_lv_Attr = KongfuGemData:GetHoleAttrByLvAndQualityAndPos(self.XinFainfo:getGemPosLevel(pos),self.XinFainfo.config.quality,pos)
    local txt_ex_lv_Attr = KongfuGemData:GetHoleAttrByLvAndQualityAndPos(self.XinFainfo:getGemPosLevel(pos) - 1,self.XinFainfo.config.quality,pos)
    local GemExtraAdd = KongfuGemData:GetExtraByLvAndQuality(self.XinFainfo:getGemPosLevel(pos) + 1,self.XinFainfo.config.quality)
    local ExGemExtraAdd = KongfuGemData:GetExtraByLvAndQuality(self.XinFainfo:getGemPosLevel(pos) - 1,self.XinFainfo.config.quality)
    local XiangxinAdd = 0
    local IsExtra = self.XinFainfo:getGemPosIsExtra(self.selectHoleIndex)
    if IsExtra == 1 then
        self.img_xiangfu:setVisible(true)
        self.img_xiangsheng:setVisible(false)
    elseif IsExtra == 2 then
        self.img_xiangfu:setVisible(false)
        self.img_xiangsheng:setVisible(true)
    else
        self.img_xiangfu:setVisible(false)
        self.img_xiangsheng:setVisible(false)
    end
    if IsExtra ~= 0 then
        XiangxinAdd = self.XinFainfo:getExtraGemRule(self.selectHoleIndex)[self.XinFainfo:getGemPosIsExtra(self.selectHoleIndex)][2] / 10000
    end
    local count = 1
    self.img_sx[count].txt_current_lv:setText(self.XinFainfo:getGemPosLevel(pos))
    count = count + 1
    -- print(NextattrList)

    for kind,value in pairs(GemAttribute.attribute) do
        if NextattrList ~= nil then
            if txt_ex_lv_Attr then
                self.img_sx[count].txt_numLv_effect:setText('+'..math.floor((txt_current_lv_Attr[kind] - (txt_ex_lv_Attr[kind] or 0))))
            end
            -- if self.XinFainfo:getMulExtra(pos) ~= 0 then
                self.img_sx[count].txt_next_lv:setText('+'..math.floor(NextattrList[kind] * (GemExtraAdd + XiangxinAdd + 1)))
            -- else
            --     self.img_sx[count].txt_next_lv:setText('+'..math.floor(NextattrList[kind] / GemExtraAdd / 100 ))
            -- end
        end
        self.img_sx[count].txt_name:setText(localizable.XuanGuan..localizable.AttributeTypeStr[kind]..':')
        self.img_sx[count].txt_current_lv:setText('+'..value)
        count = count + 1
    end
    -- self.img_sx[count].txt_name:setText(localizable.BaoShiZengFu)
    -- count = count + 100
    self.img_sx[count].txt_name:setText(localizable.BaoShiZengFu)
    self.img_sx[count].txt_current_lv:setText('+'..self.XinFainfo:getMulExtra(pos) * 100 .. '%')
    if ExGemExtraAdd then
        self.img_sx[count].txt_numLv_effect:setText('+'..self.XinFainfo:getMulExtra(pos) * 100 - ExGemExtraAdd * 100 .. '%')
    end
    if GemExtraAdd == 0 then
        self.img_sx[count].img_to:setVisible(false)
        self.img_sx[count].txt_next_lv:setVisible(false)
    else
        self.img_sx[count].txt_next_lv:setText('+'..GemExtraAdd * 100 .. '%')
    end
    count = count + 1
    -- if count <= 6 then
    --     for i = count, 6 do
    --         self.img_sx[i]:setVisible(false)
    --     end
    -- end

    --5，6单独处理永久显示相生相符属性
    local rule = KongfuGemRuleData:GemRuleByPos(self.selectHoleIndex)
    local index = self.XinFainfo:getGemPosIsExtra(self.selectHoleIndex)
    self.img_sx[5].txt_name:setText(localizable.Same_Gem)
    self.img_sx[6].txt_name:setText(localizable.Diff_Gem)
    for i =1,2 do
        self.img_sx[i+4].txt_numLv_effect:setVisible(false)
        self.img_sx[i+4].txt_current_lv:setText(localizable.Extra_Gem_XianQian..stringUtils.format(localizable.Gem, AttributeTypeStr[tonumber(rule[i][1])]) .. localizable.Extra_Gem_XianQian2 .. '+'..tonumber(rule[i][2]) / 100 .. '%')
        self.img_sx[i+4].txt_current_lv:setPositionX(300)
        self.img_sx[i+4].txt_current_lv:setScale(0.8)
        self.img_sx[i+4].img_to:setVisible(false)
        self.img_sx[i+4].txt_next_lv:setVisible(false)
    end 
    self.txt_ts:setText("")

    if self.XinFainfo:getGemPosLevel(pos) == nil then
        return
    end
    local level = self.XinFainfo:getGemPosLevel(1)
    if level == nil then
        return
    end
    for i = 1, 5 do
        if self.XinFainfo:getGemPosLevel(i) < level then
            level = self.XinFainfo:getGemPosLevel(i)
        end
    end

    local desc,add_desc = KongfuGemAimData:GetExtraDesByMinLevel(level)
    if add_desc ~= "" then
        self.txt_ts:setText(add_desc)
    else
        self.txt_ts:setText(localizable.common_no)
    end
    local desc,add_desc = KongfuGemAimData:GetNextExtraDesByMinLevel(level)

    if add_desc ~= "" then
        self.img_effect_di1:setVisible(true)
        self.txt_nextHurtDerate:setText(add_desc)
    else
        self.img_effect_di1:setVisible(false)
    end
    -- print(NextattrList)
    if desc ~= nil then
        self.txt_next_1:setText(desc)
    end
end

function XinFaNingLianLayer:refreshCost(pos)
    local costList = KongfuGemData:GetCostByLvAndQuality(self.XinFainfo:getGemPosLevel(pos),self.XinFainfo.config.quality)
    if costList == nil then
        self.btn_tupo:setVisible(false)
        toastMessage(localizable.CostNotFound)
    else
        self.btn_tupo:setVisible(true)
    end
    local maxLevel = self.XinFainfo:getGemPosMaxLevel(pos)
    if maxLevel <= self.XinFainfo:getGemPosLevel(pos) then
        self.btn_tool1:setVisible(false)
    else
        self.btn_tool1:setVisible(true)
    end
    for i,data in ipairs(costList) do
        if (data and data ~= "") then
            local info          = string.split(data, "_")
            local itemTypeId    = tonumber(info[1])
            local itemId        = tonumber(info[2])
            local itemNum       = tonumber(info[3])
            local btn           = self.btn_tool1
            if (btn) then
                btn:setVisible(true)
                btn.itemId          = itemId
                btn.itemTypeId      = itemTypeId
                btn:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
                local item = ItemData:objectByID(itemId)
                if (item) then
                    local iconStr = item:GetPath()
                    btn.img_tool:setTexture(iconStr)
                    btn:setTextureNormal(GetColorIconByQuality(item.quality))
                end
                local num = BagManager:getItemNumById(itemId)
                btn.txt_num1:setText(num)
                btn.txt_num2:setText("/"..itemNum)
                if (num >= itemNum) then
                    btn.txt_num1:setColor(ccc3(255,255,255))
                else
                    btn.txt_num1:setColor(ccc3(255,0,0))
                end

            end
        end
    end
end

function XinFaNingLianLayer:intensifyEquipEffect()
    if self.equipEffect ~= nil then
        self.equipEffect = nil
    end
      TFResourceHelper:instance():addArmatureFromJsonFile("effect/equiIntensify.xml")
      local effect = TFArmature:create("equiIntensify_anim")
      effect:setAnimationFps(GameConfig.ANIM_FPS)
    
      local img_icon = self.panel_bs[self.selectHoleIndex]
      local x = self.panel_bs[self.selectHoleIndex]:getPosition()
      effect:setPosition(ccp(172, -17))
      effect:setScale(0.5)
      effect:setZOrder(100)
      img_icon:addChild(effect)
      self.equipEffect = effect
    

    self.equipEffect:playByIndex(0, -1, -1, 0)
    self.shuaguang_effect = self.shuaguang_effect or {}
    for i = 1, #self.img_sx do
        if not self.shuaguang_effect[i] then
            TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
            local effect = TFArmature:create("equipIntensify_3_anim")
            effect:setAnimationFps(GameConfig.ANIM_FPS)

            local img_intensify_lv = self.img_sx[i]
            effect:setPosition(ccp(135, -60))
            effect:setScaleX(0.84)
            img_intensify_lv:addChild(effect)
            self.shuaguang_effect[i] = effect
        end
        self:UpLevelNumEffect(self.img_sx[i].txt_numLv_effect)
        self.shuaguang_effect[i]:playByIndex(0, -1, -1, 0)
    end
end

function XinFaNingLianLayer:registerEvents()
    self.super.registerEvents(self)

    for i = 1, 5 do
        self.panel_bs[i].btn_icon:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHoleClickHandle),1)
        self.panel_bs[i].btn_icon.logic = self
    end

    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHelpClickHandle),1)
    self.btn_help.logic = self
    
    self.btn_tupo:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onTupoClickHandle),1)
    self.btn_tupo.logic = self

    self.receiveInfo = function(event)     
        self.XinFainfo:setGemPosLevel(event.data[1][1].pos,event.data[1][1].level)
        if event.data[1][1].level == 10 then
            local openPos = event.data[1][1].pos + 1
            if openPos < 6 then
                toastMessage(AttributeTypeStr[openPos]..localizable.XuanGuan..localizable.commom_open)
            end
        end
        self:intensifyEquipEffect()
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(XinFaManager.NingLian, self.receiveInfo)
end

function XinFaNingLianLayer:selectHole(index)
    for i = 1,5 do
        if i ~= index then
            self.panel_bs[i].icon_xuanzhong:setVisible(false)
        else
            self.panel_bs[i].icon_xuanzhong:setVisible(true)
        end
    end
    self.selectHoleIndex = index
    self:refreshGemInfo(index)
    self:refreshCost(index)
end

function XinFaNingLianLayer:UpLevelNumEffect(widget )
    TFDirector:killAllTween(widget)
    widget:setVisible(true)
    widget:setScale(0.1)
    local tween = {
        target = widget,
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
                    widget:setVisible(false)

                end,
            },
    }
    TFDirector:toTween(tween)

end

function XinFaNingLianLayer:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(XinFaManager.NingLian, self.receiveInfo)
    self.receiveInfo = nil
end

function XinFaNingLianLayer.onHoleClickHandle( sender )
    local self = sender.logic
    local index = sender.index
    -- print("onHoleClickHandle")
    local Isopen, openKind = self.XinFainfo:IsGemPosOpen(index)
    if Isopen == false and index ~= 1 then
        print(localizable.XinFaXuanGuan,AttributeTypeStr[index])
        toastMessage(stringUtils.format(localizable.XinFaXuanGuan,AttributeTypeStr[openKind],AttributeTypeStr[index]))
        return
    end
    self:selectHole(index)
end

function XinFaNingLianLayer.onTupoClickHandle( sender )
    local self = sender.logic
    -- self.XinFainfo:setGemPosLevel(self.selectHoleIndex,self.XinFainfo:getGemPosLevel(self.selectHoleIndex) + 1)
    
    XinFaManager:sendHeartMethodNingLian(self.gmId,self.selectHoleIndex)
end

function XinFaNingLianLayer.onHelpClickHandle( btn )
    CommonManager:showRuleLyaer("kongfumethodjewelholes")
end

function XinFaNingLianLayer.onShowItemClickHandle(sender)
    -- print(sender.itemId, sender.itemTypeId)
    Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId)
end

return XinFaNingLianLayer