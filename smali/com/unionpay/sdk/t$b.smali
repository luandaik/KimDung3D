.class final Lcom/unionpay/sdk/t$b;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "b"
.end annotation


# static fields
.field static final a:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "event_id"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "event_label"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "session_id"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "occurtime"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "paramap"

    aput-object v2, v0, v1

    sput-object v0, Lcom/unionpay/sdk/t$b;->a:[Ljava/lang/String;

    return-void
.end method

.method static final a(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "CREATE TABLE app_event (_id INTEGER PRIMARY KEY autoincrement,event_id TEXT,event_label TEXT,session_id TEXT,occurtime LONG,paramap BLOB)"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method static final b(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "DROP TABLE IF EXISTS app_event"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method
