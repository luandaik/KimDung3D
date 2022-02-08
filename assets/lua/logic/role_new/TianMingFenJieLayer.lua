--[[

 
                                 qBMBBBMBMY     
                                8BBBBBOBMBMv    
                              iMBMM5vOY:BMBBv        
              .r,             OBM;   .: rBBBBBY     
              vUL             7BB   .;7. LBMMBBM.   
             .@Wwz.           :uvir .i:.iLMOMOBM..  
              vv::r;             iY. ...rv,@arqiao. 
               Li. i:             v:.::::7vOBBMBL.. 
               ,i7: vSUi,         :M7.:.,:u08OP. .  
                 .N2k5u1ju7,..     BMGiiL7   ,i,i.  
                  :rLjFYjvjLY7r::.  ;v  vr... rE8q;.:,, 
                 751jSLXPFu5uU@guohezou.,1vjY2E8@Yizero.    
                 BB:FMu rkM8Eq0PFjF15FZ0Xu15F25uuLuu25Gi.   
               ivSvvXL    :v58ZOGZXF2UUkFSFkU1u125uUJUUZ,   
             :@kevensun.      ,iY20GOXSUXkSuS2F5XXkUX5SEv.  
         .:i0BMBMBBOOBMUi;,        ,;8PkFP5NkPXkFqPEqqkZu.  
       .rqMqBBMOMMBMBBBM .           @kexianli.S11kFSU5q5   
     .7BBOi1L1MM8BBBOMBB..,          8kqS52XkkU1Uqkk1kUEJ   
     .;MBZ;iiMBMBMMOBBBu ,           1OkS1F1X5kPP112F51kU   
       .rPY  OMBMBBBMBB2 ,.          rME5SSSFk1XPqFNkSUPZ,.
              ;;JuBML::r:.:.,,        SZPX0SXSP5kXGNP15UBr.
                  L,    :@huhao.      :MNZqNXqSqXk2E0PSXPE .
              viLBX.,,v8Bj. i:r7:,     2Zkqq0XXSNN0NOXXSXOU 
            :r2. rMBGBMGi .7Y, 1i::i   vO0PMNNSXXEqP@Secbone.
            .i1r. .jkY,    vE. iY....  20Fq0q5X5F1S2F22uuv1M;

]]

-- client side TianMingFenJieLayer.lua
--[[
 * @Description: 天命分解层
 ]]
-- creation time 2016-05-26

local TianMingFenJieLayer = class("TianMingFenJieLayer", BaseLayer)
local columnNumber = 5
function TianMingFenJieLayer:ctor(data)
    self.super.ctor(self,data);
    self:init("lua.uiconfig_mango_new.role_new.TianMingFenJie")

end

function TianMingFenJieLayer:initUI(ui)
	self.super.initUI(self,ui)
    self.generalHead = CommonManager:addGeneralHead(self)
    self.generalHead:setData(ModuleType.TianMing,{HeadResType.JINGPO,HeadResType.COIN,HeadResType.SYCEE})

    self.panel_list = TFDirector:getChildByPath(ui, 'panel_list')
    self.img_bg1 = TFDirector:getChildByPath(ui, 'img_bg1')
    self.img_bg2 = TFDirector:getChildByPath(ui, 'img_bg2')
    self.img_bg1:setVisible(false)
    self.img_bg2:setVisible(false)

    self.check_cheng = TFDirector:getChildByPath(ui, 'check_cheng')
    self.check_zi = TFDirector:getChildByPath(ui, 'check_zi')
    self.check_lan = TFDirector:getChildByPath(ui, 'check_lan')
    self.check_cheng.quality = 5
    self.check_zi.quality = 4
    self.check_lan.quality = 3
    
    self.btn_qdfj = TFDirector:getChildByPath(ui, 'btn_qdfj')

    self.cellModel = createUIByLuaNew("lua.uiconfig_mango_new.role_new.TianMingXiangQianCell")
    self.cellModel:retain()
                   
    self:refreshList()
end
function TianMingFenJieLayer:refreshList()
    self.TianmingList ={}
    self.TianmingList = TianMingManager:getEmptyTianMingList()
    self.List  = {}  --用于盘点需要分解的天命
    for i = 1,#self.TianmingList.m_list do
        self.List[i] = false
    end
end
function TianMingFenJieLayer:refreshUI()
    if self.table_select == nil then
        local tableView   =  TFTableView:create();
        self.table_select  = tableView;
    
        self.table_select.logic    = self;
        self.table_select:setTableViewSize(self.panel_list:getContentSize());
        self.table_select:setDirection(TFTableView.TFSCROLLVERTICAL);
        self.table_select:setVerticalFillOrder(TFTableView.TFTabViewFILLTOPDOWN);
    
        self.table_select:addMEListener(TFTABLEVIEW_SIZEFORINDEX, TianMingFenJieLayer.cellSizeForTable);
        self.table_select:addMEListener(TFTABLEVIEW_SIZEATINDEX, TianMingFenJieLayer.tableCellAtIndex);
        self.table_select:addMEListener(TFTABLEVIEW_NUMOFCELLSINTABLEVIEW, TianMingFenJieLayer.numberOfCellsInTableView);
        self.panel_list:addChild(self.table_select);
    end
    self.table_select:reloadData()
end

function TianMingFenJieLayer.cellSizeForTable(table,cell)
    return 200,600
end

function TianMingFenJieLayer.tableCellAtIndex(table,idx)
    local self = table.logic
    local cell = table:dequeueCell()
    self.allPanels = self.allPanels or {}

    if cell == nil then
        cell = TFTableViewCell:create()
        local newIndex = #self.allPanels + 1
        self.allPanels[newIndex] = cell

        for i=1,columnNumber do
            local panel = self.cellModel:clone()
            panel:setPosition(ccp(10 + 140 * (i - 1) ,0))
            cell:addChild(panel)
            panel:setTag(i)
        end
    end
    for i=1,columnNumber do
        local panel = cell:getChildByTag(i)
        self:cellInfoSet(panel, idx*columnNumber+i)
    end

    return cell
end

function TianMingFenJieLayer:cellInfoSet( panel, idx )
    panel.boundData         = true
    panel.panelEmpty        = TFDirector:getChildByPath(panel, "panel_empty")
    panel.panelInfo         = TFDirector:getChildByPath(panel, "panel_info")
    panel.img_pinzhiditu    = TFDirector:getChildByPath(panel, "img_back")
    panel.img_icon          = TFDirector:getChildByPath(panel, "img_icon")
    panel.img_soul          = TFDirector:getChildByPath(panel, 'img_soul1')
    panel.txt_lv            = TFDirector:getChildByPath(panel, "txt_lv")
    panel.txt_name          = TFDirector:getChildByPath(panel, "txt_name")
    panel.img_quality       = TFDirector:getChildByPath(panel, "img_quality")
    panel.img_selected_fg   = TFDirector:getChildByPath(panel, "img_selected_fg")
    panel.img_xuanzhong     = TFDirector:getChildByPath(panel, "img_xuanzhong")
    panel.img_jingyan       = TFDirector:getChildByPath(panel, "img_jingyan")
    panel.img_black         = TFDirector:getChildByPath(panel, "img_black")
    panel.txt_num           = TFDirector:getChildByPath(panel.img_jingyan, "txt_num")
    panel.panel_star        = TFDirector:getChildByPath(panel, "panel_star")
    panel.txt_starlv        = TFDirector:getChildByPath(panel.panel_star, "txt_starlv")
    panel.txt_attr         = TFDirector:getChildByPath(panel, "txt_attr")
    panel.panel_star:setVisible(false)
    panel.img_black:setVisible(false)
    panel.img_selected_fg:setVisible(false)
    panel.img_icon.idx = idx
    panel.txt_attr:setText(localizable.ResourceName[38])
    if self.List[idx] then
        panel.img_xuanzhong:setVisible(self.List[idx])
    else
        self.List[idx] = false
        panel.img_xuanzhong:setVisible(false) 
    end
    panel.img_icon:setTouchEnabled(true)
    panel.img_icon:addMEListener(TFWIDGET_CLICK, 
    audioClickfun(function()    
        if self.List[idx] == false then
            panel.img_xuanzhong:setVisible(true)
            self.List[idx]  = true
        elseif self.List[idx] == true then
            panel.img_xuanzhong:setVisible(false)
            self.List[idx]  = false
         end
        end))
    local roleItem = self.TianmingList:objectAt(idx);
    if roleItem then
        panel.panelEmpty:setVisible(true)
        panel.panelInfo:setVisible(true)
        panel.img_soul:setVisible(false)
        if roleItem.level >= 1 then
            panel.img_soul:setVisible(true)
            panel.txt_lv:setText(roleItem.level)
        end
        panel.img_icon:setTexture(roleItem.config:GetPath())
        panel.txt_num:setText("+"..roleItem.config.price + roleItem.exp)
        panel.img_quality:setTexture(GetColorIconByQuality(roleItem.quality))
        panel.kind = roleItem.config.kind 
        panel.txt_name:setText(roleItem.config.name)
        if roleItem.starnum > 0 or roleItem.starLevel > 0  then
            panel.panel_star:setVisible(true)
            panel.txt_starlv:setText(roleItem.starnum)
        end

        if roleItem.quality == 5 then
            if self.check_cheng:getSelectedState() == true then
                panel.img_xuanzhong:setVisible(true)
                self.List[idx]  = true
            end
        elseif roleItem.quality == 4 then
            if self.check_zi:getSelectedState() == true then
                panel.img_xuanzhong:setVisible(true)
                self.List[idx]  = true
            end
        elseif roleItem.quality <= 3 then
            if self.check_lan:getSelectedState() == true then
                panel.img_xuanzhong:setVisible(true)
                self.List[idx]  = true
            end
        end
        
    else
        panel.panelEmpty:setVisible(true)
        panel.panelInfo:setVisible(false)
    end
end

function TianMingFenJieLayer.numberOfCellsInTableView(table,cell)
    local self = table.logic
    if self.TianmingList == nil then
        return 0
    end
    return math.ceil(self.TianmingList:length()/columnNumber)
end

function TianMingFenJieLayer:registerEvents()
    self.super.registerEvents(self)
    if self.generalHead then
        self.generalHead:registerEvents()
    end
    self.check_cheng.logic = self
    self.check_cheng:addMEListener(TFWIDGET_CLICK, audioClickfun(self.checkTianMing),1)
    self.check_zi.logic = self
    self.check_zi:addMEListener(TFWIDGET_CLICK, audioClickfun(self.checkTianMing),1)
    self.check_lan.logic = self
    self.check_lan:addMEListener(TFWIDGET_CLICK, audioClickfun(self.checkTianMinglan),1)
    self.btn_qdfj.logic = self
    self.btn_qdfj:addMEListener(TFWIDGET_CLICK, audioClickfun(self.DecomposeFengJie),1)
    self.refreshTianMingList = function(event)
        self:refreshList()
        self.check_cheng:setSelectedState(false)
        self.check_zi:setSelectedState(false)
        self.check_lan:setSelectedState(false)
        self:refreshUI()
    end
    TFDirector:addMEGlobalListener(TianMingManager.RefreshTianMingList, self.refreshTianMingList)
end
function TianMingFenJieLayer.DecomposeFengJie(sender)
    local self = sender.logic
    local tianminglist = TFArray:new()
    for i = 1,#self.List do 
        if self.List[i] == true then
            local roleItem = self.TianmingList:objectAt(i);
            local gmid = roleItem.instanceId
            tianminglist:push(gmid)
        end
    end
    if #tianminglist.m_list > 0 then
        TianMingManager:sendExLoadDestiny(tianminglist.m_list)
    end
end
function TianMingFenJieLayer.checkTianMing(sender)
    local self = sender.logic
    for i = 1,#self.List do
        local roleItem = self.TianmingList:objectAt(i);
        if roleItem then
            if roleItem.quality == sender.quality then
                self.List[i] = sender:getSelectedState()
            elseif roleItem.quality < sender.quality then
                self.table_select:reloadData()
                return
            end
        end
    end
    self.table_select:reloadData()
end
function TianMingFenJieLayer.checkTianMinglan(sender)
    local self = sender.logic
    for i = 1,#self.List do
        local roleItem = self.TianmingList:objectAt(i);
        if roleItem then
            if roleItem.quality <= sender.quality then
                self.List[i] = sender:getSelectedState()
            end
        end
    end
    self.table_select:reloadData()
end

function TianMingFenJieLayer:removeEvents()
    self.super.removeEvents(self)
    if self.generalHead then
        self.generalHead:removeEvents()
    end
    TFDirector:removeMEGlobalListener(TianMingManager.RefreshTianMingList, self.refreshTianMingList)
    self.refreshTianMingList = nil
end
function TianMingFenJieLayer:removeUI()
    self.super.removeUI(self)
    if self.cellModel then
        self.cellModel:release()
        self.cellModel = nil
    end
end

function TianMingFenJieLayer:dispose()
    if self.generalHead then
        self.generalHead:dispose()
        self.generalHead = nil
    end
    self.super.dispose(self)
end
-----断线重连支持方法
function TianMingFenJieLayer:onShow()
    self.super.onShow(self)
    self.generalHead:onShow();
    self:refreshUI()
end

return TianMingFenJieLayer