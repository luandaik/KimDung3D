.class public Lcom/heitao/model/HTSDKInfo;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTSDKInfo.java"


# static fields
.field public static final KEY_APP_ID:Ljava/lang/String; = "app_id"

.field public static final KEY_APP_KEY:Ljava/lang/String; = "app_key"

.field public static final KEY_CUSTOM_CHANNEL_ID:Ljava/lang/String; = "custom_channel_id"

.field public static final KEY_EXTEND_KEY:Ljava/lang/String; = "extend_key"

.field public static final KEY_PAY_KEY:Ljava/lang/String; = "pay_key"

.field public static final KEY_SECRET_KEY:Ljava/lang/String; = "secret_key"


# instance fields
.field public appId:Ljava/lang/String;

.field public appKey:Ljava/lang/String;

.field public customChannelId:Ljava/lang/String;

.field public extendKey:Ljava/lang/String;

.field public payKey:Ljava/lang/String;

.field public secretKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
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
    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 26
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "app_id"

    iget-object v2, p0, Lcom/heitao/model/HTSDKInfo;->appId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    const-string v1, "app_key"

    iget-object v2, p0, Lcom/heitao/model/HTSDKInfo;->appKey:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    const-string v1, "secret_key"

    iget-object v2, p0, Lcom/heitao/model/HTSDKInfo;->secretKey:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    const-string v1, "extend_key"

    iget-object v2, p0, Lcom/heitao/model/HTSDKInfo;->extendKey:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    const-string v1, "pay_key"

    iget-object v2, p0, Lcom/heitao/model/HTSDKInfo;->payKey:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    const-string v1, "custom_channel_id"

    iget-object v2, p0, Lcom/heitao/model/HTSDKInfo;->customChannelId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    return-object v0
.end method
