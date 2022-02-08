--[[
******济世堂主界面*******

	-- by luoconghai
	-- 2017/05/09
	
]]

local JiShiTangMainLayer = class("JiShiTangMainLayer",BaseLayer)

function JiShiTangMainLayer:ctor(data)
	self.super.ctor(self, data)
	self:init("lua.uiconfig_mango_new.faction.JiShiTangMain")
end

function JiShiTangMainLayer:initUI( ui )

	self.super.initUI(self, ui)
    self.panel_head     = TFDirector:getChildByPath(ui, 'panel_head');
    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.Jishitang,{HeadResType.COIN,HeadResType.SYCEE})
    self.generalHead:setVisible(true)
    self.btn_shouzengjilu    = TFDirector:getChildByPath(ui, "btn_shouzengjilu")
    self.btn_paihang         = TFDirector:getChildByPath(ui, "btn_paihang")
    self.btn_chengjiu        = TFDirector:getChildByPath(ui, "btn_chengjiu")
    self.btn_guize           = TFDirector:getChildByPath(ui, "btn_guize")

    self.Panel_zuo           = TFDirector:getChildByPath(ui, "Panel_zuo")
    self.btn_jia             = TFDirector:getChildByPath(self.Panel_zuo, "btn_jia")
    self.iconbg              = TFDirector:getChildByPath(self.Panel_zuo, "iconbg")
    self.img_icon            = TFDirector:getChildByPath(self.Panel_zuo, "img_icon")
    self.txt_iconsl          = TFDirector:getChildByPath(self.Panel_zuo, "txt_iconsl")
    self.btn_lingqu          = TFDirector:getChildByPath(self.Panel_zuo, "btn_lingqu")
    self.btn_morexuqiu       = TFDirector:getChildByPath(self.Panel_zuo, "btn_morexuqiu")
    self.txt_info            = TFDirector:getChildByPath(self.Panel_zuo, "txt_info")
    self.CheckBox_gouxuan    = TFDirector:getChildByPath(ui, "CheckBox_gouxuan")
    self.CheckBox_gouxuan:setSelectedState(FactionJiShiTangManager:getCheckBoxStatus())    
        
    self.Panel_you = TFDirector:getChildByPath(ui, "Panel_you")

    self.img_cellbg_you=TFDirector:getChildByPath(self.Panel_you, 'img_cellbg' )
    self.img_cellbg_you:removeFromParent()
    self.img_cellbg_you:retain()
end


function JiShiTangMainLayer:removeUI()
	self.super.removeUI(self)
end

function JiShiTangMainLayer:onShow()
    self.super.onShow(self)
end

function JiShiTangMainLayer:refreshUI()
    self.menberInfo=FactionJiShiTangManager:getJiShiTangInfoByindex( FactionJiShiTangManager.INFO_MEMBER )
    self.meInfo=FactionJiShiTangManager:getJiShiTangInfoByindex( FactionJiShiTangManager.INFO_ME )
    self:refreshTableView()
    self:showMyInfo()
end

function JiShiTangMainLayer:showMyInfo()
    local status_24=FactionJiShiTangManager:getHelpStatue()--是否过了0点
    if self.meInfo then
        local infoData=self.meInfo
        if infoData.templateId==0 or (status_24 and infoData.currentNum==infoData.limitNum) then--没有需求
            self.btn_jia:setVisible(true)
            self.iconbg:setVisible(false)
            self.btn_lingqu:setVisible(false)
            self.btn_morexuqiu:setVisible(false)
            self.txt_info:setString(localizable.jishitang_txt_need)
        else
            local commonReward = {}
            commonReward.type   = EnumDropType.GOODS
            commonReward.itemId = tonumber(infoData.templateId)
            commonReward.number = tonumber(infoData.currentNum)
            local itemInfo=BaseDataManager:getReward(commonReward)
            self.img_icon:setTexture(itemInfo.path)
            Public:addPieceImg(self.img_icon,itemInfo,nil,1.0);
            self.iconbg:addMEListener(TFWIDGET_CLICK,
                audioClickfun(function()
                    Public:ShowItemTipLayer(self.meInfo.templateId, EnumDropType.GOODS)
                end))
            self.txt_iconsl:setText(infoData.receiveNum+infoData.currentNum..'/'..infoData.limitNum)

            self.btn_jia:setVisible(false)
            self.iconbg:setVisible(true)
            self.btn_morexuqiu:setVisible(false)
            if infoData.currentNum==infoData.limitNum then--领完了
                self.btn_lingqu:setVisible(false)
                self.txt_info:setVisible(not status)
                self.txt_info:setString(localizable.jishitang_txt_need_reward)
            else
                self.btn_morexuqiu:setVisible(status_24)
                self.txt_info:setVisible(false)
                self.btn_lingqu:setVisible(true)
                self.btn_lingqu:setGrayEnabled(not (infoData.receiveNum>0))
                self.btn_lingqu:setTouchEnabled(infoData.receiveNum>0)
            end
        end
    end
end


function JiShiTangMainLayer:refreshTableView()
        if self.TableView == nil then
            local  tableView =  TFTableView:create()

            self.TableView = tableView
            tableView:setTableViewSize(self.Panel_you:getContentSize())
            tableView:setDirection(TFTableView.TFSCROLLVERTICAL)
            tableView:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN)

            self.TableView:addMEListener(TFTABLEVIEW_SIZEFORINDEX, handler(self.cellSizeForTable,self))
            self.TableView:addMEListener(TFTABLEVIEW_SIZEATINDEX, handler(self.tableCellAtIndex,self))
            self.TableView:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, handler(self.numberOfCellsInTableView,self))
            self.Panel_you:addChild(tableView)
        end
        self.TableView:reloadData()
end


function JiShiTangMainLayer:cellSizeForTable(table,idx)
    return 255,700
end

function JiShiTangMainLayer:tableCellAtIndex(table, idx)
    idx = idx + 1
    local cell = table:dequeueCell()
    if nil == cell then
        cell = TFTableViewCell:create()
    end
    self:setCellInfo(cell,idx)
    return cell
end

function JiShiTangMainLayer:numberOfCellsInTableView(table)

    local num = math.ceil(#self.menberInfo/4)
    if num < 0 then num = 0 end
    return num
end

function JiShiTangMainLayer:setCellInfo(cell,idx)

   -- local info=self.menberInfo
    local width = self.img_cellbg_you:getContentSize().width
    for i=1,4 do
        local node = cell:getChildByTag(100 + i)
        local infoData = self.menberInfo[ (idx - 1) * 4 + i ]
        if infoData and infoData.templateId>0 then
            if node == nil then
                local posX= (i - 1) * width + 22
                node = self.img_cellbg_you:clone()
                node:setAnchorPoint(ccp(0,0))
                node:setPosition(ccp(posX,0))
                cell:addChild(node,1,100 + i)
            end
            node:setVisible(true)

            local commonReward = {}
            commonReward.type   = EnumDropType.GOODS
            commonReward.itemId = tonumber(infoData.templateId)
            commonReward.number = tonumber(infoData.currentNum)
            local itemInfo=BaseDataManager:getReward(commonReward)
            local img_icon = TFDirector:getChildByPath(node, 'img_icon')
            img_icon:setTexture(itemInfo.path)
            Public:addPieceImg(img_icon,itemInfo,nil,1.0);
            local btn_iconbg=TFDirector:getChildByPath(node, 'btn_iconbg')
            btn_iconbg:addMEListener(TFWIDGET_CLICK,
                audioClickfun(function()
                    Public:ShowItemTipLayer(infoData.templateId, EnumDropType.GOODS)
                end))
            TFDirector:getChildByPath(node, 'txt_iconnumber'):setText(infoData.receiveNum+infoData.currentNum..'/'..infoData.limitNum)

            TFDirector:getChildByPath(node,'txt_name'):setString(infoData.playerName)

            local txt_have=TFDirector:getChildByPath(node, 'txt_have')
            local num=BagManager:getItemNumById( infoData.templateId ) or 0
            --当前拥有xx个--
            txt_have:setString(stringUtils.format(localizable.activity_discount_holdnum,num))
            

            local btn_juanxian=TFDirector:getChildByPath(node, 'btn_juanxian')
            if infoData.limitNum<=(infoData.receiveNum+infoData.currentNum) then
                btn_juanxian:setGrayEnabled(true)
                btn_juanxian:setTouchEnabled(false)
            else
                btn_juanxian:setGrayEnabled(false)
                btn_juanxian:setTouchEnabled(true)
            end
            btn_juanxian.infoData = infoData
            btn_juanxian.logic=self
            btn_juanxian:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onbtn_juanxianClickHandle),1);
        else
            if node then
                node:setVisible(false)
            end
        end
    end
end

function JiShiTangMainLayer:registerEvents()

	self.super.registerEvents(self)
    self.btn_chengjiu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onbtn_chengjiuClickHandle))
    self.btn_lingqu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onbtn_lingquClickHandle))
    self.btn_paihang:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnPaiHangClick))
    self.btn_guize:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onbtn_guizeClick)) 
    self.btn_paihang.logic=self
    self.btn_shouzengjilu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnShouZengClick))
    self.btn_jia:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnjiaClick))
    self.btn_jia.logic = self 
    self.btn_morexuqiu:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onBtnjiaClick))
    self.btn_morexuqiu.logic = self 
    self.btn_morexuqiu.type="self.btn_morexuqi"
    self.CheckBox_gouxuan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.onCheckBox_gouxuanClick))
    self.CheckBox_gouxuan.logic = self 
    self.refreshUIMainInfo=function(event)
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(FactionJiShiTangManager.RECEIVE_JISHITANG_MAIN_INFO ,self.refreshUIMainInfo)

    self.refreshUIInfo=function(event)
        FactionJiShiTangManager:requireJiShiTangInfo()
    end
    TFDirector:addMEGlobalListener(MainPlayer.GAME_RESET ,self.refreshUIInfo)
    if self.generalHead then
        self.generalHead:registerEvents()
    end

end

function JiShiTangMainLayer:removeEvents()
    self.super.removeEvents(self) 
	TFDirector:removeMEGlobalListener(FactionJiShiTangManager.RECEIVE_JISHITANG_MAIN_INFO ,self.refreshUIMainInfo)
    TFDirector:removeMEGlobalListener(FactionJiShiTangManager.RESTART_24 ,self.refreshUIInfo)
     -- self.btn_zyt:removeMEListener(TFWIDGET_CLICK)
     if self.generalHead then
        self.generalHead:removeEvents()
    end
end

function JiShiTangMainLayer.onBtnjiaClick( btn )
    local self=btn.logic
    if btn.type and btn.type=="self.btn_morexuqi" then--如果是更换需求，判断是否有东西可领取
        if self.meInfo and self.meInfo.receiveNum>0 then
            toastMessage(localizable.jishitang_have_item)
            return
        end
    end
    FactionJiShiTangManager:openJiShiTangChooseLayer()
end

function JiShiTangMainLayer.onbtn_juanxianClickHandle( sender )
    local self=sender.logic
    local infoData=sender.infoData
    local num=BagManager:getItemNumById( infoData.templateId ) or 0
    if num==0 then
        toastMessage(localizable.jishitang_noItem)
        return
    end
    local CheckBoxStatus= self.CheckBox_gouxuan:getSelectedState()
    FactionJiShiTangManager:openJiShiTangGiveLayer(infoData,FactionJiShiTangManager.TYPE_GIVE,CheckBoxStatus)
end

function JiShiTangMainLayer.onbtn_lingquClickHandle( sender )
    FactionJiShiTangManager:requireReWard()
end

-- 受赠记录Layer
function JiShiTangMainLayer.onBtnShouZengClick( btn )
    FactionJiShiTangManager:openShouZengJiLuLayer()
end

-- 济世榜
function JiShiTangMainLayer.onBtnPaiHangClick( btn )
    local self=btn.logic
    FactionJiShiTangManager:openJiShiBangLayer()
end

function JiShiTangMainLayer.onbtn_chengjiuClickHandle( btn )
    FactionJiShiTangManager:openChengjiuLayer()
end

function JiShiTangMainLayer.onbtn_guizeClick( btn )
    CommonManager:showRuleLyaer('guildcharity')
end

function JiShiTangMainLayer.onCheckBox_gouxuanClick( btn )
    local status=btn:getSelectedState()
    FactionJiShiTangManager:setCheckBoxStatus(status)
end


return JiShiTangMainLayer