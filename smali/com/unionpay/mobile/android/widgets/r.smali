.class final Lcom/unionpay/mobile/android/widgets/r;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/widgets/p;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/widgets/p;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/r;->a:Lcom/unionpay/mobile/android/widgets/p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/r;->a:Lcom/unionpay/mobile/android/widgets/p;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/r;->a:Lcom/unionpay/mobile/android/widgets/p;

    iget-object v1, v1, Lcom/unionpay/mobile/android/widgets/p;->c:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/r;->a:Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/p;->v()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/unionpay/mobile/android/widgets/r;->a:Lcom/unionpay/mobile/android/widgets/p;

    invoke-virtual {v3}, Lcom/unionpay/mobile/android/widgets/p;->d()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/unionpay/mobile/android/utils/o;->f:[Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/unionpay/mobile/android/widgets/p;->a(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/r;->a:Lcom/unionpay/mobile/android/widgets/p;

    invoke-static {v0, p3}, Lcom/unionpay/mobile/android/widgets/p;->a(Lcom/unionpay/mobile/android/widgets/p;I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/r;->a:Lcom/unionpay/mobile/android/widgets/p;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/p;->a(Lcom/unionpay/mobile/android/widgets/p;)Landroid/widget/PopupWindow;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/r;->a:Lcom/unionpay/mobile/android/widgets/p;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/p;->a(Lcom/unionpay/mobile/android/widgets/p;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_0
    return-void
.end method
