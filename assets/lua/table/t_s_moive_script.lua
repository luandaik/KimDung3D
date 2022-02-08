--[[
	mapId:nội dung vở kịch đối thoại đích tràng cảnh id；
	bgm:bối cảnh âm nhạc 
	target:kịch bản tất cả vai mới bắt đầu hóa 
		roleId:vai id
		isNpc:có phải là hay không npc，nếu như là npcsẽ tìm npcbiểu đích id
		pos:mới bắt đầu hóa đích tọa độ ，là thông qua pos_typekhống chế 
		pos_type:khống chế posgiá trị  pos_type = 1 tắc posđích tọa độ là từ màn hình bên trái toán khởi pos_type = 2 tắc posđích tọa độ là từ màn hình hữu biên toán khởi 
		forward ：vai hướng  1vi mặt hướng bên phải ，2vi mặt hướng tả 
	actions：kịch bản tình hình cụ thể và tỉ mỉ 
		mỗi một mạc đơn độc chấp hành ，chấp hành hoàn một màn bắt đầu hạ một màn 
			mỗi một mạc do nhiều vai chấp hành động tác hoàn thành 
			delay：mỗi cái động tác chấp hành lùi lại thời gian 
			action_type：động tác loại hình 
			1：di động 
				targetId：chấp hành động tác người id，thị mới bắt đầu hóa vai tuồng hướng dẫn tra cứu 。thứ vài người 
				pos：di động đáo một cái tọa độ ，tọa độ tính toán giống như trên 
				action_time：chấp hành di động động tác đích thời gian ，nếu như thời gian <= 0 tắc thoáng hiện 
			2：chấp hành Phiêu máu thao tác 
				targetId：chấp hành động tác người id，thị mới bắt đầu hóa vai tuồng hướng dẫn tra cứu 。thứ vài người 
				hurt：Phiêu máu đích thương tổn ，chính trực là màu xanh biếc Tăng sinh lực ，phụ trị giá là màu đỏ giảm máu 
			3：chấp hành một cái riêng động tác 
				targetId：chấp hành động tác người id，thị mới bắt đầu hóa vai tuồng hướng dẫn tra cứu 。thứ vài người 
				action_name：cần chấp hành đích động tác 
				end_action：động tác kết thúc đích động tác ，nếu như dữ action_nametương đồng tắc bảo trì action_nameđộng tác đích tối hậu nhất tránh ，bất đồng tắc cắt vi end_action
				sound：truyền phát tin đích ngữ âm 
			4：đối thoại 
				name：đối thoại biểu hiện đích tên ，nếu như là diễn viên tắc thủ ngoạn gia danh 
				image：biểu hiện đối thoại đích đại hình ảnh ，nếu như image = 0，tắc tự động đổi thành bên ta diễn viên 
				position：biểu hiện phương hướng ，1vi bên trái ，2vi hữu biên 
				content：đối thoại nội dung 
				sound：truyền phát tin đích ngữ âm 
				sound ="nam.mp3|nữ.mp3"
			5: đặc hiệu biểu diễn 
				target_srcId：đặc hiệu thi thả người id，thị mới bắt đầu hóa vai tuồng hướng dẫn tra cứu 。thứ vài người 
				target_desId：đặc hiệu mục tiêu người id，thị mới bắt đầu hóa vai tuồng hướng dẫn tra cứu 。thứ vài người 
				pos_type：biểu hiện phương hướng ，1vi bên trái ，2vi hữu biên 
				pos：đặc hiệu biểu diễn đích vị trí 
				effectId: biểu diễn đích đặc hiệu Id
				effectType: đặc hiệu loại hình 
				sound：truyền phát tin đích ngữ âm 
				sound ="văn kiện giáp /văn kiện danh.mp3"
				loop:có hay không tuần hoàn thả ra true or false
				tag:Đánh dấu 。cần dời trừ đích thời gian sử dụng 
			6: đặc hiệu tiêu thất 
				tag：Đánh dấu ，cần biến mất Đánh dấu 
				effectType: đặc hiệu loại hình effectType == 0 có lẽ effectType == 5 thời gian cần điền target_srcId
				target_srcId：đặc hiệu thi thả người id，thị mới bắt đầu hóa vai tuồng hướng dẫn tra cứu 。thứ vài người 

tấn công đặc hiệu loại hình 0người công kích trên người truyền phát tin 1trong màn ảnh tâm truyền phát tin 2ngồi chỗ cuối bài 3Đường thẳng Bay đơn thể 4Đường thẳng Bay dựng thẳng bài 5người công kích dưới chân truyền phát tin 
6bên ta đội hình Trung tâm truyền phát tin 7địch phương trận dung Trung tâm truyền phát tin 8trong màn ảnh tâm đưa đính  9bên ta đội hình Trung tâm đưa đính truyền phát tin 10địch phương trận dung Trung tâm đưa đính truyền phát tin 
hậu phóng chính là nhân vật tằng cấp cao hơn tiên phóng đích 。

skipIconOut = 1,
skipIconIn = 1,
				
]]

local mapArray = MEMapArray:new()

mapArray:push({ id = 1, mapId = 2, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 150, y = 300}, pos_type = 1, forward = 1},
	[2] = {roleId = 8, isNpc = false,pos = {x = 850, y = 300}, pos_type = 1, forward = 2},
	[3] = {roleId = 298, isNpc = false,pos = {x = 300, y = 300}, pos_type = 1, forward = 1},
	[4] = {roleId = 24, isNpc = false,pos = {x = 750, y = 250}, pos_type = 1, forward = 2},
	[5] = {roleId = 125, isNpc = false,pos = {x = 870, y = 200}, pos_type = 1, forward = 2}
	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="Ma Giáo trưởng lão", image = 10008, position = 2, content ="Các ngươi như lại truy đuổi, ta liền giết cô gái nhỏ này!", sound ="14.mp3",delay = 2 },
				[2] = { action_type = 4, name ="Linh muội", image = 10024, position = 2, content ="A! Cứu mạng a! Ngươi này kẻ ác mau thả ta ra!", sound ="15.mp3"},
			 [3] = { action_type = 4, name ="0", image = 0, position = 1, content ="Cô nương đừng sợ, chúng ta nhất định sẽ cứu ngươi!", sound ="16.mp3|016.mp3",smile = 3,skipIconOut = 1 },
				[4] = { action_type = 4, name ="0", image = 0, position = 1, content ="Vô liêm sỉ, dĩ nhiên kèm hai bên con tin.", sound ="17.mp3|017.mp3",smile = 4,skipIconIn = 1},
			 [5] = { action_type = 4, name ="Tây Nam thánh tăng", image = 10298, position = 2, content ="Thí chủ chớ hoảng sợ, xem lão nạp trước tiên hạn chế hắn.", sound ="18.mp3"}
			},
		[2] = {
			 [1] = { action_type = 1, targetId = 3, pos = {x = 620,y = 270}, pos_type = 1, action_time = 0,delay = 0 },
        [2] = { action_type = 3, targetId = 3, action_name ="skill", end_action ="stand", delay = 0,sound ="skill/29801.mp3"},
        [3] = { action_type = 5, target_srcId = 3, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102984,effectType = 0,delay = 0 },
        [4] = { action_type = 3, targetId = 2, action_name ="hit", end_action ="stand", delay = 1.5},
        [5] = { action_type = 2, targetId = 2, hurt = -1000,delay = 2},
        [6] = { action_type = 1, targetId = 3, pos = {x = 300,y = 300}, pos_type = 1, action_time = 0,delay = 2.4 },
        [7] = { action_type = 1, targetId = 3, pos = {x = 310,y = 300}, pos_type = 1, action_time = 0,delay = 2.4 }
		 },
		[3] = {
        [1] = { action_type = 5, target_srcId = 2, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 11,effectType = 0,delay = 0,loop = true }
     	},
		[4] = {
				[1] = { action_type = 4, name ="Ma Giáo trưởng lão", image = 10008, position = 2, content ="Thật nhanh thân pháp! Chân khí ngưng trệ, chẳng lẽ là được phong huyệt đạo?", sound ="19.mp3"},
        [2] = { action_type = 4, name ="0", image = 0, position = 1, content ="Đại sư bị thương sau khi thân pháp vẫn là như vậy mau lẹ, khâm phục.", sound ="20.mp3|020.mp3",smile = 3 },
				[3] = { action_type = 4, name ="Tây Nam thánh tăng", image = 10298, position = 2, content ="Ma đầu đã bị: được lão nạp phong bế huyệt đạo, tốc chiến tốc thắng.", sound ="21.mp3",smile = 0 }
    	}
		}
	}) 

mapArray:push({ id = 2, mapId = 2, bgm ="fight.mp3", target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 200, y = 300}, pos_type = 1, forward = 1},
	[2] = {roleId = 295, isNpc = false,pos = {x = -200, y = 200}, pos_type = 1, forward = 1},
	[3] = {roleId = 125, isNpc = false,pos = {x = 700, y = 200}, pos_type = 1, forward = 2},
	[4] = {roleId = 125, isNpc = false,pos = {x = 780, y = 250}, pos_type = 1, forward = 2},
	[5] = {roleId = 125, isNpc = false,pos = {x = 860, y = 200}, pos_type = 1, forward = 2},
	[6] = {roleId = 125, isNpc = false,pos = {x = 940, y = 250}, pos_type = 1, forward = 2}
	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="Ma Giáo đệ tử", image = 10125, position = 2, content ="Dám một mình đuổi theo, lá gan cũng không nhỏ.", sound ="24.mp3",delay = 2 },
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="Ma Giáo quả nhiên người đông thế mạnh, cũng không phải dịch đối phó.", sound ="25.mp3|025.mp3",smile = 3},
			 [3] = { action_type = 4, name ="Cô đảo quái khách", image = 10295, position = 2, content ="Ma Giáo tặc tử muốn dựa vào nhiều thủ thắng? Uống!", sound ="26.mp3"}
			},
		[2] = {
				[1] = { action_type = 5, target_srcId = 3, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102953,effectType = 0,delay = 0,sound ="skill/100101.mp3"},
				[2] = { action_type = 5, target_srcId = 4, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102953,effectType = 0,delay = 0,sound ="skill/12.mp3"},
				[3] = { action_type = 5, target_srcId = 5, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102953,effectType = 0,delay = 0 },
				[4] = { action_type = 3, targetId = 3, action_name ="hit", end_action ="hit", delay = 1},
        [5] = { action_type = 2, targetId = 3, hurt = -30000,delay = 1}, 
        [6] = { action_type = 1, targetId = 3, pos = {x = -200,y = 200}, pos_type = 2, action_time = 0,delay = 1.6 },
        [7] = { action_type = 3, targetId = 6, action_name ="hit", end_action ="stand", delay = 1},
        [8] = { action_type = 2, targetId = 6, hurt = -20000,delay = 1}, 
        [9] = { action_type = 3, targetId = 4, action_name ="hit", end_action ="hit", delay = 1},
        [10] = { action_type = 2, targetId = 4, hurt = -40000,delay = 1},
        [11] = { action_type = 1, targetId = 4, pos = {x = -200,y = 100}, pos_type = 2, action_time = 0,delay = 1.6 },
        [12] = { action_type = 3, targetId = 5, action_name ="hit", end_action ="hit", delay = 1},
        [13] = { action_type = 2, targetId = 5, hurt = -50000,delay = 1}, 
        [14] = { action_type = 1, targetId = 5, pos = {x = -200,y = 100}, pos_type = 2, action_time = 0,delay = 1.6 }
      },
    [3] = {
				[1] = { action_type = 4, name ="Ma Giáo đệ tử", image = 10125, position = 2, content ="Cái...... Người nào! Dám ám...... Ám tiễn thương nhân......", sound ="27.mp3"},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="Này hùng hồn chỉ lực...... Là Đảo chủ tiền bối đến!", sound ="28.mp3|028.mp3",smile = 3 }
		 },
		[4] = {
    		[1] = { action_type = 1, targetId = 2, pos = {x = 400,y = 200}, pos_type = 1, action_time = 0.3 }
		 },
		[5] = {
		   [1] = { action_type = 4, name ="Cô đảo quái khách", image = 10295, position = 2, content ="Không nghĩ tới còn để lại một, này công lực khôi phục còn chưa đủ.", sound ="29.mp3",delay = 1 },
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="Tiền bối thần kỹ tại hạ bái phục! Còn dư lại liền giao cho ta đi.", sound ="30.mp3|030.mp3",smile = 1}
		 }
    }
	}) 

mapArray:push({ id = 3, mapId = 2, bgm ="fight_boss.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = -200, y = 200}, pos_type = 1, forward = 1},
	[2] = {roleId = 128, isNpc = false,pos = {x = 650, y = 90}, pos_type = 1, forward = 2},
	[3] = {roleId = 128, isNpc = false,pos = {x = 650, y = 210}, pos_type = 1, forward = 2},
	[4] = {roleId = 128, isNpc = false,pos = {x = 650, y = 330}, pos_type = 1, forward = 2},
	[5] = {roleId = 128, isNpc = false,pos = {x = 770, y = 90}, pos_type = 1, forward = 2},
	[6] = {roleId = 128, isNpc = false,pos = {x = 770, y = 210}, pos_type = 1, forward = 2},
  [7] = {roleId = 128, isNpc = false,pos = {x = 770, y = 330}, pos_type = 1, forward = 2},
	[8] = {roleId = 128, isNpc = false,pos = {x = 890, y = 90}, pos_type = 1, forward = 2},
	[9] = {roleId = 128, isNpc = false,pos = {x = 890, y = 210}, pos_type = 1, forward = 2},
	[10] = {roleId = 128, isNpc = false,pos = {x = 890, y = 330}, pos_type = 1, forward = 2},
	[11] = {roleId = 296, isNpc = false,pos = {x = -300, y = 200}, pos_type = 1, forward = 2}
	}, actions = {
		[1] = {
     		[1] = { action_type = 1, targetId = 1, pos = {x = 350,y = 200}, pos_type = 1, action_time = 0.4,delay = 1.5 },
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="Đáng ghét, nhiều như vậy rắn độc......", sound ="36.mp3|036.mp3",smile = 3,delay = 2.5}
			},
		[2] = {
				[1] = { action_type = 3, targetId = 2, action_name ="attack", end_action ="stand", delay = 1},
        [2] = { action_type = 3, targetId = 3, action_name ="attack", end_action ="stand", delay = 1},
        [3] = { action_type = 3, targetId = 4, action_name ="attack", end_action ="stand", delay = 1},
        [4] = { action_type = 3, targetId = 5, action_name ="attack", end_action ="stand", delay = 1},
        [5] = { action_type = 3, targetId = 6, action_name ="attack", end_action ="stand", delay = 1},
        [6] = { action_type = 3, targetId = 7, action_name ="attack", end_action ="stand", delay = 1},
        [7] = { action_type = 3, targetId = 8, action_name ="attack", end_action ="stand", delay = 1},
        [8] = { action_type = 3, targetId = 9, action_name ="attack", end_action ="stand", delay = 1},
        [9] = { action_type = 3, targetId = 10, action_name ="attack", end_action ="stand", delay = 1}
      },
    [3] = {
        [1] = { action_type = 1, targetId = 11, pos = {x = 230,y = 200}, pos_type = 1, action_time = 0.4 },
				[2] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="Chuyện gì kinh hoảng?", sound ="37.mp3",delay = 1 },
				[3] = { action_type = 4, name ="0", image = 0, position = 1, content ="Tiền bối tới đúng lúc, nơi này có rất nhiều rắn độc chặn đường......", sound ="38.mp3|038.mp3",smile = 3 },
				[4] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="Ha ha ha, trò mèo.", sound ="39.mp3"},
		 },
		[4] = {
        [1] = { action_type = 3, targetId = 11, action_name ="skill2", end_action ="stand", delay = 1},
    		[2] = { action_type = 5, target_srcId = 1, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102983,effectType = 0,delay = 2,sound ="skill/28002.mp3"}
		 },
		[5] = {
		   [1] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="Hiện tại ngươi liền nghênh ngang tiêu sái quá khứ!", sound ="40.mp3"},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="Nhưng là...... Những kia xà...... Thật sự không liên quan sao?", sound ="41.mp3|041.mp3",smile = 2},
				[3] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="Bàn về dùng độc, lão phu tự tin thiên hạ này vẫn không có vượt qua người của ta.", sound ="42.mp3"},
		 },
		[6] = {
        [1] = { action_type = 1, targetId = 1, pos = {x = 1050,y = 200}, pos_type = 1, action_time = 1.2 },
        [2] = { action_type = 1, targetId = 1, pos = {x = 1000,y = 200}, pos_type = 1, action_time = 0,delay = 1.3 } 				
    	},
    [7] = {
		   [1] = { action_type = 4, name ="0", image = 0, position = 1, content ="Tiền bối quả nhiên là dùng độc thánh thủ! Những độc xà này thật giống không nhìn thấy ta.", sound ="43.mp3|043.mp3",smile = 1 },
				[2] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="Khà khà, bất quá là chút công phu thô thiển thôi.", sound ="44.mp3"},
				[3] = { action_type = 4, name ="0", image = 0, position = 1, content ="Đa tạ tiền bối giúp đỡ, cáo từ.", sound ="45.mp3|045.mp3"}
		 },
		[8] = {
        [1] = { action_type = 1, targetId = 1, pos = {x = -200,y = 200}, pos_type = 2, action_time = 0.4 }
    	}
    }
	}) 



mapArray:push({ id = 4, mapId = 2, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 200, y = 250}, pos_type = 1, forward = 1},
	[2] = {roleId = 297, isNpc = false,pos = {x = 300, y = 230}, pos_type = 1, forward = 1},
	[3] = {roleId = 125, isNpc = false,pos = {x = 400, y = 300}, pos_type = 2, forward = 2},
	[4] = {roleId = 125, isNpc = false,pos = {x = 300, y = 200}, pos_type = 2, forward = 2},
	[5] = {roleId = 125, isNpc = false,pos = {x = 200, y = 100}, pos_type = 2, forward = 2},
	[6] = {roleId = 748, isNpc = false,pos = {x = 400, y = 100}, pos_type = 2, forward = 2},
	[7] = {roleId = 748, isNpc = false,pos = {x = 200, y = 300}, pos_type = 2, forward = 2}
	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="Ma Giáo đệ tử", image = 10125, position = 2, content ="Đến hay lắm! Nơi này đã sớm bày xuống Thiên La Địa Võng chờ các ngươi a.", sound ="52.mp3",delay = 2 },
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="Không nghĩ tới Ma Giáo lại nơi này nằm sấp xuống nhiều người như vậy tay.", sound ="53.mp3|053.mp3",smile = 3},
			 [3] = { action_type = 4, name ="Khất cái thủ lĩnh", image = 10297, position = 2, content ="Hừ, đám người ô hợp khó thành khí hậu, ăn ta lão khiếu hóa một chưởng!", sound ="54.mp3"}
			},
		[2] = {
				[1] = { action_type = 3, targetId = 2, action_name ="skill", end_action ="stand", delay = 0},
				[2] = { action_type = 5, target_srcId = 2, target_desId = 0, pos = {x = 320,y = 240}, pos_type = 1, effectId = 102973,effectType = 9,delay = 0,sound ="skill/29701.mp3"},
				[3] = { action_type = 3, targetId = 4, action_name ="hit", end_action ="hit", delay = 3},
        [4] = { action_type = 2, targetId = 4, hurt = -50000,delay = 3}, 
        [5] = { action_type = 1, targetId = 4, pos = {x = -200,y = 100}, pos_type = 2, action_time = 0,delay = 3.6 },
        [6] = { action_type = 3, targetId = 5, action_name ="hit", end_action ="stand", delay = 3},
        [7] = { action_type = 2, targetId = 5, hurt = -50000,delay = 3}, 
        [8] = { action_type = 3, targetId = 6, action_name ="hit", end_action ="hit", delay = 3},
        [9] = { action_type = 2, targetId = 6, hurt = -50000,delay = 3},
        [10] = { action_type = 1, targetId = 6, pos = {x = -200,y = 100}, pos_type = 2, action_time = 0,delay = 3.6 },
        [11] = { action_type = 3, targetId = 3, action_name ="hit", end_action ="stand", delay = 3},
        [12] = { action_type = 2, targetId = 3, hurt = -50000,delay = 3},
        [13] = { action_type = 3, targetId = 7, action_name ="hit", end_action ="hit", delay = 3},
        [14] = { action_type = 2, targetId = 7, hurt = -50000,delay = 3}, 
        [15] = { action_type = 1, targetId = 7, pos = {x = -200,y = 100}, pos_type = 2, action_time = 0,delay = 3.6 }
      },
    [3] = {
				[1] = { action_type = 4, name ="0", image = 0, position = 1, content ="Khất cái thủ lĩnh Tiền bối chưởng pháp quả nhiên tinh diệu.", sound ="55.mp3|055.mp3",smile = 3,skipIconOut = 1 },
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="Ma Giáo yêu nhân chịu chết đi!", sound ="56.mp3|056.mp3",smile = 4,skipIconIn = 1 }
		 }
    }
	}) 

mapArray:push({ id = 5, mapId = 11,bgm ="fight.mp3",target = {
	[1] = {roleId = 125, isNpc = false,pos = {x = 1050, y = 300}, pos_type = 1, forward = 2},
	[2] = {roleId = 125, isNpc = false,pos = {x = 1070, y = 200}, pos_type = 1, forward = 2},
	[3] = {roleId = 748, isNpc = false,pos = {x = -200, y = 250}, pos_type = 1, forward = 1},
	[4] = {roleId = 0, isNpc = false,pos = {x = 200, y = 300}, pos_type = 1, forward = 1},
	[5] = {roleId = 299, isNpc = false,pos = {x = 300, y = 250}, pos_type = 1, forward = 1},
	[6] = {roleId = 279, isNpc = false,pos = {x = -200, y = 150}, pos_type = 1, forward = 1},
	[7] = {roleId = 279, isNpc = false,pos = {x = 650, y = 250}, pos_type = 1, forward = 1}
	

	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="ma giáo giáo chúng", image = 10125, position = 2, content ="ha ha ，tiểu mỹ nhân ，bồi huynh đệ chúng ta khoái hoạt một chút làm sao ？", sound ="59.mp3",delay = 2 },
				[2] = { action_type = 4, name ="Bạch y thiếu nữ", image = 10279, position = 2, content ="các ngươi những Vô Lại ，người cứu mạng a ！", sound ="60.mp3"},
			 [3] = { action_type = 4, name ="0", image = 0, position = 1, content ="dừng tay ！ma giáo yêu nhân lại đang làm xằng làm bậy ！", sound ="61.mp3|061.mp3",smile = 3 }
       },
    [2] = {
				[1] = { action_type = 1, targetId = 4, pos = {x = 820,y = 250}, pos_type = 1, action_time = 0.4,delay = 0 }
			},
    [3] = {
				[1] = { action_type = 1, targetId = 6, pos = {x = 150,y = 150}, pos_type = 1, action_time = 0.4,delay = 1 },
			 [2] = { action_type = 4, name ="Bạch y thiếu nữ", image = 10279, position = 2, content ="cẩn thận ！người kia là ma giáo yêu nữ giả trang ！", sound ="62.mp3",delay = 1.5 } 
			},
		[4] = {
		   [1] = { action_type = 3, targetId = 7, action_name ="attack", end_action ="stand", delay = 0.5},
		   [2] = { action_type = 3, targetId = 4, action_name ="hit", end_action ="stand", delay = 1.3,sound ="skill/22.mp3"},
		   [3] = { action_type = 2, targetId = 4, hurt = -100,delay = 1.5},
	     [4] = { action_type = 1, targetId = 4, pos = {x = 810,y = 250}, pos_type = 1, action_time = 0,delay = 2 },
	     [5] = { action_type = 4, name ="0", image = 0, position = 1, content ="a ！ngươi ！", sound ="63.mp3|063.mp3",smile = 4,delay = 3 }
	   },
    [5] = {
			 [1] = { action_type = 1, targetId = 7, pos = {x = -200,y = 250}, pos_type = 1, action_time = 0,delay = 0 },
        [2] = { action_type = 1, targetId = 3, pos = {x = 650,y = 250}, pos_type = 1, action_time = 0,delay = 0 },
        [3] = { action_type = 5, target_srcId = 3, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102818,effectType = 0,delay = 0,sound ="role/2783.mp3"},
			 [4] = { action_type = 4, name ="ma giáo yêu nữ", image = 10032, position = 2, content ="đáng tiếc một kiếm này không bị thương ngươi muốn hại ，thế nhưng ，hắc hắc ……", sound ="64.mp3"}
		 },
		[6] = {
		   [1] = { action_type = 3, targetId = 4, action_name ="hit", end_action ="stand", delay = 0},
		   [2] = { action_type = 2, targetId = 4, hurt = -100,delay = 0},
	     [3] = { action_type = 5, target_srcId = 4, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 1,effectType = 0,delay = 0}
		 },
		[7] = {
				[1] = { action_type = 4, name ="0", image = 0, position = 1, content ="nguy rồi ，có độc ……", sound ="65.mp3|065.mp3",smile = 2}
			},
    [8] = {
        --[1] = { action_type = 1, targetId = 5, pos = {x = 500,y = 250}, pos_type = 1, action_time = 0,delay = 0 },        
				[1] = { action_type = 3, targetId = 5, action_name ="attack", end_action ="stand", delay = 0},
				[2] = { action_type = 5, target_srcId = 5, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102991,effectType = 0,delay = 0,sound ="skill/11502.mp3"},
        [3] = { action_type = 3, targetId = 3, action_name ="hit", end_action ="hit", delay = 1.5},
				[4] = { action_type = 2, targetId = 3, hurt = -3000,delay = 1.5},
			 [5] = { action_type = 1, targetId = 3, pos = {x = -150,y = 250}, pos_type = 2, action_time = 0,delay = 2.1}
			},
	 [9] = {
				[1] = { action_type = 4, name ="trùng dương chân nhân", image = 10299, position = 2, content ="giang hồ hiểm ác đáng sợ ，sau này cũng không nên tái dễ dàng như vậy đích rơi vào bẫy 。", sound ="66.mp3"},
        [2] = { action_type = 4, name ="Bạch y thiếu nữ", image = 10279, position = 2, content ="đừng lo lắng ，ta tới giúp ngươi giải độc 。", sound ="67.mp3"}
		 },
		[10] = {
		   [1] = { action_type = 3, targetId = 6, action_name ="skill2", end_action ="stand", delay = 0,sound ="role/2793.mp3"},
				[2] = { action_type = 5, target_srcId = 6, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 112793,effectType = 0,delay = 0 },
			 [3] = { action_type = 5, target_srcId = 4, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102833,effectType = 0,delay = 0,sound ="skill/28002.mp3"},
			 [4] = { action_type = 2, targetId = 4, hurt = 8000,delay = 0},
			},
	 [11] = {
			 -- [1] = { action_type = 6, target_srcId = 4, effectId = 1,effectType = 0,tag = 1 },
		   [1] = { action_type = 4, name ="0", image = 0, position = 1, content ="đa tạ cô nương ân cứu mạng 。", sound ="68.mp3|068.mp3",smile = 1,skipIconOut =1},
			 [2] = { action_type = 4, name ="0", image = 0, position = 1, content ="ma giáo tặc tử để mạng lại ！", sound ="69.mp3|069.mp3",smile = 4,skipIconIn =1}
      }
		}
	}) 

mapArray:push({ id = 6, mapId = 11, bgm ="fight_boss.mp3", target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 500, y = 200}, pos_type = 1, forward = 1},
	[2] = {roleId = 297, isNpc = false,pos = {x = 300, y = 250}, pos_type = 1, forward = 1},
	[3] = {roleId = 295, isNpc = false,pos = {x = 280, y = 150}, pos_type = 1, forward = 1},
	[4] = {roleId = 296, isNpc = false,pos = {x = 700, y = 300}, pos_type = 1, forward = 2},
	[5] = {roleId = 299, isNpc = false,pos = {x = 750, y = 200}, pos_type = 1, forward = 2},
	[6] = {roleId = 298, isNpc = false,pos = {x = 700, y = 100}, pos_type = 1, forward = 2}

	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="Tây Nam thánh tăng", image = 10298, position = 2, content ="thí chủ phải cẩn thận ，ma đầu kia tu vi cực cao 。", sound ="74.mp3",delay = 1 },
				[2] = { action_type = 4, name ="Cô đảo quái khách", image = 10295, position = 2, content ="ta đợi công lực tiêu hao quá lớn ，sợ rằng không địch lại ma đầu kia 。", sound ="75.mp3"},
			 [3] = { action_type = 4, name ="0", image = 0, position = 1, content ="thế nhưng ta công lực còn thấp ，không phải ……", sound ="76.mp3|076.mp3"},
			 [4] = { action_type = 4, name ="trùng dương chân nhân", image = 10299, position = 2, content ="ta đợi hợp lực giúp ngươi đả thông hai mạch nhâm đốc ，nhưng tạm thời đề cao công lực 。", sound ="77.mp3"},
				[5] = { action_type = 4, name ="Khất cái thủ lĩnh", image = 10297, position = 2, content ="việc này không nên chậm trễ ，lai ！", sound ="78.mp3"}
       },
    [2] = {
				[1] = { action_type = 3, targetId = 2, action_name ="skill", end_action ="skill", delay = 0,sound ="skill/100101.mp3"},
		   [2] = { action_type = 5, target_srcId = 2, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102794,effectType = 0,delay = 3,sound ="skill/28002.mp3"},
		   [3] = { action_type = 5, target_srcId = 2, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102797,effectType = 0,delay = 3,sound =""},
		   [4] = { action_type = 3, targetId = 3, action_name ="skill", end_action ="skill", delay = 0,sound ="skill/9502.mp3"},
		   [5] = { action_type = 5, target_srcId = 3, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102794,effectType = 0,delay = 3 },
		   [6] = { action_type = 5, target_srcId = 3, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102797,effectType = 0,delay = 3,sound =""},
		   [7] = { action_type = 3, targetId = 4, action_name ="skill", end_action ="skill", delay = 0,sound ="skill/16602.mp3"},
		   [8] = { action_type = 5, target_srcId = 4, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102794,effectType = 0,delay = 3 },
		   [9] = { action_type = 5, target_srcId = 4, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102797,effectType = 0,delay = 3,sound =""},
		   [10] = { action_type = 3, targetId = 5, action_name ="skill2", end_action ="skill2", delay = 0},
		   [11] = { action_type = 5, target_srcId = 5, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102794,effectType = 0,delay = 3,sound =""},
		   [12] = { action_type = 5, target_srcId = 5, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102797,effectType = 0,delay = 3,sound =""},
		   [13] = { action_type = 3, targetId = 6, action_name ="skill", end_action ="skill", delay = 0},
		   [14] = { action_type = 5, target_srcId = 6, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102794,effectType = 0,delay = 3,sound =""},
		   [15] = { action_type = 5, target_srcId = 6, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102797,effectType = 0,delay = 3,sound =""},
		   [16] = { action_type = 5, target_srcId = 1, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102795,effectType = 5,delay = 3,sound =""}
			},
    [3] = {
		   [1] = { action_type = 5, target_srcId = 1, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 67,effectType = 0,delay = 0,loop = true,sound ="skill/28002.mp3"},
				[2] = { action_type = 1, targetId = 2, pos = {x = 310,y = 250}, pos_type = 1, action_time = 0,delay = 0 },
        [3] = { action_type = 1, targetId = 3, pos = {x = 290,y = 150}, pos_type = 1, action_time = 0,delay = 0 },
        [4] = { action_type = 1, targetId = 4, pos = {x = 690,y = 300}, pos_type = 1, action_time = 0,delay = 0 },
        [5] = { action_type = 1, targetId = 5, pos = {x = 740,y = 200}, pos_type = 1, action_time = 0,delay = 0 },
        [6] = { action_type = 1, targetId = 6, pos = {x = 690,y = 100}, pos_type = 1, action_time = 0,delay = 0 }
      },
		[4] = {
		   [1] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="ngươi nghĩ thế nào ？", sound ="79.mp3",delay = 1 },
		   [2] = { action_type = 4, name ="0", image = 0, position = 1, content ="cảm giác này ，thật sự là tuyệt không thể tả 。", sound ="80.mp3|080.mp3",smile = 3,skipIconOut = 1},
		   [3] = { action_type = 4, name ="0", image = 0, position = 1, content ="các vị tiền bối xin hãy nghỉ tạm ，xem ta ！", sound ="81.mp3|081.mp3",smile = 4,skipIconIn = 1 }
	   },
    [5] = {
			 [1] = { action_type = 1, targetId = 1, pos = {x = -200,y = 200}, pos_type = 2, action_time = 0.5,delay = 0 }
      }
		}
	})



mapArray:push({ id = 15, bgm ="fight_boss.mp3", mapId = 8, target = {
	[1] = {roleId = 570, isNpc = false,pos = {x = 275, y = 300}, pos_type = 2, forward = 2},
	[2] = {roleId = 570, isNpc = false,pos = {x = 300, y = 200}, pos_type = 2, forward = 2},
	[3] = {roleId = 81, isNpc = false,pos = {x = 400, y = 250}, pos_type = 2, forward = 1},
	[4] = {roleId = 0, isNpc = false,pos = {x = 300, y = 300}, pos_type = 1, forward = 1},
	[5] = {roleId = 85, isNpc = false,pos = {x = -200, y = 250}, pos_type = 2, forward = 1}
	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="Tiểu Bảo", image = 10081, position = 2, content ="lai lai lai ，mãi định rời tay ！", sound ="103.mp3",delay = 2 },
				[2] = { action_type = 4, name ="Thị Vệ", image = 10116, position = 2, content ="không tin lần này còn không khai đại ！", sound ="104.mp3"},
			 [3] = { action_type = 4, name ="0", image = 0, position = 1, content ="xin hỏi vị nào là nơi đây đích chủ nhân ？", sound ="105.mp3|0105.mp3"}
       },
    [2] = {
				[1] = { action_type = 1, targetId = 3, pos = {x = 405,y = 250}, pos_type = 2, action_time = 0,delay = 0.5 }
			},
    [3] = {
			 [1] = { action_type = 4, name ="Tiểu Bảo", image = 10081, position = 2, content ="ngươi là ai chính là thủ hạ ，không thấy được chúng ta đang đánh cuộc tiễn sao ！", sound ="106.mp3"},
			 [2] = { action_type = 4, name ="0", image = 0, position = 1, content ="tại hạ có chuyện quan trọng tiếp Tước gia 。", sound ="107.mp3|0107.mp3"},
			 [3] = { action_type = 4, name ="Tiểu Bảo", image = 10081, position = 2, content ="a ！như vậy a ，ngươi chờ một chút 。", sound ="108.mp3"}
		 },
		[4] = {
				[1] = { action_type = 1, targetId = 3, pos = {x = 90,y = 250}, pos_type = 2, action_time = 0.4,delay = 0.5 }
			},	
		[5] = {
				[1] = { action_type = 1, targetId = 3, pos = {x = 100,y = 250}, pos_type = 2, action_time = 0,delay = 0}
			},
		[6] = {
				[1] = { action_type = 4, name ="Tiểu Bảo", image = 10081, position = 2, content ="có thích khách ！！vợ cả khoái tới cứu ta ！", sound ="109.mp3"}
			},
    [7] = {
				[1] = { action_type = 1, targetId = 5, pos = {x = 400,y = 250}, pos_type = 2, action_time = 0.4,delay = 0.5}
			},
		[8] = {
				[1] = { action_type = 4, name ="Phương cô nương", image = 10085, position = 2, content ="lại đang hô to gọi nhỏ ，thị ai dám khi dễ ta Tiểu Bảo ？", sound ="110.mp3"},
				[2] = { action_type = 4, name ="Tiểu Bảo", image = 10081, position = 2, content ="vợ cả ở đây tựu giao cho ngươi ，ngươi cẩn thận một chút ，ta đi trước lạp 。", sound ="111.mp3"}
      },
    [9] = {
				[1] = { action_type = 1, targetId = 3, pos = {x = -150,y = 250}, pos_type = 2, action_time = 0.4,delay = 0.5}
			},
	 [10] = {
				[1] = { action_type = 4, name ="Phương cô nương", image = 10085, position = 2, content ="ngay cả chạy trốn đích tư thế đều đẹp trai như vậy ！", sound ="112.mp3"},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="……", sound ="",smile = 3},
			 [3] = { action_type = 4, name ="Phương cô nương", image = 10085, position = 2, content ="lớn mật thích khách ，dám ám sát Tiểu Bảo ，xem chiêu ！", sound ="113.mp3"}	
      }
		}
	}) 


mapArray:push({ id = 21, mapId = 6,bgm ="fight.mp3", target = {
	[2] = {roleId = 5, isNpc = false,pos = {x = 375, y = 200}, pos_type = 2, forward = 1},
	[1] = {roleId = 18, isNpc = false,pos = {x = 400, y = 300}, pos_type = 2, forward = 1},
	[3] = {roleId = 9, isNpc = false,pos = {x = 225, y = 250}, pos_type = 2, forward = 2},
	[4] = {roleId = 0, isNpc = false,pos = {x = -150, y = 250}, pos_type = 1, forward = 1},
	[5] = {roleId = 24, isNpc = false,pos = {x = -150, y = 300}, pos_type = 1, forward = 1},
	[6] = {roleId = 94, isNpc = false,pos = {x = -150, y = 200}, pos_type = 1, forward = 1}
	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="đại tua minh vương", image = 10009, position = 1, content ="nếu như bần tăng không có nhìn lầm ，thí chủ trong tay kinh thư chính là ta đại tua tự vật 。", sound ="114.mp3",delay = 2 },
				[2] = { action_type = 4, name ="đầu sắt nhân", image = 10018, position = 1, content ="nguyên lai quyển này kinh thư truyện tự thổ lần ，nếu gặp phải đại sư lý nên vật quy nguyên chủ 。", sound ="115.mp3"},
			 [3] = { action_type = 4, name ="tử mà", image = 10005, position = 1, content ="giá kinh thư lợi hại như vậy ，làm sao có thể đơn giản tựu cho nhân ？", sound ="116.mp3"},
			 [4] = { action_type = 4, name ="đầu sắt nhân", image = 10018, position = 1, content ="trong sách luyện công pháp môn ta đều đã thuộc lòng ，có thư một thư cũng không lo ngại 。", sound ="117.mp3"},
			 [5] = { action_type = 4, name ="đại tua minh vương", image = 10009, position = 1, content ="thực sự ？đa Tạ thí chủ hậu ban thưởng ！tiểu tăng cáo từ 。", sound ="118.mp3"}
		 },
		[2] = {
				[1] = { action_type = 1, targetId = 3, pos = {x = -150,y = 250}, pos_type = 2, action_time = 0.4,delay = 0.5 }
			},	
		[3] = {
				[1] = { action_type = 1, targetId = 4, pos = {x = 350,y = 250}, pos_type = 1, action_time = 0.4,delay = 0},
				[2] = { action_type = 1, targetId = 5, pos = {x = 200,y = 300}, pos_type = 1, action_time = 0.4,delay = 0},
				[3] = { action_type = 1, targetId = 6, pos = {x = 250,y = 200}, pos_type = 1, action_time = 0.4,delay = 0}
			},
		[4] = {
				[1] = { action_type = 4, name ="phi hồ Đại hiệp", image = 10094, position = 2, content ="tới chậm một ，bị na lần tăng trốn thoát 。", sound ="119.mp3"},
		 	[2] = { action_type = 4, name ="0", image = 0, position = 2, content ="na lần tăng điều không phải người tốt ，các ngươi lên hắn làm 。", sound ="120.mp3|0120.mp3",smile = 4 },
		 },
		[5] = {
				[1] = { action_type = 1, targetId = 2, pos = {x = 376,y = 200}, pos_type = 2, action_time = 0,delay = 0},
				[2] = { action_type = 1, targetId = 1, pos = {x = 401,y = 300}, pos_type = 2, action_time = 0,delay = 0}
			},	
    [6] = {
				[1] = { action_type = 4, name ="tử mà", image = 10005, position = 1, content ="hanh ，ta gặp các ngươi tài không giống người tốt 。", sound ="121.mp3"},
				[2] = { action_type = 4, name ="đầu sắt nhân", image = 10018, position = 1, content ="đắc tội tử mà cô nương đích đều phải chết ，các ngươi chớ có trách ta 。", sound ="122.mp3"}
      },
    [7] = {
				[1] = { action_type = 3, targetId = 1, action_name ="skill", end_action ="stand", delay = 0 },
				[2] = { action_type = 3, targetId = 4, action_name ="hit", end_action ="stand", delay = 0.8 },
				[3] = { action_type = 2, targetId = 4, hurt = -1000,delay = 0.8 }
			},
		[8] = {
				[1] = { action_type = 4, name ="đầu sắt nhân", image = 10018, position = 2, content ="người này đã trung liễu ta băng tàm độc ，tử mà cô nương chúng ta đi mau 。", sound ="123.mp3"}
			},
    [9] = {
				[1] = { action_type = 1, targetId = 2, pos = {x = -150,y = 200}, pos_type = 2, action_time = 0.4,delay = 0},
				[2] = { action_type = 1, targetId = 1, pos = {x = -150,y = 300}, pos_type = 2, action_time = 0.4,delay = 0}
			},
	 [10] = {
				[1] = { action_type = 4, name ="Linh muội", image = 10024, position = 2, content ="nguy rồi ，ngươi trúng độc ，có nặng lắm không ？", sound ="124.mp3"},
				[2] = { action_type = 4, name ="0", image = 0, position = 2, content ="tạm thời không có trở ngại ，phải nhanh một chút tìm được bọn họ bắt được giải dược 。", sound ="125.mp3",smile = 2},
			 [3] = { action_type = 4, name ="Linh muội", image = 10024, position = 2, content ="việc này không nên chậm trễ ，chúng ta cản mau đuổi theo đi thôi 。", sound ="126.mp3"}	
      }
		}
	}) 

mapArray:push({ id = 30, bgm ="fight_boss.mp3", mapId = 1, target = {
	[1] = {roleId = 159, isNpc = false,pos = {x = 250, y = 300}, pos_type = 2, forward = 2},
	[2] = {roleId = 0, isNpc = false,pos = {x = 200, y = 300}, pos_type = 1, forward = 1},
	[3] = {roleId = 9, isNpc = false,pos = {x = 425, y = 300}, pos_type = 2, forward = 1}
	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="đại tua minh vương", image = 10009, position = 1, content ="trần Tổng đà chủ danh Mãn Giang hồ tất có thực học ，hoàn xin chỉ giáo mấy chiêu 。", sound ="127.mp3",delay = 2 },
				[2] = { action_type = 4, name ="Tổng đà chủ", image = 10159, position = 1, content ="danh lợi vu ta nếu như Phù vân ，ai mạnh ai yếu đại sư cần gì phải chấp nhất 。", sound ="128.mp3"},
			 [3] = { action_type = 4, name ="đại tua minh vương", image = 10009, position = 1, content ="ta ngươi giai chúc người trong giang hồ ，dùng võ đồng nghiệp có cái gì không được chứ ？", sound ="129.mp3"},
			 [4] = { action_type = 4, name ="0", image = 0, position = 2, content ="đại sư ký có thử nhã hứng ，liền do tại hạ cùng ngươi quá mấy chiêu làm sao ？", sound ="130.mp3|0130.mp3"}
			},
		[2] = {
				[1] = { action_type = 1, targetId = 2, pos = {x = 500,y = 300}, pos_type = 1, action_time = 0.4,delay = 0.5 }
			},	
		[3] = {
				[1] = { action_type = 1, targetId = 3, pos = {x = 426,y = 300}, pos_type = 2, action_time = 0,delay = 0.5},
			},
		[4] = {
				[1] = { action_type = 4, name ="đại tua minh vương", image = 10009, position = 1, content ="vậy phải xem các hạ có bao nhiêu cân lượng liễu 。", sound ="131.mp3"}
		 }
		}
	}) 

mapArray:push({ id = 20000, mapId = 11, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = -150, y = 150}, pos_type = 1, forward = 1},
	[2] = {roleId = 1, isNpc = false,pos = {x = 450, y = 850}, pos_type = 1, forward = 1},
	[3] = {roleId = 509, isNpc = false,pos = {x = 150, y = 200}, pos_type = 2, forward = 2},
	[4] = {roleId = 534, isNpc = false,pos = {x = 350, y = 200}, pos_type = 2, forward = 1},
	[5] = {roleId = 40, isNpc = false,pos = {x = -150, y = 100}, pos_type = 1, forward = 1},
	[6] = {roleId = 40, isNpc = false,pos = {x = -150, y = 250}, pos_type = 1, forward = 1},
	[7] = {roleId = 16, isNpc = false,pos = {x = -150, y = 100}, pos_type = 2, forward = 1},
	[8] = {roleId = 15, isNpc = false,pos = {x = -150, y = 200}, pos_type = 2, forward = 1},
	[9] = {roleId = 7, isNpc = false,pos = {x = -150, y = 300}, pos_type = 2, forward = 1},
	[10] = {roleId = 14, isNpc = false,pos = {x = -150, y = 200}, pos_type = 2, forward = 1}
	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="Hách Liên chiếu tướng", image = 10115, position = 2, content ="ta Tây Hạ đại quân tiến quân thần tốc ，đến lúc đó khuỷu sông vùng tựu tẫn về ta Tây Hạ bản đồ trong vòng ，hay lắm hay lắm ！", sound ="",delay = 0 },
				[2] = { action_type = 4, name ="Võ Sĩ Tây Hạ", image = 10181, position = 1, content ="nguyên soái anh minh ！", sound =""}
			},
		[2] = {
			 [1] = { action_type = 1, targetId = 5, pos = {x = 150,y = 100}, pos_type = 1, action_time = 0.4,delay = 0 },
			 [2] = { action_type = 1, targetId = 6, pos = {x = 200,y = 250}, pos_type = 1, action_time = 0.4,delay = 0 },
			 [3] = { action_type = 4, name ="Trần trưởng lão", image = 10040, position = 2, content ="chịu chết đi ！", sound =""},
		 },
		[3] = {
        [1] = { action_type = 3, targetId = 5, action_name ="attack", end_action ="stand", delay = 0,sound =""},
        [2] = { action_type = 5, target_srcId = 4, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 103155,sound ="skill/23.mp3", effectType = 0,delay = 0.8 },
        [3] = { action_type = 3, targetId = 4, action_name ="hit", end_action ="hit", delay = 0.8,sound =""},
        [4] = { action_type = 2, targetId = 4, hurt = -3000,delay = 1.2},
        [5] = { action_type = 1, targetId = 4, pos = {x = -200,y = 300}, pos_type = 2, action_time = 0,delay = 1.8 }
		 },
		[4] = {
        [1] = { action_type = 4, name ="Hách Liên chiếu tướng", image = 10115, position = 1, content ="có thích khách ！bắt bọn hắn lại ！", sound ="",delay = 0 }
			},
		[5] = {
				[1] = { action_type = 1, targetId = 7, pos = {x = 375,y = 100}, pos_type = 2, action_time = 0.4,delay = 0 },
				[2] = { action_type = 1, targetId = 8, pos = {x = 300,y = 200}, pos_type = 2, action_time = 0.4,delay = 0 },
			 [3] = { action_type = 1, targetId = 9, pos = {x = 375,y = 300}, pos_type = 2, action_time = 0.4,delay = 0 },
			 [4] = { action_type = 1, targetId = 10, pos = {x = 450,y = 200}, pos_type = 2, action_time = 0.4,delay = 0 }
			},
		[6] = {
        [1] = { action_type = 4, name ="Trần trưởng lão", image = 10040, position = 2, content ="nghĩ không ra tứ đại ác nhân tất cả đều đầu nhập vào Tây Hạ nhân cam vi chó săn ！", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="hung thần ác sát", image = 10007, position = 1, content ="dám ám sát nguyên soái ，khán lão tử không đem các ngươi đầu cắt xuống ！", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="mã Phó bang chủ", image = 10040, position = 2, content ="đi mau ，bang chủ hội tiếp ứng chúng ta 。", sound ="",delay = 0 }
    	},
    [7] = {
        [1] = { action_type = 5, target_srcId = 10, target_desId = 0, pos = {x = 550,y = 200}, pos_type = 1, effectId = 102937,sound ="skill/12.mp3", effectType = 9,delay = 0 },
        [2] = { action_type = 3, targetId = 7, action_name ="hit", end_action ="stand", delay = 1.2,sound =""},
        [3] = { action_type = 2, targetId = 7, hurt = -8000,delay = 1.5},
        [4] = { action_type = 3, targetId = 8, action_name ="hit", end_action ="stand", delay = 1.2,sound =""},
        [5] = { action_type = 2, targetId = 8, hurt = -8000,delay = 1.5},
        [6] = { action_type = 3, targetId = 9, action_name ="hit", end_action ="stand", delay = 1.2,sound =""},
        [7] = { action_type = 2, targetId = 9, hurt = -8000,delay = 1.5},
        [8] = { action_type = 3, targetId = 10, action_name ="hit", end_action ="stand", delay = 1.2,sound =""},
        [9] = { action_type = 2, targetId = 10, hurt = -8000,delay = 1.5},
      },
    [8] = {
        [1] = { action_type = 4, name ="Trần trưởng lão", image = 10040, position = 2, content ="đồ long chí dương chưởng ！thị bang chủ đến rồi ！", sound ="",delay = 0 }
      },
    [9] = {
        [1] = { action_type = 1, targetId = 2, pos = {x = 450,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 }
      },
    [10] = {
        [1] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="các ngươi đi đầu lui lại ，kiều mỗ đoạn hậu 。", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="mã Phó bang chủ", image = 10040, position = 2, content ="giá ……tuân mệnh ，bang chủ cẩn thận ！", sound ="",delay = 0 },
				[3] = { action_type = 1, targetId = 5, pos = {x = -200,y = 100}, pos_type = 1, action_time = 0.4,delay = 0 },
				[4] = { action_type = 1, targetId = 6, pos = {x = -200,y = 250}, pos_type = 1, action_time = 0.4,delay = 0 }
      },
    [11] = {
        [1] = { action_type = 4, name ="tội ác chồng chất", image = 10014, position = 2, content ="hanh ，nếu là liên một bang chủ Cái bang đều không thu thập được ，tựu thái có tổn hại chúng ta ác nhân đích uy danh liễu 。", sound ="",delay = 0 },
		 },
    [12] = {
		  	[1] = { action_type = 1, targetId = 1, pos = {x = 200,y = 150}, pos_type = 1, action_time = 0.4,delay = 0 }
      },
    [13] = {
        [1] = { action_type = 4, name ="0", image = 0, position = 1, content ="kiều bang chủ ，ta lai trợ ngươi ！", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="có sự can đảm ！hôm nay chúng ta tựu đại chiến một trận ！", sound ="",delay = 0 }
		 }
		}
	})

mapArray:push({ id = 20001, mapId = 13, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = -150,y = 250}, pos_type = 1, forward = 1},
	[2] = {roleId = 1, isNpc = false,pos = {x = 1000,y = 200}, pos_type = 1, forward = 2},
	[3] = {roleId = 55, isNpc = false,pos = {x = 850, y = 200}, pos_type = 1, forward = 2},
	[4] = {roleId = 56, isNpc = false,pos = {x = 670, y = 350}, pos_type = 1, forward = 1},
	[5] = {roleId = 58, isNpc = false,pos = {x = 630, y = 150}, pos_type = 1, forward = 1},
	[6] = {roleId = 59, isNpc = false,pos = {x = 530, y = 250}, pos_type = 1, forward = 1}
	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="mã Phó bang chủ", image = 10056, position = 1, content ="Tây Hạ nhất dịch ，Bạch trưởng lão bản thân bị trọng thương ，giá một thân võ công sợ rằng ……", sound ="",delay = 0 },
				[2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="có kiều mỗ ở ，đại gia không cần phải lo lắng ，các ngươi cho ta hộ pháp ，ta lai vi Bạch trưởng lão chữa thương 。", sound =""}
			},
		[2] = {
        [1] = { action_type = 3, targetId = 2, action_name ="attack", end_action ="attack", delay = 0,sound =""},
        [2] = { action_type = 5, target_srcId = 3, target_desId = 0,loop = true, pos = {x = 0,y = 0}, pos_type = 1, effectId = 112794,effectType = 0,delay = 1,sound ="skill/28002.mp3"},
        [3] = { action_type = 5, target_srcId = 3, target_desId = 0,loop = true, pos = {x = 0,y = 0}, pos_type = 1, effectId = 112795,effectType = 0,delay = 1,sound =""}
      },
    [3] = {  
        [1] = { action_type = 4, name ="Trần trưởng lão", image = 10058, position = 1, content ="Tây Hạ chi chiến ，bang chủ cũng bị nội thương ，nếu là tái tiêu hao chân khí ……", sound ="",delay = 1 },
        [2] = { action_type = 4, name ="Ngô trưởng lão", image = 10059, position = 1, content ="đáng trách ta đợi công lực không đông đảo ，không phải ……", sound ="",delay = 0 }
		 },
		[4] = {
        [1] = { action_type = 1, targetId = 1, pos = {x = 250,y = 250}, pos_type = 1, action_time = 0.4,delay = 1 }
      },
		[5] = {
			 [1] = { action_type = 1, targetId = 4, pos = {x = 640,y = 350}, pos_type = 1, action_time = 0,delay = 1 },
			 [2] = { action_type = 1, targetId = 5, pos = {x = 620,y = 150}, pos_type = 1, action_time = 0,delay = 1 },
			 [3] = { action_type = 1, targetId = 6, pos = {x = 520,y = 250}, pos_type = 1, action_time = 0,delay = 1 },
				[4] = { action_type = 4, name ="Trần trưởng lão", image = 10058, position = 2, content ="người nào ！lại dám xông vào Cái Bang tổng đà ！", sound ="",delay = 1.5 }
			},
	 [6] = {
				[1] = { action_type = 4, name ="0", image = 0, position = 1, content ="chư vị người già xin không nên hiểu lầm ，tại hạ là kiều bang chủ đích bằng hữu 。", sound ="",delay = 0 },
				[2] = { action_type = 4, name ="Ngô trưởng lão", image = 10059, position = 2, content ="hanh ，sấn kiều bang chủ vi Bạch trưởng lão chữa thương chi tế xông vào Cái Bang ，nhất định là Tây Hạ người Gián Điệp ！", sound ="",delay = 0 },
				[3] = { action_type = 4, name ="Trần trưởng lão", image = 10058, position = 2, content ="không cần cân hắn lời vô ích ，bắt hắn chờ bang chủ xử lý đó là 。", sound ="",delay = 0 }
		 }
		}
	})

mapArray:push({ id = 20004, mapId = 19, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 100,y = 200}, pos_type = 1, forward = 1},
	[2] = {roleId = 2, isNpc = false,pos = {x = -200,y = 250}, pos_type = 2, forward = 2},
	[3] = {roleId = 24, isNpc = false,pos = {x = -200, y = 300}, pos_type = 2, forward = 2},
	[4] = {roleId = 39, isNpc = false,pos = {x = 940, y = 320}, pos_type = 1, forward = 2},
	[5] = {roleId = 14, isNpc = false,pos = {x = 800, y = 350}, pos_type = 1, forward = 2},
	[6] = {roleId = 17, isNpc = false,pos = {x = 375, y = 90}, pos_type = 1, forward = 1},
	[7] = {roleId = 7, isNpc = false,pos = {x = 845, y = 170}, pos_type = 1, forward = 2},
	[8] = {roleId = 15, isNpc = false,pos = {x = 750, y = 130}, pos_type = 1, forward = 2},
	[9] = {roleId = 16, isNpc = false,pos = {x = 950, y = 150}, pos_type = 1, forward = 2},
	[10] = {roleId = 22, isNpc = false,pos = {x = 200, y = 300}, pos_type = 1, forward = 1},
	[11] = {roleId = 50, isNpc = false,pos = {x = 350, y = 250}, pos_type = 1, forward = 1},
	[12] = {roleId = 33, isNpc = false,pos = {x = -250, y = 150}, pos_type = 1, forward = 1}
	}, actions = {
		[1] = {
        [1] = { action_type = 4, name ="bảo định đế", image = 10050, position = 2, content ="chung cốc chủ ，còn xin ngươi thả dự mà ，Đoàn gia có gì chỗ đắc tội nhất định sẽ trả lại ngươi công đạo 。", sound ="",delay = 0 },
				[2] = { action_type = 4, name ="chung cốc chủ", image = 10039, position = 1, content ="hanh ，họ Đoàn đích tiểu tử và Mộc cô nương tựu nhốt tại ta sau lưng thạch trong tù ，có bản lĩnh phải đi cứu hắn ba 。", sound =""},
				[3] = { action_type = 4, name ="chung cốc chủ", image = 10039, position = 1, content ="bọn họ đã trung liễu âm dương hợp và tán ，đại gia sẽ chờ khán Đoàn gia đích nữ nhân làm ra cầm thú hành trình ba ，ha ha ha ！", sound =""},
				[4] = { action_type = 4, name ="Uyển muội", image = 10021, position = 1, content ="đoạn lang ，ta ……ta cảm thấy rất nhiệt ，ngươi tới ôm ta một cái có được hay không ？", sound =""},
        [5] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 1, content ="Uyển muội ，ngươi đừng tới đây ！chúng ta ……chúng ta là cùng cha khác mẹ đích huynh muội ，chúng ta bất năng ……", sound =""},
        [6] = { action_type = 4, name ="Đoàn vương gia", image = 10022, position = 2, content ="họ Chung đích ，ngươi ！ngươi thật sự là quá vô sỉ ！", sound =""},
        [7] = { action_type = 4, name ="hoàng mi tăng", image = 10017, position = 2, content ="chung cốc chủ mời tới diên khánh thái tử trợ quyền ，việc này rất là vướng tay chân 。", sound =""}
      },
    [2] = { 
        [1] = { action_type = 1, targetId = 12, pos = {x = 250,y = 150}, pos_type = 1, action_time = 0.4,delay = 0 }
		 },
		[3] = {
        [1] = { action_type = 4, name ="đan thần", image = 10033, position = 2, content ="bệ hạ ，Vương Gia ，hai vị xin yên tâm ，sự tình đã làm thỏa đáng 。", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="Đoàn vương gia", image = 10022, position = 2, content ="nguyên lai hoàng huynh ngươi tảo có sắp xếp 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="chung cốc chủ", image = 10039, position = 1, content ="người nột ，mở Cửa ngục ，thả bọn họ đi ra cấp các vị nhìn ，ha ha ha ！", sound ="",delay = 0 }
      },
    [4] = { 
        [1] = { action_type = 1, targetId = 2, pos = {x = 530,y = 250}, pos_type = 2, action_time = 1.2,delay = 0 },
        [2] = { action_type = 1, targetId = 3, pos = {x = 440,y = 300}, pos_type = 2, action_time = 1.2,delay = 0 }
      },
	 [5] = {
				[1] = { action_type = 4, name ="chung cốc chủ", image = 10039, position = 1, content ="Linh nhi ！tại sao là ngươi ！na họ Mộc đích nha đầu ni ？", sound ="",delay = 0 },
				[2] = { action_type = 4, name ="Đoàn vương gia", image = 10022, position = 2, content ="ha ha ha ，chung cốc chủ ，ngươi là sợ dự mà ở trong tù tịch mịch ，vì vậy nhượng lệnh ái cùng bồi sao ？", sound ="",delay = 0 },
				[3] = { action_type = 4, name ="bảo định đế", image = 10050, position = 2, content ="Phó huynh đệ oạt địa đạo đích bản lĩnh thực sự là thần hồ kỳ kỹ ，họ Chung đích nằm mơ cũng không nghĩ ra chúng ta đã đem nhân điều túi 。", sound ="",delay = 0 },
		   [3] = { action_type = 4, name ="chung cốc chủ", image = 10039, position = 1, content ="ghê tởm ！Ngã Sát liễu các ngươi ！", sound ="",delay = 0 }
		 }
		}
	})

mapArray:push({ id = 20005, mapId = 11, bgm ="fight_boss.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 580,y = 260}, pos_type = 1, forward = 1},
	[2] = {roleId = 2, isNpc = false,pos = {x = 500,y = 140}, pos_type = 1, forward = 1},
	[3] = {roleId = 9, isNpc = false,pos = {x = -200, y = 200}, pos_type = 1, forward = 1},
	[4] = {roleId = 17, isNpc = false,pos = {x = 1050, y = 230}, pos_type = 1, forward = 1},
	[5] = {roleId = 51, isNpc = false,pos = {x = 810, y = 260}, pos_type = 1, forward = 2},
	[6] = {roleId = 51, isNpc = false,pos = {x = 900, y = 200}, pos_type = 1, forward = 2},
	[7] = {roleId = 51, isNpc = false,pos = {x = 840, y = 140}, pos_type = 1, forward = 2},
	[8] = {roleId = 51, isNpc = false,pos = {x = 750, y = 200}, pos_type = 1, forward = 2},
	[9] = {roleId = 50, isNpc = false,pos = {x = 610, y = 100}, pos_type = 1, forward = 1}
	}, actions = {
		[1] = {
        [1] = { action_type = 4, name ="bảo định đế", image = 10050, position = 1, content ="dự mà người bị quái dị nội thương ，xin hãy các vị người già từ bi cứu trị 。", sound ="",delay = 0 },
				[2] = { action_type = 4, name ="bổn tướng đại sư", image = 10051, position = 2, content ="thế tử thụ thương bản tự tự nhiên sẽ không đứng nhìn bàng quan ，bất quá đại tua minh vương thoáng qua liền tới ，lúc này thực không thích hợp đa hao tổn chân khí 。", sound =""},
				[3] = { action_type = 4, name ="bảo định đế", image = 10050, position = 1, content ="đã bản tự gặp nạn ，tại hạ nên tẫn chia ra vi lực ，nhưng chẳng biết bản tự dữ đại tua minh vương có gì ăn tết ？", sound =""},
				[4] = { action_type = 4, name ="bản nhân đại sư", image = 10051, position = 2, content ="hắn dục dĩ tam bản võ học bí tịch đổi lấy bản tự thần kiếm kiếm phổ ，nhìn hắn trong thơ giọng nói ，rất có cường đoạt ý 。", sound =""},
        [5] = { action_type = 4, name ="đại tua minh vương", image = 10009, position = 1, content ="dân tộc Thổ Phiên quốc sư đại tua minh vương tiếp các vị tiền bối cao tăng 。", sound =""},
        [6] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 2, content ="bá phụ ，thế nào chỉ nghe kỳ thanh không gặp một thân ？", sound =""},
        [7] = { action_type = 4, name ="bảo định đế", image = 10050, position = 2, content ="đây là thiên lý truyền âm ，giá đại tua minh vương đích nội công tu vi thực tại rất cao 。", sound =""}
      },
    [2] = { 
        [1] = { action_type = 1, targetId = 3, pos = {x = 200,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 }
      },
    [3] = {
        [1] = { action_type = 1, targetId = 1, pos = {x = 570,y = 260}, pos_type = 1, action_time = 0,delay = 0 },
        [2] = { action_type = 1, targetId = 2, pos = {x = 490,y = 140}, pos_type = 1, action_time = 0,delay = 0 },
        [3] = { action_type = 1, targetId = 9, pos = {x = 600,y = 100}, pos_type = 1, action_time = 0,delay = 0 }
		 },
		[4] = {
        [1] = { action_type = 4, name ="đại tua minh vương", image = 10009, position = 2, content ="mấy ngày trước tiểu tăng từng có Thư đến đó ，nói vậy các vị cao tăng cũng biết tiểu tăng đích ý đồ đến ，không biết phải suy tính làm sao ？", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="khô khốc thiền sư", image = 10017, position = 1, content ="người xuất gia tứ đại giai không ，hựu khởi hội ham vị bí tịch võ công ，quốc sư mời trở về đi 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="đại tua minh vương", image = 10009, position = 2, content ="diện bích đích vị này cao tăng hay quý tự khô khốc thiền sư ？hạnh ngộ hạnh ngộ 。", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="bản nhân đại sư", image = 10051, position = 1, content ="sư thúc diện bích vài thập niên ，hôm nay hội kiến minh vương đã ngoại lệ ，minh vương mời trở về đi 。", sound ="",delay = 0 },
        [5] = { action_type = 4, name ="đại tua minh vương", image = 10009, position = 2, content ="tiểu tăng thiên lý xa xôi mà đến khởi nhưng vô công nhi phản ，liền thỉnh các vị cao tăng chỉ giáo mấy chiêu thì thế nào 。", sound ="",delay = 0 },
        [6] = { action_type = 4, name ="khô khốc thiền sư", image = 10017, position = 1, content ="minh vương ký có nhã hứng ，vậy liền nếu như ngươi mong muốn ，hai vị tiểu bối lui ra 。", sound ="",delay = 0 },
        [7] = { action_type = 4, name ="0", image = 0, position = 1, content ="không - cần phải khô khốc người già xuất thủ ，vãn bối cũng muốn lãnh giáo một chút minh vương đích cái thế thần công 。", sound ="",delay = 0 }
      }
		}
	})

mapArray:push({ id = 20007, mapId = 12, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = -200,y = 200}, pos_type = 1, forward = 1},
	[2] = {roleId = 1, isNpc = false,pos = {x = 566,y = 393}, pos_type = 1, forward = 1},
	[3] = {roleId = 2, isNpc = false,pos = {x = 822, y = 393}, pos_type = 1, forward = 2}
	}, actions = {
		[1] = {
        [1] = { action_type = 1, targetId = 1, pos = {x = 200,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 }
      },
    [2] = { 
        [1] = { action_type = 4, name ="0", image = 0, position = 2, content ="nguyên lai Đoàn công tử ở chỗ này ，cùng hắn đối ẩm đích là ai ni ？", sound ="",delay = 0 },
				[2] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 1, content ="tại hạ đã phạm chén này ，cai huynh đài ngươi 。", sound =""},
				[3] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="tiểu huynh đệ tửu lượng giỏi ，hảo ，tại hạ cũng phạm chén này 。", sound =""}
      },
    [3] = {
        [1] = { action_type = 3, targetId = 2, action_name ="drink", end_action ="stand", delay = 0,sound =""}
		 },
		[4] = {
        [1] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="ta ngươi dĩ dụng hết hơn bốn mươi bát rượu ，trở lại tỷ thí một chút sức của đôi bàn chân làm sao ？", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 1, content ="huynh đài có thử nhã hạnh ，tại hạ tự nhiên cùng bồi ，vậy tiểu đệ đi đầu một 。", sound ="",delay = 0 },
        [3] = { action_type = 1, targetId = 3, pos = {x = -200,y = 300}, pos_type = 2, action_time = 0.4,delay = 0 }
      },
    [5] = {
        [1] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="hảo Khinh công ！huynh đệ lưu tâm ，kiều mỗ tới cũng 。", sound ="",delay = 0 },
        [2] = { action_type = 1, targetId = 2, pos = {x = -200,y = 300}, pos_type = 2, action_time = 0.4,delay = 0 }
      },
    [6] = { 
        [1] = { action_type = 4, name ="0", image = 0, position = 2, content ="thật nhanh đích thân pháp ……", sound ="",delay = 0 }
      },
    [7] = {
        [1] = { action_type = 1, targetId = 2, pos = {x = 550,y = 250}, pos_type = 2, action_time = 0.4,delay = 1 },
        [2] = { action_type = 1, targetId = 3, pos = {x = 470,y = 200}, pos_type = 2, action_time = 0.4,delay = 1.5 }
      },
    [8] = {
        [1] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 2, content ="còn là huynh đài sức của đôi bàn chân càng tốt hơn ，tại hạ bội phục 。", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="ha ha ，huynh đệ không cần quá khiêm tốn ，nếu là đi thêm thượng ba mươi dặm ，tại hạ phải thua không thể nghi ngờ 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="0", image = 0, position = 2, content ="Đoàn công tử biệt lai vô dạng ，hai vị đích Khinh công thật là làm cho tại hạ mở rộng tầm mắt 。", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="kiều mỗ ngoại trừ hát tửu bên ngoài ，lớn nhất ham đó là dùng võ đồng nghiệp ，chúng ta trở lại thiết tha một chút võ công làm sao ？", sound ="",delay = 0 },
        [5] = { action_type = 4, name ="0", image = 0, position = 2, content ="tại hạ vinh hạnh chi tới ，thỉnh 。", sound ="",delay = 0 }
      }
		}
	})

mapArray:push({ id = 20008, mapId = 13, bgm ="fight_boss.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 450,y = 300}, pos_type = 1, forward = 2},
	[2] = {roleId = 1, isNpc = false,pos = {x = 550,y = 250}, pos_type = 1, forward = 2},
	[3] = {roleId = 2, isNpc = false,pos = {x = 450,y = 100}, pos_type = 1, forward = 2},
	[4] = {roleId = 4, isNpc = false,pos = {x = 100,y = 300}, pos_type = 1, forward = 1},
	[5] = {roleId = 36, isNpc = false,pos = {x = 250,y = 250}, pos_type = 1, forward = 1},
	[6] = {roleId = 13, isNpc = false,pos = {x = 150,y = 200}, pos_type = 1, forward = 1},
	[7] = {roleId = 27, isNpc = false,pos = {x = 220,y = 100}, pos_type = 1, forward = 1},
	[8] = {roleId = 55, isNpc = false,pos = {x = 320,y = 300}, pos_type = 2, forward = 2},
	[9] = {roleId = 56, isNpc = false,pos = {x = 370,y = 200}, pos_type = 2, forward = 2},
	[10] = {roleId = 58, isNpc = false,pos = {x = 320,y = 100}, pos_type = 2, forward = 2},
	[11] = {roleId = 59, isNpc = false,pos = {x = 170,y = 250}, pos_type = 2, forward = 2},
	[12] = {roleId = 20, isNpc = false,pos = {x = 220,y = 150}, pos_type = 2, forward = 2},
	[13] = {roleId = 61, isNpc = false,pos = {x = 75,y = 300}, pos_type = 2, forward = 2},
	[14] = {roleId = 61, isNpc = false,pos = {x = 75,y = 100}, pos_type = 2, forward = 2}
	}, actions = {
		[1] = {
    		[1] = { action_type = 4, name ="Phong lão tứ", image = 10036, position = 2, content ="buồn cười ，các ngươi Phó bang chủ đã chết quan công tử nhà ta gia chuyện gì ！", sound ="",delay = 1 },	
        [2] = { action_type = 4, name ="Trần trưởng lão", image = 10056, position = 1, content ="mã Phó bang chủ chết vào tuyệt kỹ thành danh dưới ，điều không phải họ Mộ Dung công tử gây nên còn có thể là ai ！", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="Phong lão tứ", image = 10036, position = 2, content ="hanh ，thối xin cơm đích ，muốn đánh nhau cái a ？lai nha ！", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="túi cũng không phải", image = 10027, position = 2, content ="không phải vậy ，là chúng ta yếu lãnh giáo một chút mấy Cái Bang trưởng lão võ công 。", sound ="",delay = 0 }
      },
    [2] = { 
        [1] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="khoan động thủ đã ，hát ！", sound ="",delay = 0 },  
        [2] = { action_type = 3, targetId = 2, action_name ="skill", end_action ="stand", delay = 0,sound =""},
        [3] = { action_type = 5, target_srcId = 2, target_desId = 0, pos = {x = 550,y = 250}, pos_type = 2, effectId = 100013,effectType = 9,delay = 0,sound ="skill/102.mp3"}
      },  
    [3] = {
        [1] = { action_type = 4, name ="Phong lão tứ", image = 10036, position = 2, content ="giá ！mà thôi mà thôi ，họ Phong đích luyện nữa hai mươi niên cũng đánh không lại kiều bang chủ ngươi ，giá cái đánh cho không có ý nghĩa ，cáo từ 。",delay = 0 },
				[2] = { action_type = 1, targetId = 5, pos = {x = -200,y = 250}, pos_type = 1, action_time = 0.4,delay = 1 }
			},	
    [4] = {    
				[1] = { action_type = 4, name ="túi cũng không phải", image = 10027, position = 2, content ="ai ，tài nghệ không bằng người hề nét mặt không ánh sáng ，không bằng bỏ qua hề cật tẫn đương quang 。", sound =""},
				[2] = { action_type = 1, targetId = 7, pos = {x = -200,y = 100}, pos_type = 1, action_time = 0.4,delay = 1 }
      },
    [5] = {
        [1] = { action_type = 4, name ="Vương cô nương", image = 10013, position = 2, content ="biểu ca không ở nơi này ，túi tam ca gió êm dịu tứ ca cũng đều đi ，chúng ta cũng đi thôi 。", sound =""},
        [2] = { action_type = 4, name ="Chu nhi", image = 10004, position = 2, content ="ừ ，kiều bang chủ ，chúng ta đây cũng cáo từ 。", sound =""},
				[3] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="ta rất khẳng định Mã đại ca cũng không phải là họ Mộ Dung công tử giết chết ，hai vị cô nương thỉnh tự tiện 。", sound =""},
				[4] = { action_type = 4, name ="toàn bộ đà chủ", image = 10020, position = 2, content ="chậm đã ！mã Phó bang chủ thù lớn chưa trả ，bang chủ có thể nào để cho chạy địch nhân 。", sound =""}
      },
		[6] = {
		 	[1] = { action_type = 1, targetId = 1, pos = {x = 460,y = 300}, pos_type = 1, action_time = 0,delay = 0 },
		 	[2] = { action_type = 1, targetId = 2, pos = {x = 560,y = 250}, pos_type = 1, action_time = 0,delay = 0 },
		 	[3] = { action_type = 1, targetId = 3, pos = {x = 460,y = 100}, pos_type = 1, action_time = 0,delay = 0 },
				[4] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="ta đã nói ，Mã đại ca cũng không họ Mộ Dung công tử giết chết 。có hay không kiều mỗ có gì điều không phải chỗ ，đến nỗi lệnh chúng huynh đệ khả nghi ？", delay = 1 }	
      },
    [7] = {
		   [1] = { action_type = 4, name ="toàn bộ đà chủ", image = 10020, position = 2, content ="mã Phó bang chủ lưu hữu Uông bang chủ đích mật hàm ，trong thơ nhắc tới ，ngươi là người Khiết Đan ！", delay = 0 },
		   [2] = { action_type = 4, name ="Ngô trưởng lão", image = 10058, position = 1, content ="thối lắm ！kiều bang chủ đại nhân đại nghĩa ，thế nào lại là người Khiết Đan ，ta xem ngươi đảo như người Khiết Đan ！", delay = 0 },
		   [3] = { action_type = 4, name ="Trần trưởng lão", image = 10056, position = 2, content ="ai ，thì là mấy người chúng ta khẳng tin tưởng ngươi ，ngươi thì như thế nào đối mặt đông đảo Cái Bang huynh đệ ni 。", delay = 0 },
		   [4] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="đã như vậy ，giá bang chủ kiều mỗ chắc là sẽ không tái làm ，tuyệt không năng bởi vì ta nhượng huynh đệ trong bang tự giết lẫn nhau 。", delay = 0 },
        [5] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 2, content ="đại ca ，ngươi cần gì phải như vậy 。", delay = 0 },
		   [6] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="kiều mỗ thị hồ thị hán nhất định sẽ điều tra rõ ，núi xanh còn đó nước biếc chảy dài ，các vị sau này còn gặp lại 。", delay = 0 },
		 	[7] = { action_type = 1, targetId = 2, pos = {x = -200,y = 250}, pos_type = 1, action_time = 0.4,delay = 1 }
      },
    [8] = {
        [1] = { action_type = 4, name ="toàn bộ đà chủ", image = 10020, position = 1, content ="nếu kiều bang chủ đã ly khai ，bả Mộ Dung gia người của bắt ！", delay = 0 },
        [2] = { action_type = 4, name ="Vương cô nương", image = 10013, position = 2, content ="a ！", delay = 0 },
        [3] = { action_type = 4, name ="0", image = 0, position = 1, content ="hanh ，tại hạ Tuyệt sẽ không để cho các ngươi hồ tác phi vi ！", delay = 0 }		   
      }
		}
	})

mapArray:push({ id = 20010, mapId = 23, bgm ="fight.mp3",target = {
	[1] = {roleId = 1, isNpc = false,pos = {x = 568,y = 250}, pos_type = 1, forward = 1},
	[2] = {roleId = 4, isNpc = false,pos = {x = 520,y = 220}, pos_type = 1, forward = 1},
	[3] = {roleId = 20, isNpc = false,pos = {x = 380,y = 350}, pos_type = 2, forward = 2},
	[4] = {roleId = 31, isNpc = false,pos = {x = 300,y = 220}, pos_type = 2, forward = 2},
	[5] = {roleId = 62, isNpc = false,pos = {x = 350,y = 100}, pos_type = 2, forward = 2},
	[6] = {roleId = 166, isNpc = false,pos = {x = 150,y = 300}, pos_type = 2, forward = 2},
	[7] = {roleId = 166, isNpc = false,pos = {x = 170,y = 150}, pos_type = 2, forward = 2},
	[8] = {roleId = 26, isNpc = false,pos = {x = 380,y = 350}, pos_type = 1, forward = 1},
	[9] = {roleId = 35, isNpc = false,pos = {x = 300,y = 220}, pos_type = 1, forward = 1},
	[10] = {roleId = 38, isNpc = false,pos = {x = 350,y = 100}, pos_type = 1, forward = 1},
	[11] = {roleId = 57, isNpc = false,pos = {x = 150,y = 300}, pos_type = 1, forward = 1},
	[12] = {roleId = 143, isNpc = false,pos = {x = 170,y = 150}, pos_type = 1, forward = 1},
	[13] = {roleId = 155, isNpc = false,pos = {x = 710,y = 800}, pos_type = 1, forward = 2},
	[14] = {roleId = 0, isNpc = false,pos = {x = 80,y = 220}, pos_type = 1, forward = 1}
	}, actions = {
		[1] = {
    		[1] = { action_type = 4, name ="Tiết thần y", image = 10031, position = 1, content ="họ Kiều đích ，ngươi cũng biết hôm nay quần hùng tụ tập đầy đủ ，chính là vì đối phó ngươi giá giết sư giết cha mẹ ác tặc ！", sound ="",delay = 4 },	
        [2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="các ngươi tính toán việc kiều mỗ khởi hữu chẳng biết ，chỉ là vị cô nương này bị trọng thương ，thiên hạ chỉ có Tiết thần y có thể y đắc 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="Tiết thần y", image = 10031, position = 1, content ="hanh ，bất luận kẻ nào mang nàng lai ta đô hội cứu ，hết lần này tới lần khác ngươi giá ngoại tộc người Hồ mang nàng lai ，ta chính là không cứu ！", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="toàn bộ đà chủ", image = 10020, position = 2, content ="ngày hôm nay chúng ta nhiều người như vậy ở chỗ này ，ngươi có chắp cánh cũng không thể bay ！", sound ="",delay = 0 },
        [5] = { action_type = 4, name ="giang hồ nhân sĩ", image = 10057, position = 1, content ="không sai ，Tuyệt không thể để cho hắn còn sống ly khai ！", sound ="",delay = 0 },
        [6] = { action_type = 4, name ="Thiếu Lâm cao tăng", image = 10062, position = 2, content ="A di đà phật ，kiều thí chủ quay đầu lại là bờ 。", sound ="",delay = 0 },
        [7] = { action_type = 4, name ="0", image = 0, position = 2, content ="（ta Tuyệt không tin kiều bang chủ sẽ làm ra những chuyện kia ，thế nhưng trước mắt tình thế ，ta hựu phải làm như thế nào đây ……）", sound ="",delay = 0 },
        [8] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="kiều mỗ hôm nay nhìn thấy không ít cố nhân ，ngay thử uống một chén đoạn nghĩa rượu ，sẽ cùng anh hùng thiên hạ quyết sanh tử một cái ！", sound ="",delay = 0 }
      },
    [2] = { 
        [1] = { action_type = 3, targetId = 1, action_name ="drink", end_action ="stand", delay = 1,sound =""},
        [2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="uống xong đoạn nghĩa rượu ，sau này kiều mỗ giết các ngươi không tính là vong ân ，các ngươi giết kiều mỗ không tính là phụ nghĩa 。", sound ="",delay = 3 },
        [3] = { action_type = 4, name ="Chu nhi", image = 10004, position = 2, content ="kiều đại ca ，ngươi đi nhanh đi ，không nên xen vào nữa ta 。", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="các ngươi cùng lên đi ，lai a ！", sound ="",delay = 0 }
      }, 
    [3] = {
        [1] = { action_type = 1, targetId = 13, pos = {x = 700,y = 250}, pos_type = 1, action_time = 0.4,delay = 1 },
        [2] = { action_type = 4, name ="Hắc Y Nhân", image = 10155, position = 1, content ="đi ！", sound ="",delay = 2 }
 			},	
    [4] = {    
				[1] = { action_type = 1, targetId = 1, pos = {x = 568,y = 800}, pos_type = 1, action_time = 0.4,delay = 0 },
        [2] = { action_type = 1, targetId = 13, pos = {x = 700,y = 800}, pos_type = 1, action_time = 0.4,delay = 0 }
      },
    [5] = {
        [1] = { action_type = 4, name ="toàn bộ đà chủ", image = 10020, position = 1, content ="hắc y nhân kia thị lai lịch gì ，dĩ nhiên cứu đi hắn ！", sound ="",delay = 1},
        [2] = { action_type = 4, name ="giang hồ nhân sĩ", image = 10038, position = 2, content ="họ Kiều đích trốn ，chúng ta sẽ giết hắn mang tới tiểu cô nương này ！", sound =""},
				[3] = { action_type = 1, targetId = 14, pos = {x = 640,y = 220}, pos_type = 1, action_time = 0.4,delay = 0 }
		 },
		[6] = {
        [1] = { action_type = 4, name ="0", image = 0, position = 2, content ="lạm thương vô tội và tiểu nhân hèn hạ có gì khác biệt ！tại hạ Tuyệt không cho phép các ngươi làm như vậy ！", sound ="",delay = 1},
				[2] = { action_type = 4, name ="toàn bộ đà chủ", image = 10020, position = 1, content ="xen vào việc của người khác ，nhượng ngươi biết lợi hại 。", sound =""}
      }
		}
	})

mapArray:push({ id = 20012, mapId = 14, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 100,y = 350}, pos_type = 1, forward = 1},
	[2] = {roleId = 6, isNpc = false,pos = {x = 180,y = 300}, pos_type = 1, forward = 1},
	[3] = {roleId = 29, isNpc = false,pos = {x = 300,y = 250}, pos_type = 2, forward = 2},
	[4] = {roleId = 31, isNpc = false,pos = {x = 200,y = 200}, pos_type = 2, forward = 2},
	[5] = {roleId = 8, isNpc = false,pos = {x = -200,y = 100}, pos_type = 1, forward = 1},
	[6] = {roleId = 3, isNpc = false,pos = {x = 300,y = 200}, pos_type = 1, forward = 1},
	[7] = {roleId = 27, isNpc = false,pos = {x = 120,y = 200}, pos_type = 1, forward = 1},
	[8] = {roleId = 13, isNpc = false,pos = {x = 200,y = 150}, pos_type = 1, forward = 1},
	[9] = {roleId = 36, isNpc = false,pos = {x = 80,y = 100}, pos_type = 1, forward = 1},
	[10] = {roleId = 2, isNpc = false,pos = {x = 600,y = 250}, pos_type = 1, forward = 1}
	}, actions = {
		[1] = {
    		[1] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 1, content ="giá trân lung cuộc quả nhiên tinh thâm ảo diệu ，vãn bối nhận thua 。", sound ="",delay = 2 },	
        [2] = { action_type = 4, name ="trân lung kỳ chúa", image = 10029, position = 2, content ="đáng tiếc đáng tiếc ，bất quá Đoàn công tử năng liên hạ hơn mười Tử đã rất hiếm thấy 。", sound ="",delay = 0 }
      },
    [2] = {
        [1] = { action_type = 1, targetId = 10, pos = {x = 270,y = 80}, pos_type = 1, action_time = 0.4,delay = 0 },
        [2] = { action_type = 1, targetId = 10, pos = {x = 280,y = 80}, pos_type = 1, action_time = 0,delay = 0.5 }
      },
    [3] = { 
        [1] = { action_type = 1, targetId = 6, pos = {x = 600,y = 250}, pos_type = 1, action_time = 0.4,delay = 1 },        
        [2] = { action_type = 4, name ="họ Mộ Dung công tử", image = 10003, position = 2, content ="nhượng tại hạ lai thử một lần ，xin hãy chỉ giáo nhiều hơn 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="trân lung kỳ chúa", image = 10029, position = 1, content ="nguyên lai là họ Mộ Dung công tử ，mong muốn ngươi có thể phá mổ thử cục ，dĩ liễu tiên sư nguyện vọng 。", sound ="",delay = 0 }
      },
    [4] = {
        [1] = { action_type = 4, name ="trân lung kỳ chúa", image = 10029, position = 2, content ="công tử tuy rằng tài đánh cờ cao siêu ，đã có sở sơ sẩy ，biên sừng vị thanh thì như thế nào tranh giành vùng Trung Nguyên ni 。", sound ="",delay = 3 },
        [2] = { action_type = 4, name ="họ Mộ Dung công tử", image = 10003, position = 1, content ="mà thôi ，giá cuộc tại hạ không cách nào phá giải 。", sound ="",delay = 0 },
      },
    [5] = { 
        [1] = { action_type = 1, targetId = 6, pos = {x = 300,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 },
        [2] = { action_type = 1, targetId = 6, pos = {x = 310,y = 200}, pos_type = 1, action_time = 0,delay = 0.5 }
      },
    [6] = {
        [1] = { action_type = 4, name ="trân lung kỳ chúa", image = 10029, position = 2, content ="còn có vị ấy thanh niên tài giỏi đẹp trai nguyện ý tiến lên thử một lần ？", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 1, content ="vị này tiểu sư phụ cũng tinh thông kỳ để ý ，khả dĩ thử xem 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="tiểu hòa thượng", image = 10006, position = 2, content ="không không ，tiểu tăng tướng mạo xấu xí tài đánh cờ thấp kém ，còn là thỉnh vị này hiệp sĩ đấu cờ ba 。", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="0", image = 0, position = 1, content ="tại hạ không thông đạo này ，tiểu sư phụ còn chưa phải yếu khiêm nhượng liễu 。", sound ="",delay = 0 },
        [5] = { action_type = 4, name ="tiểu hòa thượng", image = 10006, position = 2, content ="giá ……được rồi ，tiểu tăng liền tận lực thử một lần 。", sound ="",delay = 0 }
      }, 
    [7] = {
        [1] = { action_type = 1, targetId = 2, pos = {x = 600,y = 250}, pos_type = 1, action_time = 0.4,delay = 0 }
      },	
    [8] = { 
				[1] = { action_type = 4, name ="trân lung kỳ chúa", image = 10029, position = 2, content ="thiên ý ！thiên ý ！nghĩ không ra tiểu sư phụ có thể phá giải tiên sư đích cuộc 。", sound ="",delay = 0 },
				[2] = { action_type = 4, name ="tiểu hòa thượng", image = 10006, position = 1, content ="tiểu tăng chỉ là lung tung hạ một con trai ，thất lễ 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="trân lung kỳ chúa", image = 10029, position = 2, content ="lai lai ，mau vào đáo phía sau trong nhà gỗ khứ 。", sound ="",delay = 0 },
				[4] = { action_type = 4, name ="tiểu hòa thượng", image = 10006, position = 1, content ="ngài là võ lâm tiền bối ，có gì phân phó tiểu tăng tự nhiên vâng theo 。", sound ="",delay = 0 },
 				[5] = { action_type = 1, targetId = 2, pos = {x = -200,y = 250}, pos_type = 2, action_time = 0.4,delay = 0 },
 		 },
    [9] = {
        	[1] = { action_type = 1, targetId = 5, pos = {x = 440,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 }, 		 
        [2] = { action_type = 4, name ="Đinh lão quái", image = 10008, position = 2, content ="bản môn đích tuyệt học há có thể nhượng na tặc ngốc lấy được ，câm điếc lão nhi nạp mạng đi ！", sound ="",delay = 1},
      },
    [10] = {
        [1] = { action_type = 1, targetId = 1, pos = {x = 700,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 }, 
        [2] = { action_type = 1, targetId = 1, pos = {x = 690,y = 200}, pos_type = 1, action_time = 0,delay = 0.5 }, 
        [3] = { action_type = 4, name ="0", image = 0, position = 2, content ="Đinh lão quái ，có ta ở đây thử ，đoạn sẽ không để cho ngươi làm xằng làm bậy ！", sound =""}
		 }
		}
	})

mapArray:push({ id = 20015, mapId = 10, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = -200,y = 250}, pos_type = 1, forward = 1},
	[2] = {roleId = 6, isNpc = false,pos = {x = 850,y = 300}, pos_type = 1, forward = 2},
	[3] = {roleId = 10, isNpc = false,pos = {x = 800,y = 250}, pos_type = 1, forward = 2},
	[4] = {roleId = 19, isNpc = false,pos = {x = 300,y = 250}, pos_type = 1, forward = 1}
	}, actions = {
		[1] = {
    		[1] = { action_type = 4, name ="thu thủy", image = 10019, position = 1, content ="sư tỷ đi tới Tây Hạ thế nào không thông tri sư muội một tiếng ，cũng tốt phân phó hảo hảo chiêu đãi lão nhân gia ngươi 。", sound ="",delay = 0 },	
        [2] = { action_type = 4, name ="Thiên Sơn bà ngoại", image = 10010, position = 2, content ="hanh ，kẻ trộm phụ ，ngươi hủy ta suốt đời ，ta ngày hôm nay nhất định phải giết ngươi ！", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="linh thứu cung chủ", image = 10006, position = 1, content ="sư thúc sư bá ，hai vị không nên tái đấu nữa liễu ，oan oan tương báo bao thuở liễu 。", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="Thiên Sơn bà ngoại", image = 10010, position = 2, content ="không được ，ngày hôm nay ta nhất định phải thủ lão yêu phụ đích mạng chó ！", sound ="",delay = 0 },
        [5] = { action_type = 4, name ="thu thủy", image = 10019, position = 1, content ="thù sâu như biển ，không chết không ngớt ！hát ！", sound ="",delay = 0 }
      },
    [2] = {
        [1] = { action_type = 3, targetId = 3, action_name ="skill", end_action ="skill", delay = 0,sound =""},
        [2] = { action_type = 3, targetId = 4, action_name ="skill", end_action ="skill", delay = 0,sound =""},
        [3] = { action_type = 5, target_srcId = 3, target_desId = 0, pos = {x = 550,y = 250}, pos_type = 1, effectId = 102818,effectType = 9,delay = 1.5,sound =""}
      },
    [3] = { 
        [1] = { action_type = 1, targetId = 1, pos = {x = 100,y = 250}, pos_type = 1, action_time = 0.4,delay = 0 }
      },
    [4] = {
        [1] = { action_type = 4, name ="linh thứu cung chủ", image = 10006, position = 2, content ="hiệp sĩ tới đúng lúc ，khoái giúp ta một chút ，làm cho các nàng không nên tái đấu nữa liễu 。", sound ="",delay = 1 }
      },
    [5] = {
        [1] = { action_type = 1, targetId = 1, pos = {x = 550,y = 250}, pos_type = 1, action_time = 0.4,delay = 0 }
      },
    [6] = {        
        [1] = { action_type = 4, name ="0", image = 0, position = 1, content ="hai vị tiền bối còn như vậy hợp lại xuống phía dưới hội lưỡng bại câu thương đích ，không bằng đều tự dừng tay ba 。", sound ="",delay = 1 },
        [2] = { action_type = 4, name ="Thiên Sơn bà ngoại", image = 10010, position = 2, content ="khoái cấp bà ngoại cút ngay ，không phải liên ngươi một khối giết ！", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="thu thủy", image = 10019, position = 2, content ="nói lầm bầm ，ta nhất định phải thấy lão yêu bà so với ta chết trước ！", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="0", image = 0, position = 1, content ="hai vị tiền bối không nghe khuyến cáo ，tại hạ không thể làm gì khác hơn là đắc tội 。", sound ="",delay = 0 }       
      }
		}
	})

mapArray:push({ id = 20020, mapId = 2, bgm ="fight_boss.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 100,y = 300}, pos_type = 1, forward = 1},
	[2] = {roleId = 1, isNpc = false,pos = {x = 300,y = 200}, pos_type = 1, forward = 1},
	[3] = {roleId = 3, isNpc = false,pos = {x = 450,y = 300}, pos_type = 2, forward = 2},
	[4] = {roleId = 8, isNpc = false,pos = {x = 350,y = 200}, pos_type = 2, forward = 2},
	[5] = {roleId = 18, isNpc = false,pos = {x = 400,y = 100}, pos_type = 2, forward = 2},
	[6] = {roleId = 5, isNpc = false,pos = {x = 500,y = 200}, pos_type = 2, forward = 2},
	[7] = {roleId = 20, isNpc = false,pos = {x = 275,y = 60}, pos_type = 2, forward = 2},
	[8] = {roleId = 51, isNpc = false,pos = {x = 150,y = 300}, pos_type = 2, forward = 2},
	[9] = {roleId = 17, isNpc = false,pos = {x = 200,y = 180}, pos_type = 2, forward = 2},
	[10] = {roleId = 51, isNpc = false,pos = {x = 150,y = 100}, pos_type = 2, forward = 2},
	[11] = {roleId = 2, isNpc = false,pos = {x = 80,y = 100}, pos_type = 1, forward = 1},
	[12] = {roleId = 6, isNpc = false,pos = {x = -200,y = 200}, pos_type = 2, forward = 2}
	}, actions = {
		[1] = {
    		[1] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="kiều mỗ ngày hôm nay tới nơi này chỉ là vì cứu một người ，hết thảy cái khác ân oán đều cùng ta không quan hệ 。", sound ="",delay = 0 },	
        [2] = { action_type = 4, name ="Đinh lão quái", image = 10008, position = 1, content ="hắc hắc ，tưởng cứu cái tiểu nha đầu này còn phải xem ngươi có bản lãnh này hay không 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="hát ！", sound ="",delay = 0 }
      },
    [2] = {
        [1] = { action_type = 3, targetId = 2, action_name ="attack", end_action ="stand", delay = 0,sound =""},
        [2] = { action_type = 1, targetId = 6, pos = {x = 190,y = 200}, pos_type = 1, action_time = 0.4,delay = 1 },
        [3] = { action_type = 1, targetId = 6, pos = {x = 200,y = 200}, pos_type = 1, action_time = 0,delay = 1.5 }
      },
    [3] = {
        [1] = { action_type = 4, name ="tử mà", image = 10005, position = 2, content ="tỷ phu ！ta chỉ biết ngươi nhất định sẽ tới cứu ta đích 。", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="tỷ phu xin lỗi ngươi ，trễ như thế mới đến cho ngươi chịu khổ 。", sound ="",delay = 0 }
      },
    [4] = { 
        [1] = { action_type = 4, name ="đầu sắt nhân", image = 10018, position = 1, content ="ngươi ！ngươi buông ra tử mà cô nương ！họ Kiều đích ，ban đầu ở quần anh trang ngươi giết cha ta bối ，ngày hôm nay yếu ngươi nợ máu trả bằng máu ！", sound ="",delay = 0 },
        [2] = { action_type = 4, name ="toàn bộ đà chủ", image = 10020, position = 2, content ="đại gia khả năng còn không biết ，họ Kiều đích đã lên làm liêu nước nam viện đại vương ，chúng ta có thể nào thả hổ về rừng 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="Thiếu Lâm phương trượng", image = 10017, position = 1, content ="phân phó ，dùng la hán đại trận phong tỏa trên dưới sơn đạo miệng ，ai cũng không được tự tiện xuất nhập 。", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="Thiếu Lâm cao tăng", image = 10051, position = 2, content ="cẩn tuân phương trượng pháp chỉ 。", sound ="",delay = 0 },
        [5] = { action_type = 4, name ="toàn bộ đà chủ", image = 10020, position = 1, content ="họ Mộ Dung công tử ，đao kiếm không có mắt ，ngươi yếu đứng ở na một bên ni ？", sound ="",delay = 0 },
        [6] = { action_type = 4, name ="họ Mộ Dung công tử", image = 10003, position = 2, content ="hôm nay để đại nghĩa ，tại hạ cho dù chết ở kiều huynh dưới chưởng ，cũng coi là vùng Trung Nguyên hào kiệt hết chia ra vi lực ，dù chết do quang vinh 。", sound ="",delay = 0 },
        [7] = { action_type = 4, name ="toàn bộ đà chủ", image = 10020, position = 1, content ="hảo ！họ Mộ Dung công tử quả nhiên thâm minh đại nghĩa 。", sound ="",delay = 0 },
        [8] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 2, content ="họ Mộ Dung công tử ，trước đây ngươi bị người oan uổng đại ca của ta hoàn cho ngươi tác quá chứng ，ngươi tại sao có thể giậu đổ bìm leo ！", sound ="",delay = 0 },	
        [9] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="nhân có chí riêng ，kiều mỗ Tuyệt không miễn cưỡng， 。huống hồ hôm nay bọn họ muốn giết ta cũng cũng không chuyện dễ ，Nhị đệ ngươi thối qua một bên ，đại ca không muốn để chiếu cố ngươi mà phân tâm 。", sound ="",delay = 0 },	
        [10] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 2, content ="đại ca ，trước đây chúng ta kết nghĩa là lúc thề cùng sinh tử ，nay Thiên đại ca gặp nạn ，tiểu đệ tuyệt không hội khoanh tay đứng nhìn ！", sound ="",delay = 0 },	
        [11] = { action_type = 4, name ="linh thứu cung chủ", image = 10006, position = 1, content ="đại ca ！tam đệ ！đánh nhau làm sao có thể thiếu ta ！", sound ="",delay = 0 },	
      },  
    [5] = {    
        [1] = { action_type = 1, targetId = 12, pos = {x = 700,y = 200}, pos_type = 2, action_time = 0.4,delay = 0 }
      },
    [6] = {
        [1] = { action_type = 4, name ="linh thứu cung chủ", image = 10006, position = 1, content ="tam đệ ，vị này nhất định là đại ca ？", sound ="",delay = 0 },	
        [2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="vị này chính là ？", sound ="",delay = 0 },	
        [3] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 1, content ="đại ca ，đây là ta kết bái đích huynh đệ ，chúng ta kết bái đích thời gian kể cả ngươi cũng cùng nhau kết bái ở bên trong ，sau đó ngươi yếu đổi giọng gọi ta tam đệ liễu 。", sound ="",delay = 0 },	
        [4] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="ngày hôm nay quần hùng đều phải thủ tính mạng của ta ，ngươi còn dám theo ta kết bái ，đủ thấy ngươi là một vị hữu tình có nghĩa đích con người sắt đá Tử 。", sound ="",delay = 0 },	
        [5] = { action_type = 4, name ="0", image = 0, position = 1, content ="kiều bang chủ ，thì là tất cả mọi người không tin ngươi ，ta tin tưởng ngươi 。ngươi đại nhân đại nghĩa chẩm sẽ làm ra này khinh thường việc ，hôm nay đánh một trận chúng ta cộng đồng tiến thối ！", sound ="",delay = 0 },	
        [6] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="hảo ！hảo ！kiều mỗ ngày hôm nay năng kết bạn các ngươi thực sự cao hứng vô cùng 。", sound ="",delay = 0 },	
        [7] = { action_type = 4, name ="Đinh lão quái", image = 10008, position = 1, content ="một đám vô tri tiểu bối ，ngày hôm nay tựu cho các ngươi máu tươi ít thất sơn ！", sound ="",delay = 0 },	
        [8] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="hanh ，ba người các ngươi cùng lên đi ！", sound ="",delay = 0 }
      }
		}
	})

mapArray:push({ id = 20023, mapId = 10, bgm ="fight_boss.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 100,y = 300}, pos_type = 2, forward = 2},
	[2] = {roleId = 2, isNpc = false,pos = {x = 400,y = 300}, pos_type = 2, forward = 1},
	[3] = {roleId = 1, isNpc = false,pos = {x = 450,y = 200}, pos_type = 2, forward = 1},
	[4] = {roleId = 6, isNpc = false,pos = {x = 400,y = 100}, pos_type = 2, forward = 1},
	[5] = {roleId = 13, isNpc = false,pos = {x = 280,y = 280}, pos_type = 2, forward = 2},
	[6] = {roleId = 5, isNpc = false,pos = {x = 320,y = 180}, pos_type = 2, forward = 2},
	[7] = {roleId = 44, isNpc = false,pos = {x = 270,y = 80}, pos_type = 2, forward = 2},
	[8] = {roleId = 17, isNpc = false,pos = {x = 100,y = 200}, pos_type = 2, forward = 2},
	[9] = {roleId = 33, isNpc = false,pos = {x = 200,y = 230}, pos_type = 2, forward = 2},
	[10] = {roleId = 55, isNpc = false,pos = {x = 130,y = 100}, pos_type = 2, forward = 2},
	[11] = {roleId = 179, isNpc = false,pos = {x = -200,y = 300}, pos_type = 1, forward = 1},
	[12] = {roleId = 179, isNpc = false,pos = {x = -200,y = 300}, pos_type = 1, forward = 1},
	[13] = {roleId = 179, isNpc = false,pos = {x = -200,y = 300}, pos_type = 1, forward = 1},
	[14] = {roleId = 179, isNpc = false,pos = {x = -200,y = 300}, pos_type = 1, forward = 1},
	[15] = {roleId = 179, isNpc = false,pos = {x = -200,y = 200}, pos_type = 1, forward = 1},
	[16] = {roleId = 179, isNpc = false,pos = {x = -200,y = 200}, pos_type = 1, forward = 1},
	[17] = {roleId = 179, isNpc = false,pos = {x = -200,y = 200}, pos_type = 1, forward = 1},
	[18] = {roleId = 179, isNpc = false,pos = {x = -200,y = 200}, pos_type = 1, forward = 1},
	[19] = {roleId = 179, isNpc = false,pos = {x = -200,y = 100}, pos_type = 1, forward = 1},
	[20] = {roleId = 179, isNpc = false,pos = {x = -200,y = 100}, pos_type = 1, forward = 1},
	[21] = {roleId = 179, isNpc = false,pos = {x = -200,y = 100}, pos_type = 1, forward = 1},
	[22] = {roleId = 179, isNpc = false,pos = {x = -200,y = 100}, pos_type = 1, forward = 1},
	[23] = {roleId = 179, isNpc = false,pos = {x = -200,y = 0}, pos_type = 1, forward = 1},
	[24] = {roleId = 179, isNpc = false,pos = {x = -200,y = 0}, pos_type = 1, forward = 1},
	[25] = {roleId = 179, isNpc = false,pos = {x = -200,y = 0}, pos_type = 1, forward = 1},
	[26] = {roleId = 179, isNpc = false,pos = {x = -200,y = 0}, pos_type = 1, forward = 1},
	[27] = {roleId = 165, isNpc = false,pos = {x = -200,y = 200}, pos_type = 1, forward = 1}
	}, actions = {
		[1] = {
    		[1] = { action_type = 4, name ="linh thứu cung chủ", image = 10006, position = 1, content ="liêu đế ngự giá thân chinh ，xem ra lần này một hồi thảm hoạ chiến tranh không thể tránh được liễu 。", sound ="",delay = 1 },
        [2] = { action_type = 4, name ="Đoàn công tử", image = 10002, position = 2, content ="có thể cùng hai vị anh cả đồng sinh cộng tử ，tiểu đệ thực sự là không uổng công cuộc đời này 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="nhân một mình ta việc liên lụy đại gia khốn hơn thế địa ……", sound ="",delay = 0 },
        [4] = { action_type = 4, name ="0", image = 0, position = 2, content ="Tiêu đại hiệp nói quá lời ，tuy rằng liêu thực lực quân đội đại ，nhưng chúng ta cũng chưa chắc sẽ táng thân hơn thế 。", sound ="",delay = 0 },
        [5] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="hảo ，nói cho cùng ！hôm nay chúng ta tựu ra sức đánh một trận ！", sound ="",delay = 0 },
        [6] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="Trần trưởng lão ，thỉnh cầu ngươi hộ tống mấy nữ quyến đi đầu nhập quan ，chúng ta tới đoạn hậu 。", sound ="",delay = 0 },
        [7] = { action_type = 4, name ="tử mà", image = 10005, position = 2, content ="không ，ta không nên ！tử cũng phải cùng tỷ phu chết ở một khối ！", sound ="",delay = 0 },
        [8] = { action_type = 4, name ="Vương cô nương", image = 10013, position = 2, content ="ta cũng sẽ không ly khai đoạn lang đích ！", sound ="",delay = 0 },	
        [9] = { action_type = 4, name ="tây Hạ công chúa", image = 10044, position = 2, content ="Tiêu đại hiệp ，ngươi không cần dĩ chúng ta vi niệm 。", sound ="",delay = 0 },	
        [10] = { action_type = 4, name ="Da Luật hồng cơ", image = 10165, position = 1, content ="ngày hôm nay ai cũng không đi được ！", sound ="",delay = 0 }
      },
    [2] = {
        [1] = { action_type = 1, targetId = 11, pos = {x = 300,y = 300}, pos_type = 1, action_time = 0.4,delay = 0 },
        [2] = { action_type = 1, targetId = 12, pos = {x = 200,y = 300}, pos_type = 1, action_time = 0.4,delay = 0 },
        [3] = { action_type = 1, targetId = 13, pos = {x = 100,y = 300}, pos_type = 1, action_time = 0.4,delay = 0 },
        [4] = { action_type = 1, targetId = 14, pos = {x = 0,y = 300}, pos_type = 1, action_time = 0.4,delay = 0 },
        [5] = { action_type = 1, targetId = 15, pos = {x = 300,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 },
        [6] = { action_type = 1, targetId = 16, pos = {x = 200,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 },
        [7] = { action_type = 1, targetId = 17, pos = {x = 100,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 },
        [8] = { action_type = 1, targetId = 18, pos = {x = 0,y = 200}, pos_type = 1, action_time = 0.4,delay = 0 },
        [9] = { action_type = 1, targetId = 19, pos = {x = 300,y = 100}, pos_type = 1, action_time = 0.4,delay = 0 },
        [10] = { action_type = 1, targetId = 20, pos = {x = 200,y = 100}, pos_type = 1, action_time = 0.4,delay = 0 },
        [11] = { action_type = 1, targetId = 21, pos = {x = 100,y = 100}, pos_type = 1, action_time = 0.4,delay = 0 },
        [12] = { action_type = 1, targetId = 22, pos = {x = 0,y = 100}, pos_type = 1, action_time = 0.4,delay = 0 },
        [13] = { action_type = 1, targetId = 23, pos = {x = 300,y = 0}, pos_type = 1, action_time = 0.4,delay = 0 },
        [14] = { action_type = 1, targetId = 24, pos = {x = 200,y = 0}, pos_type = 1, action_time = 0.4,delay = 0 },
        [15] = { action_type = 1, targetId = 25, pos = {x = 100,y = 0}, pos_type = 1, action_time = 0.4,delay = 0 },
        [16] = { action_type = 1, targetId = 26, pos = {x = 0,y = 0}, pos_type = 1, action_time = 0.4,delay = 0 },
        [17] = { action_type = 1, targetId = 27, pos = {x = 450,y = 200}, pos_type = 1, action_time = 0.4,delay = 1 }
      },	
    [3] = {
    		[1] = { action_type = 1, targetId = 2, pos = {x = 410,y = 300}, pos_type = 2, action_time = 0,delay = 1 },
        [2] = { action_type = 1, targetId = 3, pos = {x = 460,y = 200}, pos_type = 2, action_time = 0,delay = 1 },
        [3] = { action_type = 1, targetId = 4, pos = {x = 410,y = 100}, pos_type = 2, action_time = 0,delay = 1 }
      },
    [4] = {
    		[1] = { action_type = 4, name ="Da Luật hồng cơ", image = 10165, position = 2, content ="ngươi thân là người Khiết Đan cũng không vi đại liêu tận trung ，trẫm ngày hôm nay sẽ tương ngươi tử hình ！", sound ="",delay = 0 },	
        [2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="chiến sự cùng chết thương đích không chỉ có là Đại Tống đích bách tính ，còn có ta đại liêu đích binh tướng ，bệ hạ hoàn xin nghĩ lại 。", sound ="",delay = 0 },
        [3] = { action_type = 4, name ="Da Luật hồng cơ", image = 10165, position = 2, content ="trẫm ý đã quyết ，ngày hôm nay đó là bọn ngươi tử kỳ ！", sound ="",delay = 0 }        
      }
		}
	})

mapArray:push({ id = 30000, mapId = 30, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = 350, y = 200}, pos_type = 1, forward = 1},
	[2] = {roleId = 1, isNpc = false,pos = {x = 350, y = 200}, pos_type = 2, forward = 2}
	}, actions = {
		[1] = {
				[1] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="minh chủ võ lâm vị ，kiều mỗ tình thế bắt buộc 。các hạ chỉ để ý phóng ngựa nhiều ，kiều mỗ sẽ làm toàn lực đón chào 。", delay = 2 },
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="kiều bang chủ tự tin như vậy ，tại hạ bội phục 。ta bối cũng nhu toàn lực ứng phó ，khởi giáo người trong thiên hạ xem thường ！cật ta nhất chiêu ！"}
			}
		}
	})

mapArray:push({ id = 30001, mapId = 19, bgm ="fight.mp3",target = {
	[1] = {roleId = 3, isNpc = false,pos = {x = 350, y = 250}, pos_type = 2, forward = 2},
	[2] = {roleId = 0, isNpc = false,pos = {x = -200, y = 300}, pos_type = 1, forward = 1},
	[3] = {roleId = 40, isNpc = false,pos = {x = -200, y = 350}, pos_type = 1, forward = 1},
	[4] = {roleId = 136, isNpc = false,pos = {x = -200, y = 250}, pos_type = 1, forward = 1},
	[5] = {roleId = 155, isNpc = false,pos = {x = -200, y = 150}, pos_type = 1, forward = 1},
	[6] = {roleId = 114, isNpc = false,pos = {x = -200, y = 200}, pos_type = 1, forward = 1}
	}, actions = {
    [1] = {
		   [1] = { action_type = 1, targetId = 4, pos = {x = 500,y = 250}, pos_type = 1, action_time = 0.4, delay = 0 },
				[2] = { action_type = 1, targetId = 3, pos = {x = 350,y = 350}, pos_type = 1, action_time = 0.55, delay = 0 },
				[3] = { action_type = 1, targetId = 5, pos = {x = 350,y = 150}, pos_type = 1, action_time = 0.7, delay = 0 }
			},
		[2] = {
				[1] = { action_type = 4, name ="Vô Lại", image = 10136, position = 1, content ="yến hoàng ái dân như con ，quá mức đắc dân tâm ，đây là các thôn dân nộp lên đích cống phẩm ，hoàn xin vui lòng nhận 。", delay = 0.5 },
				[2] = { action_type = 4, name ="thất tâm phong Mộ Dung Phục", image = 10003, position = 2, content ="ha ha ha ，tưởng ta khôi phục đại yến ，dốc hết tâm huyết 。hiện đắc dân tâm như vậy ，quốc chi rất may 。", delay = 0 }
			},
		[3] = {
		   [1] = { action_type = 1, targetId = 2, pos = {x = 125,y = 350}, pos_type = 1, action_time = 0.3, delay = 0 },
				[2] = { action_type = 1, targetId = 6, pos = {x = 175,y = 200}, pos_type = 1, action_time = 0.4, delay = 0 }
		 },
		[4] = {
		   [1] = { action_type = 4, name ="tức giận thôn dân", image = 10114, position = 1, content="thiếu hiệp ，chính là bọn họ ！", delay = 0.5 },
				[2] = { action_type = 4, name ="tức giận thôn dân", image = 10114, position = 1, content="giá bang ác đồ hoành hành ngang ngược ，ở trong thôn tùy ý thưởng lương ，nói là vi hoàng đế đương triều “tiến cống ”。trong thôn lão nhụ đa ，một Lương thực cũng không pháp sống nha ，thiếu hiệp ngươi yếu giúp chúng ta một tay a ！"}
		 },
		[5] = {
		   [1] = { action_type = 1, targetId = 4, pos = {x = 240,y = 250}, pos_type = 2, action_time = 0.4, delay = 0},
				[2] = { action_type = 1, targetId = 3, pos = {x = 240,y = 350}, pos_type = 2, action_time = 0.4, delay = 0},
				[3] = { action_type = 1, targetId = 5, pos = {x = 240,y = 150}, pos_type = 2, action_time = 0.4, delay = 0},
				[4] = { action_type = 1, targetId = 4, pos = {x = 250,y = 250}, pos_type = 2, action_time = 0, delay = 0.5},
				[5] = { action_type = 1, targetId = 3, pos = {x = 250,y = 350}, pos_type = 2, action_time = 0, delay = 0.5},
				[6] = { action_type = 1, targetId = 5, pos = {x = 250,y = 150}, pos_type = 2, action_time = 0, delay = 0.5}
		 },
		[6] = {
		   [1] = { action_type = 4, name ="Vô Lại", image = 10155, position = 2, content ="dĩ nhiên truy tới nơi này 。", delay = 0.5},
				[2] = { action_type = 4, name ="Vô Lại", image = 10136, position = 2, content ="yến hoàng thiết mạc đợi tin bọn họ hồ ngôn loạn ngữ ，hai cái này thị tiền để cướp đoạt cống phẩm đích tiểu nhân ，bọn thuộc hạ mới vừa rồi thiếu chút nữa bị kỳ gây thương tích 。"},
				[3] = { action_type = 4, name ="thất tâm phong Mộ Dung Phục", image = 10003, position = 2, content ="lớn mật cuồng đồ ，dám ở yến cảnh trong vòng đi cướp đoạt việc ，thương ta ái thần 。đãi bổn hoàng tự mình đem bọn ngươi bắt ，xem chiêu ！"},
				[4] = { action_type = 4, name ="0", image = 0, position = 1, content ="(Yến quốc dĩ vong ，tại sao yến cảnh nói đến ？trong này tất có kỳ hoặc 。)"}
		 }
		}
	})
	
mapArray:push({ id = 30002, mapId = 31, bgm ="fight.mp3",target = {
	[1] = {roleId = 0, isNpc = false,pos = {x = -200, y = 200}, pos_type = 1, forward = 1},
	[2] = {roleId = 6, isNpc = false,pos = {x = -200, y = 250}, pos_type = 2, forward = 2},
	[3] = {roleId = 45, isNpc = false,pos = {x = -200, y = 350}, pos_type = 2, forward = 2},
	[4] = {roleId = 46, isNpc = false,pos = {x = -200, y = 350}, pos_type = 2, forward = 2},
	[5] = {roleId = 47, isNpc = false,pos = {x = -200, y = 350}, pos_type = 2, forward = 2},
	[6] = {roleId = 48, isNpc = false,pos = {x = -200, y = 350}, pos_type = 2, forward = 2}
	}, actions = {
		[1] = {
				[1] = { action_type = 1, targetId = 1, pos = {x = 650,y = 300}, pos_type = 1, action_time = 0.7},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="không ngờ ngọn núi này thượng lại có như vậy mỹ cảnh ，hôm nay đánh giá ，quả nhiên thấm vào ruột gan 。", delay = 0.5}
			},
		[2] = {
		   [1] = { action_type = 4, name ="linh thứu cung Tỳ Nữ", image = 10046, position = 2, content ="hát ！", delay = 0.5},
		   [2] = { action_type = 1, targetId = 3, pos = {x = 250,y = 350}, pos_type = 2, action_time = 0.4, delay = 0.7},
        [3] = { action_type = 1, targetId = 4, pos = {x = 350,y = 260}, pos_type = 2, action_time = 0.4, delay = 0.5},
        [4] = { action_type = 1, targetId = 5, pos = {x = 235,y = 250}, pos_type = 2, action_time = 0.4, delay = 0.8},
        [5] = { action_type = 1, targetId = 6, pos = {x = 260,y = 150}, pos_type = 2, action_time = 0.4, delay = 0.9},
        [6] = { action_type = 1, targetId = 1, pos = {x = 290,y = 300}, pos_type = 1, action_time = 0.4, delay = 1},
        [7] = { action_type = 1, targetId = 1, pos = {x = 300,y = 300}, pos_type = 1, action_time = 0, delay = 1.5}				
		 },
		[3] = {
		   [1] = { action_type = 4, name ="linh thứu cung Tỳ Nữ", image = 10046, position = 2, content ="ngươi là người phương nào ！lại dám xông vào cấm địa ？"},
				[2] = { action_type = 4, name ="linh thứu cung Tỳ Nữ", image = 10047, position = 2, content ="chẳng lẽ vừa lai đả cung chủ đích chủ ý ？sư tỷ ，tiên hạ thủ vi cường ，chúng ta thượng ！"}
		 },
		[4] = {
		   [1] = { action_type = 3, targetId = 3, action_name ="skill", end_action ="stand", delay = 0},
				[2] = { action_type = 3, targetId = 4, action_name ="skill", end_action ="stand", delay = 0},
				[3] = { action_type = 3, targetId = 5, action_name ="skill", end_action ="stand", delay = 0},
				[4] = { action_type = 3, targetId = 6, action_name ="skill", end_action ="stand", delay = 0},
		   [5] = { action_type = 5, target_srcId = 4, target_desId = 0, pos = {x = 25,y = 200}, pos_type = 2, effectId = 102755, effectType = 0, delay = 0, sound ="skill/27501"},
				[6] = { action_type = 5, target_srcId = 1, target_desId = 0, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102754, effectType = 0, delay = 1.3},
				[7] = { action_type = 3, targetId = 1, action_name ="hit", end_action ="stand", delay = 1.4},
		 },
		[5] = {
		   [1] = { action_type = 4, name ="0", image = 0, position = 1, content ="ngươi giá gái dử ！thế nào không nghe người ta nói nói ！ngươi đã môn xuất thủ trước ，tại hạ cũng xin lỗi ！", delay = 0.5},
				[2] = { action_type = 1, targetId = 1, pos = {x = 700,y = 260}, pos_type = 1, action_time = 0.4, delay = 0},
				[3] = { action_type = 3, targetId = 1, action_name ="attack", end_action ="stand", delay = 0.5},
				[4] = { action_type = 3, targetId = 3, action_name ="hit", end_action ="stand", delay = 0.7},
				[5] = { action_type = 3, targetId = 4, action_name ="hit", end_action ="stand", delay = 0.7},
				[6] = { action_type = 3, targetId = 5, action_name ="hit", end_action ="stand", delay = 0.7},
				[7] = { action_type = 3, targetId = 6, action_name ="hit", end_action ="stand", delay = 0.7}
		 },
		[6] = {
		   [1] = { action_type = 1, targetId = 2, pos = {x = 450, y = 250}, pos_type = 2, action_time = 0.4, delay = 0},
				[2] = { action_type = 1, targetId = 1, pos = {x = 240, y = 260}, pos_type = 1, action_time = 0.4, delay = 0.3},
				[3] = { action_type = 1, targetId = 1, pos = {x = 250, y = 260}, pos_type = 1, action_time = 0, delay = 0.8},
			},
		[7] = {
				[1] = { action_type = 4, name ="linh thứu cung chủ", image = 10006, position = 2, content ="vị thí chủ này ，vì sao xuất thủ thương ta linh thứu cung Tỳ Nữ ？nếu không có thiện ý mà đến ，tiểu tăng tựu không khách khí ！"},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="hảo một Hoa hòa thượng ，xem ta không thay Phật tổ hảo hảo giáo huấn ngươi một phen ！"}
		 }
		}
	})
	
mapArray:push({ id = 30003, mapId = 10, bgm ="fight.mp3",target = {
  [1] = {roleId = 0, isNpc = false, pos = {x = -200, y = 250}, pos_type = 1, forward = 1},
	[2] = {roleId = 179, isNpc = false, pos = {x = 250, y = 250}, pos_type = 2, forward = 2},
	[3] = {roleId = 181, isNpc = false, pos = {x = 450, y = 300}, pos_type = 2, forward = 1},
	[4] = {roleId = 181, isNpc = false, pos = {x = 450, y = 200}, pos_type = 2, forward = 1},
	[5] = {roleId = 181, isNpc = false, pos = {x = 550, y = 300}, pos_type = 2, forward = 1},
	[6] = {roleId = 181, isNpc = false, pos = {x = 550, y = 200}, pos_type = 2, forward = 1}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 250, y = 250}, pos_type = 1, action_time = 0.4, delay = 0},
		 },
		[2] = {
		   [1] = { action_type = 4, name ="Tướng Lĩnh Tây Hạ", image = 10179, position = 2, content ="người này tội nghiệt sâu đại ác cực ，Lý vương phi có lệnh ，sống phải thấy người ，chết phải thấy thi thể 。ác đồ kia võ công cao cường ，đại gia không nên bị kỳ bề ngoài sở phiến ，chuyến này cẩn thận một chút 。"},
				[2] = { action_type = 4, name ="Tây Hạ binh sĩ", image = 10181, position = 1, content ="thị ！"}
		 },
		[3] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 350, y = 250}, pos_type = 1, action_time = 0.4, delay = 0},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="thứ cho tại hạ mạo muội ，xin hỏi các vị sai người chuyến này phải đi bắt cái gì Đào Phạm sao ？"}
		 },
		[4] = {
		   [1] = { action_type = 1, targetId = 3, pos = {x = 460, y = 300}, pos_type = 2, action_time = 0, delay = 0},
				[2] = { action_type = 1, targetId = 4, pos = {x = 460, y = 200}, pos_type = 2, action_time = 0, delay = 0},
				[3] = { action_type = 1, targetId = 5, pos = {x = 560, y = 300}, pos_type = 2, action_time = 0, delay = 0},
				[4] = { action_type = 1, targetId = 6, pos = {x = 560, y = 200}, pos_type = 2, action_time = 0, delay = 0},
				[5] = { action_type = 4, name ="Tướng Lĩnh Tây Hạ", image = 10179, position = 2, content ="thiếu hiệp tới thật đúng lúc ，chúng ta đang muốn đi đuổi bắt ác đồ 。người này ám sát hoàng phi không có kết quả ，hoàn đả thương trong cung mấy người 。chỉ là...", delay = 1},
				[6] = { action_type = 4, name ="0", image = 0, position = 1, content ="chỉ là cái gì ？"},
				[7] = { action_type = 4, name ="Tướng Lĩnh Tây Hạ", image = 10179, position = 2, content ="ác đồ kia mặc dù sinh trứ nhất phó cả người lẫn vật vô hại mặt ，võ công lại cao cường rất 。chúng ta lần này đi vào ，sợ là dữ nhiều lành ít ，mong rằng thiếu hiệp xuất thủ tương trợ ，sau khi chuyện thành công tất hướng hoàng phi thỉnh phần thưởng 。"},
				[8] = { action_type = 4, name ="0", image = 0, position = 1, content ="chiếu tướng nói quá lời ，dẫn đường ba ，tại hạ sẽ làm toàn lực tương trợ 。"}
		 },
		[5] = {
		   [1] = { action_type = 1, targetId = 2, pos = {x = -200, y = 250}, pos_type = 2, action_time = 0.4, delay = 0},
				[2] = { action_type = 1, targetId = 3, pos = {x = -200, y = 300}, pos_type = 2, action_time = 0.55, delay = 0.25},
				[3] = { action_type = 1, targetId = 4, pos = {x = -200, y = 200}, pos_type = 2, action_time = 0.55, delay = 0.25},
				[4] = { action_type = 1, targetId = 5, pos = {x = -200, y = 300}, pos_type = 2, action_time = 0.7, delay = 0.25},
				[5] = { action_type = 1, targetId = 6, pos = {x = -200, y = 200}, pos_type = 2, action_time = 0.7, delay = 0.25},
				[6] = { action_type = 1, targetId = 1, pos = {x = -200, y = 250}, pos_type = 2, action_time = 1, delay = 0.5}
		 }
	 }
  })
	
mapArray:push({ id = 30004, mapId = 32, bgm ="fight.mp3", target = {
  [1] = { roleId = 0, isNpc = false, pos = {x = -200, y = 300}, pos_type = 1, forward = 1},
	[2] = { roleId = 29, isNpc = false, pos = {x = 350, y = 300}, pos_type = 2, forward = 2}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 200, y = 300}, pos_type = 1, action_time = 0.4, delay = 0}
	   },
		[2] = {
				[1] = { action_type = 4, name ="0", image = 0, position = 1, content ="như vậy rừng sâu núi thẳm ，lại có trưởng giả ở đây bày cuộc chơi cờ ，rất nhã hứng 。", delay = 0.5},
				[2] = { action_type = 4, name ="trân lung kỳ chúa", image = 10029, position = 2, content ="thanh niên nhân ，dữ lão hủ đối một ván cờ khỏe ？"},
				[3] = { action_type = 4, name ="0", image = 0, position = 1, content ="vừa mới hành tẩu giang hồ hơi có mệt mỏi rã rời ，nếu trưởng giả tương yêu ，ngược lại cũng không ngại ngồi xuống nghỉ tạm ，dĩ kỳ đồng nghiệp ，chuyện trò vui vẻ 。"}
		 },
		[3] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 350,y = 300}, pos_type = 1, action_time = 0.4, delay = 0},
				[2] = { action_type = 3, targetId = 2, action_name ="attack", end_action ="stand", delay = 1},
		 },
		[4] = {
		   [1] = { action_type = 3, targetId = 1, action_name ="hit", end_action ="stand", delay = 1},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="lão giả ，ta cảm giác...có một chút....cháng váng đầu...，khả phủ nhượng tại hạ...tiên nghỉ tạm....một hồi...", delay = 1},
				[3] = { action_type = 4, name ="trân lung kỳ chúa", image = 10029, position = 2, content ="ha ha ha ha ，thanh niên nhân ，lão hủ hạ đích nhưng phi thông thường kỳ 。nếu ngươi năng đi qua khảo nghiệm ，tất hội được ích lợi không nhỏ 。"}
		 },
		[5] = {
		   [1] = { action_type = 3, targetId = 2, action_name ="skill2", end_action ="stand", delay = 0},
				[2] = { action_type = 5, target_srcId = 1, target_desId = 0, pos = {x = 0, y = 0}, pos_type = 1, effectId = 112773, effectType = 0, delay = 0, sound ="skill/202"}
		 }
		}
  })
	
mapArray:push({ id = 30005, mapId = 14, bgm ="fight.mp3", target = {
    [1] = { roleId = 0, isNpc = false, pos = {x = -200, y = 250}, pos_type = 1, forward = 1},
		[2] = { roleId = 10, isNpc = false, pos = {x = -200, y = 250}, pos_type = 2, forward = 2},
		[3] = { roleId = 19, isNpc = false, pos = {x = -200, y =250}, pos_type = 2, forward = 2}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 250, y = 250}, pos_type = 1, action_time = 0.4, delay = 0},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="xa xa hình như có người ở đuổi kịp 。", delay = 2.6}
		 },
		[2] = {
		   [1] = { action_type = 1, targetId = 2, pos = {x = 500, y = 250}, pos_type = 1, action_time = 0.6, delay = 0},
				[2] = { action_type = 1, targetId = 3, pos = {x = 350, y = 250}, pos_type = 2, action_time = 0.4, delay = 0.3},
			 [3] = { action_type = 4, name ="thu thủy", image = 10019, position = 2, content ="hanh ！ngày hôm nay ngươi nhưng bào không ra ngón tay của ta lòng bàn tay liễu ！", delay = 0.8}
		 },
		[3] = {
				[1] = { action_type = 1, targetId = 2, pos = {x = 170, y = 250}, pos_type = 1, action_time = 0.4},
				[2] = { action_type = 1, targetId = 2, pos = {x = 180, y = 250}, pos_type = 1, action_time = 0, delay = 0.5},
				[3] = { action_type = 4, name ="Nữ Đồng", image = 10010, position = 2, content ="người cứu mạng a ！giá gái dử nhân ，muốn bắt ta bán cho nhân gia tố tỳ nữ 。", delay = 0.7},
				[4] = { action_type = 4, name ="0", image = 0, position = 1, content ="cô nương chớ sợ ，ta đây tựu tới giúp ngươi ！"}
		 }
	 }
  })
	
mapArray:push({ id = 30006, mapId = 2, bgm ="fight.mp3", target = {
    [1] = { roleId = 0, isNpc = false, pos = {x = -200, y = 200}, pos_type = 1, forward = 1},
		[2] = { roleId = 1, isNpc = false, pos = {x = 350, y = 250}, pos_type = 1, forward = 1}, 
		[3] = { roleId = 12, isNpc = false, pos = {x = 350, y = 250}, pos_type = 2, forward = 2}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="ngươi lão tăng này ，mau thả ta đi vào ，ta muốn gặp ta phụ thân ！", delay = 0.5},
				[2] = { action_type = 4, name ="quét rác thần tăng", image = 10012, position =2, content ="thí chủ mời trở về đi ，phụ thân ngươi cũng không ở trong chùa 。"},
				[3] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="cha ta nhất định ở nơi này trong chùa ，ngươi lão tăng này không nên gạt ta 。"}
		 },
		[2] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 200, y = 200}, pos_type = 1, action_time = 0.4 },
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="kiều bang chủ ，ta tới 。", delay = 1}
		 },
		[3] = { 
        [1] = { action_type = 1, targetId = 2, pos = {x = 340, y = 250}, pos_type = 1, action_time = 0},
        [2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 2, content ="thiếu hiệp quả nhiên không có nuốt lời ，hôm nay chi ân ，ngày khác tất báo 。", delay = 0.7}				
		 },
		[4] = {
		   [1] = { action_type = 1, targetId = 2, pos = {x = 350, y = 250}, pos_type = 1, action_time = 0},
				[2] = { action_type = 4, name ="kiều bang chủ", image = 10001, position = 1, content ="ngày hôm nay nhất định phải tương phụ thân cứu ra ，kiều mỗ xin lỗi ！", delay = 0.7}
		 }
	 }
  })
	
mapArray:push({ id = 30007, mapId = 6, bgm ="fight.mp3", target = {
    [1] = { roleId = 0, isNpc = false, pos = {x = -200, y = 200}, pos_type = 1, forward = 1},
		[2] = { roleId = 279, isNpc = false, pos = {x = 500, y = 200}, pos_type = 2, forward = 2},
		[3] = { roleId = 81, isNpc = false, pos = {x = -200, y = 200}, pos_type = 1, forward = 1},
		[4] = { roleId = 182, isNpc = false, pos = {x = -200,y = 200}, pos_type = 2, forward = 2}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 5, target_srcId = 2, target_desId = 2, pos = {x = 0, y = -25}, pos_type = 1, effectId = 7, effectType = 0, loop = true, delay = 0},
				[2] = { action_type = 1, targetId = 4, pos = {x = 300, y = 200}, pos_type = 2, action_time = 0.4, delay = 1},
		 },
		[2] = {
		   [1] = { action_type = 1, targetId = 2, pos = {x = 490, y = 200}, pos_type = 2, action_time = 0, delay = 0.5},
		   [2] = { action_type = 4, name ="Bạch y thiếu nữ", image = 10279, position = 1, content ="Quá nhi ？là ngươi sao ？Quá nhi ？", delay = 0.7},
				[3] = { action_type = 4, name ="duẫn đạo sĩ", image = 10182, position = 2, content ="......"}
		 },
		[3] = {
		   [1] = { action_type = 1, targetId = 3, pos = {x = 200, y = 200}, pos_type = 1, action_time = 0.4},
				[2] = { action_type = 4, name ="Tiểu Bảo", image = 10081, position = 1, content ="tiền phương ra vẻ có người dục biết không quỹ 。cô gái này sanh xinh đẹp như vậy ，cứ như vậy bị tao đạp thực tại đáng tiếc 。đảo không ngại cứu nàng lai ，tố lão bà của ta rất tốt 。", delay = 0.8}
			},
		[4] = {
				[1] = { action_type = 1, targetId = 3, pos = {x = 750, y = 200}, pos_type = 1, action_time = 0.4},
				[2] = { action_type = 4, name ="Tiểu Bảo", image = 10081, position = 1, content ="ngươi giá mao tặc ，quỷ quỷ túy túy làm chi ？ngày hôm nay để ta Tiểu Bảo lai hảo hảo giáo huấn ngươi giá phi lễ đồ ！"}
		 },
		[5] = {
		   [1] = { action_type = 1, targetId = 4, pos = {x = 190, y = 200}, pos_type = 2, action_time = 0.2},
				[2] = { action_type = 1, targetId = 4, pos = {x = 200, y = 200}, pos_type = 2, action_time = 0, delay = 0.3},
				[3] = { action_type = 4, name ="duẫn đạo sĩ", image ="10182", position = 2, content ="！！", delay = 0.6},
				[4] = { action_type = 1, targetId = 4, pos = {x = -200,y = 200}, pos_type = 2, action_time = 0.4, delay = 1}
		 },
		[6] = {
		   [1] = { action_type = 1, targetId = 3, pos = {x = 740, y = 200}, pos_type = 1, action_time = 0},
				[2] = { action_type = 4, name ="Tiểu Bảo", image = 10081, position = 1, content ="cô nương ngươi không sao chứ ，nhà ở nơi nào ？trên đường ác nhân đa ，Tiểu Bảo tống ngươi trở lại khỏe ？", delay = 0.2}
		 },
		[7] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 400, y = 200}, pos_type = 1, action_time = 0.4},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="dâm tặc ！ngươi nghĩ tương cô nương này buộc đáo nơi nào khứ ！ta ngày hôm nay sẽ thay trời hành đạo ，trừng gian trừ ác ！", delay = 0.7}
			},
		[8] = {
				[1] = { action_type = 1, targetId = 2, pos = {x = 500, y = 200}, pos_type = 2, action_time = 0},
				[2] = { action_type = 4, name ="Bạch y thiếu nữ", image = 10279, position = 2, content ="thiếu hiệp..."},
				[3] = { action_type = 4, name ="0", image = 0, position = 1, content ="cô nương chớ sợ ，tại hạ cái này tới cứu ngươi 。"}
		 }
	 }
  })
	
mapArray:push({ id = 30008, mapId = 22, bgm ="fight.mp3", target = {
  [1] = {roleId = 0, isNpc = false, pos = {x = 350, y = 250}, pos_type = 1, forward = 1},
	[2] = {roleId = 279, isNpc = false, pos = {x = 350, y = 250}, pos_type = 2, forward = 2}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 800, y = 250}, pos_type = 1, action_time = 0.3, delay = 2},
				[2] = { action_type = 1, targetId = 2, pos = {x = 800, y = 250}, pos_type = 2, action_time = 0.3, delay = 2},
				[3] = { action_type = 1, targetId = 1, pos = {x = 790, y = 250}, pos_type = 1, action_time = 0, delay = 2.4},
				[4] = { action_type = 1, targetId = 2, pos = {x = 790, y = 250}, pos_type = 2, action_time = 0, delay = 2.4}
		 },
		[2] = {
		   [1] = { action_type = 4, name ="0", image = 0, position = 2, content ="Bạch y thiếu nữ quả nhiên thân thủ bất phàm 。"},
				[2] = { action_type = 4, name ="Bạch y thiếu nữ", image = 10279, position = 1, content ="thiếu hiệp bị thương nhưng bang Long nhi luyện công ，Long nhi vô cùng cảm kích 。chỉ là giá tâm kinh tu hai người tài khả luyện tập ，Quá nhi hựu không ở..."}
		 },
		[3] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 340, y = 250}, pos_type = 1, action_time = 0.3},
				[2] = { action_type = 1, targetId = 2, pos = {x = 340, y = 250}, pos_type = 2, action_time = 0.3},
				[3] = { action_type = 1, targetId = 1, pos = {x = 350, y = 250}, pos_type = 1, action_time = 0, delay = 0.4},
				[4] = { action_type = 1, targetId = 2, pos = {x = 350, y = 250}, pos_type = 2, action_time = 0, delay = 0.4}
		 },
		[4] = {
		   [1] = { action_type = 4, name ="0", image = 0, position = 1, content ="Bạch y thiếu nữ nói quá lời ，ân cứu mạng tại hạ vô cùng cảm kích 。"},
				[2] = { action_type = 4, name ="Bạch y thiếu nữ", image = 10279, position = 2, content ="nhưng thương thế của ngươi thế còn chưa hoàn toàn khôi phục ，nếu bị thương nữa ，Long nhi trong lòng cũng băn khoăn 。"},
				[3] = { action_type = 4, name ="0", image = 0, position = 1, content ="tại hạ đích thương thế trong lòng mình đều biết ，Bạch y thiếu nữ không cần phải lo lắng ，kế tục ba ！"}
		 }
	 }
	})

mapArray:push({ id = 30009, mapId = 18, bgm ="fight.mp3", target = {
  [1] = {roleId = 0, isNpc = false, pos = {x = -200, y = 250}, pos_type = 1, forward = 1},
	[2] = {roleId = 40, isNpc = false, pos = {x = -200, y = 250}, pos_type = 1, forward = 1},
	[3] = {roleId = 278, isNpc = false, pos = {x = -125, y = 250}, pos_type = 2, forward = 2}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 1, targetId = 2, pos = {x = 800, y = 250}, pos_type = 1, action_time = 0.5, delay = 2},
				[2] = { action_type = 1, targetId = 1, pos = {x = 300, y = 250}, pos_type = 1, action_time = 0.3, delay = 2.3},
				[3] = { action_type = 1, targetId = 2, pos = {x = 790, y = 250}, pos_type = 1, action_time = 0, delay = 2.6}
		 },
		[2] = {
		   [1] = { action_type = 4, name ="0", image = 0, position = 1, content ="gian tặc ！ngươi đã mất lộ có thể trốn ，mau mau thúc thủ chịu trói ！", delay = 0.5},
				[2] = { action_type = 5, target_srcId = 3, target_desId = 1, pos = {x = 0, y = 0}, pos_type = 2, effectId = 120773, effectType = 0},
				[3] = { action_type = 3, targetId = 1, action_name ="hit", end_action ="stand", delay = 1},
				[4] = { action_type = 1, targetId = 3, pos = {x = 450, y = 250}, pos_type = 2, action_time = 0.4, delay = 1.2}
		 },
		[3] = {
		   [1] = { action_type = 4, name ="0", image = 0, position = 1, content ="ngươi là người phương nào ！khán võ công của ngươi cũng thuộc về thượng thừa ，vì sao phải bang giá kẻ cắp ！"},
				[2] = { action_type = 4, name ="Dương tổng quản", image = 10040, position = 2, content ="giáo chủ cứu ta ！"},
				[3] = { action_type = 4, name ="nhật nguyệt giáo chủ", image = 10278, position = 2, content ="liên đệ ngươi lui xuống trước đi ，để cho ta tới hội hội hắn 。"},
				[4] = { action_type = 1, targetId = 2, pos = {x = -200, y = 250}, pos_type = 2, action_time = 0.4},
				[5] = { action_type = 4, name ="0", image = 0, position = 1, content ="nguyên lai ngươi chính là nhật nguyệt giáo chủ ，quý giáo việc sớm có nghe thấy 。ngày hôm nay để ta ở thay giang hồ trừng gian trừ ác ！xem chiêu ！"}
		 }
	 }
	})	

mapArray:push({ id = 30010, mapId = 1, bgm ="fight.mp3", target = {
  [1] = {roleId = 280, isNpc = false, pos = {x = 550, y = 300}, pos_type = 2, forward = 2},
	[2] = {roleId = 308, isNpc = false, pos = {x = 300, y = 250}, pos_type = 2, forward = 2},
	[3] = {roleId = 0, isNpc = false, pos = {x = 300, y = 250}, pos_type = 1, forward = 1}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 4, name ="đại sư huynh", image = 10308, position = 2, content ="hồ này bạn phong cảnh tú lệ ，đại gia hăng hái tăng vọt ，thiếu hiệp lai luận bàn một ván khỏe 。"},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="vậy tại hạ tựu cung kính không bằng tòng mệnh 。"},
				[3] = { action_type = 4, name ="tiểu thư", image = 10280, position = 2, content ="ha ha ，rất tốt ，doanh mà cũng cho các ngươi cao tấu một khúc trợ hứng 。"}
		 },
	 [2] = {
		   [1] = { action_type = 3, targetId = 1, action_name ="skill2", end_action ="stand"},
				[2] = { action_type = 5, target_srcId = 1, target_desId = 3, pos = {x = 0,y = 0}, pos_type = 1, effectId = 102804, effectType = 0, loop = true}
		 },
		[3] = {
		   [1] = { action_type = 1, targetId = 3, pos = {x = 800, y = 250}, pos_type = 1, action_time = 0.3},
				[2] = { action_type = 1, targetId = 2, pos = {x = 800, y = 250}, pos_type = 2, action_time = 0.3},
				[3] = { action_type = 1, targetId = 3, pos = {x = 790, y = 250}, pos_type = 1, action_time = 0, delay = 0.4},
				[4] = { action_type = 1, targetId = 2, pos = {x = 790, y = 250}, pos_type = 2, action_time = 0, delay = 0.4}
		 },
		[4] = {
		   [1] = { action_type = 1, targetId = 3, pos = {x = 290, y = 250}, pos_type = 1, action_time = 0.3, delay = 0.5},
				[2] = { action_type = 1, targetId = 2, pos = {x = 290, y = 250}, pos_type = 2, action_time = 0.3, delay = 0.5},
				[3] = { action_type = 1, targetId = 1, pos = {x = 560, y = 330}, pos_type = 2, action_time = 0.2, delay = 0.6},
				[4] = { action_type = 1, targetId = 1, pos = {x = 550, y = 330}, pos_type = 2, action_time = 0, delay = 0.9},
				[4] = { action_type = 1, targetId = 3, pos = {x = 300, y = 250}, pos_type = 1, action_time = 0, delay = 0.9},
        [5] = { action_type = 1, targetId = 2, pos = {x = 300, y = 250}, pos_type = 2, action_time = 0, delay = 0.9}				
		 },
		[5] = {
		   [1] = { action_type = 4, name ="tiểu thư", image = 10280, position = 2, content ="các ngươi đả về đả ，nhưng chớ đánh đáo ta chỗ này lai 。nếu yếu luận bàn ，doanh mà cũng phụng bồi tới cùng ！"}
		 }
	 }
  })
	
mapArray:push({ id = 30011, mapId = 9, bgm ="fight.mp3", target = {
  [1] = {roleId = 280, isNpc = false, pos = {x = 350, y = 350}, pos_type = 1, forward = 1},
	[2] = {roleId = 0, isNpc = false, pos = {x = 250, y = 250}, pos_type = 1, forward = 1},
	[3] = {roleId = 308, isNpc = false, pos = {x = 350, y = 350}, pos_type = 2, forward = 2}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 4, name ="đại sư huynh", image = 10308, position = 2, content ="dịu dàng ，quả nhiên ta vẫn không thể lưu lại 。ta dĩ tâm chúc thiên nhai ，nếu yếu lưu ，sợ là giáo chủ lại muốn nói ta nhập giáo 。"},
				[2] = { action_type = 1, targetId = 3, pos = {x = 340, y = 350}, pos_type = 2, action_time = 0}
		 },
		[2] = {
		   [1] = { action_type = 4, name ="tiểu thư", image = 10280, position = 1, content ="ừ..."},
				[2] = { action_type = 1, targetId = 2, pos = {x = 450, y = 250}, pos_type = 1, action_time = 0.4}
		 },
		[3] = {
		   [1] = { action_type = 4, name ="0", image = 0, position = 1, content ="chậm đã ！"},
				[2] = { action_type = 1, targetId = 3, pos = {x = 350, y = 350}, pos_type = 2, action_time = 0}
		 },
		[4] = {
		   [1] = { action_type = 4, name ="đại sư huynh", image = 10308, position = 2, content ="thiếu hiệp ，lòng ta ý đã quyết 。"},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="vậy không cần nhiều lời liễu ，muốn rời khỏi ，tiên qua ta đây quan hơn nữa ！"}
		 }
	 }
  })
	
mapArray:push({ id = 30012, mapId = 31, bgm ="fight.mp3", target = {
  [1] = {roleId = 299, isNpc = false, pos = {x = 350, y = 250}, pos_type = 1, forward = 1},
	[2] = {roleId = 291, isNpc = false, pos = {x = 350, y = 250}, pos_type = 2, forward = 2},
	[3] = {roleId = 0, isNpc = false, pos = {x = -100, y = -100}, pos_type = 1, forward = 1}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 4, name ="trùng dương chân nhân", image = 10299, position = 1, content ="lần này thác mặc dù ở ta ，vi sao không nghe ta giải thích rõ 。"},
				[2] = { action_type = 4, name ="Lâm chưởng môn", image = 10291, position = 2, content ="không cần phải... nghe ngươi giải thích ！"}
		 },
	 [2] = {
		   [1] = { action_type = 1, targetId = 2, pos = {x = 675, y = 250}, pos_type = 2, action_time = 0.2}
			},
		[3] = {
		   [1] = { action_type = 3, targetId = 2, action_name ="skill2", end_action ="stand"},
				[2] = { action_type = 5, target_srcId = 2, target_desId = 1, pos = {x = 0, y = 0}, pos_type = 2, effectId = 102911, effectType = 0},
				[3] = { action_type = 3, targetId = 1, action_name ="hit", end_action ="hit"}
			},
		[4] = {
		   [1] = { action_type = 3, targetId = 1, action_name ="stand", end_action ="stand"},
			 [2] = { action_type = 1, targetId = 3, pos = {x = 425, y = 250}, pos_type = 1, action_time = 0.3},
				[3] = { action_type = 1, targetId = 2, pos = {x = 340, y = 250}, pos_type = 2, action_time = 0.2, delay = 0.2},
				[4] = { action_type = 1, targetId = 2, pos = {x = 350, y = 250}, pos_type = 2, action_time = 0, delay = 0.5},
		   [5] = { action_type = 4, name ="0", image = 0, position = 1, content ="tìm chỗ khoan dung mà độ lượng 。Lâm chưởng môn ，bất minh sự thực chỉ sợ sẽ đồ sinh hiểu lầm 。", delay = 0.6},
				[6] = { action_type = 4, name ="Lâm chưởng môn", image = 10291, position = 2, content ="chuyện giữa chúng ta ，khởi tu ngoại nhân nhiều lời ，thiếu hiệp đừng vội nhúng tay ！"}
			}
	 }
	})
	
mapArray:push({ id = 30013, mapId = 22, bgm ="fight.mp3", target = {
  [1] = {roleId = 291, isNpc = false, pos = {x = 350, y = 250}, pos_type = 1, forward = 1},
	[2] = {roleId = 299, isNpc = false, pos = {x = 350, y = 250}, pos_type = 2, forward = 2},
	[3] = {roleId = 0, isNpc = false, pos = {x = 250, y = 200}, pos_type = 1, forward = 1}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 4, name ="trùng dương chân nhân", image = 10299, position = 2, content ="hôm nay quốc nạn vào đầu ，há có thể dữ kim nhân ở chung thiên hạ ！"},
				[2] = { action_type = 4, name ="Lâm chưởng môn", image = 10291, position = 1, content ="nam tử hán đại trượng phu ，đương cùng trời địa cùng lập 。mà nay ngươi co đầu rút cổ ở đây thạch mộ trong ，dữ người nhu nhược không giống ！"},
				[3] = { action_type = 4, name ="trùng dương chân nhân", image = 10299, position = 2, content ="nhiều lời vô ích ，võ giả vô lực báo quốc ，mặc dù sinh do tử 。nói ta thất phu cũng tốt ，người nhu nhược cũng được 。gia nước vị báo ，ta sẽ không ra giá Cổ Mộ một đích 。"},
				[4] = { action_type = 4, name ="0", image = 0, position = 1, content ="chân nhân ý chí thiên hạ ，tại hạ bội phục 。nhưng giang hồ hào hiệp vi tiểu tiết khó khăn ，thật là không nên 。sao không nằm gai nếm mật ，tái khởi hậu thế ，để gia nước 。"},
				[5] = { action_type = 4, name ="trùng dương chân nhân", image = 10299, position = 2, content ="ý ta đã quyết ，các ngươi còn là mời trở về đi 。"},
				[6] = { action_type = 4, name ="Lâm chưởng môn", image = 10291, position = 1, content ="đã như vậy ，chỉ có thể mạnh mẽ dẫn hắn đi ra ！"}
		 }
	 }
  })
	
mapArray:push({ id = 30014, mapId = 30, bgm ="fight.mp3", target = {
  [1] = {roleId = 295, isNpc = false, pos = {x = 350, y = 250}, pos_type = 2, forward = 2},
	[2] = {roleId = 294, isNpc = false, pos = {x = 550, y = 350}, pos_type = 1, forward = 1},
	[3] = {roleId = 0, isNpc = false, pos = {x = -200, y = 250}, pos_type = 1, forward = 1}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 4, name ="Cô đảo quái khách", image = 10295, position = 2, content ="hôm nay tại đây mai trang luận võ chọn rể ，liền muốn quyết ra thích hợp nhất nữ nhi của ta đích hiệp nghĩa chi sĩ ！"},
				[2] = { action_type = 4, name ="trí kế hiệp nữ", image = 10294, position = 1, content ="cha ，Dung nhi từ lâu lòng có tương ứng ，không muốn dùng luận võ chọn rể quyết định chung thân đại sự 。"},
				[3] = { action_type = 4, name ="Cô đảo quái khách", image = 10295, position = 2, content ="chung thân việc khởi dung cho ngươi hồ đồ ！luận võ thắng nổi người của ta ，tài có tư cách tố ta trên đảo con rể 。"}
		 },
		[2] = {
		   [1] = { action_type = 1, targetId = 3, pos = {x = 350, y = 250}, pos_type = 1, action_time = 0.6},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="khả phủ nhượng tại hạ thử một lần 。", delay = 0.7},
				[3] = { action_type = 1, targetId = 2, pos = {x = 540, y = 350}, pos_type = 1, action_time = 0},
				[4] = { action_type = 4, name ="trí kế hiệp nữ", image = 10294, position = 2, content ="thiếu hiệp..."},
				[5] = { action_type = 4, name ="0", image = 0, position = 1, content ="dung cô nương chớ hoảng sợ ，tại hạ tự có chừng mực 。"}
		 }
	 }
  })
	
mapArray:push({ id = 30015, mapId = 1, bgm ="fight.mp3", target = {
  [1] = {roleId = 296, isNpc = false, pos = {x = -200, y = 250}, pos_type = 2, forward = 2},
  [2] = {roleId = 279, isNpc = false, pos = {x = 250, y = 250}, pos_type = 2, forward = 2},
	[3] = {roleId = 0, isNpc = false, pos = {x = 250, y = 250}, pos_type = 1, forward = 1}
  }, actions = {
	 [1] = {
		   [1] = { action_type = 4, name ="Bạch y thiếu nữ", image =10279, position = 2, content ="chẳng biết Quá nhi vừa đi ，bao thuở tài năng quay về..."},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="Bạch y thiếu nữ không cần phải lo lắng ，Dương đại hiệp hẳn là lập tức là có thể đã trở về 。"}
		 },
		[2] = {
		   [1] = { action_type = 1, targetId = 1, pos = {x = 250, y = 250}, pos_type = 2, action_time = 0.4},
				[2] = { action_type = 1, targetId = 2, pos = {x = 760, y = 275}, pos_type = 2, action_time = 0.4, delay = 0.3},
				[3] = { action_type = 1, targetId = 2, pos = {x = 750, y = 275}, pos_type = 2, action_time = 0, delay = 0.8}
		 },
		[3] = {
		   [1] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="con nuôi ta ni ？nhanh lên gọi hắn ra gặp ta ！"},
				[2] = { action_type = 4, name ="0", image = 0, position = 1, content ="lão giả ngươi nhận lầm người ba ，ở đây không có ngươi con nuôi 。"},
				[3] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="ta xem họ Dương đích tiểu tử vẫn với các ngươi cùng một chỗ ，hắn hay con nuôi ta ！"},
				[4] = { action_type = 4, name ="Bạch y thiếu nữ", image = 10279, position = 1, content ="Quá nhi bây giờ không có ở đây ，xin các hạ quay về ba 。"},
				[5] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="đừng tưởng rằng ta vừa già hựu điên tốt phiến ，con nuôi ta đang ở bên trong 。nếu yếu ngăn cản ，đừng trách ta không khách khí ！"},
				[6] = { action_type = 4, name ="0", image = 0, position = 1, content ="nhân mặc dù lớn tuổi lại khẩu xuất cuồng ngôn ，đừng vội cố tình gây sự ，nếu muốn đánh đấu ，tại hạ phụng bồi tới cùng 。"},
				[7] = { action_type = 4, name ="Điên Độc Nhân", image = 10296, position = 2, content ="vừa lúc ngứa tay rất ，quay về với chính nghĩa con nuôi ta còn không có mặt mày rạng rỡ ，tiên với ngươi quá một mấy chiêu 。"}
		 }
	 }
  })

return mapArray 
