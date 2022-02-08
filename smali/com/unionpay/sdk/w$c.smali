.class final Lcom/unionpay/sdk/w$c;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/sdk/x;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "c"
.end annotation


# instance fields
.field a:J

.field b:I

.field c:Ljava/lang/String;

.field d:[B

.field e:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/unionpay/sdk/w$c;->a:J

    const/4 v0, 0x1

    iput v0, p0, Lcom/unionpay/sdk/w$c;->b:I

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$c;->c:Ljava/lang/String;

    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/unionpay/sdk/w$c;->d:[B

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$c;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final messagePack(Lcom/unionpay/sdk/z;)V
    .locals 2

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->b(I)Lcom/unionpay/sdk/z;

    iget-wide v0, p0, Lcom/unionpay/sdk/w$c;->a:J

    invoke-virtual {p1, v0, v1}, Lcom/unionpay/sdk/z;->a(J)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$c;->b:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$c;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$c;->d:[B

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/unionpay/sdk/z;->a()Lcom/unionpay/sdk/z;

    :goto_0
    iget-object v0, p0, Lcom/unionpay/sdk/w$c;->e:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    return-void

    :cond_0
    array-length v1, v0

    invoke-virtual {p1, v1}, Lcom/unionpay/sdk/z;->e(I)Lcom/unionpay/sdk/z;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a([B)Lcom/unionpay/sdk/z;

    goto :goto_0
.end method
