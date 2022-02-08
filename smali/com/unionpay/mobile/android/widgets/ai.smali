.class final Lcom/unionpay/mobile/android/widgets/ai;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/widgets/ah;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/widgets/ah;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/ai;->a:Lcom/unionpay/mobile/android/widgets/ah;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ai;->a:Lcom/unionpay/mobile/android/widgets/ah;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/ah;->a(Lcom/unionpay/mobile/android/widgets/ah;)Lcom/unionpay/mobile/android/widgets/ah$a;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ai;->a:Lcom/unionpay/mobile/android/widgets/ah;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ai;->a:Lcom/unionpay/mobile/android/widgets/ah;

    iget-object v1, v1, Lcom/unionpay/mobile/android/widgets/ah;->c:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/ai;->a:Lcom/unionpay/mobile/android/widgets/ah;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/ah;->v()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_change_phoneNO"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/widgets/ah;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ai;->a:Lcom/unionpay/mobile/android/widgets/ah;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/ah;->a(Lcom/unionpay/mobile/android/widgets/ah;)Lcom/unionpay/mobile/android/widgets/ah$a;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ai;->a:Lcom/unionpay/mobile/android/widgets/ah;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/ai;->a:Lcom/unionpay/mobile/android/widgets/ah;

    invoke-static {v1}, Lcom/unionpay/mobile/android/widgets/ah;->b(Lcom/unionpay/mobile/android/widgets/ah;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/android/widgets/ah$a;->e(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
