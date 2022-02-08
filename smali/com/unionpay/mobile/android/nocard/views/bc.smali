.class final Lcom/unionpay/mobile/android/nocard/views/bc;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/at;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/at;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/bc;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bc;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/views/at;->j()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bc;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/at;->b:Lcom/unionpay/mobile/android/widgets/m;

    sget-object v1, Lcom/unionpay/mobile/android/languages/c;->bD:Lcom/unionpay/mobile/android/languages/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/languages/c;->U:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/m;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/bc;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    iget-object v1, p0, Lcom/unionpay/mobile/android/nocard/views/bc;->a:Lcom/unionpay/mobile/android/nocard/views/at;

    invoke-static {v1}, Lcom/unionpay/mobile/android/nocard/views/at;->i(Lcom/unionpay/mobile/android/nocard/views/at;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/at;->a(Lcom/unionpay/mobile/android/nocard/views/at;Ljava/lang/String;)V

    return-void
.end method
