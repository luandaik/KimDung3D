.class final Lcom/switfpass/pay/activity/f;
.super Landroid/os/AsyncTask;


# instance fields
.field private synthetic g:Lcom/switfpass/pay/activity/PayPlugin;

.field private j:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>(Lcom/switfpass/pay/activity/PayPlugin;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/f;->g:Lcom/switfpass/pay/activity/PayPlugin;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method private varargs a()Ljava/util/Map;
    .locals 6

    const/4 v0, 0x0

    const-string v1, "https://pay.swiftpass.cn/pay/gateway"

    iget-object v2, p0, Lcom/switfpass/pay/activity/f;->g:Lcom/switfpass/pay/activity/PayPlugin;

    invoke-static {v2}, Lcom/switfpass/pay/activity/PayPlugin;->a(Lcom/switfpass/pay/activity/PayPlugin;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "PayPlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "doInBackground, url = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "PayPlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "doInBackground, entity = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Lcom/switfpass/pay/service/GetPrepayIdResult;

    invoke-direct {v3}, Lcom/switfpass/pay/service/GetPrepayIdResult;-><init>()V

    invoke-static {v1, v2}, Lcom/switfpass/pay/utils/Util;->httpPost(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v1

    if-eqz v1, :cond_0

    array-length v2, v1

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([B)V

    const-string v1, "PayPlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "doInBackground, content = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v3, v2}, Lcom/switfpass/pay/service/GetPrepayIdResult;->parseFrom(Ljava/lang/String;)V

    :try_start_0
    invoke-static {v2}, Lcom/switfpass/pay/utils/XmlUtils;->parse(Ljava/lang/String;)Ljava/util/HashMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method protected final varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    invoke-direct {p0}, Lcom/switfpass/pay/activity/f;->a()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected final onCancelled()V
    .locals 0

    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    return-void
.end method

.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 4

    const/4 v3, 0x1

    check-cast p1, Ljava/util/Map;

    iget-object v0, p0, Lcom/switfpass/pay/activity/f;->j:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/f;->j:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    :cond_0
    if-eqz p1, :cond_1

    const-string v0, "status"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/activity/f;->g:Lcom/switfpass/pay/activity/PayPlugin;

    sget v1, Lcom/switfpass/pay/R$string;->get_prepayid_succ:I

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    const-string v0, "services"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/bean/RequestMsg;

    invoke-direct {v2}, Lcom/switfpass/pay/bean/RequestMsg;-><init>()V

    const-string v1, "token_id"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Lcom/switfpass/pay/bean/RequestMsg;->setTokenId(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setServerType(Ljava/lang/String;)V

    const-string v0, "wx2a5538052969956e"

    invoke-virtual {v2, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setAppId(Ljava/lang/String;)V

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v2, v0, v1}, Lcom/switfpass/pay/bean/RequestMsg;->setMoney(D)V

    sget-object v0, Lcom/switfpass/pay/MainApplication;->PAY_WX_WAP:Ljava/lang/String;

    invoke-virtual {v2, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeType(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/f;->g:Lcom/switfpass/pay/activity/PayPlugin;

    invoke-static {v0, v2}, Lcom/switfpass/pay/activity/PayPlugin;->unifiedH5Pay(Landroid/app/Activity;Lcom/switfpass/pay/bean/RequestMsg;)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/activity/f;->g:Lcom/switfpass/pay/activity/PayPlugin;

    iget-object v1, p0, Lcom/switfpass/pay/activity/f;->g:Lcom/switfpass/pay/activity/PayPlugin;

    sget v2, Lcom/switfpass/pay/R$string;->get_prepayid_fail:I

    invoke-virtual {v1, v2}, Lcom/switfpass/pay/activity/PayPlugin;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method protected final onPreExecute()V
    .locals 4

    iget-object v0, p0, Lcom/switfpass/pay/activity/f;->g:Lcom/switfpass/pay/activity/PayPlugin;

    const-string v1, ""

    iget-object v2, p0, Lcom/switfpass/pay/activity/f;->g:Lcom/switfpass/pay/activity/PayPlugin;

    sget v3, Lcom/switfpass/pay/R$string;->getting_prepayid:I

    invoke-virtual {v2, v3}, Lcom/switfpass/pay/activity/PayPlugin;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/activity/f;->j:Landroid/app/ProgressDialog;

    return-void
.end method
