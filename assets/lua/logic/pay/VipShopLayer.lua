--[[
******贵宾商城层*******

    -- by sjj
    -- 2018/2/1
]]
local VipShopLayer = class("VipShopLayer", BaseLayer);

VipShopLayer.maxGoodsNum = 10

function VipShopLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.pay.VipShopLayer");
    self.hasVipIntegral = 0
    self.shopGoodsData = {}
end

function VipShopLayer:initUI(ui)
    self.super.initUI(self,ui);

    self.btn_close 		  = TFDirector:getChildByPath(ui, 'btn_close');
    self.btn_refresh        = TFDirector:getChildByPath(ui, 'btn_refresh');
    self.btn_vip        = TFDirector:getChildByPath(ui, 'btn_tq');
    self.btn_pay        = TFDirector:getChildByPath(ui, 'btn_cz');

    self.txt_hasIntegral        = TFDirector:getChildByPath(ui, 'txt_price');
    self.panel_vip				= TFDirector:getChildByPath(ui, 'panel_vip')

    self.allGoodsItem = {}
    local startOffset = 10
    local columnSpace = 25
    local panelHeight = self.panel_vip:getContentSize().height
    for i = 1, self.maxGoodsNum do 
    	local item_panel = require('lua.logic.pay.VipGoodsCell'):new()
    	local size = item_panel:getSize()
    	local posX = math.ceil(i % 5)
    	local x = size.width*(posX)
    	-- if i > 1 then
    	    x = x + (posX + 1) * columnSpace --+ startOffset
    	-- end
        -- x = x + startOffset
        local y = panelHeight - (size.height + startOffset) * (math.ceil(i / 5)) - startOffset
    	item_panel:setPosition(ccp(x,y))
    	item_panel:setLogic(self)
    	self.panel_vip:addChild(item_panel)
		
	    -- cell.item_panel = cell.item_panel or {}
	    -- cell.item_panel[i] = item_panel
     --    local newIndex = #self.allGoodsItem + 1
        self.allGoodsItem[i] = item_panel
    end
end

function VipShopLayer:onShow()
    self.super.onShow(self)
end

function VipShopLayer:refreshUI()
	-- self.shopGoodsData = PayManager:getVipShopData()
	self.hasVipIntegral = PayManager:getVipIntegral()

	self.txt_hasIntegral:setText(self.hasVipIntegral)

	for i = 1, self.maxGoodsNum do 
		-- self.shopGoodsData[i] = {}
		-- self.shopGoodsData[i].itemId = VipShopItemsData:getGoodsidById(shopData.goodId)
		-- self.shopGoodsData[i].type = EnumDropType.GOODS
		-- self.shopGoodsData[i].discount = shopData.discount
		-- self.shopGoodsData[i].purchaseNum = shopData.number
		self.allGoodsItem[i]:setData(i)
 	end  

end


function VipShopLayer:removeUI()
    self.super.removeUI(self);
end

--注册事件
function VipShopLayer:registerEvents()
   	self.super.registerEvents(self);

   	ADD_ALERT_CLOSE_LISTENER(self,self.btn_close);
   	self.btn_vip.logic=self;
   	self.btn_vip:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onVipClickHandle),1);

   	self.btn_pay.logic=self;
    self.btn_pay:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onPayClickHandle),1);

    self.btn_refresh.logic=self;
    self.btn_refresh:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onRefreshClickHandle),1);

    self.updateRefreshCallBack = function(event)
        self:refreshUI()
    end;
    TFDirector:addMEGlobalListener(PayManager.refreshVIPShop ,self.updateRefreshCallBack ) ;

end

function VipShopLayer:removeEvents()
	self.super.removeEvents(self)
	TFDirector:removeMEGlobalListener(PayManager.refreshVIPShop ,self.updateRefreshCallBack);
end

function VipShopLayer.onVipClickHandle(sender)
    local self = sender.logic;
    PayManager:showVipLayer(AlertManager.NONE);
    AlertManager:closeLayer(self); 
end

function VipShopLayer.onPayClickHandle(sender)
   	local self = sender.logic;
   	PayManager:showPayLayer(nil,AlertManager.NONE);
   	AlertManager:closeLayer(self);
end

function VipShopLayer.onRefreshClickHandle(sender)
	local self = sender.logic;
	local vipLevel = MainPlayer:getVipLevel()
	local curTime = MainPlayer:getVipRuleTimesByCode(8888)
	local hasTime = VipData:getVipItemByTypeAndVip(8888,vipLevel).benefit_value
	if (curTime >= hasTime) then
		if (vipLevel == 18) then
			toastMessage(localizable.VipShop_Refresh)
		else
			local vip_level = 0
			for i = 1,10 do 
				local nextTime = VipData:getVipItemByTypeAndVip(8888,vipLevel + i).benefit_value
				if (nextTime > hasTime) then
					vip_level = vipLevel + i
					break;
				end
			end
			local msg = stringUtils.format(localizable.vip_vipShopping_not_enough,vip_level);
			CommonManager:showOperateSureLayer(
                function()
                    PayManager:showPayLayer();
                end,
                nil,
                {
                title = localizable.common_up_vip,
                msg = msg,
                uiconfig = "lua.uiconfig_mango_new.common.NeedTpPayLayer"
                }
        )

		end
	else

		local msg = stringUtils.format(localizable.VipShop_Sure_tips,hasTime - curTime);
		CommonManager:showOperateSureLayer(
            function()
                PayManager:sendVipShopInfo()
            end,
            nil,
            {
            -- title = localizable.common_up_vip,
            msg = msg,
            
            }
		)
		
	end


	
end
return VipShopLayer;