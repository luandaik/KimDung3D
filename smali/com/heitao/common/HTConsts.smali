.class public Lcom/heitao/common/HTConsts;
.super Ljava/lang/Object;
.source "HTConsts.java"


# static fields
.field public static final BASE_URL:Ljava/lang/String; = "http://smi.heitao.com/"

.field public static final ERROR_CUSTOM:I = 0x20

.field public static final ERROR_NETWORK:I = 0x1f

.field public static final ERROR_PARSE:I = 0x1e

.field public static HTSDK_DEBUG:Z = false

.field public static final HTSDK_PLATFROM:Ljava/lang/String; = "android"

.field public static final HTSDK_TAG:Ljava/lang/String; = "HTGameProxySDK"

.field public static final HTSDK_VERSION:Ljava/lang/String; = "1.1.2"

.field public static final INIT_LABEL:Ljava/lang/String; = "init"

.field public static final KEY_APK_UPDATE_URL:Ljava/lang/String; = "updateurl"

.field public static final KEY_CUSTOM:Ljava/lang/String; = "sdk"

.field public static final KEY_CUSTOM_CHANNEL_ID:Ljava/lang/String; = "chid"

.field public static final KEY_DATA:Ljava/lang/String; = "data"

.field public static final KEY_ERROR_CODE:Ljava/lang/String; = "errno"

.field public static final KEY_ERROR_MESSAGE:Ljava/lang/String; = "errmsg"

.field public static final KEY_IS_ANTI_ADDITION:Ljava/lang/String; = "anti_addiction"

.field public static final KEY_IS_FORCE:Ljava/lang/String; = "isforce"

.field public static final KEY_JOIN_MODEL:Ljava/lang/String; = "ht_proxy_join_model"

.field public static final KEY_ORDER_NUMBER:Ljava/lang/String; = "orderno"

.field public static final KEY_SDK:Ljava/lang/String; = "sdk"

.field public static final KEY_SERVER_ID:Ljava/lang/String; = "sid"

.field public static final KEY_TITLE:Ljava/lang/String; = "title"

.field public static final KEY_UDID:Ljava/lang/String; = "udid"

.field public static final KEY_USER:Ljava/lang/String; = "user"

.field public static final LOGIN_CANCEL:I = 0xc

.field public static final LOGIN_COMPLETED:I = 0xa

.field public static final LOGIN_FAILED:I = 0xb

.field public static final LOGIN_LIMIT:I = 0x7531

.field public static final LOGIN_NEW_VERSION:I = 0x7532

.field public static final LOGIN_TOKEN_TIME_OUT:I = 0x7530

.field public static final PAY_CANCEL:I = 0x16

.field public static final PAY_CLOSED:I = 0x753a

.field public static final PAY_COMPLETED:I = 0x14

.field public static final PAY_DEBUG_MONEY:I = 0x1

.field public static final PAY_FAILED:I = 0x15

.field public static final PAY_WAITING:I = 0x17

.field public static final REQUEST_COMPLETED:I = 0x0

.field public static final REQUEST_TIME_OUT:I = 0xa

.field public static final SDK_INIT_AUTO_RETRY_MAX_COUNT:I = 0x3

.field public static final SDK_INIT_FAIL_BUTTON_TITLE:Ljava/lang/String; = "\u91cd\u8bd5"

.field public static final SDK_INIT_FAIL_MESSAGE:Ljava/lang/String; = "\u6e38\u620f\u521d\u59cb\u5316\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8fde\u63a5\u662f\u5426\u6b63\u5e38"

.field public static final SDK_INIT_FAIL_TITLE:Ljava/lang/String; = "\u63d0\u793a"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x0

    sput-boolean v0, Lcom/heitao/common/HTConsts;->HTSDK_DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
