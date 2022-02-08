.class final Lcom/switfpass/pay/activity/w;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private synthetic ap:Lcom/switfpass/pay/activity/v;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/v;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/w;->ap:Lcom/switfpass/pay/activity/v;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    const/4 v0, 0x6

    const/16 v1, 0x8

    const-string v2, "\u5df2\u9000\u51fa\u53cd\u626b\u652f\u4ed8"

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/w;->ap:Lcom/switfpass/pay/activity/v;

    invoke-static {v0}, Lcom/switfpass/pay/activity/v;->a(Lcom/switfpass/pay/activity/v;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->finish()V

    return-void
.end method
