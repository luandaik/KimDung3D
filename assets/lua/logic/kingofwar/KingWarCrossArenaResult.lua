-- client side KingWarCrossArenaResult.lua
--[[
 * @Description: 上届擂主
 ]]
-- script writer fei
-- creation time 2016-11-8 21:00

local KingWarCrossArenaResult = class("KingWarCrossArenaResult",BaseLayer)

function KingWarCrossArenaResult:ctor(data)

    self.super.ctor(self, data)
    self.lastTeamState = KingOfWarManager:checkIsInTeam()    

    self:init("lua.uiconfig_mango_new.crossarena.CrossArenaResult")
end

function KingWarCrossArenaResult:initUI( ui )

    self.super.initUI(self, ui)

    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.KFKingWar,{HeadResType.SYCEE})

    self.txt_time1 = TFDirector:getChildByPath(ui, 'txt_tips')

    local panel_paim = TFDirector:getChildByPath(ui, "panel_paim")
    self.txtTips = TFDirector:getChildByPath(panel_paim, "txt_tips")
    self.txtTips:setText(localizable.KingWarFightEndTips)
    

    self.teamName = TFDirector:getChildByPath(ui, "txt_teamname")
    self.serverName = TFDirector:getChildByPath(ui, "txt_fwqname")

    local panel_role = TFDirector:getChildByPath(ui,'panel_role')
    self.panel_sz = TFDirector:getChildByPath(panel_role, 'panel_sz')
    
    self.roleList = {}
    for i=1,3 do
        local rolePanel = TFDirector:getChildByPath(self.panel_sz, 'panel_role'..i)
        self.roleList[i] = rolePanel
        local img_role = TFDirector:getChildByPath(rolePanel, "img_role")
        img_role:setVisible(false)
        self.roleList[i].playerName = TFDirector:getChildByPath(self.roleList[i], 'txt_roleName')
        self.roleList[i].redTips = TFDirector:getChildByPath(self.roleList[i], 'txt_name')
    end
    
    self.btn_ljlz = TFDirector:getChildByPath(ui, 'btn_ljlz')
    self.btn_reward = TFDirector:getChildByPath(ui, 'btn_award')
    self.btn_myTeam = TFDirector:getChildByPath(ui, 'btn_myteam')
    self.btnCreate = TFDirector:getChildByPath(ui, 'btn_myTeam')
    self.btn_zhanbao = TFDirector:getChildByPath(ui, 'btn_zhanbao')

    local panel_kaiqi = TFDirector:getChildByPath(ui, "panel_kaiqi")
    panel_kaiqi:setVisible(false)
end

function KingWarCrossArenaResult.onRewardClick( sender )
    KingOfWarManager:openRewardLayer()
end
function KingWarCrossArenaResult.onHistoryListClick( sender )
    local layer = AlertManager:addLayerByFile("lua.logic.kingofwar.KingWarCrossArenaList")
    AlertManager:show()
end
function KingWarCrossArenaResult.onMyTeamClick( sender )
    KingOfWarManager:openMyTeamLayer()
end
function KingWarCrossArenaResult.onCreateTeamClick( sender )
    local layer = AlertManager:addLayerByFile("lua.logic.kingofwar.KingWarCreateTeamLayer")
    AlertManager:show()
end

function KingWarCrossArenaResult:removeUI()
    self.super.removeUI(self)
end

function KingWarCrossArenaResult:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
    local currTeamState = KingOfWarManager:checkIsInTeam()
    if self.lastTeamState == false and currTeamState == true then           
        KingOfWarManager:openMyTeamLayer()
    end
    self.lastTeamState = currTeamState    
end

function KingWarCrossArenaResult:showDetailsInfo()
    self.info = KingOfWarManager:getLastHistoryInfo() or {}

    if self.info.leizhu == nil then
        return
    end
    self.teamName:setText(self.info.leizhu.name)
    -- self.teamName:setText(toVerticalString(self.info.leizhu.name))
    local serverInfo = SaveManager:getServerInfo(self.info.leizhu.serverId) or {}
    self.serverName:setText(serverInfo.name or "")
    self:loadFormation(self.info.leizhu)
    self:setTime(self.info.lastTime)

    if KingOfWarManager:checkIsInTeam() then
        self.btn_myTeam:setVisible(true)
        self.btnCreate:setVisible(false)
    else
        self.btn_myTeam:setVisible(false)
        self.btnCreate:setVisible(true)
    end
end

function KingWarCrossArenaResult:loadFormation(leizhu)
    if self.roleAnimEffect then
        for k,v in pairs(self.roleAnimEffect) do
            v:removeFromParent()
        end
        self.roleAnimEffect = nil
    end
    self.roleAnimEffect = {}
    for k,v in pairs(leizhu.member) do
        print(v)
        self.roleList[k].playerName:setText(v.name)

        local redPackNum = v.redPacket or 0
        self.roleList[k].redTips:setText(stringUtils.format(localizable.KingWarSendRedPack,redPackNum))

        local roleAnim = GameResourceManager:getRoleAniById(v.roleId)
        roleAnim:setPosition(ccp(110,50))
        self.roleList[k]:addChild(roleAnim)
        roleAnim:play("stand", -1, -1, 1)
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/main_role2.xml")
        local effect2 = TFArmature:create("main_role2_anim")
        if effect2 ~= nil then
            effect2:setAnimationFps(GameConfig.ANIM_FPS)
            effect2:playByIndex(0, -1, -1, 1)
            effect2:setZOrder(-1)
            effect2:setPosition(ccp(0, -20))
            roleAnim:addChild(effect2)
        end 
        self.roleAnimEffect[#self.roleAnimEffect + 1] = roleAnim
    end
end

function KingWarCrossArenaResult:setTime(lastTime)
    
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    
    if lastTime == nil or lastTime == 0 then
        self.txt_time1:setText(localizable.multiFight_result_timetxt)
    else
        lastTime = lastTime/1000
        local feedTime = 0--7 * 24 * 60 * 60
        local time1 = lastTime + feedTime
        local timeData = GetCorrectDate("*t",time1)
        self.txt_time1:setText(stringUtils.format(localizable.KingWarOpenTime,timeData.month,timeData.day))
        self.desTime = time1
        local function MakeTimerStr()
            local time2 = self.desTime - MainPlayer:getNowtime()
            local tDay = math.floor(time2/(3600*24))
            time2 = time2 - tDay * 3600*24
            local tHour = math.floor(time2/3600)
            time2 = time2 - tHour*3600
            local tMin = math.floor(time2/60)
            time2 = time2 - tMin*60
            local tSec = math.floor(time2)
            local strList = ""
            if tDay > 0 then
                strList = tDay..localizable.time_day_txt
            end
            if tHour > 0 then
                strList = strList..tHour..localizable.time_hour_txt
            end
            if tMin > 0 then
                strList = strList..tMin..localizable.time_minute_txt
            end
            if tSec <= 0 then 
                tSec = 0
            end
            strList = strList..tSec..localizable.time_second_txt
        end
        MakeTimerStr()
        self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
        function()
            MakeTimerStr()
        end)
    end
end

function KingWarCrossArenaResult:registerEvents()
    if self.registerEventCallFlag then
        return
    end
    self.super.registerEvents(self)
    if self.generalHead then
        self.generalHead:registerEvents()
    end

    KingOfWarManager:requestContestHistory()

    self.btn_ljlz.logic = self;
    self.btn_ljlz:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onHistoryListClick),1);

    self.btn_zhanbao.logic = self;
    self.btn_zhanbao:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onBtnZhanbaoClick),1);

    self.btn_reward.logic = self;
    self.btn_reward:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRewardClick),1);

    self.btn_myTeam.logic = self;
    self.btn_myTeam:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onMyTeamClick),1);

    self.btnCreate.logic = self;
    self.btnCreate:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onCreateTeamClick),1);

    self.registerEventCallFlag = true 

    --KingOfWarManager.UpdateAllLastHistoryMsg
    self.UpdateLastHistoryMsgCallBack = function (event)
        self:showDetailsInfo()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateLastHistoryMsg, self.UpdateLastHistoryMsgCallBack)

    self.getGrandUpdateCallBack = function (event)
        self:onShow()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.getGrandUpdateCallBack)
    self.UpdateFightDataCallBack = function (event)
        KingOfWarManager:openFinalFightDetailLayer()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateFinalFightMsg, self.UpdateFightDataCallBack)
end

function KingWarCrossArenaResult:removeEvents()

    self.registerEventCallFlag = nil  
    self.super.removeEvents(self)

    if self.generalHead then
        self.generalHead:removeEvents()
    end 
    if self.UpdateLastHistoryMsgCallBack then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateLastHistoryMsg, self.UpdateLastHistoryMsgCallBack)
        self.UpdateLastHistoryMsgCallBack = nil
    end
    if self.getGrandUpdateCallBack then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.getGrandUpdateCallBack)
        self.getGrandUpdateCallBack = nil
    end
    if self.UpdateFightDataCallBack then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateFinalFightMsg, self.UpdateFightDataCallBack)
        self.UpdateFightDataCallBack = nil
    end
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    if self.roleAnimEffect then
        for k,v in pairs(self.roleAnimEffect) do
            v:removeFromParent()
        end
        self.roleAnimEffect = nil
    end
end

function KingWarCrossArenaResult:dispose()
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self.super.dispose(self)
end

function KingWarCrossArenaResult.onBtnZhanbaoClick()
    KingOfWarManager:requestFinalFightInfo()
end
return KingWarCrossArenaResult