.class public final Lcom/unionpay/mobile/android/widgets/ao;
.super Lcom/unionpay/mobile/android/widgets/aa;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/unionpay/mobile/android/widgets/aa;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/ao;->b:Lcom/unionpay/mobile/android/widgets/u;

    const/16 v1, 0x81

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(I)V

    return-void
.end method


# virtual methods
.method public final b()Z
    .locals 1

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/ao;->a()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    const-string v0, "login_pwd"

    return-object v0
.end method
