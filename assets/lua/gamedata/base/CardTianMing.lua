
--[[
******天命类*******

]]


local GameObject 		= require('lua.gamedata.base.GameObject')
local GameAttributeData = require('lua.gamedata.base.GameAttributeData')
local EffectExtraData = clone(EffectExtraDataModel)

local CardTianMing 		= class("CardTianMing",GameObject)


function CardTianMing:ctor( Data )
	self.super.ctor(self)
	self:init(Data)

end

function CardTianMing:init( id )
	self.totalAttribute 			= EffectExtraData:new()   --总加成
	self.irtotalAttribute 			= EffectExtraData:new()   --总加成
	self.eatotalAttribute 			= EffectExtraData:new()   --总加成
	self.eptotalAttribute 			= EffectExtraData:new()   --总加成

	self.instanceId 			= id  					--唯一id
	self.itemId 				= 0						--物品id
	self.level  				= 0						--等级
	self.exp 					= 0 					--经验值
	self.equip 					= nil 					--装备者
	self.quality 				= 0 					--品质
	self.pos 					= 0
	self.config 				= nil
	self.power 					= 0 					--战力
	self.starLevel  			= 0 					--镶星等级
	self.starnum                = 0 					--镶星数
	self.starPercent 			= 0 					--天命镶星加成百分比
end

function CardTianMing:setData(data)
	if data.instanceId then
		self.instanceId = data.instanceId
	end

	if data.templateId then
		self.itemId = data.templateId
		self.config = ItemData:objectByID(self.itemId)
	end

	if data.roleId then
		self.equip = data.roleId
	end

	if data.stepExp then
		self.exp = data.stepExp
	end
	
	if data.quality then
		self.quality = data.quality
	end

	if data.pos then
		self.pos = data.pos
	end
	
	if data.level then
		self.level = data.level
	end

	if data.starLevel then
		self.starLevel = data.starLevel
	end
	if data.star then
		self.starnum = data.star
	end
	
	self:updateAttr()
end
function CardTianMing:updateAttr()
	self.totalAttribute:clear()
	self.irtotalAttribute:clear()
	self.eatotalAttribute:clear()
	self.eptotalAttribute:clear()
	self.power = 0
	if (self.config.special_equipment == 1) then
		return
	end
	--基本属性
	local ir_tbl0,ea_tbl0,ep_tbl0,power = DesTinyData:getTianMingAttrByTypeAndQualityLevel(self.config.kind,self.quality,self.level)
	--镶星属性
	local Type = 1
	if self.config.kind < 15 then
		Type = 1
	else
		Type = 2
	end
	--品质4以上才有加成
	if self.quality >= 4 then
		self.starPercent = DesTinyStarData:getAttributeByTypeandLevelandStarQuality(Type,self.starLevel,self.starnum,self.quality)
		if self.starPercent == nil then
			return
		end
		for i,v in pairs(ir_tbl0) do
			ir_tbl0[i] = math.ceil(v * ( 1 + self.starPercent/10000))
		end
	
		for i,v in pairs(ea_tbl0) do
			ea_tbl0[i] = math.ceil(v * ( 1 + self.starPercent/10000))
		end
	
		for i,v in pairs(ep_tbl0) do
			ep_tbl0[i] = math.ceil(v * ( 1 + self.starPercent/10000))
		end

		power = math.ceil(power * ( 1 + self.starPercent/10000))
		
	end
	self.totalAttribute:add(ir_tbl0)
	self.totalAttribute:add(ea_tbl0)
	self.totalAttribute:add(ep_tbl0)
	self.irtotalAttribute:add(ir_tbl0)
	self.eatotalAttribute:add(ea_tbl0)
	self.eptotalAttribute:add(ep_tbl0)
	self.power = power
end
function CardTianMing:getpower()
	return GetPowerByAttribute(self.totalAttribute.attribute) + self.power
end
function CardTianMing:setTianMingstarLevel(level)
	self.starLevel = level 
end
function CardTianMing:setTianMingstarNum(num)
	self.starnum = num 
end
function CardTianMing:dispose()
	self.super.dispose(self)
	
	self.instanceId 	= 0
	self.itemId 		= 0
	self.level  				= 0						
	self.exp 					= 0 					
	self.equip 					= nil 					
	self.quality 				= 0 				
	self.pos 					= 0
	self.config 				= nil
	self.power 					= 0 					--战力

	TFDirector:unRequire('lua.gamedata.base.GameObject')
	TFDirector:unRequire('lua.gamedata.base.GameAttributeData')
end

return CardTianMing