.class public Lcom/unionpay/mobile/android/pboctransaction/nfc/b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;,
        Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;
    }
.end annotation


# static fields
.field public static final a:[B


# instance fields
.field protected b:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x1

    new-array v0, v0, [B

    aput-byte v1, v0, v1

    sput-object v0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b;->a:[B

    return-void
.end method

.method protected constructor <init>([B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    sget-object p1, Lcom/unionpay/mobile/android/pboctransaction/nfc/b;->a:[B

    :cond_0
    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b;->b:[B

    return-void
.end method


# virtual methods
.method public a()[B
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b;->b:[B

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b;->b:[B

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/b;->b:[B

    array-length v1, v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/c;->a([BI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
