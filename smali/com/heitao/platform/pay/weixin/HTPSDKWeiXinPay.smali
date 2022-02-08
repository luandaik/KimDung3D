.class public Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;
.super Ljava/lang/Object;
.source "HTPSDKWeiXinPay.java"


# static fields
.field public static final APP_ID:Ljava/lang/String; = "wxc4d71ad256b23976"

.field public static final PARTNER_ID:Ljava/lang/String; = "1220213701"

.field private static mInstance:Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;


# instance fields
.field public mApi:Lcom/tencent/mm/sdk/openapi/IWXAPI;

.field public mPayListener:Lcom/heitao/platform/listener/HTPPayListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mInstance:Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object v0, p0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 24
    iput-object v0, p0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mApi:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    .line 17
    return-void
.end method

.method public static getInstance()Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mInstance:Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    invoke-direct {v0}, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;-><init>()V

    sput-object v0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mInstance:Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    .line 33
    :cond_0
    sget-object v0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mInstance:Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    return-object v0
.end method


# virtual methods
.method public init(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    const-string v0, "wxc4d71ad256b23976"

    invoke-static {p1, v0}, Lcom/tencent/mm/sdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/sdk/openapi/IWXAPI;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mApi:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    .line 39
    return-void
.end method

.method public pay(Landroid/app/Activity;Lcom/heitao/platform/model/HTPPayInfo;Lorg/json/JSONObject;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "payInfo"    # Lcom/heitao/platform/model/HTPPayInfo;
    .param p3, "pars"    # Lorg/json/JSONObject;
    .param p4, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    .line 43
    iput-object p4, p0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 45
    new-instance v1, Lcom/tencent/mm/sdk/modelpay/PayReq;

    invoke-direct {v1}, Lcom/tencent/mm/sdk/modelpay/PayReq;-><init>()V

    .line 46
    .local v1, "req":Lcom/tencent/mm/sdk/modelpay/PayReq;
    const-string v2, "wxc4d71ad256b23976"

    iput-object v2, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->appId:Ljava/lang/String;

    .line 47
    const-string v2, "1220213701"

    iput-object v2, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->partnerId:Ljava/lang/String;

    .line 51
    :try_start_0
    const-string v2, "prepayid"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->prepayId:Ljava/lang/String;

    .line 52
    const-string v2, "noncestr"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->nonceStr:Ljava/lang/String;

    .line 53
    const-string v2, "timestamp"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->timeStamp:Ljava/lang/String;

    .line 54
    const-string v2, "packageValue"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->packageValue:Ljava/lang/String;

    .line 55
    const-string v2, "sign"

    invoke-virtual {p3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->sign:Ljava/lang/String;

    .line 56
    const-string v2, ""

    iput-object v2, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->extData:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "appId="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->appId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 65
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "partnerId="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->partnerId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 66
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "prepayId="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->prepayId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 67
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "nonceStr="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->nonceStr:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "timeStamp="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->timeStamp:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "packageValue="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->packageValue:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 70
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "sign="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->sign:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "extData="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/tencent/mm/sdk/modelpay/PayReq;->extData:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 74
    iget-object v2, p0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mApi:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-interface {v2, v1}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/sdk/modelbase/BaseReq;)Z

    .line 75
    return-void

    .line 58
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0
.end method
