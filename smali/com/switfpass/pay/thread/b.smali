.class final Lcom/switfpass/pay/thread/b;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic cT:Lcom/switfpass/pay/thread/Executable;

.field private final synthetic cU:Lcom/switfpass/pay/thread/NotifyListener;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/thread/b;->cT:Lcom/switfpass/pay/thread/Executable;

    iput-object p2, p0, Lcom/switfpass/pay/thread/b;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/switfpass/pay/thread/b;->cT:Lcom/switfpass/pay/thread/Executable;

    new-instance v1, Lcom/switfpass/pay/thread/c;

    iget-object v2, p0, Lcom/switfpass/pay/thread/b;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    invoke-direct {v1, v2}, Lcom/switfpass/pay/thread/c;-><init>(Lcom/switfpass/pay/thread/NotifyListener;)V

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/Executable;->setOnProgressChangedListener(Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/thread/b;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/thread/b;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    invoke-virtual {v0}, Lcom/switfpass/pay/thread/NotifyListener;->onPreExecute()V

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/switfpass/pay/thread/b;->cT:Lcom/switfpass/pay/thread/Executable;

    invoke-virtual {v1}, Lcom/switfpass/pay/thread/Executable;->execute()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/switfpass/pay/thread/b;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    if-eqz v1, :cond_1

    if-eqz v0, :cond_2

    instance-of v1, v0, Ljava/lang/Exception;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/switfpass/pay/thread/b;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u53d1\u9001\u9519\u8bef\u5566"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/switfpass/pay/thread/NotifyListener;->onError(Ljava/lang/Object;)V

    :cond_1
    :goto_1
    return-void

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/switfpass/pay/thread/b;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    invoke-virtual {v1, v0}, Lcom/switfpass/pay/thread/NotifyListener;->onSucceed(Ljava/lang/Object;)V

    goto :goto_1
.end method
