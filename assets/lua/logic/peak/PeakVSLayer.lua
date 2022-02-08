-- client side PeakVSLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-06-25

local PeakVSLayer = class("PeakVSLayer", BaseLayer)

function PeakVSLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianVSLayer")
end

function PeakVSLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.Peak,{HeadResType.COIN,HeadResType.SYCEE})
    self.panel_left   = TFDirector:getChildByPath(ui, 'Panel_1')
    self.panel_right   = TFDirector:getChildByPath(ui, 'Panel_2')

    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');
    self.btn_close:setVisible(false)
    
    self.btn_army       = TFDirector:getChildByPath(ui, 'btn_challenge')
    self.btn_buzhen     = TFDirector:getChildByPath(ui, 'btn_buzhen')
    self.btn_inspire1   = TFDirector:getChildByPath(ui, 'btn_inspire1')
    self.firstShow = true
end

function PeakVSLayer:loadData(userData,floorId,pos)
    self.floorId = floorId
    self.pos = pos
    self.userData = userData or {}
    self.userData.formation = self.userData.formation or {}
end

function PeakVSLayer:onShow()
    self.super.onShow(self)
    if self.generalHead then
        self.generalHead:onShow()
    end
    self:refreshUI()
end

function PeakVSLayer:refreshUI()
    self:drawLeftArea()
    self:drawRightArea()
    if self.firstShow == true then
        self.ui:runAnimation("Action0",1);
        self.firstShow = false
    end
end

function PeakVSLayer:getRoleBtPos(pos)
    for _,v in pairs(self.userData.formation) do
        local idx = v.position + 1
        if idx == pos then
            local roleId = v.templateId
            local cardRole = clone(RoleData:objectByID(roleId));
            cardRole.level  = v.level
            return cardRole
        end
    end
    return nil
end
function PeakVSLayer:getRoleInfoBtPos(pos)
    for _,v in pairs(self.userData.formation) do
        local idx = v.position + 1
        if idx == pos then
            return v
        end
    end
    return nil
end

function PeakVSLayer.cellClickHandle(sender)
    local self = sender.logic;
    local cardRoleId = sender.cardRoleId;
    Public:ShowItemTipLayer(sender.role.id, EnumDropType.ROLE, 1,sender.role.level)
end

function PeakVSLayer.onArmyClickHandle(sender)
    local self = sender.logic;
    local gmid = sender.gmid

    if sender.isClick == false then
        return
    end

    print("gmid = ", gmid)
    if gmid > 0 then
    end
end

function PeakVSLayer:getChangeBtn()
    return self.btn_challenge
end

--注册事件
function PeakVSLayer:registerEvents()
   self.super.registerEvents(self);
   -- ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);
   self.btn_close:setClickAreaLength(100);
    
   
    self.btn_army.logic = self;
    self.btn_army:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAttackClickHandle),1);


    local function enterStarge(sender)
        CardRoleManager:openRoleList()
    end
    self.btn_buzhen:addMEListener(TFWIDGET_CLICK,  audioClickfun(enterStarge),1)

    local function enterBPBuff(sender)
        PeakManager:openBuffLayer()
    end
    self.btn_inspire1:addMEListener(TFWIDGET_CLICK,  audioClickfun(enterBPBuff),1)
    for i=1,9 do
        local bg = TFDirector:getChildByPath(self.panel_right, "btn_icon"..i)
        bg.logic = self
        bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.cellClickHandle),1)
    end

    for i=1,9 do
        local bg = TFDirector:getChildByPath(self.panel_left, "btn_icon"..i)
        bg.logic = self
        bg.posIndex = i

        bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onArmyClickHandle),1)

        bg:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle,1);
        bg:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
        bg:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);   
    end

    self.updatePosCallBack = function(event)
        self:drawLeftArea()
    end
    TFDirector:addMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS ,self.updatePosCallBack )


    self.tryConnectNetAgain = function(event)
        AlertManager:close(AlertManager.TWEEN_NONE)
    end
    TFDirector:addMEGlobalListener(CommonManager.TRY_RECONNECT_NET ,self.tryConnectNetAgain)

    self.IsInBattleCallBack = function( event )
        local info = self.userData.info
        if info then
            if event.data[1].isInBattle == 1 then
                PeakManager:requestStartBattle(info.playerId , info.serverId , 0 , self.pos , self.floorId)
                AlertManager:close(AlertManager.TWEEN_NONE)
            elseif event.data[1].isInBattle == 0 then
                CommonManager:showOperateSureLayer(
                    function()
                        PeakManager:requestStartBattle(info.playerId , info.serverId , 0 , self.pos , self.floorId)
                        if PeakManager:getActivityStatus() == 1 then
                            return
                        end
                        AlertManager:close(AlertManager.TWEEN_NONE)
                    end,
                    nil,
                    {
                        msg = localizable.LunJianFeng_txt_vs_tip
                    }
                )
            end
            
        else
            PeakManager:requestStartBattle(0 , 0 , 0 , self.pos , self.floorId)
            AlertManager:close(AlertManager.TWEEN_NONE)
        end
    end
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_IS_IN_BATTLE ,self.IsInBattleCallBack)

    self.onActivityStatusHandler = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)

    self.onActivityStatusHandler_0 = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
end

function PeakVSLayer:removeEvents()
    if self.generalHead then
        self.generalHead:removeEvents()
    end
    TFDirector:removeMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS ,self.updatePosCallBack ) 
    self.updatePosCallBack = nil;

    TFDirector:removeMEGlobalListener(CommonManager.TRY_RECONNECT_NET ,self.tryConnectNetAgain)
    self.tryConnectNetAgain = nil

    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_IS_IN_BATTLE ,self.IsInBattleCallBack)
    self.IsInBattleCallBack = nil

    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    self.onActivityStatusHandler = nil

    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    self.onActivityStatusHandler_0 = nil

    self.super.removeEvents(self)
     self.firstShow = true
end

function PeakVSLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end

    self.super.dispose(self)
end


function PeakVSLayer:drawLeftArea()
    self.button_self = {}
    self.button = {}
    for i=1,9 do
        local btnName = "panel_item" .. i;
        self.button[i] = TFDirector:getChildByPath(self.panel_left, btnName);

        self.button_self[i] = self.button[i]
        self.button_self[i].posIndex = i;

        btnName = "btn_icon"..i;
        self.button[i].bg = TFDirector:getChildByPath(self.panel_left, btnName);
        self.button[i].bg:setVisible(false);

        self.button[i].icon = TFDirector:getChildByPath(self.button[i].bg ,"img_touxiang");
        self.button[i].icon:setVisible(false);

        self.button[i].img_type     = TFDirector:getChildByPath(self.button[i],"img_zhiye");


        self.button[i].quality = TFDirector:getChildByPath(self.panel_left, btnName);

        self.button[i].bg.gmid = 0

        local role = ZhengbaManager:getRoleByIndex(EnumFightStrategyType.StrategyType_PVE,i);

        self.button[i].bg.hasRole = false
        self.button[i].bg.gmId = 0
        if  role ~= nil then
            self.button[i].bg.gmId = role.gmId
            self.button[i].bg.hasRole = true
            self.button[i].bg.gmid = role.gmId
            
            self.button[i].icon:setVisible(true);
            self.button[i].icon:setTexture(role:getHeadPath());

            self.button[i].bg:setVisible(true);
            self.button[i].quality:setTextureNormal(GetColorRoadIconByQualitySmall(role.quality));
            -- self.button[i].quality:setTextureNormal(GetRoleBgByWuXueLevel_circle_small(role.martialLevel));

            self.button[i].bg.cardRoleId = role.id;
            self.button[i].bg.role = role;

            self.button[i].img_type:setVisible(true);
            self.button[i].img_type:setTexture("ui_new/fight/zhiye_".. role.outline ..".png");
        
            local maxHp = role.blood_maxHp
            local curHp = role.blood_curHp

            self.button[i].img_type:setVisible(true)            
            self.button[i].icon:setVisible(true);
            self.button[i].bg:setVisible(true);

            self.button[i].icon:setFlipX(true)
            Public:addLianTiEffect(self.button[i].icon,role:getMaxLianTiQua(),true)
        else
            self.button[i].icon:setVisible(false);
            self.button[i].bg:setVisible(false);     
        
            self.button[i].img_type:setVisible(false)
            Public:addLianTiEffect(self.button[i].icon,0,false)
        end
    end

    local txt_name = TFDirector:getChildByPath(self.panel_left, "txt_name")
    local txt_zhanli = TFDirector:getChildByPath(self.panel_left, "txt_zhanli")
    local img_guwu = TFDirector:getChildByPath(self.panel_left, "img_guwu")
    img_guwu:setVisible(false)
    txt_name:setText(MainPlayer:getPlayerName())
    
    local img_headIcon = TFDirector:getChildByPath(self.panel_left, "img_role")         --pck change head icon and head icon frame
    img_headIcon:setTexture(MainPlayer:getIconPath())
    img_headIcon:setFlipX(true)
    Public:addFrameImg(img_headIcon,MainPlayer:getHeadPicFrameId())                     --end
    txt_zhanli:setText(AssistFightManager:getStrategyPower(EnumFightStrategyType.StrategyType_PVE))
    --local attri = PeakManager:getTotalAttr() * 0.01
end

function PeakVSLayer:drawRightArea()
    self.button = {}
    for i=1,9 do
        local btnName = "panel_item" .. i;
        self.button[i] = TFDirector:getChildByPath(self.panel_right, btnName);

        btnName = "btn_icon"..i;
        self.button[i].bg = TFDirector:getChildByPath(self.panel_right, btnName);
        self.button[i].bg:setVisible(false);

        self.button[i].icon = TFDirector:getChildByPath(self.button[i].bg ,"img_touxiang");
        self.button[i].icon:setVisible(false);

        self.button[i].img_type     = TFDirector:getChildByPath(self.button[i],"img_zhiye");

        self.button[i].quality = TFDirector:getChildByPath(self.panel_right, btnName);

        local role = self:getRoleBtPos(i);
        local roleInfo = self:getRoleInfoBtPos(i);
        if  role ~= nil then
            self.button[i].icon:setVisible(true);
            self.button[i].icon:setTexture(role:getHeadPath());

            self.button[i].bg:setVisible(true);
            self.button[i].quality:setTextureNormal(GetColorRoadIconByQualitySmall(roleInfo.quality));

            self.button[i].bg.cardRoleId = role.id;
            self.button[i].bg.role = role;

            self.button[i].img_type:setVisible(true);
            self.button[i].img_type:setTexture("ui_new/fight/zhiye_".. role.outline ..".png");

            --Public:addLianTiEffect(self.button[i].icon,roleInfo.forgingQuality,true)
        else
            self.button[i].icon:setVisible(false);
            self.button[i].bg:setVisible(false);     
        
            self.button[i].img_type:setVisible(false)
            Public:addLianTiEffect(self.button[i].icon,0,false)
        end
    end
    local floorInfo = PeakData:objectByID(self.floorId)
    local timeData = PeakManager:getTimeDataByTime(MainPlayer:getNowtime(),self.floorId)
    local txt_num = TFDirector:getChildByPath(self.panel_right, "txt_num")
    local txt_num2 = TFDirector:getChildByPath(self.panel_right, "txt_num2")
    local txt_name = TFDirector:getChildByPath(self.panel_right, "txt_name")
    local txt_zhanli = TFDirector:getChildByPath(self.panel_right, "txt_zhanli")
    local txt_zhandouli = TFDirector:getChildByPath(self.panel_right, "txt_zhandouli")
    local img_zhanlidi = TFDirector:getChildByPath(self.panel_right, "img_zhanlidi")
    local txt_fwq = TFDirector:getChildByPath(self.panel_right, "txt_fwq")
    local txt_bp = TFDirector:getChildByPath(self.panel_right, "txt_bp")
    txt_num:setText(floorInfo.integral * 60 * timeData.percent)
    if self.userData.info ~= nil then
        txt_name:setText(self.userData.info.name)
        txt_zhanli:setText(self.userData.info.power)
        txt_zhandouli:setVisible(true)
        img_zhanlidi:setVisible(true)
        txt_fwq:setText('s' .. math.mod(self.userData.info.serverId,1000))
        txt_bp:setText(self.userData.info.guildName)
        txt_num2:setText(floorInfo.plunder_integral)
        local img_headIcon = TFDirector:getChildByPath(self.panel_right, "img_role")
        img_headIcon:setVisible(true)
        if self.userData.info.useIcon == 0 then
            self.userData.info.useIcon = 1
        end
        local roleConfig = RoleData:objectByID(self.userData.info.useIcon)
        if roleConfig == nil then
            roleConfig = RoleData:objectByID(77)
        end
        img_headIcon:setTexture(roleConfig:getIconPath())
        Public:addFrameImg(img_headIcon,self.userData.info.headPicFrame)
        self.btn_army:setTextureNormal('ui_new/climb/mhy_tiaozhan.png')
        self.btn_army:setTexturePressed('ui_new/climb/mhy_tiaozhan.png')
    else
        local img_headIcon = TFDirector:getChildByPath(self.panel_right, "img_role")
        txt_name:setText('')
        txt_zhanli:setText('')
        txt_zhandouli:setVisible(false)
        img_zhanlidi:setVisible(false)
        img_headIcon:setVisible(false)
        txt_fwq:setText('')
        txt_bp:setText('')
        txt_num2:setText('0')
        self.btn_army:setTextureNormal('ui_new/lunjian/btn_zhanling.png')
        self.btn_army:setTexturePressed('ui_new/lunjian/btn_zhanling.png')
    end
    local txt_jifen = TFDirector:getChildByPath(self.panel_right, "txt_jifen")
    txt_jifen:setText(localizable.LunJianFeng_txt_info_tip)
    txt_jifen:setPositionX(txt_num:getContentSize().width + txt_num:getPositionX())
    local txt_jifen2 = TFDirector:getChildByPath(self.panel_right, "txt_jifen2")
    txt_jifen2:setPositionX(txt_num2:getContentSize().width + txt_num2:getPositionX())
    --Public:addInfoListen(img_headIcon,true,2,self.userData.playerId)
end


function PeakVSLayer.onBtnAttackClickHandle(sender)
    local self      = sender.logic
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.PEAK)
    times = challengeInfo:getLeftChallengeTimes()
    if times <= 0 then
        toastMessage(localizable.LunJianFeng_peak_error)
        return
    end
    local info = self.userData.info
    local callFunc = nil
    local tip = nil
    if info then
        tip = localizable.LunJianFeng_txt_vs_tip1
        callFunc = function()
            PeakManager:requestStartBattle(info.playerId , info.serverId , 1 , self.pos , self.floorId)
        end
        
    else
        tip = localizable.LunJianFeng_txt_vs_tip2
        callFunc = function()
            PeakManager:requestStartBattle(0 , 0 , 0 , self.pos , self.floorId)
            if PeakManager:getActivityStatus() == 1 then
                return
            end
            AlertManager:close(AlertManager.TWEEN_NONE)
        end
    end
    local myInfo = PeakManager:getMyInfo()
    if myInfo.layer and myInfo.layer > 0 and myInfo.pos and myInfo.pos > 0 then
        CommonManager:showOperateSureLayer(
            callFunc,
            nil,
            {
                msg = tip
            }
        )
    else
        callFunc()
    end
    
end

function PeakVSLayer:Attack()
end

function PeakVSLayer.cellTouchBeganHandle(cell)
    local self = cell.logic;
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

function PeakVSLayer.cellTouchMovedHandle(cell)
    local self = cell.logic;
    self.isMove = true;

    if cell.hasRole ~= true then
        return;
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

    self:moveSelectCussor(cell,pos);
end


function PeakVSLayer.cellTouchEndedHandle(cell)
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

end

function PeakVSLayer:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId);
        self.longTouchTimerId = nil;
    end
end

function PeakVSLayer:createSelectCussor(cell,pos)
    play_press();

    cell.isClick = false;

    self.lastPoint = pos;

    -- local role = CardRoleManager:getRoleByGmid(cell.gmId);
    local role = RoleData:objectByID(cell.cardRoleId);
    print("cell.cardRoleId=",cell.cardRoleId)
    self.selectCussor = TFImage:create();
    self.selectCussor:setFlipX(true);
    self.selectCussor:setTexture(role:getHeadPath());
    self.selectCussor:setScale(1);
    self.selectCussor:setPosition(ccpAdd(pos,ccp(0,-0)) );
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);
   
    self.curIndex = cell.posIndex;
    
end

function PeakVSLayer:moveSelectCussor(cell,pos)
    local v = ccpSub(pos, self.lastPoint);
    self.lastPoint = pos;
    local scp = ccpAdd(self.selectCussor:getPosition(), v);
    self.selectCussor:setPosition(scp);
    self.selectCussor:setVisible(true);

    self.curIndex = nil;

    for i=1,9 do
        if  self.button_self[i]:hitTest(pos) then
            self.curIndex = self.button_self[i].posIndex;
            break;
        end
    end

end

function PeakVSLayer:releaseSelectCussor(cell,pos)
    print("PeakVSLayer:releaseSelectCussor")
    if cell.isClick == false  then
        print("ArmyLayer:releaseSelectCussor(cell,pos) ------------222")


        if (self.curIndex == nil) then
            return;
        end
        print("ArmyLayer:releaseSelectCussor(cell,pos) ------------333")

        local dargRole      = CardRoleManager:getRoleByGmid(cell.gmId);
        local toReplaceRole =  StrategyManager:getRoleByIndex(self.curIndex);


        if dargRole == nil then
            print("dargRole is nil ")
            return
        end

        --在阵中释放
        if (self.curIndex ~= -1) then 
            --从列表中拖到阵中
            if (cell.posIndex == -1) then


                --本来已经在阵中
                if dargRole.pos and dargRole.pos ~= 0 then

                    --且不是本角色目前所在的位置，做位置变更
                    if (toReplaceRole == nil or (toReplaceRole and toReplaceRole.gmId ~= dargRole.gmId)) then
                        print("ArmyLayer:releaseSelectCussor(cell,pos) ------------666",dargRole.pos,self.curIndex)
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
                    print("ArmyLayer:releaseSelectCussor(cell,pos) ------------777",cell.gmId,( self.curIndex - 1))
                    local battle = {cell.gmId,( self.curIndex - 1)}
                    showLoading();
                    TFDirector:send(c2s.TO_BATTLE,{battle})

                    play_buzhenyidong()
                end

            --阵中操作，更换位置   
            else
                local sendMsg = {              
                cell.posIndex - 1,
                self.curIndex - 1,   
                };
                print("ArmyLayer:releaseSelectCussor(cell,pos) ------------8888",sendMsg)
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
end

function PeakVSLayer:playInspireEffect()
    -- effect_ymg_inspire
    local effect = self.effect
    if effect == nil then
        local resPath = "effect/effect_ymg_inspire.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        effect = TFArmature:create("effect_ymg_inspire_anim")

        self.panel_left:addChild(effect,2)
        effect:setPosition(ccp(222+70, 310))

        self.effect = effect

        self.effectCompelte = false
        effect:addMEListener(TFARMATURE_COMPLETE,function()
            if self.effect then
                self.effect:setVisible(false)
            end
        end)
    end

    effect:setVisible(true)
    effect:playByIndex(0, -1, -1, 0)
end

return PeakVSLayer
