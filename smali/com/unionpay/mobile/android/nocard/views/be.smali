.class final Lcom/unionpay/mobile/android/nocard/views/be;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/bd;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/bd;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/be;->a:Lcom/unionpay/mobile/android/nocard/views/bd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/be;->a:Lcom/unionpay/mobile/android/nocard/views/bd;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/be;->a:Lcom/unionpay/mobile/android/nocard/views/bd;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/bd;->d:Landroid/content/Context;

    const-string v1, "pay_success_back_merchant"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/bd;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/be;->a:Lcom/unionpay/mobile/android/nocard/views/bd;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/bd;->a(Lcom/unionpay/mobile/android/nocard/views/bd;)V

    return-void
.end method
