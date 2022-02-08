-- client side WuLinEnemyMainLayer.lua
--[[
 * @Description: 武林公敌
 ]]
-- script writer chikui
-- creation time 2016-12-22

local WuLinEnemyMainLayer = class("WuLinEnemyMainLayer", BaseLayer)
local EffectPosData = require('lua.table.t_s_wulin_enemies_effect')
function WuLinEnemyMainLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.demond.WuLinGongDiMain")
end


function WuLinEnemyMainLayer:initUI(ui)
	self.super.initUI(self,ui)


    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.WulinEnemy,{HeadResType.COIN,HeadResType.SYCEE})
    self.panel_hurt = TFDirector:getChildByPath(ui, 'panel_hurt')

    local img_levelbg = TFDirector:getChildByPath(ui, 'img_levelbg')
    self.txt_bosslevel = TFDirector:getChildByPath(img_levelbg, 'txt_level')
    self.btn_tiaozhan = TFDirector:getChildByPath(ui, 'btn_tiaozhan')
    self.btn_rule = TFDirector:getChildByPath(ui, 'btn_guize')
    self.btn_jiangli = TFDirector:getChildByPath(ui, 'btn_jiangli')
    self.btn_tuoguan = TFDirector:getChildByPath(ui, 'btn_tuoguan')

    local txt_tiaozhancishu = TFDirector:getChildByPath(ui, 'txt_tiaozhancishu')
    self.txt_times = TFDirector:getChildByPath(txt_tiaozhancishu, 'txt_times')

    self.txt_lengquetime = TFDirector:getChildByPath(ui, 'txt_lengquetime')
    self.txt_coldtime = TFDirector:getChildByPath(self.txt_lengquetime, 'txt_number')

    local img_myinfo = TFDirector:getChildByPath(ui, 'img_myinfo')
    self.txt_myrank = TFDirector:getChildByPath(img_myinfo, 'txt_paiming')
    self.txt_myhurt = TFDirector:getChildByPath(img_myinfo, 'txt_shanghai')

    local panel_boss_info = TFDirector:getChildByPath(ui, 'Panel_xueliang')
    self.bar_bosshp = TFDirector:getChildByPath(panel_boss_info, 'bar_jindu')
    self.txt_bosshp = TFDirector:getChildByPath(panel_boss_info, 'txt_jindunumber')
    self.img_role = TFDirector:getChildByPath(ui, 'Panel_role')
    self.img_jipo = TFDirector:getChildByPath(ui, 'img_jipo')
    self.img_jipo:setVisible(false)

    self.panel_list = TFDirector:getChildByPath(ui, 'Panel_shanghaipaiming')
    self.txt_rank_null = TFDirector:getChildByPath(self.panel_list, 'txt_xuxiyidai')
    self.txt_rank_null:setVisible(false)

    self.panel_jpjl     = TFDirector:getChildByPath(ui, 'panel_jpjl')
    local img_baoxiang  = TFDirector:getChildByPath(self.panel_jpjl, 'img_baoxiang')
    -- local img_jpjl      = TFDirector:getChildByPath(self.panel_jpjl, 'img_jpjl')
    img_baoxiang:setVisible(false)
    -- img_jpjl:setPositionX(img_jpjl:getPositionX() - 20)
    self.panel_rank_model = TFDirector:getChildByPath(ui, 'img_paimingbg')
    self.panel_rank_model:retain()
    self.panel_rank_model:removeFromParent(true)
    self.panel_rank_model:setVisible(false)

    self.effectIndex = 1

    self.role_img_list = {}
    for i=1,4 do
        local img_role = TFDirector:getChildByPath(self.img_role, 'img_' .. i)
        table.insert(self.role_img_list,img_role)
    end
    self.panel_jpjl:setVisible(false)
end

function WuLinEnemyMainLayer:registerEvents()
    self.super.registerEvents(self)


    --ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)



    self.btn_tiaozhan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTiaoZhanClick),1)
    self.btn_tiaozhan.logic = self
    self.btn_rule:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRuleClick),1)
    self.btn_rule.logic = self
    self.btn_jiangli:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRewardClick),1)
    self.btn_jiangli.logic = self
    self.btn_tuoguan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onOneKeyClick),1)
    self.btn_tuoguan.logic = self

    self.refreshBossInfoCallBack = function(event)
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(WuLinEnemyManager.RECEIVE_MAIN_INFO, self.refreshBossInfoCallBack)

    self.refreshFightCDCallBack = function(event)
        self:refreshColdTime()
    end
    TFDirector:addMEGlobalListener(WuLinEnemyManager.RECEIVE_CLEAR_COLD_TIME, self.refreshFightCDCallBack)

    self.receiveChallengeInfoCallBack = function(event)
        local dataInfo = event.data[1][1]
        self:showBossInfo()
        self:showChallengeInfo(dataInfo)
    end
    TFDirector:addMEGlobalListener(WuLinEnemyManager.RECEIVE_CHALLENGE_INFO, self.receiveChallengeInfoCallBack)

    self.rewardBocxCallBack = function(event)
        self:showBoxInfo()
    end
    TFDirector:addMEGlobalListener(WuLinEnemyManager.RECEIVE_REWARD_BOCX ,self.rewardBocxCallBack )

    self.enterSceneCallBack = function(event)
        if self.challengeInfo ~= nil then
            self:drawChallengeInfo(self.challengeInfo)
            self.challengeInfo = nil
        end
        if WuLinEnemyManager:getActivityState() ~= WuLinEnemyManager.ActivityState_1 then
            local callFunc = function()
                if MissionManager:isInTrustOnekey() then
                    MissionManager:stopTrustOnekey()
                end
                AlertManager:close();
            end
            self:runAction(CCCallFunc:create(callFunc))
        else
            WuLinEnemyManager:requestBossInfo(false)
            if MainPlayer.levelUpForTrustOneKey then
                MissionManager:stopTrustOnekey()
                MainPlayer.levelUpForTrustOneKey = nil
            end
            MissionManager:checkTrustOnekeyLayer(self,true)
        end
    end
    TFDirector:addMEGlobalListener("onEnterHomeScene" ,self.enterSceneCallBack )

    if self.generalHead then
        self.generalHead:registerEvents()
        local closeFunc = function(sender)
            if MissionManager:isInTrustOnekey() then
                MissionManager:stopTrustOnekey()
            end
            
            self.generalHead.returnButtonClick(self.generalHead)
        end
        self.generalHead.btn_return:addMEListener(TFWIDGET_CLICK, audioClickfun(closeFunc),1);
    end
    --请求宝箱状态
    WuLinEnemyManager:requestRewardBox()
end

function WuLinEnemyMainLayer:removeEvents()

    TFDirector:removeMEGlobalListener(WuLinEnemyManager.RECEIVE_MAIN_INFO, self.refreshBossInfoCallBack)
    self.refreshBossInfoCallBack = nil
    TFDirector:removeMEGlobalListener(WuLinEnemyManager.RECEIVE_CLEAR_COLD_TIME, self.refreshFightCDCallBack)
    self.refreshFightCDCallBack = nil
    TFDirector:removeMEGlobalListener(WuLinEnemyManager.RECEIVE_CHALLENGE_INFO, self.receiveChallengeInfoCallBack)
    self.receiveChallengeInfoCallBack = nil
    TFDirector:removeMEGlobalListener(WuLinEnemyManager.RECEIVE_REWARD_BOCX, self.rewardBocxCallBack)
    self.rewardBocxCallBack = nil
    TFDirector:removeMEGlobalListener("onEnterHomeScene" ,self.enterSceneCallBack )
    self.enterSceneCallBack = nil
    if self.generalHead then
        self.generalHead:removeEvents()
    end
    if (self.updateTimerBox) then
        TFDirector:removeTimer(self.updateTimerBox)
        self.updateTimerBox = nil
    end
    self.super.removeEvents(self)
end


function WuLinEnemyMainLayer:removeUI()
    if self.panel_rank_model then
        self.panel_rank_model:release()
        self.panel_rank_model = nil
    end

    if self.updateTimerID ~= nil then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self.super.removeUI(self)
end

function WuLinEnemyMainLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();
    self:refreshUI()
    --self:test()
end

function WuLinEnemyMainLayer:test()
    local playerId = MainPlayer:getPlayerId()
    self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
        function()
            local challengeInfo = {
                playerId = playerId,
                name = "杨正立立不立",
                hurt = 50000
            }
            self:drawChallengeInfo(challengeInfo)
        end)
end

function WuLinEnemyMainLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    self.super.dispose(self)
end

function WuLinEnemyMainLayer:refreshUI()
    self:refreshRankInfo()
    self:showMyInfo()
    self:showBossInfo()
    self:refreshColdTime()
end

function WuLinEnemyMainLayer.onTiaoZhanClick(sender)
    local self = sender.logic
    if self:checkCanFight() == false then
        return
    end

    WuLinEnemyManager:openVSLayer()
    --WuLinEnemyManager:requestBossInfo(false)
end

function WuLinEnemyMainLayer:checkCanFight()
    local activityState = WuLinEnemyManager:getActivityState()
    if activityState ~= WuLinEnemyManager.ActivityState_1 then
        toastMessage(localizable.WuLinEnemy_Open)
        return false
    end 
    local bossHp = WuLinEnemyManager:getBossHp()
    if bossHp <= 0 then
        toastMessage(localizable.WuLinEnemy_boss_defeat)
        return false
    end
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.WULIN_ENEMY_CHALLENGE)
    local times = 0
    if challengeInfo then
        times = challengeInfo:getLeftChallengeTimes()
    end
    if times <= 0 then
        toastMessage(localizable.LunJianFeng_txt2)
        return false
    end

    local coldTime = WuLinEnemyManager:getColdTime()
    if coldTime > 0 then
        local resConfig = PlayerResConfigure:objectByID(EnumRecoverableResType.WULIN_ENEMY_CHALLENGE)
        local price = resConfig:getResetWaitPrice(1)
        local msg = stringUtils.format(localizable.WuLinEnemy_ClearCD,price)
        CommonManager:showOperateSureLayer(function()
            WuLinEnemyManager:requestClearCD()
        end,
        nil,
        {
            msg = msg,
        })
        return false
    end
    return true
end

function WuLinEnemyMainLayer.onRuleClick(sender)
    local self = sender.logic
    CommonManager:showRuleLyaer('wulingongdi')
end

function WuLinEnemyMainLayer.onRewardClick(sender)
    WuLinEnemyManager:openRewardLayer()
end

function WuLinEnemyMainLayer.onOneKeyClick(sender)
    local self = sender.logic
    if self:checkCanFight() == false then
        return
    end
    
    MissionManager:startTrustOnekey(self,true)
end

function WuLinEnemyMainLayer:refreshRankInfo()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView = tableView
        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable,self)
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex,self)
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView,self)
        --self.tableView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll,self)
        tableView.logic = self
        self.panel_list:addChild(tableView)
    end
    self.tableView:reloadData()
    if WuLinEnemyManager:getRankSize() <= 0 then
        self.txt_rank_null:setVisible(true)
    else
        self.txt_rank_null:setVisible(false)
    end
end

function WuLinEnemyMainLayer:showBossInfo()
    local bossLevel = WuLinEnemyManager:getBossLevel()
    local bossHp = WuLinEnemyManager:getBossHp()
    if bossLevel <= 0 then
        return
    end
    local bossData = WuLinEnemyData:getObjectByLevel(bossLevel)
    self.txt_bosslevel:setText(bossLevel .. "j")
    if bossData == nil then
        return
    end
    if bossHp <= 0 then
        self.img_role:setShaderProgram("GrayShader", true)
        self.img_jipo:setVisible(true)
    else
        
        self.img_role:setShaderProgramDefault(true)
        self.img_jipo:setVisible(false)
    end
    self:showBoxInfo()
    local percent = math.ceil((bossHp/bossData.hp) * 100)
    self.bar_bosshp:setPercent(percent)
    self.txt_bosshp:setText(percent .. "%")
end

function WuLinEnemyMainLayer:showMyInfo()
    local myRankInfo = WuLinEnemyManager:getMyRankInfo()

    local strRank = myRankInfo.rank
    if myRankInfo.rank == nil or myRankInfo.rank == 0 or myRankInfo.rank > 300 then
        strRank = localizable.shalu_info_txt1
    end
    self.txt_myrank:setText(strRank)
    local strHurt = myRankInfo.hurt or 0
    self.txt_myhurt:setText(strHurt)

    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.WULIN_ENEMY_CHALLENGE)
    local times = 0
    if challengeInfo then
        times = challengeInfo:getLeftChallengeTimes()
    end
    self.txt_times:setText(times)
end

function WuLinEnemyMainLayer:showChallengeInfo( challengeInfo )
    self.challengeInfo = nil
    if Public:currentScene().__cname  == 'HomeScene' then
        self:drawChallengeInfo(challengeInfo)
    else
        if challengeInfo.playerId == MainPlayer:getPlayerId() then
            self.challengeInfo = challengeInfo
        end
    end
end

function WuLinEnemyMainLayer:drawChallengeInfo(challengeInfo)
    local rankSize = WuLinEnemyManager:getRankSize()
    local markIndex = 20
    if rankSize < markIndex then
        markIndex = rankSize
    end
    local isHeavy = false
    if challengeInfo.hurt > 0 then
        local markInfo = WuLinEnemyManager:getRankInfoByIndex(markIndex)
        if markInfo and markInfo.challengeCount then
            local markHurt = (markInfo.hurt/markInfo.challengeCount)
            if challengeInfo.hurt > markHurt then
                isHeavy = true
            end
        end
    end

    local panel = require("lua.logic.wulinenemy.WuLinEnemyHurtLayer"):new()
    self.panel_hurt:addChild(panel,2)

    local posData = EffectPosData:objectByID(self.effectIndex)
    self.effectIndex = self.effectIndex + 1
    if self.effectIndex > EffectPosData:length() then
        self.effectIndex = 1
    end
    local tbl = stringToNumberTable(posData.pos,",")
    panel:setPosition(ccp(tbl[1],tbl[2]))

    panel:setInfo(challengeInfo,isHeavy)

    self:tweenColor(self.role_img_list[posData.index])
end

function WuLinEnemyMainLayer:tweenColor(node)
    local tween = {
        target = node,
        repeated = 3,
        {
            duration = 0.1,
            color = 0xFF6669
        },
        {
            duration = 0.1,
            color = 0xFFFFFF
        }
    }
    TFDirector:toTween(tween)
end

function WuLinEnemyMainLayer.numberOfCellsInTableView(table)
    local self = table.logic

    return WuLinEnemyManager:getRankSize()
end

function WuLinEnemyMainLayer.cellSizeForTable(table,idx)
    local self = table.logic
    return 58 , 250
end

function WuLinEnemyMainLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_rank_model:clone()
        node:setPositionY(28)
        node:setVisible(true)
        cell:addChild(node)
        cell.panel = node
    end

    cell.index = idx + 1

    self:drawRankNode(cell, idx + 1)
    return cell
end

function WuLinEnemyMainLayer:drawRankNode(cell, index)
    local panel = cell.panel
    if panel == nil then
        return
    end
    local rankInfo = WuLinEnemyManager:getRankInfoByIndex(index)
    if rankInfo == nil then
        panel:setVisible(false)
        return
    end
    local img_rank = TFDirector:getChildByPath(panel, "img_mingci")
    local txt_rank = TFDirector:getChildByPath(panel, "txt_mingci")
    if index <= 3 then
        img_rank:setVisible(true)
        txt_rank:setVisible(false)
        img_rank:setTexture("ui_new/leaderboard/no"..index..".png")
    else
        img_rank:setVisible(false)
        txt_rank:setVisible(true)
        txt_rank:setText(index)
    end

    local txt_hurt = TFDirector:getChildByPath(panel, "txt_number")
    txt_hurt:setText(rankInfo.hurt)

    local txt_playername = TFDirector:getChildByPath(panel, "txt_playername")
    txt_playername:setText(rankInfo.name)

    local btn_huifang = TFDirector:getChildByPath(panel, "btn_huifang")
    local func = function( sender )
        WuLinEnemyManager:requestPlayVideo(rankInfo.replayId)
    end
    btn_huifang:addMEListener(TFWIDGET_CLICK,audioClickfun(func))
end

function WuLinEnemyMainLayer:onClickHandleForTrustLayer()
    if self:checkCanFight() == false then
        MissionManager:stopTrustOnekey()
        return
    end

    WuLinEnemyManager:openVSLayer()
    --WuLinEnemyManager:requestBossInfo(false)
end

function WuLinEnemyMainLayer:refreshColdTime()
    local coldTime = WuLinEnemyManager:getColdTime()
    if coldTime <= 0 then
        self.txt_lengquetime:setVisible(false)
        self.txt_coldtime:setText("00:00:00")
        if self.updateTimerID ~= nil then
            TFDirector:removeTimer(self.updateTimerID)
            self.updateTimerID = nil
        end
    else
        if self.updateTimerID == nil then
            self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
                function()
                    self:refreshColdTime()
                end)
        end
        self.txt_lengquetime:setVisible(true)
        local hour = math.floor(coldTime / 3600)
        coldTime = coldTime - hour * 60 * 60
        local min = math.floor(coldTime / 60)
        local sec = coldTime - min * 60
        local strTime = string.format("%02d:%02d:%02d",hour,min,sec)
        self.txt_coldtime:setText(strTime)
    end
end

--
function WuLinEnemyMainLayer:showBoxInfo()
    if (WuLinEnemyManager:getBossHp() <= 0 and WuLinEnemyManager:IsActivityBoxState()) then
        self.panel_jpjl:setVisible(true)
        --
        local function showBoxFunc()
            local data = GetCorrectDate("*t", MainPlayer:getNowtime())
            if (data.wday == 1 or data.wday == 7) then
                if (data.hour == 13) then
                    self.panel_jpjl:setVisible(false)
                    if (self.updateTimerBox) then
                        TFDirector:removeTimer(self.updateTimerBox)
                        self.updateTimerBox = nil
                    end    
                end
            end
        end  
        if (self.EscortingEffect == nil) then
            local resPath = "effect/escorting.xml"
            TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
            local effect = TFArmature:create("escorting_anim")
            effect:setAnimationFps(GameConfig.ANIM_FPS)
            self.panel_jpjl:addChild(effect, 1)
            effect:setPosition(ccp(50, 50))
            self.EscortingEffect = effect
        end
        if (self.EscortingEffect) then
            self.EscortingEffect:playByIndex(1, -1, -1, 1)
        end
        self.panel_jpjl:setTouchEnabled(true)
        self.panel_jpjl:addMEListener(TFWIDGET_CLICK, function( sender )
                                                            WuLinEnemyManager:requestRewardBox(1)
                                                        end)
                                                
        if (self.updateTimerBox == nil) then
            self.updateTimerBox = TFDirector:addTimer(3000, -1, nil, function() showBoxFunc() end)
        end
        showBoxFunc()
    else
        self.panel_jpjl:setVisible(false)
    end
end
return WuLinEnemyMainLayer