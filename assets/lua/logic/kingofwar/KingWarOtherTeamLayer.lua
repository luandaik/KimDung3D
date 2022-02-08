
-- client side KingWarOtherTeamLayer.lua
--[[
 * @Description: 王者争霸-我的队伍
 ]]
-- script writer Happy.All
-- creation time 2016-11-2 12:07:18
local KingWarOtherTeamLayer = class("KingWarOtherTeamLayer",BaseLayer)


function KingWarOtherTeamLayer:ctor(data)
	self.super.ctor(self, data)
    -- print("data = ",data)
    self.myTeam = clone(data)
    self.myTeamName = self.myTeam.name
    local serverInfo = SaveManager:getServerInfo(self.myTeam.serverId) or {}
    self.serverName = serverInfo.name or ""
    self.teamMemberInfo = self.myTeam.member   
    table.sort(self.teamMemberInfo, function (a,b)
        return a.power > b.power
    end)


	self:init("lua.uiconfig_mango_new.crossarena.CrossArenaCheck")
end

function KingWarOtherTeamLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.teamMemberNode = {}
    for i=1,3 do
        local teamNode = TFDirector:getChildByPath(ui, "panel_role"..i)
        local info = {}
        info.playerNode = TFDirector:getChildByPath(teamNode, "bg_role")
        info.txtName = TFDirector:getChildByPath(info.playerNode, "txt_name")
        info.txtPower = TFDirector:getChildByPath(info.playerNode, "txt_zhanli")
        info.txtSeverName = TFDirector:getChildByPath(info.playerNode, "txt_fwq")
        info.imgCaptain = TFDirector:getChildByPath(info.playerNode, "img_dz")
        info.imgBigRole = TFDirector:getChildByPath(info.playerNode, "img_role")
        info.emptyNode = TFDirector:getChildByPath(teamNode, "img_empty")
        table.insert(self.teamMemberNode, info)
    end

    self:showMyTeamInfo()
end

function KingWarOtherTeamLayer:removeUI()
    self.super.removeUI(self)
end

function KingWarOtherTeamLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function KingWarOtherTeamLayer:refreshUI()
    
end

function KingWarOtherTeamLayer:showMyTeamInfo()
    for k,v in pairs(self.teamMemberNode) do
        local memberInfo = self.teamMemberInfo[tonumber(k)]
        if memberInfo then      
            local RoleIcon = RoleData:objectByID(memberInfo.useIcon)
            v.imgBigRole:setTexture(RoleIcon:getBigImagePath())
            v.imgBigRole:setVisible(true)
            Public:addInfoListen(v.imgBigRole,true,6,memberInfo.playerId,self.myTeam.serverId)
            v.txtName:setVisible(true)
            v.txtName:setText(memberInfo.name)
            v.txtPower:setVisible(true)
            v.txtPower:setText(stringUtils.format(localizable.common_CE, memberInfo.power))            
            if memberInfo.playerId == self.leaderId then
                v.imgCaptain:setVisible(true)
            else
                v.imgCaptain:setVisible(false)
            end
            v.emptyNode:setVisible(false)
            v.txtSeverName:setText(self.serverName)
        else
            v.txtName:setVisible(false)
            v.txtPower:setVisible(false)
            v.imgCaptain:setVisible(false)
            v.imgBigRole:setVisible(false)
            v.emptyNode:setVisible(true)
        end
    end
end

function KingWarOtherTeamLayer:registerEvents()
    self.super.registerEvents(self)   
end

function KingWarOtherTeamLayer:removeEvents()
    self.super.removeEvents(self)
end

function KingWarOtherTeamLayer:dispose()
    self.super.dispose(self)
end

return KingWarOtherTeamLayer