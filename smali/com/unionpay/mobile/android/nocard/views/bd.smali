.class public final Lcom/unionpay/mobile/android/nocard/views/bd;
.super Lcom/unionpay/mobile/android/nocard/views/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/mobile/android/nocard/views/bd$a;
    }
.end annotation


# instance fields
.field private r:Landroid/widget/TextView;

.field private s:Landroid/view/View$OnClickListener;

.field private t:Lcom/unionpay/mobile/android/nocard/views/bd$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/b;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/be;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/be;-><init>(Lcom/unionpay/mobile/android/nocard/views/bd;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->s:Landroid/view/View$OnClickListener;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/bd;->e()V

    const-string v0, "result"

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->q:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iput-object v1, v0, Lcom/unionpay/mobile/android/model/b;->aq:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->aV:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->e:Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

    const-string v1, "bingopromotion"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;->c(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/nocard/views/bd;)V
    .locals 0

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/bd;->t()V

    return-void
.end method

.method private t()V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget v1, v1, Lcom/unionpay/mobile/android/model/b;->aQ:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "functionEx"

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget v1, v1, Lcom/unionpay/mobile/android/model/b;->aQ:I

    sget-object v2, Lcom/unionpay/mobile/android/views/order/l;->b:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget v1, v1, Lcom/unionpay/mobile/android/model/b;->aQ:I

    sget-object v2, Lcom/unionpay/mobile/android/views/order/l;->c:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/utils/PreferenceUtils;->c(Landroid/content/Context;Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    const-string v1, "success"

    iput-object v1, v0, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/bd;->k()V

    return-void
.end method


# virtual methods
.method public final a(Lorg/json/JSONObject;)V
    .locals 3

    const-string v0, "luck_draw"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/utils/i;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->t:Lcom/unionpay/mobile/android/nocard/views/bd$a;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/nocard/views/bd$a;->setVisibility(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->t:Lcom/unionpay/mobile/android/nocard/views/bd$a;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/nocard/views/bd$a;->a(Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method protected final b()V
    .locals 5

    const/4 v4, -0x1

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v4, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    new-instance v1, Lcom/unionpay/mobile/android/widgets/ay;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/bd;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v3, Lcom/unionpay/mobile/android/model/b;->A:Ljava/lang/String;

    invoke-direct {v1, v2, v3, p0}, Lcom/unionpay/mobile/android/widgets/ay;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/unionpay/mobile/android/widgets/ay$a;)V

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/ay;->a()V

    const/16 v2, 0xd

    invoke-virtual {v0, v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->k:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v1, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final b(I)V
    .locals 0

    return-void
.end method

.method protected final c()V
    .locals 8

    const/4 v7, -0x2

    const v2, -0x10100c

    const/4 v6, -0x1

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/bd;->g()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->invalidate()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->o:Lcom/unionpay/mobile/android/upwidget/UPScrollView;

    invoke-virtual {v0, v2}, Lcom/unionpay/mobile/android/upwidget/UPScrollView;->setBackgroundColor(I)V

    new-instance v0, Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setId(I)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0xa

    invoke-virtual {v1, v2, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    sget v2, Lcom/unionpay/mobile/android/global/a;->d:I

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->m:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setId(I)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    sget v3, Lcom/unionpay/mobile/android/global/a;->d:I

    iput v3, v2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sget v2, Lcom/unionpay/mobile/android/global/a;->n:I

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v4, 0x7d8

    invoke-virtual {v3, v4}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    new-instance v4, Landroid/widget/TextView;

    iget-object v5, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setId(I)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    sget-object v5, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v5, v5, Lcom/unionpay/mobile/android/languages/c;->E:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    sget v5, Lcom/unionpay/mobile/android/global/b;->i:F

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    invoke-static {}, Lcom/unionpay/mobile/android/nocard/views/bd;->p()Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    const/16 v5, 0x11

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->s:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v6, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {v2, v4}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v2

    iput v2, v3, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iput v2, v3, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    const/16 v2, 0x9

    invoke-virtual {v3, v2, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v2, 0xf

    invoke-virtual {v3, v2, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->r:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Lcom/unionpay/mobile/android/nocard/views/bd$a;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v2, p0, v3}, Lcom/unionpay/mobile/android/nocard/views/bd$a;-><init>(Lcom/unionpay/mobile/android/nocard/views/bd;Landroid/content/Context;)V

    iput-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->t:Lcom/unionpay/mobile/android/nocard/views/bd$a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->t:Lcom/unionpay/mobile/android/nocard/views/bd$a;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/unionpay/mobile/android/nocard/views/bd$a;->setVisibility(I)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/4 v3, 0x3

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getId()I

    move-result v1

    invoke-virtual {v2, v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-static {v1, v3}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v1

    iput v1, v2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->t:Lcom/unionpay/mobile/android/nocard/views/bd$a;

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method protected final f()V
    .locals 14

    const/4 v1, 0x0

    const/4 v13, -0x2

    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v10, -0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->H:Lorg/json/JSONArray;

    if-eqz v0, :cond_3

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->B:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v3, Lcom/unionpay/mobile/android/model/b;->B:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const v3, -0xea7568

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v12}, Landroid/widget/TextView;->setGravity(I)V

    sget v3, Lcom/unionpay/mobile/android/global/a;->d:I

    invoke-virtual {v0, v11, v3, v11, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v3

    invoke-virtual {v3, v12}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v10, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v3, -0x6a2d02

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    sget v4, Lcom/unionpay/mobile/android/global/a;->d:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->l:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v3, v0, Lcom/unionpay/mobile/android/model/b;->H:Lorg/json/JSONArray;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v4, 0x2

    if-lt v0, v4, :cond_2

    const/4 v0, 0x2

    :goto_0
    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-static {v4, v3, v11, v0}, Lcom/unionpay/mobile/android/nocard/views/bh;->a(Landroid/content/Context;Lorg/json/JSONArray;II)Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {v4, v11}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v10, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v2, v5, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v2, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v1

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-static {v4, v3, v0, v1}, Lcom/unionpay/mobile/android/nocard/views/bh;->a(Landroid/content/Context;Lorg/json/JSONArray;II)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v11}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v10, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->l:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    new-instance v0, Lcom/unionpay/mobile/android/widgets/as;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/unionpay/mobile/android/widgets/as;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setId(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->l:Landroid/view/ViewGroup;

    new-instance v2, Lcom/unionpay/mobile/android/nocard/views/bf;

    invoke-direct {v2, p0}, Lcom/unionpay/mobile/android/nocard/views/bf;-><init>(Lcom/unionpay/mobile/android/nocard/views/bd;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v10, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v11, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->l:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_1
    return-void

    :cond_2
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v0

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v0

    new-instance v4, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v4, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v4, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->l:Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const/high16 v5, 0x41c80000    # 25.0f

    invoke-static {v3, v5}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v3

    new-instance v5, Landroid/widget/ImageView;

    iget-object v6, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iget-object v6, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v7, 0x40b

    invoke-virtual {v6, v7}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v5, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v0, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v2, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v6, v0, Lcom/unionpay/mobile/android/model/b;->aR:Ljava/lang/String;

    invoke-static {v6}, Lcom/unionpay/mobile/android/utils/h;->b(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const/16 v0, 0x3c

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-eq v10, v7, :cond_c

    invoke-virtual {v6, v11, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :goto_2
    const/16 v2, 0x3e

    invoke-virtual {v6, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v8, v2, 0x1

    if-eq v10, v8, :cond_b

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    move-object v3, v2

    :goto_3
    add-int/lit8 v2, v7, 0x1

    add-int/lit8 v9, v8, -0x1

    if-eq v10, v7, :cond_a

    if-ge v2, v9, :cond_a

    if-eq v8, v10, :cond_a

    invoke-virtual {v6, v2, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/mobile/android/utils/h;->b(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_a

    const-string v6, "#"

    invoke-virtual {v2, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_a

    array-length v2, v6

    const/4 v7, 0x2

    if-ne v2, v7, :cond_a

    aget-object v2, v6, v11

    aget-object v1, v6, v12

    :goto_4
    invoke-static {v0, v2, v1, v3}, Lcom/unionpay/mobile/android/utils/h;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    :cond_4
    if-eqz v1, :cond_5

    new-instance v0, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_5
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aS:Ljava/lang/String;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/bd;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/unionpay/mobile/android/global/b;->l:F

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->aS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, -0x99999a

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_6
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aT:Ljava/lang/String;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/bd;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/unionpay/mobile/android/global/b;->l:F

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0x99999a

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->aT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_7
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v0

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v2, -0x10100c

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v10, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v2, v3}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v2

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v4, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v0, 0x8

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const-string v0, "0"

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aW:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->aX:Ljava/lang/String;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/bd;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    new-instance v0, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/unionpay/mobile/android/global/b;->l:F

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->aX:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_8
    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v1, 0x402

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    if-eqz v0, :cond_9

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_9
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v2, v3}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v2

    invoke-direct {v0, v10, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bd;->l:Landroid/view/ViewGroup;

    invoke-virtual {v2, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_1

    :cond_a
    move-object v2, v1

    goto/16 :goto_4

    :cond_b
    move-object v3, v1

    goto/16 :goto_3

    :cond_c
    move-object v0, v1

    goto/16 :goto_2
.end method

.method public final l()V
    .locals 0

    invoke-direct {p0}, Lcom/unionpay/mobile/android/nocard/views/bd;->t()V

    return-void
.end method
