.class abstract Lcom/unionpay/sdk/bf;
.super Ljava/lang/Object;


# instance fields
.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field d:Ljava/lang/String;

.field e:I


# direct methods
.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/unionpay/sdk/bf;->b:Ljava/lang/String;

    iput-object v0, p0, Lcom/unionpay/sdk/bf;->c:Ljava/lang/String;

    iput-object v0, p0, Lcom/unionpay/sdk/bf;->d:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/unionpay/sdk/bf;->e:I

    return-void
.end method


# virtual methods
.method abstract a(Ljava/util/HashMap;)[B
.end method
