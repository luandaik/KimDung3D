.class public Lcom/snda/woa/u;
.super Ljava/lang/Object;


# instance fields
.field private a:Ljava/lang/String;

.field private b:J

.field private c:I

.field private d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JI)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/snda/woa/u;->d:Ljava/lang/String;

    iput-object p2, p0, Lcom/snda/woa/u;->a:Ljava/lang/String;

    iput-wide p3, p0, Lcom/snda/woa/u;->b:J

    iput p5, p0, Lcom/snda/woa/u;->c:I

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;J)Lcom/snda/woa/u;
    .locals 8

    new-instance v1, Lcom/snda/woa/u;

    const/4 v6, 0x3

    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/snda/woa/u;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    return-object v1
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;J)Lcom/snda/woa/u;
    .locals 8

    new-instance v1, Lcom/snda/woa/u;

    const/4 v6, 0x1

    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/snda/woa/u;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    return-object v1
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;J)Lcom/snda/woa/u;
    .locals 8

    new-instance v1, Lcom/snda/woa/u;

    const/4 v6, 0x2

    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/snda/woa/u;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    return-object v1
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/snda/woa/u;->d:Ljava/lang/String;

    return-object v0
.end method

.method public b()J
    .locals 2

    iget-wide v0, p0, Lcom/snda/woa/u;->b:J

    return-wide v0
.end method

.method public c()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/snda/woa/u;->a:Ljava/lang/String;

    return-object v0
.end method

.method public d()I
    .locals 1

    iget v0, p0, Lcom/snda/woa/u;->c:I

    return v0
.end method

.method public e()Z
    .locals 2

    const/4 v0, 0x1

    iget v1, p0, Lcom/snda/woa/u;->c:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public f()Z
    .locals 2

    iget v0, p0, Lcom/snda/woa/u;->c:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
