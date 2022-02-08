--[[
******英雄大会-排行*******

    -- by jiawei.miao
    -- 2018/1/5
]]
local HeroListLayer = class("HeroListLayer", BaseLayer);

CREATE_SCENE_FUN(HeroListLayer);
CREATE_PANEL_FUN(HeroListLayer);

function HeroListLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.hero.HeroList");
end

function HeroListLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
    self:ResetTabSZ()
    self:selectMasterTab(self.selectedIndex)
end

function HeroListLayer:refreshUI()

end
function HeroListLayer:loadData()
end

function HeroListLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.Ranking = {"ui_new/leaderboard/no1.png", "ui_new/leaderboard/no2.png", "ui_new/leaderboard/no3.png"}
    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close')

    self.panel_bp  = TFDirector:getChildByPath(ui, 'panel_bp')
    self.panel_geren   = TFDirector:getChildByPath(ui, 'panel_geren')

    self.panel_list      = TFDirector:getChildByPath(self.panel_geren, 'panel_list')
    self.personal_panel_wdpm      = TFDirector:getChildByPath(self.panel_geren, 'panel_wdpm')
    self.personal_txt_listnum     = TFDirector:getChildByPath(self.personal_panel_wdpm, 'txt_listnum')
    self.personal_txt_jifennum    = TFDirector:getChildByPath(self.personal_panel_wdpm, 'txt_jifennum')
    self.personal_panel_reward    = TFDirector:getChildByPath(self.panel_geren, 'panel_reward')
    self.personal_txt_time        = TFDirector:getChildByPath(self.panel_geren, 'txt_time')
    self.MyRinkingReward = {}
    for i = 1,2 do 
        local icon          = TFDirector:getChildByPath(self.personal_panel_reward, "img_bg_"..(i+2))
        icon.img_icon       = TFDirector:getChildByPath(icon, "img_icon_1")
        icon.num            = TFDirector:getChildByPath(self.personal_panel_reward, "txt_number_"..(i+2))
        icon.num:setVisible(false)
        icon:setVisible(false)
        self.MyRinkingReward[i]  = icon
    end
    

    self.panel_list2    = TFDirector:getChildByPath(self.panel_bp, 'panel_list')
    self.faction_panel_wdpm      = TFDirector:getChildByPath(self.panel_bp, 'panel_wdpm')
    self.faction_txt_listnum     = TFDirector:getChildByPath(self.faction_panel_wdpm, 'txt_listnum')
    self.faction_txt_jifennum    = TFDirector:getChildByPath(self.faction_panel_wdpm, 'txt_jifennum')
    self.faction_panel_reward    = TFDirector:getChildByPath(self.panel_bp, 'panel_reward')
    self.faction_txt_time        = TFDirector:getChildByPath(self.panel_bp, 'txt_time')
    self.FaciontRinkingReward = {}
    for i = 1,2 do 
        local icon          = TFDirector:getChildByPath(self.faction_panel_reward, "img_bg_"..(i+2))
        icon.img_icon       = TFDirector:getChildByPath(icon, "img_icon_1")
        icon.num            = TFDirector:getChildByPath(self.faction_panel_reward, "txt_number_"..(i+2))
        icon.num:setVisible(false)
        icon:setVisible(false)
        self.FaciontRinkingReward[i]  = icon
    end

    self.tab            = {}
    for i = 1, 2 do
        local tab       = TFDirector:getChildByPath(ui, 'tab'..i)
        self.tab[i]     = tab 
    end
    self.tab2           = {}
    for i = 1, 4 do
        local tab       = TFDirector:getChildByPath(self.panel_geren, 'tab_'..i)
        tab.img_sz      = TFDirector:getChildByPath(tab, 'img_sz')
        self.tab2[i]    = tab 
    end
    local bg    = TFDirector:getChildByPath(self.panel_geren, "bg_2")
    bg:setVisible(false)
    bg          = TFDirector:getChildByPath(self.panel_bp, "bg_2")
    bg:setVisible(false)
    self.bg     = TFDirector:getChildByPath(self.panel_geren, "bg_1")
    self.bg2    = TFDirector:getChildByPath(self.panel_bp, "bg_1")
    self.bg:retain()
    self.bg:removeFromParent()
    self.bg:setVisible(false)
    self.bg2:retain()
    self.bg2:removeFromParent()
    self.bg2:setVisible(false)
    self:selectTab(1)
    --self.tableList  = false
    self.index  = 1
    self.selectedIndex = HeroMeetingManager.myGroup
    self.timerId = nil 
end

function HeroListLayer:removeUI()
    if self.bg then
        self.bg:release()
        self.bg = nil
    end
    if self.bg2 then
        self.bg2:release()
        self.bg2 = nil
    end
    self.super.removeUI(self);
end

function HeroListLayer:ResetTab()
    for i = 1, 2 do
        if i == 1 then
            self.tab[i]:setTextureNormal("ui_new/hero/tab_grph.png")
            self.tab[i]:setTouchEnabled(true)
        elseif i == 2 then
            self.tab[i]:setTextureNormal("ui_new/hero/tab_bpph.png")
            self.tab[i]:setTouchEnabled(true)
        end
    end

end

function HeroListLayer:ResetMasterTab()
    for i = 1, 4 do
        self.tab2[i]:setTextureNormal("ui_new/hero/tab_"..i..".png")
        self.tab2[i]:setTouchEnabled(true)
    end
end
function HeroListLayer:ResetTabSZ()
    for i = 1, 4 do
        self.tab2[i].img_sz:setVisible(false)
    end 
    self.tab2[self.selectedIndex].img_sz:setVisible(true)
end
function HeroListLayer:refreshTableTime()
    if self.timerId == nil then
        self.timerId = TFDirector:addTimer(1000, -1, nil, 
            function() 
                self:refreshTime()
            end)
    end
end
function HeroListLayer:refreshTime()
    local currTime = MainPlayer:getNowtime()
    local timestemp = HeroMeetingManager.endTime - currTime
    local day = math.floor(timestemp / (60 * 60 * 24))
    if day == 0 then 
        local Time = OperationActivitiesManager:TimeConvertString(timestemp)
        self.personal_txt_time:setText(Time)
        self.faction_txt_time:setText(Time)
    elseif day > 0 then
        local hour = math.floor(timestemp / (60 * 60 )% 24)
        local min = math.floor(timestemp / 60 % 60)
        self.personal_txt_time:setText(stringUtils.format(localizable.common_time_3, day, hour, min))
        self.faction_txt_time:setText(stringUtils.format(localizable.common_time_3, day, hour, min))
    elseif day < 0 then
        --活动已结束
        self.faction_txt_time:setText(localizable.treasureMain_tiemout)
        self.personal_txt_time:setText(localizable.treasureMain_tiemout)
    end
end

function HeroListLayer:refreshList()
    self:refreshTableTime()
    if self.index == 1 then
        if self.RecordList == nil then
            self.PersonalRewardList   = HeroDuelRewardData:getRewardList(HeroMeetingManager.HeroPersonalRankingReward)
            self.RecordList = TFTableView:create()
            self.RecordList.logic = self
            local Size = self.panel_list:getSize()
            self.RecordList:setTableViewSize(CCSizeMake(Size.width, Size.height))
            self.RecordList:setDirection(TFTableView.TFSCROLLVERTICAL)
            self.RecordList:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    
            self.RecordList:addMEListener(TFTABLEVIEW_SIZEFORINDEX, HeroListLayer.cellSizeForTable)
            self.RecordList:addMEListener(TFTABLEVIEW_SIZEATINDEX, HeroListLayer.tableCellAtIndex)
            self.RecordList:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, HeroListLayer.numberOfCellsInTableView)
            self.panel_list:addChild(self.RecordList)
            if self.userData.myScore and self.userData.myScore ~= 0 then 
                self.personal_txt_jifennum:setText(self.userData.myScore)
            else
                self.personal_txt_jifennum:setText(0)
            end
            if self.userData.myRank and self.userData.myRank ~= 0 then
                self.personal_txt_listnum:setText(self.userData.myRank)
                for i = 1,2 do
                    local count = 0
                        for k= 1, #self.PersonalRewardList do
                            if self.userData.myRank > self.PersonalRewardList[k][1].param1 - 1 and self.userData.myRank < self.PersonalRewardList[k][1].param2 + 1 then
                                count  = k
                                break;
                            end
                        end 
                    if count ~= 0 and self.PersonalRewardList[count] and self.PersonalRewardList[count][i] then
                        self.MyRinkingReward[i]:setVisible(true)
                        self.MyRinkingReward[i].num:setVisible(true)
                        local jiangli = self.PersonalRewardList[count][i]
                        self:refreshIcon(jiangli.resId,jiangli.resType,jiangli.number,self.MyRinkingReward[i],self.MyRinkingReward[i].img_icon,self.MyRinkingReward[i].num)
                        self.MyRinkingReward[i].itemId = jiangli.resId
                        self.MyRinkingReward[i].itemTypeId = jiangli.resType
                        self.MyRinkingReward[i]:setTouchEnabled(true)
                        self.MyRinkingReward[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
                    end
                end 
            else
                self.personal_txt_listnum:setText(localizable.shalu_info_txt1)
            end
        end
        self.RecordList:reloadData()
    elseif self.index == 2 then 
        if self.RecordList2 == nil then
            self.FactionRewardList   = HeroDuelRewardData:getRewardList(HeroMeetingManager.HeroFactionRankingReward)
            self.RecordList2 = TFTableView:create()
            self.RecordList2.logic = self
            local Size = self.panel_list2:getSize()
            self.RecordList2:setTableViewSize(CCSizeMake(Size.width, Size.height))
            self.RecordList2:setDirection(TFTableView.TFSCROLLVERTICAL)
            self.RecordList2:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    
            self.RecordList2:addMEListener(TFTABLEVIEW_SIZEFORINDEX, HeroListLayer.cellSizeForTable2)
            self.RecordList2:addMEListener(TFTABLEVIEW_SIZEATINDEX, HeroListLayer.tableCellAtIndex2)
            self.RecordList2:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, HeroListLayer.numberOfCellsInTableView2)
            self.panel_list2:addChild(self.RecordList2)
            if self.factionuserData.myGuildScore and self.factionuserData.myGuildScore ~= 0 then 
                self.faction_txt_jifennum:setText(self.factionuserData.myGuildScore)
            else
                self.faction_txt_jifennum:setText(0)
            end
            if self.factionuserData.myGuildRank and self.factionuserData.myGuildRank ~= 0 then 
                self.faction_txt_listnum:setText(self.factionuserData.myGuildRank)
            else
                self.faction_txt_listnum:setText(localizable.shalu_info_txt1)
            end
            if self.factionuserData.myGuildRank and self.factionuserData.myGuildRank <= 10 then
                for i = 1,2 do
                    if self.FactionRewardList[self.factionuserData.myGuildRank] and self.FactionRewardList[self.factionuserData.myGuildRank][i] then
                        self.FaciontRinkingReward[i]:setVisible(true)
                        self.FaciontRinkingReward[i].num:setVisible(true)
                        local jiangli = self.FactionRewardList[self.factionuserData.myGuildRank][i]
                        self:refreshIcon(jiangli.resId,jiangli.resType,jiangli.number,self.FaciontRinkingReward[i],self.FaciontRinkingReward[i].img_icon,self.FaciontRinkingReward[i].num)
                        self.FaciontRinkingReward[i].itemId = jiangli.resId
                        self.FaciontRinkingReward[i].itemTypeId = jiangli.resType
                        self.FaciontRinkingReward[i]:setTouchEnabled(true)
                        self.FaciontRinkingReward[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
                    end
                end
            end
        end
        self.RecordList2:reloadData()

    end
end

function HeroListLayer.cellSizeForTable(table,idx)
    return 105,754
end
function HeroListLayer.numberOfCellsInTableView(table,idx)
    local self = table.logic
    if self.img_iconList  then
        if self.otherRanks then
            return (#self.img_iconList + #self.otherRanks)
        else
            return #self.img_iconList
        end
    else
        return 0
    end
end

function HeroListLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    idx = idx+1
    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.bg:clone()
        panel:setVisible(true)
        panel:setPosition(ccp(0,0))
        cell.panel = panel
        cell:addChild(panel)
    end
    self:setCellInfo(cell,idx)

    return cell
end

function HeroListLayer:setCellInfo(cell,idx)
    local panel = cell.panel
    local txt_name    = TFDirector:getChildByPath(panel, "txt_name")
    local txt_bp     = TFDirector:getChildByPath(panel, "txt_bp")
    local txt_bpname  = TFDirector:getChildByPath(txt_bp, "txt_bpname")
    --前十名
    local img_shunxu    = TFDirector:getChildByPath(panel, "img_shunxu")

    local img_di    = TFDirector:getChildByPath(panel, "img_di")
    local icon_head    = TFDirector:getChildByPath(img_di, "icon_head")
    local txt_level    = TFDirector:getChildByPath(img_di, "txt_level")

    local txt_jf    = TFDirector:getChildByPath(panel, "txt_jf")
    local txt_jf_num    = TFDirector:getChildByPath(txt_jf, "txt_jf_num")
    local txt_zl    = TFDirector:getChildByPath(panel, "txt_zl")
    local txt_zl_num    = TFDirector:getChildByPath(txt_zl, "txt_zl_num")
    --11名之后显示
    local txt_mc_num    = TFDirector:getChildByPath(panel, "txt_mc_num")
    
    if idx <= 3 then 
        img_shunxu:setTexture(self.Ranking[idx])
        img_shunxu:setVisible(true)
    else
        img_shunxu:setVisible(false)
    end
    if idx > 3 and idx < 11 then 
        txt_mc_num:setText(idx)
        txt_mc_num:setVisible(true)
    else
        txt_mc_num:setVisible(false)
    end
    if idx <= 10 then
        img_di:setVisible(true)
        txt_jf:setVisible(true)
        txt_zl:setVisible(true)
        txt_bpname:setVisible(true)
        txt_name:setText(self.img_iconList[idx].playerName)
        txt_level:setText(self.img_iconList[idx].playerLevel.."d")
        txt_bpname:setText(self.img_iconList[idx].guildName)
        txt_jf_num:setText(self.img_iconList[idx].playerScore)
        txt_zl_num:setText(self.img_iconList[idx].fightPower)
        txt_bp:setText(localizable.faction)
        local roleConfig = RoleData:objectByID(self.img_iconList[idx].useIcon)
        if roleConfig == nil then
            roleConfig = RoleData:objectByID(77)
        end
        icon_head:setTexture(roleConfig:getIconPath())  
        Public:addFrameImg(icon_head,self.userData.headPicFrame) 
        txt_mc_num:setScale(1)
        txt_mc_num:setPositionX(50)
    else
        img_di:setVisible(false)
        txt_jf:setVisible(false)
        txt_zl:setVisible(false)
        txt_bpname:setVisible(false)
        txt_mc_num:setVisible(true)
        txt_mc_num:setScale(0.8)
        txt_mc_num:setPositionX(80)
        txt_name:setText(stringUtils.format(localizable.arenaplaylistlayer_list,self.otherRanks[idx-10].beginRank).."  "..self.otherRanks[idx-10].playerName)
        txt_mc_num:setText(stringUtils.format(localizable.arenarewardlayer_list,self.otherRanks[idx-10].beginRank,self.otherRanks[idx-10].endRank))
        txt_bp:setText(localizable.activity_min_score..self.otherRanks[idx-10].minScore)
    end
    local RewardList = {}
    for i = 1,2 do 
        local icon      = TFDirector:getChildByPath(panel, "img_bg_"..(i+2))
        icon.img_icon   = TFDirector:getChildByPath(icon, "img_icon_1")
        icon.num        = TFDirector:getChildByPath(panel, "txt_number_"..(i+2))
        icon:setVisible(false)
        icon.num:setVisible(false)
        RewardList[i] = icon
    end
    for i = 1,2 do
        local count = 0
        if idx <= 10 then
            for k= 1, #self.PersonalRewardList do
                if idx > self.PersonalRewardList[k][1].param1 - 1 and idx < self.PersonalRewardList[k][1].param2 + 1 then
                    count  = k
                    break;
                end
            end 
        else
            for k= 1, #self.PersonalRewardList do
                if self.otherRanks[idx-10].beginRank == self.PersonalRewardList[k][1].param1 and self.otherRanks[idx-10].endRank == self.PersonalRewardList[k][1].param2 then
                    count = k
                end
            end
        end
        if count ~= 0 and self.PersonalRewardList[count] and self.PersonalRewardList[count][i] then
            RewardList[i]:setVisible(true)
            RewardList[i].num:setVisible(true)
            local jiangli = self.PersonalRewardList[count][i]
            self:refreshIcon(jiangli.resId,jiangli.resType,jiangli.number,RewardList[i],RewardList[i].img_icon,RewardList[i].num)
            RewardList[i].itemId = jiangli.resId
            RewardList[i].itemTypeId = jiangli.resType
            RewardList[i]:setTouchEnabled(true)
            RewardList[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
        end
   end 
end
function HeroListLayer.cellSizeForTable2(table,idx)
    return 105,754
end
function HeroListLayer.numberOfCellsInTableView2(table,idx)
    local self = table.logic
    if self.guildRanks then
        return #self.guildRanks
    end
    return 0
end

function HeroListLayer.tableCellAtIndex2(table, idx)
    local self = table.logic
    idx = idx+1
    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.bg2:clone()
        panel:setVisible(true)
        panel:setPosition(ccp(0,-10))
        cell.panel = panel
        cell:addChild(panel)
    end
    self:setCellInfo2(cell,idx)
    return cell
end
function HeroListLayer:setCellInfo2(cell,idx)
    local panel = cell.panel
    local name          = TFDirector:getChildByPath(panel, "txt_name")
    local txt_bz        = TFDirector:getChildByPath(panel, "txt_bz")
    local txt_bzname    = TFDirector:getChildByPath(panel, "txt_bzname")
    local txt_lv_num    = TFDirector:getChildByPath(panel, "txt_lv_num")
    local txt_jf_num    = TFDirector:getChildByPath(panel, "txt_jf_num")
    local img_shunxu    = TFDirector:getChildByPath(panel, "img_shunxu")
    local txt_mc_num    = TFDirector:getChildByPath(panel, "txt_mc_num")
    local img_qi    = TFDirector:getChildByPath(panel, "img_qi")
    local img_icon    = TFDirector:getChildByPath(img_qi, "img_icon")
    if idx <= 3 then 
        img_shunxu:setTexture(self.Ranking[idx])
        img_shunxu:setVisible(true)
    else
        img_shunxu:setVisible(false)
    end
    if idx > 3 then 
        txt_mc_num:setText(idx)
        txt_mc_num:setVisible(true)
    else
        txt_mc_num:setVisible(false)
    end
    local bannerInfo = stringToNumberTable(self.guildRanks[idx].bannerId, '_')
    img_qi:setTexture(FactionManager:getBannerBgPath(bannerInfo[1],bannerInfo[2]))
    img_icon:setTexture(FactionManager:getBannerIconPath(bannerInfo[3],bannerInfo[4]))
    name:setText(self.guildRanks[idx].serverName.."  "..self.guildRanks[idx].guildName) 
    txt_bzname:setText(self.guildRanks[idx].leaderName)
    txt_lv_num:setText(self.guildRanks[idx].guildLevel)
    txt_jf_num:setText(self.guildRanks[idx].guildScore)
    local RewardList = {}
    for i = 1,2 do 
        local icon      = TFDirector:getChildByPath(panel, "img_bg_"..(i+2))
        icon.img_icon   = TFDirector:getChildByPath(icon, "img_icon_1")
        icon.num        = TFDirector:getChildByPath(panel, "txt_number_"..(i+2))
        icon:setVisible(false)
        icon.num:setVisible(false)
        RewardList[i] = icon
    end
   for i = 1,2 do
        if self.FactionRewardList[idx] and self.FactionRewardList[idx][i] then
            RewardList[i]:setVisible(true)
            RewardList[i].num:setVisible(true)
            local jiangli = self.FactionRewardList[idx][i]
            self:refreshIcon(jiangli.resId,jiangli.resType,jiangli.number,RewardList[i],RewardList[i].img_icon,RewardList[i].num)
            RewardList[i].itemId = jiangli.resId
            RewardList[i].itemTypeId = jiangli.resType
            RewardList[i]:setTouchEnabled(true)
            RewardList[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
        end
   end
end

--选择标签
function HeroListLayer:selectTab(index)
    self:ResetTab()
    if index == 1 then
        self.tab[index]:setTextureNormal("ui_new/hero/tab_grphh.png")
        self.tab[index]:setTouchEnabled(false)
        self.panel_geren:setVisible(true)
        self.panel_bp:setVisible(false)
        if RecordList then 
            self.RecordList:setVisible(true)
            self.RecordList2:setVisible(false)
        end
    elseif index == 2 then
        self.tab[index]:setTextureNormal("ui_new/hero/tab_bpphh.png")
        self.tab[index]:setTouchEnabled(false)
        self.panel_geren:setVisible(false)
        self.panel_bp:setVisible(true)
        if RecordList then 
            self.RecordList:setVisible(false)
            self.RecordList2:setVisible(true)
        end
    end
end

function HeroListLayer:refreshIcon(itemId,Type,num,icon,icon1,txt_num)
    if Type == EnumDropType.GOODS then 
        local item = ItemData:objectByID(itemId)
        if (item) then
            local iconStr = item:GetPath()
            icon1:setTexture(iconStr)
            icon:setTexture(GetColorIconByQuality(item.quality))
            txt_num:setText(num)
        end
    elseif Type == EnumDropType.ZHUXIN then
        icon1:setTexture(GetZhuXinCoinIcon())
        icon:setTexture(GetColorIconByQuality(4))
        txt_num:setText(num)
    elseif Type == EnumDropType.COIN then
        icon1:setTexture(GetCoinIcon())
        icon:setTexture(GetColorIconByQuality(4))
        txt_num:setText(num)
    elseif Type == EnumDropType.WEIWANG then
        icon1:setTexture(GetWeiWangCoinIcon())
        icon:setTexture(GetColorIconByQuality(5))
        txt_num:setText(num)
    elseif Type == EnumDropType.SYCEE then
        icon1:setTexture(GetSyceeIcon())
        icon:setTexture(GetColorIconByQuality(4))
        txt_num:setText(num)
    end
end

--选择高手对决所在组标签
function HeroListLayer:selectMasterTab(index)
    self:ResetMasterTab()
    self.tab2[index]:setTextureNormal("ui_new/hero/tab_"..index.."h.png")
    self.tab2[index]:setTouchEnabled(false)
end

function HeroListLayer:registerEvents()
    self.super.registerEvents(self);

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    for i = 1,2 do
        self.tab[i].logic = self
    end

    self.tab[1]:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.PersonalClickHandle,self)))
    self.tab[2]:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.FactionClickHandle,self)))

    for i = 1,4 do
        self.tab2[i].logic = self
        self.tab2[i].index = i
        self.tab2[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.MasterTabClickHandle),self)
    end
    self.refreshTableList = function (event)
        self.img_iconList   = event.data[1][1].topPlayerRanks
        self.otherRanks = event.data[1][1].otherRanks
        self.userData = event.data[1][1]
        self:refreshList()
    end
    TFDirector:addMEGlobalListener(HeroMeetingManager.GET_HERO_DUEL_RANK_RESPONSE ,self.refreshTableList)
    self.refreshGuildTableList = function (event)
        self.guildRanks = event.data[1][1].guildRanks
        self.factionuserData = event.data[1][1]
        self:refreshList()
    end
    TFDirector:addMEGlobalListener(HeroMeetingManager.GET_HERO_DUEL_GUILD_RANK_RESPONSE,self.refreshGuildTableList)
end

function HeroListLayer.MasterTabClickHandle(sender)
    local self = sender.logic
    self.selectedIndex = sender.index
    self:selectMasterTab(self.selectedIndex)
    HeroMeetingManager:sendPersonalRanking(self.selectedIndex)
end

function HeroListLayer.PersonalClickHandle(sender)
    local self = sender.logic
    self.index = 1
    self:selectTab(1)
end

function HeroListLayer.FactionClickHandle(sender)
    local self = sender.logic
    self.index = 2
    self:selectTab(2)
    HeroMeetingManager.sendFactionRanking()
end

function HeroListLayer:removeEvents()
    self.super.removeEvents(self);

    TFDirector:removeMEGlobalListener(HeroMeetingManager.GET_HERO_DUEL_RANK_RESPONSE ,self.refreshTableList)
    self.refreshTableList = nil
    TFDirector:removeMEGlobalListener(HeroMeetingManager.GET_HERO_DUEL_GUILD_RANK_RESPONSE,self.refreshGuildTableList)
    self.refreshGuildTableList = nil
    if self.timerId ~= nil then 
        TFDirector:removeTimer(self.timerId)
        self.timerId = nil
    end
end
function HeroListLayer.onShowItemClickHandle(sender)
    local self = sender.logic;
    Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId)
end
return HeroListLayer;
