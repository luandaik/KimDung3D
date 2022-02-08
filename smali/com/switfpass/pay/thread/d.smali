.class final Lcom/switfpass/pay/thread/d;
.super Landroid/os/AsyncTask;


# instance fields
.field private final synthetic cU:Lcom/switfpass/pay/thread/NotifyListener;

.field private final synthetic cV:Lcom/switfpass/pay/thread/Executable;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/thread/NotifyListener;Lcom/switfpass/pay/thread/Executable;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/thread/d;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    iput-object p2, p0, Lcom/switfpass/pay/thread/d;->cV:Lcom/switfpass/pay/thread/Executable;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/thread/d;[Ljava/lang/Object;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/switfpass/pay/thread/d;->publishProgress([Ljava/lang/Object;)V

    return-void
.end method

.method private varargs s()Ljava/lang/Object;
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/switfpass/pay/thread/d;->cV:Lcom/switfpass/pay/thread/Executable;

    new-instance v1, Lcom/switfpass/pay/thread/e;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/thread/e;-><init>(Lcom/switfpass/pay/thread/d;)V

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/Executable;->setOnProgressChangedListener(Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/thread/d;->cV:Lcom/switfpass/pay/thread/Executable;

    invoke-virtual {v0}, Lcom/switfpass/pay/thread/Executable;->execute()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method protected final varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    invoke-direct {p0}, Lcom/switfpass/pay/thread/d;->s()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final onPostExecute(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/thread/d;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    instance-of v0, p1, Ljava/lang/Exception;

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/thread/d;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    invoke-virtual {v0, p1}, Lcom/switfpass/pay/thread/NotifyListener;->onSucceed(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method protected final onPreExecute()V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/thread/d;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/thread/d;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    invoke-virtual {v0}, Lcom/switfpass/pay/thread/NotifyListener;->onPreExecute()V

    :cond_0
    return-void
.end method

.method protected final varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 2

    check-cast p1, [Ljava/lang/Integer;

    iget-object v0, p0, Lcom/switfpass/pay/thread/d;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/thread/d;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/NotifyListener;->onProgress(I)V

    :cond_0
    return-void
.end method
