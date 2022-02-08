--[[
******无量山-万能副本详情*******

    -- by haidong.gan
    -- 2013/11/27
]]
local CarbonMountainChoose = class("CarbonMountainChoose", BaseLayer)

CREATE_SCENE_FUN(CarbonMountainChoose)
CREATE_PANEL_FUN(CarbonMountainChoose)

CarbonMountainChoose.LIST_ITEM_WIDTH = 200 
local difficultyImg = { "ui_new/climb/MK_putong3.png",
                        "ui_new/climb/MK_kunnan2.png",   --困难
                        "ui_new/climb/MK_zongshi2.png",  --宗师
                        "ui_new/climb/MK_cs2.png",       --传说
                        "ui_new/climb/MK_cf2.png",       --超凡
                        "ui_new/climb/MK_ws2.png",       --无双
                        "ui_new/climb/MK_sh2.png"        --神话
                      }
function CarbonMountainChoose:ctor(data)
    self.super.ctor(self,data)
    self:init("lua.uiconfig_mango_new.climb.CarbonMountainChoose")
end

function CarbonMountainChoose:initUI(ui)
    self.super.initUI(self,ui)

    self.Panel_Content = TFDirector:getChildByPath(ui, 'Panel_Content')

    -- self.btn_close          = TFDirector:getChildByPath(ui, 'btn_close')

    self.btn_1 = TFDirector:getChildByPath(ui, 'btn_pt')
    self.btn_2 = TFDirector:getChildByPath(ui, 'btn_kn')
    self.btn_3 = TFDirector:getChildByPath(ui, 'btn_zs')
    self.btn_4 = TFDirector:getChildByPath(ui, 'btn_cs')
    self.btn_5 = TFDirector:getChildByPath(ui, 'btn_cf')
    self.btn_6 = TFDirector:getChildByPath(ui, 'btn_ws')
    self.btn_7 = TFDirector:getChildByPath(ui, 'btn_sh')

    self.btn_1.index = 1
    self.btn_1.logic = self
    self.btn_2.index = 2
    self.btn_2.logic = self
    self.btn_3.index = 3
    self.btn_3.logic = self
    self.btn_4.index = 4
    self.btn_4.logic = self
    self.btn_5.index = 5
    self.btn_5.logic = self
    self.btn_6.index = 6
    self.btn_6.logic = self
    self.btn_7.index = 7
    self.btn_7.logic = self

    self.txt_times = TFDirector:getChildByPath(ui, 'txt_num')



    self.btnList = {}
    self.btnList[1] = self.btn_1
    self.btnList[2] = self.btn_2
    self.btnList[3] = self.btn_3
    self.btnList[4] = self.btn_4
    self.btnList[5] = self.btn_5
    self.btnList[6] = self.btn_6
    self.btnList[7] = self.btn_7

    self.descList = {}
    self.starList = {}
    for i=1,7 do
        self.descList[i] = TFDirector:getChildByPath(self.btnList[i], 'txt_yikaiqi')
        self.starList[i] = {}
        for j=1,3 do
            local starNode = TFDirector:getChildByPath(self.btnList[i], 'img_stardi'..j)
            self.starList[i][j] = TFDirector:getChildByPath(starNode, 'img_star')
        end
    end

end

function CarbonMountainChoose:loadData(stage)
    -- self.carbonItem = MoHeYaConfigure:objectAt(index)
    print("CarbonMountainChoose:loadData carbonStage = ", stage)
    self.stage = stage
    self.stageList = {}
    for item in MoHeYaConfigure:iterator() do
        if (item.stage == self.stage) then
            self.stageList[item.difficulty] = item
        end
    end
    -- table.sort( self.stageList, function(a, b)
    --                                     return tonumber(a.difficulty) < tonumber(a.difficulty) 
    --                             end )
    print("self.stageList  ",self.stageList)
end

function CarbonMountainChoose:onShow()
    self.super.onShow(self)
    self:refreshUI()
    self:refreshBaseUI()
end

function CarbonMountainChoose:refreshBaseUI()

end

function CarbonMountainChoose:refreshUI()
    if not self.isShow then
        return
    end
    local stage         = self.stage
    local carbonItem    = self.stageList[1]

    local resInfo = MainPlayer:GetChallengeTimesInfo(carbonItem.res_type)
    self.txt_times:setText(resInfo.currentValue)
    local playerLevel = MainPlayer:getLevel()
    local desc = ""

    for i,v in ipairs(self.btnList) do
        local carbonItemDiff = self.stageList[i]
        if (carbonItemDiff) then
            if carbonItemDiff.open_level >  playerLevel then
                self.btnList[i]:setTextureNormal(difficultyImg[i]);
                desc = stringUtils.format(localizable.common_open_level, carbonItemDiff.open_level)
            else
                desc  = localizable.commom_open
            end
            local star = ClimbManager:getCarbonStarByID(carbonItemDiff.id)
            for j=1,3 do
                if j <= star then
                    self.starList[i][j]:setVisible(true)
                else
                    self.starList[i][j]:setVisible(false)
                end
            end
        end
        self.descList[i]:setText(desc)    
    end
end




--   local status = MissionManager:getMissionPassStatus(missionId)
function CarbonMountainChoose.onAttackClickHandle(sender)
    local self = sender.logic
    print("onAttackClickHandle self.index = ", self.index)
    local carbonItem = nil
    for i,v in ipairs(self.stageList) do
        if (v.difficulty == sender.index) then
            carbonItem = v
            break
        end
    end
    if (carbonItem == nil) then
        print(sender.index,"*********************没有此等级***************************")
        return
    end
-- 781号bug 策划说的要优化  策划：司徒。。。以后有问题找她

    local resConfigure          = PlayerResConfigure:objectByID(carbonItem.res_type)
    local resInfo               = MainPlayer:GetChallengeTimesInfo(carbonItem.res_type)
    local waitRemainExpression  = resInfo:getWaitTimeExpression()

    if resInfo.currentValue < 1 then
        --toastMessage("今日挑战次数已用完")
        toastMessage(localizable.common_fight_times)
        return
    elseif waitRemainExpression ~= nil then
        --toastMessage("冷却 " .. waitRemainExpression .. " 后可再挑战")
        toastMessage(stringUtils.format(localizable.carbonMountain_cd,waitRemainExpression))
        return
    end
--***********************************************
    local index = carbonItem.id

    AlertManager:close()
    ClimbManager:showCarbonDetailLayer(index)
end


--注册事件
function CarbonMountainChoose:registerEvents()
   self.super.registerEvents(self)

   ADD_ALERT_CLOSE_LISTENER(self, self.Panel_Content)
   --  self.btn_close:setClickAreaLength(100)

   for i,v in ipairs(self.btnList) do
       v:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onAttackClickHandle),1)
   end
end

function CarbonMountainChoose:removeEvents()

end



return CarbonMountainChoose
