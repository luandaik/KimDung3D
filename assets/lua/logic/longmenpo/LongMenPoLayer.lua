-- client side LongMenPoLayer.lua
--[[
 * @Description: 龙门破图层
 ]]
-- script writer chikui
-- creation time 2016-06-02


local LongMenPoLayer = class("LongMenPoLayer", BaseLayer)

function LongMenPoLayer:ctor(data)
    self.super.ctor(self,data);
    self.fightType = EnumFightStrategyType.StrategyType_PVE
    self.time = 0
    self:init("lua.uiconfig_mango_new.longmenpo.LongMenPo")
end

function LongMenPoLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.LongMenPo,{HeadResType.KUNLUNYU,HeadResType.XIHUANGDIE,HeadResType.SYCEE})

    self.panel_you      = TFDirector:getChildByPath(ui, 'panel_you')
    self.txt_name       = TFDirector:getChildByPath(ui, 'txt_tongbi')
    self.txt_time       = TFDirector:getChildByPath(ui, 'txt_time')
    self.txt_time:setText("")
    self.panel_1        = TFDirector:getChildByPath(self.panel_you, 'panel_1')
    self.panel_2        = TFDirector:getChildByPath(self.panel_you, 'panel_2')
    self.panel_2:setVisible(false)

    self.panel_item_1   = TFDirector:getChildByPath(self.panel_1, 'panel_item')
    self.panel_box_1    = TFDirector:getChildByPath(self.panel_1, 'panel_box')
    self.panel_item_2   = TFDirector:getChildByPath(self.panel_2, 'panel_item')
    self.panel_box_2    = TFDirector:getChildByPath(self.panel_2, 'panel_box')

    self.ItemList_1     = {}
    self.ItemList_2     = {}
    self.BoxList_1      = {}
    self.BoxList_2      = {}
    for i=1,9 do
        self.ItemList_1[i] = {}
        self.ItemList_1[i].bg = TFDirector:getChildByPath(self.panel_item_1, 'img_' .. i)
        self.ItemList_1[i].item = TFDirector:getChildByPath(self.ItemList_1[i].bg, 'item')

        self.ItemList_2[i] = {}
        self.ItemList_2[i].bg = TFDirector:getChildByPath(self.panel_item_2, 'img_' .. i)
        self.ItemList_2[i].item = TFDirector:getChildByPath(self.ItemList_2[i].bg, 'item')
        
        self.BoxList_1[i] = {}
        self.BoxList_1[i].node = TFDirector:getChildByPath(self.panel_box_1, 'node_' .. i)
        self.BoxList_1[i].img = TFDirector:getChildByPath(self.BoxList_1[i].node, 'img')
        self.BoxList_1[i].img:setTouchEnabled(true)

        self.BoxList_2[i] = {}
        self.BoxList_2[i].node = TFDirector:getChildByPath(self.panel_box_2, 'node_' .. i)
        self.BoxList_2[i].img = TFDirector:getChildByPath(self.BoxList_2[i].node, 'img')
        self.BoxList_2[i].img:setTouchEnabled(true)
    end

    self.ItemPath = {"ui_new/longmenpo/img_bx.png","ui_new/longmenpo/img_jn.png"}
    self.BgPath = {"ui_new/longmenpo/img_di.png","ui_new/longmenpo/img_xianjin.png"}

    self.Node_Award = {}
    for i=1,9 do
        self.Node_Award[i] = {}
        local rootNode = TFDirector:getChildByPath(ui, 'panel_jiangli' .. i)
        self.Node_Award[i].bg_icon = TFDirector:getChildByPath(rootNode, 'bg_icon')
        self.Node_Award[i].bg_icon:setTouchEnabled(true)
        self.Node_Award[i].img_icon = TFDirector:getChildByPath(rootNode, 'img_icon')
        self.Node_Award[i].txt_num = TFDirector:getChildByPath(rootNode, 'txt_num')
    end
    ---------------------------------------------------------------------------------
    self.panel_jz   = TFDirector:getChildByPath(ui, 'panel_jz')
    self.txt_jz     = TFDirector:getChildByPath(self.panel_jz, 'txt_num1')

    self.panel_kly  = TFDirector:getChildByPath(ui, 'panel_kly')
    self.txt_kly    = TFDirector:getChildByPath(self.panel_kly, 'txt_num1')

    self.panel_xhd  = TFDirector:getChildByPath(ui, 'panel_xhd')
    self.txt_xhd    = TFDirector:getChildByPath(self.panel_xhd, 'txt_num1')

    self.txt_pz         = TFDirector:getChildByPath(ui, 'txt_pz')
    self.txt_challenge  = TFDirector:getChildByPath(self.txt_pz, 'txt_num')
    ---------------------------------------------------------------------------------
    self.btn_help       = TFDirector:getChildByPath(ui, 'btn_help')
    self.btn_pozhen     = TFDirector:getChildByPath(ui, 'btn_pozhen')
    self.img_price_bg   = TFDirector:getChildByPath(self.btn_pozhen, 'img_price_bg')
    self.txt_price      = TFDirector:getChildByPath(self.btn_pozhen, 'txt_numb')

    self.btn_sy         = TFDirector:getChildByPath(ui, 'btn_sy')
    self.txt_sy         = TFDirector:getChildByPath(self.btn_sy, 'txt_numb1')

    self.btn_shuaxin    = TFDirector:getChildByPath(ui, 'btn_shuaxin')
    ------->>>>>>>盒子特效层
    self.panel_arm = CCNode:create()
    self.panel_you:addChild(self.panel_arm,100)
    self.panel_arm:setPosition(self.panel_box_1:getPosition())
    self:initArmture()
    ------->>>>>>>
    self.panel_dt       = TFDirector:getChildByPath(ui, 'panel_dt')
    self.msgcellmodel   = TFDirector:getChildByPath(self.panel_dt, 'panel_cell')
    self.msgcellmodel:removeFromParent()
    self.msgcellmodel:retain()

    self:drawPushMsgList()
    self.panel_main     = self.panel_1
    self.panel_index    = 1
end

function LongMenPoLayer:removeUI()
    self.super.removeUI(self)
    if self.msgcellmodel then
        self.msgcellmodel:release()
        self.msgcellmodel = nil
    end
end

function LongMenPoLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end

    self.super.dispose(self)
end

function LongMenPoLayer:onShow()
	self.super.onShow(self)
	self.generalHead:onShow()
    if self.isShowReward == true then
        self.isShowReward = false
        self:NextFloor()
    end
end

function LongMenPoLayer:refreshUI()
end

function LongMenPoLayer:registerEvents(ui)
	self.super.registerEvents(self)

    for i=1,9 do
        self.BoxList_1[i].img.logic = self
        self.BoxList_1[i].img.idx = i
        self.BoxList_1[i].img:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBoxClick))

        self.BoxList_2[i].img.logic = self
        self.BoxList_2[i].img.idx = i
        self.BoxList_2[i].img:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBoxClick))
    end
    self.btn_pozhen.logic = self
    self.btn_pozhen:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBreakStartClick))
    Public:addBtnWaterEffect(self.btn_pozhen,true)
    self.btn_sy.logic = self
    self.btn_sy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onItem_1UseClick))
    self.btn_shuaxin.logic = self
    self.btn_shuaxin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRefreshAwardClick))
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnRuleClick))
    --self.generalHead.btn_return.logic = self
    --self.generalHead.btn_return:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onExitClick,play_fanhui),1)
    -----------------------------------------------------------------------------------------
    self.onFloorInfoHandler = function(event)
        if self.isReShowInfo == true then
            self.isReShowInfo = false
            self:drawFloorInfo()
            return
        end
        self:restartInfoCallBack()
        self:drawAward(0)
    end;
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_FLOOR_INFO ,self.onFloorInfoHandler)

    self.onBreakStartHandler = function(event)
        self.floorId = 1
        local curInfo = LongMenPoManager:getCurInfo()
        self.txt_challenge:setText(curInfo.challengeCount)
        self:drawFloor(1)
    end;
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_BREAK_START ,self.onBreakStartHandler)


    self.onBreakClickHandler = function(event)
        self:drawPoint(event.data[1])
        self:boxClicked(event.data[1])
    end;
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_BREAK_CLICK ,self.onBreakClickHandler)

    self.onRefreshAwardHandler = function(event)
        if event.data[1].brushFloorId == self.floorId then
            self:drawFloor(self.floorId)
        end
        self:drawAward(event.data[1].brushFloorId)
        self.isFreshAward = false
    end;
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_REFRESH_AWARD ,self.onRefreshAwardHandler)

    self.onUseItem_1Handler = function(event)
        self:drawPoint(event.data[1])
        self:Item_1CallBack(event.data[1].index)
        self:brushItemNum()
    end;
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_USE_ITEM_1 ,self.onUseItem_1Handler)

    self.onUseItem_2Handler = function(event)
        if event.data[1].isRevive == true then
            self:Item_2CallBack()
            self:brushItemNum()
        end
    end;
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_USE_ITEM_2 ,self.onUseItem_2Handler)

    self.onUseItem_3Handler = function(event)
        self:drawAllPoint(event.data[1].typeList)
        self:Item_3CallBack()
        self:brushItemNum()
    end;
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_USE_ITEM_3 ,self.onUseItem_3Handler)

    self.onClear_24Handler = function(event)
        local curInfo = LongMenPoManager:getCurInfo()
        self.txt_challenge:setText(curInfo.challengeCount)
        if self.floorId == 0 and self.isDealBox == false then
            self:drawFloor(0)
        end
    end;
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_CLEAR_24 ,self.onClear_24Handler)

    self.onPushMsgHandler = function (event)
        self:drawPushMsgList()
    end
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_PUSH_MSG ,self.onPushMsgHandler)

    self.onShowFloorInfoHandler = function(event)
        self:drawAllPoint(event.data[1].typeList)
        self:Item_2FalseCallBack()
    end;
    TFDirector:addMEGlobalListener(LongMenPoManager.RECEIVE_SHOW_FLOOR_INFO ,self.onShowFloorInfoHandler)

    --购买成功通知
     self.buySuccessCallback = function (event)
        if event.data[1].state == 0 then
            if event.data[1].itemId == 30133 then
                if self.isQuestionItem2 == true then
                    LongMenPoManager:requestItem_2(self.floorId,1)
                else
                    self:brushItemNum()
                end
            elseif event.data[1].itemId == 30134 then
                if self.isQuestionItem3 == true then
                    LongMenPoManager:requestItem_3(self.floorId)
                else
                    self:brushItemNum()
                end
            else
                self:brushItemNum()
            end
        end
        self.isQuestionItem2 = false
        self.isQuestionItem3 = false
     end
    TFDirector:addMEGlobalListener(MallManager.ReceiveBuyLongMenPoResult, self.buySuccessCallback)



    local activity = OperationActivitiesManager:ActivityWithType(OperationActivitiesManager.Type_LongMenPo)
    if activity then
        self.time = activity.endTime - MainPlayer:getNowtime()
        if self.time <= 0 then
            self.time = 0
        end
    end

    if  self.end_timerID == nil then
        self.end_timerID = TFDirector:addTimer(1000, -1, nil, 
        function() 
            if self.end_timerID ~= nil then
                self:showNextTimer()
            end
        end)
    end

end

function LongMenPoLayer:removeEvents()
    if self.generalHead then
        self.generalHead:removeEvents()
    end

    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_FLOOR_INFO ,self.onFloorInfoHandler)
    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_BREAK_START ,self.onBreakStartHandler)
    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_BREAK_CLICK ,self.onBreakClickHandler)
    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_REFRESH_AWARD ,self.onRefreshAwardHandler)
    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_USE_ITEM_1 ,self.onUseItem_1Handler)
    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_USE_ITEM_2 ,self.onUseItem_2Handler)
    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_USE_ITEM_3 ,self.onUseItem_3Handler)
    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_CLEAR_24 ,self.onClear_24Handler)
    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_PUSH_MSG ,self.onPushMsgHandler)
    TFDirector:removeMEGlobalListener(LongMenPoManager.RECEIVE_SHOW_FLOOR_INFO ,self.onShowFloorInfoHandler)
    TFDirector:removeMEGlobalListener(MallManager.ReceiveBuyLongMenPoResult, self.buySuccessCallback)


    if self.end_timerID then
        TFDirector:removeTimer(self.end_timerID)
        self.end_timerID = nil
    end
    
    self.super.removeEvents(self)
end

function LongMenPoLayer:acDrawFloor(floorId)
    local tempPanel = self.panel_2
    tempPanel:setVisible(true)
    local panel_main = self.panel_1
    panel_main:setVisible(true)

    for k,v in pairs(self.ItemList_1) do
        self.ItemList_2[k].bg:setTexture(v.bg:getTexture())
        self.ItemList_2[k].item:setVisible(v.item:isVisible())
        self.ItemList_2[k].item:setTexture(v.item:getTexture())
    end
    for i=1,9 do
        self.BoxList_2[i].node:setVisible(false)
    end
    tempPanel:setPositionY(panel_main:getPositionY())
    panel_main:setPositionY(640)
    self.isDealBox = true
    local callFuncN = CCCallFuncN:create( function()
            self.isDealBox = false
        end
    )

    local acArr = TFVector:create()
    local moveAc = CCMoveTo:create(0.3,ccp(0,-5))
    acArr:addObject(CCShow:create())
    acArr:addObject(moveAc)
    moveAc = CCMoveTo:create(0.1,ccp(0,0))
    acArr:addObject(moveAc)
    acArr:addObject(callFuncN)
    panel_main:runAction(CCSequence:create(acArr))

    acArr = TFVector:create()
    moveAc = CCMoveTo:create(0.3,ccp(0,-640))
    acArr:addObject(moveAc)
    acArr:addObject(CCHide:create())
    tempPanel:runAction(CCSequence:create(acArr))

    self:drawFloor(floorId)
end

function LongMenPoLayer:acDrawFloor0(floorId)
    local tempPanel = self.panel_2
    tempPanel:setVisible(true)
    local panel_main = self.panel_1
    panel_main:setVisible(true)

    for k,v in pairs(self.ItemList_1) do
        self.ItemList_2[k].bg:setTexture(v.bg:getTexture())
        self.ItemList_2[k].item:setVisible(v.item:isVisible())
        self.ItemList_2[k].item:setTexture(v.item:getTexture())
    end
    for i=1,9 do
        self.BoxList_2[i].node:setVisible(false)
    end
    tempPanel:setPositionY(panel_main:getPositionY())
    panel_main:setPositionY(-640)
    self.isDealBox = true
    local callFuncN = CCCallFuncN:create( function()
            self.isDealBox = false
        end
    )

    local acArr = TFVector:create()
    local moveAc = CCMoveTo:create(0.3,ccp(0,5))
    acArr:addObject(CCShow:create())
    acArr:addObject(moveAc)
    moveAc = CCMoveTo:create(0.1,ccp(0,0))
    acArr:addObject(moveAc)
    acArr:addObject(callFuncN)
    panel_main:runAction(CCSequence:create(acArr))

    acArr = TFVector:create()
    moveAc = CCMoveTo:create(0.3,ccp(0,640))
    acArr:addObject(moveAc)
    acArr:addObject(CCHide:create())
    tempPanel:runAction(CCSequence:create(acArr))

    self:drawFloor(floorId)
end

function LongMenPoLayer:drawFloor(floorId)
    self.floorId = floorId
    if floorId == 0 then 
        floorId = 1 
    end
    local boxList = self:getBoxList()
    local itemList = self:getItemList()
    local floorInfo = LongMenPoManager:getFloorInfoById(floorId)
    for i=1,9 do
        boxList[i].node:setVisible(true)
        boxList[i].img:setVisible(true)
        itemList[i].bg:setTexture(self.BgPath[1])
        itemList[i].item:setVisible(false)
    end
    
    for i=1,9 do
        self.armList[i].arm:setVisible(false)
        boxList[i].arm:setVisible(false)
    end
    local strNum = EnumWuxueLevelType[floorId] or EnumWuxueLevelType[1]
    local floorName = stringUtils.format(localizable.ClimbMountainListLayer_floor_desc, strNum)
    self.txt_name:setText(floorName)
    self:brushItemNum()

    if self.floorId == 0 then
        for i=1,9 do
            boxList[i].effect:stop()
        end
        self.btn_pozhen:setVisible(true)
        local nconsume = LongMenPoManager:getBreakConsume()
        if nconsume > 0 then
            self.txt_price:setText(nconsume)
            self.img_price_bg:setVisible(true)
            CommonManager:setRedPoint(self.btn_pozhen, false,"longmenpo_free",ccp(0,0))
        else
            self.txt_price:setText(localizable.common_free)
            self.img_price_bg:setVisible(false)
            CommonManager:setRedPoint(self.btn_pozhen, true,"longmenpo_free",ccp(0,0))
        end
        self.btn_sy:setVisible(false)
    else
        for i=1,9 do
            boxList[i].effect:resume()
        end
        self.btn_pozhen:setVisible(false)
        self.btn_sy:setVisible(true)
    end
end

function LongMenPoLayer:drawFloor0(floorId)
    self.floorId = floorId
    if floorId == 0 then 
        floorId = 1 
    end
    local boxList = self:getBoxList()
    local itemList = self:getItemList()
    local floorInfo = LongMenPoManager:getFloorInfoById(floorId)
    for i=1,9 do
        boxList[i].node:setVisible(true)
        boxList[i].img:setVisible(true)
        boxList[i].img:setOpacity(255)
        itemList[i].bg:setTexture(self.BgPath[1])
        itemList[i].item:setVisible(false)
    end
    local curInfo = LongMenPoManager:getCurInfo()
    for i,v in ipairs(curInfo.point or {}) do
        local index = v + 1
        itemList[index].bg:setTexture(self.BgPath[2])
        boxList[index].node:setVisible(false)
    end
    self.panel_1:stopAllActions()
    self.panel_1:setPositionY(0)
    self.panel_2:stopAllActions()
    self.panel_2:setPositionY(-640)

    for i=1,9 do
        self.armList[i].arm:setVisible(false)
        boxList[i].arm:setVisible(false)
    end
    local strNum = EnumWuxueLevelType[floorId] or EnumWuxueLevelType[1]
    local floorName = stringUtils.format(localizable.ClimbMountainListLayer_floor_desc, strNum)
    self.txt_name:setText(floorName)
    self:brushItemNum()

    if self.floorId == 0 then
        for i=1,9 do
            boxList[i].effect:stop()
        end
        self.btn_pozhen:setVisible(true)
        local nconsume = LongMenPoManager:getBreakConsume()
        if nconsume > 0 then
            self.txt_price:setText(nconsume)
            self.img_price_bg:setVisible(true)
            CommonManager:setRedPoint(self.btn_pozhen, false,"longmenpo_free",ccp(0,0))
        else
            self.txt_price:setText(localizable.common_free)
            self.img_price_bg:setVisible(false)
            CommonManager:setRedPoint(self.btn_pozhen, true,"longmenpo_free",ccp(0,0))
        end
        self.btn_sy:setVisible(false)
    else
        for i=1,9 do
            boxList[i].effect:resume()
        end
        self.btn_pozhen:setVisible(false)
        self.btn_sy:setVisible(true)
    end
end

function LongMenPoLayer:drawAward(brushFloorId)
    local floorInfoList = LongMenPoManager:getFloorInfo() or {}
    for i=1,#floorInfoList do
        local awardInfo = floorInfoList[i].item
        local rewardItem =  BaseDataManager:getReward(awardInfo)
        self.Node_Award[i].bg_icon:setTexture(GetColorIconByQuality(rewardItem.quality))
        function onClick( sender )
            Public:ShowItemTipLayer(rewardItem.itemid, rewardItem.type);
        end
        self.Node_Award[i].bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
        self.Node_Award[i].img_icon:setTexture(rewardItem.path)

        Public:addPieceImg(self.Node_Award[i].img_icon,rewardItem,nil,1)
        self.Node_Award[i].txt_num:setText(rewardItem.number)
        if self.isFreshAward == true and brushFloorId and brushFloorId <= i then
            self:addGetEffect(self.Node_Award[i].bg_icon)
        end
    end
end

function LongMenPoLayer:addGetEffect(node)
    local filePath = "effect/ui/gamble_stone.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(filePath)
    local effect = TFArmature:create("gamble_stone_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)
    local contentSize = node:getContentSize()
    effect:setPosition(ccp(contentSize.width * 0.5,contentSize.height * 0.5))
    effect:setZOrder(10)
    node:addChild(effect)
    node.effect = effect
    local step = 1
    effect:addMEListener(TFARMATURE_UPDATE,function()
        step = step + 1
        if step == 14 then 
            node:setVisible(true)
            effect:removeMEListener(TFARMATURE_UPDATE)
            
        end
        end)
end

function LongMenPoLayer:getItemPath(awardInfo)
    local path = ""
    local qualityPath = ""
    if awardInfo.type ~= 1 then
        path = GetResourceIcon(awardInfo.type)
        qualityPath = GetResourceQualityBG(awardInfo.type)
    else
        local item = ItemData:objectByID(awardInfo.itemId)
        path = item:GetPath()
        qualityPath = GetColorIconByQuality(item.quality)
    end
    return {path,qualityPath}
end

function LongMenPoLayer:initArmture()
    self.armList = {}

    local resPath = "effect/lmp_ac2.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect1 = TFArmature:create("lmp_ac2_anim")
    effect1:setAnimationFps(GameConfig.ANIM_FPS)

    resPath = "effect/lmp_ac3.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect2 = TFArmature:create("lmp_ac3_anim")
    effect2:setAnimationFps(GameConfig.ANIM_FPS)

    resPath = "effect/lmp_ac4.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect3 = TFArmature:create("lmp_ac4_anim")
    effect3:setAnimationFps(GameConfig.ANIM_FPS)

    resPath = "effect/lmp_ac6.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect4 = TFArmature:create("lmp_ac6_anim")
    effect4:setAnimationFps(GameConfig.ANIM_FPS)
    for i=1,9 do
        if effect1 then
            self.BoxList_1[i].arm = effect1:clone()
            self.BoxList_2[i].arm = effect1:clone()
        end

        self.armList[i] = {}
        if effect2 then
            self.armList[i].arm = effect2:clone()
        end

        if effect3 then
            self.armList[i].arm0 = effect3:clone()
        end

        if effect4 then
            self.armList[i].arm1 = effect4:clone()
        end
    end
    
    for i=1,9 do
        local pos = self.BoxList_1[i].node:getPosition()
        pos.y = pos.y - 12
        local nZorder = 2 * math.ceil(i/3)

        if self.BoxList_1[i].arm then
            self.panel_box_1:addChild(self.BoxList_1[i].arm,nZorder)
            self.BoxList_1[i].arm:setPosition(pos)
            self.BoxList_1[i].arm:setVisible(false)

            self.BoxList_1[i].arm:addMEListener(TFARMATURE_COMPLETE,function()
                self.BoxList_1[i].arm:setVisible(false)
            end)
        end

        if self.BoxList_2[i].arm then
            self.panel_box_2:addChild(self.BoxList_2[i].arm,nZorder)
            self.BoxList_2[i].arm:setPosition(pos)
            self.BoxList_2[i].arm:setVisible(false)

            self.BoxList_2[i].arm:addMEListener(TFARMATURE_COMPLETE,function()
                self.BoxList_2[i].arm:setVisible(false)
            end)
        end

        if self.armList[i].arm then
            self.panel_arm:addChild(self.armList[i].arm,nZorder)
            self.armList[i].arm:setPosition(pos)
            self.armList[i].arm:setVisible(false)

            self.armList[i].arm:addMEListener(TFARMATURE_COMPLETE,function()
                self.armList[i].arm:setVisible(false)
            end)
        end

        if self.armList[i].arm0 then
            self.panel_arm:addChild(self.armList[i].arm0,nZorder)
            self.armList[i].arm0:setPosition(pos)
            self.armList[i].arm0:setVisible(false)

            self.armList[i].arm0:addMEListener(TFARMATURE_COMPLETE,function()
                self.armList[i].arm0:setVisible(false)
            end)
        end

        if self.armList[i].arm1 then
            self.panel_arm:addChild(self.armList[i].arm1,nZorder)
            self.armList[i].arm1:setPosition(pos)
            self.armList[i].arm1:setVisible(false)

            self.armList[i].arm1:addMEListener(TFARMATURE_COMPLETE,function()
                self.armList[i].arm1:setVisible(false)
            end)
        end
    end

    resPath = "effect/lmp_ac1.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("lmp_ac1_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)

    for i=1,9 do
        local ef = effect:clone()
        self.BoxList_1[i].node:addChild(ef)
        self.BoxList_1[i].effect = ef
        ef:setPosition(ccp(0,2))
        ef:playByIndex(0, -1, -1, 1)

        ef = effect:clone()
        self.BoxList_2[i].node:addChild(ef)
        self.BoxList_2[i].effect = ef
        ef:setPosition(ccp(0,2))
        ef:playByIndex(0, -1, -1, 1)
    end

    resPath = "effect/lmp_ac5.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    effect = TFArmature:create("lmp_ac5_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(960*0.5,640*0.5)
    self.failedEffect = effect
    self.failedEffect:setVisible(false)
    self.failedEffect:addMEListener(TFARMATURE_COMPLETE,function()
        self.failedEffect:setVisible(false)
    end)
    self.panel_you:addChild(effect,100)

    resPath = "effect/lmp_ac7.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    effect = TFArmature:create("lmp_ac7_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(960*0.5,640*0.5)
    self.successEffect = effect
    self.successEffect:setVisible(false)
    self.successEffect:addMEListener(TFARMATURE_COMPLETE,function()
        self.successEffect:setVisible(false)
    end)
    self.panel_you:addChild(effect,100)
end

----------------------------------------------------------------------------------
function LongMenPoLayer.onBoxClick(sender)
    local self = sender.logic
    if self.floorId <= 0 then
        toastMessage(localizable.LongMenPoLayer_txt9)
        return
    end
    if self.isDealBox == true then
        return
    end
    LongMenPoManager:requestBreakClick(self.floorId,sender.idx)
end

function LongMenPoLayer.onItem_1UseClick( sender )
    local self = sender.logic
    if self.floorId <= 0 or self.isDealBox == true then
        return
    end
    if LongMenPoManager:haveJiGuan(self.floorId) == false then
        toastMessage(localizable.LongMenPoLayer_txt5)
        return
    end
    local nItemCanUse = LongMenPoManager:isItemCanUse(LongMenPoManager.Item_1,self.floorId)
    if     nItemCanUse == 0 then
        CommonManager:showOperateSureLayer(
            function()
                LongMenPoManager:requestItem_1(self.floorId)
            end,
            nil,
            {
                msg = localizable.LongMenPoLayer_txt1
            }
        )
        
    elseif nItemCanUse == 1 then
        MallManager:showBuyLMPItem(30132,nil,nil)
    elseif nItemCanUse == 2 then
        toastMessage(localizable.LongMenPoLayer_txt2)
    end
end

function LongMenPoLayer.onBreakStartClick( sender )
    local self = sender.logic
    local costValue = LongMenPoManager:getBreakConsume()
    local resValue = MainPlayer:getResValueByType(EnumDropType.SYCEE)

    if LongMenPoManager.break_start_cost_tip == true or costValue <= 0 then
        if resValue < costValue then
            toastMessage(localizable.common_your_yuanbao)
        else
            LongMenPoManager:requestBreakStart()
        end
        return
    end

    CommonManager:showOperateSureTipLayer(
        function(data, widget)
            if resValue < costValue then
               toastMessage(localizable.common_your_yuanbao)
            else
                LongMenPoManager:requestBreakStart()
            end
            LongMenPoManager.break_start_cost_tip = widget:getSelectedState() or false;
        end,
        function(data, widget)
            AlertManager:close()
            LongMenPoManager.break_start_cost_tip = widget:getSelectedState() or false;
        end,
        {
            title=localizable.TreasureMain_tips1,
            msg=stringUtils.format(localizable.LongMenPoLayer_txt13,costValue),
            showtype = AlertManager.BLOCK_AND_GRAY
        }
    )
end

function LongMenPoLayer.onRefreshAwardClick( sender )
    local self = sender.logic
    if self.isDealBox == true then
        return
    end
    local isCanBrush = LongMenPoManager:isCanBrush(self.floorId)
    if isCanBrush == 1 then
        toastMessage(localizable.LongMenPoLayer_txt14)
        return
    end
    local warningMsg = stringUtils.format(localizable.LongMenPoLayer_txt4,LongMenPoManager:getBrushConsume())
    CommonManager:showOperateSureLayer(
        function()
            if MainPlayer:isEnough(EnumDropType.SYCEE,LongMenPoManager:getBrushConsume()) == true then
                self.isFreshAward = true
                LongMenPoManager:requestRefreshAward()
            end
        end,
        nil,
        {
            msg = warningMsg
        }
    )
end

function LongMenPoLayer.onExitClick( sender )
    local self = sender.logic
    if self.floorId <= 0 then
        AlertManager:close(AlertManager.TWEEN_1);
    else
        local warningMsg = localizable.LongMenPoLayer_txt6
        CommonManager:showOperateSureLayer(
            function()
                AlertManager:close(AlertManager.TWEEN_1);
            end,
            nil,
            {
                msg = warningMsg
            }
        )
    end
end

function LongMenPoLayer.OnRuleClick( sender )
    CommonManager:showRuleLyaer('longmenpo')
end
----------------------------------------------------------------------------------

function LongMenPoLayer:openBox(idx,type)
    if type and type == 1 then
        self.armList[idx].arm1:playByIndex(0, -1, -1, 0)
        self.armList[idx].arm1:setVisible(true)
    else
        self.armList[idx].arm:playByIndex(0, -1, -1, 0)
        self.armList[idx].arm:setVisible(true)
    end

    local boxList = self:getBoxList()
    boxList[idx].img:setVisible(false)
    local action = CCSequence:createWithTwoActions(CCDelayTime:create(1),CCHide:create())
    boxList[idx].node:runAction(action)

    boxList[idx].arm:playByIndex(0, -1, -1, 0)
    boxList[idx].arm:setVisible(true)

    local itemList = self:getItemList()
    if itemList[idx].item:isVisible() == true then
        itemList[idx].item:runAction(CCFadeIn:create(1))
    end
end

function LongMenPoLayer:boxClicked( data )
    self.isDealBox = true
    local idx = data.index
    self:openBox(idx)
    local floorInfo = LongMenPoManager:getFloorInfoById(self.floorId)
    local delay = CCDelayTime:create(2)

    if data.type == 2 then
        self.armList[idx].arm0:playByIndex(0, -1, -1, 0)
        self.armList[idx].arm0:setVisible(true)
        local delay0 = CCDelayTime:create(1.5)
        local callFunc = CCCallFunc:create(function()
            self.failedEffect:setVisible(true)
            self.failedEffect:playByIndex(0, -1, -1, 0)
        end)
        self.panel_arm:runAction(CCSequence:createWithTwoActions(delay0,callFunc))
        delay = CCDelayTime:create(3.5)
    end
    local callFunc = CCCallFunc:create(function()
        self:boxClickedCallFunc(data)
    end)
    self.panel_arm:runAction(CCSequence:createWithTwoActions(delay,callFunc))
end

function LongMenPoLayer:boxClickedCallFunc(data)
    local idx = data.index
    local isNeedQuest = true
    local floorInfo = LongMenPoManager:getFloorInfoById(self.floorId)
    if data.typeList and ( #data.typeList ) > 0 then
        for k,v in pairs(data.typeList) do
            local pointInfo = {}
            pointInfo.index = k
            pointInfo.type = v
            self:drawPoint(pointInfo)
        end
        isNeedQuest = false
    end
    if     data.type == 0 then

        local rewardList = TFArray:new();
        local rewardInfo = BaseDataManager:getReward(floorInfo.item)
        rewardList:push(rewardInfo);
        RewardManager:showRewardListLayer(rewardList)
        self.isShowReward = true
    elseif data.type == 1 then
        local rewardList = TFArray:new();
        for k,v in pairs(floorInfo.luckyBag) do
            local rewardInfo = BaseDataManager:getReward(v)
            rewardList:push(rewardInfo);
        end
        RewardManager:showRewardListLayer(rewardList)
        self.isShowReward = true
    elseif data.type == 2 then
        local nItemCanUse = LongMenPoManager:isItemCanUse(LongMenPoManager.Item_2,self.floorId)
        if nItemCanUse == 0 or nItemCanUse == 1 then
            self:questionItem_2()
        else
            nItemCanUse = LongMenPoManager:isItemCanUse(LongMenPoManager.Item_3,self.floorId)
            if nItemCanUse == 0 or nItemCanUse == 1 then
                self:questionItem_3()
            else
                if isNeedQuest == true then
                    LongMenPoManager:requestShowFloorInfo(self.floorId)
                else
                    self:Item_2FalseCallBack()
                end
                --toastMessage(localizable.LongMenPoLayer_txt10)
            end
        end
    end
    
end

function LongMenPoLayer:questionItem_2()
    local nItemCanUse = LongMenPoManager:isItemCanUse(LongMenPoManager.Item_2,self.floorId)
    local warningMsg = localizable.LongMenPoLayer_txt7
    self.isRevive = true
    CommonManager:showOperateSureLayer(
        function()
            if nItemCanUse == 0 then
                LongMenPoManager:requestItem_2(self.floorId,1)
                self.isRevive = false
            elseif nItemCanUse == 1 then
                local callFunc = function()
                    self.isQuestionItem2 = true
                    self.isRevive = false
                end
                local closeFunc = function()
                    self:questionItem_3()
                    self.isRevive = false
                end
                MallManager:showBuyLMPItem(30133,callFunc,closeFunc)
            end
        end,
        function()
            self.isRevive = false
            AlertManager:close()
            self:questionItem_3()
        end,
        {
            msg = warningMsg,
            showtype = AlertManager.BLOCK_AND_GRAY
        }
    )
end

function LongMenPoLayer:questionItem_3()
    local warningMsg = localizable.LongMenPoLayer_txt8
    local nItemCanUse = LongMenPoManager:isItemCanUse(LongMenPoManager.Item_3,self.floorId)
    if nItemCanUse == 0 or nItemCanUse == 1 then
        self.isRevive = true
        CommonManager:showOperateSureLayer(
            function()
                if nItemCanUse == 0 then
                    self.isRevive = false
                    LongMenPoManager:requestItem_3(self.floorId)
                elseif nItemCanUse == 1 then
                    local callFunc = function()
                        self.isQuestionItem3 = true
                        self.isRevive = false
                    end
                    local closeFunc = function()
                        self.isRevive = false
                        LongMenPoManager:requestShowFloorInfo(self.floorId)
                        --self:Item_2FalseCallBack()
                        --LongMenPoManager:requestItem_2(self.floorId,0)
                        --toastMessage(localizable.LongMenPoLayer_txt10)
                    end
                    MallManager:showBuyLMPItem(30134,callFunc,closeFunc)
                end
            end,
            function()
                self.isRevive = false
                AlertManager:close()
                LongMenPoManager:requestShowFloorInfo(self.floorId)
                --self:Item_2FalseCallBack()
                --LongMenPoManager:requestItem_2(self.floorId,0)
                --toastMessage(localizable.LongMenPoLayer_txt10)
            end,
            {
                msg = warningMsg,
                showtype = AlertManager.BLOCK_AND_GRAY
            }
        )
    else
        LongMenPoManager:requestShowFloorInfo(self.floorId)
        --self:Item_2FalseCallBack()
        --LongMenPoManager:requestItem_2(self.floorId,0)
        --toastMessage(localizable.LongMenPoLayer_txt10)
    end
end

function LongMenPoLayer:Item_1CallBack(idx)
    self:openBox(idx)
end

function LongMenPoLayer:Item_2CallBack()
    toastMessage(localizable.LongMenPoLayer_txt11)
    self.isDealBox = false
end

function LongMenPoLayer:Item_3CallBack()
    toastMessage(localizable.LongMenPoLayer_txt12)
    self:openLastBox()
    local delay = CCDelayTime:create(3)---
    local callFunc = CCCallFunc:create(function()
        self:acDrawFloor(self.floorId)
    end)
    self.panel_arm:runAction(CCSequence:createWithTwoActions(delay,callFunc))
end

function LongMenPoLayer:Item_2FalseCallBack()
    self:openLastBox()
    local delay = CCDelayTime:create(3)---
    local callFunc = CCCallFunc:create(function()
        LongMenPoManager:requestInfo()
    end)
    self.panel_arm:runAction(CCSequence:createWithTwoActions(delay,callFunc))
end

function LongMenPoLayer:restartInfoCallBack()
    self.floorId = 0
    self:acDrawFloor0(0)
end

function LongMenPoLayer:openLastBox()
    local boxList = self:getBoxList()
    for i=1,9 do
        if boxList[i].node:isVisible() == true then
            self:openBox(i,1)
        end
    end
end

function LongMenPoLayer:getBoxList()
    if self.panel_index == 1 then
        return self.BoxList_1
    elseif self.panel_index == 2 then
        return self.BoxList_2
    end
end

function LongMenPoLayer:getItemList()
    if self.panel_index == 1 then
        return self.ItemList_1
    elseif self.panel_index == 2 then
        return self.ItemList_2
    end
end

function LongMenPoLayer:NextFloor()
    self:openLastBox()
    if self.floorId >= 9 then
        self.successEffect:setVisible(true)
        self.successEffect:playByIndex(0, -1, -1, 0)
        local delay = CCDelayTime:create(3)---
        local callFunc = CCCallFunc:create(function()
            LongMenPoManager:requestInfo()
        end)
        self.panel_arm:runAction(CCSequence:createWithTwoActions(delay,callFunc))
    else
        local delay = CCDelayTime:create(3)
        local callFunc = CCCallFunc:create(function()
            LongMenPoManager:nextFloor()
            self.floorId = self.floorId + 1
            self:acDrawFloor(self.floorId)
        end)
        self.panel_arm:runAction(CCSequence:createWithTwoActions(delay,callFunc))
    end
end

function LongMenPoLayer:brushItemNum()
    if self.floorId == 0 then
        self.txt_jz:setText("0/0")
        self.txt_kly:setText("0/0")
        self.txt_xhd:setText("0/0")
    else
        local curInfo = LongMenPoManager:getCurInfo()
        local info = LongMenPoManager:getFloorInfoById(self.floorId)

        local leftCount = info.minedCount - curInfo.minedCount
        self.txt_jz:setText(leftCount .. "/" .. info.minedCount)

        leftCount = info.reviveCount - curInfo.reviveCount
        self.txt_kly:setText(leftCount .. "/" .. info.reviveCount)

        leftCount = info.resetCount - curInfo.resetCount
        if leftCount < 0 then
            leftCount = 0
        end
        self.txt_xhd:setText(leftCount .. "/" .. info.resetCount)
    end
    self.txt_sy:setText(BagManager:getItemNumById(30132) .. '/1')
    self.generalHead:refreshUI()
end

function LongMenPoLayer:drawFloorInfo()
    local curInfo = LongMenPoManager:getCurInfo()
    self:drawAward(0)
    self.isDealBox = false
    self.isShowReward = false
    self.isFreshAward = false

    self.txt_challenge:setText(curInfo.challengeCount)
    if curInfo.start == 1 then
        self:drawFloor0(curInfo.floorId)
        if curInfo.die == 1 then
             print("already die ....----======>>>> self.isRevive",self.isRevive)
            if self.isRevive ~= true then
                local nItemCanUse = LongMenPoManager:isItemCanUse(LongMenPoManager.Item_2,self.floorId)
                if nItemCanUse == 0 or nItemCanUse == 1 then
                    self:questionItem_2()
                else
                    nItemCanUse = LongMenPoManager:isItemCanUse(LongMenPoManager.Item_3,self.floorId)
                    if nItemCanUse == 0 or nItemCanUse == 1 then
                        self:questionItem_3()
                    else
                        LongMenPoManager:requestShowFloorInfo(self.floorId)
                        --toastMessage(localizable.LongMenPoLayer_txt10)
                    end
                end
            end
        else
            print("not die ....----======>>>>")
        end
    else
        self:drawFloor0(0)
    end
end

function LongMenPoLayer:reShow()
    self.super.onShow(self)
    self.isReShowInfo = true
    LongMenPoManager:requestInfo()
end

-------------------------------------------------------------------------------------------------
function LongMenPoLayer:drawPushMsgList()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()
        local size = self.panel_dt:getContentSize()
        size.width = size.width + 30
        tableView:setTableViewSize(self.panel_dt:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        -- tableView:setPosition(self.panel_gift:getPosition())
        tableView:setPosition(ccp(0, 0))
        self.tableView = tableView
        self.tableView.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, LongMenPoLayer.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, LongMenPoLayer.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, LongMenPoLayer.numberOfCellsInTableView)
        tableView:reloadData()
        self.panel_dt:addChild(self.tableView,1)
    else
        self.tableView:reloadData()
    end

end

function LongMenPoLayer.numberOfCellsInTableView(table)
    return #LongMenPoManager:getPushMsgList()
end

function LongMenPoLayer.cellSizeForTable(table,idx)
    return 28,440
end

function LongMenPoLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic

    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local txt_node = self.msgcellmodel:clone()
        txt_node:setTag(100)
        txt_node:setPosition(ccp(0,0))
        cell:addChild(txt_node)
    end
    idx = idx + 1
    self:drawCell(cell, idx)
    return cell
end

function LongMenPoLayer:drawCell(cell, idx)
    local cell_node = cell:getChildByTag(100)
    local txt_dt = TFDirector:getChildByPath(cell_node, 'txt_dt')
    local txt_reward = TFDirector:getChildByPath(cell_node, 'txt_reward')
    local txt_name = TFDirector:getChildByPath(cell_node, 'txt_name')

    local infoList = LongMenPoManager:getPushMsgList()
    local info = infoList[idx]
    
    local rewardItem = BaseDataManager:getReward(info.item)
    
    local str = rewardItem.name .. "X"
    if info.item.number >= 100000 then
        str = str .. stringUtils.format(localizable.fun_wan_desc,math.floor(rewardItem.number/10000))
    else
        str = str .. rewardItem.number
    end

    txt_name:setText(info.playerName)
    txt_reward:setText(str)
    if info.floorId == nil or info.floorId == 0 then
        txt_dt:setText(localizable.LongMenPoLayer_txt15)
    else
        txt_dt:setText(stringUtils.format(localizable.LongMenPoLayer_txt3,info.floorId))
    end
    
    local posX = txt_name:getContentSize().width
    txt_dt:setPositionX(posX)
    posX = posX + txt_dt:getContentSize().width
    txt_reward:setPositionX(posX)
    txt_reward:setColor(GetColorByQuality(rewardItem.quality))
end

function LongMenPoLayer:drawPoint(data)
    local index = data.index
    local itemList = self:getItemList()
    if data.type < 2 then
        itemList[index].bg:setTexture(self.BgPath[1])
        local path = self.ItemPath[data.type + 1]
        itemList[index].item:setTexture(path)
        itemList[index].item:setVisible(true)
    else
        itemList[index].bg:setTexture(self.BgPath[2])
        itemList[index].item:setVisible(false)
    end
end

function LongMenPoLayer:drawAllPoint(typeList)
    for k,v in pairs(typeList) do
        local pointInfo = {}
        pointInfo.index = k
        pointInfo.type = v
        self:drawPoint(pointInfo)
    end
end


function LongMenPoLayer:showNextTimer()
    self.time = self.time - 1
    if self.time <=  0 then
        if self.end_timerID then
            TFDirector:removeTimer(self.end_timerID)
            self.end_timerID = nil
        end
        toastMessage(localizable.treasureMain_tiemout)
        AlertManager:close()
    end    
    local timeCount = self.time
    local secInOneDay  = 24 * 3600
    local day = math.floor(timeCount/secInOneDay)
    local sec   = timeCount - secInOneDay * day
    local time1 = math.floor(sec/3600)
    local time2 = math.floor((sec-time1 * 3600)/60)
    local time3 = math.fmod(sec, 60)
    local timedesc1 = stringUtils.format(localizable.common_time_5, day, time1, time2, time3)
    self.txt_time:setText(timedesc1)
end


return LongMenPoLayer