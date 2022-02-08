-- client side CrossZhengBaDWLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-03-04

local CrossZhengBaDWLayer = class("CrossZhengBaDWLayer", BaseLayer);

CREATE_SCENE_FUN(CrossZhengBaDWLayer);
CREATE_PANEL_FUN(CrossZhengBaDWLayer);

function CrossZhengBaDWLayer:ctor(data)
    self.super.ctor(self, data);   
    self:init("lua.uiconfig_mango_new.crosszhenba.CrossZhenBaDW");
end

function CrossZhengBaDWLayer:onShow()
    self.super.onShow(self)
end

function CrossZhengBaDWLayer:setGrade(newGrade,newStar,oldGrade,oldStar)
    self.newGrade = newGrade 
    self.newStar = newStar
    self.oldGrade = oldGrade
    self.oldStar = oldStar
    if oldGrade == nil then
        -- show last season
        self:showLastSeason()
    elseif newGrade > oldGrade then
        -- show up grade
        self:showUpGrade()
    elseif newGrade < oldGrade then
        -- show down grade
        self:showDownGrade()
    elseif newGrade == oldGrade then
        if newStar > oldStar then
            self:showUpStar()
        elseif newStar < oldStar then
            self:showDownStar()
        end
    end
end

function CrossZhengBaDWLayer:refreshUI()
    
end

function CrossZhengBaDWLayer:showStars( grade,star )
    local itemData = CrossZhengBaManager:getData(grade)
    local path1 = "ui_new/crosszhenba/" .. itemData.icon .. ".png"
    local path2 = "ui_new/crosszhenba/" .. itemData.pic .. ".png"
    self.img_dw:setTexture(path1)
    self.img_dj:setTexture(path2)
    self.lightStar = nil
    self.darkStar = nil
    if itemData.max_star == 0 then
        local node = self.node_star_list[4]
        node:setVisible(true)
        for i=1,3 do
            self.node_star_list[ i ]:setVisible(false)
        end
        local txt_star = TFDirector:getChildByPath(node, 'txt_num')
        local img_star = TFDirector:getChildByPath(node, 'img_light')
        if star <= 0 then
            txt_star:setText("X0")
            img_star:setVisible(false)
            self.darkStar = img_star
        else
            self.lightStar = img_star
            txt_star:setText("X" .. star)
            img_star:setVisible(true)
            img_star:setOpacity(255)
        end
    else
        for i=1,4 do
            if i == itemData.max_star - 2 then
                self.node_star_list[ i ]:setVisible(true)
            else
                self.node_star_list[ i ]:setVisible(false)
            end
        end
        local node = self.node_star_list[ itemData.max_star - 2 ]
        for i=1,itemData.max_star do
            local node0 = TFDirector:getChildByPath(node, 'img_star' .. i)
            local img_star = TFDirector:getChildByPath(node0, 'img_light')
            if i <= star then
                img_star:setVisible(true)
                img_star:setOpacity(255)
                self.lightStar = img_star
            else
                img_star:setVisible(false)
                if self.darkStar == nil then
                    self.darkStar = img_star
                end
            end
        end
    end
end

function CrossZhengBaDWLayer:showUpStar()
    -- body
    self:showStars(self.newGrade,self.newStar)
    local resPath = "effect/crosszhengba_upgrade_2.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local back_effect = TFArmature:create("crosszhengba_upgrade_2_anim")
    self.panel_effect_back:addChild(back_effect,100,100)
    back_effect:setPosition(ccp(960*0.5,365))
    back_effect:setVisible(false)

    local fadeStar = true
    local itemData = CrossZhengBaManager:getData(self.newGrade)
    if itemData.max_star == 0 and self.newStar > 1 then
        fadeStar = false
    else
        if self.lightStar then
            self.lightStar:setOpacity(0)
        end
    end
    self.img_dw:setScale(0)

    local tween = {
        target = self.img_dw,
        { 
            duration = 1
        },
        { 

            duration = 0.2,
            scale = 1.1,
            onComplete = function()
                back_effect:setVisible(true)
                back_effect:playByIndex(0,-1,-1,1)
            end
        },
        { 
            duration = 0.1,
            scale = 1
        },
        { 
            duration = 0.3,
            scale = 1,
            onComplete = function()
                self:showStarLightEffect(fadeStar)
            end
        }
    }
    TFDirector:toTween(tween)

    self.img_dj:setOpacity(0)
    tween = {
        target = self.img_dj,
        { 
            duration = 1
        },
        {
            duration = 0.2,
            alpha = 1
        }
    }
    TFDirector:toTween(tween)
    self.txt_tips:setText(localizable.CrossZhengBa_DW_Layer_tip4)
end

function CrossZhengBaDWLayer:showDownStar()
    -- body
    self:showStars(self.newGrade,self.newStar)

    local fadeStar = true
    local itemData = CrossZhengBaManager:getData(self.newGrade)
    if itemData.max_star == 0 and self.newStar > 0 then
        fadeStar = false
    else
        if self.darkStar then
            self.darkStar:setVisible(true)
            self.darkStar:setOpacity(255)
        end
    end
    self.img_dw:setScale(0)

    local tween = {
        target = self.img_dw,
        { 
            duration = 1
        },
        { 

            duration = 0.2,
            scale = 1.1,
            onComplete = function()
            end
        },
        { 
            duration = 0.1,
            scale = 1,
            onComplete = function()
                if self.darkStar and fadeStar == true then
                    self.darkStar:runAction(CCFadeOut:create(0.5))
                end
            end
        }
    }
    TFDirector:toTween(tween)

    self.img_dj:setOpacity(0)
    tween = {
        target = self.img_dj,
        { 
            duration = 1
        },
        {
            duration = 0.2,
            alpha = 1
        }
    }
    TFDirector:toTween(tween)
    self.txt_tips:setText(localizable.CrossZhengBa_DW_Layer_tip5)
end

function CrossZhengBaDWLayer:showLastSeason()
    self:showStars(self.newGrade,self.newStar)
    local resPath = "effect/crosszhengba_upgrade_2.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local back_effect = TFArmature:create("crosszhengba_upgrade_2_anim")
    self.panel_effect_back:addChild(back_effect,100,100)
    back_effect:setPosition(ccp(960*0.5,365))
    back_effect:setVisible(false)
    self.img_dw:setScale(0)
    local tween = {
        target = self.img_dw,
        { 
            duration = 1
        },
        { 

            duration = 0.2,
            scale = 1.1,
            onComplete = function()
                back_effect:setVisible(true)
                back_effect:playByIndex(0,-1,-1,1)
            end
        },
        { 
            duration = 0.1,
            scale = 1
        }
    }
    TFDirector:toTween(tween)

    self.img_dj:setOpacity(0)
    tween = {
        target = self.img_dj,
        { 
            duration = 1
        },
        {
            duration = 0.2,
            alpha = 1
        }
    }
    TFDirector:toTween(tween)

    local itemData = CrossZhengBaManager:getData(self.newGrade)
    self.txt_tips:setText(stringUtils.format(localizable.CrossZhengBa_DW_Layer_tip1,itemData.name))
end

function CrossZhengBaDWLayer:showStarLightEffect(isNeedFade)
    if self.lightStar then
        if isNeedFade == nil then
            isNeedFade = true
        end
        if isNeedFade == true then
            self.lightStar:runAction(CCFadeIn:create(0.2))
        end
        local resPath = "effect/crosszhengba_star_effect.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        local effect = TFArmature:create("crosszhengba_star_effect_anim")
        self.lightStar:getParent():addChild(effect,100,100)
        local pos = self.lightStar:getPosition()
        effect:setPosition(ccp(25,23.5))
        effect:setRotation(self.lightStar:getRotation())
        effect:playByIndex(0,-1,-1,0)
        effect:addMEListener(TFARMATURE_COMPLETE,
        function()
            effect:removeFromParent()
        end)
    end
end

function CrossZhengBaDWLayer:showUpGrade()
    self:showStars(self.oldGrade,self.oldStar)
    local resPath = "effect/crosszhengba_upgrade_1.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local front_effect = TFArmature:create("crosszhengba_upgrade_1_anim")
    self.panel_effect_back:addChild(front_effect,100,100)
    front_effect:setPosition(ccp(960*0.5,365))
    front_effect:setVisible(false)
    front_effect:addMEListener(TFARMATURE_COMPLETE,
        function()
            front_effect:removeFromParent()
        end)

    resPath = "effect/crosszhengba_upgrade_2.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    back_effect = TFArmature:create("crosszhengba_upgrade_2_anim")
    self.panel_effect_back:addChild(back_effect,100,100)
    back_effect:setPosition(ccp(960*0.5,365))
    back_effect:setVisible(false)
    self.img_dw:setScale(0)
    local tween = {
        target = self.img_dw,
        { 
            duration = 0.2,
            scale = 1.1,
            --ease = {type=TFEaseType.EASE_IN, rate=5}, 
            
        },
        { 
            duration = 0.1,
            --ease = {type=TFEaseType.EASE_IN, rate=5}, 
            scale = 1,
            onComplete = function()
                front_effect:setVisible(true)
                front_effect:playByIndex(0,-1,-1,0)
            end
        },
        {
            duration = 0.3,
            onComplete = function()  
                self.img_dw:setScale(0.08)
                
                self:showStars(self.newGrade,self.newStar)
                if self.lightStar then
                    self.lightStar:setOpacity(0)
                end
            end
        },
        {
            duration = 0.2,
            scale = 1.1,
            onComplete = function()
                back_effect:setVisible(true)
                back_effect:playByIndex(0,-1,-1,1)
            end
        },
        {
            duration = 0.1,
            scale = 1
        },
        {
            duration = 0.5,
            scale = 1,
            onComplete = function()
                self:showStarLightEffect()
            end
        }
    }
    TFDirector:toTween(tween)

    local itemData = CrossZhengBaManager:getData(self.oldGrade)
    local itemData0 = CrossZhengBaManager:getData(self.newGrade)
    self.txt_tips:setText(stringUtils.format(localizable.CrossZhengBa_DW_Layer_tip2,itemData.name,itemData0.name))
end

function CrossZhengBaDWLayer:showDownGrade()
    self:showStars(self.oldGrade,self.oldStar)

    local resPath = "effect/crosszhengba_downgrade.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local front_effect = TFArmature:create("crosszhengba_downgrade_anim")
    self.panel_effect_front:addChild(front_effect,100,100)
    front_effect:setPosition(ccp(960*0.5,320))
    front_effect:setVisible(false)
    front_effect:addMEListener(TFARMATURE_COMPLETE,
        function()
            self.panel_effect_front:removeAllChildren()
        end)

    local callFuncN = CCCallFuncN:create( function()
        front_effect:setVisible(true)
        front_effect:playByIndex(0,-1,-1,0)  
    end )
    
    local callFuncN0 = CCCallFuncN:create( function()
        self:showStars(self.newGrade,self.newStar)
    end)
    local delayAc = CCDelayTime:create(1)
    local delayAc0 = CCDelayTime:create(0.2)

    local acArr = TFVector:create()
    acArr:addObject(delayAc)
    acArr:addObject(callFuncN)
    acArr:addObject(delayAc0)
    acArr:addObject(callFuncN0)
    self.img_dw:runAction(CCSequence:create(acArr))

    local itemData = CrossZhengBaManager:getData(self.oldGrade)
    local itemData0 = CrossZhengBaManager:getData(self.newGrade)
    self.txt_tips:setText(stringUtils.format(localizable.CrossZhengBa_DW_Layer_tip3,itemData.name,itemData0.name))
end

function CrossZhengBaDWLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.btn_go = TFDirector:getChildByPath(ui, 'btn_go');
    self.txt_tips = TFDirector:getChildByPath(ui, 'txt_tips');
    self.panel_effect_front = TFDirector:getChildByPath(ui, 'panel_effect_front');
    self.panel_effect_back = TFDirector:getChildByPath(ui, 'panel_effect_back');


    self.img_dw = TFDirector:getChildByPath(ui, 'img_dw');
    self.img_dj = TFDirector:getChildByPath(ui, 'img_dj');

    self.node_star_list = {}
    self.node_star_list[1] = TFDirector:getChildByPath(ui, 'panel_star_to3')
    self.node_star_list[2] = TFDirector:getChildByPath(ui, 'panel_star_to4')
    self.node_star_list[3] = TFDirector:getChildByPath(ui, 'panel_star_to5')
    self.node_star_list[4] = TFDirector:getChildByPath(ui, 'panel_star_tow')
end

function CrossZhengBaDWLayer.onGoClickHandle(sender)
    local self = sender.logic;
    if CommonManager:IsOpenServerGroup() == false then
        toastMessage(localizable.commom_no_open2)
        return
    end
    local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2227)
    if teamLev < openLev then
        toastMessage(stringUtils.format(localizable.common_function_openlevel,openLev))
        return
    end

    CrossZhengBaManager:openMainLayer()
end

function CrossZhengBaDWLayer:removeUI()
    self.super.removeUI(self);

end

function CrossZhengBaDWLayer:registerEvents()
    self.super.registerEvents(self);
end

function CrossZhengBaDWLayer:removeEvents()
    self.super.removeEvents(self);
end

return CrossZhengBaDWLayer;
