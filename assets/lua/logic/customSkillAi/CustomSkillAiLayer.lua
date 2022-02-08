-- client side CustomSkillAiLayer.lua
--[[
 * @Description: 自定义技能界面图层
 ]]
-- script writer Happy.All
-- creation time 2016-06-22


local CustomSkillAiLayer = class("CustomSkillAiLayer",BaseLayer)

function CustomSkillAiLayer:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.SkillStrategy.SkillStrategyMain")
    self.cellMax = 5
end

function CustomSkillAiLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.CheckBox_queren = TFDirector:getChildByPath(ui, "CheckBox_queren")
    self.btn_baocun = TFDirector:getChildByPath(ui, "btn_baocun")  
    self.btn_baocun:setVisible(false)  
    self.img_gantan_tips = TFDirector:getChildByPath(ui, "img_gantan_tips")
    self.btn_fanhui = TFDirector:getChildByPath(ui, "btn_fanhui")
    self.btn_help = TFDirector:getChildByPath(ui, "btn_help")
    

    local baseSkillNode = TFDirector:getChildByPath(ui, 'Panel_RoleHead')
    self.baseSkill = {}
    for i=1,9 do
        self.baseSkill[i] = {}
        self.baseSkill[i].btn = TFDirector:getChildByPath(baseSkillNode, "img_head"..i)

        if i ~= 9 then
            self.baseSkill[i].arrow = TFDirector:getChildByPath(baseSkillNode, "img_Green"..i)
            self.baseSkill[i].arrowHl = TFDirector:getChildByPath(self.baseSkill[i].arrow, "img_hbg")
        end
        local headNode = TFDirector:getChildByPath(baseSkillNode, "img_head"..i)        
        self.baseSkill[i].img_gantan = TFDirector:getChildByPath(headNode, "img_gantan") 
        self.baseSkill[i].img_gantan:setVisible(false)
        self.baseSkill[i].img_quality = TFDirector:getChildByPath(headNode, "img_quality")
        self.baseSkill[i].img_icon = TFDirector:getChildByPath(headNode, "img_icon")
        self.baseSkill[i].img_zhiye = TFDirector:getChildByPath(headNode, "img_zhiye")
        self.baseSkill[i].img_jia = TFDirector:getChildByPath(headNode, "img_jia")        

        self.baseSkill[i].headNode = TFDirector:getChildByPath(headNode, "panel_info")
        self.baseSkill[i].headNode:setVisible(false)
    end
    self.baseSkillNode = baseSkillNode

    self.cellModel = TFDirector:getChildByPath(ui, "img_cell")
    self.cellModel:setVisible(false)


    self.TabViewUI = TFDirector:getChildByPath(ui, "Panel_bg")
    self.TabView =  TFTableView:create()
    self.TabView:setTableViewSize(self.TabViewUI:getContentSize())
    self.TabView:setDirection(TFTableView.TFSCROLLVERTICAL)    
    self.TabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    self.TabView.logic = self
    self.TabViewUI:addChild(self.TabView)
    self.TabView:setPosition(ccp(0,0))
end


function CustomSkillAiLayer:removeUI()
	self.super.removeUI(self)
end

function CustomSkillAiLayer:onShow()
    self.super.onShow(self)
end

function CustomSkillAiLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)

    self.btn_fanhui:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onBackBtnClick))
    self.btn_fanhui.logic = self    

    self.TabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.TabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.TabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)

    for i=1,9 do
        self.baseSkill[i].btn.idx = i
        self.baseSkill[i].btn.logic = self
        self.baseSkill[i].btn.posIndex = i        
        self.baseSkill[i].btn:addMEListener(TFWIDGET_CLICK,  self.cellClickHandleBase,1);
        self.baseSkill[i].btn:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandleBase,1);
        self.baseSkill[i].btn:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandleBase);
        self.baseSkill[i].btn:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandleBase);
    end

    self.btn_baocun:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onSaveBtnClick))
    self.btn_baocun.logic = self

    self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHelpBtnClick))
    
    self.CheckBox_queren:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSaveCheckBoxSelect))
    self.CheckBox_queren.logic = self

    self.updateSkillInfoSuccess = function (event)
        self:setData( self.strategyType )
    end
    TFDirector:addMEGlobalListener(CustomSkillAiManage.updateSkillInfoSuccess, self.updateSkillInfoSuccess)  

    self.registerEventCallFlag = true 
end

function CustomSkillAiLayer:removeEvents()

    self.super.removeEvents(self)

    self.TabView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.TabView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    TFDirector:removeMEGlobalListener(CustomSkillAiManage.updateSkillInfoSuccess, self.updateSkillInfoSuccess)  
    self.updateSkillInfoSuccess = nil

    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId);
        self.longTouchTimerId = nil;
    end

    self.registerEventCallFlag = nil  
end

function CustomSkillAiLayer:dispose()
	self.super.dispose(self)
end

function CustomSkillAiLayer:setData( strategyType, Data )
    self.strategyType = strategyType

    self.cellMax = 5
    if strategyType == EnumFightStrategyType.StrategyType_CHUANGZHEN then
        self.cellMax = 7
    end

    local skillData = Data or {}
    self.skillData = clone(skillData)
    if self.skillData.baseOrder == nil then
        self.skillData.baseOrder = {}
    end
    if self.skillData.specialOrder == nil then
        self.skillData.specialOrder = {}
    end
    if self.skillData.strategyType == nil then
        self.skillData.strategyType = strategyType
    end
    if self.skillData.isUse == nil then
        self.skillData.isUse = false
    end


    if self.roleList == nil then
        self.roleList = TFArray:new()
    else
        self.roleList:clear()
    end

    local roleList = {}
    if self.strategyType ~= EnumFightStrategyType.StrategyType_FengYunLu1 and self.strategyType ~= EnumFightStrategyType.StrategyType_FengYunLu2 and self.strategyType ~= EnumFightStrategyType.StrategyType_FengYunLu3 then
        roleList = ZhengbaManager:getFightList( strategyType ) or {}
        for k,v in pairs(roleList) do
            local role = CardRoleManager:getRoleByGmid(v)
            if role then
                self.roleList:pushBack(role.id)
            end
        end
    else
        rolelist = FengYunLuManager:getMyRoleList()
        for k,v in pairs(rolelist) do
            local role = FYRecordData:getRoleinfoByid(v)
            if role then
                self.roleList:pushBack(role.role_id)
            end
        end
    end
    self.TabView:reloadData()
    self.TabView:setScrollToBegin()

    self:refreshBaseOrderInfo()
    self:refreshSpecialOrderInfo()
end

function CustomSkillAiLayer:cancelBaseRoleByIndex( idx )
    self.skillData.baseOrder[idx] = 0
    self.baseSkill[idx].btn.hasRole = false
    self.baseSkill[idx].btn.roleId = 0
    self:refreshBaseOrderInfo()
end

function CustomSkillAiLayer:addBaseRoleByIndex( idx, roleId )
    if roleId and roleId ~= 0 then
        self.skillData.baseOrder[idx] = roleId
        self.baseSkill[idx].btn.hasRole = true
        self.baseSkill[idx].btn.roleId = roleId
        self:refreshBaseOrderInfo()
    end
end

function CustomSkillAiLayer.cellClickHandleBase(sender)
    local self = sender.logic;
    local idx = sender.idx
    local baseOrder = self.skillData.baseOrder
    if baseOrder[idx] and baseOrder[idx] ~= 0 then
        --取消role
        self:cancelBaseRoleByIndex(idx)
        CustomSkillAiManage:sendDataToServer(self.skillData)
    else
        --添加role
        self.cellClickHandleBaseCallBack = function (cardRole)
            local selectPos = nil
            for i=1,9 do
                if baseOrder[i] == nil or baseOrder[i] == 0 then
                    selectPos = i
                    break
                end
            end
            if selectPos then 
                self:addBaseRoleByIndex(selectPos, cardRole)
                CustomSkillAiManage:sendDataToServer(self.skillData)
            else
                toastMessage(localizable.CustomSkillBaseNoPos)
            end
        end
        CustomSkillAiManage:openRoleSelectLayer( self.roleList, 1, self.cellClickHandleBaseCallBack )
    end
end

function CustomSkillAiLayer.cellTouchBeganHandleBase(cell)
    local self = cell.logic;
    print('cell.hasRole = ',cell.hasRole)
    if cell.hasRole ~= true then
        return;
    end

    cell.isClick = true;
    cell.isDrag  = false;
    self.isMove = false;

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
            else
                cell.isDrag  = false;
            end
        end
    end;

    if (cell.posIndex == -1) then
        self:removeLongTouchTimer();
        self.longTouchTimerId = TFDirector:addTimer(0.001, -1, nil, self.onLongTouch); 
    end

end

function CustomSkillAiLayer.cellTouchMovedHandleBase(cell)
    local self = cell.logic;
    self.isMove = true;

    if cell.hasRole ~= true then
        return;
    end

    local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());
    local pos = cell:getTouchMovePos();

    if self.selectCussor == nil then
        if (cell.posIndex ~= -1 or cell.isDrag == true ) then
            self:createSelectCussor(cell,pos);
        end
    end

    if cell.isClick == true then
        return;
    end
    self:moveSelectCussor(cell,pos);
end


function CustomSkillAiLayer.cellTouchEndedHandleBase(cell)
    local self = cell.logic;
    if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end

    if cell.hasRole ~= true then
        return;
    end

    self:removeLongTouchTimer()
    local pos = cell:getTouchEndPos()
    self:releaseSelectCussor(cell,pos)
end

function CustomSkillAiLayer:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId);
        self.longTouchTimerId = nil;
    end
end

function CustomSkillAiLayer:createSelectCussor(cell,pos)
    play_press();

    cell.isClick = false;
    self.lastPoint = pos;

    local role = nil
    if self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu1 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu2 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu3 then
        role = FYRecordData:getRoleinfoByid(cell.roleId)
    else
        role = CardRoleManager:getRoleById(cell.roleId);
    end
    self.selectCussor = TFImage:create();
    self.selectCussor:setFlipX(true);
    self.selectCussor:setTexture(role:getHeadPath());
    self.selectCussor:setScale(20 / 15.0);
    self.selectCussor:setPosition(pos);
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);

    self.curIndex = cell.posIndex;
end

function CustomSkillAiLayer:moveSelectCussor(cell,pos)
    local v = ccpSub(pos, self.lastPoint);
    self.lastPoint = pos;
    local scp = ccpAdd(self.selectCussor:getPosition(), v);
    self.selectCussor:setPosition(scp);
    self.selectCussor:setVisible(true);

    self.curIndex = nil;
    for i=1,9 do
        if  self.baseSkill[i].btn:hitTest(pos) then
            self.curIndex = self.baseSkill[i].btn.posIndex;
            break;
        end
    end    
end

function CustomSkillAiLayer:releaseSelectCussor(cell,pos)

    print('self.curIndex = ',self.curIndex)

    if cell.isClick == false  then
        if (self.curIndex == nil) then
            return;
        end

        local dargRole      = CardRoleManager:getRoleByGmid(cell.gmId);
        local toReplaceRole =  ZhengbaManager:getRoleByIndex(self.fightType,self.curIndex);
        --交换
        if (self.curIndex ~= -1) then 
            self:ChangePos((cell.posIndex), (self.curIndex))
            play_buzhenyidong()
            return;
        end

        --在右边列表释放
        if (self.curIndex == -1) then

            if (cell.posIndex == -1 ) then
                --放弃上阵，不做操作

            else
                self:cancelBaseRoleByIndex(cell.posIndex)
                play_buzhenluoxia();
                CustomSkillAiManage:sendDataToServer(self.skillData)
            end
        end
    end
end


function CustomSkillAiLayer.cellSizeForTable(table,idx)
    local self = table.logic

    if idx == 0 or idx == (self.cellMax-1) then
        return 140,448
    end
    return 128,448
end

function CustomSkillAiLayer.numberOfCellsInTableView(table)
    local self = table.logic
    return self.cellMax
end

function CustomSkillAiLayer.tableCellAtIndex(table, idx)

    local self = table.logic
    local cell = table:dequeueCell()

    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel:clone()
        local size = panel:getContentSize()
        panel:setPosition(ccp(size.width/2,size.height/2))
        cell:addChild(panel)
        cell.panel = panel

        panel.panel_info = TFDirector:getChildByPath(panel, "panel_info")
        panel.img_quality = TFDirector:getChildByPath(panel, "img_quality")
        panel.img_icon = TFDirector:getChildByPath(panel, "img_icon")
        panel.img_zhiye = TFDirector:getChildByPath(panel, "img_zhiye")
        panel.img_gantan = TFDirector:getChildByPath(panel, "img_gantan")

        panel.CheckBox_No = TFDirector:getChildByPath(panel, "CheckBox_No")
        panel.txt_tiaojian = TFDirector:getChildByPath(panel, "txt_tiaojian")
        panel.txt_tiaojian_red = TFDirector:getChildByPath(panel, "txt_tiaojian_red")
        panel.txt_tiaojian_red:setVisible(false)
        panel.btn_number = TFDirector:getChildByPath(panel, "btn_number")
        panel.txt_number = TFDirector:getChildByPath(panel, "txt_number")
        panel.btn_bg = TFDirector:getChildByPath(panel, "btn_bg")

        panel.btn_bg:setTouchEnabled(true)
        panel.btn_bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onConditionSelect))
        panel.btn_bg.logic = self

        panel.CheckBox_No:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckBoxSelect))
        panel.CheckBox_No.logic = self

        panel.img_Rolehead = TFDirector:getChildByPath(panel, "img_Rolehead")
        panel.img_Rolehead:setTouchEnabled(true)
        panel.img_Rolehead:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSpecialRoleSelect))
        panel.img_Rolehead.logic = self


        panel.btn_number:setTouchEnabled(true)
        panel.btn_number:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSpecialNumber))
        panel.btn_number.logic = self
    else
        panel = cell.panel
    end

    idx = idx + 1

    if idx == self.cellMax then
        local size = panel:getContentSize()
        panel:setPosition(ccp(size.width/2,size.height/2+12))
    else
        local size = panel:getContentSize()
        panel:setPosition(ccp(size.width/2,size.height/2))
    end
    panel:setVisible(true)
    panel.img_Rolehead.idx = idx
    panel.btn_number.idx = idx
    panel.btn_bg.idx = idx
    panel.CheckBox_No.idx = idx
    cellInfo = self.skillData.specialOrder[idx] or {}
    -- local roleItem = CardRoleManager:getRoleById(cellInfo.roleId)
    local roleItem = CardRoleManager:getRoleById(cellInfo.roleId)
    if roleItem == nil then
        roleItem = RoleData:objectByID(cellInfo.roleId)
    end

    if self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu1 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu2 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu3 then
        roleItem = FYRecordData:getRoleinfoByid(cellInfo.roleId)
    end
    if roleItem and cellInfo.roleId ~= 0 then
        panel.panel_info:setVisible(true)
        panel.img_quality:setTexture(GetColorIconByQuality(roleItem.quality))
        panel.img_icon:setTexture(roleItem:getIconPath())
        panel.img_zhiye:setTexture("ui_new/fight/zhiye_".. roleItem.outline ..".png")
        if self:checkRoleInStrategy(roleItem.id) then
            panel.img_gantan:setVisible(false)
        else
            panel.img_gantan:setVisible(true)
        end
    else
        panel.panel_info:setVisible(false)
        panel.img_gantan:setVisible(false)
    end

    panel.CheckBox_No:setSelectedState(cellInfo.isCheckBox or false)
    local tiaojianType = cellInfo.specialOrderType or 0
    local tiaojianNumber = cellInfo.percentNum or 50

    local txtTiaojian = localizable.CustomSkillConditionNone
    if tiaojianType ~= 0 then
        txtTiaojian = localizable.CustomSkillCondition[tiaojianType]
    end
    if tiaojianType == 0 and (cellInfo.roleId and cellInfo.roleId ~= 0) then
        panel.txt_tiaojian:setVisible(false)
        panel.txt_tiaojian_red:setVisible(true)
        panel.txt_tiaojian_red:setText(localizable.CustomSkillConditionRed)
    else
        panel.txt_tiaojian_red:setVisible(false)
        panel.txt_tiaojian:setVisible(true)
        panel.txt_tiaojian:setText(txtTiaojian)
    end
    
    if tiaojianType == 2 or tiaojianType == 0 then
        panel.btn_number:setVisible(false)    
    else
        panel.btn_number:setVisible(true)
        panel.txt_number:setText(tiaojianNumber.."%")
    end

    return cell
end

function CustomSkillAiLayer:checkRoleInStrategy(roleId)
    if self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu1 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu2 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu3 then
        roleId = FYRecordData:getRoleinfoByid(roleId).role_id
    end 

    for item in self.roleList:iterator() do
        if roleId == item then
            return true
        end
    end
    return false
end
function CustomSkillAiLayer:refreshBaseOrderInfo()
    local baseOrder = self.skillData.baseOrder
    local needCheckShow = true
    for i=1,9 do
        local roleId = baseOrder[i] or 0
        -- local roleItem = CardRoleManager:getRoleById(roleId)
        local roleItem = CardRoleManager:getRoleById(roleId)
        if roleItem == nil then
            roleItem = RoleData:objectByID(roleId)
        end
        if self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu1 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu2 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu3 then
            roleItem = FYRecordData:getRoleinfoByid(roleId)
        end
        if roleItem and roleId ~= 0 then
            if self.baseSkill[i] and self.baseSkill[i].arrowHl then
                self.baseSkill[i].arrowHl:setVisible(true)
            end
            self.baseSkill[i].headNode:setVisible(true)
           
            self.baseSkill[i].img_quality:setTexture(GetColorIconByQuality(roleItem.quality))
            self.baseSkill[i].img_icon:setTexture(roleItem:getIconPath())
            self.baseSkill[i].img_zhiye:setTexture("ui_new/fight/zhiye_".. roleItem.outline ..".png")
            if self:checkRoleInStrategy(roleItem.id) then
                self.baseSkill[i].img_gantan:setVisible(false)
            else
                self.baseSkill[i].img_gantan:setVisible(true)
            end
        else
            if self.baseSkill[i].arrowHl then
                self.baseSkill[i].arrowHl:setVisible(false)
            end

            --检测前一个位置是否有侠客
            local addShow = false
            if needCheckShow then
                if i == 1 then
                    addShow = true
                else
                    if baseOrder[i-1] and baseOrder[i-1] ~= 0 then
                        addShow = true
                    end
                end
                if addShow then
                    needCheckShow = false
                end
            end

            if self.baseSkill[i] and self.baseSkill[i].img_jia then
                self.baseSkill[i].img_jia:setVisible(addShow)
            end
            self.baseSkill[i].headNode:setVisible(false)
            self.baseSkill[i].img_gantan:setVisible(false)
        end
    end

    self.CheckBox_queren:setSelectedState(self.skillData.isUse)

    self:refreshTipsState()
end

function CustomSkillAiLayer:refreshTipsState()

    if self.roleIdTable == nil then
        self.roleIdTable = {}
        local roleList = ZhengbaManager:getFightList( self.strategyType ) or {}
        local roleList = {}
        if self.strategyType ~= EnumFightStrategyType.StrategyType_FengYunLu1 and self.trategyType ~= EnumFightStrategyType.StrategyType_FengYunLu2 and self.trategyType ~= EnumFightStrategyType.StrategyType_FengYunLu3 then
            roleList = ZhengbaManager:getFightList( self.strategyType ) or {}
            for k,v in pairs(roleList) do
                local role = CardRoleManager:getRoleByGmid(v)
                if role then
                    self.roleIdTable[role.id] = true
                end
            end
        else
            roleList = FengYunLuManager:getMyRoleList()
            for k,v in pairs(roleList) do
                local role = FYRecordData:getRoleinfoByid(v)
                if role then
                    self.roleIdTable[role.id] = true
                end
            end
        end

    end
    local skillInfo = self.skillData
    local isShow = false
    if skillInfo ~= nil then
        local baseOrder = skillInfo.baseOrder or {}
        for k,v in pairs(baseOrder) do
            if v ~= 0 and self.roleIdTable[v] == nil then
                isShow = true
                break
            end
        end
        local specialOrder = skillInfo.specialOrder or {}
        for k,v in pairs(specialOrder) do
            if v.roleId ~= 0 and self.roleIdTable[v.roleId] == nil then
                isShow = true
                break
            end
        end
    end
    print('isShow = ',isShow)
    self.img_gantan_tips:setVisible(isShow)
end

function CustomSkillAiLayer:refreshSpecialOrderInfo()
    self.TabView:reloadData()
    self:refreshTipsState()
end

function CustomSkillAiLayer.onSpecialRoleSelect( btn )
    local self = btn.logic;
    local idx = btn.idx

    if self.skillData.specialOrder[idx] == nil then
        self.skillData.specialOrder[idx] = {}
    end

    local specialOrder = self.skillData.specialOrder[idx]
    
    if specialOrder.roleId and specialOrder.roleId ~= 0 then
        --取消role
        specialOrder.roleId = 0
        self:refreshSpecialOrderInfo()
        CustomSkillAiManage:sendDataToServer(self.skillData)
    else
        --添加role
        self.specialRoleSelectCallBack = function (cardRole)
            specialOrder.roleId = cardRole

            self:refreshSpecialOrderInfo()
            CustomSkillAiManage:sendDataToServer(self.skillData)
        end
        CustomSkillAiManage:openRoleSelectLayer( self.roleList, 2, self.specialRoleSelectCallBack )
    end
end

function CustomSkillAiLayer.onSpecialNumber( btn )
    
    local self = btn.logic;
    local idx = btn.idx

    if self.skillData.specialOrder[idx] == nil then
        self.skillData.specialOrder[idx] = {}
    end

    local specialOrder = self.skillData.specialOrder[idx]
    local tiaojianType = specialOrder.specialOrderType or 1
    local tiaojianNumber = specialOrder.percentNum or 50

    self.specialNumberCallBack = function (number)
        specialOrder.percentNum = number
        print("number = ",number)
        self:refreshSpecialOrderInfo()
        CustomSkillAiManage:sendDataToServer(self.skillData)
    end
    CustomSkillAiManage:openBloodChoseLayer( localizable.CustomSkillCondition[tiaojianType], tiaojianNumber, self.specialNumberCallBack )
end

function CustomSkillAiLayer.onConditionSelect( btn )
    local self = btn.logic;
    local idx = btn.idx

    if self.skillData.specialOrder[idx] == nil then
        self.skillData.specialOrder[idx] = {}
    end

    local specialOrder = self.skillData.specialOrder[idx]

    self.conditionSelectCallBack = function (type)
        specialOrder.specialOrderType = type
        specialOrder.percentNum = 50
        self:refreshSpecialOrderInfo()
        CustomSkillAiManage:sendDataToServer(self.skillData)
    end
    CustomSkillAiManage:openCustomSkillConditionLayer( self.conditionSelectCallBack )
end

function CustomSkillAiLayer.onCheckBoxSelect( btn )
    local self = btn.logic;
    local idx = btn.idx

    if self.skillData.specialOrder[idx] == nil then
        self.skillData.specialOrder[idx] = {}
    end
    local specialOrder = self.skillData.specialOrder[idx]
    specialOrder.isCheckBox = btn:getSelectedState()
    CustomSkillAiManage:sendDataToServer(self.skillData)
end

function CustomSkillAiLayer.onSaveBtnClick( btn )
    local self = btn.logic
    -- self.skillData.isUse = self.CheckBox_queren:getSelectedState()

    CustomSkillAiManage:sendDataToServer(self.skillData)
end

function CustomSkillAiLayer.onHelpBtnClick( btn )
    CommonManager:showRuleLyaer('jinengcelue')
end

function CustomSkillAiLayer:ChangePos( pos1, pos2 )
    if self.skillData.baseOrder == nil then
        self.skillData.baseOrder = {}
    end

    local role1 = self.skillData.baseOrder[pos1] or 0
    local role2 = self.skillData.baseOrder[pos2] or 0

    self:cancelBaseRoleByIndex(pos1)
    self:cancelBaseRoleByIndex(pos2)

    self:addBaseRoleByIndex(pos1, role2)
    self:addBaseRoleByIndex(pos2, role1)

    CustomSkillAiManage:sendDataToServer(self.skillData)
end

function CustomSkillAiLayer.onSaveCheckBoxSelect( btn )
    local self = btn.logic;

    self.skillData.isUse = self.CheckBox_queren:getSelectedState()
    CustomSkillAiManage:sendDataToServer(self.skillData)
end

function CustomSkillAiLayer:checkNeedShowTips()
    if self.skillData.isUse == false then
        return false
    end
    local baseOrder = self.skillData.baseOrder or {}
    for k,v in pairs(baseOrder) do
        if v ~= 0 then
            return false
        end
    end
    local specialOrder = self.skillData.specialOrder or {}
    for k,v in pairs(specialOrder) do
        -- print('specialOrder = ',v)
        if (v.roleId and v.roleId ~= 0) and (v.specialOrderType and v.specialOrderType ~= 0) then
            return false
        end
    end
    return true
end

function CustomSkillAiLayer.onBackBtnClick( btn )
    local self = btn.logic
    if self:checkNeedShowTips() then
        CommonManager:showOperateSureLayer(
            function()
                AlertManager:close()
            end,
            function()
                AlertManager:close()
            end,
            {
            title = localizable.common_tips,
            msg = localizable.CustomSkillOperateSure,
            }
        )
    else
        AlertManager:close()
    end
end
return CustomSkillAiLayer