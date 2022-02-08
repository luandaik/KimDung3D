.class public final Lcom/unionpay/mobile/android/utils/n;
.super Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;

# interfaces
.implements Lcom/unionpay/mobile/android/fully/a;


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/nocard/utils/UPPayEngine;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/unionpay/mobile/android/utils/n;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "reqtm"

    invoke-static {}, Lcom/unionpay/mobile/android/utils/n;->h()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    :goto_0
    const-string v0, "uppay"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "post message = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, p1}, Lcom/unionpay/mobile/android/utils/n;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/utils/n;->d()Lcom/unionpay/mobile/android/net/d;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/net/d;->a(Ljava/lang/String;)V

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "sid"

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/utils/n;->f()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/utils/n;->d()Lcom/unionpay/mobile/android/net/d;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/unionpay/mobile/android/net/d;->a(Ljava/util/HashMap;)V

    new-instance v0, Lcom/unionpay/mobile/android/net/c;

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/utils/n;->d()Lcom/unionpay/mobile/android/net/d;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/utils/n;->a:Landroid/content/Context;

    invoke-direct {v0, v1, v2}, Lcom/unionpay/mobile/android/net/c;-><init>(Lcom/unionpay/mobile/android/net/d;Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/net/c;->a()I

    move-result v1

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/net/c;->c()Ljava/lang/String;

    move-result-object v0

    if-nez v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/utils/n;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "uppay"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ response msg ] "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/utils/n;->e()Landroid/os/Handler;

    move-result-object v0

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput v1, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/utils/n;->e()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    const/4 v0, 0x0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0
.end method
