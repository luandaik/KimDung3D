
local IllustrationZhenfaDetailLayer = class("IllustrationZhenfaDetailLayer", BaseLayer)
local CardStrategy = require('lua.gamedata.base.CardStrategy')
local GameAttributeData = require('lua.gamedata.base.GameAttributeData')
function IllustrationZhenfaDetailLayer:ctor(bookId)
    self.super.ctor(self)
    self.bookId = bookId
    self:init("lua.uiconfig_mango_new.zhenfa.ZhenFaDetail")
    
    --self:removeUnuseTexEnabled(true);
end

function IllustrationZhenfaDetailLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.closeBtn           = TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_huodetujin     = TFDirector:getChildByPath(ui, 'btn_huoqu')


    self.txt_title          = TFDirector:getChildByPath(ui, 'txt_name')
    self.img_quality       = TFDirector:getChildByPath(ui, 'img_quality')
    self.img_icon          = TFDirector:getChildByPath(ui, 'img_icon')
    self.txt_info            = TFDirector:getChildByPath(ui, 'txt_info')

    --总属性
    self.txt_zsx     = TFDirector:getChildByPath(ui, 'txt_zsx')
    self.baseAttr = {}
    local panel_move = TFDirector:getChildByPath(ui, "panel_move")
    for i=1,5 do
        self.baseAttr[i] = TFDirector:getChildByPath(panel_move, "txt_attr"..i)
        self.baseAttr[i].number = TFDirector:getChildByPath(panel_move, "txt_attr"..i.."_num")
    end

    local txt_zhenwei = TFDirector:getChildByPath(ui, "txt_zhenwei")
    self.specialDes = TFDirector:getChildByPath(txt_zhenwei, "txt_num")
    
    --阵法升星信息
    local starPositionNode = TFDirector:getChildByPath(ui, "img_di")
    self.texturePos = {}
    for i=1,9 do
        self.texturePos[i] = TFDirector:getChildByPath(starPositionNode, "img_zy"..i)
    end
    local panel_zwsx = TFDirector:getChildByPath(ui, "panel_zhenwei")
    self.starAttr = {}
    for i=1,3 do
        self.starAttr[i] = TFDirector:getChildByPath(panel_zwsx, "panel_zhenwei"..i)
        
        self.starAttr[i].attrTips = TFDirector:getChildByPath(self.starAttr[i], "txt_jihuotips")
        self.starAttr[i].attr = {}

        local starAttr = {}
        starAttr.attrNode = TFDirector:getChildByPath(self.starAttr[i], "txt_attr1")
        starAttr.attrName = TFDirector:getChildByPath(starAttr.attrNode, "txt_attr1")
        starAttr.attrNum = TFDirector:getChildByPath(starAttr.attrNode, "txt_attr1_num")
        table.insert(self.starAttr[i].attr, starAttr)
        local starAttr2 = {}
        starAttr2.attrNode = TFDirector:getChildByPath(self.starAttr[i], "txt_attr2")
        starAttr2.attrName = TFDirector:getChildByPath(starAttr2.attrNode, "txt_attr2")
        starAttr2.attrNum = TFDirector:getChildByPath(starAttr2.attrNode, "txt_attr2_num")
        table.insert(self.starAttr[i].attr, starAttr2)        
    end

    self.btn_huodetujin.logic = self

    self:draw()

    --图鉴控制
    local skyBook  = ItemData:objectByID(self.bookId)
    self.output = skyBook.show_way

    self.btn_huodetujin:setVisible(false)
    if self.output and string.len(self.output) > 0 then
        self.btn_huodetujin:setVisible(true)
    end


end

function IllustrationZhenfaDetailLayer:registerEvents(ui)
    self.super.registerEvents(self)
    self.btn_huodetujin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onclikOutPut),1)

    ADD_ALERT_CLOSE_LISTENER(self, self.closeBtn)
end

function IllustrationZhenfaDetailLayer:removeEvents()
    self.super.removeEvents(self)

end

function IllustrationZhenfaDetailLayer.onclikOutPut(sender)
    local self = sender.logic

    
    IllustrationManager:showOutputList({output = self.output, id = 2})
end

function IllustrationZhenfaDetailLayer:draw()
    local cardInfo  = ItemData:objectByID(self.bookId)
    if cardInfo == nil then
        return
    end
    self.txt_title:setText(cardInfo.name)
    self.txt_info:setText(cardInfo.details)
    self.img_icon:setTexture(cardInfo:GetPath())
    local qualityIcon   = GetColorIconByQuality(cardInfo.quality)
    self.img_quality:setTexture(qualityIcon)

     -- 属性描述
    local cardInfo = CardStrategy:new(self.bookId)
    if cardInfo == nil  then
        print("cardInfo not found .",self.bookId)
        return
    end
    local activityInfo,maxPosNum = self:getActivityLevel(self.bookId)

    local baseStarLevel = 0
    for k,v in pairs(activityInfo) do
        baseStarLevel = v
    end

    -- print("activityInfo = ",activityInfo)

    cardInfo:setLevel(0,0)
    cardInfo:setStarLevel(baseStarLevel)
    cardInfo:setFreeNum(0)
    cardInfo:setGmId(0)
    
    --总属性
    local extraAttr = cardInfo:getTotalAttr()
    local notEmptyIndex = 1    
    for k,v in pairs(extraAttr) do
        self.baseAttr[notEmptyIndex]:setVisible(true)
        self.baseAttr[notEmptyIndex]:setText(AttributeTypeStr[k])
        self.baseAttr[notEmptyIndex].number:setText("+ " .. covertToDisplayValue(k,v))
        notEmptyIndex = notEmptyIndex + 1
    end
    for i=notEmptyIndex,5 do
        self.baseAttr[i]:setVisible(false)
    end

    self.txt_zsx:setText(BattleArrayData:objectByID(self.bookId).describ)
    local specialInfo = BattleArrayStarData:getItemInfo(cardInfo.id,0)
    self.specialDes:setText(specialInfo.desc2)

    local changePos = {3,2,1}
    if maxPosNum ~= 3 then
        changePos = {nil,2,1}
    end
    for i=1,9 do        
        if changePos[i] then
            self.texturePos[i]:setVisible(true)
            self.texturePos[i]:setTexture("ui_new/zhenfa/img_"..changePos[i]..".png")
        else
            self.texturePos[i]:setVisible(false)
            -- self.texturePos[i]:setTexture("ui_new/zhenfa/img_"..i..".png")
        end
    end
    
    for i=1,3 do
        local attribute = cardInfo:getStarAttributeByStarPos(i)
        if i <= maxPosNum then
            local attrTbl = attribute:getAttribute()
            self.starAttr[i]:setVisible(true)      
            self.starAttr[i].attrTips:setVisible(false)
            local attrIndex = 1
            for k,v in pairs(attrTbl) do
                self.starAttr[i].attr[attrIndex].attrNode:setVisible(true)
                self.starAttr[i].attr[attrIndex].attrName:setText(AttributeTypeStr[k])
                self.starAttr[i].attr[attrIndex].attrNum:setText("+ " .. covertToDisplayValue(k,v))
                attrIndex = attrIndex + 1
            end
            if activityInfo[i] and activityInfo[i] ~= 0 then
                local jihuoStr = stringUtils.format(localizable.StrategyCard_activity_level,numberToChinese(activityInfo[i]))
                self.starAttr[i].attrTips:setVisible(true)
                self.starAttr[i].attrTips:setText(jihuoStr)
                local currY = 0
                if attrIndex == 1 then
                    currY = self.starAttr[i].attr[attrIndex].attrNode:getPositionY()
                else
                    currY = self.starAttr[i].attr[attrIndex-1].attrNode:getPositionY()
                end 
                self.starAttr[i].attrTips:setPositionY(currY - 26)
            end
            for j=attrIndex,2 do
                self.starAttr[i].attr[j].attrNode:setVisible(false)
            end

        else
            self.starAttr[i]:setVisible(false)
        end
    end
end

function IllustrationZhenfaDetailLayer:getActivityLevel( id )
    local activity = {}
    local maxAttr = 0
    for v in BattleArrayStarData:iterator() do
        if v.item == id then
            local attrNum = 0
            if v.position_1 ~= "" then
                attrNum = attrNum + 1
            end
            if v.position_2 ~= "" then
                attrNum = attrNum + 1
            end
            if v.position_3 ~= "" then
                attrNum = attrNum + 1
            end
            if v.position_4 ~= "" then
                attrNum = attrNum + 1
            end
            if v.position_5 ~= "" then
                attrNum = attrNum + 1
            end
            if maxAttr < attrNum then
                maxAttr = attrNum
            end
            local curr = activity[attrNum] or 100000
            if v.star <= curr then
                activity[attrNum] = v.star
            end
        end
    end
    return activity,maxAttr
end
return IllustrationZhenfaDetailLayer