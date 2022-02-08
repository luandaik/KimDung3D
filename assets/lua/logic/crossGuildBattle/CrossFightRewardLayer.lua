-- client side CrossFightRewardLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer Stephen.tao
-- creation time 2016-05-27

local CrossFightRewardLayer = class("CrossFightRewardLayer",BaseLayer)

function CrossFightRewardLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.kuafuwulin.KuaFuReward")
end

function CrossFightRewardLayer:initUI( ui )

    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')

    self.txtList_Reward = {}
    local title_path = {
        "ui_new/wulin/img_mc1.png",
        "ui_new/wulin/img_mc2.png",
        "ui_new/crossfight/img_mc9.png",
        "ui_new/wulin/img_mc3.png",
        "ui_new/wulin/img_mc4.png",
        "ui_new/wulin/img_mc5.png",
        "ui_new/wulin/img_mc6.png",
        "ui_new/wulin/img_mc8.png",
    }
    for i=1,8 do
        self.txtList_Reward[i] = {}
        local page = TFDirector:getChildByPath(ui, 'bg_'..i)
        self.txtList_Reward[i].honor = TFDirector:getChildByPath(page, 'txt1')
        self.txtList_Reward[i].tongbi = TFDirector:getChildByPath(page, 'txt2')
        local title = TFDirector:getChildByPath(page, 'img_diyi')
        if title then
            title:setTexture(title_path[i])
        end
    end
    -- self:setReward()
end

function CrossFightRewardLayer:setReward(reward_type)
    local rewardList = ChampionsAwardData:getAllRewardDataByType(reward_type)
    print("reward_type = ",reward_type)
    print("ChampionsAwardData:getAllRewardDataByType(5) = ",rewardList)
    for i=1,8 do
        local reward = rewardList[i]:getReward()
        self.txtList_Reward[i].honor:setText(reward[1].number)
        self.txtList_Reward[i].tongbi:setText(reward[2].number)
    end
end

function CrossFightRewardLayer:removeUI()
    self.super.removeUI(self)
end

function CrossFightRewardLayer:onShow()
    self.super.onShow(self)
end

function CrossFightRewardLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
end

function CrossFightRewardLayer:removeEvents()
    self.super.removeEvents(self)
end

return CrossFightRewardLayer