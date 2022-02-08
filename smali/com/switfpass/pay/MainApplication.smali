.class public Lcom/switfpass/pay/MainApplication;
.super Landroid/app/Application;


# static fields
.field public static APP_ID:Ljava/lang/String;

.field public static BASE_URL:Ljava/lang/String;

.field public static PAY_GATEWAY:Ljava/lang/String;

.field public static PAY_QQ_MICROPAY:Ljava/lang/String;

.field public static PAY_QQ_PROXY_MICROPAY:Ljava/lang/String;

.field public static PAY_QQ_WAP:Ljava/lang/String;

.field public static PAY_QUERY_STAUTS:Ljava/lang/String;

.field public static PAY_UNIDFIED_MICRO:Ljava/lang/String;

.field public static PAY_WX_MICROPAY:Ljava/lang/String;

.field public static PAY_WX_WAP:Ljava/lang/String;

.field public static PAY_ZFB_MICROPAY:Ljava/lang/String;

.field public static PAY_ZFB_WAP:Ljava/lang/String;

.field public static PUBLIC_KEY:Ljava/lang/String;

.field public static QQ_SACN_TYPE:Ljava/lang/String;

.field public static QUER_STUTA:Ljava/lang/String;

.field public static SEDPACKURL:Ljava/lang/String;

.field public static SQ_UUID:Ljava/lang/String;

.field public static WX_APP_TYPE:Ljava/lang/String;

.field public static WX_SACN_TYPE:Ljava/lang/String;

.field public static ZFB_APP_TYPE:Ljava/lang/String;

.field public static ZFB_SCAN_TYPE:Ljava/lang/String;

.field public static ZFB_SCAN_TYPE2:Ljava/lang/String;

.field private static a:Ljava/lang/String;

.field protected static instance:Lcom/switfpass/pay/MainApplication;

.field public static mchId:Ljava/lang/String;

.field public static sign:Ljava/lang/String;

.field public static tokenId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "https://pay.swiftpass.cn/"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->a:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/switfpass/pay/MainApplication;->a:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "pay/unifiedsdkpay"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/MainApplication;->BASE_URL:Ljava/lang/String;

    const-string v0, "https://statecheck.swiftpass.cn"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->QUER_STUTA:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/switfpass/pay/MainApplication;->a:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "pay/gateway"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_GATEWAY:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/switfpass/pay/MainApplication;->a:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "pay/unifiedsdkpay"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_UNIDFIED_MICRO:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/switfpass/pay/MainApplication;->a:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "pay/unifiedCheck"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_QUERY_STAUTS:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/switfpass/pay/MainApplication;->a:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "pay/qqpay?token_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/switfpass/pay/MainApplication;->SQ_UUID:Ljava/lang/String;

    const-string v0, "http://huangjun.dev.swiftpass.cn/"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->SEDPACKURL:Ljava/lang/String;

    const-string v0, "pay.tenpay.native"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->QQ_SACN_TYPE:Ljava/lang/String;

    const-string v0, "pay.weixin.native"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->WX_SACN_TYPE:Ljava/lang/String;

    const-string v0, "pay.weixin.app"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->WX_APP_TYPE:Ljava/lang/String;

    const-string v0, "pay.alipay.native"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE:Ljava/lang/String;

    const-string v0, "pay.alipay.nativev2"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE2:Ljava/lang/String;

    const-string v0, "pay.alipay.app"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->ZFB_APP_TYPE:Ljava/lang/String;

    const-string v0, "pay.qq.proxy.micropay"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_QQ_PROXY_MICROPAY:Ljava/lang/String;

    const-string v0, "pay.qq.micropay"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_QQ_MICROPAY:Ljava/lang/String;

    const-string v0, "pay.weixin.micropay"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_WX_MICROPAY:Ljava/lang/String;

    const-string v0, "pay.alipay.micropay"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_ZFB_MICROPAY:Ljava/lang/String;

    const-string v0, "pay.tenpay.wappay"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_QQ_WAP:Ljava/lang/String;

    const-string v0, "pay.weixin.wappay"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_WX_WAP:Ljava/lang/String;

    const-string v0, "pay.alipay.wappay"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PAY_ZFB_WAP:Ljava/lang/String;

    const-string v0, "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB"

    sput-object v0, Lcom/switfpass/pay/MainApplication;->PUBLIC_KEY:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/switfpass/pay/MainApplication;->sign:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/switfpass/pay/MainApplication;->APP_ID:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/switfpass/pay/MainApplication;->mchId:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/switfpass/pay/MainApplication;->tokenId:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    sput-object p0, Lcom/switfpass/pay/MainApplication;->instance:Lcom/switfpass/pay/MainApplication;

    return-void
.end method

.method public static getContext()Lcom/switfpass/pay/MainApplication;
    .locals 1

    sget-object v0, Lcom/switfpass/pay/MainApplication;->instance:Lcom/switfpass/pay/MainApplication;

    return-object v0
.end method

.method public static isNetworkOK(Landroid/content/Context;)Z
    .locals 3

    const/4 v1, 0x0

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    move v0, v1

    :goto_0
    return v0

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_0
.end method
