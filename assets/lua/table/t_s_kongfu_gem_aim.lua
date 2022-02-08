local mapArray = MEMapArray:new()
mapArray:push({ id = 1, level = 1, num = 5, desc = "5 chỗ trống toàn mở", attr_add = "32_500", add_desc = "Bạo +5%"})
mapArray:push({ id = 2, level = 10, num = 5, desc = "5 lỗ đạt tới 10 Cấp", attr_add = "32_500|33_500", add_desc = "Bạo +5%，Giảm Bạo +5%"})
mapArray:push({ id = 3, level = 20, num = 5, desc = "5 lỗ đạt tới 20 Cấp", attr_add = "32_1000|33_500", add_desc = "Bạo +10%，Giảm Bạo +5%"})
mapArray:push({ id = 4, level = 30, num = 5, desc = "5 lỗ đạt tới 30 Cấp", attr_add = "32_1000|33_1000", add_desc = "Bạo +10%，Giảm Bạo +10%"})
mapArray:push({ id = 5, level = 40, num = 5, desc = "5 lỗ đạt tới 40 Cấp", attr_add = "32_1500|33_1000", add_desc = "Bạo +15%，Giảm Bạo +10%"})
mapArray:push({ id = 6, level = 50, num = 5, desc = "5 lỗ đạt tới 50 Cấp", attr_add = "32_1500|33_1500", add_desc = "Bạo +15%，Giảm Bạo +15%"})
mapArray:push({ id = 7, level = 60, num = 5, desc = "5 lỗ đạt tới 60 Cấp", attr_add = "32_2000|33_1500", add_desc = "Bạo +20%，Giảm Bạo +15%"})
return mapArray
