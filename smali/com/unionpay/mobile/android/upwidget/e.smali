.class public final Lcom/unionpay/mobile/android/upwidget/e;
.super Landroid/widget/BaseAdapter;


# instance fields
.field private a:Landroid/graphics/drawable/Drawable;

.field private b:Landroid/content/Context;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:I

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View$OnClickListener;",
            ">;"
        }
    .end annotation
.end field

.field private h:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->c:Ljava/lang/String;

    iput-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->d:Ljava/lang/String;

    const/4 v0, 0x1

    iput v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->e:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->g:Ljava/util/ArrayList;

    new-instance v0, Lcom/unionpay/mobile/android/upwidget/f;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/upwidget/f;-><init>(Lcom/unionpay/mobile/android/upwidget/e;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->h:Landroid/view/View$OnClickListener;

    iput-object p1, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    iput-object p2, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    iput-object p3, p0, Lcom/unionpay/mobile/android/upwidget/e;->c:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->e:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/mobile/android/resource/c;->a(Landroid/content/Context;)Lcom/unionpay/mobile/android/resource/c;

    move-result-object v0

    const/16 v1, 0x3f7

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->a:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/upwidget/e;)Ljava/util/ArrayList;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->g:Ljava/util/ArrayList;

    return-object v0
.end method

.method private b()Z
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->c:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->c:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private b(I)Z
    .locals 3

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/upwidget/e;->a()I

    move-result v0

    sub-int v0, p1, v0

    iget-object v2, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    iget-object v2, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v0, v2, :cond_0

    iget-object v2, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v2, "available"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    check-cast v0, Ljava/lang/Boolean;

    if-ne v2, v0, :cond_2

    const/4 v0, 0x0

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1
.end method


# virtual methods
.method public final a()I
    .locals 1

    invoke-direct {p0}, Lcom/unionpay/mobile/android/upwidget/e;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final a(I)V
    .locals 0

    iput p1, p0, Lcom/unionpay/mobile/android/upwidget/e;->e:I

    return-void
.end method

.method public final getCount()I
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    if-nez v2, :cond_0

    :goto_0
    return v1

    :cond_0
    iget-object v2, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/upwidget/e;->a()I

    move-result v3

    add-int/2addr v3, v2

    iget-object v2, p0, Lcom/unionpay/mobile/android/upwidget/e;->d:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/unionpay/mobile/android/upwidget/e;->d:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    move v2, v0

    :goto_1
    if-eqz v2, :cond_2

    :goto_2
    add-int v1, v3, v0

    goto :goto_0

    :cond_1
    move v2, v1

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_2
.end method

.method public final getItem(I)Ljava/lang/Object;
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p1, v1, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/upwidget/e;->a()I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public final getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 14

    invoke-virtual {p0, p1}, Lcom/unionpay/mobile/android/upwidget/e;->getItem(I)Ljava/lang/Object;

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->f:Ljava/util/List;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/upwidget/e;->a()I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v1, "style"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "keys"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    const-string v3, "values"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    new-instance v4, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-direct {v4, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v5, Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-direct {v5, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sget v6, Lcom/unionpay/mobile/android/global/b;->g:I

    invoke-virtual {v5, v6, v6, v6, v6}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v7, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-direct {v7, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v3, -0x342f27

    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v9, 0x1

    invoke-direct {v8, v3, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v3, Landroid/widget/ImageView;

    iget-object v9, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-direct {v3, v9}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/4 v9, 0x4

    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v9

    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setId(I)V

    new-instance v9, Landroid/widget/TextView;

    iget-object v10, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-direct {v9, v10}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget v1, Lcom/unionpay/mobile/android/global/b;->i:F

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0x99999a

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    const/high16 v10, 0x41a00000    # 20.0f

    invoke-static {v1, v10}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v10

    iget v1, p0, Lcom/unionpay/mobile/android/upwidget/e;->e:I

    if-ne v1, p1, :cond_1

    const/16 v1, 0x3f0

    :goto_0
    iget-object v11, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    const/high16 v12, 0x41a00000    # 20.0f

    invoke-static {v11, v12}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v11

    iget-object v12, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-static {v12}, Lcom/unionpay/mobile/android/resource/c;->a(Landroid/content/Context;)Lcom/unionpay/mobile/android/resource/c;

    move-result-object v12

    invoke-virtual {v12, v1, v10, v10}, Lcom/unionpay/mobile/android/resource/c;->a(III)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/upwidget/e;->b(I)Z

    move-result v10

    if-eqz v10, :cond_0

    const/4 v10, 0x0

    invoke-virtual {v3, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_0
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/e;->a:Landroid/graphics/drawable/Drawable;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v11, v11}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v10, 0xf

    const/4 v11, -0x1

    invoke-virtual {v1, v10, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v10, 0x9

    const/4 v11, -0x1

    invoke-virtual {v1, v10, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v5, v3, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v10, -0x2

    const/4 v11, -0x2

    invoke-direct {v1, v10, v11}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v10, 0xf

    const/4 v11, -0x1

    invoke-virtual {v1, v10, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/4 v10, 0x1

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v1, v10, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    sget v3, Lcom/unionpay/mobile/android/global/b;->g:I

    iput v3, v1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v5, v9, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v9, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-direct {v9, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/4 v1, 0x5

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v9}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setId(I)V

    new-instance v10, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-direct {v10, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/4 v1, 0x5

    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v10}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->setId(I)V

    const/4 v1, 0x0

    move v3, v1

    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    if-ge v3, v1, :cond_2

    new-instance v11, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-direct {v11, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget v1, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0x666667

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v13, -0x2

    invoke-direct {v12, v1, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v1, 0x5

    iput v1, v12, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v9, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v11, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    invoke-direct {v11, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget v1, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0x666667

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v10, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v1, v3, 0x1

    move v3, v1

    goto :goto_1

    :cond_1
    const/16 v1, 0x3ef

    goto/16 :goto_0

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    const/high16 v1, 0x42f00000    # 120.0f

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v0

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v0, 0xb

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v5, v10, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/e;->b:Landroid/content/Context;

    const/high16 v1, 0x42c80000    # 100.0f

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v0

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/4 v0, 0x0

    invoke-virtual {v10}, Landroid/widget/LinearLayout;->getId()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v5, v9, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput v6, v8, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v6, v8, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v4, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v4
.end method

.method public final isEnabled(I)Z
    .locals 1

    invoke-direct {p0}, Lcom/unionpay/mobile/android/upwidget/e;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/upwidget/e;->b(I)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_2
    invoke-super {p0, p1}, Landroid/widget/BaseAdapter;->isEnabled(I)Z

    move-result v0

    goto :goto_0
.end method
