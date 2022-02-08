-- ///////////////////////////////////////////////////
-- @Author:             yejiawei
-- @Create Date:        2016-12-15 11:43:11
-- @Title:              Type_ZhouNianH
-- @Describe:           活跃狂欢任务小单元
-- ///////////////////////////////////////////////////

local RewardItem = class("RewardItem", BaseLayer)
--type是任务id,status是领取状态,progress是进度
function RewardItem:ctor(id,progress,status)
    self.id = id
    self.progress = progress
    self.status = status
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.operatingactivities.RewardItem")

end

function RewardItem:initUI(ui)
    self.super.initUI(self,ui)

    self.item = {}
    for i=1,3 do
      self.item[i] = {}
      self.item[i]              = TFDirector:getChildByPath(ui, 'img_bg_' .. i)
      self.item[i].icon         = TFDirector:getChildByPath(ui, 'img_icon_' .. i)
      self.item[i].number       = TFDirector:getChildByPath(ui, 'txt_number_' .. i)
      self.item[i]:setVisible(false)
    end
    self.txt_desc1                  = TFDirector:getChildByPath(ui, 'txt_desc1')
    self.txt_desc2                  = TFDirector:getChildByPath(ui, 'txt_desc2')
    self.txt_desc2:setVisible(false)
    self.txt_title                  = TFDirector:getChildByPath(ui, 'txt_title')
    self.txt_maxwarning             = TFDirector:getChildByPath(ui, 'txt_maxwarning')
    self.btn_get                    = TFDirector:getChildByPath(ui, 'btn_get')
    self.btn_get.logic              = self
    self.img_ylq                    = TFDirector:getChildByPath(ui, 'img_ylq')
    self.txt_maxwarning:setVisible(false)
    self.txt_title:setText("")
    local Data = CarniValData:objectByID(self.id)     
    local Desc = stringUtils.format(Data.desc,self.progress)..'/'..Data.target
    self.txt_desc1:setText(Desc)
    local rewardItem = {}
    local tem = string.split(Data.reward,'|')

    self.rewardItems = tem
    self:refreshUI()
end

function RewardItem:removeUI()
    self.super.removeUI(self)
end

function RewardItem:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function RewardItem:dispose()
    self.super.dispose(self)
end
function RewardItem:setStatus(progress,status) 
    self.progress = progress
    self.status = status
    self:refreshStatus()
end
function RewardItem:setStatus1(status) 
    self.status = status
    self:refreshStatus()
end
function RewardItem:refreshStatus()
    local Data = CarniValData:objectByID(self.id)
    local Desc = stringUtils.format(Data.desc,self.progress..'/'..Data.target)
    self.txt_desc1:setText(Desc)
    if Data.target > self.progress then
        self.btn_get:setGrayEnabled(true)
        self.btn_get:setTouchEnabled(false)
    else 
        self.btn_get:setGrayEnabled(false)
        self.btn_get:setTouchEnabled(true)
    end
    --已领取
    if self.status == 2 then
        self.img_ylq:setVisible(true)
        self.btn_get:setVisible(false)
    else 
        self.img_ylq:setVisible(false)
        self.btn_get:setVisible(true)
    end
end
--[[
刷新界面
]]
function RewardItem:refreshUI()
    -- print("refreshCarnivalUI")
    local rewardItems = self.rewardItems -- self.rewardConfigure:getReward()
  --初始化隐藏按钮
    for i=1,3 do
          self.item[i]:setVisible(false)
    end
    for i,data in pairs(rewardItems) do
        if (data and data ~= "") then
            local info          = string.split(data, "_")
            local itemType      = tonumber(info[1])
            local itemId        = tonumber(info[2])
            local itemNum       = tonumber(info[3])
            local btn           = self.item[i]

            if (btn) then
                btn:setVisible(true)            
                btn.itemId          = itemId
                btn.itemType      = itemType
                btn:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
                local item = ItemData:objectByID(itemId) 
                if (item) then
                    local iconStr = item:GetPath()
                    btn.icon:setTexture(iconStr)
                    btn:setTexture(GetColorIconByQuality(item.quality))
                end
                if itemType == EnumDropType.COIN then 
                    btn.icon:setTexture(GetCoinIcon())
                    btn:setTexture(GetColorIconByQuality(4))
                elseif itemType == EnumDropType.SYCEE then
                    btn.icon:setTexture(GetSyceeIcon())
                    btn:setTexture(GetColorIconByQuality(4))
                end

                    
                btn.number:setText(itemNum)
            end
        end
    end
    self:refreshStatus()
end
--显示奖励
function RewardItem.onShowItemClickHandle(sender)
    local self = sender.logic
    if sender.itemType == 3 then
        Public:ShowItemTipLayer(nil, EnumDropType.COIN)
    elseif sender.itemType == 4 then
        Public:ShowItemTipLayer(nil, EnumDropType.SYCEE)
    else
        Public:ShowItemTipLayer(sender.itemId, sender.itemType)
    end
end
function RewardItem.GetReward(sender)
    self = sender.logic
    local Data = CarniValData:objectByID(self.id)  
    AnniversaryManager:RequireAnniversaryReward(self.id, Data.activityType, Data.missionType)
end
function RewardItem:registerEvents()
    self.super.registerEvents(self)

    self.btn_get:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.GetReward),1)
    
end

function RewardItem:removeEvents()
    self.super.removeEvents(self)
end

return RewardItem