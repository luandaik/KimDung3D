.class final Lcom/unionpay/sdk/t$a;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# static fields
.field static final a:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "name"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "start_time"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "duration"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "session_id"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "refer"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "realtime"

    aput-object v2, v0, v1

    sput-object v0, Lcom/unionpay/sdk/t$a;->a:[Ljava/lang/String;

    return-void
.end method

.method static final a(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "CREATE TABLE activity (_id INTEGER PRIMARY KEY autoincrement,name TEXT,start_time LONG,duration INTEGER,session_id TEXT,refer TEXT,realtime LONG)"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method static final b(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "DROP TABLE IF EXISTS activity"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method
