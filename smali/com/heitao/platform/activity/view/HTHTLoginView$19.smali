.class Lcom/heitao/platform/activity/view/HTHTLoginView$19;
.super Ljava/lang/Object;
.source "HTHTLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView;->buildForgetView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTHTLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$19;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    .line 483
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 487
    sget-object v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;->pageStack:Lcom/heitao/platform/activity/view/LoginPageStack;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 488
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$19;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 489
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$19;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 491
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$19;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->buildHtLoginView()V

    .line 492
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$19;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$2(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$19;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$22(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 493
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$19;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$11(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 494
    return-void
.end method
