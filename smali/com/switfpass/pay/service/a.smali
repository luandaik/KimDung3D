.class final Lcom/switfpass/pay/service/a;
.super Lcom/switfpass/pay/thread/Executable;


# instance fields
.field private final synthetic cL:Ljava/lang/String;

.field private final synthetic cM:Lcom/switfpass/pay/thread/UINotifyListener;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/service/a;->cL:Ljava/lang/String;

    iput-object p2, p0, Lcom/switfpass/pay/service/a;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/Executable;-><init>()V

    return-void
.end method

.method private p()Lcom/switfpass/pay/bean/OrderBena;
    .locals 7

    const/4 v3, 0x0

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    new-instance v6, Lcom/switfpass/pay/bean/OrderBena;

    invoke-direct {v6}, Lcom/switfpass/pay/bean/OrderBena;-><init>()V

    const-string v0, "openid"

    iget-object v1, p0, Lcom/switfpass/pay/service/a;->cL:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lcom/switfpass/pay/thread/NetHelper;->getInstance()Lcom/switfpass/pay/thread/NetHelper;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/switfpass/pay/MainApplication;->SEDPACKURL:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "spay/sendRedPack"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Lcom/switfpass/pay/thread/NetHelper;->httpsPost(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/switfpass/pay/thread/RequestResult;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0}, Lcom/switfpass/pay/thread/RequestResult;->hasError()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v0, v0, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v1, "status"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-eqz v0, :cond_0

    move-object v3, v6

    :cond_0
    :goto_0
    return-object v3

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/switfpass/pay/service/a;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    const-string v1, "\u7ea2\u5305\u53d1\u9001\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5.."

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public final synthetic execute()Ljava/lang/Object;
    .locals 1

    invoke-direct {p0}, Lcom/switfpass/pay/service/a;->p()Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v0

    return-object v0
.end method
