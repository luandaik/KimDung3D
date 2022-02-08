.class public Lcom/heitao/model/HTExtension;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTExtension.java"


# static fields
.field public static final KEY_APP_ID:Ljava/lang/String; = "app_id"

.field public static final KEY_APP_KEY:Ljava/lang/String; = "app_key"

.field public static final KEY_CHANNEL_ID:Ljava/lang/String; = "channel_id"

.field public static final KEY_CLASS_NAME:Ljava/lang/String; = "class_name"

.field public static final KEY_DESCRIPTION:Ljava/lang/String; = "description"

.field public static final KEY_EXT_KEY:Ljava/lang/String; = "ext_key"

.field public static final KEY_NAME:Ljava/lang/String; = "name"


# instance fields
.field public appId:Ljava/lang/String;

.field public appKey:Ljava/lang/String;

.field public channelId:Ljava/lang/String;

.field public className:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public extKey:Ljava/lang/String;

.field public name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 28
    invoke-direct {p0}, Lcom/heitao/model/HTExtension;->init()V

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "pars"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 58
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/heitao/common/HTUtils;->parsStringToMap(Ljava/lang/String;Z)Ljava/util/HashMap;

    move-result-object v0

    .line 59
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    .line 61
    const-string v1, "app_id"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTExtension;->appId:Ljava/lang/String;

    .line 62
    const-string v1, "app_key"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTExtension;->appKey:Ljava/lang/String;

    .line 63
    const-string v1, "channel_id"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTExtension;->channelId:Ljava/lang/String;

    .line 64
    const-string v1, "ext_key"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTExtension;->extKey:Ljava/lang/String;

    .line 65
    const-string v1, "name"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTExtension;->name:Ljava/lang/String;

    .line 66
    const-string v1, "description"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTExtension;->description:Ljava/lang/String;

    .line 67
    const-string v1, "class_name"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTExtension;->className:Ljava/lang/String;

    .line 69
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "_appId"    # Ljava/lang/String;
    .param p2, "_appKey"    # Ljava/lang/String;
    .param p3, "_channelId"    # Ljava/lang/String;
    .param p4, "_extKey"    # Ljava/lang/String;
    .param p5, "_name"    # Ljava/lang/String;
    .param p6, "_description"    # Ljava/lang/String;
    .param p7, "_className"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/heitao/model/HTExtension;->appId:Ljava/lang/String;

    .line 44
    iput-object p2, p0, Lcom/heitao/model/HTExtension;->appKey:Ljava/lang/String;

    .line 45
    iput-object p3, p0, Lcom/heitao/model/HTExtension;->channelId:Ljava/lang/String;

    .line 46
    iput-object p4, p0, Lcom/heitao/model/HTExtension;->extKey:Ljava/lang/String;

    .line 47
    iput-object p5, p0, Lcom/heitao/model/HTExtension;->name:Ljava/lang/String;

    .line 48
    iput-object p6, p0, Lcom/heitao/model/HTExtension;->description:Ljava/lang/String;

    .line 49
    iput-object p7, p0, Lcom/heitao/model/HTExtension;->className:Ljava/lang/String;

    .line 50
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
    .line 76
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 77
    if-eqz p1, :cond_0

    .line 79
    const-string v0, "app_id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->appId:Ljava/lang/String;

    .line 80
    const-string v0, "app_key"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->appKey:Ljava/lang/String;

    .line 81
    const-string v0, "channel_id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->channelId:Ljava/lang/String;

    .line 82
    const-string v0, "ext_key"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->extKey:Ljava/lang/String;

    .line 83
    const-string v0, "name"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->name:Ljava/lang/String;

    .line 84
    const-string v0, "description"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->description:Ljava/lang/String;

    .line 85
    const-string v0, "class_name"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->className:Ljava/lang/String;

    .line 87
    :cond_0
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 91
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->appId:Ljava/lang/String;

    .line 92
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->appKey:Ljava/lang/String;

    .line 93
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->channelId:Ljava/lang/String;

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->extKey:Ljava/lang/String;

    .line 95
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->name:Ljava/lang/String;

    .line 96
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->description:Ljava/lang/String;

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTExtension;->className:Ljava/lang/String;

    .line 98
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
    .line 103
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 104
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "app_id"

    iget-object v2, p0, Lcom/heitao/model/HTExtension;->appId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    const-string v1, "app_key"

    iget-object v2, p0, Lcom/heitao/model/HTExtension;->appKey:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    const-string v1, "channel_id"

    iget-object v2, p0, Lcom/heitao/model/HTExtension;->channelId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    const-string v1, "ext_key"

    iget-object v2, p0, Lcom/heitao/model/HTExtension;->extKey:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    const-string v1, "name"

    iget-object v2, p0, Lcom/heitao/model/HTExtension;->name:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    const-string v1, "description"

    iget-object v2, p0, Lcom/heitao/model/HTExtension;->description:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    const-string v1, "class_name"

    iget-object v2, p0, Lcom/heitao/model/HTExtension;->className:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    return-object v0
.end method
