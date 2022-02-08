
local TaskLayer = class("TaskLayer", BaseLayer)

function TaskLayer:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.task.TaskLayer")
end

function TaskLayer:loadData(data)
    self.taskType = data
    self:RefreshUI()
end

function TaskLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.listPanel = TFDirector:getChildByPath(ui, 'listPanel')
    self.titleImg = TFDirector:getChildByPath(ui, 'titleImg')
    self.closeBtn = TFDirector:getChildByPath(ui, 'closeBtn')
    self.img_done = TFDirector:getChildByPath(ui, 'img_done')
end

function TaskLayer:registerEvents(ui)
    self.super.registerEvents(self)

    self.closeBtn:setClickAreaLength(100)
    ADD_ALERT_CLOSE_LISTENER(self, self.closeBtn)
end

function TaskLayer:removeUI()
    self.super.removeUI(self)
end

function TaskLayer:refreshBaseUI()
end

function TaskLayer:RefreshUI()
    TaskManager:sort()
    if self.taskType ~= 1 then
        self.titleImg:setTexture("ui_new/task/cj_jiangli.png")
    else
        self.titleImg:setTexture("ui_new/task/cj_cjjiangli.png")
    end

    if self.taskTableView == nil then
        self.taskTableView = TFTableView:create()
        self.taskTableView.logic = self
        self.taskTableView:setTableViewSize(self.listPanel:getSize())
        self.taskTableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.taskTableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.taskTableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, TaskLayer.cellSizeForTable)
        self.taskTableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, TaskLayer.tableCellAtIndex)
        self.taskTableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, TaskLayer.numberOfCellsInTableView)
        Public:bindScrollFun(self.taskTableView);
        self.listPanel:addChild(self.taskTableView)
    end
    
    self.taskTableView:reloadData()
    local taskNum = TaskManager:GetTaskNum(self.taskType)
    if taskNum == 0 then
        self.img_done:setVisible(true)
    else
        self.img_done:setVisible(false)
    end
end

function TaskLayer.cellSizeForTable(table,idx)
    return 105,647
end

function TaskLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
    else
        cell:removeAllChildren()
    end

    table.logic:SetTaskCell(cell, idx)

    return cell
end

function TaskLayer:SetTaskCell(cell, cellIndex)
    local taskInfo = TaskManager:GetTaskInfo(self.taskType, cellIndex+1)
    if taskInfo == nil then
        return
    end

    local taskData = TaskData:objectByID(taskInfo.taskid)
    if nil == taskData then
        return
    end

    local taskBgImage = TFImage:create("ui_new/task/cj_di.png")
    taskBgImage:setPosition(ccp(320, 50))
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
    local rewardId = taskData.reward_id
    if taskData.reward_id <= 0 then
        local profession = MainPlayer:getProfession()
        local role = RoleData:objectByID(profession)
        if role then
            local tbl = stringToNumberTable(taskData.reward_zy,",")
            rewardId = tbl[role.outline]
        end
    end
    local rewardList = RewardConfigureData:GetRewardItemListById(rewardId)
    if rewardList ~= nil then
        for i=1, rewardList:length() do
            local rewardData = rewardList:getObjectAt(i)

            local rewardInfo = BaseDataManager:getReward(rewardData)
            local rewardItemBg = TFImage:create(GetColorIconByQuality(rewardInfo.quality))
            rewardItemBg:setPosition(ccp(posX, 55))
            rewardItemBg:setScale(0.5)
            cell:addChild(rewardItemBg)
            
            local bMax = MainPlayer:bMaxLevel()
            if bMax and rewardInfo.type == EnumDropType.EXP then
                local rewardItemImage = TFImage:create("ui_new/common/qhp_tb_icon.png")
                rewardItemImage:setPosition(ccp(0, 0))
                rewardItemBg:addChild(rewardItemImage)
                rewardItemImage:setTouchEnabled(true)
                rewardItemImage:addMEListener(TFWIDGET_CLICK,
                audioClickfun(function()
                    Public:ShowItemTipLayer(1, 3)
                end))
                Public:addPieceImg(rewardItemImage, rewardData,false,1.0);
            else
                local rewardItemImage = TFImage:create(rewardInfo.path)
                if (rewardItemImage) then
                    rewardItemImage:setPosition(ccp(0, 0))
                    rewardItemBg:addChild(rewardItemImage)
                    rewardItemImage:setTouchEnabled(true)
                    rewardItemImage:addMEListener(TFWIDGET_CLICK,
                    audioClickfun(function()
                        Public:ShowItemTipLayer(rewardInfo.itemid, rewardInfo.type)
                    end))
                    Public:addPieceImg(rewardItemImage, rewardData,nil,1.0);
                end
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
            --埋点id:30 领取20级成就奖励
            if (taskInfo.taskid == 105) then
                TFDirector:send(c2s.DATA_COLLECT_REQUEST, {30})
            end
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
        taskIconImage:setPosition(ccp(60, 50))
        taskIconImage:setScale(0.8)
        cell:addChild(taskIconImage)
    end
end

function TaskLayer.numberOfCellsInTableView(table)
    local taskNum = TaskManager:GetTaskNum(table.logic.taskType)
    return taskNum
end

function TaskLayer:SetGuideMode(bGuideMode)
    self.bGuideMode = bGuideMode
    if bGuideMode then
        self.taskTableView:scrollToYTop(0);
        self.taskTableView:setInertiaScrollEnabled(false)
    else
        self.taskTableView:setInertiaScrollEnabled(true)
    end
end

return TaskLayer