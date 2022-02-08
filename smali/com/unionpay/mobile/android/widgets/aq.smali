.class final Lcom/unionpay/mobile/android/widgets/aq;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/widgets/ap;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/widgets/ap;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/aq;->a:Lcom/unionpay/mobile/android/widgets/ap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/aq;->a:Lcom/unionpay/mobile/android/widgets/ap;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/ap;->a(Lcom/unionpay/mobile/android/widgets/ap;)Lcom/unionpay/mobile/android/widgets/ap$a;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/aq;->a:Lcom/unionpay/mobile/android/widgets/ap;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/aq;->a:Lcom/unionpay/mobile/android/widgets/ap;

    iget-object v1, v1, Lcom/unionpay/mobile/android/widgets/ap;->c:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/aq;->a:Lcom/unionpay/mobile/android/widgets/ap;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/ap;->v()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_click_get_msg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/widgets/ap;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/aq;->a:Lcom/unionpay/mobile/android/widgets/ap;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/ap;->a(Lcom/unionpay/mobile/android/widgets/ap;)Lcom/unionpay/mobile/android/widgets/ap$a;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/aq;->a:Lcom/unionpay/mobile/android/widgets/ap;

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/android/widgets/ap$a;->a(Lcom/unionpay/mobile/android/widgets/z;)V

    :cond_0
    return-void
.end method
