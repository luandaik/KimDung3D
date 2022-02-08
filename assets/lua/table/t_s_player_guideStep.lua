-- onlybox có hay không vi không ai vật đích dẫn đạo khuông 
local mapArray = 			MEMapArray:new()


mapArray:push({ id = 1, layer_name ="MenuLayer", next_step = 2, guideType = 3, name ="Đại Lý Hoàng đế", image = 10298, position = 1, content ="Tìm về Thiên Thư một chuyện gánh nặng đường xa, vẫn là từ chúng ta hộ tống ngươi đoạn đường.", sound ="12.mp3",soundTime = 20})
mapArray:push({ id = 2, layer_name ="MenuLayer", next_step = 5, guideType = 3, name ="0", image = 0, position = 2, content ="vãn bối nhất định đem hết khả năng ，không phụ nhờ vã 。", sound ="13.mp3|013.mp3", smile = 0,soundTime = 20})
--mapArray:push({ id = 3, layer_name ="MenuLayer", next_step = 5, guideType = 3, name ="Đông Hải đảo chủ", image = 10295, position = 1, content ="ma đầu mỗi người công lực thâm hậu ，vạn sự cẩn thận 。", sound ="", smile = 0})
--mapArray:push({ id = 4, layer_name ="MenuLayer", next_step = 5, guideType = 3, name ="0", image = 0, position = 2, content ="đa tạ tiền bối chỉ điểm 。", sound ="", smile = 1})

--đả cửa thứ nhất id = 1
mapArray:push({ id = 5, 	layer_name ="MenuLayer", 			widget_name ="pveBtn", 			next_step = 6, tip_pos = {-100, 200}, hand_pos = {-10,10}, 	tip ="nhượng chúng ta cùng nhau bắt đầu mới bước chân vào giang hồ ba 。",sound ="501.mp3",soundTime = 10})
mapArray:push({ id = 6,  	layer_name ="MissionLayer", 		widget_name ="cur_mission|btn_base",next_step = 7, tip_pos = {50, 190}, 	tip ="phía trước có người trong ma giáo ，chúng ta đuổi theo 。",specialCall = 1,sound ="502.mp3",soundTime = 10 })
mapArray:push({ id = 7,  	layer_name ="MissionDetailLayer", 	widget_name ="btn_attack", 		next_step = 9, tip_pos = {0, 180}, 	tip ="khiêu chiến trạm kiểm soát cần tiêu hao thể lực ，thể lực hội từ từ khôi phục nga 。",sound ="503.mp3",soundTime = 10})
--mapArray:push({ id = 8,  	layer_name ="FightUiLayer", 		widget_name ="roleskill1|roleicon",next_step = 9, tip_pos = {250, 180}, 	tip ="",force = false})
mapArray:push({ id = 9,  	layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 			next_step = 11, tip_pos = {-50, 180}, 	tip ="chúng ta thắng lợi lạp ！thưởng cho thật đúng là phong phú ni 。", save = true,next_functionId= 8, right = true,sound ="504.mp3",soundTime = 10})
--mapArray:push({ id = 10,	layer_name ="MissionLayer", 		widget_name ="btn_return", 		next_step = 90, tip_pos = {250, -800}, 	tip =""})

--lần đầu tiên trừu tạp cố định trừu chung linh id = 2
-- mapArray:push({ id = 35,	layer_name ="MenuLayer", guideType = 2, 	next_step = 0, picture ="ui_new/login/xf_di.png",taskType = 100})
--mapArray:push({ id = 11,	layer_name ="MenuLayer", guideType = 1, 			widget_name ="zhaomuBtn", 						next_step = 12, picture ="ui_new/home/main_zhaomu_btn.png"})
--mapArray:push({ id = 12,	layer_name ="MenuLayer", 			widget_name ="zhaomuBtn", 										next_step = 13, tip_pos = {-30, 340}, hand_pos = {-10,10}, tip ="tiến nhập tửu quán chiêu mộ mới đồng bạn",rotation = 225,sound ="",soundTime = 4,onlybox = true})
--mapArray:push({ id = 13,	layer_name ="RecruitLayer", 			widget_name ="rolePanel2|getRoleBtn", offset = {0,0,-15,0},next_step = 14, tip_pos = {-20, 190}, 	tip ="mỗi ngày đều khả dĩ tiến hành một lần miễn phí tông sư chiêu mộ ，không nên lãng phí cơ hội nga 。", save = true})
--mapArray:push({ id = 14,	layer_name ="GetRoleResultLayer", 	widget_name ="rolebgImg", 		offset = {-560,-200,1100,600},	next_step = 15, tip_pos = {-40, 170}, 	tip ="",right = true,hand_eff ="guide_hand", hand_pos = {110, -110}})

--mapArray:push({ id = 15, layer_name ="GetRoleResultLayer", next_step = 16, guideType = 3, name ="linh muội", image = 10024, position = 1, content ="ân cứu mạng không thể vi báo ，Linh nhi sau này nguyện đi theo tả hữu 。", sound ="", smile = 0})
--mapArray:push({ id = 16, layer_name ="GetRoleResultLayer", next_step = 17, guideType = 3, name ="0", image = 0, position = 2, content ="cô nương nói quá lời ，gặp chuyện bất bình rút dao tương trợ nãi ta bối hiệp nghĩa người trong đích bản phận 。", sound ="", smile = 1})


--mapArray:push({ id = 17,	layer_name ="GetRoleResultLayer", 	widget_name ="returnBtn", 										next_step = 20, tip_pos = {-40, 170}, 	tip ="",right = true,next_functionId= 3})
--mapArray:push({ id = 18,	layer_name ="RecruitLayer", 			widget_name ="btn_return", 								next_step = 0, tip_pos = {250, -800},	tip =""})

--lần thứ hai trừu tạp cố định trừu nam hải ngạc thần id = 3
--mapArray:push({ id = 19, open_lev = 0, 	layer_name ="MenuLayer", 			widget_name ="zhaomuBtn",rotation = 225, 		next_step = 20, tip_pos = {-30, 340}, tip ="tiến nhập tửu quán chiêu mộ mới đồng bạn",hand_pos = {-10,10},sound ="",soundTime = 5,onlybox = true})

--mapArray:push({ id = 20, layer_name ="RecruitLayer", next_step = 21, guideType = 3, name ="0", image = 0, position = 1, content ="thần cái tiền bối tống cho tại hạ một vò thượng đẳng nữ nhi hồng ，liền thỉnh Hồ đại hiệp và tiểu linh nhi chè chén một phen 。", sound ="", smile = 1})
--mapArray:push({ id = 21, layer_name ="RecruitLayer", next_step = 22, guideType = 3, name ="linh muội", image = 10024, position = 2, content ="tốt tốt ，nhớ kỹ biệt uống cạn sạch cho ta thiểm điện điêu lưu một chút ，hì hì 。", sound ="", smile = 0})

--mapArray:push({ id = 22, open_lev = 0, 	layer_name ="RecruitLayer", 		widget_name ="rolePanel3|getRoleBtn", 			next_step = 23, tip_pos = {-20, 190}, tip ="",hand_pos = {10, 10},save = true})
--mapArray:push({ id = 23, open_lev = 0,		layer_name ="GetRoleResultLayer", 	widget_name ="rolebgImg",offset = {-560,-200,1100,600},next_step = 25, tip_pos = {-40, 170}, 	tip ="",	right = true,	hand_eff ="guide_hand", hand_pos = {110, -110}})

--mapArray:push({ id = 25, layer_name ="RecruitLayer", next_step = 26, guideType = 3, name ="phi hồ Đại hiệp", image = 10094, position = 1, content ="quả nhiên là hảo tửu ，ta ngươi nhất kiến như cố ，sau này có gì sai phái Hồ mỗ muôn lần chết không chối từ 。", sound ="", smile = 0})
--mapArray:push({ id = 26, layer_name ="RecruitLayer", next_step = 44, guideType = 3, name ="0", image = 0, position = 2, content ="tại hạ năng kết bạn Hồ đại hiệp diệc là phi thường vinh hạnh ，sau này thỉnh chỉ giáo nhiều hơn 。", sound ="", smile = 1})

--mapArray:push({ id = 27,	layer_name ="GetRoleResultLayer", 	widget_name ="returnBtn", 										next_step = 28, tip_pos = {-40, 170}, 	tip ="",right = true,next_functionId= 3})



--mapArray:push({ id = 28,	layer_name ="GetTenRoleLayer", 		widget_name ="returnBtn", 			next_step = 29, tip_pos = {0, 0}, tip =""})

--mapArray:push({ id = 29, open_lev = 0, 	layer_name ="GetRoleResultLayer", 	widget_name ="returnBtn", 						next_step = 44, tip_pos = {-40, 170}, 	tip ="", right = true})
--mapArray:push({ id = 44, open_lev = 0, 	layer_name ="RecruitLayer", 		widget_name ="btn_return", 					next_step = 50, tip_pos = {150, -800},	tip ="", right = true})

--chung linh ra trận id = 4
--mapArray:push({ id = 50,	layer_name ="MenuLayer", 			widget_name ="roleBtn", 			next_step = 51, tip_pos = {185, 260}, 	tip ="điểm kích bày binh bố trận cái nút ，nhượng mới tiểu tử bạn ra trận ba 。",rotation = 270,right = true,onlybox = true})
--mapArray:push({ id = 51,	layer_name ="ArmyLayer", 			widget_name ="panel_cardregional", next_step = 61, offset = {300,342,-330,-357}, tip_pos = {300, 220}, 	tip ="đè lại hiệp khách hình cái đầu ，tha động ra trận 。đừng xem linh muội như thế manh ，thế nhưng rất có thể đánh đích nga 。",sound ="",soundTime = 5, hand_pos = {-2, 236}, save = true,right = true, specialCall = 2,next_functionId= 5,hand_eff ="guide_buzhen"})
--mapArray:push({ id = 52,	layer_name ="ArmyLayer", 			widget_name ="btn_close", 			next_step = 0, tip_pos = {230, -170}, 	tip ="nhượng chúng ta hồng trần làm bạn,sống ……a phi,chúng ta cùng đi mới bước chân vào giang hồ ba Ｏ(≧miệng ≦)Ｏ"})

--nam hải ngạc thần ra trận id = 5,
--mapArray:push({ id = 60, open_lev = 0, 	layer_name ="MenuLayer", 			widget_name ="roleBtn", 						next_step = 61, tip_pos = {150, 260}, 	tip ="điểm kích đội hình cái nút ，điều chỉnh ra trận hiệp khách 。",hand_pos = {-10, 0},rotation = 270, right = true,onlybox = true})
--mapArray:push({ id = 61, open_lev = 0, 	layer_name ="ArmyLayer", 			widget_name ="panel_cardregional", 			next_step = 71, tip_pos = {-300, 200},offset = {300,342,-330,-357}, tip ="đè lại hiệp khách hình cái đầu ，tha động ra trận 。", hand_pos = {-2, 236}, specialCall = 2, save = true, hand_eff ="guide_buzhen",hand_index = 1,onlybox = true,next_functionId= 6})

--nam hải ngạc thần lệch vị trí id = 6,
--mapArray:push({ id = 70, open_lev = 0, 	layer_name ="MenuLayer", 			widget_name ="roleBtn", 						next_step = 71, tip_pos = {150, 260}, 	tip ="điểm kích đội hình cái nút ，điều chỉnh ra trận hiệp khách 。",hand_pos = {-10, 0},rotation = 270, right = true,onlybox = true})
--mapArray:push({ id = 71, open_lev = 0, 	layer_name ="ArmyLayer", 			widget_name ="panel_buzhen", 					next_step = 72, tip_pos = {150, 200}, 	tip ="Hồ đại hiệp am hiểu phòng ngự loại kỹ năng ，thích hợp đặt ở hàng chống đối thương tổn bảo hộ Đồng đội 。", specialCall = 3,hand_pos = {454, 314}, hand_eff ="guide_buzhen",hand_index = 2, save = true,sound ="28.mp3",soundTime = 5})
--mapArray:push({ id = 72, open_lev = 0, 	layer_name ="ArmyLayer", 			widget_name ="btn_close", 						next_step = 0, tip_pos = {250, -180}, tip ="hiệp khách tứ đại chức nghiệp theo thứ tự là ：công phòng nhất thể phòng ngự hệ ，vô kiên bất tồi tấn công hệ ，nhiếp tâm hồn người khống chế hệ ，Diệu Thủ Hồi Xuân trị liệu hệ",onlybox = true})

--đả cửa thứ hai id = 8
--mapArray:push({ id = 90,	layer_name ="MenuLayer", 			widget_name ="pveBtn", 										next_step = 91, tip_pos = {-100, 200}, 	tip ="truy binh lại đến ，bất quá có Hồ đại hiệp và linh muội đích thêm vào ，tin tưởng đánh bại bọn họ không thành vấn đề 。"})

mapArray:push({ id = 10, 	layer_name ="MenuLayer", 			widget_name ="pveBtn", 			next_step = 11, tip_pos = {-100, 200}, hand_pos = {-10,10}, 	tip ="nhượng chúng ta kế tục trở thành ba 。",sound ="505.mp3",soundTime = 10})

mapArray:push({ id = 11, layer_name ="MissionLayer", next_step = 12, guideType = 3, name ="Đại Lý Hoàng Đế", image = 10298, position = 2, content ="lão nạp cần điều tức một chút ，đảo chủ sau đó tức đáo ，cư sĩ vạn sự cẩn thận 。", sound ="22.mp3",soundTime = 20})
mapArray:push({ id = 12, layer_name ="MissionLayer", next_step = 90, guideType = 3, name ="0", image = 0, position = 1, content ="đa tạ đại sư ，thỉnh khá bảo trọng 。", sound ="23.mp3|023.mp3", smile = 1,soundTime = 20})




mapArray:push({ id = 90,	layer_name ="MissionLayer", 		widget_name ="cur_mission|btn_base", 							next_step = 91, tip_pos = {0, 190}, 	tip ="",specialCall = 1 })
mapArray:push({ id = 91,	layer_name ="MissionDetailLayer", 	widget_name ="btn_attack", 									next_step = 93, tip_pos = {0, 180}, 	tip ="", right = true})
--mapArray:push({ id = 92,  	layer_name ="FightUiLayer", 		widget_name ="roleskill1|roleicon", 							next_step = 93, tip_pos = {250, 180}, 	tip ="",force = false})
mapArray:push({ id = 93,	layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 										next_step = 94, tip_pos = {-50, 180}, 	tip ="oa ，thị bí tịch võ công ，nhanh lên học tập ba 。", save = true, right = true, sound ="506.mp3",soundTime = 10, next_functionId = 9})
mapArray:push({ id = 94,	layer_name ="MissionLayer", 		widget_name ="btn_return", 									next_step = 95})


mapArray:push({ id = 95, layer_name ="MenuLayer", next_step = 96, guideType = 3, name ="Đông Hải đảo chủ", image = 10295, position = 2, content ="những bí tịch này tuy không phải cái thế tuyệt học ，gia dĩ nghiên tập còn là rất có ích lợi 。", sound ="31.mp3",soundTime = 20})
mapArray:push({ id = 96, layer_name ="MenuLayer", next_step = 97, guideType = 3, name ="0", image = 0, position = 1, content ="vãn bối ra đời vị sâu ，xin hãy đảo chủ chỉ điểm nhiều hơn 。", sound ="32.mp3|032.mp3", smile = 0,soundTime = 20})
mapArray:push({ id = 97, layer_name ="MenuLayer", next_step = 130, guideType = 3, name ="Đông Hải đảo chủ", image = 10295, position = 2, content ="cũng tốt ，lão phu liền giáo ngươi làm sao dùng những bí tịch này đề thăng công lực 。", sound ="33.mp3",soundTime = 20})



--quần áo nón nảy bí tịch id = 11,
mapArray:push({ id = 130,	layer_name ="MenuLayer", 			widget_name ="armature1", offset ={-40,0,50,40}, next_step = 131, tip_pos = {-250, 70}, tip ="", hand_pos = {0, 90}})
mapArray:push({ id = 131,	layer_name ="RoleInfoLayer", 		widget_name ="btn_jinjie", 	 	next_step = 132, tip_pos = {-150,-50},  tip ="điểm một chút ở đây thử xem ，rất phương tiện ba 。", save = true, sound ="507.mp3",soundTime = 10, hand_pos = {0, 0}})
--mapArray:push({ id = 132,	layer_name ="RoleInfoLayer", 		widget_name ="btn_close", 			next_step = 0, tip_pos = {250, -250}, tip =""})


-- đả quyển thứ năm bí tịch 
--mapArray:push({ id = 164,	layer_name ="MenuLayer", 		 widget_name ="armature1",	offset ={-40,0,50,40},			next_step = 165, tip_pos = {-250, 70},	tip ="", hand_pos = {0, 100}, right = true})
mapArray:push({ id = 132,	layer_name ="RoleInfoLayer", 		widget_name ="panel_book_5|img_quality", 			next_step = 133, tip_pos = {-250, 0}, 	tip ="chúng ta còn thiếu một ít bí tịch ，điểm kích ở đây thử xem 。",sound ="508.mp3",soundTime = 10})
mapArray:push({ id = 133,	layer_name ="RoleBook_OnEquip", 	widget_name ="btn_qxkl", 			next_step = 134, tip_pos = {-120, 180}, tip =""}) -- điểm kích thu hoạch võ học cái nút 
mapArray:push({ id = 134,	layer_name ="RoleBook_OnEquip",	widget_name ="pannel_getwaylist|HandbookOutPutCell", 		offset ={218,0,0,0},			next_step = 135, tip_pos = {-10, -30}, tip ="khán ，quyển bí tịch kia nơi này có rơi xuống 。",soundTime = 10,sound ="509.mp3", hand_pos = {218, 0},specialCall = 8})-- điểm kích rơi xuống cách đi trước trạm kiểm soát 

mapArray:push({ id = 164, 	layer_name ="MenuLayer", 			widget_name ="pveBtn", 			next_step = 165, tip_pos = {-100, 200}, hand_pos = {-10,10}, 	tip ="nhượng chúng ta kế tục trở thành ba 。",sound ="505.mp3",soundTime = 10})
mapArray:push({ id = 165,	layer_name ="MissionLayer", 		widget_name ="cur_mission|btn_base", 		next_step = 166, tip_pos = {-100, 260}, 	tip ="",specialCall = 1, hand_pos = {0, 10}, right = true}) -- trạm kiểm soát cái nút 
mapArray:push({ id = 166,	layer_name ="MissionDetailLayer", 	widget_name ="btn_attack", 		next_step = 167, tip_pos = {30, 200}, 	tip ="", right = true}) -- càn quét cái nút 
mapArray:push({ id = 167, layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 	 next_step =211, tip_pos = {150, -100},	tip ="",right = true, save = true,next_functionId = 11,hand_pos = {0, 0}})-- đóng trạm kiểm soát khiêu chiến mặt biên -điểm kích ý khu vực 



mapArray:push({ id = 135, layer_name ="MissionLayer", next_step = 136, guideType = 3, name ="Tây Vực tiên sinh", image = 10296, position = 2, content ="đảo chủ nói còn chưa tẫn kỳ diệu ，nếu có thể tu tập một ít tán công pháp môn", sound ="34.mp3",soundTime = 20, skipIconOut = 1})
mapArray:push({ id = 136, layer_name ="MissionLayer", next_step = 168, guideType = 3, name ="Tây Vực tiên sinh", image = 10296, position = 2, content ="võ học của ngươi tu vi liền có thể tiến thêm nhất giai 。", sound ="35.mp3",soundTime = 20, skipIconIn = 1})


mapArray:push({ id = 168,	layer_name ="MissionLayer", 		widget_name ="cur_mission|btn_base", 		next_step = 169, tip_pos = {-100, 260}, 	tip ="",specialCall = 1, hand_pos = {0, 10}, right = true}) -- trạm kiểm soát cái nút 
mapArray:push({ id = 169,	layer_name ="MissionDetailLayer", 	widget_name ="btn_attack", 		next_step = 170, tip_pos = {30, 200}, 	tip ="", right = true}) -- càn quét cái nút 
mapArray:push({ id = 170, layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 	 next_step = 171, tip_pos = {150, -100},	tip ="",right = true, save = true,next_functionId = 10,hand_pos = {0, 0}})-- đóng trạm kiểm soát khiêu chiến mặt biên -điểm kích ý khu vực 
mapArray:push({ id = 171,	layer_name ="MissionLayer", 		widget_name ="btn_return", 	 next_step = 172, tip_pos = {150, -200}, 	tip ="đại công cáo thành ，nhanh lên học tập ba 。",sound ="510.mp3",soundTime = 10, right = true}) --- trạm kiểm soát phản hồi  chúa mặt biên 
mapArray:push({ id = 172,	layer_name ="RoleBook_OnEquip", 	widget_name ="btn_qxkl", 			next_step = 181, tip_pos = {-120, 180}, tip =""}) -- điểm kích thu hoạch võ học cái nút 

--quần áo nón nảy bí tịch tiến giai,
--mapArray:push({ id = 180,	layer_name ="MenuLayer", 			widget_name ="armature1", offset ={-40,0,50,40}, next_step = 181, tip_pos = {-250, 70}, tip ="chúng ta đi vai mặt biên học bí tịch", hand_pos = {0, 90}})
mapArray:push({ id = 181,	layer_name ="RoleInfoLayer", 		widget_name ="btn_jinjie", 	 	next_step = 183, tip_pos = {-150,-100},  tip ="",sound ="", soundTime = 5, hand_pos = {0, 0}})

--mapArray:push({ id = 182,	layer_name ="MenuLayer", 			widget_name ="armature1", offset ={-40,0,50,40}, next_step = 183, tip_pos = {-250, 70}, tip ="chúng ta đi vai mặt biên học bí tịch", hand_pos = {0, 90}})
mapArray:push({ id = 183,	layer_name ="RoleInfoLayer", 		widget_name ="btn_jinjie", 	 	next_step = 184, tip_pos = {-150,-135},  tip ="kích động lòng người thời khắc lại tới ~nhượng chúng ta tiến giai ba 。",sound ="511.mp3",save = true,soundTime = 5, hand_pos = {0, 0}})
-- mapArray:push({ id = 183,	layer_name ="RoleInfoLayer", 		widget_name ="btn_close", 			next_step = 191, tip_pos = {250, -250}, tip =""})

mapArray:push({ id = 184,	layer_name ="RoleBreakResultNewLayer", widget_name ="img_clicktoclose", offset = {0,20,0,0}, next_step = 185, tip_pos = {-350, 100}, tip ="ta cảm giác ngươi cả người đích khí chất đều không giống nhau ！",soundTime = 10,sound ="512.mp3"})

mapArray:push({ id = 185, layer_name ="RoleInfoLayer", next_step = 186, guideType = 3, name ="Tây Vực tiên sinh", image = 10296, position = 2, content ="ngươi vừa đoạt được đích xà đảm thị luyện công hàng cao cấp ，đối công lực đề thăng có trợ giúp lớn 。", sound ="46.mp3",soundTime = 20})
mapArray:push({ id = 186, layer_name ="RoleInfoLayer", next_step = 191, guideType = 3, name ="0", image = 0, position = 1, content ="quả thực như vậy ？vãn bối giá liền thử một lần 。", sound ="47.mp3|047.mp3", smile = 3,soundTime = 20})


--truyền công,
--mapArray:push({ id = 190,	layer_name ="MenuLayer", 			widget_name ="armature1", offset ={-40,0,50,40}, next_step = 191, tip_pos = {-250, 70}, tip ="chúng ta đi vai mặt biên học bí tịch", hand_pos = {0, 90}})
mapArray:push({ id = 191,	layer_name ="RoleInfoLayer", 		widget_name ="btn_transfer", 	 	next_step = 192, tip_pos = {-150,-170},  tip ="truyền công thị hạng nhất đại sự ，yếu thời khắc nhớ kỹ nga 。",sound ="513.mp3",soundTime = 10, hand_pos = {0, 0}})
mapArray:push({ id = 192,	layer_name ="RoleTransferLayer", 		widget_name ="panel_list", 	 	next_step = 193, tip_pos = {0,180},  tip ="ngoại trừ xà đảm ở ngoài ，hiệp hồn cũng là có thể truyền công đích yêu 。",sound ="514.mp3",soundTime = 10, hand_pos = {60, 290}})
mapArray:push({ id = 193,	layer_name ="RoleTransferLayer", 		widget_name ="btn_transfer", 	 	next_step = 194, tip_pos = {-250,30},  tip ="chọn xong tài liệu ，điểm một chút tựu dễ dàng thăng cấp lạp 。",sound ="515.mp3",soundTime = 10, save = true,hand_pos = {0, 0}})
mapArray:push({ id = 194,	layer_name ="RoleTransferLayer", 		widget_name ="btn_return", 			next_step = 195, tip_pos = {250, -250}, tip =""})
mapArray:push({ id = 195, layer_name ="RoleInfoLayer", next_step = 201, guideType = 3, name ="Tây Vực tiên sinh", image = 10296, position = 2, content ="võ học của ngươi chiêu thức quá mức nông cạn ，lão phu lai giáo ngươi làm sao đề thăng ba 。", sound ="48.mp3",soundTime = 20})


--kỹ năng thăng cấp 
--võ học tiến giai （gảy mất hậu từ chúa mặt biên tiến nhập ） id = 15
--mapArray:push({ id = 200,	layer_name ="MenuLayer", 		 widget_name ="armature1",	offset ={-40,0,50,40},	next_step = 201, tip_pos = {-250, 70},	tip ="đã lâu một luyện võ ，nhanh đi thăng cấp kỹ năng ba ~", hand_pos = {0, 100}, right = true}) -- điểm kích mở vai mặt bản 
--kỹ năng thăng cấp （tập được hậu trực tiếp thăng kỹ năng ）
mapArray:push({ id = 201,	layer_name ="RoleInfoLayer", 		widget_name ="btn_skill", 			next_step = 202, tip_pos = {-250, 0}, 	sound ="516.mp3", tip ="nhìn ta một chút môn nắm giữ cái nào kỹ năng nga 。",soundTime = 10})
mapArray:push({ id = 202,	layer_name ="RoleSkillListLayer", 	widget_name ="", 					next_step = 203, tip_pos = {250, 450},	tip ="có cái này tựu biểu thị chúng ta khả dĩ thăng cấp kỹ năng lạp 。", hand_pos = {480, 510}, hand_eff ="guide_hand",trigger = true,sound ="517.mp3",soundTime = 10})
mapArray:push({ id = 203,	layer_name ="RoleSkillListLayer", 	widget_name ="panel_item_1|btn_uplevel", 		next_step = 204, 	tip_pos = {150, -100},	tip ="nhượng chúng ta tới đề thăng kỹ năng uy lực ba 。", save = true,hand_pos = {0, 0}, right = true,sound ="518.mp3",soundTime = 10})
mapArray:push({ id = 204,	layer_name ="RoleSkillListLayer", 	widget_name ="btn_close", 		 next_step = 205, 	tip_pos = {0, -150},	tip ="", hand_pos = {0, 0}, right = true}) --đóng kỹ năng 
mapArray:push({ id = 205,	layer_name ="RoleInfoLayer", 	 widget_name ="btn_close", 		 next_step = 210,  tip_pos = {150, -100},	tip ="", hand_pos = {0, 0}, right = true}) --đóng vai mặt biên 


--phần cuối chỉ dẫn tiến sấm quan,
mapArray:push({ id = 210,	layer_name ="MenuLayer", 			widget_name ="pveBtn", 					next_step = 211, tip_pos = {-100, 200}, tip ="nhượng chúng ta kế tục trở thành ba 。", right = true,sound ="505.mp3",soundTime = 10})

mapArray:push({ id = 211, layer_name ="MissionLayer", next_step = 212, guideType = 3, name ="Tây Vực tiên sinh", image = 10296, position = 2, content ="lão khiếu hóa tử ，kế tiếp hãy nhìn ngươi đó 。", sound ="49.mp3",soundTime = 20})
mapArray:push({ id = 212, layer_name ="MissionLayer", next_step = 213, guideType = 3, name ="thần cái", image = 10297, position = 2, content ="hắc hắc ，lão độc vật tuy rằng phẩm tính kém một chút ，bất quá giáo đắc ngược lại không tệ 。", sound ="50.mp3",soundTime = 20})
mapArray:push({ id = 213, layer_name ="MissionLayer", next_step = 215, guideType = 3, name ="0", image = 0, position = 1, content ="làm phiền các vị tiền bối dốc lòng giáo dục ，vãn bối được ích lợi không nhỏ 。", sound ="51.mp3|051.mp3", smile = 1,soundTime = 20})

mapArray:push({ id = 215,	layer_name ="MissionLayer", 		widget_name ="cur_mission|btn_base", 		next_step = 216, tip_pos = {70, 210}, 	tip ="",specialCall = 1, hand_pos = {0, 10}})
mapArray:push({ id = 216,  layer_name ="MissionDetailLayer", 	widget_name ="btn_attack", 		next_step = 217, tip_pos = {0, 180}, 	tip ="",sound ="",soundTime = 5})
mapArray:push({ id = 217,  layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 			next_step = 218, tip_pos = {-50, 180}, 	tip ="", save = true, right = true,next_functionId = 12})

mapArray:push({ id = 206,	layer_name ="MenuLayer", 			widget_name ="pveBtn", 					next_step = 218, tip_pos = {-100, 200}, tip ="nhượng chúng ta kế tục trở thành ba 。", right = true,sound ="505.mp3",soundTime = 10})

mapArray:push({ id = 218, layer_name ="MissionLayer", next_step = 219, guideType = 3, name ="thần cái", image = 10297, position = 2, content ="lão khiếu hóa đường này chưởng pháp cực kỳ hao tổn chân lực ，xem ra chỉ có thể cùng ngươi đến nơi đây lạp 。", sound ="57.mp3",soundTime = 20})
mapArray:push({ id = 219, layer_name ="MissionLayer", next_step = 220, guideType = 3, name ="trùng dương chân nhân", image = 10299, position = 2, content ="Thất huynh mặc dù khứ điều tức một chút ，kế tiếp tựu giao cho ta ba 。", sound ="58.mp3",soundTime = 20})


mapArray:push({ id = 220,	layer_name ="MissionLayer", 		widget_name ="cur_mission|btn_base", 							next_step = 221, tip_pos = {0, 190}, 	tip ="",specialCall = 1 })
mapArray:push({ id = 221,	layer_name ="MissionDetailLayer", 	widget_name ="btn_attack", 									next_step = 222, tip_pos = {0, 180}, 	tip ="", right = true})
mapArray:push({ id = 222,	layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 										next_step = 223, tip_pos = {-50, 180}, 	tip ="", save = true, right = true, next_functionId = 13})

mapArray:push({ id = 207,	layer_name ="MenuLayer", 			widget_name ="pveBtn", 					next_step = 223, tip_pos = {-100, 200}, tip ="nhượng chúng ta kế tục trở thành ba 。", right = true,sound ="505.mp3",soundTime = 10})

mapArray:push({ id = 223, layer_name ="MissionLayer", next_step = 224, guideType = 3, name ="0", image = 0, position = 1, content ="đa tạ Long cô nương chữa thương chi đức 。", sound ="70.mp3|070.mp3",smile = 1,soundTime = 20})
mapArray:push({ id = 224, layer_name ="MissionLayer", next_step = 225, guideType = 3, name ="Long cô nương", image = 10279, position = 2, content ="nói quá lời ，ta phải rời đi ，sau này còn gặp lại 。", sound ="71.mp3",soundTime = 20})
mapArray:push({ id = 225, layer_name ="MissionLayer", next_step = 226, guideType = 3, name ="0", image = 0, position = 1, content ="hôm nay từ biệt ，chẳng biết lúc nào năng tái gặp lại ？", sound ="72.mp3|072.mp3",smile = 2,soundTime = 20})
mapArray:push({ id = 226, layer_name ="MissionLayer", next_step = 227, guideType = 3, name ="Long cô nương", image = 10279, position = 2, content ="hữu duyên thì sẽ gặp lại ，cáo từ 。", sound ="73.mp3",soundTime = 20})


mapArray:push({ id = 227,	layer_name ="MissionLayer", 		widget_name ="cur_mission|btn_base", 							next_step = 228, tip_pos = {0, 190}, 	tip ="",specialCall = 1 })
mapArray:push({ id = 228,	layer_name ="MissionDetailLayer", 	widget_name ="btn_attack", 									next_step = 229, tip_pos = {0, 180}, 	tip ="", right = true})
mapArray:push({ id = 229,	layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 										next_step = 230, tip_pos = {-50, 180}, 	tip ="", save = true, right = true, next_functionId = 2})
mapArray:push({ id = 230,  layer_name ="MissionSkipNewLayer", 	widget_name ="Button_star_box1", 			next_step = 231, tip_pos = {-50, 180}, 	tip ="đừng quên lĩnh nơi này Bảo rương nga ~",sound ="519.mp3",soundTime = 10})
mapArray:push({ id = 231,  layer_name ="MissionSkipNewLayer", 	widget_name ="Button_star_box2", 			next_step = 232, tip_pos = {-50, 180}, 	tip =""})
mapArray:push({ id = 232,  layer_name ="MissionSkipNewLayer", 	widget_name ="Button_star_box3", 			next_step = 233, tip_pos = {-50, 180}, 	tip =""})
mapArray:push({ id = 233,  layer_name ="MissionSkipNewLayer", 	widget_name ="Btn_goon", 			next_step = 234, tip_pos = {-50, 180}, 	tip =""})
mapArray:push({ id = 234,	layer_name ="MissionLayer", 		widget_name ="btn_return", 						next_step = 251})



--mapArray:push({ id = 300,	layer_name ="MenuLayer", guideType = 1, 			widget_name ="zhaomuBtn", 						next_step = 301, picture ="ui_new/home/main_zhaomu_btn.png"})

mapArray:push({ id = 251, layer_name ="MenuLayer", next_step = 252, guideType = 3, name ="linh muội", image = 10024, position = 2, content ="đại ân nhân ，nghĩ không ra lại ở chỗ này gặp phải ngươi ！", sound ="88.mp3", smile = 0,soundTime = 20})
mapArray:push({ id = 252, layer_name ="MenuLayer", next_step = 253, guideType = 3, name ="0", image = 0, position = 1, content ="nguyên lai là Linh nhi cô nương ，một chút vi làm phiền không đáng nhắc đến 。", sound ="89.mp3|089.mp3", smile = 1,soundTime = 20})
mapArray:push({ id = 253, layer_name ="MenuLayer", next_step = 301, guideType = 3, name ="linh muội", image = 10024, position = 2, content ="nơi này điều không phải chỗ nói chuyện ，phía trước có gia tửu quán ，ta ở nơi nào chờ ngươi 。", sound ="90.mp3",soundTime = 20})


mapArray:push({ id = 301,	layer_name ="MenuLayer", 			widget_name ="zhaomuBtn", 										next_step = 302, tip_pos = {-30, 340}, hand_pos = {-10,10}, tip ="chúng ta đi tửu quán nhìn 。",rotation = 225,sound ="520.mp3",soundTime = 10})
mapArray:push({ id = 302,	layer_name ="RecruitLayer", 			widget_name ="rolePanel2|getRoleBtn", offset = {0,0,-15,0},next_step = 304, tip_pos = {-20, 190}, 	tip ="mỗi ngày đều có thể miễn phí chiêu mộ một lần ，không nên lãng phí nga 。", save = true,sound ="521.mp3",soundTime = 10})
--mapArray:push({ id = 303,	layer_name ="GetRoleResultLayer", 	widget_name ="rolebgImg", 		offset = {-560,-200,1100,600},	next_step = 304, tip_pos = {-40, 170}, 	tip ="",right = true,hand_eff ="guide_hand", hand_pos = {110, -110}})

mapArray:push({ id = 304, layer_name ="GetRoleResultLayer", next_step = 306, guideType = 3, name ="linh muội", image = 10024, position = 1, content ="ân cứu mạng không thể vi báo ，Linh nhi sau này nguyện đi theo tả hữu 。", sound ="91.mp3", smile = 0,soundTime = 20})

mapArray:push({ id = 306,	layer_name ="GetRoleResultLayer", 	widget_name ="returnBtn", 										next_step = 309, tip_pos = {-40, 170}, 	tip ="",right = true})
--mapArray:push({ id = 307,	layer_name ="RecruitLayer", 			widget_name ="btn_return", 								next_step = 0, tip_pos = {250, -800},	tip =""})

--lần thứ hai trừu tạp cố định trừu nam hải ngạc thần id = 3
--mapArray:push({ id = 308, open_lev = 0, 	layer_name ="MenuLayer", 			widget_name ="zhaomuBtn",rotation = 225, 		next_step = 20, tip_pos = {-30, 340}, tip ="tiến nhập tửu quán chiêu mộ mới đồng bạn",hand_pos = {-10,10},sound ="",soundTime = 5,onlybox = true})

mapArray:push({ id = 309, layer_name ="RecruitLayer", next_step = 310, guideType = 3, name ="0", image = 0, position = 1, content ="thần cái tiền bối tống cho tại hạ một vò thượng đẳng nữ nhi hồng ，chúng ta tới chè chén một phen 。", sound ="92.mp3|092.mp3", smile = 1,soundTime = 20})
mapArray:push({ id = 310, layer_name ="RecruitLayer", next_step = 311, guideType = 3, name ="phi hồ Đại hiệp", image = 10094, position = 2, content ="thật là nồng nặc đích mùi rượu ，khả phủ cũng thỉnh tại hạ uống một chén ？", sound ="93.mp3",soundTime = 20})

mapArray:push({ id = 311, open_lev = 0, 	layer_name ="RecruitLayer", 		widget_name ="rolePanel3|getRoleBtn", 			next_step = 313, tip_pos = {-20, 190}, tip ="",hand_pos = {10, 10},save = true})
--mapArray:push({ id = 312, open_lev = 0,		layer_name ="GetRoleResultLayer", 	widget_name ="rolebgImg",offset = {-560,-200,1100,600},next_step = 313, tip_pos = {-40, 170}, 	tip ="",	right = true,	hand_eff ="guide_hand", hand_pos = {110, -110}})

mapArray:push({ id = 313, layer_name ="RecruitLayer", next_step = 307, guideType = 3, name ="phi hồ Đại hiệp", image = 10094, position = 2, content ="hảo tửu hảo tửu ，Hồ mỗ ký uống rượu của ngươi", sound ="94.mp3", soundTime = 20})
mapArray:push({ id = 307, layer_name ="RecruitLayer", next_step = 314, guideType = 3, name ="phi hồ Đại hiệp", image = 10094, position = 2, content ="sau này có gì sai phái muôn lần chết không chối từ 。", sound ="102.mp3", soundTime = 20})
mapArray:push({ id = 314, layer_name ="RecruitLayer", next_step = 315, guideType = 3, name ="0", image = 0, position = 1, content ="tại hạ năng kết bạn Hồ đại hiệp diệc là phi thường vinh hạnh ，sau này thỉnh chỉ giáo nhiều hơn 。", sound ="95.mp3|095.mp3", smile = 1,soundTime = 20})

mapArray:push({ id = 315, open_lev = 0, 	layer_name ="RecruitLayer", 		widget_name ="btn_return", 					next_step = 316, tip_pos = {150, -800},	tip ="", right = true})

--chung linh ra trận id = 4
mapArray:push({ id = 316,	layer_name ="MenuLayer", 			widget_name ="roleBtn", 			next_step = 317, tip_pos = {185, 260}, 	tip ="chúng ta nhượng mới tiểu tử bạn ra trận ba ！",rotation = 270,right = true,sound ="522.mp3",soundTime = 10})
mapArray:push({ id = 317,	layer_name ="ArmyLayer", 			widget_name ="panel_cardregional", next_step = 319, offset = {300,342,-330,-357}, tip_pos = {300, 220}, 	tip ="đè lại đầu của hắn như ，tha động đáo trận vị thượng có thể lạp 。",sound ="523.mp3",soundTime = 10, hand_pos = {-2, 236}, save = true,right = true, specialCall = 2,next_functionId= 5,hand_eff ="guide_buzhen"})
--mapArray:push({ id = 52,	layer_name ="ArmyLayer", 			widget_name ="btn_close", 			next_step = 0, tip_pos = {230, -170}, 	tip ="nhượng chúng ta hồng trần làm bạn,sống ……a phi,chúng ta cùng đi mới bước chân vào giang hồ ba Ｏ(≧miệng ≦)Ｏ"})

--nam hải ngạc thần ra trận id = 5,
mapArray:push({ id = 318, open_lev = 0, 	layer_name ="MenuLayer", 			widget_name ="roleBtn", 						next_step = 319, tip_pos = {150, 260}, 	tip ="chúng ta nhượng mới tiểu tử bạn ra trận ba ！",hand_pos = {-10, 0},rotation = 270, right = true,sound ="522.mp3",soundTime = 10})
mapArray:push({ id = 319, open_lev = 0, 	layer_name ="ArmyLayer", 			widget_name ="panel_cardregional", 			next_step = 321, tip_pos = {-300, 200},offset = {300,342,-330,-357}, tip ="", hand_pos = {-2, 236}, specialCall = 2, save = true, hand_eff ="guide_buzhen",hand_index = 1,next_functionId= 6})

--nam hải ngạc thần lệch vị trí id = 6,
mapArray:push({ id = 320, open_lev = 0, 	layer_name ="MenuLayer", 			widget_name ="roleBtn", 						next_step = 321, tip_pos = {150, 260}, 	tip ="chúng ta nhượng mới tiểu tử bạn ra trận ba ！",hand_pos = {-10, 0},rotation = 270, right = true,sound ="522.mp3",soundTime = 10})
mapArray:push({ id = 321, open_lev = 0, 	layer_name ="ArmyLayer", 			widget_name ="panel_buzhen", offset = {150,320,-155,-350},	next_step = 322, tip_pos = {150, 200}, 	tip ="hàng nhớ kỹ phóng thịt lá chắn hình đích ，da dày thịt béo nại đả năng kháng yêu 。", specialCall = 3,hand_pos = {454, 314}, hand_eff ="guide_buzhen",hand_index = 2, save = true,sound ="524.mp3",soundTime = 10})
mapArray:push({ id = 322, open_lev = 0, 	layer_name ="ArmyLayer", 			widget_name ="btn_close", 						next_step = 0, tip_pos = {250, -180}, tip =""})

mapArray:push({ id = 323,	layer_name ="MenuLayer", 			widget_name ="btn_pay", 										next_step = 324, tip_pos = {200, -150},right = true, hand_pos = {0,0}, tip ="nhớ kỹ mỗi ngày tới nơi này đánh dấu ，miễn phí trở thành VIPnga ！",sound ="",soundTime = 10})
mapArray:push({ id = 324,	layer_name ="PayLayer", 			widget_name ="btn_qiandao", 									next_step = 325, tip_pos = {-150, -150}, hand_pos = {0,0}, tip ="mỗi ngày đều khả dĩ đánh dấu nga ，đề thăng VIPđẳng cấp khả dĩ hưởng thụ rất nhiều đặc quyền ni ！",sound ="",soundTime = 10})
mapArray:push({ id = 325,	layer_name ="PayLayer", 			widget_name ="btn_vip", 										next_step = 326, tip_pos = {200,-150}, hand_pos = {0,0},right = true, tip ="đã là VIP1liễu ！đến xem có cái nào đặc quyền ！",sound ="",soundTime = 10})
mapArray:push({ id = 326,	layer_name ="VipLayer", 			widget_name ="btn_free", 										next_step = 327, tip_pos = {0, 240}, hand_pos = {0,0}, tip ="mỗi cấp VIPđều có miễn phí lễ túi ，đừng quên lĩnh yêu ！",rotation = 225,save = true, sound ="",soundTime = 10})
mapArray:push({ id = 327,	layer_name ="VipLayer", 			widget_name ="btn_close", 										next_step = 0, tip_pos = {-150, -150}, hand_pos = {0,0}, tip ="ngày hôm nay VIP1，ngày mai VIP2，VIP15còn xa sao ！",sound ="",soundTime = 10})



-------------------------------ngoạn pháp mở ra -----------------------------------------

--trận vị 4ra trận 
mapArray:push({ id = 3100, layer_name ="MenuLayer", next_step = 3101, guideType = 3, name ="hồng hoa đà chủ", image = 10103, position = 2, content ="nhân tài mới xuất hiện quả nhiên rất giỏi ，sau này thỉnh chỉ giáo nhiều hơn 。", sound ="", smile = 0})
mapArray:push({ id = 3101, layer_name ="MenuLayer", next_step = 3102, guideType = 3, name ="0", image = 0, position = 1, content ="Tổng đà chủ nói quá lời ，có thể cùng ngươi quen biết tại hạ phi thường vinh hạnh 。", sound ="", smile = 1})
mapArray:push({ id = 3102, layer_name ="MenuLayer", 			widget_name ="taskBtn",rotation = 225,		 next_step = 3103, tip_pos ={-50, 280}, tip ="mới trận vị mở ra ~chiêu mộ một mới tiểu tử bạn ra trận ba",name ="trận vị mở ra"})
mapArray:push({ id = 3103, layer_name ="TaskLayer", 			widget_name ="listPanel|getRewardBtn1", 		next_step = 3104, tip_pos = {0, -120}, tip ="trần Tổng đà chủ đã xin đợi đã lâu rồi", hand_pos = {0, 0}, specialCall = 4, save = true})
mapArray:push({ id = 3104, layer_name ="TaskLayer", 			widget_name ="closeBtn", 						next_step = 3105, tip_pos = {-20, -150}, 	tip =""})
mapArray:push({ id = 3105, layer_name ="MenuLayer", 			widget_name ="armature4",offset ={50,15,-100,-150}, next_step = 0, tip_pos ={100,-120}, tip ="điểm kích ra trận càng nhiều hiệp khách ba ！trong tửu quán khả dĩ chiêu mộ càng nhiều cao thủ ra trận nga ~", hand_pos = {50,-20}, hand_eff ="guide_hand", right = true})

--trận vị 5ra trận 
mapArray:push({ id = 3200, layer_name ="MenuLayer",			widget_name ="armature5",offset ={60,15,-100,-150}, next_step = 0, tip_pos ={60,-120}, tip ="mới trận vị mở ra ~điểm kích ra trận càng nhiều hiệp khách ba ！trong tửu quán khả dĩ chiêu mộ càng nhiều cao thủ ra trận nga ~", hand_pos = {50,-20}, hand_eff ="guide_hand", right = true, save = true,name ="trận vị mở ra"})

--hằng ngày 
mapArray:push({ id = 150,	layer_name ="MenuLayer", guideType = 1, 			widget_name ="openBtn", 			next_step = 154, picture ="ui_new/task/cj_richang.png"})
mapArray:push({ id = 154,	layer_name ="MenuLayer", 			widget_name ="openBtn", 			next_step = 151, tip_pos = {-280, -50},rotation = 45, tip ="hằng ngày nhiệm vụ ，mở ra ！mới phương thức tu luyện khoái đi thử một chút ~", hand_pos = {0,0}})
mapArray:push({ id = 151,  layer_name ="DailyTaskLayer", 			widget_name ="listPanel|getRewardBtn1", 			next_step = 0, tip_pos = {-150,-100}, tip ="thăng cấp lĩnh đạo lực cần đại lượng kinh nghiệm giá trị ，hằng ngày nhiệm vụ rộng lượng kinh nghiệm ngươi nhưng không thể bỏ qua nga ！", save = true, specialCall = 4, hand_pos = {0,0}})
--mapArray:push({ id = 152,  layer_name ="TaskLayer", 			widget_name ="listPanel|goBtn1", 			next_step = 153, tip_pos = {-150,-100}, tip ="trạc một chút đi trước ，tự động dẫn đường đến nhận chức vụ địa điểm ~", hand_pos = {0,0}})
--mapArray:push({ id = 153,	layer_name ="MissionLayer", 		widget_name ="cur_mission|btn_base", 		next_step = 0, tip_pos = {100, 210}, 	tip ="một hơi thở hoàn thành sở hữu nhiệm vụ ba ！", hand_pos = {0, 20}, right = true, specialCall = 1})

--kỳ ngộ 
mapArray:push({ id = 2301, layer_name ="MenuLayer", guideType = 1,  widget_name ="qiyuBtn",  next_step = 2302, picture ="ui_new/home/main_qiyu_btn.png"})
mapArray:push({ id = 2302,	layer_name ="MenuLayer", 			widget_name ="qiyuBtn", 			next_step = 2303, tip_pos = {-240, 60}, hand_pos = {0,10}, tip ="",save = true,rotation = 225})
mapArray:push({ id = 2303,	layer_name ="QiyuHomeLayer",		widget_name ="qiyuButton_5", 	next_step = 0	, tip_pos = {0, 200}, tip ="điểm kích tiến nhập đánh dấu mặt biên ~",hand_pos = {0, 0}})

--thương thành 
mapArray:push({ id = 2401,	layer_name ="MenuLayer", guideType = 1, widget_name ="mallBtn",	next_step = 2402, picture ="ui_new/home/main_shangcheng_btn.png"})
mapArray:push({ id = 2402,	layer_name ="MenuLayer",		widget_name ="mallBtn", 		next_step = 0	, tip_pos = {200, 190}, tip ="thương thành rốt cục mở ra lạp ~mãi mãi mãi ！", rotation = 225, save = true})
--mapArray:push({ id = 2403,	layer_name ="MallLayer", 			widget_name ="btn_gifts",		next_step = 2404	,tip_pos = {300,0}, tip ="tống ngươi một phúc lợi cảm nếu không ？~", right = true})
--mapArray:push({ id = 2404,	layer_name ="MallLayer", 			widget_name ="",				next_step = 0	, tip_pos = {650,325}, tip ="VIPcòn có cực kỳ giá trị lễ túi khả dĩ mua nga ~tiên tống ngươi một VIP0lễ túi thử vận khí một chút ba ~đi xuống trở mình một chút liền thấy lạp ~", right = true, hand_pos = {1400,-850}, hand_eff ="guide_hand"})

--bạn tốt 
mapArray:push({ id = 3300,	layer_name ="MenuLayer", guideType = 1, widget_name ="btn_friends",	next_step = 3301, picture ="ui_new/home/main_haoyou_btn.png"})
mapArray:push({ id = 3301, layer_name ="MenuLayer", widget_name ="btn_friends", next_step = 3302, tip_pos = {290,270}, tip ="điểm thử tiến nhập bạn tốt ngoạn pháp ~hảo bằng (ji)hữu đang lúc khả dĩ tặng quà cho nhau ，tỷ thí với nhau ~", rotation = 225,right = true, save = true, name ="bạn tốt hệ thống"})--
--mapArray:push({ id = 3301, layer_name ="FriendLayer", widget_name ="btn_friends", next_step = 3302, tip_pos = {180,0}, tip ="nơi này là bạn tốt liệt biểu", right = true, hand_pos = {0,0}, hand_eff ="guide_hand"})
mapArray:push({ id = 3302, layer_name ="FriendLayer", widget_name ="btn_add", next_step = 3303, tip_pos = {100,-200}, tip ="ở đây khả dĩ xin người chơi khác cho thỏa đáng hữu ，còn có đề cử bạn tốt nga ~"})
mapArray:push({ id = 3303, layer_name ="FriendLayer", widget_name ="", next_step = 0, tip_pos = {400,170}, tip ="điểm kích xin bạn tốt ，bắt đầu trên giang hồ đích hữu tình thuật lại ba ~", hand_pos = {900,30}, hand_eff ="guide_hand", rotation = 90})

--hộ giá 
--mapArray:push({ id = 3401,	layer_name ="MenuLayer", 			widget_name ="qiyuBtn", 		next_step = 3402, tip_pos = {-240, 60}, hand_pos = {0,10}, tip ="tân ngoạn pháp ：hộ giá ，mở ra ！mau tới bảo hộ hoàng thượng ，a không ，tiểu huyền Tử ！",rotation = 225,save = true, name ="hộ giá"})--
--mapArray:push({ id = 3402,	layer_name ="QiyuHomeLayer",		widget_name ="qiyuButton_4", 	next_step = 3403, tip_pos = {0, 200}, tip ="một ngày đêm cùng sở hữu 10ba thích khách đột kích ，ngoại trừ đại lượng tiền đồng còn có vật hi hữu phẩm rơi xuống nga ~",hand_pos = {0, 0}})
--mapArray:push({ id = 3403,	layer_name ="QiyuHomeLayer",		widget_name ="btn_hujia", 		next_step = 0	,tip_pos = {-240,180}, tip ="nhanh đi Kích Thoái thích khách ba ！liên tục nhiều ngày hộ giá còn có thêm vào đích Bảo rương lớn nga ~cũng không thể gián đoạn 吖！",right = true})
--mapArray:push({ id = 3403,	layer_name ="QiyuHomeLayer",		widget_name ="", 		next_step = 0	,tip_pos = {660,450}, tip ="nhanh đi Kích Thoái thích khách ba ！liên tục nhiều ngày hộ giá còn có thêm vào đích Bảo rương lớn nga ~cũng không thể gián đoạn 吖！",hand_pos = {790, 210},rotation = 90, hand_eff ="guide_hand",right = true})

--đổ thạch hệ thống 
mapArray:push({ id = 3411,	layer_name ="MenuLayer", 			widget_name ="qiyuBtn", 		next_step = 3412, tip_pos = {-240, 60}, hand_pos = {0,10}, tip ="tân ngoạn pháp ：tiền đồng thắng được bảo thạch ，khoái đi thử một chút vận may ！",rotation = 225,save = true, name ="đổ thạch"})--
mapArray:push({ id = 3412,	layer_name ="QiyuHomeLayer",		widget_name ="qiyuButton_6", 	next_step = 3413, tip_pos = {0, 200}, tip ="",hand_pos = {0, 0}})
mapArray:push({ id = 3413,	layer_name ="QiyuHomeLayer",		widget_name ="", 		next_step = 0	,tip_pos = {660,450}, tip ="",hand_pos = {790, 210},rotation = 90, hand_eff ="guide_hand",right = true})

--quần hào phổ 
mapArray:push({ id = 601,	layer_name ="MenuLayer", 			widget_name ="pvpBtn", 			next_step = 602,tip_pos = {0, 200}, 	tip ="quần hào phổ ngoạn pháp mở ra ，tranh đoạt võ lâm bá chủ vị đích hoạt động làm sao có thể bỏ qua ！", name ="quần hào phổ",sound ="009.mp3",soundTime = 3})
mapArray:push({ id = 602,	layer_name ="ActivityLayer", 		widget_name ="btn_go",				next_step = 603,tip_pos = {-220, 20},	tip ="học đủ bí tịch ，thăng giai võ học ，bố trí trận pháp ，đi khởi"})
mapArray:push({ id = 603,	layer_name ="ArenaPlayerListLayer",widget_name ="btn_refresh", 		next_step = 604,tip_pos = {-300, 150}, tip ="nếu như đối thủ thái mạnh ，không ngại nảy sinh cái mới một chút ，tục ngữ nói thật tốt ，sừ yếu phù cường ……a phi ，tránh nặng tìm nhẹ", trigger = true, hand_pos = {30, 0}, hand_eff ="guide_hand",sound ="0010.mp3",soundTime = 3, right = true})
mapArray:push({ id = 604,	layer_name ="ArenaPlayerListLayer",widget_name ="img_res_bg_1", 		next_step = 605,tip_pos = {0, -150},	tip ="mỗi lần khiêu chiến đều cần tiêu hao hé ra quần hào lệnh ，mỗi ngày chỉnh điểm 0giờ nảy sinh cái mới", hand_pos = {10, -60}, hand_eff ="guide_hand", right = true,sound ="0011.mp3",soundTime = 3})
mapArray:push({ id = 605,	layer_name ="ArenaPlayerListLayer",widget_name ="btn_duihuan", 		next_step = 606,tip_pos = {-150, -220},	tip ="nơi này là đổi thương điếm ，có thể dùng một đống vi tích phân ，mang đi một đống hi hữu đạo cụ ！", right = true,sound ="0012.mp3",soundTime = 4})
mapArray:push({ id = 606,	layer_name ="ArenaPlayerListLayer",widget_name ="panel_role1", 		next_step = 607,tip_pos = {-200, 220},	tip ="khiêu chiến thắng lợi ，thu được càng nhiều vi tích phân ，vi tích phân dùng cho đổi thưởng cho ；bài danh đề thăng ，mỗi ngày thưởng cho hội canh dày ni", hand_pos = {100, 120},sound ="0013.mp3",soundTime = 3})
mapArray:push({ id = 607,	layer_name ="ArenaOtherArmyVSLayer",widget_name ="btn_challenge", 	next_step = 609,tip_pos = {-300, 80},	tip ="hiện tại mà bắt đầu tranh đương võ lâm đứng đầu ba ！", save = true})

mapArray:push({ id = 609, layer_name ="FightUiLayer", 		widget_name ="btn_fastforward", 		next_step = 608, tip_pos = {80,-80}, 	tip ="khiêu quá chiến đấu công năng mở ra ，sở hữu đã thông quan đích trạm kiểm soát đều có thể khiêu quá chiến đấu nga",save = true,force = false, right = true, hand_eff ="guide_hand", hand_pos = {40,-40}})

mapArray:push({ id = 608,	layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 			next_step = 0, tip_pos = {-50, 220}, 	tip ="", right = true})

--long môn tiêu cục 
mapArray:push({ id = 3501,	layer_name ="MenuLayer", 			widget_name ="qiyuBtn", 			next_step = 3502, tip_pos = {-240, 60}, hand_pos = {0,10}, tip ="long môn tiêu cục khai trương lạp ！！",rotation = 225,save = true, name ="long môn tiêu cục"})--
mapArray:push({ id = 3502,	layer_name ="QiyuHomeLayer",		widget_name ="qiyuButton_3", 		next_step = 3503, tip_pos = {0, 200}, tip ="một ngày đêm khả dĩ áp phiêu năm lần ，đợi thành quả đích thì Hậu đại hiệp có thể đi ngoạn khác ngoạn pháp ~",hand_pos = {0, 0}})
mapArray:push({ id = 3503,	layer_name ="QiyuHomeLayer",		widget_name ="", 					next_step = 0, 	tip_pos = {450,250},tip ="điểm kích nảy sinh cái mới cái nút hữu cơ tỷ số thu hoạch đẳng cấp cao tiêu xa ，thu được cao cấp tiêu xa một máy ~sai ，dày đồng tiền nhất túi ~",hand_pos = {830, 200}, hand_eff ="guide_hand", rotation = 90, right = true})

--tông sư trạm kiểm soát 
mapArray:push({ id = 5001, layer_name ="MenuLayer", next_step = 5002, guideType = 3, name ="Long cô nương", image = 10279, position = 2, content ="tông sư trạm kiểm soát có rất nhiều hi hữu trang bị mảnh nhỏ và hiệp hồn ，khiêu chiến thắng lợi có thể thu được 。", sound ="", soundTime = 20})
mapArray:push({ id = 5002, layer_name ="MenuLayer", next_step = 5003, guideType = 3, name ="0", image = 0, position = 1, content ="đa tạ Long cô nương chỉ điểm 。", sound ="", soundTime = 20})
mapArray:push({ id = 5003, open_lev = 15, 	layer_name ="MenuLayer", 			widget_name ="pveBtn", 			next_step = 5004, tip_pos = {-100, 200}, 	tip ="phổ thông trạm kiểm soát không hề khiêu chiến ？lai tông sư trạm kiểm soát tiếp thu cường địch đích lễ rửa tội ba ~",name ="tông sư trạm kiểm soát"})
mapArray:push({ id = 5004, open_lev = 15, 	layer_name ="MissionLayer", 		widget_name ="btn_zongshi", 		next_step = 5005, tip_pos = {350, 100}, tip ="đánh xong nghiêm chỉnh chương đích phổ thông trạm kiểm soát sẽ mở ra cai chương đích tông sư trạm kiểm soát", hand_pos = {100,-10}, hand_eff ="guide_hand", rotation = 315})
mapArray:push({ id = 5005, open_lev = 15, 	layer_name ="MissionLayer", 		widget_name ="cur_mission|btn_base", next_step = 5006, tip_pos = {250, 50}, tip ="", specialCall = 1, hand_pos = {0,0}})
mapArray:push({ id = 5006, open_lev = 15, 	layer_name ="MissionDetailLayer", 	widget_name ="btn_attack", 		next_step = 5007, 	tip_pos = {0, 180}, 	tip ="khiêu chiến thành công khả dĩ thu được hi hữu trang bị mảnh nhỏ và hiệp hồn nga ！"})
mapArray:push({ id = 5007,					layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 			next_step = 0, tip_pos = {-50, 180}, 	tip ="", right = true, save = true})
--mapArray:push({ id = 5006,	layer_name ="MissionLayer", 		widget_name ="btn_return", 		next_step = 0, tip_pos = {250, -800}, 	tip =""})

--trang bị áp-phích 
--mapArray:push({ id = 499,	layer_name ="MenuLayer", guideType = 1, 			widget_name ="taskBtn", 			next_step = 154, picture ="ui_new/task/cj_richang.png"})
mapArray:push({ id = 500, layer_name ="MissionLayer", guideType = 2,  widget_name ="equipBtn",				 next_step = 501, picture ="ui_new/guide/img3.png",goto_name ="ui_new/guide/tiaozhuanxiao.png",save = true})
mapArray:push({ id = 501,	layer_name ="MissionLayer", 				widget_name ="btn_return", 				next_step = 504, tip_pos = {250, -800},	tip ="",next_functionId = 65})

--thành tựu lĩnh đại tua minh vương 
mapArray:push({ id = 400, layer_name ="MissionLayer", 		 widget_name ="btn_return", 	 next_step = 401, tip_pos = {150, -200}, 	tip ="lại có mới thành tựu thưởng cho khả dĩ nhận lấy ~", right = true,next_functionId = 34,save = true})
mapArray:push({ id = 401, layer_name ="MenuLayer", next_step = 402, guideType = 3, name ="đại tua minh vương", image = 10009, position = 2, content ="thí chủ phật duyến thâm hậu ，sau này tiểu tăng liền tùy ngươi tứ phương vân du ba 。", sound =""})
mapArray:push({ id = 402, layer_name ="MenuLayer", next_step = 403, guideType = 3, name ="0", image = 0, position = 1, content ="đại sư có thể đại triệt hiểu ra ，thật sự là thật đáng mừng 。", sound ="", smile = 1})
mapArray:push({ id = 403, layer_name ="MenuLayer", 			widget_name ="taskBtn",rotation = 225,		 next_step = 404, tip_pos ={-50, 280}, tip ="thành tựu thưởng cho phi thường phong phú ，nhớ kỹ đúng lúc lĩnh nga",name ="thành tựu thưởng cho"})
mapArray:push({ id = 404, layer_name ="TaskLayer", 			widget_name ="listPanel|getRewardBtn1", 		next_step = 0, tip_pos = {0, -120}, tip ="trạm kiểm soát thông quan thành tựu trung ，khả dĩ chiêu mộ đại tua minh vương yêu ！", hand_pos = {0, 0}, specialCall = 4})



--mapArray:push({ id = 502, open_lev = 15, 	layer_name ="TaskLayer", 			widget_name ="listPanel|getRewardBtn1", 			next_step = 503, tip_pos = {-150,-100}, tip ="oa (°-°)một bả kỳ quái vũ khí", hand_pos = {0,0}})
--mapArray:push({ id = 503, open_lev = 0, 	layer_name ="TaskLayer", 			widget_name ="closeBtn", 			next_step = 504, tip_pos = {250, -800}, tip ="đóng ，khứ mặc trang"})

--quần áo nón nảy trang bị 
mapArray:push({ id = 504, open_lev = 15, 	layer_name ="MenuLayer", 			widget_name ="armature1",offset ={-40,0,50,40}, next_step = 507, tip_pos = {-250, 70}, tip ="nã một thanh kiếm khẳng định đánh thắng được bàn tay trần ~khứ mặc trang ba ~", hand_pos = {0, 90},sound ="24.mp3",soundTime = 2})
--mapArray:push({ id = 505, open_lev = 0, 	layer_name ="RoleInfoLayer", 		widget_name ="",					next_step = 506, tip_pos = {650, 400},	tip ="", hand_pos = {240, 240}})
--mapArray:push({ id = 506, open_lev = 0, 	layer_name ="RoleInfoLayer", 		widget_name ="img_zhiye", 			next_step = 507, tip_pos = {300, -150},	tip ="bất đồng nghề nghiệp hiệp khách hội không có cùng loại hình kỹ năng cùng với thuộc tính lớn", hand_pos = {80, -60}, hand_eff ="guide_hand"})
mapArray:push({ id = 507, open_lev = 0, 	layer_name ="RoleInfoLayer", 		widget_name ="panel_equip_1|img_bg",next_step = 508, tip_pos = {400, -150}, tip ="“+”đại biểu có thể quần áo nón nảy đích trang bị", hand_pos = {0,10}})
mapArray:push({ id = 508, open_lev = 0, 	layer_name ="RoleInfoLayer", 		widget_name ="btn_zhuangbei", 		next_step = 509, tip_pos = {150, 150}, 	tip ="điểm kích “mặc trang ”，trang bị lựa đích vũ khí",sound ="25.mp3",soundTime = 5,save = true})
mapArray:push({ id = 509, open_lev = 0, 	layer_name ="RoleInfoLayer", 		widget_name ="btn_close", 			next_step = 510, tip_pos = {150, -200}, tip ="", next_functionId = 67})

--trang bị cường hóa 
mapArray:push({ id = 510, open_lev = 15, guideType = 1, 	layer_name ="MenuLayer", 			widget_name ="equipBtn", 			next_step = 5102, picture ="ui_new/home/main_zhuangbei_btn.png"})
mapArray:push({ id = 5102, open_lev = 15, 	layer_name ="MenuLayer", 			widget_name ="equipBtn", 			next_step = 511, tip_pos = {210, 220},	tip ="giang hồ hiểm ác đáng sợ ，tăng trưởng sức chiến đấu mới là trọng điểm ！ta còn có tiệp kính “trang bị cường hóa ”yêu ~",rotation = 225 })
mapArray:push({ id = 511, open_lev = 0, 	layer_name ="SmithyMainLayer", 	widget_name ="btn_other",			next_step = 512, tip_pos = {270,-100},	tip ="điểm nhãn ，còn có thể lựa chọn làm tiền ra trận hiệp khách ，chuyên môn xử lý cực phẩm trang bị", right = true,save = true})
mapArray:push({ id = 512, open_lev = 0, 	layer_name ="SmithyMainLayer", 	widget_name ="panel_list", 		next_step = 516, tip_pos = {0, 170},	tip ="lựa vũ khí", hand_pos = {50,400}})
mapArray:push({ id = 513, open_lev = 0, 	layer_name ="EquipDetailsDialog", 	widget_name ="btn_qianghua", 		next_step = 516, tip_pos = {0, 180},	tip ="thỉnh trạc ở đây khứ cường hóa ，không thể trạc ta yêu", hand_pos = {0, 0}, right = true,sound ="26.mp3",soundTime = 5})
--mapArray:push({ id = 514, open_lev = 0, 	layer_name ="SmithyBaseLayer",		widget_name ="", 					next_step = 515, tip_pos = {550, 200},	tip ="nơi này là trước mặt trang bị thuộc tính", hand_pos = {350, 100}, hand_eff ="guide_hand", right = true})
--mapArray:push({ id = 515, open_lev = 0, 	layer_name ="SmithyBaseLayer",		widget_name ="", 					next_step = 516, tip_pos = {500, 280},	tip ="nơi này là cường hóa đích đẳng cấp và tăng lên thuộc tính",  hand_pos = {750, 300}, hand_eff ="guide_hand"})
mapArray:push({ id = 516, open_lev = 0, 	layer_name ="SmithyBaseLayer", 	widget_name ="", 					next_step = 0,  tip_pos = {430, 200},	tip ="trang bị cường hóa đẳng cấp cao nhất cân đội ngũ đẳng cấp nóc đát ~", hand_pos = {900, 60}, hand_eff ="guide_hand"})

--trang bị tinh luyện 
mapArray:push({ id = 1401,	layer_name ="MenuLayer", 			widget_name ="equipBtn",rotation = 225, 			next_step = 1402, tip_pos = {230, 190}, tip ="theo ngoạn pháp độ khó tăng ，vũ khí trên tay thiếu dùng ba ？hắc hắc ，nói cho ngươi biết một bí mật nhỏ ，vũ khí chặt chẽ khả dĩ cực lớn lượng đề thăng trang bị đích phụ gia thuộc tính trị số nga ~",sound ="50.mp3",soundTime = 3, name ="trang bị tinh luyện"})
mapArray:push({ id = 1402,	layer_name ="SmithyMainLayer", 	widget_name ="btn_other",			next_step = 1403, tip_pos = {270,-100},	tip =""})
mapArray:push({ id = 1403,	layer_name ="SmithyMainLayer", 	widget_name ="panel_list", 		next_step = 1405, tip_pos = {0, 170},	tip ="", hand_pos = {80,400}})
--mapArray:push({ id = 1404,	layer_name ="EquipDetailsDialog", 	widget_name ="btn_qianghua", 		next_step = 1405, tip_pos = {0, 200},	tip ="", hand_pos = {0, 0}, right = true})
mapArray:push({ id = 1405,	layer_name ="SmithyBaseLayer", 	widget_name ="tab_4", 				next_step = 1406, tip_pos = {0, -200},	tip ="trạc ở đây tiến nhập chặt chẽ mặt biên ~", save = true})
mapArray:push({ id = 1406,	layer_name ="SmithyBaseLayer",		widget_name ="", 					next_step = 1407, tip_pos = {550, 200},	tip ="ở đây biểu hiện trước mặt trang bị phụ gia thuộc tính đích nguyên trị số ，phụ gia thuộc tính đối cai hiệp khách toàn bộ trang bị tổng trị số có hiệu lực", hand_pos = {250, 180}, hand_eff ="guide_hand",rotation = 45})
mapArray:push({ id = 1407,	layer_name ="SmithyBaseLayer",		widget_name ="", 					next_step = 1408, tip_pos = {500, 250},	tip ="ở đây khả dĩ dự lãm tinh luyện hậu thuộc tính trị số đích đề thăng", hand_pos = {750, 300}, hand_eff ="guide_hand"})
mapArray:push({ id = 1408,	layer_name ="SmithyBaseLayer", 	widget_name ="", 					next_step = 1409, tip_pos = {460, 150},	tip ="tinh luyện hậu trang bị có bao nhiêu con thuộc tính trị số hội phân biệt ngẫu nhiên tăng giảm ，sử dụng khóa lại công năng khả dĩ phòng ngừa trị số giảm thiểu", hand_pos = {820, 80},rotation = 90, hand_eff ="guide_hand",sound ="51.mp3",soundTime = 3})
mapArray:push({ id = 1409, layer_name ="SmithyBaseLayer", 	widget_name ="", 					next_step =0, 	tip_pos ={265,150}, tip ="tinh luyện mãn thuộc tính hậu ，cần đột phá thạch lai đột phá hạn mức cao nhất ，hạn mức cao nhất thụ trước mặt đội ngũ đẳng cấp hạn chế ，thiếu hiệp nỗ lực lên luyện tựu thần binh lợi khí ba ~", hand_pos = {610,80}, hand_eff ="guide_hand"})


--trang bị thăng tinh 
mapArray:push({ id = 2001,	layer_name ="MenuLayer", 			widget_name ="equipBtn",rotation = 225, 			next_step = 2002, tip_pos = {200, 190}, tip ="trang bị thăng tinh mở ra ！theo ta tìm tòi huyền bí ba ~", name ="trang bị thăng tinh"})
mapArray:push({ id = 2002,	layer_name ="SmithyMainLayer", 	widget_name ="btn_other",			next_step = 2003, tip_pos = {270,-100},	tip =""})
mapArray:push({ id = 2003,	layer_name ="SmithyMainLayer", 	widget_name ="panel_list", 				next_step = 2005, tip_pos = {0,170},	tip ="", hand_pos = {80,400}})
--mapArray:push({ id = 2004,	layer_name ="EquipDetailsDialog", 	widget_name ="btn_qianghua", 		next_step = 2005, tip_pos = {0, 200},	tip ="", hand_pos = {0, 0}, right = true})
mapArray:push({ id = 2005,	layer_name ="SmithyBaseLayer", 	widget_name ="tab_2", 				next_step = 2006, tip_pos = {0, -300},	tip ="trang bị thăng tinh khả dĩ đề thăng cơ sở giá trị và lớn giá trị ，như vậy giống nhau cường hóa đích vũ khí cũng sẽ tăng lên gấp bội chiến lực liễu ！", save = true})
mapArray:push({ id = 2006,	layer_name ="SmithyBaseLayer", 	widget_name ="", 		next_step = 2007,	tip_pos = {300, 220},	tip ="ở chỗ này khả dĩ tuyển trạch thăng tinh đích tiêu hao tài liệu ，tinh thiết và cấp thấp trang bị thị chủ yếu tài liệu", hand_eff ="guide_hand", hand_pos = {530, 210}})
mapArray:push({ id = 2007,	layer_name ="SmithyBaseLayer", 	widget_name ="", 		next_step = 0,	tip_pos = {600, 200},	tip ="tuyển trạch hảo tài liệu hậu ，điểm kích ở đây cấp mục tiêu trang bị thăng tinh ba ~", hand_eff ="guide_hand", hand_pos = {900, 50}})

--bảo thạch tương khảm 
mapArray:push({ id = 2211,	layer_name ="MenuLayer", 			widget_name ="equipBtn",rotation = 225, 			next_step = 2212, tip_pos = {200, 190}, tip ="sưu tập đáo thật nhiều sáng trông suốt bảo thạch 吖！nhanh đi tương khảm bảo thạch ba ~", name ="bảo thạch tương khảm"})
mapArray:push({ id = 2212,	layer_name ="SmithyMainLayer", 	widget_name ="btn_other",			next_step = 2213, tip_pos = {270,-100},	tip =""})
mapArray:push({ id = 2213,	layer_name ="SmithyMainLayer", 	widget_name ="panel_list", 		next_step = 2215, tip_pos = {0, 170},	tip ="", hand_pos = {80,400}})
--mapArray:push({ id = 2214,	layer_name ="EquipDetailsDialog", 	widget_name ="btn_qianghua", 	next_step = 2215, tip_pos = {0, 200},	tip ="", hand_pos = {0, 0}, right = true})
mapArray:push({ id = 2215,	layer_name ="SmithyBaseLayer", 	widget_name ="tab_7", 				next_step = 2216, tip_pos = {0, -150},	tip ="bảo thạch tương khảm đáo trang bị thượng khả dĩ tăng thuộc tính ，điểm tiến tương khảm mặt biên ~",save = true})
mapArray:push({ id = 2216,	layer_name ="SmithyBaseLayer",		widget_name ="", 					next_step = 2217, tip_pos = {600, 200},	tip ="ở đây biểu hiện chính là trước mặt trang bị thuộc tính", hand_pos = {310, 120}, hand_eff ="guide_hand"})
mapArray:push({ id = 2217,	layer_name ="SmithyBaseLayer", 	widget_name ="", 		next_step = 2218, tip_pos = {220, 280},	tip ="ở chỗ này khả dĩ tuyển trạch yếu tương khảm đích bảo thạch ，trang bị bất đồng bộ vị cần bảo thạch không đồng dạng như vậy nga ~", hand_pos = {530, 320}, hand_eff ="guide_hand",sound ="48.mp3",soundTime = 4})
mapArray:push({ id = 2218,	layer_name ="SmithyBaseLayer", 	widget_name ="", 		next_step = 2205, tip_pos = {750, 300},	tip ="điểm kích “tương khảm ”hậu ，trang bị tựu chính mình bảo thạch mang vào thuộc tính ~phối hợp các loại lớn và tỉ lệ phần trăm ，nhân thủ thần khí không phải là mộng ！", hand_eff ="guide_hand", rotation = 90, hand_pos = {910, 40}})--,sound ="49.mp3",soundTime = 3
--mapArray:push({ id = 2205,	layer_name ="SmithyBaseLayer", 	widget_name ="tab_8", 	next_step = 2206, tip_pos = {-80, -300},tip ="hợp thành công năng khả dĩ tương cấp thấp bảo thạch hợp thành cao cấp bảo thạch"})
--mapArray:push({ id = 2206,	layer_name ="SmithyBaseLayer", 	widget_name ="", 		next_step = 2207, tip_pos = {300, 220},	tip ="ở chỗ này tuyển trạch yếu hợp thành đích cấp thấp bảo thạch ，chú ý yếu bốn người bảo thạch tài năng hợp thành một cao cấp bảo thạch ~", hand_eff ="guide_hand", hand_pos = {510, 380}})
--mapArray:push({ id = 2207,	layer_name ="SmithyBaseLayer", 	widget_name ="", 		next_step = 0,	tip_pos = {430, 130},	tip ="điểm kích hợp thành cái nút liền có thể hợp thành cao cấp bảo thạch liễu", hand_eff ="guide_hand", hand_pos = {740,40}})


--vô lượng sơn 
mapArray:push({ id = 800, layer_name ="MenuLayer", guideType = 2,  widget_name ="pvpBtn",  next_step = 801, picture ="ui_new/guide/img4.png",goto_name ="ui_new/guide/tiaozhuanxiao.png"})
mapArray:push({ id = 801, open_lev = 0, 	layer_name ="MenuLayer", 			widget_name ="pvpBtn", 			next_step = 802, tip_pos = {40, 200},  tip ="vô lượng sơn mở ra ，thật là cao thật là cao a ！！dương một chút tay áo tựu quát đảo một mảnh cao thủ a ！！",name ="khiêu chiến ：vô lượng sơn",soundTime = 4})
mapArray:push({ id = 802, open_lev = 0, 	layer_name ="ActivityLayer", 		widget_name ="btnTableView", offset = {0,10,0,-45},		next_step = 803, tip_pos = {300, 280},	tip ="khoái tiến vào vô lượng sơn cảm thụ cao thủ khí tức ba ~", sound ="0014.mp3",soundTime = 5, hand_pos = {220, 85}})
mapArray:push({ id = 803, open_lev = 0, 	layer_name ="ActivityLayer", 		widget_name ="btn_go",				next_step = 804, tip_pos = {-270, 20},	tip ="yếu trang bị đến tận răng ，chúng ta tài năng chưa từng có từ trước đến nay nga ！"})
mapArray:push({ id = 804, open_lev = 0, 	layer_name ="ClimbMountainListLayer",widget_name ="txt_description", 	next_step = 805, tip_pos = {-170, -150},offset ={0,0,0,50},tip ="điểm kích mỗi một tằng đều có thể kiểm tra địch quân cơ bản tin tức ，nhất định phải sớm bày binh bố trận nga ！", hand_pos = {300, -70}, hand_eff ="guide_hand", trigger = true,sound ="0015.mp3",soundTime = 3})
mapArray:push({ id = 805, open_lev = 0, 	layer_name ="ClimbMountainListLayer",widget_name ="txt_drop", 		next_step = 806, tip_pos = {-270, -150}, offset ={-10,-200,30,200},tip ="vô lượng núi cao ，thưởng cho cũng đôi thật là tốt cao 吖！còn có thể kiểm tra bản tằng đích thưởng cho nột", hand_pos = {100, -180}, hand_eff ="guide_hand",sound ="0016.mp3",soundTime = 5})
mapArray:push({ id = 806, open_lev = 0, 	layer_name ="ClimbMountainListLayer",widget_name ="btn_attack", 		next_step = 0, tip_pos = {-400,200},	tip ="lượng kiếm ba ！thiếu hiệp ！"	, save = true})
-- mapArray:push({ id = 807, open_lev = 0, 	layer_name ="FightResultLayer", 	widget_name ="leaveBtn", 			next_step = 0, tip_pos = {-50, 180}, 	tip ="", right = true, save = true})

--vô lượng sơn vị đánh xong hoặc đả thâu rời khỏi 	X
--mapArray:push({ id = 811, layer_name ="ClimbMountainListLayer", widget_name ="leaveBtn", next_step =812, tip_pos ={0,0}, tip ="", hand_pos = {0,0}})
--mapArray:push({ id = 812, layer_name ="ActivityLayer", 			widget_name ="leaveBtn", next_step = 0, tip_pos ={0,0}, tip ="", hand_pos = {0,0}, save = true})

--vai kinh mạch 
mapArray:push({ id = 901, open_lev = 0, 	layer_name ="MenuLayer", 		 widget_name ="armature1", offset ={-40,0,50,40}, 			next_step = 902, tip_pos = {-250, 70},	tip ="đả thông hai mạch nhâm đốc ，vai kinh mạch mở ra ！khống chế bách phát bách trúng ，phòng ngự Lăng Ba Vi Bộ ，tất cả đều ở kinh mạch", hand_pos = {0, 80}})
mapArray:push({ id = 902, open_lev = 0, 	layer_name ="RoleInfoLayer", 		widget_name ="btn_jm", 			next_step = 905, tip_pos = {-300, 100}, 	tip ="bất đồng chức nghiệp đối ứng bồi dưỡng kinh mạch thuộc tính không giống với ，chỉ có ở kinh mạch tài năng đại lượng tăng bạo đánh trúng mục tiêu chờ đặc thù thuộc tính",sound ="0018.mp3",soundTime = 4,save = true})
--mapArray:push({ id = 903, open_lev = 0, 	layer_name ="MeridianLayer", 		widget_name ="", 					next_step = 904, tip_pos = {400, 120},	tip ="ở đây biểu hiện kinh mạch tổng đích thuộc tính thêm được", hand_pos = {280, 70}, hand_eff ="guide_hand",trigger = true, right = true})
--mapArray:push({ id = 904, open_lev = 0, 	layer_name ="MeridianLayer", 		widget_name ="", 					next_step = 905, tip_pos = {450, 400},	tip ="ở đây tuyển trạch cần thăng cấp đích kinh mạch", hand_pos = {550, 380}, hand_eff ="guide_hand"})
mapArray:push({ id = 905, open_lev = 0, 	layer_name ="MeridianLayer", 		widget_name ="", 					next_step = 906, tip_pos = {700, 500},	tip ="nơi này là ngươi có chân khí", hand_pos = {850, 510}, rotation = 90, hand_eff ="guide_hand"})
mapArray:push({ id = 906, open_lev = 0, 	layer_name ="MeridianLayer", 		widget_name ="", 					next_step = 907, tip_pos = {610, 350},	tip ="ở đây còn lại là cai hiệp khách kinh mạch đích cụ thể thuộc tính", hand_pos = {800, 250}, hand_eff ="guide_hand"})
mapArray:push({ id = 907, open_lev = 0, 	layer_name ="MeridianLayer", 		widget_name ="btn_level_up", 		next_step = 0,  tip_pos = {-300, 100},	tip ="còn chờ cái gì bóp ，mau đánh thông hai mạch nhâm đốc ，trùng huyệt ！mỗi ngày đều muốn tới bồi dưỡng kinh mạch yêu ~", sound ="0019.mp3",soundTime = 4})

--Nhạn Môn Quan 
mapArray:push({ id = 1601,	layer_name ="MenuLayer", 			widget_name ="pvpBtn", 			next_step = 1602,tip_pos = {40, 200},  tip ="một kẻ làm quan ，Nhạn Môn Quan khai ，đối đãi ngươi lai chiến ！", name ="Nhạn Môn Quan"})
mapArray:push({ id = 1602,	layer_name ="ActivityLayer", 		widget_name ="btnTableView", offset = {0,10,0,-45},		next_step = 1603,tip_pos = {360, 280},	tip ="Nhạn Môn Quan do dịch tiến nan ，thế nào dĩ có hạn hiệp khách đánh nhau ba mươi quan lai thu được đại lượng đồng tiền và bảo thạch loại bảo vật ，Đại hiệp ngươi nhưng phải thật tốt tính toán 吖", hand_pos = {362, 85}, save = true,sound ="0020.mp3",soundTime = 5})
mapArray:push({ id = 1603,	layer_name ="ActivityLayer", 		widget_name ="btn_go",				next_step = 0,  tip_pos = {-270, 20},	tip ="tố thật đầy đủ chuẩn bị ，toàn thể đi tới ！vượt qua ải ！",sound ="43.mp3",soundTime = 5})

--bang phái 
--mapArray:push({ id = 3600,	layer_name ="MenuLayer", guideType = 1, widget_name ="btn_faction",	next_step = 3601, picture ="ui_new/home/main_bangpai_btn.png"})
--mapArray:push({ id = 3601,	layer_name ="MenuLayer", 			widget_name ="btn_faction", 		next_step = 0, tip_pos = {250, 270}, 	tip ="hô bằng hoán hữu ，chỉ vì lúc này ！uống máu ăn thề ，bang phái hùng khởi ！", rotation = 225, right = true, name ="bang phái", save = true})

--ma ha nhai 
mapArray:push({ id = 1001,	layer_name ="MenuLayer", 			widget_name ="pvpBtn", 			next_step = 1002,tip_pos = {40, 200},  tip ="nhất phương bá chủ ，đỉnh tạo cực ，ma ha nhai thượng chờ ngươi lai chiến ！", name ="ma ha nhai"})
mapArray:push({ id = 1002,	layer_name ="ActivityLayer", 		widget_name ="btnTableView", offset = {0,10,0,-45},		next_step = 1003,tip_pos = {500, 280},	tip ="mỗi ngày mở ra bất đồng khiêu chiến chủng loại ，mỗi một phe đều là chiến thuật và kỹ xảo thượng đăng phong tạo cực bá chủ ，toàn diệt cũng khóc nhè yêu ~", save = true, hand_pos = {505, 85}})
mapArray:push({ id = 1003,	layer_name ="ActivityLayer", 		widget_name ="btn_go",				next_step = 1004,tip_pos = {-270, 20},	tip ="một ngày chiến thắng là được thu được số lớn hiệp khách mảnh nhỏ",sound ="0023.mp3",soundTime = 4})
mapArray:push({ id = 1004,	layer_name ="ClimbCarbonListLayer",widget_name ="", 		next_step = 0,tip_pos = {280, 320},	tip ="mỗi loại tổ hợp đều có cực hạn đích chiến đấu hình thức ，chú ý tuyển trạch thích hợp tiểu tử bạn tiến hành kỹ năng và trận pháp đích phối hợp nga ~",sound ="45.mp3",soundTime = 5, hand_pos = {2000, 3000}})

--bảo thạch hợp thành 
--mapArray:push({ id = 1,	layer_name ="MenuLayer", 			widget_name ="equipBtn",rotation = 180, 			next_step = 0, tip_pos = {200, 190}, tip ="sưu tập đáo thật nhiều sáng trông suốt bảo thạch 吖！nhanh đi hợp thành bảo thạch ba ~", name ="bảo thạch hợp thành"})
--mapArray:push({ id = 1,	layer_name ="SmithyMainLayer", 	widget_name ="btn_other",			next_step = 0, tip_pos = {270,-100},	tip =""})
--mapArray:push({ id = 1,	layer_name ="SmithyMainLayer", 	widget_name ="panel_list", 				next_step = 0, tip_pos = {0, 170},	tip ="", hand_pos = {80,400}})
--mapArray:push({ id = 1,	layer_name ="EquipDetailsDialog", 	widget_name ="btn_qianghua", 		next_step = 0, tip_pos = {0, 200},	tip ="", hand_pos = {0, 0}, right = true})
--mapArray:push({ id = 1,	layer_name ="SmithyBaseLayer", 	widget_name ="tab_6", 				next_step = 0, tip_pos = {-80, -300},	tip ="hợp thành công năng khả dĩ tương cấp thấp bảo thạch hợp thành cao cấp bảo thạch",save = true})
--mapArray:push({ id = 1,	layer_name ="SmithyBaseLayer", 	widget_name ="", 		next_step = 0,	tip_pos = {300, 220},	tip ="ở chỗ này tuyển trạch yếu hợp thành đích cấp thấp bảo thạch ，chú ý yếu bốn người bảo thạch tài năng hợp thành một cao cấp bảo thạch ~", hand_eff ="guide_hand", hand_pos = {510, 380}})
--mapArray:push({ id = 1,	layer_name ="SmithyBaseLayer", 	widget_name ="", 		next_step = 0,	tip_pos = {430, 130},	tip ="điểm kích hợp thành cái nút liền có thể hợp thành cao cấp bảo thạch liễu", hand_eff ="guide_hand", hand_pos = {740,40}})

--thủ sung hoạ báo 
--mapArray:push({ id = 2500,	layer_name ="MissionLayer", 		widget_name ="btn_return", 		next_step = 0})
--mapArray:push({ id = 2501, layer_name ="MissionLayer", guideType = 2,   next_step = 0, picture ="ui_new/guide/img1.png",goto_name ="ui_new/guide/tiaozhuanxiao.png",taskType = 1001,save = true, isgray = true, close_btn = true})--id16

--mapArray:push({ id = 2502, layer_name ="MissionLayer", guideType = 2,   next_step = 0, picture ="ui_new/guide/img2.png",goto_name ="ui_new/guide/tiaozhuanxiao.png",taskType = 1002,save = true, isgray = true, close_btn = true})--id17

--đứng hàng thứ 
mapArray:push({ id = 2601, layer_name ="MenuLayer", guideType = 1,  widget_name ="btn_paihang",  next_step = 0, picture ="ui_new/home/main_paihang_btn.png",save = true })

--hiệp khách quy ẩn 
--mapArray:push({ id = 2701, layer_name ="MenuLayer", 		widget_name ="btn_change", next_step = 2706, tip_pos ={0,0}, tip ="",rotation = 225, hand_pos = {-20,50}})
mapArray:push({ id = 2701, layer_name ="MenuLayer", 		widget_name ="zhaomuBtn", 	next_step = 2702, tip_pos = {180, 270}, tip ="tiến nhập tửu quán ~", hand_pos = {-10,10},rotation = 225, right = true})
mapArray:push({ id = 2702,	layer_name ="RecruitLayer", 	widget_name ="btn_guiyin", next_step = 2703, tip_pos = {-250,-80}, tip ="nơi này là hiệp khách quy ẩn đích nhập khẩu ~", rotation = 45, save = true})
mapArray:push({ id = 2703, layer_name ="HermitLayer",		widget_name ="btn_fire", 	next_step = 2704, tip_pos = {180,-150}, tip ="ở đây khả dĩ tương dư thừa hiệp khách tiến hành quy ẩn xong hiệp nghĩa giá trị", hand_pos = {100,-50}, right = true, hand_eff ="guide_hand"})
mapArray:push({ id = 2704, layer_name ="HermitLayer",		widget_name ="btn_rebirth", next_step = 2705, tip_pos = {300,-100}, tip ="ở đây khả dĩ tương bồi dưỡng trôi qua hiệp khách sống lại thu về bồi dưỡng tài nguyên", hand_pos = {100,-50}, right = true, hand_eff ="guide_hand"})
mapArray:push({ id = 2705, layer_name ="HermitLayer",		widget_name ="btn_shop", 	next_step = 0, 	tip_pos = {330,150}, 	tip ="hiệp khách thương thành có thể dùng hiệp nghĩa giá trị đổi hiệp khách hồn phách nga ~", hand_pos = {150,0}, rotation = 320, hand_eff ="guide_hand"})

--kỳ nguyện hệ thống 
--mapArray:push({ id = 2701, layer_name ="MenuLayer", 		widget_name ="btn_change", next_step = 2706, tip_pos ={0,0}, tip ="",rotation = 225, hand_pos = {-20,50}})
mapArray:push({ id = 2711, layer_name ="MenuLayer", 		widget_name ="zhaomuBtn", 	next_step = 2712, tip_pos = {180, 270}, tip ="tiến nhập tửu quán ~", hand_pos = {-10,10},rotation = 225, right = true})
mapArray:push({ id = 2712,	layer_name ="RecruitLayer", 	widget_name ="btn_qiyuan", next_step = 0, tip_pos = {-250,-80}, tip ="nơi này là kỳ nguyện hệ thống nhập khẩu ~", rotation = 45, save = true})

--thay đổi diễn viên 
--mapArray:push({ id = 2701, layer_name ="MenuLayer", 		widget_name ="btn_change", next_step = 2706, tip_pos ={0,0}, tip ="",rotation = 225, hand_pos = {-20,50}})
mapArray:push({ id = 2721, layer_name ="MenuLayer", 		widget_name ="btn_touxiang", next_step = 2722, tip_pos = {180, 270}, tip ="mở diễn viên tin tức mặt bản ~", hand_pos = {-10,10},rotation = 225, right = true})
mapArray:push({ id = 2722,	layer_name ="MainPlayerLayer", 	widget_name ="txt_equip_max", 		offset = {-233,128,0,20},	next_step = 2723, tip_pos = {0,0}, 	tip ="ở đây khả dĩ thay đổi diễn viên",right = true,hand_eff ="guide_hand", hand_pos = {-0, 100}})
mapArray:push({ id = 2723,	layer_name ="MainPlayerLayer", 	widget_name ="txt_equip_max", 		offset = {-233,78,0,20},	next_step = 0, tip_pos = {0,0}, 	tip ="ở đây khả dĩ thay đổi hình cái đầu",right = true,hand_eff ="guide_hand", hand_pos = {-0, 50}})


--thế giới BOSS
mapArray:push({ id = 3001, layer_name ="MenuLayer", 				widget_name ="pvpBtn",  	next_step = 3002, tip_pos ={40,200}, tip ="rơi vào tà ma chi đạo đích tà phái nhân vật ý muốn khống chế võ lâm ，các đại hiệp mau tới vây công giá ác nhân ！", right = true, name ="phục ma lục"})
mapArray:push({ id = 3002, layer_name ="ActivityLayer", 			widget_name ="btnTableView", offset = {0,10,0,-45}, next_step = 3003, tip_pos ={530,260}, tip ="tẩu hỏa nhập ma hiệp khách thuộc tính tăng nhiều ，miễn dịch tuyệt đại bộ phân dị thường ；tức giận nhất mãn ，thả ra kỹ năng mang đến vết thương trí mệnh hại ；còn có siêu cường phòng ngự hiệp khách phản kích đả thương địch thủ", hand_pos = {652, 85}, save = true, specialCall = 9})
mapArray:push({ id = 3003, layer_name ="ActivityLayer", 			widget_name ="btn_go",		next_step = 0,  tip_pos = {-290, -20},	tip ="làm sao phối hợp hiệp khách và kỹ năng ，ở thương tổn bảng xếp hạng nhất tranh hàng đầu thu được càng nhiều thưởng cho ，Đại hiệp ta xem hảo ngươi yêu ~"})

--trợ chiến 
mapArray:push({ id = 3700, layer_name ="MenuLayer", widget_name ="roleBtn", next_step = 3701, tip_pos ={100,320}, tip ="trợ chiến mở ra lạp ~ngươi nghĩ tố Đoàn công tử sau lưng tiểu nữ nhân sao ？", hand_pos = {0,0},rotation = 225, right = true})
mapArray:push({ id = 3701, layer_name ="ArmyLayer", widget_name ="assistFightView|bg", next_step = 3702, tip_pos ={400,50}, tip ="điểm kích trợ chiến lan nhưng kiểm tra dữ ra trận hiệp khách hữu duyên người ，mặc dù không ra trận cũng có thể đi qua trợ chiến kích hoạt duyên phận", hand_pos = {0,0}, save = true})
mapArray:push({ id = 3702, layer_name ="AssistFightLayer", widget_name ="bg_zhenrong|z1", next_step = 0, tip_pos ={-230,0}, tip ="các trợ chiến vị mở ra điều kiện bất đồng ，mở ra hậu dữ ra trận hiệp khách hữu duyên đích hiệp khách gặp phải “duyến ”tự Ký hiệu", hand_pos = {0,0}})

--mạch lạc 
mapArray:push({ id = 3801,	layer_name ="MenuLayer", 			widget_name ="equipBtn", 			next_step = 3802, tip_pos = {230, 190}, tip ="trang bị ngẫu nhiên sanh thành đích thuộc tính không hợp tâm ý ？khoái tới sử dụng mạch lạc chế tạo vừa lòng đẹp ý đích thần binh lợi khí ba ~", name ="trang bị trui luyện",rotation = 225})
mapArray:push({ id = 3802,	layer_name ="SmithyMainLayer", 	widget_name ="btn_other",			next_step = 3803, tip_pos = {270,-100},	tip =""})
mapArray:push({ id = 3803,	layer_name ="SmithyMainLayer", 	widget_name ="panel_list", 		next_step = 3804, tip_pos = {0, 170},	tip ="", hand_pos = {80,400}})
mapArray:push({ id = 3804,	layer_name ="SmithyBaseLayer", 	widget_name ="tab_3", 				next_step = 3805, tip_pos = {0, -200},	tip ="trạc ở đây tiến nhập mạch lạc mặt biên ~", save = true})
mapArray:push({ id = 3805,	layer_name ="SmithyBaseLayer",		widget_name ="", 					next_step = 3806, tip_pos = {550, 200},	tip ="ở đây biểu hiện trước mặt trang bị nguyên phụ gia thuộc tính ，nguyên phụ gia thuộc tính nếu dĩ tinh luyện sau đó bảo tồn cai thuộc tính đích tinh luyện thêm được giá trị", hand_pos = {250, 120}, hand_eff ="guide_hand", right = true,rotation = 48})
mapArray:push({ id = 3806, layer_name ="SmithyBaseLayer", 	widget_name ="", 					next_step = 3807, 	tip_pos ={440,200}, tip ="ở đây khả dĩ tập trung ngươi cần thuộc tính ，như vậy sẽ không sợ rửa đi chính cần thuộc tính ~", hand_pos = {770,380},rotation = 90, hand_eff ="guide_hand"})
mapArray:push({ id = 3807,	layer_name ="SmithyBaseLayer",		widget_name ="", 					next_step = 0, tip_pos = {580, 200},	tip ="mạch lạc hậu tân lấy được thuộc tính tinh luyện trị giá là mới bắt đầu giá trị ，Đại hiệp khoái đi thử một chút trang bị mạch lạc ba ~", hand_pos = {770, 70}, hand_eff ="guide_hand",rotation = 90})

--phù hợp 
mapArray:push({ id = 3900, layer_name ="MenuLayer", widget_name ="roleBtn", next_step = 3901, tip_pos ={220,160}, tip ="hiệp khách trợ chiến không riêng chích có duyên phận lạp ，đi qua phù hợp năng sử hiệp khách tự thân thuộc tính cũng sản sinh toàn bộ đội thêm được ！", hand_pos = {0,0},rotation = 225, right = true})
mapArray:push({ id = 3901, layer_name ="ArmyLayer", widget_name ="assistFightView|bg", next_step = 3902, tip_pos ={400,50}, tip ="điểm kích trợ chiến lan ，tiến nhập mở ra phù hợp đích mới tinh trợ chiến mặt biên ~", hand_pos = {0,0}, save = true})
mapArray:push({ id = 3902, layer_name ="AssistFightLayer", widget_name ="btn_qihe", next_step = 3903, tip_pos ={-230,0}, tip ="một có duyên phận đích hiệp khách đi qua phù hợp cũng có thể cấp toàn bộ đội tăng thuộc tính ，trợ chiến phối hợp càng nhiều dạng ~", hand_pos = {0,0}})
mapArray:push({ id = 3903, layer_name ="AssistAgreeLayer", widget_name ="", next_step = 0, tip_pos ={460,230}, tip ="mỗi một một trợ chiến vị phù hợp sau khi thành công đối ứng một loại thuộc tính thêm được ，đề thăng phù hợp tiêu hao câu ngọc", hand_pos = {870,220}, hand_eff ="guide_hand"})

--đúc lại 
mapArray:push({ id = 4001,	layer_name ="MenuLayer", 			widget_name ="equipBtn", 			next_step = 4002, tip_pos = {230, 190}, tip ="cảm giác trang bị thêm chiến lực không ảnh hưởng tới chiến cuộc ？đi thử một chút trang bị đúc lại ba ~", name ="trang bị đúc lại",rotation = 225})
mapArray:push({ id = 4002,	layer_name ="SmithyMainLayer", 	widget_name ="btn_other",			next_step = 4003, tip_pos = {270,-100},	tip =""})
mapArray:push({ id = 4003,	layer_name ="SmithyMainLayer", 	widget_name ="panel_list", 		next_step = 4004, tip_pos = {0, 170},	tip ="", hand_pos = {80,400}})
mapArray:push({ id = 4004,	layer_name ="SmithyBaseLayer", 	widget_name ="tab_5", 				next_step = 4005, tip_pos = {0, -200},	tip ="đúc lại mặt biên nhập khẩu ở đây ~", save = true})--
mapArray:push({ id = 4005,	layer_name ="SmithyBaseLayer",		widget_name ="", 					next_step = 4006, tip_pos = {550, 200},	tip ="ở đây biểu hiện cai trang bị trước mặt thuộc tính ，chỉ có tuyệt phẩm và cực phẩm trang bị tài xứng đôi nghịch thiên thuộc tính tỉ lệ phần trăm tăng trưởng nga ~", hand_pos = {250, 120}, hand_eff ="guide_hand", right = true,rotation = 48})
mapArray:push({ id = 4006, layer_name ="SmithyBaseLayer", 	widget_name ="", 					next_step = 4007, 	tip_pos ={390,200}, tip ="đi qua thôn phệ giống nhau trang bị ，trước mặt đúc lại vị đúc lại hậu nếu có phẩm chất đề thăng ，liền mở ra tiếp theo đúc lại vị", hand_pos = {520,300},rotation = 90, hand_eff ="guide_hand"})
mapArray:push({ id = 4007, layer_name ="SmithyBaseLayer", 	widget_name ="", 					next_step = 4008, 	tip_pos ={440,200}, tip ="toàn bộ vị trí nhiều lần đúc lại đáo thần chú phẩm chất ，bản trang bị thuộc tính sẽ có bạo tạc tính đích tăng trưởng ，vừa ra tay liền khống chế chiến cuộc ！", hand_pos = {720,150}, hand_eff ="guide_hand"})
mapArray:push({ id = 4008,	layer_name ="SmithyBaseLayer",		widget_name ="", 					next_step = 0, tip_pos = {440,200},	tip ="đúc lại hậu đích thuộc tính trăm phần trăm xong đề thăng ，Đại hiệp như thế ổn trám không lỗ đích buôn bán nhưng nghìn vạn lần không nên bỏ qua 吖~", hand_pos = {820, 55}, hand_eff ="guide_hand",rotation = 90})

--oạt mỏ 
--mapArray:push({ id = 6001, layer_name ="MenuLayer", 				widget_name ="pvpBtn",  	next_step = 6002, tip_pos ={40,200}, tip ="Thần Nông bang phát hiện một chỗ linh mỏ ，đối mặt lớn tài phú mê hoặc ，khắp nơi nhân sĩ tiền để cướp đoạt ！để đồng tiền ，chiếm trước bảo địa a ！", right = true, name ="oạt mỏ"})
--mapArray:push({ id = 6002, layer_name ="ActivityLayer", 			widget_name ="btnTableView", offset = {0,10,0,-45}, next_step = 6003, tip_pos ={550,220}, tip ="khai thác thời gian là 8tiếng đồng hồ ，nhu thiết trí phòng thủ đội ngũ chống đỡ cướp giật ；nảy sinh cái mới mỏ nhưng thu được càng cao thưởng cho ！", hand_pos = {800, 85}, save = true, specialCall = 9})
--mapArray:push({ id = 6003, layer_name ="ActivityLayer", 			widget_name ="btn_go",		next_step = 6004,  tip_pos = {-290, 10},	tip ="ngủ một giấc đích thời gian là được thu được vô số đồng tiền ~mau vào nhập chính bảo thạch huyệt động xem một chút đi ！~"})
--mapArray:push({ id = 6004, layer_name ="MiningLayer", 			widget_name ="",		next_step = 0,  tip_pos = {590, 340},	tip ="bị đoạt không nên nổi giận ，mỗi người mỗi ngày có 2thứ cướp giật người khác đích cơ hội ；một chỗ mỏ cũng chỉ sẽ bị thành công cướp đi một lần ，rất có siêu cường bạn tốt trợ ngươi hộ mỏ ！", hand_pos = {370, 240}, hand_eff ="guide_hand"})

--du lịch ngoạn pháp 

mapArray:push({ id = 7001, layer_name ="MenuLayer", guideType = 1,  widget_name ="btn_youli",  next_step = 7002, picture ="ui_new/home/main_youli_btn.png"})
mapArray:push({ id = 7002,	layer_name ="MenuLayer", widget_name ="btn_youli", next_step = 7003, tip_pos = {-240, 60}, hand_pos = {0,10}, tip ="du lịch ngoạn pháp hội sản xuất thiên thư nga ，mau chạy tới thể nghiệm ba",save = true,rotation = 225})
mapArray:push({ id = 7003,	layer_name ="AdventureHomeLayer", widget_name ="btn_buzheng", next_step = 7004, tip_pos = {0, 200}, tip ="tiến nhập bày binh bố trận mặt biên ，thiết trí trận thứ hai dung",hand_pos = {0, 0}})
mapArray:push({ id = 7004,	layer_name ="ZhengbaArmyLayer", widget_name ="btn_team2", next_step = 7005, tip_pos = {-100, -150}, tip ="điểm kích đội hình nhị ，tha động một gã hiệp khách ra trận",save = true,hand_pos = {0, 0}})
mapArray:push({ id = 7005,	layer_name ="AdventureHomeLayer", widget_name ="", next_step = 7006,hand_pos = {-100, -100}, tip_pos = {450, 350}, tip ="Đại hiệp thị kế tiểu con tôm lúc người thứ hai đi tới Kim dong thế giới nhân ，nhiệm vụ của ngươi là tập tề mười bốn thiên thư 。vô lượng kiếm gì đó tông so kiếm tựu muốn bắt đầu ，khứ nhìn một cái náo nhiệt chứ 。"})
mapArray:push({ id = 7006,	layer_name ="AdventureHomeLayer", widget_name ="imgMainGuide", next_step = 7007, tip_pos = {150, 200}, tip ="điểm kích màu đỏ tìm đường dẫn đạo ，tìm được đầu mối chính nhiệm vụ mục tiêu địa điểm 。màu xanh biếc tìm đường dẫn đạo hội mang ngươi tìm được ngẫu nhiên sự kiện đích mục tiêu địa điểm",hand_pos = {0, 0}})
mapArray:push({ id = 7007,	layer_name ="AdventureMissionDetailLayer", widget_name ="btn_attack", next_step = 7008, tip_pos = {0, 0}, tip ="",save = true,hand_pos = {0, 0}})
mapArray:push({ id = 7008,	layer_name ="AdventureHomeLayer", widget_name ="btn_zhuxian", next_step = 7009, tip_pos = {150, 200}, tip ="điểm kích đầu mối chính nhiệm vụ đồ tiêu ，tiến nhập tiếp theo quay về nội dung vở kịch",hand_pos = {0, 0}})
mapArray:push({ id = 7009,	layer_name ="AdventureMissionDetailLayer", widget_name ="btn_attack", next_step = 7010, tip_pos = {0, 0}, tip ="",save = true,hand_pos = {0, 0}})
mapArray:push({ id = 7010,	layer_name ="AdventureHomeLayer", widget_name ="btn_zhuxian", offset = {106,-92,0,0},next_step = 7011, tip_pos = {150, 140}, tip ="chú ý lạp ，lần này thị BOSStrạm kiểm soát ，sẽ có lưỡng trận chiến đấu nga",hand_pos = {106, -92}})
mapArray:push({ id = 7011,	layer_name ="AdventureMissionDetailLayer", widget_name ="btn_team2", next_step = 7012, tip_pos = {-150, -200}, tip ="BOSStrạm kiểm soát có lưỡng trận chiến đấu ，điểm kích ở đây khả dĩ kiểm tra đệ nhị trận chiến đấu đích địch nhân tin tức",hand_pos = {0, 0}})
mapArray:push({ id = 7012,	layer_name ="AdventureMissionDetailLayer", widget_name ="txt_xxxxx", offset = {0,-283,150,228},	next_step = 7013, tip_pos = {360,-240}, 	tip ="lưỡng trận chiến đấu toàn bộ thắng lợi mới có thể thu được toàn bộ thưởng cho nga",right = true,hand_eff ="guide_hand", hand_pos = {320, -170}})
mapArray:push({ id = 7013,	layer_name ="AdventureMissionDetailLayer", widget_name ="btn_attack", next_step = 7014, tip_pos = {0, 0}, tip ="",save = true,hand_pos = {0, 0}})
mapArray:push({ id = 7014,	layer_name ="AdventureHomeLayer", widget_name ="btn_chapter", next_step = 7015, tip_pos = {0, 280}, tip ="điểm kích ở đây khả dĩ càn quét trước 3tinh thông quan đích du lịch trạm kiểm soát",save = true,hand_pos = {0, 0}})
mapArray:push({ id = 7015,	layer_name ="AdventureHomeLayer", widget_name ="btn_shop", next_step = 7016, tip_pos = {120, 220}, tip ="ở du lịch trạm kiểm soát trung lấy được tàn trang khả dĩ ở chỗ này đổi tương ứng thiên thư nga",hand_pos = {0, 0}})
mapArray:push({ id = 7016,	layer_name ="AdventureMallLayer", widget_name ="btn_5", next_step = 7017, tip_pos = {120, 220}, tip ="đổi bản thiếu thiên thư ，sau đó có cao cấp hơn đích tàn trang là có thể đổi cao cấp thiên thư nga",hand_pos = {0, 0}})
mapArray:push({ id = 7017,	layer_name ="AdventureMallLayer", widget_name ="shopPage|panel_list", next_step = 7018, tip_pos = {450, 350}, tip ="điểm kích đổi thiên long bản thiếu",hand_pos = {70, 380}})
mapArray:push({ id = 7018,	layer_name ="AdventureShoppingLayer", widget_name ="btn_buy", next_step = 7019, tip_pos = {120, 220}, tip ="",hand_pos = {0, 0}})
mapArray:push({ id = 7019,	layer_name ="AdventureHomeLayer", widget_name ="btn_return", next_step = 7020, tip_pos = {200, -200}, tip ="rốt cuộc đáo thiên thư lạp ，mặc dù là bản thiếu ，nhượng chúng ta đem trang bị đứng lên",hand_pos = {0, 0}})
mapArray:push({ id = 7020,	layer_name ="MenuLayer", 			widget_name ="armature1", offset ={-40,0,50,40}, next_step = 7021, tip_pos = {-250, 70}, tip ="chúng ta đi vai mặt biên trang bị thiên thư", hand_pos = {0, 90}})
mapArray:push({ id = 7021,	layer_name ="RoleInfoLayer", widget_name ="panel_equip_6|img_bg", next_step = 7022, tip_pos = {100, 200}, tip ="điểm kích thiên thư cái nút",hand_pos = {0, 0}})
mapArray:push({ id = 7022,	layer_name ="RoleInfoLayer", widget_name ="btn_zhuangpei", next_step = 0, tip_pos = {100, 200}, tip ="lắp ráp thiên thư đáo trên người tựu đại công cáo thành lạp",hand_pos = {0, 0}})


--khảo giáo dẫn đạo 
--mapArray:push({ id = 8001
mapArray:push({ id = 8001, layer_name ="MenuLayer", widget_name ="btn_kaojiao", next_step = 8002, tip_pos ={-275,50}, tip ="hiện tại Đại hiệp hiểu rõ tổng hợp lại đánh giá là như thế nào ni ？hảo chờ mong ！", hand_pos = {0,0}})
mapArray:push({ id = 8002, layer_name ="KaojiaoLayer", widget_name ="img_xiaoxiangbg", next_step = 8003, tip_pos ={0,0}, tip ="tương ứng đánh giá điều kiện đều có đều tự đích điều mục yêu 。nhượng chúng ta điểm vào xem ！", hand_pos = {75,75}})
mapArray:push({ id = 8003, layer_name ="KaojiaoLayer", widget_name ="img_headicon", offset = {0,0,-45,-45}, next_step = 8004, tip_pos ={0,225}, tip ="mỗi một một ra trận hiệp khách đều có mình đánh giá ，cũng không nên cảo lăn lộn yêu 。", hand_pos = {110,35}, hand_eff ="guide_hand", rotation = -45})
mapArray:push({ id = 8004, layer_name ="KaojiaoLayer", widget_name ="txt_shuoming", offset = {155,-27,0,20}, next_step = 8005, tip_pos ={0,0}, tip ="đối trước mặt đánh giá không hài lòng ？không quan hệ ，ở đây khả dĩ khán trở nên mạnh mẻ đích cách na 。", hand_pos = {200,-50}, hand_eff ="guide_hand", rotation = 0})
mapArray:push({ id = 8005, layer_name ="KaojiaoLayer", widget_name ="txt_tuijian", offset = {80,-330,70,300}, next_step = 0, tip_pos ={-150,-100}, tip ="điểm kích bên này “đề thăng ”cái nút ，có thể giúp ngươi rất nhanh tiến nhập đề thăng mặt biên 。", hand_pos = {250,-150}, hand_eff ="guide_hand", rotation = -45, save = true})

--luyện thể chỉ dẫn 
mapArray:push({ id = 8101,	layer_name ="MenuLayer", 			widget_name ="armature1", offset ={-40,0,50,40}, next_step = 8102, tip_pos = {-250, 70}, tip ="luyện thể đích nhập khẩu ở hiệp khách mặt biên", hand_pos = {0, 90}})
mapArray:push({ id = 8102, 	layer_name ="RoleInfoLayer", 		widget_name ="btn_jm", next_step = 8103, tip_pos = {-300, 100}, 	tip ="điểm kích kinh mạch cái nút"})
mapArray:push({ id = 8103, 	layer_name ="MeridianLayer", 		widget_name ="btn_lianti", next_step = 0, tip_pos = {-170, -30}, 	tip ="tiến nhập luyện thể mặt biên ，có đầy đủ đích tài liệu có thể tiến hành hiệp khách luyện thể liễu"})


--kế tiếp lễ độ 
mapArray:push({ id = 701,	layer_name ="MissionLayer", 	widget_name ="btn_return", 		next_step = 702,tip_pos = {100, -200}, right = true, tip ="thị thời gian kế tiếp đến tiếp sau đích tài nguyên lạp ~"})
mapArray:push({ id = 702,	layer_name ="MenuLayer", 		widget_name ="btn_down", 			next_step = 0, tip_pos = {100, -200}, save = true,right = true, tip ="kế tiếp đến tiếp sau tài nguyên ，còn có thưởng cho khả dĩ lĩnh yêu ！"})
--mapArray:push({ id = 7001, layer_name ="MenuLayer", guideType = 1,  widget_name ="btn_employ",  next_step = 0, picture ="ui_new/home/zjm_yb_icon.png",save = true })
-- mapArray:push({ id = 7002, layer_name ="MenuLayer", 			widget_name ="btn_employ", 			next_step = 0, tip_pos ={180,190}, tip ="khả dĩ sử dụng bạn tốt đích cường lực hiệp khách hỗ trợ chiến đấu lạp ！mình hiệp khách cũng có thể bị thuê làm kiếm tiền nga ~", hand_pos = {-10,10},rotation = 225, name ="dong binh"})



-----------------------------------------------điều kiện Thi triển dẫn đạo -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--vai thăng tinh 
--mapArray:push({ id = 1201,	layer_name ="MenuLayer", 		 widget_name ="armature1", offset ={-40,0,60,40}, 			next_step = 1202,tip_pos = {-250, 70}, tip ="rốt cục thấu được rồi ba mươi hiệp khách hồn phách lạp ！hiệp hồn tu luyện có thể đề thăng hiệp khách đích tu luyện đẳng cấp ，tu luyện đẳng cấp càng cao ，hiệp khách đích cơ sở thuộc tính càng cao", name ="vai tu luyện"})
mapArray:push({ id = 1202,	layer_name ="RoleInfoLayer", 		widget_name ="btn_xiulian", 		next_step = 1203,	tip_pos = {-360,-20}, tip ="rốt cục hồi môn đủ số lượng hiệp hồn ，chuẩn bị đột phá ba ！",save = true})
mapArray:push({ id = 1203, layer_name ="RoleStarUpPreviewLayer", widget_name ="", next_step = 0, tip_pos ={350,160}, tip ="đột phá năng thăng giai hiệp khách đích kỹ năng ，sử hiệp khách biến thân siêu nhân nga ~còn không mau thử xem ~", hand_pos = {890,25}, rotation = 90, hand_eff ="guide_hand"})

--võ học thăng giai id = 61
--mapArray:push({ id = 2101,	layer_name ="RoleInfoLayer",		widget_name ="btn_jinjie", next_step = 0	, tip_pos = {-100, -140},	tip ="tập tề lục bản bí tịch ，điểm kích tiến hóa ！a không ，tiến giai",save = true})
--mapArray:push({ id = 2102,	layer_name ="RoleBreakResultLayer", 	widget_name ="", 	next_step = 0	, tip_pos = {800, 200},	tip ="",save = true, hand_pos = {-800, -900}})

--chiến đấu gia tốc (5cấp sau khi tiến vào trận đầu chiến đấu)
-- mapArray:push({ id = 2801, layer_name ="MissionLayer", widget_name ="cur_mission|btn_base", next_step = 2802, tip_pos ={0,0}, tip ="", specialCall = 1})
-- mapArray:push({ id = 2802, layer_name ="MissionDetailLayer", widget_name ="btn_attack", next_step = 2803, tip_pos ={0,0}, tip ="",save = true})
mapArray:push({ id = 2801, layer_name ="FightUiLayer", 		widget_name ="autoBtn", 		next_step = 0, tip_pos = {150, 180}, 	tip ="tự động chiến đấu công năng mở ra ，sấm quan thoải mái hơn ~",save = true,force = false, right = true, hand_eff ="guide_hand", hand_pos = {40,-40}})

--vai truyền công 
--mapArray:push({ id = 1301,	layer_name ="MenuLayer", 			widget_name ="armature1",offset ={-40,0,60,40}, 			next_step = 1302, tip_pos = {-250, 70}, tip ="truyền công mở ra lạp ！sử dụng truyền công có thể cho tân hiệp khách rất nhanh đề thăng đẳng cấp ，điều kiện tiên quyết là ngươi phải có đầy đủ xà đảm dùng để thôn phệ nga", name ="vai truyền công"})
mapArray:push({ id = 1302,	layer_name ="RoleInfoLayer", 		widget_name ="btn_transfer", 		next_step = 1303, tip_pos = {-200,-70},tip ="truyền công có thể cho tân hiệp khách rất nhanh đề thăng đẳng cấp ，hiệp khách đẳng cấp không thể vượt lên trước đội ngũ đẳng cấp nga ~",save = true})
mapArray:push({ id = 1303,	layer_name ="RoleTransferLayer", 	widget_name ="panel_list", 		next_step = 1304, tip_pos = {420, 200},	tip ="ở chỗ này tuyển trạch ngươi yếu thôn phệ đích xà đảm ，đè lại không tha khả dĩ tuyển trạch đại lượng xà đảm ，phẩm chất càng cao kinh nghiệm càng nhiều ！", hand_pos = {70,290}, right = true})
mapArray:push({ id = 1304,	layer_name ="RoleTransferLayer", 	widget_name ="", 					next_step = 0, 	tip_pos = {850, 260},	tip ="trạc ở đây tiến hành truyền công yêu ~", hand_pos = {860,55}, hand_eff ="guide_hand", rotation = 90})

--chăm học khổ luyện 
mapArray:push({ id = 2900, layer_name ="RoleInfoLayer", widget_name ="", next_step = 0, tip_pos ={450,250}, tip ="điểm kích dĩ trang bị đích võ học có thể chăm học khổ luyện lạp ！", hand_pos = {800,240}, hand_eff ="guide_hand", save = true})
--mapArray:push({ id = 2901, layer_name ="RoleBook_Enchant", widget_name ="btn_qxkl", next_step = 0, tip_pos ={0,0}, tip ="", hand_pos = {0,0}})

--thủ trận chiến đấu 
mapArray:push({ id = 10000,  layer_name ="FightUiLayer", 		widget_name ="roleskill1|roleicon", 		next_step = 0, tip_pos = {150, 180}, 	tip ="điểm kích thả ra kỹ năng", hand_pos = {-10,15},specialCall = 5,right = true, offset ={0,10}})
mapArray:push({ id = 10001,  mapid = 31, mission_id = 10000, role_anger = 0, npc_anger = 0, role = {0,100004,100001,0,100002,100008,0,0,100006}, npc = {190002,190004,0,190001,0,190005,0,0,190003}, skill = {{3,2,10001},{1,7,10002},{4,10,10003},{5,14,10004},{2,16,10005}}})

--thất nhật mục tiêu 
--mapArray:push({ id = 1101,	layer_name ="MissionLayer", 		widget_name ="btn_return", 		next_step = 1102, tip_pos = {250, -800},	tip ="",next_functionId = 19})
--mapArray:push({ id = 1102, layer_name ="MenuLayer", guideType = 1,  widget_name ="sevenday",  next_step = 1103, picture ="ui_new/home/icon_qiri.png", save = true})
--mapArray:push({ id = 1103,	layer_name ="MenuLayer", 			widget_name ="sevenday", 			next_step = 0, tip_pos = {330, 0}, 	tip ="khai phục thất nhật mục tiêu đạt thành ！mỗi ngày lên đất liền có dày phần thưởng ，đạt thành mục tiêu còn có càng nhiều lớn tài nguyên biếu tặng ，mỗi ngày đều muốn tới nga ~", right = true})


--btn_qx

--gỗ cốp pha 
--mapArray:push({ id =, layer_name ="", widget_name ="", next_step =, tip_pos ={}, tip ="", hand_pos = {}})
--, guideType = 1hệ thống đồ tiêu cần bay về phía, hand_eff ="guide_handngón tay biến thành mũi tên", save = true,right = true, rotation = 1ngón tay xoay tròn số ghi ，cam chịu 0độ thị ↖,offset ={}

--đồ tằng danh và cái nút danh đều phải dữ cây xoài UInội nhất nhất đối ứng ，bằng không bước(đi) hội gián đoạn ，không hiện ra ，ngón tay hướng lệch lạc chờ 
--mapArray:push({ id = bất khả tha cho ID，giống nhau số nguyên bắt đầu sau này danh sách tăng, layer_name ="trước mặt bước(đi) xuất hiện đồ tằng ，", widget_name ="trước mặt bước(đi) cần ngoạn gia điểm kích đích cái nút ，nếu không cần tắc cái gì cũng không điền", next_step = bước tiếp theo đột nhiên tự hào, tip_pos ={đối bạch tọa ngọn X,Y}, tip ="đối bạch nội dung ，nếu không cần tắc cái gì cũng không điền", hand_pos = {ngón tay tọa ngọn ，không cần di chuyển vị trí cam chịu 0,0；nếu ở đây không có cái nút ngón tay hướng ，tọa ngọn nguyên điểm ở toàn bộ mặt biên dưới góc trái }})
--chú ý nhất định phải có save = truebảo tồn bước(đi) ！nghiêm chỉnh một hệ thống dẫn đạo chỉ cần một lần ，bảo tồn ở ngươi chơi phải điểm đích bước(đi) thượng 。

return mapArray	
