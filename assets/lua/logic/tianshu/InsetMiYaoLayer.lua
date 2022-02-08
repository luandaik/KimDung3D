-- script writer fei
-- creation time 2017-06-03
-- Description: 天书秘要
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

local InsetMiYaoLayer = class("InsetMiYaoLayer", BaseLayer)

function InsetMiYaoLayer:ctor(bibleId)
    self.super.ctor(self)
    self.bibleId = bibleId
    self:init("lua.uiconfig_mango_new.tianshu.MiYaoPanel")
end

function InsetMiYaoLayer:initUI(ui)
	self.super.initUI(self,ui)

    --装备图标信息区
	self.img_quality 	    = TFDirector:getChildByPath(ui, 'img_quality')
	self.img_icon 	        = TFDirector:getChildByPath(ui, 'img_icon')
	local panel_details 	= TFDirector:getChildByPath(ui, 'panel_details')
    self.txt_name           = TFDirector:getChildByPath(panel_details, 'txt_name')
    self.txt_miyao_name10           = TFDirector:getChildByPath(panel_details, 'txt_miyao_name10')
    --提示性控件
    self.img_improve        = TFDirector:getChildByPath(ui, 'img_improve')
    self.img_equiped        = TFDirector:getChildByPath(ui, 'img_equiped')
    self.txt_equiped_name   = TFDirector:getChildByPath(ui, 'txt_equiped_name')
    
    self.img_star = {}
    for i=1,5 do
        local str           = "img_star_"..i
	    self.img_star[i]     = TFDirector:getChildByPath(ui, str)
    end

    --总战斗力
    self.panel_total                      = TFDirector:getChildByPath(ui, "panel_total")
    self.panel_total:setVisible(false)
    self.panelMove = TFDirector:getChildByPath(ui, 'panel_move');
    --
    self.txt_chong          = TFDirector:getChildByPath(ui, 'txt_chong');
    self.img_gem            = TFDirector:getChildByPath(ui, 'img_gem');
    self.icon_xuanzhong     = TFDirector:getChildByPath(ui, 'icon_xuanzhong');
    self.icon_suo           = TFDirector:getChildByPath(ui, 'icon_suo');
    self.txt_miyao_name1    = TFDirector:getChildByPath(ui, 'txt_miyao_name1');
    self.txt_attr_miyao     = TFDirector:getChildByPath(ui, 'txt_attr_miyao');
    self.txt_miyao_name1:setVisible(false)
    self.img_gem:setVisible(false)
    self.icon_suo:setVisible(false)
    --
end

function InsetMiYaoLayer:removeUI()
    self.super.removeUI(self)
end

function InsetMiYaoLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function InsetMiYaoLayer:dispose()
    self.super.dispose(self)
end

function InsetMiYaoLayer:setLogic( layer )
    self.logic = layer
end

function InsetMiYaoLayer:setBibleGmId(bibleId)
    self.bibleId   = bibleId
    self:refreshUI()
end
    
--刷新显示方法
function InsetMiYaoLayer:refreshUI()
    self.bibleInfo = SkyBookManager:getItemByInstanceId( self.bibleId )
    if self.bibleInfo == nil  then
        return 
    end
    self:refreshIcon()
    self:refreshDetails()
end

--刷新图标区信息
function InsetMiYaoLayer:refreshIcon()
    local bibleInfo = self.bibleInfo

    self.img_icon:setTexture(bibleInfo:GetTextrue())
    self.img_quality:setTexture(GetColorIconByQuality(bibleInfo.quality))
    self.txt_name:setText(bibleInfo:getConfigName())
    self.txt_chong:setText(stringUtils.format(localizable.Tianshu_chong_text, numberToChinese(bibleInfo.level)))

    -- --装备于谁
    if bibleInfo.equip ~= nil and bibleInfo.equip ~= 0 then 
        local role = CardRoleManager:getRoleById(bibleInfo.equip)
        if role then
            self.txt_equiped_name:setVisible(true)
            self.img_equiped:setVisible(true)
            if role.isMainPlayer then
                self.txt_equiped_name:setText(MainPlayer.verticalName)
            else
                self.txt_equiped_name:setText(role.name)
            end
        else
            self.img_equiped:setVisible(false)
        end
    else
        self.img_equiped:setVisible(false)
    end
    --
	local texture1 = "ui_new/equipment/tjp_xingxing_icon.png"
	local texture2 = "ui_new/equipment/tjp_xingxing2_icon.png"
    local star = bibleInfo:getTupoLevel()
    for i = 1, 5 do
        self.img_star[i]:setVisible(false)
    end
    for i = 1, star do
        -- self.img_xing[i].xing:setVisible(true)

        local starIdx = i
        local starTextrue = texture1
        if i > 5 then
            starTextrue = texture2
            starIdx = i - 5
        end
        self.img_star[starIdx]:setTexture(starTextrue)
        self.img_star[starIdx]:setVisible(true)

    end
end

--刷新详细信息
function InsetMiYaoLayer:refreshDetails()
    local bibleInfo = self.bibleInfo
    if (bibleInfo.quality >= 4) then
        self.icon_suo:setVisible(false)
    end
    
    if (bibleInfo.bibleKeyId and bibleInfo.bibleKeyId ~= 0) then
        self.txt_miyao_name1:setVisible(true)
        self.img_gem:setVisible(true)
        local gem = SkyBookManager:getMiYaoById(bibleInfo.bibleKeyId)
        if (gem) then
            local itemData = ItemData:objectByID(gem.id)
            if (itemData) then
                self.img_gem:setTexture(itemData:GetPath())
                self.txt_miyao_name1:setText(itemData.name)
                self.txt_miyao_name10:setText(stringUtils.format(localizable.Tianshu_MiYai_Tips1, numberToChinese(gem.level)))
                self:skillText(gem.id, gem.level, self.txt_attr_miyao)    
            end
        else
            print('bibleInfo.bibleKeyId    ',bibleInfo)
            self.img_gem:setVisible(false)
            self.txt_miyao_name10:setText("")
        end
    else
        self.txt_miyao_name1:setVisible(false)
        self.img_gem:setVisible(false)
    end
    

    -- --总战斗力
    -- self.txt_power_details:setText(bibleInfo:getpower())
end

function InsetMiYaoLayer:registerEvents()
	self.super.registerEvents(self)

    --TFDirector:addMEGlobalListener(EquipmentManager.EQUIPMENT_INTENSIFY_RESULT,self.EquipmentIntensifyResultCallBack)
    --self.GemUnMosaicResuleCallBack = function(event)
    --    if self.gmid == event.data[1].userid then
    --        self:refreshUI()
    --    end
    --end
    --TFDirector:addMEGlobalListener(EquipmentManager.GEM_UN_MOSAIC_RESULT,self.GemUnMosaicResuleCallBack)
end

function InsetMiYaoLayer:removeEvents()
    --TFDirector:removeMEGlobalListener(EquipmentManager.EQUIPMENT_INTENSIFY_RESULT,self.EquipmentIntensifyResultCallBack)
    self.super.removeEvents(self)
end
function InsetMiYaoLayer:skillText(bibleId, level, txt)
    local bibiData = BibleKeyQualityData:GetKeyInfoById(bibleId, level)
    if (bibiData) then
        local skillInfo = SkillBaseData:objectByID(bibiData.spell_id)
        if (skillInfo) then
            local spellLevelInfo    = skillInfo:GetLevelItem(self.bibleInfo.chapterId)
            local richText_1        = TFRichText:create(txt:getSize())
            richText_1:setPositionY(50)
            richText_1:setAnchorPoint(txt:getAnchorPoint())
            txt:removeAllChildren()
            txt:addChild(richText_1)
            txt:setText("")
            local str = skillInfo:getTichTextDes(spellLevelInfo, spellLevelInfo.skill_add, true)
            richText_1:setText(str)
        end
        --

    end
end

return InsetMiYaoLayer
