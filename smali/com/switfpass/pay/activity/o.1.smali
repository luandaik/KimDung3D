.class final Lcom/switfpass/pay/activity/o;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private synthetic al:Lcom/switfpass/pay/activity/n;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/n;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/o;->al:Lcom/switfpass/pay/activity/n;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/switfpass/pay/activity/o;->al:Lcom/switfpass/pay/activity/n;

    invoke-static {v0}, Lcom/switfpass/pay/activity/n;->a(Lcom/switfpass/pay/activity/n;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/activity/o;->al:Lcom/switfpass/pay/activity/n;

    invoke-static {v1}, Lcom/switfpass/pay/activity/n;->a(Lcom/switfpass/pay/activity/n;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->d(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Lcom/switfpass/pay/bean/RequestMsg;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->payReverse(Lcom/switfpass/pay/bean/RequestMsg;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/o;->al:Lcom/switfpass/pay/activity/n;

    invoke-static {v0}, Lcom/switfpass/pay/activity/n;->a(Lcom/switfpass/pay/activity/n;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    move-result-object v0

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->af:Lcom/switfpass/pay/utils/DialogInfoSdk;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/o;->al:Lcom/switfpass/pay/activity/n;

    invoke-static {v0}, Lcom/switfpass/pay/activity/n;->a(Lcom/switfpass/pay/activity/n;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    move-result-object v0

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->af:Lcom/switfpass/pay/utils/DialogInfoSdk;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->dismiss()V

    :cond_0
    return-void
.end method
