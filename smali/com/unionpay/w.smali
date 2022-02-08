.class final Lcom/unionpay/w;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/unionpay/ab;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/unionpay/ac;

.field final synthetic d:Lcom/unionpay/WebViewJavascriptBridge;


# direct methods
.method constructor <init>(Lcom/unionpay/WebViewJavascriptBridge;Lcom/unionpay/ab;Ljava/lang/String;Lcom/unionpay/ac;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/w;->d:Lcom/unionpay/WebViewJavascriptBridge;

    iput-object p2, p0, Lcom/unionpay/w;->a:Lcom/unionpay/ab;

    iput-object p3, p0, Lcom/unionpay/w;->b:Ljava/lang/String;

    iput-object p4, p0, Lcom/unionpay/w;->c:Lcom/unionpay/ac;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/w;->a:Lcom/unionpay/ab;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/w;->a:Lcom/unionpay/ab;

    iget-object v1, p0, Lcom/unionpay/w;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/w;->c:Lcom/unionpay/ac;

    invoke-interface {v0, v1, v2}, Lcom/unionpay/ab;->a(Ljava/lang/String;Lcom/unionpay/ac;)V

    :cond_0
    return-void
.end method
