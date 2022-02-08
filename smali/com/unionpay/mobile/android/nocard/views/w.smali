.class final Lcom/unionpay/mobile/android/nocard/views/w;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/o;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/o;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/w;->a:Lcom/unionpay/mobile/android/nocard/views/o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/w;->a:Lcom/unionpay/mobile/android/nocard/views/o;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/w;->a:Lcom/unionpay/mobile/android/nocard/views/o;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/o;->d:Landroid/content/Context;

    const-string v1, "loginpay_input_cardNO_next"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/nocard/views/o;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/w;->a:Lcom/unionpay/mobile/android/nocard/views/o;

    invoke-static {v0}, Lcom/unionpay/mobile/android/nocard/views/o;->e(Lcom/unionpay/mobile/android/nocard/views/o;)V

    return-void
.end method
