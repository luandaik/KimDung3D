.class public Lcom/heitao/common/HTJSONHelper;
.super Ljava/lang/Object;
.source "HTJSONHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInt(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 1
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 15
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getInt(Lorg/json/JSONObject;Ljava/lang/String;I)I
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 27
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v1, p2

    .line 43
    :goto_0
    return v1

    .line 32
    :cond_1
    move v1, p2

    .line 35
    .local v1, "retValue":I
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    move v1, p2

    goto :goto_0
.end method

.method public static getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 93
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    :cond_0
    const/4 v1, 0x0

    .line 109
    :goto_0
    return-object v1

    .line 98
    :cond_1
    const/4 v1, 0x0

    .line 101
    .local v1, "retValue":Lorg/json/JSONObject;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 103
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 66
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move-object v1, p2

    .line 82
    :goto_0
    return-object v1

    .line 71
    :cond_1
    move-object v1, p2

    .line 74
    .local v1, "retValue":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 76
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/Exception;
    move-object v1, p2

    goto :goto_0
.end method

.method public static isNull(Lorg/json/JSONObject;Ljava/lang/String;)Z
    .locals 1
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 120
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 122
    :cond_0
    const/4 v0, 0x1

    .line 125
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method
