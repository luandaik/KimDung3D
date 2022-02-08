.class Lcom/heitao/platform/activity/view/HTPFloatWindow$1;
.super Ljava/lang/Object;
.source "HTPFloatWindow.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPFloatWindow;->showFloatWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field lastX:I

.field lastY:I

.field mCurrentX:I

.field mCurrentY:I

.field private mDx:F

.field private mDy:F

.field private final synthetic val$activity:Landroid/content/Context;

.field private final synthetic val$screenHeight:I

.field private final synthetic val$screenWidth:I


# direct methods
.method constructor <init>(Landroid/content/Context;II)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$activity:Landroid/content/Context;

    iput p2, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$screenWidth:I

    iput p3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$screenHeight:I

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput v1, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    .line 42
    const/16 v0, 0x32

    iput v0, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    .line 43
    iput v1, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->lastX:I

    .line 44
    iput v1, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->lastY:I

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v7, 0xa

    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v8, -0x1

    .line 49
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 51
    .local v0, "action":I
    if-nez v0, :cond_1

    .line 52
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->lastX:I

    .line 53
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->lastY:I

    .line 54
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    int-to-float v3, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    sub-float/2addr v3, v5

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mDx:F

    .line 55
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    int-to-float v3, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    sub-float/2addr v3, v5

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mDy:F

    :cond_0
    :goto_0
    move v3, v4

    .line 97
    :goto_1
    return v3

    .line 56
    :cond_1
    const/4 v3, 0x2

    if-ne v0, v3, :cond_6

    .line 57
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 59
    .local v1, "frame":Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$activity:Landroid/content/Context;

    check-cast v3, Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    .line 60
    invoke-virtual {v3, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 62
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    if-gez v3, :cond_2

    .line 63
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mDy:F

    add-float/2addr v3, v6

    float-to-int v3, v3

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    .line 64
    sget-object v3, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    invoke-virtual {v3, v5, v6, v8, v8}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 65
    iput v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    move v3, v4

    .line 66
    goto :goto_1

    .line 68
    :cond_2
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$screenWidth:I

    if-le v3, v6, :cond_3

    .line 69
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    iget v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mDy:F

    add-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    .line 70
    sget-object v3, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    iget v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$screenWidth:I

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    invoke-virtual {v3, v5, v6, v8, v8}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 71
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$screenWidth:I

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    move v3, v4

    .line 72
    goto :goto_1

    .line 74
    :cond_3
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    if-gez v3, :cond_4

    .line 75
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mDx:F

    add-float/2addr v3, v6

    float-to-int v3, v3

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    .line 76
    sget-object v3, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    invoke-virtual {v3, v6, v5, v8, v8}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 77
    iput v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    move v3, v4

    .line 78
    goto :goto_1

    .line 80
    :cond_4
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    int-to-float v3, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    add-float/2addr v3, v5

    iget v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$screenHeight:I

    int-to-float v5, v5

    cmpl-float v3, v3, v5

    if-lez v3, :cond_5

    .line 81
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iget v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mDx:F

    add-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    .line 82
    sget-object v3, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    iget v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$screenHeight:I

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v3, v5, v6, v8, v8}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 83
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->val$screenHeight:I

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    move v3, v4

    .line 84
    goto/16 :goto_1

    .line 87
    :cond_5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iget v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mDx:F

    add-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    .line 88
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    iget v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mDy:F

    add-float/2addr v3, v5

    float-to-int v3, v3

    iput v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    .line 89
    sget-object v3, Lcom/heitao/platform/activity/view/HTPFloatWindow;->popupWin:Landroid/widget/PopupWindow;

    iget v5, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    invoke-virtual {v3, v5, v6, v8, v8}, Landroid/widget/PopupWindow;->update(IIII)V

    goto/16 :goto_0

    .line 90
    .end local v1    # "frame":Landroid/graphics/Rect;
    :cond_6
    if-ne v0, v4, :cond_0

    .line 91
    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->lastX:I

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentX:I

    sub-int/2addr v3, v6

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-ge v3, v7, :cond_0

    iget v3, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->lastY:I

    iget v6, p0, Lcom/heitao/platform/activity/view/HTPFloatWindow$1;->mCurrentY:I

    sub-int/2addr v3, v6

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-ge v3, v7, :cond_0

    .line 92
    new-instance v2, Landroid/content/Intent;

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v3

    iget-object v3, v3, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    const-class v4, Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 93
    .local v2, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v3

    iget-object v3, v3, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    move v3, v5

    .line 94
    goto/16 :goto_1
.end method
