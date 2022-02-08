.class final Lcom/unionpay/sdk/ai;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/util/Map;

.field final synthetic d:Landroid/content/Context;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/sdk/ai;->a:Ljava/lang/String;

    iput-object p2, p0, Lcom/unionpay/sdk/ai;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/unionpay/sdk/ai;->c:Ljava/util/Map;

    iput-object p4, p0, Lcom/unionpay/sdk/ai;->d:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    :try_start_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v0, "onEvent being called! eventId: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v0, p0, Lcom/unionpay/sdk/ai;->a:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, ", eventLabel: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v0, p0, Lcom/unionpay/sdk/ai;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, ", eventMap: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v0, p0, Lcom/unionpay/sdk/ai;->c:Ljava/util/Map;

    if-nez v0, :cond_1

    const-string v0, "null"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    new-instance v1, Lcom/unionpay/sdk/ag$a;

    invoke-direct {v1}, Lcom/unionpay/sdk/ag$a;-><init>()V

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "context"

    iget-object v3, p0, Lcom/unionpay/sdk/ai;->d:Landroid/content/Context;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "apiType"

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "eventId"

    iget-object v3, p0, Lcom/unionpay/sdk/ai;->a:Ljava/lang/String;

    invoke-static {v3}, Lcom/unionpay/sdk/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v3, "eventLabel"

    iget-object v0, p0, Lcom/unionpay/sdk/ai;->b:Ljava/lang/String;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/sdk/ai;->b:Ljava/lang/String;

    :goto_1
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "map"

    iget-object v3, p0, Lcom/unionpay/sdk/ai;->c:Ljava/util/Map;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "occurTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/unionpay/sdk/bk;->a()Landroid/os/Handler;

    move-result-object v0

    const/16 v2, 0x66

    invoke-static {v0, v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    :goto_2
    return-void

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "mapSize: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/unionpay/sdk/ai;->c:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/unionpay/sdk/ai;->b:Ljava/lang/String;

    invoke-static {v0}, Lcom/unionpay/sdk/r;->a(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    :catch_0
    move-exception v0

    sget-boolean v1, Lcom/unionpay/sdk/UPAgent;->LOG_ON:Z

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2
.end method
