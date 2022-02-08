.class public Lcom/switfpass/pay/thread/ThreadHelper;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static executeWithCallback(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V
    .locals 2

    if-nez p0, :cond_0

    :goto_0
    return-void

    :cond_0
    if-eqz p1, :cond_1

    instance-of v0, p1, Lcom/switfpass/pay/thread/UINotifyListener;

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/switfpass/pay/thread/b;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/thread/b;-><init>(Lcom/switfpass/pay/thread/Executable;Lcom/switfpass/pay/thread/NotifyListener;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/switfpass/pay/thread/d;

    invoke-direct {v0, p1, p0}, Lcom/switfpass/pay/thread/d;-><init>(Lcom/switfpass/pay/thread/NotifyListener;Lcom/switfpass/pay/thread/Executable;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/d;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method
