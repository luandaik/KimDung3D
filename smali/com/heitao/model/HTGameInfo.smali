.class public Lcom/heitao/model/HTGameInfo;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTGameInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/model/HTGameInfo$HTDirection;
    }
.end annotation


# static fields
.field public static final KEY_DIRECTION:Ljava/lang/String; = "direction"

.field public static final KEY_NAME:Ljava/lang/String; = "name"

.field public static final KEY_SHORT_NAME:Ljava/lang/String; = "short_name"


# instance fields
.field public direction:Lcom/heitao/model/HTGameInfo$HTDirection;

.field public name:Ljava/lang/String;

.field public shortName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 24
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTGameInfo;->name:Ljava/lang/String;

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    .line 26
    sget-object v0, Lcom/heitao/model/HTGameInfo$HTDirection;->Landscape:Lcom/heitao/model/HTGameInfo$HTDirection;

    iput-object v0, p0, Lcom/heitao/model/HTGameInfo;->direction:Lcom/heitao/model/HTGameInfo$HTDirection;

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/model/HTGameInfo$HTDirection;)V
    .locals 0
    .param p1, "_name"    # Ljava/lang/String;
    .param p2, "_shortName"    # Ljava/lang/String;
    .param p3, "_direction"    # Lcom/heitao/model/HTGameInfo$HTDirection;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/heitao/model/HTGameInfo;->name:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    .line 39
    iput-object p3, p0, Lcom/heitao/model/HTGameInfo;->direction:Lcom/heitao/model/HTGameInfo$HTDirection;

    .line 40
    return-void
.end method


# virtual methods
.method protected getPropertiesMap()Ljava/util/Map;
    .locals 4
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
    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 46
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "name"

    iget-object v2, p0, Lcom/heitao/model/HTGameInfo;->name:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string v1, "short_name"

    iget-object v2, p0, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    const-string v2, "direction"

    iget-object v1, p0, Lcom/heitao/model/HTGameInfo;->direction:Lcom/heitao/model/HTGameInfo$HTDirection;

    sget-object v3, Lcom/heitao/model/HTGameInfo$HTDirection;->Landscape:Lcom/heitao/model/HTGameInfo$HTDirection;

    if-ne v1, v3, :cond_0

    const-string v1, "landscape"

    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    return-object v0

    .line 48
    :cond_0
    const-string v1, "portrait"

    goto :goto_0
.end method
