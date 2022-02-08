.class public final enum Lcom/heitao/common/HTDataCenter$HTMethod;
.super Ljava/lang/Enum;
.source "HTDataCenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/common/HTDataCenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HTMethod"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/heitao/common/HTDataCenter$HTMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/heitao/common/HTDataCenter$HTMethod;

.field public static final enum Login:Lcom/heitao/common/HTDataCenter$HTMethod;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 14
    new-instance v0, Lcom/heitao/common/HTDataCenter$HTMethod;

    const-string v1, "Login"

    invoke-direct {v0, v1, v2}, Lcom/heitao/common/HTDataCenter$HTMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/common/HTDataCenter$HTMethod;->Login:Lcom/heitao/common/HTDataCenter$HTMethod;

    .line 12
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/heitao/common/HTDataCenter$HTMethod;

    sget-object v1, Lcom/heitao/common/HTDataCenter$HTMethod;->Login:Lcom/heitao/common/HTDataCenter$HTMethod;

    aput-object v1, v0, v2

    sput-object v0, Lcom/heitao/common/HTDataCenter$HTMethod;->$VALUES:[Lcom/heitao/common/HTDataCenter$HTMethod;

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
    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/heitao/common/HTDataCenter$HTMethod;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 12
    const-class v0, Lcom/heitao/common/HTDataCenter$HTMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/heitao/common/HTDataCenter$HTMethod;

    return-object v0
.end method

.method public static values()[Lcom/heitao/common/HTDataCenter$HTMethod;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/heitao/common/HTDataCenter$HTMethod;->$VALUES:[Lcom/heitao/common/HTDataCenter$HTMethod;

    invoke-virtual {v0}, [Lcom/heitao/common/HTDataCenter$HTMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/heitao/common/HTDataCenter$HTMethod;

    return-object v0
.end method
