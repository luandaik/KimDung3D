--自动化测试

local AutoTestManager = class("AutoTestManager")
AutoTestManager.isAutoTest        = ENABLE_DEBUG_FOR_AUTO_TEST or false  --自动化测试
function AutoTestManager:ctor()
	if CC_TARGET_PLATFORM ~= CC_PLATFORM_WIN32 then
		AutoTestManager.isAutoTest = false
	end
end 
function AutoTestManager:restart()
	if CC_TARGET_PLATFORM ~= CC_PLATFORM_WIN32 then
		AutoTestManager.isAutoTest = false
	end
end

function AutoTestManager:registerEvents() 
	TFDirector:addProto(s2c.ADVERTISE_PRIORITY, self, self.onReceiveAdvertisePriority);
end

function AutoTestManager:addAutoTestName( node, str )
	if (AutoTestManager.isAutoTest) then
		if (node and node.setName and str and str ~= "") then
			node:setName(str)
		end
	end
end

function AutoTestManager:sendAutoTestmsg(tips, msg)
	if (AutoTestManager.isAutoTest) and me.console and me.console.serialize then
		local str = me.console.serialize(msg)
		self:send("0x3f2",tips..":"..str)
	end
end

function AutoTestManager:autoFight( fightmsg,istiaoguo )
	FightManager:FightBeginMsgHandle( fightmsg )
	FightManager.isTiaoGuo = istiaoguo or true
end

function AutoTestManager:send(protoId,msg)
	if (AutoTestManager.isAutoTest) then
		if (me.console and me.console.reProto) then
			me.console.reProto(protoId,msg)
		else
			print("AutoTestManager no have me.console.reProto function")
		end
	end
end
function AutoTestManager:initFightLog()
	if (AutoTestManager.isAutoTest) then
		self.fightLog = nil
	end
end
function AutoTestManager:addFightLog(file_name, ...)
	if (AutoTestManager.isAutoTest) then
		self.fightLog = self.fightLog or {}
		self.fightLog[file_name] = self.fightLog[file_name] or {}
		local addStr = ""
		if (file_name == EnumFight_Log.HP or file_name == EnumFight_Log.BUFF) then
			local date 		= os.date("*t", os.time())
			addStr 	= "["..date.month.."/"..date.day .."/"..date.hour..":"..date.min..":"..date.sec.." - "..os.clock().."] "
		end
		local arg = {...}
		local ret = ''
		for k, v in pairs(arg) do
			local str = serialize(v)
			ret = ret .. ' ' .. str
		end
		ret = string.gsub(ret, "\n", "China_NO1")
		table.insert( self.fightLog[file_name], {addStr, ret})
	end
end
function AutoTestManager:sendFightLog()
	if (AutoTestManager.isAutoTest and self.fightLog and me.console) then
		for file_name,v in pairs(self.fightLog) do
			local str = me.console.serialize(v)
			self:sendAutoTestmsg("file_"..file_name, str)
		end
		self.fightLog = nil
	end
end
return AutoTestManager:new();
