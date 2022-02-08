.class final Lcom/unionpay/mobile/android/widgets/al;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/widgets/aj;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/widgets/aj;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 10

    const/4 v9, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    iget-object v2, v2, Lcom/unionpay/mobile/android/widgets/aj;->c:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    invoke-virtual {v4}, Lcom/unionpay/mobile/android/widgets/aj;->v()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    invoke-virtual {v4}, Lcom/unionpay/mobile/android/widgets/aj;->d()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/unionpay/mobile/android/utils/o;->h:[Ljava/lang/String;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    const-string v7, "type"

    invoke-static {v6, v0, v7}, Lcom/unionpay/mobile/android/widgets/aj;->a(Lcom/unionpay/mobile/android/widgets/aj;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    const/4 v6, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    iget-object v7, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    const-string v8, "label"

    invoke-static {v7, v0, v9, v8}, Lcom/unionpay/mobile/android/widgets/aj;->a(Lcom/unionpay/mobile/android/widgets/aj;IILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/unionpay/mobile/android/widgets/aj;->a(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    invoke-static {v1, v0, v9}, Lcom/unionpay/mobile/android/widgets/aj;->a(Lcom/unionpay/mobile/android/widgets/aj;II)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/aj;->a(Lcom/unionpay/mobile/android/widgets/aj;)Landroid/widget/PopupWindow;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/al;->a:Lcom/unionpay/mobile/android/widgets/aj;

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/aj;->a(Lcom/unionpay/mobile/android/widgets/aj;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_0
    return-void
.end method
