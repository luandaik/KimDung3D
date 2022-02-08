.class Lcom/heitao/platform/activity/HTPPayActivity$5;
.super Ljava/lang/Object;
.source "HTPPayActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPPayActivity;->showExitPayDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPPayActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPPayActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$5;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "which="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 183
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 185
    const/4 v0, -0x1

    if-ne v0, p2, :cond_1

    .line 187
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$5;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->access$8(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$5;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->access$11(Lcom/heitao/platform/activity/HTPPayActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 189
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$5;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->access$8(Lcom/heitao/platform/activity/HTPPayActivity;)Lcom/heitao/platform/listener/HTPPayListener;

    move-result-object v0

    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getPayCancelError()Lcom/heitao/platform/model/HTPError;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPPayActivity$5;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPPayActivity;->finish()V

    .line 194
    :cond_1
    return-void
.end method
