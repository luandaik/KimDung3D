.class final Lcom/switfpass/pay/activity/S;
.super Landroid/os/CountDownTimer;


# instance fields
.field private synthetic aJ:Lcom/switfpass/pay/activity/QrcodeActivity;


# direct methods
.method public constructor <init>(Lcom/switfpass/pay/activity/QrcodeActivity;)V
    .locals 4

    iput-object p1, p0, Lcom/switfpass/pay/activity/S;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    const-wide/32 v0, 0x1d4c0

    const-wide/16 v2, 0x7d0

    invoke-direct {p0, v0, v1, v2, v3}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/S;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    return-object v0
.end method


# virtual methods
.method public final onFinish()V
    .locals 2

    iget-object v0, p0, Lcom/switfpass/pay/activity/S;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    new-instance v1, Lcom/switfpass/pay/activity/T;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/activity/T;-><init>(Lcom/switfpass/pay/activity/S;)V

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/QrcodeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onTick(J)V
    .locals 3

    iget-object v0, p0, Lcom/switfpass/pay/activity/S;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->e(Lcom/switfpass/pay/activity/QrcodeActivity;)Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/S;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    iget-object v1, p0, Lcom/switfpass/pay/activity/S;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-static {v1}, Lcom/switfpass/pay/activity/QrcodeActivity;->e(Lcom/switfpass/pay/activity/QrcodeActivity;)Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v1

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->getTokenId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/switfpass/pay/activity/S;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-static {v2}, Lcom/switfpass/pay/activity/QrcodeActivity;->e(Lcom/switfpass/pay/activity/QrcodeActivity;)Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v2

    invoke-virtual {v2}, Lcom/switfpass/pay/bean/OrderBena;->getMchId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/activity/QrcodeActivity;->a(Lcom/switfpass/pay/activity/QrcodeActivity;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
