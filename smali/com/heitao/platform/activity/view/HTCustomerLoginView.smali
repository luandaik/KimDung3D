.class public Lcom/heitao/platform/activity/view/HTCustomerLoginView;
.super Ljava/lang/Object;
.source "HTCustomerLoginView.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "InflateParams"
    }
.end annotation


# instance fields
.field public final ENTER_BIND_PHONE_NUMBER:I

.field public final ENTER_GAME:I

.field public final ENTER_REGISTER_COMPLETE:I

.field public final REGISTER_COMPLETE_BACK_FROM_BIND_PHONE_NUMBER:I

.field private activityHandler:Landroid/os/Handler;

.field private baseView:Landroid/view/View;

.field private bindPhoneNumberView:Landroid/view/View;

.field private container:Landroid/widget/LinearLayout;

.field private context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

.field private flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

.field private isAgree:Z

.field private isSaved:Z

.field private mFlipper:Landroid/widget/ViewFlipper;

.field private mPassWord:Ljava/lang/String;

.field private mUserName:Ljava/lang/String;

.field private nameET:Landroid/widget/EditText;

.field private ownHandler:Landroid/os/Handler;

.field private pwET:Landroid/widget/EditText;

.field private registerCompleteView:Landroid/view/View;

.field private registerView:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V
    .locals 2
    .param p1, "context"    # Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    const/4 v1, 0x1

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, 0x3

    iput v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->ENTER_REGISTER_COMPLETE:I

    .line 49
    const/4 v0, 0x4

    iput v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->ENTER_BIND_PHONE_NUMBER:I

    .line 50
    const/4 v0, 0x5

    iput v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->ENTER_GAME:I

    .line 52
    const/4 v0, 0x6

    iput v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->REGISTER_COMPLETE_BACK_FROM_BIND_PHONE_NUMBER:I

    .line 69
    iput-boolean v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->isSaved:Z

    .line 72
    iput-boolean v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->isAgree:Z

    .line 75
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    .line 76
    iput-object p2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->activityHandler:Landroid/os/Handler;

    .line 77
    new-instance v0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;

    invoke-direct {v0, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$1;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->ownHandler:Landroid/os/Handler;

    .line 119
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V
    .locals 0

    .prologue
    .line 241
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->buildRegisterComplete()V

    return-void
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerCompleteView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$10(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->nameET:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$11(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 414
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->checkRegisterInputPrams(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$12(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->ownHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$13(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V
    .locals 0

    .prologue
    .line 495
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->doLoginAndEnterGame()V

    return-void
.end method

.method static synthetic access$14(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 329
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    return-void
.end method

.method static synthetic access$15(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 366
    invoke-direct {p0, p1, p2}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->doBindPhone(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$16(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Z)V
    .locals 0

    .prologue
    .line 69
    iput-boolean p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->isSaved:Z

    return-void
.end method

.method static synthetic access$17(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mUserName:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$18(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mPassWord:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/ViewFlipper;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    return-object v0
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V
    .locals 0

    .prologue
    .line 278
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->buildBindPhoneNumber()V

    return-void
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/view/View;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->bindPhoneNumberView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    return-object v0
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->activityHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->pwET:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Z)V
    .locals 0

    .prologue
    .line 72
    iput-boolean p1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->isAgree:Z

    return-void
.end method

.method static synthetic access$9(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)Z
    .locals 1

    .prologue
    .line 72
    iget-boolean v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->isAgree:Z

    return v0
.end method

.method private buildBindPhoneNumber()V
    .locals 10

    .prologue
    .line 279
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->bindPhoneNumberView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 280
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_bind_phone_view"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->bindPhoneNumberView:Landroid/view/View;

    .line 282
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->bindPhoneNumberView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_bind_phone_back"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 283
    .local v7, "BindPhoneBack":Landroid/widget/ImageView;
    new-instance v2, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$10;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v7, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 308
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->bindPhoneNumberView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_binde_phone_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    .line 309
    .local v8, "phoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->bindPhoneNumberView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_binde_verfy_et"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 311
    .local v9, "verfyET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->bindPhoneNumberView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_bind_get_verfy_code"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 312
    .local v1, "verfy_tv":Landroid/widget/TextView;
    new-instance v0, Lcom/heitao/platform/activity/view/MyCountDownBt;

    const-wide/32 v2, 0xea60

    const-wide/16 v4, 0x3e8

    invoke-direct/range {v0 .. v5}, Lcom/heitao/platform/activity/view/MyCountDownBt;-><init>(Landroid/widget/TextView;JJ)V

    .line 313
    .local v0, "countDownBt":Lcom/heitao/platform/activity/view/MyCountDownBt;
    new-instance v2, Lcom/heitao/platform/activity/view/HTCustomerLoginView$11;

    invoke-direct {v2, p0, v8, v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$11;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 320
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->bindPhoneNumberView:Landroid/view/View;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "ht_bind_phone_btn"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 321
    .local v6, "BindPhoneBT":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/view/HTCustomerLoginView$12;

    invoke-direct {v2, p0, v8, v9}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$12;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 327
    return-void
.end method

.method private buildRegisterComplete()V
    .locals 8

    .prologue
    .line 242
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerCompleteView:Landroid/view/View;

    if-nez v5, :cond_0

    .line 243
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v5}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_customer_register_enter_view"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerCompleteView:Landroid/view/View;

    .line 245
    :cond_0
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_uname_tv"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 246
    .local v3, "uName":Landroid/widget/TextView;
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_upw_tv"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 248
    .local v4, "uPwd":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_account"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mUserName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 249
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_pwd"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mPassWord:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 251
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "ht_save_photo_tv"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 252
    .local v2, "savePhoto":Landroid/widget/TextView;
    iget-boolean v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->isSaved:Z

    if-nez v5, :cond_1

    .line 253
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_save_false"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 254
    const/high16 v5, -0x10000

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 260
    :goto_0
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "customer_bind_phone"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 261
    .local v0, "bindPhone":Landroid/widget/Button;
    new-instance v5, Lcom/heitao/platform/activity/view/HTCustomerLoginView$8;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$8;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 268
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerCompleteView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "customer_login_enter"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 269
    .local v1, "enter":Landroid/widget/Button;
    new-instance v5, Lcom/heitao/platform/activity/view/HTCustomerLoginView$9;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$9;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 276
    return-void

    .line 256
    .end local v0    # "bindPhone":Landroid/widget/Button;
    .end local v1    # "enter":Landroid/widget/Button;
    :cond_1
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_save_photo"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    const-string v5, "#888888"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0
.end method

.method private buildRegisterView()V
    .locals 8

    .prologue
    .line 173
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    if-nez v5, :cond_0

    .line 174
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v5}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_customer_register_view"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    .line 177
    :cond_0
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "custom_regist_back"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 178
    .local v0, "HTCustomerBack":Landroid/widget/ImageView;
    new-instance v5, Lcom/heitao/platform/activity/view/HTCustomerLoginView$3;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$3;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "register_account_et"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->nameET:Landroid/widget/EditText;

    .line 187
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->nameET:Landroid/widget/EditText;

    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->getAutoCreateUserName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 189
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "register_password_et"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->pwET:Landroid/widget/EditText;

    .line 190
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->pwET:Landroid/widget/EditText;

    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->getRandomPassword()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 192
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->pwET:Landroid/widget/EditText;

    new-instance v6, Lcom/heitao/platform/activity/view/HTCustomerLoginView$4;

    invoke-direct {v6, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$4;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 199
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_checkBox"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    .line 200
    .local v1, "checkBox":Landroid/widget/CheckBox;
    new-instance v5, Lcom/heitao/platform/activity/view/HTCustomerLoginView$5;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$5;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v1, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 211
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "ht_customer_register_bt"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 212
    .local v2, "coustomerLogin":Landroid/widget/Button;
    new-instance v5, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$6;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 226
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_statement_tv"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 227
    .local v4, "statementTV":Landroid/widget/TextView;
    new-instance v5, Lcom/heitao/platform/activity/view/HTCustomerLoginView$7;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$7;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    iget-object v6, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v7, "htp_policy_linear"

    invoke-static {v6, v7}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 234
    .local v3, "policy":Landroid/widget/LinearLayout;
    sget-object v5, Lcom/heitao/platform/common/HTPConsts;->POLICY_URL:Ljava/lang/String;

    invoke-static {v5}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 235
    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 239
    :goto_0
    return-void

    .line 237
    :cond_1
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method private checkRegisterInputPrams(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/Context;)V
    .locals 6
    .param p1, "emailAutoCompletatv"    # Landroid/widget/EditText;
    .param p2, "loginPassworded"    # Landroid/widget/EditText;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 416
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 417
    .local v3, "userName":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 419
    .local v1, "password":Ljava/lang/String;
    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 420
    const-string v4, "htp_account_cannot_null"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 493
    :goto_0
    return-void

    .line 424
    :cond_0
    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 425
    const-string v4, "htp_pwd_cannot_null"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 429
    :cond_1
    const-string v4, "^[a-z|A-Z]{1}.{0,}$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 430
    const-string v4, "htp_account_start_with_letter"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 434
    :cond_2
    const-string v4, "^[a-z|A-Z|0-9|_|.|-]{1,}$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 435
    const-string v4, "htp_account_letter_with_number"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 439
    :cond_3
    const-string v4, "^.{4,16}$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 440
    const-string v4, "htp_account_length"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 444
    :cond_4
    const-string v4, "^.{6,16}$"

    invoke-virtual {v1, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 445
    const-string v4, "htp_pwd_length"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    goto :goto_0

    .line 449
    :cond_5
    const-string v4, "htp_is_registering"

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p3, v4}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 452
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 453
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "username"

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    const-string v4, "password"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    const-string v2, "http://api.heitao.com/user/reg"

    .line 457
    .local v2, "url":Ljava/lang/String;
    new-instance v4, Lcom/heitao/platform/request/HTPRegisterParser;

    invoke-direct {v4}, Lcom/heitao/platform/request/HTPRegisterParser;-><init>()V

    new-instance v5, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;

    invoke-direct {v5, p0, p3, v3, v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$15;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v2, v0, v5}, Lcom/heitao/platform/request/HTPRegisterParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private doBindPhone(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "verfyCode"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 367
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v4

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v5

    iget-object v5, v5, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v5, v5, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/heitao/platform/common/HTPDBHelper;->queryWithUserName(Ljava/lang/String;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v0

    .line 368
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 369
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_please_input_phone"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 412
    :goto_0
    return-void

    .line 373
    :cond_0
    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 374
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_please_input_verfy_code"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 377
    :cond_1
    iget-object v4, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_bind_ing"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 378
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 380
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "mobile"

    invoke-interface {v1, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    const-string v4, "vercode"

    invoke-interface {v1, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    const-string v4, "uid"

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    const-string v4, "username"

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_bind_key"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 385
    iget-object v5, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v6, "htp_bind_key"

    invoke-static {v5, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 384
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 386
    .local v2, "str":Ljava/lang/String;
    const-string v4, "sign"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    const-string v3, "http://api.heitao.com/user/mobileBind"

    .line 389
    .local v3, "url":Ljava/lang/String;
    new-instance v4, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v4}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v5, Lcom/heitao/platform/activity/view/HTCustomerLoginView$14;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$14;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v4, v3, v1, v5}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto/16 :goto_0
.end method

.method private doLoginAndEnterGame()V
    .locals 4

    .prologue
    .line 496
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 497
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "username"

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mUserName:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    const-string v2, "password"

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mPassWord:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    const-string v1, "http://api.heitao.com/user/login"

    .line 501
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPLoginParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPLoginParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTCustomerLoginView$16;

    invoke-direct {v3, p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$16;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPLoginParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    .line 539
    return-void
.end method

.method private getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 5
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "countDownBt"    # Lcom/heitao/platform/activity/view/MyCountDownBt;

    .prologue
    .line 330
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 331
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_please_input_phone"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 364
    :goto_0
    return-void

    .line 335
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v4, "htp_get_ing"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 336
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 338
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "mobile"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    const-string v2, "type"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    const-string v1, "http://api.heitao.com/user/sendSms"

    .line 342
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/view/HTCustomerLoginView$13;

    invoke-direct {v3, p0, p3}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$13;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private initFliper()V
    .locals 3

    .prologue
    const/4 v2, -0x2

    .line 140
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 143
    :cond_0
    new-instance v0, Lcom/heitao/platform/activity/view/HTCustomerLoginView$2;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-direct {v0, p0, v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView$2;-><init>(Lcom/heitao/platform/activity/view/HTCustomerLoginView;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    .line 160
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 161
    invoke-direct {v0, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 160
    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 162
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 163
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 164
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->container:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 167
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->buildRegisterView()V

    .line 168
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->registerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 169
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    .line 170
    return-void
.end method


# virtual methods
.method public createView()V
    .locals 3

    .prologue
    .line 130
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->baseView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v2, "htp_base_login_view"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->baseView:Landroid/view/View;

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->baseView:Landroid/view/View;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->context:Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    const-string v2, "base_login_view_container"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->container:Landroid/widget/LinearLayout;

    .line 135
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->initFliper()V

    .line 137
    return-void
.end method

.method public getFrameBound()Landroid/view/View;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->baseView:Landroid/view/View;

    return-object v0
.end method

.method public getOwnHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->ownHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public setAccount()V
    .locals 2

    .prologue
    .line 542
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->nameET:Landroid/widget/EditText;

    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->getAutoCreateUserName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 543
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->pwET:Landroid/widget/EditText;

    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->getRandomPassword()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 544
    return-void
.end method
