.class public Lcom/heitao/platform/common/HTPConsts;
.super Ljava/lang/Object;
.source "HTPConsts.java"


# static fields
.field public static final API_URL:Ljava/lang/String; = "http://api.heitao.com/"

.field public static final ERROR_CUSTOM:I = -0x2710

.field public static final ERROR_LOGIN_CANCEL:I = -0x4e20

.field public static final ERROR_NOT_LOGIN:I = -0x2711

.field public static final ERROR_PAY_CANCEL:I = -0x7530

.field public static final ERROR_PAY_CONFIRMING:I = -0x7533

.field public static final ERROR_PAY_FAIL:I = -0x7532

.field public static final ERROR_PAY_INFO:I = -0x7531

.field public static final ERROR_REQUEST_FAILED:I = -0x2713

.field public static final ERROR_REQUEST_PARSE:I = -0x2712

.field public static HTPlatformSDK_DEBUG:Z = false

.field public static final HTPlatformSDK_TAG:Ljava/lang/String; = "HTPlatformSDK"

.field public static final HTPlatformSDK_VERSION:Ljava/lang/String; = "2.0.1"

.field public static final PAY_CLOSE_URL:Ljava/lang/String; = "http://pay.heitao.com/pay/finishclose"

.field public static final PAY_CONTROL_URL:Ljava/lang/String; = "http://pay.heitao.com/mpay/index"

.field public static final PAY_ORDER_URL:Ljava/lang/String; = "http://pay.heitao.com/mpay/order"

.field public static final PLATFORM_ID:Ljava/lang/String; = "22"

.field public static POLICY_URL:Ljava/lang/String; = null

.field public static final REQUEST_TIME_OUT:I = 0xa

.field public static final VERSION_CHECK_URL:Ljava/lang/String; = "http://api.heitao.com/app/init"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const/4 v0, 0x1

    sput-boolean v0, Lcom/heitao/platform/common/HTPConsts;->HTPlatformSDK_DEBUG:Z

    .line 52
    const-string v0, ""

    sput-object v0, Lcom/heitao/platform/common/HTPConsts;->POLICY_URL:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
