local ActivityTipManager = class("ActivityTipManager")

local eventNoticeData=require("lua.table.t_s_event_noticement")

function ActivityTipManager:ctor()
	self.eventNoticeList={}
	self:sortByStatus()
	self.tipNumber=1
	self.isCanTip=true
	self.isFristTime=false
	self.isRewardTaskShow_10=false--完成10个和20个任务之后显示一次
	self.isRewardTaskShow_20=false
end

function ActivityTipManager:getRventNoticeList()
	return self.eventNoticeList
end

function ActivityTipManager:getMostRventNotice()
	return self.eventNoticeList[1]
end

function ActivityTipManager:getIsRedPont()
	return not self.isFristTime
end

function ActivityTipManager:goLyerByType(data)
	if data.gotoType==1 then--武林
		self:goLyerType_1(data)
	elseif data.gotoType==2 then--奇遇
		self:goLyerType_2(data)
	else
		self:goLyerType_3(data)--挑战
	end
end

function ActivityTipManager:restart()
	self.eventNoticeList={}
	self:sortByStatus()
	self.tipNumber=1
	self.isCanTip=true
	self.isFristTime=false
	self.isRewardTaskShow_10=false--完成10个和20个任务之后显示一次
	self.isRewardTaskShow_20=false
end


function ActivityTipManager:goLyerType_1(data)
	WulinManager:showLayer(data.LayerId)
end

function ActivityTipManager:goLyerType_2(data)
	QiyuManager:OpenHomeLayer()
end

function ActivityTipManager:goLyerType_3(data)
	ActivityManager:showLayer(data.LayerId)
end

function ActivityTipManager:sortByStatus()
	self.eventNoticeList={}
	local date 	= os.date("*t", os.time())
	for v in eventNoticeData:iterator() do
		local tableTimeBegin={}
		local tableTimeEnd={}
		local time={'hour','min','sec'}
		local status=nil
		local tableTimeBegin_=string.split(v.timeBegin, ':' )
		local tableTimeEnd_=string.split(v.timeEnd, ':' )
		for i=1,3 do
			if tonumber(tableTimeBegin_[i]) then
				tableTimeBegin[time[i]]=tonumber(tableTimeBegin_[i])
			else
				tableTimeBegin[time[i]]=0
			end
			if tonumber(tableTimeEnd_[i]) then
				tableTimeEnd[time[i]]=tonumber(tableTimeEnd_[i])
			else
				tableTimeEnd[time[i]]=0
			end
		end
		local week=nil
		if v.week+1>7 then
			week=(v.week+1)%7
		else
			week=v.week+1
		end
		
		if week==date.wday then--星期几一样了
			if date.hour==tableTimeBegin.hour then
				if date.min>=tableTimeBegin.min then
					status=1
				else
					status=2
				end
			elseif date.hour==tableTimeEnd.hour then
				if date.min<=tableTimeEnd.min then
					status=1
				else
					status=3
				end
			elseif date.hour>tableTimeBegin.hour  and date.hour<=tableTimeEnd.hour then--小时
				status=1
			elseif date.hour<tableTimeBegin.hour then
				status=2
			elseif date.hour>tableTimeEnd.hour then
				status=3
			end
		else
			if week==1 then--星期天
				status=2--未开放
			elseif week>date.wday then
				status=2--未开放
			elseif week<date.wday  then
				status=3--已结束
			end
		end
		v.status=status
		v.TimeBegin=tableTimeBegin_
		v.TimeEnd=tableTimeEnd_
		self.eventNoticeList[#self.eventNoticeList+1]=v
	end

	local function sortByStatus(v1, v2)
        if v1.status~=v2.status then
            return v1.status < v2.status
        elseif v1.week~=v2.week then
            return v1.week < v2.week
        elseif v1.TimeBegin[1]~=v2.TimeBegin[1] then
            return v1.TimeBegin[1] < v2.TimeBegin[1]
        elseif v1.TimeBegin[2] ~= v2.TimeBegin[2] then
        	return v1.TimeBegin[2] < v2.TimeBegin[2]
    	elseif v1.TimeEnd[1]~=v2.TimeEnd[1] then
            return v1.TimeEnd[1] < v2.TimeEnd[1]
        elseif v1.TimeEnd[2] ~= v2.TimeEnd[2] then
        	return v1.TimeEnd[2] < v2.TimeEnd[2]
        end
    end
    table.sort( self.eventNoticeList, sortByStatus)
end



return ActivityTipManager:new()