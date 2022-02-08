-- 济世堂二次确认框----
-- Author: luoconghai
-- Date: 2017-05-11 11:14:56
--

local JiShiTangNumberLayer = class("JiShiTangNumberLayer", BaseLayer)

CREATE_PANEL_FUN(JiShiTangNumberLayer)


function JiShiTangNumberLayer:ctor(id)
    self.super.ctor(self,id)
    self:init("lua.uiconfig_mango_new.faction.JiShiTangNumber")
end

function JiShiTangNumberLayer:initUI(ui)
    self.super.initUI(self,ui)

    --操作按钮
    self.btn_close              = TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_add                = TFDirector:getChildByPath(ui, 'btn_add')
    self.btn_reduce             = TFDirector:getChildByPath(ui, 'btn_reduce')
    self.btn_buy                = TFDirector:getChildByPath(ui, 'btn_buy')

    --物品图标---
    self.btn_icon                   = TFDirector:getChildByPath(ui, 'btn_icon')
    self.txt_name                   = TFDirector:getChildByPath(self.btn_icon , 'txt_name')
    self.img_quality_bg             = TFDirector:getChildByPath(self.btn_icon , 'img_quality_bg')
    self.img_icon                   = TFDirector:getChildByPath(self.btn_icon , 'img_icon')

    --物品描述
    self.txt_desc                   = TFDirector:getChildByPath(ui, 'txt_desc')
    self.panel_gift                 = TFDirector:getChildByPath(ui, 'panel_giftDesc')
    self.txt_buy_limit_tips         = TFDirector:getChildByPath(ui, 'txt_buy_limit_tips')
    self.txt_own_num                = TFDirector:getChildByPath(ui, 'txt_own_num')  

    --进度条----
    self.slider_shop                = TFDirector:getChildByPath(ui, 'slider_shop')
    self.bg_jindushuzhi             = TFDirector:getChildByPath(self.slider_shop, 'bg_jindushuzhi')
    self.txt_num                    = TFDirector:getChildByPath(ui, 'txt_num')
    self.txt_numnow                 = TFDirector:getChildByPath(ui, 'txt_numnow')

    --其他
    self.txt_shuoming               = TFDirector:getChildByPath(ui, 'txt_shuoming')
    self.Panel_juanzeng             = TFDirector:getChildByPath(ui, 'Panel_juanzeng')
    self.txt_xiayinumber            = TFDirector:getChildByPath(self.Panel_juanzeng , 'txt_xiayinumber')
    self.panel_dialog               = TFDirector:getChildByPath(ui, 'panel_dialog')
    self.panel_dialog:setTouchEnabled(true)

    --为按钮绑定处理逻辑属性，指向self
    self.btn_close.logic = self
    self.btn_add.logic = self
    self.btn_reduce.logic = self
    self.slider_shop.logic = self
    self.btn_buy.logic = self

end

function JiShiTangNumberLayer:removeUI()
    self.super.removeUI(self)
end


function JiShiTangNumberLayer:onShow()
    self.super.onShow(self)  
end

function JiShiTangNumberLayer:loadData(date,type,CheckBoxStatus)
    self.uiData=date
    local commonReward = {}
    commonReward.type   = EnumDropType.GOODS
    commonReward.itemId = self.uiData.templateId or self.uiData.itemid or self.uiData.itemId
    self.itemInfo=BaseDataManager:getReward(commonReward)
    self.typeIndex=type
    self.CheckBoxStatus=CheckBoxStatus
    self:refreshUI()
end

function JiShiTangNumberLayer:refreshBaseUI()
    if self.typeIndex==FactionJiShiTangManager.TYPE_GIVE then
        self.max_num = self.uiData.limitNum-(self.uiData.receiveNum+self.uiData.currentNum)
        self.btn_buy:setTextureNormal('ui_new/faction/jishitang/btn_juanzeng2.png')
    elseif self.typeIndex==FactionJiShiTangManager.TYPE_NEED then
        self.max_num = ConstantData:objectByID("GuildGive.MaxNum").value or 5
        self.btn_buy:setTextureNormal('ui_new/faction/jishitang/btn_fabuxuqiu.png')
    end
    -- print(self.CheckBoxStatus,self.max_num)
    if self.CheckBoxStatus then
        self.slider_shop:setPercent(100)
        self:setSTopNum(self.max_num)
    else
        self:setSTopNum(1)
        self.slider_shop:setPercent(1/self.max_num*100)
    end
    self.bg_jindushuzhi:setVisible(false)
end

function JiShiTangNumberLayer:refreshUI()
    self:refreshBaseUI()
    if self.uiData == nil  then
        return
    end
    -- result = {
    --             name = item.name,
    --             quality = item.quality,
    --             number = data.number or 1,
    --             path = MainPlayer:getProfessionIconPath(),
    --             desc = item.details
    --         }
    --图标------------
    self.txt_name:setString(self.itemInfo.name)
    self.img_icon:setTexture(self.itemInfo.path)
    Public:addPieceImg(self.img_icon,self.itemInfo,nil,1.0);
    local goodsData = ItemData:objectByID(self.itemInfo.itemid)
    self.img_quality_bg:setTexture(GetBackgroundForGoods(goodsData))

    --描述
    self.txt_desc:setText(self.itemInfo.desc)
    
    local num=BagManager:getItemNumById( self.itemInfo.itemid ) or 0
    self.txt_own_num:setString(num)
    if self.uiData.type == 7 then
        if self.itemInfo.quality==4 then
            self.txt_own_num:setText(num.."/"..150)
        elseif self.itemInfo.quality==5 then
            self.txt_own_num:setText(num.."/"..200)
        end
    elseif self.uiData.type == 8 then
        self.txt_own_num:setText(num.."/"..30)
    end

    if self.typeIndex==FactionJiShiTangManager.TYPE_GIVE then
        self.Panel_juanzeng:setVisible(true)
        self.txt_shuoming:setVisible(false)
    elseif self.typeIndex==FactionJiShiTangManager.TYPE_NEED then
        self.Panel_juanzeng:setVisible(false)
        self.txt_shuoming:setVisible(true)
    end
end


function JiShiTangNumberLayer.reduceButtonClickHandle(sender)
    local self=sender.logic
    local count = tonumber(sender.logic.txt_num:getText())
    if count>self.max_num then
        count=self.max_num
    end
    count = count - 1
    if count<1 then
        count=1
    end
    self:setSTopNum(count)
    local percent = math.ceil(count/sender.logic.max_num*100)
    self.slider_shop:setPercent(percent)
end

function JiShiTangNumberLayer.addButtonClickHandle(sender)
    local self=sender.logic
    local count = tonumber(sender.logic.txt_num:getText())
    count = count + 1
    if count>self.max_num then
        count=self.max_num
    end
    self:setSTopNum(count)
    local percent = math.ceil(count/sender.logic.max_num*100)
    self.slider_shop:setPercent(percent)
end


function JiShiTangNumberLayer.sliderTouchBeginHandle(sender)
    local self = sender.logic
    self.bg_jindushuzhi:setVisible(true)
    self:freshSliderNum()
end

function JiShiTangNumberLayer.sliderTouchMoveHandle(sender)
    local self = sender.logic
    self:freshSliderNum()
end

function JiShiTangNumberLayer.sliderTouchEndHandle(sender)
    local self = sender.logic
    self.bg_jindushuzhi:setVisible(false)


    local count = tonumber(sender.logic.txt_num:getText())
    local percent = math.ceil(count/sender.logic.max_num*100)
    sender.logic.slider_shop:setPercent(percent)
end


function JiShiTangNumberLayer:freshSliderNum()
    local percent = self.slider_shop:getPercent()/100
    local num = math.ceil(percent*self.max_num)
    num = math.max(num,1)
    self:setSTopNum(num)
    local width = self.slider_shop:getSize().width
    local temp = math.ceil(width*percent)
    self.bg_jindushuzhi:setPositionX(temp - width/2)
end

function JiShiTangNumberLayer:setSTopNum(num)
    self.txt_num:setString(num)
    self.txt_numnow:setString(num)
    --刷新按钮----
    print(num,self.max_num)

    self.btn_reduce:setGrayEnabled(num<=1)
    self.btn_reduce:setTouchEnabled(not (num<=1))

    self.btn_add:setGrayEnabled(num>=self.max_num)
    self.btn_add:setTouchEnabled(not (num>=self.max_num))

    --刷新侠义值-----
    if self.typeIndex==FactionJiShiTangManager.TYPE_GIVE then
        local data=ConstantData:objectByID('GuildGive.Goods'..self.uiData.type..'_'..self.itemInfo.quality)
        if data then
            self.txt_xiayinumber:setString(num*data.value)
        end
    end
    
end


function JiShiTangNumberLayer.buyButtonClickHandle(sender)
    local self = sender.logic
    local num =  tonumber(self.txt_num:getText())
    if self.typeIndex==FactionJiShiTangManager.TYPE_GIVE then
        local playerId=self.uiData.playerId
        if not FactionJiShiTangManager:isCanGive(playerId) then
            toastMessage(localizable.jishitang_give_none)
            return
        else
            if not FactionJiShiTangManager:getTipsStatus() then
                local layer = CommonManager:showOperateSureTipLayer(
                    function(data, widget)
                        -- print('playerId',playerId)
                        -- print(FactionJiShiTangManager:isCanGive(playerId))
                        if not FactionJiShiTangManager:isCanGive(playerId) then
                            toastMessage(localizable.jishitang_give_none)
                            return
                        end
                        FactionJiShiTangManager:setTipsStatus(widget)
                        FactionJiShiTangManager:requireGive(playerId,num)
                    end,
                    function(data, widget)
                        AlertManager:close()
                    end,
                    {
                        title=localizable.common_tips,
                        msg = stringUtils.format(localizable.jishitang_give_confirm,num,self.itemInfo.name,self.uiData.playerName),
                        showtype = AlertManager.BLOCK_AND_GRAY_CLOSE
                    }
                )
                layer.txt_message:setTextVerticalAlignment(kCCVerticalTextAlignmentCenter)
            else
                FactionJiShiTangManager:requireGive(playerId,num)
            end   
        end
    elseif self.typeIndex==FactionJiShiTangManager.TYPE_NEED then
        local type=self.uiData.type
        local templateId=self.uiData.itemid
        -- print("templateId",type,templateId)
        FactionJiShiTangManager:requireHelp(type, templateId, num)
    end
end


function JiShiTangNumberLayer:registerEvents()
    self.super.registerEvents(self)

    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    self.btn_add:addMEListener(TFWIDGET_CLICK, audioClickfun(self.addButtonClickHandle),1)
    self.btn_reduce:addMEListener(TFWIDGET_CLICK, audioClickfun(self.reduceButtonClickHandle),1)
    self.btn_buy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.buyButtonClickHandle),1)

     self.juanxianCallback = function (event)
        AlertManager:closeLayerByName("lua.logic.faction.JiShiTangNumberLayer")
     end
    TFDirector:addMEGlobalListener(FactionJiShiTangManager.RECEIVE_GIVE_OR_NEED_REWARD, self.juanxianCallback)

    self.slider_shop:addMEListener(TFWIDGET_TOUCHBEGAN, audioClickfun(self.sliderTouchBeginHandle),1)
    self.slider_shop:addMEListener(TFWIDGET_TOUCHMOVED, audioClickfun(self.sliderTouchMoveHandle),1)
    self.slider_shop:addMEListener(TFWIDGET_TOUCHENDED, audioClickfun(self.sliderTouchEndHandle),1)

end

function JiShiTangNumberLayer:removeEvents()
    self.btn_add:removeMEListener(TFWIDGET_CLICK)
    self.btn_reduce:removeMEListener(TFWIDGET_CLICK)
    self.btn_buy:removeMEListener(TFWIDGET_CLICK)

    self.slider_shop:removeMEListener(TFWIDGET_TOUCHBEGAN)
    self.slider_shop:removeMEListener(TFWIDGET_TOUCHMOVED)
    self.slider_shop:removeMEListener(TFWIDGET_TOUCHENDED)

    --逻辑事件
    TFDirector:removeMEGlobalListener(FactionJiShiTangManager.RECEIVE_GIVE_OR_NEED_REWARD, self.juanxianCallback)
    self.super.removeEvents(self)
end



return JiShiTangNumberLayer;
