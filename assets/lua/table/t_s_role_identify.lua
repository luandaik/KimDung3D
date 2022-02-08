--[[

actionType = 1 --chỉ làm di động 
actionType = 2 --di động,chữ số biến hóa 
actionType = 3 --đặc hiệu hoàn hậu biểu hiện 
actionType = 4 --phóng đại thu nhỏ lại biến hóa 
]]

local mapArray = MEMapArray:new()

mapArray:push({ id = 1, parent_name ="txt_cjsj", child_name ="txt_time", proto_parent ="", proto_child ="createTime", actionType = 1, remark ="sáng tạo thời gian:", indent = 1, resetY = 0})
mapArray:push({ id = 2, parent_name ="txt_name", child_name ="txt_id", proto_parent ="playerName", proto_child ="playerId", actionType = 1, remark ="tên", indent = 1, resetY = 0})
mapArray:push({ id = 3, parent_name ="txt_level", child_name ="txt_num", proto_parent ="", proto_child ="teamLevel", actionType = 2, remark ="đoàn đội đẳng cấp:", indent = 1, resetY = 0})
mapArray:push({ id = 4, parent_name ="txt_fwq", child_name ="txt_num", proto_parent ="", proto_child ="serverName", actionType = 1, remark ="Server:", indent = 1, resetY = 0})
mapArray:push({ id = 5, parent_name ="txt_zqxk", child_name ="txt_name2", proto_parent ="", proto_child ="bestXiaKe", actionType = 1, remark ="cực mạnh hiệp khách:", indent = 1, resetY = 1})
mapArray:push({ id = 6, parent_name ="txt_yyxks", child_name ="txt_name2", proto_parent ="", proto_child ="xiaKeCount", actionType = 2, remark ="Hiệp khách sổ:", indent = 1, resetY = 1})
mapArray:push({ id = 7, parent_name ="txt_yyspzb", child_name ="txt_name2", proto_parent ="", proto_child ="equipCount", actionType = 2, remark ="Tuyệt phẩm trang bị sổ:", indent = 1, resetY = 1})
mapArray:push({ id = 8, parent_name ="txt_qhp", child_name ="txt_name2", proto_parent ="", proto_child ="heroRank", actionType = 2, remark ="quần hào phổ tối cao bài danh:", indent = 1, resetY = 1})
mapArray:push({ id = 9, parent_name ="txt_fhb", child_name ="txt_name2", proto_parent ="", proto_child ="redPacketCount", actionType = 2, remark ="phát sinh tiền lì xì:", indent = 1, resetY = 1})
mapArray:push({ id = 10, parent_name ="img_zdl", child_name ="txt_power", proto_parent ="", proto_child ="power", actionType = 3, remark ="", indent = 0, resetY = 0})
-- mapArray:push({ id = 11, parent_name ="txt_jb", child_name ="txt_bfb", proto_parent ="", proto_child ="percent", actionType = 4, remark ="", indent = 0})
return mapArray
