--[[
******扫荡N次-奖励说明弹窗*******

    -- by shenjingjie
    -- 2018/3/14
]]

local CrossZhengBaSweepResult = class("CrossZhengBaSweepResult", BaseLayer);

CrossZhengBaSweepResult.LIST_ITEM_HEIGHT = 120; 

-- CrossZhengBaSweepResult.FAIL = 0
-- CrossZhengBaSweepResult.WIN = 1

local isWinTexture = {
	win  = "ui_new/spectrum/img_sheng.png",
	fail = "ui_new/spectrum/img_fu.png"
}


function CrossZhengBaSweepResult:ctor(data)
    self.super.ctor(self,data);
    
    self:init("lua.uiconfig_mango_new.crosszhenba.ZBQuickPassReslutListLayer");
end

function CrossZhengBaSweepResult:initUI(ui)
    self.super.initUI(self,ui);
    self.btn_close      = TFDirector:getChildByPath(ui, 'btn_close');
    self.bg_table       = TFDirector:getChildByPath(ui, 'panel_huadong');


    local list_reward = TFScrollView:create()
    list_reward:setPosition(ccp(0,0))
    list_reward:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
    list_reward:setSize(self.bg_table:getSize())
    list_reward:setBounceEnabled(true);
    self.bg_table:addChild(list_reward)
    self.list_reward = list_reward;
    Public:bindScrollFun(self.list_reward);

    self.panel_cell_model = TFDirector:getChildByPath(ui, 'bg' )
    self.panel_cell_model:removeFromParent()
    self.panel_cell_model:retain()

    self.isWin = false
    self:refreshUI()

end

function CrossZhengBaSweepResult:refreshUI()
	self:loadTotolList()
end


function CrossZhengBaSweepResult:loadTotolList()
    self.list_reward:getInnerContainer():stopAllActions();
    self.list_reward:removeAllChildren();

    self.sweepData = CrossZhengBaManager:getSweepData()
    local reslut_nodeArr = {}
    for index,data in pairs(self.sweepData) do
    	local node = self.panel_cell_model:clone()
    	self:setCellNodeInfo(node,data)
    	node:setPosition(ccp(10,(#self.sweepData - index) * self.LIST_ITEM_HEIGHT))
    	-- node:setPosition(ccp(10,(6 - index) * self.LIST_ITEM_HEIGHT))
    	self.list_reward:addChild(node)
        node:setVisible(false);
       	reslut_nodeArr[index] = node;
    end

    self.list_reward:setInnerContainerSize(CCSizeMake(self.list_reward:getSize().width , #self.sweepData * self.LIST_ITEM_HEIGHT))
    self.list_reward:scrollToYTop(0);
    self.list_reward:setInnerContainerSizeForHeight(#self.sweepData * self.LIST_ITEM_HEIGHT)

    local index = 1;
    self.change = function()
    	reslut_nodeArr[index]:setVisible(true);
    	if index == 1 then
            self.list_reward:scrollToCenterForPositionY(reslut_nodeArr[index]:getPosition().y - 30, 0)
        else
            self.list_reward:scrollToCenterForPositionY(reslut_nodeArr[index]:getPosition().y - 30, 0.2)
        end
        index = index + 1;

        if index <= #self.sweepData then
            if self.reardTimeId then
                TFDirector:removeTimer(self.reardTimeId);
                self.reardTimeId = nil
            end

            self.reardTimeId = TFDirector:addTimer(750, 1 , nil, self.change);
        end

	end

	self.list_reward:scrollToCenterForPositionY(reslut_nodeArr[1]:getPosition().y - 30, 0)
    self.change();
end

function CrossZhengBaSweepResult:removeUI()
    if self.panel_cell_model then
        self.panel_cell_model:release()
        self.panel_cell_model = nil
    end

    -- 关闭界面后,如果有胜利则弹出段位升星特效
    if (self.isWin) then
    	local myChallengeInfo = CrossZhengBaManager:getMyChallengeInfo()
        self.newGrade = myChallengeInfo.grade
        self.newStar = myChallengeInfo.star
		CrossZhengBaManager:openDWLayer(self.newGrade,self.newStar)	   
	end

    self.super.removeUI(self)
end

function CrossZhengBaSweepResult:registerEvents()
	self.super.registerEvents(self)

	ADD_ALERT_CLOSE_LISTENER(self, self.btn_close)
end

function CrossZhengBaSweepResult:removeEvents()

	if self.reardTimeId then
        TFDirector:removeTimer(self.reardTimeId);
        self.reardTimeId = nil
    end
	self.super.removeEvents(self)
end

function CrossZhengBaSweepResult:setCellNodeInfo(node, data)
	local img_win      = TFDirector:getChildByPath(node, 'img_win');
	local txt_name      = TFDirector:getChildByPath(node, 'txt_name');
	local txt_zhandouli      = TFDirector:getChildByPath(node, 'txt_zhandouli');
	local img_light      = TFDirector:getChildByPath(node, 'img_light');
	local txt_num      = TFDirector:getChildByPath(node, 'txt_num');

	local panel_wupin      = TFDirector:getChildByPath(node, 'panel_wupin');
	local bg_icon      = TFDirector:getChildByPath(panel_wupin, 'bg_icon');
	local img_icon      = TFDirector:getChildByPath(panel_wupin, 'img_icon');
	local item_num      = TFDirector:getChildByPath(panel_wupin, 'txt_num');

	img_light:setVisible(false)
	txt_num:setVisible(false)

	--对战信息
	local uiStr = ""
	if (data.isWin == false ) then
		uiStr = isWinTexture.fail
		panel_wupin:setVisible(false)
	else
		--胜利后
		uiStr = isWinTexture.win
		panel_wupin:setVisible(true)
		local itemInfo = BaseDataManager:getReward(data.items[1])
		bg_icon:setTextureNormal(GetColorIconByQuality(itemInfo.quality))
	    img_icon:setTexture(itemInfo.path)
	    item_num:setText(itemInfo.number)
	    Public:addPieceImg(bg_icon, itemInfo);
	    
	    img_light:setVisible(true)
	    txt_num:setVisible(true)
	    txt_num:setText(1)
	    self.isWin = true
	end
	img_win:setTexture(uiStr)
	txt_name:setText(data.name)
	txt_zhandouli:setText(data.power)
end


return CrossZhengBaSweepResult;