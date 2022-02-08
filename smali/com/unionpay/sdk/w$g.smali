.class final Lcom/unionpay/sdk/w$g;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/sdk/x;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "g"
.end annotation


# instance fields
.field A:Ljava/lang/String;

.field B:Ljava/lang/String;

.field C:Ljava/lang/String;

.field a:Ljava/lang/String;

.field b:I

.field c:F

.field d:Ljava/lang/String;

.field e:Ljava/lang/String;

.field f:Ljava/lang/String;

.field g:I

.field h:I

.field i:I

.field j:I

.field k:I

.field l:I

.field m:I

.field n:F

.field o:F

.field p:I

.field q:Ljava/lang/String;

.field r:Ljava/lang/String;

.field s:Ljava/lang/String;

.field t:Ljava/lang/String;

.field u:Ljava/lang/String;

.field v:Ljava/lang/String;

.field w:Ljava/lang/String;

.field x:Z

.field y:Ljava/lang/String;

.field z:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->a:Ljava/lang/String;

    iput v1, p0, Lcom/unionpay/sdk/w$g;->b:I

    iput v2, p0, Lcom/unionpay/sdk/w$g;->c:F

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->d:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->e:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->f:Ljava/lang/String;

    iput v1, p0, Lcom/unionpay/sdk/w$g;->g:I

    iput v1, p0, Lcom/unionpay/sdk/w$g;->h:I

    iput v1, p0, Lcom/unionpay/sdk/w$g;->i:I

    iput v1, p0, Lcom/unionpay/sdk/w$g;->j:I

    iput v1, p0, Lcom/unionpay/sdk/w$g;->k:I

    iput v1, p0, Lcom/unionpay/sdk/w$g;->l:I

    iput v1, p0, Lcom/unionpay/sdk/w$g;->m:I

    iput v2, p0, Lcom/unionpay/sdk/w$g;->n:F

    iput v2, p0, Lcom/unionpay/sdk/w$g;->o:F

    iput v1, p0, Lcom/unionpay/sdk/w$g;->p:I

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->q:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->r:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->s:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->t:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->u:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->v:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->w:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/unionpay/sdk/w$g;->x:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->y:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->z:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->A:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->B:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$g;->C:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final messagePack(Lcom/unionpay/sdk/z;)V
    .locals 1

    const/16 v0, 0x1d

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->b(I)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->b:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->c:F

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(F)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->d:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->e:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->f:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->g:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->h:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->i:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->j:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->k:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->l:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->m:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->n:F

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(F)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->o:F

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(F)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$g;->p:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->q:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->r:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->s:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->t:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->u:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->v:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->w:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-boolean v0, p0, Lcom/unionpay/sdk/w$g;->x:Z

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Z)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->y:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->z:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->A:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->B:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$g;->C:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    return-void
.end method
