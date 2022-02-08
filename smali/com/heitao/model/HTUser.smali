.class public Lcom/heitao/model/HTUser;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTUser.java"


# static fields
.field public static final KEY_CUSTOM:Ljava/lang/String; = "custom"

.field public static final KEY_PLATFORM_ID:Ljava/lang/String; = "platform_id"

.field public static final KEY_PLATFORM_USER_ID:Ljava/lang/String; = "platform_user_id"

.field public static final KEY_TOKEN:Ljava/lang/String; = "token"

.field public static final KEY_USER_ID:Ljava/lang/String; = "user_id"


# instance fields
.field public custom:Ljava/lang/String;

.field public platformId:Ljava/lang/String;

.field public platformUserId:Ljava/lang/String;

.field public token:Ljava/lang/String;

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 24
    invoke-direct {p0}, Lcom/heitao/model/HTUser;->init()V

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "pars"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 50
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/heitao/common/HTUtils;->parsStringToMap(Ljava/lang/String;Z)Ljava/util/HashMap;

    move-result-object v0

    .line 51
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    .line 53
    const-string v1, "user_id"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    .line 54
    const-string v1, "platform_user_id"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    .line 55
    const-string v1, "platform_id"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTUser;->platformId:Ljava/lang/String;

    .line 56
    const-string v1, "token"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTUser;->token:Ljava/lang/String;

    .line 57
    const-string v1, "custom"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    .line 59
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "_userId"    # Ljava/lang/String;
    .param p2, "_platformUserId"    # Ljava/lang/String;
    .param p3, "_platformId"    # Ljava/lang/String;
    .param p4, "_token"    # Ljava/lang/String;
    .param p5, "_custom"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    .line 39
    iput-object p3, p0, Lcom/heitao/model/HTUser;->platformId:Ljava/lang/String;

    .line 40
    iput-object p4, p0, Lcom/heitao/model/HTUser;->token:Ljava/lang/String;

    .line 41
    iput-object p5, p0, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 67
    if-eqz p1, :cond_0

    .line 69
    const-string v0, "user_id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    .line 70
    const-string v0, "platform_user_id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    .line 71
    const-string v0, "platform_id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTUser;->platformId:Ljava/lang/String;

    .line 72
    const-string v0, "token"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTUser;->token:Ljava/lang/String;

    .line 73
    const-string v0, "custom"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    .line 75
    :cond_0
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 79
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTUser;->platformId:Ljava/lang/String;

    .line 82
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTUser;->token:Ljava/lang/String;

    .line 83
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    .line 84
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
    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 90
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "user_id"

    iget-object v2, p0, Lcom/heitao/model/HTUser;->userId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string v1, "platform_user_id"

    iget-object v2, p0, Lcom/heitao/model/HTUser;->platformUserId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v1, "platform_id"

    iget-object v2, p0, Lcom/heitao/model/HTUser;->platformId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v1, "token"

    iget-object v2, p0, Lcom/heitao/model/HTUser;->token:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string v1, "custom"

    iget-object v2, p0, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    return-object v0
.end method
