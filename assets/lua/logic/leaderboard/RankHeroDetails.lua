
local RankHeroDetails = class("RankHeroDetails")


function RankHeroDetails:ctor(data)

end

function RankHeroDetails:initUI( ui ,rank_type, layer)

    --群豪、英雄、无量
    self.currTeamIndex = 1
    self.type = rank_type
    self.layer = layer
    self.bgLeft1 = TFDirector:getChildByPath(ui, "bgLeft1")
    self.Panel_Role = TFDirector:getChildByPath(ui, "Panel_Role")
    self.txtName = TFDirector:getChildByPath(ui, "txtName")
    self.txtlv = TFDirector:getChildByPath(ui, "txtlv")
    self.txt_power = TFDirector:getChildByPath(self.bgLeft1, "txt_power")
    self.img_fightpower = TFDirector:getChildByPath(self.bgLeft1, "img_fightpower")
    self.img_ditu = TFDirector:getChildByPath(self.bgLeft1, "img_ditu")
    self.img_headIcon = TFDirector:getChildByPath(self.bgLeft1, "img_head")
    self.img_headIcon:setFlipX(true)
    self.img_Frame = TFDirector:getChildByPath(self.bgLeft1, "bg_touxiang")
    self.img_namebg = TFDirector:getChildByPath(self.bgLeft1, "bg_name")
    self.btn_team1 = TFDirector:getChildByPath(self.bgLeft1, "btn_team1")
    self.btn_team2 = TFDirector:getChildByPath(self.bgLeft1, "btn_team2")
    --布阵详细信息
    self.Team_Panel = {}
    self.Team_Role = {}
    for i=1,9 do
        self.Team_Panel[i] = TFDirector:getChildByPath(ui, "Panel_Role"..i)
        self.Team_Role[i] = nil
    end

    --未入榜的显示
    self.bgMyPaimingEx = TFDirector:getChildByPath(ui, "bgMyPaimingEx")
    self.txtWdpmEx = TFDirector:getChildByPath(self.bgMyPaimingEx, "txtWdpm")
    self.txtPowerEx =  TFDirector:getChildByPath(self.bgMyPaimingEx, "txtPower")
    self.txtZhandouliEx = TFDirector:getChildByPath(self.bgMyPaimingEx, "txtZhandouli")
    self.txtZdlEx = TFDirector:getChildByPath(self.bgMyPaimingEx, "txtZdl")

    self.bgMyPaimingNo = TFDirector:getChildByPath(ui, "bgMyPaimingNo")
    self.txtWdpmExNo = TFDirector:getChildByPath(self.bgMyPaimingNo, "txtWdpm")

    --天梯
    self.bgMyDW = TFDirector:getChildByPath(ui, "bgMyDW")
    self.txt_pmDW = TFDirector:getChildByPath(self.bgMyDW, "txt_pm")
    self.posX_txt_pmDW = self.txt_pmDW:getPositionX()
    self.img_iconDW = TFDirector:getChildByPath(self.bgMyDW, "img_icon")
    self.txt_levelDW = TFDirector:getChildByPath(self.bgMyDW, "txt_level")
    self.posX_txt_levelDW = self.txt_levelDW:getPositionX()
    self.txt_starnumberDW = TFDirector:getChildByPath(self.bgMyDW, "txt_starnumber")
    self.img_starDW = TFDirector:getChildByPath(self.bgMyDW, "img_star")
    --群豪、英雄、无量三榜的个人信息
    self.bgMyPaiming = TFDirector:getChildByPath(ui, "bgMyPaiming")
    self.txtWdpm = TFDirector:getChildByPath(ui, "txtWdpm")
    self.paiming = TFDirector:getChildByPath(ui, "paiming")
    self.txtCengshu = TFDirector:getChildByPath(ui, "txtCengshu")
    self.txtZdl = TFDirector:getChildByPath(self.bgMyPaiming, "txtZdl")
    self.txtZhandouli = TFDirector:getChildByPath(ui, "txtZhandouli")
    self.Image_LeaderboardNEW_1 = TFDirector:getChildByPath(ui, "Image_LeaderboardNEW_1")
    self.Img_chenhao_Textures = {
        'ui_new/leaderboard/n1.png',
        'ui_new/leaderboard/n2.png',
        'ui_new/leaderboard/n3.png',
        'ui_new/leaderboard/n4.png',
        'ui_new/leaderboard/n5.png',
        'ui_new/leaderboard/n6.png',
        'ui_new/leaderboard/n7.png',
        'ui_new/leaderboard/n8.png',
        'ui_new/leaderboard/n9.png',
        'ui_new/leaderboard/n10.png'}

    self.registerEnable = false
end


function RankHeroDetails:setDefault()

    self.bgLeft1:setVisible(true)
    self.txtName:setVisible(false)
    self.txtlv:setVisible(false)
    self.txt_power:setVisible(false)
    self.img_fightpower:setVisible(false)
    self.img_ditu:setVisible(false)
    self.img_headIcon:setVisible(false)
    self.img_Frame:setVisible(false)
    self.img_namebg:setVisible(false)
    self.btn_team1:setVisible(false)
    self.btn_team2:setVisible(false)
    if self.starHeroEffect then
        self.starHeroEffect:setVisible(false)
    end
end

function RankHeroDetails:showStarHeroEffect( isStarHero )
    if StarHeroManager:getServerSwitchStatue() == true and isStarHero and isStarHero > 0 then
        self.starHeroEffect = TFDirector:getChildByPath(self.bgLeft1, "starHeroEffect")
        local bgSize = self.bgLeft1:getSize()
        if self.starHeroEffect == nil then
            self.starHeroEffect = Public:getStarHeroEffect()
            self.starHeroEffect:playByIndex(0,-1,-1,1)
            self.starHeroEffect:setScale(0.85)
            local posY = self.txtName:getPositionY() + bgSize.height * 0.5
            self.starHeroEffect:setPositionY(posY)
            self.bgLeft1:addChild(self.starHeroEffect,100)
            self.starHeroEffect:setName('starHeroEffect')
        end
        self.starHeroEffect:setVisible(true)
        local posX = self.btn_team1:getPositionX() + bgSize.width * 0.5
        self.starHeroEffect:setPositionX(posX)
    else
        if self.starHeroEffect then
            self.starHeroEffect:setVisible(false)
        end
    end
end

function RankHeroDetails:showCrossZhengBaEffect( level )
    if CrossZhengBaManager:getServerSwitchStatue() == true and level and level > 0 then
        self.crosszhengbaEffect = TFDirector:getChildByPath(self.bgLeft1, "crosszhengbaEffect")
        local effect = Public:getCrossZhengBaEffect(level)
        if effect then
            if self.crosszhengbaEffect ~= nil then
                self.crosszhengbaEffect:removeFromParent()
                self.crosszhengbaEffect = nil
            end
            local bgSize = self.bgLeft1:getSize()
            self.crosszhengbaEffect = effect
            self.bgLeft1:addChild(self.crosszhengbaEffect,100)
            self.crosszhengbaEffect:setName('crosszhengbaEffect')
            if self.starHeroEffect and self.starHeroEffect:isVisible() == true then
                local pos = self.starHeroEffect:getPosition()
                pos.x = pos.x + 34
                self.crosszhengbaEffect:setPosition(pos)
            else
                local posY = self.txtName:getPositionY() 
                self.crosszhengbaEffect:setPositionY(posY)
                local posX = self.btn_team1:getPositionX()  - 85
                self.crosszhengbaEffect:setPositionX(posX)
            end
            return
        end
    end
    if self.crosszhengbaEffect then
        self.crosszhengbaEffect:setVisible(false)
    end
end

function RankHeroDetails:showDetails(item)
    self:removeRoleAnim()
    self.item = item
    self.currTeamIndex = 1
    local TeamTable = item.formation
    self.roleIdTable = {}

    if self.layer.btn_curr_type == RankListType.Rank_List_Xiling then
        TeamTable = item.formationInfo
        item.name = item.playerName
    end
    if self.layer.btn_curr_type == RankListType.Rank_List_CrossZhengBa then
        local userData = CrossZhengBaManager:getOtherPlayerData(item.playerId)
        self.item = nil
        if userData == nil then
            local serverId = math.floor(item.playerId)
            serverId = math.floor(serverId/131072)
            OtherPlayerManager:requestPlayerInfo(10,item.playerId,serverId)
            return
        end
        self:showDetailsByUserData(userData)
        return
    end
    self:_drawDetails(TeamTable,item)
end

function RankHeroDetails:showDetailsByUserData( userData )
    local TeamTable = {}
    local cardList = userData.warside
    for k,v in pairs(cardList) do
        table.insert(TeamTable,{templateId = v.id,position = v.warIndex})
    end
    userData.formation = TeamTable
    self.item = userData
    self:_drawDetails(TeamTable,self.item)
end

function RankHeroDetails:_drawDetails(TeamTable,item)
    if TeamTable ~= nil then
        self.bgLeft1:setVisible(true)
        self.txtName:setVisible(true)
        self.txtlv:setVisible(true)
        self.txt_power:setVisible(true)
        self.img_fightpower:setVisible(true)
        self.img_ditu:setVisible(true)
        self.img_headIcon:setVisible(true)
        self.img_Frame:setVisible(true)
        self.img_namebg:setVisible(true)
        self.btn_team1:setVisible(false)
        self.btn_team2:setVisible(false)
        local roleConfig = RoleData:objectByID(item.profession)                     --pck change head icon and head icon frame
        if nil == roleConfig then
            roleConfig = RoleData:objectByID(item.roleId)
        end
        
        if self.layer.btn_curr_type == RankListType.Rank_List_Xiling then
            roleConfig = RoleData:objectByID(item.icon)
            if roleConfig == nil then
                roleConfig = RoleData:objectByID(77)
            end
            item.name = item.playerName
        elseif self.layer.btn_curr_type == RankListType.Rank_List_CrossZhengBa then
            local _roleConfig = RoleData:objectByID(item.icon)
            if _roleConfig then
                roleConfig = _roleConfig
            elseif _roleConfig == nil and roleConfig == nil then
                roleConfig = RoleData:objectByID(77)
            end
        end
        
        self.img_headIcon:setTexture(roleConfig:getIconPath())
        Public:addFrameImg(self.img_headIcon,item.headPicFrame)                    --end
        if self.layer.btn_curr_type == RankListType.Rank_List_Xiling then
            Public:addInfoListen(self.img_headIcon,true,5, item.playerId, item.serverId)
        elseif self.layer.btn_curr_type == RankListType.Rank_List_CrossZhengBa then
            if CrossZhengBaManager:getRankServerSwitchStatue() == true then
                local serverId = math.floor(item.playerId)
                serverId = math.floor(serverId/131072)
                Public:addInfoListen(self.img_headIcon,true,12, item.playerId, serverId)
            else
                self.img_headIcon:setTouchEnabled(false)
            end
        else
            Public:addInfoListen(self.img_headIcon,true,1,item.playerId)
        end
        self:showStarHeroEffect(item.starHeroRanking)
        self:showCrossZhengBaEffect(item.ladderGrade)
        self.txtName:setString(item.name)
        if self.layer.btn_curr_type == RankListType.Rank_List_Qunhao then
            local percentValue
            if item.totalChallenge == 0 then
                --percentValue = "胜率: 0%"
                percentValue = stringUtils.format(localizable.common_win_radio,0)
            else
                --percentValue = string.format("胜率:%d ", (item.totalWin*100)/item.totalChallenge) .. "%"
                local _num = math.ceil((item.totalWin*100)/item.totalChallenge)
                percentValue = stringUtils.format(localizable.common_win_radio,_num)
            end
            self.txtlv:setString(percentValue)
        elseif self.layer.btn_curr_type == RankListType.Rank_List_Xiling then
            self.txtlv:setString(stringUtils.format(localizable.common_ceng, item.floorId))
        else

            --self.txtlv:setString(item.level.."级")
            self.txtlv:setString(stringUtils.format(localizable.common_LV,item.level))
        end

        self.img_fightpower:setVisible(true)
        self.txt_power:setVisible(true)
        self.img_ditu:setVisible(true)

        if self.currTeamIndex == 1 then
            self.txt_power:setText(item.power)
        else
            self.txt_power:setText(item.secondPower)
        end
        self:showFormation(TeamTable)
        --self:brushTeamBtn(1)
        if item.secondFormation ~= nil then
            self:brushTeamBtn(1)
        end
    end
end

function RankHeroDetails:OnShowTeamClick(sender)
    local TeamTable = self.item.formation

    if self.layer.btn_curr_type == RankListType.Rank_List_Xiling then
        TeamTable = self.item.formationInfo
        self.item.name = self.item.playerName
    end

    self.currTeamIndex = sender.id
    self.txt_power:setText(self.item.power)
    if sender.id == 2 then
        TeamTable = self.item.secondFormation
        self.txt_power:setText(self.item.secondPower)
    end
    self:brushTeamBtn(sender.id)
    self:removeRoleAnim()
    self:showFormation(TeamTable)

    print('self.currTeamIndex = ',self.currTeamIndex)
end

function RankHeroDetails:showFormation( TeamTable )
    if TeamTable ~= nil then
        for k,v in pairs(TeamTable) do
            local position = v.position + 1
            if v.templateId and v.templateId ~= 0 then
                self.Team_Role[position] = GameResourceManager:getRoleAniById(v.templateId)
                self.Team_Role[position].StorageRoleID = v.templateId
                self.Team_Role[position]:setPosition(ccp(0,0))
                self.Team_Panel[position]:addChild(self.Team_Role[position])
                self.Team_Role[position]:play("stand", -1, -1, 1)
                self.Team_Role[position]:setScale(0.9)
                self.layer:SaveRoleID(v.templateId)

                self.Team_Role[position].logic = self
                self.Team_Role[position].ID = v.templateId
                self.Team_Role[position].PlayerID = self.item.playerId
                self.Team_Role[position].playerName = self.item.name
                self.Team_Role[position]:setTouchEnabled(true)
                self.Team_Role[position]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.openOtherRoleInfo), 1);
            end

            if self.roleIdTable[self.currTeamIndex] == nil then
                self.roleIdTable[self.currTeamIndex] = {}
            end
            local newIndex = #self.roleIdTable[self.currTeamIndex] + 1
            self.roleIdTable[self.currTeamIndex][newIndex] = v.templateId
        end
    end
end

function RankHeroDetails:brushTeamBtn(id)
    self.btn_team1:setVisible(true)
    self.btn_team2:setVisible(true)
    if id == 1 then
        self.btn_team1:setTouchEnabled(false)
        self.btn_team2:setTouchEnabled(true)
        self.btn_team1:setTextureNormal("ui_new/leaderboard/btn_team1s.png")
        self.btn_team2:setTextureNormal("ui_new/leaderboard/btn_team2.png")
    else
        self.btn_team1:setTouchEnabled(true)
        self.btn_team2:setTouchEnabled(false)
        self.btn_team1:setTextureNormal("ui_new/leaderboard/btn_team1.png")
        self.btn_team2:setTextureNormal("ui_new/leaderboard/btn_team2s.png")
    end
end

function RankHeroDetails:showMyDetails(item)

    local powerDx;
    --self.txtZdlEx:setText("战斗力:")
    self.txtZdlEx:setText(localizable.common_ce_text)
    --self.txtZdl:setText("战斗力:")
    self.txtZdl:setText(localizable.common_ce_text)
    if self.layer.btn_curr_type == RankListType.Rank_List_Hero then
        self.txtCengshu:setVisible(false)
        self.txtZdl:setVisible(true)
        self.txtZhandouli:setVisible(true)        
        self.txtZhandouli:setString(item.myBestValue)

        --powerDx = (item.lastPower - item.myBestValue).."战斗力"
        powerDx =  stringUtils.format(localizable.common_ce2,  (item.lastPower - item.myBestValue))
    elseif self.layer.btn_curr_type == RankListType.Rank_List_Qunhao then
        self.txtCengshu:setVisible(false)
        self.txtZdl:setVisible(true)
        self.txtZhandouli:setVisible(true)
        self.txtZhandouli:setString(StrategyManager:getPower())
        --powerDx = (item.myBestValue-item.lastValue).."名"
        powerDx =stringUtils.format(localizable.common_rank, (item.myBestValue-item.lastValue))
        
    elseif self.layer.btn_curr_type == RankListType.Rank_List_fumo then  
        --self.txtZdlEx:setText("最高伤害:")
        --self.txtZdl:setText("最高伤害:")
        self.txtZdlEx:setText(localizable.common_max_hurt)
        self.txtZdl:setText(localizable.common_max_hurt)
        self.txtCengshu:setVisible(false)
        self.txtZdl:setVisible(true)
        self.txtZhandouli:setVisible(true)
        self.txtZhandouli:setString(item.myBestValue)
        --powerDx = (item.last - item.myBestValue).."伤害"     
	powerDx =stringUtils.format(localizable.common_hurt, (item.last - item.myBestValue))
    elseif self.layer.btn_curr_type == RankListType.Rank_List_ShaLu then  
        --self.txtZdlEx:setText("杀戮值:")
        --self.txtZdl:setText("杀戮值:")
	self.txtZdlEx:setText(localizable.common_max_shalu)
        self.txtZdl:setText(localizable.common_max_shalu)
        self.txtCengshu:setVisible(false)
        self.txtZdl:setVisible(true)
        self.txtZhandouli:setVisible(true)
        self.txtZhandouli:setString(item.myBestValue)
        --powerDx = (item.lastValue - item.myBestValue).."杀戮值"
	powerDx = stringUtils.format(localizable.common_shalu, item.lastValue - item.myBestValue)
    elseif self.layer.btn_curr_type == RankListType.Rank_List_Xiling then 
        self.txtCengshu:setVisible(true)
        self.txtZdl:setVisible(false)
        self.txtZhandouli:setVisible(false)
        self.txtCengshu:setString(stringUtils.format(localizable.common_ceng, item.floorId))

        --powerDx = (item.lastValue - item.myBestValue).."层"
        powerDx = stringUtils.format(localizable.common_ceng, (item.minValue - item.floorId))
    elseif self.layer.btn_curr_type == RankListType.Rank_List_CrossZhengBa then
        local itemData = CrossZhengBaManager:getData(item.myGrade)
        if itemData == nil then
            item.myStar = 0
            self.txt_levelDW:setText(localizable.common_no)
            self.txt_levelDW:setPositionX(self.posX_txt_pmDW)
            self.txt_starnumberDW:setText("")
            self.img_iconDW:setVisible(false)
            self.img_starDW:setVisible(false)
        else
            local path = CrossZhengBaManager:getSmallGradeImg(item.myGrade)
            self.img_iconDW:setTexture(path)
            self.img_iconDW:setVisible(true)
            self.img_starDW:setVisible(true)
            self.txt_levelDW:setText(itemData.name)
            self.txt_levelDW:setPositionX(self.posX_txt_levelDW)
            self.txt_starnumberDW:setText(item.myStar)
        end
        
    else
        self.txtCengshu:setVisible(true)
        self.txtZdl:setVisible(false)
        self.txtZhandouli:setVisible(false)
        --self.txtCengshu:setString(item.myBestValue.."层")
        self.txtCengshu:setString(stringUtils.format(localizable.common_ceng, item.myBestValue))
        --powerDx = (item.lastValue - item.myBestValue).."层"
        powerDx = stringUtils.format(localizable.common_ceng, (item.lastValue - item.myBestValue))
    end


    self.bgMyPaimingNo:setVisible(false)
    if item.myRanking == 0 then
        self.bgMyPaiming:setVisible(false)
        if self.layer.btn_curr_type == RankListType.Rank_List_Qunhao or self.layer.btn_curr_type == RankListType.Rank_List_Wuliang or self.layer.btn_curr_type == RankListType.Rank_List_Xiling then
            self.bgMyPaimingNo:setVisible(true)
            self.bgMyPaimingEx:setVisible(false)
            self.bgMyDW:setVisible(false)
            --self.txtWdpmExNo:setText("未排名")
            self.txtWdpmExNo:setText(localizable.common_not_rank)
        elseif self.layer.btn_curr_type == RankListType.Rank_List_fumo and item.myBestValue == 0 then
            self.bgMyPaimingNo:setVisible(true)
            self.bgMyPaimingEx:setVisible(false)
            self.bgMyDW:setVisible(false)
            --self.txtWdpmExNo:setText("未挑战")
            self.txtWdpmExNo:setText(localizable.common_not_fight)
        elseif self.layer.btn_curr_type == RankListType.Rank_List_CrossZhengBa then
            self.bgMyPaiming:setVisible(false)
            self.bgMyPaimingEx:setVisible(false)
            self.bgMyDW:setVisible(true)
            self.txt_pmDW:setText(localizable.common_not_rank)
        else
            self.bgMyPaiming:setVisible(false)
            self.bgMyPaimingEx:setVisible(true)
            self.bgMyDW:setVisible(false)
            self.txtPowerEx:setString(powerDx)
            self.txtZhandouliEx:setString(item.myBestValue)
        end
    else
        if self.layer.btn_curr_type == RankListType.Rank_List_CrossZhengBa then
            self.bgMyPaiming:setVisible(false)
            self.bgMyPaimingEx:setVisible(false)
            self.bgMyDW:setVisible(true)
            self.txt_pmDW:setText(item.myRanking)
        else
            self.bgMyPaiming:setVisible(true)
            self.bgMyPaimingEx:setVisible(false)
            self.bgMyDW:setVisible(false)
            self.paiming:setVisible(true)
            self.paiming:setText(item.myRanking)
        end

        local rankingHero = RankManager:isInTen(MainPlayer:getPlayerId())

        if self.layer.btn_curr_type ~= RankListType.Rank_List_Xiling then
            if rankingHero > 10 then
                self.Image_LeaderboardNEW_1:setVisible(false)
            else
                self.Image_LeaderboardNEW_1:setVisible(true)
                self.Image_LeaderboardNEW_1:setTexture(self.Img_chenhao_Textures[rankingHero])
            end
        else
            self.Image_LeaderboardNEW_1:setVisible(false)
        end
   end
end

function RankHeroDetails:setVisible(enable)
	self.bgMyPaiming:setVisible(enable)
	self.bgLeft1:setVisible(enable)
    self.bgMyPaimingEx:setVisible(enable)
    self.bgMyPaimingNo:setVisible(enable)
    self.bgMyDW:setVisible(enable)
    if enable == true then
        self:registerEvents()
    else
        self:removeEvents()
        self:removeRoleAnim()
    end    
end

function RankHeroDetails.openOtherRoleInfo(sender)

    local self = sender.logic
    sender.logic.clickRoleId = sender.ID
    sender.logic.playerName = sender.playerName

    if self.layer.btn_curr_type == RankListType.Rank_List_Qunhao then
        OtherPlayerManager:showOtherPlayerdetails(sender.PlayerID, "rank", true)
    elseif self.layer.btn_curr_type == RankListType.Rank_List_ShaLu then
        if self.currTeamIndex == 2 and self.item.secondPower ~= 0 then
            OtherPlayerManager:showOtherPlayerdetailsForShaluRank(sender.PlayerID, "rank", 4)
        else
            OtherPlayerManager:showOtherPlayerdetailsForShaluRank(sender.PlayerID, "rank", 3)
        end
    elseif self.layer.btn_curr_type == RankListType.Rank_List_Xiling then
        return
    elseif self.layer.btn_curr_type == RankListType.Rank_List_CrossZhengBa then
        local serverId = math.floor(sender.PlayerID)
        serverId = math.floor(serverId/131072)
        OtherPlayerManager:requestPlayerInfo(13, sender.PlayerID, serverId )
        return
    else
        OtherPlayerManager:showOtherPlayerdetails(sender.PlayerID, "rank")
    end
end

function RankHeroDetails:registerEvents()
    --监听点击英雄详情事件
    if self.registerEnable == false then
        self.registerEnable = true
        self.openRankInfolayer = function(event)
            if self.clickRoleId  ~= 0 then
                local userData = event.data[1];

                OtherPlayerManager:openRoleInfoByName( userData, self.clickRoleId, self.playerName, self.roleIdTable[self.currTeamIndex], teamIndex)
            end
        end
        TFDirector:addMEGlobalListener(OtherPlayerManager.OPENRANKINFO ,self.openRankInfolayer)

        self.showDetailsssss = function(event)
            local userData = event.data[1][1]
            CrossZhengBaManager:pushOtherPlayerData(userData)
            self:showDetailsByUserData(userData)
        end
        TFDirector:addMEGlobalListener("CrossZhengBaOutRankSHowDetail" ,self.showDetailsssss)
        self.btn_team1.id = 1
        self.btn_team2.id = 2
        self.btn_team1:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(RankHeroDetails.OnShowTeamClick,self)),1)
        self.btn_team2:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(RankHeroDetails.OnShowTeamClick,self)),1)
    end
end

function RankHeroDetails:removeEvents()
    if self.registerEnable then
        self.registerEnable = false
        TFDirector:removeMEGlobalListener(OtherPlayerManager.OPENRANKINFO ,self.openRankInfolayer)
        TFDirector:removeMEGlobalListener("CrossZhengBaOutRankSHowDetail" ,self.showDetailsssss)
    end
end

function RankHeroDetails:removeRoleAnim()

    for i=1,9 do
        if self.Team_Role[i] ~= nil then
            local StorageRoleID = self.Team_Role[i].StorageRoleID
            self.Team_Role[i]:removeMEListener(TFWIDGET_CLICK)
            self.Team_Role[i]:removeFromParent()            
            self.Team_Role[i] = nil
            GameResourceManager:deleRoleAniById(StorageRoleID)
        end
    end

end
return RankHeroDetails