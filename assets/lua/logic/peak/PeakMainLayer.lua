-- client side PeakMainLayer.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2016-06-22

local PeakMainLayer = class("PeakMainLayer", BaseLayer)

function PeakMainLayer:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.Lunjianfeng.LunJianMain")
end

function PeakMainLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.panel_list     = TFDirector:getChildByPath(ui, 'panel_list')
    self.panel_headlist = TFDirector:getChildByPath(ui, 'panel_headlist')
    self.panel_mine     = TFDirector:getChildByPath(ui, 'panel_mine')
    self.panel_floor    = TFDirector:getChildByPath(ui, 'panel_floor')
    self.panel_bg       = TFDirector:getChildByPath(ui, 'panel_bg')
    self.panel_zzcc     = TFDirector:getChildByPath(ui, 'panel_zzcc')
    self.panel_front    = TFDirector:getChildByPath(ui, 'panel_front')
    self.btn_close  = TFDirector:getChildByPath(ui, 'btn_fanhui')
    self.zzccInfo   = {} -- 该层众志成城
    self.zzccInfo.node  = TFDirector:getChildByPath(ui, 'img_fuwuqi')
    self.zzccInfo.txt   = TFDirector:getChildByPath(ui, 'txt_fuwuqi')

    self.txt_page       = TFDirector:getChildByPath(self.panel_list, 'txt_page')

    self.btn_timeAdd    = TFDirector:getChildByPath(ui, 'btn_jia')
    self.txt_curTimes   = TFDirector:getChildByPath(ui, 'txt_cishu')
    self.txt_maxTimes   = TFDirector:getChildByPath(ui, 'txt_cishu2')

    self.panel_role_n7_model = TFDirector:getChildByPath(ui, 'panel_role')
    self.panel_role_n7_model:retain()
    self.panel_role_n7_model:removeFromParent(true)
    self.panel_role_n7_model:setVisible(false)

    self.panel_role_n4_model = TFDirector:getChildByPath(ui, 'panel_role_2')
    self.panel_role_n4_model:retain()
    self.panel_role_n4_model:removeFromParent(true)
    self.panel_role_n4_model:setVisible(false)

    self.panel_role_n5_model = TFDirector:getChildByPath(ui, 'panel_role_3')
    self.panel_role_n5_model:retain()
    self.panel_role_n5_model:removeFromParent(true)
    self.panel_role_n5_model:setVisible(false)

    self.panel_role_n6_model = TFDirector:getChildByPath(ui, 'panel_role_4')
    self.panel_role_n6_model:retain()
    self.panel_role_n6_model:removeFromParent(true)
    self.panel_role_n6_model:setVisible(false)

    self.panel_floor_model = TFDirector:getChildByPath(self.panel_floor, 'panel_floor_cell')
    self.panel_floor_model:retain()
    self.panel_floor_model:removeFromParent(true)
    self.panel_floor_model:setVisible(false)

    self.panel_head_model = TFDirector:getChildByPath(self.panel_headlist, 'panel_cell')
    self.panel_head_model:retain()
    self.panel_head_model:removeFromParent(true)
    self.panel_head_model:setVisible(false)

    self.img_bg_model = TFDirector:getChildByPath(self.panel_bg, 'img_bg')
    
    local resPath = "effect/peak_back.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("peak_back_anim")
    self.img_bg_model:addChild(effect,100,100)
    effect:setPosition(ccp(1136*0.5,394))
    self.img_bg_model:retain()
    self.img_bg_model:removeFromParent(true)
    self.img_bg_model:setVisible(false)

    resPath = "effect/peak_front.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    self.effect_front_model = TFArmature:create("peak_front_anim")
    self.effect_front_model:setPosition(ccp(960*0.5,316))
    self.effect_front_model:retain()
    self.effect_front_model:setVisible(false)

    resPath = "effect/peak_cloud.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    self.effect_cloud_model = TFArmature:create("peak_cloud_anim")
    self.effect_cloud_model:setPosition(ccp(960*0.5,316))
    self.effect_cloud_model:retain()
    self.effect_cloud_model:setVisible(false)

    resPath = "effect/peak_point.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    self.effect_point_model = TFArmature:create("peak_point_anim")
    self.effect_point_model:retain()
    self.effect_point_model:setVisible(false)

    resPath = "effect/peak_zzcc.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    self.zzccInfo.effect = TFArmature:create("peak_zzcc_anim")
    self.zzccInfo.effect:playByIndex(0,-1,-1,1)
    self.zzccInfo.effect:setPosition(self.zzccInfo.node:getPosition())
    self.panel_zzcc:addChild(self.zzccInfo.effect,0)
    self.panel_zzcc:setVisible(true)

    self.btn_buzhen = TFDirector:getChildByPath(ui, 'btn_fangshou')
    self.btn_rank = TFDirector:getChildByPath(ui, 'btn_paihang')
    self.btn_record = TFDirector:getChildByPath(ui, 'btn_zhandou')
    self.btn_shop = TFDirector:getChildByPath(ui, 'btn_shop')
    self.btn_help = TFDirector:getChildByPath(ui, 'btn_help')
    self.btn_help:setVisible(false)
    self.btn_head = TFDirector:getChildByPath(self.panel_mine, 'bg_icon')

    self.buffBtns = {}
    self.buffBtns[1] = TFDirector:getChildByPath(ui, 'btn_buff1')
    self.buffBtns[2] = TFDirector:getChildByPath(ui, 'btn_buff2')
    self.buffBtns[3] = TFDirector:getChildByPath(ui, 'btn_buff3')
    self.buffBtns[3].txt_num = TFDirector:getChildByPath(self.buffBtns[3], 'txt_num')

    self.BuffPath = {'ui_new/lunjian/icon_pwbuff3_1.png','ui_new/lunjian/icon_pwbuff1.png','ui_new/lunjian/icon_pwbuff3_2.png',
        'ui_new/lunjian/icon_pwbuff1_1.png','ui_new/lunjian/icon_pwbuff3_3.png'
    }

    self.btn_left = TFDirector:getChildByPath(ui, 'btn_left')
    self.btn_right = TFDirector:getChildByPath(ui, 'btn_right')

    local img_headIcon = TFDirector:getChildByPath(self.panel_mine, "img_touxiang")
    img_headIcon:setTexture(MainPlayer:getIconPath())
    Public:addFrameImg(img_headIcon,MainPlayer:getHeadPicFrameId())

    self.myInfoNodes = {}
    self.myInfoNodes.txt_time = TFDirector:getChildByPath(self.panel_mine, "txt_time")
    self.myInfoNodes.txt_info = TFDirector:getChildByPath(self.panel_mine, "txt_mypointinfo")
    self.myInfoNodes.txt_score = TFDirector:getChildByPath(self.panel_mine, "txt_score")
    self.PER_PAGE_POINT_NUM = ConstantData:objectByID("PeakOnePageNum").value
    self.floorId = 0
    self:drawFloor()
    self:initBgEffect()
    self.ScrollTimeIndex = 0
    self.questIndex = 2
    self:UpdateInfo()
    self:initPageView()
    self.floorPageHistory = {}
    self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
    function()
        if self.isShow == true then
            self:UpdateInfo()
        end
    end)
    self:ScrollInfo()
    self.showScrollInfoTimer = TFDirector:addTimer(15,-1,nil,function ()
        if self.isShow == true then
            self:scrollNode()
            self:scrollBgByPageview()
        end
    end)
end

function PeakMainLayer:initPageView()
    local pageView = TPageView:create()
    self.pageView = pageView

    pageView:setTouchEnabled(true)
    pageView:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
    pageView:setSize(self.panel_list:getContentSize())
    pageView:setAnchorPoint(self.panel_list:getAnchorPoint())

    local function onPageChange()
        self:onPageChange();
    end
    pageView:setChangeFunc(onPageChange)

    local function itemAdd(index)
        return  self:addPage(index)
    end 
    pageView:setAddFunc(itemAdd)

    self.panel_list:addChild(pageView,2);
end

function PeakMainLayer:onPageChange()
    local pageIndex = self.pageView:_getCurPageIndex() ;
    self:showInfoForPage(pageIndex);
    self.isQuestionInfo = true
    print('onPageChange')
    PeakManager:requestPeakInfo(self.floorId,pageIndex)
end

function PeakMainLayer:addPage(index)
    local page = TFPanel:create();
    page:setSize(self.panel_list:getContentSize())

    local panel_role_cell = self.panel_role_n7_model
    local floorData = PeakData:objectByID(self.floorId)
    self.maxPageNum = math.ceil(floorData.pos_num/self.PER_PAGE_POINT_NUM)
    local num = 7
    if self.maxPageNum <= index then
        num = floorData.pos_num - (index-1) * self.PER_PAGE_POINT_NUM
        if num == 4 then
            panel_role_cell = self.panel_role_n4_model
        elseif num == 5 then
            panel_role_cell = self.panel_role_n5_model
        elseif num == 6 then
            panel_role_cell = self.panel_role_n6_model
        end
    end
    local panel_role = panel_role_cell:clone()
    panel_role:setVisible(true)
    panel_role.posNum = num
    page:addChild(panel_role)
    page.idx = index
    if self.pageIdx == index then
        self:setPageInfo(panel_role,index)
    else
        self:defaultPage(panel_role,index)
    end
    self.pageList = self.pageList or {}
    self.pageList[#self.pageList + 1] = page
    return page
end

function PeakMainLayer:showPage( pageIdx )
    self.pageView:_removeAllPages();

    local floorData = PeakData:objectByID(self.floorId)
    self.maxPageNum = math.ceil(floorData.pos_num/self.PER_PAGE_POINT_NUM)

    self.pageView:setMaxLength(self.maxPageNum)

    self.pageList        = {};

    self:showInfoForPage(pageIdx);

    self.pageView:InitIndex(pageIdx);
end

function PeakMainLayer:brushChallengeTimes()
    local times = 0
    local challengeInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.PEAK)
    times = challengeInfo:getLeftChallengeTimes()
    self.txt_curTimes:setText(times .. '')
    local maxTimes = ConstantData:objectByID("PeakEveryDayNum").value
    self.txt_maxTimes:setText('/' .. maxTimes)
end

function PeakMainLayer:showInfoForPage(pageIndex)
    self.pageIdx = pageIndex;
    self.txt_page:setText(self.pageIdx .. '/' .. self.maxPageNum)
    if self.maxPageNum <= 1 then
        self.btn_left:setVisible(false)
        self.btn_right:setVisible(false)
    else
        self.btn_left:setVisible(true)
        self.btn_right:setVisible(true)
    end
end

function PeakMainLayer:setPageInfo(panel_role,index)
    local floorInfo = PeakManager:getFloorInfo()
    if #floorInfo > 0 then
        local role_Nodes = {}
        for i=1,panel_role.posNum do
            role_Nodes[i] = {}
            local rootNode = TFDirector:getChildByPath(panel_role, "panel_role" .. i)
            role_Nodes[i].panel = rootNode
            role_Nodes[i].img_di = TFDirector:getChildByPath(rootNode, "img_di")
            role_Nodes[i].img_di.logic = self
            role_Nodes[i].img_di:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnOccupiedClick))
            role_Nodes[i].txt_server = TFDirector:getChildByPath(rootNode, "txt_fwq")
            role_Nodes[i].node_server = TFDirector:getChildByPath(rootNode, "img_fwq")
            role_Nodes[i].txt_power = TFDirector:getChildByPath(rootNode, "txt_power")
            role_Nodes[i].img_splash = TFDirector:getChildByPath(rootNode, "img_splash")
            role_Nodes[i].txt_name = TFDirector:getChildByPath(rootNode, "txt_name")
            role_Nodes[i].img_name = TFDirector:getChildByPath(rootNode, "img_name")
            role_Nodes[i].btn_di = TFDirector:getChildByPath(rootNode, "btn_di")
            role_Nodes[i].btn_di:setTouchEnabled(false)
            role_Nodes[i].img_touxiang = TFDirector:getChildByPath(rootNode, "img_touxiang")
            local floorData = PeakData:objectByID(self.floorId)
            local pos = (index - 1)*self.PER_PAGE_POINT_NUM + i
            if floorData.pos_num > 0 and pos > floorData.pos_num then
                role_Nodes[i].panel:setVisible(false)
            else
                role_Nodes[i].panel:setVisible(true)
            end
            role_Nodes[i].txt_server:setText("")
            role_Nodes[i].node_server:setVisible(false)
            role_Nodes[i].txt_power:setText("")
            role_Nodes[i].img_splash:setVisible(false)
            role_Nodes[i].txt_name:setText("")
            role_Nodes[i].img_name:setVisible(false)
            role_Nodes[i].btn_di:setVisible(false)
            local dataInfo = {}
            dataInfo.type = 0
            dataInfo.layer = self.floorId
            dataInfo.pos = pos
            dataInfo.playerId = 0
            role_Nodes[i].img_di.dataInfo = dataInfo
            role_Nodes[i].effect = self.effect_point_model:clone()
            rootNode:addChild(role_Nodes[i].effect,100)
            role_Nodes[i].effect:playByIndex(0,-1,-1,1)
            role_Nodes[i].effect:setPosition(75,42)
            role_Nodes[i].effect:setVisible(true)
        end
        local myInfo = PeakManager:getMyInfo()
        for k,v in pairs(floorInfo) do
            local pageIdx = math.ceil(v.pos/self.PER_PAGE_POINT_NUM)
            local posIdx = v.pos - (pageIdx - 1)*self.PER_PAGE_POINT_NUM

            if role_Nodes[posIdx] ~= nil then
                role_Nodes[posIdx].node_server:setVisible(true)
                role_Nodes[posIdx].img_splash:setVisible(true)
                role_Nodes[posIdx].img_name:setVisible(true)
                role_Nodes[posIdx].btn_di:setVisible(true)
                role_Nodes[posIdx].effect:setVisible(false)

                role_Nodes[posIdx].txt_server:setText('s' .. math.mod(v.serverId,1000))
                role_Nodes[posIdx].txt_power:setText(v.power)
                role_Nodes[posIdx].txt_name:setText(v.name)
                role_Nodes[posIdx].img_di.dataInfo.playerId = v.playerId
                if v.useIcon == 0 then
                    v.useIcon = 1
                end
                if v.playerId == MainPlayer:getPlayerId() and v.serverId == myInfo.serverId then
                    role_Nodes[posIdx].img_di.dataInfo.type = 1
                    role_Nodes[posIdx].img_name:setTexture('ui_new/lunjian/bg_name2.png')
                    role_Nodes[posIdx].node_server:setTexture('ui_new/lunjian/bg_fwqname2.png')
                else
                    role_Nodes[posIdx].img_name:setTexture('ui_new/lunjian/bg_name1.png')
                    role_Nodes[posIdx].node_server:setTexture('ui_new/lunjian/bg_fwqname.png')
                end
                local roleConfig = RoleData:objectByID(v.useIcon)
                if roleConfig == nil then
                    roleConfig = RoleData:objectByID(77)
                end
                role_Nodes[posIdx].img_touxiang:setTexture(roleConfig:getIconPath())
                Public:addFrameImg(role_Nodes[posIdx].img_touxiang,v.headPicFrame)
            end
        end
    else
        self:defaultPage(panel_role,index)
    end
end

function PeakMainLayer:defaultPage(panel_role,index)
    for i=1,panel_role.posNum do
        local rootNode = TFDirector:getChildByPath(panel_role, "panel_role" .. i)
        local txt_server = TFDirector:getChildByPath(rootNode, "txt_fwq")
        local node_server = TFDirector:getChildByPath(rootNode, "img_fwq")
        local txt_power = TFDirector:getChildByPath(rootNode, "txt_power")
        local img_splash = TFDirector:getChildByPath(rootNode, "img_splash")
        local txt_name = TFDirector:getChildByPath(rootNode, "txt_name")
        local img_name = TFDirector:getChildByPath(rootNode, "img_name")
        local btn_di = TFDirector:getChildByPath(rootNode, "btn_di")
        local img_touxiang = TFDirector:getChildByPath(rootNode, "img_touxiang")
        local img_di = TFDirector:getChildByPath(rootNode, "img_di")
        img_di.logic = self
        img_di:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnOccupiedClick))
        txt_server:setText("")
        node_server:setVisible(false)
        txt_power:setText("")
        img_splash:setVisible(false)
        txt_name:setText("")
        img_name:setVisible(false)
        btn_di:setVisible(false)
        btn_di:setTouchEnabled(false)
        local floorData = PeakData:objectByID(self.floorId)
        local pos = (index - 1)*self.PER_PAGE_POINT_NUM + i
        if floorData.pos_num > 0 and pos > floorData.pos_num then
            rootNode:setVisible(false)
        else
            rootNode:setVisible(true)
        end
        local dataInfo = {}
        dataInfo.type = 0
        dataInfo.layer = self.floorId
        dataInfo.pos = pos
        dataInfo.playerId = 0
        img_di.dataInfo = dataInfo
        local effect = self.effect_point_model:clone()
        rootNode:addChild(effect,100)
        effect:playByIndex(0,-1,-1,1)
        effect:setPosition(75,42)
        effect:setVisible(true)
    end
end

function PeakMainLayer:drawFloor()
    local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.panel_floor:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

    self.floor_tableView = tableView
    self.floor_tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, PeakMainLayer.floor_cellSizeForTable,self)
    self.floor_tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, PeakMainLayer.floor_tableCellAtIndex,self)
    self.floor_tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, PeakMainLayer.floor_numberOfCellsInTableView,self)
    --self.tableView:addMEListener(TFTABLEVIEW_SCROLL, PeakMainLayer.tableScroll,self)
    tableView.logic = self
    self.panel_floor:addChild(tableView)
    self.floor_tableView:reloadData()
end

function PeakMainLayer.floor_cellSizeForTable( table,idx )
    local num = PeakData:length()
    if num < 0 then 
        num = 0 
    end
    if idx == num - 1 then
        return 100,200
    end 
    if idx == 0 then
        return 100,200
    end 
    return 70,200
end

function PeakMainLayer.floor_tableCellAtIndex( table,idx )
    local self = table.logic
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local panel_floor = self.panel_floor_model:clone()
        panel_floor:setTag(100)
        local btn_floor = TFDirector:getChildByPath(panel_floor, 'btn_floor')
        btn_floor.logic = self
        btn_floor:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnFloorClick))
        cell:addChild(panel_floor)
    end
    self:floor_setCellInfo(cell,idx)
    return cell
end

function PeakMainLayer:floor_setCellInfo(cell,idx)
    local panel_floor = cell:getChildByTag(100)
    if panel_floor == nil then
        return
    end
    local btn_floor = TFDirector:getChildByPath(panel_floor, 'btn_floor')
    local img_fwq = TFDirector:getChildByPath(panel_floor, 'img_fwq')
    local num = PeakData:length()
    local index = num - idx + 1
    if index <= 0 then 
        panel_floor:setVisible(false)
        return 
    end
    panel_floor:setVisible(true)
    local floorData = PeakData:objectByID(index)
    local path = {
        {'ui_new/lunjian/btn_Xceng_u.png','ui_new/lunjian/btn_Xceng_d.png'},
        {'ui_new/lunjian/btn_Xceng_1.png','ui_new/lunjian/btn_Xceng_2.png'}
    }
    if self.floorId and index == self.floorId then
        btn_floor:setTextureNormal(path[floorData.type][2])
        btn_floor:setTexturePressed(path[floorData.type][2])
    else
        btn_floor:setTextureNormal(path[floorData.type][1])
        btn_floor:setTexturePressed(path[floorData.type][2])
    end
    local txt_floor = TFDirector:getChildByPath(btn_floor, 'txt_num')
    txt_floor:setText(index)
    if index == 1 then
        panel_floor:setPositionY(65)
    else
        panel_floor:setPositionY(35)
    end
    btn_floor.idx = index
    local tag = index%2
    if tag == 1 then
        panel_floor:setPositionX(65)
    elseif tag == 0 then
        panel_floor:setPositionX(128)
    end
    local unitedInfo = PeakManager:getUnitedInfoById(index)
    if unitedInfo == nil then
        img_fwq:setVisible(false)
    else
        img_fwq:setVisible(true)
        local txt_fwq = TFDirector:getChildByPath(img_fwq, 'txt_num')
        txt_fwq:setText('s' .. math.mod(unitedInfo.serverId,1000))
    end
end

function PeakMainLayer.floor_numberOfCellsInTableView( table )
    local num = PeakData:length()
    if num < 0 then 
        num = 0 
    end
    return num
end

function PeakMainLayer:drawFloorInfo(data)
    if self.floorId > 0 and self.floorId < data.floorId then
        self.panel_list:setVisible(false)
        self.panel_zzcc:setVisible(false)
        self:acFloorDown()
    elseif self.floorId > 0 and self.floorId > data.floorId then
        self.panel_list:setVisible(false)
        self.panel_zzcc:setVisible(false)
        self:acFloorUp()
    end
    self.floorId = data.floorId
    self.pageIdx = data.pageIdx
    self.floorPageHistory[self.floorId] = self.pageIdx
    self.floor_tableView:reloadData()
    local size1 = self.floor_tableView:getSize()
    local num = PeakData:length()
    local maxHeight = num * 70 + 60

    local centerHeight = size1.height * 0.5 - (self.floorId - 1) * 70 - 30
    local maxOffSet = size1.height - maxHeight
    if centerHeight > 0 then
        centerHeight = 0
    end
    if centerHeight < maxOffSet then
        centerHeight = maxOffSet
    end
    local offSet = self.floor_tableView:getContentOffset()
    offSet.y = centerHeight
    self.floor_tableView:setContentOffset(offSet,0.3)
    self:showPage(self.pageIdx)
    self:brushBuffState()
    local unitedInfo = PeakManager:getUnitedInfoById(self.floorId)
    if unitedInfo == nil then
        self.zzccInfo.node:setVisible(false)
        self.zzccInfo.effect:setVisible(false)
    else
        self.zzccInfo.node:setVisible(true)
        self.zzccInfo.effect:setVisible(true)
        -- local serverInfo = SaveManager:getServerInfo(unitedInfo.serverId)
        -- local serverName = ""
        -- if serverInfo then
        --     serverName = serverInfo.name
        -- end
        self.zzccInfo.txt:setText(unitedInfo.serverName)
    end
    self:brushChallengeTimes()
    self:UpdateInfo()
end

function PeakMainLayer:acFloorDown()
    if self.isMoving == true then
        return
    end
    local old_imgbg = self.panel_bg:getChildByTag(100)
    local old_effectfront = self.panel_front:getChildByTag(100)

    local size = CCSizeMake(1136,829)

    local tNode = self:getBgNode()
    tNode[1]:setPosition(ccp(960*0.5,0 + size.height))
    tNode[2]:setPosition(ccp(960*0.5,0 + size.height))
    self.panel_bg:addChild(tNode[1],0,100)
    self.panel_front:addChild(tNode[2],0,100)

    local effectCloud = self.effect_cloud_model:clone()
    effectCloud:setPositionY(320 + size.height)
    effectCloud:setVisible(true)
    effectCloud:playByIndex(0, -1, -1, 1)
    self.panel_front:addChild(effectCloud)
    
    self.isMoving = true
    if old_imgbg then
        local moveAc1 = CCMoveBy:create(0.2,ccp(0,-100))
        local moveAc = CCMoveTo:create(0.6,ccp(old_imgbg:getPositionX(),0 - size.height))
        local callFuncN = CCCallFuncN:create( function()
            old_imgbg:removeFromParent()
        end)
        local actionMove = CCSequence:createWithTwoActions(moveAc1,moveAc)
        old_imgbg:runAction(CCSequence:createWithTwoActions(actionMove,callFuncN))
    end
    if old_effectfront then
        local moveAc = CCMoveTo:create(0.9,ccp(old_effectfront:getPositionX(),0 - size.height))
        local callFuncN = CCCallFuncN:create( function()
            old_effectfront:removeFromParent()
        end)
        
        old_effectfront:runAction(CCSequence:createWithTwoActions(moveAc,callFuncN))
    end
    local delay = CCDelayTime:create(0.1)
    local moveAc = CCMoveTo:create(0.7,ccp(effectCloud:getPositionX(),- size.height*0.5))
    local seq = CCSequence:createWithTwoActions(delay,moveAc)
    local callFuncN = CCCallFuncN:create( function()
        effectCloud:removeFromParent()
    end)
    effectCloud:runAction(CCSequence:createWithTwoActions(seq,callFuncN))

    local moveAc1 = CCMoveBy:create(0.2,ccp(0,-100))
    local moveAc2 = CCMoveTo:create(0.6,ccp(tNode[1]:getPositionX(),0))
    tNode[1]:runAction(CCSequence:createWithTwoActions(moveAc1,moveAc2))

    delay = CCDelayTime:create(0.1)
    local delay1 = CCDelayTime:create(0.1)
    moveAc = CCMoveTo:create(0.7,ccp(tNode[2]:getPositionX(),0))
    seq = CCSequence:createWithTwoActions(delay,moveAc)
    callFuncN = CCCallFuncN:create( function()
        self.isMoving = false
        self.panel_list:setVisible(true)
        self.panel_zzcc:setVisible(true)
    end)
    seq = CCSequence:createWithTwoActions(seq,delay1)
    tNode[2]:runAction(CCSequence:createWithTwoActions(seq,callFuncN))
end

function PeakMainLayer:acFloorUp()
    if self.isMoving == true then
        return
    end
    local old_imgbg = self.panel_bg:getChildByTag(100)
    local old_effectfront = self.panel_front:getChildByTag(100)
    local size = CCSizeMake(1136,829)

    local tNode = self:getBgNode()
    tNode[1]:setPosition(ccp(960*0.5,0 - size.height))
    tNode[2]:setPosition(ccp(960*0.5,0 - size.height))
    self.panel_bg:addChild(tNode[1],0,100)
    self.panel_front:addChild(tNode[2],0,100)

    local effectCloud = self.effect_cloud_model:clone()
    effectCloud:setPositionY(- 0.5*size.height )
    effectCloud:setVisible(true)
    effectCloud:playByIndex(0, -1, -1, 1)
    self.panel_front:addChild(effectCloud)
    
    self.isMoving = true
    if old_imgbg then
        local moveAc = CCMoveTo:create(0.7,ccp(old_imgbg:getPositionX(),0 + size.height))
        local callFuncN = CCCallFuncN:create( function()
            old_imgbg:removeFromParent()
        end)
        old_imgbg:runAction(CCSequence:createWithTwoActions(moveAc,callFuncN))
    end
    if old_effectfront then
        local moveAc = CCMoveTo:create(0.8,ccp(old_effectfront:getPositionX(),0 + size.height))
        local callFuncN = CCCallFuncN:create( function()
            old_effectfront:removeFromParent()
        end)
        
        old_effectfront:runAction(CCSequence:createWithTwoActions(moveAc,callFuncN))
    end

    local moveAc = CCMoveTo:create(0.8,ccp(effectCloud:getPositionX(),640 + size.height*0.5))
    local callFuncN = CCCallFuncN:create( function()
        effectCloud:removeFromParent()
    end)
    effectCloud:runAction(CCSequence:createWithTwoActions(moveAc,callFuncN))

    local moveAc2 = CCMoveTo:create(0.7,ccp(tNode[1]:getPositionX(),0))
    tNode[1]:runAction(moveAc2)

    moveAc = CCMoveTo:create(0.8,ccp(tNode[2]:getPositionX(),0))
    callFuncN = CCCallFuncN:create( function()
        self.isMoving = false
        self.panel_list:setVisible(true)
        self.panel_zzcc:setVisible(true)
    end)
    tNode[2]:runAction(CCSequence:createWithTwoActions(moveAc,callFuncN))
end

function PeakMainLayer:scrollBgByPageview()
    if self.pageView then
        local pageIndex0 = self.pageView:getCurPageIndex()
        local page = self.pageView:getPage(pageIndex0)
        if page then
            local posX = page:getPositionX()
            local node_imgbg = self.panel_bg:getChildByTag(100)
            local node_effectfront = self.panel_front:getChildByTag(100)
            if node_imgbg then
                node_imgbg:setPositionX(960*0.5 + posX)
            end
            if node_effectfront then
                node_effectfront:setPositionX(960*0.5 + posX)
            end
        end
    end
end
----------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>------------
function PeakMainLayer:showScrollInfo()
    local dataList = self:getScrollInfoData()
    if #dataList <= 0 then
        return
    end
    for i=1,#dataList do
        if self:isNeedScroll(dataList[i]) == true then
            self:addScrollNode(dataList[i],true)
        end
    end
end

function PeakMainLayer:isNeedScroll( item )
    local childrenArr = self.panel_headlist:getChildren()
    local childTemp = nil
    for i=0,childrenArr:count()-1 do
        local child = childrenArr:objectAtIndex(i);
        local item0 = child.item
        if item0 ~= nil then
            if item0.index == 1 then
                childTemp = child
            end
            if item0.t == item.t and item0.data.layer == item.data.layer then
                if item0.t == 1 and item0.data.playerId == item.data.playerId and item0.data.serverId == item.data.serverId then
                    return false
                end
                if item0.t == 2 and item0.data.serverId == item.data.serverId then
                    return false
                end
            end
        end
    end
    if childTemp and item.index == 1 then
        childTemp.item.index = nil
    end
    return true
end

function PeakMainLayer:scrollNode()
    if self.ScrollTimeIndex > 0 then
        self.ScrollTimeIndex = self.ScrollTimeIndex - 1
        return
    end
    self.ScrollTimeIndex = 0
    local childrenArr = self.panel_headlist:getChildren()
    local removeList = {}
    for i=0,childrenArr:count()-1 do
        local child = childrenArr:objectAtIndex(i);
        if child:getPositionX() <= -330 then
            table.insert(removeList,child)
        end
        child:setPositionX(child:getPositionX() - 1)
        local posX = child:getPositionX() - 1
        local item = child.item
        if item.index == 1 then 
            if self.ScrollTimeIndex <= 0 and posX > 90.5 and posX < 91.5 then
                self.ScrollTimeIndex = 300
            end
        end
    end
    local bShow = false
    if #removeList > 0 then
        bShow = true
    end
    for k,v in pairs(removeList) do
        v:removeFromParent()
    end
    if bShow == true then
        self:ScrollInfo()
    end
end

function PeakMainLayer:addScrollNode( item ,bscroll)
    local maxPos = 821 - 400
    local childrenArr = self.panel_headlist:getChildren()
    for i=0,childrenArr:count()-1 do
        local child = childrenArr:objectAtIndex(i);
        if child:getPositionX() >= maxPos  then
            maxPos = child:getPositionX()
        end
    end
    maxPos = maxPos + 400
    local scroll_node = self:getScrollNode(item)
    if scroll_node ~= nil then
        self.panel_headlist:addChild(scroll_node,10)
        scroll_node:setPosition(ccp(maxPos,0))
    end
end

function PeakMainLayer:getScrollNode( item )
    if item == nil then
        return nil
    end
    local panel = self.panel_head_model:clone()
    panel:setVisible(true)
    panel.item = item
    local txt_name = TFDirector:getChildByPath(panel, 'txt_name')
    local txt_info = TFDirector:getChildByPath(panel, 'txt_zhenyan')
    local txt_des = TFDirector:getChildByPath(panel, 'txt_sx')
    local img_bg = TFDirector:getChildByPath(panel, 'img_icon')
    local img_icon = TFDirector:getChildByPath(panel, 'img_touxiang')
    if item.t == 1 then
        img_bg:setTouchEnabled(false)
        if item.data.useIcon == 0 then
            item.data.useIcon = 0
        end
        local roleConfig = RoleData:objectByID(item.data.useIcon)
        if roleConfig == nil then
            roleConfig = RoleData:objectByID(77)
        end
        img_icon:setTexture(roleConfig:getIconPath())
        Public:addFrameImg(img_icon,item.data.headPicFrame)
        txt_name:setText(item.data.name)
        local strInfo = stringUtils.format(localizable.LunJianFeng_txt_main_scroll_info1,item.data.layer)
        txt_info:setText(strInfo)
        local floorData = PeakData:objectByID(item.data.layer)
        local timeData = PeakManager:getTimeDataByTime(MainPlayer:getNowtime(),item.data.layer)
        local strDes = stringUtils.format(localizable.LunJianFeng_peak_score , floorData.integral * 60 * timeData.percent)
        txt_des:setText( strDes )
        Public:addInfoListen(img_icon,true,3,item.data.playerId)
    elseif item.t == 2 then
        img_bg:setTouchEnabled(true)
        img_bg:setTexture("ui_new/lunjian/icon_zzccbuff2.png")
        img_icon:setVisible(false)
        -- local serverInfo = SaveManager:getServerInfo(item.data.serverId)
        -- local serverName = ""
        -- if serverInfo then
        --     serverName = serverInfo.name
        -- end
        txt_name:setText(item.data.serverName)
        local strInfo = stringUtils.format(localizable.LunJianFeng_txt_main_scroll_info2,item.data.layer)
        txt_info:setText(strInfo)
        txt_des:setText(localizable.LunJianFeng_txt_main_scroll_des2)
        local function zzccClick( sender )
            self.isQuestionInfo = true
            local pageIdx = self.floorPageHistory[item.data.layer] or 0
            PeakManager:requestPeakInfo(item.data.layer,pageIdx)
        end
        img_bg:addMEListener(TFWIDGET_CLICK, audioClickfun(zzccClick))
    end
    return panel
end

function PeakMainLayer:getScrollInfoData()
    local guildInfo = PeakManager:getGuildInfo()
    local unitedData = PeakManager:getUnitedInfo()
    tData = {}
    for i,v in ipairs(unitedData) do
        local item = {t = 2,data = v}
        table.insert(tData,item)
        item.index = #tData
    end
    for i,v in ipairs(guildInfo) do
        local item = {t = 1,data = v}
        table.insert(tData,item)
        item.index = #tData
    end
    return tData
end

----------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>------------

function PeakMainLayer:brushBuffState()
    local myInfo = PeakManager:getMyInfo()
    local floorData = PeakData:objectByID(self.floorId)
    if floorData.type == 2 then
        if myInfo.layer and myInfo.layer > 0 and self.floorId == myInfo.layer and
           myInfo.pos and myInfo.pos > 0 and  myInfo.unitedTime and myInfo.startTime and myInfo.unitedTime > 0 and myInfo.unitedTime >= myInfo.startTime then
            self.buffBtns[2]:setTextureNormal('ui_new/lunjian/icon_zzccbuff.png')
        else
            self.buffBtns[2]:setTextureNormal('ui_new/lunjian/icon_zzccbuff_1.png')
        end
        self.buffBtns[2]:setVisible(true)
    else
        self.buffBtns[2]:setVisible(false)
    end
    local attri = PeakManager:getTotalAttr()
        self.buffBtns[3].txt_num:setText('')
        self.buffBtns[3]:setVisible(true)
    if attri <= 0 then
        --self.buffBtns[3]:setTextureNormal('ui_new/lunjian/icon_bpbuff_1.png')
    else
        --self.buffBtns[3]:setVisible(true)
        --self.buffBtns[3].txt_num:setText(attri/100 .. "%")
        --self.buffBtns[3]:setTextureNormal('ui_new/lunjian/icon_bpbuff.png')
    end
    local posX = self.buffBtns[3]:getPositionX()
    for i=1,3 do
        self.buffBtns[4-i]:setPositionX(posX)
        if self.buffBtns[4-i]:isVisible() == true then
            posX = posX - 70
        end
    end
end

function PeakMainLayer:removeUI()

    if self.updateTimerID ~= nil then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end

    if self.showScrollInfoTimer ~= nil then
        TFDirector:removeTimer(self.showScrollInfoTimer)
        self.showScrollInfoTimer = nil
    end

    if self.panel_role_n4_model then
        self.panel_role_n4_model:release()
        self.panel_role_n4_model = nil
    end

    if self.panel_role_n5_model then
        self.panel_role_n5_model:release()
        self.panel_role_n5_model = nil
    end

    if self.panel_role_n6_model then
        self.panel_role_n6_model:release()
        self.panel_role_n6_model = nil
    end

    if self.panel_role_n7_model then
        self.panel_role_n7_model:release()
        self.panel_role_n7_model = nil
    end

    if self.panel_floor_model then
        self.panel_floor_model:release()
        self.panel_floor_model = nil
    end

    if self.panel_head_model then
        self.panel_head_model:release()
        self.panel_head_model = nil
    end

    if self.img_bg_model then
        self.img_bg_model:release()
        self.img_bg_model = nil
    end

    if self.effect_front_model then
        self.effect_front_model:release()
        self.effect_front_model = nil
    end

    if self.effect_cloud_model then
        self.effect_cloud_model:release()
        self.effect_cloud_model = nil
    end

    if self.effect_point_model then
        self.effect_point_model:release()
        self.effect_point_model = nil
    end

    self.super.removeUI(self)
end

function PeakMainLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close);
    self.btn_head:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnMyInfoClick))
    self.btn_head.logic = self
    self.buffBtns[1]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnBuff_1Click))
    self.buffBtns[1].logic = self

    self.buffBtns[2]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnBuff_2Click))
    self.buffBtns[2].logic = self

    self.buffBtns[3]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnBuff_3Click))
    self.buffBtns[3].logic = self

    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnRuleClick))
    self.btn_help.logic = self

    self.btn_shop:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnShopClick))
    self.btn_shop.logic = self

    self.btn_record:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnRecordClick))
    self.btn_record.logic = self

    self.btn_rank:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnRankClick))
    self.btn_rank.logic = self

    self.btn_buzhen:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnBuZhenClick))
    self.btn_buzhen.logic = self

    self.btn_left:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnLeftClick))
    self.btn_left.logic = self

    self.btn_right:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnRightClick))
    self.btn_right.logic = self

    self.btn_timeAdd:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OnTimesAddClick))
    self.btn_timeAdd.logic = self
    -----------------------------------------------------------------------------------------
    self.onFloorInfoHandler = function(event)
        self.isQuestionInfo = false
        self:drawFloorInfo(event.data[1])
        self:ScrollInfo()
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_PEAK_INFO ,self.onFloorInfoHandler)
    
    self.onOccupiedInfoHandler = function(event)
        PeakManager:openVSlayer(event.data[1],self.floorId,self.clickedPos)
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_OCCUPIED_PEAK_INFO ,self.onOccupiedInfoHandler)

    self.onPeakChangedHandler = function(event)
        self.isQuestionInfo = true
        PeakManager:requestPeakInfo(self.floorId,self.pageIdx)
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ERROR_PEAK_CHANGED ,self.onPeakChangedHandler)

    self.onPeakFallHandler = function(event)
        self.isQuestionInfo = true
        PeakManager:requestPeakInfo(self.floorId,self.pageIdx)
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_PEAK_FALL ,self.onPeakFallHandler)

    self.onPeakAbandonHandler = function(event)
        self.isQuestionInfo = true
        PeakManager:requestPeakInfo(self.floorId,self.pageIdx)
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ABANDON_PEAK ,self.onPeakAbandonHandler)

    self.onFightEndHandler = function(event)
        if self.isShow == true then
            self.isQuestionInfo = true
            PeakManager:requestPeakInfo(self.floorId,self.pageIdx)
        else
            self.isFightBrush = true
        end
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_FIGHT_END ,self.onFightEndHandler)
    
    self.onActivityStatusHandler = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)

    self.onActivityStatusHandler_0 = function(event)
        if PeakManager:getActivityStatus() == 1 then
            AlertManager:closeLayer(self)
        end
    end;
    TFDirector:addMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
end

function PeakMainLayer:removeEvents()
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_PEAK_INFO ,self.onFloorInfoHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_OCCUPIED_PEAK_INFO ,self.onOccupiedInfoHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ERROR_PEAK_CHANGED ,self.onPeakChangedHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_PEAK_FALL ,self.onPeakFallHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ABANDON_PEAK ,self.onPeakAbandonHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_FIGHT_END ,self.onFightEndHandler)
    TFDirector:removeMEGlobalListener(MainPlayer.ServerSwitchChange ,self.onActivityStatusHandler)
    TFDirector:removeMEGlobalListener(PeakManager.RECEIVE_ACTIVITY_STATE ,self.onActivityStatusHandler_0)
    self.super.removeEvents(self)
end
--------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--------
function PeakMainLayer.OnBuZhenClick( sender )
    ZhengbaManager:openArmyLayer(EnumFightStrategyType.StrategyType_AREAN)
end

function PeakMainLayer.OnRankClick( sender )
    PeakManager:requestRankingInfo( 1 )
end

function PeakMainLayer.OnShopClick( sender )
    MallManager:openMallLayerByType(EnumMallType.HonorMall, 1)
end

function PeakMainLayer.OnRecordClick( sender )
    PeakManager:requestBattleLog()
end

function PeakMainLayer.OnBuff_1Click( sender )
    local self = sender.logic
    PeakManager:openSJBufflayer(self.floorId)
end

function PeakMainLayer.OnBuff_2Click( sender )
    local self = sender.logic
    PeakManager:openZZCClayer(self.floorId)
end

function PeakMainLayer.OnBuff_3Click( sender )
    local self = sender.logic
    PeakManager:openBuffLayer()
end

function PeakMainLayer.OnRuleClick( sender )
    CommonManager:showRuleLyaer('lunjianzhengfeng')
end

function PeakMainLayer.OnFloorClick( sender )
    local self = sender.logic
    if self.isMoving == true or self.floorId == sender.idx then
        return
    end
    self.isQuestionInfo = true
    local pageIdx = self.floorPageHistory[sender.idx] or 0
    PeakManager:requestPeakInfo(sender.idx,pageIdx)
end

function PeakMainLayer.OnTimesAddClick( sender )
    if PeakManager:getActivityStatus() == 1 then
        toastMessage(localizable.treasureMain_tiemout)
        return
    end
    local timesInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.PEAK);
    local resConfig = PlayerResConfigure:objectByID(EnumRecoverableResType.PEAK)
    local maxBuyTime = resConfig:getMaxBuyTime(MainPlayer:getVipLevel())
    if maxBuyTime <= timesInfo.todayBuyTime then
        toastMessage(localizable.common_not_buy_times)
        return
    end
    VipRuleManager:showReplyLayer(EnumRecoverableResType.PEAK)
end

function PeakMainLayer.OnOccupiedClick( sender )
    local self = sender.logic
    local dataInfo = sender.dataInfo
    if dataInfo.type == 0 then
        self.clickedPos = dataInfo.pos
        PeakManager:requestOccupiedPeakInfo(dataInfo.layer,dataInfo.pos,dataInfo.playerId)
    elseif dataInfo.type == 1 then
        local myInfo = PeakManager:getMyInfo()
        if myInfo.layer and myInfo.layer > 0 and myInfo.pos and myInfo.pos > 0 then
            PeakManager:openMyInfolayer()
        end
    end
end

function PeakMainLayer.OnMyInfoClick( sender )
    local self = sender.logic
    local myInfo = PeakManager:getMyInfo()
    if myInfo.layer and myInfo.layer > 0 and myInfo.pos and myInfo.pos > 0 then
        PeakManager:openMyInfolayer()
    else
        toastMessage(localizable.LunJianFeng_txt_main_nopoint)
    end
end

function PeakMainLayer.OnLeftClick(sender)
    local self = sender.logic;
    if self.isMoving == true then
        return
    end
    local pageIndex = self.pageView:getCurPageIndex() ;

    local pageIndex0 = self.pageView:_getCurPageIndex()
    if pageIndex0 <= 1 then
        self.isQuestionInfo = true
        PeakManager:requestPeakInfo(self.floorId,self.maxPageNum)
    else
        self.pageView:scrollToPage(pageIndex - 1);
    end
end

function PeakMainLayer.OnRightClick(sender)
    local self = sender.logic;
    if self.isMoving == true then
        return
    end
    local pageIndex = self.pageView:getCurPageIndex() ;
    print("pageIndex=============>>>>>>>>",pageIndex)
    local pageIndex0 = self.pageView:_getCurPageIndex()
    if pageIndex0 >= self.maxPageNum then
        self.isQuestionInfo = true
        print("request=============>>>>>>>>")
        PeakManager:requestPeakInfo(self.floorId,1)
    else
        self.pageView:scrollToPage(pageIndex + 1);
    end
end
--------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>--------
function PeakMainLayer:onShow()
    self.super.onShow(self)
    if self.isFightBrush == true then
        self.isQuestionInfo = true
        self.isFightBrush = false
        PeakManager:requestPeakInfo(self.floorId,self.pageIdx)
    end
    self:brushBuffState()
    self:brushChallengeTimes()
end

function PeakMainLayer:refreshUI()

end

function PeakMainLayer:initBgEffect()
    local tNode = self:getBgNode()
    self.panel_bg:addChild(tNode[1],0,100)
    tNode[1]:setPosition(ccp(960*0.5,0))
    self.panel_front:addChild(tNode[2],0,100)
    tNode[2]:setPosition(ccp(960*0.5,0))
end

function PeakMainLayer:getBgNode()
    local node1 = CCNode:create()
    local node2 = CCNode:create()
    --node2:setVisible(false)
    local imgbg = self.img_bg_model:clone()
    imgbg:setVisible(true)
    imgbg:setPosition(ccp(0,320))
    node1:addChild(imgbg,1,100)
    local effect = imgbg:getChildByTag(100)
    effect:playByIndex(0, -1, -1, 1)

    imgbg = self.img_bg_model:clone()
    imgbg:setVisible(true)
    imgbg:setPosition(ccp(-1136,320))
    node1:addChild(imgbg,1,99)
    effect = imgbg:getChildByTag(100)
    effect:playByIndex(0, -1, -1, 1)

    imgbg = self.img_bg_model:clone()
    imgbg:setVisible(true)
    imgbg:setPosition(ccp(1136,320))
    node1:addChild(imgbg,1,101)
    effect = imgbg:getChildByTag(100)
    effect:playByIndex(0, -1, -1, 1)

    local effectFront = self.effect_front_model:clone()
    node2:addChild(effectFront,0,100)
    effectFront:setPosition(ccp(0,316))
    effectFront:setVisible(true)
    effectFront:playByIndex(0, -1, -1, 1)

    effectFront = self.effect_front_model:clone()
    node2:addChild(effectFront,1,99)
    effectFront:setPosition(ccp(-1136,316))
    effectFront:setVisible(true)
    effectFront:playByIndex(0, -1, -1, 1)

    effectFront = self.effect_front_model:clone()
    node2:addChild(effectFront,1,101)
    effectFront:setPosition(ccp(1136,316))
    effectFront:setVisible(true)
    effectFront:playByIndex(0, -1, -1, 1)
    return {node1,node2}
end

function PeakMainLayer:UpdateInfo()
    if self.floorId and self.floorId >= 1 then
        local curTime = MainPlayer:getNowtime()
        local peakData = PeakManager:getTimeDataByTime(curTime,self.floorId)
        local path = self.BuffPath[peakData.type + 1]
        local beginHour = peakData.beginTime / 60
        local endHour = peakData.endTime / 60
        local path = self.BuffPath[1]
        if beginHour >= 0 and endHour <= 12 then
            path = self.BuffPath[1]
        elseif beginHour >= 12 and endHour <= 14 then
            path = self.BuffPath[2]
        elseif beginHour >= 14 and endHour <= 18 then
            path = self.BuffPath[3]
        elseif beginHour >= 18 and endHour <= 20 then
            path = self.BuffPath[4]
        elseif beginHour >= 20 and endHour <= 24 then
            path = self.BuffPath[5]
        end
        self.buffBtns[1]:setTextureNormal(path)
    end
    self:setMyInfo()
    
    
end

function PeakMainLayer:ScrollInfo()
    self:showScrollInfo()
end

function PeakMainLayer:setMyInfo()
    local myInfo = PeakManager:getMyInfo()

    if myInfo.layer and myInfo.layer > 0 and myInfo.pos and myInfo.pos > 0 then
        local timeBegan = myInfo.startTime
        local maxTimeLen = ConstantData:objectByID("PeakTakeDownTime").value * 60
        local timeMax = timeBegan + maxTimeLen
        local timeNow = MainPlayer:getNowtime()
        if timeNow < timeMax then
            timeMax = timeNow
        end
        local timeLeft = timeMax - timeBegan
        if timeLeft < 0 then
            timeLeft = 0
        end
        local isNeedBrush = false
        if timeLeft >= maxTimeLen then
            isNeedBrush = true
        end
        local hour = math.floor(timeLeft / 3600)
        timeLeft = timeLeft - hour * 3600
        local min = math.floor(timeLeft / 60)
        local sec = timeLeft - min * 60
        local strTime = string.format('%02d:%02d:%02d',hour,min,sec)

        self.myInfoNodes.txt_time:setText(strTime)
        local strInfo = stringUtils.format(localizable.LunJianFeng_txt_main_myinfo,myInfo.layer)
        self.myInfoNodes.txt_info:setText(strInfo)
        if isNeedBrush == true then
            if self.isQuestionInfo == false and self.questIndex > 0 then
                self.questIndex = self.questIndex - 1
                self.isQuestionInfo = true
                PeakManager:requestPeakInfo(self.floorId,self.pageIdx)
            end
        else
            self.questIndex = 2
        end
    else
        self.questIndex = 2
        self.myInfoNodes.txt_time:setText("00:00:00")
        self.myInfoNodes.txt_info:setText(localizable.LunJianFeng_txt_main_myinfo1)
    end
    local strScore = localizable.LunJianFeng_txt_main_score .. (myInfo.integral or 0)
    self.myInfoNodes.txt_score:setText(strScore)
end

function PeakMainLayer:dispose()
    self.super.dispose(self)
end

return PeakMainLayer
