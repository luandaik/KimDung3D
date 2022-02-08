-- client side XilingListLayer.lua
--[[
 * @Description: 西岭
 ]]
-- script writer wuqi
-- creation time 2016-06-27

local XilingListLayer = class("XilingListLayer", BaseLayer);

local XilingNpcData = require('lua.table.t_s_serdang_npc')

XilingListLayer.LIST_ITEM_HEIGHT = 640
XilingListLayer.TEXTURE_BOX_CLOSE = "ui_new/longmenpo/img_bx.png"
XilingListLayer.TEXTURE_BOX_OPEN = "ui_new/longmenpo/img_bx2.png"

CREATE_SCENE_FUN(XilingListLayer);
CREATE_PANEL_FUN(XilingListLayer);

function XilingListLayer:ctor(mountainItem)
    self.super.ctor(self, mountainItem);

    self.clickMountainItem_id = WestClimbManager:getCurFloorId() or 1;
    self:init("lua.uiconfig_mango_new.climb.XilingListLayer");
    self.btn = {}
    self.firstShow = true
end

function XilingListLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.img_cur = TFDirector:getChildByPath(ui, 'img_cur');
    self.txt_curIndex = TFDirector:getChildByPath(self.img_cur, "txt_curIndex")
    self.generalHead = CommonManager:addGeneralHead( self )
    self.generalHead:setData(ModuleType.XiLing, {HeadResType.XILINGSTONE, HeadResType.COIN, HeadResType.SYCEE}, true)

    self.bg_time = TFDirector:getChildByPath(ui, "bg_time")
    --倒计时txt
    self.txt_time = TFDirector:getChildByPath(self.bg_time, "txt_time")
    self.bg_time:setZOrder(50)

    --排名奖励按钮
    self.btn_pmjl = TFDirector:getChildByPath(ui, "btn_pmjl")
    self.btn_pmjl.logic = self

    --巅峰商店按钮
    self.btn_dianfengshop = TFDirector:getChildByPath(ui, "btn_dianfengshop")
    self.btn_dianfengshop.logic = self
    --宝箱条按钮
    self.btn_baoxiangtiao = TFDirector:getChildByPath(ui, "btn_baoxiangtiao")
    self.btn_baoxiangtiao.logic = self
    --tableview背景panel
    self.bg_table = TFDirector:getChildByPath(ui, 'list_mountain');

    local tableView = TFTableView:create()
    self.table_mountain = tableView
    Public:bindScrollFun(tableView)
    tableView.logic = self;
    tableView:setTableViewSize(CCSizeMake(self:getSize().width, self.bg_table:getSize().height))
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    tableView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll)
    tableView:setBounceable(false);
    self.bg_table:addChild(tableView)

    self.detailLayer = require('lua.logic.westClimb.XilingDetail'):new()
    self.detailLayer:setZOrder(10)
    self:addLayer(self.detailLayer)
    self.slider_gundongtiao  = TFDirector:getChildByPath(ui, 'slider_gundongtiao');
    self.slider_gundongtiao.logic = self
    self.slider_gundongtiao:addMEListener(TFWIDGET_TOUCHENDED, audioClickfun(self.sliderTouchMoveHandle),1)
    self.img_slider = TFDirector:getChildByPath(ui, 'img_slider')
    local pos = self.img_slider:getPosition()
    self.btn_baoxiangtiao:setPosition(ccp(pos.x, pos.y + 190))
end

function XilingListLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow()
    self:refreshBaseUI()

    self:refreshUI()
end

function XilingListLayer:refreshBaseUI()

end

function XilingListLayer:refreshUI()
    self.homeInfo = WestClimbManager:getClimbInfo()
    if not self.homeInfo then
        return
    end
    self:showCutDownTimer()
    self:refreshDetails()
end

function XilingListLayer:refreshDetails()
    self.mountainList = self:getShowMountainList();
    self.table_mountain:reloadData()

    if self.firstShow then
        self.table_mountain:scrollToCenterForPositionY(self.LIST_ITEM_HEIGHT / 3 * self:getMountainIndexById(self.clickMountainItem_id), 0);
        self.firstShow = false
    end

    local floor_num = math.min(WestClimbManager:getCurFloorId(), XilingData:length())
    self.txt_curIndex:setText(floor_num)
end

function XilingListLayer:showCutDownTimer()
    self.countDown = WestClimbManager:getCutDownTime() or 0
    self.txt_time:setText(FactionFightManager:getTimeString( self.countDown ))
    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end
    self.countDownTimer = TFDirector:addTimer(1000, -1, nil, function() 
        if self.countDown <= 0 then
            if self.countDownTimer then
                TFDirector:removeTimer(self.countDownTimer)
                self.countDownTimer = nil
            end
            self.txt_time:setText(FactionFightManager:getTimeString( self.countDown ))
        else
            self.countDown = self.countDown - 1
            self.txt_time:setText(FactionFightManager:getTimeString( self.countDown ))
        end
    end)
end

function XilingListLayer.sliderTouchMoveHandle(sender)
    local self = sender.logic;
    local percent = sender:getPercent()*self.table_mountain:getContentSize().height/100
    -- print("percent = ",percent)
    self.table_mountain:setContentOffset(ccp(0,percent*-1), 0)
end

function XilingListLayer.cellSizeForTable(tableView, idx)
    return XilingListLayer.LIST_ITEM_HEIGHT, 960
end

function XilingListLayer.tableScroll(tableView)
    local self = tableView.logic;
    local percent = tableView:getScrollYPercent()
    -- print("percent = ",percent)
    self.slider_gundongtiao:setPercent(percent)
end

function XilingListLayer.tableCellAtIndex(tableView, idx)
    local self = tableView.logic;
    local cell = tableView:dequeueCell()
    if nil == cell then
        tableView.cells = tableView.cells or {}
        cell = TFTableViewCell:create()
        tableView.cells[cell] = true

        local mountain_node = createUIByLuaNew("lua.uiconfig_mango_new.climb.XilingItem");
        cell:addChild(mountain_node);
        cell.mountain_node = mountain_node;

        for i = 1, 3 do
            local node = TFDirector:getChildByPath(mountain_node, 'node' .. i);
            local m_node = createUIByLuaNew("lua.uiconfig_mango_new.climb.XilingItemNode");            
            m_node:setName("m_node" .. i);
            m_node:setPosition(node:getPosition());
            node:getParent():addChild(m_node);
        end
    end
    for i = 1, 3 do
        local m_node = TFDirector:getChildByPath(cell.mountain_node, 'm_node' .. i)
        local cellNum = math.ceil(self.mountainList:length() / 3);
        local offset = cellNum * 3 - self.mountainList:length();

        local mountainIndex = self.mountainList:length() - idx*3 + i + offset;        
        local mountainItem = self.mountainList:objectAt(mountainIndex);
        if  mountainItem then
            m_node:setVisible(true);
            self:refreshNode(m_node, mountainIndex)
            if mountainIndex == self.clickMountainItem_id then
                if self.clickMountainItem_id then
                    self.detailLayer:loadData(self.clickMountainItem_id, self.homeInfo,false);
                else
                    --self.detailLayer:loadData(self.mountainList:back(), self.homeInfo,false);
                end
            end
        else
            m_node:setVisible(false);
        end
    end

    return cell
end

function XilingListLayer:refreshNode(node, index)
    local bg_best = TFDirector:getChildByPath(node, "bg_best")
    local txt_name_best = TFDirector:getChildByPath(bg_best, "txt_name")
    local txt_fwq_best = TFDirector:getChildByPath(bg_best, "txt_fuwuqi")
    local bestName = WestClimbManager:getPlayerName()
    local bestNameSever = WestClimbManager:getServerName()

    local serdangInfo  = WestClimbManager:getSerdangInfo()
    local preId = WestClimbManager:getPreSeasonFloorId()
    if preId and index == preId then
        bg_best:setVisible(true)
        txt_name_best:setText(bestName)
        txt_fwq_best:setText(bestNameSever)
    else
        bg_best:setVisible(false)
    end

    local img_icon = TFDirector:getChildByPath(node, "img_icon")
    local bg_boss = TFDirector:getChildByPath(node, "bg_boss")
    local img_role = TFDirector:getChildByPath(node, "img_role")
    local img_kuang = TFDirector:getChildByPath(node, "img_kuan")
    local img_flag = TFDirector:getChildByPath(node, "img_flag")
    local bg_baoxiang = TFDirector:getChildByPath(node, "bg_baoxiang")
    local img_baoxiang = TFDirector:getChildByPath(node, "img_baoxiang")
    local bg_duodezhe = TFDirector:getChildByPath(node, "bg_duodezhe")
    local txt_name_box = TFDirector:getChildByPath(bg_duodezhe, "txt_name")
    local txt_fwq_box = TFDirector:getChildByPath(bg_duodezhe, "txt_fuwuqi")
    local img_lock = TFDirector:getChildByPath(node, "img_lock")
    local bg_bossname = TFDirector:getChildByPath(node, "bg_bossname")
    local txt_name_boss = TFDirector:getChildByPath(bg_bossname, "txt_name")
    local txt_fwq_boss = TFDirector:getChildByPath(bg_bossname, "txt_fuwuqi")
    local txt_floor = TFDirector:getChildByPath(node, "txt_floor")
    local img_floor_bg = TFDirector:getChildByPath(node, "img_floor_bg")

    img_kuang:setVisible(false)

    local floorInfo = WestClimbManager:getFloorInfo()
    node:setVisible(true)
    img_flag:setVisible(false)
    bg_baoxiang:setVisible(false)
    --local count = (layer - 1) * 3 + index
    local count = index

    img_icon:removeMEListener(TFWIDGET_CLICK)
    img_role:removeMEListener(TFWIDGET_CLICK)
    img_icon:setColor(ccc3(255,255,255))
    img_role:setColor(ccc3(255,255,255))
    img_floor_bg:setTexture("ui_new/climb/wls_cengshu_bg.png")    

    if count > 0 then
        if floorInfo[count] then
            txt_floor:setText(stringUtils.format(localizable.ClimbMountainListLayer_floor_desc, count))
            if floorInfo[count].floorId == self.clickMountainItem_id then
                img_floor_bg:setTexture("ui_new/climb/wl_kaiqi.png")
            end
            if floorInfo[count].isBox then
                bg_baoxiang:setVisible(true)               

                img_baoxiang:setTouchEnabled(true)
                img_baoxiang.logic = self
                img_baoxiang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBoxClickHandle))

                txt_name_box:setText(floorInfo[count].boxPlayerName)
                txt_fwq_box:setText(floorInfo[count].boxServerName)

                if floorInfo[count].isOpenBox then
                    bg_duodezhe:setVisible(true)
                    img_baoxiang:setTexture(self.TEXTURE_BOX_OPEN)
                else
                    bg_duodezhe:setVisible(false)
                    img_baoxiang:setTexture(self.TEXTURE_BOX_CLOSE)
                end
            else
                bg_baoxiang:setVisible(false)
                bg_duodezhe:setVisible(false)
            end
            if serdangInfo and WestClimbManager:getCurFloorId() == count then
                img_flag:setVisible(true)
                img_flag:setTexture("ui_new/climb/wl_qizi.png");
            end
            if floorInfo[count].npc and floorInfo[count].npc.isBoss then
                local icon = floorInfo[count].npc.icon
                local headPicFrame = floorInfo[count].npc.headPicFrame
                local playerName = floorInfo[count].npc.playerName
                local serverName = floorInfo[count].npc.serverName

                img_icon:setVisible(false)
                bg_boss:setVisible(true)
                bg_bossname:setVisible(true)

                txt_name_boss:setText(playerName)
                txt_fwq_boss:setText(serverName)

                local role = RoleData:objectByID(icon)
                if role then
                    img_role:setTexture(role:getIconPath())
                    Public:addFrameImg(img_role, headPicFrame) 
                end
            else
                img_icon:setVisible(true)
                bg_boss:setVisible(false)
                bg_bossname:setVisible(false)
                --[[
                local item = self.mountainList:objectAt(floorInfo[count].floorId)
                img_icon:setTextureNormal("icon/rolebig/" .. item.image .. ".png")
                ]]
                --[[
                local id = floorInfo[count].npc.npcId
                local role = RoleData:objectByID(id)
                if role then
                    img_icon:setTextureNormal(role:getBigImagePath())
                end 
                ]]
                if floorInfo[count].npc and floorInfo[count].npc.npc then
                    local id = floorInfo[count].npc.npc.npcId
                    local item = XilingNpcData:objectByID(id)            
                    img_icon:setTextureNormal("icon/rolebig/" .. item.display .. ".png") 
                end        
            end
            local floorId = WestClimbManager:getCurFloorId()
            img_lock:setVisible(false)
            if count > floorId then 
                img_lock:setVisible(true)

                img_icon:setColor(ccc3(166, 166, 166))
                img_role:setColor(ccc3(166, 166, 166))
                img_flag:setVisible(false)
                img_flag:setTexture("ui_new/climb/wl_qizi.png");
            elseif count < floorId or XilingData:length() == WestClimbManager:getPassedFloorId() then
                img_flag:setVisible(true)
                img_flag:setTexture("ui_new/climb/wl_qizi1.png");
            end

            if img_icon:isVisible() then
                img_icon:setTouchEnabled(true)
                img_icon.logic = self;
                img_icon.bg = img_floor_bg
                img_icon:setTag(floorInfo[count].floorId);
                img_icon:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onIconClickHandle));
                self.btn[floorInfo[count].floorId] = img_icon
            end

            if bg_boss:isVisible() then
                img_role:setTouchEnabled(true)
                img_role.logic = self;
                img_role.bg = img_floor_bg
                img_role:setTag(floorInfo[count].floorId);
                img_role:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onIconClickHandle));
                self.btn[floorInfo[count].floorId] = img_role
            end
        else
            node:setVisible(false)            
        end
    else
        node:setVisible(false)
    end  
end

function XilingListLayer.onIconClickHandle(sender)
    local self = sender.logic
    local oldIndex = self.clickMountainItem_id

    for k, v in pairs(self.btn) do
        if v.bg then
            v.bg:setTexture("ui_new/climb/wls_cengshu_bg.png")
        end
    end
    self.clickMountainItem_id = sender:getTag()
    local bg = sender.bg
    bg:setTexture("ui_new/climb/wl_kaiqi.png");
    if self.clickMountainItem_id ~= oldIndex then
        self.detailLayer:loadData(self.clickMountainItem_id, self.homeInfo, true);
    end
end

function XilingListLayer.onBoxClickHandle(sender)
    local self = sender.logic

    WestClimbManager:requestBox()
end

function XilingListLayer.numberOfCellsInTableView(tableView)
    local self = tableView.logic;
    return math.ceil(self.mountainList:length() / 3) + 1;
end

function XilingListLayer:getShowMountainList()
    local list = TFArray:new();
    local index = 1;
    local serdangInfo = WestClimbManager:getSerdangInfo()
    if not serdangInfo then
        return
    end
    local curIndex = self:getMountainIndexById(WestClimbManager:getCurFloorId());
    local cellNum = math.ceil((curIndex + 19)/3);
    local length = math.min(XilingData:length() , cellNum * 3);

    for v in XilingData:iterator() do
        --if index <= length then
            list:push(v);
        --end
        index = index +1;
    end
    return list;
end

function XilingListLayer:getMountainIndexById(mountainId)
    local index = 0;
    for item in ClimbConfigure:iterator() do
        if item.id > mountainId then
            break;
        end
        index = index + 1;
    end
    return index;
end

function XilingListLayer:removeUI()
    self.super.removeUI(self);

    if self.countDownTimer then
        TFDirector:removeTimer(self.countDownTimer)
        self.countDownTimer = nil
    end
end

function XilingListLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    self.super.dispose(self)
end

function XilingListLayer:registerEvents()
    self.super.registerEvents(self);  
     
    self.btn_dianfengshop:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onShopClickHandle)) 
    self.btn_pmjl:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRewardClickHandle))
    self.btn_baoxiangtiao:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBaoxiangtiaoClickHandle))
    
    self.attackCompeleteCallBack = function(event)  
        self:updateCurMountain(event.data[1]);
    end;
    TFDirector:addMEGlobalListener(WestClimbManager.SERDANG_CHALLENGE_REPONSE ,self.attackCompeleteCallBack ) ;

    self.rankListCallBack = function (event)
        local layer = AlertManager:getLayerByName("lua.logic.westClimb.XilingJiangli")
        if layer == nil then
            layer = AlertManager:addLayerByFile("lua.logic.westClimb.XilingJiangli",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
            AlertManager:show()
            return
        end
        layer:refreshUI()
    end
    TFDirector:addMEGlobalListener(WestClimbManager.SERDANG_RANK_REPONSE, self.rankListCallBack)

    self.onBoxReceiveHandle = function(event)
        local data = event.data[1]
        local floorId = data.floorId
        local floorInfo = WestClimbManager:getFloorInfo()
        floorInfo[floorId].isOpenBox = data.isOpenBox
        floorInfo[floorId].boxPlayerName = data.boxPlayerName
        floorInfo[floorId].boxServerName = data.boxServerName

        local item = XilingExtraRewardData:objectByID(1)
        local rewardStr = item.value
        local tab1 = string.split(rewardStr, "|")
        self.rewardList = TFArray:new()
        for i = 1, #tab1 do
            local str = tab1[i]
            local temp = string.split(str, "_")
            local tab = {}       
            tab.type = tonumber(temp[1])
            tab.itemId = tonumber(temp[2])
            tab.number = tonumber(temp[3])
            local _rewardInfo = BaseDataManager:getReward(tab)
            self.rewardList:push(_rewardInfo);
        end

        local layer = require("lua.logic.gameactivity.GoldEgg.GoldEggCheckRewardLayer"):new()
        AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1)
        layer:setRewardList(self.rewardList, localizable.Xiling_txt_reward1)
        AlertManager:show()
    end
    TFDirector:addMEGlobalListener(WestClimbManager.SERDANG_BOX_REPONSE, self.onBoxReceiveHandle)

    self.challengeCallback = function ()
       self:refreshUI()
    end
    TFDirector:addMEGlobalListener(WestClimbManager.SERDANG_CHALLENGE_REPONSE, self.challengeCallback)

    if self.generalHead then
        self.generalHead:registerEvents()
    end

    self.LeaveFightForOneKeyCallBack = function(event)
        self.detailLayer.hasLoad = false
        self.homeInfo = WestClimbManager:getClimbInfo()
        self.clickMountainItem_id = WestClimbManager:getCurFloorId()
        self.detailLayer:loadData(self.clickMountainItem_id,self.homeInfo)
    end;
    TFDirector:addMEGlobalListener(FightManager.LeaveFightForOneKey ,self.LeaveFightForOneKeyCallBack )
 end

 function XilingListLayer:updateCurMountain(data)
    self.mountainList = self:getShowMountainList();
    local floor_num = math.min(WestClimbManager:getCurFloorId() , XilingData:back().id)
    self.txt_curIndex:setText(floor_num);
    self.table_mountain:reloadData()
    self.table_mountain:scrollToCenterForPositionY(self.LIST_ITEM_HEIGHT / 3 * self:getMountainIndexById(self.clickMountainItem_id) , 0);
end

function XilingListLayer.onBaoxiangtiaoClickHandle(sender)
    local self = sender.logic;

    local floor = WestClimbManager:getBoxFloor()
    if floor then
        self.table_mountain:scrollToCenterForPositionY(self.LIST_ITEM_HEIGHT / 3 * self:getMountainIndexById(floor), 0);
    end
end

function XilingListLayer.onShopClickHandle(sender)
    local self = sender.logic;
    
    MallManager:openMallLayerByType(EnumMallType.XilingMall, 1)
end

function XilingListLayer.onRewardClickHandle(sender)
    local self = sender.logic;
    
    WestClimbManager:requestJiangliRankInfo()
end

function XilingListLayer:removeEvents()
    self.super.removeEvents(self);
    TFDirector:removeMEGlobalListener(WestClimbManager.SERDANG_CHALLENGE_REPONSE, self.attackCompeleteCallBack)
    self.attackCompeleteCallBack = nil

    TFDirector:removeMEGlobalListener(WestClimbManager.SERDANG_RANK_REPONSE, self.rankListCallBack)
    self.rankListCallBack = nil

    TFDirector:removeMEGlobalListener(WestClimbManager.SERDANG_BOX_REPONSE, self.onBoxReceiveHandle)
    self.onBoxReceiveHandle = nil

    TFDirector:removeMEGlobalListener(WestClimbManager.SERDANG_CHALLENGE_REPONSE, self.challengeCallback)
    self.challengeCallback = nil
    
    TFDirector:removeMEGlobalListener(FightManager.LeaveFightForOneKey ,self.LeaveFightForOneKeyCallBack )
    self.LeaveFightForOneKeyCallBack = nil

    if self.generalHead then
        self.generalHead:removeEvents()
    end
end

return XilingListLayer;
