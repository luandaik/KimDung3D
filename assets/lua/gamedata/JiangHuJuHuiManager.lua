-- @Author: crb
-- @Date:   2018-04-08 15:33:14
-- @Last Modified by:   cc
-- @Last Modified time: 2018-04-08 15:46:44


local JiangHuJuHuiManager = class("JiangHuJuHuiManager")

function JiangHuJuHuiManager:ctor(  )
	
end

-- 打开江湖聚惠主界面
function JiangHuJuHuiManager:openJiangHuJuHuiLayer(  )
	AlertManager:addLayerByFile("lua.logic.jianghujuhui.JiangHuJuHuiLayer")
	AlertManager:show()
end


return JiangHuJuHuiManager:new()