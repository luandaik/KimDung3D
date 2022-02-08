.class final Lcom/switfpass/pay/activity/n;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;


# instance fields
.field private synthetic ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/n;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/n;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/n;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    return-object v0
.end method


# virtual methods
.method public final cancel()V
    .locals 4

    iget-object v0, p0, Lcom/switfpass/pay/activity/n;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, p0, Lcom/switfpass/pay/activity/n;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->d(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Lcom/switfpass/pay/bean/RequestMsg;

    move-result-object v1

    const-string v2, "\u652f\u4ed8\u786e\u8ba4\u4e2d\uff0c\u8bf7\u7a0d\u5019..."

    const/4 v3, 0x1

    invoke-static {v0, v1, v2, v3}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Z)V

    return-void
.end method

.method public final handleOkBtn(Ljava/lang/String;)V
    .locals 6

    const-string v0, "\u6e29\u99a8\u63d0\u793a"

    const-string v1, "\u786e\u5b9a\u662f\u5426\u51b2\u6b63\uff1f"

    sget v2, Lcom/switfpass/pay/R$string;->pay_dialog_cancel:I

    sget v3, Lcom/switfpass/pay/R$string;->pay_dialog_ok:I

    iget-object v4, p0, Lcom/switfpass/pay/activity/n;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    new-instance v5, Lcom/switfpass/pay/activity/o;

    invoke-direct {v5, p0}, Lcom/switfpass/pay/activity/o;-><init>(Lcom/switfpass/pay/activity/n;)V

    invoke-static/range {v0 .. v5}, Lcom/switfpass/pay/utils/DialogHelper;->showDialog(Ljava/lang/String;Ljava/lang/String;IILandroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void
.end method
