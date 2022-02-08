.class Lcom/heitao/platform/api/HTPlatform$1;
.super Ljava/lang/Object;
.source "HTPlatform.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform;->doLogin(Lcom/heitao/platform/listener/HTPLoginListener;)V
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
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$1;->this$0:Lcom/heitao/platform/api/HTPlatform;

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 153
    const/4 v2, 0x0

    .line 155
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/heitao/platform/model/HTPDBUser;>;"
    :try_start_0
    invoke-static {}, Lcom/heitao/platform/common/HTPDBHelper;->getInstance()Lcom/heitao/platform/common/HTPDBHelper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/heitao/platform/common/HTPDBHelper;->query()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 159
    :goto_0
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 161
    :cond_0
    new-instance v1, Landroid/content/Intent;

    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$1;->this$0:Lcom/heitao/platform/api/HTPlatform;

    invoke-static {v3}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v3

    const-class v4, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 162
    .local v1, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$1;->this$0:Lcom/heitao/platform/api/HTPlatform;

    invoke-static {v3}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 168
    :goto_1
    return-void

    .line 156
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 157
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0

    .line 165
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    new-instance v1, Landroid/content/Intent;

    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$1;->this$0:Lcom/heitao/platform/api/HTPlatform;

    invoke-static {v3}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v3

    const-class v4, Lcom/heitao/platform/activity/HTPQuickLoginActivity;

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 166
    .restart local v1    # "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/heitao/platform/api/HTPlatform$1;->this$0:Lcom/heitao/platform/api/HTPlatform;

    invoke-static {v3}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_1
.end method
