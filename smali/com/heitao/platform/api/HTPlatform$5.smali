.class Lcom/heitao/platform/api/HTPlatform$5;
.super Ljava/lang/Object;
.source "HTPlatform.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform;->removeFloatWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/api/HTPlatform;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$5;->this$0:Lcom/heitao/platform/api/HTPlatform;

    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 335
    invoke-static {}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->getInstance()Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->hideFloatWindow()V

    .line 336
    return-void
.end method
