.class public final enum Lcom/heitao/request/cache/HTRequestCache$HttpMode;
.super Ljava/lang/Enum;
.source "HTRequestCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/request/cache/HTRequestCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HttpMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/heitao/request/cache/HTRequestCache$HttpMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/heitao/request/cache/HTRequestCache$HttpMode;

.field public static final enum Get:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

.field public static final enum None:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

.field public static final enum Post:Lcom/heitao/request/cache/HTRequestCache$HttpMode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 10
    new-instance v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    const-string v1, "None"

    invoke-direct {v0, v1, v2}, Lcom/heitao/request/cache/HTRequestCache$HttpMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->None:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    new-instance v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    const-string v1, "Get"

    invoke-direct {v0, v1, v3}, Lcom/heitao/request/cache/HTRequestCache$HttpMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->Get:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    new-instance v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    const-string v1, "Post"

    invoke-direct {v0, v1, v4}, Lcom/heitao/request/cache/HTRequestCache$HttpMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->Post:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    sget-object v1, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->None:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->Get:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->Post:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    aput-object v1, v0, v4

    sput-object v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->$VALUES:[Lcom/heitao/request/cache/HTRequestCache$HttpMode;

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
    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/heitao/request/cache/HTRequestCache$HttpMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    return-object v0
.end method

.method public static values()[Lcom/heitao/request/cache/HTRequestCache$HttpMode;
    .locals 1

    .prologue
    .line 10
    sget-object v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->$VALUES:[Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    invoke-virtual {v0}, [Lcom/heitao/request/cache/HTRequestCache$HttpMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    return-object v0
.end method
