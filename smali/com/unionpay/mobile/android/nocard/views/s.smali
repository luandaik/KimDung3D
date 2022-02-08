.class final Lcom/unionpay/mobile/android/nocard/views/s;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/nocard/views/o;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/nocard/views/o;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/nocard/views/s;->a:Lcom/unionpay/mobile/android/nocard/views/o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/s;->a:Lcom/unionpay/mobile/android/nocard/views/o;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/views/o;->j()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/s;->a:Lcom/unionpay/mobile/android/nocard/views/o;

    iget-object v0, v0, Lcom/unionpay/mobile/android/nocard/views/o;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v0, v0, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    const-string v1, "cancel"

    iput-object v1, v0, Lcom/unionpay/mobile/android/plugin/c;->f:Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/nocard/views/s;->a:Lcom/unionpay/mobile/android/nocard/views/o;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/views/o;->k()V

    return-void
.end method
