.class public Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;
.super Ljava/lang/Object;
.source "HTPFloatMenuWindow.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;
    }
.end annotation


# static fields
.field private static mInstance:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;


# instance fields
.field private HIDE_ICON:I

.field private floatIconView:Landroid/widget/RelativeLayout;

.field private fround:Landroid/widget/RelativeLayout;

.field private hideTimer:Ljava/util/Timer;

.field private iconWith:I

.field private isIconHide:Z

.field private isLeft:Z

.field private itemWith:I

.field private mActivity:Landroid/app/Activity;

.field private mCurrentX:I

.field private mCurrentY:I

.field private mHandler:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

.field private menuFound:Landroid/widget/RelativeLayout;

.field private menuView:Landroid/widget/RelativeLayout;

.field public menuWin:Landroid/widget/PopupWindow;

.field private menuWith:I

.field private models:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/heitao/platform/activity/view/menu/HTPMenuModel;",
            ">;"
        }
    .end annotation
.end field

.field private moveData:I

.field public popupWin:Landroid/widget/PopupWindow;

.field private scale_h:F

.field private scale_w:F

.field private screenHeight:I

.field private screenWidth:I

.field private showING:Z

.field private slidWith:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mInstance:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    iput-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    .line 62
    iput v2, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    .line 63
    const/high16 v0, 0x42640000    # 57.0f

    iget v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentY:I

    .line 74
    iput v2, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->moveData:I

    .line 76
    const/4 v0, 0x4

    iput v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->HIDE_ICON:I

    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->isLeft:Z

    .line 84
    iput-boolean v2, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->isIconHide:Z

    .line 85
    iput-boolean v2, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->showING:Z

    .line 549
    new-instance v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    invoke-direct {v0, p0, v3}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;-><init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mHandler:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    .line 676
    iput-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    .line 41
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V
    .locals 0

    .prologue
    .line 537
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideMenuWindow()V

    return-void
.end method

.method static synthetic access$1(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V
    .locals 0

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->startTimer()V

    return-void
.end method

.method static synthetic access$10(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)F
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    return v0
.end method

.method static synthetic access$11(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)F
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_w:F

    return v0
.end method

.method static synthetic access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V
    .locals 0

    .prologue
    .line 62
    iput p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    return-void
.end method

.method static synthetic access$13(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V
    .locals 0

    .prologue
    .line 84
    iput-boolean p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->isIconHide:Z

    return-void
.end method

.method static synthetic access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->screenWidth:I

    return v0
.end method

.method static synthetic access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I
    .locals 1

    .prologue
    .line 57
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    return v0
.end method

.method static synthetic access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    return v0
.end method

.method static synthetic access$17(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->moveData:I

    return v0
.end method

.method static synthetic access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentY:I

    return v0
.end method

.method static synthetic access$19(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->HIDE_ICON:I

    return v0
.end method

.method static synthetic access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;
    .locals 1

    .prologue
    .line 549
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mHandler:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    return-object v0
.end method

.method static synthetic access$20(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V
    .locals 0

    .prologue
    .line 80
    iput-boolean p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->isLeft:Z

    return-void
.end method

.method static synthetic access$21(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z
    .locals 1

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->showING:Z

    return v0
.end method

.method static synthetic access$22(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z
    .locals 1

    .prologue
    .line 84
    iget-boolean v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->isIconHide:Z

    return v0
.end method

.method static synthetic access$23(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V
    .locals 0

    .prologue
    .line 112
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->stopTimer()V

    return-void
.end method

.method static synthetic access$24(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V
    .locals 0

    .prologue
    .line 63
    iput p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentY:I

    return-void
.end method

.method static synthetic access$25(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->screenHeight:I

    return v0
.end method

.method static synthetic access$26(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V
    .locals 0

    .prologue
    .line 678
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->initData()V

    return-void
.end method

.method static synthetic access$27(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Landroid/app/Activity;Z)V
    .locals 0

    .prologue
    .line 316
    invoke-direct {p0, p1, p2}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->showMenuWindow(Landroid/app/Activity;Z)V

    return-void
.end method

.method static synthetic access$28(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V
    .locals 0

    .prologue
    .line 74
    iput p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->moveData:I

    return-void
.end method

.method static synthetic access$3(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z
    .locals 1

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->isLeft:Z

    return v0
.end method

.method static synthetic access$4(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuView:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$5(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->slidWith:I

    return v0
.end method

.method static synthetic access$6(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Ljava/util/Timer;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideTimer:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$7(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V
    .locals 0

    .prologue
    .line 85
    iput-boolean p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->showING:Z

    return-void
.end method

.method static synthetic access$8(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->floatIconView:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method private buildBasicMenu(Landroid/app/Activity;Z)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "isLeft"    # Z

    .prologue
    .line 356
    return-void
.end method

.method private buildMenu(Landroid/app/Activity;Z)V
    .locals 30
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "isLeft"    # Z

    .prologue
    .line 359
    move-object/from16 v3, p1

    .line 360
    .local v3, "activity":Landroid/app/Activity;
    const v26, 0x43a68000    # 333.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWith:I

    .line 361
    const v26, 0x43928000    # 293.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->slidWith:I

    .line 362
    const/high16 v26, 0x437d0000    # 253.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->itemWith:I

    .line 364
    new-instance v26, Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    move-object/from16 v27, v0

    invoke-direct/range {v26 .. v27}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuFound:Landroid/widget/RelativeLayout;

    .line 365
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuFound:Landroid/widget/RelativeLayout;

    move-object/from16 v26, v0

    new-instance v27, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWith:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    move/from16 v29, v0

    invoke-direct/range {v27 .. v29}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual/range {v26 .. v27}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 368
    new-instance v8, Landroid/widget/RelativeLayout;

    invoke-direct {v8, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 369
    .local v8, "icon":Landroid/widget/RelativeLayout;
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    move/from16 v27, v0

    move/from16 v0, v26

    move/from16 v1, v27

    invoke-direct {v9, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 370
    .local v9, "iconParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v26, 0xf

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 371
    if-eqz p2, :cond_0

    .line 372
    const/16 v26, 0x9

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 376
    :goto_0
    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 377
    const-string v26, "htp_float_icon"

    move-object/from16 v0, v26

    invoke-static {v3, v0}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v10

    .line 378
    .local v10, "icon_id":I
    invoke-virtual {v8, v10}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 380
    new-instance v19, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v19

    invoke-direct {v0, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 381
    .local v19, "menuLayout":Landroid/widget/RelativeLayout;
    new-instance v20, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->slidWith:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    move/from16 v27, v0

    move-object/from16 v0, v20

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 382
    .local v20, "menuParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v26, 0xf

    move-object/from16 v0, v20

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 383
    if-eqz p2, :cond_1

    .line 384
    const/16 v26, 0xb

    move-object/from16 v0, v20

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 388
    :goto_1
    invoke-virtual/range {v19 .. v20}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 390
    new-instance v26, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v26

    invoke-direct {v0, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuView:Landroid/widget/RelativeLayout;

    .line 391
    new-instance v21, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->slidWith:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    move/from16 v27, v0

    move-object/from16 v0, v21

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 392
    .local v21, "menuViewParams":Landroid/widget/RelativeLayout$LayoutParams;
    if-eqz p2, :cond_2

    .line 393
    const/16 v26, 0xb

    move-object/from16 v0, v21

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 397
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuView:Landroid/widget/RelativeLayout;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuView:Landroid/widget/RelativeLayout;

    move-object/from16 v26, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 400
    new-instance v16, Landroid/widget/LinearLayout;

    move-object/from16 v0, v16

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 401
    .local v16, "menuItemContainer":Landroid/widget/LinearLayout;
    const v26, 0x2d46c

    move-object/from16 v0, v16

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setId(I)V

    .line 402
    const/16 v26, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 403
    if-eqz p2, :cond_3

    .line 404
    const/16 v26, 0x5

    move-object/from16 v0, v16

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 408
    :goto_3
    new-instance v17, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->itemWith:I

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    move/from16 v27, v0

    move-object/from16 v0, v17

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 409
    .local v17, "menuItemContainerParams":Landroid/widget/RelativeLayout$LayoutParams;
    if-eqz p2, :cond_4

    .line 410
    const/16 v26, 0x9

    move-object/from16 v0, v17

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 414
    :goto_4
    invoke-virtual/range {v16 .. v17}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 415
    const-string v26, "htp_menu_bg"

    move-object/from16 v0, v26

    invoke-static {v3, v0}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v18

    .line 416
    .local v18, "menuItemID":I
    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 417
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuView:Landroid/widget/RelativeLayout;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 419
    new-instance v15, Landroid/widget/RelativeLayout;

    invoke-direct {v15, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 420
    .local v15, "menuCircle":Landroid/widget/RelativeLayout;
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    move/from16 v26, v0

    div-int/lit8 v26, v26, 0x2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    move/from16 v27, v0

    move/from16 v0, v26

    move/from16 v1, v27

    invoke-direct {v6, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 421
    .local v6, "circleParams":Landroid/widget/RelativeLayout$LayoutParams;
    if-eqz p2, :cond_5

    .line 423
    const/16 v26, 0x1

    invoke-virtual/range {v16 .. v16}, Landroid/widget/LinearLayout;->getId()I

    move-result v27

    move/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v6, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 424
    const-string v26, "htp_menu_left"

    move-object/from16 v0, v26

    invoke-static {v3, v0}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    .line 425
    .local v5, "circleID":I
    invoke-virtual {v15, v5}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 432
    :goto_5
    invoke-virtual {v15, v6}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 433
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuView:Landroid/widget/RelativeLayout;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v15}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 434
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v26

    move/from16 v0, v26

    new-array v4, v0, [Landroid/widget/RelativeLayout;

    .line 435
    .local v4, "arry_image":[Landroid/widget/RelativeLayout;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Ljava/util/List;->size()I

    move-result v26

    move/from16 v0, v26

    if-lt v7, v0, :cond_6

    .line 493
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuFound:Landroid/widget/RelativeLayout;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 494
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuFound:Landroid/widget/RelativeLayout;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 496
    new-instance v26, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;-><init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    move-object/from16 v0, v26

    invoke-virtual {v8, v0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 520
    return-void

    .line 374
    .end local v4    # "arry_image":[Landroid/widget/RelativeLayout;
    .end local v5    # "circleID":I
    .end local v6    # "circleParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v7    # "i":I
    .end local v10    # "icon_id":I
    .end local v15    # "menuCircle":Landroid/widget/RelativeLayout;
    .end local v16    # "menuItemContainer":Landroid/widget/LinearLayout;
    .end local v17    # "menuItemContainerParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v18    # "menuItemID":I
    .end local v19    # "menuLayout":Landroid/widget/RelativeLayout;
    .end local v20    # "menuParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v21    # "menuViewParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_0
    const/16 v26, 0xb

    move/from16 v0, v26

    invoke-virtual {v9, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto/16 :goto_0

    .line 386
    .restart local v10    # "icon_id":I
    .restart local v19    # "menuLayout":Landroid/widget/RelativeLayout;
    .restart local v20    # "menuParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_1
    const/16 v26, 0x9

    move-object/from16 v0, v20

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto/16 :goto_1

    .line 395
    .restart local v21    # "menuViewParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_2
    const/16 v26, 0x9

    move-object/from16 v0, v21

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto/16 :goto_2

    .line 406
    .restart local v16    # "menuItemContainer":Landroid/widget/LinearLayout;
    :cond_3
    const/16 v26, 0x3

    move-object/from16 v0, v16

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto/16 :goto_3

    .line 412
    .restart local v17    # "menuItemContainerParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_4
    const/16 v26, 0xb

    move-object/from16 v0, v17

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto/16 :goto_4

    .line 428
    .restart local v6    # "circleParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v15    # "menuCircle":Landroid/widget/RelativeLayout;
    .restart local v18    # "menuItemID":I
    :cond_5
    const/16 v26, 0x0

    invoke-virtual/range {v16 .. v16}, Landroid/widget/LinearLayout;->getId()I

    move-result v27

    move/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v6, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 429
    const-string v26, "htp_menu_right"

    move-object/from16 v0, v26

    invoke-static {v3, v0}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    .line 430
    .restart local v5    # "circleID":I
    invoke-virtual {v15, v5}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    goto/16 :goto_5

    .line 437
    .restart local v4    # "arry_image":[Landroid/widget/RelativeLayout;
    .restart local v7    # "i":I
    :cond_6
    new-instance v11, Landroid/widget/ImageView;

    invoke-direct {v11, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 438
    .local v11, "item_icon":Landroid/widget/ImageView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;

    invoke-virtual/range {v26 .. v26}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->getTitle()Ljava/lang/String;

    move-result-object v26

    const-string v27, "\u7528\u6237\u4e2d\u5fc3"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_9

    .line 439
    const-string v26, "ht_menu_item_user"

    move-object/from16 v0, v26

    invoke-static {v3, v0}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v11, v0}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 446
    :goto_7
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v26, 0x42380000    # 46.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    .line 447
    const/high16 v27, 0x42400000    # 48.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v28, v0

    mul-float v27, v27, v28

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 v27, v0

    .line 446
    move/from16 v0, v26

    move/from16 v1, v27

    invoke-direct {v12, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 448
    .local v12, "item_iconParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v26, 0xe

    move/from16 v0, v26

    invoke-virtual {v12, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 449
    const/16 v26, 0xc

    move/from16 v0, v26

    invoke-virtual {v12, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 450
    const/high16 v26, 0x41c00000    # 24.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    iput v0, v12, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 452
    new-instance v24, Landroid/widget/TextView;

    move-object/from16 v0, v24

    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 453
    .local v24, "title":Landroid/widget/TextView;
    const/16 v26, 0x11

    move-object/from16 v0, v24

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 454
    const-string v26, "#888888"

    invoke-static/range {v26 .. v26}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v26

    move-object/from16 v0, v24

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 455
    const/16 v26, 0x0

    const/high16 v27, 0x41980000    # 19.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_w:F

    move/from16 v28, v0

    mul-float v27, v27, v28

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 v27, v0

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, v24

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 456
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;

    invoke-virtual/range {v26 .. v26}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->getTitle()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 457
    new-instance v23, Landroid/widget/RelativeLayout$LayoutParams;

    .line 458
    const/16 v26, -0x2

    const/16 v27, -0x2

    .line 457
    move-object/from16 v0, v23

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 459
    .local v23, "textParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v26, 0xe

    move-object/from16 v0, v23

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 460
    const/16 v26, 0xc

    move-object/from16 v0, v23

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 461
    const/high16 v26, 0x41000000    # 8.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, v23

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 463
    new-instance v13, Landroid/widget/RelativeLayout;

    invoke-direct {v13, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 464
    .local v13, "line":Landroid/widget/RelativeLayout;
    const-string v26, "ht_menu_line"

    move-object/from16 v0, v26

    invoke-static {v3, v0}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 465
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v26, 0x40000000    # 2.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    .line 466
    const/high16 v27, 0x42400000    # 48.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v28, v0

    mul-float v27, v27, v28

    move/from16 v0, v27

    float-to-int v0, v0

    move/from16 v27, v0

    .line 465
    move/from16 v0, v26

    move/from16 v1, v27

    invoke-direct {v14, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 467
    .local v14, "lineParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v26, 0x9

    move/from16 v0, v26

    invoke-virtual {v14, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 468
    const/16 v26, 0xf

    move/from16 v0, v26

    invoke-virtual {v14, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 470
    new-instance v26, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v26

    invoke-direct {v0, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    aput-object v26, v4, v7

    .line 472
    aget-object v26, v4, v7

    add-int/lit16 v0, v7, 0x7d0

    move/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 473
    new-instance v22, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v26, 0x42c00000    # 96.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    move/from16 v27, v0

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    move/from16 v27, v0

    move-object/from16 v0, v22

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 474
    .local v22, "params":Landroid/widget/RelativeLayout$LayoutParams;
    aget-object v26, v4, v7

    move-object/from16 v0, v26

    invoke-virtual {v0, v11, v12}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 475
    aget-object v26, v4, v7

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 476
    const/16 v26, 0x2

    move/from16 v0, v26

    if-eq v7, v0, :cond_7

    const/16 v26, 0x1

    move/from16 v0, v26

    if-ne v7, v0, :cond_8

    .line 477
    :cond_7
    aget-object v26, v4, v7

    move-object/from16 v0, v26

    invoke-virtual {v0, v13, v14}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 479
    :cond_8
    aget-object v26, v4, v7

    move-object/from16 v0, v16

    move-object/from16 v1, v26

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;

    invoke-virtual/range {v26 .. v26}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->getUrl()Ljava/lang/String;

    move-result-object v25

    .line 481
    .local v25, "url":Ljava/lang/String;
    aget-object v26, v4, v7

    new-instance v27, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$3;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v3, v2}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$3;-><init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual/range {v26 .. v27}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 435
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_6

    .line 440
    .end local v12    # "item_iconParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v13    # "line":Landroid/widget/RelativeLayout;
    .end local v14    # "lineParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v22    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v23    # "textParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v24    # "title":Landroid/widget/TextView;
    .end local v25    # "url":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;

    invoke-virtual/range {v26 .. v26}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->getTitle()Ljava/lang/String;

    move-result-object v26

    const-string v27, "\u5ba2\u670d\u4e2d\u5fc3"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_a

    .line 441
    const-string v26, "ht_menu_item_kefu"

    move-object/from16 v0, v26

    invoke-static {v3, v0}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v11, v0}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_7

    .line 443
    :cond_a
    const-string v26, "ht_menu_item_user"

    move-object/from16 v0, v26

    invoke-static {v3, v0}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v11, v0}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto/16 :goto_7
.end method

.method public static getInstance()Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mInstance:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-direct {v0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;-><init>()V

    sput-object v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mInstance:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    .line 49
    :cond_0
    sget-object v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mInstance:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    return-object v0
.end method

.method private hideMenuWindow()V
    .locals 2

    .prologue
    .line 538
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 540
    :try_start_0
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 541
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 547
    :cond_0
    :goto_0
    return-void

    .line 542
    :catch_0
    move-exception v0

    .line 543
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 544
    const-string v1, "menuWin Exception"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private initData()V
    .locals 7

    .prologue
    .line 679
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v6

    iget-object v6, v6, Lcom/heitao/platform/common/HTPDataCenter;->menuData:Ljava/lang/String;

    if-nez v6, :cond_1

    .line 680
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    .line 681
    new-instance v4, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;

    invoke-direct {v4}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;-><init>()V

    .line 683
    .local v4, "model":Lcom/heitao/platform/activity/view/menu/HTPMenuModel;
    const-string v6, "\u7528\u6237\u4e2d\u5fc3"

    invoke-virtual {v4, v6}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->setTitle(Ljava/lang/String;)V

    .line 684
    const-string v6, "https://passport.heitao.com/user/mcenter"

    invoke-virtual {v4, v6}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->setUrl(Ljava/lang/String;)V

    .line 685
    const-string v6, "user"

    invoke-virtual {v4, v6}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->setName(Ljava/lang/String;)V

    .line 687
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 717
    .end local v4    # "model":Lcom/heitao/platform/activity/view/menu/HTPMenuModel;
    :cond_0
    :goto_0
    return-void

    .line 692
    :cond_1
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v6

    iget-object v6, v6, Lcom/heitao/platform/common/HTPDataCenter;->menuData:Ljava/lang/String;

    invoke-direct {v1, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 693
    .local v1, "dataJsonObject":Lorg/json/JSONObject;
    const-string v6, "center_layer"

    invoke-static {v1, v6}, Lcom/heitao/platform/common/HTPJSONHelper;->getJSONArray(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 695
    .local v0, "arryOBJ":Lorg/json/JSONArray;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    .line 696
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v3, v6, :cond_0

    .line 697
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 699
    .local v5, "obj":Lorg/json/JSONObject;
    new-instance v4, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;

    invoke-direct {v4}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;-><init>()V

    .line 701
    .restart local v4    # "model":Lcom/heitao/platform/activity/view/menu/HTPMenuModel;
    const-string v6, "title"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->setTitle(Ljava/lang/String;)V

    .line 702
    const-string v6, "url"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->setUrl(Ljava/lang/String;)V

    .line 703
    const-string v6, "name"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->setName(Ljava/lang/String;)V

    .line 705
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 696
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 707
    .end local v0    # "arryOBJ":Lorg/json/JSONArray;
    .end local v1    # "dataJsonObject":Lorg/json/JSONObject;
    .end local v3    # "i":I
    .end local v4    # "model":Lcom/heitao/platform/activity/view/menu/HTPMenuModel;
    .end local v5    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 708
    .local v2, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    .line 709
    new-instance v4, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;

    invoke-direct {v4}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;-><init>()V

    .line 711
    .restart local v4    # "model":Lcom/heitao/platform/activity/view/menu/HTPMenuModel;
    const-string v6, "\u7528\u6237\u4e2d\u5fc3"

    invoke-virtual {v4, v6}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->setTitle(Ljava/lang/String;)V

    .line 712
    const-string v6, "http://passport.heitao.com/user/mcenter"

    invoke-virtual {v4, v6}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->setUrl(Ljava/lang/String;)V

    .line 713
    const-string v6, "user"

    invoke-virtual {v4, v6}, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->setName(Ljava/lang/String;)V

    .line 715
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->models:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private showMenuWindow(Landroid/app/Activity;Z)V
    .locals 8
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "isLeft"    # Z

    .prologue
    const/4 v6, -0x1

    .line 317
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    invoke-virtual {v3}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_1

    .line 319
    :try_start_0
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    invoke-virtual {v3}, Landroid/widget/PopupWindow;->dismiss()V

    .line 320
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 352
    :cond_0
    :goto_0
    return-void

    .line 322
    :catch_0
    move-exception v1

    .line 323
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 324
    const-string v3, "menuWin Exception"

    invoke-static {v3}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 327
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    if-eqz p2, :cond_3

    .line 328
    const/4 v3, 0x0

    iput v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    .line 329
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    iget v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentY:I

    invoke-virtual {v3, v4, v5, v6, v6}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 334
    :goto_1
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    const-string v4, "htp_float_icon"

    invoke-static {v3, v4}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    .line 335
    .local v2, "id":I
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->floatIconView:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v2}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 336
    move-object v0, p1

    .line 337
    .local v0, "activity":Landroid/app/Activity;
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    invoke-virtual {v3}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v3

    if-nez v3, :cond_0

    .line 340
    :cond_2
    invoke-direct {p0, v0, p2}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->buildMenu(Landroid/app/Activity;Z)V

    .line 342
    :try_start_1
    new-instance v3, Landroid/widget/PopupWindow;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuFound:Landroid/widget/RelativeLayout;

    iget v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWith:I

    iget v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    iput-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    .line 343
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 344
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuFound:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v4}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 346
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x33

    iget v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    .line 347
    iget v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentY:I

    .line 346
    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 348
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    iget v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentY:I

    const/4 v6, -0x1

    const/4 v7, -0x1

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/PopupWindow;->update(IIII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 349
    :catch_1
    move-exception v1

    .line 350
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 331
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "id":I
    :cond_3
    iget v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->screenWidth:I

    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    .line 332
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    iget v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentY:I

    invoke-virtual {v3, v4, v5, v6, v6}, Landroid/widget/PopupWindow;->update(IIII)V

    goto :goto_1
.end method

.method private startTimer()V
    .locals 4

    .prologue
    .line 93
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 95
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideTimer:Ljava/util/Timer;

    .line 97
    :cond_0
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideTimer:Ljava/util/Timer;

    .line 98
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideTimer:Ljava/util/Timer;

    new-instance v1, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$1;

    invoke-direct {v1, p0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$1;-><init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    .line 109
    const-wide/16 v2, 0xdac

    .line 98
    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 110
    return-void
.end method

.method private stopTimer()V
    .locals 3

    .prologue
    .line 113
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideTimer:Ljava/util/Timer;

    if-eqz v1, :cond_0

    .line 114
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 115
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideTimer:Ljava/util/Timer;

    .line 117
    :cond_0
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    const-string v2, "htp_float_icon"

    invoke-static {v1, v2}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 118
    .local v0, "id":I
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->floatIconView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 119
    return-void
.end method


# virtual methods
.method public hideFloatWindow()V
    .locals 2

    .prologue
    .line 523
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 525
    :try_start_0
    iget-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 526
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    .line 527
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideMenuWindow()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 533
    :cond_0
    :goto_0
    return-void

    .line 528
    :catch_0
    move-exception v0

    .line 529
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 530
    const-string v1, "popupWin Exception"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDestory()V
    .locals 1

    .prologue
    .line 535
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mInstance:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    .line 536
    return-void
.end method

.method public showFloatWindow()V
    .locals 9

    .prologue
    const v8, 0x44aa8000    # 1364.0f

    const/high16 v7, 0x44400000    # 768.0f

    const/4 v6, 0x0

    .line 122
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    invoke-virtual {v4}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 314
    :goto_0
    return-void

    .line 125
    :cond_0
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->initData()V

    .line 127
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 128
    .local v1, "dm":Landroid/util/DisplayMetrics;
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 130
    iget v4, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->screenWidth:I

    .line 131
    iget v4, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->screenHeight:I

    .line 132
    iget v4, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    iget v5, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    if-ge v4, v5, :cond_1

    .line 134
    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->screenWidth:I

    int-to-float v4, v4

    div-float/2addr v4, v8

    iput v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_w:F

    .line 135
    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->screenHeight:I

    int-to-float v4, v4

    div-float/2addr v4, v7

    iput v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    .line 141
    :goto_1
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->isLeft:Z

    .line 142
    iput-boolean v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->isIconHide:Z

    .line 143
    iput-boolean v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->showING:Z

    .line 145
    iput v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    .line 146
    const/high16 v4, 0x42a00000    # 80.0f

    iget v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    .line 147
    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    iput v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentY:I

    .line 149
    new-instance v4, Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    invoke-direct {v4, v5}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->fround:Landroid/widget/RelativeLayout;

    .line 150
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->fround:Landroid/widget/RelativeLayout;

    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    iget v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    iget v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    invoke-direct {v5, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 153
    new-instance v4, Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    invoke-direct {v4, v5}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->floatIconView:Landroid/widget/RelativeLayout;

    .line 154
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    iget v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    invoke-direct {v0, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 155
    .local v0, "dashParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v4, 0xd

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 157
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->floatIconView:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    const-string v5, "htp_float_icon"

    invoke-static {v4, v5}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    .line 159
    .local v3, "id":I
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->floatIconView:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v3}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 160
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->fround:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->floatIconView:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 162
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->fround:Landroid/widget/RelativeLayout;

    new-instance v5, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;-><init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 305
    :try_start_0
    new-instance v4, Landroid/widget/PopupWindow;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->fround:Landroid/widget/RelativeLayout;

    iget v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    iget v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->iconWith:I

    invoke-direct {v4, v5, v6, v7}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    iput-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    .line 306
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 307
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->fround:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v5}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 308
    iget-object v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    iget-object v5, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mActivity:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    const/16 v6, 0x33

    iget v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentX:I

    .line 309
    iget v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->mCurrentY:I

    .line 308
    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 310
    invoke-direct {p0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->startTimer()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 311
    :catch_0
    move-exception v2

    .line 312
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 138
    .end local v0    # "dashParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "id":I
    :cond_1
    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->screenHeight:I

    int-to-float v4, v4

    div-float/2addr v4, v8

    iput v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_w:F

    .line 139
    iget v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->screenWidth:I

    int-to-float v4, v4

    div-float/2addr v4, v7

    iput v4, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->scale_h:F

    goto/16 :goto_1
.end method
