--[[
******布阵-对方详情*******
]]
local FengYunLuVSLayer = class("BossFightArmyVSLayer", BaseLayer)

CREATE_SCENE_FUN(FengYunLuVSLayer)
CREATE_PANEL_FUN(FengYunLuVSLayer)


function FengYunLuVSLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.demond.demondOtherArmyVSLayer")
end

function FengYunLuVSLayer:initUI(ui)
    self.super.initUI(self,ui)

    self.panel_left   = TFDirector:getChildByPath(ui, 'panel_buzhen')
    self.panel_right   = TFDirector:getChildByPath(ui, 'panel_buzhen1')
    self.img_beijing    = TFDirector:getChildByPath(self.panel_right, 'img_beijing1')
    self.img_beijing1    = TFDirector:getChildByPath(self.panel_left, 'img_beijing1')
    self.img_beijing:setTexture("ui_new/bloodybattle/xz_chakanxiangqing3.png")
    self.img_beijing1:setTexture("ui_new/bloodybattle/xz_chakanxiangqing3.png")

    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close')
    
    self.btn_army       = TFDirector:getChildByPath(ui, 'btn_challenge')
    self.btn_army:setPositionX(153)
    self.btn_buzhen     = TFDirector:getChildByPath(ui, 'btn_buzhen')


    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close')

    self.txt_name       = TFDirector:getChildByPath(ui, 'txt_mingcheng_word')

    self.txt_rank       = TFDirector:getChildByPath(ui, 'txt_paiming_word')
    self.txt_power      = TFDirector:getChildByPath(ui, 'txt_zhandouli_word')
    self.txt_winRate    = TFDirector:getChildByPath(ui, 'txt_shenglv_word')
    self.panel_demond   = TFDirector:getChildByPath(ui, 'panel_demond')
    self.btn_quanli     = TFDirector:getChildByPath(ui, 'btn_quanli')
    self.btn_quanli:setVisible(false)
    
    
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

function FengYunLuVSLayer:setUserData(userData)
    self.userData = userData
end

function FengYunLuVSLayer:onShow()
    self.super.onShow(self)
    self:refreshBaseUI()
    self:refreshUI()
    self:drawLeftArea()
    self:drawRightArea()

end

function FengYunLuVSLayer:refreshBaseUI()

end

function FengYunLuVSLayer:refreshUI()
    if not self.isShow then
        return
    end

end

function FengYunLuVSLayer.onArmyClickHandle(sender)
    local self = sender.logic
    local gmid = sender.gmid

    if sender.isClick == false then
        return
    end

end

function FengYunLuVSLayer:getChangeBtn()
    return self.btn_challenge
end

--注册事件
function FengYunLuVSLayer:registerEvents()
   self.super.registerEvents(self)
   ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
   self.btn_close:setClickAreaLength(100)
    
   
    self.btn_army.logic = self
    self.btn_army:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAttackClickHandle),1)


    local function enterStarge(sender)
        FengYunLuManager:OpenFengYunLuArmy()
    end
    self.btn_buzhen:addMEListener(TFWIDGET_CLICK,  audioClickfun(enterStarge),1)
    
   for i=1,9 do
        local bg = TFDirector:getChildByPath(self.panel_right, "btn_icon"..i)
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
    TFDirector:addMEGlobalListener(FengYunLuManager.WIND_RECORD_WARSIDE_CONFIG_RESULT ,self.updatePosCallBack ) 
end

function FengYunLuVSLayer:removeEvents()

    TFDirector:removeMEGlobalListener(FengYunLuManager.WIND_RECORD_WARSIDE_CONFIG_RESULT ,self.updatePosCallBack ) 
    self.updatePosCallBack = nil

    self.super.removeEvents(self)
end


function FengYunLuVSLayer:drawLeftArea()
    self.button_self = {}
    self.button = {}
    local roleList = FengYunLuManager:getMyRoleList()
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
        self.button[i].img_zf       = TFDirector:getChildByPath(self.button[i],"img_zf"..i)
        self.button[i].img_zf:setVisible(false)

        self.button[i].quality = TFDirector:getChildByPath(self.panel_left, btnName)

        self.button[i].img_death:setVisible(false)

        -- local role = self:getRightRolePos(i)

        -- local role = BloodFightManager:getRoleByIndex(i)
        local roleid = roleList[i]
        local role = FYRecordData:getRoleinfoByid(roleid)
        self.button[i].bg.hasRole = false
        if role ~= nil then
            local role_info = RoleData:objectByID(role.role_id)
            self.button[i].bg.roleId = role.id
            self.button[i].bg.hasRole = true

            
            self.button[i].icon:setVisible(true)
            self.button[i].icon:setTexture(role_info:getHeadPath())

            self.button[i].bg:setVisible(true)
            self.button[i].quality:setTextureNormal(GetColorRoadIconByQualitySmall(role_info.quality))

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
    txt_zhanli:setVisible(false)
end

function FengYunLuVSLayer:drawRightArea()
    self.button = {}
    -- local npcs = FYRecordlineUoData:getNpcposandRoleBystageandday(FengYunLuManager.ranktype,FengYunLuManager.day)
    local npcs = FYRecordlineUoData:getNpcposandRoleById(FengYunLuManager:getMissionIdByDay(FengYunLuManager.day))
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


        local roleid = tonumber(npcs[i]);
        local role = FYRecordData:getRoleinfoByid(roleid)
        if  role ~= nil  then
            local role_info = RoleData:objectByID(role.role_id)
            self.button[i].icon:setVisible(true)
            self.button[i].icon:setTexture(role_info:getHeadPath())
            self.button[i].bg:setVisible(true)
            self.button[i].quality:setTextureNormal(GetColorRoadIconByQualitySmall(role_info.quality))
    
            self.button[i].bg.cardRoleId = role.id
            self.button[i].bg.role = role
    
            self.button[i].img_type:setVisible(true)
            self.button[i].img_type:setTexture("ui_new/fight/zhiye_".. role_info.outline ..".png")
    

    
            self.button[i].bar_hp:setPercent(100)
        else
            self.button[i].icon:setVisible(false)
            self.button[i].bg:setVisible(false)     
        
            self.button[i].bar_bg:setVisible(false)
            self.button[i].img_type:setVisible(false)
        end
    end

    local txt_name = TFDirector:getChildByPath(self.panel_right, "txt_name")
    local txt_zhanli = TFDirector:getChildByPath(self.panel_right, "txt_zhanli")
    local txt_weizhizhandouli = TFDirector:getChildByPath(self.panel_right, "txt_weizhizhandouli")

    txt_zhanli:setVisible(false)
    txt_weizhizhandouli:setVisible(false)
    -- local use = FYRecordlineUoData:getInfoBystageandday(FengYunLuManager.ranktype,FengYunLuManager.day)
    local use = FYRecordlineUoData:getInfoById(FengYunLuManager:getMissionIdByDay(FengYunLuManager.day))
    txt_name:setText(use.name)
end


function FengYunLuVSLayer.onBtnAttackClickHandle(sender)
    local self      = sender.logic
    self:Attack()
end

function FengYunLuVSLayer:Attack()
    -- local bossId   = self.userData.playerId
    FengYunLuManager:ChallengeCopy()
end


function FengYunLuVSLayer.cellTouchBeganHandle(cell)
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

function FengYunLuVSLayer.cellTouchMovedHandle(cell)
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


function FengYunLuVSLayer.cellTouchEndedHandle(cell)
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

function FengYunLuVSLayer:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId)
        self.longTouchTimerId = nil
    end
end

function FengYunLuVSLayer:createSelectCussor(cell,pos)
    play_press()

    cell.isClick = false

    self.lastPoint = pos

    local role = FYRecordData:objectByID(cell.roleId)
    self.selectCussor = TFImage:create()
    self.selectCussor:setFlipX(true)
    self.selectCussor:setTexture(role:getHeadPath())
    self.selectCussor:setScale(1)
    self.selectCussor:setPosition(ccpAdd(pos,ccp(-80,-0)) )
    self:addChild(self.selectCussor)
    self.selectCussor:setZOrder(100)
   
    self.curIndex = cell.posIndex
    
end

function FengYunLuVSLayer:moveSelectCussor(cell,pos)
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

function FengYunLuVSLayer:releaseSelectCussor(cell,pos)

  if cell.isClick == false  then
        if (self.curIndex == nil) then
            return;
        end
        --返回信息
        local dargRole      = FengYunLuManager:getRoleByRoleIdinAllList(cell.roleId);
        --返回第几位

        local toReplaceRole = FengYunLuManager:getRoleIndexByRoleidinMyList(cell.roleId)
        --在阵中释放
        if (self.curIndex ~= -1) then 

            --从列表中拖到阵中
            if (cell.posIndex == -1) then
                
                --本来已经在阵中
                if toReplaceRole and toReplaceRole ~= 0 then
                    --且不是本角色目前所在的位置，做位置变更
                    self:ChangePos(toReplaceRole - 1,self.curIndex - 1)
                    play_buzhenyidong()
                else
                --要上阵，但是已经到达上限
                    if FengYunLuManager:getMyRoleListUpNum() == 5 then
                        toastMessage(localizable.common_function_number_out);  
                        return
                    end
                    --普通上阵
                    self:GoIntoBattle(cell.roleId, self.curIndex - 1)
                end
            --阵中操作，更换位置   
            else
                self:ChangePos(toReplaceRole - 1,self.curIndex - 1)
                play_buzhenyidong()
            end
            return;

        end

        --在右边列表释放
        if (self.curIndex == -1) then

            if (cell.posIndex == -1 ) then
                --放弃上阵，不做操作
            else
                --下阵
                self:OutBattle(cell.roleId)
                play_buzhenluoxia();
            end
        end
    end

    if cell:hitTest(pos) then     
        -- FengYunLuArmyLayer.cellClickHandle(cell);
    end

end
--上阵
function FengYunLuVSLayer:GoIntoBattle(roid, Pos)
    FengYunLuManager:GoIntoBattle(roid, Pos)
end
-- 换位置
function FengYunLuVSLayer:ChangePos(oldPos, newPos)
    FengYunLuManager:ChangePos(oldPos, newPos)
end
--下阵
function FengYunLuVSLayer:OutBattle(roid)
    FengYunLuManager:OutBattle(roid)
end
return FengYunLuVSLayer
