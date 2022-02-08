--[[
******英雄大会进攻详情*******
]]
local HeroArmyVSLayer = class("HeroArmyVSLayer", BaseLayer);

CREATE_SCENE_FUN(HeroArmyVSLayer);
CREATE_PANEL_FUN(HeroArmyVSLayer);

HeroArmyVSLayer.LIST_ITEM_WIDTH = 200; 

function HeroArmyVSLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.hero.HeroVSLayer");
    self.firstShow = true
end

function HeroArmyVSLayer:initUI(ui)
    self.super.initUI(self,ui);

    self.generalHead = CommonManager:addGeneralHead(self)

    self.generalHead:setData(ModuleType.Hero,{HeadResType.HERO,HeadResType.WEIWANG,HeadResType.SYCEE})

    self.bqPath = {"ui_new/hero/img_bq5.png", "ui_new/hero/img_bq6.png", "ui_new/hero/img_bq7.png", "ui_new/hero/img_bq8.png"}
    self.panel_left   = TFDirector:getChildByPath(ui, 'Panel_1')
    self.panel_right   = TFDirector:getChildByPath(ui, 'Panel_2')

    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close')
    
    self.btn_army       = TFDirector:getChildByPath(ui, 'btn_challenge')
    self.btn_buzhen     = TFDirector:getChildByPath(ui, 'btn_buzhen')


    self.img_biaoqian_self = TFDirector:getChildByPath(self.panel_left, 'img_biaoqian')
    self.img_biaoqian_other = TFDirector:getChildByPath(self.panel_right, 'img_biaoqian')


    self.txt_rank_self  = TFDirector:getChildByPath(self.panel_left, 'txt_paiming')
    self.txt_rank_other = TFDirector:getChildByPath(self.panel_right, 'txt_paiming')
    self.bg_wsb_self    = TFDirector:getChildByPath(self.panel_left, 'bg_wsb')
    self.bg_wsb_other   = TFDirector:getChildByPath(self.panel_right, 'bg_wsb')
    self.img_jibai_left     = TFDirector:getChildByPath(self.panel_left, 'img_jibai')
    self.txt_jinum_left           = TFDirector:getChildByPath(self.img_jibai_left, 'txt_num1')
    self.txt_wwnum_left           = TFDirector:getChildByPath(self.img_jibai_left, 'txt_num2')
    self.img_jibai_right           = TFDirector:getChildByPath(self.panel_right, 'img_jibai')
    self.txt_jinum_right           = TFDirector:getChildByPath(self.img_jibai_right, 'txt_num1')
    self.txt_wwnum_right           = TFDirector:getChildByPath(self.img_jibai_right, 'txt_num2')
    -- self.txt_name       = TFDirector:getChildByPath(ui, 'txt_mingcheng_word')

    -- self.txt_rank       = TFDirector:getChildByPath(ui, 'txt_paiming_word')
    -- self.txt_power      = TFDirector:getChildByPath(ui, 'txt_zhandouli_word')
    -- self.txt_winRate    = TFDirector:getChildByPath(ui, 'txt_shenglv_word')

    self.img_rolebg = {}
    self.img_role = {}
    self.img_role_quility = {}
end

function HeroArmyVSLayer:loadData(userData)
    self.userData = userData
    print("阵容",self.userData)
end

function HeroArmyVSLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI()
    self:refreshUI()
    self:drawLeftArea()
    self:drawRightArea()
    if self.firstShow == true then
        self.ui:runAnimation("Action0",1);
        self.firstShow = false
    end
    Public:addZhenFaIconForArmy(self.panel_left, EnumFightStrategyType.StrategyType_PVE)
end

function HeroArmyVSLayer:refreshBaseUI()

end

function HeroArmyVSLayer:refreshUI()
    if not self.isShow then
        return;
    end
    CommonManager:setRedPoint(self.btn_buzhen, AssistFightManager:isCanRedPoint( LineUpType.LineUp_BloodyBattle ),"isHaveCanZhaomu",ccp(0,0))
end

function HeroArmyVSLayer:getRoleBtPos(pos)
    for _,v in pairs(self.userData.info) do
        local idx = v.position + 1
        if idx == pos then
            return RoleData:objectByID(v.templateId),v.forgingQuality
        end
    end
end

function HeroArmyVSLayer.cellClickHandle(sender)
    local self = sender.logic;
    local cardRoleId = sender.cardRoleId;
    Public:ShowItemTipLayer(sender.role.id, EnumDropType.ROLE, 1,sender.role.level)
end

function HeroArmyVSLayer.onBtnAttackClickHandle(sender)
    local self = sender.logic;
    HeroMeetingManager:challengePlayer(self.userData.targetId);
    AlertManager:close(AlertManager.TWEEN_NONE);
end
--注册事件
function HeroArmyVSLayer:registerEvents()
    self.super.registerEvents(self);
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);
    self.btn_close:setClickAreaLength(100);

    self.updatePosCallBack = function(event)
        self:drawLeftArea()
    end
    TFDirector:addMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS ,self.updatePosCallBack )    
   
    self.btn_army.logic = self;
    self.btn_army:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAttackClickHandle),1);


    local function enterStarge(sender)
        CardRoleManager:openRoleList();
    end
    self.btn_buzhen:addMEListener(TFWIDGET_CLICK,  audioClickfun(enterStarge),1)

   for i=1,9 do
        local bg = TFDirector:getChildByPath(self.panel_right, "btn_icon"..i)
        bg.logic = self
        bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.cellClickHandle),1)
    end

    for i=1,9 do
        local bg = TFDirector:getChildByPath(self.panel_left, "btn_icon"..i)
        bg.logic = self
        bg.posIndex = i

        -- bg:addMEListener(TFWIDGET_CLICK, audioClickfun(enterStarge),1)

        bg:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle,1);
        bg:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
        bg:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);   
    end 
end

function HeroArmyVSLayer:removeEvents()
    TFDirector:removeMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS ,self.updatePosCallBack ) 
    self.updatePosCallBack = nil;

    self.super.removeEvents(self)
    self.firstShow = true
    if self.generalHead then
        self.generalHead:removeEvents()
    end

end


function HeroArmyVSLayer:drawLeftArea()
    self.button_self = {}
    self.button = {}
    for i=1,9 do
        self.button[i] = TFDirector:getChildByPath(self.panel_left, "panel_item" .. i);

        self.button_self[i] = self.button[i]
        self.button_self[i].posIndex = i;

        self.button[i].bg = TFDirector:getChildByPath(self.panel_left, "btn_icon"..i);
        self.button[i].bg:setVisible(false);
        self.button[i].icon = TFDirector:getChildByPath(self.button[i].bg ,"img_touxiang");
        self.button[i].icon:setVisible(false);

        self.button[i].img_type     = TFDirector:getChildByPath(self.button[i],"img_zhiye");
        self.button[i].quality = TFDirector:getChildByPath(self.panel_left, "btn_icon"..i);

        -- local role = self:getRoleBtPos(i);
        self.button[i].bg.gmid = 0
        local role = StrategyManager:getRoleByIndex(i);
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
    txt_name:setText(MainPlayer:getPlayerName())
    txt_zhanli:setText(StrategyManager:getPower())

    local img_headIcon = TFDirector:getChildByPath(self.panel_left, "img_role")         --pck change head icon and head icon frame
    img_headIcon:setTexture(MainPlayer:getIconPath())
    img_headIcon:setFlipX(true)
    Public:addFrameImg(img_headIcon,MainPlayer:getHeadPicFrameId())                     --end
    self.txt_rank_self:setText(HeroMeetingManager.myRank)
    if HeroMeetingManager.myRank == 0 then
        self.bg_wsb_self:setVisible(true)
    else
        self.bg_wsb_self:setVisible(false)
    end

    self.img_biaoqian_self:setTexture(self.bqPath[HeroMeetingManager.myGroup])
    self.txt_jinum_left:setText(HeroMeetingManager:GetMyScore())
    self.txt_wwnum_left:setText(getResValueExpressionByTypeForGH(HeadResType.WEIWANG))
end

function HeroArmyVSLayer:drawRightArea()
    self.button = {}
    for i=1,9 do
        self.button[i] = TFDirector:getChildByPath(self.panel_right, 'panel_item'..i);
        self.button[i].bg = TFDirector:getChildByPath(self.panel_right, 'btn_icon'..i);
        self.button[i].bg:setVisible(false);
        self.button[i].icon = TFDirector:getChildByPath(self.button[i].bg ,"img_touxiang");
        self.button[i].icon:setVisible(false);
        self.button[i].img_type     = TFDirector:getChildByPath(self.button[i],"img_zhiye");
        self.button[i].quality = TFDirector:getChildByPath(self.panel_right, 'btn_icon'..i);
        self.button[i].img_zf = TFDirector:getChildByPath(self.panel_right, 'img_zf'..i);
        self.button[i].img_zf:setVisible(false)
        local role,forgingQuality = self:getRoleBtPos(i);
        if role ~= nil then
            self.button[i].icon:setVisible(true);
            self.button[i].icon:setTexture(role:getHeadPath());

            self.button[i].bg:setVisible(true);
            self.button[i].quality:setTextureNormal(GetColorRoadIconByQualitySmall(role.quality));
            self.button[i].img_type:setVisible(true);
            self.button[i].img_type:setTexture("ui_new/fight/zhiye_".. role.outline ..".png");

            self.button[i].bg.cardRoleId = role.id;
            self.button[i].bg.role = role;
            --炼体特效
            Public:addLianTiEffect(self.button[i].icon,forgingQuality,true)
        else
            self.button[i].img_type:setVisible(false); 
            self.button[i].icon:setVisible(false);
            self.button[i].bg:setVisible(false);
            Public:addLianTiEffect(self.button[i].icon,0,false)  
        end
    end

    local txt_name = TFDirector:getChildByPath(self.panel_right, "txt_name")
    local txt_zhanli = TFDirector:getChildByPath(self.panel_right, "txt_zhanli")
    txt_name:setText(self.userData.targetName)
    txt_zhanli:setText(self.userData.targetPower)

    local img_headIcon = TFDirector:getChildByPath(self.panel_right, "img_role")         --pck change head icon and head icon frame
    -- if self.userData.icon == nil or self.userData.icon <= 0 then
    --     self.userData.icon = self.userData.profession
    -- end
    local roleConfig = RoleData:objectByID(self.userData.useIcon)
    if roleConfig == nil then
        roleConfig = RoleData:objectByID(77)
    end
    img_headIcon:setTexture(roleConfig:getIconPath())
    Public:addFrameImg(img_headIcon,self.userData.headPicFrame)                            --end
    self.txt_rank_other:setText(self.userData.targetRank)
    if self.userData.targetRank == 0 then
        self.bg_wsb_other:setVisible(true)
    else
        self.bg_wsb_other:setVisible(false)
    end
    self.img_biaoqian_other:setTexture(self.bqPath[self.userData.targetGroup])
    --（敌方积分 -我方积分 )/单局系数+单局保底
    -- 如果积分相差过大，获得积分为负数则给5分
    local jifen = math.ceil((self.userData.targetScore - HeroMeetingManager:GetMyScore())/20 + 30)
    if jifen < 10 then
        jifen = 10
    elseif jifen > 45 then
        jifen = 45
    end
    self.txt_jinum_right:setText(jifen)
    local WeiWang = ConstantData:objectByID("Challenge.HeroDuel.Win.Prestige").value or 500
    self.txt_wwnum_right:setText(WeiWang)

end


function HeroArmyVSLayer.cellTouchBeganHandle(cell)
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

function HeroArmyVSLayer.cellTouchMovedHandle(cell)
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


function HeroArmyVSLayer.cellTouchEndedHandle(cell)
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

function HeroArmyVSLayer:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId);
        self.longTouchTimerId = nil;
    end
end

function HeroArmyVSLayer:createSelectCussor(cell,pos)
    play_press();

    cell.isClick = false;

    self.lastPoint = pos;

    local role = CardRoleManager:getRoleByGmid(cell.gmId);
    self.selectCussor = TFImage:create();
    self.selectCussor:setFlipX(true);
    self.selectCussor:setTexture(role:getHeadPath());
    self.selectCussor:setScale(1);
    self.selectCussor:setPosition(ccpAdd(pos,ccp(0,-0)) );
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);
   
    self.curIndex = cell.posIndex;
    
end

function HeroArmyVSLayer:moveSelectCussor(cell,pos)
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

function HeroArmyVSLayer:releaseSelectCussor(cell,pos)
    
    if cell.isClick == false  then
        if (self.curIndex == nil) then
            return;
        end
        local dargRole      = CardRoleManager:getRoleByGmid(cell.gmId);
        local toReplaceRole =  StrategyManager:getRoleByIndex(self.curIndex);


        --在阵中释放
        if (self.curIndex ~= -1) then 

            --从列表中拖到阵中
            if (cell.posIndex == -1) then

                --本来已经在阵中
                if dargRole.pos and dargRole.pos ~= 0 then
                     --且不是本角色目前所在的位置，做位置变更
                    if (toReplaceRole == nil or (toReplaceRole and toReplaceRole.gmId ~= dargRole.gmId)) then
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
                            local str = stringUtils.format(localizable.common_function_up_number, needLevel
											, StrategyManager.maxNum + 1)
                            toastMessage(str);
                        end
                    end 

                --要替换，但是替换对象是主角
                --elseif (toReplaceRole and  toReplaceRole.gmId == MainPlayer:getPlayerId()) then
                --    toastMessage("主角不能下阵");

                --上阵，如果目标存在角色，将其下阵
                else
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
return HeroArmyVSLayer;
