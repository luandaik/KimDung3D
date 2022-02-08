.class final Lcom/unionpay/sdk/w$d;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/sdk/x;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "d"
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Ljava/lang/String;

.field d:J

.field e:Ljava/lang/String;

.field f:Ljava/lang/String;

.field g:Z

.field h:J

.field i:J


# direct methods
.method constructor <init>()V
    .locals 4

    const-wide/16 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$d;->a:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$d;->b:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$d;->c:Ljava/lang/String;

    iput-wide v2, p0, Lcom/unionpay/sdk/w$d;->d:J

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$d;->e:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/sdk/w$d;->f:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/sdk/w$d;->g:Z

    iput-wide v2, p0, Lcom/unionpay/sdk/w$d;->h:J

    iput-wide v2, p0, Lcom/unionpay/sdk/w$d;->i:J

    return-void
.end method


# virtual methods
.method public final messagePack(Lcom/unionpay/sdk/z;)V
    .locals 2

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->b(I)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$d;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$d;->b:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$d;->c:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-wide v0, p0, Lcom/unionpay/sdk/w$d;->d:J

    invoke-virtual {p1, v0, v1}, Lcom/unionpay/sdk/z;->a(J)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$d;->e:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-object v0, p0, Lcom/unionpay/sdk/w$d;->f:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Ljava/lang/String;)Lcom/unionpay/sdk/z;

    iget-boolean v0, p0, Lcom/unionpay/sdk/w$d;->g:Z

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Z)Lcom/unionpay/sdk/z;

    iget-wide v0, p0, Lcom/unionpay/sdk/w$d;->h:J

    invoke-virtual {p1, v0, v1}, Lcom/unionpay/sdk/z;->a(J)Lcom/unionpay/sdk/z;

    iget-wide v0, p0, Lcom/unionpay/sdk/w$d;->i:J

    invoke-virtual {p1, v0, v1}, Lcom/unionpay/sdk/z;->a(J)Lcom/unionpay/sdk/z;

    return-void
.end method
