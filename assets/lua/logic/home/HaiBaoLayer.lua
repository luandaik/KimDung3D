--	采纳海报
-- fei
--　　　　　　　　┏┓　　　┏┓+ +
--　　　　　　　┏┛┻━━━┛┻┓ + +
--　　　　　　　┃　　　　　　　┃ 　
--　　　　　　　┃　　　━　　　┃ ++ + + +
--　　　　　　 ████━████ ┃+
--　　　　　　　┃　　　　　　　┃ +
--　　　　　　　┃　　　┻　　　┃
--　　　　　　　┃　　　　　　　┃ + +
--　　　　　　　┗━┓　　　┏━┛
--　　　　　　　　　┃　　　┃　　　　　　
--　　　　　　　　　┃　　　┃ + + + +
--　　　　　　　　　┃　　　┃　　　　　　
--　　　　　　　　　┃　　　┃ + 　　　　神兽保佑,代码无bug　　
--　　　　　　　　　┃　　　┃
--　　　　　　　　　┃　　　┃　　+　　　　　　　　
--　　　　　　　　　┃　 　　┗━━━┓ + +
--　　　　　　　　　┃ 　　　　　　　┣┓
--　　　　　　　　　┃ 　　　　　　　┏┛
--　　　　　　　　　┗┓┓┏━┳┓┏┛ + + + +
--　　　　　　　　　　┃┫┫　┃┫┫
--　　　　　　　　　　┗┻┛　┗┻┛+ + + +
--
-- Date: 2017-04-19
--
local CommitPosterData  = require('lua.table.t_s_commit_poster')
local HaiBaoLayer = class("HaiBaoLayer", BaseLayer);

function HaiBaoLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.main.haibao");
end

function HaiBaoLayer:initUI(ui)  
    self.super.initUI(self,ui);
    self.ui  = ui
    self.btn_close   = TFDirector:getChildByPath(ui, 'btn_close');
    for i = 1, 9 do
        local Panel_haibao   = TFDirector:getChildByPath(ui, 'Panel_haibao_'..i);
        local data = CommitPosterData:objectByID(i)
        if (Panel_haibao and data) then
            Panel_haibao:setVisible(true)
            local txt_time = TFDirector:getChildByPath(Panel_haibao, 'txt_time');
            local txt_name = TFDirector:getChildByPath(Panel_haibao, 'txt_name');
            local txt_desc = TFDirector:getChildByPath(Panel_haibao, 'txt_neirong');
            local img_head = TFDirector:getChildByPath(Panel_haibao, 'img_head');
            --
            txt_time:setText(data.time)
            txt_name:setText(data.serverid.." "..data.name)
            txt_desc:setText(data.commit)
            local roleData =  RoleData:objectByID(tonumber(data.role_head))
            if (roleData) then
                img_head:setTexture(roleData:getHeadPath())
            end
        end
    end
end

function HaiBaoLayer:onShow()
    self.super.onShow(self)
end


function HaiBaoLayer:removeUI()
   self.super.removeUI(self);
end

--注册事件
function HaiBaoLayer:registerEvents()
    self.super.registerEvents(self);
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function HaiBaoLayer:removeEvents()

end
return HaiBaoLayer;