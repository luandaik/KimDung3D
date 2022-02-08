.class public Lcom/switfpass/pay/utils/ProgressInfoDialog;
.super Landroid/app/Dialog;


# instance fields
.field private activity:Landroid/app/Activity;

.field private dV:Landroid/widget/ImageView;

.field private dh:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V
    .locals 4

    const/4 v3, 0x0

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getStyle_dialog()I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    iput-object p1, p0, Lcom/switfpass/pay/utils/ProgressInfoDialog;->activity:Landroid/app/Activity;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_clor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getLayout_dialog()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dh:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dh:Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v3}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_pay_stop()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dV:Landroid/widget/ImageView;

    if-nez p3, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dV:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dV:Landroid/widget/ImageView;

    new-instance v1, Lcom/switfpass/pay/utils/ab;

    invoke-direct {v1, p3}, Lcom/switfpass/pay/utils/ab;-><init>(Lcom/switfpass/pay/utils/ProgressInfoDialog$HandleBtn;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dh:Landroid/view/ViewGroup;

    invoke-static {}, Lcom/switfpass/pay/lib/Resourcemap;->getById_tv_dialog()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-eqz p2, :cond_1

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/ProgressInfoDialog;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
