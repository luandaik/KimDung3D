.class public Lcom/unionpay/sdk/e$d;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 2

    const/16 v0, 0x258

    const-string v1, ""

    invoke-direct {p0, v0, v1}, Lcom/unionpay/sdk/e$d;-><init>(ILjava/lang/String;)V

    return-void
.end method

.method constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/unionpay/sdk/e$d;->a:I

    iput-object p2, p0, Lcom/unionpay/sdk/e$d;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()I
    .locals 1

    iget v0, p0, Lcom/unionpay/sdk/e$d;->a:I

    return v0
.end method

.method public b()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/sdk/e$d;->b:Ljava/lang/String;

    return-object v0
.end method
