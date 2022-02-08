.class Lcom/shengpay/express/smc/http/JsonHttpClient$JsonResponseHandler;
.super Ljava/lang/Object;
.source "JsonHttpClient.java"

# interfaces
.implements Lorg/apache/http/client/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/shengpay/express/smc/http/JsonHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "JsonResponseHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/client/ResponseHandler",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/shengpay/express/smc/http/JsonHttpClient;


# direct methods
.method private constructor <init>(Lcom/shengpay/express/smc/http/JsonHttpClient;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/shengpay/express/smc/http/JsonHttpClient$JsonResponseHandler;->this$0:Lcom/shengpay/express/smc/http/JsonHttpClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/shengpay/express/smc/http/JsonHttpClient;Lcom/shengpay/express/smc/http/JsonHttpClient$JsonResponseHandler;)V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/shengpay/express/smc/http/JsonHttpClient$JsonResponseHandler;-><init>(Lcom/shengpay/express/smc/http/JsonHttpClient;)V

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
    invoke-virtual {p0, p1}, Lcom/shengpay/express/smc/http/JsonHttpClient$JsonResponseHandler;->handleResponse(Lorg/apache/http/HttpResponse;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public handleResponse(Lorg/apache/http/HttpResponse;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 41
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v1, :cond_0

    .line 42
    new-instance v3, Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    .line 44
    .local v3, "str":Ljava/lang/String;
    const-string v4, "JsonHttpClient"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "response message: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/shengpay/express/smc/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .end local v3    # "str":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 49
    .restart local v3    # "str":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 54
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v3    # "str":Ljava/lang/String;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
