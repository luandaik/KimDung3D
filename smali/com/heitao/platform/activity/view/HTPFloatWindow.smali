.class public Lcom/heitao/platform/activity/view/HTPFloatWindow;
.super Ljava/lang/Object;
.source "HTPFloatWindow.java"


# static fields
.field public static popupWin:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hideFloatWindow()V
    .locals 2

    .prologue
    .line 112
    sget-object v1, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 114
    :try_start_0
    sget-object v1, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 115
    const/4 v1, 0x0

    sput-object v1, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void

    .line 116
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 117
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static showFloatWindow()V
    .locals 12

    .prologue
    const/4 v8, -0x2

    .line 24
    sget-object v7, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    if-eqz v7, :cond_0

    sget-object v7, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    invoke-virtual {v7}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 109
    .local v1, "dashboardButton":Landroid/widget/RelativeLayout;
    .local v2, "dm":Landroid/util/DisplayMetrics;
    .local v4, "id":I
    .local v5, "screenHeight":I
    .local v6, "screenWidth":I
    :goto_0
    return-void

    .line 26
    .end local v1    # "dashboardButton":Landroid/widget/RelativeLayout;
    .end local v2    # "dm":Landroid/util/DisplayMetrics;
    .end local v4    # "id":I
    .end local v5    # "screenHeight":I
    .end local v6    # "screenWidth":I
    :cond_0
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v7

    iget-object v0, v7, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    .line 27
    .local v0, "activity":Landroid/content/Context;
    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    .restart local v2    # "dm":Landroid/util/DisplayMetrics;
    move-object v7, v0

    .line 28
    check-cast v7, Landroid/app/Activity;

    invoke-virtual {v7}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v7

    invoke-interface {v7}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 29
    iget v6, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 30
    .restart local v6    # "screenWidth":I
    iget v5, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 33
    .restart local v5    # "screenHeight":I
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-direct {v1, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 34
    .restart local v1    # "dashboardButton":Landroid/widget/RelativeLayout;
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v7, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v7}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    const-string v7, "htp_float_window"

    invoke-static {v0, v7}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    .line 36
    .restart local v4    # "id":I
    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 37
    new-instance v7, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;

    invoke-direct {v7, v0, v6, v5}, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;-><init>(Landroid/content/Context;II)V

    invoke-virtual {v1, v7}, Landroid/widget/RelativeLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 102
    :try_start_0
    new-instance v7, Landroid/widget/PopupWindow;

    const/4 v8, -0x2

    const/4 v9, -0x2

    invoke-direct {v7, v1, v8, v9}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    sput-object v7, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    .line 103
    sget-object v7, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 104
    sget-object v7, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    invoke-virtual {v7, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 105
    sget-object v7, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    check-cast v0, Landroid/app/Activity;

    .end local v0    # "activity":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v8

    const/16 v9, 0x33

    const/4 v10, 0x0

    const/16 v11, 0x32

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 106
    :catch_0
    move-exception v3

    .line 107
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
