.class public Lcom/heitao/platform/pay/weixin/HTPWeiXinAppRegister;
.super Landroid/content/BroadcastReceiver;
.source "HTPWeiXinAppRegister.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 18
    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/tencent/mm/sdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/sdk/openapi/IWXAPI;

    move-result-object v0

    .line 19
    .local v0, "msgApi":Lcom/tencent/mm/sdk/openapi/IWXAPI;
    const-string v1, "wxc4d71ad256b23976"

    invoke-interface {v0, v1}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->registerApp(Ljava/lang/String;)Z

    .line 20
    return-void
.end method
