-- ///////////////////////////////////////////////////
-- @Author:             yejiawei
-- @Create Date:        2016-12-15 11:43:11
-- @Title:              Type_ZhouNianH
-- @Describe:           兑换狂欢任务小单元
-- ///////////////////////////////////////////////////

local Exchange = class("Exchange", BaseLayer)
--type是任务id,status是进度
function Exchange:ctor(id, status)
  -- 
    self.id = id
    self.status = status
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.operatingactivities.Exchange")

end

function Exchange:initUI(ui)
    self.super.initUI(self,ui)

    self.Receive = false
    self.item = {}
    for i=1,3 do
      self.item[i] = {}
      self.item[i]              = TFDirector:getChildByPath(ui, 'img_bg_' .. i)
      self.item[i].icon         = TFDirector:getChildByPath(ui, 'img_icon_' .. i)
      self.item[i].number       = TFDirector:getChildByPath(ui, 'txt_number_' .. i)
      self.item[i]:setVisible(false)
    end
    self.Image_Exchange_1           = TFDirector:getChildByPath(ui, 'Image_Exchange_1')
    self.txt_times                  = TFDirector:getChildByPath(ui, 'txt_times')
    self.txt_num1                   = TFDirector:getChildByPath(ui, 'txt_num1')
    self.txt_num2                   = TFDirector:getChildByPath(ui, 'txt_num2')
    self.Button_Exchange_1                    = TFDirector:getChildByPath(ui, 'Button_Exchange_1')
    self.Button_Exchange_1.logic              = self
    self.txt_num1:setVisible(true)
    self.txt_num2:setVisible(true)
    self.item[1].number:setVisible(false)
    self.Image_Exchange_1:setVisible(false)
    local Data = CarniValShopData:objectByID(self.id)  
    self.status = Data.chance 
    self.txt_times:setText(self.status)
    local tem = string.split(Data.goods,'|')
    self.rewardItems = {}
    self.rewardItems[1] = Data.coin_num
    self.rewardItems[2] = tem[1]
    self.rewardItems[3] = tem[2]
    self:refreshUI()
end

function Exchange:removeUI()
    self.super.removeUI(self)
end

function Exchange:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function Exchange:dispose()
    self.super.dispose(self)
end
function Exchange:setStatus(status) 
    self.status = status
    self:refreshStatus()
end
function Exchange:refreshStatus()
    local itemId = tonumber(string.split(self.rewardItems[1], "_")[2])
    
    local bagInfo = BagManager:getItemById(itemId)
    local coinNum = 0
    if bagInfo then
        coinNum = bagInfo.num
    end
    self.txt_num1:setText(coinNum)
    local tmpWidth = self.txt_num2:getContentSize().width
    self.txt_num1:setPositionX(self.txt_num2:getPositionX() - tmpWidth)
    self.txt_num2:setText('/'..self.CoinNum)
    if coinNum < self.CoinNum or self.status <= 0 then
        self.Receive = false

        self.Button_Exchange_1:setGrayEnabled(true)
        self.Button_Exchange_1:setTouchEnabled(false)
    else 
        self.Receive = true
        self.Button_Exchange_1:setGrayEnabled(false)
        self.Button_Exchange_1:setTouchEnabled(true)
    end
    self.txt_times:setText(self.status)
end
--[[
刷新界面
]]
function Exchange:refreshUI()
    local rewardItems = self.rewardItems -- self.rewardConfigure:getReward()
    --print(rewardItems)
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
                if itemNum ~= 1 then      
                    btn.number:setText(itemNum)
                else 
                    btn.number:setVisible(false)
                end
                --第一个是兑换币
                if i == 1 then
                    --这一条奖励需要的兑换币数量
                    self.CoinNum = itemNum
                end
            end
        end
    end
    self:refreshStatus()
end
--显示奖励
function Exchange.onShowItemClickHandle(sender)
    local self = sender.logic
    if sender.itemType == 3 then
        Public:ShowItemTipLayer(nil, EnumDropType.COIN)
    elseif sender.itemType == 4 then
        Public:ShowItemTipLayer(nil, EnumDropType.SYCEE)
    else
        Public:ShowItemTipLayer(sender.itemId, sender.itemType)
    end
end
function Exchange.GetReward(sender)
    self = sender.logic
    AnniversaryManager:ExchangeRewardRequest(self.id)
end
function Exchange:registerEvents()
    self.super.registerEvents(self)

    self.Button_Exchange_1:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.GetReward),1)
end

function Exchange:removeEvents()
    self.super.removeEvents(self)
end

return Exchange