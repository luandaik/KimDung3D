.class final Lcom/switfpass/pay/utils/I;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic dH:Lcom/switfpass/pay/utils/PayDialogInfo;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/I;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/switfpass/pay/utils/I;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    iget-object v1, p0, Lcom/switfpass/pay/utils/I;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->e(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/bean/RequestMsg;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->qqSacndPay(Lcom/switfpass/pay/bean/RequestMsg;)V

    return-void
.end method
