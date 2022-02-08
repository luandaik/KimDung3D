.class public final Lcom/unionpay/mobile/android/widgets/ae;
.super Lcom/unionpay/mobile/android/widgets/aa;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/unionpay/mobile/android/widgets/aa;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final b()Z
    .locals 2

    const/4 v0, 0x1

    iget-boolean v1, p0, Lcom/unionpay/mobile/android/widgets/ae;->h:Z

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/ae;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    const-string v0, "_input_name"

    return-object v0
.end method
