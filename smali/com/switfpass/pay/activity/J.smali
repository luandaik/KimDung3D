.class final Lcom/switfpass/pay/activity/J;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private synthetic aJ:Lcom/switfpass/pay/activity/QrcodeActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/QrcodeActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/J;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/switfpass/pay/activity/J;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-static {v2}, Lcom/switfpass/pay/activity/QrcodeActivity;->e(Lcom/switfpass/pay/activity/QrcodeActivity;)Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/J;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->finish()V

    return-void
.end method
