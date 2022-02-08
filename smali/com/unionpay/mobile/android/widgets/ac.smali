.class final Lcom/unionpay/mobile/android/widgets/ac;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/widgets/aa;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/widgets/aa;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    invoke-virtual {v0, p1}, Lcom/unionpay/mobile/android/widgets/aa;->a(Landroid/text/Editable;)V

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    iget-object v0, v0, Lcom/unionpay/mobile/android/widgets/aa;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/u;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    iget-object v0, v0, Lcom/unionpay/mobile/android/widgets/aa;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/u;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    iget-object v1, v1, Lcom/unionpay/mobile/android/widgets/aa;->c:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/aa;->v()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/aa;->d()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/widgets/aa;->a(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/aa;->a(Lcom/unionpay/mobile/android/widgets/aa;)Lcom/unionpay/mobile/android/widgets/aa$a;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/aa;->a(Lcom/unionpay/mobile/android/widgets/aa;)Lcom/unionpay/mobile/android/widgets/aa$a;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ac;->a:Lcom/unionpay/mobile/android/widgets/aa;

    iget-object v1, v1, Lcom/unionpay/mobile/android/widgets/aa;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/unionpay/mobile/android/widgets/aa$a;->a(Lcom/unionpay/mobile/android/widgets/u;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
