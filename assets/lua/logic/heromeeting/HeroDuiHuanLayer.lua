--[[
******英雄大会-兑换*******

    -- by jiawei.miao
    -- 2018/1/5
]]
local HeroDuiHuanLayer = class("HeroDuiHuanLayer", BaseLayer);

CREATE_SCENE_FUN(HeroDuiHuanLayer);
CREATE_PANEL_FUN(HeroDuiHuanLayer);

function HeroDuiHuanLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.hero.HeroDuiHuan");
end

function HeroDuiHuanLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function HeroDuiHuanLayer:refreshUI()
    self.txt_num:setText(MainPlayer:getResValueByType(EnumDropType.WEIWANG))
end

function HeroDuiHuanLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.panel_tiaomu    = TFDirector:getChildByPath(ui, 'panel_tiaomu')
    self.bg             = TFDirector:getChildByPath(ui, 'bg')
    self.bg:setVisible(false)
    self.bg:retain()
    self.bg:removeFromParent()
    self.bg:setVisible(false)
    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close')

    self.panel_wdww     = TFDirector:getChildByPath(ui, 'panel_wdww')
    self.txt_num        = TFDirector:getChildByPath(self.panel_wdww, 'txt_num')
    self.panel_wdpm     = TFDirector:getChildByPath(ui, 'panel_wdpm')
    self.txt_listnum    = TFDirector:getChildByPath(self.panel_wdpm, 'txt_listnum')

    self.rewardList = HeroDuiHuanData:getRewardList()
    self.rewardListcopy = {}
    for i = 1,#self.rewardList do 
        self.rewardListcopy[i] = self.rewardList[i].number
    end
    self.hero_Duihuan_tip = CCUserDefault:sharedUserDefault():getBoolForKey("hero_Duihuan_tip");
end

function HeroDuiHuanLayer:refreshList()
    if self.DuiHuanList == nil then
        self.DuiHuanList = TFTableView:create()
        self.DuiHuanList.logic = self
        local Size = self.panel_tiaomu:getSize()
        self.DuiHuanList:setTableViewSize(CCSizeMake(Size.width, Size.height))
        self.DuiHuanList:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.DuiHuanList:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.DuiHuanList:addMEListener(TFTABLEVIEW_SIZEFORINDEX, HeroDuiHuanLayer.cellSizeForTable)
        self.DuiHuanList:addMEListener(TFTABLEVIEW_SIZEATINDEX, HeroDuiHuanLayer.tableCellAtIndex)
        self.DuiHuanList:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, HeroDuiHuanLayer.numberOfCellsInTableView)
        self.panel_tiaomu:addChild(self.DuiHuanList)
    end
    self.DuiHuanList:reloadData()
    self:refreshUI()
end

function HeroDuiHuanLayer.cellSizeForTable(table,idx)
    return 141,100
end
function HeroDuiHuanLayer.numberOfCellsInTableView(table,idx)
    local self = table.logic
    return #self.rewardList
end

function HeroDuiHuanLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.bg:clone()
        panel.logic = self
        panel:setVisible(true)
        cell.panel = panel
        cell:addChild(panel)
    end

    cell.panel:setPosition(ccp(305,60))
    self:setCellData(idx + 1, cell.panel)
    return cell
end

function HeroDuiHuanLayer:setCellData(idx, panel)
    local self = panel.logic
    if self.rewardList[idx] == nil then
        panel:setVisible(false)
        return
    end
    local img_zhekou = TFDirector:getChildByPath(panel, 'img_zhekou')
    img_zhekou:setTexture("ui_new/operatingactivities/z"..self.rewardList[idx].rebate..".png")
    for i = 1 ,2 do
        local img_icon1 = TFDirector:getChildByPath(panel, 'img_icon'..i)
        local img_icon  = TFDirector:getChildByPath(img_icon1, 'img_icon')
        local txt_num   = TFDirector:getChildByPath(img_icon1, 'txt_num')
        if i == 1 then
            img_icon:setTouchEnabled(true)
            img_icon:setTexture(GetWeiWangCoinIcon())
            img_icon1:setTexture(GetColorIconByQuality(5))
            img_icon.itemId = nil
            img_icon.itemTypeId = EnumDropType.WEIWANG
            img_icon:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)

            txt_num:setText(math.ceil(self.rewardList[idx].prestige*self.rewardList[idx].rebate/10))
        else
            local info          = string.split(self.rewardList[idx].rewards, "_")
            local itemTypeId    = tonumber(info[1])
            local itemId        = tonumber(info[2])
            local itemNum       = tonumber(info[3])
            img_icon:setTouchEnabled(true)
            img_icon.itemId          = itemId
            img_icon.itemTypeId      = itemTypeId
            img_icon:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
            local item = ItemData:objectByID(itemId)
            if (item) then
                local iconStr = item:GetPath()
                img_icon:setTexture(iconStr)
                img_icon1:setTexture(GetColorIconByQuality(item.quality))
                txt_num:setText(itemNum)
            end
        end
    end
    local btn_get   = TFDirector:getChildByPath(panel, 'btn_get')
    btn_get.id = idx
    btn_get.logic = self
    if self.rewardListcopy[idx] == 0 then 
        btn_get:setGrayEnabled(true)
        btn_get:setTouchEnabled(false)
    else
        btn_get:setGrayEnabled(false)
        btn_get:setTouchEnabled(true)
        btn_get:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowClickHandle),1)
    end  
    local panel_sycs   = TFDirector:getChildByPath(panel, 'panel_sycs')
    local duihuannum = TFDirector:getChildByPath(panel_sycs, 'txt_num')
    duihuannum:setText(self.rewardListcopy[idx])
    local txt_xq    = TFDirector:getChildByPath(panel, 'txt_xq')
    txt_xq:setText(stringUtils.format(localizable.HERO_DUIHUAN_XQ,self.rewardList[idx].rank))

end

function HeroDuiHuanLayer:removeUI()
    if self.bg then
        self.bg:release()
        self.bg = nil
    end
    self.super.removeUI(self);
end

function HeroDuiHuanLayer:registerEvents()
    self.super.registerEvents(self);

    self.refreshtableList = function (event)
        self:refreshrewardList(event.data[1][1])
        self:refreshList()
        if event.data[1][1].rank ~= 0 then
            self.txt_listnum:setText(event.data[1][1].rank)
        else
            self.txt_listnum:setText(localizable.houshanRank_rank)
        end
    end
    TFDirector:addMEGlobalListener(HeroMeetingManager.GET_REBATE_CONVERT_INFO_RESPONSE,self.refreshtableList)

    self.refreshtableList1 = function (event)

        local id = event.data[1][1].convertId     
        self.rewardListcopy[id] = event.data[1][1].number
        self:refreshList()

    end
    TFDirector:addMEGlobalListener(HeroMeetingManager.REBATE_CONVERT_REWARD_RESPONSE,self.refreshtableList1)

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
end

function HeroDuiHuanLayer:refreshrewardList(data)
    if data and data.info then
        for i = 1,#data.info do 
            local id = data.info[i].convertId
            self.rewardListcopy[id] = self.rewardList[id].number - data.info[i].countNum
        end
    end
end

function HeroDuiHuanLayer.onShowItemClickHandle(sender)
    local self = sender.logic;
    if sender.itemId == nil then
        Public:ShowItemTipLayer(nil, sender.itemTypeId)
    else
        Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId)
    end
end
function HeroDuiHuanLayer.onShowClickHandle(sender)
    local self = sender.logic;
    if not self.hero_Duihuan_tip then
        CommonManager:showOperateSureTipLayer(
            function(data, widget)
                HeroMeetingManager:sendHeroDuihuan(sender.id)
                self:getHasTip(widget)
            end,
            function(data, widget)
                AlertManager:close()
                self:getHasTip(widget)
            end,
            {
                msg = '\n'..'\n'..localizable.HERO_DUIHUAN
            }
        )
    else
        HeroMeetingManager:sendHeroDuihuan(sender.id)
    end
end
function HeroDuiHuanLayer:getHasTip( widget )
    local state = widget:getSelectedState();
    if state == true then
        self.hero_Duihuan_tip = true
        CCUserDefault:sharedUserDefault():setBoolForKey("hero_Duihuan_tip", self.hero_Duihuan_tip);
        CCUserDefault:sharedUserDefault():flush();
        return
    end
end
function HeroDuiHuanLayer:removeEvents()
    -- TFDirector:removeMEGlobalListener(ClimbManager.updateInfo ,self.updateInfoCallBack);

    TFDirector:removeMEGlobalListener(HeroMeetingManager.GET_REBATE_CONVERT_INFO_RESPONSE,self.refreshtableList)
    self.refreshtableList = nil
    TFDirector:removeMEGlobalListener(HeroMeetingManager.REBATE_CONVERT_REWARD_RESPONSE,self.refreshtableList1)
    self.refreshtableList1 = nil 
    self.super.removeEvents(self);
end

return HeroDuiHuanLayer;
