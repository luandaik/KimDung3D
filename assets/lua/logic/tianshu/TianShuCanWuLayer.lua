-- client side TianShuCanWuLayer.lua
--[[
 * @Description: 天书参悟界面
 ]]
-- script writer fei
-- creation time 2016-11-16

local TianShuCanWuLayer = class("TianShuCanWuLayer", BaseLayer)
--天书属性参悟等级
btn_img = 
{
    {"ui_new/tianshu/canwu/btn_xiezi1.png", "ui_new/tianshu/canwu/btn_xiezi2.png", "ui_new/tianshu/canwu/btn_xiezi3.png"},
    {"ui_new/tianshu/canwu/btn_xz1.png",    "ui_new/tianshu/canwu/btn_xz2.png", "ui_new/tianshu/canwu/btn_xz3.png"},
    {"ui_new/tianshu/canwu/btn_jl1.png",    "ui_new/tianshu/canwu/btn_jl2.png", "ui_new/tianshu/canwu/btn_jl3.png"},
    {"ui_new/tianshu/canwu/btn_bl1.png",    "ui_new/tianshu/canwu/btn_bl2.png", "ui_new/tianshu/canwu/btn_bl3.png"},
    {"ui_new/tianshu/canwu/btn_jy1.png",    "ui_new/tianshu/canwu/btn_jy2.png", "ui_new/tianshu/canwu/btn_jy3.png"}
}
cost_type_img = { [4] = "ui_new/tianshu/canwu/icon_zi.png", [5] = "ui_new/tianshu/canwu/icon_cheng.png", [6] = "ui_new/tianshu/canwu/icon_cheng.png"}
function TianShuCanWuLayer:ctor(itemId)
    self.super.ctor(self, itemId)
    self.itemId         = itemId
    local itemInfo      = SkyBookManager:getItemByInstanceId(self.itemId)
    self.quality        = tonumber(itemInfo.quality)
    self.quality        = SkyBookManager:GetUpQuality(self.quality, itemInfo.tupoLevel)
    self.costItemInfo   = {name = "", id = 0, num = 0}
    self.nowRank        = 1
    self.oldMaxRank     = 1
    self.oldMaxReachId  = 0
    self.oldMaxUseCountId = 0
    self:init("lua.uiconfig_mango_new.tianshu.TianShuCanWu")
end

function TianShuCanWuLayer:initUI(ui)
    self.super.initUI(self,ui)
    --通用头部   
    self.generalHead = CommonManager:addGeneralHead(self)
    local type = (self.quality == 4) and HeadResType.CAN_WU_RANK_4 or HeadResType.CAN_WU_RANK_5
    self.generalHead:setData(ModuleType.TianShuCanWu, {type, HeadResType.COIN, HeadResType.SYCEE})

    self.bg             = TFDirector:getChildByPath(ui, "bg")
    self.bg_sx          = TFDirector:getChildByPath(ui, "bg_sx")
    self.txt_cost       = TFDirector:getChildByPath(ui, "txt_cost")
    self.btn_canWu      = TFDirector:getChildByPath(ui, "btn_cw")
    self.btn_set        = TFDirector:getChildByPath(ui, "btn_tihuan")
    self.panel_sx       = TFDirector:getChildByPath(ui, "panel_sx")
    self.panel_wkq      = TFDirector:getChildByPath(ui, "panel_wkq")
    self.panel_btn      = TFDirector:getChildByPath(ui, "panel_anniu")
    self.Panel_nextSub  = TFDirector:getChildByPath(ui, "Panel_nextSub")
    self.panel_use      = TFDirector:getChildByPath(ui, "panel_use")
    self.btn_help       = TFDirector:getChildByPath(ui, "btn_help")
    self.img_cost_type  = TFDirector:getChildByPath(ui, "img_res_icon2")
    self.Panel_cost     = TFDirector:getChildByPath(ui, "Panel_cost")
    self.img_effect_di  = TFDirector:getChildByPath(ui, "img_effect_di")
    self.img_effect_di2 = TFDirector:getChildByPath(ui, "img_effect_di2")
    local txt_open_1    = TFDirector:getChildByPath(self.panel_wkq, "txt_open_1")
    local txt_open_2    = TFDirector:getChildByPath(self.panel_wkq, "txt_open_2")
    local txt_next_1    = TFDirector:getChildByPath(self.Panel_nextSub, "txt_next_1")
    local txt_next_2    = TFDirector:getChildByPath(self.Panel_nextSub, "txt_next_2")
    local txt_next_3    = TFDirector:getChildByPath(self.panel_use, "txt_next_3")

    self.txt_open_1     = self:creatRichTextHB(txt_open_1)
    self.txt_open_2     = self:creatRichTextHB(txt_open_2)
    self.txt_next_1     = self:creatRichTextHB(txt_next_1, 16)
    self.txt_next_2     = self:creatRichTextHB(txt_next_2, 16)
    self.txt_next_3     = self:creatRichTextHB(txt_next_3, 16)
    txt_open_1:setVisible(false)
    txt_open_2:setVisible(false)
    txt_next_1:setVisible(false)
    txt_next_2:setVisible(false)
    txt_next_3:setVisible(false)
    self.panel_sx:setVisible(false)
    self.bg_sx:setVisible(false)
    self.btn_set:setVisible(false)
    self.panel_wkq:setVisible(false)
    self.panel_btn:setVisible(true)
    self.btnArr     = {}
    self.attrImg    = {}
    for i=1,5 do
        self.btnArr[i]    = TFDirector:getChildByPath(ui, "btn_" .. i)
    end
    self.panel_all_arrt = TFDirector:getChildByPath(ui, "panel_all_arrt")
    local childrenArr = self.panel_all_arrt:getChildren()
    for i = 1, childrenArr:count() do
        local child     = TFDirector:getChildByPath(self.panel_all_arrt, "img_sx"..i)
        if (child) then
            local txt_name  = TFDirector:getChildByPath(child, "txt_name")
            local txt_base  = TFDirector:getChildByPath(child, "txt_base")
            child:setVisible(false)
            local id = i
            self.attrImg[id]             = child
            self.attrImg[id].txt_name    = txt_name
            self.attrImg[id].txt_base    = txt_base
        end
    end
    self.img_cost_type:setTexture(cost_type_img[self.quality])
    self.nowItemAttr = SkyBookManager:getByIdCanWuInfo(self.itemId)
end

function TianShuCanWuLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
    self:refreshUI()
end

function TianShuCanWuLayer:refreshUI()
end
function TianShuCanWuLayer:creatRichTextHB(_txt, fontSize)
    fontSize = fontSize or 20
    local text  = TFRichText:create(CCSizeMake(500, 20));
    text:setFontSize(fontSize)
    text:setPosition(_txt:getPosition())
    text:setAnchorPoint(_txt:getAnchorPoint())
    _txt:getParent():addChild(text, _txt:getZOrder())
    return text
end
function TianShuCanWuLayer:refreshCanData(isGet)
    --
    if (isGet) then
        self.nowItemAttr   = SkyBookManager:getByIdCanWuInfo(self.itemId)
    end
    if (self.nowItemAttr == nil) then
        --打开天书时没有参悟初始化参悟数据
        SkyBookManager:addCanWuInfo( self.itemId, self.quality)
        self.nowItemAttr   = SkyBookManager:getByIdCanWuInfo(self.itemId)
    end
    if (self.btnArr[self.firstId]) then
        self.btnArr[self.firstId]:setTouchEnabled(false)
    end
    print("进入参悟界面  ",self.nowItemAttr)
    self:updateUseCountMaxId(true)

    self.panel_sx:setVisible(true)
    self.bg_sx:setVisible(true)
    self:updataNowItemData(self.nowRank)
    self:updataAllSkyBookData()
    self.oldMaxReachId = self.nowItemAttr.reachId
    for i,v in ipairs(self.btnArr) do
        if (SkyBookManager:isOpenSkyBookRank(self.itemId, self.quality, i) == false) then
            v:setTextureNormal(btn_img[i][3])
        elseif(i ~= self.nowRank) then
            v:setTextureNormal(btn_img[i][1])
            self.oldMaxRank = i
        end
    end
end
function TianShuCanWuLayer:registerEvents()
    self.super.registerEvents(self)
    for k,v in pairs(self.btnArr) do
        v:setTag(k)
        v.logic = self
        v:addMEListener(TFWIDGET_CLICK, audioClickfun(self.rankButtonClick))
    end
    self.btn_canWu.logic    = self
    self.btn_set.logic      = self
    self.btn_canWu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.skyBookButtonClick))
    self.btn_set:addMEListener(TFWIDGET_CLICK, audioClickfun(self.setSkyBookButtonClick))
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClickHandle))
    --self.nowItemAttr   = SkyBookManager:getByIdCanWuInfo(self.itemId)
    --
    if (self.nowItemAttr == nil) then
        SkyBookManager:requestBibleComprehendInfo(self.itemId)
    else
        self:refreshCanData()
    end
    --信息
    self.onSkyBookInfo = function(event)
        self:refreshCanData(true)
    end
    TFDirector:addMEGlobalListener(SkyBookManager.UpdateSkyBookInfoMsg, self.onSkyBookInfo)
    --参悟
    self.onOpenSkyBook = function(event)
        self.nowItemAttr.bibleStageInfo[self.nowRank].isReplace = 0
        local newInfo = SkyBookManager:getByIdCanWuInfo(self.itemId, true)
        self.nowItemAttr.useCountReachId    = newInfo.useCountReachId
        self.nowItemAttr.useCount           = newInfo.useCount
        self.nowItemAttr.reachId            = newInfo.reachId
        self.nowItemAttr.stageId            = newInfo.stageId
        self:updateUseCountMaxId()

        self:updataNowItemData(self.nowRank, true)
        self:updataAllSkyBookData(true)
        self.btn_set:setVisible(true)
        if self.generalHead then
            self.generalHead:onShow()
        end
        for i,v in ipairs(self.btnArr) do
            if (SkyBookManager:isOpenSkyBookRank(self.itemId, self.quality, i) == false) then
                v:setTextureNormal(btn_img[i][3])
            elseif(i ~= self.nowRank) then
                v:setTextureNormal(btn_img[i][1])
                if (self.oldMaxRank + 1 == i) then
                    --开启新阶段
                    self.oldMaxRank = i
                    --恭喜开启xx参悟
                    toastMessage(stringUtils.format(localizable.Sky_book_open_next_rank, localizable.Sky_book_rank_des[self.oldMaxRank]))
                end
            end
        end
    end
    TFDirector:addMEGlobalListener(SkyBookManager.UpdateOpenSkyBookMsg, self.onOpenSkyBook)
    -- --改变
    self.onSetSkyBook = function(event)
        self.nowItemAttr   = SkyBookManager:getByIdCanWuInfo(self.itemId) or {}
        self:updateUseCountMaxId()
        self:updataNowItemData(self.nowRank)
        self:updataAllSkyBookData(true)
        self.btn_set:setVisible(false)
        self.btn_canWu:setVisible(true)
        self.Panel_cost:setVisible(true)
        --减免达成
        if (self.nowItemAttr.reachId > self.oldMaxReachId) then
            self.oldMaxReachId = self.nowItemAttr.reachId
            self:openNewRank()
        end
        for i,v in ipairs(self.btnArr) do
            if (SkyBookManager:isOpenSkyBookRank(self.itemId, self.quality, i) == false) then
                v:setTextureNormal(btn_img[i][3])
            elseif(i ~= self.nowRank) then
                v:setTextureNormal(btn_img[i][1])
                if (self.oldMaxRank + 1 == i) then
                    --开启新阶段
                    self.oldMaxRank = i
                    --恭喜开启xx参悟
                    toastMessage(stringUtils.format(localizable.Sky_book_open_next_rank, localizable.Sky_book_rank_des[self.oldMaxRank]))
                end
            end
        end
    end
    TFDirector:addMEGlobalListener(SkyBookManager.UpdateSetSkyBookMsg, self.onSetSkyBook)
    self.btnArr[self.nowRank]:setTextureNormal(btn_img[self.nowRank][2])
    self.firstId = self.nowRank

    if self.generalHead then
        self.generalHead:registerEvents()
    end
end
--比较参悟属性
function TianShuCanWuLayer:compareSetData(Panel_attr, nRank, index, isShowDiff, showCount, showSetButCount, oldColorRank)
    local img_icon_1        = TFDirector:getChildByPath(Panel_attr, "icon_1")
    local img_icon_2        = TFDirector:getChildByPath(Panel_attr, "icon_2")
    local icon_set_add      = TFDirector:getChildByPath(Panel_attr, "icon_set_add")
    local icon_set_sub      = TFDirector:getChildByPath(Panel_attr, "icon_set_sub")
    local Panel_di          = TFDirector:getChildByPath(Panel_attr, "Panel_di")
    local txt_add           = TFDirector:getChildByPath(Panel_attr, "txt_numb1")
    local txt_sub           = TFDirector:getChildByPath(Panel_attr, "txt_numb2")
    local img_name          = TFDirector:getChildByPath(Panel_attr, "img_name")
    local oldItemAttr       = self.nowItemAttr
    local newAttr           = SkyBookManager:getByIdCanWuInfo(self.itemId, true)
    local oldRankAttrInfo   = oldItemAttr.bibleStageInfo[nRank]
    local newRankAttrInfo   = newAttr.bibleStageInfo[nRank]
    local hideNum           = (isShowDiff == true) and 0 or oldRankAttrInfo.isReplace
    icon_set_add:setVisible(false)
    icon_set_sub:setVisible(false)
    -- isReplace 是否替换过（0：没有 1：有）
    if (hideNum ~= 0) then
        print("-----不显示-----")
        Panel_di:setVisible(false)
        self.btn_set:setVisible(false)
    else
        local oldAttrId  = oldRankAttrInfo.attIndex[index]
        local newAttrId  = newRankAttrInfo.attIndex[index]
        if (newAttrId and oldAttrId == newAttrId) then

            local oldData   = oldRankAttrInfo.value[index] or 0
            local newData   = newRankAttrInfo.value[index] or 0
            local diffData  = newData - oldData
            local isAdd = (diffData >= 0)
            if (oldData == 0 and newData == 0) then
                showCount = showCount + 1
            elseif(isAdd) then
                showSetButCount = showSetButCount + 1
            end
            if (isAdd) then
                txt_add:setText("+"..diffData)
            else
                txt_sub:setText(diffData)
            end
            local newColeRank = SkyBookManager:getReachConditionAttrRank(self.quality, nRank, newAttrId, index, newData)
            img_name:setTexture("ui_new/tianshu/canwu/img_pj"..newColeRank..".png")
            icon_set_add:setVisible(newColeRank > oldColorRank)
            icon_set_sub:setVisible(newColeRank < oldColorRank)
            img_icon_1:setVisible(isAdd)
            img_icon_2:setVisible(isAdd ~= true)
            txt_add:setVisible(isAdd)
            txt_sub:setVisible(isAdd ~= true)
            self.btn_set:setVisible(true)
            Panel_di:setVisible(true)
        else
            self.btn_set:setVisible(false)
        end
    end
    local len = table.getn(oldRankAttrInfo.attIndex)
    self.btn_canWu:setVisible(showSetButCount < len)
    self.Panel_cost:setVisible(showSetButCount < len)

    if (showCount >= len) then
        local count = 1
        for i,txt in ipairs(oldRankAttrInfo.attIndex) do
            local panel_attr    = TFDirector:getChildByPath(self.bg, "panel_shuxing" .. count)
            local panel_di      = TFDirector:getChildByPath(panel_attr, "Panel_di")
            count = count + 1
            panel_di:setVisible(false)
        end
        self.btn_set:setVisible(false)
    end
    return showCount, showSetButCount
end

--更新当前天书属性
function TianShuCanWuLayer:updataNowItemData(nRank, isShowDiff)
    local itemMaxAttr  = SkyBookManager:getSkyBookRankData(self.quality, nRank)
    local attributes   = string.split(itemMaxAttr.attributes, ",")
    local itamAttr     = {}
    for i,v in ipairs(attributes) do
        local str = string.split(v, "_")
        itamAttr[tonumber(str[1])] = tonumber(str[2])
    end
    --
    local nowItemAttr  = self.nowItemAttr
    local showCount = 0
    local showCanWuButCount = 0
    for i = 1, 5 do
        --属性顺序
        local Panel_attr    = TFDirector:getChildByPath(self.bg, "panel_shuxing" .. i)
        local rankAttrInfo  = nowItemAttr.bibleStageInfo[nRank]
        if rankAttrInfo and rankAttrInfo.attIndex[i] then
            local attrId        = rankAttrInfo.attIndex[i]
            local txt_attrName  = TFDirector:getChildByPath(Panel_attr, "txt_shuxing1")
            local img_name      = TFDirector:getChildByPath(Panel_attr, "img_name")
            local txt_base      = TFDirector:getChildByPath(Panel_attr, "txt_tupostep")
            local bar_percent   = TFDirector:getChildByPath(Panel_attr, "bar_percent")
            local bar_percent1   = TFDirector:getChildByPath(Panel_attr, "bar_percent1")
            local bar_percent2   = TFDirector:getChildByPath(Panel_attr, "bar_percent2")
            bar_percent1:setVisible(false)
            bar_percent2:setVisible(false)
            Panel_attr:setVisible(true)
            
            txt_attrName:setText(AttributeTypeStr[attrId])

            local nowData = rankAttrInfo.value[i] or 0
            local maxData = itamAttr[attrId] or 0

            local colorRank = SkyBookManager:getReachConditionAttrRank(self.quality, nRank, attrId , i, nowData)
            img_name:setTexture("ui_new/tianshu/canwu/img_pj"..colorRank..".png")
            local a ,b  = self:compareSetData(Panel_attr, nRank, i, isShowDiff, showCount, showCanWuButCount, colorRank)
            showCount           = (a or 0)
            showCanWuButCount   = (b or 0)
            txt_base:setText(nowData .."/".. maxData)
            bar_percent:setPercent(math.ceil((nowData / maxData) * 100))
         --   bar_percent:setTexture("ui_new/equipment/tjp_jindutiao4_icon.png")
            bar_percent1:stopAllActions();
            bar_percent2:stopAllActions();
            bar_percent1:setOpacity(255)
            bar_percent2:setOpacity(255)
            --
            local newItemAttr = SkyBookManager:getByIdCanWuInfo(self.itemId, true)
            if (newItemAttr) then
                local newRankAttrInfo = newItemAttr.bibleStageInfo[nRank]
                if newRankAttrInfo and newRankAttrInfo.attIndex[i] then
                    local ac1 = CCFadeTo:create(1, 255)
                    local ac2 = CCFadeTo:create(1, 0)
                    local seq = CCSequence:createWithTwoActions(ac1, ac2)
                    local newValue = newRankAttrInfo.value[i] or 0 
                    local diffValue = nowData - (newValue)
                    if (diffValue > 0) then
                        --减
                        bar_percent2:setVisible(true)
                        bar_percent2:setZOrder(0)
                        bar_percent:setZOrder(1)
                        bar_percent:setPercent(math.ceil((newValue / maxData) * 100))
                        bar_percent2:setPercent(math.ceil((nowData / maxData) * 100))

                        bar_percent2:runAction(CCRepeatForever:create(seq))
                    elseif (diffValue < 0) then
                        bar_percent1:setVisible(true)
                        bar_percent1:setPercent(math.ceil((newValue / maxData) * 100))
                        bar_percent1:setZOrder(0)
                        bar_percent:setZOrder(1)
                    
                        bar_percent1:runAction(CCRepeatForever:create(seq))
                    end
                end
            end
        else
            Panel_attr:setVisible(false)
        end
   end
   local rank = nRank + 1
   if (rank > SkyBookManager.SkyBookAttrRank.RANK_5) then rank = SkyBookManager.SkyBookAttrRank.RANK_5 end
   local openData          = SkyBookManager:getRankOpenData(rank)
   local str               = string.split(openData.condition1, "_")
   local colorRank         = tonumber(str[1])
   local conditionNum      = tonumber(str[2])
   local conditionCount    = tonumber(openData.condition2)
   local num = SkyBookManager:getReachConditionCount(self.itemId, nRank, self.quality, colorRank)
    
    local reachData     = SkyBookManager:getSkyBookRankData(self.quality, self.nowRank)
    local consume       = string.split(reachData.consume, "_")
    local costItemNum   = tonumber(consume[3])
    self.txt_cost:setText(costItemNum)
    self.costItemInfo.id    = tonumber(consume[2])
    self.costItemInfo.num   = costItemNum
    self:showNextOpenInfo(nRank)
    self:showNextSubHurtInfo()
end

--下阶段
function TianShuCanWuLayer:showNextOpenInfo(nRank)
    
   if (nRank > 1 and nRank <= SkyBookManager.SkyBookAttrRank.RANK_5) then
     --"{p1}条属性达到"
        local openData          = SkyBookManager:getRankOpenData(nRank)
        local str               = string.split(openData.condition1, "_")
        local colorRank         = tonumber(str[1])
        local conditionNum      = tonumber(str[2])
        local num = SkyBookManager:getReachConditionCount(self.itemId, nRank - 1, self.quality, colorRank) or 0

        local str1  = localizable.Sky_book_rank_des[nRank - 1]..stringUtils.format(localizable.Sky_book_tips, conditionNum,localizable.Sky_book_attr_rank_des[colorRank]).. "("
        local str2  = [[<font color="#FF0000" fontSize = "16">]]
        str2 = str2 .. num.. [[</font>]]
        local str3  = "/"..conditionNum..")"
        self.txt_open_1:setText(self:getRichText(str1, str2, str3))

        local nowItemAttr    = self.nowItemAttr
        local newAttr        = SkyBookManager:getByIdCanWuInfo(self.itemId, true)
        local useCount       = (newAttr.useCount > nowItemAttr.useCount) and newAttr.useCount or nowItemAttr.useCount
        local canWuCount     = openData.condition2 or 0
       --"本天书总参悟达{p1}次（{p2}/{p3}"
        local str1  = stringUtils.format(localizable.Sky_book_open_2, canWuCount)
        local str2  = [[<font color="#FF0000" fontSize = "16">]]
        str2 = str2 .. useCount.. [[</font>]]
        local str3  = "/"..canWuCount..")"
        self.txt_open_2:setText(self:getRichText(str1, str2, str3))
   end
end
function TianShuCanWuLayer:getRichText(str_1, str_2, str_3)
    local des =  [[<p style="text-align:left">]];
    des = des .. [[<font color="#3D3D3D">]]
    des = des .. str_1
    des = des .. [[</font>]]
    des = des .. str_2
    des = des .. [[<font color="#3D3D3D">]]
    des = des .. str_3
    des = des .. [[</font>]]
    des = des .. [[</p>]]
    return des
end
--达成条件的属性显示
function TianShuCanWuLayer:showNextSubHurtInfo()
    local canWuInfo = self.nowItemAttr
    local reachId   = canWuInfo.reachId
    local quality = self.quality
    if(quality == 6) then
        quality = 5
    end
    if (reachId == 0) then
        local subHurtInfo = SkyBookManager:getByQualitySpecialAddition(quality)
        subHurtInfo = subHurtInfo[1]
        reachId = subHurtInfo.id
    else
        reachId = reachId + 1
    end
    local nextSubHurtInfo = SkyBookManager:getByIdSpecialAddition(reachId)
    if (nextSubHurtInfo == nil or (nextSubHurtInfo and (nextSubHurtInfo.quality ~= quality))) then
        print(quality,"下一级没有",nextSubHurtInfo)
        self.Panel_nextSub:setVisible(false)
    else
        self.Panel_nextSub:setVisible(true)
        local x = 0
        local y = 0
        if (nextSubHurtInfo.addAttribute) then
            for i,v in pairs(nextSubHurtInfo.addAttribute) do
                if (isPercentAttr(tonumber(i))) then
                    x = math.abs(covertToDisplayZeroValue(i, v))
                else
                    y = math.abs(v)
                end
            end
        end
        local txt_nextHurtDerate = TFDirector:getChildByPath(self.Panel_nextSub, "txt_nextHurtDerate")
        x = (x > 0) and (x.."%") or ""
        txt_nextHurtDerate:setText(stringUtils.format(localizable.Sky_book_sub_hurt, x, y));
        local txt_2 = self.txt_next_2
        local txt_1 = self.txt_next_1
        txt_1:setVisible(false)
        txt_2:setVisible(false)
        if (nextSubHurtInfo.colorRank) then
            local num = 1
            for i,v in pairs(nextSubHurtInfo.colorRank) do
                local count = 0
                local str1  = stringUtils.format(localizable.Sky_book_tips, v, localizable.Sky_book_attr_rank_des[i]).."("
                local str2  = [[<font color="#FF0000" >]]
                local str3  = "/"..v..")"
                if (num == 1) then
                    txt_1:setVisible(true)
                    count = 0
                    for rank = 1, SkyBookManager.SkyBookAttrRank.RANK_5 do
                       count = count + SkyBookManager:getReachConditionCount(self.itemId, rank, quality, tonumber(i))or 0
                    end

                    if (count >= tonumber(v)) then
                        str2 = string.gsub(str2, "#FF0000", "#3D3D3D")
                    end
                    str2 = str2..count.. [[</font>]]
                    txt_1:setText(self:getRichText(str1, str2, str3))
                else
                    txt_2:setVisible(true)
                    count = 0
                    for rank = 1, SkyBookManager.SkyBookAttrRank.RANK_5 do
                       count = count + SkyBookManager:getReachConditionCount(self.itemId, rank, quality, tonumber(i))or 0
                    end
                    if (count >= tonumber(v)) then
                        str2 = string.gsub(str2, "#FF0000", "#3D3D3D")
                    end
                    str2 = str2..count.. [[</font>]]
                    txt_2:setText(self:getRichText(str1, str2, str3))
                end
                num = num + 1
            end
        end
    end

    local panel_ewsx    = self.panel_use
    panel_ewsx:setVisible(false)
    local useCountId    = self.oldMaxUseCountId
    local useCountInfo = SkyBookManager:getByQualityUsecountOneId(quality, useCountId) or nil
    -- if (useCountId == 0 or useCountId == nil) then
    --     useCountInfo = SkyBookManager:getByQualityUsecountOneId(quality) or nil
    -- else
    --     useCountInfo  = SkyBookManager:getByIdUsecount(useCountId + 1)
    -- end
    --local useCountInfo  = SkyBookManager:getByIdUsecount(useCountId)
    if (useCountInfo and quality == useCountInfo.quality) then
        panel_ewsx:setVisible(true)
        local str1  = stringUtils.format(localizable.Sky_book_use_count, useCountInfo.use_count)
        local str2  = [[<font color="#FF0000" fontSize = "16">]]
        str2 = str2 .. SkyBookManager:getByIdCanWuCount(self.itemId).. [[</font>]]
        local str3  = "/"..useCountInfo.use_count..")"
        
        local txt_next_3 = self.txt_next_3
        txt_next_3:setText(self:getRichText(str1, str2, str3))

        local txt_nextHurtDerate2 = TFDirector:getChildByPath(panel_ewsx, "txt_nextHurtDerate2")
        local attribute = string.split(useCountInfo.attribute, "|")
        local attrInfo  = {}
        local str3      = ""
        local strName   = ""

        for k,v in pairs(attribute) do
            local valueInfo     = string.split(v, "_")
            local attrId        = tonumber(valueInfo[1])
            local value         = tonumber(valueInfo[2])
            if (useCountInfo.power > 0) then
                if (isPercentAttr(attrId)) then
                    local tempValue = math.abs(covertToDisplayZeroValue(attrId, value))
                    if (tempValue > 0) then
                        str3 = str3.."+"..tempValue.."%"    
                    end
                else
                    str3 = str3.."+"..value
                end
                if (attrId == 45 or attrId == 102) then
                    strName = localizable.Sky_book_tips_2
                else
                    strName = BeEffectExtraStr[attrId]
                end
            else
                str3 = str3.."+"..value
                strName = AttributeTypeStr[attrId]
            end
        end
        strName = strName..str3
        txt_nextHurtDerate2:setText(strName)
    end
    
end
--更新当前天书所有属性
function TianShuCanWuLayer:updataAllSkyBookData(isAdd)
    
    local item          = SkyBookManager:getItemByInstanceId(self.itemId)
    local canWuInfo     = self.nowItemAttr
    local totalAttr     = item:getCanWuAttr()
    local count         = 1
    for i = 1, EnumAttributeType.Max - 1 do 
        if totalAttr[i] and totalAttr[i] ~= 0 then
            local attrImg   = self.attrImg[count]
            if (attrImg) then
                local txt_name  = attrImg.txt_name
                local txt_base  = attrImg.txt_base
                txt_name:setText(AttributeTypeStr[i])
                txt_base:setText(covertToDisplayValue(i, totalAttr[i], true))
                count = count + 1
                attrImg:setVisible(true)
            end
        end
    end

    local beEffectExtraAttr = item:getCanWuBeEffectExtraAttr()
    local attrInfo = getBeEffectInfo(beEffectExtraAttr)
   -- print(beEffectExtraAttr, "attrInfo   ")
    for attrName,info in pairs(attrInfo) do
        local attrImg = self.attrImg[count]
        if (attrImg and (info.percentAttr > 0 or info.constAttr > 0)) then
            attrImg.txt_name:setText(attrName)
            local str = ""
            if (info.percentAttr > 0) then
                str = (info.percentAttr).."%"
                if (info.constAttr > 0) then
                    str = str.."+"..info.constAttr
                end
            else
                if (info.constAttr > 0) then
                    str = info.constAttr
                end
            end
            attrImg.txt_base:setText(str)
            attrImg:setVisible(true)
            count = count + 1
        end     
    end

    for i = count, table.getn(self.attrImg)do
        local img_sx    = self.attrImg[i]
        if (img_sx) then
            img_sx:setVisible(false)
        end
    end
    
    self:setMove(self.panel_all_arrt, count - 1)
    self:showNextSubHurtInfo()
end

function TianShuCanWuLayer:selectRank(nRank)
    local isOpen = SkyBookManager:isOpenSkyBookRank(self.itemId, self.quality, nRank)
    if (isOpen == false) then
        self.btn_canWu:setVisible(false)
        self.btn_set:setVisible(false)
        self.panel_wkq:setVisible(true)
        self.panel_wkq:setVisible(true)
        self.panel_btn:setVisible(false)
    else
        self.btn_canWu:setVisible(true)
        self.panel_wkq:setVisible(false)
        self.panel_btn:setVisible(true)
    end

    self.btnArr[nRank]:setTouchEnabled(false)
    self.btnArr[nRank]:setTextureNormal(btn_img[nRank][2])
    if (self.btnArr[self.firstId]) then
        self.btnArr[self.firstId]:setTouchEnabled(true)
        local selectOpen = SkyBookManager:isOpenSkyBookRank(self.itemId, self.quality, self.firstId)
        local id = selectOpen and 1 or 3
        self.btnArr[self.firstId]:setTextureNormal(btn_img[self.firstId][id])
    end
    
    local isVisible = nRank < SkyBookManager.SkyBookAttrRank.RANK_5

    self.firstId = nRank
    self.nowRank = nRank
   
    self:updataNowItemData(self.nowRank)
end
--等级标签
function TianShuCanWuLayer.rankButtonClick(sender)
    local self  = sender.logic
    local nRank = sender:getTag()
    self:selectRank(nRank)
end

--天书参悟
function TianShuCanWuLayer.skyBookButtonClick(sender)
    local self = sender.logic
    local itemInfo = BagManager:getItemById(self.costItemInfo.id)
    if (itemInfo == nil or (itemInfo and itemInfo.num < self.costItemInfo.num)) then
         --参悟丹不足
        if ResGetWayManager:openResGetLayer(self.costItemInfo.id,EnumDropType.GOODS,nil) ~= true then
            local name = (itemInfo == nil) and ItemData:objectByID(self.costItemInfo.id).name or itemInfo.name
            toastMessage(stringUtils.format(localizable.Sky_book_cost_tips, name))
        end
        return
    end

    local oldMaxRankColorNum = SkyBookManager:getReachConditionCount(self.itemId, self.nowRank, self.quality, 5)
    local newMaxRankColorNum = SkyBookManager:getReachConditionCount(self.itemId, self.nowRank, self.quality, 5, true)
    local mostMaxRankColorNum  = #self.nowItemAttr.bibleStageInfo[self.nowRank].attIndex or 5
    -- print('mostMaxRankColorNum',oldMaxRankColorNum,newMaxRankColorNum,mostMaxRankColorNum)

    if newMaxRankColorNum<mostMaxRankColorNum and (oldMaxRankColorNum< newMaxRankColorNum) then
        CommonManager:showOperateSureLayer(
                function(data, widget)
                    SkyBookManager:requestBibleComprehend(self.itemId, self.nowRank)
                end,
                function(data, widget)
                    AlertManager:close()
                end,
                {
                    msg = localizable.Sky_book_tips_more
                }
        )
    elseif newMaxRankColorNum==mostMaxRankColorNum then
         CommonManager:showOperateSureLayer(
                function(data, widget)
                    SkyBookManager:requestBibleComprehend(self.itemId, self.nowRank)
                end,
                function(data, widget)
                    AlertManager:close()
                end,
                {
                    msg = localizable.Sky_book_tips_all
                }
        )
    else
        SkyBookManager:requestBibleComprehend(self.itemId, self.nowRank)
    end
    
end

--替换
function TianShuCanWuLayer.setSkyBookButtonClick(sender)
    local self = sender.logic
   --SkyBookManager:requestBibleComprehendReplace(self.itemId, self.nowRank)
   self:replaceCanWuInfo()
end

function TianShuCanWuLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    self.super.dispose(self)
end

function TianShuCanWuLayer:removeEvents()
    self.super.removeEvents(self)
    if self.generalHead then
        self.generalHead:removeEvents()
    end

    TFDirector:removeMEGlobalListener(SkyBookManager.UpdateSkyBookInfoMsg, self.onSkyBookInfo)
    self.onSkyBookInfo = nil 
    TFDirector:removeMEGlobalListener(SkyBookManager.UpdateOpenSkyBookMsg, self.onOpenSkyBook)
    self.onOpenSkyBook = nil 
    TFDirector:removeMEGlobalListener(SkyBookManager.UpdateSetSkyBookMsg, self.onSetSkyBook)
    self.onSetSkyBook = nil 

end

function TianShuCanWuLayer:openNewRank(isType)
    if (isType) then
        img_effect_di = self.img_effect_di2
    else
        img_effect_di = self.img_effect_di
    end
    TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
    local effect = TFArmature:create("equipIntensify_3_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)
    effect:setPosition(ccp(0,-50))
    effect:setScaleX((img_effect_di:getSize().width / effect:getSize().width) * 2)
    img_effect_di:addChild(effect,100)
    self.jihuoEffect = effect
    effect:addMEListener(TFARMATURE_COMPLETE, function ()
        self.jihuoEffect:removeFromParent()
        self.jihuoEffect = nil
    end)
end

function TianShuCanWuLayer:updateUseCountMaxId(isShow)
    if (table.getn(self.nowItemAttr.useCountReachId) > 1) then
        table.sort(self.nowItemAttr.useCountReachId, function(a, b)
                                                    return a > b 
                                                 end)
    end
    if (isShow ~= true and (self.oldMaxUseCountId < self.nowItemAttr.useCountReachId[1])) then
        self:openNewRank(true)
    end
    self.oldMaxUseCountId = self.nowItemAttr.useCountReachId[1]
end

function TianShuCanWuLayer:replaceCanWuInfo()
    --Sky_book_tips_3           = "替换后，极致数量将由{p1}变为{p2}，是否确认替换？"
    local oldMaxRankColorNum = SkyBookManager:getReachConditionCount(self.itemId, self.nowRank, self.quality, 5)
    local newMaxRankColorNum = SkyBookManager:getReachConditionCount(self.itemId, self.nowRank, self.quality, 5, true)

    if (oldMaxRankColorNum > newMaxRankColorNum) then
        local msg = stringUtils.format(localizable.Sky_book_tips_3, oldMaxRankColorNum, newMaxRankColorNum)    
        CommonManager:showOperateSureLayer(
                function(data, widget)
                    SkyBookManager:requestBibleComprehendReplace(self.itemId, self.nowRank)
                end,
                function(data, widget)
                    AlertManager:close()
                end,
                {
                    msg = msg
                }
        )
    else
        SkyBookManager:requestBibleComprehendReplace(self.itemId, self.nowRank)
    end
end
function TianShuCanWuLayer:setMove(node,index)
    if node == nil then
        return nil
    end
    if node.moveTween then
        TFDirector:killTween(node.moveTween)
        node.moveTween = nil
        node:setPositionY(node.initPosY)
    end

    if node.initPosY == nil then
        node.initPosY = node:getPositionY()
    end
    local limitAttrNum = 11
    if index > limitAttrNum then    
        local moveDy = (index - limitAttrNum)*30
        local posY = node.initPosY
        local moveTween = 
        {
            target = node,
            repeated = -1,
            {
                duration = 2,
                delay = 1,
                y = posY + moveDy,
                      
            },
            { -- 此节实现节与节之间的延时
                duration = 1,
                delay = 1, 
                onComplete = function()
                    node:setPositionY(posY)
                end    
            },
        }
        TFDirector:toTween(moveTween)
        node.moveTween = moveTween
    end
end

function TianShuCanWuLayer:removeUI()
    self.super.removeUI(self)
    self.btnArr         = {}
    self.nowItemAttr    = nil
end
function TianShuCanWuLayer.onHelpClickHandle(sender)
   --local self = sender.logic
    CommonManager:showRuleLyaer("tianshucanwu")
end
return TianShuCanWuLayer
