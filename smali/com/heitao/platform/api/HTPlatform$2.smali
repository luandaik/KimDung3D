.class Lcom/heitao/platform/api/HTPlatform$2;
.super Ljava/lang/Object;
.source "HTPlatform.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform;->openUserCenter()V
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
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$2;->this$0:Lcom/heitao/platform/api/HTPlatform;

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 205
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/heitao/platform/api/HTPlatform$2;->this$0:Lcom/heitao/platform/api/HTPlatform;

    invoke-static {v1}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/heitao/platform/activity/HTPUserCenterActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 206
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/heitao/platform/api/HTPlatform$2;->this$0:Lcom/heitao/platform/api/HTPlatform;

    invoke-static {v1}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 208
    return-void
.end method
