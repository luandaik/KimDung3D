.class final Lcom/unionpay/mobile/android/pro/views/z;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/views/x;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/views/x;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/z;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 5

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    const-string v1, "errMsg"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/z;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pro/views/x;->d(Lcom/unionpay/mobile/android/pro/views/x;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const-string v1, "action"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "value"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/i;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/z;->a:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/x;->m(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v0

    iget-boolean v0, v0, Lcom/unionpay/mobile/android/model/b;->bq:Z

    if-eqz v0, :cond_1

    const-string v0, "10"

    :goto_1
    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/z;->a:Lcom/unionpay/mobile/android/pro/views/x;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ",\"carrier_tp\":"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v1, v0}, Lcom/unionpay/mobile/android/pro/views/x;->a(Lcom/unionpay/mobile/android/pro/views/x;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v0, "2"

    goto :goto_1
.end method
