.class public final enum Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;
.super Ljava/lang/Enum;
.source "HTPUserCenterActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/activity/HTPUserCenterActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PAGE_CENTER"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum BASE_VIEW:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

.field public static final enum BINDE_NEW_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

.field public static final enum BIND_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

.field public static final enum CHANGE_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

.field private static final synthetic ENUM$VALUES:[Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

.field public static final enum FIND_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

.field public static final enum FORGET_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 42
    new-instance v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    const-string v1, "BASE_VIEW"

    invoke-direct {v0, v1, v3}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BASE_VIEW:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    new-instance v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    const-string v1, "CHANGE_PWD"

    invoke-direct {v0, v1, v4}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->CHANGE_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    new-instance v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    const-string v1, "FORGET_PWD"

    invoke-direct {v0, v1, v5}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FORGET_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    new-instance v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    const-string v1, "FIND_PWD"

    invoke-direct {v0, v1, v6}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FIND_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    new-instance v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    const-string v1, "BIND_PHONE"

    invoke-direct {v0, v1, v7}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BIND_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    new-instance v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    const-string v1, "BINDE_NEW_PHONE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BINDE_NEW_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    .line 41
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BASE_VIEW:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    aput-object v1, v0, v3

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->CHANGE_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    aput-object v1, v0, v4

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FORGET_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    aput-object v1, v0, v5

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->FIND_PWD:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    aput-object v1, v0, v6

    sget-object v1, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BIND_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->BINDE_NEW_PHONE:Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    aput-object v2, v0, v1

    sput-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ENUM$VALUES:[Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    return-object v0
.end method

.method public static values()[Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;->ENUM$VALUES:[Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    array-length v1, v0

    new-array v2, v1, [Lcom/heitao/platform/activity/HTPUserCenterActivity$PAGE_CENTER;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
