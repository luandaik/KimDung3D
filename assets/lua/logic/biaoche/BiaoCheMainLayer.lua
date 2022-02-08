-- client side BiaoCheMainLayer.lua
--[[
 * @Description: 开车界面
 ]]
-- script writer chikui


local BiaoCheMainLayer = class("BiaoCheMainLayer",BaseLayer)
local nMinPosScale = 25
local nMaxPosScale = 400
local tttlist = {20,24,28,32}
function BiaoCheMainLayer:ctor(data)

    self.super.ctor(self, data)
    self:init("lua.uiconfig_mango_new.faction.BiaocheFightMain")
end

function BiaoCheMainLayer:initUI( ui )

    self.super.initUI(self, ui)

    self.btn_close = TFDirector:getChildByPath(ui, 'btn_back')

    self.btn_fangshoubaoming = TFDirector:getChildByPath(ui, 'btn_fangshoubaoming')
    self.btn_fangshoubaoming:setVisible(false)
    self.btn_jingongzhenrong = TFDirector:getChildByPath(ui, 'btn_jingongzhenrong')
    self.btn_jingongxiangqing = TFDirector:getChildByPath(ui, 'btn_jingongxiangqing')
    self.btn_jingongxiuzheng = TFDirector:getChildByPath(ui, 'btn_jingongxiuzheng')
    self.btn_reward = TFDirector:getChildByPath(ui, 'btn_reward')
    self.btn_help = TFDirector:getChildByPath(ui, 'btn_help')

    self.txt_shuoming = TFDirector:getChildByPath(ui, 'txt_shuoming')
    
    self.img_yuanbaobg = TFDirector:getChildByPath(ui, 'img_yuanbaobg')
    self.txt_yuanbao = TFDirector:getChildByPath(self.img_yuanbaobg, 'txt_number')
    local gold = ConstantData:objectByID("EscortAgencyLateFill").value
    self.txt_yuanbao:setText(gold)
    self.img_bobaobg = TFDirector:getChildByPath(ui, 'img_bobaobg')
    self.img_bobaobg:setVisible(false)
    self.img_head_bb = TFDirector:getChildByPath(self.img_bobaobg, 'img_touxiang')
    self.txt_name_bb = TFDirector:getChildByPath(self.img_bobaobg, 'txt_name')
    self.txt_lianji_bb = TFDirector:getChildByPath(self.img_bobaobg, 'txt_lianji')
    self.img_juli = TFDirector:getChildByPath(ui, 'img_juli')
    self.txt_juli = TFDirector:getChildByPath(self.img_juli, 'txt_juli')
    self.img_paiming = TFDirector:getChildByPath(ui, 'img_paiming')
    self.txt_paiming = TFDirector:getChildByPath(self.img_paiming, 'txt_paiming')
    self.img_juli:setVisible(false)
    self.img_paiming:setVisible(false)

    self.tMyInfoNode = {}
    self.tMyInfoNode.panel = TFDirector:getChildByPath(ui, 'img_xueliangbg')
    self.tMyInfoNode.txt_zhandouzhong = TFDirector:getChildByPath(ui, 'txt_zhandouzhong')
    self.tMyInfoNode.txt_xueliang = TFDirector:getChildByPath(ui, 'txt_xueliang')
    self.tMyInfoNode.img_tou = TFDirector:getChildByPath(ui, 'img_tou')
    self.tMyInfoNode.img_touxiang = TFDirector:getChildByPath(ui, 'img_touxiang')


    self.panel_list = TFDirector:getChildByPath(ui, 'panel_list')
    self.tPanel_list = {}
    self.tNode_cell_model = {}
    local tblName = {'Panel_hdph','Panel_jpph','Panel_cdbp'}
    for i=1,3 do
        local rootNode = TFDirector:getChildByPath(ui, tblName[i])
        self.tPanel_list[i] = rootNode
        self.tNode_cell_model[i] = TFDirector:getChildByPath(rootNode, 'img_liebiaobg')
        self.tNode_cell_model[i]:retain()
        self.tNode_cell_model[i]:removeFromParent(true)
        self.tNode_cell_model[i]:setVisible(false)
    end
    self.Panel_paihang = TFDirector:getChildByPath(ui, 'Panel_paihang')
    self.Panel_Paihang_Pos = self.Panel_paihang:getPositionX()
    self.panel_move = TFDirector:getChildByPath(self.Panel_paihang, 'Panel_move')
    self.rankState = 0
    self.rankType = 1
    self.tBtn_RankTab = {}
    tblName = {'btn_hdph','btn_jpph','btn_cdbp'}
    for i=1,3 do
        local btn = TFDirector:getChildByPath(self.Panel_paihang, tblName[i])
        self.tBtn_RankTab[i] = btn
    end
    self.img_bg_list = {}
    self.img_bg_list[1] = TFDirector:getChildByPath(ui, 'bg')
    self.img_bg_list[2] = TFDirector:getChildByPath(ui, 'bg1')
    self.img_bg_list[1]:setPositionX(0)
    self.img_bg_list[2]:setPositionX(1136)
    
    self.panel_fight = TFDirector:getChildByPath(ui, 'Panel_fight')
    self.node_car_model = TFDirector:getChildByPath(ui, 'Panel_Biaoche')
    self.txt_resttime = TFDirector:getChildByPath(ui, 'txt_resttime')

    self.nCarWidth = self.node_car_model:getContentSize().width
    self.node_car_model:retain()
    self.node_car_model:removeFromParent(true)
    self.node_car_model:setVisible(false)


    local resPath = "effect/biaoche_effect.xml"
    TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    local effect = TFArmature:create("biaoche_effect_anim")
    self.node_car_model:addChild(effect,100,100)
    effect:setPosition(ccp(80,55))

    self.node_car_model.effect = effect


    self.mapPosScale = 1
    self.mapSpeedScale = 50
    self.mapSpeed = 1.2
    self.car_node_list = {}

    --BiaoCheManager:test()

    self.EndDesTime = ConstantData:objectByID("EscortAgencyEndBattle").value
    self.RestColdTime = ConstantData:objectByID("EscortAgencyRestInTime").value

    self.updateTimerID = TFDirector:addTimer(15, -1, nil,handler(self.updateFunc,self))
    local coldUpdateFunc = function()
        self:showRestColdTime()
    end
    self.coldTimerID = TFDirector:addTimer(1000, -1, nil,coldUpdateFunc)
    self:showRestColdTime()
    self.PushMsgList = {}
    self.isPushing = false
    self.posIndex = 1
    self.tempTime = nil
    BiaoCheManager:setMyPlayerData(nil)
    BiaoCheManager:requestMyAttackDetail()
    self:drawAttackInfo()
end

function BiaoCheMainLayer:removeUI()
    if self.updateTimerID then
        TFDirector:removeTimer(self.updateTimerID)
        self.updateTimerID = nil
    end
    if self.coldTimerID then
        TFDirector:removeTimer(self.coldTimerID)
        self.coldTimerID = nil
    end
    for i=1,3 do
        if self.tNode_cell_model[i] then
            self.tNode_cell_model[i]:release()
            self.tNode_cell_model[i] = nil
        end
    end
    if self.node_car_model then
        self.node_car_model:release()
        self.node_car_model = nil
    end
    self.super.removeUI(self)
end

function BiaoCheMainLayer:updateFunc()
    if self.tempTime then
        self.tempTime = self.tempTime + 0.015
    end
    local tempTime = BiaoCheManager:updateTempTime()
    if self.tempTime == nil or self.tempTime >= tempTime + 1 or self.tempTime <= tempTime then
        self.tempTime = tempTime
    end
    self:checkNodeList(self.tempTime)
    local posXAdd = self.mapSpeedScale * self.mapSpeed * 0.015
    local first = self.img_bg_list[1]
    local second = self.img_bg_list[2]
    local posX = first:getPositionX() - posXAdd
    second:setPositionX(posX + 1136)
    if posX < -1136 then
        posX = posX + 1136 * 2
        self.img_bg_list[1] = second
        self.img_bg_list[2] = first
    end
    first:setPositionX(posX)
    self:brushNodeList(self.tempTime)
end

function BiaoCheMainLayer:checkNodeList()
    self.myInfoNode = BiaoCheManager:getMyInfoNode()
    if self.myInfoNode == nil or self.myInfoNode.guildId == nil then
        self.myCarNode = nil
        bMyInfoIsNull = true
    end
    local isInitList = false
    if #self.car_node_list <= 0 then
        isInitList = true
    end
    local infoNodeList = BiaoCheManager:getInfoNodeList()
    if self.myInfoNode == nil or self.myInfoNode.guildId == nil then
        local firstScore = 0
        local lastScore = -1
        for k,v in pairs(infoNodeList) do
            if v.score > firstScore then
                firstScore = v.score
            end
            if lastScore == -1 or v.score < lastScore then
                lastScore = v.score
            end
        end
        local fastScore = firstScore - lastScore
        if fastScore ~= 0 then
            self.mapPosScale = ( 960 * 0.5 - 100 ) * 2/fastScore
        else
            self.mapPosScale = 0
        end
        --self.mapPosScale = math.min(nMaxPosScale,self.mapPosScale)
        --self.mapPosScale = math.max(nMinPosScale,self.mapPosScale)
        self.mapSpeedScale = nMinPosScale
        self.mapSpeed = 1
        self.scoreScale = 1
    else
        if isInitList == true or not ( isInitList or self.myCarNode ) then
            local myScore = self.myInfoNode:getScore(tempTime)
            local fastScore = 0
            for k,v in pairs(infoNodeList) do
                if v.guildId ~= self.myInfoNode.guildId then
                    local disScore = math.abs(v:getScore(tempTime) - myScore)
                    if disScore > fastScore then
                        fastScore = disScore
                    end
                end
            end
            self.mapPosScale = tttlist[self.myInfoNode.quality]
            if fastScore ~= 0 then
                --self.mapPosScale = ( 960 * 0.5 - 100 )/fastScore
                self.scoreScale = ( 960 * 0.5 - 100 )/(fastScore * self.mapPosScale)
            else
                self.scoreScale = 1
            end

            --self.mapPosScale = math.min(nMaxPosScale,self.mapPosScale)
            --self.mapPosScale = math.max(nMinPosScale,self.mapPosScale)
            self.mapSpeedScale = self.mapPosScale
        end
        -- print("self.mapSpeedScale = ",self.mapSpeedScale)
        self.mapSpeed = self.myInfoNode:getSpeed()
        -- print("self.mapSpeed = ",self.mapSpeed)
    end
	self:showMyRank()
end

function BiaoCheMainLayer:showMyRank()
	if self.myInfoNode == nil or self.myInfoNode.guildId == nil then
		self.img_juli:setVisible(false)
        self.img_paiming:setVisible(false)
		return
	end
    local rankInfo = BiaoCheManager:getMyRankInfo(BiaoCheManager.RankType_1)
    local myScore = self.myInfoNode:getScore()
    myScore = math.floor(myScore)
    self.img_juli:setVisible(true)
    self.txt_juli:setText(myScore)
    self.img_paiming:setVisible(true)
    if rankInfo and rankInfo.rank and rankInfo.rank > 0 then
        self.txt_paiming:setText(stringUtils.format(localizable.LunJianFeng_txt_bpbuff_layer0,rankInfo.rank))
    else
        self.txt_paiming:setText(localizable.shalu_info_txt1)
    end
end
--[[ carSpeedType:
        0: normal
        1: lost data left
        2: lost data right
        3: find new car left
        4: find new car right
]]--
function BiaoCheMainLayer:brushNodeList(tempTime)
    self:refreshNodeList(tempTime)
    self:brushCarNodeStatus(tempTime)
    self:_carRun(tempTime)
    
end

function BiaoCheMainLayer:refreshNodeList(tempTime)
    local releaseList = {}
    local myScore = nil 
    if self.myInfoNode ~= nil and self.myInfoNode.guildId ~= nil then
        myScore = self.myInfoNode:getScore(tempTime)
    end
    for k,v in pairs(self.car_node_list) do
        if v.guildId then 
            if ( v.carSpeedType ~= 1 and v.carSpeedType ~= 2 ) then
                local infoNode = BiaoCheManager:getInfoNode(v.guildId)
                if infoNode == nil or infoNode.guildId == nil then
                    if myScore == nil then
                        v:setVisible(false)
                        table.insert(releaseList,v)
                    else
                        v.carSpeedType = 1
                        if myScore and v.score and v.score > myScore then
                            v.carSpeedType = 2
                        end
                    end
                    
                end

                if v.carSpeedType == 1 or v.carSpeedType == 2 then
                    local posX = v:getPositionX()
                    if posX < 0 - self.nCarWidth or posX > 1136 then
                        table.insert(releaseList,v)
                    end
                end
            end
        else
            v:setVisible(false)
            table.insert(releaseList,v)
        end
    end
    for k,v in pairs(releaseList) do
        local index = nil
        local _carnode,index = self:getCarNodeById(v.guildId)
        if index then
            table.remove(self.car_node_list,index)
        end
        v:removeFromParent()
    end
end

function BiaoCheMainLayer:brushCarNodeStatus(tempTime)
    ----------------------------------------------------------
    local myGuildId = FactionManager:getPersonalInfo().guildId
    --print()
    local infoNodeList = BiaoCheManager:getInfoNodeList()
    local attackId = BiaoCheManager:getConvergeGuildId()
    if #self.car_node_list <= 0 or self.myCarNode == nil then
        -- for k,v in pairs(self.car_node_list) do
        --     v:removeFromParent()
        -- end
        -- self.car_node_list = {}
        local lastScore = -1
        for k,v in pairs(infoNodeList) do
            local _carNode = self:getCarNodeById(v.guildId)
            if lastScore == -1 or v.score > lastScore then
                lastScore = v.score
            end
            if _carNode == nil then
                _carNode = self:BuildCarNode(v)
                if _carNode.guildId == myGuildId then
                    self.myCarNode = _carNode
                    _carNode:setPositionY(140)
                else
                    local posY = BiaoCheManager:getCarNodePosData(self.posIndex).pos
                    _carNode:setPositionY( posY )
                    self.posIndex = self.posIndex + 1
                    if self.posIndex > BiaoCheManager:getCarNodePosDataSize() then
                        self.posIndex = 1
                    end
                end
                
                self.panel_fight:addChild(_carNode,0-_carNode:getPositionY())
                table.insert(self.car_node_list,_carNode)
            end
            _carNode.score = v:getScore(tempTime)
        end
        local rightPos = 1136*0.5 + 960*0.5 - self.nCarWidth * 0.5 - 100
        local centerPos = 1136*0.5 - self.nCarWidth * 0.5
        -- print("lastScore = ",lastScore)
        for k,v in pairs(self.car_node_list) do
            local infoNode = BiaoCheManager:getInfoNode(v.guildId)
            if self.myCarNode == nil then
                local posX = rightPos - (lastScore - infoNode.score) * self.mapPosScale * self.scoreScale
                -- print("posX = ",posX)
                -- print("infoNode.score = ",infoNode.score)
                v:setPositionX(posX)
            else
                local posX = (infoNode:getScore(tempTime) - self.myInfoNode:getScore(tempTime))*self.scoreScale * self.mapPosScale + centerPos
                v:setPositionX(posX)
                v.carSpeedType = 0
                local status = infoNode:getPartState(4)
                if status == 1 then
                    v.effect:stop()
                else
                    v.effect:resume()
                end
            end
            if attackId and attackId ~= 0 and v.guildId == attackId then
                v.attackTag:setVisible(true)
            else
                v.attackTag:setVisible(false)
            end
        end
    else
        
        local myScore = self.myInfoNode.score + tempTime * self.myInfoNode:getSpeed()
        for k,v in pairs(infoNodeList) do
            local _carNode,_ = self:getCarNodeById(v.guildId)
            if _carNode == nil then
                _carNode = self:BuildCarNode(v)
                local posX = -self.nCarWidth
                local _score = v:getScore(tempTime)
                _carNode.carSpeedType = 3
                _carNode.effect:resume()
                if _score > myScore then
                    posX = 1136
                    _carNode.carSpeedType = 4
                end
                _carNode:setPositionX(posX)
                
                local posY = BiaoCheManager:getCarNodePosData(self.posIndex).pos
                _carNode:setPositionY( posY )
                self.posIndex = self.posIndex + 1
                if self.posIndex > BiaoCheManager:getCarNodePosDataSize() then
                    self.posIndex = 1
                end
                    
                self.panel_fight:addChild(_carNode,0-v:getPositionY())
                table.insert(self.car_node_list,_carNode)
                _carNode.score = _score
            end
            if attackId and attackId ~= 0 and _carNode.guildId == attackId then
                _carNode.attackTag:setVisible(true)
            else
                _carNode.attackTag:setVisible(false)
            end
        end
    end
    if self.needBrushBuff == true then
        self.needBrushBuff = false
        for k,v in pairs(self.car_node_list) do
            local infoNode = BiaoCheManager:getInfoNode(v.guildId)
            self:brushCarBuffStatus(v,infoNode)
            local status = infoNode:getPartState(4)
            if status == 1 and v.carSpeedType == 0 then
                v.effect:stop()
            else
                v.effect:resume()
            end
        end
    end
end

function BiaoCheMainLayer:brushCarBuffStatus( carNode,carInfo )
    local pos0 = carNode.tnode_buff[1]:getPositionX()
    for i=1,4 do
        local status = carInfo:getPartState(i)
        if status == 1 then
            carNode.tnode_buff[i]:setVisible(true)
        else
            carNode.tnode_buff[i]:setVisible(false)
        end
    end
    local idx = 1
    for i=1,4 do
        if carNode.tnode_buff[i]:isVisible() == true then
            carNode.tnode_buff[i]:setPositionX( pos0 + ( idx - 1 ) * 23 )
            idx = idx + 1
        end
    end
end

function BiaoCheMainLayer:_carRun(tempTime)
    if self.myCarNode == nil then
        -- print("myCarNode is nil ")
        return
    end
    -- print("tempTime = ",tempTime)
    local centerPos = 1136*0.5 - self.nCarWidth * 0.5
    local myScore = self.myInfoNode.score + tempTime * self.myInfoNode:getSpeed()
    for k,v in pairs(self.car_node_list) do
        local carScore = 0
        local carSpeed = 0
        local infoNode = BiaoCheManager:getInfoNode(v.guildId)
        if infoNode then
            carScore = infoNode:getScore(tempTime)
            carSpeed = infoNode:getSpeed()
            v.score = carScore
        end
        -- print("v.carSpeedType = ",v.carSpeedType)
        v.effect:resume()
        if v.carSpeedType == 0 then
            local targetPos = (carScore - myScore) * self.mapPosScale * self.scoreScale + centerPos
            local posXAdd = self.mapSpeedScale * (carSpeed - self.mapSpeed) * 0.015
            local old_posx = v:getPositionX()
            local posX = posXAdd + old_posx
            if carSpeed ~= 0 then
                if posX < targetPos and carSpeed < self.mapSpeed then
                    posX = targetPos
                elseif posX > targetPos and carSpeed > self.mapSpeed then
                    posX = targetPos
                end
            end
            if targetPos <= 0 - self.nCarWidth and targetPos > -500 then
                v:setPositionX(targetPos)
            elseif targetPos >= 1136 and targetPos <2500 then
                v:setPositionX(targetPos)
            elseif posX >= 0 - self.nCarWidth - 50 and posX <= 1136 + 50 then
                v:setPositionX(posX)
            end
            
        elseif v.carSpeedType == 1 then
            local posX = v:getPositionX()
            if posX > 0 - self.nCarWidth then
                local posXAdd = self.mapSpeedScale * ( - 1) * 0.015 * 2
                local posX = posXAdd + posX
                v:setPositionX(posX)
            end
        elseif v.carSpeedType == 2 then
            local posX = v:getPositionX()
            if posX < 1136 then
                local posXAdd = self.mapSpeedScale * 1 * 0.015 * 2
                local posX = posXAdd + posX
                v:setPositionX(posX)
            end
        elseif v.carSpeedType == 3 then
            local targetPos = (carScore - myScore) * self.mapPosScale * self.scoreScale + centerPos
            local posXAdd = self.mapSpeedScale * 1 * 0.015 * 2
            local posX = posXAdd + v:getPositionX()
            if posX >= targetPos then
                posX = targetPos
                v.carSpeedType = 0
                local status = infoNode:getPartState(4)
                if status == 1 then
                    v.effect:stop()
                end
            end
            v:setPositionX(posX)
        elseif v.carSpeedType == 4 then
            local targetPos = (carScore - myScore) * self.mapPosScale * self.scoreScale + centerPos
            local posXAdd = self.mapSpeedScale * ( - 1) * 0.015 * 2
            local posX = posXAdd + v:getPositionX()
            if posX <= targetPos  then
                posX = targetPos
                v.carSpeedType = 0
                local status = infoNode:getPartState(4)
                if status == 1 then
                    v.effect:stop()
                end
            end
            v:setPositionX(posX)
        end
    end
end

function BiaoCheMainLayer:BuildCarNode( infoNode )
    local carNode = self.node_car_model:clone()
    carNode:setVisible(true)
    carNode.guildId = infoNode.guildId
    carNode.effect = carNode:getChildByTag(100)
    local img_mycar = TFDirector:getChildByPath(carNode, 'img_mycar')
    local myGuildId = FactionManager:getPersonalInfo().guildId
    if myGuildId ~= 0 and infoNode.guildId == myGuildId then
        carNode.effect:playByIndex(infoNode.quality * 2-2,-1,-1,1)
        img_mycar:setVisible(true)
    else
        img_mycar:setVisible(false)
        carNode.effect:playByIndex(infoNode.quality * 2 - 1,-1,-1,1)
    end
    local tnode_buff = {}
    for i=1,4 do
        tnode_buff[i] = TFDirector:getChildByPath(carNode, 'icon_buff' .. i)
        tnode_buff[i]:setVisible(false)
    end
    carNode.tnode_buff = tnode_buff
    self:brushCarBuffStatus(carNode,infoNode)

    local Img_Biaoche = TFDirector:getChildByPath(carNode, 'Img_Biaoche')
    Img_Biaoche:setOpacity(0)
    Img_Biaoche:setTouchEnabled(true)
    Img_Biaoche.guildId = infoNode.guildId
    Img_Biaoche:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckDetailClick))
    carNode.attackTag = TFDirector:getChildByPath(carNode, 'img_jihuo')
    local attackId = BiaoCheManager:getConvergeGuildId()
    if attackId and attackId ~= 0 and infoNode.guildId == attackId then
        carNode.attackTag:setVisible(true)
    else
        carNode.attackTag:setVisible(false)
    end
    self.posIndex = self.posIndex + 1
    if self.posIndex > BiaoCheManager:getCarNodePosDataSize() then
        self.posIndex = 1
    end
    return carNode
end

function BiaoCheMainLayer:getCarNodeById(guildId)
    if self.car_node_list == nil then
        self.car_node_list = {}
    end
    for _k,_v in pairs(self.car_node_list) do
        if guildId == _v.guildId then
            return _v,_k
        end
    end
    return nil,nil
end

function BiaoCheMainLayer:showRankList( type )
    self.rankType = type
    for i=1,3 do
        if i == type then
            self.tPanel_list[i]:setVisible(true)
        else
            self.tPanel_list[i]:setVisible(false)
        end
    end
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
    self:refreshMyRankInfo()
    local tBtnPath_y = {
        "ui_new/faction/biaoche/tip_hdph_y.png",
        "ui_new/faction/biaoche/tip_jpph_y.png",
        "ui_new/faction/biaoche/tip_cdbp_y.png"
    }
    local tBtnPath_h = {
        "ui_new/faction/biaoche/tip_hdph_h.png",
        "ui_new/faction/biaoche/tip_jpph_h.png",
        "ui_new/faction/biaoche/tip_cdbp_h.png"
    }
    for i=1,3 do
        if i == self.rankType then
            self.tBtn_RankTab[i]:setTextureNormal(tBtnPath_h[i])
        else
            self.tBtn_RankTab[i]:setTextureNormal(tBtnPath_y[i])
        end
    end
end

function BiaoCheMainLayer:cellSizeForTable(table,idx)
    return 51,518
end

function BiaoCheMainLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
        cell.panel = {}
    end
    self:setCellInfo(cell,idx)
    return cell
end

function BiaoCheMainLayer:numberOfCellsInTableView(table)
    local num = BiaoCheManager:getRankListSize(self.rankType)
    if num < 0 then num = 0 end
    return num
end

function BiaoCheMainLayer:setCellInfo(cell,idx)
    local _type = self.rankType
    if cell.panel[_type] == nil then
        local node = self.tNode_cell_model[_type]:clone()
        node:setVisible(true)
        node:setPosition(ccp(267,25))
        cell.panel[_type] = node
        cell:addChild(node)
    end
    for i=1,3 do
        if cell.panel[i] then
            if i == _type then
                cell.panel[i]:setVisible(true)
            else
                cell.panel[i]:setVisible(false)
            end
        end
    end
    local rankInfo = BiaoCheManager:getRankList(_type,idx)
    self:drawCellInfo(_type,cell.panel[_type],rankInfo)
end

function BiaoCheMainLayer:drawCellInfo( _type,node,rankInfo )
    
    if _type == 1 then
        self:_drawCellInfo_1( _type,node,rankInfo )
        return
    elseif _type == 2 then
        self:_drawCellInfo_2( _type,node,rankInfo )
        return
    elseif _type == 3 then
        self:_drawCellInfo_3( _type,node,rankInfo )
        return
    end
    node:setVisible(false)
end

function BiaoCheMainLayer:_drawCellInfo_1( _type,node,rankInfo )
    local txt_paiming = TFDirector:getChildByPath(node, 'txt_paiming')
    local txt_bangpainame = TFDirector:getChildByPath(node, 'txt_bangpainame')
    local txt_juli = TFDirector:getChildByPath(node, 'txt_juli')
    local img_jihuo = TFDirector:getChildByPath(node, 'img_jihuo')
    local btn_xiang = TFDirector:getChildByPath(node, 'btn_xiang')
    btn_xiang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckDetailClick))
    btn_xiang.logic = self
    btn_xiang.guildId = rankInfo.cardInfo.guildId
    local tblName = {'img_hu','img_qi','img_lun','img_xiang'}
    txt_paiming:setText(rankInfo.rank)
    local serverId = math.mod(rankInfo.serverId,1000)
    txt_bangpainame:setText('S' .. serverId .. rankInfo.guildName)
    txt_juli:setText(rankInfo.cardInfo.score .. localizable.Biaochemainlayer_Zhang)
    if rankInfo.cardInfo.guildId == BiaoCheManager:getConvergeGuildId() then
        img_jihuo:setVisible(true)
    else
        img_jihuo:setVisible(false)
    end
    local imgPath = {
        'ui_new/faction/biaoche/img_hu_l.png',
        'ui_new/faction/biaoche/img_qi_l.png',
        'ui_new/faction/biaoche/img_lun_l.png',
        'ui_new/faction/biaoche/img_xiang_l.png'
    }
    local imgPath_h = {
        'ui_new/faction/biaoche/img_hujia_h.png',
        'ui_new/faction/biaoche/img_qi_h.png',
        'ui_new/faction/biaoche/img_lun_h.png',
        'ui_new/faction/biaoche/img_xiang_h.png'
    }
    for k,v in pairs(rankInfo.cardInfo.partInfo) do
        if v and v.status == 1 then
            imgPath[v.type] = imgPath_h[v.type]
        end
    end
    for i=1,4 do
        local img_node = TFDirector:getChildByPath(node, tblName[i])
        img_node:setTexture(imgPath[i])
    end
end

function BiaoCheMainLayer:_drawCellInfo_2( _type,node,rankInfo )
    local txt_paiming = TFDirector:getChildByPath(node, 'txt_paiming')
    local txt_bangpainame = TFDirector:getChildByPath(node, 'txt_bangpainame')
    local txt_juli = TFDirector:getChildByPath(node, 'txt_juli')
    local txt_Killnumber = TFDirector:getChildByPath(node, 'txt_Killnumber')
    local img_jihuo = TFDirector:getChildByPath(node, 'img_jihuo')
    img_jihuo:setVisible(false)

    txt_paiming:setText(rankInfo.rank)
    txt_juli:setText(rankInfo.power)
    txt_Killnumber:setText(rankInfo.killCount)
    local serverId = math.mod(rankInfo.serverId,1000)
    txt_bangpainame:setText('S' .. serverId .. rankInfo.playerName)
end   

function BiaoCheMainLayer:_drawCellInfo_3( _type,node,rankInfo )
    local txt_bangpainame = TFDirector:getChildByPath(node, 'txt_bangpainame')
    local img_jihuo = TFDirector:getChildByPath(node, 'img_jihuo')
    local btn_xiang = TFDirector:getChildByPath(node, 'btn_xiang')
    local txt_time = TFDirector:getChildByPath(node, 'txt_time')
    btn_xiang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckDetailClick))
    btn_xiang.logic = self
    btn_xiang.guildId = rankInfo.cardInfo.guildId
    local serverId = math.mod(rankInfo.serverId,1000)
    txt_bangpainame:setText('S' .. serverId .. rankInfo.guildName)

    if rankInfo.cardInfo.guildId == BiaoCheManager:getConvergeGuildId() then
        img_jihuo:setVisible(true)
    else
        img_jihuo:setVisible(false)
    end

    local tblName = {'img_hu','img_qi','img_lun','img_xiang'}
    local imgPath = {
        'ui_new/faction/biaoche/img_hu_l.png',
        'ui_new/faction/biaoche/img_qi_l.png',
        'ui_new/faction/biaoche/img_lun_l.png',
        'ui_new/faction/biaoche/img_xiang_l.png'
    }
    local imgPath_h = {
        'ui_new/faction/biaoche/img_hujia_h.png',
        'ui_new/faction/biaoche/img_qi_h.png',
        'ui_new/faction/biaoche/img_lun_h.png',
        'ui_new/faction/biaoche/img_xiang_h.png'
    }
    for k,v in pairs(rankInfo.cardInfo.partInfo) do
        if v and v.status == 1 then
            imgPath[v.type] = imgPath_h[v.type]
        end
    end
    for i=1,4 do
        local img_node = TFDirector:getChildByPath(node, tblName[i])
        img_node:setTexture(imgPath[i])
    end

    local battleTime = rankInfo.time
    local time = (MainPlayer:getNowtime() - battleTime)/60
    local timeType = localizable.time_minute_txt..localizable.shalurecord_txt2
    if time < 0 then time = 1 end
    if time > 60 then 
        timeType = localizable.time_hour_txt..localizable.shalurecord_txt2
        time = time / 60
        if time > 24 then
            timeType = localizable.time_day_txt..localizable.shalurecord_txt2
            time = time / 24
        end
    end
    
    txt_time:setText(math.floor(time)..timeType)
end 

function BiaoCheMainLayer:showRestColdTime()
    local restTime = BiaoCheManager:getRestTime() or 0
    local coldTime = self.RestColdTime
    local nowTime = MainPlayer:getNowtime()
    local leftTime = restTime + coldTime - nowTime

    if leftTime > 0 then
        local hour = math.floor(leftTime/3600)
        leftTime = leftTime - hour * 3600
        local min = math.floor(leftTime/60)
        local sec = leftTime - min * 60
        self.txt_shuoming:setText(string.format(localizable.Biaochemainlayer_reset_3,hour,min,sec))
    else
        self.txt_shuoming:setText("")
    end


    local date = GetCorrectDate("*t", MainPlayer:getNowtime())
    if date.wday == 1 then
        date.wday = 8
    end
    local wday = date.wday - 2

    local nowTime = wday*(24*60*60) + (date.hour*60 + date.min)*60 + date.sec

    leftTime = self.EndDesTime - nowTime
    if leftTime < 0 then
        leftTime = 0
    end
    local hour = math.floor(leftTime/3600)
    leftTime = leftTime - hour * 3600
    local min = math.floor(leftTime/60)
    local sec = leftTime - min * 60
    self.txt_resttime:setText(string.format("%02d:%02d:%02d",hour,min,sec))
end

function BiaoCheMainLayer:refreshMyRankInfo()
    local rankInfo = BiaoCheManager:getMyRankInfo(self.rankType)
    local node = self.tPanel_list[self.rankType]
    if self.rankType == 1 then
        local txt_mypaiming = TFDirector:getChildByPath(node, 'txt_mypaiming')
        local txt_myjuli = TFDirector:getChildByPath(node, 'txt_myjuli')
        local btn_xiang = TFDirector:getChildByPath(node, 'btn_xiang')
        btn_xiang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckDetailClick))
        btn_xiang.logic = self
        local txt_nocheingame = TFDirector:getChildByPath(node, 'txt_nocheingame')
        local txt_noinrank = TFDirector:getChildByPath(node, 'txt_noinrank')
        local txt_benbang = TFDirector:getChildByPath(node, 'txt_benbang')
 
        local tblName = {'img_hu','img_qi','img_lun','img_xiang'}
        local imgPath = {
            'ui_new/faction/biaoche/img_hu_l.png',
            'ui_new/faction/biaoche/img_qi_l.png',
            'ui_new/faction/biaoche/img_lun_l.png',
            'ui_new/faction/biaoche/img_xiang_l.png'
        }
        local imgPath_h = {
            'ui_new/faction/biaoche/img_hujia_h.png',
            'ui_new/faction/biaoche/img_qi_h.png',
            'ui_new/faction/biaoche/img_lun_h.png',
            'ui_new/faction/biaoche/img_xiang_h.png'
        }
        if self.myInfoNode == nil or self.myInfoNode.guildId == nil then
            for i=1,4 do
                local img_node = TFDirector:getChildByPath(node, tblName[i])
                img_node:setVisible(false)
            end
            btn_xiang:setVisible(false)

            txt_mypaiming:setText("")
            txt_myjuli:setText("")
            txt_noinrank:setVisible(false)
            txt_nocheingame:setVisible(true)
            txt_benbang:setVisible(false)
        else
            txt_nocheingame:setVisible(false)
            txt_benbang:setVisible(true)
            for i=1,4 do
                if self.myInfoNode:getPartState(i) == 1 then
                    imgPath[i] = imgPath_h[i]
                end
                local img_node = TFDirector:getChildByPath(node, tblName[i])
                img_node:setVisible(true)
                img_node:setTexture(imgPath[i])
            end
            btn_xiang:setVisible(true)
            btn_xiang.guildId = self.myInfoNode.guildId
            if rankInfo and rankInfo.rank and rankInfo.rank > 0 then
                txt_noinrank:setVisible(false)
                txt_mypaiming:setText(rankInfo.rank)
                txt_myjuli:setText(rankInfo.lastScore .. localizable.Biaochemainlayer_Zhang)
            else
                txt_noinrank:setVisible(true)
                txt_mypaiming:setText("")
                txt_myjuli:setText(0 .. localizable.Biaochemainlayer_Zhang)
            end
        end
    elseif self.rankType == 2 then
        local txt_mypaiming = TFDirector:getChildByPath(node, 'txt_mypaiming')
        local txt_myKillnumber = TFDirector:getChildByPath(node, 'txt_myKillnumber')
        local txt_noinrank = TFDirector:getChildByPath(node, 'txt_noinrank')
        if rankInfo and rankInfo.rank and rankInfo.rank > 0 then
            txt_myKillnumber:setText(rankInfo.lastScore)
            txt_mypaiming:setText(rankInfo.rank)
            txt_noinrank:setVisible(false)
        else
            txt_mypaiming:setText('')
            txt_noinrank:setVisible(true)
            txt_myKillnumber:setText(0)
        end
    elseif self.rankType == 3 then

    end
end

function BiaoCheMainLayer.onCheckDetailClick( sender )
    local self = sender.logic
    local guildId = sender.guildId
    if guildId == nil or guildId == 0 then
        return
    end
    BiaoCheManager:requestCarDetailInfo(guildId)
end

function BiaoCheMainLayer.onRankTabClick( sender )
    local self = sender.logic
    local rankType = sender.idx
    if rankType == self.rankType then
        return
    end
    
    self:showRankList(rankType)
end

function BiaoCheMainLayer.onRankBtnClick( sender )
    local self = sender.logic
    local posY = self.Panel_paihang:getPositionY()
    if self.rankState == 0 then
        self.rankState = 1
        self:showRankList(self.rankState)
        self.Panel_paihang:stopAllActions()
        local size = self.Panel_paihang:getSize()
        self.Panel_paihang:runAction(CCMoveTo:create(0.3,ccp(self.Panel_Paihang_Pos - size.width ,posY)))
    elseif self.rankState == 1 then
        self.rankState = 0
        self.Panel_paihang:stopAllActions()
        self.Panel_paihang:runAction(CCMoveTo:create(0.3,ccp(self.Panel_Paihang_Pos,posY)))
    end
end

function BiaoCheMainLayer.onSignClick( sender )
    local myGuildId = FactionManager:getPersonalInfo().guildId
    if myGuildId == 0 then
        toastMessage(localizable.BiaoCheBaoMing_txt1)
        return
    end
    local myInfoNode = BiaoCheManager:getMyInfoNode()
    if myInfoNode == nil or myInfoNode.guildId == nil then
        toastMessage(localizable.BiaoCheBaoMing_txt0)
        return
    end
    local gold = ConstantData:objectByID("EscortAgencyLateFill").value
    if MainPlayer:isEnoughSycee(gold,true) == false then
        return
    end
    BiaoCheManager:requestSignUpInfo()
end

function BiaoCheMainLayer.onArmyClick( sender )
    local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.army.ArmyLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    local txt = TFDirector:getChildByPath(layer.ui, 'txt_shengxiao')
    txt:setVisible(true)
    layer:setCanOpenInfo(true)
    AlertManager:show()

    --为了区分和血战的缘分系统 add by king
    --更新所有缘分
    CardRoleManager:UpdateRoleFate()
end

function BiaoCheMainLayer.onAttackDetailClick( sender )
    local guildId = BiaoCheManager:getAttackGuildId()
    if guildId and guildId ~= 0 then
        BiaoCheManager:requestCarDetailInfo(guildId,true)
    else
        toastMessage(localizable.Biaochemainlayer_attack_null)
    end
end

function BiaoCheMainLayer.onResetClick( sender )
    local restTime = BiaoCheManager:getRestTime()
    local coldTime = ConstantData:objectByID("EscortAgencyRestInTime").value
    local costNum = ConstantData:objectByID("EscortAgencyRest").value
    local tipMsg = localizable.Biaochemainlayer_reset_2
    local leftTime = restTime + coldTime - MainPlayer:getNowtime()
    if leftTime > 0 then
        tipMsg = stringUtils.format(localizable.Biaochemainlayer_reset,costNum)
    end
    local layer = CommonManager:showOperateSureTipLayer(
        function(data, widget)
            local state = widget:getSelectedState();
            if state == true then
                BiaoCheManager:requestRest(1)
            else
                BiaoCheManager:requestRest(0)
            end
            --AlertManager:close()
        end,
        function(data, widget)
            AlertManager:close()
        end,
        {
            title=localizable.common_tips,
            msg =  tipMsg,
            showtype = AlertManager.BLOCK_AND_GRAY_CLOSE
        }
    )
    local txt_tip = TFDirector:getChildByPath(layer, 'Label_Game_1')
    txt_tip:setText(localizable.Biaochemainlayer_reset_1)
end

function BiaoCheMainLayer.onRuleClick( sender )
    CommonManager:showRuleLyaer('biaoxingtianxia2')
end

function BiaoCheMainLayer.onRewardClick( sender )
    BiaoCheManager:openRewardLayer()
end

function BiaoCheMainLayer:onShow()
    self.super.onShow(self)
    self.myInfoNode = BiaoCheManager:getMyInfoNode()
    if BiaoCheManager:getIsSign() == true then
        self.btn_fangshoubaoming:setVisible(false)
        self.img_yuanbaobg:setVisible(false)
    else
        self.btn_fangshoubaoming:setVisible(true)
        self.img_yuanbaobg:setVisible(true)
    end
end

function BiaoCheMainLayer:registerEvents()
    self.super.registerEvents(self)
    ADD_ALERT_CLOSE_LISTENER(self,self.btn_close)

    for i=1,3 do
        local btn = self.tBtn_RankTab[i]
        btn.idx = i
        btn.logic = self
        btn:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRankTabClick))
    end
    self.panel_move:setTouchEnabled(true)
    self.panel_move.logic = self
    self.panel_move:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRankBtnClick))

    self.btn_fangshoubaoming:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSignClick))
    self.btn_jingongzhenrong:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onArmyClick))
    self.btn_jingongxiangqing:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAttackDetailClick))
    self.btn_jingongxiuzheng:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onResetClick))

    self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRuleClick))
    self.btn_reward:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRewardClick))

    self.receiveMainInfo = function(event)
        if self.rankState == 1 then
            self:showRankList(self.rankType)
        end
        BiaoCheManager:requestMyAttackDetail()
        self.needBrushBuff = true
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_MAIN_INFO, self.receiveMainInfo)

    self.receiveConverge = function(event)
        if self.tableView then
            self.tableView:reloadData()
        end
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_CONVERGE_INFO, self.receiveConverge)

    self.receiveMyAttackDetail = function(event)
        self:drawAttackInfo()
    end
    TFDirector:addMEGlobalListener(BiaoCheManager.RECEIVE_MY_ATTACK_STATE, self.receiveMyAttackDetail)

    self.receivePushMsg = function(event)
        local pushMsg = event.data[1]
        if #(self.PushMsgList) >= 20 then
            table.remove(self.PushMsgList,1)
        end
        table.insert(self.PushMsgList,pushMsg)
        if self.isPushing == true then
            return
        end
        self:pushNextMsg()
    end
    TFDirector:addMEGlobalListener(NotifyManager.NOTIFY_31_MSG, self.receivePushMsg)
end

function BiaoCheMainLayer:pushNextMsg()
    if #(self.PushMsgList) <= 0 then
        return
    end
    local curMsg = self.PushMsgList[1]
    if curMsg then
        self.isPushing = true
        table.remove(self.PushMsgList,1)
        local serverId = curMsg.serverId
        serverId = math.mod(serverId,1000)
        self.txt_name_bb:setText("S" .. serverId .. " " .. curMsg.playerName)
        local roleData = RoleData:objectByID(curMsg.icon)
        if roleData == nil then
            roleData = RoleData:objectByID(77)
        end
        self.img_head_bb:setTexture(roleData:getIconPath())
        Public:addFrameImg(self.img_head_bb,curMsg.head)
        local msgFormat = localizable.Biaochemainlayer_pushmsg1
        if curMsg._type == 2 then
            msgFormat = localizable.Biaochemainlayer_pushmsg2
        end
        self.txt_lianji_bb:setText(stringUtils.format(msgFormat,curMsg.killNum))

        self.ui:setAnimationCallBack("Action0", TFANIMATION_END, function()
            self.isPushing = false
            self:pushNextMsg()
        end)
        self.ui:runAnimation("Action0",1);
    end
end

function BiaoCheMainLayer:drawAttackInfo()
    local playerData = BiaoCheManager:getMyPlayerData()
    if playerData then
        if playerData.hpPer > 0 and playerData.isInBreak == 1 then
            self.tMyInfoNode.panel:setVisible(false)
            self.btn_jingongxiuzheng:setTextureNormal("ui_new/faction/biaoche/btn_jgxz.png")
            return
        end
        self.tMyInfoNode.panel:setVisible(true)
        if playerData.hpPer > 0 then
            self.btn_jingongxiuzheng:setTextureNormal("ui_new/faction/biaoche/btn_jgxz.png")
        else
            self.btn_jingongxiuzheng:setTextureNormal("ui_new/faction/biaoche/btn_jgxz_h.png")
        end
        local roleData =  RoleData:objectByID(playerData.useCoin)
        if (roleData == nil) then
            roleData =  RoleData:objectByID(77)
        end
        self.tMyInfoNode.img_touxiang:setTexture(roleData:getIconPath())
        Public:addFrameImg(self.tMyInfoNode.img_touxiang,playerData.frameId,true)
        if playerData.hpPer <= 0 then
            self.tMyInfoNode.img_tou:setShaderProgram("GrayShader", true)
            self.tMyInfoNode.txt_zhandouzhong:setText(localizable.BiaoCheBaoMyInfo_txt3)
            self.tMyInfoNode.txt_xueliang:setText(localizable.BiaoCheBaoMyInfo_txt4)
        else
            self.tMyInfoNode.img_tou:setShaderProgramDefault(true)
            self.tMyInfoNode.txt_zhandouzhong:setText(localizable.BiaoCheBaoMyInfo_txt1)
            self.tMyInfoNode.txt_xueliang:setText(localizable.BiaoCheBaoMyInfo_txt2 .. playerData.hpPer .. "%")
        end
    else
        self.tMyInfoNode.panel:setVisible(false)
        self.btn_jingongxiuzheng:setTextureNormal("ui_new/faction/biaoche/btn_jgxz.png")
    end
end

function BiaoCheMainLayer:removeEvents()
    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_ATTACK_INFO, self.receiveMainInfo)
    TFDirector:removeMEGlobalListener(NotifyManager.NOTIFY_31_MSG, self.receivePushMsg)
    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_CONVERGE_INFO, self.receiveConverge)
    TFDirector:removeMEGlobalListener(BiaoCheManager.RECEIVE_MY_ATTACK_STATE, self.receiveMyAttackDetail)
    self.super.removeEvents(self)
end

return BiaoCheMainLayer