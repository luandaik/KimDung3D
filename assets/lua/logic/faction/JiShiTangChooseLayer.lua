--[[
******济世堂选择物品界面*******

	-- by luoconghai
	-- 2017/05/09
	
]]

local JiShiTangChooseLayer = class("JiShiTangChooseLayer",BaseLayer)

function JiShiTangChooseLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.JiShiTangChoose")
    self:refreshData()
end

function JiShiTangChooseLayer:initUI( ui )

	self.super.initUI(self, ui)

    self.panel_head     = TFDirector:getChildByPath(ui, 'panel_head');
    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.Jishitang,{HeadResType.COIN,HeadResType.SYCEE})
    self.generalHead:setVisible(true)

    self.panel_list    = TFDirector:getChildByPath(ui, "panel_list")
    self.btn_xiahun           = TFDirector:getChildByPath(ui, "btn_xiahun")
    self.btn_xiahun.index=1
    self.btn_zhuangsui        = TFDirector:getChildByPath(ui, "btn_zhuangsui")
    self.btn_zhuangsui.index=2
    self.btn={
        self.btn_xiahun,
        self.btn_zhuangsui
    }
    self.btnPath={
        'ui_new/bag/tab-xh',
        'ui_new/bag/tab-sp'
    }
end


function JiShiTangChooseLayer:removeUI()
	self.super.removeUI(self)
end

function JiShiTangChooseLayer:onShow()
    self.super.onShow(self)
    -- self:refreshUI()
end

function JiShiTangChooseLayer:loadData()
    if not self.isFirstTimeIn then
        self:moveIn()
        self.isFirstTimeIn=true
    end
       self:refreshBtn(1)
end
function JiShiTangChooseLayer:refreshData()

    self.soulData={}--侠魂数据
    for v in CardRoleManager.cardRoleList:iterator() do
        -- local data=CardRoleManager:getRoleById(v )
        -- if data:isMainRole() then
        --     print("55555555555555555555555")
        --     print(v)
        -- end
        local roleData=RoleData:objectByID(v)
        if roleData.quality>=4 and roleData.quality<=6 then
            local itemdata=ItemData:objectByID(roleData.soul_card_id)
            if itemdata then
                local t = {}
                t.path = itemdata:GetPath()
                t.itemid=itemdata.id
                t.number=0
                t.name=itemdata.name
                t.type=itemdata.type
                t.quality=itemdata.quality
                t.desc=itemdata.details
                table.insert(self.soulData,t)
            end
        end
    end

    local function sortByquality(v1, v2)
        if v1.quality~=v2.quality then
            return v1.quality > v2.quality
        else
            return v1.itemid < v2.itemid
        end
    end
    table.sort( self.soulData, sortByquality )

    local function sortByKind(v1, v2)
        if v1.kind~=v2.kind then
            return v1.kind < v2.kind
        else
            return v1.itemid < v2.itemid
        end
    end
    -- print(CardRoleManager.cardRoleList.m_list)
    -- print(self.soulData)

    self.equipmentData={}--武器碎片数据（全部）
    local myEquipment=BagManager:getItemByKind(EnumGameItemType.Piece,5)--取得我的装备碎片的数据
    for v in ItemData:iterator() do
        if v.type == 8 and v.quality == 5 and v.special_equipment == 0 and v.kind~=10  then
           -- { id = 80016, name = "英雄长剑残片", type = 8, kind = 1, quality = 3, level = 1, price = 250, usable = 0, outline = "武器", details = "集齐15个可以合成英雄长剑", 
            local t = {}
            t.path = v:GetPath()
            t.itemid=v.id
            t.number=0
            t.name=v.name
            t.type=v.type
            t.quality=v.quality
            t.desc=v.details
            t.kind=v.kind
            if next(myEquipment)~=nil then
                for j,v2 in pairs(myEquipment.m_list) do
                    if v2.id==t.itemid then
                        t.number=v2.num
                        break
                    end
                end
            end
            table.insert(self.equipmentData,t)
        end
    end
    table.sort( self.equipmentData, sortByKind )
end




function JiShiTangChooseLayer:moveIn()
    self.ui:runAnimation("Action0",1)
end

function JiShiTangChooseLayer:refreshUI()
    
end

function JiShiTangChooseLayer:refreshBtn(index)
    if self.typeIndex~=nil and self.typeIndex==index  then
        return 
    end
    for k,v in ipairs(self.btn) do
        v:setTextureNormal(self.btnPath[k].."2.png")
        if k==index then
            v:setTextureNormal(self.btnPath[k]..".png")
        end
    end
    self.typeIndex=index
    if self.typeIndex==1 then
        self.UIInfo=self.soulData
    else
        self.UIInfo=self.equipmentData
    end
    self:refreshTableView()
end

function JiShiTangChooseLayer:refreshTableView()
    if self.tableView == nil then
        local  tableView =  TFTableView:create()
        tableView:setTableViewSize(self.panel_list:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
        tableView:setPosition(ccp(0, 0))
        self.tableView = tableView
        -- self.tableView.logic = self

        -- tableView:addMEListener(TFTABLEVIEW_TOUCHED, NewSignLayer.tableCellTouched)
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW,handler(self.numberOfCellsInTableView,self))
        tableView:reloadData()
        self.panel_list:addChild(self.tableView,1)
    end
    self.tableView:reloadData()
end

function JiShiTangChooseLayer:numberOfCellsInTableView(table) 
    local num=0
    if next(self.UIInfo)~=nil then
        num=math.ceil(#self.UIInfo/5)
    end
    return num
end


function JiShiTangChooseLayer:cellSizeForTable(table,idx)
    return 128,740
end

function JiShiTangChooseLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
    end
    self:drawGiftCell(cell,idx)
    return cell
end



function JiShiTangChooseLayer:drawGiftCell(cell, idx)

    for i=1,5 do
        local node = cell:getChildByTag(100 + i)
        local infoData = self.UIInfo[ (idx - 1) * 5 + i ]
        if infoData then
            if node == nil then
                node = Public:createIconNumNode(infoData)
                local posX= (i - 1) * (node:getContentSize().width+24)
                node:setPosition(ccp(posX,0))
                cell:addChild(node,1,100 + i)
            end
            Public:loadIconNode(node,infoData)
            local img_icon = TFDirector:getChildByPath(node, 'img_icon');
            Public:addPieceImg(img_icon,{type=EnumDropType.GOODS,itemid=infoData.itemid},nil,1.0);
            local bg_icon   = TFDirector:getChildByPath(node, 'bg_icon');
            if bg_icon then
                bg_icon.logic=self
                bg_icon.infoData=infoData
                bg_icon:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onItemClickHandle),1);
            end

            local txt_num=TFDirector:getChildByPath(node, 'txt_num');
            local num=BagManager:getItemNumById(infoData.itemid) or 0
            if infoData.type == 7 then
                if infoData.quality==4 then
                    txt_num:setText(num.."/"..150)
                elseif infoData.quality==5 then
                    txt_num:setText(num.."/"..200)
                end
            elseif infoData.type == 8 then
                txt_num:setText(num.."/"..30)
            end
            txt_num:setVisible(true)
        else
            if node then
                node:setVisible(false)
            end
        end
    end
end



function JiShiTangChooseLayer:registerEvents()

	self.super.registerEvents(self)
    self.btn_zhuangsui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClick))
    self.btn_zhuangsui.logic = self  
    self.btn_xiahun:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnClick))
    self.btn_xiahun.logic = self  
    self.juanxianCallback = function (event)
        AlertManager:closeLayerByName("lua.logic.faction.JiShiTangChooseLayer")
    end
    TFDirector:addMEGlobalListener(FactionJiShiTangManager.RECEIVE_GIVE_OR_NEED_REWARD, self.juanxianCallback)
    if self.generalHead then
        self.generalHead:registerEvents()
    end
end

function JiShiTangChooseLayer:removeEvents()
    self.super.removeEvents(self) 
	TFDirector:removeMEGlobalListener(FactionJiShiTangManager.RECEIVE_GIVE_OR_NEED_REWARD ,self.juanxianCallback)
 	self.btn_zhuangsui:removeMEListener(TFWIDGET_CLICK)
    self.btn_xiahun:removeMEListener(TFWIDGET_CLICK)
    if self.generalHead then
        self.generalHead:removeEvents()
    end
end

function JiShiTangChooseLayer.onBtnClick(sender)
    local self=sender.logic
    self:refreshBtn(sender.index)
end

function JiShiTangChooseLayer.onItemClickHandle(sender)
    FactionJiShiTangManager:openJiShiTangGiveLayer(sender.infoData,FactionJiShiTangManager.TYPE_NEED,false)
end

return JiShiTangChooseLayer
