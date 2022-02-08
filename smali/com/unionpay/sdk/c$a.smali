.class final Lcom/unionpay/sdk/c$a;
.super Lcom/unionpay/sdk/bf;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/unionpay/sdk/c;


# direct methods
.method constructor <init>(Lcom/unionpay/sdk/c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lcom/unionpay/sdk/c$a;->a:Lcom/unionpay/sdk/c;

    invoke-direct {p0}, Lcom/unionpay/sdk/bf;-><init>()V

    iput-object p2, p0, Lcom/unionpay/sdk/c$a;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/unionpay/sdk/c$a;->c:Ljava/lang/String;

    iput-object p4, p0, Lcom/unionpay/sdk/c$a;->d:Ljava/lang/String;

    const/4 v0, 0x1

    iput v0, p0, Lcom/unionpay/sdk/c$a;->e:I

    return-void
.end method


# virtual methods
.method final a(Ljava/util/HashMap;)[B
    .locals 5

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    const/16 v0, 0x400

    invoke-direct {v2, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    new-instance v3, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v3, v2}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v4, Lcom/unionpay/sdk/z;

    invoke-direct {v4, v3}, Lcom/unionpay/sdk/z;-><init>(Ljava/io/OutputStream;)V

    const-string v0, "entity"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "entity"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "entity"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/unionpay/sdk/w$f;

    if-eqz v0, :cond_0

    const-string v0, "entity"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/sdk/w$f;

    invoke-virtual {v4, v0}, Lcom/unionpay/sdk/z;->a(Lcom/unionpay/sdk/x;)Lcom/unionpay/sdk/z;

    invoke-virtual {v3}, Ljava/util/zip/GZIPOutputStream;->finish()V

    invoke-virtual {v3}, Ljava/util/zip/GZIPOutputStream;->close()V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    move-object v0, v1

    goto :goto_0
.end method
