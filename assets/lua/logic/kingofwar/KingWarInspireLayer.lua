
-- client side KingWarInspireLayer.lua
--[[
 * @Description: 王者争霸-鼓舞
 ]]
-- script writer Happy.All
-- creation time 2016-11-2 12:07:18
local KingWarInspireLayer = class("KingWarInspireLayer",BaseLayer)


function KingWarInspireLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossarena.CrossArenaInspire")
end

function KingWarInspireLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.btnClose = TFDirector:getChildByPath(ui, "btn_fanhui")
    
    local teanNameNode = TFDirector:getChildByPath(ui, "txt_cishu")    
    self.txtTotalTimes = TFDirector:getChildByPath(teanNameNode, "txt_num")

    self.teamMemberNode = {}
    for i=1,3 do
        local teamNode = TFDirector:getChildByPath(ui, "panel_role"..i)
        local info = {}
        info.playerNode = TFDirector:getChildByPath(teamNode, "bg_1")
        info.playerNode:setVisible(false)
        info.txtName = TFDirector:getChildByPath(info.playerNode, "txt_name")
        info.txtPower = TFDirector:getChildByPath(info.playerNode, "txt_zhanli")
        info.txtAttr = TFDirector:getChildByPath(info.playerNode, "txt_sx")
        info.txtTips = TFDirector:getChildByPath(info.playerNode, "txt_tips")
        info.imgCaptain = TFDirector:getChildByPath(info.playerNode, "img_dz")

        info.imgBigRole = TFDirector:getChildByPath(info.playerNode, "img_role")

        info.emptyNode = TFDirector:getChildByPath(teamNode, "bg_empty")
        info.emptyNode:setVisible(true)

        local panel_gw = TFDirector:getChildByPath(teamNode, "panel_gw")
        info.btnInspire = TFDirector:getChildByPath(panel_gw, "btn_inspire2")
        info.txtScyee = TFDirector:getChildByPath(panel_gw, "txt_num2")
        info.txtEffect = TFDirector:getChildByPath(panel_gw, "txt_effect2")
        table.insert(self.teamMemberNode, info)
    end

    self:showMyTeamInfo()
end

function KingWarInspireLayer:removeUI()
	self.super.removeUI(self)
end

function KingWarInspireLayer:onShow()
    self.super.onShow(self)
end

function KingWarInspireLayer:registerEvents()

    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btnClose)
    
    self.UpdateTeamInfoMsgCallBack = function (event)
        if self.effectNode then
            if self.effectNode.effect == nil then
                TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equipment_refining.xml")
                local effect = TFArmature:create("equipment_refining_anim")
                effect:setAnimationFps(GameConfig.ANIM_FPS)
                effect:setScaleX(0.4)
                effect:setPosition(ccp(-20,140))
                self.effectNode:addChild(effect,100)
                self.effectNode.effect = effect
                
            end
            self.effectNode.effect:playByIndex(0,-1,-1,0)
            self.effectNode = nil
        end
        self:showMyTeamInfo()
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.UpdateTeamInfoMsgCallBack)

    self.registerEventCallFlag = true 
end

function KingWarInspireLayer:removeEvents()

    self.super.removeEvents(self)

    if self.UpdateTeamInfoMsgCallBack then
        TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.UpdateTeamInfoMsgCallBack)
        self.UpdateTeamInfoMsgCallBack = nil
    end
    
    self.registerEventCallFlag = nil  
end

function KingWarInspireLayer:dispose()
	self.super.dispose(self)

end

function KingWarInspireLayer:showMyTeamInfo()
    local myTeam = KingOfWarManager:getTeamInfo()
    if myTeam == nil or myTeam.team == nil then
        print("team info not exist!!!")
        return
    end
    self.myTeamId = myTeam.team.id
    self.leaderId = myTeam.team.leader
    local totalInspire = 0
    self.teamMemberInfo = {}
    if myTeam.team.member then
        for _,v in pairs(myTeam.team.member) do   
            local position = tonumber(v.position)
            self.teamMemberInfo[position] = v
            totalInspire = totalInspire + v.inspireNum
        end
    end

    local needSycee = 0
    if totalInspire >= 30 then
        totalInspire = 30
        needSycee = ContestInspireConfig:objectByID(30).need_res
    else
        needSycee = ContestInspireConfig:objectByID(totalInspire+1).need_res
    end

    self.txtTotalTimes:setText(totalInspire .. "/30")
    for k,v in pairs(self.teamMemberNode) do
        local memberInfo = self.teamMemberInfo[tonumber(k)]
        if memberInfo then
            v.playerNode:setVisible(true)
            v.emptyNode:setVisible(false)
            v.txtName:setText(memberInfo.name)
            local RoleIcon = RoleData:objectByID(memberInfo.useIcon)
            v.imgBigRole:setTexture(RoleIcon:getBigImagePath())
            v.imgBigRole:setVisible(true)
            v.txtPower:setText(stringUtils.format(localizable.common_CE, memberInfo.power))
            local addAttr = 0
            local nextAttr = 0
            if memberInfo.inspireNum and memberInfo.inspireNum > 0 then
                addAttr = ContestInspireConfig:objectByID(memberInfo.inspireNum):getTotalAddAttr()
                nextAttr = ContestInspireConfig:objectByID(2):getTotalAddAttr() - ContestInspireConfig:objectByID(1):getTotalAddAttr()
            end
            v.txtAttr:setText(stringUtils.format(localizable.KingWarInspireAddAttr, addAttr))            
            local sycee = memberInfo.inspireSycee or 0
            v.txtTips:setText(stringUtils.format(localizable.KingWarInspireSycee, sycee))
            v.txtTips:setVisible(true)
            if memberInfo.playerId == self.leaderId then
                v.imgCaptain:setVisible(true)
            else
                v.imgCaptain:setVisible(false)
            end
            v.btnInspire:setVisible(true)
            v.btnInspire.playerId = memberInfo.playerId
            v.btnInspire.needSycee = needSycee
            v.btnInspire.myTeamId = self.myTeamId
            v.btnInspire.logic = self
            v.btnInspire:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnInspireClick))
            v.txtScyee:setText(needSycee)
            v.txtEffect:setText(nextAttr .. "%")
        else
            --没有玩家
            v.btnInspire:setVisible(false)
            v.playerNode:setVisible(false)
            v.emptyNode:setVisible(true)
            v.txtAttr:setVisible(false)
            v.txtTips:setVisible(false)
        end
    end
end

function KingWarInspireLayer.onBtnInspireClick( btn )
    local self = btn.logic
    self.effectNode = btn    
    KingOfWarManager:requestInspireTeam(btn.myTeamId, btn.playerId, btn.needSycee)
end
return KingWarInspireLayer