

local DailyTaskLayer = class("DailyTaskLayer", BaseLayer)

function DailyTaskLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.task.BuyBackLayer")
end

function DailyTaskLayer:loadData(data)
    self.choice_type = data
    self:RefreshUI()
    if data == 0 then
        self.tab_hg:setTextureNormal("ui_new/task/tab_hg.png")
        self.tab_rc:setTextureNormal("ui_new/task/tab_rch.png")
        self.tab_xshd:setTextureNormal("ui_new/task/tab_xshd.png")
    else
        self.tab_rc:setTextureNormal("ui_new/task/tab_rch.png")
        self.tab_hg:setTextureNormal("ui_new/task/tab_hgh.png")
        self.tab_xshd:setTextureNormal("ui_new/task/tab_xshdh.png")
    end
end

function DailyTaskLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.listPanel = TFDirector:getChildByPath(ui, 'listPanel')
    self.titleImg = TFDirector:getChildByPath(ui, 'titleImg')
    self.closeBtn = TFDirector:getChildByPath(ui, 'closeBtn')
    self.img_done = TFDirector:getChildByPath(ui, 'img_done')
    self.tab_hg = TFDirector:getChildByPath(ui, 'tab_hg')
    self.tab_rc = TFDirector:getChildByPath(ui, 'tab_rc')
    self.tab_xshd = TFDirector:getChildByPath(ui, 'tab_xshd')
    
    self.choice_type = 0
    
    self.tab_hg.logic = self
    self.tab_rc.logic = self
    self.tab_xshd.logic = self
    self.tab_hg:setTextureNormal("ui_new/task/tab_hg.png")
    self.tab_xshd:setTextureNormal("ui_new/task/tab_xshd.png")
    self.tab_rc:setTextureNormal("ui_new/task/tab_rch.png")


    self.buyRes_cell = createUIByLuaNew("lua.uiconfig_mango_new.task.BuyBackCell");
    self.buyRes_cell:retain()  

    self.rewardBoxLayer = require("lua.logic.task.DailyTaskStarBoxLayer"):new()
    self.rewardBoxLayer:initUI(ui)

    self.activity_cell = createUIByLuaNew("lua.uiconfig_mango_new.task.XianShiHuoDongCell");
    self.activity_cell:retain()

    self.activityStatus={
    "ui_new/task/img_jxz.png",
    "ui_new/task/img_jjkq.png",
    "ui_new/task/img_yjs.png",
}
end

function DailyTaskLayer:registerEvents(ui)
    if self.registerEventCallFlag then
        return
    end
    self.super.registerEvents(self)

    self.closeBtn:setClickAreaLength(100)
    ADD_ALERT_CLOSE_LISTENER(self, self.closeBtn)

    self.tab_hg:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onSelectBuyResBtn),1)
    self.tab_rc:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onSelectTaskBtn),1)
    self.tab_xshd:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onSelectActivityBtn),1)
    self.UpdateBoxRewardCallBack = function (event)
        if self.rewardBoxLayer then
            self.rewardBoxLayer:refreshBoxList()
        end
    end
    TFDirector:addMEGlobalListener(TaskManager.UpdateDailyMissionProgressSuccess, self.UpdateBoxRewardCallBack)
    TFDirector:addMEGlobalListener(MainPlayer.GAME_RESET, self.UpdateBoxRewardCallBack)
    self.registerEventCallFlag = true
end


function DailyTaskLayer:removeEvents()

    self.super.removeEvents(self)  
    self.registerEventCallFlag = nil
    if self.UpdateBoxRewardCallBack then
        TFDirector:removeMEGlobalListener(TaskManager.UpdateDailyMissionProgressSuccess, self.UpdateBoxRewardCallBack)
        TFDirector:removeMEGlobalListener(MainPlayer.GAME_RESET, self.UpdateBoxRewardCallBack)
        self.UpdateBoxRewardCallBack = nil
    end
end

function DailyTaskLayer:removeUI()
    self.super.removeUI(self)
    if TaskManager:getDailyMissionProgressCurrent()==10 and not ActivityTipManager.isRewardTaskShow_10 then
        ActivityTipManager.isCanTip=true
        ActivityTipManager.isRewardTaskShow_10=true
    elseif TaskManager:getDailyMissionProgressCurrent()==20 and not ActivityTipManager.isRewardTaskShow_20 then
        ActivityTipManager.isCanTip=true
        ActivityTipManager.isRewardTaskShow_20=true
    end
    if self.buyRes_cell then
        self.buyRes_cell:release()
        self.buyRes_cell = nil
    end
    if self.activity_cell then
        self.activity_cell:release()
        self.activity_cell = nil
    end   
end

function DailyTaskLayer:RefreshUI()
    if self.choice_type == 0 then
        self:RefreshTaskUI()
        self.rewardBoxLayer:setVisible(true)
    elseif self.choice_type == 1 then
        self:RefreshBuyResUI()
        self.rewardBoxLayer:setVisible(false)
    else
        self:RefreshActivityUI()
        self.rewardBoxLayer:setVisible(false)
    end
    if ResYesterdayManager:GetTaskNum() > 0 then
        CommonManager:setRedPoint(self.tab_hg, true,"ResYestardayBtnRedPoint",ccp(0,0))
    else
        CommonManager:setRedPoint(self.tab_hg, false,"ResYestardayBtnRedPoint",ccp(0,0))
    end
    --隐藏限时活动红点
    -- if ActivityTipManager:getIsRedPont() then
    --     CommonManager:setRedPoint(self.tab_xshd, true,"ActivityTip_tab_xshd",ccp(0,0))
    -- else
    --     CommonManager:setRedPoint(self.tab_xshd, false,"ActivityTip_tab_xshd",ccp(0,0))
    -- end
end

function DailyTaskLayer:RefreshTaskUI()
    TaskManager:sort()
    if self.taskTableView == nil then
        self.taskTableView = TFTableView:create()
        self.taskTableView.logic = self
        self.taskTableView:setTableViewSize(self.listPanel:getSize())
        self.taskTableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.taskTableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.taskTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, DailyTaskLayer.cellSizeForTable)
        self.taskTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, DailyTaskLayer.tableCellAtIndex)
        self.taskTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, DailyTaskLayer.numberOfCellsInTableView)

        self.listPanel:addChild(self.taskTableView)
    end
    
    if self.buyResTableView then
        self.buyResTableView:setVisible(false)
    end
    if self.ActivityTableView then
        self.ActivityTableView:setVisible(false)
    end
    self.taskTableView:setVisible(true)

    self.taskTableView:reloadData()
    local taskNum = TaskManager:GetTaskNum(0)
    if taskNum == 0 then
        self.img_done:setVisible(true)
    else
        self.img_done:setVisible(false)
    end
end

function DailyTaskLayer.cellSizeForTable(table,idx)
    return 105,647
end

function DailyTaskLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
    else
        cell:removeAllChildren()
    end
    table.logic:SetTaskCell(cell, idx)
    return cell
end

function DailyTaskLayer:SetTaskCell(cell, cellIndex)
    local taskInfo = TaskManager:GetTaskInfo(0, cellIndex+1)
    if taskInfo == nil then
        return
    end

    local taskData = TaskData:objectByID(taskInfo.taskid)
    if nil == taskData then
        return
    end

    local taskBgImage = TFImage:create("ui_new/task/cj_di.png")
    --taskBgImage:setPosition(ccp(320, 50))
    taskBgImage:setPosition(ccp(325, 50))
    --taskBgImage:setScale(0.95)
    cell:addChild(taskBgImage)

    local taskNameLabel = TFLabel:create()
    taskNameLabel:setAnchorPoint(ccp(0, 0))
    taskNameLabel:setPosition(ccp(110, 50))
    taskNameLabel:setFontSize(26)
    taskNameLabel:setColor(ccc3(0, 0, 0))
    taskNameLabel:setText(taskData.name)
    cell:addChild(taskNameLabel)

    local descLabel = TFLabel:create()
    descLabel:setAnchorPoint(ccp(0, 0))
    descLabel:setPosition(ccp(110, 20))
    descLabel:setText(taskData.desc)
    descLabel:setFontSize(20)
    descLabel:setColor(ccc3(0, 0, 0))
    cell:addChild(descLabel)

    local posX = 405
    local rewardList = RewardConfigureData:GetRewardItemListById(taskData.reward_id)
    if rewardList ~= nil then
        for i=1, rewardList:length() do
            local rewardData = rewardList:getObjectAt(i)

            local rewardInfo = BaseDataManager:getReward(rewardData)
            local rewardItemBg = TFImage:create(GetColorIconByQuality(rewardInfo.quality))
            rewardItemBg:setPosition(ccp(posX, 55))
            rewardItemBg:setScale(0.5)
            cell:addChild(rewardItemBg)
            
            local bMax = MainPlayer:bMaxLevel()
            local rewardItemImage = nil
            if bMax and rewardInfo.type == EnumDropType.EXP then
                rewardItemImage = TFImage:create("ui_new/common/qhp_tb_icon.png")
                rewardItemImage:setPosition(ccp(0, 0))
                rewardItemBg:addChild(rewardItemImage)
                rewardItemImage:setTouchEnabled(true)
                rewardItemImage:addMEListener(TFWIDGET_CLICK,
                audioClickfun(function()
                    Public:ShowItemTipLayer(1, 10)
                end))

            else
                rewardItemImage = TFImage:create(rewardInfo.path)
                rewardItemImage:setPosition(ccp(0, 0))
                rewardItemBg:addChild(rewardItemImage)
                rewardItemImage:setTouchEnabled(true)
                rewardItemImage:addMEListener(TFWIDGET_CLICK,
                audioClickfun(function()
                    Public:ShowItemTipLayer(rewardInfo.itemid, rewardInfo.type)
                end))
            end
            local rewardLabel = TFLabelBMFont:create()
            rewardLabel:setScale(0.65)
            rewardLabel:setFntFile("font/num_202.fnt")
            rewardLabel:setPosition(ccp(posX, 20))
            if rewardInfo.type == EnumDropType.EXP then                               
                local muilt = ConstantData:objectByID("Player.Exp.Power.Multiple")
                local exp = MainPlayer:getLevel() * muilt.value *rewardInfo.number                
                --
                if bMax then
                    local muilt = ConstantData:objectByID("Experience.Change.Money").value
                    exp = exp * muilt
                end
                rewardLabel:setText("X".. exp)
            else
                rewardLabel:setText("X"..rewardInfo.number)
            end
            
            cell:addChild(rewardLabel)
            posX = posX + 70


            -- Public:addPieceImg(rewardItemImage,rewardData);

            local itemDetail = ItemData:objectByID(rewardInfo.itemid)
            if itemDetail then
                if itemDetail.kind == 3 and itemDetail.type == 7 then

                else
                    Public:addPieceImg(rewardItemImage, rewardData);
                end
            else
                Public:addPieceImg(rewardItemImage, rewardData);
            end
        end
    end

    if taskInfo.state == 0 then
        local progressBg = TFImage:create("ui_new/task/cj_jidudi.png")
        progressBg:setPosition(ccp(295, 62))
        cell:addChild(progressBg)

        local progressBar = TFLoadingBar:create()
        progressBar:setTexture("ui_new/task/cj_jindu.png")
        progressBar:setPosition(ccp(0, 0))
        progressBar:setPercent(taskInfo.currstep/taskInfo.totalstep * 100)
        progressBg:addChild(progressBar)

        local stepLabel = TFLabel:create()
        stepLabel:setPosition(ccp(0, 18))
        stepLabel:setText(taskInfo.currstep.."/"..taskInfo.totalstep)
        stepLabel:setFontSize(22)
        stepLabel:setColor(ccc3(0, 0, 0))
        progressBg:addChild(stepLabel)

        if TaskManager:CanGoToLayer(taskData, false) then
            local goBtn = TFButton:create()
            cell:addChild(goBtn)
            goBtn:setName("goBtn"..cellIndex+1)
            goBtn:setTextureNormal("ui_new/task/cj_qiangwang_btn.png") 
            goBtn:setPosition(ccp(570,50))
            -- goBtn:setScale(0.9)
            goBtn:addMEListener(TFWIDGET_CLICK,
            audioClickfun(function()
                -- if not self.bGuideMode then
                PlayerGuideManager:showNextGuideStep_taskGoto()
                self:SetGuideMode(false)
                TaskManager:CanGoToLayer(taskData, true)
                -- end 
            end),1)
        end

    elseif taskInfo.state == 1 then
        local getRewardBtn = TFButton:create()
        cell:addChild(getRewardBtn)
        -- getRewardBtn:setScale(0.9)

        getRewardBtn:setName("getRewardBtn"..cellIndex+1)
        getRewardBtn:setTextureNormal("ui_new/task/cj_lingqu_btn.png") 
        getRewardBtn:setPosition(ccp(570,50))
        getRewardBtn:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            showLoading()
            self:SetGuideMode(false)
            TFDirector:send(c2s.GET_TASK_REWARD, {taskInfo.taskid})
        end),1,
        audioClickfun(function()
            showLoading()
            self:SetGuideMode(false)
            TFDirector:send(c2s.GET_TASK_REWARD, {taskInfo.taskid})
        end),1)

        Public:addBtnWaterEffect(getRewardBtn, true,0)
        CommonManager:updateRedPoint(getRewardBtn, TaskManager:isCanGetReward(taskInfo.taskid),ccp(0,0))
    end

    -- local taskIconBg = TFImage:create("ui_new/common/icon_bg/pz_bg_ding_118.png")
    -- taskIconBg:setPosition(ccp(53, 50))
    -- taskIconBg:setScale(0.7)
    -- cell:addChild(taskIconBg)

    local taskIconImage = TFImage:create("icon/task/"..taskData.icon_id..".png")
    if taskIconImage then
        taskIconImage:setPosition(ccp(64, 50))
        taskIconImage:setScale(0.8)
        cell:addChild(taskIconImage)
    end
end

function DailyTaskLayer.numberOfCellsInTableView(table)
    local taskNum = TaskManager:GetTaskNum(0)
    return taskNum
end

function DailyTaskLayer:SetGuideMode(bGuideMode)
    self.bGuideMode = bGuideMode
    if bGuideMode then
        self.taskTableView:setInertiaScrollEnabled(false)
    else
        self.taskTableView:setInertiaScrollEnabled(true)
    end
end


function DailyTaskLayer:RefreshBuyResUI()
    if self.buyResTableView == nil then
        self.buyResTableView = TFTableView:create()
        self.buyResTableView.logic = self
        self.buyResTableView:setTableViewSize(self.listPanel:getSize())
        self.buyResTableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.buyResTableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.buyResTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, DailyTaskLayer.cellSizeForTable_res)
        self.buyResTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, DailyTaskLayer.tableCellAtIndex_res)
        self.buyResTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, DailyTaskLayer.numberOfCellsInTableView_res)

        self.listPanel:addChild(self.buyResTableView)
    end
    if self.taskTableView then
        self.taskTableView:setVisible(false)
    end
    if self.ActivityTableView then
        self.ActivityTableView:setVisible(false)
    end
    self.buyResTableView:setVisible(true)
    self.buyResTableView:reloadData()


    self.img_done:setVisible(false)
end

function DailyTaskLayer.cellSizeForTable_res(table,idx)
    return 121,648
end

function DailyTaskLayer.numberOfCellsInTableView_res(table,idx)
    return ResYesterdayManager:GetTaskNum()
end

function DailyTaskLayer.tableCellAtIndex_res(table, idx)
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local buyResSprite = table.logic.buyRes_cell:clone()
        local btn_gouhui = TFDirector:getChildByPath(buyResSprite,"btn_gouhui")
        btn_gouhui:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            ResYesterdayManager:buyResRequest(buyResSprite.index)
        end),1)
        cell:addChild(buyResSprite)
        cell.buyResSprite = buyResSprite
        local img_icon = TFDirector:getChildByPath(buyResSprite,"img_icon")
        local posX = img_icon:getPositionX() - 3
        img_icon:setPositionX(posX)
    end
    table.logic:setBuyResCell(cell.buyResSprite, idx+1)
    return cell
end

function DailyTaskLayer:setBuyResCell( widget , index )
    widget.index = index
    local singleRes = ResYesterdayManager.buyResList:getObjectAt(index)
    local resInfo = ResYesterdayManager:getResInfoById(singleRes.id)
    local img_icon = TFDirector:getChildByPath(widget,"img_icon")
    -- img_icon:setTexture("icon/task/5.png")
    img_icon:setTexture("icon/task/"..resInfo.icon..".png")
    local txt_name = TFDirector:getChildByPath(widget,"txt_name")
    txt_name:setText(resInfo.name)
    local txt_miaoshu = TFDirector:getChildByPath(widget,"txt_miaoshu")
    txt_miaoshu:setText(resInfo.desc1)
    local txt_num = TFDirector:getChildByPath(widget,"txt_num")
    txt_num:setText(singleRes.value)
    local txt_miaoshu2 = TFDirector:getChildByPath(widget,"txt_miaoshu2")
    txt_miaoshu2:setText(resInfo.desc2)
    local txt_price = TFDirector:getChildByPath(widget,"txt_price")
    txt_price:setText(resInfo.price*singleRes.value)
    txt_num:setPositionX(txt_miaoshu:getPosition().x + txt_miaoshu:getSize().width)
    txt_miaoshu2:setPositionX(txt_num:getPosition().x + txt_num:getSize().width)

end


function DailyTaskLayer:RefreshActivityUI()
    if self.ActivityTableView == nil then
        self.ActivityTableView = TFTableView:create()
        self.ActivityTableView.logic = self
        self.ActivityTableView:setTableViewSize(self.listPanel:getSize())
        self.ActivityTableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.ActivityTableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.ActivityTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable_activity,self))
        self.ActivityTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex_activity,self))
        self.ActivityTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView_activity,self))

        self.listPanel:addChild(self.ActivityTableView)
    end
    if self.taskTableView then
        self.taskTableView:setVisible(false)
    end
    if self.buyResTableView then
        self.buyResTableView:setVisible(false)
    end
    self.ActivityTableView:setVisible(true)
    self.ActivityTableView:reloadData()


    self.img_done:setVisible(false)
end

function DailyTaskLayer:cellSizeForTable_activity(table,idx)
    return 100,642
end

function DailyTaskLayer:numberOfCellsInTableView_activity(table)
    return #ActivityTipManager:getRventNoticeList()
end

function DailyTaskLayer:tableCellAtIndex_activity(table,idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local activity_cell = table.logic.activity_cell:clone()
        cell:addChild(activity_cell)
        cell.activity_cell = activity_cell
    end
    cell.logic=table.logic
    table.logic:setActiVityCell(cell,idx)
    return cell
end

function DailyTaskLayer:setActiVityCell(cell,idx)
    local self=cell.logic
    local activityData=ActivityTipManager:getRventNoticeList()
    local date  = os.date("*t", os.time())
    local panel=cell.activity_cell
    local bg=TFDirector:getChildByPath(panel,"bg1")
    local txt_name=TFDirector:getChildByPath(panel,"txt_name")
    local img_jxz=TFDirector:getChildByPath(panel,"img_jxz")
    local btn_qianwang=TFDirector:getChildByPath(panel,"btn_qianwang")
    local txt_miaoshu=TFDirector:getChildByPath(panel,"txt_miaoshu")

    txt_name:setText(activityData[idx].name)
    txt_miaoshu:setText(EnumActivityTipWeek[activityData[idx].week]..' '..stringUtils.format(localizable.activity_time_tip, activityData[idx].TimeBegin[1], activityData[idx].TimeBegin[2],activityData[idx].TimeEnd[1],activityData[idx].TimeEnd[2]))
    img_jxz:setTexture(self.activityStatus[activityData[idx].status])

    local week=nil
    if activityData[idx].week+1>7 then
        week=(activityData[idx].week+1)%7
    else
        week=activityData[idx].week+1
    end
    if week==date.wday then
        if activityData[idx].status==3 then
            bg:setTexture("ui_new/task/img_di3.png")
        else
            bg:setTexture("ui_new/task/img_di2.png")
        end
    else
        bg:setTexture("ui_new/task/img_di3.png")
    end

    btn_qianwang.logic=self
    btn_qianwang.data=activityData[idx]
    btn_qianwang:addMEListener(TFWIDGET_CLICK,audioClickfun(self.btnActivityQianwang),1)

end

function DailyTaskLayer.btnActivityQianwang( sender )
    local self=sender.logic 
    ActivityTipManager:goLyerByType(sender.data)
end

function DailyTaskLayer.onSelectBuyResBtn( sender )
    local self = sender.logic
    self.choice_type = 1
    self:RefreshUI()
    self.tab_hg:setTextureNormal("ui_new/task/tab_hgh.png")
    self.tab_rc:setTextureNormal("ui_new/task/tab_rc.png")
    self.tab_xshd:setTextureNormal("ui_new/task/tab_xshd.png")
end

function DailyTaskLayer.onSelectTaskBtn( sender )
    local self = sender.logic
    self.choice_type = 0
    self:RefreshUI()
    self.tab_hg:setTextureNormal("ui_new/task/tab_hg.png")
    self.tab_rc:setTextureNormal("ui_new/task/tab_rch.png")
    self.tab_xshd:setTextureNormal("ui_new/task/tab_xshd.png")
end

function DailyTaskLayer.onSelectActivityBtn( sender )
    local self = sender.logic
    ActivityTipManager.isFristTime=true
    self.choice_type = 2
    self:RefreshUI()
    self.tab_hg:setTextureNormal("ui_new/task/tab_hg.png")
    self.tab_rc:setTextureNormal("ui_new/task/tab_rc.png")
    self.tab_xshd:setTextureNormal("ui_new/task/tab_xshdh.png")
end


return DailyTaskLayer