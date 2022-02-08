--[[
******无量山-万能副本未开放*******

    -- by Stephen.tao
    -- 2014/2/27
]]

local CarbonNotOpenLayer = class("CarbonNotOpenLayer", BaseLayer)

--CREATE_SCENE_FUN(CarbonNotOpenLayer)
CREATE_PANEL_FUN(CarbonNotOpenLayer)


function CarbonNotOpenLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.climb.CarbonNotOpenLayer");
end

function CarbonNotOpenLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.btn_ok             = TFDirector:getChildByPath(ui, 'btn_ok')
    self.btn_close          = TFDirector:getChildByPath(ui, 'btn_close')

    self.txt_message        = TFDirector:getChildByPath(ui, 'txt_message')
    self.img_title          = TFDirector:getChildByPath(ui, 'img_title')
    local scrollview        = TFDirector:getChildByPath(ui, 'scrollview')
    self.node_rewards = {}
    for i=1, ClimbManager.MaxDifficulty do
        self.node_rewards[i] = TFDirector:getChildByPath(ui, 'node_reward'..i)
    end
    local panel_content = TFDirector:getChildByPath(ui, 'panel_content')
    panel_content:setPositionY(0)
    scrollview:setInnerContainerSize(CCSizeMake(scrollview:getSize().width, ClimbManager.MaxDifficulty * 100 + 40))
    -- self.node_reward1           = TFDirector:getChildByPath(ui, 'node_reward1')
    -- self.node_reward2           = TFDirector:getChildByPath(ui, 'node_reward2')
    -- self.node_reward3           = TFDirector:getChildByPath(ui, 'node_reward3')
    -- self.node_reward4           = TFDirector:getChildByPath(ui, 'node_reward4')
end

function CarbonNotOpenLayer:loadData(stage)
    
    local stageList = {}
    for item in MoHeYaConfigure:iterator() do
        if (item.stage == stage) then
            stageList[item.difficulty] = item
        end
    end
   
    for i,v in ipairs(self.node_rewards) do
        local carbonItem = stageList[i]
        if (carbonItem) then
            local rewardList = ClimbManager:getSoulRewardItemList(carbonItem.id)
            local _index = 1;
            for reward in rewardList:iterator() do
                local rewardNode = Public:createIconNumNode(reward)
                rewardNode:setScale(0.6);
                rewardNode:setPosition((_index - 1) * 75,0)
                v:addChild(rewardNode);
                _index = _index + 1;
            end
        end
    end
    local carbonItem = stageList[1]
    if (carbonItem) then
        self.img_title:setTexture("ui_new/climb/img_soul_title_word" .. math.ceil(carbonItem.id / 4) .. ".png")
        self.txt_message:setText(carbonItem.open_description)
    end
end

function CarbonNotOpenLayer:removeUI()
    self.super.removeUI(self)
end


function CarbonNotOpenLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);

    self.btn_close:setClickAreaLength(100);
end


return CarbonNotOpenLayer
