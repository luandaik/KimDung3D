-- client side KingWarCreateTeamLayer.lua
--[[
 * @Description: 创建队伍
 ]]
-- script writer Happy.All
-- creation time 2016-11-3 18:13:36

local KingWarCreateTeamLayer = class("KingWarCreateTeamLayer",BaseLayer)

function KingWarCreateTeamLayer:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.crossarena.CreateTeam")
end

function KingWarCreateTeamLayer:initUI( ui )

	self.super.initUI(self, ui)


    self.btn_ok = TFDirector:getChildByPath(ui, "btn_ok")
    self.btn_ok.logic = self
    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.btn_close.logic = self

    self.playernameInput = TFDirector:getChildByPath(ui, 'playernameInput')
	self.playernameInput:setCursorEnabled(true)
	self.playernameInput:setVisible(true)
    
    self.needSycee = ConstantData:objectByID("ContestCreatATeamNeed").value or 400
    self.txtYb = TFDirector:getChildByPath(ui, "LabelBMFont_yb")
    self.txtYb:setText(self.needSycee)
    self.txt_YbRed = TFDirector:getChildByPath(ui, "txt_YbRed")
    self.txt_YbRed:setText(self.needSycee)

        
    if MainPlayer:getSycee() < self.needSycee then
        self.txt_YbRed:setVisible(true)
        self.txtYb:setVisible(false)
    else
        self.txt_YbRed:setVisible(false)
        self.txtYb:setVisible(true)
    end
end

function KingWarCreateTeamLayer:removeUI()
	self.super.removeUI(self)
end


function KingWarCreateTeamLayer:onShow()
    self.super.onShow(self)
end

function KingWarCreateTeamLayer:registerEvents()

	self.super.registerEvents(self)


	--local pos = self.playernameInputbg:getPosition()
	--添加输入账号时输入框上移逻辑
	local function onTextFieldAttachHandle(input)
        --self.playernameInputbg:setPosition(ccp(pos.x,440))
    end    
    self.playernameInput:addMEListener(TFTEXTFIELD_ATTACH, onTextFieldAttachHandle)
    local function onTextFieldChangedHandle(input)
		
    end
    self.playernameInput:addMEListener(TFTEXTFIELD_TEXTCHANGE, onTextFieldChangedHandle)
    local function onTextFieldDetachHandle(input)
        --self.playernameInputbg:setPosition(ccp(pos.x, pos.y))
        self.playernameInput:closeIME()
    end
    self.playernameInput:addMEListener(TFTEXTFIELD_DETACH, onTextFieldDetachHandle)
    self.playernameInput:setMaxLengthEnabled(true)
    self.playernameInput:setMaxLength(10)

    local function spaceAreaClick(sender)
    	--self.playernameInputbg:setPosition(ccp(pos.x, pos.y))
    	self.playernameInput:closeIME()
	end
    self.ui:setTouchEnabled(true)
    self.ui:addMEListener(TFWIDGET_CLICK, spaceAreaClick)
    ADD_KEYBOARD_CLOSE_LISTENER(self, self.ui)

    self.btn_ok:addMEListener(TFWIDGET_CLICK, audioClickfun(self.createButtonClick))
    self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.closeButtonClick))
end

function KingWarCreateTeamLayer:removeEvents()

    self.playernameInput:removeMEListener(TFTEXTFIELD_ATTACH)
    self.playernameInput:removeMEListener(TFTEXTFIELD_TEXTCHANGE)
    self.playernameInput:removeMEListener(TFTEXTFIELD_DETACH)
    if self.ui then
        self.ui:removeMEListener(TFWIDGET_CLICK)
    end

    self.btn_ok:removeMEListener(TFWIDGET_CLICK)
    self.btn_close:removeMEListener(TFWIDGET_CLICK)

    self.super.removeEvents(self)
end

function KingWarCreateTeamLayer:dispose()
    self.super.dispose(self)
end


function KingWarCreateTeamLayer.createButtonClick(btn)
	
	local self = btn.logic

	local teamName = self.playernameInput:getText()
	if string.len(teamName) < 1 then
        --toastMessage("请输入帮派名称")
		toastMessage(localizable.KingWarCreatTeamInput)
		return
	end

    if MainPlayer:getSycee() < self.needSycee then
        --toastMessage("元宝不够")
        toastMessage(localizable.common_no_yuanbao)
        return
    end

    local  msg = stringUtils.format(localizable.KingWarCreateTeam1,self.needSycee,teamName)
    CommonManager:showOperateSureLayer(
        function()
            AlertManager:close()
            KingOfWarManager:requestJoinTeam(1, teamName)
        end,
        function()
            AlertManager:close()
        end,
        {
            title = localizable.KingWarCreateTeam2,
            msg = msg,
            showtype = AlertManager.BLOCK_AND_GRAY,
        }
    )
end

function KingWarCreateTeamLayer.closeButtonClick(btn)	
	local self = btn.logic
	AlertManager:close()	
end

return KingWarCreateTeamLayer