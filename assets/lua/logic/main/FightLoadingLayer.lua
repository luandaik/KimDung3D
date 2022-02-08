--[[
******微信*******

]]
local FightLoadingLayer = class("FightLoadingLayer", BaseLayer);

CREATE_SCENE_FUN(FightLoadingLayer);
CREATE_PANEL_FUN(FightLoadingLayer);


function FightLoadingLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.mission.Loading");
end

function FightLoadingLayer:initUI(ui)
    self.super.initUI(self,ui);
    self.img_tips   = TFDirector:getChildByPath(ui, 'Img');
    self.txt_tip   = TFDirector:getChildByPath(ui, 'txt_tip');
    self.bg_bar   = TFDirector:getChildByPath(ui, 'bg_bar');
    self.bar_load   = TFDirector:getChildByPath(ui, 'bar_load');
    self.txt_update   = TFDirector:getChildByPath(ui, 'txt_update');
    self.panel_role   = TFDirector:getChildByPath(ui, 'panel_role');
    self.panel_tip   = TFDirector:getChildByPath(ui, 'panel_tip');
    self.img_big   = TFDirector:getChildByPath(ui, 'img_big');
    self.img_kf = TFDirector:getChildByPath(ui, 'img_kf');

    self.img_liang = TFDirector:getChildByPath(ui, "img_liang")
    self.initPosX = self.img_liang:getPositionX()
    local cancelBtn = TFLabel:create()
    cancelBtn:setTouchEnabled(true)
    -- cancelBtn:setPositionType(TF_POSITION_PERCENT)
    cancelBtn:setPositionPercent(ccp(0.5, 0.5))
    cancelBtn:setText("")
    cancelBtn:setFontSize(25)

    cancelBtn:setPosition(ccp(self.txt_update:getPosition().x, self.txt_update:getPosition().y - 50))
    self.bg_bar:addChild(cancelBtn)
    self.loadtips =  cancelBtn
    -- if self.loading == nil then
    --     local resPath = "effect/loading.xml"
    --     TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
    --     local effect = TFArmature:create("loading_anim")

    --     effect:setAnimationFps(GameConfig.ANIM_FPS)
    --     effect:setPosition(ccp(480, 83))

    --     -- self.img_bg:addChild(effect, 1)

    --     self.bg_bar:addChild(effect, 1)
    --     self.loading = effect
    -- end

    -- self.loading:playByIndex(0, -1, -1, 1)

    self:showHelpText()
end

function FightLoadingLayer:onShow()
    self.super.onShow(self)
end


function FightLoadingLayer:removeUI()
   self.super.removeUI(self);
end
--[[
    @param nDelay:定的时间间隔
    @param nRepeatCount:执行的次数, -1表示无限制
    @param timerCompleteCallBackFunc:定时器完成执行的回调函数
    @param timerCallBackFunc:定时器每执行一次所执行的回调函数
    @return 定时器的id
]]
function FightLoadingLayer:setData( nDelay ,nRepeatCount ,timerCompleteCallBackFunc ,timerCallBackFunc )
    if self.timer ~= nil then
        TFDirector:removeTimer(self.timer)
        self.timer = nil
    end
    self.bar_load:setPercent(0)
    self.img_liang:setPositionX(self.initPosX)
    local sizeX = self.bar_load:getSize().width
    local index = 1
    self.bar_timer = TFDirector:addTimer(50 ,-1 ,nil,function ()
        local percent = math.ceil(index/(nRepeatCount-1)*100)
        local now_percent = self.bar_load:getPercent()
        if now_percent < percent then
            now_percent = now_percent + 5
        end
        if now_percent > percent then
            now_percent = percent
        end
        self.bar_load:setPercent(now_percent)
        self.img_liang:setPositionX(self.initPosX + sizeX * now_percent / 100)

        if now_percent >= 96 then
            self.img_liang:setVisible(false)
        end

        --self.txt_update:setText("正在载入资源···  "..now_percent.."%")
        self.txt_update:setText(stringUtils.format(localizable.fightLoadingLayer_loading,now_percent))
        if now_percent >= 100 then
            --self.txt_update:setText("载入完成 ，正在进入")
            self.txt_update:setText(localizable.fightLoadingLayer_loading_over)
            TFDirector:removeTimer(self.bar_timer)
            self.bar_timer = nil
        end
    end)

    self.timer = TFDirector:addTimer(nDelay ,nRepeatCount ,timerCompleteCallBackFunc,function()
        TFFunction.call(timerCallBackFunc)
        index = index + 1
    end)
end


function FightLoadingLayer:overLoading_Ios()
    if self.timerLoadRoleID ~= nil then
		TFDirector:removeTimer(self.timerLoadRoleID)
		self.timerLoadRoleID = nil
    end
    if self.bar_timer ~= nil then
		TFDirector:removeTimer(self.bar_timer)
		self.bar_timer = nil
    end
    self.bar_load:setPercent(100)
    self.txt_update:setText(localizable.fightLoadingLayer_loading_over)
end
function FightLoadingLayer:setData_Ios(nDelay, nRoleLen, loadRoleOver, loadingRole )
   
	local function _loadRoleOver()
		if self.timerLoadRoleID ~= nil then
			TFDirector:removeTimer(self.timerLoadRoleID)
			self.timerLoadRoleID = nil
		end
		loadRoleOver()
	end
	if self.timerLoadRoleID ~= nil then
		TFDirector:removeTimer(self.timerLoadRoleID)
		self.timerLoadRoleID = nil
	end
	self.timerLoadRoleID = TFDirector:addTimer(nDelay, nRoleLen+1, _loadRoleOver, loadingRole)
   
    if (self.bar_timer) then
       return
    end
    self.loadPercent = 0
    self.bar_load:setPercent(0)
    self.img_liang:setPositionX(self.initPosX)
    local sizeX = self.bar_load:getSize().width
    self.bar_timer = TFDirector:addTimer(50 ,-1 ,nil,function ()
		local percent = math.ceil(self.loadPercent)
        local now_percent = self.bar_load:getPercent()
        if now_percent < percent then
            now_percent = now_percent + 5
        end
        if now_percent > percent then
            now_percent = percent
        end
        self.bar_load:setPercent(now_percent)
        self.img_liang:setPositionX(self.initPosX + sizeX * now_percent / 100)

        if now_percent >= 96 then
            self.img_liang:setVisible(false)
        end

        --self.txt_update:setText("正在载入资源···  "..now_percent.."%")
        self.txt_update:setText(stringUtils.format(localizable.fightLoadingLayer_loading,now_percent))
        if now_percent >= 100 then
            --self.txt_update:setText("载入完成 ，正在进入")
            self.txt_update:setText(localizable.fightLoadingLayer_loading_over)
            TFDirector:removeTimer(self.bar_timer)
            self.bar_timer = nil
        end
	end)
	
end
function FightLoadingLayer:setTips(tips, bAdd)
    do return end
    if (self.loadtips) then
        local str = tips
        if (bAdd) then
            str = self.loadtips:getText().." "..stringUtils.format(localizable.fightLoadingLayer_loadingTips,tips)
        end
        self.loadtips:setText(str)
    end
end

--注册事件
function FightLoadingLayer:registerEvents()
    self.super.registerEvents(self);
end

function FightLoadingLayer:removeEvents()
    self.super.removeEvents(self);
    if self.timer ~= nil then
        TFDirector:removeTimer(self.timer)
        self.timer = nil
    end
    if self.bar_timer ~= nil then
        TFDirector:removeTimer(self.bar_timer)
        self.bar_timer = nil
    end
    if self.timerLoadRoleID ~= nil then
        TFDirector:removeTimer(self.timerLoadRoleID)
        self.timerLoadRoleID = nil
    end
end

function FightLoadingLayer:showHelpText()

    local load_guideList = FightLoadingGuide:getGuildeListByLevel(MainPlayer:getLevel())
    local RegisterTime = MainPlayer:ServerOpenTime()
    local nowTime = MainPlayer:getNowtime()
    local openDay = math.floor((nowTime - RegisterTime) / (24 * 3600))
    local isNeedServerOpenHelp = false

    -- 1）  开服loading图仅在开服7天内才会显示
    -- 2）  开服loading图与其它loading图出现概率比为50%：50%
    -- 3）  3张开服loading图出现概率平均分配，33%：33%：34%
    if (openDay <= 7) then
        isNeedServerOpenHelp = true
    end
    local tips = nil
    while tips == nil do
        local _type = math.random(1, 8)
        if (_type >= 5) then
            if (isNeedServerOpenHelp) then
                _type = 5
            else
                _type = _type - 4
            end
        end

        if load_guideList[_type] ~= nil then
            local randomTip = math.random(1, load_guideList[_type]:length())
            tips = load_guideList[_type]:objectAt(randomTip)
        end

    end

    -- if tips == nil then
    --     return
    -- end
    self.img_kf:setVisible(false)
    if tips.tip_type == 3 then
        self.panel_tip:setVisible(false)
        self.img_big:setVisible(false)
        self.panel_role:setVisible(true)
        self:setHeroLoading( tips ,self.panel_role)
        return
    elseif tips.tip_type == 4 then
        self.panel_tip:setVisible(false)
        self.img_big:setVisible(true)
        self.panel_role:setVisible(false)
        self.img_big:setTexture("ui_new/guide/".. tips.img ..".jpg")
    elseif tips.tip_type == 1 or tips.tip_type == 2 then
        self.panel_tip:setVisible(true)
        self.img_big:setVisible(false)
        self.panel_role:setVisible(false)
        self.img_tips:setTexture("ui_new/guide/".. tips.img ..".jpg")
        local _randomTip = math.random(1, tips.tip_num)
        self.txt_tip:setText(tips["tip".._randomTip])
    elseif tips.tip_type == 5 then
        self.panel_tip:setVisible(false)        
        self.panel_role:setVisible(false)
        self.img_big:setTexture("ui_new/guide/".. tips.img ..".jpg")
        self.img_big:setVisible(true)  
        if (tips.tip1 ~= "") then
            self.img_kf:setVisible(true)
        end

    end
end

function FightLoadingLayer:setHeroLoading( tip ,panel)
    local role_id = tip.img
    local roleInfo = RoleData:objectByID(role_id)
    if roleInfo == nil then
        print("没有角色数据 id== ",role_id)
        return
    end
    local img_role = TFDirector:getChildByPath(panel, 'img_role');
    img_role:setTexture(roleInfo:getBigImagePath())

    local img_quality = TFDirector:getChildByPath(panel, 'img_quality');
    img_quality:setTexture(GetFontByQuality( roleInfo.quality ))

    local img_name = TFDirector:getChildByPath(panel, 'img_name');
    img_name:setTexture("ui_new/guide/".. tip.tip1..".png")

    local img_professional = TFDirector:getChildByPath(panel, 'img_professional');
    img_professional:setTexture("ui_new/guide/icon_zy".. roleInfo.outline..".png")
    local txt_professional = TFDirector:getChildByPath(panel, 'txt_professional');
    txt_professional:setText( roleInfo.attr_description)
    local txt_des = TFDirector:getChildByPath(panel, 'txt_des');
    txt_des:setText( roleInfo.description)


    local skillInfo = SkillBaseData:objectByID(roleInfo.skill)
    if skillInfo == nil then
        print("没有技能信息  skill id== ",roleInfo.skill)
        return
    end

    local img_skill = TFDirector:getChildByPath(panel, 'img_skill');
    img_skill:setTexture(skillInfo:GetPath())
    local txt_skill = TFDirector:getChildByPath(panel, 'txt_skill');
    txt_skill:setText( skillInfo.name)
    local skill_des = TFDirector:getChildByPath(panel, 'skill_des');
    skill_des:setText( skillInfo.description)


end

return FightLoadingLayer;