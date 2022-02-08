.class final Lcom/switfpass/pay/activity/T;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic aL:Lcom/switfpass/pay/activity/S;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/S;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    const/4 v1, 0x0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1, v1, v0}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    const-string v3, "\u652f\u4ed8\u8bf7\u6c42\u5df2\u8d85\u65f6\uff0c\u8bf7\u91cd\u65b0\u751f\u6210\u4e8c\u7ef4\u7801!"

    iget-object v0, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-static {v0}, Lcom/switfpass/pay/activity/S;->a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v7

    new-instance v0, Lcom/switfpass/pay/utils/DialogInfoSdk;

    iget-object v1, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-static {v1}, Lcom/switfpass/pay/activity/S;->a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-static {v2}, Lcom/switfpass/pay/activity/S;->a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/switfpass/pay/activity/QrcodeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_title_prompt()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\u786e\u5b9a"

    const/4 v5, 0x6

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/switfpass/pay/utils/DialogInfoSdk;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;)V

    invoke-static {v7, v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->a(Lcom/switfpass/pay/activity/QrcodeActivity;Lcom/switfpass/pay/utils/DialogInfoSdk;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-static {v0}, Lcom/switfpass/pay/activity/S;->a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-static {v1}, Lcom/switfpass/pay/activity/S;->a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/switfpass/pay/activity/QrcodeActivity;->b(Lcom/switfpass/pay/activity/QrcodeActivity;)Lcom/switfpass/pay/utils/DialogInfoSdk;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/DialogHelper;->resize(Landroid/app/Activity;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-static {v0}, Lcom/switfpass/pay/activity/S;->a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->b(Lcom/switfpass/pay/activity/QrcodeActivity;)Lcom/switfpass/pay/utils/DialogInfoSdk;

    move-result-object v0

    new-instance v1, Lcom/switfpass/pay/activity/U;

    invoke-direct {v1}, Lcom/switfpass/pay/activity/U;-><init>()V

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/utils/DialogInfoSdk;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-static {v0}, Lcom/switfpass/pay/activity/S;->a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->b(Lcom/switfpass/pay/activity/QrcodeActivity;)Lcom/switfpass/pay/utils/DialogInfoSdk;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->show()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-static {v0}, Lcom/switfpass/pay/activity/S;->a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->c(Lcom/switfpass/pay/activity/QrcodeActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/activity/T;->aL:Lcom/switfpass/pay/activity/S;

    invoke-static {v1}, Lcom/switfpass/pay/activity/S;->a(Lcom/switfpass/pay/activity/S;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/switfpass/pay/activity/QrcodeActivity;->d(Lcom/switfpass/pay/activity/QrcodeActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
