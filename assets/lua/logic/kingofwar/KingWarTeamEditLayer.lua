-- client side KingWarTeamEditLayer.lua
--[[
 * @Description: 队伍编辑
 ]]
-- script writer Happy.All
-- creation time 2016-11-3 18:13:36

local KingWarTeamEditLayer = class("KingWarTeamEditLayer", BaseLayer)


function KingWarTeamEditLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossarena.TeamEditor")

    self.firstShow = true
end

function KingWarTeamEditLayer:initUI(ui)
	self.super.initUI(self, ui)

    self.btnClose = TFDirector:getChildByPath(ui, "btn_close")
    self.btnClose.logic = self
    self.btnOK = TFDirector:getChildByPath(ui, "btn_ok")
    self.btnOK.logic = self

    self.roleNode = {}
    for i = 1,3 do
        self.roleNode[i] = TFDirector:getChildByPath(ui, "panel_zhenlie" .. i)

        self.roleNode[i].imgBg = TFDirector:getChildByPath(self.roleNode[i], "bg_role")
        self.roleNode[i].imgBg:setTouchEnabled(true)
        self.roleNode[i].imgBg.logic = self
        self.roleNode[i].imgBg:addMEListener(TFWIDGET_TOUCHBEGAN, self.cellTouchBeganHandle);
        self.roleNode[i].imgBg:addMEListener(TFWIDGET_TOUCHMOVED, self.cellTouchMovedHandle);
        self.roleNode[i].imgBg:addMEListener(TFWIDGET_TOUCHENDED, self.cellTouchEndedHandle);
        self.roleNode[i].imgBg.posIndex = i

        self.roleNode[i].imgBigRole = TFDirector:getChildByPath(self.roleNode[i].imgBg, "img_role")

        self.roleNode[i].imgHead = TFDirector:getChildByPath(self.roleNode[i].imgBg, "img_touxiang")
        self.roleNode[i].txtName = TFDirector:getChildByPath(self.roleNode[i].imgBg, "txt_name")
        self.roleNode[i].txtPower = TFDirector:getChildByPath(self.roleNode[i].imgBg, "txt_zhanli")
        self.roleNode[i].imgEmpty = TFDirector:getChildByPath(self.roleNode[i].imgBg, "img_empty")
        self.roleNode[i].imgCaptain = TFDirector:getChildByPath(self.roleNode[i], 'img_dz')
        
        self.roleNode[i].img_hui = TFDirector:getChildByPath(self.roleNode[i], 'img_hui')


        self.roleNode[i].txtLoginTime = TFDirector:getChildByPath(self.roleNode[i], 'txt_time')        
        self.roleNode[i].txt_zuijin = TFDirector:getChildByPath(self.roleNode[i], 'txt_zuijin')        
        self.roleNode[i].img_splash = TFDirector:getChildByPath(self.roleNode[i], 'img_splash')        
    end
        
    -- self.splitLine = {}
    -- for i=1, 3 do
    --     self.splitLine[i] = TFDirector:getChildByPath(ui, "img_fenge" .. i)
    --     self.splitLine[i]:setVisible(false)
    -- end

    self:showMyTeamInfo()
end

function KingWarTeamEditLayer:removeUI()
	self.super.removeUI(self)
end

function KingWarTeamEditLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function KingWarTeamEditLayer:refreshUI()
    
end

function KingWarTeamEditLayer:showMyTeamInfo()
    local myTeam = KingOfWarManager:getTeamInfo()
    if myTeam == nil or myTeam.team == nil then
        print("team info not exist!!!")
        return
    end
    self.myTeamId = myTeam.team.id
    self.leaderId = myTeam.team.leader

    self.teamMemberInfo = {}
    if myTeam.team.member then
        for _,v in pairs(myTeam.team.member) do   
            local position = tonumber(v.position)
            self.teamMemberInfo[position] = clone(v)
        end
    end

    for k,v in pairs(self.roleNode) do
        local memberInfo = self.teamMemberInfo[tonumber(k)]
        v.imgBg.playerId = 0
        if memberInfo then      
            v.imgBg.playerId = memberInfo.playerId
            local RoleIcon = RoleData:objectByID(memberInfo.useIcon)
            v.imgBigRole:setTexture(RoleIcon:getBigImagePath())
            v.imgBigRole:setVisible(true)
            -- Public:addInfoListen(v.imgBigRole,true,6,memberInfo.playerId)
            v.txtLoginTime:setVisible(true)
            local currTime = MainPlayer:getNowtime() - memberInfo.loginTime/1000
            v.txtLoginTime:setText(FriendManager:formatTimeToStringWithOut(currTime))
            v.txtName:setVisible(true)
            v.txtName:setText(memberInfo.name)
            v.txtPower:setVisible(true)
            v.txtPower:setText(stringUtils.format(localizable.common_CE, memberInfo.power))            
            if memberInfo.playerId == self.leaderId then
                v.imgCaptain:setVisible(true)
            else
                v.imgCaptain:setVisible(false)
            end
            v.imgEmpty:setVisible(false)

            v.txt_zuijin:setVisible(true)
            v.img_splash:setVisible(true)
            v.img_hui:setVisible(true)
        else
            v.txt_zuijin:setVisible(false)
            v.img_hui:setVisible(false)
            v.img_splash:setVisible(false)
            v.txtLoginTime:setVisible(false)
            v.txtName:setVisible(false)
            v.txtPower:setVisible(false)
            v.imgCaptain:setVisible(false)
            v.imgBigRole:setVisible(false)
            v.imgEmpty:setVisible(true)
        end
    end
end

function KingWarTeamEditLayer:registerEvents()
	self.super.registerEvents(self)
    if self.registerEventCallFlag then
        return
    end
    ADD_ALERT_CLOSE_LISTENER(self,self.btnClose)
    ADD_ALERT_CLOSE_LISTENER(self,self.btnOK)
    -- self.btnOK:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onOKClickHandle))

    self.UpdateTeamInfoMsgCallBack = function (event)
        if self.registerEventCallFlag then
            self:showMyTeamInfo()
        end
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.UpdateTeamInfoMsgCallBack)
    self.registerEventCallFlag = true
end

function KingWarTeamEditLayer.onOKClickHandle(sender)
    
end

function KingWarTeamEditLayer.cellTouchBeganHandle(cell)
    local self = cell.logic
    print("cell.playerId = ",cell.playerId)
    if cell.playerId == 0 then
        return;
    end
    cell.isClick = true
    cell.isDrag = false
    self.isMove = false

    self.onLongTouch = function(event)
        if self.isMove == false then
            return;
        end

        local pos = cell:getTouchMovePos();
          
        local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());
      
        if (math.abs(v.x) < 100 or math.abs(v.y) < 60 )  then            

        else 
            self:removeLongTouchTimer();    
            if (v.x - v.y > -10) then
                cell.isDrag  = true;
            else
                cell.isDrag  = false;
            end
        end
        
    end

    self:removeLongTouchTimer();
    self.longTouchTimerId = TFDirector:addTimer(0.001, -1, nil, self.onLongTouch); 
end

function KingWarTeamEditLayer.cellTouchMovedHandle(cell)
    if cell.playerId == 0 then
        return;
    end    
    print("cell.playerId = ",cell.playerId)
    local self = cell.logic;
    self.isMove = true;
    
    local v = ccpSub(cell:getTouchStartPos(), cell:getTouchMovePos());

    local pos = cell:getTouchMovePos();

    if self.selectCussor == nil then
        self.chosePosIndex = cell.posIndex
        self:createSelectCussor(cell,pos);
    end

    if cell.isClick == true then
        return;
    end

    self:moveSelectCussor(cell,pos);
end

function KingWarTeamEditLayer.cellTouchEndedHandle(cell)
    if cell.playerId == 0 then
        return;
    end
    local self = cell.logic;
    if self.selectCussor then
        self.selectCussor:removeFromParentAndCleanup(true);
        self.selectCussor = nil;
    end
    self:removeLongTouchTimer();

    local pos = cell:getTouchEndPos();

    self:releaseSelectCussor(cell, pos);

    if self.currSpliteLine and (self.chosePosIndex ~= self.currSpliteLine) then
        local msg = {}
        msg[1] = self.myTeamId
        msg[2] = {}
        for i=1,3 do
            local info = self.teamMemberInfo[i]
            if info then
                msg[2][i] = info.playerId
            else
                msg[2][i] = 0
            end
        end
        local temp = msg[2][self.currSpliteLine]
        msg[2][self.currSpliteLine] = msg[2][self.chosePosIndex]
        msg[2][self.chosePosIndex] = temp

        KingOfWarManager:requestChangeTeamPos(msg)
    end
    self.currSpliteLine = nil
    -- self:showSplitLine(nil)
end

function KingWarTeamEditLayer:createSelectCussor(cell, pos)
    play_press()
    cell.isClick = false
    self.lastPoint = pos

    self.selectCussor = cell:clone()
    self.selectCussor:setAnchorPoint(ccp(0.5, 0.5))
    self.selectCussor:setPosition(pos);
    self:addChild(self.selectCussor);
    self.selectCussor:setZOrder(100);
    self.curIndex = cell.posIndex
end

function KingWarTeamEditLayer:moveSelectCussor(cell, pos)
    local v = ccpSub(pos, self.lastPoint);
    self.lastPoint = pos;
    local scp = ccpAdd(self.selectCussor:getPosition(), v);
    self.selectCussor:setPosition(scp);
    self.selectCussor:setVisible(true);

    self.currSpliteLine = self:getClosestSplitLine(scp)
    -- self:showSplitLine(self.currSpliteLine)
end

function KingWarTeamEditLayer:showSplitLine(index)
    index = index or 100
    for k,v in pairs(self.splitLine) do
        if index == k then
            v:setVisible(true)
        else
            v:setVisible(false)
        end
    end
end

function KingWarTeamEditLayer:getClosestSplitLine(pos)
    local ins_list = {}
    for i=1,3 do
        local img_di = TFDirector:getChildByPath(self.roleNode[i], "bg_role")
        local size = img_di:getContentSize()
        local pos1 = self.roleNode[i]:getParent():convertToWorldSpaceAR(self.roleNode[i]:getPosition())
        local pos2 = {}
        pos2.x = pos1.x + size.width/2
        pos2.y = pos1.y + size.height/2        
        local pos_dis = ccpSub(pos, pos2)
        local dis = math.sqrt( pos_dis.x * pos_dis.x + pos_dis.y * pos_dis.y )

        local inBoundary = false
        if pos.x < (pos2.x + size.width) and pos.x > (pos2.x - size.width)
            and pos.y < (pos2.y + size.height) and pos.y > (pos2.y - size.height) then
            inBoundary = true
        end
        ins_list[i] = {k = i, v = dis, isIn = inBoundary } 
    end

    table.sort(ins_list, function(a, b)
        return a.v < b.v
    end)
    if ins_list[1].isIn == false then
        return nil
    end
    return ins_list[1].k
end

function KingWarTeamEditLayer:releaseSelectCussor(cell,pos)
    
end

function KingWarTeamEditLayer:removeLongTouchTimer()
    if (self.longTouchTimerId) then
        TFDirector:removeTimer(self.longTouchTimerId);
        self.longTouchTimerId = nil;
    end
end

function KingWarTeamEditLayer:removeEvents()

    self.super.removeEvents(self)
    self.registerEventCallFlag = nil
    if self.UpdateTeamInfoMsgCallBack then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.UpdateTeamInfoMsgCallBack)
        self.UpdateTeamInfoMsgCallBack = nil
    end    
end

function KingWarTeamEditLayer:dispose()
	self.super.dispose(self)
end

return KingWarTeamEditLayer