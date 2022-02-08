.class public Lcom/heitao/model/HTPayInfo;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTPayInfo.java"


# static fields
.field public static final KEY_CALLBACK_URL:Ljava/lang/String; = "callback_url"

.field public static final KEY_COUNT:Ljava/lang/String; = "count"

.field public static final KEY_CP_EXTEND_INFO:Ljava/lang/String; = "cp_extend_info"

.field public static final KEY_CUSTOM:Ljava/lang/String; = "custom"

.field public static final KEY_DESCRIPTION:Ljava/lang/String; = "description"

.field public static final KEY_FIXED_MONEY:Ljava/lang/String; = "fixed_money"

.field public static final KEY_NAME:Ljava/lang/String; = "name"

.field public static final KEY_PRICE:Ljava/lang/String; = "price"

.field public static final KEY_PRODUCT_ID:Ljava/lang/String; = "product_id"

.field public static final KEY_RATE:Ljava/lang/String; = "rate"

.field public static final KEY_SERVER_ID:Ljava/lang/String; = "server_id"

.field public static final KEY_UNIT_NAME:Ljava/lang/String; = "unit_name"


# instance fields
.field public callbackUrl:Ljava/lang/String;

.field public count:I

.field public cpExtendInfo:Ljava/lang/String;

.field public custom:Ljava/lang/String;

.field public description:Ljava/lang/String;

.field public fixedMoney:I

.field public name:Ljava/lang/String;

.field public price:F

.field public productId:Ljava/lang/String;

.field public rate:I

.field public serverId:Ljava/lang/String;

.field public unitName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 39
    invoke-direct {p0}, Lcom/heitao/model/HTPayInfo;->init()V

    .line 40
    return-void
.end method

.method public constructor <init>(FIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "_price"    # F
    .param p2, "_rate"    # I
    .param p3, "_count"    # I
    .param p4, "_fixedMoney"    # I
    .param p5, "_unitName"    # Ljava/lang/String;
    .param p6, "_productId"    # Ljava/lang/String;
    .param p7, "_serverId"    # Ljava/lang/String;
    .param p8, "_name"    # Ljava/lang/String;
    .param p9, "_callbackUrl"    # Ljava/lang/String;
    .param p10, "_description"    # Ljava/lang/String;
    .param p11, "_cpExtendInfo"    # Ljava/lang/String;
    .param p12, "_custom"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 59
    iput p1, p0, Lcom/heitao/model/HTPayInfo;->price:F

    .line 60
    iput p2, p0, Lcom/heitao/model/HTPayInfo;->rate:I

    .line 61
    iput p3, p0, Lcom/heitao/model/HTPayInfo;->count:I

    .line 62
    iput p4, p0, Lcom/heitao/model/HTPayInfo;->fixedMoney:I

    .line 63
    iput-object p5, p0, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    .line 64
    iput-object p6, p0, Lcom/heitao/model/HTPayInfo;->productId:Ljava/lang/String;

    .line 65
    iput-object p7, p0, Lcom/heitao/model/HTPayInfo;->serverId:Ljava/lang/String;

    .line 66
    iput-object p8, p0, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 67
    iput-object p9, p0, Lcom/heitao/model/HTPayInfo;->callbackUrl:Ljava/lang/String;

    .line 68
    iput-object p10, p0, Lcom/heitao/model/HTPayInfo;->description:Ljava/lang/String;

    .line 69
    iput-object p11, p0, Lcom/heitao/model/HTPayInfo;->cpExtendInfo:Ljava/lang/String;

    .line 70
    iput-object p12, p0, Lcom/heitao/model/HTPayInfo;->custom:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "pars"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 79
    const/4 v2, 0x1

    invoke-static {p1, v2}, Lcom/heitao/common/HTUtils;->parsStringToMap(Ljava/lang/String;Z)Ljava/util/HashMap;

    move-result-object v1

    .line 80
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v1, :cond_0

    .line 83
    :try_start_0
    const-string v2, "price"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    iput v2, p0, Lcom/heitao/model/HTPayInfo;->price:F

    .line 84
    const-string v2, "rate"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/heitao/model/HTPayInfo;->rate:I

    .line 85
    const-string v2, "count"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/heitao/model/HTPayInfo;->count:I

    .line 86
    const-string v2, "fixed_money"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/heitao/model/HTPayInfo;->fixedMoney:I

    .line 87
    const-string v2, "unit_name"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    .line 88
    const-string v2, "product_id"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/heitao/model/HTPayInfo;->productId:Ljava/lang/String;

    .line 89
    const-string v2, "server_id"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/heitao/model/HTPayInfo;->serverId:Ljava/lang/String;

    .line 90
    const-string v2, "name"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 91
    const-string v2, "callback_url"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/heitao/model/HTPayInfo;->callbackUrl:Ljava/lang/String;

    .line 92
    const-string v2, "description"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/heitao/model/HTPayInfo;->description:Ljava/lang/String;

    .line 93
    const-string v2, "cp_extend_info"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/heitao/model/HTPayInfo;->cpExtendInfo:Ljava/lang/String;

    .line 94
    const-string v2, "custom"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/heitao/model/HTPayInfo;->custom:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    :cond_0
    :goto_0
    return-void

    .line 96
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    invoke-direct {p0}, Lcom/heitao/model/HTPayInfo;->init()V

    .line 100
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u521d\u59cb\u5316\u652f\u4ed8\u4fe1\u606fpars\u5f02\u5e38\uff0cerror="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 3
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
    .line 110
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 111
    if-eqz p1, :cond_0

    .line 114
    :try_start_0
    const-string v1, "price"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, p0, Lcom/heitao/model/HTPayInfo;->price:F

    .line 115
    const-string v1, "rate"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/heitao/model/HTPayInfo;->rate:I

    .line 116
    const-string v1, "count"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/heitao/model/HTPayInfo;->count:I

    .line 117
    const-string v1, "fixed_money"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/heitao/model/HTPayInfo;->fixedMoney:I

    .line 118
    const-string v1, "unit_name"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    .line 119
    const-string v1, "product_id"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTPayInfo;->productId:Ljava/lang/String;

    .line 120
    const-string v1, "server_id"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTPayInfo;->serverId:Ljava/lang/String;

    .line 121
    const-string v1, "name"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 122
    const-string v1, "callback_url"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTPayInfo;->callbackUrl:Ljava/lang/String;

    .line 123
    const-string v1, "description"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTPayInfo;->description:Ljava/lang/String;

    .line 124
    const-string v1, "cp_extend_info"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTPayInfo;->cpExtendInfo:Ljava/lang/String;

    .line 125
    const-string v1, "custom"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/heitao/model/HTPayInfo;->custom:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    :cond_0
    :goto_0
    return-void

    .line 127
    :catch_0
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/Exception;
    invoke-direct {p0}, Lcom/heitao/model/HTPayInfo;->init()V

    .line 131
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u521d\u59cb\u5316\u652f\u4ed8\u4fe1\u606fmap\u5f02\u5e38\uff0cerror="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private init()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 138
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/heitao/model/HTPayInfo;->price:F

    .line 139
    const/16 v0, 0xa

    iput v0, p0, Lcom/heitao/model/HTPayInfo;->rate:I

    .line 140
    iput v1, p0, Lcom/heitao/model/HTPayInfo;->count:I

    .line 141
    iput v1, p0, Lcom/heitao/model/HTPayInfo;->fixedMoney:I

    .line 142
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    .line 143
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayInfo;->productId:Ljava/lang/String;

    .line 144
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayInfo;->serverId:Ljava/lang/String;

    .line 145
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    .line 146
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayInfo;->callbackUrl:Ljava/lang/String;

    .line 147
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayInfo;->description:Ljava/lang/String;

    .line 148
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayInfo;->cpExtendInfo:Ljava/lang/String;

    .line 149
    const-string v0, ""

    iput-object v0, p0, Lcom/heitao/model/HTPayInfo;->custom:Ljava/lang/String;

    .line 150
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
    .line 155
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 156
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "price"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/heitao/model/HTPayInfo;->price:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    const-string v1, "rate"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/heitao/model/HTPayInfo;->rate:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    const-string v1, "count"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/heitao/model/HTPayInfo;->count:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    const-string v1, "fixed_money"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/heitao/model/HTPayInfo;->fixedMoney:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    const-string v1, "unit_name"

    iget-object v2, p0, Lcom/heitao/model/HTPayInfo;->unitName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    const-string v1, "product_id"

    iget-object v2, p0, Lcom/heitao/model/HTPayInfo;->productId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    const-string v1, "server_id"

    iget-object v2, p0, Lcom/heitao/model/HTPayInfo;->serverId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    const-string v1, "name"

    iget-object v2, p0, Lcom/heitao/model/HTPayInfo;->name:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    const-string v1, "callback_url"

    iget-object v2, p0, Lcom/heitao/model/HTPayInfo;->callbackUrl:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    const-string v1, "description"

    iget-object v2, p0, Lcom/heitao/model/HTPayInfo;->description:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    const-string v1, "cp_extend_info"

    iget-object v2, p0, Lcom/heitao/model/HTPayInfo;->cpExtendInfo:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    const-string v1, "custom"

    iget-object v2, p0, Lcom/heitao/model/HTPayInfo;->custom:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    return-object v0
.end method
