

local CustomRoleSelect = class("CustomRoleSelect",BaseLayer)

local columnNumber = 3

function CustomRoleSelect:ctor(data)

	self.super.ctor(self, data)
	self.isFirst = true
    self.dataType = data
    if data == 1 then
        self:init("lua.uiconfig_mango_new.SkillStrategy.SkillStrategyRole")
    else
        self:init("lua.uiconfig_mango_new.SkillStrategy.SkillStrategyRole2")
    end
end

function CustomRoleSelect:initUI( ui )

	self.super.initUI(self, ui)

	self.panel_cardregional = TFDirector:getChildByPath(ui, 'panel_RoleList')
	self.btn_shousuo = TFDirector:getChildByPath(ui, 'btn_shousuo')
    self.txt_zhiyin1 = TFDirector:getChildByPath(ui, "txt_zhiyin1")

	self.cellModel = createUIByLuaNew("lua.uiconfig_mango_new.role.ArmyRoleItem")
    self.cellModel:retain()
end


function CustomRoleSelect:initDate( role_list, showText,clickCallBack)
	self.roleList = role_list
	self.showText = showText
	self.clickCallBack = clickCallBack

	if self.tableView == nil then
		self:creatTableView()
	end
	self.tableView:reloadData()

	if self.showText == nil or self.showText == "" then
		self.txt_zhiyin1:setVisible(false)
	else
		self.txt_zhiyin1:setVisible(true)
		self.txt_zhiyin1:setText(self.showText)
	end
end

function CustomRoleSelect:creatTableView()
	local  tableView =  TFTableView:create()
    tableView:setTableViewSize(self.panel_cardregional:getContentSize())
    tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
    tableView:setVerticalFillOrder(0)
    tableView:setPosition(self.panel_cardregional:getPosition())
    self.tableView = tableView
     
    self.tableView.logic = self

    tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, CustomRoleSelect.cellSizeForTable)
    tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, CustomRoleSelect.tableCellAtIndex)
    tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, CustomRoleSelect.numberOfCellsInTableView)


    self.panel_cardregional:getParent():addChild(self.tableView,1)
end


function CustomRoleSelect.cellSizeForTable(table,cell)
	return 173,600
end

function CustomRoleSelect.tableCellAtIndex(table,idx)
	local self = table.logic
    local cell = table:dequeueCell()
    self.allPanels = self.allPanels or {}

    if cell == nil then
        cell = TFTableViewCell:create()
        local newIndex = #self.allPanels + 1
        self.allPanels[newIndex] = cell

        for i=1,columnNumber do
            local panel = self.cellModel:clone()
            panel:setPosition(ccp(0 + 142 * (i - 1) ,0))
            cell:addChild(panel)
            panel:setTag(i)
        end
    end
    for i=1,columnNumber do
        local panel = cell:getChildByTag(i)
        self:cellInfoSet(panel, idx*columnNumber+i)
    end

    return cell
end



function CustomRoleSelect:cellInfoSet( panel, idx )

    if panel.boundData == nil then
        panel.boundData = true
        panel.panelEmpty = TFDirector:getChildByPath(panel, "panel_empty")
        panel.panelInfo = TFDirector:getChildByPath(panel, "panel_info")
        panel.btn = TFDirector:getChildByPath(panel, "btn_pingzhianniu")
        panel.img_pinzhiditu = TFDirector:getChildByPath(panel, "img_pinzhiditu")
        panel.img_touxiang = TFDirector:getChildByPath(panel, "img_touxiang")
        panel.txt_lv_word = TFDirector:getChildByPath(panel, "txt_lv_word")
        panel.img_zhan = TFDirector:getChildByPath(panel, "img_zhan")
        panel.txt_name = TFDirector:getChildByPath(panel, "txt_name")
        panel.img_zhiye = TFDirector:getChildByPath(panel, "img_zhiye")
        panel.img_quality = TFDirector:getChildByPath(panel, "img_quality")
        panel.img_fate = TFDirector:getChildByPath(panel, "img_fate")

        panel.btn:addMEListener(TFWIDGET_CLICK,audioClickfun(self.cellButtonClick))
        panel.btn.logic = self
    end

    panel.btn.idx = idx

    local roleId = self.roleList:objectAt(idx);
    local roleItem = CardRoleManager:getRoleById(roleId)
    if self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu1 or 
        self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu2 or 
        self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu3 then
        roleItem = FYRecordData:getRoleinfoByRoleid(roleId)
    end
    if  roleItem then
        panel.panelEmpty:setVisible(true)
        panel.panelInfo:setVisible(true)

        panel.img_touxiang:setTexture(roleItem:getIconPath())    
        panel.img_pinzhiditu:setTexture(GetColorIconByQuality(roleItem.quality))
        local roleStar = ""
        if roleItem.starlevel > 0 then
            roleStar = roleStar .. " +" .. roleItem.starlevel
        end
        panel.txt_name:setText(roleItem.name..roleStar)
        panel.img_zhiye:setTexture("ui_new/fight/zhiye_".. roleItem.outline ..".png")
        panel.img_quality:setTexture(GetFightRoleIconByWuXueLevel(roleItem.martialLevel))   
        panel.img_zhan:setVisible(false)
        -- --print("roleItem = ",roleItem.fateid)
        -- if roleItem.fateid ~= 0 then
        --     panel.img_fate:setVisible(true)
        -- else
        panel.img_fate:setVisible(false)
        -- end

        panel.txt_lv_word:setText(roleItem.level)
    else
        panel.panelEmpty:setVisible(false)
        panel.panelInfo:setVisible(false)
    end
end

function CustomRoleSelect.numberOfCellsInTableView(table,cell)
    local self = table.logic
	if self.roleList == nil then
		return 0
	end
	return math.ceil(self.roleList:length()/columnNumber)
end


function CustomRoleSelect.cellButtonClick( btn )
    local self = btn.logic
    local roleItem = self.roleList:objectAt(btn.idx)
    if self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu1 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu2 or self.strategyType == EnumFightStrategyType.StrategyType_FengYunLu3 then
        roleItem = FYRecordData:getRoleinfoByRoleid(roleId)
    end 
    TFFunction.call(self.clickCallBack,roleItem)
    if self.dataType ~= 1 then
        self:moveOut()
    end
end

function CustomRoleSelect:removeUI()
	self.super.removeUI(self)

	if self.cellModel then
        self.cellModel:release()
        self.cellModel = nil
    end
end

function CustomRoleSelect:onShow()
    self.super.onShow(self)

    if self.isFirst then
    	self:moveIn()
    	self.isFirst = false
    end
end



function CustomRoleSelect.closeBtnClick(btn)
    local self = btn.logic
    self:moveOut()
end


function CustomRoleSelect:moveIn()
    self.ui:runAnimation("Action0",1)
end
function CustomRoleSelect:moveOut()
    if self.moveOutState then
        return
    end
    self.ui:runAnimation("Action1",1)
    self.moveOutState = true
    self.ui:setAnimationCallBack("Action1", TFANIMATION_END, function()
        self.moveOutState = false
        AlertManager:close()
        end)
end

function CustomRoleSelect:registerEvents()
	self.btn_shousuo.logic = self
	self.ui.logic = self
    self.ui:setTouchEnabled(true)
	self.btn_shousuo:addMEListener(TFWIDGET_CLICK, audioClickfun(self.closeBtnClick))
	self.ui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.closeBtnClick))
	self.super.registerEvents(self)
end

function CustomRoleSelect:removeEvents()
	self.isFirst = true
    self.super.removeEvents(self)
end

function CustomRoleSelect:dispose()

	self.super.dispose(self)
end


return CustomRoleSelect