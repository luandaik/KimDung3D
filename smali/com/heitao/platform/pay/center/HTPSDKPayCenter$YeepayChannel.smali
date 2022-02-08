.class public final enum Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;
.super Ljava/lang/Enum;
.source "HTPSDKPayCenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/pay/center/HTPSDKPayCenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "YeepayChannel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CHA:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

.field public static final enum CHL:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

.field public static final enum CHU:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

.field private static final synthetic ENUM$VALUES:[Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

.field public static final enum none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 56
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    const-string v1, "none"

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    .line 57
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    const-string v1, "CHA"

    invoke-direct {v0, v1, v3}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHA:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    .line 58
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    const-string v1, "CHU"

    invoke-direct {v0, v1, v4}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHU:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    .line 59
    new-instance v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    const-string v1, "CHL"

    invoke-direct {v0, v1, v5}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHL:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    .line 54
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->none:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    aput-object v1, v0, v2

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHA:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    aput-object v1, v0, v3

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHU:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    aput-object v1, v0, v4

    sget-object v1, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->CHL:Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    aput-object v1, v0, v5

    sput-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->ENUM$VALUES:[Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    return-object v0
.end method

.method public static values()[Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;->ENUM$VALUES:[Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    array-length v1, v0

    new-array v2, v1, [Lcom/heitao/platform/pay/center/HTPSDKPayCenter$YeepayChannel;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
