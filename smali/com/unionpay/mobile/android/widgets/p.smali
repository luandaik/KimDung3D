.class public final Lcom/unionpay/mobile/android/widgets/p;
.super Lcom/unionpay/mobile/android/widgets/z;


# instance fields
.field private final a:Landroid/view/View$OnClickListener;

.field private final b:Landroid/widget/AdapterView$OnItemClickListener;

.field private n:Lorg/json/JSONArray;

.field private o:Ljava/util/List;
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

.field private p:Landroid/app/AlertDialog;

.field private q:Landroid/widget/PopupWindow;

.field private r:Lcom/unionpay/mobile/android/upwidget/e;

.field private s:I

.field private t:Landroid/widget/TextView;

.field private u:Lcom/unionpay/mobile/android/upwidget/q;

.field private v:Landroid/widget/TextView;

.field private w:Ljava/lang/String;

.field private x:Landroid/widget/RelativeLayout;

.field private y:Z

.field private z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 4

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, p3}, Lcom/unionpay/mobile/android/widgets/z;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    new-instance v0, Lcom/unionpay/mobile/android/widgets/q;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/widgets/q;-><init>(Lcom/unionpay/mobile/android/widgets/p;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->a:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/unionpay/mobile/android/widgets/r;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/widgets/r;-><init>(Lcom/unionpay/mobile/android/widgets/p;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->b:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/p;->y:Z

    iput-boolean v1, p0, Lcom/unionpay/mobile/android/widgets/p;->z:Z

    iput v1, p0, Lcom/unionpay/mobile/android/widgets/p;->s:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->m:Lorg/json/JSONObject;

    const-string v1, "new_instalments"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->n:Lorg/json/JSONArray;

    const-string v0, "label"

    invoke-static {p2, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->w:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->w:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/widgets/p;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v0, v0, Lcom/unionpay/mobile/android/languages/c;->bg:Ljava/lang/String;

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->w:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->n:Lorg/json/JSONArray;

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/widgets/p;->b(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->o:Ljava/util/List;

    new-instance v0, Lcom/unionpay/mobile/android/upwidget/e;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->o:Ljava/util/List;

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/upwidget/e;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->r:Lcom/unionpay/mobile/android/upwidget/e;

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->l:Landroid/widget/RelativeLayout;

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/widgets/p;->a(Landroid/widget/RelativeLayout;)V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/p;)Landroid/widget/PopupWindow;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->q:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method private a(ILjava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v1, ""

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->n:Lorg/json/JSONArray;

    invoke-static {v0, p1}, Lcom/unionpay/mobile/android/utils/i;->b(Lorg/json/JSONArray;I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lorg/json/JSONObject;

    invoke-static {v0, p2}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v0, "type"

    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "label"

    invoke-virtual {v1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "checked"

    invoke-virtual {v1, v0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "ckb_style"

    const-string v2, "small"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "required"

    const-string v2, "0"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "instalment"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->m:Lorg/json/JSONObject;

    const-string v2, "url"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/i;->c(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v2, "href_label"

    const-string v3, "label"

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "href_url"

    const-string v3, "href"

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-object v1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private a(I)V
    .locals 3

    iput p1, p0, Lcom/unionpay/mobile/android/widgets/p;->s:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->r:Lcom/unionpay/mobile/android/upwidget/e;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upwidget/e;->a()I

    move-result v0

    sub-int v0, p1, v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->r:Lcom/unionpay/mobile/android/upwidget/e;

    iget v2, p0, Lcom/unionpay/mobile/android/widgets/p;->s:I

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/upwidget/e;->a(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->t:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->t:Landroid/widget/TextView;

    const-string v2, "label"

    invoke-direct {p0, v0, v2}, Lcom/unionpay/mobile/android/widgets/p;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method private a(Landroid/widget/RelativeLayout;)V
    .locals 10

    const v9, -0x342f27

    const/16 v8, 0xf

    const/4 v7, 0x1

    const/high16 v6, 0x41200000    # 10.0f

    const/4 v5, -0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/mobile/android/resource/c;->a(Landroid/content/Context;)Lcom/unionpay/mobile/android/resource/c;

    move-result-object v0

    const/16 v1, 0x7de

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setId(I)V

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v5, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/p;->m:Lorg/json/JSONObject;

    const-string v4, "type"

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "instalment"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-static {v4, v6}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v4

    iput v4, v2, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    :cond_0
    invoke-virtual {p1, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v2, v4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->x:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->x:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/p;->x:Landroid/widget/RelativeLayout;

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/RelativeLayout;->setId(I)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->x:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->x:Landroid/widget/RelativeLayout;

    new-instance v2, Lcom/unionpay/mobile/android/widgets/s;

    invoke-direct {v2, p0}, Lcom/unionpay/mobile/android/widgets/s;-><init>(Lcom/unionpay/mobile/android/widgets/p;)V

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    sget v2, Lcom/unionpay/mobile/android/global/a;->n:I

    invoke-direct {v0, v5, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v8, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/4 v2, 0x3

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getId()I

    move-result v1

    invoke-virtual {v0, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->x:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v1, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setId(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/unionpay/mobile/android/resource/c;->a(Landroid/content/Context;)Lcom/unionpay/mobile/android/resource/c;

    move-result-object v1

    const/16 v2, 0x3ea

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    const/high16 v2, 0x41700000    # 15.0f

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v1

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xb

    invoke-virtual {v2, v1, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v2, v8, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-static {v1, v6}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v1

    iput v1, v2, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->x:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->t:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->t:Landroid/widget/TextView;

    sget v2, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->t:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->t:Landroid/widget/TextView;

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->t:Landroid/widget/TextView;

    const v2, -0x99999a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v5, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v8, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v2, 0x9

    invoke-virtual {v1, v2, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/4 v2, 0x0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-static {v0, v6}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v0

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->x:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->t:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "instalment"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v5, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    sget v2, Lcom/unionpay/mobile/android/global/a;->f:I

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/p;->x:Landroid/widget/RelativeLayout;

    invoke-virtual {v3}, Landroid/widget/RelativeLayout;->getId()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/p;->g()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/widgets/p;->b(Z)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->r:Lcom/unionpay/mobile/android/upwidget/e;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upwidget/e;->a()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/widgets/p;->a(I)V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/p;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/widgets/p;->a(I)V

    return-void
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/widgets/p;)Landroid/app/Dialog;
    .locals 10

    const/4 v7, 0x1

    const/4 v9, 0x0

    const/4 v8, -0x2

    const/4 v2, -0x1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->p:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/p;->z:Z

    if-eqz v0, :cond_1

    :cond_0
    iput-boolean v9, p0, Lcom/unionpay/mobile/android/widgets/p;->z:Z

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v9}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->p:Landroid/app/AlertDialog;

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->p:Landroid/app/AlertDialog;

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v3, v4}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v3

    new-instance v4, Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    sget v5, Lcom/unionpay/mobile/android/global/b;->g:I

    invoke-virtual {v4, v5, v5, v5, v5}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v6, -0x342f27

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v2, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v6, p0, Lcom/unionpay/mobile/android/widgets/p;->w:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget v6, Lcom/unionpay/mobile/android/global/b;->i:F

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const v6, -0xcccccd

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v6, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v7, 0xd

    invoke-virtual {v6, v7, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const v5, -0xf0f0c

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v2, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v4, Landroid/widget/ListView;

    iget-object v5, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v4, v5}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    iget-object v5, p0, Lcom/unionpay/mobile/android/widgets/p;->r:Lcom/unionpay/mobile/android/upwidget/e;

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v4, v3}, Landroid/widget/ListView;->setDividerHeight(I)V

    new-instance v3, Lcom/unionpay/mobile/android/widgets/t;

    invoke-direct {v3, p0}, Lcom/unionpay/mobile/android/widgets/t;-><init>(Lcom/unionpay/mobile/android/widgets/p;)V

    invoke-virtual {v4, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v2, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move v3, v2

    move v4, v2

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/app/AlertDialog;->setView(Landroid/view/View;IIII)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->p:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v9}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->p:Landroid/app/AlertDialog;

    return-object v0
.end method

.method private b(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_2

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v0

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    move v0, v1

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_1

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const-string v3, "label"

    const-string v5, "label"

    invoke-direct {p0, v0, v5}, Lcom/unionpay/mobile/android/widgets/p;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "style"

    const-string v5, "rel_value_style"

    invoke-direct {p0, v0, v5}, Lcom/unionpay/mobile/android/widgets/p;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "rel_value"

    invoke-direct {p0, v0, v3}, Lcom/unionpay/mobile/android/widgets/p;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "\\|"

    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/util/ArrayList;

    array-length v3, v5

    invoke-direct {v6, v3}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v7, Ljava/util/ArrayList;

    array-length v3, v5

    invoke-direct {v7, v3}, Ljava/util/ArrayList;-><init>(I)V

    array-length v8, v5

    move v3, v1

    :goto_1
    if-ge v3, v8, :cond_0

    aget-object v9, v5, v3

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    aget-object v10, v9, v1

    invoke-interface {v6, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v10, 0x1

    aget-object v9, v9, v10

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_0
    const-string v3, "keys"

    invoke-interface {v4, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "values"

    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    move-object v0, v2

    :cond_2
    return-object v0
.end method

.method static synthetic c(Lcom/unionpay/mobile/android/widgets/p;)Landroid/app/AlertDialog;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->p:Landroid/app/AlertDialog;

    return-object v0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 4

    iget v0, p0, Lcom/unionpay/mobile/android/widgets/p;->s:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->r:Lcom/unionpay/mobile/android/upwidget/e;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/e;->a()I

    move-result v1

    sub-int/2addr v0, v1

    const-string v1, "value"

    invoke-direct {p0, v0, v1}, Lcom/unionpay/mobile/android/widgets/p;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/q;->b()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    :cond_0
    const-string v1, "uppay"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/p;->q()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public final a(Lcom/unionpay/mobile/android/upwidget/q$a;)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/upwidget/q;->a(Lcom/unionpay/mobile/android/upwidget/q$a;)V

    return-void
.end method

.method public final a(Lorg/json/JSONArray;)V
    .locals 4

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/p;->z:Z

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/p;->n:Lorg/json/JSONArray;

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/widgets/p;->b(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->o:Ljava/util/List;

    new-instance v0, Lcom/unionpay/mobile/android/upwidget/e;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->o:Ljava/util/List;

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/upwidget/e;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->r:Lcom/unionpay/mobile/android/upwidget/e;

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->l:Landroid/widget/RelativeLayout;

    invoke-direct {p0, v0}, Lcom/unionpay/mobile/android/widgets/p;->a(Landroid/widget/RelativeLayout;)V

    :cond_0
    return-void
.end method

.method public final a(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/unionpay/mobile/android/widgets/p;->y:Z

    return-void
.end method

.method protected final a(Landroid/widget/LinearLayout;Ljava/lang/String;)Z
    .locals 9

    const/high16 v8, 0x41200000    # 10.0f

    const/4 v7, 0x1

    const/4 v6, -0x1

    invoke-virtual {p0, p2}, Lcom/unionpay/mobile/android/widgets/p;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return v7

    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    sget v2, Lcom/unionpay/mobile/android/global/a;->n:I

    invoke-direct {v1, v6, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->m:Lorg/json/JSONObject;

    const-string v2, "type"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "instalment"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setId(I)V

    const v3, -0x342f27

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-static {v4, v8}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->m:Lorg/json/JSONObject;

    const-string v3, "checked"

    invoke-static {v2, v3}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, p2, v2}, Lcom/unionpay/mobile/android/widgets/p;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    new-instance v2, Lcom/unionpay/mobile/android/upwidget/q;

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/p;->v()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_agree_installment"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4}, Lcom/unionpay/mobile/android/upwidget/q;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/q;->a()V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    sget v2, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/upwidget/q;->a(F)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    sget v2, Lcom/unionpay/mobile/android/global/a;->n:I

    invoke-direct {v1, v6, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x10

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-static {v2, v8}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0
.end method

.method public final b(Z)V
    .locals 3

    const/16 v1, 0x8

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/upwidget/q;->a(Z)V

    if-nez p1, :cond_0

    iput-boolean p1, p0, Lcom/unionpay/mobile/android/widgets/p;->y:Z

    :cond_0
    iget-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/p;->y:Z

    if-eqz v0, :cond_4

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->l:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->v:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/p;->v:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->v:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->v:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :cond_4
    move v0, v1

    goto :goto_0
.end method

.method public final b()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected final b_()Z
    .locals 3

    const/4 v2, -0x2

    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->v:Landroid/widget/TextView;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->v:Landroid/widget/TextView;

    sget v2, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->v:Landroid/widget/TextView;

    invoke-virtual {p0, v1, v0}, Lcom/unionpay/mobile/android/widgets/p;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->v:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

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

    const-string v0, "_select_installment"

    return-object v0
.end method

.method public final f()Z
    .locals 2

    iget v0, p0, Lcom/unionpay/mobile/android/widgets/p;->s:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/p;->r:Lcom/unionpay/mobile/android/upwidget/e;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/e;->a()I

    move-result v1

    sub-int/2addr v0, v1

    const-string v1, "available"

    invoke-direct {p0, v0, v1}, Lcom/unionpay/mobile/android/widgets/p;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final g()Z
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/p;->u:Lcom/unionpay/mobile/android/upwidget/q;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upwidget/q;->b()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
