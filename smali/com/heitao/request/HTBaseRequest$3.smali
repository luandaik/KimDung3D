.class Lcom/heitao/request/HTBaseRequest$3;
.super Lcom/loopj/android/http/AsyncHttpResponseHandler;
.source "HTBaseRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseRequest;->get(Ljava/lang/String;Lcom/heitao/listener/HTRequestListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTBaseRequest;

.field final synthetic val$listener:Lcom/heitao/listener/HTRequestListener;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseRequest;Lcom/heitao/listener/HTRequestListener;)V
    .locals 0

    .prologue
    .line 197
    iput-object p1, p0, Lcom/heitao/request/HTBaseRequest$3;->this$0:Lcom/heitao/request/HTBaseRequest;

    iput-object p2, p0, Lcom/heitao/request/HTBaseRequest$3;->val$listener:Lcom/heitao/listener/HTRequestListener;

    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(I[Lorg/apache/http/Header;[BLjava/lang/Throwable;)V
    .locals 1
    .param p1, "code"    # I
    .param p2, "header"    # [Lorg/apache/http/Header;
    .param p3, "response"    # [B
    .param p4, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 212
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$3;->val$listener:Lcom/heitao/listener/HTRequestListener;

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$3;->val$listener:Lcom/heitao/listener/HTRequestListener;

    invoke-interface {v0, p4}, Lcom/heitao/listener/HTRequestListener;->onFailure(Ljava/lang/Throwable;)V

    .line 216
    :cond_0
    return-void
.end method

.method public onSuccess(I[Lorg/apache/http/Header;[B)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "header"    # [Lorg/apache/http/Header;
    .param p3, "response"    # [B

    .prologue
    .line 202
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$3;->val$listener:Lcom/heitao/listener/HTRequestListener;

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/heitao/request/HTBaseRequest$3;->val$listener:Lcom/heitao/listener/HTRequestListener;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p3}, Ljava/lang/String;-><init>([B)V

    invoke-interface {v0, v1}, Lcom/heitao/listener/HTRequestListener;->onSuccess(Ljava/lang/String;)V

    .line 206
    :cond_0
    return-void
.end method
