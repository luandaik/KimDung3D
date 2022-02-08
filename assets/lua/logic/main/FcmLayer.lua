--[[
    防沉迷界面
    by luoconghai
    time 2017/05/23
]]

local FcmLayer = class("FcmLayer",BaseLayer)

function FcmLayer:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.main.FangChenMi")
end

function FcmLayer:initUI( ui )

	self.super.initUI(self, ui)

	self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
	self.btn_renzheng = TFDirector:getChildByPath(ui, "btn_renzheng")
	self.btn_lingjiang = TFDirector:getChildByPath(ui, "btn_lingjiang")
	self.btn_shuaxin = TFDirector:getChildByPath(ui, "btn_shuaxin")
	self.img_rz = TFDirector:getChildByPath(ui, "txt_zhuangtai")
	self.img_sy = TFDirector:getChildByPath(ui, "img_zhuangtai")
	self.txt_number = TFDirector:getChildByPath(ui, "txt_number")
	self.btn_list = {}
	local datalist = {
		{type= EnumDropType.SYCEE,id = 0},
		{type= EnumDropType.COIN,id = 0},
		{type= EnumDropType.GOODS,id = 30136},
	}
	for i=1,3 do
		self.btn_list[1] = TFDirector:getChildByPath(ui, "btn_iconbg" .. i)
		function onClick( sender )
          Public:ShowItemTipLayer(datalist[i].id, datalist[i].type);
        end
        self.btn_list[1]:addMEListener(TFWIDGET_CLICK, audioClickfun(onClick));
	end
	self.txt_number:setText("")
end

function FcmLayer:removeUI()
	if self.isDoAnti == true then
		if HeitaoSdk and HeitaoSdk.requestAntiInfo then
            HeitaoSdk.requestAntiInfo()
        end
	end
	self.super.removeUI(self)
end

function FcmLayer:onShow()
	self.super.onShow(self)
	self:refreshUI()
end

function FcmLayer:registerEvents()
	self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
	self.btn_renzheng:addMEListener(TFWIDGET_CLICK, audioClickfun(self.rezhenClick))  
	self.btn_renzheng.logic = self
	self.btn_lingjiang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.getRewardClick))
	self.btn_lingjiang.logic = self
	self.btn_shuaxin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.brushClick))
	self.btn_shuaxin.logic = self

	self.updateTimerID = nil
	if SettingManager.AntiaddictionCode and SettingManager.AntiaddictionCode > SettingManager.AntiCode_Adult then
		self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
	        function()
	            self:refreshTimer()
	        end)
	end

	self.refreshAntiCode = function(event)
        self:refreshUI()
    end
	TFDirector:addMEGlobalListener(SettingManager.GET_ANTI_CODE_BY_SDK ,self.refreshAntiCode)
end

function FcmLayer:removeEvents()
	if self.updateTimerID ~= nil then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    TFDirector:removeMEGlobalListener(SettingManager.GET_ANTI_CODE_BY_SDK ,self.refreshAntiCode)
    self.super.removeEvents(self)
end

function FcmLayer:refreshUI()
	self:refreshTimer()
	if ( SettingManager.AntiaddictionCode and SettingManager.AntiaddictionCode > SettingManager.AntiCode_Adult ) or SettingManager.getReward == 1 then
		self.btn_lingjiang:setTouchEnabled(false)
		self.btn_lingjiang:setGrayEnabled(true)
	else
		self.btn_lingjiang:setTouchEnabled(true)
		self.btn_lingjiang:setGrayEnabled(false)
	end

	if SettingManager.AntiaddictionCode == SettingManager.AntiCode_None then
		self.btn_renzheng:setVisible(true)
		self.img_rz:setTexture("ui_new/main/txt_weirenzheng.png")
	else
		self.btn_renzheng:setVisible(false)
		self.img_rz:setTexture("ui_new/main/txt_yirenzheng.png")
	end
	local pathsy = "ui_new/main/txt_zhengchangshouyi.png"
	if SettingManager.AntiaddictionCode and SettingManager.AntiaddictionCode > SettingManager.AntiCode_Adult then
		local totalSec = SettingManager:getTotalSec()
		if totalSec >= 3 * 3600 and totalSec < 5 * 3600 then
			pathsy = "ui_new/main/txt_shouyihalf.png"
		elseif totalSec >= 5 * 3600 then
			pathsy = "ui_new/main/txt_noshouyi.png"
		end
	end
	self.img_sy:setTexture(pathsy)
end

function FcmLayer:refreshTimer()
	local totalSec = SettingManager:getTotalSec()
	
	local hour = math.floor(totalSec/3600)
    totalSec = totalSec - hour * 3600
    local min = math.floor(totalSec/60)
    local sec = math.floor(totalSec - min * 60)

    self.txt_number:setText(string.format("%02d:%02d:%02d",hour,min,sec))
end

function FcmLayer.rezhenClick(btn)
	local self = btn.logic
	if HeitaoSdk and HeitaoSdk.setAntiInfo then
		HeitaoSdk.setAntiInfo()
		self.isDoAnti = true
	else
    	toastMessage(stringUtils.format(localizable.Anti_Tip_NoSdk))
	end
end

function FcmLayer.getRewardClick(btn)
	local self = btn.logic
	SettingManager:requestAntiReward()
end

function FcmLayer.brushClick(btn)
	local self = btn.logic
	if HeitaoSdk and HeitaoSdk.requestAntiInfo then
		self.isDoAnti = false
        HeitaoSdk.requestAntiInfo()
    else
    	toastMessage(stringUtils.format(localizable.Anti_Tip_NoSdk))
    end
end
return FcmLayer