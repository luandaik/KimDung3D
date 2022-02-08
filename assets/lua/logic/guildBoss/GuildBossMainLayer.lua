-- client side GuildBossMainLayer.lua
--[[
 * @Description: 帮派延误
 ]]
-- script writer chikui
-- creation time 2017-04-13


local GuildBossMainLayer = class("GuildBossMainLayer", BaseLayer)
function GuildBossMainLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.faction.YanWuMain")
    ResetLoadLuaFile()
end

GuildBossMainLayer.TABTYPE_NONE = 0
GuildBossMainLayer.TABTYPE_CISHU = 1
GuildBossMainLayer.TABTYPE_SHANGHAI = 2
function GuildBossMainLayer:initUI(ui)
	self.super.initUI(self,ui)


    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.GuildBoss,{HeadResType.COIN,HeadResType.SYCEE})

    self.panel_kaiqi = TFDirector:getChildByPath(ui, 'panel_kaiqi')
    self.img_bg = TFDirector:getChildByPath(ui, 'img_bg')
    self.panel_wkq = TFDirector:getChildByPath(ui, 'panel_wkq')
    self.img_levelbg = TFDirector:getChildByPath(ui, 'img_levelbg')
    self.txt_level = TFDirector:getChildByPath(self.img_levelbg, 'txt_level')
    self.img_qtsx = TFDirector:getChildByPath(ui, 'img_qtsx')
    self.txt_bfb = TFDirector:getChildByPath(self.img_qtsx, 'txt_bfb')
    self.btn_zzzj = TFDirector:getChildByPath(ui, 'btn_zzzj')
    self.btn_zzjg = TFDirector:getChildByPath(ui, 'btn_zzjg')
    self.btn_guizhe = TFDirector:getChildByPath(ui, 'btn_guizhe')
    self.btn_jiangli = TFDirector:getChildByPath(ui, 'btn_jiangli')
    self.btn_paihang = TFDirector:getChildByPath(ui, 'btn_paihang')
    self.panel_hurt = TFDirector:getChildByPath(ui, 'panel_hurt')
    self.txt_zztime = TFDirector:getChildByPath(self.btn_zzjg, 'txt_time')
    ---------------------panel_wkq
    self.btn_kqyw = TFDirector:getChildByPath(self.panel_wkq, 'btn_kqyw')
    self.txt_canopentime = TFDirector:getChildByPath(self.btn_kqyw, 'txt_time')
    self.tipcanopentime = TFDirector:getChildByPath(self.btn_kqyw, 'tipcanopentime')
    self.zyBar = TFDirector:getChildByPath(self.panel_wkq, 'bar_exp1')
    self.txt_zyjindu = TFDirector:getChildByPath(self.panel_wkq, 'txt_jindu')

    ---------新增伤害统计界面--------------------
    self.Panel_Paihang = TFDirector:getChildByPath(ui, 'Panel_Paihang')
    -- self.Panel_Paihang:setVisible(true)
    self.img_di = TFDirector:getChildByPath(self.Panel_Paihang, 'img_di')
    self.img_di:setPositionX(0)
    self.btn_jifen = TFDirector:getChildByPath(self.img_di, 'btn_jifen')
    self.btn_attNum = TFDirector:getChildByPath(self.img_di, 'btn_cishu')
    self.btn_shuaxin = TFDirector:getChildByPath(self.img_di, 'btn_shuaxin')
    self.txt_paiming = TFDirector:getChildByPath(self.img_di, 'txt_paiming')
    self.txt_shanghai = TFDirector:getChildByPath(self.img_di, 'txt_shanghai')
    self.txt_num_rank = TFDirector:getChildByPath(self.txt_paiming, 'txt_num')
    self.txt_num_hurt = TFDirector:getChildByPath(self.txt_shanghai, 'txt_num')
    self.panel_gun = TFDirector:getChildByPath(self.img_di, 'panel_gun')

    self.panel_rank_2 = TFDirector:getChildByPath(self.Panel_Paihang, 'panel_rank_2')
    self.panel_rank_2:removeFromParent()
    self.panel_rank_2:retain()
    self.panel_rank_2:setVisible(false)
    
    ---------------------panel_kaiqi
    self.bg_sysj = TFDirector:getChildByPath(self.panel_kaiqi, 'bg_sysj')
    self.txt_zstime = TFDirector:getChildByPath(self.bg_sysj, 'txt_time')
    self.bg_time = TFDirector:getChildByPath(self.panel_kaiqi, 'bg_time')
    self.txt_tzTime = TFDirector:getChildByPath(self.bg_time, 'txt_time')
    self.txt_jipo = TFDirector:getChildByPath(self.bg_time, 'txt_jipo')
    self.txt_tz = TFDirector:getChildByPath(self.bg_time, 'txt_tz')
    self.img_lengque = TFDirector:getChildByPath(self.panel_kaiqi, 'img_lengque')
    self.txt_tzcoldTime = TFDirector:getChildByPath(self.img_lengque, 'txt_num1')
    local panel_boss = TFDirector:getChildByPath(self.panel_kaiqi, 'panel_boss')
    self.tPanel_Enemy = {}
    self.tPanel_Enemy[1] = {}
    self.tPanel_Enemy[1].panel = panel_boss
    self.tPanel_Enemy[1].panel.type = 1
    self.tPanel_Enemy[1].img_role = TFDirector:getChildByPath(panel_boss, 'img_role')
    self.tPanel_Enemy[1].hpBar = TFDirector:getChildByPath(panel_boss, 'bar_jindu')
    self.tPanel_Enemy[1].txt_jindunumber = TFDirector:getChildByPath(panel_boss, 'txt_jindunumber')
    self.tPanel_Enemy[1].img_ywcg = TFDirector:getChildByPath(panel_boss, 'img_ywcg')
    self.tPanel_Enemy[1].img_ywsb = TFDirector:getChildByPath(panel_boss, 'img_ywsb')
    local nameList = {"panel_roleleft","panel_roleright","panel_rolez"}
    for i=1,3 do
        self.tPanel_Enemy[ i + 1 ] = {}
        local panel = TFDirector:getChildByPath(self.panel_kaiqi, nameList[ i ])
        self.tPanel_Enemy[ i + 1 ].panel = panel
        self.tPanel_Enemy[ i + 1 ].img_role = TFDirector:getChildByPath(panel, 'img_role')
        self.tPanel_Enemy[ i + 1 ].hpBar = TFDirector:getChildByPath(panel, 'bar_xuetiao1')
        self.tPanel_Enemy[ i + 1 ].txt_zt = TFDirector:getChildByPath(panel, 'txt_zt')
        self.tPanel_Enemy[ i + 1 ].txt_yj = TFDirector:getChildByPath(panel, 'txt_yj')
        self.tPanel_Enemy[ i + 1 ].txt_time = TFDirector:getChildByPath(panel, 'txt_time')
        self.tPanel_Enemy[ i + 1 ].img_jp = TFDirector:getChildByPath(panel, 'img_jp')
    end

    local resPath = "effect/guild_boss_effect.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("guild_boss_effect_anim") -- 1136 640
    effect:setPosition(ccp(1136 * 0.5, 640 * 0.5))
    effect:playByIndex(0,-1,-1,1)
    self.img_bg:addChild(effect)
    self.countTime = 0

    self.currTabType = self.TABTYPE_NONE
end

function GuildBossMainLayer:registerEvents()
    self.super.registerEvents(self)

    self.btn_kqyw:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onOpenActivityClick),1)
    self.btn_kqyw.logic = self

    self.btn_paihang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRankClick),1)
    self.btn_paihang.logic = self

    self.btn_jiangli:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRewardClick),1)
    self.btn_jiangli.logic = self

    self.btn_guizhe:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRuleClick),1)
    self.btn_guizhe.logic = self

    self.btn_zzzj:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpListClick),1)
    self.btn_zzzj.logic = self

    self.btn_zzjg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpAttackClick),1)
    self.btn_zzjg.logic = self

    self.btn_jifen:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAttAckHurtClick),1)
    self.btn_jifen.logic = self

    self.btn_attNum:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAttAckNumClick),1)
    self.btn_attNum.logic = self

    self.btn_shuaxin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRankShuaXinClick),1)
    self.btn_shuaxin.logic = self
    

    for i=1,4 do
        self.tPanel_Enemy[ i ].panel.type = i
        self.tPanel_Enemy[ i ].panel:setTouchEnabled(true)
        self.tPanel_Enemy[ i ].panel.logic = self
        self.tPanel_Enemy[ i ].panel:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAttackClick),1)
    end
    self.refreshBossInfoCallBack = function(event)
        self.isRequestBrush = false
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(GuildBossManager.RECEIVE_MAIN_INFO, self.refreshBossInfoCallBack)

    self.receiveChallengeInfoCallBack = function(event)
        local dataInfo = event.data[1][1]
        self:dealChallengeInfo(dataInfo)
        
    end
    TFDirector:addMEGlobalListener(GuildBossManager.RECEIVE_HURT_PUSH, self.receiveChallengeInfoCallBack)

    self.refreshHurtRank = function(event)
        self:initHurtRankUI()      
    end
    TFDirector:addMEGlobalListener(GuildBossManager.RECEIVE_BOSS_HURT_RANK, self.refreshHurtRank)

    self.refreshAttNumRank = function(event)
        self:initAttNumRankUI()      
    end
    TFDirector:addMEGlobalListener(GuildBossManager.RECEIVE_BOSS_ATTNUM_RANK, self.refreshAttNumRank)

    self.enterSceneCallBack = function(event)
        if self.challengeInfo ~= nil then
            self:drawChallengeInfo(self.challengeInfo)
            self.challengeInfo = nil
        end
    end
    TFDirector:addMEGlobalListener("onEnterHomeScene" ,self.enterSceneCallBack )

    if self.generalHead then
        self.generalHead:registerEvents()
    end
end

function GuildBossMainLayer:removeEvents()

    TFDirector:removeMEGlobalListener(GuildBossManager.RECEIVE_MAIN_INFO, self.refreshBossInfoCallBack)
    TFDirector:removeMEGlobalListener(GuildBossManager.RECEIVE_BOSS_HURT_RANK, self.refreshHurtRank)
    TFDirector:removeMEGlobalListener(GuildBossManager.RECEIVE_HURT_PUSH, self.receiveChallengeInfoCallBack)
    TFDirector:removeMEGlobalListener("onEnterHomeScene" ,self.enterSceneCallBack )
    TFDirector:removeMEGlobalListener(GuildBossManager.RECEIVE_BOSS_ATTNUM_RANK, self.refreshAttNumRank)
    self.refreshAttNumRank = nil

    if self.generalHead then
        self.generalHead:removeEvents()
    end
    self.super.removeEvents(self)
end


function GuildBossMainLayer:removeUI()
    if self.updateTimerID ~= nil then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    self.super.removeUI(self)
end

function GuildBossMainLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();
    self:refreshUI()
    --self:test()
end

function GuildBossMainLayer:test()
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

function GuildBossMainLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    self.super.dispose(self)
end

function GuildBossMainLayer:refreshUI()
    local activityState = GuildBossManager:getActivityState()
    print('activityState',activityState)
    local showFunc = self["showActivityState_" .. activityState]
    if showFunc then
        showFunc(self)
    end
    if self.updateTimerID == nil then
        self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
            function()
                self:refreshColdTime()
            end)
    end
end

function GuildBossMainLayer:dealChallengeInfo( dataInfo )
    if dataInfo.npcId == nil then
        return
    end
    local len = #(dataInfo.npcId)
    if dataInfo.type == 1 then
        len = 1
    end
    for i=1,len do
        local challengeInfo = {}
        challengeInfo.playerId = dataInfo.playerId or 0
        if dataInfo.type == 2 then
            challengeInfo.name = localizable.GuildBoss_main_zhuzhan
        else
            challengeInfo.name = dataInfo.playerName
        end
        challengeInfo.hurt = dataInfo.hurt[i]
        challengeInfo.npcId = dataInfo.npcId[i]
        self:showChallengeInfo(challengeInfo)
    end
end

function GuildBossMainLayer:showChallengeInfo( challengeInfo )
    self.challengeInfo = nil
    if Public:currentScene().__cname  == 'HomeScene' then
        self:drawChallengeInfo(challengeInfo)
    else
        if challengeInfo.playerId == MainPlayer:getPlayerId() then
            self.challengeInfo = challengeInfo
        end
    end
end

function GuildBossMainLayer:drawChallengeInfo(challengeInfo)
    print('challengeInfo  ',challengeInfo)
    
    local panel = require("lua.logic.wulinenemy.WuLinEnemyHurtLayer"):new()
    self.panel_hurt:addChild(panel,2)
    local npcId = challengeInfo.npcId
    local bossData = GuildBossManager:getBossDataByNpcid(npcId)
    local panelNode = self.tPanel_Enemy[bossData.type]
    local posList = {ccp(455,372),ccp(181,263),ccp(755,264),ccp(467,204)}
    local pos = posList[bossData.type]
    pos.y = pos.y - 100
    pos.x = pos.x - 140
    panel:setPosition(pos)

    panel:setInfo(challengeInfo,false)

    self:tweenColor(panelNode.img_role)
end

function GuildBossMainLayer:showActivityState_0()
    self.panel_wkq:setVisible(true)
    self.panel_kaiqi:setVisible(false)
    self.img_levelbg:setVisible(false)
    self.img_qtsx:setVisible(false)
    self.btn_zzzj:setVisible(false)
    self.btn_zzjg:setVisible(false)
    self.btn_kqyw:setVisible(true)
    self.btn_kqyw:setGrayEnabled(true)
    self.btn_kqyw:setTouchEnabled(false)
    self.tipcanopentime:setVisible(false)
    self.Panel_Paihang:setVisible(false)
    local maxNum = ConstantData:objectByID("GuildBoss.Secondly").value
    local mainInfo = GuildBossManager:getMianInfo()
    self.zyBar:setPercent( 100 * mainInfo.secondlyProgress / maxNum)
    self.txt_zyjindu:setText(mainInfo.secondlyProgress .. "/" .. maxNum)
end

function GuildBossMainLayer:showActivityState_1()
    self.panel_wkq:setVisible(false)
    self.panel_kaiqi:setVisible(true)
    self.img_levelbg:setVisible(true)
    self.img_qtsx:setVisible(false)
    self.btn_zzzj:setVisible(false)
    self.btn_zzjg:setVisible(false)
    self.btn_kqyw:setVisible(false)
    self.bg_sysj:setVisible(true)
    self.img_lengque:setVisible(false)
    self.txt_jipo:setVisible(true)
    self.txt_tz:setVisible(false)
    self.Panel_Paihang:setVisible(true)

    local mainInfo = GuildBossManager:getMianInfo()
    self.txt_level:setText(mainInfo.stage)
    local bossInfo = GuildBossManager:getBossInfo() or {}
    for i=1,4 do
        self.tPanel_Enemy[i].panel:setVisible(false)
    end
    for i,v in ipairs(bossInfo) do
        local bossData = GuildBossManager:getBossDataByNpcid(v.npcId)
        local panelNode = self.tPanel_Enemy[bossData.type]
        panelNode.panel:setVisible(true)
        panelNode.img_role:setTexture("icon/rolebig/" .. bossData.display .. ".png")
        if v.maxHp <= 0 then
            v.maxHp = 1
            v.curHp = 1
        end
        local per = v.curHp * 100 / v.maxHp
        panelNode.hpBar:setPercent(per)
        if bossData.type == 1 then
            if mainInfo.result == 0 then
                panelNode.img_ywcg:setVisible(false)
                panelNode.img_ywsb:setVisible(true)
                self.bg_time:setVisible(false)
                per = math.floor(per * 10)
                panelNode.txt_jindunumber:setText( per / 10 .. "%" )
            else
                panelNode.img_ywcg:setVisible(true)
                panelNode.img_ywsb:setVisible(false)
                self.bg_time:setVisible(true)
                panelNode.hpBar:setPercent(0)
                panelNode.txt_jindunumber:setText("0%")

                local totalSec = mainInfo.endTime - mainInfo.openTime
                if totalSec < 0 then
                    totalSec = 0
                end
                local hour = math.floor(totalSec/3600)
                totalSec = totalSec - hour * 3600
                local min = math.floor(totalSec/60)
                local sec = math.floor(totalSec - min * 60)
                self.txt_tzTime:setText(string.format("%02d:%02d:%02d",hour,min,sec))
            end
        else
            if v.curHp <= 0 then
                panelNode.img_jp:setVisible(true)
            else
                panelNode.img_jp:setVisible(false)
            end
            local buffData = GuildBossManager:getBuffDataByid(v.bossBuff)
            if buffData then
                panelNode.txt_zt:setVisible(true)
                panelNode.txt_zt:setText(buffData.desc)
            else
                panelNode.txt_zt:setVisible(false)
            end
            panelNode.txt_yj:setVisible(false)
        end
    end
    self:refreshColdTime_1()
end

function GuildBossMainLayer:showActivityState_2()
    self.panel_wkq:setVisible(true)
    self.panel_kaiqi:setVisible(false)
    self.img_levelbg:setVisible(false)
    self.img_qtsx:setVisible(false)
    self.btn_zzzj:setVisible(false)
    self.btn_zzjg:setVisible(false)
    self.btn_kqyw:setVisible(true)
    self.bg_time:setVisible(true)
    self.bg_sysj:setVisible(false)
    self.Panel_Paihang:setVisible(false)

    self.tipcanopentime:setVisible(true)
    self.btn_kqyw:setGrayEnabled(false)
    self.btn_kqyw:setTouchEnabled(true)
    local maxNum = ConstantData:objectByID("GuildBoss.Secondly").value
    local mainInfo = GuildBossManager:getMianInfo()
    self.zyBar:setPercent( 100 * mainInfo.secondlyProgress / maxNum)
    self.txt_zyjindu:setText(mainInfo.secondlyProgress .. "/" .. maxNum)
end

function GuildBossMainLayer:showActivityState_3()
    self.panel_wkq:setVisible(false)
    self.panel_kaiqi:setVisible(true)
    self.img_levelbg:setVisible(true)
    self.img_qtsx:setVisible(false)
    self.bg_sysj:setVisible(false)
    self.Panel_Paihang:setVisible(true)
    
    self.btn_kqyw:setVisible(false)
    self.img_lengque:setVisible(false)
    if FactionManager:getPostInFaction() == 1 then
        self.btn_zzzj:setVisible(true)
        self.btn_zzjg:setVisible(true)
    else
        self.btn_zzzj:setVisible(false)
        self.btn_zzjg:setVisible(false)
    end
    local mainInfo = GuildBossManager:getMianInfo()
    self.txt_level:setText(mainInfo.stage)
    local bossInfo = GuildBossManager:getBossInfo() or {}
    for i=1,4 do
        self.tPanel_Enemy[i].panel:setVisible(false)
    end
    for i,v in ipairs(bossInfo) do
        local bossData = GuildBossManager:getBossDataByNpcid(v.npcId)
        local panelNode = self.tPanel_Enemy[bossData.type]
        panelNode.panel:setVisible(true)
        panelNode.img_role:setTexture("icon/rolebig/" .. bossData.display .. ".png")
        if v.maxHp <= 0 then
            v.maxHp = 1
            v.curHp = 1
        end
        local per = v.curHp * 100 / v.maxHp
        panelNode.hpBar:setPercent(per)
        if bossData.type == 1 then
            panelNode.img_ywcg:setVisible(false)
            panelNode.img_ywsb:setVisible(false)
            per = math.floor(per * 10)
            panelNode.txt_jindunumber:setText( per / 10 .. "%" )
        else
            if v.curHp <= 0 then
                panelNode.img_jp:setVisible(true)
            else
                panelNode.img_jp:setVisible(false)
            end
            local buffData = GuildBossManager:getBuffDataByid(v.bossBuff)
            if buffData then
                panelNode.txt_zt:setVisible(true)
                panelNode.txt_zt:setText(buffData.desc)
                if v.bossBuff == 9 and v.dieCount > 0 then
                    self.img_qtsx:setVisible(true)
                    local tbl = stringToTable(buffData.attribute,"|")
                    local tbls = stringToNumberTable(tbl[1],"_")
                    tbls[2] = tbls[2] / 10 - 100
                    local attNum = tbls[2] * v.dieCount
                    self.txt_bfb:setText("+" .. attNum .. "%")
                end
            else
                panelNode.txt_zt:setVisible(false)
            end
            panelNode.txt_yj:setVisible(false)
        end
    end
    self:refreshColdTime_3()
end


-------------------新增伤害的tableview-------------------------


function GuildBossMainLayer:initHurtRankUI()
    self.hurtRank=GuildBossManager:getHurtRank()
    local msg=nil
    if self.hurtRank.myPlayerId>0 then
        msg=self.hurtRank.myRanking
    else
        msg=localizable.shalu_info_txt1
    end
    self.txt_num_rank:setText(msg)
    self.txt_num_hurt:setText(self.hurtRank.myDamage)
    self.txt_shanghai:setText(localizable.WuLinEnemy_my_hurt)
    self:initHurtTableView()
end

function GuildBossMainLayer:initAttNumRankUI()
    self.attNumRank=GuildBossManager:getAttNumRank()
    local msg=nil
    if self.attNumRank.myPlayerId>0 then
        msg=self.attNumRank.myRanking
    else
        msg=localizable.shalu_info_txt1
    end
    self.txt_num_rank:setText(msg)
    self.txt_num_hurt:setText(self.attNumRank.myAttackCount)
    self.txt_shanghai:setText(localizable.GuildBoss_rank_gongji_cishu_tip)
    self:initAttNumTableView()
end

function GuildBossMainLayer:initHurtTableView()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()

        self.tableView = tableView
        tableView:setTableViewSize(self.panel_gun:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsIntableView,self))
        self.panel_gun:addChild(tableView)
    end
    self.tableView:reloadData()
end


function GuildBossMainLayer:cellSizeForTable(table,idx)
    return 59,210
end

function GuildBossMainLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_rank_2:clone()
        node:setVisible(true)
        node:setPositionY(0)
        cell:addChild(node,1)
        cell.panel = node
    end
    self:setCellInfo(cell,idx)
    return cell
end

function GuildBossMainLayer:numberOfCellsIntableView(table)
    local Rank=self.hurtRank.guildBossDamageRankData
    local num =  Rank and #Rank or 0
    if num < 0 then num = 0 end
    return num
end

function GuildBossMainLayer:initAttNumTableView()
    if self.attNumTableView == nil then
        local  tableView =  TFTableView:create()

        self.attNumTableView = tableView
        tableView:setTableViewSize(self.panel_gun:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.attNumTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.attNumCellSizeForTable,self))
        self.attNumTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.attNumTableCellAtIndex,self))
        self.attNumTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.attNumNumberOfCellsIntableView,self))
        self.panel_gun:addChild(tableView)
    end
    self.attNumTableView:reloadData()
end


function GuildBossMainLayer:attNumCellSizeForTable(table,idx)
    return 59,210
end

function GuildBossMainLayer:attNumTableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_rank_2:clone()
        node:setVisible(true)
        node:setPositionY(0)
        cell:addChild(node,1)
        cell.panel = node
    end
    self:setAttNumCellInfo(cell,idx)
    return cell
end

function GuildBossMainLayer:attNumNumberOfCellsIntableView(table)
    local Rank=self.attNumRank.guildBossAttackRankData
    local num =  Rank and #Rank or 0
    if num < 0 then num = 0 end
    return num
end

function GuildBossMainLayer:setAttNumCellInfo(cell,idx)  
    local node = cell.panel
    if self.attNumRank.guildBossAttackRankData and self.attNumRank.guildBossAttackRankData[idx]then
        local infoData=self.attNumRank.guildBossAttackRankData[idx]
        node:setVisible(true)
        print("setAttNumCellInfo",infoData)
        TFDirector:getChildByPath(node, 'txt_name'):setText(infoData.playerName)
        TFDirector:getChildByPath(node, 'txt_num'):setText(infoData.attackCount)
        TFDirector:getChildByPath(node, 'txt_xuhao'):setText(infoData.rank)
        TFDirector:getChildByPath(node, 'txt_shanghai'):setText(localizable.GuildBoss_rank_tip2)
    else
        if node then
            node:setVisible(false)
        end
    end
end

function GuildBossMainLayer:setCellInfo(cell,idx)  
    local node = cell.panel
    if self.hurtRank.guildBossDamageRankData and self.hurtRank.guildBossDamageRankData[idx]then
        local infoData=self.hurtRank.guildBossDamageRankData[idx]
        node:setVisible(true)
        TFDirector:getChildByPath(node, 'txt_name'):setText(infoData.playerName)
        TFDirector:getChildByPath(node, 'txt_num'):setText(infoData.damage)
        TFDirector:getChildByPath(node, 'txt_xuhao'):setText(infoData.rank)
        TFDirector:getChildByPath(node, 'txt_shanghai'):setText(localizable.GuildBoss_rank_tip1)
    else
        if node then
            node:setVisible(false)
        end
    end
end




function GuildBossMainLayer.onRuleClick(sender)
    local self = sender.logic
    CommonManager:showRuleLyaer('guildboss')
end

function GuildBossMainLayer.onRankShuaXinClick(sender)
    local self = sender.logic
    GuildBossManager:setHurtRankType("shuaxin")
    if (self.currTabType == self.TABTYPE_SHANGHAI) then
        GuildBossManager:requestHurtRank()
    elseif (self.currTabType == self.TABTYPE_CISHU) then
        GuildBossManager:requestAttNumRank()
    end
end

function GuildBossMainLayer.onAttAckHurtClick(sender)
    local self = sender.logic
    if self.attr_tween then
        TFDirector:killTween(self.attr_tween)
    end
    if self.attr_layer_show and self.currTabType == self.TABTYPE_SHANGHAI then
        self.attr_tween = {
            target = self.img_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = 0,
            },
        }
        self.attr_layer_show = false
        self.currTabType = self.TABTYPE_NONE
        
    else
        self.attr_tween = {
            target = self.img_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = -228,
            },
        }
        self.attr_layer_show = true
        GuildBossManager:requestHurtRank()
        
        if (self.tableView) then
            --self.attNumTableView:setVisible(false)
            self.tableView:setVisible(true)
        end
        if (self.attNumTableView) then
            self.attNumTableView:setVisible(false)
        end
        self.currTabType = self.TABTYPE_SHANGHAI
        self.btn_attNum:setZOrder(100)
        self.btn_jifen:setZOrder(101)
    end
    
    TFDirector:toTween(self.attr_tween)
end
function GuildBossMainLayer.onAttAckNumClick(sender)
    local self = sender.logic
    
    if self.attr_tween then
        TFDirector:killTween(self.attr_tween)
    end
    if self.attr_layer_show and self.currTabType == self.TABTYPE_CISHU then
        self.attr_tween = {
            target = self.img_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = 0,
            },
        }
        self.attr_layer_show = false
        self.currTabType = self.TABTYPE_NONE
    else
        self.attr_tween = {
            target = self.img_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = -228,
            },
        }
        self.attr_layer_show = true
        GuildBossManager:requestAttNumRank()
        if (self.tableView) then
            self.tableView:setVisible(false)
        end
        if (self.attNumTableView) then
            self.attNumTableView:setVisible(true)
        end
        self.currTabType = self.TABTYPE_CISHU
        self.btn_attNum:setZOrder(101)
        self.btn_jifen:setZOrder(100)
    end
    TFDirector:toTween(self.attr_tween)

end


function GuildBossMainLayer.onHelpListClick(sender)
    local self = sender.logic
    local activityState = GuildBossManager:getActivityState()
    if activityState ~= GuildBossManager.ActivityState_3 then
        return
    end
    GuildBossManager:openYanWuZhaoJiLayer()
end

function GuildBossMainLayer.onHelpAttackClick(sender)
    local self = sender.logic
    local activityState = GuildBossManager:getActivityState()
    if activityState ~= GuildBossManager.ActivityState_3 then
        return
    end
    local timeNow = MainPlayer:getNowtime()
    local mainInfo = GuildBossManager:getMianInfo()
    local limitTime = ConstantData:objectByID("GuildBoss.Gangsta.UsableTime.Limitation").value
    if limitTime > timeNow - mainInfo.openTime then
        toastMessage(localizable.GuildBoss_main_helpAttackLimit)
        return
    end
    local coldTime = ConstantData:objectByID("GuildBoss.Gangsta.CoolDownTime").value
    local totalSec = mainInfo.helpBattleTime + coldTime - timeNow
    -- print("mainInfo.helpBattleTime = ",mainInfo.helpBattleTime)
    -- print("=====>>>",GetCorrectDate("%c",mainInfo.helpBattleTime))

    -- print("timeNow = ",timeNow)
    -- print("=====>>>",GetCorrectDate("%c",timeNow))
    -- print("totalSec=====>>>",totalSec)
    if totalSec <= 0 then
        GuildBossManager:requireHelpAttack()
    else
        toastMessage(localizable.GuildBoss_main_helpattackcold)
    end
end

function GuildBossMainLayer.onRewardClick(sender)
    GuildBossManager:openRewardLayer()
end

function GuildBossMainLayer.onRankClick(sender)
    GuildBossManager:requestRank(GuildBossManager.RankType_1)
end

function GuildBossMainLayer.onRewardClick(sender)
    GuildBossManager:openRewardLayer()
end

function GuildBossMainLayer.onOpenActivityClick(sender)
    local self = sender.logic
    local activityState = GuildBossManager:getActivityState()
    print("activityState = ",activityState)
    if activityState ~= GuildBossManager.ActivityState_2 then
        return
    end
    local state = FactionManager:getFactionInfo().state
    if state == 0 then
        if FactionManager:getPostInFaction() == 1 or FactionManager:getPostInFaction() == 2 then
            GuildBossManager:openChooseStageLayer()
        else
            toastMessage(localizable.GuildBoss_open_position_tip)
        end
    elseif state == 1 then
        toastMessage(localizable.GuildBoss_open_cannt_tip3)
    elseif state == 2 then
        toastMessage(localizable.GuildBoss_open_cannt_tip1)
    elseif state == 3 then
        toastMessage(localizable.GuildBoss_open_cannt_tip2)
    end
    
end

function GuildBossMainLayer.onAttackClick(sender)
    local self = sender.logic
    if self:checkCanFight(sender.type) == false then
        return
    end
    
    GuildBossManager:openVSLayer(sender.type)
end

function GuildBossMainLayer:checkCanFight( _type )
    local activityState = GuildBossManager:getActivityState()
    if activityState ~= GuildBossManager.ActivityState_3 then
        return false
    end
    local timeNow = MainPlayer:getNowtime()
    local mainInfo = GuildBossManager:getMianInfo()
    local coldTime = ConstantData:objectByID("GuildBoss.Challange.CoolDownTime").value
    local totalSec = mainInfo.battleTime + coldTime - timeNow
    if totalSec > 0 then
        toastMessage(localizable.GuildBoss_main_tzcold)
        return false
    end
    local bossInfo = GuildBossManager:getBossInfo() or {}
    for i,v in ipairs(bossInfo) do
        local bossData = GuildBossManager:getBossDataByNpcid(v.npcId)
        if bossData.type == _type then
            if v.maxHp == 0 or v.curHp > 0 then
                return true
            else
                toastMessage(localizable.GuildBoss_main_bosshpzero)
                return false
            end
        end
    end
    return false
end

function GuildBossMainLayer:tweenColor(node)
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

function GuildBossMainLayer:refreshColdTime()
    local activityState = GuildBossManager:getActivityState()
    
    if activityState == 1 then
        self:refreshColdTime_1()
    elseif activityState == 2 then
        self:refreshColdTime_2()
    elseif activityState == 3 then
        self:refreshColdTime_3()
    end

    self.countTime = self.countTime + 1
    if self.countTime >= 60 then
        self.countTime = 0
        if self.isRequestBrush ~= true then
            self.isRequestBrush = true
            GuildBossManager:requestMainInfo(false)
        end
        if activityState == 1 or activityState == 3 then
            GuildBossManager:requestHurtRank()
            GuildBossManager:requestAttNumRank()
        end
    end
end

function GuildBossMainLayer:refreshColdTime_1()
    local mainInfo = GuildBossManager:getMianInfo()
    local timeNow = MainPlayer:getNowtime()
    local coldTime = ConstantData:objectByID("GuildBoss.End.ShowTime").value
    local totalSec = mainInfo.endTime + coldTime - timeNow
    local needBrush = false
    if totalSec < 0 then
        totalSec = 0
        needBrush = true
    end
    local hour = math.floor(totalSec/3600)
    totalSec = totalSec - hour * 3600
    local min = math.floor(totalSec/60)
    local sec = math.floor(totalSec - min * 60)
    self.txt_zstime:setText(string.format("%02d:%02d:%02d",hour,min,sec))

    if self.isRequestBrush ~= true and needBrush == true then
        self.isRequestBrush = true
        GuildBossManager:requestMainInfo(false)
    end
end

function GuildBossMainLayer:refreshColdTime_2()
    local mainInfo = GuildBossManager:getMianInfo()
    local timeNow = MainPlayer:getNowtime()
    local coldTime = ConstantData:objectByID("GuildBoss.Start.ReadyTime").value
    local totalSec = mainInfo.triggerTime + coldTime - timeNow
    local needBrush = false
    if totalSec < 0 then
        totalSec = 0
        needBrush = true
    end

    local day = math.floor(totalSec/(24*3600))
    totalSec = totalSec - day * 24 * 3600
    local hour = math.floor(totalSec/3600)
    totalSec = totalSec - hour * 3600
    local min = math.floor(totalSec/60)
    local sec = math.floor(totalSec - min * 60)
    local strList = ""
    if day > 0 then
        strList = day..localizable.time_day_txt
    end
    if hour > 0 then
        strList = strList .. hour .. localizable.time_hour_txt0
    end
    if min > 0 then
        strList = strList .. min .. localizable.time_minute_txt0
    end
    if sec <= 0 then 
        sec = 0
    end
    strList = strList..sec..localizable.time_second_txt
    self.txt_canopentime:setText(strList)

    if self.isRequestBrush ~= true and needBrush == true then
        self.isRequestBrush = true
        GuildBossManager:requestMainInfo(false)
    end
end

function GuildBossMainLayer:refreshColdTime_3()
    local mainInfo = GuildBossManager:getMianInfo()
    local timeNow = MainPlayer:getNowtime()

    local coldTime = ConstantData:objectByID("GuildBoss.Challange.Time").value
    local totalSec = mainInfo.openTime + coldTime - timeNow
    if totalSec < 0 then
        totalSec = 0
    end
    local hour = math.floor(totalSec/3600)
    totalSec = totalSec - hour * 3600
    local min = math.floor(totalSec/60)
    local sec = math.floor(totalSec - min * 60)
    self.txt_tzTime:setText(string.format("%02d:%02d:%02d",hour,min,sec))
    
    if FactionManager:getPostInFaction() == 1 then
        coldTime = ConstantData:objectByID("GuildBoss.Gangsta.CoolDownTime").value
        totalSec = mainInfo.helpBattleTime + coldTime - timeNow
        if totalSec <= 0 then
            self.txt_zztime:setText("")
        else
            local hour = math.floor(totalSec/3600)
            totalSec = totalSec - hour * 3600
            local min = math.floor(totalSec/60)
            local sec = math.floor(totalSec - min * 60)
            self.txt_zztime:setText(string.format("%02d:%02d:%02d",hour,min,sec))
        end
    end

    coldTime = ConstantData:objectByID("GuildBoss.Challange.CoolDownTime").value
    totalSec = mainInfo.battleTime + coldTime - timeNow
    if totalSec <= 0 then
        self.img_lengque:setVisible(false)
    else
        self.img_lengque:setVisible(true)
        local hour = math.floor(totalSec/3600)
        totalSec = totalSec - hour * 3600
        local min = math.floor(totalSec/60)
        local sec = math.floor(totalSec - min * 60)
        self.txt_tzcoldTime:setText(string.format("%02d:%02d:%02d",hour,min,sec))
    end

    local bossInfo = GuildBossManager:getBossInfo() or {}
    local needBrush = false
    for i,v in ipairs(bossInfo) do
        local bossData = GuildBossManager:getBossDataByNpcid(v.npcId)
        local panelNode = self.tPanel_Enemy[ bossData.type ]
        if v.maxHp > 0 and v.curHp <= 0 and bossData.revive_time > 0 and panelNode.txt_yj then
            local coldTime = bossData.revive_time
            local totalSec = v.dieTime + coldTime - timeNow
            if totalSec <= 0 then
                totalSec = 0
                needBrush = true
            end
            local hour = math.floor(totalSec/3600)
            totalSec = totalSec - hour * 3600
            local min = math.floor(totalSec/60)
            local sec = math.floor(totalSec - min * 60)
            panelNode.txt_yj:setVisible(true)
            panelNode.txt_time:setText(string.format("%02d:%02d:%02d",hour,min,sec))
        else
            if panelNode.txt_yj then
                panelNode.txt_yj:setVisible(false)
            end
        end
    end
    if self.isRequestBrush ~= true and needBrush == true then
        self.isRequestBrush = true
        GuildBossManager:requestMainInfo(false)
    end
end

return GuildBossMainLayer