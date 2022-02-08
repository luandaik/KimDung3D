-- client side ZhenfaZhihuanLayer.lua
--[[
 * @Description: 阵法置换界面
 ]]
-- script writer wuqi
-- creation time 2016-10-14

local ZhenfaZhihuanLayer = class("ZhenfaZhihuanLayer", BaseLayer)
local ZhenfaZHStarData = require('lua.table.t_s_battle_array_star_difference')
function ZhenfaZhihuanLayer:ctor(data)
	self.super.ctor(self, data)
	self.gmIds = {}
	self.gmIds[1] = 0
	self.gmIds[2] = 0							
	self:init("lua.uiconfig_mango_new.smithy.ZhuangBeiChuanCheng")	
end

function ZhenfaZhihuanLayer:initUI( ui )
	self.super.initUI(self,ui)
	self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.ZhenfaZhihuan,{HeadResType.COIN,HeadResType.SYCEE})
    self.panel_content = TFDirector:getChildByPath(ui, 'panel_content')
    self.btn_smriti = TFDirector:getChildByPath(ui, 'btn_chuancheng')
    self.btn_bangzhu = TFDirector:getChildByPath(ui,'btn_bangzhu')

    self.panel_zhenfa = TFDirector:getChildByPath(ui,'panel_zhenfa')
    self.panel_zhenfa:setVisible(true)
    self.btn_gou = TFDirector:getChildByPath(self.panel_zhenfa,'btn_gou')
    self.panel_check = TFDirector:getChildByPath(self.panel_zhenfa,'img_di')
    self.panel_check:setVisible(false)
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

        panel.txt_qianghualv = TFDirector:getChildByPath(panel, "txt_qianghualv")
        panel.txt_qianghualv:setVisible(true)
        panel.txt_qianghualv:setZOrder(999)
    end

    --未选中 选中
    self.img_bg_state ={"ui_new/Zhuzhan/bg_zhuzhan2.png","ui_new/Zhuzhan/bg_zhuzhan3.png"}
    self.img_bg_icon ={"ui_new/zhenfa/btn_zf1.png","ui_new/zhenfa/btn_zf2.png"}
    --属性面板
    self.panel_details ={}
    self.panelMove = {}
    local panel_shuxing = TFDirector:getChildByPath(ui,'panel_shuxing')
    local deltaX = -10
    for i = 1, 2 do
    	local panel_details = {}
    	local detailsNode = TFDirector:getChildByPath(panel_shuxing,'panel_details' .. i)
    	panel_details.details_node = detailsNode
    	--基础属性
        panel_details.txt_base_attr1 = {} 
        panel_details.txt_base_attr2 = {}

    	panel_details.txt_base_attr1[1] = TFDirector:getChildByPath(detailsNode,'txt_baseattr_index')
    	panel_details.txt_base_attr2[1] = TFDirector:getChildByPath(detailsNode,'txt_baseattr_num')
        panel_details.attr_extra ={}
    	for i = 1, 4 do
    		local attr_extra = {}
    		panel_details.txt_base_attr1[i + 1] = TFDirector:getChildByPath(detailsNode,'txt_extraattr_' .. i)
    		panel_details.txt_base_attr2[i + 1]= TFDirector:getChildByPath(detailsNode,'txt_extraattr_num_' .. i)
    	end
	    if i == 2 then
            deltaX = -40
        end
        for j = 1, 5 do
            panel_details.txt_base_attr1[j]:setColor(ccc3(0, 0, 0))
            panel_details.txt_base_attr2[j]:setColor(ccc3(0, 0, 0))
            panel_details.txt_base_attr1[j]:setPositionX( panel_details.txt_base_attr1[j]:getPositionX() + deltaX )
            if i == 1 then
                panel_details.txt_base_attr2[j]:setPositionX( panel_details.txt_base_attr2[j]:getPositionX() + 40 )
            else
                panel_details.txt_base_attr2[j]:setPositionX( panel_details.txt_base_attr2[j]:getPositionX() - deltaX )
            end
        end

        local panelMove = TFDirector:getChildByPath(detailsNode, 'panel_move');
        table.insert(self.panelMove, panelMove)
        table.insert(self.panel_details, panel_details)
    end

    --中间属性小箭头
    self.others = {}
    for i = 1, 5 do
       local img = TFDirector:getChildByPath(panel_shuxing, "img_" .. i )
       table.insert(self.others,img)
    end
    local txt_needDesc = TFDirector:getChildByPath(self.panel_zhenfa, "txt_wenben")
    table.insert(self.others,txt_needDesc)

    --战斗力显示
    self.panel_totals = {}
    for i = 1, 2 do  
      	local panel_totals = {}
    	local totalNode = TFDirector:getChildByPath(panel_shuxing, 'panel_total' .. i)
    	panel_totals.total_node = totalNode
    	local txt_power_details = TFDirector:getChildByPath(totalNode, 'txt_power_details')
    	panel_totals.txt_power_details = txt_power_details
    	table.insert(self.panel_totals, panel_totals)
    end
    local txt_tip = TFDirector:getChildByPath(panel_shuxing,'txt_wenben')
    txt_tip:setVisible(false)
    for i = 1, 2 do
        local qualityNode = TFDirector:getChildByPath(panel_shuxing,'img_quality' .. i)
        qualityNode:setVisible(false)
    end
    --需要物品
    self.panle_needs = {}
    for i = 1, 3 do
    	local qualityNode = TFDirector:getChildByPath(self.panel_zhenfa,'img_quality' .. i)
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

function ZhenfaZhihuanLayer:loadData(equipList)
    self.equipList = equipList
end

function ZhenfaZhihuanLayer.onBtnAdd(sender)
	local self = sender.logic
	local index = sender.index
	if index == 1 then --选择传承装备       
		if self.gmIds[1] ~= 0 then
            self.gmIds[1] = 0
            self:refreshUI()
        else    
            local layer = require("lua.logic.strategyCard.ZhenfaSelect"):new()
            layer:setItemType("zhenfa")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
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
    		local layer = require("lua.logic.strategyCard.ZhenfaAccept"):new()
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

function ZhenfaZhihuanLayer.onBtnPro(sender)
    local self = sender.logic
    local index = sender.index
    if #self.items >= 2 then
        rewardItem = self.items[index]
        Public:ShowItemTipLayer(rewardItem.itemId, rewardItem.type);
    end
end

function ZhenfaZhihuanLayer.onBtnSmriti(sender)
    local self = sender.logic
    if self.gmIds[1] == 0  or self.gmIds[2] == 0 then 
        toastMessage(localizable.ZhenfaZhihuanLayer_text1)
    else
        local items = self.items or {}
        local indexNum = #items
        local item_3 = self:getItemInfo(nil,3)
        if item_3 and self.selectCheck == false then
            indexNum = indexNum - 1
        end
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
                    end
                end
            else
                curr_num = MainPlayer:getResValueByType(item.type)
                if item.type == 5 then
                    itemName = localizable.common_zhenqi
                elseif item.type == 14 then
                    itemName = localizable.common_jinglu
                else
                    itemName = localizable.common_res
                end
            end

            if curr_num < item.number then
                toastMessage(stringUtils.format(localizable.Common_good_buzu, itemName))
                return
            end
        end

        CommonManager:showOperateSureLayer(
        function()
            StrategyCardManager:requestZhihuan(self.gmIds[1],self.gmIds[2],self.selectCheck) 
        end,
        function()
            AlertManager:close()
        end,
        {
            title = localizable.ZhenfaZhihuanLayer_tips ,
            msg = localizable.ZhenfaZhihuanLayer_ok,
        }
        )        
    end 
end

function ZhenfaZhihuanLayer.onBtnBangzhu()
    CommonManager:showRuleLyaer( 'zhenfazhihuan' )
end

function ZhenfaZhihuanLayer.onBtnCheck(sender)
    local self = sender.logic
    self.selectCheck = not self.selectCheck
    if self.selectCheck == true then
        self.btn_gou:setTextureNormal("ui_new/common/check_yes.png")
        self.panle_needs[3].need_node:setShaderProgramDefault(true)
        self.panle_needs[3].need_node:setTouchEnabled(true)
    else
        self.btn_gou:setTextureNormal("ui_new/common/check_no.png")
        self.panle_needs[3].need_node:setShaderProgram("GrayShader", true)
        self.panle_needs[3].need_node:setTouchEnabled(false)
    end

end
--刷新图标区信息
function ZhenfaZhihuanLayer:refreshUI()
	for index,gmId in pairs(self.gmIds) do
		if gmId ~= 0 then			
			self.panel_details[index].details_node:setVisible(true)	
			self.panel_totals[index].total_node:setVisible(false)		 		 
		    self.panelTops[index].quality_bg:setVisible(true) 
		    local equip = StrategyCardManager:getStrategyCardByGmid(gmId)
		    if equip == nil  then
        	    print("equipment not found .", self.gmId)
        	    return
    	    end
    	
    	    --Icon
    	    local panel = self.panelTops[index]
    	    panel.quality_bg:setTexture(GetColorIconByQuality(equip.quality))
    	    panel.img_wupin:setTexture(equip:getPath())
            Public:addStarImg(panel.img_wupin, equip:getStarLevel() or 0 )

            panel.txt_qianghualv:setVisible(true)
            panel.txt_qianghualv:setText("+" .. equip.level)
    	
    	    --具体信息
	        --基础属性
	        local panel_details = self.panel_details[index]
	        local baseAttr = equip:getTotalAttr()

            for k, v in pairs(baseAttr) do
                if tonumber(k) >= EnumAttributeType.Blood and tonumber(k) <= EnumAttributeType.Agility then
                    panel_details.txt_base_attr1[k]:setText(localizable.ZhenfaZhihuanLayer_quandui .. AttributeTypeStr[k])
                    panel_details.txt_base_attr2[k]:setText("+ " .. covertToDisplayValue(k, v))
                end
            end
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
        local equip = StrategyCardManager:getStrategyCardByGmid(self.gmIds[1])

        local skillMaxLevel = ConstantData:objectByID("ChangeEachMilitarycienceQuality4Num1").value

        local quality = equip.quality or 4
        if quality < 4 then
            return
        end
        local isSet = true
        for i = 1, 3 do
            local panel = self.panle_needs[i]
            local item = self:getItemInfo( quality, i )
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
                if i == 3 then
                    isSet =  false
                    self.panel_check:setVisible(true)
                    if self.selectCheck == true then
                        panel.need_node:setShaderProgramDefault(true)
                        panel.need_node:setTouchEnabled(true)
                    else
                        panel.need_node:setShaderProgram("GrayShader", true)
                        panel.need_node:setTouchEnabled(false)
                    end
                end
            else
                panel.need_node:setVisible(false)
            end
        end 
        if (isSet) then
           self.panel_zhenfa:setPositionX(-135)
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
        self.panel_check:setVisible(false)
    end 

    for k,panel in pairs(self.panelTops) do
        if  self.gmIds[k] == 0 then
            panel.img_arrow:setVisible(false)
            panel.bg_wupin:setTexture(self.img_bg_state[1])
            panel.icon_add:setTexture(self.img_bg_icon[1])
        end
    end    

end

function ZhenfaZhihuanLayer:getItemInfo(quality,idx)
    if idx ~= 3 then
        local str = string.format( "ChangeEachMilitarycienceQuality%dNum%d", quality, idx )
        local data = ConstantData:objectByID(str) or {}
        if data == nil then
            return nil
        end
        local item = {}
        item.type = data.res_type
        item.itemId = data.res_id
        item.number = data.value
        return item
    else
        local strategyCard1 = StrategyCardManager:getStrategyCardByGmid(self.gmIds[1])
        local strategyCard2 = StrategyCardManager:getStrategyCardByGmid(self.gmIds[2])
        if strategyCard1 == nil or strategyCard2 == nil then
            return nil
        end
        local starLevel1 = strategyCard1:getStarLevel()
        local starLevel2 = strategyCard2:getStarLevel()
        if starLevel1 == starLevel2 then
            return nil
        end
        local lessStarCard = strategyCard1
        if starLevel1 > starLevel2 then
            lessStarCard = strategyCard2
        end
        local disStar = math.abs(starLevel1 - starLevel2)
        local difInfo = nil
        for v in ZhenfaZHStarData:iterator() do
            if v.star == disStar then
                difInfo = v
                break
            end
        end
        if difInfo == nil then
            return nil
        end
        local fragment_Id = BattleArrayData:objectByID(lessStarCard.id).fragment_id
        local item = {}
        item.type = EnumDropType.GOODS
        item.itemId = fragment_Id
        item.number = difInfo.num
        return item
    end
end

function ZhenfaZhihuanLayer:setSelectId(selectGmId) 
	self.gmIds[1] = selectGmId
	self:refreshUI()
end

function ZhenfaZhihuanLayer:setAcceptId(accoptGmId)
	self.gmIds[2] = accoptGmId
	self:refreshUI()
end

function ZhenfaZhihuanLayer:removeUI()
   	self.super.removeUI(self)  
end

function ZhenfaZhihuanLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();

    self:refreshUI()
end

function ZhenfaZhihuanLayer:registerEvents()
	self.super.registerEvents(self)    
	if self.generalHead then
        self.generalHead:registerEvents()
    end

    self.btn_smriti:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnSmriti))
    self.btn_smriti.logic = self

    self.btn_bangzhu:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onBtnBangzhu))
    self.btn_bangzhu.logic = self
    self.btn_gou:addMEListener(TFWIDGET_CLICK,audioClickfun(self.onBtnCheck))
    self.btn_gou.logic = self

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
        local data = event.data[1][1] or 0
        local info = event.data[1][2] or {}
        if data == 1 then
            self:playEffect(info)
        else
            toastMessage(localizable.ZhenfaZhihuanLayer_fail)
        end
    end


    TFDirector:addMEGlobalListener(StrategyCardManager.BATTLE_ARRAY_EXCHANGE_REPONSE, self.smritiCallBack)
end

function ZhenfaZhihuanLayer:playEffect(info)
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

            if info and #info > 0 then
                RewardManager:setReward(info)
            else
                toastMessage(localizable.ZhenfaZhihuanLayer_success)
            end
        end)
end


function ZhenfaZhihuanLayer:removeEvents()
	self.super.removeEvents(self)
	if self.generalHead then
        self.generalHead:removeEvents()
    end
    TFDirector:removeMEGlobalListener(StrategyCardManager.BATTLE_ARRAY_EXCHANGE_REPONSE ,self.smritiCallBack)
end


function ZhenfaZhihuanLayer:dispose()
    self.super.dispose(self)
     if self.generalHead then
    	self.generalHead:dispose()
    	self.generalHead = nil
    end
end

return ZhenfaZhihuanLayer