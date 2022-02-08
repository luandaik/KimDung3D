local FengYunLuRewardLayer = class("FengYunLuRewardLayer", BaseLayer);

CREATE_SCENE_FUN(FengYunLuRewardLayer);
CREATE_PANEL_FUN(FengYunLuRewardLayer);

--[[
风云录奖励
]]
local path  = {"ui_new/fengyunlu/tab_gk1.png","ui_new/fengyunlu/tab_gk2.png","ui_new/fengyunlu/tab_gk3.png","ui_new/fengyunlu/tab_zphjl.png"}
local path1 = {"ui_new/fengyunlu/tab_gk1_h.png","ui_new/fengyunlu/tab_gk2_h.png","ui_new/fengyunlu/tab_gk3_h.png","ui_new/fengyunlu/tab_zphjl_h.png"}
local Ranking = {"ui_new/leaderboard/no1.png", "ui_new/leaderboard/no2.png", "ui_new/leaderboard/no3.png"}
function FengYunLuRewardLayer:ctor(data)
    self.super.ctor(self,data);
    
    self:init("lua.uiconfig_mango_new.fengyunlu.FengYunLuReward");
end


function FengYunLuRewardLayer:onShow()
    self.super.onShow(self)
    self:refreshUI();
end


function FengYunLuRewardLayer:initUI(ui)
    self.super.initUI(self,ui);
    --关卡选择

    self.guankabtn                 = {}  
    for i =1,4 do
        local btn = TFDirector:getChildByPath(ui, "tab_gk"..i)
        btn.index = i
        btn.logic = self
        self.guankabtn[i] = btn
    end
    self.myReard = {}
    for i = 1, 3 do 
        local btn = TFDirector:getChildByPath(ui, "Myimg_icon"..i)
        btn.img_icon = TFDirector:getChildByPath(btn, "img_icon")
        btn.txt_num = TFDirector:getChildByPath(btn, "txt_num")
        btn.logic = self
        btn:setVisible(false)
        self.myReard[i]= btn
    end
    self.btn_close =  TFDirector:getChildByPath(ui, "btn_close")
    --排行
    self.panel_reward =  TFDirector:getChildByPath(ui, "panel_reward")
    self.bg = TFDirector:getChildByPath(ui, "bg")
    self.bg:retain()
    self.bg:removeFromParent()
    --我的排名
    self.myRank     = TFDirector:getChildByPath(ui, "txtrankNo")
    self.myjiangli  = TFDirector:getChildByPath(ui, "panel_jiangli")

    self.index = 1
    self.EachRewardList = {}
    self.tableidx = 1
end
function FengYunLuRewardLayer:refreshStartLabel()
    for i =1 ,4 do
        self.guankabtn[i]:setTextureNormal(path[i])
    end
    self.guankabtn[self.index]:setTextureNormal(path1[self.index])
end
function FengYunLuRewardLayer:refreshUI()
    self.RewardList = ChampionsAwardData:getAllRewardDataByType(34 + self.index)
    self:refreshStartLabel()
    if self.RecordList ~= nil then
        self.RecordList:removeFromParent()
        self.RecordList = nil
    end
    self.RecordList = TFTableView:create()
    self.RecordList.logic = self
    local Size = self.panel_reward:getSize()
    self.RecordList:setTableViewSize(CCSizeMake(Size.width, Size.height))
    self.RecordList:setDirection(TFTableView.TFSCROLLVERTICAL)
    self.RecordList:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

    self.RecordList:addMEListener(TFTABLEVIEW_SIZEFORINDEX, FengYunLuRewardLayer.cellSizeForTable)
    self.RecordList:addMEListener(TFTABLEVIEW_SIZEATINDEX, FengYunLuRewardLayer.tableCellAtIndex)
    self.RecordList:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, FengYunLuRewardLayer.numberOfCellsInTableView)
    self.panel_reward:addChild(self.RecordList)
    self.RecordList:reloadData()

    --自己的信息
    for i =1 ,3 do
        self.myReard[i]:setVisible(false)
    end
    if FengYunLuManager.MyInfoinpass[self.index] and FengYunLuManager.MyInfoinpass[self.index].myRanking and FengYunLuManager.MyInfoinpass[self.index].myRanking ~=-1 then
        self.myRank:setText(FengYunLuManager.MyInfoinpass[self.index].myRanking)
        local ranking = FengYunLuManager.MyInfoinpass[self.index].myRanking
        for k,v in pairs(self.RewardList) do 
            if ranking >= v.min_rank and ranking <= v.max_rank then
                reward = self.RewardList[k]:getReward()
                for i = 1,#reward do
                    self.myReard[i]:setTouchEnabled(false)
                    if reward[i].type == EnumDropType.GOODS then
                        local item = ItemData:objectByID(reward[i].itemid)
                        if (item) then
                            local iconStr = item:GetPath()
                            self.myReard[i].img_icon:setTexture(iconStr)
                            self.myReard[i]:setTexture(GetColorIconByQuality(item.quality))
                            self.myReard[i].txt_num:setText(reward[i].number)
                            self.myReard[i]:setVisible(true)
                            self.myReard[i]:setTouchEnabled(true)
                            self.myReard[i].type = reward[i].type
                            self.myReard[i].itemId = reward[i].itemid
                            self.myReard[i]:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onShowItemClickHandle),1)
                        end
                    elseif reward[i].type == EnumDropType.FengYunLing then 
                        self.myReard[i].img_icon:setTexture("ui_new/fengyunlu/ui_fyl.png")
                        self.myReard[i]:setTexture(GetColorIconByQuality(4))
                        self.myReard[i].txt_num:setText(reward[i].number)
                        self.myReard[i]:setVisible(true)
                        self.myReard[i]:setTouchEnabled(true)
                        self.myReard[i].type = reward[i].type
                        self.myReard[i].itemId = reward[i].itemid
                        self.myReard[i]:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onShowItemClickHandle),1)
                    end
                end
            end
        end 
    else
        self.myRank:setText(localizable.shalu_info_txt1)
    end
end
function FengYunLuRewardLayer.cellSizeForTable(table,idx)
    return 120,754
end
function FengYunLuRewardLayer.numberOfCellsInTableView(table,idx)
    local self = table.logic
    return #self.RewardList or 0
end

function FengYunLuRewardLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.bg:clone()
        panel:setVisible(true)
        cell.panel = panel
        cell:addChild(panel)
    end

    cell.panel:setPosition(ccp(27,0))
    self:setCellData(cell.panel,idx + 1)
    return cell
end

function FengYunLuRewardLayer:setCellData(panel,index)
    local img_shunxu = TFDirector:getChildByPath(panel, "img_shunxu")
    local txt_num = TFDirector:getChildByPath(panel, "txt_num")
    img_shunxu:setVisible(false)
    txt_num:setVisible(false)
    if index <= 3 then
        img_shunxu:setVisible(true)
        img_shunxu:setTexture(Ranking[index])
    else
        txt_num:setVisible(true)
        txt_num:setText(stringUtils.format( localizable.arenarewardlayer_list,self.RewardList[index].min_rank,self.RewardList[index].max_rank))
    end
    local icon = {}
    for i =1, 3 do 
        local img_icon      = TFDirector:getChildByPath(panel, "img_icon"..i)
        img_icon.img_icon        = TFDirector:getChildByPath(img_icon, "img_icon")
        img_icon.txt_num    = TFDirector:getChildByPath(img_icon, "txt_num")
        img_icon:setVisible(false)
        icon[i] = img_icon
    end
    reward = self.RewardList[index]:getReward()
    for i = 1,#reward do
        icon[i]:setTouchEnabled(false)
        if reward[i].type == EnumDropType.GOODS then
            local item = ItemData:objectByID(reward[i].itemid)
            if (item) then
                local iconStr = item:GetPath()
                icon[i].img_icon:setTexture(iconStr)
                icon[i]:setTexture(GetColorIconByQuality(item.quality))
                icon[i].txt_num:setText(reward[i].number)
                icon[i]:setVisible(true)
                icon[i]:setTouchEnabled(true)
                icon[i].type = reward[i].type
                icon[i].itemId = reward[i].itemid
                icon[i]:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onShowItemClickHandle),1)
            end
        elseif reward[i].type == EnumDropType.FengYunLing then 
                icon[i].img_icon:setTexture("ui_new/fengyunlu/ui_fyl.png")
                icon[i]:setTexture(GetColorIconByQuality(4))
                icon[i].txt_num:setText(reward[i].number)
                icon[i]:setVisible(true)
                icon[i]:setTouchEnabled(true)
                icon[i].type = reward[i].type
                icon[i].itemId = reward[i].itemid
                icon[i]:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onShowItemClickHandle),1)
        end
        -- elseif reward[i].type == EnumDropType.LOWHONOR then 
        --     icon[i].img_icon:setTexture(GetResourceIconForGeneralHead(reward[i].type))
        --     icon[i]:setTexture(GetColorIconByQuality(4))
        --     icon[i].txt_num:setText(reward[i].number)
        --     icon[i]:setVisible(true)
        --     icon[i]:setTouchEnabled(true)
        --     icon[i].type = reward[i].type
        --     icon[i].itemId = reward[i].itemid
        --     icon[i]:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onShowItemClickHandle),1)
        -- elseif reward[i].type == EnumDropType.HIGHTHONOR then
        --     icon[i].img_icon:setTexture(GetResourceIconForGeneralHead(reward[i].type))
        --     icon[i]:setTexture(GetColorIconByQuality(5))
        --     icon[i].txt_num:setText(reward[i].number)
        --     icon[i]:setVisible(true)
        --     icon[i]:setTouchEnabled(true)
        --     icon[i].type = reward[i].type
        --     icon[i].itemId = reward[i].itemid
        --     icon[i]:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onShowItemClickHandle),1)
        -- end
    end
    
end
function FengYunLuRewardLayer.onShowItemClickHandle(sender)
    -- local self = sender.logic;
    if sender.itemId == nil then
        Public:ShowItemTipLayer(nil, sender.type)
    else
        Public:ShowItemTipLayer(sender.itemId,sender.type)
    end
end
function FengYunLuRewardLayer.onGoClickHandle(sender)
    local self = sender.logic;

end

function FengYunLuRewardLayer:removeUI()
    self.super.removeUI(self);
    
end

function FengYunLuRewardLayer:registerEvents()
    self.super.registerEvents(self);
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
    for i = 1, 4 do
        self.guankabtn[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onClickHandle),1)
    end
    for i = 1,3 do 
        self.myReard[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShowItemClickHandle),1)
    end
    -- self.btn_lszr:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAttackClickHandle),1)
    -- self.btn_phjl:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnbutStrengthClickHandle),1)
    -- self.btn_fyb:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnHelp),1)
    -- self.btn_tz:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnHelp),1)

    -- self.refreshlist = function(event)
    --     self:refreshUI()
    -- end

    -- TFDirector:addMEGlobalListener(HeroListManager.OPEN_HERO_AMBITION, self.refreshlist)
end

function FengYunLuRewardLayer.onClickHandle(sender)
    local self = sender.logic
    self.index = sender.index
    self:refreshUI()
end
function FengYunLuRewardLayer:removeEvents()
    self.super.removeEvents(self);

    -- TFDirector:removeMEGlobalListener(HeroListManager.OPEN_HERO_AMBITION, self.refreshlist)
    -- self.refreshlist = nil

    
end
function FengYunLuRewardLayer:dispose()
    self.super.dispose(self)
end

return FengYunLuRewardLayer;
