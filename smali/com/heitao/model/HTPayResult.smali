.class public Lcom/heitao/model/HTPayResult;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTPayResult.java"


# static fields
.field public static final KEY_CODE:Ljava/lang/String; = "code"

.field public static final KEY_CUSTOM:Ljava/lang/String; = "custom"

.field public static final KEY_MESSAGE:Ljava/lang/String; = "message"


# instance fields
.field public code:Ljava/lang/String;

.field public custom:Ljava/lang/String;

.field public message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 21
    invoke-direct {p0}, Lcom/heitao/model/HTPayResult;->init()V

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "_code"    # Ljava/lang/String;
    .param p2, "_message"    # Ljava/lang/String;
    .param p3, "_custom"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/heitao/model/HTPayResult;->code:Ljava/lang/String;

    .line 32
    iput-object p2, p0, Lcom/heitao/model/HTPayResult;->message:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lcom/heitao/model/HTPayResult;->custom:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public static getPayCompleteResult(Ljava/util/Map;)Lcom/heitao/model/HTPayResult;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/heitao/model/HTPayResult;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/heitao/model/HTPayResult;

    const-string v1, "20"

    const-string v2, "\u652f\u4ed8\u5b8c\u6210"

    const/4 v3, 0x1

    invoke-static {p0, v3}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/heitao/model/HTPayResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private init()V
    .locals 1

    .prologue
    .line 38
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayResult;->code:Ljava/lang/String;

    .line 39
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayResult;->message:Ljava/lang/String;

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayResult;->custom:Ljava/lang/String;

    .line 41
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
    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 55
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "code"

    iget-object v2, p0, Lcom/heitao/model/HTPayResult;->code:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const-string v1, "message"

    iget-object v2, p0, Lcom/heitao/model/HTPayResult;->message:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v1, "custom"

    iget-object v2, p0, Lcom/heitao/model/HTPayResult;->custom:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    return-object v0
.end method
