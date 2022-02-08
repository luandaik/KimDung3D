.class public abstract Lcom/switfpass/pay/thread/Executable;
.super Ljava/lang/Object;


# instance fields
.field private cQ:Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract execute()Ljava/lang/Object;
.end method

.method public setOnProgressChangedListener(Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/thread/Executable;->cQ:Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;

    return-void
.end method

.method public updateProgress(I)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/thread/Executable;->cQ:Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/thread/Executable;->cQ:Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;

    invoke-interface {v0, p1}, Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;->onProgressChanged(I)V

    :cond_0
    return-void
.end method
