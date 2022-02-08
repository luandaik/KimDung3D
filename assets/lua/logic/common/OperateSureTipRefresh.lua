--[[
******操作确定层*******

    -- by zhengyugeng
    -- 2018/5/14
]]

local OperateSureTipRefresh = class("OperateSureTipRefresh", BaseLayer)

--CREATE_SCENE_FUN(OperateSureTip)
CREATE_PANEL_FUN(OperateSureTipRefresh)


function OperateSureTipRefresh:ctor(data)
    self.super.ctor(self,data)
end

function OperateSureTipRefresh:initUI(ui)
	self.super.initUI(self,ui)

    self.btn_ok             = TFDirector:getChildByPath(ui, 'btn_ok')
    self.btn_cancel         = TFDirector:getChildByPath(ui, 'btn_cancel')
    self.txt_message        = TFDirector:getChildByPath(ui, 'txt_message')
    self.txt_title          = TFDirector:getChildByPath(ui, 'txt_title')
    self.img_title          = TFDirector:getChildByPath(ui, 'img_title')
    self.img_title          = TFDirector:getChildByPath(ui, 'img_title')
    self.checkbox_tip          = TFDirector:getChildByPath(ui, 'CheckBox_Game_1')
    self.fresh_tips          = TFDirector:getChildByPath(ui, 'Label_Game_1')  
    self.fresh_time          = TFDirector:getChildByPath(ui, 'Label_Game_2')
    if self.fresh_time then
        self.fresh_time:setVisible(false)
    end
    self.Choicetext = nil     
    self.Unselectedtext = nil
end

function OperateSureTipRefresh:showFreshTip(tips )
    self.fresh_time:setVisible(true)
    self.fresh_time:setText(tips)
end

function OperateSureTipRefresh:removeUI()
	self.super.removeUI(self)

    self.btn_ok             = nil
    self.btn_cancel         = nil
end

function OperateSureTipRefresh:setData( data )
    self.data = data
end

function OperateSureTipRefresh:setUIConfig( uiconfig )
    self:init(uiconfig)
end

function OperateSureTipRefresh:setTitleImg( path )
    if self.img_title and path then
        self.img_title:setTexture(path)
    end
end

function OperateSureTipRefresh:setBtnOkText( text )
    if self.btn_ok and text then
        self.btn_ok:setText(text)
    end
end

function OperateSureTipRefresh:setBtnCancelText( text )
    if self.btn_cancel and text then
        self.btn_cancel:setText(text)
    end
end

function OperateSureTipRefresh:setTitle( title )
    if self.txt_title and title then
        self.txt_title:setText(title)
    end
end

function OperateSureTipRefresh:setfresh_tips( text )
    if self.fresh_tips and text then
        self.fresh_tips:setText(text)
    end
end
function OperateSureTipRefresh:setMsg( msg )
    if self.txt_message and msg then
        self.txt_message:setText(msg)
    end
end

function OperateSureTipRefresh:setBtnHandle(okhandle, cancelhandle)
    if self.btn_ok then
        self.btn_ok.logic       = self
        self.btn_ok:addMEListener(TFWIDGET_CLICK,audioClickfun(function()
            local data = self.data;
            AlertManager:close()
            okhandle(data,self.checkbox_tip)
        end),1)
    end
    if self.btn_cancel then
        self.btn_cancel.logic   = self
        if cancelhandle then
            self.btn_cancel:addMEListener(TFWIDGET_CLICK, audioClickfun(function()
                cancelhandle(self.data,self.checkbox_tip)
            end),1)
        else
            self.btn_cancel:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCancelBtnClickHandle),1)
        end
    end
    if self.checkbox_tip then
        self.checkbox_tip.logic   = self
        self.checkbox_tip:addMEListener(TFWIDGET_CLICK,audioClickfun(function()
            if self.checkbox_tip:getSelectedState() == true and self.Unselectedtext then
                self.txt_message:setText(self.Unselectedtext)
            elseif self.checkbox_tip:getSelectedState() == false and self.Choicetext then
                self.txt_message:setText(self.Choicetext)
           end
        end),1)
    end
end

function OperateSureTipRefresh.onCancelBtnClickHandle(sender)
    AlertManager:close(AlertManager.TWEEN_1);
end

function OperateSureTipRefresh:registerEvents()
    self.super.registerEvents(self)
end


return OperateSureTipRefresh
