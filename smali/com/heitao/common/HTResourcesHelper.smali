.class public Lcom/heitao/common/HTResourcesHelper;
.super Ljava/lang/Object;
.source "HTResourcesHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/common/HTResourcesHelper$1;,
        Lcom/heitao/common/HTResourcesHelper$HTResType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    return-void
.end method

.method public static getResourcesId(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/common/HTResourcesHelper$HTResType;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Lcom/heitao/common/HTResourcesHelper$HTResType;

    .prologue
    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p2}, Lcom/heitao/common/HTResourcesHelper;->getResourcesTypeString(Lcom/heitao/common/HTResourcesHelper$HTResType;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private static getResourcesTypeString(Lcom/heitao/common/HTResourcesHelper$HTResType;)Ljava/lang/String;
    .locals 3
    .param p0, "type"    # Lcom/heitao/common/HTResourcesHelper$HTResType;

    .prologue
    .line 25
    const/4 v0, 0x0

    .line 26
    .local v0, "ret":Ljava/lang/String;
    sget-object v1, Lcom/heitao/common/HTResourcesHelper$1;->$SwitchMap$com$heitao$common$HTResourcesHelper$HTResType:[I

    invoke-virtual {p0}, Lcom/heitao/common/HTResourcesHelper$HTResType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 38
    :goto_0
    return-object v0

    .line 28
    :pswitch_0
    const-string v0, "drawable"

    goto :goto_0

    .line 29
    :pswitch_1
    const-string v0, "layout"

    goto :goto_0

    .line 30
    :pswitch_2
    const-string v0, "string"

    goto :goto_0

    .line 31
    :pswitch_3
    const-string v0, "style"

    goto :goto_0

    .line 32
    :pswitch_4
    const-string v0, "id"

    goto :goto_0

    .line 33
    :pswitch_5
    const-string v0, "color"

    goto :goto_0

    .line 34
    :pswitch_6
    const-string v0, "array"

    goto :goto_0

    .line 26
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
