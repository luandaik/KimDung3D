-- @Author: Happy All
-- @Date:   2016-11-21 16:08:07
-- @Last Modified by:   Happy All
-- @Last Modified time: 2016-11-24 17:07:22
-- 日常宝箱


local DailyTaskStarBoxLayer = class("DailyTaskStarBoxLayer");

function DailyTaskStarBoxLayer:ctor()
end

function DailyTaskStarBoxLayer:initUI(ui)

    self.Panel_star_box = TFDirector:getChildByPath(ui, 'Panel_star_box')
    self.star_box_di = TFDirector:getChildByPath(self.Panel_star_box, 'star_box_di')
    self.star_box_di:setDirection(TFLOADINGBAR_LEFT)
    self.star_box_di:setPercent(0)
    self.star_box_di:setVisible(true)
    
    self.BtnBoxArr = {}
    for i=1,3 do
        self.BtnBoxArr[i] = TFDirector:getChildByPath(ui, 'Button_star_box'..i)
        self.BtnBoxArr[i].parentNode = self.BtnBoxArr[i]:getParent()
        self.BtnBoxArr[i].txt = TFDirector:getChildByPath(ui, 'Label_star_box'..i)
        self.BtnBoxArr[i].index = i
        self.BtnBoxArr[i].logic = self
        self.BtnBoxArr[i]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onOpenBoxClickHandle),1)
    end
    self:refreshBoxList()
end

function DailyTaskStarBoxLayer:refreshBoxList()

    local curStar = TaskManager:getDailyMissionProgressCurrent()
    -- local maxStar = ConstantData:objectByID("DailyTaskQuantity").value
    local maxStar = 0
    for i=1,3 do
        local boxInfo = DailyMissionProgressData:objectByID(i)
        self.BtnBoxArr[i]:setVisible(false)

        if boxInfo then
             if self.BtnBoxArr[i].effect then
                self.BtnBoxArr[i].effect:removeFromParent()
                self.BtnBoxArr[i].effect = nil
            end

            if TaskManager:checkDailyMissionProgressAlreadyOpen(boxInfo.id) then
                self.BtnBoxArr[i]:setTextureNormal("ui_new/mission/icon_pass5.png");
                self.BtnBoxArr[i].txt:setVisible(false)               
                self.BtnBoxArr[i]:setVisible(true)
            else
                self.BtnBoxArr[i].txt:setVisible(true)
                self.BtnBoxArr[i]:setTextureNormal("ui_new/mission/icon_pass6.png");

                if curStar >= boxInfo.progress then
                    self.BtnBoxArr[i]:setVisible(false)
                    if self.BtnBoxArr[i].effect == nil then
                        local resPath = "effect/ui/northClimbBox.xml"
                        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
                        local effect = TFArmature:create("northClimbBox_anim")
                        effect:setAnimationFps(GameConfig.ANIM_FPS)
                        self.BtnBoxArr[i].parentNode:addChild(effect,100)
                        local pos = self.BtnBoxArr[i]:getPosition()
                        effect:setPosition(ccp(pos.x,pos.y+4))
                        effect:setScale(0.65)
                        effect.logic = self
                        effect.index = i
                        effect:setTouchEnabled(true)
                        effect.boxInfo = boxInfo
                        effect:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onOpenBoxClickHandle),1)
                        self.BtnBoxArr[i].effect = effect
                    end
                    self.BtnBoxArr[i].effect:playByIndex(0, -1, -1, 1)   
                else
                    self.BtnBoxArr[i]:setVisible(true)
                end
            end
            self.BtnBoxArr[i].txt:setText(curStar .. "/" .. boxInfo.progress)-- .. "/" .. maxStar)
            -- self.BtnBoxArr[i]:setVisible(true)
            self.BtnBoxArr[i].boxInfo = boxInfo

            if maxStar < boxInfo.progress then
                maxStar = boxInfo.progress
            end
        end
    end
    self.star_box_di:setPercent(math.floor(curStar*100/maxStar))
end

function DailyTaskStarBoxLayer.onOpenBoxClickHandle( sender )
    local self = sender.logic
    local boxInfo = sender.boxInfo
    if TaskManager:checkDailyMissionProgressAlreadyOpen(boxInfo.id) then
       --toastMessage("你已经领取了该宝箱")
       toastMessage(localizable.common_get_box)
       return
    end

    local curStar = TaskManager:getDailyMissionProgressCurrent()
    if curStar < boxInfo.progress then
        --预览宝箱    
        local calculateRewardList = self:calculateReward(boxInfo.award)
        local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.mission.StarBoxPanel",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);        
        layer:loadData(calculateRewardList, boxInfo.progress);
        layer:modifyWithDailyProgress(boxInfo.progress)
        AlertManager:show();       
    else
        --打开宝箱
        TaskManager:requestDailyMissionProgressReward(boxInfo.id)
    end
end


function DailyTaskStarBoxLayer:calculateReward(reward)

    local calculateRewardList = TFArray:new();
    local tbl ,len = stringToTable(reward,'|')
    for i=1,len do
        local reward = stringToNumberTable(tbl[i],'_')
        local rewardInfo = {}
        rewardInfo.type = reward[1]
        rewardInfo.itemId = reward[2]
        rewardInfo.number = reward[3]
        local _rewardInfo = BaseDataManager:getReward(rewardInfo)
        calculateRewardList:push(_rewardInfo);
    end

    return calculateRewardList
end

function DailyTaskStarBoxLayer:setVisible( v )
    self.Panel_star_box:setVisible(v)
end
return DailyTaskStarBoxLayer

