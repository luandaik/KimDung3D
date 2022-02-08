.class final Lcom/unionpay/utils/j;
.super Lcom/unionpay/utils/h;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/unionpay/utils/h;-><init>()V

    const-string v0, "Are you sure you want to cancel the payment?"

    iput-object v0, p0, Lcom/unionpay/utils/j;->a:Ljava/lang/String;

    const-string v0, "OK"

    iput-object v0, p0, Lcom/unionpay/utils/j;->b:Ljava/lang/String;

    const-string v0, "CANCEL"

    iput-object v0, p0, Lcom/unionpay/utils/j;->c:Ljava/lang/String;

    const-string v0, "Information"

    iput-object v0, p0, Lcom/unionpay/utils/j;->d:Ljava/lang/String;

    const-string v0, "China UnionPay"

    iput-object v0, p0, Lcom/unionpay/utils/j;->e:Ljava/lang/String;

    const-string v0, "DownloadManager is disabled. Please enable it."

    iput-object v0, p0, Lcom/unionpay/utils/j;->f:Ljava/lang/String;

    return-void
.end method
