--[[
******图鉴层*******

]]

local CultureQiHe = class("CultureQiHe", BaseLayer)

local IconPosMax = 6 
local qiheMaxLevel = 12

local LocalIconData = {}

function CultureQiHe:ctor()
    self.super.ctor(self)
    self:init("lua.uiconfig_mango_new.operatingactivities.CultureQiHe")
end

function CultureQiHe:initUI(ui)
    self.super.initUI(self,ui)
   	self.panel_qihe = TFDirector:getChildByPath(ui, 'panel_qihe')
    self.cellModel = TFDirector:getChildByPath(ui, 'panel_cell')
    self.cellModel:retain()
    self.cellModel:removeFromParent()
    self:iconDataReady()
    self:refreshQiHeList()
end

function CultureQiHe:refreshQiHeList()
	local picture_text = {"shenfa","fanyu","wuli","neili","qixue","quanshuxing"}

    local scrollViewUI = self.panel_qihe
    local scrollView = TFScrollView:create()
    scrollView:setPosition(ccp(0,0))
    scrollView:setSize(scrollViewUI:getSize())
    scrollView:setBounceEnabled(false)
    scrollViewUI:addChild(scrollView)
    local cell = self.cellModel:clone()
    local size = cell:getSize()

    self:iconDataReady()

    for i = 1, IconPosMax do
    	local cell = self.cellModel:clone()
    	--显示契合图片
    	local Image_Qihe_1 = TFDirector:getChildByPath(cell, 'Image_Qihe_1')
    	Image_Qihe_1:setTexture("ui_new/Zhuzhan/bg_kw_"..picture_text[i].."2.png")
    	cell:setPosition(ccp(0,size.height * i - size.height))
    	--显示线
    	if i == 1 then 
    		img_xian2 = TFDirector:getChildByPath(cell, 'img_xian2')
    		img_xian2:setVisible(false)
    	end
    	--显示星级
    	local starNode 	= TFDirector:getChildByPath(cell, "bg_lv")
    	local iconData 	= LocalIconData[i]
    	local rankIndex = math.floor((tonumber(iconData.level) - 1) / 5) + 1
        local currRank  = math.floor((tonumber(iconData.level) - (rankIndex - 1) * 5))
        for j=1,5 do
            local starIcon = TFDirector:getChildByPath(starNode, "icon_lv"..j)
            if iconData.level < j then
                starIcon:setVisible(false)
            else
                if (rankIndex == 3) then
                    if (currRank >= j) then
                        starIcon:setTexture("ui_new/Zhuzhan/icon_qhlv_hong.png")
                    else
                        starIcon:setTexture("ui_new/Zhuzhan/icon_qhlv_zi.png")
                    end
                elseif (rankIndex == 2) then
                    if (currRank >= j) then
                        starIcon:setTexture("ui_new/Zhuzhan/icon_qhlv_zi.png")
                    else
                        starIcon:setTexture("ui_new/Zhuzhan/icon_qhlv.png")
                    end
                else
                    starIcon:setTexture("ui_new/Zhuzhan/icon_qhlv.png")
                end
            end
        end
        --显示材料
        local btn_tool = {}
        for i = 1, 3 do
        	btn_tool[i] 		= TFDirector:getChildByPath(cell,'btn_tool'..i)
        	btn_tool[i].img 	= TFDirector:getChildByPath(btn_tool[i], 'img_tool')
        	btn_tool[i].haveNum = TFDirector:getChildByPath(btn_tool[i], 'txt_num1')
        	btn_tool[i].needNum = TFDirector:getChildByPath(btn_tool[i], 'txt_num2')
        	btn_tool[i]:setVisible(false)
        end

        if iconData.level == qiheMaxLevel then
        	local img_pj 	= TFDirector:getChildByPath(cell, 'img_pj')
        	local img_cl 	= TFDirector:getChildByPath(cell, 'img_cl')
        	local img_manji = TFDirector:getChildByPath(cell, 'img_manji')
        	img_manji:setVisible(true)
        else
         	for k,item in ipairs(iconData.item) do
                btn_tool[k].itemId          = item.id
                btn_tool[k].itemTypeId      = item.type
                btn_tool[k]:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
         	 	btn_tool[k]:setVisible(true)
         	 	btn_tool[k].img:setTexture("icon/item/"..item.id..".png")
         	 	btn_tool[k].needNum:setText("/"..item.num)               
                local quality = ItemData:objectByID(item.id).quality
                btn_tool[k]:setTextureNormal(GetColorIconByQuality(quality))
         	 	local bagInfo = BagManager:getItemById(item.id)
         	 	local haveNum = 0
            	if (bagInfo) then
            	    haveNum = bagInfo.num
            	end
            	btn_tool[k].haveNum:setText(haveNum)
                if haveNum < item.num then 
                    btn_tool[k].haveNum:setColor(ccc3(255,0,0))
                end
         	end
         end
    	scrollView:addChild(cell)
	end
    scrollView:setInnerContainerSize(CCSizeMake(scrollViewUI:getSize().weight,size.height*IconPosMax))   
end

function CultureQiHe.onShowItemClickHandle(sender)
    local self = sender.logic;
    Public:ShowItemTipLayer(sender.itemId, sender.itemTypeId)
end

function CultureQiHe:iconDataReady()
    for i=1,IconPosMax do
        self:iconDataReadyByPos(i)
    end
end

function CultureQiHe:iconDataReadyByPos(pos)
    local levelTbl = AssistFightManager:getQiheLevelInfo()
    LocalIconData[pos] = {}
    local level = levelTbl[pos] or 0
    LocalIconData[pos].level = level
    local goods = AgreeRuleData:GetDataInfo( level + 1 )
    if goods then
        LocalIconData[pos].item = goods:GetItemInfo()
    end
end

function CultureQiHe:onShow()
    self.super.onShow(self)
end

function CultureQiHe:removeUI()
	if self.cellModel then
        self.cellModel:release()
        self.cellModel = nil
    end
    self.super.removeUI(self)
end



function CultureQiHe:dispose() 
    self.super.dispose(self)
end

function CultureQiHe:registerEvents()
    self.super.registerEvents(self)
end

function CultureQiHe:removeEvents()
    --按钮事件
    self.super.removeEvents(self)
end
return CultureQiHe