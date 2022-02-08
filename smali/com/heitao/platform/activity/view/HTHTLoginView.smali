.class public Lcom/heitao/platform/activity/view/HTHTLoginView;
.super Ljava/lang/Object;
.source "HTHTLoginView.java"


# instance fields
.field public final ENTER_GAME:I

.field public final ENTER_HT_BIND_PHONE_VIEW:I

.field public final ENTER_HT_FORGET_VIEW:I

.field public final ENTER_HT_POHONE_LOGIN_VIEW:I

.field public final ENTER_HT_REGISTER_COMPLETE_VIEW:I

.field public final ENTER_HT_REGISTER_VIEW:I

.field public final HT_FORGET_PHONE_VIEW_BACK_FROM_HT_PHONE_REGISTER_COMPLETE_VIEW:I

.field public final HT_FORGET_PHONE_VIEW_BACK_FROM_HT_PHONE_REGISTER_VIEW:I

.field public final HT_FORGET_PHONE_VIEW_BACK_FROM_HT_PHONE_VERFY_VIEW:I

.field public final HT_FORGET_VIEW_BACK_FROM_HT_PHONE_VIEW:I

.field public final HT_LOGIN_VIEW_BACK_FROM_HT_FORGET_VIEW:I

.field public final HT_LOGIN_VIEW_BACK_FROM_HT_REGISTER_VIEW:I

.field public final SHOW_PRIVACY_STATEMENTE:I

.field private activityHandler:Landroid/os/Handler;

.field private baseView:Landroid/view/View;

.field private container:Landroid/widget/LinearLayout;

.field private context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

.field private flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

.field private htBindPhoneView:Landroid/view/View;

.field private htForgetView:Landroid/view/View;

.field private htLoginView:Landroid/view/View;

.field private htPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

.field private htRegisterCompleteView:Landroid/view/View;

.field private htRegisterView:Landroid/view/View;

.field private isAgree:Z

.field private isSaved:Z

.field private mFlipper:Landroid/widget/ViewFlipper;

.field private mPassWord:Ljava/lang/String;

.field private mUserName:Ljava/lang/String;

.field private ownHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
    .locals 2
    .param p1, "context"    # Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    const/4 v1, 0x1

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ENTER_HT_REGISTER_COMPLETE_VIEW:I

    .line 51
    const/4 v0, 0x2

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ENTER_HT_BIND_PHONE_VIEW:I

    .line 53
    const/4 v0, 0x3

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ENTER_HT_REGISTER_VIEW:I

    .line 54
    const/4 v0, 0x4

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ENTER_HT_FORGET_VIEW:I

    .line 55
    const/4 v0, 0x5

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ENTER_HT_POHONE_LOGIN_VIEW:I

    .line 56
    const/4 v0, 0x6

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ENTER_GAME:I

    .line 58
    const/4 v0, 0x7

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->HT_LOGIN_VIEW_BACK_FROM_HT_REGISTER_VIEW:I

    .line 59
    const/16 v0, 0x8

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->HT_LOGIN_VIEW_BACK_FROM_HT_FORGET_VIEW:I

    .line 62
    const/16 v0, 0x9

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->HT_FORGET_VIEW_BACK_FROM_HT_PHONE_VIEW:I

    .line 63
    const/16 v0, 0xa

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->HT_FORGET_PHONE_VIEW_BACK_FROM_HT_PHONE_REGISTER_VIEW:I

    .line 64
    const/16 v0, 0xb

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->HT_FORGET_PHONE_VIEW_BACK_FROM_HT_PHONE_VERFY_VIEW:I

    .line 65
    const/16 v0, 0xc

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->HT_FORGET_PHONE_VIEW_BACK_FROM_HT_PHONE_REGISTER_COMPLETE_VIEW:I

    .line 67
    const/16 v0, 0xd

    iput v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->SHOW_PRIVACY_STATEMENTE:I

    .line 89
    iput-boolean v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->isSaved:Z

    .line 90
    iput-boolean v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->isAgree:Z

    .line 92
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 93
    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->activityHandler:Landroid/os/Handler;

    .line 94
    new-instance v0, Lcom/heitao/platform/activity/view/HTHTLoginView$1;

    invoke-direct {v0, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$1;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ownHandler:Landroid/os/Handler;

    .line 206
    new-instance v0, Lcom/heitao/platform/activity/view/HTHTLoginView$2;

    invoke-direct {v0, p0, p1, p1}, Lcom/heitao/platform/activity/view/HTHTLoginView$2;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/content/Context;Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    .line 222
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTHTLoginView;)V
    .locals 0

    .prologue
    .line 316
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->buildRegisterView()V

    return-void
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/view/HTPhoneLoginView2;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    return-object v0
.end method

.method static synthetic access$10(Lcom/heitao/platform/activity/view/HTHTLoginView;)V
    .locals 0

    .prologue
    .line 498
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->buildPhoneLoginView()V

    return-void
.end method

.method static synthetic access$11(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->activityHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$12(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ownHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$13(Lcom/heitao/platform/activity/view/HTHTLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    return-object v0
.end method

.method static synthetic access$14(Lcom/heitao/platform/activity/view/HTHTLoginView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 589
    invoke-direct {p0, p1, p2}, Lcom/heitao/platform/activity/view/HTHTLoginView;->doLoginGame(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$15(Lcom/heitao/platform/activity/view/HTHTLoginView;Z)V
    .locals 0

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->isAgree:Z

    return-void
.end method

.method static synthetic access$16(Lcom/heitao/platform/activity/view/HTHTLoginView;)Z
    .locals 1

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->isAgree:Z

    return v0
.end method

.method static synthetic access$17(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 653
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTHTLoginView;->checkRegisterInputPrams(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$18(Lcom/heitao/platform/activity/view/HTHTLoginView;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mUserName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$19(Lcom/heitao/platform/activity/view/HTHTLoginView;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mPassWord:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    return-object v0
.end method

.method static synthetic access$20(Lcom/heitao/platform/activity/view/HTHTLoginView;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 506
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTHTLoginView;->getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    return-void
.end method

.method static synthetic access$21(Lcom/heitao/platform/activity/view/HTHTLoginView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 543
    invoke-direct {p0, p1, p2}, Lcom/heitao/platform/activity/view/HTHTLoginView;->doBindPhone(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$22(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$23(Lcom/heitao/platform/activity/view/HTHTLoginView;Z)V
    .locals 0

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->isSaved:Z

    return-void
.end method

.method static synthetic access$24(Lcom/heitao/platform/activity/view/HTHTLoginView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 87
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mUserName:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$25(Lcom/heitao/platform/activity/view/HTHTLoginView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 88
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mPassWord:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htForgetView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/view/HTHTLoginView;)V
    .locals 0

    .prologue
    .line 373
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->buildRegisterCompleteView()V

    return-void
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterCompleteView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/view/HTHTLoginView;)V
    .locals 0

    .prologue
    .line 408
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->buildBindePhoneView()V

    return-void
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htBindPhoneView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$9(Lcom/heitao/platform/activity/view/HTHTLoginView;)V
    .locals 0

    .prologue
    .line 460
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->buildForgetView()V

    return-void
.end method

.method private buildBindePhoneView()V
    .locals 10

    .prologue
    .line 409
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htBindPhoneView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 410
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_bind_phone_view"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htBindPhoneView:Landroid/view/View;

    .line 412
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htBindPhoneView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_bind_phone_back"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 413
    .local v7, "BindPhoneBack":Landroid/widget/ImageView;
    new-instance v2, Lcom/heitao/platform/activity/view/HTHTLoginView$14;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$14;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v7, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 440
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htBindPhoneView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_binde_phone_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    .line 441
    .local v8, "phoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htBindPhoneView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_binde_verfy_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 443
    .local v9, "verfyET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htBindPhoneView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_bind_get_verfy_code"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 444
    .local v1, "verfy_tv":Landroid/widget/TextView;
    new-instance v0, Lcom/heitao/platform/activity/view/MyCountDownBt;

    const-wide/32 v2, 0xea60

    const-wide/16 v4, 0x3e8

    invoke-direct/range {v0 .. v5}, Lcom/heitao/platform/activity/view/MyCountDownBt;-><init>(Landroid/widget/TextView;JJ)V

    .line 445
    .local v0, "countDownBt":Lcom/heitao/platform/activity/view/MyCountDownBt;
    new-instance v2, Lcom/heitao/platform/activity/view/HTHTLoginView$15;

    invoke-direct {v2, p0, v8, v0}, Lcom/heitao/platform/activity/view/HTHTLoginView$15;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 452
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htBindPhoneView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "ht_bind_phone_btn"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 453
    .local v6, "BindPhoneBT":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/view/HTHTLoginView$16;

    invoke-direct {v2, p0, v8, v9}, Lcom/heitao/platform/activity/view/HTHTLoginView$16;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 459
    return-void
.end method

.method private buildForgetView()V
    .locals 6

    .prologue
    .line 461
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htForgetView:Landroid/view/View;

    if-nez v3, :cond_0

    .line 462
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v3}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_platform_forgetpw_view"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htForgetView:Landroid/view/View;

    .line 465
    :cond_0
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htForgetView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "ht_forget_back"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 466
    .local v0, "HtForgetBack":Landroid/widget/ImageView;
    new-instance v3, Lcom/heitao/platform/activity/view/HTHTLoginView$17;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$17;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 473
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htForgetView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "ht_goto_phone_login"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 474
    .local v1, "goToPhoneLogin":Landroid/widget/Button;
    new-instance v3, Lcom/heitao/platform/activity/view/HTHTLoginView$18;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$18;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 482
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htForgetView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "ht_know_bt"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 483
    .local v2, "knowBT":Landroid/widget/Button;
    new-instance v3, Lcom/heitao/platform/activity/view/HTHTLoginView$19;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$19;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 497
    return-void
.end method

.method private buildPhoneLoginView()V
    .locals 3

    .prologue
    .line 499
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    if-nez v0, :cond_0

    .line 500
    new-instance v0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ownHandler:Landroid/os/Handler;

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    .line 502
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getFrameBound()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_1

    .line 503
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->createView()V

    .line 505
    :cond_1
    return-void
.end method

.method private buildRegisterCompleteView()V
    .locals 8

    .prologue
    .line 374
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterCompleteView:Landroid/view/View;

    if-nez v5, :cond_0

    .line 375
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v5}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_customer_register_enter_view"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterCompleteView:Landroid/view/View;

    .line 377
    :cond_0
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_uname_tv"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 378
    .local v3, "uName":Landroid/widget/TextView;
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_upw_tv"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 380
    .local v4, "uPwd":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_account"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mUserName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 381
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_pwd"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mPassWord:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 383
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "ht_save_photo_tv"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 384
    .local v2, "savePhoto":Landroid/widget/TextView;
    iget-boolean v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->isSaved:Z

    if-nez v5, :cond_1

    .line 385
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_save_false"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 386
    const/high16 v5, -0x10000

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 392
    :goto_0
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "customer_bind_phone"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 393
    .local v0, "bindPhone":Landroid/widget/Button;
    new-instance v5, Lcom/heitao/platform/activity/view/HTHTLoginView$12;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$12;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 400
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "customer_login_enter"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 401
    .local v1, "enter":Landroid/widget/Button;
    new-instance v5, Lcom/heitao/platform/activity/view/HTHTLoginView$13;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$13;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 407
    return-void

    .line 388
    .end local v0    # "bindPhone":Landroid/widget/Button;
    .end local v1    # "enter":Landroid/widget/Button;
    :cond_1
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_save_photo"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 389
    const-string v5, "#888888"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0
.end method

.method private buildRegisterView()V
    .locals 10

    .prologue
    .line 317
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    if-nez v7, :cond_0

    .line 318
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v7}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v7

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "htp_platform_register_view"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    iput-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    .line 320
    :cond_0
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_register_account_et"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    .line 322
    .local v6, "userName":Landroid/widget/EditText;
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_register_password_et"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 324
    .local v3, "loginPassworded":Landroid/widget/EditText;
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_register_back"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 325
    .local v1, "HtRegisterBack":Landroid/widget/ImageView;
    new-instance v7, Lcom/heitao/platform/activity/view/HTHTLoginView$8;

    invoke-direct {v7, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$8;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 331
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "htp_checkBox"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 332
    .local v2, "checkBox":Landroid/widget/CheckBox;
    new-instance v7, Lcom/heitao/platform/activity/view/HTHTLoginView$9;

    invoke-direct {v7, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$9;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v2, v7}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 343
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_register_btn"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 344
    .local v0, "HtRegister":Landroid/widget/Button;
    new-instance v7, Lcom/heitao/platform/activity/view/HTHTLoginView$10;

    invoke-direct {v7, p0, v3, v6}, Lcom/heitao/platform/activity/view/HTHTLoginView$10;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 358
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "htp_statement_tv"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 359
    .local v5, "statementTV":Landroid/widget/TextView;
    new-instance v7, Lcom/heitao/platform/activity/view/HTHTLoginView$11;

    invoke-direct {v7, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$11;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 365
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htRegisterView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "htp_policy_linear"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    .line 366
    .local v4, "policy":Landroid/widget/LinearLayout;
    sget-object v7, Lcom/heitao/platform/common/HTPConsts;->POLICY_URL:Ljava/lang/String;

    invoke-static {v7}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 367
    const/4 v7, 0x4

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 371
    :goto_0
    return-void

    .line 369
    :cond_1
    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method private checkRegisterInputPrams(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;)V
    .locals 6
    .param p1, "emailAutoCompletatv"    # Landroid/widget/EditText;
    .param p2, "loginPassworded"    # Landroid/widget/EditText;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 655
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 656
    .local v3, "userName":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 658
    .local v1, "password":Ljava/lang/String;
    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 660
    const-string v4, "htp_account_cannot_null"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 745
    :goto_0
    return-void

    .line 664
    :cond_0
    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 666
    const-string v4, "htp_pwd_cannot_null"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 670
    :cond_1
    const-string v4, "^[a-z|A-Z]{1}.{0,}$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 672
    const-string v4, "htp_account_start_with_letter"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 676
    :cond_2
    const-string v4, "^[a-z|A-Z|0-9|_|.|-]{1,}$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 678
    const-string v4, "htp_account_letter_with_number"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 682
    :cond_3
    const-string v4, "^.{4,16}$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 684
    const-string v4, "htp_account_length"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 688
    :cond_4
    const-string v4, "^.{6,16}$"

    invoke-virtual {v1, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 690
    const-string v4, "htp_pwd_length"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 694
    :cond_5
    const-string v4, "htp_is_registering"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 697
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 698
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "username"

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 699
    const-string v4, "password"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    const-string v2, "http://api.heitao.com/user/reg"

    .line 702
    .local v2, "url":Ljava/lang/String;
    new-instance v4, Lcom/heitao/platform/request/HTPRegisterParser;

    invoke-direct {v4}, Lcom/heitao/platform/request/HTPRegisterParser;-><init>()V

    new-instance v5, Lcom/heitao/platform/activity/view/HTHTLoginView$23;

    invoke-direct {v5, p0, p3, v3, v1}, Lcom/heitao/platform/activity/view/HTHTLoginView$23;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v2, v0, v5}, Lcom/heitao/platform/request/HTPRegisterParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private doBindPhone(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "verfyCode"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 544
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 545
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_please_input_phone"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 588
    :goto_0
    return-void

    .line 549
    :cond_0
    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 550
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_please_input_verfy_code"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 553
    :cond_1
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_get_ing"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 554
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 556
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "mobile"

    invoke-interface {v0, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    const-string v3, "vercode"

    invoke-interface {v0, v3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    const-string v3, "uid"

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v4

    iget-object v4, v4, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v4, v4, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    const-string v3, "username"

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v4

    iget-object v4, v4, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v4, v4, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 560
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v4

    iget-object v4, v4, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v4, v4, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_bind_key"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 561
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_bind_key"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 560
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 562
    .local v1, "str":Ljava/lang/String;
    const-string v3, "sign"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    const-string v2, "http://api.heitao.com/user/mobileBind"

    .line 565
    .local v2, "url":Ljava/lang/String;
    new-instance v3, Lcom/heitao/platform/request/HTPLoginParser;

    invoke-direct {v3}, Lcom/heitao/platform/request/HTPLoginParser;-><init>()V

    new-instance v4, Lcom/heitao/platform/activity/view/HTHTLoginView$21;

    invoke-direct {v4, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$21;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v3, v2, v0, v4}, Lcom/heitao/platform/request/HTPLoginParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto/16 :goto_0
.end method

.method private doLoginGame(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "passWord"    # Ljava/lang/String;

    .prologue
    .line 592
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 593
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v3, "htp_account_cannot_null"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 652
    :goto_0
    return-void

    .line 597
    :cond_0
    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 598
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v3, "htp_pwd_cannot_null"

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 602
    :cond_1
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_is_logining"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 604
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 605
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "username"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 606
    const-string v2, "password"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 608
    const-string v1, "http://api.heitao.com/user/login"

    .line 609
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPLoginParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPLoginParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTHTLoginView$22;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$22;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPLoginParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 5
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "countDownBt"    # Lcom/heitao/platform/activity/view/MyCountDownBt;

    .prologue
    .line 507
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 508
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_phone"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 542
    :goto_0
    return-void

    .line 513
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_get_ing"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 514
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 516
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "mobile"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    const-string v2, "type"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    const-string v1, "http://api.heitao.com/user/sendSms"

    .line 520
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTHTLoginView$20;

    invoke-direct {v3, p0, p3}, Lcom/heitao/platform/activity/view/HTHTLoginView$20;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method


# virtual methods
.method public buildHtLoginView()V
    .locals 10

    .prologue
    .line 257
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    if-nez v7, :cond_0

    .line 258
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v7}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v7

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "htp_platform_login_view"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    iput-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    .line 261
    :cond_0
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_login_account_et"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    .line 263
    .local v6, "userNameEt":Landroid/widget/EditText;
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_login_password_et"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 265
    .local v5, "loginPasswordedEt":Landroid/widget/EditText;
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_login_back"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 266
    .local v2, "HTLoginBackIcon":Landroid/widget/ImageView;
    new-instance v7, Lcom/heitao/platform/activity/view/HTHTLoginView$3;

    invoke-direct {v7, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$3;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 278
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_platform_register_btn"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 279
    .local v3, "HTRegisterBt":Landroid/widget/Button;
    new-instance v7, Lcom/heitao/platform/activity/view/HTHTLoginView$4;

    invoke-direct {v7, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$4;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_platform_forget_account_bt"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 287
    .local v0, "HTForgetAccountBt":Landroid/widget/TextView;
    new-instance v7, Lcom/heitao/platform/activity/view/HTHTLoginView$5;

    invoke-direct {v7, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$5;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 294
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_platform_forget_pw_bt"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 295
    .local v1, "HTForgetPWBt":Landroid/widget/TextView;
    new-instance v7, Lcom/heitao/platform/activity/view/HTHTLoginView$6;

    invoke-direct {v7, p0}, Lcom/heitao/platform/activity/view/HTHTLoginView$6;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 302
    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v9, "ht_platform_login_btn"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 303
    .local v4, "htLoginBt":Landroid/widget/TextView;
    new-instance v7, Lcom/heitao/platform/activity/view/HTHTLoginView$7;

    invoke-direct {v7, p0, v5, v6}, Lcom/heitao/platform/activity/view/HTHTLoginView$7;-><init>(Lcom/heitao/platform/activity/view/HTHTLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 314
    return-void
.end method

.method public createView()V
    .locals 4

    .prologue
    const/4 v3, -0x2

    .line 234
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->baseView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v2, "htp_base_login_view"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->baseView:Landroid/view/View;

    .line 237
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->baseView:Landroid/view/View;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v2, "base_login_view_container"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->container:Landroid/widget/LinearLayout;

    .line 238
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 239
    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 238
    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 240
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 241
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 242
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 243
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->container:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 244
    invoke-virtual {p0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->initFliper()V

    .line 245
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    .line 246
    return-void
.end method

.method public getFrameBound()Landroid/view/View;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->baseView:Landroid/view/View;

    return-object v0
.end method

.method public getOwnHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->ownHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public initFliper()V
    .locals 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 252
    :cond_0
    invoke-virtual {p0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->buildHtLoginView()V

    .line 253
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView;->htLoginView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 254
    return-void
.end method
