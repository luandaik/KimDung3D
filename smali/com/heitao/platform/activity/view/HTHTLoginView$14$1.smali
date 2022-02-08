.class Lcom/heitao/platform/activity/view/HTHTLoginView$14$1;
.super Ljava/lang/Object;
.source "HTHTLoginView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView$14;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/platform/activity/view/HTHTLoginView$14;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/view/HTHTLoginView$14;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14$1;->this$1:Lcom/heitao/platform/activity/view/HTHTLoginView$14;

    .line 418
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 423
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 424
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14$1;->this$1:Lcom/heitao/platform/activity/view/HTHTLoginView$14;

    invoke-static {v0}, Lcom/heitao/platform/activity/view/HTHTLoginView$14;->access$0(Lcom/heitao/platform/activity/view/HTHTLoginView$14;)Lcom/heitao/platform/activity/view/HTHTLoginView;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14$1;->this$1:Lcom/heitao/platform/activity/view/HTHTLoginView$14;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView$14;->access$0(Lcom/heitao/platform/activity/view/HTHTLoginView$14;)Lcom/heitao/platform/activity/view/HTHTLoginView;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$18(Lcom/heitao/platform/activity/view/HTHTLoginView;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$14$1;->this$1:Lcom/heitao/platform/activity/view/HTHTLoginView$14;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTHTLoginView$14;->access$0(Lcom/heitao/platform/activity/view/HTHTLoginView$14;)Lcom/heitao/platform/activity/view/HTHTLoginView;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$19(Lcom/heitao/platform/activity/view/HTHTLoginView;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$14(Lcom/heitao/platform/activity/view/HTHTLoginView;Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    return-void
.end method
