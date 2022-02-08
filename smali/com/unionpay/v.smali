.class final Lcom/unionpay/v;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/ab;


# instance fields
.field final synthetic a:Lcom/unionpay/UPPayWapActivity;


# direct methods
.method constructor <init>(Lcom/unionpay/UPPayWapActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/v;->a:Lcom/unionpay/UPPayWapActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lcom/unionpay/ac;)V
    .locals 10

    const/4 v8, 0x0

    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, ""

    const-string v2, ""

    const-string v3, ""

    const-string v4, ""

    const-string v5, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    const-string v0, "url"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    const-string v1, "app"

    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :try_start_3
    const-string v2, "title"

    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    :try_start_4
    const-string v3, "desp"

    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    :try_start_5
    const-string v4, "md5"

    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v2

    move-object v2, v1

    move-object v1, v0

    :goto_0
    :try_start_6
    iget-object v0, p0, Lcom/unionpay/v;->a:Lcom/unionpay/UPPayWapActivity;

    invoke-static/range {v0 .. v5}, Lcom/unionpay/UPPayAssistEx;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_1
    return-void

    :catch_0
    move-exception v0

    move-object v9, v4

    move-object v4, v1

    move-object v1, v2

    move-object v2, v3

    move-object v3, v9

    :goto_2
    if-eqz p2, :cond_1

    iget-object v6, p0, Lcom/unionpay/v;->a:Lcom/unionpay/UPPayWapActivity;

    const-string v6, "1"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v7, 0x0

    invoke-static {v6, v0, v7}, Lcom/unionpay/UPPayWapActivity;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Lcom/unionpay/ac;->a(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    :cond_1
    move-object v9, v3

    move-object v3, v2

    move-object v2, v1

    move-object v1, v4

    move-object v4, v9

    goto :goto_0

    :catch_1
    move-exception v0

    if-eqz p2, :cond_0

    iget-object v1, p0, Lcom/unionpay/v;->a:Lcom/unionpay/UPPayWapActivity;

    const-string v1, "1"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v8}, Lcom/unionpay/UPPayWapActivity;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Lcom/unionpay/ac;->a(Ljava/lang/String;)V

    goto :goto_1

    :catch_2
    move-exception v1

    move-object v9, v1

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v0

    move-object v0, v9

    goto :goto_2

    :catch_3
    move-exception v2

    move-object v9, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v0

    move-object v0, v9

    goto :goto_2

    :catch_4
    move-exception v3

    move-object v9, v3

    move-object v3, v4

    move-object v4, v0

    move-object v0, v9

    goto :goto_2

    :catch_5
    move-exception v4

    move-object v9, v4

    move-object v4, v0

    move-object v0, v9

    goto :goto_2
.end method
