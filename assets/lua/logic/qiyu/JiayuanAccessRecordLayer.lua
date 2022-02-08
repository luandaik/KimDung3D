-- client side JiayuanAccessRecordLayer.lua
--[[
 * @Description: 家园访客
 ]]
-- script writer chikui
-- creation time 2017-04-08


local JiayuanAccessRecordLayer = class("JiayuanAccessRecordLayer", BaseLayer)
function JiayuanAccessRecordLayer:ctor(equipid)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.qiyu.FamilyFk")
end

function JiayuanAccessRecordLayer:initUI(ui)
    self.super.initUI(self,ui)
    self.btn_close          = TFDirector:getChildByPath(ui, 'btn_close')
    self.panel_list         = TFDirector:getChildByPath(ui, 'panel_huadong')

    self.panel_cell_model = TFDirector:getChildByPath(ui, 'panel_cell' )
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()
end

function JiayuanAccessRecordLayer:registerEvents(ui)
    self.super.registerEvents(self)
    
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function JiayuanAccessRecordLayer:removeEvents()
    self.super.removeEvents(self)
end

function JiayuanAccessRecordLayer:dispose()
    self.super.dispose(self)
end

function JiayuanAccessRecordLayer:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end
end

function JiayuanAccessRecordLayer:onShow()
    self.super.onShow(self)
end

function JiayuanAccessRecordLayer:refreshUI()

end


function JiayuanAccessRecordLayer:setData( data )
    self:initData(data)
    self:refreshTableView()
end

function JiayuanAccessRecordLayer:initData( data )
    self.dataList = {}
    if data == nil or #data <= 0 then
        return
    end

    -- type:
    -- 1    timestemp
    -- 2    recordInfo
    local max_len = #data
    local tbl = stringToTable(data[1].recordstr,",")
    local timestemp = tonumber(tbl[#tbl])
    timestemp = math.floor(timestemp/1000)
    self.dataList[1] = { _type = 1,data = { timestemp = timestemp } }
    local lastTimeData = GetCorrectDate("*t",self.dataList[1].data.timestemp)
    for i,v in ipairs(data) do
        local tblsss = stringToTable(v.recordstr,",")
        local timestemp = tonumber(tblsss[#tblsss])
        local recordData = {}
        recordData.recordtype = tonumber(tblsss[1])
        recordData.playerName = tblsss[2]
        if recordData.recordtype == 2 then
            recordData.eventId = tonumber(tblsss[3])
        end
        timestemp = math.floor(timestemp/1000)
        recordData.timestemp = timestemp
        if MainPlayer:getPlayerName() ~= recordData.playerName then
            local timeData = GetCorrectDate("*t",timestemp)
            if lastTimeData == nil or timeData.yday ~= lastTimeData.yday or timeData.year ~= lastTimeData.year then
                local list_len = #(self.dataList)
                lastTimeData = timeData
                self.dataList[list_len + 1] = { _type = 1,data = { timestemp = timestemp } }
            end
            local list_len = #(self.dataList)
            self.dataList[list_len + 1] = { _type = 2,data = recordData }
        else
            if i == 1 then
                self.dataList[1] = nil
                lastTimeData = nil
            end
        end
    end
end

function JiayuanAccessRecordLayer:refreshTableView()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()

        self.tableView = tableView
        tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView,self))
        --self.tableView:addMEListener(TFTABLEVIEW_SCROLL, handler(self.tableScroll,self))
        self.panel_list:addChild(tableView)
    end
    self.tableView:reloadData()
end


function JiayuanAccessRecordLayer:cellSizeForTable(table,idx)
    return 30,773
end

function JiayuanAccessRecordLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_cell_model:clone()
        node:setVisible(true)
        node:setPositionX(0)
        cell:addChild(node,1)
        cell.panel = node
    end
    self:setCellInfo(cell,idx)
    return cell
end

function JiayuanAccessRecordLayer:numberOfCellsInTableView(table)
    local num = #(self.dataList)
    if num < 0 then num = 0 end
    return num
end

function JiayuanAccessRecordLayer:setCellInfo(cell,idx)
    local info = self.dataList[idx]
    local panel = cell.panel
    if info == nil then
        panel:setVisible(false)
        return
    end
    local txt_date = TFDirector:getChildByPath(panel, 'txt_date')
    local img_x2 = TFDirector:getChildByPath(panel, 'img_x2')
    local img_x1 = TFDirector:getChildByPath(panel, 'img_x1')
    local txt_time = TFDirector:getChildByPath(panel, 'txt_time')
    local txt_wenzi = TFDirector:getChildByPath(panel, 'txt_wenzi')
    panel:setVisible(true)
    local timeData = GetCorrectDate("*t",info.data.timestemp)
    if info._type == 1 then
        txt_date:setVisible(true)
        img_x2:setVisible(true)
        img_x1:setVisible(true)
        txt_time:setVisible(false)
        txt_wenzi:setVisible(false)
        panel:setPositionY(-65)
        txt_date:setText(timeData.year .. "-" .. timeData.month .. "-" .. timeData.day)
    elseif info._type == 2 then
        txt_date:setVisible(false)
        img_x2:setVisible(false)
        img_x1:setVisible(false)
        txt_time:setVisible(true)
        txt_wenzi:setVisible(true)
        panel:setPositionY(-30)
        txt_time:setText(timeData.hour .. ":" .. timeData.min)
        local strFormat = nil
        if info.data.recordtype == 1 then
            strFormat = localizable.Jiayuan_home_event_record_1
        else
            if info.data.eventId and info.data.eventId == 1 then
                strFormat = localizable.Jiayuan_home_event_record_2
            elseif info.data.eventId and info.data.eventId == 2 then
                strFormat = localizable.Jiayuan_home_event_record_3
            elseif info.data.eventId and info.data.eventId == 3 then
                strFormat = localizable.Jiayuan_home_event_record_4
            elseif info.data.eventId and info.data.eventId == 4 then
                strFormat = localizable.Jiayuan_home_event_record_5
            end
        end
        if strFormat then
            txt_wenzi:setText(stringUtils.format(strFormat,info.data.playerName))
        end
    end
end

return JiayuanAccessRecordLayer