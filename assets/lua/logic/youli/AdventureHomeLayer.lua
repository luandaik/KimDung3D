--[[
******奇遇玩法主界面*******

	-- by quanhuan
	-- 2016/3/14
	
]]

local AdventureHomeLayer = class("AdventureHomeLayer",BaseLayer)
local HeadMoveSpeed = 577
local RandomEventNum = 3

function AdventureHomeLayer:ctor(data)

    self.flickData = nil
    self.nTreasureState = 0 -- 挖宝状态   0:正常状态    1:挖宝状态   2:埋宝状态

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.youli.homeLayer")
end

function AdventureHomeLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.panel_map      = TFDirector:getChildByPath(ui, "panel_map")
    self.panel_touch    = TFDirector:getChildByPath(ui, "homeMap")
    self.panel_home1 = TFDirector:getChildByPath(ui, "panel_home1")
    self.panel_home2 = TFDirector:getChildByPath(ui, "panel_home2")
    self.panel_touch:setVisible(true)
    self.panel_touch:setTouchEnabled(true)

    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.youli,{HeadResType.BAOZI,HeadResType.YUELI,HeadResType.SYCEE}, true) 
    self.generalHead:setVisible(true)

    local bgSize = self.panel_touch:getContentSize()
    local uiSize = self.ui:getContentSize()
    local bgPos = self.panel_touch:getPosition()
    self.panelLimitSize = {}
    self.panelLimitSize.minX = uiSize.width/2 - bgSize.width/2
    self.panelLimitSize.maxX = bgSize.width/2 - uiSize.width/2
    self.panelLimitSize.minY = uiSize.height/2 - bgSize.height/2 - (self.generalHead:getContentSize().height - 10)
    self.panelLimitSize.maxY = bgSize.height/2 - uiSize.height/2
    self.panelLimitSize.middleX = uiSize.width/2
    self.panelLimitSize.middleY = uiSize.height/2

    local btnRandomCell = TFDirector:getChildByPath(ui, "btn_random")
    btnRandomCell:setVisible(false)
    -- btnRandomCell:setScale(0.5)
    btnRandomParent = btnRandomCell:getParent()
    self.randomEventIcon = {}
    for i=1,RandomEventNum do
        self.randomEventIcon[i] = btnRandomCell:clone()
        btnRandomParent:addChild(self.randomEventIcon[i])
        -- TFResourceHelper:instance():addArmatureFromJsonFile("effect/taskFlg.xml")
        -- local effect = TFArmature:create("taskFlg_anim")        
        -- self.randomEventIcon[i]:addChild(effect) 
        -- effect:setVisible(true)
        -- effect:playByIndex(0, -1, -1, -1)
        -- self.randomEventIcon[i].effectNode = effect
    end    

    self.mainEventIcon = TFDirector:getChildByPath(ui, "btn_zhuxian")
    self.mainEventIcon:setVisible(false)
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/taskFlg.xml")
    local effect = TFArmature:create("taskFlg_anim")        
    self.mainEventIcon:addChild(effect) 
    effect:setVisible(true)
    effect:playByIndex(1, -1, -1, -1)

    self.otherPlayerOn = TFDirector:getChildByPath(ui, "panel_otherplayer")
    self.otherPlayerOff = TFDirector:getChildByPath(ui, "panel_wenhao")

    self.headModel = TFDirector:getChildByPath(ui, "btn_otherHead")
    self.headModel:setVisible(false)


    self.btn_myHead = TFDirector:getChildByPath(ui, "btn_myHead")
    self.btn_myHead:setVisible(true)
    self.btn_myHead:setTouchEnabled(false)
    self.btn_myHead:setZOrder(5)
    self:refreshMyInfo()

    -- self.imgRandomGuide = TFDirector:getChildByPath(ui,"imgRandomGuide")
    -- self.imgRandomGuide:setTouchEnabled(true)
    local imgRandomGuideCell = TFDirector:getChildByPath(ui,"imgRandomGuide")
    imgRandomGuideCell:setVisible(false)
    imgRandomGuideCell:setTouchEnabled(true)
    imgRandomGuideParent = imgRandomGuideCell:getParent()
    self.imgRandomGuide = {}
    for i=1,RandomEventNum do
        self.imgRandomGuide[i] = imgRandomGuideCell:clone()
        imgRandomGuideParent:addChild(self.imgRandomGuide[i])
    end
    self.imgMainGuide = TFDirector:getChildByPath(ui,"imgMainGuide")
    self.imgMainGuide:setTouchEnabled(true)

    self.btn_shop = TFDirector:getChildByPath(ui, "btn_shop")
    self.btn_shanu = TFDirector:getChildByPath(ui, "btn_shanu")    
    self.btn_chapter = TFDirector:getChildByPath(ui, "btn_chapter")    
    self.btn_buzheng = TFDirector:getChildByPath(ui, "btn_buzheng")
    self.btn_chouren = TFDirector:getChildByPath(ui, "btn_chouren")  
    
    self.btn_goods = TFDirector:getChildByPath(ui, "btn_goods")  
    if AdventureManager.OtherPlayerSwitch == false then
        self.btn_shanu:setVisible(false)
        self.btn_chouren:setVisible(false)
        self.btn_buzheng:setPosition(self.btn_shanu:getPosition())
    end

    self.btn_homeDig  = TFDirector:getChildByPath(ui, "btn_wb")
    self.btn_homeDig:setVisible(false)
    self.btn_homeBury = TFDirector:getChildByPath(ui, "btn_mb")
    self.btn_homeBury:setVisible(false)

    --设置家的位置
    local uiContentSize = self.ui:getContentSize()
    local homeXY = {}
    homeXY.x = -localizable.youli_home_xy.x
    homeXY.y = -localizable.youli_home_xy.y
    self.panel_touch:setPosition(homeXY)
    self.btn_myHead:setPosition(localizable.youli_home_xy)


    self.oldScale = self.btn_myHead:getScale()

    -- 挖宝
    self.buryOrDigVisible = MainPlayer:getServerSwitchStatue(ServerSwitchType.advebtureDigTreasure)
    if self.buryOrDigVisible then
        local currTime = MainPlayer:getNowtime()
        if CommonManager:checkRedPointByKey("homedigBtnRedPoint",currTime) then
            local redPointState = AdventureTreasureManager:GetDigRedPoint()
            print("--------------redPointState1111111-----------------------",redPointState)
		    CommonManager:setRedPointStateByKey( "homedigBtnRedPoint", redPointState )
		    CommonManager:setRedPoint(self.btn_homeDig, redPointState,"homedigBtnRedPoint",ccp(0,0))
	    end
        if CommonManager:checkRedPointByKey("homeburyBtnRedPoint",currTime) then
            local redPointState = AdventureTreasureManager:GetBuryRedPoint()
            print("--------------redPointState2222222-----------------------",redPointState)
		    CommonManager:setRedPointStateByKey( "homeburyBtnRedPoint", redPointState )
		    CommonManager:setRedPoint(self.btn_homeBury, redPointState,"homeburyBtnRedPoint",ccp(0,0))
	    end

        self.btn_homeDig:setVisible(true)
        self.btn_homeBury:setVisible(true)
        self:initTreasureUI()
    end
end

-- 初始化宝藏相关页面
function AdventureHomeLayer:initTreasureUI(  )
    self.digLayer = createUIByLuaNew("lua.uiconfig_mango_new.youli.WaBaoLayer")
    self.buryLayer = createUIByLuaNew("lua.uiconfig_mango_new.youli.MaiBaoLayer")
    self.digLayer:setVisible(false)
    self.buryLayer:setVisible(false)
    self.ui:addChild(self.digLayer)
    self.ui:addChild(self.buryLayer)
    self.digBoxNumber = 1000;
    self.myDigCnt = 9999;
    self.myBoxList = {};
    self.checkFlag = 0;

    -- 埋宝界面挖宝按钮
    self.btn_dig = TFDirector:getChildByPath(self.buryLayer, "btn_wb")
    self.btn_buryRule = TFDirector:getChildByPath(self.buryLayer, "btn_guize")
    self.btn_buryRecord = TFDirector:getChildByPath(self.buryLayer, "btn_mbls")
    self.bury_panel_wz = TFDirector:getChildByPath(self.buryLayer, "panel_wz")
    self.bury_panel_wz:setVisible(false)
    self.bury_img_wz1 = TFDirector:getChildByPath(self.bury_panel_wz, "img_wz1")
    self.bury_img_wz1:setVisible(false)
    self.bury_img_wz2 = TFDirector:getChildByPath(self.bury_panel_wz, "img_wz2")
    self.bury_img_wz2:setVisible(false)

    self.panel_wdbx = TFDirector:getChildByPath(self.buryLayer, "panel_wdbx")
    local location = self.panel_wdbx:getPosition()
    self.panel_wdbx:setPosition(ccp(location.x,location.y))
    self.btn_wdbx = TFDirector:getChildByPath(self.buryLayer, "btn_wdbx")
    self.btn_wdbx.logic = self
    self.img_attr_di = TFDirector:getChildByPath(self.panel_wdbx, "img_bg")
    self.origin_pos_x = self.img_attr_di:getPositionX()

    self.bury_panel_box = TFDirector:getChildByPath(self.buryLayer, "panel_box")
    self.bury_panel_box:setVisible(false)
    self.bury_img_box = TFDirector:getChildByPath(self.bury_panel_box, "img_box")

    self.bury_CheckBox = TFDirector:getChildByPath(self.buryLayer, "CheckBox_gouxuan")

    self.img_boxList = {};
    for i = 1, 4 do
        self.img_boxList[i] = TFDirector:getChildByPath(self.panel_wdbx, "img_box"..i);
        self.img_boxList[i]:setVisible(false)
    end

    -- 挖宝界面埋宝按钮
    self.btn_bury = TFDirector:getChildByPath(self.digLayer, "btn_mb")
    self.btn_digRule = TFDirector:getChildByPath(self.digLayer, "btn_guize")
    self.btn_digRecord = TFDirector:getChildByPath(self.digLayer, "btn_wbls")

    self.txt_digBox = TFDirector:getChildByPath(self.digLayer, "txt_dq")
    self.txt_digBoxNumber = TFDirector:getChildByPath(self.txt_digBox, "txt_num")
    self.txt_digBoxNumber:setText(self.digBoxNumber);
    self.txt_myDig = TFDirector:getChildByPath(self.digLayer, "txt_cishu")
    self.txt_myDigCnt = TFDirector:getChildByPath(self.txt_myDig, "txt_num")
    self.txt_myDigCnt:setText(self.myDigCnt)

    self.img_tips = TFDirector:getChildByPath(self.digLayer, "img_tips")
    self.img_tips:setVisible(false);
    self.img_tudui = TFDirector:getChildByPath(self.digLayer, "img_tudui")
    self.img_tudui:setVisible(false);
    self.dig_panel_box = TFDirector:getChildByPath(self.digLayer, "panel_box")
    self.dig_panel_box:setVisible(false)
    self.dig_panel_wz = TFDirector:getChildByPath(self.digLayer, "panel_wz")
    self.dig_panel_wz:setVisible(false)
    self.dig_img_wz1 = TFDirector:getChildByPath(self.dig_panel_wz, "img_wz1")
    self.dig_img_wz1:setVisible(false)
    self.dig_img_wz2 = TFDirector:getChildByPath(self.dig_panel_wz, "img_wz2")
    self.dig_img_wz2:setVisible(false)
end

function AdventureHomeLayer:removeUI()
	self.super.removeUI(self)
end

function AdventureHomeLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
    self:refreshOtherPlayerInfo()    
end

function AdventureHomeLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
    self.isFirstIn = true
	self.super.registerEvents(self)
    TFAudio.stopMusic()
    TFAudio.playMusic("sound/bgmusic/youli_bgm.mp3", true)    
    if self.generalHead then
        self.generalHead:registerEvents()
    end

    --监听玩家信息刷新事件
    self.refreshHomeLayerCallBack = function (event)
        self:refreshOtherPlayerInfo()
        self:refreshRandomEvent()
    end
    TFDirector:addMEGlobalListener(AdventureManager.refreshHomeLayer, self.refreshHomeLayerCallBack)
    
    self.changeLayerCompleteCallBack = function (event)
        if self.isFirstIn then
            self:stopScreenMoveAuto()
            self.ScreenRandomShow = {}
            self.ScreenRandomShow.index = 0
            self:startScreenMoveAuto()
            self.isFirstIn = false
        end
    end
    TFDirector:addMEGlobalListener(AdventureManager.changeLayerComplete, self.changeLayerCompleteCallBack)

    self.fightEndMessageCallBack = function (event)
        AdventureManager:requestHomeLayerData()
    end
    TFDirector:addMEGlobalListener(AdventureManager.fightEndMessage, self.fightEndMessageCallBack)

    self.updateMissionCallBack = function ( event )
        self:refreshMainEvent()
        self:onAttackCompeleteHandle(event);
    end
    TFDirector:addMEGlobalListener(MissionManager.EVENT_UPDATE_MISSION, self.updateMissionCallBack)

    --监听玩家信息刷新事件
    self.otherPlayerCallBack = function (event)
        self:refreshOtherPlayerInfo()        
    end
    TFDirector:addMEGlobalListener(AdventureManager.refreshOtherPlayerInfo, self.otherPlayerCallBack)

    --监听随机事件
    self.refreshRandomEventCallBack = function (event)
        self:refreshRandomEvent()
    end
    TFDirector:addMEGlobalListener(AdventureManager.refreshRandomEvent, self.refreshRandomEventCallBack)

    --监听大地图对话完成
    self.talkEndMessageCallBack = function (event)
        if self.isMainEventMessage then
            local currMission = AdventureMissionManager:getCurrMission()
            if currMission then
                self:showMainEventDetailsByMissionId(currMission.id)
            end
        else
            local eventId = self.currentRandomEventId
            local mission = AdventureRandomEventData:getInfoById(eventId)
            if mission then
                if mission:checkIsTalk() then
                    --send message for talk end
                    AdventureManager:requestEventComplete(eventId)
                else
                    self:showRandomEventDetailsByMissionId(eventId)
                end
            else
                print('cannot find the event by id = ',eventId)
            end
        end        
    end
    TFDirector:addMEGlobalListener(AdventureManager.talkEndMessage, self.talkEndMessageCallBack)

    --滑动事件监听，切换装备
    function onTouchBegin(widget,pos,offset)
        self:stopScreenMoveAuto()
        self.touchBeginPos = pos
        self.flickData = nil
        self.isTouchMove = true
        print("onTouchBegin = ",pos)
    end

    function onTouchMove(widget,pos,offset)
    	if self.nTreasureState == 1 then -- 挖宝时不可拖动地图
    		return
    	end
        self:stopScreenMoveAuto()
        self.isTouchMove = true

        local Dx = pos.x - self.touchBeginPos.x
        local Dy = pos.y - self.touchBeginPos.y

        if self.flickData == nil then
            self.flickData = {}
            self.flickData.pos = pos
            self.flickData.time = os.clock()*1000
            if self.flickTimer then
                TFDirector:removeTimer(self.flickTimer)
                self.flickTimer = nil
            end            
        end

        self:moveMapPosition(self.panel_touch:getPositionX() + Dx, self.panel_touch:getPositionY() + Dy)
        self.touchBeginPos = pos
    end

    function onTouchEnd(widget,pos)
        
        local state = 1--1.click 2.flick 3.dragMove

        if self.flickData then
            local dTime = os.clock()*1000 - self.flickData.time
            local dx = pos.x - self.flickData.pos.x
            local dy = pos.y - self.flickData.pos.y
            -- toastMessage('dTime = '..dTime)

            local checkTime = 300
            if CC_TARGET_PLATFORM == CC_PLATFORM_IOS then
                checkTime = 90
            end

            if math.abs(dx) > 15 or math.abs(dy) > 15 then
                if dTime < checkTime then
                    state = 2
                else
                    state = 3
                end
            end
        end

        if state == 1 then
            --click
            self.isTouchMove = false

            if self.nTreasureState == 2 then
            	-- 埋宝
            	-- self:onBuryTreasureMapClick( pos )
            else
	            self:touchAndMoveHeadIcon(pos)
	        end
        elseif state == 2 then
            --flick
            local dTime = os.clock()*1000 - self.flickData.time
            local dx = pos.x - self.flickData.pos.x
            local dy = pos.y - self.flickData.pos.y
            local k,speedx,speedy            
            if dx == 0 then
                speedy = dy
            elseif dy == 0 then
                speedx = dx
            else
                k = dy/dx
                if math.abs(dy) > math.abs(dx) then
                    speedy = dy
                else
                    speedx = dx
                end
            end
            if speedx then
                speedx = speedx*99/dTime
            end
            if speedy then
                speedy = speedy*99/dTime
            end
            self.flickData = nil
            self:flickMove(speedx, speedy, k) 
        end        
        self.flickData = nil
    end    

    self.panel_touch:addMEListener(TFWIDGET_TOUCHBEGAN, onTouchBegin)
    self.panel_touch:addMEListener(TFWIDGET_TOUCHMOVED, onTouchMove)
    self.panel_touch:addMEListener(TFWIDGET_TOUCHENDED, onTouchEnd)
    self.panel_touch:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickInBgMap),1)
    self.panel_touch.logic = self

    for i=1,RandomEventNum do
        self.randomEventIcon[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickRandomEvent))
        self.randomEventIcon[i].logic = self
        self.randomEventIcon[i].index = i
        self.imgRandomGuide[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickRandomEvent))
        self.imgRandomGuide[i].logic = self
        self.imgRandomGuide[i].index = i
    end

    self.mainEventIcon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickMainEvent))
    self.mainEventIcon.logic = self
    self.imgMainGuide:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickMainEvent))
    self.imgMainGuide.logic = self

    self.btn_shop:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShopClick))
    self.btn_shop.logic = self

    self.btn_shanu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShaLuBtnClick))
    self.btn_shanu.logic = self

    self.btn_chapter:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnChapterClick))
    self.btn_chapter.logic = self

    self.btn_buzheng:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onArmyBtnClick))
    self.btn_buzheng.logic = self

    self.btn_chouren:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onChouRenBtnClick))
    self.btn_chouren.logic = self

    self.btn_goods:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGoodsBtnClick))
    self.btn_goods.logic = self

    if self.buryOrDigVisible then
        self.btn_homeDig.logic = self
        self.btn_homeDig:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onDigBtnClick))
        self.btn_homeBury.logic = self
        self.btn_homeBury:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onBuryBtnClick))

        self.btn_dig.logic = self
        self.btn_dig:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onDigBtnClick))
        self.btn_bury.logic = self
        self.btn_bury:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onBuryBtnClick))

        self.btn_digRule.logic = self
        self.btn_digRule:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onDigHelpClickHandle))
        self.btn_buryRule.logic = self
        self.btn_buryRule:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onBuryHelpClickHandle))

        self.btn_digRecord.logic = self
        self.btn_digRecord:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onDigRecordClickHandle))
        self.btn_buryRecord.logic = self
        self.btn_buryRecord:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onBuryRecordClickHandle))

        self.btn_wdbx.logic = self
        self.btn_wdbx:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onAttrAddClickHandle))

        self.bury_CheckBox.logic = self
        self.bury_CheckBox:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onAnonymousClickHandle))
    end
    self.registerEventCallFlag = true 
end

-- 重置头像视角到初始位置
function AdventureHomeLayer:resetHomePosition(  )
    --设置家的位置
    local uiContentSize = self.ui:getContentSize()
    local homeXY = {}
    homeXY.x = -localizable.youli_home_xy.x
    homeXY.y = -localizable.youli_home_xy.y
    self.panel_touch:setPosition(homeXY)
    self.btn_myHead:setPosition(localizable.youli_home_xy)
end

function AdventureHomeLayer:removeEvents()

    self.super.removeEvents(self)

    self:stopScreenMoveAuto()
    TFAudio.stopMusic()
    TFAudio.playMusic("sound/bgmusic/home.mp3", true)

	if self.generalHead then
        self.generalHead:removeEvents()
    end
 	
    if self.flickTimer then
        TFDirector:removeTimer(self.flickTimer)
        self.flickTimer = nil 
    end

    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end

    if self.otherPlayerCallBack then
        TFDirector:removeMEGlobalListener(AdventureManager.refreshOtherPlayerInfo, self.otherPlayerCallBack)    
        self.otherPlayerCallBack = nil
    end

    if self.updateMissionCallBack then
        TFDirector:removeMEGlobalListener(MissionManager.EVENT_UPDATE_MISSION, self.updateMissionCallBack) 
        self.updateMissionCallBack = nil
    end
    if self.changeLayerCompleteCallBack then
        TFDirector:removeMEGlobalListener(AdventureManager.changeLayerComplete, self.changeLayerCompleteCallBack)
        self.changeLayerCompleteCallBack = nil
    end

    if self.refreshHomeLayerCallBack then
        TFDirector:removeMEGlobalListener(AdventureManager.refreshHomeLayer, self.refreshHomeLayerCallBack)
        self.refreshHomeLayerCallBack = nil
    end

    if self.refreshRandomEventCallBack then
        TFDirector:removeMEGlobalListener(AdventureManager.refreshRandomEvent, self.refreshRandomEventCallBack)
        self.refreshRandomEventCallBack = nil
    end

    if self.talkEndMessageCallBack then
        TFDirector:removeMEGlobalListener(AdventureManager.talkEndMessage, self.talkEndMessageCallBack)
        self.talkEndMessageCallBack = nil
    end

    if self.fightEndMessageCallBack then
        TFDirector:removeMEGlobalListener(AdventureManager.fightEndMessage, self.fightEndMessageCallBack)
        self.fightEndMessageCallBack = nil
    end


    if self.screenMoveTween then
        TFDirector:killTween(self.screenMoveTween)
        self.screenMoveTween = nil
    end  
    if self.headMoveTween then
        TFDirector:killTween(self.headMoveTween)
        self.headMoveTween = nil
    end
    if self.headScaleTween then
        TFDirector:killTween(self.headScaleTween)
        self.headScaleTween = nil
    end    
    if self.addItemTimer then
        TFDirector:removeTimer(self.addItemTimer)
        self.addItemTimer = nil
    end
    self.registerEventCallFlag = nil  
end

function AdventureHomeLayer:dispose()

	self.super.dispose(self)
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    
end

function AdventureHomeLayer:startMoveScreen(sender, callback,speed_t)
    self.isTouchMove = true
    local _parent = sender:getParent()
    local wordPos = _parent:convertToWorldSpaceAR(sender:getPosition())
    local screenSize = self.ui:getContentSize()
    local screenMiddlePosX = self.ui:getPositionX() + screenSize.width/2
    local screenMiddlePosY = self.ui:getPositionY() + screenSize.height/2

    local desX = self.panel_touch:getPositionX() + screenMiddlePosX - wordPos.x
    local desY = self.panel_touch:getPositionY() + screenMiddlePosY - wordPos.y

    desX,desY = self:checkBgPosition(desX,desY)

    local durationTime = 0.2
    if speed_t then
        durationTime = speed_t/1000
    end
    -- if speed then
    --     local pos = self.panel_touch:getPosition()
    --     local dx = pos.x - desX
    --     local dy = pos.y - desY
    --     local dis = math.sqrt( dx*dx + dy*dy )
    --     durationTime = dis/speed
    -- end
    print("durationTime = ",durationTime)
    if desX ~= self.panel_touch:getPositionX() or desY ~= self.panel_touch:getPositionY() then
        self.screenMoveTween = 
        {
            target = self.panel_touch,
            {
                duration = durationTime,
                x = desX,
                y = desY,
                onUpdate = function() 
                    self:refreshGuideIcon()
                end,
                onComplete = function() 
                    if self.screenMoveTween then
                        TFDirector:killTween(self.screenMoveTween)
                        self.screenMoveTween = nil
                    end
                    self:refreshGuideIcon()
                    if callback then
                        callback()
                    end
                end
            }
        }
        TFDirector:toTween(self.screenMoveTween)   
    else
        if callback then
            callback()
        end
    end
end

function AdventureHomeLayer:startMoveHeadIcon(sender,pos,speed, callback)
    if self.nTreasureState == 1 then
        local blackPanel = TFPanel:create();
        blackPanel:setSize(GameConfig.WS);
        blackPanel:setTouchEnabled(true);
        -- blackPanel:setBackGroundColorType(TF_LAYOUT_COLOR_SOLID)
        blackPanel:setBackGroundColor(ccc3(0,0,0))
        blackPanel:setZOrder(100000)
        TFDirector:currentScene():addChild(blackPanel)
        self.blackPanel = blackPanel;
    end

    self.moveEndCallBack = callback
    local _parent = sender:getParent()
    local wordPos = _parent:convertToWorldSpaceAR(sender:getPosition())
    self.lastWordPos = wordPos
    if self.headMoveTween then
        TFDirector:killTween(self.headMoveTween)
        self.headMoveTween = nil
    end

    if self.headScaleTween then
        self.btn_myHead:setScale(self.oldScale)
        TFDirector:killTween(self.headScaleTween)
        self.headScaleTween = nil
    end    
    self.headMoveTween = 
    {
        target = sender,
        -- repeated = -1,
        {
            duration = speed,
            x = pos.x,
            y = pos.y,
            onComplete = function() 
                if self.headMoveTween then
                    TFDirector:killTween(self.headMoveTween)
                    self.headMoveTween = nil
                end
                if self.headScaleTween then
                    self.btn_myHead:setScale(self.oldScale)
                    TFDirector:killTween(self.headScaleTween)
                    self.headScaleTween = nil
                end
                if self.moveEndCallBack then
                    self.moveEndCallBack()
                end
            end,
            onUpdate = function() 
                self:headMove() 
            end
        }
    }
    self.headScaleTween = 
    {
        target = sender,
        repeated = -1,
        {
            duration = 0.15,
            scale = self.oldScale+0.1,
        },
        {
            duration = 0.15,
            scale = self.oldScale,
        }
    }
    TFDirector:toTween(self.headMoveTween)
    TFDirector:toTween(self.headScaleTween)
end

function AdventureHomeLayer:headMove()
    local _parent = self.btn_myHead:getParent()
    local wordPos = _parent:convertToWorldSpaceAR(self.btn_myHead:getPosition())


    local Dx = wordPos.x - self.lastWordPos.x
    local Dy = wordPos.y - self.lastWordPos.y

    local currMapX = self.panel_touch:getPositionX()
    local currMapY = self.panel_touch:getPositionY()
    local moveMapX = currMapX
    local moveMapY = currMapY

    if (Dx < 0 and wordPos.x < self.panelLimitSize.middleX) or (Dx > 0 and wordPos.x > self.panelLimitSize.middleX) then
        --向左移动 并且过半屏 或者向右移动且过半屏
        -- print('向左移动 并且过半屏 或者向右移动且过半屏')
        moveMapX = currMapX - Dx
    end

    if (Dy < 0 and wordPos.y < self.panelLimitSize.middleY) or (Dy > 0 and wordPos.y > self.panelLimitSize.middleY) then
        --向下移动 并且过半屏 或者向上移动且过半屏
        -- print('向下移动 并且过半屏 或者向上移动且过半屏')
        moveMapY = currMapY - Dy
    end
    -- print('self.isTouchMove = ',self.isTouchMove)
-- print('moveMapX = ',moveMapX)
        -- print('currMapX = ',currMapX)
    if (not self.isTouchMove) and (moveMapX ~= currMapX or moveMapY ~= currMapY) then
        self:moveMapPosition(moveMapX,moveMapY)
    end
    self.lastWordPos = _parent:convertToWorldSpaceAR(self.btn_myHead:getPosition())
end

function AdventureHomeLayer:checkBgPosition( posX, posY )
    local checkX = posX
    local checkY = posY

    if checkX < self.panelLimitSize.minX then
        checkX = self.panelLimitSize.minX
    elseif checkX > self.panelLimitSize.maxX then
        checkX = self.panelLimitSize.maxX
    end

    if checkY < self.panelLimitSize.minY then
        checkY = self.panelLimitSize.minY
    elseif checkY > self.panelLimitSize.maxY then
        checkY = self.panelLimitSize.maxY
    end
    return checkX,checkY
end

function AdventureHomeLayer:refreshMainEvent()
    
    local currMission = AdventureMissionManager:getCurrMission()

    self.imgMainGuide:setVisible(false)
    self.mainEventIcon:setVisible(false)
    if currMission then
        local pos = stringToNumberTable(currMission.coordinate, ",")
        local cutDown,eventId = AdventureManager:getRandomEventInfo()
        eventId = eventId or {}
        for i=1,RandomEventNum do
            if (eventId[i] and eventId[i] ~= 0) and self.randomEventIcon[i]:isVisible() then
                local eventTemplete = AdventureRandomEventData:getInfoById(eventId[i])
                local currPos1 = eventTemplete:getCoordinate()
                local currPos2 = self.randomEventIcon[i]:getPosition()
                if currPos1.x == currPos2.x and currPos1.y == currPos2.y then
                    pos[1] = pos[1] + 50
                    break
                end
            end
        end
        self.mainEventIcon:setVisible(true)
        self.mainEventIcon:setPosition(ccp(pos[1],pos[2]))
        self:refreshGuideIcon()
    end    
end

function AdventureHomeLayer:refreshGuideIcon()
    --宝藏状态下不刷新
    if self.nTreasureState ~= 0 then
        return
    end
    self.imgMainGuide:setVisible(false)
    if self:checkInScreen(self.mainEventIcon) == false then
        self.imgMainGuide:setVisible(true)
        local posX,posY,rotate = self:getGuideIconInfo(self.mainEventIcon,true)
        -- print('posX = ',posX)
        -- print('posY = ',posY)
        self.imgMainGuide:setPosition(ccp(posX,posY)) 
        local imgArrow = TFDirector:getChildByPath(self.imgMainGuide,"imgArrow")           
        imgArrow:setRotation(rotate)
    end

    for i=1,RandomEventNum do
        self.imgRandomGuide[i]:setVisible(false)
        if self:checkInScreen(self.randomEventIcon[i]) == false then
            self.imgRandomGuide[i]:setVisible(true)
            local posX,posY,rotate = self:getGuideIconInfo(self.randomEventIcon[i],true)
            -- print("posX",posX)
            -- print("posY",posY)
            self.imgRandomGuide[i]:setPosition(ccp(posX,posY))            
            self.imgRandomGuide[i].eventId = self.randomEventIcon[i].eventId
            local imgArrow = TFDirector:getChildByPath(self.imgRandomGuide[i],"imgArrow")           
            imgArrow:setRotation(rotate)
        end
    end
end

function AdventureHomeLayer.onClickMainEvent( btn )
    local self = btn.logic

    local headPos = self.btn_myHead:getPosition()
    local eventPos = self.mainEventIcon:getPosition()

    if eventPos.x > headPos.x then 
        eventPos.x = eventPos.x - 50
    else
        eventPos.x = eventPos.x + 50
    end
    if eventPos.y > headPos.y then 
        eventPos.y = eventPos.y - 50
    else
        eventPos.y = eventPos.y + 50
    end

    local ds = math.sqrt(math.pow((eventPos.x - headPos.x),2) + math.pow((eventPos.y - headPos.y),2))
    local speedTime = ds/HeadMoveSpeed

    if self:checkInScreen(self.btn_myHead) == false then
        speedTime = ds/(HeadMoveSpeed*2)
    end

    local function callback()
        --显示主线任务详细
        self.mainIconCallBackCount = self.mainIconCallBackCount + 1
        if self.mainIconCallBackCount >= 2 then
            local currMission = AdventureMissionManager:getCurrMission()
            local reqiure_level = currMission.reqiure_level or 0
            -- print('-------------------------currMission = ',currMission)
            if currMission.function_open == 0 then
                toastMessage(localizable.youli_not_open)
                return
            end
            if MainPlayer:getLevel() < reqiure_level then
                toastMessage(stringUtils.format(localizable.youli_reqiure_level, reqiure_level))
                return
            end
            if currMission and MissionManager:checkIsFirstTimeInMission(currMission.id) then
                if MissionManager:isHaveTipInMissionForYouli(currMission.id,AdventureManager.MapTalkIndex) then
                    self.isMainEventMessage = true
                    MissionManager:showTipForMission(currMission.id,AdventureManager.MapTalkIndex,AdventureManager.talkEndMessage)                
                else
                    --show details
                    self:showMainEventDetailsByMissionId(currMission.id)
                end
            end
        end
    end
    self.mainIconCallBackCount = 0
    self:startMoveScreen(self.mainEventIcon,callback)
    self:startMoveHeadIcon(self.btn_myHead, eventPos,speedTime,callback)
end

function AdventureHomeLayer:showMainEventDetailsByMissionId( missionId )
    AdventureManager:openAdventureMissionDetailLayer(missionId)
end

function AdventureHomeLayer:refreshRandomEvent()
    local cutDown,eventId = AdventureManager:getRandomEventInfo()
    -- self.randomEventIcon:setVisible(false)
    self.randomEventTimer = nil
    eventId = eventId or {}
    for i=1,RandomEventNum do
        self.randomEventIcon[i]:setVisible(false)
        if eventId[i] and eventId[i] ~= 0 then
            -- 存在随机事件
            print('eventId[i] = ',eventId[i])
            self.randomEventIcon[i]:setVisible(true)
            local eventTemplete = AdventureRandomEventData:getInfoById(eventId[i])        
            local pos = eventTemplete:getCoordinate()

            local currMission = AdventureMissionManager:getCurrMission()
            if currMission then
                local currPos1 = stringToNumberTable(currMission.coordinate, ",")            
                local currPos2 = self.mainEventIcon:getPosition()
                if currPos2.x == currPos1[1] and currPos2.y == currPos1[2] then
                    pos.x = pos.x + 50
                end
            end
            self.randomEventIcon[i]:setPosition(ccp(pos.x,pos.y))
            self.randomEventIcon[i].eventId = eventId[i]
            local roleId = eventTemplete.people or 1
            local role = RoleData:objectByID(roleId)
            self.randomEventIcon[i]:setTextureNormal(role:getBigImagePath())
            
        -- elseif cutDown then
        --     --存在随机事件倒计时
        --     if cutDown == 0 then
        --         AdventureManager:requestHomeLayerData(AdventureManager.refreshRandomEvent)
        --     else
        --         self.randomEventTimer = cutDown
        --     end
        end
    end
    self:refreshGuideIcon()
end

function AdventureHomeLayer.onClickRandomEvent( btn )
    local eventId = btn.eventId
    local self = btn.logic
    local index = btn.index

    -- toastMessage('点击了随机事件')
    local headPos = self.btn_myHead:getPosition()
    local eventPos = self.randomEventIcon[index]:getPosition()
    local ds = math.sqrt(math.pow((eventPos.x - headPos.x),2) + math.pow((eventPos.y - headPos.y),2))
    local speedTime = ds/HeadMoveSpeed
    if eventPos.x > headPos.x then 
        eventPos.x = eventPos.x - 50
    else
        eventPos.x = eventPos.x + 50
    end
    if eventPos.y > headPos.y then 
        eventPos.y = eventPos.y - 50
    else
        eventPos.y = eventPos.y + 50
    end
    if self:checkInScreen(self.btn_myHead) == false then
        speedTime = ds/(HeadMoveSpeed*2)
    end

    local function callback()
        self.randomIconCallBackCount = self.randomIconCallBackCount + 1
        if self.randomIconCallBackCount >= 2 then
            -- local cutDown,eventId = AdventureManager:getRandomEventInfo()
            local mission = AdventureRandomEventData:getInfoById(eventId)
            if mission then
                self.isMainEventMessage = false
                self.currentRandomEventId = eventId
                if mission:checkIsTalk() then                    
                    MissionManager:showTipForMission(eventId,AdventureManager.MapTalkIndex,AdventureManager.talkEndMessage)
                elseif MissionManager:isHaveTipInMissionForYouli(mission.id,AdventureManager.MapTalkIndex) then
                    MissionManager:showTipForMission(mission.id,AdventureManager.MapTalkIndex,AdventureManager.talkEndMessage)                
                else
                    self:showRandomEventDetailsByMissionId(eventId)
                end
            else
                print('cannot find the event by id = ',eventId)
            end
        end
    end
    self.randomIconCallBackCount = 0
    self:startMoveScreen(self.randomEventIcon[index],callback)
    self:startMoveHeadIcon(self.btn_myHead, eventPos,speedTime,callback)    
end

function AdventureHomeLayer:showRandomEventDetailsByMissionId( missionId )
    AdventureManager:openAdventureRandomDetailLayer(missionId)
end

function AdventureHomeLayer:refreshOtherPlayerInfo()
    --宝藏状态下不刷新
    if self.nTreasureState ~= 0 then
        return
    end

    if AdventureManager.OtherPlayerSwitch == false then
        self.otherPlayerOn:setVisible(false)
        self.otherPlayerOff:setVisible(false)
        return
    end
    local cutDown,opponent = AdventureManager:getOtherPlayerInfo()
    self.otherPlayerCutDown = nil
    if cutDown then
        -- 需要显示倒计时
        if self.otherPlayerMoveHead then
            for k,v in pairs(self.otherPlayerMoveHead) do
                v:setVisible(false)
            end
        end
        self.otherPlayerOn:setVisible(false)
        self.otherPlayerOff:setVisible(true)
        local txtCutDown = TFDirector:getChildByPath(self.otherPlayerOff,"txt_freshtime")
        local min = math.floor(cutDown/60)
        local sec = math.mod(cutDown,60)
        txtCutDown:setText(string.format("%02d:%02d",min,sec))

        local btnWenhao = TFDirector:getChildByPath(self.otherPlayerOff,"wenhao")
        btnWenhao:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickOtherPlayerTime))
        btnWenhao.logic = self

        if cutDown == 0 then
            --请求数据
            AdventureManager:requestHomeLayerData(AdventureManager.refreshOtherPlayerInfo)
        else
            --显示刷新倒计时
            self.otherPlayerCutDown = cutDown
        end
    else
        -- 需要显示玩家头像
        self.otherPlayerOn:setVisible(true)
        self.otherPlayerOff:setVisible(false)
        self.otherPlayerMoveHead = self.otherPlayerMoveHead or {}
        for i=1,3 do
            local headFrame = TFDirector:getChildByPath(self.otherPlayerOn, "otherFrame_"..i)
            local headIcon = TFDirector:getChildByPath(self.otherPlayerOn, "otherhead_"..i)
            -- if i ~= 1 then
                Public:addFrameImg(headIcon,opponent[i].headPicFrame,true)
            -- end
            local RoleIcon = RoleData:objectByID(opponent[i].icon)
            headIcon:setTexture(RoleIcon:getIconPath())

            headFrame:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickOtherPlayerHead))
            headFrame.logic = self
            headFrame.idx = i

            --getResValueByTypeForGH(resType)
            local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.SHALU_COUNT)
            local currCount = challengeInfo:getLeftChallengeTimes()
            if i ~= 1 and currCount > 0 then
                CommonManager:setRedPoint(headFrame, true,"baoziNumber",ccp(0,0))
            else
                CommonManager:setRedPoint(headFrame, false,"baoziNumber",ccp(0,0))
            end

            --大地图上面的头像
            local headMoveIcon = nil
            if self.otherPlayerMoveHead[i] == nil then
                headMoveIcon = self.headModel:clone()
                self.headModel:getParent():addChild(headMoveIcon)
                self.otherPlayerMoveHead[i] = headMoveIcon
            else
                headMoveIcon = self.otherPlayerMoveHead[i]
            end
            
            local imgHead = TFDirector:getChildByPath(headMoveIcon, "img_myHeadIcon")

            local RoleIcon = RoleData:objectByID(opponent[i].icon)
            imgHead:setTexture(RoleIcon:getIconPath())
            local txtName = TFDirector:getChildByPath(headMoveIcon, "txt_myName")
            Public:addFrameImg(imgHead,opponent[i].headPicFrame,true)
            if i == 1 then                
                txtName:setText(localizable.shalu_nearby_txt1)
            else
                txtName:setText(opponent[i].name)                
            end
            headMoveIcon:setVisible(true)
            local pos = AdventureManager:getOtherPlayerInfoPos(opponent[i].id)
            headMoveIcon:setPosition(pos)
            headMoveIcon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickOtherPlayerHead))
            headMoveIcon.logic = self
            headMoveIcon.idx = i
        end
    end
end

function AdventureHomeLayer.onClickOtherPlayerHead( btn )
    local self = btn.logic
    local idx = btn.idx
    local cutDown,opponent = AdventureManager:getOtherPlayerInfo()
    local function callBack( playerId )
        AlertManager:close()
        local function screenMoveEnd()
            self.otherPlayerCallBackCount = self.otherPlayerCallBackCount + 1
            if self.otherPlayerCallBackCount >= 2 then
                AdventureManager:openShaluVsLayer(playerId,AdventureManager.fightType_0)
            end
        end
        local headPos = self.btn_myHead:getPosition()
        local eventPos = self.otherPlayerMoveHead[idx]:getPosition()
        if eventPos.x > headPos.x then 
            eventPos.x = eventPos.x - 50
        else
            eventPos.x = eventPos.x + 50
        end
        if eventPos.y > headPos.y then 
            eventPos.y = eventPos.y - 50
        else
            eventPos.y = eventPos.y + 50
        end

        self.otherPlayerCallBackCount = 0
        self:startMoveScreen(self.otherPlayerMoveHead[idx],screenMoveEnd)
        self:startMoveHeadIcon(self.btn_myHead, eventPos,0.4,screenMoveEnd)   
    end
    AdventureManager:openShaNuLayer( opponent[idx].id,callBack)
end

function AdventureHomeLayer.onClickOtherPlayerTime( btn )
    local cost = ConstantData:objectByID("Kill.CancelRefreshCD.Gold").value or 0
    local msg = stringUtils.format(localizable.youli_text19, cost)
    CommonManager:showOperateSureLayer(
        function()
            if MainPlayer:isEnoughSycee( cost , true) then
                AdventureManager:requestResetPlayerTime()
            end
        end,
        function()
            AlertManager:close()
        end,
        {
        title = localizable.smritiMain_tips,
        msg = msg,
        }
    )
end

function AdventureHomeLayer.onClickInBgMap( btn )
    local self = btn.logic

    -- if self.headMoveTween then
    --     TFDirector:killTween(self.headMoveTween)
    --     self.headMoveTween = nil
    --     
    -- end

end

function AdventureHomeLayer:setDataReady()

    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end

    self:refreshOtherPlayerInfo()
    self:refreshRandomEvent()
    self:refreshMainEvent()

    self.countDownTimer = TFDirector:addTimer(1000, -1, nil, function () 
        --玩家刷新倒计时
        if self.otherPlayerCutDown then
            local txtCutDown = TFDirector:getChildByPath(self.otherPlayerOff,"txt_freshtime")
            local min = math.floor(self.otherPlayerCutDown/60)
            local sec = math.mod(self.otherPlayerCutDown,60)
            txtCutDown:setText(string.format("%02d:%02d",min,sec))
            if self.otherPlayerCutDown == 0 then
                AdventureManager:requestHomeLayerData(AdventureManager.refreshOtherPlayerInfo)
            else
                self.otherPlayerCutDown = self.otherPlayerCutDown - 1
            end
        end

        if self.randomEventTimer then
            if self.randomEventTimer == 0 then
                AdventureManager:requestHomeLayerData(AdventureManager.refreshRandomEvent)
            else
                self.randomEventTimer = self.randomEventTimer - 1
            end
        end
        --随机事件倒计时
    end)
end

function AdventureHomeLayer:refreshMyInfo()
    local imgHead = TFDirector:getChildByPath(self.btn_myHead, "img_myHeadIcon")
    local txtName = TFDirector:getChildByPath(self.btn_myHead, "txt_myName")

    imgHead:setTexture(MainPlayer:getHeadPath())
    txtName:setText(MainPlayer:getPlayerName())

    -- Public:addFrameImg(imgHead, MainPlayer:getHeadPicFrameId(), true)
end

function AdventureHomeLayer:checkInScreen( sender )
    
    if sender:isVisible() == false then
        --如果不存在sender
        return true
    end
    local _parent = sender:getParent()    
    local wordPos = _parent:convertToWorldSpaceAR(sender:getPosition())
    local senderSize = sender:getContentSize()
    local uiSize = self.ui:getContentSize()

    local minY = 0---senderSize.height/2 + 20
    local maxY = uiSize.height - self.generalHead:getContentSize().height-- + (senderSize.height/2 - 20)
    local minX = 0
    local maxX = uiSize.width

    if ((wordPos.x >= minX and wordPos.x <= maxX) and (wordPos.y >= minY and wordPos.y <= maxY)) then
        return true
    end
    return false    
end

function AdventureHomeLayer:getGuideIconInfo(desSender,flag)
    local flag = flag;
    local _parent = desSender:getParent()    
    local wordPos = _parent:convertToWorldSpaceAR(desSender:getPosition())

    local uiSize = self.ui:getContentSize()
    local currPos = {x = uiSize.width/2, y = uiSize.height/2}

    local k = (wordPos.y - currPos.y)/(wordPos.x - currPos.x)
    local b = currPos.y - (currPos.x*k)

    local rotate = math.atan(k)*180/math.pi
    local generalHeadSize = self.generalHead:getContentSize()   

    --右边边距
    local otherHeadSize = self.otherPlayerOff:getContentSize()
    local rightMargin = self.otherPlayerOff:getPositionX() - otherHeadSize.width/2

    --下边边距
    local btnSize = self.btn_chapter:getContentSize()
    local buttomMargin = self.btn_chapter:getPositionY() + btnSize.height/2
    

    rotate = 90 - rotate
    local x,y
    local topY = uiSize.height - (50 + generalHeadSize.height)
    local bottomY = 50 + buttomMargin
    local leftX = 50
    local rightX = rightMargin - 50 

    local function calculation(x,y)
        if x then
            y = k*x + b
        else
            x = (y - b)/k
        end
        return x,y
    end

    if wordPos.x == uiSize.width/2 then
        if wordPos.y >= uiSize.height/2 then
            x = wordPos.x
            y = topY
        else
            x = wordPos.x
            y = bottomY
        end
    elseif wordPos.x > uiSize.width/2 then
        if wordPos.y >= uiSize.height/2 then
            x,y = calculation(rightX,nil)
            if y > topY then
                x,y = calculation(nil,topY)
            end
        else
            x,y = calculation(rightX,nil)
            if y < bottomY then
                x,y = calculation(nil,bottomY)
            end
        end
    else
        rotate = rotate + 180
        if wordPos.y >= uiSize.height/2 then
            x,y = calculation(leftX,nil)
            if y > topY then
                x,y = calculation(nil,topY)
            end
        else
            x,y = calculation(leftX,nil)
            if y < bottomY then
                x,y = calculation(nil,bottomY)
            end
        end
    end
    if flag then
        x = x - uiSize.width/2
        y = y - uiSize.height/2
    end
    return x,y,rotate
end

function AdventureHomeLayer.onShopClick( btn )
    -- local self = btn.logic
    AdventureManager:openAdventureMallLayer()
end

function AdventureHomeLayer.onShaLuBtnClick( btn )
    -- print('----------onShaLuBtnClick---------------')
    AdventureManager:requestAdventureMassacre()
end

function AdventureHomeLayer.onBtnChapterClick( btn )
    AdventureManager:openMissLayer()
end

function AdventureHomeLayer:flickMove(speedx, speedy, k)
    -- print('--------------------->>>>>speedx = ',speedx)
    -- print('--------------------->>>>>speedy = ',speedy)
    -- print('--------------------->>>>>k = ',k)

    if self.flickTimer then
        TFDirector:removeTimer(self.flickTimer)
        self.flickTimer = nil
    end
    local b
    if k == nil then
        if speedx then
            --x 方向移动
            self.flickTimer = TFDirector:addTimer(66, -1,nil,
                    function ()
                        if math.abs(speedx) <= 1 then
                            TFDirector:removeTimer(self.flickTimer)
                            self.flickTimer = nil 
                        else
                            local pos = self.panel_touch:getPosition()
                            local desX = pos.x + speedx
                            local desY = pos.y
                            -- print('flickMove-----nil----------------speedx')
                            self:moveMapPosition(desX, desY)
                            speedx = speedx/2
                        end
                    end)
        else
            --y 方向移动
            self.flickTimer = TFDirector:addTimer(66, -1,nil,
                    function ()
                        if math.abs(speedy) <= 1 then
                            TFDirector:removeTimer(self.flickTimer)
                            self.flickTimer = nil 
                        else
                            local pos = self.panel_touch:getPosition()
                            local desX = pos.x
                            local desY = pos.y + speedy
                            -- print('flickMove-----nil----------------speedy')
                            self:moveMapPosition(desX, desY)
                            speedy = speedy/2
                        end
                    end)
        end
    else
        local currPos = self.panel_touch:getPosition()
        local b = currPos.y - currPos.x * k
        if speedx then
            -- print('flickTimer')
            self.flickTimer = TFDirector:addTimer(66, -1,nil,
                    function ()
                        -- print('---------speedx------- = ',speedx)
                        if math.abs(speedx) <= 1 then
                            TFDirector:removeTimer(self.flickTimer)
                            self.flickTimer = nil
                        else
                            -- print('flickMove--------------------speedx')
                            local pos = self.panel_touch:getPosition()
                            local desX = pos.x + speedx
                            local desY = k*desX + b   
                            self:moveMapPosition(desX, desY)                                                     
                            speedx = speedx/2
                        end
                    end)
        else
            self.flickTimer = TFDirector:addTimer(66, -1,nil,
                    function ()
                        if math.abs(speedy) <= 1 then
                            TFDirector:removeTimer(self.flickTimer)
                            self.flickTimer = nil 
                        else
                            -- print('flickMove--------------------speedy')
                            local pos = self.panel_touch:getPosition()
                            local desY = pos.y + speedy
                            local desX = (desY - b)/k
                            self:moveMapPosition(desX, desY)                                                     
                            speedy = speedy/2
                        end
                    end)
        end
    end   
end

function AdventureHomeLayer:moveMapPosition( x,y )
    local desX, desY = self:checkBgPosition( x, y )
    local lastPos = self.panel_touch:getPosition()
    self.panel_touch:setPosition(ccp(desX, desY))
    -- print('---------------------moveMapPosition-----x = '..x.." y = "..y)
    self:refreshGuideIcon()
end

function AdventureHomeLayer.onArmyBtnClick( btn )
    local self = btn.logic
    -- print('self.panel_touch = ', self.panel_touch:isVisible())
    -- print('self.panel_touch = ', self.panel_touch:getPosition())
    -- print('imgRandomGuide = ', self.imgRandomGuide:isVisible())
    -- print('imgRandomGuide = ', self.imgRandomGuide:getPosition())
    -- ZhengbaManager:openArmyLayer(EnumFightStrategyType.StrategyType_DOUBLE_1, true)
    ZhengbaManager:openArmyLayer(EnumFightStrategyType.StrategyType_PVE, true)
end

function AdventureHomeLayer.onChouRenBtnClick( btn )
    AdventureManager:openAdventureEnemyLayer()
end

function AdventureHomeLayer:touchAndMoveHeadIcon( pos )
    local movePos = {}
    local headPos = self.btn_myHead:getPosition()
    local uiSize = self.ui:getContentSize()
    movePos.x = pos.x - uiSize.width/2
    movePos.y = pos.y - uiSize.height/2
    movePos.x = movePos.x - self.panel_touch:getPositionX()
    movePos.y = movePos.y - self.panel_touch:getPositionY()
    print('pospospos = ',movePos)

    if self.clickAnim == nil then
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/clickAnim.xml")
        local effect = TFArmature:create("clickAnim_anim")        
        effect:setZOrder(1)
        self.panel_touch:addChild(effect) 
        effect:setVisible(false)
        self.clickAnim = effect
    end
    local bgSize = self.panel_touch:getContentSize()
    self.clickAnim:playByIndex(0, -1, -1, 0)
    self.clickAnim:setPosition(ccp(movePos.x + bgSize.width/2, movePos.y + bgSize.height/2))
    self.clickAnim:setVisible(true)


    local ds = math.sqrt(math.pow((movePos.x - headPos.x),2) + math.pow((movePos.y - headPos.y),2))
    local speedTime = ds/HeadMoveSpeed
    if self:checkInScreen(self.btn_myHead) == false then
        speedTime = ds/(HeadMoveSpeed*2)
    end

    local callBack = nil
    if self.nTreasureState == 1 then
        -- 挖宝回调
        callBack = function (  )
            -- print("---------self.myDigCnt-------------",self.myDigCnt)
            -- if self.myDigCnt > 0 then
                self:startDigTreasure()
            -- else
            --     toastMessage(localizable.youli_wobao_cnt)
            --     self.img_tips:setVisible(false);
            --     -- local pos = self.btn_myHead:getPosition()
            --     -- local tMapIndex = self:getMapIndexByPos( pos )
            --     -- AdventureTreasureManager:requestDigTreasure( tMapIndex )
            --     self.panel_touch:setTouchEnabled(true)
            --     if self.blackPanel then
            --         self.blackPanel:removeFromParent()
            --     end
            --     local flag = false
            --     AdventureTreasureManager:setDigRedPoint(flag)
            -- end
        end

        self.panel_touch:setTouchEnabled( false )
    end

    self:startMoveHeadIcon(self.btn_myHead,movePos,speedTime, callBack)
end

function AdventureHomeLayer:onAttackCompeleteHandle(event)
    local missionId                = event.data[1].missionId;
    local isFirstTimesPass         = event.data[1].isFirstTimesPass;
    local isFirstTimesToStarLevel3 = event.data[1].isFirstTimesToStarLevel3;

    local mission = AdventureMissionManager:getMissionById(missionId);

    -- print('event.data = ',event.data)
    --首次胜利，判断：开放下一关卡
    if isFirstTimesPass and MissionManager:isInTrustOnekey() == false then
        local nextMission = AdventureMissionManager:getNextMissionById(mission.map_id,mission.difficulty,missionId);

        if nextMission == nil then
            local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.youli.AdventureMissionSkipLayer",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);        
            layer:loadData(mission.map_id,mission.difficulty, true);     
            AlertManager:show();  
        end
    end
end

function AdventureHomeLayer.onGoodsBtnClick( btn )
    local self = btn.logic
    BagManager:ShowBagLayerByButtonIndex(3)  
end

function AdventureHomeLayer:stopScreenMoveAuto()
    if self.ScreenRandomShow == nil then
        return
    end
    local data = self.ScreenRandomShow
    if data.timer then
        TFDirector:removeTimer(data.timer)
        data.timer = nil
    end
    if data.toTween then
        TFDirector:killTween(data.toTween)
        data.toTween = nil
    end
    self.ScreenRandomShow = nil
end

function AdventureHomeLayer:startScreenMoveAuto()
    if self.ScreenRandomShow == nil then
        return
    end

    local function callback()
        self:startScreenMoveAuto()
    end


    local data = self.ScreenRandomShow
    --[[
        data:
            -index 当前显示第几个随机事件
            -timer 
            -toTween
            -iconBuff
    ]]
    local speed = ConstantData:objectByID("Adventure.MissionMoveSicnseSpeed").value
    data.index = data.index + 1
    if data.index == 1 then
        data.iconBuff = {}
        for i=1,RandomEventNum do
            if self.randomEventIcon[i]:isVisible() then
                table.insert(data.iconBuff, self.randomEventIcon[i])
            end
        end
        if #data.iconBuff == 0 then
            self:stopScreenMoveAuto()
            return
        end
        table.sort(data.iconBuff, function (a,b)
            local pos_a = a:getPositionX()
            local pos_b = b:getPositionX()
            return pos_a < pos_b
        end)
        table.insert(data.iconBuff, self.btn_myHead)
        self:startMoveScreen(data.iconBuff[data.index], callback, speed)
    elseif data.index > #data.iconBuff then
        self:stopScreenMoveAuto()
        return
    else
        if data.timer then
            TFDirector:removeTimer(data.timer)
            data.timer = nil
        end
        local second = ConstantData:objectByID("Adventure.MissionMoveSicnseStopTime").value
        data.timer = TFDirector:addTimer(second, 1,nil,
            function ()
                if data.timer then
                    TFDirector:removeTimer(data.timer)
                    data.timer = nil
                end
                self:startMoveScreen(data.iconBuff[data.index], callback, speed)
            end)
    end
    
end

-- 隐藏其他与宝藏无关ui
function AdventureHomeLayer:hideOtherUIOnTreasure(number)
    if number and number == 0 then
        -- self.tuduiList = {}
        self.nTreasureState = number;
    end
    if self.nTreasureState == 0 then 
        self.panel_home1:setVisible(true)
        self.panel_home2:setVisible(true)
        self.digLayer:setVisible(false)
        self.buryLayer:setVisible(false)
        if self.generalHead then
            self.generalHead:removeFromParent();
        end
        self.generalHead = CommonManager:addGeneralHead(self)
        self.generalHead:setData(ModuleType.youli,{HeadResType.BAOZI,HeadResType.YUELI,HeadResType.SYCEE}) 
        self.generalHead:setVisible(true)
        self.btn_myHead:setVisible(true);
    else
        self.panel_home1:setVisible(false)
        self.panel_home2:setVisible(false)
        self.imgMainGuide:setVisible(false)
        for i=1,RandomEventNum do
            self.imgRandomGuide[i]:setVisible(false)
        end
    end

    if self.buryPanelBox and self.buryPanelBox:isVisible() then
        self.buryPanelBox:setVisible(false)
    end

    if self.myBuryList then
        for i,v in ipairs(self.myBuryList) do
            if (v) then
                v:setVisible(false)
                v:removeFromParent()
            end
        end
    end

    if self.myBuryBoxList then
        for i,v in ipairs(self.myBuryBoxList) do
            if (v) then
                v:setVisible(false)
                v:removeFromParent()
            end
        end
    end

    if self.tuduiList then
        for i,v in ipairs(self.tuduiList) do
            if (v) then
                v:setVisible(false)
                v:removeFromParent()
            end
        end
    end

    if self.mydigList then
        for i,v in ipairs(self.mydigList) do
            if (v) then
                v:setVisible(false)
                v:removeFromParent()
            end
        end
    end

    self.panel_touch:setTouchEnabled(true)
    self.myBuryList = {}
    self.myBuryBoxList = {}
    self.tuduiList ={}
    self.mydigList = {}
    self.openBox = nil
    self:refreshGuideIcon()
end

-- 切换到挖宝界面
function AdventureHomeLayer:onDigBtnClick(  )
    local tHeadOnMapIndex = self:getMapIndexByPos( localizable.youli_home_xy )
    self.nTreasureState = 1
    local flag  = self.nTreasureState
    AdventureTreasureManager:changeToBuryLayerOrDigLayer( flag , tHeadOnMapIndex )
end
-- 切换到挖宝界面UI加载
function AdventureHomeLayer:waitForDataOnDigUI( data )
    if self.nTreasureState ~= 0 then
        local currTime = MainPlayer:getNowtime()
        if CommonManager:checkRedPointByKey("buryBtnRedPoint",currTime) then
            local redPointState = AdventureTreasureManager:GetBuryRedPoint()
            CommonManager:setRedPointStateByKey( "buryBtnRedPoint", redPointState )
            CommonManager:setRedPoint(self.btn_bury, redPointState,"buryBtnRedPoint")
        end

        self.tuduiList = {}
        self:hideOtherUIOnTreasure()

        self.digLayer:setVisible(true)
        self.buryLayer:setVisible(false)

        self.btn_myHead:setVisible(true)

        self:resetHomePosition()

        

        if self.generalHead then
            self.generalHead:removeFromParent();
        end
        self.generalHead = CommonManager:addGeneralHead(self)
        self.generalHead:setData(ModuleType.wabao,{HeadResType.SYCEE}) 
        self.generalHead:setVisible(true)
        self.btn_myHead:setVisible(true);

        self.myDigListLocation = {}
        local myDigList= AdventureTreasureManager:getMyDigBoxList();
        local index = 1
        if myDigList then
            for i = 1,#myDigList do
                local myDigBox = myDigList[i]
                local lifeHours = ConstantData:getValue("AdventureTreasureLifeHours")
                local leftTime = lifeHours*60*60 -(MainPlayer:getNowtime() - myDigBox.buriedTime/1000);
                if leftTime > 0 and myDigBox.leftTimes > 0 then
                    self.myDigListLocation[index] = myDigList[i]
                    index = index + 1
                end
            end
        end
         
        self:refreshMyBoxUI()
        self:refreshMyDigBoxUI()
        -- print("---------------waitForDataOnDigUI:data---------------",data)
        self:refreshBoxAndTips(data)
    end
end

-- 切换到埋宝界面
function AdventureHomeLayer:onBuryBtnClick(  )
    self.nTreasureState = 2
    local flag  = self.nTreasureState
    AdventureTreasureManager:changeToBuryLayerOrDigLayer( flag )
end
-- 切换到埋宝界面UI加载
function AdventureHomeLayer:waitForDataOnBuryUI(  )
    if self.nTreasureState ~= 0 then
        local currTime = MainPlayer:getNowtime()
        if CommonManager:checkRedPointByKey("digBtnRedPoint",currTime) then
            local redPointState = AdventureTreasureManager:GetDigRedPoint()
            CommonManager:setRedPointStateByKey( "digBtnRedPoint", redPointState )
            CommonManager:setRedPoint(self.btn_dig, redPointState,"digBtnRedPoint")
        end
        self:hideOtherUIOnTreasure()

        self:refreshMaiBaoLayerboxUI();

        self.buryLayer:setVisible(true)
        self.digLayer:setVisible(false)

        self.btn_myHead:setVisible(false)

        self:resetHomePosition()
    
        if self.generalHead then
            self.generalHead:removeFromParent();
        end
        self.generalHead = CommonManager:addGeneralHead(self)
        self.generalHead:setData(ModuleType.maibao,{HeadResType.SYCEE}) 
        self.generalHead:setVisible(true)
        self.btn_myHead:setVisible(false);
        self.attr_layer_show = false
        local locationY = self.img_attr_di:getPositionY()
        self.img_attr_di:setPosition(ccp(self.origin_pos_x,locationY))
        self:refreshMyBoxUI();
    end
end

-- 挖宝规则
function AdventureHomeLayer:onDigHelpClickHandle(sender)
    local self = sender.logic
    CommonManager:showRuleLyaer('adventuretreasureseek')
end

-- 挖宝历史
function AdventureHomeLayer:onDigRecordClickHandle(sender)
    local self = sender.logic;
    AdventureTreasureManager:requestDigRecord();
    self.btn_myHead:setVisible(true)

    self:resetHomePosition()
end

-- 我的宝藏地点UI处理
function AdventureHomeLayer:refreshMyBoxUI()
    self.myBuryListLocation = AdventureTreasureManager:getMyBuryBoxList();
    
    self.myBuryList = {};
    self.myBuryBoxList = {};
    if self.myBuryListLocation then
        local length = #self.myBuryListLocation;
        local mapSize = self.panel_touch:getContentSize()
        local nBlockPixel = ConstantData:getValue("AdventureTreasurePxPerBlock")
        for i = 1,length do 
            local myBury = self.myBuryListLocation[i];
            local flag = true;
            if self.nTreasureState == 1 then
            -- print("-----------------refreshMyBoxUI:self.myBuryListLocation--------------------",self.myBuryListLocation)
            -- print("-----------------refreshMyBoxUI:self.myDigListLocation--------------------",self.myDigListLocation)
                for j = 1,#self.myDigListLocation do
                    local myDig = self.myDigListLocation[j]
                    if myBury.colId == myDig.colId and myBury.rowId == myDig.rowId then
                        flag = nil;
                        break;
                    end
                end
            end
            if flag then
                local itemId = myBury.treasureId;
                local posY = nBlockPixel * myBury.rowId - nBlockPixel / 2 - mapSize.height / 2
                local posX = nBlockPixel * myBury.colId - nBlockPixel / 2 - mapSize.width / 2 
                local panel_wz
                if self.nTreasureState == 1 then 
                    panel_wz = self.dig_panel_wz:clone()
                else 
                    panel_wz = self.bury_panel_wz:clone()
                end

                local img_wz
                if itemId == 30401 or itemId == 30403 then
                    img_wz = TFDirector:getChildByPath(panel_wz, "img_wz2")
                elseif itemId == 30402 or itemId == 30404 then
                    img_wz = TFDirector:getChildByPath(panel_wz, "img_wz1")
                end
                img_wz:setVisible(true)
                local img_box = TFDirector:getChildByPath(img_wz, "img_box")
                local path = "ui_new/youli/wabao/img_box"..(itemId - 30400)..".png"
                img_box:setTexture(path);
                local pos = panel_wz:getPosition();
                panel_wz:removeFromParent()
                panel_wz:setAnchorPoint(ccp(0.5,0))
                panel_wz:setPosition(ccp(posX,posY));
                panel_wz:setVisible(true)
                self.panel_touch:addChild(panel_wz,1);
                table.insert( self.myBuryList, panel_wz)
            end
        end
    end
end
-- 我挖过的宝箱地点UI处理
function AdventureHomeLayer:refreshMyDigBoxUI()
    if self.myDigListLocation then
        local length = #self.myDigListLocation;
        local mapSize = self.panel_touch:getContentSize()
        local nBlockPixel = ConstantData:getValue("AdventureTreasurePxPerBlock")
        for i = 1,length do 
            local mydig = self.myDigListLocation[i];
            local itemId = mydig.treasureId;
            local posY = nBlockPixel * mydig.rowId - nBlockPixel / 2 - mapSize.height / 2
            local posX = nBlockPixel * mydig.colId - nBlockPixel / 2 - mapSize.width / 2 
            local index = itemId - 30400
            local cnt = mydig.leftTimes
            local panel_box = self.dig_panel_box:clone()
            local img_box  = TFDirector:getChildByPath(panel_box, "img_box")
            local img_wuliang = TFImage:create("ui_new/youli/wabao/img_wl.png")
            img_box:addChild(img_wuliang)
            img_wuliang:setVisible((mydig.specialBox == 1))
            local path = "ui_new/youli/wabao/img_box"..index.."_1.png"
            img_box:setTexture(path);
            local txt_num  = TFDirector:getChildByPath(panel_box, "txt_num")
            txt_num:setText(cnt);
            panel_box:setAnchorPoint(ccp(0.5,0.5))
            panel_box:setPosition(ccp(posX,posY));
            panel_box:setVisible(true)
            self.panel_touch:addChild(panel_box,8);
            table.insert( self.mydigList, panel_box)
        end
    end
end

--  附近宝箱提醒和宝箱数刷新
function AdventureHomeLayer:refreshBoxAndTips(data)
    local showFlag = data.hasTreasures;
    -- print("-----------refreshBoxAndTips:data---------------",data)
    if showFlag == 1 then
        self.img_tips:setVisible(true);
    else
        self.img_tips:setVisible(false);
    end
    self.digBoxNumber = data.hasBuriedTreasures
    self.myDigCnt = data.remainingTimes
    self.txt_myDigCnt:setText(self.myDigCnt)
    self.txt_digBoxNumber:setText(self.digBoxNumber);
    if self.myDigCnt <= 0 then
        local flag = false
        -- print("--------------我没有挖宝次数了-----------------")
        AdventureTreasureManager:setDigRedPoint(flag)
    end
end

-- 移动结束 开始挖宝
function AdventureHomeLayer:startDigTreasure()
    local pos = self.btn_myHead:getPosition()
    local mapSize = self.panel_touch:getContentSize()
    pos.x = pos.x + mapSize.width / 2
    pos.y = pos.y + mapSize.height / 2

    local tMapIndex = self:getMapIndexByPos( pos )
    AdventureTreasureManager:requestDigTreasure( tMapIndex )
end

-- 挖土动画
function AdventureHomeLayer:digAnimation(data)
    local spciaFlag
    if data.buriedTreasuresInfo then
        spciaFlag = data.buriedTreasuresInfo[1].specialBox
    end
    if (spciaFlag == 1) or self.myDigCnt > 0 then
        self.btn_myHead:setVisible(false)
        local pos = self.btn_myHead:getPosition()
        local mapSize = self.panel_touch:getContentSize()
        pos.x = pos.x + mapSize.width / 2
        pos.y = pos.y + mapSize.height / 2

        local tMapIndex = self:getMapIndexByPos( pos )
    -- dig animation
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/watu.xml")
        local effect = TFArmature:create("watu_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 0)
        effect:setAnchorPoint(ccp(0.5, 0.5))
        local nBlockPixel = ConstantData:getValue("AdventureTreasurePxPerBlock")
        self.digPosX = pos.x--nBlockPixel * tMapIndex.x
        self.digPosY = pos.y--nBlockPixel * tMapIndex.y
        effect:setPosition(ccp(self.digPosX,self.digPosY))
        self.panel_touch:addChild(effect,2)
        self.watuEffect = effect
        self.watuEffect:setZOrder(100)
        table.insert( self.tuduiList, self.watuEffect)
        effect:addMEListener(TFARMATURE_COMPLETE, function (  )
            if self.blackPanel then
                self.blackPanel:removeFromParent()
            end
            self.watuEffect:setZOrder(2)
            self:openBoxAnimation(data)
            if self.myDigCnt == 0 then
                self.btn_myHead:setVisible(true)
                self.panel_touch:setTouchEnabled(true)
                self.img_tips:setVisible(false);
            end
        end)
        effect:setVisible(true)
    else
        self:openBoxAnimation()
    end
end


--  开箱动画
function AdventureHomeLayer:openBoxAnimation(data)
    if data then
        local flag = data.hasGotTreasures
        if flag == 1 then
            local boxInfo = data.buriedTreasuresInfo[1]
            local index = boxInfo.treasureId - 30400
            local Cnt = boxInfo.leftTimes;
            TFResourceHelper:instance():addArmatureFromJsonFile("effect/openBox"..index..".xml")
            local effect = TFArmature:create("openBox"..index.."_anim")
            local uiSize = self.ui:getContentSize()
            effect:setAnimationFps(GameConfig.ANIM_FPS)
            effect:playByIndex(0, -1, -1, 0)
            effect:setAnchorPoint(ccp(0.5, 0.5))
            local pos = self.btn_myHead:getPosition()
            local blockPosX = uiSize.width / 2
            local blockPosY = uiSize.height / 2
            effect:setPosition(ccp(blockPosX,blockPosY))
            self:addChild(effect,2)
            self.openBoxEffect = effect
            effect:setVisible(true)
            local panel_box = self.dig_panel_box:clone()
            local img_box  = TFDirector:getChildByPath(panel_box, "img_box")
            local path = "ui_new/youli/wabao/img_box"..index.."_1.png"
            img_box:setTexture(path);
            local img_wuliang = TFImage:create("ui_new/youli/wabao/img_wl.png")
            img_box:addChild(img_wuliang)
            img_wuliang:setVisible((boxInfo.specialBox == 1))
            local txt_num  = TFDirector:getChildByPath(panel_box, "txt_num")
            txt_num:setText(Cnt);
            panel_box:setAnchorPoint(ccp(0.5,0.5))
            local pos = self.watuEffect:getPosition()
            local mapSize = self.panel_touch:getContentSize()
            -- panel_box:setPosition(ccp(pos.x,pos.y)
            panel_box:setPosition(ccp(self.digPosX - mapSize.width / 2,self.digPosY - mapSize.height / 2))

            local tMapIndex = self:getMapIndexByPos( ccp(self.digPosX,self.digPosY) )
            if self.myBuryList then
                for i,v in ipairs(self.myBuryList) do
                    if (v) then
                        local pos = v:getPosition()
                        local mapSize = self.panel_touch:getContentSize()
                        pos.x = pos.x + mapSize.width / 2
                        pos.y = pos.y + mapSize.height / 2
                        local tMapIndex1 = self:getMapIndexByPos( pos )
                        if tMapIndex1.x == tMapIndex.x and tMapIndex1.y == tMapIndex.y then
                            v:setVisible(false) 
                        end
                    end
                end
            end

            self.panel_touch:addChild(panel_box,8)
            -- self.watuEffect:addChild(panel_box)
            self.openBox = panel_box;
            self.watuEffect:setVisible(false)
            table.insert( self.mydigList, panel_box)
            self.openBoxEffect:addMEListener(TFARMATURE_COMPLETE, function (  )
                self.btn_myHead:setVisible(true)
                self.panel_touch:setTouchEnabled(true)
                if self.openBox then
                    self.openBox:setVisible(true)
                end
                self:refreshBoxAndTips(data)
                self:setRewardList(data)
            end)
        elseif flag == 0 then
            local num = math.floor(math.random()*3+1)
            -- print("-----------openBoxAnimation:num------------",num)
            if num == 1 then
                toastMessage(localizable.youli_wabao_NoTip1);
            elseif num == 2 then
                toastMessage(localizable.youli_wabao_NoTip2);
            elseif num == 3 then
                toastMessage(localizable.youli_wabao_NoTip3);
            end
        
            self:refreshBoxAndTips(data)
            self.btn_myHead:setVisible(true)
            self.panel_touch:setTouchEnabled(true)
        elseif flag == 2 then
            toastMessage(localizable.youli_wabao_NoTip4)

            self:refreshBoxAndTips(data)
            self.btn_myHead:setVisible(true)
            self.panel_touch:setTouchEnabled(true)
        end
    else
        toastMessage(localizable.youli_wobao_cnt)
        self.img_tips:setVisible(false);
        -- local pos = self.btn_myHead:getPosition()
        -- local tMapIndex = self:getMapIndexByPos( pos )
        -- AdventureTreasureManager:requestDigTreasure( tMapIndex )
        self.panel_touch:setTouchEnabled(true)
        if self.blackPanel then
            self.blackPanel:removeFromParent()
        end
        local flag = false
        -- print("--------------我没有挖宝次数了-----------------")
        AdventureTreasureManager:setDigRedPoint(flag)
    end
end
-- 设置礼物弹窗
function AdventureHomeLayer:setRewardList(data)
    local rewardList = TFArray:new();
    dropItem = DropData:objectByID(tonumber(data.goodsId))
    local rewardArr = {};
    local rewardItem = {itemId = tonumber(dropItem.itemid),type = tonumber(dropItem.type), number = tonumber(data.number)};
    rewardArr[1] = rewardItem
    for i=1,#rewardArr do
        local rewardInfo = BaseDataManager:getReward(rewardArr[i])
        rewardList:push(rewardInfo);
    end
    RewardManager:showRewardListLayer(rewardList);
end
-- 埋宝规则
function AdventureHomeLayer:onBuryHelpClickHandle(sender)
    local self = sender.logic
    CommonManager:showRuleLyaer('adventuretreasurehide')
end

-- 埋宝记录
function AdventureHomeLayer:onBuryRecordClickHandle(sender)
    local self = sender.logic
    AdventureTreasureManager:requestBuryRecord()
end
-- 埋宝界面我的宝箱缩进动画
function AdventureHomeLayer:onAttrAddClickHandle(sender)
    local self = sender.logic
    if self.attr_tween then
        TFDirector:killTween(self.attr_tween)
    end
    if self.attr_layer_show then
        self.attr_tween = {
            target = self.img_attr_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = self.origin_pos_x
            },
        }
        self.attr_layer_show = false
    else
        self.attr_tween = {
            target = self.img_attr_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = 223,
            },
        }
        self.attr_layer_show = true
    end
    TFDirector:toTween(self.attr_tween)
end

-- 刷新背包里的埋宝宝箱数据
function AdventureHomeLayer:refreshMyBagBoxList()
    self.myBagBoxList = {}      --背包宝箱数据
    self.myBagBoxList[1] = {}   --背包“天”宝箱数据
    self.myBagBoxList[2] = {}   --背包“玄”宝箱数据
    self.myBagBoxList[3] = {}   --背包“地”宝箱数据
    self.myBagBoxList[4] = {}   --背包“黄”宝箱数据
    for i = 1, 4 do
        self.myBagBoxList[i].updataFlag =false;
    end
    local boxList = AdventureTreasureManager:getMyBagBoxList()
    if boxList then
        local length = #boxList
        for i = 1,length do 
            if boxList[i].treasureId == 30401 then
                table.insert( self.myBagBoxList[1], boxList[i] ) 
            elseif boxList[i].treasureId == 30402 then
                table.insert( self.myBagBoxList[2], boxList[i] )
            elseif boxList[i].treasureId == 30403 then
                table.insert( self.myBagBoxList[3], boxList[i] )
            elseif boxList[i].treasureId == 30404 then
                table.insert( self.myBagBoxList[4], boxList[i] )
            end
        end
        for i = 1, 4 do 
            self:table_sort(self.myBagBoxList[i])
        end
    end
    -- print("---------------------refreshMyBagBoxList:self.myBagBoxList-----------------------",self.myBagBoxList)
end


function AdventureHomeLayer:table_sort(list)
    local i,j,temp
    local length = #list
    for j= 1, length  do
        for i = 1, length - j  do
            if list[i].getTime > list[i + 1].getTime then
                temp = list[i]
                list[i] = list[i + 1]
                list[i + 1] = temp;
            end
        end
    end
end

-- 埋宝界面我的宝箱刷新
function AdventureHomeLayer:refreshMaiBaoLayerboxUI(flag)
    if not flag then
        self:refreshMyBagBoxList()
    end
    
    local cnt = 0
    for i = 1 , 4 do
        local length = #self.myBagBoxList[i]
        if length <= 0 then
            cnt = cnt + 1 ;
        end
        if cnt == 4 then
            local flag = false
            -- print("------------我手里没有宝箱可以买了---------------")
            AdventureTreasureManager:setBuryRedPoint(flag)
        end
    end
    

    local item = ItemData:objectByID( 30401 );
    self.lefthour = item.life_hours
    self.leftTime = {}
    if self.addItemTimer then
        TFDirector:removeTimer(self.addItemTimer)
        self.addItemTimer = nil
    end
    self.myBagBoxIndexList = {1,1,1,1}
    self.txt_xianshi = {}
    self.txt_num = {}
    for i = 1,4 do 
        self.img_boxList[i]:setVisible(true)
        self.img_boxList[i].logic = self
        self.img_boxList[i]:addMEListener(TFWIDGET_CLICK,  self.cellClickHandle,1);
        self.img_boxList[i]:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle,1);
        self.img_boxList[i]:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
        self.img_boxList[i]:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
        self.img_boxList[i].index = i;
        local img_box = TFDirector:getChildByPath(self.img_boxList[i], "img_box");
        local txt_xianshi = TFDirector:getChildByPath(self.img_boxList[i], "txt_xianshi");
        txt_xianshi.index = i;
        self.txt_xianshi[i] = txt_xianshi
        local txt_yongyou = TFDirector:getChildByPath(self.img_boxList[i], "txt_yongyou");
        local txt_num = TFDirector:getChildByPath(txt_yongyou, "txt_num");
        self.txt_num[i] = txt_num
        local itemBox = self.myBagBoxList[i]
        local num = 0
        if itemBox then
            num = #itemBox
        end
        if num == 0 then
            self.img_boxList[i]:setTouchEnabled(false)
        end
        txt_num:setText(num);
        itemBox.updataFlag = true
        if not self.addItemTimer then
            self.addItemTimer = TFDirector:addTimer(60000, -1, nil, 
                function() 
                    self:leftTimeUpdata()
                end)
        end
        
        local txt_keling = TFDirector:getChildByPath(self.img_boxList[i], "txt_keling");
        local txt_num = TFDirector:getChildByPath(txt_keling, "txt_num");
        local numberList = {3,1,200,100}
        txt_num:setText("X"..numberList[i])
    end
    local flag = 1 
    self:leftTimeUpdata(flag)
end

-- 刷新我的宝箱时间
function AdventureHomeLayer:leftTimeUpdata(flag)
    local flag = flag or nil;
    for i = 1,4 do
        local itemBox = self.myBagBoxList[i]
        if itemBox.updataFlag then
            local txt_xianshi = self.txt_xianshi[i]
            local txt_num = self.txt_num[i]
            local index = i 
            local num = #self.myBagBoxList[index]

            if not self.leftTime[index] then
                self.leftTime[index] = self:getLeftTimerMix(index)
                if self.leftTime[index] > 0 then 
                    self.leftTime[index] = self.lefthour*60*60 - (MainPlayer:getNowtime() - self.leftTime[index]/1000)
                else
                    self.leftTime[index] = 0
                end
            end
            if not flag then
                self.leftTime[index] = self.leftTime[index] - 60
            end

            for i = 1 , num do
                local breakFlag = nil
                if self.leftTime[index] <= 0 then
                    self.myBagBoxIndexList[index] = self.myBagBoxIndexList[index] + 1
                    if self.myBagBoxIndexList[index] > num then
                        self.img_boxList[index]:setTouchEnabled(false)
                        -- self.myBagBoxIndexList[index] = self.myBagBoxIndexList[index]
                        self.myBagBoxList[index].updataFlag = false
                    end
                    self.leftTime[index] = self:getLeftTimerMix(index)
                    if self.leftTime[index] > 0 then 
                        self.leftTime[index] = self.lefthour*60*60 - (MainPlayer:getNowtime() - self.leftTime[index]/1000)
                    else
                        self.leftTime[index] = 0
                    end
                    if self.leftTime[index] > 0 then
                        breakFlag = true
                    end
                end
                if breakFlag then
                    break
                end
            end
    
            local hour,min = 0,0
            if self.leftTime[index] > 0 then
                hour,min = math.modf(self.leftTime[index]/(60*60))
                min = math.floor(min*60)
            end
            local timeStr = string.format("%02d:%02d",hour,min)
            txt_xianshi:setText(stringUtils.format(localizable.youli_maibao_xianshi,timeStr))

            num = num - self.myBagBoxIndexList[index] + 1
            if num < 0 then
                num = 0
            end
            txt_num:setText(num);
        end
    end 
end


-- 寻找我的宝箱最小时间
function AdventureHomeLayer:getLeftTimerMix(index)
    local list = self.myBagBoxList[index]
    local length = #list
    local i = self.myBagBoxIndexList[index]
    if i > length then
        return 0
    else
        return list[i].getTime
    end 
end

-- 点击宝箱回调
function AdventureHomeLayer.cellClickHandle(sender)
    local self = sender.logic;
    -- local path = "ui_new/youli/wabao/img_box"..sender.index..".png"
    -- self.bury_img_box:setTexture(path);
    -- self.bury_img_box:setVisible(true);
end
-- 触摸宝箱开始回调
function AdventureHomeLayer.cellTouchBeganHandle(cell)
    local self = cell.logic;
    self.buryBoxMoveDir = false;
    if self.buryPanelBox then
        self.buryPanelBox:setVisible(false)
        self.buryPanelBox:removeFromParent()
        self.buryPanelBox = nil
    end
end
-- 触摸移动宝箱回调
function AdventureHomeLayer.cellTouchMovedHandle(cell)
    local self = cell.logic;
    local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());
    local pos = cell:getTouchMovePos();
    if self.selectCussor == nil then
        if (cell.index ~= 0) then
            if (v.x < 30 and v.x > -30) and (v.y < 30 and v.y > -30) then
               return;
            end
        end
        if cell.index ~= 0 then
            self:createSelectCussor(cell,pos);
        end
    end
    
    self:moveSelectCussor(cell,pos);
end
-- 触摸移动结束回调
function AdventureHomeLayer.cellTouchEndedHandle(cell)
    local self = cell.logic;

     if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end
    if self.buryBoxMoveDir then
        self.selectIndex = cell.index
        local index = cell.index
        
        local i = self.myBagBoxIndexList[index]
        local list = self.myBagBoxList[index]
        self.buryBoxItemId = list[i].id
        local path = "ui_new/youli/wabao/img_box"..cell.index..".png"
        self.bury_img_box:setTexture(path);
        self.bury_img_box:setVisible(true);
        local pos = cell:getTouchEndPos();
        self:onBuryTreasureMapClick( pos )
    end
end

-- 埋宝地图点击
function AdventureHomeLayer:onBuryTreasureMapClick( pos )
    -- print("AdventureHomeLayer:onBuryTreasureMapClick", pos)
    -- self.bury_img_box:setVisible(false);
    local tMapIndex = self:calcPosToIndex( pos )
    self.maibaoMapPos = tMapIndex;
    local uiSize = self.ui:getContentSize()
    local mapSize = self.panel_touch:getContentSize()
    local nBlockPixel = ConstantData:getValue("AdventureTreasurePxPerBlock")
    local blockPosX = nBlockPixel * tMapIndex.x - mapSize.width / 2 - nBlockPixel / 2
    local blockPosY = nBlockPixel * tMapIndex.y - mapSize.height / 2 - nBlockPixel / 2

    -- local blockPosX1 = pos.x - uiSize.width / 2 + nBlockPixel / 2
    -- local blockPosY1 = pos.y - uiSize.height / 2 + nBlockPixel / 2

    local index = self.selectIndex
    local path = "ui_new/youli/wabao/img_box"..index..".png"
    self.bury_img_box:setTexture(path)

    local buryPanelBox = self.bury_panel_box:clone()
    self.bury_btn_quxiao = TFDirector:getChildByPath(buryPanelBox, "btn_quxiao")
    self.bury_btn_queding = TFDirector:getChildByPath(buryPanelBox, "btn_queding")
    self.bury_btn_quxiao.logic = self
    self.bury_btn_quxiao:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onCancelClickHandle))
    self.bury_btn_queding.logic = self
    self.bury_btn_queding:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onSureClickHandle))

    

    buryPanelBox:setPosition(ccp( blockPosX, blockPosY))
    buryPanelBox:setAnchorPoint(ccp(0.5, 0.5))
    buryPanelBox:removeFromParent();
    self.panel_touch:addChild( buryPanelBox,1 )
    self.buryPanelBox = buryPanelBox
    self.buryPanelBox:setVisible(true);
    self.buryPanelBox:setTouchEnabled(true)
    self.buryPanelBox.logic = self
    self.buryPanelBox:addMEListener(TFWIDGET_TOUCHBEGAN, self.boxTouchBeganHandle,1);
    self.buryPanelBox:addMEListener(TFWIDGET_TOUCHMOVED, self.boxTouchMovedHandle);
    self.buryPanelBox:addMEListener(TFWIDGET_TOUCHENDED, self.boxTouchEndedHandle);
    self.buryPanelBox.index = 100

    -- 点击地 宝藏标识
    local buryBox = self.bury_panel_wz:clone()
    local img_wz1 = TFDirector:getChildByPath(buryBox, "img_wz1")
    local img_wz2 = TFDirector:getChildByPath(buryBox, "img_wz2")
    local img_box;
    if index == 1 or index == 3 then
        img_wz2:setVisible(true)
        img_box = TFDirector:getChildByPath(img_wz2, "img_box")
        img_box:setTexture(path);
    elseif index == 2 or index == 4 then
        img_wz1:setVisible(true)
        img_box = TFDirector:getChildByPath(img_wz1, "img_box")
        img_box:setTexture(path);
    end
    buryBox:setPosition(ccp( blockPosX, blockPosY - 10))    --美术大佬说宝藏标识有点偏高，降低一点
    buryBox:setAnchorPoint(ccp(0.5, 0))
    buryBox:removeFromParent();
    self.myBuryBox = buryBox

    table.insert( self.myBuryBoxList, self.myBuryBox)
    self.panel_touch:addChild( buryBox,1 )
    self.panel_touch:setTouchEnabled(false)
end

-- 触摸宝箱控件开始回调
function AdventureHomeLayer.boxTouchBeganHandle(cell)
    local self = cell.logic;
    self.buryPanelBox:setVisible(false)
end
-- 触摸移动宝箱控件回调
function AdventureHomeLayer.boxTouchMovedHandle(cell)
    local self = cell.logic;
    local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());
    local pos = cell:getTouchMovePos();
    if self.selectCussor == nil then
        if cell.index ~= 0 then
            self:createSelectbox(cell,pos);
        end
    end
    
    self:moveSelectbox(cell,pos);
end
-- 触摸移动宝箱控件结束回调
function AdventureHomeLayer.boxTouchEndedHandle(cell)
    local self = cell.logic;

     if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end
    local index = self.selectIndex
        
    local i = self.myBagBoxIndexList[index]
    local list = self.myBagBoxList[index]
    self.buryBoxItemId = list[i].id
    local path = "ui_new/youli/wabao/img_box"..cell.index..".png"
    self.bury_img_box:setTexture(path);
    self.bury_img_box:setVisible(true);
    local pos = cell:getTouchEndPos();
    self:onBuryTreasureMapClick( pos )
end

-- 埋宝移动宝箱控件添加图片到触摸点
function AdventureHomeLayer:createSelectbox(cell,pos)
    self.lastPoint = pos;
    
    self.selectCussor = self.buryPanelBox:clone()
    self.selectCussor:removeFromParent()
    self.selectCussor:setPosition(pos);
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);
end

-- 埋宝移动宝箱控件移动触摸点图片
function AdventureHomeLayer:moveSelectbox(cell,pos)
    local v = ccpSub(pos, self.lastPoint);
    self.lastPoint = pos;
    local scp = ccpAdd(self.selectCussor:getPosition(), v);
    self.selectCussor:setPosition(scp);
    self.selectCussor:setVisible(true);
end

-- 埋宝移动宝箱添加图片到触摸点
function AdventureHomeLayer:createSelectCussor(cell,pos)
    self.lastPoint = pos;
    self.buryBoxMoveDir = true
    local path = "ui_new/youli/wabao/img_box"..cell.index..".png"
    self.selectCussor = TFImage:create();
    self.selectCussor:setTexture(path);
    self.selectCussor:setPosition(pos);
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);
end

-- 埋宝移动宝箱移动触摸点图片
function AdventureHomeLayer:moveSelectCussor(cell,pos)
    local v = ccpSub(pos, self.lastPoint);
    self.lastPoint = pos;
    local scp = ccpAdd(self.selectCussor:getPosition(), v);
    self.selectCussor:setPosition(scp);
    self.selectCussor:setVisible(true);
end

-- 埋宝取消回调
function AdventureHomeLayer:onCancelClickHandle(sender)
    local self = sender.logic
    self.buryPanelBox:setVisible(false);
    self.bury_img_box:setVisible(false);
    self.panel_touch:setTouchEnabled(true)
end
-- 匿名点击回调
function AdventureHomeLayer:onAnonymousClickHandle(sender)
    local self = sender.logic
    if self.checkFlag == 1 then
        self.checkFlag = 0;
    else
        self.checkFlag = 1;
    end
end
-- 埋宝确定回调
function AdventureHomeLayer:onSureClickHandle(sender)
    local self = sender.logic

    local msg
    if self.checkFlag == 1 then 
        msg = localizable.youli_maibao_tips1--"是否匿名在这点埋宝"
    else
        msg = localizable.youli_maibao_tips2--"是否在这点埋宝"
    end
    CommonManager:showOperateSureLayer(function()
        -- print("-----------------onSureClickHandle:self.maibaoMapPos--------------",self.maibaoMapPos)
        AdventureTreasureManager:requestBuryTreasure( self.maibaoMapPos, self.checkFlag, self.buryBoxItemId)
    end,
    function()
        AlertManager:close();
        self.buryPanelBox:setVisible(false);
        self.bury_img_box:setVisible(false);
        self.panel_touch:setTouchEnabled(true)
    end,
    {
        msg = msg,
    })
end

-- 埋宝成功
function AdventureHomeLayer:burySuccess()
    
    self.myBuryBox:setVisible(true)
    if self.buryPanelBox then
        self.buryPanelBox:setVisible(false);
    end
    self.bury_img_box:setVisible(false);
    self.panel_touch:setTouchEnabled(true)

    local index = self.selectIndex
    local list = self.myBagBoxList[index]
    local i = self.myBagBoxIndexList[index]
    table.remove(list, i)
    self:refreshMaiBaoLayerboxUI(1)
end

-- 屏幕坐标转换地图块index (地图左下角为起点)
function AdventureHomeLayer:calcPosToIndex( pos )
    local tMapPos = {} -- 相对于地图左下角的坐标
    local tMapIndex = {}    -- 相对于地图左下角的坐标的格子数
    local uiSize = self.ui:getContentSize()
    local mapSize = self.panel_touch:getContentSize()
    local nBlockPixel = ConstantData:getValue("AdventureTreasurePxPerBlock")
    tMapPos.x = pos.x - uiSize.width / 2 - self.panel_touch:getPositionX() + mapSize.width / 2
    tMapPos.y = pos.y - uiSize.height / 2 - self.panel_touch:getPositionY() + mapSize.height / 2

    tMapIndex.x = math.ceil(tMapPos.x / nBlockPixel)
    tMapIndex.y = math.ceil(tMapPos.y / nBlockPixel)

    return tMapIndex
end

-- 地图坐标 转换为 地图块
function AdventureHomeLayer:getMapIndexByPos( pos )
    local tRet = {}
    local nBlockPixel = ConstantData:getValue("AdventureTreasurePxPerBlock")
    local mapSize = self.panel_touch:getContentSize()

    -- 宝藏行列的最大值
    local mapMax = {}
    mapMax.x = math.floor(mapSize.width / nBlockPixel)
    mapMax.y = math.floor(mapSize.height / nBlockPixel)

    tRet.x = math.ceil(pos.x / nBlockPixel)
    tRet.y = math.ceil(pos.y / nBlockPixel)

    if tRet.x > mapMax.x then
        tRet.x = mapMax.x
    end
    if tRet.y > mapMax.y then
        tRet.y = mapMax.y
    end

    return tRet
end
return AdventureHomeLayer