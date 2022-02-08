--[[
    战力考校
]]

local KaojiaoLayer = class("KaojiaoLayer", BaseLayer)

KaojiaoLayer.TYPE_ZHENRONG = 
{
    SINGLE = 1,
    DOUBLE = 2
}

KaojiaoLayer.texureFenlei = 
{
    [1] = "ui_new/BeStrong/chengzhangzhpf.png",
    [2] = "ui_new/BeStrong/zhuangbeizhpf.png",
    [3] = "ui_new/BeStrong/tianshuzhpf.png",
    [4] = "ui_new/BeStrong/zhenfazhpf.png",
    [5] = "ui_new/BeStrong/zhanchongzhpf.png",
}

KaojiaoLayer.texurePingfenIcon = 
{
    [1] = "ui_new/BeStrong/icon_juelun.png",
    [2] = "ui_new/BeStrong/icon_zhuoyue.png",
    [3] = "ui_new/BeStrong/icon_jiechu.png",
    [4] = "ui_new/BeStrong/icon_pingfan.png"
}

KaojiaoLayer.texurePingfen = 
{
    [1] = "ui_new/BeStrong/txt_juelun.png",
    [2] = "ui_new/BeStrong/txt_zhuoyue.png",
    [3] = "ui_new/BeStrong/txt_jiechu.png",
    [4] = "ui_new/BeStrong/txt_pingfan.png"
}

KaojiaoLayer.textureCellIcon = 
{
    [1] = 
    {
        "ui_new/BeStrong/icon_xkdengji.png",
        "ui_new/BeStrong/icon_chengzhang.png",
        "ui_new/BeStrong/icon_xkwuxue.png",
        "ui_new/BeStrong/icon_xkwuxue.png",
        "ui_new/BeStrong/icon_xkjineng.png",
        "ui_new/BeStrong/icon_xkchongxue.png",
        "ui_new/BeStrong/icon_xktupo.png",
        "ui_new/BeStrong/icon_xklianti.png",
        "ui_new/BeStrong/icon_xkqimendun.png",
        "ui_new/BeStrong/icon_xkqihe.png",
        "ui_new/BeStrong/icon_qianxiu.png"

    },
    [2] = 
    {
        "ui_new/BeStrong/icon_zbpinzhi.png",
        "ui_new/BeStrong/icon_zbpinzhi.png",
        "ui_new/BeStrong/icon_zbqianghua.png",
        "ui_new/BeStrong/icon_zbshengxing.png",
        "ui_new/BeStrong/icon_zbtupo.png",
        "ui_new/BeStrong/icon_zbjinglian.png",
        "ui_new/BeStrong/icon_zbchongzhu.png",
        "ui_new/BeStrong/icon_zbxiangqian.png",
        "ui_new/BeStrong/icon_shengjie.png"
    },
    [3] = 
    {
        "ui_new/BeStrong/icon_tspinzhi.png",
        "ui_new/BeStrong/icon_tspinzhi.png",
        "ui_new/BeStrong/icon_tsjingyao.png",
        "ui_new/BeStrong/icon_tstupo.png",
        "ui_new/BeStrong/icon_tsshengchong.png"      
    },
    [4] = 
    {
        "ui_new/BeStrong/icon_zhenfapinzhi.png",
        "ui_new/BeStrong/icon_zhenfaqianghua.png",
        "ui_new/BeStrong/icon_zhenfatupo.png",
    },
    [5] = 
    {
        "ui_new/BeStrong/icon_zhanchong.png",
        "ui_new/BeStrong/icon_zhanchong.png",
        "ui_new/BeStrong/icon_zhanchong.png"
    }
}

KaojiaoLayer.txtGood = localizable.KaojiaoLayer_TxtGood
KaojiaoLayer.txtOneKeySuccess = localizable.KaojiaoLayer_TxtOneKeySuccess

function KaojiaoLayer:ctor(data)
    self.super.ctor(self, data);
    self:init("lua.uiconfig_mango_new.BeStrong.BeStrong");

    self.zhenrong_type = self.TYPE_ZHENRONG.SINGLE
    self.roleList1 = {}
    self.roleList2 = {}
    self.tab1 = {}
    self.tab2 = {}
    self.tab2_new = {}
    self.cur_page = 1
    self.cells = {}
    self.oldScore = 0
    self.firstPer = 0
    self.firstDoAct = true

    self.firstShow = true
    EquipmentManager:initQualityMap()
    self.btn_danzhenrong:setVisible(false)
    self.btn_shuangzhenrong:setVisible(false)
end

function KaojiaoLayer:loadData(roleGmId,type)
    
end

function KaojiaoLayer:removeUI()
    self.super.removeUI(self)

    -- for i = 1, 4 do
    --     if self.img_daxiangbg_tab[i]:getParent() then
    --         self.img_daxiangbg_tab[i]:removeFromParentAndCleanup(true)
    --     end
    --     self.img_daxiangbg_tab[i]:release()
    --     self.img_daxiangbg_tab[i] = nil
    -- end

    -- for i = 1, 30 do
    --     if self.img_xiaoxiangbg_tab[i]:getParent() then
    --         self.img_xiaoxiangbg_tab[i]:removeFromParentAndCleanup(true)
    --     end
    --     self.img_xiaoxiangbg_tab[i]:release()
    --     self.img_xiaoxiangbg_tab[i] = nil
    -- end
    if self.img_xiaoxiangbg then
        self.img_xiaoxiangbg:release()
        self.img_xiaoxiangbg = nil
    end
    if self.img_daxiangbg then
        self.img_daxiangbg:release()
        self.img_daxiangbg = nil
    end
    
    KaojiaoManager.roleScoreTab = nil
    KaojiaoManager.checkTab = nil
end

function KaojiaoLayer:onShow()
    self.super.onShow(self)
    self:refreshUI();

    if self.firstShow == true then
        self.ui:setAnimationCallBack("Action0", TFANIMATION_END, function()
            self:textChange(self.txt_pingfen, self.oldScore, self.firstScore)
        end)    

        self.ui:runAnimation("Action0", 1);
        self.firstShow = false
    end
   
end

function KaojiaoLayer:getPower()
    local list = self:getTotalList()
    local power = 0
    if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
        --检测进攻阵的侠客
        --return ZhengbaManager:getPower(EnumFightStrategyType.StrategyType_PVE) or 0
        --local roleList = self:get
        --role:getPowerByFightType(fightType)

        for i = 1, #self.roleList1 do
            local role = CardRoleManager:getRoleByGmid(self.roleList1[i])
            power = power + role:getPowerByFightType(EnumFightStrategyType.StrategyType_PVE)
        end
        
    elseif self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
        --local power1 = ZhengbaManager:getPower(EnumFightStrategyType.StrategyType_DOUBLE_1) or 0
        --local power2 = ZhengbaManager:getPower(EnumFightStrategyType.StrategyType_DOUBLE_2) or 0
        --return power1 + power2
        for i = 1, #self.roleList1 do
            local role = CardRoleManager:getRoleByGmid(self.roleList1[i])
            power = power + role:getPowerByFightType(EnumFightStrategyType.StrategyType_DOUBLE_1)
        end

        for i = 1, #self.roleList2 do
            local role = CardRoleManager:getRoleByGmid(self.roleList2[i])
            power = power + role:getPowerByFightType(EnumFightStrategyType.StrategyType_DOUBLE_2)
        end
    end


    return power
end

function KaojiaoLayer:refreshRoleList()
    self.roleList1 = {}
    self.roleList2 = {}
    if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
        local tab = ZhengbaManager:getFightList(EnumFightStrategyType.StrategyType_PVE)
        for k, v in pairs(tab) do
            if v and v ~= 0 then
                table.insert(self.roleList1, v)
            end
        end
    elseif self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
        local tab1 = ZhengbaManager:getFightList(EnumFightStrategyType.StrategyType_DOUBLE_1)
        local tab2 = ZhengbaManager:getFightList(EnumFightStrategyType.StrategyType_DOUBLE_2)

        for k, v in pairs(tab1) do
            if v and v ~= 0 then
                table.insert(self.roleList1, v)
            end
        end

        for k, v in pairs(tab2) do
            if v and v ~= 0 then
                table.insert(self.roleList2, v)
            end
        end
    end
    table.sort(self.roleList1, function(gmId1, gmId2)
        local role1 = CardRoleManager:getRoleByGmid(gmId1)
        local role2 = CardRoleManager:getRoleByGmid(gmId2)

        if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
            return role1:getPowerByFightType(EnumFightStrategyType.StrategyType_PVE) > role2:getPowerByFightType(EnumFightStrategyType.StrategyType_PVE)
        elseif self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
            return role1:getPowerByFightType(EnumFightStrategyType.StrategyType_DOUBLE_1) > role2:getPowerByFightType(EnumFightStrategyType.StrategyType_DOUBLE_1)
        end
    end)

    table.sort(self.roleList2, function(gmId1, gmId2)
        local role1 = CardRoleManager:getRoleByGmid(gmId1)
        local role2 = CardRoleManager:getRoleByGmid(gmId2)

        return role1:getPowerByFightType(EnumFightStrategyType.StrategyType_DOUBLE_2) > role2:getPowerByFightType(EnumFightStrategyType.StrategyType_DOUBLE_2)
    end)
end

function KaojiaoLayer:clearList()
    self.roleList1 = {}
    self.roleList2 = {}
end

function KaojiaoLayer:textChange(node, oldValue, newValue)
    if not oldValue or not newValue then
        return;
    end

    if self.bRunningAction then
        self.ui:stopAnimation("Action1")
        TFDirector:killAllTween(self.ui)
        self.txt_pingfen:setText(newValue);
    end
    
    node:setText(oldValue);

    local changeSum = newValue - oldValue
    --[[
    if self.power_effect == nil then
        local resPath = "effect/ui/power_change.xml"
        TFResourceHelper:instance():addArmatureFromJsonFile(resPath)
        effect = TFArmature:create("power_change_anim")
        effect:setPosition(150, -50)
        node:addChild(effect, 2)
        self.power_effect = effect
        self.power_effect:setVisible(false)
    end
    ]]
    local frame = 1
    self.txt_pingfen:setScale(0.5)
    
    local function doBarAct(per)
        if self.firstDoAct then            
            local width = self.barSize.width
            local posX = self.originPos.x - width / 2 + width * per / 100 - 2
            self.bar_point:setVisible(true)
            self.bar_point:setPosition(ccp(posX, self.originPos.y))
            self.bar_total:setPercent( per )
        end
    end
    local per = self.firstPer

    self.ui:setAnimationCallBack("Action1", TFANIMATION_FRAME, function() 
        if frame  < 6 then       
            if frame == 4 then
                if newValue > oldValue then
                    play_shuzibiandong()
                end
                --self.power_effect:setVisible(true)
                --self.power_effect:playByIndex(0, -1, -1, 0)
            end
            local tempValue = oldValue + frame *(changeSum/500)
            self.txt_pingfen:setText(math.floor(tempValue));

            local temp = frame * per / 24
            --doBarAct(temp)
        end
        if frame >= 6 and frame < 24 then
            local tempValue = oldValue + (frame - 6) *(changeSum/60)
            self.txt_pingfen:setText(math.floor(tempValue));

            local temp = (frame - 6) * per / 24
            doBarAct(temp)
        end
        if frame == 24 then
            --self.power_effect:removeFromParent()
            --self.power_effect = nil
            self.txt_pingfen:setText(newValue);
            doBarAct(per)
            self.firstDoAct = false

            self.bRunningAction = false
        end
        frame = frame + 1
    end)

    local pos = self.txt_pingfen:getPosition()

    local moveTween = 
    {
        {
            duration = 0,
            x = -62,
            y = 34,
        }, 
        target = self.txt_pingfen,        
        {
            duration = 1 / 24 * 6,
            scale = 1.4 * 0.5,
        },
        {
            duration = 0,
            x = -62,
            y = 34,
        },
        {
            duration = 1 / 24 * 14,
            scale = 1.4 * 0.5,
        },
        {
            duration = 0,
            x = -62,
            y = 34,
        },
        {
            duration = 1 / 24 * 4,
            scale = 0.5,
            x = -62,
            y = 34,
        },
        
    }
    TFDirector:toTween(moveTween)

    self.ui:runAnimation("Action1",1);
    self.oldScore = newValue
    self.bRunningAction = true
end


function KaojiaoLayer:refreshUI()
    --self.cardRole = CardRoleManager:getRoleByGmid(self.roleGmId);
    --self.equipList = nil;
    --self:refreshTable();
    --TFLuaTime:begin()

    -- if MainPlayer:getLevel() < 65 then
    --     self.btn_shuangzhenrong:setGrayEnabled(true)
    --     self.btn_shuangzhenrong:setTouchEnabled(false)
    -- else
    --     self.btn_shuangzhenrong:setGrayEnabled(false)
    --     self.btn_shuangzhenrong:setTouchEnabled(true)
    -- end

    

    EquipmentManager:initQualityMap()
    self:refreshTable()
    --TFLuaTime:endToLua("KaojiaoLayer:refreshUI() 1 ：")
    --TFLuaTime:begin()
    self:refreshRoleList()
    --TFLuaTime:endToLua("KaojiaoLayer:refreshUI() 2 ：")
    --TFLuaTime:begin()
    
    self.txt_zhanli:setText(self:getPower())

    local num = math.floor( KaojiaoManager:getTotalScore(self:getTotalList(), self.zhenrong_type) )
    self.txt_pingfen:setText(self.oldScore)
    --print("}}}}}}}}", num)
    self.firstScore = num
    
    if self.oldScore ~= num and self.firstShow == false then
        self:textChange(self.txt_pingfen, self.oldScore, num)
        --self.txt_pingfen:setText(num)
    end
    

    local per = KaojiaoManager:getTotalProcess(self:getTotalList(), num)
    per = math.floor(per)
    --print("{{{{}}}}per= ", per)
    self.firstPer = per

    local percent = 0
    if not self.firstShow then
        percent = per
    end

    local width = self.barSize.width
    local posX = self.originPos.x - width / 2 + width * percent / 100 - 2
    self.bar_point:setVisible(true)
    self.bar_point:setPosition(ccp(posX, self.originPos.y))
    self.bar_total:setPercent( percent )

    --self.bar_total:setTexture("ui_new/BeStrong/lanjindutiao.png")

    --to add
    
    --local newX = self.originPos.x - self.barSize.width + self.barSize.width * per / 100
    --local newX = self.originPos

    --self.bar_total:setPosition( ccp(newX, self.originPos.y) )
    
    ------print("+++++++++++++", self.roleList1)
    ------print("=============", self.roleList2)
    --TFLuaTime:endToLua("KaojiaoLayer:refreshUI() 3 ：")
    --TFLuaTime:begin()
    if self.cur_page == 2 then
        self:refreshTab2()
        self:refreshTabView()

        self:refreshTopBg(self.gmId)
        self:refreshIcons()

        --TFLuaTime:endToLua("KaojiaoLayer:refreshUI() xxx ：")
        return
    end

    --TFLuaTime:endToLua("KaojiaoLayer:refreshUI() 4 ：")
    --TFLuaTime:begin()
    self:refreshScroll()
    --TFLuaTime:endToLua("KaojiaoLayer:refreshUI() 5 ：")
    self.btn_danzhenrong:setVisible(false)
    self.btn_shuangzhenrong:setVisible(false)
end

function KaojiaoLayer:dispose()
    self.super.dispose(self)
end

function KaojiaoLayer:initUI(ui)
    self.super.initUI(self,ui)

    --单双阵容按钮纹理
    self.img_zhenrong1 = {[1] = "ui_new/BeStrong/tab_danzr2.png", [2] = "ui_new/BeStrong/tab_danzr1.png"}
    self.img_zhenrong2 = {[1] = "ui_new/BeStrong/tab_shuangzr2.png", [2] = "ui_new/BeStrong/tab_shuangzr1.png"}

    local Panel_all = TFDirector:getChildByPath(ui, "Panel_all")

    self.img_bg = TFDirector:getChildByPath(Panel_all, "img_bg")    
    -- self.img_topbg1 = TFDirector:getChildByPath(self.img_bg, "img_topbg")
    self.img_topbg1 = TFDirector:getChildByPath(self.img_bg, "img_topbg")
    self.txt_zhanli = TFDirector:getChildByPath(self.img_bg, "txt_zhanli1")
    self.txt_pingfen = TFDirector:getChildByPath(self.img_bg, "txt_pingfen")
    self.bar_total = TFDirector:getChildByPath(self.img_bg, "LoadingBar_BeStrong_11")
    self.bar_point = TFDirector:getChildByPath(self.img_bg, "Image_BeStrong_1")
    self.bar_point:setVisible(false)

    self.panel_yijiui = TFDirector:getChildByPath(ui, "Panel_yijiui")
    self.panel_erjiui = TFDirector:getChildByPath(ui, "Panel_erjiui")
    self.panel_yijiui:setVisible(true)
    self.panel_erjiui:setVisible(false)

    self.img_xiaoxiangbg = TFDirector:getChildByPath(ui, "img_xiaoxiangbg")
    self.img_xiaoxiangbg:setVisible(false)
    self.img_daxiangbg = TFDirector:getChildByPath(ui, "img_daxiangbg")
    self.img_daxiangbg:setVisible(false)

    self.img_inbg = TFDirector:getChildByPath(self.img_bg, "img_inbg")

    self.img_daxiang_jindu = TFDirector:getChildByPath(self.img_daxiangbg, "bar_bg")

    self.btn_fanhui = TFDirector:getChildByPath(ui, "btn_fanhui")
    self.btn_fanhui.logic = self

    self.btn_danzhenrong = TFDirector:getChildByPath(ui, "btn_danzhenrong")
    self.btn_danzhenrong.logic = self
    self.btn_shuangzhenrong = TFDirector:getChildByPath(ui, "btn_shuangzhenrong")
    self.btn_shuangzhenrong.logic = self

    self.btn_danzhenrong:setTextureNormal(self.img_zhenrong1[2])
    self.btn_shuangzhenrong:setTextureNormal(self.img_zhenrong2[1])

    self.img_topbg = TFDirector:getChildByPath(self.panel_erjiui, "img_topbg")
    self.txt_role_name = TFDirector:getChildByPath(self.panel_erjiui, "txt_rolename")
    self.txt_role_zhanli = TFDirector:getChildByPath(self.panel_erjiui, "txt_zhanli")    

    self.panel_content = TFDirector:getChildByPath(self.panel_erjiui, "Panel_content")
    self.cellModel2 = TFDirector:getChildByPath(self.panel_erjiui, "img_cellbg")
    self.cellModel2:setVisible(false)

    self.panel_headbg1 = TFDirector:getChildByPath(self.panel_erjiui, "Panel_roleheadbg")
    self.panel_headbg2 = TFDirector:getChildByPath(self.panel_erjiui, "Panel_roleheadbg2")
    self.panel_headbg1.img_icon = {}
    self.panel_headbg2.img_icon = {}
    for i = 1, 5 do
        self.panel_headbg1.img_icon[i] = TFDirector:getChildByPath(self.panel_headbg1, "img_headiconbg" .. i)
        self.panel_headbg2.img_icon[i] = TFDirector:getChildByPath(self.panel_headbg2, "img_headiconbg" .. i)

        self.panel_headbg1.img_icon[i]:setTouchEnabled(true)
        self.panel_headbg2.img_icon[i]:setTouchEnabled(true)
        self.panel_headbg1.img_icon[i].index = i
        self.panel_headbg2.img_icon[i].index = i
        self.panel_headbg1.img_icon[i].logic = self
        self.panel_headbg2.img_icon[i].logic = self
        self.panel_headbg1.img_icon[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onIcon1ClickHandle))
        self.panel_headbg2.img_icon[i]:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onIcon2ClickHandle))

        self.panel_headbg1.img_icon[i].img_headicon = TFDirector:getChildByPath(self.panel_headbg1.img_icon[i], "img_headicon")
        self.panel_headbg1.img_icon[i].img_xuanzhong = TFDirector:getChildByPath(self.panel_headbg1.img_icon[i], "img_xuanzhong")

        self.panel_headbg2.img_icon[i].img_headicon = TFDirector:getChildByPath(self.panel_headbg2.img_icon[i], "img_headicon")
        self.panel_headbg2.img_icon[i].img_xuanzhong = TFDirector:getChildByPath(self.panel_headbg2.img_icon[i], "img_xuanzhong")
    end

    self.originPos = self.bar_total:getPosition()
    self.barSize = self.bar_total:getContentSize()

    self.img_daxiangbg_tab = {}
    -- for i = 1, 4 do
    --     self.img_daxiangbg_tab[i] = self.img_daxiangbg:clone()
    --     self.img_daxiangbg_tab[i]:setVisible(false)
    --     self.img_daxiangbg_tab[i]:retain()
    -- end
    self.img_xiaoxiangbg_tab = {}
    self.img_xiaoxiangbg:removeFromParent(true)
    self.img_xiaoxiangbg:retain()
    self.img_daxiangbg:removeFromParent(true)
    self.img_daxiangbg:retain()
    --for i = 1, 30 do
        -- self.img_xiaoxiangbg_tab[i] = self.img_xiaoxiangbg:clone()
        -- self.img_xiaoxiangbg_tab[i]:setVisible(false)
        -- self.img_xiaoxiangbg_tab[i]:retain()
    --end

    self.btn_danzhenrong:setVisible(false)
    self.btn_shuangzhenrong:setVisible(false)
end

function KaojiaoLayer:getTotalList()
    if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
        return self.roleList1
    elseif self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
        local list = {}
        for i = 1, #self.roleList1 do
            table.insert(list, self.roleList1[i])
        end
        for i = 1, #self.roleList2 do
            table.insert(list, self.roleList2[i])
        end
        return list
    end
    return {}
end

function KaojiaoLayer:refreshScroll()
    if not self.scrollView then
        --self.scrollView:removeFromParent(true)
        --self.scrollView = nil

        local scrollView = TFScrollView:create()
        self.panel_yijiui:addChild(scrollView)
        self.scrollView = scrollView
    end

    
    --scrollView:setPosition(ccp(0, -23))
    self.scrollView:setPosition(ccp(0, -6))
    self.scrollView:setBackGroundColorType(TF_LAYOUT_COLOR_NONE)
    --scrollView:setDirection(SCROLLVIEW_DIR_VERTICLE)

    self.scrollView:setSize(CCSize( self.panel_yijiui:getSize().width, self.panel_yijiui:getSize().height + 8))
    local height = self.panel_yijiui:getSize().height
    -- scrollView:setInnerContainerSize(CCSizeMake(panel_view:getSize().width , height2))
    
    self.scrollView:setBounceEnabled(true)
    --scrollView:setTag(617)

    self.scrollView:scrollToTop()

    --TFLuaTime:begin() 
    
    ------print("fuck kaojiao bg :",i)
    --成长大类
    local tab_zr = {}
    for i = 1, KaojiaoManager.EnumChengzhangType.TYPE_MAX - 1 do
        local ret, count = KaojiaoManager:checkTeamChengzhang(i, self:getTotalList(), self.zhenrong_type)
        local item = PowerCompareData:getItemByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_CHENGZHANG, i)
        local temp = {}

        if item.score_type ~= 0 and KaojiaoManager:checkLevel(item) then
            temp.type = KaojiaoManager.EnumKaojiaoType.TYPE_CHENGZHANG
            temp.kind = i
            temp.scoreLevel = ret
            table.insert(tab_zr, temp)
        end
        ----print("fuck kaojiao :",i)
    end

    --装备大类
    local tab_equip = {}
    for i = 1, KaojiaoManager.EnumEquipType.TYPE_MAX - 1 do
        local ret, count = KaojiaoManager:checkTeamEquip(i, self:getTotalList(), self.zhenrong_type)
        local item = PowerCompareData:getItemByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_EQUIP, i)
        local temp = {}

        if item.score_type ~= 0 and KaojiaoManager:checkLevel(item) then
            temp.type = KaojiaoManager.EnumKaojiaoType.TYPE_EQUIP
            temp.kind = i
            temp.scoreLevel = ret
            table.insert(tab_equip, temp)
        end
        ----print("fuck kaojiao 2 :",i)
    end

    --天书大类
    local tab_tianshu = {}
    for i = 1, KaojiaoManager.EnumTianshuType.TYPE_MAX - 1 do
        local ret, count = KaojiaoManager:checkTeamTianshu(i, self:getTotalList(), self.zhenrong_type)
        local item = PowerCompareData:getItemByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_TIANSHU, i)
        local temp = {}

        if item.score_type ~= 0 and KaojiaoManager:checkLevel(item) then
            temp.type = KaojiaoManager.EnumKaojiaoType.TYPE_TIANSHU
            temp.kind = i
            temp.scoreLevel = ret
            table.insert(tab_tianshu, temp)
        end
        ----print("fuck kaojiao 3 :",i)
    end

    local lockZhenfa = false
    local verLock = VersionLockData:objectByID(EnumVersionLockType.StrategyCard_Lock)
    if verLock and verLock.open == 0 then
        lockZhenfa = true
    end

    --阵法大类
    local tab_zhenfa = {}
    if not lockZhenfa then
        for i = 1, KaojiaoManager.EnumZhenfaType.TYPE_MAX - 1 do
            local ret, count = KaojiaoManager:checkTeamZhenfa(i, self:getTotalList(), self.zhenrong_type)
            local item = PowerCompareData:getItemByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_ZHENFA, i)
            local temp = {}

            if item.score_type ~= 0 and KaojiaoManager:checkLevel(item) then
                temp.type = KaojiaoManager.EnumKaojiaoType.TYPE_ZHENFA
                temp.kind = i
                temp.scoreLevel = ret
                table.insert(tab_zhenfa, temp)
            end
            ----print("fuck kaojiao 3 :",i)
        end
    end
     --宠物大类
    local tab_eudemon = {}
    for i = 1, KaojiaoManager.EnumEudemonType.TYPE_MAX - 1 do
        local ret, count    = KaojiaoManager:checkTeamEudemon(i, self:getTotalList(), self.zhenrong_type)
        local item          = PowerCompareData:getItemByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_EUDEMON, i)
        local temp          = {}

        if item.score_type ~= 0 and KaojiaoManager:checkLevel(item) then
            temp.type = KaojiaoManager.EnumKaojiaoType.TYPE_EUDEMON
            temp.kind = i
            temp.scoreLevel = ret
            table.insert(tab_eudemon, temp)
        end
    end
    
    --local tab_zr, tab_equip, tab_tianshu = {}, {}, {}
    --TFLuaTime:endToLua("wukkey22222222 ：")
    --TFLuaTime:begin() 

    self.daxiangProcessTab = {}
    if lockZhenfa then
        self:drawScrollContent(tab_zr, tab_equip, tab_tianshu)
    else
    self:drawScrollContent(tab_zr, tab_equip, tab_tianshu, tab_zhenfa, tab_eudemon)
    end


    --TFLuaTime:endToLua("wukkey33333333 ：")
end

function KaojiaoLayer:drawScrollContent(tab_zr, tab_equip, tab_tianshu, tab_zhenfa, tab_eudemon)
    local tab = {tab_zr, tab_equip, tab_tianshu, tab_zhenfa, tab_eudemon}

    local line = 0
    for i = 1, #tab do        
        line = line + math.ceil(#tab[i] / 6)
    end
    local x = line / 2.8

    self.scrollView:setInnerContainerSize(CCSizeMake(self.panel_yijiui:getSize().width, self.panel_yijiui:getSize().height * x))

    local height = self.scrollView:getInnerContainerSize().height - 10
    local curY = height - 180
    local posCellY = height - 30

    local tab1 = {}
    local baseX = 0
    local baseY = height - 180
    local countMaxX = 6

    local deltaX = 137
    --local deltaY = 150
    local deltaY = 140
    local deltaConsY = 190
    --local deltaConsY = 200
    -- for i = 1, 4 do
    --     self.img_daxiangbg_tab[i]:setVisible(false)
    -- end

    -- for i = 1, 30 do
    --     self.img_xiaoxiangbg_tab[i]:setVisible(false)
    -- end
    --self.scrollView:removeAllChildrenWithCleanup(true)

    
    local countN = 1
    for n = 1, #tab do  
        --if #tab[n] ~= 0 then 
            --TFLuaTime:begin()           
            for i = 1, #tab[n] do
                local index1 = (i - 1) % 6
                local index2 = math.floor( (i - 1) / 6 )
                local cell = self.img_xiaoxiangbg:clone()--self.img_xiaoxiangbg_tab[countN] 
                cell:setVisible(true) 
                countN = countN + 1

                --cell.type = KaojiaoManager.EnumKaojiaoType.TYPE_CHENGZHANG
                cell.type = n
                cell.kind = tab[n][i].kind
                cell.logic = self
                cell:setVisible(true)
                curY = baseY - index2 * deltaY
                cell:setPosition(ccp(baseX + index1 * deltaX, curY))

                if not cell:getParent() then
                    self.scrollView:addChild(cell)
                end
                cell:setTouchEnabled(true)
                cell:addMEListener(TFWIDGET_CLICK, self.cellClickHandle)
                self:refreshZhenrongCell(cell, tab[n][i])
            end
            --TFLuaTime:endToLua(">>>>>>sss: ")
            local cell1 = self.img_daxiangbg:clone()--self.img_daxiangbg_tab[n]
            cell1:setVisible(true)


            cell1.logic = self
            cell1:setVisible(true)
            cell1:setPosition(ccp(0, posCellY))
            if not cell1:getParent() then
                self.scrollView:addChild(cell1)
            end
            local bg = TFDirector:getChildByPath(cell1, "img_daxiangname")
            bg:setTexture(self.texureFenlei[n])            

            local bar_bg = TFDirector:getChildByPath(cell1, "bar_bg")
            local bar1 = TFDirector:getChildByPath(bar_bg, "bar_lv")
            local bar2 = TFDirector:getChildByPath(bar_bg, "bar_cheng")
            bar1:setVisible(true)

             

            local limitScore = ConstantData:objectByID("PowerCompareCalculate1").value or 10000
            local roleList = self:getTotalList()
            local score = KaojiaoManager.scoreTab[n] / (limitScore * #roleList)

            self.daxiangProcessTab[n] = score
            local per = self.daxiangProcessTab[n] * 100
            bar1:setPercent(per)

            local img_daxiang_pingfen = TFDirector:getChildByPath(cell1, "txt_level")
            --local index = self:getDaxiangPingfen(tab[n])
            local index = self:getDaxiangPingfen(per)            

            img_daxiang_pingfen:setTexture(self.texurePingfen[index])

            local texJindu = 
            {
                [1] = "ui_new/BeStrong/chengjindutiao.png",
                [2] = "ui_new/BeStrong/zijindutiao.png",
                [3] = "ui_new/BeStrong/lanjindutiao.png",
                [4] = "ui_new/BeStrong/lvjindutiao.png",
            }
            bar1:setTexture( texJindu[index] )

            if #tab[n] == 0 then
                cell1:setVisible(false)
            end
            baseX = 0
            baseY = curY - deltaConsY
            posCellY = baseY + 150
        --end
    end
end

--大项评分
function KaojiaoLayer:getDaxiangPingfen(per)
    --原先评分规则
    --[[
    local index = KaojiaoManager.EnumScoreLevel.PINGFAN

    if (not tab_zr) or (#tab_zr == 0) then
        return index
    end

    local countMax = #tab_zr
    local function getCount(index)
        local count = 0
        for i = 1, #tab_zr do
            if tab_zr[i].scoreLevel and tab_zr[i].scoreLevel <= index then
                count = count + 1
            end
        end
        return count
    end

    for i = KaojiaoManager.EnumScoreLevel.JUELUN, KaojiaoManager.EnumScoreLevel.PINGFAN do
        local count = getCount(i)
        if count / countMax >= 0.8 then
            return i
        end
    end
    ]]

    --新评分规则
    local perTab = { ConstantData:objectByID("PowerCompareFormula3").value / 100, ConstantData:objectByID("PowerCompareFormula2").value / 100, ConstantData:objectByID("PowerCompareFormula1").value / 100 }
    for i = 1, #perTab do
        if per >= perTab[i] then
            return i
        end
    end
    return 4
end

--一级界面大项里的小项cell
function KaojiaoLayer:refreshZhenrongCell(cell, tab)
    
    local item = PowerCompareData:getItemByTypeAndKind(tab.type, tab.kind)  
    local img_levelicon = TFDirector:getChildByPath(cell, "img_levelicon")
    img_levelicon:setTexture(self.texurePingfenIcon[tab.scoreLevel])

    local texture_banxing = "ui_new/BeStrong/banxing.png"
    local texture_hongxing = "ui_new/BeStrong/hongxing.png"

    local img_star = {}
    for i = 1, 5 do
        local bg = TFDirector:getChildByPath(cell, "img_starbg" .. i)
        img_star[i] = TFDirector:getChildByPath(bg, "img_star")
        img_star[i]:setTexture(texture_hongxing)
        img_star[i]:setAnchorPoint(ccp(0.5, 0.5))
        img_star[i]:setVisible(false)
        bg:setVisible(false)
    end
    --[[
    local starNum = item.star1 * 2
    if starNum % 2 == 0 then
        for i = 1, starNum / 2 do
            img_star[i]:setVisible(true)
        end
    elseif starNum % 2 == 1 then
        local num = math.ceil(starNum / 2)
        for i = 1, num do
            img_star[i]:setVisible(true)
        end
        img_star[num]:setAnchorPoint(ccp(1, 0.5))
        img_star[num]:setTexture(texture_banxing)
    end
    ]]
    local txt_biaoti = TFDirector:getChildByPath(cell, "txt_biaoti")
    txt_biaoti:setText(item.name)

    local img_hongdian = TFDirector:getChildByPath(cell, "img_zhongdian")
    img_hongdian:setVisible(false)
    --[[
    if tab.bRedPoint then
        img_hongdian:setVisible(true)
    end
    ]]
end

function KaojiaoLayer.cellClickHandle(cell)
    local self = cell.logic
    --local item = PowerCompareData:getItemByTypeAndKind(1, 1)
    local gmId = nil
    if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
        gmId = self.roleList1[1]
    elseif self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
        local index = 0
        if self.roleList1[1] then
            index = 1
        elseif self.roleList2[1] then
            index = 2
        end
        if index == 1 then
            gmId = self.roleList1[1]
        elseif index == 2 then
            gmId = self.roleList2[1]
        end
    end

    self.selectedTab = {type = cell.type, kind = cell.kind}

    self:showSecondPage(gmId)
end

function KaojiaoLayer:getDoubleZhenrongIndex(gmId)
    for k, v in pairs(self.roleList1) do
        if v == gmId then
            return EnumFightStrategyType.StrategyType_DOUBLE_1
        end
    end

    for k, v in pairs(self.roleList2) do
        if v == gmId then
            return EnumFightStrategyType.StrategyType_DOUBLE_2
        end
    end

    return nil
end 

function KaojiaoLayer:showSecondPage(gmId)
    self:setPage(2)
    self.panel_yijiui:setVisible(false)
    self.panel_erjiui:setVisible(true)
    self.gmId = gmId

    if not gmId then
        return
    end

    self:refreshTopBg(gmId)
    
    self:refreshIcons()

    self:refreshTab2()

    self:refreshTabView()

    self.tabView:scrollToYTop(0)
    self:selectCell(1)
end

function KaojiaoLayer:refreshTopBg(gmId)
    local role = CardRoleManager:getRoleByGmid(gmId)    
    self.txt_role_name:setText(role.name)

    local fightType = EnumFightStrategyType.StrategyType_PVE
    if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
        fightType = EnumFightStrategyType.StrategyType_PVE
    elseif self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
        if self:getDoubleZhenrongIndex(gmId) then
            fightType = self:getDoubleZhenrongIndex(gmId)
        end
    end
    
    self.txt_role_zhanli:setText(role:getPowerByFightType(fightType))
end

function KaojiaoLayer:refreshIcons()
    self.panel_headbg1:setVisible(true)
    self.panel_headbg2:setVisible(true)
    for i = 1, 5 do
        self.panel_headbg1.img_icon[i]:setVisible(true)
        self.panel_headbg2.img_icon[i]:setVisible(true)

        self.panel_headbg1.img_icon[i].img_xuanzhong:setVisible(false)
        self.panel_headbg2.img_icon[i].img_xuanzhong:setVisible(false)
    end
    if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
        self.panel_headbg2:setVisible(false)
        local index = 1
        if #self.roleList1 == 0 then
            self.panel_headbg1:setVisible(false)
            return
        end

        for i = 1, 5 do
            local bEqual = false
            for j = 1, #self.roleList1 do
                if i == self.roleList1[j] then
                    bEqual = true
                end
            end
            if not bEqual then
                self.panel_headbg1.img_icon[i]:setVisible(false)
            end
        end
        for i = 1, #self.roleList1 do
            if self.roleList1[i] == self.gmId then
                index = i
            end
        end
        self.panel_headbg1.img_icon[index].img_xuanzhong:setVisible(true)

        for i = 1, #self.roleList1 do
            local gmId = self.roleList1[i]
            local role = CardRoleManager:getRoleByGmid(gmId)
            self.panel_headbg1.img_icon[i]:setTexture(GetColorIconByQuality(role.quality))
            self.panel_headbg1.img_icon[i]:setVisible(true)
            self.panel_headbg1.img_icon[i].img_headicon:setTexture(role:getIconPath())
        end
    elseif self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
        local type, index = 1, 1
        if #self.roleList1 == 0 then
            self.panel_headbg1:setVisible(false)            
        end
        if #self.roleList2 == 0 then
            self.panel_headbg2:setVisible(false) 
        end
        if #self.roleList1 == 0 and #self.roleList2 == 0 then
            return
        end

        for i = 1, 5 do
            local bEqual = false
            for j = 1, #self.roleList1 do
                if i == self.roleList1[j] then
                    bEqual = true
                end
            end
            if not bEqual then
                self.panel_headbg1.img_icon[i]:setVisible(false)
            end
        end

        for i = 1, 5 do
            local bEqual = false
            for j = 1, #self.roleList2 do
                if i == self.roleList2[j] then
                    bEqual = true
                end
            end
            if not bEqual then
                self.panel_headbg2.img_icon[i]:setVisible(false)
            end
        end

        for i = 1, #self.roleList1 do
            if self.roleList1[i] == self.gmId then
                type = 1
                index = i
            end
        end

        for i = 1, #self.roleList2 do
            if self.roleList2[i] == self.gmId then
                type = 2
                index = i
            end
        end

        if type == 1 then
            self.panel_headbg1.img_icon[index].img_xuanzhong:setVisible(true)
        elseif type == 2 then
            self.panel_headbg2.img_icon[index].img_xuanzhong:setVisible(true)
        end

        for i = 1, #self.roleList1 do
            local gmId = self.roleList1[i]
            local role = CardRoleManager:getRoleByGmid(gmId)
            self.panel_headbg1.img_icon[i]:setTexture(GetColorIconByQuality(role.quality))
            self.panel_headbg1.img_icon[i]:setVisible(true)
            self.panel_headbg1.img_icon[i].img_headicon:setTexture(role:getIconPath())
        end

        for i = 1, #self.roleList2 do
            local gmId = self.roleList2[i]
            local role = CardRoleManager:getRoleByGmid(gmId)
            self.panel_headbg2.img_icon[i]:setTexture(GetColorIconByQuality(role.quality))
            self.panel_headbg2.img_icon[i]:setVisible(true)
            self.panel_headbg2.img_icon[i].img_headicon:setTexture(role:getIconPath())
        end
    end
end

function KaojiaoLayer:setPage(page)
    self.cur_page = page
end

function KaojiaoLayer:showFirstPage()
    self.panel_erjiui:setVisible(false)
    self.panel_yijiui:setVisible(true)

    self:setPage(1)
    self:refreshUI()
end

function KaojiaoLayer:refreshTab2()
    self.tab2 = {[1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {}}
    for i = 1, KaojiaoManager.EnumChengzhangType.TYPE_MAX - 1 do
        local bCanImprove, tab, bCanHuoqu = KaojiaoManager:checkByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_CHENGZHANG, i, self.gmId, true, self.zhenrong_type)
        if tab then
            local m1 = PowerCompareMaxData:getLimit(KaojiaoManager.EnumKaojiaoType.TYPE_CHENGZHANG, i, MainPlayer:getLevel(), 1)
            local m2 = PowerCompareMaxData:getLimit(KaojiaoManager.EnumKaojiaoType.TYPE_CHENGZHANG, i, MainPlayer:getLevel(), 2)
            if tab.max and m1 and m1 > 0 then
                tab.max = m1
            end
            if tab.max1 and m2 and m2 > 0 then
                tab.max1 = m2
            end
        end
        local temp = {bCanImprove = bCanImprove, data = tab, type = KaojiaoManager.EnumKaojiaoType.TYPE_CHENGZHANG, kind = i, newType = 1, bCanHuoqu = bCanHuoqu}
        table.insert(self.tab2[1], temp)
        --[[
        local bCanHuoqu = KaojiaoManager:checkByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_CHENGZHANG, i, self.gmId, true)
        local temp1 = clone(temp)
        temp1.bCanHuoqu = bCanHuoqu
        temp1.newType = 2
        table.insert(self.tab2[1], temp1)
        ]]
    end

    for i = 1, KaojiaoManager.EnumEquipType.TYPE_MAX - 1 do
        local bCanImprove, tab, bCanHuoqu = KaojiaoManager:checkByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_EQUIP, i, self.gmId, true, self.zhenrong_type)
        
        if tab then
            local m1 = PowerCompareMaxData:getLimit(KaojiaoManager.EnumKaojiaoType.TYPE_EQUIP, i, MainPlayer:getLevel(), 1)
            local m2 = PowerCompareMaxData:getLimit(KaojiaoManager.EnumKaojiaoType.TYPE_EQUIP, i, MainPlayer:getLevel(), 2)
            if tab.max and m1 and m1 > 0 then
                tab.max = m1
            end
            if tab.max1 and m2 and m2 > 0 then
                tab.max1 = m2
            end
        end

        local temp = {bCanImprove = bCanImprove, data = tab, type = KaojiaoManager.EnumKaojiaoType.TYPE_EQUIP, kind = i, newType = 1, bCanHuoqu = bCanHuoqu}
        table.insert(self.tab2[2], temp)

        --[[
        local bCanHuoqu = KaojiaoManager:checkByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_EQUIP, i, self.gmId, true)
        local temp1 = clone(temp)
        temp1.bCanHuoqu = bCanHuoqu
        temp1.newType = 2
        table.insert(self.tab2[2], temp1)
        ]]
    end

    for i = 1, KaojiaoManager.EnumTianshuType.TYPE_MAX - 1 do
        local bCanImprove, tab, bCanHuoqu = KaojiaoManager:checkByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_TIANSHU, i, self.gmId, true, self.zhenrong_type)
        
        if tab then
            local m1 = PowerCompareMaxData:getLimit(KaojiaoManager.EnumKaojiaoType.TYPE_TIANSHU, i, MainPlayer:getLevel(), 1)
            local m2 = PowerCompareMaxData:getLimit(KaojiaoManager.EnumKaojiaoType.TYPE_TIANSHU, i, MainPlayer:getLevel(), 2)
            if tab.max and m1 and m1 > 0 then
                tab.max = m1
            end
            if tab.max1 and m2 and m2 > 0 then
                tab.max1 = m2
            end
        end

        local temp = {bCanImprove = bCanImprove, data = tab, type = KaojiaoManager.EnumKaojiaoType.TYPE_TIANSHU, kind = i, newType = 1, bCanHuoqu = bCanHuoqu}
        table.insert(self.tab2[3], temp)

        --[[
        local bCanHuoqu = KaojiaoManager:checkByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_TIANSHU, i, self.gmId, true)
        local temp1 = clone(temp)
        temp1.bCanHuoqu = bCanHuoqu
        temp1.newType = 2
        table.insert(self.tab2[3], temp1)
        ]]
    end

    for i = 1, KaojiaoManager.EnumZhenfaType.TYPE_MAX - 1 do
        local bCanImprove, tab, bCanHuoqu = KaojiaoManager:checkByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_ZHENFA, i, self.gmId, true, self.zhenrong_type)
        
        if tab then
            local m1 = PowerCompareMaxData:getLimit(KaojiaoManager.EnumKaojiaoType.TYPE_ZHENFA, i, MainPlayer:getLevel(), 1)
            local m2 = PowerCompareMaxData:getLimit(KaojiaoManager.EnumKaojiaoType.TYPE_ZHENFA, i, MainPlayer:getLevel(), 2)
            if tab.max and m1 and m1 > 0 then
                tab.max = m1
            end
            if tab.max1 and m2 and m2 > 0 then
                tab.max1 = m2
            end
        end

        local temp = {bCanImprove = bCanImprove, data = tab, type = KaojiaoManager.EnumKaojiaoType.TYPE_ZHENFA, kind = i, newType = 1, bCanHuoqu = bCanHuoqu}
        table.insert(self.tab2[4], temp)
    end

    for i = 1, KaojiaoManager.EnumEudemonType.TYPE_MAX - 1 do
        local bCanImprove, tab, bCanHuoqu = KaojiaoManager:checkByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_EUDEMON, i, self.gmId, true, self.zhenrong_type)
        local temp = {bCanImprove = bCanImprove, data = tab, type = KaojiaoManager.EnumKaojiaoType.TYPE_EUDEMON, kind = i, newType = 1, bCanHuoqu = bCanHuoqu}
        table.insert(self.tab2[5], temp)
    end
    --[[
    ----print("++++++++++++++++++11111111")

    ----print("tab2[1]", self.tab2[1])
    ----print("tab2[2]", self.tab2[2])
    ----print("tab2[3]", self.tab2[3])

    ----print("++++++++++++++++++22222222")
    ]]

    self.tab2_new = {}
    for i = 1, #self.tab2 do
        for j = 1, #self.tab2[i] do
            local bCanImprove = self.tab2[i][j].bCanImprove
            local type = self.tab2[i][j].type
            local kind = self.tab2[i][j].kind
            local newType = self.tab2[i][j].newType
            local item = PowerCompareData:getItemByTypeAndKind(type, kind)
            local bCanHuoqu = self.tab2[i][j].bCanHuoqu
            local bContinue = true
            
            if self.selectedTab.type == type then
                --[[
                if newType == 1 then
                    if bCanImprove == true and KaojiaoManager:checkLevel(item) then
                        table.insert(self.tab2_new, self.tab2[i][j])
                    end
                elseif newType == 2 then
                    if KaojiaoManager:checkHuoquLevel(item) then
                        if bCanHuoqu == true then
                            table.insert(self.tab2_new, self.tab2[i][j])
                        else
                            self.tab2[i][j].newType = 3
                            table.insert(self.tab2_new, self.tab2[i][j])
                        end
                    end
                end
                ]]
                if KaojiaoManager:checkLevel(item) then
                    if bCanImprove then
                        table.insert(self.tab2_new, self.tab2[i][j])                        
                        bContinue = false
                    end
                    --if bContinue and KaojiaoManager:checkHuoquLevel(item) then
                    local b = ( type == 2 and kind == 2 )
                    if bContinue and (not b) then
                        self.tab2[i][j].newType = 2
                        if (not bCanHuoqu) then
                            self.tab2[i][j].newType = 3
                            self.tab2[i][j].bFull = true
                        end
                        table.insert(self.tab2_new, self.tab2[i][j])   
                    end
                end
            end
        end
    end
    --[[
    for i = 1, #self.tab2_new do
        local tab = {}
        if self.
    end
    ]]
    table.sort(self.tab2_new, function(a, b)
        local item1 = PowerCompareData:getItemByTypeAndKind(a.type, a.kind)
        local item2 = PowerCompareData:getItemByTypeAndKind(b.type, b.kind)

        if a.newType < b.newType then
            return true
        elseif a.newType == b.newType then
            return item1.star2 > item2.star2
        end

        return false
    end)

    if self.selectedTab then
        local temp1 = nil
        for i = 1, #self.tab2_new do
            if self.tab2_new[i].type == self.selectedTab.type and self.tab2_new[i].kind == self.selectedTab.kind then
                temp1 = clone(self.tab2_new[i])
                table.remove(self.tab2_new, i)
                break
            end
        end
        if temp1 then
            table.insert(self.tab2_new, 1, temp1)
        end
    end
    -------wukkey1
    ------print("tab2_new = ", self.tab2_new)
end

function KaojiaoLayer:refreshTabView()
    --self.cells = {}
    self:selectCell(nil)    
    
    if self.tabView then        
        self.tabView:reloadData()
        --self.tabView:scrollToYTop(0)
        --self:selectCell(1)
        return
    end
    self.cells = {}
    local tabView = TFTableView:create()
    tabView:setTableViewSize( CCSize(self.panel_content:getContentSize().width, self.panel_content:getContentSize().height + 10) )
    tabView:setDirection(TFTableView.TFSCROLLVERTICAL)    
    tabView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)
    tabView.logic = self
    self.panel_content:addChild(tabView)
    tabView:setPosition(ccp(0, 0))
    self.tabView = tabView

    self.tabView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, self.cellSizeForTable)
    self.tabView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, self.numberOfCellsInTableView)
    self.tabView:addMEListener(TFTABLEVIEW_SIZEATINDEX, self.tableCellAtIndex)
    self.tabView:addMEListener(TFTABLEVIEW_TOUCHED, self.tableCellTouched)
    Public:bindScrollFun(self.tabView)
    self.tabView:reloadData()
    --self.tabView:scrollToYTop(0)

    --self:selectCell(1)
end

function KaojiaoLayer.tableCellTouched(table, cell)
    local self = table.logic
    local index = cell.index
    
    --self:selectCell(index)
end

function KaojiaoLayer:selectCell(index)
    if #self.cells == 0 then
        return
    end
    for i = 1, #self.cells do
        self.cells[i].panel.img_xuanzhong:setVisible(false)
    end

    self.cells[1].panel.img_xuanzhong:setVisible(true)
    self.selIndex = 1
    --[[
    if index then
        self.cells[index].panel.img_xuanzhong:setVisible(true)
        self.selIndex = index
    end
    ]]
end

function KaojiaoLayer.cellSizeForTable(table,idx)
    local self = table.logic
    local index = idx + 1
    if index == #self.tab2_new then
        return 140, 827
    elseif index == 1 then
        return 135, 827
    end
    return 125, 827
end

function KaojiaoLayer.numberOfCellsInTableView(table)
    local self = table.logic

    if self.tab2_new then
        return #self.tab2_new
    else
        return 0
    end
end

function KaojiaoLayer.tableCellAtIndex(table, idx)
    local self = table.logic;
    local tableIdx = table.idx
    
    local cell = table:dequeueCell()   
    local panel = nil
    if cell == nil then
        cell = TFTableViewCell:create()
        panel = self.cellModel2:clone()
        --print("}}}", idx, #self.tab2_new)

        panel:setPosition(ccp(5, -8))
        cell:addChild(panel)
        panel:setTag(10086)
        panel:setVisible(true)
    else
        panel = cell:getChildByTag(10086)
        panel:setVisible(true)
        
        if self.selIndex ~= idx + 1 then
            panel.img_xuanzhong:setVisible(false)
        else
            panel.img_xuanzhong:setVisible(true)
        end
        
    end
    if idx + 1 == #self.tab2_new then
        panel:setPosition(ccp(5, 8))
    else
        panel:setPosition(ccp(5, -8))        
    end
    cell.logic = self
    self:refreshCell(panel, idx + 1)

    panel.img_xuanzhong = TFDirector:getChildByPath(panel, "img_xuanzhong")
    --panel.img_xuanzhong:setVisible(false)
    self.cells[idx + 1] = clone(cell)
    cell.panel = panel
    cell.index = idx + 1

    return cell
end

function KaojiaoLayer:refreshCell(panel, index)
    local type = self.tab2_new[index].type
    local kind = self.tab2_new[index].kind
    local item = PowerCompareData:getItemByTypeAndKind(type, kind)

    if not item then
        return
    end
    local img_icon = TFDirector:getChildByPath(panel, "img_icon")
    local txt_xiaobiaoti = TFDirector:getChildByPath(panel, "txt_xiaobiaoti")
    local txt_biaoti = TFDirector:getChildByPath(panel, "txt_biaoti")
    local btn_yijiantisheng = TFDirector:getChildByPath(panel, "btn_yijiantisheng")
    local btn_huoqu = TFDirector:getChildByPath(panel, "btn_huoqu")
    btn_huoqu.logic = self
    local img_yifengding = TFDirector:getChildByPath(panel, "img_yifengding")
    local btn_tisheng = TFDirector:getChildByPath(panel, "btn_tisheng")
    btn_tisheng.logic = self
    btn_yijiantisheng.logic = self

    btn_huoqu:setVisible(false)
    img_yifengding:setVisible(false)
    btn_tisheng:setVisible(false)
    btn_yijiantisheng:setVisible(false)
    btn_yijiantisheng:setTouchEnabled(true)
    btn_yijiantisheng:setGrayEnabled(false)

    if self.tab2_new[index].newType == 1 then
        if item.onekey == 1 then
            btn_yijiantisheng:setVisible(true)
        end
        btn_yijiantisheng.logic = self
        btn_yijiantisheng.type = type
        btn_yijiantisheng.kind = kind
        btn_yijiantisheng:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onOneKeyClick), 1)
    end    

    local txt_shuoming = TFDirector:getChildByPath(panel, "txt_shuoming") 
    local img_jindutiao = TFDirector:getChildByPath(panel, "img_jindutiao")
    local bar1 = TFDirector:getChildByPath(panel, "LoadingBar_BeStrong_1")
    local bar2 = TFDirector:getChildByPath(panel, "LoadingBar_BeStrong_1-Copy3")
    img_jindutiao:setVisible(true)
    bar1:setVisible(false)
    bar2:setVisible(true)

    img_icon:setTexture(self.textureCellIcon[type][kind])

    local texture_banxing = "ui_new/BeStrong/banxing.png"
    local texture_hongxing = "ui_new/BeStrong/hongxing.png"

    --推荐星星数
    local img_star = {}
    for i = 1, 5 do
        local bg = TFDirector:getChildByPath(panel, "img_starbg" .. i)
        img_star[i] = TFDirector:getChildByPath(bg, "img_star")
        img_star[i]:setTexture(texture_hongxing)
        img_star[i]:setAnchorPoint(ccp(0.5, 0.5))
        img_star[i]:setVisible(false)
    end

    local starNum = item.star2 * 2
    if starNum % 2 == 0 then
        for i = 1, starNum / 2 do
            img_star[i]:setVisible(true)
        end
    elseif starNum % 2 == 1 then
        local num = math.ceil(starNum / 2)
        for i = 1, num do
            img_star[i]:setVisible(true)
        end
        img_star[num]:setAnchorPoint(ccp(1, 0.5))
        img_star[num]:setTexture(texture_banxing)
    end

    if self.tab2_new[index].newType == 1 then
        txt_biaoti:setText(item.content1)
    elseif self.tab2_new[index].newType == 2 then       
        txt_biaoti:setText(item.content2)
    elseif self.tab2_new[index].newType == 3 then
        txt_biaoti:setText(self.txtGood)
    end
    txt_xiaobiaoti:setText(item.name)
    txt_shuoming:setVisible(true)
    
    local function setPer()
        if item.txt_progress1 == "" then
            txt_shuoming:setVisible(false)

            local data = self.tab2_new[index].data
            if data and data.cur and data.max then
                local per = data.cur / data.max * 100
                if per > 100 then
                    per = 100
                end
                bar2:setPercent(per)
            end
        else
            local data = self.tab2_new[index].data
            if data and data.cur and data.max then
                txt_shuoming:setText(item.txt_progress1 .. ":" .. data.cur .. "/" .. data.max)
                local per = data.cur / data.max * 100
                if per > 100 then
                    per = 100
                end
                bar2:setPercent(per)
            end
        end
    end

    setPer()

    img_jindutiao:setVisible(true)
    if self.tab2_new[index].newType == 1 then
        if item.progress_bar == 0 then
            img_jindutiao:setVisible(false)
        end
    elseif self.tab2_new[index].newType == 2 then
        if item.progress_bar == 0 then
            img_jindutiao:setVisible(false)
        end
    elseif self.tab2_new[index].newType == 3 then
        if item.progress_bar == 0 then
            img_jindutiao:setVisible(false)
        end
    end

    btn_tisheng:removeMEListener(TFWIDGET_CLICK)
    btn_huoqu:removeMEListener(TFWIDGET_CLICK)
    btn_tisheng:setVisible(true)

    local texTisheng1 = "ui_new/BeStrong/tisheng.png"
    local texTisheng2 = "ui_new/BeStrong/btn_tishenglan.png"
    local role = CardRoleManager:getRoleByGmid(self.gmId)
    btn_tisheng:setTextureNormal(texTisheng1)
    if self.tab2_new[index].newType == 1 then
        btn_tisheng:setVisible(true)
        btn_tisheng:setTouchEnabled(true)
        btn_tisheng:setGrayEnabled(false)
        btn_tisheng.type = type
        btn_tisheng.kind = kind
        btn_tisheng.index = index
        btn_tisheng.newType = 1
        btn_tisheng:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTishengClickHandle))
    elseif self.tab2_new[index].newType == 2 then
        btn_yijiantisheng:setVisible(false)
        --btn_tisheng:setTouchEnabled(false)
        --btn_tisheng:setGrayEnabled(true) 
        
        btn_tisheng:setVisible(true)
        btn_tisheng:setTouchEnabled(true)
        btn_tisheng:setGrayEnabled(false)
        btn_tisheng.type = type
        btn_tisheng.kind = kind
        btn_tisheng.index = index
        btn_tisheng.newType = 2
        btn_tisheng:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onTishengClickHandle))

        btn_tisheng:setTextureNormal(texTisheng2)
        local role = CardRoleManager:getRoleByGmid(self.gmId)
        --类似潜修只有紫色及以上品质侠客才有,品质小于紫色则提升按钮变灰
        if type == 1 then
            --btn_tisheng:setTextureNormal(texTisheng2)  
            if kind == 8 or kind == 11 then          
                if role then
                    if role.quality <= 3 then
                        btn_tisheng:setGrayEnabled(true)
                        btn_tisheng:setTouchEnabled(false)
                    end
                end
            end
        elseif type == 2 then
            if kind == 2 then
                btn_tisheng:setGrayEnabled(true)
                btn_tisheng:setTouchEnabled(false)
            elseif kind == 9 then
                if role then
                    if role.quality <= 3 then
                        btn_tisheng:setGrayEnabled(true)
                        btn_tisheng:setTouchEnabled(false)
                    end
                end
            end
        elseif type == 3 then
            if kind > 2 and role then
                local bible = role:getSkyBook()
                if not bible then
                    btn_tisheng:setGrayEnabled(true)
                    btn_tisheng:setTouchEnabled(false)
                end
            end
        end 
    elseif self.tab2_new[index].newType == 3 then 
        img_yifengding:setVisible(true) 
        btn_tisheng:setVisible(false)
        btn_yijiantisheng:setVisible(false)
        --btn_huoqu:setVisible(false)       
    end

    if item.whether_have == 1 then
        btn_huoqu:setVisible(true)
        btn_huoqu:setTouchEnabled(true)
        btn_huoqu:setGrayEnabled(false)
        btn_huoqu.type = type
        btn_huoqu.kind = kind
        btn_huoqu.index = index
        btn_huoqu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onHuoquClickHandle))
    else
        btn_huoqu:setVisible(false)
    end
end

KaojiaoLayer.SmithyIndex = 
{
    Qianghua = 1,
    Shengxing = 2,
    Xilian = 3,
    Jinglian = 4,
    Chongzhu = 5,
    Shengjie = 6,
    Xiangqian = 7,
    Hecheng = 8
}

--蓝色按钮前往面板 ==>>  装备xx面板
KaojiaoLayer.MapIndex = 
{
    [KaojiaoManager.EnumEquipType.TYPE_EQUIP_QIANGHUA] = KaojiaoLayer.SmithyIndex.Qianghua,
    [KaojiaoManager.EnumEquipType.TYPE_EQUIP_SHENGXING] = KaojiaoLayer.SmithyIndex.Shengxing,
    [KaojiaoManager.EnumEquipType.TYPE_EQUIP_TUPO] = KaojiaoLayer.SmithyIndex.Jinglian,
    [KaojiaoManager.EnumEquipType.TYPE_EQUIP_JINGLIAN] = KaojiaoLayer.SmithyIndex.Jinglian,
    [KaojiaoManager.EnumEquipType.TYPE_EQUIP_CHONGZHU] = KaojiaoLayer.SmithyIndex.Chongzhu,
    [KaojiaoManager.EnumEquipType.TYPE_EQUIP_XIANGQIAN] = KaojiaoLayer.SmithyIndex.Xiangqian,
    [KaojiaoManager.EnumEquipType.TYPE_EQUIP_SHENGJIE] = KaojiaoLayer.SmithyIndex.Shengjie,
}

function KaojiaoLayer.onTishengClickHandle(sender)
    local self = sender.logic
    local type = sender.type
    local kind = sender.kind
    local index = sender.index
    local newType = sender.newType

    local goFunc = nil
    if newType == 2 then
        goFunc = KaojiaoManager.newGoFunc[type][kind]        
    else
        goFunc = KaojiaoManager.goFunc[type][kind] 
    end
    local goFunc = KaojiaoManager.goFunc[type][kind] 
    --local goFunc1 = KaojiaoManager.goFunc1[type][kind] 
    local funcData = {} 
    if self.tab2_new[index] and self.tab2_new[index].data and self.tab2_new[index].data.funcData then
        funcData = self.tab2_new[index].data.funcData
    end

    local function getEquipGmId()
        local role = CardRoleManager:getRoleByGmid(self.gmId)
        if role then
            for i = 1, 5 do
                local equip = role:getEquipment():GetEquipByType(i)
                if equip then
                    return equip.gmId
                end
            end
        end
        return nil
    end
    if newType == 2 then         
        if type == 2 and kind >= 3 then                     
            local role = CardRoleManager:getRoleByGmid(self.gmId)
            local temp = getEquipGmId()
            --[[
            local index = kind - 2
            if kind == 5 then
                index = 4
            end
            if kind >= 8 then
                index = kind - 1
            end
            ]]
            local temp1 = self.MapIndex[kind]
            if temp1 then
                index = temp1
            end
            if role and temp then
                table.insert(funcData, 1, temp)
                table.insert(funcData, 2, index)
            end
        end
    end
    if newType == 1 then
        if type == 2 and kind == KaojiaoManager.EnumEquipType.TYPE_EQUIP_XIANGQIAN then
            funcData[2] = 7
        end
    end
    local fightType = EnumFightStrategyType.StrategyType_PVE
    if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
        fightType = EnumFightStrategyType.StrategyType_PVE
    elseif self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
        if self:getDoubleZhenrongIndex(self.gmId) then
            fightType = self:getDoubleZhenrongIndex(self.gmId)
        end
    end
    if goFunc then
        goFunc(funcData, fightType, self.gmId)
    end    
end

function KaojiaoLayer.onHuoquClickHandle(sender)
    local self = sender.logic
    local type = sender.type
    local kind = sender.kind
    local index = sender.index

    local huoquFunc = KaojiaoManager.huoquFunc[type][kind]
    local funcData = {} 
    if self.tab2_new[index] and self.tab2_new[index].data then
        funcData = self.tab2_new[index].data.funcData
    end

    local fightType = EnumFightStrategyType.StrategyType_PVE
    if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
        fightType = EnumFightStrategyType.StrategyType_PVE
    elseif self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
        if self:getDoubleZhenrongIndex(self.gmId) then
            fightType = self:getDoubleZhenrongIndex(self.gmId)
        end
    end

    if huoquFunc then
        --huoquFunc(funcData, fightType, self)
        huoquFunc(type, kind, funcData, fightType)
    end
end


function KaojiaoLayer:refreshTable()
    
end   


function KaojiaoLayer:registerEvents(ui)
    self.super.registerEvents(self);

    self.btn_fanhui:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onReturnClick, play_fanhui), 1)    
    self.btn_danzhenrong:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onSingleClick), 1)
    self.btn_shuangzhenrong:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onDoubleClick), 1)    

    self.skyBookLevelUpResultCallBack = function(event)
        KaojiaoManager:resetCacheTab(3)
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(3, 5)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(txt)
            end
        end 
    end

    TFDirector:addMEGlobalListener(SkyBookManager.BIBLE_LEVEL_UP_RESULT, self.skyBookLevelUpResultCallBack) 
    
    self.mosaicAllCallBack = function(event)
        KaojiaoManager:resetCacheTab(3)
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(3, 3)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(txt)
            end
        end 
    end

    TFDirector:addMEGlobalListener(SkyBookManager.ESSENTIAL_MOSAIC_ALL_RESULT, self.mosaicAllCallBack) 

    self.qimenQueryCallBack = function(event)
        KaojiaoManager:resetCacheTab(1)
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(1, 9)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(txt)
            end       
        end 
    end
    TFDirector:addMEGlobalListener(CardRoleManager.QUERY_QIMEN_MSG_RESULT, self.qimenQueryCallBack)

    self.RoleStarUpResultCallBack = function (event)
        KaojiaoManager:resetCacheTab(1)
        if self and self.refreshUI then
            --toastMessage("一键侠魂突破成功")
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(1, 2)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(txt)
            end
        end
    end
    TFDirector:addMEGlobalListener(CardRoleManager.ROLE_PRACTICE_RESULT, self.RoleStarUpResultCallBack)

    --一键更换装备
    self.EquipUpdateCallBack = function(event)
        KaojiaoManager:resetCacheTab(2)
        EquipmentManager:initQualityMap()
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                self:refreshUI()
                toastMessage(KaojiaoLayer.txtOneKeySuccess)
            end
        end
    end
    TFDirector:addMEGlobalListener(EquipmentManager.EQUIP_OPERATION,  self.EquipUpdateCallBack)

    self.RoleAcupointUpdate = function(event)
        KaojiaoManager:resetCacheTab(1)
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(1, 6)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(txt)
            end
        end
    end
    TFDirector:addMEGlobalListener(CardRoleManager.UPDATE_ROLE_TRAIN_INFO,  self.RoleAcupointUpdate)
    TFDirector:addMEGlobalListener(CardRoleManager.UPDATE_ALL_ROLE_TRAIN_INFO,  self.RoleAcupointUpdate)

    self.MartialLevelUpCallBack = function(event)
        KaojiaoManager:resetCacheTab(1)
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(1, 4)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(txt)
            end
        end
    end
    TFDirector:addMEGlobalListener(MartialManager.MSG_MartialLevelUp, self.MartialLevelUpCallBack)  

    
    self.EquipMartialCallBack = function(event)
        KaojiaoManager:resetCacheTab(1)
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(1, 3)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(txt)
            end
        end
    end
    TFDirector:addMEGlobalListener(MartialManager.OneKeyEquipMartialResult, self.EquipMartialCallBack)  

    self.RoleTransferCallBack = function(event)
        KaojiaoManager:resetCacheTab(1)
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(1, 1)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(KaojiaoLayer.txtOneKeySuccess)
            end
        end
    end
    TFDirector:addMEGlobalListener(CardRoleManager.ROLE_TRANSFER_RESULT, self.RoleTransferCallBack)  

    self.SkillUpCallBack = function(event)
        KaojiaoManager:resetCacheTab(1)
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local function callFunc()
                    local item = PowerCompareData:getItemByTypeAndKind(1, 5)
                    local txt = item.onekey_txt

                    self:refreshUI()
                    toastMessage(KaojiaoLayer.txtOneKeySuccess)
                end

                local actionList = {}
                --actionList[1] = CCDelayTime:create(acData.delay/GameConfig.ANIM_FPS)
                actionList[1] = CCDelayTime:create(0.5)
                actionList[2] = CCCallFunc:create(callFunc)
                local action = CCSequence:createWithTwoActions(actionList[1],actionList[2])
                self:runAction(action)
            end
        end
    end
    TFDirector:addMEGlobalListener(CardRoleManager.SPELL_LEVEL_UP_NOTIFY, self.SkillUpCallBack) 

    self.onUpdateStrategyCallBack = function(event)
        KaojiaoManager.roleScoreTab = KaojiaoManager.roleScoreTab or {}
        KaojiaoManager.roleScoreTab[4] = nil
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(4, 1)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(txt)
            end
        end
    end
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyMessage, self.onUpdateStrategyCallBack) 

    self.onZhenfaTupoCallBack = function(event)
        KaojiaoManager.roleScoreTab = KaojiaoManager.roleScoreTab or {}
        KaojiaoManager.roleScoreTab[4] = nil
        local type = event.data[1][1]
        if type == StrategyCardManager.handleStarUp and self and self.refreshUI and AlertManager:getTopLayer() == self then
            local item = PowerCompareData:getItemByTypeAndKind(4, 3)
            local txt = item.onekey_txt

            self:refreshUI()
            toastMessage(txt)
        end
    end
    TFDirector:addMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onZhenfaTupoCallBack)

    self.onUpdateStrategyCallBack = function(event)
        KaojiaoManager.roleScoreTab = KaojiaoManager.roleScoreTab or {}
        KaojiaoManager.roleScoreTab[KaojiaoManager.EnumKaojiaoType.TYPE_EUDEMON] = nil
        if self and self.refreshUI then
            if AlertManager:getTopLayer() == self then
                local item = PowerCompareData:getItemByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_EUDEMON, 1)
                local txt = item.onekey_txt

                self:refreshUI()
                toastMessage(txt)
            end
        end
    end
    TFDirector:addMEGlobalListener(EudemonManager.EquipTeamEudemon, self.onUpdateStrategyCallBack) 
end

function KaojiaoLayer.onOneKeyClick(sender)
    local self = sender.logic
    local type = sender.type
    local kind = sender.kind
    --[[
    local func = KaojiaoManager.oneKeyFunc[type][kind]
    if not func then
        return
    end
    ]]
    local data = {}
    data.type = type
    data.kind = kind
    data.gmId = self.gmId
    data.zhenrongType = self.zhenrong_type
    data.fightType = self:getFightType(self.gmId, self.zhenrong_type)
    KaojiaoManager:triggerOneKeyFunc(data)
end

function KaojiaoLayer:getFightType(gmId, zhenrongType)
    local fightType = EnumFightStrategyType.StrategyType_PVE
    if zhenrongType == self.TYPE_ZHENRONG.SINGLE then
        fightType = EnumFightStrategyType.StrategyType_PVE
    elseif zhenrongType == self.TYPE_ZHENRONG.DOUBLE then
        if self:getDoubleZhenrongIndex(gmId) then
            fightType = self:getDoubleZhenrongIndex(gmId)
        end
    end
    return fightType
end

function KaojiaoLayer.onIcon1ClickHandle(sender)
    local self = sender.logic
    local index = sender.index

    local gmId = self.roleList1[index]

    ------print("index = ", index)
    ------print("gmId = ", gmId)

    if (not gmId) or (self.gmId == gmId) then
        return
    end
    self.gmId = gmId

    self:refreshTopBg(gmId)
    self:refreshIcons()
    self:refreshTab2()
    self:refreshTabView()

    self:selectCell(1)

    self.tabView:scrollToYTop(0)

    ------print(KaojiaoManager:checkJingmaiTupo(gmId))
    ------print("ttttttt:", KaojiaoManager:checkTeamChengzhang(1, self.roleList1))
end

function KaojiaoLayer.onIcon2ClickHandle(sender)
    local self = sender.logic
    local index = sender.index

    local gmId = self.roleList2[index]

    ------print("index = ", index)
    ------print("gmId = ", gmId)

    if (not gmId) or (self.gmId == gmId) then
        return
    end
    self.gmId = gmId

    self:refreshTopBg(gmId)
    self:refreshIcons()
    self:refreshTab2()
    self:refreshTabView()

    self.tabView:scrollToYTop(0)
    self:selectCell(1)
end

function KaojiaoLayer.onReturnClick(sender)
    local self = sender.logic
    if self.cur_page == 2 then
        self:showFirstPage()
    else
        AlertManager:close(AlertManager.TWEEN_1)
    end    
end

function KaojiaoLayer.onSingleClick(sender)
    local self = sender.logic

    if self.zhenrong_type == self.TYPE_ZHENRONG.SINGLE then
        return
    end

    self.btn_shuangzhenrong:setTextureNormal(self.img_zhenrong2[1])
    sender:setTextureNormal(self.img_zhenrong1[2])
    self.zhenrong_type = self.TYPE_ZHENRONG.SINGLE
    self:refreshTable()

    
    self:refreshRoleList()
    self.gmId = self.roleList1[1]
    self:refreshUI()
    
    if self.cur_page == 2 then
        --self.gmId = self.roleList1[1]
        --self:refreshTab2()

        self:refreshTopBg(self.gmId)
        self:refreshIcons()
        
        self:refreshTabView()
        self.tabView:scrollToYTop(0)
        self:selectCell(1)
    end
    
end

function KaojiaoLayer.onDoubleClick(sender)
    local self = sender.logic

    if self.zhenrong_type == self.TYPE_ZHENRONG.DOUBLE then
        return
    end

    self.btn_danzhenrong:setTextureNormal(self.img_zhenrong1[1])
    sender:setTextureNormal(self.img_zhenrong2[2])
    self.zhenrong_type = self.TYPE_ZHENRONG.DOUBLE
    self:refreshTable()

    self:refreshRoleList()    
    self.gmId = self.roleList1[1] or self.roleList2[1]
    self:refreshUI()
 
    if self.cur_page == 2 then        
        --self.gmId = self.roleList1[1] or self.roleList2[1]
        --self:refreshTab2()

        self:refreshTopBg(self.gmId)
        self:refreshIcons()
        
        self:refreshTabView()
        self.tabView:scrollToYTop(0)
        self:selectCell(1)
    end
    
end

function KaojiaoLayer:removeEvents()
    self.super.removeEvents(self)

    TFDirector:removeMEGlobalListener(CardRoleManager.SPELL_LEVEL_UP_NOTIFY, self.SkillUpCallBack)
    TFDirector:removeMEGlobalListener(SkyBookManager.BIBLE_LEVEL_UP_RESULT, self.skyBookLevelUpResultCallBack)
    TFDirector:removeMEGlobalListener(SkyBookManager.ESSENTIAL_MOSAIC_ALL_RESULT, self.mosaicAllCallBack)
    TFDirector:removeMEGlobalListener(CardRoleManager.QUERY_QIMEN_MSG_RESULT, self.qimenQueryCallBack)
    TFDirector:removeMEGlobalListener(CardRoleManager.ROLE_PRACTICE_RESULT, self.RoleStarUpResultCallBack)
    TFDirector:removeMEGlobalListener(EquipmentManager.EQUIP_OPERATION, self.EquipUpdateCallBack)
    TFDirector:removeMEGlobalListener(CardRoleManager.UPDATE_ROLE_TRAIN_INFO, self.RoleAcupointUpdate)
    TFDirector:removeMEGlobalListener(CardRoleManager.UPDATE_ALL_ROLE_TRAIN_INFO, self.RoleAcupointUpdate)

    TFDirector:removeMEGlobalListener(MartialManager.MSG_MartialLevelUp, self.MartialLevelUpCallBack)
    TFDirector:removeMEGlobalListener(MartialManager.OneKeyEquipMartialResult, self.EquipMartialCallBack)
    TFDirector:removeMEGlobalListener(CardRoleManager.ROLE_TRANSFER_RESULT, self.RoleTransferCallBack) 
    TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyMessage, self.onUpdateStrategyCallBack) 
    TFDirector:removeMEGlobalListener(StrategyCardManager.UpdateStrategyCardMessage, self.onZhenfaTupoCallBack)
    TFDirector:removeMEGlobalListener(EudemonManager.EquipTeamEudemon, self.onUpdateStrategyCallBack)  
end


return KaojiaoLayer
