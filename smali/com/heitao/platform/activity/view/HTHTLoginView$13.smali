.class Lcom/heitao/platform/activity/view/HTHTLoginView$13;
.super Ljava/lang/Object;
.source "HTHTLoginView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/view/HTHTLoginView;->buildRegisterCompleteView()V
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
    iput-object p1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$13;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    .line 401
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 404
    iget-object v0, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$13;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    iget-object v1, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$13;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v1}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$18(Lcom/heitao/platform/activity/view/HTHTLoginView;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/platform/activity/view/HTHTLoginView$13;->this$0:Lcom/heitao/platform/activity/view/HTHTLoginView;

    invoke-static {v2}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$19(Lcom/heitao/platform/activity/view/HTHTLoginView;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/heitao/platform/activity/view/HTHTLoginView;->access$14(Lcom/heitao/platform/activity/view/HTHTLoginView;Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    return-void
.end method
