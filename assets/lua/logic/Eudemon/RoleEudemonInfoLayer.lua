-- client side RoleEudemonInfoLayer.lua
--[[
 * @Description: 宠物装载界面
 ]]
-- script writer fei
-- creation time 2017-03-08
local RoleEudemonInfoLayer = class("RoleEudemonInfoLayer", BaseLayer)
RoleEudemonInfoLayer.LIST_ITEM_HEIGHT = 150; 
function RoleEudemonInfoLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.pet.PetListLayer")
end

function RoleEudemonInfoLayer:onShow()
    self.super.onShow(self)
    if self.isFirst then
        self:moveIn()
        self.isFirst = false
    end
    self:refreshUI();
end
function RoleEudemonInfoLayer:setData(fightType)
    self.fightType = fightType
    self.fightEudemonId = EudemonManager:getEudemonByFightId(fightType)
    self:initEudemonList()
end
function RoleEudemonInfoLayer:initUI( ui )
    self.super.initUI(self, ui)
    self.btn_close     = TFDirector:getChildByPath(ui, "btn_close")
    self.btn_xiala     = TFDirector:getChildByPath(ui, "btn_xiala")

    self.btn_xiala:setVisible(false)
    self.btn_close:setVisible(true)
    --
    self.eudemonList   = TFArray:new()
    self.tab_mode      = TFDirector:getChildByPath(ui, 'panel_zhuangbeihuadong');
    
    local txt_wenben_word2     = TFDirector:getChildByPath(ui, "txt_wenben_word2")
    txt_wenben_word2:setText(localizable.Eudemon_tips_2)
    self.isFirst = true
end

--
function RoleEudemonInfoLayer:initEudemonList()
    local delType = 0
    if (self.fightType == EnumFightStrategyType.StrategyType_DOUBLE_1) then
        delType = EnumFightStrategyType.StrategyType_DOUBLE_2
    elseif (self.fightType == EnumFightStrategyType.StrategyType_DOUBLE_2) then
        delType = EnumFightStrategyType.StrategyType_DOUBLE_1
    end
    self.eudemonList    = TFArray:new()
    local tempList = TFArray:new()
    for info in EudemonManager:getEudemonList():iterator() do
        if (info:isHelpFight(delType) ~= true) then
            if (info:isHelpFight(self.fightType)) then
                tempList:pushFront(info)
            else
                self.eudemonList:push(info)
            end
        end
    end
    for info in tempList:iterator() do
        self.eudemonList:pushFront(info)
    end
    tempList:clear()
end

--
function RoleEudemonInfoLayer:refreshUI()
    self:initTableView(self.tab_mode)
	self:refreshTable()
end
function RoleEudemonInfoLayer:refreshTable()
	if (self.tableView) then
		self.tableView:reloadData()
        if (self.selectEudemonInfo and self.selectEudemonInfo.eudemonId) then
            local eudemonInfo = EudemonManager:getEudemonById(self.selectEudemonInfo.eudemonId)
            self:openEudemonDetail(eudemonInfo)
        else
            self:openEudemonDetail()
        end
	end
end
function RoleEudemonInfoLayer:initTableView(tab_mode)
    if (self.tableView) then
        return
    end
	local  tableView   =  TFTableView:create();
    self.tableView  = tableView;
    tableView.logic    = self;
    tableView:setTableViewSize(tab_mode:getContentSize());
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL);
    tableView:setVerticalFillOrder(0);
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable);
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex);
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView);
    tab_mode:addChild(tableView,2);
    Public:bindScrollFun(tableView);
end
function RoleEudemonInfoLayer.tableCellAtIndex(tableView, idx)
    local self = tableView.logic;
    local cell = tableView:dequeueCell()
    if nil == cell then
        tableView.cells = tableView.cells or {}
        cell = TFTableViewCell:create()
        tableView.cells[cell] = true

        local item_node = TFPanel:create();
        cell:addChild(item_node);
        cell.item_node = item_node;

        for i=1,3 do
            local m_node = createUIByLuaNew("lua.uiconfig_mango_new.pet.PetCell");
            m_node.panel_empty = TFDirector:getChildByPath(m_node, 'panel_empty');
            m_node.panel_info = TFDirector:getChildByPath(m_node, 'panel_info');

            m_node:setName("PetCell" .. i);
            m_node:setPosition(ccp( 30 + 145 * (i -1) ,-5));

            item_node:addChild(m_node);
            item_node.m_node = m_node; 
        end
    end

    for i=1,3 do
        local index = idx*3 + i;

        local m_node = TFDirector:getChildByPath(cell.item_node, 'PetCell' .. i);
        local eudemonInfo = self.eudemonList:objectAt(index);
        if  eudemonInfo then
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(true);
            self:setCellData(m_node, eudemonInfo, index);
            EudemonManager:BindEffectOnEquip(m_node.panel_info, eudemonInfo:getId())
        else
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(false);
        end
    end

    return cell
end

--tableview 
function RoleEudemonInfoLayer:setCellData(item_node, eudemonInfo,index)
	local eudemonId = eudemonInfo:getId()
    local starLevel = eudemonInfo:getStarLevel()
    --
    local img_xuanzhong     = TFDirector:getChildByPath(item_node, "img_xuanzhong")
    local btn_icon          = TFDirector:getChildByPath(item_node, 'btn_node');
    local btn_equip         = TFDirector:getChildByPath(item_node, "btn_equip")
    CommonManager:setRedPoint(btn_icon, false, "isTraining", ccp(0, 0))
    
    if ((not self.selectEudemonInfo) or eudemonId == self.selectEudemonInfo.eudemonId) then

        self.selectEudemonInfo = {}
        self.selectEudemonInfo.img_xuanzhong    = img_xuanzhong
        self.selectEudemonInfo.eudemonId        = eudemonId
        img_xuanzhong:setVisible(true)
        CommonManager:setRedPoint(btn_icon, EudemonManager:isShowRedPointOpenTraining(self.fightType), "isTraining", ccp(0, 0))
        local sprite = btn_icon:getChildByName("sprite_eudemon")
        local roldId = eudemonInfo:getTrainingRoleId()
        if (EudemonManager:isEudemonRoleIdFight(roldId, self.fightType)) then
            --训练师不起作用
            if (sprite == nil) then
                sprite = TFImage:create("ui_new/SkillStrategy/img_gantanhao.png")
                btn_icon:addChild(sprite, 99)
                sprite:setName("sprite_eudemon")
                local size = btn_icon:getContentSize()
                sprite:setAnchorPoint(ccp(1, 1))
                sprite:setPosition(ccp(size.width / 2  , size.height / 2));    
            end
            if (sprite) then
                sprite:setVisible(true)
            end
        else
            if (sprite) then
                sprite:setVisible(false)
            end
        end
    else
        img_xuanzhong:setVisible(false)
    end
    --
    print("starLevel  ",starLevel)
    for i=1,5 do
        local img_star = TFDirector:getChildByPath(item_node, "img_star_"..i)
        if (img_star) then
            img_star:setVisible(starLevel >= i)
            --img_star:setPosition(ccp(45,45 - ((i - 1)) * 17))
        end
    end
    local img_equiped = TFDirector:getChildByPath(item_node, "img_equiped")
    if (img_equiped) then
        
        if (eudemonId == self.fightEudemonId) then
            --已上阵
            img_equiped:setVisible(true)
            img_equiped:setTexture("ui_new/pet/icon_yishangzhen.png")
        else
            img_equiped:setVisible(false)
        end
    end
    -- local txt_zhuangbeiming = TFDirector:getChildByPath(item_node, "txt_zhuangbeiming")
    -- if (txt_zhuangbeiming) then
    --     txt_zhuangbeiming:setVisible(true)
    --     txt_zhuangbeiming:setName(eudemonInfo:getName())
    -- end

    
    btn_equip:setTextureNormal(GetColorIconByQuality(eudemonInfo:getQuality()))
    local img_skill_icon = TFDirector:getChildByPath(btn_equip, "img_skill_icon")
    img_skill_icon:setTexture(eudemonInfo:getIconPath())

 	local img_jiantousheng = TFDirector:getChildByPath(item_node, "img_jiantousheng")
    if (img_jiantousheng) then
        img_jiantousheng:setVisible(false)
        --[[if (curEquip == nil or equipItem:getpower() > curEquip:getpower()) then
                img_arrow:setTexture("ui_new/roleequip/js_jts_icon.png");
            else
                img_arrow:setTexture("ui_new/roleequip/js_jtx_icon.png");
            end]]
    end

 	
    btn_icon.logic  = self;
    btn_icon.eudemonId  = eudemonId;
    btn_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCellClickHandle), 1);
    
end

function RoleEudemonInfoLayer.onCellClickHandle(sender) 
    local self = sender.logic;

    local eudemonId = sender.eudemonId;
    local eudemonInfo = EudemonManager:getEudemonById(eudemonId)

    if not eudemonInfo or eudemonId == self.selectEudemonInfo.eudemonId then
        return
    end
    if self.selectEudemonInfo and self.selectEudemonInfo.img_xuanzhong and not tolua.isnull(self.selectEudemonInfo.img_xuanzhong) then
        self.selectEudemonInfo.img_xuanzhong:setVisible(false);
    end

    local img_xuanzhong = TFDirector:getChildByPath(sender, 'img_xuanzhong');
    img_xuanzhong:setVisible(true);

    self.eudemonInfo = eudemonInfo;
    self.selectEudemonInfo 					= {}
    self.selectEudemonInfo.img_xuanzhong 	= img_xuanzhong
    self.selectEudemonInfo.eudemonId 		= eudemonId

   self:openEudemonDetail(eudemonInfo); 
end

function RoleEudemonInfoLayer:openEudemonDetail(eudemonInfo) 
    local layer             = self:getChildByName("EudemonPetdressLayer")
    if not layer then
        layer = require("lua.logic.Eudemon.EudemonPetdressLayer"):new();
        layer:setName("EudemonPetdressLayer")
        self:addLayer(layer);
        layer:setZOrder(0);
    end
    layer:setData(eudemonInfo, self.fightType)
    self.curLeyer = layer;
    layer:onShow()
end

function RoleEudemonInfoLayer.cellSizeForTable(tableView,idx)
    return RoleEudemonInfoLayer.LIST_ITEM_HEIGHT, 960
end

function RoleEudemonInfoLayer.numberOfCellsInTableView(tableView)
    local self = tableView.logic;
    return math.max(math.ceil(self.eudemonList:length()/3) + 1 ,5);
end
function RoleEudemonInfoLayer.onCloseClickHandle(sender) 
    local self = sender.logic;
    sender:setTouchEnabled(false)
    self:moveOut()
end

function RoleEudemonInfoLayer:moveIn()
    self.ui:runAnimation("Action0",1)
end
function RoleEudemonInfoLayer:moveOut()
    if (self.curLeyer) then
        self.curLeyer:moveOut()
    end
    self.ui:runAnimation("Action1",1)
    self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
        AlertManager:close()
        end)
end
--
function RoleEudemonInfoLayer:registerEvents()
    self.super.registerEvents(self)
 	--ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
    self.receiveInfo = function(event)
        if (self.curLeyer) then
            --self.curLeyer:setData(eudemonInfo, self.fightType)
            self.curLeyer:onShow()
        end
    end
    TFDirector:addMEGlobalListener(EudemonManager.EquipTeamEudemon, self.receiveInfo)
    self.btn_close.logic   = self
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCloseClickHandle), 1)
end
function RoleEudemonInfoLayer:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(EudemonManager.EquipTeamEudemon, self.receiveInfo)
    self.receiveInfo = nil
end

function RoleEudemonInfoLayer:removeUI()    
    self.super.removeUI(self)
end
return RoleEudemonInfoLayer