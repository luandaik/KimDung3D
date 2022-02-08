.class public Lcom/heitao/common/HTSDKInfoReader;
.super Lcom/heitao/common/HTFileReader;
.source "HTSDKInfoReader.java"


# instance fields
.field private final SDK_CONFIG_FILE_NAME:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/heitao/common/HTFileReader;-><init>()V

    .line 16
    const-string v0, "ht_proxy_config.json"

    iput-object v0, p0, Lcom/heitao/common/HTSDKInfoReader;->SDK_CONFIG_FILE_NAME:Ljava/lang/String;

    return-void
.end method

.method private static attainChannelFromMETAINF(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 70
    const-string v3, ""

    .line 71
    .local v3, "result":Ljava/lang/String;
    const/4 v5, 0x0

    .line 73
    .local v5, "zipfile":Ljava/util/zip/ZipFile;
    :try_start_0
    new-instance v6, Ljava/util/zip/ZipFile;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .local v6, "zipfile":Ljava/util/zip/ZipFile;
    :try_start_1
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    .line 75
    .local v1, "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 77
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/zip/ZipEntry;

    .line 78
    .local v2, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "META-INF/channel"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 80
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v3

    .line 91
    .end local v2    # "entry":Ljava/util/zip/ZipEntry;
    :cond_1
    if-eqz v6, :cond_5

    .line 95
    :try_start_2
    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object v5, v6

    .line 102
    .end local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    :cond_2
    :goto_0
    const-string v7, "-"

    invoke-virtual {v3, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 103
    .local v4, "split":[Ljava/lang/String;
    array-length v7, v4

    const/4 v8, 0x3

    if-lt v7, v8, :cond_4

    .line 105
    const/4 v7, 0x0

    aget-object v7, v4, v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x1

    aget-object v8, v4, v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v7, v8

    add-int/lit8 v7, v7, 0x2

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 112
    :goto_1
    return-object v3

    .line 96
    .end local v4    # "split":[Ljava/lang/String;
    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .restart local v6    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v5, v6

    .line 99
    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    goto :goto_0

    .line 85
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    :catch_1
    move-exception v0

    .line 87
    .restart local v0    # "e":Ljava/lang/Exception;
    :goto_2
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 91
    if-eqz v5, :cond_2

    .line 95
    :try_start_4
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 96
    :catch_2
    move-exception v0

    .line 98
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 91
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    :goto_3
    if-eqz v5, :cond_3

    .line 95
    :try_start_5
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 99
    :cond_3
    :goto_4
    throw v7

    .line 96
    :catch_3
    move-exception v0

    .line 98
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4

    .line 109
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v4    # "split":[Ljava/lang/String;
    :cond_4
    const-string v3, ""

    goto :goto_1

    .line 91
    .end local v4    # "split":[Ljava/lang/String;
    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v6    # "zipfile":Ljava/util/zip/ZipFile;
    :catchall_1
    move-exception v7

    move-object v5, v6

    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    goto :goto_3

    .line 85
    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v6    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_4
    move-exception v0

    move-object v5, v6

    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    goto :goto_2

    .end local v5    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .restart local v6    # "zipfile":Ljava/util/zip/ZipFile;
    :cond_5
    move-object v5, v6

    .end local v6    # "zipfile":Ljava/util/zip/ZipFile;
    .restart local v5    # "zipfile":Ljava/util/zip/ZipFile;
    goto :goto_0
.end method


# virtual methods
.method public getSDKInfoFromFile(Landroid/content/Context;)Lcom/heitao/model/HTSDKInfo;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    const-string v6, "ht_proxy_config.json"

    invoke-virtual {p0, p1, v6}, Lcom/heitao/common/HTSDKInfoReader;->openTextFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 25
    .local v3, "jsonValue":Ljava/lang/String;
    invoke-static {v3}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 27
    const-string v6, "\u8bfb\u53d6SDK\u914d\u7f6e\u4fe1\u606f\u4e3a\u7a7a"

    invoke-static {v6}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 65
    const/4 v4, 0x0

    :goto_0
    return-object v4

    .line 31
    :cond_0
    const/4 v4, 0x0

    .line 34
    .local v4, "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    :try_start_0
    new-instance v5, Lcom/heitao/model/HTSDKInfo;

    invoke-direct {v5}, Lcom/heitao/model/HTSDKInfo;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 36
    .end local v4    # "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    .local v5, "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    :try_start_1
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 37
    .local v1, "configJsonObject":Lorg/json/JSONObject;
    const-string v6, "app_id"

    const-string v7, ""

    invoke-static {v1, v6, v7}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/heitao/model/HTSDKInfo;->appId:Ljava/lang/String;

    .line 38
    const-string v6, "app_key"

    const-string v7, ""

    invoke-static {v1, v6, v7}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/heitao/model/HTSDKInfo;->appKey:Ljava/lang/String;

    .line 39
    const-string v6, "secret_key"

    const-string v7, ""

    invoke-static {v1, v6, v7}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/heitao/model/HTSDKInfo;->secretKey:Ljava/lang/String;

    .line 40
    const-string v6, "pay_key"

    const-string v7, ""

    invoke-static {v1, v6, v7}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/heitao/model/HTSDKInfo;->payKey:Ljava/lang/String;

    .line 41
    const-string v6, "extend_key"

    const-string v7, ""

    invoke-static {v1, v6, v7}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/heitao/model/HTSDKInfo;->extendKey:Ljava/lang/String;

    .line 43
    invoke-static {p1}, Lcom/heitao/common/HTSDKInfoReader;->attainChannelFromMETAINF(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 44
    .local v0, "channelID":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 46
    const-string v6, "custom_channel_id"

    const-string v7, ""

    invoke-static {v1, v6, v7}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/heitao/model/HTSDKInfo;->customChannelId:Ljava/lang/String;

    :goto_1
    move-object v4, v5

    .line 60
    .end local v5    # "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    .restart local v4    # "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    goto :goto_0

    .line 50
    .end local v4    # "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    .restart local v5    # "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    :cond_1
    iput-object v0, v5, Lcom/heitao/model/HTSDKInfo;->customChannelId:Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 53
    .end local v0    # "channelID":Ljava/lang/String;
    .end local v1    # "configJsonObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    move-object v4, v5

    .line 56
    .end local v5    # "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    .local v2, "e":Lorg/json/JSONException;
    .restart local v4    # "sdkInfo":Lcom/heitao/model/HTSDKInfo;
    :goto_2
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 58
    const/4 v4, 0x0

    .line 59
    const-string v6, "\u89e3\u6790SDK\u914d\u7f6e\u4fe1\u606f\u5f02\u5e38"

    invoke-static {v6}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 53
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    goto :goto_2
.end method
