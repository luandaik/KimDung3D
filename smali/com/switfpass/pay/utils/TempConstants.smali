.class public Lcom/switfpass/pay/utils/TempConstants;
.super Ljava/lang/Object;


# static fields
.field public static strTotalMoney:Ljava/lang/String;

.field public static tvOrderNo:Ljava/lang/String;

.field public static tvOrderTime:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/switfpass/pay/utils/TempConstants;->strTotalMoney:Ljava/lang/String;

    sput-object v0, Lcom/switfpass/pay/utils/TempConstants;->tvOrderTime:Ljava/lang/String;

    sput-object v0, Lcom/switfpass/pay/utils/TempConstants;->tvOrderNo:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
