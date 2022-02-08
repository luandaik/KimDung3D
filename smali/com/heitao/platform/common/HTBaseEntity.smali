.class public Lcom/heitao/platform/common/HTBaseEntity;
.super Ljava/lang/Object;
.source "HTBaseEntity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected getPropertiesMap()Ljava/util/Map;
    .locals 1
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
    .line 9
    const/4 v0, 0x0

    return-object v0
.end method

.method public toEncodeString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 19
    invoke-virtual {p0}, Lcom/heitao/platform/common/HTBaseEntity;->getPropertiesMap()Ljava/util/Map;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->DownloadMapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 14
    invoke-virtual {p0}, Lcom/heitao/platform/common/HTBaseEntity;->getPropertiesMap()Ljava/util/Map;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->DownloadMapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
