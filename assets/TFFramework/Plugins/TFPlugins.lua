--[[
SDK代理类


]]

TFPlugins = {}

if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID then
    TFPlugins = require("TFFramework.Plugins.TFPluginsBase")
elseif CC_TARGET_PLATFORM == CC_PLATFORM_IOS then
    TFPlugins = require("TFFramework.Plugins.TFPluginsBase")
else
	TFPlugins = require('TFFramework.Plugins.win32.TFPluginsWin32')
end

TFPlugins.isUseObbDown = false

-- 如果手机 为母包则使用空的sdk
if CC_TARGET_PLATFORM ~= CC_PLATFORM_WIN32 then
	if TFPlugins.isPluginExist() == false then
		TFPlugins = require('TFFramework.Plugins.win32.TFPluginsWin32')
	end
end

-- 黑桃URL
local serverList_url = "http://103.142.139.36/server/lis.php"

-- win为测试环境
if CC_TARGET_PLATFORM == CC_PLATFORM_WIN32 then
	serverList_url = "http://103.142.139.36/server/lis.php"
end


if CC_TARGET_PLATFORM == CC_PLATFORM_IOS then
	serverList_url = "http://103.142.139.36/server/list.do"
end


if TFPlugins.isPluginExist() then
	serverList_url = serverList_url .. "?channel=" .. TFPlugins.getChannelId()
end

print("--- TFPlugins init ----- serverList_url = ", serverList_url)

-- 用户中心地址
TFPlugins.serverList_url = serverList_url

if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID then
    -- 江湖侠客令 安卓更新地址
    TFPlugins.versionPath = "http://103.142.139.36/jhhd/andorid_zjhhd/"
    TFPlugins.filePath    = "http://103.142.139.36/jhhd/andorid_zjhhd/source/"
    TFPlugins.zipCheckPath= "http://103.142.139.36/jhhd/andorid_zjhhd/"
    
elseif CC_TARGET_PLATFORM == CC_PLATFORM_IOS then
    -- 江湖侠客令 ios更新地址
    TFPlugins.versionPath = "http://103.142.139.36/jhhd/ios_zjhhd/"
    TFPlugins.filePath    = "http://103.142.139.36/jhhd/ios_zjhhd/source/"
    TFPlugins.zipCheckPath= "http://103.142.139.36/jhhd/ios_zjhhd/"
end

PackageManager:init("http://cdn.pic.jyqxz2015.com/mhqx/HD/")
TFPlugins.isCompletePack = true

return TFPlugins
  