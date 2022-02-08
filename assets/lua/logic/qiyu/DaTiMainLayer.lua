--[[
******答题主界面*******

	-- by sjj
	-- 2018/8/2
	
]]

local DaTiMainLayer = class("DaTiMainLayer",BaseLayer)

local Type_answerNormal = 1
local Type_answerSelect = 2
-- local Type_answerTrue = 3


local totalNum = ConstantData:objectByID("Datinum").value

function DaTiMainLayer:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.qiyu.JiangHuYaJiMain")
	if (DaTiManager:getStartOrClose()) then
		DaTiManager:sendDaTiInfo()
	end
end

function DaTiMainLayer:initUI( ui )
	self.super.initUI(self, ui)

	self.btn_help = TFDirector:getChildByPath(ui, 'btn_guizhe')
	self.btn_close = TFDirector:getChildByPath(ui, 'btn_return')
	self.btn_jiangli = TFDirector:getChildByPath(ui, 'btn_jiangli')

	-- 初始界面
	self.panel_wkq = TFDirector:getChildByPath(ui, 'panel_wkq')
	self.btn_startDaTi = TFDirector:getChildByPath(self.panel_wkq, 'btn_ks')

	-- 答题界面
	self.panel_ykq = TFDirector:getChildByPath(ui, 'panel_ykq')
	self.txt_currTrue = TFDirector:getChildByPath(TFDirector:getChildByPath(self.panel_ykq, 'txt_ydd'), 'txt_num')
	self.txt_currTime = TFDirector:getChildByPath(TFDirector:getChildByPath(self.panel_ykq, 'txt_ys'), 'txt_num')
	self.txt_currDaTiNum = TFDirector:getChildByPath(TFDirector:getChildByPath(self.panel_ykq, 'txt_timu'), 'txt_num') -- 格式  当前题目/总题目
	self.txt_tiMu = TFDirector:getChildByPath(self.panel_ykq, 'txt_wenti')

	self.panel_select = {}
	for i = 1 , 3 do 
		self.panel_select[i] = {}
		local btn_bg = TFDirector:getChildByPath(self.panel_ykq, 'img_daan'..i)
		self.panel_select[i].btn_bg = btn_bg
		self.panel_select[i].txt_select = TFDirector:getChildByPath(btn_bg, 'txt_da')
		self.panel_select[i].img_dui = TFDirector:getChildByPath(btn_bg, 'img_zq')
		self.panel_select[i].img_cuo = TFDirector:getChildByPath(btn_bg, 'img_x')
	end

	self.btn_cgjl = TFDirector:getChildByPath(ui, 'btn_cgjl')
	self.btn_cgjl.type = 1
	self.btn_tsjl = TFDirector:getChildByPath(ui, 'btn_ewjl')
	self.btn_tsjl.type = 2
	self.btn_paiMingJiangLi = TFDirector:getChildByPath(ui, 'btn_jiangli')

	self.img_answerPath = {"ui_new/qiyu/jianghuyaji/img_tiao1.png", "ui_new/qiyu/jianghuyaji/img_tiao2.png", "ui_new/qiyu/jianghuyaji/img_tiao3.png"}
	
	-- 排行榜
	self.btn_jifen = TFDirector:getChildByPath(ui, 'btn_jifen')
	self.paihangshow = 0
	self.Panel_Paihang = TFDirector:getChildByPath(ui, "Panel_Paihang")
	self.btn_shuaxin = TFDirector:getChildByPath(self.Panel_Paihang, "btn_shuaxin")
	self.panel_gun = TFDirector:getChildByPath(self.Panel_Paihang, "panel_gun")
	self.txt_myRank = TFDirector:getChildByPath(TFDirector:getChildByPath(self.Panel_Paihang, 'txt_paiming'), 'txt_num')
	self.txt_myTrueNum = TFDirector:getChildByPath(TFDirector:getChildByPath(self.Panel_Paihang, 'txt_dadui'), 'txt_num')
	self.txt_myTime = TFDirector:getChildByPath(TFDirector:getChildByPath(self.Panel_Paihang, 'txt_yongshi'), 'txt_num')
	self.panel_rank = TFDirector:getChildByPath(self.Panel_Paihang, "panel_rank")
	self.panel_rank:setVisible(false)
    self.panel_rank:removeFromParent(true)
    self.panel_rank:retain()


	self:refreshUI()
end

function DaTiMainLayer:onShow()
	self.super.onShow(self)
	
end

function DaTiMainLayer:registerEvents()
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close,AlertManager.TWEEN_NONE)
	self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onHelpClick))

	self.btn_startDaTi:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onStartDaTiClick))
	self.btn_jifen:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onOpenPaiHangClick))
	self.btn_shuaxin:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onSendRinkInfo))
	self.btn_cgjl:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onJiangLiYuLanClick))
	self.btn_tsjl:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onJiangLiYuLanClick))
	self.btn_jiangli:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onPaiHangJiangLiClick))

	for i = 1 , 3 do 
		self.panel_select[i].btn_bg:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, self.onAnswerSelectClick))
	end


    --排行信息
	self.onRinkCallBack = function(event)
		self:refreshRinkInfo()
	end
	TFDirector:addMEGlobalListener(DaTiManager.rinkListData, self.onRinkCallBack)

	--刷新界面
	self.onCompleteCallBack = function(event)
		self:refreshUI()
	end
	TFDirector:addMEGlobalListener(DaTiManager.daTiCompleteInfo, self.onCompleteCallBack)

	--开始答题
	self.onStartCallBack = function(event)
		self:refreshUI()
		if (self.updateEndTime == nil) then
			self.updateEndTime = TFDirector:addTimer(1000, -1, nil,
		        function()
		            self:refreshTimeUI()
		    end)
		end
	end
	TFDirector:addMEGlobalListener(DaTiManager.startDaTi, self.onStartCallBack)


	--获取正确答案
	self.isTrueAnswerCallBack = function(event)
		local trueAnswer = event.data[1][1]	

		for i=1,3 do
			if (self.lastAnswerSelectId ~= trueAnswer and self.panel_select[i].btn_bg.answerId == self.lastAnswerSelectId) then
				self.panel_select[i].img_cuo:setVisible(true)
			end

			if (self.panel_select[i].btn_bg.answerId == trueAnswer) then
				self.panel_select[i].img_dui:setVisible(true)
			end
		end
		
		if (self.lastAnswerSelectId == trueAnswer) then
			self.currTrueNum = self.currTrueNum + 1
		end

		if (self.currTiMuNum == totalNum) then
			self.endShowTime = TFDirector:addTimer(2000, 1, nil,
		        function()
		        	-- 显示答题成绩
		            self:openResultLayer()
		    end)
		    return
		end
		self.currTiMuNum = self.currTiMuNum + 1
		-- 下一题
		self.endTime = TFDirector:addTimer(2000, 1, nil,
	        function()
	            self:refreshDaTiPanel()
	            TFDirector:removeTimer(self.endTime)
		        self.endTime = nil
	    end)
	end
	TFDirector:addMEGlobalListener(DaTiManager.daTiTrueAnswer, self.isTrueAnswerCallBack)

	--记录开始时间 --状态（0：未开始答题  1：开始）
	if (DaTiManager.starState == 1) then
		if (self.updateEndTime == nil) then
			self.updateEndTime = TFDirector:addTimer(1000, -1, nil,
		        function()
		            self:refreshTimeUI()
		    end)
		end
	end
end

function DaTiMainLayer:removeEvents()
	self.super.removeEvents(self)

	TFDirector:removeMEGlobalListener(DaTiManager.daTiTrueAnswer)
	self.isTrueAnswerCallBack = nil
	TFDirector:removeMEGlobalListener(DaTiManager.startDaTi)
	self.onStartCallBack = nil
	TFDirector:removeMEGlobalListener(DaTiManager.rinkListData)
	self.onRinkCallBack = nil
	TFDirector:removeMEGlobalListener(DaTiManager.daTiCompleteInfo)
	self.onCompleteCallBack = nil

	if (self.updateEndTime) then
        TFDirector:removeTimer(self.updateEndTime)
        self.updateEndTime = nil
    end
    if (self.endTime) then
        TFDirector:removeTimer(self.endTime)
        self.endTime = nil
    end
    if (self.endShowTime) then
		TFDirector:removeTimer(self.endShowTime)
		self.endShowTime = nil
	end
end

function DaTiMainLayer:refreshUI()
	-- 状态（0：未开始答题  1：开始  2:已答完)
	local currStartState = DaTiManager:getDaTiState()
	if (currStartState == 0 or currStartState == 2 ) then
		self.panel_wkq:setVisible(true)
		self.panel_ykq:setVisible(false)
		if (currStartState == 2) then
			self.btn_startDaTi:setTouchEnabled(false)
			self.btn_startDaTi:setGrayEnabled(true)
		end
	else
		self.panel_wkq:setVisible(false)
		self.panel_ykq:setVisible(true)
		local daTiInfo = DaTiManager:getMyDaTiData()
		self.currTrueNum = daTiInfo.currTrueNum
		self.currTiMuNum = daTiInfo.currNum
		self.startTime = daTiInfo.startTime
		self:refreshDaTiPanel()
	end
end

-- 刷新答题界面
function DaTiMainLayer:refreshDaTiPanel()
	
	self.txt_currTrue:setText(stringUtils.format(localizable.DaTi_tip1, self.currTrueNum))
	self.txt_currDaTiNum:setText(self.currTiMuNum.."/"..totalNum)

	local currTiMuInfo = DaTiManager:getCurrSubjectByIdx( self.currTiMuNum )
	self.tiMuId = currTiMuInfo.tiMuId
	self.txt_tiMu:setText(currTiMuInfo.tiMu)
	for i = 1, 3 do 
		self.panel_select[i].btn_bg:setTouchEnabled(true)
		self.panel_select[i].btn_bg:setTextureNormal(self.img_answerPath[Type_answerNormal])
		self.panel_select[i].img_dui:setVisible(false)
		self.panel_select[i].img_cuo:setVisible(false)
		self.panel_select[i].txt_select:setText(currTiMuInfo.answerOption[i].answerStr)
		self.panel_select[i].btn_bg.answerId = currTiMuInfo.answerOption[i].id
		self.panel_select[i].btn_bg.tiMuId = currTiMuInfo.tiMuId
		self.panel_select[i].btn_bg.id = i
	end
end

function DaTiMainLayer:onHelpClick()
    CommonManager:showRuleLyaer( 'jianghuyaji' )
end
-- 开始答题
function DaTiMainLayer:onStartDaTiClick()
	-- 判断等级
	local teamLev   = MainPlayer:getLevel()
    local openLevel = FunctionOpenConfigure:getOpenLevel(910)	
    if teamLev < openLevel then
    	toastMessage(stringUtils.format(localizable.common_function_openlevel, openLevel))
		return
    end

    -- 判断时间和服务器开关
	if (not DaTiManager:getStartOrClose()) then
		toastMessage(localizable.DaTi_tip2)
		return
	end

	CommonManager:showOperateSureLayer(function()
			DaTiManager:sendStarDaTi()
    	end,
    	nil,
    	{   
    	    title = localizable.TreasureMain_tips1,
    	    
    	    msg = stringUtils.format(localizable.Dati_tip3)
    	})

end
-- 答案选择
function DaTiMainLayer:onAnswerSelectClick( btn )
	for i = 1, 3 do 
		self.panel_select[i].btn_bg:setTouchEnabled(false)
	end
	
	self.lastAnswerIndex = btn.id
	self.lastAnswerSelectId = btn.answerId
	self.panel_select[btn.id].btn_bg:setTextureNormal(self.img_answerPath[Type_answerSelect])
	
	DaTiManager:sendDaTiAnswerInfo(btn.tiMuId, btn.answerId)
end

-- 答题计时
function DaTiMainLayer:refreshTimeUI()
	
	local totalTime = ConstantData:objectByID("Datitime").value

	local currTime = MainPlayer:getNowtime() - self.startTime

	if (currTime < totalTime) then
		local min = math.floor(currTime / 60 % 60)
	    local sec = math.floor(currTime % 60)
		self.txt_currTime:setText(stringUtils.format(localizable.common_time_9, min, sec))

	else
		
		TFDirector:removeTimer(self.updateEndTime)
        self.updateEndTime = nil
        DaTiManager:sendEndDaTi()
	end
end

--打开答题成绩界面
function DaTiMainLayer:openResultLayer( )
	local resultLayer = createUIByLuaNew("lua.uiconfig_mango_new.qiyu.JiangHuYaJiSure")
	resultLayer:setPosition(ccp(0, 0))
	self.ui:addChild(resultLayer)
	local txt_shijian = TFDirector:getChildByPath(TFDirector:getChildByPath(resultLayer, 'txt_ys'), 'txt_num')
	local txt_trueNum = TFDirector:getChildByPath(TFDirector:getChildByPath(resultLayer, 'txt_dadui'), 'txt_num')

	txt_trueNum:setText(DaTiManager.trueNum)
	local min = math.floor(DaTiManager.endTakeTime / 60 % 60)
	local sec = math.floor(DaTiManager.endTakeTime % 60) 

	txt_shijian:setText(stringUtils.format(localizable.common_time_9, min, sec))

	local btn_quding = TFDirector:getChildByPath(resultLayer, 'btn_ok')

	local function refreshCallBack()
        self:refreshUI()
        self.ui:removeChild(resultLayer)
    end

	btn_quding:addMEListener(TFWIDGET_CLICK, audioClickfunWithDelegate(self, refreshCallBack))
	if (self.endShowTime) then
		TFDirector:removeTimer(self.endShowTime)
		self.endShowTime = nil
	end
	if (self.updateEndTime) then
		TFDirector:removeTimer(self.updateEndTime)
        self.updateEndTime = nil
    end
end

--打开排行榜
function DaTiMainLayer:onOpenPaiHangClick()
    
    self.btn_jifen:setTouchEnabled(false)
    local layer = self.Panel_Paihang
    if self.paihangshow == 0 then
        -- 动画
        local designsize = CCDirector:sharedDirector():getOpenGLView():getDesignResolutionSize()
        -- tox = GameConfig.WS.width
        -- toy = 0
        layer:setPosition(ccp(GameConfig.WS.width -8 , 0))
        local tween2 = 
        {
            target = layer,
            {   
                -- ease = {type=TFEaseType.EASE_IN_OUT, rate=5},
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3}, --由慢到快
                duration = 0.3,
                x = GameConfig.WS.width - 238,
                y = 0,
                onComplete = function ()  
                    self.paihangshow = 1   
                    self.btn_jifen:setTouchEnabled(true) 
                end,
            },

        }
        
        TFDirector:toTween(tween2)
        self:onSendRinkInfo()
    else
        -- 动画
        local designsize = CCDirector:sharedDirector():getOpenGLView():getDesignResolutionSize()
        tox = GameConfig.WS.width -8
        toy = 0
        layer:setPosition(ccp(GameConfig.WS.width -238, 0))
        local tween2 = 
        {
            target = layer,
            {   
                -- ease = {type=TFEaseType.EASE_IN_OUT, rate=5},
                ease = {type=TFEaseType.EASE_IN_OUT, rate=5}, --由慢到快
                duration = 0.3,
                x = tox,
                y = toy,
                onComplete = function ()
                    self.paihangshow = 0 
                    self.btn_jifen:setTouchEnabled(true) 
                end,
            },

        }
        TFDirector:toTween(tween2)
    end
end

function DaTiMainLayer:onJiangLiYuLanClick(btn)
	local jiangLiType = btn.type
	local specialTi = ConstantData:objectByID("specialDati").value or 30
	if(self.currTiMuNum == specialTi) then
   		jiangLiType = 2
   	end
	local rewardList = DaTiData:getPreviewReward( self.tiMuId, jiangLiType )
	local layer =  AlertManager:addLayerByFile("lua.logic.qiyu.DaTiPaiMingJiangLiLayer", AlertManager.BLOCK_AND_GRAY_CLOSE)
  	layer:setRewardList(rewardList.m_list)
  	AlertManager:show()
end

function DaTiMainLayer:onPaiHangJiangLiClick()
	local layer =  AlertManager:addLayerByFile("lua.logic.qiyu.DaTiRankRewardListLayer", AlertManager.BLOCK_AND_GRAY_CLOSE)
    AlertManager:show()

end
function DaTiMainLayer:onSendRinkInfo()
	DaTiManager:sendDaTiRink()
end


function DaTiMainLayer:refreshRinkInfo()
	-- self.rinkInfo = 
	-- 状态（0：未开始答题  1：开始  2:已答完)
	local currStartState = DaTiManager:getDaTiState()
	self.myRankInfo = DaTiManager:getMyRank()
	--我的排名,未答完状态不显示
	if (currStartState == 2 and self.myRankInfo.rank ~= 0) then
		self.txt_myRank:setText(self.myRankInfo.rank)
		self.txt_myTrueNum:setText(self.myRankInfo.trueNum.."/"..self.myRankInfo.totalNum)
		
		local min = math.floor(self.myRankInfo.takeTime / 60 % 60)
	    local sec = math.floor(self.myRankInfo.takeTime % 60)
		self.txt_myTime:setText(stringUtils.format(localizable.common_time_9, min, sec))
	else
		self.txt_myRank:setText(localizable.houshanRank_rank)
		self.txt_myTrueNum:setText("--/--")
		self.txt_myTime:setText("00:00")
	end

	self.daTiRankList = DaTiManager:getRankInfo()
	self:refreshTableView()
end
function DaTiMainLayer:refreshTableView()
    
	if self.tableView == nil then
		self.tableView = TFTableView:create()
		self.tableView.logic = self
		self.tableView:setTableViewSize(self.panel_gun:getContentSize())	
		self.tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
		self.tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
		
        
		self.tableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable, self))
		-- self.tableView:addMEListener(TFTABLEVIEW_SCROLL, self.tableScroll);
		self.tableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex, self))
		self.tableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView, self))
		
		self.panel_gun:addChild(self.tableView)
	end
	
	self.tableView:reloadData()
	
end

function DaTiMainLayer:cellSizeForTable(table, idx)
 
	return 80,183
end

function DaTiMainLayer:tableCellAtIndex(table, idx)
	idx = idx + 1
	local cell = table:dequeueCell()
	if nil == cell then
		cell = TFTableViewCell:create()
		local node = self.panel_rank:clone()
        node:setZOrder(100)
		node:setVisible(true)
		node:setPosition(ccp(10,0))
		cell:addChild(node,1)
		cell.panel = node	
	end
	self:setCellInfo(cell,idx)
    
	return cell
end

function DaTiMainLayer:numberOfCellsInTableView(table)
	local num  = 0
	if (self.daTiRankList) then
		num = #self.daTiRankList
	end
    return num
end

function DaTiMainLayer:setCellInfo(cell,idx)
	local panel = cell.panel
 	local txt_xuhao = TFDirector:getChildByPath(panel, "txt_xuhao")
    -- self.bg_icon[idx] = bg_icon
	local txt_name = TFDirector:getChildByPath(panel, "txt_name")
	local txt_num = TFDirector:getChildByPath(TFDirector:getChildByPath(panel, "txt_dadui"), "txt_num")
	local txt_time = TFDirector:getChildByPath(TFDirector:getChildByPath(panel, "txt_yongshi"), "txt_num")
    
    local infos = self.daTiRankList[idx]

    txt_xuhao:setText(infos.rank)
    txt_name:setText(infos.name)
    txt_num:setText(infos.trueCount.."/"..infos.datiTotalCount)
    local min = math.floor(infos.takeTime / 60 % 60)
    local sec = math.floor(infos.takeTime % 60)
	txt_time:setText(stringUtils.format(localizable.common_time_9, min, sec))
end

return DaTiMainLayer