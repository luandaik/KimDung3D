--[[
    宠物装载
    -- by fei
    -- 2017/03/09
]]

local EudemonPetdressLayer = class("EudemonPetdressLayer",BaseLayer)


function EudemonPetdressLayer:ctor()

	self.super.ctor(self)
	self:init("lua.uiconfig_mango_new.pet.PetdressLayer")
end
function EudemonPetdressLayer:setData( eudemonInfo, fightType)
    self.fightType          = fightType
    self.currEudemonInfo    = eudemonInfo
    local showType = 1
    if (eudemonInfo) then
        showType = 2
        self.eudemonInfo = EudemonManager:getEudemonInfoByFightId(self.fightType)
        if (self.eudemonInfo and self.eudemonInfo:getId() ~= self.currEudemonInfo:getId()) then
            showType = 3
        end
    end
    local act = {"tujing", "dress","change"}
    self.actStr = act[showType]
    print("-----EudemonPetdressLayer---", self.fightType)
end
function EudemonPetdressLayer:initUI( ui )

	self.super.initUI(self, ui)
    self.layerList = {}
    self.panel_petdress     = TFDirector:getChildByPath(ui, 'panel_petdress')
    self.panel_petchange    = TFDirector:getChildByPath(ui, 'panel_petchange')
    self.panel_huodetujing  = TFDirector:getChildByPath(ui, 'panel_huodetujing')
    self.panel_outlist      = TFDirector:getChildByPath(self.panel_huodetujing, 'panel_outlist')
	self.bg_cell            = TFDirector:getChildByPath(self.panel_huodetujing, 'bg_cell')
    self.bg_cell:setVisible(false)
    self.bg_cell:retain()
    self.bg_cell:removeFromParent(true)
    
    self.panel_huodetujing:setVisible(false)
    self.panel_petchange:setVisible(false)
    self.panel_petdress:setVisible(false)
    self.isFirst = true
end
function EudemonPetdressLayer:moveIn()
    
    
    self.ui:runAnimation(self.actStr.."_in",1)
    self.ui:setAnimationCallBack(self.actStr.."_in", TFANIMATION_END, function()
       -- self:refreshUI()
        end)

end
function EudemonPetdressLayer:moveOut()
    self.ui:runAnimation(self.actStr.."_out",1)
    -- self.ui:setAnimationCallBack("dress_out", TFANIMATION_END, function()
    --     --AlertManager:close()
    --     end)
end
function EudemonPetdressLayer:removeUI()
    if self.bg_cell then
        self.bg_cell:release()
        self.bg_cell = nil
    end
	self.super.removeUI(self)
end

function EudemonPetdressLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
    if self.isFirst then
        self:moveIn()
        self.isFirst = false
        return
    end
    
end
function EudemonPetdressLayer:refreshUI()
    self.panel_huodetujing:setVisible(false)
    self.panel_petchange:setVisible(false)
    self.panel_petdress:setVisible(false)
    --
    if (self.currEudemonInfo == nil) then
        self:refreshNoEudemon(self.panel_huodetujing)
        return
    end
    --
    self.eudemonInfo = EudemonManager:getEudemonInfoByFightId(self.fightType)
    self.showType = 1
    local node          = self.panel_petdress
    local eudemonInfo   = nil
    local isSetPos = false
    if (self.eudemonInfo) then
        if (self.eudemonInfo:getId() == self.currEudemonInfo:getId()) then
            --卸下
            self.showType = 2
            eudemonInfo = self.currEudemonInfo
        else
            --比较
            self.showType = 3
            self.panel_petchange:setVisible(true)
            local panel_chuandaizhuangbei = TFDirector:getChildByPath(self.panel_petchange, 'panel_chuandaizhuangbei')
            isSetPos = true
            self:refreshNodeUI(panel_chuandaizhuangbei, self.currEudemonInfo, isSetPos)
            eudemonInfo = self.eudemonInfo
            node        = TFDirector:getChildByPath(self.panel_petchange, 'panel_dangqianzhuangbei')
        end
    else
        eudemonInfo = self.currEudemonInfo
    end
    print("self.showType  ", self.showType)
    self:refreshNodeUI(node, eudemonInfo, isSetPos)
end
function EudemonPetdressLayer:refreshNodeUI(node, eudemonInfo, isSetPos)
    node:setVisible(true)
    self:refreshTeamAttrText(node, eudemonInfo, isSetPos)
    self:refreshImgBg(node, eudemonInfo)
end
function EudemonPetdressLayer:refreshTeamAttrText(node, eudemonInfo, isSetPos)
    local panel_clip = TFDirector:getChildByPath(node, 'panel_clip')
    if (panel_clip == nil) then
        return
    end

    local totalAttr = eudemonInfo:getTeamAttribute()
    local count = 0
    for attrId,value in pairs(totalAttr.attribute) do
        value = value or 0
        local txt_name  = TFDirector:getChildByPath(panel_clip, 'txt_extraattr_'..count)
        if (txt_name and value ~= 0) then
            txt_name:setVisible(true)
            local txt_value = nil
            if count > 4 then
                txt_value = TFDirector:getChildByPath(txt_name, 'txt_extraattr_num_4')
            else
                txt_value = TFDirector:getChildByPath(txt_name, 'txt_extraattr_num_'..count)
            end
            txt_name:setText(AttributeTypeStr[attrId])
            txt_value:setText("    +"..math.ceil(covertToDisplayValue(attrId, value, true)))
            if (isSetPos) then
                txt_value:setPositionX(45)
                txt_name:setPositionX(38)
            end
            count = count + 1
        end
        
    end

    for i=count,8 do
        local txt_name  = TFDirector:getChildByPath(panel_clip, 'txt_extraattr_'..i)
        txt_name:setVisible(false)
    end
    self:SetMove(panel_clip,count)
end

function EudemonPetdressLayer:refreshImgBg(node, eudemonInfo, isRight)
    local txt_zhuangbeiming      = TFDirector:getChildByPath(node, 'txt_zhuangbeiming')
    local btn_equip              = TFDirector:getChildByPath(node, 'btn_equip')
    local img_skill_icon         = TFDirector:getChildByPath(btn_equip, 'img_skill_icon')
    btn_equip:setTextureNormal(GetColorIconByQuality(eudemonInfo:getQuality()))
    EudemonManager:BindEffectOnEquip(btn_equip,eudemonInfo:getId())
    img_skill_icon:setTexture(eudemonInfo:getIconPath())
   -- img_skill_icon:setScale(0.25)
    local starLevel = eudemonInfo:getStarLevel()
    for i=1,5 do
        local starBg = TFDirector:getChildByPath(node, 'img_star_'..i)
        starBg:setVisible(starLevel >= i)
    end
    txt_zhuangbeiming:setText(eudemonInfo:getName())
    local img_dangqian      = TFDirector:getChildByPath(node, 'img_dangqian')
    local img_jiantousheng  = TFDirector:getChildByPath(node, 'img_jiantousheng')
    local img_mubiao        = TFDirector:getChildByPath(node, 'img_mubiao')
    local btn_zhuangbei     = TFDirector:getChildByPath(node, 'btn_zhuangbei')
    local btn_qianghua      = TFDirector:getChildByPath(node, 'btn_qianghua')
    local btn_quit          = TFDirector:getChildByPath(node, 'btn_quit')
    local btn_set          = TFDirector:getChildByPath(node, 'btn_set')

    local function nodeVisible(node, isVisible)
        if (node) then
            node:setVisible(isVisible == true)
            return true
        end
        return false
    end
    nodeVisible(img_jiantousheng)
    nodeVisible(img_mubiao)
    nodeVisible(img_dangqian)
    nodeVisible(btn_zhuangbei)
    nodeVisible(btn_set)
    

    if (self.showType == 3) then
        nodeVisible(img_dangqian, true)
    end
   
    if (btn_zhuangbei) then
        --装备
        if (self.showType == 1) then
            btn_zhuangbei.logic = self
            btn_zhuangbei:setVisible(true)
            btn_zhuangbei.type = 1
            btn_zhuangbei:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSetClickHandle), 1)
            if (img_mubiao) then
                img_mubiao:setVisible(true)
                img_mubiao:setTexture("ui_new/roleequip/js_mubiao.png")
            end
        end
    end
    if (btn_qianghua) then
        --驯养
        btn_qianghua.logic  = self
        btn_qianghua:setVisible(false)
        CommonManager:setRedPoint(btn_qianghua, false, "btn_qianghua", ccp(0, 0))
        if (self.showType == 2) then
            btn_qianghua:setVisible(true)
            CommonManager:setRedPoint(btn_qianghua, EudemonManager:isShowRedPointOpenTraining(self.fightType), "btn_qianghua", ccp(0, 0))
            btn_qianghua:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onQianghuaClickHandle), 1)
            if (img_mubiao) then
                img_mubiao:setVisible(true)
                img_mubiao:setTexture("ui_new/roleequip/js_dangqian.png")
            end
            --
            local sprite = btn_qianghua:getChildByName("sprite_eudemon")
            local roldId = eudemonInfo:getTrainingRoleId()
            if (EudemonManager:isEudemonRoleIdFight(roldId, self.fightType)) then
                --驯养师不起作用
                if (sprite == nil) then
                    sprite = TFImage:create("ui_new/SkillStrategy/img_gantanhao.png")
                    btn_qianghua:addChild(sprite)
                  
                    sprite:setName("sprite_eudemon")
                    sprite:setPosition(ccp(btn_qianghua:getContentSize().width / 2 - 20, btn_qianghua:getContentSize().height / 2));
                end
                if (sprite) then
                    sprite:setVisible(true)
                end
            else
                if (sprite) then
                    sprite:setVisible(false)
                end
            end
        end
    end
    if (btn_quit) then
        --下阵
        btn_quit.logic      = self
        btn_quit:setVisible(false)
        if (self.showType == 2) then
            btn_quit:setVisible(true)
            btn_quit.type = 2
            btn_quit:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSetClickHandle), 1)
        end
    end
    if (self.showType == 3) then
        --更换
        if (nodeVisible(btn_set, true)) then
            btn_set.type    = 1
            btn_set.logic   = self
            btn_set:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSetClickHandle), 1)
        end
    end
end

--
function EudemonPetdressLayer:refreshNoEudemon(node)
    node:setVisible(true)
    
    local bg_cell       = TFDirector:getChildByPath(node, 'bg_cell')
    local txt_leveldesc = TFDirector:getChildByPath(bg_cell, 'txt_leveldesc')
    local show_way = ""
    for v in BattlePetData:iterator() do
        local iconList = string.split(v.icon, ",")
        local itemData = ItemData:objectByID(tonumber(iconList[1]))
        if (itemData) then
            show_way = itemData.show_way
        end
        break
    end
    self.show_way = string.split(show_way, "|") or {}
    self:initTableView()
end

function EudemonPetdressLayer:initTableView()
    --获取路径tableview
    if (self.pathTabView == nil) then
        self.pathTabView =  TFTableView:create()
        self.pathTabView:setTableViewSize(self.panel_outlist:getContentSize())
        self.pathTabView:setDirection(TFTableView.TFSCROLLVERTICAL)    
        self.pathTabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        self.pathTabView.logic = self
        self.panel_huodetujing:addChild(self.pathTabView)
        self.pathTabView:setPosition(self.panel_outlist:getPosition())
        --
        self.pathTabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTablePath)
        self.pathTabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableViewPath)
        self.pathTabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndexPath)
        self.pathTabView:reloadData()
        self.pathTabView:setScrollToBegin()
    end
end
function EudemonPetdressLayer.tableCellAtIndexPath(table, idx)

    local self = table.logic
    local cell = table:dequeueCell()
    local panel = nil
    if cell == nil then
        cell    = TFTableViewCell:create()        
        panel   = self.bg_cell:clone()
        panel:setPosition(ccp(150,35))
        cell:addChild(panel)
        cell.panel = panel
    else
        panel = cell.panel
    end

    local txt_leveldesc  = TFDirector:getChildByPath(panel, "txt_leveldesc")
    txt_leveldesc:setText("")
    local gotoId = 0
    if (self.show_way[idx + 1]) then
        local str = string.split(self.show_way[idx + 1], "_")
        gotoId = tonumber(str[1])
        if (gotoId) then
            txt_leveldesc:setText(localizable.EnumItemOutPutType[gotoId])
        end
    end
    panel:setVisible(true)
    panel:setTouchEnabled(true)
    panel:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPathCellBtnClick),1)
    panel.logic = self
    panel.gotoId = gotoId

    return cell
end
function EudemonPetdressLayer.onPathCellBtnClick(sender)
    local self = sender.logic

   IllustrationManager:gotoProductSystem(sender.gotoId)
end
function EudemonPetdressLayer.cellSizeForTablePath(table,idx)
    local self = table.logic
    return 67,300
end
function EudemonPetdressLayer.numberOfCellsInTableViewPath(table)
    local self = table.logic
    return #self.show_way
end
function EudemonPetdressLayer.onSetClickHandle(sender)
    local self = sender.logic
    EudemonManager:sendEudemonEquipBattle(self.currEudemonInfo:getId(), self.fightType, sender.type)
    AlertManager:close()
end
--
function EudemonPetdressLayer.onQianghuaClickHandle(sender)
    local self = sender.logic
    EudemonManager:OpemEudemonMainLayer(self.currEudemonInfo:getId(), self.fightType)
end

function EudemonPetdressLayer:registerEvents()
	self.super.registerEvents(self)

end

function EudemonPetdressLayer:removeEvents()
    self.super.removeEvents(self)
end

function EudemonPetdressLayer:dispose()
	self.super.dispose(self)
end
function EudemonPetdressLayer:SetMove(node,index)
    if node == nil then
        return nil
    end
    if node.moveTween then
        TFDirector:killTween(node.moveTween)
        node.moveTween = nil
        node:setPositionY(node.initPosY)
    end

    if node.initPosY == nil then
        node.initPosY = node:getPositionY()
    end  
    local limitAttrNum = 7
    if index > limitAttrNum then 
        local moveDy = (index - limitAttrNum)*30
        local posY = node.initPosY
        local moveTween = 
        {
            target = node,
            repeated = -1,
            {
                duration = 2,
                delay = 1,
                y = posY + moveDy+10,
                      
            },
            { -- 此节实现节与节之间的延时
                duration = 1,
                delay = 1, 
                onComplete = function()
                    node:setPositionY(posY)
                end    
            },
        }
        TFDirector:toTween(moveTween)
        node.moveTween = moveTween
    end
end

return EudemonPetdressLayer