-- 周年庆活动
-- Author: shenjingjie
-- Date: 2017-11-21

local AnniversaryMainLayer = class("AnniversaryMainLayer", BaseLayer)


function AnniversaryMainLayer:ctor(data)
    self.super.ctor(self)
    self.activity_show_type = data
    self:init("lua.uiconfig_mango_new.operatingactivities.HomeLayer")
end

function AnniversaryMainLayer:initUI(ui)
	self.super.initUI(self,ui)

	self.generalHead = CommonManager:addGeneralHead( self )
	self.generalHead:setData(ModuleType.YunYingHuoDong,{HeadResType.RECRUITINTEGRAL,HeadResType.COIN,HeadResType.SYCEE})
    self.btn_wdpy                = TFDirector:getChildByPath(ui, 'btn_wdpy')
    self.btn_wdpy:setVisible(false)

    self.activityNum   = 0
    self.activityIndex = {}

    self.activityIndex, self.activityNum = AnniversaryManager:getOpenAndShowActivityList()
    
    print("当前开启的活动个数：", self.activityNum)
    print("当前开启的活动有：", self.activityIndex)


    self.panel_buttons           = TFDirector:getChildByPath(ui, 'panel_buttons')
	self.panel_details 	         = TFDirector:getChildByPath(ui, 'panel_details')

    self.detailsLayerTable = {}     --详细内容图层
    self.currentDetailsLayer = nil  --当前显示的详细内容图层
    self:initActivitiesButtons()
    --选中第一个
end

function AnniversaryMainLayer:initActivitiesButtons()
    local  tableView =  TFTableView:create()
    tableView:setName("btnTableView")
    tableView:setTableViewSize(self.panel_buttons:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    self.tableView = tableView
     
    self.tableView.logic = self

    tableView:addMEListener(TFTABLEVIEW_TOUCHED, AnniversaryMainLayer.tableCellTouched)
    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, AnniversaryMainLayer.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, AnniversaryMainLayer.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, AnniversaryMainLayer.numberOfCellsInTableView)

    self.panel_buttons:addChild(tableView)
    tableView:reloadData()

    tableView:setPosition(ccp(10,-10))
end

function AnniversaryMainLayer:removeUI()
	self.super.removeUI(self)
end

function AnniversaryMainLayer:onShow()
    self.super.onShow(self)
    if self.currentDetailsLayer then
        self.currentDetailsLayer:onShow()
    end

    self.generalHead:onShow()


    -- self:reloadTableView()
end

function AnniversaryMainLayer:dispose()
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

function AnniversaryMainLayer:registerEvents()
	self.super.registerEvents(self)
	if self.generalHead then
        self.generalHead:registerEvents()
    end
    if self.currentDetailsLayer then
        self.currentDetailsLayer:registerEvents();
    end

    self.updateRewardCallback = function(event)
        self.tableView:reloadData()
    end;
    TFDirector:addMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD,self.updateRewardCallback)
    TFDirector:addMEGlobalListener(AnniversaryManager.MSG_SIGN_UPDATE, self.updateRewardCallback)
end

function AnniversaryMainLayer:removeEvents()
	self.super.removeEvents(self)
    
    if self.generalHead then
        self.generalHead:removeEvents()
    end
    if self.currentDetailsLayer then
        self.currentDetailsLayer:removeEvents();
    end
    TFDirector:removeMEGlobalListener(OperationActivitiesManager.MSG_ACTIVITY_GET_REWARD,self.updateRewardCallback)
    TFDirector:removeMEGlobalListener(AnniversaryManager.MSG_SIGN_UPDATE,self.updateRewardCallback)
    self.updateRewardCallback = nil
end

function AnniversaryMainLayer:showDetailsLayer(activityId)
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
    	local activityInfo = AnniversaryManager:getActivityInfo(activityId)
        if activityInfo == nil then
            print("--- showDetailsLayer can't find activity id = ",activityId)
            return
        end
        local activityType = activityInfo.type
        local layerFile = "lua.logic.zhounianqing.Activity_Ordinary"

        if (activityType == AnniversaryManager.Type_ZhouNianH or activityType == AnniversaryManager.Type_ZhouNianK) then
            layerFile = 'lua.logic.zhounianqing.Activity_ZhouNianHuoyue'
        elseif (activityType == AnniversaryManager.Type_ZhouNianD) then
            layerFile = 'lua.logic.zhounianqing.Activity_ZhouNianDuiHuan'
        elseif (activityType == AnniversaryManager.Type_ZhouNianQ) then
            layerFile = 'lua.logic.zhounianqing.Activity_ZhouNianQianDao'
        end
        print("activityType",activityType,"layerFile",layerFile)
        layer = require(layerFile):new(activityType)
        if layer == nil then
            print("fuck you ,can not create layer instance for : ",layerFile)
            return
        end

        layer.logic = self
        self.detailsLayerTable[activityType] = layer
        if self.currentDetailsLayer then
            self.currentDetailsLayer:setVisible(false)
            self.currentDetailsLayer:removeEvents()
        end
        self.panel_details:addChild(layer)
        self.currentDetailsLayer = layer
    end
    self.currentDetailsLayer:onShow()

    if self.currentDetailsLayer.bIsRecruitIntegralActivity and self.currentDetailsLayer.bIsRecruitIntegralActivity == true then
        self.generalHead:setResVisibleByIndex(1, true)
    else
        self.generalHead:setResVisibleByIndex(1, false)
    end 
end

function AnniversaryMainLayer.cellSizeForTable(table,idx)
	return 90,429
end

function AnniversaryMainLayer.tableCellAtIndex(table, idx)
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

        equip_panel:setPosition(ccp(0,-15))
    end
    -- cell.equip_panel:setType(idx+1)

    local activityInfo = AnniversaryManager:getActivityInfo(activityIndex)

    -- print("-------activity name = ", activityInfo)
    -- local desc1, desc2, path  = OperationActivitiesManager:getRewardItemDesc(activityIndex)

    -- cell.equip_panel:setPath(path, activityIndex)
    cell.equip_panel:setTitle(activityInfo.name, activityIndex)
    cell.equip_panel:setMultiServer(false)
    -- CommonManager:setRedPoint(cell.equip_panel, OperationActivitiesManager:isHaveRewardCanGetByType(activityIndex),"isHaveRewardCanGet",ccp(-180,60))

    CommonManager:setRedPoint(cell.equip_panel, AnniversaryManager:isHaveRewardCanGetByActivityId(activityIndex),"isHaveRewardCanGet",ccp(-170,50))
    return cell
end

function AnniversaryMainLayer.numberOfCellsInTableView(table)
    local self = table.logic
    -- return 10

    -- return #self.activityIndex
    return self.activityNum
end

function AnniversaryMainLayer.tableCellTouched(table,cell)
    local self = table.logic
    local idx = cell:getIdx() + 1
    play_press()
    self:select(idx)
end

function AnniversaryMainLayer:select(index)
    if self.selectedIndex and index == self.selectedIndex then
        return
    end

    self.selectedIndex = index
    

    local activityIndex = self.activityIndex[self.selectedIndex]
    self.selectedtype = activityIndex

    self:showDetailsLayer(activityIndex)

    self.tableView:reloadData()
end









return AnniversaryMainLayer