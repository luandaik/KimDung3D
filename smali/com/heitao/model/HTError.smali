.class public Lcom/heitao/model/HTError;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTError.java"


# static fields
.field public static final KEY_CODE:Ljava/lang/String; = "code"

.field public static final KEY_MESSAGE:Ljava/lang/String; = "message"


# instance fields
.field public code:Ljava/lang/String;

.field public message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTError;->code:Ljava/lang/String;

    .line 19
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTError;->message:Ljava/lang/String;

    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "_code"    # Ljava/lang/String;
    .param p2, "_message"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/heitao/model/HTError;->code:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lcom/heitao/model/HTError;->message:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public static getCustomError(Ljava/lang/String;)Lcom/heitao/model/HTError;
    .locals 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 87
    new-instance v0, Lcom/heitao/model/HTError;

    const-string v1, "32"

    invoke-direct {v0, v1, p0}, Lcom/heitao/model/HTError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getLoginCancelError()Lcom/heitao/model/HTError;
    .locals 3

    .prologue
    .line 54
    new-instance v0, Lcom/heitao/model/HTError;

    const-string v1, "12"

    const-string v2, "\u767b\u5f55\u53d6\u6d88"

    invoke-direct {v0, v1, v2}, Lcom/heitao/model/HTError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getLoginFailError()Lcom/heitao/model/HTError;
    .locals 3

    .prologue
    .line 62
    new-instance v0, Lcom/heitao/model/HTError;

    const-string v1, "11"

    const-string v2, "\u767b\u5f55\u5931\u8d25"

    invoke-direct {v0, v1, v2}, Lcom/heitao/model/HTError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getNetworkError()Lcom/heitao/model/HTError;
    .locals 3

    .prologue
    .line 46
    new-instance v0, Lcom/heitao/model/HTError;

    const-string v1, "31"

    const-string v2, "\u7f51\u7edc\u9519\u8bef"

    invoke-direct {v0, v1, v2}, Lcom/heitao/model/HTError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getParsError()Lcom/heitao/model/HTError;
    .locals 3

    .prologue
    .line 38
    new-instance v0, Lcom/heitao/model/HTError;

    const-string v1, "30"

    const-string v2, "\u89e3\u6790\u9519\u8bef"

    invoke-direct {v0, v1, v2}, Lcom/heitao/model/HTError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getPayCancelError()Lcom/heitao/model/HTError;
    .locals 3

    .prologue
    .line 70
    new-instance v0, Lcom/heitao/model/HTError;

    const-string v1, "12"

    const-string v2, "\u652f\u4ed8\u53d6\u6d88"

    invoke-direct {v0, v1, v2}, Lcom/heitao/model/HTError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getPayFailError()Lcom/heitao/model/HTError;
    .locals 3

    .prologue
    .line 78
    new-instance v0, Lcom/heitao/model/HTError;

    const-string v1, "21"

    const-string v2, "\u652f\u4ed8\u5931\u8d25"

    invoke-direct {v0, v1, v2}, Lcom/heitao/model/HTError;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
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
    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 94
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "code"

    iget-object v2, p0, Lcom/heitao/model/HTError;->code:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    const-string v1, "message"

    iget-object v2, p0, Lcom/heitao/model/HTError;->message:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    return-object v0
.end method
