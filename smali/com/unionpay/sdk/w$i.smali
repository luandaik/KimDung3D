.class final Lcom/unionpay/sdk/w$i;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/sdk/x;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "i"
.end annotation


# instance fields
.field a:I

.field b:Lcom/unionpay/sdk/w$j;

.field c:Lcom/unionpay/sdk/w$g;

.field d:Lcom/unionpay/sdk/w$c;


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/unionpay/sdk/w$i;->a:I

    return-void
.end method


# virtual methods
.method public final messagePack(Lcom/unionpay/sdk/z;)V
    .locals 2

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->b(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$i;->a:I

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(I)Lcom/unionpay/sdk/z;

    iget v0, p0, Lcom/unionpay/sdk/w$i;->a:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "unknown TMessageType"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v0, p0, Lcom/unionpay/sdk/w$i;->c:Lcom/unionpay/sdk/w$g;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Lcom/unionpay/sdk/x;)Lcom/unionpay/sdk/z;

    :goto_0
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/unionpay/sdk/w$i;->b:Lcom/unionpay/sdk/w$j;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Lcom/unionpay/sdk/x;)Lcom/unionpay/sdk/z;

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/unionpay/sdk/w$i;->d:Lcom/unionpay/sdk/w$c;

    invoke-virtual {p1, v0}, Lcom/unionpay/sdk/z;->a(Lcom/unionpay/sdk/x;)Lcom/unionpay/sdk/z;

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
