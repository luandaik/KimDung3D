.class final Lcom/unionpay/sdk/ao;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/sdk/ao;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    invoke-static {}, Lcom/unionpay/sdk/ag;->c()Ljava/nio/channels/FileChannel;

    move-result-object v0

    sput-object v0, Lcom/unionpay/sdk/d;->e:Ljava/nio/channels/FileChannel;

    iget-object v0, p0, Lcom/unionpay/sdk/ao;->a:Landroid/content/Context;

    invoke-static {}, Lcom/unionpay/sdk/ag;->f()V

    invoke-static {}, Lcom/unionpay/sdk/ag;->b()V

    return-void
.end method
