.class public Lcom/heitao/common/HTUtils;
.super Ljava/lang/Object;
.source "HTUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doOpenUrl(Ljava/lang/String;)V
    .locals 3
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 315
    invoke-static {p0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 317
    const-string v2, "doOpenUrl \u6253\u5f00URL\u4e3a\u7a7a"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 326
    :goto_0
    return-void

    .line 321
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 322
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 323
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 324
    .local v0, "content_url":Landroid/net/Uri;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 325
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public static doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 155
    if-nez p0, :cond_0

    .line 157
    const-string v1, "\u521d\u59cb\u5316Context\u4e3a\u7a7a"

    invoke-static {v1}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 163
    :goto_0
    return-void

    .line 161
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 162
    .local v0, "mainHandler":Landroid/os/Handler;
    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public static doShowDialog(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 223
    const-string v0, "\u63d0\u793a"

    invoke-static {v0, p0}, Lcom/heitao/common/HTUtils;->doShowDialog(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    return-void
.end method

.method public static doShowDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 233
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v1

    iget-object v0, v1, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    .line 234
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Lcom/heitao/common/HTUtils$2;

    invoke-direct {v1, v0, p0, p1}, Lcom/heitao/common/HTUtils$2;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 256
    return-void
.end method

.method public static doShowDialog(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 2
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 266
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v1

    iget-object v0, v1, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    .line 267
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Lcom/heitao/common/HTUtils$3;

    invoke-direct {v1, v0, p0, p1, p2}, Lcom/heitao/common/HTUtils$3;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 281
    return-void
.end method

.method public static doShowDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 6
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "buttonTitle"    # Ljava/lang/String;
    .param p3, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 292
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    iget-object v1, v0, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    .line 293
    .local v1, "context":Landroid/content/Context;
    new-instance v0, Lcom/heitao/common/HTUtils$4;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/heitao/common/HTUtils$4;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    invoke-static {v1, v0}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 307
    return-void
.end method

.method public static doShowToast(Ljava/lang/String;)V
    .locals 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 206
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v1

    iget-object v0, v1, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    .line 207
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Lcom/heitao/common/HTUtils$1;

    invoke-direct {v1, v0, p0}, Lcom/heitao/common/HTUtils$1;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 215
    return-void
.end method

.method public static final getMD5(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x10

    .line 170
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    .line 172
    .local v5, "unencodedPassword":[B
    const/4 v4, 0x0

    .line 176
    .local v4, "md":Ljava/security/MessageDigest;
    :try_start_0
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 183
    invoke-virtual {v4}, Ljava/security/MessageDigest;->reset()V

    .line 184
    invoke-virtual {v4, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 185
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 186
    .local v2, "encodedPassword":[B
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 188
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v6, v2

    if-ge v3, v6, :cond_1

    .line 190
    aget-byte v6, v2, v3

    and-int/lit16 v6, v6, 0xff

    if-ge v6, v8, :cond_0

    .line 192
    const-string v6, "0"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 194
    :cond_0
    aget-byte v6, v2, v3

    and-int/lit16 v6, v6, 0xff

    int-to-long v6, v6

    invoke-static {v6, v7, v8}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 188
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 178
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v2    # "encodedPassword":[B
    .end local v3    # "i":I
    :catch_0
    move-exception v1

    .line 197
    .end local p0    # "string":Ljava/lang/String;
    :goto_1
    return-object p0

    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v2    # "encodedPassword":[B
    .restart local v3    # "i":I
    .restart local p0    # "string":Ljava/lang/String;
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1
.end method

.method public static isNullOrEmpty(Ljava/lang/String;)Z
    .locals 2
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 142
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 144
    :cond_0
    const/4 v0, 0x1

    .line 147
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;
    .locals 9
    .param p1, "isEncode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 76
    :cond_0
    const/4 v3, 0x0

    .line 97
    :cond_1
    return-object v3

    .line 79
    :cond_2
    const-string v3, ""

    .line 81
    .local v3, "string":Ljava/lang/String;
    const/4 v1, 0x0

    .line 82
    .local v1, "index":I
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 84
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 85
    .local v4, "value":Ljava/lang/String;
    invoke-static {v4}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 87
    const-string v4, ""

    .line 89
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz p1, :cond_4

    invoke-static {v4}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "*"

    const-string v8, "%2A"

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .end local v4    # "value":Ljava/lang/String;
    :cond_4
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 90
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-eq v1, v5, :cond_5

    .line 92
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 94
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 95
    goto :goto_0
.end method

.method public static mapToParsString(Ljava/util/Map;ZZ)Ljava/lang/String;
    .locals 12
    .param p1, "isEncode"    # Z
    .param p2, "isKeySort"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;ZZ)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 111
    :cond_0
    const/4 v6, 0x0

    .line 134
    :cond_1
    return-object v6

    .line 114
    :cond_2
    const-string v6, ""

    .line 116
    .local v6, "string":Ljava/lang/String;
    const/4 v2, 0x0

    .line 117
    .local v2, "index":I
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/String;

    invoke-interface {v8, v9}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    .line 118
    .local v4, "keyArray":[Ljava/lang/String;
    invoke-static {v4}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 119
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v5, :cond_1

    aget-object v3, v0, v1

    .line 121
    .local v3, "key":Ljava/lang/String;
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 122
    .local v7, "value":Ljava/lang/String;
    invoke-static {v7}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 124
    const-string v7, ""

    .line 126
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz p1, :cond_4

    invoke-static {v7}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "*"

    const-string v11, "%2A"

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    .end local v7    # "value":Ljava/lang/String;
    :cond_4
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 127
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-eq v2, v8, :cond_5

    .line 129
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "&"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 131
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 119
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static parsStringToMap(Ljava/lang/String;Z)Ljava/util/HashMap;
    .locals 13
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "isDecode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    .line 27
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    if-gtz v10, :cond_2

    .line 29
    :cond_0
    const/4 v6, 0x0

    .line 63
    :cond_1
    :goto_0
    return-object v6

    .line 32
    :cond_2
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 35
    .local v6, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    const-string v10, "&"

    invoke-virtual {p0, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 36
    .local v4, "keyValues":[Ljava/lang/String;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v5, :cond_1

    aget-object v8, v0, v2

    .line 38
    .local v8, "string":Ljava/lang/String;
    const-string v10, "="

    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 39
    .local v7, "str":[Ljava/lang/String;
    array-length v10, v7

    if-ne v10, v12, :cond_3

    .line 41
    const/4 v10, 0x0

    aget-object v3, v7, v10

    .line 42
    .local v3, "key":Ljava/lang/String;
    const-string v10, ""

    invoke-virtual {v6, v3, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .end local v3    # "key":Ljava/lang/String;
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 44
    :cond_3
    array-length v10, v7

    const/4 v11, 0x2

    if-ne v10, v11, :cond_6

    .line 46
    const/4 v10, 0x0

    aget-object v3, v7, v10

    .line 47
    .restart local v3    # "key":Ljava/lang/String;
    const/4 v10, 0x1

    aget-object v9, v7, v10

    .line 48
    .local v9, "value":Ljava/lang/String;
    invoke-static {v9}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    const-string v9, ""

    .end local v9    # "value":Ljava/lang/String;
    :cond_4
    :goto_3
    invoke-virtual {v6, v3, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 56
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keyValues":[Ljava/lang/String;
    .end local v5    # "len$":I
    .end local v7    # "str":[Ljava/lang/String;
    .end local v8    # "string":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 59
    .local v1, "e":Ljava/lang/Exception;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "parsStringToMap\u5f02\u5e38\uff0cerror="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 60
    invoke-virtual {v6}, Ljava/util/HashMap;->clear()V

    goto :goto_0

    .line 48
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v2    # "i$":I
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v4    # "keyValues":[Ljava/lang/String;
    .restart local v5    # "len$":I
    .restart local v7    # "str":[Ljava/lang/String;
    .restart local v8    # "string":Ljava/lang/String;
    .restart local v9    # "value":Ljava/lang/String;
    :cond_5
    if-eqz p1, :cond_4

    :try_start_1
    invoke-static {v9}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_3

    .line 52
    .end local v3    # "key":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    :cond_6
    const-string v10, ""

    invoke-virtual {v6, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method
