.class final Lcom/unionpay/mobile/android/views/order/k;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/views/order/i;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/views/order/i;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/views/order/k;->a:Lcom/unionpay/mobile/android/views/order/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/views/order/k;->a:Lcom/unionpay/mobile/android/views/order/i;

    iget-object v0, v0, Lcom/unionpay/mobile/android/views/order/i;->e:Lcom/unionpay/mobile/android/views/order/AbstractMethod$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/views/order/k;->a:Lcom/unionpay/mobile/android/views/order/i;

    iget-object v0, p0, Lcom/unionpay/mobile/android/views/order/k;->a:Lcom/unionpay/mobile/android/views/order/i;

    iget-object v0, v0, Lcom/unionpay/mobile/android/views/order/i;->b:Landroid/content/Context;

    const-string v1, "login_by_register"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/views/order/i;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/views/order/k;->a:Lcom/unionpay/mobile/android/views/order/i;

    iget-object v0, v0, Lcom/unionpay/mobile/android/views/order/i;->e:Lcom/unionpay/mobile/android/views/order/AbstractMethod$b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/views/order/k;->a:Lcom/unionpay/mobile/android/views/order/i;

    iget-object v1, p0, Lcom/unionpay/mobile/android/views/order/k;->a:Lcom/unionpay/mobile/android/views/order/i;

    invoke-static {v1}, Lcom/unionpay/mobile/android/views/order/i;->b(Lcom/unionpay/mobile/android/views/order/i;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "label"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/views/order/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/views/order/k;->a:Lcom/unionpay/mobile/android/views/order/i;

    iget-object v2, p0, Lcom/unionpay/mobile/android/views/order/k;->a:Lcom/unionpay/mobile/android/views/order/i;

    invoke-static {v2}, Lcom/unionpay/mobile/android/views/order/i;->b(Lcom/unionpay/mobile/android/views/order/i;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "href"

    invoke-static {v2, v3}, Lcom/unionpay/mobile/android/views/order/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/unionpay/mobile/android/views/order/AbstractMethod$b;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
