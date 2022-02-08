-- script writer fei
-- creation time 2017-05-31
-- Description: 天书注解
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
local TianZhuJieLayer = class("TianZhuJieLayer", BaseLayer)
TianZhuJieLayer.img_kong_path = {"ui_new/tianshu/zhujie/img_kong1.png", "ui_new/tianshu/zhujie/img_kong2.png"}
-- TianZhuJieLayer.img_kong_path = {"ui_new/tianshu/zhujie/img_line1.png", "ui_new/tianshu/zhujie/img_kong2.png"}

function TianZhuJieLayer:ctor(bibleId)
    self.super.ctor(self)
    self.bibleId         = bibleId
    self:init("lua.uiconfig_mango_new.tianshu.TianShuZhuJie")
end

function TianZhuJieLayer:initUI(ui)
    self.super.initUI(self,ui)
    --
    self.btn_return        = TFDirector:getChildByPath(ui, "btn_return")
    self.btn_help          = TFDirector:getChildByPath(ui, "btn_help")
    ---
    self.attr_list = {}
    for i=1, 13 do
        local img_sx = TFDirector:getChildByPath(ui, "img_sx"..i)
        if (img_sx) then
            local txt_name      = TFDirector:getChildByPath(img_sx, "txt_name")
            local txt_base      = TFDirector:getChildByPath(img_sx, "txt_base")
            img_sx.txt_name     = txt_name
            img_sx.txt_base     = txt_base
            self.attr_list[i]   = img_sx
            img_sx:setVisible(false)
        end
    end
    --
    self.img_kong_list      = {}
    self.panel_detailsList  = {}
    self.img_lineList       = {}
    for i=1, 7 do
        local img_kong = TFDirector:getChildByPath(ui, "img_kong"..i)
        if (img_kong) then
            img_kong:setTexture(TianZhuJieLayer.img_kong_path[2])
            self.img_kong_list[i] = img_kong
        end
        local panel_details = TFDirector:getChildByPath(ui, "panel_details_"..i)
        if (panel_details) then
            panel_details:setVisible(false)
            local txt_name      = TFDirector:getChildByPath(panel_details, "txt_name")
            local txt_num       = TFDirector:getChildByPath(panel_details, "txt_num")
            panel_details.txt_name    = txt_name
            panel_details.txt_num     = txt_num
            self.panel_detailsList[i] = panel_details
        end
        local img_line = TFDirector:getChildByPath(ui, "img_line"..i)
        if (img_line) then
            self.img_lineList[i] = img_line
        end
    end
    self.btn_zhujie       = TFDirector:getChildByPath(ui, "btn_zhujie")
    
    -- self.txt_attr_miyao   = TFDirector:getChildByPath(ui, "txt_attr_miyao")
    self.img_next          = TFDirector:getChildByPath(ui, "img_next")
    self.txt_zy          = TFDirector:getChildByPath(self.img_next, "txt_zy")
    self.Panel_cost       = TFDirector:getChildByPath(ui, "Panel_cost")
    self.txt_cost         = TFDirector:getChildByPath(self.Panel_cost, "txt_cost")
    self.txt_yongyou      = TFDirector:getChildByPath(self.Panel_cost, "txt_yongyou")
    self.res_icon         = TFDirector:getChildByPath(self.Panel_cost, "img_res_icon2")
    --秘要
    local img_bdj          = TFDirector:getChildByPath(ui, "img_bdj")
    self.panel_miyao       = TFDirector:getChildByPath(img_bdj, "panel_miyao")
    self.txt_attr_miyao    = TFDirector:getChildByPath(img_bdj, "txt_attr_miyao")
    self.txt_wxq           = TFDirector:getChildByPath(img_bdj, "txt_wxq")
    self.panel_anniu       = TFDirector:getChildByPath(ui, "panel_anniu")
    self.panel_zhujie       = TFDirector:getChildByPath(ui, "panel_zhujie")
    
    self.panel_miyao:setVisible(false)
    self.txt_attr_miyao:setVisible(false)
    self.txt_attr_miyao:setText("")
    self.txt_zy:setText("")
    self.txt_wxq:setVisible(false)
    self.chapterId = 0
    self.bibleInfo = nil
end

function TianZhuJieLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function TianZhuJieLayer:refreshUI()
    self.bibleInfo  = SkyBookManager:getItemByInstanceId( self.bibleId ) or nil
    
    if (self.bibleInfo == nil) then
        return
    end
    self.chapterId  = self.bibleInfo.chapterId
    self.entryId    = self.bibleInfo.entryId
    self.quality    = self.bibleInfo.quality

    print('self.chapterId  '..self.chapterId)
    print('self.entryId  '..self.entryId)
    print('self.quality  '..self.quality)
    
    self:updataAttr()
    self:updataCurrInfo()
    self:updataCost()
    self:updataMyYaoInfo()
    for i,v in ipairs(self.img_lineList) do
        v:setVisible(i < self.entryId) 
    end
    if (self.chapterId == SkyBookManager.MaxChapterId and self.entryId >= SkyBookManager.MaxEntryId) then
        self.btn_zhujie:setTextureNormal("ui_new/rolerisingstar/btn_lianti_h.png")
        self.btn_zhujie:setTouchEnabled(false)
        self.Panel_cost:setVisible(false)
    else
        self.btn_zhujie:setTouchEnabled(true)
    end
end

--右侧总属性
function TianZhuJieLayer:updataAttr()
    local currAtrr = BibleNoteData:GetSkyBookZhuJieAllAttr( self.chapterId, self.entryId, self.quality )
    local count = 1
    for i = 1, EnumAttributeType.Max - 1 do 
        if currAtrr[i] and currAtrr[i] ~= 0 then
            local attrImg   = self.attr_list[count]
            if (attrImg) then
                local txt_name  = attrImg.txt_name
                local txt_base  = attrImg.txt_base
                txt_name:setText(AttributeTypeStr[i])
                txt_base:setText("+"..covertToDisplayValue(i, currAtrr[i], true))
                count = count + 1
                attrImg:setVisible(true)
            end
        end
    end
end

--经脉打
function TianZhuJieLayer:updataCurrInfo()
    for i,v in ipairs(self.img_kong_list) do
        if (self.entryId >= i) then
            v:setTexture(TianZhuJieLayer.img_kong_path[1])
            if (v.effect == nil) then
                v.effect = self:getPointEffectByQuality(self.quality or 0)
                if v.effect then
                    v:addChild(v.effect)
                    local size = v:getSize()
                    v.effect:setPosition(ccp(size.width / 2 - 2,size.width / 2))
                    v.effect:playByIndex(0, -1, -1, 1)
                    v.effect:setScale(0.85)
                end
            end
            self:addXuanzhongEffect(v,"meridianeffect", true)
        else
            if (v.effect) then
                v.effect:removeFromParent()
                v.effect = nil
            end
            if (self.entryId + 1 == i) then
                self:addXuanzhongEffect(v,"meridianeffect")
            end
            v:setTexture(TianZhuJieLayer.img_kong_path[2])
        end
        local currAtrr = BibleNoteData:GetSkyBookZhuJieAttr( self.chapterId, tonumber(i), self.quality)
        if (currAtrr) then
            local txt_attr = self.panel_detailsList[i]
            if (txt_attr) then
                txt_attr:setVisible(true)
                txt_attr.txt_name:setText(AttributeTypeStr[currAtrr.attrId])
                txt_attr.txt_num:setText("+"..currAtrr.attrValue)
            end
        end
    end
    --
    for i=1,3 do
        local txtNum      = TFDirector:getChildByPath(self.ui, "txtNum"..i.."1")
        if (txtNum) then
            txtNum:setVisible(false)
        end
    end
    local str = (numberToChineseTable(self.chapterId))
    local len = #str
    for i=1,len do
        local txtNum      = TFDirector:getChildByPath(self.ui, "txtNum"..len..i)
        if (txtNum) then
            txtNum:setText(str[i])
            txtNum:setVisible(true)
        end
    end
end

--消耗
function TianZhuJieLayer:updataCost()
    local chapterId = self.chapterId
    if (SkyBookManager.MaxEntryId == self.entryId) then
        -- chapterId = chapterId + 1
        self.btn_zhujie:setTextureNormal("ui_new/tianshu/zhujie/btn_zs.png")
        self.btn_zhujie.upType = 2
    else
        self.btn_zhujie:setTextureNormal("ui_new/tianshu/zhujie/btn_zj.png")
        self.btn_zhujie.upType = 1
    end
    --
    local entryId = self.entryId
    if entryId < 7 then
        entryId = entryId + 1
    else
        chapterId = chapterId + 1
        entryId = 0
    end

    local currAtrr = BibleNoteData:GetSkyBookZhuJieInfo( chapterId, entryId, self.quality )
    if (currAtrr) then
        local str = string.split(currAtrr.consume,'_')
        local costNum       = tonumber(str[3])
        local costItemId    = tonumber(str[2])
        local costTypeId    = tonumber(str[1])
        --==============================--
        local rewardData = {}
        rewardData.type            = costTypeId
        rewardData.itemid          = costItemId
        rewardData.number          = costNum
        -- local itemData          = ItemData:objectByID(itemId)
        local rewardInfo        = BaseDataManager:getReward(rewardData)
        --==============================--
        if (rewardInfo) then
            self.res_icon:setTexture(rewardInfo.path)
            self.res_icon:setScale(0.5)
        end
        self.txt_cost:setText(costNum)
        self.btn_zhujie.costNum     = costNum
        self.btn_zhujie.rewardData  = rewardInfo
        self.btn_zhujie.costItemId  = costItemId
        --
        local haveNum = BagManager:getItemNumById(costItemId)
        self.txt_yongyou:setText(stringUtils.format(localizable.Jiayuan_fengshui_have, haveNum))
        self.Panel_cost:setVisible(true)
    else
        self.Panel_cost:setVisible(false)
        self.btn_zhujie.costNum     = 0
        self.btn_zhujie.costItemId  = 0
        self.btn_zhujie.rewardData  = nil
    end
end

--秘要相关
function TianZhuJieLayer:updataMyYaoInfo()
    local miYao = SkyBookManager:getMiYaoById(self.bibleInfo.bibleKeyId)
    if (self.bibleInfo.bibleKeyId and self.bibleInfo.bibleKeyId ~= 0) then
        self.panel_miyao:setVisible(true)
        self.txt_attr_miyao:setVisible(true)
        local img_miyao = TFDirector:getChildByPath(self.panel_miyao, "img_miyao")
        local txt_name  = TFDirector:getChildByPath(self.panel_miyao, "txt_name")
        local txt_level = TFDirector:getChildByPath(self.panel_miyao, "txt_level")
        
        if (miYao) then
            self:skillText(miYao.id, self.chapterId, self.txt_attr_miyao, miYao.level)
            local itemData = ItemData:objectByID(miYao.id)
            if (ItemData) then
                img_miyao:setTexture(itemData:GetPath())
                txt_name:setText(itemData.name)
                txt_level:setText(stringUtils.format(localizable.Tianshu_MiYai_Tips1, numberToChinese(miYao.level)))
            end
        end
    else
        self.panel_miyao:setVisible(false)
        self.txt_attr_miyao:setVisible(false)
        self.txt_wxq:setVisible(true)
    end
    --下一级
    if (self.bibleInfo.bibleKeyId and self.bibleInfo.bibleKeyId ~= 0) and (self.chapterId < SkyBookManager.MaxChapterId) then
        self.img_next:setVisible(true)
        if (miYao) then
            self:skillText(miYao.id, self.chapterId + 1, self.txt_zy,miYao.level)
        end
    else
        self.img_next:setVisible(false)
    end
end

--
function TianZhuJieLayer:skillText(bibleId, chapterId, txt,level)
    local function getAttrStr1(str1, str2)
        local str = str1
        local attrTbl = {}
        if (str1 ~= "" and str2 ~= "") then
            local str11     = string.split(str2, "_")
            local addAttrId = tonumber(str11[1]) or 0
            local addNum    = tonumber(str11[2]) or 0
            if addNum ~= 0 then
                attrTbl[addAttrId] = addNum
            end
            local oldStr    = string.split(str1, "|")
            for i,v in ipairs(oldStr) do
                local tempStr = string.split(v, "_")
                local attrIndex = tonumber( tempStr[ 1 ] )
                if (attrIndex ~= 0) then
                    tempStr[ 2 ]  = tonumber( tempStr[ 2 ] )
                    attrTbl[ attrIndex ] = attrTbl[ attrIndex ] or 0
                    attrTbl[ attrIndex ] = attrTbl[ attrIndex ] + tempStr[ 2 ]
                end
            end
        end
        return attrTbl
    end
    local function getAttrStr2(str1, str2)
        local str = str1
        local attrNum = 0
        if (str1 ~= "" and str2 ~= "") then
            local addNum    = str2 or 0
            local oldStr    = string.split(str1, "|")
            for i,v in ipairs(oldStr) do
                local tempStr = string.split(v, "_")
                if (tonumber(tempStr[1])) then
                    tempStr[1]  = tonumber(tempStr[1]) + addNum
                    attrNum = attrNum + tempStr[1]
                end
            end
        end
        return attrNum
    end
    local bibiData = BibleKeyQualityData:GetKeyInfoById(bibleId, level)
    if (bibiData) then
        local skillInfo = SkillLevelData:getInfoBySkillAndLevel(bibiData.spell_id,chapterId)
        if (skillInfo) then
            local richText_1        = TFRichText:create(txt:getSize())
            richText_1:setPositionY(36)
            richText_1:setAnchorPoint(txt:getAnchorPoint())
            txt:removeAllChildren()
            txt:addChild(richText_1)
            txt:setText("")
            
            local str = skillInfo:getTichTextDes(skillInfo, skillInfo.skill_add, true)
            richText_1:setText(str)
        end
    end
end
--
function TianZhuJieLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_return);
    self.btn_zhujie.logic      = self
    self.btn_zhujie:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSkyBookClick))
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClickHandle))
    --
    self.zhuJieCallBack = function(event)
        self:refreshUI()
        self:addSuccessEffect(self.img_kong_list[self.entryId])
        if (self.entryId == 0) then
            self:addResultEffect()
        end
    end

    TFDirector:addMEGlobalListener(SkyBookManager.UpdateZhuJieMsg, self.zhuJieCallBack) 
end
  
--
function TianZhuJieLayer.onSkyBookClick(sender)
    local self = sender.logic
    if (self.bibleInfo) then
        local costItemId    = tonumber(sender.costItemId)
        local costNum       = sender.costNum
        local rewardData    = sender.rewardData
        local haveNum1      = BagManager:getItemNumById(costItemId)
        if (haveNum1 < costNum) then
            -- local itemInfo = ItemData:objectByID(costItemId)
            if ResGetWayManager:openResGetLayer(costItemId,EnumDropType.GOODS) == true then
                return
            end
            local str = ""
            if (rewardData) then
                str = stringUtils.format(localizable.smithyIntensify_not, rewardData.name)
            else
                str = localizable.Jiayuan_daoju_not_enough
            end
            toastMessage(str)
            return
        end
        SkyBookManager:requestBibleZhuJieReplace(self.bibleInfo.instanceId, sender.upType)
    end
end

function TianZhuJieLayer:addXuanzhongEffect( widget , effectName, isShow)
    if (self.xuanzhong_effect ~= nil) then
        -- local pos = widget:getPosition()
        -- self.xuanzhong_effect:setPosition(ccp(pos.x , pos.y ))
        -- self.xuanzhong_effect:removeFromParentAndCleanup(false)
        -- self.xuanzhong_effect:playByIndex(0, -1, -1, 1)
        self.xuanzhong_effect:removeFromParent()
        self.xuanzhong_effect = nil
    end
    if (isShow) then
        return
    end
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/"..effectName..".xml")
    local effect = TFArmature:create(effectName.."_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 1)
    effect:setScale(0.68)
    local pos = widget:getPosition()
    effect:setPosition(ccp(3, 67 ))
    self.xuanzhong_effect = effect
    widget:addChild(effect)
end

function TianZhuJieLayer:dispose()
    self.super.dispose(self)
end

function TianZhuJieLayer:removeEvents()
    self.super.removeEvents(self)
   
    TFDirector:removeMEGlobalListener(SkyBookManager.UpdateZhuJieMsg, self.zhuJieCallBack)
    self.zhuJieCallBack = nil 

end

function TianZhuJieLayer:removeUI()
    self.super.removeUI(self)

end

function TianZhuJieLayer:getPointEffectByQuality(quality)
    if quality <= 0 then 
        return nil 
    end
    TFResourceHelper:instance():addArmatureFromJsonFile('effect/lianti6.xml')
    local effect = TFArmature:create('lianti6_anim')
    effect.quality = quality
    return effect
end

function TianZhuJieLayer.onHelpClickHandle(sender)
    CommonManager:showRuleLyaer("biblenotes")
end
function TianZhuJieLayer:addSuccessEffect( widget )
    if self.successEffect then
        self.successEffect:removeMEListener(TFARMATURE_COMPLETE)
        self.successEffect:removeFromParent()
        self.successEffect = nil
    end
    if (widget == nil) then
        return
    end
    local resPath = "effect/role_train.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("role_train_anim")

    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(30, 32))
    effect:setZOrder(100)
    self.successEffect = effect    
    self.successEffect:playByIndex(0, -1, -1, 0)
    widget:addChild(effect)

    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeFromParent()
        self.successEffect = nil
    end)
end
--
--
function TianZhuJieLayer:addResultEffect() 
    if self.rightEffect then
        self.rightEffect:removeMEListener(TFARMATURE_COMPLETE)
        self.rightEffect:removeFromParent()
        self.rightEffect = nil
    end
    --
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equipment_refining.xml")
    local effect = TFArmature:create("equipment_refining_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    self.panel_zhujie:addChild(effect)
    effect:setPosition(ccp(350,160))
    effect:setScaleX(1.2)
    effect:setScaleY(1.6)
    effect:setZOrder(100)
    self.rightEffect = effect
    self.rightEffect:playByIndex(0, -1, -1, 0)

    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeFromParent()
        self.rightEffect = nil
    end)  
end
return TianZhuJieLayer
