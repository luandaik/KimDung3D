local FengYunLuArmyLayer = class("FengYunLuArmyLayer", BaseLayer);

CREATE_SCENE_FUN(FengYunLuArmyLayer);
CREATE_PANEL_FUN(FengYunLuArmyLayer);

--[[
风云录挑战
]]

function FengYunLuArmyLayer:ctor(data)
    self.super.ctor(self,data);
    
    self:init("lua.uiconfig_mango_new.fengyunlu.FengYunLuArmy");
end


function FengYunLuArmyLayer:onShow()
    self.super.onShow(self)
    self:refreshUI();
end


function FengYunLuArmyLayer:initUI(ui)
    self.super.initUI(self,ui);
    --关卡选择
    self.bg_table      = TFDirector:getChildByPath(ui, 'panel_cardregional');
    self.btn_close =  TFDirector:getChildByPath(ui, "btn_close")
    self.button  = {}
    for i =1,9 do
        local role              = TFDirector:getChildByPath(ui, "panel_item"..i)
        role.img_zhenming       = TFDirector:getChildByPath(role, "img_zhenming")
        role.quality            = TFDirector:getChildByPath(role, "btn_icon"..i);
        role.bg                 = TFDirector:getChildByPath(role, "btn_icon"..i)
        role.bg:setVisible(false)
        role.bg.logic           = self
        role.icon               = TFDirector:getChildByPath(role.bg, "img_touxiang")
        role.img_zhiye          = TFDirector:getChildByPath(role.bg, "img_zhiye")
        role.bg.posIndex        = i;
        role.bg.hasRole         = false;
        self.button[i]          = role
    end
    self.btn_sx                 = TFDirector:getChildByPath(ui, "btn_sx")
    self.txt_num                = TFDirector:getChildByPath(ui, "txt_num")
    self.txt_shangzhenrenshu    = TFDirector:getChildByPath(ui, "txt_shangzhenrenshu")
    self.btn_skill              = TFDirector:getChildByPath(ui, "btn_skill")
    self.btn_skill_tips         = TFDirector:getChildByPath(ui, "btn_skill_tips")
    self.btn_skill_tips:setVisible(false)
end

function FengYunLuArmyLayer:updateIcon( role,index )
    if role then
        self.button[index].icon:setVisible(true);
        self.button[index].icon:setTexture(role:getHeadPath());

        self.button[index].bg:setVisible(true);
        self.button[index].quality:setTextureNormal(GetColorRoadIconByQuality(role.quality));

        self.button[index].img_zhiye:setVisible(true);
        self.button[index].img_zhiye:setTexture("ui_new/fight/zhiye_".. role.outline ..".png");

        -- self.button[index].img_quality:setTexture(GetArmyPicByQuality(role.quality));


        self.button[index].bg.hasRole = true;

        self.button[index].bg.roleId  = role.id;
        self.button[index].bg.roleid  = role.role_id;

    else
        self.button[index].img_zhiye:setVisible(false);
        -- self.button[index].img_quality:setVisible(false);
        self.button[index].icon:setVisible(false);
        self.button[index].bg:setVisible(false);    
  
        self.button[index].bg.hasRole = false;   
    end
end

function FengYunLuArmyLayer.cellClickHandle(sender)
    local self = sender.logic;
    local roleList = TFArray:new()
    roleList:clear()
    local selectIndex = 0
    if sender.isClick == true then

        for i=1 ,#self.roleList do
            local CardRole      = require('lua.gamedata.base.CardRole')
            local cardRole = CardRole:new(self.roleList[i].role_id)
            cardRole:setLevel(150)
            cardRole.attribute = {}

            local baseAttr = self.roleList[i]:getAttribute()
            local attribute = FengYunLuManager:updateAttribute(self.roleList[i].id,self.roleList[i].role_id,self.roleList[i].skill,self.roleList[i].passive_skill,self.roleList[i].skill_2,baseAttr)
            for i=1,(EnumAttributeType.Max-1) do
                cardRole.totalAttribute[i] = attribute[i] or 0
            end
            if sender.roleid == self.roleList[i].role_id then

                selectIndex = i
            end
            roleList:push(cardRole)
        end
        local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.RoleInfoLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
        layer:loadFengYunLuData(selectIndex, roleList)
        layer.bShowTuPu = true
        FengYunLuManager.isOpenFengYunLu = true
        AlertManager:show()
        play_press()
    end

end


function FengYunLuArmyLayer.cellTouchBeganHandle(cell)
    local self = cell.logic;
    if cell.hasRole ~= true then
        print(" == nil ")
        return;
    end

    cell.isClick = true;
    cell.isDrag  = false;
    self.isMove = false;

    -- self.offest = self.table_select:getContentOffset();

    self.onLongTouch = function(event)
        if self.isMove == false then
            return;
        end

        local pos = cell:getTouchMovePos();
          
        local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());
       
        if (v.x < 30 and v.y < 30 )  then

        else 
            self:removeLongTouchTimer();    
            if (v.x - v.y > -10) then
                cell.isDrag  = true;
                self.table_select:setTouchEnabled(false);
            else
                cell.isDrag  = false;
                self.table_select:setTouchEnabled(true);
            end
        end
    end;

    if (cell.posIndex == -1) then
        self:removeLongTouchTimer();
        self.longTouchTimerId = TFDirector:addTimer(0.001, -1, nil, self.onLongTouch); 
    end

end

function FengYunLuArmyLayer.cellTouchMovedHandle(cell)
    local self = cell.logic;
    self.isMove = true;

    if cell.hasRole ~= true then
        return;
    end

  
    local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());

    if (v.y < 30) then
        -- self.table_select:setContentOffset(self.offest );
    end

    local pos = cell:getTouchMovePos();

    if self.selectCussor == nil then
        if (cell.posIndex ~= -1 or cell.isDrag == true ) then
            self:createSelectCussor(cell,pos);
        end
    end

    if cell.isClick == true then
        return;
    end
    -- self.table_select:setContentOffset(self.offest );
    self:moveSelectCussor(cell,pos);
end
function FengYunLuArmyLayer:createSelectCussor(cell,pos)
    play_press();

    cell.isClick = false;

    self.lastPoint = pos;

    local role = FYRecordData:objectByID(cell.roleId);

    self.selectCussor = TFImage:create();
    self.selectCussor:setFlipX(true);
    self.selectCussor:setTexture(role:getHeadPath());
    self.selectCussor:setScale(20 / 15.0);
    self.selectCussor:setPosition(pos);
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);
   
    self.curIndex = cell.posIndex;
    
end

function FengYunLuArmyLayer:moveSelectCussor(cell,pos)
    local v = ccpSub(pos, self.lastPoint);
    self.lastPoint = pos;
    local scp = ccpAdd(self.selectCussor:getPosition(), v);
    self.selectCussor:setPosition(scp);
    self.selectCussor:setVisible(true);

    self.curIndex = nil;
    if  self.bg_table:hitTest(pos) then
        self.curIndex = -1;
    end
    for i=1,9 do
        if  self.button[i]:hitTest(pos) then
            self.curIndex = self.button[i].bg.posIndex;
            break;
        end
    end

end

function FengYunLuArmyLayer:releaseSelectCussor(cell,pos)
    if cell.isClick == false  then
        if (self.curIndex == nil) then
            return;
        end
        --返回信息
        local dargRole      = FengYunLuManager:getRoleByRoleIdinAllList(cell.roleId);
        --返回第几位

        local toReplaceRole = FengYunLuManager:getRoleIndexByRoleidinMyList(cell.roleId)
        --在阵中释放
        if (self.curIndex ~= -1) then 

            --从列表中拖到阵中
            if (cell.posIndex == -1) then
                
                --本来已经在阵中
                if toReplaceRole and toReplaceRole ~= 0 then
                    --且不是本角色目前所在的位置，做位置变更
                    self:ChangePos(toReplaceRole - 1,self.curIndex - 1)
                    play_buzhenyidong()
                else
                --要上阵，但是已经到达上限
                    -- if FengYunLuManager:getMyRoleListUpNum() == 5 then
                    --     toastMessage(localizable.common_function_number_out);  
                    --     return
                    -- end
                    --普通上阵
                    self:GoIntoBattle(cell.roleId, self.curIndex - 1)
                end
            --阵中操作，更换位置   
            else
                self:ChangePos(toReplaceRole - 1,self.curIndex - 1)
                play_buzhenyidong()
            end
            return;

        end

        --在右边列表释放
        if (self.curIndex == -1) then

            if (cell.posIndex == -1 ) then
                --放弃上阵，不做操作
            else
                --下阵
                self:OutBattle(cell.roleId)
                play_buzhenluoxia();
            end
        end
    end

    if cell:hitTest(pos) then     
        -- FengYunLuArmyLayer.cellClickHandle(cell);
    end
end
--上阵
function FengYunLuArmyLayer:GoIntoBattle(roid, Pos)
    FengYunLuManager:GoIntoBattle(roid, Pos)
end
-- 换位置
function FengYunLuArmyLayer:ChangePos(oldPos, newPos)
    FengYunLuManager:ChangePos(oldPos, newPos)
end
--下阵
function FengYunLuArmyLayer:OutBattle(roid)
    FengYunLuManager:OutBattle(roid)
end
function FengYunLuArmyLayer.cellTouchEndedHandle(cell)
    local self = cell.logic;
    if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end

    if cell.hasRole ~= true then
        return;
    end

    self:removeLongTouchTimer();

    local pos = cell:getTouchEndPos();

    self:releaseSelectCussor(cell,pos);
    self.table_select:setTouchEnabled(true);

end

function FengYunLuArmyLayer:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId);
        self.longTouchTimerId = nil;
    end
end

function FengYunLuArmyLayer:refreshUI()
    local armylist = FengYunLuManager:getMyRoleList()  
    for i= 1,9 do
        -- if armylist[i] and armylist[i] ~= 0 then
            local role = FYRecordData:getRoleinfoByid(armylist[i])
            self:updateIcon(role,i)
        -- end
    end
    if not self.table_select then
        self.roleList = FengYunLuManager:getAllRoleList()
        local  tableView   =  TFTableView:create();
        self.table_select  = tableView;
        tableView.logic    = self;
        tableView:setTableViewSize(self.bg_table:getContentSize());
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL);
        tableView:setVerticalFillOrder(0);

        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable);
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex);
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView);
        Public:bindScrollFun(tableView);
        self.bg_table:addChild(tableView,1);
        self.table_select:reloadData();
        self.table_select:scrollToYTop(0);
    else
        self:refreshTable();
    end
    self.txt_num:setText(FengYunLuManager:GetrefreshCount())             
    self.txt_shangzhenrenshu:setText(FengYunLuManager:getMyRoleListUpNum() .. "/5")    
end

function FengYunLuArmyLayer:refreshTable()
    if self.table_select == nil then
        return
    end
    
    self.roleList =FengYunLuManager:getAllRoleList()
    local tb_pos = self.table_select:getContentOffset();
    self.table_select:reloadData();
    local currentSize = self.table_select:getContentSize()
    local tabSize = self.table_select:getSize()
    tb_pos.y = math.max(tb_pos.y , tabSize.height - currentSize.height)
    self.table_select:setContentOffset(tb_pos);
end 

function FengYunLuArmyLayer.cellSizeForTable(tableView,idx)
    return 180,960
end

function FengYunLuArmyLayer.tableCellAtIndex(tableView, idx)
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
            local m_node = createUIByLuaNew("lua.uiconfig_mango_new.role.ArmyRoleItem");
            m_node.panel_empty = TFDirector:getChildByPath(m_node, 'panel_empty');
            m_node.panel_info = TFDirector:getChildByPath(m_node, 'panel_info');
            m_node:setName("m_role" .. i);
            m_node:setPosition(ccp(20 + 140 * (i - 1) ,0));

            item_node:addChild(m_node);
            item_node.m_node = m_node; 
        end
    end

    for i=1,3 do
        local roleIndex = idx*3 + i;

        local m_node = TFDirector:getChildByPath(cell.item_node, 'm_role' .. i);
        local roleItem = self.roleList[roleIndex]
        if  roleItem then
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(true);
            self:loadItemNode(m_node,roleItem);
        else
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(false);
        end

    end

    return cell
end

--添加玩家节点
function FengYunLuArmyLayer:loadItemNode(item_node,roleItem)
    -- CommonManager:setRedPoint( item_node.panel_info, CardRoleManager:isCanStarUp(roleItem.gmId),"isCanStarUp",ccp(item_node:getSize().width/2,item_node:getSize().height/2))
    -- CommonManager:setRedPoint( item_node.panel_info, CardRoleManager:isCanBreakUp(roleItem.gmId),"isCanBreakUp",ccp(item_node:getSize().width/2,item_node:getSize().height/2))
    
    local btn_icon = TFDirector:getChildByPath(item_node, 'btn_pingzhianniu');
    btn_icon.logic = self;
    -- btn_icon:setTag(roleItem.gmId);

    btn_icon:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle);
    btn_icon:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
    btn_icon:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
    btn_icon:addMEListener(TFWIDGET_CLICK,  self.cellClickHandle);

    btn_icon.posIndex = -1;  
    btn_icon.hasRole = true;  
    btn_icon.roleId  = roleItem.id;
    btn_icon.roleid  = roleItem.role_id;

    local img_icon = TFDirector:getChildByPath(item_node, 'img_touxiang');

    img_icon:setTexture(roleItem:getIconPath());
    local img_pinzhiditu = TFDirector:getChildByPath(item_node, 'img_pinzhiditu');
    img_pinzhiditu:setTexture(GetColorIconByQuality(roleItem.quality));


    local txt_name = TFDirector:getChildByPath(item_node, 'txt_name');

    txt_name:setText(roleItem.name);


    local img_zhiye = TFDirector:getChildByPath(item_node, 'img_zhiye');
    img_zhiye:setTexture("ui_new/fight/zhiye_".. roleItem.outline ..".png");

    local img_quality = TFDirector:getChildByPath(item_node, 'img_quality');

    img_quality:setVisible(false)

    local img_fight = TFDirector:getChildByPath(item_node, 'img_zhan');
    local bool = FengYunLuManager:getRoleIndexByRoleidinMyList(roleItem.id) 
    if bool then
        img_fight:setVisible(true);
    else
        img_fight:setVisible(false);
    end
    --添加助战标识
    local img_zhu = TFDirector:getChildByPath(item_node, 'img_zhu')
    img_zhu:setVisible(false)

    local txt_level = TFDirector:getChildByPath(item_node, 'txt_lv_word');
    txt_level:setText(roleItem.level);

end
function FengYunLuArmyLayer.numberOfCellsInTableView(tableView)
    local self = tableView.logic;
    return math.max(math.ceil(#self.roleList /3)  ,3);
end
function FengYunLuArmyLayer.onGoClickHandle(sender)
    local self = sender.logic;

end

function FengYunLuArmyLayer:removeUI()
    self.super.removeUI(self);
    
end

function FengYunLuArmyLayer:registerEvents()
    self.super.registerEvents(self);
    -- ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

        for i=1,9 do
        self.button[i].bg:addMEListener(TFWIDGET_CLICK,  self.cellClickHandle,1);
        self.button[i].bg:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle,1);
        self.button[i].bg:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
        self.button[i].bg:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
    end
    -- self.btn_lszr:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAttackClickHandle),1)
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.CloseClckHandle),1)
    self.btn_sx:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClickupdateHeropool),1)

    self.btn_skill.logic = self
    self.btn_skill:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSkillBtnClick),1)

    self.refreshlist = function(event)
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(FengYunLuManager.WIND_RECORD_WARSIDE_CONFIG_RESULT, self.refreshlist)

    self.refreshText = function(event)
        self.txt_num:setText(FengYunLuManager:GetrefreshCount())             
    end

    TFDirector:addMEGlobalListener(FengYunLuManager.BUY_COUNT, self.refreshText)
end
function FengYunLuArmyLayer:CloseClckHandle(sender)
    local num = FengYunLuManager:getMyRoleListUpNum()
    if num < 5 then
        CommonManager:showOperateSureLayer(function()
           AlertManager:close();
        end,
        nil,
        {
            msg = localizable.FengYunLu_tips3,
        })
    else
        AlertManager:close();
    end
    
end
function FengYunLuArmyLayer:onSkillBtnClick(sender)
    CustomSkillAiManage:openCustomSkillAiLayer(EnumFightStrategyType.StrategyType_FengYunLu1 + FengYunLuManager.day - 1)
end
function FengYunLuArmyLayer:onBtnClickupdateHeropool()
    FengYunLuManager:sendUpdataHeroPool()
end

function FengYunLuArmyLayer:removeEvents()
    self.super.removeEvents(self);

    TFDirector:removeMEGlobalListener(FengYunLuManager.WIND_RECORD_WARSIDE_CONFIG_RESULT, self.refreshlist)
    self.refreshlist = nil

    TFDirector:removeMEGlobalListener(FengYunLuManager.BUY_COUNT, self.refreshText)
    self.refreshText = nil
end
function FengYunLuArmyLayer:dispose()
    self.super.dispose(self)
end

return FengYunLuArmyLayer;
