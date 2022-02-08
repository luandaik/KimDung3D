local mapArray = MEMapArray:new()
mapArray:push({ id = 1, mapid = 2 ,role_anger = 50, mainPlay = 100100,npc_anger = 0, role = {0,0,100100,0,0,0,0,0,100101}, npc = {0,0,190011,0,0,0,0,190012,190013}, skill = {{2,3,40001}}})
mapArray:push({ id = 2, mapid = 2 ,role_anger = 50, mainPlay = 100200,npc_anger = 0, role = {0,0,0,0,100201,100200,0,0,0}, npc = {0,0,0,190021,190022,190023,190024,0,190025}, skill = {{1,2,40002}}})
mapArray:push({ id = 3, mapid = 2 ,role_anger = 0, mainPlay = 100300,npc_anger = 20, role = {0,0,0,0,0,100300,0,0,0}, npc = {0,190032,190033,0,0,190031,0,190034,190035}, skill = {{14,3,100301},{1,5,40003}}})
mapArray:push({ id = 4, mapid = 2 ,role_anger = 50, mainPlay = 100400,npc_anger = 0, role = {0,0,100400,0,0,0,0,0,100401}, npc = {190041,0,190044,0,190042,0,190043,0,190045}, skill = {{2,2,40004}}})
mapArray:push({ id = 5, mapid = 11 ,role_anger = 0, mainPlay = 100500,npc_anger = 10, role = {0,0,100500,0,100501,100502,0,0,0}, npc = {0,190051,190052,0,190053,190054,0,0,0}, skill = {{2,2,40005},{3,7,40006}}})
mapArray:push({ id = 6, mapid = 11 ,role_anger = 0, mainPlay = 100600,npc_anger = 0, role = {0,0,0,0,100600,0,0,0,0}, npc = {0,190062,190064,190061,0,0,0,190063,190065}, skill = {}})

return mapArray
