
local TmallLayer = class("TmallLayer", BaseLayer)

-- local tmallUrl = "https://pages.tmall.com/wow/portal/act/app-download?type=web&key=https%3A%2F%2Fpages.tmall.com%2Fwow%2Fmit%2Fact%2Fxhxkl&mmstat=jhxiakeling&src=jhxiakeling"
local tmallUrl = "http://v.qq.com/cover/n/ntdg42ivdibmw89.html"

function TmallLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.qiyu.Tianmao")
    -- QiyuManager:SengQueryEatPigMsg()
end

function TmallLayer:onShow()
    print("TmallLayer onShow")
    self.super.onShow(self)
end

function TmallLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.btn_go = TFDirector:getChildByPath(ui, 'btn_go')
    self.panel_go = TFDirector:getChildByPath(ui, 'panel_go')
    self.btn_help = TFDirector:getChildByPath(ui, 'btn_help')
    self.btn_help:setVisible(false)
    self.btn_go:setVisible(false)
    self.img_bg1 = TFDirector:getChildByPath(ui, 'img_bg1')
    -- self.img_bg1:setTexture("ui_new/qiyu/img_diaoyan.jpg")
end

function TmallLayer:registerEvents(ui)
    self.super.registerEvents(self)
    self.btn_go:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onclickTiaoYan),1)
    self.panel_go:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onclickTiaoYan),1)
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.helpBtnClickHandle),1)
end

function TmallLayer:removeEvents()
    self.super.removeEvents(self)
end

function TmallLayer.goBtnClickHandle(sender)
    -- -- CommonManager:openTmall()
    -- if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID then
        
        TFDirector:unRequire('TFFramework.utils.TFDeviceInfo')
        require('TFFramework.utils.TFDeviceInfo')

        local ret = TFDeviceInfo:openUrl(tmallUrl)
        
        -- 没有打开网页的接口
        if ret == false then
            CommonManager:openTmall(tmallUrl)
        end
    -- else
    --     CommonManager:openTmall(tmallUrl)
    -- end

end

function TmallLayer.helpBtnClickHandle(sender)
    CommonManager:showRuleLyaer("tianmaojianianhua")
end

function TmallLayer.onclickTiaoYan(sender)
    local UserCenterHttpClient = TFClientNetHttp:GetInstance()
    local url = "http://hd.heitao.com/jh/survey/ajax_get_key"

    local userId     = nil
    if HeitaoSdk then
        userId     = HeitaoSdk.getuserid()
    else
        userId     = TFPlugins.getUserID()
    end
    -- userId       =11252894

    local httpPostCallback = function (type, ret, data)
        -- print("type = ",type)
        -- print("ret = ",ret)
        -- print("data = ",data)
        local post_data = json.decode(data)
        -- print("post_data = ",post_data)
        if post_data and post_data.md5 then
            local _url = string.format("http://hd.heitao.com/jh/survey?rid=%s&md5=%s",userId,post_data.md5)
            -- print("openUrl--------->>>>>",_url)
            TFDeviceInfo:openUrl(_url)
        end
    end

    local vip = MainPlayer:getVipLevel()
    local level = MainPlayer:getLevel()
    -- rid,vip,level
    local sendData = string.format("rid=%s&vip=%d&level=%d",userId,vip,level)
    UserCenterHttpClient:addMERecvListener(httpPostCallback)
    -- print("requestServerList : ",TFHTTP_TYPE_POST,url,sendData)
    UserCenterHttpClient:httpRequest(TFHTTP_TYPE_POST,url,sendData)

    -- local url = "http://v.qq.com/iframe/player.html?vid=d0310e6oz2f&tiny=0&auto=0"
    -- TFDeviceInfo:openUrl(url)
end

return TmallLayer