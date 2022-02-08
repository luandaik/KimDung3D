.class public Lcom/switfpass/pay/thread/NotifyListener;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Lcom/switfpass/pay/thread/NotifyListener;->onPreExecute()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Object;)V
    .locals 0

    invoke-virtual {p0}, Lcom/switfpass/pay/thread/NotifyListener;->onPostExecute()V

    return-void
.end method

.method public onPostExecute()V
    .locals 0

    return-void
.end method

.method public onPreExecute()V
    .locals 0

    return-void
.end method

.method public onProgress(I)V
    .locals 0

    return-void
.end method

.method public onSucceed(Ljava/lang/Object;)V
    .locals 0

    invoke-virtual {p0}, Lcom/switfpass/pay/thread/NotifyListener;->onPostExecute()V

    return-void
.end method
