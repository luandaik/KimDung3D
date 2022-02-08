--[[
******帮派弹劾界面*******

	-- by sjj
	-- 2018/05/10
	
]]

local FactionTanHeLayer = class("FactionTanHeLayer",BaseLayer)

local titlePic = { "ui_new/faction/img_thly.png", "ui_new/faction/img_thly2.png" }
local Type_Impeachment = 1  --弹劾
local Type_Ballot = 2 		--投票
function FactionTanHeLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.FactionTanHe")
end

function FactionTanHeLayer:initUI( ui )

	self.super.initUI(self, ui)

	self.img_title = TFDirector:getChildByPath(ui, "img_wenben")
	self.btn_help = TFDirector:getChildByPath(ui, "btn_help")
	self.btn_close = TFDirector:getChildByPath(ui, "btn_close")

	self.btn_fqth = TFDirector:getChildByPath(ui, "btn_fqth")
	self.btn_fd = TFDirector:getChildByPath(ui, "btn_fd")
	self.btn_zt = TFDirector:getChildByPath(ui, "btn_zt")
	self.btn_zt.status = 1
	self.btn_fd.status = 2
	

	-- 输入框
	self.input_str = TFDirector:getChildByPath(ui, "playernameInput")
	self.input_str:setText("")
	-- self.input_str:setPlaceHolder("")
	self.txt_contect = TFDirector:getChildByPath(ui, 'txt_contect'); 

	self.content       = TFDirector:getChildByPath(ui, 'Panel_Content'); 
	self.input_pos_mark = self.content:getPosition()

	self.status = Type_Impeachment
	self:refreshUI()

end

function FactionTanHeLayer:setData( str, status )
	self.tanHeStr = str or ""
	self.status = status or Type_Impeachment --1:弹劾,2:投票
	self:refreshUI()
end

function FactionTanHeLayer:refreshUI()
	--1:弹劾,2:投票
	if (self.status == Type_Impeachment) then
		self.input_str:setCursorEnabled(true)

		self.btn_fqth:setVisible(true)
		self.btn_fd:setVisible(false)
		self.btn_zt:setVisible(false)
		

	elseif (self.status == Type_Ballot) then
		self.input_str:setCursorEnabled(false)
		-- self.input_str:setPlaceHolder(self.tanHeStr)
		self.btn_fqth:setVisible(false)
		self.btn_fd:setVisible(true)
		self.btn_zt:setVisible(true)
		self.txt_contect:setText(self.tanHeStr)

		self.input_str:removeMEListener(TFTEXTFIELD_TEXTCHANGE)
		self.input_str:removeMEListener(TFTEXTFIELD_ATTACH)
		self.input_str:removeMEListener(TFTEXTFIELD_DETACH)
	end

	self.img_title:setTexture(titlePic[self.status])
end


function FactionTanHeLayer:registerEvents()
	self.super.registerEvents(self)


	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close,AlertManager.TWEEN_NONE)

	self.btn_fqth:addMEListener(TFWIDGET_CLICK,  audioClickfunWithDelegate(self, self.onTanHeButtonClickHandle),1);
	self.btn_fd:addMEListener(TFWIDGET_CLICK,  audioClickfunWithDelegate(self, self.onBallotResultClickHandle),1);
	self.btn_zt:addMEListener(TFWIDGET_CLICK,  audioClickfunWithDelegate(self, self.onBallotResultClickHandle),1);
	self.btn_help:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onRuleClick))

	local function onTextFieldChangedHandle(input)
        -- self.content:setPosition(ccp(self.input_pos_mark.x,self.input_pos_mark.y+80))
        local text = self.input_str:getText()
		-- text = checkStrLength(text,40)
		self.input_str:setText(text)
		self.txt_contect:setText(text)
    end
    -- if (self.status == Type_Impeachment) then
	    --add
	    --添加输入账号时输入框上移逻辑
	    local function onTextFieldAttachHandle(input)
	        self.content:setPosition(ccp(self.input_pos_mark.x,self.input_pos_mark.y+80))
	        self.input_str:addMEListener(TFTEXTFIELD_TEXTCHANGE, onTextFieldChangedHandle)
	    end
	    self.input_str:addMEListener(TFTEXTFIELD_ATTACH, onTextFieldAttachHandle)

	    local function onTextFieldDetachHandle(input)
	        self.content:setPosition(ccp(self.input_pos_mark.x,self.input_pos_mark.y))

	        self.input_str:removeMEListener(TFTEXTFIELD_TEXTCHANGE)
	    end

	    self.input_str:addMEListener(TFTEXTFIELD_DETACH, onTextFieldDetachHandle)
	-- end
end
function FactionTanHeLayer:removeEvents()
	self.super.removeEvents(self)

end
--发起弹劾投票
function FactionTanHeLayer:onTanHeButtonClickHandle()
	local str = self.input_str:getText()
    print("发起弹劾投票",str)
    if (str == nil or str == "") then
    	toastMessage(localizable.factionMembers_tanhe_cause)
    	return
    end
	--local msg = "弹劾需要24小时,成功后将成为帮主,是否消耗500元宝进行弹劾？\n（失败后会全额返还）"
    local msg = localizable.factionMembers_taihe
    CommonManager:showOperateSureLayer(
        function()
        	if MainPlayer:getSycee() < 500 then
        		--toastMessage("元宝不够")
        		toastMessage(localizable.common_no_yuanbao)
        	else
            	FactionManager:requestTanHeAssistant(str)
            	AlertManager:closeLayer(self)
            end
        end,
        function()
            AlertManager:close()
        end,
        {
        --title = "弹劾",
        title = localizable.factionMembers_taihe_title,
        msg = msg,
        }
    )
end
--选择投票
function FactionTanHeLayer:onBallotResultClickHandle( btn )
	
	local statu = btn.status
	print("onBallotResultClickHandle",statu)
	FactionManager:requestTanHeBallot(statu)
	AlertManager:closeLayer(self)
end
function FactionTanHeLayer:onRuleClick( sender )
    CommonManager:showRuleLyaer('bangpaitanhe')
end


return FactionTanHeLayer