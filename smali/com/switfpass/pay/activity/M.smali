.class final Lcom/switfpass/pay/activity/M;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private synthetic aK:Lcom/switfpass/pay/activity/L;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/L;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/M;->aK:Lcom/switfpass/pay/activity/L;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/switfpass/pay/activity/M;->aK:Lcom/switfpass/pay/activity/L;

    invoke-static {v2}, Lcom/switfpass/pay/activity/L;->a(Lcom/switfpass/pay/activity/L;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/switfpass/pay/activity/QrcodeActivity;->e(Lcom/switfpass/pay/activity/QrcodeActivity;)Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/M;->aK:Lcom/switfpass/pay/activity/L;

    invoke-static {v0}, Lcom/switfpass/pay/activity/L;->a(Lcom/switfpass/pay/activity/L;)Lcom/switfpass/pay/activity/QrcodeActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->finish()V

    return-void
.end method
