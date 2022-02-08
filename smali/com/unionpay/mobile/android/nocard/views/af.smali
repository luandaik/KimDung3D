.class public final Lcom/unionpay/mobile/android/nocard/views/af;
.super Lcom/unionpay/mobile/android/nocard/views/b;

# interfaces
.implements Lcom/unionpay/mobile/android/upviews/a$b;


# instance fields
.field private r:Landroid/widget/TextView;

.field private s:Landroid/view/View$OnClickListener;

.field private t:Lcom/unionpay/mobile/android/upviews/a;

.field private u:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/b;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->s:Landroid/view/View$OnClickListener;

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    const/4 v0, 0x0

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->u:I

    const/16 v0, 0xc

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->f:I

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/ag;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/ag;-><init>(Lcom/unionpay/mobile/android/nocard/views/af;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->s:Landroid/view/View$OnClickListener;

    const v0, -0x10100c

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/af;->setBackgroundColor(I)V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/af;->e()V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/nocard/views/af;)V
    .locals 3

    const/4 v0, 0x1

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->u:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->b()Lcom/unionpay/mobile/android/upviews/a$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a$a;->a()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/unionpay/mobile/android/nocard/views/af;->j:Z

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/af;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/af;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->n(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, v0, Lcom/unionpay/mobile/android/upviews/a$a;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/af;->a(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public final a(Lcom/unionpay/mobile/android/upviews/a$a;)V
    .locals 0

    return-void
.end method

.method public final a(Lorg/json/JSONObject;)V
    .locals 1

    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->u:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->b:Lcom/unionpay/mobile/android/widgets/m;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/m;->c()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {v0, p1}, Lcom/unionpay/mobile/android/nocard/utils/f;->c(Lcom/unionpay/mobile/android/model/b;Lorg/json/JSONObject;)Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->a:Lcom/unionpay/mobile/android/model/b;

    invoke-static {v0, p1}, Lcom/unionpay/mobile/android/nocard/utils/f;->b(Lcom/unionpay/mobile/android/model/b;Lorg/json/JSONObject;)I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/af;->b(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->f()V

    :cond_1
    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/nocard/views/af;->d(I)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public final a(Z)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    if-nez p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    :cond_0
    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final b()V
    .locals 5

    const/4 v4, -0x1

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v4, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->m:Ljava/lang/String;

    new-instance v2, Lcom/unionpay/mobile/android/widgets/ay;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->d:Landroid/content/Context;

    invoke-direct {v2, v3, v1, p0}, Lcom/unionpay/mobile/android/widgets/ay;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/unionpay/mobile/android/widgets/ay$a;)V

    const/16 v1, 0xd

    invoke-virtual {v0, v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/af;->k:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method protected final c()V
    .locals 9

    const/4 v8, 0x3

    const/4 v0, 0x1

    const/4 v7, -0x2

    const/4 v6, -0x1

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/af;->o:Lcom/unionpay/mobile/android/upwidget/UPScrollView;

    invoke-virtual {v1, p0}, Lcom/unionpay/mobile/android/upwidget/UPScrollView;->a(Lcom/unionpay/mobile/android/upwidget/UPScrollView$a;)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0xa

    invoke-virtual {v1, v2, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    sget v2, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    new-instance v2, Lcom/unionpay/mobile/android/upviews/a;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->d:Landroid/content/Context;

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/af;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v4, v4, Lcom/unionpay/mobile/android/model/b;->X:Lorg/json/JSONArray;

    const-string v5, ""

    invoke-direct {v2, v3, v4, p0, v5}, Lcom/unionpay/mobile/android/upviews/a;-><init>(Landroid/content/Context;Lorg/json/JSONArray;Lcom/unionpay/mobile/android/upviews/a$b;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v2, v0}, Lcom/unionpay/mobile/android/upviews/a;->setOrientation(I)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/unionpay/mobile/android/upviews/a;->setId(I)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->m:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v2, v3, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/af;->d:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->Y:Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v4, 0x3f9

    invoke-virtual {v3, v4}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/unionpay/mobile/android/upwidget/w;->a(Landroid/content/Context;Lorg/json/JSONObject;Landroid/graphics/drawable/Drawable;)Lcom/unionpay/mobile/android/upwidget/w;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/upwidget/w;->setId(I)V

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/w;->a()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/unionpay/mobile/android/nocard/views/ah;

    invoke-direct {v3, p0, v2}, Lcom/unionpay/mobile/android/nocard/views/ah;-><init>(Lcom/unionpay/mobile/android/nocard/views/af;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lcom/unionpay/mobile/android/upwidget/w;->a(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/upviews/a;->getId()I

    move-result v3

    invoke-virtual {v2, v8, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    sget v3, Lcom/unionpay/mobile/android/global/a;->d:I

    iput v3, v2, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    iput v3, v2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    sget v3, Lcom/unionpay/mobile/android/global/a;->d:I

    iput v3, v2, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->d:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->n:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    sget v3, Lcom/unionpay/mobile/android/global/b;->i:F

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    invoke-static {}, Lcom/unionpay/mobile/android/nocard/views/af;->p()Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/upviews/a;->e()Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_1
    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    sget v0, Lcom/unionpay/mobile/android/global/a;->n:I

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v3, 0x7d8

    invoke-virtual {v2, v3}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/af;->s:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v6, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/w;->getId()I

    move-result v0

    :goto_1
    invoke-virtual {v2, v8, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    sget v0, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v0, v2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->m:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/af;->r:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/af;->t:Lcom/unionpay/mobile/android/upviews/a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->getId()I

    move-result v0

    goto :goto_1
.end method

.method public final c(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public final t()V
    .locals 0

    return-void
.end method
