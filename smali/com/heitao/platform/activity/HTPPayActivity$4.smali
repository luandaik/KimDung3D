.class Lcom/heitao/platform/activity/HTPPayActivity$4;
.super Ljava/lang/Object;
.source "HTPPayActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPPayActivity;->onCreate(Landroid/os/Bundle;)V
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
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPPayActivity$4;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 105
    new-instance v2, Lcom/alipay/sdk/app/PayTask;

    iget-object v3, p0, Lcom/heitao/platform/activity/HTPPayActivity$4;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-direct {v2, v3}, Lcom/alipay/sdk/app/PayTask;-><init>(Landroid/app/Activity;)V

    .line 106
    .local v2, "payTask":Lcom/alipay/sdk/app/PayTask;
    invoke-virtual {v2}, Lcom/alipay/sdk/app/PayTask;->checkAccountIfExist()Z

    move-result v0

    .line 107
    .local v0, "isExist":Z
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "checkAccountIfExist="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 109
    if-eqz v0, :cond_0

    .line 111
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 112
    .local v1, "message":Landroid/os/Message;
    const/4 v3, 0x0

    iput v3, v1, Landroid/os/Message;->what:I

    .line 113
    iget-object v3, p0, Lcom/heitao/platform/activity/HTPPayActivity$4;->this$0:Lcom/heitao/platform/activity/HTPPayActivity;

    invoke-static {v3}, Lcom/heitao/platform/activity/HTPPayActivity;->access$10(Lcom/heitao/platform/activity/HTPPayActivity;)Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 115
    .end local v1    # "message":Landroid/os/Message;
    :cond_0
    return-void
.end method
