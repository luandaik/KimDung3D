.class final Lcom/unionpay/mobile/android/widgets/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/widgets/a;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/widgets/a;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/c;->a:Lcom/unionpay/mobile/android/widgets/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/c;->a:Lcom/unionpay/mobile/android/widgets/a;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/c;->a:Lcom/unionpay/mobile/android/widgets/a;

    iget-object v1, v1, Lcom/unionpay/mobile/android/widgets/a;->c:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/c;->a:Lcom/unionpay/mobile/android/widgets/a;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/a;->v()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/c;->a:Lcom/unionpay/mobile/android/widgets/a;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/a;->d()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/widgets/a;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/c;->a:Lcom/unionpay/mobile/android/widgets/a;

    invoke-static {v0, p3}, Lcom/unionpay/mobile/android/widgets/a;->a(Lcom/unionpay/mobile/android/widgets/a;I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/c;->a:Lcom/unionpay/mobile/android/widgets/a;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/a;->a(Lcom/unionpay/mobile/android/widgets/a;)Landroid/widget/PopupWindow;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/c;->a:Lcom/unionpay/mobile/android/widgets/a;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/a;->a(Lcom/unionpay/mobile/android/widgets/a;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_0
    return-void
.end method
