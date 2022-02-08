.class public final enum Lcom/heitao/model/HTGameInfo$HTDirection;
.super Ljava/lang/Enum;
.source "HTGameInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/model/HTGameInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HTDirection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/heitao/model/HTGameInfo$HTDirection;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/heitao/model/HTGameInfo$HTDirection;

.field public static final enum Landscape:Lcom/heitao/model/HTGameInfo$HTDirection;

.field public static final enum Portrait:Lcom/heitao/model/HTGameInfo$HTDirection;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 10
    new-instance v0, Lcom/heitao/model/HTGameInfo$HTDirection;

    const-string v1, "Landscape"

    invoke-direct {v0, v1, v2}, Lcom/heitao/model/HTGameInfo$HTDirection;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/model/HTGameInfo$HTDirection;->Landscape:Lcom/heitao/model/HTGameInfo$HTDirection;

    .line 11
    new-instance v0, Lcom/heitao/model/HTGameInfo$HTDirection;

    const-string v1, "Portrait"

    invoke-direct {v0, v1, v3}, Lcom/heitao/model/HTGameInfo$HTDirection;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/model/HTGameInfo$HTDirection;->Portrait:Lcom/heitao/model/HTGameInfo$HTDirection;

    .line 8
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/heitao/model/HTGameInfo$HTDirection;

    sget-object v1, Lcom/heitao/model/HTGameInfo$HTDirection;->Landscape:Lcom/heitao/model/HTGameInfo$HTDirection;

    aput-object v1, v0, v2

    sget-object v1, Lcom/heitao/model/HTGameInfo$HTDirection;->Portrait:Lcom/heitao/model/HTGameInfo$HTDirection;

    aput-object v1, v0, v3

    sput-object v0, Lcom/heitao/model/HTGameInfo$HTDirection;->$VALUES:[Lcom/heitao/model/HTGameInfo$HTDirection;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/heitao/model/HTGameInfo$HTDirection;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/heitao/model/HTGameInfo$HTDirection;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/heitao/model/HTGameInfo$HTDirection;

    return-object v0
.end method

.method public static values()[Lcom/heitao/model/HTGameInfo$HTDirection;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/heitao/model/HTGameInfo$HTDirection;->$VALUES:[Lcom/heitao/model/HTGameInfo$HTDirection;

    invoke-virtual {v0}, [Lcom/heitao/model/HTGameInfo$HTDirection;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/heitao/model/HTGameInfo$HTDirection;

    return-object v0
.end method
