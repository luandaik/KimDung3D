.class public final Lcom/unionpay/mobile/android/widgets/ah;
.super Lcom/unionpay/mobile/android/widgets/aa;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/mobile/android/widgets/ah$a;
    }
.end annotation


# instance fields
.field private n:Lcom/unionpay/mobile/android/widgets/ah$a;

.field private o:Ljava/lang/String;

.field private p:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/unionpay/mobile/android/widgets/ah;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;B)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;B)V
    .locals 4

    const/4 v0, 0x0

    const/4 v3, -0x1

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/unionpay/mobile/android/widgets/aa;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->n:Lcom/unionpay/mobile/android/widgets/ah$a;

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->o:Ljava/lang/String;

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->p:Ljava/lang/String;

    const-string v0, "button_label"

    invoke-static {p3, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->o:Ljava/lang/String;

    const-string v0, "button_action"

    invoke-static {p3, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->p:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->b:Lcom/unionpay/mobile/android/widgets/u;

    new-instance v1, Landroid/text/InputFilter$LengthFilter;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(Landroid/text/InputFilter;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->b:Lcom/unionpay/mobile/android/widgets/u;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->o:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->o:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->a:I

    sget v0, Lcom/unionpay/mobile/android/global/a;->b:I

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/unionpay/mobile/android/global/b;->n:I

    invoke-direct {v0, v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x9

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0xf

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ah;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/widgets/u;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/ah;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ah;->o:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    sget v1, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v1, Lcom/unionpay/mobile/android/widgets/ai;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/widgets/ai;-><init>(Lcom/unionpay/mobile/android/widgets/ah;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/ah;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v2, v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(Landroid/view/View;Landroid/widget/LinearLayout$LayoutParams;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/ah;)Lcom/unionpay/mobile/android/widgets/ah$a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->n:Lcom/unionpay/mobile/android/widgets/ah$a;

    return-object v0
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/widgets/ah;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->p:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ah;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/u;->b()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final a(Lcom/unionpay/mobile/android/widgets/ah$a;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/ah;->n:Lcom/unionpay/mobile/android/widgets/ah$a;

    return-void
.end method

.method public final b()Z
    .locals 3

    const/4 v0, 0x1

    iget-boolean v1, p0, Lcom/unionpay/mobile/android/widgets/ah;->h:Z

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ah;->i:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ah;->i:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/ah;->a()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/ah;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    const/16 v1, 0xb

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/ah;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v1, v2, :cond_2

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/ah;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    const-string v0, "_input_phoneNO"

    return-object v0
.end method
