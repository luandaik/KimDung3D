.class public final Lcom/unionpay/mobile/android/widgets/ap;
.super Lcom/unionpay/mobile/android/widgets/aa;

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/mobile/android/widgets/ap$a;
    }
.end annotation


# instance fields
.field private n:Lcom/unionpay/mobile/android/widgets/ap$a;

.field private o:Landroid/widget/TextView;

.field private p:Landroid/os/Handler;

.field private q:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/unionpay/mobile/android/widgets/aa;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/widgets/ap;->n:Lcom/unionpay/mobile/android/widgets/ap$a;

    iput-object v1, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    iput-object v1, p0, Lcom/unionpay/mobile/android/widgets/ap;->p:Landroid/os/Handler;

    const/4 v0, 0x0

    iput v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->q:I

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/ap;->j()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/widgets/ap;->n:Lcom/unionpay/mobile/android/widgets/ap$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;B)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/unionpay/mobile/android/widgets/aa;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->n:Lcom/unionpay/mobile/android/widgets/ap$a;

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->p:Landroid/os/Handler;

    const/4 v0, 0x0

    iput v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->q:I

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/ap;->j()V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/ap;)Lcom/unionpay/mobile/android/widgets/ap$a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->n:Lcom/unionpay/mobile/android/widgets/ap$a;

    return-object v0
.end method

.method private a(ZLjava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    return-void
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/widgets/ap;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->p:Landroid/os/Handler;

    return-object v0
.end method

.method private j()V
    .locals 6

    const/4 v5, 0x1

    const v4, -0x593503

    const/4 v3, -0x1

    iget v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->a:I

    sget v0, Lcom/unionpay/mobile/android/global/a;->b:I

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->b:Lcom/unionpay/mobile/android/widgets/u;

    new-instance v1, Landroid/text/InputFilter$LengthFilter;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(Landroid/text/InputFilter;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->b:Lcom/unionpay/mobile/android/widgets/u;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(I)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/unionpay/mobile/android/global/b;->n:I

    invoke-direct {v0, v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x9

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0xf

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ap;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/widgets/u;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ap;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v1, -0x342f27

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/ap;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->w:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    const v1, -0xa35c26

    const v2, -0x666667

    invoke-static {v1, v4, v4, v2}, Lcom/unionpay/mobile/android/utils/g;->a(IIII)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    sget v1, Lcom/unionpay/mobile/android/global/b;->k:F

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    new-instance v1, Lcom/unionpay/mobile/android/widgets/aq;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/widgets/aq;-><init>(Lcom/unionpay/mobile/android/widgets/ap;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ap;->b:Lcom/unionpay/mobile/android/widgets/u;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/ap;->o:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/mobile/android/widgets/u;->a(Landroid/view/View;Landroid/widget/LinearLayout$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 5

    const/4 v4, 0x0

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/ap;->p:Landroid/os/Handler;

    new-instance v0, Lcom/unionpay/mobile/android/widgets/ar;

    invoke-direct {v0, p0, p1}, Lcom/unionpay/mobile/android/widgets/ar;-><init>(Lcom/unionpay/mobile/android/widgets/ap;I)V

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->x:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v4, v1}, Lcom/unionpay/mobile/android/widgets/ap;->a(ZLjava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final a(Lcom/unionpay/mobile/android/widgets/ap$a;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/ap;->n:Lcom/unionpay/mobile/android/widgets/ap$a;

    return-void
.end method

.method public final b()Z
    .locals 3

    const/4 v0, 0x1

    iget-boolean v1, p0, Lcom/unionpay/mobile/android/widgets/ap;->h:Z

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v1, 0x6

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/ap;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v1, v2, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    const-string v0, "_input_msg"

    return-object v0
.end method

.method public final handleMessage(Landroid/os/Message;)Z
    .locals 5

    const/4 v1, 0x0

    const/4 v0, 0x1

    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    move v0, v1

    :cond_0
    :goto_0
    return v0

    :pswitch_0
    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->y:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/unionpay/mobile/android/widgets/ap;->a(ZLjava/lang/String;)V

    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/unionpay/mobile/android/widgets/ap;->p:Landroid/os/Handler;

    goto :goto_0

    :pswitch_1
    iget v2, p1, Landroid/os/Message;->arg1:I

    iput v2, p0, Lcom/unionpay/mobile/android/widgets/ap;->q:I

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->x:Ljava/lang/String;

    new-array v3, v0, [Ljava/lang/Object;

    iget v4, p1, Landroid/os/Message;->arg1:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/unionpay/mobile/android/widgets/ap;->a(ZLjava/lang/String;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
