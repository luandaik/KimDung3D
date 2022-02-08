--[[
******角色详情*******
    -- by king
    -- 2015/4/17
]]

local RoleInfoLayer_py = class("RoleInfoLayer_py", BaseLayer)

function RoleInfoLayer_py:ctor(data)
    self.super.ctor(self,data)

    self.fightType = EnumFightStrategyType.StrategyType_PVE
    self:init("lua.uiconfig_mango_new.role_new.RoleInfoLayer_py")
end


function RoleInfoLayer_py:onShow()
    self.super.onShow(self)
      
    self:refreshBaseUI()
    self:refreshUI()
end

function RoleInfoLayer_py:refreshBaseUI()

end

function RoleInfoLayer_py:refreshUI()
    if self.roleGmid and self.type == "self" then
        self.cardRole  = CardRoleManager:getRoleByGmid(self.roleGmid)
        if self.cardRole then
            self.cardRoleId = self.cardRole.id
        else
            self.cardRoleId = 0
        end
    elseif self.type == LayerType.fengyunluType then
        self.cardRole.starLevel = 10
        self.cardRole.skillStarLevel = 2
        self.cardRole.martialLevel = 15
    end


    self:setDefualtVisible()
    self.txt_soul:setVisible(true)
    -- self:addBtnEffect(self.btn_upStar, false)
    if self.cardRole.starlevel < self.cardRole.maxStar then
        self.bar_soul:setPercent((self.cardRole:getHaveSoulNum()/self.cardRole:getUpstarNeedSoulNum())*100)
        self.txt_soul_num:setText(self.cardRole:getHaveSoulNum().."/" .. self.cardRole:getUpstarNeedSoulNum())
        --self.btn_upStar:setGrayEnabled(false)
        --self.btn_upStar:setTouchEnabled(true)
        -- if  then
            self:addBtnEffect(self.btn_upStar, CardRoleManager:isCanStarUp(self.cardRole.gmId))
        -- else
            -- self:addBtnEffect(self.btn_upStar, false)
        -- end
    else
        self:addBtnEffect(self.btn_upStar, false)
        self.txt_soul:setVisible(false)
        self.bar_soul:setPercent(100)
        --self.txt_soul_num:setText("已修炼至最高级")
        self.txt_soul_num:setText(localizable.roleInfoLayer_py_max)
        --self.btn_upStar:setGrayEnabled(true)
        --self.btn_upStar:setTouchEnabled(false)
    end
    
    if self.type == "other" then
        self.bar_soul:setPercent(0)
        self.txt_soul_num:setText("0/0")
    end


    self:addTransferEffect()

    -- local martialLevel  = self.cardRole.martialLevel
    -- local bFullLevel    = false
    -- if martialLevel >= 9 then
    --     bFullLevel    = true
    -- end
    -- self.btn_jinjie:setGrayEnabled(bFullLevel)
    -- self.btn_jinjie:setTouchEnabled(not bFullLevel)

    if self.cardRole.level == 0 then
        self.txt_exp:setText("")
        self.bar_exp:setPercent(0)
    else
        if self.cardRole.maxExp == 0 then
            --self.txt_exp:setText("满级")
            self.txt_exp:setText(localizable.common_max_level)
            self.bar_exp:setPercent(100)
        else
            self.bar_exp:setPercent((self.cardRole.curExp/self.cardRole.maxExp)*100)
            self.txt_exp:setText((self.cardRole.curExp.."/"..self.cardRole.maxExp))
        end
    end
    self.txt_level:setText(self.cardRole.level .. "d")

    if self.type == "self" then
        local fateArray = RoleFateData:getRoleFateById(self.cardRole.id)

        local index = 1;
        local fateStatusArray = {};
        for fate in fateArray:iterator() do
            fateStatusArray[fate.id] = self.cardRole:getFateStatus(fate.id);
        end
        self.cardRole.fateStatusArray = fateStatusArray;

        
        CommonManager:setRedPoint(self.btn_upStar, CardRoleManager:isCanStarUp(self.cardRole.gmId),"isCanStarUp",ccp(5,5),1201)
        CommonManager:setRedPoint(self.btn_train, CardRoleManager:isCanBreakUp(self.cardRole.gmId),"isCanBreakUp",ccp(5,5),901)


        local skillopenLevel = FunctionOpenConfigure:getOpenLevel(201)
        if MainPlayer:getLevel() < skillopenLevel then
            CommonManager:setRedPoint(self.btn_skill, false,"isSkillPointFull",ccp(0,0))
        else
            CommonManager:setRedPoint(self.btn_skill, MainPlayer:isEnoughTimes(EnumRecoverableResType.SKILL_POINT,10,false,false) and CardRoleManager:checkRoleCanSkillUp(self.cardRole),"isSkillPointFull",ccp(0,0))
        end
    end


    self:refreshSkillInfo()
    self:refreshJinjieInfo()
    self:setOtherVisible()

    -- if self.btn_jnzs:isVisible() then
    --     self:addBtnEffect(self.btn_upStar, false)
    -- end
    if self.cardRole.pos and self.cardRole.pos ~= 0 then 
        self.img_isfight:setVisible(false)
    else
        self.img_isfight:setVisible(false)
    end

    if self.bg_wxbtn and self.type ~= "self" then
        self.bg_wxbtn:setVisible(false)
    else
        self.bg_wxbtn:setVisible(true)
    end

    if self.type == "other" then
        print("self.bShowTuPu=-",self.bShowTuPu)
        if self.bShowTuPu then
            self.btn_upStar:setVisible(true)
        else
            self.btn_upStar:setVisible(false)
        end
    else
        self.btn_upStar:setVisible(true)
    end
    if self.type == LayerType.fengyunluType then
        self:addBtnEffect(self.btn_upStar, false)
        self.txt_soul:setVisible(false)
        self.bar_soul:setPercent(100)
        self.txt_soul_num:setText(localizable.roleInfoLayer_py_max)
        self.txt_exp:setText(localizable.common_max_level)
        self.bar_exp:setPercent(100)
        self.txt_level:setText(150 .. "d")
    end
end

function RoleInfoLayer_py:addTransferEffect()
    if self.cardRole.level < MainPlayer:getLevel() then
        local catFoodList = BagManager:getItemByKind(EnumGameItemType.Soul,3)
        for v in catFoodList:iterator() do
            if v.num > 0 then
                Public:addBtnWaterEffect(self.btn_transfer, true,0)
                CommonManager:setRedPoint(self.btn_transfer, true,"isCantransfer",ccp(5,5))
                return
            end
        end
    end
    CommonManager:setRedPoint(self.btn_transfer, false,"isCantransfer",ccp(5,5))
    Public:addBtnWaterEffect(self.btn_transfer, false)
end



function RoleInfoLayer_py:initUI(ui)
    self.super.initUI(self,ui)

    -- 虾魂
    self.bar_soul                 = TFDirector:getChildByPath(ui, 'bar_soul')
    self.txt_soul                 = TFDirector:getChildByPath(ui, 'txt_soul')
    self.txt_soul_num_need        = TFDirector:getChildByPath(ui, 'txt_soul_num_need')
    self.txt_soul_num_have        = TFDirector:getChildByPath(ui, 'txt_soul_num_have')
    self.txt_soul_num             = TFDirector:getChildByPath(ui, 'txt_soul_num')
    self.txt_soul_num_need:setVisible(false)
    self.txt_soul_num_have:setVisible(false)

    -- 经验
    self.bar_exp        = TFDirector:getChildByPath(ui, 'bar_exp')
    self.txt_exp        = TFDirector:getChildByPath(ui, 'txt_exp')
    self.txt_level      = TFDirector:getChildByPath(ui, 'txt_level')

    -- btn
    self.btn_train      = TFDirector:getChildByPath(ui, 'btn_jm')
    self.btn_transfer   = TFDirector:getChildByPath(ui, 'btn_transfer')
    self.btn_upStar     = TFDirector:getChildByPath(ui, 'btn_xiulian')
    self.btn_skill      = TFDirector:getChildByPath(ui, 'btn_skill')
    self.btn_jinjie     = TFDirector:getChildByPath(ui, 'btn_jinjie')
    self.btn_train.logic    = self
    self.btn_transfer.logic = self
    self.btn_upStar.logic   = self
    self.btn_skill.logic    = self
    self.btn_jinjie.logic   = self

    self.btn_jnzs      = TFDirector:getChildByPath(ui, 'btn_jnzs')
    self.btn_szzs      = TFDirector:getChildByPath(ui, 'btn_szzs')
    self.btn_hqutj     = TFDirector:getChildByPath(ui, 'btn_hqutj')
    self.btn_jnzs.logic    = self
    self.btn_szzs.logic    = self
    self.btn_hqutj.logic   = self

    self.btn_cxwx      = TFDirector:getChildByPath(ui, 'btn_cxwx')
    self.btn_cxwx.logic    = self
    self.btn_cxwx:setVisible(true)

    -- 武学按钮
    self.bg_wxbtn           = TFDirector:getChildByPath(ui, 'bg_wxbtn')
    self.bg_wxbtn:setVisible(false)

    self.btn_qianxiu        = TFDirector:getChildByPath(ui, 'btn_qianxiu')
    self.btn_qianxiu.logic  = self
    -- 技能
    self.panel_fight_skill = TFDirector:getChildByPath(ui, "panel_zhanchangjineng")
    self.panel_fight_skill2 = TFDirector:getChildByPath(ui, "panel_zhanchangjineng2")

    -- self.node_skillList = {}
    -- self.img_skillList = {}
    -- self.txt_skillLevelList = {}
    -- self.img_openQualityList = {}

    -- for i=1,3 do
    --     self.node_skillList[i]   =  TFDirector:getChildByPath(self.panel_fight_skill,"btn_jinengkuang" .. i)
    --     self.img_skillList[i]   =  TFDirector:getChildByPath(self.node_skillList[i],"img_skill")
    --     self.txt_skillLevelList[i]   =  TFDirector:getChildByPath(self.node_skillList[i],"txt_lv")
    --     self.img_openQualityList[i]   =  TFDirector:getChildByPath(self.node_skillList[i],"img_jiesuo")
    -- end


    -- 进阶相关
    self.bookStatus    = {}
    self.img_level     = TFDirector:getChildByPath(ui, 'img_level')
    self.txt_mijilevel = TFDirector:getChildByPath(ui, 'txt_mijilevel')
    self.txt_miji      = TFDirector:getChildByPath(ui, 'txt_mji')
    self.panel_miji    = TFDirector:getChildByPath(ui, "panel_miji")


    self.txt_wuxueNum    = TFDirector:getChildByPath(ui, "txt_wuxuenum")

    self.node_mijiList  = {}
    self.img_bgList     = {}
    self.img_BookList   = {}
    self.img_DescList   = {}
    self.bookStarList   = {}
    for i=1,6 do
        self.node_mijiList[i]    =  TFDirector:getChildByPath(self.panel_miji, "panel_book_" .. i)
        self.img_bgList[i]       =  TFDirector:getChildByPath(self.node_mijiList[i],"img_quality")
        self.img_BookList[i]     =  TFDirector:getChildByPath(self.node_mijiList[i],"img_equip")
        self.img_DescList[i]     =  TFDirector:getChildByPath(self.node_mijiList[i],"img_desc")

        self.img_DescList[i]:setTouchEnabled(false)

        self.img_BookList[i]:setScale(0.7)

        self.bookStarList[i] = {}
        for j=1,5 do
            self.bookStarList[i][j]       = TFDirector:getChildByPath(self.node_mijiList[i], 'img_star'..j)
        end

    end

    self.img_isfight = TFDirector:getChildByPath(ui, "img_isfight")
    self.img_isfight:setVisible(false)

    --天命
    self.btn_tianming       = TFDirector:getChildByPath(ui, 'btn_tianming')
    self.btn_tianming.logic  = self

    self.cardRoleId = 0
end

function RoleInfoLayer_py.onPreviewClickHandle(sender)
    local self   = sender.logic
    local martialLevel = self.cardRole.martialLevel
    local MaxLevel = ConstantData:getValue("wuxue.MaxLevel")
    if martialLevel >= MaxLevel then
        --toastMessage("当前武学已达最大重")
        toastMessage(localizable.roleInfoLayer_max)
        return
    end

    print("self.cardRole.id = ", self.cardRole.id)
    local layer  = require("lua.logic.rolebook.RoleBook_Preview"):new({self.cardRole.gmId})
    AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY_CLOSE, AlertManager.TWEEN_1)
    AlertManager:show() 
end

function RoleInfoLayer_py:registerEvents(ui)
    self.super.registerEvents(self)


    self.btn_train:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTrainClickHandle),1)
    self.btn_transfer:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTransferClickHandle),1)
    self.btn_upStar:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onUpStarClickHandle),1)
    self.btn_skill:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSkillClickHandle),1)
    self.btn_jinjie:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onJinJieClickHandle),1)

    self.btn_qianxiu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onQianXiuClickHandle),1)
    self.btn_tianming:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTianMingClickHandle),1)

    self.btn_jnzs:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShowSkillHandle),1)
    self.btn_szzs:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShowRedSkillHandle),1)
    self.btn_hqutj:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onGetWayHandle),1)

    self.btn_cxwx:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onPreviewClickHandle),1)

    -- 技能
    -- for i=1,3 do
    --     self.node_skillList[i].logic     = self
    --     self.node_skillList[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSkillItemClickHandle))
    -- end

    -- 秘籍
    for i=1,6 do
        self.img_bgList[i].logic     = self
        self.img_bgList[i].index     = i
        self.img_bgList[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBookClickHandle))
    end

    -- self.RoleStarUpResultCallBack = function (event)
    --     self:onUpStarUpCompelete()
    -- end
    -- TFDirector:addMEGlobalListener(CardRoleManager.ROLE_PRACTICE_RESULT,self.RoleStarUpResultCallBack)

    if self.type == "self" then
        self.onUpdated = function()
            if self.type ~= "self" then
                return
            end
            if self.cardRoleId == nil or self.cardRoleId == 0 then
                return
            end
            local cardRole = CardRoleManager:getRoleById(self.cardRoleId)
            if cardRole == nil then
                return
            end
            local skillopenLevel = FunctionOpenConfigure:getOpenLevel(201)
            if MainPlayer:getLevel() < skillopenLevel then
                CommonManager:setRedPoint(self.btn_skill, false,"isSkillPointFull",ccp(0,0))
            else
                CommonManager:setRedPoint(self.btn_skill, MainPlayer:isEnoughTimes(EnumRecoverableResType.SKILL_POINT,10,false,false) and CardRoleManager:checkRoleCanSkillUp(cardRole),"isSkillPointFull",ccp(0,0))
            end
        end

        if not  self.nTimerId then
            self.nTimerId = TFDirector:addTimer(1000, -1, nil, self.onUpdated);
        end
    end



    self.MartialLearnEventCallBak = function(event)
    
        if self.isShow == false then
            return
        end
        -- 直接就能学习的
        local bookIndex = event.data[1].bookIndex

        self:addLearnBookEffect(bookIndex)
    end
    TFDirector:addMEGlobalListener(MartialManager.MSG_MartialLearn ,self.MartialLearnEventCallBak )


    self.OneKeyEquipMartialResult = function(event)
        -- 直接就能学习的
        if self.isShow == false then
            return
        end

        self:refreshUI()
        local posList = event.data[1].posList
        for i=1,#posList do
            self:addLearnBookEffect(posList[i])
        end
    end
    TFDirector:addMEGlobalListener(MartialManager.OneKeyEquipMartialResult ,self.OneKeyEquipMartialResult )

end


function RoleInfoLayer_py:removeEvents()
    if self.nTimerId then
        TFDirector:removeTimer(self.nTimerId)
        self.nTimerId = nil
        self.onUpdated = nil
    end
--    TFDirector:removeMEGlobalListener(CardRoleManager.ROLE_PRACTICE_RESULT,self.RoleStarUpResultCallBack)
--    self.RoleStarUpResultCallBack = nil

    TFDirector:removeMEGlobalListener(MartialManager.MSG_MartialLearn ,self.MartialLearnEventCallBak )
    self.MartialLearnEventCallBak = nil

    TFDirector:removeMEGlobalListener(MartialManager.OneKeyEquipMartialResult ,self.OneKeyEquipMartialResult )
    self.OneKeyEquipMartialResult = nil

    self.super.removeEvents(self)
end


function RoleInfoLayer_py.onCloseClickHandle(sender)
    local self = sender.logic

    if (self.img_select) then
        self:removeSelectIcon()
        self:closeEquipListLayer()
       return
    end 
    AlertManager:close(AlertManager.TWEEN_1)
end


function RoleInfoLayer_py.BtnClickHandle(sender)
    local self  = sender.logic

end


function RoleInfoLayer_py:setCardRole(cardRole)
    self.cardRole = cardRole

    if cardRole then
        self.roleGmid = cardRole.gmId
    end
end


function RoleInfoLayer_py.onTrainClickHandle(sender)
    -- if MainPlayer:getLevel() < 15 then
    --     toastMessage("团队等级达到15级开启")
    --     return
    -- end

    local teamLev   = MainPlayer:getLevel()
    local openLevel = FunctionOpenConfigure:getOpenLevel(202)
    --  等级开发之后奇遇才会有红点
    if openLevel > teamLev then
        --toastMessage("团队等级达到"..openLevel.."级开启")
        toastMessage(stringUtils.format(localizable.common_function_openlevel,openLevel))       

        return
    end

    local self = sender.logic

    --埋点id:28 选择侠客点击经脉培养
    local PlayerGuideMgr = require("lua.gamedata.PlayerGuideManager")
    if (PlayerGuideMgr.now_step == 902) then
        TFDirector:send(c2s.DATA_COLLECT_REQUEST, {28})  
    end
    -- CardRoleManager:openTrainLayer(self.cardRole.gmId)
    CardRoleManager:openTrainLayerNew(self.cardRole.gmId, self.logic.roleList,self.fightType)
end

-- function RoleInfoLayer_py.onBookClickHandle(sender)
--     local self = sender.logic

-- end

function RoleInfoLayer_py.onTransferClickHandle(sender)
    local teamLev   = MainPlayer:getLevel()
    local openLevel = FunctionOpenConfigure:getOpenLevel(204)
    --  等级开发之后奇遇才会有红点
    if openLevel > teamLev then
        --toastMessage("团队等级达到"..openLevel.."级开启")
        toastMessage(stringUtils.format(localizable.common_function_openlevel,openLevel))       
        return
    end
    local self = sender.logic
    -- CardRoleManager:openRoleTransferLayer( self.cardRole.gmId )
    CardRoleManager:openRoleTransferLayerNew(self.cardRole.gmId, self.logic.roleList,self.fightType)
end

function RoleInfoLayer_py.onUpStarClickHandle(sender)

    local teamLev   = MainPlayer:getLevel()
    local openLevel = FunctionOpenConfigure:getOpenLevel(203)
    --  等级开发之后奇遇才会有红点
    if openLevel > teamLev then
        --toastMessage("团队等级达到"..openLevel.."级开启")
        toastMessage(stringUtils.format(localizable.common_function_openlevel,openLevel))       

        return
    end
    local self = sender.logic

    --quanhuan test
    if 1 then
        local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.RoleStarUpPreviewLayer");
        if self.btn_jnzs:isVisible() then
            layer:setDataInTupu(self.cardRole)
        else
            layer:SetData(self.cardRole.gmId)
        end
        AlertManager:show();
        return
    end
    -- if 1 then
    --     self:testStarUp()
    --     return
    -- end

    -- if self.cardRole:getHaveSoulNum() < self.cardRole:getUpstarNeedSoulNum() then
    --     CommonManager:showNeedRoleComfirmLayer()
    --     return
    -- end

    if self.cardRole:getHaveSoulNum() < self.cardRole:getUpstarNeedSoulNum() then

        if self.cardRole:getIsMainPlayer() then
            self:gotoEmploy()
        else
            CommonManager:showNeedRoleComfirmLayer()
        end
        return
    end



    self.oldarr = {}
    --角色属性
    for i=1,EnumAttributeType.Max do
        self.oldarr[i] = self.cardRole:getTotalAttribute(i)
    end

    self.old_quality = self.cardRole.quality
    self.old_starlevel = self.cardRole.starlevel
    self.old_power = self.cardRole.power
    CardRoleManager:roleStarUp( self.cardRole.gmId  )

end

-- 进阶按钮事件
function RoleInfoLayer_py.onSkillClickHandle(sender)
    local teamLev   = MainPlayer:getLevel()
    local openLevel = FunctionOpenConfigure:getOpenLevel(201)
    --  等级开发之后奇遇才会有红点
    if openLevel > teamLev then
        --toastMessage("团队等级达到"..openLevel.."级开启")
        toastMessage(stringUtils.format(localizable.common_function_openlevel,openLevel))       

        return
    end
    local self = sender.logic
    if self.cardRole:getIsMainPlayer() then
        CardRoleManager:openMainSkillListLayer( self.cardRole.gmId )
    else
        CardRoleManager:openRoleSkillListLayer( self.cardRole.gmId )
    end
end

-- 三个技能事件
function RoleInfoLayer_py.onSkillItemClickHandle(sender)
    local self = sender.logic
    local index = sender.index
    if sender.level ~= -1 then
        if self.cardRole:getIsMainPlayer() then
           local spellInfoConfig = sender.spellInfoConfig
           local spellInfo = spellInfoConfig:GetSpellInfo()
            --<<<<<<<<<<<<<<<<<<<技能替换判断
            local replaceSkillId
            if index == 4 then
                 replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id ,self.cardRole.skillStarLevel)               
            else
                 replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id)
            end

            if replaceSkillId ~= spellInfo.id then
                spellInfo = SkillBaseData:objectByID(replaceSkillId)
            end       
            -->>>>>>>>>>>>>>>>>>>>

           local spellLevelInfo = spellInfo:GetLevelItem(sender.level)
           CardRoleManager:openSkillInfo(self.cardRole.id, spellInfo,spellLevelInfo,index,self.cardRole.XinFaSpecialAttribute )
        else
            local spellInfo = sender.spellInfo
            --<<<<<<<<<<<<<<<<<<<技能替换判断
            local replaceSkillId
            if index == 4 then
                replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id ,self.cardRole.skillStarLevel)               
            else
                replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id)
            end
            if replaceSkillId ~= spellInfo.id then
                spellInfo = SkillBaseData:objectByID(replaceSkillId)
            end       
            -->>>>>>>>>>>>>>>>>>>>
           local spellLevelInfo = spellInfo:GetLevelItem(sender.level)            
           CardRoleManager:openSkillInfo(self.cardRole.id, spellInfo,spellLevelInfo ,index,self.cardRole.XinFaSpecialAttribute)
        end
    else
        if self.cardRole:getIsMainPlayer() then
           local spellInfoConfig = sender.spellInfoConfig
           local spellInfo = spellInfoConfig:GetSpellInfo()
            --<<<<<<<<<<<<<<<<<<<技能替换判断
            local replaceSkillId
            if index == 4 then
                 replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id ,self.cardRole.skillStarLevel)               
            else
                 replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id)
            end
            if replaceSkillId ~= spellInfo.id then
                spellInfo = SkillBaseData:objectByID(replaceSkillId)
            end       
            -->>>>>>>>>>>>>>>>>>>>           
           local spellLevelInfo = spellInfo:GetLevelItem(1)
           CardRoleManager:openSkillInfo(self.cardRole.id, spellInfo,spellLevelInfo,index,self.cardRole.XinFaSpecialAttribute )
        else
           local spellInfo = sender.spellInfo;
            --<<<<<<<<<<<<<<<<<<<技能替换判断
            local replaceSkillId
            if index == 4 then
                 replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id ,self.cardRole.skillStarLevel)               
            else
                 replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id)
            end
            if replaceSkillId ~= spellInfo.id then
                spellInfo = SkillBaseData:objectByID(replaceSkillId)
            end       
            -->>>>>>>>>>>>>>>>>>>>           
           local spellLevelInfo = spellInfo:GetLevelItem(1)
           CardRoleManager:openSkillInfo(self.cardRole.id, spellInfo,spellLevelInfo ,index, self.cardRole.XinFaSpecialAttribute)

        end
    end

end

function RoleInfoLayer_py:isLearnAllMartial()
    for i=1,6 do
        status = self.bookStatus[i]
        if status ~= 5 then
            return false
        end
    end
    return true
end

function RoleInfoLayer_py.onQianXiuClickHandle(sender)
    local self = sender.logic
    QianXiuManager:openQianXiuLayer(self.cardRole.gmId, self.logic.roleList,self.fightType)
end
function RoleInfoLayer_py.onTianMingClickHandle(sender)
    local self = sender.logic
    TianMingManager:openTianMingLayer(self.cardRole.gmId, self.logic.roleList,self.fightType)
end
function RoleInfoLayer_py.onJinJieClickHandle(sender)
    local self = sender.logic
    -- -- toastMessage("点击了进阶")
    -- self:showJinjieEffect()
    -- if 1 then
    --     return
    -- end
    if self:isLearnAllMartial() then
        self:roleJinJie()
    else
        local vipLevel = VipData:getMinLevelDeclear(4008)
        if MainPlayer:getVipLevel() < vipLevel then
            local msg =  stringUtils.format(localizable.vip_yiJianXiDe_not_enough,vipLevel);
            CommonManager:showOperateSureLayer(
                    function()
                        PayManager:showPayLayer();
                    end,
                    nil,
                    {
                    title = localizable.common_vip_up,
                    msg = msg,
                    uiconfig = "lua.uiconfig_mango_new.common.NeedTpPayLayer"
                    }
            )
            return
        end
        local hasEquip = false
        for i=1,6 do
            local status = self.bookStatus[i]
            if status == 1 or status == 3 then
                hasEquip = true
            end
        end

        -- self.costOneKeyEquip

        if hasEquip then
            self.costOneKeyEquip = self.costOneKeyEquip or 0

            if self.costOneKeyEquip == 0 then
                MartialManager:RequestOneKeyEquipMartial(self.cardRole.gmId)
            else
                --local warningMsg = "本次一键习得总计花费"..self.costOneKeyEquip.."铜币进行武学合成，是否继续？"
                local warningMsg =stringUtils.format(localizable.roleInfoLayer_py_yijian, self.costOneKeyEquip)
                CommonManager:showOperateSureLayer(
                        function()

                            if self.costOneKeyEquip > MainPlayer:getCoin() then
                                --toastMessage("铜币不足，无法完成武学合成")
                                toastMessage(localizable.roleInfoLayer_py_not)
                                return
                            end
                            MartialManager:RequestOneKeyEquipMartial(self.cardRole.gmId)
                        end,
                        nil,
                        {
                            msg = warningMsg
                        }
                )
            end
        else
            toastMessage(localizable.No_Acquisition_Techniques)
        end
    end

end

function RoleInfoLayer_py:oneBtnToLearn()
    MartialManager:requestMartialLevelUp(self.cardRole)
end
function RoleInfoLayer_py:roleJinJie()
    -- 武学等级 wuxue.MaxLevel
    local MaxLevel = ConstantData:getValue("wuxue.MaxLevel")
    local martialLevel = self.cardRole.martialLevel
    if martialLevel >= MaxLevel then
    --toastMessage("您的武学已达到最高等级")
    toastMessage(localizable.roleInfoLayer_py_max)
    return
    end

    for i=1,6 do
        status = self.bookStatus[i]

        if status ~= 5 then
            --toastMessage("习得全部六本武学秘籍后才可进阶")
            toastMessage(localizable.roleInfoLayer_py_condition)
            return
        end
    end
    self.logic:beginMartialLevelUp()
    MartialManager:requestMartialLevelUp(self.cardRole)
end


function RoleInfoLayer_py:refreshSkillInfo()
    local skillNumber = 3
    local panelSkillNode = self.panel_fight_skill
    self.panel_fight_skill:setVisible(false)
    self.panel_fight_skill2:setVisible(false)

    --6星卡牌或者有机会升到6星卡牌 显示4个技能 
    local bQualityUp = false
    if self.cardRole.quality == 6 or (self.cardRole.quality == 5 and CardRoleManager:getShengPingByCard(self.cardRole)) then
        bQualityUp = true
        skillNumber = 4
        panelSkillNode = self.panel_fight_skill2
    end

    panelSkillNode:setVisible(true)
    
    local node_skillList = {}
    local img_skillList = {}
    local txt_skillLevelList = {}
    local img_openQualityList = {}

    for i=1,skillNumber do
        node_skillList[i]   =  TFDirector:getChildByPath(panelSkillNode,"btn_jinengkuang" .. i)
        node_skillList[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSkillItemClickHandle))
        node_skillList[i].logic = self
        node_skillList[i].index = i

        img_skillList[i]   =  TFDirector:getChildByPath(node_skillList[i],"img_skill")
        txt_skillLevelList[i]   =  TFDirector:getChildByPath(node_skillList[i],"txt_lv")
        img_openQualityList[i]   =  TFDirector:getChildByPath(node_skillList[i],"img_jiesuo")
    end

    if (not self.cardRole:getIsMainPlayer()) then
        -- local openQuality = {QUALITY_DING,QUALITY_YI,QUALITY_JIA}
        -- 1, 2, 2, 3, 3, 3, 4, 4, 4
        -- local openQuality = {1,2,4}
        local openQuality = EnumSkillLock

        for index=1,skillNumber do
                    
            node_skillList[index].level = -1
            local spellInfo = self.cardRole.spellInfoList:objectAt(index)
            if spellInfo then
                --<<<<<<<<<<<<<<<<<<<技能替换判断
                local replaceSkillId
                if index == 4 then --
                    replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id ,self.cardRole.skillStarLevel)
                else
                    replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id)
                end
                if replaceSkillId ~= spellInfo.id then
                    local replaceSpellInfo = SkillBaseData:objectByID(replaceSkillId)
                    img_skillList[index]:setTexture(replaceSpellInfo:GetPath()) 
                else
                    img_skillList[index]:setTexture(spellInfo:GetPath()) 
                end
                -->>>>>>>>>>>>>>>>>>>>>>>>>>
                node_skillList[index]:setVisible(true);

                -- 
                if self.cardRole.martialLevel < openQuality[index] then
                    img_skillList[index]:setColor(ccc3(166, 166, 166))
                    -- node_skillList[index].des =QUALITY_STR[openQuality[index]] .. "品解锁"
                    --node_skillList[index].des = EnumWuxueLevelType[openQuality[index]] .. "重解锁"                    
                    node_skillList[index].des = stringUtils.format(localizable.roleInfoLayer_py_unlock, EnumWuxueLevelType[openQuality[index]])                    
                    txt_skillLevelList[index]:setVisible(true)
                    img_openQualityList[index]:setVisible(false)
                    -- img_openQualityList[index]:setTexture(GetFontSmallByQuality(openQuality[index]))
                    txt_skillLevelList[index]:setText(node_skillList[index].des)
                    img_skillList[index]:setGrayEnabled(true)
                else
                    local levelInfo = nil

                    if self.cardRole.spellLevelIdList then
                        for i,levelId in pairs(self.cardRole.spellLevelIdList) do
                            local levelItem = SkillLevelData:objectByID(levelId)
                            if spellInfo.id == levelId.skillId or replaceSkillId == levelId.skillId then
                                levelInfo = levelItem
                            end
                        end
                    end


                    local level = 1
                    if levelInfo then
                        level = levelInfo.level
                    end
                    if self.type == LayerType.fengyunluType then
                        level = 150
                    end
                    img_skillList[index]:setColor(ccc3(255, 255, 255))
                    txt_skillLevelList[index]:setVisible(true)
                    img_openQualityList[index]:setVisible(false)
                    txt_skillLevelList[index]:setText("LV：" .. level)

                    node_skillList[index].level = level
                    print("LV：" .. level)
                    img_skillList[index]:setGrayEnabled(false)
                end

                --单独处理 角色第四个技能
                if self.type ~= LayerType.fengyunluType and bQualityUp and index == 4 and self.cardRole.quality < 6 then 
                    img_skillList[index]:setColor(ccc3(166, 166, 166))                  
                    node_skillList[index].des = localizable.RoleInfoLayer_py_red                  
                    txt_skillLevelList[index]:setVisible(true)
                    img_openQualityList[index]:setVisible(false)
                    txt_skillLevelList[index]:setText(node_skillList[index].des)
                    img_skillList[index]:setGrayEnabled(true)
                end
                node_skillList[index].spellInfo = spellInfo
            else
                node_skillList[index]:setVisible(false)
            end
        end
    end


    if self.cardRole:getIsMainPlayer() then
    
        local tempSpellInfoConfigList = TFArray:new()
        local tempLevelList  = TFArray:new();
        -- local skillNumber = 3
        local level = 1
                
        for index=1,skillNumber do
            local spellInfoConfig = self.cardRole.leadingSpellInfoConfigList:objectAt((index - 1)*3 + 1)
                         
            if spellInfoConfig then 
                if self.cardRole.leadingRoleSpellList then
                    if index == 4 then
                        local tempSpellInfoConfig = self.cardRole.leadingSpellInfoConfigList:objectAt(10)
                        if tempSpellInfoConfig then 
                            for i,spell in pairs(self.cardRole.leadingRoleSpellList) do
                                if tempSpellInfoConfig.spell_id == spell.spellId.skillId and spell.choice then
                                    spellInfoConfig = tempSpellInfoConfig
                                    level = spell.spellId.level
                                end
                            end
                        end
                    else
                        for i=(index - 1)*3 + 1,(index - 1)*3 + 3 do
                            local tempSpellInfoConfig = self.cardRole.leadingSpellInfoConfigList:objectAt(i)
                            if tempSpellInfoConfig then 
                                for i,spell in pairs(self.cardRole.leadingRoleSpellList) do
                                    if tempSpellInfoConfig.spell_id == spell.spellId.skillId and spell.choice then
                                        spellInfoConfig = tempSpellInfoConfig
                                        level = spell.spellId.level
                                    end
                                end
                            end
                        end
                    end
                end
            end
            tempSpellInfoConfigList:push(spellInfoConfig)
            tempLevelList:push(level)
        end
        --
        --node_skillList[4]:setVisible(false)
        for index=1,skillNumber do
            node_skillList[index].level = -1
            local spellInfoConfig = tempSpellInfoConfigList:objectAt(index)
            local level = tempLevelList:objectAt(index)
            node_skillList[index]:setVisible(false)
      
            if spellInfoConfig then
                 img_openQualityList[index]:setVisible(false)

                local spellInfo = SkillBaseData:objectByID(spellInfoConfig.spell_id)
                
                if spellInfo then
                    node_skillList[index]:setVisible(true)
                    --<<<<<<<<<<<<<<<<<<<技能替换判断
                    local replaceSkillId = CardRoleManager:isSkillReplace(self.cardRole.id, self.cardRole.starlevel, spellInfo.id)
                    if replaceSkillId ~= spellInfo.id then
                        local replaceSpellInfo = SkillBaseData:objectByID(replaceSkillId)
                        img_skillList[index]:setTexture(replaceSpellInfo:GetPath()) 
                    else
                        img_skillList[index]:setTexture(spellInfo:GetPath()) 
                    end
                    -->>>>>>>>>>>>>>>>>>>>>>>>>>

                    -- if not spellInfoConfig:GetQualityIsOpen(self.cardRole.quality)then
                    if index == 4 then
                        --单独处理 角色第四个技能
                        if  self.cardRole.quality < 6 then 
                            img_skillList[index]:setColor(ccc3(166, 166, 166))                  
                            node_skillList[index].des = localizable.RoleInfoLayer_py_red                  
                            txt_skillLevelList[index]:setVisible(true)
                            img_openQualityList[index]:setVisible(false)
                            txt_skillLevelList[index]:setText(node_skillList[index].des)
                            img_skillList[index]:setGrayEnabled(true)
                        else 
                            img_skillList[index]:setColor(ccc3(255, 255, 255))
                            node_skillList[index].level = level

                            txt_skillLevelList[index]:setVisible(true)
                            img_openQualityList[index]:setVisible(false)
                            txt_skillLevelList[index]:setText("LV：" .. level)
                                                    
                            img_skillList[index]:setGrayEnabled(false)
                        end    
                        -- print("LV：" .. level)
                    elseif not spellInfoConfig:GetQualityIsOpen(self.cardRole.martialLevel)then
                        img_skillList[index]:setColor(ccc3(166, 166, 166))
                        -- node_skillList[index].des = QUALITY_STR[spellInfoConfig.enable_quality] .. "品解锁"
                        node_skillList[index].des =stringUtils.format(localizable.roleInfoLayer_py_unlock, EnumWuxueLevelType[spellInfoConfig.enable_quality] )

                        txt_skillLevelList[index]:setVisible(false)
                        img_openQualityList[index]:setVisible(true)
                        -- img_openQualityList[index]:setTexture(GetFontByQuality(spellInfoConfig.enable_quality))

                        -- modify by king
                        img_openQualityList[index]:setVisible(false)
                        txt_skillLevelList[index]:setVisible(true)
                        txt_skillLevelList[index]:setText(node_skillList[index].des)

                        img_skillList[index]:setGrayEnabled(true)
                        -- print(node_skillList[index].des)
                    elseif not spellInfoConfig:GetLevelIsOpen(self.cardRole.level) then


                        img_skillList[index]:setColor(ccc3(166, 166, 166));
                        --node_skillList[index].des = spellInfoConfig.enable_level .. "级解锁"
                        node_skillList[index].des =stringUtils.format(localizable.common_level_unlock, spellInfoConfig.enable_level )

                        txt_skillLevelList[index]:setVisible(true);
                        img_openQualityList[index]:setVisible(false);
                        --txt_skillLevelList[index]:setText(spellInfoConfig.enable_level .. "级解锁");
                        txt_skillLevelList[index]:setText(stringUtils.format(localizable.common_level_unlock, spellInfoConfig.enable_level ));

                        img_skillList[index]:setGrayEnabled(true)
                        -- print(spellInfoConfig.enable_level .. "级解锁")  
                    else                  
                        img_skillList[index]:setColor(ccc3(255, 255, 255))
                        node_skillList[index].level = level

                        txt_skillLevelList[index]:setVisible(true)
                        img_openQualityList[index]:setVisible(false)
                        txt_skillLevelList[index]:setText("LV：" .. level)
                                                
                        img_skillList[index]:setGrayEnabled(false)
                    end
                    node_skillList[index].spellInfoConfig = spellInfoConfig
                end
            end
        end
    end
end


function RoleInfoLayer_py:setDefualtVisible()
    self.btn_train:setVisible(true)
    self.btn_transfer:setVisible(true)
    self.btn_upStar:setVisible(true)
    self.btn_skill:setVisible(true)
    self.btn_jinjie:setVisible(true)
    self:showQianXiuBtn()
    self:showTianMingBtn()
    --self.btn_qianxiu:setVisible(true)
    local canCX = false
    local canupStar = false
    if self.type == "self" then
        canCX = CardRoleManager:checkRoleCanChongXue(self.cardRole)
        canupStar = CardRoleManager:isCanStarUp(self.cardRole.gmId)
    end
    CommonManager:updateWidgetState(self.btn_train,202,canCX)
    CommonManager:updateWidgetState(self.btn_transfer,204,false)
    CommonManager:updateWidgetState(self.btn_upStar,203,canupStar)
    CommonManager:updateWidgetState(self.btn_skill,201,false)
end

function RoleInfoLayer_py:showQianXiuBtn()
    local isOpenQianXiu = true
    local verLock = VersionLockData:objectByID(EnumVersionLockType.QianXiu_Lock)
    if verLock and verLock.open == 0 then
        isOpenQianXiu = false
    end
    if isOpenQianXiu == true and self.type == 'self' and self.cardRole and self.cardRole.quality >= 4 then
        local openLevel = FunctionOpenConfigure:getOpenLevel(2206)
        if MainPlayer:getLevel() >= openLevel then
            self.btn_qianxiu:setVisible(true)
            return
        end
    end
    self.btn_qianxiu:setVisible(false)
end
function RoleInfoLayer_py:showTianMingBtn()
    if self.type == 'self' and self.cardRole and self.cardRole.quality >= 4 then
        local openLevel = FunctionOpenConfigure:getOpenLevel(2233)
        if MainPlayer:getLevel() >= openLevel and MainPlayer:getServerSwitchStatue(ServerSwitchType.TianMing) then
            self.btn_tianming:setVisible(true)
            for i = 1,9 do
                local bool = TianMingManager:JudgeTianMingUpgrade(self.cardRole.TianMing[i].id) 
                if bool == true then
                    CommonManager:setRedPoint(self.btn_tianming, true,"isTianMingbtn",ccp(0,0))
                    return
                end
                CommonManager:setRedPoint(self.btn_tianming, false,"isTianMingbtn",ccp(0,0))
            end
            return
        end
    end
    self.btn_tianming:setVisible(false)
end
function RoleInfoLayer_py:setBtnOpenByLevel( widget , funcId )
    local openLevel = FunctionOpenConfigure:getOpenLevel(funcId)
    if MainPlayer:getLevel() < openLevel then
        widget:setGrayEnabled(true)
        widget:setClickMoveEnabled(true)
    else
        widget:setGrayEnabled(false)
        widget:setClickHighLightEnabled(true)
    end
end

function RoleInfoLayer_py:setOtherVisible()
    if self.type == "other" or self.type == LayerType.fengyunluType then
        self.btn_train:setVisible(false)
        self.btn_transfer:setVisible(false)
        --self.btn_upStar:setVisible(false)
        self.btn_skill:setVisible(false)
        self.btn_jinjie:setVisible(false)
        self.btn_qianxiu:setVisible(false)
    end
end

function RoleInfoLayer_py:onUpStarUpCompelete()
    local layer =  AlertManager:addLayerByFile("lua.logic.role_new.RoleStarUpResultLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(self.cardRole.gmId,self.oldarr,self.old_power)
    layer:setOldValue(self.old_quality, self.old_starlevel)

    AlertManager:show()
end

function RoleInfoLayer_py:drawBookWithIndex(index, bookList, martialList)
    -- self.cardRole
    -- 获取当前位置显示的书
    -- 没有则显示灰底色
    -- icon也是灰色的
    -- 描述的类型
    local bookid   = bookList[index]
    local bookInfo = MartialData:objectByID(bookid)
    local bgPic    = "ui_new/role/bg_book_empty.png"
    local bGray    = true
    local quality  = bookInfo.goodsTemplate.quality  -- 品质
    local id       = bookInfo.goodsTemplate.id

    local martialLevel = -1

    -- 该位置有书装备
    if martialList[index] ~= nil then
        bGray = false

        bgPic = getBookBackgroud(quality)
        self.img_DescList[index]:setVisible(false)
        self.bookStatus[index] = 5

        self.img_BookList[index]:setOpacity(255)

        martialLevel = martialList[index].enchantLevel

    -- 没有书
    else
        self.img_DescList[index]:setVisible(true)
        if self.type == "self" then
            self.bookStatus[index] = self:getBookStatus(bookInfo)
        else
            self.bookStatus[index] = 0
        end
        self:drawBookDesc(self.img_DescList[index], self.bookStatus[index])


        self.img_BookList[index]:setOpacity(100)
    end

    self.img_BookList[index]:setTexture(bookInfo.goodsTemplate:GetPath())
    self.img_bgList[index]:setTextureNormal(bgPic)
    -- self.img_BookList[index]:setGrayEnabled(bGray)

    -- 绘制星级
    local starList = self.bookStarList[index]
    for i=1,5 do
        local star = starList[i]
        if star then
            if martialLevel >= i then
                star:setVisible(true)
            else
                star:setVisible(false)
            end
        end
    end

end

function RoleInfoLayer_py:refreshJinjieInfo()

    -- 武学等级
    local martialLevel = self.cardRole.martialLevel
    local martialList  = self.cardRole.martialList
    if self.type == LayerType.fengyunluType then
        martialLevel = 15
    end
    -- local bookList     = MartialRoleConfigure:findByRoleIdAndMartialLevel(self.cardRole.id, martialLevel):getMartialTable()

    -- print("martialLevel = ", martialLevel)
    -- print("martialList = ", martialList)
    -- print("self.cardRole.id = ", self.cardRole.id)
    local bookListData     = MartialRoleConfigure:findByRoleIdAndMartialLevel(self.cardRole.id, martialLevel)

    local bookList     = bookListData:getMartialTable()

    self.bookList = bookList
    -- self.txt_miji:setText("武学等级"..martialLevel)
   self.txt_miji:setText(EnumWuxueDescType[martialLevel])
   -- 等级描述
   --self.txt_mijilevel:setText("武学"..EnumWuxueLevelType[martialLevel].."重")
   self.txt_mijilevel:setText(stringUtils.format(localizable.roleInfoLayer_py_wuxue, EnumWuxueLevelType[martialLevel]))
   -- self.img_level:setTexture("ui_new/role/bg-w" .. EnumWuxueBGType[martialLevel] .. ".png")

   -- self.txt_mijilevel:setColor(EnumWuxueColorType[martialLevel])
   self.txt_miji:setColor(ccc3(195,94,55))
   print("martialLevel = ", martialLevel)
   self.txt_wuxueNum:setText(martialLevel)

    -- 秘籍
    for i=1,6 do
        self:drawBookWithIndex(i, bookList, martialList)
    end

    -- 观察其他玩家信息的时候不能点击
    if self.type == "other" or self.type == LayerType.fengyunluType then
        for i=1,6 do
            self.img_bgList[i]:setTouchEnabled(false)
        end
        return
    elseif self.type == "self" then
        for i=1,6 do
            self.img_bgList[i]:setTouchEnabled(true)
        end
    end

    self.costOneKeyEquip = 0
    local nBookNum = 0
    for i=1,6 do
        status = self.bookStatus[i]
        if status == 5 then
            nBookNum = nBookNum + 1

        elseif status == 3 or status == 1 then
            local bookid = self.bookList[i]
            local bookInfo      = MartialData:objectByID(bookid)

            if bookInfo then
                self.costOneKeyEquip = self.costOneKeyEquip + bookInfo.copper
            end
        end
    end

    -- if PlayerGuideManager:IsGuideFunctionOpen(11001) == false and nBookNum == 6 then
    --     PlayerGuideManager:ShowGuideStep(11001)
    --     PlayerGuideManager:SaveFunctionOpenGuide(11001)
    -- end



    if nBookNum == 6 then
        self.btn_jinjie:setTextureNormal("ui_new/role/jsxx_jinjie_btn.png")
    else
        self.btn_jinjie:setTextureNormal("ui_new/role/btn_yijian.png")
    end

    local martialLevel = self.cardRole.martialLevel

    local MaxLevel = ConstantData:getValue("wuxue.MaxLevel")
    
    -- 开启进阶特效
    if nBookNum == 6 and martialLevel < MaxLevel then
        self:addXieDeEffect(true)
    else
        self:addXieDeEffect(false)
        CommonManager:setRedPoint(self.btn_jinjie, false,"isCanXiDe",ccp(5,5))
    end
    if nBookNum ~= 6 then
        local hasEquip = false
        local vipLevel = VipData:getMinLevelDeclear(4008)
        if MainPlayer:getVipLevel() >= vipLevel then
            for i=1,6 do
                status = self.bookStatus[i]
                if status == 1 or status == 3 then
                    hasEquip = true
                end
            end
        end
        if hasEquip then
            self:addXieDeEffect(true)
            CommonManager:setRedPoint(self.btn_jinjie, true,"isCanXiDe",ccp(5,5))
        else
            self:addXieDeEffect(false)
            CommonManager:setRedPoint(self.btn_jinjie, false,"isCanXiDe",ccp(5,5))
        end
    end
end

-- function RoleInfoLayer_py:getBookBackgroud(quality)
--     local bgPic    = "ui_new/role/bg_book_empty.png"

--     if quality == 4 then
--         bgPic    = "ui_new/role/bg_book_jia.png"
--     elseif quality == 3 then
--         bgPic    = "ui_new/role/bg_book_yi.png"
--     elseif quality == 2 then
--         bgPic    = "ui_new/role/bg_book_bing.png"
--     elseif quality == 1 then
--         bgPic    = "ui_new/role/bg_book_ding.png"
--     end

--     return bgPic
-- end

function RoleInfoLayer_py:getBookStatus(bookInfo)
    
    -- 0 不存在
    -- 1 背包存在并且可以穿戴
    -- 2 背包存在并且不可以穿戴
    -- 3 可以合成并且可以穿戴
    -- 4 可以合成并且不可以穿戴
    local bookStatus = 0

    local roleLevel = self.cardRole.level
    local id        = bookInfo.goodsTemplate.id
    local bag       = BagManager:getItemById(id)
    local bookLevel = bookInfo.goodsTemplate.level

    -- 背包中存在
    if bag then
        bookStatus = 1
    else
        if MartialManager:isCanSynthesisById(id, 1) then
            bookStatus = 3
        end
    end

    -- 穿戴等级
    -- 有物品 才判断等级
    if bookLevel > roleLevel and bookStatus > 0 then
        bookStatus = bookStatus + 1
    end

    return bookStatus
end



function RoleInfoLayer_py:drawBookDesc(bookDesc, bookStatus)
    
    local path = "ui_new/role/icon_miji_s"..bookStatus..".png"

    bookDesc:setTextureNormal(path)
end


function RoleInfoLayer_py.onBookClickHandle(sender)
    local self   = sender.logic
    local index  = sender.index
    local status = self.bookStatus[index]
    -- toastMessage("点击了第"..index.."本书  状态："..status)

    if self.logic then
        local effectIsCompelete = self.logic:getJinjieEffectResult()
        if effectIsCompelete == false then
            return
        end
    end

    if status == 5 then
        -- toastMessage("你已经习得了这本书")
        local layer  = AlertManager:addLayerByFile("lua.logic.rolebook.RoleBook_Enchant", AlertManager.BLOCK_AND_GRAY_CLOSE, AlertManager.TWEEN_1)
        layer:loadData(self.cardRole, index)
        AlertManager:show() 
        return
    else
        local layer  = AlertManager:addLayerByFile("lua.logic.rolebook.RoleBook_OnEquip", AlertManager.BLOCK_AND_GRAY_CLOSE, AlertManager.TWEEN_1)
        layer:loadData(self.cardRole, index)
        AlertManager:show() 
    end
end

function RoleInfoLayer_py.onShowSkillHandle(sender)
    local self = sender.logic

    FightManager:BeginSkillShowFight(self.cardRole.id)
end
function RoleInfoLayer_py.onShowRedSkillHandle(sender)
    local self = sender.logic

    FightManager:BeginRedSkillShowFight(self.cardRole.id)
end

function RoleInfoLayer_py.onGetWayHandle(sender)
    local self = sender.logic

    IllustrationManager:showOutputList({roleId = self.cardRole.id})
end
function RoleInfoLayer_py:isHasRedSkill()
    local verLock = VersionLockData:objectByID(EnumVersionLockType.RedCardRole_Lock)
    if verLock and verLock.open == 0 then
        return false
    end
    local roleId = self.cardRole.id
    local roleInfo = RoleData:objectByID(roleId)
    if roleInfo and roleInfo.skill_2 and roleInfo.skill_2 ~= 0 then
        local skillInfo = SkillBaseData:objectByID(roleInfo.skill_2)
        if skillInfo and skillInfo.trigger_anger > -1 then
            return true
        end
    end
    return false
end

function RoleInfoLayer_py:showTuPuButton(bDisplay)
    self.btn_hqutj:setVisible(bDisplay)
    self.btn_jnzs:setVisible(bDisplay)
    self.bShowTuPu = bDisplay
    if bDisplay and self:isHasRedSkill() then
        self.btn_szzs:setVisible(bDisplay)
    else
        self.btn_szzs:setVisible(false)
    end
    if bDisplay == true then
        self.btn_upStar:setVisible(true)
        CommonManager:setRedPoint(self.btn_upStar, false,"isCanStarUp",ccp(5,5),1201)
        self:addBtnEffect(self.btn_upStar, false)
    end
    if self.type == "other" then
        print("self.bShowTuPu=-",self.bShowTuPu)
        if self.bShowTuPu then
            self.btn_upStar:setVisible(true)
        else
            self.btn_upStar:setVisible(false)
        end
    else
        self.btn_upStar:setVisible(true)
    end
    self.btn_hqutj:setPosition(self.btn_train:getPosition())
    if self.type == LayerType.fengyunluType then
        self.btn_szzs:setVisible(false)
        self.btn_hqutj:setVisible(false)
        self.btn_jnzs:setVisible(false)
        self.btn_upStar:setVisible(false)
    end 
end


function RoleInfoLayer_py:showJinjieEffect()
    local effect = self.effect
    if effect == nil then
        local resPath = "effect/book_jinjie_effect.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        effect = TFArmature:create("book_jinjie_effect_anim")

        -- effect:setAnimationFps(GameConfig.ANIM_FPS)

        self.logic:addJinJieEffect(effect)
        --effect:setPosition(ccp(480, 320))

        -- effect:setAnchorPoint(ccp(0.5, 0.5))
        self.effect = effect
    end

    effect:playByIndex(0, -1, -1, 1)
end

function RoleInfoLayer_py:gotoEmploy()

    --toastMessage("请前往摩诃崖获取更多的主角侠魂")
    toastMessage(localizable.roleInfoLayer_py_goto)
    -- CommonManager:showOperateSureLayer(
    --     function()
    --         local teamLev   = MainPlayer:getLevel()
    --         local openLevel = FunctionOpenConfigure:getOpenLevel(601)

    --         if openLevel > teamLev then
    --             toastMessage("团队等级达到"..openLevel.."级开启")
    --             return
    --         end


    --     end,
    --     nil,
    --     {
    --         msg =  "前往摩诃崖\n是否确定继续传功？"
    --     }
    -- )
end


function RoleInfoLayer_py:addXieDeEffect(bOpen)
    if bOpen then
        if self.effect == nil then
            TFResourceHelper:instance():addArmatureFromJsonFile("effect/btn_common_small.xml")
            local effect = TFArmature:create("btn_common_small_anim")
            effect:setAnimationFps(GameConfig.ANIM_FPS)
            effect:playByIndex(0, -1, -1, 1)
            self.btn_jinjie:addChild(effect , 100)
            self.effect = effect
        end
    else
        if self.effect then
            self.effect:removeFromParent()
            self.effect = nil
        end
    end

end

function RoleInfoLayer_py:addBtnEffect(node, bAdd)
    if bAdd then
        if node.effect == nil then
            print("addBtnEffect")
            TFResourceHelper:instance():addArmatureFromJsonFile("effect/btn_common_small.xml")
            local effect = TFArmature:create("btn_common_small_anim")
            effect:setAnimationFps(GameConfig.ANIM_FPS)
            node:addChild(effect , 100)
            node.effect = effect
        end
            node.effect:playByIndex(0, -1, -1, 1)
    else
        if node.effect then
            node.effect:removeFromParent()
            node.effect = nil
        end
    end

end


function RoleInfoLayer_py:addLearnBookEffect(bookIndex)

    local node = self.img_bgList[bookIndex]
    if node == nil then
        return
    end

    local effect = node:getChildByTag(100)
    if effect == nil then
        local resPath = "effect/book_get_effect.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        effect = TFArmature:create("book_get_effect_anim")

        node:addChild(effect, 100)
        effect:setPosition(ccp(0, 0))
        effect:setTag(100)
        -- self.bookEquipeffect = effect

        effect:addMEListener(TFARMATURE_COMPLETE,function()
            effect:removeFromParentAndCleanup(true)
            -- self.bookEquipeffect = nil
            print("习得特效完成")
        end)
    end

    effect:playByIndex(0, -1, -1, 0)
end


function RoleInfoLayer_py:testStarUp()
    local cardRole1 = CardRoleManager.cardRoleList:objectAt(1);
    local cardRole2 = CardRoleManager.cardRoleList:objectAt(2);
    cardRole1.starlevel = 2
    local oldarr = {}
    --角色属性
    for i=1,EnumAttributeType.Max do
        oldarr[i] = cardRole2:getTotalAttribute(i);
    end

    local layer =  AlertManager:addLayerByFile("lua.logic.role_new.RoleStarUpResultLayer", AlertManager.BLOCK_AND_GRAY);
    layer:loadData(cardRole1.gmId ,oldarr, self.old_power)
    layer:setOldValue(cardRole1.quality, 1)
    -- layer:setOldValue(self.old_quality, self.old_starlevel)

    AlertManager:show()
end

function RoleInfoLayer_py:refreshMartialLevel(martialLevel)
    self.txt_wuxueNum:setText(martialLevel)
    self.txt_miji:setText(EnumWuxueDescType[martialLevel])
end
return RoleInfoLayer_py
