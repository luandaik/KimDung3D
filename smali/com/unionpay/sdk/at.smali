.class final Lcom/unionpay/sdk/at;
.super Ljava/lang/ThreadLocal;


# instance fields
.field final synthetic a:Lcom/unionpay/sdk/ar;


# direct methods
.method constructor <init>(Lcom/unionpay/sdk/ar;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/sdk/at;->a:Lcom/unionpay/sdk/ar;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected final synthetic initialValue()Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
