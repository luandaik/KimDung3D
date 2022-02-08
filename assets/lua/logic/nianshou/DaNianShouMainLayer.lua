--[[
******年兽主界面*******
	-- by Catcher
	-- 2018/1/15
]]

local DaNianShouMainLayer = class("DaNianShouMainLayer", BaseLayer)

function DaNianShouMainLayer:ctor(data)
    self.super.ctor(self,data)
    
    self:init("lua.uiconfig_mango_new.nianshou.DaNianShouMain")
end

function DaNianShouMainLayer:initUI(ui)
    self.super.initUI(self,ui)
    
    self.img_bg     = TFDirector:getChildByPath(ui, "img_bg")
    self.btn_return = TFDirector:getChildByPath(ui, "btn_fanhui")

    self.img_bg2     = TFDirector:getChildByPath(self.img_bg, "img_bg2")
    self.img_bg2:setTouchEnabled(true)

    self.panel_boss = TFDirector:getChildByPath(self.img_bg, "panel_nianshou")
    self.panel_boss:setVisible(false)
    self.panel_boss:removeFromParent(true)
    self.panel_boss:retain()

    self.bg_time    = TFDirector:getChildByPath(ui, "bg_time")
    self.txt_hd1    = TFDirector:getChildByPath(self.bg_time, "txt_hd1")
    self.txt_num_hd1= TFDirector:getChildByPath(self.txt_hd1, "txt_num_hd1")
    self.txt_hd2    = TFDirector:getChildByPath(self.bg_time, "txt_hd2")
    self.txt_num_hd2= TFDirector:getChildByPath(self.txt_hd2, "txt_num_hd2")
    self.img_tips   = TFDirector:getChildByPath(self.bg_time, "img_tips")

    self.btn_help   = TFDirector:getChildByPath(ui, "btn_help")
    self.img_lhfd   = TFDirector:getChildByPath(ui, "img_lhfd")

    self.panel_you  = TFDirector:getChildByPath(ui, "panel_you")
    self.img_jhy    = TFDirector:getChildByPath(self.panel_you, "img_jhy")
    self.panel_role = {}
    for i = 1, 4 do
        self.panel_role[i]  = TFDirector:getChildByPath(self.panel_you, "role_" .. i)
        self.panel_role[i].role_head    = TFDirector:getChildByPath(self.panel_role[i], "role_head")
        self.panel_role[i].txt_time     = TFDirector:getChildByPath(self.panel_role[i], "txt_time")
        self.panel_role[i]:setVisible(false)
    end

    self.panel_jinri    = TFDirector:getChildByPath(ui, "panel_jinri")
    self.img_di         = TFDirector:getChildByPath(self.panel_jinri, "img_di")
    self.txt_num = {}
    for i = 1 ,3 do
        self.txt_num[i] = TFDirector:getChildByPath(self.img_di, "txt_num" .. i)
    end

    self.img_tishi      = TFDirector:getChildByPath(ui, "img_tishi")
    self.img_tishi:setVisible(false)
    self.txt_juli       = TFDirector:getChildByPath(self.img_tishi, "txt_juli")
    self.txt_time_ns    = TFDirector:getChildByPath(self.txt_juli, "txt_time_ns")

    

    local panel_button = TFDirector:getChildByPath(ui, "panel_button")    
    self.panel_bp = {}
    for i = 1,2 do

        self.panel_bp[i] = TFDirector:getChildByPath(panel_button, "panel_bp"..i)
        self.panel_bp[i].btn = TFDirector:getChildByPath(self.panel_bp[i], "btn_bp"..i)
        self.panel_bp[i].btn.logic = self
        
        self.panel_bp[i].yy = TFDirector:getChildByPath(self.panel_bp[i], "txt_yy")
        self.panel_bp[i].jf = TFDirector:getChildByPath(self.panel_bp[i], "txt_jifen")

        TFResourceHelper:instance():addArmatureFromJsonFile("effect/ui/firecrackers.xml")
        local firecrackers = TFArmature:create("firecrackers_anim")
        local panel = TFPanel:create();
        firecrackers:setAnimationFps(GameConfig.ANIM_FPS)
        firecrackers:playByIndex(i-1, -1, -1, 1)
        firecrackers:setZOrder(0)
        panel:addChild(firecrackers)
        self.panel_bp[i]:addChild(panel)
        local position = self.panel_bp[i].btn:getPosition()
        panel:setPosition(position)
        self.panel_bp[i].effect = panel
        
    end    

    

    self.panel_xueliang    = TFDirector:getChildByPath(ui, "Panel_xueliang")
    self.img_jindubg       = TFDirector:getChildByPath(self.panel_xueliang, "img_jindubg")
    self.bar_jindu         = TFDirector:getChildByPath(self.panel_xueliang, "bar_jindu")
    self.txt_jindunumber   = TFDirector:getChildByPath(self.panel_xueliang, "txt_jindunumber")

    self.img_tishi = TFDirector:getChildByPath(ui, "img_tishi")
    self.txt_time_ns = TFDirector:getChildByPath(self.img_tishi, "txt_time_ns")
    self.img_tishi:setVisible(false)

    self.Panel_Paihang = TFDirector:getChildByPath(ui, "Panel_Paihang")
    self.btn_jifen = TFDirector:getChildByPath(ui, "btn_jifen")
    self.btn_jifen.logic = self
    self.btn_shuaxin = TFDirector:getChildByPath(self.Panel_Paihang, "btn_shuaxin")
    self.btn_shuaxin.logic = self

    self.btn_lsjl = TFDirector:getChildByPath(ui, "btn_lsjl")
    self.btn_lsjl.logic = self

    self.panel_rank = TFDirector:getChildByPath(self.Panel_Paihang, "panel_rank")
    self.panel_rank:setVisible(false)
    self.panel_rank:removeFromParent(true)
    self.panel_rank:retain()

    self.panel_gun = TFDirector:getChildByPath(self.Panel_Paihang, "panel_gun")
    local txt_paiming = TFDirector:getChildByPath(self.Panel_Paihang, "txt_paiming")
    self.txt_paiming = TFDirector:getChildByPath(txt_paiming, "txt_num")
    local txt_jifen = TFDirector:getChildByPath(self.Panel_Paihang, "txt_jifen")
    self.txt_jifen = TFDirector:getChildByPath(txt_jifen, "txt_num")

    self.btn_jlyl = TFDirector:getChildByPath(ui, "btn_jlyl")
    self.btn_jlyl.logic = self
    self.btn_phjl = TFDirector:getChildByPath(ui, "btn_phjl")
    self.btn_phjl.logic = self

    self.paimingInfo = DaNianShouManager:getPaiMingInfo() 
    self.myNianShouData = {}
    self.myNianShouList = {}

    self.BeastRefreshOtherTimes = ConstantData:getValue('MonsterNian.Others.TimeLimitation')
    self.BeastRefreshMineTimes = ConstantData:getValue('MonsterNian.Mine.RefreshTime')
    self.BeastClickCnt = ConstantData:getValue('MonsterNian.TotalHealth')
    self.RefreshTimes = ConstantData:getValue('MonsterNian.Reborn.CooldownTime')
    
    self.lastRefreshTime = DaNianShouManager:getlastRefreshTime()
    local time = math.ceil(self.lastRefreshTime/1000) + self.RefreshTimes - MainPlayer:getNowtime()
    local timeStr = FactionManager:getTimeString( time )
    if self.txt_time_ns then
        self.txt_time_ns:setText(timeStr)
    end
    self.paihangshow = 0
    self.time = 1000
    
    self.selectIndex = 1
    
    self:setNianshou();
    self:setDropMoneyUI()

    local blood = DaNianShouManager:getblood()  
    if blood <= 0 then
        self.myNianShouList[1]:setVisible(false)
    end
    local BeginTime = DaNianShouManager:getActivityBeginTime()
    
    local EndTime = DaNianShouManager:getActivityEndTime()
    local beginTimeData = GetCorrectDate("*t", BeginTime)
    local endTimeData = GetCorrectDate("*t", EndTime)

    local txt_time = stringUtils.format(localizable.Nainshou_OpenTime, beginTimeData.month,beginTimeData.day,endTimeData.month,endTimeData.day)
    txt_time = txt_time..string.format("%02d:%02d~%02d:%02d",beginTimeData.hour,beginTimeData.min,endTimeData.hour,endTimeData.min)
    self.txt_num_hd1:setText(txt_time)
    local nowTimeData = GetCorrectDate("*t", MainPlayer:getNowtime())
    self.upActivityTime = (endTimeData.hour*60 + endTimeData.min)*60 +endTimeData.sec - (nowTimeData.hour*60 + nowTimeData.min)*60 - nowTimeData.sec
    if self.upActivityTime > 0 then
        self:transformTime(self.txt_num_hd2,self.upActivityTime)
    end
end

function DaNianShouMainLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function DaNianShouMainLayer:refreshTime()
    if self.lastRefreshTime == nil then
		return
    end
    
    local time = math.ceil(self.lastRefreshTime/1000) - MainPlayer:getNowtime()+ self.RefreshTimes 
    local timeStr = FactionManager:getTimeString( time )
    if self.txt_time_ns then
        self.txt_time_ns:setText(timeStr)
    end

    if time <0 then
        DaNianShouManager:requestRefreshDaNianShouMainLayer()
        self:setNianshou();
        if self.timer then
            TFDirector:removeTimer(self.timer)
        end
    end
end

-- 刷新界面数据
function DaNianShouMainLayer:refreshUI()
    local blood = DaNianShouManager:getblood()    
    print(blood)
    if blood > 0 then
        self.img_tishi:setVisible(false)
        self.panel_xueliang:setVisible(true)
    else
        self.img_tishi:setVisible(true)
        self.panel_xueliang:setVisible(false)
    end

    for i=1,2 do
        self.panel_bp[i]:setVisible(true)
        self.panel_bp[i].btn:setTouchEnabled(true)
        self.panel_bp[i].btn:setGrayEnabled(false)
 
        if self.panel_bp[i].effect ~= nil then
            self.panel_bp[i].effect:setVisible(true)
        end

    end

    if blood <= 0 then
        if self.timer == nil then
            self.timer = TFDirector:addTimer(1000, -1, nil, 
                function()   
                    if self.refreshTime then
                        self:refreshTime()
                    end                                  
                end)
        end
        for i=1,2 do
            self.panel_bp[i]:setVisible(false)
        end
    end      

    local blood = DaNianShouManager:getblood()
    self.bar_jindu:setPercent((blood)/self.BeastClickCnt * 100)
    self.txt_jindunumber:setText((blood).."/"..self.BeastClickCnt)
    if self.myNianShouList[1] then
        if blood <= 0 then
            print("没血了")
            local moveType = 2
            self:removeBeastUI(moveType,1);
            for i=1,2 do
                self.panel_bp[i]:setVisible(false)
            end
        end
    end

    local item1_num = BagManager:getItemNumById(30432)
    local item2_num = BagManager:getItemNumById(30433)
    local item1_jf = ConstantData:getValue('MonsterNian.Credit.Firecrackers')
    local item2_jf = ConstantData:getValue('MonsterNian.Credit.Fireworks')

    self.panel_bp[1].yy:setText(item1_num)
    self.panel_bp[2].yy:setText(item2_num)
    self.panel_bp[1].jf:setText(item1_jf)
    self.panel_bp[2].jf:setText(item2_jf)

    local myRank = DaNianShouManager:getMyRank()
    local myScore = DaNianShouManager:getMyScore()
    if myRank ~= 0 then
        self.txt_paiming:setText(myRank)
    end
    self.txt_jifen:setText(myScore)

    if self.ActivityTime == nil then
        self.ActivityTime = TFDirector:addTimer(1000, -1, nil, 
            function()   
                if self.refreshActivityTime then
                    self:refreshActivityTime()
                end                                  
            end)
    end
    self:refreshTableView()    
    -- self:addDropMoneyUI(DropItem)
end

function DaNianShouMainLayer:refreshActivityTime()
    local BeginTime = DaNianShouManager:getActivityBeginTime()
    
    local EndTime = DaNianShouManager:getActivityEndTime()
    local beginTimeData = GetCorrectDate("*t", BeginTime)
    local endTimeData = GetCorrectDate("*t", EndTime)

    local txt_time = stringUtils.format(localizable.Nainshou_OpenTime, beginTimeData.month,beginTimeData.day,endTimeData.month,endTimeData.day)
    txt_time = txt_time..string.format("%02d:%02d~%02d:%02d",beginTimeData.hour,beginTimeData.min,endTimeData.hour,endTimeData.min)
    -- print("时间",beginTimeData.hour,beginTimeData.min,endTimeData.hour,endTimeData.min)
    self.txt_num_hd1:setText(txt_time)
    local nowTimeData = GetCorrectDate("*t", MainPlayer:getNowtime())
    self.upActivityTime = (endTimeData.hour*60 + endTimeData.min)*60 +endTimeData.sec - (nowTimeData.hour*60 + nowTimeData.min)*60 - nowTimeData.sec
    if self.upActivityTime > 0 then
        self:transformTime(self.txt_num_hd2,self.upActivityTime)
    end

    if DaNianShouManager:activityOpenBool() == false then
        AlertManager:closeLayerByName("lua.logic.nianshou.DaNianShouMainLayer")
    end
end

function DaNianShouMainLayer:refreshTableView()
    
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

function DaNianShouMainLayer:cellSizeForTable(table, idx)
 
	return 59,183
end

function DaNianShouMainLayer:tableCellAtIndex(table, idx)
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

function DaNianShouMainLayer:numberOfCellsInTableView(table)
	-- return #self.xinfaInfo
    return #self.paimingInfo
end

function DaNianShouMainLayer:setCellInfo(cell,idx)
	local panel = cell.panel
 	local txt_xuhao = TFDirector:getChildByPath(panel, "txt_xuhao")
    -- self.bg_icon[idx] = bg_icon
	local txt_name = TFDirector:getChildByPath(panel, "txt_name")
	local txt_num = TFDirector:getChildByPath(panel, "txt_num")
    
    local infos = self.paimingInfo

    txt_xuhao:setText(infos[idx].rank)
    txt_name:setText(infos[idx].name)
    txt_num:setText(infos[idx].score)
end

-- 刷新掉落元宝UI
function DaNianShouMainLayer:setDropMoneyUI()
    local dropMoneyList = DaNianShouManager:getAllDropItem()
    self.dropMoneyList = {}
    if dropMoneyList and next(dropMoneyList) ~= nil then
        for i ,v in pairs(dropMoneyList) do
            local flag = 3
            -- if v.gameMoney == 2 then
            --     flag = 4
            -- end
            posList = self:getInitPosList(1,flag)
            local panel = TFPanel:create();

            local img = TFButton:create()
            img:setTextureNormal("ui_new/longmenpo/img_bx.png")
            img:setScale(0.7)
            panel:addChild(img)
            panel:setBackGroundColor(ccc3(0,0,0))
            

            -- local contentSize = effect:getContentSize()
            -- panel:setSize(CCSize(contentSize.width,contentSize.height))
            panel:setTouchEnabled(true)
            panel.index = v.index
            panel.img = img
            panel:setPosition(ccp(posList[1].x,posList[1].y))
            panel:setAnchorPoint(ccp(0.5, 0.5))
            panel:setTouchEnabled(true)
            img:addMEListener(TFWIDGET_CLICK,
            audioClickfun(function(sender)
                -- local self = sender.logic
                img:setVisible(false)
                for k,v in pairs(self.dropMoneyList) do
                    self.dropMoneyList[k].img:setTouchEnabled(false)
                end
                self.selectMoneyIndex = panel.index                 
                TFResourceHelper:instance():addArmatureFromJsonFile("effect/crossarray_box.xml")
                local effect = TFArmature:create("crossarray_box_anim")
                if effect == nil then
                    return
                end
                effect:setAnimationFps(GameConfig.ANIM_FPS)
                effect:playByIndex(0, -1, -1, 0)
                effect:setAnchorPoint(ccp(0.5, 0.5))
                effect:setScale(0.7)
                -- effect:setPosition(ccp(83,26))
                panel:addChild(effect)

                effect:addMEListener(TFARMATURE_COMPLETE,function()
                    -- img:setVisible(true)
                    effect:removeFromParent()
                    for k,v in pairs(self.dropMoneyList) do
                        self.dropMoneyList[k].img:setTouchEnabled(true)
                    end
                    DaNianShouManager:requestPick(panel.index)    
                end)
            end))
            panel.logic = self
            self.img_bg:addChild(panel,50)

            self.dropMoneyList[v.index] = panel

        end
    end
end

-- 在年兽界面添加掉落元宝UI
function DaNianShouMainLayer:addDropMoneyUI()
    local index = self.selectIndex
    local moveToPos = self.myNianShouList[1]:getPosition()
    self.myNianShouList[1].effect:setColor(ccc3(255,255,255))
    self.myNianShouList[1].effect:playByIndex(1, -1, -1, 1)
    self.callBack(1,moveToPos)

    local data = DaNianShouManager:getDropItem()
    if #data == 0 then
        return
    end
    
    local panel = TFPanel:create();

    panel:setBackGroundColor(ccc3(0,0,0))

    local img = TFButton:create()
    panel:addChild(img)
    img:setTextureNormal("ui_new/longmenpo/img_bx.png")
    img:setScale(0.7)
    

    -- local contentSize = effect:getContentSize()
    local pos = ccp(moveToPos.x,moveToPos.y)
    -- local pos = ccp(contentSize.width/2,contentSize.height/2)
    -- pos.x = pos.x - 480 - 83 - contentSize.width/2
    -- pos.y = pos.y - 320 - 26 - contentSize.height/2
    -- panel:setSize(CCSize(contentSize.width,contentSize.height))
    panel:setTouchEnabled(true)
    panel.index = data[1].index
    panel.img = img
    panel:setPosition(ccp(pos.x,pos.y))
    panel:setTouchEnabled(true)
    img:addMEListener(TFWIDGET_CLICK,
    audioClickfun(function(sender)
        img:setVisible(false)
        self.selectMoneyIndex = panel.index   
        for k,v in pairs(self.dropMoneyList) do
            self.dropMoneyList[k].img:setTouchEnabled(false)
        end
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/crossarray_box.xml")
        local effect = TFArmature:create("crossarray_box_anim")
        if effect == nil then
            return
        end
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 0)
        effect:setAnchorPoint(ccp(0, 0))
        effect:setScale(0.7)
        panel:addChild(effect)     

        effect:addMEListener(TFARMATURE_COMPLETE,function()
            -- img:setVisible(true)
            effect:removeFromParent()
            for k,v in pairs(self.dropMoneyList) do
                self.dropMoneyList[k].img:setTouchEnabled(true)
            end
            DaNianShouManager:requestPick(panel.index)
        end)  
    end))
    
    panel.logic = self
    self.img_bg:addChild(panel,50)
    panel.effect = effect
    self.newAddMoneyUI = panel
    self.dropMoneyList[panel.index] = panel

    self:addDropMoneyAnimation(pos)
end

-- 添加元宝的掉落动画
function DaNianShouMainLayer:addDropMoneyAnimation(pos)
    local flag = 3
    local moveToPos = self:getInitPosList(1,flag)[1]
    moveToPos.x = moveToPos.x - 83 - 20
    moveToPos.y = moveToPos.y -26 -20
    local moveToPos_1 = {}
    local moveToPos_2 = {}
    local moveToPos_3 = {}

    local width,height
    width = math.abs(pos.x - moveToPos.x)
    height = 100 + math.abs(pos.y - moveToPos.y)

    if pos.x > moveToPos.x then
        moveToPos_1.x = pos.x - width/4
        moveToPos_2.x = moveToPos_1.x - width/4
        moveToPos_3.x = moveToPos_2.x - width/4
    else
        moveToPos_1.x = pos.x + width/4
        moveToPos_2.x = moveToPos_1.x + width/4
        moveToPos_3.x = moveToPos_2.x + width/4
    end

    if pos.y > moveToPos.y then
        moveToPos_1.y = pos.y + 75
        moveToPos_2.y = moveToPos_1.y + 25
        moveToPos_3.y = moveToPos_2.y - height/4*3
    else
        moveToPos_1.y = pos.y + height/4*3
        moveToPos_2.y = moveToPos_1.y + height/4
        moveToPos_3.y = moveToPos_2.y - 25
    end


    local acArr = TFVector:create()
    local moveAc = CCMoveTo:create(0.1,ccp(moveToPos_1.x,moveToPos_1.y))
    acArr:addObject(moveAc)
    local moveAc = CCMoveTo:create(0.1,ccp(moveToPos_2.x,moveToPos_2.y))
    acArr:addObject(moveAc)
    local moveAc = CCMoveTo:create(0.1,ccp(moveToPos_3.x,moveToPos_3.y))
    acArr:addObject(moveAc)
    local moveAc = CCMoveTo:create(0.1,ccp(moveToPos.x,moveToPos.y))
    acArr:addObject(moveAc)
    self.newAddMoneyUI:runAction(CCSequence:create(acArr))
end

-- 加载年兽相关数据
function DaNianShouMainLayer:setNianshou()
    
        local panel_boss = self.panel_boss:clone()
        panel_boss:setScale(1.3)
        local img_role          = TFDirector:getChildByPath(panel_boss, "img_role")
        panel_boss.bg_name           = TFDirector:getChildByPath(panel_boss, "bg_name")
        panel_boss.txt_name          = TFDirector:getChildByPath(panel_boss.bg_name, "txt_name")
        panel_boss.txt_juli          = TFDirector:getChildByPath(panel_boss.bg_name, "txt_juli")
        panel_boss.txt_time          = TFDirector:getChildByPath(panel_boss.txt_juli, "txt_time")
        
        img_role:setVisible(false)

        TFResourceHelper:instance():addArmatureFromJsonFile("effect/NianShou.xml")
        local effect = TFArmature:create("NianShou_anim")
        panel_boss:addChild(effect,100)
        panel_boss.effect = effect
        panel_boss.multiple = 1
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:playByIndex(0, -1, -1, 1)
        effect:setPosition(ccp(100,50))
        effect:setScale(0.9)

        local shadowImg = TFImage:create("ui_new/fight/shadow.png")
        shadowImg:setZOrder(-1001)
        shadowImg:setScale(2)
        shadowImg:setAnchorPoint(ccp(0.5, 0.5))
        effect.shadowImg = shadowImg
        effect:addChild(shadowImg)

        -- panel_boss.toPlayer = v.toPlayer
        -- panel_boss.round = v.round
        panel_boss.speed = 90
        panel_boss.multiple = 1
        panel_boss:setAnchorPoint(ccp(0.5, 0.5))
        panel_boss:setVisible(true)
        panel_boss:setTouchEnabled(false)
        self.myNianShouList[1] = panel_boss

        self.img_bg:addChild(panel_boss,1000)
    -- end
    self:setNianshouMove()
end

-- 移除年兽
function DaNianShouMainLayer:removeBeastUI(moveType,index)
    local index = index or self.selectIndex
    local moveType = moveType or 1
    self.myNianShouList[index].effect:removeMEListener(TFARMATURE_UPDATE)
    self.myNianShouList[index].effect:setColor(ccc3(255,255,255))
    self.myNianShouList[index]:stopAllActions()
    TFDirector:killAllTween(self.myNianShouList[index])
    self.myNianShouList[index].bg_name:setVisible(false)    
    self.myNianShouList[index].effect:playByIndex(3, -1, -1, 0)
    self.myNianShouList[index].effect:addMEListener(TFARMATURE_COMPLETE,function()
            self.myNianShouList[index].effect:removeMEListener(TFARMATURE_COMPLETE)
            self.myNianShouList[index]:setVisible(false)
            if self.myNianShouList[index] then
                self.myNianShouList[index]:removeFromParent()
                self.myNianShouList[index] = nil
            end
        end)
end

function DaNianShouMainLayer.useItem1(sender)
    print("useitem1")
    -- 炮竹特效
    local self = sender.logic
    local nianShou = self.myNianShouList[1]
    
    local num = BagManager:getItemNumById(30432)
    if num > 0 then
        for i=1,2 do
            self.panel_bp[i].btn:setTouchEnabled(false)
        end
        self.panel_bp[2].btn:setGrayEnabled(true)
        self.panel_bp[2].effect:setVisible(false)
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/Nianshou_Bomb.xml")        
        local effect_Bomb = TFArmature:create("Nianshou_Bomb_anim")
        self.myNianShouList[1]:addChild(effect_Bomb,5000)
        effect_Bomb:setAnimationFps(48)
        effect_Bomb:playByIndex(0, -1, -1, 0)
        effect_Bomb:setPosition(ccp(90,130))
        effect_Bomb:addMEListener(TFARMATURE_COMPLETE,function()
            effect_Bomb:removeMEListener(TFARMATURE_COMPLETE) 
            effect_Bomb:removeFromParent()
            showLoading()
            self.myNianShouList[1].multiple = 2
            TFDirector:send(c2s.DRIVE_WORLD_BEAST, {1})
        end)
        effect_Bomb:setScale(0.7)
        self.myNianShouList[1].effect:playByIndex(2, -1, -1, 1)
        self.myNianShouList[1].effect:setColor(ccc3(255,0,0))
        self.myNianShouList[1]:stopAllActions()
        TFAudio.playEffect("sound/effect/firecracker.mp3", false)
        TFAudio.playEffect("sound/effect/beastHit.mp3", false)
        if self.addClickTime then
            TFDirector:removeTimer(self.addClickTime);
            self.addClickTime = nil;
        end
        local time = 3
        self.addClickTime = TFDirector:addTimer(1000, -1, nil, 
        function() 
            time = time -1
            if time <= 0 then
                if self.myNianShouList and self.myNianShouList[1] then
                    TFDirector:removeTimer(self.addClickTime);
                    self.addClickTime = nil;
                    self.myNianShouList[1].effect:playByIndex(0, -1, -1, 1)
                    self.myNianShouList[1].multiple = 1
                end
            end

        end)
        local act_num = ConstantData:getValue('MonsterNian.Damage.Firecrackers')
        local txt = TFLabelBMFont:create()
        txt:setText('-'..act_num)
        txt:setPosition(ccp(0 , 0))
        self.myNianShouList[1]:addChild(txt,10000)
        txt:setScale(1.8)
        
        txt:setFntFile("font/num_99.fnt")
        -- txt:setColor(ccc3(255,0,0))
        txt:setVisible(true)
        local tween2 = 
        {
            target = txt,
            {   
                -- ease = {type=TFEaseType.EASE_IN_OUT, rate=5},
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3}, --由慢到快
                duration = 0.6,
                x = 0,
                y = 80,
                onComplete = function ()
                    txt:removeFromParent()
                end,
            },

        }
        
        TFDirector:toTween(tween2)
    else
        showLoading()
    
        TFDirector:send(c2s.DRIVE_WORLD_BEAST, {1})
    end
    
end

function DaNianShouMainLayer.useItem2(sender)
    print("useitem2")
    local self = sender.logic
    local nianShou = self.myNianShouList[1]
    
    local num = BagManager:getItemNumById(30433)
    if num > 0 then
        for i=1,2 do
            self.panel_bp[i].btn:setTouchEnabled(false)            
        end
        self.panel_bp[1].btn:setGrayEnabled(true)
        self.panel_bp[1].effect:setVisible(false)
        TFResourceHelper:instance():addArmatureFromJsonFile("effect/DaNianshou_Bomb.xml")
        local effect_Bomb = TFArmature:create("DaNianshou_Bomb_anim")
        self.myNianShouList[1]:addChild(effect_Bomb,5000)
        effect_Bomb:setAnimationFps(48)
        effect_Bomb:playByIndex(0, -1, -1, 0)
        effect_Bomb:setPosition(ccp(90,130))
        effect_Bomb:addMEListener(TFARMATURE_COMPLETE,function()
            effect_Bomb:removeMEListener(TFARMATURE_COMPLETE) 
            effect_Bomb:removeFromParent()
            showLoading()
            self.myNianShouList[1].multiple = 2
            TFDirector:send(c2s.DRIVE_WORLD_BEAST, {2})
        end)
        self.myNianShouList[1].effect:playByIndex(2, -1, -1, 1)
        self.myNianShouList[1].effect:setColor(ccc3(255,0,0))
        self.myNianShouList[1]:stopAllActions()
        TFAudio.playEffect("sound/effect/firecracker.mp3", false)
        TFAudio.playEffect("sound/effect/beastHit.mp3", false)
        if self.addClickTime then
            TFDirector:removeTimer(self.addClickTime);
            self.addClickTime = nil;
        end
        local time = 3
        self.addClickTime = TFDirector:addTimer(1000, -1, nil, 
        function() 
            time = time -1
            if time <= 0 then
                if self.myNianShouList and self.myNianShouList[1] then
                    TFDirector:removeTimer(self.addClickTime);
                    self.addClickTime = nil;
                    self.myNianShouList[1].effect:playByIndex(0, -1, -1, 1)
                    self.myNianShouList[1].multiple = 1
                end
            end

        end)
        local act_num = ConstantData:getValue('MonsterNian.Damage.Fireworks')
        local txt = TFLabelBMFont:create()
        txt:setText('-'..act_num)
        txt:setPosition(ccp(0 , 0))
        self.myNianShouList[1]:addChild(txt,10000)
        txt:setScale(1.8)
        txt:setFntFile("font/num_99.fnt")
        -- txt:setColor(ccc3(255,0,0))
        txt:setVisible(true)
        local tween2 = 
        {
            target = txt,
            {   
                -- ease = {type=TFEaseType.EASE_IN_OUT, rate=5},
                ease = {type=TFEaseType.EASE_IN_OUT, rate=3}, --由慢到快
                duration = 0.6,
                x = 0,
                y = 80,
                onComplete = function ()
                    txt:removeFromParent()
                end,
            },

        }
        
        TFDirector:toTween(tween2)
    else
        showLoading()
    
        TFDirector:send(c2s.DRIVE_WORLD_BEAST, {2})
    end
end

function DaNianShouMainLayer.onJiFenClickHandle(sender)
    local self = sender.logic
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
                    print("move complete")  
                    self.paihangshow = 1   
                    self.btn_jifen:setTouchEnabled(true) 
                end,
            },

        }
        
        TFDirector:toTween(tween2)
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
                    print("move complete2")
                    self.paihangshow = 0 
                    self.btn_jifen:setTouchEnabled(true) 
                end,
            },

        }
        TFDirector:toTween(tween2)
    end
end

function DaNianShouMainLayer:requirerefresh()
    DaNianShouManager:requireRankRefresh()
end

function DaNianShouMainLayer.onphjlClickHandle(sender)
    print("onphjlClickHandle")
    local self = sender.logic
    local layer =  AlertManager:addLayerByFile("lua.logic.nianshou.rankrewardLayer", AlertManager.BLOCK_AND_GRAY_CLOSE)
    AlertManager:show()
end

function DaNianShouMainLayer.onjlylClickHandle(sender)
    print("onjlylClickHandle")
    local self = sender.logic
    local layer =  AlertManager:addLayerByFile("lua.logic.nianshou.jiangliyulanLayer", AlertManager.BLOCK_AND_GRAY_CLOSE)
    AlertManager:show()
end

function DaNianShouMainLayer.onhistoryClickHandle(sender)
    print("onhistoryClickHandle")
    DaNianShouManager:checkHistory()
end

-- 在界面移除已捡起的掉落元宝
function DaNianShouMainLayer:removeDropMoneyUI()
    for i, v in pairs(self.dropMoneyList) do
        if v.index == self.selectMoneyIndex then
            v:setVisible(false)
            v:removeFromParent()
            self.dropMoneyList[i] = nil
        end
    end
end

--注册事件
function DaNianShouMainLayer:registerEvents()
    self.super.registerEvents(self);    

    TFAudio.stopMusic()
    TFAudio.playMusic("sound/bgmusic/BeastBGM.mp3", true)

    self.btn_return:addMEListener(TFWIDGET_CLICK, audioClickfun(self.returnButtonClick,play_fanhui),1)
	self.btn_return.logic   = self
    self.btn_return:setClickAreaLength(100)
    
    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpClickHandle))
    self.btn_help.logic   = self

    self.panel_bp[1].btn:addMEListener(TFWIDGET_CLICK, audioClickfun(self.useItem1),1)
    self.panel_bp[2].btn:addMEListener(TFWIDGET_CLICK, audioClickfun(self.useItem2),1)

    self.btn_shuaxin:addMEListener(TFWIDGET_CLICK, audioClickfun(self.requirerefresh),1)

    self.btn_jifen:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onJiFenClickHandle),1)

    self.btn_phjl:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onphjlClickHandle),1)
    self.btn_jlyl:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onjlylClickHandle),1)
    self.btn_lsjl:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onhistoryClickHandle),1)

    self.AttackReceive = function(event) 
        self:addDropMoneyUI();
        self.lastRefreshTime = DaNianShouManager:getlastRefreshTime()
        DaNianShouManager:requireRankRefresh()
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(DaNianShouManager.AttackReceive,self.AttackReceive)

    self.receiveLayer = function(event) 
        if self.refreshUI then  
            self.lastRefreshTime = DaNianShouManager:getlastRefreshTime()
            self:refreshUI()
        end
    end
    TFDirector:addMEGlobalListener(DaNianShouManager.receiveLayer,self.receiveLayer)

    self.receiverefresh = function(event) 
        -- self:addDropMoneyUI(event.data[1]);   
        if self.refreshUI then 
            self.paimingInfo = DaNianShouManager:getPaiMingInfo()  
            self:refreshUI()
        end
    end
    TFDirector:addMEGlobalListener(DaNianShouManager.receiverefresh,self.receiverefresh)

    self.removeMoneyCallBack = function()
        self:removeDropMoneyUI();
    end
    TFDirector:addMEGlobalListener(DaNianShouManager.receivePick,self.removeMoneyCallBack)

end

--注销事件
function DaNianShouMainLayer:removeEvents()
    self.super.removeEvents(self)

    TFAudio.stopMusic()
    TFAudio.playMusic("sound/bgmusic/home.mp3", true)

    self.btn_return:removeMEListener(TFWIDGET_CLICK)
    self.btn_help:removeMEListener(TFWIDGET_CLICK)
    self.img_bg2:removeMEListener(TFWIDGET_CLICK)

    TFDirector:removeMEGlobalListener(DaNianShouManager.receivePick,self.removeMoneyCallBack)
    self.removeMoneyCallBack = nil

    TFDirector:removeMEGlobalListener(DaNianShouManager.AttackReceive,self.AttackReceive)
    self.AttackReceive = nil

    TFDirector:removeMEGlobalListener(DaNianShouManager.receiverefresh,self.receiverefresh)
    self.receiverefresh = nil

    if self.timer ~= nil then
        TFDirector:removeTimer(self.timer)
        self.timer = nil
    end

    if self.ActivityTime then
        TFDirector:removeTimer(self.ActivityTime)
        self.ActivityTime = nil
    end
    self:removeBeastData()
end

-- 移除年兽界面所有的监控
function DaNianShouMainLayer:removeBeastData()
    if self.myNianShouList and next(self.myNianShouList) ~= nil then
        for i ,v in pairs(self.myNianShouList) do
            v.effect:removeMEListener(TFARMATURE_UPDATE)
            v:removeMEListener(TFWIDGET_CLICK)
            v:removeFromParent()
        end
        self.myNianShouList = nil
    end

    if self.dropMoneyList and next(self.dropMoneyList) ~= nil then
        for i, v in pairs(self.dropMoneyList) do
            v:removeMEListener(TFWIDGET_CLICK)
            v:removeFromParent()
        end
        self.dropMoneyList = nil
    end

    if self.addUpDataTimer then
        TFDirector:removeTimer(self.addUpDataTimer)
        self.addUpDataTimer = nil
    end

    if self.addClick then
        TFDirector:removeTimer(self.addClick);
        self.addClick = nil;
    end

    if self.addClickTime then

        TFDirector:removeTimer(self.addClickTime);
        self.addClickTime = nil;

    end
end

--注销界面
function DaNianShouMainLayer:removeUI()
    self.super.removeUI(self)

    if self.panel_boss then
        self.panel_boss:release()
        self.panel_boss = nil
    end
end

-- 返回主界面按钮事件
function DaNianShouMainLayer.returnButtonClick(sender)
    local self = sender.logic
    AlertManager:close(AlertManager.TWEEN_1);
end

-- 时间转化（将秒转化为时、分、秒显示）
function DaNianShouMainLayer:transformTime(Node,LeftTime,flag)
    local hour,min,sec
    hour = math.floor(LeftTime/3600)
    min = math.floor((LeftTime - hour * 3600)/60)
    sec = math.fmod(LeftTime, 60)
    if flag then
        Node:setText(string.format("%02d:%02d",min,sec))
    else
        Node:setText(string.format("%02d:%02d:%02d",hour,min,sec))
    end
end

-- 年兽规则
function DaNianShouMainLayer.onHelpClickHandle(sender)
    local self = sender.logic
    CommonManager:showRuleLyaer('toukiden')
end

-- 初始化年兽位置和运动方向
function DaNianShouMainLayer:setNianshouMove()
    local posList  = self:getInitPosList(#self.myNianShouList)

    self.callBack =  function(index,pos)
        local nianShou = self.myNianShouList[index]
        nianShou:stopAllActions()
        -- TFDirector:killAllTween(nianShou)

        local moveToPos,sec,flag = self:getBeastMoveToPos(index,pos)
        if flag then
            nianShou.effect:setRotationY(180)
        else
            nianShou.effect:setRotationY(0)
        end
        nianShou.dirFlag = flag
        local moveTo = CCMoveTo:create(sec,ccp(moveToPos.x,moveToPos.y))
        local seq = CCSequence:createWithTwoActions(moveTo, CCCallFunc:create(function() self.callBack(index,moveToPos) end))
        nianShou:runAction(seq)
    end

    for i, v in pairs(self.myNianShouList) do
        -- posList[i].x = 0--400
        -- posList[i].y = 0--200
        self.myNianShouList[i]:setPosition(ccp(posList[i].x,posList[i].y)) 
        local moveToPos,sec,flag = self:getBeastMoveToPos(i,posList[i])

        if flag then
            v.effect:setRotationY(180)
        else
            v.effect:setRotationY(0)
        end
        self.myNianShouList[i].dirFlag = flag
        local moveTo = CCMoveTo:create(sec,ccp(moveToPos.x,moveToPos.y))
        local seq = CCSequence:createWithTwoActions(moveTo, CCCallFunc:create(function() self.callBack(i,moveToPos) end))
        v:runAction(seq)
        v.effect:addMEListener(TFARMATURE_UPDATE,function()
            local pos = v:getPosition()
            local num = 10000 - math.floor(pos.y)  
            v:setZOrder(num)
        end)
    end
end

-- 获得年兽的运动位置,运动时间，运动方向
function DaNianShouMainLayer:getBeastMoveToPos(index,pos)
    local pos = pos or self:getInitPosList()[1];
    local moveToPos= {};
    local secX,secY

    local Beast = self.myNianShouList[index]

    local speed = Beast.speed * Beast.multiple
    local moveToPos = self:getInitPosList()[1];
    local moveSec = math.pow(math.pow(moveToPos.x - pos.x,2) + math.pow(moveToPos.y - pos.y,2),0.5)/speed
    local sideFlag;
    if moveToPos.x > pos.x then
        sideFlag = true
    else
        sideFlag = false
    end
    return moveToPos,moveSec,sideFlag
end

-- 获得年兽或者元宝初始化位置
function DaNianShouMainLayer:getInitPosList(num,flag,posX)
    local posList = {}
    local num = num or 1
    local flag = flag or 0
    local posX = posX or 0
    -- 年兽在屏幕可移动区域大小    
    local mapHeight = 300
    local mapWidth = 880
    local nagemapHeight = -200
    local nagemapWidth = -400
    if flag == 1 then
        -- 元宝在屏幕好捡起的区域
        mapHeight = 200
        mapWidth = 400
        nagemapHeight = -100
        nagemapWidth = -200 
    elseif flag == 2 then 
        local mapHeight = 250
        local mapWidth = 880
        local nagemapHeight = -100
        local nagemapWidth = -400
    
    -- 宝箱1掉落位置
    elseif flag == 3 then 
        mapHeight = 180
        mapWidth = 700
        nagemapHeight = -150
        nagemapWidth = -350
    elseif flag == 4 then 
    -- 宝箱2掉落位置
        local mapHeight = 600
        local mapWidth = 800
        local nagemapHeight = -150
        local nagemapWidth = -200
    end
    for i = 1, num do 
        posList[i] = {}
        local x,y
        if flag == 2 then
            mapWidth = mapWidth - 100
            x = math.ceil(math.random() * mapWidth) + nagemapWidth;
            if math.abs(x - posX) < 100 then
                if x > posX then
                    x = x + 100   
                else
                    x = x - 100
                end
            end
            if x > 480 then
                x = 480
            elseif x < -400 then
                x = -400
            end 
        else
            x = math.ceil(math.random() * mapWidth) + nagemapWidth;
        end
        y = math.ceil(math.random() * mapHeight) + nagemapHeight;
        posList[i].x = x;
        posList[i].y = y;
    end
    return posList
end

return DaNianShouMainLayer