.class final Lcom/switfpass/pay/activity/A;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private synthetic ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

.field private final synthetic aq:Lcom/switfpass/pay/utils/ProgressInfoDialog;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Lcom/switfpass/pay/utils/ProgressInfoDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/A;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iput-object p2, p0, Lcom/switfpass/pay/activity/A;->aq:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/switfpass/pay/activity/A;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Z)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/A;->aq:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/A;->aq:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/A;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->finish()V

    :cond_0
    return-void
.end method
