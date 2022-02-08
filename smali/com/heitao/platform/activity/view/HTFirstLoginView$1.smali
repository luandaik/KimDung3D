.class Lcom/heitao/platform/activity/view/HTFirstLoginView$1;
.super Ljava/lang/Object;
.source "HTFirstLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTFirstLoginView;->createView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/view/HTFirstLoginView;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTFirstLoginView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTFirstLoginView;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTFirstLoginView$1;->this$0:Lcom/heitao/platform/activity/view/HTFirstLoginView;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTFirstLoginView;->access$0(Lcom/heitao/platform/activity/view/HTFirstLoginView;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 49
    return-void
.end method
