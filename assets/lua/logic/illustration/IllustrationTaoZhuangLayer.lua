--[[
******套装图鉴面板*******

    -- by yejiawei
    -- 2017/09/18
]]
local IllustrationTaoZhuangLayer = class("IllustrationTaoZhuangLayer", BaseLayer)
local CardEquipment = require('lua.gamedata.base.CardEquipment')
local GameAttributeData = require('lua.gamedata.base.GameAttributeData')
function IllustrationTaoZhuangLayer:ctor(equipid)
    self.super.ctor(self)
    print("equipid = ", equipid)
    self.equipid = equipid
    self:init("lua.uiconfig_mango_new.handbook.HandbookTaoZhuang")
    
    -- self:removeUnuseTexEnabled(true);
end

function IllustrationTaoZhuangLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.closeBtn           = TFDirector:getChildByPath(ui, 'btn_close')
    self.txt_title          = TFDirector:getChildByPath(ui, 'txt_name')
    self.img_touxiang       = TFDirector:getChildByPath(ui, 'img_touxiang')
   
    self.txt_des            = TFDirector:getChildByPath(ui, 'txt_des')
    self.img_pinzhiditu     = TFDirector:getChildByPath(ui, 'img_pinzhiditu')
    self.btn_huodetujin     = TFDirector:getChildByPath(ui, 'btn_huodetujin')
    self.txt_power          = TFDirector:getChildByPath(ui, 'txt_power')
    
    -- 基础武力
    self.txt_basePower           = TFDirector:getChildByPath(ui, 'txt_basepowerdes')
    self.txt_basePowerNum        = TFDirector:getChildByPath(self.txt_basePower, 'txt_num')
    -- 成长武力
    self.txt_growPower           = TFDirector:getChildByPath(ui, 'txt_grow')
    self.txt_growPowerNum        = TFDirector:getChildByPath(self.txt_growPower, 'txt_num')
   
    -- 套装
    local panel_taozhuang        = TFDirector:getChildByPath(ui, "panel_taozhuang")
    self.txt_name           = TFDirector:getChildByPath(panel_taozhuang, 'txt_name')
    self.taozhuang_txt = {}
    for i=1,4 do
        local txt       = TFDirector:getChildByPath(ui, "txt_"..i)
        txt.sx1         = TFDirector:getChildByPath(txt, "txt_sx1")
        txt.sx2         = TFDirector:getChildByPath(txt, "txt_sx2")
        txt:setVisible(false)
        self.taozhuang_txt[i] = txt
    end
    self.InfoList        = {}
    for i=1,3 do
        local tag = i + 1
        self.InfoList[i]     = {}
        self.InfoList[i].img = TFDirector:getChildByPath(ui, 'img_dian'..tag)
        self.InfoList[i].txt = TFDirector:getChildByPath(ui, 'txt_quality'..tag)
        self.InfoList[i].tag = tag
    end
  

    self.qualityList        = {}
    for i=1,4 do
        self.qualityList[i]     = {}
        self.qualityList[i].name = TFDirector:getChildByPath(ui, 'txt_quality'..i)
        -- self.qualityList[i].name:setVisible(false)
        self.qualityList[i].num  = TFDirector:getChildByPath(ui, 'txt_num'..i)
    end
    self.txt_num_zhanli     = self.qualityList[1].num

    self.btn_huodetujin.logic = self

    self:draw()

    --图鉴控制
    local role  = ItemData:objectByID(self.equipid)
    self.output = role.show_way

    self.btn_huodetujin:setVisible(false)
    if self.output and string.len(self.output) > 0 then
        self.btn_huodetujin:setVisible(true)
    end


end

function IllustrationTaoZhuangLayer:registerEvents(ui)
    self.super.registerEvents(self)
    self.btn_huodetujin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onclikOutPut),1)
    
    ADD_ALERT_CLOSE_LISTENER(self, self.closeBtn)
end

function IllustrationTaoZhuangLayer:removeEvents()
    self.super.removeEvents(self)

end

function IllustrationTaoZhuangLayer.onclikOutPut(sender)
    local self = sender.logic
 
    IllustrationManager:showOutputList({output = self.output, id = 2})
end

function IllustrationTaoZhuangLayer:draw()
    local equipMentData = ItemData:objectByID(self.equipid)
    local suit_id = EquipmentTemplateData:objectByID(self.equipid).suit_id
    
    self.txt_name:setText(localizable.SuitName[suit_id]..localizable.Suit)
    local mixnum = SuitsData:getSuitMixnum( suit_id )
    for i=1,mixnum-1 do 
        local desc = SuitsData:getSuitDescInfo(suit_id,i+1)        
        local des = string.split(desc[1],"，")
        -- print(des)
        if des then
            self.taozhuang_txt[i]:setVisible(true)
            if #des == 1 then
                self.taozhuang_txt[i].sx1:setText(des[1])
                self.taozhuang_txt[i].sx2:setVisible(false)
            elseif #des >= 2 then
                self.taozhuang_txt[i].sx1:setText(des[1])
                self.taozhuang_txt[i].sx2:setText(des[2])
            end
        else
            self.taozhuang_txt[i]:setVisible(false)
        end
    end
    local headIcon      = equipMentData:GetPath()
    self.txt_title:setText(equipMentData.name) 
    self.txt_des:setText(equipMentData.details) 
    self.img_touxiang:setTexture(headIcon)
    local qualityIcon   = GetColorIconByQuality(equipMentData.quality)
    self.img_pinzhiditu:setTexture(qualityIcon)  
    self.img_touxiang:setFlipX(false)
    -- --detail
    -- print("我点击了- --", equipMentData.name)

    -- 属性描述
    local equip = CardEquipment:new(self.equipid)
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end
    -- print("111111111111")


    -- print("IllustrationTaoZhuangLayer:draw")
    local equipmentTemplate = EquipmentTemplateData:objectByID(equip.id)
    local equipData = equipmentTemplate.base_attribute
    -- local equipData = EquipmentTemplateData:objectByID(self.equipid).extra_attribute
    -- print("equipData = ", equipData)
    local equipAttr = GameAttributeData:new()           --基本属性
    equipAttr:init(equipData)
    local power     = equipAttr:getPower()
    self.txt_num_zhanli:setText(string.format("%d",power))
    -- print("equipAttr.attribute", equipAttr.attribute)
    -- print("equipAttr.indexTable", equipAttr.indexTable)
    -- print("power = ", power)

    --基础属性
    local baseAttr = equipAttr.attribute
    -- print("baseAttr num = ", #baseAttr)
    -- print("baseAttr = ", baseAttr)
    local attrName = ""
    local attrNum  = 0
    local index = 1
    for i=1,(EnumAttributeType.Max-1) do
        if baseAttr[i] then
            self.qualityList[index].name:setText(AttributeTypeStr[i])
            self.qualityList[index].num:setText("+ " .. covertToDisplayValue(i,baseAttr[i]))
            self.qualityList[index].name:setVisible(true)
            self.qualityList[index].num:setVisible(true)
            index = index + 1

            attrName = AttributeTypeStr[i]
            attrNum  = covertToDisplayValue(i,baseAttr[i])
        end
    end

    if equipmentTemplate == nil then
        print("没有此类装备模板信息")
        return
    end

    local grow = equipmentTemplate.growth_factor
    grow = grow/100

    self.txt_growPowerNum:setText(grow)
    -- .."%"

    power = tonumber(attrNum*grow)
    power = math.floor(power)
    -- 成长武力
    --self.txt_growPower:setText(attrName .. "成长:")
    self.txt_growPower:setText(stringUtils.format(localizable.IllEquDetaLayer_growup,attrName))

    -- 基础武力
    --self.txt_basePower:setText("基础"..attrName..":")
    self.txt_basePower:setText(stringUtils.format(localizable.IllEquDetaLayer_base,attrName))

    self.txt_basePowerNum:setText(power)
    self.txt_power:setText(power)
    self.qualityList[1].num:setText(power)

    local quality = equipMentData.quality
    for i=1,3 do
        local tag = self.InfoList[i].tag
        local bShow = false
        
        if tag <= quality then
            bShow = true
        end
        -- print("bShow =", bShow)
        self.InfoList[i].img:setVisible(bShow)
        self.InfoList[i].txt:setVisible(bShow)
    end
end


return IllustrationTaoZhuangLayer