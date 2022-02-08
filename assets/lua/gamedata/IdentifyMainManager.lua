-- client side IdentifyMainManager.lua
--[[
 * @Description: 角色鉴定管理器
 ]]
-- script writer Happy.All
-- creation time 2016-10-25 11:10:59

local IdentifyMainManager = class("IdentifyMainManager")

function IdentifyMainManager:ctor(data)
	TFDirector:addProto(s2c.ROLE_AUTHENTICATE_RESPONES, self, self.roleIdentifyInfo)
end

function IdentifyMainManager:roleIdentifyInfo( event )
	self.identifyInfo = event.data

	print("self.identifyInfo = ",self.identifyInfo)
	local bestXiaKe = CardRoleManager:getRoleByGmid(self.identifyInfo.bestXiaKe)
	-- local bestXiaKe = RoleData:objectByID(self.identifyInfo.bestXiaKe)
	self.identifyInfo.bestXiaKe = bestXiaKe.name

	-- local teamLevel = self.identifyInfo.teamLevel
	-- self.identifyInfo.teamLevel = stringUtils.format(localizable.common_LV,teamLevel)

	local createTime = self.identifyInfo.createTime
	local createDate = GetCorrectDate("*t", createTime)
	self.identifyInfo.createTime = createDate.year .. "/" .. createDate.month .. "/"..createDate.day
	--玩家ID
	self.identifyInfo.playerId = "(ID:" .. MainPlayer:getPlayerId() .. ")"
	--玩家名字
	self.identifyInfo.playerName = MainPlayer:getPlayerName()
	--击败百分比
	local powerRank = self.identifyInfo.powerRank
	if powerRank > 200 or powerRank == 0 then
		powerRank = 200
	end
	self.identifyInfo.percent = 70+math.floor((200-powerRank)*15/100)

	hideLoading()

	self:openIdentifyLayer()
end

function IdentifyMainManager:openIdentifyLayer()
	local layer  = require("lua.logic.qiyu.IdentifyMainLayer"):new()
	AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
	AlertManager:show()
end

function IdentifyMainManager:requestRoleIdentifyMsg()
	TFDirector:send(c2s.ROLE_AUTHENTICATE_REQUEST,{})
	showLoading();

	-- local event = {}
	-- event.data = {}
	-- event.data.teamLevel = 99
	-- event.data.xiaKeCount = 10
	-- event.data.equipCount = 14
	-- event.data.serverName = "测试服务器"
	-- event.data.power = 1234567
	-- event.data.bestXiaKe = 1
	-- event.data.createTime = MainPlayer:getNowtime()
	-- event.data.redPacketCount = 12354
	-- event.data.powerRank = 5	
	-- event.data.heroRank = 4

	-- self:roleIdentifyInfo(event)
end

function IdentifyMainManager:checkShowBtn()

	if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID then
		return true
	else
		return true
	end
end

function IdentifyMainManager:getRoleDetails()
	return self.identifyInfo
end

function IdentifyMainManager:getRolePercentInfo()
	local powerRank = self.identifyInfo.powerRank
	if powerRank > 200 or powerRank == 0 then
		powerRank = 200
	end
	local percent = 70+math.floor((200-powerRank)*15/100)
	return percent
	-- 0.7+(200-本服战力排名)*0.0015
end

function IdentifyMainManager:getCreatePlayerTime()
	local createTime = self.identifyInfo.createTime
	local createDate = GetCorrectDate("*t", createTime)

	local createStr = createDate.year .. "/" .. createDate.month .. "/"..createDate.day
	return createStr
end


function IdentifyMainManager:getScreenShotPath(filename)
	local sdPath        = ""
    local sPackName     = ""
    local updatePath    = ""

    if CC_TARGET_PLATFORM == CC_PLATFORM_IOS then
        updatePath = CCFileUtils:sharedFileUtils():getWritablePath()
        updatePath = updatePath .. '../Library/'
        updatePath = updatePath .. "screenshot/"
    elseif CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID then
        sdPath      = TFDeviceInfo.getSDPath()  
        sPackName   = TFDeviceInfo.getPackageName()
        updatePath  = sdPath .."playmore/"
    else
    	updatePath = updatePath .. "../Library/screenshot/"
    end

    updatePath = updatePath .. filename
    return updatePath
end

function IdentifyMainManager:checkFileExist(szFullPath)
	if not szFullPath then return true end

	if szFullPath[#szFullPath] == "/" then
		return TFFileUtil:existFile(szFullPath)
	else
		local fileHandle = io.open(szFullPath,'r')
		if not fileHandle then
			return false
		else
			fileHandle:close()
		end

		return true
	end
end


function IdentifyMainManager:createDirIfNotExist(szPath)
	-- body
	local dir = string.match(szPath,".*/")
	if not dir then
		return false
	end

	if not self:checkFileExist(dir) then
		bCreateDir = TFFileUtil:createDir(dir)
		if not bCreateDir then
			return false
		end
	end

	return true
end

function IdentifyMainManager:ScreenShotHandle()
		
	local createDate = GetCorrectDate("*t", MainPlayer:getNowtime())
	local fileName = createDate.year .. "_" .. createDate.month .. "_".. createDate.day .. "_".. createDate.hour .. "_".. createDate.min .. "_".. createDate.sec .. ".png"
	
	local savePath = self:getScreenShotPath(fileName)
	if self:createDirIfNotExist(savePath) then
	 	local size = me.winSize
		local screen = CCRenderTexture:create(size.width, size.height)
		local scene = me.Director:getRunningScene()
		screen:begin()
		scene:visit()
		screen:endToLua()
		screen:saveToFile(savePath)
		toastMessage(localizable.ScreenShotTips)
	end
end

function IdentifyMainManager:getDataListShow()
	return self.dataList
end
return IdentifyMainManager:new()