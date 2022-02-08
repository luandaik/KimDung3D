.class Lcom/heitao/request/cache/HTRequestCacheManager$1;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "HTRequestCacheManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/cache/HTRequestCacheManager;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/cache/HTRequestCacheManager;


# direct methods
.method constructor <init>(Lcom/heitao/request/cache/HTRequestCacheManager;Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 0
    .param p2, "x0"    # Landroid/content/Context;
    .param p3, "x1"    # Ljava/lang/String;
    .param p4, "x2"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p5, "x3"    # I

    .prologue
    .line 238
    iput-object p1, p0, Lcom/heitao/request/cache/HTRequestCacheManager$1;->this$0:Lcom/heitao/request/cache/HTRequestCacheManager;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 246
    const-string v0, "CREATE TABLE IF NOT EXISTS history (req_id CHAR(30), http_mode INTEGER, url TEXT, params TEXT, retry_count INTEGER)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 252
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 240
    return-void
.end method
