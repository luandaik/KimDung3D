
local mapArray = MEMapArray:new()
--打第一关
mapArray:push({ id = 1, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 1,maxStep = 1} , process = 1 	,widget_Gray = "" })
--第一次抽卡固定抽木婉清
mapArray:push({ id = 2, trigger_layer = "MenuLayer" , conditions = {maxStep = 2,maxRoleNum = 1,level = 4} , process = 251	,widget_Gray = "" })
--第二次抽卡固定抽南海鳄神
--mapArray:push({ id = 3, trigger_layer = "MenuLayer" , conditions = {maxRoleNum = 2} , process = 40	,widget_Gray = "" })
--钟灵上阵
--mapArray:push({ id = 4, trigger_layer = "MenuLayer" , conditions = {maxArmyRole = 1,maxStep = 5, maxLevel = 4} , process = 50	,widget_Gray = "" })
--南海鳄神上阵
--mapArray:push({ id = 5, trigger_layer = "MenuLayer" , conditions = {maxArmyRole = 2,maxStep = 6, maxLevel = 4} , process = 60	,widget_Gray = "" })
--南海鳄神移位
--mapArray:push({ id = 6, trigger_layer = "MenuLayer" , conditions = { armyIndexHas = 1,armyIndexNo = 4, maxLevel = 4} , process = 70	,widget_Gray = "" })
--领取上阵成就
-- mapArray:push({ id = 7, trigger_layer = "MenuLayer" , conditions = {maxLevel = 4} , process = 80	,widget_Gray = "" })
--打第二关
mapArray:push({ id = 8, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 2,maxStep = 8} , process = 10	,widget_Gray = "" })
--穿戴秘籍id
mapArray:push({ id = 9, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 3,maxStep = 9} , process = 130	,widget_Gray = "" })
--打第三关
mapArray:push({ id = 10, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 3,maxStep = 10} , process = 164	,widget_Gray = "" })
--打第四关
mapArray:push({ id = 11, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 4,maxStep = 11 } , process = 210	,widget_Gray = "" })
--打第五关
mapArray:push({ id = 12, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 5,maxStep = 12 } , process = 206	,widget_Gray = "" })
--打第六关
mapArray:push({ id = 13, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 6,maxStep = 13 } , process = 207	,widget_Gray = "" })
--领取boss成就
mapArray:push({ id = 14 , trigger_layer = "MissionLayer" , conditions = {minLevel = 4, curMission = 31} , process = 400 	,widget_Gray = ""})

--下载有礼
mapArray:push({ id = 15, trigger_layer = "MissionLayer" , conditions = {curMission = 13,smallPacket = true} , process = 701	, widget_Gray = "" })
-- -- 引导习得第二本武学
-- mapArray:push({ id = 23, trigger_layer = "MenuLayer" , conditions = {step = 22, maxLevel = 4} , process = 1480, widget_Gray = "" })
-- -- 引导习得第三本武学
-- mapArray:push({ id = 24, trigger_layer = "MenuLayer" , conditions = {step = 23, maxLevel = 4} , process = 1481, widget_Gray = "" })
-- -- 引导领取成就奖励
-- mapArray:push({ id = 28, trigger_layer = "MenuLayer" , conditions = {step = 24, maxLevel = 4} , process = 1497, widget_Gray = "" })
-- --打第六关
-- mapArray:push({ id = 29, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 6,maxStep = 32} , process = 1500, widget_Gray = "" })
-- --打第七关
-- mapArray:push({ id = 32, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 7,maxStep = 25} , process = 1504, widget_Gray = "" })
-- --打第八关
-- mapArray:push({ id = 25, trigger_layer = "MenuLayer" , conditions = {cycle = true,curMission = 8,maxStep = 26} , process = 1508, widget_Gray = "" })
-- --填秘籍&寻找秘籍
-- mapArray:push({ id = 26, trigger_layer = "MenuLayer" , conditions = {step = 25, martial = 4 , maxLevel = 4} , process = 164	,widget_Gray = "" })
-- -- 扫荡第六本秘籍
-- mapArray:push({ id = 33, trigger_layer = "MenuLayer" , conditions = {step = 26, passMission = 8 , maxLevel = 4} , process = 1661	,widget_Gray = "" })
-- -- 习得第六本
-- mapArray:push({ id = 34, trigger_layer = "MenuLayer" , conditions = {step = 33, martial = 5 , maxLevel = 4} , process = 16951	,widget_Gray = "" })
-- --武学进阶
-- mapArray:push({ id = 27, trigger_layer = "MenuLayer" , conditions = {step = 34 , maxLevel = 4} , process = 16971	,widget_Gray = "" })
-- --升级技能引导
-- mapArray:push({ id = 15, trigger_layer = "MenuLayer" , conditions = {step = 34, maxLevel = 4} , process = 16701 ,widget_Gray = "" })
-- --领取武学进阶成就
-- mapArray:push({ id = 31, trigger_layer = "MenuLayer" , conditions = {step = 15, maxLevel = 4} , process = 1675 ,widget_Gray = "" })
-- --成就界面前往关卡
-- mapArray:push({ id = 35, trigger_layer = "MenuLayer" , conditions = {step = 31,passMission = 8, maxLevel = 4} , process = 16751 ,widget_Gray = "" })
-- --首冲画报
--mapArray:push({ id = 16, trigger_layer = "MissionLayer" , conditions = {step = 31,passMission = 30} , process = 2501,	widget_Gray = "" })
--三日领段誉
--mapArray:push({ id = 17, trigger_layer = "MissionLayer" , conditions = {step = 16,passMission = 40,sevenDay = true} , process = 2502,	widget_Gray = "" })
--排行榜
--mapArray:push({ id = 18, trigger_layer = "MenuLayer" , conditions = {minLevel = 19} , process = 2601	,widget_Gray = "",pic = "ui_new/home/main_paihang_btn.png" })
--七日目标系统
--mapArray:push({ id = 30, trigger_layer = "MissionLayer" , conditions = {passMission = 10,maxStep = 19} , process = 1101	,widget_Gray = "" })
--mapArray:push({ id = 19, trigger_layer = "MenuLayer" , conditions = {minLevel = 5}  , process = 1102 ,	title_id = 24 , des = "每日目标达成！有丰厚奖励" ,pic = "ui_new/home/icon_qiri.png",name = "七日活动"})
--侠魂满触发引导  编号20的类型写死 不可更改
mapArray:push({ id = 20, trigger_layer = "RoleInfoLayer" , conditions = {special = true} , process = 1202	,widget_Gray = "" })
--武学升阶
--mapArray:push({ id = 61, trigger_layer = "RoleInfoLayer" , conditions = {martial = true} , process = 2101	,widget_Gray = "" , name = "武学升阶"})
--战斗加速
mapArray:push({ id = 66 , trigger_layer = "FightUiLayer" , conditions = {minLevel = 4, curMission = 11} , process =2801 	,widget_Gray = ""})
--阵位4上阵
mapArray:push({ id = 69, trigger_layer = "MenuLayer" , conditions = {level = 5, maxArmyRole = 3} , process = 3100	,	title_id = 27 , des = "阵位共可上阵五人，随等级开启" ,name = "阵位开启"})
--阵位5上阵
mapArray:push({ id = 70, trigger_layer = "MenuLayer" , conditions = {level = 10, maxArmyRole = 4} , process = 3200	,	title_id = 27 , des = "阵位共可上阵五人，随等级开启" ,name = "阵位开启"})
--日常任务
mapArray:push({ id = 50, trigger_layer = "MenuLayer" , conditions = {level = 6} , process = 150	,	title_id = 20 , des = "完成日常任务可获得奖励" ,pic = "ui_new/task/cj_richang.png",name = "日常任务"})
--勤学苦练引导，写死，不可更改
mapArray:push({ id = 1000, trigger_layer = "RoleInfoLayer" , conditions = {special = true} , process = 2900	,widget_Gray = "" })
--传功引导，写死，不可更改
mapArray:push({ id = 2000, trigger_layer = "RoleInfoLayer" , conditions = {special = true} , process = 1302	,widget_Gray = "" })
--签到
mapArray:push({ id = 52, trigger_layer = "MenuLayer" , conditions = {level = 7} , process = 2301 ,	title_id = 17 , des = "当月签到可获得完整侠客" ,pic = "ui_new/home/main_qiaodao_btn.png",name = "签到"})
--商城
mapArray:push({ id = 51, trigger_layer = "MenuLayer" , conditions = {level = 8} , process = 2401 ,	title_id = 19 , des = "商城中出售各种珍稀物品" ,pic = "ui_new/home/main_shangcheng_btn.png",name = "商城"})
--好友
mapArray:push({ id = 71, trigger_layer = "MenuLayer" , conditions = {level = 9} , process = 3300	,	title_id = 28, des = "好友交互，送礼切磋" ,pic = "ui_new/home/main_haoyou_btn.png",name = "好友系统"})--
--护驾
--mapArray:push({ id = 72, trigger_layer = "MenuLayer" , conditions = {minLevel = 11} , process = 3401	,	title_id = 12, des = "持续击退刺客，领取神秘宝物" ,name = "护驾"})--
--群豪谱
mapArray:push({ id = 53, trigger_layer = "MenuLayer" , conditions = {level = 12} , process = 601	,title_id = 14 , des = "一战群豪，争夺武林霸主之位" ,name = "群豪谱"})
--龙门镖局
mapArray:push({ id = 73, trigger_layer = "MenuLayer" , conditions = {level = 13} , process = 3501	,	title_id = 11, des = "刷新镖车获得大量铜币" ,name = "龙门镖局"})--
--宗师关卡
mapArray:push({ id = 64, trigger_layer = "MenuLayer" , conditions = {level = 15,tiliMin = 1} , process = 5001,title_id = 23 , des = "难度更高，挑战可得装备和侠魂" ,name = "宗师关卡"})
--装备海报
--mapArray:push({ id = 54, trigger_layer = "MissionLayer" , conditions = {level = 15,step = 64,curMission = 1002,maxStep = 65,notUseEquip=1} , process = 500,widget_Gray = "" })
--穿戴装备
mapArray:push({ id = 65, trigger_layer = "MenuLayer" , conditions = {minLevel = 15,passMission = 1001,notUseEquip=1} , process = 504,widget_Gray = "" })
--强化装备
mapArray:push({ id = 67, trigger_layer = "MenuLayer" , conditions = {minLevel = 15,passMission = 1001, maxLevel = 18, hasEquip = 0} , process = 510,widget_Gray = "",pic = "ui_new/home/main_zhuangbei_btn.png"})
--无量山
mapArray:push({ id = 55, trigger_layer = "MenuLayer" , conditions = {level = 20} , process = 800	,title_id = 4,des = "获取真气激活经脉" ,name = "无量山"})
--角色经脉
mapArray:push({ id = 56, trigger_layer = "MenuLayer" , conditions = {step = 55, minLevel = 20} , process = 901	,widget_Gray = ""})
--侠客归隐
mapArray:push({ id = 62, trigger_layer = "MenuLayer" , conditions = {level = 22} , process = 2701 ,title_id = 25 , des = "可回收侠客返还资源" ,name = "侠客归隐"})
--宝石镶嵌
mapArray:push({ id = 63, trigger_layer = "MenuLayer" , conditions = {level = 24, hasEquip = 0} , process = 2211	,title_id = 2 , des = "镶嵌宝石可大幅提升战力" ,pic = "ui_new/home/main_zhuangbei_btn.png",name = "宝石镶嵌"})
--雁门关
mapArray:push({ id = 57, trigger_layer = "MenuLayer" , conditions = {level = 25} ,process = 1601	,title_id = 7 , des = "雁门关开，宝石遍地" ,name = "雁门关"})
--帮派
--mapArray:push({ id = 75, trigger_layer = "MenuLayer" , conditions = {minLevel = 26} ,process = 3600	,title_id = 31 , des = "聚集众人，齐心协力经营势力" ,pic = "ui_new/home/main_bangpai_btn.png",name = "帮派"})
--摩诃崖
mapArray:push({ id = 58, trigger_layer = "MenuLayer" , conditions = {level = 28} ,process = 1001	,title_id = 6 , des = "专属侠魂，待你来取" ,name = "摩诃崖"})
--装备升星
mapArray:push({ id = 60, trigger_layer = "MenuLayer" , conditions = {level = 29, hasEquip = 0} , process = 2001	,title_id = 0 , des = "升星可提升装备属性和成长" ,pic = "ui_new/home/main_zhuangbei_btn.png",name = "装备升星"})
--世界BOSS
mapArray:push({ id = 68, trigger_layer = "MenuLayer" , conditions = {level = 30} ,process = 3001	,title_id = 26 , des = "根据伤害排行获得更多元宝" ,name = "伏魔录"})
--装备精炼
mapArray:push({ id = 59, trigger_layer = "MenuLayer" , conditions = {level = 40, hasEquip = 0} , process = 1401	,title_id = 1 , des = "精炼可提升装备附加属性数值" ,pic = "ui_new/home/main_zhuangbei_btn.png",name = "装备精炼"})
--助战
--mapArray:push({ id = 99, trigger_layer = "MenuLayer" , conditions = {minLevel = 40} , process = 3700 ,title_id = 29 , des = "无需上阵，激活缘分" ,name = "助战"})
--洗练
mapArray:push({ id = 76, trigger_layer = "MenuLayer" , conditions = {minLevel = 45, hasEquip = 0} , process = 3801,title_id = 34 , des = "洗练装备更改附加属性" ,pic = "ui_new/home/main_zhuangbei_btn.png",name = "装备洗练"})
--契合
--mapArray:push({ id = 77, trigger_layer = "MenuLayer" , conditions = {minLevel = 50} , process = 3900,title_id = 35 , des = "助战侠客以自身属性增加全队属性" ,name = "助战契合"})
--重铸
--mapArray:push({ id = 78, trigger_layer = "MenuLayer" , conditions = {minLevel = 60, hasEquip = 0} , process = 4001	,title_id = 36 , des = "重铸使装备属性超大量提升" ,pic = "ui_new/home/main_zhuangbei_btn.png",name = "装备重铸"})
--挖矿
--mapArray:push({ id = 79, trigger_layer = "MenuLayer" , conditions = {minLevel = 46} ,process = 6001	,title_id = 37 , des = "玉矿获取超大量铜币，可抢夺他人矿源" ,name = "神农矿"})
--祈愿
--mapArray:push({ id = 80, trigger_layer = "MenuLayer" , conditions = {minLevel = 31} , process = 2711 ,title_id = 39 , des = "可获得传说级侠客整卡" ,name = "祈愿系统"})
--更换主角
mapArray:push({ id = 81, trigger_layer = "MenuLayer" , conditions = {level = 21} , process = 2721 ,title_id = 40 , des = "可以更换主角侠客" ,name = "更换主角"})
--赌石系统
--mapArray:push({ id = 82, trigger_layer = "MenuLayer" , conditions = {minLevel = 55} , process = 3411 ,title_id = 41 , des = "可以用铜币赢取宝石" ,name = "赌石系统"})
--游历玩法
--mapArray:push({ id = 83, trigger_layer = "MenuLayer" , conditions = {minLevel = 65} , process = 7001 ,title_id = 42 , des = "带你游历金庸世界" ,name = "游历玩法"})
--佣兵
--mapArray:push({ id = 80, trigger_layer = "MenuLayer" , conditions = {minLevel = 34} ,process = 7001	,title_id = 38 , des = "雇佣好友及帮派强力援助上阵战斗" ,pic = "ui_new/home/zjm_yb_icon.png",name = "佣兵"})
--考校
mapArray:push({ id = 84, trigger_layer = "MenuLayer" , conditions = {level = 23} , process = 8001 , title_id = 43 , des = "实时查看自身评分，快速掌握变强要领" , name = "考校"})
--侠客炼体
mapArray:push({ id = 85, trigger_layer = "MenuLayer" , conditions = {minLevel = 80} , process = 8101 ,title_id = 43 , des = "侠客炼体，战力飙升" ,name = "侠客炼体"})


--mapArray:push({ id = , trigger_layer = "MenuLayer" , conditions = {} , process = 	,widget_Gray = ""})
--step = , minLevel = ,cycle = true,curMission = 

--mapArray:push({ id = , trigger_layer = "MenuLayer引导出现图层名字,默认主界面" , conditions = {引导开启条件,一般为最小等级minlevel} , process = guidestep内的对应引导步骤序号	,title_id = resource\ui_new\guide文件夹内标题图片名字,des ="对系统简介功能说明,＜17个汉字",pic = "ui_new/home/main_paihang_btn.png,若该系统有主界面图标飞向效果,则要找对应图片"})

return mapArray	