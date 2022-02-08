.class public Lcom/shengpay/express/smc/WebAppInterface;
.super Ljava/lang/Object;
.source "WebAppInterface.java"


# instance fields
.field private configUtil:Lcom/shengpay/express/smc/utils/ConfigUtil;

.field private handler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Lcom/shengpay/express/smc/utils/ConfigUtil;Ljava/lang/StringBuffer;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "handler"    # Landroid/os/Handler;
    .param p3, "configUtil"    # Lcom/shengpay/express/smc/utils/ConfigUtil;
    .param p4, "logStrBuffer"    # Ljava/lang/StringBuffer;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p2, p0, Lcom/shengpay/express/smc/WebAppInterface;->handler:Landroid/os/Handler;

    .line 21
    iput-object p3, p0, Lcom/shengpay/express/smc/WebAppInterface;->configUtil:Lcom/shengpay/express/smc/utils/ConfigUtil;

    .line 22
    return-void
.end method


# virtual methods
.method public close(Ljava/lang/String;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 76
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 77
    .local v0, "message":Landroid/os/Message;
    const/16 v1, 0x3e9

    iput v1, v0, Landroid/os/Message;->what:I

    .line 78
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 79
    iget-object v1, p0, Lcom/shengpay/express/smc/WebAppInterface;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 80
    return-void
.end method

.method public exitSmcClient()V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 89
    return-void
.end method

.method public getBaseUrl()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 26
    iget-object v0, p0, Lcom/shengpay/express/smc/WebAppInterface;->configUtil:Lcom/shengpay/express/smc/utils/ConfigUtil;

    invoke-virtual {v0}, Lcom/shengpay/express/smc/utils/ConfigUtil;->getSmcServerUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public gotoWalletResult(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "errCode"    # Ljava/lang/String;
    .param p2, "errMessage"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 48
    const-string v2, "ExpressSmcClientActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "--->>> errCode = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",errMessage = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 50
    .local v1, "msg":Landroid/os/Message;
    const/16 v2, 0x3ee

    iput v2, v1, Landroid/os/Message;->what:I

    .line 51
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 52
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "errCode"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    const-string v2, "errMessage"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 55
    iget-object v2, p0, Lcom/shengpay/express/smc/WebAppInterface;->handler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 56
    return-void
.end method

.method public isTestMode()Z
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 31
    iget-object v0, p0, Lcom/shengpay/express/smc/WebAppInterface;->configUtil:Lcom/shengpay/express/smc/utils/ConfigUtil;

    invoke-virtual {v0}, Lcom/shengpay/express/smc/utils/ConfigUtil;->isDebug()Z

    move-result v0

    return v0
.end method

.method public loadWebViewFinish()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 41
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 42
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x3ea

    iput v1, v0, Landroid/os/Message;->what:I

    .line 43
    iget-object v1, p0, Lcom/shengpay/express/smc/WebAppInterface;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 44
    return-void
.end method

.method public pushLog(Ljava/lang/String;)V
    .locals 2
    .param p1, "logMsg"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 68
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 69
    .local v0, "message":Landroid/os/Message;
    const/16 v1, 0x3ec

    iput v1, v0, Landroid/os/Message;->what:I

    .line 70
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 71
    iget-object v1, p0, Lcom/shengpay/express/smc/WebAppInterface;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 72
    return-void
.end method

.method public reLoadWebView()V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 60
    const-string v1, "ExpressSmcClientActivity"

    const-string v2, "reLoadWebView()"

    invoke-static {v1, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 62
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x3ed

    iput v1, v0, Landroid/os/Message;->what:I

    .line 63
    iget-object v1, p0, Lcom/shengpay/express/smc/WebAppInterface;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 64
    return-void
.end method

.method public receiptOrderFinish()V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 85
    return-void
.end method

.method public testlog(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 36
    const-string v0, "ExpressSmcClientActivity"

    invoke-static {v0, p1}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    return-void
.end method
