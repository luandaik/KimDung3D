--[[
 * @Description: 心法碎片界面1
 ]]
-- script writer fei
-- creation time 2017-03-02
local GetSuiPianLayer = class("GetSuiPianLayer", BaseLayer)

function GetSuiPianLayer:ctor()
	self.super.ctor(self)
	self:init("lua.uiconfig_mango_new.xinfa.GetSuiPian")
end

function GetSuiPianLayer:initUI( ui )
    self.super.initUI(self, ui)
    print("GetSuiPianLayer:initUI")
    -- print( TFDirector:getChildByPath(ui, 'img_hechengdiag') )
    self.img_qx_diag        = TFDirector:getChildByPath(ui, 'img_qx_diag')
    self.img_hechengdiag    = TFDirector:getChildByPath(ui, 'img_hechengdiag')
    self.txt_name1          = TFDirector:getChildByPath(ui, 'txt_name1')
    self.txt_name1:setVisible(false)
    self.img_hechengdiag:setVisible(false)
    self.btn_huoqu1             = TFDirector:getChildByPath(ui, 'btn_huoqu1')
    self.itemInfo   = nil
    self.itemId     = 0
    self.itemType   = 0
    self.img_jy1        = TFDirector:getChildByPath(ui, 'img_jy1')
    self.img_jy         = TFDirector:getChildByPath(self.img_jy1, 'img_jy')
    self.txt_bookname   = TFDirector:getChildByPath(self.img_jy1, 'txt_bookname')
    self.txt_bookname:setFontSize(24)
    self.txt_yy         = TFDirector:getChildByPath(self.img_jy1, 'txt_yy')
    self.img_quality    = TFDirector:getChildByPath(ui, 'img_quality')
    self.img_equip      = TFDirector:getChildByPath(self.img_quality, 'img_equip')
    local parent        = self.img_qx_diag:getParent()
    local sizeParent    = parent:getContentSize()
    local sizeImage     = self.img_qx_diag:getContentSize()
    local pos           = self.img_qx_diag:getPosition()

    local center_x = sizeParent.width/2
    local center_y = sizeParent.height/2

    self.img_qx_diag:setPosition(ccp(center_x,center_y))
end

function GetSuiPianLayer:loadData(id,type,canRob)
    self.itemId     = id
    self.itemType = type
    self.canRob = canRob
	self.itemInfo = ItemData:objectByID(id)
    self:refreshUI()
end

function GetSuiPianLayer:removeUI()
	self.super.removeUI(self)
end

function GetSuiPianLayer:openRightArea()   
    local GetSuiPian2Layer = require("lua.logic.xinfa.XinFaGetSuiPian2"):new()
    GetSuiPian2Layer:setPosition(ccp(-207, -281))
    GetSuiPian2Layer:loadData(self.itemId,true)
    -- GetSuiPian2Layer:loadData(self.itemId,self.canRob)
    self.img_hechengdiag:addChild(GetSuiPian2Layer)
    self:resetPosition()
    self.img_hechengdiag:setVisible(true)
end
function GetSuiPianLayer.btnClick(sender)
    local self = sender.logic
    self:openRightArea()
end
function GetSuiPianLayer:resetPosition()
    -- 居中
    local parent        = self.img_qx_diag:getParent()
    local sizeParent    = parent:getContentSize()
    local sizeImage     = self.img_qx_diag:getContentSize()
    local pos           = self.img_qx_diag:getPosition()

    local center_x = sizeParent.width/2
    local center_y = sizeParent.height/2
    local gap      = 20 -- 两个框的间隔


    local left_x   = center_x - gap / 2 - sizeImage.width / 2
    local right_x  = center_x + gap / 2 + sizeImage.width / 2

    -- self.img_qx_diag:setPosition(ccp(left_x,center_y))
    -- self.img_hechengdiag:setPosition(ccp(right_x,center_y))

    -- 开启动画
    self:moveArea(self.img_qx_diag, ccp(left_x,center_y))
    self:moveArea(self.img_hechengdiag, ccp(right_x,center_y))
end

function GetSuiPianLayer:moveArea(target_, toPos)
    local toastTween = {
      target = target_,
      {
        duration = 0.5,
        x = toPos.x,
        y = toPos.y
      },
      {
        duration = 0,
        onComplete = function() 
       end
      }
    }

TFDirector:toTween(toastTween);
end

function GetSuiPianLayer:onShow()
    self.super.onShow(self)
    self:refreshUI()
end

function GetSuiPianLayer:refreshUI()
    if self.itemInfo == nil then
        return
    end
    self.img_jy1:setTexture(GetColorRoadIconByQualitySmall(self.itemInfo.quality))
    self.img_jy:setTexture("icon/item/"..self.itemInfo.display..".png")
    self.img_equip:setTexture("icon/item/"..self.itemInfo.display..".png")
    self.txt_bookname:setText(self.itemInfo.name)
    local num = XinFaManager:getXinFaPieceNumById(self.itemId)
    self.txt_yy:setText("("..localizable.ItemTipLayer_have_txt..num..")")
    self.img_quality:setTextureNormal(getBookBackgroud(self.itemInfo.quality))
    local rewardItem = {itemid = self.itemId}
    Public:addPieceImg(self.img_equip,rewardItem,nil,1.0)
	--self.itemInfo
end

function GetSuiPianLayer.onShowItemClickHandle(sender)
    local self = sender.logic;
    print(self.itemId, self.itemType)
    Public:ShowItemTipLayer(self.itemId, self.itemType)
end

function GetSuiPianLayer:registerEvents()
	self.super.registerEvents(self)
    self.btn_huoqu1.logic = self
	self.btn_huoqu1:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.btnClick),1)
    self.img_quality.logic = self
    self.img_quality:addMEListener(TFWIDGET_CLICK,  audioClickfun(self.onShowItemClickHandle),1)
end

function GetSuiPianLayer:removeEvents()
    self.super.removeEvents(self)
end

return GetSuiPianLayer