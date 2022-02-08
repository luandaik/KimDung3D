.class public final Lcom/unionpay/a/d;
.super Ljava/lang/Object;


# instance fields
.field private a:I

.field private b:Ljava/lang/String;

.field private c:Ljava/util/HashMap;

.field private d:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/unionpay/a/d;->a:I

    iput-object p1, p0, Lcom/unionpay/a/d;->b:Ljava/lang/String;

    iput-object v1, p0, Lcom/unionpay/a/d;->c:Ljava/util/HashMap;

    iput-object v1, p0, Lcom/unionpay/a/d;->d:[B

    return-void
.end method


# virtual methods
.method public final a()I
    .locals 1

    iget v0, p0, Lcom/unionpay/a/d;->a:I

    return v0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 3

    const-string v0, "uppay"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "encrypt postData: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/utils/g;->b(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/a/d;->d:[B

    :cond_0
    return-void
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/a/d;->b:Ljava/lang/String;

    return-object v0
.end method

.method public final c()Ljava/util/HashMap;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/a/d;->c:Ljava/util/HashMap;

    return-object v0
.end method

.method public final d()[B
    .locals 1

    iget-object v0, p0, Lcom/unionpay/a/d;->d:[B

    return-object v0
.end method
