.class Lcom/heitao/platform/activity/view/HTPhoneLoginView2$3;
.super Ljava/lang/Object;
.source "HTPhoneLoginView2.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->buildPhoneLoginView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$3;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$3;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$3;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 199
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$3;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$1(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/widget/ViewFlipper;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$3;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$4(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 202
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTPhoneLoginView2$3;->this$0:Lcom/heitao/platform/activity/view/HTPhoneLoginView2;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTPhoneLoginView2;->access$5(Lcom/heitao/platform/activity/view/HTPhoneLoginView2;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 203
    return-void
.end method
