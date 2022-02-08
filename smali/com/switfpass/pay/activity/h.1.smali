.class final Lcom/switfpass/pay/activity/h;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic I:Lcom/switfpass/pay/activity/PayResultActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PayResultActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/h;->I:Lcom/switfpass/pay/activity/PayResultActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/switfpass/pay/activity/h;->I:Lcom/switfpass/pay/activity/PayResultActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PayResultActivity;->a(Lcom/switfpass/pay/activity/PayResultActivity;)Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/activity/h;->I:Lcom/switfpass/pay/activity/PayResultActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PayResultActivity;->a(Lcom/switfpass/pay/activity/PayResultActivity;)Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/bean/OrderBena;->isMark()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    const/4 v1, 0x7

    const-string v2, "\u652f\u4ed8\u72b6\u6001\uff1a\u8be5\u7b14\u8ba2\u5355\u5df2\u652f\u4ed8"

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    :goto_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/h;->I:Lcom/switfpass/pay/activity/PayResultActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/PayResultActivity;->finish()V

    return-void

    :cond_0
    invoke-static {v1, v1}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(II)V

    goto :goto_0

    :cond_1
    invoke-static {v1, v1}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(II)V

    goto :goto_0
.end method
