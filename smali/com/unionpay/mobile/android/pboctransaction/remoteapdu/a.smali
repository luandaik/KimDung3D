.class public final Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/mobile/android/pboctransaction/c;


# instance fields
.field a:Lcom/unionpay/mobile/android/pboctransaction/b;

.field private b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

.field private c:Z

.field private d:Landroid/content/Context;

.field private final e:Landroid/content/ServiceConnection;

.field private final f:Lcom/unionpay/mobile/tsm/connect/IInitCallback$Stub;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->c:Z

    iput-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->d:Landroid/content/Context;

    new-instance v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;-><init>(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->e:Landroid/content/ServiceConnection;

    new-instance v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/c;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/c;-><init>(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->f:Lcom/unionpay/mobile/tsm/connect/IInitCallback$Stub;

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;)Lcom/unionpay/mobile/tsm/connect/IInitCallback$Stub;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->f:Lcom/unionpay/mobile/tsm/connect/IInitCallback$Stub;

    return-object v0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;)Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    return-object p1
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;)Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    return-object v0
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

    const/4 v0, 0x0

    const-string v1, "plugin-tsm"

    const-string v2, "RemoteApduEngine.readList() +++"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-boolean v1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->c:Z

    if-eqz v1, :cond_2

    const-string v1, "D15600010100016111000000B0004101"

    :goto_0
    const-string v2, "plugin-tsm"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sid="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "00a4040010"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v2, v1, v3}, Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;->writeApdu(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "9000"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    const-string v2, "80CA2F0000"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;->writeApdu(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    :cond_0
    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/e;->b(Ljava/lang/String;)Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    :goto_1
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_4

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;->c()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "06"

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1, v2}, Lcom/unionpay/mobile/android/pboctransaction/d;->a(Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    new-instance v0, Lcom/unionpay/mobile/android/model/a;

    const/4 v1, 0x4

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/pboctransaction/AppIdentification;->a()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/unionpay/mobile/android/model/a;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_2
    :try_start_1
    const-string v1, "D15600010100016111000000B0004001"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    const-string v2, "plugin-tsm"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v0

    goto :goto_1

    :cond_3
    move-object v0, v6

    :cond_4
    const-string v1, "plugin-tsm"

    const-string v2, "RemoteApduEngine.readList() ---"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public final a()V
    .locals 3

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->d()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->d:Landroid/content/Context;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->d:Landroid/content/Context;

    const-string v1, "plugin-tsm"

    const-string v2, "unbindTSMService() ++"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.unionpay.mobile.tsm.PBOCService"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.unionpay.mobile.tsm"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->e:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :cond_0
    return-void
.end method

.method public final a(Lcom/unionpay/mobile/android/pboctransaction/b;Landroid/content/Context;)V
    .locals 3

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    iput-object p2, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->d:Landroid/content/Context;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.unionpay.mobile.tsm.PBOCService"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.unionpay.mobile.tsm"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->e:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p2, v0, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    if-eqz v0, :cond_0

    const-string v0, "plugin-tsm"

    const-string v1, "startTSMService.initFailed()"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    :cond_0
    return-void
.end method

.method public final a(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->c:Z

    return-void
.end method

.method public final a([BI)[B
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([B)Ljava/lang/String;

    move-result-object v1

    const-string v2, "plugin-tsm"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "[---->]"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    invoke-interface {v2, v1, p2}, Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;->writeApdu(Ljava/lang/String;I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_1
    const-string v1, "plugin-tsm"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[<----]"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public final b()V
    .locals 0

    return-void
.end method

.method public final c()V
    .locals 0

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->d()V

    return-void
.end method

.method public final d()V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;->closeChannel(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;->closeChannel(I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b:Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;->closeChannel(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
