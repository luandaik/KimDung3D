.class final Lcom/unionpay/sdk/z;
.super Ljava/lang/Object;


# instance fields
.field protected a:[B

.field protected b:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x9

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    iput-object p1, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    return-void
.end method

.method static b(J)I
    .locals 6

    const/16 v0, 0x9

    const/4 v1, 0x5

    const/4 v2, 0x3

    const/4 v3, 0x2

    const-wide/16 v4, -0x20

    cmp-long v4, p0, v4

    if-gez v4, :cond_4

    const-wide/16 v4, -0x8000

    cmp-long v4, p0, v4

    if-gez v4, :cond_2

    const-wide/32 v2, -0x80000000

    cmp-long v2, p0, v2

    if-gez v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    const-wide/16 v0, -0x80

    cmp-long v0, p0, v0

    if-gez v0, :cond_3

    move v0, v2

    goto :goto_0

    :cond_3
    move v0, v3

    goto :goto_0

    :cond_4
    const-wide/16 v4, 0x80

    cmp-long v4, p0, v4

    if-gez v4, :cond_5

    const/4 v0, 0x1

    goto :goto_0

    :cond_5
    const-wide/32 v4, 0x10000

    cmp-long v4, p0, v4

    if-gez v4, :cond_7

    const-wide/16 v0, 0x100

    cmp-long v0, p0, v0

    if-gez v0, :cond_6

    move v0, v3

    goto :goto_0

    :cond_6
    move v0, v2

    goto :goto_0

    :cond_7
    const-wide v2, 0x100000000L

    cmp-long v2, p0, v2

    if-gez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method static b(Ljava/lang/String;)I
    .locals 2

    :try_start_0
    const-string v0, "UTF-8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    array-length v1, v0

    invoke-static {v1}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v1

    array-length v0, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/2addr v0, v1

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method static c(I)I
    .locals 1

    const/16 v0, 0x10

    if-ge p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/high16 v0, 0x10000

    if-ge p0, v0, :cond_1

    const/4 v0, 0x3

    goto :goto_0

    :cond_1
    const/4 v0, 0x5

    goto :goto_0
.end method

.method private c(Ljava/lang/String;)Lcom/unionpay/sdk/z;
    .locals 2

    const-string v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    array-length v1, v0

    invoke-virtual {p0, v1}, Lcom/unionpay/sdk/z;->e(I)Lcom/unionpay/sdk/z;

    invoke-virtual {p0, v0}, Lcom/unionpay/sdk/z;->a([B)Lcom/unionpay/sdk/z;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method final a()Lcom/unionpay/sdk/z;
    .locals 2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    const/16 v1, -0x40

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    return-object p0
.end method

.method final a(D)Lcom/unionpay/sdk/z;
    .locals 9

    const/16 v7, 0x8

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x35

    aput-byte v1, v0, v6

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v0

    iget-object v2, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v3, 0x1

    const/16 v4, 0x38

    shr-long v4, v0, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    iget-object v2, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v3, 0x2

    const/16 v4, 0x30

    shr-long v4, v0, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    iget-object v2, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v3, 0x3

    const/16 v4, 0x28

    shr-long v4, v0, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    iget-object v2, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v3, 0x4

    const/16 v4, 0x20

    shr-long v4, v0, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    iget-object v2, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v3, 0x5

    const/16 v4, 0x18

    shr-long v4, v0, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    iget-object v2, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v3, 0x6

    const/16 v4, 0x10

    shr-long v4, v0, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    iget-object v2, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v3, 0x7

    shr-long v4, v0, v7

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    iget-object v2, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-long/2addr v0, v6

    long-to-int v0, v0

    int-to-byte v0, v0

    aput-byte v0, v2, v7

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v6, v2}, Ljava/io/OutputStream;->write([BII)V

    return-object p0
.end method

.method final a(F)Lcom/unionpay/sdk/z;
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x36

    aput-byte v1, v0, v4

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x1

    shr-int/lit8 v3, v0, 0x18

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x2

    shr-int/lit8 v3, v0, 0x10

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x3

    shr-int/lit8 v3, v0, 0x8

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x4

    shr-int/lit8 v0, v0, 0x0

    int-to-byte v0, v0

    aput-byte v0, v1, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    return-object p0
.end method

.method final a(I)Lcom/unionpay/sdk/z;
    .locals 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/16 v0, -0x20

    if-ge p1, v0, :cond_2

    const/16 v0, -0x8000

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x2e

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    :goto_0
    return-object p0

    :cond_0
    const/16 v0, -0x80

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x2f

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v3, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x30

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_2
    const/16 v0, 0x80

    if-ge p1, v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    int-to-byte v1, p1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0

    :cond_3
    const/16 v0, 0x100

    if-ge p1, v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x34

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_4
    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x33

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v3, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x32

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    goto/16 :goto_0
.end method

.method final a(J)Lcom/unionpay/sdk/z;
    .locals 9

    const/4 v8, 0x3

    const/16 v7, 0x8

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const-wide/16 v0, -0x20

    cmp-long v0, p1, v0

    if-gez v0, :cond_3

    const-wide/16 v0, -0x8000

    cmp-long v0, p1, v0

    if-gez v0, :cond_1

    const-wide/32 v0, -0x80000000

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x2d

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, 0x38

    shr-long v2, p1, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, 0x30

    shr-long v2, p1, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, 0x28

    shr-long v2, p1, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v8

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x4

    const/16 v2, 0x20

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x5

    const/16 v2, 0x18

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x6

    const/16 v2, 0x10

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x7

    shr-long v2, p1, v7

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-long v2, p1, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v7

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    :goto_0
    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x2e

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, 0x18

    shr-long v2, p1, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, 0x10

    shr-long v2, p1, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-long v2, p1, v7

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v8

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x4

    shr-long v2, p1, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_1
    const-wide/16 v0, -0x80

    cmp-long v0, p1, v0

    if-gez v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x2f

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-long v2, p1, v7

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-long v2, p1, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v4, v8}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x30

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    long-to-int v1, p1

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v4, v6}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_3
    const-wide/16 v0, 0x80

    cmp-long v0, p1, v0

    if-gez v0, :cond_4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    long-to-int v1, p1

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0

    :cond_4
    const-wide/32 v0, 0x10000

    cmp-long v0, p1, v0

    if-gez v0, :cond_6

    const-wide/16 v0, 0x100

    cmp-long v0, p1, v0

    if-gez v0, :cond_5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x34

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    long-to-int v1, p1

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v4, v6}, Ljava/io/OutputStream;->write([BII)V

    goto/16 :goto_0

    :cond_5
    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x33

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const-wide/32 v2, 0xff00

    and-long/2addr v2, p1

    shr-long/2addr v2, v7

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const-wide/16 v2, 0xff

    and-long/2addr v2, p1

    shr-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v4, v8}, Ljava/io/OutputStream;->write([BII)V

    goto/16 :goto_0

    :cond_6
    const-wide v0, 0x100000000L

    cmp-long v0, p1, v0

    if-gez v0, :cond_7

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x32

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const-wide/32 v2, -0x1000000

    and-long/2addr v2, p1

    const/16 v1, 0x18

    shr-long/2addr v2, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const-wide/32 v2, 0xff0000

    and-long/2addr v2, p1

    const/16 v1, 0x10

    shr-long/2addr v2, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const-wide/32 v2, 0xff00

    and-long/2addr v2, p1

    shr-long/2addr v2, v7

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v8

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x4

    const-wide/16 v2, 0xff

    and-long/2addr v2, p1

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    goto/16 :goto_0

    :cond_7
    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x31

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, 0x38

    shr-long v2, p1, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, 0x30

    shr-long v2, p1, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v6

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, 0x28

    shr-long v2, p1, v1

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v8

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x4

    const/16 v2, 0x20

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x5

    const/16 v2, 0x18

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x6

    const/16 v2, 0x10

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x7

    shr-long v2, p1, v7

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-long v2, p1, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v7

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    goto/16 :goto_0
.end method

.method final a(Lcom/unionpay/sdk/x;)Lcom/unionpay/sdk/z;
    .locals 0

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/unionpay/sdk/z;->a()Lcom/unionpay/sdk/z;

    move-result-object p0

    :goto_0
    return-object p0

    :cond_0
    invoke-interface {p1, p0}, Lcom/unionpay/sdk/x;->messagePack(Lcom/unionpay/sdk/z;)V

    goto :goto_0
.end method

.method final a(Ljava/lang/String;)Lcom/unionpay/sdk/z;
    .locals 1

    if-nez p1, :cond_0

    const-string v0, ""

    invoke-direct {p0, v0}, Lcom/unionpay/sdk/z;->c(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, p1}, Lcom/unionpay/sdk/z;->c(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    move-result-object v0

    goto :goto_0
.end method

.method final a(Z)Lcom/unionpay/sdk/z;
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    const/16 v1, -0x3d

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    :goto_0
    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    const/16 v1, -0x3e

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0
.end method

.method final a([B)Lcom/unionpay/sdk/z;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    return-object p0
.end method

.method final b(I)Lcom/unionpay/sdk/z;
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/16 v0, 0x10

    if-ge p1, v0, :cond_0

    or-int/lit16 v0, p1, 0x90

    iget-object v1, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    int-to-byte v0, v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    :goto_0
    return-object p0

    :cond_0
    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x24

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v3, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x23

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x4

    shr-int/lit8 v2, p1, 0x0

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method final d(I)Lcom/unionpay/sdk/z;
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/16 v0, 0x10

    if-ge p1, v0, :cond_0

    or-int/lit16 v0, p1, 0x80

    iget-object v1, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    int-to-byte v0, v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    :goto_0
    return-object p0

    :cond_0
    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x22

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v3, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x21

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x4

    shr-int/lit8 v2, p1, 0x0

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method final e(I)Lcom/unionpay/sdk/z;
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/16 v0, 0x20

    if-ge p1, v0, :cond_0

    or-int/lit16 v0, p1, 0xa0

    iget-object v1, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    int-to-byte v0, v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    :goto_0
    return-object p0

    :cond_0
    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x26

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x0

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    invoke-virtual {v0, v1, v3, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/16 v1, -0x25

    aput-byte v1, v0, v3

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    iget-object v0, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v1, 0x4

    shr-int/lit8 v2, p1, 0x0

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    iget-object v0, p0, Lcom/unionpay/sdk/z;->b:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/unionpay/sdk/z;->a:[B

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method
