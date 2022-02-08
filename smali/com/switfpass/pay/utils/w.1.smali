.class final Lcom/switfpass/pay/utils/w;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic ak:Ljava/lang/Object;

.field private synthetic dM:Lcom/switfpass/pay/utils/v;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/v;Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/w;->dM:Lcom/switfpass/pay/utils/v;

    iput-object p2, p0, Lcom/switfpass/pay/utils/w;->ak:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/switfpass/pay/utils/w;->dM:Lcom/switfpass/pay/utils/v;

    invoke-static {v0}, Lcom/switfpass/pay/utils/v;->a(Lcom/switfpass/pay/utils/v;)Lcom/switfpass/pay/utils/PayDialogInfo;

    move-result-object v0

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/utils/w;->ak:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
