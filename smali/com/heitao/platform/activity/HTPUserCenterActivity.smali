.class public Lcom/heitao/platform/activity/HTPUserCenterActivity;
.super Lcom/heitao/platform/activity/HTPBaseActivity;
.source "HTPUserCenterActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER:[I

.field public static mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;


# instance fields
.field private final BASE_VIEW_BACK_FROM_BIND_NEW_PHONE:I

.field private final BASE_VIEW_BACK_FROM_BIND_PHONE:I

.field private final BASE_VIEW_BACK_FROM_CHANGE_PWD:I

.field private final BASE_VIEW_BACK_FROM_FIND_PWD:I

.field private final CHANGE_PWD_BACK_FROM_FORGET_PWD:I

.field private final ENTER_BIND_NEW_PHONE:I

.field private final ENTER_BIND_PHONE:I

.field private final ENTER_CHANGE_PWD:I

.field private final ENTER_FIND_PWD:I

.field private final ENTER_FORGET_PWD:I

.field private final FORGET_PWD_BACK_FROM_FIND_PWD:I

.field private accountIcon:Landroid/widget/ImageView;

.field private accountTV:Landroid/widget/TextView;

.field private backIcon:Landroid/widget/ImageView;

.field private baseView:Landroid/view/View;

.field private bindNewPhoneView:Landroid/view/View;

.field private bindPhoneView:Landroid/view/View;

.field private changePWDView:Landroid/view/View;

.field private container:Landroid/widget/RelativeLayout;

.field private context:Landroid/content/Context;

.field private exitBT:Landroid/widget/TextView;

.field private findByPhoneView:Landroid/view/View;

.field private flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

.field private forgetView:Landroid/view/View;

.field private innerHandler:Landroid/os/Handler;

.field private mFlipper:Landroid/widget/ViewFlipper;

.field private pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;


# direct methods
.method static synthetic $SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER()[I
    .locals 3

    .prologue
    .line 39
    sget-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->$SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->values()[Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BASE_VIEW:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_5

    :goto_1
    :try_start_1
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BINDE_NEW_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_4

    :goto_2
    :try_start_2
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BIND_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_3

    :goto_3
    :try_start_3
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->CHANGE_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_2

    :goto_4
    :try_start_4
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FIND_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_1

    :goto_5
    :try_start_5
    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FORGET_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_0

    :goto_6
    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->$SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_6

    :catch_1
    move-exception v1

    goto :goto_5

    :catch_2
    move-exception v1

    goto :goto_4

    :catch_3
    move-exception v1

    goto :goto_3

    :catch_4
    move-exception v1

    goto :goto_2

    :catch_5
    move-exception v1

    goto :goto_1
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 80
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;-><init>()V

    .line 45
    const/4 v0, 0x2

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->ENTER_CHANGE_PWD:I

    .line 46
    const/4 v0, 0x3

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->ENTER_FORGET_PWD:I

    .line 47
    const/4 v0, 0x4

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->ENTER_FIND_PWD:I

    .line 48
    const/4 v0, 0x5

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->ENTER_BIND_PHONE:I

    .line 49
    const/4 v0, 0x6

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->ENTER_BIND_NEW_PHONE:I

    .line 51
    const/4 v0, 0x7

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->BASE_VIEW_BACK_FROM_CHANGE_PWD:I

    .line 52
    const/16 v0, 0x8

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->BASE_VIEW_BACK_FROM_BIND_PHONE:I

    .line 53
    const/16 v0, 0x9

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->BASE_VIEW_BACK_FROM_BIND_NEW_PHONE:I

    .line 55
    const/16 v0, 0xa

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->CHANGE_PWD_BACK_FROM_FORGET_PWD:I

    .line 56
    const/16 v0, 0xd

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->FORGET_PWD_BACK_FROM_FIND_PWD:I

    .line 57
    const/16 v0, 0xc

    iput v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->BASE_VIEW_BACK_FROM_FIND_PWD:I

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    .line 39
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Lcom/heitao/platform/activity/view/UserCenterStack;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    return-object v0
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V
    .locals 0

    .prologue
    .line 372
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->buildChangePWDView()V

    return-void
.end method

.method static synthetic access$10(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V
    .locals 0

    .prologue
    .line 477
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->buildBindPhoneView()V

    return-void
.end method

.method static synthetic access$11(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V
    .locals 0

    .prologue
    .line 510
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->buildBindNewPhoneView()V

    return-void
.end method

.method static synthetic access$12(Lcom/heitao/platform/activity/HTPUserCenterActivity;Z)V
    .locals 0

    .prologue
    .line 286
    invoke-direct {p0, p1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->setBaseView(Z)V

    return-void
.end method

.method static synthetic access$13(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$14(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$15(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 548
    invoke-direct {p0, p1, p2}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->doChangePassWord(Landroid/widget/EditText;Landroid/widget/EditText;)V

    return-void
.end method

.method static synthetic access$16(Lcom/heitao/platform/activity/HTPUserCenterActivity;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 0

    .prologue
    .line 609
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    return-void
.end method

.method static synthetic access$17(Lcom/heitao/platform/activity/HTPUserCenterActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 646
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePwdByPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$18(Lcom/heitao/platform/activity/HTPUserCenterActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 706
    invoke-direct {p0, p1, p2}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->doBindPhone(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$19(Lcom/heitao/platform/activity/HTPUserCenterActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 759
    invoke-direct {p0, p1, p2, p3}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->doBindNewPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindPhoneView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/widget/ViewFlipper;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    return-object v0
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePWDView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V
    .locals 0

    .prologue
    .line 405
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->buildForgetPWDView()V

    return-void
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->forgetView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V
    .locals 0

    .prologue
    .line 436
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->buildFindPWDByPhoneView()V

    return-void
.end method

.method static synthetic access$9(Lcom/heitao/platform/activity/HTPUserCenterActivity;)Landroid/view/View;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findByPhoneView:Landroid/view/View;

    return-object v0
.end method

.method private buildBindNewPhoneView()V
    .locals 10

    .prologue
    .line 511
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 512
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const-string v3, "htp_user_center_change_phone_view"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    .line 513
    const/4 v4, 0x0

    .line 512
    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    .line 515
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2}, Landroid/widget/ViewFlipper;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_1

    .line 516
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 517
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 520
    :cond_1
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    const-string v3, "htp_old_phone_et"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    .line 521
    .local v8, "oldPhoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    const-string v3, "htp_new_phone_et"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    .line 522
    .local v7, "newPhoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    const-string v3, "htp_verfy_code_et"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 524
    .local v9, "verfyET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    const-string v3, "htp_get_verfy_tv"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 525
    .local v1, "verfy_tv":Landroid/widget/TextView;
    new-instance v0, Lcom/heitao/platform/activity/view/MyCountDownBt;

    const-wide/32 v2, 0xea60

    const-wide/16 v4, 0x3e8

    invoke-direct/range {v0 .. v5}, Lcom/heitao/platform/activity/view/MyCountDownBt;-><init>(Landroid/widget/TextView;JJ)V

    .line 526
    .local v0, "countDownBt":Lcom/heitao/platform/activity/view/MyCountDownBt;
    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$16;

    invoke-direct {v2, p0, v7, v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$16;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 533
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    const-string v3, "ht_bind_new_btn"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 534
    .local v6, "bindBT":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;

    invoke-direct {v2, p0, v9, v8, v7}, Lcom/heitao/platform/activity/HTPUserCenterActivity$17;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 546
    return-void
.end method

.method private buildBindPhoneView()V
    .locals 9

    .prologue
    .line 478
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindPhoneView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 479
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const-string v3, "htp_user_center_bind_phone_view"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindPhoneView:Landroid/view/View;

    .line 481
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2}, Landroid/widget/ViewFlipper;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_1

    .line 482
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 483
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 485
    :cond_1
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindPhoneView:Landroid/view/View;

    const-string v3, "htp_phone_et"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    .line 486
    .local v7, "phoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindPhoneView:Landroid/view/View;

    const-string v3, "htp_phone_verfy_et"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/EditText;

    .line 488
    .local v8, "verfyET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindPhoneView:Landroid/view/View;

    const-string v3, "htp_get_verfy_tv"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 489
    .local v1, "verfy_tv":Landroid/widget/TextView;
    new-instance v0, Lcom/heitao/platform/activity/view/MyCountDownBt;

    const-wide/32 v2, 0xea60

    const-wide/16 v4, 0x3e8

    invoke-direct/range {v0 .. v5}, Lcom/heitao/platform/activity/view/MyCountDownBt;-><init>(Landroid/widget/TextView;JJ)V

    .line 490
    .local v0, "countDownBt":Lcom/heitao/platform/activity/view/MyCountDownBt;
    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$14;

    invoke-direct {v2, p0, v7, v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$14;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 497
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindPhoneView:Landroid/view/View;

    const-string v3, "ht_phone_bind_btn"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 498
    .local v6, "bindBT":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$15;

    invoke-direct {v2, p0, v8, v7}, Lcom/heitao/platform/activity/HTPUserCenterActivity$15;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 508
    return-void
.end method

.method private buildChangePWDView()V
    .locals 7

    .prologue
    .line 373
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePWDView:Landroid/view/View;

    if-nez v4, :cond_0

    .line 374
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const-string v5, "htp_user_center_change_pwd_view"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePWDView:Landroid/view/View;

    .line 377
    :cond_0
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v4}, Landroid/widget/ViewFlipper;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-nez v4, :cond_1

    .line 378
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 379
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 382
    :cond_1
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePWDView:Landroid/view/View;

    const-string v5, "htp_user_center_forget_tv"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 383
    .local v0, "forgetTV":Landroid/widget/TextView;
    new-instance v4, Lcom/heitao/platform/activity/HTPUserCenterActivity$8;

    invoke-direct {v4, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$8;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 391
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePWDView:Landroid/view/View;

    const-string v5, "htp_old_pwd_et"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 393
    .local v2, "mOldPwdEdit":Landroid/widget/EditText;
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePWDView:Landroid/view/View;

    const-string v5, "htp_new_pwd_et"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 395
    .local v1, "mNewPwdEdit":Landroid/widget/EditText;
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePWDView:Landroid/view/View;

    const-string v5, "ht_modify_pwd_btn"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 396
    .local v3, "modifyBT":Landroid/widget/Button;
    new-instance v4, Lcom/heitao/platform/activity/HTPUserCenterActivity$9;

    invoke-direct {v4, p0, v1, v2}, Lcom/heitao/platform/activity/HTPUserCenterActivity$9;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 403
    return-void
.end method

.method private buildFindPWDByPhoneView()V
    .locals 10

    .prologue
    .line 437
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findByPhoneView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 438
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const-string v3, "htp_user_center_findpw_view"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findByPhoneView:Landroid/view/View;

    .line 441
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2}, Landroid/widget/ViewFlipper;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_1

    .line 442
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 443
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 445
    :cond_1
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findByPhoneView:Landroid/view/View;

    const-string v3, "htp_phone_et"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    .line 446
    .local v7, "phoneET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findByPhoneView:Landroid/view/View;

    const-string v3, "htp_new_password_et"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    .line 447
    .local v6, "newPwdET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findByPhoneView:Landroid/view/View;

    const-string v3, "htp_verfy_code_et"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 449
    .local v9, "verfyET":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findByPhoneView:Landroid/view/View;

    const-string v3, "htp_get_verfy"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 450
    .local v1, "verfy_tv":Landroid/widget/TextView;
    new-instance v0, Lcom/heitao/platform/activity/view/MyCountDownBt;

    const-wide/32 v2, 0xea60

    const-wide/16 v4, 0x3e8

    invoke-direct/range {v0 .. v5}, Lcom/heitao/platform/activity/view/MyCountDownBt;-><init>(Landroid/widget/TextView;JJ)V

    .line 451
    .local v0, "countDownBt":Lcom/heitao/platform/activity/view/MyCountDownBt;
    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$12;

    invoke-direct {v2, p0, v7, v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$12;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 463
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findByPhoneView:Landroid/view/View;

    const-string v3, "ht_sure_bt"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/Button;

    .line 464
    .local v8, "sureBT":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$13;

    invoke-direct {v2, p0, v9, v7, v6}, Lcom/heitao/platform/activity/HTPUserCenterActivity$13;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v8, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 475
    return-void
.end method

.method private buildForgetPWDView()V
    .locals 5

    .prologue
    .line 406
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->forgetView:Landroid/view/View;

    if-nez v2, :cond_0

    .line 407
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const-string v3, "htp_user_center_forgetpw_view"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->forgetView:Landroid/view/View;

    .line 410
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2}, Landroid/widget/ViewFlipper;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_1

    .line 411
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 412
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 414
    :cond_1
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->forgetView:Landroid/view/View;

    const-string v3, "htp_find_by_phone"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 415
    .local v0, "findBT":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$10;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$10;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 426
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->forgetView:Landroid/view/View;

    const-string v3, "ht_know_bt"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 427
    .local v1, "knowBT":Landroid/widget/Button;
    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$11;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$11;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 434
    return-void
.end method

.method private changePwdByPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "phone"    # Ljava/lang/String;
    .param p2, "newPwd"    # Ljava/lang/String;
    .param p3, "verfyCode"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 647
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 648
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v5, "htp_please_input_phone"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 704
    :goto_0
    return-void

    .line 651
    :cond_0
    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 652
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "pwd_shouldbe_filledin"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 653
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 657
    :cond_1
    const-string v4, "^.{6,16}$"

    invoke-virtual {p2, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 658
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "pwd_length_limit"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 659
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 663
    :cond_2
    invoke-static {p3}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 664
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v5, "htp_please_input_verfy_code"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 668
    :cond_3
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v4

    .line 669
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v5

    iget-object v5, v5, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v5, v5, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/heitao/platform/common/HTPDBHelper;->queryWithUserName(Ljava/lang/String;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v0

    .line 670
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v5, "pwd_modifying"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 671
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 672
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "mobile"

    invoke-interface {v1, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    const-string v4, "newpwd"

    invoke-interface {v1, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    const-string v4, "vercode"

    invoke-interface {v1, v4, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 675
    const-string v4, "uid"

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "htp_bind_key"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 677
    const-string v5, "htp_bind_key"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 676
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 678
    .local v2, "str":Ljava/lang/String;
    const-string v4, "sign"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    const-string v3, "http://api.heitao.com/user/mobileEditPasswd"

    .line 681
    .local v3, "url":Ljava/lang/String;
    new-instance v4, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v4}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v5, Lcom/heitao/platform/activity/HTPUserCenterActivity$20;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$20;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v4, v3, v1, v5}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto/16 :goto_0
.end method

.method private doBindNewPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "oldNumber"    # Ljava/lang/String;
    .param p2, "newNumber"    # Ljava/lang/String;
    .param p3, "verfyCode"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 761
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 762
    :cond_0
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "htp_please_input_phone"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 763
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 810
    :goto_0
    return-void

    .line 766
    :cond_1
    invoke-static {p3}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 767
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v5, "htp_please_input_verfy_code"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 770
    :cond_2
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v4

    .line 771
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v5

    iget-object v5, v5, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v5, v5, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/heitao/platform/common/HTPDBHelper;->queryWithUserName(Ljava/lang/String;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v0

    .line 772
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v5, "htp_bind_ing"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 773
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 775
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "mobile"

    invoke-interface {v1, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 776
    const-string v4, "omobile"

    invoke-interface {v1, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 777
    const-string v4, "vercode"

    invoke-interface {v1, v4, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 778
    const-string v4, "uid"

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 779
    const-string v4, "username"

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 780
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "htp_bind_key"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 781
    const-string v5, "htp_bind_key"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 780
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 782
    .local v2, "str":Ljava/lang/String;
    const-string v4, "sign"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 784
    const-string v3, "http://api.heitao.com/user/mobileBindUpdate"

    .line 785
    .local v3, "url":Ljava/lang/String;
    new-instance v4, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v4}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v5, Lcom/heitao/platform/activity/HTPUserCenterActivity$22;

    invoke-direct {v5, p0, p2, v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$22;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Ljava/lang/String;Lcom/heitao/platform/model/HTPDBUser;)V

    invoke-virtual {v4, v3, v1, v5}, Lcom/heitao/platform/request/HTPNullResponeParser;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto/16 :goto_0
.end method

.method private doBindPhone(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "verfyCode"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 708
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 709
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v5, "htp_please_input_phone"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 757
    :goto_0
    return-void

    .line 713
    :cond_0
    invoke-static {p2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 714
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v5, "htp_please_input_verfy_code"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 717
    :cond_1
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v4

    .line 718
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v5

    iget-object v5, v5, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v5, v5, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/heitao/platform/common/HTPDBHelper;->queryWithUserName(Ljava/lang/String;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v0

    .line 719
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v5, "htp_bind_ing"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 720
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 722
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "mobile"

    invoke-interface {v1, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    const-string v4, "vercode"

    invoke-interface {v1, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    const-string v4, "uid"

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    const-string v4, "username"

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 726
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "htp_bind_key"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 727
    const-string v5, "htp_bind_key"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 726
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 728
    .local v2, "str":Ljava/lang/String;
    const-string v4, "sign"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 730
    const-string v3, "http://api.heitao.com/user/mobileBind"

    .line 731
    .local v3, "url":Ljava/lang/String;
    new-instance v4, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v4}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v5, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;

    invoke-direct {v5, p0, v0, p1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$21;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Lcom/heitao/platform/model/HTPDBUser;Ljava/lang/String;)V

    invoke-virtual {v4, v3, v1, v5}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto/16 :goto_0
.end method

.method private doChangePassWord(Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 9
    .param p1, "newET"    # Landroid/widget/EditText;
    .param p2, "oldET"    # Landroid/widget/EditText;

    .prologue
    const/4 v8, 0x0

    .line 550
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 551
    .local v3, "oldPwd":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    .line 553
    .local v2, "newPwd":Ljava/lang/String;
    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 554
    :cond_0
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "pwd_shouldbe_filledin"

    invoke-static {p0, v7}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    .line 555
    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 607
    :goto_0
    return-void

    .line 559
    :cond_1
    const-string v6, "^.{6,16}$"

    invoke-virtual {v2, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 560
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "pwd_length_limit"

    invoke-static {p0, v7}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    .line 561
    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 565
    :cond_2
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v6

    .line 566
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v7

    iget-object v7, v7, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v7, v7, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/heitao/platform/common/HTPDBHelper;->queryWithUserName(Ljava/lang/String;)Lcom/heitao/platform/model/HTPDBUser;

    move-result-object v0

    .line 567
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    .line 568
    .local v5, "userName":Ljava/lang/String;
    invoke-static {v5}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 569
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "account_shouldbe_filledin"

    invoke-static {p0, v7}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    .line 570
    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 574
    :cond_3
    const-string v6, "pwd_modifying"

    invoke-static {p0, v6}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 575
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 576
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_4

    iget-object v6, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-static {v6}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 577
    const-string v6, "uid"

    iget-object v7, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 579
    :cond_4
    const-string v6, "username"

    invoke-interface {v1, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 580
    const-string v6, "oldpwd"

    invoke-interface {v1, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    const-string v6, "newpwd"

    invoke-interface {v1, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 582
    const-string v4, "http://api.heitao.com/user/editpasswd"

    .line 583
    .local v4, "url":Ljava/lang/String;
    new-instance v6, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v6}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v7, Lcom/heitao/platform/activity/HTPUserCenterActivity$18;

    invoke-direct {v7, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$18;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v6, v4, v1, v7}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto/16 :goto_0
.end method

.method private getPhoneVerfyCode(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/activity/view/MyCountDownBt;)V
    .locals 5
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "countDownBt"    # Lcom/heitao/platform/activity/view/MyCountDownBt;

    .prologue
    .line 610
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 611
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v3, "htp_please_input_phone"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 644
    :goto_0
    return-void

    .line 615
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    const-string v3, "htp_get_ing"

    invoke-static {p0, v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 616
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 618
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "mobile"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 619
    const-string v2, "type"

    invoke-interface {v0, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    const-string v1, "http://api.heitao.com/user/sendSms"

    .line 622
    .local v1, "url":Ljava/lang/String;
    new-instance v2, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v2}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v3, Lcom/heitao/platform/activity/HTPUserCenterActivity$19;

    invoke-direct {v3, p0, p3}, Lcom/heitao/platform/activity/HTPUserCenterActivity$19;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Lcom/heitao/platform/activity/view/MyCountDownBt;)V

    invoke-virtual {v2, v1, v0, v3}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    goto :goto_0
.end method

.method private initFliper()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 343
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_0

    .line 344
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 346
    :cond_0
    new-instance v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity$7;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    .line 365
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 366
    invoke-direct {v0, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 365
    iput-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 367
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 368
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 369
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 370
    return-void
.end method

.method private initView()V
    .locals 5

    .prologue
    const/16 v4, 0x18c

    const/4 v2, -0x1

    const/4 v3, 0x0

    .line 217
    const-string v1, "htp_center_container"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    .line 218
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 220
    .local v0, "containerParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->isScreenChange()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 222
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 223
    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 229
    :goto_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    const-string v1, "htp_user_logout"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->exitBT:Landroid/widget/TextView;

    .line 232
    const-string v1, "htp_user_center_account"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->accountTV:Landroid/widget/TextView;

    .line 233
    const-string v1, "htp_center_login_type_icon"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->accountIcon:Landroid/widget/ImageView;

    .line 234
    const-string v1, "htp_user_center_back"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->backIcon:Landroid/widget/ImageView;

    .line 236
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    if-eqz v1, :cond_0

    .line 237
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->accountTV:Landroid/widget/TextView;

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v2, v2, Lcom/heitao/platform/model/HTPUser;->userName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 240
    :cond_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->exitBT:Landroid/widget/TextView;

    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$2;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$2;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 249
    const-string v1, "htp_user_center_back"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->backIcon:Landroid/widget/ImageView;

    .line 250
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->backIcon:Landroid/widget/ImageView;

    new-instance v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$3;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 281
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->initFliper()V

    .line 282
    invoke-direct {p0, v3}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->setBaseView(Z)V

    .line 283
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    sget-object v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BASE_VIEW:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v1, v2}, Lcom/heitao/platform/activity/view/UserCenterStack;->push(Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;)Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 284
    return-void

    .line 225
    :cond_1
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 226
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    goto/16 :goto_0
.end method

.method private setBaseView(Z)V
    .locals 8
    .param p1, "isBack"    # Z

    .prologue
    .line 287
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    if-nez v5, :cond_0

    .line 288
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    const-string v6, "htp_user_center_item_view"

    invoke-static {p0, v6}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    .line 290
    :cond_0
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v5}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 291
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    iget-object v6, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    invoke-virtual {v5, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 294
    if-eqz p1, :cond_1

    .line 295
    const-string v5, "htp_slidein_right"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-static {p0, v5}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v2

    .line 296
    .local v2, "login_anim":Landroid/view/animation/Animation;
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    invoke-virtual {v5, v2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 297
    invoke-virtual {v2}, Landroid/view/animation/Animation;->start()V

    .line 300
    .end local v2    # "login_anim":Landroid/view/animation/Animation;
    :cond_1
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    .line 301
    const-string v6, "htp_switch_account"

    invoke-static {p0, v6}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 300
    check-cast v4, Landroid/widget/RelativeLayout;

    .line 302
    .local v4, "switchAccountBT":Landroid/widget/RelativeLayout;
    new-instance v5, Lcom/heitao/platform/activity/HTPUserCenterActivity$4;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$4;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 311
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    const-string v6, "htp_change_pwd"

    invoke-static {p0, v6}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    .line 312
    .local v1, "changePwdBT":Landroid/widget/RelativeLayout;
    new-instance v5, Lcom/heitao/platform/activity/HTPUserCenterActivity$5;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$5;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 319
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    const-string v6, "htp_bind_phone"

    invoke-static {p0, v6}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 320
    .local v0, "bindPhoneBT":Landroid/widget/RelativeLayout;
    new-instance v5, Lcom/heitao/platform/activity/HTPUserCenterActivity$6;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$6;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 331
    iget-object v5, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    const-string v6, "htp_ucenter_bind_phone_tv"

    invoke-static {p0, v6}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 332
    .local v3, "phoneTV":Landroid/widget/TextView;
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v5

    iget-object v5, v5, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    if-eqz v5, :cond_2

    .line 333
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v5

    iget-object v5, v5, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v5, v5, Lcom/heitao/platform/model/HTPUser;->mobile:Ljava/lang/String;

    invoke-static {v5}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 334
    const-string v5, "htp_bind_phone_title"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 340
    :cond_2
    :goto_0
    return-void

    .line 336
    :cond_3
    const-string v5, "htp_user_center_switch_phone"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 850
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v2, 0x4

    if-ne v0, v2, :cond_1

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    .line 851
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->size()I

    move-result v0

    if-lt v0, v1, :cond_0

    .line 852
    invoke-static {}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->$SWITCH_TABLE$com$heitao$platform$activity$HTPUserCenterActivity$PAGE_CENTER()[I

    move-result-object v2

    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ordinal()I

    move-result v0

    aget v0, v2, v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    move v0, v1

    .line 878
    :goto_1
    return v0

    .line 854
    :pswitch_0
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->finish()V

    goto :goto_0

    .line 857
    :pswitch_1
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    const/4 v2, 0x7

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 860
    :pswitch_2
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 863
    :pswitch_3
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    const/16 v2, 0xd

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 866
    :pswitch_4
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 869
    :pswitch_5
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    const/16 v2, 0x9

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 878
    :cond_1
    invoke-super {p0, p1}, Lcom/heitao/platform/activity/HTPBaseActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_1

    .line 852
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public isScreenChange()Z
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 883
    iget-object v3, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 884
    .local v0, "mConfiguration":Landroid/content/res/Configuration;
    iget v1, v0, Landroid/content/res/Configuration;->orientation:I

    .line 885
    .local v1, "ori":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_1

    .line 892
    :cond_0
    :goto_0
    return v2

    .line 888
    :cond_1
    if-ne v1, v2, :cond_0

    .line 890
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 84
    invoke-super {p0, p1}, Lcom/heitao/platform/activity/HTPBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 85
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->clear()V

    .line 90
    :goto_0
    new-instance v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;

    invoke-direct {v0, p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity$1;-><init>(Lcom/heitao/platform/activity/HTPUserCenterActivity;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    .line 209
    const-string v0, "htp_activity_ucenter"

    invoke-static {p0, v0}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->setContentView(I)V

    .line 210
    iput-object p0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    .line 211
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    .line 213
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPUserCenterActivity;->initView()V

    .line 214
    return-void

    .line 88
    :cond_0
    new-instance v0, Lcom/heitao/platform/activity/view/UserCenterStack;

    invoke-direct {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;-><init>()V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 814
    invoke-super {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;->onDestroy()V

    .line 815
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    .line 816
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->container:Landroid/widget/RelativeLayout;

    .line 818
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_1

    .line 819
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->mFlipper:Landroid/widget/ViewFlipper;

    .line 821
    :cond_1
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    if-eqz v0, :cond_2

    .line 822
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->context:Landroid/content/Context;

    .line 824
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    if-eqz v0, :cond_3

    .line 825
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->baseView:Landroid/view/View;

    .line 827
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePWDView:Landroid/view/View;

    if-eqz v0, :cond_4

    .line 828
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->changePWDView:Landroid/view/View;

    .line 830
    :cond_4
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    if-eqz v0, :cond_5

    .line 831
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindNewPhoneView:Landroid/view/View;

    .line 833
    :cond_5
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->forgetView:Landroid/view/View;

    if-eqz v0, :cond_6

    .line 834
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->forgetView:Landroid/view/View;

    .line 836
    :cond_6
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindPhoneView:Landroid/view/View;

    if-eqz v0, :cond_7

    .line 837
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->bindPhoneView:Landroid/view/View;

    .line 839
    :cond_7
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    if-eqz v0, :cond_8

    .line 840
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/UserCenterStack;->clear()V

    .line 841
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->pageStack:Lcom/heitao/platform/activity/view/UserCenterStack;

    .line 843
    :cond_8
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    if-eqz v0, :cond_9

    .line 844
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPUserCenterActivity;->innerHandler:Landroid/os/Handler;

    .line 846
    :cond_9
    return-void
.end method
