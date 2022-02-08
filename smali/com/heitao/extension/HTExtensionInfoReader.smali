.class public Lcom/heitao/extension/HTExtensionInfoReader;
.super Lcom/heitao/common/HTFileReader;
.source "HTExtensionInfoReader.java"


# instance fields
.field private final SDK_EXTENSION_CONFIG_FILE_NAME:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/heitao/common/HTFileReader;-><init>()V

    .line 20
    const-string v0, "ht_extension_config.json"

    iput-object v0, p0, Lcom/heitao/extension/HTExtensionInfoReader;->SDK_EXTENSION_CONFIG_FILE_NAME:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getExtensionInfoFromFile(Landroid/content/Context;)Ljava/util/List;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/heitao/model/HTExtension;",
            ">;"
        }
    .end annotation

    .prologue
    .line 28
    const-string v7, "ht_extension_config.json"

    invoke-virtual {p0, p1, v7}, Lcom/heitao/extension/HTExtensionInfoReader;->openTextFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 29
    .local v5, "jsonValue":Ljava/lang/String;
    invoke-static {v5}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 31
    const-string v7, "\u8bfb\u53d6\u63d2\u4ef6\u914d\u7f6e\u4fe1\u606f\u4e3a\u7a7a"

    invoke-static {v7}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 67
    const/4 v3, 0x0

    :cond_0
    :goto_0
    return-object v3

    .line 35
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .local v3, "extensions":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/model/HTExtension;>;"
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 39
    .local v0, "array":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v4, v7, :cond_0

    .line 41
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 43
    .local v6, "object":Lorg/json/JSONObject;
    new-instance v2, Lcom/heitao/model/HTExtension;

    invoke-direct {v2}, Lcom/heitao/model/HTExtension;-><init>()V

    .line 44
    .local v2, "extension":Lcom/heitao/model/HTExtension;
    const-string v7, "app_id"

    const-string v8, ""

    invoke-static {v6, v7, v8}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v2, Lcom/heitao/model/HTExtension;->appId:Ljava/lang/String;

    .line 45
    const-string v7, "app_key"

    const-string v8, ""

    invoke-static {v6, v7, v8}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v2, Lcom/heitao/model/HTExtension;->appKey:Ljava/lang/String;

    .line 46
    const-string v7, "channel_id"

    const-string v8, ""

    invoke-static {v6, v7, v8}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v2, Lcom/heitao/model/HTExtension;->channelId:Ljava/lang/String;

    .line 47
    const-string v7, "ext_key"

    const-string v8, ""

    invoke-static {v6, v7, v8}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v2, Lcom/heitao/model/HTExtension;->extKey:Ljava/lang/String;

    .line 48
    const-string v7, "name"

    const-string v8, ""

    invoke-static {v6, v7, v8}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v2, Lcom/heitao/model/HTExtension;->name:Ljava/lang/String;

    .line 49
    const-string v7, "description"

    const-string v8, ""

    invoke-static {v6, v7, v8}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v2, Lcom/heitao/model/HTExtension;->description:Ljava/lang/String;

    .line 50
    const-string v7, "class_name"

    const-string v8, ""

    invoke-static {v6, v7, v8}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v2, Lcom/heitao/model/HTExtension;->className:Ljava/lang/String;

    .line 52
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 55
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "extension":Lcom/heitao/model/HTExtension;
    .end local v4    # "i":I
    .end local v6    # "object":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 58
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 60
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 61
    const-string v7, "\u89e3\u6790\u63d2\u4ef6\u914d\u7f6e\u4fe1\u606f\u5f02\u5e38"

    invoke-static {v7}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method
