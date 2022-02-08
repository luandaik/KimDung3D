.class public Lcom/switfpass/pay/utils/MyPopupWindowUtils;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public PAY_QQ_NATIVE1:Ljava/lang/String;

.field private bh:Landroid/content/Context;

.field private dq:Lcom/switfpass/pay/utils/MyPopupWindowUtils$OnPopuWindowItemClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/switfpass/pay/utils/MyPopupWindowUtils$OnPopuWindowItemClickListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "pay.qq.jspay"

    iput-object v0, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->PAY_QQ_NATIVE1:Ljava/lang/String;

    iput-object p1, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->bh:Landroid/content/Context;

    iput-object p2, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->dq:Lcom/switfpass/pay/utils/MyPopupWindowUtils$OnPopuWindowItemClickListener;

    return-void
.end method


# virtual methods
.method public getPayHelpDialog(Ljava/lang/String;I)Landroid/widget/PopupWindow;
    .locals 5

    const/4 v4, 0x1

    iget-object v0, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->bh:Landroid/content/Context;

    sget v1, Lcom/switfpass/pay/R$layout;->micropay_help_layout:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/widget/PopupWindow;

    const/4 v2, -0x1

    invoke-direct {v1, v0, p2, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    sget v2, Lcom/switfpass/pay/R$id;->micropay_help_img:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    sget-object v2, Lcom/switfpass/pay/MainApplication;->QQ_SACN_TYPE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->PAY_QQ_NATIVE1:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    iget-object v2, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->bh:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/switfpass/pay/R$drawable;->micropay_help_qq:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    new-instance v2, Lcom/switfpass/pay/utils/i;

    invoke-direct {v2, v1}, Lcom/switfpass/pay/utils/i;-><init>(Landroid/widget/PopupWindow;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, p2}, Landroid/widget/PopupWindow;->setWidth(I)V

    const v0, 0x1030002

    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->update()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->bh:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x106000d

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    return-object v1

    :cond_1
    sget-object v2, Lcom/switfpass/pay/MainApplication;->ZFB_SCAN_TYPE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->bh:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/switfpass/pay/R$drawable;->micropay_help_zfb:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->bh:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/switfpass/pay/R$drawable;->micropay_help_weixin:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->dq:Lcom/switfpass/pay/utils/MyPopupWindowUtils$OnPopuWindowItemClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/MyPopupWindowUtils;->dq:Lcom/switfpass/pay/utils/MyPopupWindowUtils$OnPopuWindowItemClickListener;

    invoke-interface {v0, p1}, Lcom/switfpass/pay/utils/MyPopupWindowUtils$OnPopuWindowItemClickListener;->onPopuWindowItemClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method
