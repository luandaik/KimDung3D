.class public final Lcom/unionpay/mobile/android/widgets/UPWidget;
.super Lcom/unionpay/mobile/android/widgets/aa;

# interfaces
.implements Lcom/unionpay/mobile/android/widgets/u$b;


# static fields
.field private static final n:I

.field private static r:I


# instance fields
.field private o:J

.field private p:Z

.field private q:Ljava/lang/String;

.field private s:Z

.field private t:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private u:Lcom/unionpay/mobile/android/widgets/bb;

.field private v:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget v0, Lcom/unionpay/mobile/android/global/a;->t:I

    div-int/lit8 v0, v0, 0x3

    sput v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->n:I

    const/4 v0, 0x0

    sput v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;JILorg/json/JSONObject;Ljava/lang/String;)V
    .locals 4

    const/4 v1, 0x0

    invoke-direct {p0, p1, p4, p5, p6}, Lcom/unionpay/mobile/android/widgets/aa;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->p:Z

    iput-object v1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->q:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->s:Z

    new-instance v0, Lcom/unionpay/mobile/android/widgets/aw;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/widgets/aw;-><init>(Lcom/unionpay/mobile/android/widgets/UPWidget;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->t:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    iput-object v1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->u:Lcom/unionpay/mobile/android/widgets/bb;

    new-instance v0, Lcom/unionpay/mobile/android/widgets/ax;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/widgets/ax;-><init>(Lcom/unionpay/mobile/android/widgets/UPWidget;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->v:Landroid/view/View$OnClickListener;

    iput-wide p2, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->o:J

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v0, p0}, Lcom/unionpay/mobile/android/widgets/u;->a(Lcom/unionpay/mobile/android/widgets/u$b;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->b:Lcom/unionpay/mobile/android/widgets/u;

    new-instance v1, Landroid/text/InputFilter$LengthFilter;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(Landroid/text/InputFilter;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/u;->f()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/u;->d()V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->e()V

    return-void
.end method

.method private A()Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->c:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    const/16 v1, 0x22b8

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/UPWidget;)Landroid/view/View;
    .locals 1

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->A()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/UPWidget;J)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/unionpay/mobile/android/widgets/UPWidget;->deleteOnce(J)V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/widgets/UPWidget;JLjava/lang/String;)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Lcom/unionpay/mobile/android/widgets/UPWidget;->appendOnce(JLjava/lang/String;)V

    return-void
.end method

.method private native appendOnce(JLjava/lang/String;)V
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/widgets/UPWidget;)V
    .locals 3

    const-string v0, "kb"

    const-string v1, "pwdInputFinished() +++"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "kb"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "size = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->k()V

    const-string v0, "kb"

    const-string v1, "pwdInputFinished() ---"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static synthetic c(Lcom/unionpay/mobile/android/widgets/UPWidget;)J
    .locals 2

    iget-wide v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->o:J

    return-wide v0
.end method

.method private native clearAll(J)V
.end method

.method private native deleteOnce(J)V
.end method

.method private native getMsg(J)Ljava/lang/String;
.end method

.method private native getMsgExtra(JLjava/lang/String;)Ljava/lang/String;
.end method

.method static synthetic m()I
    .locals 1

    sget v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->n:I

    return v0
.end method

.method static synthetic n()I
    .locals 1

    sget v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    return v0
.end method

.method static synthetic o()I
    .locals 2

    sget v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    add-int/lit8 v1, v0, -0x1

    sput v1, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    return v0
.end method

.method static synthetic p()I
    .locals 2

    sget v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    return v0
.end method

.method private z()V
    .locals 2

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->A()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->A()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->t:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->u:Lcom/unionpay/mobile/android/widgets/bb;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->u:Lcom/unionpay/mobile/android/widgets/bb;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/bb;->b()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->u:Lcom/unionpay/mobile/android/widgets/bb;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/bb;->a()V

    :cond_1
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 3

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->p:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->o:J

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->q:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/unionpay/mobile/android/widgets/UPWidget;->getMsgExtra(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-wide v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->o:J

    invoke-direct {p0, v0, v1}, Lcom/unionpay/mobile/android/widgets/UPWidget;->getMsg(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final a(J)V
    .locals 1

    iput-wide p1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->o:J

    return-void
.end method

.method public final a(Z)V
    .locals 4

    const/4 v1, 0x0

    iput-boolean p1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->s:Z

    if-eqz p1, :cond_4

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "input_method"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/widgets/u;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    const/4 v0, 0x1

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->A()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->A()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    sub-int/2addr v2, v3

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v3}, Lcom/unionpay/mobile/android/widgets/UPWidget;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    iget v3, v3, Landroid/graphics/Rect;->top:I

    if-eq v2, v3, :cond_0

    move v0, v1

    :cond_0
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->l()V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->j()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "uppay"

    const-string v1, "key board is closing.."

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "uppay"

    const-string v1, "registerKeyboardDissmisslisner() +++"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->A()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->A()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->t:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_3
    const-string v0, "uppay"

    const-string v1, "registerKeyboardDissmisslisner() ---"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->z()V

    goto :goto_0
.end method

.method public final a_()V
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->s:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->j()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->l()V

    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->q:Ljava/lang/String;

    return-void
.end method

.method public final b(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->p:Z

    return-void
.end method

.method public final b()Z
    .locals 2

    sget v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final c()Z
    .locals 3

    const-string v0, "uppay"

    const-string v1, "emptyCheck() +++ "

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "uppay"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "mPINCounts =  "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "uppay"

    const-string v1, "emptyCheck() --- "

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    sget v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    const-string v0, "_bank_pwd"

    return-object v0
.end method

.method public final e()V
    .locals 2

    sget v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    if-lez v0, :cond_0

    iget-wide v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->o:J

    invoke-direct {p0, v0, v1}, Lcom/unionpay/mobile/android/widgets/UPWidget;->clearAll(J)V

    const/4 v0, 0x0

    sput v0, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    :cond_0
    return-void
.end method

.method public final j()Z
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->u:Lcom/unionpay/mobile/android/widgets/bb;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->u:Lcom/unionpay/mobile/android/widgets/bb;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/widgets/bb;->b()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public final k()V
    .locals 2

    const-string v0, "uppay"

    const-string v1, "closeCustomKeyboard() +++"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->z()V

    :cond_0
    const-string v0, "uppay"

    const-string v1, "closeCustomKeyboard() ---"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final l()V
    .locals 4

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->s:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->j()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/unionpay/mobile/android/widgets/bb;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->v:Landroid/view/View$OnClickListener;

    invoke-direct {v0, v1, v2, p0}, Lcom/unionpay/mobile/android/widgets/bb;-><init>(Landroid/content/Context;Landroid/view/View$OnClickListener;Landroid/view/View;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->u:Lcom/unionpay/mobile/android/widgets/bb;

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->u:Lcom/unionpay/mobile/android/widgets/bb;

    invoke-virtual {v0, p0}, Lcom/unionpay/mobile/android/widgets/bb;->a(Landroid/view/View;)V

    sget v2, Lcom/unionpay/mobile/android/widgets/UPWidget;->r:I

    const-string v1, ""

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "*"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->c(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/UPWidget;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->b(I)V

    :cond_1
    return-void
.end method

.method protected final onDetachedFromWindow()V
    .locals 0

    invoke-super {p0}, Lcom/unionpay/mobile/android/widgets/aa;->onDetachedFromWindow()V

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/UPWidget;->k()V

    return-void
.end method
