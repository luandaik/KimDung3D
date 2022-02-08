.class Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;
.super Ljava/lang/Object;
.source "HTPFloatMenuWindow.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->buildMenu(Landroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

.field private final synthetic val$isLeft:Z


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    iput-boolean p2, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;->val$isLeft:Z

    .line 496
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 12
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const-wide/16 v10, 0x118

    const/4 v5, 0x2

    const/4 v8, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 500
    iget-boolean v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;->val$isLeft:Z

    if-eqz v3, :cond_0

    .line 501
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v3}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$4(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v3

    const-string v4, "x"

    new-array v5, v5, [F

    aput v6, v5, v8

    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$5(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v6

    neg-int v6, v6

    int-to-float v6, v6

    aput v6, v5, v7

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 502
    .local v0, "anim3":Landroid/animation/ObjectAnimator;
    invoke-virtual {v0, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 504
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 505
    .local v1, "animSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 506
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 515
    :goto_0
    new-instance v2, Landroid/os/Message;

    invoke-direct {v2}, Landroid/os/Message;-><init>()V

    .line 516
    .local v2, "msg":Landroid/os/Message;
    iput v7, v2, Landroid/os/Message;->what:I

    .line 517
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v3}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$2(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;

    move-result-object v3

    iget v4, v2, Landroid/os/Message;->what:I

    const-wide/16 v6, 0x140

    invoke-virtual {v3, v4, v6, v7}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 518
    return-void

    .line 508
    .end local v0    # "anim3":Landroid/animation/ObjectAnimator;
    .end local v1    # "animSet":Landroid/animation/AnimatorSet;
    .end local v2    # "msg":Landroid/os/Message;
    :cond_0
    iget-object v3, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v3}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$4(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)Landroid/widget/RelativeLayout;

    move-result-object v3

    const-string v4, "x"

    new-array v5, v5, [F

    aput v6, v5, v8

    iget-object v6, p0, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow$4;->this$0:Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    invoke-static {v6}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->access$5(Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;)I

    move-result v6

    int-to-float v6, v6

    aput v6, v5, v7

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 509
    .restart local v0    # "anim3":Landroid/animation/ObjectAnimator;
    invoke-virtual {v0, v10, v11}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 511
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 512
    .restart local v1    # "animSet":Landroid/animation/AnimatorSet;
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 513
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    goto :goto_0
.end method
