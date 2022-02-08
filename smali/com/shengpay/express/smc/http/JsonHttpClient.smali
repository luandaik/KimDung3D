.class public Lcom/shengpay/express/smc/http/JsonHttpClient;
.super Lcom/shengpay/express/smc/http/SimpleHttpClient;
.source "JsonHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/shengpay/express/smc/http/JsonHttpClient$JsonResponseHandler;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "JsonHttpClient"

.field private static jsonHttpClient:Lcom/shengpay/express/smc/http/JsonHttpClient;


# instance fields
.field private jsonResponseHandler:Lorg/apache/http/client/ResponseHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/client/ResponseHandler",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lcom/shengpay/express/smc/http/JsonHttpClient;

    invoke-direct {v0}, Lcom/shengpay/express/smc/http/JsonHttpClient;-><init>()V

    sput-object v0, Lcom/shengpay/express/smc/http/JsonHttpClient;->jsonHttpClient:Lcom/shengpay/express/smc/http/JsonHttpClient;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/shengpay/express/smc/http/SimpleHttpClient;-><init>()V

    .line 19
    new-instance v0, Lcom/shengpay/express/smc/http/JsonHttpClient$JsonResponseHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/shengpay/express/smc/http/JsonHttpClient$JsonResponseHandler;-><init>(Lcom/shengpay/express/smc/http/JsonHttpClient;Lcom/shengpay/express/smc/http/JsonHttpClient$JsonResponseHandler;)V

    iput-object v0, p0, Lcom/shengpay/express/smc/http/JsonHttpClient;->jsonResponseHandler:Lorg/apache/http/client/ResponseHandler;

    .line 25
    return-void
.end method

.method public static INSTANCE()Lcom/shengpay/express/smc/http/JsonHttpClient;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/shengpay/express/smc/http/JsonHttpClient;->jsonHttpClient:Lcom/shengpay/express/smc/http/JsonHttpClient;

    return-object v0
.end method

.method public static bridge synthetic INSTANCE()Lcom/shengpay/express/smc/http/SimpleHttpClient;
    .locals 1

    .prologue
    .line 1
    invoke-static {}, Lcom/shengpay/express/smc/http/JsonHttpClient;->INSTANCE()Lcom/shengpay/express/smc/http/JsonHttpClient;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getResponseHandler()Lorg/apache/http/client/ResponseHandler;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/shengpay/express/smc/http/JsonHttpClient;->jsonResponseHandler:Lorg/apache/http/client/ResponseHandler;

    return-object v0
.end method
