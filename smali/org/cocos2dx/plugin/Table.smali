.class public Lorg/cocos2dx/plugin/Table;
.super Ljava/lang/Object;
.source "Table.java"


# static fields
.field public static final CHARSET_UTF_8:Ljava/lang/String; = "UTF-8"


# instance fields
.field private mTab:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/util/Hashtable;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "hashtable":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v5, Ljava/util/Hashtable;

    invoke-direct {v5}, Ljava/util/Hashtable;-><init>()V

    iput-object v5, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    .line 32
    invoke-virtual {p1}, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 34
    .local v1, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 36
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 37
    .local v3, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 38
    .local v4, "value":Ljava/lang/String;
    iget-object v5, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v5, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 40
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static deserialize(Ljava/lang/String;)Lorg/cocos2dx/plugin/Table;
    .locals 17
    .param p0, "tabStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 186
    if-eqz p0, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v14

    const/4 v15, 0x1

    if-ge v14, v15, :cond_2

    .line 187
    :cond_0
    const/4 v10, 0x0

    .line 217
    :cond_1
    return-object v10

    .line 189
    :cond_2
    new-instance v10, Lorg/cocos2dx/plugin/Table;

    invoke-direct {v10}, Lorg/cocos2dx/plugin/Table;-><init>()V

    .line 190
    .local v10, "table":Lorg/cocos2dx/plugin/Table;
    const-string v14, "UTF-8"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 191
    .local v1, "bytes":[B
    const/4 v3, 0x0

    .line 192
    .local v3, "index":I
    new-instance v14, Ljava/lang/String;

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "index":I
    .local v4, "index":I
    invoke-static {v1, v3, v4}, Lorg/cocos2dx/plugin/Table;->subBytes([BII)[B

    move-result-object v15

    const-string v16, "UTF-8"

    invoke-direct/range {v14 .. v16}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 194
    .local v9, "sizeLength":I
    new-instance v14, Ljava/lang/String;

    add-int/lit8 v3, v9, 0x1

    .end local v4    # "index":I
    .restart local v3    # "index":I
    invoke-static {v1, v4, v3}, Lorg/cocos2dx/plugin/Table;->subBytes([BII)[B

    move-result-object v15

    const-string v16, "UTF-8"

    invoke-direct/range {v14 .. v16}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 196
    .local v8, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    move v4, v3

    .end local v3    # "index":I
    .restart local v4    # "index":I
    :goto_0
    if-ge v2, v8, :cond_1

    .line 198
    array-length v14, v1

    if-ge v4, v14, :cond_3

    .line 200
    new-instance v14, Ljava/lang/String;

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "index":I
    .restart local v3    # "index":I
    invoke-static {v1, v4, v3}, Lorg/cocos2dx/plugin/Table;->subBytes([BII)[B

    move-result-object v15

    const-string v16, "UTF-8"

    invoke-direct/range {v14 .. v16}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 202
    .local v7, "keyLengthLen":I
    new-instance v14, Ljava/lang/String;

    add-int v4, v3, v7

    .end local v3    # "index":I
    .restart local v4    # "index":I
    invoke-static {v1, v3, v4}, Lorg/cocos2dx/plugin/Table;->subBytes([BII)[B

    move-result-object v15

    const-string v16, "UTF-8"

    invoke-direct/range {v14 .. v16}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 204
    .local v6, "keyLength":I
    new-instance v14, Ljava/lang/String;

    add-int v3, v4, v6

    .end local v4    # "index":I
    .restart local v3    # "index":I
    invoke-static {v1, v4, v3}, Lorg/cocos2dx/plugin/Table;->subBytes([BII)[B

    move-result-object v15

    const-string v16, "UTF-8"

    invoke-direct/range {v14 .. v16}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 207
    .local v5, "key":Ljava/lang/String;
    new-instance v14, Ljava/lang/String;

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "index":I
    .restart local v4    # "index":I
    invoke-static {v1, v3, v4}, Lorg/cocos2dx/plugin/Table;->subBytes([BII)[B

    move-result-object v15

    const-string v16, "UTF-8"

    invoke-direct/range {v14 .. v16}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v13

    .line 209
    .local v13, "valueLengthLen":I
    new-instance v14, Ljava/lang/String;

    add-int v3, v4, v13

    .end local v4    # "index":I
    .restart local v3    # "index":I
    invoke-static {v1, v4, v3}, Lorg/cocos2dx/plugin/Table;->subBytes([BII)[B

    move-result-object v15

    const-string v16, "UTF-8"

    invoke-direct/range {v14 .. v16}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 211
    .local v12, "valueLength":I
    new-instance v14, Ljava/lang/String;

    add-int v4, v3, v12

    .end local v3    # "index":I
    .restart local v4    # "index":I
    invoke-static {v1, v3, v4}, Lorg/cocos2dx/plugin/Table;->subBytes([BII)[B

    move-result-object v15

    const-string v16, "UTF-8"

    invoke-direct/range {v14 .. v16}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 213
    .local v11, "value":Ljava/lang/String;
    invoke-virtual {v10, v5, v11}, Lorg/cocos2dx/plugin/Table;->put(Ljava/lang/String;Ljava/lang/String;)V

    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "keyLength":I
    .end local v7    # "keyLengthLen":I
    .end local v11    # "value":Ljava/lang/String;
    .end local v12    # "valueLength":I
    .end local v13    # "valueLengthLen":I
    :cond_3
    move v3, v4

    .line 196
    .end local v4    # "index":I
    .restart local v3    # "index":I
    add-int/lit8 v2, v2, 0x1

    move v4, v3

    .end local v3    # "index":I
    .restart local v4    # "index":I
    goto/16 :goto_0
.end method

.method public static subBytes([BII)[B
    .locals 4
    .param p0, "bytes"    # [B
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 221
    sub-int v0, p2, p1

    .line 222
    .local v0, "count":I
    new-array v2, v0, [B

    .line 223
    .local v2, "tempBytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 224
    add-int v3, p1, v1

    aget-byte v3, p0, v3

    aput-byte v3, v2, v1

    .line 223
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 227
    :cond_0
    return-object v2
.end method


# virtual methods
.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/String;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 78
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public elements()Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 102
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    return-void
.end method

.method public remove(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public serialize()Ljava/lang/String;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-virtual {p0}, Lorg/cocos2dx/plugin/Table;->size()I

    move-result v12

    if-gtz v12, :cond_0

    .line 138
    const-string v12, ""

    .line 175
    :goto_0
    return-object v12

    .line 141
    :cond_0
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 142
    .local v6, "serializeTab":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/cocos2dx/plugin/Table;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 144
    .local v1, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {p0}, Lorg/cocos2dx/plugin/Table;->size()I

    move-result v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    .line 145
    .local v7, "size":Ljava/lang/String;
    const-string v12, "UTF-8"

    invoke-virtual {v7, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    array-length v12, v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    .line 147
    .local v8, "sizeLength":Ljava/lang/String;
    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 149
    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 151
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 153
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 155
    .local v3, "key":Ljava/lang/String;
    const-string v12, "UTF-8"

    invoke-virtual {v3, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    array-length v4, v12

    .line 157
    .local v4, "keyLength":I
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "UTF-8"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    array-length v5, v12

    .line 159
    .local v5, "keyLengthLen":I
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 161
    .local v9, "value":Ljava/lang/String;
    const-string v12, "UTF-8"

    invoke-virtual {v9, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    array-length v10, v12

    .line 163
    .local v10, "valueLength":I
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "UTF-8"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    array-length v11, v12

    .line 165
    .local v11, "valueLengthLen":I
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 166
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 167
    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 169
    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 171
    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 175
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keyLength":I
    .end local v5    # "keyLengthLen":I
    .end local v9    # "value":Ljava/lang/String;
    .end local v10    # "valueLength":I
    .end local v11    # "valueLengthLen":I
    :cond_1
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lorg/cocos2dx/plugin/Table;->mTab:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
