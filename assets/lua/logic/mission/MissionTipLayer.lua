--[[
******PVE推图-剧情对话*******

    -- by haidong.gan
    -- 2013/11/27
]]
local MissionTipLayer = class("MissionTipLayer", BaseLayer);

CREATE_SCENE_FUN(MissionTipLayer);
CREATE_PANEL_FUN(MissionTipLayer);

--战斗前，对话播放完毕
MissionTipLayer.EVENT_SHOW_BEGINTIP_COM = "MissionTipLayer.EVENT_SHOW_BEGINTIP_COM";
--战斗后，对话播放完毕
MissionTipLayer.EVENT_SHOW_ENDTIP_COM   = "MissionTipLayer.EVENT_SHOW_ENDTIP_COM";

function MissionTipLayer:ctor(data, isGuide)
    self.super.ctor(self,data);
    self.isGuide = isGuide
    self.tiplist      = data.tiplist; 
    self.stageType    = data.stageType;
    self.tipIndex     = 1; 
    self.dispatchGlobalMessage = data.dispatchGlobalMessage
    
    local designsize = CCDirector:sharedDirector():getOpenGLView():getDesignResolutionSize()
    self.newOffsetX = (designsize.width - 1136) / 2
    self.X_LEFT = 136 + self.newOffsetX
    self.X_RIGHT = 1096 + self.newOffsetX

    self:init("lua.uiconfig_mango_new.mission.MissionTipLayer");
end

function MissionTipLayer:initUI(ui)
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

    self.bg_name1 = TFDirector:getChildByPath(self, "bg_name1")
    self.bg_name2 = TFDirector:getChildByPath(self, "bg_name2")

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

    self:showNextTip();
end

function MissionTipLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI();
end

function MissionTipLayer:refreshBaseUI()

end


function MissionTipLayer:removeUI()
   self.super.removeUI(self);
   if self.movieDelayTimer then
        TFDirector:removeTimer(self.movieDelayTimer)
        self.movieDelayTimer = nil
    end
    if self.autoDelayTimer then
        TFDirector:removeTimer(self.autoDelayTimer)
        self.autoDelayTimer = nil
    end

    -- if self.effectHandle ~= nil then
    --   TFAudio.stopEffect(self.effectHandle)
    -- end

    -- if self.effectTimer then
    --   TFDirector:removeTimer(self.effectTimer)
    --   self.effectTimer = nil
    -- end
end
          
function MissionTipLayer.onNextClickHandle(sender)
   local self = sender.logic;
   self.img_next1:setVisible(false)
   self.img_next2:setVisible(false)
  if self.movieDelayTimer then
      TFDirector:removeTimer(self.movieDelayTimer)
      self.movieDelayTimer = nil
  end
  if self.autoDelayTimer then
      TFDirector:removeTimer(self.autoDelayTimer)
      self.autoDelayTimer = nil
  end

  -- if self.effectHandle ~= nil then
  --   TFAudio.stopEffect(self.effectHandle)
  -- end

  -- if self.effectTimer then
  --   TFDirector:removeTimer(self.effectTimer)
  --   self.effectTimer = nil
  -- end

   if self.isGuide then
    return
   end

   if not self.bTextFlyEnd then
      self:skipActions()      
      return
   end

   --左右两边一边离开的同时另一边进入
   self.nextTip.position = self.nextTip.position or -1
   if self.nextTip.position ~= self.tip.position and self.tipIndex + 1 <= self.tiplist:length() then
      self.tipIndex = self.tipIndex + 1
      self.bStopClick = true
      --self:skipLeaving()
      TFDirector:killAllTween()
      --self:skipLeaving()
      self:iconMove(2, self.tip.position)


      local tar = self.bg_name1
      if self.tip.position == MissionManager.TIPRIGTH then
        tar = self.bg_name2
      end
      local baseY = -55
     local destY = 27
      self.nameBgOutTween = 
      {
          target = tar,
          {
            duration = 0,
            y = destY,
          },
          {
            duration = 0.2,
            y = destY - 55,
          },
          {
            duration = 0.16,
            y = baseY,
          },
          onComplete = function ()
            TFDirector:killTween(self.nameBgOutTween)
            self.nameBgOutTween = nil
        end,
      }
      TFDirector:toTween(self.nameBgOutTween)

      self:showNextTip()
      return
    else
      self.bStopClick = false
   end
   if self.bStopClick then
      return
   end  
   
   if self.bLeaving and self.tipIndex + 1 <= self.tiplist:length() then
      self:skipLeaving()
      return
   end

   self.tipIndex = self.tipIndex + 1

   self.txt_text_1:setText("")
   self.txt_text_2:setText("")
   self.txt_text_1:setVisible(false)
   self.txt_text_2:setVisible(false)

   if self.tipIndex > self.tiplist:length() then
    
      local stageType = self.stageType;
      local dispatchGlobalMessage = self.dispatchGlobalMessage
       --对话结束
      local currentScene = Public:currentScene();
      currentScene:removeLayer(self,true);

      --add by quanhuan 2016/3/11
      if dispatchGlobalMessage then
        TFDirector:dispatchGlobalEventWith(dispatchGlobalMessage, {});
      else
        if stageType == 1 or stageType == 11  then
          TFDirector:dispatchGlobalEventWith(MissionTipLayer.EVENT_SHOW_BEGINTIP_COM, {});
        else
          TFDirector:dispatchGlobalEventWith(MissionTipLayer.EVENT_SHOW_ENDTIP_COM, {});
        end
      end
   else
      if self.nextClickTween then
        TFDirector:killTween(self.nextClickTween)
        self.nextClickTween = nil  
      end
      --[[
      local bDiff = false
      print("wukkey001 === >> ", self.nextTip.position)
      print("wukkey002 === >> ", self.tip.position)
      if self.nextTip.position ~= self.tip.position then
        bDiff = true
      end
      if bDiff then
        self:skipLeaving()
        self:showNextTip();
      end
      ]]
      self.nextClickTween = 
      {
        target = self.bg_content,
        {
          duration = 0,
          scaleY = 1,
          alpha = 255
        },
        {
          duration = 0.2,
          scaleY = 0.18,
          alpha = 0
        },
        {
          duration = 0.16,
          scaleY = 0.18,
          alpha = 0
        },
        onComplete = function ()
          TFDirector:killAllTween()
          --if not bDiff then
            self:showNextTip();
          --end
        end, 
      }

      if self.nameBgOutTween then
        TFDirector:killTween(self.nameBgOutTween)
        self.nameBgOutTween = nil  
      end

      self.tip = self.tip or {}
      local pos = self.tip.position or 1

      local tar = self.bg_name1
      if pos == MissionManager.TIPRIGTH then
        tar = self.bg_name2
      end

      local baseY = -55
     local destY = 27
     self.nameBgOutTween = 
      {
          target = tar,
          {
            duration = 0,
            y = destY,
          },
          {
            duration = 0.2,
            y = destY - 55,
          },
          {
            duration = 0.16,
            y = baseY,
          },
          onComplete = function ()
            TFDirector:killTween(self.nameBgOutTween)
            self.nameBgOutTween = nil
        end,
      }
      --if not bDiff then
        TFDirector:toTween(self.nameBgOutTween)
      --end

      self.bLeaving = true
      self.tip = self.tip or {}
      local pos = self.tip.position or 1

      if self.tip.skipIconOut and self.tip.skipIconOut == 1 then
      else
        self:iconMove(2, pos)
      end

      --if not bDiff then
        TFDirector:toTween(self.nextClickTween)
      --else
        --self.bStopClick = true
      --end
   end
end

function MissionTipLayer:skipActions()
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
  TFDirector:killAllTween()
end

function MissionTipLayer:skipLeaving()
  self.tip = self.tip or {}
  local pos = self.tip.position or 1

  if pos == MissionManager.TIPLEFT then
      self.img_icon_1:setPositionX(-self.X_LEFT - 46)
      TFDirector:killTween(self.img_icon_1)
      self.img_icon_1:setOpacity(0)
      self.img_icon_1:setVisible(false)
  elseif pos == MissionManager.TIPRIGTH then
      self.img_icon_2:setPositionX(self.X_RIGHT + 46)
      TFDirector:killTween(self.img_icon_2)
      self.img_icon_2:setOpacity(0)
      self.img_icon_2:setVisible(false)
  end

  self.bLeaving = false
end

function MissionTipLayer:playEffect( effect )
  -- if self.effectHandle ~= nil then
  --     TFAudio.stopEffect(self.effectHandle)
  --     self.effectHandle = nil
  -- end

  -- if effect and effect~= "" then
  --     local soundList = string.split(effect,'|')
  --     local sound = soundList[1]
  --     if #soundList > 1 then
  --         sound = soundList[MainPlayer.sex]
  --     end
  --     self.effectHandle = TFAudio.playEffect("sound/dia/"..sound,false)
  --  end
end

function MissionTipLayer:textFlying(label, content, textDelayTime)
    self.txt_text_1:setText("")
    self.txt_text_2:setText("")
    self.bTextFlyEnd = false

    label:stopAllActions()
    label:setVisible(true)
    content = content or ""
    local strTab = getStringTable(content)
    local str = ""
    local acArr = TFVector:create()
    local delay = CCDelayTime:create(0.04)
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
        self.bStopClick = false

      self:starCutDownForSkip()

    end)
    acArr:addObject(endFunc)
    label:runAction(CCSequence:create(acArr))
end

function MissionTipLayer:showNextTip()
  local tip = TFArray:new()
  if not self.isGuide then
    tip = self.tiplist:objectAt(self.tipIndex);
    self.nextTip = self.tiplist:objectAt(self.tipIndex + 1) or {}
  else
    tip = self.tiplist
    self.nextTip = {}
  end

  if not tip then
    return
  end

  self.tip = tip

  if self.effectHandle ~= nil then
      TFAudio.stopEffect(self.effectHandle)
      self.effectHandle = nil
  end
  if self.tip and self.tip.sound then
    local effect = self.tip.sound
    local effectTime = self.tip.soundTime or 0
    -- self.effectHandle = TFAudio.playEffect("sound/dia/"..effect,false)
    -- RoleSoundData:stopEffect()
    -- self:playEffect(effect)
    PlayerGuideManager:playDialogEffect( effect , effectTime*1000 )
  end

  -- local effectTime = self.tip.soundTime
  -- if effectTime and effectTime > 0 then
  --   self.effectTimer = TFDirector:addTimer(effectTime * 1000 ,1,nil ,function ()
  --     if self.effectHandle ~= nil then
  --         TFAudio.stopEffect(self.effectHandle)
  --         self.effectHandle = nil 
  --     end
  --     if PlayerGuideManager.effectHandle then
  --         TFAudio.stopEffect(PlayerGuideManager.effectHandle)
  --         PlayerGuideManager.effectHandle = nil
  --     end
  --     if self.effectTimer then
  --         TFDirector:removeTimer(self.effectTimer)
  --         self.effectTimer = nil
  --     end
  --   end)
  -- end

  self.bLeaving = false

   local img_icon_1 =  TFDirector:getChildByPath(self, 'img_icon_1');
   local txt_name_1 =  TFDirector:getChildByPath(self, 'txt_name_1');
   local txt_text_1 =  TFDirector:getChildByPath(self, 'txt_text_1');
   local bg_name1 =  TFDirector:getChildByPath(self, 'bg_name1');

   local img_icon_2 =  TFDirector:getChildByPath(self, 'img_icon_2');
   local txt_name_2 =  TFDirector:getChildByPath(self, 'txt_name_2');
   local txt_text_2 =  TFDirector:getChildByPath(self, 'txt_text_2');
   local bg_name2 =  TFDirector:getChildByPath(self, 'bg_name2');

   local bg_content =  TFDirector:getChildByPath(self, 'bg_content');

   local content  =  tip.content;

   if self.bgInTween ~= nil then
      TFDirector:killTween(self.bgInTween)
      self.bgInTween = nil
   end
   --[[
   if self.bgOutTween ~= nil then
      TFDirector:killTween(self.bgOutTween)
      self.bgOutTween = nil
   end
   ]]
   self.bgInTween = 
   {
      target = bg_content,
      {
        duration = 0,
        scaleY = 0.18,
        alpha = 0
      },
      {
        duration = 0.2,
        scaleY = 0.18,
        alpha = 0
      },
      {
        duration = 0.16,
        scaleY = 1,
        alpha = 255
      },
      onComplete = function ()
        TFDirector:killTween(self.bgInTween)
        self.bgInTween = nil
      end,
    }
    TFDirector:toTween(self.bgInTween)

    if self.nameBgInTween then
      TFDirector:killTween(self.nameBgInTween)
      self.nameBgInTween = nil
    end
    local tar = bg_name1
   if tip.position == MissionManager.TIPLEFT then
      --左边说话，隐藏右边
      img_icon_1:setVisible(true);
      txt_name_1:setVisible(true);
      bg_name1:setVisible(true);
      --txt_text_1:setVisible(true);

      if not self.bStopClick then
        img_icon_2:setVisible(false);
        txt_name_2:setVisible(false);
        bg_name2:setVisible(false);
        txt_text_2:setVisible(false);
      end

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

      --txt_text_1:setText(content);
      -- bg_content:setFlipX(false);
      
      txt_text_1:setText("")
      self:textFlying(txt_text_1, content, 0.03)
      tar = bg_name1
   end

   if tip.position == MissionManager.TIPRIGTH then
      --右边说话，隐藏左边
      img_icon_2:setVisible(true);
      txt_name_2:setVisible(true);
      bg_name2:setVisible(true);
      --txt_text_2:setVisible(true);

      if not self.bStopClick then
        img_icon_1:setVisible(false);
        txt_name_1:setVisible(false);
        bg_name1:setVisible(false);
        txt_text_1:setVisible(false);
      end

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

      --txt_text_2:setText(content);
      -- bg_content:setFlipX(true);
      txt_text_2:setText("")
      self:textFlying(txt_text_2, content, 0.03)

      tar = bg_name2
   end
   self:iconMove(1, tip.position)
   if tip.skipIconIn and tip.skipIconIn == 1 then
      self:skipActions()
      self:starCutDownForSkip()
   end

   local baseY = -55
   local destY = 27
   self.nameBgInTween = 
    {
        target = tar,
        {
          duration = 0,
          y = baseY,
        },
        {
          duration = 0.2,
          y = baseY + 55,
        },
        {
          duration = 0.16,
          y = destY,
        },
        onComplete = function ()
          TFDirector:killTween(self.nameBgInTween)
          self.nameBgInTween = nil
      end,
    }
    TFDirector:toTween(self.nameBgInTween)

  -- if tip.sound and tip.sound~= "" then
  --     local soundList = string.split(tip.sound,'|')
  --     local sound = soundList[1]
  --     if #soundList > 1 then
  --         sound = soundList[MainPlayer.sex]
  --     end
  --     self:playEffect(sound);
  --  end
 end

function MissionTipLayer:iconMove(moveType, pos)
  moveType = moveType or 1
  pos = pos or 1
  

   if moveType == 2 then
    self.bLeaving = true
   end

   --[[
   if moveType == 1 then
      self.img_icon_1:setPositionX(-self.X_LEFT - 46)
      self.img_icon_2:setPositionX(self.X_RIGHT + 46)
    elseif moveType == 2 then
      self.img_icon_1:setPositionX(-self.X_LEFT)
      self.img_icon_2:setPositionX(self.X_RIGHT)
    end
    ]]

    self.img_icon_1:setOpacity(0)
   local posY = self.img_icon_1:getPositionY()
   local tab_left = 
    {
       duration1 = {0, 0},
       x1 = {-self.X_LEFT - 46, -self.X_LEFT},
       alpha1 = {0, 1},
       duration2 = {0.16, 0.16},
       x2 = {-self.X_LEFT, -self.X_LEFT - 46},
       alpha2 = {1, 0},
       easeType = {TFEaseType.EASE_IN, TFEaseType.EASE_IN}
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
       x1 = {self.X_RIGHT + 46, self.X_RIGHT},
       alpha1 = {0, 1},
       duration2 = {0.16, 0.16},
       x2 = {self.X_RIGHT, self.X_RIGHT + 46},
       alpha2 = {1, 0},
       easeType = {TFEaseType.EASE_IN, TFEaseType.EASE_IN}
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
      if self.tweenLeft ~= nil then
        TFDirector:killTween(self.tweenLeft)
        self.tweenLeft = nil
      end

      TFDirector:toTween(self.tweenRight)
    else
      if self.tweenRight ~= nil then
        TFDirector:killTween(self.tweenRight)
        self.tweenRight = nil
      end
      
      TFDirector:toTween(self.tweenLeft)
    end
end

--注册事件
function MissionTipLayer:registerEvents()
   self.super.registerEvents(self); 
   self.bg.logic = self;
   if self.isGuide then
      self.bg:setVisible(false)
      self.ui:setSwallowTouch(false)
      self.ui:setTouchEnabled(false)
      return
   end
   self.bg:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onNextClickHandle));
end

--注册事件
function MissionTipLayer:removeEvents()
    self.super.removeEvents(self); 
    if self.movieDelayTimer then
        TFDirector:removeTimer(self.movieDelayTimer)
        self.movieDelayTimer = nil
    end
    if self.autoDelayTimer then
        TFDirector:removeTimer(self.autoDelayTimer)
        self.autoDelayTimer = nil
    end
    -- if self.effectHandle ~= nil then
    --   TFAudio.stopEffect(self.effectHandle)
    -- end

    -- if self.effectTimer then
    --   TFDirector:removeTimer(self.effectTimer)
    --   self.effectTimer = nil
    -- end
end

function MissionTipLayer:starCutDownForSkip()
    --存在一键托管
    print("starCutDownForSkip = >>>>>>>>>>>>>>>>>>>>>")
    if self.movieDelayTimer then
        TFDirector:removeTimer(self.movieDelayTimer)
        self.movieDelayTimer = nil
    end
    if self.autoDelayTimer then
        TFDirector:removeTimer(self.autoDelayTimer)
        self.autoDelayTimer = nil
    end
    local clickToNextStep = function ()
        print("end timer = ",MainPlayer:getNowtime())
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
        local AutoTalkWait = ConstantData:objectByID("TalkWaitSecond") or {}
        local cdTime = AutoTalkWait.value or 2000
        cdTime = math.ceil(cdTime/1000)
        print("start timer = ",MainPlayer:getNowtime())
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
return MissionTipLayer;
