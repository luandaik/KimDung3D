-- client side TianMingShuXingLayer.lua
--[[
 * @Description: 天命属性层
 ]]

local TianMingShuXingLayer = class("TianMingShuXingLayer", BaseLayer)
local EffectExtraData = clone(EffectExtraDataModel)

function TianMingShuXingLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.role_new.TianMingShuXing")

end

function TianMingShuXingLayer:initUI(ui)
	self.super.initUI(self,ui)
    self.panel_shuxing          = TFDirector:getChildByPath(ui, 'panel_shuxing')
    self.panel_shuxing2         = TFDirector:getChildByPath(ui, 'panel_shuxing2')
    self.cell1                  = TFDirector:getChildByPath(ui, 'img_attr1')
    self.cell2                  = TFDirector:getChildByPath(ui, 'img_py1')
    for i=2,3 do
        local img_attr          = TFDirector:getChildByPath(ui, 'img_attr'..i)
        img_attr:removeFromParent()
    end   
    self.pylist = {}
    for i=1,3 do
        local img_py           = TFDirector:getChildByPath(ui, 'img_py'..i)
        img_py.txt_name        = TFDirector:getChildByPath(img_py, 'txt_name')
        img_py.txt_base        = TFDirector:getChildByPath(img_py, 'txt_base')
        self.pylist[i] = img_py
    end 
    self.cell1:removeFromParent()
    self.cell1:retain()
    
    self.cell2:retain()
end
function TianMingShuXingLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end
function TianMingShuXingLayer:loadData(roleid)
    local cardRole   = CardRoleManager:getRoleByGmid(roleid);
    local attribute1  = EffectExtraData:new()
    local exp = 0
    for  i = 1,9 do
        exp = exp + cardRole.TianMing[i].exp + cardRole.TianMing[i].price
    end
    local ir_tbl0, ea_tbl0, ep_tbl0, power = DesTinyMissionData:getTianMingAchievementAttr(exp)
    if ir_tbl0 then
        attribute1:add(ir_tbl0)
    end
    if ea_tbl0 then
        attribute1:add(ea_tbl0)
    end
    for k,v in pairs(ep_tbl0) do
        local x = attribute1.attribute[k+0.1] or 0
        attribute1.attribute[k + 0.1] = x + v
    end
    for i = 1,9 do
        if cardRole.TianMing[i].ir_tb then
            attribute1:add(cardRole.TianMing[i].ir_tb)
        end 
        if cardRole.TianMing[i].ea_tb then
            attribute1:add(cardRole.TianMing[i].ea_tb)
        end
        if cardRole.TianMing[i].ep_tb then
        for k,v in pairs(cardRole.TianMing[i].ep_tb) do
            local x = attribute1.attribute[k+0.1] or 0
            attribute1.attribute[k + 0.1] = x + v
        end
    end
    
end
    self.sxnum = 0
    self.attributelist = {}
    for k,v in pairs(attribute1.attribute) do
        self.sxnum = self.sxnum + 1
        local list = {k,v}
        self.attributelist[self.sxnum] = list
    end
    table.sort(self.attributelist,function (a,b)
         return a[1] < b[1]
    end)
    self.tianminglist = cardRole.TianMing
end

function TianMingShuXingLayer:refreshUI()
    if self.tableView == nil then
        self.tableView = TFTableView:create()
        self.tableView.logic = self
        self.tableView:setTableViewSize(self.panel_shuxing:getContentSize())  
        self.tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        self.tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        
        self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable, self))
        self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex, self))
        self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView, self))    
        self.panel_shuxing:addChild(self.tableView)
    end
    self.tableView:reloadData()
    local expnum = 0
    local level = 0
    for i = 1,9 do
        expnum = expnum + self.tianminglist[i].exp + self.tianminglist[i].price
    end
    nextexp,level= DesTinyMissionData:getTianMingAchievementAttrNextExp(expnum)

    self.pylist[1].txt_base:setText(level.."级")
    self.pylist[2].txt_name:setText(localizable.TianMing_tips5)
    if nextexp - expnum > 0 then
        self.pylist[2].txt_base:setText(nextexp - expnum)
    else
        self.pylist[2].txt_base:setText( localizable.roleBook_enchant_max_level )
    end

    local attr = DesTinyMissionData:getTianMingAchievementAttrnextAttr(expnum)
    if attr == nil then
        self.pylist[3]:setVisible(false)
    else
        self.pylist[3]:setVisible(true)
        for k,v in pairs(attr) do
            self.pylist[3].txt_name:setText(localizable.TianMing_tips6)
            if k <= 15 then
                self.pylist[3].txt_base:setText(localizable.TianMingAttributeTypeStr[k].." +"..v)
            elseif k == 41 or k == 42 or k == 44 then
                if v < 0 then
                    self.pylist[3].txt_base:setText(localizable.TianMingAttributeTypeStr[k]..localizable.TianMing_tips10.." +"..math.abs(v/100) .."%")
                else
                    self.pylist[3].txt_base:setText(localizable.TianMingAttributeTypeStr[k]..localizable.TianMing_tips9.." +".. v/100 .."%")
                end
            else
                self.pylist[3].txt_base:setText(localizable.TianMingAttributeTypeStr[k].." +".. v/100 .."%")
            end
        end
    end



end

function TianMingShuXingLayer:cellSizeForTable(table,idx)
    return 30,429
end

function TianMingShuXingLayer:tableCellAtIndex(table, idx)
    local cell = table:dequeueCell()

    idx = idx + 1
    if cell == nil then
        cell = TFTableViewCell:create()
        local panel = self.cell1:clone()
        panel:setVisible(true)
        cell.panel = panel
        panel:setZOrder(100)
        cell:addChild(panel)
        panel:setPosition(ccp(30,12))
    end
    self:setCellInfo(cell,idx)
    return cell
end
function TianMingShuXingLayer:numberOfCellsInTableView(table)
    local self = table.logic
    if self.sxnum then
        return self.sxnum
    end
    return 0
end

function TianMingShuXingLayer:setCellInfo(cell,idx)
    local panel = cell.panel
    local txt_name    = TFDirector:getChildByPath(panel, "txt_name")
    local txt_base     = TFDirector:getChildByPath(panel, "txt_base")

    if math.floor(self.attributelist[idx][1]) == 44 or math.floor(self.attributelist[idx][1]) == 41 or math.floor(self.attributelist[idx][1]) == 42 or math.floor(self.attributelist[idx][1]) == 40 then
        if self.attributelist[idx][1] > math.floor(self.attributelist[idx][1]) then
            txt_name:setText(localizable.TianMingAttributeTypeStr[math.floor(self.attributelist[idx][1])]..localizable.TianMing_tips10)
        else 
            txt_name:setText(localizable.TianMingAttributeTypeStr[math.floor(self.attributelist[idx][1])]..localizable.TianMing_tips9)
        end
    else
        txt_name:setText(localizable.TianMingAttributeTypeStr[math.floor(self.attributelist[idx][1])])
    end

    if self.attributelist[idx][1] <= 15 then
        txt_base:setText("  +"..math.abs(self.attributelist[idx][2]))
    else
        txt_base:setText("  +"..math.abs(self.attributelist[idx][2]/100) .."%")
    end
end
function TianMingShuXingLayer:removeUI()
    self.super.removeUI(self)
end

function TianMingShuXingLayer:dispose()
    self.super.dispose(self)
end
-----断线重连支持方法
function TianMingShuXingLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end
return TianMingShuXingLayer