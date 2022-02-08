-- client side JiayuanFriendLayer.lua
--[[
 * @Description: 家园主界面
 ]]
-- script writer wuqi
-- creation time 2016-07-15

local JiayuanFriendLayer = class("JiayuanFriendLayer", BaseLayer)
local HelpDesc = localizable.InFriendLayerNew_desc;

JiayuanFriendLayer.kDaojuMaxNum = 4

JiayuanFriendLayer.DAOJU_ID = {30149, 30150, 30151, 30152}

function JiayuanFriendLayer:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.qiyu.FamilyBaseLayer")   
    self.attr_layer_show = false   
end

function JiayuanFriendLayer:initUI(ui)
    self.super.initUI(self, ui)
    
    self.btn_return = TFDirector:getChildByPath(ui, "btn_return")
    self.btn_return.logic = self
    self.btn_help = TFDirector:getChildByPath(ui, "btn_bangzu")
    self.btn_help.logic = self
    self.btn_zhuanpan = TFDirector:getChildByPath(ui, "btn_zp")
    self.btn_zhuanpan.logic = self
    self.btn_zhuanpan:setVisible(false)
    self.btn_jyzjc = TFDirector:getChildByPath(ui, "btn_jyzjc")
    self.btn_jyzjc.logic = self
    self.btn_hyph = TFDirector:getChildByPath(ui, "btn_hyph")
    self.btn_hyph.logic = self

    self.btn_fkjl = TFDirector:getChildByPath(ui, "btn_fkjl")
    self.btn_fkjl.logic = self

    self.panel_ac = TFDirector:getChildByPath(ui, "panel_ac")
    self.btn_baoxiang = TFDirector:getChildByPath(ui, "btn_baoxiang")
    self.btn_baoxiang:setVisible(false)

    self.btn_zan_1 = TFDirector:getChildByPath(ui, "btn_zan_1")
    self.btn_zan_1.logic = self
    --家园总加成
    self.panel_jyzjc = TFDirector:getChildByPath(ui, "panel_jyzjc")
    self.img_attr_di = TFDirector:getChildByPath(self.panel_jyzjc, "Img_bg")

    -- 基本属性
    local panel_arr = TFDirector:getChildByPath(ui, "panel_jingmaixiangqing")
    self.txt_arr_base = {}
    self.txt_arr_base[EnumAttributeType.Blood]   =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_qixue"),"txt_base")
    self.txt_arr_base[EnumAttributeType.Force]   =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_wuli"),"txt_base")
    self.txt_arr_base[EnumAttributeType.Defence] =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_fangyu"),"txt_base")
    self.txt_arr_base[EnumAttributeType.Magic]   =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_neili"),"txt_base")
    self.txt_arr_base[EnumAttributeType.Agility] =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_shenfa"),"txt_base")

    self.txt_arr_add = {}
    self.txt_arr_add[EnumAttributeType.Blood]   =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_qixue"),"txt_add")
    self.txt_arr_add[EnumAttributeType.Force]   =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_wuli"),"txt_add")
    self.txt_arr_add[EnumAttributeType.Defence] =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_fangyu"),"txt_add")
    self.txt_arr_add[EnumAttributeType.Magic]   =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_neili"),"txt_add")
    self.txt_arr_add[EnumAttributeType.Agility] =  TFDirector:getChildByPath(TFDirector:getChildByPath(panel_arr, "img_shenfa"),"txt_add")
    self.rightPanel_arr = TFDirector:getChildByPath(ui, "panel_attr")
    -- self.rightPanel_extendedArr  = TFDirector:getChildByPath(ui, "panel_extendedattribute")
    self.rightPanel_firend  = TFDirector:getChildByPath(ui, "Panel_hyph")
    self.cellModel = TFDirector:getChildByPath(self.rightPanel_firend, "img_liebiaobg")
    self.cellModel:retain()
    self.cellModel:removeFromParent()
    --拓展属性
    for i = EnumAttributeType.Crit, EnumAttributeType.Miss do
        local node = TFDirector:getChildByPath(ui, "panel_shuxing" .. i)
        if node then
            local percentNode = TFDirector:getChildByPath(node, "txt_percent")
            print("percentNode = ", percentNode)
            if percentNode then
                local posX = percentNode:getPositionX()
                percentNode:setPositionX(posX + 20)
            end
        end
    end

    --上面进度条
    self.img_level = TFDirector:getChildByPath(ui, "img_level")
    local txt_mylevel = TFDirector:getChildByPath(ui, "txt_mylevel")
    self.txt_jiayuanLv_0 = TFDirector:getChildByPath(txt_mylevel, "txt_number")
    --家园等级
    self.txt_jiayuanLv = TFDirector:getChildByPath(self.img_level, "txt_num")
    self.txt_jiayuanLv:setText("Lv" .. "0")
    self.btn_lvAdd = TFDirector:getChildByPath(self.img_level, "btn_djjc")
    self.btn_lvAdd.logic = self
    self.btn_lvAdd:setVisible(false)
    self.bar_exp = TFDirector:getChildByPath(self.img_level, "bar_exp1")
    self.txt_jindu = TFDirector:getChildByPath(self.img_level, "txt_jindu")
    self.txt_jiayuan_name = TFDirector:getChildByPath(self.img_level, "txt_name")

    self.origin_pos_x = self.img_attr_di:getPositionX()

    self.img_heidi = TFDirector:getChildByPath(ui, "img_heidi")
    self.img_heidi:setVisible(false)

end

function JiayuanFriendLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function JiayuanFriendLayer:reloadFriendInfo()
    for friendInfo in QiyuManager.homeFriendPraiseRanks:iterator() do
        if friendInfo.playerId == self.playerId then
            if self.logic then
                self.logic:showFriendLayer(friendInfo)
            end
            break
        end
    end
end

function JiayuanFriendLayer:registerEvents(ui)
    print("JiayuanFriendLayer:registerEvents-------->>>>>>>>>>>>>")
    self.super.registerEvents(self)

    self.btn_return:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onReturnClickHandle), 1)
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClickHandle), 1)

    self.btn_hyph:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShowFriendClickHandle), 1)
    self.btn_jyzjc:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAttrAddClickHandle), 1)

    self.btn_lvAdd:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onLvAddClickHandle), 1)
    self.btn_zan_1:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZanClick), 1)
    self.btn_fkjl:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRecordClick), 1)
    self.onReceiveFriendPraiseRanks = function (event)
        if self.logic and self.logic.friendInfo ~= nil then
            self:reloadFriendInfo()
        end
    end
    TFDirector:addMEGlobalListener(QiyuManager.Receive_Friend_Praise_Ranks, self.onReceiveFriendPraiseRanks)

    self.onReceiveFriendPraiseFresh = function (event)
        self:reloadFriendList()
        local txt_zannumber = TFDirector:getChildByPath(self.btn_zan_1,"txt_zannumber")
        txt_zannumber:setText(stringUtils.format(localizable.common_zan,self.jiayuanData.praiseCount))
        local jiayuanData = QiyuManager:getJiayuanData()
        if jiayuanData.praiseFriends[self.playerId] and jiayuanData.praiseFriends[self.playerId] == 1 then
            self.btn_zan_1:setGrayEnabled(true)
            self.btn_zan_1:setTouchEnabled(false)
        else
            local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.JIAYUAN_ZAN)
            local nowTimes = tonumber(challengeInfo:getLeftChallengeTimes())
            if nowTimes <= 0 then
                self.btn_zan_1:setGrayEnabled(true)
                self.btn_zan_1:setTouchEnabled(false)
                return
            end
            self.btn_zan_1:setGrayEnabled(false)
            self.btn_zan_1:setTouchEnabled(true)
        end 
    end
    TFDirector:addMEGlobalListener(QiyuManager.Receive_Friend_Praise_Fresh, self.onReceiveFriendPraiseFresh)
    
    self.updateUserDataCallBack = function(event)
        self:refreshZanInfo()
    end
    TFDirector:addMEGlobalListener(MainPlayer.ChallengeTimesChange ,self.updateUserDataCallBack)
end

function JiayuanFriendLayer:removeUI()
    if self.cellModel then
        self.cellModel:release()
        self.cellModel = nil
    end
end
function JiayuanFriendLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(QiyuManager.Receive_Friend_Praise_Ranks, self.onReceiveFriendPraiseRanks)
    TFDirector:removeMEGlobalListener(QiyuManager.Receive_Friend_Praise_Fresh, self.onReceiveFriendPraiseFresh)
    self.onReceiveFriendPraiseRanks = nil

    TFDirector:removeMEGlobalListener(MainPlayer.ChallengeTimesChange ,self.updateUserDataCallBack)
    self.updateUserDataCallBack = nil
end


function JiayuanFriendLayer:getTween( layer ,toY , toX , dt , bclear)
    local toastTween = {
        target = layer,
        {
            duration = 0,
            delay = 0.8 +  0.3 * (dt-1)
        },
        {
            duration = 0.1,
            x = toX,
            y = toY,
            alpha = 0.9,
        },
        {
            duration = 0.05,
            y = toY +2,
        },
        {
            duration = 0.05,
            y = toY -1,
        },
        {
            duration = 0.1,
            alpha = 1,
        },
        { 
            duration = 0,
            delay = 1 
        },
        {
            duration = 0.1,
            y = toY - 4,
            alpha = 0.7,
        },
        {
            duration = 0.1,
            y = toY + 2,

        },
        {
            duration = 0,

        },
        {
             duration = 0.1,
             alpha = 0,
             y = toY + 100,
        },
        {
            duration = 0,
            onComplete = function() 
                layer:removeFromParentAndCleanup(true)
                if bclear == true then
                    self.equipLevelUpAcNode:removeFromParentAndCleanup(true)
                    self.equipLevelUpAcNode = nil
                end
            end
        }
    }
    return toastTween
end


function JiayuanFriendLayer:reShow()
    self.super.onShow(self)
end


function JiayuanFriendLayer:reloadFriendList()
    if self.friendList == nil then
        local table_content = TFDirector:getChildByPath(self.rightPanel_firend,"Panel_paihang")
        local tableview = TFTableView:create()
        print("table_content:getContentSize()",table_content:getContentSize())
        tableview:setTableViewSize(table_content:getContentSize())
        tableview:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableview:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        tableview:setPosition(table_content:getPosition())
        self.rightPanel_firend:addChild(tableview)
        -- tableview:setPosition(ccp(0,-250))
        self.friendList = tableview
        self.friendList.logic = self

        self.friendList:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
        self.friendList:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
        self.friendList:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
        -- self.friendList:reloadData()
    end
    self.friendList:reloadData()
    self:refresMyPaiHangInfo()
end


function JiayuanFriendLayer:refreshInfo( playerInfo )
    self.jiayuanData = playerInfo
    self.level = self.jiayuanData.homeLevel or 1
    self.exp = self.jiayuanData.exp or 0
    self.playerId = self.jiayuanData.playerId
    self.txt_jiayuan_name:setText(stringUtils.format(localizable.Jiayuan_home_name_2,playerInfo.name))
    local needLevel = math.min(FamilyData:length(), self.level + 1)
    self.needExp = FamilyData:getExpByLevel(needLevel)
    if self.level >= FamilyData:length() then
        self.exp = self.needExp
    end
    self:refreshUI()
    self:reloadFriendList()
    self:closeFriendPanel()
end

function JiayuanFriendLayer:refreshUI()

    self:refreshAttr()   
    self:refreshZanInfo()
    self:refreshJindu()
    local txt_zannumber = TFDirector:getChildByPath(self.btn_zan_1,"txt_zannumber")
    txt_zannumber:setText(stringUtils.format(localizable.common_zan,self.jiayuanData.praiseCount))
    local jiayuanData = QiyuManager:getJiayuanData()
    if jiayuanData.praiseFriends[self.playerId] and jiayuanData.praiseFriends[self.playerId] == 1 then
        self.btn_zan_1:setGrayEnabled(true)
        self.btn_zan_1:setTouchEnabled(false)
    else
        local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.JIAYUAN_ZAN)
        local nowTimes = tonumber(challengeInfo:getLeftChallengeTimes())
        if nowTimes <= 0 then
            self.btn_zan_1:setGrayEnabled(true)
            self.btn_zan_1:setTouchEnabled(false)
            return
        end
        self.btn_zan_1:setGrayEnabled(false)
        self.btn_zan_1:setTouchEnabled(true)
    end

end

function JiayuanFriendLayer:refreshAttr()
    self.attrTab = FamilyData:getTotalAttr(self.level)
    print("self.attrTab >> ", self.attrTab)
    for index, txt_arr in pairs(self.txt_arr_base) do
        local arrStr = self.attrTab[index] or 0
        txt_arr:setText(arrStr)
    end

    for index, txt_arr in pairs(self.txt_arr_add) do
        txt_arr:setVisible(false)
    end

    self.txt_percent = {}
    self.txt_arr = {}

    for i = EnumAttributeType.Crit, EnumAttributeType.Miss do
        local node = TFDirector:getChildByPath(self, "panel_shuxing" .. i)
        if node then
            self.txt_arr[i]     = TFDirector:getChildByPath(node, "txt_shuxingzhi")
            self.txt_percent[i] = TFDirector:getChildByPath(node, "txt_percent")
        end
    end

    --角色属性
    for index, txt_a in pairs(self.txt_arr) do        
        local arrStr = self.attrTab[index] or 0

        if txt_a then
            txt_a:setText(covertToDisplayValue(index, arrStr))
        end
    end

    for index, txt_b in pairs(self.txt_percent) do
        local newIndex = index
        if index == EnumAttributeType.Crit then
            newIndex = index + 4
        elseif index == EnumAttributeType.Preciseness then
            newIndex = index + 3
        end

        local arrStr = self.attrTab[newIndex]

        if txt_b then
            local percent = arrStr or 0

            txt_b:setVisible(false)
            if percent > 0 then
                txt_b:setVisible(true)
                -- covertToDisplayValue(newIndex, percent)
                local percentValue = string.format("%.2f", percent / 100) .. '%'
                txt_b:setText("+"..percentValue)
            end
        end
    end
end

function JiayuanFriendLayer:refreshJindu()
    local per = 0
    if self.needExp and self.needExp ~= 0 then
        per = self.exp / self.needExp * 100
    end
    self.bar_exp:setPercent(per)
    self.txt_jindu:setText(self.exp .. "/" .. self.needExp)

    self.txt_jiayuanLv:setText("Lv" .. self.level)
    self.txt_jiayuanLv_0:setText(QiyuManager:getJiayuanLevel())
end

function JiayuanFriendLayer:checkCanLevelUp()

end

function JiayuanFriendLayer.onReturnClickHandle(sender)
    local self = sender.logic
    if self.logic then
        self.logic:returnMylayer()
    else
        AlertManager:close()
    end
end

function JiayuanFriendLayer.onHelpClickHandle(sender)
    local self = sender.logic
    print("onHelpClickHandle")
    CommonManager:showRuleLyaer('jiayuan')
end

function JiayuanFriendLayer:openFriendPanel()
    print("JiayuanFriendLayer:openFriendPanel(")
    self.rightPanel_arr:setZOrder(4)
    -- self.rightPanel_extendedArr:setVisible(false)
    self.rightPanel_firend:setZOrder(10)
    if not self.attr_layer_show then
        self:openRightPanel()
    end
    self.btn_hyph:setTextureNormal("ui_new/qiyu/family/btn_hyph_l.png")
    self.btn_jyzjc:setTextureNormal("ui_new/qiyu/family/btn_jyzjc_h.png")
    self.rightPanel_type = 1
end
function JiayuanFriendLayer:closeFriendPanel()
    print("JiayuanFriendLayer:openFriendPanel(")
    self.rightPanel_arr:setZOrder(4)
    -- self.rightPanel_extendedArr:setVisible(false)
    self.rightPanel_firend:setZOrder(10)
    if self.attr_layer_show then
        self:openRightPanel()
    end
    self.btn_hyph:setTextureNormal("ui_new/qiyu/family/btn_hyph_h.png")
    self.btn_jyzjc:setTextureNormal("ui_new/qiyu/family/btn_jyzjc_h.png")
    self.rightPanel_type = 1
end

function JiayuanFriendLayer.onShowFriendClickHandle(sender)
    print("onShowFriendClickHandle")
    local self = sender.logic
    self.rightPanel_type = self.rightPanel_type or 0
    if self.rightPanel_type == 1 then
        if self.attr_layer_show then
            self.btn_hyph:setTextureNormal("ui_new/qiyu/family/btn_hyph_h.png")
        else
            self.btn_hyph:setTextureNormal("ui_new/qiyu/family/btn_hyph_l.png")
        end
        self:openRightPanel()

    else
        if not self.attr_layer_show then
            self:openRightPanel()
        end
        self.btn_hyph:setTextureNormal("ui_new/qiyu/family/btn_hyph_l.png")
        self.btn_jyzjc:setTextureNormal("ui_new/qiyu/family/btn_jyzjc_h.png")
    end
    self.rightPanel_arr:setZOrder(4)
    -- self.rightPanel_extendedArr:setVisible(false)
    self.rightPanel_firend:setZOrder(10)
    
    self.rightPanel_type = 1
end

function JiayuanFriendLayer.onAttrAddClickHandle(sender)
    print("onAttrAddClickHandle")
    local self = sender.logic
    self.rightPanel_type = self.rightPanel_type or 0
    if self.rightPanel_type == 2 then
        if self.attr_layer_show then
            self.btn_jyzjc:setTextureNormal("ui_new/qiyu/family/btn_jyzjc_h.png")
        else
            self.btn_jyzjc:setTextureNormal("ui_new/qiyu/family/btn_jyzjc.png")
        end
        self:openRightPanel()
    else
        if not self.attr_layer_show then
            self:openRightPanel()
        end
        self.btn_jyzjc:setTextureNormal("ui_new/qiyu/family/btn_jyzjc.png")
        self.btn_hyph:setTextureNormal("ui_new/qiyu/family/btn_hyph_h.png")
    end
    self.rightPanel_arr:setZOrder(10)
    -- self.rightPanel_extendedArr:setVisible(true)
    self.rightPanel_firend:setZOrder(4)
    self.rightPanel_type = 2
end
function JiayuanFriendLayer:openRightPanel()
    if self.attr_tween then
        TFDirector:killTween(self.attr_tween)
    end
    if self.attr_layer_show then
        self.attr_tween = {
            target = self.img_attr_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = self.origin_pos_x,
            },
        }
        self.attr_layer_show = false
    else
        self.attr_tween = {
            target = self.img_attr_di,
            {
                duration = 0.3,
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3},
                x = -455,
            },
        }
        self.attr_layer_show = true
    end
    TFDirector:toTween(self.attr_tween)
end

function JiayuanFriendLayer.onZanClick(sender)
    local self = sender.logic
    QiyuManager:requestHomePraise(self.jiayuanData.playerId)
end

function JiayuanFriendLayer.onLvAddClickHandle(sender)
    local self = sender.logic

    print("onLvAddClickHandle")
    AlertManager:addLayerToQueueAndCacheByFile("lua.logic.qiyu.JiayuanLevelAddLayer", AlertManager.BLOCK_AND_GRAY, AlertManager.TWEEN_1)
    AlertManager:show()
end

function JiayuanFriendLayer.numberOfCellsInTableView(table)
    if QiyuManager.homeFriendPraiseRanks then
        return QiyuManager.homeFriendPraiseRanks:length()
    end
    return 0
end

function JiayuanFriendLayer.cellSizeForTable(table, idx)
    return 95,440
end

function JiayuanFriendLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    local node = nil
    if nil == cell then
        cell = TFTableViewCell:create()
        node = self.cellModel:clone()
        node:setVisible(true)
        node:setPosition(ccp(220,48))
        cell:addChild(node)
        cell.panel = node
        node.logic = self
    end
    local firendInfo = QiyuManager.homeFriendPraiseRanks:getObjectAt(idx+1)
    -- print("---------firendInfo-->",firendInfo)
    if firendInfo then
        cell.panel:setVisible(true)
        self:showFirendPanelInfo(cell.panel , firendInfo , idx+1)
    else
        cell.panel:setVisible(false)
    end
    return cell
end

function JiayuanFriendLayer:showFirendPanelInfo(panel, firendInfo,index)
    print("showFirendPanelInfo")
    if panel.txt_name == nil then
        panel.img_paihang = TFDirector:getChildByPath(panel,"img_paihang")
        panel.img_liebiaobg = TFDirector:getChildByPath(panel,"img_liebiaobg")
        panel.bg_head = TFDirector:getChildByPath(panel,"bg_head")
        panel.Img_icon = TFDirector:getChildByPath(panel,"Img_icon")
        panel.txt_name = TFDirector:getChildByPath(panel,"txt_name")
        panel.btn_canguan = TFDirector:getChildByPath(panel,"btn_canguan")
        panel.txt_number = TFDirector:getChildByPath(panel,"txt_number")
        panel.btn_zan = TFDirector:getChildByPath(panel,"btn_zan")
        panel.txt_zannumber = TFDirector:getChildByPath(panel,"txt_zannumber")
        panel.txt_paimingnumber = TFDirector:getChildByPath(panel,"txt_paimingnumber")
        panel.img_liebiaobg:setTouchEnabled(true)
        panel.img_liebiaobg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCanGuanClickHandle), 1)
        panel.btn_zan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZanFriendClickHandle), 1)
        panel.node_state = {}
        for i=1,3 do
            panel.node_state[i] = TFDirector:getChildByPath(panel,"btn_bs" .. i)
            panel.node_state[i]:setTouchEnabled(false)
            panel.node_state[i]:setVisible(false)
        end
    end
    if self.pos_zero == nil then
        self.pos_zero = panel.node_state[1]:getPositionX()
    end
    local temp = 0
    for i=1,3 do
        local state = self:getEventState(firendInfo.events,i)
        if state == true then
            panel.node_state[i]:setVisible(true)
            panel.node_state[i]:setPositionX(temp * 21 + self.pos_zero)
            temp = temp + 1
        else
            panel.node_state[i]:setVisible(false)
        end
    end
    
    panel.btn_canguan:setVisible(false)
    panel.img_liebiaobg.index = index
    panel.img_liebiaobg.logic = self
    panel.btn_zan.index = index
    panel.txt_name:setText(firendInfo.name)
    panel.txt_number:setText(firendInfo.homeLevel)
    panel.txt_zannumber:setText(stringUtils.format(localizable.common_zan,firendInfo.praiseCount))
    local roleData =  RoleData:objectByID(firendInfo.icon)
    if roleData then
        panel.Img_icon:setTexture(roleData:getIconPath())
        Public:addFrameImg(panel.Img_icon,firendInfo.headPicFrame,true)
    end
    if index <= 3 then
        panel.txt_paimingnumber:setVisible(false)
        panel.img_paihang:setVisible(true)
        panel.img_paihang:setTexture("ui_new/leaderboard/no"..index..".png")
    else
        panel.img_paihang:setVisible(false)
        panel.txt_paimingnumber:setVisible(true)
        panel.txt_paimingnumber:setText(index)
    end
    if firendInfo.playerId == MainPlayer:getPlayerId() then
        panel.btn_zan:setVisible(false)
        Public:addInfoListen(panel.Img_icon,false)
    else
        panel.btn_zan:setVisible(true)
        Public:addInfoListen(panel.Img_icon,true,4,firendInfo.playerId)
    end
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.JIAYUAN_ZAN)
    local nowTimes = tonumber(challengeInfo:getLeftChallengeTimes())
    if nowTimes <= 0 then
        panel.btn_zan:setGrayEnabled(true)
        panel.btn_zan:setTouchEnabled(false)
        return
    else
        panel.btn_zan:setGrayEnabled(false)
        panel.btn_zan:setTouchEnabled(true)
    end
    local jiayuanData = QiyuManager:getJiayuanData()
    if jiayuanData.praiseFriends[firendInfo.playerId] and jiayuanData.praiseFriends[firendInfo.playerId] == 1 then
        -- panel.btn_zan:setVisible(false)
        panel.btn_zan:setGrayEnabled(true)
        panel.btn_zan:setTouchEnabled(false)
    end
    
end

function JiayuanFriendLayer:getEventState( eventMsg ,eventId)
    if eventMsg == nil then
        return false
    end
    for i,v in ipairs(eventMsg) do
        if v.eventId == eventId then
            if v.state == 0 then
                if v.eventId == 2 and v.count >= 3 then
                    return false
                end
                if v.eventId == 3 and v.count >= v.totleCount then
                    return false
                end
                if v.players then
                    local myPlayerId = MainPlayer:getPlayerId()
                    for _i,_v in ipairs(v.players) do
                        if _v == myPlayerId then
                            return false
                        end
                    end
                end
                return true
            end
            return false
        end
    end
    return false
end

function JiayuanFriendLayer:refresMyPaiHangInfo()
    local txt_mypaiming = TFDirector:getChildByPath(self.ui,"txt_mypaiming")
    local txt_mypaiming_num = TFDirector:getChildByPath(txt_mypaiming,"txt_number")
    local index = 1
    for firendInfo in QiyuManager.homeFriendPraiseRanks:iterator() do
        if firendInfo.playerId == MainPlayer:getPlayerId() then
            txt_mypaiming_num:setText(index)
            return
        end
        index = index + 1
    end
end

function JiayuanFriendLayer:refreshZanInfo()
    local txt_mybzcs = TFDirector:getChildByPath(self.ui,"txt_mybzcs")
    local txt_mybzcs_num = TFDirector:getChildByPath(txt_mybzcs,"txt_number")
    local jiayuanData = QiyuManager:getJiayuanData()
    txt_mybzcs_num:setText(jiayuanData.praiseCount)


    local txt_sydz = TFDirector:getChildByPath(self.ui,"txt_sydz")
    local txt_sydz_num = TFDirector:getChildByPath(txt_sydz,"txt_number")
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.JIAYUAN_ZAN)
    local nowTimes = tonumber(challengeInfo:getLeftChallengeTimes())
    txt_sydz_num:setText(nowTimes)
end

function JiayuanFriendLayer.onCanGuanClickHandle( sender )
    local self = sender.logic
    local index = sender.index
    local firendInfo = QiyuManager.homeFriendPraiseRanks:getObjectAt(index)
    local myPlayerId = MainPlayer:getPlayerId()
    if firendInfo and self.logic then
        if firendInfo.playerId == myPlayerId then
            self.logic:returnMylayer()
        else
            self.logic:showFriendLayer(firendInfo)
        end
    end
end

function JiayuanFriendLayer.onZanFriendClickHandle( sender )
    local index = sender.index
    local firendInfo = QiyuManager.homeFriendPraiseRanks:getObjectAt(index)
    if firendInfo then
        QiyuManager:requestHomePraise(firendInfo.playerId)
    end
end

function JiayuanFriendLayer.onRecordClick(sender)
    QiyuManager:RequestAccessRecord()
end

return JiayuanFriendLayer