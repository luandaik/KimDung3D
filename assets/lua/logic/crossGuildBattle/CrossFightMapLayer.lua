-- client side CrossFightMapLayer.lua
--[[
 * @Description: 跨服帮派争锋主界面地图
 ]]
-- script writer Stephen.tao
-- creation time 2016-05-23

local CrossFightMapLayer = class("CrossFightMapLayer",BaseLayer)

CrossFightMapLayer.MapIdIndex = {1,4,2,3,5,6}
function CrossFightMapLayer:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossfight.CrossFight")

end

function CrossFightMapLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.CrossGuildBattle,{HeadResType.SYCEE})
    local bg = TFDirector:getChildByPath(ui,'bg')
    self.panel_sl = {}
    self.city_img_high = {}
    self.city_click = {}
    self.city_click_high = {}
    for i=1,6 do
        self.panel_sl[i] = TFDirector:getChildByPath(ui, 'panel_sl'..i)
        self.city_img_high[i] = TFDirector:getChildByPath(ui, 'img_xz'..i)
        self.city_click[i] = TFDirector:getChildByPath(ui, 'img_click_'..i)
        self.city_click_high[i] = TFDirector:getChildByPath(ui, 'img_xz'..i.."_high")
        self.city_click_high[i]:setVisible(false)
    end

    self.panel_baoming = TFDirector:getChildByPath(ui, 'panel_baoming')
    self.panel_fight = TFDirector:getChildByPath(ui, 'panel_fight')

    self.txt_endShow = TFDirector:getChildByPath(ui, "txt_endShow")
    self.btn_apply = TFDirector:getChildByPath(ui, 'btn_apply')
    self.btn_buzhen = TFDirector:getChildByPath(ui, 'btn_buzhen')
    self.btn_kfsd = TFDirector:getChildByPath(ui, 'btn_kfsd')
    self.btn_guizhe = TFDirector:getChildByPath(ui, 'btn_guizhe')
    self.btn_slph = TFDirector:getChildByPath(ui, 'btn_slph')
    self.panel_time = TFDirector:getChildByPath(ui, 'panel_time')

    self.btn_reward = TFDirector:getChildByPath(ui, 'btn_reward')
end

function CrossFightMapLayer:removeUI()
	self.super.removeUI(self)
end

function CrossFightMapLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
    -- for i=1,6 do
    --     local index = self.MapIdIndex[i]
    --     local img_ybm = TFDirector:getChildByPath(self.panel_sl[index],"img_ybm")
    --     img_ybm:setVisible(false)
    --     if CrossGuildBattleManager.applySimpleInfo and CrossGuildBattleManager.applySimpleInfo.cityId then
    --         if CrossGuildBattleManager.applySimpleInfo.cityId == i then
    --             img_ybm:setVisible(true)
    --         end
    --     end
    -- end
    self:showCrossFightInfo(true)
end

function CrossFightMapLayer:registerEvents()
	self.super.registerEvents(self)

    if self.generalHead then
        self.generalHead:registerEvents()
    end

    self.btn_kfsd:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShopBtnClick))
    self.btn_guizhe:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRuleBtnClick))
    self.btn_apply:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onApplyBtnClick))
    self.btn_buzhen:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onArmyBtnClick))
    self.btn_slph:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGuildRankBtnClick))
    self.btn_reward:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRewardBtnClick))

    for i=1,6 do
        self.city_click[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onMapIconClick))
        self.city_click[i]:addMEListener(TFWIDGET_TOUCHBEGAN, audioClickfun(self.onMapIconTouchBegin))
        self.city_click[i]:addMEListener(TFWIDGET_TOUCHMOVED, audioClickfun(self.onMapIconTouchMove))
        self.city_click[i]:addMEListener(TFWIDGET_TOUCHENDED, audioClickfun(self.onMapIconTouchEnd))
        self.city_click[i].logic = self
        self.city_click[i]:setTouchEnabled(true)
        self.city_click[i].index = CrossFightMapLayer:getCityIdByIndex( i )
    end

    self.guildBattleCurrentStateCallBack = function (event)
        if CrossGuildBattleManager.state == CrossGuildBattleManager.ActivityState_2 then
            if self.qualifyingInfoList == nil then
                CrossGuildBattleManager:gainQualifyingInfoList()
            end
            CrossGuildBattleManager:gainApplySimpleInfo()
            return
        elseif CrossGuildBattleManager.state == CrossGuildBattleManager.ActivityState_3 then
            CrossGuildBattleManager:gainCityBattleSimpleInfo()
            return
        end
        CrossGuildBattleManager:openCurrLayer(true)
    end
    TFDirector:addMEGlobalListener(CrossGuildBattleManager.GuildBattleCurrentStateNotice, self.guildBattleCurrentStateCallBack)
end

function CrossFightMapLayer:removeEvents()
    self.super.removeEvents(self)
	if self.generalHead then
        self.generalHead:removeEvents()
    end
    if self.applyTimer then
        TFDirector:removeTimer(self.applyTimer)
        self.applyTimer = nil
        self.lastApplyTime = 0
    end

    if self.guildBattleCurrentStateCallBack then
        TFDirector:removeMEGlobalListener(CrossGuildBattleManager.GuildBattleCurrentStateNotice, self.guildBattleCurrentStateCallBack)    
        self.guildBattleCurrentStateCallBack = nil
    end
end

function CrossFightMapLayer:dispose()
	self.super.dispose(self)
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
end

function CrossFightMapLayer:showCrossFightInfo(isUp)
    local state = CrossGuildBattleManager:getActivityState()
    if state == CrossGuildBattleManager.ActivityState_2 then
        self:showApplyInfoLayer()
    elseif state == CrossGuildBattleManager.ActivityState_3 then
        self:showFightInfoLayer()
    elseif (isUp ~= true) then
        CrossGuildBattleManager:openCurrLayer(true)
    end
end

function CrossFightMapLayer:getApplyIntervalTimeDes( times )
    local hour = math.floor(times/3600)
    local temp = times - hour*3600
    local min = math.floor(temp/60)
    local sec = temp - min*60
    -- local time_str =  hour..":"..string.format("%02d",min)..":"..string.format("%02d",sec)
    return stringUtils.format(localizable.CrossFightBattle_TimeShow,hour,min,sec)
end

--show apply info
function CrossFightMapLayer:showApplyInfoLayer()
    self.btn_apply:setVisible(true)
    self.btn_buzhen:setVisible(true)
    self.panel_baoming:setVisible(true)
    self.panel_fight:setVisible(false)
    for i=1,6 do
        local cityInfo = CrossGuildBattleCityData:objectByID(i)
        local index = self.MapIdIndex[i]
        -- local panel_sl = self.panel_sl[index]
        local jifen_num = TFDirector:getChildByPath(self.panel_sl[index],"txt_num")
        jifen_num:setText(cityInfo.score)
        local img_ybm = TFDirector:getChildByPath(self.panel_sl[index],"img_ybm")
        img_ybm:setVisible(false)
        self.city_img_high[index]:setVisible(false)
        if CrossGuildBattleManager.applySimpleInfo and CrossGuildBattleManager.applySimpleInfo.cityId then
            if CrossGuildBattleManager.applySimpleInfo.cityId == i then
                img_ybm:setVisible(true)
                self.city_img_high[index]:setVisible(true)
            end
        end
        local img_baoming = TFDirector:getChildByPath(self.panel_baoming,"img_baoming"..index)
        img_baoming:setVisible(false)
        if CrossGuildBattleManager.applySimpleInfo.infos then
            local applyInfo = CrossGuildBattleManager:getApplySimpleInfoByCityId( i )
            if applyInfo and applyInfo.count ~= 0 then
                img_baoming:setVisible(true)
                local img_hongdi = TFDirector:getChildByPath(img_baoming,"img_hongdi")
                local txt_bm_num = TFDirector:getChildByPath(img_hongdi,"txt_bm")
                txt_bm_num:setText(applyInfo.count)

                local panel_qizhi2 = TFDirector:getChildByPath(img_baoming,"panel_qizhi2")
                local lbGuildName = TFDirector:getChildByPath(panel_qizhi2,"txt_bm")
                lbGuildName:setText(applyInfo.infos.guildName)
                local img_qizhi = TFDirector:getChildByPath(panel_qizhi2,"img_qizhi")
                img_qizhi:setTexture(FactionManager:getGuildBannerBgPath(applyInfo.infos.bannerId))
                local img_biaozhi = TFDirector:getChildByPath(panel_qizhi2,"img_biaozhi")
                img_biaozhi:setTexture(FactionManager:getGuildBannerIconPath(applyInfo.infos.bannerId))
            end
        end
    end

    if not CrossGuildBattleManager:isCanApply() then
        self.btn_apply:setVisible(false)
        self.btn_buzhen:setVisible(false)
    end

    self:freshCountTime()

end

function CrossFightMapLayer:freshCountTime()

    local endTimeList = {}
    endTimeList[1] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_2").value
    endTimeList[2] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Apply_End_1").value
    endTimeList[3] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_Begin_1").value
    endTimeList[4] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_1").value
    endTimeList[5] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_Wait").value
    endTimeList[6] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Apply_End_2").value
    endTimeList[7] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_Begin_2").value
    endTimeList[8] = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_2").value
    local currTime = CrossGuildBattleManager:getCurrSecond()
    self.lastApplyTime = 0
    if currTime < endTimeList[1] or currTime >= endTimeList[8] then
        self.panel_time:setVisible(false)
        self.txt_endShow:setVisible(true)
        if self.applyTimer then
            TFDirector:removeTimer(self.applyTimer)
            self.applyTimer = nil
        end
        return
    end
    self.txt_endShow:setVisible(false)
    self.panel_time:setVisible(true)
    local txt_time = TFDirector:getChildByPath(self.panel_time,"txt_time")
    local txt_des = TFDirector:getChildByPath(self.panel_time,"txt_shili")
    local panel_txt = TFDirector:getChildByPath(self.panel_time,"panel_txt")
    for i=1,7 do
        if currTime >= endTimeList[i] and currTime < endTimeList[i+1] then
            self.lastApplyTime = endTimeList[i+1] - currTime
            txt_des:setText(localizable.CrossFightBattle_MapLayer_Txt[i])
            if i ~= 1 and i ~= 5 then
                self.btn_apply:setVisible(false)
            end
        end
    end


    txt_time:setPositionX(txt_des:getSize().width)
    if self.btn_apply:isVisible() then
        panel_txt:setPosition(ccp(0,0))
    else
        panel_txt:setPosition(ccp(0,20))
    end


    if self.applyTimer == nil  then
        self.applyTimer = TFDirector:addTimer(1000,-1,nil,function ()
            self.lastApplyTime = self.lastApplyTime - 1
            if self.lastApplyTime <= 0 then
                self:freshCountTime()
                return
            end
            txt_time:setText(self:getApplyIntervalTimeDes(self.lastApplyTime))
        end)
        txt_time:setText(self:getApplyIntervalTimeDes(self.lastApplyTime))
    else
        if self.lastApplyTime > 0 then
            txt_time:setText(self:getApplyIntervalTimeDes(self.lastApplyTime))
        end
    end

end


function CrossFightMapLayer:getCityIdByIndex( index )
    for i=1,6 do
        if index == self.MapIdIndex[i] then
            return i
        end
    end
    return 1
end

function CrossFightMapLayer:showFightInfoLayer()
    self.btn_apply:setVisible(false)
    self.btn_buzhen:setVisible(true)
    self.panel_baoming:setVisible(false)
    self.panel_fight:setVisible(true)

    local isFightNow = true
    local currTime = CrossGuildBattleManager:getCurrSecond()
    local endTimeList_4 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_1").value
    local endTimeList_5 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_Wait").value
    local endTimeList_8 = ConstantData:objectByID("CrossGuildBattleManager.ActivityState_Fight_End_2").value
    if (currTime >= endTimeList_4 and currTime < endTimeList_5) or currTime >= endTimeList_8 then
        isFightNow = false
    end
    for i=1,6 do
        local cityInfo = CrossGuildBattleCityData:objectByID(i)
        local index = self.MapIdIndex[i]
        -- local panel_sl = self.panel_sl[index]
        local jifen_num = TFDirector:getChildByPath(self.panel_sl[index],"txt_num")
        jifen_num:setText(cityInfo.score)
        local img_ybm = TFDirector:getChildByPath(self.panel_sl[index],"img_ybm")
        img_ybm:setVisible(false)

        self.city_img_high[index]:setVisible(false)
        if CrossGuildBattleManager.cityBattleSimpleInfo and CrossGuildBattleManager.cityBattleSimpleInfo.cityId then
            if CrossGuildBattleManager.cityBattleSimpleInfo.cityId == i then
                self.city_img_high[index]:setVisible(true)
            end
        end


        local img_baoming = TFDirector:getChildByPath(self.panel_fight,"img_baoming"..index)
        local fightInfo = CrossGuildBattleManager:getCityBattleSimpleInfoByCityId(i)
        img_baoming:setVisible(false)
        print("fightInfo ========",fightInfo)
        if fightInfo then
            img_baoming:setVisible(true)
            for j=1,2 do
                local panel_qizhi = TFDirector:getChildByPath(img_baoming,"panel_qizhi"..j)
                local guildInfo = fightInfo.infos[j]
                if guildInfo == nil then
                    panel_qizhi:setVisible(false)
                else
                    panel_qizhi:setVisible(true)
                    local lbGuildName = TFDirector:getChildByPath(panel_qizhi,"txt_bm")
                    lbGuildName:setText(guildInfo.guildName)
                    local img_qizhi = TFDirector:getChildByPath(panel_qizhi,"img_qizhi")
                    img_qizhi:setTexture(FactionManager:getGuildBannerBgPath(guildInfo.bannerId))
                    local img_biaozhi = TFDirector:getChildByPath(panel_qizhi,"img_biaozhi")
                    img_biaozhi:setTexture(FactionManager:getGuildBannerIconPath(guildInfo.bannerId))
                end
                if j == 1 then
                    local img_hongdi = TFDirector:getChildByPath(img_baoming,"img_hongdi")
                    local txt_bm = TFDirector:getChildByPath(img_hongdi,"txt_bm")
                    if guildInfo then
                        img_hongdi:setVisible(true)
                        txt_bm:setText(stringUtils.format(localizable.CrossFightBattle_Def_Success,guildInfo.winCount))
                    else
                        img_hongdi:setVisible(false)
                    end
                end
                if j == 2 and isFightNow == false then
                    panel_qizhi:setVisible(false)
                end
            end
            if img_baoming.fightEffect == nil then
                local resPath = "effect/mission_attacking.xml"
                TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
                local effect = TFArmature:create("mission_attacking_anim")

                effect:setAnimationFps(GameConfig.ANIM_FPS)
                effect:setPosition(ccp(170,70));
                img_baoming:addChild(effect,10)
                effect:setScale(0.5)
                effect:playByIndex(0, -1, -1, 1)
                img_baoming.fightEffect = effect
            else
                img_baoming.fightEffect:setVisible(true)
            end
            if isFightNow == false then
                img_baoming.fightEffect:setVisible(false)
            end
        end
    end
    if not CrossGuildBattleManager:isCanApply() then
        self.btn_buzhen:setVisible(false)
    end
    self:freshCountTime()


end

function CrossFightMapLayer.onApplyBtnClick(btn)
    local state = CrossGuildBattleManager:getActivityState()
    if state ~= CrossGuildBattleManager.ActivityState_2 then
        return
    end
    if CrossGuildBattleManager:isCanApply() then
        local layer = require("lua.logic.crossGuildBattle.CrossFightSignUp"):new()
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
        layer:updateMemberInfo()
        AlertManager:show()
    else
        --toastMessage('帮派未晋级')
        toastMessage(localizable.faction_no_levelup)
    end
end
function CrossFightMapLayer.onArmyBtnClick(btn)
   CrossGuildBattleManager:btnArmyClick()
end
function CrossFightMapLayer.onShopBtnClick(btn)
   MallManager:openMallLayerByType(EnumMallType.HonorMall,1)
end

function CrossFightMapLayer.onGuildRankBtnClick(btn)
    CrossGuildBattleManager:gainAllCityInfo()
end

function CrossFightMapLayer.onRewardBtnClick(btn)
   CrossGuildBattleManager:openRewardLayer()
end

function CrossFightMapLayer.onRuleBtnClick(btn)
   CrossGuildBattleManager:openRuleLayer()
end

function CrossFightMapLayer.onMapIconClick(btn)
    local cityId = btn.index
    local state = CrossGuildBattleManager:getActivityState()
    if state == CrossGuildBattleManager.ActivityState_2 then
        CrossGuildBattleManager:gainCityInfo(cityId)
    elseif state == CrossGuildBattleManager.ActivityState_3 then
        CrossGuildBattleManager:gainCityBattleInfos(cityId)
    end
end
function CrossFightMapLayer.onMapIconTouchBegin(btn)
    local self = btn.logic
    local cityId = btn.index
    local index = self.MapIdIndex[cityId]
    for i=1,6 do
        if index == i then
            self.city_click_high[i]:setVisible(true)
        else
            self.city_click_high[i]:setVisible(false)
        end
    end
end
function CrossFightMapLayer.onMapIconTouchMove(btn)
    -- local self = btn.logic
    -- local cityId = btn.index
    -- local index = self.MapIdIndex[cityId]
    -- for i=1,6 do
    --     if index ~= i then
    --         self.city_click_high[i]:setVisible(false)
    --     end
    -- end
end
function CrossFightMapLayer.onMapIconTouchEnd(btn)
    local self = btn.logic
    local cityId = btn.index
    local index = self.MapIdIndex[cityId]
    local pos = btn:getTouchEndPos()
    if btn:hitTest(pos) then
        local state = CrossGuildBattleManager:getActivityState()
        if state == CrossGuildBattleManager.ActivityState_2 then
            CrossGuildBattleManager:gainCityInfo(cityId)
        elseif state == CrossGuildBattleManager.ActivityState_3 then
            CrossGuildBattleManager:gainCityBattleInfos(cityId)
        end
    end
    -- for i=1,6 do
    self.city_click_high[index]:setVisible(false)
    --     if index ~= i then
    --     end
    -- end
end

return CrossFightMapLayer