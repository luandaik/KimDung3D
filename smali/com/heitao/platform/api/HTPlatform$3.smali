.class Lcom/heitao/platform/api/HTPlatform$3;
.super Ljava/lang/Object;
.source "HTPlatform.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform;->doPay(Lcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/api/HTPlatform;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$3;->this$0:Lcom/heitao/platform/api/HTPlatform;

    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/api/HTPlatform$3;)Lcom/heitao/platform/api/HTPlatform;
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform$3;->this$0:Lcom/heitao/platform/api/HTPlatform;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 250
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v4

    iget-object v1, v4, Lcom/heitao/platform/common/HTPDataCenter;->mAppKey:Ljava/lang/String;

    .line 251
    .local v1, "pub_key":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 252
    .local v2, "time":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v5

    iget-object v5, v5, Lcom/heitao/platform/common/HTPDataCenter;->mAppKey:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/platform/common/HTPUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 254
    .local v3, "token":Ljava/lang/String;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 255
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "pub_key"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    const-string v4, "time"

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    const-string v4, "token"

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    new-instance v4, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v4}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    const-string v5, "http://pay.heitao.com/mpay/index"

    const/4 v6, 0x0

    new-instance v7, Lcom/heitao/platform/api/HTPlatform$3$1;

    invoke-direct {v7, p0}, Lcom/heitao/platform/api/HTPlatform$3$1;-><init>(Lcom/heitao/platform/api/HTPlatform$3;)V

    invoke-virtual {v4, v5, v0, v6, v7}, Lcom/heitao/platform/request/HTPNullResponeParser;->get(Ljava/lang/String;Ljava/util/Map;ZLcom/heitao/platform/listener/HTPRequestListener;)V

    .line 298
    return-void
.end method
