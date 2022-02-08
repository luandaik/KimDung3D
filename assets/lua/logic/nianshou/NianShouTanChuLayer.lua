--[[
******赶走年兽弹出界面*******
	-- by Catcher
	-- 2018/1/15
]]

local NianShouTanChuLayer = class("NianShouTanChuLayer", BaseLayer)

function NianShouTanChuLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.nianshou.NianShouTanChu")
end

function NianShouTanChuLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.img_bg     = TFDirector:getChildByPath(ui, "img_bg")
    self.closeBtn     = TFDirector:getChildByPath(ui, "btn_ok")

    self.img_guang  = TFDirector:getChildByPath(ui, "img_guang")

    self.role_1     = TFDirector:getChildByPath(self.img_bg, "role_1")
    self.role_head  = TFDirector:getChildByPath(self.role_1, "role_head")
    self.txt_time   = TFDirector:getChildByPath(self.role_1, "txt_time")

    self.txt_tishi  = TFDirector:getChildByPath(self.img_bg, "txt_tishi")

    self.txt_juli   = TFDirector:getChildByPath(self.img_bg, "txt_juli")
    self.txt_num_juli   = TFDirector:getChildByPath(self.txt_juli, "txt_num_juli")
end

-- 加载年兽相关信息
function NianShouTanChuLayer:setInfo(data)
    self.type = data.flag
    local txt_Tips;
    if data.flag == NianShouManager.BeastStage_1 then
        txt_Tips = stringUtils.format(localizable.Nainshou_tips1,data.showName)
    elseif data.flag == NianShouManager.BeastStage_2 then
        self.img_guang:setVisible(false)
        if data.round == 2 then
            txt_Tips = stringUtils.format(localizable.Nainshou_tips2,data.showName)
        elseif data.round == 3 then 
            txt_Tips = stringUtils.format(localizable.Nainshou_tips3,data.showName)
        end
    elseif data.flag == NianShouManager.BeastStage_3 then
        txt_Tips = localizable.Nainshou_tips4 
        local Pos = self.txt_tishi:getPosition()
        self.txt_tishi:setPosition(ccp(Pos.x + 110,Pos.y - 30))
        self.role_1:setVisible(false)
        self.txt_juli:setVisible(false)
    end
    
    local richtextHB = Public:createRichtextHB(self.txt_tishi,nil,nil,nil,true)
    richtextHB:setText(stringUtils.richText3(txt_Tips))
    richtextHB:setVisible(true)

    if self.role_1:isVisible() then
        if data.path == nil then
            local role = RoleData:objectByID(data.showIcon)
            local path
            if role then
                path = role:getIconPath()
            end
            data.path = path
        end
        self.role_head:setTexture(data.path)
    end
    if self.txt_juli:isVisible() then
        self.leftTime = data.refreshTime/1000 + 3600 - MainPlayer:getNowtime()
        if self.leftTime > 0 then
            local hour,min,sec
            hour = math.floor(self.leftTime/3600)
            min = math.floor((self.leftTime - hour * 3600)/60)
            sec = math.fmod(self.leftTime, 60)
            self.txt_num_juli:setText(string.format("%02d:%02d:%02d",hour,min,sec))

            if self.addTimer then
                TFDirector:removeTimer(self.addTimer)
                self.addTimer = nil
            end
    
            self.addTimer = TFDirector:addTimer(1000, -1, nil, 
            function() 
                self:refreshTime()
            end)
        else
            self.txt_num_juli:setText(string.format("%02d:%02d:%02d",0,0,0))
        end
    end
end

-- 刷新时间
function NianShouTanChuLayer:refreshTime()
    if self.leftTime and self.leftTime > 0 then
        self.leftTime = self.leftTime -1 
        local hour,min,sec
        hour,min= math.modf(self.leftTime/(60*60))
        min,sec= math.modf(min*60)
        sec = math.floor(sec*60)
        self.txt_num_juli:setText(string.format("%02d:%02d:%02d",hour,min,sec))
    else
        self.txt_num_juli:setText(string.format("%02d:%02d:%02d",0,0,0))
        if self.addItemTimer then
            TFDirector:removeTimer(self.addItemTimer)
            self.addItemTimer = nil
        end
    end
end

--注册事件
function NianShouTanChuLayer:registerEvents()
    self.super.registerEvents(self);
    
    ADD_ALERT_CLOSE_LISTENER(self, self.closeBtn);
end

--注销事件
function NianShouTanChuLayer:removeEvents()
    self.super.removeEvents(self)

    if self.addTimer then
        TFDirector:removeTimer(self.addTimer)
	    self.addTimer = nil
    end
end

function NianShouTanChuLayer:removeUI()
    self.super.removeUI(self)
    if self.type ~= NianShouManager.BeastStage_2 then
        NianShouManager:refreshNianShouMainLayer()
    end
end

function NianShouTanChuLayer.closeBtnClickHandle(sender)
    AlertManager:close(AlertManager.TWEEN_1);
end

return NianShouTanChuLayer