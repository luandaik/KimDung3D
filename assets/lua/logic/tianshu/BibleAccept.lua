-- client side BibleAccept.lua
--[[
 * @Description: 选择接受传承的天书
 ]]
-- script writer chikui
-- creation time 2016-10-15

local BibleAccept = class("BibleAccept",BaseLayer)

function BibleAccept:ctor(data)
	self.super.ctor(self, data)
    self.accoptGmId = 0
	self:init("lua.uiconfig_mango_new.smithy.SmritiAccept")
end

function BibleAccept:initUI( ui )
	self.super.initUI(self,ui)
    self.ui = ui
    self.btn_close =  TFDirector:getChildByPath(ui, 'btn_shousuo')	
    self.panel_list = TFDirector:getChildByPath(ui, 'panel_cardregional')
    self.txt_zhiyin1 = TFDirector:getChildByPath(ui, 'txt_zhiyin1')
    self.txt_zhiyin1:setText(localizable.Tianshu_exchange_text)
    self.img_di1 = TFDirector:getChildByPath(ui, 'img_di')
    self.img_di2 = TFDirector:getChildByPath(ui, 'img_di2')
end

local function sortlistByQuality(v1,v2)
    if v1.quality > v2.quality then
        return true
    elseif v1.quality == v2.quality then
        if v1:getpower() > v2:getpower() then
            return false
        else
            return true
        end
    else
        return false
    end
end

function BibleAccept:setInstanceId(instanceId)
    self.old_equipList = SkyBookManager:GetAllEquipInWarSideFirst(0)
    local equip = SkyBookManager:getItemByInstanceId(instanceId)
    self.equipList = TFArray:new()
    if instanceId ~= 0 then
        for v in self.old_equipList:iterator() do
            if v.quality == equip.quality and v.quality >= 4 and equip.instanceId ~= v.instanceId then
                self.equipList:push(v)
            end
        end
    else
        for v in self.old_equipList:iterator() do
            if v.quality >= 4 then
                self.equipList:push(v)
            end    
        end
    end 
    --self.equipList:sort(sortlistByQuality)
    self:initTableview()    
end

function BibleAccept:initTableview()
	local  tableView =  TFTableView:create()
	tableView:setTableViewSize(self.panel_list:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    self.tableView = tableView
    self.tableView.logic = self
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, BibleAccept.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, BibleAccept.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, BibleAccept.numberOfCellsInTableView)
    tableView:addMEListener(TFTABLEVIEW_SCROLL, BibleAccept.tableScroll)
	self.panel_list:addChild(tableView)

    self.tableView:reloadData()
end

function BibleAccept.cellSizeForTable(table,idx)
    return 216,725
end
function BibleAccept.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic

    local startOffset = 10
    local columnSpace = 10
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        for i=1,4 do
            local equip_panel = createUIByLuaNew("lua.uiconfig_mango_new.smithy.SmithyEquipIcon");
            equip_panel.panel_empty = TFDirector:getChildByPath(equip_panel, 'panel_empty');
            equip_panel.panel_info = TFDirector:getChildByPath(equip_panel, 'panel_info');

            local size = equip_panel:getSize()
	    	local x = size.width*(i-1)
	    	if i > 1 then
	    	    x = x + (i-1)*columnSpace
	    	end
            x = x + startOffset
            equip_panel:setPosition(ccp(x,20))
            cell:addChild(equip_panel)
            cell.equip_panel = cell.equip_panel or {}
            cell.equip_panel[i] = equip_panel

        end
    end
    for i=1,4 do
        local count = self.equipList:length()
        local index = idx * 4 + i
    	if index <= self.equipList:length() then
	    	local equip = self.equipList:objectAt(index)
            if equip then
                self:loadItemNode(cell.equip_panel[i],equip)
                cell.equip_panel[i].panel_info:setVisible(true);
            else
                cell.equip_panel[i].panel_info:setVisible(false);
            end
    	else
            cell.equip_panel[i].panel_info:setVisible(false);
    	end
    end
    return cell
end

function BibleAccept.numberOfCellsInTableView(table)
	local self = table.logic
	if self.equipList and self.equipList:length() > 0 then
		local num = math.ceil(self.equipList:length()/4)
		if num < 2 then
			return 2
		else
			return num
		end
    end
    return 2
end

function BibleAccept.tableScroll(table)
    local self = table.logic
    local size = self.tableView:getTableViewSize()
    local size2 = self.tableView:getContentSize()
    local pos = self.tableView:getContentOffset()
    if pos.y == size.height - size2.height then
        self.img_di2:setVisible(false)
    else
        self.img_di2:setVisible(true)
    end
    if pos.y == 0 then
        self.img_di1:setVisible(false)
    else
        self.img_di1:setVisible(true)
    end
end

function BibleAccept:setParent(parent)
	self.parent = parent
end

function BibleAccept:setSelectId(accoptGmId)
	--self.parent:setAcceptId(accoptGmId)
    self.accoptGmId = accoptGmId
	self.onBtnClose(self.btn_close)
end

function BibleAccept.iconClickHandle(sender)
    local self = sender.logic
    if sender.instanceId ~= nil then
        self:setSelectId(sender.instanceId)
    end
    -- local level = FunctionOpenConfigure:getOpenLevel(800)
    -- if level then
    --     local teamLev = MainPlayer:getLevel()
    --     if level > teamLev then
    --         --toastMessage("团队等级达到"..level.."级开启装备")
    --         toastMessage(stringUtils.format(localizable.smithy_EquipIcon_open,level))
    --         return
    --     end
    -- end
end

function BibleAccept:loadItemNode(item_node,equipItem)

    local btn_icon = TFDirector:getChildByPath(item_node, 'bg');
    btn_icon.logic = self;
    btn_icon.instanceId = equipItem.instanceId;
    btn_icon:setTouchEnabled(true)
    btn_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.iconClickHandle,play_xuanze));

    local img_icon = TFDirector:getChildByPath(item_node, 'img_icon');
    img_icon:setTexture(equipItem:GetTextrue());

    local img_quality = TFDirector:getChildByPath(item_node, 'img_quality');
    local _quality = SkyBookManager:GetUpQuality(equipItem.quality, equipItem.tupoLevel)
    img_quality:setTexture(GetColorIconByQuality(_quality));
    SkyBookManager:BindEffectOnEquip(img_quality, equipItem)

    --local txt_name = TFDirector:getChildByPath(item_node, 'txt_zhuangbeiming');
    --txt_name:setText(equipItem:getConfigName());

    local txt_qianghualv = TFDirector:getChildByPath(item_node, 'txt_intensify_lv')
    txt_qianghualv:setFntFile('font/num_226.fnt')
    
    if equipItem.level == nil or equipItem.level == 0 then
        txt_qianghualv:setVisible(false)
    else   
        --txt_qianghualv:setText(EnumSkyBookLevelType[equipItem.level] .. "重")
        txt_qianghualv:setText(stringUtils.format(localizable.Tianshu_chong_text, EnumSkyBookLevelType[equipItem.level]))
        txt_qianghualv:setVisible(true)
    end
    
    local img_improve = TFDirector:getChildByPath(item_node, 'img_improve');
    img_improve:setVisible(false)

    local txt_power = TFDirector:getChildByPath(item_node, 'txt_power');
    txt_power:setText(equipItem:getpower())

    local txt_name = TFDirector:getChildByPath(item_node, 'txt_name');
    txt_name:setText(equipItem:getConfigName())

    local img_hasEquip = TFDirector:getChildByPath(item_node, 'img_equiped');
    local txt_equiped_name = TFDirector:getChildByPath(item_node, 'txt_equiped_name');

    img_hasEquip:setVisible(false);

    if (equipItem.equip and equipItem.equip ~= 0) then
        img_hasEquip:setVisible(true);

        local role = CardRoleManager:getRoleById(equipItem.equip)
        if role.isMainPlayer then
            txt_equiped_name:setText(MainPlayer.verticalName)
        else
            txt_equiped_name:setText(role.name)
        end
    end
    local img_star = {}
    for i=1,5 do
        img_star[i] = TFDirector:getChildByPath(item_node, "img_star_"..i)
        img_star[i]:setVisible(false)
        -- if i <= equipItem.tupoLevel then
        --     img_star:setVisible(true)
        -- else
        -- end
    end

    for i = 1, equipItem.tupoLevel do
        local starIdx = i
        local starTextrue = "ui_new/equipment/tjp_xingxing_icon.png"
        if i > 5 then
            starTextrue = "ui_new/equipment/tjp_xingxing2_icon.png"
            starIdx = i - 5
        end
        img_star[starIdx]:setTexture(starTextrue)
        img_star[starIdx]:setVisible(true)

    end

    
    local img_baoshicao1 = TFDirector:getChildByPath(item_node, "img_gembg1")
    local img_gem1 = TFDirector:getChildByPath(img_baoshicao1, "img_gem1")

    local img_baoshicao2 = TFDirector:getChildByPath(item_node, "img_gembg2")
    local img_gem2 = TFDirector:getChildByPath(img_baoshicao2, "img_gem2")

    img_baoshicao1:setVisible(false)
    img_baoshicao2:setVisible(false)
    img_gem1:setVisible(true)
    img_gem2:setVisible(true)

    if equipItem:getGemPos(1) and equipItem:getGemPos(1) ~= 0 then
        local gemId = equipItem:getGemPos(1)
        img_baoshicao1:setVisible(true)
        local item = ItemData:objectByID(gemId)
        img_gem1:setTexture(item:GetPath())
    end

    if equipItem:getGemPos(2) and equipItem:getGemPos(2) ~= 0 then
        local gemId = equipItem:getGemPos(2)
        img_baoshicao2:setVisible(true)
        local item = ItemData:objectByID(gemId)
        img_gem2:setTexture(item:GetPath())
    end
end

function BibleAccept.onBtnClose(sender)
    local self = sender.logic
	self.ui:runAnimation("Action1",1)
    self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
        self.parent:setAcceptId(self.accoptGmId)
        AlertManager:close()
        end)
end


function BibleAccept:removeUI()
   	self.super.removeUI(self)  
end

function BibleAccept:onShow()
    self.super.onShow(self)
    self.ui:runAnimation("Action0",1)
end

function BibleAccept:registerEvents()
	self.super.registerEvents(self)
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClose))
    self.btn_close.logic = self

    self.ui.logic = self
    self.ui:setTouchEnabled(true)
    --self.btn_shousuo:addMEListener(TFWIDGET_CLICK, audioClickfun(self.closeBtnClick))
    self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClose))
end

function BibleAccept:removeEvents()
	self.super.removeEvents(self)
end


function BibleAccept:dispose()
    self.super.dispose(self)
end

return BibleAccept

--endregion
