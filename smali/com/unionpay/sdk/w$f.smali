.class final Lcom/unionpay/sdk/w$f;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/sdk/x;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "f"
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Lcom/unionpay/sdk/w$d;

.field d:Lcom/unionpay/sdk/w$e;

.field e:Ljava/util/List;

.field f:J

.field g:J

.field h:J

.field i:[[Ljava/lang/Long;


# direct methods
.method constructor <init>()V
    .locals 4

    const-wide/16 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$f;->a:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$f;->b:Ljava/lang/String;

    new-instance v0, Lcom/unionpay/sdk/w$d;

    invoke-direct {v0}, Lcom/unionpay/sdk/w$d;-><init>()V

    iput-object v0, p0, Lcom/unionpay/sdk/w$f;->c:Lcom/unionpay/sdk/w$d;

    new-instance v0, Lcom/unionpay/sdk/w$e;

    invoke-direct {v0}, Lcom/unionpay/sdk/w$e;-><init>()V

    iput-object v0, p0, Lcom/unionpay/sdk/w$f;->d:Lcom/unionpay/sdk/w$e;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/unionpay/sdk/w$f;->e:Ljava/util/List;

    iput-wide v2, p0, Lcom/unionpay/sdk/w$f;->f:J

    iput-wide v2, p0, Lcom/unionpay/sdk/w$f;->g:J

    iput-wide v2, p0, Lcom/unionpay/sdk/w$f;->h:J

    return-void
.end method


# virtual methods
.method public final messagePack(Lcom/unionpay/sdk/z;)V
    .locals 10

    const/4 v1, 0x0

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->b(I)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$f;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$f;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$f;->c:Lcom/unionpay/sdk/w$d;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Lcom/unionpay/sdk/x;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$f;->d:Lcom/unionpay/sdk/w$e;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Lcom/unionpay/sdk/x;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$f;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->b(I)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$f;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/sdk/w$i;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Lcom/unionpay/sdk/x;)Lcom/unionpay/sdk/z;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/unionpay/sdk/w$f;->i:[[Ljava/lang/Long;

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/unionpay/sdk/z;->a()Lcom/unionpay/sdk/z;

    :cond_1
    return-void

    :cond_2
    sget-boolean v0, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v2, "app info:"

    aput-object v2, v0, v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/unionpay/sdk/w$f;->i:[[Ljava/lang/Long;

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    :cond_3
    iget-object v0, p0, Lcom/unionpay/sdk/w$f;->i:[[Ljava/lang/Long;

    array-length v0, v0

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->b(I)Lcom/unionpay/sdk/z;

    iget-object v3, p0, Lcom/unionpay/sdk/w$f;->i:[[Ljava/lang/Long;

    array-length v4, v3

    move v2, v1

    :goto_1
    if-ge v2, v4, :cond_1

    aget-object v5, v3, v2

    if-eqz v5, :cond_4

    array-length v0, v5

    if-nez v0, :cond_6

    :cond_4
    invoke-virtual {p1}, Lcom/unionpay/sdk/z;->a()Lcom/unionpay/sdk/z;

    :cond_5
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    :cond_6
    array-length v0, v5

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->b(I)Lcom/unionpay/sdk/z;

    array-length v6, v5

    move v0, v1

    :goto_2
    if-ge v0, v6, :cond_5

    aget-object v7, v5, v0

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-virtual {p1, v8, v9}, Lcom/unionpay/sdk/z;->a(J)Lcom/unionpay/sdk/z;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method
