.class public final enum Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;
.super Ljava/lang/Enum;
.source "HTPSDKPayCenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/pay/center/HTPSDKPayCenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PayChannel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum alipay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum heitao:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum mo9:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum smc:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum unionpay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum wapwx:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum weixin:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum wft:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

.field public static final enum yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 39
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "none"

    invoke-direct {v0, v1, v3}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 40
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "alipay"

    invoke-direct {v0, v1, v4}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->alipay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 41
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "unionpay"

    invoke-direct {v0, v1, v5}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->unionpay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 42
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "mo9"

    invoke-direct {v0, v1, v6}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->mo9:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 43
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "yeepay"

    invoke-direct {v0, v1, v7}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 44
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "weixin"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->weixin:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 45
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "heitao"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->heitao:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 46
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "smc"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->smc:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 47
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "wft"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wft:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 48
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    const-string v1, "wapwx"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wapwx:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    .line 37
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v1, v0, v3

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->alipay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v1, v0, v4

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->unionpay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v1, v0, v5

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->mo9:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v1, v0, v6

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->yeepay:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->weixin:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->heitao:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->smc:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wft:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->wapwx:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    aput-object v2, v0, v1

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ENUM$VALUES:[Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    return-object v0
.end method

.method public static values()[Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;->ENUM$VALUES:[Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    array-length v1, v0

    new-array v2, v1, [Lcom/heitao/platform/pay/center/HTPSDKPayCenter$PayChannel;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
