.class public Lcom/heitao/model/HTWXBindInfo;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTWXBindInfo.java"


# static fields
.field public static final KEY_EXTEND:Ljava/lang/String; = "extend"

.field public static final KEY_IS_BIND:Ljava/lang/String; = "is_bind"

.field public static final KEY_WEIXIN_ID:Ljava/lang/String; = "weixin_id"


# instance fields
.field public extend:Lorg/json/JSONObject;

.field public isBind:Z

.field public weixinID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getPropertiesMap()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 22
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "is_bind"

    iget-boolean v1, p0, Lcom/heitao/model/HTWXBindInfo;->isBind:Z

    if-eqz v1, :cond_0

    const-string v1, "1"

    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    const-string v1, "weixin_id"

    iget-object v2, p0, Lcom/heitao/model/HTWXBindInfo;->weixinID:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    const-string v2, "extend"

    iget-object v1, p0, Lcom/heitao/model/HTWXBindInfo;->extend:Lorg/json/JSONObject;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/heitao/model/HTWXBindInfo;->extend:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    return-object v0

    .line 22
    :cond_0
    const-string v1, "0"

    goto :goto_0

    .line 24
    :cond_1
    const-string v1, ""

    goto :goto_1
.end method
