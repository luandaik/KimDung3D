
local DefaultLayer = class("DefaultLayer", function(...)
	local layer = TFPanel:create()
	return layer
end)


local displayResList = require('default.defultdisplay')

function DefaultLayer:ctor(data)

	self.picNum = 0
	for k,display in pairs(displayResList) do
		-- print("display: ", display)

		self.picNum = self.picNum + 1
	end

	self.picIndex = 1
	-- print("self.picNum = ", self.picNum )

	if self.picNum < 1 then
		-- print("没有默认图片， 直接进入游戏")
		local function delayToGame()
	    	TFDirector:removeTimer(self.timer)
	        self.timer = nil

	        self:enterGame()
	    end
	    self.timer = TFDirector:addTimer(100, -1, nil, delayToGame)
		return
	end



    self:changeImage()

    local function delayToAction()
    	TFDirector:removeTimer(self.timer)
        self.timer = nil

        self:startAction()
    end
    self.timer = TFDirector:addTimer(500, -1, nil, delayToAction)
end



function DefaultLayer:removeUI()

end

function DefaultLayer:registerEvents()

end

function DefaultLayer:removeEvents()
	TFDirector:removeTimer(self.timer)
    self.timer = nil
end

function DefaultLayer:changeImage()

	if self.showImage then
		self.showImage:removeFromParent()
		self.showImage = nil
	end

	-- print("显示图片 = ", displayResList[self.picIndex].name)

	local image = TFImage:create()

    image:setTexture(displayResList[self.picIndex].name)
    image:setAnchorPoint(ccp(0.5, 0.5))
    self:addChild(image)

    local pDirector = CCDirector:sharedDirector()


    -- local frameSize = pDirector:getOpenGLView():getFrameSize()
    local frameSize = GameConfig.WS--pDirector:getOpenGLView():getFrameSize()
    image:setPosition(ccp(frameSize.width/2, frameSize.height/2))

    local imageSize  	= image:getSize()
    local imageWidth 	= imageSize.width
    local imageHeight 	= imageSize.height

    image:setScaleX(frameSize.width/imageWidth)
    image:setScaleY(frameSize.height/imageHeight)


    -- print("frameSize = ", frameSize)
    -- print("imageWidth = ", imageWidth)
    -- print("imageHeight = ", imageHeight)
    --
    self.showImage = image
end

-- 开始
function DefaultLayer:startAction()
	function fadeOut()
		-- print("imageAction")
		local tween =
	    {
	        target = self.showImage,

	        {
            	duration = 1,
            	alpha 	 = 0,
	    	},

	        {
		        duration = 0,
	            onComplete = function ()
		            TFDirector:killAllTween()
	                -- print("step action complete")
	                self.picIndex = self.picIndex + 1
	                -- print("self.picIndex = ", self.picIndex)
	                if self.picIndex > self.picNum then
	                	-- print("显示完成，准备进入游戏")
	                	self:enterGame()
	                else
	                	-- print("开始下一场图片")
	                	self:changeImage()
	                	self:startAction()
	                end
	            end,
	        }

	    }
	    TFDirector:toTween(tween)
	end

	-- self:enterGame()

	local function fadeInAndOut()
		local tween =
	    {
	        target = self.showImage,

	        {
	         	ease = {type=TFEaseType.EASE_IN, rate=5}, --由慢到快
            	duration = 1,
            	alpha 	 = 1,
	    	},

	        {
            	duration = 1,
            	alpha 	 = 0,
	    	},

	        {
		        duration = 0,
	            onComplete = function ()
		            TFDirector:killAllTween()
	                self.picIndex = self.picIndex + 1
	                if self.picIndex > self.picNum then
	                	-- print("显示完成，准备进入游戏")
	                	self:enterGame()
	                else
	                	-- print("开始下一场图片")
	                	self:changeImage()
	                	self:startAction()
	                end
	            end,
	        }

	    }
	    TFDirector:toTween(tween)
	end

	if self.picIndex > 1 then
		self.showImage:setAlpha(0)
		fadeInAndOut()
	else
		fadeOut()
	end

end



function DefaultLayer:enterGame()
	if TFClientObbDownload and TFPlugins.isUseObbDown then
		if TFClientObbDownload:GetInstance():CheckDownloadObb("http://dx.pic.infinite.tw/mhqx/twcs/ios/") then
    		local ObbDownlaodLayer = require("lua.logic.login.ObbDownloadLayer")
    		AlertManager:changeScene(ObbDownlaodLayer:scene())
    		return
    	end
	end

	if TFClientResourceUpdate == nil then
        local UpdateLayer   = require("lua.logic.login.UpdateLayer")
        AlertManager:changeScene(UpdateLayer:scene())
    else
        local UpdateLayer   = require("lua.logic.login.UpdateLayer_new")
        AlertManager:changeScene(UpdateLayer:scene())
    end
end

return DefaultLayer