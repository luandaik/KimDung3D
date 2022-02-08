-- ChatMainLayer
-- Author: Stephen
-- Date: 2014-03-19 17:12:32
--
--

local ChatMainLayer = class("ChatMainLayer", BaseLayer)
local PageMaxSmileNum = 30
local selectedIndex = 1
local hasPlayedFriendListAnimation = false
ChatMainLayer._team = 5
ChatMainLayer._private = 4
ChatMainLayer._server = 3
ChatMainLayer._gang  = 2
ChatMainLayer._public = 1
ChatMainLayer._kingofwar = 6

function ChatMainLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.chat.ChatMainLayer")
    self.name = "ChatMainLayer"
end

function ChatMainLayer:initUI(ui)
	self.super.initUI(self,ui)

    --按钮
	self.btn_close 		= TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_close.logic = self
    --频道
    self.channel_group = TFDirector:getChildByPath(ui, 'panel_channel_group')
    self.channel_group.logic = self

    --发送
    self.btn_send = TFDirector:getChildByPath(ui, 'btn_send')
    self.btn_send.logic = self
    --聊天消息滚动
    self.btn_up = TFDirector:getChildByPath(ui, 'btn_up')
    self.btn_down = TFDirector:getChildByPath(ui, 'btn_down')
    self.btn_up.logic = self
    self.btn_down.logic = self

    self.btn_yuyin = TFDirector:getChildByPath(ui, 'btn_yuyin')
    self.btn_jianpan = TFDirector:getChildByPath(ui, 'btn_jianpan')

    self.btn_anzhu = TFDirector:getChildByPath(ui, 'btn_anzhu')
    self.img_tip = TFDirector:getChildByPath(ui, 'img_tip')
    self.img_tip_info = TFDirector:getChildByPath(ui, 'img_info')
    self.img_tip:setVisible(false)
    --输入框
    self.txt_input = TFDirector:getChildByPath(ui, 'txt_input')
    self.txt_input.logic = self
    self.txt_input:setMaxLengthEnabled(true)
    self.txt_input:setMaxLength(60)
    self.txt_input:setCursorEnabled(true)

    self.btn_smile = TFDirector:getChildByPath(ui, 'btn_smile')
    self.btn_smile.logic = self
    self.img_smile_bg = TFDirector:getChildByPath(ui, 'img_smile_bg')
    self.img_smile_bg:setVisible(false)
    self.smile_bg = TFDirector:getChildByPath(self.img_smile_bg, 'smile_bg')
    self.smile_bg:setVisible(false)
    self.img_point_smile = {}
    self.img_point_smile[1] = TFDirector:getChildByPath(self.img_smile_bg, 'img_point_smile_1')
    self.img_point_smile[2] = TFDirector:getChildByPath(self.img_smile_bg, 'img_point_smile_2')
    self.img_point_smile[1]:setVisible(true)
    self.img_point_smile[2]:setVisible(true)

    local pageView = TFPageView:create()
    pageView:setTouchEnabled(true)
    pageView:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
    pageView:setSize(self.smile_bg:getContentSize())
    pageView:setPosition(self.smile_bg:getPosition())
    pageView:setAnchorPoint(self.smile_bg:getAnchorPoint())
    self.pageView = pageView
    self.img_smile_bg:addChild(self.pageView)

    local function onPageChange()
        local index = pageView:getCurPageIndex()
        for i=1,2 do
            if i == index then
                self.img_point_smile[i]:setTexture("ui_new/chat/dian2.png")
            else
                self.img_point_smile[i]:setTexture("ui_new/chat/dian1.png")
            end
        end
    end
    pageView:addMEListener(TFPAGEVIEW_CHANGED,onPageChange)

    --喇叭图标
    self.img_speaker = TFDirector:getChildByPath(ui, 'img_speaker')
    self.txt_speaker_num = TFDirector:getChildByPath(ui, 'txt_speaker_num')
    self.txt_speaker_num.logic = self

    --聊天消息
    self.panel_table = TFDirector:getChildByPath(ui, 'panel_table')

    self.img_input_bg = TFDirector:getChildByPath(ui, 'img_input_bg')
    self.img_input_bg.logic = self

    self.messageLayers    = {}
    self:InitButtonGroup(ui)
    self:initTableView()

    ChatManager.chatLayer = self


    self.bg_niantie  = TFDirector:getChildByPath(ui, 'bg_niantie');
    self.bg_niantie:setVisible(false)

    -- friend list
    self.panelFriendList = TFDirector:getChildByPath(ui, "panel_friend_list");
    assert(self.panelFriendList)
    self.panelFriendList:setVisible(false)

    self.friendTableView = require('lua.logic.chat.ChatFriendsTableView'):new()
    assert(self.friendTableView)
    self.panelFriendList:addChild(self.friendTableView)
    self.firstLoad = true

    self:setInputType(1)
end

function ChatMainLayer:onShow()
    self.super.onShow(self)

    CommonManager:updateRedPoint(self.sideButtons[1], ChatManager:isHaveNewChatForIndex(1),ccp(0,-10))
    local bool = ChatManager:isHaveNewChatForIndex(2)
    bool = bool or (self.firstLoad and RedPacketManager:checkRedPoint())
    CommonManager:updateRedPoint(self.sideButtons[2], bool,ccp(0,-10))
    -- CommonManager:updateRedPoint(self.sideButtons[2], ChatManager:isHaveNewChatForIndex(2),ccp(0,-10))
    -- CommonManager:updateRedPoint(self.sideButtons[2], self.firstLoad and RedPacketManager:checkRedPoint(),ccp(0,-10))
    CommonManager:updateRedPoint(self.sideButtons[ChatMainLayer._private], ChatManager:isHaveNewChatForIndex(3),ccp(0,-10))

    CommonManager:updateRedPoint(self.sideButtons[ChatMainLayer._team], JapanIslandManager:getTeamChatRedState(),ccp(0,-10))
    CommonManager:updateRedPoint(self.sideButtons[ChatMainLayer._kingofwar], KingOfWarManager:getTeamChatRedState(),ccp(0,-10))

    KnightManager:setKnightRedPoint(self.sideButtons[ChatMainLayer._private], KnightManager:isShowShareButton(), ccp(-40, -13))
    --直接定位到好友聊天关闭要点两次
    hasPlayedFriendListAnimation = (hasPlayedFriendListAnimation == true)

    if #ChatManager:getNewMessageList() > 0 then
        ChatManager:showPrivateChatRedPoint()
    end

    self:refreshUI(0)
end

function ChatMainLayer:dispose()
    ChatManager.chatLayer = nil
    self.super.dispose(self)
end

function ChatMainLayer:onHide()
    if (not ChatManager:isOpenKnightShareLayer()) then
        self.friendTableView:onHide()
    end
end

function ChatMainLayer:refreshUI(_type)
    self:refreshSpeakerNum()
    self:refreshTableView(_type)
    self:autoCheckChannelButtonEnabled()

    -- local vipChat  = VipData:getVipItemByTypeAndVip(5000, MainPlayer:getVipLevel()) 
    -- local vipChatTimes = (vipChat and vipChat.benefit_value) or 0
    
    -- print("vipChatTimes = ", vipChatTimes)
    -- print("MainPlayer:getChatUsedTimes() = ", MainPlayer:getChatUsedTimes())

    -- vipChatTimes = vipChatTimes - MainPlayer:getChatUsedTimes()
    -- if vipChatTimes < 0 then
    --     vipChatTimes = 0
    -- end
    -- self.vipChatTimes = vipChatTimes
    local vipChatTimes = MainPlayer:getChatFreeTimes()
    self.vipChatTimes = vipChatTimes

    if self.txt_input then
        local channelIndex = self:getSelectedChannelIndex()
        print("channelIndex = ",channelIndex)
        if channelIndex == EnumChatType.PrivateChat or channelIndex == EnumChatType.Gang then
            --self.txt_input:setPlaceHolder("请点击这里输入文字")
            self.txt_input:setPlaceHolder(localizable.chatMainLayer_input)
        elseif channelIndex == EnumChatType.Server then
            local teamLevel = MainPlayer:getLevel()
            local vipLevel = MainPlayer:getVipLevel()
            local openLevle = ConstantData:objectByID("Chat.Server.Level").value
            local openVipLevle = ConstantData:objectByID("Chat.Server.VipLevel").value
            if teamLevel < openLevle and vipLevel < openVipLevle then
                --self.txt_input:setPlaceHolder("等级达到"..openLevle.."级可发言")
                self.txt_input:setPlaceHolder(stringUtils.format(localizable.chatMainLayer_open_speak,openLevle))
                return
            end
            local _vipChatTimes = MainPlayer:getServerChatFreeTimes()
            if _vipChatTimes <= 0 then
                self.txt_input:setPlaceHolder(localizable.chatMainLayer_input)
            else
    
            --self.txt_input:setPlaceHolder("您还有".._vipChatTimes.."次免费聊天的次数")
		    local str = stringUtils.format(localizable.chatMainLayer_left_time, _vipChatTimes);
		    self.txt_input:setPlaceHolder(str)
            end
        elseif channelIndex == EnumChatType.Team then
            --请点击这里输入文字"
            self:selectSideButton(ChatMainLayer._team)
            self.txt_input:setPlaceHolder(localizable.chatMainLayer_input)
        elseif channelIndex == EnumChatType.Team_KingOfWar then
            --请点击这里输入文字"
            self:selectSideButton(ChatMainLayer._kingofwar)
            self.txt_input:setPlaceHolder(localizable.chatMainLayer_input)
        else
            local teamLevel = MainPlayer:getLevel()
            local vipLevel = MainPlayer:getVipLevel()
            local openLevle = ConstantData:objectByID("Chat.Public.Level").value
            local openVipLevle = ConstantData:objectByID("Chat.Public.VipLevel").value
            if teamLevel < openLevle and vipLevel < openVipLevle then
                --self.txt_input:setPlaceHolder("等级达到"..openLevle.."级可发言")
                self.txt_input:setPlaceHolder(stringUtils.format(localizable.chatMainLayer_open_speak,openLevle))

                return
            end
            if vipChatTimes <= 0 then
                --self.txt_input:setPlaceHolder("请点击这里输入文字")
                self.txt_input:setPlaceHolder(localizable.chatMainLayer_input)
            else
                --self.txt_input:setPlaceHolder("您还有"..vipChatTimes.."次免费聊天的次数")
                self.txt_input:setPlaceHolder(stringUtils.format(localizable.chatMainLayer_left_time,vipChatTimes))
            end
        end
    end
end

--刷新小喇叭显示
function ChatMainLayer:refreshSpeakerNum()
    local channelIndex = self:getSelectedChannelIndex()
    if channelIndex == EnumChatType.Public then
        self.img_speaker:setVisible(true)
        self.img_speaker:setTexture("icon/item/30002.png")
        self.txt_speaker_num:setText(ChatManager:getSpeakerNumber())
    elseif channelIndex == EnumChatType.Server then
        self.img_speaker:setVisible(true)
        self.img_speaker:setTexture("icon/item/30103.png")
        self.txt_speaker_num:setText(ChatManager:getServerSpeakerNumber())
    elseif channelIndex == EnumChatType.Team then
        self.img_speaker:setVisible(false)
    elseif channelIndex == EnumChatType.Team_KingOfWar then
        self.img_speaker:setVisible(false)
    else
        self.img_speaker:setVisible(false)
    end
end

function ChatMainLayer:setInputType(_type)
    -- 1: keyboard  2：talk
    if _type == 1 then
        self.txt_input:setVisible(true)
        self.btn_yuyin:setVisible(true)
        self.img_input_bg:setVisible(true)
        self.btn_jianpan:setVisible(false)
        self.btn_anzhu:setVisible(false)
    elseif _type == 2 then
        self.txt_input:setVisible(false)
        self.btn_yuyin:setVisible(false)
        self.img_input_bg:setVisible(false)
        self.btn_jianpan:setVisible(true)
        self.btn_anzhu:setVisible(true)
        self.ui:setPosition(ccp(0,0))
        self.img_smile_bg:setVisible(false)
    end
end
--刷新tableview
function ChatMainLayer:refreshTableView(_type)
    if _type == nil then
        _type = 1
    end
    self:updateChannelMessages()
    local currentOffset = self.tableView:getContentOffset()
    local currentSize = self.tableView:getContentSize()
    self.tableView:reloadData()
    local channelIndex = self:getSelectedChannelIndex()
    if self.firstLoad == true and channelIndex == self._gang then
        local tempY = 0
        local isCanReceive = false
        self.firstLoad = false
        for _msg in self.messageList:iterator() do
            if _msg and _msg.redPacketGmId and _msg.redPacketGmId > 0 then
                isCanReceive = RedPacketManager:isRedPacketCanReceive(_msg.redPacketGmId)
                if isCanReceive == true then
                    break
                end
            end
            if _msg.spilt then
                tempY = tempY + 40
            else
                tempY = tempY + 112
            end
        end
        local _currentSize = self.tableView:getContentSize()
        if isCanReceive == true then
            local tabSize = self.tableView:getSize()
            local offsetY = tempY + tabSize.height - _currentSize.height
            if _currentSize.height >= tabSize.height and offsetY > 0 then
                offsetY = 0
            end
            currentOffset.y = offsetY
            self.tableView:setContentOffset(currentOffset)
            return
        end
    end
    if _type == 0 then
        local _currentSize = self.tableView:getContentSize()
        local length = _currentSize.height - currentOffset.y
        -- print("currentOffset == ",currentOffset)
        -- print("_currentSize == ",_currentSize)
        local tabSize = self.tableView:getSize()
        -- print("tabSize == ",tabSize)
        currentOffset.y = currentSize.height-length
        if tabSize.height > _currentSize.height then
            self.tableView:setScrollToEnd()
        else
            self.tableView:setContentOffset(currentOffset)
        end
    else
        self.tableView:setScrollToEnd()
        print("currentOffset == ",currentOffset)
    end
end

--初始化TableView
function ChatMainLayer:initTableView()
    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.panel_table:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

    self.tableView = tableView
    self.tableView.logic = self

    self:updateChannelMessages()
    self.panel_table:addChild(tableView)
end

function ChatMainLayer:removeUI()
	self.super.removeUI(self)
end

function ChatMainLayer:autoCheckChannelButtonEnabled()
    --帮派频道，需要加入帮派后才能使用
    local gangChannelButton = self.sideButtons[2]
    if gangChannelButton ~=nil then
        -- if MainPlayer:hasGang() then
            gangChannelButton:setTouchEnabled(true)
            gangChannelButton:setGrayEnabled(false)
        -- else
        --     gangChannelButton:setTouchEnabled(false)
        --     gangChannelButton:setGrayEnabled(true)
        -- end
    end
end

function ChatMainLayer:selectSideButton(index)

   -- print("-----------",index)
    local friendLevel = FunctionOpenConfigure:getOpenLevel(1102)
    if index == ChatMainLayer._private and friendLevel > MainPlayer:getLevel() then        
        --toastMessage("团队等级达到"..friendLevel.."级开启")
        toastMessage(stringUtils.format(localizable.common_function_openlevel,friendLevel))
        return
    end
    local factionLevel = FunctionOpenConfigure:getOpenLevel(1201)
    if index == 2 and factionLevel > MainPlayer:getLevel() then        
        --toastMessage("团队等级达到"..factionLevel.."级开启")
        toastMessage(stringUtils.format(localizable.common_function_openlevel,factionLevel))
        
        return
    end
    selectedIndex = index

    -- 如果是私聊
    if index == ChatMainLayer._private then
        if hasPlayedFriendListAnimation then
            self.ui:runAnimation("Action1", 1)

            --显示队伍按钮
            self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
                local but_team = self.sideButtons[ChatMainLayer._team]
                if (but_team) then
                    if (JapanIslandManager:checkNeedViewTeamBtn()) then
                        but_team:setVisible(true)
                    else
                        but_team:setVisible(false)
                    end
                end

                local but_kingofwar = self.sideButtons[ChatMainLayer._kingofwar]
                if (but_kingofwar) then
                    if (KingOfWarManager:checkNeedViewTeamBtn()) then
                        but_kingofwar:setVisible(true)    
                    else
                        but_kingofwar:setVisible(false)
                    end
                end
                self:makeTeamBtnPos()
            end)  

            hasPlayedFriendListAnimation = false
            
            self:selectSideButton(1)
            ChatManager:onIntoChatLayer(1);

            return
        else
            self.sideButtons[index]:setTextureNormal("ui_new/chat/channel_" .. index .. "_pressed.png")
            self.sideButtons[index]:setTouchEnabled(true)

            self.ui:runAnimation("Action0", 1)

            self.sideButtons[1]:setTouchEnabled(false)
            self.sideButtons[2]:setTouchEnabled(false)
            self.sideButtons[ChatMainLayer._server]:setTouchEnabled(false)

            hasPlayedFriendListAnimation = true

            return
        end
    elseif (index == ChatMainLayer._team and JapanIslandManager:checkNeedViewTeamBtn()) then
        self.sideButtons[index]:setVisible(true)

    elseif (index == ChatMainLayer._kingofwar and KingOfWarManager:checkNeedViewTeamBtn()) then
        self.sideButtons[index]:setVisible(true)
    end

    for i = 1, #self.sideButtons do
        --self.sideButtons[i]:setTextureNormal("ui_new/chat/channel_" .. i .. "_normal.png")
        local butImgId = self:getButImgId(i)
        self.sideButtons[i]:setTextureNormal("ui_new/chat/channel_" .. butImgId .. "_normal.png")
        self.sideButtons[i]:setTouchEnabled(true)
    end

    -- self.sideButtons[index]:setTextureNormal("ui_new/chat/channel_" .. index .. "_pressed.png")
    -- self.sideButtons[index]:setTouchEnabled(false)

    local butImgId = self:getButImgId(index)
    self.sideButtons[index]:setTextureNormal("ui_new/chat/channel_" .. butImgId .. "_pressed.png")
    self.sideButtons[index]:setTouchEnabled(false)
end

--对队伍聊天按钮容器sideButtons ID与图片ID不一致处理
function ChatMainLayer:getButImgId(idChat)
    -- if (idChat == ChatMainLayer._team) then
    --     return (6)
    -- end
    return idChat
end

--初始化buttongroup
function ChatMainLayer:InitButtonGroup(ui)
    --local channelNames = {"public","gang","server","private"}
    local channelNames = {"public","gang","server","private", "team","team2"}

    -- local channelNames = {"Public","Gang","GameMaster"}
   
    --频道按钮点击事件处理方法
    local function onSelectChangeHandle(target)
        if self.tableView ~= nil then
            for i = 1, #self.sideButtons do
                if self.sideButtons[i] == target then
                    self:selectSideButton(i)
                    break
                end
            end

            self:refreshUI(1)

            local channelIndex = self:getSelectedChannelIndex()
            ChatManager:onIntoChatLayer(channelIndex);

            if (channelIndex == EnumChatType.Team) then
                CommonManager:removeRedPoint(self.sideButtons[ChatMainLayer._team])
                JapanIslandManager:setTeamChatRedState(false)
            elseif (channelIndex == EnumChatType.Team_KingOfWar) then
                CommonManager:removeRedPoint(self.sideButtons[ChatMainLayer._kingofwar])
                KingOfWarManager:setTeamChatRedState(false)
            else
                CommonManager:removeRedPoint(self.sideButtons[channelIndex])
            end

            CommonManager:removeRedPoint(self.sideButtons[channelIndex])

            if channelIndex == EnumChatType.PrivateChat then
                -- 清除好友小红点
                ChatManager:hidePrivateChatRedPoint()
                CommonManager:removeRedPoint(self.sideButtons[ChatMainLayer._private])

                -- 先清空聊天界面
                ChatManager:clearFriendChat()

                self.panelFriendList:setVisible(true)

                -- 请求私聊列表
                ChatManager:requestPrivateChatList()

                -- 没有好友时禁用发送按钮
                local friendList = FriendManager:getFriendInfoList()
                if #friendList < 1 then
                    self.btn_send:setTouchEnabled(false)
                    self.btn_send:setGrayEnabled(true)
                    self.btn_anzhu:setTouchEnabled(false)
                    self.btn_anzhu:setGrayEnabled(true)
                else
                    self.btn_send:setTouchEnabled(true)
                    self.btn_send:setGrayEnabled(false)
                    self.btn_anzhu:setTouchEnabled(true)
                    self.btn_anzhu:setGrayEnabled(false)
                end
            elseif channelIndex == EnumChatType.Gang then
                -- 没有帮派不能发言
                if not FactionManager:isJoinFaction() then
                    self.btn_send:setTouchEnabled(false)
                    self.btn_send:setGrayEnabled(true)
                    self.btn_anzhu:setTouchEnabled(false)
                    self.btn_anzhu:setGrayEnabled(true)
                end

                self.panelFriendList:setVisible(false)
                self.friendTableView:onHide()
            else
                self.panelFriendList:setVisible(false)
                self.friendTableView:onHide()

                self.btn_send:setTouchEnabled(true)
                self.btn_send:setGrayEnabled(false)
                self.btn_anzhu:setTouchEnabled(true)
                self.btn_anzhu:setGrayEnabled(false)
            end
        end
    end
    
    local channelGroup = TFButtonGroup:create()
    --channelGroup:setPosition(self.channel_group:getPosition())
    --channelGroup:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
    --channelGroup:setSize(self.channel_group:getContentSize())
    --self.channel_group:addChild(channelGroup)
    self.channelGroup = channelGroup
    --channelGroup:setLayoutType('vertical')
    --channelGroup:setRows(#channelNames)
    --channelGroup:setColumn(1)
    --channelGroup:setGap(-16)

    --channelGroup:addMEListener(TFGROUP_SELECTED, onSelectChangeHandle)
    --channelGroup:setLayoutDirect("right_top")
    self.sideButtons = {}
    for i = 1, #channelNames do
        --local channelButton = TFGroupButton:create()
        local channelButton = TFDirector:getChildByPath(self.ui, "btn_" .. channelNames[i])
        assert(channelButton)

        channelButton:addMEListener(TFWIDGET_CLICK, audioClickfun(onSelectChangeHandle))

        self.sideButtons[i] = channelButton

        --channelButton:setNormalTexture("ui_new/chat/channel_" .. i .. "_normal.png")
        --channelButton:setPressedTexture("ui_new/chat/channel_" .. i .. "_pressed.png")
        --channelButton:setText(channelNames[i])
        --channelButton:setFontSize(30)
        --channelButton:setFontName("simhei")
        if (i == 1) then
            --channelButton:setSelect(true)
            self:selectSideButton(1)
            ChatManager:onIntoChatLayer(1);
            CommonManager:removeRedPoint(self.sideButtons[1])
        end
        --channelGroup:addChild(channelButton)
        -- channelButton:setScale9Enabled(true)
        -- channelButton:setSize(CCSizeMake(130,130))
        channelButton:setVisible(true)
        self.sideButtons[i] = channelButton
    end
    local but_team = self.sideButtons[ChatMainLayer._team]
    if (but_team) then
      but_team:setVisible(JapanIslandManager:checkNeedViewTeamBtn())
      but_team.oldPos = but_team:getPosition()  
    end
    local but_team2 = self.sideButtons[ChatMainLayer._kingofwar]
    if (but_team2) then
        but_team2:setVisible(KingOfWarManager:checkNeedViewTeamBtn())
        but_team2.oldPos = but_team:getPosition()   
    end
    -- local but_serv = self.sideButtons[ChatMainLayer._server]
    -- if (but_serv) then
    --   but_serv:setVisible(false)    
    -- end
    self:makeTeamBtnPos()
    --channelGroup:doLayout()
end

--获取当前选中的频道
function ChatMainLayer:makeTeamBtnPos()
    if (JapanIslandManager:checkNeedViewTeamBtn()) then
        local but_team = self.sideButtons[ChatMainLayer._team]
        if (but_team) then
            but_team:setPosition(but_team.oldPos)  
        end
        local but_team2 = self.sideButtons[ChatMainLayer._kingofwar]
        if (but_team2) then
            but_team2:setPosition(but_team2:getPosition())  
        end
    else
        local but_team = self.sideButtons[ChatMainLayer._team]
        local but_team2 = self.sideButtons[ChatMainLayer._kingofwar]
        if (but_team2 and but_team) then
            but_team2:setPosition(but_team.oldPos)  
        end
    end
end
--获取当前选中的频道
function ChatMainLayer:getSelectedChannelIndex()
    -- hardcore because the gm channel is unused
    local temp = selectedIndex
    print("selectedIndex ",selectedIndex)
    if selectedIndex == ChatMainLayer._private then
        temp = EnumChatType.PrivateChat
    elseif selectedIndex == ChatMainLayer._server then
        temp = EnumChatType.Server
    elseif selectedIndex == ChatMainLayer._team then
        temp = EnumChatType.Team
    elseif selectedIndex == ChatMainLayer._kingofwar then
        temp = EnumChatType.Team_KingOfWar
    end
    print("temp ",temp)

    return temp
end

--选中某个分类，一般在其他地方调用。如：打开界面时默认选中某个界面的时候
function ChatMainLayer:changeGroupChoice( index )
    if selectedIndex == index then
        return
    end
    if self.tableView ~= nil then
        self:selectSideButton(index)

        self:refreshUI(1)

        local channelIndex = self:getSelectedChannelIndex()
        ChatManager:onIntoChatLayer(channelIndex);
        -- CommonManager:removeRedPoint(self.sideButtons[channelIndex])

        if channelIndex == EnumChatType.Team then
            CommonManager:removeRedPoint(self.sideButtons[ChatMainLayer._team])
            JapanIslandManager:setTeamChatRedState(false)
        elseif channelIndex == EnumChatType.Team_KingOfWar then
            CommonManager:removeRedPoint(self.sideButtons[ChatMainLayer._kingofwar])
            KingOfWarManager:setTeamChatRedState(false)
        else
            CommonManager:removeRedPoint(self.sideButtons[channelIndex])
        end

        if channelIndex == EnumChatType.PrivateChat then
            -- 清除好友小红点
            ChatManager:hidePrivateChatRedPoint()
            CommonManager:removeRedPoint(self.sideButtons[ChatMainLayer._private])

            -- 先清空聊天界面
            ChatManager:clearFriendChat()

            self.panelFriendList:setVisible(true)

            -- 请求私聊列表
            ChatManager:requestPrivateChatList()

            -- 没有好友时禁用发送按钮
            local friendList = FriendManager:getFriendInfoList()
            if #friendList < 1 then
                self.btn_send:setTouchEnabled(false)
                self.btn_send:setGrayEnabled(true)
                self.btn_anzhu:setTouchEnabled(false)
                self.btn_anzhu:setGrayEnabled(true)
            end
        elseif channelIndex == EnumChatType.Gang then
            -- 没有帮派不能发言
            if not FactionManager:isJoinFaction() then
                self.btn_send:setTouchEnabled(false)
                self.btn_send:setGrayEnabled(true)
                self.btn_anzhu:setTouchEnabled(false)
                self.btn_anzhu:setGrayEnabled(true)
            end

            self.panelFriendList:setVisible(false)
            self.friendTableView:onHide()
        else
            self.panelFriendList:setVisible(false)
            self.friendTableView:onHide()

            self.btn_send:setTouchEnabled(true)
            self.btn_send:setGrayEnabled(false)
            self.btn_anzhu:setTouchEnabled(true)
            self.btn_anzhu:setGrayEnabled(false)
        end
    end
    
end

--更新消息内容
function ChatMainLayer:updateChannelMessages()
    local channelIndex = self:getSelectedChannelIndex()
    self.messageList = ChatManager:getMessageListByType(channelIndex)
end


--关闭按钮点击
function ChatMainLayer.closeBtnClickHandle(sender)
    -- 特效状态还原
    if (channelIndex == EnumChatType.Team) then
        JapanIslandManager:setTeamChatRedState(false)
    elseif (channelIndex == EnumChatType.Team_KingOfWar) then
        KingOfWarManager:setTeamChatRedState(false)
    end
    hasPlayedFriendListAnimation = false
    AlertManager:close(AlertManager.TWEEN_1);
end

--向上按钮点击事件
function ChatMainLayer.upButtonClickHandle(sender)
    local self = sender.logic
   self.tableView:setScrollToBegin(true)
end

--向下按钮点击事件
function ChatMainLayer.downButtonClickHandle(sender)
    local self = sender.logic
   self.tableView:setScrollToEnd(true)
end

--发送按钮点击事件
function ChatMainLayer.sendButtonClickHandle(sender)
   
end

function ChatMainLayer:addChatMsg( data )
    local tSmileConfig = ChatManager:getSmileConfig()
    local szMSG = ChatManager:getPublicStr()

    local szInput = data.content
    for k, v in pairs(tSmileConfig) do
        szInput = string.gsub(szInput, k, v)
    end
    local szSendMSG = string.format(szMSG, data.name, szInput)

    self.richText:addMEListener(TFRICHTEXT_CLICK,function(self, nID, szName, szVal)
        if nID == 1000 then
            if data.playerId ~= MainPlayer:getPlayerId() then
                local layer = require('lua.logic.chat.ChatRoleInfo'):new({ playerId = data.playerId,playerName = data.name})
                AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY)
                AlertManager:show()
            end
        end
    end)

    self.richText:appendText(szSendMSG)
    self.chatList:setInnerContainerSize(self.richText:getSize())
    self.chatList:scrollToBottom()
    self.chatList:setInnerContainerSize(self.richText:getSize())
end

--打开商城界面
function ChatMainLayer:showMallLayer()
    CommonManager:showOperateSureLayer(
            function()
                MallManager:openGiftsShop()
            end,
            nil,
            {
            --msg = "您没有足够的道具“小喇叭”，是否打开商城界面进行购买？"
            msg = localizable.chatMainLayer_buy_horn

            }
    )
end

function ChatMainLayer.clickSmileBtn(btn)
    local self = btn.logic
    self:setInputType(1)
    if self.img_smile_bg:isVisible() then
        self.ui:setPosition(ccp(0,0))
        self.img_smile_bg:setVisible(false)
    else
        self.ui:setPosition(ccp(0,400))
        self.img_smile_bg:setVisible(true)
    end
end

function ChatMainLayer.changeInputTypeBtn( btn )
    local _type = btn.idx
    local self = btn.logic
    self:setInputType(_type)
end

function ChatMainLayer.touchBeganHandle( btn )
    local self = btn.logic
    local chatChannel = self:getSelectedChannelIndex()
    if ChatManager:judgeChatRule(chatChannel) == false then
        self.talkState = -1
        return
    end
    TFAudio.pauseMusic()
    ChatManager:BegainTalk(chatChannel)
    self.img_tip:setVisible(true)
    self.img_tip_info:setTexture("ui_new/chat/img_tips1.png")
    self.talkState = 0
end

function ChatMainLayer.touchMovedHandle( btn )
    local self = btn.logic
    if self.talkState == -1 then
        return
    end
    local pos = btn:getTouchMovePos();
    if btn:hitTest(pos) then
        if self.talkState ~= 0 then
            self.img_tip_info:setTexture("ui_new/chat/img_tips1.png")
            self.talkState = 0
        end
    else 
        if self.talkState ~= 1 then
            self.img_tip_info:setTexture("ui_new/chat/img_tips2.png")
            self.talkState = 1
        end
    end
end

function ChatMainLayer.touchEndedHandle( btn )
    local self = btn.logic
    if self.talkState == -1 then
        return
    end
    local pos = btn:getTouchEndPos();
    self.img_tip:setVisible(false)
    TFAudio.resumeMusic()
    if btn:hitTest(pos) then
        local chatChannel = self:getSelectedChannelIndex()
        ChatManager:EndTalk(chatChannel)
    else 
        ChatManager:CancleTalk()
    end
end

function ChatMainLayer.clickSmileListBtn(btn)
    local self = btn.logic
    local text = self.txt_input:getText() .. btn.config.name
    self.txt_input:setText(text)
    self.txt_input:setTextAreaSize(CCSizeMake(459,0))
end

function ChatMainLayer:pushSmileBtn( btn , index )
    local pageIndex = math.floor(index/PageMaxSmileNum)
    self.pageList = self.pageList or {}
    if self.pageList[pageIndex] == nil then
        local page = TFPanel:create();
        page:setSize(self.smile_bg:getContentSize())
        self.pageList[pageIndex] = page;
        self.pageView:addPage(page)
    end
    local num = index
    while num >= PageMaxSmileNum do
        num = num - PageMaxSmileNum
    end
    btn:setPosition(ccp( (num%10) * 71,(2-math.floor(num/10))*70 ))
    self.pageList[pageIndex]:addChild(btn)
end
--注册事件
function ChatMainLayer:registerEvents()
	self.super.registerEvents(self)

	self.btn_close:addMEListener(TFWIDGET_CLICK, audioClickfun(self.closeBtnClickHandle,play_fanhui),1)
    self.btn_close:setClickAreaLength(100)

    self.btn_up:addMEListener(TFWIDGET_CLICK, audioClickfun(self.upButtonClickHandle),1)
    self.btn_down:addMEListener(TFWIDGET_CLICK, audioClickfun(self.downButtonClickHandle),1)
    self.btn_smile:addMEListener(TFWIDGET_CLICK, audioClickfun(self.clickSmileBtn),1)

    self.btn_yuyin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.changeInputTypeBtn),1)
    self.btn_yuyin.logic = self
    self.btn_yuyin.idx = 2
    self.btn_jianpan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.changeInputTypeBtn),1)
    self.btn_jianpan.logic = self
    self.btn_jianpan.idx = 1


    self.btn_anzhu:addMEListener(TFWIDGET_TOUCHBEGAN, self.touchBeganHandle);
    self.btn_anzhu:addMEListener(TFWIDGET_TOUCHMOVED, self.touchMovedHandle);
    self.btn_anzhu:addMEListener(TFWIDGET_TOUCHENDED, self.touchEndedHandle);
    self.btn_anzhu.logic = self

    --table view 事件
    self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, ChatMainLayer.cellSizeForTable)
    self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, ChatMainLayer.tableCellAtIndex)
    self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, ChatMainLayer.numberOfCellsInTableView)

    self.newChatMessageCallback = function (event)
        self:refreshUI(1)
    end
    TFDirector:addMEGlobalListener(ChatManager.NewMessage,self.newChatMessageCallback)

    -- 私聊小红点
    self.updatePrivateChatRedPoint = function(event)
        CommonManager:updateRedPoint(self.sideButtons[ChatMainLayer._private], ChatManager:isHaveNewChatForIndex(3),ccp(0,-10))
    end
    TFDirector:addMEGlobalListener(ChatManager.PrivateChatRedPoint, self.updatePrivateChatRedPoint)

    -- 帮派聊天小红点
    self.updateGangChatRedPoint = function(event)
        CommonManager:updateRedPoint(self.sideButtons[2], ChatManager:isHaveNewChatForIndex(2),ccp(0,-10))
    end
    TFDirector:addMEGlobalListener(ChatManager.GangChatRedPoint, self.updateGangChatRedPoint)

    -- 公共聊天小红点
    self.updatePublicChatRedPoint = function(event)
        CommonManager:updateRedPoint(self.sideButtons[1], ChatManager:isHaveNewChatForIndex(1),ccp(0,-10))
    end
    TFDirector:addMEGlobalListener(ChatManager.PublicChatRedPoint, self.updatePublicChatRedPoint)

    self.updateRedPacket = function(event)
        self:refreshTableView(0)
    end
    TFDirector:addMEGlobalListener(RedPacketManager.RECEIVE_ONE_RED_PACKET, self.updateRedPacket)

    self.refreshPropNumCallFunc = function(event)
        self:refreshUI(1)
    end
    TFDirector:addMEGlobalListener(ChatManager.RefreshChatProp, self.refreshPropNumCallFunc)


    local function onSendBtnClickFunc(btn)
        self.ui:setPosition(ccp(0,0))
        self.img_smile_bg:setVisible(false)
        local channelIndex = self:getSelectedChannelIndex()
        if channelIndex == 1 then
            local level = MainPlayer:getLevel()
            local defaultLevel = ConstantData:getValue("Chat.Public.Level")
            local defaultVIPLevel = ConstantData:getValue("Chat.Public.VipLevel")
            if level < defaultLevel and MainPlayer:getVipLevel() < defaultVIPLevel then  
               --toastMessage("VIP"..defaultVIPLevel.."或者团队等级达到"..defaultLevel.."级时增加免费发言次数")
               toastMessage(stringUtils.format(localizable.chatMainLayer_condition,defaultVIPLevel,defaultLevel))
               return
            end
            local speakerNumber = tonumber(self.txt_speaker_num:getText())
            -- if speakerNumber < 1 then
            if speakerNumber < 1 and self.vipChatTimes < 1 then
                -- if Public:currentScene().__cname == "FightScene" then
                --     toastMessage("您没有足够的小喇叭")
                -- else
                --     self:showMallLayer()
                -- end
                --toastMessage("今日免费聊天次数已用完")
                toastMessage(localizable.chatMainLayer_no_time)
                return
            end
        elseif (channelIndex == EnumChatType.Team and JapanIslandManager:checkIsInTeam() == false) then
            --没有队伍不能发言
            toastMessage(stringUtils.format(localizable.chatNoTeam))
            return
        elseif (channelIndex == EnumChatType.Team_KingOfWar and KingOfWarManager:checkIsInTeam() == false) then
            --没有队伍不能发言
            toastMessage(stringUtils.format(localizable.chatNoTeam))
            return
        end

        local szInput = self.txt_input:getText()
        szInput = string.gsub(szInput, "([\\uE000-\\uF8FF]|\\uD83C[\\uDF00-\\uDFFF]|\\uD83D[\\uDC00-\\uDDFF])", "")
        if ChatManager:sendChatMessage(channelIndex, szInput) then
            self.txt_input:setText("")
            self.txt_input:setTextAreaSize(CCSizeMake(459,0))
        end

    end
    self.btn_send:addMEListener(TFWIDGET_CLICK, audioClickfun(onSendBtnClickFunc),1)

    local function onTextFieldChangedHandle(input)
        -- local text = input:getText()
        -- local new_text = string.gsub(text, "([\\uE000-\\uF8FF]|\\uD83C[\\uDF00-\\uDFFF]|\\uD83D[\\uDC00-\\uDDFF])", "")
        -- input:setText(new_text)
        self.ui:setPosition(ccp(0,400))
        input:setTextAreaSize(CCSizeMake(459,0))
    end

    local function onTextFieldAttachHandle(input)
        self.ui:setPosition(ccp(0,400))
        self.img_smile_bg:setVisible(false)
        self.txt_input:addMEListener(TFTEXTFIELD_TEXTCHANGE, onTextFieldChangedHandle)

        self.bg_niantie:setVisible(true)
        if self.showPasteTimer == nil then
            self.showPasteTimer = TFDirector:addTimer(3000, -1, nil, 
                function() 
                    self:hidePasteButton()
                end)
        end
    end
    self.txt_input:addMEListener(TFTEXTFIELD_ATTACH, onTextFieldAttachHandle)


    -- self.txt_input:addMEListener(TFTEXTFIELD_TEXTCHANGE, onTextFieldChangedHandle)

    local function onTextFieldDetachHandle(input)
        self.ui:setPosition(ccp(0,0))
        self.txt_input:removeMEListener(TFTEXTFIELD_TEXTCHANGE)
        -- local NewStr = self.txt_input:getText()
        -- NewStr = FactionManager:printByte(NewStr)
        -- self.txt_input:setText(NewStr)        
    end
    self.txt_input:addMEListener(TFTEXTFIELD_DETACH, onTextFieldDetachHandle)

    self:refreshSpeakerNum()
    self:refreshTableView(1)

    if self.smileBtnList == nil then
        self.smileBtnList = {}
        local smileArr = ChatManager:getSmileArr()
        local num = 0
        for v in smileArr:iterator() do
            if v.buttonPath then
                local smileBtn = TFButton:create()
                smileBtn:setTextureNormal(v.buttonPath)
                smileBtn:setAnchorPoint(ccp(0, 0))
                -- smileBtn:setPosition(ccp( (num%10) * 71,-math.floor(num/10)*70 ))
                smileBtn.config = v
                smileBtn.logic = self
                self:pushSmileBtn(smileBtn , num)
                -- self.smile_bg:addChild(smileBtn)
                num = num + 1
                self.smileBtnList[num] = smileBtn
            end
        end
    end

    for i=1,#self.smileBtnList do
        self.smileBtnList[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.clickSmileListBtn),1)
    end

    self.bg_niantie.logic=self;
    self.bg_niantie:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onClickPaste),1);

    self:teamInfoEvent()
end

--移除事件
function ChatMainLayer:removeEvents()
    self.txt_input:closeIME()

    self.tableView:removeMEListener(TFTABLEVIEW_SIZEFORINDEX)
    self.tableView:removeMEListener(TFTABLEVIEW_SIZEATINDEX)
    self.tableView:removeMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW)

    TFDirector:removeMEGlobalListener(ChatManager.NewMessage,self.newChatMessageCallback)
    TFDirector:removeMEGlobalListener(ChatManager.PrivateChatRedPoint, self.updatePrivateChatRedPoint)
    TFDirector:removeMEGlobalListener(ChatManager.GangChatRedPoint, self.updateGangChatRedPoint)
    TFDirector:removeMEGlobalListener(ChatManager.PublicChatRedPoint, self.updatePublicChatRedPoint)
    TFDirector:removeMEGlobalListener(ChatManager.RefreshChatProp, self.refreshPropNumCallFunc)
    TFDirector:removeMEGlobalListener(RedPacketManager.RECEIVE_ONE_RED_PACKET, self.updateRedPacket)

    TFDirector:removeMEGlobalListener(JapanIslandManager.UpdateNewChatMsg, self.updateNewMsg)
    TFDirector:removeMEGlobalListener(JapanIslandManager.UpdateInvitationMsg, self.updateNewMsg)
    TFDirector:removeMEGlobalListener(JapanIslandManager.UpdateTeamInfoMsg, self.updateTeamMsg)
    self.updateTeamMsg = nil
    self.updateNewMsg = nil


    TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateNewChatMsg, self.updateKingOfWarNewMsg)
    TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateInvitationMsg, self.updateKingOfWarNewMsg)
    TFDirector:removeMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.updateKingOfWarTeamMsg)
    self.updateKingOfWarTeamMsg = nil
    self.updateKingOfWarNewMsg = nil


    self.btn_send:removeMEListener(TFWIDGET_CLICK)
    self.btn_smile:removeMEListener(TFWIDGET_CLICK)

    self:hidePasteButton()

    if self.friendTableView then
        self.friendTableView:removeEvents()
    end

    for i = 1, #self.sideButtons do
        self.sideButtons[i]:removeMEListener(TFWIDGET_CLICK)
    end
    ChatManager:playTalk(nil)
    self.super.removeEvents(self)
end

function ChatMainLayer.cellSizeForTable(table,idx)
    local self = table.logic
    local _message = self.messageList:objectAt(idx+1)
    if _message.spilt then
        return 40,758
    -- elseif _message.audioTime then
    --     return 108,758
    else
        return 112,758
    end
    
end

function ChatMainLayer.tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()
    local self = table.logic
    local index = idx + 1
    self.messagePanels = self.messagePanels or {}
    self.spiltPanels = self.spiltPanels or {}
    self.talkMsgPanels = self.talkMsgPanels or {}
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        local messagePanel = require('lua.logic.chat.PublicMessageCell'):new()
        messagePanel:setPosition(ccp(0,0))
        messagePanel:setLogic(self)
        cell:addChild(messagePanel)
        cell.messagePanel = cell.messagePanel or {}
        cell.messagePanel = messagePanel
        local newIndex = #self.messagePanels + 1
        self.messagePanels[newIndex] = messagePanel

        local spiltPanel = require('lua.logic.chat.TimeSpilt'):new()
        spiltPanel:setPosition(ccp(0,0))
        spiltPanel:setLogic(self)
        cell:addChild(spiltPanel)
        cell.spiltPanel = cell.spiltPanel or {}
        cell.spiltPanel = spiltPanel
        newIndex = #self.spiltPanels + 1
        self.spiltPanels[newIndex] = spiltPanel

        local talkMsgPanel = require('lua.logic.chat.TalkMessageCell'):new()
        talkMsgPanel:setPosition(ccp(0,0))
        talkMsgPanel:setLogic(self)
        cell:addChild(talkMsgPanel)
        cell.talkMsgPanel = talkMsgPanel
        newIndex = #self.talkMsgPanels + 1
        self.talkMsgPanels[newIndex] = talkMsgPanel
    end

    if (ChatMainLayer._team == selectedIndex) then
        cell.messagePanel:setVisible(true)
        cell.spiltPanel:setVisible(false)
        cell.talkMsgPanel:setVisible(false)
        local messageList = (JapanIslandManager:checkIsInTeam() == true) and JapanIslandManager:getTeamChatMsg() or JapanIslandManager:getRefuseSuccessMsg()
        if (index <= messageList:length()) then
            cell.messagePanel:setMessage(messageList:getObjectAt(index))
        end
    elseif (ChatMainLayer._kingofwar == selectedIndex) then
        cell.messagePanel:setVisible(true)
        cell.spiltPanel:setVisible(false)
        cell.talkMsgPanel:setVisible(false)
        local messageList = (KingOfWarManager:checkIsInTeam() == true) and KingOfWarManager:getTeamChatMsg() or KingOfWarManager:getRefuseSuccessMsg()
        if (index <= messageList:length()) then
            cell.messagePanel:setMessage(messageList:getObjectAt(index))
        end
    elseif index <= self.messageList:length() then
        local _message = self.messageList:objectAt(index)
        if _message.spilt then
            cell.spiltPanel:setVisible(true)
            cell.messagePanel:setVisible(false)
            cell.talkMsgPanel:setVisible(false)
            cell.spiltPanel:setMessage(_message)
        elseif _message.audioId and _message.audioId ~= "" then
            cell.messagePanel:setVisible(false)
            cell.spiltPanel:setVisible(false)
            cell.talkMsgPanel:setVisible(true)
            cell.talkMsgPanel:setMessage(_message)
        else
            cell.messagePanel:setVisible(true)
            cell.spiltPanel:setVisible(false)
            cell.talkMsgPanel:setVisible(false)
            cell.messagePanel:setMessage(_message)
        end
    else
        cell.messagePanel:setVisible(false)
        cell.spiltPanel:setVisible(false)
        cell.talkMsgPanel:setVisible(false)
    end

    return cell
end

function ChatMainLayer.numberOfCellsInTableView(table)
    local self = table.logic
    local num = self.messageList:length()
    return num
end

--table cell 被选中时在对应的Cell中触发此回调函数
function ChatMainLayer:tableCellClick(cell)

end

function ChatMainLayer:hidePasteButton()
    if self.showPasteTimer then
        TFDirector:removeTimer(self.showPasteTimer)
        self.showPasteTimer = nil
    end

    self.bg_niantie:setVisible(false)
end

function ChatMainLayer.onClickPaste(sender)
    local self = sender.logic

    self:hidePasteButton()

    local content = TFDeviceInfo:getClipBoardText()
    if content then
        self.txt_input:setText(TFDeviceInfo:getClipBoardText())
        self.txt_input:setTextAreaSize(CCSizeMake(459,0))
    end
end

--队伍监听
function ChatMainLayer:teamInfoEvent()
    self.updateNewMsg = function(event)
        local btn = self.sideButtons[ChatMainLayer._team]
        if (btn) then
            btn:setVisible(true)
            self:makeTeamBtnPos()
        end
        if (selectedIndex ~= ChatMainLayer._team) then
           CommonManager:updateRedPoint(self.sideButtons[ChatMainLayer._team], true,ccp(0,-10))
        else
            JapanIslandManager:setTeamChatRedState(false)
            self:refreshTableView(ChatMainLayer._team)
        end
        
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.UpdateNewChatMsg, self.updateNewMsg)
    TFDirector:addMEGlobalListener(JapanIslandManager.UpdateInvitationMsg, self.updateNewMsg)

    self.updateTeamMsg = function(event)
        self:refreshTableView(ChatMainLayer._team)
    end
    TFDirector:addMEGlobalListener(JapanIslandManager.UpdateTeamInfoMsg, self.updateTeamMsg)



    self.updateKingOfWarNewMsg = function(event)
        local btn = self.sideButtons[ChatMainLayer._kingofwar]
        if (btn) then
            btn:setVisible(true)
            self:makeTeamBtnPos()
        end
        if (selectedIndex ~= ChatMainLayer._kingofwar) then
           CommonManager:updateRedPoint(self.sideButtons[ChatMainLayer._kingofwar], true,ccp(0,-10))
        else
            KingOfWarManager:setTeamChatRedState(false)
            self:refreshTableView(ChatMainLayer._kingofwar)
        end
        
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateNewChatMsg, self.updateKingOfWarNewMsg)
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateInvitationMsg, self.updateKingOfWarNewMsg)

    self.updateKingOfWarTeamMsg = function(event)
        self:refreshTableView(ChatMainLayer._kingofwar)
    end
    TFDirector:addMEGlobalListener(KingOfWarManager.UpdateTeamInfoMsg, self.updateKingOfWarTeamMsg)
end

return ChatMainLayer
