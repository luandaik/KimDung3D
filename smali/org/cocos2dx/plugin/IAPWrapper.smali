.class public Lorg/cocos2dx/plugin/IAPWrapper;
.super Ljava/lang/Object;
.source "IAPWrapper.java"


# static fields
.field public static final ORDER_NO:Ljava/lang/String; = "orderNo"

.field public static final ORDER_TITLE:Ljava/lang/String; = "orderTitle"

.field public static final PARTY_NAME:Ljava/lang/String; = "partyName"

.field public static final PAYRESULT_CANCEL:I = 0x2

.field public static final PAYRESULT_FAIL:I = 0x1

.field public static final PAYRESULT_MSG:Ljava/lang/String; = "resultMsg"

.field public static final PAYRESULT_SUCCESS:I = 0x0

.field public static final PAYRESULT_TIMEOUT:I = 0x3

.field public static final PAY_DESCRIPTION:Ljava/lang/String; = "payDescription"

.field public static final PRODUCT_COUNT:Ljava/lang/String; = "productCount"

.field public static final PRODUCT_ID:Ljava/lang/String; = "productId"

.field public static final PRODUCT_NAME:Ljava/lang/String; = "productName"

.field public static final ROLE_ID:Ljava/lang/String; = "roleId"

.field public static final ROLE_LEVEL:Ljava/lang/String; = "roleLevel"

.field public static final ROLE_NAME:Ljava/lang/String; = "roleName"

.field public static final SERVER_ID:Ljava/lang/String; = "serverId"

.field public static final SERVER_NAME:Ljava/lang/String; = "serverName"

.field public static final TOTAL_PRICES:Ljava/lang/String; = "totalPrices"

.field public static final UNITPRICE:Ljava/lang/String; = "unitPrice"

.field public static final USER_BALANCE:Ljava/lang/String; = "userBalance"

.field public static final VIP_LEVEL:Ljava/lang/String; = "vipLevel"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/plugin/IAPWrapper;->nativeOnPayResult(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private static native nativeOnPayResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method public static onPayResult(Lorg/cocos2dx/plugin/InterfaceIAP;ILjava/lang/String;)V
    .locals 4
    .param p0, "obj"    # Lorg/cocos2dx/plugin/InterfaceIAP;
    .param p1, "ret"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 75
    move v2, p1

    .line 76
    .local v2, "curRet":I
    move-object v0, p2

    .line 77
    .local v0, "curMsg":Ljava/lang/String;
    move-object v1, p0

    .line 78
    .local v1, "curObj":Lorg/cocos2dx/plugin/InterfaceIAP;
    new-instance v3, Lorg/cocos2dx/plugin/IAPWrapper$1;

    invoke-direct {v3, v1, v2, v0}, Lorg/cocos2dx/plugin/IAPWrapper$1;-><init>(Lorg/cocos2dx/plugin/InterfaceIAP;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 86
    return-void
.end method
