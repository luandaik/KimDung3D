-- client side CrossZhengBacell.lua
--[[
 * @Description: Description
 ]]
-- script writer chikui
-- creation time 2017-03-03


local CrossZhengBacell = class("CrossZhengBacell", BaseLayer)

function CrossZhengBacell:ctor(data)

	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.Leaderboard.Leaderboardcell_tianjiebang")

end

function CrossZhengBacell:initUI( ui )

	self.super.initUI(self, ui)

	self.bg = TFDirector:getChildByPath(ui, "bg")
	self.bg.logic = self
	self.bg:setTouchEnabled(true)
	
	
	--选择框设置不可见
	self.bg_select = TFDirector:getChildByPath(ui, "bg_select")
	self.bg_select:setVisible(false)

	self.Img_paiming = TFDirector:getChildByPath(ui, "Img_paiming")
	self.txt_paiming = TFDirector:getChildByPath(ui, "txt_paiming")
	self.txt_name = TFDirector:getChildByPath(ui, "txt_name")
	self.img_icon = TFDirector:getChildByPath(ui, "img_icon")
	self.txt_level = TFDirector:getChildByPath(ui, "txt_level")
	self.txt_server = TFDirector:getChildByPath(ui, "txt_fuwuqi")
	self.txt_starnumber = TFDirector:getChildByPath(ui, "txt_starnumber")

	self.btn_more = TFDirector:getChildByPath(ui, "btn_more")
	self.btn_more.logic = self
	self.btn_more:setVisible(false)

	self.Img_paiming_data = {'ui_new/leaderboard/no1.png','ui_new/leaderboard/no2.png','ui_new/leaderboard/no3.png'}

end

function CrossZhengBacell:removeUI()
	self.super.removeUI(self)	
end

function CrossZhengBacell:registerEvents()
	self.super.registerEvents(self)

	self.btn_more:addMEListener(TFWIDGET_CLICK, audioClickfun(self.GetMoreButtonClick))


	self.bg:addMEListener(TFWIDGET_CLICK, audioClickfun(self.touchBgCell))
end

function CrossZhengBacell:dispose()
	 self:removeEvents()
	 self:removeUI()
end
function CrossZhengBacell:removeEvents()

    self.super.removeEvents(self)

    self.btn_more:removeMEListener(TFWIDGET_CLICK)
    self.bg:removeMEListener(TFWIDGET_CLICK)
end

function CrossZhengBacell:SetData(layer,item)
	
	self.layer = layer
	self.item = item

	self.txt_server:setVisible(false)
	if item == nil then
		--加载更多
		self.moreBtnType = true
		self.bg:setVisible(false)
		self.btn_more:setVisible(true)
	else
		self.moreBtnType = false
		self.bg:setVisible(true)
		self.btn_more:setVisible(false)

		--设置选中框是否可见
		if item.ranking == layer.cell_select_index then
			self.bg_select:setVisible(true)
		else
			self.bg_select:setVisible(false)
		end

		--设置名次
		if item.ranking <= 3 then
			self.Img_paiming:setVisible(true)
			self.Img_paiming:setTexture(self.Img_paiming_data[item.ranking])
			self.txt_paiming:setVisible(false)
		else
			self.Img_paiming:setVisible(false)
			self.txt_paiming:setVisible(true)
			self.txt_paiming:setString(item.ranking)
		end
		local itemData = CrossZhengBaManager:getData(item.grade)
		if itemData == nil then
			itemData = CrossZhengBaManager:getData(1)
		end
		self.txt_name:setText(item.name)
		self.txt_level:setText(itemData.name)
		self.txt_server:setVisible(true)
		self.txt_server:setText(item.serverName)
		self.txt_starnumber:setText(item.star)
		local path = CrossZhengBaManager:getSmallGradeImg(item.grade)
		self.img_icon:setTexture(path)
	end

end

function CrossZhengBacell:setChoiseVisiable( enable )
	self.bg_select:setVisible(enable)
end
function CrossZhengBacell.GetMoreButtonClick(btn)

	local self = btn.logic
	self.layer:UpdateList()	
end

function CrossZhengBacell.touchBgCell( btn )
	local self = btn.logic
	self.layer:tableCellSelect(self.item.ranking)
end

function CrossZhengBacell:isMoreButton()
	return self.moreBtnType
end

return CrossZhengBacell