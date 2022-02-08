-- client side ActivityDiscountReplyLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-08-12



local ActivityDiscountReplyLayer = class("ActivityDiscountReplyLayer", BaseLayer)

--CREATE_SCENE_FUN(ActivityDiscountReplyLayer)
CREATE_PANEL_FUN(ActivityDiscountReplyLayer)


function ActivityDiscountReplyLayer:ctor(data)
    self.super.ctor(self,data)

    self:init("lua.uiconfig_mango_new.common.ReplyIconLayer")
end

function ActivityDiscountReplyLayer:setInfo(inputlist,outlist,dislist,index,activityId)
    self.inputlist = inputlist;
    self.outlist = outlist;
    self.dislist = dislist;
    self.index = index;
    self.activityId = activityId
    self:drawInfo()
end

function ActivityDiscountReplyLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.btn_ok             = TFDirector:getChildByPath(ui, 'btn_ok')
    self.btn_cancel         = TFDirector:getChildByPath(ui, 'btn_cancel')
    self.txt_message        = TFDirector:getChildByPath(ui, 'txt_message')
    self.panel_bg           = TFDirector:getChildByPath(ui, 'img_bg')
    self.panel_cell         = TFDirector:getChildByPath(ui, 'Panel_icon')
    self.panel_cell:removeFromParent(true)
    self.panel_cell:retain()


end

function ActivityDiscountReplyLayer:removeUI()
    if self.panel_cell then
        self.panel_cell:release()
        self.panel_cell = nil
    end
	self.super.removeUI(self)
end

function ActivityDiscountReplyLayer:drawInfo()
    
    local size = self.panel_bg:getContentSize()
    local count = #self.dislist
    local perx = 136
    self.node_list = {}
    for i=1,count do
        local node = self.panel_cell:clone()
        local posX = perx * (i - 1) - perx * (count - 1)/2 
        node:setPositionX(posX)
        self.panel_bg:addChild(node,1)
        local holdNum = BagManager:getItemNumById(self.dislist[i].itemid)
        -------------------------------------
        self.node_list[i] = {}
        self.node_list[i].node = node
        self.node_list[i].txt = TFDirector:getChildByPath(node, 'txt_yongyouzuo')
        self.node_list[i].txt:setText(stringUtils.format(localizable.activity_discount_holdnum,holdNum))
        self.node_list[i].icon_bg = TFDirector:getChildByPath(node, 'btn_iconbg1')
        self.node_list[i].icon_bg:setTextureNormal(GetColorIconByQuality(self.dislist[i].quality))
        self.node_list[i].icon_bg.idx = i
        self.node_list[i].icon_bg.logic = self
        self.node_list[i].icon_bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSelectDiscount),1)

        self.node_list[i].img_icon = TFDirector:getChildByPath(node, 'img_icon')
        self.node_list[i].img_icon:setTexture(self.dislist[i].path)
        self.node_list[i].img_xuanzhongz1 = TFDirector:getChildByPath(node, 'img_xuanzhongz1')
        self.node_list[i].img_xuanzhongz2 = TFDirector:getChildByPath(node, 'img_xuanzhongz2')
    end
    self.selectIdx = 1
    self:showInfo(self.selectIdx)
end

function ActivityDiscountReplyLayer.onSelectDiscount(sender)
    local self = sender.logic;
    if self.selectIdx == sender.idx then
        self.selectIdx = 0
        self:showInfo(0)
        return
    end
    self.selectIdx = sender.idx
    self:showInfo(self.selectIdx)
end

function ActivityDiscountReplyLayer:showInfo(idx)
    for i=1,#self.node_list do
        if idx == i then
            self.node_list[i].img_xuanzhongz1:setVisible(true)
            self.node_list[i].img_xuanzhongz2:setVisible(true)
            self.node_list[i].icon_bg:setColor(ccc3(255,255,255))
        else
            self.node_list[i].img_xuanzhongz1:setVisible(false)
            self.node_list[i].img_xuanzhongz2:setVisible(false)
            self.node_list[i].icon_bg:setColor(ccc3(128,128,128))
        end
    end
    local discountNum = 1
    if idx > 0 then
        local itemid = self.dislist[idx].itemid
        local goodInfo = ItemData:objectByID(itemid)
        discountNum = goodInfo.usable * 0.01
    end
    local inputStr = ""
    local count = 0
    for v in self.inputlist:iterator() do
        if count > 0 then
            inputStr = inputStr .. ","
        end
        count = count + 1
        inputStr = inputStr .. v.name.."X".. math.floor(v.number * discountNum)
    end
    print("inputStr = ", inputStr)

    local  outStr = ""
    count = 0
    for v in self.outlist:iterator() do
        if count > 0 then
            outStr = outStr .. ","
        end
        count = count + 1
        outStr = outStr .. v.name.."X"..v.number
    end
    print("outStr = ", outStr)

    -- OperationActivitiesManager:sendMsgToGetActivityReward(self.type, self.index)
    --local warningMsg = "大侠，是否使用 ["..inputStr.."] 兑换 ["..outStr.."] ?"
    local warningMsg = stringUtils.format(localizable.exchangeCell_exchange_tips,inputStr,outStr)
    self.txt_message:setText(warningMsg)
end

function ActivityDiscountReplyLayer.onOkClickHandle(sender)
    local self = sender.logic;
    local discountNum = 1
    local itemid = nil
    if self.selectIdx > 0 then
        itemid = self.dislist[self.selectIdx].itemid
        local goodInfo = ItemData:objectByID(itemid)
        discountNum = goodInfo.usable * 0.01
    end
    for v in self.inputlist:iterator() do
        local info = {}
        info.type = v.type
        info.number = math.floor(v.number * discountNum) 
        info.itemid = v.itemid
        info.isDiscount = true
        if MainPlayer:getGoodsIsEnough(info) == false then
            toastMessage(stringUtils.format(localizable.exchangeCell_not_enough,v.name))
            return
        end
    end
    AlertManager:close()
    local info = self.inputlist:objectAt(1)
    local targetSrc = ""
    if (info) then
        targetSrc     = info.type..","..info.itemid..","..info.number
    end

    OperationActivitiesManager:sendMsgToGetActivityReward(self.activityId, self.index,nil,itemid,targetSrc)
end


function ActivityDiscountReplyLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_cancel);

    self.btn_ok.logic = self;
    self.btn_ok:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onOkClickHandle),1)
end


return ActivityDiscountReplyLayer
