local mapArray = MEMapArray:new()
mapArray:push({ id = 1, npc_id = 62001, name = "Thủ lĩnh", type = 1, revive_time = 0, hurt_blood_limit = 50, formation = "0,0,0,0,62001,0,0,0,0", display = "10315", effect_name = "", effect = "", boss = 1, extra_buff = ""})
mapArray:push({ id = 2, npc_id = 62101, name = "Cánh trái", type = 2, revive_time = 300, hurt_blood_limit = 100, formation = "0,0,0,0,62101,0,0,0,0", display = "10308", effect_name = "", effect = "", boss = 0, extra_buff = "1,2,3"})
mapArray:push({ id = 3, npc_id = 62102, name = "Cánh phải", type = 3, revive_time = 300, hurt_blood_limit = 200, formation = "0,0,0,0,62102,0,0,0,0", display = "10296", effect_name = "", effect = "", boss = 0, extra_buff = "4,5,6,7,8"})
mapArray:push({ id = 4, npc_id = 62103, name = "Trung quân", type = 4, revive_time = 0, hurt_blood_limit = 1000, formation = "0,0,0,0,62103,0,0,0,0", display = "10115", effect_name = "", effect = "", boss = 0, extra_buff = "9"})
return mapArray
