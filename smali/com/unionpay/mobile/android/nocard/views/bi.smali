.class public final Lcom/unionpay/mobile/android/nocard/views/bi;
.super Lcom/unionpay/mobile/android/nocard/views/b;

# interfaces
.implements Lcom/unionpay/mobile/android/upviews/b$a;
.implements Lcom/unionpay/mobile/android/upviews/b$b;


# static fields
.field private static w:Ljava/lang/String;


# instance fields
.field private r:Lcom/unionpay/mobile/android/upviews/b;

.field private s:Landroid/view/ViewGroup;

.field private t:I

.field private u:Z

.field private v:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "download://"

    sput-object v0, Lcom/unionpay/mobile/android/nocard/views/bi;->w:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0, v0}, Lcom/unionpay/mobile/android/nocard/views/bi;-><init>(Landroid/content/Context;IZZ)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IZZ)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/b;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->r:Lcom/unionpay/mobile/android/upviews/b;

    iput-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->s:Landroid/view/ViewGroup;

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->t:I

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->u:Z

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->v:Z

    const/16 v0, 0xe

    iput v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->f:I

    iput p2, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->t:I

    iput-boolean p3, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->u:Z

    iput-boolean p4, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->v:Z

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/bi;->a()Landroid/widget/RelativeLayout;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->k:Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/bi;->b()V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/bi;->d()V

    return-void
.end method


# virtual methods
.method public final a(Lorg/json/JSONObject;)V
    .locals 0

    return-void
.end method

.method protected final b()V
    .locals 8

    const/4 v7, -0x1

    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {v6, v7, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    new-instance v0, Lcom/unionpay/mobile/android/widgets/ay;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->d:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->af:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p0}, Lcom/unionpay/mobile/android/widgets/ay;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/unionpay/mobile/android/widgets/ay$a;)V

    iget-boolean v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->u:Z

    if-eqz v1, :cond_0

    new-instance v0, Lcom/unionpay/mobile/android/widgets/ay;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->d:Landroid/content/Context;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->af:Ljava/lang/String;

    iget-object v3, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->c:Lcom/unionpay/mobile/android/resource/c;

    const/16 v4, 0x406

    invoke-virtual {v3, v4}, Lcom/unionpay/mobile/android/resource/c;->a(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iget-object v4, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->d:Landroid/content/Context;

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-static {v4, v5}, Lcom/unionpay/mobile/android/utils/f;->a(Landroid/content/Context;F)I

    move-result v4

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/unionpay/mobile/android/widgets/ay;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ILcom/unionpay/mobile/android/widgets/ay$a;)V

    :cond_0
    const/16 v1, 0xd

    invoke-virtual {v6, v1, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->k:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    sget-object v0, Lcom/unionpay/mobile/android/nocard/views/bi;->w:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/unionpay/mobile/android/nocard/views/bi;->w:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->d:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method protected final d()V
    .locals 8

    const/16 v7, 0xc

    const/4 v6, 0x3

    const/4 v5, 0x0

    const/4 v4, -0x2

    const/4 v3, -0x1

    invoke-super {p0}, Lcom/unionpay/mobile/android/nocard/views/b;->d()V

    new-instance v0, Lcom/unionpay/mobile/android/upviews/b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->d:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/unionpay/mobile/android/upviews/b;-><init>(Landroid/content/Context;Lcom/unionpay/mobile/android/upviews/b$a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->r:Lcom/unionpay/mobile/android/upviews/b;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->r:Lcom/unionpay/mobile/android/upviews/b;

    new-instance v1, Lcom/unionpay/mobile/android/nocard/views/bj;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/nocard/views/bj;-><init>(Lcom/unionpay/mobile/android/nocard/views/bi;)V

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/b;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->v:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->r:Lcom/unionpay/mobile/android/upviews/b;

    sget-object v1, Lcom/unionpay/mobile/android/nocard/views/bi;->w:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/b;->a(Ljava/lang/String;)V

    :cond_0
    iget v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->t:I

    if-nez v0, :cond_2

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    :goto_0
    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->k:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getId()I

    move-result v1

    invoke-virtual {v0, v6, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v0, v7, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->m:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->r:Lcom/unionpay/mobile/android/upviews/b;

    invoke-virtual {v1, v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->s:Landroid/view/ViewGroup;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    sget v1, Lcom/unionpay/mobile/android/global/a;->t:I

    sget v2, Lcom/unionpay/mobile/android/global/a;->k:I

    sub-int/2addr v1, v2

    invoke-direct {v0, v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->k:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getId()I

    move-result v1

    invoke-virtual {v0, v6, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v0, v7, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iput v5, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    iput v5, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->m:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->s:Landroid/view/ViewGroup;

    invoke-virtual {v1, v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/ProgressBar;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->d:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0xd

    invoke-virtual {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->s:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->r:Lcom/unionpay/mobile/android/upviews/b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->ag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/b;->b(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->u:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->bh:Ljava/lang/String;

    invoke-virtual {p0, v0, v5}, Lcom/unionpay/mobile/android/nocard/views/bi;->a(Ljava/lang/String;Z)V

    :cond_1
    return-void

    :cond_2
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->t:I

    invoke-direct {v0, v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    goto :goto_0
.end method

.method public final l()V
    .locals 5

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->d:Landroid/content/Context;

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/nocard/views/bi;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->u:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/unionpay/mobile/android/nocard/views/bk;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/nocard/views/bk;-><init>(Lcom/unionpay/mobile/android/nocard/views/bi;)V

    new-instance v1, Lcom/unionpay/mobile/android/nocard/views/bl;

    invoke-direct {v1, p0}, Lcom/unionpay/mobile/android/nocard/views/bl;-><init>(Lcom/unionpay/mobile/android/nocard/views/bi;)V

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->b:Lcom/unionpay/mobile/android/widgets/m;

    invoke-virtual {v2, v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->Y:Ljava/lang/String;

    sget-object v2, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v2, v2, Lcom/unionpay/mobile/android/languages/c;->av:Ljava/lang/String;

    sget-object v3, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v3, v3, Lcom/unionpay/mobile/android/languages/c;->W:Ljava/lang/String;

    sget-object v4, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v4, v4, Lcom/unionpay/mobile/android/languages/c;->X:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-super {p0}, Lcom/unionpay/mobile/android/nocard/views/b;->l()V

    goto :goto_0
.end method

.method public final t()V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->r:Lcom/unionpay/mobile/android/upviews/b;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/b;->setVisibility(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->s:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    return-void
.end method

.method public final u()V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->r:Lcom/unionpay/mobile/android/upviews/b;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upviews/b;->setVisibility(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bi;->s:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    return-void
.end method
