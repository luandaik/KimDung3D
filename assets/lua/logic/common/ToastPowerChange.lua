--[[
    弹框队列管理类

    --By: haidong.gan
    --2013/11/11
]]

--[[
--用法举例

toastMessage("baby");
toastMessage("baby",ccp(100, 100));

]]

function toastPowerChange(oldValue,newValue)
    if isAdd == nil then
        isAdd = false;
    end

    local currentScene = Public:currentScene();
    if currentScene.__cname == "FightResultScene" or currentScene.__cname == "FightScene" then
       return
    end
    local toastPowerLayer = currentScene:getChildByName("ToastPowerChange");
    local delay = 0
    if not toastPowerLayer then
        toastPowerLayer = ToastPowerChange:new("lua.uiconfig_mango_new.common.ToastPowerChange",showType);
    end
    delay,targetLayer = _getShowDelay()


    -- if not position then
    --     position = ToastPowerChange.DEFUALT_POSITION
    -- end
    toastPowerLayer:setPosition(ccp(GameConfig.WS.width/2, 110));
    if delay and delay > 0 then
        toastPowerLayer:delayToast(oldValue,newValue,delay,targetLayer)
    else
        toastPowerLayer:beginToast(oldValue,newValue);
    end
    return toastPowerLayer;
end

function _getShowDelay()
    local currentScene = Public:currentScene();
    local topLayer = currentScene:getTopLayer()
    local filterList = {
        {"RoleTransferLayer",1.71},
        {"MeridianLayer",1.71},
        {"RoleInfoLayer",1.71},
        {"RoleQianXiuLayer",1.71},
        {"RoleStarUpResultLayer",0.68},
        {"RoleStarUpResultNewLayer",2.9},
        {"TianshuStarupLayer",1.66}
    }
    if topLayer ~= nil and topLayer.__cname ~= nil then
        for k,v in pairs(filterList) do
            if topLayer.__cname ~= "" and topLayer.__cname == v[1] then
                 return v[2],v[1]
            end 
        end
    end
    return 0,""
end
local ToastPowerChange = class("ToastPowerChange", BaseLayer)

ToastPowerChange.LAYER_TYPE_PATH   = 0;
ToastPowerChange.LAYER_TYPE_LAYER  = 1;

ToastPowerChange.DEFUALT_POSITION  = ccp(GameConfig.WS.width/2, 110);

function ToastPowerChange:ctor(data,showType,layerType)
    self.super.ctor(self)

    self.showType = showType or ToastPowerChange.TYPE_MOVE_TO_UP;

    layerType = layerType or ToastPowerChange.LAYER_TYPE_PATH;
    if layerType == ToastPowerChange.LAYER_TYPE_PATH then
        self:init(data)
    end

    if layerType == ToastPowerChange.LAYER_TYPE_LAYER then
        self:addLayer(data);
    end
end

function ToastPowerChange:onExit()
    self.super.onExit(self)
    local currentScene = self:getParent();
    currentScene:removeLayer(self);
end

function ToastPowerChange:initUI(ui)
    self.super.initUI(self,ui);
    self.txt_power = TFDirector:getChildByPath(self, 'txt_zhanlizhi')
    self.img_power = TFDirector:getChildByPath(self, 'img_zhanlidi')
    self.tNodeList = {}
    self.tNodeList[1] = TFDirector:getChildByPath(self, 'img_shang')
    self.tNodeList[1].txt = TFDirector:getChildByPath(self, 'txt_add')
    self.tNodeList[1].pos = self.tNodeList[1]:getPosition()

    self.tNodeList[2] = TFDirector:getChildByPath(self, 'img_xia')
    self.tNodeList[2].txt = TFDirector:getChildByPath(self, 'txt_reduce')
    self.tNodeList[2].pos = self.tNodeList[2]:getPosition()
end

function ToastPowerChange:textChange(oldValue,newValue)
    if not oldValue or not newValue then
        return;
    end
    
    self.txt_power:setText(oldValue);

    local changeSum = newValue - oldValue

    if self.power_effect == nil then
        local resPath = "effect/ui/power_change.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        effect = TFArmature:create("power_change_anim")

        self.txt_power:addChild(effect,2)
        self.power_effect = effect
    end
    self.power_effect:setVisible(false)

    local frame = 1
    self.txt_power:setScale(1)
    self.ui:stopAnimation("power_change")
    self.ui:setAnimationCallBack("power_change", TFANIMATION_FRAME, function()
        if frame == 11 then
            if newValue > oldValue then
                play_shuzibiandong()
            end
            self.power_effect:setVisible(true)
            self.power_effect:playByIndex(0, -1, -1, 0)
        end
        if frame >= 11 and frame < 34 then
            local tempValue = oldValue + (frame - 11) *(changeSum/23)
            self.txt_power:setText(math.floor(tempValue));
        end
        if frame == 34 then
            self.power_effect:removeFromParent()
            self.power_effect = nil
            self.txt_power:setText(newValue);
        end
        frame = frame + 1
    end)
    self.ui:setAnimationCallBack("power_change", TFANIMATION_END, function()
        local currentScene = self:getParent();
        currentScene:removeLayer(self);
    end)
    self.ui:runAnimation("power_change",1);


    local function cb()
        self:arrChange(oldValue,newValue)
    end
    local acArr = TFVector:create()
    local delayAc = CCDelayTime:create(0.6)
    local callFunc = CCCallFunc:create(cb)
    acArr:addObject(delayAc)
    acArr:addObject(callFunc)
    self:runAction(CCSequence:create(acArr))
end

function ToastPowerChange:arrChange(oldValue,newValue)
    
    local offset = newValue - oldValue;

    if offset == 0 then
        return;
    end
    local showType = 1
    local temp = 1
    if offset < 0 then
        showType = 2
        temp = -1
    end
    local node = self.tNodeList[showType]
    node:setVisible(true)
    node:stopAllActions()
    node.txt:setText(offset.."")
    node:setPosition(node.pos)
    local toY = node.pos.y + 10 * temp;
    local toX = node.pos.x;
    node:setOpacity(0)
    local toastTween = {
        target = node,
        {
            duration = 7/24,
            x = toX,
            y = toY,
            scale = 1,
            alpha = 1,
        },
        {
            duration = 17/24,
            x = toX,
            y = toY + 20*temp,
            alpha = 0,
            onComplete = function() 
                node:setVisible(false)
            end
        }
    }

    TFDirector:toTween(toastTween);
end

function ToastPowerChange:beginToast(oldValue,newValue)
    print("ToastPowerChange:beginToast")
    local currentScene = Public:currentScene();
    local topLayer = currentScene:getTopLayer()
    print("topLayer.__cname = ",topLayer.__cname)
    self:setZOrder(500);
    self:setName("ToastPowerChange");
    if not self:getParent() then
        currentScene:addLayer(self);
    end
    local parent = self:getParent()
    local zOrder = self:getZOrder()
    parent:reorderChild(self,zOrder)
    self:stopAllActions()
    
    for i = 1,2 do
        self.tNodeList[i]:setVisible(false)
        local pos = self.tNodeList[i].pos
        self.tNodeList[i]:setPosition(pos)
        self.tNodeList[i]:stopAllActions()
    end
    self:textChange(oldValue,newValue)
end

function ToastPowerChange:delayToast( oldValue,newValue,delay,targetLayer )
    print("ToastPowerChange:delayToast  targetLayer = ",targetLayer)
    local currentScene = Public:currentScene();
    local topLayer = currentScene:getTopLayer()
    print("topLayer.__cname = ",topLayer.__cname)
    print("delay = ",delay)
    self:setZOrder(500);
    self:setName("ToastPowerChange");
    if not self:getParent() then
        currentScene:addLayer(self);
    end
    local parent = self:getParent()
    local zOrder = self:getZOrder()
    parent:reorderChild(self,zOrder)
    self:setVisible(false)
    self:stopAllActions()
    self.ui:stopAnimation("power_change")
    for i = 1,2 do
        self.tNodeList[i]:setVisible(false)
        local pos = self.tNodeList[i].pos
        self.tNodeList[i]:setPosition(pos)
        self.tNodeList[i]:stopAllActions()
    end
    local function cb()
        print("ToastPowerChange:delayToast  cb-->>>>>>")
        local currentScene = Public:currentScene();
        local topLayer = currentScene:getTopLayer()
        if topLayer ~= nil and topLayer.__cname ~= nil then
            if topLayer.__cname ~= "" and topLayer.__cname == targetLayer then
                print("ToastPowerChange:delayToast  cb-->>>>>> TRUE")
                self:setVisible(true)
                self:textChange(oldValue,newValue)
                return
            end
        end
        self:setVisible(false)
        local currentScene = self:getParent();
        currentScene:removeLayer(self);
    end
    local acArr = TFVector:create()
    local delayAc = CCDelayTime:create(delay)
    local callFunc = CCCallFunc:create(cb)
    acArr:addObject(delayAc)
    acArr:addObject(callFunc)
    self:runAction(CCSequence:create(acArr))
end

function ToastPowerChange:removeUI()
    self.super.removeUI(self)
    self.toastTween = nil;
    self.showType=nil;
end

return ToastPowerChange;