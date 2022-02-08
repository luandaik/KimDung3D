.class public final enum Lcom/heitao/common/HTResourcesHelper$HTResType;
.super Ljava/lang/Enum;
.source "HTResourcesHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/common/HTResourcesHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HTResType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/heitao/common/HTResourcesHelper$HTResType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/heitao/common/HTResourcesHelper$HTResType;

.field public static final enum Array:Lcom/heitao/common/HTResourcesHelper$HTResType;

.field public static final enum Color:Lcom/heitao/common/HTResourcesHelper$HTResType;

.field public static final enum Drawable:Lcom/heitao/common/HTResourcesHelper$HTResType;

.field public static final enum Id:Lcom/heitao/common/HTResourcesHelper$HTResType;

.field public static final enum Layout:Lcom/heitao/common/HTResourcesHelper$HTResType;

.field public static final enum String:Lcom/heitao/common/HTResourcesHelper$HTResType;

.field public static final enum Style:Lcom/heitao/common/HTResourcesHelper$HTResType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 9
    new-instance v0, Lcom/heitao/common/HTResourcesHelper$HTResType;

    const-string v1, "Drawable"

    invoke-direct {v0, v1, v3}, Lcom/heitao/common/HTResourcesHelper$HTResType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/common/HTResourcesHelper$HTResType;->Drawable:Lcom/heitao/common/HTResourcesHelper$HTResType;

    .line 10
    new-instance v0, Lcom/heitao/common/HTResourcesHelper$HTResType;

    const-string v1, "Layout"

    invoke-direct {v0, v1, v4}, Lcom/heitao/common/HTResourcesHelper$HTResType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/common/HTResourcesHelper$HTResType;->Layout:Lcom/heitao/common/HTResourcesHelper$HTResType;

    .line 11
    new-instance v0, Lcom/heitao/common/HTResourcesHelper$HTResType;

    const-string v1, "String"

    invoke-direct {v0, v1, v5}, Lcom/heitao/common/HTResourcesHelper$HTResType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/common/HTResourcesHelper$HTResType;->String:Lcom/heitao/common/HTResourcesHelper$HTResType;

    .line 12
    new-instance v0, Lcom/heitao/common/HTResourcesHelper$HTResType;

    const-string v1, "Style"

    invoke-direct {v0, v1, v6}, Lcom/heitao/common/HTResourcesHelper$HTResType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/common/HTResourcesHelper$HTResType;->Style:Lcom/heitao/common/HTResourcesHelper$HTResType;

    .line 13
    new-instance v0, Lcom/heitao/common/HTResourcesHelper$HTResType;

    const-string v1, "Id"

    invoke-direct {v0, v1, v7}, Lcom/heitao/common/HTResourcesHelper$HTResType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/common/HTResourcesHelper$HTResType;->Id:Lcom/heitao/common/HTResourcesHelper$HTResType;

    .line 14
    new-instance v0, Lcom/heitao/common/HTResourcesHelper$HTResType;

    const-string v1, "Color"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/heitao/common/HTResourcesHelper$HTResType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/common/HTResourcesHelper$HTResType;->Color:Lcom/heitao/common/HTResourcesHelper$HTResType;

    .line 15
    new-instance v0, Lcom/heitao/common/HTResourcesHelper$HTResType;

    const-string v1, "Array"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/heitao/common/HTResourcesHelper$HTResType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/heitao/common/HTResourcesHelper$HTResType;->Array:Lcom/heitao/common/HTResourcesHelper$HTResType;

    .line 7
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/heitao/common/HTResourcesHelper$HTResType;

    sget-object v1, Lcom/heitao/common/HTResourcesHelper$HTResType;->Drawable:Lcom/heitao/common/HTResourcesHelper$HTResType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/heitao/common/HTResourcesHelper$HTResType;->Layout:Lcom/heitao/common/HTResourcesHelper$HTResType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/heitao/common/HTResourcesHelper$HTResType;->String:Lcom/heitao/common/HTResourcesHelper$HTResType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/heitao/common/HTResourcesHelper$HTResType;->Style:Lcom/heitao/common/HTResourcesHelper$HTResType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/heitao/common/HTResourcesHelper$HTResType;->Id:Lcom/heitao/common/HTResourcesHelper$HTResType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/heitao/common/HTResourcesHelper$HTResType;->Color:Lcom/heitao/common/HTResourcesHelper$HTResType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/heitao/common/HTResourcesHelper$HTResType;->Array:Lcom/heitao/common/HTResourcesHelper$HTResType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/heitao/common/HTResourcesHelper$HTResType;->$VALUES:[Lcom/heitao/common/HTResourcesHelper$HTResType;

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
    .line 7
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/heitao/common/HTResourcesHelper$HTResType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 7
    const-class v0, Lcom/heitao/common/HTResourcesHelper$HTResType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/heitao/common/HTResourcesHelper$HTResType;

    return-object v0
.end method

.method public static values()[Lcom/heitao/common/HTResourcesHelper$HTResType;
    .locals 1

    .prologue
    .line 7
    sget-object v0, Lcom/heitao/common/HTResourcesHelper$HTResType;->$VALUES:[Lcom/heitao/common/HTResourcesHelper$HTResType;

    invoke-virtual {v0}, [Lcom/heitao/common/HTResourcesHelper$HTResType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/heitao/common/HTResourcesHelper$HTResType;

    return-object v0
.end method
