.class Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;
.super Ljava/lang/Object;
.source "HTPFloatMenuWindow.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->showFloatWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field lastX:I

.field lastY:I

.field private mDx:F

.field private mDy:F

.field final synthetic this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    iput v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->lastX:I

    .line 166
    iput v0, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->lastY:I

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 13
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded",
            "ClickableViewAccessibility"
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const/4 v10, 0x2

    const/4 v11, -0x1

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 172
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_1

    .line 173
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8, v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$20(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    .line 177
    :goto_0
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$21(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 301
    :cond_0
    :goto_1
    return v6

    .line 175
    :cond_1
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8, v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$20(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    goto :goto_0

    .line 180
    :cond_2
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$22(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 181
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8, v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$7(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    .line 182
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$8(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/app/Activity;

    move-result-object v8

    const-string v9, "htp_float_icon"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    .line 183
    .local v3, "id":I
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v8

    invoke-virtual {v8, v3}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 184
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$3(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 185
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v8

    const-string v9, "x"

    new-array v10, v10, [F

    iget-object v11, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v11}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v11

    neg-int v11, v11

    int-to-float v11, v11

    aput v11, v10, v6

    aput v12, v10, v7

    invoke-static {v8, v9, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 186
    .local v0, "anim4":Landroid/animation/ObjectAnimator;
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 187
    .local v1, "animSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 188
    const-wide/16 v8, 0xc8

    invoke-virtual {v1, v8, v9}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 189
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 190
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7, v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 199
    :goto_2
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 200
    .local v5, "sss":Landroid/os/Message;
    const/4 v7, 0x5

    iput v7, v5, Landroid/os/Message;->what:I

    .line 201
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v7

    iget v8, v5, Landroid/os/Message;->what:I

    const-wide/16 v10, 0x258

    invoke-virtual {v7, v8, v10, v11}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_1

    .line 192
    .end local v0    # "anim4":Landroid/animation/ObjectAnimator;
    .end local v1    # "animSet":Landroid/animation/AnimatorSet;
    .end local v5    # "sss":Landroid/os/Message;
    :cond_3
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$9(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v8

    const-string v9, "x"

    new-array v10, v10, [F

    iget-object v11, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v11}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v11

    int-to-float v11, v11

    aput v11, v10, v6

    aput v12, v10, v7

    invoke-static {v8, v9, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 193
    .restart local v0    # "anim4":Landroid/animation/ObjectAnimator;
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 194
    .restart local v1    # "animSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 195
    const-wide/16 v8, 0xc8

    invoke-virtual {v1, v8, v9}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 196
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 197
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v7, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    goto :goto_2

    .line 204
    .end local v0    # "anim4":Landroid/animation/ObjectAnimator;
    .end local v1    # "animSet":Landroid/animation/AnimatorSet;
    .end local v3    # "id":I
    :cond_4
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$23(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    .line 205
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    if-nez v8, :cond_6

    .line 206
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v6

    iput v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->lastX:I

    .line 207
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v6

    iput v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->lastY:I

    .line 208
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    sub-float/2addr v6, v8

    iput v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->mDx:F

    .line 209
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    sub-float/2addr v6, v8

    iput v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->mDy:F

    :cond_5
    :goto_3
    move v6, v7

    .line 301
    goto/16 :goto_1

    .line 210
    :cond_6
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    if-ne v8, v10, :cond_f

    .line 212
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$22(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 213
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, v8, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    if-eqz v8, :cond_7

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, v8, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    invoke-virtual {v8}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v8

    if-eqz v8, :cond_7

    move v6, v7

    .line 214
    goto/16 :goto_1

    .line 216
    :cond_7
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_8

    .line 217
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8, v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$20(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    .line 222
    :goto_4
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    if-gez v8, :cond_9

    .line 223
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v9

    iget v10, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->mDy:F

    add-float/2addr v9, v10

    float-to-int v9, v9

    invoke-static {v8, v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$24(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 224
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, v8, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    invoke-virtual {v8, v6, v9, v11, v11}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 225
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8, v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    move v6, v7

    .line 226
    goto/16 :goto_1

    .line 219
    :cond_8
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8, v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$20(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V

    goto :goto_4

    .line 228
    :cond_9
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    iget-object v10, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v10}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v10

    sub-int/2addr v9, v10

    if-le v8, v9, :cond_a

    .line 229
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    iget v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->mDy:F

    add-float/2addr v8, v9

    float-to-int v8, v8

    invoke-static {v6, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$24(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 230
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v6, v6, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    invoke-virtual {v6, v8, v9, v11, v11}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 231
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v6, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    move v6, v7

    .line 232
    goto/16 :goto_1

    .line 234
    :cond_a
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    if-gez v8, :cond_b

    .line 235
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v9

    iget v10, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->mDx:F

    add-float/2addr v9, v10

    float-to-int v9, v9

    invoke-static {v8, v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 236
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, v8, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    invoke-virtual {v8, v9, v6, v11, v11}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 237
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8, v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$24(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    move v6, v7

    .line 238
    goto/16 :goto_1

    .line 240
    :cond_b
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    add-float/2addr v6, v8

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$25(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    int-to-float v8, v8

    cmpl-float v6, v6, v8

    if-lez v6, :cond_c

    .line 241
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->mDx:F

    add-float/2addr v8, v9

    float-to-int v8, v8

    invoke-static {v6, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 242
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v6, v6, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$25(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    iget-object v10, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v10}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v10

    sub-int/2addr v9, v10

    invoke-virtual {v6, v8, v9, v11, v11}, Landroid/widget/PopupWindow;->update(IIII)V

    .line 243
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$25(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v6, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$24(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    move v6, v7

    .line 244
    goto/16 :goto_1

    .line 246
    :cond_c
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v8

    iget v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->mDx:F

    add-float/2addr v8, v9

    float-to-int v8, v8

    invoke-static {v6, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 247
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    iget v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->mDy:F

    add-float/2addr v8, v9

    float-to-int v8, v8

    invoke-static {v6, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$24(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 248
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v6

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$25(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    if-le v6, v8, :cond_d

    .line 249
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$25(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v6, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$24(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 251
    :cond_d
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v6

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    if-le v6, v8, :cond_e

    .line 252
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$15(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v6, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$12(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 254
    :cond_e
    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v6, v6, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->popupWin:Landroid/widget/PopupWindow;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    invoke-virtual {v6, v8, v9, v11, v11}, Landroid/widget/PopupWindow;->update(IIII)V

    goto/16 :goto_3

    .line 256
    :cond_f
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    if-eq v8, v7, :cond_10

    .line 257
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    const/4 v9, 0x3

    if-ne v8, v9, :cond_5

    .line 259
    :cond_10
    iget v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->lastX:I

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    const/16 v9, 0xa

    if-ge v8, v9, :cond_13

    iget v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->lastY:I

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$18(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    const/16 v9, 0xa

    if-ge v8, v9, :cond_13

    .line 260
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$22(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 263
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v7, v7, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    if-eqz v7, :cond_11

    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v7, v7, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->menuWin:Landroid/widget/PopupWindow;

    invoke-virtual {v7}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v7

    if-eqz v7, :cond_11

    .line 264
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$0(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    .line 265
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$1(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    goto/16 :goto_1

    .line 267
    :cond_11
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$22(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 270
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$23(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    .line 271
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$26(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)V

    .line 272
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$8(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/app/Activity;

    move-result-object v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$3(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v9

    invoke-static {v7, v8, v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$27(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Landroid/app/Activity;Z)V

    .line 273
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$3(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 274
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$8(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/app/Activity;

    move-result-object v7

    .line 275
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$8(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/app/Activity;

    move-result-object v8

    const-string v9, "htp_float_show_left_to_right"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    .line 274
    invoke-static {v7, v8}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v2

    .line 276
    .local v2, "animation":Landroid/view/animation/Animation;
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$4(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/widget/RelativeLayout;->setAnimation(Landroid/view/animation/Animation;)V

    .line 277
    invoke-virtual {v2}, Landroid/view/animation/Animation;->start()V

    goto/16 :goto_1

    .line 279
    .end local v2    # "animation":Landroid/view/animation/Animation;
    :cond_12
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$8(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/app/Activity;

    move-result-object v7

    .line 280
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$8(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/app/Activity;

    move-result-object v8

    const-string v9, "htp_float_show_right_to_left"

    invoke-static {v8, v9}, Lcom/heitao/platform/common/HTPUtils;->getAnimByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    .line 279
    invoke-static {v7, v8}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v2

    .line 281
    .restart local v2    # "animation":Landroid/view/animation/Animation;
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$4(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/widget/RelativeLayout;->setAnimation(Landroid/view/animation/Animation;)V

    .line 282
    invoke-virtual {v2}, Landroid/view/animation/Animation;->start()V

    goto/16 :goto_1

    .line 286
    .end local v2    # "animation":Landroid/view/animation/Animation;
    :cond_13
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    if-lez v8, :cond_14

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    if-ge v8, v9, :cond_14

    .line 287
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/16 v8, 0x14

    invoke-static {v7, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$28(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 288
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 289
    .local v4, "msg":Landroid/os/Message;
    const/16 v7, 0x9

    iput v7, v4, Landroid/os/Message;->what:I

    .line 290
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v7

    iget v8, v4, Landroid/os/Message;->what:I

    const-wide/16 v10, 0x32

    invoke-virtual {v7, v8, v10, v11}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_1

    .line 293
    .end local v4    # "msg":Landroid/os/Message;
    :cond_14
    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    if-lt v8, v9, :cond_5

    iget-object v8, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$16(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v8

    iget-object v9, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v9}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$14(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v9

    if-ge v8, v9, :cond_5

    .line 294
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    const/16 v8, 0x14

    invoke-static {v7, v8}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$28(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;I)V

    .line 295
    new-instance v4, Landroid/os/Message;

    invoke-direct {v4}, Landroid/os/Message;-><init>()V

    .line 296
    .restart local v4    # "msg":Landroid/os/Message;
    const/16 v7, 0x9

    iput v7, v4, Landroid/os/Message;->what:I

    .line 297
    iget-object v7, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$2;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v7

    iget v8, v4, Landroid/os/Message;->what:I

    const-wide/16 v10, 0x32

    invoke-virtual {v7, v8, v10, v11}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_1
.end method
