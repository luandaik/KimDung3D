--[[
  天书分解
]]

local TianShuFenJieLayer = class("TianShuFenJieLayer", BaseLayer)

function TianShuFenJieLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.tianshu.FenJieTianShu")
end

function TianShuFenJieLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.btn_close = TFDirector:getChildByPath(ui, "btn_close")
    self.txt_des = TFDirector:getChildByPath(ui, "txt_des")
    self.btn_ok = TFDirector:getChildByPath(ui, "btn_ok")
    self.btn_cancel = TFDirector:getChildByPath(ui, "btn_cancel")
    self.txt_price = TFDirector:getChildByPath(ui, "txt_price")
    self.panel_txt = TFDirector:getChildByPath(ui, "panel_txt")
    self.btn_close.logic = self
    self.btn_ok.logic = self
    self.btn_cancel.logic = self
end

function TianShuFenJieLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function TianShuFenJieLayer:loadData(data)
    self.instanceId = data
    self:refreshUI()
end

function TianShuFenJieLayer:refreshUI()
    if not self.isShow then
        return
    end
    self.item = SkyBookManager:getItemByInstanceId(self.instanceId)
    local name = self.item:getConfigName()
    local quality = self.item.config.quality
    local breach = self.item.breachConfig.times
    self.fejieConfig = BibleFenjieData:getFenjieInfo( quality ,breach )
    print(self.item)
    local paper_num = self.fejieConfig.paper_num
    local break_num = self.fejieConfig.break_num    
    local tab1 = string.split(paper_num, ",")
    local tab2 = string.split(break_num, ",")
    local dataConfig1 = ItemData:objectByID(tonumber(tab1[2]))
    local name1 = dataConfig1.name
    local dataConfig2 = {}
    local name2
    if quality == 1 or (quality == 2 and breach < 3 ) or (breach == 0) then
        name2 = "突破符"
        tab2[3] = "0"
    else
        dataConfig2 = ItemData:objectByID(tonumber(tab2[2]))
        name2 = dataConfig2.name 
    end     
    local yueliCost = SkyBookManager:calculateChongzhiGetYueli(self.item)      
    self.txt_des:setText("")
    local size = self.panel_txt:getContentSize()
    self.richtext = TFRichText:create(CCSizeMake(400,150))
    self.richtext:setFontSize(18)
   -- self.richtext:setPosition(ccp(self.txt_des:getPosition().x, self.txt_des:getPosition().y + 30))
    self.richtext:setPosition(ccp(180, -60))
    self.txt_des:addChild(self.richtext)
    local desc1 = localizable.Tianshu_fenjie_tips1
    local desc2 = yueliCost
    local desc3 = localizable.Tianshu_chongzhi_tips2
    local desc4 = localizable.Tianshu_fenjie_tips6
    local desc5 = localizable.Tianshu_fenjie_tips4
    local desc6 = GetColorStringByQuality(self.item.quality)
    local desc7 = name
    local desc8 = "&gt;&gt;？"
	local desc9 = localizable.Tianshu_fenjie_tips7
    local desc10 = localizable.Tianshu_fenjie_tips2
    local desc11 = localizable.Tianshu_fenjie_tips3
    local desc12 = name1
    local desc13 = tab1[3]
    local desc14 = name2
    local desc15 = tab2[3]
    local desc16 = localizable.Tianshu_fenjie_tips5
    local desc17 = localizable.Tianshu_fenjie_tips9
    local str = {}
    str[1] = [[<p style="text-align:left; margin:3px"><br/><br/><font face = "simhei" color="#3d3d3d" fontSize="22">%s</font><font face = "simhei" color="#008030" fontSize="22">%s</font>]]
    str[2] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]]
    str[3] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]]
    str[4] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]]
	str[5] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]]
    str[6] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]] 
    str[7] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]]
    str[8] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]] 
    str[9] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]] 
    str[10] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]]
    str[11] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]] 
    str[12] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]]    
    str[13] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]]   
    str[14] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font>]]   
    str[15] = [[<font face = "simhei" color="]] .. desc6 .. [["fontSize="22">%s</font>]] 
    str[16] = [[<font face = "simhei" color="#3d3d3d" fontSize="22">%s</font></p>]]   
    local strFormat = table.concat(str)    
    local notifyStr = ""
    notifyStr = string.format(strFormat, desc1, desc2, desc3, desc4, desc9, desc10, desc12, desc13, desc16, desc11, desc14, desc15, desc16, desc17, desc5, desc7, desc8)
    self.richtext:setText(notifyStr)   
end

function TianShuFenJieLayer:calculateNeed()
    local need = 0
    local bibleConfig = BibleData:getBibleInfoByIdAndLevel(self.item.id, self.item.level)
    local moasicStr = bibleConfig.mosaic
    local tab = string.split(moasicStr, "|")
    for i = 1, self.item.maxStoneNum do
        if self.item:getStonePos(i) and self.item:getStonePos(i) > 0 then
            local tab1 = string.split(tab[i], ",")
            local str = tab1[1]
            local tab2 = string.split(str, "_")
            if tonumber(tab2[1]) == EnumDropType.YUELI then
                need = need + tonumber(tab2[3])
            end
        end
    end
    if self.item.level <= 1 then
        return need
    end
    for i = self.item.level - 1, 1, -1 do
        local config = BibleData:getBibleInfoByIdAndLevel(self.item.id, i)
        moasicStr = config.mosaic
        tab = string.split(moasicStr, "|")
        for j = 1, #tab do
            local tab1 = string.split(tab[j], ",")
            local str = tab1[1]
            local tab2 = string.split(str, "_")
            if tonumber(tab2[1]) == EnumDropType.YUELI then
                need = need + tonumber(tab2[3])
            end
        end
    end
    return need
end

function TianShuFenJieLayer:removeUI()
    self.super.removeUI(self)
end

function TianShuFenJieLayer.onFenjieClickHandle(sender)
    local self = sender.logic
    local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianShuFenJieQueRenLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(self.instanceId)
    AlertManager:show()    
    AlertManager:closeLayer(self)
end

function TianShuFenJieLayer.onQvxiaoHandle(sender)
    local self = sender.logic
    local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianshuMainLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(self.instanceId)
    AlertManager:show()
    AlertManager:closeLayer(self)
end

function TianShuFenJieLayer.onGuanbiHandle(sender)
    local self = sender.logic
    local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianshuMainLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(self.instanceId)
    AlertManager:show()
    AlertManager:closeLayer(self)
end

--注册事件
function TianShuFenJieLayer:registerEvents()
   self.super.registerEvents(self)
   self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGuanbiHandle), 1)
   self.btn_cancel:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onQvxiaoHandle), 1)
   self.btn_ok:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onFenjieClickHandle), 1)
end

function TianShuFenJieLayer:removeEvents()
    self.super.removeEvents(self)
end

return TianShuFenJieLayer