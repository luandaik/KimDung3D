.class public Lcom/shengpay/express/smc/utils/ConfigUtil;
.super Ljava/lang/Object;
.source "ConfigUtil.java"


# static fields
.field private static REMOTE_URL_RECEIVE_ORDER_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/shengpay/express/smc/enums/Stage;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static config:Lcom/shengpay/express/smc/utils/ConfigUtil;

.field private static targetStage:Lcom/shengpay/express/smc/enums/Stage;


# instance fields
.field private authRetryCount:I

.field private isDebug:Z

.field private smcServerUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 32
    sget-object v0, Lcom/shengpay/express/smc/enums/Stage;->PROD:Lcom/shengpay/express/smc/enums/Stage;

    sput-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->targetStage:Lcom/shengpay/express/smc/enums/Stage;

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->REMOTE_URL_RECEIVE_ORDER_MAP:Ljava/util/Map;

    .line 37
    sget-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->REMOTE_URL_RECEIVE_ORDER_MAP:Ljava/util/Map;

    sget-object v1, Lcom/shengpay/express/smc/enums/Stage;->TEST:Lcom/shengpay/express/smc/enums/Stage;

    const-string v2, "http://smctest.shengpay.com/html5-gateway-general/"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->REMOTE_URL_RECEIVE_ORDER_MAP:Ljava/util/Map;

    sget-object v1, Lcom/shengpay/express/smc/enums/Stage;->PROD:Lcom/shengpay/express/smc/enums/Stage;

    const-string v2, "https://api.shengpay.com/html5-gateway/"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->REMOTE_URL_RECEIVE_ORDER_MAP:Ljava/util/Map;

    sget-object v1, Lcom/shengpay/express/smc/enums/Stage;->PREPROD:Lcom/shengpay/express/smc/enums/Stage;

    const-string v2, "https://premas.shengpay.com/html5-gateway/"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "stage"    # Ljava/lang/String;
    .param p3, "isDebug"    # Z

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput v0, p0, Lcom/shengpay/express/smc/utils/ConfigUtil;->authRetryCount:I

    .line 53
    invoke-static {p2}, Lcom/shengpay/express/smc/enums/Stage;->valueOf(Ljava/lang/String;)Lcom/shengpay/express/smc/enums/Stage;

    move-result-object v0

    sput-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->targetStage:Lcom/shengpay/express/smc/enums/Stage;

    .line 54
    sget-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->REMOTE_URL_RECEIVE_ORDER_MAP:Ljava/util/Map;

    sget-object v1, Lcom/shengpay/express/smc/utils/ConfigUtil;->targetStage:Lcom/shengpay/express/smc/enums/Stage;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/shengpay/express/smc/utils/ConfigUtil;->smcServerUrl:Ljava/lang/String;

    .line 55
    iput-boolean p3, p0, Lcom/shengpay/express/smc/utils/ConfigUtil;->isDebug:Z

    .line 57
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;Ljava/lang/String;Z)Lcom/shengpay/express/smc/utils/ConfigUtil;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "stage"    # Ljava/lang/String;
    .param p2, "isDebug"    # Z

    .prologue
    .line 66
    const-class v1, Lcom/shengpay/express/smc/utils/ConfigUtil;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->config:Lcom/shengpay/express/smc/utils/ConfigUtil;

    if-nez v0, :cond_0

    .line 67
    new-instance v0, Lcom/shengpay/express/smc/utils/ConfigUtil;

    invoke-direct {v0, p0, p1, p2}, Lcom/shengpay/express/smc/utils/ConfigUtil;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    sput-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->config:Lcom/shengpay/express/smc/utils/ConfigUtil;

    .line 69
    :cond_0
    sget-object v0, Lcom/shengpay/express/smc/utils/ConfigUtil;->config:Lcom/shengpay/express/smc/utils/ConfigUtil;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 66
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public getAuthRetryCount()I
    .locals 1

    .prologue
    .line 81
    iget v0, p0, Lcom/shengpay/express/smc/utils/ConfigUtil;->authRetryCount:I

    return v0
.end method

.method public getSmcServerUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/shengpay/express/smc/utils/ConfigUtil;->smcServerUrl:Ljava/lang/String;

    return-object v0
.end method

.method public isDebug()Z
    .locals 1

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/shengpay/express/smc/utils/ConfigUtil;->isDebug:Z

    return v0
.end method

.method public setAuthRetryCount(I)V
    .locals 0
    .param p1, "authRetryCount"    # I

    .prologue
    .line 85
    iput p1, p0, Lcom/shengpay/express/smc/utils/ConfigUtil;->authRetryCount:I

    .line 86
    return-void
.end method
