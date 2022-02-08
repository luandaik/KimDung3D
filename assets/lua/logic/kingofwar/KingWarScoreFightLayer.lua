
-- client side KingWarScoreFightLayer.lua
--[[
 * @Description: 王者争霸-积分赛
 ]]
-- script writer Happy.All
-- creation time 2016-10-31 14:45:19
local KingWarScoreFightLayer = class("KingWarScoreFightLayer",BaseLayer)

local RANK_NUM = 8

function KingWarScoreFightLayer:ctor(data)
	self.super.ctor(self, data)
    self.lastTeamState = KingOfWarManager:checkIsInTeam()
	self:init("lua.uiconfig_mango_new.crossarena.CrossArenaJiFen")
end

function KingWarScoreFightLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.KFKingWar,{HeadResType.SYCEE})

    -- local bg = TFDirector:getChildByPath(ui, 'bg')
    -- TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/zhengbasai_jifen_bg.xml")
    -- local effect = TFArmature:create("zhengbasai_jifen_bg_anim")
    -- effect:setPosition(ccp(568,320))
    -- bg:addChild(effect,100)
    -- effect:playByIndex(0,-1,-1,1)

    self.img_tuoguan = TFDirector:getChildByPath(ui, "img_tuoguan")
    self.img_tuoguan:setVisible(false)

    local img_jijiangkaishi = TFDirector:getChildByPath(ui, "img_jijiangkaishi")
    img_jijiangkaishi:setVisible(false)

    --积分赛剩余时间
    local teamInfoNode = TFDirector:getChildByPath(ui, 'teamInfoNode')
    self.imgFight = TFDirector:getChildByPath(teamInfoNode, 'img_dzz')
    self.imgFight:setVisible(false)
    local imgFightParent = self.imgFight:getParent()
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/weekFight.xml")
    local effect = TFArmature:create("weekFight_anim") 
    local pos = self.imgFight:getPosition()
    effect:setPosition(ccp(pos.x+50, pos.y+50))
    effect:setScale(0.5)
    effect:playByIndex(0, -1, -1, 1)
    effect:setZOrder(-1)
    imgFightParent:addChild(effect) 
    self.fightEffect = effect
    effect:setVisible(true)
    self.needFightEffect = true

    self.txtFightEndTime = TFDirector:getChildByPath(teamInfoNode, 'txt_shijianshengyu')
    self.txtFightEndTime:setVisible(false)
    self.imgFightEnd = TFDirector:getChildByPath(teamInfoNode, 'img_bishaijieshu')
    self.imgFightEnd:setVisible(false)

    
    -- self.img_leizhu = TFDirector:getChildByPath(teamInfoNode, "img_leizhu")
    self.img_leizhu = TFDirector:getChildByPath(teamInfoNode, "img_leizhu")
    local role1_bg = TFDirector:getChildByPath(self.img_leizhu, "role1_bg")
    self.leizhuName = TFDirector:getChildByPath(role1_bg, "txt_name")
    self.leizhuIcon = TFDirector:getChildByPath(role1_bg, "icon_head")


    self.panel_suiji = TFDirector:getChildByPath(ui, "panel_suiji")
    self.btnRandom = TFDirector:getChildByPath(self.panel_suiji, 'btn_sjpp')
    local txt_num = TFDirector:getChildByPath(self.panel_suiji, 'txt_num')
    local needSycee = ConstantData:objectByID("ContestCreatATeamNeed").value or 400
    txt_num:setText(needSycee)
    self.btnCreateTeam = TFDirector:getChildByPath(self.panel_suiji, 'btn_cj')
    self.btnSignUp = TFDirector:getChildByPath(teamInfoNode, "btn_baoming")
    
    self.teamNode = TFDirector:getChildByPath(teamInfoNode, "teamNode")
    local atkNode = TFDirector:getChildByPath(self.teamNode, "bg_jingong")
    self.txtAtkRecord = TFDirector:getChildByPath(atkNode, "txt_zhanji")
    self.txtAtkStreak = TFDirector:getChildByPath(atkNode, "txt_liansheng")
    self.btnAtkArmy = TFDirector:getChildByPath(atkNode, "btn_jinggong")
    local defNode = TFDirector:getChildByPath(self.teamNode, "bg_fangshou")
    self.txtDefRecord = TFDirector:getChildByPath(defNode, "txt_zhanji")
    self.txtDefStreak = TFDirector:getChildByPath(defNode, "txt_liansheng")
    self.btnDefArmy = TFDirector:getChildByPath(defNode, "btn_fangshou")
    
    --我的信息
    local myRankNode = TFDirector:getChildByPath(ui, 'Panel_mypaiming')
    self.txtMyRank = TFDirector:getChildByPath(myRankNode, 'txt_paiming')
    self.txtMyScore = TFDirector:getChildByPath(myRankNode, 'txt_jifen')

    --排行榜信息
    self.ScrollView = TFDirector:getChildByPath(ui, 'ScrollView_CrossArenaJiFen_1')
    local scrollNode = TFDirector:getChildByPath(ui, 'ScrollView_CrossArenaJiFen_1')
    self.scrollCell = TFDirector:getChildByPath(scrollNode, 'no3')
    self.scrollCell:setVisible(false)
    self.ScrollView:setInnerContainerSize(CCSizeMake(250,84*RANK_NUM))
    self.scrollData = {}
    for i=1,RANK_NUM do
        local panelCell = self.scrollCell:clone()
        panelCell:setVisible(true)
        panelCell:setPosition(ccp(0,(RANK_NUM-i)*84))
        self.ScrollView:addChild(panelCell)
        self.scrollData[i] = {}        
        self.scrollData[i].bg = TFDirector:getChildByPath(panelCell, 'bg')
        self.scrollData[i].imgRank = TFDirector:getChildByPath(panelCell, 'img_no')
        self.scrollData[i].txtRank = TFDirector:getChildByPath(panelCell, 'no4')
        if i <= 3 then
            self.scrollData[i].imgRank:setVisible(true)
            self.scrollData[i].imgRank:setTexture("ui_new/leaderboard/no"..i..".png")
            self.scrollData[i].txtRank:setVisible(false)
        else
            self.scrollData[i].imgRank:setVisible(false)
            self.scrollData[i].txtRank:setVisible(true)
            self.scrollData[i].txtRank:setText(i)
        end
        self.scrollData[i].name = TFDirector:getChildByPath(panelCell, 'txt_no3')
        self.scrollData[i].name:setVisible(false)
        self.scrollData[i].score = TFDirector:getChildByPath(panelCell, 'txt_jifen')
        self.scrollData[i].score:setVisible(false)
        self.scrollData[i].serverName = TFDirector:getChildByPath(panelCell, 'txt_fuwu')
        self.scrollData[i].serverName:setVisible(false)
    end
    self.Box = {}
    self.Box[1] = TFDirector:getChildByPath(ui,"btn_mubiao1")
    self.Box[1].img_baoxiang = TFDirector:getChildByPath(self.Box[1], 'img_baoxiang')
    self.Box[1].txt_mubiao = TFDirector:getChildByPath(self.Box[1], 'txt_mubiao') 

    self.Box[2] = TFDirector:getChildByPath(ui,"btn_mubiao2")
    self.Box[2].img_baoxiang = TFDirector:getChildByPath(self.Box[2], 'img_baoxiang')
    self.Box[2].txt_mubiao = TFDirector:getChildByPath(self.Box[2], 'txt_mubiao')  


    --ui 按钮
    self.btnRule = TFDirector:getChildByPath(ui, "btn_guizhe")
    self.btnBattlefield = TFDirector:getChildByPath(ui, "btn_zhanbao")
    self.btnReward = TFDirector:getChildByPath(ui, "btn_reward")
    self.btnMyTeam = TFDirector:getChildByPath(ui, "btn_myteam")
    self.btnChat = TFDirector:getChildByPath(ui, "btn_teamchat")

    --创建TabView
    self.tabViewTiaomuUI = TFDirector:getChildByPath(ui, "Panel_luxiang")
    self.tabViewTiaomu =  TFTableView:create()
    self.tabViewTiaomu:setTableViewSize(self.tabViewTiaomuUI:getContentSize())
    self.tabViewTiaomu:setDirection(TFTableView.TFSCROLLVERTICAL)
    self.tabViewTiaomu:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    self.tabViewTiaomu.logic = self
    self.tabViewTiaomuUI:addChild(self.tabViewTiaomu)
    self.tabViewTiaomu:setPosition(ccp(0,0))

    self.img_line1 = TFDirector:getChildByPath(ui, "img_line1")
    self.img_line1:setVisible(false)
    self.img_line2 = TFDirector:getChildByPath(ui, "img_line2")
    self.img_line2:setVisible(false)

    self.cellModel  = TFDirector:getChildByPath(self.tabViewTiaomuUI, 'panel_luxiang1')
    self.cellModel:setVisible(false) 
    self.cellModelX =  self.cellModel:getPositionX()
    self.cellModelY =  0
end

function KingWarScoreFightLayer:removeUI()
	self.super.removeUI(self)
end

function KingWarScoreFightLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
    CommonManager:setRedPoint(self.btnChat, KingOfWarManager:getTeamChatRedState(),"btnChat",ccp(0,0))

    local currTeamState = KingOfWarManager:checkIsInTeam()
    if self.lastTeamState == false and currTeamState == true then           
        self.onBtnMyTeamClick( self.btnMyTeam )
    end
    self.lastTeamState = currTeamState
    self:freshBoxInfo()
end

function KingWarScoreFightLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)

    if self.generalHead then
        self.generalHead:registerEvents()
    end

    
    KingOfWarManager:requestScoreRankInfo()
    
    math.randomseed(MainPlayer:getNowtime())-- time correct
    
    self.getGrandUpdateCallBack = function (event)
        if self.randTimer == nil then            
            local count = 30 + math.ceil(math.random()*100)%20
            count = count*1000
            self.randTimer = TFDirector:addTimer(count, 1, nil, function () 
                if self.randTimer then
                    TFDirector:removeTimer(self.randTimer)
                    self.randTimer = nil
                end  
                KingOfWarManager:requestScoreRankInfo()
            end)
        end
        self.rankDataInfo = KingOfWarManager:getScoreRankInfo() or {}
        self.rankDataInfo.replays = self.rankDataInfo.replays or {}


        self.tableData = clone(self.rankDataInfo.replays)
        local myTeamId = KingOfWarManager:getMyTeamId()
        local bInRace = KingOfWarManager:checkIsInRace()
        table.sort(self.tableData, function(a,b)
            if bInRace and myTeamId then
                if (a.atkTeam.id == myTeamId or a.defTeam.id == myTeamId) and (b.atkTeam.id == myTeamId or b.defTeam.id == myTeamId) then
                    return a.createTime > b.createTime
                elseif (a.atkTeam.id == myTeamId or a.defTeam.id == myTeamId) then
                    return true
                elseif (b.atkTeam.id == myTeamId or b.defTeam.id == myTeamId) then
                    return false
                end
            end
            return a.createTime > b.createTime
        end)

        self:showMyInfo()
        self:showRankInfo()
        self:showCutDownTimer()
        if self.tabViewTiaomu then
            self.tabViewTiaomu:reloadData()
        end
        self:onShow()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateScoreRankMsg, self.getGrandUpdateCallBack)
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.getGrandUpdateCallBack)
    self.updateRedPoint = function ( event )
        CommonManager:setRedPoint(self.btnChat, KingOfWarManager:getTeamChatRedState(),"btnChat",ccp(0,0))
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateInvitationMsg, self.updateRedPoint)
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateNewChatMsg, self.updateRedPoint)

    self.btnDefArmy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnDefArmyClick))
    self.btnDefArmy.logic = self
    self.btnAtkArmy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAtkArmyClick))
    self.btnAtkArmy.logic = self
    self.btnRule:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnRuleClick))
    self.btnRule.logic = self
    self.btnBattlefield:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnBattleFieldClick))
    self.btnBattlefield.logic = self
    self.btnMyTeam:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnMyTeamClick))
    self.btnMyTeam.logic = self
    self.btnChat:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnChatClick))
    self.btnChat.logic = self
    self.btnReward:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnRewardClick))
    self.btnReward.logic = self
    self.btnRandom:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnRandomClick))
    self.btnRandom.logic = self
    self.btnCreateTeam:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnCreateTeamClick))
    self.btnCreateTeam.logic = self
    self.btnSignUp:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnSignUpClick))
    self.btnSignUp.logic = self

    self.Box[1]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnopenBox1))
    self.Box[1].logic = self
    self.Box[2]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnopenBox2))
    self.Box[2].logic = self



    self.tabViewTiaomu:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tabViewTiaomu:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tabViewTiaomu:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tabViewTiaomu:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
    self.tabViewTiaomu:reloadData()

    self.openOtherTeamMsg = function ( event )
        local data = event.data[1][1]
        local layer = require("lua.logic.kingofwar.KingWarOtherTeamLayer"):new(data)
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_NONE)
        AlertManager:show()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.OtherContestTeamMsg, self.openOtherTeamMsg)


    self.updateBox = function ()
        self:freshBoxInfo()
    end

    TFDirector:addMEGlobalListener(KingOfWarManager.REPONSE_WIN_COUNT, self.updateBox)

    self.updatabox1= function ()
        KingOfWarManager:sendrequestBetRate()
    end
    TFDirector:addMEGlobalListener(ZhengbaManager.OPENBOXKINGSUCESS,self.updatabox1)
   

    self.registerEventCallFlag = true
end

function KingWarScoreFightLayer:removeEvents()

    self.super.removeEvents(self)

	if self.generalHead then
        self.generalHead:removeEvents()
    end

    self.tabViewTiaomu:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.tabViewTiaomu:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.tabViewTiaomu:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end 

    if self.randTimer then
        TFDirector:removeTimer(self.randTimer)
        self.randTimer = nil
    end

    if self.getGrandUpdateCallBack then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateScoreRankMsg, self.getGrandUpdateCallBack)
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.getGrandUpdateCallBack)
        self.getGrandUpdateCallBack = nil
    end
     if self.updateRedPoint then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateInvitationMsg, self.updateRedPoint)
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateNewChatMsg, self.updateRedPoint)
        self.updateRedPoint = nil
    end
    if self.openOtherTeamMsg then
        TFDirector:removeMEGlobalListener(KingOfWarManager.OtherContestTeamMsg, self.openOtherTeamMsg)
        self.openOtherTeamMsg = nil
    end    
    TFDirector:removeMEGlobalListener(KingOfWarManager.REPONSE_WIN_COUNT, self.updateBox)
    self.updateBox = nil 
    TFDirector:removeMEGlobalListener(ZhengbaManager.OPENBOXKINGSUCESS,self.updatabox1)
    self.updatabox1 = nil 

    
    self.registerEventCallFlag = nil  
end

function KingWarScoreFightLayer:dispose()
	self.super.dispose(self)
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end    
end

function KingWarScoreFightLayer:showCutDownTimer()

    local countDown = KingOfWarManager:getScoreRankCutDownTime()

    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end

    self.imgFight:setVisible(true)
    self.fightEffect:setVisible(self.needFightEffect)
    if countDown <= 0 then
        self.imgFight:setVisible(false)
        self.fightEffect:setVisible(false)
        self.txtFightEndTime:setVisible(false)
        self.imgFightEnd:setVisible(true)
        return
    end

    local timeStr = KingOfWarManager:showTime( countDown )
    self.txtFightEndTime:setText(localizable.KingWarScoreTime .. timeStr)    
    self.txtFightEndTime:setVisible(true)

    self.countDownTimer = TFDirector:addTimer(1000, -1, nil, function ()
        if countDown <= 0 then
            if self.countDownTimer then
                TFDirector:removeTimer(self.countDownTimer)
                self.countDownTimer = nil
            end
            local timeStr = KingOfWarManager:showTime( countDown )
            self.txtFightEndTime:setText(localizable.KingWarScoreTime .. timeStr)  
            self:showCutDownTimer()
        else
            countDown = countDown - 1
            local timeStr = KingOfWarManager:showTime( countDown )
            self.txtFightEndTime:setText(localizable.KingWarScoreTime .. timeStr)  
        end
    end)
end

function KingWarScoreFightLayer:showMyInfo()

    --我的信息
    local rankDataInfo = self.rankDataInfo or {}
    self.imgFight:setTexture("ui_new/wulin/img_dzz.png")
    self.needFightEffect = true

    local atkWin = rankDataInfo.atkWin or 0
    local atkLost = rankDataInfo.atkLost or 0
    local str = stringUtils.format(localizable.multiFight_atk_details, atkWin, atkLost)
    self.txtAtkRecord:setText(str)
    local atkWinStreak = rankDataInfo.atkWinStreak or 0
    str = stringUtils.format(localizable.multiFight_atk_liansheng, atkWinStreak)
    self.txtAtkStreak:setText(str)

    local defWin = rankDataInfo.defWin or 0
    local defLost = rankDataInfo.defLost or 0
    local str = stringUtils.format(localizable.multiFight_atk_details, defWin, defLost)
    self.txtDefRecord:setText(str)
    local defWinStreak = rankDataInfo.defWinStreak or 0
    str = stringUtils.format(localizable.multiFight_atk_liansheng, defWinStreak)
    self.txtDefStreak:setText(str)


    if KingOfWarManager:checkIsLastChampion(rankDataInfo.leizhu) then
        --是上届擂主
        self.needFightEffect = false

        self.teamNode:setVisible(false)
        self.panel_suiji:setVisible(false)
        self.btnSignUp:setVisible(false)

        self.img_leizhu:setVisible(true)
        local teamName,teamIcon = KingOfWarManager:getMyTeamLeaderInfo()       
        self.leizhuName:setText(teamName)        
        local RoleIcon = RoleData:objectByID(teamIcon)
        self.leizhuIcon:setTexture(RoleIcon:getIconPath()) 
    elseif KingOfWarManager:checkIsInRace() then
        --有队伍参加比赛
        self.teamNode:setVisible(true)
        self.panel_suiji:setVisible(false)
        self.img_leizhu:setVisible(false)
        self.btnSignUp:setVisible(false)

        local atkWin = rankDataInfo.atkWin or 0
        local atkLost = rankDataInfo.atkLost or 0
        local str = stringUtils.format(localizable.multiFight_atk_details, atkWin, atkLost)
        self.txtAtkRecord:setText(str)
        local atkWinStreak = rankDataInfo.atkWinStreak or 0
        str = stringUtils.format(localizable.multiFight_atk_liansheng, atkWinStreak)
        self.txtAtkStreak:setText(str)

        local defWin = rankDataInfo.defWin or 0
        local defLost = rankDataInfo.defLost or 0
        local str = stringUtils.format(localizable.multiFight_atk_details, defWin, defLost)
        self.txtDefRecord:setText(str)
        local defWinStreak = rankDataInfo.defWinStreak or 0
        str = stringUtils.format(localizable.multiFight_atk_liansheng, defWinStreak)
        self.txtDefStreak:setText(str)
    elseif KingOfWarManager:checkIsInTeam() then

        local teamInfo = KingOfWarManager:getTeamInfo() or {}
        if teamInfo.team and teamInfo.team.type == 0 then
            self.btnSignUp:setVisible(false) 
            self.needFightEffect = false           
            self.imgFight:setTexture("ui_new/crossarena/img_dw.png")
        else
            self.needFightEffect = false
            self.btnSignUp:setVisible(true)
        end        
        self.teamNode:setVisible(true)
        self.panel_suiji:setVisible(false)
        self.img_leizhu:setVisible(false)
    else
        --没有队伍参加比赛
        self.btnSignUp:setVisible(false)
        self.teamNode:setVisible(false)
        self.panel_suiji:setVisible(true)
        self.img_leizhu:setVisible(false)
    end
    
    local rank = rankDataInfo.ranking or 0
    local score = rankDataInfo.integral or 0
    self.txtMyRank:setText(rank)
    self.txtMyScore:setText(score)
end

function KingWarScoreFightLayer:showRankInfo()  
    if self.rankDataInfo == nil then  
        return
    end
    for i=1,RANK_NUM do
        local data = (self.rankDataInfo.info and self.rankDataInfo.info[i])
        -- print("data = ",data)
        if data then
            self.scrollData[i].name:setText(data.name)
            self.scrollData[i].name:setVisible(true)
            self.scrollData[i].score:setText(localizable.multiFight_score..data.integral)
            self.scrollData[i].score:setVisible(true)
            self.scrollData[i].serverName:setVisible(true)
            self.scrollData[i].serverName:setText(data.serverName)
            self.scrollData[i].bg:setTouchEnabled(true)
            self.scrollData[i].bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.scrollDataBtnClick))
            self.scrollData[i].bg.teamId = data.id
            self.scrollData[i].bg.serverId = data.serverId
        else
            self.scrollData[i].name:setVisible(false)
            self.scrollData[i].score:setVisible(false)
            self.scrollData[i].serverName:setVisible(false)
            self.scrollData[i].bg:setTouchEnabled(false)
            self.scrollData[i].bg.teamId = nil
            self.scrollData[i].bg.serverId = nil
        end
    end
end

function KingWarScoreFightLayer.onBtnRuleClick( btn )
    KingOfWarManager:openRuleLayer()
end

function KingWarScoreFightLayer.onBtnDefArmyClick( btn )
    KingOfWarManager:openDefArmyLayer()
end

function KingWarScoreFightLayer.onBtnAtkArmyClick( btn )
    KingOfWarManager:openAtkArmyLayer()
end

function KingWarScoreFightLayer.onBtnBattleFieldClick( btn )
    local layer = AlertManager:addLayerByFile("lua.logic.kingofwar.KingWarBattlefieldLayer", AlertManager.BLOCK_AND_GRAY)
    AlertManager:show()
end

function KingWarScoreFightLayer:refreshArrowBtn()
    local currPosition = self.tabViewTiaomu:getContentOffset()
    if self.tabViewTiaomu then
        self.tableData = self.tableData or {}
        local guildPracticeNum = #self.tableData
        local offsetMax = self.tabViewTiaomuUI:getContentSize().height-122*guildPracticeNum
        local currPosition = self.tabViewTiaomu:getContentOffset()
        if currPosition.y < 0 and offsetMax >= currPosition.y then
            self.img_line1:setVisible(false)
        else
            self.img_line1:setVisible(false)
        end

        if currPosition.y >= 0 then
            self.img_line2:setVisible(false)
        else
            self.img_line2:setVisible(false)
        end
    end
end

function KingWarScoreFightLayer.tableScroll( table )
    local self = table.logic
    self:refreshArrowBtn()
end


function KingWarScoreFightLayer.cellSizeForTable(table,idx)
    return 122,254
end

function KingWarScoreFightLayer.numberOfCellsInTableView(table)
    local self = table.logic

    local num = 0
    if self.tableData then
        num = #self.tableData + 1
    end
    return num
end

function KingWarScoreFightLayer.tableCellAtIndex(table, idx)

    local self = table.logic
    local cell = table:dequeueCell()
    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel:clone()
        local size = panel:getContentSize()
        panel:setPosition(ccp(self.cellModelX, self.cellModelY + 120))
        cell:addChild(panel)
        panel:setVisible(true)
        -- panel:
        cell.panelNode = panel
    else
        panel = cell.panelNode
    end
    if idx == 0 then
        panel:setVisible(false)
    else
        panel:setVisible(true)
        self:cellInfoSet(panel, idx)
    end

    return cell
end

function KingWarScoreFightLayer:cellInfoSet(panel, idx)

    
    local data = KingOfWarManager:transformProgramData(self.tableData[idx])

    local atkNode = TFDirector:getChildByPath(panel, "panel_tou1")
    local atkFrame = TFDirector:getChildByPath(atkNode, "img_tou2")
    local atkIcon = TFDirector:getChildByPath(atkNode, "img_touxiang")
    local atkName = TFDirector:getChildByPath(atkNode, "txt_name")    
    local atkWin = TFDirector:getChildByPath(atkNode, "panel_shengli")
    local atkLose = TFDirector:getChildByPath(atkNode, "panel_shibai")

    local defNode = TFDirector:getChildByPath(panel, "panel_tou2")
    local defFrame = TFDirector:getChildByPath(defNode, "img_tou2")
    local defIcon = TFDirector:getChildByPath(defNode, "img_touxiang")
    local defName = TFDirector:getChildByPath(defNode, "txt_name")
    local defWin = TFDirector:getChildByPath(defNode, "panel_shengli")
    local defLose = TFDirector:getChildByPath(defNode, "panel_shibai")

    local btn_luxiang = TFDirector:getChildByPath(panel, "btn_luxiang")
    local txt_time = TFDirector:getChildByPath(panel, "txt_time")
    
    local RoleIcon = RoleData:objectByID(data.atkUseIcon)
    atkIcon:setTexture(RoleIcon:getIconPath())  
    Public:addFrameImg(atkIcon,data.atkFrameId) 
    atkName:setText(data.atkName)

    RoleIcon = RoleData:objectByID(data.defUseIcon)
    defIcon:setTexture(RoleIcon:getIconPath())  
    Public:addFrameImg(defIcon,data.defFrameId) 
    defName:setText(data.defNam)

    if data.atkWin then
        atkWin:setVisible(true)
        atkLose:setVisible(false)
        defWin:setVisible(false)
        defLose:setVisible(true)
    else
        atkWin:setVisible(false)
        atkLose:setVisible(true)
        defWin:setVisible(true)
        defLose:setVisible(false)
    end

    btn_luxiang.createTime = data.createTime
    btn_luxiang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.recordBtnClick))

    local dTime = MainPlayer:getNowtime() - math.floor(data.createTime/1000)
    if dTime < 0 then
        dTime = 0
    end
    local txtTime = FriendManager:formatTimeToStringWithOut(dTime)
    txt_time:setText(txtTime)    
end
   
function KingWarScoreFightLayer.recordBtnClick( btn )
    local createTime = btn.createTime
    KingOfWarManager:openScoreFightDetailLayer(createTime)
end 

function KingWarScoreFightLayer.scrollDataBtnClick( btn )
    print("btn.teamId = ",btn.teamId)
    print("btn.serverId = ",btn.serverId)
    if btn.teamId and btn.serverId then
        KingOfWarManager:requestOtherContestTeam( btn.teamId, btn.serverId )
    end
end

function KingWarScoreFightLayer.onBtnMyTeamClick( btn )
    KingOfWarManager:openMyTeamLayer()
end 

function KingWarScoreFightLayer.onBtnChatClick( btn )
    local self = btn.logic
    KingOfWarManager:setTeamChatRedState(false)
    -- CommonManager:setRedPoint(self.btnChat, KingOfWarManager:getTeamChatRedState(),"btnChat",ccp(0,0))
    
    self:onShow()
    KingOfWarManager:openChatLayer()
end 

function KingWarScoreFightLayer.onBtnRewardClick( btn )
    KingOfWarManager:openRewardLayer()
end 

function KingWarScoreFightLayer.onBtnRandomClick( btn )
    CommonManager:showOperateSureLayer(
        function()
            KingOfWarManager:requestJoinTeam(0, "")
        end,
        function()
            AlertManager:close()
        end,
        {
            title = localizable.common_tips,
            msg = localizable.KingWarRandomTips,
            showtype = AlertManager.BLOCK_AND_GRAY,
        }
    )
end 

function KingWarScoreFightLayer.onBtnCreateTeamClick( btn )
    local layer = AlertManager:addLayerByFile("lua.logic.kingofwar.KingWarCreateTeamLayer")
    AlertManager:show()
end 

function KingWarScoreFightLayer.onBtnSignUpClick( btn )
    KingOfWarManager:requestSignUp()
end 

function KingWarScoreFightLayer.onBtnopenBox1(sender)
    local self = sender.logic
    KingOfWarManager:openBox(5)
end
function KingWarScoreFightLayer.onBtnopenBox2(sender)
    local self = sender.logic
    KingOfWarManager:openBox(6)
end

function KingWarScoreFightLayer:setData()
    self:showMyInfo()
    self:showRankInfo()
    self:showCutDownTimer()
    if self.tabViewTiaomu then
        self.tabViewTiaomu:reloadData()
    end
end
function KingWarScoreFightLayer:freshBoxInfo(idx)
    for i = 1,2 do
        if KingOfWarManager.boxes ~= 0 and KingOfWarManager.boxes[i] ~= nil then
            local boxes_id = KingOfWarManager.boxes[i] or 0
            local boxInfo = ChampionsBoxData:objectByID((i+4)*1000 + boxes_id)
            self:addBoxEffect(self.Box[i].img_baoxiang,false)
            if boxInfo == nil then
                self.Box[i].txt_mubiao:setText(localizable.zhengba_ZhengbaLayer_no_prize)     
            else
                if i == 1 then  
                    self.Box[i].txt_mubiao:setText(stringUtils.format(localizable.KIngOfWarManager_shengli_ing, boxInfo.value))
                    if KingOfWarManager.winCount >= boxInfo.value then
                        self:addBoxEffect(self.Box[i].img_baoxiang,true)
                    end
                elseif i == 2 then
                    self.Box[i].txt_mubiao:setText(stringUtils.format(localizable.KIngOfWarManager_liansheng_ing, boxInfo.value))
                    if KingOfWarManager.winStreak >= boxInfo.value then
                        self:addBoxEffect(self.Box[i].img_baoxiang,true)
                    end
                end
            end
            self.Box[i].txt_mubiao:setScale(0.9)
        end
    end      
end

function KingWarScoreFightLayer:addBoxEffect(widget,visible)
    local widget_effect = widget:getChildByTag(100)
    if widget == nil and visible == false then
        return
    end
    if widget_effect == nil then
        local resPath = "effect/smallBox.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        local effect = TFArmature:create("smallBox_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:setPosition(ccp(23, 13))
        widget:addChild(effect)
        effect:setTag(100)
        effect:playByIndex(0, -1, -1, 1)
        widget_effect = effect
    end
    widget_effect:setVisible(visible)
end
return KingWarScoreFightLayer