.class final Lcom/unionpay/sdk/s;
.super Ljava/lang/Object;


# instance fields
.field a:Landroid/os/Bundle;

.field b:Ljava/lang/Object;

.field c:I


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/unionpay/sdk/s;->a:Landroid/os/Bundle;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/sdk/s;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    iput v0, p0, Lcom/unionpay/sdk/s;->c:I

    return-void
.end method
