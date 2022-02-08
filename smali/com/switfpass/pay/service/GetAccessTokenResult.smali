.class public Lcom/switfpass/pay/service/GetAccessTokenResult;
.super Ljava/lang/Object;


# instance fields
.field public accessToken:Ljava/lang/String;

.field public errCode:I

.field public errMsg:Ljava/lang/String;

.field public expiresIn:I

.field public localRetCode:Lcom/switfpass/pay/enmu/LocalRetCode;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/switfpass/pay/enmu/LocalRetCode;->ERR_OTHER:Lcom/switfpass/pay/enmu/LocalRetCode;

    iput-object v0, p0, Lcom/switfpass/pay/service/GetAccessTokenResult;->localRetCode:Lcom/switfpass/pay/enmu/LocalRetCode;

    return-void
.end method


# virtual methods
.method public parseFrom(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    const-string v0, "MicroMsg.SDKSample.PayActivity.GetAccessTokenResult"

    const-string v1, "parseFrom fail, content is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/switfpass/pay/enmu/LocalRetCode;->ERR_JSON:Lcom/switfpass/pay/enmu/LocalRetCode;

    iput-object v0, p0, Lcom/switfpass/pay/service/GetAccessTokenResult;->localRetCode:Lcom/switfpass/pay/enmu/LocalRetCode;

    :goto_0
    return-void

    :cond_1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "access_token"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "access_token"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/switfpass/pay/service/GetAccessTokenResult;->accessToken:Ljava/lang/String;

    const-string v1, "expires_in"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/switfpass/pay/service/GetAccessTokenResult;->expiresIn:I

    sget-object v0, Lcom/switfpass/pay/enmu/LocalRetCode;->ERR_OK:Lcom/switfpass/pay/enmu/LocalRetCode;

    iput-object v0, p0, Lcom/switfpass/pay/service/GetAccessTokenResult;->localRetCode:Lcom/switfpass/pay/enmu/LocalRetCode;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v0, Lcom/switfpass/pay/enmu/LocalRetCode;->ERR_JSON:Lcom/switfpass/pay/enmu/LocalRetCode;

    iput-object v0, p0, Lcom/switfpass/pay/service/GetAccessTokenResult;->localRetCode:Lcom/switfpass/pay/enmu/LocalRetCode;

    goto :goto_0

    :cond_2
    :try_start_1
    const-string v1, "errcode"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/switfpass/pay/service/GetAccessTokenResult;->errCode:I

    const-string v1, "errmsg"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/service/GetAccessTokenResult;->errMsg:Ljava/lang/String;

    sget-object v0, Lcom/switfpass/pay/enmu/LocalRetCode;->ERR_JSON:Lcom/switfpass/pay/enmu/LocalRetCode;

    iput-object v0, p0, Lcom/switfpass/pay/service/GetAccessTokenResult;->localRetCode:Lcom/switfpass/pay/enmu/LocalRetCode;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
