.class final Lcom/unionpay/sdk/w$e;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/sdk/x;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "e"
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Lcom/unionpay/sdk/w$h;

.field d:Ljava/lang/String;

.field e:Ljava/lang/String;

.field f:Ljava/lang/String;

.field g:Ljava/lang/String;

.field h:Ljava/lang/String;

.field i:I

.field j:Ljava/lang/String;

.field k:I

.field l:Ljava/lang/String;

.field m:Z

.field n:Ljava/lang/String;

.field o:Ljava/lang/String;

.field p:Ljava/lang/String;

.field q:Ljava/lang/String;

.field r:J

.field s:Ljava/lang/String;

.field t:Ljava/lang/String;

.field u:Ljava/lang/String;

.field v:I

.field w:I

.field x:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->a:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->b:Ljava/lang/String;

    new-instance v0, Lcom/unionpay/sdk/w$h;

    invoke-direct {v0}, Lcom/unionpay/sdk/w$h;-><init>()V

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->c:Lcom/unionpay/sdk/w$h;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->d:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->e:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->f:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->g:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->h:Ljava/lang/String;

    const/16 v0, 0x8

    iput v0, p0, Lcom/unionpay/sdk/w$e;->i:I

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->j:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/unionpay/sdk/w$e;->k:I

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->l:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/sdk/w$e;->m:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->n:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->o:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->p:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->q:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/unionpay/sdk/w$e;->r:J

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->s:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->t:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->u:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$e;->x:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final messagePack(Lcom/unionpay/sdk/z;)V
    .locals 2

    const/16 v0, 0x18

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->b(I)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->c:Lcom/unionpay/sdk/w$h;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Lcom/unionpay/sdk/x;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->d:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->e:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->f:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->g:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->h:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$e;->i:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->j:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$e;->k:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->l:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-boolean v0, p0, Lcom/unionpay/sdk/w$e;->m:Z

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Z)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->n:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->o:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->p:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$e;->q:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-wide v0, p0, Lcom/unionpay/sdk/w$e;->r:J

    invoke-virtual {p1, v0, v1}, Lcom/unionpay/sdk/z;->a(J)Lcom/unionpay/sdk/z;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/sdk/w$e;->s:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/sdk/w$e;->t:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/sdk/w$e;->u:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    move-result-object v0

    iget v1, p0, Lcom/unionpay/sdk/w$e;->v:I

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    move-result-object v0

    iget v1, p0, Lcom/unionpay/sdk/w$e;->w:I

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/sdk/w$e;->x:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    return-void
.end method
