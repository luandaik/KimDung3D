--              script writer fei
--              creation time20170608
--              Description:秘要
--　　　　　　　　┏┓　　　┏┓+ +
--　　　　　　　┏┛┻━━━┛┻┓ + +
--　　　　　　　┃　　　　　　　┃ 　
--　　　　　　　┃　　　━　　　┃ ++ + + +
--　　　　　　 ████━████ ┃+
--　　　　　　　┃　　　　　　　┃ +
--　　　　　　　┃　　　┻　　　┃
--　　　　　　　┃　　　　　　　┃ + +
--　　　　　　　┗━┓　　　┏━┛
--　　　　　　　　　┃　　　┃　　　　　　
--　　　　　　　　　┃　　　┃ + + + +
--　　　　　　　　　┃　　　┃　　　　　　
--　　　　　　　　　┃　　　┃ + 　　　　神兽保佑,代码无bug　　
--　　　　　　　　　┃　　　┃
--　　　　　　　　　┃　　　┃　　+　　　　　　　　
--　　　　　　　　　┃　 　　┗━━━┓ + +
--　　　　　　　　　┃ 　　　　　　　┣┓
--　　　　　　　　　┃ 　　　　　　　┏┛
--　　　　　　　　　┗┓┓┏━┳┓┏┛ + + + +
--　　　　　　　　　　┃┫┫　┃┫┫
--　　　　　　　　　　┗┻┛　┗┻┛+ + + +

local MiYaoDetails = class("MiYaoDetails", BaseLayer)

function MiYaoDetails:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.bag.MiYaoDetails")
end

function MiYaoDetails:initUI(ui)
	self.super.initUI(self,ui)
    --
    self.panel_root         = TFDirector:getChildByPath(ui, 'panel_root')
    self.panel_details      = TFDirector:getChildByPath(ui, 'panel_details')
    self.panel_elements     = TFDirector:getChildByPath(ui, 'panel_elements')
	--左侧详情
	self.btn_icon	 		= TFDirector:getChildByPath(ui, 'btn_node')
	self.img_icon	 		= TFDirector:getChildByPath(ui, 'img_icon')
	self.txt_Num			= TFDirector:getChildByPath(ui, 'txt_number')
	self.txt_Name 			= TFDirector:getChildByPath(ui, 'txt_name')
	self.txt_description    = TFDirector:getChildByPath(ui, 'txt_description')
    self.lbl_tips           = TFDirector:getChildByPath(ui, 'lbl_tips')
    self.txt_qianghualv     = TFDirector:getChildByPath(ui, 'txt_qianghualv')
    self.txt_qianghualv:setVisible(false)
    self.btn_yanxi = TFDirector:getChildByPath(ui, 'btn_yanxi')
    self.btn_yanxi:setVisible(true)

    self.txt_own_word = TFDirector:getChildByPath(ui, "txt_own_word")

    self.img_baoshicao = TFDirector:getChildByPath(ui, "img_baoshicao1")
    self.img_gem = TFDirector:getChildByPath(self.img_baoshicao, "img_gem1")

    self.img_baoshicao2 = TFDirector:getChildByPath(ui, "img_baoshicao2")
    self.img_gem2 = TFDirector:getChildByPath(self.img_baoshicao2, "img_gem1")
end


function MiYaoDetails:setHomeLayer(homeLayer)
    self.homeLayer = homeLayer
end

function MiYaoDetails:removeUI()
    self.panel_root = nil
	self.btn_icon = nil
	self.img_icon = nil
	self.txt_Num = nil
	self.txt_name = nil
	self.img_quality = nil
	self.txt_description = nil
	self.btn_recruit = nil
	self.tableView = nil
	self.panel_table = nil
    self.panel_details_bg = nil
    self.textLabel = nil
    self.super.removeUI(self)
end

function MiYaoDetails:refreshUI()
    if not self.id then
        return
    end
    local data = BagManager:getMiYaoByType(nil, self.id)
    if not data then
        self.panel_details:setVisible(false)
        self.btn_yanxi.miYaoId = nil
        return
    end
    self.panel_details:setVisible(true)
    self.txt_Name:setText(data.itemdata.name)
    self.img_icon:setTexture(data.itemdata:GetPath())
    self.btn_icon:setTextureNormal(GetColorIconByQuality(data.itemdata.quality))
    -- self.txt_Num:setText(data.num)
    self.txt_Num:setVisible(false)
    self.txt_description:setText(data.itemdata.details)

    local rewardItem = {itemid = data.itemdata.id}
    Public:addPieceImg(self.img_icon,rewardItem,nil,1.0)
    self.txt_qianghualv:setText(stringUtils.format(localizable.Tianshu_MiYai_Tips1, numberToChinese(data.level)))
    self.txt_qianghualv:setVisible(true)
    -- self.txt_qianghualv:setText(numberToChinese(data.level))
    -- if (self.textLabel == nil) then
    --     local textLabel = TFTextArea:create()
    --     textLabel:setAnchorPoint(self.txt_qianghualv:getAnchorPoint())
    --     textLabel:setPosition(self.txt_qianghualv:getPosition())
    --     self.btn_icon:addChild(textLabel, 9)
    --     textLabel:setFontSize(20)
    --     self.textLabel = textLabel
    -- end
    -- self.textLabel:setText((stringUtils.format(localizable.Tianshu_MiYai_Tips1, numberToChinese(data.level))))
    self.miYaoId = data.instanceId
end

--设置物品数据
function MiYaoDetails:setData(data)
	if data == nil  then
        self.panel_details:setVisible(false)
		return false
	end
    self.toolNum = data.num
    self.panel_details:setVisible(true)
	self.id = data.instanceId
	self:refreshUI()
end

--使用按钮点击事件处理方法
function MiYaoDetails.yanxiButtonClickHandle(sender)
    local self = sender.logic
    self.miYaoId = self.miYaoId or 1
    SkyBookManager:OpenMiYaoLayer(nil, nil, 0, self.miYaoId)
end

function MiYaoDetails:registerEvents()
    self.super.registerEvents(self)

    --按钮事件
    self.btn_yanxi:addMEListener(TFWIDGET_CLICK, audioClickfun(self.yanxiButtonClickHandle),1)
    self.btn_yanxi.logic = self   
end

--销毁方法
function MiYaoDetails:dispose()
    self.super.dispose(self)
end

function MiYaoDetails:removeEvents()
    self.btn_yanxi:removeMEListener(TFWIDGET_CLICK)
 
    self.super.removeEvents(self)
end

return MiYaoDetails
