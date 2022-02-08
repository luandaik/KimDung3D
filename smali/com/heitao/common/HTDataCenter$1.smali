.class synthetic Lcom/heitao/common/HTDataCenter$1;
.super Ljava/lang/Object;
.source "HTDataCenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/common/HTDataCenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$heitao$common$HTDataCenter$HTMethod:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 52
    invoke-static {}, Lcom/heitao/common/HTDataCenter$HTMethod;->values()[Lcom/heitao/common/HTDataCenter$HTMethod;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/heitao/common/HTDataCenter$1;->$SwitchMap$com$heitao$common$HTDataCenter$HTMethod:[I

    :try_start_0
    sget-object v0, Lcom/heitao/common/HTDataCenter$1;->$SwitchMap$com$heitao$common$HTDataCenter$HTMethod:[I

    sget-object v1, Lcom/heitao/common/HTDataCenter$HTMethod;->Login:Lcom/heitao/common/HTDataCenter$HTMethod;

    invoke-virtual {v1}, Lcom/heitao/common/HTDataCenter$HTMethod;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
