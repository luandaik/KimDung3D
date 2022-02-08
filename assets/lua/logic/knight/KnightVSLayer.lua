--[[
******浪人武士-布阵*******
    -- create by fei
    -- 2016/12/07
]]
local KnightVSLayer = class("BossFightArmyVSLayer", BaseLayer)

CREATE_SCENE_FUN(KnightVSLayer)
CREATE_PANEL_FUN(KnightVSLayer)

KnightVSLayer.LIST_ITEM_WIDTH = 200 


function KnightVSLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.demond.demondOtherArmyVSLayer")
end

function KnightVSLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.panel_left     = TFDirector:getChildByPath(ui, 'panel_buzhen')
    self.panel_right    = TFDirector:getChildByPath(ui, 'panel_buzhen1')
    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_army       = TFDirector:getChildByPath(ui, 'btn_challenge')
    self.btn_buzhen     = TFDirector:getChildByPath(ui, 'btn_buzhen')
    self.txt_name       = TFDirector:getChildByPath(ui, 'txt_mingcheng_word')
    self.txt_rank       = TFDirector:getChildByPath(ui, 'txt_paiming_word')
    self.txt_power      = TFDirector:getChildByPath(ui, 'txt_zhandouli_word')
    self.txt_winRate    = TFDirector:getChildByPath(ui, 'txt_shenglv_word')
    self.txt_tips1      = TFDirector:getChildByPath(ui, 'txt_tips1')
    self.txt_level      = TFDirector:getChildByPath(ui, 'txt_level')
    self.btn_quanli    = TFDirector:getChildByPath(ui, 'btn_quanli')
    self.btn_quanli:setVisible(false)
    
    self.img_rolebg     = {}
    self.img_role       = {}
    self.img_role_quility = {}


    local resPath = "effect/arena_attack.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("arena_attack_anim")

    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(self:getSize().width/2 - 15,self:getSize().height/2 - 40))

    self:addChild(effect,20)
    effect:playByIndex(0, -1, -1, 0)
end

function KnightVSLayer:addKnightInfo(shareInfo)
    self.shareInfo = shareInfo
end

function KnightVSLayer:onShow()
    self.super.onShow(self)
    self:drawLeftArea()
    self:drawRightArea()
    self:refreshUI()
    Public:addZhenFaIconForArmy(self.panel_left, EnumFightStrategyType.StrategyType_PVE)
end


function KnightVSLayer:refreshUI()
    local fightInfo = KnightManager:getKnightFightData(self.shareInfo)
    if (fightInfo) then
        for i,v in ipairs(fightInfo) do
            local txt_tips     = TFDirector:getChildByPath(self.ui, 'txt_tips'..i)
            local battleInfo    = BattleLimitedData:objectByID(tonumber(v.id))
            if battleInfo and txt_tips then
                txt_tips:setVisible(true)
                if (tonumber(battleInfo.type) == 4) then
                    --Knight_share_tips         = "我方侠客技能怒气消耗增加{p1}点"
                    txt_tips:setText(stringUtils.format(localizable.Knight_share_tips, battleInfo.value));
                else
                    txt_tips:setText(battleInfo:getDescribe());
                end
            end
        end
    end
end

function KnightVSLayer:getRightRolePos(pos)
    if self.userData == nil then
        return nil
    end
    if self.userData.warside == nil then
        return
    end

    local idx = 0
    for _,v in pairs(self.userData.warside) do
        local cardRole  = RoleData:objectByID(v.id)
        local idx       = v.warIndex + 1
        if idx == pos then
            cardRole.maxHp  = 100
            cardRole.currHp = 100
            return cardRole
        end
    end
end

function KnightVSLayer:getRightRoleInfoByPos(pos)
    if self.userData == nil then
        return nil
    end
    if self.userData.warside == nil then
        return
    end

    local idx = 0
    for _,v in pairs(self.userData.warside) do
        local cardRole = RoleData:objectByID(v.id)
        local idx = v.warIndex + 1
        if idx == pos then
            return v
        end
    end
end

function KnightVSLayer.cellClickHandle(sender)
    local self = sender.logic
    local cardRoleId = sender.cardRoleId

    OtherPlayerManager:openRoleInfo(self.userData, cardRoleId)
    -- Public:ShowItemTipLayer(sender.role.id, EnumDropType.ROLE, 1,sender.role.level)
end

function KnightVSLayer.onArmyClickHandle(sender)
    local self = sender.logic
    local gmid = sender.gmid

    if sender.isClick == false then
        return
    end
end

function KnightVSLayer:getChangeBtn()
    return self.btn_challenge
end

--注册事件
function KnightVSLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    self.btn_close:setClickAreaLength(100)
    self.btn_army.logic = self
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

    self.requestRoleList = function(event)
        self:drawLeftArea()
    end

    TFDirector:addMEGlobalListener(BloodFightManager.MSG_REQUEST_ROLELIST_RESULT, self.requestRoleList)

    self.updatePosCallBack = function(event)
        self:drawLeftArea()
    end
    TFDirector:addMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS ,self.updatePosCallBack ) 
end

function KnightVSLayer:removeEvents()
    TFDirector:removeMEGlobalListener(BloodFightManager.MSG_INSPIRE_RESULT, self.inspireUpdate)
    self.inspireUpdate = nil


    TFDirector:removeMEGlobalListener(BloodFightManager.MSG_REQUEST_ROLELIST_RESULT, self.requestRoleList)
    self.requestRoleList = nil


    TFDirector:removeMEGlobalListener(StrategyManager.UPDATE_STARTEGY_POS ,self.updatePosCallBack ) 
    self.updatePosCallBack = nil

    self.super.removeEvents(self)
end


function KnightVSLayer:drawLeftArea()
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

        -- local role = self:getRightRolePos(i)
        self.button[i].bg.gmid = 0
        -- local role = BloodFightManager:getRoleByIndex(i)
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
            -- self.button[i].quality:setTextureNormal(GetRoleBgByWuXueLevel_circle_small(role.martialLevel))

            self.button[i].bg.cardRoleId = role.id
            self.button[i].bg.role = role

            self.button[i].img_type:setVisible(true)
            self.button[i].img_type:setTexture("ui_new/fight/zhiye_".. role.outline ..".png")
        
            local maxHp = 100--role.blood_maxHp
            local curHp = 100--role.blood_curHp

            if curHp <= 0 then
                self.button[i].img_death:setVisible(true)
                self.button[i].icon:setShaderProgram("GrayShader", true)
            else
                self.button[i].img_death:setVisible(false)
                self.button[i].icon:setShaderProgramDefault(true)
                -- self.button[i].icon:setShaderProgram("GrayShader", false)
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

    local txt_name      = TFDirector:getChildByPath(self.panel_left, "txt_name")
    local txt_zhanli    = TFDirector:getChildByPath(self.panel_left, "txt_zhanli")
    txt_name:setText(MainPlayer:getPlayerName())
    txt_zhanli:setText(StrategyManager:getPower())
end

function KnightVSLayer:drawRightArea()
    self.button = {}
    local knightInfo = nil
    local isShare = false
    if (self.shareInfo and self.shareInfo.knightInfo) then
        isShare = true
        knightInfo = KnightManager:getKnightData(self.shareInfo.knightInfo.type, self.shareInfo.knightInfo.level)
    else
        knightInfo = KnightManager:getKnightData()
    end
    local battleInfo = nil
    if (knightInfo) then
        battleInfo = string.split(knightInfo.formations, ",")
    end
    for i=1,9 do
        self.button[i] = TFDirector:getChildByPath(self.panel_right, "panel_item" .. i)
        self.button[i].btn_icon     = TFDirector:getChildByPath(self.button[i], "btn_icon"..i)
        self.button[i].icon         = TFDirector:getChildByPath(self.button[i].btn_icon ,"img_touxiang")
        self.button[i].bar_bg       = TFDirector:getChildByPath(self.button[i].btn_icon, "img_xuetiao"..i)
        self.button[i].bar_hp       = TFDirector:getChildByPath(self.button[i].btn_icon, "bar_xuetiao"..i)
        self.button[i].img_type     = TFDirector:getChildByPath(self.button[i].btn_icon, "img_zhiye")
        self.button[i].img_death    = TFDirector:getChildByPath(self.button[i], "img_death"..i)
        self.button[i].btn_icon:setVisible(false)
        self.button[i].icon:setVisible(false)
        self.button[i].img_death:setVisible(false)
        
        local currHp = 1
        if (isShare and self.shareInfo and self.shareInfo.eachHp) then
            currHp    = self.shareInfo.eachHp[i] or 0
        end
        if (currHp > 0) then
            local roleId        = tonumber(battleInfo[i])
            local roleInfo      = NPCData:objectByID(roleId)
            if roleInfo ~= nil then
                local role          = RoleData:objectByID(roleInfo.role_id)
                if (role ~= nil) then
                    self.button[i].icon:setTexture(role:getHeadPath())
                    self.button[i].btn_icon:setTextureNormal(GetColorRoadIconByQualitySmall(role.quality))
                    
                    if (isShare and self.shareInfo and self.shareInfo.eachHp) then
                        --local currHp    = self.shareInfo.eachHp[i] or 0
                        local maxHp     = self.shareInfo.eachMaxHp[i]
                        if (maxHp < 0) then
                            self.button[i].bar_hp:setPercent(0)
                        else
                            self.button[i].bar_hp:setPercent(currHp / maxHp * 100)
                        end
                    else
                        self.button[i].bar_hp:setPercent(100)
                    end
                    
                    self.button[i].img_type:setTexture("ui_new/fight/zhiye_".. role.outline ..".png")

                    self.button[i].bar_bg:setVisible(true)
                    self.button[i].img_type:setVisible(true)
                    self.button[i].icon:setVisible(true)
                    self.button[i].btn_icon:setVisible(true)

                    self.button[i].btn_icon:addMEListener(TFWIDGET_CLICK,  audioClickfun(function()
                                                                                 Public:ShowItemTipLayer(roleInfo.role_id, EnumDropType.ROLE, 1,roleInfo.level)
                                                                                 end))
                end
            end
        end
    end

    local txt_name              = TFDirector:getChildByPath(self.panel_right, "txt_name")
    local txt_zhanli            = TFDirector:getChildByPath(self.panel_right, "txt_zhanli")
    local txt_weizhizhandouli   = TFDirector:getChildByPath(self.panel_right, "txt_weizhizhandouli")
    local txt_level             = TFDirector:getChildByPath(self.panel_right, "txt_level")
    txt_level:setText(stringUtils.format(localizable.common_LV, knightInfo.level))
    txt_level:setVisible(true)
    txt_zhanli:setVisible(true)
    txt_weizhizhandouli:setVisible(false)
    txt_name:setText(localizable.Knight_Name[knightInfo.type])
    txt_zhanli:setText(knightInfo.power)
    local txt_tips1 = TFDirector:getChildByPath(self.panel_right, "txt_tips1")
    local txt_tips2 = TFDirector:getChildByPath(self.panel_right, "txt_tips2")
end


function KnightVSLayer.onBtnAttackClickHandle(sender)
    local self      = sender.logic
    
    if (self.shareInfo) then
        KnightManager:requestFriendKnightBeginFight(self.shareInfo)
    else
        KnightManager:requestKnightBeginFight()
    end
    AlertManager:close()
end

function KnightVSLayer.cellTouchBeganHandle(cell)
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

function KnightVSLayer.cellTouchMovedHandle(cell)
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


function KnightVSLayer.cellTouchEndedHandle(cell)
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

function KnightVSLayer:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId)
        self.longTouchTimerId = nil
    end
end

function KnightVSLayer:createSelectCussor(cell,pos)
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

function KnightVSLayer:moveSelectCussor(cell,pos)
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

function KnightVSLayer:releaseSelectCussor(cell,pos)
    print("KnightVSLayer:releaseSelectCussor")
    if cell.isClick == false  then
        if (self.curIndex == nil) then
            return
        end
        local dargRole      = CardRoleManager:getRoleByGmid(cell.gmId)
        local toReplaceRole =  StrategyManager:getRoleByIndex(self.curIndex)

        --在阵中释放
        if (self.curIndex ~= -1) then 

            --从列表中拖到阵中
            if (cell.posIndex == -1) then

                --本来已经在阵中
                if dargRole.pos and dargRole.pos ~= 0 then

                    --且不是本角色目前所在的位置，做位置变更
                    if (toReplaceRole == nil or (toReplaceRole and toReplaceRole.gmId ~= dargRole.gmId)) then
                        local sendMsg = {              
                        dargRole.pos - 1,
                        self.curIndex - 1,   
                        }
                        showLoading()
                        TFDirector:send(c2s.CHANGE_INDEX,sendMsg)

                        -- BloodFightManager:ChangePos(dargRole.pos - 1, self.curIndex - 1)

                        play_buzhenyidong()

                    end
                --要上阵，但是已经到达上限
                elseif (toReplaceRole == nil and not StrategyManager:canAddFightRole()) then
                    if StrategyManager.maxNum == 5 then
                        --toastMessage("上阵人数已满")
                        toastMessage(localizable.common_function_number_out);  

                    else
                        local needLevel = FunctionOpenConfigure:getOpenLevel(700 + (StrategyManager.maxNum + 1))
                        if MainPlayer:getLevel() < needLevel then
                            --toastMessage("团队等级" .. needLevel .. "级可上阵" .. (StrategyManager.maxNum + 1) .."人")
                            toastMessage(stringUtils.format(localizable.common_function_up_number,needLevel, (StrategyManager.maxNum + 1)))                            
                        end
                    end 
                else
                    local battle = {cell.gmId,( self.curIndex - 1)}
                    showLoading()
                    TFDirector:send(c2s.TO_BATTLE,{battle})
                    -- BloodFightManager:OnBattle(cell.gmId, self.curIndex - 1)
                    play_buzhenyidong()

                end  
            else
                local sendMsg = {              
                cell.posIndex - 1,
                self.curIndex - 1,   
                }
                showLoading()
                TFDirector:send(c2s.CHANGE_INDEX,sendMsg)

                -- BloodFightManager:ChangePos(cell.posIndex - 1, self.curIndex - 1)

                play_buzhenyidong()
            end

            return
        end

        --在右边列表释放
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

return KnightVSLayer
