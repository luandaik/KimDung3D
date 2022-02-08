.class public Lcom/heitao/request/cache/HTRequestCacheManager;
.super Ljava/lang/Object;
.source "HTRequestCacheManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/request/cache/HTRequestCacheManager$3;
    }
.end annotation


# static fields
.field private static mInstance:Lcom/heitao/request/cache/HTRequestCacheManager;


# instance fields
.field private final DB_NAME:Ljava/lang/String;

.field private final DB_VERSION:I

.field private final MAX_RETRY_COUNT:I

.field private final TBL_HISTORY:Ljava/lang/String;

.field private mLogContent:Ljava/lang/String;

.field private final mLogFilePath:Ljava/lang/String;

.field private mRequestCaches:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/heitao/request/cache/HTRequestCache;",
            ">;"
        }
    .end annotation
.end field

.field private mRequestedCaches:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/heitao/request/cache/HTRequestCache;",
            ">;"
        }
    .end annotation
.end field

.field private mSQLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-string v1, "ht_game_proxy_request_cache.db"

    iput-object v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->DB_NAME:Ljava/lang/String;

    .line 39
    const/4 v1, 0x1

    iput v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->DB_VERSION:I

    .line 42
    const-string v1, "history"

    iput-object v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->TBL_HISTORY:Ljava/lang/String;

    .line 44
    const/16 v1, 0xa

    iput v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->MAX_RETRY_COUNT:I

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/HTSpadeSDK/log/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogFilePath:Ljava/lang/String;

    .line 213
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    .line 214
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestedCaches:Ljava/util/List;

    .line 216
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogFilePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 217
    .local v0, "destDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 219
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 222
    :cond_0
    const-string v1, ""

    iput-object v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogContent:Ljava/lang/String;

    .line 223
    return-void
.end method

.method static synthetic access$000(Lcom/heitao/request/cache/HTRequestCacheManager;Lcom/heitao/model/HTError;Lcom/heitao/request/cache/HTRequestCache;)V
    .locals 0
    .param p0, "x0"    # Lcom/heitao/request/cache/HTRequestCacheManager;
    .param p1, "x1"    # Lcom/heitao/model/HTError;
    .param p2, "x2"    # Lcom/heitao/request/cache/HTRequestCache;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/heitao/request/cache/HTRequestCacheManager;->doRequestFinish(Lcom/heitao/model/HTError;Lcom/heitao/request/cache/HTRequestCache;)V

    return-void
.end method

.method private doRequestFinish(Lcom/heitao/model/HTError;Lcom/heitao/request/cache/HTRequestCache;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;
    .param p2, "requestCache"    # Lcom/heitao/request/cache/HTRequestCache;

    .prologue
    .line 134
    invoke-direct {p0, p2}, Lcom/heitao/request/cache/HTRequestCacheManager;->removeFromRequestCaches(Lcom/heitao/request/cache/HTRequestCache;)V

    .line 136
    if-nez p1, :cond_0

    .line 138
    invoke-virtual {p2}, Lcom/heitao/request/cache/HTRequestCache;->getReqId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/heitao/request/cache/HTRequestCacheManager;->remove(Ljava/lang/String;)Z

    .line 157
    :goto_0
    invoke-virtual {p0}, Lcom/heitao/request/cache/HTRequestCacheManager;->start()V

    .line 158
    return-void

    .line 142
    :cond_0
    invoke-virtual {p2}, Lcom/heitao/request/cache/HTRequestCache;->getRetryCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p2, v0}, Lcom/heitao/request/cache/HTRequestCache;->setRetryCount(I)V

    .line 143
    const/16 v0, 0xa

    invoke-virtual {p2}, Lcom/heitao/request/cache/HTRequestCache;->getRetryCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 145
    invoke-virtual {p2}, Lcom/heitao/request/cache/HTRequestCache;->getReqId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/heitao/request/cache/HTRequestCacheManager;->remove(Ljava/lang/String;)Z

    .line 152
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u8bf7\u6c42\u5931\u8d25\uff0cerror:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/heitao/model/HTError;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " requestCache:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/heitao/request/cache/HTRequestCache;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 154
    invoke-direct {p0, p1, p2}, Lcom/heitao/request/cache/HTRequestCacheManager;->writeToLog(Lcom/heitao/model/HTError;Lcom/heitao/request/cache/HTRequestCache;)V

    goto :goto_0

    .line 149
    :cond_1
    invoke-direct {p0, p2}, Lcom/heitao/request/cache/HTRequestCacheManager;->updateRetryCount(Lcom/heitao/request/cache/HTRequestCache;)Z

    goto :goto_1
.end method

.method public static getInstance()Lcom/heitao/request/cache/HTRequestCacheManager;
    .locals 1

    .prologue
    .line 227
    sget-object v0, Lcom/heitao/request/cache/HTRequestCacheManager;->mInstance:Lcom/heitao/request/cache/HTRequestCacheManager;

    if-nez v0, :cond_0

    .line 229
    new-instance v0, Lcom/heitao/request/cache/HTRequestCacheManager;

    invoke-direct {v0}, Lcom/heitao/request/cache/HTRequestCacheManager;-><init>()V

    sput-object v0, Lcom/heitao/request/cache/HTRequestCacheManager;->mInstance:Lcom/heitao/request/cache/HTRequestCacheManager;

    .line 232
    :cond_0
    sget-object v0, Lcom/heitao/request/cache/HTRequestCacheManager;->mInstance:Lcom/heitao/request/cache/HTRequestCacheManager;

    return-object v0
.end method

.method private isExist(Ljava/lang/String;)Z
    .locals 9
    .param p1, "reqId"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 63
    invoke-direct {p0}, Lcom/heitao/request/cache/HTRequestCacheManager;->isValidDataBase()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 65
    iget-object v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mSQLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 66
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "history"

    new-array v2, v4, [Ljava/lang/String;

    const-string v3, "req_id"

    aput-object v3, v2, v6

    const-string v3, "req_id = ?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object p1, v4, v6

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 67
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    .line 70
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return v1

    :cond_0
    move v1, v6

    goto :goto_0
.end method

.method private isValidDataBase()Z
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mSQLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mSQLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-nez v0, :cond_1

    .line 55
    :cond_0
    const-string v0, "HTRequestCacheManager \u672a\u521d\u59cb\u5316"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 56
    const/4 v0, 0x0

    .line 58
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private refreshCache()V
    .locals 7

    .prologue
    .line 108
    iget-object v5, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 110
    invoke-virtual {p0}, Lcom/heitao/request/cache/HTRequestCacheManager;->getRequestCaches()Ljava/util/List;

    move-result-object v2

    .line 111
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/request/cache/HTRequestCache;>;"
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_0

    .line 113
    iget-object v5, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestedCaches:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 115
    iput-object v2, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    .line 130
    :cond_0
    return-void

    .line 119
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/heitao/request/cache/HTRequestCache;

    .line 121
    .local v3, "requestCache":Lcom/heitao/request/cache/HTRequestCache;
    iget-object v5, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestedCaches:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/heitao/request/cache/HTRequestCache;

    .line 123
    .local v4, "requestedCache":Lcom/heitao/request/cache/HTRequestCache;
    invoke-virtual {v3}, Lcom/heitao/request/cache/HTRequestCache;->getReqId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/heitao/request/cache/HTRequestCache;->getReqId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 125
    iget-object v5, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private removeFromRequestCaches(Lcom/heitao/request/cache/HTRequestCache;)V
    .locals 4
    .param p1, "requestCache"    # Lcom/heitao/request/cache/HTRequestCache;

    .prologue
    .line 90
    iget-object v2, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 104
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    iget-object v2, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/heitao/request/cache/HTRequestCache;

    .line 97
    .local v1, "item":Lcom/heitao/request/cache/HTRequestCache;
    invoke-virtual {p1}, Lcom/heitao/request/cache/HTRequestCache;->getReqId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/heitao/request/cache/HTRequestCache;->getReqId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 99
    iget-object v2, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestedCaches:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    iget-object v2, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private updateRetryCount(Lcom/heitao/request/cache/HTRequestCache;)Z
    .locals 8
    .param p1, "requestCache"    # Lcom/heitao/request/cache/HTRequestCache;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 75
    invoke-direct {p0}, Lcom/heitao/request/cache/HTRequestCacheManager;->isValidDataBase()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 77
    iget-object v4, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mSQLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 79
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 80
    .local v0, "contentValues":Landroid/content/ContentValues;
    const-string v4, "retry_count"

    invoke-virtual {p1}, Lcom/heitao/request/cache/HTRequestCache;->getRetryCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 82
    const-string v4, "history"

    const-string v5, "req_id = ?"

    new-array v6, v2, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/heitao/request/cache/HTRequestCache;->getReqId()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-virtual {v1, v4, v0, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 85
    .end local v0    # "contentValues":Landroid/content/ContentValues;
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    return v2

    .restart local v0    # "contentValues":Landroid/content/ContentValues;
    .restart local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_0
    move v2, v3

    .line 82
    goto :goto_0

    .end local v0    # "contentValues":Landroid/content/ContentValues;
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_1
    move v2, v3

    .line 85
    goto :goto_0
.end method

.method private writeToLog(Lcom/heitao/model/HTError;Lcom/heitao/request/cache/HTRequestCache;)V
    .locals 10
    .param p1, "error"    # Lcom/heitao/model/HTError;
    .param p2, "requestCache"    # Lcom/heitao/request/cache/HTRequestCache;

    .prologue
    .line 162
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "requestCache:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p2}, Lcom/heitao/request/cache/HTRequestCache;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 163
    .local v4, "log":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "error:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Lcom/heitao/model/HTError;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 164
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "date:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 166
    iget-object v7, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogContent:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 168
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogContent:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogContent:Ljava/lang/String;

    .line 169
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogContent:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogContent:Ljava/lang/String;

    .line 176
    :goto_0
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v7, "yyyy-MM-dd"

    invoke-direct {v2, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 177
    .local v2, "format":Ljava/text/SimpleDateFormat;
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 179
    .local v0, "day":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogFilePath:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "_network_error.txt"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 182
    .local v6, "logSavePath":Ljava/lang/String;
    :try_start_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 183
    .local v5, "logFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    .line 185
    invoke-virtual {v5}, Ljava/io/File;->createNewFile()Z

    .line 188
    :cond_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 189
    .local v3, "fos":Ljava/io/FileOutputStream;
    iget-object v7, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogContent:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/io/FileOutputStream;->write([B)V

    .line 190
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V

    .line 191
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 193
    const-string v7, "\u5199\u5165\u7f51\u7edc\u9519\u8bef\u65e5\u5fd7\u6210\u529f"

    invoke-static {v7}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 209
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .end local v5    # "logFile":Ljava/io/File;
    :goto_1
    return-void

    .line 173
    .end local v0    # "day":Ljava/lang/String;
    .end local v2    # "format":Ljava/text/SimpleDateFormat;
    .end local v6    # "logSavePath":Ljava/lang/String;
    :cond_1
    iput-object v4, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mLogContent:Ljava/lang/String;

    goto :goto_0

    .line 195
    .restart local v0    # "day":Ljava/lang/String;
    .restart local v2    # "format":Ljava/text/SimpleDateFormat;
    .restart local v6    # "logSavePath":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 198
    .local v1, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 200
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u5199\u5165\u7f51\u7edc\u9519\u8bef\u65e5\u5fd7\u5f02\u5e38(FileNotFoundException)\uff0c"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_1

    .line 202
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v1

    .line 205
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 207
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u5199\u5165\u7f51\u7edc\u9519\u8bef\u65e5\u5fd7\u5f02\u5e38(IOException)\uff0c"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_1
.end method


# virtual methods
.method public add(Ljava/lang/String;Lcom/heitao/request/cache/HTRequestCache$HttpMode;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 8
    .param p1, "reqId"    # Ljava/lang/String;
    .param p2, "mode"    # Lcom/heitao/request/cache/HTRequestCache$HttpMode;
    .param p3, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/heitao/request/cache/HTRequestCache$HttpMode;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p4, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 258
    invoke-direct {p0}, Lcom/heitao/request/cache/HTRequestCacheManager;->isValidDataBase()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 260
    invoke-virtual {p0, p1}, Lcom/heitao/request/cache/HTRequestCacheManager;->remove(Ljava/lang/String;)Z

    .line 262
    iget-object v3, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mSQLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 264
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 265
    .local v0, "contentValues":Landroid/content/ContentValues;
    const-string v3, "req_id"

    invoke-virtual {v0, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    const-string v3, "http_mode"

    invoke-static {p2}, Lcom/heitao/request/cache/HTRequestCache;->httpModeToInt(Lcom/heitao/request/cache/HTRequestCache$HttpMode;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 267
    const-string v3, "url"

    invoke-virtual {v0, v3, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    const-string v4, "params"

    if-eqz p4, :cond_2

    invoke-static {p4, v2}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v3

    :goto_0
    invoke-virtual {v0, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    const-string v3, "retry_count"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 271
    const-string v3, "history"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    .line 272
    .local v2, "result":Z
    :cond_0
    if-eqz v2, :cond_1

    .line 274
    invoke-direct {p0}, Lcom/heitao/request/cache/HTRequestCacheManager;->refreshCache()V

    .line 279
    .end local v0    # "contentValues":Landroid/content/ContentValues;
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v2    # "result":Z
    :cond_1
    return v2

    .line 268
    .restart local v0    # "contentValues":Landroid/content/ContentValues;
    .restart local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_2
    const-string v3, ""

    goto :goto_0
.end method

.method public getRequestCaches()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/heitao/request/cache/HTRequestCache;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v2, 0x0

    .line 298
    invoke-direct {p0}, Lcom/heitao/request/cache/HTRequestCacheManager;->isValidDataBase()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 300
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 302
    .local v9, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/request/cache/HTRequestCache;>;"
    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mSQLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "history"

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 303
    .local v8, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 305
    new-instance v10, Lcom/heitao/request/cache/HTRequestCache;

    invoke-direct {v10}, Lcom/heitao/request/cache/HTRequestCache;-><init>()V

    .line 306
    .local v10, "requestCache":Lcom/heitao/request/cache/HTRequestCache;
    invoke-interface {v8, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/heitao/request/cache/HTRequestCache;->setReqId(Ljava/lang/String;)V

    .line 307
    const/4 v0, 0x1

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Lcom/heitao/request/cache/HTRequestCache;->intToHttpMode(I)Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/heitao/request/cache/HTRequestCache;->setHttpMode(Lcom/heitao/request/cache/HTRequestCache$HttpMode;)V

    .line 308
    const/4 v0, 0x2

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/heitao/request/cache/HTRequestCache;->setUrl(Ljava/lang/String;)V

    .line 309
    const/4 v0, 0x3

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v11}, Lcom/heitao/common/HTUtils;->parsStringToMap(Ljava/lang/String;Z)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/heitao/request/cache/HTRequestCache;->setParams(Ljava/util/Map;)V

    .line 310
    const/4 v0, 0x4

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {v10, v0}, Lcom/heitao/request/cache/HTRequestCache;->setRetryCount(I)V

    .line 312
    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v9    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/request/cache/HTRequestCache;>;"
    .end local v10    # "requestCache":Lcom/heitao/request/cache/HTRequestCache;
    :cond_0
    move-object v9, v2

    .line 318
    :cond_1
    return-object v9
.end method

.method public init(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 237
    new-instance v0, Lcom/heitao/request/cache/HTRequestCacheManager$1;

    const-string v3, "ht_game_proxy_request_cache.db"

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/heitao/request/cache/HTRequestCacheManager$1;-><init>(Lcom/heitao/request/cache/HTRequestCacheManager;Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    iput-object v0, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mSQLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 254
    return-void
.end method

.method public remove(Ljava/lang/String;)Z
    .locals 6
    .param p1, "reqId"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 284
    invoke-direct {p0}, Lcom/heitao/request/cache/HTRequestCacheManager;->isValidDataBase()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 286
    iget-object v3, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mSQLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 287
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-direct {p0, p1}, Lcom/heitao/request/cache/HTRequestCacheManager;->isExist(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 289
    const-string v3, "history"

    const-string v4, "req_id = ?"

    new-array v5, v1, [Ljava/lang/String;

    aput-object p1, v5, v2

    invoke-virtual {v0, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 293
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    return v1

    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_0
    move v1, v2

    .line 289
    goto :goto_0

    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_1
    move v1, v2

    .line 293
    goto :goto_0
.end method

.method public retry(Lcom/heitao/request/cache/HTRequestCache;)V
    .locals 4
    .param p1, "requestCache"    # Lcom/heitao/request/cache/HTRequestCache;

    .prologue
    const/4 v2, 0x0

    .line 323
    new-instance v1, Lcom/heitao/request/HTRequest;

    invoke-direct {v1}, Lcom/heitao/request/HTRequest;-><init>()V

    .line 324
    .local v1, "request":Lcom/heitao/request/HTRequest;
    invoke-virtual {v1, v2}, Lcom/heitao/request/HTRequest;->setAddPubPars(Z)V

    .line 325
    invoke-virtual {v1, v2}, Lcom/heitao/request/HTRequest;->setShowProgressDialog(Z)V

    .line 327
    new-instance v0, Lcom/heitao/request/cache/HTRequestCacheManager$2;

    invoke-direct {v0, p0, p1}, Lcom/heitao/request/cache/HTRequestCacheManager$2;-><init>(Lcom/heitao/request/cache/HTRequestCacheManager;Lcom/heitao/request/cache/HTRequestCache;)V

    .line 364
    .local v0, "listener":Lcom/heitao/listener/HTRequestListener;
    sget-object v2, Lcom/heitao/request/cache/HTRequestCacheManager$3;->$SwitchMap$com$heitao$request$cache$HTRequestCache$HttpMode:[I

    invoke-virtual {p1}, Lcom/heitao/request/cache/HTRequestCache;->getHttpMode()Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 378
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "retry:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/heitao/request/cache/HTRequestCache;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 379
    return-void

    .line 368
    :pswitch_0
    invoke-virtual {p1}, Lcom/heitao/request/cache/HTRequestCache;->getUrl()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Lcom/heitao/request/HTRequest;->getWithURL(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V

    goto :goto_0

    .line 372
    :pswitch_1
    invoke-virtual {p1}, Lcom/heitao/request/cache/HTRequestCache;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/heitao/request/cache/HTRequestCache;->getParams()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Lcom/heitao/request/HTRequest;->postWithURL(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V

    goto :goto_0

    .line 364
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public start()V
    .locals 2

    .prologue
    .line 383
    invoke-direct {p0}, Lcom/heitao/request/cache/HTRequestCacheManager;->refreshCache()V

    .line 385
    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 387
    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/request/cache/HTRequestCache;

    invoke-virtual {p0, v0}, Lcom/heitao/request/cache/HTRequestCacheManager;->retry(Lcom/heitao/request/cache/HTRequestCache;)V

    .line 390
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "request cache count:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/request/cache/HTRequestCacheManager;->mRequestCaches:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    .line 391
    return-void
.end method
