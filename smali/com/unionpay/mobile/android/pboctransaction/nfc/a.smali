.class public final Lcom/unionpay/mobile/android/pboctransaction/nfc/a;
.super Ljava/lang/Object;


# static fields
.field protected static final d:[B


# instance fields
.field protected a:Ljava/lang/String;

.field b:Lcom/unionpay/mobile/android/fully/a;

.field c:Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xe

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->d:[B

    return-void

    :array_0
    .array-data 1
        0x32t
        0x50t
        0x41t
        0x59t
        0x2et
        0x53t
        0x59t
        0x53t
        0x2et
        0x44t
        0x44t
        0x46t
        0x30t
        0x31t
    .end array-data
.end method

.method public constructor <init>(Lcom/unionpay/mobile/android/fully/a;Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "UnionPay Card"

    iput-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->a:Ljava/lang/String;

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->b:Lcom/unionpay/mobile/android/fully/a;

    iput-object p2, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->c:Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;

    return-void
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    const/4 v9, 0x3

    const/16 v8, -0x80

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v1, 0x0

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v5

    move v0, v1

    :goto_1
    array-length v2, v5

    if-ge v0, v2, :cond_9

    aget-byte v2, v5, v0

    and-int/lit8 v2, v2, 0x1f

    int-to-byte v2, v2

    const/16 v6, 0x1f

    if-ne v2, v6, :cond_e

    move v2, v3

    :goto_2
    new-array v6, v2, [B

    invoke-static {v5, v0, v6, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v6, v2}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([BI)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_4

    add-int/2addr v2, v0

    aget-byte v0, v5, v2

    and-int/lit16 v0, v0, 0x80

    int-to-byte v0, v0

    if-eq v0, v8, :cond_1

    aget-byte v0, v5, v2

    and-int/lit16 v0, v0, 0xff

    :goto_3
    new-array v3, v0, [B

    add-int/2addr v2, v4

    invoke-static {v5, v2, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v3, v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([BI)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    aget-byte v0, v5, v2

    and-int/lit8 v0, v0, 0x7f

    add-int/lit8 v4, v0, 0x1

    if-ne v4, v3, :cond_2

    add-int/lit8 v0, v2, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    goto :goto_3

    :cond_2
    if-ne v4, v9, :cond_3

    add-int/lit8 v0, v2, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v3, v2, 0x2

    aget-byte v3, v5, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v0, v3

    goto :goto_3

    :cond_3
    const/4 v0, 0x4

    if-ne v4, v0, :cond_d

    add-int/lit8 v0, v2, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    add-int/lit8 v3, v2, 0x2

    aget-byte v3, v5, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v0, v3

    add-int/lit8 v3, v2, 0x3

    aget-byte v3, v5, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v0, v3

    goto :goto_3

    :cond_4
    aget-byte v6, v5, v0

    and-int/lit8 v6, v6, 0x20

    const/16 v7, 0x20

    if-ne v6, v7, :cond_5

    add-int/2addr v2, v0

    array-length v0, v5

    if-ge v2, v0, :cond_c

    aget-byte v0, v5, v2

    and-int/lit16 v0, v0, 0x80

    int-to-byte v0, v0

    if-ne v0, v8, :cond_c

    aget-byte v0, v5, v2

    and-int/lit8 v0, v0, 0x7f

    add-int/lit8 v0, v0, 0x1

    :goto_4
    add-int/2addr v0, v2

    goto/16 :goto_1

    :cond_5
    add-int v6, v0, v2

    array-length v0, v5

    if-ge v6, v0, :cond_6

    aget-byte v0, v5, v6

    and-int/lit16 v0, v0, 0x80

    int-to-byte v0, v0

    if-nez v0, :cond_6

    aget-byte v0, v5, v6

    and-int/lit16 v0, v0, 0xff

    move v2, v4

    :goto_5
    add-int/2addr v0, v2

    add-int/2addr v0, v6

    goto/16 :goto_1

    :cond_6
    array-length v0, v5

    if-ge v6, v0, :cond_b

    aget-byte v0, v5, v6

    and-int/lit8 v0, v0, 0x7f

    add-int/lit8 v2, v0, 0x1

    :goto_6
    if-ne v2, v3, :cond_7

    add-int/lit8 v0, v6, 0x1

    array-length v7, v5

    if-ge v0, v7, :cond_7

    add-int/lit8 v0, v6, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    goto :goto_5

    :cond_7
    if-ne v2, v9, :cond_8

    add-int/lit8 v0, v6, 0x2

    array-length v7, v5

    if-ge v0, v7, :cond_8

    add-int/lit8 v0, v6, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v7, v6, 0x2

    aget-byte v7, v5, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v0, v7

    goto :goto_5

    :cond_8
    const/4 v0, 0x4

    if-ne v2, v0, :cond_a

    add-int/lit8 v0, v6, 0x2

    array-length v7, v5

    if-ge v0, v7, :cond_a

    add-int/lit8 v0, v6, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    add-int/lit8 v7, v6, 0x2

    aget-byte v7, v5, v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v0, v7

    add-int/lit8 v7, v6, 0x3

    aget-byte v7, v5, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v0, v7

    goto :goto_5

    :cond_9
    const/4 v0, 0x0

    goto/16 :goto_0

    :cond_a
    move v0, v1

    goto :goto_5

    :cond_b
    move v2, v1

    goto :goto_6

    :cond_c
    move v0, v4

    goto :goto_4

    :cond_d
    move v0, v1

    goto/16 :goto_3

    :cond_e
    move v2, v4

    goto/16 :goto_2
.end method

.method private static a(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v3, 0x1

    const/4 v1, 0x0

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    if-nez p0, :cond_0

    move-object v0, v4

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v5

    move v0, v1

    :goto_1
    array-length v2, v5

    if-ge v0, v2, :cond_1

    aget-byte v2, v5, v0

    and-int/lit8 v2, v2, 0x1f

    int-to-byte v2, v2

    const/16 v6, 0x1f

    if-ne v2, v6, :cond_3

    const/4 v2, 0x2

    :goto_2
    new-array v6, v2, [B

    invoke-static {v5, v0, v6, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v6, v2}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([BI)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/2addr v2, v0

    array-length v0, v5

    if-ge v2, v0, :cond_2

    aget-byte v0, v5, v2

    and-int/lit16 v0, v0, 0x80

    int-to-byte v0, v0

    const/16 v6, -0x80

    if-ne v0, v6, :cond_2

    aget-byte v0, v5, v2

    and-int/lit8 v0, v0, 0x7f

    add-int/lit8 v0, v0, 0x1

    :goto_3
    add-int/2addr v0, v2

    goto :goto_1

    :cond_1
    move-object v0, v4

    goto :goto_0

    :cond_2
    move v0, v3

    goto :goto_3

    :cond_3
    move v2, v3

    goto :goto_2
.end method

.method public static b(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "82"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "9F36"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "9F10"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "9F26"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "5F34"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "57"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "9F63"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v1, v0

    :goto_0
    :try_start_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {p1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v0, "5F34"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    const-string v2, "0"

    invoke-virtual {v1, v0, v2}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "5F34"

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "57"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    move-object v1, v0

    :goto_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v2, "f"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v2, "F"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    const/4 v0, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    goto :goto_1

    :cond_3
    const-string v0, "TD2"

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "D"

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v0, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v3, "F"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "f"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    :cond_4
    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_5
    const-string v3, "AN1"

    invoke-virtual {p1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v2, 0x1

    add-int/lit8 v2, v2, 0x5

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ED"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "AMT"

    const-string v1, "9F02"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "9F10"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "9F10"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x4

    aget-byte v0, v0, v1

    and-int/lit8 v0, v0, 0x30

    int-to-byte v0, v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_6

    const-string v0, "9F27"

    const-string v1, "80"

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_6
    :goto_2
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->c:Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;

    sget-object v2, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->d:[B

    invoke-virtual {v1, v2}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;->a([B)Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->b()Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "4F"

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "A000000333"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->c:Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;->a([B)Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->b()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    const-string v0, "noSupUnionpay"

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const/4 v2, 0x0

    const/4 v7, 0x0

    const-string v0, "9F38"

    invoke-static {p1, v0}, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->a(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_1

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->c:Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v1

    array-length v3, v1

    add-int/lit8 v3, v3, 0x7

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    const/16 v4, -0x80

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v4

    const/16 v5, -0x58

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v4

    array-length v5, v1

    add-int/lit8 v5, v5, 0x2

    int-to-byte v5, v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v4

    const/16 v5, -0x7d

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v4

    array-length v5, v1

    int-to-byte v5, v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    const-string v1, "PBOC Transceive"

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-static {v4}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;->c([B)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;->b([B)[B

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;-><init>([B)V

    const-string v0, "PBOC receive"

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->a()[B

    move-result-object v3

    invoke-static {v3}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$b;->c([B)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->b()Z

    move-result v0

    if-nez v0, :cond_3

    move-object v0, v2

    :goto_1
    return-object v0

    :cond_3
    invoke-virtual {v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "9F10"

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/pboctransaction/nfc/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v3, 0x4

    aget-byte v0, v0, v3

    and-int/lit8 v0, v0, 0x30

    int-to-byte v0, v0

    const/16 v3, 0x20

    if-eq v0, v3, :cond_4

    move-object v0, v2

    goto :goto_1

    :cond_4
    invoke-virtual {v1}, Lcom/unionpay/mobile/android/pboctransaction/nfc/b$a;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method
