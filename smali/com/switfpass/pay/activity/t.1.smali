.class final Lcom/switfpass/pay/activity/t;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;


# instance fields
.field private synthetic ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/t;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 0

    return-void
.end method

.method public final handleOkBtn(Ljava/lang/String;)V
    .locals 2

    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/t;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    sget v1, Lcom/switfpass/pay/R$string;->pay_code_info:I

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->showToastInfo(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/t;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->submitData(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/t;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->j(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Lcom/switfpass/pay/utils/DialogInfoSdk;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->dismiss()V

    goto :goto_0
.end method
