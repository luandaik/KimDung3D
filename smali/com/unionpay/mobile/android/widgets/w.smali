.class final Lcom/unionpay/mobile/android/widgets/w;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/widgets/u;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/widgets/u;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/w;->a:Lcom/unionpay/mobile/android/widgets/u;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/w;->a:Lcom/unionpay/mobile/android/widgets/u;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/u;->a(Lcom/unionpay/mobile/android/widgets/u;)Landroid/widget/ImageView;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/w;->a:Lcom/unionpay/mobile/android/widgets/u;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/u;->b(Lcom/unionpay/mobile/android/widgets/u;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/w;->a:Lcom/unionpay/mobile/android/widgets/u;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/u;->c(Lcom/unionpay/mobile/android/widgets/u;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/w;->a:Lcom/unionpay/mobile/android/widgets/u;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/u;->a(Lcom/unionpay/mobile/android/widgets/u;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/w;->a:Lcom/unionpay/mobile/android/widgets/u;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/u;->a(Lcom/unionpay/mobile/android/widgets/u;)Landroid/widget/ImageView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method
