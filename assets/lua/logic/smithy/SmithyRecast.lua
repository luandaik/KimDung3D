--[[
******装备重铸界面*******
	-- by quanhuan
	-- 2016/1/14
]]

local SmithyRecast = class("SmithyRecast", BaseLayer)

function SmithyRecast:ctor(gmId)
    self.super.ctor(self,data)
    self.gmId = gmId
    local equip = EquipmentManager:getEquipByGmid(gmId)
    self.equipName = equip.name
    self.equipList = EquipmentManager:getEquipListByID(equip.id,gmId,true)
    self.selectGmId = 0
    self:resetSelectIconIdx(equip)
    local cost = ConstantData:objectByID("Practice.lock.orange") or {}
    if equip.quality == 4 then
    	cost = ConstantData:objectByID("Practice.lock.Violet") or {}
    end

    self.lockCostNum = cost.value or 0
    self.lockInfo = {}
    self:init("lua.uiconfig_mango_new.smithy.Chongzhu")

    local equip = EquipmentManager:getEquipByGmid(self.gmId)
	if (equip == nil) or (equip and equip.quality < 4) then
		self.scroll_right:setVisible(false)
		self.img_notice:setVisible(true)
	else
		self.scroll_right:setVisible(true)
		self.img_notice:setVisible(false)
	end

	local contentSize = self.ui:getContentSize()
	self.effectOffsetX = contentSize.width/2
	self.effectOffsetY = contentSize.height/2 + 60

	self.extraOldState = {}
	self.info_panel:setEquipGmId(self.gmId)    
	self:updateLevel()
	self.info_panel:onShow()
end

function SmithyRecast:initUI(ui)
	self.super.initUI(self,ui)
	--左侧详情
	self.scroll_left			= TFDirector:getChildByPath(ui, 'scroll_left')
	self.info_panel				= require('lua.logic.smithy.EquipInfoPanel'):new(self.gmId)
	self.scroll_left:addChild(self.info_panel)

	self.scroll_right = TFDirector:getChildByPath(ui, 'scroll_right')
	self.img_notice = TFDirector:getChildByPath(ui, 'img_notice')


	self.btn_chongzhu = TFDirector:getChildByPath(ui, 'btn_chongzhu')
	self.btn_help = TFDirector:getChildByPath(ui, 'btn_help')
	self.txt_alladds = TFDirector:getChildByPath(ui,'txt_alladd')

	self.btnTable = {}
	for i=1,5 do
		self.btnTable[i] = {}
		local btnNode = TFDirector:getChildByPath(ui, 'btn_k'..i)
		self.btnTable[i].btnNode = TFDirector:getChildByPath(ui, 'btn_k'..i)

		self.btnTable[i].imgEquip = TFDirector:getChildByPath(btnNode, 'img_zhuangbei')
		self.btnTable[i].txtQuality = TFDirector:getChildByPath(btnNode, 'txt_pinzhi')
		self.btnTable[i].imgArraw = TFDirector:getChildByPath(btnNode, 'icon_xuanzhong')
		self.btnTable[i].icon_suo = TFDirector:getChildByPath(btnNode, 'icon_suo')		
		self.btnTable[i].icon_jia = TFDirector:getChildByPath(btnNode, 'icon_jia')
	end

	local selectNode = TFDirector:getChildByPath(ui, 'img_select')
	self.selectIconNode = TFDirector:getChildByPath(ui, 'img_select')
	self.selectIconEquip = TFDirector:getChildByPath(selectNode, 'img_zhuangbei')

	self.txt_add = TFDirector:getChildByPath(ui, 'txt_add')

	self.txt_fujiaBg = {}
	self.txt_fujia = {}
	self.txt_fujiaFlag = {}
	for i=1,2 do
		local extraAttrNode = TFDirector:getChildByPath(ui, 'bg_ew'..i)
		self.txt_fujiaBg[i] = TFDirector:getChildByPath(ui, 'bg_ew'..i)
		self.txt_fujia[i] = TFDirector:getChildByPath(extraAttrNode, 'txt_fujia'..i)
		self.txt_fujiaFlag[i] = TFDirector:getChildByPath(extraAttrNode, 'txt_wjh'..i)
	end

	--check_attr
	-- local lockCossNode = TFDirector:getChildByPath(ui, 'bg_coss')
	-- self.checkBox = TFDirector:getChildByPath(ui, 'check_attr')
	-- self.lockCoss = TFDirector:getChildByPath(lockCossNode, 'txt_cost')
	
	self.equipCost = TFDirector:getChildByPath(ui,'txt_coss')
	self.bg_xiaohao = TFDirector:getChildByPath(ui,'bg_xiaohao')
	self.img_zhuangbei = TFDirector:getChildByPath(self.bg_xiaohao,'img_zhuangbei')

	self.txt_fjadd = TFDirector:getChildByPath(ui, 'txt_fjadd')
	
	self.bg_xiaohao:setTouchEnabled(true)

    self.equipCost2 = TFDirector:getChildByPath(ui, 'txt_coss2')
    self.bg_xiaohao2 = TFDirector:getChildByPath(ui,'bg_xiaohao2')
    self.img_zhuangbei2 = TFDirector:getChildByPath(self.bg_xiaohao2,'img_zhuangbei')
    self.icon_info = TFDirector:getChildByPath(ui, "icon_info")
    self.icon_info2 = TFDirector:getChildByPath(ui, "icon_info2")

    self.txt_cost = {self.equipCost2, self.equipCost}
    self.bg_cost = {self.bg_xiaohao2, self.bg_xiaohao}
    self.img_equip = {self.img_zhuangbei2, self.img_zhuangbei}
    self.icon_info = {self.icon_info2, self.icon_info}
end

function SmithyRecast:onShow()
	self.super.onShow(self)
	
    self:refreshUI()  
    self:refreshConsume(self.selectIdx or 1)  
end

function SmithyRecast:dispose()
	self.info_panel:dispose()
	self.super.dispose(self)
end

function SmithyRecast:refreshUI()

end

function SmithyRecast:removeUI()
	self.super.removeUI(self)
end

function SmithyRecast:setEquipGmId(gmId)
	print('setEquipGmId ========================',gmId)
	self:clearEffect()
	self.gmId = gmId
	local equip = EquipmentManager:getEquipByGmid(gmId)
	self.equipName = equip.name
	self.equipList = EquipmentManager:getEquipListByID(equip.id,gmId,true)
	self.selectGmId = 0	
	self:resetSelectIconIdx(equip)
	self.lockInfo = {}
	local cost = ConstantData:objectByID("Practice.lock.orange") or {}
    if equip.quality == 4 then
    	cost = ConstantData:objectByID("Practice.lock.Violet") or {}
    end    
    -- print('equip = ',equip)
    self.lockCostNum = cost.value or 0
	-- self:refreshUI()
	self.info_panel:setEquipGmId(self.gmId)    
	self:updateLevel()
	self.info_panel:onShow()

	local equip = EquipmentManager:getEquipByGmid(self.gmId)
	if (equip == nil) or (equip and equip.quality < 4) then
		self.scroll_right:setVisible(false)
		self.img_notice:setVisible(true)
	else
		self.scroll_right:setVisible(true)
		self.img_notice:setVisible(false)
	end	
    
    if equip and equip:isCanRecaseGoOnByPos(self.selectIdx) == false then
        self.btn_chongzhu:setTouchEnabled(false)
        self.btn_chongzhu:setGrayEnabled(true)
    else
        self.btn_chongzhu:setTouchEnabled(true)
        self.btn_chongzhu:setGrayEnabled(false)
    end
end

function SmithyRecast:resetSelectIconIdx(equip)
	self.selectIdx = 1
	for i=1,5 do
		local info = equip:getRecastInfoByIdx(i)
		if info == nil then
			self.selectIdx = i
			-- print('for = self.selectIdx = ',self.selectIdx)
			break
		end
	end	
	if equip:isCanTouchByPos(self.selectIdx) == false then
		self.selectIdx = 1
		-- print('isCanTouchByPos = self.selectIdx = ',self.selectIdx)
	end
end

function SmithyRecast:updateLevel()
	local equip = EquipmentManager:getEquipByGmid(self.gmId)
	self:initIconTable()
    if equip == nil  then
        print("equipment not found .",self.gmId)
        return false
    end

    local equipmentTemplate = EquipmentTemplateData:objectByID(equip.id)
    if equipmentTemplate == nil then
        print("没有此类装备模板信息")
        return
    end

    local recastInfo = equip:getRecastInfo() or {}
    for i=1,5 do    	
    	local iconInfo = recastInfo[i]
    	if iconInfo then
    		local idx = iconInfo.index
    		self.btnTable[idx].icon_suo:setVisible(false)
    		self.btnTable[idx].icon_jia:setVisible(false)
	    	self.btnTable[idx].imgEquip:setVisible(true)
			self.btnTable[idx].imgEquip:setTexture(equip:GetTextrue())
			self.btnTable[idx].txtQuality:setVisible(true)
			local qualityTitle = EquipmentRecastData:getDescribe(iconInfo.quality)	
			if qualityTitle then	
				self.btnTable[idx].btnNode:setTextureNormal('ui_new/smithy/cz_gezi'..iconInfo.quality..'.png')
				self.btnTable[idx].txtQuality:setText(qualityTitle)
			else
				self.btnTable[idx].txtQuality:setVisible(false)
			end
    	elseif equip:isCanTouchByPos(i) then
    		--解开锁
    		self.btnTable[i].icon_suo:setVisible(false)
    		if iconInfo == nil then
    			self.btnTable[i].icon_jia:setVisible(true)
    		end
    	end	    
	end

    self.txt_alladds:setText('+'..equip.recastPercent..'%')
    self.txt_fjadd:setText('+'..equip.extraPercent..'%')

	self:showSelectIcon( self.selectIdx )	   
    
    -- local newAdd = 


    if equip:getTotalGemNum() > 1 then
    	self.txt_fujiaBg[1]:setVisible(true)
    	self.txt_fujia[1]:setText(EquipmentRecastSubAddData:getDescribeBySubtype(1))
    	self.txt_fujiaFlag[1]:setVisible(false)
    end
    if (equip.quality == 5 and equip:getTotalExtraAttrNum() > 3) or (equip.quality == 4 and equip:getTotalExtraAttrNum() > 2) then
    	self.txt_fujia[2]:setText(EquipmentRecastSubAddData:getDescribeBySubtype(2))
    	self.txt_fujiaBg[2]:setVisible(true)
    	self.txt_fujiaFlag[2]:setVisible(false)
    end  
    self:refreshConsume(self.selectIdx)  
end

function SmithyRecast:refreshConsume(index)
    self.toolNum1 = 0
    self.toolNum2 = 0
    local equip = EquipmentManager:getEquipByGmid(self.gmId)
    if not equip then
        print("equipment not found .",self.gmId)
        return false
    end
       
    for i = 1, 2 do
        self.txt_cost[i]:setVisible(false)     
        self.bg_cost[i]:setVisible(false)     
        self.img_equip[i]:setVisible(false)   
        self.icon_info[i]:setVisible(false)
    end

    local levelTab = equip:getPercentByIndex( index ) or {}
    local ratio = levelTab.ratio or 0
    local recastLevel = math.floor(ratio / 100)
    local recastItem = EquipRecastConsumeData:getConsumeItem(recastLevel, equip.quality)
    self.recastItem = recastItem
    if not recastItem then
        return
    end

    local consumeTab = recastItem:getConsume()
    local function setIcons()
        if self.selectGmId and self.selectGmId >= 0 then
            local consume2 = consumeTab:objectAt(1)
            if not consume2 then
                return
            end
            local id2 = consume2.itemid or 0
            local totalNum2 = BagManager:getItemNumById(id2)
            local needNum2 = consume2.number
            self.txt_cost[1]:setText(totalNum2 .. "/" .. needNum2)
            self.bg_cost[1]:setTexture(GetColorIconByQuality(consume2.quality))
            self.img_equip[1]:setTexture(consume2.path)
            self.toolNum1 = totalNum2

            local data = consumeTab:objectAt(2)
            if not data then
                return
            end
            local itemid = data.itemid or 0
            local num = BagManager:getItemNumById(itemid)
            if data and num > 0 and self.selectGmId == 0 then
                local needNum = data.number
                self.txt_cost[2]:setText(num .. "/" .. needNum)
                self.bg_cost[2]:setTexture(GetColorIconByQuality(data.quality))
                self.img_equip[2]:setTexture(data.path)
                local item = BagManager:getItemById(itemid)

                self.selectGmId = -1
                self.toolNum2    = num
            else
                local id1 = equip.id
                local item = ItemData:objectByID(id1)
                local list = EquipmentManager:getEquipListByID(equip.id, self.gmId) 
                local totalNum1 = list:length()
                self.txt_cost[2]:setText(totalNum1 .. "/" .. 1)
                self.bg_cost[2]:setTexture(GetColorIconByQuality(equip.quality))
                self.img_equip[2]:setTexture(item:GetPath())
            end
        else
            for i = 1, 2 do
                local consume = consumeTab:objectAt(i)
                if not consume then
                    break
                end

                local id = consume.itemid or 0
                local totalNum = BagManager:getItemNumById(id)
                local needNum = consume.number or 1
                self.txt_cost[i]:setText(totalNum .. "/" .. needNum)
                self.bg_cost[i]:setTexture(GetColorIconByQuality(consume.quality))
                self.img_equip[i]:setTexture(consume.path)

                if i == 1 then
                    self.toolNum1 = totalNum
                else
                    if totalNum > 0 then
                        self.toolNum2 = totalNum
                    elseif (equip.special_equipment ~= 1) then
                        --addtest1
                        local id1 = equip.id
                        local item = ItemData:objectByID(id1)
                        local list = EquipmentManager:getEquipListByID(equip.id, self.gmId) 
                        local totalNum1 = list:length()
                        self.txt_cost[2]:setText(totalNum1 .. "/" .. 1)
                        self.bg_cost[2]:setTexture(GetColorIconByQuality(equip.quality))
                        self.img_equip[2]:setTexture(item:GetPath())
                        self.selectGmId = 0
                    end
                end
            end
        end
    end

    local bChange = recastItem:getChange()
    if bChange then
        self.icon_info[2]:setVisible(true)
        for i = 1, 2 do
            self.txt_cost[i]:setVisible(true)     
            self.bg_cost[i]:setVisible(true)     
            self.img_equip[i]:setVisible(true) 
        end
    else
        self.txt_cost[1]:setVisible(true)     
        self.bg_cost[1]:setVisible(true)     
        self.img_equip[1]:setVisible(true) 
    end 
    setIcons()
end

function SmithyRecast:showSelectIcon( idx )
	local equip = EquipmentManager:getEquipByGmid(self.gmId)
	local selectRecast = equip:getPercentByIndex(idx)
	if selectRecast == nil then
		self.selectIconNode:setTexture('ui_new/smithy/cz_gezi0.png')
	else
		self.selectIconNode:setTexture('ui_new/smithy/cz_gezi'..selectRecast.quality..'.png')
	end
    self.selectIconEquip:setTexture(equip:GetTextrue())
    if selectRecast then
    	self.selectIconEquip:setVisible(true)
    	local currValue = selectRecast.ratio/100
    	self.txt_add:setText('+'..currValue..'%')
    else
    	self.selectIconEquip:setVisible(false)
    	self.txt_add:setText('+0%')
    end
    if self.btnTable[idx] then
    	self.btnTable[idx].imgArraw:setVisible(true)
    end
    -- if self.lockInfo[self.selectIdx] then
    -- 	self.checkBox:setSelectedState(true)
    -- else
    -- 	self.checkBox:setSelectedState(false)
    -- end
    self.selectGmId = -1
    self:refreshConsume(idx)
end
function SmithyRecast:initIconTable()
	for i=1,5 do
		self.btnTable[i].btnNode:setTextureNormal('ui_new/smithy/cz_gezi0.png')
		self.btnTable[i].imgEquip:setVisible(false)
		self.btnTable[i].txtQuality:setVisible(false)
		self.btnTable[i].imgArraw:setVisible(false)
		self.btnTable[i].icon_jia:setVisible(false)
		self.btnTable[i].icon_suo:setVisible(true)		
	end
	self.txt_fujiaBg[1]:setVisible(true)
	self.txt_fujia[1]:setText(EquipmentRecastSubAddData:getDescribeBySubtype(1))
    self.txt_fujiaFlag[1]:setVisible(true)
	self.txt_fujiaBg[2]:setVisible(true)
	self.txt_fujia[2]:setText(EquipmentRecastSubAddData:getDescribeBySubtype(2))
    self.txt_fujiaFlag[2]:setVisible(true)
end

function SmithyRecast:registerEvents()
	self.super.registerEvents(self)

	self.btn_chongzhu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRecastBtnClickHandle))
	self.btn_chongzhu.logic = self
	self.btn_help:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHelpBtnClick))
	self.btn_help.logic = self
	-- self.checkBox:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckBoxClick))
	-- self.checkBox.logic = self

	for i=1,#self.btnTable do
		self.btnTable[i].btnNode:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onIconChoseClick))
		self.btnTable[i].btnNode.logic = self
		self.btnTable[i].btnNode.idx = i
	end	
	self.equipUpdateCallBack = function (event)
		hideLoading()

		play_qianghuabaoji_shengxingchenggong()

		--self.info_panel:onShow()
		local equip = EquipmentManager:getEquipByGmid(self.gmId)
		if equip then
		    self.equipList = EquipmentManager:getEquipListByID(equip.id,self.gmId,true)
		    self.selectGmId = 0
		    self.canClickBtn = false
		    self:playUpdateCallBackEffect(self.selectIdx)

            self.btn_chongzhu:setTouchEnabled(true)
            self.btn_chongzhu:setGrayEnabled(false)
            if equip and equip:isCanRecaseGoOnByPos(self.selectIdx) == false then
                self.btn_chongzhu:setTouchEnabled(false)
                self.btn_chongzhu:setGrayEnabled(true)
            end
		end
    end
    TFDirector:addMEGlobalListener(BagManager.EQUIP_UPDATE, self.equipUpdateCallBack) 

    self.bg_xiaohao:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCostBtnClick))
    self.bg_xiaohao.index = 2
    self.bg_xiaohao.logic = self


    self.bg_xiaohao2:setTouchEnabled(true)
    self.bg_xiaohao2.index = 1
    self.bg_xiaohao2:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCostBtnClick))
    self.bg_xiaohao2.logic = self
end

function SmithyRecast:removeEvents()
    self.super.removeEvents(self) 

	self:clearEffect()

    TFDirector:removeMEGlobalListener(BagManager.EQUIP_UPDATE, self.equipUpdateCallBack) 
    self.equipUpdateCallBack = nil
end

function SmithyRecast.onRecastBtnClickHandle( btn )

	local self = btn.logic
	if self.canClickBtn == false then
		return
	end
	print('self.selectGmId = ',self.selectGmId)

    local list = nil
    local temp = nil
    if self.recastItem then
        list = self.recastItem:getConsume()
        temp = list:objectAt(2)
    end
    
	local currEquip = EquipmentManager:getEquipByGmid(self.gmId)
    if self.selectGmId == 0 then
        local equip = self.equipList:getObjectAt(1)
        -- if equip == nil then
        if equip == nil and self.toolNum1 == 0 and self.toolNum2 == 0 then
            --toastMessage(self.equipName..'不足')
            if currEquip and currEquip.special_equipment == 1 then
                toastMessage(localizable.smithyRecast_special)
                return
            end
            local str = self.equipName
            if self.recastItem then 
                
                if not temp then
                    temp = list:objectAt(1)
                end
                local id = temp.itemid
                local item = ItemData:objectByID(id)
                str = item.name
            end
            toastMessage(stringUtils.format(localizable.smithyIntensify_not, str))
            return
        end
        if equip then
            self.selectGmId = equip.gmId
        end
    end
	if currEquip and currEquip:isCanRecaseGoOnByPos(self.selectIdx) == false then
		-- toastMessage('策划给当前品质达到最高的提示')
		return
	end
	if currEquip and currEquip.quality < 4 then
		-- toastMessage('策划给不能重铸的提示')
		-- toastMessage(TFLanguageManager:getString(ErrorCodeData.Recast_Unlock1 + self.selectIdx - 1))
		return
	end
	
    local item1 = list:objectAt(1)
    local needNum1 = item1.number
    self.selectGmId = self.selectGmId or -1
    if not temp then
        print("????????? ", self.toolNum1, needNum1, self.selectGmId)
        --if self.selectGmId == -1 and self.toolNum1 >= needNum1 then
    	if self.selectGmId <= 0 and self.toolNum1 >= needNum1 then
    		--if self.toolNum2 > 0 then
			print('使用道具')
			local Msg = {
		       	self.gmId,
		       	false,
		       	0,
		       	self.selectIdx
			}
			self.extraOldState[1] = self:getJihuoState(1)
			self.extraOldState[2] = self:getJihuoState(2)
	   		EquipmentManager:requestRecastEquip(Msg)
    	else
    			-- print(item1.itemid .. '不足')
            if item1.itemid == 35077 or item1.itemid == 35076 then
                local tItemList = {}
                table.insert(tItemList,{item1.itemid,EnumDropType.GOODS})
                if #tItemList > 0 and ResGetWayManager:openResGetLayerByList(tItemList) == true then
                    return
                end
            end
            local name = ItemData:objectByID(item1.itemid).name
    		toastMessage( stringUtils.format(localizable.smithyIntensify_not, name))	
    	end	
        return
    else
        local needNum2 = temp.number
        if self.selectGmId <= 0 then
            if self.toolNum1 >= needNum1 and self.toolNum2 >= needNum2 then
            --if self.toolNum2 > 0 then
                print('使用道具')
                local Msg = {
                    self.gmId,
                    false,
                    0,
                    self.selectIdx
                }
                self.extraOldState[1] = self:getJihuoState(1)
                self.extraOldState[2] = self:getJihuoState(2)
                EquipmentManager:requestRecastEquip(Msg)
            else
                --toastMessage(self.toolName .. '不足')
                local name = ""
                local need_itemid = 0
                if self.toolNum1 < needNum1 then
                    name = ItemData:objectByID(item1.itemid).name
                    need_itemid = item1.itemid
                else
                    name = ItemData:objectByID(temp.itemid).name
                    need_itemid = temp.itemid
                end

                if need_itemid == 35077 or need_itemid == 35076 then
                    local tItemList = {}
                    table.insert(tItemList,{need_itemid,EnumDropType.GOODS})
                    if #tItemList > 0 and ResGetWayManager:openResGetLayerByList(tItemList) == true then
                        return
                    end
                end
                --addtest2
                if self.toolNum2 and self.toolNum2 == 0 and currEquip.special_equipment ~= 1 then
                    name = self.equipName
                end
                toastMessage( stringUtils.format(localizable.smithyIntensify_not, name))   
            end 
            return

        end
    end
	local selectEquip = EquipmentManager:getEquipByGmid(self.selectGmId)
	local function recastClickTips()
		--判断装备的强化信息
		--local strTemp = '重铸消耗的%s经过%s强化，是否确认消耗用来重铸？(重铸会返还部分材料)'
		local strTemp = localizable.smithyRecast_tips
		local subStr = ""
		if selectEquip.level > 0 then
			--subStr = '/升级'
			subStr = localizable.smithyRecast_uplevel
		end
		if selectEquip.star > 0 then
			--subStr = subStr..'/升星'
			subStr = subStr.. localizable.smithyRecast_upstart
		end
		if EquipmentManager:checkIsJinglian(selectEquip) > 0 then
			--subStr = subStr..'/精炼'
			subStr = subStr..localizable.smithyRecast_upjinglian
		end
		if selectEquip.recastPercent > 0 then
			--subStr = subStr..'/重铸'
			subStr = subStr..localizable.smithyRecast_uprecast
		end
		subStr = string.sub(subStr, 2)

		if string.len(subStr) >= 1 then
			local msg = stringUtils.format(strTemp,selectEquip.name,subStr)
            CommonManager:showOperateSureLayer(
                function()
                   -- send message for recast
                   local Msg = {
	                   	self.gmId,
	                   	false,
	                   	self.selectGmId,
	                   	self.selectIdx
               		}
               		self.extraOldState[1] = self:getJihuoState(1)
               		self.extraOldState[2] = self:getJihuoState(2)
                   EquipmentManager:requestRecastEquip(Msg)
                end,
                function()
                    AlertManager:close()
                end,
                {
                --title = "提示" ,
                title = localizable.common_tips ,
                msg = msg,
                }
            )			
		else
			-- send message for recast
            local Msg = {
               	self.gmId,
               	false,
               	self.selectGmId,
               	self.selectIdx
       		}
       		self.extraOldState[1] = self:getJihuoState(1)
       		self.extraOldState[2] = self:getJihuoState(2)
            EquipmentManager:requestRecastEquip(Msg)			
		end
	end

	if selectEquip then

		-- if self.equipList:length() <= 0 then
		if self.equipList:length() <= 0 and self.toolNum1 == 0 and self.toolNum2 == 0 then
			--toastMessage(self.equipName..'不足')
			if currEquip and currEquip.special_equipment == 1 then
				toastMessage(localizable.smithyRecast_special)
				return
			end
			--toastMessage(stringUtils.format(localizable.smithyIntensify_not, self.equipName))
            local str = self.equipName
            if self.recastItem then 
                
                if not temp then
                    temp = list:objectAt(1)
                end
                local id = temp.itemid
                local item = ItemData:objectByID(id)
                str = item.name
            end
            toastMessage(stringUtils.format(localizable.smithyIntensify_not, str))
			return
		end

		-- if 1 then
		-- 	recastClickTips()
		-- 	return
		-- end
		--消耗提示
		-- local msg = string.format(TFLanguageManager:getString(ErrorCodeData.Recast_Second_Prompt),self.equipName)
		local msg = stringUtils.format(localizable.Recast_Second_Prompt, self.equipName)
	    CommonManager:showOperateSureLayer(
	        function()
	            recastClickTips()
	        end,
	        function()
	            AlertManager:close()
	        end,
	        {
	        title = localizable.common_tips,
	        msg = msg,
	        showtype = AlertManager.BLOCK_AND_GRAY,
	        }
	    )
	else
		-- print(self.equipList)
		print('cannot find the equip with selectGmId = ',self.selectGmId)
	end
end

function SmithyRecast.onHelpBtnClick( btn )
	-- AlertManager:close()
	CommonManager:showRuleLyaer( 'zhuangbeichongzhu' )
end

function SmithyRecast.onIconChoseClick( btn )
	local self = btn.logic
	local idx = btn.idx

	local equip = EquipmentManager:getEquipByGmid(self.gmId)
    local recastInfo = equip:getRecastInfo() or {}
    local prePercent = equip:getPercentByIndex( idx - 1 ) or {}

    if idx ~= 1 and (equip:isCanTouchByPos(idx) == false) then
    	-- toastMessage('策划给不能选择的提示')
    	print("idx - 1 = ",  idx - 1)
    	print("idx - 1 = ", ErrorCodeData.Recast_Unlock1 + idx - 1)
		-- toastMessage(TFLanguageManager:getString(ErrorCodeData.Recast_Unlock1 + idx - 2))
		toastMessage(localizable.Recast_UnlockList[idx - 1])
    	return
    end

	self.selectIdx = idx
	for i=1,5 do
		if self.selectIdx == i then
			self.btnTable[i].imgArraw:setVisible(true)
		else
			self.btnTable[i].imgArraw:setVisible(false)
		end
	end
	self:showSelectIcon( self.selectIdx )

	self.btn_chongzhu:setTouchEnabled(true)
    self.btn_chongzhu:setGrayEnabled(false)
	if equip and equip:isCanRecaseGoOnByPos(self.selectIdx) == false then
		self.btn_chongzhu:setTouchEnabled(false)
		self.btn_chongzhu:setGrayEnabled(true)
	end
end

function SmithyRecast.onCheckBoxClick( btn )
	local self = btn.logic
	-- self.lockInfo[self.selectIdx] = self.checkBox:getSelectedState()
end

function SmithyRecast.onCostBtnClick( btn )
	local self = btn.logic

    local index = btn.index
    if index == 1 then
        local temp = self.recastItem:getConsume()
        local data = temp:objectAt(1)
        Public:ShowItemTipLayer(data.itemid, 1)
        return
    end
	local layer  = require("lua.logic.smithy.ChongzhuCailiao"):new()
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_NONE)
    self.clickCallBack = function (idx)
    	if idx == 0 then
    		self.selectGmId = -1
    	else    		
	    	local equip = self.equipList:objectAt(idx)
	    	self.selectGmId = equip.gmId
	    end
    	AlertManager:close() 
        print("self.selectGmId >>>>>>> ", self.selectGmId)  
    	self:refreshConsume(self.selectIdx)  
    end
    layer:initDateByFilter( self.gmId, self.equipList, self.clickCallBack, self.recastItem:getConsume())
    AlertManager:show()
end

function SmithyRecast:playUpdateCallBackEffect(pos)
	local equip = EquipmentManager:getEquipByGmid(self.gmId)
    if equip == nil then
    	return
    end

    if self.animEquipLeft == nil then
	    self.animEquipLeft = TFImage:create(equip:GetTextrue())
	    self.ui:addChild(self.animEquipLeft,99)
    end
    if self.animEquipRight == nil then
	    self.animEquipRight = TFImage:create(equip:GetTextrue())
	    self.ui:addChild(self.animEquipRight,99)
    end

	self.animEquipLeft:setTexture(equip:GetTextrue())
	self.animEquipLeft:setVisible(true)
	self.animEquipLeft:setOpacity(255)
	self.animEquipLeft:setPosition(ccp(-200+self.effectOffsetX,0+self.effectOffsetY))
	self.animEquipRight:setTexture(equip:GetTextrue())
	self.animEquipRight:setVisible(true)	
	self.animEquipRight:setOpacity(255)
	self.animEquipRight:setPosition(ccp(200+self.effectOffsetX,0+self.effectOffsetY))


	if self.currRecastEffect == nil then
	    TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipRecast.xml")
	    self.currRecastEffect = TFArmature:create("equipRecast_anim")
	    self.currRecastEffect:setAnimationFps(GameConfig.ANIM_FPS)
	    self.currRecastEffect:setPosition(ccp(self.effectOffsetX,self.effectOffsetY))
	    self.ui:addChild(self.currRecastEffect,100) 
    end
    self.currRecastEffect:stop()
    self.currRecastEffect:removeMEListener(TFARMATURE_UPDATE)
    self.currRecastEffect:removeMEListener(TFARMATURE_COMPLETE)

    self.currRecastEffect:setVisible(true)        
    self.currRecastEffect:playByIndex(0, -1, -1, 0)
    self.currRecastEffect:setTouchEnabled(true)
    self.showIconEffect = false

    if self.recastEffectIcon then
    	self.recastEffectIcon:setVisible(false)
    	self.recastEffectIcon:stop()
    end
    if self.tweenEquipA then
	    TFDirector:killTween(self.tweenEquipA)
        self.tweenEquipA = nil 
    end
    if self.tweenEquipB then
	    TFDirector:killTween(self.tweenEquipB)
        self.tweenEquipB = nil 
    end
    
    self:playEquipMove(self.animEquipLeft, self.animEquipRight)

    local frameIdx = 0
    self.currRecastEffect:addMEListener(TFARMATURE_UPDATE, function ()
    	frameIdx = frameIdx + 1
    	if frameIdx == 31 then
    		self.currRecastEffect:removeMEListener(TFARMATURE_UPDATE)
    		if self.recastEffectIcon == nil then	    		
			    TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipRecastIcon.xml")
			    self.recastEffectIcon = TFArmature:create("equipRecastIcon_anim")
			    self.recastEffectIcon:setAnimationFps(GameConfig.ANIM_FPS)
			    self.recastEffectIcon:setPosition(ccp(0,6)) 
			else
				local effectCLone = self.recastEffectIcon:clone()
				self.recastEffectIcon:removeFromParent()
				self.recastEffectIcon = effectCLone
			end
		    local addNode = self.btnTable[pos].btnNode
		    addNode:addChild(self.recastEffectIcon,100)     
		    self.recastEffectIcon:playByIndex(0, -1, -1, 0)
		    self.recastEffectIcon:setVisible(true)
		    self.showIconEffect = true
    	end        
    end)
    self.currRecastEffect:addMEListener(TFARMATURE_COMPLETE, function ()
    	self.currRecastEffect:removeMEListener(TFARMATURE_COMPLETE)
    	if self.currRecastEffect then
	        self.currRecastEffect:setVisible(false)
	    end
	    if self.recastEffectIcon then
	        self.recastEffectIcon:setVisible(false)
	    end
	    self.canClickBtn = true
	    if self.extraOldState[1] ~= self:getJihuoState(1) then
	    	self:playJihuoEffect(1)
    	elseif self.extraOldState[2] ~= self:getJihuoState(2) then
    		self:playJihuoEffect(2)
    	end
    	-- self:refreshUI()
    	self.info_panel:setEquipGmId(self.gmId)    
		self:updateLevel()
		self.info_panel:onShow()
    end)

    self.disableEffect = function ()
    	if self.animEquipLeft then
    		self.animEquipLeft:setVisible(false)
    	end
    	if self.animEquipRight then
    		self.animEquipRight:setVisible(false)
    	end

    	if self.showIconEffect == false then
    		if self.recastEffectIcon == nil then	    		
			    TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipRecastIcon.xml")
			    self.recastEffectIcon = TFArmature:create("equipRecastIcon_anim")
			    self.recastEffectIcon:setAnimationFps(GameConfig.ANIM_FPS)
			    self.recastEffectIcon:setPosition(ccp(0,6)) 
			else
				local effectCLone = self.recastEffectIcon:clone()
				self.recastEffectIcon:removeFromParent()
				self.recastEffectIcon = effectCLone
			end
		    local addNode = self.btnTable[pos].btnNode
		    addNode:addChild(self.recastEffectIcon,100)     
		    self.recastEffectIcon:playByIndex(0, -1, -1, 0)
		    self.recastEffectIcon:setVisible(true)
		    self.showIconEffect = true
    	end
		
	    if self.tweenEquipA then
		    TFDirector:killTween(self.tweenEquipA)
	        self.tweenEquipA = nil 
	    end
	    if self.tweenEquipB then
		    TFDirector:killTween(self.tweenEquipB)
	        self.tweenEquipB = nil 
	    end    
    	if self.currRecastEffect then
    		self.currRecastEffect:removeMEListener(TFARMATURE_COMPLETE)
    		self.currRecastEffect:removeMEListener(TFARMATURE_UPDATE)
    		self.currRecastEffect:setVisible(false)
    	end
    	
	    self.canClickBtn = true
	    if self.extraOldState[1] ~= self:getJihuoState(1) then
	    	self:playJihuoEffect(1)
    	elseif self.extraOldState[2] ~= self:getJihuoState(2) then
    		self:playJihuoEffect(2)
    	end
    	-- self:refreshUI()
    	self.info_panel:setEquipGmId(self.gmId)    
		self:updateLevel()
		self.info_panel:onShow()
    end
    self.currRecastEffect:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.disableEffect))
end

function SmithyRecast:playEquipMove(equipA,equipB)
	self.tweenEquipA = {
        target = equipA,
        {
            duration = 0.5,
            x = self.effectOffsetX,
        },
        {
            duration = 0.2,
            alpha = 0,
        },           
        {
            duration = 0,                
            onComplete = function ()
                TFDirector:killTween(self.tweenEquipA)
                self.tweenEquipA = nil
                self.animEquipLeft:setVisible(false)
            end,
        },
    }
    self.tweenEquipB = {
        target = equipB,
        {
            duration = 0.5,
            x = self.effectOffsetX,
        },
        {
            duration = 0.2,
            alpha = 0,
        },           
        {
            duration = 0,                
            onComplete = function ()
                TFDirector:killTween(self.tweenEquipB)
                self.tweenEquipB = nil
                self.animEquipRight:setVisible(false)
            end,
        },
    }
    TFDirector:toTween(self.tweenEquipA)
    TFDirector:toTween(self.tweenEquipB)
end

function SmithyRecast:playJihuoEffect(index)

	local addNode = self.txt_fujiaBg[index]
	if addNode == nil then
		return
	end
	TFResourceHelper:instance():addArmatureFromJsonFile("effect/equipIntensify_3.xml")
    local effect = TFArmature:create("equipIntensify_3_anim")
    effect:setAnimationFps(GameConfig.ANIM_FPS)
    effect:playByIndex(0, -1, -1, 0)
    effect:setPosition(ccp(0,-50))
    effect:setScaleX(0.55)
	addNode:addChild(effect,100)
	self.jihuoEffect = effect
	effect:addMEListener(TFARMATURE_COMPLETE, function ()
    	self.jihuoEffect:removeFromParent()
    	self.jihuoEffect = nil
    end)
end

function SmithyRecast:getJihuoState( type )
	local equip = EquipmentManager:getEquipByGmid(self.gmId)
    if equip == nil then
    	return false
    end
	if type == 1 then
		if equip:getTotalGemNum() > 1 then
			return true
		end
	else
		if (equip.quality == 5 and equip:getTotalExtraAttrNum() > 3) or (equip.quality == 4 and equip:getTotalExtraAttrNum() > 2) then
	    	return true
	    end    
	end
	return false
end

function SmithyRecast:clearEffect()
	if self.currRecastEffect then	
        self.currRecastEffect:setVisible(false)
        self.currRecastEffect:stop()
    end
	if self.recastEffectIcon then
        self.recastEffectIcon:setVisible(false)
        self.recastEffectIcon:stop()
    end    
    if self.animEquipLeft then
    	self.animEquipLeft:setVisible(false)
    end
    if self.animEquipRight then
    	self.animEquipRight:setVisible(false)
    end   
    if self.tweenEquipA then
	    TFDirector:killTween(self.tweenEquipA)
        self.tweenEquipA = nil 
    end
    if self.tweenEquipB then
	    TFDirector:killTween(self.tweenEquipB)
        self.tweenEquipB = nil 
    end
    if self.jihuoEffect then
    	self.jihuoEffect:removeFromParent()
    	self.jihuoEffect = nil
    end
    self.canClickBtn = true
end

function SmithyRecast:drawTool()

	print("mithyRecast:drawTool() --------------------",self.selectGmId)
	if self.selectGmId > 0 then
		return
	end
	
	self.toolNum = 0
	-- self.bg_xiaohao:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCostBtnClick))

	local equip = EquipmentManager:getEquipByGmid(self.gmId)
    if equip == nil then
    	return
    end

	local nGoodsId = 0
	if equip.quality == 4 then
		nGoodsId = 30076
	elseif equip.quality == 5 then
		nGoodsId = 30077
	end

	if nGoodsId == 0 then
		return
	end

	local bagItem = BagManager:getItemById(nGoodsId)
    if bagItem == nil then
        print("该道具不存在背包 id =="..nGoodsId)
        return
    end

    self.equipCost:setText(bagItem.num..'/1')
    self.bg_xiaohao:setTexture(GetColorIconByQuality(bagItem.quality))

    self.img_zhuangbei:setTexture(bagItem:GetPath())

    self.selectGmId = -1

 --    print("bagItem:GetPath() = ", bagItem:GetPath())

	-- print("mithyRecast:drawTool() -------------------- end")
	-- self.bg_xiaohao:addMEListener(TFWIDGET_CLICK, audioClickfun(function ()
	-- 	Public:ShowItemTipLayer(nGoodsId, EnumDropType.GOODS)
	-- end))

	self.toolNum 	= bagItem.num
	self.toolName 	= bagItem.name
end

return SmithyRecast;
