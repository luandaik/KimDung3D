-- @Author: crb
-- @Date:   2018-05-16 17:55:38
-- @Last Modified by:   cc
-- @Last Modified time: 2018-05-22 14:33:42

local Activity_RechargeConsumeRank = class("Activity_RechargeConsumeRank", BaseLayer)


local path_reward = {
    [1] = "Panel_1stjiangli",
    [2] = "Panel_2edjiangli",
    [3] = "Panel_3rdjiangli"
}

local tActivityTips = {
	[OperationActivitiesManager.Type_ChongzhiRank] = {
		localizable.activity_recharge_rank_tips1,
		localizable.GameActivitiesManager_leijichongzhi,
	},
	[OperationActivitiesManager.Type_XiaofeiRank] = {
		localizable.activity_recharge_rank_tips2,
		localizable.GameActivitiesManager_leijixiaofei,	
	}
}

function Activity_RechargeConsumeRank:ctor( data )
	self.super.ctor(self)

	self.activityId = data

	self:init("lua.uiconfig_mango_new.operatingactivities.ChongZhiHuoDong")
end

function Activity_RechargeConsumeRank:initUI( ui )
	self.super.initUI(self, ui)

	self.tActivityInfo = OperationActivitiesManager:getActivityInfo( self.activityId )
	self.activityType = self.tActivityInfo.type

	TFDirector:getChildByPath(ui, "txt_ljcz"):setText( tActivityTips[self.activityType][1] )
	TFDirector:getChildByPath(ui, "txt_paiming"):setText( localizable.activity_recharge_rank_tips3 )
	TFDirector:getChildByPath(ui, "txt_panel_name"):setVisible(false)

	self.Panel_xuanchuanzuo = TFDirector:getChildByPath(ui, "Panel_xuanchuanzuo")
	self.Panel_xuanchuanyou = TFDirector:getChildByPath(ui, "Panel_xuanchuanyou")
	self.text_myScore = TFDirector:getChildByPath(TFDirector:getChildByPath(ui, "img_dengjibg"), "txt_dengji")
	self.text_myRank = TFDirector:getChildByPath(TFDirector:getChildByPath(ui, "img_paimingbg"), "txt_dengji")

	self.txt_time = TFDirector:getChildByPath(ui, "txt_time")

	self.Panel_xuanchuanyou.txt_title   = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "txt_title")
	self.Panel_xuanchuanyou.bg_icon     = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "bg_icon")
	self.Panel_xuanchuanyou.img_icon    = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "img_icon")
	self.Panel_xuanchuanyou.txt_number1 = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "txt_number1")
	self.Panel_xuanchuanyou.txt_number2 = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "txt_number2")
	self.Panel_xuanchuanyou.txt_num     = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "txt_num")
    self.btn_lingqu = TFDirector:getChildByPath(self.Panel_xuanchuanyou, "btn_lingqu")

	self.panel_good_reward = {}
    for i = 1, 3 do
        self.panel_good_reward[i] = TFDirector:getChildByPath(self.Panel_xuanchuanzuo, path_reward[i]) 
    end

    self.panel_cell = TFDirector:getChildByPath(ui, "img_123jiangli")
    self.panel_cell:retain()
    self.panel_cell:removeFromParent()

    self.Panel_bg = TFDirector:getChildByPath(ui, "Panel_cell")

	self:showActivityInfo()
end

function Activity_RechargeConsumeRank:registerEvents(  )
	self.updateRechargeConsumeCallBack = function (  )
		self:showGuaranteeAward()
	end

	TFDirector:addMEGlobalListener(OperationActivitiesManager.UPDATERERECHARGECONSUME, self.updateRechargeConsumeCallBack)
end

function Activity_RechargeConsumeRank:removeEvents(  )
	TFDirector:removeMEGlobalListener(OperationActivitiesManager.UPDATERERECHARGECONSUME, self.updateRechargeConsumeCallBack)

	if self.nRemainingTimerID then
		TFDirector:removeTimer(self.nRemainingTimerID)
		self.nRemainingTimerID = nil
	end
end

function Activity_RechargeConsumeRank:showActivityInfo(  )
	if not self.tActivityInfo.nMyScore then
		print("无活动进度，无法刷新显示")
		return
	end

	self.rankData = self.tActivityInfo.activityReward.map

	self.text_myScore:setText(self.tActivityInfo.nMyScore)
	self.text_myRank:setText(self.tActivityInfo.nMyRank)

	-- 前三名特殊奖励
	self:showTop3ExtraReward()

	-- 排名信息
	self:showRankView()

	-- 保底奖励
	self:showGuaranteeAward()

	-- 活动倒计时
	self:refreshTime(self.tActivityInfo.endTime)

	if self.nRemainingTimerID then
		TFDirector:removeTimer(self.nRemainingTimerID)
		self.nRemainingTimerID = nil
	end

	self.nRemainingTimerID = TFDirector:addTimer(1000, -1, nil, function (  )
		self:refreshTime(self.tActivityInfo.endTime)
	end)
end

function Activity_RechargeConsumeRank:showRankView(  )
    if not self.tableView then
        local tableView =  TFTableView:create()
        tableView:setTableViewSize(self.Panel_bg:getContentSize())
        tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
        tableView:setVerticalFillOrder(0)
        self.tableView = tableView
         
        self.tableView.logic = self
        tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
        tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
        tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
        self.Panel_bg:addChild(tableView)
        tableView:setPosition(ccp(0, 0))
    end
    self.tableView:reloadData()
end

function Activity_RechargeConsumeRank.cellSizeForTable(table, idx)
    return 86, 600
end

function Activity_RechargeConsumeRank.tableCellAtIndex(table, idx)
    local self = table.logic
    local cell = table:dequeueCell()
    if nil == cell then
        table.cells = table.cells or {}
        cell = TFTableViewCell:create()
        table.cells[cell] = true

        local node = self.panel_cell:clone()
        node:setPosition(ccp(300, 43))
        node:setVisible(true)
        cell.node = node
        cell:addChild(node);
    end
    if idx == #self.rankData - 1 then
        cell.node:setPosition(ccp(300, 43))
    else
        cell.node:setPosition(ccp(300, 43))
    end
    self:showNode(cell.node, idx + 1)
    return cell
end

function Activity_RechargeConsumeRank.numberOfCellsInTableView(table)
    local self = table.logic
    return #self.rankData - 1 or 0
end

function Activity_RechargeConsumeRank:showNode(widget, idx)
    local rankData = self.rankData[idx]
    local data_reward = rankData.reward.m_list

    -- print("showNode:", rankData)

    local img_tubiao = TFDirector:getChildByPath(widget, 'img_tubiao')
    local txt_fenduan = TFDirector:getChildByPath(widget, 'txt_fenduan')
    local Panel_jiangliicon = TFDirector:getChildByPath(widget, 'Panel_jiangliicon')
    local bg_touxiang = TFDirector:getChildByPath(widget, 'bg_touxiang')
    local img_head = TFDirector:getChildByPath(bg_touxiang, 'img_head')
    local txt_playername = TFDirector:getChildByPath(widget, "txt_playername")
    local txt_mingci = TFDirector:getChildByPath(widget, "txt_mingci")
    local txt_shuoming = TFDirector:getChildByPath(widget, "txt_shuoming")
    local txt_xiangxi = TFDirector:getChildByPath(widget, "txt_xiangxi")

    local icon_tab = {}
    for i = 1, 3 do
        icon_tab[i] = TFDirector:getChildByPath(Panel_jiangliicon, "bg_icon" .. i)
        if i <= #data_reward and data_reward[i] then
            icon_tab[i]:setTextureNormal( ( GetColorIconByQuality_118( data_reward[i].quality ) ) )
            icon_tab[i]:setVisible(true)
            Public:loadIconNode(icon_tab[i], data_reward[i], true, true)
            icon_tab[i]:setTouchEnabled(true)
            icon_tab[i]:addMEListener(TFWIDGET_CLICK,
                audioClickfun(function()
                    Public:ShowItemTipLayer(data_reward[i].itemid, data_reward[i].type)
                end)
            )
        else
            icon_tab[i]:setVisible(false)
        end
    end

    local strPath = "ui_new/leaderboard/no1.png"
    txt_playername:setVisible(true)
    txt_playername:setText(rankData.userName)

    if idx <= 3 then
        img_tubiao:setVisible(true)
        txt_fenduan:setVisible(false)
        bg_touxiang:setVisible(true)

        local roleData = RoleData:objectByID( tonumber(rankData.nHeadId) )
        if roleData then
            img_head:setTexture( roleData:getIconPath() )
            img_head:setFlipX(true)
            Public:addFrameImg(bg_touxiang, GetColorRoadIconByQualitySmall(roleData.quality))
        end
        txt_playername:setPositionX(91)
        txt_mingci:setVisible(false)
        txt_shuoming:setVisible(false)
        txt_xiangxi:setVisible(true)
        txt_xiangxi:setText( tActivityTips[self.activityType][2] .. ":" .. rankData.curScore )

        Public:addInfoListen(img_head, true, 1, rankData.playerId)
        
        strPath = "ui_new/leaderboard/no" .. idx .. ".png"
        img_tubiao:setTexture(strPath)
    else
        img_tubiao:setVisible(false)
        txt_fenduan:setVisible(true)
        bg_touxiang:setVisible(false)
        txt_fenduan:setText( stringUtils.format( localizable.arenarewardlayer_list, rankData.minlevel, rankData.maxlevel ) )
        txt_playername:setPositionX(80)
        txt_mingci:setVisible(true)
        txt_mingci:setText( stringUtils.format( localizable.arenaplaylistlayer_list, rankData.minlevel ) )
        txt_shuoming:setVisible(true)
        txt_shuoming:setText( tActivityTips[self.activityType][2] .. ":" .. rankData.firstScore .. "-" .. rankData.secondScore )
        txt_xiangxi:setVisible(false)
    end
end

-- 显示前三名额外奖励
function Activity_RechargeConsumeRank:showTop3ExtraReward()
    for i = 1, 3 do
        local node = self.panel_good_reward[i]
        local panel_card = TFDirector:getChildByPath(node, "panel_card")
        local img_zhuangbei = TFDirector:getChildByPath(node, "img_zhuangbei")
        -- print("showTop3ExtraReward:", i, node, img_zhuangbei)
        
        local data = self.rankData[i].extraReward.m_list[1]
        -- print("self.rankData.activityReward", data)
        if data then
            local tType = data.type
            if tType == EnumDropType.GOODS then
                local item = ItemData:objectByID(data.itemid)
                if item.type == 1 then
                    img_zhuangbei:setVisible(true)
                    panel_card:setVisible(false)

                    self:refreshIcon1(img_zhuangbei, item, data)
                else
                    img_zhuangbei:setVisible(false)
                    panel_card:setVisible(true) 

                    self:refreshIcon2(panel_card, data)
                end
            else
                img_zhuangbei:setVisible(false)
                panel_card:setVisible(true)

                self:refreshIcon2(panel_card, data)
            end
        else
            img_zhuangbei:setVisible(false)
            panel_card:setVisible(false)
        end
    end
end

function Activity_RechargeConsumeRank:refreshIcon1(node, item, data)
    local txt_name = TFDirector:getChildByPath(node, "txt_name")
    local txt_number = TFDirector:getChildByPath(node, "txt_number")
    txt_number:setVisible(true)
    txt_number:setText("X" .. data.number)
    --txt_name:setText(item.name)
    txt_name:setVisible(false)
    node:setTexture(item:GetPath())

    node:setTouchEnabled(true)
    node:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            Public:ShowItemTipLayer(data.itemid, data.type)
        end)
    )
end

function Activity_RechargeConsumeRank:refreshIcon2(node, item)
    local txt_name = TFDirector:getChildByPath(node, "txt_name")
    local img_pinzhiditu = TFDirector:getChildByPath(node, "img_pinzhiditu")
    local img_touxiang = TFDirector:getChildByPath(node, "img_touxiang")
    local txt_number = TFDirector:getChildByPath(node, "txt_number")
    txt_number:setVisible(true)
    txt_number:setText("X" .. item.number)
    --txt_name:setText(item.name)
    txt_name:setVisible(false)
    img_pinzhiditu:setTexture( GetColorKuangByQuality(item.quality) )
    img_touxiang:setTexture(item.path)

    node:setTouchEnabled(true)
    node:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            Public:ShowItemTipLayer(item.itemid, item.type)
        end)
    )
end

-- 保底奖励按钮
function Activity_RechargeConsumeRank:showGuaranteeAward()
	local rewardData = self.rankData[#self.rankData].reward.m_list[1]
	-- print("rewardData", self.rankData[#self.rankData], self.tActivityInfo.guaranteeAwardState)

    self.Panel_xuanchuanyou.txt_title:setText( rewardData.name )
    self.Panel_xuanchuanyou.bg_icon:setTextureNormal( GetColorIconByQuality_118( rewardData.quality ) )
    self.Panel_xuanchuanyou.txt_num:setText( "X" .. rewardData.number )
    --self.Panel_xuanchuanyou.txt_number:setText( string.format("(%d/%d)", curStep, num) )
    self.Panel_xuanchuanyou.txt_number1:setText(localizable.UITips)
    self.Panel_xuanchuanyou.txt_number1:setPositionX(155)
    -- self.Panel_xuanchuanyou.txt_number1:setVisible(false)
    self.Panel_xuanchuanyou.txt_number2:setVisible(false)
    -- if curStep < num then
    --     self.Panel_xuanchuanyou.txt_number1:setColor( ccc3(255, 0, 0) )
    -- else
    --     self.Panel_xuanchuanyou.txt_number1:setColor( ccc3(255, 255, 255) )
    -- end 

    self.Panel_xuanchuanyou.img_icon:setTexture( rewardData.path )
    Public:addPieceImg(self.Panel_xuanchuanyou.img_icon, rewardData)

    self.Panel_xuanchuanyou.bg_icon:setTouchEnabled(true)
    self.Panel_xuanchuanyou.bg_icon:addMEListener(TFWIDGET_CLICK,
        audioClickfun(function()
            Public:ShowItemTipLayer(rewardData.itemid, rewardData.type)
        end)
    )
    if self.tActivityInfo.guaranteeAwardState == 1 then
        self.btn_lingqu:setGrayEnabled(false)
        self.btn_lingqu:setTouchEnabled(true)
        self.btn_lingqu:addMEListener(TFWIDGET_CLICK, function (  )
        	TFDirector:send(c2s.DRAW_ACTIVITY_REWARD, {self.tActivityInfo.id})
        end)

        CommonManager:setRedPoint(self.btn_lingqu, true, "isHaveSevenRankCanGet", ccp(0, 0))
    else
        self.btn_lingqu:setGrayEnabled(true)
        self.btn_lingqu:setTouchEnabled(false)
        CommonManager:setRedPoint(self.btn_lingqu, false, "isHaveSevenRankCanGet", ccp(0, 0))
    end

end

function Activity_RechargeConsumeRank:refreshTime( nEndTime )
	local nRemainingTime = nEndTime - GetCorrectTime()

	local d = math.floor( nRemainingTime / 3600 / 24 )
	local h = math.floor( nRemainingTime / 3600 ) - d * 24
	local m = math.floor( nRemainingTime % 3600 / 60 )
	local s = math.floor( nRemainingTime % 60 )

	local str = ""
	if d > 0 then
		str = str .. tostring(d) .. "天"
	end

	if d > 0 or h > 0 then
		str = str .. tostring(h) .. "小时"
	end

	if d > 0 or h > 0 or m > 0 then
		str = str .. tostring(m) .. "分"
	end


	self.txt_time:setText( str .. s .. "秒" )
end

function Activity_RechargeConsumeRank:removeUI()
    if self.panel_cell then
		self.panel_cell:release()
		self.panel_cell = nil
    end
    self.super.removeUI(self)
end

function Activity_RechargeConsumeRank:dispose()
    self.super.dispose(self)
end

return Activity_RechargeConsumeRank