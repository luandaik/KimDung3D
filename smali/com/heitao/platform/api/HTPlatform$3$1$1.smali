.class Lcom/heitao/platform/api/HTPlatform$3$1$1;
.super Ljava/lang/Object;
.source "HTPlatform.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform$3$1;->onFailed(Lcom/heitao/platform/model/HTPError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/heitao/platform/api/HTPlatform$3$1;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform$3$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$3$1$1;->this$2:Lcom/heitao/platform/api/HTPlatform$3$1;

    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 274
    const-string v0, "\u7f51\u7edc\u5f02\u5e38\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u91cd\u8bd5"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->doShowToast(Ljava/lang/String;)V

    .line 275
    return-void
.end method
