--[[
******奖励结果列表*******

    -- by haidong.gan
    -- 2013/11/27
]]
local RewardListMessage = class("RewardListMessage", BaseLayer);

CREATE_SCENE_FUN(RewardListMessage);
CREATE_PANEL_FUN(RewardListMessage);

local ShowMaxNum = 8

function RewardListMessage:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.common.RewardListMessage");
end

function RewardListMessage:initUI(ui)
    self.super.initUI(self,ui);

    self.btn_ok             = TFDirector:getChildByPath(ui, 'btn_ok');
    self.bg              = TFDirector:getChildByPath(ui, 'bg');
    self.txt_cishu              = TFDirector:getChildByPath(ui, 'txt_cishu');

    self:addEffect("get_reward")
    self.node_reward    = TFDirector:getChildByPath(ui, 'node_reward');
    self.node_reward_positionX = self.node_reward:getPosition().x
    self.bg_width = self.bg:getSize().width

    self.txt_cishu:setVisible(false)
end

function RewardListMessage:addEffect(effectName)
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/"..effectName..".xml")
    local effect = TFArmature:create(effectName.."_anim")
    if effect ~= nil then
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 1)
        effect:setPosition(ccp(568, 136))
        effect:setZOrder(11)
        self.bg:addChild(effect)
    end
end

function RewardListMessage:loadData(rewardList,isShowTxt)
    if isShowTxt == nil then
        isShowTxt = false
    end
    self.rewardList = rewardList;
    self:refreshUI();
    self.txt_cishu:setVisible(isShowTxt)
end

function RewardListMessage:setTextSHow( txt )
    self.txt_cishu:setVisible(true)
    self.txt_cishu:setText(txt)
end

function RewardListMessage:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function RewardListMessage:refreshBaseUI()

end

function RewardListMessage:refreshUI()
    print("RewardListMessage:refreshUI-------------111")
    -- self.node_reward:removeAllChildren();

    local rewardList = self.rewardList;

    local cell_width = 115;
    local length = math.min(ShowMaxNum , #rewardList) 
    local width = cell_width * length
    if #rewardList > ShowMaxNum then
        width = 1136
    elseif length <= 1 then
        width = cell_width + 30
    end
    if self.tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setName("btnTableView")
        self.tableView = tableView
        self.tableView.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, RewardListMessage.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, RewardListMessage.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, RewardListMessage.numberOfCellsInTableView)
        self.bg:addChild(self.tableView,1)
        -- tableView:setClippingEnabled(false)
    end
    self.tableView:setTableViewSize(ccs(width,self.node_reward:getSize().height))
    self.tableView:setDirection(TFTableView.TFSCROLLHORIZONTAL)
    if #rewardList > ShowMaxNum then
        self.tableView:setInertiaScrollEnabled(true)
    else
        self.tableView:setInertiaScrollEnabled(false)
    end
    self.tableView:setPosition(ccp(self.node_reward_positionX + (cell_width - width)/2  ,self.node_reward:getPosition().y))
    self.tableView:reloadData();
    print("RewardListMessage:refreshUI-------------222")
end


function RewardListMessage.cellSizeForTable(table,idx)
    return 150,115
end

function RewardListMessage.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    local rewardList = table.logic.rewardList;
    local num = #table.logic.rewardList
    local reward = nil

    reward = rewardList[idx + 1]

    local rewardItem = ItemData:objectByID(reward.id)

    if rewardItem then
        reward.name = rewardItem.name
        reward.path = rewardItem:GetPath()
        reward.quality = rewardItem.quality
        reward.type = EnumDropType.GOODS
    else
        local info = BaseDataManager:getReward(reward)
        reward.itemid = nil
        reward.name = info.name
        reward.path = GetResourceIcon(reward.type)
        reward.quality = info.quality
    end

    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        local reward_item = createUIByLuaNew("lua.uiconfig_mango_new.common.IconRewardItem");
        reward_item:setVisible(true)
        self:loadIconNode(reward_item,reward)

        reward_item:setPosition(ccp(0,-5))
        reward_item:setScale(0.85)

        cell.reward_item = reward_item
        cell:addChild(reward_item);
    else
        self:loadIconNode(cell.reward_item,reward)
    end
    return cell
end

function RewardListMessage.numberOfCellsInTableView(table)
    local num = #table.logic.rewardList
    return num
end

function RewardListMessage:removeUI()
   self.super.removeUI(self);
end

--注册事件
function RewardListMessage:registerEvents()
    self.super.registerEvents(self);

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_ok);
end

function RewardListMessage:removeEvents()
    self.super.removeEvents(self)
    self.btn_ok:removeMEListener(TFWIDGET_CLICK)
end

function RewardListMessage:loadIconNode(node,rewardItem,isShowOne)
     if isShowOne == nil then
        isShowOne = false
    end
    if node and rewardItem == nil then
        node:setVisible(false)
    end
    if node and rewardItem then
        node:setVisible(true)
        local img_icon  = TFDirector:getChildByPath(node, 'img_icon');
        local txt_num   = TFDirector:getChildByPath(node, 'txt_num');
        local txt_name  = TFDirector:getChildByPath(node, 'txt_name');
        local txt_namew = TFDirector:getChildByPath(node, 'txt_namew')
        local bg_icon   = TFDirector:getChildByPath(node, 'bg_icon');
        local btn_icon  = TFDirector:getChildByPath(node, 'btn_icon')
        txt_name:setVisible(false)
        txt_namew:setVisible(true)
        btn_icon:setVisible(false)

        if bg_icon then
            bg_icon:setTextureNormal(GetColorIconByQuality_118(rewardItem.quality));
            function onClick( sender )
                Public:ShowItemTipLayer(rewardItem.id, rewardItem.type, rewardItem.number);
            end
            bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
        end
        txt_namew:setText(rewardItem.name);
     
        if img_icon then
            img_icon:setTexture(rewardItem.path);
        end
        if txt_num then
            txt_num:setText(rewardItem.number);
            if rewardItem.number < 2 and isShowOne == false then
                txt_num:setVisible(false);
            else
                txt_num:setVisible(true);
            end
        end

        return node;
    end
end
return RewardListMessage;
