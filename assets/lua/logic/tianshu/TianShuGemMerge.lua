-- client side TianShuGemMerge.lua
--[[
 * @Description: 天书宝石合成界面
 ]]
-- script writer wuqi
-- creation time 2016-07-02

local TianShuGemMerge = class("TianShuGemMerge", BaseLayer)

function TianShuGemMerge:ctor(gmId)
    self.super.ctor(self,gmId)
    self.gmId = gmId
    self:init("lua.uiconfig_mango_new.tianshu.TianShuGemMerge")
end

function TianShuGemMerge:initUI(ui)
	self.super.initUI(self,ui)

    self.img_gem_arrow = TFDirector:getChildByPath(ui, 'img_gem_arrow')
    self.txt_gem_target = TFDirector:getChildByPath(ui, 'txt_gem_target')
    self.txt_target_name = TFDirector:getChildByPath(ui, 'txt_target_name')

    --装备图标信息区
	self.gem_table = {}
    for i = 1,EquipmentManager.kGemMergeSrcNum do
        local str = "img_base_gem" .. i
        self.gem_table[i] = TFDirector:getChildByPath(ui, str)
    end

    self.gem_table[EquipmentManager.kGemMergeTargetIndex] = TFDirector:getChildByPath(ui, "img_target_gem")
    self.txt_target_name    = TFDirector:getChildByPath(ui, "txt_target_name")
    self.txt_gem_attr       = TFDirector:getChildByPath(ui, "txt_gem_attr")

end

function TianShuGemMerge:removeUI()
    self.super.removeUI(self)
end

--[[
获取合成特效显示位置
]]
function TianShuGemMerge:getMergeEffectPosition()
    local _parent = self.img_gem_arrow:getParent()
    local pos = _parent:convertToWorldSpaceAR(self.img_gem_arrow:getPosition())
    --print("merge pos : ",pos)
    --pos.x = pos.x + 310
    --pos.y = pos.y + 50
    return pos
end

function TianShuGemMerge:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function TianShuGemMerge:setLogic( layer )
    self.logic = layer
end

function TianShuGemMerge:setGemIconVisiable(visiable)
    for i = 1,#self.gem_table do
        self.gem_table[i]:setVisible(visiable)
    end
    self.txt_target_name:setVisible(visiable)
    self.txt_gem_attr:setVisible(visiable)
end

function TianShuGemMerge:setGmId(gmId)
    self.gmId   = gmId
    self:refreshUI()
end

function TianShuGemMerge:dispose()
    self.super.dispose(self)
end
    
--刷新显示方法
function TianShuGemMerge:refreshUI()
    local srcGem = GemData:objectByID(self.gmId)
    if srcGem then
        self:setGemIconVisiable(true)
    else
        self:setGemIconVisiable(false)
        return
    end

    local srcGoods = ItemData:objectByID(self.gmId)
    local holdGoods = BagManager:getItemById(self.gmId)

    if holdGoods== nil then
        for i = 1,EquipmentManager.kGemMergeSrcNum do
            self.gem_table[i]:setVisible(false)
        end
    else
        for i = 1,EquipmentManager.kGemMergeSrcNum do
            --self.gem_table[i]:setVisible(true)
            self.gem_table[i]:setTexture(srcGoods:GetPath())
        end
        if holdGoods.num < 4 then
            for i = holdGoods.num + 1,EquipmentManager.kGemMergeSrcNum do
                self.gem_table[i]:setVisible(false)
            end
        end
    end

    local target = ItemData:objectByID(srcGem.merge_to)
    if target == nil then
        print("无法找到该宝石的数据  id" == srcGem.merge_to)
        return
    end
    local targetGoods = ItemData:objectByID(target.id)

    local targetAttr = GemData:objectByID(target.id)
    if targetAttr == nil  then
        return
    end

    self.txt_gem_target:setVisible(true)
    self.txt_gem_attr:setVisible(true)
    self.gem_table[5]:setVisible(true)
    self.txt_target_name:setText(targetGoods.name)
    if targetAttr.attribute and targetAttr.attribute ~= "" then 
        local attr_index,attr_num = targetAttr:getAttribute()
        self.txt_gem_attr:setText(AttributeTypeStr[attr_index].."+"..covertToDisplayValue(attr_index,attr_num,true))
    elseif targetAttr.immune and targetAttr.immune ~= "" then
        local attr_index,attr_num = targetAttr:getExtraAttribute(targetAttr.immune)
        self.txt_gem_attr:setText(SkillBuffHurtStr[attr_index]..' +'..covertToDisplayValue(attr_index,attr_num,true) )   
    elseif targetAttr.effect_extra and targetAttr.effect_extra ~= "" then
        local attr_index,attr_num = targetAttr:getExtraAttribute(targetAttr.effect_extra)
        self.txt_gem_attr:setText(SkillBuffHurtStr[attr_index]..' +'..covertToDisplayValue(attr_index,attr_num,true) )   
    elseif targetAttr.be_effect_extra and targetAttr.be_effect_extra ~= "" then
        local attr_index,attr_num = targetAttr:getExtraAttribute(targetAttr.be_effect_extra)
        self.txt_gem_attr:setText(BeEffectExtraStr[attr_index]..' +'..covertToDisplayValue(attr_index,attr_num,true) )        
    end
    self.gem_table[5]:setTexture(targetGoods:GetPath())
end

function TianShuGemMerge:registerEvents()
	self.super.registerEvents(self)
end

function TianShuGemMerge:removeEvents()
    self.super.removeEvents(self)
end

return TianShuGemMerge
