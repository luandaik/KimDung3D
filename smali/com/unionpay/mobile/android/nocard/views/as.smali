.class final Lcom/unionpay/mobile/android/nocard/views/as;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/ao;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/ao;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/as;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/as;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/views/ao;->j()V

    sget-boolean v0, Lcom/unionpay/mobile/android/model/b;->bl:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/as;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/as;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v1, v1, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->bo:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/mobile/android/nocard/views/as;->a:Lcom/unionpay/mobile/android/nocard/views/ao;

    iget-object v2, v2, Lcom/unionpay/mobile/android/nocard/views/ao;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v2, v2, Lcom/unionpay/mobile/android/model/b;->bp:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/mobile/android/nocard/views/ao;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
