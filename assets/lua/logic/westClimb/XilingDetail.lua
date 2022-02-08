-- client side XilingListLayer.lua
--[[
 * @Description: 西岭主界面右边
 ]]
-- script writer wuqi
-- creation time 2016-06-27

local XilingDetail = class("XilingDetail", BaseLayer);

local XilingNpcData = require("lua.table.t_s_serdang_npc")

CREATE_SCENE_FUN(XilingDetail);
CREATE_PANEL_FUN(XilingDetail);

XilingDetail.TEXTURE_HISTORY = "ui_new/climb/img_lsss.png"
XilingDetail.TEXTURE_SEASON = "ui_new/climb/img_sjss.png"

function XilingDetail:ctor(data)
    self.super.ctor(self,data);
    self.hasLoad = false
    self:init("lua.uiconfig_mango_new.climb.XilingDetail");
end

function XilingDetail:initUI(ui)
    self.super.initUI(self, ui);
    self.btn_onekey = TFDirector:getChildByPath(ui, 'btn_onekey')
    --标题
    self.txt_title = TFDirector:getChildByPath(ui, 'txt_title')
    --文字介绍
    self.txt_storydetail = TFDirector:getChildByPath(ui, 'txt_description')

    self.panel_buzhen = TFDirector:getChildByPath(ui, 'panel_buzhen')
    self.btn_attack_1 = TFDirector:getChildByPath(self.panel_buzhen, 'btn_attack')
    self.btn_army_1 = TFDirector:getChildByPath(self.panel_buzhen, 'btn_embattle')

    self.panel_saodang = TFDirector:getChildByPath(ui, 'panel_saodang')
    self.btn_attack_2 = TFDirector:getChildByPath(self.panel_saodang, 'btn_attack')
    self.btn_army_2 = TFDirector:getChildByPath(self.panel_saodang, 'btn_embattle')
    self.btn_sweep = TFDirector:getChildByPath(self.panel_saodang, 'btn_sweep')
    self.txt_sweep_num = TFDirector:getChildByPath(self.panel_saodang, 'txt_sweep_num')
    self.txt_num = TFDirector:getChildByPath(ui, 'txt_num')

    self.panel_content = TFDirector:getChildByPath(ui, 'panel_content')
    self.panel_reward = TFDirector:getChildByPath(ui, 'panel_reward')
    self.txt_zhanli = TFDirector:getChildByPath(ui, 'txt_zhanli')
    self.btn_yongbing = TFDirector:getChildByPath(ui, 'btn_yongbing')

    self.txt_zhanli = TFDirector:getChildByPath(ui, "txt_zhanli")
    self.txt_title = TFDirector:getChildByPath(ui, "txt_title")
    self.panel_reward = TFDirector:getChildByPath(ui, 'panel_reward')
    self.txt_description = TFDirector:getChildByPath(ui, "txt_description")
    self.panel_saodang = TFDirector:getChildByPath(ui, "panel_saodang")
    self.btn_buzhen = TFDirector:getChildByPath(self.panel_saodang, "btn_embattle")
    self.btn_buzhen.logic = self
    self.btn_attack = TFDirector:getChildByPath(self.panel_saodang, "btn_attack")
    self.btn_attack.logic = self
    self.txt_stone_consume = TFDirector:getChildByPath(self.btn_attack, "txt_1")
    self.btn_sweep = TFDirector:getChildByPath(self.panel_saodang, "btn_sweep")
    self.txt_sweep_num = TFDirector:getChildByPath(self.btn_sweep, "txt_sweep_num")
    self.btn_sweep.logic = self

    self.button = {};
    for i = 1, 9 do
        local btnName = "img_zhenwei" .. i;
        self.button[i] = TFDirector:getChildByPath(ui, btnName);
        self.button[i]:setVisible(false)
        btnName = "img_quality" .. i;
        self.button[i].bg = TFDirector:getChildByPath(ui, btnName);
        self.button[i].icon = TFDirector:getChildByPath(self.button[i].bg , "img_role" .. i);
        btnName = "img_zhiye";
        self.button[i].img_zhiye = TFDirector:getChildByPath(self.button[i].bg, btnName);       
    end

    self.btn_help = TFDirector:getChildByPath(ui, "btn_help")
    self.btn_help.logic = self

    local bg_tuijianzhanli = TFDirector:getChildByPath(ui, "bg_tuijianzhanli")
    bg_tuijianzhanli:setVisible(false)
end

function XilingDetail:loadData(floorId, homeInfo, force)
    if force == nil then
        force = true
    end
    if force == false and self.hasLoad == true then
        return
    end
    self.hasLoad = true
    self.floorId = floorId;
    self.homeInfo = homeInfo;

    self:refreshBaseUI();
    self:refreshUI();
end

function XilingDetail:onShow()
    self.super.onShow(self)
end

function XilingDetail:refreshBaseUI()

end

function XilingDetail:refreshUI()
    self.serdangInfo = WestClimbManager:getSerdangInfo()
    self.floorInfo = WestClimbManager:getFloorInfo()
    self.mountainItem = XilingData:objectByID(self.floorId)
    self.formation = WestClimbManager:getFormation(self.floorId)
    self.posTab = WestClimbManager:getFormationIndex(self.floorId)

    local floor = math.min(WestClimbManager:getCurFloorId(), XilingData:back().id)
    self.txt_title:setText(self.mountainItem.name)
    self.txt_storydetail:setText(self.mountainItem.pass_tips)
    self.txt_zhanli:setText(self.mountainItem.power)

    self.panel_reward:removeAllChildren();

    local rewardType = WestClimbManager:getFloorRewardType(self.mountainItem.id)

    local rewardList = WestClimbManager:getRewardList(self.mountainItem.id)
    print("rewardList >> ", rewardList)

    if WestClimbManager:getNextFloorId() > XilingData:length() then
        rewardList = WestClimbManager:getAgainRewardItemList(self.floorId)
    end

    local index = 1;
    for reward in rewardList:iterator() do
        local rewardNode = Public:createIconNumNode(reward)
        rewardNode:setScale(0.6);
        rewardNode:setPosition(0, -80*index)
        self.panel_reward:addChild(rewardNode);
        index = index + 1;

        local img = nil
        if reward.newType == WestClimbManager.REWARD_TYPE.PASS_HISTORY then
            img = TFImage:create(self.TEXTURE_HISTORY)           
        elseif reward.newType == WestClimbManager.REWARD_TYPE.PASS_SEASON then
            img = TFImage:create(self.TEXTURE_SEASON)   
        end
        if img then
            img:setScale(1.8)
            local widgetSize = rewardNode:getSize()
            local pos = ccp(widgetSize.width / 2 + 5, widgetSize.height)
            img:setPosition(pos)
            rewardNode:addChild(img, 100)
        end
    end
    for i = 1, 9 do
        self.button[i]:setVisible(false);
    end

    --if self.floorInfo[self.floorId].npc and self.floorInfo[self.floorId].npc.isBoss then
    if self.floorInfo[self.floorId].npc then
        local id = self.floorInfo[self.floorId].npc.npc.npcId
        local item = XilingNpcData:objectByID(id)
        local tip = item.title
        self.txt_storydetail:setText(tip)
    end

    print("self.floorId ==== > ", self.floorId)
    for index = 1, 9 do
        --local npcInfo = NPCData:objectByID(self.formation[index])
        local roleId = self.formation[index]
        local pos = self.posTab[index]
        if roleId and roleId ~= 0 then
            local role = nil
            if self.floorInfo[self.floorId].npc and self.floorInfo[self.floorId].npc.isBoss then
                role = RoleData:objectByID(roleId)                                
            else
                local npcInfo = NPCData:objectByID(roleId)
                local roleId = npcInfo.role_id
                role = RoleData:objectByID(roleId) 
            end
            if role and pos then
                pos = pos + 1
                self.button[pos]:setVisible(true)
                self.button[pos].icon:setVisible(true);
                self.button[pos].icon:setTexture(role:getHeadPath());

                self.button[pos].bg:setVisible(true);
                self.button[pos].bg:setTexture(GetColorRoadIconByQualitySmall(role.quality));

                self.button[pos].img_zhiye:setVisible(true);
                self.button[pos].img_zhiye:setTexture("ui_new/fight/zhiye_" .. role.outline ..".png");

                self.button[pos].bg.role = role;
                self.button[pos].bg.logic = self;
                
                self.button[pos].bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.cellClickHandle), 1);
            end
            pos = pos + 1
        end        
    end

    self.panel_buzhen:setVisible(false)
    self.panel_saodang:setVisible(false)
    local newId = WestClimbManager:getNextFloorId()
    if  self.mountainItem.id < newId then
        self.panel_saodang:setVisible(true)
        local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.XILING)        
        local challengeTime = 0
        if challengeInfo then
            challengeTime = tonumber(challengeInfo:getLeftChallengeTimes())
        end
        self.txt_sweep_num:setText(challengeTime)
        if challengeTime > 0 then
            self.btn_sweep:setGrayEnabled(false)
            self.btn_sweep:setTouchEnabled(true)
        else
            self.btn_sweep:setGrayEnabled(true)
            self.btn_sweep:setTouchEnabled(false)
        end
    elseif self.mountainItem.id == newId then
        self.panel_buzhen:setVisible(true)
    elseif self.mountainItem.id > newId then
        -- self.btn_sweep:setVisible(false)
    end
end

function XilingDetail.cellClickHandle(sender)
    local self = sender.logic;
    local role = sender.role;
    Public:ShowItemTipLayer(role.id, EnumDropType.ROLE, 1, role.level)
end

function XilingDetail.onAttackClickHandle(sender)
    local self = sender.logic;

    print("XilingDetail.onAttackClickHandle == > ", self.mountainItem.id)

    if not MainPlayer:isEnoughTimes(EnumRecoverableResType.XILING, 1, true) then
        MissionManager:stopTrustOnekey()
        return ;
    end
    
    local mountainItemId = self.mountainItem.id;
    WestClimbManager:requestSerdangChallenge(mountainItemId);
end
function XilingDetail.onYongbingClickHandle(sender)
    local self = sender.logic;

    if not MainPlayer:isEnoughTimes(EnumRecoverableResType.XILING, 1, true) then
        return ;
    end

    local mountainItemId = self.mountainItem.id;
    EmployManager:openRoleList(function ()
        AlertManager:close()
        WestClimbManager:requestSerdangChallenge(mountainItemId,EnumFightStrategyType.StrategyType_HIRE_TEAM);
    end)

end

function XilingDetail.onArmyClickHandle(sender)
    local self = sender.logic;
    CardRoleManager:openRoleList(false);
end

function XilingDetail.onSweepButtonClick(sender)
    local self = sender.logic
    print("XilingDetail.onSweepButtonClick == > ", self.mountainItem.id)
    WestClimbManager:requestSerdangSweep(self.mountainItem.id, nil)
end

function XilingDetail.onHelpButtonClick(sender)
    local self = sender.logic
    CommonManager:showRuleLyaer('wuliangshanemeng')
end

--注册事件
function XilingDetail:registerEvents()
   self.super.registerEvents(self);
    
    self.btn_onekey.logic = self
    self.btn_onekey:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onBtnOneKeyClick),1);

   self.btn_attack_1.logic = self;
   self.btn_attack_1:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onAttackClickHandle),1);

   self.btn_yongbing.logic = self;
   self.btn_yongbing:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onYongbingClickHandle),1);

   self.btn_attack_2.logic = self;
   self.btn_attack_2:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onAttackClickHandle),1);

   self.btn_army_1.logic = self;
   self.btn_army_1:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onArmyClickHandle),1);

   self.btn_army_2.logic = self;
   self.btn_army_2:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onArmyClickHandle),1);

   self.btn_sweep.logic = self;
   self.btn_sweep:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSweepButtonClick),1);

   self.btn_help.logic = self;
   self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpButtonClick),1);

   if not self.sweepResultCallback then
        self.sweepResultCallback = function ()
           self:refreshUI()
        end
        TFDirector:addMEGlobalListener(WestClimbManager.SERDANG_SWEEP_REPONSE, self.sweepResultCallback)
        
        self.xilingStoneChangeCallBack = function(event)   
            self:refreshUI()
        end;
        TFDirector:addMEGlobalListener(MainPlayer.ChallengeTimesChange, self.xilingStoneChangeCallBack);
    end

    self.leaveFightCallBack = function(event)
        if MainPlayer.levelUpForTrustOneKey then
            MissionManager:stopTrustOnekey()
            MainPlayer.levelUpForTrustOneKey = nil
        end
        MissionManager:checkTrustOnekeyLayer(self,true)
    end
    TFDirector:addMEGlobalListener(FightManager.LeaveFightForOneKey ,self.leaveFightCallBack )
end

function XilingDetail:removeEvents()    
    TFDirector:removeMEGlobalListener(WestClimbManager.SERDANG_SWEEP_REPONSE, self.sweepResultCallback)
    self.sweepResultCallback = nil

    TFDirector:removeMEGlobalListener(MainPlayer.ChallengeTimesChange, self.xilingStoneChangeCallBack);
    self.xilingStoneChangeCallBack = nil

    TFDirector:removeMEGlobalListener(FightManager.LeaveFightForOneKey ,self.leaveFightCallBack )
    self.leaveFightCallBack = nil

    self.super.removeEvents(self)
end

function XilingDetail.onBtnOneKeyClick(sender)
    local self = sender.logic

    local currId = WestClimbManager:getCurFloorId()
    local passId = WestClimbManager:getPassedFloorId()

    if currId == passId then
        toastMessage(localizable.TrustOneKey_Nomore)
        MissionManager:stopTrustOnekey()
        return
    end

    TFDirector:dispatchGlobalEventWith(FightManager.LeaveFightForOneKey, {})
    MissionManager:startTrustOnekey(self,true)
end


function XilingDetail:onClickHandleForTrustLayer()

    if not MainPlayer:isEnoughTimes(EnumRecoverableResType.XILING, 1, true) then
        MissionManager:stopTrustOnekey()
        return ;
    end
    
    local currId = WestClimbManager:getCurFloorId()
    local passId = WestClimbManager:getPassedFloorId()
    if currId == passId then
        toastMessage(localizable.TrustOneKey_Nomore)
        MissionManager:stopTrustOnekey()
        return
    end    
    WestClimbManager:requestSerdangChallenge(currId);
end
return XilingDetail;
