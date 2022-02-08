-- client side CrossFightMessage.lua
--[[
 * @Description: 跨服争锋战战斗界面
 ]]
-- script writer Stephen.tao
-- creation time 2016-05-24

local CrossFightMessage = class("CrossFightMessage",BaseLayer)

function CrossFightMessage:ctor(data)

	self.super.ctor(self, data)
    self.lastApplyTime = 0
	self:init("lua.uiconfig_mango_new.crossfight.CrossFightMessage")
end

function CrossFightMessage:initUI( ui )

	self.super.initUI(self, ui)


    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.KFWLDH,{HeadResType.SYCEE})

    self.btn_rule = TFDirector:getChildByPath(ui, "btn_guizhe")
    self.btn_apply = TFDirector:getChildByPath(ui, "btn_juezhu")
    self.btn_reprot = TFDirector:getChildByPath(ui, "btn_slph")


    self.panel_duizhan = TFDirector:getChildByPath(ui, "panel_duizhan")
    self.panel_jifen = TFDirector:getChildByPath(ui, "panel_jifen")
    self.panel_list = TFDirector:getChildByPath(ui, "panel_huadong")
    self.btn_jiangli = TFDirector:getChildByPath(ui, 'btn_jiangli')


    self.panel_cell = TFDirector:getChildByPath(self.panel_list, "panel_qizhi1")
    self.panel_defGuild = TFDirector:getChildByPath(self.panel_duizhan, "panel_qizhi1")
    self.panel_atkGuild = TFDirector:getChildByPath(self.panel_duizhan, "panel_qizhi2")
    self.btn_left = TFDirector:getChildByPath(self.panel_duizhan, "btn_left")

    self.panel_cell2 = TFDirector:getChildByPath(self.panel_jifen, "panel_qizhi1")
    self.txt_bmbp = TFDirector:getChildByPath(self.panel_jifen, "txt_bmbp")

    self.btn_check1 = TFDirector:getChildByPath(ui, "btn_check1")
    self.txt_time = TFDirector:getChildByPath(ui, "txt_time")
    self.btn_check1:setVisible(false)
    self.txt_time:setVisible(false)

    self.txt_end_time = TFDirector:getChildByPath(ui, "txt_time2")


    self.panel_cell:retain()
    self.panel_cell:removeFromParent(true)
    self.panel_cell:setVisible(false)
    self.panel_cell2:retain()
    self.panel_cell2:removeFromParent(true)
    self.panel_cell2:setVisible(false)

    self:createFightTableView()
    self:createRankTableView()
end


function CrossFightMessage:removeUI()
	self.super.removeUI(self)
    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
    if self.panel_cell2 then
        self.panel_cell2:release()
        self.panel_cell2 = nil
    end
end

function CrossFightMessage:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
end

function CrossFightMessage:setCityId( cityId )
    self.cityId = cityId
    local cityInfo = CrossGuildBattleCityData:objectByID(cityId)
    if cityInfo then
        self.txt_bmbp:setText(stringUtils.format(localizable.CrossFightBattle_MapRankDes,cityInfo.name))
        self.generalHead:setTitleImg(cityInfo.title)
    end
    self.fightTableView:reloadData()

    local num = 0
    if CrossGuildBattleManager.cityBattleInfos and CrossGuildBattleManager.cityBattleInfos.battleQueue then
        num = #CrossGuildBattleManager.cityBattleInfos.battleQueue 
    end
    if num >= 6 then
        self.btn_left:setVisible(true)
    else
        self.btn_left:setVisible(false)
    end

    self.rankTableView:reloadData()



    local img_vs = TFDirector:getChildByPath(self.panel_duizhan,"img_vs")

    if img_vs.fightEffect == nil then
        local resPath = "effect/mission_attacking.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        local effect = TFArmature:create("mission_attacking_anim")

        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:setPosition(ccp(90,100));
        img_vs:addChild(effect,10)
        -- effect:setScale(0.5)
        effect:playByIndex(0, -1, -1, 1)
        img_vs.fightEffect = effect
    end

    local battleQueueNum = 0
    if CrossGuildBattleManager.cityBattleInfos and CrossGuildBattleManager.cityBattleInfos.battleQueue then
        battleQueueNum = #CrossGuildBattleManager.cityBattleInfos.battleQueue
    end
    if battleQueueNum >= 2 then
        self.panel_defGuild:setVisible(true)
        local guildId = CrossGuildBattleManager.cityBattleInfos.battleQueue[1]
        local guildInfo = CrossGuildBattleManager:getGuildInfoInCityBattleInfoById( guildId )
        self:setFightNowGuildInfo( self.panel_defGuild , guildInfo )

        self.panel_atkGuild:setVisible(true)
        guildId = CrossGuildBattleManager.cityBattleInfos.battleQueue[2]
        guildInfo = CrossGuildBattleManager:getGuildInfoInCityBattleInfoById( guildId )
        self:setFightNowGuildInfo( self.panel_atkGuild , guildInfo )

    elseif battleQueueNum == 1 then
        self.panel_defGuild:setVisible(true)
        local guildId = CrossGuildBattleManager.cityBattleInfos.battleQueue[1]
        local guildInfo = CrossGuildBattleManager:getGuildInfoInCityBattleInfoById( guildId )
        self:setFightNowGuildInfo( self.panel_defGuild , guildInfo )
        self.panel_atkGuild:setVisible(false)
    else
        self.panel_defGuild:setVisible(false)
        self.panel_atkGuild:setVisible(false)
    end

    local endTime_1 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_1").value
    local temp_time = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_Wait").value
    local endTime_2 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_2").value
    local currTime = CrossGuildBattleManager:getCurrSecond()
    self.lastApplyTime = 0
    if currTime < temp_time then
        self.lastApplyTime = endTime_1 - currTime
    else
        self.lastApplyTime = endTime_2 - currTime
    end
    if self.lastApplyTime < 0 then
        self.txt_end_time:setVisible(false)
        self.fightTableView:setVisible(false)
        self.panel_atkGuild:setVisible(false)
        if img_vs.fightEffect then
            img_vs.fightEffect:setVisible(false)
        end
        if self.applyTimer then
            TFDirector:removeTimer(self.applyTimer)
            self.applyTimer = nil
            return
        end
    end

    if self.applyTimer == nil and self.lastApplyTime > 0 then
        self.applyTimer = TFDirector:addTimer(1000,-1,nil,function ()
            self.lastApplyTime = self.lastApplyTime - 1
            if self.lastApplyTime <= 0 then
                self.txt_end_time:setVisible(false)
                TFDirector:removeTimer(self.applyTimer)
                self.applyTimer = nil

                self.fightTableView:setVisible(false)
                self.panel_atkGuild:setVisible(false)
                if img_vs.fightEffect then
                    img_vs.fightEffect:setVisible(false)
                end
                return
            end
            self.txt_end_time:setText(self:getApplyIntervalTimeDes(self.lastApplyTime))
        end)
        self.txt_end_time:setText(self:getApplyIntervalTimeDes(self.lastApplyTime))
    end
end

function CrossFightMessage:getApplyIntervalTimeDes( times )
    local hour = math.floor(times/3600)
    local temp = times - hour*3600
    local min = math.floor(temp/60)
    local sec = temp - min*60
    local time_str =  hour..":"..string.format("%02d",min)..":"..string.format("%02d",sec)
    return stringUtils.format(localizable.CrossFightBattle_FightEnd_Txt,time_str)
end

function CrossFightMessage:createFightTableView()
    local tabView =  TFTableView:create()
    tabView:setTableViewSize(self.panel_list:getContentSize())
    tabView:setDirection(TFTableView.TFSCROLLHORIZONTAL)
    -- tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_list:addChild(tabView)
    tabView:setPosition(ccp(0,0))
    self.fightTableView = tabView
    tabView:setZOrder(10)


    self.fightTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable_fight)
    self.fightTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView_fight)
    self.fightTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex_fight)
end
function CrossFightMessage:createRankTableView()
    local tabView =  TFTableView:create()
    local size = self.panel_jifen:getContentSize()
    tabView:setTableViewSize(CCSizeMake(size.width+88,size.height))
    tabView:setDirection(TFTableView.TFSCROLLHORIZONTAL)
    -- tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_jifen:addChild(tabView)
    tabView:setPosition(ccp(-size.width/2,-size.height/2))
    tabView:setZOrder(10)
    self.rankTableView = tabView


    self.rankTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable_rank)
    self.rankTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView_rank)
    self.rankTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex_rank)
end

function CrossFightMessage:registerEvents()
	self.super.registerEvents(self)

    if self.generalHead then
        self.generalHead:registerEvents()
    end

    self.btn_jiangli:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRewardBtnClick))
    self.btn_rule:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRuleBtnClick))
    self.btn_apply:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onApplyBtnClick))
    self.btn_reprot:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onReportBtnClick))
    self.btn_apply.logic = self
    self.btn_reprot.logic = self


    self.guildBattleCurrentStateCallBack = function (event)
        if CrossGuildBattleManager.state == CrossGuildBattleManager.ActivityState_3 then
            CrossGuildBattleManager:gainCityBattleInfos(self.cityId)
            return
        end
        AlertManager:closeAllToLayer(self)
    end
    TFDirector:addMEGlobalListener(CrossGuildBattleManager.GuildBattleCurrentStateNotice, self.guildBattleCurrentStateCallBack)
end



function CrossFightMessage:removeEvents()

    self.super.removeEvents(self)
    if self.generalHead then
        self.generalHead:removeEvents()
    end

    if self.guildBattleCurrentStateCallBack then
        TFDirector:removeMEGlobalListener(CrossGuildBattleManager.GuildBattleCurrentStateNotice, self.guildBattleCurrentStateCallBack)    
        self.guildBattleCurrentStateCallBack = nil
    end

    if self.applyTimer then
        TFDirector:removeTimer(self.applyTimer)
        self.applyTimer = nil
        self.lastApplyTime = 0
    end
end

function CrossFightMessage:dispose()
	self.super.dispose(self)
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
end

function CrossFightMessage.cellSizeForTable_fight(table,idx)
    return 300,150
end

function CrossFightMessage.numberOfCellsInTableView_fight(table)
    local num = 0
    if CrossGuildBattleManager.cityBattleInfos and CrossGuildBattleManager.cityBattleInfos.battleQueue then
        num = #CrossGuildBattleManager.cityBattleInfos.battleQueue - 2
        num = math.max(num,0)
    end
    print(" num = ",num)
    return num
end

function CrossFightMessage.tableCellAtIndex_fight(table, idx)

    local self = table.logic;
    local tableIdx = table.idx

    local cell = table:dequeueCell()
    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell:clone()
        panel:setPosition(ccp(0,0))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end

    local guildId = CrossGuildBattleManager.cityBattleInfos.battleQueue[idx+3]
    local guildInfo = CrossGuildBattleManager:getGuildInfoInCityBattleInfoById( guildId )
    if guildInfo then
        cell.panel:setVisible(true)
        self:setPanelGuildInfo_fight(cell.panel , guildInfo)
    else
        cell.panel:setVisible(false)
    end
    return cell
end


function CrossFightMessage:setPanelGuildInfo_fight( panel , guildInfo )
    local lbGuildName = TFDirector:getChildByPath(panel,"txt_name")
    lbGuildName:setText(guildInfo.guildName)
    local lbServerName = TFDirector:getChildByPath(panel,"txt_fwq")
    lbServerName:setText(guildInfo.serverName)
    local img_qizhi = TFDirector:getChildByPath(panel,"img_qizhi")
    img_qizhi:setTexture(FactionManager:getGuildBannerBgPath(guildInfo.bannerId))
    local img_biaozhi = TFDirector:getChildByPath(panel,"img_biaozhi")
    img_biaozhi:setTexture(FactionManager:getGuildBannerIconPath(guildInfo.bannerId))
end

function CrossFightMessage.cellSizeForTable_rank(table,idx)
    return 300,315
end

function CrossFightMessage.numberOfCellsInTableView_rank(table)
    local num = 0
    if CrossGuildBattleManager.cityBattleInfos and CrossGuildBattleManager.cityBattleInfos.rankInfos then
        num = CrossGuildBattleManager.cityBattleInfos.rankInfos:length()
    end
    return num
end

function CrossFightMessage.tableCellAtIndex_rank(table, idx)

    local self = table.logic;
    local tableIdx = table.idx

    local cell = table:dequeueCell()
    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.panel_cell2:clone()
        panel:setPosition(ccp(0,100))
        panel:setVisible(true)
        cell:addChild(panel)
        cell.panel = panel
    end

    local guildInfo = CrossGuildBattleManager.cityBattleInfos.rankInfos:objectAt(idx+1)
    if guildInfo then
        cell.panel:setVisible(true)
        self:setPanelGuildInfo(cell.panel , guildInfo,idx+1)
    else
        cell.panel:setVisible(false)
    end
    return cell
end

function CrossFightMessage:setPanelGuildInfo( panel , guildInfo ,rank)
    local lbGuildName = TFDirector:getChildByPath(panel,"txt_name")
    lbGuildName:setText(guildInfo.guildName)
    local lbServerName = TFDirector:getChildByPath(panel,"txt_fwq")
    lbServerName:setText(guildInfo.serverName)
    local lbScore = TFDirector:getChildByPath(panel,"txt_num")
    lbScore:setText(guildInfo.score)
    local lbDefDes = TFDirector:getChildByPath(panel,"txt_fs")
    lbDefDes:setText(stringUtils.format(localizable.CrossFightBattle_Def_Success,guildInfo.winCount))
    local lbAtkDes = TFDirector:getChildByPath(panel,"txt_jg")
    lbAtkDes:setText(stringUtils.format(localizable.CrossFightBattle_Atk_Success,guildInfo.lostCount))

    local img_qizhi = TFDirector:getChildByPath(panel,"img_qizhi")
    img_qizhi:setTexture(FactionManager:getGuildBannerBgPath(guildInfo.bannerId))
    local img_biaozhi = TFDirector:getChildByPath(panel,"img_biaozhi")
    img_biaozhi:setTexture(FactionManager:getGuildBannerIconPath(guildInfo.bannerId))

    local img_rank = TFDirector:getChildByPath(panel,"img_shunxu")
    local txt_rank = TFDirector:getChildByPath(panel,"txt_shunxu")
    if rank <= 3 then
        img_rank:setVisible(true)
        txt_rank:setVisible(false)
        img_rank:setTexture("ui_new/leaderboard/no"..rank..".png")
    else
        img_rank:setVisible(false)
        txt_rank:setVisible(true)
        txt_rank:setText(rank)
    end
end

function CrossFightMessage:setFightNowGuildInfo( panel , guildInfo )
    if guildInfo == nil then
        panel:setVisible(false)
        return
    end
    panel:setVisible(true)
    local panelGuildName = TFDirector:getChildByPath(panel,"bg_name1")
    local lbGuildName = TFDirector:getChildByPath(panelGuildName,"txt_name")
    lbGuildName:setText(guildInfo.guildName)
    local lbServerName = TFDirector:getChildByPath(panel,"txt_fwq")
    lbServerName:setText(guildInfo.serverName)
    local img_qizhi = TFDirector:getChildByPath(panel,"img_qizhi")
    img_qizhi:setTexture(FactionManager:getGuildBannerBgPath(guildInfo.bannerId))
    local img_biaozhi = TFDirector:getChildByPath(panel,"img_biaozhi")
    img_biaozhi:setTexture(FactionManager:getGuildBannerIconPath(guildInfo.bannerId))
    local lbFightRecord = TFDirector:getChildByPath(panel,"txt_fightRecord")
    lbFightRecord:setText(stringUtils.format(localizable.CrossFightBattle_Def_Success,guildInfo.winCount))
end

function CrossFightMessage.onRewardBtnClick(btn)
   CrossGuildBattleManager:openRewardLayer()
end

function CrossFightMessage.onRuleBtnClick(sender)
    CrossGuildBattleManager:openRuleLayer()
end

function CrossFightMessage.onApplyBtnClick(sender)
    local self = sender.logic
    if not CrossGuildBattleManager:isCanApplyInState3() then
        toastMessage(localizable.faction_no_levelup)
        return
    end
    if CrossGuildBattleManager.cityBattleInfos == nil or CrossGuildBattleManager.cityBattleInfos.updateCount > 0 then
        toastMessage(localizable.CrossFightBattle_EnoughApplyTime)
        return
    end
    local cityInfo = CrossGuildBattleCityData:objectByID(self.cityId)
    CommonManager:showOperateSureLayer(function()
        CrossGuildBattleManager:updateCity(self.cityId)
    end,
    nil,
    {
        msg = stringUtils.format(localizable.CrossFightBattle_ChangeTxt,cityInfo.name),
    })
end

function CrossFightMessage.onReportBtnClick(sender)
    local self = sender.logic
    CrossGuildBattleManager:gainGuildBattleWarInfos(self.cityId)
end

return CrossFightMessage