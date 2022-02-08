.class Lcom/heitao/request/HTRequest$2;
.super Ljava/lang/Object;
.source "HTRequest.java"

# interfaces
.implements Lcom/heitao/listener/HTRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTRequest;->postWithURL(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTRequest;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTRequest;)V
    .locals 0

    .prologue
    .line 221
    iput-object p1, p0, Lcom/heitao/request/HTRequest$2;->this$0:Lcom/heitao/request/HTRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 239
    iget-object v0, p0, Lcom/heitao/request/HTRequest$2;->this$0:Lcom/heitao/request/HTRequest;

    invoke-virtual {v0}, Lcom/heitao/request/HTRequest;->doCancelProgressDialog()V

    .line 240
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u8bf7\u6c42\u5931\u8d25\uff0cerror="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 242
    iget-object v0, p0, Lcom/heitao/request/HTRequest$2;->this$0:Lcom/heitao/request/HTRequest;

    invoke-static {v0}, Lcom/heitao/request/HTRequest;->access$000(Lcom/heitao/request/HTRequest;)Lcom/heitao/listener/HTRequestListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 244
    iget-object v0, p0, Lcom/heitao/request/HTRequest$2;->this$0:Lcom/heitao/request/HTRequest;

    invoke-static {v0}, Lcom/heitao/request/HTRequest;->access$000(Lcom/heitao/request/HTRequest;)Lcom/heitao/listener/HTRequestListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/heitao/listener/HTRequestListener;->onFailure(Ljava/lang/Throwable;)V

    .line 246
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 226
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u8bf7\u6c42\u8fd4\u56de\u6210\u529f\uff0cresponse="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 227
    iget-object v0, p0, Lcom/heitao/request/HTRequest$2;->this$0:Lcom/heitao/request/HTRequest;

    invoke-virtual {v0}, Lcom/heitao/request/HTRequest;->doCancelProgressDialog()V

    .line 229
    iget-object v0, p0, Lcom/heitao/request/HTRequest$2;->this$0:Lcom/heitao/request/HTRequest;

    invoke-static {v0}, Lcom/heitao/request/HTRequest;->access$000(Lcom/heitao/request/HTRequest;)Lcom/heitao/listener/HTRequestListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/heitao/request/HTRequest$2;->this$0:Lcom/heitao/request/HTRequest;

    invoke-static {v0}, Lcom/heitao/request/HTRequest;->access$000(Lcom/heitao/request/HTRequest;)Lcom/heitao/listener/HTRequestListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/heitao/listener/HTRequestListener;->onSuccess(Ljava/lang/String;)V

    .line 233
    :cond_0
    return-void
.end method
