.class public Lcom/heitao/platform/activity/view/HTPhoneLoginView;
.super Ljava/lang/Object;
.source "HTPhoneLoginView.java"


# instance fields
.field public final ENTER_PHONE_REGISTER_COMPLETE_VIEW:I

.field public final ENTER_PHONE_REGISTER_VIEW:I

.field public final ENTER_PHONE_VERFY_CODE_LOGIN_VIEW:I

.field public final PHONE_LOGIN_VIEW_BACK_FROM_PHONE_REGISTER_COMPLETE_VIEW:I

.field public final PHONE_LOGIN_VIEW_BACK_FROM_PHONE_REGISTER_VIEW:I

.field public final PHONE_LOGIN_VIEW_BACK_FROM_PHONE_VERFY_LOGIN_VIEW:I

.field private activityHandler:Landroid/os/Handler;

.field private baseView:Landroid/view/View;

.field private container:Landroid/widget/LinearLayout;

.field private context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

.field private flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

.field private isAgree:Z

.field private mFlipper:Landroid/widget/ViewFlipper;

.field private mPhoneNumber:Ljava/lang/String;

.field private mPhonePWD:Ljava/lang/String;

.field private ownHandler:Landroid/os/Handler;

.field private phoneLoginView:Landroid/view/View;

.field private phoneRegisterCompleteView:Landroid/view/View;

.field private phoneRegisterView:Landroid/view/View;

.field private phoneVerfyLoginView:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
    .locals 1
    .param p1, "context"    # Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x3

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->ENTER_PHONE_REGISTER_VIEW:I

    .line 41
    const/4 v0, 0x4

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->ENTER_PHONE_REGISTER_COMPLETE_VIEW:I

    .line 42
    const/4 v0, 0x5

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->ENTER_PHONE_VERFY_CODE_LOGIN_VIEW:I

    .line 44
    const/4 v0, 0x6

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->PHONE_LOGIN_VIEW_BACK_FROM_PHONE_REGISTER_VIEW:I

    .line 45
    const/4 v0, 0x7

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->PHONE_LOGIN_VIEW_BACK_FROM_PHONE_VERFY_LOGIN_VIEW:I

    .line 46
    const/16 v0, 0x8

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->PHONE_LOGIN_VIEW_BACK_FROM_PHONE_REGISTER_COMPLETE_VIEW:I

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->isAgree:Z

    .line 67
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 68
    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->activityHandler:Landroid/os/Handler;

    .line 69
    new-instance v0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;

    invoke-direct {v0, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$1;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->ownHandler:Landroid/os/Handler;

    .line 152
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneVerfyLoginView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/widget/ViewFlipper;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    return-object v0
.end method

.method static synthetic access$10(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Z
    .locals 1

    .prologue
    .line 65
    iget-boolean v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->isAgree:Z

    return v0
.end method

.method static synthetic access$11(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 436
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->registerPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$12(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mPhoneNumber:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$13(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mPhonePWD:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$14(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mPhoneNumber:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$15(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mPhonePWD:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterCompleteView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    return-object v0
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->activityHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->ownHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 504
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->doPhoneLogin(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 392
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    return-void
.end method

.method static synthetic access$9(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Z)V
    .locals 0

    .prologue
    .line 65
    iput-boolean p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->isAgree:Z

    return-void
.end method

.method private doPhoneLogin(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "passWord"    # Ljava/lang/String;
    .param p3, "isVerfy"    # Z

    .prologue
    const/4 v5, 0x0

    .line 505
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 507
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_phone"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 582
    :goto_0
    return-void

    .line 510
    :cond_0
    if-eqz p3, :cond_1

    .line 511
    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 513
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_verfy_code"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 517
    :cond_1
    const-string v2, "^.{6,16}$"

    invoke-virtual {p2, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 519
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "pwd_length_limit"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 525
    :cond_2
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_is_logining"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 526
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 528
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "mobile"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    if-eqz p3, :cond_3

    .line 530
    const-string v2, "vercode"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    :goto_1
    const-string v1, "http://api.heitao.com/user/mobilelogin"

    .line 537
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPLoginParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPLoginParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTPhoneLoginView$18;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$18;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPLoginParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0

    .line 532
    .end local v1    # "url":Ljava/lang/String;
    :cond_3
    const-string v2, "password"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method private getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 5
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "countDownBt"    # Lcom/heitao/platform/activity/view/MyCountDownBt;

    .prologue
    .line 393
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 395
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_phone"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 435
    :goto_0
    return-void

    .line 400
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_get_ing"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 401
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 403
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "mobile"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    const-string v2, "type"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    const-string v1, "http://api.heitao.com/user/sendSms"

    .line 407
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTPhoneLoginView$16;

    invoke-direct {v3, p0, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$16;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private initFliper()V
    .locals 3

    .prologue
    const/4 v2, -0x2

    .line 172
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 175
    :cond_0
    new-instance v0, Lcom/heitao/platform/activity/view/HTPhoneLoginView$2;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-direct {v0, p0, v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$2;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    .line 192
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 193
    invoke-direct {v0, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 192
    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 194
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 195
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 196
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 197
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->container:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 199
    invoke-virtual {p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->buildPhoneLoginView()V

    .line 200
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneLoginView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 201
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    .line 202
    return-void
.end method

.method private registerPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "verfyCode"    # Ljava/lang/String;
    .param p3, "passWord"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 437
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 439
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_phone"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 503
    :goto_0
    return-void

    .line 443
    :cond_0
    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 445
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_verfy_code"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 448
    :cond_1
    const-string v2, "^.{6,16}$"

    invoke-virtual {p3, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 450
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "pwd_length_limit"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 454
    :cond_2
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_get_ing"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 455
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 457
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "mobile"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    const-string v2, "vercode"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    const-string v2, "password"

    invoke-interface {v0, v2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 461
    const-string v1, "http://api.heitao.com/user/mobilereg"

    .line 462
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPRegisterParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPRegisterParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;

    invoke-direct {v3, p0, p1, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$17;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPRegisterParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method


# virtual methods
.method public buildPhoneLoginView()V
    .locals 9

    .prologue
    .line 205
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneLoginView:Landroid/view/View;

    if-nez v6, :cond_0

    .line 206
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v6}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v6

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_login_view"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneLoginView:Landroid/view/View;

    .line 208
    :cond_0
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_login_back"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 209
    .local v3, "phoneLoginBackIcon":Landroid/widget/ImageView;
    new-instance v6, Lcom/heitao/platform/activity/view/HTPhoneLoginView$3;

    invoke-direct {v6, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$3;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 220
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_register_btn"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 221
    .local v4, "phoneRegisterBt":Landroid/widget/Button;
    new-instance v6, Lcom/heitao/platform/activity/view/HTPhoneLoginView$4;

    invoke-direct {v6, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$4;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 228
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_verfy_login_btn"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 229
    .local v5, "phoneVerfyBt":Landroid/widget/TextView;
    new-instance v6, Lcom/heitao/platform/activity/view/HTPhoneLoginView$5;

    invoke-direct {v6, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$5;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 236
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_input_et"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 237
    .local v2, "phoneET":Landroid/widget/EditText;
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_pass_word_input"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 238
    .local v1, "passwordET":Landroid/widget/EditText;
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_login_btn"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 239
    .local v0, "loginBT":Landroid/widget/Button;
    new-instance v6, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;

    invoke-direct {v6, p0, v1, v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$6;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 250
    return-void
.end method

.method public buildPhoneRegisterCompleteView()V
    .locals 6

    .prologue
    .line 324
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterCompleteView:Landroid/view/View;

    if-nez v3, :cond_0

    .line 325
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v3}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_phone_register_and_login_view"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    .line 326
    const/4 v5, 0x0

    .line 325
    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterCompleteView:Landroid/view/View;

    .line 328
    :cond_0
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterCompleteView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_phone_et"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 329
    .local v2, "phoneET":Landroid/widget/EditText;
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterCompleteView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_phone_pwd_et"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 330
    .local v1, "passET":Landroid/widget/EditText;
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mPhoneNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 331
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->mPhonePWD:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 332
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterCompleteView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "ht_phone_login_btn"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 333
    .local v0, "loginBT":Landroid/widget/Button;
    new-instance v3, Lcom/heitao/platform/activity/view/HTPhoneLoginView$12;

    invoke-direct {v3, p0, v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$12;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Landroid/widget/EditText;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 353
    return-void
.end method

.method public buildPhoneRegisterView()V
    .locals 14

    .prologue
    .line 253
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 254
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_register_view"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    .line 257
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_registe_back"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    .line 258
    .local v9, "phoneRegisterBackIcon":Landroid/widget/ImageView;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView$7;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$7;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V

    invoke-virtual {v9, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 266
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_statement_tv"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 267
    .local v12, "statementTV":Landroid/widget/TextView;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView$8;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$8;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V

    invoke-virtual {v12, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 273
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_input_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    .line 274
    .local v8, "phoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_verfy_input"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/EditText;

    .line 275
    .local v13, "verfyET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_pass_word_input"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    .line 278
    .local v7, "passwordET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_get_verfy_code"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 279
    .local v1, "verfy_tv":Landroid/widget/TextView;
    new-instance v0, Lcom/heitao/platform/activity/view/MyCountDownBt;

    const-wide/32 v2, 0xea60

    const-wide/16 v4, 0x3e8

    invoke-direct/range {v0 .. v5}, Lcom/heitao/platform/activity/view/MyCountDownBt;-><init>(Landroid/widget/TextView;JJ)V

    .line 280
    .local v0, "countDownBt":Lcom/heitao/platform/activity/view/MyCountDownBt;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView$9;

    invoke-direct {v2, p0, v8, v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$9;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 287
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_checkBox"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/CheckBox;

    .line 288
    .local v6, "checkBox":Landroid/widget/CheckBox;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView$10;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$10;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V

    invoke-virtual {v6, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 299
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "ht_phone_register_btn"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    .line 300
    .local v10, "phoneRegisterBt":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView$11;

    invoke-direct {v2, p0, v7, v8, v13}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$11;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v10, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 315
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_policy_linear"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/LinearLayout;

    .line 316
    .local v11, "policy":Landroid/widget/LinearLayout;
    sget-object v2, Lcom/heitao/platform/common/HTPConsts;->POLICY_URL:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 317
    const/4 v2, 0x4

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 321
    :goto_0
    return-void

    .line 319
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method public buildPhoneVerfyLoginView()V
    .locals 10

    .prologue
    .line 356
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneVerfyLoginView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 357
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_verfy_code_login_view"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneVerfyLoginView:Landroid/view/View;

    .line 359
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneVerfyLoginView:Landroid/view/View;

    .line 360
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_verfy_login_back"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 359
    check-cast v8, Landroid/widget/ImageView;

    .line 361
    .local v8, "phoneVerfyLoginBackIcon":Landroid/widget/ImageView;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView$13;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$13;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;)V

    invoke-virtual {v8, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 368
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneVerfyLoginView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_verfy_phone_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    .line 369
    .local v7, "phoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneVerfyLoginView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_verfy_code_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 371
    .local v9, "verfyET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneVerfyLoginView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_verfy_log_get_verfy"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 372
    .local v1, "verfy_tv":Landroid/widget/TextView;
    new-instance v0, Lcom/heitao/platform/activity/view/MyCountDownBt;

    const-wide/32 v2, 0xea60

    const-wide/16 v4, 0x3e8

    invoke-direct/range {v0 .. v5}, Lcom/heitao/platform/activity/view/MyCountDownBt;-><init>(Landroid/widget/TextView;JJ)V

    .line 373
    .local v0, "countDownBt":Lcom/heitao/platform/activity/view/MyCountDownBt;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView$14;

    invoke-direct {v2, p0, v7, v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$14;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 380
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->phoneVerfyLoginView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "ht_phone_login_btn"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 381
    .local v6, "loginBT":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView$15;

    invoke-direct {v2, p0, v9, v7}, Lcom/heitao/platform/activity/view/HTPhoneLoginView$15;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 391
    return-void
.end method

.method public createView()V
    .locals 3

    .prologue
    .line 164
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->baseView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v2, "htp_base_login_view"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->baseView:Landroid/view/View;

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->baseView:Landroid/view/View;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v2, "base_login_view_container"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->container:Landroid/widget/LinearLayout;

    .line 168
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->initFliper()V

    .line 169
    return-void
.end method

.method public getFrameBound()Landroid/view/View;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->baseView:Landroid/view/View;

    return-object v0
.end method

.method public getOwnHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->ownHandler:Landroid/os/Handler;

    return-object v0
.end method
