.class public Lcom/switfpass/pay/thread/UINotifyListener;
.super Lcom/switfpass/pay/thread/NotifyListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/switfpass/pay/thread/NotifyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Object;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/NotifyListener;->onError(Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    instance-of v0, p1, Ljava/lang/Integer;

    if-nez v0, :cond_0

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :cond_0
    :goto_0
    return-void

    :cond_1
    instance-of v0, p1, Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    goto :goto_0
.end method
