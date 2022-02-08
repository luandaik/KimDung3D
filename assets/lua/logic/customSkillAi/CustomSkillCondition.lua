-- client side CustomSkillCondition.lua
--[[
 * @Description: 特殊条件选择
 ]]
-- script writer Happy.All
-- creation time 2016-06-22


local CustomSkillCondition = class("CustomSkillCondition",BaseLayer)

function CustomSkillCondition:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.SkillStrategy.SkillStrategyTSTJ")
end

function CustomSkillCondition:initUI( ui )

	self.super.initUI(self, ui)


    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")

    self.button = {}
    for i=1,3 do
        self.button[i] = {}
        self.button[i].btn = TFDirector:getChildByPath(ui, "btn_tiaojian"..i)
        self.button[i].btn.logic = self
        self.button[i].btn.idx = i
    end
end


function CustomSkillCondition:removeUI()
	self.super.removeUI(self)
end

function CustomSkillCondition:onShow()
    self.super.onShow(self)
end

function CustomSkillCondition:registerEvents()

    if self.registerEventCallFlag then
        return
    end
	self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    for i=1,3 do
        self.button[i].btn:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onButtonClick));
    end

    self.registerEventCallFlag = true 
end

function CustomSkillCondition:removeEvents()
    self.super.removeEvents(self)
    self.registerEventCallFlag = nil  
end

function CustomSkillCondition:dispose()
	self.super.dispose(self)
end

function CustomSkillCondition.onButtonClick(sender)
    local self = sender.logic;
    local idx = sender.idx
    TFFunction.call(self.clickCallBack,idx)
    AlertManager:close()
end

function CustomSkillCondition:setData( callback )
    self.clickCallBack = callback
end
return CustomSkillCondition