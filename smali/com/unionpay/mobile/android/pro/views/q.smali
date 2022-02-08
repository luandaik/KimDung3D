.class final Lcom/unionpay/mobile/android/pro/views/q;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/views/k;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/views/k;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/k;->b(Lcom/unionpay/mobile/android/pro/views/k;)Lcom/unionpay/mobile/android/upviews/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/upviews/a;->d()Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/k;->u(Lcom/unionpay/mobile/android/pro/views/k;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/pro/views/k;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/k;->v(Lcom/unionpay/mobile/android/pro/views/k;)Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/views/k;->w(Lcom/unionpay/mobile/android/pro/views/k;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_open_user_protocol"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pro/views/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/k;->c(Lcom/unionpay/mobile/android/pro/views/k;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/upwidget/a;->d()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/q;->a:Lcom/unionpay/mobile/android/pro/views/k;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/views/k;->c(Lcom/unionpay/mobile/android/pro/views/k;)Lcom/unionpay/mobile/android/upwidget/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/upwidget/a;->c()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/unionpay/mobile/android/pro/views/k;->c(Lcom/unionpay/mobile/android/pro/views/k;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
