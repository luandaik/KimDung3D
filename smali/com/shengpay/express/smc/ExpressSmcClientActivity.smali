.class public Lcom/shengpay/express/smc/ExpressSmcClientActivity;
.super Landroid/app/Activity;
.source "ExpressSmcClientActivity.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field private configUtil:Lcom/shengpay/express/smc/utils/ConfigUtil;

.field private errCode:Ljava/lang/String;

.field private errMessage:Ljava/lang/String;

.field private exitMsg:Landroid/os/Message;

.field private handler:Landroid/os/Handler;

.field private httpClient:Lcom/shengpay/express/smc/http/SimpleHttpClient;

.field private isFirstFinish:Ljava/lang/Boolean;

.field private isGotoWalletBack:Ljava/lang/Boolean;

.field private isGotoWalletResult:Ljava/lang/Boolean;

.field private isLoadWebViewReady:Ljava/lang/Boolean;

.field private isReceiptOrderReady:Ljava/lang/Boolean;

.field private logStrBuffer:Ljava/lang/StringBuffer;

.field private mobileHelper:Lcom/shengpay/express/smc/utils/MobileHelper;

.field private sessionToken:Ljava/lang/String;

.field private sharedPreferences:Landroid/content/SharedPreferences;

.field private splash_layout:Landroid/widget/RelativeLayout;

.field private walletResult:Ljava/lang/String;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 44
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 51
    const-string v0, "ExpressSmcClientActivity"

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->TAG:Ljava/lang/String;

    .line 52
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isLoadWebViewReady:Ljava/lang/Boolean;

    .line 53
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isReceiptOrderReady:Ljava/lang/Boolean;

    .line 54
    iput-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 55
    invoke-static {}, Lcom/shengpay/express/smc/http/SimpleHttpClient;->INSTANCE()Lcom/shengpay/express/smc/http/SimpleHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->httpClient:Lcom/shengpay/express/smc/http/SimpleHttpClient;

    .line 56
    iput-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    .line 57
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isGotoWalletResult:Ljava/lang/Boolean;

    .line 58
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isGotoWalletBack:Ljava/lang/Boolean;

    .line 59
    const-string v0, ""

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->walletResult:Ljava/lang/String;

    .line 60
    const-string v0, ""

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->errCode:Ljava/lang/String;

    .line 61
    const-string v0, ""

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->errMessage:Ljava/lang/String;

    .line 62
    const-string v0, "ExpressSmcClientActivity"

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->sessionToken:Ljava/lang/String;

    .line 63
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isFirstFinish:Ljava/lang/Boolean;

    .line 226
    new-instance v0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;

    invoke-direct {v0, p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity$1;-><init>(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V

    iput-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->handler:Landroid/os/Handler;

    .line 44
    return-void
.end method

.method static synthetic access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Landroid/os/Message;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    return-void
.end method

.method static synthetic access$10(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isGotoWalletResult:Ljava/lang/Boolean;

    return-void
.end method

.method static synthetic access$11(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 60
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->errCode:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$12(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->errMessage:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$13(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Lcom/shengpay/express/smc/utils/ConfigUtil;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->configUtil:Lcom/shengpay/express/smc/utils/ConfigUtil;

    return-object v0
.end method

.method static synthetic access$14(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Lcom/shengpay/express/smc/http/SimpleHttpClient;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->httpClient:Lcom/shengpay/express/smc/http/SimpleHttpClient;

    return-object v0
.end method

.method static synthetic access$15(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->sessionToken:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$16(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->sharedPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$17(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$18(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->sessionToken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/StringBuffer;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    return-object v0
.end method

.method static synthetic access$3(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 52
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isLoadWebViewReady:Ljava/lang/Boolean;

    return-void
.end method

.method static synthetic access$4(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isLoadWebViewReady:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$5(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isReceiptOrderReady:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$6(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V
    .locals 0

    .prologue
    .line 193
    invoke-direct {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->enterExpressSmc()V

    return-void
.end method

.method static synthetic access$7(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 53
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isReceiptOrderReady:Ljava/lang/Boolean;

    return-void
.end method

.method static synthetic access$8(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 58
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isGotoWalletBack:Ljava/lang/Boolean;

    return-void
.end method

.method static synthetic access$9(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V
    .locals 0

    .prologue
    .line 175
    invoke-direct {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->loadWebView()V

    return-void
.end method

.method private doSyncLog(Ljava/lang/String;)V
    .locals 2
    .param p1, "logStr"    # Ljava/lang/String;

    .prologue
    .line 318
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;

    invoke-direct {v1, p0, p1}, Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;-><init>(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 333
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 334
    return-void
.end method

.method private enterExpressSmc()V
    .locals 6

    .prologue
    .line 194
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->TAG:Ljava/lang/String;

    const-string v4, "enterExpressSmc()"

    invoke-static {v3, v4}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v4, "result"

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 196
    .local v2, "result":Ljava/lang/String;
    invoke-static {v2}, Lcom/shengpay/express/smc/utils/StringUtils;->hasText(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 198
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 199
    .local v1, "jo":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isGotoWalletResult:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 200
    const-string v3, "returnCode"

    iget-object v4, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->errCode:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 201
    const-string v3, "message"

    iget-object v4, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->errMessage:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 202
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "javascript:goToWalletResult("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 203
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->walletResult:Ljava/lang/String;

    .line 204
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    const-string v4, "enterExpressSmc(),isGotoWalletResult. \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 213
    :goto_0
    invoke-direct {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->hideSplash()V

    .line 224
    .end local v1    # "jo":Lorg/json/JSONObject;
    :goto_1
    return-void

    .line 205
    .restart local v1    # "jo":Lorg/json/JSONObject;
    :cond_0
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isGotoWalletBack:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 206
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "javascript:goBackToDefault("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 207
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isGotoWalletBack:Ljava/lang/Boolean;

    .line 208
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    const-string v4, "enterExpressSmc(),isGotoWalletBack. \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 214
    .end local v1    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 215
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 210
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "jo":Lorg/json/JSONObject;
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "javascript:getExpressSmcData("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 211
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    const-string v4, "enterExpressSmc(). \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 219
    .end local v1    # "jo":Lorg/json/JSONObject;
    :cond_2
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    const-string v4, "enterExpressSmc(),no result,exit. \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 220
    new-instance v3, Landroid/os/Message;

    invoke-direct {v3}, Landroid/os/Message;-><init>()V

    iput-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    .line 221
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    const-string v4, "{\"msg\":\"\u8bfb\u53d6\u8ba2\u5355\u4fe1\u606f\u5931\u8d25\"}"

    iput-object v4, v3, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 222
    invoke-virtual {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->finish()V

    goto :goto_1
.end method

.method private hideSplash()V
    .locals 2

    .prologue
    .line 313
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 314
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->splash_layout:Landroid/widget/RelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 315
    return-void
.end method

.method private init()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 78
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->TAG:Ljava/lang/String;

    const-string v4, "---------init()----start------"

    invoke-static {v3, v4}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    .line 80
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    const-string v4, "init() start. \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 81
    const-string v3, "mainwebview"

    invoke-static {p0, v3}, Lcom/shengpay/express/smc/utils/ResourceUtil;->getId(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/webkit/WebView;

    iput-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    .line 82
    const-string v3, "splash_layout"

    invoke-static {p0, v3}, Lcom/shengpay/express/smc/utils/ResourceUtil;->getId(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout;

    iput-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->splash_layout:Landroid/widget/RelativeLayout;

    .line 83
    const-string v3, "express_smc"

    invoke-virtual {p0, v3, v5}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 84
    invoke-static {p0}, Lcom/shengpay/express/smc/utils/MobileHelper;->getInstance(Landroid/app/Activity;)Lcom/shengpay/express/smc/utils/MobileHelper;

    move-result-object v3

    iput-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->mobileHelper:Lcom/shengpay/express/smc/utils/MobileHelper;

    .line 85
    invoke-virtual {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 86
    .local v0, "intent":Landroid/content/Intent;
    const-string v3, "stage"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 87
    .local v2, "stage":Ljava/lang/String;
    const-string v3, "isDebug"

    invoke-virtual {v0, v3, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 88
    .local v1, "isDebug":Ljava/lang/Boolean;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Lcom/shengpay/express/smc/utils/LogUtil;->initLog(Z)V

    .line 89
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {p0, v2, v3}, Lcom/shengpay/express/smc/utils/ConfigUtil;->getInstance(Landroid/content/Context;Ljava/lang/String;Z)Lcom/shengpay/express/smc/utils/ConfigUtil;

    move-result-object v3

    iput-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->configUtil:Lcom/shengpay/express/smc/utils/ConfigUtil;

    .line 90
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    const-string v4, "\u65b0\u5feb\u6377\u6536\u94f6\u53f0"

    invoke-static {v3, p0, v4}, Lcom/shengpay/express/smc/SdpWebAppInterface;->init(Landroid/webkit/WebView;Landroid/content/Context;Ljava/lang/String;)V

    .line 91
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    const-string v4, "init() end. \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->TAG:Ljava/lang/String;

    const-string v4, "---------init()----end------"

    invoke-static {v3, v4}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    return-void
.end method

.method private loadWebView()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 176
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    const-string v3, "loadWebView(). \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 177
    new-instance v0, Lcom/shengpay/express/smc/WebAppInterface;

    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->configUtil:Lcom/shengpay/express/smc/utils/ConfigUtil;

    iget-object v4, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    invoke-direct {v0, p0, v2, v3, v4}, Lcom/shengpay/express/smc/WebAppInterface;-><init>(Landroid/content/Context;Landroid/os/Handler;Lcom/shengpay/express/smc/utils/ConfigUtil;Ljava/lang/StringBuffer;)V

    .line 178
    .local v0, "webAppInterface":Lcom/shengpay/express/smc/WebAppInterface;
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    const-string v3, "expressSmcApp"

    invoke-virtual {v2, v0, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 179
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 180
    .local v1, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 181
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 182
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    const-string v3, "file:///android_asset/express_smc/index.html"

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 183
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    new-instance v3, Lcom/shengpay/express/smc/ExpressSmcClientActivity$3;

    invoke-direct {v3, p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity$3;-><init>(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 191
    return-void
.end method

.method private receiptOrder()V
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    const-string v1, "receiptOrder(),enter \n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;

    invoke-direct {v1, p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity$2;-><init>(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 172
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 173
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 4

    .prologue
    .line 283
    iget-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isFirstFinish:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 284
    iget-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    if-nez v1, :cond_0

    .line 285
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    iput-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    .line 286
    iget-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    const-string v2, "{\"msg\":\"\u5f02\u5e38\u9000\u51fa\"}"

    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 288
    :cond_0
    const-string v2, "test"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v1, "\u9000\u51fa\u5e94\u7528"

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    iget-object v2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v1, "\u9000\u51fa\u5e94\u7528"

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 291
    iget-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->logStrBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->doSyncLog(Ljava/lang/String;)V

    .line 292
    invoke-virtual {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 293
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "returnValue"

    iget-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 294
    const/16 v1, 0x3ea

    invoke-virtual {p0, v1, v0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->setResult(ILandroid/content/Intent;)V

    .line 295
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->exitMsg:Landroid/os/Message;

    .line 297
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->isFirstFinish:Ljava/lang/Boolean;

    .line 298
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 299
    return-void
.end method

.method public getOrderPara(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "orderInfo"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 351
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 352
    .local v4, "sb":Ljava/lang/StringBuffer;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 353
    .local v2, "jo":Lorg/json/JSONObject;
    const/4 v0, 0x0

    .line 354
    .local v0, "i":I
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 363
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 355
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 356
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v0, v5, :cond_1

    .line 357
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 361
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 359
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method public getOrderParaList(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .param p1, "orderInfo"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/message/BasicNameValuePair;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 337
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 338
    .local v5, "orderList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    const/4 v0, 0x0

    .line 339
    .local v0, "basicNameValuePair":Lorg/apache/http/message/BasicNameValuePair;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 340
    .local v2, "jo":Lorg/json/JSONObject;
    iget-object v6, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->mobileHelper:Lcom/shengpay/express/smc/utils/MobileHelper;

    invoke-virtual {v6}, Lcom/shengpay/express/smc/utils/MobileHelper;->getDeviceInfoJSON()Lorg/json/JSONObject;

    move-result-object v4

    .line 341
    .local v4, "mobileInfo":Lorg/json/JSONObject;
    const-string v6, "mobileInfo"

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 342
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 347
    return-object v5

    .line 343
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 344
    .local v3, "key":Ljava/lang/String;
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    .end local v0    # "basicNameValuePair":Lorg/apache/http/message/BasicNameValuePair;
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v3, v6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 345
    .restart local v0    # "basicNameValuePair":Lorg/apache/http/message/BasicNameValuePair;
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v1, 0x400

    .line 67
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 68
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->requestWindowFeature(I)Z

    .line 69
    const-string v0, "layout_express_smc"

    invoke-static {p0, v0}, Lcom/shengpay/express/smc/utils/ResourceUtil;->getLayoutId(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->setContentView(I)V

    .line 70
    invoke-virtual {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 71
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->TAG:Ljava/lang/String;

    const-string v1, "---------onCreae()----------"

    invoke-static {v0, v1}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    invoke-direct {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->init()V

    .line 73
    invoke-direct {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->receiptOrder()V

    .line 74
    invoke-direct {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->loadWebView()V

    .line 75
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 303
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 304
    iget-object v0, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 305
    const/4 v0, 0x1

    .line 309
    :goto_0
    return v0

    .line 307
    :cond_0
    invoke-virtual {p0}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->finish()V

    .line 309
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
