.class final Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;->a:Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;->a:Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;

    invoke-static {p2}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a$a;->a(Landroid/os/IBinder;)Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;)Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;->a:Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;)Lcom/unionpay/mobile/android/pboctransaction/b;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;->a:Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;)Lcom/unionpay/mobile/android/pboctransaction/b;

    move-result-object v0

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->a()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;->a:Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;)Lcom/unionpay/mobile/android/pboctransaction/b;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;->a:Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;)Lcom/unionpay/mobile/android/pboctransaction/b;

    move-result-object v0

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    goto :goto_0
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;->a:Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;)Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    return-void
.end method
