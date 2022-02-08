.class public Lcom/heitao/platform/activity/view/HTPhoneLoginView2;
.super Ljava/lang/Object;
.source "HTPhoneLoginView2.java"


# instance fields
.field public final ENTER_PHONE_REGISTER_COMPLETE_VIEW:I

.field public final ENTER_PHONE_REGISTER_VIEW:I

.field public final ENTER_PHONE_VERFY_CODE_LOGIN_VIEW:I

.field public final PHONE_LOGIN_VIEW_BACK_FROM_PHONE_REGISTER_COMPLETE_VIEW:I

.field public final PHONE_LOGIN_VIEW_BACK_FROM_PHONE_REGISTER_VIEW:I

.field public final PHONE_LOGIN_VIEW_BACK_FROM_PHONE_VERFY_LOGIN_VIEW:I

.field private baseView:Landroid/view/View;

.field private container:Landroid/widget/LinearLayout;

.field private context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

.field private fatherHandler:Landroid/os/Handler;

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
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x3

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->ENTER_PHONE_REGISTER_VIEW:I

    .line 41
    const/4 v0, 0x4

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->ENTER_PHONE_REGISTER_COMPLETE_VIEW:I

    .line 42
    const/4 v0, 0x5

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->ENTER_PHONE_VERFY_CODE_LOGIN_VIEW:I

    .line 44
    const/4 v0, 0x6

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->PHONE_LOGIN_VIEW_BACK_FROM_PHONE_REGISTER_VIEW:I

    .line 45
    const/4 v0, 0x7

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->PHONE_LOGIN_VIEW_BACK_FROM_PHONE_VERFY_LOGIN_VIEW:I

    .line 46
    const/16 v0, 0x8

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->PHONE_LOGIN_VIEW_BACK_FROM_PHONE_REGISTER_COMPLETE_VIEW:I

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->isAgree:Z

    .line 66
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 67
    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->fatherHandler:Landroid/os/Handler;

    .line 68
    new-instance v0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;

    invoke-direct {v0, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$1;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->ownHandler:Landroid/os/Handler;

    .line 139
    new-instance v0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;

    invoke-direct {v0, p0, p1, p1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$2;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/content/Context;Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    .line 155
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    return-object v0
.end method

.method static synthetic access$10(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Z)V
    .locals 0

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->isAgree:Z

    return-void
.end method

.method static synthetic access$11(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Z
    .locals 1

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->isAgree:Z

    return v0
.end method

.method static synthetic access$12(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 494
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->registerPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$13(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mPhoneNumber:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$14(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mPhonePWD:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$15(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mPhoneNumber:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$16(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mPhonePWD:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterCompleteView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->fatherHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->ownHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    return-object v0
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 367
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->doPhoneLogin(Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$9(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 451
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    return-void
.end method

.method private doPhoneLogin(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "passWord"    # Ljava/lang/String;
    .param p3, "isVerfy"    # Z

    .prologue
    const/4 v5, 0x0

    .line 368
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 370
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_phone"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 450
    :goto_0
    return-void

    .line 373
    :cond_0
    if-eqz p3, :cond_1

    .line 374
    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 376
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_verfy_code"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 380
    :cond_1
    const-string v2, "^.{6,16}$"

    invoke-virtual {p2, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 382
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "pwd_length_limit"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 388
    :cond_2
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_is_logining"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 389
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 391
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "mobile"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    if-eqz p3, :cond_3

    .line 393
    const-string v2, "vercode"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    :goto_1
    const-string v1, "http://api.heitao.com/user/mobilelogin"

    .line 400
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPLoginParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPLoginParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$16;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$16;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPLoginParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0

    .line 395
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
    .line 452
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 454
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_phone"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 493
    :goto_0
    return-void

    .line 458
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_get_ing"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 459
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 461
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "mobile"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    const-string v2, "type"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    const-string v1, "http://api.heitao.com/user/sendSms"

    .line 465
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$17;

    invoke-direct {v3, p0, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$17;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private registerPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "verfyCode"    # Ljava/lang/String;
    .param p3, "passWord"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 495
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 497
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_phone"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 562
    :goto_0
    return-void

    .line 500
    :cond_0
    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 502
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_verfy_code"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 505
    :cond_1
    const-string v2, "^.{6,16}$"

    invoke-virtual {p3, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 507
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "pwd_length_limit"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 511
    :cond_2
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_get_ing"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 512
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 514
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "mobile"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    const-string v2, "vercode"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 516
    const-string v2, "password"

    invoke-interface {v0, v2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    const-string v1, "http://api.heitao.com/user/mobilereg"

    .line 519
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPRegisterParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPRegisterParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$18;

    invoke-direct {v3, p0, p1, p3}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$18;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPRegisterParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method


# virtual methods
.method public buildPhoneLoginView()V
    .locals 9

    .prologue
    .line 189
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    if-nez v6, :cond_0

    .line 190
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v6}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v6

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_login_view"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    .line 192
    :cond_0
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_login_back"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 193
    .local v3, "phoneLoginBackIcon":Landroid/widget/ImageView;
    new-instance v6, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$3;

    invoke-direct {v6, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$3;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 205
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_register_btn"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 206
    .local v4, "phoneRegisterBt":Landroid/widget/Button;
    new-instance v6, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$4;

    invoke-direct {v6, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$4;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 213
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_verfy_login_btn"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 214
    .local v5, "phoneVerfyBt":Landroid/widget/TextView;
    new-instance v6, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$5;

    invoke-direct {v6, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$5;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 221
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_input_et"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 222
    .local v2, "phoneET":Landroid/widget/EditText;
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_pass_word_input"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 223
    .local v1, "passwordET":Landroid/widget/EditText;
    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    iget-object v7, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v8, "htp_phone_login_btn"

    invoke-static {v7, v8}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 224
    .local v0, "loginBT":Landroid/widget/Button;
    new-instance v6, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$6;

    invoke-direct {v6, p0, v1, v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$6;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 235
    return-void
.end method

.method public buildPhoneRegisterCompleteView()V
    .locals 6

    .prologue
    .line 308
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterCompleteView:Landroid/view/View;

    if-nez v3, :cond_0

    .line 309
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v3}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_phone_register_and_login_view"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    .line 310
    const/4 v5, 0x0

    .line 309
    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterCompleteView:Landroid/view/View;

    .line 313
    :cond_0
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterCompleteView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_phone_et"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 314
    .local v2, "phoneET":Landroid/widget/EditText;
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterCompleteView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "htp_phone_pwd_et"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 315
    .local v1, "passET":Landroid/widget/EditText;
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mPhoneNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 316
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mPhonePWD:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 317
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterCompleteView:Landroid/view/View;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v5, "ht_phone_login_btn"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 318
    .local v0, "loginBT":Landroid/widget/Button;
    new-instance v3, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$12;

    invoke-direct {v3, p0, v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$12;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/widget/EditText;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 328
    return-void
.end method

.method public buildPhoneRegisterView()V
    .locals 14

    .prologue
    .line 238
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 239
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_register_view"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    .line 241
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_registe_back"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    .line 242
    .local v9, "phoneRegisterBackIcon":Landroid/widget/ImageView;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$7;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$7;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V

    invoke-virtual {v9, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 250
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_statement_tv"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 251
    .local v12, "statementTV":Landroid/widget/TextView;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$8;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$8;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V

    invoke-virtual {v12, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 257
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_input_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    .line 258
    .local v8, "phoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_verfy_input"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/EditText;

    .line 259
    .local v13, "verfyET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_pass_word_input"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    .line 262
    .local v7, "passwordET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_get_verfy_code"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 263
    .local v1, "verfy_tv":Landroid/widget/TextView;
    new-instance v0, Lcom/heitao/platform/activity/view/MyCountDownBt;

    const-wide/32 v2, 0xea60

    const-wide/16 v4, 0x3e8

    invoke-direct/range {v0 .. v5}, Lcom/heitao/platform/activity/view/MyCountDownBt;-><init>(Landroid/widget/TextView;JJ)V

    .line 264
    .local v0, "countDownBt":Lcom/heitao/platform/activity/view/MyCountDownBt;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$9;

    invoke-direct {v2, p0, v8, v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$9;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_checkBox"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/CheckBox;

    .line 272
    .local v6, "checkBox":Landroid/widget/CheckBox;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$10;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$10;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V

    invoke-virtual {v6, v2}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 283
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "ht_phone_register_btn"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    .line 284
    .local v10, "phoneRegisterBt":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$11;

    invoke-direct {v2, p0, v7, v8, v13}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$11;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v10, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 299
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_policy_linear"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/LinearLayout;

    .line 300
    .local v11, "policy":Landroid/widget/LinearLayout;
    sget-object v2, Lcom/heitao/platform/common/HTPConsts;->POLICY_URL:Ljava/lang/String;

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 301
    const/4 v2, 0x4

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 305
    :goto_0
    return-void

    .line 303
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method public buildPhoneVerfyLoginView()V
    .locals 10

    .prologue
    .line 331
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 332
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_verfy_code_login_view"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    .line 334
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    .line 335
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_phone_verfy_login_back"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 334
    check-cast v8, Landroid/widget/ImageView;

    .line 336
    .local v8, "phoneVerfyLoginBackIcon":Landroid/widget/ImageView;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$13;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$13;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V

    invoke-virtual {v8, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 343
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_verfy_phone_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    .line 344
    .local v7, "phoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_verfy_code_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 346
    .local v9, "verfyET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_verfy_log_get_verfy"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 347
    .local v1, "verfy_tv":Landroid/widget/TextView;
    new-instance v0, Lcom/heitao/platform/activity/view/MyCountDownBt;

    const-wide/32 v2, 0xea60

    const-wide/16 v4, 0x3e8

    invoke-direct/range {v0 .. v5}, Lcom/heitao/platform/activity/view/MyCountDownBt;-><init>(Landroid/widget/TextView;JJ)V

    .line 348
    .local v0, "countDownBt":Lcom/heitao/platform/activity/view/MyCountDownBt;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$14;

    invoke-direct {v2, p0, v7, v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$14;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 355
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "ht_phone_login_btn"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 356
    .local v6, "loginBT":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;

    invoke-direct {v2, p0, v9, v7}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$15;-><init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 366
    return-void
.end method

.method public clear()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 564
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    if-eqz v0, :cond_0

    .line 565
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 567
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->fatherHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 568
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->fatherHandler:Landroid/os/Handler;

    .line 570
    :cond_1
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->ownHandler:Landroid/os/Handler;

    if-eqz v0, :cond_2

    .line 571
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->ownHandler:Landroid/os/Handler;

    .line 573
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->container:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_3

    .line 574
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->container:Landroid/widget/LinearLayout;

    .line 576
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_4

    .line 577
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    .line 579
    :cond_4
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->baseView:Landroid/view/View;

    if-eqz v0, :cond_5

    .line 580
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->baseView:Landroid/view/View;

    .line 582
    :cond_5
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    if-eqz v0, :cond_6

    .line 583
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    .line 585
    :cond_6
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    if-eqz v0, :cond_7

    .line 586
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneVerfyLoginView:Landroid/view/View;

    .line 588
    :cond_7
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    if-eqz v0, :cond_8

    .line 589
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterView:Landroid/view/View;

    .line 591
    :cond_8
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterCompleteView:Landroid/view/View;

    if-eqz v0, :cond_9

    .line 592
    iput-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneRegisterCompleteView:Landroid/view/View;

    .line 595
    :cond_9
    return-void
.end method

.method public createView()V
    .locals 4

    .prologue
    const/4 v3, -0x2

    .line 166
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->baseView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v2, "htp_base_login_view"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->baseView:Landroid/view/View;

    .line 169
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->baseView:Landroid/view/View;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v2, "base_login_view_container"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->container:Landroid/widget/LinearLayout;

    .line 170
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 171
    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 170
    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 172
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 173
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 174
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->container:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 176
    invoke-virtual {p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->initFliper()V

    .line 177
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    .line 178
    return-void
.end method

.method public getFrameBound()Landroid/view/View;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->baseView:Landroid/view/View;

    return-object v0
.end method

.method public getOwnHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->ownHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public initFliper()V
    .locals 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 184
    :cond_0
    invoke-virtual {p0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneLoginView()V

    .line 185
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->phoneLoginView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 186
    return-void
.end method
