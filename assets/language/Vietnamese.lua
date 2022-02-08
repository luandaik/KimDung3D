local Index = require('language.textIndex')
local texts = {}

texts[Index.OK]                                                        = 'Thao tác thành công, không bị lỗi'
texts[Index.parameter_error]                                           = 'Tham số lỗi'
texts[Index.MODULE_NOT_OPEN]										   = 'Chưa mở'
texts[Index.unknow_exception]                                          = 'Lỗi bất thường'

--*****************阵形********************
texts[Index.fully]                                                     = 'Vị trí đã đầy'
texts[Index.unit_not_found]                                            = 'Không tìm thấy tướng'
texts[Index.idnex_closed]                                              = 'Vị trí này chưa mở'
texts[Index.player_must_in]                                            = 'Người chơi phải ra trận '
texts[Index.unit_must_be_unique]                                       = 'Cùng lúc không thể ra trận 2 nhân vật cùng loại'
texts[Index.at_less_one_in_war_side]                                   = 'Ra trận tối thiểu 1 người'
texts[Index.bloody_unit_min_level]                                     = 'Nhân vật dưới Lv10, không thể tham dự Nhạn Môn Quan'

--*****************战斗********************
texts[Index.battle_not_found]                                          = 'Không tìm thấy thực thể chiến đấu'
texts[Index.invalidate_battle_code]                                    = 'Code chiến đấu vô hiệu, code chiến đấu được gửi tới client mỗi khi bắt đầu, 1 code chiến đấu chỉ có hiệu lực 1 lần'
texts[Index.no_challenge_times]                                        = 'Thể Lực thách đấu đã hết'
texts[Index.max_daily_buy_challenge_times]                             = 'Hôm nay đã hết lượt mua'

--*********************战斗校验****************
texts[Index.invalidate_round_count]                                    = 'Số hiệp không hợp lệ'
texts[Index.fight_action_list_is_null]                                 = 'Bảng liên kết chiến đấu trống'
texts[Index.fight_action_list_is_empty]                                = 'Bảng liên kết chiến đấu không có dữ liệu'
texts[Index.invalidate_action_from_position]                           = 'Vị trí gửi hành vi không hợp lệ'
texts[Index.invalidate_action_target_position]                         = 'Vị trí đích hành vi không hợp lệ'
texts[Index.target_unit_not_found]                                     = 'Không tìm thấy nhân vật mục tiêu'
texts[Index.action_unit_not_found]                                     = 'Không tìm thấy nhân vật hành vi'
texts[Index.invalidate_unit]                                           = 'Nhân vật có hành động không hợp lệ'
texts[Index.unit_already_die]                                          = 'Nhân vật đã tử trận'
texts[Index.target_list_count_is_empty]                                = 'Danh sách mục tiêu trống'
texts[Index.invalidte_target_list_count]                               = 'Số mục tiêu vô hiệu'
texts[Index.invalidate_target_unit]                                    = 'Nhân vật mục tiêu không hợp lệ'
texts[Index.invalidate_normal_attack_effect_value]                     = 'Giá trị hiệu quả công thường không hợp lệ'
texts[Index.have_not_learn_spell]                                      = 'Chưa học kỹ năng này'
texts[Index.can_not_cast_spell_yet]                                    = 'Chưa thể thi triển kỹ năng'
texts[Index.not_enough_energy]                                         = 'Không đủ nộ'
texts[Index.battle_already_end]                                        = 'Chiến đấu đã kết thúc'
texts[Index.invalidate_spell_effect_value]                             = 'Giá trị hiệu quả kỹ năng không hợp lệ'
texts[Index.spell_state_rate_is_zero]                                  = 'Xác suất kỹ năng cộng cho trạng thái là 0'
texts[Index.have_not_state_for_19]                                     = 'Không có trạng thái phản đòn sát thương'
texts[Index.invalidate_passive_effect_value]                           = 'Giá trị hiệu quả bị động vô hiệu'
texts[Index.invalidate_active_effect_value]                            = 'Giá trị hiệu quả chủ động vô hiệu'
texts[Index.limit_to_cast_spell]                                       = 'Giới hạn dùng kỹ năng'

--*******************推图*****************
texts[Index.section_template_not_found]                                = 'Không tìm thấy thông tin chương'
texts[Index.section_template_npc_conf_error]                           = 'Thông tin cài đặt NPC trong ải lỗi, dữ liệu bất thường'
texts[Index.pve_not_enough_challenge_times]                            = 'Không đủ lượt thách đấu'
texts[Index.prev_chapter_not_passed]                                   = 'Chưa vượt qua chương phía trước'
texts[Index.prev_section_not_passed]                                   = 'Ải phía trước chưa vượt qua'
texts[Index.chapter_template_not_found]                                = 'Không tìm thấy đối tượng dữ liệu module chương'
texts[Index.prev_difficulty_not_passed]                                = 'Hoàn thành độ khó thường để mở độ khó Tông Sư'
--texts[Index.chapter_record_not_found]                                  = 'Chưa tìm thấy thông tin vượt ải chương, không có log vượt chương này'
texts[Index.chapter_record_not_found]                                  = 'Chưa đạt 3 sao không thể quét'
texts[Index.difficulty_record_not_found]                               = 'Không tìm thấy thông tin vượt ải độ khó chỉ định, bạn chưa có log vượt ải độ khó chỉ định của chương này'
texts[Index.chapter_box_not_found]                                     = 'Không tìm thấy rương tương ứng'
texts[Index.chapter_many_pass]                                         = 'Không thể quét'
texts[Index.not_enough_star_number]                                    = 'Không đủ số sao'
texts[Index.already_open_box]                                          = 'Đã mở rương này'
texts[Index.reward_configure_not_found]                                = 'Không tìm thấy cài đặt thưởng'
texts[Index.not_enough_player_level]                                   = 'Không đủ cấp'

--******************物品*******************
texts[Index.hold_goods_not_found]                                      = 'Không có vật phẩm này'
texts[Index.goods_template_not_found]                                  = 'Không có dữ liệu module vật phẩm này'
texts[Index.package_fully]                                             = 'Túi đồ đã đầy'
texts[Index.not_equip]                                                 = 'Không phải trang bị'
texts[Index.index_not_empty]                                           = 'Vị trí này đã đặt vật phẩm'
texts[Index.different_goods_instance]                                  = 'Vật phẩm thực tế khác'
texts[Index.different_goods_template]                                  = 'Vật phẩm khác loại'
texts[Index.equip_not_found]                                           = 'Không tìm thấy trang bị'
texts[Index.can_not_equip]                                             = 'Không thể trang bị'
texts[Index.inval_position]                                            = 'Vị trí t.bị không hợp lệ'
texts[Index.broken]                                                    = 'Trang bị tổn hại'
texts[Index.package_not_found]                                         = 'Không tìm thấy túi đồ'
texts[Index.excetpion]                                                 = 'Bất thường'
texts[Index.not_enough_hold_goods]                                     = 'Không đủ vật phẩm'
texts[Index.intensify_data_not_found]                                  = 'Không tìm thấy dữ liệu cường hóa'
texts[Index.hold_equip_gem_solt_is_all_opend]                          = 'Đã mở toàn bộ lỗ ngọc của trang bị'
texts[Index.out_of_hold_equip_gem_solt_index_bound]                    = 'Chỉ dẫn lỗ ngọc vượt cấp'
texts[Index.unmosaic_gem_fail]                                         = 'Gỡ ngọc thất bại'
texts[Index.can_not_mosaic_same_gem_type_in_one_equip]                 = 'Cùng 1 trang bị không thể khảm 2 ngọc cùng loại'
texts[Index.invalid_sell_number]                                       = 'Số vật phẩm bán không hợp lệ'
texts[Index.forging_scroll_not_found]                                  = 'Không tìm thấy sách rèn, túi đồ không có sách rèn tương ứng'
texts[Index.is_not_forging_scroll]                                     = 'Vật phẩm này không phải sách rèn'
texts[Index.forging_product_template_not_found]                        = 'Không tìm thấy dữ liệu vật phẩm từ rèn, mất dữ liệu'
texts[Index.unit_not_enough_level]                                     = 'Không đủ cấp'
texts[Index.already_equiped]                                           = 'Bạn đã trang bị vật phẩm này'
texts[Index.out_of_max_intensify_level_bounds]                         = 'Không thể cường hóa thêm, đã đạt cấp tối đa'
texts[Index.can_not_intensify_level_lager_than_player_level]           = 'Cấp cường hóa không được quá cấp nhân vật'
texts[Index.not_prop]                                                  = 'Không phải đạo cụ để sử dụng riêng'
texts[Index.can_not_refining]                                          = 'Thuộc tính trang bị đã đạt tối đa, không thể tinh luyện'
texts[Index.must_set_dog_foods]                                        = 'Mục tiêu nuốt không được trống'
texts[Index.already_max_star_level]                                    = 'Cấp sao trang bị hiện tại đã đạt tối đa'
texts[Index.can_not_be_use]                                            = 'Vật phẩm không thể sử dụng'
texts[Index.data_change_and_error]                                     = 'Thay đổi dữ liệu và xuất hiện lỗi không hợp lệ'
texts[Index.can_not_merge_equipment]                                   = 'Không thể ghép trang bị'

--******************登陆/注册*******************
texts[Index.inval_uid]                                                 = 'UID không hợp lệ'
texts[Index.name_null]                                                 = 'Tên để trống'
texts[Index.inval_name_length]                                         = 'Độ dài tên không hợp lệ'
texts[Index.inval_sex]                                                 = 'Giới tính không hợp lệ'
texts[Index.inval_profession]                                          = 'Phái không hợp lệ'
texts[Index.inval_camp]                                                = 'Phe không hợp lệ'
texts[Index.inval_hometown]                                            = 'Điểm xuất hiện không hợp lệ'
texts[Index.regit_close]                                               = 'Đóng đăng ký'
texts[Index.db_exception]                                              = 'Thao tác kho dữ liệu lỗi'
texts[Index.error]                                                     = 'Thao tác bất thường'
texts[Index.duplicate_key]                                             = 'Tên này đã bị trùng!'
texts[Index.db_connect_fail]                                           = 'Kết nối kho dữ liệu bất thường'
texts[Index.plyaer_not_found]                                          = 'Không tìm thấy thông tin user'
texts[Index.player_not_belong_account]                                 = 'Nhân vật không thuộc tài khoản'
texts[Index.invalidate_validate_code]                                  = 'Mã xác thực vô hiệu'
texts[Index.player_list_is_fully]                                      = 'Không thể tạo thêm nhân vật'
texts[Index.player_invalide_name]                                      = 'Rất tiếc, tên chứa từ ngữ nhạy cảm'
texts[Index.player_same_name]                                          = 'Tên phải khác với tên gốc'
texts[Index.server_refuse_service]                                     = 'Server tạm từ chối dịch vụ'
texts[Index.regist_player_already_max]                                 = 'Số người đăng ký đã tối đa, hãy đổi server'
texts[Index.online_number_already_max]                                 = 'Số người online đã đầy, hãy thử lại sau hoặc đổi server để đăng nhập'
texts[Index.server_is_maintenance]                                     = 'Server đang bảo trì, vui lòng quay lại sau'
texts[Index.server_open_time_is_not]                                   = 'Chưa đến giờ mở, hãy quay lại sau'
texts[Index.GAG]                                   					   = 'Bạn đã bị cấm chat'
texts[Index.BAN]                                   					   = 'Bạn đã bị cấm đăng nhập, nếu có thắc mắc vui lòng liên hệ CSKH ：19006639'

--*****************玩家********************
texts[Index.player_not_found]                                          = 'Không tìm thấy người chơi'
texts[Index.not_enough_coin]                                           = 'Không đủ Đồng'
texts[Index.not_enough_sycee]                                          = 'Không đủ KNB'
texts[Index.not_enough_inspiration]                                    = 'Không đủ Chân Khí'
texts[Index.not_enough_team_exp]                                       = 'Không đủ EXP Đội'
texts[Index.not_enough_role_exp]                                       = 'Không đủ EXP n.vật'
texts[Index.not_enough_arena_score]                                     = 'Không đủ Điểm Quần Hào Phổ'
texts[Index.not_enough_vip_score]                                      = 'Không đủ Điểm VIP'
texts[Index.not_enough_errantry]                                       = 'Không đủ Hiệp Nghĩa'
texts[Index.not_enough_recruit_integral]                               = 'Không đủ Điểm chiêu mộ'
texts[Index.not_enough_jinglu]                                         = 'Không đủ Tinh Lộ, tới Vô Lượng Sơn Bắc nhận'
texts[Index.not_enough_res]                                     	   = 'Không đủ tài nguyên'
texts[Index.not_enough_team_level]                                     = 'Cấp Đội chưa đạt'
texts[Index.not_enough_body_strength]                                  = 'Không đủ Thể Lực'
texts[Index.player_offline]                                            = 'Người chơi không online'
texts[Index.vip_level_too_low]                                         = 'Chưa đủ cấp VIP'
texts[Index.not_enough_soul_card]                                      = 'Không đủ thẻ hồn'
texts[Index.pusle_max_level]                                           = 'Kinh mạch phẩm chất này đã đạt cấp tối đa'
texts[Index.pusle_max_quality]                                         = 'Kinh mạch đã đạt phẩm chất tối đa'
texts[Index.pusle_not_max_level]                                       = 'Kinh mạch chưa đạt cấp tối đa'
texts[Index.player_name_existed]                                       = 'Tên này đã tồn tại'
texts[Index.sensitive_word]                                            = 'Nội dung chứa từ ngữ nhạy cảm'
texts[Index.vip_level_reward_reced]                                    = 'Đã nhận thưởng cấp VIP'
texts[Index.have_to_wait]											   = 'Bạn cần chờ thêm một lúc để thao tác'

--*******************角色培养******************
texts[Index.role_train_unit_not_found]                                 = 'Không tìm thấy nhân vật'
texts[Index.soul_card_and_card_can_not_be_null]                        = 'Đại hiệp, ngài chưa thêm nguyên liệu truyền công~'
texts[Index.not_enough_star_level]                                     = 'Không đủ cấp sao'
texts[Index.can_not_surmount]                                          = 'Không thể đột phá'
texts[Index.role_already_max_star_level]                               = 'Đã đạt cấp sao cao nhất'
texts[Index.already_best_quality]                                      = 'Đã là phẩm chất cao nhất, không thể đột phá tiếp'
texts[Index.profession_not_found]                                      = 'Không tìm thấy phái của nhân vật'
texts[Index.already_has_unit_instance]                                 = 'Bạn đã có nhân vật này'
texts[Index.exp_already_max]                                           = 'EXP n.vật đã đạt tối đa'
texts[Index.can_not_practice]                                          = 'Không thể tu luyện'
texts[Index.role_is_Practice]                                          = 'Tướng này đang được dùng'
texts[Index.role_is_assist]                                            = 'Tướng này đang được dùng'

--********************竞技场*****************
texts[Index.arena_player_not_found]                                    = 'Không tìm thấy người chơi'
texts[Index.arena_can_not_challenge_youself]                           = 'Không thể thách đấu chính mình'
texts[Index.arena_not_enough_challenge_times]                          = 'Không đủ lượt thách đấu'

--********************铜人阵（废弃）*****************
texts[Index.eq_not_enough_challenge_times]                             = 'Đã hết lượt thách đấu'
texts[Index.have_not_reward]                                           = 'Không có thưởng'
texts[Index.have_not_challenge_record]                                 = 'Không có nhật ký thách đấu'
texts[Index.stage_npc_can_not_create]                                  = 'Cài đặt npc trong ải lỗi, không thể tạo npc'
texts[Index.have_not_attribute_choice]                                 = 'Không có thuộc tính để chọn'
texts[Index.can_not_refresh_attribute]                                 = 'Không thể làm mới thuộc tính'

--***********************Vô Lượng Sơn**************
texts[Index.climb_not_enough_challenge_times]                          = 'Lượt thách đấu đã hết'
texts[Index.invalid_section]                                           = 'Ải không hợp lệ'
texts[Index.climb_section_template_not_found]                          = 'Không tìm thấy thông tin cài đặt ải'
texts[Index.section_template_data_error]                               = 'Cài đặt ải xuất hiện lỗi'
texts[Index.max_history_extra_challenge_times]                         = 'Lượt thách đấu thêm đã đạt tối đa'
texts[Index.wannneg_max_battle_challenge_time]                         = 'PB Vô Lượng Sơn vạn năng đã đạt tối đa'
texts[Index.wannneg_battle_can_not_challenge_today]                    = 'Hiện không thể thách đấu'
texts[Index.wannneg_battle_no_challenge_time_today]                    = 'Lượt thách đấu đã hết'
texts[Index.wannneg_battle_cool_time]                                  = 'CD thách đấu chưa kết thúc'

--*********************Bang（废弃）****************
texts[Index.player_has_league]                                         = 'Người chơi đã có Bang'
texts[Index.league_existed]                                            = 'Bang này đã tồn tại'
texts[Index.league_not_existed]                                        = 'Bang này không tồn tại'
texts[Index.not_in_same_league]                                        = 'Người chơi ở Bang khác'
texts[Index.not_league_member]                                         = 'Không phải thành viên'
texts[Index.leader_cannot_quit_league]                                 = 'Bang Chủ không thể rời Bang'
texts[Index.not_league_leader]                                         = 'Không có quyền Bang Chủ'
texts[Index.not_league_manager]                                        = 'Không có quyền quản lý Bang'
texts[Index.cannot_invite_myself]                                      = 'Không thể mời chính mình'
texts[Index.no_invite]                                                 = 'Lời mời không tồn tại hoặc quá hạn'
texts[Index.player_has_apply]                                          = 'Đã có Bang yêu cầu'
texts[Index.player_no_apply]                                           = 'Chưa yêu cầu Bang này'
texts[Index.no_second_leader]                                          = 'Không có Bang Phó'
texts[Index.quit_league_cool_time]                                     = 'Thoát Bang chưa đủ 24 giờ'
texts[Index.no_enough_money]                                           = 'Bang không đủ tài nguyên'
texts[Index.no_enough_offer]                                           = 'Cống hiến thành viên Bang chưa đủ'
texts[Index.goods_building_level_max]                                  = 'Kiến trúc cống hiến Bang đã đạt cấp tối đa'
texts[Index.buff_building_level_max]                                   = 'Kiến trúc phồn vinh Bang đã đạt cấp tối đa'
texts[Index.got_building_goods]                                        = 'Đã nhận vật phẩm kiến trúc cống hiến Bang'
texts[Index.got_buff_today]                                            = 'Bang đã nhận BUFF kiến trúc phồn vinh'

--*********************Shop****************
texts[Index.shop_entry_not_found]                                      = 'Shop đã làm mới, số vật phẩm đã cập nhật'
texts[Index.shop_count_today_usedup]                                   = 'Hôm nay đã hết lượt mua'
texts[Index.shop_count_sum_usedup]                                     = 'Lượt mua đã hết'
texts[Index.shop_count_vip_usedup]                                     = 'Lượt mua vip đã hết'
texts[Index.shop_bad_time]                                             = 'Hiện tại không thể mua'
texts[Index.shop_error_num]                                            = 'Mua tối thiểu 1 cái'
texts[Index.shop_auto_refresh_not_yet]                                 = 'Chưa đến giờ tự động làm mới'
texts[Index.shop_entry_not_yours]                                      = 'Trong shop không có vật phẩm này'
texts[Index.shop_max_num]                                              = 'Lượng mua đã tối đa'
texts[Index.shop_can_not_exhanged]                                     = 'Không thể đổi(Đổi điểm shop Quần Hào Phổ)'
texts[Index.shop_closed]											   = 'Đã đóng shop'

--********************充值*****************
texts[Index.recharge_exist]                                            = 'Mã nạp đã tồn tại'
texts[Index.recharge_fail_unkown]                                      = 'Mã nạp thất bại, chưa rõ nguyên nhân'
texts[Index.recharge_close]                                            = 'Liên Hệ Fanpage'
texts[Index.recharge_not_found]                                        = 'Mã nạp đã tồn tại'
texts[Index.recharge_already_finish]                                   = 'Đã hoàn thành giao dịch'

--*******************聊天******************
texts[Index.player_offline]                                            = 'Người chơi không online'
texts[Index.player_no_speak]                                           = 'Người chơi bị cấm chat'
texts[Index.CHAT_PUBLIC]                                               = 'Đạt cấp Lv15 hoặc VIP1 mở chat'
texts[Index.CHAT_TIMT]                                                 = 'Chat quá nhanh, hãy nghỉ một lát'
texts[Index.CHAT_CONTENT_SAME]                                         = 'Không gửi tin trùng lặp'
texts[Index.CHAT_REPORT_SAME]                                          = 'Không báo cáo lại người chơi này'

--*********************Chiêu mộ****************
texts[Index.recruit_not_free_but_request_free]                         = 'Client yêu cầu chiêu mộ miễn phí, nhưng server vẫn tồn tại CD'

--******************邮件*******************
texts[Index.mail_not_exist]                                            = 'Thư không tồn tại'
texts[Index.mail_not_receive]                                          = 'Thư không được nhận'
texts[Index.mail_had_receive]                                          = 'Thư đã nhận'
texts[Index.report_not_exist]                                          = 'Dữ liệu chiến báo không tồn tại'
texts[Index.mail_have_attachment_and_not_recive]                       = 'Chưa nhận đính kèm, không thể xóa thư'
texts[Index.mail_is_protected]                                         = 'Thư hệ thống được bảo lưu 12 giờ, sau đó mới được xóa'

--**********************任务/成就***************
texts[Index.mission_UNKNOW_ID]                                         = 'Tên nhệm vụ lỗi'
texts[Index.mission_not_existed]                                       = 'Không có nhiệm vụ này'
texts[Index.mission_not_completed]                                     = 'Chưa hoàn thành n.vụ'
texts[Index.mission_finished]                                          = 'Nhiệm vụ đã kết thúc'
texts[Index.task_7days_discount_conf_not_found]                              = 'Không tìm thấy vật phẩm chiết khấu'
texts[Index.task_7days_discount_conf_error]                                  = 'Cài đặt vật phẩm chiết khấu lỗi'
texts[Index.task_7days_discount_sold_out]                                    = 'Vật phẩm đã bán hết'

--********************大宝藏*****************
texts[Index.treasure_can_not_challenge_youself]                        = 'Không thể thách đấu chính mình'
texts[Index.target_is_not_player]                                      = 'Mục tiêu không hợp lệ, không phải người chơi'
texts[Index.treasure_not_enough_challenge_times]                                = 'Không đủ Lượt thách đấu'
texts[Index.already_have_excavation]                                   = 'Bạn đã chiếm hữu 1 điểm khai quật'
texts[Index.max_history_extra_challenge_times]                         = 'Lượt thách đấu thêm đã tối đa'
texts[Index.treasure_not_found]                                        = 'Không tìm thấy kho báu'
texts[Index.treasure_box_index_out_of_bound]                           = 'Chỉ dẫn vượt giới hạn'
texts[Index.prev_open_treasure_is_null]                                = 'Lần cuối cùng mở rương kho báu trống'
texts[Index.treasure_is_not_box]                                       = 'Kho báu không phải rương'
texts[Index.treasure_is_not_goods]                                     = 'Kho báu không phải vật phẩm'

--*********************活动****************
texts[Index.activity_not_exist]                                        	= 'Sự kiện không tồn tại'
texts[Index.activity_not_start]                                        	= 'Sự kiện chưa bắt đầu'
texts[Index.activity_finished]                                         	= 'Sự kiện đã kết thúc'
texts[Index.template_not_found]											= 'Không tìm thấy dữ liệu sự kiện'
texts[Index.not_visiable]												= 'Không thể thấy sự kiện'
texts[Index.progress_not_found]											= 'Không có tiến độ sự kiện'
texts[Index.reward_key_not_found]										= 'Không có thưởng này'
texts[Index.not_finish]													= 'Chưa hoàn thành'
texts[Index.not_enough_got_times]										= 'Không đủ lượt nhận'

--******************技能*******************
texts[Index.already_max_level]                                         = 'Kỹ năng đã đạt cấp tối đa'
texts[Index.spell_template_not_found]                                  = 'Không tìm thấy module dữ liệu kỹ năng'
texts[Index.have_not_spell_setting]                                    = 'Nhân vật không có cài đặt kỹ năng'
texts[Index.have_not_target_spell]                                     = 'Nhân vật không có cài đặt kỹ năng mục tiêu'
texts[Index.next_level_spell_date_not_found]                           = 'Không tìm thấy dữ liệu kỹ năng cấp sau'
texts[Index.not_enough_spell_study_point]                              = 'Không đủ điểm kỹ năng'
texts[Index.spell_level_already_max_for_player_level_limit]            = 'Cấp kỹ năng đã đạt giới hạn tối đa theo cấp đội'
texts[Index.spell_level_already_max_for_unit_level_limit]			   = 'Hãy nâng cấp nhân vật trước và thử lại'

--*******************奇遇******************
texts[Index.qiyu_dining_time_not]                                      = 'Chưa đến giờ dùng bữa'
texts[Index.qiyu_dining_dined]                                         = 'Đã dùng bữa rồi'
texts[Index.qiyu_action_not_act]                                       = 'Sự kiện chưa mở hoặc đã kết thúc'
texts[Index.sign_signed]                                               = 'H.nay đã ký danh'

--********************Mã mời*****************
texts[Index.not_active_inv_code]                                       = 'Sự kiện mã mời chưa mở'
texts[Index.invite_code_not_existed]                                   = 'Mã mời này không tồn tại'
texts[Index.invite_code_used]                                          = 'Bạn đã dùng mã mời'
texts[Index.no_this_reward]                                            = 'Không có thưởng này'
texts[Index.has_gotten_this_reward]                                    = 'Đã nhận thưởng này'
texts[Index.no_enough_invite_time_to_get_reward]                       = 'Không đủ lượt mời để nhận thưởng này'
texts[Index.invite_can_not_verify_yourself]                            = 'Rất tiếc, không thể xác thực mã mời của chính bạn'
texts[Index.invite_fail_level_limit]								   = 'Bạn đã vượt qua cấp mời'

--*********************月卡****************
texts[Index.contract_no_existed]                                       = 'Khế ước không tồn tại'
texts[Index.contract_existed]                                          = 'Khế ước đã tồn tại'
texts[Index.contract_out_of_date]                                      = 'Khế ước đã quá hạn'
texts[Index.contract_got_reward_doday]                                 = 'Hôm nay đã nhận thưởng'
texts[Index.not_active_yue_ka]                                         = 'Thẻ tháng chưa mở'

--**********************护驾***************
texts[Index.escorting_not_enough_challenge_times]                      = 'Không đủ lượt thách đấu'
texts[Index.escorting_already_finish]                                  = 'Lần hộ giá này đã kết thúc'
texts[Index.escorting_have_not_finish]                                 = 'Hộ giá chưa kết thúc'
texts[Index.not_enough_level_to_escorting]                             = 'Bạn chưa đủ cấp hộ giá'
texts[Index.escorting_configure_error]                                 = 'Cài đặt dữ liệu lỗi'
texts[Index.escorting_date_not_found]                                  = 'Cài đặt dữ liệu lỗi-Không có cài đặt dữ liệu'
texts[Index.is_waiting]                                                = 'Đang CD'

--********************Nhạn Môn Quan*****************
texts[Index.no_enemy]                                                  = 'Ải này chưa mở hoặc không tồn tại'
texts[Index.has_passed_section]                                        = 'Đã vượt qua ải này, không thể thách đấu lại'
texts[Index.not_pass_prevous_section]                                  = 'Chưa vượt qua ải trước'
texts[Index.no_box_item]                                               = 'Không có mục rương này'
texts[Index.box_item_in_hidden_status]                                 = 'Rương không trong trạng thái không thể thấy'
texts[Index.box_item_not_in_can_buy_status]                            = 'Rương không trong trạng thái có thể mua'
texts[Index.box_item_not_in_free_status]                               = 'Rương không trong trạng thái nhận miễn phí'
texts[Index.daily_inspire_time_used_up]                                = 'Hôm nay đã hết lượt cổ vũ'
texts[Index.bloody_unit_all_dead]                                      = 'Tướng ra trận đã tử vong toàn bộ, không thể thách đấu'
texts[Index.not_enough_bloody_reset_count]							   = 'Nhạn Môn Quan đã hết lượt cài lại'
texts[Index.not_pass_level]							   				   = 'Số ải đã vượt chưa đạt để quét'

--*******************开服活动（废弃）******************
texts[Index.have_wait_time]                                            = 'Bạn cần chờ thêm một khoảng thời gian'
texts[Index.already_get]                                               = 'Bạn đã nhận thưởng này'
texts[Index.not_enough_level]                                          = 'Bạn chưa đủ cấp'
texts[Index.not_enough_times]                                          = 'Không đủ lượt tích lũy'
texts[Index.not_supported]                                             = 'Không cho phép'
texts[Index.reward_not_found]                                          = 'Không tìm thấy thưởng'
texts[Index.activity_reward_configure_not_found]                       = 'Không tìm thấy thông tin cài đặt thưởng'
texts[Index.invalidate_request]                                        = 'Yêu cầu không hợp lệ'
texts[Index.open_activity_not_start]                                   = 'Sự kiện chưa bắt đầu'
texts[Index.open_activity_already_end]                                 = 'Sự kiện đã kết thúc'

--**********************押镖***************
texts[Index.not_active_yabiao]                                         = 'Chưa mở áp tiêu'
texts[Index.not_got_reward]                                            = 'Chưa nhận thưởng áp tiêu lần trước'
texts[Index.not_in_yabiao_status]                                      = 'Hiện không áp tiêu'
texts[Index.in_yabiao_status]                                          = 'Đang áp tiêu'
texts[Index.no_yabiao_time_today]                                      = 'Hôm nay đã hết lượt áp tiêu'
texts[Index.can_not_got_reward]                                        = 'Chưa hoàn thành áp tiêu để nhận thưởng'

--**********************礼包******************
texts[Index.already_use]					       = 'Giftcode đã được dùng, hãy đổi và thử lại'
texts[Index.invitation_not_found]				       = 'Giftcode sai, hãy kiểm tra lại'
texts[Index.invitation_package_not_found]			       = 'Không tìm thấy quà này, hãy kiểm tra lại'
texts[Index.already_use_same_package]				       = 'Đã nhận quà này'
texts[Index.time_less_than_package]				       = 'Chưa đến giờ nhận'
texts[Index.package_not_start_time]				       = 'Chưa mở gói quà'
texts[Index.package_out_of_end_time]				       = 'Gói quà đã đóng'
texts[Index.INVALID_CHANNEL]													= 'Mã kênh vô hiệu'

--**********************点赞*******************
texts[Index.already_praise_target_player]								= 'Hôm nay đã like người này'
texts[Index.not_enough_praise_time] 									= 'Hôm nay đã hết lượt like'

--*****************掉落********************
texts[Index.drop_group_not_found]                                      = 'Không tìm thấy nhóm rớt'
texts[Index.drop_item_not_found]                                       = 'Không tìm thấy nhóm rớt'
texts[Index.drop_result_is_null_or_empty]                              = 'Kết quả rớt rỗng'

--******************Phục Ma Lục*******************
texts[Index.boss_fight_is_not_open]										= 'Sự kiện chưa bắt đầu'
texts[Index.boss_fight_is_time_out]										= 'Sự kiện đã kết thúc'
texts[Index.boss_fight_is_NOT_ENOUGH_CHALLENGE_TIMES]					= 'Không đủ lượt thách đấu'
texts[Index.boss_fight_is_CONFIGURE_NOT_FOUND]							= 'Không tìm thấy thông tin cài đặt'
texts[Index.boss_fight_is_CONFIGURE_FORMATION_ERROR ]					= 'Không tìm thấy thông tin cài đặt'

--*****************Hảo Hữu********************
texts[Index.PLAYER_NOT_EXIST]                                                  = 'Người này không tồn tại'
texts[Index.PLAYER_IS_FRIEND]                                                  = 'Bạn và người này đã là hảo hữu'
texts[Index.PLAYER_IS_APPLY]                                                   = 'Bạn đã gửi yêu cầu cho người này'
texts[Index.FRIEND_APPLY_IS_FULL]                                              = 'Danh sách yêu cầu hảo hữu của đối phương đã đầy'
texts[Index.APPLY_NOT_EXIST]                                                   = 'Bạn đã gửi yêu cầu'
texts[Index.FRIEND_IS_FULL]                                                    = 'Danh sách hảo hữu đã đầy'
texts[Index.SIDE_FRIEND_IS_FULL]                                               = 'Danh sách hảo hữu đối phương đã đầy'
texts[Index.FRIEND_NOT_EXIST]                                                  = 'Hảo hữu này không tồn tại'
texts[Index.NOT_IN_GIVE_TIME]                                                  = 'Chưa đến giờ tặng'
texts[Index.NOT_GIVE]                                                          = 'Không thể nhận'
texts[Index.DRAW_FULL]                                                         = 'Hôm nay đã hết lượt nhận'
texts[Index.GIVE_FULL]                                                         = 'Hôm nay đã hết lượt tặng'
texts[Index.has_to_Assist]                                                     = 'Người này hôm nay đã trợ chiến'
texts[Index.Assist_in_FULL]                                                    = 'Lượt nhận trợ chiến hôm nay đã tối đa'
texts[Index.Assist_in_FULL2]                                                   = 'Lượt trợ chiến hôm nay đã tối đa'


--*****************Bang********************
texts[Index.NUPTIAL]                                                    = 'Tên này đã tồn tại'
texts[Index.HAS_GUILD]                                                  = 'Bạn đã vào Bang'
texts[Index.APPLY_IS_FULL]                                              = 'Số yêu cầu hôm nay đã tối đa'
texts[Index.APPLY_NOT_EXIST]                                            = 'Đối tượng yêu cầu không tồn tại'
texts[Index.GUILD_IS_FULL]                                              = 'Bang đã đủ người'
texts[Index.MEMBER_HAS_GUILD]                                           = 'Người này đã có Bang'
texts[Index.GUILD_NOT_EXIST]                                            = 'Bang không tồn tại'
texts[Index.PRESIDENT_IMPEACHMENT]                                      = 'Bang Chủ đã bị luận tội'
texts[Index.IMPEACHMENT_NO_TIME]                                        = 'Không đủ số thành viên sôi nổi để phát động luận tội'
texts[Index.DECLARATION_INSUFFICIENT]                                   = 'Không đủ cống hiến Bang'
texts[Index.HAS_BEEN_INVITED]                                           = 'Người này đã được mời'
texts[Index.NAME_ERROR]                                                 = 'Tên chứa ký tự đặc biệt'
texts[Index.PUNISHMENT_TIME]                                            = 'Người này thoát Bang chưa đủ 24 giờ'
texts[Index.NAME_SENSITIVE_WORD]                                        = 'Tên chứa ký tự đặc biệt'
texts[Index.MEMBER_EXIT_GUILD]                                          = 'Thàn viên đã rời Bang'
texts[Index.MAKED_COUNT_FULL]                                           = 'Lượt được kết giao của người này đã hết'
texts[Index.WORSHIP_FULL]                                               = 'Lượt tế bái Bang đã đầy'
texts[Index.OPEN_NOT_IN_TIME]                                           = 'Thời gian nhận quá lâu'
texts[Index.ZONE_IS_OPEN]                                               = 'PB đã được mở'
texts[Index.BOOM_DEFICIENCY]                                            = 'Không đủ Phồn Vinh'
texts[Index.ZONE_IS_LOCKED]                                             = 'PB đã bị khóa'
texts[Index.ZONE_RESET]                                                 = 'PB đã bị cài lại'
texts[Index.ZONE_RESET_FULL]                                            = 'PB đã cài lại tối đa'
texts[Index.Chest_Upper]                                                = 'Hôm nay lượt nhận rương đã tối đa'
texts[Index.NO_CHALLENGE_ZONE]                                          = 'Thành viên mới vào Bang trong ngày không thể đánh Hậu Sơn'


--**********************争霸赛**********************
texts[Index.BATTLE_IS_NOT_START]                                    = 'Đối chiến chưa bắt đầu hoặc đã kết thúc'
texts[Index.NO_PLAYER_CAN_MATCH]                                    = 'Không có người để ghép'
texts[Index.MATCH_NOT_IN_TIME]                                      = 'Đối chiến đang CD, hãy thử lại sau'
texts[Index.BET_NOT_IN_TIME]                                        = 'Đã quá thời gian cược'
texts[Index.APPLY_CROSS_CHAMPIONS_FULL]								= 'Đã đủ người'

--**********************Vô Lượng Sơn北窟******************
texts[Index.BEIKU_CAN_NOT_RESET]                                            = 'Đã hết lượt cài lại'
texts[Index.BEIKU_NPC_FORMATION_NOT_FOUND]                                  = 'Không tìm thấy thông tin cài đặt NPC'
texts[Index.BEIKU_GAME_LEVEL_NOT_FOUND]	                                    = 'Không tìm thấy thông tin cài đặt ải'
texts[Index.BEIKU_ALREAY_MAX_GAME_LEVEL]	                                = 'Không có thêm cài đặt ải'
texts[Index.BEIKU_INVALIDATE_GAME_LEVEL_ID]	                                = 'ID ải không hợp lệ'
texts[Index.BEIKU_CAN_NOT_CHOICE_ATTRIBUTE]                                 = 'Không thể chọn thuộc tính này'
texts[Index.BEIKU_CHOICE_ATTRIBUTE_NOT_FOUND]                               = 'Không thể chọn thuộc tính có thể dùng'
texts[Index.BEIKU_CHOICE_ATTRIBUTE_CONF_NOT_FOUND]                          = 'Không tìm thấy lựa chọn cài đặt thuộc tính'
texts[Index.BEIKU_ATTRIBUTE_ALREAY_CHOICED]                                 = 'Đã chọn thuộc tính này'
texts[Index.BEIKU_CHOICE_ATTRIBUTE_NOT_VALIDATE]                            = 'Cài đặt thuộc tính này lỗi'
texts[Index.BEIKU_NOT_ENOUGH_TOKENS]                                        = 'Không đủ Đá Vô Lượng Sơn'
texts[Index.BEIKU_HAVE_NOT_CHEST_CAN_OPEN]                                  = 'Không có rương để mở'
texts[Index.BEIKU_CHEST_ALREAY_OPEN]                                        = 'Đã mở rương này'
texts[Index.BEIKU_CHEST_CONFIGURE_IS_NULL]                                  = 'Cài đặt rương trống'
texts[Index.BEIKU_ATTRIBUTE_ALREAY_CHOICED_IS_SKIP]                         = 'Bạn đã bỏ qua cổ vũ, không thể chọn lại'
texts[Index.BEIKU_CAN_NOT_SWEEP]                                            = 'Địch quá mạnh, không thể quét'
texts[Index.BEIKU_HAS_NOT_PASS]                                             = 'Thách đấu ải này thất bại, cần cài lại Vô Lượng Sơn Bắc'
texts[Index.BEIKU_GET_AND_SWEEP]                                            = 'Bạn có rương chưa nhận, hãy nhận trước khi quét'    
texts[Index.BEIKU_CHOICE_ATTRIBUTE_AND_SWEEP]                               = 'Có thuộc tính chưa chọn, hãy chọn trước khi quét'   

--**********************砸蛋******************
texts[Index.EGG_ACTIVITY_IS_NOT_START]                                      = 'Chưa đến giờ mở'
texts[Index.EGG_PROP_NOT_ENOUGH]                                            = 'Không đủ đạo cụ đập trứng'
texts[Index.EGG_REWARD_NOT_FOUND]	                                        = 'Cài đặt thưởng trống'
texts[Index.EGG_NUMBER_ERROR]	                                            = 'Lượt đập trứng lỗi'
texts[Index.EGG_GOLD_HAMMER_NOT_ENOUGH]	                                    = 'Không đủ Búa Vàng'
texts[Index.EGG_SILVER_HAMMER_NOT_ENOUGH]	                                = 'Không đủ Búa Bạc'

--************************采矿*******************
texts[Index.NO_SELECT_FORMATION]											= 'Ra trận tối thiểu 1 tướng'
texts[Index.NOT_ENOUGH_ROB_TIMES]											= 'Hết lượt cướp'
texts[Index.NOT_STTATEGY_MINE]												= 'Không có đội hình phòng thủ mỏ'
texts[Index.NOT_MINE_PLAYER_IS_LOCK]										= 'Người này đang bị cướp'
texts[Index.MINE_Complete]									             	= 'Người này đã đào xong'



--************************老玩家回归*******************
texts[Index.regression_Invitation_code_error1]                              = 'Mã mời lỗi, hãy kiểm tra và nhập lại'
texts[Index.regression_Invitation_code_error2]                              = 'Mã mời lỗi, hãy kiểm tra và nhập lại'
texts[Index.regression_Invitation_code_error3]                              = 'Mã mời lỗi, hãy kiểm tra và nhập lại'
texts[Index.regression_Has_returned]                                        = 'Người chơi đã quay lại, không thể chiêu hồi'
texts[Index.regression_Insufficient_level]                                  = 'Cấp mục tiêu không đủ'
texts[Index.regression_Insufficient_day]                                    = 'Số ngày không đăng nhập chưa đủ điều kiện'


--***********************雇佣侠客**************************
texts[Index.CAN_NOT_DISPATCH_Hire_a_knight]                                                = 'Không thể phái'     
texts[Index.IN_THE_GROUP_Hire_a_knight]                                                    = 'Tướng này đang trong đội'
texts[Index.NOT_IN_THE_GROUP_Hire_a_knight]                                                = 'Tướng này không có trong đội'
texts[Index.NOT_VIP_LEVEL_Hire_a_knight]                                                   = 'VIP chưa đạt'
texts[Index.NOT_TIME_Hire_a_knight]                                                        = 'Chưa đủ thời gian'
texts[Index.NOT_FOUND_Hire_a_knight]                                                       = 'Làm mới thông tin tướng, hãy chọn lại'
texts[Index.ALREADY_HIRE_Hire_a_knight]                                                    = 'Đã thuê rồi'
texts[Index.FORMATION_IS_EMPTY_Hire_a_knight]                                              = 'Đội hình Sát Thủ không có nhân vật ra trận'




--***********************雇佣队伍**************************
texts[Index.CAN_NOT_DISPATCH_Hiring_team]                                                = 'Không thể phái' 
texts[Index.NOT_FOUND_Hiring_team]                                                       = 'Không tìm thấy đội được cử'
texts[Index.IS_NOT_DISPATCH_STATE_Hiring_team]                                           = 'Không trong trạng thái phái'
texts[Index.NOT_ENOUGH_DISPATCH_TIME_Hiring_team]                                        = 'Chưa đủ thời gian phái đi'
texts[Index.BATTLE_ROLE_IS_EMPTY_Hiring_team]                                            = 'Nhân vật ra trận trống'
texts[Index.HAVE_IN_ROLE_MERCENARY_Hiring_team]                                          = 'Sát thủ không thể ra trận'
texts[Index.ALREADY_HIRE_TEAM_Hiring_team]                                               = 'Bạn đã thuê đội này rồi'
texts[Index.HIRE_TEAM_NOT_FOUND_Hiring_team]                                             = 'Không tìm thấy thông tin đội sát thủ đã thuê'
texts[Index.HIRE_TEAM_USE_TYPE_NOT_SAME_Hiring_team]                                     = 'Loại đội sát thủ đã thuê không phù hợp'
texts[Index.HIRE_TEAM_MODIFY_ROLE_MISS_Hiring_team]                                      = 'ID nhân vật đội sát thủ đã thuê mất'

--***********************Đá Thô**************************
texts[Index.DUSHI_NOT_ENABLE]                                                            = 'Chưa kích hoạt'
texts[Index.DUSHI_CONFIGURE_NOT_FOUND]                                                   = 'Không tìm thấy cài đặt Đá Thô'
texts[Index.DUSHI_DROP_GROUP_NOT_FOUND]                                                  = 'Không tìm thấy cài đặt rớt'
texts[Index.DUSHI_DROP_EMPTY]                                                            = 'Không tìm thấy ngọc nhóm rớt'
texts[Index.DUSHI_ITEM_LIST_FULLY]                                                       = 'Cột ngọc đầy, hãy nhặt và thử lại'
texts[Index.DUSHI_HAVE_NOT_ITEM]                                                         = 'Không có ngọc để nhặt'
texts[Index.DUSHI_ITEM_NOT_FOUND]                                                        = 'Không thể nhặt ngọc này'




--***********************侠客Luyện Thể**************************
texts[Index.Refining_the_bodyNo_open]                                                    = 'Chưa mở huyệt vị'
texts[Index.Refining_the_bodyLevel_Max]                                                  = 'Huyệt vị đã đột phá tới cấp tối đa'
texts[Index.Refining_the_bodyLevel_low]                                                  = 'Cấp Kinh Mạch không vượt quá cấp nhân vật'
texts[Index.Refining_the_bodyNO_Level]                                                   = 'Cấp Kinh Mạch chưa đạt'





--***********************江湖金库**************************
texts[Index.Fund_short_EXCEED_MAX_BUY_LEVEL]                                 = 'Vượt quá cấp mua giới hạn'
texts[Index.Fund_short_BOUGHT_FUND]                                          = 'Đã mua xu này'
texts[Index.Fund_short_NOT_BUY_FUND]                                         = 'Chưa mua xu này'
texts[Index.Fund_short_NOT_ACHIEVE_LEVEL]                                    = 'Chưa đạt cấp yêu cầu để nhận xu'
texts[Index.Fund_short_RECEIVE_FUND_REWARD]                                  = 'Đã nhận thưởng xu'

--***********************战力活动**************************
texts[Index.PowerActivity_NOT_EXIST]                                   = 'Sự kiện không tồn tại'
texts[Index.PowerActivity_IS_COMPLETE]                                 = 'Sự kiện đã hoàn thành'
texts[Index.PowerActivity_NOT_ACHIEVE]                                 = 'Không đủ lượt nhận'
texts[Index.PowerActivity_NOT_COMPLETE]                                = 'Tạm thời không thể nhận thưởng này'


--***********************Long Môn Phá活动**************************
texts[Index.Longmen_NOT_enough_trap]                                = 'Không đủ Cơ Quan Vị'


--***********************强制重生**************************
texts[Index.Practiceing]                                            = 'Tướng đang tu luyện'
 
--***********************论剑登峰**************************
texts[Index.peak_PLAYER_LEAVE]                                             = 'Đối phương đã rời Trận Nhãn này'
texts[Index.peak_NOT_PEAK_CHALLENGE_VALUE]                                 = 'Không đủ lượt thách đấu'
texts[Index.peak_PEAK_CHANGE]                                              = 'Vị trí Trận Nhãn thay đổi'
texts[Index.peak_NOT_CHANGE_MYSELF]                                        = 'Không thể thách đấu chính mình'
texts[Index.peak_PEAK_CLOSE]                                               = 'Đang tổng kết thưởng, 23:55-00:05 không thể chiếm, bỏ Trận Nhãn'
texts[Index.peak_PEAK_OPEN_TIME]                                           = 'Đỉnh Luận Kiếm mở vào 10:00 - 22:00 mỗi thứ 5'






--***********************Long Môn Phá**************************
texts[Index.Longmen_Break_No_open]                                             = 'Long Môn Phá chưa mở'
texts[Index.Longmen_Break_No_reward]                                           = 'Chưa cài thưởng sự kiện'
texts[Index.Longmen_Break_No_time]                                             = 'Không đủ lượt'
texts[Index.Longmen_Break_Can_not_Refresh]                                     = 'Không thể làm mới thưởng'
texts[Index.Longmen_Break_No_trap]                                             = 'Không có Cơ Quan Vị'
texts[Index.Longmen_Break_Started]                                             = 'Đã bắt đầu, không thể bắt đầu lại'






--***********************Vô Lượng Ác Mộng**************************
texts[Index.Wuliang_Emeng_NOT_ENOUGH_COUNT]                                      = 'Không đủ lượt'
texts[Index.Wuliang_Emeng_NOT_PASS_NORTH_CAVE]                                   = 'Chưa đạt ải 20 Bắc Quật'
texts[Index.Wuliang_Emeng_NOT_FINISH_CROSS_BATTLE]                               = 'Sau Võ Lâm Đại Hội Liên Server kỳ 1 mở'
texts[Index.Wuliang_Emeng_NOT_ENOUGH_CHALLENGE_COUNT]                            = 'Không đủ lượt thách đấu'
texts[Index.Wuliang_Emeng_LAST_LEVEL_NOT_PASS]                                   = 'Chưa vượt qua ải trước'
texts[Index.Wuliang_Emeng_TEMPLATE_NOT_FOUND]                                    = 'Không tìm thấy dữ liệu cài đặt'
texts[Index.Wuliang_Emeng_NO_CHALLENGE_COUNT]                                    = 'Không có lượt thách đấu'
texts[Index.Wuliang_Emeng_LEVEL_NOT_PASS]                                        = 'Chưa vượt qua ải hiện tại'
texts[Index.Wuliang_Emeng_SEASON_END]                                            = 'Mùa giải đã kết thúc'
texts[Index.Wuliang_Emeng_PARAM_ERROR]                                           = 'Tham số lỗi'
texts[Index.Wuliang_Emeng_short_NOT_OPEN]                                        = 'Vô Lượng Ác Mộng chưa mở'




--***********************Nâng bậc T.Bị**************************
texts[Index.EquipmentAttrib_INCREASE_STEPS_EXP_FULL]                                 = 'EXP phụ ma đầy, cần nâng bậc'

--***********************Nâng bậc T.Bị**************************
texts[Index.EQUIP_GEM_KIND_ERROR]                                                   = 'Ngọc đặc biệt không thể khảm trang bị'

--***********************Gia Viên**************************
texts[Index.Home_NOT_HOME_TURNTABLE_NUM]                                 = 'Không đủ lượt quay'
texts[Index.Home_NOT_HOME_SHARE_NUM]                                     = 'Không đủ lượt chia sẻ'
texts[Index.Home_HOME_LEVEL_MAX]                                         = 'Gia Viên đã đạt cấp tối đa'
texts[Index.Home_HOME_NOT_OPEN]                                          = 'Gia Viên chưa mở'
texts[Index.Home_HOME_SHARE_SUCCESS]                                     = 'Chia sẻ thành công'
texts[Index.Home_EVENT_IS_OPEND]										 = 'Đã quá hạn'



--***********************天机轮**************************
texts[Index.Tianjilun_NO_COIN]                              				= 'Chưa bỏ xu'
texts[Index.Tianjilun_ACTIVITY_NOT_OPEN]                                    = 'Sự kiện chưa mở'
texts[Index.Tianjilun_CAN_NOT_REPEAT_COIN]									= 'Không thể bỏ xu lặp lại'
texts[Index.Tianjilun_PARAMETER_ERROR]										= 'Tham số lỗi'


--***********************帮派红包**************************
texts[Index.RP_NOT_BUY_NUM]                              					    = 'Lì xì này hôm nay đã hết lượt mua'
texts[Index.RP_RED_PACKET_PERSON_ERROR]                   	                    = 'Số lì xì tối đa vượt qua số người của Bang'
texts[Index.RP_NOT_GUILD]													    = 'Đã trở thành người không có Bang phái'
texts[Index.RP_GUILD_DISSOLVE]													= 'Bang đang giải tán không thể phát lì xì'
texts[Index.RP_RED_PACKET_BEFORE_JOIN_GUILD]									= 'Không được nhận lì xì trước khi vào Bang'
texts[Index.RP_RED_PACKET_RECEIVE_FAIL]											= 'Lì xì đã bị cướp hết'
texts[Index.RP_RED_PACKET_OUTDATE]												= 'Lì xì đã quá hạn'
texts[Index.RP_RED_PACKET_DESC_TOO]												= 'Mô tả lì xì quá dài'
texts[Index.RP_RED_PACKET_RECEIVED]												= 'Không thể nhận lặp cùng 1 lì xì'
texts[Index.RP_SEND_RED_PACKET_ERROE]											= 'Sau khi vào Bang 1 ngày mới được phát lì xì'
texts[Index.RP_RECEIVE_RED_PACKET_ERROE]										= 'Sau khi vào Bang 1 ngày mới được nhận lì xì'
texts[Index.RP_RED_PACKET_CURRENCY_ERROR]										= 'Không đủ tiền lì xì'


--***********************Trận Pháp**************************
texts[Index.BattleArray_INTENSIFY_LEVEL_MAX]                                    = 'Cấp cường hóa đã tối đa'
texts[Index.BattleArray_NOT_EXIST_BATTLE_ARRAY]                                 = 'Trận Pháp không tồn tại'
texts[Index.BattleArray_STAR_LEVEL_MAX]                                         = 'Cấp sao đã tối đa'
texts[Index.BattleArray_NOT_CAN_USE_ITEM]                                       = 'Nguyên liệu này cấp hiện tại không thể dùng'
texts[Index.BattleArray_ALL_POSITION_SELECT]                                    = 'Toàn bộ vị trí đã khóa'


--***********************回购**************************
texts[Index.Rebuy_RES_YESTERDAY_BOUGHT]                                         = 'Đã mua lại'
texts[Index.Rebuy_SERDANG_SEASON_NOT_OPEN]                                      = 'Vô Lượng Sơn Ác Mộng chưa mở'
texts[Index.Rebuy_NORTH_CAVE_NOT_OPEN]                                          = 'Bắc Quật chưa mở'
texts[Index.Rebuy_BUY_SUCCESS]                                                  = 'Mua lại thành công'

--*********************分包下载**************************
texts[Index.BattleArray_INTENSIFY_LEVEL_MAX]                                    = 'Cấp cường hóa đã tối đa'

--***********************装备出售**************************
texts[Index.SPECIAL_EQUIPMENT_NOT_SALE] 										  = 'Không thể bán trang bị đặc biệt'
texts[Index.SPECIAL_EQUIPMENT_NOT_RECAST] 									      = 'Không thể đúc lại trang bị đặc biệt'

--***********************酒馆次数奖励**************************
texts[Index.Recruit_Bonus_Received] 											= 'Đã nhận rương này'
texts[Index.Recruit_Bonus_Unreceivable] 										= 'Không đủ điều kiện nhận rương'


--***********************闯关东瀛岛**************************
texts[Index.BreakJapanPlace_TEAM_HAVE_ERROR]                                       = 'Bạn đã vào 1 đội'
texts[Index.BreakJapanPlace_CHALLENGE_COUNT_ERROR]                                 = 'Không đủ lượt thách đấu'
texts[Index.BreakJapanPlace_TEAM_NOT_EXIST]                                        = 'Thông tin đội đã quá hạn'
texts[Index.BreakJapanPlace_TEAM_MEMBER_FULL]                                      = 'Đội đã đủ người'
texts[Index.BreakJapanPlace_TEAM_FIGHT_ERROR]                                      = 'Đội đã vào chiến đấu'
texts[Index.BreakJapanPlace_TEAM_NOT_BETWEEN_LEVEL]                                = 'Cấp không đạt điều kiện'
texts[Index.BreakJapanPlace_TEAM_NOT_LEADER_ERROR]                                 = 'Đội trưởng mới được mời'
texts[Index.BreakJapanPlace_TEAM_INVITE_ERROR]                                     = 'Không thể mời lặp'
texts[Index.BreakJapanPlace_TEAM_INVITE_HAVE_TEAM]                                 = 'Đối phương đã có đội'
texts[Index.BreakJapanPlace_ENTER_TEAM_COPY_LEADER_ERROR]                          = 'Đội trưởng được chọn vào chiến đấu'
texts[Index.BreakJapanPlace_TEAM_MEMBER_LESS]                                      = 'Đội không đủ người'
texts[Index.BreakJapanPlace_TEAM_COPY_STATUS_ERROR]                                = 'Đội đã vào chiến đấu hoặc đã kết thúc'
texts[Index.BreakJapanPlace_TEAM_MEMBER_READY_ERROR]                               = 'Còn thành viên chưa chuẩn bị'
texts[Index.BreakJapanPlace_CHAPTER_NOT_OPEN]                                      = 'Chưa mở ải'
texts[Index.BreakJapanPlace_TEAM_COPY_IS_PASS]                                     = 'Đã vượt PB này'
texts[Index.BreakJapanPlace_TEAM_COPY_NOT_PASS]                                    = 'Vượt ải'
texts[Index.BreakJapanPlace_LOTTERY_NUMBER_ERROR]                                  = 'Không đủ lượt quay'
texts[Index.BreakJapanPlace_INVITE_CD_ERROR]                                       = 'Đang CD mời'
texts[Index.BreakJapanPlace_INVITE_SUCCESS]                                        = 'Mời thành công'
texts[Index.BreakJapanPlace_NOT_OPEN]                                              = '12：00-14：00 và  18：00-20：00 mỗi ngày mở'
texts[Index.BreakJapanPlace_IS_CLOSED]                                             = 'Sự kiện lần này đã kết thúc'
texts[Index.BreakJapanPlace_CROSS_EXCEPTION]                                       = 'Trạng thái liên server bất thường'
texts[Index.BreakJapanPlace_CREATE_FAILED]                                         = 'Lập đội thất bại'
texts[Index.NO_LOTTERY_ELIGIBILITY] 											   = 'Không thể tham dự quay thưởng'
texts[Index.NO_REMANENTS] 														   = 'Không có thưởng để mua'
texts[Index.NO_CHAPTER] 														   = 'Chương không tồn tại'


--***********************浪人武士**************************
texts[Index.Japan_island_KNIGHT_NOT_EXITS]                                        = 'Võ sĩ này đã bị hạ'
texts[Index.Japan_island_KNIGHT_CANT_SHARE]                                       = 'Đã thách đấu thành công võ sĩ này'
texts[Index.Japan_island_HAVE_NO_FRIEND]                                          = 'Chưa có hảo hữu'
texts[Index.Japan_island_KNIGHT_ASSIST_NOT_EXITS]                                 = 'Xin lỗi, võ sĩ này không tồn tại'
texts[Index.Japan_island_KNIGHT_ASSIST_ALREADY_FT]                                = 'Bạn đã thách đấu võ sĩ này'
texts[Index.Japan_island_KNIGHT_ASSIST_CANT_FT]                                   = 'Khi chia sẻ, bạn chưa là hảo hữu của người này'
texts[Index.Japan_island_KNIGHT_ASSIST_IS_FTING]                                  = 'Võ sĩ này đang bị thách đấu'
texts[Index.Japan_island_KNIGHT_ASSIST_NOT_ENOUGH]                                = 'Không đủ lượt thách đấu'
texts[Index.Japan_island_KNIGHT_LEVEL_NOT_ENOUGH]                                 = 'Không đủ cấp'
texts[Index.Japan_island_KNIGHT_NOT_OPEN]                                         = 'Chưa mở Lãng Khách'

--***********************轻功夺宝**************************
texts[Index.Not_Find_Woodman_Activity]                            						  = 'Khinh Công Đoạt Bảo chưa mở'
texts[Index.Not_Find_Woodman_Activity_Reward]                              				  = 'Không có thưởng Khinh Công Đoạt Bảo'

--***********************天书参悟**************************
texts[Index.BibleComprehend_BIBLE_COMPREHEND_NOT_UNLOCK]                                      = 'Chưa mở giai đoạn này để lĩnh hội'
texts[Index.BibleComprehend_BIBLE_COMPREHEND_CAN_NOT_REPLACE]                                 = 'Không thể thay lặp thuộc tính lĩnh hội tương đồng'
texts[Index.BibleComprehend_BIBLE_COMPREHEND_CAN_NOT_COMPREHEND]                              = 'Thiên Thư này không thể lĩnh hội'

--***********************阵法置换**************************
texts[Index.ChangeZhenFa_EXCHANGE_QUALITY_ERROR]                                   = 'Trận Pháp khác phẩm chất không thể thay thế'
texts[Index.ChangeZhenFa_EXCHANGE_QUALITY_TOO_LOW]                                 = 'Trận Pháp phẩm chất quá thấp không thể thay thế'

--***********************名人堂**************************
texts[Index.NOT_STAR_HERO_PRAISE_NUM]                                             = 'Không đủ lượt like Danh Nhân Đường'
texts[Index.STAR_HERO_PRAISE_NUM_ERROR]                                           = 'Số like chưa đủ để nhận thưởng'
texts[Index.STAR_HERO_PRAISE_ERROR]                                               = 'Hôm nay đã like người này'
texts[Index.STAR_HERO_CLOSE]                                           			  = 'Tạm đóng Danh Nhân Đường'


--***********************王者擂台**************************
texts[Index.MasterContestManager_TEAM_NAME_SENSITIVE_WORD]                               = 'Tên đội chứa ký tự nhạy cảm'
texts[Index.MasterContestManager_TEAM_NAME_LENGTH_ERROR]                                 = 'Tên đội tối đa 8 ký tự'
texts[Index.MasterContestManager_TEAM_NAME_ERROR]                                        = 'Tên đội không được chứa dấu'
texts[Index.MasterContestManager_PERMISSIONS_ERROR]                                      = 'Không đủ quyền hạn, đội trưởng mới được thao tác'
texts[Index.MasterContestManager_RANDOM_TEAM_ERROR]                                      = 'Đội ngẫu nhiên không thể thao tác'
texts[Index.MasterContestManager_TEAM_NUM_ERROR]                                         = 'Đội đã đủ người'
texts[Index.MasterContestManager_TEAM_INVITE_ERROR]                                      = 'Thông tin mời đã quá hạn*/'
texts[Index.MasterContestManager_TEAM_EXIST_ERROR]                                       = 'Bạn đã ở trong đội này*/'
texts[Index.MasterContestManager_TEAM_HAVE_ERROR]                                        = 'Bạn đã có đội của mình'
texts[Index.MasterContestManager_TEAM_NOT_HAVE_ERROR]                                    = 'Bạn chưa có đội riêng'
texts[Index.MasterContestManager_TEAM_SIGN_UP_ERROR]                                     = 'Đội của bạn đã báo danh'
texts[Index.MasterContestManager_CONTEST_NOT_OPEN]                                       = 'Sự kiện chưa mở'
texts[Index.MasterContestManager_CONTEST_END]                                            = 'Đấu Điểm đã kết thúc, hiện không thể báo danh'
texts[Index.MasterContestManager_TARGET_TEAM_HAVE_ERROR]                                 = 'Đối phương đã có đội riêng'
texts[Index.MasterContestManager_TEAM_NUMBER_LESS_ERROR]                                 = 'Đội không đủ người để báo danh'
texts[Index.MasterContestManager_TEAM_SIGN_UP_QUIT_ERROR]                                = 'Đội đã báo danh, không thể thoát'
texts[Index.MasterContestManager_CONTEST_NOT_END_QUIT_ERROR]                             = 'Sự kiện chưa kết thúc, chưa thể thoát'
texts[Index.MasterContestManager_TEAM_SIGN_UP_REMOVE_ERROR]                              = 'Đội đã báo danh không thể khai trừ'
texts[Index.MasterContestManager_CONTEST_NOT_END_REMOVE_ERROR]                           = 'Sự kiện chưa kết thúc không thể khai trừ'
texts[Index.MasterContestManager_LEIZHU_NOT_SIGN_UP_ERROR]                               = 'Bá Chủ kỳ trước không thể báo danh tham dự Đấu Điểm'
texts[Index.MasterContestManager_FINALS_INSPIRE_ERROR]                                   = 'Bạn không phải đội tham dự chung kết cuối cùng'
texts[Index.MasterContestManager_INSPIRE_CD_ERROR]                                       = 'CD cổ vũ 1s'
texts[Index.MasterContestManager_BET_ERROR]                                              = 'Bạn đã cược'
texts[Index.MasterContestManager_LEIZHU_NOT_QUIT_ERROR]                                  = 'Thành viên đội Bá Chủ không thể thay đổi'
texts[Index.MasterContestManager_BET_TIME_ERROR]                                         = 'Không trong giai đoạn cược'
texts[Index.MasterContestManager_RED_PACKET_NOT_EXIST_ERROR]                             = 'Lì xì không tồn tại'
texts[Index.MasterContestManager_RED_PACKET_RECEIVE_ERROR]                               = 'Đã nhận lì xì này'
texts[Index.MasterContestManager_RED_PACKET_NOT_RECEIVE_ERROR]                           = 'Khi phát lì xì bạn không online để nhận'
texts[Index.MasterContestManager_RECEIVE_RED_VALID_TIME_ERROR]                           = 'Lì xì đã quá hạn'
texts[Index.MasterContestManager_FINALS_INSPIRE_MAX_ERROR]                               = 'Cổ vũ đã đạt tối đa'

--***********************Pet**************************
texts[Index.BattlePet_BATTLE_PET_INEXISTENCE]                                 = 'Pet không tồn tại'
texts[Index.BattlePet_CAN_NOT_EQUIP_SAME_PET]                                 = 'Không thể ra trận lặp cùng 1 pet'
texts[Index.BattlePet_CAN_NOT_FREE]                                           = 'Đang ra trận, không thể phóng sinh'
texts[Index.BattlePet_CAN_NOT_CHANGE_TRAINER]                                 = 'Tướng không tồn tại để làm Thầy Huấn Luyện'
texts[Index.BattlePet_CAN_NOT_UP_QUALITY]                                     = 'Phẩm chất đã đạt tối đa'
texts[Index.BattlePet_CAN_NOT_UP_STAR]                                        = 'Cấp sao đã đạt tối đa'
texts[Index.BattlePet_CONSUMES_NOT_ENOUGH]                                    = 'Không đủ nguyên liệu'

--***********************帮派演武**************************
texts[Index.PARAMETER_ERROR] 												    = 'Tham số lỗi'
texts[Index.NOT_OPEN] 														    = 'Diễn Võ Bang chưa mở'
texts[Index.BATTLE_CD] 														    = 'Đang CD thách đấu'
texts[Index.GUILD_INEXISTENCE] 												    = 'Bang không tồn tại'
texts[Index.GUILD_NOT_MASTER] 													= 'Không phải Bang Chủ'
texts[Index.HELP_BATTLE_CD] 													= 'Đang CD trợ chiến'
texts[Index.HELP_BATTLE_NOT_DATA] 												= 'Trợ chiến không có người chơi'
texts[Index.HELP_BATTLE_NOT_PLAYER] 											= 'Người chơi không tồn tại'
texts[Index.HELP_BATTLE_NOT_MEMBER] 											= 'Người chơi không phải thành viên Bang để trợ chiến'
texts[Index.HELP_BATTLE_NOT_OFF_TIME] 											= 'Người chơi offline chưa đủ 3 ngày, không thể trợ chiến'
texts[Index.BATTLE_END] 														= 'Đã kết thúc, không thể thao tác'
texts[Index.BATTLE_GUILD_TIME]													= 'Vào Bang chưa đủ 24 giờ'

--***********************镖行 ngày下**************************
texts[Index.EscortAgency_PARAMETER_ERROR]                                 = 'Tham số lỗi'
texts[Index.EscortAgency_ACTIVITY_NOT_START]                              = 'Sự kiện chưa bắt đầu'
texts[Index.EscortAgency_BATTLE_NOT_START]                                = 'Chiến đấu chưa bắt đầu'
texts[Index.EscortAgency_CAN_NOT_ATTACK_SAME_PART]                        = 'Không thể công lặp cùng 1 vị trí'
texts[Index.EscortAgency_CAR_INEXISTENCE]                                 = 'Tiêu không tồn tại'
texts[Index.EscortAgency_ARMOR_GOOD_CAN_NOT_ATTACK]                       = 'Tiêu này có hộ giáp hoàn hảo, không thể công vị trí khác'
texts[Index.EscortAgency_DEF_NOT_DIE_CAN_NOT_ATT]                         = 'Bạn đang trong một thế trận tấn công, hãy chờ tấn công kết thúc'
texts[Index.EscortAgency_GUILD_INEXISTENCE]                               = 'Bạn không có Bang để báo danh'
texts[Index.EscortAgency_GUILD_NOT_MASTER]                                = 'Bang Chủ được thao tác'
texts[Index.EscortAgency_NOT_ENROLL_TIME]                                 = 'Hiện không trong thời gian báo danh'
texts[Index.EscortAgency_CAR_PART_FULL]                                   = 'Vị trí này đã đủ người'
texts[Index.EscortAgency_CAR_PART_DEF_REPEAT]                             = 'Không thể bố trí lặp cùng 1 người tại 1 vị trí'
texts[Index.EscortAgency_CAR_PART_ATT_REPEAT]                             = 'Bạn đang trong thế trận tấn công vị trí này'
texts[Index.EscortAgency_ATT_REST_TIME]                                   = 'Đang CD chỉnh đốn'
texts[Index.EscortAgency_ATT_FORMATION_INEXISTENCE]                       = 'Hiện chưa công Tiêu nào, không thể chỉnh đốn'
texts[Index.EscortAgency_TARGET_REPEAT]                                   = 'Hiện đang tập trung công 1 Tiêu, hãy hủy tập trung công trước'
texts[Index.EscortAgency_TARGET_INEXISTENCE]                              = 'Mục tiêu không tồn tại'
texts[Index.EscortAgency_CAR_QUALITY_FULL_UP]                             = 'Tiêu đã nâng lên cấp tối đa'
texts[Index.EscortAgency_GUILD_BOOM_NOT_ENOUGH]                           = 'Không đủ Phồn Vinh'
texts[Index.EscortAgency_ATT_FORMATION_DIE_CAN_NOT_ATT]                   = 'Bạn đã tử trận, hãy chỉnh đốn lại'
texts[Index.EscortAgency_GROUP_INVALID]                                   = 'Chưa mở chia cụm liên server'

--***********************Tế Thế Đường**************************
texts[Index.GUILD_LEVEL] 														= 'Bang không đủ cấp'
texts[Index.GUILD_MEMBER] 														= 'Bang không có thành viên này'
texts[Index.GUILD_NEED] 														= 'Yêu cầu này đã hoàn thành'
texts[Index.GUILD_RECEIVE] 														= 'Không có thưởng để nhận'
texts[Index.GUILD_CAN_NOT_CHANGE_DAY] 											= 'Trong ngày không thể phát quá nhiều yêu cầu'
texts[Index.GUILD_CAN_NOT_CHANGE_RECEIVE] 										= 'Có đóng góp chưa nhận, không thể đổi yêu cầu'

--***********************武林公敌**************************
texts[Index.WulinGongdi_CD_TIME]                                   = 'Đang CD'
texts[Index.WulinGongdi_NOT_START]                                 = 'Chưa bắt đầu thách đấu'
texts[Index.WulinGongdi_BOOS_DIE]                                  = 'Công Địch đã tử trận'

--***********************天书注解**************************
texts[Index.BIBLE_NOTE_CAN_NOT_SUMMARIZE]  										= 'Chú giải Thiên Thư này chưa đầy, không thể mở khái quát'
texts[Index.BIBLE_KEY_NOT_EXIST]  												= 'Chưa tìm thấy chìa mật'
texts[Index.BIBLE_NOT_OPEN] 													= 'Chưa đạt điều kiện mở chú giải Thiên Thư'

--***********************琅嬛福地**************************
texts[Index.SELECTED_NOT_ENOUGH]												= 'Vòng quay không đủ 8 vật phẩm thưởng, hãy điền lại'
texts[Index.RANDOM_REWARD_FAILED]												= 'Thưởng ngẫu nhiên thất bại'
texts[Index.ERROR_PRAY_TYPE]													= 'Loại quay thưởng lỗi'

--***********************Du ngoạn挖宝**************************
texts[Index.ERROR_ROW_ID]														= 'Tọa độ ngang lỗi'
texts[Index.ERROR_COL_ID]														= 'Tọa độ dọc lỗi'
texts[Index.NO_ENOUGH_TIMES]													= 'Không đủ lượt đào báu'
texts[Index.HAS_EXISTED_TREASURE]												= 'Vị trí hiện tại có rương'
texts[Index.NO_HISTORY]															= 'Hiện chưa có người nhận'
texts[Index.NO_ENOUGH_TRESURES]													= 'Người chơi hiện không đủ rương'
texts[Index.ERROR_IS_HIDDEN]													= 'Tham số nặc danh lỗi'
texts[Index.CAN_NOT_GET_GOODS]													= 'Chưa thể nhận vật phẩm'
texts[Index.FUNCTION_CLOSED]													= 'Chưa mở đào, chôn báu vật'
texts[Index.SOMEBODY_IS_DIGGING]												= 'Có người đang đào rương này'

-- ***********************Bang活跃红包**************************
texts[Index.HAS_SENT_RED_PACKET]												= 'Đã gửi lì xì sôi nổi Bang'
texts[Index.PROGRESS_NOT_ENOUGH]												= 'Không đủ Trung Nghĩa để phát lì xì sôi nổi Bang'
texts[Index.NOT_SEND_TIME]														= '20:00 đến 00:00 giờ được phát lì xì Bang'
texts[Index.FUNCTION_NOT_OPEN]													= 'Chưa mở phát lì xì Bang'
texts[Index.H_LEVEL_NOT_ENOUGH]													= 'Bang chưa đủ cấp'
texts[Index.H_POWER_NOT_ENOUGH]													= 'Bang Chủ và Bang Phó có thể phát lì xì sôi nổi'
texts[Index.IS_GOT_REWARD]													    = 'Bạn đã nhận rương'
texts[Index.REWARD_IS_NOT_EXIST]												= 'Cài đặt thưởng không tồn tại'

--***********************心法**********************
texts[Index.XINFA_ID_NOT_FOUND]													= 'ID Tâm Pháp này không tồn tại'
texts[Index.XINFA_ID_MAX]														= 'Đã bồi dưỡng tới cấp cao nhất'
texts[Index.NOT_ENOUGH_WISDOM]													= 'Không đủ Xu Tuệ Tâm'
texts[Index.NOT_ENOUGH_TENCHU]													= 'Không đủ Xu Châu Tâm'
texts[Index.XINFA_GEM_NOT_FOUNT]												= 'Không tìm thấy module khảm'
texts[Index.XINFA_GEM_LOCK]														= 'Chưa mở lỗ'
texts[Index.XINFA_GEM_LEVEL_NOT_ENOUGH]											= 'Lỗ này khảm ngọc không phù hợp'
texts[Index.XINFA_NOT_CULTURE]                                                  = 'Không thể luyện Tâm Pháp'
texts[Index.XINFA_GEM_NOT_OPEN]                                                 = 'Chưa mở'

--***********************赶年兽**************************
texts[Index.Beast_NotOpen]					        							= 'Chưa mở'
texts[Index.Beast_DataError]													= 'Tham số lỗi'
texts[Index.Beast_NotYetRefresh]												= 'Chưa tới giờ làm mới con tiếp theo'
texts[Index.Beast_NotRefresh]													= 'Không thể làm mới Niên Thú'
texts[Index.Beast_GotItSycee]												    = 'KNB đã nhận'
texts[Index.Beast_NotYourBaest]												    = 'Không phải Niên Thú bạn đuổi'

--***********************打年兽**************************
texts[Index.Beast_Dead_already]     											= 'Niên Thú đã hết HP'
texts[Index.Beast_fireworks_not_enough]											= 'Không đủ vật phẩm'
texts[Index.Beast_Cannot_find_item]												= 'Chưa tìm thấy vật phẩm'

--***********************贵宾商城**************************
texts[Index.VIP_SHOP_OPEN]     													= 'Chưa mở shop VIP'
texts[Index.VIP_SCORE_NOT_ENOUGH]												= 'Không đủ điểm VIP'

--***********************英雄大会**************************
texts[Index.NOT_ENOUGH_PRESTIGE]												= 'Không đủ Uy Danh'
texts[Index.NOT_ENOUGH_ENERGY]													= 'Anh Hùng Đại Hội không đủ thể lực'
texts[Index.SYSTEM_NOT_OPEN]													= 'Tính năng chưa mở'
texts[Index.TERM_NOT_OPEN]														= 'Sự kiện chưa mở hoặc đã kết thúc'
texts[Index.WRONG_CHALLANGE_TARGET]												= 'Mục tiêu thách đấu lỗi'
texts[Index.NOT_ENOUGH_ENERGY]													= 'Không đủ thể lực'
texts[Index.TARGET_NOT_EXIST]													= 'Mục tiêu không tồn tại'
texts[Index.TARGET_DATA_NOT_FOUND]												= 'Không có dữ liệu mục tiêu'
texts[Index.REFRESH_TIME_COOL_DOWN]												= 'Đang CD làm mới'
texts[Index.REWARD_IS_NOT_EXIST]												= 'Thông tin thưởng không tồn tại'
texts[Index.CANNOT_RECEIVE_REWARD]												= 'Chưa đạt điều kiện nhận'
texts[Index.REWARD_HAS_BEEN_RECEIVED]											= 'Đã nhận thưởng'
texts[Index.EXCHANGE_LIMITED]													= 'Đã đổi tối đa'
texts[Index.RANK_CHANGED]														= 'XH chưa đạt hoặc đã thay đổi'
texts[Index.RECORD_IS_NOT_EXIST]												= 'Video không tồn tại'
texts[Index.CANNOT_REVENGE_ANYMORE]												= 'Không thể phản kích nhiều lần'
texts[Index.WRONG_CHALLANGE_TIME]												= 'Không trong thời gian thách đấu'

--***********************丹房**************************

texts[Index.NOT_LEVEL_UP]                                                       = 'Không thể nâng cấp'
texts[Index.CONFIG_NOT_FOUND]                                                   = 'Không tìm thấy cài đặt'
texts[Index.HELPER_NOT_FOUND]                                                   = 'Không tồn tại thông tin này'
texts[Index.REFINING_END]                                                       = 'Đã hoàn thành luyện hóa này'
texts[Index.HELPER_TIMES_NOT_ENOUGH]                                            = 'Không đủ lượt trợ giúp'
texts[Index.IS_HELPER]                                                          = 'Đã hỗ trợ thành viên này luyện'
texts[Index.CANGT_HELPER_YOURSELF]                                              = 'Không thể hỗ trợ luyện của chính bạn'
texts[Index.CANGT_RECEIVE]                                                      = 'Không thể nhận'
texts[Index.NOT_OPEN]                                                           = 'Phòng Luyện Đan chưa mở'
texts[Index.TOADY_COUNT_MAX]                                                    = 'Lượt luyện hôm nay đã tối đa' 

--***********************天命**************************
texts[Index.DESTINY_NOT_EXIST]                                                  = 'Thiên Mệnh không tồn tại'
texts[Index.DESTINY_ERROR]                                                      = 'Không thể khảm trùng Thiên Mệnh cùng loại'
texts[Index.DESTINY_SAME_ERROR]                                                 = 'Không thể thao tác cùng 1 Thiên Mệnh'
texts[Index.DESTINY_CONFIG_ERROR]                                               = 'Không tìm thấy cài đặt'
texts[Index.DESTINY_EXLOAD_ERROR]                                               = 'Tách thất bại'
texts[Index.DESTINY_DEVOUR_NOT_EXIST]                                           = 'Không có Thiên Mệnh để nuốt'
texts[Index.NOT_OPEN]                                                           = 'Chưa mở tính năng'
texts[Index.IS_MAX_LEVEL]                                                       = 'Đã đạt cấp tối đa'

--***********************祭祀**************************
texts[Index.NOT_ENABLE]                                                         = 'Trạng thái này chưa kích hoạt, không thể nhấp'
texts[Index.CONFIGURE_NOT_FOUND]                                                = 'Không tìm thấy cài đặt'
texts[Index.DROP_GROUP_NOT_FOUND]                                               = 'Không tìm thấy rớt'
texts[Index.DROP_EMPTY]                                                         = 'Không rớt đồ gì'
texts[Index.ITEM_LIST_FULLY]                                                    = 'Không có vị trí trống'
texts[Index.HAVE_NOT_ITEM]                                                      = 'Không có vật phẩm để nhặt'
texts[Index.ITEM_NOT_FOUND]                                                     = 'Không tìm thấy đề mục'
texts[Index.CANTN_GET_TODAY]                                                    = 'Hôm nay đã nhận'
texts[Index.HAVE_NOT_DES]                                                       = 'Không có Thiên Mệnh để nuốt'
texts[Index.NOT_ENOUGH_LINGQI]                                                  = 'Không đủ Linh Khí'

--***********************弹劾**************************
texts[Index.IMPEACHMENT_NO_SATISFY]                                             = 'Không đủ điều kiện luận tội'
texts[Index.NOT_ENOUGH_DAY]                                                     = 'Vào Bang chưa đủ 50 ngày, không thể luận tội'  

--***********************天阶1键**************************

texts[Index.LADDER_IS_SWEEP]                                                    = 'Không có lượt thách đấu nhanh'
texts[Index.LADDER_FORMATION_NUMBER]                                            = 'Đội hình thách đấu vượt quá số người'
texts[Index.LADDER_BATTLE_INFO_ERROR]                                           = 'Danh sách thách đấu lỗi'






























------------------------下面是中文提示哈-----------------------

--***********************角色培养**************************
texts[Index.No_Acquisition_Techniques]										= "Không có bí kíp để học"

--***********************无量山北窟************************
texts[Index.BEIKU_OPEN_NOT_ENOUGH_LEVEL]                                    = "Vượt Vô Lượng Sơn Nam tầng %d mở"
texts[Index.BEIKU_ALL_PASS]                                                 = "Đã vượt toàn bộ ải Bắc Quật, hãy cài lại"
texts[Index.BEIKU_GET_AND_PASS]                                             = "Bạn có rương chưa nhận, hãy nhận rương"

--***********************经脉突破**************************
texts[Index.JINGMAI_SURMOUNT_SUCCESS]                                       = "Đột phá thành công, trưởng thành thuộc tính tăng"
texts[Index.JINGMAI_SURMOUNT_FAIL]                                          = "Đột phá thất bại"
texts[Index.JINGMAI_SURMOUNT_OPEN_NOT_ENOUGH_LEVEL]                         = "Vượt Vô Lượng Sơn Nam tầng %d mở"

--***********************Bang**************************
texts[Index.No_Permissions]                                                 = 'Chờ Bang Chủ/Bang Phó mở'
texts[Index.NoT_Enough_Prosperity]                                          = 'Không đủ Phồn Vinh'
texts[Index.Everyday_Reset_One_time]                                        = 'Mỗi ngày cài lại tối đa 1 lần'
texts[Index.Consume_Prosperity_Open]                                        = 'Tiêu %d Phồn vinh Bang mở'
texts[Index.Consume_Prosperity_Reset]                                       = 'Tiêu %d Phồn vinh Bang cài lại'
texts[Index.Zone_Reset_Suceess]                                        		= 'Cài lại thành công'
texts[Index.Zone_Open_Suceess]                                       		= 'Mở thành công'
texts[Index.Zone_time_out_two_minute]                                 		= 'Đại hiệp, dừng tại giao diện thách đấu tối đa %d phút'
texts[Index.Zone_time_out_ten_second]                                 		= 'Đại hiệp, dừng tại giao diện tổng kết tối đa %d giây'
texts[Index.Zone_time_out_ten_minute]                                 		= 'Đại hiệp, thời gian thách đấu tối đa là %d phút'
texts[Index.Zone_somebody_attacking]                                 		= 'Người chơi khác đang thách đấu'
texts[Index.Field_Finish_at_once]                                      		= 'Tiêu %d KNB hoàn thành tu luyện?'
texts[Index.Field_Open_Level]                                        		= 'Khu Tu Luyện cần Bang đạt cấp %d'
texts[Index.Field_Research_skill]                                        	= 'Tiêu %d Phồn Vinh nghiên cứu cấp %d %s?'
texts[Index.Field_Open_skill]                                            	= 'Tiêu %d Phồn Vinh mở %s?'
texts[Index.Field_Research_skill_max_level]                                	= 'Đã đạt cấp cao nhất hiện tại, hãy nâng cấp Bang'
texts[Index.Field_Research_skill_max_level2]                                = 'Đạt cấp cao nhất'
texts[Index.Field_Study_skill_no_open]                                      = 'Cần Bang Chủ/Bang Phó mở'
texts[Index.Field_Study_skill_max_level]                                    = 'Đạt cấp tối đa hiện tại, hãy nâng cấp nghiên cứu'
texts[Index.Field_No_Permissions]                                           = 'Chỉ Bang Chủ/Bang Phó được nghiên cứu'
texts[Index.Guild_flag_modify]                                              = 'Sửa cờ Bang thành công'
texts[Index.Guild_UI]                                                       = 'Cần 1 Lệnh Sửa Cờ Bang (Còn： %d)'

--**********************争霸赛**********************
texts[Index.BATTLEIS_NOT_START]                                               = 'Chiến đấu chưa bắt đầu hoặc đã kết thúc'
texts[Index.NOPLAYER_CAN_MATCH]                                               = 'Không có người chơi để ghép'
texts[Index.MATCHNOT_IN_TIME]                                                 = 'Đang CD đối chiến, hãy thử lại sau'
texts[Index.BETNOT_IN_TIME]                                                   = 'Đã quá giờ cược'
texts[Index.APPLYCROSS_CHAMPIONS_FULL]										  = 'Số người đã tối đa'

--***********************装备重铸**************************
texts[Index.Recast_Unlock1]                                                 = 'Ô thứ 1 đạt Hỏng mở'
texts[Index.Recast_Unlock2]                                                 = 'Ô thứ 2 đạt Xước mở'
texts[Index.Recast_Unlock3]                                                 = 'Ô thứ 3 đạt Hoàn Mỹ mở'
texts[Index.Recast_Unlock4]                                                 = 'Ô thứ 4 đạt Đúc Thần mở'
texts[Index.Recast_Gems]                                                    = 'T.Bị đúc lại có 2 ô Hỏng sẽ mở'
texts[Index.Recast_Second_Prompt]                                           = 'Đúc lại cần 1 %s, xác nhận?'
texts[Index.Recast_Material_shortage]                                       = 'Hãy thu thập %s'
texts[Index.Recast_Used_tool]                                           	= 'Đúc lại cần 1 %s, xác nhận?'





--***********************采矿**************************
texts[Index.Mining_Protect_Record1]                                         = '%s thuê bạn làm hộ vệ, nhận %d tiền phí'
texts[Index.Mining_Protect_Record2]                                         = 'Khi làm hộ vệ cho %s, bạn ngăn cản %s cướp thành công. Nhận thêm %d tiền phí'
texts[Index.Mining_UI1]                                                     = 'Tuần này được chọn：%d'
texts[Index.Mining_UI2]                                                     = 'Mỗi tuần mỗi hảo hữu hoặc thành viên Bang chỉ được chọn 1 lần'
texts[Index.Mining_UI3]                                                     = 'Chiến đấu với %s %d lần, '
texts[Index.Mining_UI3_win]                                                 = '%s tới cướp, chiến đấu với %s %d lần, %s cướp thành công'
texts[Index.Mining_UI3_lost]                                                = '%s tới cướp, chiến đấu với %s %d lần, %s cướp thất bại'
texts[Index.Mining_UI4_win]                                                 = '%s chiến đấu với %s, chiến đấu thắng lợi'
texts[Index.Mining_UI4_lost]                                                = '%s chiến đấu với %s, chiến đấu thất bại'
texts[Index.Mining_Nobody]                                                  = 'Hiện chưa có người đào mỏ'
texts[Index.Mining_Reset]                                                   = 'Tiêu 1 Lệnh Cướp cài lại trạng thái cướp?'
texts[Index.Mining_No_Chance]                                               = 'Không đủ Lệnh Cướp'
texts[Index.Mining_No_Protector]                                            = 'Chưa chọn người bảo vệ, rất dễ bị cướp, xác nhận khai thác một mình'
texts[Index.Mining_Rob_Success]                                             = 'Cướp %d Đồng'
texts[Index.Mining_Dead]                                                    = 'Không có tướng còn sống'
texts[Index.Mining_Increase_Frequency]                                      = 'Lệnh Cướp +%d'
texts[Index.Mining_No_Lineup]                                               = 'Người chưa bố trí đội hình khai thác mỏ'
texts[Index.Mining_No_Rob_frequency]                                        = 'Thiếu Lệnh Cướp'
texts[Index.Mining_Suffer_Rob]                                              = 'Người này đang bị cướp'
texts[Index.Mining_Mining_Complete]                                         = 'Người này đã hoàn thành đào mỏ'
texts[Index.Mining_No_All_Beat]                                             = 'Còn %s chưa đánh bại, tiếp tục thoát?'
texts[Index.Mining_Rob_Gemstone]                                            = 'Cướp %d %s Rương Ngọc'
texts[Index.Mining_Rob_Acer]                                                = 'Cướp %d KNB'
texts[Index.Mining_Rob_Refined_stone]                                       = 'Cướp %d Đá Tinh Luyện'





--***********************奇门遁**************************
texts[Index.Gossip_Upgrade_success]                                         = '%s truyền hoàn tất'
texts[Index.Gossip_Breach]                                                  = 'Hãy nhấp Bát Quái và đột phá đến tầng sau'
texts[Index.Gossip_Breach_success]                                          = 'Đột phá thành công lên tầng %s'
texts[Index.Gossip_No_Prop]                                                 = 'Không đủ Bát Quái Tinh Nguyên, đến Vô Lượng Sơn Nam nhận'
texts[Index.Gossip_Level_insufficient]                                      = 'Cấp Đội đạt %d hãy thử lại'
texts[Index.Gossip_No_Upgrade_complete]                                     = 'Hãy truyền Kỳ Môn tầng này xong rồi thử lại'





--***********************Trợ Chiến**************************
texts[Index.Assist_Somebody_Assist_You]                                     = '%s trợ chiến bạn %s'
texts[Index.Assist_No_Assist_hero]                                          = 'Không có tướng của hảo hữu trợ chiến'
texts[Index.Assist_Assist_success]                                          = 'Trợ chiến %s thành công'
texts[Index.Assist_No_hero]                                                 = 'Rất tiếc, không có tướng này'
texts[Index.Assist_Hero_No_time]                                            = 'Rất tiếc, tướng này không đủ lượt'
texts[Index.Assist_Already_Assist_This_player]                              = 'Rất tiếc, hôm nay đã trợ chiến người này'
texts[Index.Assist_This_player_Already_Assist_You]                          = 'Rất tiếc, hôm nay đã trợ chiến người này'
texts[Index.Assist_Their_Hero_No_time]                                      = 'Rất tiếc, lượt trợ chiến của tướng này hôm nay đã đạt tối đa'
texts[Index.Assist_Assist_success_they]                                     = 'Trợ chiến thành công %d hảo hữu'
texts[Index.Assist_UI_Assist]                                               = 'Trợ chiến hảo hữu %d lần'
texts[Index.Assist_Assist_gift]                                             = 'Đã nhận toàn bộ quà'
texts[Index.Assist_NO_Assist_friend]                                        = 'Không có hảo hữu để trợ chiến'
texts[Index.Assist_No_Assist_time]                                          = 'Hôm nay đã hết lượt trợ chiến'
texts[Index.Assist_No_open]                                                 = 'Đội đạt Lv40 mở'
                                    




--***********************Sát thủ**************************
texts[Index.Mercenary_Mercenary_back_limit]                                  = 'Quá 30 phút tướng mới được về đội'
texts[Index.Mercenary_The_team_returned_to_limit]                            = 'Quá 30 phút đội mới được trở về'
texts[Index.Mercenary_The_knight_is_empty]                                   = 'Không có tướng sát thủ'
texts[Index.Mercenary_Team_is_empty]                                         = 'Không có đội sát thủ'






--***********************雇佣**************************
texts[Index.Hire_The_same_Knight_battle]                                     = 'Tướng cùng tên không thể ra trận đồng thời'
texts[Index.Hire_No_Knight_battle]                                           = 'Ra trận tối thiểu 1 tướng'
texts[Index.Hire_Abnormal_information_Knight]                                = 'Làm mới thông tin tướng, hãy chọn lại' 
texts[Index.Hire_The_knight_is_empty]                                        = 'Không có đội hảo hữu'
texts[Index.Hire_Team_is_empty]                                              = 'Không có đội Bang'



--***********************祈愿**************************
texts[Index.QIYUAN_NOT_FIND_TEMPLATE]                                               = 'Không tìm thấy module'
texts[Index.QIYUAN_NOT_FIND_REWARD]                                                 = 'Không tìm thấy thưởng'
texts[Index.QIYUAN_REWARD_ALREADY_GET]                                              = 'Đã nhận thưởng' 
texts[Index.QIYUAN_NOT_ENOUGH_DAY]                                                  = 'Cầu nguyện chưa đủ 15 ngày'
texts[Index.QIYUAN_NOT_ENOUGH_COUNT]                                                = 'Cầu nguyện đã hết lượt'
texts[Index.QIYUAN_WAIT_FIVE_MINUTE]                                                = 'Hãy chờ 5 phút' 
texts[Index.QIYUAN_NOT_FIND_INVOCATORY_GOODS]                                       = 'Không có Đá Cầu Nguyện'
texts[Index.QIYUAN_NOT_INVOCATORY_REWARD_OR_RESET]                                  = '3个卡槽没有奖励或者奖励已经被重置'



texts[Index.QIYUAN_NOTFIND_TEMPLATE]                                               = 'Không tìm thấy module'
texts[Index.QIYUAN_NOTFIND_REWARD]                                                 = 'Không tìm thấy thưởng'
texts[Index.QIYUAN_REWARDALREADY_GET]                                              = 'Thưởng đã nhận' 
texts[Index.QIYUAN_NOTENOUGH_DAY]                                                  = 'Cầu nguyện ngày数不足%d ngày'
texts[Index.QIYUAN_NOTENOUGH_COUNT]                                                = 'Đã hết lượt cầu nguyện'
texts[Index.QIYUAN_WAITFIVE_MINUTE]                                                = 'Hãy chờ 5 phút' 
texts[Index.QIYUAN_NOTFIND_INVOCATORY_GOODS]                                       = 'Không có Đá Cầu Nguyện'
texts[Index.QIYUAN_NOTINVOCATORY_REWARD_OR_RESET]                                  = '3 ô thẻ không có thưởng hoặc đã bị cài lại'

--***********************非法第3方**************************
texts[Index.illegal_Third_party]                                             = 'Chiến đấu bất thường, hãy đăng nhập lại'



--***********************帮派战**************************
texts[Index.Guild_War_Output]                                             = 'HP tăng 10%'
texts[Index.Guild_War_Force]                                              = 'Võ Lực tăng 10%'
texts[Index.Guild_War_Internal]                                           = 'Nội Lực tăng 10%'
texts[Index.Guild_War_No_Elite]                                           = 'Tinh Anh này không có trong đội'
texts[Index.Guild_War_War_star]                                           = 'Tranh Bá Bang sắp bắt đầu, không thể báo danh'
texts[Index.Guild_War_No_Position]                                        = 'Không đủ vị trí, hãy thử thế trận khác'
texts[Index.Guild_War_No_Videotape]                                       = 'Không có thông tin xem lại chiến đấu'




--***********************人物缘分道具**************************
texts[Index.Fate_Prop]                                             = 'Kéo dài thời gian đạo cụ'



--***********************1键扫荡**************************
texts[Index.Sweep_Synthesis]                                              = 'Đã quét xong, hãy ghép '
texts[Index.Sweep_No_Martial]                                             = 'Không có ải để quét'
texts[Index.Sweep_No_VIP]                                                 = 'VIP5 mở'


--***********************寻宝**************************
texts[Index.XunBao_NOT_FIND_ACTIVITY]                                               = 'Tầm Bảo đã kết thúc'
texts[Index.XunBao_NOT_FIND_TREASURE_INFO_LIST]                                     = 'Không có cài đặt thưởng Tầm Bảo'
texts[Index.XunBao_NOT_ENOUGH_COUNT]                                                = 'Không đủ lượt Tầm Bảo'


texts[Index.XunBao_NOTFIND_ACTIVITY]                                               = 'Tầm Bảo đã kết thúc'
texts[Index.XunBao_NOTFIND_TREASURE_INFO_LIST]                                     = 'Không có cài đặt thưởng Tầm Bảo'
texts[Index.XunBao_NOTENOUGH_COUNT]                                                = 'Không đủ lượt Tầm Bảo'


--***********************天书**************************
texts[Index.SkyBook_TEMPLATE_NOT_FOUND]                                           = 'Không tìm thấy cài đặt vật phẩm tương ứng'
texts[Index.SkyBook_NOT_ENOUGH_LEVEL]                                             = 'Không đủ cấp'
texts[Index.SkyBook_BIBLE_ADD_ERROR]                                              = 'Thêm Thiên Thư thất bại'
texts[Index.SkyBook_BIBLE_NOT_EXIST]                                              = 'Không có Thiên Thư này'
texts[Index.SkyBook_PLAYER_NOT_FOUND]                                             = 'Người chơi không tồn tại'
texts[Index.SkyBook_ESSENTIAL_MOSAIC_NOT_ALLOW]                                   = 'Vị trí này không được khảm'
texts[Index.SkyBook_ESSENTIAL_MOSAIC_ALREADY]                                     = 'Vị trí này đã khảm'
texts[Index.SkyBook_MOSAIC_RESOURCE_NOT_ENOUGH]                                   = 'Không đủ điều kiện khảm'
texts[Index.SkyBook_MOSAIC_RESOURCE_IS_NULL]                                      = 'Chưa cài điều kiện khảm'
texts[Index.SkyBook_ESSENTIAL_NOT_ENOUGH]                                         = 'Không đủ tinh yếu'
texts[Index.SkyBook_ESSENTIAL_MOSAIC_NOT_EXIST]                                   = 'Vị trí này chưa khảm'
texts[Index.SkyBook_BIBLE_EQUIP_NOT_FULL]                                         = 'Chưa khảm đầy, nâng tầng thất bại'
texts[Index.SkyBook_BIBLE_LIST_IS_NULL]                                           = 'Nhật ký Thiên Thư trống'

--***********************Du ngoạn**************************
texts[Index.Adventure_ADVENTURE_SHOP_BUY_ERROR]                                   = 'Không đủ xu để đổi'
texts[Index.Adventure_ADVENTURE_EVENT_ERROR]                                      = 'Sự kiện ngẫu nhiên không tồn tại'
texts[Index.Adventure_ADVENTURE_FORMATION_ERROR]                                  = 'Tại giao diện Du ngoạn bố trận đội hình 2 trước'

--***********************杀戮**************************
texts[Index.Adventure_ADVENTURE_Kill_Challenged]                                   = 'Hôm nay đã thách đấu người này'

--***********************侠客换功**************************
texts[Index.Change_Short_PLAYER_ERROR]                                             = 'Nhân vật chính không thể chuyển đổi'
texts[Index.Change_Short_ITEM_ERROR]                                               = 'Không đủ Đan Chuyển Đổi'
texts[Index.Change_short_PRACTICE_ERROR]                                           = 'Tướng này đang tu luyện trong Bang'



--***********************侠客炼体**************************
texts[Index.Refining_the_bodyopen1]                                             = 'Dịch Cân vị trí 1 mở'
texts[Index.Refining_the_bodyopen2]                                             = 'Túy Cốt vị trí 2 mở'
texts[Index.Refining_the_bodyopen3]                                             = 'Hoán Huyết vị trí 3 mở'
texts[Index.Refining_the_bodyopen4]                                             = 'Tẩy Tủy vị trí 4 mở'



--***********************跨服个人战**************************
texts[Index.Personal_service_war_Full]                                          = 'Rất tiếc, server đã đầy'




--***********************江湖金库**************************
texts[Index.Fundshort_EXCEED_MAX_BUY_LEVEL]                                 = 'Vượt quá cấp mua'
texts[Index.Fundshort_BOUGHT_FUND]                                          = 'Đã mua xu rồi'
texts[Index.Fundshort_NOT_BUY_FUND]                                         = 'Chưa mua xu'
texts[Index.Fundshort_NOT_ACHIEVE_LEVEL]                                    = 'Chưa đạt cấp yêu cầu để nhận'
texts[Index.Fundshort_RECEIVE_FUND_REWARD]                                  = 'Đã nhận thưởng xu'

--***********************战力活动**************************
texts[Index.PowerActivityNOT_EXIST]                                   = 'Sự kiện không tồn tại'
texts[Index.PowerActivityIS_COMPLETE]                                 = 'Sự kiện đã hoàn thành'
texts[Index.PowerActivityNOT_ACHIEVE]                                 = 'Chiến lực chưa đạt'
texts[Index.PowerActivityNOT_COMPLETE]                                = 'Tạm thời không thể nhận thưởng này'

--***********************论剑登峰**************************
texts[Index.peakPLAYER_LEAVE]                                             = 'Đối phương đã rời Trận Nhãn này'
texts[Index.peakNOT_PEAK_CHALLENGE_VALUE]                                 = 'Không đủ lượt thách đấu'
texts[Index.peakPEAK_CHANGE]                                              = 'Vị trí Trận Nhãn thay đổi'
texts[Index.peakNOT_CHANGE_MYSELF]                                        = 'Không thể thách đấu chính mình'
texts[Index.peakPEAK_CLOSE]                                               = 'Đang tổng kết thưởng, 23:55-00:05 không thể chiếm, từ bỏ Trận Nhãn'
texts[Index.peakPEAK_OPEN_TIME]                                           = 'Đỉnh Luận Kiếm mở vào 10:00 - 22:00 mỗi thứ 5'



--***********************无量噩梦**************************
texts[Index.Wuliang_EmengNOT_ENOUGH_COUNT]                                      = 'Không đủ lượt'
texts[Index.Wuliang_EmengNOT_PASS_NORTH_CAVE]                                   = 'Bắc Quật chưa đạt ải 20'
texts[Index.Wuliang_EmengNOT_FINISH_CROSS_BATTLE]                               = 'Sau Võ Lâm Đại Hội Liên Server kỳ 1 mở'
texts[Index.Wuliang_EmengNOT_ENOUGH_CHALLENGE_COUNT]                            = 'Không đủ lượt thách đấu'
texts[Index.Wuliang_EmengLAST_LEVEL_NOT_PASS]                                   = 'Chưa vượt ải trước'
texts[Index.Wuliang_EmengTEMPLATE_NOT_FOUND]                                    = 'Không tìm thấy dữ liệu cài đặt'
texts[Index.Wuliang_EmengNO_CHALLENGE_COUNT]                                    = 'Không có lượt thách đấu'
texts[Index.Wuliang_EmengLEVEL_NOT_PASS]                                        = 'Chưa vượt qua ải hiện tại'
texts[Index.Wuliang_EmengSEASON_END]                                            = 'Giải đấu đã kết thúc'
texts[Index.Wuliang_EmengPARAM_ERROR]                                           = 'Tham số lỗi'
texts[Index.Wuliang_Emengshort_NOT_OPEN]                                        = 'Vô Lượng Ác Mộng chưa mở'



--***********************装备进阶**************************
texts[Index.EquipmentAttribINCREASE_STEPS_EXP_FULL]                                 = 'EXP Phụ Ma đã đầy, cần nâng bậc'

--***********************装备进阶**************************
texts[Index.EQUIPGEM_KIND_ERROR]                                                   = 'Ngọc đặc biệt không thể khảm trang bị'

--***********************家园**************************
texts[Index.HomeNOT_HOME_TURNTABLE_NUM]                                 = 'Không đủ lượt quay'
texts[Index.HomeNOT_HOME_SHARE_NUM]                                     = 'Không đủ lượt chia sẻ'
texts[Index.HomeHOME_LEVEL_MAX]                                         = 'Gia Viên đã đạt cấp tối đa'
texts[Index.HomeHOME_NOT_OPEN]                                          = 'Gia Viên chưa mở'
texts[Index.HomeHOME_SHARE_SUCCESS]                                     = 'Chia sẻ thành công'
texts[Index.HomeEVENT_IS_OPEND]										 = 'Đã quá hạn'



--*********************** ngày机轮**************************
texts[Index.TianjilunNO_COIN]                              					= 'Chưa bỏ xu'
texts[Index.TianjilunACTIVITY_NOT_OPEN]                                     = 'Chưa mở'
texts[Index.TianjilunCAN_NOT_REPEAT_COIN]									= 'Không thể bỏ xu lặp lại'
texts[Index.TianjilunPARAMETER_ERROR]										= 'Tham số lỗi'



--***********************帮派红包**************************
texts[Index.RPNOT_BUY_NUM]                              					= 'Lì xì này hôm nay đã hết lượt mua'
texts[Index.RPRED_PACKET_PERSON_ERROR]                   	                = 'Số lì xì tối đa vượt quá số người của Bang'
texts[Index.RPNOT_GUILD]													= 'Đã không còn Bang'
texts[Index.RPGUILD_DISSOLVE]												= 'Bang đang giải tán không thể phát lì xì'
texts[Index.RPRED_PACKET_BEFORE_JOIN_GUILD]							 		= 'Không được nhận lì xì trước khi vào Bang'
texts[Index.RPRED_PACKET_RECEIVE_FAIL]								   		= 'Lì xì đã bị cướp sạch'
texts[Index.RPRED_PACKET_OUTDATE]											= 'Lì xì đã quá hạn'
texts[Index.RPRED_PACKET_DESC_TOO]											= 'Mô tả quá dài'
texts[Index.RPRED_PACKET_RECEIVED]											= 'Không thể nhận lặp cùng 1 lì xì'
texts[Index.RPSEND_RED_PACKET_ERROE]										= 'Vào Bang đủ 1 ngày mới được phát lì xì'
texts[Index.RPRECEIVE_RED_PACKET_ERROE]										= 'Vào Bang đủ 1 ngày mới được nhận lì xì'
texts[Index.RPRED_PACKET_CURRENCY_ERROR]									= 'Không đủ xu lì xì'


--***********************阵法**************************
texts[Index.BattleArrayINTENSIFY_LEVEL_MAX]                                 = 'Cấp cường hoa đã đạt tối đa'
texts[Index.BattleArrayNOT_EXIST_BATTLE_ARRAY]                              = 'Trận Pháp không tồn tại'
texts[Index.BattleArraySTAR_LEVEL_MAX]                                      = 'Cấp sao đã đạt tối đa'
texts[Index.BattleArrayNOT_CAN_USE_ITEM]                                    = 'Cấp hiện tại không thể dùng nguyên liệu này'
texts[Index.BattleArrayALL_POSITION_SELECT]                                 = 'Toàn bộ vị trí đã khóa'

--***********************回购**************************
texts[Index.RebuyRES_YESTERDAY_BOUGHT]                                    = 'Đã mua lại'
texts[Index.RebuySERDANG_SEASON_NOT_OPEN]                                 = 'Vô Lượng Sơn Ác Mộng chưa mở'
texts[Index.RebuyNORTH_CAVE_NOT_OPEN]                                     = 'Bắc Quật chưa mở'
texts[Index.RebuyBUY_SUCCESS]                                             = 'Mua lại thành công'

--***********************回购**************************
texts[Index.MODULENOT_OPEN]											      = 'Tính năng chưa mở'

--***********************装备出售**************************
texts[Index.SPECIAL_EQUIPMENT_NOTSALE] 										     = 'Trang bị đặc biệt không thể bán'
texts[Index.SPECIAL_EQUIPMENT_NOTRECAST] 									     = 'Trang bị đặc biệt không thể đúc lại'

--***********************Tửu Quán次数奖励**************************
texts[Index.RecruitBonus_Received] 											= 'Đã nhận rương'
texts[Index.RecruitBonus_Unreceivable] 										= 'Không đủ điều kiện nhận rương'


--***********************Vượt Đông Doanh**************************
texts[Index.BreakJapanPlaceTEAM_HAVE_ERROR]                                       = 'Bạn đã vào 1 đội'
texts[Index.BreakJapanPlaceCHALLENGE_COUNT_ERROR]                                 = 'Không đủ lượt thách đấu'
texts[Index.BreakJapanPlaceTEAM_NOT_EXIST]                                        = 'Thông tin đội đã quá hạn'
texts[Index.BreakJapanPlaceTEAM_MEMBER_FULL]                                      = 'Đội đã đủ người'
texts[Index.BreakJapanPlaceTEAM_FIGHT_ERROR]                                      = 'Đội đã vào chiến đấu'
texts[Index.BreakJapanPlaceTEAM_NOT_BETWEEN_LEVEL]                                = 'Cấp không đạt yêu cầu'
texts[Index.BreakJapanPlaceTEAM_NOT_LEADER_ERROR]                                 = 'Đội trưởng mới được mời'
texts[Index.BreakJapanPlaceTEAM_INVITE_ERROR]                                     = 'Không thể mời lặp'
texts[Index.BreakJapanPlaceTEAM_INVITE_HAVE_TEAM]                                 = 'Đối phương đã có đội'
texts[Index.BreakJapanPlaceENTER_TEAM_COPY_LEADER_ERROR]                          = 'Đội trưởng được chọn vào chiến đấu'
texts[Index.BreakJapanPlaceTEAM_MEMBER_LESS]                                      = 'Đội thiếu người'
texts[Index.BreakJapanPlaceTEAM_COPY_STATUS_ERROR]                                = 'Đội đã vào chiến đấu, hoặc chiến đấu đã kết thúc'
texts[Index.BreakJapanPlaceTEAM_MEMBER_READY_ERROR]                               = 'Có thành viên chưa chuẩn bị'
texts[Index.BreakJapanPlaceCHAPTER_NOT_OPEN]                                      = 'Chưa mở ải'
texts[Index.BreakJapanPlaceTEAM_COPY_IS_PASS]                                     = 'PB này đã vượt qua'
texts[Index.BreakJapanPlaceTEAM_COPY_NOT_PASS]                                    = 'Vượt ải'
texts[Index.BreakJapanPlaceLOTTERY_NUMBER_ERROR]                                  = 'Không đủ lượt quay thưởng'
texts[Index.BreakJapanPlaceINVITE_CD_ERROR]                                       = 'Đang CD mời'
texts[Index.BreakJapanPlaceINVITE_SUCCESS]                                        = 'Mời thành công'
texts[Index.BreakJapanPlaceNOT_OPEN]                                              = '12：00-14：00,  18：00-20：00 mỗi ngày mở'
texts[Index.BreakJapanPlaceIS_CLOSED]                                             = 'Sự kiện này đã kết thúc'
texts[Index.BreakJapanPlaceCROSS_EXCEPTION]                                       = 'Trạng thái liên server bất thường'
texts[Index.BreakJapanPlaceCREATE_FAILED]                                         = 'Lập đội thất bại'
texts[Index.NOLOTTERY_ELIGIBILITY] 											 	  = 'Không thể tham gia quay thưởng'
texts[Index.NOREMANENTS] 														  = 'Không có thưởng để mua'
texts[Index.NOCHAPTER] 															  = 'Chương không tồn tại'


--***********************浪人武士**************************
texts[Index.Japan_islandKNIGHT_NOT_EXITS]                                         = 'Võ sĩ này đã bị hạ'
texts[Index.Japan_islandKNIGHT_CANT_SHARE]                                        = 'Bạn đã thách đấu thành công võ sĩ này'
texts[Index.Japan_islandHAVE_NO_FRIEND]                                           = 'Bạn chưa có hảo hữu'
texts[Index.Japan_islandKNIGHT_ASSIST_NOT_EXITS]                                  = 'Võ sĩ này không tồn tại'
texts[Index.Japan_islandKNIGHT_ASSIST_ALREADY_FT]                                 = 'Bạn đã thách đấu võ sĩ này'
texts[Index.Japan_islandKNIGHT_ASSIST_CANT_FT]                                    = 'Khi chia sẻ, bạn không phải hảo hữu của người này'
texts[Index.Japan_islandKNIGHT_ASSIST_IS_FTING]                                   = 'Võ sĩ này đang bị thách đấu'
texts[Index.Japan_islandKNIGHT_ASSIST_NOT_ENOUGH]                                 = 'Không đủ lượt thách đấu'
texts[Index.Japan_islandKNIGHT_LEVEL_NOT_ENOUGH]                                  = 'Không đủ cấp'
texts[Index.Japan_islandKNIGHT_NOT_OPEN]                                          = 'Chưa mở Lãng Khách'


--***********************礼包**************************
texts[Index.INVALIDCHANNEL]													= 'Mã kênh vô hiệu'

--***********************轻功夺宝**************************
texts[Index.Not_Find_WoodmanActivity]                            						 = 'Khinh Công Đoạt Bảo chưa mở'
texts[Index.Not_Find_WoodmanActivity_Reward]                              				 = 'Khinh Công Đoạt Bảo không có thưởng'


--***********************天书参悟**************************
texts[Index.BibleComprehendBIBLE_COMPREHEND_NOT_UNLOCK]                                 = 'Giai đoạn này chưa mở để lĩnh hội'
texts[Index.BibleComprehendBIBLE_COMPREHEND_CAN_NOT_REPLACE]                            = 'Không thể thay thuộc tính lĩnh hội tương đồng'
texts[Index.BibleComprehendBIBLE_COMPREHEND_CAN_NOT_COMPREHEND]                         = 'Thiên Thư này không thể lĩnh hội'

--***********************阵法置换**************************
texts[Index.ChangeZhenFaEXCHANGE_QUALITY_ERROR]                                   = 'Trận Pháp khác phẩm chất không thể thay thế'
texts[Index.ChangeZhenFaEXCHANGE_QUALITY_TOO_LOW]                                 = 'Trận Pháp quá thấp không thể thay thế'

--***********************名人堂**************************
texts[Index.NOT_STARHERO_PRAISE_NUM]                                             = 'Không đủ lượt like Danh Nhân Đường'
texts[Index.STARHERO_PRAISE_NUM_ERROR]                                           = 'Không đủ lượt like để nhận thưởng'
texts[Index.STARHERO_PRAISE_ERROR]                                               = 'Hôm nay đã like người này'
texts[Index.STARHERO_CLOSE]                                           		     = 'Tạm đóng Danh Nhân Đường'

--***********************王者擂台**************************
texts[Index.MasterContestManagerTEAM_NAME_SENSITIVE_WORD]                                 = 'Tên đội không chứa ký tự nhạy cảm'
texts[Index.MasterContestManagerTEAM_NAME_LENGTH_ERROR]                                   = 'Tên đội tối đa 8 ký tự'
texts[Index.MasterContestManagerTEAM_NAME_ERROR]                                          = 'Tên đội không được chứa ký tự đặc biệt'
texts[Index.MasterContestManagerPERMISSIONS_ERROR]                                        = 'Đội trưởng mới được thao tác'
texts[Index.MasterContestManagerRANDOM_TEAM_ERROR]                                        = 'Đội ngẫu nhiên không thể thao tác'
texts[Index.MasterContestManagerTEAM_NUM_ERROR]                                           = 'Đội đã đủ người'
texts[Index.MasterContestManagerTEAM_INVITE_ERROR]                                        = 'Thông tin mời đã quá hạn*/'
texts[Index.MasterContestManagerTEAM_EXIST_ERROR]                                         = 'Bạn đang trong đội này*/'
texts[Index.MasterContestManagerTEAM_HAVE_ERROR]                                          = 'Bạn đã có đội của riêng mình'
texts[Index.MasterContestManagerTEAM_NOT_HAVE_ERROR]                                      = 'Bạn chưa có đội'
texts[Index.MasterContestManagerTEAM_SIGN_UP_ERROR]                                       = 'Đội của bạn đã báo danh'
texts[Index.MasterContestManagerCONTEST_NOT_OPEN]                                         = 'Chưa mở'
texts[Index.MasterContestManagerCONTEST_END]                                              = 'Đấu Điểm đã kết thúc, không thể báo danh'
texts[Index.MasterContestManagerTARGET_TEAM_HAVE_ERROR]                                   = 'Đối phương đã có đội riêng'
texts[Index.MasterContestManagerTEAM_NUMBER_LESS_ERROR]                                   = 'Đội không đủ người để báo danh'
texts[Index.MasterContestManagerTEAM_SIGN_UP_QUIT_ERROR]                                  = 'Đội đã báo danh, không thể rời đội'
texts[Index.MasterContestManagerCONTEST_NOT_END_QUIT_ERROR]                               = 'Sự kiện chưa kết thúc, không thể rời đội'
texts[Index.MasterContestManagerTEAM_SIGN_UP_REMOVE_ERROR]                                = 'Đội đã báo danh, không thể khai trừ'
texts[Index.MasterContestManagerCONTEST_NOT_END_REMOVE_ERROR]                             = 'Sự kiện chưa kết thúc, không thể khai trừ'
texts[Index.MasterContestManagerLEIZHU_NOT_SIGN_UP_ERROR]                                 = 'Bá Chủ kỳ trước không thể báo danh tham dự Đấu Điểm'
texts[Index.MasterContestManagerFINALS_INSPIRE_ERROR]                                     = 'Bạn không phải đội tham gia chung kết'
texts[Index.MasterContestManagerINSPIRE_CD_ERROR]                                         = 'CD cổ vũ 1s'
texts[Index.MasterContestManagerBET_ERROR]                                                = 'Bạn đã đặt cược'
texts[Index.MasterContestManagerLEIZHU_NOT_QUIT_ERROR]                                    = 'Thành viên đội Bá Chủ không thể thay đổi'
texts[Index.MasterContestManagerBET_TIME_ERROR]                                           = 'Không trong giai đoạn cược'
texts[Index.MasterContestManagerRED_PACKET_NOT_EXIST_ERROR]                               = 'Lì xì không tồn tại'
texts[Index.MasterContestManagerRED_PACKET_RECEIVE_ERROR]                                 = 'Đã nhận lì xì này'
texts[Index.MasterContestManagerRED_PACKET_NOT_RECEIVE_ERROR]                             = 'Khi phát lì xì bạn không online để nhận'
texts[Index.MasterContestManagerRECEIVE_RED_VALID_TIME_ERROR]                             = 'Lì xì đã quá hạn'
texts[Index.MasterContestManagerFINALS_INSPIRE_MAX_ERROR]                                 = 'Cổ vũ đã đạt tối đa'

--***********************Pet**************************
texts[Index.BattlePetBATTLE_PET_INEXISTENCE]                                 = 'Pet không tồn tại'
texts[Index.BattlePetCAN_NOT_EQUIP_SAME_PET]                                 = 'Không thể ra trận cùng 1 pet'
texts[Index.BattlePetCAN_NOT_FREE]                                           = 'Đang ra trận, không thể phóng sinh'
texts[Index.BattlePetCAN_NOT_CHANGE_TRAINER]                                 = 'Tướng không tồn tại để làm Thầy Huấn Luyện'
texts[Index.BattlePetCAN_NOT_UP_QUALITY]                                     = 'Phẩm chất đã đạt tối đa'
texts[Index.BattlePetCAN_NOT_UP_STAR]                                        = 'Cấp sao đã đạt tối đa'
texts[Index.BattlePetCONSUMES_NOT_ENOUGH]                                    = 'Không đủ nguyên liệu'

--***********************帮派演武**************************
texts[Index.PARAMETERERROR] 												    = 'Tham số lỗi'
texts[Index.NOTOPEN] 														    = 'Diễn Võ Bang chưa mở'
texts[Index.BATTLECD] 													  		= 'Đang CD không thể thách đấu'
texts[Index.GUILDINEXISTENCE] 											    	= 'Bang không tồn tại'
texts[Index.GUILD_NOTMASTER] 													= 'Không phải Bang Chủ'
texts[Index.HELP_BATTLECD] 														= 'Đang CD trợ chiến'
texts[Index.HELP_BATTLE_NOTDATA] 												= 'Trợ chiến không có người chơi, không thể trợ chiến'
texts[Index.HELP_BATTLE_NOTPLAYER] 												= 'Người chơi không tồn tại, không thể hỗ trợ trợ chiến'
texts[Index.HELP_BATTLE_NOTMEMBER] 												= 'Người này không phải thành viên Bang để trợ chiến'
texts[Index.HELP_BATTLE_NOT_OFFTIME] 											= 'Người chơi offline chưa đủ 3 ngày, không thể trợ chiến'
texts[Index.BATTLEEND] 															= 'Đã kết thúc, không thể thao tác'
texts[Index.BATTLE_GUILDTIME]													= 'Vào Bang chưa đủ 24 giờ, không thể tham dự'

--***********************镖行天下**************************
texts[Index.EscortAgencyPARAMETER_ERROR]                                    = 'Tham số lỗi'
texts[Index.EscortAgencyACTIVITY_NOT_START]                                 = 'Chưa bắt đầu'
texts[Index.EscortAgencyBATTLE_NOT_START]                                   = 'Chiến đấu chưa bắt đầu'
texts[Index.EscortAgencyCAN_NOT_ATTACK_SAME_PART]                           = 'Không thể tấn công cùng 1 vị trí'
texts[Index.EscortAgencyCAR_INEXISTENCE]                                    = 'Tiêu không tồn tại'
texts[Index.EscortAgencyARMOR_GOOD_CAN_NOT_ATTACK]                          = 'Hộ giáp của Tiêu này hoàn hảo, không thể tấn công vị trí khác'
texts[Index.EscortAgencyDEF_NOT_DIE_CAN_NOT_ATT]                            = 'Bạn đang trong 1 thế trận tấn công, hãy chờ kết thúc'
texts[Index.EscortAgencyGUILD_INEXISTENCE]                                  = 'Bạn chưa có Bang để báo danh'
texts[Index.EscortAgencyGUILD_NOT_MASTER]                                   = 'Chỉ Bang Chủ được thao tác'
texts[Index.EscortAgencyNOT_ENROLL_TIME]                                    = 'Hiện không trong giai đoạn báo danh'
texts[Index.EscortAgencyCAR_PART_FULL]                                      = 'Vị trí này đã đủ người'
texts[Index.EscortAgencyCAR_PART_DEF_REPEAT]                                 = 'Không thể bố trí cùng 1 người tại 1 vị trí'
texts[Index.EscortAgencyCAR_PART_ATT_REPEAT]                                 = 'Bạn đang trong danh sách tấn công vị trí này'
texts[Index.EscortAgencyATT_REST_TIME]                                       = 'Đang CD chỉnh đốn'
texts[Index.EscortAgencyATT_FORMATION_INEXISTENCE]                           = 'Hiện chưa tấn công Tiêu nào, không thể chỉnh đốn'
texts[Index.EscortAgencyTARGET_REPEAT]                                       = 'Hiện đã tập trung tấn công 1 Tiêu, hãy hủy trước'
texts[Index.EscortAgencyTARGET_INEXISTENCE]                                  = 'Mục tiêu tập trung công không tồn tại'
texts[Index.EscortAgencyCAR_QUALITY_FULL_UP]                                 = 'Tiêu đã nâng lên cấp tối đa'
texts[Index.EscortAgencyGUILD_BOOM_NOT_ENOUGH]                               = 'Không đủ Phồn Vinh'
texts[Index.EscortAgencyATT_FORMATION_DIE_CAN_NOT_ATT]                       = 'Bạn đã tử trận, hãy chỉnh đốn tấn công'
texts[Index.EscortAgencyGROUP_INVALID]                                       = 'Chưa mở chia cụm liên server'


--***********************济世堂**************************
texts[Index.GUILDLEVEL] 														= 'Bang không đủ cấp'
texts[Index.GUILDMEMBER] 														= 'Bang không có thành viên này'
texts[Index.GUILDNEED] 															= 'Yêu cầu này đã hoàn thành'
texts[Index.GUILDRECEIVE] 														= 'Không có thưởng để nhận'
texts[Index.GUILD_CAN_NOT_CHANGEDAY] 											= 'Trong ngày không thể gửi nhiều yêu cầu'
texts[Index.GUILD_CAN_NOT_CHANGERECEIVE] 										= 'Có đóng góp chưa nhận, không thể đổi yêu cầu'

--***********************武林公敌**************************
texts[Index.WulinGongdiCD_TIME]                                   = 'Đang trong CD'
texts[Index.WulinGongdiNOT_START]                                 = 'Thách đấu chưa bắt đầu'
texts[Index.WulinGongdiBOOS_DIE]                                  = 'Công Địch đã tử vong'

--***********************天书注解**************************
texts[Index.BIBLE_NOTE_CAN_NOTSUMMARIZE]  										= 'Thiên Thư này chưa chú giải đầy, không thể mở tổng quát'
texts[Index.BIBLE_KEY_NOTEXIST]  												= 'Chưa tìm thấy chìa mật'
texts[Index.BIBLE_NOTOPEN] 														= 'Chưa đạt điều kiện mở chú giải Thiên Thư'

--***********************琅嬛福地**************************
texts[Index.SELECTED_NOTENOUGH]													= 'Vòng quay chưa đủ 8 vật phẩm, hãy bổ sung'
texts[Index.RANDOM_REWARDFAILED]												= 'Thưởng ngẫu nhiên thất bại'
texts[Index.ERROR_PRAYTYPE]														= 'Loại quay thưởng lỗi'


--***********************游历挖宝**************************
texts[Index.ERROR_ROWID]														= 'Tọa độ ngang lỗi'
texts[Index.ERROR_COLID]														= 'Tọa độ dọc lỗi'
texts[Index.NO_ENOUGHTIMES]														= 'Không đủ lượt đào báu'
texts[Index.HAS_EXISTEDTREASURE]												= 'Vị trí hiện tại có rương'
texts[Index.NOHISTORY]															= 'Chưa có người chơi nhận'
texts[Index.NO_ENOUGHTRESURES]													= 'Hiện người chơi không đủ rương'
texts[Index.ERROR_ISHIDDEN]														= 'Tham số nặc danh lỗi'
texts[Index.CAN_NOT_GETGOODS]													= 'Chưa nhận được vật phẩm'
texts[Index.FUNCTIONCLOSED]														= 'Chưa mở đào, chôn báu'

--***********************帮派活跃红包**************************
texts[Index.HAS_SENT_REDPACKET]													= 'Đã phát lì xì sôi nổi Bang này'
texts[Index.PROGRESS_NOTENOUGH]													= 'Không đủ Trung Nghĩa để phát lì xì sôi nổi Bang'
texts[Index.NOT_SENDTIME]														= '20:00 - 00:00 được phát lì xì sôi nổi'
texts[Index.FUNCTION_NOTOPEN]													= 'Chưa phát lì xì sôi nổi Bang'
texts[Index.H_LEVEL_NOTENOUGH]													= 'Bang không đủ cấp'
texts[Index.H_POWER_NOTENOUGH]													= 'Chỉ Bang Chủ và Bang Phó được phát lì xì sôi nổi'
texts[Index.IS_GOTREWARD]													    = 'Bạn đã nhận rương'
texts[Index.REWARD_IS_NOTEXIST]											    	= 'Cài đặt thưởng không tồn tại'

--***********************心法**********************
texts[Index.XINFA_ID_NOTFOUND]													= 'ID Tâm Pháp này không tồn tại'
texts[Index.XINFA_IDMAX]														= 'Đã luyện tới cấp cao nhất'
texts[Index.NOT_ENOUGHWISDOM]													= 'Không đủ Xu Tuệ Tâm'
texts[Index.NOT_ENOUGHTENCHU]													= 'Không đủ Xu Châu Tâm'
texts[Index.XINFA_GEM_NOTFOUNT]													= 'Không tìm thấy module khảm'
texts[Index.XINFA_GEMLOCK]														= 'Chưa mở lỗ'
texts[Index.XINFA_GEM_LEVEL_NOTENOUGH]											= 'Lỗ ngọc khảm ngọc không phù hợp'
texts[Index.XINFA_NOTCULTURE]                                                 	= 'Không thể luyện Tâm Pháp'
texts[Index.XINFA_GEM_NOTOPEN]                                                  = 'Chưa mở'

--***********************赶年兽**************************
texts[Index.BeastNotOpen]					        							= 'Chưa mở'
texts[Index.BeastDataError]														= 'Tham số lỗi'
texts[Index.BeastNotYetRefresh]													= 'Chưa đến giờ làm mới con tiếp theo'
texts[Index.BeastNotRefresh]													= 'Không thể làm mới Niên Thú nữa'
texts[Index.BeastGotItSycee]												    = 'Đã nhận KNB'
texts[Index.BeastNotYourBaest]												    = 'Không phải Niên Thú bạn đuổi'

--***********************打年兽**************************
texts[Index.Beast_Deadalready]     												= 'Niên Thú đã hết máu'
texts[Index.Beast_fireworks_notenough]											= 'Không đủ vật phẩm'
texts[Index.Beast_Cannot_finditem]												= 'Không tìm thấy vật phẩm'

--***********************贵宾商城**************************
texts[Index.VIP_SHOPOPEN]     													= 'Shop VIP chưa mở'
texts[Index.VIP_SCORE_NOTENOUGH]												= 'Không đủ điểm VIP'

--***********************英雄大会**************************
texts[Index.NOT_ENOUGHPRESTIGE]													= 'Không đủ Uy Danh'
texts[Index.NOT_ENOUGHENERGY]													= 'Anh Hùng Đại Hội không đủ thể lực'
texts[Index.SYSTEM_NOTOPEN]														= 'Chưa mở ính năng'
texts[Index.TERM_NOTOPEN]														= 'Chưa mở hoặc đã kết thúc'
texts[Index.WRONG_CHALLANGETARGET]												= 'Mục tiêu thách đấu lỗi'
texts[Index.NOT_ENOUGHENERGY]													= 'Không đủ thể lực'
texts[Index.TARGET_NOTEXIST]													= 'Mục tiêu không tồn tại'
texts[Index.TARGET_DATA_NOTFOUND]												= 'Không có dữ liệu mục tiêu'
texts[Index.REFRESH_TIME_COOLDOWN]												= 'Đang CD làm mới'
texts[Index.REWARD_IS_NOTEXIST]													= 'Thông tin thưởng không tồn tại'
texts[Index.CANNOT_RECEIVEREWARD]												= 'Chưa đạt điều kiện nhận'
texts[Index.REWARD_HAS_BEENRECEIVED]											= 'Đã nhận thưởng'
texts[Index.EXCHANGELIMITED]													= 'Đã đổi tối đa'
texts[Index.RANKCHANGED]														= 'Xếp hạng chưa đạt hoặc đã thay đổi'
texts[Index.RECORD_IS_NOTEXIST]													= 'Video không tồn tại'
texts[Index.CANNOT_REVENGEANYMORE]												= 'Không thể phản kích nhiều lần'
texts[Index.WRONG_CHALLANGETIME]												= 'Chưa đến thời gian thách đấu'

--***********************丹房**************************

texts[Index.NOTLEVEL_UP]                                                       = 'Không thể nâng cấp'
texts[Index.CONFIGNOT_FOUND]                                                   = 'Không tìm thấy cài đặt'
texts[Index.HELPERNOT_FOUND]                                                   = 'Không tồn tại thông tin này'
texts[Index.REFININGEND]                                                       = 'Đã hoàn thành luyện hóa này'
texts[Index.HELPERTIMES_NOT_ENOUGH]                                            = 'Đã hết lượt trợ giúp'
texts[Index.ISHELPER]                                                          = 'Đã trợ giúp thành viên này luyện hóa'
texts[Index.CANGTHELPER_YOURSELF]                                              = 'Không thể trợ giúp bản thân luyện hóa'
texts[Index.CANGTRECEIVE]                                                      = 'Không thể nhận'
texts[Index.NOTOPEN]                                                           = 'Phòng Luyện Đan chưa mở'
texts[Index.TOADYCOUNT_MAX]                                                    = 'Lượt luyện hóa hôm nay đã tối đa' 

--***********************天命**************************
texts[Index.DESTINYNOT_EXIST]                                                  = 'Thiên Mệnh không tồn tại'
texts[Index.DESTINYERROR]                                                      = 'Không thể khảm lại Thiên Mệnh tương đồng'
texts[Index.DESTINYSAME_ERROR]                                                 = 'Không thể thao tác cùng 1 Thiên Mệnh'
texts[Index.DESTINYCONFIG_ERROR]                                               = 'Không tìm thấy cài đặt'
texts[Index.DESTINYEXLOAD_ERROR]                                               = 'Tách thất bại'
texts[Index.DESTINYDEVOUR_NOT_EXIST]                                           = 'Không có Thiên Mệnh được nuốt'
texts[Index.NOTOPEN]                                                           = 'Chưa mở'
texts[Index.ISMAX_LEVEL]                                                       = 'Đã đạt cấp tối đa'

--***********************祭祀**************************
texts[Index.NOTENABLE]                                                         = 'Trạng thái này chưa kích hoạt'
texts[Index.CONFIGURENOT_FOUND]                                                = 'Không tìm thấy cài đặt'
texts[Index.DROPGROUP_NOT_FOUND]                                               = 'Không tìm thấy rớt'
texts[Index.DROPEMPTY]                                                         = 'Không rớt ra gì'
texts[Index.ITEMLIST_FULLY]                                                    = 'Không còn dư vị trí'
texts[Index.HAVENOT_ITEM]                                                      = 'Không có vật phẩm để nhặt'
texts[Index.ITEMNOT_FOUND]                                                     = 'Không tìm thấy mục'
texts[Index.CANTNGET_TODAY]                                                    = 'Hôm nay đã nhận'
texts[Index.HAVENOT_DES]                                                       = 'Không có Thiên Mệnh để nuốt'
texts[Index.NOTENOUGH_LINGQI]                                                  = 'Không đủ Linh Khí'

--***********************弹劾**************************
texts[Index.IMPEACHMENTNO_SATISFY]                                             = 'Không đủ điều kiện luận tội'
texts[Index.NOTENOUGH_DAY]                                                     = 'Vào Bang chưa đủ 50 ngày, không thể luận tội'  

--***********************天阶1键**************************

texts[Index.LADDERIS_SWEEP]                                                    = 'Không có lượt thách đấu nhanh'
texts[Index.LADDERFORMATION_NUMBER]                                            = 'Đội thách đấu đã đạt tối đa'
texts[Index.LADDERBATTLE_INFO_ERROR]                                           = 'Danh sách thách đấu lỗi'








return texts