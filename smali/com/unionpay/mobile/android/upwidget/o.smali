.class final Lcom/unionpay/mobile/android/upwidget/o;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/upwidget/j;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/upwidget/j;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->b(Lcom/unionpay/mobile/android/upwidget/j;)I

    move-result v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v1}, Lcom/unionpay/mobile/android/upwidget/j;->c(Lcom/unionpay/mobile/android/upwidget/j;)I

    move-result v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->d(Lcom/unionpay/mobile/android/upwidget/j;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v1}, Lcom/unionpay/mobile/android/upwidget/j;->b(Lcom/unionpay/mobile/android/upwidget/j;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lcom/unionpay/mobile/android/upwidget/c;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/unionpay/mobile/android/upwidget/c;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/upwidget/c;->a(I)V

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v1}, Lcom/unionpay/mobile/android/upwidget/j;->a(Lcom/unionpay/mobile/android/upwidget/j;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/upwidget/j;->a(Lcom/unionpay/mobile/android/upwidget/j;I)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    iget-object v1, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v1}, Lcom/unionpay/mobile/android/upwidget/j;->c(Lcom/unionpay/mobile/android/upwidget/j;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/upwidget/j;->b(Lcom/unionpay/mobile/android/upwidget/j;I)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/upwidget/o;->a:Lcom/unionpay/mobile/android/upwidget/j;

    invoke-static {v0}, Lcom/unionpay/mobile/android/upwidget/j;->k(Lcom/unionpay/mobile/android/upwidget/j;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_0

    :cond_1
    return-void
.end method
