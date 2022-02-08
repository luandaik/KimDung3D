-- client side XinFaZhihuanLayer.lua
--[[
 * @Description: 心法置换界面
 ]]

local XinFaZhihuanLayer = class("XinFaZhihuanLayer", BaseLayer)
function XinFaZhihuanLayer:ctor(data)
	self.super.ctor(self, data)
	self.gmIds = {}
	self.gmIds[1] = 0
	self.gmIds[2] = 0							
	self:init("lua.uiconfig_mango_new.smithy.ZhuangBeiChuanCheng")	
end

function XinFaZhihuanLayer:initUI( ui )
	self.super.initUI(self,ui)
	self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.XinFaZhihuan,{HeadResType.ZHUXIN,HeadResType.HUIXIN,HeadResType.SYCEE})

    self.panel_content = TFDirector:getChildByPath(ui, 'panel_content')
    self.btn_smriti = TFDirector:getChildByPath(ui, 'btn_chuancheng')
    self.btn_bangzhu = TFDirector:getChildByPath(ui,'btn_bangzhu')

    self.panel_zhenfa = TFDirector:getChildByPath(ui,'panel_zhenfa')
    self.panel_zhenfa:setVisible(false)
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
        panel.panel_star_xinfa = TFDirector:getChildByPath(panel, 'panel_star_xinfa')
        panel.txt_starlv = TFDirector:getChildByPath(panel, 'txt_starlv')
        panel.xinfaimg_star   = TFDirector:getChildByPath(panel, 'img_star')
        panel.panel_star_xinfa:setVisible(false)

        panel.txt_qianghualv = TFDirector:getChildByPath(panel, "txt_qianghualv")
        panel.txt_qianghualv:setVisible(true)
        panel.txt_qianghualv:setZOrder(999)
    end

    --未选中 选中
    self.img_bg_state ={"ui_new/Zhuzhan/bg_zhuzhan2.png","ui_new/Zhuzhan/bg_zhuzhan3.png"}
    self.img_bg_icon ={"ui_new/xinfa/btn_xf1.png","ui_new/xinfa/btn_xf2.png"}
    --属性面板
    self.panel_details ={}
    self.panelMove = {}
    local panel_shuxing = TFDirector:getChildByPath(ui,'panel_shuxing')
    panel_shuxing:setVisible(false)
    self.panel_xinfa = TFDirector:getChildByPath(ui,'panel_xinfa')
    self.panel_xinfa:setVisible(true)
       for i = 1, 2 do
        local panel_details = {}
        local detailsShuxing = TFDirector:getChildByPath(self.panel_xinfa,'panel_shuxing' .. i)
        local detailsNode = TFDirector:getChildByPath(detailsShuxing,'panel_move')
        panel_details.details_node = detailsNode
        --基础属性
        panel_details.txt_base_attr1 = {} 
        panel_details.txt_base_attr2 = {}
        panel_details.img_baoshicao = {}
        for i = 1, 13 do
            panel_details.txt_base_attr1[i] = TFDirector:getChildByPath(detailsNode,'txt_attr' .. i)
            panel_details.txt_base_attr2[i] = TFDirector:getChildByPath(detailsNode,'txt_attr' .. i.. "_num")
        end
        for i = 1, 5 do
            panel_details.img_baoshicao[i]                     = TFDirector:getChildByPath(detailsNode, 'img_baoshicao'..i)
            panel_details.img_baoshicao[i].img_baoshi          = TFDirector:getChildByPath(panel_details.img_baoshicao[i], 'img_baoshi')
            panel_details.img_baoshicao[i].txt_base_attr1      = TFDirector:getChildByPath(panel_details.img_baoshicao[i], 'txt_baoshishuxing')
            panel_details.img_baoshicao[i].txt_base_attr2      = TFDirector:getChildByPath(panel_details.img_baoshicao[i], 'txt_shuxingzhi')
        end
        table.insert(self.panel_details, panel_details)
    end

    --中间属性小箭头
    self.others = {}
    for i = 1, 5 do
       local img = TFDirector:getChildByPath(self.panel_xinfa, "img_" .. i )
       table.insert(self.others,img)
    end
    local txt_needDesc = TFDirector:getChildByPath(self.panel_xinfa, "txt_wenben")
    table.insert(self.others,txt_needDesc)
    --战斗力显示
    self.panel_totals = {}
    for i = 1, 2 do  
        local panel_totals = {}
        local totalNode = TFDirector:getChildByPath(self.panel_xinfa, 'panel_total' .. i)
        panel_totals.total_node = totalNode
        local txt_power_details = TFDirector:getChildByPath(totalNode, 'txt_power_details')
        panel_totals.txt_power_details = txt_power_details
        table.insert(self.panel_totals, panel_totals)
    end
    local txt_tip = TFDirector:getChildByPath(self.panel_xinfa,'txt_wenben')
    txt_tip:setVisible(false)
    --需要物品
    self.panle_needs = {}
    for i = 1, 2 do
        local qualityNode = TFDirector:getChildByPath(self.panel_xinfa,'img_quality' .. i)
        local img_icon = TFDirector:getChildByPath(qualityNode,'img_icon')
        local txt_numb = TFDirector:getChildByPath(qualityNode,'txt_numb')  
        txt_numb:setScale(1.0)
        local posX = txt_numb:getPositionX()
        txt_numb:setPositionX(posX + 10)
        table.insert(self.panle_needs,{need_node = qualityNode,img_icon = img_icon,txt_numb = txt_numb})
    end
     
    --设置为未选中
    for k, panel in pairs(self.panelTops) do        
        panel.img_arrow:setVisible(false)
        panel.bg_wupin:setTexture(self.img_bg_state[1])
        panel.icon_add:setTexture(self.img_bg_icon[1])       
    end

    for j = 1, 2 do
        local pan = TFDirector:getChildByPath(ui, "panel_details" .. j)
        for i = 1, 2 do
            local temp = TFDirector:getChildByPath(pan, "txt_attr_gem" .. i)
            temp:setVisible(false)
            temp = TFDirector:getChildByPath(pan, "img_gembg" .. i)
            temp:setVisible(false)
        end
    end

    self:refreshUI()
    self.selectCheck = false
end


function XinFaZhihuanLayer.onBtnAdd(sender)
	local self = sender.logic
	local index = sender.index
	if index == 1 then --选择传承装备       
		if self.gmIds[1] ~= 0 then
            self.gmIds[1] = 0
            self:refreshUI()
        else    
            local layer = require("lua.logic.xinfa.XinFaSelect"):new()                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    		layer:setParent(self)
            layer:setGmId(self.gmIds[2])           
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
    		local layer = require("lua.logic.xinfa.XinFaAccept"):new()
    		layer:setParent(self)
    		layer:setGmId(self.gmIds[1])
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
end

function XinFaZhihuanLayer.onBtnPro(sender)
    local self = sender.logic
    local index = sender.index
    if #self.items >= 2 then
        rewardItem = self.items[index]
        Public:ShowItemTipLayer(rewardItem.itemId, rewardItem.type);
    end
end

function XinFaZhihuanLayer.onBtnSmriti(sender)
    local self = sender.logic
    if self.gmIds[1] == 0  or self.gmIds[2] == 0 then 
        toastMessage(localizable.XinfaZhihuanLayer_text1)
    else
        local items = self.items or {}
        local indexNum = #items
        for i = 1, indexNum do
            local item = items[i] or {}
            local itemName = ""
            local curr_num = 0
            if item.type == 1 then
                curr_num = BagManager:getItemNumById( item.itemId )
                local dataConfig = ItemData:objectByID(item.itemId)
                itemName = dataConfig.name
                if curr_num < item.number then
                    if MallManager:checkShopOneKey( item.itemId ) then
                        return
                    else
                        toastMessage(localizable.common_prop_not_enough)
                        return
                    end
                end
            elseif  item.type == 31 then 
                local zhuXinBi = MainPlayer:getResValueByType(EnumDropType.ZHUXIN)
                local huiXinBi = MainPlayer:getResValueByType(EnumDropType.HUIXIN)
                if zhuXinBi+huiXinBi < item.number then
                    toastMessage(localizable.Xinfa_cost_buzu)
                    return
                end
            end
        end 
        CommonManager:showOperateSureLayer(
            function(data, widget)
                XinFaManager:sendXinfaZhiHuan(self.gmIds[1],self.gmIds[2])      
            end,
            function(data, widget)
                AlertManager:close()
            end,
            {
                msg = localizable.smritiMain_ok
            }
        )
     
    end
end

function XinFaZhihuanLayer.onBtnBangzhu()
    CommonManager:showRuleLyaer('kongfumethodexchange')
end
--刷新图标区信息
function XinFaZhihuanLayer:refreshUI()
	for index,gmId in pairs(self.gmIds) do
		if gmId ~= 0 then			
			self.panel_details[index].details_node:setVisible(true)	
			self.panel_totals[index].total_node:setVisible(false)		 		 
		    self.panelTops[index].quality_bg:setVisible(true) 
		    local equip = XinFaManager:getXinFaByGmId(gmId)
		    if equip == nil  then
        	    return
    	    end
    	
    	    --Icon
    	    local panel = self.panelTops[index]
    	    panel.quality_bg:setTexture(GetColorIconByQuality(equip.config.quality))
    	    panel.img_wupin:setTexture(equip:getPath())

            panel.txt_qianghualv:setVisible(true)
            if equip.level <= 1 then
                panel.txt_qianghualv:setVisible(false)
            else
                panel.txt_qianghualv:setVisible(true)
                panel.txt_qianghualv:setText("+" .. equip.level)
            end
            if equip.star <= 0 then 
                panel.panel_star_xinfa:setVisible(false)
            else
                panel.panel_star_xinfa:setVisible(true)
                panel.txt_starlv:setText(equip.star)
            end
    	
	        --基础属性
	        local panel_details = self.panel_details[index]
	        local baseAttr = equip:getTotalAttribute().attribute
            local count = 1 
            for k, v in pairs(baseAttr) do
                if tonumber(k) >= EnumAttributeType.Blood and tonumber(k) <= EnumAttributeType.Agility then
                    panel_details.txt_base_attr1[count]:setText(localizable.AttributeTypeStr[k])
                    panel_details.txt_base_attr2[count]:setText("+ ".. v)
                    panel_details.txt_base_attr1[count]:setPositionY(225 - 25 * (count - 1))
                    -- panel_details.txt_base_attr2[count]:setPositionY(245 - 30 * (count - 1))
                    count = count + 1
                elseif tonumber(k) == EnumAttributeType.CritAdditionPercent or tonumber(k) == EnumAttributeType.CritSubitionPercent then
                    panel_details.txt_base_attr1[count]:setText(localizable.XinFaSpecialbuteTypeDisPlayeStr[k][1]..'+'..v / 100 ..'%')
                    panel_details.txt_base_attr1[count]:setPositionY(225 - 25 * (count - 1))
                    panel_details.txt_base_attr2[count]:setVisible(false)
                    count = count + 1
                end
            end
            --特殊属性
            attribute = equip:getTupoAttribute().attribute
            for k,v in pairs(attribute) do
                if (tonumber(k) > EnumAttributeType.Ice and tonumber(k) < EnumAttributeType.BloodPercePercent) or (tonumber(k) > EnumAttributeType.IcePercePercent and tonumber(k) < EnumAttributeType.BonusHealing) then
                    panel_details.txt_base_attr1[count]:setText(localizable.AttributeTypeStr[k]..'+'..covertToPercentNotZero(v/10))
                    panel_details.txt_base_attr1[count]:setPositionY(225 - 25 * (count - 1))
                    panel_details.txt_base_attr2[count]:setVisible(false)
                    count = count + 1
                end
            end
            for k,v in pairs(attribute) do
                if tonumber(k) > 500 then
                    panel_details.txt_base_attr1[count]:setText(localizable.XinFaSpecialbuteTypeDisPlayeStr[k][1]..'\n'..localizable.XinFaSpecialbuteTypeDisPlayeStr[k][2]..'+'..covertToPercentNotZero(v/10))
                    panel_details.txt_base_attr1[count]:setPositionY(225 - 26 * (count - 1))
                    panel_details.txt_base_attr2[count]:setVisible(false)
                    count = count + 1
                end
            end
            for i = 1, count do 
                panel_details.txt_base_attr1[i]:setVisible(true)
            end
            for i = count, 13 do 
                panel_details.txt_base_attr1[i]:setVisible(false)
            end
            
            for i=1,5 do
                local gemId = equip:getGemPos(i)
                if (gemId ~= nil) then
                    local txt_attr = panel_details.img_baoshicao[i]
                    local stone = ItemData:objectByID(gemId)
                    txt_attr:setPositionY(225 - 28 * (count - 1))
                    txt_attr.img_baoshi:setTexture("icon/item/"..gemId..".png")
                    txt_attr.txt_base_attr1:setText(localizable.AttributeTypeStr[stone.kind])
                    local gemAttr = GemData:objectByID(gemId)
                    if gemAttr.attribute and gemAttr.attribute ~= "" then 
                        local attributekind , attributenum = gemAttr:getAttribute()
                        local IsExtra, value = equip:getGemPosIsExtra(i)
                        if IsExtra ~= 0 then
                            attributenum = attributenum * (1 + value)
                        end
                        txt_attr.txt_base_attr2:setText("+" .. attributenum)
                    end
                    count = count + 1.3
                    panel_details.img_baoshicao[i]:setVisible(true)
                else
                    panel_details.img_baoshicao[i]:setVisible(false)
                end  
            end  
            self:SetMove(panel_details.details_node,count)
	    else
            self.panelTops[index].quality_bg:setVisible(false) 
            self.panel_details[index].details_node:setVisible(false) 
            self.panel_totals[index].total_node:setVisible(false)         
        end   
    end
    if self.gmIds[1] ~= 0 and self.gmIds[2] ~= 0 then    
        for i,panel in ipairs(self.panle_needs) do
            panel.need_node:setVisible(true)
        end
        self.items ={}
        local equip = XinFaManager:getXinFaByGmId(self.gmIds[1])

        local quality = equip.config.quality or 3
        if quality < 3 then
            return
        end
        for i = 1, 2 do
            local panel = self.panle_needs[i]
            local item = self:getItemInfo( quality, i)
            if item then
                table.insert(self.items, item)
                local reward = BaseDataManager:getReward(item)  
                if item.type == 1 then
                    self.checkItem = clone(item)
                end
                if item.itemId ~= 0 then
                    local number = BagManager:getItemById(item.itemId)
                    if  number then
                        panel.txt_numb:setText( number.num .."/".. reward.number) 
                    else
                        panel.txt_numb:setText( 0 .."/".. reward.number)  
                    end                    
                else
                    panel.txt_numb:setText(reward.number)
                end
                panel.img_icon:setTexture(reward.path)

                Public:addPieceImg(panel.img_icon,item,nil,1)
                panel.need_node:setTexture(GetColorIconByQuality(reward.quality))
            else
                panel.need_node:setVisible(false)
            end
        end 

        for i,v in ipairs(self.others) do
            v:setVisible(true)
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
            panel.panel_star_xinfa:setVisible(false)
            panel.bg_wupin:setTexture(self.img_bg_state[1])
            panel.icon_add:setTexture(self.img_bg_icon[1])
        end
    end    

end

function XinFaZhihuanLayer:getItemInfo(quality,idx)
    local xinfa1 = XinFaManager:getXinFaByGmId(self.gmIds[1])
    local xinfa2 = XinFaManager:getXinFaByGmId(self.gmIds[2])
    if xinfa1 == nil or xinfa2 == nil then
        return nil
    end
    local starLevel1 = xinfa1.star
    local starLevel2 = xinfa2.star
    local Tolerance = KongfuMethodExchangeData:GetTolerance()
    local disStar = math.ceil(math.abs(starLevel1 - starLevel2)/Tolerance)
    if disStar == 0 then
        disStar = 1
    end
    local item = KongfuMethodExchangeData:GetCostByBreachDifference(disStar,idx)
    return item
end

function XinFaZhihuanLayer:setSelectId(gmId) 
	self.gmIds[1] = gmId
	self:refreshUI()
end

function XinFaZhihuanLayer:setAcceptId(accoptGmId)
	self.gmIds[2] = accoptGmId
	self:refreshUI()
end

function XinFaZhihuanLayer:removeUI()
   	self.super.removeUI(self)  
end

function XinFaZhihuanLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();

    self:refreshUI()
end
function XinFaZhihuanLayer:updateAttr()
    local xinfa1 = XinFaManager:getXinFaByGmId(self.gmIds[1])
    local xinfa2 = XinFaManager:getXinFaByGmId(self.gmIds[2])
    xinfa1:updateAttr()
    xinfa2:updateAttr()
end
function XinFaZhihuanLayer:registerEvents()
	self.super.registerEvents(self)    
	if self.generalHead then
        self.generalHead:registerEvents()
    end

    self.btn_smriti:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnSmriti))
    self.btn_smriti.logic = self

    self.btn_bangzhu:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onBtnBangzhu))
    self.btn_bangzhu.logic = self

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
    self.smritiCallBack =  function (event)
        self:playEffect()
        self:updateAttr()
    end

   TFDirector:addMEGlobalListener(XinFaManager.RESPONSE_HEART_EXCHANGE, self.smritiCallBack)
end

function XinFaZhihuanLayer:playEffect()
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
        toastMessage(localizable.ZhenfaZhihuanLayer_success)
    end)
end


function XinFaZhihuanLayer:removeEvents()
	self.super.removeEvents(self)
	if self.generalHead then
        self.generalHead:removeEvents()
    end
    TFDirector:removeMEGlobalListener(XinFaManager.RESPONSE_HEART_EXCHANGE,self.smritiCallBack)
    self.smritiCallBack = nil 
end


function XinFaZhihuanLayer:dispose()
    self.super.dispose(self)
     if self.generalHead then
    	self.generalHead:dispose()
    	self.generalHead = nil
    end
end

function XinFaZhihuanLayer:SetMove(node,index)
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
    local limitAttrNum = 9
    if index > 16 then
        index = math.floor(index)
    end
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
                y = posY + moveDy+20,
                      
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
return XinFaZhihuanLayer