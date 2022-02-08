.class final Lcom/switfpass/pay/utils/D;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic ak:Ljava/lang/Object;

.field private synthetic dO:Lcom/switfpass/pay/utils/C;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/C;Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/D;->dO:Lcom/switfpass/pay/utils/C;

    iput-object p2, p0, Lcom/switfpass/pay/utils/D;->ak:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    new-instance v0, Lcom/switfpass/pay/utils/DialogInfoSdk;

    iget-object v1, p0, Lcom/switfpass/pay/utils/D;->dO:Lcom/switfpass/pay/utils/C;

    invoke-static {v1}, Lcom/switfpass/pay/utils/C;->a(Lcom/switfpass/pay/utils/C;)Lcom/switfpass/pay/utils/PayDialogInfo;

    move-result-object v1

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/switfpass/pay/utils/D;->dO:Lcom/switfpass/pay/utils/C;

    invoke-static {v2}, Lcom/switfpass/pay/utils/C;->a(Lcom/switfpass/pay/utils/C;)Lcom/switfpass/pay/utils/PayDialogInfo;

    move-result-object v2

    invoke-static {v2}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_title_prompt()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/switfpass/pay/utils/D;->ak:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\u786e\u5b9a"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/switfpass/pay/utils/DialogInfoSdk;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;)V

    iget-object v1, p0, Lcom/switfpass/pay/utils/D;->dO:Lcom/switfpass/pay/utils/C;

    invoke-static {v1}, Lcom/switfpass/pay/utils/C;->a(Lcom/switfpass/pay/utils/C;)Lcom/switfpass/pay/utils/PayDialogInfo;

    move-result-object v1

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/switfpass/pay/utils/DialogHelper;->resize(Landroid/app/Activity;Landroid/app/Dialog;)V

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->show()V

    return-void
.end method
