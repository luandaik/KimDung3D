-- client side GuildBossVSLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-04-14


local GuildBossVSLayer = class("GuildBossVSLayer", BaseLayer)
GuildBossVSLayer.LIST_ITEM_WIDTH = 200 

function GuildBossVSLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.faction.YanWuArmyVSLayer")
end

function GuildBossVSLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.panel_left   = TFDirector:getChildByPath(ui, 'panel_buzhen')
    self.panel_right   = TFDirector:getChildByPath(ui, 'panel_buzhen1')

    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close')
    
    self.btn_army       = TFDirector:getChildByPath(ui, 'btn_challenge')
    self.btn_buzhen     = TFDirector:getChildByPath(ui, 'btn_buzhen')

    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close')
    self.tTxt_wf = {}
    self.tTxt_wf[1]      = TFDirector:getChildByPath(ui, 'txt_wf')
    self.tTxt_wf[1]:setText("")
    self.tTxt_wf[2]      = TFDirector:getChildByPath(ui, 'txt_wf1')
    self.tTxt_wf[2]:setText("")
    self.txt_sl      = TFDirector:getChildByPath(ui, 'txt_sl')
    self.tTxt_zt = {}
    self.tTxt_zt[1]      = TFDirector:getChildByPath(self.txt_sl, 'txt_zt1')
    self.tTxt_zt[1]:setText("")
    self.tTxt_zt[2]      = TFDirector:getChildByPath(self.txt_sl, 'txt_zt2')
    self.tTxt_zt[2]:setText("")

    self.img_rolebg = {}
    self.img_role = {}
    self.img_role_quility = {}

    local resPath = "effect/arena_attack.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("arena_attack_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(self:getSize().width/2 - 15,self:getSize().height/2 - 40))
    self:addChild(effect,20)
    effect:playByIndex(0, -1, -1, 0)
end

function GuildBossVSLayer:setBossType(_type)
    self.bossType = _type
    self.BossData = {}
    local bossInfo = GuildBossManager:getBossInfoByType(_type)
    local bossData = GuildBossManager:getBossDataByNpcid(bossInfo.npcId)
    self.BossData.bossInfo  = bossInfo
    self.BossData.npcId   = bossInfo.npcId
    self.BossData.bossName  = localizable.GuildBoss_BossType[_type]
    self.BossData.posInfo   = bossData.formation
end

function GuildBossVSLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI()
    self:refreshUI()
    self:drawLeftArea()
    self:drawRightArea()
    Public:addZhenFaIconForArmy(self.panel_left, EnumFightStrategyType.StrategyType_PVE)
end

function GuildBossVSLayer:refreshBaseUI()
    local bossInfo = GuildBossManager:getBossInfo()
    local index = 1
    local index0 = 2
    local strwf = {}
    self.txt_sl:setVisible(false)
    local isBoss1 = false
    local bossData = GuildBossManager:getBossDataByNpcid(self.BossData.npcId)
    if bossData.type == 1 then
        isBoss1 = true
    end
    for i,v in ipairs(bossInfo) do
        local bossData = GuildBossManager:getBossDataByNpcid(v.npcId)
        if bossData.type ~= 1 then
            local buffData = GuildBossManager:getBuffDataByid(v.bossBuff)
            if buffData then
                if v.bossBuff == 9 and v.dieCount > 0 then
                    local tbl = stringToTable(buffData.attribute,"|")
                    local tbls = stringToNumberTable(tbl[1],"_")
                    tbls[2] = tbls[2] / 10 - 100
                    local attNum = tbls[2] * v.dieCount
                    strwf[1] = localizable.assistAgreeLayer_all .. "+" .. attNum .. "%"
                end
                if isBoss1 == true and self.tTxt_zt[index] and buffData.direct_type == 0 then
                    if buffData.type == 0 and ( v.maxHp == nil or v.maxHp <= 0 or v.curHp > 0 ) then
                        self.tTxt_zt[index]:setText(buffData.desc2)
                        self.txt_sl:setVisible(true)
                        index = index + 1
                    elseif buffData.type == 1 and ( v.maxHp > 0 and v.curHp <= 0 ) then
                        self.tTxt_zt[index]:setText(buffData.desc2)
                        self.txt_sl:setVisible(true)
                        index = index + 1
                    end
                elseif buffData.direct_type == 1 and v.maxHp > 0 and v.curHp <= 0 then
                    strwf[index0] = buffData.desc2
                    index0 = index0 + 1
                end
            end
        end
    end
    index0 = 2
    if strwf[1] then
        index0 = 1
    end
    if strwf[index0] then
        self.tTxt_wf[1]:setText(strwf[ index0 ] or "")
    end
    if strwf[index0 + 1] then
        self.tTxt_wf[2]:setText(strwf[ index0 + 1 ] or "")
    end
end

function GuildBossVSLayer:refreshUI()
    if not self.isShow then
        return
    end
end

function GuildBossVSLayer:getRoleBtPos(pos)
    local temptbl = string.split(self.BossData.posInfo,',')
    local idx = 0
    for k,v in pairs(temptbl) do
        idx = idx + 1
        local roleId = tonumber(v)
        if idx == pos and roleId > 0 then
            local NpcId = tonumber(v)
            local npcInfo = NPCData:objectByID(NpcId)
            if npcInfo then
                local cardRole = RoleData:objectByID(npcInfo.role_id)
                local bloodData = self:getNpcBlood(NpcId)
                cardRole.level  = 100
                cardRole.maxHp  = 100
                cardRole.currHp = 100
                if bloodData and bloodData.maxHp > 0 then
                    cardRole.maxHp  = bloodData.maxHp
                    cardRole.currHp = bloodData.curHp
                end
                return cardRole
            end
        end
    end
end

function GuildBossVSLayer:getNpcBlood( npcid )
    local mainInfo = GuildBossManager:getMianInfo()
    local stage = mainInfo.stage
    local stageInfo = GuildBossManager:getStageData(stage)
    local bossInfo = self.BossData.bossInfo
    local tbl = stringToTable(bossInfo.currentBlood,",")
    local bloodData = {}
    for _i,_v in ipairs(tbl) do
        local tbls = stringToNumberTable(_v,"_")
        if tbls[1] == npcid then
            local npc = NPCData:objectByID(tbls[1])
            if npc then
                local attri = npc.attribute
                local attriList = stringToTable(attri,"|")
                if attriList[1] then
                    local tblss = stringToNumberTable(attriList[1],"_")
                    bloodData.curHp = tbls[2] * ( stageInfo.main_coefficient * 0.001 )
                    bloodData.maxHp = tblss[2] * ( stageInfo.main_coefficient * 0.001 )
                    return bloodData
                end
            end
        end
    end
    return nil
end

function GuildBossVSLayer.cellClickHandle(sender)
    local self = sender.logic
    local cardRoleId = sender.cardRoleId
    Public:ShowItemTipLayer(sender.role.id, EnumDropType.ROLE, 1,sender.role.level)
end

function GuildBossVSLayer.onArmyClickHandle(sender)
    local self = sender.logic
    local gmid = sender.gmid

    if sender.isClick == false then
        return
    end
end

function GuildBossVSLayer:getChangeBtn()
    return self.btn_challenge
end

--注册事件
function GuildBossVSLayer:registerEvents()
   self.super.registerEvents(self)
   ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
   self.btn_close:setClickAreaLength(100)
    
   
    self.btn_army.logic = self
    self.btn_army.index = 1
    self.btn_army:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAttackClickHandle),1)

    local function enterStarge(sender)
        CardRoleManager:openRoleList(false)
    end
    self.btn_buzhen:addMEListener(TFWIDGET_CLICK,  audioClickfun(enterStarge),1)

   for i=1,9 do
        local bg = TFDirector:getChildByPath(self.panel_right, "btn_icon"..i)
        bg.logic = self
        bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.cellClickHandle),1)
    end

    for i=1,9 do
        local bg = TFDirector:getChildByPath(self.panel_left, "btn_icon"..i)
        bg.logic = self
        bg.posIndex = i

        bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onArmyClickHandle),1)

        bg:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle,1)
        bg:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle)
        bg:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle)   
    end

    self.updatePosCallBack = function(event)
        self:drawLeftArea()
    end
    TFDirector:addMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS ,self.updatePosCallBack ) 
end

function GuildBossVSLayer:removeEvents()
    TFDirector:removeMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS ,self.updatePosCallBack ) 
    self.updatePosCallBack = nil
    self.super.removeEvents(self)
end


function GuildBossVSLayer:drawLeftArea()
    self.button_self = {}
    self.button = {}
    for i=1,9 do
        local btnName = "panel_item" .. i
        self.button[i] = TFDirector:getChildByPath(self.panel_left, btnName)

        self.button_self[i] = self.button[i]
        self.button_self[i].posIndex = i

        btnName = "btn_icon"..i
        self.button[i].bg = TFDirector:getChildByPath(self.panel_left, btnName)
        self.button[i].bg:setVisible(false)

        self.button[i].icon = TFDirector:getChildByPath(self.button[i].bg ,"img_touxiang")
        self.button[i].icon:setVisible(false)

        self.button[i].bar_bg       = TFDirector:getChildByPath(self.button[i],"img_xuetiao"..i)
        self.button[i].bar_hp       = TFDirector:getChildByPath(self.button[i],"bar_xuetiao"..i)
        self.button[i].img_type     = TFDirector:getChildByPath(self.button[i],"img_zhiye")
        self.button[i].img_death    = TFDirector:getChildByPath(self.button[i],"img_death"..i)


        self.button[i].quality = TFDirector:getChildByPath(self.panel_left, btnName)

        self.button[i].img_death:setVisible(false)

        self.button[i].bg.gmid = 0
        local role = StrategyManager:getRoleByIndex(i)

        self.button[i].bg.hasRole = false
        self.button[i].bg.gmId = 0
        if  role ~= nil then

            self.button[i].bg.gmId = role.gmId
            self.button[i].bg.hasRole = true
            self.button[i].bg.gmid = role.gmId
            
            self.button[i].icon:setVisible(true)
            self.button[i].icon:setTexture(role:getHeadPath())

            self.button[i].bg:setVisible(true)
            self.button[i].quality:setTextureNormal(GetColorRoadIconByQualitySmall(role.quality))

            self.button[i].bg.cardRoleId = role.id
            self.button[i].bg.role = role

            self.button[i].img_type:setVisible(true)
            self.button[i].img_type:setTexture("ui_new/fight/zhiye_".. role.outline ..".png")
        
            local maxHp = 100
            local curHp = 100

            if curHp <= 0 then
                self.button[i].img_death:setVisible(true)
                self.button[i].icon:setShaderProgram("GrayShader", true)
            else
                self.button[i].img_death:setVisible(false)
                self.button[i].icon:setShaderProgramDefault(true)
            end

            self.button[i].bar_hp:setPercent(curHp * 100 / maxHp)

            self.button[i].bar_bg:setVisible(true)
            self.button[i].img_type:setVisible(true)            
            self.button[i].icon:setVisible(true)
            self.button[i].bg:setVisible(true)

            self.button[i].icon:setFlipX(true)
            Public:addLianTiEffect(self.button[i].icon,role:getMaxLianTiQua(),true)
        else
            self.button[i].icon:setVisible(false)
            self.button[i].bg:setVisible(false)     
        
            self.button[i].bar_bg:setVisible(false)
            self.button[i].img_type:setVisible(false)
            Public:addLianTiEffect(self.button[i].icon,0,false)
        end
    end

    local txt_name = TFDirector:getChildByPath(self.panel_left, "txt_name")
    local txt_zhanli = TFDirector:getChildByPath(self.panel_left, "txt_zhanli")
    txt_name:setText(MainPlayer:getPlayerName())
    txt_zhanli:setText(StrategyManager:getPower())
end

function GuildBossVSLayer:drawRightArea()
    self.button = {}
    for i=1,9 do
        local btnName = "panel_item" .. i
        self.button[i] = TFDirector:getChildByPath(self.panel_right, btnName)

        btnName = "btn_icon"..i
        self.button[i].bg = TFDirector:getChildByPath(self.panel_right, btnName)
        self.button[i].bg:setVisible(false)

        self.button[i].icon = TFDirector:getChildByPath(self.button[i].bg ,"img_touxiang")
        self.button[i].icon:setVisible(false)

        self.button[i].bar_bg       = TFDirector:getChildByPath(self.button[i],"img_xuetiao"..i)
        self.button[i].bar_hp       = TFDirector:getChildByPath(self.button[i],"bar_xuetiao"..i)
        self.button[i].img_type     = TFDirector:getChildByPath(self.button[i],"img_zhiye")
        self.button[i].img_death    = TFDirector:getChildByPath(self.button[i],"img_death"..i)

        self.button[i].quality = TFDirector:getChildByPath(self.panel_right, btnName)

        self.button[i].img_death:setVisible(false)

        local role = self:getRoleBtPos(i)
        if  role ~= nil then
            self.button[i].icon:setVisible(true)
            self.button[i].icon:setTexture(role:getHeadPath())

            self.button[i].bg:setVisible(true)
            self.button[i].quality:setTextureNormal(GetColorRoadIconByQualitySmall(role.quality))

            self.button[i].bg.cardRoleId = role.id
            self.button[i].bg.role = role

            self.button[i].img_type:setVisible(true)
            self.button[i].img_type:setTexture("ui_new/fight/zhiye_".. role.outline ..".png")

            if role.currHp <= 0 then
                self.button[i].img_death:setVisible(true)
                self.button[i].icon:setShaderProgram("GrayShader", true)
            end

            self.button[i].bar_hp:setPercent(role.currHp * 100 / role.maxHp)
        else
            self.button[i].icon:setVisible(false)
            self.button[i].bg:setVisible(false)     
        
            self.button[i].bar_bg:setVisible(false)
            self.button[i].img_type:setVisible(false)
        end
    end

    local txt_name = TFDirector:getChildByPath(self.panel_right, "txt_name")
    txt_name:setText(self.BossData.bossName)
end


function GuildBossVSLayer.onBtnAttackClickHandle(sender)
    local self      = sender.logic
    self:Attack()
end

function GuildBossVSLayer:Attack()
    local npcId   = self.BossData.npcId
    GuildBossManager:requireAttackBoss(npcId)
    AlertManager:close(AlertManager.TWEEN_NONE)
end

function GuildBossVSLayer.cellTouchBeganHandle(cell)
    local self = cell.logic
    if cell.hasRole ~= true then
        return
    end
    cell.isClick = true
    cell.isDrag  = false
    self.isMove = false
    self.onLongTouch = function(event)
        if self.isMove == false then
            return
        end
        local pos = cell:getTouchMovePos()
        local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos())
        if (v.x < 30 and v.y < 30 )  then
        else 
            self:removeLongTouchTimer()    
            if (v.x - v.y > -10) then
                cell.isDrag  = true
            else
                cell.isDrag  = false
            end
        end
    end
    if (cell.posIndex == -1) then
        self:removeLongTouchTimer()
        self.longTouchTimerId = TFDirector:addTimer(0.001, -1, nil, self.onLongTouch) 
    end
end

function GuildBossVSLayer.cellTouchMovedHandle(cell)
    local self = cell.logic
    self.isMove = true
    if cell.hasRole ~= true then
        return
    end
    local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos())
    local pos = cell:getTouchMovePos()
    if self.selectCussor == nil then
        if (cell.posIndex ~= -1) then
            if (v.y < 30 and v.y > -30) and  (v.x < 30 and v.x > -30)  then
               return
            end
        end
        if (cell.posIndex ~= -1 or cell.isDrag == true ) then
            self:createSelectCussor(cell,pos)
        end
    end
    if cell.isClick == true then
        return
    end
    self:moveSelectCussor(cell,pos)
end


function GuildBossVSLayer.cellTouchEndedHandle(cell)
    local self = cell.logic
    if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true)
        self.selectCussor = nil
    end
    if cell.hasRole ~= true then
        return
    end
    self:removeLongTouchTimer()
    local pos = cell:getTouchEndPos()
    self:releaseSelectCussor(cell,pos)
end

function GuildBossVSLayer:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId)
        self.longTouchTimerId = nil
    end
end

function GuildBossVSLayer:createSelectCussor(cell,pos)
    play_press()
    cell.isClick = false
    self.lastPoint = pos
    local role = CardRoleManager:getRoleByGmid(cell.gmId)
    self.selectCussor = TFImage:create()
    self.selectCussor:setFlipX(true)
    self.selectCussor:setTexture(role:getHeadPath())
    self.selectCussor:setScale(1)
    self.selectCussor:setPosition(ccpAdd(pos,ccp(-80,-0)) )
    self:addChild(self.selectCussor)
    self.selectCussor:setZOrder(100)
   
    self.curIndex = cell.posIndex
    
end

function GuildBossVSLayer:moveSelectCussor(cell,pos)
    local v = ccpSub(pos, self.lastPoint)
    self.lastPoint = pos
    local scp = ccpAdd(self.selectCussor:getPosition(), v)
    self.selectCussor:setPosition(scp)
    self.selectCussor:setVisible(true)

    self.curIndex = nil

    for i=1,9 do
        if  self.button_self[i]:hitTest(pos) then
            self.curIndex = self.button_self[i].posIndex
            break
        end
    end

end

function GuildBossVSLayer:releaseSelectCussor(cell,pos)
    if cell.isClick == false  then
        if (self.curIndex == nil) then
            return
        end
        local dargRole      = CardRoleManager:getRoleByGmid(cell.gmId)
        local toReplaceRole =  StrategyManager:getRoleByIndex(self.curIndex)
        if (self.curIndex ~= -1) then 
            if (cell.posIndex == -1) then
                if dargRole.pos and dargRole.pos ~= 0 then
                    if (toReplaceRole == nil or (toReplaceRole and toReplaceRole.gmId ~= dargRole.gmId)) then
                        local sendMsg = {              
                        dargRole.pos - 1,
                        self.curIndex - 1,   
                        }
                        showLoading()
                        TFDirector:send(c2s.CHANGE_INDEX,sendMsg)
                        play_buzhenyidong()

                    end
                elseif (toReplaceRole == nil and not StrategyManager:canAddFightRole()) then
                    if StrategyManager.maxNum == 5 then
                        toastMessage(localizable.common_function_number_out);  
                    else
                        local needLevel = FunctionOpenConfigure:getOpenLevel(700 + (StrategyManager.maxNum + 1))
                        if MainPlayer:getLevel() < needLevel then
                            toastMessage(stringUtils.format(localizable.common_function_up_number,needLevel, (StrategyManager.maxNum + 1)) )                            
                        end
                    end 
                else
                    local battle = {cell.gmId,( self.curIndex - 1)}
                    showLoading()
                    TFDirector:send(c2s.TO_BATTLE,{battle})
                    play_buzhenyidong()
                end
            else
                local sendMsg = {              
                cell.posIndex - 1,
                self.curIndex - 1,   
                }
                showLoading()
                TFDirector:send(c2s.CHANGE_INDEX,sendMsg)
                play_buzhenyidong()
            end
            return
        end
        if (self.curIndex == -1) then
            if (cell.posIndex == -1 ) then
            else
                showLoading()
                TFDirector:send(c2s.OUT_BATTLE,{cell.gmId})
                play_buzhenluoxia()
            end
        end
    end
end

return GuildBossVSLayer
