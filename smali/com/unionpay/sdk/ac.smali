.class final Lcom/unionpay/sdk/ac;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/unionpay/sdk/w$d;

.field private static b:Lcom/unionpay/sdk/w$e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    sput-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    return-void
.end method

.method static a(Lcom/unionpay/sdk/bg;)Lcom/unionpay/sdk/w$f;
    .locals 14

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    new-instance v6, Lcom/unionpay/sdk/w$f;

    invoke-direct {v6}, Lcom/unionpay/sdk/w$f;-><init>()V

    invoke-static {v0}, Lcom/unionpay/sdk/g;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/unionpay/sdk/w$f;->a:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/d;->g:Ljava/lang/String;

    iput-object v0, v6, Lcom/unionpay/sdk/w$f;->b:Ljava/lang/String;

    invoke-static {}, Lcom/unionpay/sdk/ac;->b()Lcom/unionpay/sdk/w$d;

    move-result-object v0

    iput-object v0, v6, Lcom/unionpay/sdk/w$f;->c:Lcom/unionpay/sdk/w$d;

    invoke-static {}, Lcom/unionpay/sdk/ac;->c()Lcom/unionpay/sdk/w$e;

    move-result-object v0

    iput-object v0, v6, Lcom/unionpay/sdk/w$f;->d:Lcom/unionpay/sdk/w$e;

    const/4 v0, 0x5

    invoke-static {v0}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v0

    iget-object v1, v6, Lcom/unionpay/sdk/w$f;->a:Ljava/lang/String;

    invoke-static {v1}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, v6, Lcom/unionpay/sdk/w$f;->b:Ljava/lang/String;

    invoke-static {v1}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, v6, Lcom/unionpay/sdk/w$f;->c:Lcom/unionpay/sdk/w$d;

    const/16 v2, 0x9

    invoke-static {v2}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v2

    iget-object v3, v1, Lcom/unionpay/sdk/w$d;->a:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$d;->b:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$d;->c:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-wide v4, v1, Lcom/unionpay/sdk/w$d;->d:J

    invoke-static {v4, v5}, Lcom/unionpay/sdk/z;->b(J)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$d;->e:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$d;->f:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-boolean v3, v1, Lcom/unionpay/sdk/w$d;->g:Z

    add-int/lit8 v2, v2, 0x1

    iget-wide v4, v1, Lcom/unionpay/sdk/w$d;->h:J

    invoke-static {v4, v5}, Lcom/unionpay/sdk/z;->b(J)I

    move-result v3

    add-int/2addr v2, v3

    iget-wide v4, v1, Lcom/unionpay/sdk/w$d;->i:J

    invoke-static {v4, v5}, Lcom/unionpay/sdk/z;->b(J)I

    move-result v1

    add-int/2addr v1, v2

    add-int/2addr v0, v1

    iget-object v1, v6, Lcom/unionpay/sdk/w$f;->d:Lcom/unionpay/sdk/w$e;

    const/16 v2, 0x18

    invoke-static {v2}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v2

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->a:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->b:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->c:Lcom/unionpay/sdk/w$h;

    const/4 v4, 0x2

    invoke-static {v4}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v4

    iget-wide v8, v3, Lcom/unionpay/sdk/w$h;->a:D

    add-int/lit8 v4, v4, 0x9

    iget-wide v8, v3, Lcom/unionpay/sdk/w$h;->b:D

    add-int/lit8 v3, v4, 0x9

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->d:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->e:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->f:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->g:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->h:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget v3, v1, Lcom/unionpay/sdk/w$e;->i:I

    invoke-static {v3}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->j:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget v3, v1, Lcom/unionpay/sdk/w$e;->k:I

    invoke-static {v3}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->l:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-boolean v3, v1, Lcom/unionpay/sdk/w$e;->m:Z

    add-int/lit8 v2, v2, 0x1

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->n:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->o:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->p:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->q:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-wide v4, v1, Lcom/unionpay/sdk/w$e;->r:J

    invoke-static {v4, v5}, Lcom/unionpay/sdk/z;->b(J)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->s:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->t:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, v1, Lcom/unionpay/sdk/w$e;->u:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    iget v3, v1, Lcom/unionpay/sdk/w$e;->v:I

    invoke-static {v3}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v3

    add-int/2addr v2, v3

    iget v3, v1, Lcom/unionpay/sdk/w$e;->w:I

    invoke-static {v3}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v3

    add-int/2addr v2, v3

    iget-object v1, v1, Lcom/unionpay/sdk/w$e;->x:Ljava/lang/String;

    invoke-static {v1}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v1, v2

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x3

    add-int/lit8 v1, v0, 0x0

    const/4 v0, 0x0

    invoke-static {}, Lcom/unionpay/sdk/ac;->e()Z

    move-result v2

    if-eqz v2, :cond_d

    sget-boolean v0, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Prepare init Device profile"

    aput-object v3, v0, v2

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x1

    new-instance v2, Lcom/unionpay/sdk/w$i;

    invoke-direct {v2}, Lcom/unionpay/sdk/w$i;-><init>()V

    const/4 v3, 0x1

    iput v3, v2, Lcom/unionpay/sdk/w$i;->a:I

    invoke-static {}, Lcom/unionpay/sdk/ac;->a()Lcom/unionpay/sdk/w$g;

    move-result-object v3

    iput-object v3, v2, Lcom/unionpay/sdk/w$i;->c:Lcom/unionpay/sdk/w$g;

    iget-object v3, v6, Lcom/unionpay/sdk/w$f;->e:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget v3, v2, Lcom/unionpay/sdk/w$i;->a:I

    invoke-static {v3}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v3

    iget-object v2, v2, Lcom/unionpay/sdk/w$i;->c:Lcom/unionpay/sdk/w$g;

    const/16 v4, 0x1d

    invoke-static {v4}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v4

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->a:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->b:I

    invoke-static {v5}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->c:F

    add-int/lit8 v4, v4, 0x5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->d:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->e:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->f:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->g:I

    invoke-static {v5}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->h:I

    invoke-static {v5}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->i:I

    invoke-static {v5}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->j:I

    invoke-static {v5}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->k:I

    invoke-static {v5}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->l:I

    invoke-static {v5}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->m:I

    invoke-static {v5}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->n:F

    add-int/lit8 v4, v4, 0x5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->o:F

    add-int/lit8 v4, v4, 0x5

    iget v5, v2, Lcom/unionpay/sdk/w$g;->p:I

    invoke-static {v5}, Lcom/unionpay/sdk/z;->c(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->q:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->r:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->s:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->t:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->u:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->v:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->w:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-boolean v5, v2, Lcom/unionpay/sdk/w$g;->x:Z

    add-int/lit8 v4, v4, 0x1

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->y:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->z:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->A:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, v2, Lcom/unionpay/sdk/w$g;->B:Ljava/lang/String;

    invoke-static {v5}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v2, v2, Lcom/unionpay/sdk/w$g;->C:Ljava/lang/String;

    invoke-static {v2}, Lcom/unionpay/sdk/z;->b(Ljava/lang/String;)I

    move-result v2

    add-int/2addr v2, v4

    add-int/2addr v2, v3

    add-int/2addr v1, v2

    move v2, v0

    move v0, v1

    :goto_0
    invoke-virtual {p0}, Lcom/unionpay/sdk/bg;->b()V

    const-string v1, "error_report"

    invoke-virtual {p0, v1}, Lcom/unionpay/sdk/bg;->g(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, v6, Lcom/unionpay/sdk/w$f;->h:J

    invoke-virtual {p0}, Lcom/unionpay/sdk/bg;->d()Ljava/util/List;

    move-result-object v3

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v4, v0

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/sdk/w$j;

    add-int/lit8 v3, v1, 0x1

    sget-boolean v1, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v9, "session"

    aput-object v9, v1, v5

    const/4 v5, 0x1

    invoke-virtual {v0}, Lcom/unionpay/sdk/w$j;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v1, v5

    invoke-static {v1}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    :cond_1
    iget-object v1, v0, Lcom/unionpay/sdk/w$j;->a:Ljava/lang/String;

    iget-wide v10, v6, Lcom/unionpay/sdk/w$f;->f:J

    invoke-virtual {p0, v1}, Lcom/unionpay/sdk/bg;->d(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/sdk/w$j;->e:Ljava/util/List;

    sget-boolean v1, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v1, :cond_2

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v9, "Count of Pages = "

    aput-object v9, v1, v5

    const/4 v5, 0x1

    iget-object v9, v0, Lcom/unionpay/sdk/w$j;->e:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v1, v5

    invoke-static {v1}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v9, "Pages: "

    aput-object v9, v1, v5

    const/4 v5, 0x1

    iget-object v9, v0, Lcom/unionpay/sdk/w$j;->e:Ljava/util/List;

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v1, v5

    invoke-static {v1}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    :cond_2
    iget-object v1, v0, Lcom/unionpay/sdk/w$j;->a:Ljava/lang/String;

    iget-wide v10, v6, Lcom/unionpay/sdk/w$f;->g:J

    invoke-virtual {p0, v1}, Lcom/unionpay/sdk/bg;->f(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/sdk/w$j;->f:Ljava/util/List;

    sget-boolean v1, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v1, :cond_3

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v9, "Count of Events = "

    aput-object v9, v1, v5

    const/4 v5, 0x1

    iget-object v9, v0, Lcom/unionpay/sdk/w$j;->f:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v1, v5

    invoke-static {v1}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v9, "Events: "

    aput-object v9, v1, v5

    const/4 v5, 0x1

    iget-object v9, v0, Lcom/unionpay/sdk/w$j;->f:Ljava/util/List;

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v1, v5

    invoke-static {v1}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    :cond_3
    const/4 v5, 0x0

    iget-object v1, v0, Lcom/unionpay/sdk/w$j;->f:Ljava/util/List;

    if-eqz v1, :cond_5

    iget-object v1, v0, Lcom/unionpay/sdk/w$j;->f:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unionpay/sdk/w$b;

    iget-object v1, v1, Lcom/unionpay/sdk/w$b;->a:Ljava/lang/String;

    const-string v10, "__"

    invoke-virtual {v1, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const/4 v1, 0x1

    move v5, v1

    :cond_5
    new-instance v9, Lcom/unionpay/sdk/w$i;

    invoke-direct {v9}, Lcom/unionpay/sdk/w$i;-><init>()V

    const/4 v1, 0x2

    iput v1, v9, Lcom/unionpay/sdk/w$i;->a:I

    iput-object v0, v9, Lcom/unionpay/sdk/w$i;->b:Lcom/unionpay/sdk/w$j;

    invoke-virtual {v0}, Lcom/unionpay/sdk/w$j;->a()I

    move-result v1

    add-int v10, v1, v4

    const/16 v11, 0x5000

    if-le v10, v11, :cond_6

    const/4 v10, 0x1

    if-ne v3, v10, :cond_8

    :cond_6
    add-int/2addr v1, v4

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    sget-wide v12, Lcom/unionpay/sdk/d;->f:J

    sub-long/2addr v10, v12

    const-wide/32 v12, 0x6ddd00

    cmp-long v4, v10, v12

    if-gez v4, :cond_7

    iget v4, v0, Lcom/unionpay/sdk/w$j;->c:I

    const/4 v10, 0x2

    if-ne v4, v10, :cond_7

    iget-object v4, v0, Lcom/unionpay/sdk/w$j;->e:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_7

    iget-object v0, v0, Lcom/unionpay/sdk/w$j;->f:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_c

    if-nez v5, :cond_7

    sget-boolean v0, Lcom/unionpay/sdk/ag;->c:Z

    if-eqz v0, :cond_c

    :cond_7
    iget-object v0, v6, Lcom/unionpay/sdk/w$f;->e:Ljava/util/List;

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v4, v1

    move v1, v3

    goto/16 :goto_1

    :cond_8
    sget-boolean v0, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "************ "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Session*****************"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v1

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    :cond_9
    invoke-virtual {p0, v7}, Lcom/unionpay/sdk/bg;->a(Ljava/util/List;)J

    move-result-wide v0

    iput-wide v0, v6, Lcom/unionpay/sdk/w$f;->f:J

    invoke-virtual {p0, v7}, Lcom/unionpay/sdk/bg;->b(Ljava/util/List;)J

    move-result-wide v0

    iput-wide v0, v6, Lcom/unionpay/sdk/w$f;->g:J

    iget-wide v0, v6, Lcom/unionpay/sdk/w$f;->h:J

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-lez v0, :cond_a

    iget-wide v0, v6, Lcom/unionpay/sdk/w$f;->h:J

    invoke-virtual {p0, v0, v1}, Lcom/unionpay/sdk/bg;->d(J)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/sdk/w$i;

    iget-object v3, v6, Lcom/unionpay/sdk/w$f;->e:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_a
    invoke-virtual {p0}, Lcom/unionpay/sdk/bg;->c()V

    if-nez v2, :cond_b

    iget-object v0, v6, Lcom/unionpay/sdk/w$f;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_b

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_b
    move-object v0, v6

    goto :goto_3

    :cond_c
    move v4, v1

    move v1, v3

    goto/16 :goto_1

    :cond_d
    move v2, v0

    move v0, v1

    goto/16 :goto_0
.end method

.method private static a()Lcom/unionpay/sdk/w$g;
    .locals 8

    const/4 v7, 0x1

    const/4 v6, 0x0

    sget-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    new-instance v2, Lcom/unionpay/sdk/w$g;

    invoke-direct {v2}, Lcom/unionpay/sdk/w$g;-><init>()V

    invoke-static {}, Lcom/unionpay/sdk/h;->k()[Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    :try_start_0
    aget-object v3, v0, v3

    iput-object v3, v2, Lcom/unionpay/sdk/w$g;->a:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v3, 0x1

    :try_start_1
    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, v2, Lcom/unionpay/sdk/w$g;->b:I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    const/4 v3, 0x2

    :try_start_2
    aget-object v3, v0, v3

    iput-object v3, v2, Lcom/unionpay/sdk/w$g;->d:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/4 v3, 0x3

    :try_start_3
    aget-object v0, v0, v3

    invoke-static {v0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, v2, Lcom/unionpay/sdk/w$g;->c:F
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :goto_1
    :try_start_4
    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/h;->a(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/unionpay/sdk/w$g;->C:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :cond_0
    :goto_2
    invoke-static {}, Lcom/unionpay/sdk/h;->m()[I

    move-result-object v0

    aget v3, v0, v6

    iput v3, v2, Lcom/unionpay/sdk/w$g;->g:I

    aget v0, v0, v7

    iput v0, v2, Lcom/unionpay/sdk/w$g;->h:I

    :try_start_5
    invoke-static {}, Lcom/unionpay/sdk/h;->n()[I

    move-result-object v0

    const/4 v3, 0x0

    aget v3, v0, v3

    iput v3, v2, Lcom/unionpay/sdk/w$g;->i:I

    const/4 v3, 0x1

    aget v3, v0, v3

    iput v3, v2, Lcom/unionpay/sdk/w$g;->j:I

    const/4 v3, 0x2

    aget v3, v0, v3

    iput v3, v2, Lcom/unionpay/sdk/w$g;->k:I

    const/4 v3, 0x3

    aget v0, v0, v3

    iput v0, v2, Lcom/unionpay/sdk/w$g;->l:I
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1

    :goto_3
    invoke-static {}, Lcom/unionpay/sdk/h;->o()I

    move-result v0

    iput v0, v2, Lcom/unionpay/sdk/w$g;->m:I

    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    const-string v0, "window"

    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    iget v4, v3, Landroid/util/DisplayMetrics;->xdpi:F

    div-float/2addr v0, v4

    iput v0, v2, Lcom/unionpay/sdk/w$g;->n:F

    iget v0, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v0, v0

    iget v4, v3, Landroid/util/DisplayMetrics;->ydpi:F

    div-float/2addr v0, v4

    iput v0, v2, Lcom/unionpay/sdk/w$g;->o:F

    iget v0, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    iput v0, v2, Lcom/unionpay/sdk/w$g;->p:I

    sget-object v0, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    iput-object v0, v2, Lcom/unionpay/sdk/w$g;->q:Ljava/lang/String;

    const-string v0, "unknown"

    iput-object v0, v2, Lcom/unionpay/sdk/w$g;->r:Ljava/lang/String;

    :try_start_6
    const-string v0, "android.os.SystemProperties"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    const-string v4, "get"

    invoke-virtual {v0, v4, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "gsm.version.baseband"

    aput-object v5, v3, v4

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, v2, Lcom/unionpay/sdk/w$g;->r:Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    :cond_1
    :goto_4
    invoke-static {v1}, Lcom/unionpay/sdk/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    iput-object v0, v2, Lcom/unionpay/sdk/w$g;->s:Ljava/lang/String;

    :cond_2
    invoke-static {v1}, Lcom/unionpay/sdk/g;->f(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    iput-object v0, v2, Lcom/unionpay/sdk/w$g;->t:Ljava/lang/String;

    :cond_3
    :try_start_7
    invoke-static {v1}, Lcom/unionpay/sdk/g;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/unionpay/sdk/w$g;->y:Ljava/lang/String;

    invoke-static {v1}, Lcom/unionpay/sdk/g;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/unionpay/sdk/w$g;->A:Ljava/lang/String;

    invoke-static {v1}, Lcom/unionpay/sdk/g;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/unionpay/sdk/w$g;->B:Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    :cond_4
    :goto_5
    return-object v2

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto/16 :goto_2

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto/16 :goto_3

    :catch_2
    move-exception v0

    sget-boolean v0, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v0, :cond_1

    new-array v0, v7, [Ljava/lang/String;

    const-string v3, "fecth base band failed!"

    aput-object v3, v0, v6

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    goto :goto_4

    :catch_3
    move-exception v0

    sget-boolean v1, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v1, :cond_4

    new-array v1, v7, [Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v6

    invoke-static {v1}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    goto :goto_5

    :catch_4
    move-exception v0

    goto/16 :goto_1

    :catch_5
    move-exception v3

    goto/16 :goto_0
.end method

.method static a(Lcom/unionpay/sdk/w$f;Lcom/unionpay/sdk/bg;)V
    .locals 6

    invoke-virtual {p1}, Lcom/unionpay/sdk/bg;->b()V

    iget-object v0, p0, Lcom/unionpay/sdk/w$f;->e:Ljava/util/List;

    iget-wide v2, p0, Lcom/unionpay/sdk/w$f;->f:J

    invoke-virtual {p1, v2, v3}, Lcom/unionpay/sdk/bg;->a(J)J

    iget-wide v2, p0, Lcom/unionpay/sdk/w$f;->g:J

    invoke-virtual {p1, v2, v3}, Lcom/unionpay/sdk/bg;->b(J)J

    iget-wide v2, p0, Lcom/unionpay/sdk/w$f;->h:J

    invoke-virtual {p1, v2, v3}, Lcom/unionpay/sdk/bg;->c(J)J

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/sdk/w$i;

    iget v2, v0, Lcom/unionpay/sdk/w$i;->a:I

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v2, "UPpref_longtime"

    const-string v3, "UPpref.profile.key"

    const-wide/16 v4, 0x0

    invoke-static {v0, v2, v3, v4, v5}, Lcom/unionpay/sdk/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V

    goto :goto_0

    :pswitch_1
    iget-object v0, v0, Lcom/unionpay/sdk/w$i;->b:Lcom/unionpay/sdk/w$j;

    iget v2, v0, Lcom/unionpay/sdk/w$j;->c:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    iget-object v0, v0, Lcom/unionpay/sdk/w$j;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/bg;->a(Ljava/lang/String;)J

    goto :goto_0

    :cond_1
    iget v2, v0, Lcom/unionpay/sdk/w$j;->c:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    iget-object v2, v0, Lcom/unionpay/sdk/w$j;->a:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/unionpay/sdk/bg;->b(Ljava/lang/String;)J

    iget-object v2, v0, Lcom/unionpay/sdk/w$j;->a:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/unionpay/sdk/bg;->c(Ljava/lang/String;)J

    iget-object v0, v0, Lcom/unionpay/sdk/w$j;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/bg;->e(Ljava/lang/String;)J

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/unionpay/sdk/bg;->c()V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static declared-synchronized b()Lcom/unionpay/sdk/w$d;
    .locals 4

    const-class v1, Lcom/unionpay/sdk/ac;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    return-object v0

    :cond_0
    :try_start_1
    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/unionpay/sdk/w$d;

    invoke-direct {v0}, Lcom/unionpay/sdk/w$d;-><init>()V

    sput-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    sget-object v2, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$d;->a:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    invoke-static {}, Lcom/unionpay/sdk/o;->h()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$d;->b:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    invoke-static {}, Lcom/unionpay/sdk/o;->g()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$d;->c:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    invoke-static {}, Lcom/unionpay/sdk/o;->d()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/unionpay/sdk/w$d;->d:J

    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    const-string v2, "Android+UP+V2.2.8"

    iput-object v2, v0, Lcom/unionpay/sdk/w$d;->e:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    sget-object v2, Lcom/unionpay/sdk/d;->i:Ljava/lang/String;

    iput-object v2, v0, Lcom/unionpay/sdk/w$d;->f:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    invoke-static {}, Lcom/unionpay/sdk/a;->a()Lcom/unionpay/sdk/a;

    move-result-object v2

    sget-object v3, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/unionpay/sdk/a;->d(Landroid/content/Context;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/unionpay/sdk/w$d;->h:J

    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;

    invoke-static {}, Lcom/unionpay/sdk/a;->a()Lcom/unionpay/sdk/a;

    move-result-object v2

    sget-object v3, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/unionpay/sdk/a;->e(Landroid/content/Context;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/unionpay/sdk/w$d;->i:J

    sget-object v0, Lcom/unionpay/sdk/ac;->a:Lcom/unionpay/sdk/w$d;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static declared-synchronized c()Lcom/unionpay/sdk/w$e;
    .locals 4

    const-class v1, Lcom/unionpay/sdk/ac;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    if-nez v0, :cond_1

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    monitor-exit v1

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Lcom/unionpay/sdk/w$e;

    invoke-direct {v0}, Lcom/unionpay/sdk/w$e;-><init>()V

    sput-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v2, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v2}, Lcom/unionpay/sdk/g;->h(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$e;->s:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    invoke-static {}, Lcom/unionpay/sdk/h;->f()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$e;->a:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    invoke-static {}, Lcom/unionpay/sdk/h;->g()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$e;->b:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v2, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    iput-object v2, v0, Lcom/unionpay/sdk/w$e;->d:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v2, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v2}, Lcom/unionpay/sdk/h;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$e;->e:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    invoke-static {}, Lcom/unionpay/sdk/h;->j()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$e;->f:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v2, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v2}, Lcom/unionpay/sdk/j;->p(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$e;->g:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    invoke-static {}, Lcom/unionpay/sdk/h;->i()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$e;->h:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v2

    div-int/lit16 v2, v2, 0x3e8

    div-int/lit8 v2, v2, 0x3c

    div-int/lit8 v2, v2, 0x3c

    iput v2, v0, Lcom/unionpay/sdk/w$e;->i:I

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Android+"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/unionpay/sdk/w$e;->j:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/h;->a(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_1

    sget-object v2, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/unionpay/sdk/w$e;->x:Ljava/lang/String;

    :cond_1
    invoke-static {}, Lcom/unionpay/sdk/ac;->d()V

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static d()V
    .locals 8

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/q;->a(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/Location;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/location/Location;->getTime()J

    move-result-wide v4

    invoke-virtual {v1}, Landroid/location/Location;->getTime()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-lez v3, :cond_7

    :cond_0
    :goto_1
    move-object v1, v0

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/unionpay/sdk/w$h;

    invoke-direct {v0}, Lcom/unionpay/sdk/w$h;-><init>()V

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    iput-wide v2, v0, Lcom/unionpay/sdk/w$h;->b:D

    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    iput-wide v2, v0, Lcom/unionpay/sdk/w$h;->a:D

    :cond_2
    sget-object v1, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    iput-object v0, v1, Lcom/unionpay/sdk/w$e;->c:Lcom/unionpay/sdk/w$h;

    sget-object v1, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/j;->g(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    :goto_2
    iput v0, v1, Lcom/unionpay/sdk/w$e;->k:I

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/unionpay/sdk/j;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/sdk/w$e;->l:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/unionpay/sdk/j;->k(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/sdk/w$e;->o:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/unionpay/sdk/j;->l(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/sdk/w$e;->n:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/unionpay/sdk/q;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/sdk/w$e;->p:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    sget-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/unionpay/sdk/j;->r(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/unionpay/sdk/w$e;->t:Ljava/lang/String;

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/q;->d(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {}, Lcom/unionpay/sdk/ac;->e()Z

    move-result v1

    if-nez v1, :cond_3

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    const/16 v2, 0x5a

    if-le v1, v2, :cond_4

    :cond_3
    sget-object v1, Lcom/unionpay/sdk/ac;->b:Lcom/unionpay/sdk/w$e;

    if-nez v0, :cond_6

    const-string v0, ""

    :goto_3
    iput-object v0, v1, Lcom/unionpay/sdk/w$e;->u:Ljava/lang/String;

    :cond_4
    return-void

    :cond_5
    const/4 v0, 0x1

    goto :goto_2

    :cond_6
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_7
    move-object v0, v1

    goto/16 :goto_1
.end method

.method private static declared-synchronized e()Z
    .locals 9

    const/4 v0, 0x1

    const/4 v1, 0x0

    const-class v2, Lcom/unionpay/sdk/ac;

    monitor-enter v2

    :try_start_0
    sget-object v3, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v4, "UPpref_longtime"

    const-string v5, "UPpref.profile.key"

    const-wide/16 v6, 0x1

    invoke-static {v3, v4, v5, v6, v7}, Lcom/unionpay/sdk/l;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v4

    sget-boolean v3, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v6, 0x0

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "need Post Init:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v6

    invoke-static {v3}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-eqz v3, :cond_1

    :goto_0
    monitor-exit v2

    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method
