.class public final Lcom/unionpay/mobile/android/widgets/a;
.super Lcom/unionpay/mobile/android/widgets/z;


# static fields
.field private static u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private a:Landroid/widget/Spinner;

.field private b:I

.field private n:Ljava/lang/String;

.field private o:Lcom/unionpay/mobile/android/upwidget/c;

.field private p:Landroid/widget/TextView;

.field private q:Landroid/widget/RelativeLayout;

.field private r:Landroid/widget/PopupWindow;

.field private s:Lcom/unionpay/mobile/android/upwidget/g;

.field private t:Ljava/util/List;
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

.field private final w:Landroid/view/View$OnClickListener;

.field private final x:Landroid/widget/AdapterView$OnItemClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 10

    const/4 v9, -0x2

    const/16 v8, 0xf

    const/4 v7, 0x1

    const/4 v2, 0x0

    const/4 v6, -0x1

    invoke-direct {p0, p1, p2, p4}, Lcom/unionpay/mobile/android/widgets/z;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->a:Landroid/widget/Spinner;

    iput v7, p0, Lcom/unionpay/mobile/android/widgets/a;->b:I

    new-instance v0, Lcom/unionpay/mobile/android/widgets/b;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/widgets/b;-><init>(Lcom/unionpay/mobile/android/widgets/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->w:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/unionpay/mobile/android/widgets/c;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/widgets/c;-><init>(Lcom/unionpay/mobile/android/widgets/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->x:Landroid/widget/AdapterView$OnItemClickListener;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v7}, Ljava/util/ArrayList;-><init>(I)V

    move v1, v2

    :goto_0
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v1, v0, :cond_0

    invoke-static {p3, v1}, Lcom/unionpay/mobile/android/utils/i;->b(Lorg/json/JSONArray;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONArray;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/unionpay/mobile/android/widgets/a;->v:Ljava/util/List;

    move v1, v2

    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    sget-object v4, Lcom/unionpay/mobile/android/widgets/a;->v:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONArray;

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v4, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONArray;

    invoke-static {v0, v7}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->l:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/unionpay/mobile/android/resource/c;->a(Landroid/content/Context;)Lcom/unionpay/mobile/android/resource/c;

    move-result-object v1

    const/16 v3, 0x7de

    invoke-virtual {v1, v3}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    new-instance v3, Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->q:Landroid/widget/RelativeLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->q:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v1}, Landroid/widget/RelativeLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->q:Landroid/widget/RelativeLayout;

    new-instance v3, Lcom/unionpay/mobile/android/widgets/d;

    invoke-direct {v3, p0}, Lcom/unionpay/mobile/android/widgets/d;-><init>(Lcom/unionpay/mobile/android/widgets/a;)V

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    sget v3, Lcom/unionpay/mobile/android/global/a;->n:I

    invoke-direct {v1, v6, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v8, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->q:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v3, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setId(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/unionpay/mobile/android/resource/c;->a(Landroid/content/Context;)Lcom/unionpay/mobile/android/resource/c;

    move-result-object v1

    const/16 v3, 0x3ea

    invoke-virtual {v1, v3}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    const/high16 v3, 0x41700000    # 15.0f

    invoke-static {v1, v3}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v1

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xb

    invoke-virtual {v3, v1, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v3, v8, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v1, v4}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v1

    iput v1, v3, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->q:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setId(I)V

    sget v3, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const v3, -0xcccccd

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setSingleLine(Z)V

    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setEms(I)V

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->bd:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v9, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v8, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v4, 0x9

    invoke-virtual {v3, v4, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    const/high16 v5, 0x41200000    # 10.0f

    invoke-static {v4, v5}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v4

    iput v4, v3, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/a;->q:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v1, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    sget v4, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    const v4, -0x99999a

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v6, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v8, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getId()I

    move-result v1

    invoke-virtual {v3, v7, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v1

    invoke-virtual {v3, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->q:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    invoke-virtual {v1, v4, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-boolean v1, p0, Lcom/unionpay/mobile/android/widgets/a;->h:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/a;->i()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/unionpay/mobile/android/widgets/a;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->q:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    :cond_2
    :goto_2
    return-void

    :cond_3
    sget-object v0, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    sget-object v0, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/a;)Landroid/widget/PopupWindow;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->r:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/a;I)V
    .locals 3

    iput p1, p0, Lcom/unionpay/mobile/android/widgets/a;->b:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->o:Lcom/unionpay/mobile/android/upwidget/c;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upwidget/c;->c()I

    move-result v0

    sub-int v0, p1, v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->o:Lcom/unionpay/mobile/android/upwidget/c;

    iget v2, p0, Lcom/unionpay/mobile/android/widgets/a;->b:I

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/upwidget/c;->a(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->p:Landroid/widget/TextView;

    sget-object v2, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/a;Landroid/view/View;)V
    .locals 9

    const/4 v8, -0x1

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->r:Landroid/widget/PopupWindow;

    if-nez v0, :cond_2

    sget-object v0, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v0, v0, Lcom/unionpay/mobile/android/languages/c;->be:Ljava/lang/String;

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->n:Ljava/lang/String;

    const/4 v0, 0x0

    sget-object v1, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    new-instance v1, Ljava/util/ArrayList;

    sget-object v0, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    move v0, v7

    :goto_0
    sget-object v2, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "text1"

    sget-object v4, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "text2"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "editable"

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    move-object v0, v1

    :cond_1
    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->t:Ljava/util/List;

    new-instance v0, Lcom/unionpay/mobile/android/upwidget/c;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/a;->t:Ljava/util/List;

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/a;->n:Ljava/lang/String;

    const-string v4, ""

    const-string v5, ""

    iget v6, p0, Lcom/unionpay/mobile/android/widgets/a;->b:I

    invoke-direct/range {v0 .. v7}, Lcom/unionpay/mobile/android/upwidget/c;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->o:Lcom/unionpay/mobile/android/upwidget/c;

    new-instance v0, Lcom/unionpay/mobile/android/upwidget/g;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/a;->o:Lcom/unionpay/mobile/android/upwidget/c;

    invoke-direct {v0, v1, v2}, Lcom/unionpay/mobile/android/upwidget/g;-><init>(Landroid/content/Context;Lcom/unionpay/mobile/android/upwidget/c;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->s:Lcom/unionpay/mobile/android/upwidget/g;

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->s:Lcom/unionpay/mobile/android/upwidget/g;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->x:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upwidget/g;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->s:Lcom/unionpay/mobile/android/upwidget/g;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->w:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upwidget/g;->a(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->s:Lcom/unionpay/mobile/android/upwidget/g;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v8, v8, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->r:Landroid/widget/PopupWindow;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v1, -0x50000000

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/a;->r:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->r:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->update()V

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->r:Landroid/widget/PopupWindow;

    const/16 v1, 0x50

    invoke-virtual {v0, p1, v1, v7, v7}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    return-void
.end method

.method private static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v1, ""

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    sget-object v0, Lcom/unionpay/mobile/android/widgets/a;->v:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v2, v0, :cond_0

    sget-object v0, Lcom/unionpay/mobile/android/widgets/a;->v:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_1
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v1, v0

    goto :goto_0

    :cond_0
    return-object v1

    :cond_1
    move-object v0, v1

    goto :goto_1
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 3

    const-string v1, ""

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->o:Lcom/unionpay/mobile/android/upwidget/c;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iget v2, p0, Lcom/unionpay/mobile/android/widgets/a;->b:I

    sub-int v0, v2, v0

    iget-boolean v2, p0, Lcom/unionpay/mobile/android/widgets/a;->h:Z

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/a;->i()Ljava/lang/String;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/a;->o:Lcom/unionpay/mobile/android/upwidget/c;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upwidget/c;->c()I

    move-result v0

    goto :goto_0

    :cond_1
    if-ltz v0, :cond_2

    sget-object v2, Lcom/unionpay/mobile/android/widgets/a;->u:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-gt v0, v2, :cond_2

    sget-object v1, Lcom/unionpay/mobile/android/widgets/a;->v:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    :cond_2
    move-object v0, v1

    goto :goto_1
.end method

.method public final b()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final c()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    const-string v0, "_select_areacode"

    return-object v0
.end method
