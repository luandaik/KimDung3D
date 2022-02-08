.class final Lcom/unionpay/sdk/t$c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unionpay/sdk/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "c"
.end annotation


# static fields
.field static final a:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "error_time"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "message"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "repeat"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "shorthashcode"

    aput-object v2, v0, v1

    sput-object v0, Lcom/unionpay/sdk/t$c;->a:[Ljava/lang/String;

    return-void
.end method

.method static final a(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "CREATE TABLE error_report (_id INTEGER PRIMARY KEY autoincrement,error_time LONG,message BLOB,repeat INTERGER,shorthashcode TEXT)"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method static final b(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string v0, "DROP TABLE IF EXISTS error_report"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method
