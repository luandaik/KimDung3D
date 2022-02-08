local BiaocheShengJi = class("BiaocheShengJi", BaseLayer)

local MaxBtnNum = 3

function BiaocheShengJi:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.BiaocheShengJi")
end

function BiaocheShengJi:initUI( ui )
	self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, "Button_BiaocheShengJi_1")

    self.btn_biaoche = {}
    self.icon_select = {}
    self.txt_price = {}
    local baseNum = BiaoCheCarData:objectByID(1).score_up
    for i = 1, MaxBtnNum do
        self.btn_biaoche[i] = TFDirector:getChildByPath(ui, "btn_jibai" .. i)
        self.icon_select[i] = TFDirector:getChildByPath(ui, "Icon_jibai" .. i)
        local txt_price = TFDirector:getChildByPath(self.btn_biaoche[i], "txt_price")
        local item = BiaoCheCarData:objectByID(i + 1)
        if item then
            local fanrongNum = item.consume_boom
            txt_price:setText(fanrongNum)
            local txt_jibai = TFDirector:getChildByPath(self.btn_biaoche[i], "txt_jibai")
            txt_jibai:setText("+" .. 100 * (item.score_up - baseNum) / baseNum)
        end
    end
end

function BiaocheShengJi:removeUI()
	self.super.removeUI(self)
end

function BiaocheShengJi:onShow()
    self.super.onShow(self)
    self:refreshUI() 
end

function BiaocheShengJi:refreshUI()
    self.quality = BiaoCheManager:getMyCarQuality() or 1

    if self.quality == 1 then
        for i = 1, MaxBtnNum do
            self.icon_select[i]:setVisible(false)
            self.btn_biaoche[i]:setOpacity(255)
            self.btn_biaoche[i]:setTouchEnabled(true)
            self.btn_biaoche[i]:setGrayEnabled(false)
        end
    else
        for i = 1, MaxBtnNum do
            if self.quality - 1 == i then
                self.icon_select[i]:setVisible(true) 
            else
                self.icon_select[i]:setVisible(false)
            end
            self.btn_biaoche[i]:setOpacity(123)
            self.btn_biaoche[i]:setTouchEnabled(false)
            self.btn_biaoche[i]:setGrayEnabled(false)
        end
    end
end

function BiaocheShengJi:registerEvents()
	self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

    for i = 1, MaxBtnNum do
        self.btn_biaoche[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnYazhuClick))
        self.btn_biaoche[i].index = i
        self.btn_biaoche[i].logic = self
    end

    self.onQualityUpdate = function()
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_UPDATE_QUALITY_INFO, self.onQualityUpdate)
end

function BiaocheShengJi:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_UPDATE_QUALITY_INFO, self.onQualityUpdate)
    self.onQualityUpdate = nil
end

function BiaocheShengJi:dispose()
	self.super.dispose(self)
end

function BiaocheShengJi.onBtnYazhuClick( btn )
    local self = btn.logic
    local index = btn.index

    if FactionManager:getPostInFaction() ~= 1 then
        toastMessage( localizable.BiaocheShengJi_tips3 )
        return
    end
    local strType = localizable.Biaoche_type[index + 1]
    -- CommonManager:showOperateSureTipLayer(
    CommonManager:showOperateSureLayer(
        function(data, widget)
            BiaoCheManager:requestShengji(index + 1)
        end,
        function(data, widget)
            AlertManager:close()
        end,
        {
            title = localizable.BiaocheShengJi_tips1,
            msg = stringUtils.format(localizable.BiaocheShengJi_tips2, strType),
            showtype = AlertManager.BLOCK_AND_GRAY
        }
    ) 

    -- test
    -- BiaoCheManager.carQuality = index + 1
    -- self:refreshUI()
end

return BiaocheShengJi