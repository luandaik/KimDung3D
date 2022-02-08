--[[
******布阵*******

    -- by Stephen.tao
    -- 2013/12/05

    -- by haidong.gan
    -- 2014/4/10
]]

local IslandArmyLayer = class("IslandArmyLayer", BaseLayer);

CREATE_SCENE_FUN(IslandArmyLayer);
CREATE_PANEL_FUN(IslandArmyLayer);

IslandArmyLayer.LIST_ITEM_HEIGHT = 173; 

function IslandArmyLayer:ctor(data)
    self.super.ctor(self,data);
    self.guideRolePos = 0
    self.guideCurrPos = 0
    self.guideChangePos = 0
    self.canOpenInfo = true
    self.fightType = EnumFightStrategyType.StrategyType_PVE
    self:init("lua.uiconfig_mango_new.role.ArmyLayer")
end

function IslandArmyLayer:onShow()
    self.super.onShow(self)
    self.lastPoint   = nil;
    self.curIndex    = nil;
    self:refreshBaseUI();
    self:refreshUI();
    
    self.btn_skill_tips:setVisible(CustomSkillAiManage:checkShowTipsIcon( self.currLineUpType ))

    if self.assistFightView then
        self.assistFightView:onShow()
    end
    Public:addZhenFaIconForArmy(self.zhenfaNode, self.currLineUpType)
end

function IslandArmyLayer:refreshBaseUI()
    if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end
    self.isAutoIng = false;
    self:removeLongTouchTimer();
end

function IslandArmyLayer:refreshUI()
    if not self.isShow then
        return;
    end
    self.isAutoIng = false;

    local  armylist = StrategyManager:getList()
    for pos in pairs(armylist) do
        self:updateIcon(pos)
    end
    self:updateStrategyBaseMsg();

    if not self.table_select then
        self.roleList = ZhengbaManager:getSortStrategy(self.currLineUpType,self.currSortType)
        local  tableView   =  TFTableView:create();
        self.table_select  = tableView;

        tableView.logic    = self;
        tableView:setTableViewSize(self.bg_table:getContentSize());
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL);
        tableView:setVerticalFillOrder(0);

        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable);
        tableView:addMEListener(TFTABLEVIEW_SCROLL, self.scrollForTable);
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex);
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView);
        Public:bindScrollFun(tableView);
        self.bg_table:addChild(tableView,1);
        self.table_select:reloadData();
        self.table_select:scrollToYTop(0);
    else
        self:refreshTable();
    end
end

function IslandArmyLayer:updateStrategyBaseMsg()
    -- CardRoleManager:refreshAllRolePower()

    self.txt_RoleNum:setText(StrategyManager:getFightRoleNum() .. "/" .. StrategyManager:getMaxNum());
    self.txt_power:setText(StrategyManager:getPower());
end

function IslandArmyLayer:initUI(ui)
	self.super.initUI(self,ui);

    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');

    self.txt_RoleNum = TFDirector:getChildByPath(ui, 'txt_shangzhenrenshu');
    self.txt_power   = TFDirector:getChildByPath(ui, 'txt_zhanlizhi_word');
    self.btn_auto    = TFDirector:getChildByPath(ui, 'btn_yijianshangzhen');

    -- self.currLineUpType = LineUpType.LineUp_Main
    self.currLineUpType = EnumFightStrategyType.StrategyType_PVE

    local titleTexture = "ui_new/array/img_jingong.png"

    self.assistFightView = CommonManager:addAssistFightView(self,self.currLineUpType)
    self.assistFightView:setName("assistFightView")
    
    self.zhenfaNode = TFDirector:getChildByPath(ui, "panel_buzhen")

    self.button = {};
    for i=1,9 do
        local btnName = "panel_item" .. i;
        self.button[i] = TFDirector:getChildByPath(ui, btnName);

        btnName = "btn_icon"..i;
        self.button[i].bg = TFDirector:getChildByPath(ui, btnName);
        self.button[i].bg:setVisible(false);

        self.button[i].icon = TFDirector:getChildByPath(self.button[i].bg ,"img_touxiang");
        self.button[i].icon:setVisible(false);
        -- self.button[i].icon:setFlipX(true);

        self.button[i].quality  = TFDirector:getChildByPath(ui, btnName);
        self.button[i].img_zhiye = TFDirector:getChildByPath(self.button[i], "img_zhiye");
        self.button[i].img_zhiye:setVisible(false);
        self.button[i].img_quality = TFDirector:getChildByPath(self.button[i], "img_quality");
        self.button[i].img_quality:setVisible(false)

        self.button[i].bg.logic = self;
        self.button[i].bg.posIndex = i;
        self.button[i].bg.hasRole = false;

        self.button[i].logic = self;
        self.button[i].posIndex = i;
        self.button[i].hasRole = false;
    end

    self.bg_table      = TFDirector:getChildByPath(ui, 'panel_cardregional');

    self.btn_sort            = TFDirector:getChildByPath(ui, 'btn_xiala');
    self.btn_sort_pos        = TFDirector:getChildByPath(ui, 'btn_zhuangbei');
    self.btn_sort_power      = TFDirector:getChildByPath(ui, 'btn_zhanli');
    self.btn_sort_quality    = TFDirector:getChildByPath(ui, 'btn_pinzhi');
    self.img_select          = TFDirector:getChildByPath(ui, 'img_select');

    self.img_quality_select          = TFDirector:getChildByPath(ui, 'btn_pinzhi-press');
    self.img_power_select          = TFDirector:getChildByPath(ui, 'btn_zhanli-press');
    
    self.bg_sort             = TFDirector:getChildByPath(ui, 'panel_bg');  
    -- self.bg_sort:setSwallowTouch(false);
    self.node_menu           = TFDirector:getChildByPath(ui, 'panel_menu');
    self.groupButtonManager  = GroupButtonManager:new( {[1] = self.btn_sort_power, [2] = self.btn_sort_quality});
    
    self.groupButtonManager:selectBtn(self.btn_sort_quality);


    self.img_title = TFDirector:getChildByPath(ui, 'img_title')
    self.img_title:setTexture(titleTexture)
    -- CardRoleManager:setSortStrategyForQuality();

    self.img_quality_select:setVisible(false);
    self.img_power_select:setVisible(false);

    self.node_menu:setVisible(false);
    self.btn_sort:setVisible(true);

    self.btn_equipchange = TFDirector:getChildByPath(ui, 'Button_ArmyLayer_1');
    self.img_point = TFDirector:getChildByPath(ui, 'img_point');

    self.currSortType = CardRoleManager:getSortType() or ZhengbaManager.sortByQuality
    if self.currSortType == ZhengbaManager.sortByPower then
        self.img_power_select:setVisible(true);
    elseif self.currSortType == ZhengbaManager.sortByQuality then
        self.img_quality_select:setVisible(true);
    end

    self.btn_skill = TFDirector:getChildByPath(ui, "btn_skill")
    self.btn_skill.logic = self
    self.btn_skill_tips = TFDirector:getChildByPath(ui, "btn_skill_tips")
    self.btn_skill_tips:setVisible(CustomSkillAiManage:checkShowTipsIcon( self.currLineUpType ))
end
function IslandArmyLayer.onShowSortMenuClickHandle(sender)
    local self = sender.logic;
    self.node_menu:setVisible(not self.node_menu:isVisible());

    -- self.btn_sort:setVisible(false);
end
function IslandArmyLayer.onSortSelectClickHandle(sender)
    local self = sender.logic;

    self.node_menu:setVisible(false);
    -- self.btn_sort:setVisible(true);

    if (self.groupButtonManager:getSelectButton() == sender) then
       return;
    end

    self.img_quality_select:setVisible(false);
    self.img_power_select:setVisible(false);

   if sender == self.btn_sort_pos then
        -- CardRoleManager:setSortStrategyForPos();
        self.img_power_select:setVisible(true);
   elseif sender == self.btn_sort_power then
        -- CardRoleManager:setSortStrategyForPower();
        self.img_power_select:setVisible(true);
        self.currSortType = ZhengbaManager.sortByPower
   elseif sender == self.btn_sort_quality then
        -- CardRoleManager:setSortStrategyForQuality();
        self.img_quality_select:setVisible(true);
        self.currSortType = ZhengbaManager.sortByQuality
   end

   self.groupButtonManager:selectBtn(sender);
   self:refreshTable();
end

function IslandArmyLayer.onSortCancelClickHandle(sender)
    local self = sender.logic;
    self.node_menu:setVisible(false);
    self.btn_sort:setVisible(true);
end


function IslandArmyLayer.scrollForTable(tableView)
    local self = tableView.logic;
    -- self:removeLongTouchTimer();
end

function IslandArmyLayer.cellSizeForTable(tableView,idx)
    return IslandArmyLayer.LIST_ITEM_HEIGHT,960
end

function IslandArmyLayer.tableCellAtIndex(tableView, idx)
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
            local m_node = createUIByLuaNew("lua.uiconfig_mango_new.bloodybattle.BloodybattleArmyRoleItem");
            -- m_node.panel_empty = TFDirector:getChildByPath(m_node, 'panel_empty');
            -- m_node.panel_info = TFDirector:getChildByPath(m_node, 'panel_info');
            -- m_node:setName("m_role" .. i);
            -- m_node:setPosition(ccp(20 + 140 * (i - 1) ,0));

            m_node.panel_empty = TFDirector:getChildByPath(m_node, 'panel_empty');
            m_node.panel_info  = TFDirector:getChildByPath(m_node, 'panel_info');
            m_node.bar_xuetiao = TFDirector:getChildByPath(m_node, 'bar_xuetiao');
            m_node.img_xuetiao = TFDirector:getChildByPath(m_node, 'img_xuetiao');
            m_node.img_xuetiao:setVisible(false)
            m_node:setName("m_role" .. i);
            m_node:setPosition(ccp(20 + 140 * (i - 1) ,0));

            item_node:addChild(m_node);
            item_node.m_node = m_node; 
        end
    end

    for i=1,3 do
        local roleIndex = idx*3 + i;

        local m_node = TFDirector:getChildByPath(cell.item_node, 'm_role' .. i);
        local roleId = self.roleList:objectAt(roleIndex);
        local roleItem = CardRoleManager:getRoleById(roleId)

        if  roleItem then
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(true);
            self:loadItemNode(m_node,roleItem);
        else
            m_node.panel_empty:setVisible(true);
            m_node.panel_info:setVisible(false);
        end

        -- if roleItem and roleItem.pos ~= nil and roleItem.pos > 0 then
        --     local redstate = CardRoleManager:checkRoleCanStronger(roleItem)
        --     CommonManager:setRedPoint(m_node, redstate,"isHaveBook", ccp(70, 80))
        -- else
        --     CommonManager:setRedPoint(m_node, false,"isHaveBook", ccp(70, 80))
        -- end
    end

    return cell
end

function IslandArmyLayer.numberOfCellsInTableView(tableView)
    local self = tableView.logic;
    return math.max(math.ceil(self.roleList:length()/3)  ,3);
end

function IslandArmyLayer:loadData(sec)
    self.sec = sec
end

function IslandArmyLayer:setGuideMode(rolePos)
    self.guideRolePos = rolePos
    if rolePos > 0 then
        self.table_select:setInertiaScrollEnabled(false)
    else
        self.table_select:setInertiaScrollEnabled(true)
    end
end

--添加玩家节点
function IslandArmyLayer:loadItemNode(item_node,roleItem)
    
    local btn_icon = TFDirector:getChildByPath(item_node, 'btn_pingzhianniu');
    btn_icon.logic = self;
    btn_icon:setTag(roleItem.gmId);

    btn_icon:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle);
    btn_icon:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
    btn_icon:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
    btn_icon:addMEListener(TFWIDGET_CLICK,  self.cellClickHandle);

    btn_icon.posIndex = -1;  
    btn_icon.hasRole = true;  
    btn_icon.gmId  = roleItem.gmId;
    btn_icon.roleId  = roleItem.id;

    local img_icon = TFDirector:getChildByPath(item_node, 'img_touxiang');

    -- img_icon:setTexture(roleItem:getHeadPath());
    img_icon:setTexture(roleItem:getIconPath());
    local img_quality = TFDirector:getChildByPath(item_node, 'img_pinzhiditu');
    img_quality:setTexture(GetColorIconByQuality(roleItem.quality));
    -- img_quality:setTexture(GetRoleBgByWuXueLevel(roleItem.martialLevel));


    local txt_name = TFDirector:getChildByPath(item_node, 'txt_name');
    local roleStar = ""
    if roleItem.starlevel > 0 then
        roleStar = roleStar .. " +" .. roleItem.starlevel
    end
    txt_name:setText(roleItem.name..roleStar);

    -- txt_name:setColor(GetColorByQuality(roleItem.quality))

    local img_zhiye = TFDirector:getChildByPath(item_node, 'img_zhiye');
    img_zhiye:setTexture("ui_new/fight/zhiye_".. roleItem.outline ..".png");



    local img_fight = TFDirector:getChildByPath(item_node, 'img_zhan');
    local role_pos = ZhengbaManager:getIndexByRole(self.fightType,roleItem.gmId )
    if role_pos and role_pos ~= 0 then
        img_fight:setVisible(true);
    else
        img_fight:setVisible(false);
    end
    --添加助战标识
    local img_zhu = TFDirector:getChildByPath(item_node, 'img_zhu')
    if AssistFightManager:isInAssist( self.currLineUpType, roleItem.gmId ) then
        img_zhu:setVisible(true)
    else
        img_zhu:setVisible(false)
    end
    
    local txt_level = TFDirector:getChildByPath(item_node, 'txt_lv_word');
    txt_level:setText(roleItem.level);

    item_node.img_xuetiao:setVisible(true)

    local img_wuxuelevel = TFDirector:getChildByPath(item_node, 'img_wuxuelevel');
    img_wuxuelevel:setTexture(GetFightRoleIconByWuXueLevel(roleItem.martialLevel))

-----------------------------------------------------------
------wukkey
    local temp = JapanIslandManager.enemyList[self.sec.chapId] or {}
    local leftData = temp.data or {}

    local function getCurHp(insId)
        for _, v in pairs(leftData) do
            if v.instanceId == insId then
                return v.hp
            end
        end
        return nil
    end

    local role = roleItem
    local hpMax = role:getTotalAttribute(1)
    local hpNow = getCurHp(role.gmId)
    hpNow = hpNow or hpMax
    local per = math.floor(hpNow / hpMax * 100)
    local maxHp = 100--role.blood_maxHp
    local curHp = math.min(per, 100)

    --local maxHp = roleItem.blood_maxHp
    --local curHp = roleItem.blood_curHp
    item_node.bar_xuetiao:setPercent(curHp / maxHp * 100)

    local bGray = false
    if curHp <= 0 then
        bGray = true
    end
    img_icon:setGrayEnabled(bGray)

end

--添加玩家节点
function IslandArmyLayer:loadItemNode1(item_node,roleItem)
    -- CommonManager:setRedPoint( item_node.panel_info, CardRoleManager:isCanStarUp(roleItem.gmId),"isCanStarUp",ccp(item_node:getSize().width/2,item_node:getSize().height/2))
    -- CommonManager:setRedPoint( item_node.panel_info, CardRoleManager:isCanBreakUp(roleItem.gmId),"isCanBreakUp",ccp(item_node:getSize().width/2,item_node:getSize().height/2))
    
    local btn_icon = TFDirector:getChildByPath(item_node, 'btn_pingzhianniu');
    btn_icon.logic = self;
    btn_icon:setTag(roleItem.gmId);

    btn_icon:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle);
    btn_icon:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
    btn_icon:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
    btn_icon:addMEListener(TFWIDGET_CLICK,  self.cellClickHandle);

    btn_icon.posIndex = -1;  
    btn_icon.hasRole = true;  
    btn_icon.gmId  = roleItem.gmId;

    local img_icon = TFDirector:getChildByPath(item_node, 'img_touxiang');

    -- img_icon:setTexture(roleItem:getHeadPath());
    img_icon:setTexture(roleItem:getIconPath());
    local img_pinzhiditu = TFDirector:getChildByPath(item_node, 'img_pinzhiditu');
    img_pinzhiditu:setTexture(GetColorIconByQuality(roleItem.quality));
    -- img_pinzhiditu:setTexture(GetRoleBgByWuXueLevel(roleItem.martialLevel));

    local txt_name = TFDirector:getChildByPath(item_node, 'txt_name');
    -- txt_name:setText(roleItem.name);
    local roleStar = ""
    if roleItem.starlevel > 0 then
        roleStar = roleStar .. " +" .. roleItem.starlevel
    end
    txt_name:setText(roleItem.name..roleStar);

    -- txt_name:setColor(GetColorByQuality(roleItem.quality))

    local img_zhiye = TFDirector:getChildByPath(item_node, 'img_zhiye');
    img_zhiye:setTexture("ui_new/fight/zhiye_".. roleItem.outline ..".png");

    local img_quality = TFDirector:getChildByPath(item_node, 'img_quality');
    -- img_quality:setVisible(false)
    -- img_quality:setTexture(GetArmyPicByQuality(roleItem.quality));
    -- local roleM = 1
    img_quality:setTexture(GetFightRoleIconByWuXueLevel(roleItem.martialLevel))

    local img_fight = TFDirector:getChildByPath(item_node, 'img_zhan');

    local inStra = StrategyManager:isInMainStrategy(roleItem.gmId)
    print("inStra ===>> ", roleItem.gmId, inStra)
    print(":getList() ===>> ", StrategyManager:getList())
    if inStra then
        img_fight:setVisible(true);
    else
        img_fight:setVisible(false);
    end

    -- if roleItem.pos and roleItem.pos ~= 0 then
    --     img_fight:setVisible(true);
    -- else
    --     img_fight:setVisible(false);
    -- end
    --添加助战标识
    local img_zhu = TFDirector:getChildByPath(item_node, 'img_zhu')
    if AssistFightManager:isInAssist( self.currLineUpType, roleItem.gmId ) then
        img_zhu:setVisible(true)
    else
        img_zhu:setVisible(false)
    end

    -- for i=1,5 do
    --    local img_star = TFDirector:getChildByPath(item_node, 'img_xingxing' .. i);
    --     if (roleItem.starlevel >= i) then
    --         img_star:setVisible(true);
    --     else
    --         img_star:setVisible(false);
    --     end
    -- end

    local txt_level = TFDirector:getChildByPath(item_node, 'txt_lv_word');
    txt_level:setText(roleItem.level);

    -- local img_kuang = TFDirector:getChildByPath(item_node, 'img_kuang');
    -- img_kuang:setTexture(GetColorKuangByQuality(roleItem.quality));
end

function IslandArmyLayer:removeUI()
	self.super.removeUI(self);

	self.button      = nil;
    self.btn_close   = nil;
    self.lastPoint   = nil;
    self.curIndex    = nil;
end

function IslandArmyLayer:setChangePosGuide(pos, changePos)
    self.guideCurrPos = pos
    self.guideChangePos = changePos
end

function IslandArmyLayer:setCanOpenInfo(vaule)
    if vaule == nil then
        vaule = true
    end
    self.canOpenInfo = vaule
end

function IslandArmyLayer.cellClickHandle(sender)
    local self = sender.logic;
    local gmId = sender.gmId;
    if self.guideRolePos > 0 or self.guideCurrPos >0 then
        return
    end

    if sender.isClick == true and self.canOpenInfo == true then
        play_press()
        CardRoleManager:openRoleInfo(gmId);
    end
end

function IslandArmyLayer.cellTouchBeganHandle(cell)
    local self = cell.logic;
    if cell.hasRole ~= true then
        return;
    end

    if self.guideRolePos > 0 then 
        local cellRole = CardRoleManager:getRoleByGmid(cell.gmId)
        if cellRole ~= nil and cellRole.pos > 0 then
            return
        end
    end

    if self.guideCurrPos > 0 then 
        local cellRole = CardRoleManager:getRoleByGmid(cell.gmId)
        if cellRole ~= nil and cellRole.pos ~= self.guideCurrPos then
            return
        end
    end

    cell.isClick = true;
    cell.isDrag  = false;
    self.isMove = false;

    self.offest = self.table_select:getContentOffset();

    self.onLongTouch = function(event)
        if self.isMove == false then
            return;
        end

        local pos = cell:getTouchMovePos();
          
        local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());
       
        if (v.x < 30 and v.y < 30 )  then
            -- if (v.x < 0 or v.y < 0 ) then
            --     self:removeLongTouchTimer();  
            --     cell.isDrag  = false;
            -- end
            -- self:removeLongTouchTimer();
            -- self.longTouchTimerId = TFDirector:addTimer(0.001, 1, nil, self.onLongTouch); 

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

function IslandArmyLayer.cellTouchMovedHandle(cell)
    local self = cell.logic;
    self.isMove = true;

    if cell.hasRole ~= true then
        return;
    end

    if self.guideRolePos > 0 then 
        local cellRole = CardRoleManager:getRoleByGmid(cell.gmId)
        if cellRole ~= nil and cellRole.pos > 0 then
            return
        end
    end

    if self.guideCurrPos > 0 then 
        local cellRole = CardRoleManager:getRoleByGmid(cell.gmId)
        if cellRole ~= nil and cellRole.pos ~= self.guideCurrPos then
            return
        end
    end
           
    local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());



    local pos = cell:getTouchMovePos();

    if self.selectCussor == nil then

        if (cell.posIndex ~= -1) then
            if (v.y < 30 and v.y > -30) and  (v.x < 30 and v.x > -30)  then
               return;
            end
        end

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


function IslandArmyLayer.cellTouchEndedHandle(cell)
    local self = cell.logic;
    if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end
    self.isAutoIng = false;

    if cell.hasRole ~= true then
        return;
    end

    self:removeLongTouchTimer();

    local pos = cell:getTouchEndPos();

    self:releaseSelectCussor(cell,pos);
    self.table_select:setTouchEnabled(true);
end

function IslandArmyLayer:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId);
        self.longTouchTimerId = nil;
    end
end

function IslandArmyLayer:createSelectCussor(cell,pos)
    play_press();

    cell.isClick = false;

    self.lastPoint = pos;

    local role = CardRoleManager:getRoleByGmid(cell.gmId);
    self.selectCussor = TFImage:create();
    self.selectCussor:setFlipX(true);
    self.selectCussor:setTexture(role:getHeadPath());
    self.selectCussor:setScale(20 / 15.0);
    self.selectCussor:setPosition(pos);
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);
   
    self.curIndex = cell.posIndex;
    
end

function IslandArmyLayer:moveSelectCussor(cell,pos)
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
            self.curIndex = self.button[i].posIndex;
            break;
        end
    end

end

function IslandArmyLayer:releaseSelectCussor(cell,pos)
    print("IslandArmyLayer:releaseSelectCussor(cell,pos) ------------1111")
    if cell.isClick == false  then
        print("IslandArmyLayer:releaseSelectCussor(cell,pos) ------------222")


        if (self.curIndex == nil) then
            return;
        end
        print("IslandArmyLayer:releaseSelectCussor(cell,pos) ------------333")

        local dargRole      = CardRoleManager:getRoleByGmid(cell.gmId);
        local toReplaceRole =  StrategyManager:getRoleByIndex(self.curIndex);


        if dargRole == nil then
            print("dargRole is nil ")
            return
        end

        if self.guideRolePos > 0 and self.curIndex ~= self.guideRolePos then
            return
        end
        print("IslandArmyLayer:releaseSelectCussor(cell,pos) ------------444")

        if self.guideChangePos > 0 and self.curIndex ~= self.guideChangePos then 
            return
        end
        print("IslandArmyLayer:releaseSelectCussor(cell,pos) ------------555",self.curIndex ,self.guideChangePos )

        --在阵中释放
        if (self.curIndex ~= -1) then 
            --从列表中拖到阵中
            if (cell.posIndex == -1) then


                --本来已经在阵中
                if dargRole.pos and dargRole.pos ~= 0 then

                    --且不是本角色目前所在的位置，做位置变更
                    if (toReplaceRole == nil or (toReplaceRole and toReplaceRole.gmId ~= dargRole.gmId)) then
                        print("IslandArmyLayer:releaseSelectCussor(cell,pos) ------------666",dargRole.pos,self.curIndex)
                        local sendMsg = {
                        dargRole.pos - 1,
                        self.curIndex - 1,
                        };
                        showLoading();
                        TFDirector:send(c2s.CHANGE_INDEX,sendMsg);
                        play_buzhenyidong()

                    end
                --要上阵，但是已经到达上限
                elseif (toReplaceRole == nil and not StrategyManager:canAddFightRole()) then
                    if StrategyManager.maxNum == 5 then
                        toastMessage(localizable.common_function_number_out);
                    else
                        local needLevel = FunctionOpenConfigure:getOpenLevel(700 + (StrategyManager.maxNum + 1))
                        if MainPlayer:getLevel() < needLevel then
                            local str = stringUtils.format(localizable.common_function_up_number,needLevel, StrategyManager.maxNum + 1)
                            toastMessage(str);
                        end
                    end 

                --要替换，但是替换对象是主角
                --elseif (toReplaceRole and  toReplaceRole.gmId == MainPlayer:getPlayerId()) then
                --    toastMessage("主角不能下阵");

                --上阵，如果目标存在角色，将其下阵
                else

                    --check是否为助战侠客
                    if AssistFightManager:isInAssist( self.currLineUpType, cell.gmId ) then
                        CommonManager:showOperateSureLayer(
                                        function()
                                            AssistFightManager:updateRoleOff(self.currLineUpType, cell.gmId)
                                            local battle = {cell.gmId,( self.curIndex - 1)}
                                            showLoading();
                                            TFDirector:send(c2s.TO_BATTLE,{battle})
                                            play_buzhenyidong()
                                        end,
                                        function()
                                            AlertManager:close()
                                            
                                        end,
                                        {
                                        title = localizable.common_tips,
                                        msg = localizable.common_tips_zhuzhan,
                                        }
                                    )
                    else
                        print("IslandArmyLayer:releaseSelectCussor(cell,pos) ------------777",cell.gmId,( self.curIndex - 1))
                        local battle = {cell.gmId,( self.curIndex - 1)}
                        showLoading();
                        TFDirector:send(c2s.TO_BATTLE,{battle})

                        play_buzhenyidong()
                    end
                end

            --阵中操作，更换位置   
            else
                local sendMsg = {              
                cell.posIndex - 1,
                self.curIndex - 1,   
                };
                print("IslandArmyLayer:releaseSelectCussor(cell,pos) ------------8888",sendMsg)
                showLoading();
                TFDirector:send(c2s.CHANGE_INDEX,sendMsg);

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
                --if (dargRole.gmId == MainPlayer:getPlayerId()) then
                --    toastMessage("主角不能下阵");
                --else
                    print("下阵:",dargRole.name);
                    showLoading();
                    TFDirector:send(c2s.OUT_BATTLE,{cell.gmId});
                    play_buzhenluoxia();
                --end
            end
        end
    end

    if cell:hitTest(pos) then     
        -- IslandArmyLayer.cellClickHandle(cell);
    end
end

function IslandArmyLayer.onAutoClickHandle(sender)
    local self = sender.logic;

    -- local  armylist = StrategyManager:getList()
    -- for pos in pairs(armylist) do
    --     self.button[pos].bg:setVisible(false);
    -- end

    self.isAutoIng = true;
    showLoading();
    TFDirector:send(c2s.AUTO_WAR_MATIX,{});
end

function IslandArmyLayer:registerEvents()
    self.super.registerEvents(self);
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);
    self.btn_close:setClickAreaLength(100);

    if self.assistFightView then
        self.assistFightView:registerEvents()
    end
    
    self.btn_skill:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onSkillBtnClick))

    self.btn_auto.logic = self;
    self.btn_auto:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onAutoClickHandle));

    for i=1,9 do
        self.button[i].bg:addMEListener(TFWIDGET_CLICK,  self.cellClickHandle,1);
        self.button[i].bg:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle,1);
        self.button[i].bg:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
        self.button[i].bg:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
    end

    self.btn_sort.logic = self;
    self.btn_sort_pos.logic = self;
    self.btn_sort_power.logic = self;
    self.btn_sort_quality.logic = self;
    self.bg_sort.logic = self;

    self.btn_sort:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowSortMenuClickHandle));
    self.btn_sort_pos:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onSortSelectClickHandle),1);
    self.btn_sort_power:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onSortSelectClickHandle),1);
    self.btn_sort_quality:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onSortSelectClickHandle),1);
    self.bg_sort:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onSortCancelClickHandle));

    self.callEquipChange = function(sender)
        XiaKeExchangeManager:openEquipChangeLayer(EnumFightStrategyType.StrategyType_PVE,self.roleList)
    end
    self.btn_equipchange:addMEListener(TFWIDGET_CLICK,audioClickfun(self.callEquipChange))

    self.updatePosCallBack = function(event)
    print("self.updatePosCallBack  ---111")
        if (not self.isAutoIng) and self.updateIcon then
            self:updateIcon(event.data[1])
        end
        self:updateStrategyBaseMsg();
        self.btn_skill_tips:setVisible(CustomSkillAiManage:checkShowTipsIcon( self.currLineUpType ))
    end;
    TFDirector:addMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS ,self.updatePosCallBack ) ;

    self.updateGenerralCallBack = function(event)
    print("self.updateGenerralCallBack  ---111")
        self:updateStrategyBaseMsg();
        self:refreshTable();
    end;
    TFDirector:addMEGlobalListener(StrategyManager.UPDATE_GENERRAL_LIST ,self.updateGenerralCallBack ) ;

    self.RoleStarUpResultCallBack = function (event)

        self:updateStrategyBaseMsg();
        self:refreshTable();
    end
    TFDirector:addMEGlobalListener(CardRoleManager.ROLE_TRANSFER_RESULT,self.RoleStarUpResultCallBack)
    TFDirector:addMEGlobalListener(CardRoleManager.ROLE_BREAKTHROUGH_RESULT,self.RoleStarUpResultCallBack)


    self.AutoMatixComCallBack = function (event)
        self.isAutoIng = false;
        play_yijianshangzhen()
        local resPath = "effect/role_auto_matix_up.xml"
        if not TFFileUtil:existFile(resPath) then
            return
        end
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        local effect = TFArmature:create("role_auto_matix_up_anim")

        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:setPosition(ccp(self:getSize().width/2,self:getSize().height/2))

        self:addChild(effect,2)

        effect:addMEListener(TFARMATURE_COMPLETE,function()
            effect:removeMEListener(TFARMATURE_COMPLETE) 
            effect:removeFromParent()
        end)
        effect:playByIndex(0, -1, -1, 0)
        self.playAutoMatixTimeId = TFDirector:addTimer(600, 1, nil, function()
            self:playAutoMatixComEffect()
        end);
        
    end
    TFDirector:addMEGlobalListener(StrategyManager.AUTO_WAR_MATIX_RESULT,self.AutoMatixComCallBack)

    -- add by king  大月卡增加属性
    self.monthCardUpdateAttr = function (event)
        self:updateStrategyBaseMsg()
    end
    TFDirector:addMEGlobalListener(MonthCardManager.MONTH_CARD_RefeshAttr,self.monthCardUpdateAttr)
    -- end
    if XiaKeExchangeManager:IsOpenEquipChange() == true then
        self.btn_equipchange:setVisible(true)
        self.img_point:setVisible(false)
    else
        self.img_point:setVisible(true)
        self.btn_equipchange:setVisible(false)
    end
    if CustomSkillAiManage:checkIsOpen() then
        self.btn_skill:setVisible(true)
    else
        self.btn_skill:setVisible(false)
    end
    
    if self.btn_skill:isVisible() or self.btn_equipchange:isVisible() then
        self.img_point:setVisible(false)
    end

end

function IslandArmyLayer:playAutoMatixComEffect()

    local resPath = "effect/role_auto_matix_down.xml"
    if not TFFileUtil:existFile(resPath) then
        return
    end
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("role_auto_matix_down_anim")

    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(self:getSize().width/2,self:getSize().height/2))

    self:addChild(effect,2)

    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeMEListener(TFARMATURE_COMPLETE) 
        effect:removeFromParent()
    end)

    local  armylist = StrategyManager:getList()
        for index in pairs(armylist) do

            self:updateIcon( index );
            self.button[index].bg:setVisible(false);

            local role = StrategyManager:getRoleByIndex(index);
            if role then
                local tempNode = self.button[index].bg:clone();
                tempNode:setPosition(self.button[index].bg:getPosition().x,self.button[index].bg:getPosition().y)
                self.button[index].bg:getParent():addChild(tempNode);
                tempNode:setVisible(true);
                tempNode:setAlpha(0);

                local toastTween = {
                      target = tempNode,
                     {
                        duration = 0,
                        delay = 0.1 + (index - 1)*0.08,
                      },
                      {
                        duration = 0,
                        alpha = 1,
                      },
                      {
                        duration = 4/24,
                        scale = 1.7,
                      },
                      { 
                        duration = 4/24,
                        scale = 2,
                        alpha = 0,
                      },

                      {
                         duration = 0,
                         alpha = 1,
                         scale = 1,
                      },
                      {
                        duration = 0,
                        onComplete = function() 
                            tempNode:removeFromParent();
                            self:updateIcon( index );
                        end
                      }
                    }

                TFDirector:toTween(toastTween);

            end
        end    

    effect:playByIndex(0, -1, -1, 0)
end

function IslandArmyLayer:refreshTable()
    if self.table_select == nil then
        return
    end
    
    --CardRoleManager:reSortStrategy();
    self.roleList = ZhengbaManager:getSortStrategy(self.currLineUpType,self.currSortType)
    local tb_pos = self.table_select:getContentOffset();
    self.table_select:reloadData();
    local currentSize = self.table_select:getContentSize()
    local tabSize = self.table_select:getSize()
    tb_pos.y = math.max(tb_pos.y , tabSize.height - currentSize.height)
    self.table_select:setContentOffset(tb_pos);
end   

function IslandArmyLayer:removeEvents()
    self.super.removeEvents(self)
    
    TFDirector:removeMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS, self.updatePosCallBack );
    self.updatePosCallBack = nil;

    TFDirector:removeMEGlobalListener(StrategyManager.UPDATE_GENERRAL_LIST, self.updateGenerralCallBack );
    self.updateGenerralCallBack = nil;

    TFDirector:removeMEGlobalListener(CardRoleManager.ROLE_TRANSFER_RESULT, self.RoleStarUpResultCallBack );
    self.RoleStarUpResultCallBack = nil;

    TFDirector:removeMEGlobalListener(CardRoleManager.ROLE_BREAKTHROUGH_RESULT, self.RoleStarUpResultCallBack );
    self.RoleStarUpResultCallBack = nil;

    TFDirector:removeMEGlobalListener(StrategyManager.AUTO_WAR_MATIX_RESULT, self.AutoMatixComCallBack );
    self.AutoMatixComCallBack = nil;

    TFDirector:removeTimer(self.playAutoMatixTimeId);
    self.playAutoMatixTimeId = nil;

    if self.assistFightView then
        self.assistFightView:removeEvents()
    end
    
    -- add by king  大月卡增加属性
    TFDirector:removeMEGlobalListener(MonthCardManager.MONTH_CARD_RefeshAttr,self.monthCardUpdateAttr)
    self.monthCardUpdateAttr = nil
    -- end
end

function IslandArmyLayer:updateIcon( index )
    local role = StrategyManager:getRoleByIndex(index);
    if role then
        self.button[index].icon:setVisible(true);
        self.button[index].icon:setTexture(role:getHeadPath());

        self.button[index].bg:setVisible(true);
        self.button[index].quality:setTextureNormal(GetColorRoadIconByQuality(role.quality));
        -- self.button[index].quality:setTextureNormal(GetRoleBgByWuXueLevel_circle(role.martialLevel));

        self.button[index].img_zhiye:setVisible(true);
        self.button[index].img_zhiye:setTexture("ui_new/fight/zhiye_".. role.outline ..".png");
        --self.button[index].img_quality:setVisible(true);
        self.button[index].img_quality:setTexture(GetArmyPicByQuality(role.quality));


        self.button[index].bg.hasRole = true;
        self.button[index].bg.gmId  = role.gmId;

        Public:addLianTiEffect(self.button[index].icon,role:getMaxLianTiQua(),true)
    else
        self.button[index].img_zhiye:setVisible(false);
        self.button[index].img_quality:setVisible(false);
        self.button[index].icon:setVisible(false);
        self.button[index].bg:setVisible(false);    
  
        self.button[index].bg.hasRole = false;   
        Public:addLianTiEffect(self.button[index].icon,0,false)
    end
end
function IslandArmyLayer.onSkillBtnClick( btn )
    local self = btn.logic
    CustomSkillAiManage:openCustomSkillAiLayer(self.currLineUpType)
end

-- function IslandArmyLayer:isHaveBook(cardRole)
--     if cardRole == nil then 
--         return false
--     end

--     -- 武学等级
--     local martialLevel = cardRole.martialLevel
--     local martialList  = cardRole.martialList
--     local bookListData = MartialRoleConfigure:findByRoleIdAndMartialLevel(cardRole.id, martialLevel)

--     local bookList     = bookListData:getMartialTable()
--     for i=1, 6 do
--         local status = self:isBookOnThisPosition(i, cardRole.level, bookList, martialList)

--         if status == true then
--             return true
--         end
--     end

--     return false
-- end

-- function IslandArmyLayer:isBookOnThisPosition(index, roleLevel, bookList, martialList)

--     local bookid   = bookList[index]
--     local bookInfo = MartialData:objectByID(bookid)

--     -- 该位置有书装备
--     if martialList[index] == nil then

--         local status = self:getBookStatus(bookInfo, roleLevel)

--         if status ==  1 or status == 3 then

--             return true
--         end
--     end


--     return false
-- end

-- function IslandArmyLayer:getBookStatus(bookInfo, Level)
    
--     -- 0 不存在
--     -- 1 背包存在并且可以穿戴
--     -- 2 背包存在并且不可以穿戴
--     -- 3 可以合成并且可以穿戴
--     -- 4 可以合成并且不可以穿戴
--     local bookStatus = 0

--     local roleLevel = Level
--     local id        = bookInfo.goodsTemplate.id
--     local bag       = BagManager:getItemById(id)
--     local bookLevel = bookInfo.goodsTemplate.level

--     -- 背包中存在
--     if bag then
--         bookStatus = 1
--     else
--         if MartialManager:isCanSynthesisById(id, 1) then
--             bookStatus = 3
--         end
--     end

--     -- 穿戴等级
--     -- 有物品 才判断等级
--     if bookLevel > roleLevel and bookStatus > 0 then
--         bookStatus = bookStatus + 1
--     end

--     return bookStatus
-- end

return IslandArmyLayer;
