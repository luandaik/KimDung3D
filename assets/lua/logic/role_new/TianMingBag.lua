-- client side TianMingBag.lua
--[[
 * @Description: 天命背包图层
 ]]
-- script writer chikui
-- creation time 2016-05-26

local TianMingBag = class("TianMingBag", BaseLayer)

function TianMingBag:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.role_new.TianMingBag")

end

function TianMingBag:initUI(ui)
	self.super.initUI(self,ui)
    self.btn_close          = TFDirector:getChildByPath(ui, 'btn_close')
    self.panel_tableView    = TFDirector:getChildByPath(ui, 'panel_tableView')
    self.img_empty          = TFDirector:getChildByPath(ui, 'img_empty')
    self.Panel_equipment    = TFDirector:getChildByPath(ui, 'Panel_equipment')
    self.img_pinzhiditu     = TFDirector:getChildByPath(ui, 'img_pinzhiditu')
    self.img_touxiang       = TFDirector:getChildByPath(ui, 'img_touxiang')
    self.txt_name           = TFDirector:getChildByPath(ui, 'txt_name')
    self.txt_lv             = TFDirector:getChildByPath(ui, 'txt_lv')
    self.txt_exp            = TFDirector:getChildByPath(ui, 'txt_exp')
    self.btn_fenjie         = TFDirector:getChildByPath(ui, 'btn_fenjie')
    self.btn_yjsj           = TFDirector:getChildByPath(ui, 'btn_yjsj')
    self.panel_star         = TFDirector:getChildByPath(ui, 'panel_star')
    self.txt_starlv         = TFDirector:getChildByPath(self.panel_star, 'txt_starlv')
    self.panel_star:setVisible(false)

    self.img_jingyantiao    = TFDirector:getChildByPath(ui, 'img_jingyantiao')
    self.panel_jindutiao    = TFDirector:getChildByPath(self.img_jingyantiao, 'panel_jindutiao')
    self.bar_percent        = TFDirector:getChildByPath(self.panel_jindutiao, 'bar_percent')

    self.panel_sx          = TFDirector:getChildByPath(ui, 'panel_sx')
    self.txt_attr = {}
    for i = 1, 6 do
        local img_attr      = TFDirector:getChildByPath(self.panel_sx, 'img_attr'..i)
        img_attr.txt_name   = TFDirector:getChildByPath(img_attr, 'txt_name')
        img_attr.txt_base   = TFDirector:getChildByPath(img_attr, 'txt_base')
        img_attr:setVisible(false)
        self.txt_attr[i]    = img_attr
    end
    self.TianMingList = {}
    self.TianMingList = TianMingManager.EmptyTianMingList
    self.selectEquipItem = self.TianMingList:objectAt(1)
    self:refreshUI()
    self.fenjietype = false
    self.MaxNumTianMing = ConstantData:objectByID("Destinygrade").value
end
function TianMingBag:refreshUI()
    if self.table_select == nil then
        local tableView   =  TFTableView:create();
        self.table_select  = tableView;
    
        self.table_select.logic    = self;
        self.table_select:setTableViewSize(self.panel_tableView:getContentSize());
        self.table_select:setDirection(TFTableView.TFSCROLLVERTICAL);
        self.table_select:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN);
    
        self.table_select:addMEListener(TFTABLEVIEW_SIZEFORINDEX, TianMingBag.cellSizeForTable);
        self.table_select:addMEListener(TFTABLEVIEW_SIZEATINDEX, TianMingBag.tableCellAtIndex);
        self.table_select:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, TianMingBag.numberOfCellsInTableView);
        self.panel_tableView:addChild(self.table_select);
    end
    self.table_select:reloadData()
    self:refreshLeftInfo(); 
end

function TianMingBag.cellSizeForTable(tableView,idx)
    return 110,429
end
local column = 4
local row = 5
function TianMingBag.tableCellAtIndex(tableView, idx)
    local self = tableView.logic;
    local cell = tableView:dequeueCell()

    if nil == cell then
        tableView.cells = tableView.cells or {}
        cell = TFTableViewCell:create()
        tableView.cells[cell] = true

        local item_node = TFPanel:create();
        cell:addChild(item_node);
        cell.item_node = item_node;

        for i=1,column do
            local m_node = createUIByLuaNew("lua.uiconfig_mango_new.role_new.TianMingBagCell");
            m_node.panel_empty = TFDirector:getChildByPath(m_node, 'panel_empty');
            m_node.panel_info = TFDirector:getChildByPath(m_node, 'panel_info');
            local size = m_node:getSize()
            local x = size.width*(i-1) + 10
            if i > 1 then
                x = x + (i-1)*15
            end
            m_node:setName("m_equip" .. i)
            m_node:setPosition(ccp(x,0))
            item_node:addChild(m_node)
            item_node.m_node = m_node 
        end
    end
   
    for i=1,column do
        local index = idx*column + i;
        local m_node = TFDirector:getChildByPath(cell.item_node, 'm_equip' .. i);
        local equipItem = self.TianMingList:objectAt(index);
        if  equipItem then
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(true);
            self:loadItemNode(m_node,equipItem,index);
        else
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(false);
        end
    end

    return cell
end
function TianMingBag.numberOfCellsInTableView(table)
    local self = table.logic
    if self.TianMingList and self.TianMingList:length() > 0 then
        local num = math.ceil(self.TianMingList:length()/column)
        if num < row then
            return row
        end

        return num
    end
    return row
end
function TianMingBag:loadItemNode(item_node,equipItem,index)

    local btn_icon = TFDirector:getChildByPath(item_node, 'btn_node');
    btn_icon.logic = self;
    btn_icon.instanceId = equipItem.instanceId;

    btn_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCellClickHandle,play_xuanze));

    local img_xuanzhong = TFDirector:getChildByPath(btn_icon, 'img_selected_fg');
    local panel_star    = TFDirector:getChildByPath(btn_icon, 'panel_star')
    if self.selectEquipItem and self.selectEquipItem.instanceId == equipItem.instanceId then
        img_xuanzhong:setVisible(true);
        self.selectEquipItem.img_xuanzhong = img_xuanzhong; 
        self:refreshLeftInfo();
    else
        img_xuanzhong:setVisible(false);
    end

    local img_icon      = TFDirector:getChildByPath(btn_icon, 'img_icon');
    img_icon:setTexture(equipItem.config:GetPath());

    btn_icon:setTextureNormal(GetColorIconByQuality_82(equipItem.quality));
    local img_soul = TFDirector:getChildByPath(btn_icon, 'img_soul1')
    local txt_lv = TFDirector:getChildByPath(btn_icon, 'txt_lv')
    if equipItem.level < 1 then
        img_soul:setVisible(false)
    else
        img_soul:setVisible(true)
    end
    txt_lv:setText(equipItem.level)
    local txt_starlv = TFDirector:getChildByPath(btn_icon, 'txt_starlv')
    local img_star = TFDirector:getChildByPath(btn_icon, 'img_star')
    if equipItem.starnum > 0 or equipItem.starLevel > 0 then
        img_star:setVisible(true)
        txt_starlv:setVisible(true)
        txt_starlv:setText(equipItem.starnum)
    else
        img_star:setVisible(false)
        txt_starlv:setVisible(false)
    end
    
end
function TianMingBag.onCellClickHandle(sender) 
    local self = sender.logic;

    local equipGmId = sender.instanceId;
    local equipItem = TianMingManager:getTianMingByGmId(equipGmId);  

    if not equipItem then
        return
    end

    if self.selectEquipItem and self.selectEquipItem.img_xuanzhong then
        self.selectEquipItem.img_xuanzhong:setVisible(false);
    end

    local img_xuanzhong = TFDirector:getChildByPath(sender, 'img_selected_fg');
    img_xuanzhong:setVisible(true);
    self.selectEquipItem = equipItem;
    self.selectEquipItem.img_xuanzhong = img_xuanzhong;

    self:refreshLeftInfo(); 
end
function TianMingBag:refreshLeftInfo()
    if next(self.TianMingList) == nil or self.TianMingList:length() < 1 then
        self.img_empty:setVisible(true)
    else
        self.img_empty:setVisible(false)
    end
    if self.selectEquipItem then
        local equipItem = TianMingManager:getTianMingByGmId(self.selectEquipItem.instanceId);
        if equipItem then
            self.Panel_equipment:setVisible(true)
            self.panel_sx:setVisible(true)
            self.btn_fenjie:setVisible(true)
            self.btn_yjsj:setVisible(true)
            self.panel_star:setVisible(false)
           
            self.img_pinzhiditu:setTexture(GetColorIconByQuality_118(equipItem.quality))
            self.img_touxiang:setTexture(equipItem.config:GetPath())
            self.txt_name:setText(equipItem.config.name)
            self.txt_lv:setText(equipItem.level)
            --镶星
            if equipItem.starnum > 0 or equipItem.starLevel > 0  then
                self.panel_star:setVisible(true)
                self.txt_starlv:setText(equipItem.starnum)
            end

            local num = equipItem.level
            local num1 = self.MaxNumTianMing
            if num >= 100 then
                self.btn_yjsj:setTextureNormal("ui_new/tianming/btn_ymj.png")
                self.btn_yjsj:setGrayEnabled(true)
                self.btn_yjsj:setTouchEnabled(false)
            else
                self.btn_yjsj:setTextureNormal("ui_new/tianming/btn_yjsj_xiao.png")
                self.btn_yjsj:setGrayEnabled(false)
                self.btn_yjsj:setTouchEnabled(true) 
            end
            local expnum = DesTinyExpData:getExpBylevelandQuality(equipItem.level,equipItem.quality)
            self.bar_percent:setPercent(equipItem.exp/expnum*100)
            self.txt_exp:setText(equipItem.exp.."/"..expnum)
            local attribute = equipItem.totalAttribute.attribute
            for i=1,6 do
                self.txt_attr[i]:setVisible(false)
            end
            local i = 1
            for k,v in pairs(attribute) do
                if i <= 6 then
                    self.txt_attr[i]:setVisible(true)
                    if k == 44 or k == 41 or k == 42 or k == 40 then 
                        if v < 0 then
                            self.txt_attr[i].txt_name:setText(localizable.TianMingAttributeTypeStr[k]..localizable.TianMing_tips10)
                            self.txt_attr[i].txt_base:setText("+"..math.abs(v/100) .."%")
                        else
                            self.txt_attr[i].txt_name:setText(localizable.TianMingAttributeTypeStr[k]..localizable.TianMing_tips9)
                            self.txt_attr[i].txt_base:setText("+"..v/100 .."%")
                        end
                    else
                        self.txt_attr[i].txt_name:setText(localizable.TianMingAttributeTypeStr[k])
                        if k <= 15 then
                            self.txt_attr[i].txt_base:setText("+"..v)
                        else
                            self.txt_attr[i].txt_base:setText("+"..v/100 .."%")
                        end
                    end
                    i = i + 1
                end
            end
            if (equipItem.config.special_equipment == 1) then
                self.btn_fenjie:setVisible(false)
                if (self.txt_attr[1] and self.txt_attr[1]:isVisible() == false) then
                    self.txt_attr[1].txt_base:setText("+"..(equipItem.config.price + equipItem.exp))
                    self.txt_attr[1]:setVisible(true)
                    self.txt_attr[i].txt_name:setText(localizable.TianMingBag_tips)
                end
            end
        end
    else
        self.Panel_equipment:setVisible(false)
        self.panel_sx:setVisible(false)
        self.btn_fenjie:setVisible(false)
        self.btn_yjsj:setVisible(false)
    end

end
function TianMingBag.TianMingfenjie(sender)
    -- local self = sender.logic
    -- if self.selectEquipItem.quality >= 4 then
    --      CommonManager:showOperateSureLayer(function()
    --        TianMingManager:sendExLoadDestiny(self.selectEquipItem.instanceId)
    --        self.fenjietype = true
    --     end,
    --     nil,
    --     {
    --         msg = localizable.TianMing_tips4,
    --     })
    --     return true
    -- end
    -- self.index = 1
    -- self.fenjietype = true
    -- TianMingManager:sendExLoadDestiny(self.selectEquipItem.instanceId)
    TianMingManager:openTianMingFenJie()
end
function TianMingBag.TianMingDevour(sender)
    local self = sender.logic
    CommonManager:showOperateSureTipRefreshLayer(
            function(data,widget)
                TianMingManager:sendBreachAllDestiny(self.selectEquipItem.instanceId,self:getHasTip(widget)) 
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
function TianMingBag:getHasTip( widget )
    local state = widget:getSelectedState();
    if state == true then
        return true
    else
        return false
    end
end
function TianMingBag:registerEvents()
    self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
    self.btn_fenjie.logic = self
    self.btn_fenjie:addMEListener(TFWIDGET_CLICK, audioClickfun(self.TianMingfenjie),1)
    self.btn_yjsj.logic = self
    self.btn_yjsj:addMEListener(TFWIDGET_CLICK, audioClickfun(self.TianMingDevour),1)
    self.refreshTianMingList = function(event)
        self.TianMingList = TianMingManager.EmptyTianMingList  
        if self.fenjietype == true then
            self.fenjietype = false
            self.selectEquipItem = self.TianMingList:objectAt(1)
        end
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(TianMingManager.RefreshTianMingList, self.refreshTianMingList)
end
function TianMingBag:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(TianMingManager.RefreshTianMingList, self.refreshTianMingList)
    self.refreshTianMingList = nil
end
function TianMingBag:removeUI()
    self.super.removeUI(self)
end

function TianMingBag:dispose()
    self.super.dispose(self)
end
-----断线重连支持方法
function TianMingBag:onShow()
    self.super.onShow(self)
    self.TianMingList = TianMingManager.EmptyTianMingList
    self.selectEquipItem = self.TianMingList:objectAt(1)
    self:refreshUI()
end
return TianMingBag