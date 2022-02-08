.class final Lcom/switfpass/pay/activity/L;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic aJ:Lcom/switfpass/pay/activity/QrcodeActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/QrcodeActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/L;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/L;)Lcom/switfpass/pay/activity/QrcodeActivity;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/L;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    return-object v0
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    iget-object v0, p0, Lcom/switfpass/pay/activity/L;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_title_prompt()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/activity/L;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-virtual {v1}, Lcom/switfpass/pay/activity/QrcodeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_unFinished()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/switfpass/pay/activity/L;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-virtual {v2}, Lcom/switfpass/pay/activity/QrcodeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_str_btnCancel()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/switfpass/pay/activity/L;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-virtual {v3}, Lcom/switfpass/pay/activity/QrcodeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_str_btnOk()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/switfpass/pay/activity/L;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    new-instance v5, Lcom/switfpass/pay/activity/M;

    invoke-direct {v5, p0}, Lcom/switfpass/pay/activity/M;-><init>(Lcom/switfpass/pay/activity/L;)V

    new-instance v6, Lcom/switfpass/pay/activity/N;

    invoke-direct {v6}, Lcom/switfpass/pay/activity/N;-><init>()V

    invoke-static/range {v0 .. v6}, Lcom/switfpass/pay/utils/DialogHelper;->showDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void
.end method
