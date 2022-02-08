-- client side XiakexingReward.lua
--[[
 * @Description: 木人桩活动结算界面
 ]]
-- script writer wuqi
-- creation time 2016-11-18
local XiakexingReward = class("XiakexingReward", BaseLayer)

local numOfCol = 5

function XiakexingReward:ctor(data)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.xiakexing.XiakexingReward")
end

function XiakexingReward:initUI(ui)
    self.super.initUI(self, ui)

    self.scroll_view = TFDirector:getChildByPath(ui, 'scroll_view')

    --self.layer_list = TFDirector:getChildByPath(self, 'Panel_XiakexingReward_1')
    self.panel_content = TFDirector:getChildByPath(self, 'Panel_XiakexingReward_1')

    self.img_heibg = TFDirector:getChildByPath(self, "img_heibg")
    self.img_heibg2 = TFDirector:getChildByPath(self, "img_heibg2")

    self.txt_benci = TFDirector:getChildByPath(self.img_heibg, "txt_number")
    self.txt_history = TFDirector:getChildByPath(self.img_heibg2, "txt_number")
end

function XiakexingReward:loadData(rewardList, logic, func)
    self.rewardList = rewardList
    self.count = #self.rewardList

    self.logic = logic
    self.func = func

    if self.count <= 10 then
        self.scroll_view:setInnerContainerSize(CCSizeMake(710, 365))
        self.panel_content:setPosition(ccp(0, 365))
    elseif self.count <= 30 then
        self.scroll_view:setInnerContainerSize(CCSizeMake(710, 850))
        self.panel_content:setPosition(ccp(0, 850))
    elseif self.count <= 40 then
        local delta = self.count - 30
        local num = math.ceil(delta / 5)
        self.scroll_view:setInnerContainerSize(CCSizeMake(710, 850 + 150 * num))
        self.panel_content:setPosition(ccp(0, 850 + 150 * num))
    elseif self.count <= 55 then
        local delta = self.count - 40
        local num = math.ceil(delta / 5)
        self.scroll_view:setInnerContainerSize(CCSizeMake(710, 1150 + 130 * num))
        self.panel_content:setPosition(ccp(0, 1150 + 130 * num))
    else
        local delta = self.count - 40
        local num = math.ceil(delta / 5)
        self.scroll_view:setInnerContainerSize(CCSizeMake(710, 1150 + 140 * num))
        self.panel_content:setPosition(ccp(0, 1150 + 140 * num))
    end 

    self.txt_benci:setText( WoodActivityManager:getTotalDis() )
    self.txt_history:setText( WoodActivityManager:getHistoryBest() )

    local timerID = TFDirector:addTimer(150, 1, nil, 
    function() 
        TFDirector:removeTimer(timerID)
        self.roleIndex = 1
        self:OnIconShowEnd()
    end)
end

function XiakexingReward:OnIconShowEnd()
    if self.roleIndex > #self.rewardList then
        self.getCardCompelete = true
    else
        local reward = self.rewardList[self.roleIndex]
        local roleTypeId = self.rewardList[self.roleIndex].resId
        if self.rewardList[self.roleIndex].resType == EnumDropType.ROLE then
            local newCardRoleData = RoleData:objectByID(roleTypeId)
            if newCardRoleData ~= nil then
                if newCardRoleData.quality >= QUALITY_JIA then
                    play_wanlijiajichuxian()
                    
                    local layer = require("lua.logic.woodActivity.WoodHero"):new({reward.resId,self.roleIndex})
                    layer:setParent(self)
                    AlertManager:addLayer(layer, AlertManager.BLOCK)
                    AlertManager:show()             
                else
                    self:ShowRoleIcon(self.roleIndex)
                end
            end
        else
            self:ShowRoleIcon(self.roleIndex)
        end
    end
end

function XiakexingReward:ShowRoleIcon(roleIndex)
    self.roleIndex = self.roleIndex + 1 
    
    local row = math.floor( roleIndex / 5 )
    local mod = math.fmod( roleIndex, 5 )
    if mod == 0 then
        row = row - 1
    end 
    row = row + 1
    local posX = math.fmod(roleIndex - 1,5) * 140 + 75  
    local posY = row * -140 + 70
    -------------
    local scroll_pos = self.scroll_view:getContentOffset()
    print("scroll_pos-----------------------")
    print(scroll_pos)
    local contentY =-475 + (row - 2) * 140
    if self.count > 30 then
        local delta = self.count - 30
        local num = math.ceil(delta / 5)
        contentY =-475 + (row - 2) * 140 - 150 * num
    end
    local pos ={x = 0, y = contentY }
    if row > 2 then     
        if self.currRow ~= row then
            self.currRow = row
            self.scroll_view:setContentOffset(pos, 0.2)
        end 
    end 

    local item = self.rewardList[roleIndex]
    local roleTypeId = item.resId
    local newCardRoleData = nil
    local path = nil
    if item.resType == EnumDropType.ROLE then
        newCardRoleData = RoleData:objectByID(roleTypeId)
        if newCardRoleData == nil then
          --  print('roleTypeId = ', roleTypeId)
        end
        path = newCardRoleData:getIconPath()
    else
        local data = {}
        data.type   = item.resType
        data.itemId = item.resId
        data.number = item.number

        newCardRoleData = BaseDataManager:getReward(data)
        path = newCardRoleData.path
    end

    if newCardRoleData ~= nil then
        local roleQualityImg = TFImage:create()
        roleQualityImg:setTexture(GetColorIconByQuality(newCardRoleData.quality))
        --roleQualityImg:setAnchorPoint(ccp(1, 0))
        roleQualityImg:setPosition(ccp(posX, posY))
        roleQualityImg:setScale(1)
        roleQualityImg:setOpacity(0)
        self.panel_content:addChild(roleQualityImg,100)

        local roleIcon = TFImage:create()
        roleQualityImg:addChild(roleIcon)
        roleIcon:setTexture(path)
        roleIcon:setTouchEnabled(true)
        roleIcon:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            Public:ShowItemTipLayer(roleTypeId, item.resType)
        end))

        if item.resType == EnumDropType.GOODS then
            local rewardItem = {itemid = roleTypeId}
            Public:addPieceImg(roleIcon,rewardItem,nil,1.0)
        end
        local txt_num = TFLabelBMFont:create()
        txt_num:setFntFile("font/num_212.fnt")

        txt_num:setAnchorPoint(ccp(1, 0))
        txt_num:setPosition(ccp(52, -60))
        txt_num:setText(item.number)
        -- txt_num:setFontSize(20)
        roleQualityImg:addChild(txt_num)
        if item.mulriple and item.mulriple > 1 then
            self:addTag(roleQualityImg,item.mulriple)
        end

        local roleTween = 
        {
            target = roleQualityImg,
            {
                duration = 0.1,
                alpha = 255,
                scale = 1 ,
            },

            onComplete = function ()
                self:OnIconShowEnd()
            end
        }
        TFDirector:toTween(roleTween)
    end
end

function XiakexingReward:addTag(node,num)
    local img_tag = TFImage:create()
    node:addChild(img_tag)
    img_tag:setTexture('ui_new/treasure/img_jiaobiao.png')
    img_tag:setPosition(ccp(-32, 37))
    local txt_num = TFLabelBMFont:create()
    txt_num:setFntFile("font/num_227.fnt")

    txt_num:setAnchorPoint(ccp(1, 0.5))
    txt_num:setRotation(-40)
    txt_num:setPosition(ccp(-29, 50))
    txt_num:setText(num)
    if num > 9 then
        txt_num:setScale(0.7)
    end
    node:addChild(txt_num)
end

function XiakexingReward:removeUI()
    self.super.removeUI(self)  
    if self.logic and self.func then
        self.func(self.logic)
    end
end

function XiakexingReward:onShow()
    self.super.onShow(self)
end

function XiakexingReward:registerEvents()
    self.super.registerEvents(self)
    self.ui.logic = self
    self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPanelClickHandle))
end

function XiakexingReward:setLogic(logic)
    self.logic = logic
end

function XiakexingReward.onPanelClickHandle(sender)
    local self = sender.logic

    AlertManager:close()
end

function XiakexingReward:removeEvents()
    self.super.removeEvents(self)
end


function XiakexingReward:dispose()
    self.super.dispose(self)
end

return XiakexingReward