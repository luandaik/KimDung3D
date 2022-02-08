local JiayuanInviteLayer = class("JiayuanInviteLayer", BaseLayer)

JiayuanInviteLayer.kJiangliNum = 10

function JiayuanInviteLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.qiyu.FamilyInviteCode")
    -- QiyuManager:GetInviteCodeDataRequest()

    self.inviteConfig = require("lua.table.t_s_invite_config")
end

function JiayuanInviteLayer:initUI(ui)
    self.super.initUI(self, ui)
    --受邀按钮
    self.btn_shouyao = TFDirector:getChildByPath(ui, 'btn_shouyao')
    --分享按钮
    -- self.btn_share = TFDirector:getChildByPath(ui, "btn_fx")
    --txt邀请码
    self.txt_inviteddesc = TFDirector:getChildByPath(ui, "txt_inviteddesc")
    self.txt_inviteddesc:setVisible(false)
    --输入框
    self.txt_shurukuang1 = TFDirector:getChildByPath(ui, "txt_shurukuang1")
    self.txt_shurukuang1:setTouchEnabled(false)
    --复制按钮
    self.btn_Copy = TFDirector:getChildByPath(ui, 'btn_fz')
    self.panel_jiangli = {}
    --奖励列表
    for i = 1, self.kJiangliNum do
        self.panel_jiangli[i] = TFDirector:getChildByPath(ui, "panel_jiangli" .. i)
    end

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
end

function JiayuanInviteLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function JiayuanInviteLayer:registerEvents(ui)
    self.super.registerEvents(self)

    self.btn_Copy.logic = self
    self.btn_Copy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickCopyBtn), 1)

    self.btn_shouyao.logic = self
    self.btn_shouyao:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickAcceptInvite),1)

    -- self.btn_share.logic = self
    -- self.btn_share:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickSendToFriend),1)

    self.btn_close.logic = self
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCloseClickHandle), 1)

    --TFDirector:addMEGlobalListener("CheckInviteCode", function() self:refreshUI() end)
    --TFDirector:addMEGlobalListener("UpdateInviteCodeInfo", function() self:refreshUI() end)
end

function JiayuanInviteLayer:removeEvents()
    self.super.removeEvents(self)

    --TFDirector:removeMEGlobalListener("CheckInviteCode")
    --TFDirector:removeMEGlobalListener("UpdateInviteCodeInfo")
end

function JiayuanInviteLayer:refreshUI()
    -- required int32 myCode = 1;                   //自己的邀请码
    -- required bool invited = 2;                   //自己是否验证过别人的邀请码
    -- required bool invitedAward = 3;              //是否已领受邀奖
    -- required int32 inviteCount = 4;          //邀请好友次数
    -- required string getRewardRecord = 5;         //邀请领奖记录，格式:id_达到条件次数_已领次数&id_次数...

    self.InviteCodeInfo = QiyuManager:GetInviteCodeData()

    self.InviteCode = self.InviteCodeInfo.myCode

    self.txt_shurukuang1:setText(self.InviteCode)

    local invited = self.InviteCodeInfo.invited

    --self.lbl_InviteNum:setText(self.InviteCodeInfo.inviteCount)

    -- print("getRewardRecord = ", self.InviteCodeInfo.getRewardRecord)
    local tblOfReward = string.split(self.InviteCodeInfo.getRewardRecord,'&')

    self.rewardStatusList = MEMapArray:new()
    for k, v in pairs(tblOfReward) do
        local rewardInfo = string.split(v,'_')
        local id         = tonumber(rewardInfo[1])
        local numTotal   = tonumber(rewardInfo[2])      -- 可以领取总数
        local numGet     = tonumber(rewardInfo[3])      --已经领取次数
        local data = 
        {
            id = id,
            numTotal = numTotal,
            numGet = numGet,
            times  = numTotal - numGet
        }
        self.rewardStatusList:pushbyid(id,data)
    end

    local function cmpTimes(reward1, reward2)
        if reward1.times > reward2.times then
            return true
        elseif reward1.times == reward2.times then
            if reward1.id < reward2.id then
                return true
            end
        end

        return false
    end

    --self.rewardStatusList:sort(cmpTimes)

    self:drawRewardList()


    local bIsGetReward = self.InviteCodeInfo.invited
    -- self.btn_shouyao:setVisible(not bIsGetReward)

    local bShowAcceptBtn = true
    local levelLimit = ConstantData:getValue("Invite.Validate.Level")
    if MainPlayer:getLevel() > levelLimit or bIsGetReward then
        bShowAcceptBtn = false
    end

    self.btn_shouyao:setVisible(bShowAcceptBtn)
    CommonManager:setRedPoint(self.btn_shouyao, bShowAcceptBtn,"bShowAcceptBtn",ccp(0, 0))
end


function JiayuanInviteLayer:drawRewardList()
    for i = 1, self.kJiangliNum do
        self.panel_jiangli[i]:setVisible(true)
        if i <= self.inviteConfig:length() then
            local panel = self.panel_jiangli[i]
            local txt_level = TFDirector:getChildByPath(self.panel_jiangli[i], "txt_level")
            local rewardInfo = self.rewardStatusList:objectAt(i)
            local data = self.inviteConfig:objectByID(rewardInfo.id)

            local btn_lingqu = TFDirector:getChildByPath(self.panel_jiangli[i], "btn_lingqu")
            local txt_num1 = TFDirector:getChildByPath(self.panel_jiangli[i], "txt_num")
            local txt_num2 = TFDirector:getChildByPath(self.panel_jiangli[i], "txt_num2")           

            txt_level:setText(data.target_desc)
            if data.target_type == 2 then
                txt_level:setTextAreaSize(CCSizeMake(0, 0))
                txt_level:setRotation(90)
            else
                txt_level:setTextAreaSize(CCSizeMake(24, 100))
                txt_level:setRotation(0)
            end

            local btn_libao = TFDirector:getChildByPath(self.panel_jiangli[i], "btn_libao")
            btn_libao:addMEListener(TFWIDGET_CLICK,  audioClickfun(function(sender)
                    RewardManager:showGiftListLayer(data.reward_id, false,         
                        function()
                        end
                     )

            end), 1)

            local id         = rewardInfo.id
            local numTotal   = rewardInfo.numTotal -- 可以领取总数
            local numGet     = rewardInfo.numGet    --已经领取次数

            txt_num1:setText(numTotal - numGet)
            txt_num2:setText(numTotal.."/"..data.reward_get_count)
            
            local bCanGetReward = true
            if numGet >= data.reward_get_count or numTotal <= numGet then
                bCanGetReward = false
            end

            btn_lingqu:setGrayEnabled(not bCanGetReward)
            btn_lingqu:setTouchEnabled(bCanGetReward)

            btn_lingqu:addMEListener(TFWIDGET_CLICK, audioClickfun(function(sender)
                    QiyuManager:requestInviteCodeGift(data.id)
            end), 1)
        else
            self.panel_jiangli[i]:setVisible(false)
        end
    end
end

function JiayuanInviteLayer.onClickCopyBtn(sender)
    local self = sender.logic

    -- 复制到手机的验证码
    print("复制到手机的验证码 ---- ", self.InviteCode)
    local content = self.InviteCode..""
    TFDeviceInfo:copyToPasteBord(content)

    --toastMessage("复制成功")
    toastMessage(localizable.vipQQLayer_copy_suc)
end

function JiayuanInviteLayer.onClickAcceptInvite(sender)
    local self = sender.logic

    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.qiyu.InviteFriendAcceptLayer", AlertManager.BLOCK_AND_GRAY)
    AlertManager:show()
end

function JiayuanInviteLayer.onClickSendToFriend(sender)
    local self = sender.logic

    QiyuManager:goShare()
end

function JiayuanInviteLayer.onCloseClickHandle(sender)
    AlertManager:close()
end

-- InviteFriendAcceptLayer
return JiayuanInviteLayer