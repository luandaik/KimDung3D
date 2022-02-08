.class final Lcom/switfpass/pay/thread/e;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/switfpass/pay/thread/Executable$ProgressChangedListener;


# instance fields
.field private synthetic cW:Lcom/switfpass/pay/thread/d;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/thread/d;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/thread/e;->cW:Lcom/switfpass/pay/thread/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onProgressChanged(I)V
    .locals 4

    iget-object v0, p0, Lcom/switfpass/pay/thread/e;->cW:Lcom/switfpass/pay/thread/d;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Integer;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/switfpass/pay/thread/d;->a(Lcom/switfpass/pay/thread/d;[Ljava/lang/Object;)V

    return-void
.end method
