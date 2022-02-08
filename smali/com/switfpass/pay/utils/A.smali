.class final Lcom/switfpass/pay/utils/A;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final synthetic aq:Lcom/switfpass/pay/utils/ProgressInfoDialog;

.field private synthetic dH:Lcom/switfpass/pay/utils/PayDialogInfo;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/utils/ProgressInfoDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/A;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    iput-object p2, p0, Lcom/switfpass/pay/utils/A;->aq:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lcom/switfpass/pay/utils/A;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;Z)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/A;->aq:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/A;->aq:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    :cond_0
    return-void
.end method
