.class public Lcom/unionpay/sdk/n;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/sdk/n$a;
    }
.end annotation


# static fields
.field private static volatile b:Lcom/unionpay/sdk/n;


# instance fields
.field private a:Landroid/content/Context;

.field private final c:I

.field private final d:I

.field private e:J

.field private final f:I

.field private g:Landroid/hardware/SensorManager;

.field private h:Lcom/unionpay/sdk/n$a;

.field private i:Landroid/os/Handler;

.field private j:Landroid/hardware/SensorEventListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/sdk/n;->b:Lcom/unionpay/sdk/n;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 4

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/unionpay/sdk/n;->a:Landroid/content/Context;

    const/16 v0, 0xfa

    iput v0, p0, Lcom/unionpay/sdk/n;->c:I

    const/16 v0, 0x12

    iput v0, p0, Lcom/unionpay/sdk/n;->d:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/unionpay/sdk/n;->e:J

    const/4 v0, 0x5

    iput v0, p0, Lcom/unionpay/sdk/n;->f:I

    iput-object v2, p0, Lcom/unionpay/sdk/n;->h:Lcom/unionpay/sdk/n$a;

    new-instance v0, Lcom/unionpay/sdk/bb;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/unionpay/sdk/bb;-><init>(Lcom/unionpay/sdk/n;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/unionpay/sdk/n;->i:Landroid/os/Handler;

    new-instance v0, Lcom/unionpay/sdk/bc;

    invoke-direct {v0, p0}, Lcom/unionpay/sdk/bc;-><init>(Lcom/unionpay/sdk/n;)V

    iput-object v0, p0, Lcom/unionpay/sdk/n;->j:Landroid/hardware/SensorEventListener;

    :try_start_0
    iput-object p1, p0, Lcom/unionpay/sdk/n;->a:Landroid/content/Context;

    const-string v0, "sensor"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/unionpay/sdk/n;->g:Landroid/hardware/SensorManager;

    iget-object v0, p0, Lcom/unionpay/sdk/n;->g:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/unionpay/sdk/n;->j:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/unionpay/sdk/n;->g:Landroid/hardware/SensorManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    iget-object v0, p0, Lcom/unionpay/sdk/n;->i:Landroid/os/Handler;

    const/16 v1, 0xa

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static synthetic a(Lcom/unionpay/sdk/n;J)J
    .locals 1

    iput-wide p1, p0, Lcom/unionpay/sdk/n;->e:J

    return-wide p1
.end method

.method static synthetic a(Lcom/unionpay/sdk/n;)Landroid/hardware/SensorManager;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/sdk/n;->g:Landroid/hardware/SensorManager;

    return-object v0
.end method

.method public static a(Landroid/content/Context;)Lcom/unionpay/sdk/n;
    .locals 2

    sget-object v0, Lcom/unionpay/sdk/n;->b:Lcom/unionpay/sdk/n;

    if-nez v0, :cond_1

    const-class v1, Lcom/unionpay/sdk/n;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/unionpay/sdk/n;->b:Lcom/unionpay/sdk/n;

    if-nez v0, :cond_0

    new-instance v0, Lcom/unionpay/sdk/n;

    invoke-direct {v0, p0}, Lcom/unionpay/sdk/n;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/unionpay/sdk/n;->b:Lcom/unionpay/sdk/n;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/unionpay/sdk/n;->b:Lcom/unionpay/sdk/n;

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static synthetic b(Lcom/unionpay/sdk/n;)Landroid/hardware/SensorEventListener;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/sdk/n;->j:Landroid/hardware/SensorEventListener;

    return-object v0
.end method

.method static synthetic c(Lcom/unionpay/sdk/n;)J
    .locals 2

    iget-wide v0, p0, Lcom/unionpay/sdk/n;->e:J

    return-wide v0
.end method

.method static synthetic d(Lcom/unionpay/sdk/n;)Lcom/unionpay/sdk/n$a;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/sdk/n;->h:Lcom/unionpay/sdk/n$a;

    return-object v0
.end method

.method static synthetic e(Lcom/unionpay/sdk/n;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/sdk/n;->a:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public registerTestDeviceListener(Lcom/unionpay/sdk/n$a;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/sdk/n;->h:Lcom/unionpay/sdk/n$a;

    return-void
.end method
