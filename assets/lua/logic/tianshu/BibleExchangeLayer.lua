--Date 2016-3-24
--yongkang
--装备传承主界面

local BibleExchangeLayer = class("BibleExchangeLayer",BaseLayer)

function BibleExchangeLayer:ctor(data)
	self.super.ctor(self, data)
	self.gmIds = {}
    self.MAX_ATTR_SIZE = 11
	self.gmIds[1] = 0
	self.gmIds[2] = 0							
	self:init("lua.uiconfig_mango_new.role.BibleExchange")	
end

function BibleExchangeLayer:initUI( ui )
	self.super.initUI(self,ui)
	self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.BibleExchange,{HeadResType.YUELI,HeadResType.COIN,HeadResType.SYCEE})
    self.panel_content = TFDirector:getChildByPath(ui, 'panel_content')
    self.btn_smriti = TFDirector:getChildByPath(ui, 'btn_chuancheng')
    self.btn_bangzhu = TFDirector:getChildByPath(ui,'btn_bangzhu')

    self.panelTops = {}
    local leftPanel =  TFDirector:getChildByPath(ui, 'panel_xuanzhong')
    local rightPanel =  TFDirector:getChildByPath(ui, 'panel_wupin')
    table.insert(self.panelTops,leftPanel)
    table.insert(self.panelTops,rightPanel)

    for k,panel in pairs(self.panelTops) do
    	panel.quality_bg = TFDirector:getChildByPath(panel,'btn_icon')
    	panel.img_wupin = TFDirector:getChildByPath(panel,'img_wupin')
        panel.icon_add = TFDirector:getChildByPath(panel,'btn_wupin')
        panel.img_arrow = TFDirector:getChildByPath(panel,'img_arrow')
        panel.bg_wupin = TFDirector:getChildByPath(panel,'bg_wupin')
        panel.txt_lvl = TFDirector:getChildByPath(panel,'txt_qianghualv')
    end
    --未选中 选中
    self.img_bg_state ={"ui_new/Zhuzhan/bg_zhuzhan2.png","ui_new/Zhuzhan/bg_zhuzhan3.png"}
    self.img_bg_icon ={"ui_new/tianshu/btn_ts1.png","ui_new/tianshu/btn_ts2.png"}
    --属性面板
    self.panel_details ={}
    self.panelMove = {}
    local panel_shuxing = TFDirector:getChildByPath(ui,'panel_shuxing')
    for i=1,2 do
    	local panel_details ={}
    	local detailsNode = TFDirector:getChildByPath(panel_shuxing,'panel_details' .. i)
    	panel_details.details_node = detailsNode
    	--基础属性
        panel_details.txt_attr = {} 
        panel_details.txt_attr_num = {} 
        local panel_move = TFDirector:getChildByPath(detailsNode,'panel_move')
    	--for i=1,self.MAX_ATTR_SIZE do
        local count = 1
        local childrenArr = panel_move:getChildren()
        for i=0,childrenArr:count()-1 do
    		local txt_attr = TFDirector:getChildByPath(panel_move,'txt_attr'..count)
            if (txt_attr) then
                table.insert(panel_details.txt_attr,txt_attr)
                local txt_attr_num = TFDirector:getChildByPath(panel_move, "txt_attr" .. count .. "_num")
                table.insert(panel_details.txt_attr_num,txt_attr_num)
                count = count + 1
            end
    	end
    	--宝石
        panel_details.attr_gem ={}
    	for i=1,2 do
    	  	 local attr_gem ={}
    	  	 attr_gem.txt_gem = TFDirector:getChildByPath(detailsNode,'txt_attr_gem'..i)
    	  	 attr_gem.txt_gem_val = TFDirector:getChildByPath(detailsNode,'txt_attr_gem_val'..i)
    	  	 attr_gem.txt_gem_val:setText("666"..i)
    	  	 attr_gem.img_gem = TFDirector:getChildByPath(detailsNode,'img_gem'..i)
    	  	 table.insert(panel_details.attr_gem,attr_gem)
    	end  
    	--	 
        local panelMove = TFDirector:getChildByPath(detailsNode, 'panel_move');
        table.insert(self.panelMove,panelMove)
        table.insert(self.panel_details,panel_details)
    end
    --other
    self.others = {}
    for i=1,5 do
       local img = TFDirector:getChildByPath(panel_shuxing,"img_"..i )
       table.insert(self.others,img)
    end
    local txt_needDesc = TFDirector:getChildByPath(panel_shuxing,"txt_wenben")
    table.insert(self.others,txt_needDesc)

    --战斗力显示
    self.panel_totals = {}
    for i=1,2 do  
      	local panel_totals ={}
    	local totalNode = TFDirector:getChildByPath(panel_shuxing,'panel_total' .. i)
    	panel_totals.total_node = totalNode
    	local txt_power_details = TFDirector:getChildByPath(totalNode,'txt_power_details')
    	panel_totals.txt_power_details = txt_power_details
    	table.insert(self.panel_totals,panel_totals)
    end

    --需要物品
    self.panle_needs ={}
    for i=1,2 do
    	local qualityNode = TFDirector:getChildByPath(panel_shuxing,'img_quality' .. i)
    	local img_icon = TFDirector:getChildByPath(qualityNode,'img_icon')
    	local txt_numb = TFDirector:getChildByPath(qualityNode,'txt_numb')  
    	table.insert(self.panle_needs,{need_node = qualityNode,img_icon = img_icon,txt_numb = txt_numb})
    end
    --设置为未选中
    for k,panel in pairs(self.panelTops) do        
        panel.img_arrow:setVisible(false)
        panel.bg_wupin:setTexture(self.img_bg_state[1])
        panel.icon_add:setTexture(self.img_bg_icon[1])       
    end

    self.showRewardInfo = {}

    self:refreshUI()
end

function BibleExchangeLayer:loadData(equipList)
    self.equipList = equipList
end


function BibleExchangeLayer.onBtnAdd(sender)
	local self = sender.logic
	local index = sender.index
	if index == 1 then --选择传承装备       
		if self.gmIds[1] ~= 0 then
            self.gmIds[1] = 0
            self:refreshUI()
        else    
            local layer = require("lua.logic.tianshu.BibleSelect"):new()
    		layer:setParent(self)
            layer:setInstanceId(self.gmIds[2])           
    	    AlertManager:addLayer(layer,AlertManager.BLOCK,AlertManager.TWEEN_NONE)
    	    AlertManager:show()

            local panel = self.panelTops[1]
            panel.img_arrow:setVisible(true)
            panel.bg_wupin:setTexture(self.img_bg_state[2])
            panel.icon_add:setTexture(self.img_bg_icon[2])
        end      
	elseif index == 2 then --选择接受传承的装备
        if self.gmIds[2] ~= 0 then
            self.gmIds[2] = 0 
            self:refreshUI()
        else    
    		local layer = require("lua.logic.tianshu.BibleAccept"):new()
    		layer:setParent(self)
    		layer:setInstanceId(self.gmIds[1])
    	    AlertManager:addLayer(layer,AlertManager.BLOCK,AlertManager.TWEEN_NONE)
    	    AlertManager:show()

            local panel = self.panelTops[2]
            panel.img_arrow:setVisible(true)
            panel.bg_wupin:setTexture(self.img_bg_state[2])
            panel.icon_add:setTexture(self.img_bg_icon[2])

        end
	else
		print("error")
	end
    --[[
    for k,panel in pairs(self.panelTops) do
        if k ~= index then
            panel.img_arrow:setVisible(false)
            panel.bg_wupin:setTexture(self.img_bg_state[1])
            panel.icon_add:setTexture(self.img_bg_icon[1])
        else
            panel.img_arrow:setVisible(true)
            panel.bg_wupin:setTexture(self.img_bg_state[2])
            panel.icon_add:setTexture(self.img_bg_icon[2])
        end
    end    
]]
end

function BibleExchangeLayer.onBtnPro(sender)    
    local self = sender.logic
    --local rewardItem = self.rewardItem
    local index = sender.index
    if #self.items >= 2 then
        rewardItem = self.items[index]
        Public:ShowItemTipLayer(rewardItem.itemId, rewardItem.type);
    end
end

function BibleExchangeLayer.onBtnSmriti(sender)
    local self = sender.logic
    if self.gmIds[1] == 0  or self.gmIds[2] == 0 then 
        toastMessage(localizable.smritiMain_text1)
    else
        CommonManager:showOperateSureLayer(
        function()
            if self.checkItem then
                local bagItem = BagManager:getItemById(self.checkItem.itemId) or {}
                local number = bagItem.num or 0
                if number < self.checkItem.number then
                    if MallManager:checkShopOneKey( self.checkItem.itemId ) then
                        return
                    end
                end
            end
            SkyBookManager:BibleExchange(self.gmIds[1],self.gmIds[2])
        end,
        function()
            AlertManager:close()
        end,
        {
            title = localizable.smritiMain_tips ,
            msg = localizable.Tianshu_exchange_ok,
        }
        )        
    end
end

function BibleExchangeLayer.onBtnBangzhu()
    CommonManager:showRuleLyaer( 'tianshuzhihuan' )
end
--刷新图标区信息
function BibleExchangeLayer:refreshUI()
	for index,gmId in pairs(self.gmIds) do
		if gmId ~= 0 then			
			self.panel_details[index].details_node:setVisible(true)	
			self.panel_totals[index].total_node:setVisible(true)		 
			--self.panle_needs[index].need_node:setVisible(true)		 
		    self.panelTops[index].quality_bg:setVisible(true) 
		    local equip = SkyBookManager:getItemByInstanceId(gmId)
		    if equip == nil then
        	    print("equipment not found .",self.gmIds)
        	    return
    	    end
    	
    	    --Icon
            local panel = self.panelTops[index]
            local _quality = SkyBookManager:GetUpQuality(equip.quality, equip.tupoLevel)
    	    panel.quality_bg:setTexture(GetColorIconByQuality(_quality))
    	    panel.img_wupin:setTexture(equip:GetTextrue())
            -- panel.img_wupin:setScale(1)
            panel.img_wupin:setFlipX(false)
            local str = stringUtils.format(localizable.Tianshu_chong_text, EnumSkyBookLevelType[equip.level])
            panel.txt_lvl:setText(str)
    	    SkyBookManager:BindEffectOnEquip(panel.quality_bg, equip)

            Public:addStarImg(panel.img_wupin, equip.tupoLevel)
    	    --具体信息
	        --基础属性
	        local panel_details = self.panel_details[index]

	        local txt_attr = panel_details.txt_attr
            local txt_attr_num = panel_details.txt_attr_num
            
            --for i = 1, self.MAX_ATTR_SIZE do
            for i,v in ipairs(txt_attr) do
                txt_attr[i]:setVisible(false)
                txt_attr_num[i]:setVisible(false)
            end

            local totalAttr = equip:getTotalAttr()
            local count = 0
            for i = 1, EnumAttributeType.Max - 1 do
                if totalAttr[i] and totalAttr[i] ~= 0 and count < self.MAX_ATTR_SIZE then
                    count = count + 1
                    txt_attr[count]:setText(AttributeTypeStr[i])
                    txt_attr_num[count]:setText("+ " .. covertToDisplayValue(i,totalAttr[i],true))
                    txt_attr[count]:setVisible(true)
                    txt_attr_num[count]:setVisible(true)
                end
            end
            local immuneAttr = equip:getImmuneAttr()
            for k,v in pairs(immuneAttr) do
                if v and v ~= 0 then
                    count = count + 1
                    txt_attr[count]:setText(SkillBuffHurtStr[k])
                    txt_attr_num[count]:setText("+ " .. covertToDisplayValue(k,v,true))
                    txt_attr[count]:setVisible(true)
                    txt_attr_num[count]:setVisible(true)
                end
            end
            local effectExtraAttr = equip:getEffectExtraAttr()

            local beEffectExtraAttr = equip:getBeEffectExtraAttr()
           
            local attrInfo = getBeEffectInfo(beEffectExtraAttr)
            for attrName,info in pairs(attrInfo) do
                count = count + 1
                local txt_name = txt_attr[count]
                local txt_base = txt_attr_num[count]
                if (txt_name and (info.percentAttr > 0 or info.constAttr > 0)) then
                    txt_name:setText(attrName)
                    local str = "+ "
                    if (info.percentAttr > 0) then
                        str = str..info.percentAttr.."%"
                        if (info.constAttr > 0) then
                            str = str.."+"..info.constAttr
                        end
                    else
                        if (info.constAttr > 0) then
                            str = str..info.constAttr
                        end
                    end
                    txt_base:setText(str)
                    txt_name:setVisible(true)
                    txt_base:setVisible(true)
                    
                end     
            end

            self:SetMove(self.panelMove[index],count)

	        --宝石
	        local attr_gem = panel_details.attr_gem
	        for i=1,SkyBookManager.kGemMergeTargetNum do
	            local item = ItemData:objectByID(equip:getGemPos(i))
	            if item then
	                attr_gem[i].img_gem:setVisible(true)
	                attr_gem[i].txt_gem:setVisible(true)
                    attr_gem[i].txt_gem_val:setVisible(true)

	                local gem = GemData:objectByID(equip:getGemPos(i))
	                if gem then
                        if gem.attribute and gem.attribute ~= "" then 
                            local attr_index,attr_num = gem:getAttribute()
                            attr_gem[i].txt_gem_val:setText("+"..covertToDisplayValue(attr_index,attr_num,true))
                            attr_gem[i].txt_gem:setText(AttributeTypeStr[attr_index])
                        elseif gem.immune and gem.immune ~= "" then
                            local attr_index,attr_num = gem:getExtraAttribute(gem.immune)
                            attr_gem[i].txt_gem_val:setText("+"..covertToDisplayValue(attr_index,attr_num,true))
                            attr_gem[i].txt_gem:setText(SkillBuffHurtStr[attr_index])  
                        elseif gem.effect_extra and gem.effect_extra ~= "" then
                            local attr_index,attr_num = gem:getExtraAttribute(gem.effect_extra)
                            attr_gem[i].txt_gem_val:setText("+"..covertToDisplayValue(attr_index,attr_num,true))
                            attr_gem[i].txt_gem:setText(SkillBuffHurtStr[attr_index])   
                        elseif gem.be_effect_extra and gem.be_effect_extra ~= "" then
                            local attr_index,attr_num = gem:getExtraAttribute(gem.be_effect_extra)
                            attr_gem[i].txt_gem_val:setText("+"..covertToDisplayValue(attr_index,attr_num,true))
                            attr_gem[i].txt_gem:setText(BeEffectExtraStr[attr_index])       
                        end
	                    attr_gem[i].img_gem:setTexture(item:GetPath())
	                end
	            else
	                attr_gem[i].img_gem:setVisible(false)	        	
	                attr_gem[i].txt_gem:setVisible(false)
	                attr_gem[i].txt_gem_val:setVisible(false)
	            end
	            -- end
	        end
	        --总战斗力
	        self.panel_totals[index].txt_power_details:setText(equip:getpower())
	    else
            self.panelTops[index].quality_bg:setVisible(false) 
            self.panel_details[index].details_node:setVisible(false) 
            self.panel_totals[index].total_node:setVisible(false)         
            --self.panle_needs[index].need_node:setVisible(false)
        end   
    end
    if self.gmIds[1] ~=0 and self.gmIds[2] ~= 0 then    

        for i,panel in ipairs(self.panle_needs) do
            panel.need_node:setVisible(false)
        end
        self.items ={}
        local equip = SkyBookManager:getItemByInstanceId(self.gmIds[1])
 
        local temptbl = {}
            local dataConfig = ConstantData:objectByID("ChangeEachSkyBookQuality"..equip.quality.."Num1")
            if dataConfig then
                temptbl[#temptbl + 1] = {dataConfig.res_type,dataConfig.res_id,dataConfig.value}
            end
            dataConfig = ConstantData:objectByID("ChangeEachSkyBookQuality"..equip.quality.."Num2")
            if dataConfig then
                temptbl[#temptbl + 1] = {dataConfig.res_type,dataConfig.res_id,dataConfig.value}
            end
        
        for k,v in pairs(temptbl) do
            self.panle_needs[k].need_node:setVisible(true)
            local panel = self.panle_needs[k]
            local item = {}
            item.type = tonumber(v[1])
            item.itemId = tonumber(v[2])
            item.number = tonumber(v[3])
            table.insert(self.items,item)
            local reward = BaseDataManager:getReward(item)  
            if item.type == 1 then
                self.checkItem = clone(item)
            end
            if item.itemId ~= 0 then
                local number = BagManager:getItemById(item.itemId)
                print(number)
                if  number then
                    panel.txt_numb:setText( number.num .."/".. reward.number) 
                else
                    panel.txt_numb:setText( 0 .."/".. reward.number)  
                end                    
            else
                panel.txt_numb:setText(reward.number)
            end
            panel.img_icon:setTexture(reward.path)

            if itemType == EnumDropType.GOODS then
                local itemInfo = ItemData:objectByID(item.itemId)
                if itemInfo.type == EnumGameItemType.Soul or itemInfo.type == EnumGameItemType.Piece then
                    Public:addPieceImg(panel.img_icon,reward,true)
                end
                panel.need_node:setTexture(GetBackgroundForGoods(itemInfo))
            else
                panel.need_node:setTexture(GetColorIconByQuality(reward.quality))
            end    
        end 

        self.others[1]:setVisible(true) 
        self.others[6]:setVisible(true) 
        for i = 2,5 do
            self.others[i]:setVisible(false)
        end
        local totalAttr = equip:getTotalAttr()
	    local notEmptyIndex = 1   
        for i = 1, EnumAttributeType.Max - 1 do
            if notEmptyIndex <= 6 and self.others[notEmptyIndex] and totalAttr[i] and totalAttr[i] ~= 0 then  	
                self.others[notEmptyIndex]:setVisible(true)
                notEmptyIndex = notEmptyIndex + 1
            end
        end
        local immuneAttr = equip:getImmuneAttr()
        for k,v in pairs(immuneAttr) do
            if notEmptyIndex <= 6 and self.others[notEmptyIndex] and v and v ~= 0 then
                self.others[notEmptyIndex]:setVisible(true)
                notEmptyIndex = notEmptyIndex + 1
            end
        end
        local effectExtraAttr = equip:getEffectExtraAttr()
        for k,v in pairs(effectExtraAttr) do
            if notEmptyIndex <= 6 and self.others[notEmptyIndex] and v and v ~= 0 then
                self.others[notEmptyIndex]:setVisible(true)
                notEmptyIndex = notEmptyIndex + 1
            end
        end
        local beEffectExtraAttr = equip:getBeEffectExtraAttr()
        for k,v in pairs(beEffectExtraAttr) do
            if notEmptyIndex <= 6 and self.others[notEmptyIndex] and v and v ~= 0 then
                self.others[notEmptyIndex]:setVisible(true)
                notEmptyIndex = notEmptyIndex + 1
            end
        end
    else
        for i,v in ipairs(self.others) do
            v:setVisible(false)
        end
        for i,v in ipairs(self.panle_needs) do
            v.need_node:setVisible(false)
        end
    end 


    for k,panel in pairs(self.panelTops) do
        if  self.gmIds[k] == 0 then
            panel.img_arrow:setVisible(false)
            panel.bg_wupin:setTexture(self.img_bg_state[1])
            panel.icon_add:setTexture(self.img_bg_icon[1])
        end
    end    

end

function BibleExchangeLayer:setSelectId(selectGmId) 
	self.gmIds[1] = selectGmId
	self:refreshUI()
end

function BibleExchangeLayer:setAcceptId(accoptGmId)
	self.gmIds[2] = accoptGmId
	self:refreshUI()
end

function BibleExchangeLayer:SetMove(node,index)
    if node == nil then
        return nil
    end
    if node.moveTween then
        TFDirector:killTween(node.moveTween)
        node.moveTween = nil
        node:setPositionY(node.initPosY)
    end
    if node.initPosY == nil then
        node.initPosY = node:getPositionY()
    end
    local limitAttrNum = 5
    if index > limitAttrNum then    
        local moveDy = (index - limitAttrNum)*30
        local posY = node.initPosY
        local moveTween = 
        {
            target = node,
            repeated = -1,
            {
                duration = 2,
                delay = 1,
                y = posY + moveDy,
                      
            },
            { -- 此节实现节与节之间的延时
                duration = 1,
                delay = 1, 
                onComplete = function()
                    node:setPositionY(posY)
                end    
            },
        }
        TFDirector:toTween(moveTween)
        node.moveTween = moveTween
    end
end

function BibleExchangeLayer:removeUI()
   	self.super.removeUI(self)  
end

function BibleExchangeLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();

    self:refreshUI()
end

function BibleExchangeLayer:registerEvents()
	self.super.registerEvents(self)    
	if self.generalHead then
        self.generalHead:registerEvents()
    end

    self.btn_smriti:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnSmriti))
    self.btn_smriti.logic = self

    self.btn_bangzhu:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onBtnBangzhu))

    for k,panel in pairs(self.panelTops) do
    	panel.quality_bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAdd))
    	panel.icon_add:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnAdd))
    	
    	panel.quality_bg.logic = self
    	panel.quality_bg.index = k

    	panel.icon_add.logic = self
    	panel.icon_add.index = k
    end

    for k,panel in ipairs(self.panle_needs) do
        panel.need_node:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnPro))
        panel.need_node.logic = self
        panel.need_node.index = k
    end

    --成功
    self.exchangeSuccessCallBack = function(event)
        self.showRewardInfo = event.data[1] or {}
        self:playEffect()
    end

    TFDirector:addMEGlobalListener(SkyBookManager.BIBLE_EXCHANGE_REPONSE ,self.exchangeSuccessCallBack)
end

function BibleExchangeLayer:playEffect()
    if self.gmIds[1] == 0 or self.gmIds[2] == 0 then 
        return
    end    

    if self.effect then
        self.effect:playByIndex(0, -1, -1, 0)    
    else 
        local filePath = "effect/smriti.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(filePath)
        local effect = TFArmature:create("smriti_anim")
        effect:setAnimationFps(GameConfig.ANIM_FPS)
        effect:setPosition(ccp(480 ,320))  
        effect:playByIndex(0, -1, -1, 0)        
        effect:setVisible(true)
        self.panel_content:addChild(effect,100)
        self.effect = effect
    end
    self.effect:addMEListener(TFARMATURE_COMPLETE,
        function()
            self.effect:removeMEListener(TFARMATURE_COMPLETE) 
            self:refreshUI()
            if self.showRewardInfo and #self.showRewardInfo > 0 then
                RewardManager:setReward(self.showRewardInfo)
            end
        end)
    --self:refreshUI()
end


function BibleExchangeLayer:removeEvents()
	self.super.removeEvents(self)
	if self.generalHead then
        self.generalHead:removeEvents()
    end
    TFDirector:removeMEGlobalListener(SkyBookManager.BIBLE_EXCHANGE_REPONSE ,self.exchangeSuccessCallBack)
end


function BibleExchangeLayer:dispose()
    self.super.dispose(self)
     if self.generalHead then
    	self.generalHead:dispose()
    	self.generalHead = nil
    end
    --self.effect = nil
end

return BibleExchangeLayer

--endregion
