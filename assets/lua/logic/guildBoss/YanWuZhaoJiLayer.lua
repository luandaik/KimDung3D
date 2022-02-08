-- client side YanWuZhaoJi.lua
--[[
 * @Description: Description
 ]]
-- script writer luoconghai
-- creation time 2017-4-12


local YanWuZhaoJi = class("YanWuZhaoJi", BaseLayer)
function YanWuZhaoJi:ctor(equipid)
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.faction.YanWuZhaoJi")

end

function YanWuZhaoJi:initUI(ui)
    self.super.initUI(self,ui)
    self.panel_zhenlie={}
    local indexList = {2,3,4,1}
    for i=1,4 do 
    	local panel_zhenlie       = TFDirector:getChildByPath(ui, 'panel_zhenlie'..i)
        self.panel_zhenlie[i]     = TFDirector:getChildByPath(panel_zhenlie, 'Panel_role')
    	local txt_desc            = TFDirector:getChildByPath(panel_zhenlie, 'txt_jipo')
        if indexList[i] == 1 then
            txt_desc:setText("")
        else
            local bossInfo = GuildBossManager:getBossInfoByType(indexList[i])
            local buffData = GuildBossManager:getBuffDataByid(bossInfo.bossBuff)
            if buffData then
                txt_desc:setText(buffData.desc)
            else
                txt_desc:setText("")
            end
        end
    end
    self.btn_close          = TFDirector:getChildByPath(ui, 'btn_close')
    self.btn_bianji         = TFDirector:getChildByPath(ui, 'btn_bianji')
    self.btn_bianji.logic=self
    self.btn_zzjg           = TFDirector:getChildByPath(ui, 'btn_zzjg')--助战
    self.txt_lengque        = TFDirector:getChildByPath(self.btn_zzjg, 'txt_lengque')--助战
    self.txt_tips           = TFDirector:getChildByPath(ui, 'txt_tips')

    self.panel_role_cell=TFDirector:getChildByPath(self.panel_zhenlie[1], 'panel_role_cell' )
    self.panel_role_cell:removeFromParent()
    self.panel_role_cell:retain()

	self.allTableView={}
    
end

function YanWuZhaoJi:registerEvents(ui)
    self.super.registerEvents(self)
    self.btn_bianji:addMEListener(TFWIDGET_CLICK, audioClickfun(self.btn_bianjiClickHandle),1);
    self.btn_zzjg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onZZJGClickHandle),1);
    self.btn_zzjg.logic = self
    ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)

    self.recriveBossHelpList=function(event)
	    self:refreshUI()
	end
	TFDirector:addMEGlobalListener(GuildBossManager.RECEIVE_BOSS_HELP_LIST ,self.recriveBossHelpList)
    
end

function YanWuZhaoJi:removeEvents()
    self.super.removeEvents(self)
    TFDirector:removeMEGlobalListener(GuildBossManager.RECEIVE_BOSS_HELP_LIST ,self.recriveBossHelpList)
end

function YanWuZhaoJi:dispose()
    self.super.dispose(self)
end

function YanWuZhaoJi:removeUI()
    if self.updateTimerID ~= nil then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    if self.panel_role_cell then
        self.panel_role_cell:release()
        self.panel_role_cell = nil
    end
end

function YanWuZhaoJi:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function YanWuZhaoJi:loadData()
    self:refreshUI()
end

function YanWuZhaoJi:refreshColdTime()
    local mainInfo = GuildBossManager:getMianInfo()
    local timeNow = MainPlayer:getNowtime()
    local coldTime = ConstantData:objectByID("GuildBoss.Gangsta.CoolDownTime").value
    local totalSec = mainInfo.helpBattleTime + coldTime - timeNow
    if totalSec <= 0 then
        self.txt_lengque:setText("")
    else
        local day = math.floor(totalSec/(24*3600))
        totalSec = totalSec - day * 24 * 3600
        local hour = math.floor(totalSec/3600)
        totalSec = totalSec - hour * 3600
        local min = math.floor(totalSec/60)
        local sec = math.floor(totalSec - min * 60)
        local strList = ""
        if day > 0 then
            strList = day..localizable.time_day_txt
        end
        if hour > 0 then
            strList = strList .. hour .. localizable.time_hour_txt
        end
        if min > 0 then
            strList = strList .. min .. localizable.time_minute_txt
        end
        if sec <= 0 then 
            sec = 0
        end
        strList = strList..sec..localizable.time_second_txt
        self.txt_lengque:setText(strList .. localizable.GuildBoss_zhaoji_tip)
    end
end

function YanWuZhaoJi:refreshUI()
    self.bossHelpInfo=GuildBossManager:getBossHelpInfo()
	self:refreshTableView()
    self:refreshColdTime()
    if self.updateTimerID == nil then
        self.updateTimerID = TFDirector:addTimer(1000, -1, nil, 
            function()
                self:refreshColdTime()
            end)
    end
end

function YanWuZhaoJi:refreshTableView()
    local indexList = {2,3,4,1}
	for i,v in ipairs(self.panel_zhenlie) do

	    if self.allTableView[i] == nil then
	        local  tableView =  TFTableView:create()

	        self.allTableView[i] = tableView
	        tableView:setTableViewSize(self.panel_zhenlie[i]:getContentSize())
	        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
	        tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
	        tableView.index=indexList[i]

	        self.allTableView[i]:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
	        self.allTableView[i]:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
	        self.allTableView[i]:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView,self))
	        self.panel_zhenlie[i]:addChild(tableView)
	    end
	    self.allTableView[i]:reloadData()
	end
end


function YanWuZhaoJi:cellSizeForTable(table,idx)
    return 78,215
end

function YanWuZhaoJi:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        local node = self.panel_role_cell:clone()
        node:setVisible(true)
        node:setPositionY(0)
        cell:addChild(node,1)
        cell.panel = node
    end
    self:setCellInfo(cell,idx,table.index)
    return cell
end

function YanWuZhaoJi:numberOfCellsInTableView(table)
    -- if self.bossHelpInfo[table.index]==nil then
    --     self.bossHelpInfo[table.index]={}
    -- end
    -- local num = #(self.bossHelpInfo[table.index])+1<=30 and #(self.bossHelpInfo[table.index])+1 or 30
    local num = 30
    if num < 0 then num = 0 end
    return num
end

function YanWuZhaoJi:setCellInfo(cell,idx,tableViewIndex)
    if self.bossHelpInfo[tableViewIndex] == nil then
    	self.bossHelpInfo[tableViewIndex] = {}
    end
    local roleNum = #self.bossHelpInfo[tableViewIndex]
    local panel = cell.panel
    local img_putong=TFDirector:getChildByPath(panel, 'img_putong')

    local btn_jia=TFDirector:getChildByPath(panel, 'btn_jia')
    btn_jia:setTouchEnabled(false)
    panel.tableViewIndex=tableViewIndex
    panel.logic=self
    panel:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onbtn_jiaClickHandle),1);

    local infoData = self.bossHelpInfo[tableViewIndex][idx]
    if infoData then
        img_putong:setVisible(true)
        btn_jia:setVisible(false)
        local img_touxiang=TFDirector:getChildByPath(img_putong, 'img_touxiang')
        local RoleIcon = RoleData:objectByID(infoData.useCoin) 
        if RoleIcon == nil then
            RoleIcon = RoleData:objectByID(77)
        end
        img_touxiang:setTexture(RoleIcon:getIconPath())
        Public:addFrameImg(img_touxiang,infoData.frameId)    

        TFDirector:getChildByPath(img_putong, 'txt_name'):setString(infoData.playerName)
        TFDirector:getChildByPath(img_putong, 'txt_num'):setString(infoData.power)
    else
        img_putong:setVisible(false)
        if idx == roleNum + 1 then
            btn_jia:setVisible(true)
        else
            btn_jia:setVisible(false)
        end
    end
end

function YanWuZhaoJi.onbtn_jiaClickHandle(sender)
	local self=sender.logic
    GuildBossManager:openYanWuEditorLayer(sender.tableViewIndex)
end

function YanWuZhaoJi.btn_bianjiClickHandle(sender)
    sender.tableViewIndex=GuildBossManager.BossType_1
    YanWuZhaoJi.onbtn_jiaClickHandle(sender)
end

function YanWuZhaoJi.onZZJGClickHandle(sender)
	local self = sender.logic
    local mainInfo = GuildBossManager:getMianInfo()
    local timeNow = MainPlayer:getNowtime()
    --
    local limitTime = ConstantData:objectByID("GuildBoss.Gangsta.UsableTime.Limitation").value
    if limitTime > timeNow - mainInfo.openTime then
        toastMessage(localizable.GuildBoss_main_helpAttackLimit)
        return
    end
    --
    local coldTime = ConstantData:objectByID("GuildBoss.Gangsta.CoolDownTime").value
    local totalSec = mainInfo.helpBattleTime + coldTime - timeNow
    if totalSec > 0 then
        toastMessage(localizable.GuildBoss_main_helpattackcold)
        return
    end
    GuildBossManager:requireHelpAttack()
    AlertManager:closeLayer(self)
end

return YanWuZhaoJi