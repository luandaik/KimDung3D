.class public Lcom/heitao/platform/common/HTPJSONHelper;
.super Ljava/lang/Object;
.source "HTPJSONHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInt(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 1
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 16
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/heitao/platform/common/HTPJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getInt(Lorg/json/JSONObject;Ljava/lang/String;I)I
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 28
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move v1, p2

    .line 44
    :goto_0
    return v1

    .line 33
    :cond_1
    move v1, p2

    .line 36
    .local v1, "retValue":I
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 38
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Ljava/lang/Exception;
    move v1, p2

    goto :goto_0
.end method

.method public static getJSONArray(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 175
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 177
    :cond_0
    const/4 v1, 0x0

    .line 191
    :goto_0
    return-object v1

    .line 180
    :cond_1
    const/4 v1, 0x0

    .line 183
    .local v1, "retValue":Lorg/json/JSONArray;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 185
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getJSONObject(Lorg/json/JSONArray;I)Lorg/json/JSONObject;
    .locals 3
    .param p0, "array"    # Lorg/json/JSONArray;
    .param p1, "index"    # I

    .prologue
    .line 121
    if-eqz p0, :cond_0

    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-le p1, v2, :cond_1

    .line 123
    :cond_0
    const/4 v1, 0x0

    .line 137
    :goto_0
    return-object v1

    .line 126
    :cond_1
    const/4 v1, 0x0

    .line 129
    .local v1, "retValue":Lorg/json/JSONObject;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 131
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 94
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 96
    :cond_0
    const/4 v1, 0x0

    .line 110
    :goto_0
    return-object v1

    .line 99
    :cond_1
    const/4 v1, 0x0

    .line 102
    .local v1, "retValue":Lorg/json/JSONObject;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 104
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getString(Lorg/json/JSONArray;I)Ljava/lang/String;
    .locals 3
    .param p0, "array"    # Lorg/json/JSONArray;
    .param p1, "index"    # I

    .prologue
    .line 148
    if-eqz p0, :cond_0

    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-le p1, v2, :cond_1

    .line 150
    :cond_0
    const/4 v1, 0x0

    .line 164
    :goto_0
    return-object v1

    .line 153
    :cond_1
    const/4 v1, 0x0

    .line 156
    .local v1, "retValue":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 158
    :catch_0
    move-exception v0

    .line 161
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 67
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move-object v1, p2

    .line 83
    :goto_0
    return-object v1

    .line 72
    :cond_1
    move-object v1, p2

    .line 75
    .local v1, "retValue":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 77
    :catch_0
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    move-object v1, p2

    goto :goto_0
.end method

.method public static isNull(Lorg/json/JSONObject;Ljava/lang/String;)Z
    .locals 1
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 202
    if-eqz p0, :cond_0

    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 204
    :cond_0
    const/4 v0, 0x1

    .line 207
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method
