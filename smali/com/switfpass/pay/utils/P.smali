.class final Lcom/switfpass/pay/utils/P;
.super Ljava/lang/Thread;


# instance fields
.field private synthetic dH:Lcom/switfpass/pay/utils/PayDialogInfo;

.field private final synthetic dQ:Lcom/switfpass/pay/bean/OrderBena;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/OrderBena;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/P;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    iput-object p2, p0, Lcom/switfpass/pay/utils/P;->dQ:Lcom/switfpass/pay/bean/OrderBena;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    new-instance v0, Lcom/alipay/sdk/app/PayTask;

    iget-object v1, p0, Lcom/switfpass/pay/utils/P;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/alipay/sdk/app/PayTask;-><init>(Landroid/app/Activity;)V

    iget-object v1, p0, Lcom/switfpass/pay/utils/P;->dQ:Lcom/switfpass/pay/bean/OrderBena;

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/OrderBena;->get_input_charset()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alipay/sdk/app/PayTask;->pay(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "PayDialogInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "result = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    const/4 v2, 0x1

    iput v2, v1, Landroid/os/Message;->what:I

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v0, p0, Lcom/switfpass/pay/utils/P;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    iget-object v0, v0, Lcom/switfpass/pay/utils/PayDialogInfo;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
