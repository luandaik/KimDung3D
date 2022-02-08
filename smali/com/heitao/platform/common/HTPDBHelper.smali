.class public Lcom/heitao/platform/common/HTPDBHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "HTPDBHelper.java"


# static fields
.field private static final DB_NAME:Ljava/lang/String; = "ht_platform_sdk.db"

.field private static final DB_VERSION:I = 0x2

.field private static mInstance:Lcom/heitao/platform/common/HTPDBHelper;


# instance fields
.field private final TABLE_USER:Ljava/lang/String;

.field private mDatabase:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/common/HTPDBHelper;->mInstance:Lcom/heitao/platform/common/HTPDBHelper;

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 26
    const-string v0, "ht_platform_sdk.db"

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v2, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 20
    const-string v0, "user"

    iput-object v0, p0, Lcom/heitao/platform/common/HTPDBHelper;->TABLE_USER:Ljava/lang/String;

    .line 22
    iput-object v2, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 27
    return-void
.end method

.method public static getInstance()Lcom/heitao/platform/common/HTPDBHelper;
    .locals 2

    .prologue
    .line 55
    sget-object v0, Lcom/heitao/platform/common/HTPDBHelper;->mInstance:Lcom/heitao/platform/common/HTPDBHelper;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Lcom/heitao/platform/common/HTPDBHelper;

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/heitao/platform/common/HTPDBHelper;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/heitao/platform/common/HTPDBHelper;->mInstance:Lcom/heitao/platform/common/HTPDBHelper;

    .line 60
    :cond_0
    sget-object v0, Lcom/heitao/platform/common/HTPDBHelper;->mInstance:Lcom/heitao/platform/common/HTPDBHelper;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 182
    :cond_0
    return-void
.end method

.method public delete(Lcom/heitao/platform/model/HTPDBUser;)I
    .locals 6
    .param p1, "user"    # Lcom/heitao/platform/model/HTPDBUser;

    .prologue
    .line 77
    sget-object v0, Lcom/heitao/platform/common/HTPDBHelper;->mInstance:Lcom/heitao/platform/common/HTPDBHelper;

    invoke-virtual {v0}, Lcom/heitao/platform/common/HTPDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 78
    iget-object v0, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "user"

    const-string v2, "user_name = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p1, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public isExist(Lcom/heitao/platform/model/HTPDBUser;)Z
    .locals 10
    .param p1, "user"    # Lcom/heitao/platform/model/HTPDBUser;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 66
    :try_start_0
    sget-object v0, Lcom/heitao/platform/common/HTPDBHelper;->mInstance:Lcom/heitao/platform/common/HTPDBHelper;

    invoke-virtual {v0}, Lcom/heitao/platform/common/HTPDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    iget-object v0, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "user"

    new-array v2, v4, [Ljava/lang/String;

    const-string v3, "user_name"

    aput-object v3, v2, v6

    const-string v3, "user_name = ?"

    new-array v4, v4, [Ljava/lang/String;

    iget-object v7, p1, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    aput-object v7, v4, v6

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 72
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return v0

    .line 67
    :catch_0
    move-exception v9

    .line 68
    .local v9, "e":Ljava/lang/Exception;
    const-string v0, "isExist error: get readable Database error"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    move v0, v6

    .line 69
    goto :goto_0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 33
    const-string v0, "CREATE TABLE IF NOT EXISTS user (user_id CHAR(20), user_name CHAR(50), password CHAR(20),ltime CHAR(32),token CHAR(64),mobile CHAR(32))"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 45
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    const/4 v0, 0x2

    if-ne p3, v0, :cond_0

    .line 46
    const-string v0, "ALTER TABLE user ADD COLUMN ltime CHAR(32)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 47
    const-string v0, "ALTER TABLE user ADD COLUMN token CHAR(64)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 48
    const-string v0, "ALTER TABLE user ADD COLUMN mobile CHAR(32)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 49
    const-string v0, "update ht db sucess!"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 51
    :cond_0
    return-void
.end method

.method public query()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/heitao/platform/model/HTPDBUser;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 108
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .local v10, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    :try_start_0
    sget-object v0, Lcom/heitao/platform/common/HTPDBHelper;->mInstance:Lcom/heitao/platform/common/HTPDBHelper;

    invoke-virtual {v0}, Lcom/heitao/platform/common/HTPDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    iget-object v0, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "user"

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 117
    .local v8, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 129
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v10    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    :goto_1
    return-object v10

    .line 111
    .restart local v10    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    :catch_0
    move-exception v9

    .line 112
    .local v9, "e":Ljava/lang/Exception;
    const-string v0, "query error: getReadableDatabase"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    move-object v10, v2

    .line 113
    goto :goto_1

    .line 119
    .end local v9    # "e":Ljava/lang/Exception;
    .restart local v8    # "cursor":Landroid/database/Cursor;
    :cond_0
    new-instance v11, Lcom/heitao/platform/model/HTPDBUser;

    invoke-direct {v11}, Lcom/heitao/platform/model/HTPDBUser;-><init>()V

    .line 120
    .local v11, "user":Lcom/heitao/platform/model/HTPDBUser;
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v11, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    .line 121
    const/4 v0, 0x1

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v11, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    .line 122
    const/4 v0, 0x2

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v11, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    .line 123
    const/4 v0, 0x3

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v11, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    .line 124
    const/4 v0, 0x4

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v11, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    .line 125
    const/4 v0, 0x5

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v11, Lcom/heitao/platform/model/HTPDBUser;->mobile:Ljava/lang/String;

    .line 126
    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public queryWithUserId(Ljava/lang/String;)Lcom/heitao/platform/model/HTPDBUser;
    .locals 6
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 134
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v0, v2

    .line 151
    :goto_0
    return-object v0

    .line 139
    :cond_0
    invoke-virtual {p0}, Lcom/heitao/platform/common/HTPDBHelper;->query()Ljava/util/List;

    move-result-object v1

    .line 140
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 142
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    :cond_2
    move-object v0, v2

    .line 151
    goto :goto_0

    .line 142
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/model/HTPDBUser;

    .line 144
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0
.end method

.method public queryWithUserName(Ljava/lang/String;)Lcom/heitao/platform/model/HTPDBUser;
    .locals 6
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 156
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v0, v2

    .line 173
    :goto_0
    return-object v0

    .line 161
    :cond_0
    invoke-virtual {p0}, Lcom/heitao/platform/common/HTPDBHelper;->query()Ljava/util/List;

    move-result-object v1

    .line 162
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 164
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    :cond_2
    move-object v0, v2

    .line 173
    goto :goto_0

    .line 164
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/model/HTPDBUser;

    .line 166
    .local v0, "dbUser":Lcom/heitao/platform/model/HTPDBUser;
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0
.end method

.method public update(Lcom/heitao/platform/model/HTPDBUser;)V
    .locals 5
    .param p1, "user"    # Lcom/heitao/platform/model/HTPDBUser;

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lcom/heitao/platform/common/HTPDBHelper;->isExist(Lcom/heitao/platform/model/HTPDBUser;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 85
    invoke-virtual {p0, p1}, Lcom/heitao/platform/common/HTPDBHelper;->delete(Lcom/heitao/platform/model/HTPDBUser;)I

    .line 88
    :cond_0
    :try_start_0
    sget-object v2, Lcom/heitao/platform/common/HTPDBHelper;->mInstance:Lcom/heitao/platform/common/HTPDBHelper;

    invoke-virtual {v2}, Lcom/heitao/platform/common/HTPDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    iput-object v2, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 96
    .local v0, "contentValues":Landroid/content/ContentValues;
    const-string v2, "user_id"

    iget-object v3, p1, Lcom/heitao/platform/model/HTPDBUser;->userId:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    const-string v2, "user_name"

    iget-object v3, p1, Lcom/heitao/platform/model/HTPDBUser;->userName:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    const-string v2, "password"

    iget-object v3, p1, Lcom/heitao/platform/model/HTPDBUser;->password:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    const-string v2, "ltime"

    iget-object v3, p1, Lcom/heitao/platform/model/HTPDBUser;->ltime:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    const-string v2, "token"

    iget-object v3, p1, Lcom/heitao/platform/model/HTPDBUser;->ltoken:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    const-string v2, "mobile"

    iget-object v3, p1, Lcom/heitao/platform/model/HTPDBUser;->mobile:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    iget-object v2, p0, Lcom/heitao/platform/common/HTPDBHelper;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "user"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 104
    .end local v0    # "contentValues":Landroid/content/ContentValues;
    :goto_0
    return-void

    .line 89
    :catch_0
    move-exception v1

    .line 90
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "update error: get readable Database error"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method
