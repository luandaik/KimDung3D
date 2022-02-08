.class Lcom/heitao/request/HTBaseRequest$1;
.super Ljava/lang/Object;
.source "HTBaseRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseRequest;->doShowProgressDialog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTBaseRequest;

.field final synthetic val$string:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseRequest;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/heitao/request/HTBaseRequest$1;->this$0:Lcom/heitao/request/HTBaseRequest;

    iput-object p2, p0, Lcom/heitao/request/HTBaseRequest$1;->val$string:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 47
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$1;->this$0:Lcom/heitao/request/HTBaseRequest;

    new-instance v1, Landroid/app/ProgressDialog;

    iget-object v2, p0, Lcom/heitao/request/HTBaseRequest$1;->this$0:Lcom/heitao/request/HTBaseRequest;

    iget-object v2, v2, Lcom/heitao/request/HTBaseRequest;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v1}, Lcom/heitao/request/HTBaseRequest;->access$002(Lcom/heitao/request/HTBaseRequest;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 48
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$1;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v0}, Lcom/heitao/request/HTBaseRequest;->access$000(Lcom/heitao/request/HTBaseRequest;)Landroid/app/ProgressDialog;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/request/HTBaseRequest$1;->val$string:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 49
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$1;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v0}, Lcom/heitao/request/HTBaseRequest;->access$000(Lcom/heitao/request/HTBaseRequest;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 50
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$1;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v0}, Lcom/heitao/request/HTBaseRequest;->access$000(Lcom/heitao/request/HTBaseRequest;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 51
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$1;->this$0:Lcom/heitao/request/HTBaseRequest;

    invoke-static {v0}, Lcom/heitao/request/HTBaseRequest;->access$000(Lcom/heitao/request/HTBaseRequest;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 52
    return-void
.end method
