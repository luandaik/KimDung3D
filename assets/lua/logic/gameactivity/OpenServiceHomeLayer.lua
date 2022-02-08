

local OpenServiceHomeLayer = class("OpenServiceHomeLayer", BaseLayer)


function OpenServiceHomeLayer:ctor(data)
    self.super.ctor(self)
    self.activity_show_type = data
    self:init("lua.uiconfig_mango_new.operatingactivities.HomeLayer")
end

function OpenServiceHomeLayer:initUI(ui)
	self.super.initUI(self,ui)

    self.activityNum   = 0
    self.activityIndex = {}

    self.activityIndex, self.activityNum = OperationActivitiesManager:getOpenAndShowActivityList(self.activity_show_type)
    
    print("当前开启的活动个数：", self.activityNum)
    print("当前开启的活动有：", self.activityIndex)

    self.generalHead = CommonManager:addGeneralHead( self )
    self.btn_wdpy                = TFDirector:getChildByPath(ui, 'btn_wdpy')
    self.btn_wdpy:setVisible(false)
    self.MyTrainLeftPage = -1
    self.MyTrainRightPage = -1
    print("self.activity_show_type",self.activity_show_type)
    if self.activity_show_type == 2 then
        self.generalHead:setData(ModuleType.XianShiHuoDong,{HeadResType.RECRUITINTEGRAL,HeadResType.COIN,HeadResType.SYCEE})
    elseif self.activity_show_type == 3 then

        print("wdpySwitch",MainPlayer:getServerSwitchStatue(ServerSwitchType.MyCultivate))
        if MainPlayer:getServerSwitchStatue(ServerSwitchType.MyCultivate) == true and FunctionOpenConfigure:getOpenLevel(1204) <= MainPlayer:getLevel() then
            self.btn_wdpy:setVisible(true)
        else 
            self.btn_wdpy:setVisible(false)
        end

        self.generalHead:setData(ModuleType.YunYingHuoDong,{HeadResType.RECRUITINTEGRAL,HeadResType.COIN,HeadResType.SYCEE})       
    else
        self.generalHead:setData(ModuleType.YunYingHuoDong,{HeadResType.RECRUITINTEGRAL,HeadResType.COIN,HeadResType.SYCEE})        
    end


	self.panel_buttons           = TFDirector:getChildByPath(ui, 'panel_buttons')
	self.panel_details 	         = TFDirector:getChildByPath(ui, 'panel_details')

    self.detailsLayerTable = {}     --详细内容图层
    self.currentDetailsLayer = nil  --当前显示的详细内容图层
    self:initActivitiesButtons()
    --选中第一个
end

function OpenServiceHomeLayer:initActivitiesButtons()
    local  tableView =  TFTableView:create()
    tableView:setName("btnTableView")
    tableView:setTableViewSize(self.panel_buttons:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    self.tableView = tableView
     
    self.tableView.logic = self

    tableView:addMEListener(TFTABLEVIEW_TOUCHED, OpenServiceHomeLayer.tableCellTouched)
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, OpenServiceHomeLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, OpenServiceHomeLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, OpenServiceHomeLayer.numberOfCellsInTableView)

    self.panel_buttons:addChild(tableView)
    tableView:reloadData()

    tableView:setPosition(ccp(10,0))
end

function OpenServiceHomeLayer:onShow()
    self.super.onShow(self)
    if self.currentDetailsLayer then
        self.currentDetailsLayer:onShow()
    end

    self.generalHead:onShow()


    self:reloadTableView()
end
function OpenServiceHomeLayer.OpenWdpy(sender)
    --显示我的培养
    local self = sender.logic
    local layer = require('lua.logic.gameactivity.MyTrain'):new(self.MyTrainLeftPage,self.MyTrainRightPage)
    AlertManager:addLayer(layer)
    AlertManager:show()
    
end

function OpenServiceHomeLayer:removeUI()
	self.super.removeUI(self)
end

function OpenServiceHomeLayer:dispose()
    if self.detailsLayerTable then
        for _k,_v in pairs(self.detailsLayerTable) do
            _v:dispose();
        end
    end

    if generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    self.super.dispose(self)
end

function OpenServiceHomeLayer:registerEvents()
    self.super.registerEvents(self)
    self.btn_wdpy.logic = self
    self.btn_wdpy:addMEListener(TFWIDGET_CLICK, audioClickfun(self.OpenWdpy),1)

    self.receiveInfo = function(event)   
    if event.data[1][1] ~= -1 then
        self.MyTrainLeftPage = event.data[1][1]
    end
    if event.data[1][2] ~= -1 then
        self.MyTrainRightPage = event.data[1][2]
    end
        print(self.MyTrainLeftPage,self.MyTrainRightPage)
    end
    TFDirector:addMEGlobalListener(OperationActivitiesManager.SAVE_MYTRAIN_SCENE, self.receiveInfo)
    -- self.OpenServiceHomeLayerTouchCallBack = function(event)
    --     self:AddLayerbyindex(event.data[1])
    -- end;

    -- TFDirector:addMEGlobalListener("OpenServiceHomeLayer_touch",self.OpenServiceHomeLayerTouchCallBack)

    if self.generalHead then
        self.generalHead:registerEvents()
    end
    if self.currentDetailsLayer then
        self.currentDetailsLayer:registerEvents();
    end

    self.activityUpdateCallBack = function(event)
        self:activityUpdate()
    end

    print("OperationActivitiesManager.MSG_ACTIVITY_UPDATE = ", OperationActivitiesManager.MSG_ACTIVITY_UPDATE)
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_UPDATE, self.activityUpdateCallBack)

     self.activityFundDataCallBack = function(event)
        self:reloadTableView()
    end
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_FUND_DATA_UPDATE, self.activityFundDataCallBack)
end

function OpenServiceHomeLayer:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener("OpenServiceHomeLayer_touch",self.OpenServiceHomeLayerTouchCallBack)
    self.OpenServiceHomeLayerTouchCallBack = nil
    if self.generalHead then
        self.generalHead:removeEvents()
    end
    if self.currentDetailsLayer then
        self.currentDetailsLayer:removeEvents();
    end

    TFDirector:removeMEGlobalListener(OperationActivitiesManager.SAVE_MYTRAIN_SCENE, self.receiveInfo)
    self.receiveInfo = nil

    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_UPDATE, self.activityUpdateCallBack)
    self.activityUpdateCallBack = nil

    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_FUND_DATA_UPDATE, self.activityFundDataCallBack)
    self.activityFundDataCallBack = nil
end

function OpenServiceHomeLayer.tableCellTouched(table,cell)
    local self = table.logic
    local idx = cell:getIdx() + 1
    play_press()
    self:select(idx)
end

function OpenServiceHomeLayer:select(index)
    if self.selectedIndex and index == self.selectedIndex then
        return
    end

    self.selectedIndex = index
    

    local activityIndex = self.activityIndex[self.selectedIndex]
    self.selectedtype = activityIndex

    self:showDetailsLayer(activityIndex)

    self.tableView:reloadData()
end

function OpenServiceHomeLayer:showDetailsLayer(activityId)

    -- if 1 then
    --     return
    -- end
    -- -- print("type = ", type)
    local layer = self.detailsLayerTable[activityId]
    if layer then
        if layer == self.currentDetailsLayer then
            return
        end

        if self.currentDetailsLayer then
            self.currentDetailsLayer:setVisible(false)
            self.currentDetailsLayer:removeEvents()
        end
        layer:setVisible(true)
        self.currentDetailsLayer = layer
        self.currentDetailsLayer:registerEvents()
    else
        local activityInfo = OperationActivitiesManager:getActivityInfo(activityId)
        if activityInfo == nil then
            print("--- showDetailsLayer can't find activity id = ",activityId)
            return
        end

        local activityType = activityInfo.type
        print("--- showDetailsLayer activityType = ", activityType)

        local layerFile = "lua.logic.gameactivity.Activity_common"

        if activityType ==  OperationActivitiesManager.Type_Online then
            layerFile = 'lua.logic.gameactivity.Activity_online'

        elseif activityType == OperationActivitiesManager.Type_Casino then
            layerFile = 'lua.logic.gameactivity.Activity_Casino'

        elseif activityType == OperationActivitiesManager.Type_Exchange then
            layerFile = 'lua.logic.gameactivity.Activity_exchangegoods'
        elseif activityType == OperationActivitiesManager.Type_Continue_Collect_Role then
            layerFile = 'lua.logic.gameactivity.Activity_Collect_Role'

        elseif activityType == OperationActivitiesManager.Type_Score_Exchange then
            layerFile = 'lua.logic.gameactivity.Activity_scoreexchange'
                
        elseif activityType == OperationActivitiesManager.Type_Score_Egg then
            layerFile = 'lua.logic.gameactivity.Activity_scoreexchange'

        elseif activityType == OperationActivitiesManager.Type_Score_XunBao then
            layerFile = 'lua.logic.gameactivity.Activity_scoreexchange'
            
        elseif activityType == OperationActivitiesManager.Type_Tian_Ji_Lun_SCORE then
            layerFile = 'lua.logic.gameactivity.Activity_scoreexchange'

        elseif activityType == OperationActivitiesManager.Type_Money_Shop then
            layerFile = 'lua.logic.gameactivity.Activity_MoneyShop'
            
        elseif activityType == OperationActivitiesManager.Type_Shop_Employ then
            layerFile = 'lua.logic.gameactivity.Activity_employ'
        elseif activityType == OperationActivitiesManager.Type_Ten_Card then
            layerFile = 'lua.logic.gameactivity.Activity_RewardIcon'
        elseif activityType == OperationActivitiesManager.Type_JiangHuSheLi then
            layerFile = 'lua.logic.gameactivity.Activity_RewardIcon'
        elseif activityType == OperationActivitiesManager.Type_Total_YuanBao then
            layerFile = 'lua.logic.gameactivity.Activity_totalrecharge'
        elseif activityType == OperationActivitiesManager.Type_jianghumoney then
            layerFile = 'lua.logic.gameactivity.Activity_jianghumoney'
        elseif activityType == OperationActivitiesManager.Type_New_Continue_Recharge then
            layerFile = 'lua.logic.gameactivity.Activity_Continue_Recharge'
        elseif activityType == OperationActivitiesManager.Type_Limit_Shop then
            layerFile = 'lua.logic.gameactivity.Activity_limitshop'
        elseif activityType == OperationActivitiesManager.Type_Full_Cut then
            layerFile = 'lua.logic.gameactivity.Activity_Fanxian'
        elseif activityType == OperationActivitiesManager.Type_Group_On then
            layerFile = 'lua.logic.gameactivity.Activity_TuanGou'
        elseif activityType == OperationActivitiesManager.Type_VIP_GIFT then
            layerFile = 'lua.logic.gameactivity.Activity_VIP_Gift'
        elseif activityType == OperationActivitiesManager.Type_Xia_Ke_Xing_SCORE then
            layerFile = 'lua.logic.gameactivity.Activity_scoreexchange_wood'
        elseif activityType == OperationActivitiesManager.Type_ChongzhiRank or activityType == OperationActivitiesManager.Type_XiaofeiRank then
            layerFile = 'lua.logic.gameactivity.Activity_RechargeConsumeRank'
        end
        
        print("layerFile = ",layerFile, activityId)
        layer = require(layerFile):new(activityId)
        if layer == nil then
            print("fuck you ,can not create layer instance for : ",layerFile)
            return
        end
        

        layer.logic = self
        self.detailsLayerTable[type] = layer
        if self.currentDetailsLayer then
            self.currentDetailsLayer:setVisible(false)
            self.currentDetailsLayer:removeEvents()
        end
        self.panel_details:addChild(layer)
        self.currentDetailsLayer = layer
    end
    self.currentDetailsLayer:onShow()


    local activeData = OperationActivitiesManager:getActivityInfo(activityId)
    if activeData == nil then
        return
    end

    if activeData.type == OperationActivitiesManager.Type_Score_Exchange or activeData.type == OperationActivitiesManager.Type_Score_Egg or
     activeData.type == OperationActivitiesManager.Type_Score_XunBao or activeData.type == OperationActivitiesManager.Type_Tian_Ji_Lun_SCORE or
     activeData.type == OperationActivitiesManager.Type_Total_YuanBao or activeData.type == OperationActivitiesManager.Type_Xia_Ke_Xing_SCORE then
        OperationActivitiesManager:sendMsgToGetActivityUpdate(activityId)
    end

    if self.currentDetailsLayer.bIsRecruitIntegralActivity and self.currentDetailsLayer.bIsRecruitIntegralActivity == true then
        self.generalHead:setResVisibleByIndex(1, true)
    else
        self.generalHead:setResVisibleByIndex(1, false)
    end 
end

function OpenServiceHomeLayer.cellSizeForTable(table,idx)
	--return 100,429
    if idx == 0 then
        return 120, 429
    end
    return 90,429
end

function OpenServiceHomeLayer.tableCellAtIndex(table, idx)
    local self = table.logic
    local activityIndex = self.activityIndex[idx+1]

    local cell = table:dequeueCell()
    local self = table.logic
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true
        local equip_panel = require('lua.logic.gameactivity.ActivitiesButton'):new()
        equip_panel:setLogic(self)
        cell:addChild(equip_panel)
        cell.equip_panel = equip_panel

        equip_panel:setPosition(ccp(0,-10))
    end
    -- cell.equip_panel:setType(idx+1)

    local activityInfo = OperationActivitiesManager:getActivityInfo(activityIndex)

    -- print("-------activity name = ", activityInfo.name)
    -- local desc1, desc2, path  = OperationActivitiesManager:getRewardItemDesc(activityIndex)

    -- cell.equip_panel:setPath(path, activityIndex)
    cell.equip_panel:setTitle(activityInfo.name, activityIndex)
    cell.equip_panel:setMultiServer(activityInfo.multiSever or false)
    -- CommonManager:setRedPoint(cell.equip_panel, OperationActivitiesManager:isHaveRewardCanGetByType(activityIndex),"isHaveRewardCanGet",ccp(-180,60))

    CommonManager:setRedPoint(cell.equip_panel, OperationActivitiesManager:isHaveRewardCanGetByActivityId(activityIndex),"isHaveRewardCanGet",ccp(-165,43))

    if idx == 0 then
        cell.equip_panel:setPositionY(-10)
    end
    return cell
end

function OpenServiceHomeLayer.numberOfCellsInTableView(table)
    local self = table.logic
    -- return 10

    -- return #self.activityIndex
    return self.activityNum
end
function OpenServiceHomeLayer.refreshRwdPoint()

end



function OpenServiceHomeLayer:reloadTableView()
    print("1111OpenServiceHomeLayer:reloadTableView-----------")
    if not self.tableView then
        print("self.tableView is nil")
        return
    end

    self.activityIndex, self.activityNum = OperationActivitiesManager:getOpenAndShowActivityList(self.activity_show_type)

    print("当前开启的活动个数：", self.activityNum)
    print("当前开启的活动有：", self.activityIndex)
    self.tableView:reloadData()
    if self.activityNum == 0 then
        AlertManager:closeAllToLayer(self)
        return
    end
end

function OpenServiceHomeLayer:activityUpdate()
    -- 
    print("OpenServiceHomeLayer:activityUpdate-----------")
    self:reloadTableView()
    if self.activityNum > 0  then
        self.selectedIndex = -1
        self:select(1)
    end
    
    print("OpenServiceHomeLayer:activityUpdate end-----------")
end


return OpenServiceHomeLayer