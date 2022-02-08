.class final Lcom/switfpass/pay/thread/c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;


# instance fields
.field private final synthetic cU:Lcom/switfpass/pay/thread/NotifyListener;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/thread/NotifyListener;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/thread/c;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onProgressChanged(I)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/thread/c;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/thread/c;->cU:Lcom/switfpass/pay/thread/NotifyListener;

    invoke-virtual {v0, p1}, Lcom/switfpass/pay/thread/NotifyListener;->onProgress(I)V

    :cond_0
    return-void
.end method
