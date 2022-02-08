.class Lcom/heitao/request/HTBaseRequest$2;
.super Ljava/lang/Object;
.source "HTBaseRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseRequest;->doCancelProgressDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTBaseRequest;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseRequest;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/heitao/request/HTBaseRequest$2;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 68
    :try_start_0
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$2;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v0}, Lcom/heitao/request/HTBaseRequest;->access$000(Lcom/heitao/request/HTBaseRequest;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$2;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v0}, Lcom/heitao/request/HTBaseRequest;->access$000(Lcom/heitao/request/HTBaseRequest;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    .line 71
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$2;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v0}, Lcom/heitao/request/HTBaseRequest;->access$000(Lcom/heitao/request/HTBaseRequest;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->hide()V

    .line 72
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$2;->this$0:Lcom/heitao/request/HTBaseRequest;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/heitao/request/HTBaseRequest;->access$002(Lcom/heitao/request/HTBaseRequest;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$2;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v0, v2}, Lcom/heitao/request/HTBaseRequest;->access$002(Lcom/heitao/request/HTBaseRequest;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 83
    :goto_0
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 81
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$2;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v0, v2}, Lcom/heitao/request/HTBaseRequest;->access$002(Lcom/heitao/request/HTBaseRequest;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/heitao/request/HTBaseRequest$2;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v1, v2}, Lcom/heitao/request/HTBaseRequest;->access$002(Lcom/heitao/request/HTBaseRequest;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    throw v0
.end method
