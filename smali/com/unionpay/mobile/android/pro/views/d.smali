.class final Lcom/unionpay/mobile/android/pro/views/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/views/a;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/views/a;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/d;->a:Lcom/unionpay/mobile/android/pro/views/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/d;->a:Lcom/unionpay/mobile/android/pro/views/a;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/pro/views/a;->f(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/d;->a:Lcom/unionpay/mobile/android/pro/views/a;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/a;->i(Lcom/unionpay/mobile/android/pro/views/a;)I

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/d;->a:Lcom/unionpay/mobile/android/pro/views/a;

    const-string v2, ""

    invoke-static {v1, v0, v2}, Lcom/unionpay/mobile/android/pro/views/a;->b(Lcom/unionpay/mobile/android/pro/views/a;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
