.class Lcom/unionpay/sdk/c;
.super Lcom/unionpay/sdk/bh;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/sdk/c$a;
    }
.end annotation


# static fields
.field private static volatile e:Lcom/unionpay/sdk/c;

.field private static f:Lcom/unionpay/sdk/m;

.field private static m:Landroid/os/Handler;

.field private static n:Landroid/os/HandlerThread;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private volatile d:Z

.field private g:Lcom/unionpay/sdk/bf;

.field private final h:I

.field private i:I

.field private j:Z

.field private k:J

.field private l:Ljava/util/Random;

.field private o:Ljava/nio/channels/FileLock;

.field private final p:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/sdk/c;->e:Lcom/unionpay/sdk/c;

    sput-object v0, Lcom/unionpay/sdk/c;->f:Lcom/unionpay/sdk/m;

    sput-object v0, Lcom/unionpay/sdk/c;->m:Landroid/os/Handler;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "prepareSubmitHandlerThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/unionpay/sdk/c;->n:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcom/unionpay/sdk/aa;

    sget-object v1, Lcom/unionpay/sdk/c;->n:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/unionpay/sdk/aa;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/unionpay/sdk/c;->m:Landroid/os/Handler;

    new-instance v0, Lcom/unionpay/sdk/ab;

    invoke-direct {v0}, Lcom/unionpay/sdk/ab;-><init>()V

    sput-object v0, Lcom/unionpay/sdk/c;->f:Lcom/unionpay/sdk/m;

    :try_start_0
    invoke-static {}, Lcom/unionpay/sdk/ar;->a()Lcom/unionpay/sdk/ar;

    move-result-object v0

    invoke-static {}, Lcom/unionpay/sdk/c;->a()Lcom/unionpay/sdk/c;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/ar;->register(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 7

    const/4 v6, 0x0

    const/16 v5, 0x7530

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/unionpay/sdk/bh;-><init>()V

    const-string v0, "140.207.168.45"

    iput-object v0, p0, Lcom/unionpay/sdk/c;->a:Ljava/lang/String;

    const-string v0, "140.207.168.45"

    iput-object v0, p0, Lcom/unionpay/sdk/c;->b:Ljava/lang/String;

    const-string v0, "http://140.207.168.45/g/d"

    iput-object v0, p0, Lcom/unionpay/sdk/c;->c:Ljava/lang/String;

    iput-boolean v4, p0, Lcom/unionpay/sdk/c;->d:Z

    new-instance v0, Lcom/unionpay/sdk/c$a;

    const-string v1, "140.207.168.45"

    const-string v2, "140.207.168.45"

    const-string v3, "http://140.207.168.45/g/d"

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/unionpay/sdk/c$a;-><init>(Lcom/unionpay/sdk/c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/unionpay/sdk/c;->g:Lcom/unionpay/sdk/bf;

    iput v5, p0, Lcom/unionpay/sdk/c;->h:I

    iput v5, p0, Lcom/unionpay/sdk/c;->i:I

    iput-boolean v4, p0, Lcom/unionpay/sdk/c;->j:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget v2, p0, Lcom/unionpay/sdk/c;->i:I

    int-to-long v2, v2

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/unionpay/sdk/c;->k:J

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/unionpay/sdk/c;->l:Ljava/util/Random;

    iput-object v6, p0, Lcom/unionpay/sdk/c;->o:Ljava/nio/channels/FileLock;

    iput-object v6, p0, Lcom/unionpay/sdk/c;->p:Ljava/lang/String;

    return-void
.end method

.method static a()Lcom/unionpay/sdk/c;
    .locals 2

    sget-object v0, Lcom/unionpay/sdk/c;->e:Lcom/unionpay/sdk/c;

    if-nez v0, :cond_1

    const-class v1, Lcom/unionpay/sdk/c;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/unionpay/sdk/c;->e:Lcom/unionpay/sdk/c;

    if-nez v0, :cond_0

    new-instance v0, Lcom/unionpay/sdk/c;

    invoke-direct {v0}, Lcom/unionpay/sdk/c;-><init>()V

    sput-object v0, Lcom/unionpay/sdk/c;->e:Lcom/unionpay/sdk/c;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/unionpay/sdk/c;->e:Lcom/unionpay/sdk/c;

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static synthetic a(Lcom/unionpay/sdk/c;)V
    .locals 0

    invoke-direct {p0}, Lcom/unionpay/sdk/c;->b()V

    return-void
.end method

.method private declared-synchronized b()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/unionpay/sdk/c;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    sget-object v0, Lcom/unionpay/sdk/d;->e:Ljava/nio/channels/FileChannel;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/unionpay/sdk/d;->e:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->tryLock()Ljava/nio/channels/FileLock;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/sdk/c;->o:Ljava/nio/channels/FileLock;

    :cond_2
    iget-object v0, p0, Lcom/unionpay/sdk/c;->o:Ljava/nio/channels/FileLock;

    if-eqz v0, :cond_4

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/j;->c(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/unionpay/sdk/t;->a()Lcom/unionpay/sdk/t;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/sdk/ac;->a(Lcom/unionpay/sdk/bg;)Lcom/unionpay/sdk/w$f;

    move-result-object v0

    new-instance v1, Lcom/unionpay/sdk/p;

    invoke-direct {v1}, Lcom/unionpay/sdk/p;-><init>()V

    iget-object v2, p0, Lcom/unionpay/sdk/c;->g:Lcom/unionpay/sdk/bf;

    iget-object v2, v2, Lcom/unionpay/sdk/bf;->b:Ljava/lang/String;

    iput-object v2, v1, Lcom/unionpay/sdk/p;->c:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/sdk/c;->g:Lcom/unionpay/sdk/bf;

    iget-object v2, v2, Lcom/unionpay/sdk/bf;->c:Ljava/lang/String;

    iput-object v2, v1, Lcom/unionpay/sdk/p;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/sdk/c;->g:Lcom/unionpay/sdk/bf;

    iget-object v2, v2, Lcom/unionpay/sdk/bf;->d:Ljava/lang/String;

    iput-object v2, v1, Lcom/unionpay/sdk/p;->a:Ljava/lang/String;

    const-string v2, "Analytics"

    iput-object v2, v1, Lcom/unionpay/sdk/p;->d:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/sdk/c;->p:Ljava/lang/String;

    iput-object v2, v1, Lcom/unionpay/sdk/p;->e:Ljava/lang/String;

    iput-object v0, v1, Lcom/unionpay/sdk/p;->g:Ljava/lang/Object;

    if-nez v0, :cond_3

    const-string v0, "No new data found!"

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, v1, Lcom/unionpay/sdk/p;->f:[B

    :goto_1
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    const/16 v1, 0x8

    iput v1, v0, Landroid/os/Message;->what:I

    invoke-static {}, Lcom/unionpay/sdk/ag$b;->a()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/sdk/c;->d:Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-direct {p0}, Lcom/unionpay/sdk/c;->c()V

    sget-boolean v1, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_3
    :try_start_3
    const-string v2, "New data found, Submitting..."

    invoke-static {v2}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "entity"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/unionpay/sdk/c;->g:Lcom/unionpay/sdk/bf;

    invoke-virtual {v0, v2}, Lcom/unionpay/sdk/bf;->a(Ljava/util/HashMap;)[B

    move-result-object v0

    iput-object v0, v1, Lcom/unionpay/sdk/p;->f:[B

    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/unionpay/sdk/p;->h:Z

    goto :goto_1

    :cond_4
    const-string v0, "Aborted submitting, file cannot be accessed due to lock."

    sget-boolean v1, Lcom/unionpay/sdk/UPAgent;->LOG_ON:Z

    if-eqz v1, :cond_0

    const-string v1, "UPLog"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0
.end method

.method private c()V
    .locals 1

    iget-object v0, p0, Lcom/unionpay/sdk/c;->o:Ljava/nio/channels/FileLock;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/unionpay/sdk/c;->o:Ljava/nio/channels/FileLock;

    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method final declared-synchronized a(Z)V
    .locals 12

    const-wide/32 v10, 0x1d4c0

    const-wide/16 v0, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    monitor-enter p0

    :try_start_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v4

    if-eqz p1, :cond_4

    :goto_0
    iput v2, v4, Landroid/os/Message;->what:I

    sget-boolean v2, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "submitWithSyncLock: interval = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/unionpay/sdk/c;->k:J

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "submitWithSyncLock: isInstantly = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    :cond_0
    if-nez p1, :cond_5

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v6, p0, Lcom/unionpay/sdk/c;->k:J

    sub-long/2addr v2, v6

    cmp-long v5, v2, v0

    if-ltz v5, :cond_3

    iget-wide v6, p0, Lcom/unionpay/sdk/c;->k:J

    cmp-long v5, v6, v0

    if-lez v5, :cond_1

    cmp-long v5, v2, v10

    if-gez v5, :cond_1

    sub-long v0, v10, v2

    :cond_1
    sget-boolean v2, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Next submitting try will be in "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-wide/16 v6, 0x3e8

    div-long v6, v0, v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " seconds."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    :cond_2
    sget-object v2, Lcom/unionpay/sdk/c;->m:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    sget-object v2, Lcom/unionpay/sdk/c;->m:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeMessages(I)V

    sget-object v2, Lcom/unionpay/sdk/c;->m:Landroid/os/Handler;

    invoke-virtual {v2, v4, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    :goto_1
    monitor-exit p0

    return-void

    :cond_4
    move v2, v3

    goto/16 :goto_0

    :cond_5
    :try_start_1
    iget-boolean v0, p0, Lcom/unionpay/sdk/c;->j:Z

    if-eqz v0, :cond_6

    const/16 v0, 0x7530

    iput v0, p0, Lcom/unionpay/sdk/c;->i:I

    :cond_6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/unionpay/sdk/c;->k:J

    sub-long/2addr v0, v2

    iget v2, p0, Lcom/unionpay/sdk/c;->i:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_3

    sget-object v0, Lcom/unionpay/sdk/c;->m:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    sget-object v0, Lcom/unionpay/sdk/c;->m:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    sget-object v0, Lcom/unionpay/sdk/c;->m:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final onTDEBEventResponse(Lcom/unionpay/sdk/s;)V
    .locals 4

    const v2, 0x1d4c0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/unionpay/sdk/c;->k:J

    if-eqz p1, :cond_2

    iget-object v0, p1, Lcom/unionpay/sdk/s;->a:Landroid/os/Bundle;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/unionpay/sdk/s;->a:Landroid/os/Bundle;

    const-string v1, "action"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Analytics"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/unionpay/sdk/s;->a:Landroid/os/Bundle;

    const-string v1, "statusCode"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_3

    const-string v0, "Data submitting Succeed!"

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    iget-object v1, p1, Lcom/unionpay/sdk/s;->b:Ljava/lang/Object;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/unionpay/sdk/s;->b:Ljava/lang/Object;

    instance-of v1, v1, Lcom/unionpay/sdk/w$f;

    if-eqz v1, :cond_0

    iget-object v0, p1, Lcom/unionpay/sdk/s;->b:Ljava/lang/Object;

    check-cast v0, Lcom/unionpay/sdk/w$f;

    :cond_0
    invoke-static {}, Lcom/unionpay/sdk/t;->a()Lcom/unionpay/sdk/t;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/sdk/ac;->a(Lcom/unionpay/sdk/w$f;Lcom/unionpay/sdk/bg;)V

    const v0, 0x1d4c0

    iput v0, p0, Lcom/unionpay/sdk/c;->i:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/sdk/c;->j:Z

    :cond_1
    :goto_0
    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/j;->c(Landroid/content/Context;)Z

    invoke-static {}, Lcom/unionpay/sdk/o;->f()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/unionpay/sdk/o;->f()Ljava/lang/String;

    move-result-object v0

    const-string v1, "2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/unionpay/sdk/c;->a(Z)V

    :cond_2
    invoke-direct {p0}, Lcom/unionpay/sdk/c;->c()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/sdk/c;->d:Z

    :goto_1
    return-void

    :cond_3
    iget-object v0, p0, Lcom/unionpay/sdk/c;->l:Ljava/util/Random;

    const v1, 0xea60

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit16 v0, v0, -0x7530

    add-int/2addr v0, v2

    iput v0, p0, Lcom/unionpay/sdk/c;->i:I

    const-string v0, "Data submitting Failed!"

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "statusCode: "

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p1, Lcom/unionpay/sdk/s;->a:Landroid/os/Bundle;

    const-string v3, "statusCode"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "responseMsg"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p1, Lcom/unionpay/sdk/s;->a:Landroid/os/Bundle;

    const-string v3, "responseMsg"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/sdk/c;->j:Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto :goto_1
.end method
