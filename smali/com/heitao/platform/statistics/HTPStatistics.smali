.class public Lcom/heitao/platform/statistics/HTPStatistics;
.super Ljava/lang/Object;
.source "HTPStatistics.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static statistics(Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .param p0, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "http://api.heitao.com/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 23
    .local v0, "url":Ljava/lang/String;
    new-instance v1, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v1}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    new-instance v2, Lcom/heitao/platform/statistics/HTPStatistics$1;

    invoke-direct {v2}, Lcom/heitao/platform/statistics/HTPStatistics$1;-><init>()V

    invoke-virtual {v1, v0, p1, v2}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    .line 48
    return-void
.end method
