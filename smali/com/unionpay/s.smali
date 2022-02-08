.class final Lcom/unionpay/s;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/ab;


# instance fields
.field final synthetic a:Lcom/unionpay/UPPayWapActivity;


# direct methods
.method constructor <init>(Lcom/unionpay/UPPayWapActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/s;->a:Lcom/unionpay/UPPayWapActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lcom/unionpay/ac;)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/s;->a:Lcom/unionpay/UPPayWapActivity;

    invoke-static {v0, p1}, Lcom/unionpay/utils/UPUtils;->b(Landroid/content/Context;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/unionpay/s;->a:Lcom/unionpay/UPPayWapActivity;

    const-string v0, "0"

    const-string v1, "success"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/unionpay/UPPayWapActivity;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Lcom/unionpay/ac;->a(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
