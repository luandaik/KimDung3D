.class Lcom/shengpay/express/smc/http/SimpleHttpClient$StringResponseHandler;
.super Ljava/lang/Object;
.source "SimpleHttpClient.java"

# interfaces
.implements Lorg/apache/http/client/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/shengpay/express/smc/http/SimpleHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StringResponseHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/client/ResponseHandler",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/shengpay/express/smc/http/SimpleHttpClient;


# direct methods
.method constructor <init>(Lcom/shengpay/express/smc/http/SimpleHttpClient;)V
    .locals 0

    .prologue
    .line 216
    iput-object p1, p0, Lcom/shengpay/express/smc/http/SimpleHttpClient$StringResponseHandler;->this$0:Lcom/shengpay/express/smc/http/SimpleHttpClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handleResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lcom/shengpay/express/smc/http/SimpleHttpClient$StringResponseHandler;->handleResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 3
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 220
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_0

    .line 221
    new-instance v1, Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 223
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
