.class Lcom/heitao/platform/activity/view/HTHTLoginView$11;
.super Ljava/lang/Object;
.source "HTHTLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView;->buildRegisterView()V
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
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$11;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    .line 359
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 362
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$11;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$11(Lcom/heitao/platform/activity/view/HTHTLoginView;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 363
    return-void
.end method
