.class public final Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;
.super Lcom/unionpay/mobile/android/pboctransaction/nfc/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/mobile/android/pboctransaction/nfc/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field public static final c:[B

.field public static final d:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->c:[B

    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->d:[B

    return-void

    :array_0
    .array-data 1
        0x6ft
        0x0t
    .end array-data
.end method

.method public constructor <init>([B)V
    .locals 2

    if-eqz p1, :cond_0

    array-length v0, p1

    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    :cond_0
    sget-object p1, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->d:[B

    :cond_1
    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b;-><init>([B)V

    return-void
.end method


# virtual methods
.method public final a()[B
    .locals 3

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->b:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->b:[B

    array-length v2, v2

    add-int/lit8 v2, v2, -0x2

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->c:[B

    goto :goto_0
.end method

.method public final b()Z
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->b:[B

    array-length v1, v0

    add-int/lit8 v2, v1, -0x2

    aget-byte v2, v0, v2

    shl-int/lit8 v2, v2, 0x8

    add-int/lit8 v1, v1, -0x1

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    or-int/2addr v0, v2

    int-to-short v0, v0

    const/16 v1, -0x7000

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
