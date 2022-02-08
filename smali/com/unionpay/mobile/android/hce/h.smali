.class final Lcom/unionpay/mobile/android/hce/h;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/unionpay/mobile/android/hce/f;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/h;->c:Lcom/unionpay/mobile/android/hce/f;

    iput-object p2, p0, Lcom/unionpay/mobile/android/hce/h;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/unionpay/mobile/android/hce/h;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/h;->c:Lcom/unionpay/mobile/android/hce/f;

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/h;->a:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/h;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/unionpay/mobile/android/hce/f;->a(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/h;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x7d6

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/h;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/h;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/h;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v2}, Lcom/unionpay/mobile/android/hce/f;->e(Lcom/unionpay/mobile/android/hce/f;)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method
