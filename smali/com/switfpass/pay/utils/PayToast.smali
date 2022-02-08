.class public Lcom/switfpass/pay/utils/PayToast;
.super Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lcom/switfpass/pay/utils/aa;

    invoke-direct {v0}, Lcom/switfpass/pay/utils/aa;-><init>()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public showToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4

    const/4 v3, 0x0

    sget v0, Lcom/switfpass/pay/R$layout;->pay_view_toast:I

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    sget v0, Lcom/switfpass/pay/R$id;->tv_content:I

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/widget/Toast;

    invoke-direct {v0, p1}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x11

    invoke-virtual {v0, v2, v3, v3}, Landroid/widget/Toast;->setGravity(III)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/Toast;->setDuration(I)V

    invoke-virtual {v0, v1}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
