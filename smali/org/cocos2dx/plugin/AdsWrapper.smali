.class public Lorg/cocos2dx/plugin/AdsWrapper;
.super Ljava/lang/Object;
.source "AdsWrapper.java"


# static fields
.field public static final POS_BOTTOM:I = 0x4

.field public static final POS_BOTTOM_LEFT:I = 0x5

.field public static final POS_BOTTOM_RIGHT:I = 0x6

.field public static final POS_CENTER:I = 0x0

.field public static final POS_TOP:I = 0x1

.field public static final POS_TOP_LEFT:I = 0x2

.field public static final POS_TOP_RIGHT:I = 0x3

.field public static final RESULT_CODE_AdsDismissed:I = 0x2

.field public static final RESULT_CODE_AdsReceived:I = 0x0

.field public static final RESULT_CODE_AdsShown:I = 0x1

.field public static final RESULT_CODE_NetworkError:I = 0x5

.field public static final RESULT_CODE_PointsSpendFailed:I = 0x4

.field public static final RESULT_CODE_PointsSpendSucceed:I = 0x3

.field public static final RESULT_CODE_UnknownError:I = 0x6


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/plugin/AdsWrapper;->nativeOnAdsResult(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;I)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # I

    .prologue
    .line 30
    invoke-static {p0, p1}, Lorg/cocos2dx/plugin/AdsWrapper;->nativeOnPlayerGetPoints(Ljava/lang/String;I)V

    return-void
.end method

.method public static addAdView(Landroid/view/WindowManager;Landroid/view/View;I)V
    .locals 3
    .param p0, "mWm"    # Landroid/view/WindowManager;
    .param p1, "adView"    # Landroid/view/View;
    .param p2, "pos"    # I

    .prologue
    const/4 v2, -0x2

    .line 49
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 50
    .local v0, "mLayoutParams":Landroid/view/WindowManager$LayoutParams;
    const/16 v1, 0x3e8

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 51
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 52
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 53
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit8 v1, v1, 0x8

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 55
    packed-switch p2, :pswitch_data_0

    .line 80
    :goto_0
    invoke-interface {p0, p1, v0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    return-void

    .line 57
    :pswitch_0
    const/16 v1, 0x11

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 60
    :pswitch_1
    const/16 v1, 0x30

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 63
    :pswitch_2
    const/16 v1, 0x33

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 66
    :pswitch_3
    const/16 v1, 0x35

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 69
    :pswitch_4
    const/16 v1, 0x50

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 72
    :pswitch_5
    const/16 v1, 0x53

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 75
    :pswitch_6
    const/16 v1, 0x55

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private static native nativeOnAdsResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method private static native nativeOnPlayerGetPoints(Ljava/lang/String;I)V
.end method

.method public static onAdsResult(Lorg/cocos2dx/plugin/InterfaceAds;ILjava/lang/String;)V
    .locals 4
    .param p0, "adapter"    # Lorg/cocos2dx/plugin/InterfaceAds;
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 84
    move v0, p1

    .line 85
    .local v0, "curCode":I
    move-object v1, p2

    .line 86
    .local v1, "curMsg":Ljava/lang/String;
    move-object v2, p0

    .line 87
    .local v2, "curObj":Lorg/cocos2dx/plugin/InterfaceAds;
    new-instance v3, Lorg/cocos2dx/plugin/AdsWrapper$1;

    invoke-direct {v3, v2, v0, v1}, Lorg/cocos2dx/plugin/AdsWrapper$1;-><init>(Lorg/cocos2dx/plugin/InterfaceAds;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 95
    return-void
.end method

.method public static onPlayerGetPoints(Lorg/cocos2dx/plugin/InterfaceAds;I)V
    .locals 3
    .param p0, "adapter"    # Lorg/cocos2dx/plugin/InterfaceAds;
    .param p1, "points"    # I

    .prologue
    .line 99
    move v1, p1

    .line 100
    .local v1, "curPoints":I
    move-object v0, p0

    .line 101
    .local v0, "curAdapter":Lorg/cocos2dx/plugin/InterfaceAds;
    new-instance v2, Lorg/cocos2dx/plugin/AdsWrapper$2;

    invoke-direct {v2, v0, v1}, Lorg/cocos2dx/plugin/AdsWrapper$2;-><init>(Lorg/cocos2dx/plugin/InterfaceAds;I)V

    invoke-static {v2}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 109
    return-void
.end method
