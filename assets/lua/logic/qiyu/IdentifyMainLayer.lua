
-- client side IdentifyMainLayer.lua
--[[
 * @Description: 角色鉴定
 ]]
-- script writer Happy.All
-- creation time 2016-10-25 11:10:59

local IdentifyMainLayer = class("IdentifyMainLayer",BaseLayer)

IdentifyMainLayer.MOVE = 1 --只做移动
IdentifyMainLayer.MOVE_NUM = 2 --移动,数字变化
IdentifyMainLayer.EFFECT = 3 --特效完后显示
IdentifyMainLayer.SCALE = 4 --放大缩小变化



function IdentifyMainLayer:ctor(data)
    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.qiyu.IdentifyMain")
end

function IdentifyMainLayer:initUI( ui )

    self.super.initUI(self, ui)
    --左侧人物
    local imgRole = TFDirector:getChildByPath(ui, "img_role")
    local headId = MainPlayer:getHeadIconId() or 77
    local role = RoleData:objectByID(headId)
    imgRole:setTexture(role:getBigImagePath())


    if self.dataList == nil then
        self.dataList = TFArray:new()
    end

    self.dataList:clear()
    self.detailsInfo = IdentifyMainManager:getRoleDetails()
    for item in RoleIdentifyData:iterator() do
        local node_p = TFDirector:getChildByPath(ui, item.parent_name)
        node_p:setVisible(false)
        if self.detailsInfo[item.proto_child] ~= 0 then
            self.dataList:push(item)
        end
    end

    self.btn_fx = TFDirector:getChildByPath(ui, "btn_fx")
    local txt_tips = TFDirector:getChildByPath(ui, "txt_tips")
    local bShow = IdentifyMainManager:checkShowBtn()
    self.btn_fx:setVisible(false)
    txt_tips:setVisible(true)

    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")

    self.txt_jb = TFDirector:getChildByPath(self.ui, "txt_jb")
    self.txt_bfb = TFDirector:getChildByPath(self.txt_jb, "txt_bfb")
    self.txt_jb:setVisible(false)
    self.txt_bfb:setVisible(false)

    local txt_zqxk = TFDirector:getChildByPath(ui, "txt_zqxk")
    local txt_yyxks = TFDirector:getChildByPath(ui, "txt_yyxks")
    self.initPosY = txt_zqxk:getPositionY()
    self.initPosDy = txt_zqxk:getPositionY() - txt_yyxks:getPositionY()
end

function IdentifyMainLayer:removeUI()
    self.super.removeUI(self)    
end

function IdentifyMainLayer:onShow()
    self.super.onShow(self)
    if self.isFirstIn then
        self.isFirstIn = nil
        -- self:showCreateInfo()
        self:showDelayInfo()
    end
end

function IdentifyMainLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
    self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

    self.btn_fx:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnFxClick))

    self.isFirstIn = true
    self.registerEventCallFlag = true
end

function IdentifyMainLayer:removeEvents()
    self.super.removeEvents(self)
    self.registerEventCallFlag = nil  

    self.isFirstIn = nil

    if self.delayTimer then
        TFDirector:removeTimer(self.delayTimer)
        self.delayTimer = nil
    end

    for k,v in pairs(self.timerChangeNode) do
        if v.percentTimer then
            TFDirector:removeTimer(v.percentTimer)
            v.percentTimer = nil
        end
    end

    TFDirector:killAllTween()
end

function IdentifyMainLayer:dispose()
    self.super.dispose(self)
end

function IdentifyMainLayer:showDelayInfo()
    if self.delayTimer then
        TFDirector:removeTimer(self.delayTimer)
        self.delayTimer = nil
    end
    self.showDelayIndex = 1
    self.resetPosIndex = 1

    local function loopPlayEffect()
        local item = self.dataList:objectAt(self.showDelayIndex)
        local node_p = TFDirector:getChildByPath(self.ui, item.parent_name)
        local node_c = TFDirector:getChildByPath(node_p, item.child_name)
        local size = node_p:getContentSize()
        local widgetClassName = node_p:getDescription()
        -- if widgetClassName == "TFLabel" then
        --     node_c:setPositionX(size.width)
        -- end
        self:playNodeEffect(item)
        self.showDelayIndex = self.showDelayIndex + 1
    end
    -- loopPlayEffect()
    self.delayTimer = TFDirector:addTimer(50, -1, nil, function ()
        if self.showDelayIndex > self.dataList:length() then
            TFDirector:removeTimer(self.delayTimer)
            self.delayTimer = nil
            -- self:showPercentInfo()
        else
            loopPlayEffect()
        end
    end); 
end

function IdentifyMainLayer:playNodeEffect(item)
    -- print("playNodeEffect = ",item)

    local parentNode = TFDirector:getChildByPath(self.ui, item.parent_name)
    local childNode = TFDirector:getChildByPath(parentNode, item.child_name)
    if item.proto_parent ~= "" then
        parentNode:setText(self.detailsInfo[item.proto_parent])
    elseif item.remark ~= "" then
        parentNode:setText(item.remark)
    end
    childNode:setText(self.detailsInfo[item.proto_child])
    local size = parentNode:getContentSize()
    local widgetClassName = parentNode:getDescription()
    if item.indent == 1 then
        childNode:setPositionX(size.width)
    end

    if item.resetY == 1 then
        parentNode:setPositionY(self.initPosY - (self.initPosDy *(self.resetPosIndex - 1)))
        self.resetPosIndex = self.resetPosIndex + 1
    end
        


    if item.actionType == IdentifyMainLayer.MOVE then
        parentNode:setVisible(true)
        childNode:setVisible(true)
        local pos = parentNode:getPositionX()
        parentNode:setPositionX(pos + 100)
        local tweenMove = {
            target = parentNode,
            {
                duration = 0.05,            
                -- ease = {type=TFEaseType.EASE_BACK_OUT, rate=3},
                x = pos-10,
            },
            {
                duration = 0.05,            
                -- ease = {type=TFEaseType.EASE_BACK_OUT, rate=3},
                x = pos,
            },
            onComplete = function ()
                TFDirector:killTween(tweenMove)
            end
        }
        TFDirector:toTween(tweenMove)
    elseif item.actionType == IdentifyMainLayer.MOVE_NUM then
        parentNode:setVisible(true)
        childNode:setVisible(false)
        local pos = parentNode:getPositionX()
        parentNode:setPositionX(pos + 100)
        local tweenMove = {
            target = parentNode,
            {
                duration = 0.05,            
                -- ease = {type=TFEaseType.EASE_BACK_OUT, rate=3},
                x = pos-10,
            },
            {
                duration = 0.05,            
                -- ease = {type=TFEaseType.EASE_BACK_OUT, rate=3},
                x = pos,
            },
            onComplete = function ()
                TFDirector:killTween(tweenMove)
                self:playTimerChange(childNode, self.detailsInfo[item.proto_child])     
            end
        }
        TFDirector:toTween(tweenMove)
    elseif item.actionType == IdentifyMainLayer.EFFECT then
        parentNode:setVisible(false)
        childNode:setVisible(false)
        local resPath = "effect/ui/idebtifyRole.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        local effect = TFArmature:create("idebtifyRole_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        local size = parentNode:getParent():getContentSize()
        effect:setPosition(ccp(size.width/2+120, size.height/2-100))
        parentNode:getParent():addChild(effect, 1)
        local frameIdex = 1
        effect:addMEListener(TFARMATURE_UPDATE,function()
            if frameIdex == 8 then
                parentNode:setVisible(true)
                childNode:setVisible(true)
                self:playTimerChange(childNode, self.detailsInfo[item.proto_child])
            end
            frameIdex = frameIdex + 1
        end)
        effect:addMEListener(TFARMATURE_COMPLETE, function ()
            effect:setVisible(false)   
            self:showPercentInfo()
        end)
        effect:playByIndex(0, -1, -1, 0)
    elseif item.actionType == IdentifyMainLayer.SCALE then
        parentNode:setVisible(true)
        childNode:setVisible(true)
        local initScale = parentNode:getScale()
        parentNode:setScale(initScale*8)
        local tweenScale = {
            target = parentNode,
            {
                duration = 0.2,
                scale = initScale*0.5,   
            },
            {
                duration = 0.1,
                scale = initScale,   
            },
            onComplete = function ()
                TFDirector:killTween(tweenScale)
            end,
        }    
        TFDirector:toTween(tweenScale)
    end    
end

function IdentifyMainLayer:showPercentInfo()
    
    self.txt_jb:setVisible(true)
    self.txt_bfb:setVisible(true)
    local initScale = self.txt_jb:getScale()
    self.txt_bfb:setText(0)--self.detailsInfo["percent"])
    self.txt_jb:setScale(initScale*10)
    local tweenScale = {
        target = self.txt_jb,
        {
            duration = 0.1,
            scale = initScale*0.95,   
        },
        -- {
        --     duration = 0.1,
        --     scale = initScale*1.05,   
        -- },
        {
            duration = 0.1,
            scale = initScale,   
        },
        onComplete = function ()
            TFDirector:killTween(tweenScale)
            self:playTimerChange(self.txt_bfb, self.detailsInfo["percent"])
        end,
    }    
    TFDirector:toTween(tweenScale)

end
function IdentifyMainLayer:playTimerChange(node, desNum)
    
    self.timerChangeNode = self.timerChangeNode or {}
    self.timerChangeNode[#self.timerChangeNode + 1] = node

    local currPercent = 0
    node:setVisible(true)
    node:setText(currPercent)    

    node.percentTimer = TFDirector:addTimer(30, -1, nil, function ()
        if currPercent < desNum then
            node:setText(currPercent)
            currPercent = currPercent + math.ceil((desNum - currPercent)/2)
        else
            node:setText(desNum)
            if node.percentTimer then
                TFDirector:removeTimer(node.percentTimer)
                node.percentTimer = nil
            end
        end
    end)
end

function IdentifyMainLayer.onBtnFxClick( btn )
    -- IdentifyMainManager:ScreenShotHandle()
end
return IdentifyMainLayer