-- client side MoiveTipLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer Stephen.tao
-- creation time 2016-08-24

local MoiveTipLayer = class("MoiveTipLayer", BaseLayer);

CREATE_SCENE_FUN(MoiveTipLayer);
CREATE_PANEL_FUN(MoiveTipLayer);


function MoiveTipLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.mission.MissionTipLayer");
end

function MoiveTipLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.bg           = TFDirector:getChildByPath(self, "panel_bg");
    self.bg:setBackGroundColorOpacity(200);
    self.bg_content =  TFDirector:getChildByPath(self, 'bg_content');
    self.img_icon_1 =  TFDirector:getChildByPath(self, 'img_icon_1');
    self.img_icon_2 =  TFDirector:getChildByPath(self, 'img_icon_2');
    self.txt_text_1 =  TFDirector:getChildByPath(self, 'txt_text_1');
    self.txt_text_2 =  TFDirector:getChildByPath(self, 'txt_text_2');

    self.img_next1 = TFDirector:getChildByPath(self, "img_next2")
    self.img_next1:setVisible(false)
    self.img_next2 = TFDirector:getChildByPath(self, "img_next1")
    self.img_next2:setVisible(false)

    local pos1 = self.img_next1:getPosition()
    local moveup = CCMoveTo:create(0.8,ccp(pos1.x,pos1.y+5))
    local movedown = CCMoveTo:create(0.8,ccp(pos1.x,pos1.y-5))
    local act1 = CCSequence:createWithTwoActions(moveup,movedown)
    self.img_next1:runAction(CCRepeatForever:create(act1))

    local pos2 = self.img_next2:getPosition()
    local moveup = CCMoveTo:create(0.8,ccp(pos2.x,pos2.y+5))
    local movedown = CCMoveTo:create(0.8,ccp(pos2.x,pos2.y-5))
    local act2 = CCSequence:createWithTwoActions(moveup,movedown)
    self.img_next2:runAction(CCRepeatForever:create(act2))

    -- self:showNextTip();

    local designsize = CCDirector:sharedDirector():getOpenGLView():getDesignResolutionSize()
    self.newOffsetX = (designsize.width - 1136) / 2
    self.X_LEFT = 136 + self.newOffsetX
    self.X_RIGHT = 1096 + self.newOffsetX
end

function MoiveTipLayer:onShow()
    self.super.onShow(self)
end


function MoiveTipLayer:removeUI()
    self.super.removeUI(self);
    if self.movieDelayTimer then
        TFDirector:removeTimer(self.movieDelayTimer)
        self.movieDelayTimer = nil
    end
    if self.autoDelayTimer then
        TFDirector:removeTimer(self.autoDelayTimer)
        self.autoDelayTimer = nil
    end

    if self.effectHandle ~= nil then
      TFAudio.stopEffect(self.effectHandle)
    end

    if self.effectTimer then
      TFDirector:removeTimer(self.effectTimer)
      self.effectTimer = nil
    end
end

--注册事件
function MoiveTipLayer:registerEvents()
    self.super.registerEvents(self); 
    self.bg.logic = self;
    self.bg:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onNextClickHandle));
end

--注册事件
function MoiveTipLayer:removeEvents()
    self.super.removeEvents(self); 
    print("MoiveTipLayer:removeEvents------->>>>>>>>>>>>>>")
    if self.movieDelayTimer then
        TFDirector:removeTimer(self.movieDelayTimer)
        self.movieDelayTimer = nil
    end
    if self.autoDelayTimer then
        TFDirector:removeTimer(self.autoDelayTimer)
        self.autoDelayTimer = nil
    end

    if self.effectHandle ~= nil then
      TFAudio.stopEffect(self.effectHandle)
    end

    if self.effectTimer then
      TFDirector:removeTimer(self.effectTimer)
      self.effectTimer = nil
    end
end


function MoiveTipLayer:showTip(tip_info)
    self.bLeaving = false
    self.tip = tip_info or {}

    if self.effectHandle ~= nil then
        TFAudio.stopEffect(self.effectHandle)
    end

    if self.tip and self.tip.sound then
        local effect = self.tip.sound
        --self.effectHandle = TFAudio.playEffect("sound/guide/"..effect,false)
        --RoleSoundData:stopEffect()
    end

      local effectTime = self.tip.soundTime
      if effectTime and effectTime > 0 then
        self.effectTimer = TFDirector:addTimer(effectTime * 1000,1,nil ,function ()
          if self.effectHandle ~= nil then
            TFAudio.stopEffect(self.effectHandle)
          end
          if PlayerGuideManager.effectHandle then
                TFAudio.stopEffect(PlayerGuideManager.effectHandle)
            end
          if self.effectTimer then
            TFDirector:removeTimer(self.effectTimer)
          end
          self.effectTimer = nil
        end)
      end

    local img_icon_1 =  TFDirector:getChildByPath(self, 'img_icon_1');
    local txt_name_1 =  TFDirector:getChildByPath(self, 'txt_name_1');
    local txt_text_1 =  TFDirector:getChildByPath(self, 'txt_text_1');
    local bg_name1 =  TFDirector:getChildByPath(self, 'bg_name1');

    local img_icon_2 =  TFDirector:getChildByPath(self, 'img_icon_2');
    local txt_name_2 =  TFDirector:getChildByPath(self, 'txt_name_2');
    local txt_text_2 =  TFDirector:getChildByPath(self, 'txt_text_2');
    local bg_name2 =  TFDirector:getChildByPath(self, 'bg_name2');

    local bg_content =  TFDirector:getChildByPath(self, 'bg_content');

    local content  =  tip_info.content;

    if self.bgInTween ~= nil then
      TFDirector:killTween(self.bgInTween)
      self.bgInTween = nil
    end
    if self.bgOutTween ~= nil then
      TFDirector:killTween(self.bgOutTween)
      self.bgOutTween = nil
    end
    self.bgInTween = 
    {
        target = bg_content,
        {
            duration = 0,
            scaleY = 0
        },
        {
            duration = 0.02,
            scaleY = 0.1
        },
        {
            duration = 0.05,
            scaleY = 0.2
        },
        {
            duration = 0.1,
            scaleY = 0.5
        },
        {
            duration = 0.3,
            scaleY = 1
        },
        onComplete = function ()
            TFDirector:killTween(self.bgInTween)
            self.bgInTween = nil
        end,
    }
    TFDirector:toTween(self.bgInTween)

    if tip_info.position == MissionManager.TIPLEFT then
        --左边说话，隐藏右边
        img_icon_1:setVisible(true);
        txt_name_1:setVisible(true);
        bg_name1:setVisible(true);
        --txt_text_1:setVisible(true);

        img_icon_2:setVisible(false);
        txt_name_2:setVisible(false);
        bg_name2:setVisible(false);
        txt_text_2:setVisible(false);


        -- if tip_info.image == 0 then
        --     img_icon_1:setTexture(MainPlayer:getBigImagePath());
        --     txt_name_1:setText(MainPlayer:getPlayerName());
        --     content = content:gsub("XX", MainPlayer:getPlayerName());
        -- else
        --     img_icon_1:setTexture("icon/rolebig/" .. tip_info.image .. ".png");
        --     txt_name_1:setText(tip_info.name);
        --     content = content:gsub("XX", MainPlayer:getPlayerName());
        -- end 

        local tip = tip_info
        if tip.image == 0 then
          local str = ""
          local role = RoleData:objectByID(MainPlayer:getProfession())
          if role and tip.smile and tip.smile > 0 then
            str = "icon/rolebig/" .. role.image .. tip.smile ..".png"
          else
            str = MainPlayer:getBigImagePath()
          end
          img_icon_1:setTexture(str);
          txt_name_1:setText(MainPlayer:getPlayerName());
          content = content:gsub("XX", MainPlayer:getPlayerName());
      else
          local str = "icon/rolebig/" .. tip.image .. ".png"
          if tip.smile and tip.smile > 0 then
            str = "icon/rolebig/" .. tip.image .. tip.smile .. ".png"
          end
          img_icon_1:setTexture(str);
          txt_name_1:setText(tip.name);
          content = content:gsub("XX", MainPlayer:getPlayerName());
      end


        txt_text_1:setText("")
        self:textFlying(txt_text_1, content, 0.03)
   end

    if tip_info.position == MissionManager.TIPRIGTH then
        --右边说话，隐藏左边
        img_icon_2:setVisible(true);
        txt_name_2:setVisible(true);
        bg_name2:setVisible(true);
        --txt_text_2:setVisible(true);

        img_icon_1:setVisible(false);
        txt_name_1:setVisible(false);
        bg_name1:setVisible(false);
        txt_text_1:setVisible(false);


        -- if tip_info.image == 0 then
        --     img_icon_2:setTexture(MainPlayer:getBigImagePath());
        --     txt_name_2:setText(MainPlayer:getPlayerName());
        --     content = content:gsub("XX", MainPlayer:getPlayerName());
        -- else
        --     img_icon_2:setTexture("icon/rolebig/" .. tip_info.image .. ".png");
        --     txt_name_2:setText(tip_info.name);
        --     content = content:gsub("XX", MainPlayer:getPlayerName());
        -- end
        local tip = tip_info
        if tip.image == 0 then
          local str = ""
          local role = RoleData:objectByID(MainPlayer:getProfession())
          if role and tip.smile and tip.smile > 0 then
            str = "icon/rolebig/" .. role.image .. tip.smile ..".png"
          else
            str = MainPlayer:getBigImagePath()
          end
          img_icon_2:setTexture(str);
          txt_name_2:setText(MainPlayer:getPlayerName());
          content = content:gsub("XX", MainPlayer:getPlayerName());
        else
          local str = "icon/rolebig/" .. tip.image .. ".png"
          if tip.smile and tip.smile > 0 then
            str = "icon/rolebig/" .. tip.image .. tip.smile .. ".png"
          end
          img_icon_2:setTexture(str);
          txt_name_2:setText(tip.name);
          content = content:gsub("XX", MainPlayer:getPlayerName());
        end

        txt_text_2:setText("")
        self:textFlying(txt_text_2, content, 0.03)
    end
    self:iconMove(1, tip_info.position)
    if tip_info.skipIconIn and tip_info.skipIconIn == 1 then
      self:skipActions()
      self:starCutDownForSkip()
   end
    
    if tip_info.sound and tip_info.sound~= "" then
        local soundList = string.split(tip_info.sound,'|')
        local sound = soundList[1]
        if #soundList > 1 then
            sound = soundList[MainPlayer.sex]
        end
        self:playEffect(sound);
    end
end


function MoiveTipLayer:iconMove(moveType, pos)
    moveType = moveType or 1
    pos = pos or 1
    if self.tweenLeft ~= nil then
        TFDirector:killTween(self.tweenLeft)
        self.tweenLeft = nil
    end

    if moveType == 2 then
        self.bLeaving = true
    end

    if self.tweenRight ~= nil then
        TFDirector:killTween(self.tweenRight)
        self.tweenRight = nil
    end
    if moveType == 1 then
        self.img_icon_1:setPositionX(-410 + 100)
        self.img_icon_2:setPositionX(1500 - 100)
    elseif moveType == 2 then
        self.img_icon_1:setPositionX(-self.X_LEFT)
        self.img_icon_2:setPositionX(self.X_RIGHT)
    end

    local posY = self.img_icon_1:getPositionY()
    local tab_left = 
    {
        duration1 = {0, 0},
        x1 = {-410 + 100, -self.X_LEFT},
        alpha1 = {0, 1},
        duration2 = {0.4, 0.25},
        x2 = {-self.X_LEFT, -410 + 100},
        alpha2 = {1, 0},
        easeType = {TFEaseType.EASE_SINE_OUT, TFEaseType.EASE_IN}
    }
    self.tweenLeft = 
    {
        target = self.img_icon_1,
        {
            duration = tab_left.duration1[moveType],
            --ease = {type=TFEaseType.EASE_IN, rate=5},
            x = tab_left.x1[moveType],
            y = posY,
            alpha = tab_left.alpha1[moveType],
        },
        {
            ease = {type = tab_left.easeType[moveType], rate=5},
            duration = tab_left.duration2[moveType],
            x = tab_left.x2[moveType],
            y = posY,
            alpha = tab_left.alpha2[moveType],
        },
        onComplete = function ()
            TFDirector:killTween(self.tweenLeft)
            self.tweenLeft = nil
        end,
    }
    local tab_right = 
    {
        duration1 = {0, 0},
        x1 = {1500 - 100, self.X_RIGHT},
        alpha1 = {0, 1},
        duration2 = {0.4, 0.25},
        x2 = {self.X_RIGHT, 1500 - 100},
        alpha2 = {1, 0},
        easeType = {TFEaseType.EASE_SINE_OUT, TFEaseType.EASE_IN}
    }
    self.tweenRight = 
    {
        target = self.img_icon_2,
        {
            duration = tab_right.duration1[moveType],
            --ease = {type=TFEaseType.EASE_IN, rate=5},
            x = tab_right.x1[moveType],
            y = posY,
            alpha = tab_right.alpha1[moveType],
        },
        {
            ease = {type=tab_right.easeType[moveType], rate=5},
            duration = tab_right.duration2[moveType],
            x = tab_right.x2[moveType],
            y = posY,
            alpha = tab_right.alpha2[moveType],
        },
        onComplete = function ()
            TFDirector:killTween(self.tweenRight)
            self.tweenRight = nil
        end,
    }

    if pos == MissionManager.TIPRIGTH then
        TFDirector:toTween(self.tweenRight)
    else
        TFDirector:toTween(self.tweenLeft)
    end
end


function MoiveTipLayer:skipActions()
    self.tip = self.tip or {}
    local pos = self.tip.position or 1

    if pos == MissionManager.TIPLEFT then
        self.txt_text_1:stopAllActions()
        self.txt_text_1:setText(self.tip.content)
        self.img_icon_1:stopAllActions()
        self.img_icon_1:setOpacity(255)
        self.img_icon_1:setPositionX(-self.X_LEFT)

        self.img_next1:setVisible(true)
    elseif pos == MissionManager.TIPRIGTH then
        self.txt_text_2:stopAllActions()
        self.txt_text_2:setText(self.tip.content)
        self.img_icon_2:stopAllActions()
        self.img_icon_2:setOpacity(255)
        self.img_icon_2:setPositionX(self.X_RIGHT)

        self.img_next2:setVisible(true)
    end
    self.bTextFlyEnd = true
end

function MoiveTipLayer:skipLeaving()
    self.tip = self.tip or {}
    local pos = self.tip.position or 1

    if pos == MissionManager.TIPLEFT then
        self.img_icon_1:setPositionX(-410 + 100)
        TFDirector:killTween(self.img_icon_1)
        self.img_icon_1:setOpacity(0)
        self.img_icon_1:setVisible(false)
    elseif pos == MissionManager.TIPRIGTH then
        self.img_icon_2:setPositionX(1500 - 100)
        TFDirector:killTween(self.img_icon_2)
        self.img_icon_2:setOpacity(0)  
        self.img_icon_2:setVisible(false)
    end
    self.logic:dialTouchEnd()

    self.bLeaving = false
end

    
function MoiveTipLayer.onNextClickHandle(sender)
    local self = sender.logic;

    if self.movieDelayTimer then
        TFDirector:removeTimer(self.movieDelayTimer)
        self.movieDelayTimer = nil
    end
    if self.autoDelayTimer then
        TFDirector:removeTimer(self.autoDelayTimer)
        self.autoDelayTimer = nil
    end

      if self.effectHandle ~= nil then
        TFAudio.stopEffect(self.effectHandle)
      end

      if self.effectTimer then
        TFDirector:removeTimer(self.effectTimer)
        self.effectTimer = nil
      end

    self.img_next1:setVisible(false)
    self.img_next2:setVisible(false)

    if not self.bTextFlyEnd then
        self:skipActions()
        return
    end

    if self.bLeaving then
        self:skipLeaving()
        return
    end

    self.txt_text_1:setText("")
    self.txt_text_2:setText("")
    self.txt_text_1:setVisible(false)
    self.txt_text_2:setVisible(false)

    if self.nextClickTween then
        TFDirector:killTween(self.nextClickTween)
        self.nextClickTween = nil  
    end

    self.nextClickTween = 
    {
        target = self.bg_content,
        {
            duration = 0,
            scaleY = 1
        },
        {
            duration = 0.02,
            scaleY = 0.3
        },
        {
            duration = 0.05,
            scaleY = 0.2
        },
        {
            duration = 0.1,
            scaleY = 0.1
        },
        {
            duration = 0.2,
            scaleY = 0
        },
        onComplete = function ()
            TFDirector:killAllTween()
            self.logic:dialTouchEnd()
        end, 
    }
    self.bLeaving = true
    self.tip = self.tip or {}
    local pos = self.tip.position or 1
    
    if self.tip.skipIconOut and self.tip.skipIconOut == 1 then
        --self:skipLeaving()
    else
        self:iconMove(2, pos)
    end

    TFDirector:toTween(self.nextClickTween)
end

function MoiveTipLayer:playEffect( effect )
  if self.effectHandle ~= nil then
      TFAudio.stopEffect(self.effectHandle)
  end
  self.effectHandle = TFAudio.playEffect("sound/dia/"..effect,false)
end

function MoiveTipLayer:textFlying(label, content, textDelayTime)
    self.txt_text_1:setText("")
    self.txt_text_2:setText("")
    self.bTextFlyEnd = false

    label:stopAllActions()
    label:setVisible(true)
    content = content or ""
    local strTab = getStringTable(content)
    local str = ""
    local acArr = TFVector:create()
    local delay = CCDelayTime:create(0.08)
    acArr:addObject(delay)
    for i = 1, #strTab do
        local textDelay = CCDelayTime:create(textDelayTime)
        local textAppear = CCCallFunc:create(function()
            label:setString(str .. strTab[i])
            str = str .. strTab[i]
        end)
        acArr:addObject(textDelay)
        acArr:addObject(textAppear) 
    end
    local endFunc = CCCallFunc:create(function()
        self.tip = self.tip or {}
        local pos = self.tip.position or 1
        if pos == MissionManager.TIPLEFT then
          self.img_next1:setVisible(true)
        elseif pos == MissionManager.TIPRIGTH then
          self.img_next2:setVisible(true)
        end
        self.bTextFlyEnd = true

        self:starCutDownForSkip()
    end)

    acArr:addObject(endFunc)
    label:runAction(CCSequence:create(acArr))
end

function MoiveTipLayer:starCutDownForSkip()
    --存在一键托管
    if self.movieDelayTimer then
        TFDirector:removeTimer(self.movieDelayTimer)
        self.movieDelayTimer = nil
    end
    if self.autoDelayTimer then
        TFDirector:removeTimer(self.autoDelayTimer)
        self.autoDelayTimer = nil
    end
    local clickToNextStep = function ()
    -- print("end timer = ",MainPlayer:getNowtime())
        if self.onNextClickHandle then
            self.onNextClickHandle(self.bg)  
        end          
    end

    if MissionManager:isInTrustOnekey() then
        print("start timer = ",MainPlayer:getNowtime())
        local OneKeyAutoTalkWait = ConstantData:objectByID("OneKeyAutoTalkWait") or {}
        local cdTime = OneKeyAutoTalkWait.value or 2000
        cdTime = math.ceil(cdTime/1000)
        local timerCount = 0;
        self.movieDelayTimer = TFDirector:addTimer(1000, -1, nil,function ()
              if timerCount >= cdTime then
                TFDirector:removeTimer(self.movieDelayTimer)
                self.movieDelayTimer = nil
                clickToNextStep()
              end
              timerCount = timerCount + 1
            end)
    else
        print("start timer = ",MainPlayer:getNowtime())
        local AutoTalkWait = ConstantData:objectByID("TalkWaitSecond") or {}
        local cdTime = AutoTalkWait.value or 2000
        cdTime = math.ceil(cdTime/1000)
        if not self.isGuide then
            local timerCount = 0;
            self.autoDelayTimer = TFDirector:addTimer(1000, -1, nil,function ()
              if timerCount >= cdTime then
                TFDirector:removeTimer(self.autoDelayTimer)
                self.autoDelayTimer = nil
                clickToNextStep()
              end
              timerCount = timerCount + 1
            end)
        end
    end
end
return MoiveTipLayer;
