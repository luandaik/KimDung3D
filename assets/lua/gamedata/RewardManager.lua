--[[  
******游戏奖励管理类*******

	-- by Stephen.tao   
	-- 2013/11/27
]]

local RewardManager = class('RewardManager')

RewardManager.REWARD_INFO = "RewardManager.REWARD_INFO"

function RewardManager:ctor()
	TFDirector:addProto(s2c.REWARD_INFO, self, self.GetRewardResult);
	TFDirector:addProto(s2c.ACTIVITY_BATTLE_DROP, self, self.GodDropRewardResult);
end

function RewardManager:setReward(rewardArr)
	if #rewardArr > 1 then
		local rewardList = TFArray:new();

		for i=1,#rewardArr do
			local rewardInfo = BaseDataManager:getReward(rewardArr[i])
			if rewardArr[i].type == EnumDropType.WEIWANG then
				MainPlayer.weiwang = MainPlayer.weiwang + rewardArr[i].number
				--TFDirector:dispatchGlobalEventWith(RewardManager.REWARD_INFO,{})
			end
			rewardList:push(rewardInfo);
		end
		self:showRewardListLayer(rewardList)
	end

	if #rewardArr == 1 then
		local rewardInfo = BaseDataManager:getReward(rewardArr[1])
		self:toastRewardMessage(rewardInfo);
	end
end

function RewardManager:GetRewardResult( event )
	hideAllLoading()
	local data = event.data
	if self.stopShow == true and #data.items > 1  then
		self.data = data
		return
	end
	self.data = nil
	self:setReward(data.items)
end


function RewardManager:setStopShow(value)
	self.stopShow = value
	if value == false then
		if self.data == nil then
			return false
		end
		self:setReward(self.data.items)
		self.data = nil
	end
	return true
end

function RewardManager:GodDropRewardResult( event )
	hideAllLoading()
	local data = event.data
	-- print("RewardManager:GodDropRewardResult",data)
	if self.stopGodDropShow == true  then
		self.godDropData = data
		return
	end
	-- print("RewardManager:GodDropRewardResult-->>>")
	self.godDropData = nil
	self:setDropReward(data.itemlist)
end

function RewardManager:setDropReward(rewardArr)
	local rewardList = TFArray:new();
	for i=1,#rewardArr do
		local rewardInfo = BaseDataManager:getReward(rewardArr[i])
		rewardList:push(rewardInfo);
	end
	self:showGodDropRewardListLayer(rewardList)
end

function RewardManager:setStopGodDropShow(value)
	-- print("RewardManager:setStopGodDropShow",value)
	self.stopGodDropShow = value
	if value == false then
		if self.godDropData == nil then
			return false
		end
		-- print("RewardManager:setStopGodDropShow--->>>")
		self:setDropReward(self.godDropData.itemlist)
		self.godDropData = nil
	end
	return true
end

function RewardManager:restart()
	self.stopShow = false
	self.data = nil
end

function RewardManager:toastRewardMessage( reward )
	play_lingqu()

    local toastMessageLayer = ToastMessage:new('lua.uiconfig_mango_new.common.RewardSingleMessage');

    if not position then
        position = ToastMessage.DEFUALT_POSITION
    end
    toastMessageLayer:setPosition(position);

    local img_icon  = TFDirector:getChildByPath(toastMessageLayer, 'img_icon');
    local img_quality  = TFDirector:getChildByPath(toastMessageLayer, 'img_quality');
    local text      = TFDirector:getChildByPath(toastMessageLayer, 'text');
 
 	img_quality:setTexture(GetColorIconByQuality(reward.quality));
    img_icon:setTexture(reward.path);
    
	Public:addPieceImg(img_icon,reward);

	if reward.type == EnumDropType.GOODS and reward.itemid then
		local item = ItemData:objectByID(reward.itemid)

		if item.type == EnumGameItemType.Soul then
    		text:setText(reward.name.." +"..reward.number);
		-- elseif  item.type == EnumGameItemType.Soul  then
		-- 	text:setText(reward.name.."碎片 +"..reward.number);
		else
			text:setText(reward.name.."+"..reward.number);		
		end
	else
		text:setText(reward.name.."+"..reward.number);
	end

	if reward.type == EnumDropType.ROLE then
		local layer = require("lua.logic.shop.GetHeroResultLayer"):new(reward.itemid)
            layer:setReturnFun(function ()
                    AlertManager:close()
                end)
        AlertManager:addLayer(layer, AlertManager.BLOCK)
        AlertManager:show()
    elseif reward.type == EnumDropType.WEIWANG then
		MainPlayer.weiwang = MainPlayer.weiwang + reward.number
		TFDirector:dispatchGlobalEventWith(RewardManager.REWARD_INFO,{})
	end

    toastMessageLayer:beginToast();
    return toastMessageLayer;
end

function RewardManager:showRewardListLayer( rewardList )
	play_lingqu()
   local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.common.RewardListMessage",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);
    layer:loadData(rewardList);
    AlertManager:show();
end

function RewardManager:showGiftListLayer( rewardId,isEnable,callback )
   local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.common.GiftListMessage",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);
    layer:loadData(rewardId,isEnable,callback);
    AlertManager:show();
end

function RewardManager:showGodDropRewardListLayer( rewardList )
	play_lingqu()
   local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.common.GodDropRewardListMessage",AlertManager.BLOCK_AND_GRAY_CLOSE,AlertManager.TWEEN_1);
    layer:loadData(rewardList);
    AlertManager:show();
end

return RewardManager:new()
