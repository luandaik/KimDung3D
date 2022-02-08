.class final Lcom/unionpay/sdk/as;
.super Ljava/lang/ThreadLocal;


# instance fields
.field final synthetic a:Lcom/unionpay/sdk/ar;


# direct methods
.method constructor <init>(Lcom/unionpay/sdk/ar;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/sdk/as;->a:Lcom/unionpay/sdk/ar;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected final synthetic initialValue()Ljava/lang/Object;
    .locals 1

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    return-object v0
.end method
