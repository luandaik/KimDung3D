.class public Lcom/heitao/platform/activity/HTPPlatformLoginActivity;
.super Lcom/heitao/platform/activity/HTPBaseActivity;
.source "HTPPlatformLoginActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$heitao$platform$activity$HTPPlatformLoginActivity$PAGE:[I = null

.field public static final ACTIVITY_FINISH:I = 0xf

.field public static final ENTER_FIRST_LOGIN_FROM_NOTFIRST_LOGIN:I = 0x1

.field public static final ENTER_HT_COUSTOMER:I = 0x4

.field public static final ENTER_HT_FORGET:I = 0xb

.field public static final ENTER_HT_LOGIN:I = 0x3

.field public static final ENTER_HT_PHONE:I = 0x5

.field public static final ENTER_HT_REGISTER:I = 0x9

.field public static final FIRST_LOGIN_BACK_FROM_CUSTOMER_LOGIN:I = 0x7

.field public static final FIRST_LOGIN_BACK_FROM_HT_LOGIN:I = 0x6

.field public static final FIRST_LOGIN_BACK_FROM_PHONE_LOGIN:I = 0x8

.field public static final HT_FORGET_BACK_FROM_PHONE_LOGIN:I = 0xd

.field public static final HT_LOGIN_BACK_FROM_HT_FORGET:I = 0xc

.field public static final HT_LOGIN_BACK_FROM_HT_REGISTER:I = 0xa

.field public static final NOTFIRST_LOGIN_BACK_FROM_FIRST_LOGIN:I = 0x2

.field public static final SHOW_STATEMENT_DAILOG:I = 0xe

.field private static innerHandler:Landroid/os/Handler;

.field public static mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

.field public static pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;


# instance fields
.field private HTCustomerLoginView:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

.field private HTFirstLoginView:Lcom/heitao/platform/activity/view/HTFirstLoginView;

.field private HTLoginView:Lcom/heitao/platform/activity/view/HTLoginView;

.field private HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

.field private HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

.field private container:Landroid/widget/LinearLayout;

.field private flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

.field private mFlipper:Landroid/widget/ViewFlipper;

.field private mPopupWindow:Landroid/widget/PopupWindow;


# direct methods
.method static synthetic $SWITCH_TABLE$com$heitao$platform$activity$HTPPlatformLoginActivity$PAGE()[I
    .locals 3

    .prologue
    .line 38
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->$SWITCH_TABLE$com$heitao$platform$activity$HTPPlatformLoginActivity$PAGE:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->values()[Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->FIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_d

    :goto_1
    :try_start_1
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_c

    :goto_2
    :try_start_2
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMERBINDPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_b

    :goto_3
    :try_start_3
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_a

    :goto_4
    :try_start_4
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINBIND:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_9

    :goto_5
    :try_start_5
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINFORGET:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_8

    :goto_6
    :try_start_6
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_7

    :goto_7
    :try_start_7
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINREGISTERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_6

    :goto_8
    :try_start_8
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTLOGINT:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_5

    :goto_9
    :try_start_9
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_4

    :goto_a
    :try_start_a
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_3

    :goto_b
    :try_start_b
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEREGISTERCOMPLETE:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_2

    :goto_c
    :try_start_c
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTPHONEVERFYLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_1

    :goto_d
    :try_start_d
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->NOTFIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_0

    :goto_e
    sput-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->$SWITCH_TABLE$com$heitao$platform$activity$HTPPlatformLoginActivity$PAGE:[I

    goto/16 :goto_0

    :catch_0
    move-exception v1

    goto :goto_e

    :catch_1
    move-exception v1

    goto :goto_d

    :catch_2
    move-exception v1

    goto :goto_c

    :catch_3
    move-exception v1

    goto :goto_b

    :catch_4
    move-exception v1

    goto :goto_a

    :catch_5
    move-exception v1

    goto :goto_9

    :catch_6
    move-exception v1

    goto :goto_8

    :catch_7
    move-exception v1

    goto :goto_7

    :catch_8
    move-exception v1

    goto :goto_6

    :catch_9
    move-exception v1

    goto :goto_5

    :catch_a
    move-exception v1

    goto :goto_4

    :catch_b
    move-exception v1

    goto/16 :goto_3

    :catch_c
    move-exception v1

    goto/16 :goto_2

    :catch_d
    move-exception v1

    goto/16 :goto_1
.end method

.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 71
    sput-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    .line 89
    sput-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Z)V
    .locals 0

    .prologue
    .line 216
    invoke-direct {p0, p1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->setHTFirstLoginView(Z)V

    return-void
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Z)V
    .locals 0

    .prologue
    .line 239
    invoke-direct {p0, p1}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->setHTLoginView(Z)V

    return-void
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V
    .locals 0

    .prologue
    .line 290
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->setHTPlatformLoginView()V

    return-void
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V
    .locals 0

    .prologue
    .line 309
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->setHTCustomerLoginView()V

    return-void
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V
    .locals 0

    .prologue
    .line 328
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->setHTPhoneLoginView()V

    return-void
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)Lcom/heitao/platform/activity/view/HTHTLoginView;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    return-object v0
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V
    .locals 0

    .prologue
    .line 344
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->showDailog()V

    return-void
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)Landroid/widget/ViewFlipper;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mFlipper:Landroid/widget/ViewFlipper;

    return-object v0
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)Landroid/widget/PopupWindow;
    .locals 1

    .prologue
    .line 343
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method private initFliper()V
    .locals 2

    .prologue
    const/4 v1, -0x2

    .line 262
    new-instance v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$2;

    invoke-direct {v0, p0, p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$2;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mFlipper:Landroid/widget/ViewFlipper;

    .line 279
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 280
    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 279
    iput-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 281
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 282
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 283
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mFlipper:Landroid/widget/ViewFlipper;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->flipperparams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 285
    return-void
.end method

.method private initLoginActivity()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 194
    const/4 v1, 0x0

    .line 196
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    :try_start_0
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/heitao/platform/common/HTPDBHelper;->query()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 200
    :goto_0
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 202
    :cond_0
    invoke-direct {p0, v3}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->setHTFirstLoginView(Z)V

    .line 203
    sget-object v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v3, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->FIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v2, v3}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 210
    :goto_1
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->initFliper()V

    .line 211
    return-void

    .line 197
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0

    .line 206
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-direct {p0, v3}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->setHTLoginView(Z)V

    .line 207
    sget-object v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    sget-object v3, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->NOTFIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v2, v3}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    goto :goto_1
.end method

.method private setHTCustomerLoginView()V
    .locals 3

    .prologue
    .line 316
    new-instance v1, Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    sget-object v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTCustomerLoginView:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    .line 317
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTCustomerLoginView:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->createView()V

    .line 318
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 319
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTCustomerLoginView:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 320
    const-string v1, "htp_slidein_left"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 321
    .local v0, "login_anim":Landroid/view/animation/Animation;
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTCustomerLoginView:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 322
    invoke-virtual {v0}, Landroid/view/animation/Animation;->start()V

    .line 323
    return-void
.end method

.method private setHTFirstLoginView(Z)V
    .locals 3
    .param p1, "isBack"    # Z

    .prologue
    .line 217
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTFirstLoginView:Lcom/heitao/platform/activity/view/HTFirstLoginView;

    if-nez v1, :cond_0

    .line 218
    new-instance v1, Lcom/heitao/platform/activity/view/HTFirstLoginView;

    sget-object v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2}, Lcom/heitao/platform/activity/view/HTFirstLoginView;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTFirstLoginView:Lcom/heitao/platform/activity/view/HTFirstLoginView;

    .line 220
    :cond_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTFirstLoginView:Lcom/heitao/platform/activity/view/HTFirstLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTFirstLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_1

    .line 221
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTFirstLoginView:Lcom/heitao/platform/activity/view/HTFirstLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTFirstLoginView;->createView()V

    .line 223
    :cond_1
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 224
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTFirstLoginView:Lcom/heitao/platform/activity/view/HTFirstLoginView;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/view/HTFirstLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 226
    if-eqz p1, :cond_2

    .line 227
    const-string v1, "htp_slidein_right"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 232
    .local v0, "login_anim":Landroid/view/animation/Animation;
    :goto_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTFirstLoginView:Lcom/heitao/platform/activity/view/HTFirstLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTFirstLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 233
    invoke-virtual {v0}, Landroid/view/animation/Animation;->start()V

    .line 234
    return-void

    .line 229
    .end local v0    # "login_anim":Landroid/view/animation/Animation;
    :cond_2
    const-string v1, "htp_slidein_left"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .restart local v0    # "login_anim":Landroid/view/animation/Animation;
    goto :goto_0
.end method

.method private setHTLoginView(Z)V
    .locals 3
    .param p1, "isBack"    # Z

    .prologue
    .line 240
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTLoginView:Lcom/heitao/platform/activity/view/HTLoginView;

    if-nez v1, :cond_0

    .line 241
    new-instance v1, Lcom/heitao/platform/activity/view/HTLoginView;

    sget-object v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2}, Lcom/heitao/platform/activity/view/HTLoginView;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTLoginView:Lcom/heitao/platform/activity/view/HTLoginView;

    .line 243
    :cond_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTLoginView:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_1

    .line 244
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTLoginView:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->createView()V

    .line 246
    :cond_1
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 247
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTLoginView:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/view/HTLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 251
    if-eqz p1, :cond_2

    .line 252
    const-string v1, "htp_slidein_right"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 256
    .local v0, "login_anim":Landroid/view/animation/Animation;
    :goto_0
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTLoginView:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 257
    invoke-virtual {v0}, Landroid/view/animation/Animation;->start()V

    .line 259
    return-void

    .line 254
    .end local v0    # "login_anim":Landroid/view/animation/Animation;
    :cond_2
    const-string v1, "htp_slidein_left"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .restart local v0    # "login_anim":Landroid/view/animation/Animation;
    goto :goto_0
.end method

.method private setHTPhoneLoginView()V
    .locals 3

    .prologue
    .line 335
    new-instance v1, Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    sget-object v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    .line 336
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->createView()V

    .line 337
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 338
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 339
    const-string v1, "htp_slidein_left"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 340
    .local v0, "login_anim":Landroid/view/animation/Animation;
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 341
    invoke-virtual {v0}, Landroid/view/animation/Animation;->start()V

    .line 342
    return-void
.end method

.method private setHTPlatformLoginView()V
    .locals 3

    .prologue
    .line 297
    new-instance v1, Lcom/heitao/platform/activity/view/HTHTLoginView;

    sget-object v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2}, Lcom/heitao/platform/activity/view/HTHTLoginView;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    .line 298
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->createView()V

    .line 299
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 300
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v2}, Lcom/heitao/platform/activity/view/HTHTLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 301
    const-string v1, "htp_slidein_left"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 302
    .local v0, "login_anim":Landroid/view/animation/Animation;
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->getFrameBound()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 303
    invoke-virtual {v0}, Landroid/view/animation/Animation;->start()V

    .line 304
    return-void
.end method

.method private showDailog()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/4 v8, -0x1

    const/4 v7, 0x1

    .line 345
    sget-object v4, Lcom/heitao/platform/common/HTPConsts;->POLICY_URL:Ljava/lang/String;

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 346
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    if-nez v4, :cond_0

    .line 347
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const-string v5, "htp_privacy_state_dailog_view"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 348
    .local v1, "view":Landroid/view/View;
    new-instance v4, Landroid/widget/PopupWindow;

    invoke-direct {v4, v1, v8, v8, v7}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v4, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    .line 351
    .end local v1    # "view":Landroid/view/View;
    :cond_0
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v4, v7}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 352
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v4, v7}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 353
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v4}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v4

    const-string v5, "htp_web"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/webkit/WebView;

    .line 354
    .local v3, "webView":Landroid/webkit/WebView;
    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    .line 355
    .local v2, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v2, v7}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 356
    invoke-virtual {v2, v7}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 357
    invoke-virtual {v2, v7}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 358
    invoke-virtual {v2, v7}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 359
    sget-object v4, Lcom/heitao/platform/common/HTPConsts;->POLICY_URL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 360
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v4}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v4

    const-string v5, "htp_web_close"

    invoke-static {p0, v5}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 361
    .local v0, "close":Landroid/widget/ImageView;
    new-instance v4, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$3;

    invoke-direct {v4, p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$3;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 368
    iget-object v4, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    iget-object v5, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    const/16 v6, 0x11

    invoke-virtual {v4, v5, v6, v9, v9}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 370
    .end local v0    # "close":Landroid/widget/ImageView;
    .end local v2    # "webSettings":Landroid/webkit/WebSettings;
    .end local v3    # "webView":Landroid/webkit/WebView;
    :cond_1
    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 7
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v6, 0x6

    const/4 v5, 0x2

    const/16 v4, 0x8

    const/4 v3, 0x7

    const/4 v2, 0x4

    .line 404
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    if-ne v0, v2, :cond_5

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_5

    .line 405
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->size()I

    move-result v0

    if-lt v0, v5, :cond_0

    .line 406
    invoke-static {}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->$SWITCH_TABLE$com$heitao$platform$activity$HTPPlatformLoginActivity$PAGE()[I

    move-result-object v1

    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    .line 473
    :cond_0
    :goto_0
    :pswitch_0
    const/4 v0, 0x1

    .line 475
    :goto_1
    return v0

    .line 408
    :pswitch_1
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    invoke-virtual {v0, v5}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 411
    :pswitch_2
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    invoke-virtual {v0, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 414
    :pswitch_3
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 417
    :pswitch_4
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->size()I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_1

    .line 418
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    .line 419
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 421
    :cond_1
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 430
    :pswitch_5
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    .line 431
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 434
    :pswitch_6
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    .line 435
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 439
    :pswitch_7
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->size()I

    move-result v0

    if-le v0, v2, :cond_2

    .line 440
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    .line 441
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 443
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    .line 444
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 449
    :pswitch_8
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->size()I

    move-result v0

    const/4 v1, 0x5

    if-le v0, v1, :cond_3

    .line 450
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    .line 451
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 453
    :cond_3
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    .line 454
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 459
    :pswitch_9
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->size()I

    move-result v0

    if-le v0, v2, :cond_4

    .line 460
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    .line 461
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPlatformLoginView:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 463
    :cond_4
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView;->getOwnHandler()Landroid/os/Handler;

    move-result-object v0

    .line 464
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTPhoneLoginView:Lcom/heitao/platform/activity/view/HTPhoneLoginView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 475
    :cond_5
    invoke-super {p0, p1}, Lcom/heitao/platform/activity/HTPBaseActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto/16 :goto_1

    .line 406
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation

    .prologue
    .line 94
    invoke-super {p0, p1}, Lcom/heitao/platform/activity/HTPBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 95
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 96
    const-string v2, "htp_activity_platform_login"

    invoke-static {p0, v2}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 97
    .local v0, "layout":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->setContentView(Landroid/view/View;)V

    .line 98
    const-string v1, "login_container_layout"

    invoke-static {p0, v1}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->container:Landroid/widget/LinearLayout;

    .line 100
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    if-eqz v1, :cond_0

    .line 101
    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v1}, Lcom/heitao/platform/activity/view/LoginPageStack;->clear()V

    .line 107
    :goto_0
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    sput-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    .line 109
    new-instance v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;

    invoke-direct {v1, p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$1;-><init>(Lcom/heitao/platform/activity/HTPPlatformLoginActivity;)V

    sput-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->innerHandler:Landroid/os/Handler;

    .line 189
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->initLoginActivity()V

    .line 191
    return-void

    .line 103
    :cond_0
    new-instance v1, Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-direct {v1}, Lcom/heitao/platform/activity/view/LoginPageStack;-><init>()V

    sput-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 392
    invoke-super {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;->onDestroy()V

    .line 393
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    .line 394
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mPopupWindow:Landroid/widget/PopupWindow;

    .line 396
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mFlipper:Landroid/widget/ViewFlipper;

    if-eqz v0, :cond_1

    .line 397
    iput-object v1, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->mFlipper:Landroid/widget/ViewFlipper;

    .line 400
    :cond_1
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 374
    invoke-super {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;->onResume()V

    .line 375
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->NOTFIRSTLOGIN:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_0

    .line 376
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTLoginView:Lcom/heitao/platform/activity/view/HTLoginView;

    if-eqz v0, :cond_0

    .line 378
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTLoginView:Lcom/heitao/platform/activity/view/HTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTLoginView;->setAccount()V

    .line 381
    :cond_0
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->peek()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;->HTCUSTOMER:Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    if-ne v0, v1, :cond_1

    .line 382
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTCustomerLoginView:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    if-eqz v0, :cond_1

    .line 384
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->HTCustomerLoginView:Lcom/heitao/platform/activity/view/HTCustomerLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTCustomerLoginView;->setAccount()V

    .line 388
    :cond_1
    return-void
.end method
