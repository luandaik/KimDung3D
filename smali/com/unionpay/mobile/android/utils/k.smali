.class public final Lcom/unionpay/mobile/android/utils/k;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/simalliance/openmobileapi/SEService$CallBack;


# static fields
.field private static b:Lorg/simalliance/openmobileapi/SEService;


# instance fields
.field private a:Landroid/content/Context;

.field private c:Lcom/unionpay/mobile/android/nocard/views/b;

.field private d:Landroid/os/Handler$Callback;

.field private e:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/mobile/android/utils/k;->b:Lorg/simalliance/openmobileapi/SEService;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/unionpay/mobile/android/utils/l;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/utils/l;-><init>(Lcom/unionpay/mobile/android/utils/k;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/utils/k;->d:Landroid/os/Handler$Callback;

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/unionpay/mobile/android/utils/k;->d:Landroid/os/Handler$Callback;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/utils/k;->e:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/unionpay/mobile/android/nocard/views/b;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/unionpay/mobile/android/utils/l;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/utils/l;-><init>(Lcom/unionpay/mobile/android/utils/k;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/utils/k;->d:Landroid/os/Handler$Callback;

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/unionpay/mobile/android/utils/k;->d:Landroid/os/Handler$Callback;

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/utils/k;->e:Landroid/os/Handler;

    iput-object p1, p0, Lcom/unionpay/mobile/android/utils/k;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/unionpay/mobile/android/utils/k;->c:Lcom/unionpay/mobile/android/nocard/views/b;

    sget-object v0, Lcom/unionpay/mobile/android/utils/k;->b:Lorg/simalliance/openmobileapi/SEService;

    if-nez v0, :cond_0

    :try_start_0
    new-instance v0, Lorg/simalliance/openmobileapi/SEService;

    iget-object v1, p0, Lcom/unionpay/mobile/android/utils/k;->a:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lorg/simalliance/openmobileapi/SEService;-><init>(Landroid/content/Context;Lorg/simalliance/openmobileapi/SEService$CallBack;)V

    sput-object v0, Lcom/unionpay/mobile/android/utils/k;->b:Lorg/simalliance/openmobileapi/SEService;

    new-instance v0, Lcom/unionpay/mobile/android/utils/m;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/utils/m;-><init>(Lcom/unionpay/mobile/android/utils/k;)V

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/utils/m;->start()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    const-string v0, "uppay"

    const-string v1, " service ERROR!!!"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/utils/k;->e:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/utils/k;->c:Lcom/unionpay/mobile/android/nocard/views/b;

    check-cast v0, Lcom/unionpay/mobile/android/nocard/views/l;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/nocard/views/l;->u()V

    goto :goto_0
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/utils/k;)Lcom/unionpay/mobile/android/nocard/views/b;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/utils/k;->c:Lcom/unionpay/mobile/android/nocard/views/b;

    return-object v0
.end method

.method public static a()Lorg/simalliance/openmobileapi/SEService;
    .locals 1

    sget-object v0, Lcom/unionpay/mobile/android/utils/k;->b:Lorg/simalliance/openmobileapi/SEService;

    return-object v0
.end method

.method static synthetic b(Lcom/unionpay/mobile/android/utils/k;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/utils/k;->e:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic b()Lorg/simalliance/openmobileapi/SEService;
    .locals 1

    sget-object v0, Lcom/unionpay/mobile/android/utils/k;->b:Lorg/simalliance/openmobileapi/SEService;

    return-object v0
.end method


# virtual methods
.method public final serviceConnected(Lorg/simalliance/openmobileapi/SEService;)V
    .locals 3

    const-string v0, "uppay"

    const-string v1, "se service connected"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "uppay"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "mSEService:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/unionpay/mobile/android/utils/k;->b:Lorg/simalliance/openmobileapi/SEService;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "uppay"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "mSEService.isConnected:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/unionpay/mobile/android/utils/k;->b:Lorg/simalliance/openmobileapi/SEService;

    invoke-virtual {v2}, Lorg/simalliance/openmobileapi/SEService;->isConnected()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/utils/k;->e:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
