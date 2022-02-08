.class public final Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/mobile/android/pboctransaction/c;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

.field private d:Lcom/unionpay/mobile/android/pboctransaction/b;

.field private e:Landroid/content/Context;

.field private f:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a:Ljava/lang/String;

    const-string v0, "A0000003334355502D4D4F42494C45"

    iput-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->b:Ljava/lang/String;

    new-instance v0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/b;-><init>(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->f:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;)Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    return-object p1
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;)Lcom/unionpay/mobile/android/pboctransaction/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->d:Lcom/unionpay/mobile/android/pboctransaction/b;

    return-object v0
.end method

.method private a([B)[B
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([B)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->b(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v1, "icfcc"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "pbocAID = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a:Ljava/lang/String;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v2

    const-string v3, "00"

    invoke-interface {v1, v2, v3}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->a([BLjava/lang/String;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :cond_0
    :goto_0
    const-string v1, "icfcc"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " openSEChannel result="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "icfcc"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "upcardAID = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->b:Ljava/lang/String;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v2

    const-string v3, "01"

    invoke-interface {v1, v2, v3}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->a([BLjava/lang/String;)[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static b(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "00A40400"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "01A40400"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "02A40400"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0
.end method

.method public final a(Lcom/unionpay/mobile/android/pboctransaction/d;)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/unionpay/mobile/android/pboctransaction/d;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/unionpay/mobile/android/model/c;",
            ">;"
        }
    .end annotation

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    if-nez v0, :cond_0

    move-object v0, v6

    :goto_0
    return-object v0

    :cond_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    const-string v0, "325041592e5359532e4444463031"

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v0

    const-string v2, "00"

    invoke-interface {v1, v0, v2}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->a([BLjava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([B)Ljava/lang/String;

    move-result-object v0

    const-string v1, "4F"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/c;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "icfcc"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "aid ="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_1

    iput-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a:Ljava/lang/String;

    new-instance v2, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;

    const-string v1, ""

    invoke-direct {v2, v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lcom/unionpay/mobile/android/pboctransaction/d;->a(Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    const-string v0, "icfcc"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "  "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/unionpay/mobile/android/model/a;

    const/16 v1, 0x8

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;->a()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/unionpay/mobile/android/model/a;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    const-string v1, "00"

    invoke-interface {v0, v1}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->b(Ljava/lang/String;)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    move-object v0, v7

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v0

    :try_start_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    const-string v1, "00"

    invoke-interface {v0, v1}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->b(Ljava/lang/String;)Z
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    move-object v0, v6

    goto/16 :goto_0

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_2

    :catchall_0
    move-exception v0

    :try_start_3
    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    const-string v2, "00"

    invoke-interface {v1, v2}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->b(Ljava/lang/String;)Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    :goto_3
    throw v0

    :catch_3
    move-exception v1

    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_3
.end method

.method public final a()V
    .locals 2

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->d()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    invoke-interface {v0}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->a()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->e:Landroid/content/Context;

    if-eqz v0, :cond_1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.unionpay.mobile.tsm.PBOCService"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->e:Landroid/content/Context;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->f:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :cond_1
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public final a(Lcom/unionpay/mobile/android/pboctransaction/b;Landroid/content/Context;)V
    .locals 3

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->d:Lcom/unionpay/mobile/android/pboctransaction/b;

    iput-object p2, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->e:Landroid/content/Context;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "cn.gov.pbc.tsm.client.mobile.android.bank.service"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "cn.gov.pbc.tsm.client.mobile.andorid"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->f:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p2, v0, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    const-string v0, "icfcc"

    const-string v1, "startTSMService.initFailed()"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {p1}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    :cond_0
    return-void
.end method

.method public final a([BI)[B
    .locals 5

    const/4 v0, 0x0

    invoke-static {p1}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([B)Ljava/lang/String;

    move-result-object v1

    const-string v2, "icfcc"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "====>"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    if-nez v2, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->b(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->a([B)[B

    move-result-object v0

    goto :goto_0

    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    invoke-interface {v1, p1}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->b([B)[B
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_1
    const-string v1, "icfcc"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<===="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public final b()V
    .locals 0

    return-void
.end method

.method public final c()V
    .locals 0

    return-void
.end method

.method public final d()V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    const-string v1, "00"

    invoke-interface {v0, v1}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->b(Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/icfcc/a;->c:Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;

    const-string v1, "01"

    invoke-interface {v0, v1}, Lcn/gov/pbc/tsm/client/mobile/android/bank/service/a;->b(Ljava/lang/String;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method
