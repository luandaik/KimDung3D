.class final Lcom/unionpay/mobile/android/pro/views/aa;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/views/x;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/views/x;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/aa;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/aa;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/pro/views/x;->e(Lcom/unionpay/mobile/android/pro/views/x;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/aa;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/x;->n(Lcom/unionpay/mobile/android/pro/views/x;)I

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/aa;->a:Lcom/unionpay/mobile/android/pro/views/x;

    const-string v2, ""

    invoke-static {v1, v0, v2}, Lcom/unionpay/mobile/android/pro/views/x;->b(Lcom/unionpay/mobile/android/pro/views/x;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
