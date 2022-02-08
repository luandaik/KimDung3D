--[[
******年兽主界面*******
	-- by Catcher
	-- 2018/1/15
]]

local NianShouMainLayer = class("NianShouMainLayer", BaseLayer)

function NianShouMainLayer:ctor(data)
    self.super.ctor(self,data)
    
    self:init("lua.uiconfig_mango_new.nianshou.NianShouMain")
end

function NianShouMainLayer:initUI(ui)
    self.super.initUI(self,ui)
    
    self.img_bg     = TFDirector:getChildByPath(ui, "img_bg")
    self.btn_return = TFDirector:getChildByPath(ui, "btn_fanhui")

    self.img_bg2     = TFDirector:getChildByPath(self.img_bg, "img_bg2")
    self.img_bg2:setTouchEnabled(true)

    self.panel_boss = TFDirector:getChildByPath(self.img_bg, "panel_nianshou")
    self.panel_boss:setVisible(false)
    self.panel_boss:removeFromParent(true)
    self.panel_boss:retain()

    self.bg_time    = TFDirector:getChildByPath(ui, "bg_time")
    self.txt_hd1    = TFDirector:getChildByPath(self.bg_time, "txt_hd1")
    self.txt_num_hd1= TFDirector:getChildByPath(self.txt_hd1, "txt_num_hd1")
    self.txt_hd2    = TFDirector:getChildByPath(self.bg_time, "txt_hd2")
    self.txt_num_hd2= TFDirector:getChildByPath(self.txt_hd2, "txt_num_hd2")
    self.img_tips   = TFDirector:getChildByPath(self.bg_time, "img_tips")

    self.btn_help   = TFDirector:getChildByPath(ui, "btn_help")
    self.img_lhfd   = TFDirector:getChildByPath(ui, "img_lhfd")

    self.panel_you  = TFDirector:getChildByPath(ui, "panel_you")
    self.img_jhy    = TFDirector:getChildByPath(self.panel_you, "img_jhy")
    self.panel_role = {}
    for i = 1, 4 do
        self.panel_role[i]  = TFDirector:getChildByPath(self.panel_you, "role_" .. i)
        self.panel_role[i].role_head    = TFDirector:getChildByPath(self.panel_role[i], "role_head")
        self.panel_role[i].txt_time     = TFDirector:getChildByPath(self.panel_role[i], "txt_time")
        self.panel_role[i]:setVisible(false)
    end

    self.panel_jinri    = TFDirector:getChildByPath(ui, "panel_jinri")
    self.img_di         = TFDirector:getChildByPath(self.panel_jinri, "img_di")
    self.txt_num = {}
    for i = 1 ,3 do
        self.txt_num[i] = TFDirector:getChildByPath(self.img_di, "txt_num" .. i)
    end

    self.img_tishi      = TFDirector:getChildByPath(ui, "img_tishi")
    self.img_tishi:setVisible(false)
    self.txt_juli       = TFDirector:getChildByPath(self.img_tishi, "txt_juli")
    self.txt_time_ns    = TFDirector:getChildByPath(self.txt_juli, "txt_time_ns")

    self.myNianShouData = {}
    self:refreshUI()

    self.BeastRefreshOtherTimes = ConstantData:getValue('MonsterNian.Others.TimeLimitation')
    self.BeastRefreshMineTimes = ConstantData:getValue('MonsterNian.Mine.RefreshTime')
    self.BeastClickCnt = ConstantData:getValue('MonsterNian.Click.Limitation')
end

-- 刷新界面数据
function NianShouMainLayer:refreshUI()
    local BeginTime = NianShouManager:getActivityBeginTime()
    local EndTime = NianShouManager:getActivityEndTime()
    local beginTimeData = GetCorrectDate("*t", BeginTime)
    local endTimeData = GetCorrectDate("*t", EndTime)
    local txt_time = stringUtils.format(localizable.Nainshou_OpenTime, beginTimeData.month,beginTimeData.day,endTimeData.month,endTimeData.day)
    txt_time = txt_time..string.format("%02d:%02d-%02d:%02d",beginTimeData.hour,beginTimeData.min,endTimeData.hour,endTimeData.min)
    
    self.txt_num_hd1:setText(txt_time)
    local nowTimeData = GetCorrectDate("*t", MainPlayer:getNowtime())
    self.upActivityTime = (endTimeData.hour*60 + endTimeData.min)*60 +endTimeData.sec - (nowTimeData.hour*60 + nowTimeData.min)*60 - nowTimeData.sec
    if self.upActivityTime > 0 then
        self:transformTime(self.txt_num_hd2,self.upActivityTime)
    end
end

-- 加载主界面相关数据
function NianShouMainLayer:setInfo(data)
    local upNianshoutime = data.lastRefreshTime or 0
    self.leftRefreshMyTimes = data.leftRefreshMyTimes
    self.leftRefreshOthersTimes = data.leftRefreshOthersTimes
    self.leftRefreshBackTimes = data.leftRefreshBackTimes

    if self.leftRefreshMyTimes >= 0 and upNianshoutime ~= 0 then
        local newTime = MainPlayer:getNowtime()
        self.upNianshoutime = upNianshoutime/1000 - newTime + self.BeastRefreshMineTimes
        if self.upNianshoutime > 0 then
            self.img_tishi:setVisible(true)
            self:transformTime(self.txt_time_ns,self.upNianshoutime)
        end
    end

    self.txt_num[1]:setText(self.leftRefreshMyTimes)
    self.txt_num[2]:setText(self.leftRefreshOthersTimes)
    self.txt_num[3]:setText(self.leftRefreshBackTimes)
    -- 加载可赶年兽数据
    self:setNianshou();
    -- 加载赶走年兽数据
    self:setOtherPlayer()
    -- 加载未捡起的元宝数据
    self:setDropMoneyUI()

    if self.addUpDataTimer then
        TFDirector:removeTimer(self.addUpDataTimer)
	    self.addUpDataTimer = nil
    end

    self.addUpDataTimer = TFDirector:addTimer(1000, -1, nil, 
    function() 
        self:refreshTime()
    end)
end

-- 刷新掉落元宝UI
function NianShouMainLayer:setDropMoneyUI()
    local dropMoneyList = NianShouManager:getdropMoneyList()
    self.dropMoneyList = {}
    if dropMoneyList and next(dropMoneyList) ~= nil then
        local flag = 1
        local posList  = self:getInitPosList(#dropMoneyList,flag)
        for i ,v in pairs(dropMoneyList) do
            local panel = TFPanel:create();
            TFResourceHelper:instance():addArmatureFromJsonFile("effect/main_res_effect.xml")
            local effect = TFArmature:create("main_res_effect_anim")
            if effect == nil then
                return
            end
            effect:setAnimationFps(GameConfig.ANIM_FPS)
            effect:playByIndex(0, -1, -1, 1)
            effect:setAnchorPoint(ccp(0.5, 0.5))
            effect:setPosition(ccp(83,26))
            
            panel:setBackGroundColor(ccc3(0,0,0))
            local contentSize = effect:getContentSize()
            panel:setSize(CCSize(contentSize.width,contentSize.height))
            panel:setTouchEnabled(true)
            panel.index = v.index
            panel:setPosition(ccp(posList[i].x,posList[i].y))
            panel:addChild(effect)
            panel:setAnchorPoint(ccp(0.5, 0.5))
            panel:setTouchEnabled(true)
            panel:addMEListener(TFWIDGET_CLICK,
            audioClickfun(function(sender)
                local self = sender.logic
                self.selectMoneyIndex = panel.index
                NianShouManager:requestMoney(panel.index)
            end))
            panel.logic = self
            self.img_bg:addChild(panel,50)
            self.dropMoneyList[v.index] = panel
        end
    end
end

-- 在年兽界面添加掉落元宝UI
function NianShouMainLayer:addDropMoneyUI(data,removeType)
    self:addBlackPanel()

    local index = self.selectIndex
    local moveToPos = self.myNianShouList[index]:getPosition()
    self.myNianShouList[index].effect:setColor(ccc3(255,255,255))
    self.myNianShouList[index].effect:playByIndex(1, -1, -1, 1)
    self.callBack(index,moveToPos)
    local pos = self.chilckPos
    
    local panel = TFPanel:create();
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/main_res_effect.xml")
    local effect = TFArmature:create("main_res_effect_anim")
    if effect == nil then
        return
    end
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 1)
    effect:setAnchorPoint(ccp(0, 0))
    effect:setPosition(ccp(83,26))

    panel:setBackGroundColor(ccc3(0,0,0))
    local contentSize = effect:getContentSize()
    pos.x = pos.x - 480 - 83 - contentSize.width/2
    pos.y = pos.y - 320 - 26 - contentSize.height/2
    panel:setSize(CCSize(contentSize.width,contentSize.height))
    panel:setTouchEnabled(true)
    panel.index = data.index
    panel:setPosition(ccp(pos.x,pos.y))
    panel:addChild(effect)
    panel:setTouchEnabled(true)
    panel:addMEListener(TFWIDGET_CLICK,
    audioClickfun(function(sender)
        local self = sender.logic
        self.selectMoneyIndex = panel.index
        NianShouManager:requestMoney(panel.index)
    end))
    panel.logic = self
    self.img_bg:addChild(panel,50)
    panel.effect = effect
    self.newAddMoneyUI = panel
    self.dropMoneyList[panel.index] = panel

    self:addDropMoneyAnimation(pos,removeType)
end

-- 添加元宝的掉落动画
function NianShouMainLayer:addDropMoneyAnimation(pos,removeType)
    local flag = 2
    local moveToPos = self:getInitPosList(1,flag)[1]
    moveToPos.x = moveToPos.x - 83 - 20
    moveToPos.y = moveToPos.y -26 -20
    local moveToPos_1 = {}
    local moveToPos_2 = {}
    local moveToPos_3 = {}

    local width,height
    width = math.abs(pos.x - moveToPos.x)
    height = 100 + math.abs(pos.y - moveToPos.y)

    if pos.x > moveToPos.x then
        moveToPos_1.x = pos.x - width/4
        moveToPos_2.x = moveToPos_1.x - width/4
        moveToPos_3.x = moveToPos_2.x - width/4
    else
        moveToPos_1.x = pos.x + width/4
        moveToPos_2.x = moveToPos_1.x + width/4
        moveToPos_3.x = moveToPos_2.x + width/4
    end

    if pos.y > moveToPos.y then
        moveToPos_1.y = pos.y + 75
        moveToPos_2.y = moveToPos_1.y + 25
        moveToPos_3.y = moveToPos_2.y - height/4*3
    else
        moveToPos_1.y = pos.y + height/4*3
        moveToPos_2.y = moveToPos_1.y + height/4
        moveToPos_3.y = moveToPos_2.y - 25
    end


    local acArr = TFVector:create()
    local moveAc = CCMoveTo:create(0.1,ccp(moveToPos_1.x,moveToPos_1.y))
    acArr:addObject(moveAc)
    local moveAc = CCMoveTo:create(0.1,ccp(moveToPos_2.x,moveToPos_2.y))
    acArr:addObject(moveAc)
    local moveAc = CCMoveTo:create(0.1,ccp(moveToPos_3.x,moveToPos_3.y))
    acArr:addObject(moveAc)
    local moveAc = CCMoveTo:create(0.1,ccp(moveToPos.x,moveToPos.y))
    local seq
    if removeType then
        seq = CCSequence:createWithTwoActions(moveAc, CCCallFunc:create(function() self:removeBeastUI(removeType) end))
    else
        seq = CCSequence:createWithTwoActions(moveAc, CCCallFunc:create(function() 
            self:removeBlackPanel()
         end))
    end
    acArr:addObject(seq)
    self.newAddMoneyUI:runAction(CCSequence:create(acArr))
end

-- 在界面移除已捡起的掉落元宝
function NianShouMainLayer:removeDropMoneyUI()
    for i, v in pairs(self.dropMoneyList) do
        if v.index == self.selectMoneyIndex then
            v:setVisible(false)
            v:removeFromParent()
            self.dropMoneyList[i] = nil
        end
    end
end

-- 设置赶走年兽显示
function NianShouMainLayer:setOtherPlayer(flag)
    if flag then
        NianShouManager:refreshWaitBeastData()
    end
    for i = 1 ,4 do
        self.panel_role[i]:setVisible(false)
    end
    self.otherPlayerList = NianShouManager:getwaitBeastList()
    if self.otherPlayerList and next(self.otherPlayerList) ~= nil then
        self.panel_you:setVisible(true)
        for i,v in pairs(self.otherPlayerList) do
            self.panel_role[i]:setVisible(true)
            self.panel_role[i].role_head:setTexture(v.path)
            self.panel_role[i].leftTime = v.leftTime
            self.panel_role[i].logic   = self
            self.panel_role[i]:addMEListener(TFWIDGET_CLICK,
            audioClickfun(function(sender)
                NianShouManager:openNianShouTanChuLayer(2,v.index)
            end))
            self:transformTime(self.panel_role[i].txt_time,self.panel_role[i].leftTime,true)
        end
    else
        self.panel_you:setVisible(false)
    end
end

-- 刷新显示时间
function NianShouMainLayer:refreshTime()
    if self.upActivityTime and  self.upActivityTime > 0 then
        self.upActivityTime = self.upActivityTime - 1
        self:transformTime(self.txt_num_hd2,self.upActivityTime)
    else
        if self.addUpDataTimer then
            TFDirector:removeTimer(self.addUpDataTimer)
            self.addUpDataTimer = nil
        end
        NianShouManager:clossAllLayer()
        return 
    end

    if self.otherPlayerList and next(self.otherPlayerList) ~= nil then
        for i,v in pairs(self.otherPlayerList) do
            if self.panel_role[i]:isVisible() then
                if self.panel_role[i].leftTime > 0 then
                    self.panel_role[i].leftTime = self.panel_role[i].leftTime - 1
                    self:transformTime(self.panel_role[i].txt_time,self.panel_role[i].leftTime,true)
                else
                    self.panel_role[i]:removeMEListener(TFWIDGET_CLICK)
                    self:setOtherPlayer(true)
                end
            end
        end
    end

    if self.img_tishi:isVisible() then
        if  self.upNianshoutime and self.upNianshoutime > 0 then
            self.upNianshoutime = self.upNianshoutime - 1
            self:transformTime(self.txt_time_ns,self.upNianshoutime)
        else
            self.img_tishi:setVisible(false)
            NianShouManager:requestRefreshBeast()
        end
    end

    if self.myNianShouList and next(self.myNianShouList) ~= nil then
        for i,v in pairs(self.myNianShouList) do
             if v.upDataTimeFLag then
                if v.leftTime > 0 then
                    v.leftTime = v.leftTime - 1
                    self:transformTime(v.txt_time,v.leftTime)
                else
                    v.upDataTimeFLag = false
                    local moveType = 2
                    self:removeBeastUI(moveType,i);
                end
            end
        end
    end
end

-- 加载年兽相关数据
function NianShouMainLayer:setNianshou()
    self.myNianShouList = {}
    self.myNianShouData = NianShouManager:getplayBeastList()
    for i,v in pairs(self.myNianShouData) do
        local panel_boss = self.panel_boss:clone()
        local img_role          = TFDirector:getChildByPath(panel_boss, "img_role")
        panel_boss.bg_name           = TFDirector:getChildByPath(panel_boss, "bg_name")
        panel_boss.txt_name          = TFDirector:getChildByPath(panel_boss.bg_name, "txt_name")
        panel_boss.txt_juli          = TFDirector:getChildByPath(panel_boss.bg_name, "txt_juli")
        panel_boss.txt_time          = TFDirector:getChildByPath(panel_boss.txt_juli, "txt_time")
        panel_boss.panel_xueliang    = TFDirector:getChildByPath(panel_boss, "Panel_xueliang")
        panel_boss.img_jindubg       = TFDirector:getChildByPath(panel_boss.panel_xueliang, "img_jindubg")
        panel_boss.bar_jindu         = TFDirector:getChildByPath(panel_boss.panel_xueliang, "bar_jindu")
        panel_boss.txt_jindunumber   = TFDirector:getChildByPath(panel_boss.panel_xueliang, "txt_jindunumber")
        img_role:setVisible(false)

        panel_boss.id = v.id
        panel_boss.count = v.count
        panel_boss.refreshTime = v.refreshTime/1000
        
        panel_boss.upDataTimeFLag = true
        if v.round == 1 then
            panel_boss.bg_name:setVisible(false)
            panel_boss.upDataTimeFLag = false
        else
            local nameTxt 
            if v.round == 2 then
                nameTxt = stringUtils.format(localizable.Nainshou_txt_name_1,v.name)
            elseif v.round == 3 then
                nameTxt = stringUtils.format(localizable.Nainshou_txt_name_2,v.toName)
            end
            panel_boss.txt_name:setText(nameTxt)
            local nowTime = MainPlayer:getNowtime()
            panel_boss.leftTime = panel_boss.refreshTime + self.BeastRefreshOtherTimes - nowTime
            self:transformTime(panel_boss.txt_time,panel_boss.leftTime)
        end
        
        panel_boss.bar_jindu:setPercent((self.BeastClickCnt - v.count)/self.BeastClickCnt * 100)
        panel_boss.txt_jindunumber:setText((self.BeastClickCnt-v.count).."/"..self.BeastClickCnt)

        TFResourceHelper:instance():addArmatureFromJsonFile("effect/NianShou.xml")
        local effect = TFArmature:create("NianShou_anim")
        panel_boss:addChild(effect,100)
        panel_boss.effect = effect
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 1)
        effect:setPosition(ccp(100,50))
        effect:setScale(0.9)

        TFResourceHelper:instance():addArmatureFromJsonFile("effect/Nianshou_Bomb.xml")
        local effect_Bomb = TFArmature:create("Nianshou_Bomb_anim")
        self.img_bg:addChild(effect_Bomb,100000)
        effect_Bomb:setVisible(false)
        effect_Bomb:setAnimationFps(GameConfig.ANIM_FPS)
        panel_boss.effect_Bomb = effect_Bomb

        local shadowImg = TFImage:create("ui_new/fight/shadow.png")
        shadowImg:setZOrder(-1001)
        shadowImg:setScale(2)
        shadowImg:setAnchorPoint(ccp(0.5, 0.5))
        effect.shadowImg = shadowImg
        effect:addChild(shadowImg)

        panel_boss.toPlayer = v.toPlayer
        panel_boss.round = v.round
        panel_boss.speed = 90
        panel_boss.multiple = 1
        panel_boss:setAnchorPoint(ccp(0.5, 0.5))
        panel_boss:setVisible(true)
        panel_boss:setTouchEnabled(true)
        self.myNianShouList[i] = panel_boss
        self.addClickTime = {}
        self.myNianShouList[i]:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function(sender)
            local self = sender.logic

            self.selectIndex = i
            self.chilckPos = sender:getTouchEndPos();
            self:addBlackPanel()
            self:refreshBeastHP()

            -- 炮竹特效
            self.myNianShouList[i].effect_Bomb:setVisible(true)
            self.myNianShouList[i].effect_Bomb:playByIndex(0, -1, -1, 0)
            self.myNianShouList[i].effect_Bomb:setPosition(ccp(self.chilckPos.x,self.chilckPos.y))
            self.myNianShouList[i].effect_Bomb:addMEListener(TFARMATURE_COMPLETE,function()
                if self.myNianShouList and self.myNianShouList[i] then
                    self.myNianShouList[i].effect_Bomb:setVisible(false)
                    self.myNianShouList[i].effect_Bomb:removeMEListener(TFARMATURE_COMPLETE)
                end
            end)
            TFAudio.playEffect("sound/effect/firecracker.mp3", false)
            
            self.myNianShouList[i].effect:playByIndex(2, -1, -1, 1)
            self.myNianShouList[i].effect:setColor(ccc3(255,0,0))
            self.myNianShouList[i]:stopAllActions()
            TFDirector:killAllTween(self.myNianShouList[i])
            TFAudio.playEffect("sound/effect/beastHit.mp3", false)

            self.myNianShouList[i].multiple = self.myNianShouList[i].multiple +  1
            if self.myNianShouList[i].multiple > 4 then
                self.myNianShouList[i].multiple = 4
            end
            if self.addClickTime[i] then
                TFDirector:removeTimer(self.addClickTime[i]);
                self.addClickTime[i] = nil;
            end
            self.addClickTime[i] = TFDirector:addTimer(1500, -1, nil, 
            function() 
                if self.myNianShouList and self.myNianShouList[i] then
                    self.myNianShouList[i].multiple = self.myNianShouList[i].multiple - 1
                    if self.myNianShouList[i].multiple <= 1 then
                        TFDirector:removeTimer(self.addClickTime[i]);
                        self.addClickTime[i] = nil;
                        self.myNianShouList[i].multiple = 1
                        self.myNianShouList[i].effect:playByIndex(0, -1, -1, 1)
                    end
                    local moveToPos = self.myNianShouList[i]:getPosition()
                    self.callBack(i,moveToPos)
                end
            end)
            
            if self.addClick then
                TFDirector:removeTimer(self.addClick);
                self.addClick = nil;
            end
            self.addClick = TFDirector:addTimer(400, 1, nil, 
            function()
                if self.addClick then
                    TFDirector:removeTimer(self.addClick);
                    self.addClick = nil;
                end
                self:removeBlackPanel()
                NianShouManager:requestDaNianShou(self.myNianShouList[i].id);
            end)
        end))
        self.myNianShouList[i].logic   = self
        self.img_bg:addChild(panel_boss,1000)
    end
    self:setNianshouMove()
end

-- 刷新年兽血量
function NianShouMainLayer:refreshBeastHP()
    local index = self.selectIndex
    local panel = self.myNianShouList[index]
    if panel then
        panel.count = panel.count + 1
        panel.bar_jindu:setPercent((self.BeastClickCnt - panel.count)/self.BeastClickCnt * 100)
        panel.txt_jindunumber:setText((self.BeastClickCnt-panel.count).."/"..self.BeastClickCnt)
    end
end

-- 移除年兽
function NianShouMainLayer:removeBeastUI(moveType,index)
    local index = index or self.selectIndex
    local moveType = moveType or 1
    if self.myNianShouList and self.myNianShouList[index] then
        self:addBlackPanel()
        self.myNianShouList[index]:removeMEListener(TFWIDGET_CLICK)
        self.myNianShouList[index].effect:removeMEListener(TFARMATURE_UPDATE)
        self.myNianShouList[index].effect:setColor(ccc3(255,255,255))
        self.myNianShouList[index]:stopAllActions()
        TFDirector:killAllTween(self.myNianShouList[index])
        
        if self.addClickTime or self.addClickTime[index] then
            TFDirector:removeTimer(self.addClickTime[index]);
            self.addClickTime[index] = nil;
        end
        self.myNianShouList[index].bg_name:setVisible(false)
        self.myNianShouList[index].panel_xueliang:setVisible(false)
        self.myNianShouList[index].effect:playByIndex(3, -1, -1, 0)
        self.myNianShouList[index].effect:addMEListener(TFARMATURE_COMPLETE,function()
            self.myNianShouList[index].effect:removeMEListener(TFARMATURE_COMPLETE)
            self.myNianShouList[index]:setVisible(false)
            if self.myNianShouList[index] then
                self.myNianShouList[index]:removeFromParent()
                self.myNianShouList[index] = nil
            end
            self:removeBlackPanel(true)
            if moveType == 1 then
                local flag = NianShouManager.BeastStage_1
                NianShouManager:openNianShouTanChuLayer(flag)  
            elseif moveType == 3 then
                local flag = NianShouManager.BeastStage_3
                NianShouManager:openNianShouTanChuLayer(flag)
            end
        end)
    end
end

--注册事件
function NianShouMainLayer:registerEvents()
    self.super.registerEvents(self);

    TFAudio.stopMusic()
    TFAudio.playMusic("sound/bgmusic/BeastBGM.mp3", true)

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/BeastSnow.xml")
    local effect = TFArmature:create("BeastSnow_anim")
    self.img_bg:addChild(effect,125600)
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 1)
    effect:setAnchorPoint(ccp(0.5, 0.5))
    effect:setPosition(GameConfig.WS.width/2,0)

    self.btn_return:addMEListener(TFWIDGET_CLICK, audioClickfun(self.returnButtonClick,play_fanhui),1)
	self.btn_return.logic   = self
    self.btn_return:setClickAreaLength(100)
    
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClickHandle))
    self.btn_help.logic   = self

    self.img_bg2:addMEListener(TFWIDGET_CLICK, audioClickfun(self.BombClickHandle))
    self.img_bg2.logic   = self

    self.AddMoneyCallBack = function(event) 
        self:addDropMoneyUI(event.data[1]);
    end
    TFDirector:addMEGlobalListener(NianShouManager.AddMoneyData,self.AddMoneyCallBack)

    self.removeMoneyCallBack = function()
        self:removeDropMoneyUI();
    end
    TFDirector:addMEGlobalListener(NianShouManager.RemoveMoneyData,self.removeMoneyCallBack)

    self.removeBeastCallBack = function(event)
        local data = event.data[1]
        local dropMoney = data.dropMoney
        local moneyData;
        for i,v in pairs(dropMoney) do
            local flag = false
            for m,n in pairs(self.dropMoneyList) do
                if v.index == n.index then
                    flag = true
                    break;
                end
            end
            if not flag then
                moneyData = v
                break;
            end
        end
        if moneyData then
            self:addDropMoneyUI(moneyData,data.remveType)
        else
            self:removeBeastUI(data.remveType)
        end
    end
    TFDirector:addMEGlobalListener(NianShouManager.RemovBeastData,self.removeBeastCallBack)

    self.refreshBeastCallBack = function(event)
        self:removeBeastData()
        self:refreshUI()
        self:setInfo(event.data[1]);
    end
    TFDirector:addMEGlobalListener(NianShouManager.refreshBeastListData,self.refreshBeastCallBack)
end

--注销事件
function NianShouMainLayer:removeEvents()
    self.super.removeEvents(self)

    TFAudio.stopMusic()
    TFAudio.playMusic("sound/bgmusic/home.mp3", true)

    self.btn_return:removeMEListener(TFWIDGET_CLICK)
    self.btn_help:removeMEListener(TFWIDGET_CLICK)
    self.img_bg2:removeMEListener(TFWIDGET_CLICK)

    TFDirector:removeMEGlobalListener(NianShouManager.AddMoneyData,self.AddMoneyCallBack)
    self.AddMoneyCallBack = nil

    TFDirector:removeMEGlobalListener(NianShouManager.RemoveMoneyData,self.removeMoneyCallBack)
    self.removeMoneyCallBack = nil

    TFDirector:removeMEGlobalListener(NianShouManager.RemovBeastData,self.removeBeastCallBack)
    self.removeBeastCallBack = nil

    TFDirector:removeMEGlobalListener(NianShouManager.refreshBeastListData,self.refreshBeastCallBack)
    self.refreshBeastCallBack = nil

    self:removeBeastData()
end

-- 移除年兽界面所有的监控
function NianShouMainLayer:removeBeastData()
    if self.myNianShouList and next(self.myNianShouList) ~= nil then
        for i ,v in pairs(self.myNianShouList) do
            v.effect:removeMEListener(TFARMATURE_UPDATE)
            v:removeMEListener(TFWIDGET_CLICK)
            v:removeFromParent()
        end
        self:removeBlackPanel(true)
        self.myNianShouList = nil
    end

    if self.dropMoneyList and next(self.dropMoneyList) ~= nil then
        for i, v in pairs(self.dropMoneyList) do
            v:removeMEListener(TFWIDGET_CLICK)
            v:removeFromParent()
        end
        self.dropMoneyList = nil
    end

    if self.otherPlayerList and next(self.otherPlayerList) ~= nil then
        for i,v in pairs(self.otherPlayerList) do
            self.panel_role[i]:removeMEListener(TFWIDGET_CLICK)
        end
    end

    if self.addUpDataTimer then
        TFDirector:removeTimer(self.addUpDataTimer)
        self.addUpDataTimer = nil
    end

    if self.addClick then
        TFDirector:removeTimer(self.addClick);
        self.addClick = nil;
    end

    if self.addClickTime and next(self.addClickTime) ~= nil then
        for v in pairs(self.addClickTime) do
            TFDirector:removeTimer(v);
            v = nil;
        end
    end
end

--注销界面
function NianShouMainLayer:removeUI()
    self.super.removeUI(self)

    if self.panel_boss then
        self.panel_boss:release()
        self.panel_boss = nil
    end
end

-- 返回主界面按钮事件
function NianShouMainLayer.returnButtonClick(sender)
    local self = sender.logic
    AlertManager:close(AlertManager.TWEEN_1);
end

-- 在主界面添加触碰播放鞭炮特效事件
function NianShouMainLayer.BombClickHandle(sender)
    local self = sender.logic
    local pos = sender:getTouchEndPos();
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/Nianshou_Bomb.xml")
    local effect_Bomb = TFArmature:create("Nianshou_Bomb_anim")
    self.img_bg:addChild(effect_Bomb,100000)
    effect_Bomb:setAnimationFps(GameConfig.ANIM_FPS)
    effect_Bomb:playByIndex(0, -1, -1, 0)
    effect_Bomb:setPosition(ccp(pos.x,pos.y))
    effect_Bomb:addMEListener(TFARMATURE_COMPLETE,function()
        if self.effect_Bomb then
            self.effect_Bomb:removeMEListener(TFARMATURE_COMPLETE) 
            self.effect_Bomb:removeFromParent()
            self.effect_Bomb = nil
        end
    end)
    if self.effect_Bomb then
        self.effect_Bomb:removeMEListener(TFARMATURE_COMPLETE) 
        self.effect_Bomb:removeFromParent()
        self.effect_Bomb = nil
    end
    self.effect_Bomb = effect_Bomb
    TFAudio.playEffect("sound/effect/firecracker.mp3", false)
end

-- 时间转化（将秒转化为时、分、秒显示）
function NianShouMainLayer:transformTime(Node,LeftTime,flag)
    local hour,min,sec
    hour = math.floor(LeftTime/3600)
    min = math.floor((LeftTime - hour * 3600)/60)
    sec = math.fmod(LeftTime, 60)
    if LeftTime <= 0 then
        hour,min,sec = 0,0,0
    end
    if flag then
        Node:setText(string.format("%02d:%02d",min,sec))
    else
        Node:setText(string.format("%02d:%02d:%02d",hour,min,sec))
    end
end

-- 年兽规则
function NianShouMainLayer.onHelpClickHandle(sender)
    local self = sender.logic
    CommonManager:showRuleLyaer('monsterhunter')
end

-- 初始化年兽位置和运动方向
function NianShouMainLayer:setNianshouMove()
    local posList  = self:getInitPosList(#self.myNianShouList)

    self.callBack =  function(index,pos)
        local nianShou = self.myNianShouList[index]
        nianShou:stopAllActions()
        -- TFDirector:killAllTween(nianShou)

        local moveToPos,sec,flag = self:getBeastMoveToPos(index,pos)
        if flag then
            nianShou.effect:setRotationY(180)
        else
            nianShou.effect:setRotationY(0)
        end
        nianShou.dirFlag = flag
        local moveTo = CCMoveTo:create(sec,ccp(moveToPos.x,moveToPos.y))
        local seq = CCSequence:createWithTwoActions(moveTo, CCCallFunc:create(function() self.callBack(index,moveToPos) end))
        nianShou:runAction(seq)
    end

    for i, v in pairs(self.myNianShouList) do
        -- posList[i].x = 0--400
        -- posList[i].y = 0--200
        self.myNianShouList[i]:setPosition(ccp(posList[i].x,posList[i].y)) 
        local moveToPos,sec,flag = self:getBeastMoveToPos(i,posList[i])

        if flag then
            v.effect:setRotationY(180)
        else
            v.effect:setRotationY(0)
        end
        self.myNianShouList[i].dirFlag = flag
        local moveTo = CCMoveTo:create(sec,ccp(moveToPos.x,moveToPos.y))
        local seq = CCSequence:createWithTwoActions(moveTo, CCCallFunc:create(function() self.callBack(i,moveToPos) end))
        v:runAction(seq)
        v.effect:addMEListener(TFARMATURE_UPDATE,function()
            local pos = v:getPosition()
            local num = 10000 - math.floor(pos.y)  
            v:setZOrder(num)
        end)
    end
end

-- 获得年兽的运动位置,运动时间，运动方向
function NianShouMainLayer:getBeastMoveToPos(index,pos)
    local pos = pos or self:getInitPosList()[1];
    local moveToPos= {};
    local secX,secY

    local Beast = self.myNianShouList[index]
    if Beast.multiple > 1 then
        if self.PlaySound then
            self.PlaySound = false
            TFAudio.playEffect("sound/effect/beastRun.mp3", false)
        end
    elseif Beast.multiple == 1 then
        self.PlaySound = true
    end
    
    local speed = Beast.speed * Beast.multiple
    local moveToPos = self:getInitPosList()[1];
    local moveSec = math.pow(math.pow(moveToPos.x - pos.x,2) + math.pow(moveToPos.y - pos.y,2),0.5)/speed
    local sideFlag;
    if moveToPos.x > pos.x then
        sideFlag = true
    else
        sideFlag = false
    end
    return moveToPos,moveSec,sideFlag
end

-- 获得年兽或者元宝初始化位置
function NianShouMainLayer:getInitPosList(num,flag,posX)
    local posList = {}
    local num = num or 1
    local flag = flag or 0
    local posX = posX or 0
    -- 年兽在屏幕可移动区域大小    
    local mapHeight = 300
    local mapWidth = 880
    local nagemapHeight = -200
    local nagemapWidth = -400
    if flag == 1 then
        -- 元宝在屏幕好捡起的区域
        mapHeight = 200
        mapWidth = 400
        nagemapHeight = -150
        nagemapWidth = -200 
    elseif flag == 2 then 
        local mapHeight = 200
        local mapWidth = 880
        local nagemapHeight = -250
        local nagemapWidth = -400
    end
    for i = 1, num do 
        posList[i] = {}
        local x,y
        if flag == 2 then
            mapWidth = mapWidth - 100
            x = math.ceil(math.random() * mapWidth) + nagemapWidth;
            if math.abs(x - posX) < 100 then
                if x > posX then
                    x = x + 100   
                else
                    x = x - 100
                end
            end
            if x > 480 then
                x = 480
            elseif x < -400 then
                x = -400
            end 
        else
            x = math.ceil(math.random() * mapWidth) + nagemapWidth;
        end
        y = math.ceil(math.random() * mapHeight) + nagemapHeight;
        posList[i].x = x;
        posList[i].y = y;
    end
    return posList
end

-- 添加屏幕不可触碰panel
function NianShouMainLayer:addBlackPanel()
    if not self.blackPanel then
        local blackPanel = TFPanel:create();
        blackPanel:setSize(GameConfig.WS);
        blackPanel:setTouchEnabled(true);
        blackPanel:setBackGroundColor(ccc3(0,0,0))
        blackPanel:setZOrder(100000)
        TFDirector:currentScene():addChild(blackPanel)
        blackPanel.UseCnt = 1;
        self.blackPanel = blackPanel;
    else
        self.blackPanel.UseCnt = self.blackPanel.UseCnt + 1
    end
end

-- 移除屏幕不可触碰panel
function NianShouMainLayer:removeBlackPanel(flag)
    if self.blackPanel then
        if  flag or self.blackPanel.UseCnt <= 1 then
            self.blackPanel:removeFromParent()
            self.blackPanel = nil
        else
            self.blackPanel.UseCnt = self.blackPanel.UseCnt - 1
        end
    end
end

return NianShouMainLayer