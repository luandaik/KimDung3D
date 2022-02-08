.class public Lcom/heitao/platform/activity/HTPPayActivity;
.super Lcom/heitao/platform/activity/HTPBaseActivity;
.source "HTPPayActivity.java"


# static fields
.field private static final ALIPAY_SDK_CHECK_FLAG:I


# instance fields
.field private mButtonList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/heitao/platform/activity/HTPPayButton;",
            ">;"
        }
    .end annotation
.end field

.field private mCardValue:I

.field private mHandler:Landroid/os/Handler;

.field private mIsPayCompleted:Z

.field private mOnClickListener:Landroid/view/View$OnClickListener;

.field private mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field private mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

.field private mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

.field private mPopupWindow:Landroid/widget/PopupWindow;

.field private mPriorityUseAliay:Z

.field private mSDKPayListener:Lcom/heitao/platform/listener/HTPPayListener;

.field private mSupportList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

.field private nextButton:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 42
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;-><init>()V

    .line 44
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 45
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    .line 46
    sget-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 47
    sget-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    .line 48
    const/16 v0, 0x14

    iput v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mCardValue:I

    .line 49
    iput-boolean v2, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mIsPayCompleted:Z

    .line 50
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    .line 53
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    .line 54
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->nextButton:Landroid/widget/Button;

    .line 55
    iput-boolean v2, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPriorityUseAliay:Z

    .line 156
    new-instance v0, Lcom/heitao/platform/activity/HTPPayActivity$1;

    invoke-direct {v0, p0}, Lcom/heitao/platform/activity/HTPPayActivity$1;-><init>(Lcom/heitao/platform/activity/HTPPayActivity;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mHandler:Landroid/os/Handler;

    .line 438
    new-instance v0, Lcom/heitao/platform/activity/HTPPayActivity$2;

    invoke-direct {v0, p0}, Lcom/heitao/platform/activity/HTPPayActivity$2;-><init>(Lcom/heitao/platform/activity/HTPPayActivity;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    .line 543
    new-instance v0, Lcom/heitao/platform/activity/HTPPayActivity$3;

    invoke-direct {v0, p0}, Lcom/heitao/platform/activity/HTPPayActivity$3;-><init>(Lcom/heitao/platform/activity/HTPPayActivity;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSDKPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 42
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    return-object v0
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/model/HTPPayInfo;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    return-object v0
.end method

.method static synthetic access$10(Lcom/heitao/platform/activity/HTPPayActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$11(Lcom/heitao/platform/activity/HTPPayActivity;)Z
    .locals 1

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mIsPayCompleted:Z

    return v0
.end method

.method static synthetic access$12(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    return-object v0
.end method

.method static synthetic access$13(Lcom/heitao/platform/activity/HTPPayActivity;I)V
    .locals 0

    .prologue
    .line 48
    iput p1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mCardValue:I

    return-void
.end method

.method static synthetic access$14(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;)V
    .locals 0

    .prologue
    .line 47
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    return-void
.end method

.method static synthetic access$15(Lcom/heitao/platform/activity/HTPPayActivity;)I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mCardValue:I

    return v0
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;
    .locals 1

    .prologue
    .line 543
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSDKPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    return-object v0
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/HTPPayActivity;)V
    .locals 0

    .prologue
    .line 169
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPayActivity;->showExitPayDialog()V

    return-void
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/HTPPayActivity;II)V
    .locals 0

    .prologue
    .line 365
    invoke-direct {p0, p1, p2}, Lcom/heitao/platform/activity/HTPPayActivity;->setSelected(II)V

    return-void
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/HTPPayActivity;Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    return-void
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/HTPPayActivity;)V
    .locals 0

    .prologue
    .line 677
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPayActivity;->showPopupWindow()V

    return-void
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/HTPPayActivity;Z)V
    .locals 0

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mIsPayCompleted:Z

    return-void
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    return-object v0
.end method

.method static synthetic access$9(Lcom/heitao/platform/activity/HTPPayActivity;)Landroid/widget/PopupWindow;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method private initPayView()V
    .locals 22

    .prologue
    .line 207
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    move-object/from16 v18, v0

    if-nez v18, :cond_1

    .line 209
    const-string v18, "please_login"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 211
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    move-object/from16 v18, v0

    if-eqz v18, :cond_0

    .line 213
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    move-object/from16 v18, v0

    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getNotLoginError()Lcom/heitao/platform/model/HTPError;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    .line 216
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/heitao/platform/activity/HTPPayActivity;->finish()V

    .line 358
    :goto_0
    return-void

    .line 221
    :cond_1
    const/4 v6, 0x0

    .line 222
    .local v6, "leftButton":Landroid/widget/Button;
    const/4 v11, 0x0

    .line 224
    .local v11, "rightButton":Landroid/widget/Button;
    const/4 v10, 0x0

    .line 225
    .local v10, "productNameTextView":Landroid/widget/TextView;
    const/4 v9, 0x0

    .line 226
    .local v9, "productDescriptionTextView":Landroid/widget/TextView;
    const/4 v8, 0x0

    .line 228
    .local v8, "productAmountTextView":Landroid/widget/TextView;
    const/4 v3, 0x0

    .line 229
    .local v3, "alipayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const/4 v13, 0x0

    .line 230
    .local v13, "unionPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const/4 v7, 0x0

    .line 231
    .local v7, "mo9PayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const/16 v17, 0x0

    .line 232
    .local v17, "yeepayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const/4 v15, 0x0

    .line 233
    .local v15, "weixinPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const/4 v5, 0x0

    .line 234
    .local v5, "heitaoPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const/16 v16, 0x0

    .line 235
    .local v16, "wftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const/4 v12, 0x0

    .line 236
    .local v12, "smcPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const/4 v14, 0x0

    .line 238
    .local v14, "wapsftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v4, v0, Lcom/heitao/platform/common/HTPDataCenter;->mDirection:Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;

    .line 239
    .local v4, "direction":Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;
    sget-object v18, Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;->Portrait:Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;

    move-object/from16 v0, v18

    if-ne v4, v0, :cond_2

    .line 241
    const-string v18, "htp_activity_pay_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->setContentView(I)V

    .line 243
    const-string v18, "btn_pay_left_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6    # "leftButton":Landroid/widget/Button;
    check-cast v6, Landroid/widget/Button;

    .line 244
    .restart local v6    # "leftButton":Landroid/widget/Button;
    const-string v18, "btn_pay_right_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    .end local v11    # "rightButton":Landroid/widget/Button;
    check-cast v11, Landroid/widget/Button;

    .line 246
    .restart local v11    # "rightButton":Landroid/widget/Button;
    const-string v18, "txt_product_name_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    .end local v10    # "productNameTextView":Landroid/widget/TextView;
    check-cast v10, Landroid/widget/TextView;

    .line 247
    .restart local v10    # "productNameTextView":Landroid/widget/TextView;
    const-string v18, "txt_product_description_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    .end local v9    # "productDescriptionTextView":Landroid/widget/TextView;
    check-cast v9, Landroid/widget/TextView;

    .line 248
    .restart local v9    # "productDescriptionTextView":Landroid/widget/TextView;
    const-string v18, "txt_product_amount_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .end local v8    # "productAmountTextView":Landroid/widget/TextView;
    check-cast v8, Landroid/widget/TextView;

    .line 250
    .restart local v8    # "productAmountTextView":Landroid/widget/TextView;
    const-string v18, "htppbtn_alipay_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "alipayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v3, Lcom/heitao/platform/activity/HTPPayButton;

    .line 251
    .restart local v3    # "alipayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_unionpay_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    .end local v13    # "unionPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v13, Lcom/heitao/platform/activity/HTPPayButton;

    .line 252
    .restart local v13    # "unionPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_mo9_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .end local v7    # "mo9PayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v7, Lcom/heitao/platform/activity/HTPPayButton;

    .line 253
    .restart local v7    # "mo9PayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_yeepay_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v17

    .end local v17    # "yeepayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v17, Lcom/heitao/platform/activity/HTPPayButton;

    .line 254
    .restart local v17    # "yeepayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_weixinpay_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v15

    .end local v15    # "weixinPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v15, Lcom/heitao/platform/activity/HTPPayButton;

    .line 255
    .restart local v15    # "weixinPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_heitao_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .end local v5    # "heitaoPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v5, Lcom/heitao/platform/activity/HTPPayButton;

    .line 256
    .restart local v5    # "heitaoPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_smc_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    .end local v12    # "smcPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v12, Lcom/heitao/platform/activity/HTPPayButton;

    .line 257
    .restart local v12    # "smcPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_wft_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    .end local v16    # "wftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v16, Lcom/heitao/platform/activity/HTPPayButton;

    .line 258
    .restart local v16    # "wftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_wapsft_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v14

    .end local v14    # "wapsftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v14, Lcom/heitao/platform/activity/HTPPayButton;

    .line 260
    .restart local v14    # "wapsftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "btn_pay_next_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/Button;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/HTPPayActivity;->nextButton:Landroid/widget/Button;

    .line 286
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 289
    const-string v18, "product_name"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/heitao/platform/model/HTPPayInfo;->name:Ljava/lang/String;

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 290
    const-string v18, "product_description"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/heitao/platform/model/HTPPayInfo;->description:Ljava/lang/String;

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    const-string v18, "pay_amount"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/heitao/platform/model/HTPPayInfo;->amount:Ljava/lang/String;

    move-object/from16 v21, v0

    aput-object v21, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 295
    const-string v18, "htp_pay_alipay_icon"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v3, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setImageResource(I)V

    .line 296
    const-string v18, "alipay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setText(Ljava/lang/String;)V

    .line 297
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    const/16 v18, 0x0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v18

    if-nez v18, :cond_3

    const/16 v18, 0x8

    :goto_2
    move/from16 v0, v18

    invoke-virtual {v3, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setVisibility(I)V

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    const-string v18, "htp_pay_unionpay_icon"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v13, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setImageResource(I)V

    .line 302
    const-string v18, "unipay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setText(Ljava/lang/String;)V

    .line 303
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 304
    const/16 v18, 0x1

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v18

    if-nez v18, :cond_4

    const/16 v18, 0x8

    :goto_3
    move/from16 v0, v18

    invoke-virtual {v13, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setVisibility(I)V

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    const-string v18, "htp_pay_mo9_icon"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setImageResource(I)V

    .line 308
    const-string v18, "pay_after_playing"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setText(Ljava/lang/String;)V

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    const/16 v18, 0x2

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v18

    if-nez v18, :cond_5

    const/16 v18, 0x8

    :goto_4
    move/from16 v0, v18

    invoke-virtual {v7, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setVisibility(I)V

    .line 311
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 313
    const-string v18, "htp_pay_yeepay_icon"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Lcom/heitao/platform/activity/HTPPayButton;->setImageResource(I)V

    .line 314
    const-string v18, "yeepay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcom/heitao/platform/activity/HTPPayButton;->setText(Ljava/lang/String;)V

    .line 315
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/heitao/platform/activity/HTPPayButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 316
    const/16 v18, 0x3

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v18

    if-nez v18, :cond_6

    const/16 v18, 0x8

    :goto_5
    invoke-virtual/range {v17 .. v18}, Lcom/heitao/platform/activity/HTPPayButton;->setVisibility(I)V

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    const-string v18, "htp_pay_weixin_icon"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setImageResource(I)V

    .line 320
    const-string v18, "wxpay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setText(Ljava/lang/String;)V

    .line 321
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 322
    const/16 v18, 0x4

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v18

    if-nez v18, :cond_7

    const/16 v18, 0x8

    :goto_6
    move/from16 v0, v18

    invoke-virtual {v15, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setVisibility(I)V

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 326
    const-string v18, "htp_pay_heitao_icon"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v5, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setImageResource(I)V

    .line 327
    const-string v18, "htpay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setText(Ljava/lang/String;)V

    .line 328
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 329
    const/16 v18, 0x5

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v18

    if-nez v18, :cond_8

    const/16 v18, 0x8

    :goto_7
    move/from16 v0, v18

    invoke-virtual {v5, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setVisibility(I)V

    .line 331
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 333
    const-string v18, "htp_pay_unionpay_icon"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setImageResource(I)V

    .line 334
    const-string v18, "unipay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setText(Ljava/lang/String;)V

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 336
    const/16 v18, 0x6

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v18

    if-nez v18, :cond_9

    const/16 v18, 0x8

    :goto_8
    move/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setVisibility(I)V

    .line 337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    const-string v18, "htp_pay_weixin_icon"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayButton;->setImageResource(I)V

    .line 340
    const-string v18, "wxpay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayButton;->setText(Ljava/lang/String;)V

    .line 341
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 342
    const/16 v18, 0x7

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v18

    if-nez v18, :cond_a

    const/16 v18, 0x8

    :goto_9
    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayButton;->setVisibility(I)V

    .line 344
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    const-string v18, "htp_pay_weixin_icon"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v14, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setImageResource(I)V

    .line 347
    const-string v18, "wxpay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setText(Ljava/lang/String;)V

    .line 348
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 349
    const/16 v18, 0x8

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v18

    if-nez v18, :cond_b

    const/16 v18, 0x8

    :goto_a
    move/from16 v0, v18

    invoke-virtual {v14, v0}, Lcom/heitao/platform/activity/HTPPayButton;->setVisibility(I)V

    .line 350
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    const-string v18, "htppbtn_alipay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    const-string v19, "htppbtn_alipay_portrait"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/activity/HTPPayActivity;->setSelected(II)V

    .line 354
    sget-object v18, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->alipay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/HTPPayActivity;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 357
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->nextButton:Landroid/widget/Button;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0

    .line 264
    :cond_2
    const-string v18, "htp_activity_pay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->setContentView(I)V

    .line 266
    const-string v18, "btn_pay_left"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6    # "leftButton":Landroid/widget/Button;
    check-cast v6, Landroid/widget/Button;

    .line 267
    .restart local v6    # "leftButton":Landroid/widget/Button;
    const-string v18, "btn_pay_right"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    .end local v11    # "rightButton":Landroid/widget/Button;
    check-cast v11, Landroid/widget/Button;

    .line 269
    .restart local v11    # "rightButton":Landroid/widget/Button;
    const-string v18, "txt_product_name"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    .end local v10    # "productNameTextView":Landroid/widget/TextView;
    check-cast v10, Landroid/widget/TextView;

    .line 270
    .restart local v10    # "productNameTextView":Landroid/widget/TextView;
    const-string v18, "txt_product_description"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    .end local v9    # "productDescriptionTextView":Landroid/widget/TextView;
    check-cast v9, Landroid/widget/TextView;

    .line 271
    .restart local v9    # "productDescriptionTextView":Landroid/widget/TextView;
    const-string v18, "txt_product_amount"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .end local v8    # "productAmountTextView":Landroid/widget/TextView;
    check-cast v8, Landroid/widget/TextView;

    .line 273
    .restart local v8    # "productAmountTextView":Landroid/widget/TextView;
    const-string v18, "htppbtn_alipay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .end local v3    # "alipayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v3, Lcom/heitao/platform/activity/HTPPayButton;

    .line 274
    .restart local v3    # "alipayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_unionpay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    .end local v13    # "unionPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v13, Lcom/heitao/platform/activity/HTPPayButton;

    .line 275
    .restart local v13    # "unionPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_mo9"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    .end local v7    # "mo9PayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v7, Lcom/heitao/platform/activity/HTPPayButton;

    .line 276
    .restart local v7    # "mo9PayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_yeepay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v17

    .end local v17    # "yeepayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v17, Lcom/heitao/platform/activity/HTPPayButton;

    .line 277
    .restart local v17    # "yeepayPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_weixinpay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v15

    .end local v15    # "weixinPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v15, Lcom/heitao/platform/activity/HTPPayButton;

    .line 278
    .restart local v15    # "weixinPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_heitao"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .end local v5    # "heitaoPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v5, Lcom/heitao/platform/activity/HTPPayButton;

    .line 279
    .restart local v5    # "heitaoPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_smc"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    .end local v12    # "smcPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v12, Lcom/heitao/platform/activity/HTPPayButton;

    .line 280
    .restart local v12    # "smcPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_wft"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    .end local v16    # "wftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v16, Lcom/heitao/platform/activity/HTPPayButton;

    .line 281
    .restart local v16    # "wftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "htppbtn_wapsft"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v14

    .end local v14    # "wapsftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    check-cast v14, Lcom/heitao/platform/activity/HTPPayButton;

    .line 283
    .restart local v14    # "wapsftPayButton":Lcom/heitao/platform/activity/HTPPayButton;
    const-string v18, "btn_pay_next"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/heitao/platform/activity/HTPPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/Button;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/HTPPayActivity;->nextButton:Landroid/widget/Button;

    goto/16 :goto_1

    .line 298
    :cond_3
    const/16 v18, 0x0

    goto/16 :goto_2

    .line 304
    :cond_4
    const/16 v18, 0x0

    goto/16 :goto_3

    .line 310
    :cond_5
    const/16 v18, 0x0

    goto/16 :goto_4

    .line 316
    :cond_6
    const/16 v18, 0x0

    goto/16 :goto_5

    .line 322
    :cond_7
    const/16 v18, 0x0

    goto/16 :goto_6

    .line 329
    :cond_8
    const/16 v18, 0x0

    goto/16 :goto_7

    .line 336
    :cond_9
    const/16 v18, 0x0

    goto/16 :goto_8

    .line 342
    :cond_a
    const/16 v18, 0x0

    goto/16 :goto_9

    .line 349
    :cond_b
    const/16 v18, 0x0

    goto/16 :goto_a
.end method

.method private isValidPayChannel(Ljava/lang/Integer;)Z
    .locals 9
    .param p1, "customId"    # Ljava/lang/Integer;

    .prologue
    const/4 v8, 0x5

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v1, 0x1

    .line 387
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-gtz v2, :cond_1

    .line 432
    :cond_0
    :goto_0
    return v1

    .line 392
    :cond_1
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_3

    .line 432
    const/4 v1, 0x0

    goto :goto_0

    .line 392
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 394
    .local v0, "support":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v1, :cond_4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v8, :cond_0

    .line 398
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v5, :cond_5

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eqz v3, :cond_0

    .line 402
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v6, :cond_6

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v1, :cond_0

    .line 406
    :cond_6
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v7, :cond_7

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v8, :cond_7

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x6

    if-ne v3, v4, :cond_8

    :cond_7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v6, :cond_0

    .line 410
    :cond_8
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x7

    if-ne v3, v4, :cond_9

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v7, :cond_0

    .line 414
    :cond_9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_a

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v3, v5, :cond_0

    .line 418
    :cond_a
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0xf

    if-ne v3, v4, :cond_b

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x6

    if-eq v3, v4, :cond_0

    .line 422
    :cond_b
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x10

    if-ne v3, v4, :cond_c

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x7

    if-eq v3, v4, :cond_0

    .line 426
    :cond_c
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x11

    if-ne v3, v4, :cond_2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_2

    goto/16 :goto_0
.end method

.method private setSelected(II)V
    .locals 3
    .param p1, "id1"    # I
    .param p2, "id2"    # I

    .prologue
    .line 367
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mButtonList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 378
    return-void

    .line 367
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/activity/HTPPayButton;

    .line 369
    .local v0, "button":Lcom/heitao/platform/activity/HTPPayButton;
    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPayButton;->getId()I

    move-result v2

    if-eq v2, p1, :cond_1

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPayButton;->getId()I

    move-result v2

    if-ne v2, p2, :cond_2

    .line 371
    :cond_1
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/heitao/platform/activity/HTPPayButton;->setSelected(Z)V

    goto :goto_0

    .line 375
    :cond_2
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/heitao/platform/activity/HTPPayButton;->setSelected(Z)V

    goto :goto_0
.end method

.method private showExitPayDialog()V
    .locals 3

    .prologue
    .line 171
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 172
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    const-string v2, "tip"

    invoke-static {p0, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 173
    const-string v2, "if_confirm_pay"

    invoke-static {p0, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 175
    new-instance v1, Lcom/heitao/platform/activity/HTPPayActivity$5;

    invoke-direct {v1, p0}, Lcom/heitao/platform/activity/HTPPayActivity$5;-><init>(Lcom/heitao/platform/activity/HTPPayActivity;)V

    .line 197
    .local v1, "listener":Landroid/content/DialogInterface$OnClickListener;
    const-string v2, "OK"

    invoke-static {p0, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 198
    const-string v2, "Cancel"

    invoke-static {p0, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 199
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 200
    return-void
.end method

.method private showPopupWindow()V
    .locals 22

    .prologue
    .line 679
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    if-eqz v18, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v18

    if-eqz v18, :cond_0

    .line 681
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/PopupWindow;->dismiss()V

    .line 682
    const/16 v18, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    .line 685
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/heitao/platform/activity/HTPPayActivity;->getWindow()Landroid/view/Window;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v14

    .line 686
    .local v14, "layoutParams":Landroid/view/WindowManager$LayoutParams;
    const/high16 v18, 0x3f000000    # 0.5f

    move/from16 v0, v18

    iput v0, v14, Landroid/view/WindowManager$LayoutParams;->alpha:F

    .line 688
    invoke-static/range {p0 .. p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v13

    .line 690
    .local v13, "inflater":Landroid/view/LayoutInflater;
    const-string v18, "htp_pay_view_yeepay"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    const/16 v19, 0x0

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v13, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v17

    .line 692
    .local v17, "view":Landroid/view/View;
    new-instance v18, Landroid/widget/PopupWindow;

    const/16 v19, -0x2

    const/16 v20, -0x2

    const/16 v21, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move/from16 v2, v19

    move/from16 v3, v20

    move/from16 v4, v21

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    .line 694
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    new-instance v19, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual/range {v18 .. v19}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 696
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 698
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 699
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    const/16 v19, 0x11

    const/16 v20, 0x11

    const/16 v21, 0x11

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move/from16 v2, v19

    move/from16 v3, v20

    move/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 700
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    new-instance v19, Lcom/heitao/platform/activity/HTPPayActivity$6;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v14}, Lcom/heitao/platform/activity/HTPPayActivity$6;-><init>(Lcom/heitao/platform/activity/HTPPayActivity;Landroid/view/WindowManager$LayoutParams;)V

    invoke-virtual/range {v18 .. v19}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 710
    invoke-virtual/range {p0 .. p0}, Lcom/heitao/platform/activity/HTPPayActivity;->getWindow()Landroid/view/Window;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 711
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    const-string v19, "PopupAnimation"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getStyleByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 712
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/PopupWindow;->update()V

    .line 714
    const-string v18, "btn_yeepay_CHL"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 715
    .local v6, "CHLButton":Landroid/widget/Button;
    const-string v18, "btn_yeepay_CHU"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/Button;

    .line 716
    .local v7, "CHUButton":Landroid/widget/Button;
    const-string v18, "btn_yeepay_CHA"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    .line 718
    .local v5, "CHAButton":Landroid/widget/Button;
    const-string v18, "txt_card_no"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/EditText;

    .line 719
    .local v10, "cardNoEditText":Landroid/widget/EditText;
    const-string v18, "txt_card_pwd"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/EditText;

    .line 720
    .local v11, "cardPWDEditText":Landroid/widget/EditText;
    const-string v18, "btn_card_money"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/Button;

    .line 721
    .local v9, "cardMonryButton":Landroid/widget/Button;
    new-instance v18, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/HTPPayActivity;->mCardValue:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 724
    new-instance v18, Lcom/heitao/platform/activity/HTPPayActivity$7;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v9}, Lcom/heitao/platform/activity/HTPPayActivity$7;-><init>(Lcom/heitao/platform/activity/HTPPayActivity;Landroid/widget/Button;)V

    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 765
    new-instance v12, Lcom/heitao/platform/activity/HTPPayActivity$8;

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v6, v7, v5}, Lcom/heitao/platform/activity/HTPPayActivity$8;-><init>(Lcom/heitao/platform/activity/HTPPayActivity;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 801
    .local v12, "channelOnClickListener":Landroid/view/View$OnClickListener;
    invoke-virtual {v6, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 802
    invoke-virtual {v7, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 803
    invoke-virtual {v5, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 806
    const-string v18, "htp_pay_yeepay_chl_selected"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 807
    const-string v18, "htp_pay_yeepay_chu"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v7, v0}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 808
    const-string v18, "htp_pay_yeepay_cha"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 809
    sget-object v18, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHL:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/HTPPayActivity;->mYeepayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    .line 811
    new-instance v15, Lcom/heitao/platform/activity/HTPPayActivity$9;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v10, v11}, Lcom/heitao/platform/activity/HTPPayActivity$9;-><init>(Lcom/heitao/platform/activity/HTPPayActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V

    .line 845
    .local v15, "okAndCancelOnClickListener":Landroid/view/View$OnClickListener;
    const-string v18, "btn_yeepay_ok"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/Button;

    .line 846
    .local v16, "okButton":Landroid/widget/Button;
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 848
    const-string v18, "btn_yeepay_cancel"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/Button;

    .line 849
    .local v8, "cancelButton":Landroid/widget/Button;
    invoke-virtual {v8, v15}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 850
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 151
    invoke-super {p0, p1, p2, p3}, Lcom/heitao/platform/activity/HTPBaseActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 153
    invoke-static {}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->getInstance()Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayChannel:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->onActivityResult(Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;IILandroid/content/Intent;)V

    .line 154
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 61
    invoke-super {p0, p1}, Lcom/heitao/platform/activity/HTPBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v9

    iget-object v9, v9, Lcom/heitao/platform/common/HTPDataCenter;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    iput-object v9, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 64
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v9

    iget-object v9, v9, Lcom/heitao/platform/common/HTPDataCenter;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    iput-object v9, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    .line 68
    :try_start_0
    iget-object v9, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    if-eqz v9, :cond_0

    .line 70
    iget-object v9, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 71
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    .line 74
    :cond_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    .line 76
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPPayActivity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    const-string v10, "data"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v3, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 77
    .local v3, "object":Lorg/json/JSONObject;
    const-string v9, "pay_ch_config"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 78
    .local v5, "support":Ljava/lang/String;
    const-string v9, ","

    invoke-virtual {v5, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 79
    .local v6, "supports":[Ljava/lang/String;
    array-length v10, v6

    move v9, v8

    :goto_0
    if-lt v9, v10, :cond_2

    .line 84
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "mSupportList="

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 86
    const-string v9, "priority_use_aliay"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    if-ne v9, v7, :cond_3

    :goto_1
    iput-boolean v7, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPriorityUseAliay:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    .end local v3    # "object":Lorg/json/JSONObject;
    .end local v5    # "support":Ljava/lang/String;
    .end local v6    # "supports":[Ljava/lang/String;
    :goto_2
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPayActivity;->initPayView()V

    .line 97
    iget-boolean v7, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mPriorityUseAliay:Z

    if-eqz v7, :cond_1

    const/4 v7, 0x2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/heitao/platform/activity/HTPPayActivity;->isValidPayChannel(Ljava/lang/Integer;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 99
    const-string v7, "mPriorityUseAliay"

    invoke-static {v7}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 100
    new-instance v0, Lcom/heitao/platform/activity/HTPPayActivity$4;

    invoke-direct {v0, p0}, Lcom/heitao/platform/activity/HTPPayActivity$4;-><init>(Lcom/heitao/platform/activity/HTPPayActivity;)V

    .line 117
    .local v0, "checkRunnable":Ljava/lang/Runnable;
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 118
    .local v1, "checkThread":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 120
    .end local v0    # "checkRunnable":Ljava/lang/Runnable;
    .end local v1    # "checkThread":Ljava/lang/Thread;
    :cond_1
    return-void

    .line 79
    .restart local v3    # "object":Lorg/json/JSONObject;
    .restart local v5    # "support":Ljava/lang/String;
    .restart local v6    # "supports":[Ljava/lang/String;
    :cond_2
    :try_start_1
    aget-object v4, v6, v9

    .line 81
    .local v4, "string":Ljava/lang/String;
    iget-object v11, p0, Lcom/heitao/platform/activity/HTPPayActivity;->mSupportList:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 79
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .end local v4    # "string":Ljava/lang/String;
    :cond_3
    move v7, v8

    .line 86
    goto :goto_1

    .line 88
    .end local v3    # "object":Lorg/json/JSONObject;
    .end local v5    # "support":Ljava/lang/String;
    .end local v6    # "supports":[Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 91
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 126
    invoke-super {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;->onDestroy()V

    .line 127
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 139
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 141
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPayActivity;->showExitPayDialog()V

    .line 144
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 133
    invoke-super {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;->onResume()V

    .line 134
    return-void
.end method
