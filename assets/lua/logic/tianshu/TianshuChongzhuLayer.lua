-- client side TianshuChongzhuLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer wuqi
-- creation time 2016-09-05

local TianshuChongzhuLayer = class("TianshuChongzhuLayer", BaseLayer)

TianshuChongzhuLayer.Quality_Name = 
{
    localizable.Tianshu_Chongzhu_Quality_Name_1,
    localizable.Tianshu_Chongzhu_Quality_Name_2,
    localizable.Tianshu_Chongzhu_Quality_Name_3,
    localizable.Tianshu_Chongzhu_Quality_Name_4,
    localizable.Tianshu_Chongzhu_Quality_Name_5,
    localizable.Tianshu_Chongzhu_Quality_Name_6
}

-- TianshuChongzhuLayer.Path_Hole_Pic = 
-- {
--     "ui_new/rolerisingstar/btn_shenfa_u.png",
--     "ui_new/rolerisingstar/btn_fangyu_u.png",
--     "ui_new/rolerisingstar/btn_wuli_u.png",
--     "ui_new/rolerisingstar/btn_neili_u.png",
--     "ui_new/rolerisingstar/btn_qixue_u.png",
-- }


function TianshuChongzhuLayer:ctor(gmId)
    self.super.ctor(self, gmId)
    self.gmId = gmId
    self.selectId = 5
    self:init("lua.uiconfig_mango_new.tianshu.TianshuYanxiu")
end

function TianshuChongzhuLayer:initUI(ui)
    self.super.initUI(self, ui)
    self.btn_close = TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_lianti_up = TFDirector:getChildByPath(ui, 'btn_lianti_up')
    self.img_lianti_h = TFDirector:getChildByPath(ui, 'img_lianti_h')
    self.btn_help = TFDirector:getChildByPath(ui, 'btn_help')
    self.panel_res = TFDirector:getChildByPath(ui, 'Panel_LianTiLayer')
    self.panel_res:setScale(0.8)
    self.panel_details_1 = TFDirector:getChildByPath(ui, 'panel_details_1')
    self.Node_Point = {}
    for i=1,5 do
        self.Node_Point[i] = {}
        local node = TFDirector:getChildByPath(ui, 'btn_point'..i)
        self.Node_Point[i].baseNode = node

        local img_unlock = TFDirector:getChildByPath(node, 'img_unlock')
        self.Node_Point[i].img_unlock = img_unlock
        self.Node_Point[i].img_icon = TFDirector:getChildByPath(img_unlock, 'img_icon')
        self.Node_Point[i].txt_level = TFDirector:getChildByPath(img_unlock, 'txt_level')
        self.Node_Point[i].txt_Info = TFDirector:getChildByPath(img_unlock, 'txt_Info')
        
        -- if i ~= 1 then
        --     self.Node_Point[i].img_lock = TFDirector:getChildByPath(node, 'btn_lock_h')
        --     self.Node_Point[i].img_lock:setVisible(false)
        -- end
    end
    self.Node_Attri = {}
    for i=1,5 do
        self.Node_Attri[i] = {}
        local txt_name = TFDirector:getChildByPath(ui, 'txt_attri_'..i)
        self.Node_Attri[i].txt_name = txt_name
        self.Node_Attri[i].txt_num = TFDirector:getChildByPath(txt_name, 'txt_number')
    end
    self.Node_Extra_Attri = {}
    self.txt_jibenshuxing = TFDirector:getChildByPath(ui, 'txt_jibenshuxing')
    self.Node_Extra_Attri[1] = TFDirector:getChildByPath(self.txt_jibenshuxing, 'txt_number')
    self.txt_chongxue = TFDirector:getChildByPath(ui, 'txt_chongxue')
    self.Node_Extra_Attri[2] = TFDirector:getChildByPath(self.txt_chongxue, 'txt_number')
    self.txt_tupo = TFDirector:getChildByPath(ui, 'txt_tupo')
    self.Node_Extra_Attri[3] = TFDirector:getChildByPath(self.txt_tupo, 'txt_number')

    self.img_tianshuicon = TFDirector:getChildByPath(ui, "img_tianshuicon")
    -- self.txt_level = TFDirector:getChildByPath(ui, "txt_level")
    -- self.txt_level2 = TFDirector:getChildByPath(ui, "txt_level2")
    -- self.txt_jiacheng = TFDirector:getChildByPath(ui, "txt_jiacheng")
    -- self.img_xuanzhong = TFDirector:getChildByPath(ui, "img_xuanzhong")

    self.Node_Extra_Attri[3]:setVisible(false)
    self.txt_tupo:setText(localizable.Tianshu_Extra_Name3)

    self.img_qsx = TFDirector:getChildByPath(ui, "img_qsx")
    self.txt_qsx = TFDirector:getChildByPath(self.img_qsx, "txt_number")
end

--显示单个孔描述
function TianshuChongzhuLayer:brushUnlockShow()
    for k, v in ipairs(self.Node_Point) do
        if self.selectId == k then
            v.img_unlock:setVisible(true)
        else
            v.img_unlock:setVisible(false)
        end
    end
end

function TianshuChongzhuLayer:removeUI()
    self.super.removeUI(self)
end

function TianshuChongzhuLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)
    self.btn_close:setClickAreaLength(100)
    self.btn_lianti_up:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.OnLianTiClick,self)))
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.OnRuleClick,self)))

    for i=1,5 do
        self.Node_Point[i].baseNode.idx = i
        self.Node_Point[i].baseNode:addMEListener(TFWIDGET_CLICK, audioClickfun(handler(self.OnPointClick,self)))
    end
    self.ChongzhuResultCallBack = function (event)
        self:brushPointInfo()
        self:showChongzhuAttri()
        self:showConsume(self.selectId)
        self:addResultEffect()
        self:addSuccessEffect(self.Node_Point[self.selectId].baseNode)
    end
    TFDirector:addMEGlobalListener(SkyBookManager.SINGLE_BIBLE_PRACTICE_REPONSE, self.ChongzhuResultCallBack)

end

function TianshuChongzhuLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(SkyBookManager.SINGLE_BIBLE_PRACTICE_REPONSE,self.ChongzhuResultCallBack)
end

-----断线重连支持方法
function TianshuChongzhuLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function TianshuChongzhuLayer:refreshUI()
    self.item = SkyBookManager:getItemByInstanceId(self.gmId)
    self.selectId = self.selectId or 1

    if not self.item then
        return
    end
    self.img_tianshuicon:setTexture(self.item:GetTextrue())
    self:brushUnlockShow()
    self:brushPointInfo()
    self:showChongzhuAttri()
    self:showConsume(self.selectId)
end

function TianshuChongzhuLayer:dispose()
    self.super.dispose(self)
end

function TianshuChongzhuLayer:OnRuleClick( sender )
    CommonManager:showRuleLyaer('tianshuyanxiu')
end

function TianshuChongzhuLayer:OnPointClick(sender)
    if self.selectId == sender.idx then
        return
    end
    self.selectId = sender.idx

    self:brushUnlockShow()
    self:brushPointInfo()
    self:showConsume(self.selectId)
end

function TianshuChongzhuLayer:OnLianTiClick(sender)
    if self.isEnough ~= true then
        if self.needItemId then
            if ResGetWayManager:openResGetLayer(self.needItemId,EnumDropType.GOODS) == true then
                return
            end
        end
        if self.needItemName then
            toastMessage(stringUtils.format(localizable.Common_good_buzu,self.needItemName))
        end
        return
    end
    SkyBookManager:requestBiblePractice(self.item.instanceId, self.selectId)
end

function TianshuChongzhuLayer:brushPointInfo()
    for k, v in ipairs(self.Node_Point) do
        local pointData = self.item:getChongzhuDataByIdx(k) or {}
        if self.selectId == k then
            v.img_unlock:setVisible(true)
        else
            v.img_unlock:setVisible(false)
        end
        local quality = pointData.quality or 0
        if quality <= 0 then 
            quality = 1
        end
        v.txt_level:setText(self.Quality_Name[tonumber(quality)] .. ' Lv' .. pointData.level)

        local lev = pointData.level or 0
        local isLevZero = false
        if lev <= 0 then
            lev = 1
            isLevZero = true
        end

        local attrTab = BiblePracticeData:getTotalBaseAttribute(self.item.quality, pointData.pos, lev) or {}
        local attriType = 1
        local attriNum = 0
        for k, v in pairs(attrTab) do
            attriType = k
            attriNum = v
        end
        if isLevZero then
            attriNum = 0
        end
        v.txt_Info:setText(AttributeTypeStr[attriType] .. ' +' .. attriNum or 0)

        if nil == v.effect then
            v.effect = self:getPointEffectByQuality(pointData.quality or 0)
            if v.effect then
                v.baseNode:addChild(v.effect)
                v.effect:playByIndex(0, -1, -1, 1)
            end
        else
            if v.effect.quality ~= pointData.quality then
                v.effect:removeFromParent()
                v.effect = self:getPointEffectByQuality(pointData.quality or 0)
                if v.effect then
                    v.baseNode:addChild(v.effect)
                    v.effect:playByIndex(0, -1, -1, 1)
                end
            end
        end
    end
end

function TianshuChongzhuLayer:showConsume(index)
    local pointData = self.item:getChongzhuDataByIdx(index)

    if pointData then
        print("SkyBookManager:getMaxPointLvl  ", SkyBookManager:getMaxPointLvl(index))
        if pointData.level >= SkyBookManager:getMaxPointLvl(index) then
            self.panel_res:setVisible(false)
            self.btn_lianti_up:setVisible(false)
            self.img_lianti_h:setVisible(true)
            return
        end
        self.btn_lianti_up:setVisible(true)
        self.img_lianti_h:setVisible(false)
        local level = pointData.level + 1
        self.panel_res:setVisible(true)
        self.panel_res:removeAllChildren()
        local quality = self.item.quality
        local templateItem = BiblePracticeData:getItem(self.item.quality, index, level)
        local consumeList = templateItem:getConsume()

        self.isEnough = true
        self.needItemName = nil
        self.needItemId = nil
        for i = 1, #consumeList do
            local icon = require('lua.logic.role_new.RoleStarUpPreviewNumCell'):new()
            icon:setPosition(ccp((i-1)*92, 0))
            item = consumeList[i]
            local itemName = ""
            local curr_num = 0
            if item.type == 1 then
                curr_num = BagManager:getItemNumById( item.id )
                local dataConfig = ItemData:objectByID(item.id)
                itemName = dataConfig.name
            else
                curr_num = MainPlayer:getResValueByType(item.type)
                if item.type == 5 then
                    itemName = localizable.common_zhenqi
                elseif item.type == 14 then
                    itemName = localizable.common_jinglu
                else
                    itemName = localizable.common_res
                end
            end
            icon:setData(item.id,curr_num,item.num,item.type)
            self.panel_res:addChild(icon)
            if curr_num < item.num then
                self.isEnough = false
                self.needItemName = itemName
                self.needItemId = item.id
            end
        end
    else
        self.panel_res:setVisible(false)
        self.btn_lianti_up:setVisible(false)
        self.img_lianti_h:setVisible(true)
    end
end

--显示属性
function TianshuChongzhuLayer:showChongzhuAttri()
    local attrTab = {}

    for k, v in pairs(self.item.chongzhuData) do
        local tab = BiblePracticeData:getTotalBaseAttribute(self.item.quality, v.pos, v.level) or {}
        for i, j in pairs(tab) do
            attrTab[i] = attrTab[i] or 0
            attrTab[i] = attrTab[i] + j
        end
    end

    for i = 1, 5 do
        local num = attrTab[i] or 0
        self.Node_Attri[i].txt_name:setText(AttributeTypeStr[i])
        self.Node_Attri[i].txt_num:setText("+" .. num)
    end
    -- local attriExtra = self.item:getChongzhuExtraAttr()
    -- local num = (attriExtra.addNum or 0)/100
    -- self.Node_Extra_Attri[1]:setText("+"..num.."%")
    -- self.Node_Extra_Attri[2]:setText("+"..attriExtra.meridians)
    -- self.Node_Extra_Attri[3]:setText("+"..attriExtra.breakthrough)

    --重铸额外属性
    local extraTab = self.item:getChongzhuExtraAttr() or {}
    local extraList = clone( extraTab.attr2 )
    -- if extraList then
    --     extraList[18] = extraList[18] or 0
    --     extraList[18] = extraList[18] + extraTab.attr1
    -- end

    local basePer = extraList[18] or 0
    --local bloodPer = extraTab.attr1 or 0
    local tab = extraTab.attr1 or {}

    self.txt_jibenshuxing:setText(localizable.Tianshu_Extra_Name1)
    self.Node_Extra_Attri[1]:setText("+".. math.floor(basePer / 100) .."%")

    local strTotal = ""
    for k, v in pairs(tab) do
        strTotal = strTotal .. AttributeTypeStr[k] .. "+" .. math.floor(v / 100) .."%   "
    end
    self.txt_chongxue:setText(strTotal)
    --self.Node_Extra_Attri[2]:setText("+".. math.floor(v / 100) .."%")
    self.Node_Extra_Attri[2]:setVisible(false)

    self.txt_tupo:setVisible(false)
    if self.item:getSecondGemOpen() then
        self.txt_tupo:setVisible(true)
    end

    local perNum = self.item:getChongzhuPercent() / 100
    self.txt_qsx:setText("+" .. perNum .. "%")
    if perNum and perNum == 0 then
        self.img_qsx:setVisible(false)
    else
        self.img_qsx:setVisible(true)
    end
end

function TianshuChongzhuLayer:getPointEffectByQuality(quality)
    if quality <= 0 then 
        return nil 
    end
    TFResourceHelper:instance():addArmatureFromJsonFile('effect/lianti'..quality..'.xml')
    local effect = TFArmature:create('lianti'..quality..'_anim')
    effect.quality = quality
    return effect
end

function TianshuChongzhuLayer:addSuccessEffect( widget )
    if self.successEffect then
        self.successEffect:removeMEListener(TFARMATURE_COMPLETE)
        self.successEffect:removeFromParent()
        self.successEffect = nil
    end
    
    local resPath = "effect/role_train.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("role_train_anim")

    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:setPosition(ccp(0,0))
    effect:setZOrder(100)
    self.successEffect = effect    
    self.successEffect:playByIndex(0, -1, -1, 0)
    widget:addChild(effect)

    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeFromParent()
        self.successEffect = nil
    end)
end

function TianshuChongzhuLayer:addResultEffect() 

    if self.rightEffect then
        self.rightEffect:removeMEListener(TFARMATURE_COMPLETE)
        self.rightEffect:removeFromParent()
        self.rightEffect = nil
    end

    TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/equipment_refining.xml")
    local effect = TFArmature:create("equipment_refining_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    self.panel_details_1:addChild(effect)
    effect:setPosition(ccp(120,100))
    effect:setScaleX(0.8)
    effect:setZOrder(100)
    self.rightEffect = effect
    self.rightEffect:playByIndex(0, -1, -1, 0)

    effect:addMEListener(TFARMATURE_COMPLETE,function()
        effect:removeFromParent()
        self.rightEffect = nil
    end)
end

return TianshuChongzhuLayer
