.class public Lcom/snda/youni/dualsim/impl/SimInfo;
.super Ljava/lang/Object;
.source "SimInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/snda/youni/dualsim/impl/SimInfo$ErrorCode;,
        Lcom/snda/youni/dualsim/impl/SimInfo$SimInfoColumns;
    }
.end annotation


# instance fields
.field public mColor:I

.field public mDataRoaming:I

.field public mDispalyNumberFormat:I

.field public mDisplayName:Ljava/lang/String;

.field public mICCId:Ljava/lang/String;

.field public mNumber:Ljava/lang/String;

.field public mSimId:J

.field public mSlot:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, ""

    iput-object v0, p0, Lcom/snda/youni/dualsim/impl/SimInfo;->mDisplayName:Ljava/lang/String;

    .line 17
    const-string v0, ""

    iput-object v0, p0, Lcom/snda/youni/dualsim/impl/SimInfo;->mNumber:Ljava/lang/String;

    .line 18
    const/4 v0, 0x1

    iput v0, p0, Lcom/snda/youni/dualsim/impl/SimInfo;->mDispalyNumberFormat:I

    .line 20
    const/4 v0, 0x0

    iput v0, p0, Lcom/snda/youni/dualsim/impl/SimInfo;->mDataRoaming:I

    .line 21
    const/4 v0, -0x1

    iput v0, p0, Lcom/snda/youni/dualsim/impl/SimInfo;->mSlot:I

    .line 23
    return-void
.end method

.method private static fromCursor(Landroid/database/Cursor;)Lcom/snda/youni/dualsim/impl/SimInfo;
    .locals 4
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 30
    new-instance v0, Lcom/snda/youni/dualsim/impl/SimInfo;

    invoke-direct {v0}, Lcom/snda/youni/dualsim/impl/SimInfo;-><init>()V

    .line 31
    .local v0, "info":Lcom/snda/youni/dualsim/impl/SimInfo;
    const-string v1, "_id"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/snda/youni/dualsim/impl/SimInfo;->mSimId:J

    .line 32
    const-string v1, "icc_id"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/snda/youni/dualsim/impl/SimInfo;->mICCId:Ljava/lang/String;

    .line 33
    const-string v1, "display_name"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/snda/youni/dualsim/impl/SimInfo;->mDisplayName:Ljava/lang/String;

    .line 34
    const-string v1, "number"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/snda/youni/dualsim/impl/SimInfo;->mNumber:Ljava/lang/String;

    .line 35
    const-string v1, "display_number_format"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/snda/youni/dualsim/impl/SimInfo;->mDispalyNumberFormat:I

    .line 36
    const-string v1, "color"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/snda/youni/dualsim/impl/SimInfo;->mColor:I

    .line 37
    const-string v1, "data_roaming"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/snda/youni/dualsim/impl/SimInfo;->mDataRoaming:I

    .line 38
    const-string v1, "slot"

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/snda/youni/dualsim/impl/SimInfo;->mSlot:I

    .line 43
    return-object v0
.end method

.method public static getAllSIMList(Landroid/content/Context;)Ljava/util/List;
    .locals 9
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/snda/youni/dualsim/impl/SimInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .local v8, "simList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/snda/youni/dualsim/impl/SimInfo;>;"
    const/4 v6, 0x0

    .line 78
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "content://telephony/siminfo"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 79
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 78
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 80
    if-eqz v6, :cond_0

    .line 81
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_2

    .line 88
    :cond_0
    if-eqz v6, :cond_1

    .line 89
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 92
    :cond_1
    :goto_1
    return-object v8

    .line 82
    :cond_2
    :try_start_1
    invoke-static {v6}, Lcom/snda/youni/dualsim/impl/SimInfo;->fromCursor(Landroid/database/Cursor;)Lcom/snda/youni/dualsim/impl/SimInfo;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 85
    :catch_0
    move-exception v7

    .line 86
    .local v7, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 88
    if-eqz v6, :cond_1

    .line 89
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 87
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    .line 88
    if-eqz v6, :cond_3

    .line 89
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 91
    :cond_3
    throw v0
.end method

.method public static getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;
    .locals 8
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/snda/youni/dualsim/impl/SimInfo;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 52
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .local v7, "simList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/snda/youni/dualsim/impl/SimInfo;>;"
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "content://telephony/siminfo"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 54
    const-string v3, "slot!=-1"

    move-object v4, v2

    move-object v5, v2

    .line 53
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 56
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 57
    :goto_0
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_2

    .line 62
    :cond_0
    if-eqz v6, :cond_1

    .line 63
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 66
    :cond_1
    return-object v7

    .line 58
    :cond_2
    :try_start_1
    invoke-static {v6}, Lcom/snda/youni/dualsim/impl/SimInfo;->fromCursor(Landroid/database/Cursor;)Lcom/snda/youni/dualsim/impl/SimInfo;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 61
    :catchall_0
    move-exception v0

    .line 62
    if-eqz v6, :cond_3

    .line 63
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 65
    :cond_3
    throw v0
.end method

.method public static getSlotById(Landroid/content/Context;J)I
    .locals 9
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "SIMId"    # J

    .prologue
    const/4 v5, 0x0

    const/4 v7, -0x1

    const/4 v3, 0x0

    .line 195
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_1

    move v0, v7

    .line 209
    :cond_0
    :goto_0
    return v0

    .line 196
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/snda/youni/dualsim/impl/SimInfo$SimInfoColumns;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 197
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "slot"

    aput-object v4, v2, v5

    move-object v4, v3

    move-object v5, v3

    .line 196
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 199
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_3

    .line 200
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 201
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 205
    if-eqz v6, :cond_0

    .line 206
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 204
    :catchall_0
    move-exception v0

    .line 205
    if-eqz v6, :cond_2

    .line 206
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 208
    :cond_2
    throw v0

    .line 205
    :cond_3
    if-eqz v6, :cond_4

    .line 206
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    move v0, v7

    .line 209
    goto :goto_0
.end method
