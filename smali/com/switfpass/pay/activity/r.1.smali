.class final Lcom/switfpass/pay/activity/r;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic ak:Ljava/lang/Object;

.field private synthetic ao:Lcom/switfpass/pay/activity/q;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/q;Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/r;->ao:Lcom/switfpass/pay/activity/q;

    iput-object p2, p0, Lcom/switfpass/pay/activity/r;->ak:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/switfpass/pay/activity/r;->ak:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/r;->ao:Lcom/switfpass/pay/activity/q;

    invoke-static {v0}, Lcom/switfpass/pay/activity/q;->a(Lcom/switfpass/pay/activity/q;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/activity/r;->ak:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->showToastInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/r;->ao:Lcom/switfpass/pay/activity/q;

    invoke-static {v0}, Lcom/switfpass/pay/activity/q;->a(Lcom/switfpass/pay/activity/q;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->finish()V

    :cond_0
    return-void
.end method
