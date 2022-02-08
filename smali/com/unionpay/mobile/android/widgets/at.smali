.class public final Lcom/unionpay/mobile/android/widgets/at;
.super Lcom/unionpay/mobile/android/widgets/aa;


# instance fields
.field private n:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/unionpay/mobile/android/widgets/aa;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/unionpay/mobile/android/widgets/at;->n:I

    const-string v0, "maxLength"

    invoke-static {p3, v0}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    invoke-static {v0}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/unionpay/mobile/android/widgets/at;->n:I

    :goto_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/at;->b:Lcom/unionpay/mobile/android/widgets/u;

    new-instance v1, Landroid/text/InputFilter$LengthFilter;

    iget v2, p0, Lcom/unionpay/mobile/android/widgets/at;->n:I

    invoke-direct {v1, v2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(Landroid/text/InputFilter;)V

    return-void

    :cond_0
    const/16 v0, 0x17

    iput v0, p0, Lcom/unionpay/mobile/android/widgets/at;->n:I

    goto :goto_0
.end method


# virtual methods
.method public final b()Z
    .locals 3

    const/4 v0, 0x1

    iget-boolean v1, p0, Lcom/unionpay/mobile/android/widgets/at;->h:Z

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v1, p0, Lcom/unionpay/mobile/android/widgets/at;->n:I

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/at;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    const-string v0, "_input_text"

    return-object v0
.end method
