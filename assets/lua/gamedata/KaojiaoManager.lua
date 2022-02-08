--[[
	战力考校(我要变强)
]]

local KaojiaoManager = class("KaojiaoManager")

KaojiaoManager.EnumKaojiaoType = 
{	
	TYPE_CHENGZHANG = 1,	    --成长考校
	TYPE_EQUIP      = 2,		--装备考校
	TYPE_TIANSHU    = 3,		--天书考校
    TYPE_ZHENFA     = 4,        --阵法考校
    TYPE_EUDEMON    = 5,        --宠物考校
    TYPE_MAX = 6
}

KaojiaoManager.EnumChengzhangType = 
{
	TYPE_DENGJI = 1,		--等级
	TYPE_XIAHUNTUPO = 2,	--侠魂突破
	TYPE_WUXUE = 3,			--武学
    TYPE_WUXUE_CHONGSHU = 4, --武学重数
	TYPE_JINENG = 5,		--技能
	TYPE_JINGMAICHONGXUE = 6,	--经脉冲穴
	TYPE_JINGMAITUPO = 7,	--经脉突破
	TYPE_LIANTI = 8,		--炼体
	TYPE_QIMENDUN = 9,		--奇门遁
	TYPE_QIHE = 10,			--契合
    TYPE_QIANXIU = 11,      --潜修
    TYPE_MAX = 12	
}

KaojiaoManager.EnumEquipType = 
{
    TYPE_GENGHUAN_ZHUANGBEI = 1,       --更换装备
    TYPE_GENGHUAN_YUANFENZHUANGBEI = 2,    --更换缘分装备
    TYPE_EQUIP_QIANGHUA = 3,     --强化装备
    TYPE_EQUIP_SHENGXING = 4,    --装备升星
    TYPE_EQUIP_TUPO = 5,         --装备突破
    TYPE_EQUIP_JINGLIAN = 6,     --装备精炼
    TYPE_EQUIP_CHONGZHU = 7,     --装备重铸
    TYPE_EQUIP_XIANGQIAN = 8,    --宝石镶嵌
    TYPE_EQUIP_SHENGJIE = 9,     --装备升阶
    TYPE_MAX = 10
}

KaojiaoManager.EnumTianshuType = 
{
    TYPE_GENGHUAN_TIANSHU = 1,     --更换天书
    TYPE_GENGHUAN_TIANSHU2 = 2,    --更换天书2
    TYPE_XIANGQIAN_JINGYAO = 3,    --镶嵌精要
    TYPE_TIANSHU_TUPO = 4,         --天书突破
    TYPE_TIANSHU_SHENGCHONG = 5,   --天书升重
    TYPE_MAX = 6   
}

KaojiaoManager.EnumZhenfaType = 
{
    TYPE_EQUIP = 1,      --阵法品质
    TYPE_QIANGHUA = 2,   --阵法强化
    TYPE_TUPO = 3,       --阵法突破
    TYPE_MAX        = 4
}

KaojiaoManager.EnumEudemonType = 
{
    TYPE_QUALITY    = 1,      --宠物品质
    TYPE_TUPO       = 2,      --宠物突破
    TYPE_TRAIN      = 3,      --宠物训练师
    TYPE_MAX        = 4  
}

KaojiaoManager.EnumScoreLevel = 
{
    JUELUN = 1,
    ZHUOYUE = 2,
    JIECHU = 3,
    PINGFAN = 4
}

function KaojiaoManager:ctor()
	self:initGoFunc()
    self:initNewGoFunc()
    self:initOneKeyFunc()
    self:initHuoquFunc()
    self:initStatusTab()

    self.pingfenChanged = false

    self.scoreTab = {}
end

function KaojiaoManager:setPingfenChanged(bChanged)
    self.pingfenChanged = bChanged
end

function KaojiaoManager:getPingfenChanged()
    return self.pingfenChanged
end

function KaojiaoManager:initStatusTab()
    self.statusTab = {[1] = {}, [2] = {}, [3] = {}}
    for i = 1, KaojiaoManager.EnumChengzhangType.TYPE_MAX - 1 do
        --是否检测过
        self.statusTab[1][i] = {}
    end
    for i = 1, KaojiaoManager.EnumEquipType.TYPE_MAX - 1 do
        self.statusTab[2][i] = {}
    end
    for i = 1, KaojiaoManager.EnumTianshuType.TYPE_MAX - 1 do
        self.statusTab[3][i] = {}
    end
end

function KaojiaoManager:setStatus(type, kind, status, roleGmId)
    if not roleGmId then
        return
    end
    self.statusTab[type][kind][roleGmId] = status
end

function KaojiaoManager:getStatus(type, kind, roleGmId)
    return self.statusTab[type][kind][roleGmId]
end

--提升跳转函数
function KaojiaoManager:initGoFunc()   
    KaojiaoManager.goFunc = 
    {
        [1] = 
        {
            [1] = self.goRoleDengji,
            [2] = self.goRoleTupo,
            [3] = self.goRole,
            [4] = self.goRole,
            [5] = self.goRoleJineng,
            [6] = self.goJingmaiChongxue,
            [7] = self.goJingmaiTupo,
            [8] = self.goLianti,
            [9] = self.goQimendun,
            [10] = self.goQihe,
            [11] = self.goQianxiu
        },
        [2] = 
        {
            [1] = self.goGenghuanZhuangbei,
            [2] = self.goGenghuanZhuangbei,
            [3] = self.goEquipXiangqian,
            [4] = self.goEquipXiangqian,
            [5] = self.goEquipXiangqian,
            [6] = self.goEquipXiangqian,
            [7] = self.goEquipXiangqian,
            [8] = self.goEquipXiangqian,
            [9] = self.goEquipXiangqian
        },
        [3] = 
        {   
            [1] = self.goGenghuanTianshu,
            [2] = self.goGenghuanTianshu,
            [3] = self.goTianshuShengchong,
            [4] = self.goTianshuTupo,
            [5] = self.goTianshuShengchong
        },
        [4] = 
        {
            [1] = self.goGenghuanZhenfa,
            [2] = self.goZhenfaQianghua,
            [3] = self.goZhenfaTupo,
        },
        [5] = 
        {
            [1] = self.goGenghuanEudemonAdd,
            [2] = self.goGenghuanEudemonTuPo,
            [3] = self.goGenghuanEudemonTrain,
        }
    }
end

--一键函数
function KaojiaoManager:initOneKeyFunc()   
    KaojiaoManager.oneKeyFunc = 
    {
        [1] = 
        {
            [1] = self.oneKeyDengji,
            [2] = self.oneKeyXiahuanTupo,
            [3] = self.oneKeyWuxueZhuangpei,
            [4] = self.oneKeyWuxueShengchong,
            [5] = self.oneKeySkillLevelUp,
            [6] = self.oneKeyJingmaiChongxue,            
            [9] = self.oneKeyQimendun
        },
        [2] = 
        {
            [1] = self.oneKeyGenghuanZhuangbei,
            [3] = self.oneKeyEquipQianghua           
        },
        [3] = 
        {               
            [3] = self.oneKeyXiangqianJingyao,
            [5] = self.oneKeyTianshuShengchong
        },
        [4] = 
        {
            [1] = self.oneKeyEquipZhenfa,
            [3] = self.oneKeyZhenfaTupo
        }
    }
end

--获取函数
function KaojiaoManager:initHuoquFunc()   
    KaojiaoManager.huoquFunc = 
    {
        [1] = 
        {
            [1] = self.goHuoquDengji,
            [2] = self.goHuoquXiahun,
            [3] = self.goHuoquWuxue,
            [4] = self.goHuoquWuxue,
            [5] = self.goHuoquRoleDengji,
            [6] = self.goHuoquJingmaiChongxue,
            [7] = self.goHuoquJingmaiTupo,
            [8] = self.goHuoquXiahun,
            [9] = self.goHuoquJingmaiChongxue,
            [10] = self.goHuoquQihe,
            [11] = self.goHuoquQianxiu
        },
        [2] = 
        {
            [1] = self.goHuoquEquipQuality,
            [3] = self.goHuoquQianghua,
            [4] = self.goHuoquDengji,
            [5] = self.goHuoquJingmaiTupo,
            [6] = self.goHuoquJinglian,
            [7] = self.goHuoquChongzhu,
            [8] = self.goHuoquEquipXiangqian,
            [9] = self.goHuoquEquipShengjie
        },
        [3] = 
        {   
            [2] = self.goHuoquTianshu,
            [3] = self.goHuoquJingyao,
            [4] = self.goHuoquTianshuTupo,
            [5] = self.goHuoquTianshuTupo
        },
        [4] = 
        {
            [1] = self.goHuoquZhenfa,
            [2] = self.goHuoquZhenfa,
            [3] = self.goHuoquZhenfa,
        },
        [5] = 
        {
            [1] = self.goHuoquEudemon,
            [2] = self.goHuoquEudemon,
            [3] = self.goHuoquEudemon,
        }
    }
end

--蓝色提升跳转函数
function KaojiaoManager:initNewGoFunc()   
    KaojiaoManager.newGoFunc = 
    {
        [1] = 
        {
            [1] = self.goRoleDengji,
            [2] = self.goRoleTupo,
            [3] = self.goRole,
            [4] = self.goRole,
            [5] = self.goRoleJineng,
            [6] = self.goJingmaiChongxue,
            [7] = self.goJingmaiTupo,
            [8] = self.goLianti,
            [9] = self.goQimendun,
            [10] = self.goQihe,
            [11] = self.goQianxiu
        },
        [2] = 
        {
            [1] = self.goRole,
            [2] = self.goRole,
            [3] = self.goEquipXiangqian,
            [4] = self.goEquipXiangqian,
            [5] = self.goEquipXiangqian,
            [6] = self.goEquipXiangqian,
            [7] = self.goEquipXiangqian,
            [8] = self.goEquipXiangqian,
            [9] = self.goEquipXiangqian
        },
        [3] = 
        {   
            [1] = self.goGenghuanTianshu,
            [2] = self.goGenghuanTianshu,
            [3] = self.goTianshuShengchong,
            [4] = self.goTianshuTupo,
            [5] = self.goTianshuShengchong
        },
        [4] = 
        {
            [1] = self.goGenghuanZhenfa,
            [2] = self.goZhenfaQianghua,
            [3] = self.goZhenfaTupo,
        },
        [5] = 
        {
            [1] = self.goHuoquEudemon,
            [2] = self.goGenghuanEudemonTuPo,
            [3] = self.goGenghuanEudemonTrain,
        }
    }
end

function KaojiaoManager:checkByTypeAndKind(type, kind, roleGmId, isHuoqu, zhenrongType)
    if (not roleGmId) or (not type) or (not kind) then
        return
    end

    if type == KaojiaoManager.EnumKaojiaoType.TYPE_CHENGZHANG then
        return self:checkChengzhang(kind, roleGmId, isHuoqu)
    elseif type == KaojiaoManager.EnumKaojiaoType.TYPE_EQUIP then
        return self:checkEquip(kind, roleGmId, isHuoqu)
    elseif type == KaojiaoManager.EnumKaojiaoType.TYPE_TIANSHU then
        return self:checkTianshu(kind, roleGmId, isHuoqu)
    elseif type == KaojiaoManager.EnumKaojiaoType.TYPE_ZHENFA then
        return self:checkZhenfa(kind, roleGmId, isHuoqu, zhenrongType)
    elseif type == KaojiaoManager.EnumKaojiaoType.TYPE_EUDEMON then
        return self:checkEudemon(kind, roleGmId, isHuoqu, zhenrongType)
    end
end

function KaojiaoManager:checkChengzhang(kind, roleGmId, isHuoqu)
    if kind == KaojiaoManager.EnumChengzhangType.TYPE_DENGJI then
        return self:checkDengji(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_XIAHUNTUPO then
        return self:checkXiahunTupo(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_WUXUE then
        return self:checkWuxue(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_WUXUE_CHONGSHU then
        return self:checkWuxueChongshu(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_JINENG then
        return self:checkJineng(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_JINGMAICHONGXUE then
        return self:checkJingmaiChongxue(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_JINGMAITUPO then
        return self:checkJingmaiTupo(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_LIANTI then
        return self:checkLianti(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_QIMENDUN then
        return self:checkQimendun(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_QIHE then
        return self:checkQihe(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumChengzhangType.TYPE_QIANXIU then
        return self:checkQianxiu(roleGmId, isHuoqu)
    end
end

function KaojiaoManager:checkEquip(kind, roleGmId, isHuoqu)
    if kind == KaojiaoManager.EnumEquipType.TYPE_GENGHUAN_ZHUANGBEI then
        return self:checkGenghuanZhuangbei(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumEquipType.TYPE_GENGHUAN_YUANFENZHUANGBEI then
        return self:checkGenghuanYuanfenZhuangbei(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumEquipType.TYPE_EQUIP_QIANGHUA then
        return self:checkEquipQianghua(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumEquipType.TYPE_EQUIP_SHENGXING then
        return self:checkEquipShengxing(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumEquipType.TYPE_EQUIP_TUPO then
        return self:checkEquipTupo(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumEquipType.TYPE_EQUIP_JINGLIAN then
        return self:checkEquipJinglian(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumEquipType.TYPE_EQUIP_CHONGZHU then
        return self:checkEquipChongzhu(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumEquipType.TYPE_EQUIP_XIANGQIAN then
        return self:checkEquipXiangqian(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumEquipType.TYPE_EQUIP_SHENGJIE then
        return self:checkEquipShengjie(roleGmId, isHuoqu)
    end
end

function KaojiaoManager:checkTianshu(kind, roleGmId, isHuoqu)
    if kind == KaojiaoManager.EnumTianshuType.TYPE_GENGHUAN_TIANSHU then
        return self:checkGenghuanTianshu(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumTianshuType.TYPE_GENGHUAN_TIANSHU2 then
        return self:checkGenghuanTianshu2(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumTianshuType.TYPE_XIANGQIAN_JINGYAO then
        return self:checkXiangqianJingyao(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumTianshuType.TYPE_TIANSHU_TUPO then
        return self:checkTianshuTupo(roleGmId, isHuoqu)
    elseif kind == KaojiaoManager.EnumTianshuType.TYPE_TIANSHU_SHENGCHONG then
        return self:checkTianshuShengchong(roleGmId, isHuoqu)
    end
end

function KaojiaoManager:checkZhenfa(kind, roleGmId, isHuoqu, zhenrongType)
    if kind == KaojiaoManager.EnumZhenfaType.TYPE_QIANGHUA then
        return self:checkZhenfaQianghua(roleGmId, isHuoqu, zhenrongType)
    elseif kind == KaojiaoManager.EnumZhenfaType.TYPE_TUPO then
        return self:checkZhenfaTupo(roleGmId, isHuoqu, zhenrongType)
    elseif kind == KaojiaoManager.EnumZhenfaType.TYPE_EQUIP then
        return self:checkZhenfaEquip(roleGmId, isHuoqu, zhenrongType)
    end
end
--宠物
function KaojiaoManager:checkEudemon(kind, roleGmId, isHuoqu, zhenrongType)
    if kind == KaojiaoManager.EnumEudemonType.TYPE_QUALITY then
        return self:checkEudemonQuality(roleGmId, isHuoqu, zhenrongType)
    elseif kind == KaojiaoManager.EnumEudemonType.TYPE_TUPO then
        return self:checkEudemonTupo(roleGmId, isHuoqu, zhenrongType)
    elseif kind == KaojiaoManager.EnumEudemonType.TYPE_TRAIN then
        return self:checkEudemonTrain(roleGmId, isHuoqu, zhenrongType)
    end
end


--成长
function KaojiaoManager:checkTeamChengzhang(kind, roleList, zhenrongType)
    local item = PowerCompareData:getItemByTypeAndKind(1, kind)
    local data = {}
    local count = 0
    local cur = 0
    local max = 0

    local function changeCount(bCan)
        if bCan then
            count = count + 1
        end
    end
    if item.score_type == 0 then
        return self.EnumScoreLevel.PINGFAN, 0
    end
    for i = 1, #roleList do
        self.checkTab = self.checkTab or {}
        self.checkTab[1] = self.checkTab[1] or {}
        self.checkTab[1][kind] = self.checkTab[1][kind] or {}
        local tab1 = {}
        if not self.checkTab[1][kind][ roleList[i] ] then
            self.checkTab[1][kind][ roleList[i] ] = {}
            local bCan, tab = self:checkByTypeAndKind(1, kind, roleList[i], true, zhenrongType)
            if tab then
                local m1 = PowerCompareMaxData:getLimit(1, kind, MainPlayer:getLevel(), 1)
                local m2 = PowerCompareMaxData:getLimit(1, kind, MainPlayer:getLevel(), 2)
                if tab.max and m1 and m1 > 0 then
                    tab.max = m1
                end
                if tab.max1 and m2 and m2 > 0 then
                    tab.max1 = m2
                end
            end

            self.checkTab[1][kind][ roleList[i] ].bCan = bCan
            self.checkTab[1][kind][ roleList[i] ].tab = tab
        end
        --local bCan, tab = self:checkByTypeAndKind(1, kind, roleList[i], true, zhenrongType)
        local bCan = self.checkTab[1][kind][ roleList[i] ].bCan
        local tab = self.checkTab[1][kind][ roleList[i] ].tab
        cur = cur + tab.cur1
        max = max + tab.max1 
        changeCount(bCan)
    end

    data.cur = cur
    data.max = max

    local ret = self:checkTeamScore(item, data, roleList)
    return ret, count     
end

--装备成长
function KaojiaoManager:checkTeamEquip(kind, roleList, zhenrongType)
    local item = PowerCompareData:getItemByTypeAndKind(2, kind)
    local data = {}
    local count = 0
    local cur = 0
    local max = 0

    local function changeCount(bCan)
        if bCan then
            count = count + 1
        end
    end

    if item.score_type == 0 then
        return self.EnumScoreLevel.PINGFAN, 0
    end
    for i = 1, #roleList do
        self.checkTab = self.checkTab or {}
        self.checkTab[2] = self.checkTab[2] or {}
        self.checkTab[2][kind] = self.checkTab[2][kind] or {}
        local tab1 = {}
        if not self.checkTab[2][kind][ roleList[i] ] then
            self.checkTab[2][kind][ roleList[i] ] = {}
            local bCan, tab = self:checkByTypeAndKind(2, kind, roleList[i], true, zhenrongType)

            if tab then
                local m1 = PowerCompareMaxData:getLimit(2, kind, MainPlayer:getLevel(), 1)
                local m2 = PowerCompareMaxData:getLimit(2, kind, MainPlayer:getLevel(), 2)
                if tab.max and m1 and m1 > 0 then
                    tab.max = m1
                end
                if tab.max1 and m2 and m2 > 0 then
                    tab.max1 = m2
                end
            end

            self.checkTab[2][kind][ roleList[i] ].bCan = bCan
            self.checkTab[2][kind][ roleList[i] ].tab = tab
        end
        --local bCan, tab = self:checkByTypeAndKind(1, kind, roleList[i], true, zhenrongType)
        local bCan = self.checkTab[2][kind][ roleList[i] ].bCan
        local tab = self.checkTab[2][kind][ roleList[i] ].tab
        cur = cur + tab.cur1
        max = max + tab.max1 
        changeCount(bCan)
    end

    data.cur = cur
    data.max = max

    local ret = self:checkTeamScore(item, data, roleList)
    return ret, count     
end

--总权重
function KaojiaoManager:getTotalWeightByType(type)
    local count = 0
    local function changeCount(kind)
        local item = PowerCompareData:getItemByTypeAndKind(type, kind)
        if item.score_type ~= 0 then
            count = count + item.weight
        end
    end
    if type == self.EnumKaojiaoType.TYPE_CHENGZHANG then
        for i = 1, self.EnumChengzhangType.TYPE_MAX - 1 do
            changeCount(i)
        end
    elseif type == self.EnumKaojiaoType.TYPE_EQUIP then
        for i = 1, self.EnumEquipType.TYPE_MAX - 1 do
            changeCount(i)
        end
    elseif type == self.EnumKaojiaoType.TYPE_TIANSHU then
        for i = 1, self.EnumTianshuType.TYPE_MAX - 1 do
            changeCount(i)
        end
    elseif type == self.EnumKaojiaoType.TYPE_ZHENFA then
        for i = 1, self.EnumZhenfaType.TYPE_MAX - 1 do
            changeCount(i)
        end
    elseif type == self.EnumKaojiaoType.TYPE_EUDEMON then
        for i = 1, self.EnumEudemonType.TYPE_MAX - 1 do
            changeCount(i)
        end
    end
    return count
end

--天书成长
function KaojiaoManager:checkTeamTianshu(kind, roleList, zhenrongType)
    local item = PowerCompareData:getItemByTypeAndKind(3, kind)
    local data = {}
    local count = 0
    local cur = 0
    local max = 0

    local function changeCount(bCan)
        if bCan then
            count = count + 1
        end
    end

    -- for i = 1, #roleList do
    --     if kind == KaojiaoManager.EnumTianshuType.TYPE_GENGHUAN_TIANSHU then                    
    --         return self.EnumScoreLevel.PINGFAN, 0  
    --     end
    --     local bCan, tab = self:checkByTypeAndKind(3, kind, roleList[i], true, zhenrongType)
    --     cur = cur + tab.cur1
    --     max = max + tab.max1
    --     changeCount(bCan)
    -- end

    for i = 1, #roleList do
        if kind == KaojiaoManager.EnumTianshuType.TYPE_GENGHUAN_TIANSHU then                    
            return self.EnumScoreLevel.PINGFAN, 0  
        end
        self.checkTab = self.checkTab or {}
        self.checkTab[3] = self.checkTab[3] or {}
        self.checkTab[3][kind] = self.checkTab[3][kind] or {}
        local tab1 = {}
        if not self.checkTab[3][kind][ roleList[i] ] then
            self.checkTab[3][kind][ roleList[i] ] = {}
            local bCan, tab = self:checkByTypeAndKind(3, kind, roleList[i], true, zhenrongType)

            if tab then
                local m1 = PowerCompareMaxData:getLimit(3, kind, MainPlayer:getLevel(), 1)
                local m2 = PowerCompareMaxData:getLimit(3, kind, MainPlayer:getLevel(), 2)
                if tab.max and m1 and m1 > 0 then
                    tab.max = m1
                end
                if tab.max1 and m2 and m2 > 0 then
                    tab.max1 = m2
                end
            end

            self.checkTab[3][kind][ roleList[i] ].bCan = bCan
            self.checkTab[3][kind][ roleList[i] ].tab = tab
        end
        --local bCan, tab = self:checkByTypeAndKind(1, kind, roleList[i], true, zhenrongType)
        local bCan = self.checkTab[3][kind][ roleList[i] ].bCan
        local tab = self.checkTab[3][kind][ roleList[i] ].tab
        cur = cur + tab.cur1
        max = max + tab.max1
        changeCount(bCan)
    end

    data.cur = cur
    data.max = max

    local ret = self:checkTeamScore(item, data, roleList)
    return ret, count     
end

--阵法成长
function KaojiaoManager:checkTeamZhenfa(kind, roleList, zhenrongType)
    local item = PowerCompareData:getItemByTypeAndKind(4, kind)
    local data = {}
    local count = 0
    local cur = 0
    local max = 0
    --[[
    local function changeCount(bCan)
        if bCan then
            count = count + 1
        end
    end

    for i = 1, #roleList do
        if item.score_type == 0 then
            return self.EnumScoreLevel.PINGFAN, 0
        end
        local bCan, tab = self:checkByTypeAndKind(4, kind, roleList[i], zhenrongType)
        cur = cur + tab.cur1
        max = max + tab.max1
        changeCount(bCan)
    end
    ]]
    local bCan, tab = self:checkByTypeAndKind(4, kind, 1, true, zhenrongType)

    if tab then
        local m1 = PowerCompareMaxData:getLimit(4, kind, MainPlayer:getLevel(), 1)
        local m2 = PowerCompareMaxData:getLimit(4, kind, MainPlayer:getLevel(), 2)
        if tab.max and m1 and m1 > 0 then
            tab.max = m1
        end
        if tab.max1 and m2 and m2 > 0 then
            tab.max1 = m2
        end
    end

    data.cur = tab.cur1
    data.max = tab.max1

    local ret = self:checkTeamScore(item, data, roleList)
    return ret, count     
end
--宠物成长
function KaojiaoManager:checkTeamEudemon(kind, roleList, zhenrongType)
    local item = PowerCompareData:getItemByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_EUDEMON, kind)
    local data = {}
    local count = 0
    local cur = 0
    local max = 0
   
    local bCan, tab = self:checkByTypeAndKind(KaojiaoManager.EnumKaojiaoType.TYPE_EUDEMON, kind, 1, true, zhenrongType)
    if (tab == nil) then
        tab = {}
        tab.cur1 = 0
        tab.cur1 = 0
    end
    data.cur = tab.cur1
    data.max = tab.max1

    local ret = self:checkTeamScore(item, data, roleList)
    return ret, count     
end

--团队评级
function KaojiaoManager:checkTeamScore(item, data, roleList)
    if item.score_type == 0 then
        return nil
    end

    local type = self.EnumScoreLevel.PINGFAN
    local roleCount = #roleList
    local score1 = tonumber(item.score1)
    local score2 = tonumber(item.score2)
    local score3 = tonumber(item.score3)

    local score = {score1, score2, score3}
    local mul_role = tonumber(item.mul_role)
    if item.score_type == 1 then
        --差值
        local delta = data.max - data.cur
        if mul_role == 1 then
            for i = 1, 3 do
                score[i] = score[i] * roleCount
            end
        end
        if delta <= score[1] then
            type = self.EnumScoreLevel.JUELUN
        elseif delta <= score[2] then
            type = self.EnumScoreLevel.ZHUOYUE
        elseif delta <= score[3] then
            type = self.EnumScoreLevel.JIECHU
        else
            type = self.EnumScoreLevel.PINGFAN
        end
    elseif item.score_type == 2 then    
        --百分比
        local per = math.floor(data.cur / data.max * 100)
        if per >= score[1] then
            type = self.EnumScoreLevel.JUELUN
        elseif per >= score[2] then
            type = self.EnumScoreLevel.ZHUOYUE
        elseif per >= score[3] then
            type = self.EnumScoreLevel.JIECHU
        else
            type = self.EnumScoreLevel.PINGFAN
        end
    end

    return type
end

--单人大类评分
function KaojiaoManager:getRoleScore(type, roleGmId, zhenrongType)
    local limitScore = ConstantData:objectByID("PowerCompareCalculate1").value or 10000
    local count = 0
    local function changeCount(kind)
        local item = PowerCompareData:getItemByTypeAndKind(type, kind)

        --TFLuaTime:begin()
        --print("begin +++++ ", type, kind)

        local bCan, tab = self:checkByTypeAndKind(type, kind, roleGmId, true, zhenrongType)

        if tab then
            local m1 = PowerCompareMaxData:getLimit(type, kind, MainPlayer:getLevel(), 1)
            local m2 = PowerCompareMaxData:getLimit(type, kind, MainPlayer:getLevel(), 2)
            if tab.max and m1 and m1 > 0 then
                tab.max = m1
            end
            if tab.max1 and m2 and m2 > 0 then
                tab.max1 = m2
            end
        end

        --TFLuaTime:endToLua("ooooooooo time >>>>> ")

        local per = 0
        if tab and tab.max1 and tab.max1 ~= 0 and item.score_type ~= 0 then
            per = tab.cur1 / tab.max1
            if per > 1 then
                per = 1
            end
        end
        if item.score_type ~= 0 then            
            local score = per * ( item.weight / self:getTotalWeightByType(type) ) * limitScore
            count = count + score
        end
    end
    if type == self.EnumKaojiaoType.TYPE_CHENGZHANG then
        for i = 1, self.EnumChengzhangType.TYPE_MAX - 1 do
            changeCount(i)
        end
    elseif type == self.EnumKaojiaoType.TYPE_EQUIP then
        for i = 1, self.EnumEquipType.TYPE_MAX - 1 do
            changeCount(i)
        end
    elseif type == self.EnumKaojiaoType.TYPE_TIANSHU then
        for i = 1, self.EnumTianshuType.TYPE_MAX - 1 do
            changeCount(i)
        end
    elseif type == self.EnumKaojiaoType.TYPE_ZHENFA then
        for i = 1, self.EnumZhenfaType.TYPE_MAX - 1 do
            changeCount(i)
        end
    elseif type == self.EnumKaojiaoType.TYPE_EUDEMON then
        for i = 1, self.EnumEudemonType.TYPE_MAX - 1 do
            changeCount(i)
        end
    end
    return count
end

--团队大项评分
function KaojiaoManager:getTeamDaxiangScore(type, roleList, zhenrongType)
    local count = 0
    for i = 1, #roleList do
        self.roleScoreTab = self.roleScoreTab or {}
        self.roleScoreTab[type] = self.roleScoreTab[type] or {}
        self.roleScoreTab[type][roleList[i]] = self.roleScoreTab[type][roleList[i]] or self:getRoleScore(type, roleList[i], zhenrongType)
        count = count + self.roleScoreTab[type][roleList[i]]
        --count = count + self:getRoleScore(type, roleList[i], zhenrongType)
    end
    return count
end

--大项进度
function KaojiaoManager:getTeamDaxiangProcess(type, roleList)
    local limitScore = ConstantData:objectByID("PowerCompareCalculate1").value or 10000

    return self:getTeamDaxiangScore(type, roleList) / (limitScore * #roleList)
end

--总进度
function KaojiaoManager:getTotalProcess(roleList, score)
    local limitScore = ConstantData:objectByID("PowerCompareCalculate1").value or 10000

    --local score = self:getTotalScore(roleList)
    local total = limitScore * #roleList * (self.EnumKaojiaoType.TYPE_MAX - 1)
    return score / total * 100
end

--总评分
function KaojiaoManager:getTotalScore(roleList, zhenrongType)
    local scoreCount = 0
    local maxIndex = self.EnumKaojiaoType.TYPE_MAX - 1
    local verLock = VersionLockData:objectByID(EnumVersionLockType.StrategyCard_Lock)
    if verLock and verLock.open == 0 then
        maxIndex = self.EnumKaojiaoType.TYPE_TIANSHU
    end
    for i = 1, maxIndex do
        self.scoreTab[i] = self:getTeamDaxiangScore(i, roleList, zhenrongType)
        scoreCount = scoreCount + self.scoreTab[i]
    end

    return scoreCount
end

--提升等级限制
function KaojiaoManager:checkLevel(item)
    if item.type == self.EnumKaojiaoType.TYPE_CHENGZHANG and item.kind == self.EnumChengzhangType.TYPE_JINGMAITUPO then
        if ClimbManager:getClimbFloorNum() >= 100 then
            return true
        else
            return false
        end
    end

    if MainPlayer:getLevel() >= item.level1 then
        return true
    end
    return false
end

--获取等级限制
function KaojiaoManager:checkHuoquLevel(item)
    if item.type == self.EnumKaojiaoType.TYPE_CHENGZHANG and item.kind == self.EnumChengzhangType.TYPE_JINGMAITUPO then
        if ClimbManager:getClimbFloorNum() >= 100 then
            return true
        else
            return false
        end
    end

    if MainPlayer:getLevel() >= item.level2 and item.whether_have == 1 then
        return true
    end
    return false
end

--获取途径等级限制
function KaojiaoManager:checkGetWayLevel(item)
    if (item.type == self.EnumKaojiaoType.TYPE_CHENGZHANG and item.kind == self.EnumChengzhangType.TYPE_JINGMAITUPO) or ((item.type == 2 and item.kind == 5)) then
        if ClimbManager:getClimbFloorNum() >= 100 then
            return true
        else
            return false
        end
    end

    if (item.type == 3 and item.kind == 4) or (item.type == 3 and item.kind == 5) then
        if FactionManager:isJoinFaction() and FactionManager:getFactionInfo().level >= 2 then
            return true
        end
        return false
    end

    -- if item.type == 2 and item.kind == 7 then
    --     if MultiServerFightManager:getActivityState() == 0 or MultiServerFightManager:getActivityState() == nil then
    --         return false
    --     else
    --         return true
    --     end
    -- end
    if item.type == self.EnumKaojiaoType.TYPE_EUDEMON then
        if MainPlayer:getServerSwitchStatue(ServerSwitchType.Eudemon) == false then
            return false
        end
    end
    if MainPlayer:getLevel() >= item.way_level then
        return true
    end
    return false
end

--等级
--全满足
--1.未达到团队等级
--2.有蛇胆

--[[
local shedanList = {}
    for i = 1, 4 do
        shedanList[i] = 0
        local tempList = BagManager:getItemByKind(EnumGameItemType.Soul, 3)
        for v in tempList:iterator() do
            if v.quality == i and v.num then
                shedanList[i] = shedanList[i] + v.num
            end
        end
    end
    local tTab = {10, 50, 250, 1250}
    local idList = {3000, 3001, 3002, 3003}
    local numList = {}
    local templevel = tonumber(role.level)
    local tempexp = role.curExp
    local costCoin = 0

    local function changeExp(addExp)
        local maxExp = LevelData:getMaxRoleExp(templevel)
        tempexp = tempexp + addExp
        while tempexp >= maxExp and maxExp > 0  do
            templevel = templevel + 1
            tempexp = tempexp - maxExp
            maxExp = LevelData:getMaxRoleExp(templevel)
        end
    end

    local bStop = false
    for i = 1, #shedanList do
        local count = 0   
        local bagCount = BagManager:getItemNumById(idList[i])     
        for j = 1, shedanList[i] do
            local maxExp = LevelData:getMaxRoleExp(templevel)
            local item = ItemData:objectByID(idList[i])
            local TransferSoulCost = tTab[item.quality]
            local addExp = item.provide_exp

            if not bStop then
                changeExp(addExp)
                
                --print("{{{{{", costCoin)
                --print("}}}}}", MainPlayer:getCoin())
                if count >= bagCount or costCoin >= MainPlayer:getCoin() then
                    count = count - 1
                    break
                end
                count = count + 1
                costCoin = costCoin + TransferSoulCost
                if templevel > MainPlayer:getLevel() or maxExp == 0 or (templevel == MainPlayer:getLevel() and tempexp >= maxExp) then 
                    bStop = true               
                    break
                end
            end
        end 
        numList[i] = count
    end
]]

function KaojiaoManager:checkDengji(roleGmId, isHuoqu)
	local role = CardRoleManager:getRoleByGmid(roleGmId)
    local canHuoqu = true
    --[[
    if isHuoqu then
        if role.level < MainPlayer:getLevel() then
            return true
        else
            return false
        end
    end
    ]]

    local tTab = {10, 50, 250, 1250}
    local idList = {3000, 3001, 3002, 3003}

    if role.level < MainPlayer:getLevel() then
        canHuoqu = true
    else
        canHuoqu = false
    end

    local tab = {}
    tab.cur = role.level
    tab.max = MainPlayer:getLevel()
    tab.cur1 = role.level
    tab.max1 = MainPlayer:getLevel()
    tab.funcData = { roleGmId }
	if role.level < MainPlayer:getLevel() then
        local index = 0
        local bCan = false
        for i = 1, #idList do
            local bagCount = BagManager:getItemNumById(idList[i]) 
            if bagCount > 0 then
                index = i
                break
            end  
        end
        if index ~= 0 then
            local cost = tTab[index]
            if MainPlayer:getCoin() >= cost then
                bCan = true
            end
        else
            bCan = false
        end

        local shedanList = BagManager:getItemByKind(EnumGameItemType.Soul, 3)
        for v in shedanList:iterator() do
            if v.num > 0 and bCan then                
                return true, tab, canHuoqu
            end
        end
    end
    
    return false, tab, canHuoqu
end

--侠魂突破
--材料足够突破
function KaojiaoManager:checkXiahunTupo(roleGmId, isHuoqu)    
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local canHuoqu = true

    local tab = {}
    tab.cur = cardRole.starlevel
    tab.max = cardRole.maxStar
    tab.cur1 = tab.cur
    tab.max1 = tab.max
    tab.funcData = { roleGmId }

    --if isHuoqu then
        if cardRole.starlevel >= cardRole.maxStar then
            canHuoqu = false
        else
            local roleInfoList = RoleTalentData:GetRoleStarInfoByRoleId( cardRole.id )
            local RoleStarLevelInfo = roleInfoList:getObjectAt(cardRole.starlevel + 1)
            local limitLevel = RoleStarLevelInfo.role_level or 0
            if cardRole.level >= limitLevel then
                canHuoqu = true
            else
                canHuoqu = false
            end
        end
        
    --end

	local bCan = CardRoleManager:isCanStarUp(roleGmId)
    if bCan then
        return true, tab, canHuoqu
    end

    return false, tab, canHuoqu
end

local function getWuxueLimitLevel(level)
    if level < 10 then
        return 2
    elseif level < 20 then
        return 3
    elseif level < 26 then
        return 4
    elseif level < 40 then
        return 5
    elseif level < 47 then
        return 6
    elseif level < 57 then
        return 7
    elseif level < 67 then
        return 8
    elseif level < 77 then
        return 9
    elseif level < 90 then
        return 10
    elseif level < 93 then
        return 11
    elseif level < 97 then
        return 12
    elseif level < 110 then
        return 13
    elseif level < 1000 then
        return 14
    end
end

--武学
--其一
--1.有可装配的没有装配
--2.有材料可合成
function KaojiaoManager:checkWuxue(roleGmId, isHuoqu)
	-- 0 不存在
    -- 1 背包存在并且可以穿戴
    -- 2 背包存在并且不可以穿戴
    -- 3 可以合成并且可以穿戴
    -- 4 可以合成并且不可以穿戴
	local role = CardRoleManager:getRoleByGmid(roleGmId)
	local bookStatus = 0

	local martialLevel = role.martialLevel
    local martialList  = role.martialList
	local bookListData = MartialRoleConfigure:findByRoleIdAndMartialLevel(role.id, martialLevel)
    local bookList     = bookListData:getMartialTable()

    local count = 0
    local bEnough = false
    local bCanhuoqu = false
    local addCount = 0
    for i = 1, 6 do
    	local bookid   = bookList[i]
    	local bookInfo = MartialData:objectByID(bookid)

    	local roleLevel = role.level
	    local id        = bookInfo.goodsTemplate.id
	    local bag       = BagManager:getItemById(id)
	    local bookLevel = bookInfo.goodsTemplate.level

        if martialList[i] then
            count = count + 1
        else
            --获取判定: 有未装配武学的装配等级小于等于侠客等级
            if roleLevel >= bookLevel then
                bCanhuoqu = true
                addCount = addCount + 1
            end
        end

	    -- 背包中存在
	    if bag then
	        bookStatus = 1
	    else
	        if MartialManager:isCanSynthesisById(id, 1) then
	            bookStatus = 3
	        end
	    end

	    -- 穿戴等级
	    -- 有物品 才判断等级
	    if bookLevel > roleLevel and bookStatus > 0 then
	        bookStatus = bookStatus + 1
	    end

        if martialList[i] then
            bookStatus = 5
        end

	    if bookStatus == 1 or bookStatus == 3 then
	    	bEnough = true
	    end
    end
    --[[
    if isHuoqu then
        if bCanhuoqu then
            return true
        else
            return false
        end
    end
    ]]
    local tab_new = {}
    tab_new.cur = count + (martialLevel - 1) * 6 
    tab_new.max = count + addCount + (martialLevel - 1) * 6
    tab_new.cur1 = tab_new.cur
    tab_new.max1 = 6 * getWuxueLimitLevel(role.level)
    tab_new.funcData = { roleGmId }

    if bEnough then        
        return true, tab_new, bCanhuoqu
    end

    return false, tab_new, bCanhuoqu
end

--武学重数
--可升重
function KaojiaoManager:checkWuxueChongshu(roleGmId, isHuoqu)
    local role = CardRoleManager:getRoleByGmid(roleGmId)

    local martialLevel = role.martialLevel
    local martialList  = role.martialList

    local MaxLevel = ConstantData:getValue("wuxue.MaxLevel")

    local count = 0
    for i = 1, 6 do
        if martialList[i] then
            count = count + 1
        end
    end
    
    --ConstantData:getValue("wuxue.MaxLevel")

    local tab = {}
    tab.cur = martialLevel
    --tab.max = getWuxueLimitLevel(role.level)
    tab.max = MaxLevel
    tab.funcData = { roleGmId }
    if count == 6 and martialLevel < MaxLevel then        
        return true, tab, false
    end

    return false, tab, false
end


--技能
--全部满足时
--1.有技能点未使用
--2.侠客正在使用的技能没升满
function KaojiaoManager:checkJineng(roleGmId, isHuoqu)
	local role = CardRoleManager:getRoleByGmid(roleGmId)
    --local skillMaxLevel = ConstantData:objectByID("RoleSkill.Max.Level").value or 150
    local skillMaxLevel = MainPlayer:getLevel()

    local count = 0
    local bCan = false
    local bEnough = false
    
    local item = RoleData:objectByID(role.id) 
    local list = nil
    local skillMax = 0
    if role:getIsMainPlayer() then
        list = item:getLeadingSpellInfoList().m_list
        for i, spell in pairs(role.leadingRoleSpellList) do
            if spell.choice then
                local info = SkillAttributeData:objectByID(spell.spellId.level)
                if info then
                    local cost = info.uplevel_cost
                    if MainPlayer:getCoin() >= cost then
                        bEnough = true
                    end
                end

                count = count + spell.spellId.level
                if spell.spellId.level < role.level then
                    bCan = true
                end
            end
        end
    else
        --print("(((((((( role", role.spellLevelIdList)
        list = item:getSpellInfoList().m_list
        for i, levelInfo in pairs(role.spellLevelIdList) do
            local info = SkillAttributeData:objectByID(levelInfo.level)
            if info then
                local cost = info.uplevel_cost
                --print("cost >>>>> ", cost)
                if MainPlayer:getCoin() >= cost then
                    bEnough = true
                end
            end

            count = count + levelInfo.level
            if levelInfo.level < role.level then
                bCan = true
            end
        end
    end
    --[[
    if isHuoqu then
        return bCan
    end
    ]]
    --print("{{{{{{{{{{{>>>>>>>>>",role.id, #list)

    --[[
    local skillMax = #list
    if skillMax == 10 then
        skillMax = 3
    end

    local isFourSkill = false
    if role and role.quality == QUALITY_SHENHUA  then
        isFourSkill = true
    end
    local bQualityUp = CardRoleManager:getShengPingByCard(role)
    if bQualityUp then
        isFourSkill = true
    end 
    local skillCount = skillMax
    if isFourSkill then
        skillCount = 4
    end
    ]]

    local skillCount = 3
    if role.quality == QUALITY_SHENHUA then
        skillCount = 4
    end

    local tab = {}
    tab.cur = count
    tab.max = skillMaxLevel * skillCount
    tab.cur1 = tab.cur
    tab.max1 = tab.max
    tab.funcData = { roleGmId }

    local pointInfo = MainPlayer:GetChallengeTimesInfo(EnumRecoverableResType.SKILL_POINT)
    if (not pointInfo) then
        return false, tab, bCan
    end

    local leftTimes = pointInfo:getLeftChallengeTimes()
    if leftTimes < 1 then
        return false, tab, bCan
    end

    --role:isSkillCanUp()
    
    if bCan and bEnough then
        return true, tab, bCan
    end

    return false, tab, bCan
end


--经脉冲穴
--全部满足时
--1.冲穴等级未满
--2.剩余真气足够冲穴
function KaojiaoManager:checkJingmaiChongxue(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true

    local extraLianTiInfo = cardRole:getExtraLianTiAttri()
    local acupointIndex = cardRole:getCurrentAcupointIndex()
    local currentAcupoint = cardRole:GetAcupointInfo(acupointIndex)

    local count = 0
    for i = 1, 6 do
        local info = cardRole:GetAcupointInfo(i)
        if info and info.level then
            count = count + info.level
        end
    end

    local level = 0
    if currentAcupoint then
        level = currentAcupoint.level
    else
        level = 0
    end
    local maxLevel = cardRole.level + extraLianTiInfo.meridians
    local tab = {}
    tab.cur = count
    tab.max = maxLevel * 6
    tab.cur1 = tab.cur
    tab.max1 = tab.max
    tab.funcData = { roleGmId }

    --if isHuoqu then
        if level >= maxLevel then
            bCanHuoqu = false
        else
            bCanHuoqu = true
        end
    --end

    if level >= maxLevel then
        return false, tab, bCanHuoqu
    end
    local consumeConfigure = MeridianConsume:objectByID(level + 1)
    --local enough = MainPlayer:isEnough(consumeConfigure.type,consumeConfigure.cost)
    if consumeConfigure.type ~= EnumDropType.GENUINE_QI then
        return false, tab, bCanHuoqu
    end
    local enough = MainPlayer:isEnoughGenuineQi(consumeConfigure.cost, false)
    if enough then        
        return true, tab, bCanHuoqu
    end

    return false, tab, bCanHuoqu
end

-- MainPlayer:getVipLevel() < ConstantData:objectByID("yijianchongxue.VipLevel").value

--一键冲穴
function KaojiaoManager:onKeyChongxue(roleGmId)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)

    local extraLianTiInfo = cardRole:getExtraLianTiAttri()
    local acupointIndex = cardRole:getCurrentAcupointIndex()
    local currentAcupoint = cardRole:GetAcupointInfo(acupointIndex)
    local level = 0
    if currentAcupoint then
        level = currentAcupoint.level
    else
        level = 0
    end
    if level >= cardRole.level + extraLianTiInfo.meridians then
        --toastMessage("角色经脉等级不能超过角色等级")
        toastMessage(localizable.MeridianLayer_text1)
        return
    end
    local consumeConfigure = MeridianConsume:objectByID(level + 1)
    local enough = MainPlayer:isEnough(consumeConfigure.type,consumeConfigure.cost)
    if enough then
        --self.oldPower = cardRole:getPowerByFightType(self.fightType)
        --self.oldAcupoint = {index = acupointIndex,level = level}
        --if istop == true then
            CardRoleManager:upLevelAcupontToTop(cardRole.gmId)
            play_chongxue();
        --else
            --CardRoleManager:upLevelAcupont(cardRole.gmId,acupointIndex)
        --end
    end
end

--经脉突破
--全部满足时
--1.当前突破成功率1%
--2.精露足够突破一次除满级外最高的

function KaojiaoManager:checkJingmaiTupo(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local totalRate, cutDownTime = CardRoleManager:getBreachCutDownTime()
    local extraLianTiInfo = cardRole:getExtraLianTiAttri()
    local maxLev = math.floor( (cardRole.level + extraLianTiInfo.meridians) / 5 )
    local bCanHuoqu = true

    local count = 0
    local max = {}
    local bCan = false
    local countFull = 0
    for i = 1, 6 do
        for j = 1, 1 do
            local extraLianTiInfo = cardRole:getExtraLianTiAttri()
            local currInfo = cardRole:GetAcupointInfo(i) or {}
            local breachLevel = currInfo.breachLevel or 0
            local Level = currInfo.level or 0

            count = count + breachLevel

            local configure = MeridianConfigure:objectByID(cardRole.id)    
            local attKey = configure:getAttributeKey(i)
            local maxLevel = AcupointBreachData:getMaxLevelByLevel(attKey,Level)
            local nextInfo = AcupointBreachData:getData( attKey, breachLevel+1 )

            table.insert(max, maxLevel + extraLianTiInfo.breakthrough)

            if nextInfo then
                if breachLevel >= maxLev then
                    --print("111111:", breachLevel)
                    --print("222222:", maxLevel + extraLianTiInfo.breakthrough )
                    countFull = countFull + 1
                    break
                end
                local activity  = string.split(nextInfo.consume, '_')
                local goodsId = tonumber(activity[2])
                local goodsNum = tonumber(activity[3])
                local bagNum = MainPlayer:getVesselBreachValue()
                
                if bagNum >= goodsNum and breachLevel < maxLevel + extraLianTiInfo.breakthrough then
                    bCan = true
                end            
            end
        end 
    end

    --if isHuoqu then
        if countFull == 6 then
            bCanHuoqu = false
        else
            bCanHuoqu = true
        end
    --end

    table.sort(max, function(a, b)
        return a > b
    end)

    local tab = {}
    tab.cur = count
    tab.max = maxLev * 6
    tab.funcData = { roleGmId }
    tab.cur1 = count
    local temp = 0
    for i = 1, #max do
        temp = max[i] + temp
    end
    tab.max1 = maxLev * 6

    if math.floor(totalRate / 100) < 1 then
        return false, tab, bCanHuoqu
    end
    
    if bCan then
        return true, tab, bCanHuoqu
    end

    return false, tab, bCanHuoqu
end

--[[
if self.cardRole.quality >= 4 then
    local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(2205)
    if teamLev < openLev then
        self.btn_lianti:setVisible(false)
    else
        self.btn_lianti:setVisible(true)
    end
else
    self.btn_lianti:setVisible(false)
end
]]


--炼体
--有就提示
function KaojiaoManager:checkLianti(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true

    local bCan = false
    local countFull = 0
    if cardRole.quality > 3 then
        for i = 1, #cardRole.LianTiData do
            for j = 1, 1 do
                local pointData = cardRole:getLianTiDataById(i)
                if pointData and pointData.isOpen == true then
                    if pointData.level >= LianTiManager:getMaxPointLvl(i) then
                        countFull = countFull + 1
                        break
                    end
                end
                local level = pointData.level + 1
                local quality = cardRole.quality
                if cardRole:getIsMainPlayer() then
                    if quality <= QualityHeroType.ChuanShuo then
                        quality = QualityHeroType.ChuanShuo
                    end                    
                end
                local consumeList = LianTiData:getConsume(i, level, quality) or {}

                local temp = 0
                for s = 1, #consumeList do                
                    local item = consumeList[s]
                    local curr_num = 0
                    if item.type == 1 then
                        curr_num = BagManager:getItemNumById(item.id)
                    else
                        curr_num = MainPlayer:getResValueByType(item.type)                    
                    end
                    if curr_num >= item.num then
                        temp = temp + 1
                    end
                end
                if temp == #consumeList then
                    bCan = true
                end
            end
        end
    end
        

    local count = 0
    for i = 1, #cardRole.LianTiData do
        count = count + cardRole.LianTiData[i].level
    end

        if count == 60 * 5 then
            bCanHuoqu = false
        else
            bCanHuoqu = true
        end

    local tab_new = {}
    tab_new.cur = count
    tab_new.max = math.max(1, math.floor( (MainPlayer:getLevel() - 80) * 6 / 7 ) ) * 5
    tab_new.funcData = { roleGmId }
    tab_new.cur1 = count
    tab_new.max1 = 60 * 5
    if bCan and count ~= tab_new.max1 then
        return true, tab_new, bCanHuoqu
    end

    return false, tab_new, bCanHuoqu
end


--奇门遁
--只有主角才显示该条，其他侠客默认已完成
--满足其一
--1.可以注入
--2.可以突破
function KaojiaoManager:checkQimendun(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId) 
    local bCan1 = true
    local info = CardRoleManager:getQimenInfo() or {}
    local bCanHuoqu = true

    local bCanTupo = false
    --[[
    if CardRoleManager:checkCanBreach(info.idx, info.level) then
        bCan1 = false
    end    
    ]]
    info.idx = tonumber(info.idx)
    local newInfo = QimenConfigData:getObjectAt(info.idx+1) or {}
    if newInfo.climb_star and (newInfo.climb_star > MainPlayer:getClimbStarValue()) then
        bCan1 = false
    end

    if info.idx + 1 > QimenConfigData:length() then
        bCan1 = false
    end
    if CardRoleManager:checkCanBreach(info.idx, info.level) then
        bCan1 = false
        local info1 = QimenBreachConfigData:getInfoById(info.level + 1)
        if info1 then
            if info1.level <= MainPlayer:getLevel() and info1.climb_star <= MainPlayer:getClimbStarValue() then
                bCanTupo = true
            end
        end
    end   

    local bCan2 = true
    local config = QualityDevelopConfig:objectByID(cardRole.id)
    if config then
        local currLevel = info.level or 0
        local cost_material = GetAttrByString(config.items)
        local index = 1
        for k, v in pairs(cost_material) do
            local curr_num = BagManager:getItemNumById(k)
            if curr_num < v then
                bCan2 = false
            end
        end
    end

    local tab = {}
    --tab.cur = MainPlayer:getClimbStarValue()
    tab.cur = ClimbManager.climStarNum
    tab.max = tonumber(ClimbConfigure:back().id) * 3
    tab.cur1 = tab.cur
    tab.max1 = tab.max
    tab.funcData = { roleGmId }

    --if isHuoqu then
        if tab.cur < tab.max then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end
    --print("bCan1:", bCan1, bCan2, CardRoleManager:checkCanBreach(info.idx, info.level))

    if bCan1 or bCanTupo then       
        return true, tab, bCanHuoqu
    end
    --[[
    if CardRoleManager:checkCanBreach(info.idx, info.level) and bCan2 then
        return true, tab, bCanHuoqu
    end    
    ]]
    return false, tab, bCanHuoqu
end


--契合
--可提升就提示
function KaojiaoManager:checkQihe(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true

    local LocalIconData = {}
    local levelTbl = AssistFightManager:getQiheLevelInfo()
    for pos = 1, 6 do
        LocalIconData[pos] = {}
        local level = levelTbl[pos] or 0
        LocalIconData[pos].level = level
        if level == 0 then
            LocalIconData[pos].attrTbl = AgreeAttributeData:GetAttrTblIndex( 1, pos )
        else
            LocalIconData[pos].attrTbl = AgreeAttributeData:GetAttrTblIndex( level, pos )
        end
        LocalIconData[pos].currBuf = AgreeRuleData:GetPercentValue(level)
        LocalIconData[pos].nextBuf = AgreeRuleData:GetPercentValue(level+1)
        local goods = AgreeRuleData:GetDataInfo( level + 1 )
        if goods then
            LocalIconData[pos].item = goods:GetItemInfo()
        end

        local gridState = AssistFightManager:getGridList()
        LocalIconData[pos].LockState = gridState[pos]
    end

    local bCan = false
    local count = 0
    for i = 1, 6 do
        for j = 1, 1 do
            local data = LocalIconData[i]
            if data.LockState == false then
                break
            end
            count = count + data.level
            if data.level >= 5 then
                break
            end
            local temp = true
            for k,item in pairs(data.item) do
                local curr_num = BagManager:getItemNumById( item.id )
                if curr_num < item.num then
                    --bCan = true
                    temp = false
                end
            end
            if temp then
                bCan = true
            end
        end
    end

    local tab = {}
    tab.cur = count
    tab.max = math.floor( math.max( (MainPlayer:getLevel() - 50) * 3 / 7, 1) )
    tab.funcData = { roleGmId }
    tab.cur1 = tab.cur
    tab.max1 = tab.max

    --if isHuoqu then
        if tab.cur < 6 * 5 then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end

    if bCan then
        return true, tab, bCanHuoqu
    end

    return false, tab, bCanHuoqu
end

local function getQianxiuConsumeData()
    local consumeList = {}
    for i = 1, 3 do
        local itemdata = QianXiuConsumeData:objectByID(i)
        consumeList[i] = {}
        if itemdata and itemdata.consume then
            local tbl,len = stringToTable(itemdata.consume,'|')
            for j=1,len do
                local consumeData = stringToNumberTable(tbl[j], '_')
                local item = {}
                item.type = consumeData[1]
                item.id = consumeData[2]
                item.num = consumeData[3]
                consumeList[i][j] = item
            end
        end
    end
    return consumeList
end

local function getQianxiuCanTab()
    local consumeList = getQianxiuConsumeData()
    local canTab = {false, false, false}
    for i = 1, 3 do
        local consumeData = consumeList[i]
        local bCan = true
        for j=1,#consumeData do
            local holdNum = 0
            if consumeData[j].type == 1 then
                holdNum = BagManager:getItemNumById(consumeData[j].id)
            else
                holdNum = MainPlayer:getResValueByType(consumeData[j].type)
            end
            local curCount = math.floor(holdNum/consumeData[j].num)
            if curCount <= 0 then
                bCan = false
            end
        end
        canTab[i] = bCan
    end
    return canTab
end

function KaojiaoManager:checkQianxiu(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local canTab = getQianxiuCanTab()
    local canCount = 0
    local bCanHuoqu = false
    for i = 1, #canTab do
        if canTab[i] == true then
            canCount = canCount + 1
        end
    end
    local bFull = false
    local tabCur = {}
    local tabMax = {}
    local newTabMax = {}
    
    if cardRole.quality >= 4 then
        local fullCount = 0
        local roleQianXiuAttri = cardRole:getQianXiuAttriTable(1)
        local roleQXChangeAttri = cardRole:getQianXiuChangeAttriTable(1)
        local maxAttriTable = QianXiuAttributeData:getMaxAttriByLvl(cardRole.level, cardRole.quality, 1) or {}
        local newMaxAttriTable = QianXiuAttributeData:getMaxAttriByLvl(cardRole.level, 5, 1) or {}

        for i = 1, 5 do
            local maxAttri = maxAttriTable[i] or {}
            local maxAttriValue = maxAttri.value or 0
            local attriValue = roleQianXiuAttri[i] or 0
            local newMaxAttri = newMaxAttriTable[i] or {}
            local newMaxAttriValue = newMaxAttri.value or 0

            if i == 1 then
                attriValue = math.floor(attriValue / 5)
                maxAttriValue = math.floor(maxAttriValue / 5)
                newMaxAttriValue = math.floor(newMaxAttriValue / 5)
            end

            table.insert(tabCur, attriValue)
            table.insert(tabMax, maxAttriValue)
            table.insert(newTabMax, newMaxAttriValue)

            if attriValue >= maxAttriValue then
                fullCount = fullCount + 1
            end
        end
        if fullCount >= 5 then
            bFull = true
        end
    end

    local tab_new = {}
    tab_new.cur = 0
    for i = 1, #tabCur do
        tab_new.cur = tab_new.cur + tabCur[i]
    end
    tab_new.cur = math.floor(tab_new.cur)

    tab_new.max = 0
    for i = 1, #tabMax do
        tab_new.max = tab_new.max + tabMax[i]
    end
    tab_new.max = math.floor(tab_new.max)
    tab_new.funcData = { roleGmId }
    tab_new.max1 = 0
    for i = 1, #newTabMax do
        tab_new.max1 = tab_new.max1 + newTabMax[i]
    end
    tab_new.max1 = math.floor(tab_new.max1)
    tab_new.cur1 = tab_new.cur

    if not bFull then
        bCanHuoqu = true
    end

    if canCount > 0 then
        if cardRole and cardRole.quality >= 4 then
            return true, tab_new, bCanHuoqu
        else
            return false, tab_new, bCanHuoqu
        end
    else
        return false, tab_new, bCanHuoqu
    end
end

--更换装备
--全满足
--1.有更高品质的装备
--2.当前非缘分装备
-- role/RoleEquipInfoLayer
function KaojiaoManager:checkGenghuanZhuangbei(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId) 
    local bCanHuoqu = true

    local function hasHigherQualityEquip(type, equipInfo)
        --local equipList = EquipmentManager:GetEquipByTypeAndUsed(type, false)
        if equipInfo and equipInfo.quality == 5 then
            return false
        end

        local temp = equipInfo.quality
        for i = temp, 4 do
            local tab = EquipmentManager.qualityMap[i + 1][type]
            if tab and #tab ~= 0 then
                return true
            end
        end

        return false
        --[[
        for v in equipList:iterator() do
            if v.quality > equipInfo.quality then
                return true, v.gmId
            end
        end

        return false
        ]]
    end
    
    local count = 0
    local tab = {}
    local bEnough = false
    --local hasGenghuan = false
    for i = 1, 5 do
        for j = 1, 1 do
            local equipInfo = nil
            if cardRole then
                equipInfo = cardRole:getEquipment():GetEquipByType(i)
            end
            

            --TFLuaTime:begin()
            --print("=============111")
            --local equipList = EquipmentManager:GetEquipByTypeAndUsed(i, false)
            --hasHigherQualityEquip(i, equipInfo)
            --TFLuaTime:endToLua("==============")

            if not equipInfo then
                --if hasHigherQualityEquip(i, equipInfo)
                    --hasGenghuan 

                --EquipmentManager:isQualityMapEmpty() 
                              
                if not EquipmentManager:isQualityMapEmpty(i) then
                    table.insert(tab, {type = i})
                end
                
                break
            end
            
            count = count + equipInfo.quality
            
            local hasHigher, newGmId = hasHigherQualityEquip(i, equipInfo)
            --if equipInfo and (not cardRole:hasFate(2, equipInfo.id)) and hasHigher then
            if hasHigher then
                bEnough = true            
                table.insert(tab, {type = i})
            end
        end
    end

    local tab_new = {}
    tab_new.cur = count
    local level = math.floor(MainPlayer:getLevel() / 24) + 1
    --tab_new.max = math.min(5, level)
    tab_new.max = 25
    if tab[1] then
        tab_new.funcData = { roleGmId, tab[1].type }
    else
        tab_new.funcData = { roleGmId }
    end
    tab_new.cur1 = count
    tab_new.max1 = 25
    tab_new.info = clone(tab)

    --if isHuoqu then
        if count < 25 then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end

    --print("LLLLLLLLLL:", tab)
    --print("map::::::::", EquipmentManager.qualityMap)
    if #tab ~= 0 then       
        return true, tab_new, bCanHuoqu
    end

    return false, tab_new, bCanHuoqu
end

--更换缘分装备
--全满足
--1.当前非缘分装备
--2.可更换的缘分装备品质大于等于当前装备品质
function KaojiaoManager:checkGenghuanYuanfenZhuangbei(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId) 
    local bCanHuoqu = true

    local function hasHigherQualityEquip(type, equipInfo)
        --local equipList = EquipmentManager:GetEquipByTypeAndUsed(type, false)
        if equipInfo and equipInfo.quality == 5 then
            return false
        end
        local temp = equipInfo.quality
        for i = temp, 4 do
            local tab = EquipmentManager.qualityMap[i + 1][type]
            if tab and #tab ~= 0 then
                for j = 1, #tab do
                    if cardRole:hasFate(2, tab[j].id) then
                        return true
                    end
                end
            end
        end

        return false
        --[[
        for v in equipList:iterator() do
            if v.quality > equipInfo.quality then
                return true, v.gmId
            end
        end

        return false
        ]]
    end
    --[[
    local function hasHigherQualityEquip(type, equipInfo)
        if equipInfo and equipInfo.quality == 5 then
            return false
        end
        
        for v in equipList:iterator() do
            if v.quality >= equipInfo.quality and cardRole:hasFate(2, v.id) then
                return true
            end
        end
        
        return false
    end
    ]]

    for i = 1, 5 do
        for j = 1, 1 do
            local equipInfo = nil
            if cardRole then
                equipInfo = cardRole:getEquipment():GetEquipByType(i)
            else
                break
            end

            if equipInfo and (not cardRole:hasFate(2, equipInfo.id)) and hasHigherQualityEquip(i, equipInfo) then
                local tab = {}
                tab.cur = 1
                tab.max = 1
                tab.funcData = { roleGmId, i }
                return true, tab, bCanHuoqu
            elseif ( not equipInfo ) then
                local temp = {quality = 0}
                --print("???????????", hasHigherQualityEquip(i, temp))
                if hasHigherQualityEquip(i, temp) then
                    local tab = {}
                    tab.cur = 1
                    tab.max = 1
                    tab.funcData = { roleGmId, i }
                    return true, tab, bCanHuoqu
                end
            else
                break
            end
        end
    end

    return false, nil, bCanHuoqu
end


--装备强化
--有装备可以强化
function KaojiaoManager:checkEquipQianghua(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true 

    local enough = false
    local tab = {}
    local count = 0
    local countFull = 0
    for i = 1, 5 do
        for j = 1, 1 do        
            local equipInfo = nil
            if cardRole then
                equipInfo = cardRole:getEquipment():GetEquipByType(i)        
            end

            if not equipInfo then
                break
            end

            count = count + equipInfo.level
            if equipInfo.level >= MainPlayer:getMaxIntensifyLevel() then
                countFull = countFull + 1
                break
            end

            local coin = IntensifyData:getConsumeByIntensifyLevel(equipInfo.level + 1, equipInfo.quality)
            local bTemp = MainPlayer:isEnoughCoin(coin, false)

            if bTemp and equipInfo.level ~= MainPlayer:getMaxIntensifyLevel() then
                enough = true
                table.insert(tab, equipInfo.gmId)
            end
        end
    end

    --if isHuoqu then
        if countFull < 5 then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end

    local tab_new = {}
    tab_new.cur = count
    tab_new.max = MainPlayer:getMaxIntensifyLevel() * 5
    tab_new.funcData = {tab[1], 1}
    tab_new.cur1 = count
    tab_new.max1 = tab_new.max
    tab_new.info = clone( tab )

    if #tab == 0 then
        return false, tab_new, bCanHuoqu
    end

    if enough then
        return true, tab_new, bCanHuoqu
    end

    return false, tab_new, bCanHuoqu
end

--升星
--全满足
--1.有装备可升星
--2.5个升星石以上
function KaojiaoManager:checkEquipShengxing(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId) 
    local bCanHuoqu = true

    local itemList = BagManager:getItemByKind(EnumGameItemType.Stuff, 1)
    local num = 0
    for v in itemList:iterator() do
        num = num + v.num
    end

    local tab = {}
    local count = 0
    local countFull = 0
    for i = 1, 5 do
        for j = 1, 1 do
            local equipInfo = nil
            if cardRole then
                equipInfo = cardRole:getEquipment():GetEquipByType(i)
            else
                break
            end

            if not equipInfo then
                break
            end
            
            count = count + equipInfo.star
            if equipInfo.star < EquipmentManager.kMaxStarLevel then
                local temp = {gmId = equipInfo.gmId, star = equipInfo.star}
                table.insert(tab, temp)
            else
                countFull = countFull + 1
            end
        end
    end

    --if isHuoqu then
        if countFull < 5 then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end

    table.sort(tab, function(a, b)
        return a.star > b.star
    end)

    local level = math.floor(MainPlayer:getLevel() / 12)
    local max = math.min(10, level) * 5
    if #tab == 0 then
        return false, {cur = count, max = max, cur1 = count, max1 = 10 * 5}, bCanHuoqu
    end

    local tab_new = {}    
    tab_new.cur = count      
    tab_new.max = max  
    tab_new.funcData = { tab[1].gmId, 2 }
    tab_new.cur1 = count
    tab_new.max1 = 10 * 5

    if num >= 5 then
        return true, tab_new, bCanHuoqu
    end

    return false, tab_new, bCanHuoqu
end

--装备精炼等级突破
--足够突破
function KaojiaoManager:checkEquipTupo(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId) 
    local bCanHuoqu = true

    local tab = {}
    local tempCount = 0
    --local tempMax = 0
    for i = 1, 5 do
        for j = 1, 1 do
            local equip = cardRole:getEquipment():GetEquipByType(i)
            if not equip then
                break
            end

            if equip.quality <= 2 then
                break
            end

            local max_tupo_level = EquipRefineBreachData:length()
            local refineLevel   = equip.refineLevel

            tempCount = tempCount + equip.refineLevel

            if refineLevel < max_tupo_level then
                refineLevel = refineLevel + 1
            else
                break
            end

            local BreachData = EquipRefineBreachData:objectByID(refineLevel)
            if BreachData.level > equip.level then
                break
            end

            local tupInfo = EquipRefineBreachData:objectByID(refineLevel)
            if not tupInfo then
                break
            end

            local consumeList = string.split(tupInfo.consume, '|')
            for i = 1, #consumeList do
                if consumeList[i] and consumeList[i] ~= "" then
                    local consume = string.split(consumeList[i], '_')
                    local costType = tonumber(consume[1])
                    local itemId = tonumber(consume[2])
                    local number = tonumber(consume[3])

                    local numberInBag = 0
                    local bagItem = BagManager:getItemById(itemId)
                    if bagItem then
                        numberInBag = bagItem.num
                    end

                    local stoneNumber = numberInBag
                    local costNumber  = number
                    if costNumber > stoneNumber then
                        --MallManager:checkShopOneKey(self.itemTupoId)
                        break
                    else
                        local temp = {gmId = equip.gmId, refineLevel = equip.refineLevel}
                        table.insert(tab, temp)
                    end
                end
            end   
        end
    end

    table.sort(tab, function(a, b)
        return a.refineLevel > b.refineLevel
    end)
    
    local maxTupoLevel = math.floor(MainPlayer:getLevel() / 10)    

    --if isHuoqu then
        if tempCount < maxTupoLevel * 5 then
            bCanHuoqu = true
        else
            bCanHuoqu = false 
        end
    --end

    if #tab == 0 then
        return false, {cur = tempCount, max = maxTupoLevel * 5, cur1 = tempCount, max1 = maxTupoLevel * 5}, bCanHuoqu
    end

    local tab_new = {}
    tab_new.cur = tempCount
    tab_new.max = maxTupoLevel * 5
    tab_new.funcData = { tab[1].gmId, 4 }
    tab_new.cur1 = tempCount
    tab_new.max1 = maxTupoLevel * 5

    return true, tab_new, bCanHuoqu
end

--装备当前等级精炼
--全满足
--1.有精炼石
--2.未满

--smithy/EquipmentRefining
function KaojiaoManager:checkEquipJinglian(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true

    local tab = {}
    local refineCount = 0
    local tempCount = 0
    for i = 1, 5 do
        for j = 1, 1 do
            local equip = cardRole:getEquipment():GetEquipByType(i)
            if not equip then
                break
            end

            if equip.quality <= 2 then
                break
            end

            local consumeGoods = EquipmentManager:getRefinStone() or {}
            local holdGoods = EquipmentManager:getHoldRefinStone()
            if not holdGoods then
                break
            end
            local stoneNumber = holdGoods.num

            local refineLevel = equip.refineLevel
            refineCount = refineCount + refineLevel

            local attribute, indexTable = equip:getExtraAttribute():getAttribute()
            local equipmentTemplate = EquipmentTemplateData:objectByID(equip.id)
            local min_attribute , max_attribute = equipmentTemplate:getExtraAttribute(refineLevel)
            local allMax = true
            local attrSize = 0
            for k,v in pairs(attribute) do
                local curAttr = v
                attrSize = attrSize + 1
                local max = max_attribute[k]
                if not max then
                    allMax = false
                elseif curAttr < max and allMax then
                    allMax = false
                end
            end

            for k, v in pairs(indexTable) do                
                local curAttr = attribute[v] or 0
                local minAttr = min_attribute[v] or 0
                local attr = curAttr - minAttr
                local stepIdex, stepNum = equipmentTemplate:getExtraAttributeIndex(v, attr)
                tempCount = tempCount + stepIdex
            end

            if stoneNumber < 1 then                
                break
            end

            if allMax then
                break
            else
                local count = 0
                local idx = 0
                for k, v in pairs(indexTable) do                
                    local curAttr = attribute[v] or 0
                    local minAttr = min_attribute[v] or 0
                    local attr = curAttr - minAttr
                    local stepIdex, stepNum = equipmentTemplate:getExtraAttributeIndex(v, attr)
                    count = count + 1
                    idx = idx + stepIdex
                end
                if count == 0 then
                    break
                end
                local ave_level = idx / count
                local temp = {gmId = equip.gmId, refineLevel = ave_level}
                table.insert(tab, temp)
            end
        end
    end

    table.sort(tab, function(a, b)
        return a.refineLevel > b.refineLevel
    end)
    
    local tab_new = {}
    tab_new.cur = tempCount
    --tab_new.max = EquipRefineBreachData:length() * (5 * 3)
    tab_new.max = 260
    --if isHuoqu then
        if tempCount < tab_new.max then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end

    if #tab == 0 then
        return false, {cur = tempCount, max = tab_new.max, cur1 = tempCount, max1 = tab_new.max}, bCanHuoqu
    end

    tab_new.funcData = { tab[1].gmId, 4 }
    tab_new.cur1 = tempCount
    tab_new.max1 = tab_new.max

    return true, tab_new, bCanHuoqu
end


--装备重铸
--全满足
--1.装备可重铸
--2.有重铸石
--smithy/SmithyRecast
function KaojiaoManager:checkEquipChongzhu(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true

    local tab = {}
    local chongzhuCount = 0
    for i = 1, 5 do
        for j = 1, 1 do
            local equip = cardRole:getEquipment():GetEquipByType(i)
            if not equip then
                break
            end

            if equip.quality < 4 then
                break
            end

            local chongzhuLevel = 0
            local fullCount = 0
            for k = 1, 5 do
                if equip:isCanTouchByPos(k) then
                    local info = equip.recastInfo[k]
                    if info then                
                        local templete = EquipmentRecastData:getInfoByquality(info.quality)
                        local maxpercent = templete:getMaxPercent(k)
                        if info.ratio >= maxpercent then
                            fullCount = fullCount + 1
                        end
                        chongzhuLevel = chongzhuLevel + info.ratio / 100
                    end
                end
            end

            chongzhuCount = chongzhuCount + chongzhuLevel

            local nGoodsId = 0
            if equip.quality == 4 then
                nGoodsId = 30076
            elseif equip.quality == 5 then
                nGoodsId = 30077
            end

            local itemNum = BagManager:getItemNumById(nGoodsId)
            if itemNum == 0 then
                break
            end

            if fullCount == 5 then
                break
            end
            local ave_level = chongzhuLevel / 5
            local temp = {gmId = equip.gmId, ave_level = ave_level}
            table.insert(tab, temp)
        end
    end

    local totalMax = 60 * 5 * 5
    table.sort(tab, function(a, b)
        return a.ave_level > b.ave_level
    end)

    --if isHuoqu then
        if chongzhuCount < totalMax then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end

    local tCur = chongzhuCount
    local tMax = math.max(1, math.floor( (MainPlayer:getLevel() - 60) * 2 / 3 ) ) * 25
    local tab_new = {}
    tab_new.cur = tCur
    tab_new.max = tMax

    if #tab == 0 then
        return false, {cur = tCur, max = tMax, cur1 = chongzhuCount, max1 = totalMax}, bCanHuoqu
    end

    tab_new.funcData = { tab[1].gmId, 5 }
    tab_new.cur1 = chongzhuCount
    --tab_new.max1 = tab_new.max * 5
    tab_new.max1 = totalMax

    return true, tab_new, bCanHuoqu
end

local function getGemKind(gmId, pos)
    if not gmId then
        return
    end
    if not pos then
        pos = 1
    end
    local equip = EquipmentManager:getEquipByGmid(gmId)
    if equip then
        local gemPos = GemPosData:getConfigByTypeAndPos(equip.equipType, pos)
        if gemPos then
            return gemPos:getGemKind()
        end
    end

    return nil
end

--宝石镶嵌
--其一
--1.有空宝石孔、有可镶嵌宝石可镶嵌进去
--2.有比已镶嵌的宝石更高等级的同类型宝石可镶嵌
--smithy/SmithyGem

function KaojiaoManager:checkEquipXiangqianByEquipId(equipGmId,brush)
    if brush == true then
        self.gemExtInfo = nil
    end
    if equipGmId == nil then
        return false
    end
    local configure = FunctionOpenConfigure:objectByID(104)
    local teamLevel = MainPlayer:getLevel()
    if configure and configure.level > teamLevel then
        return false
    end
    local equip = EquipmentManager:getEquipByGmid(equipGmId)
    if not equip then
        return false
    end
    
    local num1 = equip:getTotalGemNum()
    local gemTab = {}
    local bHasBetter = false
    local xqinfo = {false,false}
    for t = 1, num1 do
        for s = 1, 1 do
            local gemKind = getGemKind(equip.gmId, t)
            if not gemKind then
                break
            end
            local gemId = equip:getGemPos(t)
            if gemId then
                if self.gemExtInfo == nil then
                    self.gemExtInfo = {}
                    local gemList = BagManager:getItemByType(EnumGameItemType.Gem)
                    for v in gemList:iterator() do
                        if self.gemExtInfo[v.kind] == nil then
                            self.gemExtInfo[v.kind] = {}
                        end
                        if self.gemExtInfo[v.kind][v.level] == nil then
                            self.gemExtInfo[v.kind][v.level]  = 0
                        end
                        self.gemExtInfo[v.kind][v.level] = self.gemExtInfo[v.kind][v.level] + 1
                    end
                end
                local item = ItemData:objectByID(gemId)
                if self.gemExtInfo[item.kind] then
                    for i=item.level+1,EquipmentManager.kGemMergeMaxLevel do
                        if self.gemExtInfo[item.kind][i] and self.gemExtInfo[item.kind][i] > 0 then
                            bHasBetter = true
                            xqinfo[t] = true
                            break
                        end
                    end
                end
            else
                local gemList = BagManager:getItemByKind(EnumGameItemType.Gem, gemKind)
                if gemList:length() > 0 then
                    bHasBetter = true
                    xqinfo[t] = true
                end
            end
        end            
    end
    return bHasBetter , xqinfo
end

function KaojiaoManager:checkEquipXiangqian(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true

    local tab = {}
    local gemLevelList = {}
    local levelCount = 0
    local num = 0
    local num1 = 0

    for i = 1, 5 do
        for j = 1, 1 do
            local equip = cardRole:getEquipment():GetEquipByType(i)
            if not equip then
                break
            end
            num1 = num1 + equip:getTotalGemNum()
            local gemTab = {}
            for t = 1, 2 do
                for s = 1, 1 do
                    local gemKind = getGemKind(equip.gmId, t)
                    local gemList = BagManager:getItemByKind(EnumGameItemType.Gem, gemKind)
                    --print("{{{{{{{ kind", gemKind)
                    if not gemKind then
                        break
                    end
                    --[[
                    if gemList:length() == 0 then
                        break
                    end
                    ]]
                    local gemId = equip:getGemPos(t)
                    --print("????gem id", gemId)

                    if gemId then
                        --print("1111")
                        local bHasBetter = false
                        local item = ItemData:objectByID(gemId)
                        table.insert(gemLevelList, item.level)
                        --local list = BagManager:getItemByKind(EnumGameItemType.Gem, item.kind)
                        for v in gemList:iterator() do
                            levelCount = levelCount + v.level
                            num = num + 1
                            if v.kind == item.kind and v.level > item.level then
                                bHasBetter = true
                            end
                        end
                        if bHasBetter then
                            local temp = {type = 2, gmId = equip.gmId}
                            table.insert(gemTab, temp)
                        end
                    
                    else
                        if equip:getTotalGemNum() <= 1 then
                            --print("22222")
                            if t == 1 then
                                if gemList:length() > 0 then
                                    local temp = {type = 1, gmId = equip.gmId}
                                    table.insert(gemTab, temp)
                                end
                            end
                        end
                    end
                end            
            end

            if #gemTab == 0 then
                break
            else
                table.insert(tab, gemTab)
            end
        end
    end

    local tCur = 0
    for i = 1, #gemLevelList do
        tCur = tCur + gemLevelList[i]
    end

    --if isHuoqu then
        --if tCur < math.floor( (MainPlayer:getLevel() - 40) / 20 + 4 ) then
        if tCur < MainPlayer:getLevel() then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end

    --print("{{{PPPPPP:", tab)

    if #tab == 0 then
        return false, {cur = tCur, max = MainPlayer:getLevel(), cur1 = levelCount, max1 = 120}, bCanHuoqu
    end

    local tab_new = {}   
    tab_new.cur = tCur
    --tab_new.max = math.floor( (MainPlayer:getLevel() - 40) / 20 + 4 )
    tab_new.max = MainPlayer:getLevel()
    tab_new.funcData = { tab[1][1].gmId, 6 }  
    tab_new.cur1 = tab_new.cur
    tab_new.max1 = 120

    if #tab ~= 0 then      
        return true, tab_new, bCanHuoqu
    end

    return false, tab_new, bCanHuoqu
end

--装备升阶
function KaojiaoManager:checkEquipShengjie(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true
    
    local fumoLev = 0
    local tab = {}
    for i = 1, 5 do
        for j = 1, 1 do
            local equip = cardRole:getEquipment():GetEquipByType(i)
            if not equip then
                break
            end 
            if equip.quality < 4 then
                break
            end

            local function isEnoughBreach(breachLev)
                local item = EquipmentSpecialAttribData:getConsumesByQualityLevel(i, equip.quality, breachLev + 1)
                local curr_num = BagManager:getItemNumById( item.id )
                if item.num and curr_num >= item.num then
                    return true
                end
                return false
            end

            local breachLevel = equip:getorderBreachLevel()
            local orderLevel = equip:getOrderLevel()
            local integerLevel = math.modf(orderLevel / 10)
            local modLevel = math.mod(orderLevel, 10)
            local canBreach = true
            local canTupo = false
            fumoLev = fumoLev + orderLevel + breachLevel
            if equip.star == 10 then 
                canBreach = false
            else
                local detailInfo = EquipmentSpecialAttribData:getDetailsByQualityLevel(i, equip.quality, breachLevel + 1)
                if equip.star < detailInfo.equip_star_limit then
                    canBreach = false
                end
            end
            if canBreach == true then
                if orderLevel > 0 and (modLevel == 0 and integerLevel ~= breachLevel) then
                    if isEnoughBreach(breachLevel) then
                        canTupo = true
                    end
                end
            end

            local canFumo = false
            if modLevel ~= 0 then
                local level = orderLevel
                local quality = equip.quality
                local currExp = equip:getCurrExp()
                local maxExp = EquipmentThroughExpData:getExpByQualityLevel(quality, level+1)
                local toolList = EquipmentThroughExpData:getToolListByQualityLevel(quality, level+1)
                local needExp = maxExp - currExp
                local msg = nil
                local expCount = 0
                for i = 1, 3 do
                    if toolList[i] then
                        local goodsId = tonumber(toolList[i])
                        local bagNumber = BagManager:getItemNumById( goodsId )
                        local itemData = ItemData:objectByID(goodsId)   
                        local needNumber = math.ceil(needExp/itemData.provide_exp)

                        expCount = expCount + itemData.provide_exp * bagNumber
                        if expCount >= needExp then
                            canFumo = true
                        end
                    end
                end
            end

            if canTupo or canFumo then
                local temp = {equip.gmId, 6}
                table.insert(tab, temp)
            end
        end   
    end

    local bCanHuoqu = true
    local fumoMax = 110 * 5
    local tab_new = {}
    if fumoLev >= fumoMax then
        bCanHuoqu = false
    end

    if #tab == 0 then
        return false, {cur = fumoLev, max = fumoMax, cur1 = fumoLev, max1 = fumoMax}, bCanHuoqu
    end

    local tab_new = {}   
    tab_new.cur = fumoLev
    tab_new.max = fumoMax
    tab_new.funcData = tab[1]
    tab_new.cur1 = fumoLev
    tab_new.max1 = fumoMax

    if #tab ~= 0 then      
        return true, tab_new, bCanHuoqu
    end

    return false, tab_new, bCanHuoqu
end

--更换天书
--天书位为空，有天书可装配
--role_new/RoleInfoLayer
function KaojiaoManager:checkGenghuanTianshu(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bible = cardRole:getSkyBook()
    local countBible = 0
    if bible and bible.quality == 5 then
        countBible = 1
    end

    local bible = cardRole:getSkyBook()
    if not bible then
        local isHaveSkyBook = false
        local bookList = SkyBookManager:getAllUnEquippedBook()
        if bookList and bookList:length() > 0 then
            isHaveSkyBook = true
        end
        if isHaveSkyBook then
            local tab = {}
            tab.cur = countBible
            tab.max = 1
            tab.funcData = { roleGmId }

            return true, tab
        else
            return false
        end
    else
        return false
    end
end

--更换天书2
--有更高品质的未装配天书可装配
function KaojiaoManager:checkGenghuanTianshu2(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true

    local bible = cardRole:getSkyBook()
    local countBible = 0
    if bible then
        countBible = bible.quality
    end

    --if isHuoqu then
        if countBible < 5 then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end

    local bookList = SkyBookManager:getAllUnEquippedBook()
    local count1 = 0
    if bookList and bookList:length() > 0 then          
        for v in bookList:iterator() do
            if v.quality == 5 then
                count1 = count1 + 1
            end
        end
    end

    if (not bible) and (bookList:length() > 0) then
        return true, {cur = 0, max = 5, cur1 = 0, max1 = 5, funcData = { roleGmId }}, bCanHuoqu
    end

    if bible then
        local isHaveSkyBook = false
        local isHaveBetter = false
        local count = 0
        if bookList and bookList:length() > 0 then
            isHaveSkyBook = true            
            for v in bookList:iterator() do
                if v.quality > bible.quality then
                    isHaveBetter = true
                end
                count = count + v.quality
            end
        end
        --if isHaveSkyBook and isHaveBetter then
        if isHaveBetter then
            local tab = {}
            tab.cur = countBible
            tab.max = 5
            tab.funcData = { roleGmId }
            tab.cur1 = countBible
            tab.max1 = 5

            return true, tab, bCanHuoqu
        else
            return false, {cur = countBible, max = 5, cur1 = countBible, max1 = 5, funcData = { roleGmId }}, bCanHuoqu
        end
    else
        return false, {cur = countBible, max = 5, cur1 = countBible, max1 = 5, funcData = { roleGmId }}, bCanHuoqu
    end
end

local EnumJingyaoStatus = 
{
    --未装备且精要以及碎片都不够
    STATUS_NOT_ENOUGH = 1,
    --未装备且精要不够但精要碎片够
    STATUS_PIECE_ENOUGH = 2,
    --未装备且精要够
    STATUS_JINGYAO_ENOUGH = 3,
    --已融入
    STATUS_EQUIPPED = 4
}

--获得单个精要孔状态
local function getOneJingyaoStatus(bible, index)
    local status = EnumJingyaoStatus.STATUS_NOT_ENOUGH
    local idTable = bible:getJingyaoIdTable()
    --精要id
    local id = idTable[index]
    --已融入
    if bible:getStonePos(index) and bible:getStonePos(index) > 0 then
        return EnumJingyaoStatus.STATUS_EQUIPPED
    end
    --包里的精要
    local bagItem = BagManager:getItemById(tonumber(id))
    if bagItem and bagItem.num > 0 then
        --包里的精要足够
        return EnumJingyaoStatus.STATUS_JINGYAO_ENOUGH
    end

    if SkyBookManager:isJingyaoCanHecheng(tonumber(id)) then
        --包里精要碎片足够
        return EnumJingyaoStatus.STATUS_PIECE_ENOUGH
    end
    return status
end

local function getMosaicCost(bible, index)
    local costCoin = 0
    local costGoodsId = nil
    local costGoodsNum = 0
    local str = bible.bibleConfig.mosaic
    local tab = string.split(str, "|")
    local curStr = tab[index]
    local curTab = string.split(curStr, ",")
    for i = 1, #curTab do
        local tab1 = string.split(curTab[i], "_") 
        if tonumber(tab1[1]) == EnumDropType.COIN then
            costCoin = costCoin + tonumber(tab1[3])
        elseif tonumber(tab1[1]) == EnumDropType.YUELI then
            costGoodsNum = costGoodsNum + tonumber(tab1[3])
        end
    end

    return costCoin, costGoodsNum
end

--镶嵌精要
--其一
--1.有精要可镶嵌
--2.精要可合成并镶嵌

--当前已镶嵌精要数 / 当前精要孔总数
function KaojiaoManager:checkXiangqianJingyao(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bCanHuoqu = true

    local bible = cardRole:getSkyBook()

    if not bible then
        --if isHuoqu then
            bCanHuoqu = true
        --end
        return false, {cur = 0, max = SkyBookManager:getMaxHoleNum(), cur1 = 0, max1 = SkyBookManager:getMaxHoleNum()}, bCanHuoqu
    end

    local jingyaoStatus = {}
    local bFind = false
    local count = 0
    for i = 1, bible.maxStoneNum do
        local status = getOneJingyaoStatus(bible, i)

        if status == EnumJingyaoStatus.STATUS_JINGYAO_ENOUGH or status == EnumJingyaoStatus.STATUS_PIECE_ENOUGH then
            bFind = true
        elseif status == EnumJingyaoStatus.STATUS_EQUIPPED then
            count = count + 1
        end

        local costCoin, costGoodsNum = getMosaicCost(bible, i)
        if MainPlayer:getCoin() < costCoin then
            bFind = false
        end
        --local enough = MainPlayer:isEnough(EnumDropType.YUELI, costGoodsNum)
        local enough = MainPlayer:isEnoughYueLi(costGoodsNum, false)
        if enough == false then
            bFind = false
        end
    end

    --if isHuoqu then
        if count < bible.maxStoneNum then
            bCanHuoqu = true
        else
            bCanHuoqu = false
        end
    --end

    local tab = {}
    tab.cur = count
    tab.max = bible.maxStoneNum
    tab.funcData = {bible.instanceId}
    tab.cur1 = count
    tab.max1 = SkyBookManager:getMaxHoleNum()

    if bFind then
        return true, tab, bCanHuoqu
    end

    return false, tab, bCanHuoqu
end

local function isTupoMaterialEnough(bible)
    local curPieceNum = SkyBookManager:getBiblePieceNumByQuality(bible.quality)
    local needPieceNum, tab_tupofu = SkyBookManager:getTupoNeedPieceNumByInstance(bible)

    if curPieceNum < needPieceNum then
        return false
    end

    if tab_tupofu and tab_tupofu.num then
        local item = ItemData:objectByID(tonumber(tab_tupofu.id))
        local curNum = BagManager:getItemNumById(tonumber(tab_tupofu.id))
        local needNum = tab_tupofu.num

        if curNum < needNum then
            return false
        end        
    end

    return true
end

--天书突破
--可突破就提示
function KaojiaoManager:checkTianshuTupo(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bible = cardRole:getSkyBook()
    local bCanHuoqu = true

    --if isHuoqu then
        if not bible then
            bCanHuoqu = true
        else
            if bible:getTupoLevel() < SkyBookManager.kMaxStarLevel then
                bCanHuoqu = true
            else
                bCanHuoqu = false
            end
        end
        
    --end

    if not bible then
        return false, {cur = 0, max = SkyBookManager.kMaxStarLevel, cur1 = 0, max1 = SkyBookManager.kMaxStarLevel}, bCanHuoqu
    end

    local curPieceNum = SkyBookManager:getBiblePieceNumByQuality(bible.quality)
    local needPieceNum = SkyBookManager:getTupoNeedPieceNumByInstance(bible)
    local percent = (curPieceNum / needPieceNum) * 100

    local tab = {}
    tab.cur = bible:getTupoLevel()
    tab.max = SkyBookManager.kMaxStarLevel
    tab.funcData = {bible.instanceId}
    tab.cur1 = bible:getTupoLevel()
    tab.max1 = SkyBookManager.kMaxStarLevel

    if percent >= 100 and SkyBookManager:isInTupoMaxLevel(bible) == false and isTupoMaterialEnough(bible) then
        return true, tab, bCanHuoqu
    end

    return false, tab, bCanHuoqu
end

local function isCanShengchong(bible)
    local bCanShengchong = true
    for i = 1, bible.maxStoneNum do
        if (not bible:getStonePos(i)) or bible:getStonePos(i) <= 0 then
            bCanShengchong = false
        end       
    end

    local maxLevel = SkyBookManager:getMaxLevelByQuality(bible.quality)
    if bible.level >= maxLevel then
        return false
    end

    local costCoin = 0
    local costGoodsId = nil
    local costGoodsNum = 0
    local str = bible.bibleConfig.comsume
    local tab = string.split(str, ",")
    for i = 1, #tab do
        local tab1 = string.split(tab[i], "_")
        if tonumber(tab1[1]) == EnumDropType.COIN then
            costCoin = costCoin + tonumber(tab1[3])
        elseif tonumber(tab1[1]) == EnumDropType.GOODS then
            costGoodsId = tonumber(tab1[2])
            costGoodsNum = costGoodsNum + tonumber(tab1[3])
        end
    end

    if MainPlayer:getCoin() < costCoin then
        return false
    end

    if costGoodsId then
        local goods =  BagManager:getItemById(tonumber(costGoodsId))
        local item = ItemData:objectByID(costGoodsId)
        if not goods then
            return false
        end

        if goods.num < tonumber(costGoodsNum) then
            return false
        end
    end

    return bCanShengchong
end

--天书升重
--可升重就提示

----返回当前重数和当前重数上限
function KaojiaoManager:checkTianshuShengchong(roleGmId, isHuoqu)
    local cardRole = CardRoleManager:getRoleByGmid(roleGmId)
    local bible = cardRole:getSkyBook()
    local bCanHuoqu = true
    --if isHuoqu then
        if not bible then
            bCanHuoqu = true
        else
            if tonumber(bible.level) < SkyBookManager:getMaxLevelByQuality(bible.quality) then
                bCanHuoqu = true
            else
                bCanHuoqu = false
            end
        end
        --print("bible.level:", bible.level)
        --print("SkyBookManager:getMaxLevelByQuality(bible.quality):", SkyBookManager:getMaxLevelByQuality(bible.quality))
        
    --end

    if not bible then
        return false, {cur = 0, max = SkyBookManager:getMaxLevelByQuality(5), cur1 = 1, max1 = SkyBookManager:getMaxLevelByQuality(5)}, bCanHuoqu
    end

    local tab = {}
    tab.cur = bible.level
    tab.max = SkyBookManager:getMaxLevelByQuality(bible.quality)
    tab.funcData = {bible.instanceId}
    tab.cur1 = bible.level
    tab.max1 = SkyBookManager:getMaxLevelByQuality(5)

    if isCanShengchong(bible) then
        return true, tab, bCanHuoqu
    end

    return false, tab, bCanHuoqu
end

local tempStrategy1 = 
{
    [1] = EnumFightStrategyType.StrategyType_PVE,   
}

local tempStrategy2 = 
{
    [1] = EnumFightStrategyType.StrategyType_DOUBLE_1,
    [2] = EnumFightStrategyType.StrategyType_DOUBLE_2,
}

--宠物
function KaojiaoManager:checkEudemonQuality(roleGmId, isHuoqu, zhenrongType)
    local tempStrategy = {}
    if zhenrongType == 1 then
        tempStrategy = tempStrategy1
    else
        tempStrategy = tempStrategy2
    end
    local strategyType = tempStrategy[1] 
    for i = 1, #tempStrategy do
        local index = ZhengbaManager:getIndexByRole(tempStrategy[i], roleGmId )
        if index and index ~= 0 then
            strategyType = tempStrategy[i]
        end
    end

    local intensifyLevel = 0
    local canIntensify = false --有更屌的
    local eudemonInfo = EudemonManager:getEudemonInfoByFightId(strategyType)
    local eudemonList = EudemonManager:getEudemonList()
    local gmId = 0
    if eudemonInfo then
        gmId = eudemonInfo:getId()
        intensifyLevel = eudemonInfo:getQuality()
        EudemonManager:sortLevelList(eudemonList)
        local firstInfo = eudemonList:getObjectAt(1)
        if (firstInfo) then
            if (firstInfo:getId() ~= gmId and firstInfo:getQuality() > eudemonInfo:getQuality()) then
                canIntensify = true
            end
        end
    elseif (eudemonList:length() >= 1) then
        canIntensify = true
    end
    --
    local bCanHuoqu = true
    local maxLv = EudemonManager.MAX_QUALITY
    if intensifyLevel >= maxLv then
        bCanHuoqu = false
    end

    local tab = {}
    tab.cur = intensifyLevel
    tab.max = maxLv
    if canIntensify then
        tab.funcData = {gmId}
    else
        tab.funcData = {}
    end
    tab.cur1 = intensifyLevel
    tab.max1 = maxLv
    if canIntensify then
        return true, tab, bCanHuoqu
    end
    return false, tab, bCanHuoqu
end

--宠物突破
function KaojiaoManager:checkEudemonTupo(roleGmId, isHuoqu, zhenrongType)
    local tempStrategy = {}
    if zhenrongType == 1 then
        tempStrategy = tempStrategy1
    else
        tempStrategy = tempStrategy2
    end

    local strategyType = tempStrategy[1] 
    for i = 1, #tempStrategy do
        local index = ZhengbaManager:getIndexByRole(tempStrategy[i], roleGmId)
        if index and index ~= 0 then
            strategyType = tempStrategy[i]
        end
    end

    local intensifyLevel = 0
    local canIntensify = false --有更屌的
    local eudemonInfo = EudemonManager:getEudemonInfoByFightId(strategyType)
    local eudemonList = EudemonManager:getEudemonList()
    local gmId = nil
    if eudemonInfo then
        gmId = eudemonInfo:getId()
        local star1 = (eudemonInfo:getQuality() - 1) * (EudemonManager.MAX_LEVEL + 1)
        intensifyLevel = star1 + (eudemonInfo:getStarLevel() + 1)
        if (EudemonManager:isShowEudemonRedPoint(eudemonInfo:getId())) then
            canIntensify = true
        end
    elseif (eudemonList:length() >= 1) then
        canIntensify = true
    end
    --
    local bCanHuoqu = true
    local maxLv = EudemonManager.MAX_QUALITY * (EudemonManager.MAX_LEVEL + 1)
    if intensifyLevel >= maxLv then
        bCanHuoqu = false
    end

    local tab = {}
    tab.cur = intensifyLevel
    tab.max = maxLv
    if canIntensify then
        tab.funcData = {gmId}
    else
        tab.funcData = {}
    end
    tab.cur1 = intensifyLevel
    tab.max1 = maxLv
    if canIntensify then
        return true, tab, bCanHuoqu
    end
    return false, tab, bCanHuoqu
end
--宠物训练师
function KaojiaoManager:checkEudemonTrain(roleGmId, isHuoqu, zhenrongType)
    local tempStrategy = {}
    if zhenrongType == 1 then
        tempStrategy = tempStrategy1
    else
        tempStrategy = tempStrategy2
    end

    local strategyType = tempStrategy[1] 
    for i = 1, #tempStrategy do
        local index = ZhengbaManager:getIndexByRole(tempStrategy[i], roleGmId)
        if index and index ~= 0 then
            strategyType = tempStrategy[i]
        end
    end

    local intensifyLevel = 0
    local canIntensify = false --有更屌的
    local eudemonInfo = EudemonManager:getEudemonInfoByFightId(strategyType)
    local eudemonList = EudemonManager:getEudemonList()
    local gmId = nil
    if eudemonInfo then
        gmId = eudemonInfo:getId()
        local trainRoleId = eudemonInfo:getTrainingRoleId()
        local cardRole = CardRoleManager:getRoleByGmid(trainRoleId)
        if (cardRole) then
            intensifyLevel = cardRole.quality
        end
    elseif (eudemonList:length() >= 1) then
        canIntensify = true
    end
    --
    local bCanHuoqu = true
    local maxLv = 6
    if intensifyLevel >= maxLv then
        bCanHuoqu = false
    end

    local tab = {}
    tab.cur = intensifyLevel
    tab.max = maxLv
    if canIntensify then
        tab.funcData = {gmId}
    else
        tab.funcData = {}
    end
    tab.cur1 = intensifyLevel
    tab.max1 = maxLv
    if canIntensify then
        return true, tab, bCanHuoqu
    end
    return false, tab, bCanHuoqu
end
function KaojiaoManager:checkZhenfaQianghua(roleGmId, isHuoqu, zhenrongType)
    local tempStrategy = {}
    if zhenrongType == 1 then
        tempStrategy = tempStrategy1
    else
        tempStrategy = tempStrategy2
    end
    local strategyType = tempStrategy[1] 
    for i = 1, #tempStrategy do
        local index = ZhengbaManager:getIndexByRole(tempStrategy[i], roleGmId )
        if index and index ~= 0 then
            strategyType = tempStrategy[i]
        end
    end

    local intensifyLevel = 0
    local canIntensify = false
    local card = StrategyCardManager:getStrategyCardByStrategyType(strategyType)

    if card then
        local level = card:getLevel()
        intensifyLevel = intensifyLevel + level
        if card:canInstenify() then
            canIntensify = true
        end
    end

    local bCanHuoqu = true
    local maxLv = ConstantData:objectByID("BattleArrayMaxLevel").value or 150 
    if intensifyLevel >= maxLv then
        bCanHuoqu = false
    end

    local tab = {}
    tab.cur = intensifyLevel
    tab.max = maxLv
    if canIntensify then
        tab.funcData = {card.gmId}
    else
        tab.funcData = {}
    end
    tab.cur1 = intensifyLevel
    tab.max1 = maxLv
    if canIntensify then
        return true, tab, bCanHuoqu
    end
    return false, tab, bCanHuoqu
end

function KaojiaoManager:checkZhenfaTupo(roleGmId, isHuoqu, zhenrongType)
    local tempStrategy = {}
    if zhenrongType == 1 then
        tempStrategy = tempStrategy1
    else
        tempStrategy = tempStrategy2
    end

    local strategyType = tempStrategy[1] 
    for i = 1, #tempStrategy do
        local index = ZhengbaManager:getIndexByRole(tempStrategy[i], roleGmId)
        if index and index ~= 0 then
            strategyType = tempStrategy[i]
        end
    end

    local starLevel = 0
    local canTab = {}
    local card = StrategyCardManager:getStrategyCardByStrategyType(strategyType)
    
    if card then
        local level = card:getStarLevel()
        starLevel = starLevel + level
        if card:canStarUp() then
            table.insert(canTab, card.gmId)
        end
    end

    local bCanHuoqu = true
    local maxStar = 5
    if starLevel >= maxStar then
        bCanHuoqu = false
    end

    local tab = {}
    tab.cur = starLevel
    tab.max = maxStar
    tab.funcData = {canTab[1]}
    tab.cur1 = starLevel
    tab.max1 = maxStar
    if #canTab > 0 then
        return true, tab, bCanHuoqu
    end
    return false, tab, bCanHuoqu
end

function KaojiaoManager:checkZhenfaEquip(roleGmId, isHuoqu, zhenrongType)
    local tempStrategy = {}
    if zhenrongType == 1 then
        tempStrategy = tempStrategy1
    else
        tempStrategy = tempStrategy2
    end
    local strategyType = tempStrategy[1] 
    for i = 1, #tempStrategy do
        local index = ZhengbaManager:getIndexByRole(tempStrategy[i], roleGmId)
        if index and index ~= 0 then
            strategyType = tempStrategy[i]
        end
    end

    local quality = 0
    local gmId = -1
    local hasBetter = false
    local canTab = {}
    local card = StrategyCardManager:getStrategyCardByStrategyType(strategyType)
    if card then
        quality = card:getQuality()
        gmId = card.gmId
    end

    local cardList = StrategyCardManager:getCardList(1, strategyType)
    for v in cardList:iterator() do
        if v:getQuality() > quality and v.equip and #(v.equip) == 0 and v.gmId ~= gmId then
            table.insert(canTab, v)
        end
    end
    table.sort(canTab, function(a, b)
        return a:getQuality() > b:getQuality()
    end)

    local bCanHuoqu = true
    if quality >= 5 then
        bCanHuoqu = false
    end

    local tab = {}
    tab.cur = quality
    tab.max = 5
    if canTab[1] then
        tab.funcData = {canTab[1].gmId}
    else
        tab.funcData = {}
    end
    
    tab.cur1 = quality
    tab.max1 = 5

    if #canTab > 0 then
        return true, tab, bCanHuoqu
    end
    return false, tab, bCanHuoqu
end

function KaojiaoManager.goTianshuShengchong(data)
    if (not data) or (not data[1]) then
        return
    end
    SkyBookManager:openTianshuMainLayer(data[1])
end

function KaojiaoManager.goTianshuTupo(data)
    if (not data) or (not data[1]) then
        return
    end
    SkyBookManager:openTianshuMainLayer(data[1])
    local layer =  AlertManager:addLayerByFile("lua.logic.tianshu.TianshuTupoLayer", AlertManager.BLOCK_AND_GRAY)
    layer:loadData(data[1])
    AlertManager:show()
end

function KaojiaoManager.goGenghuanZhuangbei(data, fightType)
    --local fightType = EnumFightStrategyType.StrategyType_PVE
    local roleList = ZhengbaManager:getSortStrategy(fightType)
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.RoleInfoLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    local cardRole = CardRoleManager:getRoleByGmid(data[1]);
    local selectIndex = roleList:indexOf(cardRole.id);
    layer:loadSelfData(selectIndex,fightType,roleList);
    AlertManager:show();

    if data[2] then
        --layer:showEquipListLayer(data[2])
        layer.onEquipIconClickHandle(layer.img_equipQualityList[data[2]])
    end
end

function KaojiaoManager.goGenghuanTianshu(data, fightType)
    --CardRoleManager:openRoleInfo(data[1])
    local roleList = ZhengbaManager:getSortStrategy(fightType)
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.RoleInfoLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    local cardRole = CardRoleManager:getRoleByGmid(data[1]);
    local selectIndex = roleList:indexOf(cardRole.id);
    layer:loadSelfData(selectIndex,fightType,roleList);
    AlertManager:show();

    layer.onEquipIconClickHandle(layer.panel_tianshu.img_quality)
end

function KaojiaoManager.goEquipXiangqian(data ,fightType, roleGmId)
    local equip = nil
    --print("********data:", data)
    if data[1] then
        --EquipmentManager:openSmithyLayer(data[1], nil, nil, false) 
        equip = EquipmentManager:getEquipByGmid(data[1])
        local equipType = equip.type
        local equipList = nil
        if equip.equip ~= 0 then
            local role = CardRoleManager:getRoleById(equip.equip)
            equipList = role.equipment:allAsArray()
        else
            equipList = EquipmentManager:GetAllEquipInWarSideFirst(equipType)
        end

        local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.smithy.SmithyBaseLayer");
        layer:loadData(data[1],equipList,equipType)
        AlertManager:show();

        layer.tabButtonClickHandle(layer.btn_tab[ data[2] ])
    else
        --EquipmentManager:OpenSmithyMainLaye()
        CardRoleManager:openRoleInfoByFightType(roleGmId, fightType)
    end
end

function KaojiaoManager.goRole(data, fightType, roleGmId)
    CardRoleManager:openRoleInfoByFightType(roleGmId, fightType)
end

function KaojiaoManager.goRoleDengji(data, fightType)
    CardRoleManager:openRoleInfoByFightType(data[1], fightType)
    local roleList = ZhengbaManager:getSortStrategy(fightType)
    local openLevel = FunctionOpenConfigure:getOpenLevel(204)
    local teamLev = MainPlayer:getLevel()
    if openLevel > teamLev then    
        return
    end
    CardRoleManager:openRoleTransferLayerNew(data[1], roleList, fightType)
end

function KaojiaoManager.goRoleTupo(data, fightType)   
    local function func()
        local layer =  AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.RoleStarUpPreviewLayer");
        layer:SetData(data[1])
        AlertManager:show()
    end
    --CardRoleManager:openRoleInfoByFightType(data[1], fightType, func)
    --[[
    local roleList = ZhengbaManager:getSortStrategy(fightType)
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.RoleInfoLayer",AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1);
    local cardRole = CardRoleManager:getRoleByGmid(data[1]);
    local selectIndex = roleList:indexOf(cardRole.id);
    layer:loadSelfData(selectIndex,fightType,roleList);
    AlertManager:show();
    layer.BtnClickHandle(layer.btn_sx)
    ]]
    func()
end

function KaojiaoManager.goRoleJineng(data, fightType)
    CardRoleManager:openRoleInfoByFightType(data[1], fightType)

    local roleList = ZhengbaManager:getSortStrategy(fightType)
    local layer = AlertManager:addLayerToQueueAndCacheByFile("lua.logic.role_new.RoleInfoLayer");
    local cardRole = CardRoleManager:getRoleByGmid(data[1]);
    local selectIndex = roleList:indexOf(cardRole.id);
    layer:loadSelfData(selectIndex,fightType,roleList);
    AlertManager:show();


    layer:showListLayer(1, 1, false)
    local temp = layer.LayerList[1].layer
    temp.onSkillClickHandle(temp.btn_skill)
end

function KaojiaoManager.goJingmaiChongxue(data, fightType)
    CardRoleManager:openTrainLayerNew(data[1], ZhengbaManager:getSortStrategy(fightType), fightType)
end

function KaojiaoManager.goJingmaiTupo(data, fightType)
    CardRoleManager:openTrainLayerNew(data[1], ZhengbaManager:getSortStrategy(fightType), fightType)
    CardRoleManager:openTrainLayerBreakLayer(data[1])
end

function KaojiaoManager.goLianti(data, fightType)
    CardRoleManager:openTrainLayerNew(data[1], ZhengbaManager:getSortStrategy(fightType), fightType)
    local cardRole = CardRoleManager:getRoleByGmid(data[1])
    local layer = require("lua.logic.role_new.RoleLianTiLayer"):new(cardRole.id)
    AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:show()
end

function KaojiaoManager.goQimendun(data)
    CardRoleManager:openMainRoleStarUpLayer()
end

function KaojiaoManager.goQihe(data, fightType)
    local layer = AlertManager:addLayerByFile("lua.logic.assistFight.AssistAgreeLayer", AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_NONE)
    layer:loadData(fightType)
    AlertManager:show()
end

function KaojiaoManager.goQianxiu(data, fightType)
    QianXiuManager:openQianXiuLayer(data[1], ZhengbaManager:getSortStrategy(fightType), fightType)
end

local function getArmyLayerIndex(newType)
    if newType == EnumFightStrategyType.StrategyType_PVE then
        return 1
    elseif newType == EnumFightStrategyType.StrategyType_DOUBLE_1 then
        return 3, 1
    elseif newType == EnumFightStrategyType.StrategyType_DOUBLE_2 then
        return 3, 2
    end
end

function KaojiaoManager.goGenghuanZhenfa(data, fightType)
    local selectIndex, secondIndex = getArmyLayerIndex(fightType)
    local layer = require("lua.logic.army.ArmyNewLayer"):new(selectIndex)
    AlertManager:addLayer(layer)
    layer:setOpenInfo(true)
    AlertManager:show()

    if secondIndex then
        local btn = {}
        btn.logic = layer
        btn.idx = secondIndex
        layer.onTeamBtnClick( btn )
    end

    StrategyCardManager:openCardDressLayerByType(fightType)
end

function KaojiaoManager.goZhenfaQianghua(data, fightType)
    if data[1] then
        StrategyCardManager:openEquipOperationLayer(data[1], StrategyCardManager.handleIntensify)
    else
        KaojiaoManager.goGenghuanZhenfa(data, fightType)
    end
end

function KaojiaoManager.goZhenfaTupo(data, fightType)
    if data[1] then
        StrategyCardManager:openEquipOperationLayer(data[1], StrategyCardManager.handleStarUp)
    else
        KaojiaoManager.goGenghuanZhenfa(data, fightType)
    end
end


--宠物
function KaojiaoManager.goGenghuanEudemonAdd(data, fightType)
    local teamLev = MainPlayer:getLevel()
    local openLev = FunctionOpenConfigure:getOpenLevel(1202)
    if teamLev < openLev then
        CardRoleManager:openRoleList()
    else
        local selectIndex, secondIndex = getArmyLayerIndex(fightType)
        local layer = require("lua.logic.army.ArmyNewLayer"):new(selectIndex)
	    AlertManager:addLayer(layer)
	    layer:setOpenInfo(true)
        AlertManager:show()
        if secondIndex then
            local btn = {}
            btn.logic = layer
            btn.idx = secondIndex
            layer.onTeamBtnClick( btn )
        end
        local assistFightView = layer.assistFightView
        if (assistFightView) then
            assistFightView.eudemonBtnClick(assistFightView.btn_pet)
        end
    end
end

--宠物突破
function KaojiaoManager.goGenghuanEudemonTuPo(data, fightType)
    if not data[1] then
        KaojiaoManager.goGenghuanEudemonAdd(nil, fightType)
    else
        local layer = EudemonManager:OpemEudemonMainLayer(data, fightType)
        if (layer) then
            layer.onTrainingClickHandle(layer.btn_tupo)
        end
    end
end

--宠物训练
function KaojiaoManager.goGenghuanEudemonTrain(data, fightType)
    if not data[1] then
        KaojiaoManager.goGenghuanEudemonAdd(nil, fightType)
    else
        local layer = EudemonManager:OpemEudemonMainLayer(data, fightType)
        if (layer) then
            layer.onTrainingRoleClickHandle(layer.btn_xunlianshi)
        end
    end
end

--
function KaojiaoManager.oneKeyDengji(data)
    if KaojiaoManager:filterOneKey(1, 1) then
        return 
    end

    local roleGmId = data.gmId
    local role = CardRoleManager:getRoleByGmid(roleGmId)

    local shedanList = {}
    for i = 1, 4 do
        shedanList[i] = 0
        local tempList = BagManager:getItemByKind(EnumGameItemType.Soul, 3)
        for v in tempList:iterator() do
            if v.quality == i and v.num then
                shedanList[i] = shedanList[i] + v.num
            end
        end
    end
    local tTab = {10, 50, 250, 1250}
    local idList = {3000, 3001, 3002, 3003}
    local numList = {}
    local templevel = tonumber(role.level)
    local tempexp = role.curExp
    local costCoin = 0

    local function changeExp(addExp)
        local maxExp = LevelData:getMaxRoleExp(templevel)
        tempexp = tempexp + addExp
        while tempexp >= maxExp and maxExp > 0  do
            templevel = templevel + 1
            tempexp = tempexp - maxExp
            maxExp = LevelData:getMaxRoleExp(templevel)
        end
    end

    local bStop = false
    for i = 1, #shedanList do
        local count = 0   
        local bagCount = BagManager:getItemNumById(idList[i])     
        for j = 1, shedanList[i] do
            local maxExp = LevelData:getMaxRoleExp(templevel)
            local item = ItemData:objectByID(idList[i])
            local TransferSoulCost = tTab[item.quality]
            local addExp = item.provide_exp

            if not bStop then
                changeExp(addExp)
                
                --print("{{{{{", costCoin)
                --print("}}}}}", MainPlayer:getCoin())
                if count >= bagCount or costCoin >= MainPlayer:getCoin() then
                    count = count - 1
                    break
                end
                count = count + 1
                costCoin = costCoin + TransferSoulCost
                if templevel > MainPlayer:getLevel() or maxExp == 0 or (templevel == MainPlayer:getLevel() and tempexp >= maxExp) then 
                    bStop = true               
                    break
                end
            end
        end 
        numList[i] = count
    end

    local tab = {}
    local temp = 1
    for i = 1, #numList do
        tab[i] = {idList[i], numList[i]}      
    end
    --print("<<<<<<", tab)
    CardRoleManager:roleTransfer( roleGmId, {} ,tab )
end

function KaojiaoManager.oneKeyXiahuanTupo(data)
    -- showLoading()
    -- local Msg = {
    --     data.gmId, 
    --     1
    -- }
    -- TFDirector:send(c2s.ROLE_PRACTICE, Msg)

    if KaojiaoManager:filterOneKey(1, 2) then
        return 
    end

    CardRoleManager:roleStarUp( data.gmId ,1)
end

function KaojiaoManager.oneKeyWuxueZhuangpei(data)
    if KaojiaoManager:filterOneKey(1, 3) then
        return 
    end

    MartialManager:RequestOneKeyEquipMartial(data.gmId)
end

function KaojiaoManager.oneKeyWuxueShengchong(data)
    if KaojiaoManager:filterOneKey(1, 4) then
        return 
    end

    local role = CardRoleManager:getRoleByGmid(data.gmId)
    MartialManager:requestMartialLevelUp(role)
end

function KaojiaoManager.oneKeySkillLevelUp(data)
    if KaojiaoManager:filterOneKey(1, 5) then
        return 
    end

    CardRoleManager:upLevelSkill(data.gmId, 0)
end

function KaojiaoManager.oneKeyJingmaiChongxue(data)
    if KaojiaoManager:filterOneKey(1, 6) then
        return 
    end

    local vipLevel = ConstantData:objectByID("yijianchongxue.VipLevel").value
    if MainPlayer:getVipLevel() < vipLevel then
        toastMessage(stringUtils.format(localizable.common_vip_open,vipLevel))
        return
    end
    CardRoleManager:upLevelAcupontToTop(data.gmId)
end

function KaojiaoManager.oneKeyQimendun(data)
    if KaojiaoManager:filterOneKey(1, 9) then
        return 
    end

    --请求奇门注入
    --showLoading()
    --TFDirector:send(c2s.QIMEN_INJECT, {})
    CardRoleManager:requestQimenInjectBreach()
end


function KaojiaoManager.oneKeyGenghuanZhuangbei(data)
    if KaojiaoManager:filterOneKey(2, 1) then
        return 
    end

    EquipmentManager:EquipmentChange({gmid = data.gmId, roleid = data.roleId})
end

--[[
if VipRuleManager:isCanIntensify(true) == false then
    return
end
]]
function KaojiaoManager.oneKeyEquipQianghua(data)
    if KaojiaoManager:filterOneKey(2, 3) then
        return 
    end
    for i = 1, #data do
        local tab1 = {equipGmId = data[i]}
        EquipmentManager:EquipmentIntensifyToTop(tab1.equipGmId)
    end   
end

function KaojiaoManager.oneKeyXiangqianJingyao(data)
    if KaojiaoManager:filterOneKey(3, 3) then
        return 
    end
    if not data.gmId then
        return
    end
    local role = CardRoleManager:getRoleByGmid(data.gmId)
    if role and role.bible then
        SkyBookManager:requestEssentialAllMosaic(role.bible.instanceId)
    end
end

function KaojiaoManager.oneKeyTianshuShengchong(data)
    if KaojiaoManager:filterOneKey(3, 5) then
        return 
    end

    SkyBookManager:requestBibleLevelUp(data.instanceId)
end

function KaojiaoManager.oneKeyEquipZhenfa(data)
    if KaojiaoManager:filterOneKey(4, 1) then
        return 
    end
    local gmId = data.data
    local type = data.type
    StrategyCardManager:sendDressHandleMsg( gmId, type )
end

function KaojiaoManager.oneKeyZhenfaTupo(data)
    if KaojiaoManager:filterOneKey(4, 3) then
        return 
    end
    local gmId = data.gmId
    local card = StrategyCardManager:getStrategyCardByGmid(gmId)
    local times = card:getCanStarUpTimes() or 1
    for i = 1, times do
        StrategyCardManager:sendStarUpMsg(gmId)
    end
end

function KaojiaoManager:triggerOneKeyFunc(data)
    local type = data.type
    local kind = data.kind
    local roleGmId = data.gmId

    local func = self.oneKeyFunc[type][kind]
    if not func then
        return
    end

    if type == 1 then
        local tab = {gmId = roleGmId}
        func(tab)       
    elseif type == 2 then
        if kind == 1 then            
            local bCan, tab = self:checkGenghuanZhuangbei(roleGmId)
            local role = CardRoleManager:getRoleByGmid(roleGmId)
            if not bCan then
                return
            end
            local info = tab.info
            for i = 1, #info do
                local tab1 = {gmId = info[i].newGmId, roleId = role.id}
                func(tab1)
            end
        elseif kind == 3 then
            --table.insert(tab, equipInfo.gmId)
            local bCan, tab = self:checkEquipQianghua(roleGmId)
            if not bCan then
                return
            end
            local info = tab.info  
            func(info)        
        end
    elseif type == 3 then
        if kind == 3 then
            local tab = {gmId = data.gmId}
            func(tab)
        elseif kind == 5 then
            local gmId = data.gmId
            local cardRole = CardRoleManager:getRoleByGmid(gmId) 
            local bible = cardRole:getSkyBook()
            local tab = {instanceId = bible.instanceId}
            func(tab)
        end
    elseif type == 4 then
        local zhenrongType = data.zhenrongType
        local fightType = data.fightType
        if kind == 1 then
            local bCan, tab = self:checkZhenfaEquip(roleGmId, true, zhenrongType)
            local temp = {}
            temp.data = tab.funcData[1]
            temp.type = fightType
            func(temp)
        elseif kind == 3 then
            local bCan, tab = self:checkZhenfaTupo(roleGmId, true, zhenrongType)
            local temp = {}
            temp.gmId = tab.funcData[1]
            func(temp)
        end
    end
end

function KaojiaoManager.goHuoquDengji(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    ClimbManager:showCarbonListLayer()
end

function KaojiaoManager.goHuoquXiahun(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    MallManager:openMallLayerByType(EnumMallType.CardRoleMall, 1)
end

function KaojiaoManager.goHuoquJingmaiChongxue(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    ClimbManager:showMountainLayer()
end

function KaojiaoManager.goHuoquJingmaiTupo(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    NorthClimbManager:showNorthMountainLayer(true)
    --ClimbManager:showMountainLayer()
end

function KaojiaoManager.goHuoquLianti(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    MallManager:openMallLayerByType(EnumMallType.NormalMall, 1)
end

function KaojiaoManager.goHuoquEquipQuality(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    --MissionManager:showHomeLayer(MissionManager.DIFFICULTY1)
    MissionManager:showHomeLayer()
end

function KaojiaoManager.goHuoquQihe(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    MallManager:openMallLayerByType(EnumMallType.QunHaoMall, 1)
end

function KaojiaoManager.goHuoquQianghua(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    --CommonManager:showBuyCoinLayer()
    QiyuManager:OpenHomeLayer(3)
end

function KaojiaoManager.goHuoquJinglian(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    --MiningManager:requestMiningInfo()  
    MallManager:openMallLayerByType(EnumMallType.NormalMall, 1)
end

function KaojiaoManager.goHuoquChongzhu(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end

    --MallManager:openMallLayerByType(EnumMallType.HonorMall, 1)
    ClimbManager:showMountainLayer()
end

function KaojiaoManager.goHuoquEquipXiangqian(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    --GambleManager:openGambleMainLayer()
    ClimbManager:showMountainLayer()
end

function KaojiaoManager.goHuoquEquipShengjie(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    MallManager:openMallLayerByType(EnumMallType.NormalMall, 1)
end

function KaojiaoManager.goHuoquTianshu(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    --AdventureManager:openHomeLayer()
    MallManager:openMallLayerByType(EnumMallType.AdventureMall, 1)   
end

function KaojiaoManager.goHuoquJingyao(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    --AdventureManager:openHomeLayer()
    --MallManager:openMallLayerByType(EnumMallType.AdventureMall, 1)

    AdventureManager:openMissLayer()   
end

function KaojiaoManager.goHuoquTianshuTupo(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end

    MallManager:openMallLayerByType(EnumMallType.FactionMall, 1)   
end

function KaojiaoManager.goHuoquRoleDengji(type, kind, data, fightType)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    CardRoleManager:openRoleInfoByFightType(data[1], fightType)
end

function KaojiaoManager.goHuoquWuxue(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    MissionManager:showHomeLayer()
end

function KaojiaoManager.goHuoquQianxiu(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    --OperationActivitiesManager:openHomeLayer(0)
    ClimbManager:showCarbonListLayer()
end

function KaojiaoManager.goHuoquZhenfa(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    ChuangzhenManager:openMainLayer( true )
end

--宠物
function KaojiaoManager.goHuoquEudemon(type, kind)
    if KaojiaoManager:filterGetWay(type, kind) then
        return
    end
    MallManager:openMallLayer()
end
function KaojiaoManager:filterGetWay(type, kind)
    local item = PowerCompareData:getItemByTypeAndKind(type, kind)
    if not self:checkGetWayLevel(item) then
        --MallManager:openMallLayerByType(EnumMallType.NormalMall, 1)
        toastMessage(item.way_level_txt)
        return true
    end
end

function KaojiaoManager:filterOneKey(type, kind)
    local item = PowerCompareData:getItemByTypeAndKind(type, kind)
    local txt = item.onekey_need_txt

    if MainPlayer:getVipLevel() < item.onekey_need then
        if not self.bStopLimit then
            CommonManager:showOperateSureLayer(
                function()
                    PayManager:showPayLayer();
                end,
                nil,
                {
                title = localizable.CommonManager_vip_up,
                msg = stringUtils.format(localizable.KaojiaoManager_VipRule, item.onekey_need, txt),
                uiconfig = "lua.uiconfig_mango_new.common.NeedTpPayLayer"
                }
            )
        end
        return true
    end
end

function KaojiaoManager:openKaojiaoLayer()
    local layer = require("lua.logic.kaojiao.KaojiaoLayer"):new()
    --AlertManager:addLayer(layer,AlertManager.BLOCK_AND_GRAY,AlertManager.TWEEN_1)
    AlertManager:addLayer(layer, AlertManager.BLOCK_AND_GRAY)
    AlertManager:show()
    TFDirector:send(c2s.POWER_EXAM_LOG_REQUEST, {})
end

function KaojiaoManager:resetCacheTab(type)
    self.roleScoreTab = self.roleScoreTab or {}
    self.roleScoreTab[type] = nil
    self.checkTab = self.checkTab or {}
    self.checkTab[type] = nil
end

return KaojiaoManager:new()