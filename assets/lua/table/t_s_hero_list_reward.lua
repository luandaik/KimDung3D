local mapArray = MEMapArray:new()
mapArray:push({ id = 1, min_rank = 1, max_rank = 1, reward_id = 1231})
mapArray:push({ id = 2, min_rank = 2, max_rank = 2, reward_id = 1232})
mapArray:push({ id = 3, min_rank = 3, max_rank = 3, reward_id = 1233})
mapArray:push({ id = 4, min_rank = 4, max_rank = 4, reward_id = 1234})
mapArray:push({ id = 5, min_rank = 5, max_rank = 5, reward_id = 1235})
mapArray:push({ id = 6, min_rank = 6, max_rank = 10, reward_id = 1236})
mapArray:push({ id = 7, min_rank = 11, max_rank = 50, reward_id = 1237})
mapArray:push({ id = 8, min_rank = 51, max_rank = 100, reward_id = 1238})
mapArray:push({ id = 9, min_rank = 101, max_rank = 200, reward_id = 1239})
mapArray:push({ id = 10, min_rank = 201, max_rank = 500, reward_id = 1240})
mapArray:push({ id = 11, min_rank = 501, max_rank = 900000, reward_id = 1241})
return mapArray
