.class public Lcom/switfpass/pay/activity/PayPlugin;
.super Lcom/switfpass/pay/activity/BasePayActivity;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private e:Landroid/widget/EditText;

.field private f:Ljava/lang/String;

.field public handler:Landroid/os/Handler;

.field protected loadingDialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/switfpass/pay/activity/BasePayActivity;-><init>()V

    new-instance v0, Lcom/switfpass/pay/activity/c;

    invoke-direct {v0}, Lcom/switfpass/pay/activity/c;-><init>()V

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayPlugin;->handler:Landroid/os/Handler;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/switfpass/pay/activity/PayPlugin;->loadingDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/PayPlugin;)Ljava/lang/String;
    .locals 4

    const/16 v3, 0x2710

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "body"

    const-string v2, "sdk\u6536\u6b3e"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "service"

    const-string v2, "unified.trade.pay"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "version"

    const-string v2, "1.0"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "mch_id"

    const-string v2, "7551000001"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "notify_url"

    const-string v2, "http://zhifu.dev.swiftpass.cn/spay/notify"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    invoke-virtual {v1, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lcom/switfpass/pay/utils/MD5;->getMessageDigest([B)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/switfpass/pay/activity/PayPlugin;->f:Ljava/lang/String;

    const-string v1, "nonce_str"

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2}, Lcom/switfpass/pay/utils/MD5;->getMessageDigest([B)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "out_trade_no"

    iget-object v2, p0, Lcom/switfpass/pay/activity/PayPlugin;->f:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "mch_create_ip"

    const-string v2, "127.0.0.1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "total_fee"

    iget-object v2, p0, Lcom/switfpass/pay/activity/PayPlugin;->e:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "9d101c97133837e13dde2d32a5054abb"

    invoke-virtual {p0, v1, v0}, Lcom/switfpass/pay/activity/PayPlugin;->createSign(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "sign"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/switfpass/pay/utils/XmlUtils;->toXml(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static pay(Landroid/app/Activity;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 5

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getServerType()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\\|"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v0, 0x0

    :goto_0
    array-length v3, v2

    if-lt v0, v3, :cond_0

    new-instance v0, Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-direct {v0, p0, v1}, Lcom/switfpass/pay/utils/PayDialogInfo;-><init>(Landroid/app/Activity;Ljava/util/List;)V

    invoke-virtual {v0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->setMsg(Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-static {p0, v0}, Lcom/switfpass/pay/utils/DialogHelper;->resize(Landroid/app/Activity;Landroid/app/Dialog;)V

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->show()V

    return-void

    :cond_0
    new-instance v3, Lcom/switfpass/pay/bean/MchBean;

    invoke-direct {v3}, Lcom/switfpass/pay/bean/MchBean;-><init>()V

    aget-object v4, v2, v0

    invoke-virtual {v3, v4}, Lcom/switfpass/pay/bean/MchBean;->setTradeType(Ljava/lang/String;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static unifiedAppPay(Landroid/app/Activity;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-direct {v0, p0}, Lcom/switfpass/pay/utils/PayDialogInfo;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->setMsg(Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->unifiedAppPay(Lcom/switfpass/pay/bean/RequestMsg;)V

    return-void
.end method

.method public static unifiedH5Pay(Landroid/app/Activity;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-direct {v0, p0}, Lcom/switfpass/pay/utils/PayDialogInfo;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->setMsg(Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->unifiedH5Pay(Lcom/switfpass/pay/bean/RequestMsg;)V

    return-void
.end method

.method public static unifiedMicroPay(Landroid/app/Activity;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 3

    new-instance v0, Lcom/switfpass/pay/utils/PayToast;

    invoke-direct {v0}, Lcom/switfpass/pay/utils/PayToast;-><init>()V

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, ""

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const-string v1, "tokenid\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-virtual {v0, p0, v1}, Lcom/switfpass/pay/utils/PayToast;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_1
    invoke-static {p0, p1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->startActivity(Landroid/content/Context;Lcom/switfpass/pay/bean/RequestMsg;)V

    goto :goto_0
.end method

.method public static unifiedSacndPay(Landroid/app/Activity;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-direct {v0, p0}, Lcom/switfpass/pay/utils/PayDialogInfo;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->setMsg(Lcom/switfpass/pay/bean/RequestMsg;)V

    invoke-virtual {v0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->unifiedSacndPay(Lcom/switfpass/pay/bean/RequestMsg;)V

    return-void
.end method


# virtual methods
.method public buildPayParams(Ljava/lang/StringBuilder;Ljava/util/Map;Z)V
    .locals 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    return-void

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_1

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayPlugin;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    const-string v0, "&"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method public createSign(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    mul-int/lit8 v1, v1, 0xa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    invoke-static {v0, p2, v1}, Lcom/switfpass/pay/utils/SignUtils;->buildPayParams(Ljava/lang/StringBuilder;Ljava/util/Map;Z)V

    const-string v1, "&key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :try_start_0
    invoke-static {v0}, Lcom/switfpass/pay/utils/MD5;->md5s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    invoke-static {v0}, Lcom/switfpass/pay/utils/MD5;->md5s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/switfpass/pay/activity/BasePayActivity;->onCreate(Landroid/os/Bundle;)V

    sget v0, Lcom/switfpass/pay/R$layout;->pay_main:I

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayPlugin;->setContentView(I)V

    const/16 v0, 0x9

    iget-object v1, p0, Lcom/switfpass/pay/activity/PayPlugin;->handler:Landroid/os/Handler;

    invoke-static {v0, v1}, Lcom/switfpass/pay/handle/PayHandlerManager;->registerHandler(ILandroid/os/Handler;)V

    sget v0, Lcom/switfpass/pay/R$id;->submitPay:I

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayPlugin;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    sget v1, Lcom/switfpass/pay/R$id;->money:I

    invoke-virtual {p0, v1}, Lcom/switfpass/pay/activity/PayPlugin;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/switfpass/pay/activity/PayPlugin;->e:Landroid/widget/EditText;

    sget v1, Lcom/switfpass/pay/R$id;->body:I

    invoke-virtual {p0, v1}, Lcom/switfpass/pay/activity/PayPlugin;->findViewById(I)Landroid/view/View;

    sget v1, Lcom/switfpass/pay/R$id;->mchId:I

    invoke-virtual {p0, v1}, Lcom/switfpass/pay/activity/PayPlugin;->findViewById(I)Landroid/view/View;

    sget v1, Lcom/switfpass/pay/R$id;->notifyUrl:I

    invoke-virtual {p0, v1}, Lcom/switfpass/pay/activity/PayPlugin;->findViewById(I)Landroid/view/View;

    sget v1, Lcom/switfpass/pay/R$id;->orderNo:I

    invoke-virtual {p0, v1}, Lcom/switfpass/pay/activity/PayPlugin;->findViewById(I)Landroid/view/View;

    sget v1, Lcom/switfpass/pay/R$id;->signKey:I

    invoke-virtual {p0, v1}, Lcom/switfpass/pay/activity/PayPlugin;->findViewById(I)Landroid/view/View;

    sget v1, Lcom/switfpass/pay/R$id;->appId:I

    invoke-virtual {p0, v1}, Lcom/switfpass/pay/activity/PayPlugin;->findViewById(I)Landroid/view/View;

    sget v1, Lcom/switfpass/pay/R$id;->seller_id:I

    invoke-virtual {p0, v1}, Lcom/switfpass/pay/activity/PayPlugin;->findViewById(I)Landroid/view/View;

    new-instance v1, Lcom/switfpass/pay/activity/d;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/activity/d;-><init>(Lcom/switfpass/pay/activity/PayPlugin;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/activity/BasePayActivity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/activity/BasePayActivity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/activity/BasePayActivity;->onResume()V

    return-void
.end method

.method protected onStop()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/activity/BasePayActivity;->onStop()V

    return-void
.end method

.method public showLoading(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/activity/e;

    invoke-direct {v0, p0, p1, p2}, Lcom/switfpass/pay/activity/e;-><init>(Lcom/switfpass/pay/activity/PayPlugin;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/PayPlugin;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public urlEncode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    :try_start_0
    const-string v0, "UTF-8"

    invoke-static {p1, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    :goto_0
    return-object p1

    :catch_0
    move-exception v0

    goto :goto_0
.end method
